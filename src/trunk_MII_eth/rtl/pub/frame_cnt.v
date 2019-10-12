// File               : frame_cnt.v
// Author             : Dongfang Zhang
// Created On         : 09/06/2019 Fri
// Last Modified      : 09/06/2019 Fri
// Description        : 
//  counter of frame
module frame_cnt (
    input               i_rst_n        //the external async reset, reset all the internal modules
    ,input              i_clk        //clock
    ,input              i_data_en        //data en
    ,output [15:0]      o_frame_cnt    

);	
	(* preserve *) reg r_data_en_d1 /*synthesis keep*/;
	always @ (posedge i_clk or negedge i_rst_n)
	begin
	   if (!i_rst_n)
		   r_data_en_d1 <= 1'd0;
	   else begin
		   r_data_en_d1 <= i_data_en;
	   end
	end
   
	(* keep *) reg [31:0] r_frame_cnt /* synthesis preserve */;
	always @ (posedge i_clk or negedge i_rst_n)
	begin
	   if (!i_rst_n)
		   r_frame_cnt <= 16'd0;
	   else begin
		   if ( i_data_en == 1'b1 && r_data_en_d1 == 1'b0) begin // posedge of sof
			   r_frame_cnt <= r_frame_cnt + 1'b1;
		   end
	   end
	end
	assign o_frame_cnt = r_frame_cnt;

endmodule