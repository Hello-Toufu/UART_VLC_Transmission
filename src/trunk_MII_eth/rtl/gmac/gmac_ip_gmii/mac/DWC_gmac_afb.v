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
// File Version     :        $Revision: #12 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// dwc_gmac_afb (dwc_gmac_afb.v)
//
// DESCRIPTION:
// GMAC Address Filter Block (AFB)
// This block filters the source and destination address based on the 
// configuration address registers
//--------------------------------------------------------------------------

module DWC_gmac_afb (

// Inputs from the MRE block 

       clk_rx_i,
                     rst_clk_rx_n,
                     rpe_sof,
                     rpe_eof,
                     rpe_data,
                     rpe_data_valid,
                     crx_dacrc,
                     // Inputs from the CSR block
                     scr_macaddr0,
                     scr_hashtable,
                     scr_disabroadcast,
                     scr_promiscousmode,
                     scr_sainversefilter,
                     scr_dainversefilter,
                     scr_passallmulticast,
                     scr_hashunicast,
                     scr_hashmulticast,
                     scr_hashnperfect_e,
                     // Outputs to FRX, RFC blocks
                     afb_daf_filterfail,
                     afb_daf_filterfail_valid,
                     afb_saf_filterfail,
                     afb_saf_filterfail_valid,
                     afb_rcvbroadcast,
                     afb_rcvmulticast,
                     afb_sa_selected,
                     afb_daf_addr
                     );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

input                              clk_rx_i;       // Rx clock 
input                              rst_clk_rx_n;   // Global rst synchronous to clk_rx_i
input                              rpe_sof;        // Start of frame indication from RPE
input                              rpe_eof;        // End of frame indication from RPE
input [7:0]                        rpe_data;       // Frame data from RPE
input                              rpe_data_valid; // Valid signal for RPE data
input [5:0]                        crx_dacrc;      // CRC calculation for Destination Address
input [47:0]                       scr_macaddr0;   // MAC register 0
input [63:0]                       scr_hashtable;  // Hash table entries 
input                              scr_disabroadcast;   // 1/0 Disable/Enable broadcast frame 
input                              scr_promiscousmode;  // set promiscous mode 
input                              scr_sainversefilter; // set inverse filter for SA
input                              scr_dainversefilter; // set inverse filter for DA
input                              scr_passallmulticast;// pass all multicast frames
input                              scr_hashunicast;     // 1 - hash filter 0 - unicast match
input                              scr_hashmulticast;   // 1 - hash filter 0 - multicast match
input                              scr_hashnperfect_e;  // 1 - Perfect Filter Match Result is ORed
                                                        //     with result of hash filter.
                                                        // 0 - Perfect filter result is ignored if
                                                        //     hash filtering is selected.

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

output                             afb_daf_filterfail;       // DA filter fail signal
output                             afb_daf_filterfail_valid; // Valid for DA filter fail
output                             afb_saf_filterfail;       // SA filter fail signal
output                             afb_saf_filterfail_valid; // Valid for SA filter fail
output                             afb_rcvbroadcast;         // Broadcast frame received
output                             afb_rcvmulticast;         // Multicast frame received
output                             afb_sa_selected;          // Indicates atleast 1 MAC reg. is 
                                                             // selected for SA filtering.
output [4:0]                       afb_daf_addr;             // Indicates which CSR reg matched DA
                                                             // Valid if there is no DA filter fail

// ---------------------------------------------
// Output Port Register Declarations. ----------------------------------------
// ---------------------------------------------

reg [4:0]                          afb_daf_addr;
reg                                afb_rcvbroadcast;
reg                                afb_rcvmulticast;

// ---------------------------------------------
// Output Port Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire                               afb_daf_filterfail;
wire                               afb_saf_filterfail;
wire                               afb_daf_filterfail_valid;
wire                               afb_saf_filterfail_valid;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------

reg [7:0]                          mac0;               // Multiplexed Byte of MAC 0 register
reg                                cmp_mac0;           // Byte-wise comparison of MAC 0 


reg [2:0]                          cntr;                 // To count DA & SA bytes
reg                                da_addr_r;            // registered DA window
reg                                sa_addr_r;            // registered SA window
reg                                daf_filterfail_valid; // DA filter fail valid signal
reg                                saf_filterfail_valid; // SA filter fail valid signal


wire                               hash_bit;                // Hash filter output
wire [31:0]                        perfect_match_addr_en;   // Perfect DA match enable
wire [31:1]                        perfect_match_saaddr_en; // Perfect SA match enable
wire [31:1]                        sa_addr_reg_sel;         // Indicates if the particular reg is 
                                                            // selected for SA
wire                               perfect_match_sa;        // Perfect SA match
wire                               afb_perfect_match_da;    // Perfect DA match
wire                               da_addr;                 // DA window
wire                               addr_valid;              // DA or SA window
wire                               unicast_match;           // Unicast address match
wire                               multicast_match;         // Multicast address match
wire                               daf_filterfail;          // Combinatorial DA filter fail signal
wire                               saf_filterfail;          // Combinatorial SA filter fail signal

// ---------------------------------------------
// Combinational statements. Hash bit Block-----------------------
// ---------------------------------------------
// This block generates the hash bit for Hash only address match

assign hash_bit = scr_hashtable[crx_dacrc];

// ---------------------------------------------
// Combinational statements. Address Mux Logic-----------------------
// ---------------------------------------------
// This block generates logic to select the bytes of the CSR MAC address
// based on the cntr[2:0] signal

always @(*)
begin
  if (cntr == 3'b000) begin
    mac0 = scr_macaddr0[7:0];
  end
  else if (cntr == 3'b001) begin
    mac0 = scr_macaddr0[15:8];
  end
  else if (cntr == 3'b010) begin
    mac0 = scr_macaddr0[23:16];
  end
  else if (cntr == 3'b011) begin
    mac0 = scr_macaddr0[31:24];
  end
  else if (cntr == 3'b100) begin
    mac0 = scr_macaddr0[39:32];
  end
  else begin
    mac0 = scr_macaddr0[47:40];

  end
end

// ---------------------------------------------
// Combinational statements. Compare Logic Block-----------------------
// ---------------------------------------------
// This block generates the address comparison with the source and
// destination address

assign perfect_match_addr_en[0]    = cmp_mac0;


assign perfect_match_addr_en[1]    = `L;
assign sa_addr_reg_sel[1]          = `L;
assign perfect_match_saaddr_en[1]  = `L;


assign perfect_match_addr_en[2]    = `L;
assign sa_addr_reg_sel[2]          = `L;
assign perfect_match_saaddr_en[2]  = `L;


assign perfect_match_addr_en[3]    = `L;
assign sa_addr_reg_sel[3]          = `L;
assign perfect_match_saaddr_en[3]  = `L;


assign perfect_match_addr_en[4]    = `L;
assign sa_addr_reg_sel[4]          = `L;
assign perfect_match_saaddr_en[4]  = `L;


assign perfect_match_addr_en[5]    = `L;
assign sa_addr_reg_sel[5]          = `L;
assign perfect_match_saaddr_en[5]  = `L;


assign perfect_match_addr_en[6]    = `L;
assign sa_addr_reg_sel[6]          = `L;
assign perfect_match_saaddr_en[6]  = `L;


assign perfect_match_addr_en[7]    = `L;
assign sa_addr_reg_sel[7]          = `L;
assign perfect_match_saaddr_en[7]  = `L;


assign perfect_match_addr_en[8]    = `L;
assign sa_addr_reg_sel[8]          = `L;
assign perfect_match_saaddr_en[8]  = `L;


assign perfect_match_addr_en[9]    = `L;
assign sa_addr_reg_sel[9]          = `L;
assign perfect_match_saaddr_en[9]  = `L;


assign perfect_match_addr_en[10]   = `L;
assign sa_addr_reg_sel[10]         = `L;
assign perfect_match_saaddr_en[10] = `L;


assign perfect_match_addr_en[11]   = `L;
assign sa_addr_reg_sel[11]         = `L;
assign perfect_match_saaddr_en[11] = `L;


assign perfect_match_addr_en[12]   = `L;
assign sa_addr_reg_sel[12]         = `L;
assign perfect_match_saaddr_en[12] = `L;


assign perfect_match_addr_en[13]   = `L;
assign sa_addr_reg_sel[13]         = `L;
assign perfect_match_saaddr_en[13] = `L;


assign perfect_match_addr_en[14]   = `L;
assign sa_addr_reg_sel[14]         = `L;
assign perfect_match_saaddr_en[14] = `L;


assign perfect_match_addr_en[15]   = `L;
assign sa_addr_reg_sel[15]         = `L;
assign perfect_match_saaddr_en[15] = `L;


assign perfect_match_addr_en[16]   = `L;
assign sa_addr_reg_sel[16]         = `L;
assign perfect_match_saaddr_en[16] = `L;


assign perfect_match_addr_en[17]   = `L;
assign sa_addr_reg_sel[17]         = `L;
assign perfect_match_saaddr_en[17] = `L;


assign perfect_match_addr_en[18]   = `L;
assign sa_addr_reg_sel[18]         = `L;
assign perfect_match_saaddr_en[18] = `L;


assign perfect_match_addr_en[19]   = `L;
assign sa_addr_reg_sel[19]         = `L;
assign perfect_match_saaddr_en[19] = `L;


assign perfect_match_addr_en[20]   = `L;
assign sa_addr_reg_sel[20]         = `L;
assign perfect_match_saaddr_en[20] = `L;


assign perfect_match_addr_en[21]   = `L;
assign sa_addr_reg_sel[21]         = `L;
assign perfect_match_saaddr_en[21] = `L;


assign perfect_match_addr_en[22]   = `L;
assign sa_addr_reg_sel[22]         = `L;
assign perfect_match_saaddr_en[22] = `L;


assign perfect_match_addr_en[23]   = `L;
assign sa_addr_reg_sel[23]         = `L;
assign perfect_match_saaddr_en[23] = `L;


assign perfect_match_addr_en[24]   = `L;
assign sa_addr_reg_sel[24]         = `L;
assign perfect_match_saaddr_en[24] = `L;


assign perfect_match_addr_en[25]   = `L;
assign sa_addr_reg_sel[25]         = `L;
assign perfect_match_saaddr_en[25] = `L;


assign perfect_match_addr_en[26]   = `L;
assign sa_addr_reg_sel[26]         = `L;
assign perfect_match_saaddr_en[26] = `L;


assign perfect_match_addr_en[27]   = `L;
assign sa_addr_reg_sel[27]         = `L;
assign perfect_match_saaddr_en[27] = `L;


assign perfect_match_addr_en[28]   = `L;
assign sa_addr_reg_sel[28]         = `L;
assign perfect_match_saaddr_en[28] = `L;


assign perfect_match_addr_en[29]   = `L;
assign sa_addr_reg_sel[29]         = `L;
assign perfect_match_saaddr_en[29] = `L;


assign perfect_match_addr_en[30]   = `L;
assign sa_addr_reg_sel[30]         = `L;
assign perfect_match_saaddr_en[30] = `L;


assign perfect_match_addr_en[31]   = `L;
assign sa_addr_reg_sel[31]         = `L;
assign perfect_match_saaddr_en[31] = `L;


//Only if any of the Source Address Registers are enabled the corresponding address is 
//compared with the incomming address else by default the Source Address match is made
//true
assign perfect_match_sa            = (| sa_addr_reg_sel) ? (| perfect_match_saaddr_en)
                                     : `H;
assign afb_sa_selected             = (| sa_addr_reg_sel);
assign afb_perfect_match_da        = (| perfect_match_addr_en);

always @(*) 
begin
  if (perfect_match_addr_en[0])
    afb_daf_addr = 5'b00000;
  else
      afb_daf_addr = 5'b00000;
end
  
// ---------------------------------------------
// Registered statements. Compare Logic Block-----------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    cmp_mac0 <= `L;
  end
  else begin
    if (cntr == 3'b000 & da_addr & rpe_data_valid)
      cmp_mac0 <= (rpe_data == mac0);
    else if (da_addr & rpe_data_valid & cmp_mac0)
      cmp_mac0 <= (rpe_data == mac0);
  end
end 


// ---------------------------------------------
// Combinatorial statements. Counter Logic Block-----------------------
// ---------------------------------------------
// This generates the counter and the address valid signals

assign da_addr    = (rpe_sof | da_addr_r);
assign addr_valid = (da_addr | sa_addr_r);

// ---------------------------------------------
// Registered statements. Counter Logic Block-----------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    cntr <= 3'b000;
  end
  else begin
    if ((rpe_data_valid & cntr == 3'b101) | rpe_eof) 
      cntr <= 3'b000;
    else if (rpe_data_valid & addr_valid)
      cntr <= cntr + 3'b001;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    da_addr_r <= `L;
  end
  else begin
    if ((rpe_data_valid & cntr == 3'b101) | rpe_eof) 
      da_addr_r <= `L;
    else if (rpe_sof)
      da_addr_r <= `H;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    sa_addr_r <= `L;
  end
  else begin
    if (rpe_eof | (!da_addr & cntr == 3'b101 & rpe_data_valid))
      sa_addr_r <= `L;
    else if (da_addr & cntr == 3'b101 & rpe_data_valid)
      sa_addr_r <= `H;
  end
end

// ---------------------------------------------
// Registered statements. Enable Logic Block-----------------------
// ---------------------------------------------
// This block generates the enable signals for the destination and 
// the source address filter. This block also detects if the received
// frame is of the type multicast or broadcast

always @(`RX_RST_MODE)
begin
  if(!rst_clk_rx_n) begin
    daf_filterfail_valid <= `L;
  end
  else
    if (!da_addr | rpe_sof)
      daf_filterfail_valid <= `L;
    else if (da_addr & cntr == 3'b101 & rpe_data_valid)
      daf_filterfail_valid <= `H;
end

always @(`RX_RST_MODE)
begin
  if(!rst_clk_rx_n) begin
    saf_filterfail_valid <= `L;
  end
  else
    if (cntr == 3'b000 & rpe_data_valid)
      saf_filterfail_valid <= `L;
    else if (!da_addr & cntr == 3'b101 & rpe_data_valid)
      saf_filterfail_valid <= `H;
end

    
always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    afb_rcvbroadcast <= `L;
  end
  else 
    if (rpe_eof)
      afb_rcvbroadcast <= `L;
    else if (da_addr & (cntr == 3'b000) & rpe_data_valid)
      afb_rcvbroadcast <= (rpe_data == 8'hff);
    else if (da_addr & afb_rcvbroadcast & rpe_data_valid)
      afb_rcvbroadcast <= (rpe_data == 8'hff);
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    afb_rcvmulticast <= `L;
  end
  else
    if (rpe_eof)
      afb_rcvmulticast <= `L;
    else if (da_addr & (cntr == 3'b000)  & rpe_data[0] & rpe_data_valid)
      afb_rcvmulticast <= `H;
end

// ---------------------------------------------
// Combinatorial statements. Filter Fail Logic Block-----------------------
// ---------------------------------------------
// This block generates the DA & SA filter fail signals

assign saf_filterfail     = !scr_promiscousmode & ((!perfect_match_sa & 
                            !scr_sainversefilter) | (perfect_match_sa & 
                       	    scr_sainversefilter));

assign unicast_match      = (((!scr_hashunicast | scr_hashnperfect_e) & afb_perfect_match_da) |
                            (scr_hashunicast & hash_bit));

assign multicast_match    = (((!scr_hashmulticast | scr_hashnperfect_e) & afb_perfect_match_da) |
                            (scr_hashmulticast & hash_bit));

assign daf_filterfail     = scr_promiscousmode ? `L : 
                            afb_rcvbroadcast ? scr_disabroadcast :
                            afb_rcvmulticast ? ~scr_passallmulticast & 
                                               (scr_dainversefilter ? multicast_match : ~multicast_match):
			    
			                      scr_dainversefilter ? unicast_match : ~unicast_match;


assign afb_daf_filterfail_valid = daf_filterfail_valid;
assign afb_saf_filterfail_valid = saf_filterfail_valid;
assign afb_daf_filterfail       = daf_filterfail;
assign afb_saf_filterfail       = saf_filterfail;






endmodule
