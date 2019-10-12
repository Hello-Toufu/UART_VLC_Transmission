
//`include "delay.v"

// File:    PulseSync.v
// Author:  Tao Wu
// Date:    2014/4/16

// This module is used to pass high pulse across clock domains.
// The input side detect the rising edge of input signal, then
// keep signal level to high which will transfer to the receiver side
// using DoubleSync.
// The receiver side will generate 1 clock cycle high pulse when
// the signal's rising edge is detected.
// The signal is transferred back to the input side so the input will
// know the success of pulse transmission.
// The new input pulses will not be transferred until the transmission 
// is done.
// o_oSig is a N clock high pulse
// o_oSigPulse is a one clock high pulse

// Name rules: [i/o]_[a/b]SigName  
//              i/o/r/c is input/output/register/logic
//              a/b is the first character of clock domain name
//              _ms is a metastable signal

`ifndef DELAY
`define DELAY #0.1
`endif

module PulseSync(
    input       i_aIReset_N      ,
    input       i_IClk          ,
    input       i_iSig          ,       //the input pulse signal
//    output      o_iStatusOfoSig ,       //high indicate the pulse is successfully transferred 
    
    input       i_aOReset_N      ,    
    input       i_OClk          ,
//    output      o_oSig          ,       //multiple clock pulse, the width is at least wider than iSig width
                                        //keep high if iSig is high
    output      o_oSigPulse             //one clock pulse
);

    wire    r_iSigOut;
    reg     r_iHoldSigIn;
    wire    r_oSig;
    reg     r2_oSig;
    
    DFF_ m_dff_oSig (
        .i_iSig      (r_oSig),
        .i_aOReset_N (i_aIReset_N),
        .i_OClk      (i_IClk),
        .o_oSig      (r_iSigOut));
        
    DFF_ m_dff_iSig (
        .i_iSig      (r_iHoldSigIn),
        .i_aOReset_N (i_aOReset_N),
        .i_OClk      (i_OClk),
        .o_oSig      (r_oSig));
    
    
    //r_iSigOut_ms, r_iSigOut, r_iHoldSigIn
    always @ (posedge i_IClk or negedge i_aIReset_N) begin
        if(~i_aIReset_N) begin
            r_iHoldSigIn <= `DELAY 1'b0;
        end
        else begin
            r_iHoldSigIn <= `DELAY i_iSig | ( r_iHoldSigIn & (~r_iSigOut) );
        end
    end
    
//    assign o_iStatusOfoSig = r_iSigOut;
    
    //r_oHoldSigIn_ms, r_oSig, r2_oSig
    always @ (posedge i_OClk or negedge i_aOReset_N) begin
        if(~i_aOReset_N) begin
            r2_oSig <= `DELAY 1'b0;            
        end
        else begin
            r2_oSig <= `DELAY r_oSig;   
        end
    end
    
//    assign o_oSig = r_oSig;
    assign o_oSigPulse = (~r2_oSig) & r_oSig;
    
endmodule
    

    
    
