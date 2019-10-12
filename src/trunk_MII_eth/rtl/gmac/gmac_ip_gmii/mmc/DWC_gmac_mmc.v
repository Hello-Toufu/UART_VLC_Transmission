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
// Date             :        $Date: 2008/06/29 $
// File Version     :        $Revision: #47 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// GMAC Management Controller (mmc.v)
//
// DESCRIPTION:
//--------------------------------------------------------------------------


module DWC_gmac_mmc (
  clk_csr_i,
                     rst_clk_csr_n,
                     clk_rx_i,
                     rst_clk_rx_n,
                     sca_txstatus_valid,
                     tfc_txstatus,
                     rfc_rxstatus_valid,
                     rfc_rxstatus,
                     sca_pauseframe,
                     sca_fifooverflow,
                     sca_jumboframe_e,
                     mci_val_i,
                     mci_addr_i,
                     mci_rdwrn_i,
                     mci_be_i,
                     mci_wdata_i,
                     mci_ack_i,
                     mmc_intr,
                     mmc_rx_intr,
                     mmc_tx_intr,
                     mmc_ipc_rx_intr,
                     mmc_ipc_tx_intr,
                     mmc_rdata
                     );

// Input and Output declarations.
  input         clk_csr_i;              // Application clock.
  input         rst_clk_csr_n;        // Reset sync to Application clock.
                                      // to clk_csr_i. This is longer 
                                      // than rst_clk_csr_n
  input         clk_rx_i;              // Receive clock.
  input         rst_clk_rx_n;        // Reset sync to Receive clock.
  input         sca_txstatus_valid;     // Transmit frame status ready.
  input  [31:0] tfc_txstatus;           // Transmit frame status.
  input         rfc_rxstatus_valid;     // receive status ready, enable for rfc_rxstatus
  input  [25:0] rfc_rxstatus;           // receive status of the current frame
                                         
                                         // happens during IFG of frame burst i.e
                                         // after the transmit status is given to
                                         // the application.
                                         
  input         sca_pauseframe;         // Received Pause frame
  input         sca_fifooverflow;       // FIFO overflow in MTL block
  input         sca_jumboframe_e;       // Jumbo frame is enabled



  input         mci_val_i;              // MCI valid.
  input  [13:0] mci_addr_i;             // MCI address
  input         mci_rdwrn_i;               // MCI read/write command (1/0)
  input  [3:0]  mci_be_i;               // MCI ByteEnable to qualify mci_wdata
  input  [31:0] mci_wdata_i;            // MCI write data
  input         mci_ack_i;              // MCI acknowledgement from CSR

  output        mmc_intr;         // MMC Interrupt status to DMA
  output        mmc_rx_intr;      // mmc rx interrupt status to GMAC CSR
  output        mmc_tx_intr;      // mmc tx interrupt status to GMAC CSR
  output        mmc_ipc_rx_intr;  // mmc ipc rx interrupt status to GMAC CSR
  output        mmc_ipc_tx_intr;  // mmc ipc tx interrupt status to GMAC CSR
  output [31:0] mmc_rdata;        // mmc read data.


// Register and wire declaration.
  reg  [31:0]   mmc_rdata;          // mmc data.
  reg  [31:0]   mmc_mac_rdata;      // mmc data.
  wire [23:0]   mmc_intr_rx;
  wire [24:0]   mmc_intr_tx;
  reg  [23:0]   mmc_intr_mask_rx;
  reg  [24:0]   mmc_intr_mask_tx;
  reg           mmc_rx_intr;
  reg           mmc_tx_intr;
  wire          mmc_intr;

  wire          mmc_ipc_rx_intr;

  wire          mmc_ipc_tx_intr;

  reg  [5:0]    mci_addr_r;
  reg           mci_addr8_r;
  reg  [50:0]   counter_clr;
  reg           counter_rst;
  reg           counter_stoprollover;
  reg           counter_rstonread;
  reg           freeze_cntrs_incr;
  reg           counter_preset;
  reg           full_half_n;
  wire [31:0]   byt_cnt_value;
  wire [31:0]   frm_cnt_value;
  wire          txcounter_update;
  wire          txcounter_update_m1;
  reg           txcounter_set;
  reg           sca_txstatus_valid_d1;
  reg           sca_txstatus_valid_d2;
  reg           sca_rxstatus_valid_d1;
  reg           sca_rxstatus_valid_d2;
  reg  [31:0]   sca_txstatus;
  wire          rxcounter_update;
  wire          rxcounter_update_m1;
  reg           rxcounter_set;
  reg           txcounter_set_d1;
  reg           rxcounter_set_d1;
  wire          txcounter_window_over;
  wire          rxcounter_window_over;
  wire          underflow_err;
  wire          cntrl_frame;
  wire          retry_req;
  wire          broadcast;
  wire          multicast;
  wire          unicast;
  wire [13:0]   txbytecount;
  wire [3:0]    retrycnt;
  wire          deferredframe;
  wire          exsscol;
  wire          latecol;
  wire          exsdef;
  wire          loss_of_carrier;
  wire          no_carrier;
  wire          jabbertimeout;
  wire          frameaborted;
  wire          txsinglecol;
  wire          txmulticol;
  wire          vlanframe;
  wire          addr_match_c;
  wire          carrier_err;
  wire [13:0]   txmaxsize;

  wire          txoctetcountgb_allone;
  wire          txframecountgb_allone;
  wire          txbroadcastframesg_allone;
  wire          txmulticastframesg_allone;
  wire          tx64octetsgb_allone;
  wire          tx65to127octetsgb_allone;
  wire          tx128to255octetsgb_allone;
  wire          tx256to511octetsgb_allone;
  wire          tx512to1023octetsgb_allone;
  wire          tx1024tomaxoctetsgb_allone;
  wire          txunicastframesgb_allone;
  wire          txmulticastframesgb_allone;
  wire          txbroadcastframesgb_allone;
  wire          txunderflowerror_allone;
  wire          txsinglecolg_allone;
  wire          txmulticolg_allone;
  wire          txdeferred_allone;
  wire          txlatecol_allone;
  wire          txexcesscol_allone;
  wire          txcarriererror_allone;
  wire          txoctetcountg_allone;
  wire          txframecountg_allone;
  wire          txexcessdef_allone;
  wire          txpauseframes_allone;
  wire          txvlanframes_allone;

  wire [18:0]   txoctetcountgb_incval;
  wire [14:0]   txoctetcountgb_addval;
  reg  [31:0]   txoctetcount_gb;
  wire [13:0]   txgbclrval;
  reg           txintr0;

  reg  [31:0]   txframecount_gb;
  reg           txintr1;
  wire          txfrmcntgbcntrupdt;
  reg           txfrmcntgbcntrset;

  reg  [31:0]   txbroadcastframes_g;
  reg           txintr2;
  wire          txbcastgcntrupdt;
  reg           txbcastgcntrset;

  reg  [31:0]   txmulticastframes_g;
  reg           txintr3;
  wire          txmcastgcntrupdt;
  reg           txmcastgcntrset;
  
  wire          tx64octgbcntrupdt;
  reg           tx64octgbcntrset;
  wire          tx65to127octgbcntrupdt;
  reg           tx65to127octgbcntrset;
  wire          tx128to255octgbcntrupdt;
  reg           tx128to255octgbcntrset;
  wire          tx256to511octgbcntrupdt;
  reg           tx256to511octgbcntrset;
  wire          tx512to1023octgbcntrupdt;
  reg           tx512to1023octgbcntrset;
  wire          tx1024tomaxoctgbcntrupdt;
  reg           tx1024tomaxoctgbcntrset;
  reg  [31:0]   txaddrcnt_mux0;
  wire [31:0]   txaddrcnt_mux0pls1;
  reg  [31:0]   txaddrcnt_mux1;
  wire [31:0]   txaddrcnt_mux1pls1;
  reg  [31:0]   tx64octets_gb;
  reg  [31:0]   tx65to127octets_gb;
  reg  [31:0]   tx128to255octets_gb;
  reg  [31:0]   tx256to511octets_gb;
  reg  [31:0]   tx512to1023octets_gb;
  reg  [31:0]   tx1024tomaxoctets_gb;
  reg           txintr4;
  reg           txintr5;
  reg           txintr6;
  reg           txintr7;
  reg           txintr8;
  reg           txintr9;

  wire          txucastgbcntrupdt;
  reg           txucastgbcntrset;
  reg           txintr10;
  reg  [31:0]   txunicastframes_gb;

  wire          txmcastgbcntrupdt;
  reg           txmcastgbcntrset;
  reg           txintr11;
  reg  [31:0]   txmulticastframes_gb;

  wire          txbcastgbcntrupdt;
  reg           txbcastgbcntrset;
  reg           txintr12;
  reg  [31:0]   txbroadcastframes_gb;

  wire          txundrflwerrcntrupdt;
  reg           txundrflwerrcntrset;
  reg           txintr13;
  reg  [31:0]   txunderflowerror;

  wire          txintr14;
  wire [31:0]   txsinglecol_g;


  wire          txintr15;
  wire [31:0]   txmulticol_g;


  wire          txintr16;
  wire [31:0]   txdeferred;


  wire          txintr17;
  wire [31:0]   txlatecol;



  wire          txintr18;
  wire [31:0]   txexcesscol;


  wire          txintr19;
  wire [31:0]   txcarriererror;


  wire [18:0]   txoctetcountg_incval;
  wire [14:0]   txoctetcountg_addval;
  wire [13:0]   txoctgclrlstval;
  reg           txintr20;
  reg  [31:0]   txoctetcount_g;

  reg  [13:0]   prev_txbytecount;

  wire          txfrmcntgcntrupdt;
  reg           txfrmcntgcntrset;
  reg           txintr21;
  reg  [31:0]   txframecount_g;

  wire          txintr22;
  wire [31:0]   txexcessdef;


  wire          txpausecntrupdt;
  reg           txpausecntrset;
  reg           txintr23;
  reg  [31:0]   txpauseframes;

  wire          txvlancntrupdt;
  reg           txvlancntrset;
  reg           txintr24;
  reg  [31:0]   txvlanframes;

  reg           rxintr0;
  reg  [31:0]   rxframecount_gb;

  reg  [13:0]   prev_rxbytecount;

  wire [18:0]   rxoctetcountg_incval;
  wire [14:0]   rxoctetcountg_addval;
  wire [13:0]   rxoctgclrlstval;
  reg           rxintr2;
  reg  [31:0]   rxoctetcount_g;

  wire [18:0]   rxoctetcountgb_incval;
  wire [14:0]   rxoctetcountgb_addval;
  wire [13:0]   rxoctgbclrlstval;
  reg           rxintr1;
  reg  [31:0]   rxoctetcount_gb;

  wire          rxbcastgcntrupdt;
  reg           rxbcastgcntrset;
  reg           rxintr3;
  reg  [31:0]   rxbroadcastframes_g;

  wire          rxmcastgcntrupdt;
  reg           rxmcastgcntrset;
  reg           rxintr4;
  reg  [31:0]   rxmulticastframes_g;

  wire          rxcrcerrcntrupdt;
  reg           rxcrcerrcntrset;
  reg           rxintr5;
  reg  [31:0]   rxcrcerror;

  wire          rxalignerrcntrupdt;
  reg           rxalignerrcntrset;
  reg           rxintr6;
  reg  [31:0]   rxalignmenterror;

  wire          rxrunterrcntrupdt;
  reg           rxrunterrcntrset;
  reg           rxintr7;
  reg  [31:0]   rxrunterror;

  wire          rxjabbererrcntrupdt;
  reg           rxjabbererrcntrset;
  reg           rxintr8;
  reg  [31:0]   rxjabbererror;

  wire          rxundrszgcntrupdt;
  reg           rxundrszgcntrset;
  reg           rxintr9;
  reg  [31:0]   rxundersize_g;

  wire          rxoverszcntrupdt;
  reg           rxoverszcntrset;
  reg           rxintr10;
  reg  [31:0]   rxoversize_g;

  wire          rx64octgbcntrupdt;
  reg           rx64octgbcntrset;
  wire          rx65to127octgbcntrupdt;
  reg           rx65to127octgbcntrset;
  wire          rx128to255octgbcntrupdt;
  reg           rx128to255octgbcntrset;
  wire          rx256to511octgbcntrupdt;
  reg           rx256to511octgbcntrset;
  wire          rx512to1023octgbcntrupdt;
  reg           rx512to1023octgbcntrset;
  wire          rx1024tomaxoctgbcntrupdt;
  reg           rx1024tomaxoctgbcntrset;
  reg           rxintr11;
  reg           rxintr12;
  reg           rxintr13;
  reg           rxintr14;
  reg           rxintr15;
  reg           rxintr16;
  reg  [31:0]   rx64octets_gb;
  reg  [31:0]   rx65to127octets_gb;
  reg  [31:0]   rx128to255octets_gb;
  reg  [31:0]   rxaddrcnt_mux0;
  reg  [31:0]   rxaddrcnt_mux1;
  wire [31:0]   rxaddrcnt_mux0pls1;
  wire [31:0]   rxaddrcnt_mux1pls1;
  reg  [31:0]   rx256to511octets_gb;
  reg  [31:0]   rx512to1023octets_gb;
  reg  [31:0]   rx1024tomaxoctets_gb;

  wire          rxucastgcntrupdt;
  reg           rxucastgcntrset;
  reg           rxintr17;
  reg  [31:0]   rxunicastframes_g;

  wire          rxlengtherrcntrupdt;
  reg           rxlengtherrcntrset;
  reg           rxintr18;
  reg  [31:0]   rxlengtherror;

  wire          rxoutofrngtypcntrupdt;
  reg           rxoutofrngtypcntrset;
  reg           rxintr19;
  reg  [31:0]   rxoutofrangetype;

  wire          rxpausefrmcntrupdt;
  reg           rxpausefrmcntrset;
  reg           rxintr20;
  reg  [31:0]   rxpauseframes;

  reg           rxpausefrmcntrset_d1;

  reg           rxfifooverflowset_d1;

  reg           rxintr21;
  reg  [31:0]   rxfifooverflow;
  reg           rxfifooverflowset;

  wire          rxvlanfrmcntrupdt;
  reg           rxvlanfrmcntrset;
  reg           rxintr22;
  reg  [31:0]   rxvlanframes;

  wire          rxwatchdogerrcntrupdt;
  reg           rxwatchdogerrcntrset;
  reg           rxintr23;
  reg  [31:0]   rxwatchdogerror;

  wire      rxstatus_write_e;
  wire      rxstatus_fifo_full;
  wire      rxstatus_fifo_empty;
  wire      rxstatus_read_e;
  wire      scr_freeze_cntrs_incr;

  wire  [25:0]  sca_rxstatus;
  wire [13:0]   rxmaxsize;
  wire [13:0]   rxbytecount;
  wire          rxjabbererr;
  wire          rxwatchdog;
  wire          rxrunterr;
  wire          rxcrcerr;
  wire          alignmenterr;
  wire          rxlengtherr;
  wire          rxmissed;
  wire          rxpauseframe;
  wire          rxoutofrange;
  wire          rxvlanframe;
  wire          rx_goodframe;
  wire          rx_goodframe_le;
  wire          rxbroadcast;
  wire          rxmulticast;
  wire          rxunicast;
  wire          rxundersize_frame;
  wire          rxbytecountgtmax;

  wire          rxframecountgb_allone;
  wire          rxundersizeg_allone;
  wire          rxoversizeg_allone;
  wire          rx64octetsgb_allone;
  wire          rx65to127octetsgb_allone;
  wire          rx128to255octetsgb_allone;
  wire          rx256to511octetsgb_allone;
  wire          rx512to1023octetsgb_allone;
  wire          rx1024tomaxoctetsgb_allone;
  wire          rxoctetcountgb_allone;
  wire          rxoctetcountg_allone;
  wire          rxbroadcastframesg_allone;
  wire          rxmulticastframesg_allone;
  wire          rxcrcerror_allone;
  wire          rxalignmenterror_allone;
  wire          rxrunterror_allone;
  wire          rxjabbererror_allone;
  wire          rxunicastframesg_allone;
  wire          rxlengtherror_allone;
  wire          rxoutofrangetype_allone;
  wire          rxpauseframes_allone;
  wire          rxfifooverflow_allone;
  wire          rxvlanframes_allone;
  wire          rxwatchdogerror_allone;

  wire [(`RX_MMC_FIFO_WIDTH-1):0] mmc_rx_fifo_in;
  wire [(`RX_MMC_FIFO_WIDTH-1):0] mmc_rx_fifo_out;

//---------------------------------------------------------------------
// Internal Wire/Reg declarations for RX IPC Counters
//---------------------------------------------------------------------
  wire [31:0]   rx_ipv4_gd_frms_g;
  wire          rx_ipc_intr0;

  wire [31:0]   rx_ipv4_hdrerr_frms_gb;
  wire          rx_ipc_intr1;

  wire [31:0]   rx_ipv4_nopay_frms_gb;
  wire          rx_ipc_intr2;

  wire [31:0]   rx_ipv4_frag_frms_gb;
  wire          rx_ipc_intr3;

  wire [31:0]   rx_ipv4_udsbl_frms_gb;
  wire          rx_ipc_intr4;

  wire [31:0]   rx_ipv6_gd_frms_g;
  wire          rx_ipc_intr5;

  wire [31:0]   rx_ipv6_hdrerr_frms_gb;
  wire          rx_ipc_intr6;

  wire [31:0]   rx_ipv6_nopay_frms_gb;
  wire          rx_ipc_intr7;

  wire [31:0]   rx_udp_gd_frms_g;
  wire          rx_ipc_intr8;

  wire [31:0]   rx_udp_err_frms_gb;
  wire          rx_ipc_intr9;

  wire [31:0]   rx_tcp_gd_frms_g;
  wire          rx_ipc_intr10;

  wire [31:0]   rx_tcp_err_frms_gb;
  wire          rx_ipc_intr11;

  wire [31:0]   rx_icmp_gd_frms_g;
  wire          rx_ipc_intr12;

  wire [31:0]   rx_icmp_err_frms_gb;
  wire          rx_ipc_intr13;



  wire [31:0]   rx_ipv4_gd_octets_g;
  wire          rx_ipc_intr16;

  wire [31:0]   rx_ipv4_hdrerr_octets_gb;
  wire          rx_ipc_intr17;

  wire [31:0]   rx_ipv4_nopay_octets_gb;
  wire          rx_ipc_intr18;

  wire [31:0]   rx_ipv4_frag_octets_gb;
  wire          rx_ipc_intr19;

  wire [31:0]   rx_ipv4_udsbl_octets_gb;
  wire          rx_ipc_intr20;

  wire [31:0]   rx_ipv6_gd_octets_g;
  wire          rx_ipc_intr21;

  wire [31:0]   rx_ipv6_hdrerr_octets_gb;
  wire          rx_ipc_intr22;

  wire [31:0]   rx_ipv6_nopay_octets_gb;
  wire          rx_ipc_intr23;

  wire [31:0]   rx_udp_gd_octets_g;
  wire          rx_ipc_intr24;

  wire [31:0]   rx_udp_err_octets_gb;
  wire          rx_ipc_intr25;

  wire [31:0]   rx_tcp_gd_octets_g;
  wire          rx_ipc_intr26;

  wire [31:0]   rx_tcp_err_octets_gb;
  wire          rx_ipc_intr27;

  wire [31:0]   rx_icmp_gd_octets_g;
  wire          rx_ipc_intr28;

  wire [31:0]   rx_icmp_err_octets_gb;
  wire          rx_ipc_intr29;



//---------------------------------------------------------------------
// Internal Wire/Reg declarations for TX IPC Counters
//---------------------------------------------------------------------
  wire [31:0]   tx_ipv4_gd_frms_g;
  wire          tx_ipc_intr0;

  wire [31:0]   tx_ipv4_hdrerr_frms_gb;
  wire          tx_ipc_intr1;

  wire [31:0]   tx_ipv4_nopay_frms_gb;
  wire          tx_ipc_intr2;

  wire [31:0]   tx_ipv6_gd_frms_g;
  wire          tx_ipc_intr3;

  wire [31:0]   tx_ipv6_hdrerr_frms_gb;
  wire          tx_ipc_intr4;

  wire [31:0]   tx_ipv6_nopay_frms_gb;
  wire          tx_ipc_intr5;

  wire [31:0]   tx_udp_gd_frms_g;
  wire          tx_ipc_intr6;

  wire [31:0]   tx_udp_err_frms_gb;
  wire          tx_ipc_intr7;

  wire [31:0]   tx_tcp_gd_frms_g;
  wire          tx_ipc_intr8;

  wire [31:0]   tx_tcp_err_frms_gb;
  wire          tx_ipc_intr9;

  wire [31:0]   tx_icmp_gd_frms_g;
  wire          tx_ipc_intr10;

  wire [31:0]   tx_icmp_err_frms_gb;
  wire          tx_ipc_intr11;



  wire [31:0]   tx_ipv4_gd_octets_g;
  wire          tx_ipc_intr16;

  wire [31:0]   tx_ipv4_hdrerr_octets_gb;
  wire          tx_ipc_intr17;

  wire [31:0]   tx_ipv4_nopay_octets_gb;
  wire          tx_ipc_intr18;

  wire [31:0]   tx_ipv6_gd_octets_g;
  wire          tx_ipc_intr19;

  wire [31:0]   tx_ipv6_hdrerr_octets_gb;
  wire          tx_ipc_intr20;

  wire [31:0]   tx_ipv6_nopay_octets_gb;
  wire          tx_ipc_intr21;

  wire [31:0]   tx_udp_gd_octets_g;
  wire          tx_ipc_intr22;

  wire [31:0]   tx_udp_err_octets_gb;
  wire          tx_ipc_intr23;

  wire [31:0]   tx_tcp_gd_octets_g;
  wire          tx_ipc_intr24;

  wire [31:0]   tx_tcp_err_octets_gb;
  wire          tx_ipc_intr25;

  wire [31:0]   tx_icmp_gd_octets_g;
  wire          tx_ipc_intr26;

  wire [31:0]   tx_icmp_err_octets_gb;
  wire          tx_ipc_intr27;

  wire          rst_clk_rx_async_n;  // Reset for the async reset pins of f/f in clk_rx domain
  wire          rst_clk_rx_sync_n;   // Reset for the sync reset pins of f/f in clk_rx domain

  


//********************************************
// Combinatorial Logic 
//********************************************
// Statistics counters for transmitted frames.

  assign cntrl_frame     = sca_txstatus[30];
  assign retry_req       = sca_txstatus[31];
  assign vlanframe       = sca_txstatus[29];
  assign unicast         = !(|sca_txstatus[28:27]);
  assign multicast       = (sca_txstatus[28:27] == 2'b01);
  assign broadcast       = (& sca_txstatus[28:27]);  
  assign txbytecount     = sca_txstatus[26:13];
  assign retrycnt        = sca_txstatus[12:9];
  assign deferredframe   = sca_txstatus[8];
  assign underflow_err   = sca_txstatus[7];
  assign exsscol         = sca_txstatus[6];
  assign latecol         = sca_txstatus[5];
  assign exsdef          = sca_txstatus[4];
  assign loss_of_carrier = sca_txstatus[3];
  assign no_carrier      = sca_txstatus[2];
  assign jabbertimeout   = sca_txstatus[1];
  assign frameaborted    = sca_txstatus[0];
  assign txmaxsize       = sca_jumboframe_e ? ((vlanframe) ? 14'h233E : 14'h233A) :
                                              ((vlanframe) ? 14'h05F3 : 14'h05EF);
  assign txsinglecol     = (retrycnt == 4'b0001) & !sca_txstatus[31];
  assign txmulticol      = (|retrycnt[3:1]) & !sca_txstatus[31];
  assign carrier_err     = (loss_of_carrier || no_carrier);

// Address match detection

  assign addr_match_c = mci_val_i && (mci_addr_i[13:8] == `MMC_ADDR_13_8);

//********************************************
// Registered Logic 
//********************************************


  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) 
      mci_addr_r <= 6'b000000;
    else if (addr_match_c)
      mci_addr_r <= mci_addr_i[7:2];
  end

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      counter_rst <= `L;
      counter_stoprollover <= `L;
      counter_rstonread <= `L;  
      freeze_cntrs_incr <= `L;
      counter_preset    <= `L;
      full_half_n       <= `L;
      mmc_intr_mask_rx <= 24'h000000;
      mmc_intr_mask_tx <= 25'h0000000;
    end
    else begin
      if (mci_ack_i & !mci_rdwrn_i & addr_match_c) begin
        case (mci_addr_r)
          // Cntrl register
          6'b000000: begin
            counter_rst          <= (mci_be_i[0])? mci_wdata_i[0]: counter_rst;
            counter_stoprollover <= (mci_be_i[0])? mci_wdata_i[1]: counter_stoprollover;
            counter_rstonread    <= (mci_be_i[0])? mci_wdata_i[2]: counter_rstonread;
            freeze_cntrs_incr    <= (mci_be_i[0])? mci_wdata_i[3]: freeze_cntrs_incr;
            counter_preset       <= (mci_be_i[0])? (!mci_wdata_i[0] & mci_wdata_i[4]): counter_preset;
            full_half_n          <= (mci_be_i[0])? mci_wdata_i[5]: full_half_n;
          end
          // Interupt Mask High
          6'b000011: begin
            mmc_intr_mask_rx[23:16] <= mci_be_i[2]? mci_wdata_i[23:16]:
                                               mmc_intr_mask_rx[23:16];
            mmc_intr_mask_rx[15:8]  <= mci_be_i[1]? mci_wdata_i[15:8]:
                                               mmc_intr_mask_rx[15:8];
            mmc_intr_mask_rx[7:0]   <= mci_be_i[0]? mci_wdata_i[7:0]:
                                               mmc_intr_mask_rx[7:0];
          end
          // Interupt Mask Low
          6'b000100: begin
            mmc_intr_mask_tx[24]    <= mci_be_i[3]? mci_wdata_i[24]:
                                               mmc_intr_mask_tx[24];
            mmc_intr_mask_tx[23:16] <= mci_be_i[2]? mci_wdata_i[23:16]:
                                               mmc_intr_mask_tx[23:16];
            mmc_intr_mask_tx[15:8]  <= mci_be_i[1]? mci_wdata_i[15:8]:
                                               mmc_intr_mask_tx[15:8];
            mmc_intr_mask_tx[7:0]   <= mci_be_i[0]? mci_wdata_i[7:0]:
                                               mmc_intr_mask_tx[7:0];
          end
          default:;
        endcase
      end
      // Self clearing soft counter reset
      else if (counter_rst)
        counter_rst <= `L;
      else if (counter_preset)
        counter_preset <= `L;
    end
  end

   assign frm_cnt_value = {full_half_n,31'h7FFF_FFF0};  // full/half minus 16 frames
   assign byt_cnt_value = {full_half_n,31'h7FFF_F800};  // full/half minus 2K bytes

// Read logic for the MMC MAC counters

  always @(*) begin
    case (mci_addr_r)

      6'b000000: mmc_mac_rdata = {26'h0000000,full_half_n, counter_preset, freeze_cntrs_incr, 
                                  counter_rstonread, counter_stoprollover,counter_rst};
      6'b000001: mmc_mac_rdata = {8'h00,mmc_intr_rx};
      6'b000010: mmc_mac_rdata = {7'h00,mmc_intr_tx};
      6'b000011: mmc_mac_rdata = {8'h00,mmc_intr_mask_rx};
      6'b000100: mmc_mac_rdata = {7'h00,mmc_intr_mask_tx};
      6'b000101: mmc_mac_rdata = txoctetcount_gb;
      6'b000110: mmc_mac_rdata = txframecount_gb;
      6'b000111: mmc_mac_rdata = txbroadcastframes_g;
      6'b001000: mmc_mac_rdata = txmulticastframes_g;
      6'b001001: mmc_mac_rdata = tx64octets_gb;
      6'b001010: mmc_mac_rdata = tx65to127octets_gb;
      6'b001011: mmc_mac_rdata = tx128to255octets_gb;
      6'b001100: mmc_mac_rdata = tx256to511octets_gb;
      6'b001101: mmc_mac_rdata = tx512to1023octets_gb;
      6'b001110: mmc_mac_rdata = tx1024tomaxoctets_gb;
      6'b001111: mmc_mac_rdata = txunicastframes_gb;
      6'b010000: mmc_mac_rdata = txmulticastframes_gb;
      6'b010001: mmc_mac_rdata = txbroadcastframes_gb;
      6'b010010: mmc_mac_rdata = txunderflowerror;
      6'b011001: mmc_mac_rdata = txoctetcount_g;
      6'b011010: mmc_mac_rdata = txframecount_g;
      6'b011100: mmc_mac_rdata = txpauseframes;
      6'b011101: mmc_mac_rdata = txvlanframes; 
  
      6'b100000: mmc_mac_rdata = rxframecount_gb;
      6'b100001: mmc_mac_rdata = rxoctetcount_gb;
      6'b100010: mmc_mac_rdata = rxoctetcount_g;
      6'b100011: mmc_mac_rdata = rxbroadcastframes_g;
      6'b100100: mmc_mac_rdata = rxmulticastframes_g;
      6'b100101: mmc_mac_rdata = rxcrcerror;
      6'b100110: mmc_mac_rdata = rxalignmenterror;
      6'b100111: mmc_mac_rdata = rxrunterror;
      6'b101000: mmc_mac_rdata = rxjabbererror;
      6'b101001: mmc_mac_rdata = rxundersize_g;
      6'b101010: mmc_mac_rdata = rxoversize_g;
      6'b101011: mmc_mac_rdata = rx64octets_gb;
      6'b101100: mmc_mac_rdata = rx65to127octets_gb;
      6'b101101: mmc_mac_rdata = rx128to255octets_gb;
      6'b101110: mmc_mac_rdata = rx256to511octets_gb;
      6'b101111: mmc_mac_rdata = rx512to1023octets_gb;
      6'b110000: mmc_mac_rdata = rx1024tomaxoctets_gb;
      6'b110001: mmc_mac_rdata = rxunicastframes_g;
      6'b110010: mmc_mac_rdata = rxlengtherror;
      6'b110011: mmc_mac_rdata = rxoutofrangetype;
      6'b110100: mmc_mac_rdata = rxpauseframes;
      6'b110101: mmc_mac_rdata = rxfifooverflow;
      6'b110110: mmc_mac_rdata = rxvlanframes;
      6'b110111: mmc_mac_rdata = rxwatchdogerror;
      default : mmc_mac_rdata = 32'h00000000;
    endcase
  end


  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) 
      mci_addr8_r<= 1'b0;
    else 
      if (addr_match_c)

        mci_addr8_r<= mci_addr_i[8];
  end

// Read data to CSR block
  always @(*) begin
    case (mci_addr8_r)

      1'b1 : mmc_rdata   = mmc_mac_rdata;
      default : mmc_rdata = mmc_mac_rdata;
    endcase
  end

  // decoder for clearing the counters after read.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      counter_clr <= 51'h0000000000000;
    end
    else begin
      if (mci_rdwrn_i && mci_ack_i && mci_be_i[0] && addr_match_c) begin
        case (mci_addr_r)
          6'b000101: begin
            if (counter_rstonread || (counter_stoprollover && txoctetcountgb_allone))
              counter_clr <= 51'h0000000000001;
          end
          6'b000110: begin
            if (counter_rstonread || (counter_stoprollover && txframecountgb_allone))
              counter_clr <= 51'h0000000000002;
          end
          6'b000111: begin
            if (counter_rstonread || (counter_stoprollover && txbroadcastframesg_allone))
              counter_clr <= 51'h0000000000004;
          end
          6'b001001: begin
            if (counter_rstonread || (counter_stoprollover && tx64octetsgb_allone))
              counter_clr <= 51'h0000000000010;
          end
          6'b001010: begin
            if (counter_rstonread || (counter_stoprollover && tx65to127octetsgb_allone))
              counter_clr <= 51'h0000000000020;
          end
          6'b001011: begin
            if (counter_rstonread || (counter_stoprollover && tx128to255octetsgb_allone))
              counter_clr <= 51'h0000000000040;
          end
          6'b001100: begin
            if (counter_rstonread || (counter_stoprollover && tx256to511octetsgb_allone))
              counter_clr <= 51'h0000000000080;
          end
          6'b001101: begin
            if (counter_rstonread || (counter_stoprollover && tx512to1023octetsgb_allone))
              counter_clr <= 51'h0000000000100;
          end
          6'b001110: begin
            if (counter_rstonread || (counter_stoprollover && tx1024tomaxoctetsgb_allone))
              counter_clr <= 51'h0000000000200;
          end
          6'b001111: begin
            if (counter_rstonread || (counter_stoprollover && txunicastframesgb_allone))
              counter_clr <= 51'h0000000000400;
          end
          6'b010000: begin
            if (counter_rstonread || (counter_stoprollover && txmulticastframesgb_allone))
              counter_clr <= 51'h0000000000800;
          end
          6'b010001: begin
            if (counter_rstonread || (counter_stoprollover && txbroadcastframesgb_allone))
              counter_clr <= 51'h0000000001000;
          end
          6'b010010: begin
            if (counter_rstonread || (counter_stoprollover && txunderflowerror_allone))
              counter_clr <= 51'h0000000002000;
          end
          6'b011001: begin
            if (counter_rstonread || (counter_stoprollover && txoctetcountg_allone))
              counter_clr <= 51'h0000000100000;
          end
          6'b011010: begin
            if (counter_rstonread || (counter_stoprollover && txframecountg_allone))
              counter_clr <= 51'h0000000200000;
          end
          6'b011100: begin
            if (counter_rstonread || (counter_stoprollover && txpauseframes_allone))
              counter_clr <= 51'h0000000800000;
          end
          6'b011101: begin
            if (counter_rstonread || (counter_stoprollover && txvlanframes_allone))
              counter_clr <= 51'h0000001000000;
          end
          6'b100000: begin
            if (counter_rstonread || (counter_stoprollover && rxframecountgb_allone))
              counter_clr <= 51'h0000008000000;
          end
          6'b100001: begin
            if (counter_rstonread || (counter_stoprollover && rxoctetcountgb_allone))
              counter_clr <= 51'h0000010000000;
          end
          6'b100010: begin
            if (counter_rstonread || (counter_stoprollover && rxoctetcountg_allone))
              counter_clr <= 51'h0000020000000;
          end
          6'b100011: begin
            if (counter_rstonread || (counter_stoprollover && rxbroadcastframesg_allone))
              counter_clr <= 51'h0000040000000;
          end
          6'b100100: begin
            if (counter_rstonread || (counter_stoprollover && rxmulticastframesg_allone))
              counter_clr <= 51'h0000080000000;
          end
          6'b100101: begin
            if (counter_rstonread || (counter_stoprollover && rxcrcerror_allone))
              counter_clr <= 51'h0000100000000;
          end
          6'b100110: begin
            if (counter_rstonread || (counter_stoprollover && rxalignmenterror_allone))
              counter_clr <= 51'h0000200000000;
          end
          6'b100111: begin
            if (counter_rstonread || (counter_stoprollover && rxrunterror_allone))
              counter_clr <= 51'h0000400000000;
          end
          6'b101000: begin
            if (counter_rstonread || (counter_stoprollover && rxjabbererror_allone))
              counter_clr <= 51'h0000800000000;
          end
          6'b101001: begin
            if (counter_rstonread || (counter_stoprollover && rxundersizeg_allone))
              counter_clr <= 51'h0001000000000;
          end
          6'b101010: begin
            if (counter_rstonread || (counter_stoprollover && rxoversizeg_allone))
              counter_clr <= 51'h0002000000000;
          end
          6'b101011: begin
            if (counter_rstonread || (counter_stoprollover && rx64octetsgb_allone))
              counter_clr <= 51'h0004000000000;
          end
          6'b101100: begin
            if (counter_rstonread || (counter_stoprollover && rx65to127octetsgb_allone))
              counter_clr <= 51'h0008000000000;
          end
          6'b101101: begin
            if (counter_rstonread || (counter_stoprollover && rx128to255octetsgb_allone))
              counter_clr <= 51'h0010000000000;
          end
          6'b101110: begin
            if (counter_rstonread || (counter_stoprollover && rx256to511octetsgb_allone))
              counter_clr <= 51'h0020000000000;
          end
          6'b101111: begin
            if (counter_rstonread || (counter_stoprollover && rx512to1023octetsgb_allone))
              counter_clr <= 51'h0040000000000;
          end
          6'b110000: begin
            if (counter_rstonread || (counter_stoprollover && rx1024tomaxoctetsgb_allone))
              counter_clr <= 51'h0080000000000;
          end
          6'b110001: begin
            if (counter_rstonread || (counter_stoprollover && rxunicastframesg_allone))
              counter_clr <= 51'h0100000000000;
          end
          6'b110010: begin
            if (counter_rstonread || (counter_stoprollover && rxlengtherror_allone))
              counter_clr <= 51'h0200000000000;
          end
          6'b110011: begin
            if (counter_rstonread || (counter_stoprollover && rxoutofrangetype_allone))
              counter_clr <= 51'h0400000000000;
          end
          6'b110100: begin
            if (counter_rstonread || (counter_stoprollover && rxpauseframes_allone))
              counter_clr <= 51'h0800000000000;
          end
          6'b110101: begin
            if (counter_rstonread || (counter_stoprollover && rxfifooverflow_allone))
              counter_clr <= 51'h1000000000000;
          end
          6'b110110:   begin
            if (counter_rstonread || (counter_stoprollover && rxvlanframes_allone))
              counter_clr <= 51'h2000000000000;
          end
          6'b110111:   begin
            if (counter_rstonread || (counter_stoprollover && rxwatchdogerror_allone))
              counter_clr <= 51'h4000000000000;
          end
          default:   counter_clr <= {51{`L}};
        endcase
      end
      else begin
        counter_clr <= 51'h0000000000000;
      end
    end
  end

  assign mmc_intr_rx = {rxintr23,rxintr22,rxintr21,rxintr20,
                        rxintr19,rxintr18,rxintr17,rxintr16,rxintr15,
                        rxintr14,rxintr13,rxintr12,rxintr11,rxintr10,
                        rxintr9,rxintr8,rxintr7,rxintr6,rxintr5,
                        rxintr4,rxintr3,rxintr2,rxintr1,rxintr0};

  assign mmc_intr_tx = {txintr24,txintr23,txintr22,txintr21,txintr20,
                        txintr19,txintr18,txintr17,txintr16,txintr15,txintr14,
                        txintr13,txintr12,txintr11,txintr10,txintr9,txintr8,
                        txintr7,txintr6,txintr5,txintr4,txintr3,txintr2,
                        txintr1,txintr0};


  assign mmc_intr = mmc_rx_intr |
                    mmc_tx_intr;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      mmc_rx_intr <= `L;
    end
    else begin
      if (|mmc_intr_rx)
        mmc_rx_intr <= `H;
      else
        mmc_rx_intr <= `L;
    end
  end

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      mmc_tx_intr <= `L;
    end
    else begin
      if (|mmc_intr_tx)
        mmc_tx_intr <= `H;
      else
        mmc_tx_intr <= `L;
    end
  end

  assign mmc_ipc_rx_intr = 1'b0;


  assign mmc_ipc_tx_intr = 1'b0;


// when to register the updated value

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      sca_txstatus_valid_d1 <= `L;
      sca_txstatus_valid_d2 <= `L;
    end
    else begin
      if (counter_rst) begin
        sca_txstatus_valid_d1 <= `L;
        sca_txstatus_valid_d2 <= `L;
      end
      else begin
        sca_txstatus_valid_d1 <= sca_txstatus_valid & !freeze_cntrs_incr;
        sca_txstatus_valid_d2 <= sca_txstatus_valid_d1;
      end
    end
  end

// status is registered in CSR clock domain to reduce delay
// requirement between two packets. The tfc_txstatus can 
// change for next two CSR clocks. This allows slower CSR clock
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      sca_txstatus <= 32'h0000_0000;
    else
      if (sca_txstatus_valid & !freeze_cntrs_incr)
        sca_txstatus <= tfc_txstatus;

  assign txcounter_update    = sca_txstatus_valid_d2 & !retry_req;
  assign txcounter_update_m1 = sca_txstatus_valid_d1 & !retry_req;

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) begin
      txcounter_set <= `L;
      txcounter_set_d1 <= `L;
    end
    else begin
      txcounter_set <= sca_txstatus_valid_d2;
      txcounter_set_d1 <= txcounter_set;
    end

  assign txcounter_window_over = txcounter_set_d1;


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      prev_txbytecount <= {14{`L}};
    else
      if (txcounter_update_m1)
        prev_txbytecount <= txbytecount;
  

  assign tx64octetsgb_allone       = &tx64octets_gb;
  assign tx64octgbcntrupdt         = (txcounter_update & (txbytecount == 14'd64)); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      tx64octgbcntrset <= `L;
    else 
      if (tx64octgbcntrupdt)
        tx64octgbcntrset <= `H;
      else
        if (txcounter_window_over)
          tx64octgbcntrset <= `L;

// interrupt for tx64octets_gb

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr4 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[4] & txaddrcnt_mux0pls1[31] & !(|txaddrcnt_mux0pls1[30:0]) &
          txcounter_update & !counter_clr[4] & !txintr4 & tx64octgbcntrupdt)
        txintr4 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001001) & addr_match_c)
        txintr4 <= `L;
    end
  end

  always @(*)
  begin
    case (`H) 
     
      tx64octgbcntrupdt       : txaddrcnt_mux0 = tx64octets_gb;
      tx65to127octgbcntrupdt  : txaddrcnt_mux0 = tx65to127octets_gb;
      tx128to255octgbcntrupdt : txaddrcnt_mux0 = tx128to255octets_gb;
      default                 : txaddrcnt_mux0 = tx128to255octets_gb;

    endcase
  end
  
  assign txaddrcnt_mux0pls1 = txaddrcnt_mux0 + 32'h00000001;

// counter to increments the octets received for frames of 64 bytes length
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      tx64octets_gb <= 32'h00000000;
      tx65to127octets_gb <= 32'h00000000;
      tx128to255octets_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst) begin
        tx64octets_gb <= 32'h00000000;
        tx65to127octets_gb <= 32'h00000000;
        tx128to255octets_gb <= 32'h00000000;
      end
      else if (counter_preset) begin
        tx64octets_gb       <= frm_cnt_value;
        tx65to127octets_gb  <= frm_cnt_value;
        tx128to255octets_gb <= frm_cnt_value;
      end
      else if (counter_clr[4])
        tx64octets_gb <= {31'h00000000, (tx64octgbcntrupdt | tx64octgbcntrset)};
      else if (counter_clr[5])
        tx65to127octets_gb <= {31'h00000000, (tx65to127octgbcntrupdt | tx65to127octgbcntrset)};
      else if (counter_clr[6])
        tx128to255octets_gb <= {31'h00000000, (tx128to255octgbcntrupdt | tx128to255octgbcntrset)};
      else begin
      // leda DFT_022 W71 off
        case (`H) 

          tx64octgbcntrupdt : begin
          if (!tx64octetsgb_allone | !counter_stoprollover)
            tx64octets_gb <= txaddrcnt_mux0pls1;
          end    
          tx65to127octgbcntrupdt : begin
          if (!tx65to127octetsgb_allone |!counter_stoprollover)
            tx65to127octets_gb <= txaddrcnt_mux0pls1;
          end
          tx128to255octgbcntrupdt : begin
          if (!tx128to255octetsgb_allone | !counter_stoprollover)
            tx128to255octets_gb <= txaddrcnt_mux0pls1;
          end

        endcase  
      // leda DFT_022 W71 on
      end
    end
  end  
  
  assign tx65to127octetsgb_allone   = &tx65to127octets_gb;
  assign tx65to127octgbcntrupdt     = (txcounter_update & (txbytecount > 14'd64 & 
                                       txbytecount < 14'd128)); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      tx65to127octgbcntrset <= `L;
    else 
      if (tx65to127octgbcntrupdt)
        tx65to127octgbcntrset <= `H;
      else
        if (txcounter_window_over)
          tx65to127octgbcntrset <= `L;

// interrupt for tx65to127octets_gb
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr5 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[5] & txaddrcnt_mux0pls1[31] & !(| txaddrcnt_mux0pls1[30:0])
          & txcounter_update & !counter_clr[5] & !txintr5 & tx65to127octgbcntrupdt)
        txintr5 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001010) & addr_match_c)
        txintr5 <= `L;
    end
  end

  assign tx128to255octetsgb_allone  = &tx128to255octets_gb;
  assign tx128to255octgbcntrupdt   = (txcounter_update & (txbytecount > 14'd127 & 
                                      txbytecount < 14'd256)); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      tx128to255octgbcntrset <= `L;
    else 
      if (tx128to255octgbcntrupdt)
        tx128to255octgbcntrset <= `H;
      else
        if (txcounter_window_over)
          tx128to255octgbcntrset <= `L;

// interrupt for tx128to255octets_gb  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr6 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[6] & txaddrcnt_mux0pls1[31] & !(| txaddrcnt_mux0pls1[30:0])
          & txcounter_update & !counter_clr[6] & !txintr6 & tx128to255octgbcntrupdt)
        txintr6 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001011) & addr_match_c)
        txintr6 <= `L;
    end
  end

  assign tx256to511octetsgb_allone  = &tx256to511octets_gb;
  assign tx256to511octgbcntrupdt    = (txcounter_update & (txbytecount > 14'd255 &
                                      txbytecount < 14'd512)); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      tx256to511octgbcntrset <= `L;
    else 
      if (tx256to511octgbcntrupdt)
        tx256to511octgbcntrset <= `H;
      else
        if (txcounter_window_over)
          tx256to511octgbcntrset <= `L;

// interrupt for tx256to511octgbcntrupdt
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr7 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[7] & txaddrcnt_mux1pls1[31] & !(| txaddrcnt_mux1pls1[30:0])
          & txcounter_update & !counter_clr[7] & !txintr7 & tx256to511octgbcntrupdt)
        txintr7 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001100) & addr_match_c)
        txintr7 <= `L;
    end
  end

  always @(*)
  begin
    case (`H) 
     
      tx256to511octgbcntrupdt  : txaddrcnt_mux1 = tx256to511octets_gb;
      tx512to1023octgbcntrupdt : txaddrcnt_mux1 = tx512to1023octets_gb;
      tx1024tomaxoctgbcntrupdt : txaddrcnt_mux1 = tx1024tomaxoctets_gb;
      default                  : txaddrcnt_mux1 = tx1024tomaxoctets_gb;

    endcase
  end
  
  assign txaddrcnt_mux1pls1 = txaddrcnt_mux1 + 32'h00000001;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      tx256to511octets_gb <= 32'h00000000;
      tx512to1023octets_gb <= 32'h00000000;
      tx1024tomaxoctets_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst) begin
        tx256to511octets_gb <= 32'h00000000;
        tx512to1023octets_gb <= 32'h00000000;
        tx1024tomaxoctets_gb <= 32'h00000000;
      end
      else if (counter_preset) begin
        tx256to511octets_gb  <= frm_cnt_value;
        tx512to1023octets_gb <= frm_cnt_value;
        tx1024tomaxoctets_gb <= frm_cnt_value;
      end
      else if (counter_clr[7])
        tx256to511octets_gb <= {31'h00000000, (tx256to511octgbcntrupdt | tx256to511octgbcntrset)};
      else if (counter_clr[8])
        tx512to1023octets_gb <= {31'h00000000, (tx512to1023octgbcntrupdt | tx512to1023octgbcntrset)};
      else if (counter_clr[9])
        tx1024tomaxoctets_gb <= {31'h00000000, (tx1024tomaxoctgbcntrupdt | tx1024tomaxoctgbcntrset)};
      else begin
      // leda DFT_022 W71 off
        case (`H) 

          tx256to511octgbcntrupdt : begin
          if (!tx256to511octetsgb_allone | !counter_stoprollover)
            tx256to511octets_gb <= txaddrcnt_mux1pls1;
          end
          tx512to1023octgbcntrupdt : begin
          if (!tx512to1023octetsgb_allone | !counter_stoprollover)
            tx512to1023octets_gb <= txaddrcnt_mux1pls1;
          end
          tx1024tomaxoctgbcntrupdt : begin
          if (!tx1024tomaxoctetsgb_allone | !counter_stoprollover)
            tx1024tomaxoctets_gb <= txaddrcnt_mux1pls1;
          end

        endcase
      // leda DFT_022 W71 on
      end
    end
  end  

  assign tx512to1023octetsgb_allone = &tx512to1023octets_gb;
  assign tx512to1023octgbcntrupdt   = (txcounter_update & (txbytecount > 14'd511 &
                                       txbytecount < 14'd1024)); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      tx512to1023octgbcntrset <= `L;
    else 
      if (tx512to1023octgbcntrupdt)
        tx512to1023octgbcntrset <= `H;
      else
        if (txcounter_window_over)
          tx512to1023octgbcntrset <= `L;

// interrupt for tx512to1023octets_gb
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr8 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[8] & txaddrcnt_mux1pls1[31] & !(| txaddrcnt_mux1pls1[30:0])
          & txcounter_update & !counter_clr[8] & !txintr8 & tx512to1023octgbcntrupdt)
        txintr8 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001101) & addr_match_c)
        txintr8 <= `L;
    end
  end

  assign tx1024tomaxoctetsgb_allone = &tx1024tomaxoctets_gb;
  assign tx1024tomaxoctgbcntrupdt  = (txcounter_update & (txbytecount > 14'd1023 &
                                      txbytecount < txmaxsize)); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      tx1024tomaxoctgbcntrset <= `L;
    else 
      if (tx1024tomaxoctgbcntrupdt)
        tx1024tomaxoctgbcntrset <= `H;
      else
        if (txcounter_window_over)
          tx1024tomaxoctgbcntrset <= `L;

// interrupt for tx1024tomaxoctets_gb  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr9 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[9] & txaddrcnt_mux1pls1[31] & !(| txaddrcnt_mux1pls1[30:0])
          & txcounter_update & !counter_clr[9] & !txintr9 & tx1024tomaxoctgbcntrupdt)
        txintr9 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001110) & addr_match_c)
        txintr9 <= `L;
    end
  end

  
 
  assign txoctetcountgb_addval = {`L,txoctetcount_gb[13:0]} + {`L,txbytecount};
  assign txoctetcountgb_incval = {`L,txoctetcount_gb[31:14]} + {18'h00000, txoctetcountgb_addval[14]};
  assign txoctetcountgb_allone = txoctetcountgb_incval[18];
  assign txgbclrval            = (txcounter_update | 
                                  txcounter_set_d1 |
                                  txcounter_set) ?  prev_txbytecount : 14'h0000;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr0 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[0] & txoctetcountgb_addval[14] & (& txoctetcount_gb[30:14]) &
          txcounter_update & !counter_clr[0] & !txintr0)
        txintr0 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b000101) & addr_match_c)
        txintr0 <= `L;
    end
  end

  // Counter for calculating transmitted octets
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txoctetcount_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        txoctetcount_gb <= 32'h00000000;
      else if (counter_preset)
        txoctetcount_gb <= byt_cnt_value;
      else if (counter_clr[0])
        txoctetcount_gb <= {18'h00000, txgbclrval};
      else if ((|txbytecount) & txcounter_update) begin
        if (txoctetcountgb_allone & counter_stoprollover) 
          txoctetcount_gb <= 32'hFFFFFFFF;
        else  
          txoctetcount_gb <= {txoctetcountgb_incval[17:0], txoctetcountgb_addval[13:0]};
      end
    end
  end




  assign txframecountgb_allone = &txframecount_gb[31:0];
  assign txfrmcntgbcntrupdt    = (txcounter_update & ((|txbytecount) | (exsscol & frameaborted)));

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txfrmcntgbcntrset <= `L;
    else 
      if (txfrmcntgbcntrupdt)
        txfrmcntgbcntrset <= `H;
      else
        if (txcounter_window_over)
          txfrmcntgbcntrset <= `L;

// interrupt for txframecount_gb
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr1 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[1] & txfrmcntgbcntrupdt & (& txframecount_gb[30:0]) &
          txcounter_update & !counter_clr[1] & !txintr1)
        txintr1 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b000110) & addr_match_c)
        txintr1 <= `L;
    end
  end
  
  // Counter for counting no. of frames transmitted (both good and bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txframecount_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        txframecount_gb <= 32'h00000000;
      else if (counter_preset)
        txframecount_gb <= frm_cnt_value;
      else if (counter_clr[1])
        txframecount_gb <= {31'h00000000, (txfrmcntgbcntrupdt | txfrmcntgbcntrset)};
      else if (txfrmcntgbcntrupdt & (!txframecountgb_allone |
               !counter_stoprollover))
        txframecount_gb <= txframecount_gb + 32'h00000001;
    end
  end



  assign txbroadcastframesg_allone = &txbroadcastframes_g;
  assign txbcastgcntrupdt          = (!frameaborted & txcounter_update & broadcast);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txbcastgcntrset <= `L;
    else 
      if (txbcastgcntrupdt)
        txbcastgcntrset <= `H;
      else
        if (txcounter_window_over)
          txbcastgcntrset <= `L;

// interrupt for txbroadcastframes_g  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr2 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[2] & txbcastgcntrupdt & (& txbroadcastframes_g[30:0]) &
          txcounter_update & !counter_clr[2] & !txintr2)
        txintr2 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b000111) & addr_match_c)
        txintr2 <= `L;
    end
  end
  
// Counter for counting no. of broadcast frames transmitted (good only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txbroadcastframes_g <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        txbroadcastframes_g <= 32'h00000000;
      else if (counter_preset)
        txbroadcastframes_g <= frm_cnt_value;
      else if (counter_clr[2])
        txbroadcastframes_g <= {31'h00000000, (txbcastgcntrupdt | txbcastgcntrset)};
      else if (txbcastgcntrupdt & (!txbroadcastframesg_allone | 
               !counter_stoprollover)) 
        txbroadcastframes_g <= txbroadcastframes_g + 32'h00000001;
    end
  end


    
  assign txmulticastframesg_allone = &txmulticastframes_g;
  assign txmcastgcntrupdt         = (!frameaborted & txcounter_update & multicast);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txmcastgcntrset <= `L;
    else 
      if (txmcastgcntrupdt)
        txmcastgcntrset <= `H;
      else
        if (txcounter_window_over)
          txmcastgcntrset <= `L;

// interrupt for txmulticastframes_g
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr3 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[3] & txmcastgcntrupdt & (& txmulticastframes_g[30:0]) &
          txcounter_update & !counter_clr[3] & !txintr3)
        txintr3 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001000) & addr_match_c)
        txintr3 <= `L;
    end
  end

// Counter for counting no. of broadcast frames transmitted (good only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txmulticastframes_g <= 32'h00000000;
    end
  else begin
    if (counter_rst) 
      txmulticastframes_g <= 32'h00000000;
      else if (counter_preset)
        txmulticastframes_g <= frm_cnt_value;
    else if (counter_clr[3]) 
      txmulticastframes_g <= {31'h00000000, (txmcastgcntrupdt | txmcastgcntrset)};
    else if (txmcastgcntrupdt & (!txmulticastframesg_allone |
             !counter_stoprollover)) 
      txmulticastframes_g <= txmulticastframes_g + 32'h00000001;
    end
  end
  


  assign txunicastframesgb_allone  = &txunicastframes_gb;
  assign txucastgbcntrupdt         = (txcounter_update & unicast & (|txbytecount));

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txucastgbcntrset <= `L;
    else 
      if (txucastgbcntrupdt)
        txucastgbcntrset <= `H;
      else
        if (txcounter_window_over)
          txucastgbcntrset <= `L;

// interrupt for txunicastframes_gb
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr10 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[10] & txucastgbcntrupdt & (& txunicastframes_gb[30:0]) &
          txcounter_update & !counter_clr[10] & !txintr10)
        txintr10 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b001111) & addr_match_c)
        txintr10 <= `L;
    end
  end
  
// Counter for counting no. of unicast (good and bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txunicastframes_gb   <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        txunicastframes_gb   <= 32'h00000000;
      else if (counter_preset)
        txunicastframes_gb <= frm_cnt_value;
      else if (counter_clr[10])
        txunicastframes_gb   <= {31'h00000000, (txucastgbcntrupdt | txucastgbcntrset)}; 
      else if (txucastgbcntrupdt & (!txunicastframesgb_allone |
               !counter_stoprollover))
        txunicastframes_gb <= txunicastframes_gb + 32'h00000001;
    end
  end



  assign txmulticastframesgb_allone = &txmulticastframes_gb;
  assign txmcastgbcntrupdt         = (txcounter_update & multicast & (|txbytecount));

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txmcastgbcntrset <= `L;
    else 
      if (txmcastgbcntrupdt)
        txmcastgbcntrset <= `H;
      else
        if (txcounter_window_over)
          txmcastgbcntrset <= `L;

// interrupt for txmulticastframes_gb
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr11 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[11] & txmcastgbcntrupdt & (& txmulticastframes_gb[30:0]) &
          txcounter_update & !counter_clr[11] & !txintr11)
        txintr11 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] && mci_ack_i & (mci_addr_r == 6'b010000) & addr_match_c)
        txintr11 <= `L;
    end
  end

// Counter for counting no. of  multicast frames transmitted (good & bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txmulticastframes_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        txmulticastframes_gb <= 32'h00000000;
      else if (counter_preset)
        txmulticastframes_gb <= frm_cnt_value;
      else if (counter_clr[11])
        txmulticastframes_gb <= {31'h00000000, (txmcastgbcntrupdt | txmcastgbcntrset)};
      else if (txmcastgbcntrupdt & (!txmulticastframesgb_allone |
               !counter_stoprollover))
        txmulticastframes_gb <= txmulticastframes_gb + 32'h00000001;
    end
  end



  assign txbroadcastframesgb_allone = &txbroadcastframes_gb;
  assign txbcastgbcntrupdt         = (txcounter_update & broadcast & (|txbytecount));

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txbcastgbcntrset <= `L;
    else 
      if (txbcastgbcntrupdt)
        txbcastgbcntrset <= `H;
      else
        if (txcounter_window_over)
          txbcastgbcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr12 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[12] & txbcastgbcntrupdt & (& txbroadcastframes_gb[30:0]) &
          txcounter_update & !counter_clr[12] & !txintr12)
        txintr12 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b010001) & addr_match_c)
        txintr12 <= `L;
    end
  end
  
  // Counter for counting no. of broadcast frames transmitted (good or bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txbroadcastframes_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        txbroadcastframes_gb <= 32'h00000000;
      else if (counter_preset)
        txbroadcastframes_gb <= frm_cnt_value;
      else if (counter_clr[12])
        txbroadcastframes_gb <= {31'h00000000, (txbcastgbcntrupdt | txbcastgbcntrset)};
      else if (txbcastgbcntrupdt & (!txbroadcastframesgb_allone | 
               !counter_stoprollover))
        txbroadcastframes_gb <= txbroadcastframes_gb + 32'h00000001;
    end
  end



  assign txunderflowerror_allone = &txunderflowerror; 
  assign txundrflwerrcntrupdt   = (frameaborted & underflow_err & 
                                    txcounter_update);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txundrflwerrcntrset <= `L;
    else 
      if (txundrflwerrcntrupdt)
        txundrflwerrcntrset <= `H;
      else
        if (txcounter_window_over)
          txundrflwerrcntrset <= `L;
  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr13 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[13] & txundrflwerrcntrupdt & (& txunderflowerror[30:0]) &
          txcounter_update & !counter_clr[13] & !txintr13)
        txintr13 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b010010) & addr_match_c)
        txintr13 <= `L;
    end
  end
  // Counter for counting no. of frames that have been aborted due to
  // underflow
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txunderflowerror <= 32'h00000000;
    end
    else begin
      if (counter_rst) begin
        txunderflowerror <= 32'h00000000;
      end
      else if (counter_preset)
        txunderflowerror <= frm_cnt_value;
      else if (counter_clr[13]) begin
        txunderflowerror <= {31'h00000000, (txundrflwerrcntrupdt | txundrflwerrcntrset)};
      end
      else if (txundrflwerrcntrupdt) begin
        if (txunderflowerror_allone && counter_stoprollover)
          txunderflowerror <= 32'hFFFFFFFF;
        else 
          txunderflowerror <= txunderflowerror + 32'h00000001;
      end
    end
  end



  assign txintr14            = `L;
  assign txsinglecolg_allone = `L;
  assign txsinglecol_g       = 32'h00000000;
  

  
  assign txintr15           = `L;
  assign txmulticolg_allone = `L;
  assign txmulticol_g       = 32'h00000000;
  


  assign txintr16          = `L;
  assign txdeferred_allone = `L;
  assign txdeferred        = 32'h00000000;
  




  assign txintr17         = `L;
  assign txlatecol_allone = `L;
  assign txlatecol        = 32'h00000000;
  


  assign txintr18 = `L;
  assign txexcesscol_allone = `L;
  assign txexcesscol = 32'h00000000;



  assign txintr19 = `L;
  assign txcarriererror_allone = `L;
  assign txcarriererror = 32'h00000000;



  assign txoctetcountg_addval = {`L,txoctetcount_g[13:0]} + {`L,txbytecount};
  assign txoctetcountg_incval = {`L,txoctetcount_g[31:14]} + {18'h00000, txoctetcountg_addval[14]};
  assign txoctetcountg_allone = txoctetcountg_incval[18];
  assign txoctgclrlstval      = (!frameaborted & 
                                 (txcounter_update | 
                                  txcounter_set_d1 |
                                   txcounter_set)) ? prev_txbytecount : 14'h0000;

// interrupt for txoctetcount_g
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr20 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[20] & txoctetcountg_addval[14] & (& txoctetcount_g[30:14]) &
          txcounter_update & !counter_clr[20] & !txintr20 & !frameaborted)
        txintr20 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b011001) & addr_match_c)
        txintr20 <= `L;
    end
  end
  
// Counter for calculating no. of bytes transmitted sucessfully 
// for good frames
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txoctetcount_g <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        txoctetcount_g <= 32'h00000000;
      else if (counter_preset)
        txoctetcount_g <= byt_cnt_value;
      else if (counter_clr[20])
        txoctetcount_g <= {18'h00000, txoctgclrlstval};
      else if (!frameaborted & txcounter_update) begin
        if (txoctetcountg_allone & counter_stoprollover)
          txoctetcount_g <= 32'hFFFFFFFF;
        else
          txoctetcount_g <= {txoctetcountg_incval[17:0], txoctetcountg_addval[13:0]};
      end
    end
  end



  assign txframecountg_allone = &txframecount_g;
  assign txfrmcntgcntrupdt    = (!frameaborted & txcounter_update); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txfrmcntgcntrset    <= `L;
    else 
      if (txfrmcntgcntrupdt)
        txfrmcntgcntrset <= `H;
      else
        if (txcounter_window_over)
          txfrmcntgcntrset <= `L;

// interrupt for txframecount_g
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr21 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[21] & txfrmcntgcntrupdt & (& txframecount_g[30:0]) &
          txcounter_update & !counter_clr[21] & !txintr21)
        txintr21 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b011010) & addr_match_c)
        txintr21 <= `L;
    end
  end
  
// Counter for counting no. of frames transmitted sucessfully without
// errors.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txframecount_g <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        txframecount_g <= 32'h00000000;
      else if (counter_preset)
        txframecount_g <= frm_cnt_value;
      else if (counter_clr[21])
        txframecount_g <= {31'h00000000, (txfrmcntgcntrupdt | txfrmcntgcntrset)};
      else if (txfrmcntgcntrupdt & (!txframecountg_allone |
               !counter_stoprollover))
        txframecount_g <= txframecount_g + 32'h00000001;
    end
  end



  assign txintr22 = `L;
  assign txexcessdef_allone = `L;
  assign txexcessdef = 32'h00000000;



  assign txpauseframes_allone = &txpauseframes;
  assign txpausecntrupdt      = (cntrl_frame & txcounter_update);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txpausecntrset    <= `L;
    else 
      if (txpausecntrupdt)
        txpausecntrset <= `H;
      else
        if (txcounter_window_over)
          txpausecntrset <= `L;

// interrupt for txpauseframes
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr23 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[23] & txpausecntrupdt & (& txpauseframes[30:0]) &
          txcounter_update & !counter_clr[23] & !txintr23)
        txintr23 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b011100) & addr_match_c)
        txintr23 <= `L;
    end
  end
  
// Counter for counting no. of PAUSE frames transmitted sucessfully without
// errors.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txpauseframes <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        txpauseframes <= 32'h00000000;
      else if (counter_preset)
        txpauseframes <= frm_cnt_value;
      else if (counter_clr[23])
        txpauseframes <= {31'h00000000, (txpausecntrupdt | txpausecntrset)};
      else if (txpausecntrupdt & (!txpauseframes_allone |
               !counter_stoprollover))
        txpauseframes <= txpauseframes + 32'h00000001;
    end
  end



  assign txvlanframes_allone = &txvlanframes;
  assign txvlancntrupdt      = (!frameaborted & vlanframe & txcounter_update);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      txvlancntrset    <= `L;
    else 
      if (txvlancntrupdt)
        txvlancntrset <= `H;
      else
        if (txcounter_window_over)
          txvlancntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txintr24 <= `L;
    end
    else begin
      if (!mmc_intr_mask_tx[24] & txvlancntrupdt & (& txvlanframes[30:0]) &
          txcounter_update & !counter_clr[24] & !txintr24)
        txintr24 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b011101) & addr_match_c)
        txintr24 <= `L;
    end
  end
  
// Counter for counting no. of VLAN frames transmitted sucessfully without
// errors.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      txvlanframes <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        txvlanframes <= 32'h00000000;
      else if (counter_preset)
        txvlanframes <= frm_cnt_value;
      else if (counter_clr[24]) 
        txvlanframes <= {31'h00000000, (txvlancntrupdt | txvlancntrset)};
      else if (txvlancntrupdt & (!txvlanframes_allone |
               !counter_stoprollover))
        txvlanframes <= txvlanframes + 32'h00000001;
    end
  end


//*****************************************
// Statistics counters for received frames.
//*****************************************

  assign rxbroadcast       = sca_rxstatus[24];
  assign rxmulticast       = sca_rxstatus[25] & !sca_rxstatus[24];
  assign rxbytecount       = sca_rxstatus[13:0];
  assign rxunicast         = !sca_rxstatus[25];
  assign rxrunterr         = sca_rxstatus[15] & sca_rxstatus[21];
  assign rxoutofrange      = (!sca_rxstatus[18] & rxbytecountgtmax); //Not Type But greater than Max_size
  assign rxcrcerr          = sca_rxstatus[21];
  assign alignmenterr      = sca_rxstatus[20];
  assign rxvlanframe       = sca_rxstatus[22];
  assign rxlengtherr       = sca_rxstatus[23];
  assign rxpauseframe      = sca_pauseframe & !freeze_cntrs_incr; 
  assign rxmaxsize         = (rxvlanframe) ? 14'h05F2 : 14'h05EE;
  assign rx_goodframe_le   = !(sca_rxstatus[21] | sca_rxstatus[20] | sca_rxstatus[19] | sca_rxstatus[23]);
  assign rx_goodframe      = rx_goodframe_le & !sca_rxstatus[15] & !rxoutofrange;
  assign rxundersize_frame = rx_goodframe_le & sca_rxstatus[15];
  assign rxmissed          = sca_fifooverflow & !freeze_cntrs_incr;
  assign rxbytecountgtmax  = (rxbytecount > rxmaxsize);
  assign rxjabbererr       = sca_rxstatus[16] & sca_rxstatus[21];
  assign rxwatchdog        = sca_rxstatus[14];

// to update the increments or addition
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      sca_rxstatus_valid_d1 <= `L;
      sca_rxstatus_valid_d2 <= `L;
    end
    else begin
      if (counter_rst) begin
        sca_rxstatus_valid_d1 <= `L;
        sca_rxstatus_valid_d2 <= `L;
      end
      else begin
        if (rxstatus_fifo_empty) begin
          sca_rxstatus_valid_d1 <= `L;
          sca_rxstatus_valid_d2 <= `L;
        end
        else begin
          if (sca_rxstatus_valid_d1) begin
            sca_rxstatus_valid_d1 <= `L;
            sca_rxstatus_valid_d2 <= `H;
          end
          else begin
            sca_rxstatus_valid_d1 <= `H;
            sca_rxstatus_valid_d2 <= `L;
          end
        end
      end
    end
  end

  assign rxcounter_update    = sca_rxstatus_valid_d2;
  assign rxcounter_update_m1 = sca_rxstatus_valid_d1;

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) begin
      rxcounter_set <= `L;
      rxcounter_set_d1 <= `L;
    end
    else begin
      rxcounter_set <= rxcounter_update;
      rxcounter_set_d1 <= rxcounter_set;
    end

  assign rxcounter_window_over = rxcounter_set_d1;
  

  //**********************************************************
  // Statistics registers to hold the receive counter updates
  //**********************************************************


  assign rxframecountgb_allone = &rxframecount_gb;  

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr0 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[0] & (&rxframecount_gb[30:0]) & rxcounter_update & 
          !counter_clr[27] & !rxintr0)
        rxintr0 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100000) & addr_match_c)
        rxintr0 <= `L;
    end
  end

  // Counter for counting no. of frames received (both good and bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxframecount_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxframecount_gb <= 32'h00000000;
      else if (counter_preset)
        rxframecount_gb <= frm_cnt_value;
      else if (counter_clr[27])
        rxframecount_gb <= {31'h00000000, (rxcounter_update | 
                            rxcounter_set_d1 |
                            rxcounter_set)};
      else if (rxcounter_update & (!rxframecountgb_allone |
               !counter_stoprollover))
        rxframecount_gb <= rxframecount_gb + 32'h00000001;
    end
  end


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      prev_rxbytecount <= {14{`L}};
    else
      if (rxcounter_update_m1)
        prev_rxbytecount <= rxbytecount;


  assign rxoctetcountgb_addval = {`L,rxoctetcount_gb[13:0]} + {`L,rxbytecount};
  assign rxoctetcountgb_incval = {`L,rxoctetcount_gb[31:14]} + {18'h00000, rxoctetcountgb_addval[14]};
  assign rxoctetcountgb_allone = rxoctetcountgb_incval[18];
  assign rxoctgbclrlstval      = (rxcounter_update | 
                                  rxcounter_set_d1 | 
                                  rxcounter_set) ?  prev_rxbytecount : 14'h0000;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr1 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[1] & rxoctetcountgb_addval[14] & (& rxoctetcount_gb[30:14]) &
          rxcounter_update & !counter_clr[28] & !rxintr1)
        rxintr1 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100001) & addr_match_c)
        rxintr1 <= `L;
    end
  end

  // counter to count the received number of octets (good or bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxoctetcount_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxoctetcount_gb <= 32'h00000000;
      else if (counter_preset)
        rxoctetcount_gb <= byt_cnt_value;
      else if (counter_clr[28])
        rxoctetcount_gb <= {18'h00000, rxoctgbclrlstval};
      else if (rxcounter_update) begin
        if (rxoctetcountgb_allone & counter_stoprollover)
          rxoctetcount_gb <= 32'hFFFFFFFF;
        else  
          rxoctetcount_gb <= {rxoctetcountgb_incval[17:0], rxoctetcountgb_addval[13:0]};
      end
    end
  end



  assign rxoctetcountg_addval = {`L,rxoctetcount_g[13:0]} + {`L,rxbytecount};
  assign rxoctetcountg_incval = {`L,rxoctetcount_g[31:14]} + {17'h00000, rxoctetcountg_addval[14]};
  assign rxoctetcountg_allone = rxoctetcountg_incval[18];
  assign rxoctgclrlstval      = ((rxcounter_update | 
                                  rxcounter_set_d1 | 
                                  rxcounter_set) & rx_goodframe) ?  prev_rxbytecount : 14'h0000;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr2 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[2] & rxoctetcountg_addval[14] & (& rxoctetcount_g[30:14]) &
          rxcounter_update & !counter_clr[29] & !rxintr2 & rx_goodframe)
        rxintr2 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100010) & addr_match_c)
        rxintr2 <= `L;
    end
  end
  
  // counter to count the received number of octets (good only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxoctetcount_g <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        rxoctetcount_g <= 32'h00000000;
      else if (counter_preset)
        rxoctetcount_g <= byt_cnt_value;
      else if (counter_clr[29])
        rxoctetcount_g <= {18'h00000, rxoctgclrlstval};
      else if (rxcounter_update & rx_goodframe) begin
        if (rxoctetcountg_allone & counter_stoprollover)
          rxoctetcount_g <= 32'hFFFFFFFF;
        else
          rxoctetcount_g <= {rxoctetcountg_incval[17:0], rxoctetcountg_addval[13:0]};
      end  
    end
  end



  assign rxbroadcastframesg_allone = &rxbroadcastframes_g;
  assign rxbcastgcntrupdt          = (rx_goodframe & rxcounter_update & rxbroadcast);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxbcastgcntrset <= `L;
    else
      if (rxbcastgcntrupdt)
        rxbcastgcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxbcastgcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr3 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[3] & rxbcastgcntrupdt & (& rxbroadcastframes_g[30:0]) 
          & rxcounter_update & !counter_clr[30] & !rxintr3)
        rxintr3 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100011) & addr_match_c)
        rxintr3 <= `L;
    end
  end
  // Counter for counting no. of unicast, multicast or broadcast
  // frames received (good only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxbroadcastframes_g <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxbroadcastframes_g <= 32'h00000000;
      else if (counter_preset)
        rxbroadcastframes_g <= frm_cnt_value;
      else if (counter_clr[30])
        rxbroadcastframes_g <= {31'h00000000, (rxbcastgcntrupdt | rxbcastgcntrset)};
      // if not bad frame (crc_error, length_error, jabber, runt, missed_frame)
      else if (rxbcastgcntrupdt & (!rxbroadcastframesg_allone |
               !counter_stoprollover))
        rxbroadcastframes_g <= rxbroadcastframes_g + 32'h00000001;
    end
  end



  assign rxmulticastframesg_allone = &rxmulticastframes_g;
  assign rxmcastgcntrupdt          = (rx_goodframe & rxcounter_update & rxmulticast);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxmcastgcntrset <= `L;
    else
      if (rxmcastgcntrupdt)
        rxmcastgcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxmcastgcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr4 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[4] & rxmcastgcntrupdt & (& rxmulticastframes_g[30:0])
          & rxcounter_update & !counter_clr[31] & !rxintr4)
        rxintr4 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100100) & addr_match_c)
        rxintr4 <= `L;
    end
  end

  // Counter for counting no. of multicast frames received (good only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxmulticastframes_g <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxmulticastframes_g <= 32'h00000000;
      else if (counter_preset)
        rxmulticastframes_g <= frm_cnt_value;
      else if (counter_clr[31]) 
        rxmulticastframes_g <= {31'h00000000, (rxmcastgcntrupdt | rxmcastgcntrset)};
      // if not bad frame (crc_error, length_error, jabber, runt, missed_frame)
      else if (rxmcastgcntrupdt & (!rxmulticastframesg_allone |
               !counter_stoprollover))
        rxmulticastframes_g <= rxmulticastframes_g + 32'h00000001;
    end
  end



  assign rxcrcerror_allone = &rxcrcerror;
  assign rxcrcerrcntrupdt  = (rxcrcerr & rxcounter_update);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxcrcerrcntrset <= `L;
    else
      if (rxcrcerrcntrupdt)
        rxcrcerrcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxcrcerrcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr5 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[5] & rxcrcerrcntrupdt & (& rxcrcerror[30:0]) &
          rxcounter_update & !counter_clr[32] & !rxintr5)
        rxintr5 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100101) & addr_match_c)
        rxintr5 <= `L;
    end
  end

  // Counter for counting no. of frames received with CRC error.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxcrcerror <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxcrcerror <= 32'h00000000;
      else if (counter_preset)
        rxcrcerror <= frm_cnt_value;
      else if (counter_clr[32])
        rxcrcerror <= {31'h00000000, (rxcrcerrcntrupdt | rxcrcerrcntrset)};
      else if (rxcrcerrcntrupdt & (!rxcrcerror_allone | !counter_stoprollover))
        rxcrcerror <= rxcrcerror + 32'h00000001;
    end
  end
  

  
  assign rxalignmenterror_allone = &rxalignmenterror;
  assign rxalignerrcntrupdt      = (alignmenterr & rxcounter_update);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxalignerrcntrset <= `L;
    else
      if (rxalignerrcntrupdt)
        rxalignerrcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxalignerrcntrset <= `L;
  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr6 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[6] & rxalignerrcntrupdt & (& rxalignmenterror[30:0]) &
          rxcounter_update & !counter_clr[33] & !rxintr6)
        rxintr6 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100110) & addr_match_c)
        rxintr6 <= `L;
    end
  end

  // Counter for counting no. of frames received with alignment error.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxalignmenterror <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxalignmenterror <= 32'h00000000;
      else if (counter_preset)
        rxalignmenterror <= frm_cnt_value;
      else if (counter_clr[33]) 
        rxalignmenterror <= {31'h00000000, (rxalignerrcntrupdt | rxalignerrcntrset)};
      else if (rxalignerrcntrupdt & (!rxalignmenterror_allone |
               !counter_stoprollover))
        rxalignmenterror <= rxalignmenterror + 32'h00000001;
    end
  end



  assign rxrunterror_allone = &rxrunterror;
  assign rxrunterrcntrupdt  = (rxrunterr && rxcounter_update);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxrunterrcntrset <= `L;
    else
      if (rxrunterrcntrupdt)
        rxrunterrcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxrunterrcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr7 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[7] & rxrunterrcntrupdt & (& rxrunterror[30:0]) &
          rxcounter_update & !counter_clr[34] & !rxintr7)
        rxintr7 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b100111) & addr_match_c)
        rxintr7 <= `L;
    end
  end

  // Counter for counting no. of runt frames received.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxrunterror <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxrunterror <= 32'h00000000;
      else if (counter_preset)
        rxrunterror <= frm_cnt_value;
      else if (counter_clr[34]) 
        rxrunterror <= {31'h00000000, (rxrunterrcntrupdt | rxrunterrcntrset)};
      else if (rxrunterrcntrupdt & (!rxrunterror_allone |
               !counter_stoprollover))
        rxrunterror <= rxrunterror + 32'h00000001;
    end
  end



  assign rxjabbererror_allone = &rxjabbererror;
  assign rxjabbererrcntrupdt  = (rxjabbererr & rxcrcerr & rxcounter_update); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxjabbererrcntrset <= `L;
    else
      if (rxjabbererrcntrupdt)
        rxjabbererrcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxjabbererrcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr8 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[8] & rxjabbererrcntrupdt & (& rxjabbererror[30:0]) &
          rxcounter_update & !counter_clr[35] & !rxintr8)
        rxintr8 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101000) & addr_match_c)
        rxintr8 <= `L;
    end
  end

  // Counter for counting no. of jabber (>2048) frames received with CRC errors.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxjabbererror <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxjabbererror <= 32'h00000000;
      else if (counter_preset)
        rxjabbererror <= frm_cnt_value;
      else if (counter_clr[35])
        rxjabbererror <= {31'h00000000, (rxjabbererrcntrupdt | rxjabbererrcntrset)};
      else if (rxjabbererrcntrupdt & (!rxjabbererror_allone |
               !counter_stoprollover))
        rxjabbererror <= rxjabbererror + 32'h00000001;
    end
  end



  assign rxundersizeg_allone = &rxundersize_g;
  assign rxundrszgcntrupdt   = (rxcounter_update & rxundersize_frame); 

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxundrszgcntrset <= `L;
    else
      if (rxundrszgcntrupdt)
        rxundrszgcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxundrszgcntrset <= `L;
  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr9 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[9] & rxundrszgcntrupdt & (& rxundersize_g[30:0]) & 
          rxcounter_update & !counter_clr[36] & !rxintr9)
        rxintr9 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101001) & addr_match_c)
        rxintr9 <= `L;
    end
  end
  
  // counter to count the number of frames rcvd less than 64 bytes
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxundersize_g <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxundersize_g <= 32'h00000000;
      else if (counter_preset)
        rxundersize_g <= frm_cnt_value;
      else if (counter_clr[36])
        rxundersize_g <= {31'h00000000, (rxundrszgcntrupdt | rxundrszgcntrset)};
      else if (rxundrszgcntrupdt & (!rxundersizeg_allone |
               !counter_stoprollover))
        rxundersize_g <= rxundersize_g + 32'h00000001;
    end
  end



  assign rxoversizeg_allone = &rxoversize_g;
  assign rxoverszcntrupdt   = (rxcounter_update & rx_goodframe_le 
                               & rxbytecountgtmax);

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxoverszcntrset <= `L;
    else
      if (rxoverszcntrupdt)
        rxoverszcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxoverszcntrset <= `L;
  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr10 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[10] & rxoverszcntrupdt & (& rxoversize_g[30:0]) &
          rxcounter_update & !counter_clr[37] & !rxintr10)
        rxintr10 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101010) & addr_match_c)
        rxintr10 <= `L;
    end
  end

  // counter to count the number of frames rcvd less than 64 bytes
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxoversize_g <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxoversize_g <= 32'h00000000;
      else if (counter_preset)
        rxoversize_g <= frm_cnt_value;
      else if (counter_clr[37])
        rxoversize_g <= {31'h00000000, (rxoverszcntrupdt | rxoverszcntrset)};
      else if (rxoverszcntrupdt & (!rxoversizeg_allone |
               !counter_stoprollover))
        rxoversize_g <= rxoversize_g + 32'h00000001;
    end
  end



  assign rx64octetsgb_allone = &rx64octets_gb;
  assign rx64octgbcntrupdt   = (rxcounter_update & (rxbytecount == 14'd64));

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rx64octgbcntrset <= `L;
    else
      if (rx64octgbcntrupdt)
        rx64octgbcntrset <= `H;
      else
        if (rxcounter_window_over)
          rx64octgbcntrset <= `L;
  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr11 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[11] & rxaddrcnt_mux0pls1[31] & !(| rxaddrcnt_mux0pls1[30:0])
          & rxcounter_update & !counter_clr[38] & !rxintr11 & rx64octgbcntrupdt)
        rxintr11 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101011) & addr_match_c)
        rxintr11 <= `L;
    end
  end


  always @(*)
  begin
    case (`H)

      rx64octgbcntrupdt       : rxaddrcnt_mux0 = rx64octets_gb;
      rx65to127octgbcntrupdt  : rxaddrcnt_mux0 = rx65to127octets_gb;
      rx128to255octgbcntrupdt : rxaddrcnt_mux0 = rx128to255octets_gb;
      default                 : rxaddrcnt_mux0 = rx128to255octets_gb;

    endcase
  end

  assign rxaddrcnt_mux0pls1 = rxaddrcnt_mux0 + 32'h00000001;
  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rx64octets_gb <= 32'h00000000;
      rx65to127octets_gb <= 32'h00000000;
      rx128to255octets_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst) begin
        rx64octets_gb <= 32'h00000000;
        rx65to127octets_gb <= 32'h00000000;
        rx128to255octets_gb <= 32'h00000000;
      end
      else if (counter_preset) begin
        rx64octets_gb       <= frm_cnt_value;
        rx65to127octets_gb  <= frm_cnt_value;
        rx128to255octets_gb <= frm_cnt_value;
      end
      else if (counter_clr[38])
        rx64octets_gb <= {31'h00000000, (rx64octgbcntrupdt | rx64octgbcntrset)};
      else if (counter_clr[39])
        rx65to127octets_gb <= {31'h00000000, (rx65to127octgbcntrupdt | rx65to127octgbcntrset)};
      else if (counter_clr[40])
        rx128to255octets_gb <= {31'h00000000, (rx128to255octgbcntrupdt | rx128to255octgbcntrset)};
      else  begin
        
      // leda DFT_022 W71 off
        case (`H) 

          rx64octgbcntrupdt : begin
          if (!rx64octetsgb_allone | !counter_stoprollover)
            rx64octets_gb <= rxaddrcnt_mux0pls1;
          end
          rx65to127octgbcntrupdt : begin
          if (!rx65to127octetsgb_allone | !counter_stoprollover)
            rx65to127octets_gb <= rxaddrcnt_mux0pls1;
          end
          rx128to255octgbcntrupdt : begin
          if (!rx128to255octetsgb_allone | !counter_stoprollover)
            rx128to255octets_gb <= rxaddrcnt_mux0pls1;
          end

        endcase
      // leda DFT_022 W71 on

      end
    end
  end

  assign rx65to127octetsgb_allone = &rx65to127octets_gb;
  assign rx65to127octgbcntrupdt   = (rxcounter_update & (rxbytecount > 14'd64 &
                                     rxbytecount < 14'd128));

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rx65to127octgbcntrset <= `L;
    else
      if (rx65to127octgbcntrupdt)
        rx65to127octgbcntrset <= `H;
      else
        if (rxcounter_window_over)
          rx65to127octgbcntrset <= `L;


  
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr12 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[12] & rxaddrcnt_mux0pls1[31] & !(| rxaddrcnt_mux0pls1[30:0])
          & rxcounter_update & !counter_clr[39] & !rxintr12 & rx65to127octgbcntrupdt)
        rxintr12 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101100) & addr_match_c)
        rxintr12 <= `L;
    end
  end
  

  assign rx128to255octetsgb_allone = &rx128to255octets_gb;
  assign rx128to255octgbcntrupdt   = (rxcounter_update & (rxbytecount > 14'd127 &
                                      rxbytecount < 14'd256));


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rx128to255octgbcntrset <= `L;
    else
      if (rx128to255octgbcntrupdt)
        rx128to255octgbcntrset <= `H;
      else
        if (rxcounter_window_over)
          rx128to255octgbcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr13 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[13] & rxaddrcnt_mux0pls1[31] & !(| rxaddrcnt_mux0pls1[30:0])
          & rxcounter_update & !counter_clr[40] & !rxintr13 & rx128to255octgbcntrupdt)
        rxintr13 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101101) & addr_match_c)
        rxintr13 <= `L;
    end
  end
  

  assign rx256to511octetsgb_allone = &rx256to511octets_gb;
  assign rx256to511octgbcntrupdt   = (rxcounter_update &(rxbytecount > 14'd255 &&
                                      rxbytecount < 14'd512));
  

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rx256to511octgbcntrset <= `L;
    else
      if (rx256to511octgbcntrupdt)
        rx256to511octgbcntrset <= `H;
      else
        if (rxcounter_window_over)
          rx256to511octgbcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr14 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[14] & rxaddrcnt_mux1pls1[31] & !(| rxaddrcnt_mux1pls1[30:0]) 
          & rxcounter_update & !counter_clr[41] & !rxintr14 & rx256to511octgbcntrupdt)
        rxintr14 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101110) & addr_match_c)
        rxintr14 <= `L;
    end
  end


  always @(*)
  begin
    case (`H)

      rx256to511octgbcntrupdt  : rxaddrcnt_mux1 = rx256to511octets_gb;
      rx512to1023octgbcntrupdt : rxaddrcnt_mux1 = rx512to1023octets_gb;
      rx1024tomaxoctgbcntrupdt : rxaddrcnt_mux1 = rx1024tomaxoctets_gb;
      default                  : rxaddrcnt_mux1 = rx1024tomaxoctets_gb;

    endcase
  end

  assign rxaddrcnt_mux1pls1 = rxaddrcnt_mux1 + 32'h00000001;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rx256to511octets_gb <= 32'h00000000;
      rx512to1023octets_gb <= 32'h00000000;
      rx1024tomaxoctets_gb <= 32'h00000000;
    end
    else begin
      if (counter_rst) begin
        rx256to511octets_gb <= 32'h00000000;
        rx512to1023octets_gb <= 32'h00000000;
        rx1024tomaxoctets_gb <= 32'h00000000;
      end
      else if (counter_preset) begin
        rx256to511octets_gb  <= frm_cnt_value;
        rx512to1023octets_gb <= frm_cnt_value;
        rx1024tomaxoctets_gb <= frm_cnt_value;
      end
      else if (counter_clr[41])
        rx256to511octets_gb <= {31'h00000000, (rx256to511octgbcntrupdt | rx256to511octgbcntrset)};
      else if (counter_clr[42])
        rx512to1023octets_gb <= {31'h00000000, (rx512to1023octgbcntrupdt | rx512to1023octgbcntrset)};
      else if (counter_clr[43])
        rx1024tomaxoctets_gb <= {31'h00000000, (rx1024tomaxoctgbcntrupdt | rx1024tomaxoctgbcntrset)};
      else begin 

      // leda DFT_022 W71 off
        case (`H) 

          rx256to511octgbcntrupdt : begin
          if (!rx256to511octetsgb_allone | !counter_stoprollover)
            rx256to511octets_gb <= rxaddrcnt_mux1pls1;
          end
          rx512to1023octgbcntrupdt : begin
          if (!rx512to1023octetsgb_allone | !counter_stoprollover)
            rx512to1023octets_gb <= rxaddrcnt_mux1pls1;
          end
          rx1024tomaxoctgbcntrupdt : begin
          if (!rx1024tomaxoctetsgb_allone | !counter_stoprollover)
            rx1024tomaxoctets_gb <= rxaddrcnt_mux1pls1;
          end

        endcase
      // leda DFT_022 W71 on

      end
    end
  end

  assign rx512to1023octetsgb_allone = &rx512to1023octets_gb;
  assign rx512to1023octgbcntrupdt   = (rxcounter_update & (rxbytecount > 14'd511 &&
                                       rxbytecount < 14'd1024));
  

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rx512to1023octgbcntrset <= `L;
    else
      if (rx512to1023octgbcntrupdt)
        rx512to1023octgbcntrset <= `H;
      else
        if (rxcounter_window_over)
          rx512to1023octgbcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr15 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[15] & rxaddrcnt_mux1pls1[31] & !(| rxaddrcnt_mux1pls1[30:0])
          & rxcounter_update & !counter_clr[42] & !rxintr15 & rx512to1023octgbcntrupdt)
        rxintr15 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b101111) & addr_match_c)
        rxintr15 <= `L;
    end
  end
  

  assign rx1024tomaxoctetsgb_allone = &rx1024tomaxoctets_gb;
  assign rx1024tomaxoctgbcntrupdt   = (rxcounter_update & (rxbytecount > 14'd1023 &
                                       rxbytecount <= rxmaxsize));
  

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rx1024tomaxoctgbcntrset <= `L;
    else
      if (rx1024tomaxoctgbcntrupdt)
        rx1024tomaxoctgbcntrset <= `H;
      else
        if (rxcounter_window_over)
          rx1024tomaxoctgbcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr16 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[16] & rxaddrcnt_mux1pls1[31] & !(| rxaddrcnt_mux1pls1[30:0])
          & rxcounter_update & !counter_clr[43] & !rxintr16 & rx1024tomaxoctgbcntrupdt)
        rxintr16 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110000) & addr_match_c)
        rxintr16 <= `L;
    end
  end




  assign rxunicastframesg_allone   = &rxunicastframes_g;
  assign rxucastgcntrupdt          = (rx_goodframe & rxcounter_update & rxunicast);


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxucastgcntrset <= `L;
    else
      if (rxucastgcntrupdt)
        rxucastgcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxucastgcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr17 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[17] & rxucastgcntrupdt & (& rxunicastframes_g[30:0]) &
          rxcounter_update & !counter_clr[44] & !rxintr17)
        rxintr17 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110001) & addr_match_c)
        rxintr17 <= `L;
    end
  end

  // Counter for counting no. of unicast, multicast or broadcast
  // frames received (good only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxunicastframes_g   <= 32'h00000000;
    end
    else begin
      if (counter_rst) 
        rxunicastframes_g   <= 32'h00000000;
      else if (counter_preset)
        rxunicastframes_g <= frm_cnt_value;
      else if (counter_clr[44])
        rxunicastframes_g   <= {31'h00000000, (rxucastgcntrupdt | rxucastgcntrset)};
      // if not bad frame (crc_error, length_error, jabber, runt, missed_frame)
      else if (rxucastgcntrupdt & (!rxunicastframesg_allone |
               !counter_stoprollover))
        rxunicastframes_g <= rxunicastframes_g + 32'h00000001;
    end
  end



  assign rxlengtherror_allone = &rxlengtherror;
  assign rxlengtherrcntrupdt  = (rxlengtherr & rxcounter_update);


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxlengtherrcntrset <= `L;
    else
      if (rxlengtherrcntrupdt)
        rxlengtherrcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxlengtherrcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr18 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[18] & rxlengtherrcntrupdt & (& rxlengtherror[30:0]) &
          rxcounter_update & !counter_clr[45] & !rxintr18)
        rxintr18 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110010) & addr_match_c)
        rxintr18 <= `L;
    end
  end

  // Counter for counting no. of length error frames received
  // (valid frames only)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxlengtherror <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxlengtherror <= 32'h00000000;
      else if (counter_preset)
        rxlengtherror <= frm_cnt_value;
      else if (counter_clr[45])
        rxlengtherror <= {31'h00000000, (rxlengtherrcntrupdt | rxlengtherrcntrset)};
      else if (rxlengtherrcntrupdt & (!rxlengtherror_allone |
               !counter_stoprollover))
        rxlengtherror <= rxlengtherror + 32'h00000001;
    end
  end



  assign rxoutofrangetype_allone = &rxoutofrangetype;
  assign rxoutofrngtypcntrupdt   = (rxoutofrange & rxcounter_update);


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxoutofrngtypcntrset <= `L;
    else
      if (rxoutofrngtypcntrupdt)
        rxoutofrngtypcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxoutofrngtypcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr19 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[19] & rxoutofrngtypcntrupdt & (& rxoutofrangetype[30:0]) &
          rxcounter_update & !counter_clr[46] & !rxintr19)
        rxintr19 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110011) & addr_match_c)
        rxintr19 <= `L;
    end
  end

  // Counter for counting no. of out of range (type_field > rx_maxsize) frames
  // received (both good and bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxoutofrangetype <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxoutofrangetype <= 32'h00000000;
      else if (counter_preset)
        rxoutofrangetype <= frm_cnt_value;
      else if (counter_clr[46])
        rxoutofrangetype <= {31'h00000000, (rxoutofrngtypcntrupdt | rxoutofrngtypcntrset)};
      else if (rxoutofrngtypcntrupdt & (!rxoutofrangetype_allone |
               !counter_stoprollover))
        rxoutofrangetype <= rxoutofrangetype + 32'h00000001;
    end
  end
  

  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      rxpausefrmcntrset_d1 <= `L;
    else
      rxpausefrmcntrset_d1 <= rxpausefrmcntrset;


  assign rxpauseframes_allone = &rxpauseframes;
  assign rxpausefrmcntrupdt   = rxpauseframe;


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxpausefrmcntrset <= `L;
    else
      if (rxpausefrmcntrupdt)
        rxpausefrmcntrset <= `H;
      else
        if (rxpausefrmcntrset_d1)
          rxpausefrmcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr20 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[20] & rxpausefrmcntrupdt & (& rxpauseframes[30:0]) & 
          !counter_clr[47] & !rxintr20)
        rxintr20 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110100) & addr_match_c)
        rxintr20 <= `L;
    end
  end

  // Counter for counting no. of valid pause frames received.
  //  received (both good and bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxpauseframes <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxpauseframes <= 32'h00000000;
      else if (counter_preset)
        rxpauseframes <= frm_cnt_value;
      else if (counter_clr[47]) 
        rxpauseframes <= {31'h00000000, (rxpausefrmcntrupdt | rxpausefrmcntrset)};
      else if (rxpausefrmcntrupdt & (!rxpauseframes_allone |
               !counter_stoprollover))
        rxpauseframes <= rxpauseframes + 32'h00000001;
    end
  end
  


  assign rxfifooverflow_allone = &rxfifooverflow;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr21 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[21]  & (& rxfifooverflow[30:0]) & rxmissed & 
          !counter_clr[48] & !rxintr21)
        rxintr21 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i && (mci_addr_r == 6'b110101) & addr_match_c)
        rxintr21 <= `L;
    end
  end

  // Counter for counting no. of frames which were missed as a 
  // result of MTL FIFO overflow.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxfifooverflow <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxfifooverflow <= 32'h00000000;
      else if (counter_preset)
        rxfifooverflow <= frm_cnt_value;
      else if (counter_clr[48]) 
        rxfifooverflow <= {31'h00000000, (rxmissed | rxfifooverflowset)};
      else if (rxmissed & (!rxfifooverflow_allone | !counter_stoprollover))
        rxfifooverflow <= rxfifooverflow + 32'h00000001;
    end
  end


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxfifooverflowset <= `L;
    else
      if (rxmissed)
        rxfifooverflowset <= `H;
      else
        if (rxfifooverflowset_d1)
          rxfifooverflowset <= `L;


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      rxfifooverflowset_d1 <= `L;
    else
      rxfifooverflowset_d1 <= rxfifooverflowset;


  assign rxvlanframes_allone = &rxvlanframes;
  assign rxvlanfrmcntrupdt   = (rxvlanframe & rxcounter_update);


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxvlanfrmcntrset <= `L;
    else
      if (rxvlanfrmcntrupdt)
        rxvlanfrmcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxvlanfrmcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr22 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[22] & rxvlanfrmcntrupdt & (& rxvlanframes[30:0]) &
          rxcounter_update & !counter_clr[49] & !rxintr22)
        rxintr22 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110110) & addr_match_c)
        rxintr22 <= `L;
    end
  end

  // Counter for counting no. of valid vlan frames received.
  // (both good and bad)
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxvlanframes <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxvlanframes <= 32'h00000000;
      else if (counter_preset)
        rxvlanframes <= frm_cnt_value;
      else if (counter_clr[49])
        rxvlanframes <= {31'h00000000, (rxvlanfrmcntrupdt | rxvlanfrmcntrset)};
      else if (rxvlanfrmcntrupdt & (!rxvlanframes_allone |
               !counter_stoprollover))
        rxvlanframes <= rxvlanframes + 32'h00000001;
    end
  end
  


  assign rxwatchdogerror_allone = &rxwatchdogerror;
  assign rxwatchdogerrcntrupdt  = (rxwatchdog & rxcounter_update);


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxwatchdogerrcntrset <= `L;
    else
      if (rxwatchdogerrcntrupdt)
        rxwatchdogerrcntrset <= `H;
      else
        if (rxcounter_window_over)
          rxwatchdogerrcntrset <= `L;

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxintr23 <= `L;
    end
    else begin
      if (!mmc_intr_mask_rx[23] & rxwatchdogerrcntrupdt & (& rxwatchdogerror[30:0]) &
          rxcounter_update & !counter_clr[50] & !rxintr23)
        rxintr23 <= `H;
      else if (mci_rdwrn_i & mci_be_i[0] & mci_ack_i & (mci_addr_r == 6'b110111) & addr_match_c)
        rxintr23 <= `L;
    end
  end

  // Counter for counting no. of frames (>2048) received with CRC errors.
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      rxwatchdogerror <= 32'h00000000;
    end
    else begin
      if (counter_rst)
        rxwatchdogerror <= 32'h00000000;
      else if (counter_preset)
        rxwatchdogerror <= frm_cnt_value;
      else if (counter_clr[50])
        rxwatchdogerror <= {31'h00000000, (rxwatchdogerrcntrupdt | rxwatchdogerrcntrset)};
      else if (rxwatchdogerrcntrupdt & (!rxwatchdogerror_allone |
               !counter_stoprollover))
        rxwatchdogerror <= rxwatchdogerror + 32'h00000001;
    end
  end


  assign rxstatus_write_e = rfc_rxstatus_valid & !rxstatus_fifo_full & !scr_freeze_cntrs_incr;
  assign rxstatus_read_e = (sca_rxstatus_valid_d2 | counter_rst) & !rxstatus_fifo_empty;

  assign rst_clk_rx_async_n  = rst_clk_rx_n;
  assign rst_clk_rx_sync_n   = `H;

  DWC_gmac_bcm21
   #(1,2,0,2) freeze_sync(
    .clk_d       (clk_rx_i), 
    .rst_d_n     (rst_clk_rx_async_n), 
    .init_d_n    (rst_clk_rx_sync_n),
    .data_s      (freeze_cntrs_incr), 
    .test        (1'b0),
    .data_d      (scr_freeze_cntrs_incr)
  );


  assign mmc_rx_fifo_in = rfc_rxstatus;
  assign sca_rxstatus = mmc_rx_fifo_out;




  DWC_gmac_async_fifo
   #(`RX_MMC_FIFO_WIDTH,2) rxstatus_fifo_inst (
    .clk_wr_i     ( clk_rx_i ),
    .rst_clk_wr_n ( rst_clk_rx_n ),
    .write_e      ( rxstatus_write_e ),
    .wdata        ( mmc_rx_fifo_in ),
    .clr_wptr     ( 1'b0 ),
    .fifo_full    ( rxstatus_fifo_full ),

    .clk_rd_i     ( clk_csr_i ),
    .rst_clk_rd_n ( rst_clk_csr_n ),
    .read_e       ( rxstatus_read_e ),
    .rdata        ( mmc_rx_fifo_out ),
    .clr_rptr     ( 1'b0 ),
    .fifo_empty   ( rxstatus_fifo_empty ) 
  );



//--------------------------------------------------------------------------
// RX IPC Frame Counters
//--------------------------------------------------------------------------

  assign rx_ipc_intr0 = `L;
  assign rx_ipv4_gd_frms_g = 32'h00000000;

  assign rx_ipc_intr1 = `L;
  assign rx_ipv4_hdrerr_frms_gb = 32'h00000000;

  assign rx_ipc_intr2 = `L;
  assign rx_ipv4_nopay_frms_gb = 32'h00000000;

  assign rx_ipc_intr3 = `L;
  assign rx_ipv4_frag_frms_gb = 32'h00000000;

  assign rx_ipc_intr4 = `L;
  assign rx_ipv4_udsbl_frms_gb = 32'h00000000;

  assign rx_ipc_intr5 = `L;
  assign rx_ipv6_gd_frms_g = 32'h00000000;

  assign rx_ipc_intr6 = `L;
  assign rx_ipv6_hdrerr_frms_gb = 32'h00000000;

  assign rx_ipc_intr7 = `L;
  assign rx_ipv6_nopay_frms_gb = 32'h00000000;

  assign rx_ipc_intr8 = `L;
  assign rx_udp_gd_frms_g = 32'h00000000;

  assign rx_ipc_intr9 = `L;
  assign rx_udp_err_frms_gb = 32'h00000000;

  assign rx_ipc_intr10 = `L;
  assign rx_tcp_gd_frms_g = 32'h00000000;

  assign rx_ipc_intr11 = `L;
  assign rx_tcp_err_frms_gb = 32'h00000000;

  assign rx_ipc_intr12 = `L;
  assign rx_icmp_gd_frms_g = 32'h00000000;

  assign rx_ipc_intr13 = `L;
  assign rx_icmp_err_frms_gb = 32'h00000000;

  

//--------------------------------------------------------------------------
// TX IPC Frame Counters
//--------------------------------------------------------------------------

  assign tx_ipc_intr0 = `L;
  assign tx_ipv4_gd_frms_g = 32'h00000000;

  assign tx_ipc_intr1 = `L;
  assign tx_ipv4_hdrerr_frms_gb = 32'h00000000;

  assign tx_ipc_intr2 = `L;
  assign tx_ipv4_nopay_frms_gb = 32'h00000000;

  assign tx_ipc_intr3 = `L;
  assign tx_ipv6_gd_frms_g = 32'h00000000;

  assign tx_ipc_intr4 = `L;
  assign tx_ipv6_hdrerr_frms_gb = 32'h00000000;

  assign tx_ipc_intr5 = `L;
  assign tx_ipv6_nopay_frms_gb = 32'h00000000;

  assign tx_ipc_intr6 = `L;
  assign tx_udp_gd_frms_g = 32'h00000000;

  assign tx_ipc_intr7 = `L;
  assign tx_udp_err_frms_gb = 32'h00000000;

  assign tx_ipc_intr8 = `L;
  assign tx_tcp_gd_frms_g = 32'h00000000;

  assign tx_ipc_intr9 = `L;
  assign tx_tcp_err_frms_gb = 32'h00000000;

  assign tx_ipc_intr10 = `L;
  assign tx_icmp_gd_frms_g = 32'h00000000;

  assign tx_ipc_intr11 = `L;
  assign tx_icmp_err_frms_gb = 32'h00000000;


  
//--------------------------------------------------------------------------
// RX IPC Octet Counters
//--------------------------------------------------------------------------


  assign rx_ipc_intr16 = `L;
  assign rx_ipv4_gd_octets_g = 32'h00000000;

  assign rx_ipc_intr17 = `L;
  assign rx_ipv4_hdrerr_octets_gb = 32'h00000000;

  assign rx_ipc_intr18 = `L;
  assign rx_ipv4_nopay_octets_gb = 32'h00000000;

  assign rx_ipc_intr19 = `L;
  assign rx_ipv4_frag_octets_gb = 32'h00000000;

  assign rx_ipc_intr20 = `L;
  assign rx_ipv4_udsbl_octets_gb = 32'h00000000;

  assign rx_ipc_intr21 = `L;
  assign rx_ipv6_gd_octets_g = 32'h00000000;

  assign rx_ipc_intr22 = `L;
  assign rx_ipv6_hdrerr_octets_gb = 32'h00000000;

  assign rx_ipc_intr23 = `L;
  assign rx_ipv6_nopay_octets_gb = 32'h00000000;

  assign rx_ipc_intr24 = `L;
  assign rx_udp_gd_octets_g = 32'h00000000;

  assign rx_ipc_intr25 = `L;
  assign rx_udp_err_octets_gb = 32'h00000000;

  assign rx_ipc_intr26 = `L;
  assign rx_tcp_gd_octets_g = 32'h00000000;

  assign rx_ipc_intr27 = `L;
  assign rx_tcp_err_octets_gb = 32'h00000000;

  assign rx_ipc_intr28 = `L;
  assign rx_icmp_gd_octets_g = 32'h00000000;

  assign rx_ipc_intr29 = `L;
  assign rx_icmp_err_octets_gb = 32'h00000000;



//--------------------------------------------------------------------------
// TX IPC Octet Counters
//--------------------------------------------------------------------------

  assign tx_ipc_intr16 = `L;
  assign tx_ipv4_gd_octets_g = 32'h00000000;

  assign tx_ipc_intr17 = `L;
  assign tx_ipv4_hdrerr_octets_gb = 32'h00000000;

  assign tx_ipc_intr18 = `L;
  assign tx_ipv4_nopay_octets_gb = 32'h00000000;

  assign tx_ipc_intr19 = `L;
  assign tx_ipv6_gd_octets_g = 32'h00000000;

  assign tx_ipc_intr20 = `L;
  assign tx_ipv6_hdrerr_octets_gb = 32'h00000000;

  assign tx_ipc_intr21 = `L;
  assign tx_ipv6_nopay_octets_gb = 32'h00000000;

  assign tx_ipc_intr22 = `L;
  assign tx_udp_gd_octets_g = 32'h00000000;

  assign tx_ipc_intr23 = `L;
  assign tx_udp_err_octets_gb = 32'h00000000;

  assign tx_ipc_intr24 = `L;
  assign tx_tcp_gd_octets_g = 32'h00000000;

  assign tx_ipc_intr25 = `L;
  assign tx_tcp_err_octets_gb = 32'h00000000;

  assign tx_ipc_intr26 = `L;
  assign tx_icmp_gd_octets_g = 32'h00000000;

  assign tx_ipc_intr27 = `L;
  assign tx_icmp_err_octets_gb = 32'h00000000;




endmodule
