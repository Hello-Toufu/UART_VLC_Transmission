// File               : tx_8b10b_enc.v
// Author             : Tao Wu
// Created On         : 2017-06-23 09:19
// Last Modified      : 2017-06-27 10:01
// Description        : 
// wrap the 8b/10b encoder modules to simplify interface
// Note the MSB and LSB sequence
// LSB first for both input and output data
                        
module TX_8B10B_ENC(
    input               i_clk
    ,input              i_rst_n

    //output for 8b/10b encoder
    ,input   [7:0]      i_8b_data
    ,input              i_8b_datak

    ,output  [9:0]      o_10b_data

);

    reg                 r_disp_store;
    wire                c_disp_new;

    wire  [9:0]         c_10b_data;
    wire  [9:0]         c_10b_data_lsf;
    reg   [9:0]         r_10b_data;

    TXENC8TO10BYTE m_txenc8to10byte(
        .i_Tx8B10BUse   (1'b1),
        .i_DataK        (i_8b_datak),
        .i_Data         (i_8b_data),
        .i_TxDisp       (r_disp_store),
        .o_EncData      (c_10b_data),
        .o_TxKErr       (),
        .o_TxDisp       (c_disp_new)
    );


    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_disp_store <= `DELAY 1'b0;
        end
        else begin
            r_disp_store <= `DELAY c_disp_new;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_10b_data <= `DELAY 10'h0;
        end
        else begin
            r_10b_data <= `DELAY c_10b_data_lsf;
        end
    end
    assign o_10b_data = r_10b_data;

    //the output of TXENC8TO10BYTE is MSB first, the following will change to LSB first
    genvar i;
    generate 

        for (i=0; i<=9; i=i+1) begin: BIT_SEQ_ADJ
            assign c_10b_data_lsf [i] = c_10b_data[9-i];
        end
    endgenerate


endmodule
