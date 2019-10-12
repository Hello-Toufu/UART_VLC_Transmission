
//`include "delay.v"

// File:    Handshake.v
// Author:  Tao Wu
// Date:    2014/3/27

// This module is used to push an signal of more than one bit to 
// cross clock domains.
// The multiple data is transferred through 2 DFF_ arrays.
// When the data is to be sent, the Push signal of input side should
// rise, it lead to the indicate signal change level. The indicate
// signal is then transferred to receive side using DoubleSync.
// When receive side detect the indicate signal change, it will fetch
// the data from DFF_ arrays, and generate a one clock data valid signal
// at the same time, the parallel data is also output with data valid.
// The indicate signal is transferred back to the input side, and is
// used to generate a Ready signal, which means current transfer finished.
// The Push signal should NOT be assert until the Ready signal is valid again.

// Name rules: [i/o]_[a/b]SigName  
//              i/o/r/c is input/output/register/logic
//              a/b is the first character of clock domain name
//              _ms is a metastable signal
//`include "delay.v"

`ifndef DELAY
`define DELAY #0.1
`endif

module Handshake #(
    parameter   DATA_WIDTH = 32         ,
    parameter   OUT_RESET_VALUE = {DATA_WIDTH{1'b0}}
)
(
    input                       i_aIReset_N      ,
    input                       i_IClk          ,
    input                       i_iPush         ,   //rising edge trigger the transmission
    input   [DATA_WIDTH-1:0]    i_iData         ,   //input parallel data
    output                      o_iReady        ,   //high when new transmission is ready
    
    input                       i_aOReset_N      ,    
    input                       i_OClk          ,
    output                      o_oDataValid    ,   //one clock high with valid output data
    output  [DATA_WIDTH-1:0]    o_oData             //output parallel data
);

    reg                     r_iDlyPush;
    reg                     r_iPushToggle;
    // reg                     r_oPushToggleToReady;
    
    reg                     r_iLclReady;
    
    //r_iLclStoreData is used to store the input data, so our function
    // don't rely on the input data unchanged
    reg [DATA_WIDTH-1:0]    r_iLclStoreData; 

    wire                    r_oPushToggle;
    reg                     r2_oPushToggle;
    wire                    c_oPushToggleChanged;    
    
    wire                    r_iReadyToggle;
    
    reg                     r_oDataValid;
    reg [DATA_WIDTH-1:0]    r_oData;
    ////////////////////////////////////////////////////////////////////////////
    // Capture iPush signal and store iData
    ////////////////////////////////////////////////////////////////////////////
    
    //r_iDlyPush, r_iLclStoreData, r_iPushToggle
    always @ (posedge i_IClk or negedge i_aIReset_N) begin
        if(~i_aIReset_N) begin
            r_iDlyPush <= `DELAY 1'b0;
            r_iLclStoreData <= `DELAY {DATA_WIDTH{1'b0}};
            r_iPushToggle <= `DELAY 1'b0;
        end
        else begin
            r_iDlyPush <= `DELAY i_iPush;
            // a rising edge on i_iPush detected
            if ( i_iPush & (~r_iDlyPush) ) begin
                r_iLclStoreData <= `DELAY i_iData;
                r_iPushToggle <= `DELAY ~ r_iPushToggle;
            end            
        end
    end
    

    
    ////////////////////////////////////////////////////////////////////////////
    // Transfer the indication signal by toggle the signal level
    // Receiver side detect the level change on indication signal
    ////////////////////////////////////////////////////////////////////////////
    
    // r_oPushToggle, r2_oPushToggle
    always @ (posedge i_OClk or negedge i_aOReset_N) begin
        if(~i_aOReset_N) begin
            r2_oPushToggle <= `DELAY 1'b0;
        end
        else begin
            r2_oPushToggle <= `DELAY r_oPushToggle;
        end
    end
    
    DFF_ m_dff_ipushtoggle (
        .i_iSig      (r_iPushToggle),
        .i_aOReset_N (i_aOReset_N),
        .i_OClk      (i_OClk),
        .o_oSig      (r_oPushToggle));
    
    assign c_oPushToggleChanged = r2_oPushToggle ^ r_oPushToggle;   
    
    ////////////////////////////////////////////////////////////////////////////
    // Generate the Data valid signal and store the output data
    ////////////////////////////////////////////////////////////////////////////
    
    //o_oDataValid, o_oData
    always @ (posedge i_OClk or negedge i_aOReset_N) begin
        if(~i_aOReset_N) begin
            r_oDataValid <= `DELAY 1'b0;
            r_oData <= `DELAY OUT_RESET_VALUE;
        end
        else begin
            r_oDataValid <= `DELAY c_oPushToggleChanged;
            // !!!NOTE!!!
            // Here we directly assign the output data from the Stored input
            // data, because we ASSUME the Data valid won't assert until the 
            // parallel data is set up on the OCLK domain DFFs.
            // This means, the route time from the 
            // (Q of r_iLclStoreData to D input of o_oData)
            // is less than the route time from 
            // (Q of r_iPushToggle to the D input of r_oPushToggle_ms) + 2 OClk cycles
            // If OClk is high, this assumption may not be valid until we
            // manually put some constraint on it.
            if(c_oPushToggleChanged) begin
                r_oData <= `DELAY r_iLclStoreData;
            end
        end
    end
    assign o_oData = r_oData;
    assign o_oDataValid = r_oDataValid;
    
    
    ////////////////////////////////////////////////////////////////////////////
    // Generate the ACK toggle signal from the indication signal and transfer it 
    // back to input side
    ////////////////////////////////////////////////////////////////////////////
    
    //r_oReadyToggle, 
    // always @ (posedge i_OClk or negedge i_aOReset_N) begin
        // if(~i_aOReset_N) begin
            // r_oReadyToggle <= `DELAY 1'b0;
        // end
        // else begin
                // r_oReadyToggle <= `DELAY r2_oPushToggle;
        // end
    // end
    
    //r_iReadyToggle
    DFF_ m_dff_oPushToggle (
        .i_iSig      (r2_oPushToggle),
        .i_aOReset_N (i_aIReset_N),
        .i_OClk      (i_IClk),
        .o_oSig      (r_iReadyToggle));
    
    ////////////////////////////////////////////////////////////////////////////
    // Generate the Ready signal
    ////////////////////////////////////////////////////////////////////////////
    // Ready signal is high when r_iReadyToggle is same as r_iPushToggle
    // During reset, Ready signal should obviously go low to match the behaviour. 
    // Since both r_iDlyPush and r_iReadyToggle are reset to 0
    // Ready will go high as soon as reset is de-assert, and this will cause
    // metastability, to avoid this, synchronous reset is created.
    
    // r_iLclReady
    always @ (posedge i_IClk or negedge i_aIReset_N) begin
        if(~i_aIReset_N) begin
            r_iLclReady <= `DELAY 1'b0;
        end
        else begin
            //whenever iPush assert, ready is de-assert on next clock
            r_iLclReady <= `DELAY (~i_iPush) & (r_iReadyToggle == r_iPushToggle);
        end
    end
    
    assign o_iReady = r_iLclReady;
    
endmodule
