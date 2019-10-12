// File               : rx_interface.v
// Author             : Tao Wu
// Created On         : 2017-06-23 14:41
// Last Modified      : 2017-07-05 14:15
// Description        : 
// replace the sof frame len with the preamble
// generate eof signal
                        
module remove_chec_symbol#(
    parameter           RS_N = `RS_N
    ,parameter          RS_K = `RS_K)
(
    //rs decoder out
    input               i_clk
    ,input              i_rst_n
    ,input  [7:0]      	i_rs_de_data
    ,input              i_rs_de_data_valid
    ,input              i_rs_de_sof
    ,input              i_rs_de_eof

    //after removing the check symbols
    ,output  [7:0]     	o_rs_re_data      
    ,output             o_rs_re_data_valid      
    ,output             o_rs_re_sof       
    ,output             o_rs_re_eof       

);
	reg [7:0]	r_rs_de_data_d1;
	reg 		r_rs_de_data_valid_d1;
	reg 		r_rs_de_sof_d1;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_de_data_d1 <= 8'd0; 
			r_rs_de_data_valid_d1 <= 1'b0;
			r_rs_de_sof_d1 <= 1'b0;
        end
        else begin	
			r_rs_de_data_d1  		<= i_rs_de_data;
			r_rs_de_data_valid_d1 	<= i_rs_de_data_valid;
			r_rs_de_sof_d1		 	<= i_rs_de_sof;

        end
    end	
	
    reg [8:0]  	r_rs_symbol_cnt;	
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_symbol_cnt <= 9'd0; 
        end
        else begin	
			if (i_rs_de_sof) begin
				r_rs_symbol_cnt <= 9'd0; 
			end
			else if (i_rs_de_data_valid) begin
				r_rs_symbol_cnt <= r_rs_symbol_cnt +1'b1;
			end
        end
    end	
    assign o_rs_re_data 		= r_rs_de_data_d1;
	assign o_rs_re_data_valid 	= ( r_rs_symbol_cnt< (`RS_K) ) ? r_rs_de_data_valid_d1 : 1'b0;
	assign o_rs_re_sof 			= r_rs_de_sof_d1;
	assign o_rs_re_eof 			= ( r_rs_symbol_cnt == (`RS_K-1) ) ? r_rs_de_data_valid_d1 : 1'b0;


endmodule

