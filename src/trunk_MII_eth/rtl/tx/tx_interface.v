// File               : tx_interface.v
// Author             : Tao Wu
// Created On         : 2017-06-22 15:29
// Last Modified      : 2017-07-05 09:53
// Description        : 
//  Insert the frame length indication to packet
//  Flow control of the read out from the GMAC MTL RX interface
//  Preserve the space for rs encoder checksum
//  Fill all invalid data with '00' to align data with rs block (these data will also be rs encode)
//
//  in x1 mode, only the o_data[7:0] output data
// 20191011 only x1 mode is considered
                        
module TX_INTERFACE#(
    parameter           RS_N = `RS_N
    ,parameter          RS_K = `RS_K
)(
    input               i_clk
    ,input              i_rst_n

    //from GMAC MTL
    ,input              i_ari_val       
    ,input              i_ari_sof       
    ,input              i_ari_eof       
    ,input  [1:0]       i_ari_be        
    ,input  [31:0]       i_ari_data      
    ,output             o_ari_ack       
    ,input  [14:0]      i_ari_frame_len
    ,input              i_ari_frame_len_val

    //to tx rs enc
    ,output             o_sof               //assert with the first data of frame 
    ,output  [7:0]		o_data
    ,output             o_rs_data_symbol    //assert on the data symbol cycles 
    ,output             o_rs_check_symbol   //assert on the check symbol cycles
    //if none of o_rs_data_symbol or o_rs_check_symbol is asserted, means no
        //data to be sent
        //
    //control
    ,input              i_x1_mode
);
    
    localparam  RS_R = RS_N - RS_K + 5'd7; //20190505 ZDF parent module will deal the problem of length of o_rs_check_symbol
    localparam  RS_CNT_W = 10;

    localparam  IDLE            = 3'd0,
                SOF             = 3'd1,
                FRAME_LEN       = 3'd2,
                DATA_SYMBOL     = 3'd3,
                DUMMY_DATA      = 3'd4,
                CHECK_SYMBOL    = 3'd5;

    reg [2:0]           r_state;
    reg [2:0]           c_state_next;

    reg [RS_CNT_W-1:0]  r_rs_block_cnt;
    reg     [14:0]      r_cur_frame_len;

    reg     [7:0]      c_data_in;
    
    //reg                 r_ari_ack;
    reg                 r_sof               ;
    reg  [31:0]         r_data_x4              ;
    reg  [7:0]          r_data_x1           ;
    reg                 r_rs_data_symbol    ;
    reg                 r_rs_check_symbol   ;

    reg     [1:0]       r_x1_byte_sel;

    //indicate the received [31:0] data is sent
    wire                c_word_sent;        

    //c_word_sent will be 1 always in x4 mode
    //will be 1 when r_x1_byte_sel is 3 in x1 mode
    //assign c_word_sent = i_x1_mode ? (r_x1_byte_sel==2'd3) : 1'b1;

//================================================================================
//Function  : main FSM
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_state <= `DELAY IDLE;
        end
        else begin
            r_state <= `DELAY c_state_next;
        end
    end

    always@( * ) begin
        c_state_next = r_state;
        case(r_state)
            IDLE          : begin
                //wait only the beginning of the packet to start
                //move only the frame len is avaiable
                if(i_ari_val && i_ari_sof && i_ari_frame_len_val) begin
                    c_state_next = SOF;
                end
                else
                    c_state_next = IDLE;
            end
            SOF           : begin
                if (1'b1)
                // if (c_word_sent)
                    c_state_next = FRAME_LEN;
                else 
                    c_state_next = SOF; 
            end
            FRAME_LEN     : begin
                if ((r_x1_byte_sel == 2'd1))
                    c_state_next = DATA_SYMBOL;
                else
                    c_state_next = FRAME_LEN;
            end
            DATA_SYMBOL   : begin
                if (1'b1) begin
                //if (c_word_sent) begin
                    if(r_rs_block_cnt == RS_K-1)
                        c_state_next = CHECK_SYMBOL;
                    else begin
                        if(i_ari_eof)
                            c_state_next = DUMMY_DATA;
                        else 
                            c_state_next = DATA_SYMBOL; 
                    end
                end
                else
                    c_state_next = DATA_SYMBOL; 
            end
            DUMMY_DATA: begin
                if(r_rs_block_cnt == RS_K-1)
                    c_state_next = CHECK_SYMBOL;
                else
                    c_state_next = DUMMY_DATA;
            end
            CHECK_SYMBOL  : begin
                if(r_rs_block_cnt == RS_R-1) begin
                    //if there is data on line continue to receive data,
                    //otherwise return to idle to send idle
                    //if the next data is sof, receive sof first
                    if(i_ari_val) begin
                        if(i_ari_sof) begin
                            //a new packet is ready
                            if(i_ari_frame_len_val)
                                c_state_next = SOF;
                            else
                                //return to IDLE to wait frame len
                                c_state_next = IDLE;
                        end
                        else
                            //the remain data of the previous packet
                            c_state_next = DATA_SYMBOL; 
                    end
                    else
                        c_state_next = IDLE;
                end
                else
                    c_state_next = CHECK_SYMBOL; 
            end
        endcase
    end


//================================================================================
//Function  : save the input data
//================================================================================
    //  register the data, set all invalid field with '0'
    always@( * ) begin
        if(i_ari_val) begin
            // if(i_ari_eof) begin
                // case(i_ari_be[1:0])
                    // 2'd0:    c_data_in <= `DELAY {24'h0, i_ari_data[7:0]};
                    // 2'd1:    c_data_in <= `DELAY {16'h0, i_ari_data[15:0]};
                    // 2'd2:    c_data_in <= `DELAY {8'h0, i_ari_data[23:0]};
                    // default: c_data_in <= `DELAY i_ari_data[31:0];
                // endcase
            // end
            // else
                c_data_in <= `DELAY i_ari_data[7:0]; 
        end
        else
            c_data_in <= `DELAY 8'h0;
    end

    // save the input frame len once on sof
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_cur_frame_len <= `DELAY 15'h0;
        end
        else begin
            if(r_state == SOF)
                r_cur_frame_len <= `DELAY i_ari_frame_len;
        end
    end

//================================================================================
//Function  : internal variables
//================================================================================
    //count the rs block
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
        end
        else begin
            if(r_state == IDLE)
                r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
            else if( (r_state == SOF) || (r_state == FRAME_LEN) || 
                (r_state == DATA_SYMBOL) || (r_state==DUMMY_DATA)) begin
                if(r_rs_block_cnt == RS_K-1)
                    r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
                else
                    r_rs_block_cnt <= `DELAY r_rs_block_cnt + {{(RS_CNT_W-1){1'b0}}, 1'b1};
            end
            else if (r_state == CHECK_SYMBOL) begin
                if(r_rs_block_cnt == RS_R-1)
                    r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
                else
                    r_rs_block_cnt <= `DELAY r_rs_block_cnt + {{(RS_CNT_W-1){1'b0}}, 1'b1};
            end
        end
    end
    
//================================================================================
//Function  : output signals
//  insure all signals are registered output
//================================================================================
    // output data
    // data is set to '0' when
    // 1. during check symbol
    // 2. during dummy data
    // 3. during idle
    // data is set to frame len on FRAME_LEN cycle
    // other case, data is set to the input data
    // always@(posedge i_clk or negedge i_rst_n) begin
        // if (~i_rst_n) begin
            // r_data_x4 <= `DELAY 32'h0;
        // end
        // else begin
            // case(r_state)
                // IDLE,
                // DUMMY_DATA,
                // CHECK_SYMBOL:
                    // r_data_x4 <= `DELAY 32'h0;
                // SOF:
                    // r_data_x4 <= `DELAY 32'h55_55_55_55;
                // FRAME_LEN:
                    // r_data_x4 <= `DELAY {17'h0,r_cur_frame_len};
                // default:
                    // r_data_x4 <= `DELAY c_data_in;
            // endcase
        // end
    // end
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_data_x1 <= `DELAY 8'h0;
        end
        else begin
            case(r_state)
                IDLE,
                DUMMY_DATA,
                CHECK_SYMBOL:
                    r_data_x1 <= `DELAY 8'h0;
                SOF: 
                    r_data_x1 <= `DELAY 8'h55;
                FRAME_LEN:
                    r_data_x1 <= `DELAY (r_x1_byte_sel == 2'd0) ? r_cur_frame_len[7:0] :
                                        (r_x1_byte_sel == 2'd1) ? {1'b0, r_cur_frame_len[14:8]} :
                                        8'h0;
                default:
                    r_data_x1 <= `DELAY c_data_in;
                    // r_data_x1 <= `DELAY (r_x1_byte_sel == 2'd0) ? c_data_in[7:0] :
                                        // (r_x1_byte_sel == 2'd1) ? c_data_in[15:8] :
                                        // (r_x1_byte_sel == 2'd2) ? c_data_in[23:16] :
                                                                  // c_data_in[31:24] ;
            endcase
        end
    end
    assign o_data = r_data_x1;
    // assign o_data = i_x1_mode ? r_data_x1: r_data_x4;


    //output ari_ack
//    always@(posedge i_clk or negedge i_rst_n) begin
//        if (~i_rst_n) begin
//            r_ari_ack <= `DELAY 1'b0;
//        end
//        else begin
//            //if( (c_state_next == SOF) || (c_state_next == FRAME_LEN) || (c_state_next == DATA_SYMBOL) )
//            if( (c_state_next == DATA_SYMBOL) ) begin
//                if(i_x1_mode) begin
//                    if(r_x1_byte_sel == 2'd3)
//                        r_ari_ack <= `DELAY i_ari_val;
//                    else
//                        r_ari_ack <= `DELAY 1'b0;
//                end
//                else
//                    r_ari_ack <= `DELAY i_ari_val;
//                //the following should also work since ari_val is assumed to
//                //be keep '1'
//                //r_ari_ack <= `DELAY 1'b1;
//            end
//            else
//                r_ari_ack <= `DELAY 1'b0;
//        end
//    end
    assign o_ari_ack = i_ari_val && (r_state == DATA_SYMBOL);// && c_word_sent;
    //assign o_ari_ack = i_ari_val && (r_state == DATA_SYMBOL) && c_word_sent;
    
    //output sof
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof <= `DELAY 1'b0;
        end
        else begin
            r_sof <= `DELAY (r_state == SOF);
        end
    end
    assign o_sof = r_sof;

    //output rs_data_symbol and rs_check_symbol
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_data_symbol <= `DELAY 1'b0;
        end
        else begin
            r_rs_data_symbol <= `DELAY ( (r_state == SOF) ||
                                         (r_state == FRAME_LEN) ||
                                         (r_state == DATA_SYMBOL) ||
                                         (r_state == DUMMY_DATA) );
        end
    end
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_check_symbol <= `DELAY 1'b0;
        end
        else begin
            r_rs_check_symbol <= `DELAY (r_state == CHECK_SYMBOL);
        end
    end
    assign o_rs_data_symbol = r_rs_data_symbol;
    assign o_rs_check_symbol = r_rs_check_symbol;

//================================================================================
//Function  : X1 byte count
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_x1_byte_sel <= `DELAY 2'd0;
        end
        else begin
            // if( (r_state == SOF) || (r_state == FRAME_LEN) || 
                // (r_state == DATA_SYMBOL) ) 
            if(  (r_state == FRAME_LEN) ) 
                r_x1_byte_sel <= `DELAY r_x1_byte_sel + 2'd1;
            else
                r_x1_byte_sel <= `DELAY 2'd0;
        end
    end
//================================================================================
//Function  : assertions
//================================================================================
//TODO
// check the frame len match the eof indication
// check the sof&val assert with the frame_len_val
// check the preamble is 55_55_55_55_55_55_55_D5
// i_ari_val is continues during frame
endmodule
