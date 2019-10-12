`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: anxu chan
// 
// Create Date:    16:17:14 08/02/2017 
// Design Name:    delay
// Module Name:    delay 
// Project Name:   delay
// Target Devices: 
// Description: delay 1 timeslot
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module delay1#(
	parameter word_width = 2
)(
	input i_clk,
	input wire signed [word_width-1:0] i_data,
	output reg signed [word_width-1:0] o_data_d1
    );
	

	// delay units pipeline
	always @(posedge i_clk ) begin
			o_data_d1 <= i_data ;
	end


endmodule