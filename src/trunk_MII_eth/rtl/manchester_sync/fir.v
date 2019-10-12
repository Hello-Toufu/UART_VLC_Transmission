`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: anxu chan
// 
// Create Date:    16:17:14 08/02/2017 
// Design Name:    FIR filter
// Module Name:    fir 
// Project Name:   FirDesign
// Target Devices: Xilinix V5
// Description: fir res file
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fir#(
	parameter word_width = 2,
	parameter order = 512
)(
	input clk,
	input rst_n,
	input wire signed [word_width-1:0] filter_in,
	output reg signed [15:0] filter_out
    );
	

	// define delay unit , input width is 2  , filter order is 512
	reg signed [word_width-1:0] delay_pipeline[order-1:0];
	
	// define coef
	localparam syn_header = 64'b1001010101101010010110100110101010100110010101100101100110011010;
	wire signed [word_width-1:0]  coef[order-1:0];
    generate
	genvar j;
	genvar i;
        for(j=0; j<64; j=j+1) begin: define_coef
				for(i=0; i<8; i=i+1) begin:  define_coef2
					assign coef[j*8+i] = {~syn_header[63-j],1'b1};
				end
        end
    endgenerate

	// define multipler
	wire signed [word_width-1:0]		r_product[order-1:0];

	// define sum buffer
	//reg signed [7:0]  				sum_buf[31:0];	

	// define input data buffer
	reg signed [word_width-1:0] data_in_buf;

	// data buffer
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			data_in_buf <= 0;
		end
		else begin
			data_in_buf <= filter_in;
		end
	end

	// delay units pipeline
	 always @(posedge clk or negedge rst_n) begin
		 if (!rst_n) begin
			 delay_pipeline[0] <= 0 ;
		 end 
		 else begin
			 delay_pipeline[0] <= data_in_buf ;
		 end
	 end
	// delay units pipeline
     generate
			genvar a;
         for(a=1; a<order; a=a+1) begin: delay_units
			 always @(posedge clk or negedge rst_n) begin : delay_units1
				 if (!rst_n) begin : delay_units1
					 //for(int a=1; a<order; a=a+1) 
					 delay_pipeline[a] <= 0 ;
				 end 
				 else begin : delay_units
					 //for(int a=1; a<order; a=a+1) 
					 delay_pipeline[a] <= delay_pipeline[a-1] ;
				 end
			 end
         end
     endgenerate
	 
//	delay1 m_delay(
//		.i_clk				(clk)
//		,.i_data			(data_in_buf)
//		,.o_data_d1			(delay_pipeline[0])
//	);
//    generate
//	 genvar i;
//        for(i=1; i<order; i=i+1) begin: delay_units
//			delay1 m_delay(
//				.i_clk				(clk)
//				,.i_data			(delay_pipeline[i-1])
//				,.o_data_d1			(delay_pipeline[i])
//			);
//        end
//    endgenerate

	// implement product with coef 
    // generate
        // for(i=0; i<order; i=i+1) begin: products
			// always @(posedge clk or negedge rst_n) begin
				// if (!rst_n) begin
					// product[i] <= 0 ;
				// end 
				// else begin
					// product[i] = coef[i] * delay_pipeline[1];
				// end
			// end
        // end
    // endgenerate
    generate
	 //genvar i;
        for(i=0; i<order; i=i+1) begin: product_units
			product m_product(
				.i_clk					(clk)
				,.i_rst_n				(rst_n)
				,.i_e1					(coef[i])
				,.i_e2					(delay_pipeline[i])
				,.o_product				(r_product[i])
			);
        end
    endgenerate
	
	// define sum buffer
	reg signed [3:0]  				sum_buf[128:0];	
	// accumulation
	// implement product with coef 
    generate
        for(i=0; i<128; i=i+1) begin : sum
			 always @(posedge clk or negedge rst_n) begin
				 if (!rst_n) begin
					sum_buf[i] <= 0;
				 end
				 else begin
				sum_buf[i] <= 	r_product[0+4*i] + r_product[1+4*i]+  r_product[2+4*i]+  r_product[3+4*i];
//				+ r_product[4+16*i]
//				+ r_product[5+16*i]+ 	r_product[6+16*i]+  r_product[7+16*i]+  r_product[8+16*i]+  r_product[9+16*i]+ r_product[10+16*i]
//				+ r_product[11+16*i]+ r_product[12+16*i]+ r_product[13+16*i]+ r_product[14+16*i]+ r_product[15+16*i];
//				+ r_product[16+32*i]+ r_product[17+32*i]+ r_product[18+32*i]+ r_product[19+32*i]+ r_product[20+32*i]
//				+ r_product[21+32*i]+ r_product[22+32*i]+ r_product[23+32*i]+ r_product[24+32*i]+ r_product[25+32*i]
//				+ r_product[26+32*i]+ r_product[27+32*i]+ r_product[28+32*i]+ r_product[29+32*i]+ r_product[30+32*i]
//				+ r_product[31+32*i];
				 end
			 end
         end
     endgenerate
	  
	reg  signed [5:0]  				sum_buf_d0[31:0];	
    generate
        for(i=0; i<32; i=i+1) begin : sum0
			 always @(posedge clk or negedge rst_n) begin
				 if (!rst_n) begin
					sum_buf_d0[i] <= 0;
				 end
				 else begin
					sum_buf_d0[i] <= 	sum_buf[0+4*i] + sum_buf[1+4*i]+  sum_buf[2+4*i]+  sum_buf[3+4*i];
												//+sum_buf[4+8*i] + sum_buf[5+8*i]+  sum_buf[6+8*i]+  sum_buf[7+8*i];
				 end
			 end
         end
     endgenerate	  
//    generate
//        for(i=0; i<16; i=i+1) begin : sum
//			assign	sum_buf[i] = 	r_product[0+32*i] + r_product[1+32*i]+  r_product[2+32*i]+  r_product[3+32*i]+ r_product[4+32*i]
//				+ r_product[5+32*i]+ 	r_product[6+32*i]+  r_product[7+32*i]+  r_product[8+32*i]+  r_product[9+32*i]+ r_product[10+32*i]
//				+ r_product[11+32*i]+ r_product[12+32*i]+ r_product[13+32*i]+ r_product[14+32*i]+ r_product[15+32*i]
//				+ r_product[16+32*i]+ r_product[17+32*i]+ r_product[18+32*i]+ r_product[19+32*i]+ r_product[20+32*i]
//				+ r_product[21+32*i]+ r_product[22+32*i]+ r_product[23+32*i]+ r_product[24+32*i]+ r_product[25+32*i]
//				+ r_product[26+32*i]+ r_product[27+32*i]+ r_product[28+32*i]+ r_product[29+32*i]+ r_product[30+32*i]
//				+ r_product[31+32*i];
//        end
//    endgenerate

	reg  signed [15:0]  				sum_buf_d1[7:0];	
    generate
        for(i=0; i<8; i=i+1) begin : sum1
			 always @(posedge clk or negedge rst_n) begin
				 if (!rst_n) begin
					sum_buf_d1[i] <= 0;
				 end
				 else begin
					sum_buf_d1[i] <= 	sum_buf_d0[0+4*i] + sum_buf_d0[1+4*i]+  sum_buf_d0[2+4*i]+  sum_buf_d0[3+4*i];
												//+sum_buf[4+8*i] + sum_buf[5+8*i]+  sum_buf[6+8*i]+  sum_buf[7+8*i];
				 end
			 end
         end
     endgenerate

	reg  signed [15:0]  				sum_buf_d2[1:0];	
    generate
        for(i=0; i<2; i=i+1) begin : sum2
			 always @(posedge clk or negedge rst_n) begin
				 if (!rst_n) begin
					sum_buf_d2[i] <= 0;
				 end
				 else begin
					sum_buf_d2[i] <= 	sum_buf_d1[0+4*i] + sum_buf_d1[1+4*i]+  sum_buf_d1[2+4*i]+  sum_buf_d1[3+4*i];
												//+sum_buf[4+8*i] + sum_buf[5+8*i]+  sum_buf[6+8*i]+  sum_buf[7+8*i];
				 end
			 end
         end
     endgenerate
	 
	
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			filter_out = 0;
		end
		else begin
			filter_out =	 sum_buf_d2[0]
								+sum_buf_d2[1];
//								+filter_temp[2]
//								+filter_temp[3];
//								+filter_temp[4]
//								+filter_temp[5]
//								+filter_temp[6]
//								+filter_temp[7];
//								+sum_buf[8]
//								+sum_buf[9]
//								+sum_buf[10]
//								+sum_buf[11]
//								+sum_buf[12]
//								+sum_buf[13]
//								+sum_buf[14]
//								+sum_buf[15];
		end
	end

endmodule