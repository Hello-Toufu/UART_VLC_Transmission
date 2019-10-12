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
// GMRT (gmrt.v)
//
// DESCRIPTION:
// RGMII transmit module
// Converts the GMII transmit signals to RGMII output signals
//--------------------------------------------------------------------------

module DWC_gmac_rgmii_gmrt (
              rst_clk_tx_n,
              rst_clk_tx_180_n,
              clk_tx_i,
              clk_tx_180_i,
              gmii_txen,
              gmii_txer,
              gmii_txd,
              sct_portselect,
              sct_speed,
              sct_link_up,
              sct_tx_config,
              sct_duplexmode,
              gmrt_crs,

              rgmii_txd_o,
              rgmii_tctl_o
           );

// -----------------------------------
// Input declarations.----------------
// -----------------------------------
input           rst_clk_tx_n;  // Active low Reset
input           rst_clk_tx_180_n;  // Active low Reset
input           clk_tx_i;     // 2.5/25/125 MHz RGMII Transmit clock.
input           clk_tx_180_i; // Inverted clk_tx_i.

input           gmii_txen;    // GMII transmit enable.
input           gmii_txer;    // GMII transmit error.
input  [7:0]    gmii_txd;     // GMII transmit data.

input           sct_portselect; // Speed selected input from GMAC CSR. 1=1000Mbps 0=10/100Mbps
input           sct_speed;      // If 1 100Mbps else 10Mbps
input           sct_link_up;    // If 1 link is up.
input           sct_tx_config;  // Control bit governing the 
                                // transmission of duplex mode,speed
                                // link up/down to PHY in RGMII

input           sct_duplexmode; // If 1 full-duplex.

// -----------------------------------
// Output declarations.---------------
// -----------------------------------
output          gmrt_crs;       // CRS signalduring transmission
output          rgmii_tctl_o;   // RGMII transmit control.
output [3:0]    rgmii_txd_o;    // RGMII transmit data.

// -----------------------------------
// Reg declarations for outputs.------
// -----------------------------------
reg             rgmii_tctl_o;   // RGMII transmit control.
reg [3:0]       rgmii_txd_o;    // RGMII transmit data.

// -----------------------------------
// Local declarations.----------------
// -----------------------------------
reg         gmrt_crs;          
reg [3:0]   int_txd_neg;      // TXD data latched with neg edge
reg         int_txerr_neg;     // Neg edge TXERR signal

reg         clk_tx_div2;      // Div by 2 clock.
reg         clk_tx_div2_neg;  // Div by 2 clock with neg edge.
reg [7:0]   txd_pos;       // GMII TXD data latched with pos edge
reg         txen_pos;      // GMII TXEN data latched with pos edge
reg         txer_pos;      // GMII TXER data latched with pos edge


wire        mux_select;        // Final Mux select
wire[3:0]   int_txd_pos;
wire        int_tctl_pos;
wire        int_tctl_neg;

wire [7:0]  gmii_txd_int; //gmii_txd and control info are multiplexed onto this bus.

wire        speed_reg;

  assign speed_reg = (sct_portselect) ? sct_speed : 1'b0;
  assign gmii_txd_int = (gmii_txen | gmii_txer | ~sct_tx_config) ? gmii_txd : 
                        {sct_duplexmode,!sct_portselect,speed_reg,sct_link_up,
                         sct_duplexmode,!sct_portselect,speed_reg,sct_link_up};


`ifdef XILINX

FDDRRSE  U_RGMII_TCTL (
    .D0 (gmii_txen),
    .D1 (int_txerr_neg),
    .C0 (clk_tx_i),
    .C1 (clk_tx_180_i),
    .CE (1'b1),
    .R  (1'b0),
    .S  (1'b0),
    .Q  (rgmii_tctl_o)
);

FDDRRSE  U_RGMII_TXD0 (
    .D0 (gmii_txd_int[0]),
    .D1 (int_txd_neg[0]),
    .C0 (clk_tx_i),
    .C1 (clk_tx_180_i),
    .CE (1'b1),
    .R  (1'b0),
    .S  (1'b0),
    .Q  (rgmii_txd_o[0])
);

FDDRRSE  U_RGMII_TXD1 (
    .D0 (gmii_txd_int[1]),
    .D1 (int_txd_neg[1]),
    .C0 (clk_tx_i),
    .C1 (clk_tx_180_i),
    .CE (1'b1),
    .R  (1'b0),
    .S  (1'b0),
    .Q  (rgmii_txd_o[1])
);

FDDRRSE  U_RGMII_TXD2 (
    .D0 (gmii_txd_int[2]),
    .D1 (int_txd_neg[2]),
    .C0 (clk_tx_i),
    .C1 (clk_tx_180_i),
    .CE (1'b1),
    .R  (1'b0),
    .S  (1'b0),
    .Q  (rgmii_txd_o[2])
);

FDDRRSE  U_RGMII_TXD3 (
    .D0 (gmii_txd_int[3]),
    .D1 (int_txd_neg[3]),
    .C0 (clk_tx_i),
    .C1 (clk_tx_180_i),
    .CE (1'b1),
    .R  (1'b0),
    .S  (1'b0),
    .Q  (rgmii_txd_o[3])
);

`endif


  assign mux_select      = clk_tx_div2 ^ clk_tx_div2_neg ;
  // This results in a skewed version of clk_tx_i;
  
  assign int_txd_pos     =  txd_pos[3:0];
  assign int_tctl_pos    =  txen_pos;
  assign int_tctl_neg    =  int_txerr_neg;

     
  always @(mux_select or int_txd_pos or int_tctl_pos or 
           int_txd_neg or int_tctl_neg) begin  // Final Mux selection
     case (mux_select) // synopsys infer_mux
       1'b0: begin
         rgmii_txd_o  = int_txd_neg;
         rgmii_tctl_o = int_tctl_neg;	     
       end  
       1'b1: begin
         rgmii_txd_o  = int_txd_pos;
         rgmii_tctl_o = int_tctl_pos;
       end
     endcase
  end

  always @(`TX_RST_MODE) begin
    if(!rst_clk_tx_n) begin
       gmrt_crs       <= `L;
    end
    else begin
      gmrt_crs   <= txen_pos || 
                    (txer_pos == 1'b1 && txen_pos == 1'b0 &&
                    (txd_pos == 8'h0f || txd_pos == 8'h1f));
     end
  end

  always @(`TX_RST_MODE) begin
    if(!rst_clk_tx_n) begin
      clk_tx_div2  <= `L;
      txd_pos      <= 8'h00;
      txen_pos     <= 1'b0;
      txer_pos     <= 1'b0;
    end
    else begin
      clk_tx_div2    <= !clk_tx_div2;
      txd_pos        <= gmii_txd_int; 
      txen_pos       <= gmii_txen;
      txer_pos       <= gmii_txer;
    end
  end

  always @(`TX_180_RST_MODE) begin
    if(!rst_clk_tx_180_n) begin
      clk_tx_div2_neg <= `L;
      int_txerr_neg    <= `L;
      int_txd_neg      <= 4'h0;
    end
    else begin
      clk_tx_div2_neg <= clk_tx_div2;	
      int_txerr_neg    <= txen_pos ^ txer_pos;
      int_txd_neg     <= txd_pos[7:4]; // For 1 gig port

    end
  end

endmodule

///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//                        End of file "gmrt.v"                                //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
