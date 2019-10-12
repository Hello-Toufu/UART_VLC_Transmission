// File:    clkcrossbus.v
// Author:  Tao Wu
// Date:    2015/1/27

// Clock Cross Bus (multi bits)
// Read multiple bits from SrcClk to DestClk
// This module use Handshake module to transfer data
// This module will do handshake continuously.  
// Means once previous Handshake is done, a new handshake is started.



module CLKCROSSBUS #(
    parameter   DATA_WIDTH = 16         ,
    parameter   OUT_RESET_VALUE = {DATA_WIDTH{1'b0}}
    // no reset value here, because it is meaningless. Set to all '0'
)
(
     
    input                       i_s_rst_n           ,    
    input                       i_src_clk           ,
    input   [DATA_WIDTH-1:0]    i_s_din             ,   //input parallel data    
    
    input                       i_d_rst_n           ,   
    input                       i_dest_clk          ,
    output  [DATA_WIDTH-1:0]    o_d_dout             //output parallel data
    
);

    wire                        c_s_ready;
    
    Handshake #(
        .DATA_WIDTH(DATA_WIDTH),
        .OUT_RESET_VALUE(OUT_RESET_VALUE)
    )
    m_handshake(
        .i_aIReset_N(i_s_rst_n),
        .i_IClk(i_src_clk),
        //.i_iClkEn(1'b1),
        .i_iPush(c_s_ready),      //assign ready to push, so it will keep updating 
        .i_iData(i_s_din),      
//        .o_iStoredData(),
        .o_iReady(c_s_ready), 
        .i_aOReset_N(i_d_rst_n),
        .i_OClk(i_dest_clk),       
        //.i_oClkEn(1'b1),    
        .o_oDataValid(), 
        .o_oData(o_d_dout));   
endmodule
