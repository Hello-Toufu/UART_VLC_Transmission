// File               : frame_eof_regen.v
// Author             : ZDF
// Created On         : 2019-03-04 
// Last Modified      : 
// Description        : 
`timescale 1ns / 1ps
module frame_eof_regen(
    input               i_clk
    ,input              i_rst_n

    // VLC rx (fpga top)
    ,input 				i_pl_val                    //                                      .startofpacket
    ,input 				i_pl_sof                     //                                      .valid
    ,input 				i_pl_eof                     //                                      .ready
    ,input 	[1:0]		i_pl_be                      //                                      .endofpacket
    ,input	[31:0]		i_pl_data                     //                      sgdma_tx_pcs_out.data
    ,output  			o_pl_rdy                     //    

	// avalon st rx
    ,output             o_ps_val       
    ,output             o_ps_sof       
    ,output             o_ps_eof       
    ,output  [1:0]      o_ps_be        
    ,output  [31:0]     o_ps_data      
    ,input				i_ps_rdy       
);

    reg [11:0]           r_pac_len_cnt;
	reg		r_eof_gen_flag;

    localparam  IDLE       		= 3'd0,
                DATA	        = 3'd1,
                EOF_GEN		    = 3'd2;
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
                if(i_pl_val) begin
                    c_state_next = DATA;
                end
                else begin
                    c_state_next = IDLE;
				end
            end

            //
			DATA     : begin
                if (r_pac_len_cnt > 12'd1518) begin
                    c_state_next = EOF_GEN;
				end
				else if (i_pl_eof) begin
                    c_state_next = IDLE;
				end
                else begin
                    c_state_next = DATA;
				end
            end
            //
			EOF_GEN   : begin
                if (i_ps_rdy) begin
                    c_state_next = IDLE;
                end
                else
                    c_state_next = EOF_GEN; 
            end
        endcase
    end


    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_pac_len_cnt = 12'd0;
        end
        else begin
			if( (r_state==EOF_GEN) || (r_state==IDLE)) begin
				r_pac_len_cnt = 12'd0;
			end
			else if((r_state==DATA) && (i_pl_val)) begin
				r_pac_len_cnt <= r_pac_len_cnt	+	1'b1;
			end
		end
	end
	
	assign o_ps_val 	=	(r_state == EOF_GEN) ? 1'b1 : i_pl_val;
	assign o_ps_sof     =	i_pl_sof ;
    assign o_ps_eof     =	(r_state == EOF_GEN) ? 1'b1 : i_pl_eof; 
    assign o_ps_be      =	i_pl_be  ;
    assign o_ps_data    =	i_pl_data;
    assign o_pl_rdy    =	i_ps_rdy;
endmodule	