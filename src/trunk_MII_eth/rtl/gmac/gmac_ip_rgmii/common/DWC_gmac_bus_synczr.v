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
//------------------------------------------------------------------------
//
// Release version :  3.50a
// Date             :        $Date: 2007/04/26 $
// File Version     :        $Revision: #6 $
//------------------------------------------------------------------------
// Filename    : DWC_gmac_bus_synczr.v
// Description : Bus Syncronizer with auto updating
//
////////////////////////////////////////////////////////////////////////////////
module DWC_gmac_bus_synczr (
       clk_s, 
	     rst_s_n, 
	     init_s_n, 
	     data_s, 
       ack_s,

	     clk_d, 
       rst_d_n, 
	     init_d_n, 
	     data_d,
       ack_d,

	     test
	     );

 parameter WIDTH        = 2;  
 parameter F_SYNC_TYPE  = 2;	// RANGE 0 to 3
 parameter TST_MODE     = 0;	// RANGE 0 to 2
 parameter VERIF_EN     = 1;  // RANGE 0 to 2
 
 input              clk_s;			// clock input for source domain
 input              rst_s_n;		// active low async. reset in clk_s domain
 input              init_s_n;		// active low sync. reset in clk_s domain
 input [WIDTH-1:0]  data_s;		  // data input 
 
 input              clk_d;			// clock input for destination domain
 input              rst_d_n;		// active low async. reset in clk_d domain
 input              init_d_n;		// active low sync. reset in clk_d domain
 input              test;       // test mode input.
 output [WIDTH-1:0] data_d;		  // data output (active high event)
 output             ack_s; // ack. for data being latched into data hold reg. 
 output             ack_d;      // ack. indicating new data being accepted in dest.
                                // clock domain

// Internal register definitions
 reg [WIDTH-1:0]    data_d;     // Data Sample register in
                                // destination clock domain.
 reg [WIDTH-1:0]    data_hold;  // Data hold register in 
                                // source clock domain
                                                   
 reg                tgl_s;      // Toggle Flag in source domain
 reg                tgl_d;      // Toggle Flag in destination domain
                                                   
 wire               tgl_s2d_sync;// Source toggle synced to destination domain
 wire               tgl_d2s_sync;// Destination toggle synced to source domain
 
  // Acknowledgement for data begin latched into data_hold register
  assign ack_s = (tgl_s == tgl_d2s_sync);
  
  // Input Data hold register
  always @(posedge clk_s or negedge rst_s_n) begin
    if (rst_s_n == 1'b0) begin
      tgl_s     <= 1'b0;
      data_hold <= {WIDTH{1'b0}};
    end  
    else if (init_s_n == 1'b0) begin
      tgl_s     <= 1'b0;
      data_hold <= {WIDTH{1'b0}};
    end 
    else begin
      if (tgl_s == tgl_d2s_sync) begin 
        data_hold <= data_s;
        tgl_s     <= !tgl_s;
      end 
    end
  end       
  
  // Latch data request sync'd to destination clock domain
  DWC_gmac_bcm21
   #(1,F_SYNC_TYPE,TST_MODE,VERIF_EN) toggle_sync_dest (
          .clk_d    (clk_d),
          .rst_d_n  (rst_d_n),
          .init_d_n (init_d_n),
          .data_s   (tgl_s),
          .test     (test),
          .data_d   (tgl_s2d_sync)
                 );

  // ack indicating the new data has been accepted in the destination clock
  assign ack_d = (tgl_d != tgl_s2d_sync);
  
  // Data Sample register
  always @(posedge clk_d or negedge rst_d_n) begin
    if (rst_d_n == 1'b0) begin
      tgl_d   <= 1'b0;
      data_d  <= {WIDTH{1'b0}};
    end else if (init_d_n == 1'b0) begin
      tgl_d   <= 1'b0;
      data_d  <= {WIDTH{1'b0}};
    end else begin
      if (tgl_d != tgl_s2d_sync) begin
        tgl_d  <= !tgl_d;
        data_d <= data_hold;
      end  
    end  
  end 

  // Ack from destination clock Sync'd to source clock domain
  DWC_gmac_bcm21
   #(1,F_SYNC_TYPE,TST_MODE,VERIF_EN) toggle_sync_src (
          .clk_d    (clk_s),
          .rst_d_n  (rst_s_n),
          .init_d_n (init_s_n),
          .data_s   (tgl_d),
          .test     (test),
          .data_d   (tgl_d2s_sync)
                 );


endmodule
