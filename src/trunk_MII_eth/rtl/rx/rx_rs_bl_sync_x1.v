// File               : rx_rs_bl_sync.v
// Author             : Tao Wu
// Created On         : 2017-06-23 14:32
// Last Modified      : 2017-07-05 10:14
// Description        : 
//  get the rs block boundary by detect |S| and count cycles
// detect the rs block data symbol and check symbol
// replace the |S| |A| 00 symbol with original data
// remove |I| 
//
// the SOF sequence is |S| |A| 00, 
// since the received data may have bit errors inside, the data may
// also be crupted on any byte
// so 2 out of 3 match will treat as SOF match
// that is, at most 1 byte crupt is accepted
// 
                        
module RX_RS_BL_SYNC_X1#(
     parameter RS_N         = `RS_N
    ,parameter RS_K         = `RS_K
)
(
    input               i_clk
    ,input              i_rst_n

    ,input  [7:0]       i_data
    ,input              i_datak
    ,input              i_comma_aligned

    ,output [7:0]       o_data
    ,output             o_sof
    ,output             o_rs_data_symbol
    ,output             o_rs_check_symbol
);
    reg     [7:0]       r_data_d1;
    reg     [7:0]       r_data_d2;
    reg                 r_datak_d1;
    reg                 r_datak_d2;


    wire                c_data_is_i;    // |I| |I| |I| match 2 out of 3
    wire                c_data_is_s;    // |S| |A| 55 match 2 out of 3
    wire    [2:0]       c_data_match_i;
    wire    [2:0]       c_data_match_s;

    reg                 r_sof_detected;

    localparam  RS_CNT_W = 10;
    reg [RS_CNT_W-1:0]  r_rs_block_cnt;
    reg                 r_rs_block_cnt_more_than_k;
    
    reg [7:0]           r_data              ;
    reg                 r_sof               ;
    reg                 r_rs_data_symbol    ;
    reg                 r_rs_check_symbol   ;

    reg [1:0]           r_sof_byte_cnt;
//================================================================================
//Function  : detect the chars
//================================================================================
    assign c_data_match_i[0] = (i_datak && (i_data==`CHAR_I));
    assign c_data_match_i[1] = (r_datak_d1 && (r_data_d1==`CHAR_I));
    assign c_data_match_i[2] = (r_datak_d2 && (r_data_d2==`CHAR_I));
    assign c_data_match_s[0] = ((~i_datak) && (i_data == 8'h55));  //55
    assign c_data_match_s[1] = (r_datak_d1 && (r_data_d1==`CHAR_A)); //|A|
    assign c_data_match_s[2] = (r_datak_d2 && (r_data_d2==`CHAR_S)); //|S|

    //match 2 out of 3 is count as match
    assign c_data_is_i = (c_data_match_i != 3'h0) && (c_data_match_i != 3'h1) && 
                         (c_data_match_i != 3'h2) && (c_data_match_i != 3'h4);
    assign c_data_is_s = (c_data_match_s != 3'h0) && (c_data_match_s != 3'h1) && 
                         (c_data_match_s != 3'h2) && (c_data_match_s != 3'h4);

//================================================================================
//Function  : delay input data and replace char 
//  generate data valid and data
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_data_d1 <= `DELAY 8'h0;
            r_data_d2 <= `DELAY 8'h0;
            r_datak_d1 <= `DELAY 1'h0;
            r_datak_d2 <= `DELAY 1'h0;
        end
        else begin
            r_data_d1 <= `DELAY i_data;
            r_data_d2 <= `DELAY r_data_d1;
            r_datak_d1 <= `DELAY i_datak;
            r_datak_d2 <= `DELAY r_datak_d1;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_data <= `DELAY 8'h0;
        end
        else begin
            //replace the |S| with nomal data
            r_data <= (c_data_is_s || r_sof_byte_cnt!=2'd0) ? 8'h55 : r_data_d2;
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
    assign o_sof = i_comma_aligned && r_sof;

    //mark whether |S| is detected,     
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof_detected <= `DELAY 1'b0;
        end
        else begin
            if(c_data_is_s)
                r_sof_detected <= `DELAY 1'b1;
            else if((r_rs_block_cnt == {RS_CNT_W{1'b0}}) && (c_data_is_i))
                r_sof_detected <= `DELAY 1'b0;
        end
    end

    //sof count 
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof_byte_cnt <= `DELAY 2'd0;
        end
        else begin
            if(c_data_is_s)
                r_sof_byte_cnt <= `DELAY 2'd1;
            else if(r_sof_byte_cnt != 2'd0)
                r_sof_byte_cnt <= `DELAY r_sof_byte_cnt + 2'd1;
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
            if(~i_comma_aligned)
                r_rs_block_cnt <= `DELAY {RS_CNT_W{1'b0}};
            //every time detect |S|, reset counter to 0
            else if(c_data_is_s)
                r_rs_block_cnt <= `DELAY {{(RS_CNT_W-1){1'b0}},1'b1};
            else if(r_rs_block_cnt == {RS_CNT_W{1'b0}}) begin
                //a new block start if the data is not |I|
                //it only check for only 1 clock cycle after the last block is end
                if(r_sof_detected && (~c_data_is_i))
                    r_rs_block_cnt <= `DELAY {{(RS_CNT_W-1){1'b0}},1'b1};
            end
            else begin
                //once block counter start, it won't check |I|
                //should not be |I| inside one block
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
            r_rs_data_symbol <= `DELAY c_data_is_s || 
                                        (
                                            (r_rs_block_cnt == {RS_CNT_W{1'b0}}) ? 
                                                (r_sof_detected && (~c_data_is_i)) :
                                                (~r_rs_block_cnt_more_than_k)
                                        );
            r_rs_check_symbol <= `DELAY (~c_data_is_s) && r_rs_block_cnt_more_than_k;
        end
    end
    assign o_rs_data_symbol = i_comma_aligned && r_rs_data_symbol;
    assign o_rs_check_symbol = i_comma_aligned && r_rs_check_symbol;

    //TODO: check rs_data_symbol and rs_check_symbol won't assert at the same time 
endmodule
