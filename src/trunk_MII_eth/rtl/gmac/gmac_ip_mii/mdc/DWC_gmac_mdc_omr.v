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
// File Version     :        $Revision: #16 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// DWC_gmac_mdc_omr (DWC_gmac_mdc_omr.v)
//
// DESCRIPTION:
// GMAC DMA/MTL Operational Mode Register (OMR)
// This module has Operational Mode Register which controls the DMA & MTL.
//--------------------------------------------------------------------------

module DWC_gmac_mdc_omr (
    
  // Input Clock & Reset
  clk_csr_i,
                         rst_clk_csr_n,
                         // Inputs from AHB Slave
                         mci_val_i,
                         mci_addr_i,
                         mci_rd_wrn_i,
                         mci_wdata_i,
                         mci_be_i,
                         // Output to DCR
                         omr_data,
                         // Input from GMAC core
                         mci_ack_i,
                         // Input from MTL after being synced to CSR clock
                         csr_txfifoflush_clr,
                         // Outputs to MTL
                         omr_wr_byte0_o,
                         omr_wr_byte1_o,
                         omr_wr_byte2_o,
                         omr_mtl_ctrl_o
                         );

// ---------------------------------------------
// Port Declarations. ----------------------------------------
// ---------------------------------------------
  // Clock and Reset Signals.
  input  clk_csr_i;     // CSR clock input.
  input  rst_clk_csr_n; // synchronous reset to clk_csr_i

  // Inputs from AHB Slave
  input         mci_val_i;    // Asserted when CSR is accessed.
  input [11:0]  mci_addr_i;   // Register address of the CSR module.
  input         mci_rd_wrn_i; // 1 - Read operation, 0 - Write operation.
  input [31:0]  mci_wdata_i;  // Write data for registers
  input [3:0]   mci_be_i;     // Byte Enables for mci_wdata

  // Outputs to AHB Slave
  output [31:0] omr_data; // Read data to DCR

  // Input from GMAC Core CSR
  input  mci_ack_i;  // Ack to AHS for data transfer from CSR. Note that DCR 
                     // doesnt provide an ACK. However it uses the ACK input
                     // to ensure that only one read/write occurs incase
                     // ack is delayed.

  // Inputs from MTL via sync block
  input  csr_txfifoflush_clr; // Tx Fifo Flush Completed/Clear

  // Inputs from DTX via sync block

  // Outputs to DTX (will be passed thru sync block)

  // Outputs to DRX (will be passed thru sync block)

  // Outputs to MTL
  output [17:0] omr_mtl_ctrl_o; //Operation mode register fields that control the MTL
  output        omr_wr_byte0_o; //Operation mode reg byte0(LSB) is written
  output        omr_wr_byte1_o; //Operation mode reg byte1 is written
  output        omr_wr_byte2_o; //Operation mode reg byte2 is written

// ---------------------------------------------
// Output Port Wire Declarations. ----------------------------------------
// ---------------------------------------------
  wire   [17:0] omr_mtl_ctrl_o;
  wire          omr_wr_byte0_o;
  wire          omr_wr_byte1_o;
  wire          omr_wr_byte2_o;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------
  reg       omr_addressed; //Set when mci_addr_i is omr_address
  reg       rx_str_n_fwd; //Receive Store & Forward
  reg       tx_str_n_fwd; //Transmit Store & Forward
  reg       txfifoflush; //Tx Fifo Flush
  reg [2:0] txthreshctrl; //Transmit Threshold control
  reg       thresh_deact_u; // MSB of Flowcontrol De-active Threshold
  reg       thresh_act_u;   // MSB of Flowcontrol active Threshold
  reg       hwfloctrl_e;    // Hardware Flowcontrol Enable
  reg [1:0] thresh_deact_l; // LSB of Flowcontrol De-active Threshold
  reg [1:0] thresh_act_l;   // LSB of Flowcontrol active Threshold
  reg       filtererr_frame; //Filter Error Frames
  reg       fwd_runt_e; //Forward Good Runt Frames
  reg [1:0] rxthreshctrl; //Rx Threshold Control

// ---------------------------------------------
// Internal Wire Declarations. ----------------------------------------
// ---------------------------------------------
  wire write_e;//Write enable
  wire  [31:0]  omr_data;//Operation Mode Register Value
  wire      dont_drop_ipc_err_frames; // Dont Filter Error Frames that have only Checksum Errors.


// ---------------------------------------------
// Write enable signals & Read enable signals
// ---------------------------------------------

  // OMR is addressed then this signal is asserted
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      omr_addressed <= 1'b0;
    else
      if (mci_val_i & mci_addr_i == 12'h406)
        omr_addressed <= 1'b1;
      else
        omr_addressed <= 1'b0;

  assign write_e = mci_ack_i & !mci_rd_wrn_i & omr_addressed;

  assign omr_wr_byte0_o = write_e & mci_be_i[0]; //Write enable for 0th byte
  assign omr_wr_byte1_o = write_e & mci_be_i[1]; //Write enable for 1st byte
  assign omr_wr_byte2_o = write_e & mci_be_i[2]; //Write enable for 2nd byte

// ---------------------------------------------
// Control Signals to MTL
// ---------------------------------------------
  assign omr_mtl_ctrl_o = {dont_drop_ipc_err_frames,rx_str_n_fwd,thresh_act_u,thresh_deact_u, 
                           tx_str_n_fwd,txfifoflush,txthreshctrl,thresh_deact_l,
                           thresh_act_l,hwfloctrl_e, filtererr_frame,fwd_runt_e,rxthreshctrl};

// ---------------------------------------------------------------------
// Operation Mode Register
// ---------------------------------------------------------------------
  assign omr_data = {1'b0,4'h0,dont_drop_ipc_err_frames,rx_str_n_fwd,1'b0,
                     thresh_act_u,thresh_deact_u,tx_str_n_fwd,txfifoflush,3'b000,
                     txthreshctrl,1'b0,thresh_deact_l,thresh_act_l,hwfloctrl_e, 
                     filtererr_frame,fwd_runt_e,1'b0,rxthreshctrl,3'b000};


  // This register bit is reserved
  assign dont_drop_ipc_err_frames = 1'b0;


  // Transmit Store & Forward Mode
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      //20170705-twu: enable the store-and-forward mode
      //rx_str_n_fwd <= 1'b0;
      rx_str_n_fwd <= 1'b1;
    else
      if (write_e & mci_be_i[3])
        rx_str_n_fwd <= mci_wdata_i[25];


  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) begin
      thresh_act_u    <= 1'b0;
      thresh_deact_u  <= 1'b0;
    end
    else
      if (omr_wr_byte2_o) begin                   
        thresh_act_u    <= mci_wdata_i[23];              
        thresh_deact_u  <= mci_wdata_i[22]; 
      end

  // Transmit Store & Forward Mode
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      //20170705-twu: enable the store-and-forward mode
      //tx_str_n_fwd <= 1'b0;
      tx_str_n_fwd <= 1'b1;
    else
      if (omr_wr_byte2_o)
        tx_str_n_fwd <= mci_wdata_i[21];

  // Tx Fifo Flush
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      txfifoflush <= 1'b0;
    else
      if (csr_txfifoflush_clr) //Clearing has to have priority 
        txfifoflush <= 1'b0;     //as per MTL requirements.
      else
        if (omr_wr_byte2_o & mci_wdata_i[20])
          txfifoflush <= 1'b1;

  // Transmit Threshold Control
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      txthreshctrl <= 3'b000;
    else begin
      if (omr_wr_byte2_o)
        txthreshctrl[2] <= mci_wdata_i[16];
      if (omr_wr_byte1_o)
        txthreshctrl[1:0] <= mci_wdata_i[15:14];
    end


  // Flow Control De-activate Threshold
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      thresh_deact_l  <= 2'b00;
    else 
      if (omr_wr_byte1_o)
        thresh_deact_l  <= mci_wdata_i[12:11];

  // Flow Control activate Threshold
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n) 
      thresh_act_l  <= 2'b00;
    else 
      if (omr_wr_byte1_o)
        thresh_act_l  <= mci_wdata_i[10:9];

  // Hardware Flow Control Enable
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      hwfloctrl_e <= 1'b0;
    else
      if (omr_wr_byte1_o)
        hwfloctrl_e <= mci_wdata_i[8];

  // Filter Error Frames
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      filtererr_frame <= 1'b0;
    else
      if (omr_wr_byte0_o)
        filtererr_frame <= mci_wdata_i[7];

  // Forward Good Runt Frames
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      fwd_runt_e <= 1'b0;
    else
      if (omr_wr_byte0_o)
        fwd_runt_e <= mci_wdata_i[6];

  // Receive Threshold Control
  always @(`CSR_RST_MODE)
    if (!rst_clk_csr_n)
      rxthreshctrl <= 2'b00;
    else
      if (omr_wr_byte0_o)
        rxthreshctrl <= mci_wdata_i[4:3];
          
// ---------------------------------------------------------------------



// ---------------------------------------------
// Assertions ------------------------------------
// ---------------------------------------------

endmodule
