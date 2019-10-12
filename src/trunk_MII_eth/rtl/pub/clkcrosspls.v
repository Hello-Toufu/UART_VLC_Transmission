// File:    clkcrosspls.v
// Author:  Tao Wu
// Date:    2015/1/27

// Clock Cross Pulse (multi bits)
// Write single pulse from SrcClk to DestClk
//  source bit change from '0' to '1' will cause a 1 clock high pulse in dest clock
// This module use pulse sync module

module CLKCROSSPLS (
    input                       i_s_rst_n     ,    
    input                       i_src_clk     ,
    input                       i_s_din       ,
    input                       i_d_rst_n      ,  
    input                       i_dest_clk     ,
    output                      o_d_dout          
);

    PulseSync m_pulsesync(
        .i_aIReset_N(i_s_rst_n),
        .i_IClk(i_src_clk),
        //.i_iClkEn(1'b1), 
        .i_iSig(i_s_din),         
        //.o_iStatusOfoSig(),
        .i_aOReset_N(i_d_rst_n),
        .i_OClk(i_dest_clk),         
        //.i_oClkEn(1'b1),       
        //.o_oSig(),         
        .o_oSigPulse(o_d_dout));      
endmodule
