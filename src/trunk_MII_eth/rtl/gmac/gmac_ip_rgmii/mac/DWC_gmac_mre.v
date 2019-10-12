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
// Date             :        $Date: 2007/11/02 $
// File Version     :        $Revision: #15 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// dwc_gmac_mre (DWC_gmac_mre.v)
//
// DESCRIPTION:
// GMAC Receive Engine (MRE)
// This module combines RPE, CRX and Async FIFO blocks.
//--------------------------------------------------------------------------

module DWC_gmac_mre (

        // Clocks and resets 
        clk_rx_i,
                     clk_tx_i,
                     rst_clk_rx_n,
                     rst_clk_tx_n,
                     // GMII Interface
                     gmii_rxd_i,
                     gmii_rxdv_i,
                     gmii_rxer_i,
                     gmii_txd_o,
                     gmii_txen_o,
                     gmii_txer_o,
                     sct_portselect,
                     // Receive Control signals
                     scr_col,
                     scr_autocrcpadstrip,
                     scr_loopback_mode,
                     scr_disreceiveown,
                     scr_receive_e,
                     scr_duplexmode,
                     scr_portselect,
                     scr_jumboframe_e,
                     scr_watchdog_e,
                     scr_vlantag,
                     // MRC Interface
                     rpe_data,
                     rpe_data_valid,
                     rpe_sof,
                     rpe_eof,
                     rpe_padcrc_strip,
                     rpe_payload_start,
                     rpe_fsm_sts,
                     rpe_status,
                     rpe_status_valid,
                     rpe_rcvd_frame_size,
                     crx_dacrc
                     );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

  // Clocks and resets
  input                       clk_rx_i;          // GMII/MII Transmit clock      
  input                       clk_tx_i;          // GMII/MII Receive Clock
  input                       rst_clk_tx_n;    // Active Low reset synchronous
                                                 // to clk_tx_i.
                                                 
  input                       rst_clk_rx_n;    // Active Low reset synchronous
                                                 // to clk_rx_i.
  
  // GMII Interface
  input [`RXD_WIDTH-1:0]      gmii_rxd_i;        // 8bit receive data
  input                       gmii_rxdv_i;       // receive enable for gmii_rxd_i
  input                       gmii_rxer_i;       // receive error, when gmii_rxdv_i
                                                 // is asserted.
                                                 
  input [`TXD_WIDTH-1:0]      gmii_txd_o;        // GMII Transmit data.
  input                       gmii_txen_o;       // GMII Transmit data enable.
  input                       gmii_txer_o;       // GMII Transmit Error.
  
  input                       sct_portselect;    // Port select GMII-0, MII-1.
                                                 // sync'd to Tx clock
  // Receive Control Signals
  input                       scr_col;           // collision detected on medium
  input                       scr_autocrcpadstrip;  // strips padding and CRC 
  input                       scr_loopback_mode; // receiver loops back gmii_txd_o
  input                       scr_disreceiveown; // Disable reception when 
                                                 // gmii_txen_o is asserted.
                                                 
  input                       scr_receive_e;     // enables receive state machine
  input                       scr_duplexmode;    // set on full duplex mode
  input                       scr_portselect;    // Port select GMII-0, MII-1.
                                                 // sync'd to Tx clock
  input                       scr_jumboframe_e;  // max upto 9000(9018) byte frames
  input                       scr_watchdog_e;    // cuts off, above 2048 bytes
  input [16:0]                scr_vlantag;       // VLAN tag register. 
  
  // MRC Interface
  output [7:0]                rpe_data;          // Received frame data.
  output                      rpe_data_valid;    // valid signal for rpe_data 
  output                      rpe_sof;           // indicates the start of frame
  output                      rpe_eof;           // indicates the end of frame
  output                      rpe_padcrc_strip;  // indicates pad/crc is stripped
  output                      rpe_payload_start; // indicates start of payload
  output                      rpe_fsm_sts;       // when low, RPE FSM is in IDLE state
  output [23:0]               rpe_status;        // received frame status
  output                      rpe_status_valid;  // enable for rpe_status
  output [13:0]               rpe_rcvd_frame_size; // Actual size of frame received  

  output [5:0]                crx_dacrc;         // Most significant 6-bits of
                                                 // Calculated DA CRC.

// Internal Wire Declarations

wire [`TXD_WIDTH+1:0]        lpbk_data;
wire                         crx_match;
wire [31:0]                  crx_data;

// Receive CRC Block Instance

DWC_gmac_crc
 DWC_gmac_mre_crx_inst (
                            .clk_crc_i                (clk_rx_i),
                            .rst_clk_crc_n            (rst_clk_rx_n),
                            .data                     (rpe_data),
                            .data_valid               (rpe_data_valid),
                            .reset_crc                (rpe_status_valid),
                            .crc_match                (crx_match),
                            .dacrc                    (crx_dacrc),
                            .crc                      (crx_data)
                            );

// Receive Protocol Engine Instance 
DWC_gmac_mre_rpe
 DWC_gmac_mre_rpe_inst (
                            .clk_rx_i(clk_rx_i),
                                        .rst_clk_rx_n(rst_clk_rx_n),
                                        .gmii_rxdv_i(gmii_rxdv_i),
                                        .gmii_rxer_i(gmii_rxer_i),
                                        .gmii_rxd_i(gmii_rxd_i),
                                        .scr_col(scr_col),
                                        .scr_autocrcpadstrip(scr_autocrcpadstrip),
                                        .scr_loopback_mode(scr_loopback_mode),
                                        .scr_disreceiveown(scr_disreceiveown),
                                        .scr_receive_e(scr_receive_e),
                                        .scr_duplexmode(scr_duplexmode),
                                        .scr_portselect(scr_portselect),
                                        .scr_jumboframe_e(scr_jumboframe_e),
                                        .scr_watchdog_e(scr_watchdog_e),
                                        .scr_vlantag(scr_vlantag),
                                        .crx_match(crx_match),
                                        .lpbk_data(lpbk_data),
                                        .rpe_data(rpe_data),
                                        .rpe_data_valid(rpe_data_valid),
                                        .rpe_padcrc_strip(rpe_padcrc_strip),
                                        .rpe_sof(rpe_sof),
                                        .rpe_eof(rpe_eof),
                                        .rpe_payload_start(rpe_payload_start),
                                        .rpe_status_valid(rpe_status_valid),
                                        .rpe_rcvd_frame_size(rpe_rcvd_frame_size),
                                        .rpe_fsm_sts(rpe_fsm_sts),
                                        .rpe_status(rpe_status)
                                        );

// 5/9-deep ASYNC FIFO Instance for Loopback data(10 or 6 bits wide)
DWC_gmac_mre_lpbk
 #(`TXD_WIDTH+2,3) DWC_gmac_mre_lpbk_m1000_inst(
             .clk_tx_i        (clk_tx_i),
             .rst_clk_tx_n    (rst_clk_tx_n),
             .wdata           ({gmii_txer_o, gmii_txen_o, gmii_txd_o}), 
             .scr_portselect  (scr_portselect),
             .sct_portselect  (sct_portselect),
             .clk_rx_i        (clk_rx_i),
             .rst_clk_rx_n    (rst_clk_rx_n),
             .rdata           (lpbk_data)
             );





endmodule
