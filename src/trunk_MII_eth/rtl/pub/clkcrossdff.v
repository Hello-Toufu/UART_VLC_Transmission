// File:   clkcrossser.v
// Author:  Tao Wu
// Date:    2015/1/27

// Clock Cross Serial (Single bit)
// Read single bit from module from SrcClk to DestClk
// This module use double sync module

module CLKCROSSDFF # (
    parameter  DATA_WIDTH = 1,
    parameter  RESET_VALUE = {DATA_WIDTH{1'b0}}     //reset value
    
)
(
    input                       i_s_rst_n      ,    
    input                       i_src_clk     ,
    input     [DATA_WIDTH-1:0]  i_s_din          ,

    input                       i_d_rst_n      ,   
    input                       i_dest_clk        ,
    output    [DATA_WIDTH-1:0]  o_d_dout            
);

    DoubleSync #(
        .RESET_VALUE (RESET_VALUE),
        .DATA_WIDTH  (DATA_WIDTH)
    ) m_doublesync (
        .i_aIReset_N(i_s_rst_n),
        .i_IClk(i_src_clk),
        //.i_iClkEn(1'b1),
        .i_iSig(i_s_din),
        .i_aOReset_N(i_d_rst_n),
        .i_OClk(i_dest_clk),
        //.i_oClkEn(1'b1),
        .o_oSig(o_d_dout));
        
endmodule
