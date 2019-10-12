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
// File Version     :        $Revision: #13 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// GMAC PHY Interface Multiplexer(DWC_gmac_phy_txmux.v)
//
// DESCRIPTION:
// GMAC PHY Interface Multiplexer selects one of the PHY Interface among
// the various available interfaces on GMAC. Interface selection happens
// during hardware reset.
//---------------------------------------------------------------------------

module DWC_gmac_phy_txmux (

        // Selection Inputs.
                           clk_csr_i,
                           rst_clk_csr_n,
                           sct_portselect,
                           phy_intf_sel_i,
                           phy_select,
                           // GMII/MII Interface.
                           gmii_txen_i,
                           gmii_txer_i,
                           gmii_txd_i,
                           // RGMII Interface.
                           rgmii_txd_i,
                           rgmii_tctl_i,
                           // PHY Interface.
                           phy_txen_o,
                           phy_txer_o,
                           phy_txd_o
                           );
        
// Input and output declarations.
  
  // Selection Inputs.
  input            clk_csr_i;            // CSR clock.
  input            rst_clk_csr_n;        // Active Low reset synchronous to 
                                         // CSR clock.

  input            sct_portselect;       // Port select 1- MII, 0 -GMII. 
  input  [2:0]     phy_intf_sel_i;       // PHY Interface select signal.
  output [2:0]     phy_select;           // Selected PHY Interface after reset.

  // GMII/MII Interface.
  input            gmii_txen_i;          // GMII Transmit data Enable.
  input            gmii_txer_i;          // GMII Transmit Error.
  input  [`TXD_WIDTH-1:0] gmii_txd_i;    // GMII Transmit Data.
  
  // RGMII Interface.
  input  [3:0]   rgmii_txd_i;          // RGMII Transmit Data.
  input          rgmii_tctl_i;         // RGMII signal acts as phy_txen at
                                       // rise edge of clk_rgmii_txc_i and
                                       // acts as a logical derivative of 
                                       // phy_txen_o and phy_txer_o at the fall edge
                                       // of clk_rgmii_txc_i.

  // SGM Interface.


  // RMII Interface.

  // SMII Interface.  

  // PCS interface
  
  // PHY Interface.
                                         
  output           phy_txen_o;           // Transmit data Enable - GMII/RGMII/RMII, 
                                         // 9th bit of trasnmit code group - TBI/SGMII.
                                         // Global SYNC signal - SMII
  
  output           phy_txer_o;           // Transmit Error - GMII.
                                         // 10th bit of transmit code group - TBI/SGMII
                                         
  output [`TXD_IOW-1:0] phy_txd_o;       // Transmit Data[7:0] - GMII/TBI/SGMII
                                         // Transmit Data[3:0] - RGMII/RTBI/MII.
                                         // Transmit Data[1:0] - RMII.
                                         // Transmit Data[0]   - SMII.
  
// Internal Reg ,wire declarations.

  reg  [2:0]       phy_select_reg;       // PHY Interface selected at reset.
  reg              phy_txen_o;           // Transmit data Enable - GMII/RGMII/RMII, 
                                         // 9th bit of trasnmit code group - TBI/SGMII.
                                         // Global SYNC signal - SMII

  reg              phy_txer_o;           // Transmit Error - GMII.
                                         // 10th bit of transmit code group - TBI/SGMII
                                         
  reg [`TXD_IOW-1:0] phy_txd_o;          // Transmit Data[7:0] - GMII/TBI/SGMII
                                         // Transmit Data[3:0] - RGMII/RTBI/MII.
                                         // Transmit Data[1:0] - RMII.
                                         // Transmit Data[0]   - SMII.
  reg              loaded_physel;        // to indicate that phy_intf_sel_i has been registered



// Register the Selection input on reset.
  always @(`CSR_RST_MODE)
  begin
    if (~rst_clk_csr_n) begin 
      phy_select_reg <= 3'b000;
      loaded_physel <= `L;
    end
    else
      if (!loaded_physel) begin
        phy_select_reg <= phy_intf_sel_i;
        loaded_physel <= `H;
      end
  end

  assign phy_select = (loaded_physel) ? phy_select_reg : phy_intf_sel_i;

  
// phy_tx signal gen
  always @(*)
  begin
    case (phy_select)
        3'b001: begin
          phy_txer_o  = `L;
          phy_txen_o  = rgmii_tctl_i;
          phy_txd_o   = {4'b0000,rgmii_txd_i};
        end
      default: begin
        phy_txer_o  = gmii_txer_i;
        phy_txen_o  = gmii_txen_i;
        phy_txd_o   = gmii_txd_i;
      end  
    endcase
  end
  


endmodule 
