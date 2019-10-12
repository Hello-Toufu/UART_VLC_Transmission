// File:    rxldbuf.v
// Author:  Tao Wu
// Date:    2015/1/14

// This module is used to sync data from the channel PMA receive clock domain to
//  the uniform clock domain and perform lane deskew
// 1. FIFO is written with received data at each input clock
// 2. FIFO wait until "half full" threshold is arrived
// 3. Data read out at each output clock
// 4. Whenever underflow or overflow, tell the controller to reset all FIFOs

// If write when FIFO is full, means overflow.
// If read when FIFO is empty, means underflow.
// When FIFO overflow or underflow, data will be missing or invalid data is insert
//  in this case, we should tell main controller to reset all buffers.

// The main deskew buffer of one channel, use asynchronous FIFO
// On start: read Pointer and write pointer all reset to 0, and both stopped
// Write Pointer start and increase each clock after detecting a match data
// Read pointer will wait until control FSM issue the Start

//Control FSM will issue start only when
// all lanes fifo begin to write and got enough data for read

// Signal Name Rule:
//          i/o/r/c_r/u_xxxx_n/ms
//          i/o/r/c: input/output/register/combination
//          r/u: signal is in RecClk or UniformClk domain
//          ms: metastable signal, to be registered
//

`ifndef DELAY
    `define DELAY #0.1
`endif

module RXLDBUF #(
    parameter   DATA_WIDTH       = 9     ,
    parameter   ADD_WIDTH        = 4      //,       //add width: minimum 4, optimize 5
    //parameter   HALF_THRES       = 7        
    )
(
    input                       i_rec_clk               ,
    input                       i_uniform_clk           ,
                                                          
    input                       i_u_unif_rst_n          , // reset of UniformClk domain, generated from uniform controller
    
    input   [DATA_WIDTH-1:0]    i_r_wr_data             , 
    input                       i_r_wr_data_valid       , // switch high low in the other clock cycle, except the 33rd cycle
    input                       i_r_wr_data_isam        , // is am only assert after am is locked, so am_lock is not required here
    input   [ADD_WIDTH-1:0]     i_r_half_thres          , // half-full threshold
    
    output  [DATA_WIDTH-1:0]    o_u_rd_data             , 
    output                      o_u_rd_data_valid       , // switch high low in the other clock cycle
    output                      o_u_rd_data_isam        , 
    input                       i_u_rd_en               , // from the control FSM
    
    //fifo write started and got enough data for read, can start write, 
    // keep high even fifo run below the threshold, only deassert on reset
    output                      o_u_wr_half_full_reg    ,  // generate from rec clock domain, synced to uniform clock domain 
        
    output                      o_u_flow                ,
    output                      o_r_fifo_full           ,
    output                      o_u_fifo_empty          ,

    output                      o_r_overflow            ,    
    output                      o_u_underflow           ,

    output [ADD_WIDTH-1:0]      o_r_wr_cnt              ,
    input                       i_u_lden                        //20150409-twu add ld en to 
);

    localparam   DEPTH = 1<<ADD_WIDTH;
    wire                        r_r_unif_rst_n;
    wire                        c_r_fifo_full;
    wire                        c_u_fifo_empty;

    wire                        c_u_rd_en;            // read enable of UniformClk domain
    reg                         r_u_rd_en;            // registered read enable 
    reg   [ADD_WIDTH-1:0]       r_r_wr_cnt;           //used to count the write words after reset, so we can know when it is half full
    reg                         r_r_wr_half_full_reg;
    
    wire                        c_r_overflow;
    wire                        c_u_underflow;
    wire                        c_u_overflow;   // c_r_overflow in uniform clock domain
    
    reg                         r_r_got_am;
    wire                        c_r_wr_en;
    wire    [DATA_WIDTH:0]      c_r_wdata;
    wire    [DATA_WIDTH:0]      c_u_rdata;
    reg    [DATA_WIDTH:0]       r_u_rdata;
    wire                        c_r_lden;
    
    assign c_r_wdata = {i_r_wr_data_isam, i_r_wr_data};
    
    // generate fifo write side reset
    // To avoid partly reset, only reset signal of UniformClk domain is take from port
    //  the reset signal of RecClk domain is generated from it.
    // So the buffer read side will release 2 clock earlier than write side, but it will be OK
    RESETSYNC2 m_pcs_gen_rst_sync (
        .sync_rst_N     (r_r_unif_rst_n),
        .clk            (i_rec_clk),
        .async_rst_N    (i_u_unif_rst_n));        
    
    //can not use r_r_unif_rst_n to reset lden to avoid it stop writing am
    //into fifo
    //DFF m_dff_lden( .i_iSig(i_u_lden), .i_aOReset_N(r_r_unif_rst_n), .i_OClk(i_rec_clk), .o_oSig(c_r_lden) ); 
    DFF_ m_dff_lden( .i_iSig(i_u_lden), .i_aOReset_N(1'b1), .i_OClk(i_rec_clk), .o_oSig(c_r_lden) ); 
    
    //c_r_wr_en
    // fifo write is enabled when
    // 1. am is detected
    // 2. data is valid
    // 3. not in reset state
    // 4. this lane is enabled //20150409-twu
    assign c_r_wr_en = (r_r_got_am || i_r_wr_data_isam) && i_r_wr_data_valid && c_r_lden;
    
    //r_r_got_am
    // record whether am is detected, keep assert until reset
    always@(posedge i_rec_clk or negedge r_r_unif_rst_n) begin
        if(~r_r_unif_rst_n)
            r_r_got_am <= `DELAY 1'b0;
        else if(i_r_wr_data_valid && i_r_wr_data_isam)
            r_r_got_am <= `DELAY 1'b1;
    end
    
    //c_u_rd_en
    //only read when lane is enabled
    assign c_u_rd_en = i_u_rd_en && i_u_lden; 
    
    //Here we treat write on FIFO full and read on FIFO empty as overflow and underflow
    assign c_r_overflow = c_r_wr_en && c_r_fifo_full;
    assign c_u_underflow = c_u_rd_en && c_u_fifo_empty;

    // DFF4 m_dff( .i_iSig(c_r_overflow), .i_aOReset_N(i_u_unif_rst_n), .i_OClk(i_uniform_clk), .o_oSig(c_u_overflow) ) ;
    
    //20150407-twu: change to pulse sync for overflow signal to avoid lost during clock cross
    PulseSync m_pulsesync(.i_aIReset_N(r_r_unif_rst_n), .i_IClk(i_rec_clk), .i_iSig(c_r_overflow), .i_aOReset_N(i_u_unif_rst_n), .i_OClk(i_uniform_clk), .o_oSigPulse(c_u_overflow) ) ;

    assign o_u_flow = c_u_overflow | c_u_underflow;
    assign o_r_overflow = c_r_overflow;
    assign o_u_underflow = c_u_underflow;
    
    
    // r_r_wr_cnt
    // counter +1 every clock after reset
    // because FIFO write is always enable, and read is disabled after reset
    // so the counter value is the actual data count in FIFO before read start
    // after read start, this value is useless
    always @ (posedge i_rec_clk or negedge r_r_unif_rst_n) begin
        if(~r_r_unif_rst_n) begin
            r_r_wr_cnt <= `DELAY {ADD_WIDTH{1'b0}};
        end
        else if(c_r_wr_en) begin
            r_r_wr_cnt <= `DELAY r_r_wr_cnt + {{(ADD_WIDTH-1){1'b0}},1'b1};
        end
    end
    assign o_r_wr_cnt = r_r_wr_cnt;

    //after reset: read disabled
    //FIFO is half full: read enable, and keep reading
    //This signal is generated in RecClk domain, and used in
    // UniformClk domain, so DFF is used
    //r_r_wr_half_full_reg
    always @ (posedge i_rec_clk or negedge r_r_unif_rst_n) begin
        if(~r_r_unif_rst_n) begin
            r_r_wr_half_full_reg <= `DELAY 1'b0;
        end
        else begin
            // r_r_wr_half_full_reg assert 1 clock delayed of real fifo status
            // it takes at 3 - 4 UniformClk to transfer read enable signal from RecClk domain to UniformClk domain,
            // it takes 1 uniform clock for all lane wr_en difference
            // so the FIFO half full signal should be generated 5 clock earlier.
            //if(c_r_wr_en && (r_r_wr_cnt == HALF_THRES-5))  begin
            if(c_r_wr_en && (r_r_wr_cnt == i_r_half_thres))  begin
                r_r_wr_half_full_reg <= `DELAY 1'b1;
            end
        end
    end
    DFF_ m_dff4_half_full_reg( .i_iSig(r_r_wr_half_full_reg), .i_aOReset_N(i_u_unif_rst_n), .i_OClk(i_uniform_clk), .o_oSig(o_u_wr_half_full_reg) ); 
    
    //20150515-twu add register at fifo output to optimize timing
    always@(posedge i_uniform_clk or negedge i_u_unif_rst_n) begin
        if(~i_u_unif_rst_n) begin
            r_u_rd_en <= `DELAY 1'b0;
            r_u_rdata <= `DELAY {(DATA_WIDTH+1){1'b0}};
        end
        else begin
            r_u_rd_en <= `DELAY c_u_rd_en;
            r_u_rdata <= `DELAY c_u_rdata;
        end
    end
    
    //output data
    assign o_u_rd_data = r_u_rdata[DATA_WIDTH-1:0];
    assign o_u_rd_data_isam = r_u_rdata[DATA_WIDTH];
    //output valid is controlled by the main deskew control FSM to ensure all lanes output valid synced
    assign o_u_rd_data_valid = r_u_rd_en;

    //fifo instance
    ASYNCFIFOGA #(.DSIZE(DATA_WIDTH+1), .ASIZE(ADD_WIDTH)) m_asyncfifo (
        .wrst_n (r_r_unif_rst_n),
        .wclk   (i_rec_clk),
        .winc   (c_r_wr_en),
        .wdata  (c_r_wdata),
        .wfull  (c_r_fifo_full),      
        .rrst_n (i_u_unif_rst_n),
        .rclk   (i_uniform_clk),
        .rinc   (c_u_rd_en),
        .rdata  (c_u_rdata),
        .rempty (c_u_fifo_empty)); 

    assign o_r_fifo_full     = c_r_fifo_full;
    assign o_u_fifo_empty    = c_u_fifo_empty;
    
endmodule
