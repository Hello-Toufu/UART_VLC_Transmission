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
// File Version     :        $Revision: #9 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// gmrr (gmrr.v)
//
// DESCRIPTION: This is the recieve module of the RGMII block.
//--------------------------------------------------------------------------


module DWC_gmac_rgmii_gmrr (
            rst_clk_rx_n,    
                            clk_rx_i,          
                            rst_clk_rx_180_n,    
                            clk_rx_180_i,          
                            rgmii_rxd_i,        
                            rgmii_rctl_i,       
                            gmrt_crs,   
                            gmii_rxd,           
                            gmii_col,           
                            gmii_rxdv,          
                            gmii_rxer,          
                            gmii_crs,           
                            link_status,        
                            link_speed,         
                            link_mode
                            );


// Input port declaration

input        clk_rx_i;        // Input recive clock. Can be 125/25/2.5 MHz
input        clk_rx_180_i;    // Out of phase w.r.t. clk_rx_i
input 	     rst_clk_rx_180_n;  // Active low reset signal 
input 	     rst_clk_rx_n;  // Active low reset signal 

input [3:0]  rgmii_rxd_i; // Recieve data from the PHY block. 
// The data latched on the rising edge is 
// given out to MAC as lower 4 data bits whereas the data latched on the 
// falling edge is given as the upper 4 data bits. For 10/100 only the data 
// at the rising edge is latched and given out as lower 4 bits. 

input        rgmii_rctl_i; // Recieve control signal from the PHY block. 
// The input value latched at the 
// rising  edge is given as gmii_rxdv to the MAC block and the input value at 
// the falling edge is exored with gmii_rxdv and given out as gmii_rxer

input        gmrt_crs;   // Transmit enable signal from the GMAC transmit block. 


// Output port declaration

output [7:0] gmii_rxd; // Output recieve data from RGMII block to the MAC block.
// Output changes only at the rising edge of the recieve clock.
// In 10/100 mode, the upper nibble is set to 4'h0.

output       gmii_rxdv;     // Recieve data valid signal to MAC synchronous 
                            // to rising edge of recieve clock.

output       gmii_rxer;     // Recieve error output synchronous 
                            // to rising edge of recieve clock.

output       gmii_col;      // Asynchronous Collision signal output to GMAC block
output       gmii_crs;      // Asynchronous carrier sense output

output       link_status;   // Indicates whether link is up(1) or down(0)
output [1:0] link_speed;    // Indicates whether the recieve clock is 
	    		    // 125/25/2.5 MHz (00=> 2.5, 01=> 25, 10=> 125)
output       link_mode;     // Indicates the duplex mode (0=> half,1=> full)


// Register decalaration for the output ports
reg [7:0]    gmii_rxd;
reg          gmii_rxdv;
reg          gmii_rxer;
reg          link_status;
reg [1:0]    link_speed;
reg          link_mode;

// Internal register declaration
reg [3:0]  rxd_low_nibble;  // Lower nibble of the gmii_rxd output. 
reg [3:0]  rxd_high_nibble; // Upper nibble of the gmii_rxd output.

reg        rxdv_int;     // Internal value of rxdv. gmii_rxdv is 1 clock 
                         // delayed value of rxdv_int

reg        rctl_neg;     // value of rgmii_rctl_i at the falling edge
reg        crs_r;

// wire declaration

wire [7:0] rxd_int;    // Internal value of recieve data
wire       rxer_int;   // Internal value of gmii_rxdv XOR rctl_neg
wire       crs_int;    // Internal derived value of carrier sense 
wire       crs_int_gig ;
wire       crs_int_com ;

// Data & Control bits latching
// Latch the lower nibble & rctl signal at the rising edge  
  always @(`RX_RST_MODE) begin
    if(!rst_clk_rx_n) begin
      rxd_low_nibble <= 4'h0;
      rxdv_int       <= 1'b0;
    end 
    else begin         
      rxd_low_nibble <= rgmii_rxd_i;
      rxdv_int       <= rgmii_rctl_i;
    end
  end

// Latch the upper nibble & rctl during falling edge
  always @(`RX_180_RST_MODE) begin
    if(!rst_clk_rx_180_n) begin
      rxd_high_nibble <= 4'h0;
      rctl_neg        <= 1'b0;
    end 
    else begin
      rctl_neg        <= rgmii_rctl_i;
      rxd_high_nibble <= rgmii_rxd_i;
    end
  end

  assign rxd_int[3:0] = rxd_low_nibble;
  assign rxd_int[7:4] = rxd_high_nibble;

  assign rxer_int =  rctl_neg ^ rxdv_int ;

//Drive the GMII output at rising edge
  always @(`RX_RST_MODE) begin
    if(!rst_clk_rx_n) begin
      gmii_rxd   <= 8'h00;
      gmii_rxdv  <= 1'b0; 
      gmii_rxer  <= 1'b0;
    end 
    else begin            
      gmii_rxd   <= rxd_int;
      gmii_rxdv  <= rxdv_int; 
      gmii_rxer  <= rxer_int ;
    end
  end

// gmii_crs
// gmii_crs is asserted in the following cases:
// 1.  when gmii_rxdv is true
// 2.  when gmii_rxdv is false, gmii_rxer is true and a value of FF exist on
//     gmii_rxd simultaneously (0F in 10/100 mode)
// 3.  when carrier extend, carrier extend error applicable to Gigabit mode
// 4.  when false carrier occurs
// 5.  When gmrt_crs is high

  assign crs_int_gig = (rxd_int == 8'h1F || rxd_int == 8'h0F) ;


  assign crs_int_com = (rxd_high_nibble == 4'hF & rxd_int[3:0] == 4'hF) ||
                       (rxd_high_nibble == 4'h0 & rxd_int[3:0] == 4'hE);

  assign crs_int = ((rxdv_int == 1'b1) ||                          
                   ((rxdv_int == 1'b0) && (rxer_int == 1'b1) &&
		               (crs_int_gig || crs_int_com)));    
	   
  always @(`RX_RST_MODE) begin
    if(!rst_clk_rx_n) begin
      crs_r <= 1'b0;
    end
    else begin
      crs_r <= crs_int;
    end
  end

// Final CRS output; Is asynchronous due to OR'ing with gmrt_crs
  assign gmii_crs = crs_r || gmrt_crs; 

// gmii_col is asserted when gmrt_crs is high and crs_r
// is high; Is asynchronous due to AND'ing with gmrt_crs
  assign gmii_col = gmrt_crs & crs_r ; 
 	
// link signals
// link signals is the value of bit [3:0] of rxd_int when rxdv_int and
// rxer_int are both 0 (i.e. during normal inter frame)

  always @(`RX_RST_MODE) begin
    if(!rst_clk_rx_n) begin
      link_speed  <= 2'b00;
      link_mode   <= 1'b0;
      link_status <= 1'b0;
    end
    else if (rxdv_int == 1'b0 && rxer_int == 1'b0) begin
      link_speed     <= rxd_int[2:1];
      link_mode      <= rxd_int[3];
      link_status    <= rxd_int[0];
    end
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
//
//			End of file "gmrr.v"
//
/////////////////////////////////////////////////////////////////////////////
