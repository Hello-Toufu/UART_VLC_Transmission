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
// File Version     :        $Revision: #11 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// Asynchronous Loopback FIFO (DWC_gmac_mre_lpbk.v)
//
// DESCRIPTION:
// Asynchronous FIFO which allows push and pop operations only when valid
// frames are written or read. Read and write pointers are not incremented
// during IFG. The Starting of read is offset by 2/4 clocks from the corresponding
// write at the start of each frame.
//--------------------------------------------------------------------------

  module DWC_gmac_mre_lpbk (
    // Write Interface
    clk_tx_i,
    rst_clk_tx_n,
    wdata,
    
    scr_portselect,
    sct_portselect,
    
    // Read Interface
    clk_rx_i,
    rst_clk_rx_n,
    rdata
  );
  
// Parameters WIDTH
   parameter    DATA_WIDTH = 10;
   parameter    PTR_WIDTH = 3;

// Input and Output declarations.
  // Write Interface
  input                     clk_tx_i;             // GMAC Tx clock
  input                     rst_clk_tx_n;         // reset synchronous to clk_tx_i
  input  [DATA_WIDTH-1:0]   wdata;                // (G)MII signal inputs
  
  input                     scr_portselect;       // Port select Input from GMAC 
                                                  // CSR sync'd to Rx clock.
                                                  
  input                     sct_portselect;       // Port select Input from GMAC 
                                                  // CSR sync'd to Tx clock.
  
  
  // Read Interface
  input                     clk_rx_i;             // GMAC Rx clock
  input                     rst_clk_rx_n;         // reset synchronous to clk_rx_i 

  output [DATA_WIDTH-1:0]   rdata;                // (G)MII signal ouputs 

// local wire and register declarations.
  reg  [PTR_WIDTH-1:0]   rptr;                    // Read pointer   
  reg  [PTR_WIDTH-1:0]   wptr;                    // Write pointer   
  reg                    incr_wr_ptr_r;           // Increment write pointer
                                                  // in GMAC Tx clock domain
                                                  
  reg                    rd_strt;                 // signal indicates start of read
                                                  // operation.
                                                  

  reg  [DATA_WIDTH-1:0]  mem[4:0]; // Register memory.

  
  wire                   incr_wr_ptr;             // Increment write pointer 
  wire                   incr_rd_ptr;             // Increment read pointer
  wire  [PTR_WIDTH-1:0]  rptr_pls1;               // read pointer + 1.
  wire  [PTR_WIDTH-1:0]  wptr_pls1;               // write pointer + 1.
  wire  [PTR_WIDTH-1:0]  rptr_nxt;                // next read pointer
  wire  [PTR_WIDTH-1:0]  wptr_nxt;                // next write pointer
  wire                   incr_wr_ptr_s;           // increment write pointer 
                                                  // double sync'd
                                                  // to GMAC Rx clock domain.
                                                  
  wire  [DATA_WIDTH-1:0] rdata_int;               // Read data from the async FIFO
  wire                   rd_offset;               // Initial Read pointer offset ctrl.           
  wire                   rst_clk_rx_async_n;  // Reset for the async reset pins of f/f in clk_rx domain
  wire                   rst_clk_rx_sync_n;   // Reset for the sync reset pins of f/f in clk_rx domain
   

// --------------------------------
// Register FIFO
// --------------------------------
  always @(`TX_RST_MODE) begin
    if (!rst_clk_tx_n) begin
      mem[0] <= {DATA_WIDTH{1'b0}};
      mem[1] <= {DATA_WIDTH{1'b0}};
      mem[2] <= {DATA_WIDTH{1'b0}};
      mem[3] <= {DATA_WIDTH{1'b0}};
      mem[4] <= {DATA_WIDTH{1'b0}};
    end
    else begin
      case (wptr)
        3'b000: mem[0] <= wdata; 
        3'b001: mem[1] <= wdata; 
        3'b010: mem[2] <= wdata; 
        3'b011: mem[3] <= wdata; 
        default: mem[4] <= wdata; 

      endcase
    end
  end
  
  assign rdata_int = (rptr == 3'b000) ? mem[0] : 
                     (rptr == 3'b001) ? mem[1] : 
                     (rptr == 3'b010) ? mem[2] : 
                     (rptr == 3'b011) ? mem[3] : mem[4]; 


  assign rdata = (rd_offset | rd_strt) ? rdata_int : {DATA_WIDTH{`L}};                    

// --------------------------------
// Binary Read Pointer Generation.
// --------------------------------
  
  assign rptr_pls1 = rptr + 1;
  // Read Pointer Increment during valid frame reception.
  assign incr_rd_ptr = (rdata[DATA_WIDTH-1:DATA_WIDTH-2] != 2'b00);
  
  assign rptr_nxt = (rptr == 3'b100) ? 3'b000 : rptr_pls1; 


  always @(`RX_RST_MODE) begin
    if (!rst_clk_rx_n) begin
      rptr <= {PTR_WIDTH{1'b0}};
      rd_strt <= `L;
    end  
    else if (incr_rd_ptr & rd_offset & !rd_strt) begin
      // Increment the read pointer on every read and FIFO not empty
      rptr <= rptr_nxt; 
      rd_strt <= `H;
    end  
    else if (incr_rd_ptr & rd_strt)
      rptr <= rptr_nxt; 
    else
      rd_strt <= `L;
  end


// ---------------------------------------
// Binary Write Pointer Generation.
// ---------------------------------------
  assign wptr_pls1 = wptr + 1; 
  
  // Write Pointer Increment during valid frame transmission.
  assign incr_wr_ptr = (wdata[DATA_WIDTH-1:DATA_WIDTH-2] != 2'b00);
  
  assign wptr_nxt = (wptr == 3'b100) ? 3'b000 : wptr_pls1; 

  
  always @(`TX_RST_MODE) begin
    if (!rst_clk_tx_n)
      wptr <= {PTR_WIDTH{1'b0}};
    else begin
      if (incr_wr_ptr) 
        wptr <= wptr_nxt; 
    end
  end

  //---------------------------------------------------
  // Increment write pointer synchronised to read clock
  //---------------------------------------------------

  always @(`TX_RST_MODE) begin
    if (!rst_clk_tx_n)
      incr_wr_ptr_r <= `L;
    else
      incr_wr_ptr_r <= incr_wr_ptr;
  end  

  assign rst_clk_rx_async_n  = rst_clk_rx_n;
  assign rst_clk_rx_sync_n   = `H;
  
  DWC_gmac_bcm21
   #(1,2,0,2) incr_wr_ptr_synzr (
                             .clk_d       (clk_rx_i),
                             .rst_d_n     (rst_clk_rx_async_n),
                             .init_d_n    (rst_clk_rx_sync_n),
                             .data_s      (incr_wr_ptr_r),
                             .test        (1'b0),
                             .data_d      (incr_wr_ptr_s)  
                            );


  assign rd_offset = incr_wr_ptr_s; 

  
endmodule
