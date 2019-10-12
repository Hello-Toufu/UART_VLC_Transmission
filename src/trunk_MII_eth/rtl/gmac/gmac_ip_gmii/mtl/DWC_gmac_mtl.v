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
// Date             :        $Date: 2007/11/02 $
// File Version     :        $Revision: #42 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                   //
// MAC Transaction Layer                                                     //
//                                                                           //
// DESCRIPTION:                                                              //
// MAC Transaction Layer(MTL) is specifically used to connect to the GMAC    //
// controller to the application working at different frequency than         //
// MAC Controller.This block provides 2 FIFO controllers one and receive path//
// to easily transfer data from application clock to GMAC Transmit clock and //
// vice versa.                                                               // 
//---------------------------------------------------------------------------//

module DWC_gmac_mtl (

        clk_app_i,
                     clk_tx_i,
                     clk_rx_i,
                     rst_clk_app_n,
                     rst_clk_tx_n,
                     rst_clk_rx_n,
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
                     // MAC Transmit Interface
                     mti_rdy_i,
                     mti_val_o,
                     mti_data_o,
                     mti_sof_o,
                     mti_eof_o,
                     mti_be_o,
                     mti_flowctrl_o,
                     // MTI Transmit Control and Status signals
                     mti_dispad_o,
                     mti_discrc_o,
                     mti_txfifoflush_o,
                     mti_txstatus_val_i,
                     mti_txstatus_i,
                     // Misc
                     mac_portselect_i,
                     sca_mtl_dbg_sts,
                     // MAC Receive Interface
                     mri_val_i,
                     mri_data_i,
                     mri_be_i,
                     mri_sof_i,
                     mri_eof_i,
                     mri_rxstatus_i,
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
                     // Miscellanous Control Signals
                     omr_mtl_ctrl,
                     omr_wr_byte0_i,
                     omr_wr_byte1_i,
                     omr_wr_byte2_i,
                     ati_txfifoflush_clr_o,
                     ari_fifo_ovflo_o
                     );

// Input and Output port declarations

  input                        clk_app_i;       // Application Clock. 
  input                        clk_tx_i;        // Transmit Clock(2.5/25/125)Mhz.
  input                        clk_rx_i;        // Receive Clock(2.5/25/125)Mhz.
  
                                                // to clk_csr_i.
 
  input                        rst_clk_app_n;   // Active low reset synchroronous 
                                                // to clk_app_i.
  input                        rst_clk_tx_n;    // Active low reset synchroronous 
                                                // to clk_tx_i.
  input                        rst_clk_rx_n;    // Active low reset synchroronous 
                                                // to clk_rx_i.



// MTL Transmit Application Interface
  input                        ati_val_i;       // Trasnfer/Data valid signal. 
  input                        ati_sof_i;       // Start of frame indicator.
  input                        ati_eof_i;       // End of frame indicator.
  input  [`DATAWIDTH-1:0]      ati_data_i;      // Application data.
  input  [`DATAWIDTH/64+1:0]   ati_be_i;        // Binary encoded byte enables 
                                                // for application data.
                                                
  output                       ati_rdy_o;       // Signal indicates MTL is 
                                                // ready to accept data.
                                                   
  input  [`ATI_PBL_WIDTH-1:0]  ati_pbl_i;       // Maximum number of data phases 
                                                // during a single burst transfer
  output                       ati_tx_watermark_o; // Signal indicates the 
                                                   // availability of space in
                                                   // Txdata FIFO as requested 
                                                   // through ati_pbl_i.
                                                   
  
// MTL Transmit Control and Status Interface       
  input                        ati_dispad_i;       // Disable pad control.
  input                        ati_discrc_i;       // Disable crc control.    
  output                       ati_txstatus_val_o; // Status valid signal to
                                                   // application.
  output [17:0]                ati_txstatus_o;    // 18-bit Status to application
  input                        ati_ack_i;          // Ack for the status sent to
                                                   // application.
        
// MTL <-> TxData FIFO Write Interface
  output [`TX_FIFO_PTR_WIDTH-1:0] twc_wr_addr_o;   // Write address to Txdata FIFO
  output                       twc_wr_csn_o;    // Chip select to Txdata FIFO.
  output [`FIFO_DATA_WIDTH-1:0]twc_wr_data_o;   // Write data to Txdata FIFO.
  output                       twc_wr_en_o;     // Write enable to Txdata FIFO.
        
// MTL <-> TxData FIFO Read Interface
  output [`TX_FIFO_PTR_WIDTH-1:0] trc_rd_addr_o;   // Read address to Txdata FIFO 
  output                       trc_rd_csn_o;    // Chip select to Txdata FIFO.
  input  [`FIFO_DATA_WIDTH-1:0]trc_rd_data_i;   // Read data from Txdata FIFO.
  output                       trc_rd_en_o;     // Read enable to Txdata FIFO.
        
// MAC Transmit Interface
  input                        mti_rdy_i;       // Signal indicates GMAC is
                                                // ready to accept data.
                                                
  output                       mti_val_o;       // Signal qualifies TxData 
                                                // and control signals.
                                                
  output [`DATAWIDTH-1:0]      mti_data_o;      // Frame data.
  output                       mti_sof_o;       // Start of frame signal.
  output                       mti_eof_o;       // End of frame signal.
  output [`DATAWIDTH/64+1:0]   mti_be_o;        // Byte enables for frame
                                                // data.
  output                       mti_flowctrl_o;  // Hardware based flow control
                                                // input to GMAC block.                                                  
         
// MTI Transmit Control and Status signals 
  output                       mti_dispad_o;       // Disable pad ctrl to GMAC 
  output                       mti_discrc_o;       // Disable crc ctrl to GMAC
  output                       mti_txfifoflush_o;  // Tx FIFO Flush pulse to
                                                   // GMAC.
                                                   
  input                        mti_txstatus_val_i; // Status valid from GMAC.
  input  [31:0]                mti_txstatus_i;     // Transmit Frame Status
                                                   // from GMAC.

  
// Misc
  input                        mac_portselect_i;   // Port select from GMAC
                                                   // 1-MII, 0-GMII
  output [9:0]                 sca_mtl_dbg_sts;  // MTL Debug status

// MAC Receive Interface
  input                        mri_val_i;      // Signal qualifying frame data,  
                                               // byte enables,start of frame,
                                               // End of frame signals.
  input  [`DATAWIDTH-1:0]      mri_data_i;     // Receive Frame Data from GMAC
  input  [`DATAWIDTH/64+1:0]   mri_be_i;       // Byte Enables for frame data
  input                        mri_sof_i;      // Start of frame 
  input                        mri_eof_i;      // End of frame
  input  [`CORE_STATUS_WIDTH-1:0] mri_rxstatus_i; // 32-bit receive frame status 
        
// MTL <-> RxData FIFO Write Interface 
  output [`RX_FIFO_PTR_WIDTH-1:0] rwc_wr_addr_o;// Write address to Rxdata FIFO
  output                          rwc_wr_csn_o; // Chip select to Rxdata FIFO
  output                          rwc_wr_en_o;  // Write Enable to Rxdata FIFO
  output [`FIFO_DATA_WIDTH-1:0]   rwc_wr_data_o;// Write data to Rxdata FIFO
  
// MTL <-> Rx Frame Length FIFO write interface
   output [`MAX_FRAME_CNT_WIDTH-2:0] rwc_len_wr_addr_o; // Write address to
                                                        // Rx Frame Length FIFO
   output                            rwc_len_wr_en_o;   // Write enable to 
                                                        // Rx Frame Length FIFO
   output                            rwc_len_wr_csn_o;  // Chip select to write 
                                                        // Rx Frame Length FIFO
   output                            rwc_err_frame_o;   // Drop Error Frame flag
                                                        // to Frame Length FIFO. 

// MTL <-> RxData FIFO Read Interface.
  output [`RX_FIFO_PTR_WIDTH-1:0] rrc_rd_addr_o;// Read address of RxData FIFO
  output                          rrc_rd_csn_o; // Chip select to RxData FIFO
  input  [`FIFO_DATA_WIDTH-1:0]   rrc_rd_data_i;// Read data from RxData FIFO
  output                          rrc_rd_en_o;  // Read enable from RxData FIFO

// MMC <-> MMC

// MTL <-> Rx Frame Length FIFO read interface
  output [`MAX_FRAME_CNT_WIDTH-2:0]  rrc_len_rd_addr_o; // read address to
                                                        // Rx Frame Length FIFO
                                                        
  output                             rrc_len_rd_csn_o;  // chip select to read
                                                        // Rx Frame Length FIFO
                                                        
  input  [`FRAME_LEN_FIFO_WIDTH-1:0] rrc_len_rd_data_i; // Rx Frame Length from
                                                        // FIFO

  output                             rrc_len_rd_en_o;   // read enable to 
                                                        // Rx Frame Length FIFO
// MTL Receive Application interface.
  input                        ari_ack_i;          // Ack from application for
                                                   // received frame data and 
                                                   // received status.
                                                   
  output                       ari_val_o;          // Qualifies ari_sof_o
                                                   // ari_eof_o, ari_data_o
                                                   // ari_be_o and frame status
                                                   
  output                       ari_sof_o;          // Start of frame
  output                       ari_eof_o;          // End of frame 
  output [`DATAWIDTH-1:0]      ari_data_o;         // Frame data to application
  output [`DATAWIDTH/64+1:0]   ari_be_o;           // Byte enables for frame 
                                                   // data.
                                                   
  output                       ari_rxstatus_val_o; // Receive frame status 
                                                   // valid.
                                                   
  input                        ari_frameflush_i;   // Flush current frame, 
                                                   // request from application
                                                   
  input  [`ARI_PBL_WIDTH-1:0]  ari_pbl_i;      // Maximum number of data phases
                                              // during a single burst transfer
                                              
  output                       ari_rx_watermark_o; // Signal indicates the 
                                                   // availability of data in
                                                   // Rxdata FIFO as requested 
                                                   // through ari_pbl_i.
  output  [`MAX_FRAME_CNT_WIDTH-1:0] ari_rxfifo_frm_cnt_o; // Indicates the number of
                                                   // Frame EOFs in RxFIFO 

  output [`FRAME_LEN_FIFO_WIDTH-2:0] ari_frame_len_o;// Indicates the Length of
                                                     // frame (i.e currently 
                                                     // transmitted or pending for
                                                     
  output                        ari_frame_len_val_o; // Signal validating the
                                                     // frame length on 
                                                     // ari_frame_len_o

  output                        ari_err_frame_o;     // Signal indicates the
                                                     // error frame when forward
                                                     // error frame(bit7 of OMR)
                                                     // is not asserted.
                                                     

// Miscellanous Control Signals
  input [17:0] omr_mtl_ctrl; //Operation mode register fields that control the MTL
  
                                                  // fields that control the MTL
  input                       omr_wr_byte0_i;     // Byte0 of Operation mode 
                                                  // reg is written
  input                       omr_wr_byte1_i;     // Byte1 of Operation mode 
                                                  // reg is written
  input                       omr_wr_byte2_i;     // Byte2 of Operation mode 
                                                  // reg is written
                                                  

  output                      ati_txfifoflush_clr_o;  // Signal to clear the
                                                      // FIFO flush input from
                                                      // CSR.
  output                      ari_fifo_ovflo_o;   // Signal indicates dropping 
                                                  // of frame in MTL due to 
                                                  // fifo overflow                                                         
                                                    

// Internal Wire declarations
  wire                           ari_fifo_ovflo_o;



  wire                           sw_flush_done_sync;
  wire                           sts_wr_done_sync;  
  wire                           frame_abort_sync;  
  wire [`TX_FIFO_PTR_WIDTH-1:0]  trc_rdptr_2_wr_sync;   
  wire [`TX_FIFO_PTR_WIDTH:0]    twc_wrptr_2_rd;
  wire                           tsb_wrptr_2_rd_ack;
  wire                           twc_dpdc_wr;       
  wire [1:0]                     twc_dpdc_data;     
  wire                           twc_sts_fifo_rd;   
  wire                           sts_fifo_empty;    
  wire [2:0]                     sca_txthreshctrl;  
  wire                           sca_str_n_fwd;     
  wire                           sca_txfifoflush;   
  wire                           clk_tx_i;      
  wire                           rst_clk_tx_n;   
                                               
  wire                           trc_sts_wr_done;
  wire [17:0]                    trc_sts_wdata;
  wire [17:0]                    sts_rd_data;       
  wire [`STS_WIDTH-1:0]          tx_sts_wdata;
  wire [`STS_WIDTH-1:0]          tx_sts_rdata;       
  wire                           trc_dpdc_rd;
  wire [`TX_FIFO_PTR_WIDTH:0]    twc_wrptr_2_rd_sync;
  wire                           tsb_wrptr_2_rd_sync_ack;
 
  
  wire                           trc_sw_flush_done;  
  wire                           trc_abort_detect;    
  wire [`TX_FIFO_PTR_WIDTH-1:0]  trc_rdptr_2_wr;
  wire  [1:0]                    scr_rxthreshctrl;                                                    
  wire  [2:0]                    scr_thresh_act; 
  wire  [2:0]                    scr_thresh_deact; 

  wire                           rwc_flowctrl;
  wire                           scr_hwflowctrl_e;
  wire                           scr_fwd_runt_e;
  wire                           scr_fwd_err_frame;
  wire                           scr_str_n_fwd;
  wire                           rwc_fifo_ovf;
  wire                           rwc_sts_wrtn;
  wire                           rwc_sts_wrtn_sync;
  wire                           rsb_wrptr_2_rd_syncd;
  wire                           rsb_ack_wrptr_2_rd;
  wire  [`RX_FIFO_PTR_WIDTH:0]   rwc_wrptr_2_rd;
  wire  [`RX_FIFO_PTR_WIDTH:0]   rwc_wrptr_2_rd_sync;
  wire  [`RX_FIFO_PTR_WIDTH:0]   rrc_rdptr_2_wr;
  wire  [`RX_FIFO_PTR_WIDTH:0]   rrc_rdptr_2_wr_sync;
  wire                           inst1_fifo_empty_wire;
  wire                           inst1_fifo_full_wire;
  wire                           sts_fifo_full;
  wire [1:0]                     twc_dbg_sts;
  wire [1:0]                     trc_dbg_sts;
  wire [2:0]                     rwc_dbg_sts;
  wire [1:0]                     rrc_dbg_sts;
  wire [9:0]                     sca_mtl_dbg_sts;  // MTL Debug status


// TWC Block Instantiation
DWC_gmac_mtl_twc
  DWC_gmac_mtl_twc_inst (
                   .clk_app_i(clk_app_i),
                                         .rst_clk_app_n(rst_clk_app_n),
                                         .ati_val_i(ati_val_i),
                                         .ati_sof_i(ati_sof_i),
                                         .ati_eof_i(ati_eof_i),
                                         .ati_data_i(ati_data_i),
                                         .ati_be_i(ati_be_i),
                                         .ati_rdy_o(ati_rdy_o),
                                         .ati_pbl_i(ati_pbl_i),
                                         .ati_tx_watermark_o(ati_tx_watermark_o),
                                         .twc_wr_addr_o(twc_wr_addr_o),
                                         .twc_wr_csn_o(twc_wr_csn_o),
                                         .twc_wr_data_o(twc_wr_data_o),
                                         .twc_wr_en_o(twc_wr_en_o),
                                         .sw_flush_done_sync(sw_flush_done_sync),
                                         .sts_wr_done_sync(sts_wr_done_sync),
                                         .frame_abort_sync(frame_abort_sync),
                                         .rdptr_2_wr_sync(trc_rdptr_2_wr_sync),
                                         .twc_wrptr_2_rd(twc_wrptr_2_rd), 
                                         .tsb_wrptr_2_rd_ack(tsb_wrptr_2_rd_ack), 
                                         .ati_dispad_i(ati_dispad_i),
                                         .ati_discrc_i(ati_discrc_i),
                                         .twc_dpdc_wr(twc_dpdc_wr),
                                         .twc_dpdc_data(twc_dpdc_data),
                                         .twc_sts_fifo_rd(twc_sts_fifo_rd),
                                         .sts_rd_data(sts_rd_data),
                                         .sts_fifo_empty(sts_fifo_empty),
                                         .ati_txstatus_val_o(ati_txstatus_val_o),
                                         .ati_txstatus_o(ati_txstatus_o),
                                         .ati_ack_i(ati_ack_i),
                                         .twc_dbg_sts(twc_dbg_sts),
                                         .sca_txthreshctrl(sca_txthreshctrl),
                                         .sca_str_n_fwd(sca_str_n_fwd),
                                         .ati_txfifoflush_clr_o(ati_txfifoflush_clr_o),
                                         .sca_txfifoflush(sca_txfifoflush)
                                         );

DWC_gmac_mtl_trc
 DWC_gmac_mtl_trc_inst (
                  .clk_tx_i(clk_tx_i),
                                        .rst_clk_tx_n(rst_clk_tx_n),
                                        .mti_rdy_i(mti_rdy_i),
                                        .mti_val_o(mti_val_o),
                                        .mti_data_o(mti_data_o),
                                        .mti_sof_o(mti_sof_o),
                                        .mti_eof_o(mti_eof_o),
                                        .mti_be_o(mti_be_o),
                                        .mti_txfifoflush_o(mti_txfifoflush_o),
                                        .mti_txstatus_val_i(mti_txstatus_val_i),
                                        .mti_txstatus_i(mti_txstatus_i),
                                        .trc_sts_wr_done(trc_sts_wr_done),
                                        .trc_sts_wdata(trc_sts_wdata),
                                        .trc_rd_addr_o(trc_rd_addr_o),
                                        .trc_rd_csn_o(trc_rd_csn_o),
                                        .trc_rd_data_i(trc_rd_data_i),
                                        .trc_rd_en_o(trc_rd_en_o),
                                        .trc_dpdc_rd(trc_dpdc_rd),
                                        .wrptr_2_rd_sync(twc_wrptr_2_rd_sync),
                                        .tsb_wrptr_2_rd_sync_ack(tsb_wrptr_2_rd_sync_ack),
                                        .trc_sw_flush_done(trc_sw_flush_done),
                                        .trc_abort_detect(trc_abort_detect),
                                        .trc_rdptr_2_wr(trc_rdptr_2_wr),
                                        .trc_dbg_sts(trc_dbg_sts),
                                        .mac_portselect_i(mac_portselect_i)
                                        );


DWC_gmac_mtl_rwc
 DWC_gmac_mtl_rwc_inst (
                  .clk_rx_i(clk_rx_i),
                                        .rst_clk_rx_n(rst_clk_rx_n),
                                        .mri_val_i(mri_val_i),
                                        .mri_data_i(mri_data_i),
                                        .mri_be_i(mri_be_i),
                                        .mri_sof_i(mri_sof_i),
                                        .mri_eof_i(mri_eof_i),
                                        .mri_rxstatus_i(mri_rxstatus_i),
                                        .rwc_wr_addr_o(rwc_wr_addr_o),
                                        .rwc_wr_csn_o(rwc_wr_csn_o),
                                        .rwc_wr_en_o(rwc_wr_en_o),
                                        .rwc_wr_data_o(rwc_wr_data_o),
                                        .rwc_len_wr_addr_o(rwc_len_wr_addr_o),
                                        .rwc_len_wr_en_o(rwc_len_wr_en_o),
                                        .rwc_len_wr_csn_o(rwc_len_wr_csn_o),       
                                        .rwc_err_frame_o(rwc_err_frame_o),
                                        .scr_rxthreshctrl(scr_rxthreshctrl),
                                        .scr_thresh_act(scr_thresh_act),
                                        .scr_thresh_deact(scr_thresh_deact),
                                        .scr_hwflowctrl_e(scr_hwflowctrl_e),
                                        .scr_fwd_runt_e(scr_fwd_runt_e),
                                        .scr_fwd_err_frame(scr_fwd_err_frame),
                                        .scr_str_n_fwd(scr_str_n_fwd),
                                        .rsb_ack_wrptr_2_rd(rsb_ack_wrptr_2_rd),
                                        .rwc_fifo_ovf(rwc_fifo_ovf),
                                        .rwc_sts_wrtn(rwc_sts_wrtn),
                                        .rdptr_2_wr_sync(rrc_rdptr_2_wr_sync),
                                        .rwc_dbg_sts(rwc_dbg_sts),
                                        .rwc_flowctrl(rwc_flowctrl),
                                        .rwc_wrptr_2_rd(rwc_wrptr_2_rd)
                                        );

DWC_gmac_mtl_rrc
 DWC_gmac_mtl_rrc_inst (
                  .clk_app_i(clk_app_i),
                                        .rst_clk_app_n(rst_clk_app_n),
                                        .ari_ack_i(ari_ack_i),
                                        .ari_val_o(ari_val_o),
                                        .ari_sof_o(ari_sof_o),
                                        .ari_eof_o(ari_eof_o),
                                        .ari_data_o(ari_data_o),
                                        .ari_be_o(ari_be_o),
                                        .ari_rxstatus_val_o(ari_rxstatus_val_o),
                                        .rrc_rd_addr_o(rrc_rd_addr_o),
                                        .rrc_rd_csn_o(rrc_rd_csn_o),
                                        .rrc_rd_data_i(rrc_rd_data_i),
                                        .rrc_rd_en_o(rrc_rd_en_o),
                                        .rrc_len_rd_addr_o(rrc_len_rd_addr_o),
                                        .rrc_len_rd_csn_o(rrc_len_rd_csn_o),
                                        .rrc_len_rd_data_i(rrc_len_rd_data_i),
                                        .rrc_len_rd_en_o(rrc_len_rd_en_o),
                                        .rwc_sts_wrtn_sync(rwc_sts_wrtn_sync),
                                        .wrptr_2_rd_sync(rwc_wrptr_2_rd_sync),
                                        .rsb_wrptr_2_rd_syncd(rsb_wrptr_2_rd_syncd),
                                        .rrc_rdptr_2_wr(rrc_rdptr_2_wr),
                                        .rrc_dbg_sts(rrc_dbg_sts),
                                        .ari_frameflush_i(ari_frameflush_i),
                                        .ari_pbl_i(ari_pbl_i),
                                        .ari_rxfifo_frm_cnt_o(ari_rxfifo_frm_cnt_o),
                                        .ari_frame_len_o(ari_frame_len_o),
                                        .ari_frame_len_val_o(ari_frame_len_val_o),
                                        .ari_err_frame_o(ari_err_frame_o),
                                        .ari_rx_watermark_o(ari_rx_watermark_o)
                                        );

DWC_gmac_mtl_tsb
 DWC_gmac_mtl_tsb_inst (
                  .clk_app_i(clk_app_i),
                                        .clk_tx_i(clk_tx_i),
                                        .rst_clk_app_n(rst_clk_app_n),
                                        .rst_clk_tx_n(rst_clk_tx_n),
                                        .twc_wrptr_2_rd(twc_wrptr_2_rd),
                                        .twc_dbg_sts(twc_dbg_sts),
                                        .tsb_wrptr_2_rd_ack(tsb_wrptr_2_rd_ack),
                                        .sw_flush_done_sync(sw_flush_done_sync),
                                        .sts_wr_done_sync(sts_wr_done_sync),
                                        .frame_abort_sync(frame_abort_sync),
                                        .rdptr_2_wr_sync(trc_rdptr_2_wr_sync),
                                        .sca_txfifoflush(sca_txfifoflush),
                                        .sca_txthreshctrl(sca_txthreshctrl),
                                        .sca_str_n_fwd(sca_str_n_fwd),
                                        .omr_mtl_ctrl(omr_mtl_ctrl[13:0]),
                                        .omr_wr_byte0(omr_wr_byte0_i),
                                        .omr_wr_byte1(omr_wr_byte1_i),
                                        .omr_wr_byte2(omr_wr_byte2_i),
                                        .sca_mtl_tx_dbg_sts(sca_mtl_dbg_sts[9:5]),
                                        .trc_sw_flush_done(trc_sw_flush_done),
                                        .trc_sts_wr_done(trc_sts_wr_done),
                                        .trc_abort_detect(trc_abort_detect),
                                        .trc_rdptr_2_wr(trc_rdptr_2_wr),
                                        .trc_dstatus({sts_fifo_full,trc_dbg_sts}),
                                        .wrptr_2_rd_sync(twc_wrptr_2_rd_sync),
                                        .tsb_wrptr_2_rd_sync_ack(tsb_wrptr_2_rd_sync_ack)
                                        );

DWC_gmac_mtl_rsb
 DWC_gmac_mtl_rsb_inst (
                  .clk_app_i(clk_app_i),
                                        .clk_tx_i(clk_tx_i),
                                        .clk_rx_i(clk_rx_i),
                                        .rst_clk_app_n(rst_clk_app_n),
                                        .rst_clk_tx_n(rst_clk_tx_n),
                                        .rst_clk_rx_n(rst_clk_rx_n),
                                        .rwc_fifo_ovf(rwc_fifo_ovf),
                                        .rwc_sts_wrtn(rwc_sts_wrtn),
                                        .rwc_wrptr_2_rd(rwc_wrptr_2_rd),
                                        .rwc_dbg_sts(rwc_dbg_sts),
                                        .rwc_flowctrl(rwc_flowctrl),
                                        .fifo_ovflo(ari_fifo_ovflo_o),
                                        .rdptr_2_wr_sync(rrc_rdptr_2_wr_sync),
                                        .rsb_ack_wrptr_2_rd(rsb_ack_wrptr_2_rd),
                                        .rrc_rdptr_2_wr(rrc_rdptr_2_wr),
                                        .rrc_dbg_sts(rrc_dbg_sts),
                                        .wrptr_2_rd_sync(rwc_wrptr_2_rd_sync),
                                        .rsb_wrptr_2_rd_syncd(rsb_wrptr_2_rd_syncd),
                                        .rwc_sts_wrtn_sync(rwc_sts_wrtn_sync),
                                        .sct_flowctrl(mti_flowctrl_o),
                                        .sca_mtl_rx_dbg_sts(sca_mtl_dbg_sts[4:0]),
                                        .omr_mtl_ctrl(omr_mtl_ctrl),        
                                        .omr_wr_byte0(omr_wr_byte0_i),
                                        .omr_wr_byte1(omr_wr_byte1_i),
                                        .scr_rxthreshctrl(scr_rxthreshctrl),
                                        .scr_thresh_act(scr_thresh_act),
                                        .scr_thresh_deact(scr_thresh_deact),
                                        .scr_hwflowctrl_e(scr_hwflowctrl_e),
                                        .scr_fwd_runt_e(scr_fwd_runt_e),
                                        .scr_fwd_err_frame(scr_fwd_err_frame),
                                        .scr_str_n_fwd(scr_str_n_fwd)
                                        );

// 2-deep FIFO for trasnsferring status.
DWC_gmac_async_fifo
 #(`STS_WIDTH,`STS_PTR_WIDTH+1) DWC_gmac_mtl_sts_fifo (
                   .clk_wr_i                (clk_tx_i),
                   .rst_clk_wr_n            (rst_clk_tx_n),
                   .write_e                 (trc_sts_wr_done),
                   .wdata                   (tx_sts_wdata),
                   .clr_wptr                (1'b0), 
                   .fifo_full               (sts_fifo_full),
                   .clk_rd_i                (clk_app_i),
                   .rst_clk_rd_n            (rst_clk_app_n),
                   .read_e                  (twc_sts_fifo_rd),
                   .rdata                   (tx_sts_rdata),
                   .clr_rptr                (1'b0), 
                   .fifo_empty              (sts_fifo_empty) 
);




  assign sts_rd_data  = {`L,`L,tx_sts_rdata};
  assign tx_sts_wdata = trc_sts_wdata[15:0];

// 2-deep FIFO of data width 2 for trasnsferring disable pad and disable crc.
DWC_gmac_async_fifo
 #(2,`STS_PTR_WIDTH+1) DWC_gmac_mtl_dpdc_fifo_app (
                    .clk_wr_i                (clk_app_i),
                    .rst_clk_wr_n            (rst_clk_app_n),
                    .write_e                 (twc_dpdc_wr),
                    .wdata                   (twc_dpdc_data),
                    .clr_wptr                (ati_txfifoflush_clr_o ), 
                    .fifo_full               (inst1_fifo_full_wire),
                    .clk_rd_i                (clk_tx_i),
                    .rst_clk_rd_n            (rst_clk_tx_n),
                    .read_e                  (trc_dpdc_rd),
                    .rdata                   ({mti_dispad_o,mti_discrc_o}),
                    .clr_rptr                (trc_sw_flush_done), 
                    .fifo_empty              (inst1_fifo_empty_wire)
);












endmodule
