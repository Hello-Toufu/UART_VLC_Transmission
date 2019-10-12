
//`include "delay.v"

// File:    DoubleSync.v
// Author:  Tao Wu
// Date:    2014/3/27

// This module is used to transfer 1 bit signal across clock domains.
// It use one DFF_ from the original clock domain and two DFFs from the
// destination clock domain. Metastability is eliminated at the output
// port.

// Name rules: [i/o]_[a/b]SigName   
//              i/o/r/c is input/output/register/logic
//              a/b is the first character of clock domain name
//              _ms is a metastable signal

`ifndef DELAY
`define DELAY #0.1
`endif

module DoubleSync #(
    parameter   DATA_WIDTH  = 1   ,
    parameter   RESET_VALUE = {DATA_WIDTH{1'b0}}     
)
(
    input       i_aIReset_N   ,       //a: async    
    input       i_IClk      ,       
    input [DATA_WIDTH-1:0]      i_iSig      ,       //i: IClk and IReset domain
    
    input       i_aOReset_N   ,
    input       i_OClk      , 
    output [DATA_WIDTH-1:0]     o_oSig              //o: OClk and OReset domain
);
    
    //signal
    reg [DATA_WIDTH-1:0]      r_iDlySig;
    
    //r_iDlySig
    always @ (posedge i_IClk or negedge i_aIReset_N) begin
        if(~i_aIReset_N) begin
            r_iDlySig <= `DELAY RESET_VALUE;
        end
        else begin
            r_iDlySig <= `DELAY i_iSig;
        end    
    end
    
    DFF_ #(
        .RESET_VALUE (RESET_VALUE),
        .DATA_WIDTH  (DATA_WIDTH)
    ) m_dff (
        .i_iSig      (r_iDlySig),
        .i_aOReset_N (i_aOReset_N),
        .i_OClk      (i_OClk),
        .o_oSig      (o_oSig));
        
endmodule
