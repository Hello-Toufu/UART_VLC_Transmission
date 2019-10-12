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
//-----------------------------------------------------------------------------
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2008/08/12 $
// File Version     :        $Revision: #15 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Engine (DWC_gmac_mte.v)
//
// DESCRIPTION:
// The MAC Transmit Engine consists of MAC Transmit Scheduler (DWC_gmac_mte_stx)
// and MAC Transmit Protocol Engine(DWC_gmac_mte_tpe).
//------------------------------------------------------------------------------

module DWC_gmac_mte (

        // Clock and reset
        clk_tx_i,
                     rst_clk_tx_n,
                     // MFC <-> MTE request handshake signals       
                     tfc_req,
                     tpe_gnt,
                     // MTC Interface
                     tfc_data,
                     tfc_data_valid,
                     tfc_sof,
                     tfc_eof,
                     tpe_ack,
                     tpe_abort,
                     tpe_txstatus,
                     tpe_txstatus_valid,
                     mte_dbg_sts,
                     ftx_data_valid,
                     stx_rxpause_e,
                     stx_pause_quanta,
                     mti_flowctrl_i,
                     mti_txfifoflush_i,
                     sct_portselect,
                     sct_duplexmode,
                     sct_transmit_e,
                     sct_disretry,
                     sct_backoff_lmt,
                     sct_backpressure,
                     sct_txflowctrl_e,
                     sct_frameburst_e,
                     sct_deferral_chk,
                     sct_jabber_e,
                     sct_jumboframe_e,
                     sct_ifg,
                     sct_col,
                     sct_crs,
                     sct_load_pause_time,
                     // FRX Block
                     frx_pause_time,
                     // GMII Outputs
                     gmii_txen_o,
                     gmii_txer_o,
                     gmii_txd_o
                     );

  // Input and Output port declarations.
        
  // Clock and reset
  input              clk_tx_i;              // Transmit clock (2.5/25/125)Mhz.
  input              rst_clk_tx_n;          // Active low reset synchronous to clk_tx_i.

  // MFC <-> MTE request handshake signals       
  input              tfc_req;               // Frame Transmit request from MTC.
  output             tpe_gnt;               // Grant ackowledging the MTC request. 
  
  // MTC Interface
  input [7:0]        tfc_data;              // 8-bit frame data.
  input              tfc_data_valid;        // Data valid for frame data from MTC.
  input              tfc_sof;               // Start of frame.
  input              tfc_eof;               // End of frame.
  output             tpe_ack;               // Acknowledge signal for frame data.
  output             tpe_abort;             // Frame aborted in MTE.
  output  [31:0]     tpe_txstatus;          // Tx Frame status.
  output             tpe_txstatus_valid;    // Tx status valid from TFC.
  output [1:0]       mte_dbg_sts;           // {Tx in Pause, TPE FSM non-IDLE}
  
  input              ftx_data_valid;      // data valid for 8-bit control frame data from FTX.
  output             stx_rxpause_e;       // Instructs the transmitter to pause (due to rx pause frame)
  output             stx_pause_quanta;    // signal indicating completion of one pause quanta.
                                          // (64 bit times).
   
  input              mti_flowctrl_i;        // H/W flow control request from application.
  input              mti_txfifoflush_i;     // Tx FIFO Flush pulse from app 
  
  // MMC Interface
                                            // which is not intimated to application
  
  // SYNC Block Inputs
  input              sct_portselect;        // Port select qualifying the MII/GMII interface.
  input              sct_duplexmode;        // Mode signal qualifying half/full duplex mode.
  input              sct_transmit_e;        // Transmit Enable from CSR. 

  input              sct_disretry;          // Disable retransmission of frame.
  input  [1:0]       sct_backoff_lmt;       // Encoded Backoff limit from CSR.
  input              sct_backpressure;      // Back pressure active signal from CSR
                                            // (valid for half duplex only).
  
  input              sct_txflowctrl_e;        // Flow control enable from CSR.
  input              sct_frameburst_e;      // Frame burst enable from CSR 
                                            // (valid for full duplex only).
  
  input              sct_deferral_chk;       // Deferral check enable from CSR.
  input              sct_jabber_e;          // Jabber Function enable from CSR. 
  input              sct_jumboframe_e;      // Jumboframe enable from CSR.
  input  [2:0]       sct_ifg;               // Minimum IFG programmed through CSR .
  input              sct_col;               // Collision detect indication from PHY 
                                            // synchronous to clk_tx_i.
  
  input              sct_crs;               // Carrier sense indication from PHY 
                                            // synchronous to clk_tx_i.
  
  input              sct_load_pause_time;   // Load value on frx_pause_time

  // From FRX
  input  [15:0]      frx_pause_time; // Pause time value from received pause frame.

  
  // GMII Outputs
  output                  gmii_txen_o;           // GMII/MII Transmit data enable.
  output                  gmii_txer_o;           // GMII/MII Transmit error. 
  output [`TXD_WIDTH-1:0] gmii_txd_o;            // GMII/MII Transmit data.

  wire               tpe_txcarrier;
  wire               tpe_backoff_strt;
  wire               stx_xmitok;
  wire               stx_backoff;

 
 // MAC Transmit Scheduler
 DWC_gmac_mte_stx
  DWC_gma_mte_stx_inst(
                          .clk_tx_i(clk_tx_i),
                                       .rst_clk_tx_n(rst_clk_tx_n),
                                       .tpe_txcarrier(tpe_txcarrier),
                                       .tpe_backoff_strt(tpe_backoff_strt),
                                       .sct_backoff_lmt(sct_backoff_lmt),
                                       .sct_crs(sct_crs),
                                       .sct_ifg(sct_ifg),
                                       .sct_portselect(sct_portselect),
                                       .sct_duplexmode(sct_duplexmode),
                                       .sct_load_pause_time(sct_load_pause_time),
                                       .frx_pause_time(frx_pause_time),
                                       .stx_xmitok(stx_xmitok),
                                       .stx_backoff(stx_backoff),
                                       .tfc_req(tfc_req),
                                       .ftx_data_valid(ftx_data_valid),
                                       .stx_rxpause_e(stx_rxpause_e),
                                       .stx_tx_in_paus(mte_dbg_sts[1]),
                                       .stx_pause_quanta(stx_pause_quanta)
                                       );
 
DWC_gmac_mte_tpe
 DWC_gmac_mte_tpe_inst(
                         .clk_tx_i(clk_tx_i),
                                       .rst_clk_tx_n(rst_clk_tx_n),
                                       .tfc_req(tfc_req),
                                       .tpe_gnt(tpe_gnt),
                                       .tfc_data_valid(tfc_data_valid),
                                       .tfc_data(tfc_data),
                                       .tfc_sof(tfc_sof),
                                       .tfc_eof(tfc_eof),
                                       .tpe_ack(tpe_ack),
                                       .tpe_abort(tpe_abort),
                                       .tpe_txstatus_valid(tpe_txstatus_valid),
                                       .tpe_txstatus(tpe_txstatus),
                                       .tpe_fsm_sts(mte_dbg_sts[0]),
                                       .sct_portselect(sct_portselect),
                                       .sct_duplexmode(sct_duplexmode),
                                       .sct_transmit_e(sct_transmit_e),
                                       .sct_disretry(sct_disretry),
                                       .sct_col(sct_col),
                                       .sct_crs(sct_crs),
                                       .sct_backpressure(sct_backpressure),
                                       .sct_txflowctrl_e(sct_txflowctrl_e),
                                       .sct_frameburst_e(sct_frameburst_e),
                                       .sct_deferral_chk(sct_deferral_chk),
                                       .sct_jabber_e(sct_jabber_e),
                                       .sct_jumboframe_e(sct_jumboframe_e),
                                       .mti_txfifoflush_i(mti_txfifoflush_i),
                                       .mti_flowctrl_i(mti_flowctrl_i),
                                       .tpe_txcarrier(tpe_txcarrier),
                                       .tpe_backoff_strt(tpe_backoff_strt),
                                       .stx_xmitok(stx_xmitok),
                                       .stx_backoff(stx_backoff),
                                       .gmii_txen_o(gmii_txen_o),
                                       .gmii_txer_o(gmii_txer_o),
                                       .gmii_txd_o(gmii_txd_o)
                                       );

endmodule
