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
// File Version     :        $Revision: #25 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                  //
// MTL Receive Synchronisation Block (DWC_gmac_mtl_rsb.v)                   //
// This block is used for sychronising the read and write pointers of the   //
// Rxdata FIFO to write and read clock domains respectively.This block also //
// sychronizes other control signals which cross the clock domain.          //
//--------------------------------------------------------------------------//

module DWC_gmac_mtl_rsb (
       
        // Clocks and reset
        clk_app_i,
                         clk_tx_i,
                         clk_rx_i,
                         rst_clk_app_n,
                         rst_clk_tx_n,
                         rst_clk_rx_n,
                         // Inputs from RWC Block
                         rwc_fifo_ovf,
                         rwc_sts_wrtn,
                         rwc_wrptr_2_rd,
                         rwc_dbg_sts,
                         rwc_flowctrl,
                         // Outputs to RWC Block
                         rdptr_2_wr_sync,
                         rsb_ack_wrptr_2_rd,
                         // Inputs from RRC Block
                         rrc_rdptr_2_wr,
                         rrc_dbg_sts,
                         // Outputs to RRC Block
                         wrptr_2_rd_sync,
                         rsb_wrptr_2_rd_syncd,
                         rwc_sts_wrtn_sync,
                         fifo_ovflo,
                         // Output to TRC Block,
                         sct_flowctrl,
                         // Control and Status register signals
                         sca_mtl_rx_dbg_sts,
                         omr_mtl_ctrl,
                         omr_wr_byte0,
                         omr_wr_byte1,
                         scr_rxthreshctrl,
                         scr_thresh_act,
                         scr_thresh_deact,
                         scr_hwflowctrl_e,
                         scr_fwd_runt_e,
                         scr_fwd_err_frame,
                         scr_str_n_fwd
                         );

// Clocks and reset
  input                            clk_app_i;  // Application clock    
  input                            clk_tx_i;   // MAC Transmit Clock
  input                            clk_rx_i;   // MAC Receive Clock
  
  
  input                            rst_clk_app_n;// Active low reset
                                                 // synchronous to clk_app_i
  input                            rst_clk_tx_n;// Active low reset
                                                // synchronous to clk_tx_i
  input                            rst_clk_rx_n;// Active low reset
                                                // synchronous to clk_rx_i


// Inputs from RWC Block
  input                            rwc_fifo_ovf;// Rx data FIFO overflow
  input                            rwc_sts_wrtn;  // MAC Rx status write signal
  input  [`RX_FIFO_PTR_WIDTH:0]    rwc_wrptr_2_rd;// Write pointer of Rx data
                                                  // FIFO to be sync'd to 
                                                  // application clock
  input [2:0]                      rwc_dbg_sts;    // Debug status from RWC
  input                            rwc_flowctrl;  // Hardware based flow control
                                                  // activation signal to MAC
  
// Outputs to RWC Block  
  output [`RX_FIFO_PTR_WIDTH:0]    rdptr_2_wr_sync;// Read pointer of Rx data 
                                                   // FIFO sync'd to MAC Rx clock
  output                           rsb_ack_wrptr_2_rd;// Synchronisation ACK
                                                      // indicating write pointer
                                                      // is synchronised to 
                                                      // app clock

// Inputs from RRC Block
  input  [`RX_FIFO_PTR_WIDTH:0]    rrc_rdptr_2_wr;// Read pointer to be sync'd to
                                                  // MAC RX clock domain.
  input [1:0]                      rrc_dbg_sts;   // FSM status from RRC

// Outputs to RRC Block
  output [`RX_FIFO_PTR_WIDTH:0]    wrptr_2_rd_sync;   // Write pointer of Rx data
                                                      // FIFO sync'd to app clock
  output                           rsb_wrptr_2_rd_syncd;// Signal indicating write
                                                        // pointer is sync'd to 
                                                        // app clock.
  output                           rwc_sts_wrtn_sync;// MAC Rx status write 
                                                     // signal sync'd to app clock
  output                           fifo_ovflo;    // FIFO overflow pulse sync'd to
                                                  // application clock.

// Output to MAC
  output                           sct_flowctrl;  // Hardware based flow control
                                                  // activation signal sync'd to 
                                                  // MAC Tx clock.
  output [4:0]                sca_mtl_rx_dbg_sts; // Sync'ed Debug Status

// Control and Status register signals
  input [17:0] omr_mtl_ctrl; //Operation mode register fields that control the MTL
  input                            omr_wr_byte0;  // Byte0 of Operation mode 
                                                  // reg is written
  input                            omr_wr_byte1;  // Byte1 of Operation mode 
                                                  // reg is written

                                                    // frames with checksum error need not be dropped
  output  [1:0]                    scr_rxthreshctrl;// Signal indicating 
                                                    // threshold for fill level
                                                    // on Rxdata FIFO.
  output  [2:0]                    scr_thresh_act;  // Signal indicating 

                                                    // threshold for fill level
                                                    // on Rxdata FIFO to trigger
                                                    // flow control.
  output  [2:0]                    scr_thresh_deact;// Signal indicating 

                                                    // threshold for fill level
                                                    // on Rxdata FIFO to 
                                                    // de-activate flow control
  output                           scr_hwflowctrl_e;// Hardware flow control 
                                                    // enable
  output                           scr_fwd_runt_e;  // Enable forwarding of 
                                                    // undersized frames with 
                                                    // no error.
  output                           scr_fwd_err_frame;// Forward frames with errors
                                                     // when this bit is asserted.
  output                           scr_str_n_fwd;    // store and forward bit from
                                                     // operation mode register

// Wire Declarations  
  wire                             sct_rwc_flowctrl; // rwc_flowctrl synced to tx clock
  wire                             omr_wr_byte1_sync;
  wire                             omr_wr_byte0_sync;
  wire                             thresh_act_msb_sync; // MSB of flow control 
                                                        // activation threshold
  wire                             thresh_deact_msb_sync;// MSB of flow control 
                                                         // deactivation threshold
  reg  [4:0]                       omr_byte_1_rx; // operation mode reg byte1 
                                                  // control signal sync'd to
                                                  // MAC Rx clock
  reg  [3:0]                       omr_byte_0_rx; // operation mode reg byte0 
                                                  // control signal sync'd to
                                                  // MAC Rx clock

  wire        dummy_ack_s; // dummy port connect wires
  wire        dummy_ack_d; // dummy port connect wires

  wire      rst_clk_app_async_n; // Reset for the async reset pins of f/f in clk_app domain
  wire      rst_clk_app_sync_n;  // Reset for the sync reset pins of f/f in clk_app domain
  wire      rst_clk_rx_async_n;  // Reset for the async reset pins of f/f in clk_rx domain
  wire      rst_clk_rx_sync_n;   // Reset for the sync reset pins of f/f in clk_rx domain
  wire      rst_clk_tx_async_n;  // Reset for the async reset pins of f/f in clk_tx domain
  wire      rst_clk_tx_sync_n;   // Reset for the sync reset pins of f/f in clk_tx domain

  wire [2:0]     sca_rwc_dbg_sts;    // Sync'ed Debug Status
  wire           sca_rwc_flowctrl;  // Sync'ed Debug Status
  wire [1:0]     sca_rrc_dbg_sts;   // Sync'ed Debug Status
  wire [1:0]     rx_fifo_status;    // encoded RxFIFO status
  wire [4:0]     sca_mtl_rx_dbg_sts; // Sync'ed Debug Status

// Reset Assignments
  assign rst_clk_app_async_n = rst_clk_app_n;
  assign rst_clk_app_sync_n  = `H;
  assign rst_clk_rx_async_n  = rst_clk_rx_n;
  assign rst_clk_rx_sync_n   = `H;
  assign rst_clk_tx_async_n  = rst_clk_tx_n;
  assign rst_clk_tx_sync_n   = `H;

// RWC Block Synchronizers

// FIFO Overflow Snchroniser
  DWC_gmac_bcm22
   #(0,2,0,2,0) fifo_ovf_syzr_app (
                      .clk_s    (clk_rx_i),
                      .rst_s_n  (rst_clk_rx_async_n),
                      .init_s_n (rst_clk_rx_sync_n),
                      .event_s  (rwc_fifo_ovf),
                      .clk_d    (clk_app_i),
                      .rst_d_n  (rst_clk_app_async_n),
                      .init_d_n (rst_clk_app_sync_n),
                      .event_d  (fifo_ovflo_sync),
                      .test     (`L)
                     );




  assign fifo_ovflo = fifo_ovflo_sync;



// Bus Synchroniser for Rxdata FIFO Write pointer
  DWC_gmac_bus_synczr
   #((`RX_FIFO_PTR_WIDTH+2),2,0,2) wrptr_2_rd_syzr (
    .clk_s    (clk_rx_i),
    .rst_s_n  (rst_clk_rx_async_n),
    .init_s_n (rst_clk_rx_sync_n),
    .data_s   ({rwc_sts_wrtn,rwc_wrptr_2_rd}),
    .ack_s    (rsb_ack_wrptr_2_rd),
    .clk_d    (clk_app_i),
    .rst_d_n  (rst_clk_app_async_n),
    .init_d_n (rst_clk_app_sync_n),
    .data_d   ({rwc_sts_wrtn_sync,wrptr_2_rd_sync}),
    .ack_d    (rsb_wrptr_2_rd_syncd),
    .test     (`L)
  );

// Flow Control 
  DWC_gmac_bcm21
   #(1,2,0,2) flowctrl_syzr (
                           .clk_d    (clk_tx_i),
                           .rst_d_n  (rst_clk_tx_async_n),
                           .init_d_n (rst_clk_tx_sync_n),
                           .data_s   (rwc_flowctrl),
                           .test     (`L),
                           .data_d   (sct_rwc_flowctrl)
                          );




assign sct_flowctrl = sct_rwc_flowctrl;


// RRC Block Synchronizers
// Bus Synchroniser for RxData Read pointer
  DWC_gmac_bus_synczr
   #((`RX_FIFO_PTR_WIDTH+1),2,0,2) rdptr_2_wr_syzr (
    .clk_s    (clk_app_i),
    .rst_s_n  (rst_clk_app_async_n),
    .init_s_n (rst_clk_app_sync_n),
    .data_s   (rrc_rdptr_2_wr),
    .ack_s    (dummy_ack_s),
    .clk_d    (clk_rx_i),
    .rst_d_n  (rst_clk_rx_async_n),
    .init_d_n (rst_clk_rx_sync_n),
    .data_d   (rdptr_2_wr_sync),
    .ack_d    (dummy_ack_d),
    .test     (`L)
  );

// Control and Status Register Sychronisation





  DWC_gmac_bcm22
   #(0,2,0,2,0) opr_mode_reg_byte1_wr_sync_clk_app (
                                   .clk_s    (clk_app_i),
                                   .rst_s_n  (rst_clk_app_async_n),
                                   .init_s_n (rst_clk_app_sync_n),
                                   .event_s  (omr_wr_byte1),
                                   .clk_d    (clk_rx_i),
                                   .rst_d_n  (rst_clk_rx_async_n),
                                   .init_d_n (rst_clk_rx_sync_n),
                                   .event_d  (omr_wr_byte1_sync),
                                   .test     (`L)
                                  );


  DWC_gmac_bcm22
   #(0,2,0,2,0) opr_mode_reg_byte0_wr_sync_clk_app (
                                   .clk_s    (clk_app_i),
                                   .rst_s_n  (rst_clk_app_async_n),
                                   .init_s_n (rst_clk_app_sync_n),
                                   .event_s  (omr_wr_byte0),
                                   .clk_d    (clk_rx_i),
                                   .rst_d_n  (rst_clk_rx_async_n),
                                   .init_d_n (rst_clk_rx_sync_n),
                                   .event_d  (omr_wr_byte0_sync),
                                   .test     (`L)
                                  );


  DWC_gmac_bcm21
   #(1,2,0,2) thresh_act_msb_sync_clk_rx (
                                   .clk_d    (clk_rx_i),
                                   .rst_d_n  (rst_clk_rx_async_n),
                                   .init_d_n (rst_clk_rx_sync_n),
                                   .data_s   (omr_mtl_ctrl[15]),
                                   .test     (`L),
                                   .data_d   (thresh_act_msb_sync)
                                  );


  DWC_gmac_bcm21
   #(1,2,0,2) thresh_deact_msb_sync_clk_rx (
                                   .clk_d    (clk_rx_i),
                                   .rst_d_n  (rst_clk_rx_async_n),
                                   .init_d_n (rst_clk_rx_sync_n),
                                   .data_s   (omr_mtl_ctrl[14]),
                                   .test     (`L),
                                   .data_d   (thresh_deact_msb_sync)
                                  );






always @(`RX_RST_MODE) begin
  if (~rst_clk_rx_n)
    omr_byte_1_rx <= {5{`L}};
  else
    if (omr_wr_byte1_sync)
      omr_byte_1_rx <= omr_mtl_ctrl[8:4];
end

assign  scr_thresh_act      = {thresh_act_msb_sync,omr_byte_1_rx[2:1]}; 
assign  scr_thresh_deact    = {thresh_deact_msb_sync,omr_byte_1_rx[4:3]}; 

assign  scr_hwflowctrl_e    = omr_byte_1_rx[0];

always @(`RX_RST_MODE) begin
  if (~rst_clk_rx_n)
    omr_byte_0_rx <= {4{`L}};
  else
    if (omr_wr_byte0_sync)
      omr_byte_0_rx <= omr_mtl_ctrl[3:0];
end

assign  scr_fwd_runt_e      = omr_byte_0_rx[2];
assign  scr_fwd_err_frame   = omr_byte_0_rx[3];
assign  scr_rxthreshctrl    = omr_byte_0_rx[1:0];

  DWC_gmac_bcm21
   #(1,2,0,2) rx_str_n_fwd_sync_clk_rx (
                                       .clk_d    (clk_rx_i),
                                       .rst_d_n  (rst_clk_rx_async_n),
                                       .init_d_n (rst_clk_rx_sync_n),
                                       .data_s   (omr_mtl_ctrl[16]),
                                       .test     (`L),
                                       .data_d   (scr_str_n_fwd)
                                      );

// Debug signals synchronisation


  DWC_gmac_bcm21
   #(3,2,0,2) rwc_dbg_sts_app_syzr (
                           .clk_d    (clk_app_i),
                           .rst_d_n  (rst_clk_app_async_n),
                           .init_d_n (rst_clk_app_sync_n),
                           .data_s   (rwc_dbg_sts),
                           .test     (`L),
                           .data_d   (sca_rwc_dbg_sts)
                          );




  DWC_gmac_bcm21
   #(1,2,0,2) flowctrl_app_syzr (
                           .clk_d    (clk_app_i),
                           .rst_d_n  (rst_clk_app_async_n),
                           .init_d_n (rst_clk_app_sync_n),
                           .data_s   (rwc_flowctrl),
                           .test     (`L),
                           .data_d   (sca_rwc_flowctrl)
                          );




  assign sca_rrc_dbg_sts = rrc_dbg_sts;

  assign rx_fifo_status = sca_rwc_dbg_sts[2] ? 2'b00 :          // RxFIFO empty
                              sca_rwc_flowctrl ? 2'b10 :       // Flow Control active
                                  sca_rwc_dbg_sts[1] ? 2'b11 :  // RxFIFO Full
                                                      2'b01;   // Flow control inactive

  assign sca_mtl_rx_dbg_sts = {rx_fifo_status, sca_rrc_dbg_sts, sca_rwc_dbg_sts[0]};

endmodule
