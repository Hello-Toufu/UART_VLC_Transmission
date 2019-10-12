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
                           sct_portselect,
                           // GMII/MII Interface.
                           gmii_txen_i,
                           gmii_txer_i,
                           gmii_txd_i,
                           // PHY Interface.
                           phy_txen_o,
                           phy_txer_o,
                           phy_txd_o
                           );
        
// Input and output declarations.
  
  // Selection Inputs.
                                         // CSR clock.

  input            sct_portselect;       // Port select 1- MII, 0 -GMII. 

  // GMII/MII Interface.
  input            gmii_txen_i;          // GMII Transmit data Enable.
  input            gmii_txer_i;          // GMII Transmit Error.
  input  [`TXD_WIDTH-1:0] gmii_txd_i;    // GMII Transmit Data.
  
  // RGMII Interface.

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






  assign phy_txer_o  = gmii_txer_i;
  assign phy_txen_o  = gmii_txen_i;
  assign phy_txd_o   = gmii_txd_i;

  
  


endmodule 
