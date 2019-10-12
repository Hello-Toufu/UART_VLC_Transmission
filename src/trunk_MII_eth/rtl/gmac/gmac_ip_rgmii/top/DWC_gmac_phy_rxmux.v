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
// GMAC PHY receive Multiplexer(DWC_gmac_phy_rxmux.v)
//
// DESCRIPTIO:
// This module multiplexes the receive data and receive control signals from
// different PHY Interface blocks (RGMII,SGMII,TBI,RMII,SMII) or from PHY 
// onto the GMII receive interface.
//--------------------------------------------------------------------------

module DWC_gmac_phy_rxmux (
         
                           phy_select,
                           // RGMII Interface
                           rgmii_rxd,
                           rgmii_rxdv,
                           rgmii_rxer,
                           rgmii_crs,
                           rgmii_col,
                           rgmii_rxd_o,
                           rgmii_rctl_o,
                           // PHY receive Interface.
                           phy_rxd_i,
                           phy_rxdv_i,
                           phy_rxer_i,
                           phy_crs_i,
                           phy_col_i,
                           // RGMII or SGMII or SMII status
                           phy_intf_sts,
                           sca_rgmii_status,
                           // GMII Interface.
                           gmii_rxd,
                           gmii_rxdv,
                           gmii_rxer,
                           gmii_crs,
                           gmii_col
                           );        
        
 // Input and output declarations       
        
    input  [2:0]     phy_select;             // PHY Interface select signal.    

    // GMII interface of RGMII module
    input  [7:0]     rgmii_rxd;              // RGMII Block Receive data          
    input            rgmii_rxdv;             // RGMII Block receive data valid.
    input            rgmii_rxer;             // RGMII Block receive error.
    input            rgmii_crs;              // RGMII Block carrier sense.
    input            rgmii_col;              // RGMII Block collision detect.

    input  [3:0]     sca_rgmii_status;       // RGMII status from SYNC block. 
    output [3:0]     rgmii_rxd_o;            // RGMII Receive Data.
    output           rgmii_rctl_o;           // RGMII signal acts as phy_rxdv_i at
                                             // rise edge of clk_rgmii_rxc_o and
                                             // acts as a logical derivative of 
                                             // phy_rxdv_i and phy_rxer_i at the fall edge
                                             // of clk_rgmii_rxc_o.

    // GMII interface of SGMII module

     
  
    // GMII interface of PCS module

  

    // MII interface of RMII module


    

  // PHY Interface 
  input            phy_rxdv_i;             // Receive data valid signal - GMII/MII.
                                           // 9th bit of receive code group - TBI/SGMII.
                                           // rctl bit of RGMII
                                           // crs_dv in RMII
                                           // rxsync in SMII
  input            phy_rxer_i;             // Receive error-GMII/MII.
                                           // 10th bit of receive code group - TBI/SGMII.
  input  [`RXD_IOW-1:0] phy_rxd_i;         // Receive Data [7:0] in GMII/TBI/SGMII.
                                           // Receive Data [3:0] in RGMII/RTBI/MII.
                                           // Receive Data [1:0] in RMII.
                                           // Receive Data [0]   in SMII.
  input            phy_crs_i;              // Carrier Sense in GMII/MII
                                           // com_det_i in TBI/SGMII
  input            phy_col_i;              // Collision Detect in GMII/MII.

  
  // GMII Interface.
  output [`RXD_WIDTH-1:0] gmii_rxd;          // Receive data to GMII Block.  
  output             gmii_rxdv;              // receive data valid to GMII Block .
  output             gmii_rxer;              // receive error to GMII Block. 
  output             gmii_crs;               // carrier sense to GMII Block. 
  output             gmii_col;               // collision detect to GMII Block. 
  
  // RGMII or SGMII or SMII status                 
  output [5:0]       phy_intf_sts;           // RGMII or SGMII or SMII status to CSR.
  
// Internal reg declarations.
  reg  [`RXD_WIDTH-1:0] gmii_rxd;         // Receive data to GMII Block.  
  reg             gmii_rxdv;              // receive data valid to GMII Block .
  reg             gmii_rxer;              // receive error to GMII Block. 
  reg             gmii_crs;               // carrier sense to GMII Block. 
  reg             gmii_col;               // collision detect to GMII Block. 
  
       
// MAC Receive Engine Instance
  always @(*)
  begin
    case (phy_select) 
      3'b001: begin
        gmii_rxd  = rgmii_rxd;
        gmii_rxdv = rgmii_rxdv;
        gmii_rxer = rgmii_rxer;
        gmii_crs  = rgmii_crs;
        gmii_col  = rgmii_col;
      end 
      default: begin
        gmii_rxd  = phy_rxd_i;
        gmii_rxdv = phy_rxdv_i;
        gmii_rxer = phy_rxer_i;
        gmii_crs  = phy_crs_i;
        gmii_col  = phy_col_i;
      end
    endcase
  end

  // PHY Interface module input signals
  // RGMII Interface signals
  assign rgmii_rctl_o = phy_rxdv_i;
  assign rgmii_rxd_o  = phy_rxd_i[3:0];
      

// RGMII status
  assign phy_intf_sts = {{2{`L}},sca_rgmii_status};


endmodule
