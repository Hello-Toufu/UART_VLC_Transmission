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
// File Version     :        $Revision: #10 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// RGMII (rgmii.v)
//
// DESCRIPTION:
// RGMII top module
// Top level instance with GMRT and GMRR instances.
//--------------------------------------------------------------------------

module DWC_gmac_rgmii (
              rst_clk_tx_n,
                       rst_clk_rx_n,
                       clk_tx_i,
                       clk_rx_i,
                       rst_clk_tx_180_n,
                       rst_clk_rx_180_n,
                       clk_tx_180_i,
                       clk_rx_180_i,
                       gmii_txen,
                       gmii_txer,
                       gmii_txd,
                       sct_portselect,
                       sct_speed,
                       sct_link_up,
                       sct_tx_config,
                       sct_duplexmode,
                       rgmii_txd_o,
                       rgmii_tctl_o,
                       rgmii_rxd_i,
                       rgmii_rctl_i,
                       gmii_rxd,
                       gmii_rxer,
                       gmii_rxdv,
                       gmii_crs,
                       gmii_col,
                       link_status,
                       link_speed,
                       link_mode
                       );

// -----------------------------------
// Input declarations.----------------
// -----------------------------------
input           rst_clk_tx_n;  // Reset sync to clk_tx.
input           rst_clk_rx_n;  // Reset sync to clk_rx.

input           clk_tx_i;     // 2.5/25/125 MHz RGMII Transmit clock.
input           clk_rx_i;     // 2.5/25/125 MHz RGMII Receive clock.

input           rst_clk_tx_180_n;  // Reset sync to clk_tx_180_i.
input           rst_clk_rx_180_n;  // Reset sync to clk_rx_180_i.
input           clk_tx_180_i;      // inverted clk_tx_i.
input           clk_rx_180_i;      // inverted clk_rx_i.

input           gmii_txen;    // GMII transmit enable.
input           gmii_txer;    // GMII transmit error.
input  [7:0]    gmii_txd;     // GMII transmit data.
input           sct_portselect;     // Speed select input synchronous to tx1_clk.
                                    // 0 => Gig mode ; 1 => 10/100 mode
input           sct_speed;      // If 1 100Mbps else 10Mbps
input           sct_link_up;    // If 1 link is up.
input           sct_tx_config;  // Control bit governing the 
                                // transmission of duplex mode,speed
                                // link up/down to PHY in RGMII

input           sct_duplexmode; // If 1 full-duplex.
                                  // 0 => Gig mode ; 1 => 10/100 mode

output          rgmii_tctl_o;   // RGMII transmit control.
output [3:0]    rgmii_txd_o;    // RGMII transmit data.

input  [3:0]    rgmii_rxd_i;    // RGMII receive data.
input           rgmii_rctl_i;   // RGMII receive control.

output [7:0]    gmii_rxd;      // GMII receive data.
output          gmii_rxer;     // GMII receive error.
output          gmii_rxdv;     // GMII receive data valid.
output          gmii_crs;      // GMII carrier sense.
output          gmii_col;      // GMII collision.

output          link_status;   // PHY link status (1= UP; 0= DOWN).
output [1:0]    link_speed;    // PHY link speed (00= 2.5Mhz; 01= 25 MHz; 10= 125 MHz)
output          link_mode;     // PHY link mode (0= HD; 1= FD).

wire            gmrt_crs ;     // CRS signal for transmit side

DWC_gmac_rgmii_gmrt
  DWC_gmac_rgmii_gmrt_inst(
  .rst_clk_tx_n      ( rst_clk_tx_n ),
  .clk_tx_i          ( clk_tx_i ),
  .clk_tx_180_i      ( clk_tx_180_i ),
  .rst_clk_tx_180_n  ( rst_clk_tx_180_n ),

  .sct_portselect    ( sct_portselect ),
  .sct_speed         ( sct_speed ),
  .sct_link_up       ( sct_link_up ),
  .sct_tx_config     ( sct_tx_config ),
  .sct_duplexmode    ( sct_duplexmode ),

  .gmii_txen         ( gmii_txen ),
  .gmii_txer         ( gmii_txer ),
  .gmii_txd          ( gmii_txd ),

  .gmrt_crs          ( gmrt_crs ),

  .rgmii_tctl_o      ( rgmii_tctl_o ),
  .rgmii_txd_o       ( rgmii_txd_o )
 );


DWC_gmac_rgmii_gmrr
 DWC_gmac_rgmii_gmrr_inst (
  .rst_clk_rx_n(rst_clk_rx_n),
                                              .clk_rx_i(clk_rx_i),
                                              .rst_clk_rx_180_n(rst_clk_rx_180_n),
                                              .clk_rx_180_i(clk_rx_180_i),
                                              .gmrt_crs(gmrt_crs),
                                              .rgmii_rxd_i(rgmii_rxd_i),
                                              .rgmii_rctl_i(rgmii_rctl_i),
                                              .gmii_rxd(gmii_rxd),
                                              .gmii_rxdv(gmii_rxdv),
                                              .gmii_rxer(gmii_rxer),
                                              .gmii_crs(gmii_crs),           
                                              .gmii_col(gmii_col),
                                              .link_status(link_status),
                                              .link_speed(link_speed),
                                              .link_mode(link_mode)
                                              );

endmodule

///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//                        End of file "rgmii.v"                               //
//                                                                           //
//////////////////////////////////////////////////////////////////////////////
