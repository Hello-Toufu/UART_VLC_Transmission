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
// Date             :        $Date: 2007/11/09 $
// File Version     :        $Revision: #18 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// dwc_gmac_mrc_rbu (dwc_gmac_mrc_rbu.v)
//
// DESCRIPTION:
// GMAC Receive Bus Unit (RBU)
// This unit performs the Endian conversion and also converting the data 
// into 64-bit or 128-bit depending on the interface selected.
//--------------------------------------------------------------------------

module DWC_gmac_mrc_rbu (

       clk_rx_i,
                         rst_clk_rx_n,
                         // Inputs from RFC 
                         rfc_data,
                         rfc_be,
                         rfc_data_valid,
                         rfc_sof,
                         rfc_eof,
                         rfc_status,
                         // Outputs to MTL
                         mri_data_o,
                         mri_be_o,
                         mri_val_o,
                         mri_sof_o,
                         mri_eof_o,
                         mri_status_o
                         );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

input                       clk_rx_i;       // Rx clock
input                       rst_clk_rx_n;   // Reset sync. to Rx clock
input [31:0]                rfc_data;       // 32-bit data from RFC block
input [3:0]                 rfc_be;         // Byte-enables for the RFC data
input                       rfc_data_valid; // valid signal for RFC data
input                       rfc_sof;        // start of frame indication from RFC
input                       rfc_eof;        // end of frame indication from RFC
input [`CORE_STATUS_WIDTH-1:0] rfc_status;     // status from rfc valid with EOF

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

output [`DATAWIDTH -1:0]    mri_data_o;    // data out to MTL (32, 64 or 128 bytes)
output [`DATAWIDTH/64 +1:0] mri_be_o;      // encoded byte enables for data
output                      mri_val_o;     // data valid signal to MTL
output                      mri_sof_o;     // start of frame indication to MTL
output                      mri_eof_o;     // end of frame indication to MTL
output [`CORE_STATUS_WIDTH-1:0] mri_status_o;  // status output to MTL, valid with mri_eof_o

// ---------------------------------------------
// Output Port Register Declarations. ----------------------------------------
// ---------------------------------------------

reg [`DATAWIDTH/64 +1:0]    mri_be_o;
reg                         mri_val_o;
reg                         mri_sof_o;
reg                         mri_eof_o;
reg [`CORE_STATUS_WIDTH-1:0] mri_status_o;

// ---------------------------------------------
// Internal Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire [`DATAWIDTH - 1:0]    mri_data_o;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------

reg [1:0]                   byte_encode; // Encoded byte enable from RFC
reg [`DATAWIDTH -1:0]       data;        // 128-bit data output


// ---------------------------------------------
// Combinational statements. Data Alignment Block-----------------------
// ---------------------------------------------
// This block aligns the data according to the output bus width. The output can
// be 32, 64 or 128-bits wide

  assign mri_data_o = data;

// ---------------------------------------------
// Registered statements. Data Alignment Block-----------------------
// ---------------------------------------------






always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    data <= {32{`L}};
  else if (rfc_data_valid)
    data <= rfc_data;
end 


// ---------------------------------------------
// Combinational statements. Output Logic Block-----------------------
// ---------------------------------------------
// This block gives out rest of the output signals other than data

always @(rfc_be)
begin
  if (rfc_be == 4'b0001) 
    byte_encode = 2'b00;
  else if (rfc_be == 4'b0011)
    byte_encode = 2'b01;
  else if (rfc_be == 4'b0111)
    byte_encode = 2'b10;
  else
    byte_encode = 2'b11;
end

// ---------------------------------------------
// Registered statements. Output Logic Block-----------------------
// ---------------------------------------------


always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    mri_be_o <= 2'b00;
  else if (rfc_eof & rfc_data_valid)
    mri_be_o <= byte_encode;
  else
    mri_be_o <= 2'b11;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    mri_val_o <= `L;
  else 
    mri_val_o <= rfc_data_valid;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    mri_sof_o <= `L;
  else 
    mri_sof_o <= rfc_sof & rfc_data_valid;
end


always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    mri_eof_o <= `L;
  else
    mri_eof_o <= rfc_eof & rfc_data_valid;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    mri_status_o <= {`CORE_STATUS_WIDTH{`L}};
  else if (rfc_eof & rfc_data_valid)
    mri_status_o <= rfc_status;
end

endmodule
