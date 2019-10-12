//--------------------------------------------------------------------------
//--
//--                  (C) COPYRIGHT 2005-2009 SYNOPSYS, INC.
//--                            ALL RIGHTS RESERVED
//--
//--  This software and the associated documentation are confidential and
//--  proprietary to Synopsys, Inc.  Your use or disclosure of this
//--  software is subject to the terms and conditions of a written
//--  license agreement between you, or your company, and Synopsys, Inc.
//--
//--  The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2007/11/15 $
// File Version     :        $Revision: #8 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// Asynchronous FIFO (DWC_gmac_async_fifo.v)
//
// DESCRIPTION:
// Asynchronous FIFO which allows push and pop operations. The FIFO can be
// used only for applications were the FIFO read happens faster compared to  
// write so that the FIFO never overflows.
//--------------------------------------------------------------------------

  module DWC_gmac_async_fifo (
    // Write Interface
    clk_wr_i,
    rst_clk_wr_n,
    write_e,
    wdata,
    clr_wptr,
    fifo_full,

    // Read Interface
    clk_rd_i,
    rst_clk_rd_n,
    read_e,
    rdata,
    clr_rptr,
    fifo_empty
  );
  
// Parameters WIDTH and PTR_WIDTH
   parameter    DATA_WIDTH = 32;
   parameter    PTR_WIDTH = 2;
// Input and Output declarations.
  // Write Interface
  input                     clk_wr_i;             // Write clock
  input                     rst_clk_wr_n;         // Write reset
  input                     write_e;              // Write enable
  input  [DATA_WIDTH-1:0]   wdata;                // Write data input
  input                     clr_wptr;             // clear write pointer
  // Read Interface
  input                     clk_rd_i;             // Read clock
  input                     rst_clk_rd_n;         // Read reset
  input                     read_e;               // Read Strobe
  input                     clr_rptr;             // clear read pointer 

  output                    fifo_full;            // FIFO Full status signal
 
  output [DATA_WIDTH-1:0]   rdata;                // Read Data Output 
  output                    fifo_empty;           // FIFO Empty Status Signal


// output wire and register declarations
  wire                   fifo_full;   // FIFO full signal
  reg  [DATA_WIDTH-1:0]  rdata;       // Read Data Output 
  wire                   fifo_empty;  // FIFO empty signal

// local wire and register declarations.
  // leda FM_106 off
  reg  [DATA_WIDTH-1:0]  mem[(2**(PTR_WIDTH-1))-1:0]; // Register memory. 
  // leda FM_106 on
  integer                k;                           // Integer used in "for" loop
  
  wire [PTR_WIDTH-1:0]   rptr;        // Read pointer   
  wire [PTR_WIDTH-1:0]   wptr;        // Write pointer   
  wire [PTR_WIDTH-1:0]   wptr_rsync;  // Write pointer sync'd to read clock domain.
  wire [PTR_WIDTH-1:0]   rptr_wsync;  // Read pointer sync'd to write clock domain.
                                                  
  wire                   incr_ptr;     // Qualified read_e with fifo_empty
  wire [PTR_WIDTH-2:0]   wptr_mod;
  wire [PTR_WIDTH-2:0]   rptr_mod;

  wire [PTR_WIDTH-1:0]   dumy_wr_ofst; // dummy wire   
  wire [PTR_WIDTH-1:0]   dumy_rd_ofst; // dummy wire
  wire                   rst_rd_async_n;
  wire                   rst_wr_async_n;
  wire                   rst_rd_sync_n;
  wire                   rst_wr_sync_n;

  wire [PTR_WIDTH-1:0]   rptr_plus1;     // Read pointer plus 1
  wire [PTR_WIDTH-2:0]   rptr_plus1_mod; // Lower bits of Read pointer plus 1
  wire                   fifo_aempty;  // FIFO almost empty signal (only 1 word left)

  wire                   fifo_empty_c;  // Combinational FIFO empty signal
  reg                    fifo_empty_r;  // Registered FIFO empty signal

// --------------------------------
// Register FIFO
// --------------------------------

    // leda W396 S_1C_R off
  always @(posedge clk_wr_i or negedge rst_clk_wr_n) begin
    if (!rst_clk_wr_n) begin
      // leda FM_106 off
      for (k=0; k <= ((2**(PTR_WIDTH-1))-1); k = k + 1) 
      // leda FM_106 on
      begin
        mem[k] <= {DATA_WIDTH{1'b0}};
      end
    end
    else begin
      if (write_e)
        mem[wptr_mod] <= wdata;
    end
  end
    // leda W396 S_1C_R on

// --------------------------------
// FIFO Pointer adjustment
// --------------------------------
  assign wptr_mod = wptr[PTR_WIDTH-2:0];
  assign rptr_mod = rptr[PTR_WIDTH-2:0];

  assign rptr_plus1 = rptr + {{(PTR_WIDTH-1){`L}},`H}; // rptr_plus1 = rptr + 1
  assign rptr_plus1_mod = rptr_plus1[PTR_WIDTH-2:0];

// --------------------------------
// Empty Flag Generation.
// --------------------------------
  assign fifo_empty_c = (wptr_rsync == rptr) ? 1'b1 : 1'b0;
  assign fifo_aempty  = (wptr_rsync == rptr_plus1) ? 1'b1 : 1'b0;
  assign fifo_empty   = fifo_empty_c | fifo_empty_r;

  always @(posedge clk_rd_i or negedge rst_clk_rd_n)
    if (!rst_clk_rd_n)
      fifo_empty_r <= `H;
    else
      fifo_empty_r <= fifo_empty_c;

// --------------------------------
// Read Pointer Generation and sync'd to Write clock domain.
// --------------------------------

  assign incr_ptr = read_e & !fifo_empty_c;

  assign rst_rd_async_n  = rst_clk_rd_n;
  assign rst_wr_async_n  = rst_clk_wr_n;
  assign rst_rd_sync_n   = !clr_rptr;
  assign rst_wr_sync_n   = !clr_wptr;

  // WIDTH=PTR_WIDTH; OFFSET=0; REG_COUNT_D=0; F_SYNC_TYPE=2
  // TST_MODE=0; VERIF_EN=1; PIPE_DELAY=0
  DWC_gmac_bcm24
   #(PTR_WIDTH,0,0,2,0,2,0,1,1) rptr_syncd_to_wrclk (
    .clk_s    ( clk_rd_i ),
    .rst_s_n  ( rst_rd_async_n ),
    .init_s_n ( rst_rd_sync_n ),
    .en_s     ( incr_ptr ),
    .count_s  ( rptr ),  
    .offset_count_s  ( dumy_rd_ofst),  

    .clk_d    ( clk_wr_i ),
    .rst_d_n  ( rst_wr_async_n ),
    .init_d_n ( rst_wr_sync_n ),
    .test     ( `L ),
    .count_d  ( rptr_wsync )  
  );

// --------------------------------
// Write Pointer Generation and sync'd to Read clock domain.
// --------------------------------

  // WIDTH=PTR_WIDTH; OFFSET=0; REG_COUNT_D=0; F_SYNC_TYPE=2
  // TST_MODE=0; VERIF_EN=1; PIPE_DELAY=0
  DWC_gmac_bcm24
   #(PTR_WIDTH,0,0,2,0,2,0,1,1) wptr_syncd_to_rdclk (
    .clk_s    ( clk_wr_i ),
    .rst_s_n  ( rst_wr_async_n ),
    .init_s_n ( rst_wr_sync_n ),
    .en_s     ( write_e ),
    .count_s  ( wptr ),  
    .offset_count_s  ( dumy_wr_ofst),  

    .clk_d    ( clk_rd_i ),
    .rst_d_n  ( rst_rd_async_n ),
    .init_d_n ( rst_rd_sync_n ),
    .test     ( `L ),
    .count_d  ( wptr_rsync )  
  );

// --------------------------------
// Full Flag Generation.
// --------------------------------
  assign fifo_full = ((wptr[PTR_WIDTH-2:0] == rptr_wsync[PTR_WIDTH-2:0]) &&
                      (wptr[PTR_WIDTH-1] != rptr_wsync[PTR_WIDTH-1])) ? 1'b1 : 1'b0;

// --------------------------------
// FIFO Read Data Output
// --------------------------------
  always @(posedge clk_rd_i or negedge rst_clk_rd_n)
    if (!rst_clk_rd_n)
      rdata <= {DATA_WIDTH{`L}};
    else
      if (!fifo_empty_c & !fifo_aempty & read_e)
        rdata <= mem[rptr_plus1_mod];
      else
        if (!fifo_empty_c)
          rdata <= mem[rptr_mod];

endmodule
