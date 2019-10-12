// File               : rx_rs_bl_sync.v
// Author             : Tao Wu
// Created On         : 2017-06-23 14:32
// Last Modified      : 2018-05-28 15:14
// Description        : 
//  get the rs block boundary by detect |S| and count cycles
// detect the rs block data symbol and check symbol
// replace the |S| symbol with original data
// remove |A| and |I| 
//
// since the received data may have bit errors inside, the |A|, |I|, |S| may
// also be crupted on part of lanes, and normal chars may also change to comma chars
// we will judge |A|, |I|, |S| when characters on 2 out of 4 lanes match
//
// the rs block boundary counter stay with 0 until |S| is detected
                        
module RX_RS_BL_SYNC_X4#(
     parameter RS_N         = `RS_N
    ,parameter RS_K         = `RS_K
)
(
    input               i_clk
    ,input              i_rst_n

    ,input  [31:0]      i_data
    ,input  [3:0]       i_datak
    ,input              i_deskew_aligned

    ,output [31:0]      o_data
    ,output             o_sof
    ,output             o_rs_data_symbol
    ,output             o_rs_check_symbol
);

    wire                        c_data_is_i;
    wire                        c_data_is_s;
    wire                        c_data_is_a;
    reg     [3:0]               r_data_match_i;
    reg     [3:0]               r_data_match_s;
    reg     [3:0]               r_data_match_a;

    reg     [31:0]              r_data_d1;
    reg                         r_sof_detected;

    localparam  RS_CNT_W = 10;
    reg [RS_CNT_W-1:0]          r_rs_block_cnt;
    reg                         r_rs_block_cnt_more_than_k;
    
    reg [31:0]          r_data              ;
    reg                 r_sof               ;
    reg                 r_rs_data_symbol    ;
    reg                 r_rs_check_symbol   ;
//================================================================================
//Function  : detect the chars
//================================================================================
    genvar i;
    generate
        for(i=0; i<=3; i=i+1) begin : MATCH_CHAR
            always@(posedge i_clk or negedge i_rst_n) begin
                if (~i_rst_n) begin
                    r_data_match_i[i] <= `DELAY 1'h0;
                    r_data_match_s[i] <= `DELAY 1'h0;
                    r_data_match_a[i] <= `DELAY 1'h0;
                end                    
                else begin             
                    r_data_match_i[i] <= `DELAY (i_datak[i] && (i_data[i*8+:8]==`CHAR_I));
                    r_data_match_s[i] <= `DELAY (i_datak[i] && (i_data[i*8+:8]==`CHAR_S));
                    r_data_match_a[i] <= `DELAY (i_datak[i] && (i_data[i*8+:8]==`CHAR_A));
                end
            end
        end
    endgenerate

    //match 2 or more is count as match all
    assign c_data_is_i = (r_data_match_i != 4'h0) && (r_data_match_i != 4'h1) && 
                         (r_data_match_i != 4'h2) && (r_data_match_i != 4'h4) &&
                         (r_data_match_i != 4'h8);
    assign c_data_is_s = (r_data_match_s != 4'h0) && (r_data_match_s != 4'h1) && 
                         (r_data_match_s != 4'h2) && (r_data_match_s != 4'h4) &&
                         (r_data_match_s != 4'h8);
    assign c_data_is_a = (r_data_match_a != 4'h0) && (r_data_match_a != 4'h1) && 
                         (r_data_match_a != 4'h2) && (r_data_match_a != 4'h4) &&
                         (r_data_match_a != 4'h8);

//================================================================================
//Function  : delay input data and replace char 
//  generate data valid and data
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_data_d1 <= `DELAY 32'h0;
        end
        else begin
            r_data_d1 <= `DELAY i_data;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_data <= `DELAY 32'h0;
        end
        else begin
            //replace the |S| with nomal data
            r_data <= c_data_is_s ? 32'h55_55_55_55 : r_data_d1[31:0];
        end
    end
    assign o_data = r_data;
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof <= `DELAY 1'b0;
        end
        else begin
            r_sof <= `DELAY c_data_is_s;
        end
    end
    assign o_sof = i_deskew_aligned && r_sof;

    //mark whether |S| is detected,     
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof_detected <= `DELAY 1'b0;
        end
        else begin
            if(c_data_is_s)
                r_sof_detected <= `DELAY 1'b1;
            else if((r_rs_block_cnt == {RS_CNT_W{1'b0}}) && (c_data_is_i || c_data_is_a))
                r_sof_detected <= `DELAY 1'b0;
        end
    end

//================================================================================
//Function  : generate rs boundary signal
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
        end
        else begin
            if(~i_deskew_aligned)
                r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
            //every time detect |S|, reset counter to 0
            else if(c_data_is_s)
                r_rs_block_cnt <= `DELAY {{(RS_CNT_W-1){1'b0}},1'b1};
            else if(r_rs_block_cnt == {RS_CNT_W{1'b0}}) begin
                //a new block start if the data is not |I| or |A|
                //it only check for only 1 clock cycle after the last block is end
                if(r_sof_detected && (~(c_data_is_i || c_data_is_a)))
                    r_rs_block_cnt <= `DELAY {{(RS_CNT_W-1){1'b0}},1'b1};
            end
            else begin
                //once block counter start, it won't check |I| or |A|
                //should not be |I| or |A| inside one block
                if(r_rs_block_cnt == RS_N - 1)
                    r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
                else
                    r_rs_block_cnt <= `DELAY r_rs_block_cnt + {{(RS_CNT_W-1){1'b0}},1'b1};
            end
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_block_cnt_more_than_k <= `DELAY 1'b0;
        end
        else begin
            if(c_data_is_s)
                r_rs_block_cnt_more_than_k <= `DELAY 1'b0;
            else if(r_rs_block_cnt == RS_K-1)
                r_rs_block_cnt_more_than_k <= `DELAY 1'b1;
            else if(r_rs_block_cnt == RS_N-1)
                r_rs_block_cnt_more_than_k <= `DELAY 1'b0;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_data_symbol <= `DELAY 1'b0;
            r_rs_check_symbol <= `DELAY 1'b0;
        end
        else begin
            //add r_sof_detected to prevent the fault data cause glitch on
            //rs_data_symbol
            r_rs_data_symbol <= `DELAY c_data_is_s || 
                                        (
                                            (r_rs_block_cnt == {RS_CNT_W{1'b0}}) ? 
                                                ((~(c_data_is_i || c_data_is_a)) && r_sof_detected) :
                                                (~r_rs_block_cnt_more_than_k)
                                        );
            r_rs_check_symbol <= `DELAY (~c_data_is_s) && r_rs_block_cnt_more_than_k;
        end
    end
    assign o_rs_data_symbol = i_deskew_aligned && r_rs_data_symbol;
    assign o_rs_check_symbol = i_deskew_aligned && r_rs_check_symbol;
    
    //TODO: check rs_data_symbol and rs_check_symbol won't assert at the same
    //time

endmodule
