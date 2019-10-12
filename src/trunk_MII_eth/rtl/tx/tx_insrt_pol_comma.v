// File               : tx_insrt_pol_comma.v
// Author             : Tao Wu
// Created On         : 2017-08-30 11:14
// Last Modified      : 2017-09-01 17:21
// Description        : 
//  this module is used to replace the K28.5 comma with K28.5+ / K28.6- when
//  manchest is enable
//  so the received side can detect the polarity according to the received
//  K28.5 and K28.6 comma's polarity
//  K28.5+: 0011111010      K28.5-: 1100000101          (lsb to msb)
//  K28.6+: 0011110110      K28.6-: 1100001001
//  the previous 8b10b encode will only output K28.5+ and K28.5- encoded
//  commas
//  so we will detect K28.5 and replace it with 
//  K28.5+ -> K28.2+
//  K28.5- -> K28.6-
//
module TX_INSRT_POL_COMMA #(
     parameter      ORI_COMMA_POS = 10'b01_0111_1100    //K28.5+
    ,parameter      REP_COMMA_POS = 10'b10_1011_1100    //K28.2+
    ,parameter      REP_COMMA_NEG = 10'b10_0100_0011    //K28.6-
)(
    input               i_clk
    ,input              i_rst_n

    ,input              i_en

    ,input  [9:0]       i_ori_data
    ,output [9:0]       o_rep_data
);

    reg [9:0]           r_rep_data;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rep_data <= `DELAY ORI_COMMA_POS;
        end
        else begin
            if(i_ori_data == ORI_COMMA_POS)
                r_rep_data <= `DELAY REP_COMMA_POS;
            else if(i_ori_data == (~ORI_COMMA_POS))
                r_rep_data <= `DELAY REP_COMMA_NEG;
            else
                r_rep_data <= `DELAY i_ori_data;
        end
    end

    assign o_rep_data = i_en ? r_rep_data : i_ori_data;

endmodule
