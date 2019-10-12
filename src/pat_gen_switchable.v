`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ZDF
// 
// Create Date: 2019/03/15
// Design Name: 
// Module Name: pat_gen_switchable
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
// add a switch of the packet transmission 
// i_switch will be effective untill a packet transmission is accomplished
//////////////////////////////////////////////////////////////////////////////////


module pat_gen_switchable(
        input   			arst_n,
        
		input				i_switch,
		
        input						light_modu_clk,
        output reg [31:0]			light_modu_tdata,
        output						light_modu_tvalid,
        output						light_modu_tlast,
        input						light_modu_tready
    );
    
    parameter   P_OFF	= 3'd0;
    parameter   P_IDLE  = 3'd1;
    parameter   P_DATA  = 3'd2;
    parameter   P_EOF  =  3'd3;
    parameter   P_WAIT  = 3'd4;
    (*KEEP = "TRUE"*) reg   [2:0]   state;
    
    parameter   FRAME_LEN_VAL   = 32'd40;
    parameter   FRAME_GAP_VAL   = 32'd10;
    
    reg     [15:0]  frame_len_cnt;
    reg     [15:0]  frame_gap_cnt;
    
    //FSM controller
    always @ (posedge light_modu_clk or negedge arst_n)
    begin
        if (!arst_n)
            state <= P_OFF;
        else
        begin
            case (state)
                P_OFF: begin
                    if (i_switch)//i_switch will be effective untill a packet transmission is accomplished
                        state <= P_IDLE;
                    else ;
                end
                
                P_IDLE: begin
                    if (light_modu_tready)//i_switch will be effective untill a packet transmission is accomplished
                        state <= P_DATA;
                    else ;
                end
                
                P_DATA: begin
                    if ((frame_len_cnt == (FRAME_LEN_VAL - 2'd2)) &&  light_modu_tready)
                        state <= P_EOF;
                    else ;
                end
				
                P_EOF: begin
                    if (light_modu_tready )
                        state <= P_WAIT;
                    else ;
                end
                
                P_WAIT: begin
                    if (frame_gap_cnt == FRAME_GAP_VAL)
                        state <= P_OFF;
                    else ;
                end
                
                default: state <= P_OFF;
            endcase
        end
    end
    
	assign light_modu_tvalid = (state == P_DATA) || (state == P_EOF) || (state == P_IDLE);
	assign light_modu_tlast  =  (state == P_EOF) ;
	
	
    //frame length counter
    always @ (posedge light_modu_clk or negedge arst_n)
    begin
        if (!arst_n)
            frame_len_cnt <= 16'd0;
        else
        begin
            if (state == P_DATA)
            begin
                if (light_modu_tvalid	&&	light_modu_tready)
                    frame_len_cnt <= frame_len_cnt + 1'b1;
                else ;
            end
            else
                frame_len_cnt <= 16'd0;
        end
    end
    
    //frame gap counter
    always @ (posedge light_modu_clk or negedge arst_n)
    begin
        if (!arst_n)
            frame_gap_cnt <= 16'd0;
        else
        begin
            if (state == P_WAIT)
                frame_gap_cnt <= frame_gap_cnt + 1'b1;
            else
                frame_gap_cnt <= 16'd0;
        end
    end
    
    //send data
    always @ (posedge light_modu_clk or negedge arst_n)
    begin
        if (!arst_n)
        begin
            light_modu_tdata  <= 32'd0;
        end
        else begin
            if (state == P_IDLE) begin
				if(light_modu_tready)
					light_modu_tdata  <= 32'd0;
				else begin
					light_modu_tdata  <= FRAME_LEN_VAL ;
				end				
            end
			else begin
				if (state == P_DATA) begin
					if(light_modu_tready)
						light_modu_tdata  <= light_modu_tdata + 1'b1;
					else begin
						light_modu_tdata  <= light_modu_tdata;
					end

				end
			end
        end
    end
    
endmodule
