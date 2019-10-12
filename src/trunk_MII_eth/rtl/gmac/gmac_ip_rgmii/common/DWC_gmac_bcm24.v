
////////////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2005 - 2009 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// Filename    : DWC_gmac_bcm24.v
// Author      : Doug Lee    8/11/05
// Description : DWC_gmac_bcm24.v Verilog module for DWC_gmac
//
// DesignWare IP ID: 044614fa
//
////////////////////////////////////////////////////////////////////////////////


module DWC_gmac_bcm24 (
    clk_s,
    rst_s_n,
    init_s_n,
    en_s,
    count_s,
    offset_count_s,

    clk_d,
    rst_d_n,
    init_d_n,
    count_d,

    test
    );

parameter WIDTH               = 8;  // RANGE 1 to 1024
parameter OFFSET              = 0;  // RANGE 0 to (2**(WIDTH-1) - 1)
parameter REG_COUNT_D         = 1;  // RANGE 0 to 1
parameter F_SYNC_TYPE         = 2;  // RANGE 0 to 4
parameter TST_MODE            = 0;  // RANGE 0 to 1
parameter VERIF_EN            = 2;  // RANGE 0 to 2
parameter PIPE_DELAY          = 0;  // RANGE 0 to 2
parameter REG_COUNT_S         = 1;  // RANGE 0 to 1
parameter REG_OFFSET_COUNT_S  = 1;  // RANGE 0 to 1


input			clk_s;           // clock input from source domain
input			rst_s_n;         // active low asynchronous reset from source domain
input			init_s_n;        // active low synchronous reset from source domain
input                   en_s;            // enable source domain
output [WIDTH-1:0]      count_s;         // binary counter value to source domain
output [WIDTH-1:0]      offset_count_s;  // binary counter OFFSET value to source domain

input			clk_d;           // clock input from destination domain
input			rst_d_n;         // active low asynchronous reset from destination domain
input			init_d_n;        // active low synchronous reset from destination domain
output [WIDTH-1:0]      count_d;         // binary counter value to destination domain

input                   test;            // test input

wire                    drs_en_s;

wire   [WIDTH-1:0]      next_count_s_int;
wire   [WIDTH-1:0]      next_count_s_adv;
reg    [WIDTH-1:0]      count_s_int;
wire   [WIDTH-1:0]      count_s_int_xor;
wire   [WIDTH-1:0]      next_offset_count_s;
wire   [WIDTH-1:0]      next_offset_count_s_int;
reg    [WIDTH-1:0]      offset_count_s_int;

wire   [WIDTH-1:0]      bin2gray_s_func_out;
wire   [WIDTH-1:0]      next_bin2gray_s;
reg    [WIDTH-1:0]      bin2gray_s;
reg    [WIDTH-1:0]      bin2gray_s_d1;
reg    [WIDTH-1:0]      bin2gray_s_d2;
wire   [WIDTH-1:0]      bin2gray_s_pipe;
reg    [WIDTH-1:0]      bin2gray_l;
wire   [WIDTH-1:0]      bin2gray_cc;

wire   [WIDTH-1:0]      dw_sync_bin2gray_d;
wire   [WIDTH-1:0]      gray2bin_d_func_out;

reg    [WIDTH-1:0]      count_d_int;
wire   [WIDTH-1:0]      count_d_int_xor;

wire   [31:0]           end_value;

  assign end_value = (((1'b1 << WIDTH) - 1) - OFFSET);



// leda off
// verpp-pragma processing_off
`ifdef SYNTHESIS `else
  initial begin
    if ((F_SYNC_TYPE > 0)&&(F_SYNC_TYPE < 8))
       $display("Information: *** Instance %m module is using the <Gray Coded Synchronizer (4)> Clock Domain Crossing Method ***");
  end

`endif
// verpp-pragma processing_on
// leda on

`define DW_FORCED_VALUE           OFFSET[WIDTH-1:0]
`define DW_FORCED_VALUE_BIN2GRAY  FUNC_bin2gray(`DW_FORCED_VALUE)

  assign drs_en_s = en_s;

  // Disable Leda warning 'Possible loss of carry/borrow in addition/subtraction'
  // leda W484 off
  assign next_count_s_adv      = ((OFFSET != 0) && (count_s_int_xor == end_value[WIDTH-1:0])) ?
			          `DW_FORCED_VALUE : (count_s_int_xor+1);
  // leda W484 on

  assign next_count_s_int = (drs_en_s == 1'b1) ? 
                                next_count_s_adv : count_s_int_xor;

  assign next_offset_count_s     = (count_s_int_xor == end_value[WIDTH-1:0]) ?
				     {WIDTH{1'b0}} : (offset_count_s_int + 1);

  assign next_offset_count_s_int = (drs_en_s == 1'b1) ? 
                                       next_offset_count_s : offset_count_s_int;

  
  function [WIDTH-1:0] FUNC_bin2gray ;
    input [WIDTH-1:0]		B;	// input
    begin 
      FUNC_bin2gray  = B ^ { 1'b0, B[WIDTH-1 : 1] }; 
    end
  endfunction

  assign bin2gray_s_func_out = FUNC_bin2gray (next_count_s_int);

  assign next_bin2gray_s = (drs_en_s == 1'b1) ? (bin2gray_s_func_out ^ `DW_FORCED_VALUE_BIN2GRAY) : bin2gray_s;

  // Disable Leda warning 'Constant expression in conditional select'
  // leda W161 off
  assign bin2gray_s_pipe = (PIPE_DELAY == 1) ? bin2gray_s_d1 :
			     (PIPE_DELAY == 2) ? bin2gray_s_d2 : bin2gray_s;
  // leda W161 on


  
// leda off
  always @ (clk_s or bin2gray_s_pipe) begin : frwd_hold_latch_PROC
    // leda S_4C_R off
    // leda CS_5P_R_A off
    if (clk_s == 1'b0)
      bin2gray_l = bin2gray_s_pipe;
    // leda CS_5P_R_A on
    // leda S_4C_R on
  end // frwd_hold_latch_PROC

  assign bin2gray_cc = (((F_SYNC_TYPE&7)>1)&&(TST_MODE==2)&&(test==1'b1))? bin2gray_l : bin2gray_s_pipe;
// leda on

  DWC_gmac_bcm21
   #(WIDTH, F_SYNC_TYPE+8, TST_MODE, VERIF_EN) U_SYNC(
	.clk_d(clk_d),
	.rst_d_n(rst_d_n),
	.init_d_n(init_d_n),
	.data_s(bin2gray_cc),
	.test(test),
	.data_d(dw_sync_bin2gray_d) );

  
  function [WIDTH-1:0] FUNC_gray2bin ;
    input [WIDTH-1:0]		G;	// input
    reg   [WIDTH-1:0]		b;
    reg   [31:0]		i;
    begin 
      b = {G[WIDTH-1], {WIDTH-1{1'b0}}};
      for (i=0 ; i<(WIDTH-1) ; i=i+1) begin
	b [WIDTH - 2 - i] = G[WIDTH - 2 - i] ^ b [WIDTH - 1 - i];
      end // for (i
      FUNC_gray2bin  = b; 
    end
  endfunction

  assign gray2bin_d_func_out = FUNC_gray2bin (dw_sync_bin2gray_d);


  always @ (posedge clk_s or negedge rst_s_n) begin : PROC_source_registers
    if (rst_s_n == 1'b0) begin
      count_s_int          <= {WIDTH{1'b0}};
      offset_count_s_int   <= {WIDTH{1'b0}};
      bin2gray_s           <= {WIDTH{1'b0}};
      bin2gray_s_d1        <= {WIDTH{1'b0}};
      bin2gray_s_d2        <= {WIDTH{1'b0}};
    end else if (init_s_n == 1'b0) begin
      count_s_int          <= {WIDTH{1'b0}};
      offset_count_s_int   <= {WIDTH{1'b0}};
      bin2gray_s           <= {WIDTH{1'b0}};
      bin2gray_s_d1        <= {WIDTH{1'b0}};
      bin2gray_s_d2        <= {WIDTH{1'b0}};
    end else begin
      count_s_int          <= (next_count_s_int ^ OFFSET[WIDTH-1:0]);
      offset_count_s_int   <= next_offset_count_s_int;
      bin2gray_s           <= next_bin2gray_s;
      bin2gray_s_d1        <= bin2gray_s;
      bin2gray_s_d2        <= bin2gray_s_d1;
    end
  end

  // leda W389 off
  always @ (posedge clk_d or negedge rst_d_n) begin : PROC_dest_registers
    if (rst_d_n == 1'b0) begin
      count_d_int          <= {WIDTH{1'b0}};
    end else if (init_d_n == 1'b0) begin
      count_d_int          <= {WIDTH{1'b0}};
    end else begin
      count_d_int          <= gray2bin_d_func_out;
    end
  end
  // leda W389 on

  assign count_s_int_xor = count_s_int ^ OFFSET[WIDTH-1:0];
  // leda W161 off
  assign count_d_int_xor = ((REG_COUNT_D == 1) ? count_d_int : gray2bin_d_func_out) ^ OFFSET[WIDTH-1:0];
  // leda W161 on

  // leda W161 off
  assign count_s         = (REG_COUNT_S == 1)        ? count_s_int_xor : next_count_s_int;
  assign offset_count_s  = (REG_OFFSET_COUNT_S == 1) ? offset_count_s_int : next_offset_count_s_int;
  // leda W161 on
  assign count_d         = count_d_int_xor;


endmodule
