`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ZDF
// 
// Create Date: 2019/03/27
// Design Name: 
// Module Name: periodical_pulse_gen
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
// generate a pulse 
// pulse width = PULSE_NEGEDGE_TIME - PULSE_POSEDGE_TIME
// gap time = PULSE_POSEDGE_TIME + PULSE_WAITING_TIME
//////////////////////////////////////////////////////////////////////////////////

module periodical_pulse_gen(
        input   			i_rst_n
        ,input   			i_clk
		
		,output				o_pulse
    );
	
    parameter   P_IDLE  = 2'd0;
    parameter   P_PULSE  = 2'd1;
    parameter   P_EOF  = 2'd2;
    parameter   P_WAIT  = 2'd3;

    parameter   PULSE_POSEDGE_TIME   = 32'd1000000;
    parameter   PULSE_NEGEDGE_TIME   = 32'd2000000;
    parameter   PULSE_WAITING_TIME   = 32'd2000000;

	
    (*KEEP = "TRUE"*) reg   [1:0]   	r_state;
    (*KEEP = "TRUE"*) reg   [31:0]   	r_pulse_width_cnt;
    (*KEEP = "TRUE"*) reg   [31:0]   	r_pulse_posedge_cnt;
    (*KEEP = "TRUE"*) reg   [31:0]   	r_pulse_waiting_cnt;
    (*KEEP = "TRUE"*) reg   		   	r_pulse;
	
    //FSM controller
    always @ (posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_state <= P_IDLE;
        else
        begin
            case (r_state)
                P_IDLE: begin
                    if ((r_pulse_posedge_cnt == PULSE_POSEDGE_TIME))
                        r_state <= P_PULSE;
                    else ;
                end
                
                P_PULSE: begin
                    if ((r_pulse_width_cnt == (PULSE_NEGEDGE_TIME - PULSE_POSEDGE_TIME )))
                        r_state <= P_WAIT;
                    else ;
                end
				
                P_WAIT: begin
                    if ((r_pulse_waiting_cnt == (PULSE_WAITING_TIME )))
                        r_state <= P_IDLE;
                    else ;
                end
                
                default: r_state <= P_IDLE;
            endcase
        end
    end	
	
    // counter before pulse is generated
    always @ (posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_pulse_posedge_cnt <= 32'd0;
        else begin
            if ( (r_state == P_IDLE) ) begin
                r_pulse_posedge_cnt <= r_pulse_posedge_cnt + 1'b1;
				end
				else if (r_state == P_WAIT) begin
					r_pulse_posedge_cnt <= 32'd0;
            end
        end
    end
	
    //counter during pulse is generated
    always @ (posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_pulse_width_cnt <= 32'd0;
        else begin
            if ( (r_state == P_PULSE) ) begin
                r_pulse_width_cnt <= r_pulse_width_cnt + 1'b1;
				end
				else if (r_state == P_WAIT) begin
					r_pulse_width_cnt <= 32'd0;
            end
        end
    end
    //counter during waiting
    always @ (posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_pulse_waiting_cnt <= 32'd0;
        else begin
            if ( (r_state == P_WAIT) ) begin
                r_pulse_waiting_cnt <= r_pulse_waiting_cnt + 1'b1;
				end
				else if (r_state == P_IDLE) begin
					r_pulse_waiting_cnt <= 32'd0;
            end
        end
    end
	
    //gen pulse
    always @ (posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_pulse <= 1'b0;
        else begin
            if ( (r_state == P_IDLE) || (r_state == P_WAIT)) begin
                r_pulse <= 1'b0;
            end
			else if ((r_state == P_PULSE)) begin
				r_pulse <= 1'b1;
			end
        end
    end
	assign o_pulse = r_pulse;
endmodule	
	