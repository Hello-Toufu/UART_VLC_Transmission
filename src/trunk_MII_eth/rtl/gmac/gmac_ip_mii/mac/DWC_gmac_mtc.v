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
// File Version     :        $Revision: #16 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Controller Module(MTC).
//
// DESCRIPTION:
// The MAC Transmit Controller consists of four sub-blocks 
// MAC Transmit Bus Interface Unit(DWC_gmac_mtc_tbu), 
// MAC Transmit Frame Controller(DWC_gmac_mtc_tfc), 
// Transmit Flow Control(DWC_gmac_mtc_ftx) and 
// Transmit CRC block(DWC_gmac_mtc_ctx).
//---------------------------------------------------------------------------

module DWC_gmac_mtc (
        
        // Clock and reset
        clk_tx_i,
                     rst_clk_tx_n,
                     // MAC Transmit Interface(MTI)
                     mti_val_i,
                     mti_data_i,
                     mti_sof_i,
                     mti_eof_i,
                     mti_be_i,
                     mti_discrc_i,
                     mti_dispad_i,
                     mti_flowctrl_i,
                     mti_rdy_o,
                     mti_txstatus_o,
                     mti_txstatus_val_o,
                     // MAC Transmit Engine Interface(MTE)
                     tfc_req,
                     tpe_gnt,
                     tfc_data,
                     tfc_data_valid,
                     tfc_sof,
                     tfc_eof,
                     tpe_ack,
                     tpe_abort,
                     tpe_txstatus,
                     tpe_txstatus_valid,
                     // SYNC Block signals
                     sct_flowthresh,
                     sct_txflowctrl_e,
                     sct_disable_zqpf,
                     sct_duplexmode,
                     sct_txctrlframe,
                     ftx_txctrl_done,
                     sct_pausetime,
                     sct_macaddr0,
                     tfc_fsm_sts, 
                     // Transmit Frame status to MMC.
                     tfc_txstatus,
                     tfc_txstatus_valid,
                     ftx_data_valid,
                     stx_rxpause_e,
                     stx_pause_quanta
                     );

// Input and Ouput Port Declaration.

  // Clock and reset
  input                      clk_tx_i;            // Transmit clock (2.5/25/125)Mhz.
  input                      rst_clk_tx_n;        // Active low reset synchroronous
                                                  // to clk_tx_i.
  
  // MAC Transmit Interface(MTI)
  input                      mti_val_i;           // Data valid signal.
  input  [`DATAWIDTH-1:0]    mti_data_i;          // 32/64/128-bit application data.
  input                      mti_sof_i;           // Start of frame signal.
  input                      mti_eof_i;           // End of frame signal.
  input  [`DATAWIDTH/64+1:0] mti_be_i;            // Byte enables for application data.
  input                      mti_discrc_i;        // Disable FCS addition in GMAC.
  input                      mti_dispad_i;        // Disable padding in GMAC.
  input                      mti_flowctrl_i;      // H/W request to transmit control frame.
  
  output                     mti_rdy_o;           // Ready signal for application.
  output [31:0]              mti_txstatus_o;      // Transmit Frame Status from GMAC.
  output                     mti_txstatus_val_o;  // Status valid from GMAC.
  
  // MAC Transmit Engine Interface(MTE)
  output                     tfc_req;             // Frame transmit request signal
  output [7:0]               tfc_data;            // 8-bit Transmit data 
  output                     tfc_data_valid;      // Data valid for 8-bit data to TPE
  output                     tfc_sof;             // Start of frame signal.
  output                     tfc_eof;             // End of frame signal
  
  input                      tpe_gnt;             // Grant for transmit request  
  input                      tpe_ack;             // Acknowledge signal for transmit data.           
  input                      tpe_abort;           // Frame aborted in TPE.
  input  [31:0]              tpe_txstatus;        // Tx status from TPE.
  input                      tpe_txstatus_valid;  // Tx status valid from TPE.
  
  // SYNC Block signals
  input  [1:0]               sct_flowthresh;      // Pause Low Threshold from CSR.
  input                      sct_txflowctrl_e;    // Flow control Enable from CSR.
  input                      sct_disable_zqpf;    // Disable Automatic Zero Quanta Pause Frame
  input                      sct_duplexmode;      // Duplexmode sync'd to Tx clock.
  input                      sct_txctrlframe;     // S/W request to transmit control 
                                                  // frame (CSR).
  input  [15:0]              sct_pausetime;       // Pause time sent in control frame
  input  [47:0]              sct_macaddr0;        // Source Address
  output                     ftx_txctrl_done;       // control frame transmitted.
  output [1:0]               tfc_fsm_sts;         // TFC FSM status for CSR

  // Transmit Frame status to MMC.
  output [31:0]              tfc_txstatus;        // Tx status to MMC.
  output                     tfc_txstatus_valid;  // Tx status valid to MMC
  
  output                     ftx_data_valid;      // data valid for 8-bit control frame data from FTX.
  input                      stx_rxpause_e;       // Pause Control Enable from Rx Path via STX
  input                      stx_pause_quanta;    // one pause quanta completion
                                                  // (64-bit times).

  wire                       tbu_data_valid;
  wire  [31:0]               tbu_data;
  wire                       tbu_sof;
  wire                       tbu_eof;
  wire  [3:0]                tbu_be;
  wire                       tbu_dispad;
  wire                       tbu_discrc;
  
  wire                       tfc_rdy;
  wire                       tfc_abort;
  wire                       tfc_data_valid;
  wire  [7:0]                tfc_data;
  wire                       tfc_sof;
  wire                       tfc_eof;
  wire                       tfc_req;
  wire                       tfc_ftx_ack;
  wire  [1:0]                count_4;
  wire  [3:0]                dword_cnt;
  wire                       tfc_data_en;
  wire                       tfc_strt_crc;
  wire                       tfc_sts_valid;
  wire  [31:0]               tfc_sts;
  wire  [31:0]               tfc_txstatus;
  wire                       tfc_txstatus_valid;
  
  wire                       ftx_txctrl_done;
  wire                       ftx_data_valid;
  wire  [7:0]                ftx_data;
  wire                       ftx_sof;
  wire                       ftx_eof;

  wire  [31:0]               ctx_data;
  
  wire [5:0]                 dummy_dacrc; //Not used.
  wire                       dummy_crc_match; //Not used.

// MAC Transmit Bus Interface Unit Instance
DWC_gmac_mtc_tbu
 DWC_gmac_mtc_tbu_inst(
                                       .clk_tx_i(clk_tx_i),
                                       .rst_clk_tx_n(rst_clk_tx_n),
                                       .mti_val_i(mti_val_i),
                                       .mti_data_i(mti_data_i),
                                       .mti_sof_i(mti_sof_i),
                                       .mti_eof_i(mti_eof_i),
                                       .mti_be_i(mti_be_i),
                                       .mti_rdy_o(mti_rdy_o),
                                       .tfc_rdy(tfc_rdy),
                                       .tfc_abort(tfc_abort),
                                       .tbu_data_valid(tbu_data_valid), 
                                       .tbu_data(tbu_data),
                                       .tbu_sof(tbu_sof),
                                       .tbu_eof(tbu_eof),
                                       .tbu_be(tbu_be),
                                       .mti_dispad_i(mti_dispad_i),
                                       .mti_discrc_i(mti_discrc_i),
                                       .tfc_sts_valid(tfc_sts_valid),
                                       .tfc_sts(tfc_sts),
                                       .tbu_dispad(tbu_dispad),
                                       .tbu_discrc(tbu_discrc),
                                       .mti_txstatus_o(mti_txstatus_o),
                                       .mti_txstatus_val_o(mti_txstatus_val_o)
                                       );
  
// MAC Transmit Frame Controller Instance
DWC_gmac_mtc_tfc
 DWC_gmac_mtc_tfc_inst (
                                        .clk_tx_i(clk_tx_i),
                                        .rst_clk_tx_n(rst_clk_tx_n),
                                        .tbu_data_valid(tbu_data_valid),
                                        .tbu_data(tbu_data),
                                        .tbu_be(tbu_be),
                                        .tbu_sof(tbu_sof),
                                        .tbu_eof(tbu_eof),
                                        .tfc_rdy(tfc_rdy),
                                        .tfc_abort(tfc_abort),
                                        .tfc_data_valid(tfc_data_valid),
                                        .tfc_data(tfc_data),
                                        .tfc_sof(tfc_sof),
                                        .tfc_eof(tfc_eof),
                                        .tpe_ack(tpe_ack),
                                        .tpe_abort(tpe_abort),
                                        .tfc_req(tfc_req),
                                        .tpe_gnt(tpe_gnt),
                                        .ftx_data_valid(ftx_data_valid),
                                        .ftx_data(ftx_data),
                                        .ftx_sof(ftx_sof),
                                        .ftx_eof(ftx_eof),
                                        .tfc_ftx_ack(tfc_ftx_ack),
                                        .count_4(count_4),
                                        .dword_cnt(dword_cnt),
                                        .ctx_data(ctx_data),
                                        .tfc_data_en(tfc_data_en),
                                        .tfc_strt_crc(tfc_strt_crc),
                                        .stx_rxpause_e(stx_rxpause_e),
                                        .tbu_dispad(tbu_dispad),
                                        .tbu_discrc(tbu_discrc),
                                        .tpe_txstatus_valid(tpe_txstatus_valid),
                                        .tpe_txstatus(tpe_txstatus),
                                        .tfc_sts_valid(tfc_sts_valid),
                                        .tfc_sts(tfc_sts),
                                        .tfc_fsm_sts(tfc_fsm_sts),
                                        .tfc_mmc_txstatus(tfc_txstatus),
                                        .tfc_mmc_txstatus_valid(tfc_txstatus_valid)
                                        );

  
// Transmit Flow Control Unit Instance
DWC_gmac_mtc_ftx
 DWC_gmac_mtc_ftx_inst (
                                        .clk_tx_i              (clk_tx_i),
                                        .rst_clk_tx_n          (rst_clk_tx_n),
                                        .sct_txflowctrl_e      (sct_txflowctrl_e),
                                        .sct_disable_zqpf      (sct_disable_zqpf),
                                        .sct_txctrlframe       (sct_txctrlframe),
                                        .sct_duplexmode        (sct_duplexmode),
                                        .sct_flowthresh        (sct_flowthresh),
                                        .mti_flowctrl_i        (mti_flowctrl_i),
                                        .ftx_txctrl_done       (ftx_txctrl_done),
                                        .sct_pausetime         (sct_pausetime),
                                        .sct_macaddr0          (sct_macaddr0),
                                        .tfc_ftx_ack           (tfc_ftx_ack),
                                        .ftx_data_valid        (ftx_data_valid),
                                        .ftx_data              (ftx_data),
                                        .ftx_sof               (ftx_sof),
                                        .ftx_eof               (ftx_eof),
                                        .stx_pause_quanta      (stx_pause_quanta),
                                        .count_4               (count_4),
                                        .dword_cnt             (dword_cnt) 
                                       );

// Transmit CRC Unit Instance
DWC_gmac_crc
 DWC_gmac_mtc_ctx_inst(
                                   .clk_crc_i                  (clk_tx_i),
                                   .rst_clk_crc_n              (rst_clk_tx_n),
                                   .data                       (tfc_data),
                                   .data_valid                 (tfc_data_en),
                                   .reset_crc                  (tfc_strt_crc),
                                   .crc_match                  (dummy_crc_match),
                                   .dacrc                      (dummy_dacrc),
                                   .crc                        (ctx_data)
                                   );

endmodule
