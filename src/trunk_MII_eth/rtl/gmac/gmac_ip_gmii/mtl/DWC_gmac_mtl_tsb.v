//--------------------------------------------------------------------------//
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
//--------------------------------------------------------------------------//
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2007/11/02 $
// File Version     :        $Revision: #16 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                  //
// MTL Transmit Synchronisation Block (DWC_gmac_mtl_tsb.v)                  //
// This block is used for sychronising the read and write pointers of the   //
// Txdata FIFO to write and read clock domains respectively.This block also //
// sychronizes other control signals which cross the clock domain.          //
//--------------------------------------------------------------------------//

module DWC_gmac_mtl_tsb (
        
        // Clocks and reset
        clk_app_i,
                         clk_tx_i,
                         rst_clk_app_n,
                         rst_clk_tx_n,
                         twc_wrptr_2_rd,
                         twc_dbg_sts,
                         tsb_wrptr_2_rd_ack,
                         // Outputs to TWC Block
                         sw_flush_done_sync,
                         sts_wr_done_sync,
                         frame_abort_sync,
                         rdptr_2_wr_sync,
                         sca_txfifoflush,
                         sca_txthreshctrl,
                         sca_str_n_fwd,
                         // Control and status register signals
                         omr_mtl_ctrl,
                         omr_wr_byte0,
                         omr_wr_byte1,
                         omr_wr_byte2,
                         sca_mtl_tx_dbg_sts,
                         // Inputs from TRC Block
                         trc_sw_flush_done,
                         trc_sts_wr_done,
                         trc_abort_detect,
                         trc_rdptr_2_wr,
                         trc_dstatus,
                         // Outputs to TRC Block
                         tsb_wrptr_2_rd_sync_ack,
                         wrptr_2_rd_sync
                         );
        
// Input and ouput potr declarations

  input                          clk_app_i; // Application Clock
  input                          clk_tx_i;  // MAC Transmit Clock

  input                          rst_clk_app_n;// Active low reset
                                               // synchronous to clk_app_i
  input                          rst_clk_tx_n; // Active low reset
                                               // synchronous to clk_tx_i
  
// Inputs from TWC Block


  input  [`TX_FIFO_PTR_WIDTH:0]  twc_wrptr_2_rd;    // Write pointer and Tx FIFO
                                                    // flush to be sync'd
                                                    // to read clock domain(i.e
                                                    // (MAC Tx clock domain)
  input  [1:0]                   twc_dbg_sts;        // TWC Debug info
  
  output                         tsb_wrptr_2_rd_ack;// ACK for the write pointer
                                                    // and FIFO flush sync'd to 
                                                    // Tx clock 
  

// Outputs to TWC Block  
  output                         sw_flush_done_sync;// S/W Flush done signal from
                                                    // TxFIFO read control logic
                                                    // indicating completion of 
                                                    // flush operation.
						    
  output                         sts_wr_done_sync;// Status write done from read
                                                  // TxFIFO read control logic
                                                  // indicating completion of
                                                  // frame transmission to GMAC.
						  
  output                         frame_abort_sync;// Frame abort status from
                                                  // MAC is synchronised to 
                                                  // write clock domain.
						  
  output [`TX_FIFO_PTR_WIDTH-1:0]   rdptr_2_wr_sync;// Read pointer from MAC Tx
                                                    // clock domain sync'd to 
                                                    // Application clock.
						    
  output                         sca_txfifoflush; // TX FIFO Flush sync'd to
                                                  // Application clock  
						  
  output [2:0]                   sca_txthreshctrl;// Frame transmission to MAC
                                                  // starts when the number of 
                                                  // bytes of a frame in Txdata 
                                                  // FIFO,crosses this threshold
						  
  output                         sca_str_n_fwd;   // Signal requesting the MTL
                                                  // to start frame transmission
                                                  // only when a entire frame 
                                                  // resides in the FIFO.
						  
// Control and Status register Signals
  input  [13:0]                  omr_mtl_ctrl;// Operation mode register 
                                              // fields that control the MTL
					      
  input                          omr_wr_byte0;// Byte0 of Operation mode 
                                              // reg is written
					      
  input                          omr_wr_byte1;// Byte1 of Operation mode 
                                              // reg is written
					      
  input                          omr_wr_byte2;// Byte2 of Operation mode 
                                              // reg is written
  output [4:0]                   sca_mtl_tx_dbg_sts;// Sync'ed status of MTL Tx path

// TRC Block Interface
  input                          trc_sw_flush_done;// Signal indicates TRC has
                                                   // completed S/W flush 
                                                   // operation
						   
  input                          trc_sts_wr_done;  // Status write towards 
                                                   // Status FIFO
						   
  input                          trc_abort_detect; // Signal indicates Frame 
                                                   // aborted by GMAC.
						   
  input  [`TX_FIFO_PTR_WIDTH-1:0]   trc_rdptr_2_wr;// Read pointer from MAC Tx
                                                   // clock domain to be sync'd 
                                                   // to Application clock.
  input  [2:0]                    trc_dstatus;     // Debug signals from TRC
						   
  output                            tsb_wrptr_2_rd_sync_ack; // Ack indicates 
                                                             // write pointer 
                                                             // sync'd to Tx clock.
  
  output [`TX_FIFO_PTR_WIDTH:0]     wrptr_2_rd_sync;// Write pointer and Tx FIFO
                                                    // flush sync'd to MAC TX
                                                    // clock domain.
      
// Wire declarations
  
 
  reg       omr_wr_byte2_r;   // registered Byte2 write pulse of 
                              // operation mode reg

  wire      dummy_ack_s; // dummy port connect wires
  wire      dummy_ack_d; // dummy port connect wires

  wire      rst_clk_app_async_n; // Reset for the async reset pins of f/f in clk_app domain
  wire      rst_clk_app_sync_n;  // Reset for the sync reset pins of f/f in clk_app domain
  wire      rst_clk_tx_async_n;  // Reset for the async reset pins of f/f in clk_tx domain
  wire      rst_clk_tx_sync_n;   // Reset for the sync reset pins of f/f in clk_tx domain

// Reset Assignments
  assign rst_clk_app_async_n = rst_clk_app_n;
  assign rst_clk_app_sync_n  = `H;
  assign rst_clk_tx_async_n  = rst_clk_tx_n;
  assign rst_clk_tx_sync_n   = `H;


// TRC Block Synchronizers

// S/W FLush done Synchronizer
  DWC_gmac_bcm22
   #(0,2,0,2,0) sw_flush_done_syzr (
                           .clk_s    (clk_tx_i),
                           .rst_s_n  (rst_clk_tx_async_n),
                           .init_s_n (rst_clk_tx_sync_n),
                           .event_s  (trc_sw_flush_done),
                           .clk_d    (clk_app_i),
                           .rst_d_n  (rst_clk_app_async_n),
                           .init_d_n (rst_clk_app_sync_n),
                           .event_d  (sw_flush_done_sync),
                           .test     (`L)
                          );

// Status Write done Synchronizer
  DWC_gmac_bcm22
   #(0,2,0,2,0) sts_wr_done_syzr (
                         .clk_s    (clk_tx_i),
                         .rst_s_n  (rst_clk_tx_async_n),
                         .init_s_n (rst_clk_tx_sync_n),
                         .event_s  (trc_sts_wr_done),
                         .clk_d    (clk_app_i),
                         .rst_d_n  (rst_clk_app_async_n),
                         .init_d_n (rst_clk_app_sync_n),
                         .event_d  (sts_wr_done_sync),
                         .test     (`L)
                        );

// Frame abort detect Synchronizer
  DWC_gmac_bcm22
   #(0,2,0,2,0) frame_abort_syzr(
                             .clk_s    (clk_tx_i),
                             .rst_s_n  (rst_clk_tx_async_n),
                             .init_s_n (rst_clk_tx_sync_n),
                             .event_s  (trc_abort_detect),
                             .clk_d    (clk_app_i),
                             .rst_d_n  (rst_clk_app_async_n),
                             .init_d_n (rst_clk_app_sync_n),
                             .event_d  (frame_abort_sync),
                             .test     (`L)
                            );

// Bus Synchronizer for TxData Read pointer
  DWC_gmac_bus_synczr
   #((`TX_FIFO_PTR_WIDTH),2,0,2) rdptr_2_wr_syzr (
    .clk_s    (clk_tx_i),
    .rst_s_n  (rst_clk_tx_async_n),
    .init_s_n (rst_clk_tx_sync_n),
    .data_s   (trc_rdptr_2_wr),
    .ack_s    (dummy_ack_s),
    .clk_d    (clk_app_i),
    .rst_d_n  (rst_clk_app_async_n),
    .init_d_n (rst_clk_app_sync_n),
    .data_d   (rdptr_2_wr_sync),
    .ack_d    (dummy_ack_d),
    .test     (`L)
  );

// Debug signals synchronisation


  DWC_gmac_bcm21
   #(3,2,0,2) trc_dbg_sts_app_syzr (
                           .clk_d    (clk_app_i),
                           .rst_d_n  (rst_clk_app_async_n),
                           .init_d_n (rst_clk_app_sync_n),
                           .data_s   (trc_dstatus),
                           .test     (`L),
                           .data_d   (sca_mtl_tx_dbg_sts[4:2])
                          );




  assign sca_mtl_tx_dbg_sts[1:0] = twc_dbg_sts;

// Control and Status register Signal Synchronisation


  

  
  // registered omr(operation mode register) byte2 write signal
  always @(`APP_RST_MODE) begin
   if (~rst_clk_app_n)
     omr_wr_byte2_r <= `L;
   else
     omr_wr_byte2_r <= omr_wr_byte2;
  end
  assign sca_str_n_fwd = omr_mtl_ctrl[13];
  assign sca_txfifoflush = omr_mtl_ctrl[12] & omr_wr_byte2_r;
  assign sca_txthreshctrl= omr_mtl_ctrl[11:9]; 



// TWC Block Synchronisers




 





  DWC_gmac_bus_synczr
   #((`TX_FIFO_PTR_WIDTH+1),2,0,2) wrptr_2_rd_syzr (
    .clk_s    (clk_app_i),
    .rst_s_n  (rst_clk_app_async_n),
    .init_s_n (rst_clk_app_sync_n),
    .data_s   (twc_wrptr_2_rd),
    .ack_s    (tsb_wrptr_2_rd_ack),
    .clk_d    (clk_tx_i),
    .rst_d_n  (rst_clk_tx_async_n),
    .init_d_n (rst_clk_tx_sync_n),
    .data_d   (wrptr_2_rd_sync),
    .ack_d    (tsb_wrptr_2_rd_sync_ack),
    .test     (`L)
  );

endmodule
