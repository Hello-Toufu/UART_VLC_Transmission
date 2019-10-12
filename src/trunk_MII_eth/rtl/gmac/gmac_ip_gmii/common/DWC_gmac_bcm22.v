
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
// Filename    : DWC_gmac_bcm22.v
// Author      : Bruce Dean      June 24, 2004
// Description : DWC_gmac_bcm22.v Verilog module for DWC_gmac
//
// DesignWare IP ID: ac263890
//
////////////////////////////////////////////////////////////////////////////////
module DWC_gmac_bcm22 (
             clk_s, 
	     rst_s_n, 
	     init_s_n, 
	     event_s, 

	     clk_d, 
             rst_d_n, 
	     init_d_n, 
	     event_d,

	     test
	     );

 parameter REG_EVENT    = 1;	// RANGE 0 to 1
 parameter F_SYNC_TYPE  = 2;	// RANGE 0 to 4
 parameter TST_MODE     = 0;	// RANGE 0 to 2
 parameter VERIF_EN     = 1;    // RANGE 0 to 2
 parameter PULSE_MODE   = 0;    // RANGE 0 to 3
 
input  clk_s;			// clock input for source domain
input  rst_s_n;			// active low async. reset in clk_s domain
input  init_s_n;		// active low sync. reset in clk_s domain
input  event_s;			// event pulse input (active high event)

input  clk_d;			// clock input for destination domain
input  rst_d_n;			// active low async. reset in clk_d domain
input  init_d_n;		// active low sync. reset in clk_d domain
input  test;                    // test mode input.
output event_d;			// event pulse output (active high event)
reg    next_tgl_event_s;
wire   tgl_event_cc;
reg    tgl_event_s;
reg    event_s_d;
reg    tgl_event_l;
wire   dw_sync_data_d;
reg    sync_event_out;	  // history for edge detect
wire   next_event_d_q;	  // event seen via edge detect (before registered)
reg    event_d_q;	  // registered version of event seen
wire   event_s_pet;
wire   event_s_net;
wire   event_s_tgl;



// leda off
// verpp-pragma processing_off
`ifdef SYNTHESIS `else
  initial begin
    if ((F_SYNC_TYPE > 0)&&(F_SYNC_TYPE < 8))
       $display("Information: *** Instance %m module is using the <Toggle Type Event Sychronizer (2)> Clock Domain Crossing Method ***");
  end

`endif
// verpp-pragma processing_on
// leda on

// leda W161 off
  always @ (event_s or tgl_event_s or event_s_pet or event_s_net)
    if(PULSE_MODE == 0)
      next_tgl_event_s = tgl_event_s ^ event_s ;			 
    else if(PULSE_MODE == 1)
      next_tgl_event_s = tgl_event_s ^ event_s_pet;
    else if(PULSE_MODE == 2)
      next_tgl_event_s = tgl_event_s ^ event_s_net;
    else if(PULSE_MODE == 3)
      next_tgl_event_s = tgl_event_s ^ (event_s_net | event_s_pet);
// leda W161 on
 assign event_s_pet =  event_s & ! event_s_d;
 assign event_s_net = !event_s &   event_s_d;
 assign event_s_tgl = tgl_event_s ^ event_s_pet;
 
  always @ (posedge clk_s or negedge rst_s_n) begin : event_lauch_reg_PROC
    if (rst_s_n == 1'b0) begin
      tgl_event_s <= 1'b0;
      event_s_d   <= 1'b0;
    end else if (init_s_n == 1'b0) begin
      tgl_event_s <= 1'b0;
      event_s_d   <= 1'b0;
    end else begin
      tgl_event_s <= next_tgl_event_s;
      event_s_d   <= event_s;
    end
  end // always : event_lauch_reg_PROC
  

  
  
// leda off
  always @ (clk_s or tgl_event_s) begin : frwd_hold_latch_PROC
    // leda S_4C_R off
    // leda CS_5P_R_A off
    if (clk_s == 1'b0)
      tgl_event_l = tgl_event_s;
    // leda CS_5P_R_A on
    // leda S_4C_R on
  end // frwd_hold_latch_PROC

  assign tgl_event_cc = (((F_SYNC_TYPE&7)>1)&&(TST_MODE==2)&&(test==1'b1))? tgl_event_l : tgl_event_s;
// leda on

  DWC_gmac_bcm21
   #(1, F_SYNC_TYPE+8, TST_MODE, VERIF_EN) U_SYNC(
	.clk_d(clk_d),
	.rst_d_n(rst_d_n),
	.init_d_n(init_d_n),
	.data_s(tgl_event_cc),
	.test(test),
	.data_d(dw_sync_data_d) );
 
  // leda W389 off
  always @ (posedge clk_d or negedge rst_d_n) begin : second_sync_PROC
    if (rst_d_n == 1'b0) begin
      sync_event_out <= 1'b0;
      event_d_q      <= 1'b0;
    end else if (init_d_n == 1'b0) begin
      sync_event_out <= 1'b0;
      event_d_q      <= 1'b0;
    end else begin
      sync_event_out <= dw_sync_data_d;
      event_d_q      <= next_event_d_q;
    end
  end // always
  // leda W389 on


  assign next_event_d_q = sync_event_out ^ dw_sync_data_d;

// leda W161 off
  assign event_d = (REG_EVENT == 0)? next_event_d_q : event_d_q;
// leda W161 on
endmodule
