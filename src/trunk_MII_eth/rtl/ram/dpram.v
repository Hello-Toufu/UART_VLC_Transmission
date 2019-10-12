/*--------------------------------------------------------------------------
-- SYNOPSYS CONFIDENTIAL  -  This is an unpublished,  proprietary  work of
-- Synopsys, Inc., and is fully protected under copyright and trade secret
-- laws. You may not view, use, disclose, copy, or distribute this file or
-- any information  contained  herein  except pursuant to a valid  written
-- license from Synopsys.
--------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------
-- MODULE:
-- dpram (dpram.v)
--
-- DESCRIPTION:
-- MTL Dual Port RAM
-- This module is a standard dual port RAM, registered write and read.
-- Used as part of transmit and receive dual port RAM
----------------------------------------------------------------------------
#
# Revision History
#
# Rev1.0: March 30, 2002
#         Gigabit Ethernet Subsystem (gmac_subsys)
#
# This file:
# $DateTime$
# $Revision$
#
--------------------------------------------------------------------------*/


module dpram (

  // Inputs
  clk1,
  clk2,

  a1,
  a2,
  d1,
  d2,

  csn1,
  csn2,
  wen1,
  oen1,
  wen2,
  oen2,

  // Output
  q1,
  q2
  );
parameter cypress_param1 = "TX_ONE";
parameter cypress_param2 = "TX_TWO";
parameter cypress_param3 = "TX_THREE";
parameter cypress_param4 = "TX_FOUR";
parameter cypress_param5 = "TX_FIVE";
parameter cypress_param6 = "TX_SIX";
parameter cypress_param7 = "TX_SEVEN";
parameter cypress_param8 = "TX_EIGHT";
parameter cypress_param9 = "1";
parameter cypress_param10 = "2";
parameter cypress_param11 = "3";
parameter cypress_param12 = "4";
parameter cypress_param13 = "5";
parameter cypress_param14 = "6";
parameter cypress_param15 = "7";
parameter cypress_param16 = "8";
parameter APTR_WIDTH = 9;
parameter DATA_WIDTH = 33;

`ifdef VIRAGE_RAM
  `ifdef ASYNC_RAM
    parameter RAM_DEPTH = 2048;
  `else  
    parameter RAM_DEPTH = 4096;
  `endif
`else  
  parameter RAM_DEPTH = 4096;
`endif  

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

input                     clk1; // Write Clock
input                     clk2; // Read Clock
input                     csn1; // Chip Select on Wr port
input                     csn2; // Chip Select on Rd port
input                     wen1; // Write Signal on WrPort
input                     wen2; // Write Signal on RdPort
input                     oen1; // O/E on Wr Port
input                     oen2; // O/E on Rd Port
input [APTR_WIDTH-1:0]    a1;   // Write Pointer
input [APTR_WIDTH-1:0]    a2;   // Read pointer
input [DATA_WIDTH-1:0]    d1;   // Write Data on Wr Port
input [DATA_WIDTH-1:0]    d2;   // Read Data on Rd Port

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

output [DATA_WIDTH-1:0]   q1;   // Read Data on Wr Port
output [DATA_WIDTH-1:0]   q2;   // Read Data on Rd Port

// ---------------------------------------------
// Internal Register/Wire Declarations. ----------------------------------------
// ---------------------------------------------
reg [DATA_WIDTH-1:0] RAM [0:(1<<APTR_WIDTH)-1];
reg  [DATA_WIDTH-1:0] DataOut;

// ---------------------------------------------
// Include File. ----------------------------------------
// ---------------------------------------------
//`include "DWC_gmac_ahb_cc_constants.v"

// ---------------------------------------------
// Output Port Assignments
// ---------------------------------------------
assign q1 = {DATA_WIDTH{1'b0}};

// -----------------------------------------------------------------
// Output Port Assignments for flow-through and default RAM options
// -----------------------------------------------------------------
`ifdef CYPRESS_RAM
`else
  `ifdef ARTISAN_RAM
  `else
    `ifdef VIRAGE_RAM
    `else
      `ifdef FL_THRU_RAM
        `ifdef ASYNC_RAM
          assign q2 = RAM[a2];
        `else 
          assign q2 = DataOut;
        `endif 
      `else
        `ifdef ASYNC_RAM
        assign q2 = (oen2) ? RAM[a2] : {DATA_WIDTH{1'bZ}};
        `else
        assign q2 = (oen2) ? DataOut : {DATA_WIDTH{1'bZ}};
        `endif // ASYNC_RAM
      `endif //FL_THRU_RAM
    `endif // VIRAGE_RAM
  `endif // ARTISAN_RAM
`endif // CYPRESS_RAM   

// -----------------------------------------------------------------
// FIFO Read operations for flow-through and default RAM options
// -----------------------------------------------------------------
`ifdef CYPRESS_RAM
`else
  `ifdef ARTISAN_RAM
  `else
    `ifdef VIRAGE_RAM
    `else
      // registered ouput of read pointer location data
      always @(posedge clk2) begin
      `ifdef FL_THRU_RAM
      `else
         if (~csn2)
      `endif //FL_THRU_RAM
           DataOut <= RAM[a2];
      end
    `endif // VIRAGE_RAM
  `endif // ARTISAN_RAM
`endif // CYPRESS_RAM   
  

  // Update RAM on write
  always @(posedge clk1) begin
    if (wen1)
      RAM [a1]  <= d1;
  end

// -----------------------------------------------------------------
// CYPRESS RAM Instantiations 
// -----------------------------------------------------------------
`ifdef CYPRESS_RAM
`ifdef ASYNC_RAM
  wire [11:0] al_async;
  wire [11:0] ar_async;

  wire one_busyl_n;
  wire one_busyr_n;
  wire two_busyl_n;
  wire two_busyr_n;
  
  assign al_async = {{12-APTR_WIDTH{1'b0}},a1};
  assign ar_async = {{12-APTR_WIDTH{1'b0}},a2};
  
  defparam one_inst.DelayRange = "Max"; 
  defparam one_inst.MessageLevel = "15"; 
  defparam one_inst.ModelAlias = cypress_param1; 
  defparam one_inst.ModelId = cypress_param9; 
  defparam one_inst.TimingVersion = "none";
  cy7c0241_mx_bus one_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( one_busyl_n ), 
      .busyr_n ( one_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[17:0] ), 
      .ior ( q2[17:0] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  ); 
  
  `ifdef DATAWIDTH_32
  wire dumyl;
  wire dumyr;
  assign dumyl = 1'b0;
  defparam two_inst.DelayRange = "Max"; 
  defparam two_inst.MessageLevel = "15"; 
  defparam two_inst.ModelAlias = cypress_param2; 
  defparam two_inst.ModelId = cypress_param10; 
  defparam two_inst.TimingVersion = "none";
  cy7c0241_mx_bus two_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( two_busyl_n ), 
      .busyr_n ( two_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( {dumyl,d1[34:18]} ), 
      .ior ( {dumyr,q2[34:18]} ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  `endif
  
  `ifdef DATAWIDTH_64
  wire three_busyl_n;
  wire three_busyr_n;
  wire four_busyl_n;
  wire four_busyr_n;
  
  defparam two_inst.DelayRange = "Max"; 
  defparam two_inst.MessageLevel = "15"; 
  defparam two_inst.ModelAlias = cypress_param2; 
  defparam two_inst.ModelId = cypress_param10; 
  defparam two_inst.TimingVersion = "none";
  cy7c0241_mx_bus two_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( two_busyl_n ), 
      .busyr_n ( two_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[35:18] ), 
      .ior ( q2[35:18] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  defparam three_inst.DelayRange = "Max"; 
  defparam three_inst.MessageLevel = "15"; 
  defparam three_inst.ModelAlias = cypress_param3; 
  defparam three_inst.ModelId = cypress_param11; 
  defparam three_inst.TimingVersion = "none";
  cy7c0241_mx_bus three_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( three_busyl_n ), 
      .busyr_n ( three_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[53:36] ), 
      .ior ( q2[53:36] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  
  wire [3:0] dumyl;
  wire [3:0] dumyr;
  
  assign dumyl = 4'h0;
  
  defparam four_inst.DelayRange = "Max"; 
  defparam four_inst.MessageLevel = "15"; 
  defparam four_inst.ModelAlias = cypress_param4; 
  defparam four_inst.ModelId = cypress_param12; 
  defparam four_inst.TimingVersion = "none";
  cy7c0241_mx_bus four_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( four_busyl_n ), 
      .busyr_n ( four_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( {dumyl,d1[67:54]} ), 
      .ior ( {dumyr,q2[67:54]} ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  `endif
  
  
  `ifdef DATAWIDTH_128
  wire three_busyl_n;
  wire three_busyr_n;
  wire four_busyl_n;
  wire four_busyr_n;
  wire five_busyl_n;
  wire five_busyr_n;
  wire six_busyl_n;
  wire six_busyr_n;
  wire seven_busyl_n;
  wire seven_busyr_n;
  wire eight_busyl_n;
  wire eight_busyr_n;
  
  defparam two_inst.DelayRange = "Max"; 
  defparam two_inst.MessageLevel = "15"; 
  defparam two_inst.ModelAlias = cypress_param2; 
  defparam two_inst.ModelId = cypress_param10; 
  defparam two_inst.TimingVersion = "none";
  cy7c0241_mx_bus two_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( two_busyl_n ), 
      .busyr_n ( two_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[35:18] ), 
      .ior ( q2[35:18] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  defparam three_inst.DelayRange = "Max"; 
  defparam three_inst.MessageLevel = "15"; 
  defparam three_inst.ModelAlias = cypress_param3; 
  defparam three_inst.ModelId = cypress_param11; 
  defparam three_inst.TimingVersion = "none";
  cy7c0241_mx_bus three_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( busyl_n ), 
      .busyr_n ( busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[53:36] ), 
      .ior ( q2[53:36] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  
  defparam four_inst.DelayRange = "Max"; 
  defparam four_inst.MessageLevel = "15"; 
  defparam four_inst.ModelAlias = cypress_param4; 
  defparam four_inst.ModelId = cypress_param12; 
  defparam four_inst.TimingVersion = "none";
  cy7c0241_mx_bus four_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( four_busyl_n ), 
      .busyr_n ( four_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[71:54] ), 
      .ior ( q2[71:54] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  defparam five_inst.DelayRange = "Max"; 
  defparam five_inst.MessageLevel = "15"; 
  defparam five_inst.ModelAlias = cypress_param5; 
  defparam five_inst.ModelId = cypress_param13; 
  defparam five_inst.TimingVersion = "none";
  cy7c0241_mx_bus five_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( five_busyl_n ), 
      .busyr_n ( five_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[89:72] ), 
      .ior ( q2[89:72] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  
  
  defparam six_inst.DelayRange = "Max"; 
  defparam six_inst.MessageLevel = "15"; 
  defparam six_inst.ModelAlias = cypress_param6; 
  defparam six_inst.ModelId = cypress_param14; 
  defparam six_inst.TimingVersion = "none";
  cy7c0241_mx_bus six_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( six_busyl_n ), 
      .busyr_n ( six_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[107:90] ), 
      .ior ( q2[107:90] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  defparam seven_inst.DelayRange = "Max"; 
  defparam seven_inst.MessageLevel = "15"; 
  defparam seven_inst.ModelAlias = cypress_param7; 
  defparam seven_inst.ModelId = cypress_param15; 
  defparam seven_inst.TimingVersion = "none";
  cy7c0241_mx_bus seven_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( seven_busyl_n ), 
      .busyr_n ( seven_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( d1[125:108] ), 
      .ior ( q2[125:108] ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  
  
  wire [10:0] dumyl;
  wire [10:0] dumyr;
  
  assign dumyl = {3'b000,8'h00};
  
  defparam eight_inst.DelayRange = "Max"; 
  defparam eight_inst.MessageLevel = "15"; 
  defparam eight_inst.ModelAlias = cypress_param8; 
  defparam eight_inst.ModelId = cypress_param16; 
  defparam eight_inst.TimingVersion = "none";
  cy7c0241_mx_bus eight_inst ( 
      .al ( al_async ), 
      .ar ( ar_async ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .busyl_n ( eight_busyl_n ), 
      .busyr_n ( eight_busyr_n ), 
      .cel_n ( csn1 ), 
      .cer_n ( csn2 ), 
      .intl_n ( ), //Not req
      .intr_n ( ), //Not req
      .iol ( {dumyl,d1[132:126]} ), 
      .ior ( {dumyr,q2[132:126]} ), 
      .m_s_n ( 1'b1 ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( !oen2 ), 
      .r_w_nl ( !wen1|clk1 ), 
      .r_w_nr ( 1'b1 ), 
      .seml_n ( 1'b1 ), 
      .semr_n ( 1'b1 ) 
  );
  `endif
`else
  wire [16:0] al_sync;
  wire [16:0] ar_sync;

  wire oe_n;
  wire inv_clk1;
  wire inv_clk2;

  assign inv_clk2 = !clk2;
  assign inv_clk1 = !clk1;
  
  assign al_sync = {{17-APTR_WIDTH{1'b0}},a1};
  assign ar_sync = {{17-APTR_WIDTH{1'b0}},a2};
  assign oe_n = !oen2;

  defparam one_inst.DelayRange = "Max"; 
  defparam one_inst.MessageLevel = "15"; 
  defparam one_inst.ModelAlias = cypress_param1; 
  defparam one_inst.ModelId = cypress_param9; 
  defparam one_inst.TimingVersion = "none";
  cy7c0831v_mx_bus one_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1),
      .cnt_msk_nr ( 1'b1),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[17:0] ), 
      .dqr ( q2[17:0] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  ); 
  
  `ifdef DATAWIDTH_32
  wire dumyl;
  wire dumyr;
  assign dumyl = 1'b0;
  defparam two_inst.DelayRange = "Max"; 
  defparam two_inst.MessageLevel = "15"; 
  defparam two_inst.ModelAlias = cypress_param2; 
  defparam two_inst.ModelId = cypress_param10; 
  defparam two_inst.TimingVersion = "none";
  cy7c0831v_mx_bus two_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( {dumyl,d1[34:18]} ), 
      .dqr ( {dumyr,q2[34:18]} ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  `endif
  
  `ifdef DATAWIDTH_64
  
  defparam two_inst.DelayRange = "Max"; 
  defparam two_inst.MessageLevel = "15"; 
  defparam two_inst.ModelAlias = cypress_param2; 
  defparam two_inst.ModelId = cypress_param10; 
  defparam two_inst.TimingVersion = "none";
  cy7c0831v_mx_bus two_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[35:18] ), 
      .dqr ( q2[35:18] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  defparam three_inst.DelayRange = "Max"; 
  defparam three_inst.MessageLevel = "15"; 
  defparam three_inst.ModelAlias = cypress_param3; 
  defparam three_inst.ModelId = cypress_param11; 
  defparam three_inst.TimingVersion = "none";
  cy7c0831v_mx_bus three_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[53:36] ), 
      .dqr ( q2[53:36] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  
  wire [3:0] dumyl;
  wire [3:0] dumyr;
  
  assign dumyl = 4'h0;
  
  defparam four_inst.DelayRange = "Max"; 
  defparam four_inst.MessageLevel = "15"; 
  defparam four_inst.ModelAlias = cypress_param4; 
  defparam four_inst.ModelId = cypress_param12; 
  defparam four_inst.TimingVersion = "none";
  cy7c0831v_mx_bus four_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( {dumyl,d1[67:54]} ), 
      .dqr ( {dumyr,q2[67:54]} ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  `endif
  
  
  `ifdef DATAWIDTH_128
  
  defparam two_inst.DelayRange = "Max"; 
  defparam two_inst.MessageLevel = "15"; 
  defparam two_inst.ModelAlias = cypress_param2; 
  defparam two_inst.ModelId = cypress_param10; 
  defparam two_inst.TimingVersion = "none";
  cy7c0831v_mx_bus two_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[35:18] ), 
      .dqr ( q2[35:18] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  defparam three_inst.DelayRange = "Max"; 
  defparam three_inst.MessageLevel = "15"; 
  defparam three_inst.ModelAlias = cypress_param3; 
  defparam three_inst.ModelId = cypress_param11; 
  defparam three_inst.TimingVersion = "none";
  cy7c0831v_mx_bus three_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[53:36] ), 
      .dqr ( q2[53:36] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  
  defparam four_inst.DelayRange = "Max"; 
  defparam four_inst.MessageLevel = "15"; 
  defparam four_inst.ModelAlias = cypress_param4; 
  defparam four_inst.ModelId = cypress_param12; 
  defparam four_inst.TimingVersion = "none";
  cy7c0831v_mx_bus four_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[71:54] ), 
      .dqr ( q2[71:54] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  defparam five_inst.DelayRange = "Max"; 
  defparam five_inst.MessageLevel = "15"; 
  defparam five_inst.ModelAlias = cypress_param5; 
  defparam five_inst.ModelId = cypress_param13; 
  defparam five_inst.TimingVersion = "none";
  cy7c0831v_mx_bus five_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[89:72] ), 
      .dqr ( q2[89:72] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  
  
  defparam six_inst.DelayRange = "Max"; 
  defparam six_inst.MessageLevel = "15"; 
  defparam six_inst.ModelAlias = cypress_param6; 
  defparam six_inst.ModelId = cypress_param14; 
  defparam six_inst.TimingVersion = "none";
  cy7c0831v_mx_bus six_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[107:90] ), 
      .dqr ( q2[107:90] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  defparam seven_inst.DelayRange = "Max"; 
  defparam seven_inst.MessageLevel = "15"; 
  defparam seven_inst.ModelAlias = cypress_param7; 
  defparam seven_inst.ModelId = cypress_param15; 
  defparam seven_inst.TimingVersion = "none";
  cy7c0831v_mx_bus seven_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( d1[125:108] ), 
      .dqr ( q2[125:108] ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  
  
  wire [10:0] dumyl;
  wire [10:0] dumyr;
  
  assign dumyl = {3'b000,8'h00};
  
  defparam eight_inst.DelayRange = "Max"; 
  defparam eight_inst.MessageLevel = "15"; 
  defparam eight_inst.ModelAlias = cypress_param8; 
  defparam eight_inst.ModelId = cypress_param16; 
  defparam eight_inst.TimingVersion = "none";
  cy7c0831v_mx_bus eight_inst ( 
      .mrst_n ( 1'b1 ),
      .cnt_msk_nl ( 1'b1 ),
      .cnt_msk_nr ( 1'b1 ),
      .adsl_n ( csn1 ),
      .adsr_n ( csn2 ),
      .al ( al_sync ), 
      .ar ( ar_sync ), 
      .bl_n ( 2'b00 ), 
      .br_n ( 2'b00 ), 
      .ce0l_n ( csn1 ), 
      .ce0r_n ( csn2 ), 
      .ce1l ( !csn1 ), 
      .ce1r ( !csn2 ), 
      .clkl ( inv_clk1 ),
      .clkr ( inv_clk2 ),
      .cntenl_n ( csn1 ),
      .cntenr_n ( csn2 ),
      .cntrstl_n ( 1'b1 ),
      .cntrstr_n ( 1'b1 ),
      .dql ( {dumyl,d1[132:126]} ), 
      .dqr ( {dumyr,q2[132:126]} ), 
      .oel_n ( 1'b1 ), 
      .oer_n ( oe_n ), 
      .r_w_nl ( !wen1 ), 
      .r_w_nr ( 1'b1 )
  );
  `endif
`endif // ASYNC_RAM
`endif // CYPRESS_RAM
// -----------------------------------------------------------------
// End of CYPRESS RAM Instantiations 
// -----------------------------------------------------------------

// -----------------------------------------------------------------
// ARTISAN RAM Instantiations 
// -----------------------------------------------------------------
`ifdef ARTISAN_RAM
  wire [11:0] al_sync;
  wire [11:0] ar_sync;
  wire [35:0] out_b;
  wire [35:0] in_a;
  
  assign al_sync = {{12-APTR_WIDTH{1'b0}},a1};
  assign ar_sync = {{12-APTR_WIDTH{1'b0}},a2};

  //RA2SH one_inst (
  //                .QA   (),
  //                .QB   (q2),
  //                .CLKA (clk1),
  //                .CENA (csn1),
  //                .WENA (~wen1),
  //                .AA   (al_sync),
  //                .DA   (d1),
  //                .CLKB (clk2),
  //                .CENB (csn2),
  //                .WENB (oen2),
  //                .AB   (ar_sync),
  //                .DB   ()
  //               ); 
  `ifdef DATAWIDTH_32
  assign q2 = out_b[34:0];
  assign in_a = {1'b0, d1};
  
  sram_dp_metro one_inst (
                .QA    (), 
                .QB    (out_b),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (in_a),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                );

  `else 
    `ifdef DATAWIDTH_64

    sram_dp_metro one_inst (
                .QA    (), 
                .QB    (q2[35:0]),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (d1[35:0]),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                );

    assign q2[67:36] = out_b[31:0];
    assign in_a = {4'b0000, d1[67:36]};
    
    sram_dp_metro two_inst (
                .QA    (), 
                .QB    (out_b),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (in_a),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                );
    `else
      `ifdef DATAWIDTH_128

      sram_dp_metro one_inst (
                .QA    (), 
                .QB    (q2[35:0]),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (d1[35:0]),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                );

      sram_dp_metro two_inst (
                .QA    (), 
                .QB    (q2[71:36]),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (d1[71:36]),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                );

      sram_dp_metro three_inst (
                .QA    (), 
                .QB    (q2[107:72]),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (d1[107:72]),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                );

      assign q2[132:108] = out_b[24:0];
      assign in_a = {12'h000, d1[132:108]};
  
      sram_dp_metro four_inst (
                .QA    (), 
                .QB    (out_b),
                .CLKA  (clk1),
                .CENA  (csn1),
                .WENA  (~wen1),
                .AA    (al_sync),
                .DA    (in_a),
                .CLKB  (clk2),
                .CENB  (csn2),
                .WENB  (~csn2),
                .AB    (ar_sync),
                .DB    (),
                .EMAA  (3'b000),
                .EMAB  (3'b000),
                .RETN  (1'b1)
                ); 
      `endif // DATAWIDTH_128
    `endif // DATAWIDTH_64
  `endif // DATAWIDTH_32 
`endif // ARTISAN_RAM 
// -----------------------------------------------------------------
// End of ARTISAN RAM Instantiations 
// -----------------------------------------------------------------


// -----------------------------------------------------------------
// VIRAGE RAM Instantiations 
// -----------------------------------------------------------------
`ifdef VIRAGE_RAM
  `ifdef ASYNC_RAM
    wire [8:0] al_sync;
    wire [8:0] ar_sync;
    wire [31:0] out_b;
    wire [31:0] in_a;

    assign al_sync = {{12-APTR_WIDTH{1'b0}},a1};
    assign ar_sync = {{12-APTR_WIDTH{1'b0}},a2};

    `ifdef DATAWIDTH_32
    
    
    generic_p11ul_512x32cm4sw0  one_inst (
                          .QB     (q2[31:0]),                         
                          .ADRA   (al_sync),                      
                          .DA     (d1[31:0]),                         
                          .WEA    (wen1),                          
                          .MEA    (~csn1),                          
                          .CLKA   (clk1),                          
                          .ADRB   (ar_sync)
                          );

    assign q2[34:32] = out_b[3:0];
    assign in_a = {29'h00000000, d1[34:32]};
    
    generic_p11ul_512x32cm4sw0  two_inst (
                          .QB     (out_b),                         
                          .ADRA   (al_sync),                      
                          .DA     (in_a),                         
                          .WEA    (wen1),                          
                          .MEA    (~csn1),                          
                          .CLKA   (clk1),                          
                          .ADRB   (ar_sync)
                          );
    
    `else
      `ifdef DATAWIDTH_64
        generic_p11ul_512x32cm4sw0  one_inst (
                              .QB     (q2[31:0]),                         
                              .ADRA   (al_sync),                      
                              .DA     (d1[31:0]),                         
                              .WEA    (wen1),                          
                              .MEA    (~csn1),                          
                              .CLKA   (clk1),                          
                              .ADRB   (ar_sync)
                              );

        
        generic_p11ul_512x32cm4sw0  two_inst (
                              .QB     (q2[63:32]),                         
                              .ADRA   (al_sync),                      
                              .DA     (d1[63:32]),                         
                              .WEA    (wen1),                          
                              .MEA    (~csn1),                          
                              .CLKA   (clk1),                          
                              .ADRB   (ar_sync)
                              );

        assign q2[67:64] = out_b[3:0];
        assign in_a = {28'h0000000, d1[67:64]};
        
        generic_p11ul_512x32cm4sw0  three_inst (
                              .QB     (out_b),                         
                              .ADRA   (al_sync),                      
                              .DA     (in_a),                         
                              .WEA    (wen1),                          
                              .MEA    (~csn1),                          
                              .CLKA   (clk1),                          
                              .ADRB   (ar_sync)
                              );
      `else
        `ifdef DATAWIDTH_128
          generic_p11ul_512x32cm4sw0  one_inst (
                                .QB     (q2[31:0]),                         
                                .ADRA   (al_sync),                      
                                .DA     (d1[31:0]),                         
                                .WEA    (wen1),                          
                                .MEA    (~csn1),                          
                                .CLKA   (clk1),                          
                                .ADRB   (ar_sync)
                                );

          
          generic_p11ul_512x32cm4sw0  two_inst (
                                .QB     (q2[63:32]),                         
                                .ADRA   (al_sync),                      
                                .DA     (d1[63:32]),                         
                                .WEA    (wen1),                          
                                .MEA    (~csn1),                          
                                .CLKA   (clk1),                          
                                .ADRB   (ar_sync)
                                );

          
          generic_p11ul_512x32cm4sw0  three_inst (
                                .QB     (q2[95:64]),                         
                                .ADRA   (al_sync),                      
                                .DA     (d1[95:64]),                         
                                .WEA    (wen1),                          
                                .MEA    (~csn1),                          
                                .CLKA   (clk1),                          
                                .ADRB   (ar_sync)
                                );
          
          
          generic_p11ul_512x32cm4sw0  four_inst (
                                .QB     (q2[127:96]),                         
                                .ADRA   (al_sync),                      
                                .DA     (d1[127:96]),                         
                                .WEA    (wen1),                          
                                .MEA    (~csn1),                          
                                .CLKA   (clk1),                          
                                .ADRB   (ar_sync)
                                );
          
          assign q2[132:128] = out_b[4:0];
          assign in_a = {27'h0000000, d1[132:128]};

          generic_p11ul_512x32cm4sw0  five_inst (
                                .QB     (out_b),                         
                                .ADRA   (al_sync),                      
                                .DA     (in_a),                         
                                .WEA    (wen1),                          
                                .MEA    (~csn1),                          
                                .CLKA   (clk1),                          
                                .ADRB   (ar_sync)
                                );
        `endif // DATAWIDTH_128
      `endif // DATAWIDTH_64
    `endif // DATAWIDTH_32 
  `else
  wire [11:0] al_sync;
  wire [11:0] ar_sync;
  wire [35:0] out_b;
  wire [35:0] in_a;

  assign al_sync = {{12-APTR_WIDTH{1'b0}},a1};
  assign ar_sync = {{12-APTR_WIDTH{1'b0}},a2};

  `ifdef DATAWIDTH_32
  
  assign q2 = out_b[34:0];
  assign in_a = {1'b0, d1};
  
  generic_hssg2_4096x36cm4sw0 one_inst (
                       .QA     (),                    
                       .QB     (out_b),                    
                       .ADRA   (al_sync),                      
                       .DA     (in_a),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );
  `else
    `ifdef DATAWIDTH_64

    generic_hssg2_4096x36cm4sw0 one_inst (
                       .QA     (),                    
                       .QB     (q2[35:0]),                    
                       .ADRA   (al_sync),                      
                       .DA     (d1[35:0]),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );
  
    assign q2[67:36] = out_b[31:0];
    assign in_a = {4'b0000, d1[67:36]};
    
    generic_hssg2_4096x36cm4sw0 two_inst (
                       .QA     (),                    
                       .QB     (out_b),                    
                       .ADRA   (al_sync),                      
                       .DA     (in_a),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );
    `else
      `ifdef DATAWIDTH_128

      generic_hssg2_4096x36cm4sw0 one_inst (
                       .QA     (),                    
                       .QB     (q2[35:0]),                    
                       .ADRA   (al_sync),                      
                       .DA     (d1[35:0]),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );
      
      generic_hssg2_4096x36cm4sw0 two_inst (
                       .QA     (),                    
                       .QB     (q2[71:36]),                    
                       .ADRA   (al_sync),                      
                       .DA     (d1[71:36]),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );

      generic_hssg2_4096x36cm4sw0 three_inst (
                       .QA     (),                    
                       .QB     (q2[107:72]),                    
                       .ADRA   (al_sync),                      
                       .DA     (d1[107:72]),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );
    
      assign q2[132:108] = out_b[24:0];
      assign in_a = {12'h000, d1[132:108]};

      generic_hssg2_4096x36cm4sw0 four_inst (
                       .QA     (),                    
                       .QB     (out_b),                    
                       .ADRA   (al_sync),                      
                       .DA     (in_a),                    
                       .WEA    (wen1),                           
                       .OEA    (1'b0),                           
                       .MEA    (~csn1),                          
                       .CLKA   (clk1),                          
                       .RMA    (4'b0100),                     
                       .ADRB   (ar_sync),                    
                       .DB     (),                    
                       .WEB    (csn2),                          
                       .OEB    (oen2),                          
                       .MEB    (~csn2),                          
                       .CLKB   (clk2),                          
                       .RMB    (4'b0100)
                       );
      `endif // DATAWIDTH_128
    `endif // DATAWIDTH_64
  `endif // DATAWIDTH_32
  `endif //ASYNC_RAM
`endif // VIRAGE_RAM  
// -----------------------------------------------------------------
// VIRAGE RAM Instantiations 
// -----------------------------------------------------------------
endmodule

