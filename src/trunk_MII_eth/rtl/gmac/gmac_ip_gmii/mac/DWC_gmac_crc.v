//------------------------------------------------------------------------
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
// File Version     :        $Revision: #8 $
//--                                                                        
//--------------------------------------------------------------------------
//--  The entire notice above must be reproduced on all authorized copies.
// MODULE:
// CRC Generator/Checker (DWC_gmac_crc.v)
//
// DESCRIPTION:
// This module generates a 32 bit CRC for the 8-bit data and also indicates
// if there was a CRC match.
//--------------------------------------------------------------------------

module DWC_gmac_crc (
  clk_crc_i,
  rst_clk_crc_n,
  data,
  data_valid,
  reset_crc,
  crc_match,
  dacrc,
  crc
  );

  input                          clk_crc_i;         // 2.5/25/125 MHz Rx clock.
  input                          rst_clk_crc_n;     // Sync reset.
  input [7:0]                    data;              // Data for crc computation.
  input                          data_valid;        // Data enable.
  input                          reset_crc;         // Reset crc.
  output [5:0]                   dacrc;             // Calculated DA CRC (6 MSB).
  output                         crc_match;         // Indicates if there is a CRC match
  output [31:0]                  crc;               // Output of CRC reg.

  // Register and wire declarations.
  reg  [31:0]  crc_reg;                             // Stores the partially computed CRC.
  wire [31:0]  next_crc;                            // Combinatorial next CRC generation
  wire [5:0]   dacrc;                               
  wire crc_match;   

  // Register tp store the current calculated next CRC.
    always @(posedge clk_crc_i or negedge rst_clk_crc_n) begin

    if (!rst_clk_crc_n) begin
      crc_reg <= 32'hFFFFFFFF;
    end
    else
      if (reset_crc) begin
        crc_reg <= 32'hFFFFFFFF;
      end
      else if (data_valid) begin
        crc_reg <= next_crc;
      end
  end

// Combinatorial next CRC generation

  assign next_crc[0]  = crc_reg[30] ^ data[1] ^ crc_reg[24] ^ data[7]; 

  assign next_crc[1]  = data[6] ^ data[7] ^ data[0] ^ crc_reg[30] ^ 
                        crc_reg[31] ^ data[1] ^ crc_reg[24] ^ crc_reg[25];

  assign next_crc[2]  = crc_reg[26] ^ data[5] ^ data[6] ^ data[7] ^
                        crc_reg[30] ^ data[0] ^ data[1] ^ crc_reg[31] ^
                        crc_reg[24] ^ crc_reg[25]; 

  assign next_crc[3]  = data[4] ^ crc_reg[26] ^ data[5] ^ crc_reg[27] ^
                        data[6] ^ data[0] ^ crc_reg[31] ^ crc_reg[25];

  assign next_crc[4]  = data[4] ^ crc_reg[26] ^ data[5] ^ crc_reg[27] ^
                        crc_reg[28] ^ data[7] ^ crc_reg[30] ^ data[1] ^
                        crc_reg[24] ^ data[3];

  assign next_crc[5]  = data[4] ^ crc_reg[27] ^ data[6] ^ crc_reg[28] ^
                        data[7] ^ crc_reg[29] ^ crc_reg[30] ^ data[0] ^ data[1] ^
                        crc_reg[31] ^ data[2] ^ crc_reg[24] ^ data[3] ^
                        crc_reg[25];

  assign next_crc[6]  = crc_reg[26] ^ data[5] ^ data[6] ^ crc_reg[28] ^
                        crc_reg[29] ^ data[0] ^ crc_reg[30] ^ crc_reg[31] ^
                        data[1] ^ data[2] ^ data[3] ^ crc_reg[25];

  assign next_crc[7]  = data[4] ^ crc_reg[26] ^ data[5] ^ crc_reg[27] ^
                        data[7] ^ crc_reg[29] ^ data[0] ^ crc_reg[31] ^
                        data[2] ^ crc_reg[24];

  assign next_crc[8]  = data[4] ^ crc_reg[27] ^ data[6] ^ crc_reg[28] ^
                        data[7] ^ crc_reg[24] ^ crc_reg[0]  ^ data[3] ^
                        crc_reg[25];

  assign next_crc[9]  = crc_reg[26] ^ data[5] ^ data[6] ^ crc_reg[28] ^
                        crc_reg[29] ^ data[2] ^ data[3] ^ crc_reg[25] ^
                        crc_reg[1];

  assign next_crc[10] = data[4] ^ crc_reg[26] ^ crc_reg[2]  ^ data[5] ^
                        crc_reg[27] ^ data[7] ^ crc_reg[29] ^ data[2] ^
                        crc_reg[24];

  assign next_crc[11] = data[4] ^ crc_reg[27] ^ data[6] ^ crc_reg[3] ^
                        crc_reg[28] ^ data[7] ^ crc_reg[24] ^ data[3] ^
                        crc_reg[25];

  assign next_crc[12] = crc_reg[26] ^ data[5] ^ data[6] ^ crc_reg[28] ^
                        data[7] ^ crc_reg[4]  ^ crc_reg[29] ^ crc_reg[30] ^
                        data[1] ^ data[2] ^ crc_reg[24] ^ data[3] ^
                        crc_reg[25];

  assign next_crc[13] = data[4] ^ crc_reg[26] ^ data[5] ^ crc_reg[27] ^
                        data[6] ^ crc_reg[29] ^ data[0] ^ crc_reg[30] ^
                        crc_reg[5]  ^ crc_reg[31] ^ data[1] ^ data[2] ^
                        crc_reg[25];

  assign next_crc[14] = data[4] ^ crc_reg[26] ^ data[5] ^ crc_reg[27] ^
                        crc_reg[28] ^ crc_reg[30] ^ data[0] ^ data[1] ^
                        crc_reg[31] ^ crc_reg[6]  ^ data[3];

  assign next_crc[15] = data[4] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[29] ^
                        data[0] ^ crc_reg[31] ^ data[2] ^ crc_reg[7] ^
                        data[3];

  assign next_crc[16] = crc_reg[28] ^ data[7] ^ crc_reg[29] ^ data[2] ^
                        crc_reg[24] ^ data[3] ^ crc_reg[8];

  assign next_crc[17] = crc_reg[9]  ^ data[6] ^ crc_reg[29] ^ crc_reg[30] ^
                        data[1] ^ data[2] ^ crc_reg[25];

  assign next_crc[18] = crc_reg[26] ^ data[5] ^ crc_reg[10] ^ crc_reg[30] ^
                        data[0] ^ data[1] ^ crc_reg[31];

  assign next_crc[19] = data[4] ^ crc_reg[27] ^ crc_reg[11] ^ data[0] ^
                        crc_reg[31];

  assign next_crc[20] = crc_reg[28] ^ crc_reg[12] ^ data[3];

  assign next_crc[21] = crc_reg[29] ^ crc_reg[13] ^ data[2];

  assign next_crc[22] = data[7] ^ crc_reg[14] ^ crc_reg[24];

  assign next_crc[23] = data[6] ^ data[7] ^ crc_reg[30] ^ data[1] ^
                        crc_reg[15] ^ crc_reg[24] ^ crc_reg[25];

  assign next_crc[24] = crc_reg[26] ^ data[5] ^ data[6] ^ data[0] ^
                        crc_reg[31] ^ crc_reg[16] ^ crc_reg[25];

  assign next_crc[25] = data[4] ^ crc_reg[17] ^ crc_reg[26] ^ data[5] ^
                        crc_reg[27];

  assign next_crc[26] = data[4] ^ crc_reg[18] ^ crc_reg[27] ^ crc_reg[28] ^
                        data[7] ^ crc_reg[30] ^ data[1] ^ crc_reg[24] ^
                        data[3];

  assign next_crc[27] = data[6] ^ crc_reg[19] ^ crc_reg[28] ^ crc_reg[29] ^
                        data[0] ^ crc_reg[31] ^ data[2] ^ data[3] ^
                        crc_reg[25];

  assign next_crc[28] = crc_reg[26] ^ data[5] ^ crc_reg[20] ^ crc_reg[29] ^
                        crc_reg[30] ^ data[1] ^ data[2];

  assign next_crc[29] = data[4] ^ crc_reg[27] ^ crc_reg[21] ^ crc_reg[30] ^
                        data[0] ^ data[1] ^ crc_reg[31];

  assign next_crc[30] = crc_reg[28] ^ data[0] ^ crc_reg[22] ^ crc_reg[31] ^
                        data[3];

  assign next_crc[31] = crc_reg[29] ^ crc_reg[23] ^ data[2];

// CRC for Address filter block

assign dacrc = ~crc_reg[31:26];

// CRC match for RPE status

assign crc_match = (crc_reg == 32'hc704dd7b);

// CRC data used during transmission
assign crc = ~{crc_reg[0], crc_reg[1], crc_reg[2], crc_reg[3], crc_reg[4], crc_reg[5],
              crc_reg[6], crc_reg[7], crc_reg[8], crc_reg[9], crc_reg[10], crc_reg[11],
              crc_reg[12], crc_reg[13], crc_reg[14], crc_reg[15], crc_reg[16], crc_reg[17],
              crc_reg[18], crc_reg[19], crc_reg[20], crc_reg[21], crc_reg[22], crc_reg[23],
              crc_reg[24], crc_reg[25], crc_reg[26], crc_reg[27], crc_reg[28], crc_reg[29],
              crc_reg[30], crc_reg[31]};

endmodule
