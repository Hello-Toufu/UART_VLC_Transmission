module POLL_SPEED
	(
	output 	reg		[4:0]		o_phy_addr,
	output 	reg 	[31:0]		o_phy_wr_data,
	input			[31:0]		i_phy_rd_data,
	output 	reg 				o_phy_rdwn,
	input						i_phy_done,
	output 	reg					o_phy_request,
	
	output 	reg		[31:0]		o_mac_wr_data ,
	output 	reg		[13:0]		o_mac_addr,
	output	reg					o_mac_rdwn,
	input 						i_mac_done,
	input 			[31:0]		i_mac_rd_data,
	output	reg					o_mac_request,
	
	output	reg					o_mux,
	
	input						i_clk,
	input						i_rst_n,
	output	reg					o_speed_status
	);
	
		
	localparam  RESET           =  4'd0,
                READ_PHY        =  4'd1,
				PHY_REQ			=  4'd2,
                PHY_READ_OUT    =  4'd3,
				TEST_SPEED 		=  4'd4,
                READ_MAC        =  4'd5,
				MAC_REQ0		=  4'd6,
				MAC_READ_OUT    =  4'd7,
				WRITE_MAC       =  4'd8,
				MAC_REQ1		=  4'd9;
               

    reg [3:0]           r_state;
    reg [3:0]           c_state_next;
	reg [1:0]			r_speed_ori;
	reg	[1:0]			r_speed_testout;
	reg	[31:0]			r_phy_rd_data;
	reg [31:0]			r_mac_rd_data;


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
                c_state_next = READ_PHY; 
            end
			READ_PHY      : begin
				c_state_next = PHY_REQ;
            end
            PHY_REQ	      : begin
				if(i_phy_done)
					c_state_next = PHY_READ_OUT; 
				else
					c_state_next = PHY_REQ;
            end
			PHY_READ_OUT  : begin
				c_state_next = TEST_SPEED;
            end
            TEST_SPEED	  : begin
				if(r_speed_testout == r_speed_ori)
					c_state_next = RESET;
                else
					c_state_next = READ_MAC; 
            end
            READ_MAC      : begin
				c_state_next = MAC_REQ0;
            end
            MAC_REQ0      : begin
                if(i_mac_done)
					c_state_next = MAC_READ_OUT; 
				else
					c_state_next = MAC_REQ0;
            end
            MAC_READ_OUT  : begin
                c_state_next = WRITE_MAC; 
            end
            WRITE_MAC	  : begin
				c_state_next = MAC_REQ1;
            end
            MAC_REQ1		  : begin
				if(i_mac_done) 
					c_state_next = RESET;
				else 
					c_state_next = MAC_REQ1;
            end
        endcase
    end



    
//================================================================================
//Function  : output signals
//  insure all signals are registered output
//================================================================================
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_phy_addr <= `DELAY 5'h0;
        end
        else begin
            if(r_state == READ_PHY)
                o_phy_addr <= `DELAY 5'h11;
			else
				o_phy_addr <= `DELAY 5'h0;
        end
    end
	


	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_phy_rdwn <= `DELAY 1'b0;
        end
        else begin
			if(r_state == READ_PHY)
                o_phy_rdwn <= `DELAY 1'b1;
			else
				o_phy_rdwn <= `DELAY 1'b0;
        end
    end

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_phy_request <= `DELAY 1'b0;
        end
        else begin
            if(r_state == READ_PHY)
				o_phy_request <= `DELAY 1'b1;
			else 
				o_phy_request <= `DELAY 1'b0;
        end
    end	

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_wr_data <= `DELAY 32'b0;
        end
        else begin
			if(r_state == MAC_READ_OUT)
				o_mac_wr_data <= `DELAY r_mac_rd_data;
			else begin
				if(r_state == WRITE_MAC)
					o_mac_wr_data[15] <= `DELAY ~r_speed_testout[1];
				else
					o_mac_wr_data <= `DELAY 32'b0;
			end
        end
    end
	
	assign o_mac_addr = 14'h0;
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_rdwn <= `DELAY 1'b0;
        end
        else begin
            if(r_state == READ_MAC)
				o_mac_rdwn <= `DELAY 1'b1;
			else begin
				o_mac_rdwn <= `DELAY 1'b0;
			end
        end
    end	

	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_request <= `DELAY 1'b0;
        end
        else begin
            if(r_state == READ_MAC||r_state == WRITE_MAC)
				o_mac_request <= `DELAY 1'b1;
			else 
				o_mac_request <= `DELAY 1'b0;
        end
    end	
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_speed_testout <= `DELAY 2'b10;
        end
        else begin
            if(r_state == PHY_READ_OUT)
				r_speed_testout <= `DELAY r_phy_rd_data[15:14];
        end
    end	
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_speed_ori <= `DELAY 2'b10;
        end
        else begin
            if(r_state == WRITE_MAC)
				r_speed_ori <= `DELAY r_speed_testout;
        end
    end	
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mux <= `DELAY 1'b0;
        end
        else begin
            if(r_state == RESET)
				o_mux <= `DELAY 1'b0;
			else if(r_state == READ_MAC)
				o_mux <= `DELAY 1'b1;
        end
    end	
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_phy_rd_data <= `DELAY 32'b0;
        end
        else begin
           if(i_phy_done)
				r_phy_rd_data <= `DELAY i_phy_rd_data;

        end
    end		
	
	always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_mac_rd_data <= `DELAY 32'b0;
        end
        else begin
           if(i_mac_done)
				r_mac_rd_data <= `DELAY i_mac_rd_data;

        end
    end		
	
	assign o_speed_status = r_speed_testout[1];
	assign o_phy_wr_data = 32'b0;
	
endmodule
