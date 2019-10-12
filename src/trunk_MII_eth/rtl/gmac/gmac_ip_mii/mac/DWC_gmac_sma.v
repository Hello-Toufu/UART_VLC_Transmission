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
// Date             :        $Date: 2007/11/15 $
// File Version     :        $Revision: #12 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// mac_sma (mac_sma.v)
//
// DESCRIPTION:
// GMAC Station Management Agent (SMA)
// SMA provides application an access to PHY registers. The application can
// select one of 32 PHYs and one of the 32 registers with in any PHY and
// send control data or receive status information. Only one register in a 
// PHY can be addressed at any time.  
//--------------------------------------------------------------------------

// ---------------------------------------------
// Include File and defines. ----------------------------------------
// ---------------------------------------------

`define  SMA_IDLE  0
`define  SMA_PRE   1
`define  SMA_OPC   2
`define  SMA_ADDR  3
`define  SMA_DATA  4

// frequency divisor for clk_csr_i, encoded cr_appclkrange
`define  DIV20TO35    6'd07
`define  DIV35TO60    6'd12
`define  DIV60TO100   6'd20
`define  DIV100TO150  6'd30
`define  DIV150TO250  6'd50
`define  DIV250TO300  6'd61

`define  DIVBY4    6'd01
`define  DIVBY6    6'd02
`define  DIVBY8    6'd03
`define  DIVBY10   6'd04
`define  DIVBY12   6'd05
`define  DIVBY14   6'd06
`define  DIVBY16   6'd07
`define  DIVBY18   6'd08

module DWC_gmac_sma (
  // Inputs
  clk_csr_i,
  rst_clk_csr_n,
  cr_smacmdvld,
  cr_smard,
  cr_smaphyaddr,
  cr_smaregaddr,
  cr_smadata,
  cr_appclkrange,
  gmii_mdi_i,

  // Outputs
  sma_transdone_n,
  sma_data,
  gmii_mdc_o,
  gmii_mdo_o,
  gmii_mdo_o_e
  );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------
// Clock and Reset Signals.

input          clk_csr_i;       // application clock
input          rst_clk_csr_n; // reset
input          cr_smacmdvld;    // command valid from csr module
input          cr_smard;        // read/write
input  [4:0]   cr_smaphyaddr;   // phy id
input  [4:0]   cr_smaregaddr;   // phy register address
input  [15:0]  cr_smadata;      // register write date in write operation
input  [3:0]   cr_appclkrange;  // encoded clock range, of clk_csr_i
input          gmii_mdi_i;      // input to GMAC, of tri-state mdio

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

output          sma_transdone_n; // done to csr module
output  [15:0]  sma_data;        // register read data in read operation
output          gmii_mdc_o;      // mdc clock, for serial interface
output          gmii_mdo_o;      // output from GMAC, of tri-state mdio
output          gmii_mdo_o_e;    // output enable of gmii_mdo_o from GMAC

// ---------------------------------------------
// Output Port Register Declarations. ----------------------------------------
// ---------------------------------------------

reg          sma_transdone_n;
reg  [15:0]  sma_data;
reg          gmii_mdo_o;
reg          gmii_mdo_o_e;

// ---------------------------------------------
// Output Port Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire  gmii_mdc_o;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------

reg         mdc_o;     // mdc clock 
reg  [5:0]  div_count; // clock divider
reg  [5:0]  div_limit; // divisor(half) for dividing clk_csr_i
reg  [4:0]  count32;   // keep track of sma transaction
reg  [4:0]  sma_state; // state register
reg         read;      // read/write transaction

// ---------------------------------------------
// Combinational statements. ----------------------------------------
// ---------------------------------------------

  // output gmii_mdc_o
  assign gmii_mdc_o  = mdc_o;

  // mux o/p div_limit; for cr_appclkrange
  always @(cr_appclkrange) begin
    if (!cr_appclkrange[3]) begin //default scenario
      case (cr_appclkrange[2:0])  
      {`L,`L,`L}: div_limit  = `DIV60TO100;  // 60-100 Mhz
      {`L,`L,`H}: div_limit  = `DIV100TO150; // 100-150 Mhz
      {`L,`H,`L}: div_limit  = `DIV20TO35;   // 20-35 Mhz
      {`L,`H,`H}: div_limit  = `DIV35TO60;   // 35-60 Mhz
      {`H,`L,`L}: div_limit  = `DIV150TO250; // 150-250 Mhz
      default   : div_limit  = `DIV250TO300; // 250-300 Mhz
      endcase
    end
    else begin 
    // This makes the clock divisor to be directly programmable; For values of 0-7 of cr-appclkrange,
    // we get MDC clock frequency of (clk_app) divided by 4,6,8,10,12,14,16 & 18 respectively.
    // NOTE: Usgae of this option may not meet IEEE 802.3 specifications for MDC clock frequency. 
      case (cr_appclkrange[2:0])  
      {`L,`L,`L}: div_limit  = `DIVBY4;
      {`L,`L,`H}: div_limit  = `DIVBY6;
      {`L,`H,`L}: div_limit  = `DIVBY8;
      {`L,`H,`H}: div_limit  = `DIVBY10;
      {`H,`L,`L}: div_limit  = `DIVBY12;
      {`H,`L,`H}: div_limit  = `DIVBY14;
      {`H,`H,`L}: div_limit  = `DIVBY16;
      {`H,`H,`H}: div_limit  = `DIVBY18;
      endcase
    end
  end
 
  // o/p sma_data; read data during read operation
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n)
      sma_data  <= {16{`L}};
    //else if (count32[4] && !(|div_count) && !mdc_o) 
    //MDIO sampled at synchronous to MDC clock, and not at negedge 
    //in case of earlier release. BUG FIXED, Jan 28, 2002
    else if ((div_count == div_limit) & !mdc_o) 
      sma_data[4'hE - count32[3:0]]  <= gmii_mdi_i;
  end
 
  // generating output gmii_mdc_o ranging 1.25 Mhz to 2.42 Mhz 
  // irrespective of input 20 - 150 Mhz
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n)
      mdc_o  <= `L;
    else if (div_count == div_limit)
      mdc_o  <= !sma_state[`SMA_IDLE] & !mdc_o;
  end

  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n)
      div_count  <= {6{`L}};
    else if (div_count < div_limit)
      div_count  <= div_count + {{5{`L}},`H};
    else 
      div_count  <= {6{`L}};
  end
  
  // count32 5bits; keeps sma transaction
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n)
      count32  <= {5{`L}};
    else if (sma_state[`SMA_IDLE]) // set in IDLE state
      count32  <= {5{`H}};
    else if (!mdc_o & div_count == div_limit) 
      count32  <= count32 + {{4{`L}},`H};
  end

  // state m/c - one hot; work in sync with the mdc_o
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      sma_state  <= 5'b00001;  // `SMA_IDLE
      gmii_mdo_o  <= `L;
      gmii_mdo_o_e  <= `L;
      sma_transdone_n  <= `H;
      read  <= `L;
    end
    else if(!mdc_o & div_count == 6'd0) begin
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off      
      case (`H)  // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on      
        sma_state[`SMA_IDLE]: begin
// FIX : PHY register access was hanging
          //if (cr_smacmdvld) begin
          if (cr_smacmdvld & sma_transdone_n) begin
            gmii_mdo_o  <= `H;
            gmii_mdo_o_e  <= `H;
            sma_state  <= 5'b00010;  // `SMA_PRE
          end
          else begin
            //sma_transdone_n  <= `H;
            sma_transdone_n  <= (cr_smacmdvld) ? sma_transdone_n : `H;
            gmii_mdo_o  <= `L;
            gmii_mdo_o_e  <= `L;
            read  <= `L;
          end
        end
        sma_state[`SMA_PRE]: begin
          if (&count32) begin
            gmii_mdo_o  <= `L;
            sma_state  <= 5'b00100;  // `SMA_OPC
          end
        end
        sma_state[`SMA_OPC]: begin
          if (count32[1]) begin
            gmii_mdo_o  <= !cr_smard;
            sma_state  <= 5'b01000;  // `SMA_ADDR
          end
          else if (count32[0]) begin
            gmii_mdo_o  <= cr_smard;
            read  <= cr_smard;
          end
          else 
            gmii_mdo_o  <= `H;
        end
        sma_state[`SMA_ADDR]: begin
          if (count32[3]) begin
            if (count32[2] & count32[0]) begin
              gmii_mdo_o_e  <= !read;
              gmii_mdo_o  <= !read;
              sma_state  <= 5'b10000;  // `SMA_DATA
            end
            else
              // leda FM_2_22 off
              gmii_mdo_o  <= cr_smaregaddr[3'b100 - count32[2:0]];
              // leda FM_2_22 on
          end
          else 
            // leda FM_2_22 off
            gmii_mdo_o  <= cr_smaphyaddr[3'b111 - count32[2:0]];
            // leda FM_2_22 on
        end
        sma_state[`SMA_DATA]: begin
          if (read) begin
            gmii_mdo_o_e  <= !read;
            if (&count32) begin
              gmii_mdo_o  <= `L;
              sma_transdone_n  <= `L;
              sma_state  <= 5'b00001;  // `SMA_IDLE
            end
          end
          else begin
            if (count32[4]) begin
              if (&count32) begin
                gmii_mdo_o  <= `L;
                gmii_mdo_o_e  <= `L;
                sma_transdone_n  <= `L;
                sma_state  <= 5'b00001;  // `SMA_IDLE
              end
              else begin
                gmii_mdo_o_e  <= !read;
                gmii_mdo_o  <= cr_smadata[{!count32[3],!count32[2],
                                           !count32[1],!count32[0]} -
                                          {`L,`L,`L,`H}];
              end
            end
            else if (count32[0]) begin
              gmii_mdo_o_e  <= !read;
              gmii_mdo_o  <= cr_smadata[15];
            end
            else begin
              gmii_mdo_o_e  <= !read;
              gmii_mdo_o  <= `L;
            end
          end
        end
      endcase
// leda W225 on      
    end
    else
      //sma_transdone_n  <= `H;
      sma_transdone_n  <= (cr_smacmdvld) ? sma_transdone_n : `H;
  end

endmodule // mac_sma
