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
// Date             :        $Date: 2008/08/13 $
// File Version     :        $Revision: #18 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Receive Controller(DWC_gmac_mrc.v)
//
// DESCRIPTION:
// MAC Receive Controller consists of following sub-blocks,
// 1.MAC Receive Bus Interface Unit(DWC_gmac_mrc_rbu),
// 2.Receive Frame Controller(DWC_gmac_mrc_rfc),
// 3.Receive Flow Control Unit(DWC_gmac_mrc_frx)
//--------------------------------------------------------------------------

module DWC_gmac_mrc (

        // Clocks and reset
        clk_rx_i,
                     rst_clk_rx_n,
                     // MRE Interface
                     rpe_data_valid,
                     rpe_data,
                     rpe_sof,
                     rpe_eof,
                     //MRE status and control signals
                     rpe_payload_start,
                     rpe_padcrc_strip,
                     rpe_status_valid,
                     rpe_rcvd_frame_size,
                     rpe_status,
                     // Address Filter Block Controls
                     afb_daf_filterfail,
                     afb_daf_filterfail_valid,
                     afb_saf_filterfail,
                     afb_saf_filterfail_valid,
                     afb_rcvbroadcast,
                     afb_rcvmulticast,
                     afb_sa_selected,
                     afb_daf_addr,
                     // MAC Receive Interface(MRI)
                     mri_val_o,
                     mri_data_o,
                     mri_be_o,
                     mri_sof_o,
                     mri_eof_o,
                     mri_rxstatus_o,
                     // SYNC Block Inputs
                     scr_safilter_e,
                     scr_receiveall,
                     scr_passctrlframe,
                     scr_rxflowctrl_e,
                     scr_ipchksum_e,
                     scr_type_crcstrip_e,
                     scr_duplexmode,
                     scr_unicastdetect,
                     // To STX Block
                     frx_load_pause_time,
                     frx_pause_time,
                     // To SYNC block
                     rfc_fsm_sts, 
                     frx2mmc_ctrlframe,
                     rfc_rxstatus_valid,
                     rfc_rxstatus
                     );

// Input and output Port declarations

  // Clocks and reset
  input                      clk_rx_i;                  // MAC Receive Clock(2.5/25/125)Mhz.
  input                      rst_clk_rx_n;            // Active Low reset synchronous to
                                                        // clk_rx_i.
  // MRE Interface
  input                      rpe_data_valid;            // Data valid for frame data from MRE.
  input  [7:0]               rpe_data;                  // Received frame data from MRE.
  input                      rpe_sof;                   // Start of Frame
  input                      rpe_eof;                   // End of Frame
  
  //MRE status and control signals
  input                      rpe_payload_start;         // Start of Payload Indication.
  input                      rpe_padcrc_strip;          // Strip par/crc Indication.
  input                      rpe_status_valid;          // Status Valid from MRE.
  input  [13:0]              rpe_rcvd_frame_size;       // Received frame length from MRE.   
  input  [23:0]              rpe_status;                // Received frame status from MRE.
  
  // Address Filter Block Controls
  input                      afb_daf_filterfail;        // DA Filter Fail Indication. 
  input                      afb_daf_filterfail_valid;  // DA Filter Fail Valid. 
  input                      afb_saf_filterfail;        // SA Filter Fail Indication.
  input                      afb_saf_filterfail_valid;  // SA Filter Fail Valid. 
  input                      afb_rcvbroadcast;          // Broadcast frame received.
  input                      afb_rcvmulticast;          // Multicast frame received.
  input                      afb_sa_selected;           // Indicates atleast 1 MAC reg. is 
                                                        // selected for SA filtering.
  input  [4:0]               afb_daf_addr;              // Signal indicating the MAC 
                                                        // Address register,which matches
                                                        // the DA of the received frame. 
  
  // MAC Receive Interface(MRI)
  output                      mri_val_o;                 // Data valid signal.
  output [`DATAWIDTH-1:0]     mri_data_o;                // Frame data to application.
  output [`DATAWIDTH/64 +1:0] mri_be_o;                  // Encoded Byte enable.
  output                      mri_sof_o;                 // Start of Frame signal.
  output                      mri_eof_o;                 // End of frame signal.
  output [`CORE_STATUS_WIDTH-1:0] mri_rxstatus_o;        // status of received frame.
  
  // SYNC Block Inputs
  input                      scr_safilter_e;            // SA Filter Enable from CSR.
  input                      scr_receiveall;            // Enable reception of all frame 
                                                        // irrespective of DA or SA.
  
  input  [1:0]               scr_passctrlframe;         // Pass all control frame to
                                                        // application.
  input                      scr_rxflowctrl_e;          // Enable receive flow control.
  input                      scr_ipchksum_e;            // IP checksum enable.
  input                      scr_type_crcstrip_e;       // CRC stripping enable bit
  input                      scr_duplexmode;            // Duplexmode selection bit.
  input                      scr_unicastdetect;         // Unicast Pause Frame detect
                                                        // enable.

  // To STX Block
  output                      frx_load_pause_time; // load value on frx_pause_time
  output [15:0]               frx_pause_time; // Pause time from received pause frame.
  
  output [1:0]                rfc_fsm_sts;    // FSM IDLE status from rfc
  // Frame status to MMC
  output                     frx2mmc_ctrlframe;         // Control Frame received 
                                                        // indication to MMC.

  output                     rfc_rxstatus_valid;        // Status valid signal to MMC.
  output [25:0]              rfc_rxstatus;              // Status of received frame

  // Internal wire declarations.

  wire  [31:0]               rfc_data;
  wire  [3:0]                rfc_be;
  wire                       rfc_data_valid;
  wire                       rfc_sof;
  wire                       rfc_eof;
  wire  [`CORE_STATUS_WIDTH-1:0] rfc_status; 
  
  wire  [7:0]                rpe_data;  
  wire                       rpe_data_valid;
  wire                       rpe_payload_start;
  wire                       rpe_sof;
  wire                       rpe_eof;
  wire                       rpe_padcrc_strip;
  wire                       rpe_status_valid;
  wire  [23:0]               rpe_status;
  wire                       frx_ctrlframe;
  wire                       frx_ctrlframe_valid;
  wire                       frx_pausframe;
  wire                       frx_pausframe_valid;

  // MAC Receive Bus Interface Unit
  DWC_gmac_mrc_rbu
   DWC_gmac_mrc_rbu_inst(
                                         .clk_rx_i(clk_rx_i),
                                         .rst_clk_rx_n(rst_clk_rx_n),
                                         .rfc_data(rfc_data),
                                         .rfc_be(rfc_be),
                                         .rfc_data_valid(rfc_data_valid),
                                         .rfc_sof(rfc_sof),
                                         .rfc_eof(rfc_eof),
                                         .rfc_status(rfc_status),
                                         .mri_data_o(mri_data_o),
                                         .mri_be_o(mri_be_o),
                                         .mri_val_o(mri_val_o),
                                         .mri_sof_o(mri_sof_o),
                                         .mri_eof_o(mri_eof_o),
                                         .mri_status_o(mri_rxstatus_o)
                                         );


  // Receive Frame Controller
  DWC_gmac_mrc_rfc
   DWC_gmac_mrc_rfc_inst(
                .clk_rx_i(clk_rx_i),
                                         .rst_clk_rx_n(rst_clk_rx_n),
                                         .rpe_data(rpe_data),
                                         .rpe_data_valid(rpe_data_valid),
                                         .rpe_sof(rpe_sof),
                                         .rpe_eof(rpe_eof),
                                         .rpe_padcrc_strip(rpe_padcrc_strip),
                                         .rpe_status_valid(rpe_status_valid),
                                         .rpe_rcvd_frame_size(rpe_rcvd_frame_size),
                                         .rpe_status(rpe_status),
                                         .afb_daf_filterfail(afb_daf_filterfail),
                                         .afb_daf_filterfail_valid(afb_daf_filterfail_valid),
                                         .afb_saf_filterfail(afb_saf_filterfail),
                                         .afb_saf_filterfail_valid(afb_saf_filterfail_valid),
                                         .afb_rcvbroadcast(afb_rcvbroadcast),
                                         .afb_rcvmulticast(afb_rcvmulticast),
                                         .afb_sa_selected(afb_sa_selected),
                                         .afb_daf_addr(afb_daf_addr),
                                         .scr_ipchksum_e(scr_ipchksum_e),
                                         .scr_type_crcstrip_e(scr_type_crcstrip_e),
                                         .scr_receiveall(scr_receiveall),
                                         .scr_passctrlframe(scr_passctrlframe),
                                         .scr_safilter_e(scr_safilter_e),
                                         .frx_ctrlframe_valid(frx_ctrlframe_valid),
                                         .frx_ctrlframe(frx_ctrlframe),
                                         .frx_pausframe_valid(frx_pausframe_valid),
                                         .frx_pausframe(frx_pausframe),
                                         .rfc_sof(rfc_sof),
                                         .rfc_eof(rfc_eof),
                                         .rfc_data(rfc_data),
                                         .rfc_data_valid(rfc_data_valid),
                                         .rfc_be(rfc_be),
                                         .rfc_rxstatus_valid(rfc_rxstatus_valid),
                                         .rfc_rxstatus(rfc_rxstatus),
                                         .rfc_fsm_sts(rfc_fsm_sts),
                                         .rfc_status(rfc_status)
                                         );


  // Receive Flow Control unit
  DWC_gmac_mrc_frx
    DWC_gmac_mrc_frx_inst(
                            .clk_rx_i                  (clk_rx_i),
                            .rst_clk_rx_n              (rst_clk_rx_n),
                            .rpe_data                  (rpe_data),
                            .rpe_data_valid            (rpe_data_valid),
                            .rpe_sof                   (rpe_sof),
                            .rpe_eof                   (rpe_eof),
                            .rpe_status                ({rpe_status[23:14],rpe_rcvd_frame_size}),
                            .rpe_status_valid          (rpe_status_valid),
                            .afb_daf_addr              (afb_daf_addr),
                            .afb_daf_filterfail        (afb_daf_filterfail),
                            .afb_daf_filterfail_valid  (afb_daf_filterfail_valid),
                            .afb_rcvmulticast          (afb_rcvmulticast),
                            .afb_rcvbroadcast          (afb_rcvbroadcast),
                            .scr_unicastdetect         (scr_unicastdetect),
                            .scr_duplexmode            (scr_duplexmode),
                            .scr_flowctrl_e            (scr_rxflowctrl_e),
                            .frx_load_pause_time       (frx_load_pause_time),
                            .frx_pause_time            (frx_pause_time),
                            .frx_ctrlframe_valid       (frx_ctrlframe_valid),
                            .frx_ctrlframe             (frx_ctrlframe),
                            .frx_pausframe_valid       (frx_pausframe_valid),
                            .frx_pausframe             (frx_pausframe),
                            .frx2mmc_ctrlframe         (frx2mmc_ctrlframe)
                            );






endmodule  
