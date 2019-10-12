// File               : rx_cc.v
// Author             : Tao Wu
// Created On         : 2017-06-27 14:06
// Last Modified      : 2017-06-28 14:56
// Description        : 
// TODO: this module is not used any more
// clock compensation
// detect the rs block data symbol and check symbol
// replace the |S| symbol with original data
//
// an async fifo is used
// on the write side, the write won't start unitl |S| is detected to avoid
// part of packet writting into fifo
//   the |A| and |I| is not written to fifo
//   |S| is written to fifo after replaced, and with sof indication bit
// on the read side, read only start when waterline is higher than half full threshold,
//   before that, the read side will generate invalid data(with data_valid=0)
// once read start, it won't stop until a whole rs block is readout
// when |S| is detected on read side, if it is not on rs block start, we will
//   clear the rs block counter and start from this place
                        
// since the received data may have bit errors inside, the |A|, |I|, |S| may
// also be crupted on part of lanes, and normal chars may also change to comma chars
// we will judge |A|, |I|, |S| when characters on 2 out of 4 lanes match


module RX_CC#(
     parameter ADD_WIDTH    = 4      
    ,parameter RS_N         = 255
    ,parameter RS_K         = 223
)
(
    //write
    input                       i_unif_clk
    ,input                      i_unif_rst_n

    ,input  [31:0]              i_u_data
    ,input  [3:0]               i_u_datak

    //read
    ,input                      i_core_clk
    ,input                      i_core_rst_n

    ,output [31:0]              o_c_data
    ,output                     o_c_sof
    ,output                     o_c_rs_data_symbol
    ,output                     o_c_rs_check_symbol
    
    //setting
    input   [ADD_WIDTH-1:0]     i_r_half_thres          , // half-full threshold
);

    wire                        c_u_data_is_i;
    wire                        c_u_data_is_s;
    wire                        c_u_data_is_a;
    reg     [3:0]               r_u_data_match_i;
    reg     [3:0]               r_u_data_match_s;
    reg     [3:0]               r_u_data_match_a;

    wire    [31:0]              r_u_data_d1;
    wire    [35:0]              c_u_wr_data;
    wire                        c_u_wr_en;
    reg                         r_u_sof_detected;

    localparam  RS_CNT_W = 10;
    reg [RS_CNT_W-1:0]          r_rs_block_cnt;
    
//================================================================================
//Function  : detect the chars
//================================================================================
    genvar i;
    generate
        for(i=0; i<=3; i=i+1) begin : MATCH_CHAR
            always@(posedge i_unif_clk or negedge r_u_unif_rst_n) begin
                if (~r_u_unif_rst_n) begin
                    r_u_data_match_i[i] <= `DELAY 1'h0;
                    r_u_data_match_s[i] <= `DELAY 1'h0;
                    r_u_data_match_a[i] <= `DELAY 1'h0;
                end                    
                else begin             
                    r_u_data_match_i[i] <= `DELAY (i_u_datak[i] && (i_u_data[i*8:+8]==`CHAR_I));
                    r_u_data_match_s[i] <= `DELAY (i_u_datak[i] && (i_u_data[i*8:+8]==`CHAR_S));
                    r_u_data_match_a[i] <= `DELAY (i_u_datak[i] && (i_u_data[i*8:+8]==`CHAR_A));
                end
            end
        end
    endgenerate

    //match 2 or more is count as match all
    assign c_u_data_is_i = (r_u_data_match_i != 4'h0) && (r_u_data_match_i != 4'h1) && 
                            (r_u_data_match_i != 4'h2) && (r_u_data_match_i != 4'h4) &&
                            (r_u_data_match_i != 4'h8);
    assign c_u_data_is_s = (r_u_data_match_s != 4'h0) && (r_u_data_match_s != 4'h1) && 
                            (r_u_data_match_s != 4'h2) && (r_u_data_match_s != 4'h4) &&
                            (r_u_data_match_s != 4'h8);
    assign c_u_data_is_a = (r_u_data_match_a != 4'h0) && (r_u_data_match_a != 4'h1) && 
                            (r_u_data_match_a != 4'h2) && (r_u_data_match_a != 4'h4) &&
                            (r_u_data_match_a != 4'h8);

//================================================================================
//Function  : delay input data and replace char for write fifo
//  generate write enable and write data
//================================================================================
    always@(posedge i_unif_clk or negedge r_u_unif_rst_n) begin
        if (~r_u_unif_rst_n) begin
            r_u_data_d1 <= `DELAY 32'h0;
        end
        else begin
            r_u_data_d1 <= `DELAY i_u_data;
        end
    end

    //replace the |S| with nomal data
    assign c_u_wr_data[31:0] <= c_u_data_is_s ? 32'h55_55_55_55 : r_u_data_d1[31:0];
    //sof mark bit is also written to the fifo
    assign c_u_wr_data[32]  <= c_u_data_is_s;        

    //mark whether |S| is detected,     
    always@(posedge i_unif_clk or negedge r_u_unif_rst_n) begin
        if (~r_u_unif_rst_n) begin
            r_u_sof_detected <= `DELAY 1'b0;
        end
        else begin
            if(c_u_data_is_s)
                r_u_sof_detected <= `DELAY 1'b1;
        end
    end

    //skip |I| and |A|, the fifo write won't start until |S| is detected 
    assign c_u_wr_en = r_u_sof_detected ? (~(c_u_data_is_i || c_u_data_is_a)) : c_u_data_is_s;


//================================================================================
//Function  : 
//================================================================================

//================================================================================
//Function  : fifo instance
//================================================================================
    ASYNCFIFOGA #(.DSIZE(33), .ASIZE(ADD_WIDTH)) m_asyncfifo (
        .wrst_n (r_u_unif_rst_n),
        .wclk   (i_unif_clk),
        .winc   (c_u_wr_en),
        .wdata  (c_u_wr_data),
        .wfull  (c_u_fifo_full),      
        .rrst_n (i_core_rst_n),
        .rclk   (i_core_clk),
        .rinc   (c_c_rd_en),
        .rdata  (c_c_rdata),
        .rempty (c_c_fifo_empty)); 

endmodule

