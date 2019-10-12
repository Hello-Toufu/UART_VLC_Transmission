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
         
                           // PHY receive Interface.
                           phy_rxd_i,
                           phy_rxdv_i,
                           phy_rxer_i,
                           phy_crs_i,
                           phy_col_i,
                           // GMII Interface.
                           gmii_rxd,
                           gmii_rxdv,
                           gmii_rxer,
                           gmii_crs,
                           gmii_col
                           );        
        
 // Input and output declarations       
        

    // GMII interface of RGMII module


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
  
  
  assign gmii_rxd  = phy_rxd_i;
  assign gmii_rxdv = phy_rxdv_i;
  assign gmii_rxer = phy_rxer_i;
  assign gmii_crs  = phy_crs_i;
  assign gmii_col  = phy_col_i;

       

  // PHY Interface module input signals


endmodule
