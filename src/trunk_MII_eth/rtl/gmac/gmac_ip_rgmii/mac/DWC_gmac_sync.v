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
//---------------------------------------------------------------------------------
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2008/08/13 $
// File Version     :        $Revision: #44 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// GMAC Synchronisation Block (DWC_gmac_sync.v)
//
// DESCRIPTION:
// The synchronisation block for synchronising the CSR signals to GMAC transmit 
// and receive clock domains.It is also used for synchronising the signals crossing 
// transmit to receive or vice versa to their destination clock domains.
//----------------------------------------------------------------------------------

module DWC_gmac_sync (

        // Clocks and Reset
        clk_csr_i,
                      clk_tx_i,
                      clk_rx_i,
                      rst_clk_csr_n,
                      rst_clk_tx_n,
                      rst_clk_rx_n,
                      sct_crs,
                      sct_col,
                      scr_col,
                      // RGMII Status Bits
                      link_status,
                      link_speed,
                      link_mode,
                      sca_rgmii_status, 
                      // Config Reg Transmit control Signals
                      cr_reg0,
                      cr_reg0_byte0_wr,
                      cr_reg0_byte1_wr,
                      cr_reg0_byte2_wr,
                      sct_jabber_e,
                      sct_jumboframe_e,
                      sct_ifg,
                      sct_portselect,       
                      sct_frameburst_e,
                      sct_duplexmode,         
                      sct_disretry,            
                      sct_backoff_lmt,          
                      sct_deferral_chk,      
                      sct_transmit_e,
                      sct_speed,
                      sct_link_up,
                      sct_tx_config, 
                      // Config Reg Receive control signals
                      scr_disreceiveown, 
                      scr_loopback_mode,
                      scr_duplexmode,
                      scr_type_crcstrip_e,
                      scr_watchdog_e,
                      scr_jumboframe_e,
                      scr_portselect,
                      scr_autocrcpadstrip,
                      scr_ipchksum_e,
                      scr_receive_e,
                      // Hash Table High Reg signals
                      cr_reg2,
                      cr_reg3,
                      scr_hashtable,
                      // Flow control Reg Transmit controls
                      cr_reg6,
                      cr_reg6_byte0_wr,
                      cr_pausetime,
                      sct_pausetime,
                      sct_backpressure,
                      sct_txctrlframe,
                      sct_txflowctrl_e,
                      sct_disable_zqpf,
                      sct_flowthresh,
                      frx_load_pause_time,
                      sct_load_pause_time,
                      ftx_txctrl_done,
                      sca_txctrl_done,
                      // Flow control Reg Receive controls
                      scr_rxflowctrl_e,
                      scr_unicastdetect,
                      // Address Filter Block controls
                      cr_reg1,
                      cr_reg1_byte0_wr,
                      cr_reg1_byte1_wr,
                      scr_passctrlframe,
                      scr_disbroadcast,
                      scr_promiscousmode,
                      scr_receiveall,
                      scr_safilter_e,
                      scr_sainversefilter,
                      scr_dainversefilter,
                      scr_passallmulticast,
                      scr_hashunicast,
                      scr_hashmulticast,
                      scr_hashnperfect_e,
                      // Debug Status register signals
                      tfc_fsm_sts,
                      mte_dbg_sts,
                      rfc_fsm_sts,
                      rpe_fsm_sts,
                      sca_mac_dbg_sts,
                      // MAC Addr0 Reg signals
                      cr_macaddr0,
                      scr_macaddr0,
                      sct_macaddr0,
                      // VLAN Tag Reg signals
                      cr_vlantag,
                      scr_vlantag
                      );
       
// Input and Output port declarations.
  
  // Clocks and Reset
  input            clk_csr_i;            // Application clock.   
  input            clk_tx_i;             // GMAC Transmit Clock (2.5/25/125)Mhz. 
  input            clk_rx_i;             // GMAC Receive Clock (2.5/25/125)Mhz.
  input            rst_clk_csr_n;        // Active Low reset synchronous to clk_csr_i.
  input            rst_clk_tx_n;         // Active Low reset synchronous to clk_tx_i. 
  input            rst_clk_rx_n;         // Active Low reset synchronous to clk_rx_i.
        
  
  // Receive GMII signals
  output           sct_crs;              // GMII carrier sense.
  output           sct_col;              // GMII collision detect sync'd to clk_tx_i.
  output           scr_col;              // GMII collision detect sync'd to clk_rx_i.
 
  // RGMII Status Bits
  input           link_status;          // Link status from RGMII Block.
  input  [1:0]    link_speed;           // Link speed from RGMII Block.
  input           link_mode;            // Half or Full duplex mode.
  output [3:0]    sca_rgmii_status;     // aggregated status sync'd to
                                       // application clock. 
  // SMII Status Bits
  
  // MMC Status Inputs


  // MMC Status Outputs
                                            // sync'd to Application clock.
    

// GMAC Transmit controls sync'd to MAC Transmit clock
  
  input  [26:2]    cr_reg0;              // Configuration register signals.
  input            cr_reg0_byte0_wr;     // MAC Config reg byte0 write pulse.
  input            cr_reg0_byte1_wr;     // MAC Config reg byte1 write pulse.
  input            cr_reg0_byte2_wr;     // MAC Config reg byte2 write pulse.
                                         
  output           sct_jabber_e;         // jabber enable.
  output           sct_jumboframe_e;     // Jumboframe enable.
  output [2:0]     sct_ifg;              // Minimum IFG between frames.
  output           sct_portselect;       // GMII/MII Mode select.
  output           sct_frameburst_e;     // FrameBurst Enable sync'ed to clk_tx 
  output           sct_duplexmode;       // Duplex mode select.
  output           sct_disretry;         // Retry on collision disable.
  output [1:0]     sct_backoff_lmt;      // Back off limit.
  output           sct_deferral_chk;      // Deferral check enable.
  output           sct_transmit_e;       // GMAC trasnmit FSM enable.
  output           sct_speed;            // If 1 100Mbps else 10Mbps

  output           sct_link_up;          // If 1 link is up.
  output           sct_tx_config;      // Control bit governing the
                                       // transmission of duplex mode,speed
                                       // link up/down to PHY in RGMII/SGMII/SMII
  
// GMAC Receive controls sync'd to MAC receive clock
  output           scr_disreceiveown;    // Disable reception of frames  
                                         // when gmii_txen_o is asserted.
                                         
  output           scr_loopback_mode;    // Enabling loopback of transmit 
                                         // data(half duplex).
                                         
  output           scr_duplexmode;       // Duplexmode bit.
  output           scr_type_crcstrip_e;  // Enabling stripping of last 4 bytes in Type frames

  output           scr_watchdog_e;       // Enabling the watchdog cutoff.
  output           scr_jumboframe_e;     // Enabling reception of frames 
                                         // upto 9018/9022(VLAN).
                                         
  output           scr_portselect;       // Portselect sync'd to GMAC Rx clock.
  output           scr_autocrcpadstrip;  // strip pad & FCS for frame  
                                         // received <= 1500 bytes. 
                                         
  output           scr_ipchksum_e;       // IP checksum enable sync'd to 
                                         // GMAC Rx clock.
                                         
  output           scr_receive_e;        // Enabling the receive FSM.
  
  // Hash Table Register signals
  input  [31:0]    cr_reg2;              // Hash Table High register signals.  
  input  [31:0]    cr_reg3;              // Hash table Low register signals.
  output [63:0]    scr_hashtable;        // Hash Table sync'd to clk_rx_i.
  
  // Transmit flow control signals synchronised to MAC transmit clock
  
  input  [15:0]     cr_reg6;             // Flow control register signals. 
  input             cr_reg6_byte0_wr;    // Flow control reg byte0 write pulse.
  input  [15:0]     cr_pausetime;        // Pause time in Flow control register. 
  
  output [15:0]     sct_pausetime;       // Pause time sync'd to clk_tx_i.
  output            sct_backpressure;    // Activate backpressure.
  output            sct_txctrlframe;     // Initiate Pause Frame Transmit.
  output            sct_txflowctrl_e;    // Pause frame transmit.
  output            sct_disable_zqpf;    // Disable Automatic Zero-Quanta Pause Frame.
  output [1:0]      sct_flowthresh;      // Lower threshold for pause timer 
                                         // to start a pause transmission.
                                         
  input             frx_load_pause_time; // Load pause time from FRX
  output            sct_load_pause_time; // frx_load_pause_time synced to tx clock
  output            sca_txctrl_done;     // Transmit Pause frame done sync'd 
                                         // to application clock          
  input             ftx_txctrl_done;     // Transmit Pause frame done.
  
// Receive flow control synchronised to MAC receive clock
 
  output            scr_rxflowctrl_e;    // Enable receive flow control. 
  output            scr_unicastdetect;   // Enable uni-cast pause frame detection.

// Address Filter Block controls synchronised to MAC receive clock
  
  input  [11:0]     cr_reg1;              // MAC Frame Filter register signals.
  input             cr_reg1_byte0_wr;     // Frame Filter reg byte0 write pulse.
  input             cr_reg1_byte1_wr;     // Frame Filter reg byte1 write pulse.
  
  output [1:0]      scr_passctrlframe;    // Pass all control frame to application.
  output            scr_disbroadcast;     // Disable reception of all 
                                          // broadcast frames.
                                         
  output            scr_promiscousmode;   // Disable filtering of frames 
                                          // based on DA or SA.
                                         
  output            scr_receiveall;       // Enable reception of all frame 
                                          // irrespective of DA or SA.
                                         
  output            scr_safilter_e;       // Enable filtering based on SA.
  output            scr_sainversefilter;  // Enable inverse filtering based on SA.
  output            scr_dainversefilter;  // Enable inverse filtering based on DA.
  output            scr_passallmulticast; // Enable reception of all multicast frames.
  output            scr_hashunicast;      // Enable hash filtering when set 
                                          // and unicast filtering when reset.
                                         
  output            scr_hashmulticast;    // Enable hash filtering when set 
                                          // and multicast filtering when reset.
  output            scr_hashnperfect_e;   // Perfect Filtering is enabled irrespective 
                                          // of scr_hashmulticast & scr_hashunicast
  
// VLAN Tag Reg signals
  input  [16:0]     cr_vlantag;           // VLAN Tag register signals.
  output [16:0]     scr_vlantag;          // VLAN Tag sync'd to clk_rx_i.
  
// Debug Status register signals
  input  [1:0]    tfc_fsm_sts;    // FSM state of TFC
  input  [1:0]    mte_dbg_sts;    // Debug status from MTE
  input  [1:0]    rfc_fsm_sts;    // FSM state of RFC
  input           rpe_fsm_sts;    // FSM state of RPE
  output [6:0]    sca_mac_dbg_sts;//Sync'ed debug signals
  
  // MAC Addr0 Reg signals
  input  [47:0]     cr_macaddr0;          // MAC Address0 High register bits.
  output [47:0]     scr_macaddr0;         // MAC Address0 sync'd to clk_tx_i.
  output [47:0]     sct_macaddr0;         // MAC Address0 sync'd to clk_rx_i.
    
  // Additional MAC Address signals
   
  
  
  
   
  
  
  
  
  
  
  
  
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
// Internal Reg and wire declarations
  
  wire      rst_clk_csr_async_n; // Reset for the async reset pins of f/f in clk_csr domain
  wire      rst_clk_csr_sync_n;  // Reset for the sync reset pins of f/f in clk_csr domain
  wire      rst_clk_tx_async_n;  // Reset for the async reset pins of f/f in clk_tx domain
  wire      rst_clk_tx_sync_n;   // Reset for the sync reset pins of f/f in clk_tx domain
  wire      rst_clk_rx_async_n;  // Reset for the async reset pins of f/f in clk_rx domain
  wire      rst_clk_rx_sync_n;   // Reset for the sync reset pins of f/f in clk_rx domain
  wire              scr_watchdog_e;   // Watchdog Enable sync'd to GMAC Rx clock.
  wire              sct_jabber_e;     // Jabber enable sync'd to GMAC Tx clock.
  wire              sct_crs;          // Carrier Sense sync'd to GMAC Tx clock.
  wire              sct_col;          // Collision detect sync'd to GMAC Tx clock.
  wire              scr_col;          // Collision detect sync'd to GMAC Rx clock.
  wire              sct_reg0_byte0_wr;// CSR Reg0 Byte0 write sync'd to Tx clock.
  wire              sct_reg0_byte1_wr;// CSR Reg0 Byte1 write sync'd to Tx clock.
  wire              sct_reg0_byte2_wr;// CSR Reg0 Byte2 write sync'd to Tx clock.
  wire              sct_reg6_byte0_wr;// CSR Reg6 Byte0 write sync'd to Tx clock. 
  wire              scr_reg0_byte0_wr;// CSR Reg0 Byte0 write sync'd to Rx clock.
  wire              scr_reg0_byte1_wr;// CSR Reg0 Byte1 write sync'd to Rx clock.
  wire              scr_reg0_byte2_wr;// CSR Reg0 Byte2 write sync'd to Rx clock.
  wire              scr_reg1_byte0_wr;// CSR Reg1 Byte0 write sync'd to Rx clock.
  wire              scr_reg1_byte1_wr;// CSR Reg1 Byte1 write sync'd to Rx clock.
  wire              scr_reg6_byte0_wr;// CSR Reg6 Byte0 write sync'd to Rx clock.

  reg               sct_jabber_dis;   // Jabber disable bit sync'd to GMAC Tx clock. 
  reg  [2:0]        sct_ifg;          // IFG sync'd to GMAC Tx Clock.
  reg               sct_jumboframe_e; // Jumbo frame enable sync'd to Tx clock
  
  wire              sct_portselect;   // Port select sync'd to GMAC Tx clock.
  wire              scr_portselect;   // Portselect bit sync'd to GMAC Rx clock.


  reg               sct_link_up;
  reg               sct_speed;
  
  wire              sct_frameburst_e; // Frame burst enable sync'd to Tx clock.
  wire              sct_duplexmode;   // Duplexmode sync'd to Tx clock.
  wire              sct_disretry;     // Disable retry sync'd to Tx clock.
  wire [1:0]        sct_backoff_lmt;  // Backoff Limit sync'd to Tx clock.
  wire              sct_deferral_chk; // Deferral Check sync'd to Tx clock.

  reg               sct_transmit_e;   // Transmit Enable sync'd to GMAC Tx clock.
  reg               sct_txflowctrl_e; // Tx flow control sync'd to GMAC Tx clock.
  reg               sct_disable_zqpf; // Disable Automatic Zero-Quanta Pause Frame.
  reg  [1:0]        sct_flowthresh;   // Flow threshold trigger for Pause control 
                                      // frame sync'd to GMAC Tx clock.
  
  reg               cr_flow_ctrl;     // Registered Flow Control bit from CSR (cr_reg[0])
  wire              flow_ctrl_p;      // Flow Control pulse passed to TxClk domain

  
  reg               scr_rxflowctrl_e; // Receive Flow control enable bit 
                                      // sync'd to GMAC Rx clock.
                                    
  reg               scr_unicastdetect;// Unicast Pause Frame detect bit sync'd 
                                      // to GMAC Rx clock.
                                    
  reg               scr_watchdog_dis; // Watchdog disable bit sync'd to 
                                      // GMAC Rx clock.
                                    
  reg               scr_jumboframe_e; // Jumbo Frame Enable bit sync'd to 
                                      // GMAC Rx clock.
                                    
  reg               scr_loopback_mode;// Loopback mode sync'd to GMAC Rx clock.
    
  wire              scr_disreceiveown;// Disable receive sync'd to Rx clock.
  wire              scr_duplexmode;   // Duplexmode bit sync'd to GMAC Rx clock.

 
  reg               scr_autocrcpadstrip; // Automatic pad and crc stripping enable bit 
                                         // sync'd to GMAC Rx clock.
                                    
  reg               scr_receive_e;    // Receive Enable sync'd to GMAC Rx clock.
  reg  [10:0]       scr_reg1;         // CSR Register1 sync'd to GMAC Rx clock;
  
  wire  [47:0]      sct_macaddr0;   // MAC addr0 reg sync'd to GMAC Tx clock;
  wire  [47:0]      scr_macaddr0;   // MAC addr0 reg sync'd to GMAC Rx clock;

 
  wire [3:0]        sca_rgmii_status;// status bits sync'd to application clock; 

  
  wire              txctrl_done_sync;        // ftx_txctrl_done sync'd to clk_csr_i;







//-----------------------------------------------
// Reset Assignments
//-----------------------------------------------
  assign rst_clk_tx_async_n  = rst_clk_tx_n;
  assign rst_clk_tx_sync_n   = `H;
  assign rst_clk_csr_async_n = rst_clk_csr_n;
  assign rst_clk_csr_sync_n  = `H;
  assign rst_clk_rx_async_n  = rst_clk_rx_n;
  assign rst_clk_rx_sync_n   = `H;

  
//-----------------------------------------------
// GMAC Transmit Control signals synchronisation.
//-----------------------------------------------
  
// config register write pulse synchroniser(Tx clock).
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg0_byte0_wr_tsync(
                              .clk_s       (clk_csr_i),
                              .rst_s_n     (rst_clk_csr_async_n), 
                              .init_s_n    (rst_clk_csr_sync_n), 
                              .event_s     (cr_reg0_byte0_wr), 
                              .clk_d       (clk_tx_i), 
                              .rst_d_n     (rst_clk_tx_async_n), 
                              .init_d_n    (rst_clk_tx_sync_n), 
                              .event_d     (sct_reg0_byte0_wr),
                              .test        (1'b0)
                               );
  
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg0_byte1_wr_tsync(
                              .clk_s       (clk_csr_i),
                              .rst_s_n     (rst_clk_csr_async_n), 
                              .init_s_n    (rst_clk_csr_sync_n), 
                              .event_s     (cr_reg0_byte1_wr), 
                              .clk_d       (clk_tx_i), 
                              .rst_d_n     (rst_clk_tx_async_n), 
                              .init_d_n    (rst_clk_tx_sync_n), 
                              .event_d     (sct_reg0_byte1_wr),
                              .test        (1'b0)
                               );

  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg0_byte2_wr_tsync(
                              .clk_s       (clk_csr_i),
                              .rst_s_n     (rst_clk_csr_async_n), 
                              .init_s_n    (rst_clk_csr_sync_n), 
                              .event_s     (cr_reg0_byte2_wr), 
                              .clk_d       (clk_tx_i), 
                              .rst_d_n     (rst_clk_tx_async_n), 
                              .init_d_n    (rst_clk_tx_sync_n), 
                              .event_d     (sct_reg0_byte2_wr),
                              .test        (1'b0)
                               );
    
  assign sct_jabber_e = ~sct_jabber_dis;
  
  assign sct_frameburst_e = cr_reg0[21];
  assign sct_duplexmode   = cr_reg0[11];
  assign sct_disretry     = cr_reg0[9];
  assign sct_backoff_lmt  = cr_reg0[6:5];
  assign sct_deferral_chk = cr_reg0[4];

  assign sct_portselect   = cr_reg0[15];


  
  // Synchronising Byte2 of MAC config register to GMAC TX clock.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      sct_jabber_dis <= `L;
      sct_ifg <= {3{`L}};
      sct_jumboframe_e <= `L;
    end
    else begin
      if (sct_reg0_byte2_wr) begin
        sct_jabber_dis <= cr_reg0[22];
        sct_jumboframe_e <= cr_reg0[20];
        sct_ifg <= cr_reg0[19:17];
      end  
    end
  end 
 
  // Synchronising Byte1 of MAC config register to GMAC TX clock.



  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      sct_link_up <= `L;
    end
    else begin
      if (sct_reg0_byte1_wr) begin
        sct_link_up <= cr_reg0[8];
      end  
    end
  end
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      sct_speed <= `L;
    end
    else begin
      if (sct_reg0_byte1_wr) begin
        sct_speed <= cr_reg0[14];
      end  
    end
  end

  DWC_gmac_bcm21
   #(1,2,0,2) cr_tx_config_sync_tx_clk (
                                   .clk_d       (clk_tx_i),
                                   .rst_d_n     (rst_clk_tx_async_n), 
                                   .init_d_n    (rst_clk_tx_sync_n), 
                                   .data_s      (cr_reg0[24]), 
                                   .test        (1'b0),
                                   .data_d      (sct_tx_config)
                                  );





  
  // Synchronising Byte0 of MAC config register to GMAC TX clock.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
        //20170706-twu: default tx enable
      sct_transmit_e <= `H;
      //sct_transmit_e <= `L;
    end
    else begin
      if (sct_reg0_byte0_wr) begin
        sct_transmit_e <= cr_reg0[3];
      end  
    end
  end
  
  assign sct_crs = `L;
  assign sct_col = `L;



  

   
  
  //----------------------------------------------
  // GMAC Receive Control signals synchronisation.
  //----------------------------------------------
  
  
  // config register write pulse synchroniser(Rx clock).
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg0_wr_byte0_rsync(
                          .clk_s       (clk_csr_i), 
                          .rst_s_n     (rst_clk_csr_async_n), 
                          .init_s_n    (rst_clk_csr_sync_n), 
                          .event_s     (cr_reg0_byte0_wr), 
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .event_d     (scr_reg0_byte0_wr),
                          .test        (1'b0)
                         );
    
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg0_wr_byte1_rsync(
                          .clk_s       (clk_csr_i), 
                          .rst_s_n     (rst_clk_csr_async_n), 
                          .init_s_n    (rst_clk_csr_sync_n), 
                          .event_s     (cr_reg0_byte1_wr), 
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .event_d     (scr_reg0_byte1_wr),
                          .test        (1'b0)
                         );
    
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg0_wr_byte2_rsync(
                          .clk_s       (clk_csr_i), 
                          .rst_s_n     (rst_clk_csr_async_n), 
                          .init_s_n    (rst_clk_csr_sync_n), 
                          .event_s     (cr_reg0_byte2_wr), 
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .event_d     (scr_reg0_byte2_wr),
                          .test        (1'b0)
                         );
    

  
  assign scr_col = `L;

 
  DWC_gmac_bcm21
   #(1,2,0,2) type_crcstrip_sync(
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .data_s      (cr_reg0[25]), 
                          .test        (1'b0),
                          .data_d      (scr_type_crcstrip_e)
                          );   

  assign scr_watchdog_e = ~scr_watchdog_dis;

  assign scr_disreceiveown = cr_reg0[13];
  assign scr_duplexmode = cr_reg0[11];

  
  assign scr_ipchksum_e = cr_reg0[10];

  
  assign scr_portselect = cr_reg0[15];

  
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n) begin
      scr_watchdog_dis <= `L;
      scr_jumboframe_e <= `L;
    end
    else begin
      if (scr_reg0_byte2_wr) begin 
        scr_watchdog_dis <= cr_reg0[23];
        scr_jumboframe_e <= cr_reg0[20];
      end  
    end
  end

  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n) begin
      scr_loopback_mode <= `L;
    end
    else begin
      if (scr_reg0_byte1_wr) begin
        scr_loopback_mode <= cr_reg0[12];
      end 
    end
  end

  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n) begin
      scr_autocrcpadstrip <= `L;
      //20170706-twu: default rx enable
      //scr_receive_e <= `L;
      scr_receive_e <= `H;
    end
    else begin
      if (scr_reg0_byte0_wr) begin 
        scr_autocrcpadstrip <= cr_reg0[7];
        scr_receive_e <= cr_reg0[2];
      end  
    end
  end
  //--------------------------------------
  // Frame Filter register synchronisation
  //--------------------------------------
  assign scr_passctrlframe = scr_reg1[7:6];
  assign scr_disbroadcast = scr_reg1[5];
  assign scr_promiscousmode = scr_reg1[0];
  assign scr_safilter_e = scr_reg1[9];
  assign scr_sainversefilter = scr_reg1[8];
  assign scr_dainversefilter = scr_reg1[3];
  assign scr_passallmulticast = scr_reg1[4];
  assign scr_hashunicast = scr_reg1[1];
  assign scr_hashmulticast = scr_reg1[2];
  assign scr_hashnperfect_e = scr_reg1[10];
    
  
  // MAC Frame filter register write pulse synchroniser.

  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg1_wr_byte0_rsync(
                          .clk_s       (clk_csr_i), 
                          .rst_s_n     (rst_clk_csr_async_n), 
                          .init_s_n    (rst_clk_csr_sync_n), 
                          .event_s     (cr_reg1_byte0_wr), 
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .event_d     (scr_reg1_byte0_wr),
                          .test        (1'b0)
                         );

  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg1_wr_byte1_rsync(
                          .clk_s       (clk_csr_i), 
                          .rst_s_n     (rst_clk_csr_async_n), 
                          .init_s_n    (rst_clk_csr_sync_n), 
                          .event_s     (cr_reg1_byte1_wr), 
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .event_d     (scr_reg1_byte1_wr),
                          .test        (1'b0)
                         );

  DWC_gmac_bcm21
   #(1,2,0,2) receiveall_rsync(
                          .clk_d       (clk_rx_i), 
                          .rst_d_n     (rst_clk_rx_async_n), 
                          .init_d_n    (rst_clk_rx_sync_n), 
                          .data_s      (cr_reg1[11]), 
                          .test        (1'b0),
                          .data_d      (scr_receiveall)
                         );
  
  // Filter Frame Reg Byte0 sync'd to GMAC Rx clock
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n) begin
      scr_reg1[7:0] <= {8{`L}};
    end
    else
      if (scr_reg1_byte0_wr) 
        scr_reg1[7:0] <= cr_reg1[7:0];
  end
  
  // Filter Frame Reg Byte1 sync'd to GMAC Rx clock
  always @(`RX_RST_MODE) begin
   if (~rst_clk_rx_n) begin
     scr_reg1[10:8] <= {3{`L}};
   end
   else
     if (scr_reg1_byte1_wr) 
       scr_reg1[10:8] <= cr_reg1[10:8];
  end
  




  
  assign scr_hashtable = {cr_reg2, cr_reg3};


  //----------------------------------------------
  // Transmit flow control signals synchronisation.
  //----------------------------------------------
  
  // Flow control register write pulse synchroniser(Tx clock).
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg6_wr_byte0_tsync(
                                .clk_s       (clk_csr_i), 
                                .rst_s_n     (rst_clk_csr_async_n), 
                                .init_s_n    (rst_clk_csr_sync_n), 
                                .event_s     (cr_reg6_byte0_wr), 
                                .clk_d       (clk_tx_i), 
                                .rst_d_n     (rst_clk_tx_async_n), 
                                .init_d_n    (rst_clk_tx_sync_n), 
                                .event_d     (sct_reg6_byte0_wr),
                                .test        (1'b0)
                               );
    

    

    
  assign sct_backpressure = `L;


  
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) 
      cr_flow_ctrl <= `L;
    else
      cr_flow_ctrl <= cr_reg6[0];
  end

  assign flow_ctrl_p = cr_reg6[0] & ~cr_flow_ctrl;

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      sct_txflowctrl_e <= `L;
      sct_flowthresh <= {2{`L}};
      sct_disable_zqpf <= `L;
    end
    else begin
      if (sct_reg6_byte0_wr) begin
        sct_txflowctrl_e <= cr_reg6[1];
        sct_flowthresh <= cr_reg6[5:4];
        sct_disable_zqpf <= cr_reg6[7];
      end  
    end
  end 

  assign sca_txctrl_done = txctrl_done_sync;
  


  
  DWC_gmac_bcm22
   #(0,2,0,2,0) ftx_txctrl_done_sync(
                              .clk_s       (clk_tx_i), 
                              .rst_s_n     (rst_clk_tx_async_n), 
                              .init_s_n    (rst_clk_tx_sync_n), 
                              .event_s     (ftx_txctrl_done), 
                              .clk_d       (clk_csr_i), 
                              .rst_d_n     (rst_clk_csr_async_n),
                              .init_d_n    (rst_clk_csr_sync_n),
                              .event_d     (txctrl_done_sync),
                              .test        (1'b0)       
                              );

  DWC_gmac_bcm22
   #(0,2,0,2,0) txctrlframe_sync(
                              .clk_s       (clk_csr_i), 
                              .rst_s_n     (rst_clk_csr_async_n), 
                              .init_s_n    (rst_clk_csr_sync_n), 
                              .event_s     (flow_ctrl_p), 
                              .clk_d       (clk_tx_i), 
                              .rst_d_n     (rst_clk_tx_async_n), 
                              .init_d_n    (rst_clk_tx_sync_n), 
                              .event_d     (sct_txctrlframe),
                              .test        (1'b0)
                              );
 
  DWC_gmac_bcm22
   #(0,2,0,2,0) frx_pause_sync(
                             .clk_s       (clk_rx_i), 
                             .rst_s_n     (rst_clk_rx_async_n), 
                             .init_s_n    (rst_clk_rx_sync_n), 
                             .event_s     (frx_load_pause_time), 
                             .clk_d       (clk_tx_i), 
                             .rst_d_n     (rst_clk_tx_async_n), 
                             .init_d_n    (rst_clk_tx_sync_n), 
                             .event_d     (sct_load_pause_time),
                             .test        (1'b0)
                            );
  
  assign sct_pausetime = cr_pausetime;



  
  //---------------------------------------------
  // Receive flow cntrol signals synchronisation
  //---------------------------------------------

  
  // Flow control register write pulse synchroniser(Rx clock).
  DWC_gmac_bcm22
   #(0,2,0,2,0) cr_reg6_wr_rsync(
                          .clk_s       (clk_csr_i),
                          .rst_s_n     (rst_clk_csr_async_n),
                          .init_s_n    (rst_clk_csr_sync_n),
                          .event_s     (cr_reg6_byte0_wr),
                          .clk_d       (clk_rx_i),
                          .rst_d_n     (rst_clk_rx_async_n),
                          .init_d_n    (rst_clk_rx_sync_n),
                          .event_d     (scr_reg6_byte0_wr),
                          .test        (1'b0)
                         );
  
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n) begin
      scr_rxflowctrl_e <= `L;
      scr_unicastdetect <= `L;
    end
    else begin
      if (scr_reg6_byte0_wr) begin
        scr_rxflowctrl_e <= cr_reg6[2];
        scr_unicastdetect <= cr_reg6[3];
      end
    end
  end  
 




    
  assign scr_vlantag = cr_vlantag;


  //---------------------------
  // Debug Status register synchronization
  //---------------------------
    DWC_gmac_bcm21
     #(4,2,0,2) tx_dbg_sts (
                                   .clk_d         (clk_csr_i),
                                   .rst_d_n       (rst_clk_csr_async_n),
                                   .init_d_n      (rst_clk_csr_sync_n),
                                   .data_s        ({mte_dbg_sts[1],tfc_fsm_sts,mte_dbg_sts[0]}), 
                                   .test          (1'b0),
                                   .data_d        (sca_mac_dbg_sts[6:3])
                                   );

    DWC_gmac_bcm21
     #(3,2,0,2) rx_dbg_sts (
                                   .clk_d         (clk_csr_i),
                                   .rst_d_n       (rst_clk_csr_async_n),
                                   .init_d_n      (rst_clk_csr_sync_n),
                                   .data_s        ({rfc_fsm_sts,rpe_fsm_sts}), 
                                   .test          (1'b0),
                                   .data_d        (sca_mac_dbg_sts[2:0])
                                   );

  //---------------------------
  // MAC Addr0 synchronisation.
  //---------------------------
  

      

      
  assign sct_macaddr0 = cr_macaddr0;
  assign scr_macaddr0 = cr_macaddr0;

    

        
    

        
    

        
    

    

    

        
    

        
    

        
    

        
    

        
    

        
    

    

    

    


































    // synchronizing RGMII status with respect to clk_csr_i
        DWC_gmac_bcm21
         #(4,2,0,2) rgmii_status (
                                       .clk_d         (clk_csr_i),
                                       .rst_d_n       (rst_clk_csr_async_n),
                                       .init_d_n      (rst_clk_csr_sync_n),
                                       .data_s        ({link_status,link_speed,link_mode}), 
                                       .test          (1'b0),
                                       .data_d        (sca_rgmii_status)
                                       );


    // synchronizing SMII status with respect to clk_csr_i

        
// synchronizing time stamp enable pulse to clk_tx_i




// synchronizing time stamp enable pulse to clk_rx_i



                                      















// synchronizing coarse or fine update signal to clk_ptp_ref_i

                                      
// synchronizing coarse or fine update signal to clk_ptp_ref_i

        
// Pulse synch. timestamp latch for Rx. frame recieved

// Pulse synch. timestamp latch for Tx. frame transmittes


// Pulse synch. for initialize the time stamp


// Pulse synch. for updating the time stamp


// synchronizing sub-sec incr. reg. write pulse

// Update the time stamp in CSR


// Pulse synch. for updating the time stamp



// Double sync the input auxiliary snapshot trigger


// Detect rising edge of ptp_aux_ts_trig_i_sync to create a trig. pulse 


   



 





        







 















endmodule
