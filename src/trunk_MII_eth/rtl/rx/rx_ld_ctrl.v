// File:    rxldctrl.v
// Author:  Tao Wu
// Date:    2015/1/14

// main control of all deskew buffer of lanes to be deskewed
// Control the read start of all deskew buffer
// Control the reset of all deskew buffer when flow occurs
// Monitor the deskew error using dedicated FSM as suggested by 802.3
//  FSM is called "PCS deskew state diagram" in P248 of 802.3

`ifndef DELAY
    `define DELAY #0.1
`endif

`define LOSS_OF_ALIGNMENT   2'b00
`define ALIGN_DETECT        2'b01
`define ALIGN_ACQUIRED      2'b10
`define ALIGN_VERIFY        2'b11
//`define ALIGN_DETECT_1      3'b001
//`define ALIGN_DETECT_2      3'b010    
//`define ALIGN_DETECT_3      3'b011
//`define ALIGN_ACQUIRED_1    3'b100
//`define ALIGN_ACQUIRED_2    3'b101
//`define ALIGN_ACQUIRED_3    3'b110
//`define ALIGN_ACQUIRED_4    3'b111


module RXLDCTRL  #(
    parameter   LNUM    = 4)
(
    input                   i_rst_n                 ,   //system reset
    input                   i_clk                   ,   // uniform clock
    
    input   [LNUM-1:0]      i_wr_half_full_reg      ,   //deskew buffer write enabled
    input   [LNUM-1:0]      i_am_locked             ,   //am locked
    input   [LNUM-1:0]      i_is_am                 ,   //read out data is a pattern
    input   [LNUM-1:0]      i_flow                  ,   //deskew buffer overflow    
    input   [LNUM-1:0]      i_lden                  ,   //The lane deskew enable of each channel, 
    input   [7:0]           i_align_det_thres       ,   //how many align marker match count as align detected
    input   [7:0]           i_align_los_thres       ,   //how many align marker error count as align loss
                                                        //disabled channel are always treated as match  
    output                  o_rd_en                 ,   // to all lanes
    output                  o_rst_all_n             ,   // reset all deskew bufs
    output                  o_align_acqr            ,
    output                  o_am_match_err          ,
    output  [1:0]           o_rxld_fsm          
);
    reg         r_rd_en;

    reg [3:0]   r_rst_cnt;

    reg         r_rst_all_n;        //internal reset for wr rd signal and all deskew buffer
    
    wire        c_any_flow;
    
    //reset signal logic, low active
    reg         r_rst_lane_n;           //assert and keep N clocks if any lane is over flow
    wire        c_rst_lock_n;           //assert if any lane is un-locked
    reg         r_rst_fsm_n;            //assert as fsm required
    
    //deskew_err: output of lanes partly match, not all match or all dismatch
    //match_all: output of lanes all match
    wire        c_am_match_all;     //all read data match am
    wire        c_am_match_none;    //all read data not am
    wire        c_am_match_err;     //part read data match, part not
        
    reg  [1:0]  r_align_state;   
    reg  [1:0]  r_align_state_next;
    
    reg  [LNUM-1:0]     r_lden;
    wire                c_rst_lden_n;

    reg         r_align_acqr;

    reg [7:0]   r_align_det_cnt;
    reg [7:0]   r_align_los_cnt;
    
    
    //20150409-twu: detect lane enable change
    always @ (posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) 
            r_lden <= `DELAY {LNUM{1'b0}};
        else
            r_lden <= i_lden;
    end
    //generate reset whenever lden is changed
    assign c_rst_lden_n = (i_lden == r_lden);
    
    // any lane that is enabled flow, will set c_any_flow to high
    
    assign      c_any_flow = | (i_flow & i_lden);
    
    // 5 clocks is required from Flow->'1' to Reset Done
    //   Flow->'1' to uReset: 1 clock
    //   uReset to rReset: 4 clock
    //   rReset to rFull: 0 clock
    //   rFull to uFull: 4 clock
    //   uFull to uFlow: 0 clock
    // so the length between 2 uReset must > 9 to prevernt dead-lock
    // here we keep uReset low for 15 clock cycles

    //r_rst_cnt
    always @ (posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            r_rst_cnt <= `DELAY  4'h0;
        end
        else if(r_rst_cnt == 4'h0) begin
            r_rst_cnt[0] <= `DELAY  (c_any_flow);
        end
        else begin
            r_rst_cnt[3:0] <= `DELAY  r_rst_cnt[3:0] + 4'h1;
        end
    end

    //                 __    __    __    __    __    __    __    __    __    __    __    __
    // i_UniformClk __|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__ 
    //                   0     1     2     3     4     5     6     7     0     
    //                   _____        _____          _____                          _____
    // c_any_flow  _____|     |______|     |________|     |________________________|     |________
    // 
    //             __________                                                  __________
    // r_rst_lane_n          |________________________________________________|          |_______
    //
    //
    always @ (posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            r_rst_lane_n <= `DELAY 1'b0;
        end
        else if( (r_rst_cnt == 4'h0) & c_any_flow ) begin
            r_rst_lane_n <= `DELAY 1'b0;
        end 
        else if( (r_rst_cnt == 4'h0) & (~c_any_flow) ) begin
            r_rst_lane_n <= `DELAY 1'b1;
        end
    end
    
    //r_rst_all_n
    //Following case will cause reset to all deskew buffers
    //1. system reset
    //2. deskew buffer of any lanes overflow
    //4. deskew FSM required reset
    assign  c_rst_lock_n = & (i_am_locked | ~i_lden);  // any bit '0' -> reset
    
    always @ (posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            r_rst_all_n <= `DELAY 1'b0;
        end
        else begin
            //all reset are synchronized signal of i_Clk, so just assign in this clock domain
            r_rst_all_n <= `DELAY r_rst_lane_n & c_rst_lock_n & r_rst_fsm_n & c_rst_lden_n; 
        end
    end
    assign o_rst_all_n = r_rst_all_n;
                    
    //o_rd_en
    //on all lanes, read start at the same time, after all write started and fifo get enough data
    //assign r_rd_en = (i_wr_half_full_reg | ~i_lden);
    always @ (posedge i_clk or negedge r_rst_all_n) begin
        if(~r_rst_all_n) begin
            r_rd_en <= `DELAY 1'b0;
        end
        else begin
            //generated rd_en are also used as output data_valid, so generated as 1 0 1 0 pattern
            if( & (i_wr_half_full_reg | ~i_lden) ) 
                r_rd_en <= `DELAY 1'b1;
        end    
    end
    assign o_rd_en = r_rd_en;
    
    //match status
    assign c_am_match_all = r_rd_en & ( & (i_is_am | ~i_lden) );              //all read data match pattern, only valid if read is enable
    assign c_am_match_none = r_rd_en & ( ! ( | (i_is_am & i_lden) ));         //all read data not pattern, only valid if read is enable
    assign c_am_match_err = r_rd_en & (! (c_am_match_all | c_am_match_none));  //part read data match, part not
    assign o_am_match_err = c_am_match_err;
    
    //Main deskew FSM
    
    //r_align_state_next
    always @ ( * ) begin
        r_align_state_next = r_align_state;
        case(r_align_state)
            `LOSS_OF_ALIGNMENT: begin
                if(c_am_match_all)
                    r_align_state_next = `ALIGN_DETECT;
                else
                    r_align_state_next = `LOSS_OF_ALIGNMENT;
            end
            `ALIGN_DETECT: begin
                if((c_am_match_all) && (r_align_det_cnt == i_align_det_thres))
                    r_align_state_next = `ALIGN_ACQUIRED;
                //should continuesly match some count of |A|, any mismatch is
                //fail
                else if(c_am_match_err)
                    r_align_state_next = `LOSS_OF_ALIGNMENT;
                else
                    r_align_state_next = `ALIGN_DETECT;          
            end   
            `ALIGN_ACQUIRED: begin
                if(c_am_match_err)
                    r_align_state_next = `ALIGN_VERIFY;
                else
                    r_align_state_next = `ALIGN_ACQUIRED;
            end 
            `ALIGN_VERIFY: begin
                if((c_am_match_all) && (r_align_los_cnt == 8'd0))
                    r_align_state_next = `ALIGN_ACQUIRED;
                else if((c_am_match_err) && (r_align_los_cnt == i_align_los_thres))
                    r_align_state_next = `LOSS_OF_ALIGNMENT;
                else
                    r_align_state_next = `ALIGN_VERIFY;
            end 
            // default:
                // r_align_state_next = `LOSS_OF_ALIGNMENT;
        endcase 
    end
    
    //r_align_state
    always @ (posedge i_clk or negedge r_rst_all_n) begin
        if(~r_rst_all_n) begin
            r_align_state <= `DELAY `LOSS_OF_ALIGNMENT;  
        end
        else begin        
            r_align_state <= `DELAY r_align_state_next;
        end
    end
    
    //align marker match and los count
    always@(posedge i_clk or negedge r_rst_all_n) begin
        if (~r_rst_all_n) begin
            r_align_det_cnt <= `DELAY 8'd0;
        end
        else begin
            if(r_align_state == `ALIGN_DETECT) begin
                if(c_am_match_all)
                    r_align_det_cnt <= `DELAY r_align_det_cnt + 8'd1;
            end
            else
                r_align_det_cnt <= `DELAY 8'd0;
        end
    end
    always@(posedge i_clk or negedge r_rst_all_n) begin
        if (~r_rst_all_n) begin
            r_align_los_cnt <= `DELAY 8'd0;
        end
        else begin
            if(r_align_state == `ALIGN_VERIFY) begin
                if(c_am_match_err)
                    r_align_los_cnt <= `DELAY r_align_los_cnt + 8'd1;
                else if(c_am_match_all)
                    r_align_los_cnt <= `DELAY r_align_los_cnt - 8'd1;
            end
            else
                r_align_los_cnt <= `DELAY 8'd0;
        end
    end

    //r_rst_fsm_n
    // r_rst_fsm_n '0' -> r_rst_all_n '0' -> r_rst_fsm_n '1' -> r_rst_all_n '?'
    always @ (posedge i_clk or negedge r_rst_all_n) begin
        if(~r_rst_all_n) begin
            //default not reset, otherwise will generate reset loop
            r_rst_fsm_n <= `DELAY 1'b1;     
        end
        else begin    
            // fsm issue reset only when
            // 1. jump from acquired to LOSS of alignment
            // 2. match_err and in loss of alignment (fifo already start to read)
            // both can be covered by c_am_match_err
            if ((r_align_state == `LOSS_OF_ALIGNMENT) && c_am_match_err)
                r_rst_fsm_n <= `DELAY 1'b0;
            else
                r_rst_fsm_n <= `DELAY 1'b1;
        end
    end
 
    //o_align_acqr
     always @ (posedge i_clk or negedge r_rst_all_n) begin
        if(~r_rst_all_n) begin
            r_align_acqr <= `DELAY 1'b0;
        end
        else begin        
            case(r_align_state_next)
                `ALIGN_ACQUIRED,
                `ALIGN_VERIFY :
                    r_align_acqr <= `DELAY 1'b1;
                default:    
                    r_align_acqr <= `DELAY 1'b0;
            endcase
        end
    end
    assign o_align_acqr = r_align_acqr;
    
    assign o_rxld_fsm = r_align_state;
    
endmodule
