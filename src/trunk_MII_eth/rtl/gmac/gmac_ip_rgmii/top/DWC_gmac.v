//----------------------------------------------------------------------------
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
//----------------------------------------------------------------------------
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2008/08/13 $
// File Version     :        $Revision: #56 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// Gigabit Media Access Controller(DWC_gmac.v)
//
// Description:
// This is the top level module of GMAC consisting of following building
// block such as
// 1.MAC Transmit Controller.
// 2.MAC Transmit Engine.
// 3.MAC Receive Engine.
// 4.MAC Receive Controller.
// 5.Address Filter Block.
// 6.GMAC CSR Block.
// 7.GMAC SYNC Block.
// 8.MAC Management Counters(optional).
// 9.Power Management Block(optional).
// 10.Station Management Block(optional).
// 11.RGMII Block(optional).
// 12.PCS Block(optional).
// 13.SGM Block(optional).
// 14.RMII Block(optional).
// 15.PHY Interface Mux.
//------------------------------------------------------------------------------- 


module DWC_gmac (
        
        // Clocks and resets
        clk_tx_i,
                 clk_rx_i,
                 clk_csr_i,
                 rst_clk_tx_n,
                 rst_clk_rx_n,
                 rst_clk_csr_n,
                 clk_tx_180_i,
                 rst_clk_tx_180_n,
                 clk_rx_180_i,
                 rst_clk_rx_180_n,
                 // MAC Transmit Interface(MTI)
                 mti_val_i,
                 mti_data_i,
                 mti_sof_i,
                 mti_eof_i,
                 mti_be_i,
                 mti_discrc_i,
                 mti_dispad_i,
                 mti_txfifoflush_i,     
                 mti_flowctrl_i,
                 mti_rdy_o,
                 mti_txstatus_o,
                 mti_txstatus_val_o,
                 mri_val_o,
                 mri_data_o,
                 mri_be_o,
                 mri_sof_o,
                 mri_eof_o,
                 mri_rxstatus_o,
                 // MAC Control Interface(MCI)
                 mci_val_i,
                 mci_addr_i,
                 mci_rdwrn_i,
                 mci_wdata_i,
                 mci_be_i,
                 mci_ack_o,
                 mci_rdata_o,
                 mci_intr_o,
                 dcr_data,
                 sca_fifooverflow,
                 // MII Management Interface.
                 gmii_mdc_o,
                 gmii_mdi_i,
                 gmii_mdo_o,
                 gmii_mdo_o_e,
                 sct_portselect_o,
                 mac_portselect_o,
                 sca_mtl_dbg_sts,
                 phy_intf_sel_i,
                 phy_txen_o,
                 phy_txer_o,
                 phy_txd_o,
                 phy_crs_i,
                 phy_col_i,
                 phy_rxdv_i,
                 phy_rxer_i,
                 phy_rxd_i
                 );

// Input and Ouput port declarations.
  input                      clk_tx_i;              // GMII/MII transmit reference
                                                    // clock (2.5/25/125)Mhz.
                                                    
  input                      clk_rx_i;              // GMII/MII receive clock 
                                                    // from PHY (2.5/25/125)mhz.
      
  input                      clk_csr_i;             // Application Clock.
  

  input                      rst_clk_tx_n;          // Active Low reset synchronous
                                                    // to clk_tx_i.
                                                    
  input                      rst_clk_rx_n;          // Active Low reset synchronous
                                                    // to clk_rx_i.
                                                    
  input                      rst_clk_csr_n;         // Active Low reset synchronous
                                                    // to clk_csr_i.

                                                   // to clk_csr_i. This is longer 
                                                   // than rst_clk_csr_n
  
    input                    clk_tx_180_i;          // 180 phase shifted clk_tx_i.
    input                    rst_clk_tx_180_n;      // Active Low reset synchronous
                                                    // to clk_tx_180_i.

    input                    clk_rx_180_i;          // 180 phase shifter clk_rx_i.
                                                    
    input                    rst_clk_rx_180_n;      // Active Low reset synchronous
                                                    // to clk_tx_180_i.
  
                                                    // (125)MHz.
                                                    
                                                    // to clk_tx_125_i. 
                                                    
                                                    // to clk_tx_125_180_i.
                                                    
                                                    // 125 Mhz.
                                                    
                                                    // to clk_rx_125_i.
                                                    
                                                    
                                         
  
                                                    // to clk_pmarx1_i.
                                                    // of light/voltage
                                                    // at the PMD device input

                                                    // to clk_rmii_i.
                                                    




// MAC Transmit Interface(MTI)
  input                      mti_val_i;         // Data valid signal.
  input  [`DATAWIDTH-1:0]    mti_data_i;        // 32/64/128-bit application data.
  input                      mti_sof_i;         // Start of frame signal.
  input                      mti_eof_i;         // End of frame signal.
  input  [`DATAWIDTH/64+1:0] mti_be_i;          // Byte enables for application data.
  input                      mti_discrc_i;      // Disable FCS addition in GMAC.
  input                      mti_dispad_i;      // Disable padding in GMAC.

  input                      mti_txfifoflush_i; // Tx FIFO Flush pulse from appln.  
  input                      mti_flowctrl_i;    // H/W request to transmit control 
                                                // frame or activate backpressure.
  
  output                     mti_rdy_o;         // Ready signal for application.
  output [31:0]              mti_txstatus_o;    // Transmit Frame Status from GMAC.
  output                     mti_txstatus_val_o;// Status valid from GMAC.

// MAC Receive Interface(MRI)

  output                     mri_val_o;         // Data valid signal.
  output [`DATAWIDTH-1:0]    mri_data_o;        // Frame data to application.
  output [`DATAWIDTH/64+1:0] mri_be_o;          // Encoded Byte enable.
  output                     mri_sof_o;         // Start of Frame signal.
  output                     mri_eof_o;         // End of frame signal.
  output [`CORE_STATUS_WIDTH-1:0] mri_rxstatus_o; // status of received frame.


// MAC Control Interface(MCI)
  input            mci_val_i;      // signal to validate address, Read/write 
                                   // data of CSR access.
                                   
  input  [13:0]    mci_addr_i;     // CSR Read/Write address.
  input            mci_rdwrn_i;    // signal indicating Read/Write of CSR
                                   // access.
                                   
  input  [31:0]    mci_wdata_i;    // Write data for CSR access.
  input  [3:0]     mci_be_i;       // Byte enables for CSR access. 
  output           mci_ack_o;      // Ack from CSR for all data transfers.
  output [31:0]    mci_rdata_o;    // Read data from CSR to the application.
  
  output           mci_intr_o;       // ORing of interrupts from MMC ,PCS and 
                                     // software reset is in progress.
  input [31:0]     dcr_data;         // DMA CSR data in case of GMAC CSR is
                                     // used in one of the Subsystem config.
  input            sca_fifooverflow; // FIFO overflow signal from MAC
                                     // Transaction layer ,when this core is 
                                     // used with MTL.
  // GMII/MII Management Interface.
  output           gmii_mdc_o;       // GMII/MII management clock.
  input            gmii_mdi_i;       // GMII/MII mgmt data input. 
  output           gmii_mdo_o;       // GMII/MII mgmt data output.
  output           gmii_mdo_o_e;     // GMII/MII mgmt data o/p enable.
                                   // interrupts due to PMT events. 
  output           sct_portselect_o; // mac_portselect signal sync'd to clk_tx_i.

  output           mac_portselect_o; // Signal indicating the default
                                   // PHY interface of MAC
                                   // MII - 1, GMII -0
  input  [9:0]     sca_mtl_dbg_sts;  // MTL Debug status
  input  [2:0]     phy_intf_sel_i;   // signal used to select one among various 
                                     // PHY Interface available 
                                     // for GMAC. This is sampled only when 
                                     // rst_clk_tx_n is active low
                                     // 000-GMII/MII,001-RGMII,010-SGMII,
                                     // 011-TBI, 100-RMII, 101-RTBI, 110-SMII.
                                     
// PHY Interface.

  // valid for either TBI/SGMII/RGMII interface
                                      // to lock to PMA received clock .
 
  // Transmit PHY Interface.
                                           
  output           phy_txen_o;           // Transmit data Enable - GMII/RGMII/RMII, 
                                         // 9th bit of transmit code group - TBI/SGMII.
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


 
  
  // Internal wire declarations.
  
  wire                    gmii_txen_o;
  wire                    gmii_txer_o;
  wire  [`TXD_WIDTH-1:0]  gmii_txd_o;
  
  wire  [`RXD_WIDTH-1:0]  gmii_rxd;
  wire                    gmii_rxdv;
  wire                    gmii_rxer;
  wire                    gmii_crs;
  wire                    gmii_col;
 
  wire   [7:0]     rgmii_rxd;
  wire             rgmii_rxdv;
  wire             rgmii_rxer;
  wire             rgmii_col;
  wire             rgmii_crs;

  wire  [2:0]      phy_select;
  
  wire             rst_clk_tx_n;
  wire             rst_clk_rx_n;
  
  wire             tfc_req;
  wire  [7:0]      tfc_data;
  wire             tfc_data_valid;
  wire             tfc_sof;
  wire             tfc_eof;
  wire  [31:0]     tfc_txstatus;
  wire             tfc_txstatus_valid;
  wire  [1:0]      tfc_fsm_sts;
  wire             tpe_gnt;
  wire             tpe_ack;
  wire             tpe_abort;
  wire  [31:0]     tpe_txstatus;
  wire             tpe_txstatus_valid;
  wire  [1:0]      mte_dbg_sts;
  
  wire             rpe_data_valid;
  wire  [7:0]      rpe_data;
  wire             rpe_sof;
  wire             rpe_eof;
  wire             rpe_payload_start;
  wire             rpe_padcrc_strip;
  wire             rpe_status_valid;
  wire  [13:0]     rpe_rcvd_frame_size;
  wire  [23:0]     rpe_status;
  wire             rpe_fsm_sts;
  wire             frx_load_pause_time;
  wire  [15:0]     frx_pause_time;
  wire             frx2mmc_ctrlframe;
  wire             rfc_rxstatus_valid;
  wire  [25:0]     rfc_rxstatus;
  wire  [1:0]      rfc_fsm_sts;
  wire  [5:0]      crx_dacrc;
  
  wire             afb_daf_filterfail;
  wire             afb_daf_filterfail_valid;
  wire             afb_saf_filterfail;
  wire             afb_saf_filterfail_valid;
  wire             afb_rcvbroadcast;
  wire             afb_rcvmulticast;
  wire [4:0]       afb_daf_addr; 
  wire             afb_sa_selected;
  
  wire [26:2]      cr_reg0;
  wire             cr_reg0_byte0_wr;
  wire             cr_reg0_byte1_wr;
  wire             cr_reg0_byte2_wr;
  wire [11:0]      cr_reg1;
  wire             cr_reg1_byte0_wr;
  wire             cr_reg1_byte1_wr;
  wire [31:0]      cr_reg2;
  wire [31:0]      cr_reg3;
  wire [15:0]      cr_reg6;
  wire             cr_reg6_byte0_wr;
  wire [15:0]      cr_pausetime;
  wire [16:0]      cr_vlantag;
  wire [47:0]      cr_macaddr0;
  
  wire              sct_speed;

  wire              sct_link_up;
  wire              sct_tx_config;

  
  wire              sct_crs;
  wire              sct_col;
  wire              scr_col;
  wire              sct_jabber_e;
  wire              sct_jumboframe_e;
  wire [2:0]        sct_ifg;
  wire              sct_portselect_o;
  wire              scr_portselect;
  wire              sct_frameburst_e;
  wire              sct_duplexmode_o;
  wire              scr_duplexmode;
  wire              sct_disretry;
  wire [1:0]        sct_backoff_lmt;
  wire              sct_deferral_chk;
  wire              sct_transmit_e;
  wire              scr_disreceiveown;
  wire              scr_loopback_mode;
  wire              scr_type_crcstrip_e;
  wire              scr_watchdog_e;
  wire              scr_jumboframe_e;
  wire              scr_autocrcpadstrip;
  wire              scr_ipchksum_e;
  wire              scr_receive_e;
  wire [63:0]       scr_hashtable;
  wire [15:0]       sct_pausetime;
  wire              sct_backpressure;
  wire              sct_txctrlframe;
  wire              ftx_txctrl_done;
  wire              ftx_data_valid;
  wire              stx_pause_quanta;
  wire              stx_rxpause_e;
  wire              sct_txflowctrl_e;
  wire              sct_disable_zqpf;
  wire [1:0]        sct_flowthresh;
  wire              sct_load_pause_time;
  wire              sca_txctrl_done;
  wire              scr_rxflowctrl_e;
  wire              scr_unicastdetect;
  wire [1:0]        scr_passctrlframe;
  wire              scr_disbroadcast;
  wire              scr_promiscousmode;
  wire              scr_receiveall;
  wire              scr_safilter_e;
  wire              scr_sainversefilter;
  wire              scr_dainversefilter;
  wire              scr_passallmulticast;
  wire              scr_hashunicast;
  wire              scr_hashmulticast;
  wire              scr_hashnperfect_e;
  wire [16:0]       scr_vlantag;
  wire [47:0]       scr_macaddr0;
  wire [47:0]       sct_macaddr0;
  wire [6:0]        sca_mac_dbg_sts;

  wire              mci_rdwrn; //This signal is required to correct polarity of mci_rdwrn_i

  wire             cr_smacmdvld;
  wire [4:0]       cr_smaregaddr;
  wire             cr_rd_wrn;
  wire [4:0]       cr_smaphyaddr;
  wire [15:0]      cr_smadata;
  wire [3:0]       cr_appclkrange;
  wire             sma_transdone_n;
  wire  [15:0]     sma_data;
 
  wire  [3:0]       rgmii_txd_o;
  wire              rgmii_tctl_o;
  wire  [3:0]       rgmii_rxd_i;
  wire              rgmii_rctl_i;
  wire              link_status;
  wire [1:0]        link_speed;
  wire              link_mode;
  wire [3:0]        sca_rgmii_status;

  wire [5:0]        phy_intf_sts;


  



  assign mac_portselect_o = cr_reg0[15];
  assign mci_rdwrn = mci_rdwrn_i;




// MAC Transmit Controller Instance

  DWC_gmac_mtc
   DWC_gmac_mtc_inst(
                                 .clk_tx_i(clk_tx_i),
                                 .rst_clk_tx_n(rst_clk_tx_n),
                                 .mti_val_i(mti_val_i),
                                 .mti_data_i(mti_data_i),
                                 .mti_sof_i(mti_sof_i),
                                 .mti_eof_i(mti_eof_i),
                                 .mti_be_i(mti_be_i),
                                 .mti_discrc_i(mti_discrc_i),
                                 .mti_dispad_i(mti_dispad_i),
                                 .mti_flowctrl_i(mti_flowctrl_i),
                                 .mti_rdy_o(mti_rdy_o),
                                 .mti_txstatus_o(mti_txstatus_o),
                                 .mti_txstatus_val_o(mti_txstatus_val_o),
                                 .tfc_req(tfc_req),
                                 .tpe_gnt(tpe_gnt),
                                 .tfc_data(tfc_data),
                                 .tfc_data_valid(tfc_data_valid),
                                 .tfc_sof(tfc_sof),
                                 .tfc_eof(tfc_eof),
                                 .tpe_ack(tpe_ack),
                                 .tpe_abort(tpe_abort),
                                 .tpe_txstatus(tpe_txstatus),
                                 .tpe_txstatus_valid(tpe_txstatus_valid),
                                 .sct_flowthresh(sct_flowthresh),
                                 .sct_txflowctrl_e(sct_txflowctrl_e),
                                 .sct_disable_zqpf(sct_disable_zqpf),
                                 .sct_duplexmode(sct_duplexmode_o),
                                 .sct_txctrlframe(sct_txctrlframe),
                                 .ftx_txctrl_done(ftx_txctrl_done),
                                 .sct_pausetime(sct_pausetime),
                                 .sct_macaddr0(sct_macaddr0),
                                 .tfc_fsm_sts(tfc_fsm_sts),
                                 .tfc_txstatus(tfc_txstatus),
                                 .tfc_txstatus_valid(tfc_txstatus_valid),
                                 .ftx_data_valid(ftx_data_valid),
                                 .stx_rxpause_e(stx_rxpause_e),
                                 .stx_pause_quanta(stx_pause_quanta)
                                 );

// MAC Transmit Engine Instance
DWC_gmac_mte
 DWC_gmac_mte_inst (
                                .clk_tx_i(clk_tx_i),
                                .rst_clk_tx_n(rst_clk_tx_n),
                                .tfc_req(tfc_req),
                                .tpe_gnt(tpe_gnt),
                                .tfc_data(tfc_data),
                                .tfc_data_valid(tfc_data_valid),
                                .tfc_sof(tfc_sof),
                                .tfc_eof(tfc_eof),
                                .tpe_ack(tpe_ack),
                                .tpe_abort(tpe_abort),
                                .tpe_txstatus(tpe_txstatus),
                                .tpe_txstatus_valid(tpe_txstatus_valid),
                                .mte_dbg_sts(mte_dbg_sts),
                                .ftx_data_valid(ftx_data_valid),
                                .stx_rxpause_e(stx_rxpause_e),
                                .stx_pause_quanta(stx_pause_quanta),
                                .mti_flowctrl_i(mti_flowctrl_i),
                                .mti_txfifoflush_i(mti_txfifoflush_i),
                                .sct_portselect(sct_portselect_o),
                                .sct_duplexmode(sct_duplexmode_o),
                                .sct_transmit_e(sct_transmit_e),
                                .sct_disretry(sct_disretry),
                                .sct_backoff_lmt(sct_backoff_lmt),
                                .sct_backpressure(sct_backpressure),
                                .sct_txflowctrl_e(sct_txflowctrl_e),
                                .sct_frameburst_e(sct_frameburst_e),
                                .sct_deferral_chk(sct_deferral_chk),
                                .sct_jabber_e(sct_jabber_e),
                                .sct_jumboframe_e(sct_jumboframe_e),
                                .sct_ifg(sct_ifg),
                                .sct_col(sct_col),
                                .sct_crs(sct_crs),
                                .sct_load_pause_time(sct_load_pause_time),
                                .frx_pause_time(frx_pause_time),
                                .gmii_txen_o(gmii_txen_o),
                                .gmii_txer_o(gmii_txer_o),
                                .gmii_txd_o(gmii_txd_o)
                                );


// MAC Receive Controller.
DWC_gmac_mrc
 DWC_gmac_mrc_inst (
                                .clk_rx_i(clk_rx_i),
                                .rst_clk_rx_n(rst_clk_rx_n),
                                .rpe_data_valid(rpe_data_valid),
                                .rpe_data(rpe_data),
                                .rpe_sof(rpe_sof),
                                .rpe_eof(rpe_eof),
                                .rpe_payload_start(rpe_payload_start),
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
                                .mri_val_o(mri_val_o),
                                .mri_data_o(mri_data_o),
                                .mri_be_o(mri_be_o),
                                .mri_sof_o(mri_sof_o),
                                .mri_eof_o(mri_eof_o),
                                .mri_rxstatus_o(mri_rxstatus_o),
                                .scr_safilter_e(scr_safilter_e),
                                .scr_receiveall(scr_receiveall),
                                .scr_passctrlframe(scr_passctrlframe),
                                .scr_rxflowctrl_e(scr_rxflowctrl_e),
                                .scr_ipchksum_e(scr_ipchksum_e),
                                .scr_type_crcstrip_e(scr_type_crcstrip_e),
                                .scr_duplexmode(scr_duplexmode),
                                .scr_unicastdetect(scr_unicastdetect),
                                .frx_load_pause_time(frx_load_pause_time),
                                .frx_pause_time(frx_pause_time),
                                .rfc_fsm_sts(rfc_fsm_sts),
                                .frx2mmc_ctrlframe(frx2mmc_ctrlframe),
                                .rfc_rxstatus_valid(rfc_rxstatus_valid),
                                .rfc_rxstatus(rfc_rxstatus)
                                );
 
  
DWC_gmac_mre
 DWC_gmac_mre_inst(
                               .clk_rx_i(clk_rx_i),
                               .clk_tx_i(clk_tx_i),
                               .rst_clk_rx_n(rst_clk_rx_n),
                               .rst_clk_tx_n(rst_clk_tx_n),
                               .gmii_rxd_i(gmii_rxd),
                               .gmii_rxdv_i(gmii_rxdv),
                               .gmii_rxer_i(gmii_rxer),
                               .gmii_txd_o(gmii_txd_o),
                               .gmii_txen_o(gmii_txen_o),
                               .gmii_txer_o(gmii_txer_o),
                               .sct_portselect(sct_portselect_o),
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
                               .rpe_data(rpe_data),
                               .rpe_data_valid(rpe_data_valid),
                               .rpe_sof(rpe_sof),
                               .rpe_eof(rpe_eof),
                               .rpe_padcrc_strip(rpe_padcrc_strip),
                               .rpe_payload_start(rpe_payload_start),
                               .rpe_status(rpe_status),
                               .rpe_fsm_sts(rpe_fsm_sts),
                               .rpe_status_valid(rpe_status_valid),
                               .rpe_rcvd_frame_size(rpe_rcvd_frame_size),
                               .crx_dacrc(crx_dacrc)
                               );

// Address Filter Block Instance

DWC_gmac_afb
 DWC_gmac_afb_inst (
                                .clk_rx_i(clk_rx_i),
                                .rst_clk_rx_n(rst_clk_rx_n),
                                .rpe_sof(rpe_sof),
                                .rpe_eof(rpe_eof),
                                .rpe_data(rpe_data),
                                .rpe_data_valid(rpe_data_valid),
                                .crx_dacrc(crx_dacrc),
                                .scr_macaddr0(scr_macaddr0),
                                .scr_hashtable(scr_hashtable),
                                .scr_disabroadcast(scr_disbroadcast),
                                .scr_promiscousmode(scr_promiscousmode),
                                .scr_sainversefilter(scr_sainversefilter),
                                .scr_dainversefilter(scr_dainversefilter),
                                .scr_passallmulticast(scr_passallmulticast),
                                .scr_hashunicast(scr_hashunicast),
                                .scr_hashmulticast(scr_hashmulticast),
                                .scr_hashnperfect_e(scr_hashnperfect_e),
                                .afb_daf_filterfail(afb_daf_filterfail),
                                .afb_daf_filterfail_valid(afb_daf_filterfail_valid),
                                .afb_saf_filterfail(afb_saf_filterfail),
                                .afb_saf_filterfail_valid(afb_saf_filterfail_valid),
                                .afb_rcvbroadcast(afb_rcvbroadcast),
                                .afb_rcvmulticast(afb_rcvmulticast),
                                .afb_sa_selected(afb_sa_selected),
                                .afb_daf_addr(afb_daf_addr)
                                );

// GMAC CSR Block.

DWC_gmac_csr
 DWC_gmac_csr_inst (
                                .clk_csr_i(clk_csr_i)
                                ,.rst_clk_csr_n(rst_clk_csr_n)
                                ,.mci_val_i(mci_val_i)
                                ,.mci_addr_i(mci_addr_i)
                                ,.mci_rdwrn_i(mci_rdwrn)
                                ,.mci_wdata_i(mci_wdata_i)
                                ,.mci_be_i(mci_be_i)
                                ,.mci_ack_o(mci_ack_o)
                                ,.mci_rdata_o(mci_rdata_o)
                                ,.mci_intr_o(mci_intr_o)
                                ,.dcr_data(dcr_data)
                                ,.sca_mtl_dbg_sts(sca_mtl_dbg_sts)
                                ,.sca_mac_dbg_sts(sca_mac_dbg_sts)
                                ,.phy_intf_sts(phy_intf_sts)
                                ,.phy_select(phy_select)
                                ,.cr_smacmdvld(cr_smacmdvld)
                                ,.cr_smaregaddr(cr_smaregaddr)
                                ,.cr_smaphyaddr(cr_smaphyaddr)
                                ,.cr_smadata(cr_smadata)
                                ,.cr_appclkrange(cr_appclkrange)
                                ,.cr_rd_wrn(cr_rd_wrn)
                                ,.sma_transdone_n(sma_transdone_n)
                                ,.sma_data(sma_data)
                                ,.cr_reg0(cr_reg0)
                                ,.cr_reg0_byte0_wr(cr_reg0_byte0_wr)
                                ,.cr_reg0_byte1_wr(cr_reg0_byte1_wr)
                                ,.cr_reg0_byte2_wr(cr_reg0_byte2_wr)
                                ,.cr_reg1(cr_reg1)
                                ,.cr_reg1_byte0_wr(cr_reg1_byte0_wr)
                                ,.cr_reg1_byte1_wr(cr_reg1_byte1_wr)
                                ,.cr_reg2(cr_reg2)
                                ,.cr_reg3(cr_reg3)
                                ,.cr_reg6(cr_reg6)
                                ,.cr_reg6_byte0_wr(cr_reg6_byte0_wr)
                                ,.cr_pausetime(cr_pausetime)
                                ,.sca_txctrl_done(sca_txctrl_done)
                                ,.cr_vlantag(cr_vlantag)
                                ,.cr_macaddr0(cr_macaddr0)
                                );


// GMAC Synchronisation Block.

DWC_gmac_sync
 DWC_gmac_sync_inst (
                                  .clk_csr_i(clk_csr_i)
                                  ,.clk_tx_i(clk_tx_i)
                                  ,.clk_rx_i(clk_rx_i)
                                  ,.rst_clk_csr_n(rst_clk_csr_n)
                                  ,.rst_clk_tx_n(rst_clk_tx_n)
                                  ,.rst_clk_rx_n(rst_clk_rx_n)
                                  ,.sct_crs(sct_crs)
                                  ,.sct_col(sct_col)
                                  ,.scr_col(scr_col)
                                  ,.link_status(link_status)
                                  ,.link_speed(link_speed)
                                  ,.link_mode(link_mode)
                                  ,.sca_rgmii_status(sca_rgmii_status)
                                  ,.cr_reg0(cr_reg0)
                                  ,.cr_reg0_byte0_wr(cr_reg0_byte0_wr)
                                  ,.cr_reg0_byte1_wr(cr_reg0_byte1_wr)
                                  ,.cr_reg0_byte2_wr(cr_reg0_byte2_wr)
                                  ,.sct_speed(sct_speed)
                                  ,.sct_link_up(sct_link_up)
                                  ,.sct_tx_config(sct_tx_config)
                                  ,.sct_jabber_e(sct_jabber_e)
                                  ,.sct_jumboframe_e(sct_jumboframe_e)
                                  ,.sct_ifg(sct_ifg)
                                  ,.sct_portselect(sct_portselect_o)       
                                  ,.sct_frameburst_e(sct_frameburst_e)   
                                  ,.sct_duplexmode(sct_duplexmode_o)         
                                  ,.sct_disretry(sct_disretry)            
                                  ,.sct_backoff_lmt(sct_backoff_lmt)          
                                  ,.sct_deferral_chk(sct_deferral_chk)      
                                  ,.sct_transmit_e(sct_transmit_e)
                                  ,.scr_disreceiveown(scr_disreceiveown) 
                                  ,.scr_loopback_mode(scr_loopback_mode)
                                  ,.scr_duplexmode(scr_duplexmode)
                                  ,.scr_type_crcstrip_e(scr_type_crcstrip_e)
                                  ,.scr_watchdog_e(scr_watchdog_e)
                                  ,.scr_jumboframe_e(scr_jumboframe_e)
                                  ,.scr_portselect(scr_portselect)
                                  ,.scr_autocrcpadstrip(scr_autocrcpadstrip)
                                  ,.scr_ipchksum_e(scr_ipchksum_e)
                                  ,.scr_receive_e(scr_receive_e)
                                  ,.cr_reg2(cr_reg2)
                                  ,.cr_reg3(cr_reg3)
                                  ,.scr_hashtable(scr_hashtable)
                                  ,.cr_reg6(cr_reg6)
                                  ,.cr_reg6_byte0_wr(cr_reg6_byte0_wr)
                                  ,.cr_pausetime(cr_pausetime)
                                  ,.sct_pausetime(sct_pausetime)
                                  ,.sct_backpressure(sct_backpressure)
                                  ,.sct_txctrlframe(sct_txctrlframe)
                                  ,.sct_txflowctrl_e(sct_txflowctrl_e)
                                  ,.sct_disable_zqpf(sct_disable_zqpf)
                                  ,.sct_flowthresh(sct_flowthresh)
                                  ,.frx_load_pause_time(frx_load_pause_time)
                                  ,.sct_load_pause_time(sct_load_pause_time)
                                  ,.ftx_txctrl_done(ftx_txctrl_done)
                                  ,.sca_txctrl_done(sca_txctrl_done)
                                  ,.scr_rxflowctrl_e(scr_rxflowctrl_e)
                                  ,.scr_unicastdetect(scr_unicastdetect)
                                  ,.cr_reg1(cr_reg1)
                                  ,.cr_reg1_byte0_wr(cr_reg1_byte0_wr)
                                  ,.cr_reg1_byte1_wr(cr_reg1_byte1_wr)
                                  ,.scr_passctrlframe(scr_passctrlframe)
                                  ,.scr_disbroadcast(scr_disbroadcast)
                                  ,.scr_promiscousmode(scr_promiscousmode)
                                  ,.scr_receiveall(scr_receiveall)
                                  ,.scr_safilter_e(scr_safilter_e)
                                  ,.scr_sainversefilter(scr_sainversefilter)
                                  ,.scr_dainversefilter(scr_dainversefilter)
                                  ,.scr_passallmulticast(scr_passallmulticast)
                                  ,.scr_hashunicast(scr_hashunicast)
                                  ,.scr_hashmulticast(scr_hashmulticast)
                                  ,.scr_hashnperfect_e(scr_hashnperfect_e)
                                  ,.cr_vlantag(cr_vlantag)
                                  ,.scr_vlantag(scr_vlantag)
                                  ,.tfc_fsm_sts(tfc_fsm_sts)
                                  ,.mte_dbg_sts(mte_dbg_sts)
                                  ,.rfc_fsm_sts(rfc_fsm_sts)
                                  ,.rpe_fsm_sts(rpe_fsm_sts)
                                  ,.sca_mac_dbg_sts(sca_mac_dbg_sts)
                                  ,.cr_macaddr0(cr_macaddr0)
                                  ,.scr_macaddr0(scr_macaddr0)
                                  ,.sct_macaddr0(sct_macaddr0)
                                  );

// PTP update block


  
  // Station Management Block.
  DWC_gmac_sma
   DWC_gmac_sma_inst (
                                  .clk_csr_i            (clk_csr_i),
                                  .rst_clk_csr_n        (rst_clk_csr_n),
                                  .cr_smacmdvld         (cr_smacmdvld),
                                  .cr_smard             (cr_rd_wrn),
                                  .cr_smaphyaddr        (cr_smaphyaddr),
                                  .cr_smaregaddr        (cr_smaregaddr),
                                  .cr_smadata           (cr_smadata),
                                  .cr_appclkrange       (cr_appclkrange),
                                  .gmii_mdi_i           (gmii_mdi_i),
                                  .sma_transdone_n      (sma_transdone_n),
                                  .sma_data             (sma_data),
                                  .gmii_mdc_o           (gmii_mdc_o),
                                  .gmii_mdo_o           (gmii_mdo_o),
                                  .gmii_mdo_o_e         (gmii_mdo_o_e)
                                 );


  
// RGMII Block
DWC_gmac_rgmii
 DWC_gmac_rgmii_inst (
                                    .rst_clk_tx_n(rst_clk_tx_n),
                                    .rst_clk_rx_n(rst_clk_rx_n),
                                    .clk_tx_i(clk_tx_i),
                                    .clk_rx_i(clk_rx_i),
                                    .rst_clk_tx_180_n(rst_clk_tx_180_n),
                                    .rst_clk_rx_180_n(rst_clk_rx_180_n),
                                    .clk_tx_180_i(clk_tx_180_i),
                                    .clk_rx_180_i(clk_rx_180_i),
                                    .gmii_txen(gmii_txen_o),
                                    .gmii_txer(gmii_txer_o),
                                    .gmii_txd(gmii_txd_o),
                                    .sct_portselect(sct_portselect_o),
                                    .sct_speed(sct_speed),
                                    .sct_tx_config(sct_tx_config),
                                    .sct_link_up(sct_link_up),
                                    .sct_duplexmode(sct_duplexmode_o),
                                    .rgmii_txd_o(rgmii_txd_o),
                                    .rgmii_tctl_o(rgmii_tctl_o),
                                    .rgmii_rxd_i(rgmii_rxd_i),
                                    .rgmii_rctl_i(rgmii_rctl_i),
                                    .gmii_rxd(rgmii_rxd),
                                    .gmii_rxer(rgmii_rxer),
                                    .gmii_rxdv(rgmii_rxdv),
                                    .gmii_crs(rgmii_crs),
                                    .gmii_col(rgmii_col),
                                    .link_status(link_status),
                                    .link_speed(link_speed),
                                    .link_mode(link_mode)
                                    );


  
  //-------------------------------------------------------------------------
  // Instantiation of SGM and PCS module.
  //-------------------------------------------------------------------------

  
  











  
  
 DWC_gmac_phy_txmux
  DWC_gmac_phy_txmux_inst(
                                            .clk_csr_i(clk_csr_i),
                                            .rst_clk_csr_n(rst_clk_csr_n),
                                            .sct_portselect(sct_portselect_o),
                                            .phy_intf_sel_i(phy_intf_sel_i),
                                            .phy_select(phy_select),
                                            .gmii_txen_i(gmii_txen_o),
                                            .gmii_txer_i(gmii_txer_o),
                                            .gmii_txd_i(gmii_txd_o),
                                            .rgmii_txd_i(rgmii_txd_o),
                                            .rgmii_tctl_i(rgmii_tctl_o),
                                            .phy_txen_o(phy_txen_o),
                                            .phy_txer_o(phy_txer_o),
                                            .phy_txd_o(phy_txd_o)
                                            );

  DWC_gmac_phy_rxmux
   DWC_gmac_phy_rxmux_inst(
                                             .phy_select(phy_select),
                                             .rgmii_rxd(rgmii_rxd),
                                             .rgmii_rxdv(rgmii_rxdv),
                                             .rgmii_rxer(rgmii_rxer),
                                             .rgmii_crs(rgmii_crs),
                                             .rgmii_col(rgmii_col),
                                             .sca_rgmii_status(sca_rgmii_status),
                                             .rgmii_rxd_o(rgmii_rxd_i),
                                             .rgmii_rctl_o(rgmii_rctl_i),
                                             .phy_rxd_i(phy_rxd_i),
                                             .phy_rxdv_i(phy_rxdv_i),
                                             .phy_rxer_i(phy_rxer_i),
                                             .phy_crs_i(phy_crs_i),
                                             .phy_col_i(phy_col_i),
                                             .phy_intf_sts(phy_intf_sts),
                                             .gmii_rxd(gmii_rxd),
                                             .gmii_rxdv(gmii_rxdv),
                                             .gmii_rxer(gmii_rxer),
                                             .gmii_crs(gmii_crs),
                                             .gmii_col(gmii_col)
                                             );




endmodule
