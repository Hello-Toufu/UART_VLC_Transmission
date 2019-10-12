
//`include "delay.v"

// File:    DFF.v
// Author:  Tao Wu
// Date:    2014/4/10

// This module is used to transfer 1 bit signal across clock domains.
// It use two DFFs from the destination clock domain. 
// Metastability is eliminated at the output port.

// Name rules: [i/o]_[a/b]SigName   
//              i/o/r/c is input/output/register/logic
//              a/b is the first character of clock domain name
//              _ms is a metastable signal

`ifndef DELAY
`define DELAY #0.1
`endif

module DFF_ #(
    parameter   DATA_WIDTH  = 1   ,
    parameter   RESET_VALUE = {DATA_WIDTH{1'b0}}     

)
(
    input   [DATA_WIDTH-1:0]      i_iSig      ,       //i: IClk and IReset domain
    
    input       i_aOReset_N ,
    input       i_OClk      , 
    output  [DATA_WIDTH-1:0]      o_oSig              //o: OClk and OReset domain
);
    
    //signal
    reg [DATA_WIDTH-1:0]        r_oSig_ms;
    reg [DATA_WIDTH-1:0]        r_oSig;
    
    //logic

    //r_oSig
    //r_oSig_ms
    always @ (posedge i_OClk or negedge i_aOReset_N) begin
        if(~i_aOReset_N) begin
            r_oSig_ms <= `DELAY {RESET_VALUE};
            r_oSig <= `DELAY {RESET_VALUE};
        end
        else begin
            r_oSig_ms <= `DELAY i_iSig;
            r_oSig <= `DELAY r_oSig_ms;
        end
    end
    
    assign o_oSig = r_oSig;
endmodule
