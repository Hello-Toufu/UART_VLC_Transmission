`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: anxu chan
// 
// Create Date:    16:17:14 08/02/2017 
// Design Name:    product
// Module Name:    product 
// Project Name:   product
// Target Devices: 
// Description:
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module product#(
	parameter e1_width = 2,
	parameter e2_width = 2,
	parameter product_width = 2
)(
	input i_clk,
	input i_rst_n,
	input wire signed [e1_width-1:0] i_e1,
	input wire signed [e2_width-1:0] i_e2,
	output  signed [product_width-1:0] o_product
    );
	

//	// product
//	always @(posedge i_clk ) begin
//				if (!i_rst_n) begin
//					o_product <= 0 ;
//				end 
//				else begin
//					o_product = i_e1 * i_e2;
//				end
//			end
	// product
//	always @(posedge i_clk ) begin
//				if (!i_rst_n) begin
//					o_product <= 0 ;
//				end 
//				else begin
////					if ( (i_e1 == 2'b11 && i_e2 == 2'b01) || (i_e1 == 2'b01 && i_e2 == 2'b11)) begin
////						o_product = 2'b11;
////					end
////					else begin
////						o_product = 2'b01;
////					end
//					o_product <= { i_e1[1]^i_e2[1], 1'b1};
//				end
//			end
assign o_product = { i_e1[1]^i_e2[1], 1'b1};

endmodule