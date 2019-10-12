module POLL_SPEED
    (
    output reg    [4:0]     o_phy_addr,
    output        [31:0]    o_phy_wr_data,
    input         [31:0]    i_phy_rd_data,
    output reg              o_phy_rdwn,
    input                   i_phy_done,
    output reg              o_phy_request,
    
    output reg    [31:0]    o_mac_wr_data ,
    output        [13:0]    o_mac_addr,
    output reg              o_mac_rdwn,
    input                   i_mac_done,
    input         [31:0]    i_mac_rd_data,
    output reg              o_mac_request,
    
    output reg              o_mux,              //'1' means poll_speed is using the mac_reg access
    output                  o_gclk_sel,          //select clock for gmii tx 0: 10/100M, 1000: 1000M
    
    input                   i_clk,
    input                   i_rst_n
    );
    
        
    localparam  RESET           =  4'd0,
                READ_PHY        =  4'd1,
                PHY_REQ         =  4'd2,
                PHY_READ_OUT    =  4'd3,
                TEST_SPEED      =  4'd4,
                READ_MAC        =  4'd5,
                MAC_REQ0        =  4'd6,
                MAC_READ_OUT    =  4'd7,
                WRITE_MAC       =  4'd8,
                MAC_REQ1        =  4'd9;
               
    //define the address and status encoding to parameter 
    //if anyone wants to change later, it would be easier
    localparam  PHY_STATUS_REG_ADDR = 5'h11;
    localparam  PHY_STATUS_1G = 2'b10;
    
    //time delay during per speed test , count = 1 means delay 1 clk  
    localparam  CLK_COUNT = 20000000; //40M input clk to delay 0.5s 40*0.5=20M

    reg [3:0]           r_state;
    reg [3:0]           c_state_next;
    //speed is only divided into 2 grade: 1G and not1G, so 1 bit is enough
    //1: 1G
    //0: 10/100M
    reg                 r_speed_ori;
    reg                 r_speed_testout;
    reg    [31:0]       r_mac_reg_data;

    reg   [31:0]        r_phy_rd_data;
    reg   [31:0]        r_mac_rd_data;
    
    reg   [31:0]        r_clk_count;
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
                if(r_clk_count==CLK_COUNT)
                    c_state_next = READ_PHY;
                else
                    c_state_next = RESET;
            end
            READ_PHY      : begin
                c_state_next = PHY_REQ;
            end
            PHY_REQ          : begin
                if(i_phy_done)
                    c_state_next = PHY_READ_OUT; 
                else
                    c_state_next = PHY_REQ;
            end
            PHY_READ_OUT  : begin
                c_state_next = TEST_SPEED;
            end
            TEST_SPEED      : begin
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
            WRITE_MAC      : begin
                c_state_next = MAC_REQ1;
            end
            MAC_REQ1          : begin
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
                o_phy_addr <= `DELAY PHY_STATUS_REG_ADDR;
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

    //keep mac_rd_data for later use
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_mac_rd_data <= `DELAY 32'h0;
        end
        else begin
            if(i_mac_done)
                r_mac_rd_data <= `DELAY i_mac_rd_data;
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
                    //bit[15] means
                    //0: GMII (1000Mbps)
                    //1: MII (10/100Mbps)
                    o_mac_wr_data[15] <= `DELAY ~r_speed_testout;
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
    
    //since i_phy_rd_data is only valid when i_phy_done is '1'
    //keep it for later use
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_phy_rd_data <= `DELAY 32'h0;
        end
        else begin
            if(i_phy_done)
                r_phy_rd_data <= `DELAY i_phy_rd_data;
        end
    end
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            //default 1000M
            r_speed_testout <= `DELAY 1'b1;
        end
        else begin
            if(r_state == PHY_READ_OUT)
                r_speed_testout <= `DELAY (r_phy_rd_data[15:14] == PHY_STATUS_1G);
        end
    end    
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            //default 1000M
            r_speed_ori <= `DELAY 1'b1;
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
            r_clk_count <= `DELAY 32'b0;
        end
        else begin
            if(r_state == RESET)
                r_clk_count <= `DELAY r_clk_count+1;
            else 
                r_clk_count <= `DELAY 32'b0;
        end
    end

    
    assign o_gclk_sel = r_speed_testout;
    
    assign o_phy_wr_data = 32'h0;
endmodule
