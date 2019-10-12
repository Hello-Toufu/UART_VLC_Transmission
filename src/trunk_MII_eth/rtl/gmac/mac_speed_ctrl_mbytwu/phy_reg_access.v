module PHY_REG_ACCESS
    (
    output reg    [31:0]        o_mac_wr_data,
    output reg    [13:0]        o_mac_addr,
    output reg                  o_mac_rdwn,
    input                       i_mac_done,
    input         [31:0]        i_mac_rd_data,
    output reg                  o_mac_request,
    
    input         [4:0]         i_phy_addr,
    input         [31:0]        i_phy_wr_data,
    output reg    [31:0]        o_phy_rd_data,
    input                       i_phy_rdwn,
    output reg                  o_phy_done,
    input                       i_phy_request,
    input                       i_clk,
    input                       i_rst_n
    );
    
        
    localparam  RESET           = 4'd0,
                READ0           = 4'd1,
                READ1           = 4'd2,
                READ2           = 4'd3,
                WRITE0          = 4'd4,
                WRITE1          = 4'd5,
                WRITE2          = 4'd6,
                MAC_REQ_R0      = 4'd7,
                MAC_REQ_R1      = 4'd8,
                MAC_REQ_W0      = 4'd9,
                MAC_REQ_W1      = 4'd10;

    reg [3:0]           r_state;
    reg [3:0]           c_state_next;

    reg [4:0]           r_phy_addr;

    reg [31:0]          r_mac_rd_data;
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
                if(i_phy_request) 
                begin
                    if(i_phy_rdwn)
                        c_state_next = READ0;
                    else 
                        c_state_next = WRITE0;
                end
                else
                    c_state_next = RESET;
            end
            READ0         : begin
                c_state_next = MAC_REQ_R0; 
            end
            READ1          : begin
                c_state_next = MAC_REQ_R1; 
            end
            READ2          : begin
                c_state_next = RESET;
            end
            WRITE0         : begin
                c_state_next = MAC_REQ_W0; 
            end
            WRITE1          : begin
                c_state_next = MAC_REQ_W1; 
            end
            WRITE2          : begin
                c_state_next = RESET;
            end
            MAC_REQ_R0          : begin
                if(i_mac_done) 
                    c_state_next = READ1;
                else 
                    c_state_next = MAC_REQ_R0;
            end
            MAC_REQ_R1          : begin
                if(i_mac_done) 
                    c_state_next = READ2;
                else 
                    c_state_next = MAC_REQ_R1;
            end
            MAC_REQ_W0          : begin
                if(i_mac_done) 
                    c_state_next = WRITE1;
                else 
                    c_state_next = MAC_REQ_W0;
            end
            MAC_REQ_W1          : begin
                if(i_mac_done) 
                    c_state_next = WRITE2;
                else 
                    c_state_next = MAC_REQ_W1;
            end            
        endcase
    end



    
//================================================================================
//Function  : output signals
//  insure all signals are registered output
//================================================================================
    //since the i_phy_addr is only valid when i_phy_request is '1', keep
    //i_phy_addr internally befor use
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_phy_addr <= `DELAY 5'h0;
        end
        else begin
            if(i_phy_request)
                r_phy_addr <= `DELAY i_phy_addr;
        end
    end
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_wr_data <= `DELAY 32'h0;
        end
        else begin
            case(r_state)
                RESET:
                    o_mac_wr_data <= `DELAY 32'h0;
                READ0:begin
                    o_mac_wr_data[5:0]        <= `DELAY 6'hD;
                    o_mac_wr_data[10:6]        <= `DELAY r_phy_addr;
                    o_mac_wr_data[31:11]    <= `DELAY 21'h0;
                end
                WRITE0:
                    o_mac_wr_data <= `DELAY i_phy_wr_data;
                WRITE1:begin
                    o_mac_wr_data[5:0]        <= `DELAY 6'hF;
                    o_mac_wr_data[10:6]        <= `DELAY r_phy_addr;
                    o_mac_wr_data[31:11]    <= `DELAY 21'h0;
                end
            endcase
        end
    end
    


    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_addr <= `DELAY 14'h0;
        end
        else begin
            case(r_state)
                RESET:
                    o_mac_addr <= `DELAY 14'h0;
                READ0,
                WRITE1:
                    o_mac_addr <= `DELAY 14'h010;
                READ1,
                WRITE0:
                    o_mac_addr <= `DELAY 14'h014;                                  
            endcase
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_rdwn <= `DELAY 1'b0;
        end
        else begin
            if(r_state == READ1)
                o_mac_rdwn <= `DELAY 1'b1;
            else
                o_mac_rdwn <= `DELAY 1'b0;
        end
    end    

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_mac_request <= `DELAY 1'b0;
        end
        else begin
            case(r_state)
                READ0,
                READ1,
                WRITE0,
                WRITE1:
                    o_mac_request <= `DELAY 1'b1;
                default:
                    o_mac_request <= `DELAY 1'b0;            
            endcase
        end
    end
    
    //since i_mac_rd_data is only valid when mac_done is '1'
    //keep it for later use
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
            o_phy_rd_data <= `DELAY 32'h0;
        end
        else begin
            if(r_state == READ2)
                o_phy_rd_data <= `DELAY r_mac_rd_data;
            else
                o_phy_rd_data <= `DELAY 32'h0;                                   
        end
    end        

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            o_phy_done <= `DELAY 1'b0;
        end
        else begin
            case(r_state)
                READ2,
                WRITE2:
                    o_phy_done <= `DELAY 1'b1;
                default:
                    o_phy_done <= `DELAY 1'b0;            
            endcase
        end
    end        

endmodule
