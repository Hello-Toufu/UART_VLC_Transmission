`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ZDF
// 
// Create Date: 2019/03/15
// Design Name: 
// Module Name: pac_chek
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// local cnt is generated as a compairision with incoming data.
// good word num ++ as the inconming data matching the local cnt
// 20190327 add the cnt for rec pac num and good rec num 
//////////////////////////////////////////////////////////////////////////////////

module pac_chek(
        input   			i_rst_n
		
		,input              i_pac_chek_clk
		,input  [31:0]      i_pac_chek_data
		,input              i_pac_chek_data_valid
		,input              i_pac_chek_sof
		
		,output [31:0]      o_good_word_num
		,output [31:0]      o_good_frame_num 
		,output [31:0]      o_frame_num 		
    );
	
    parameter   P_IDLE  = 2'd0;
    parameter   P_DATA  = 2'd1;
    parameter   P_EOF  = 2'd2;
    parameter   P_WAIT  = 2'd3;

    parameter   FRAME_LEN_VAL   = 32'd40;

	
    (*KEEP = "TRUE"*) reg   [1:0]   	r_state;
    (*KEEP = "TRUE"*) reg   [31:0]   	r_frame_len_cnt;
    (*KEEP = "TRUE"*) reg   [31:0]   	r_good_word_num;

	// 20190327
    (*KEEP = "TRUE"*) reg   [31:0]   	r_good_frame_num;
    (*KEEP = "TRUE"*) reg   [31:0]   	r_frame_num;

	
    //FSM controller
    always @ (posedge i_pac_chek_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_state <= P_IDLE;
        else
        begin
            case (r_state)
                P_IDLE: begin
                    if (i_pac_chek_data_valid && (i_pac_chek_data == 32'd0))
                        r_state <= P_DATA;
                    else ;
                end
                
                P_DATA: begin
                    if ((r_frame_len_cnt >= (FRAME_LEN_VAL ))  )// need watch dog
                        r_state <= P_WAIT;
                    else ;
                end
				
                P_WAIT: begin
                    r_state <= P_IDLE;
                end
                
                default: r_state <= P_IDLE;
            endcase
        end
    end	
	
    //frame length counter
    always @ (posedge i_pac_chek_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_frame_len_cnt <= 16'd0;
        else begin
            if ( (r_state == P_DATA)  ) begin
                if (i_pac_chek_data_valid)
                    r_frame_len_cnt <= r_frame_len_cnt + 1'b1;
            end
			else if ((r_state == P_IDLE)) begin
                if (i_pac_chek_data_valid)
                    r_frame_len_cnt <= r_frame_len_cnt + 1'b1;
				else 
					r_frame_len_cnt <= 32'd0;
			end
			else if ( (r_state == P_WAIT) ) begin
				r_frame_len_cnt <= 32'd0;
			end
            else
                r_frame_len_cnt <= r_frame_len_cnt;
        end
    end
	
	//pac check
	always @ (posedge i_pac_chek_clk or negedge i_rst_n)
	begin
		if(!i_rst_n)
			r_good_word_num <= 32'd0;
		else begin
            if ( (r_state == P_DATA) || (r_state == P_IDLE)) begin
               if (i_pac_chek_data_valid) begin 
						if(r_frame_len_cnt==i_pac_chek_data)
							r_good_word_num<= r_good_word_num + 1'b1;
					end
            end
			else if ( (r_state == P_WAIT) ) begin
				r_good_word_num <= 32'd0;
			end
            else
               r_good_word_num <= r_good_word_num;
        end	
	end
	
	//rec frame num
	always @ (posedge i_pac_chek_clk or negedge i_rst_n)
	begin
		if(!i_rst_n)
			r_frame_num <= 32'd0;
		else begin
            if ( i_pac_chek_data_valid && (i_pac_chek_data == 32'd0)) begin
				r_frame_num <= r_frame_num + 1'b1;
            end
            else
                r_frame_num <= r_frame_num;
        end	
	end
	
	//rec frame num
	always @ (posedge i_pac_chek_clk or negedge i_rst_n)
	begin
		if(!i_rst_n)
			r_good_frame_num <= 32'd0;
		else begin
            if ( i_pac_chek_data_valid && (r_good_word_num == FRAME_LEN_VAL -1 )) begin
				r_good_frame_num <= r_good_frame_num + 1'b1;
            end
            else
                r_good_frame_num <= r_good_frame_num;
        end	
	end
	
	assign o_good_word_num	= r_good_word_num;
	assign o_good_frame_num = r_good_frame_num;
	assign o_frame_num 		= r_frame_num;
endmodule	
	