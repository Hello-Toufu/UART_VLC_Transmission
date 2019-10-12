// File:    rdcnt.v
// Author:  Tao Wu
// Function: 
//  read signal stall logic  
//  generate _clr on read

    
`ifndef DELAY
    `define DELAY #0.1
`endif

    
module RDSTALL # (
    parameter           SIG_ADDR = 10'h0    ,  //the counter low part register address
    parameter           ADDR_WIDTH = 10          
)
(
    input                           i_clk,
    input                           i_rst_n,
    input [ADDR_WIDTH-1:0]          i_addr,
    input                           i_wr_en,
 
    output                          o_signal_clr
);

    wire                            c_wr_stall;        //read signal
    reg                             r_wr_stall;
     
    //detect reading on specified address
    assign c_wr_stall = i_wr_en && (i_addr == SIG_ADDR);
    
    always @ (posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            r_wr_stall <= `DELAY 1'b0;
        end
        else begin
            r_wr_stall <= `DELAY c_wr_stall;
        end
    end
    
    assign o_signal_clr = c_wr_stall && (~r_wr_stall);
    
endmodule
