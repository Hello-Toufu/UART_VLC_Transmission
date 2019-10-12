module MAC_REG_ACCESS
	(
	output 	reg					o_mci_val,
	output 	reg		[31:0]		o_mci_wdata,
	output 			[3:0]		o_mci_be,
	output 	reg		[13:0]		o_mci_addr,
	output	reg					o_mci_rdwn,
	input 						i_mci_ack,
	input 			[31:0]		i_mci_rdata,
	
	input			[13:0]		i_mac_addr,
	input			[31:0]		i_mac_wr_data,
	output	reg		[31:0]		o_mac_rd_data,
	input		 				i_mac_rdwn,
	output	reg					o_mac_done,
	input						i_mac_request,
	input						i_clk,
	input						i_rst_n
	);
	
		
	localparam  RESET           = 3'd0,
                READ            = 3'd1,
                WRITE           = 3'd2,
                VALID           = 3'd3,
                READ_OUT        = 3'd4,
                WRITE_DOWN      = 3'd5;

    reg [2:0]           r_state;
    reg [2:0]           c_state_next;
	reg	[31:0]			r_mac_wr_data;



//================================================================================
//Function  : main FSM
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_state <= `DELAY RESET;
        end
        else begin
            r_state <= `DELAY c_state_next;
        end
    end

    always@( * ) begin
        c_state_next = r_state;
        case(r_state)
            RESET         : begin
                if(i_mac_request) 
				begin
					if(i_mac_rdwn)
						c_state_next = READ;
					else 
						c_state_next = WRITE;
				end
                else
                    c_state_next = RESET;
            end
            READ          : begin
                c_state_next = VALID; 
            end
            WRITE    	  : begin
				c_state_next = VALID; 
            end
            VALID	      : begin
                if (i_mci_ack) begin
                    if(o_mci_rdwn)	
                        c_state_next = READ_OUT;
                    else 
						c_state_next = WRITE_DOWN;
                end
				else
					c_state_next = VALID;
            end
            READ_OUT	  : begin
                c_state_next = RESET;
            end
            WRITE_DOWN	  : begin
				c_state_next = RESET;
            end
        endcase
    end



    
//================================================================================
//Function  : output signals
//  insure all signals are registered output
//================================================================================
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mci_wdata <= `DELAY 32'h0;
        end
        else begin
            case(r_state)
                RESET:
                    o_mci_wdata <= `DELAY 32'h0;
                WRITE,
				VALID:
                    o_mci_wdata <= `DELAY r_mac_wr_data;
                default:
                    o_mci_wdata <= `DELAY 32'h0;
            endcase
        end
    end
	
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mci_val <= `DELAY 1'b0;
        end
        else begin
            case(r_state)
                VALID:
                    o_mci_val <= `DELAY 1'b1;
                default:
                    o_mci_val <= `DELAY 1'b0;                                   
            endcase
        end
    end
	
	assign o_mci_be = 4'hF;

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mci_addr <= `DELAY 14'h0;
        end
        else begin
            case(r_state)
                READ,
				WRITE,
				VALID:
                    o_mci_addr <= `DELAY i_mac_addr;
                default:
                    o_mci_addr <= `DELAY 14'h0;                                   
            endcase
        end
    end

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mci_rdwn <= `DELAY 1'b0;
        end
        else begin
            if(r_state == READ)
				o_mci_rdwn <= `DELAY 1'b1;
            else if(r_state == WRITE)
				o_mci_rdwn <= `DELAY 1'b0;
        end
    end	

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_rd_data <= `DELAY 32'h0;
        end
        else begin
            case(r_state)
                READ_OUT:
                    o_mac_rd_data <= `DELAY i_mci_rdata;
                default:
                    o_mac_rd_data <= `DELAY 32'h0;                                   
            endcase
        end
    end		

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_done <= `DELAY 1'b0;
        end
        else begin
            case(r_state)
                READ_OUT,
				WRITE_DOWN:
                    o_mac_done <= `DELAY 1'b1;
                default:
                    o_mac_done <= `DELAY 1'b0;            
            endcase
        end
    end		
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_mac_wr_data <= `DELAY 32'b0;
        end
        else begin
           if(i_mac_request)
				r_mac_wr_data <= `DELAY i_mac_wr_data;

        end
    end		
	
endmodule
