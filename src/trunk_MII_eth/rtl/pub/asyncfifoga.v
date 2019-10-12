
//`include "delay.v"

// File:    ASyncFIFO.v
// Author:  Tao Wu
// Date:    2014/4/8

// Asynchronized FIFO with full and empty flag
// use gate output for empty signal

// These source are copied from <Simulation and Synthesis Techniques for Asynchronous FIFO Design> without modification

`ifndef DELAY
`define DELAY #0.1
`endif

module ASYNCFIFOGA #(
    parameter   DSIZE       = 8     ,
    parameter   ASIZE       = 4     )
(
    input                   wrst_n  ,   //async reset
    input                   wclk    ,     
    input                   winc    ,   //write enable
    input   [DSIZE-1:0]     wdata   ,
    output                  wfull   ,    
    
    input                   rrst_n  ,    
    input                   rclk    , 
    input                   rinc    ,   //read enable, rdata will change for next reading
    output  [DSIZE-1:0]     rdata   ,   //always output the valid data
    output                  rempty  );
    
    
    wire    [ASIZE-1:0]     waddr;
    wire    [ASIZE-1:0]     raddr;

    wire    [ASIZE:0]       wptr, rptr, wq2_rptr, rq2_wptr;
    wire    [DSIZE-1:0]     rdata_int ;
    
    
    sync_r2w_ga #(ASIZE) sync_r2w (
        .wq2_rptr(wq2_rptr), 
        .rptr(rptr),
        .wclk(wclk), 
        .wrst_n(wrst_n));

    sync_w2r_ga #(ASIZE) sync_w2r (
        .rq2_wptr(rq2_wptr), 
        .wptr(wptr),
        .rclk(rclk), 
        .rrst_n(rrst_n));
        
    fifomem_ga #(DSIZE, ASIZE) fifomem (
        .rdata(rdata_int), 
        .wdata(wdata),
        .waddr(waddr), 
        .raddr(raddr),
        .wclken(winc), 
        .wfull(wfull),
        .wclk(wclk));
        
    rptr_empty_ga #(ASIZE) rptr_empty (
        .rempty(rempty),
        .raddr(raddr),
        .rptr(rptr), 
        .rq2_wptr(rq2_wptr),
        .rinc(rinc), 
        .rclk(rclk),
        .rrst_n(rrst_n));
        
    wptr_full_ga #(ASIZE) wptr_full(
        .wfull(wfull), 
        .waddr(waddr),
        .wptr(wptr), 
        .wq2_rptr(wq2_rptr),
        .winc(winc), 
        .wclk(wclk),
        .wrst_n(wrst_n));

    //20170627-twu: make read data '0' when fifo is not reading
    // to avoid the metastable caused to the read side by writing empty fifo
    assign rdata = rinc ? rdata_int : {DSIZE{1'b0}} ;
endmodule

    ////////////////////////////////////////////////////////////////////////////
    // Sub Modules
    ////////////////////////////////////////////////////////////////////////////

module fifomem_ga #(
    parameter   DATASIZE    = 8, // Memory data word width
    parameter   ADDRSIZE    = 4) // Number of mem address bits
(
    output  [DATASIZE-1:0]  rdata   ,
    input   [DATASIZE-1:0]  wdata   ,
    input   [ADDRSIZE-1:0]  waddr   , 
    input   [ADDRSIZE-1:0]  raddr   ,
    input                   wclken  , 
    input                   wfull   , 
    input                   wclk    );
    
`ifdef VENDORRAM
// instantiation of a vendor's dual-port RAM
    vendor_ram mem (
        .dout(rdata), 
        .din(wdata),
        .waddr(waddr), 
        .raddr(raddr),
        .wclken(wclken),
        .wclken_n(wfull), 
        .clk(wclk));

`else
// RTL Verilog memory model
    localparam DEPTH = 1<<ADDRSIZE;
    reg [DATASIZE-1:0] mem [0:DEPTH-1];
    assign rdata = mem[raddr];
    always @(posedge wclk)
        if (wclken && !wfull) 
            mem[waddr] <= `DELAY wdata;
`endif
endmodule

module sync_r2w_ga #(
    parameter   ADDRSIZE    =  4)
(
    output      [ADDRSIZE:0]    wq2_rptr    ,
    input       [ADDRSIZE:0]    rptr        ,
    input                       wclk        , 
    input                       wrst_n      );
    
    DFF_ #(.DATA_WIDTH(ADDRSIZE+1)) rptr_sync(.i_iSig(rptr), .i_aOReset_N(wrst_n), .i_OClk(wclk), .o_oSig(wq2_rptr));
//    reg [ADDRSIZE:0]    wq1_rptr;
//    
//    always @(posedge wclk or negedge wrst_n)
//        if (!wrst_n) 
//            {wq2_rptr,wq1_rptr} <= `DELAY 0;
//        else 
//            {wq2_rptr,wq1_rptr} <= `DELAY {wq1_rptr,rptr};
endmodule

module sync_w2r_ga #(
    parameter   ADDRSIZE    = 4)
(
    output      [ADDRSIZE:0]    rq2_wptr    ,
    input       [ADDRSIZE:0]    wptr        ,
    input                       rclk        , 
    input                       rrst_n      );
    
    DFF_ #(.DATA_WIDTH(ADDRSIZE+1)) rptr_sync(.i_iSig(wptr), .i_aOReset_N(rrst_n), .i_OClk(rclk), .o_oSig(rq2_wptr));
//    reg [ADDRSIZE:0]    rq1_wptr;
//    
//    always @(posedge rclk or negedge rrst_n)
//        if (!rrst_n) 
//            {rq2_wptr,rq1_wptr} <= `DELAY 0;
//        else 
//            {rq2_wptr,rq1_wptr} <= `DELAY {rq1_wptr,wptr};
endmodule

module rptr_empty_ga #(
    parameter   ADDRSIZE    = 4)
(
    output reg                  rempty  ,
    output      [ADDRSIZE-1:0]  raddr   ,
    output reg  [ADDRSIZE :0]   rptr    ,
    input       [ADDRSIZE :0]   rq2_wptr,
    input                       rinc    , 
    input                       rclk    , 
    input                       rrst_n  );
    
    reg     [ADDRSIZE:0]    rbin;
    wire    [ADDRSIZE:0]    rgraynext, rbinnext;
    
    //-------------------
    // GRAYSTYLE2 pointer
    //-------------------
    always @(posedge rclk or negedge rrst_n)
        if (!rrst_n) 
            {rbin, rptr} <= `DELAY 0;
        else 
            {rbin, rptr} <= `DELAY {rbinnext, rgraynext};
            
    // Memory read-address pointer (okay to use binary to address memory)
    assign raddr = rbin[ADDRSIZE-1:0];
    assign rbinnext = rbin + {{ADDRSIZE{1'b0}}, (rinc & ~rempty)};
    assign rgraynext = (rbinnext>>1) ^ rbinnext;
    //---------------------------------------------------------------
    // FIFO empty when the next rptr == synchronized wptr or on reset
    //---------------------------------------------------------------
    wire [ADDRSIZE:0] rgray;
    assign rgray = {1'b0, rbin[ADDRSIZE:1]}^rbin[ADDRSIZE:0];
    //assign rempty_val = (rgraynext == rq2_wptr);
    //always @(posedge rclk or negedge rrst_n)
    //    if (!rrst_n) 
    //        rempty <= `DELAY 1'b1;
    //    else 
    //        rempty <= `DELAY rempty_val;
    
    //this empty generate circuit vs previous one
    //same: assert empty the same 
    //pros: deassert empty 1 clock earlier in some case
    //cons: logic output instead of register output
    always @ ( * ) begin
        rempty = (rgray == rq2_wptr);
    end
endmodule

module wptr_full_ga #(
    parameter   ADDRSIZE    = 4)
(
    output reg                  wfull   ,
    output      [ADDRSIZE-1:0]  waddr   ,
    output reg  [ADDRSIZE :0]   wptr    ,
    input       [ADDRSIZE :0]   wq2_rptr,
    input                       winc    , 
    input                       wclk    , 
    input                       wrst_n  );
    
    reg     [ADDRSIZE:0]    wbin;
    wire    [ADDRSIZE:0]    wgraynext, wbinnext;
    // GRAYSTYLE2 pointer
    always @(posedge wclk or negedge wrst_n)
        if (!wrst_n) 
            {wbin, wptr} <= `DELAY 0;
        else 
            {wbin, wptr} <= `DELAY {wbinnext, wgraynext};
    // Memory write-address pointer (okay to use binary to address memory)
    assign waddr = wbin[ADDRSIZE-1:0];
    assign wbinnext = wbin + {{ADDRSIZE{1'b0}}, (winc & ~wfull)};
    assign wgraynext = (wbinnext>>1) ^ wbinnext;
    //------------------------------------------------------------------
    // Simplified version of the three necessary full-tests:
    // assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
    // (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
    // (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
    //------------------------------------------------------------------
    //assign wfull_val = (wgraynext=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]});
    //always @(posedge wclk or negedge wrst_n)
    //    if (!wrst_n) 
    //        wfull <= `DELAY 1'b0;
    //    else 
    //        wfull <= `DELAY wfull_val;
    wire [ADDRSIZE:0] wgray;
    assign wgray = {1'b0, wbin[ADDRSIZE:1]} ^ wbin[ADDRSIZE:0];
    always @ ( * ) begin
        wfull = (wgray=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]});
    end
endmodule
