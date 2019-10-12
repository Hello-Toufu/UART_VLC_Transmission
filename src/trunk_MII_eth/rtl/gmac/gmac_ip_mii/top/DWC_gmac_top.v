//---------------------------------------------------------------------------//
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
//---------------------------------------------------------------------------//
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2007/11/29 $
// File Version     :        $Revision: #57 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                   //
// GMAC TOP LEVEL MODULE(DWC_gmac_top.v)                                     //
//                                                                           //
// DESCRIPTION:                                                              //
// GMAC subsytem enables the host to transmit and receive data over Ethernet //
// in compliance with the IEEE 802.3-2002 standard.The GMAC Subsystem can be //
// configured to include the following system interfaces.                    //
// 3.GMAC SUbsystem with native FIFO Interface.                              //
//   Constituent Blocks- MAC Transaction Layer,                              //
//                       GMAC Controller.                                    //
//                                                                           //
//---------------------------------------------------------------------------//

module DWC_gmac_top (

  // Clocks and resets
  clk_tx_i,
                     clk_rx_i,
                     rst_clk_tx_n,
                     rst_clk_rx_n,
                     // GMAC SUBSYS without AHB master
                     // GMAC MTL Subsystem wihout DMA
                     // Application Input Clock & Reset
                     clk_app_i,
                     rst_clk_app_n,
                     // MTL Transmit Application Interface
                     ati_val_i,
                     ati_sof_i,
                     ati_eof_i,
                     ati_data_i,
                     ati_be_i,
                     ati_rdy_o,
                     ati_pbl_i,
                     ati_tx_watermark_o,
                     // MTL Transmit Control and Status Interface
                     ati_dispad_i,
                     ati_discrc_i,
                     ati_txstatus_val_o,
                     ati_txstatus_o,
                     ati_ack_i,
                     // MTL Receive Application interface.
                     ari_ack_i,
                     ari_val_o,
                     ari_sof_o,
                     ari_eof_o,
                     ari_data_o,
                     ari_be_o,
                     ari_rxstatus_val_o,
                     ari_frameflush_i,
                     ari_pbl_i,
                     ari_rx_watermark_o,
                     ari_rxfifo_frm_cnt_o,
                     ari_frame_len_o,
                     ari_frame_len_val_o,
                     ari_err_frame_o,
                     // MTL <-> TxData FIFO Write Interface
                     twc_wr_addr_o,
                     twc_wr_csn_o,
                     twc_wr_data_o,
                     twc_wr_en_o,
                     // MTL <-> TxData FIFO Read Interface
                     trc_rd_addr_o,
                     trc_rd_csn_o,
                     trc_rd_data_i,
                     trc_rd_en_o,
                     // MTL <-> RxData FIFO Write Interface 
                     rwc_wr_addr_o,
                     rwc_wr_csn_o,
                     rwc_wr_en_o,
                     rwc_wr_data_o,
                     // MTL <-> Rx Frame Length FIFO write interface
                     rwc_len_wr_addr_o,
                     rwc_len_wr_en_o,
                     rwc_len_wr_csn_o,
                     rwc_err_frame_o,   
                     // MTL <-> RxData FIFO Read Interface.
                     rrc_rd_addr_o,
                     rrc_rd_csn_o,
                     rrc_rd_data_i,
                     rrc_rd_en_o,
                     // MTL <-> Rx Frame Length FIFO read interface
                     rrc_len_rd_addr_o,
                     rrc_len_rd_csn_o,
                     rrc_len_rd_data_i,
                     rrc_len_rd_en_o,
                     mac_speed_o,
                     // MAC Control Interface(MCI)
                     mci_val_i,
                     mci_addr_i,
                     mci_rdwrn_i,
                     mci_wdata_i,
                     mci_be_i,
                     mci_ack_o,
                     mci_rdata_o,
                     mci_intr_o,
                     // MII Management Interface.
                     gmii_mdc_o,
                     gmii_mdi_i,
                     gmii_mdo_o,
                     gmii_mdo_o_e,
                     phy_txen_o,
                     phy_txer_o,
                     phy_txd_o,
                     phy_crs_i,
                     phy_col_i,
                     phy_rxdv_i,
                     phy_rxer_i,
                     phy_rxd_i
                     );

// Input and Output Declarations
// Input Clock & Reset

// Test Mode Enable Port

  input                        clk_app_i;       // Application clock input.
  
 // Clocks and reset
 input                      rst_clk_app_n; // Async/Sync Reset Synchronous
                                           // to clk_app_i.

 
 // MTL Transmit Application Interface   
 input                      ati_val_i;  // Trasnfer/Data valid signal.
 input                      ati_sof_i;  // Start of frame indicator.
 input                      ati_eof_i;  // End of frame indicator.
 input  [`DATAWIDTH-1:0]    ati_data_i; // Application data.
 input  [`DATAWIDTH/64+1:0] ati_be_i;   // Binary encoded byte enables
                                        // for application data.
 output                     ati_rdy_o;  // Signal indicates MTL is 
                                        // ready to accept data.

 input  [`ATI_PBL_WIDTH-1:0] ati_pbl_i;  // Maximum number of data phases 
                                        // during a single burst transfer
 output                     ati_tx_watermark_o; // Signal indicates the 
                                                // availability of space in
                                                // Txdata FIFO as requested 
                                                // through ati_pbl_i.

 // MTL Transmit Control and Status Interface
 input                      ati_dispad_i;       // Disable pad control.
 input                      ati_discrc_i;       // Disable crc control.  
 output                     ati_txstatus_val_o; // Status valid signal to
                                                // application.
 output [23:0]              ati_txstatus_o;     // 24-bit Status to application       
 input                      ati_ack_i;          // Ack for the status sent to
                                                // application.      
                                                  
 // MTL Receive Application interface.
 input                      ari_ack_i;           // Ack from application for
                                                 // received frame data and 
                                                 // received status.
 output                     ari_val_o;           // Qualifies ari_sof_o
                                                 // ari_eof_o, ari_data_o
                                                 // ari_be_o and frame status
                                                 
 output                     ari_sof_o;           // Start of frame
 output                     ari_eof_o;           // End of frame
 output [`DATAWIDTH-1:0]    ari_data_o;          // Frame data to application
 output [`DATAWIDTH/64+1:0] ari_be_o;            // Byte enables for frame 
                                                 // data.

 output                     ari_rxstatus_val_o;  // Receive frame status 
                                                 // valid. 
 input                      ari_frameflush_i;    // Flush current frame, 
                                                 // request from application
                                                    
 input  [`ARI_PBL_WIDTH-1:0] ari_pbl_i;  // Maximum number of data phases 
                                                 // during a single burst transfer
 output                     ari_rx_watermark_o;  // Signal indicates the 
                                                 // availability of data in
                                                 // Rxdata FIFO as requested 
                                                 // through ari_pbl_i.
output  [`MAX_FRAME_CNT_WIDTH-1:0] ari_rxfifo_frm_cnt_o; // Indicates the number of
                                    // Frame EOFs in RxFIFO 
  output [`FRAME_LEN_FIFO_WIDTH-2:0] ari_frame_len_o;// Indicates the Length of
                                                     // frame (i.e currently 
                                                     // transmitted or pending for
                                                     // transmission) to appln

  output                        ari_frame_len_val_o; // Signal validating the
                                                     // frame length on 
                                                     // ari_frame_len_o

  output                        ari_err_frame_o;     // Signal indicates the
                                                     // error frame when forward
                                                     // error frame(bit7 of OMR)
                                                     // is not asserted.



 // Inputs from the AHB.

                                               // 128/64/32-bit
  
                                                // frame or activate backpressure.
  

      
  // MTL <-> TxData FIFO Write Interface           
 output [`TX_FIFO_PTR_WIDTH-1:0]  twc_wr_addr_o; // Write address to Txdata FIFO            
 output                        twc_wr_csn_o;  // Chip select to Txdata FIFO.
 output [`FIFO_DATA_WIDTH-1:0] twc_wr_data_o; // Write data to Txdata FIFO.
 output                        twc_wr_en_o;   // Write enable to Txdata FIFO.
 
 // MTL <-> TxData FIFO Read Interface
 output [`TX_FIFO_PTR_WIDTH-1:0]  trc_rd_addr_o; // Read address to Txdata FIFO 
 output                        trc_rd_csn_o;  // Chip select to Txdata FIFO.
 input  [`FIFO_DATA_WIDTH-1:0] trc_rd_data_i; // Read data from Txdata FIFO.
 output                        trc_rd_en_o;   // Read enable to Txdata FIFO.
 
 // MTL <-> RxData FIFO Write Interface 
 output [`RX_FIFO_PTR_WIDTH-1:0] rwc_wr_addr_o; // Write address to Rxdata FIFO
 output                          rwc_wr_csn_o;  // Chip select to Rxdata FIFO
 output                          rwc_wr_en_o;   // Write Enable to Rxdata FIFO
 output [`FIFO_DATA_WIDTH-1:0]   rwc_wr_data_o; // Write data to Rxdata FIFO

// MTL <-> Rx Frame Length FIFO write interface
   output [`MAX_FRAME_CNT_WIDTH-2:0] rwc_len_wr_addr_o; // Write address to
                                                        // Rx Frame Length FIFO
   output                            rwc_len_wr_en_o;   // Write enable to 
                                                        // Rx Frame Length FIFO
   output                            rwc_len_wr_csn_o;  // Chip select to write
                                                        // Rx Frame Length FIFO
   output                            rwc_err_frame_o;   // Drop Error Frame flag
                                                        // to Frame Length FIFO. 

// MTL <-> Rx Frame Length FIFO read interface
  output [`MAX_FRAME_CNT_WIDTH-2:0]  rrc_len_rd_addr_o; // read address to
                                                        // Rx Frame Length FIFO
                                                        
  output                             rrc_len_rd_csn_o;  // chip select to read
                                                        // Rx Frame Length FIFO
                                                        
  input  [`FRAME_LEN_FIFO_WIDTH-1:0] rrc_len_rd_data_i; // Rx Frame Length from
                                                        // FIFO

  output                             rrc_len_rd_en_o;   // read enable to 
                                                        // Rx Frame Length FIFO


 // MTL <-> RxData FIFO Read Interface.
 output [`RX_FIFO_PTR_WIDTH-1:0] rrc_rd_addr_o;  // Read address of RxData FIFO
 output                          rrc_rd_csn_o;   // Chip select to RxData FIFO
 input  [`FIFO_DATA_WIDTH-1:0]   rrc_rd_data_i;  // Read data from RxData FIFO
 output                          rrc_rd_en_o;    // Read enable from RxData FIFO

  //  PHY Interface Clocks and resets
  input                  clk_tx_i;              // GMII/MII transmit reference
                                                // clock (2.5/25/125)Mhz.
  input                  clk_rx_i;              // GMII/MII receive clock 
                                                // from PHY (2.5/25/125)mhz.
  input                  rst_clk_tx_n;          // Active Low reset synch to clk_tx_i.
  input                  rst_clk_rx_n;          // Active Low reset synchronous
                                                // to clk_rx_i.
    output [1:0]             mac_speed_o;           // Speed select output for MAC
                                                    // "0x"-1000 Mbps,"10"-10Mbps,"11"-100 Mbps
 
 // MAC Control Interface(MCI)
  input            mci_val_i;      // signal to validate address, Read/write data of CSR access.
  input  [13:0]    mci_addr_i;     // CSR Read/Write address.
  input            mci_rdwrn_i;    // signal indicating Read/Write of CSR access.
  input  [31:0]    mci_wdata_i;    // Write data for CSR access.
  input  [3:0]     mci_be_i;       // Byte enables for CSR access. 

  output           mci_ack_o;      // Ack from CSR for all data transfers.
  output [31:0]    mci_rdata_o;    // Read data from CSR to the application.
  output           mci_intr_o;     // ORing of interrupts from MMC ,PCS and 

 
 // MII Management Interface.
  output           gmii_mdc_o;       // GMII/MII management clock.
  input            gmii_mdi_i;       // GMII/MII mgmt data input. 
  output           gmii_mdo_o;       // GMII/MII mgmt data output.
  output           gmii_mdo_o_e;     // GMII/MII mgmt data o/p enable.

  // valid for either TBI/SGMII interface
                                      // to lock to PMA received clock .

  // Transmit PHY Interface.
                                           
  output           phy_txen_o;           // Transmit data Enable - GMII/RGMII/RMII, 
                                         // 9th bit of trasnmit code group - TBI/SGMII.
                                         // SYNC (TXSYNC in Source Sync Mode) signal - SMII.
  output           phy_txer_o;           // Transmit Error - GMII.
                                         // 10th bit of transmit code group - TBI/SGMII
                                         
  output [`TXD_IOW-1:0]  phy_txd_o;      // Transmit Data[7:0] - GMII/TBI/SGMII
                                         // Transmit Data[3:0] - RGMII/RTBI/MII.
                                         // Transmit Data[1:0] - RMII.
                                         // Transmit Data[0]   - SMII.
  // PHY Receive Interface 
  input            phy_rxdv_i;             // Receive data valid signal - GMII/MII.
                                           // 9th bit of receive code group - TBI/SGMII.
                                           // rctl     - RGMII
                                           // crs_dv   - RMII
                                           // Source Sync Mode RXSYNC signal - SMII.
  input            phy_rxer_i;             // Receive error-GMII/MII.
                                           // 10th bit of receive code group - TBI/SGMII.
  
  input  [`RXD_IOW-1:0]  phy_rxd_i;        // Receive Data [7:0] in GMII/TBI/SGMII.
                                           // Receive Data [3:0] in RGMII/RTBI/MII.
                                           // Receive Data [1:0] in RMII.
                                           // Receive Data [0] in SMII.
  input            phy_crs_i;              // Carrier Sense in GMII/MII
  
  input            phy_col_i;              // Collision Detect in GMII/MII.

// Internal wire declarations

 wire  [17:0]                   ati_txstatus;     // 18-bit Status to application       
 wire                           ari_fifo_ovflo_o;

 wire                           mti_rdy_o;
 wire                           mti_val_i;
 wire  [`DATAWIDTH-1:0]         mti_data_i;
 wire                           mti_sof_i;
 wire                           mti_eof_i;
 wire  [`DATAWIDTH/64+1:0]      mti_be_i;
 wire                           mti_dispad_i; 
 wire                           mti_discrc_i;
 wire                           mti_txfifoflush_i;
 wire                           mti_flowctrl_i;
 wire                           mti_txstatus_val_o;
 wire  [31:0]                   mti_txstatus_o;
 wire                           sct_portselect_o;
 wire [9:0]                     sca_mtl_dbg_sts;  // MTL Debug status
 wire                           mri_val_o;  
 wire  [`DATAWIDTH-1:0]         mri_data_o;
 wire  [`DATAWIDTH/64+1:0]      mri_be_o;
 wire                           mri_sof_o;
 wire                           mri_eof_o;
 wire  [`CORE_STATUS_WIDTH-1:0] mri_rxstatus_o;
 wire   [17:0] omr_mtl_ctrl; //Operation mode register fields that control the MTL

 wire                           omr_wr_byte0_i;
 wire                           omr_wr_byte1_i;
 wire                           omr_wr_byte2_i;

  wire  [31:0]                   omr_data; 

  

  
  wire                            clk_app;
  wire [31:0]                     rdata;
  wire                            clk_csr;
  wire                            rst_clk_csr;               






  assign clk_app = clk_app_i;


  assign clk_csr = clk_app_i;

  assign rst_clk_csr = rst_clk_app_n;
  
  assign rdata = omr_data;

  assign ati_txstatus_o = {{6{`L}},ati_txstatus};







// Module Instantiations







DWC_gmac_mtl
 DWC_gmac_mtl_inst (
              .clk_app_i(clk_app),
                                .rst_clk_app_n(rst_clk_app_n),
                                .clk_tx_i(clk_tx_i),
                                .clk_rx_i(clk_rx_i),
                                .rst_clk_tx_n(rst_clk_tx_n),
                                .rst_clk_rx_n(rst_clk_rx_n),
                                .ati_val_i(ati_val_i),
                                .ati_sof_i(ati_sof_i),
                                .ati_eof_i(ati_eof_i),
                                .ati_data_i(ati_data_i),
                                .ati_be_i(ati_be_i),
                                .ati_rdy_o(ati_rdy_o),
                                .ati_pbl_i(ati_pbl_i),
                                .ati_tx_watermark_o(ati_tx_watermark_o),
                                .ati_dispad_i(ati_dispad_i),       
                                .ati_discrc_i(ati_discrc_i),
                                .ati_txstatus_val_o(ati_txstatus_val_o),
                                .ati_txstatus_o(ati_txstatus),     
                                .ati_ack_i(ati_ack_i),
                                .twc_wr_addr_o(twc_wr_addr_o),
                                .twc_wr_csn_o(twc_wr_csn_o),
                                .twc_wr_data_o(twc_wr_data_o),
                                .twc_wr_en_o(twc_wr_en_o),
                                .trc_rd_addr_o(trc_rd_addr_o),
                                .trc_rd_csn_o(trc_rd_csn_o),
                                .trc_rd_data_i(trc_rd_data_i),
                                .trc_rd_en_o(trc_rd_en_o),
                                .mti_rdy_i(mti_rdy_o),
                                .mti_val_o(mti_val_i),
                                .mti_data_o(mti_data_i),
                                .mti_sof_o(mti_sof_i),
                                .mti_eof_o(mti_eof_i),
                                .mti_be_o(mti_be_i),
                                .mti_flowctrl_o(mti_flowctrl_i),
                                .mti_dispad_o(mti_dispad_i),
                                .mti_discrc_o(mti_discrc_i),
                                .mti_txfifoflush_o(mti_txfifoflush_i),
                                .mti_txstatus_val_i(mti_txstatus_val_o),
                                .mti_txstatus_i(mti_txstatus_o),     
                                .mac_portselect_i(sct_portselect_o),
                                .sca_mtl_dbg_sts(sca_mtl_dbg_sts),
                                .mri_val_i(mri_val_o),
                                .mri_data_i(mri_data_o),
                                .mri_be_i(mri_be_o),
                                .mri_sof_i(mri_sof_o),
                                .mri_eof_i(mri_eof_o),
                                .mri_rxstatus_i(mri_rxstatus_o),
                                .rwc_wr_addr_o(rwc_wr_addr_o),
                                .rwc_wr_csn_o(rwc_wr_csn_o),
                                .rwc_wr_en_o(rwc_wr_en_o),
                                .rwc_wr_data_o(rwc_wr_data_o),
                                .rwc_len_wr_addr_o(rwc_len_wr_addr_o),
                                .rwc_len_wr_en_o(rwc_len_wr_en_o),
                                .rwc_len_wr_csn_o(rwc_len_wr_csn_o),
                                .rwc_err_frame_o(rwc_err_frame_o),
                                .rrc_rd_addr_o(rrc_rd_addr_o),
                                .rrc_rd_csn_o(rrc_rd_csn_o),
                                .rrc_rd_data_i(rrc_rd_data_i),
                                .rrc_rd_en_o(rrc_rd_en_o),
                                .rrc_len_rd_addr_o(rrc_len_rd_addr_o),
                                .rrc_len_rd_csn_o(rrc_len_rd_csn_o),
                                .rrc_len_rd_data_i(rrc_len_rd_data_i),
                                .rrc_len_rd_en_o(rrc_len_rd_en_o),
                                .ari_ack_i(ari_ack_i),
                                .ari_val_o(ari_val_o),
                                .ari_sof_o(ari_sof_o),
                                .ari_eof_o(ari_eof_o),
                                .ari_data_o(ari_data_o),
                                .ari_be_o(ari_be_o),
                                .ari_rxstatus_val_o(ari_rxstatus_val_o),
                                .ari_frameflush_i(ari_frameflush_i),   
                                .ari_pbl_i(ari_pbl_i),
                                .ari_rx_watermark_o(ari_rx_watermark_o),
                                .ari_rxfifo_frm_cnt_o(ari_rxfifo_frm_cnt_o),
                                .ari_frame_len_o(ari_frame_len_o),
                                .ari_frame_len_val_o(ari_frame_len_val_o),
                                .ari_err_frame_o(ari_err_frame_o),
                                .omr_mtl_ctrl(omr_mtl_ctrl),   
                                .omr_wr_byte0_i(omr_wr_byte0_i),
                                .omr_wr_byte1_i(omr_wr_byte1_i),
                                .omr_wr_byte2_i(omr_wr_byte2_i),
                                .ati_txfifoflush_clr_o(ati_txfifoflush_clr_o),
                                .ari_fifo_ovflo_o(ari_fifo_ovflo_o)
                                );


// ---------------------------------------------
// OMR Instantiation
// ---------------------------------------------

  DWC_gmac_mdc_omr
   DWC_gmac_mdc_omr_inst (
    .clk_csr_i(clk_csr),
                                          .rst_clk_csr_n(rst_clk_csr),
                                          .mci_val_i(mci_val_i),
                                          .mci_addr_i(mci_addr_i[13:2]),
                                          .mci_rd_wrn_i(mci_rdwrn_i),
                                          .mci_wdata_i(mci_wdata_i),
                                          .mci_be_i(mci_be_i),
                                          .omr_data(omr_data),
                                          .mci_ack_i(mci_ack_o),
                                          .csr_txfifoflush_clr(ati_txfifoflush_clr_o),
                                          .omr_wr_byte0_o(omr_wr_byte0_i),
                                          .omr_wr_byte1_o(omr_wr_byte1_i),
                                          .omr_wr_byte2_o(omr_wr_byte2_i),
                                          .omr_mtl_ctrl_o(omr_mtl_ctrl)
                                          );



// ---------------------------------------------
// GMAC Core Instantiation
// ---------------------------------------------

DWC_gmac
 DWC_gmac_inst(
          .clk_tx_i(clk_tx_i),       
                       .clk_rx_i(clk_rx_i),
                       .clk_csr_i(clk_csr),
                       .rst_clk_csr_n(rst_clk_csr),
                       .rst_clk_tx_n(rst_clk_tx_n),
                       .rst_clk_rx_n(rst_clk_rx_n),
                       .mac_speed_o(mac_speed_o),
                       .mti_val_i(mti_val_i),          
                       .mti_data_i(mti_data_i),
                       .mti_sof_i(mti_sof_i),
                       .mti_eof_i(mti_eof_i),
                       .mti_be_i(mti_be_i),
                       .mti_discrc_i(mti_discrc_i),
                       .mti_dispad_i(mti_dispad_i),
                       .mti_txfifoflush_i(mti_txfifoflush_i),
                       .mti_flowctrl_i(mti_flowctrl_i),
                       .mti_rdy_o(mti_rdy_o),
                       .mti_txstatus_o(mti_txstatus_o),
                       .mti_txstatus_val_o(mti_txstatus_val_o),
                       .mri_val_o(mri_val_o),      
                       .mri_data_o(mri_data_o),
                       .mri_be_o(mri_be_o),
                       .mri_sof_o(mri_sof_o),
                       .mri_eof_o(mri_eof_o),
                       .mri_rxstatus_o(mri_rxstatus_o),
                       .mci_val_i(mci_val_i),   
                       .mci_addr_i(mci_addr_i),
                       .mci_rdwrn_i(mci_rdwrn_i),
                       .mci_wdata_i(mci_wdata_i),
                       .mci_be_i(mci_be_i),    
                       .mci_ack_o(mci_ack_o),
                       .mci_rdata_o(mci_rdata_o),
                       .mci_intr_o(mci_intr_o),
                       .sca_fifooverflow(ari_fifo_ovflo_o),
                       .sca_mtl_dbg_sts(sca_mtl_dbg_sts),
                       .dcr_data(rdata),
                       // MII Management Interface.
                       .gmii_mdc_o(gmii_mdc_o),   
                       .gmii_mdi_i(gmii_mdi_i),
                       .gmii_mdo_o(gmii_mdo_o),
                       .gmii_mdo_o_e(gmii_mdo_o_e),
                       .sct_portselect_o(sct_portselect_o), 
                       .phy_txen_o(phy_txen_o), 
                       .phy_txer_o(phy_txer_o),
                       .phy_txd_o(phy_txd_o),
                       .phy_crs_i(phy_crs_i),
                       .phy_col_i(phy_col_i),
                       .phy_rxdv_i(phy_rxdv_i),
                       .phy_rxer_i(phy_rxer_i),
                       .phy_rxd_i(phy_rxd_i)
                       );







endmodule
