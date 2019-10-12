`timescale 1ns / 1ps
// File               : ps_avalon_tx_2_tx_interface.v
// Author             : ZDF
// Created On         : 2019-02-22 15:29
// Last Modified      : 
// Description        : 
module ps_avalon_tx_2_tx_interface(
    input               i_clk
    ,input              i_rst_n

    //avalon st tx
    ,input	[31:0]		i_sgdma_tx_pcs_in_data                             //                      sgdma_tx_pcs_out.data
    ,input 				i_sgdma_tx_pcs_in_valid                            //                                      .valid
    ,output 			o_sgdma_tx_pcs_in_ready                            //                                      .ready
    ,input 				i_sgdma_tx_pcs_in_endofpacket                      //                                      .endofpacket
    ,input 				i_sgdma_tx_pcs_in_startofpacket                    //                                      .startofpacket
    ,input  [1:0]		i_sgdma_tx_pcs_in_empty                            //    

	// from GMAC MTL
    ,output             o_ari_val       
    ,output             o_ari_sof       
    ,output             o_ari_eof       
    ,output  [1:0]      o_ari_be        
    ,output  [31:0]     o_ari_data      
    ,input				i_ari_ack       
    ,output  [14:0]     o_ari_frame_len
    ,output             o_ari_frame_len_val

);
	
	reg	[14:0]	c_ari_frame_len;
	reg 		c_ari_frame_len_val;
	assign	o_ari_frame_len 	= c_ari_frame_len;
	assign	o_ari_frame_len_val = c_ari_frame_len_val;
	
	
    localparam  IDLE       		= 3'd0,
                FRAME_LEN       = 3'd1,
                SOF			    = 3'd2,
                DATA_SYMBOL     = 3'd3;
    reg [2:0]           r_state;
    reg [2:0]           c_state_next;
	
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_state <= `DELAY IDLE;
        end
        else begin
            r_state <= `DELAY c_state_next;
        end
    end
	
	// reg c_sgdma_tx_pcs_in_ready;
	// assign o_sgdma_tx_pcs_in_ready = c_sgdma_tx_pcs_in_ready;
	
    always@( * ) begin
        c_state_next = r_state;
        case(r_state)
            //
			IDLE          : begin
                //wait only the beginning of the packet to start
                //move only the frame len is avaiable
                if(i_sgdma_tx_pcs_in_valid) begin
                    c_state_next = FRAME_LEN;
                end
                else begin
                    c_state_next = IDLE;
				end
            end
				//
            FRAME_LEN     : begin
                    c_state_next = SOF;
            end
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
                if (i_ari_ack && i_sgdma_tx_pcs_in_endofpacket) begin
                    c_state_next = IDLE;
                end
                else
                    c_state_next = DATA_SYMBOL; 
            end
        endcase
    end

	//first word is frame len 
	assign o_sgdma_tx_pcs_in_ready = ((r_state == FRAME_LEN)) ?  1'b1: i_ari_ack;
	
	assign  o_ari_val	=	((r_state == IDLE)||(r_state == FRAME_LEN))	?	1'b0	:	i_sgdma_tx_pcs_in_valid;
	assign	o_ari_data	=	i_sgdma_tx_pcs_in_data;
	assign	o_ari_sof	=	(r_state == SOF) 									?  i_sgdma_tx_pcs_in_valid	:	1'b0;
	assign  o_ari_eof	=	i_sgdma_tx_pcs_in_endofpacket;
	assign	o_ari_be	=	~i_sgdma_tx_pcs_in_empty;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            c_ari_frame_len 	<= 	15'd0;
			c_ari_frame_len_val	<=	1'b0;
        end
        else begin
			if( (r_state == FRAME_LEN) ) begin
				c_ari_frame_len 	<=	i_sgdma_tx_pcs_in_data[14:0];
				c_ari_frame_len_val <=	1'b1;
			end
			else if (r_state == SOF) begin
				c_ari_frame_len_val <=	1'b1;
			end
			else
				c_ari_frame_len_val <= 	1'b0;
		end
    end	
	
endmodule	
	
	