`timescale 1ns / 1ps
// File               : .v
// Author             : ZDF
// Created On         : 2019-08-12 
// Last Modified      : 
// Description        : 
//                  _   _   _   _   _   _   _   _   _   _
// Clock           | |_| |_| |_| |_| |_| |_| |_| |_| |_| 
//                    _   _       _                      
// o_fifo_rd_en    __| |_| |_____| |_____________________
//                      _____________________            
// o_ari_val       ____|                     |___________
//                        _       _         _            
// i_ari_ack       ______| |_____| |_______| |___________
//                 ______________________________________
// r_tx_symbol_cnt ______________________________________
//                 ______________________________________
// r_state         ______________________________________
// modified 20190930 : add the function of time-out
// if number of input data is less than FSMC_FRAME_LEN_8bit, send these data after waiting for i_wait_time_len
module fifo_2_pcs_tx_interface#(
    parameter          FSMC_FRAME_LEN_8bit		= 16'd1024
    //,parameter          P_WAIT_TIME				= 16'd64
)(
    input               i_clk
    ,input              i_rst_n
	,input 	[7:0]		i_wait_time_len
	
    //fifo
    ,output 			o_fifo_rd_en                      //                                      
    ,input	[7:0]		i_fifo_rd_data                    //                      
    ,input 				i_fifo_rd_full                    //                                      
    ,input 				i_fifo_rd_empty                   //                                      
    ,input  [11:0]		i_fifo_rdusedw                    //    

	// pcs_tx
    ,output             o_ari_val       
    ,output             o_ari_sof       
    ,output             o_ari_eof       
    ,output  [1:0]      o_ari_be        
    ,output  [7:0]     o_ari_data      
    ,input				i_ari_ack
	 
    ,output  [14:0]     o_ari_frame_len
    ,output             o_ari_frame_len_val

);
	reg	[14:0]	r_ari_frame_len;
	reg 		r_ari_frame_len_val;
	assign	o_ari_frame_len 	= r_ari_frame_len;
	assign	o_ari_frame_len_val = r_ari_frame_len_val;
	
	
	reg	[7:0]	r_wait_cnt;
	reg	[9:0]	r_fifo_rdusedw_d1;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_wait_cnt <= 0;
			r_fifo_rdusedw_d1 <= 0;
        end
        else begin
			r_fifo_rdusedw_d1 <= i_fifo_rdusedw;
			if ( i_fifo_rdusedw == 0 ) begin
				r_wait_cnt <= 0;
			end
			else if (i_fifo_rdusedw != r_fifo_rdusedw_d1) begin
				r_wait_cnt <= 0;
			end
			else begin
				r_wait_cnt <= r_wait_cnt + 1'b1;
			end
			
        end
    end	
	
    localparam  IDLE       		= 3'd0,
                EOF      = 3'd1,
                SOF			    = 3'd2,
                DATA_SYMBOL     = 3'd3;
    reg [2:0]           r_state;
    reg [2:0]           r_state_d1;
    reg [2:0]           c_state_next;
	//fsm
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_state <= `DELAY IDLE;
        end
        else begin
            r_state <= `DELAY c_state_next;
        end
    end
    always@( * ) begin
        c_state_next = r_state;
        case(r_state)
            //
			IDLE          : begin
                if( (i_fifo_rdusedw>=(FSMC_FRAME_LEN_8bit) ) || i_fifo_rd_full) begin
                    c_state_next = SOF;
                end
                else if ( (i_fifo_rdusedw>=1 ) && r_wait_cnt >= i_wait_time_len ) begin
					c_state_next = SOF;
				end
                else begin
                    c_state_next = IDLE;
				end
            end
			// not used in this project
            // FRAME_LEN     : begin
                    // c_state_next = SOF;
            // end
            //
			SOF     : begin
                if (i_ari_ack) begin
                    c_state_next = DATA_SYMBOL;
				end
                else begin
                    c_state_next = SOF;
				end
            end
            //
			DATA_SYMBOL   : begin
                if (i_ari_ack && (r_tx_symbol_cnt == (r_ari_frame_len) -2)) begin
                    c_state_next = EOF;
                end
                else
                    c_state_next = DATA_SYMBOL; 
            end
			//
			EOF     : begin
                if (i_ari_ack) begin
                    c_state_next = IDLE;
				end
                else begin
                    c_state_next = EOF;
				end
            end
        endcase
    end
	//gen of frame len and the val
	// if there is 1024 , len = 1024
	// else = i_fifo_rdusedw * 4
	always@(posedge i_clk or negedge i_rst_n) begin
		if (~i_rst_n) begin
			r_ari_frame_len 	<= 15'd0;
			r_ari_frame_len_val <= 1'b0;
		end
		else begin
			if ( (r_state == EOF)) begin
				r_ari_frame_len <= 15'd0;
				r_ari_frame_len_val <= 1'b0;
			end
			else if ((r_state == IDLE) ) begin
					r_ari_frame_len_val <= 1'b1;
					if ( (i_fifo_rdusedw>=(FSMC_FRAME_LEN_8bit) ) || i_fifo_rd_full ) begin
						r_ari_frame_len <= FSMC_FRAME_LEN_8bit;
					end
					else if ( r_wait_cnt >= i_wait_time_len ) begin
						if (i_fifo_rdusedw <= 15 ) begin
							r_ari_frame_len <= 16; //min len of frame is 16 bytes
						end
						else begin  //20191008
							r_ari_frame_len <=  i_fifo_rdusedw ;
							// case(i_fifo_tx_wr_remainder)
								// 2'b00 : r_ari_frame_len <=  i_fifo_rdusedw << 2;
								// 2'b01 : r_ari_frame_len <= (i_fifo_rdusedw << 2) - 2'd3;
								// 2'b10 : r_ari_frame_len <= (i_fifo_rdusedw << 2) - 2'd2;
								// 2'b11 : r_ari_frame_len <= (i_fifo_rdusedw << 2) - 2'd1;
							// endcase
						end
					end	
			end
		end
	end
	
	//state delay
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_state_d1 <= `DELAY IDLE;
        end
        else begin
            r_state_d1 <= `DELAY r_state;
        end
    end
	
    reg [15:0]           r_tx_symbol_cnt;
	always@(posedge i_clk or negedge i_rst_n) begin
		if (~i_rst_n) begin
			r_tx_symbol_cnt <= 16'd0;
		end
		else begin
			if ((r_state == IDLE)) begin
				r_tx_symbol_cnt <= 16'd0;
			end
			else if (i_ari_ack) begin
				r_tx_symbol_cnt <= r_tx_symbol_cnt + 1'b1;
			end
			
		end
	end
	// o_ari_val will be 0 when i_ari_ack==1 and c_fifo_rd_en=0
    reg     r_ari_val;
	assign	o_ari_val = r_ari_val;
	always@(posedge i_clk or negedge i_rst_n) begin
		if (~i_rst_n) begin
			r_ari_val <= 1'd0;
		end
		else begin
			if ( c_fifo_rd_en == 1'b1 ) begin
				r_ari_val <= 1'd1;
			end
			else if ( i_ari_ack == 1'b1 && c_fifo_rd_en == 1'b0 ) begin
				r_ari_val <= 1'd0;
			end
			else begin
				r_ari_val <= r_ari_val;
			end
		end
	end
	
	//
	assign 	c_fifo_rd_en = 	(r_state == EOF) ?  1'b0 :
										(r_state == SOF && r_state_d1 == IDLE) ?  1'b1 : i_ari_ack;
	assign 	o_fifo_rd_en = 	c_fifo_rd_en;
	
	assign	o_ari_data	=	i_fifo_rd_data;//i_fifo_rd_empty ? 32'd0 : 
	assign	o_ari_sof	=	(r_state == SOF) ?  r_ari_val : 1'b0 ; //sof need be 1 untill ack =1 (like val signal)
	assign  o_ari_eof	=	(r_state == EOF) ?  i_ari_ack : 1'b0 ;

	
endmodule	
	
	