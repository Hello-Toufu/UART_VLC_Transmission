// File:    stall.v
// Author:  Tao Wu
// Function: 
//  implement critical signal stall logic
//  when signal is '1', stall will keep '1' until clear signal is assert
`ifndef DELAY
    `define DELAY #0.1
`endif

module STALL
(
    input               i_clk       ,
    input               i_rst_n     ,
    input               i_signal    ,   
    input               i_clr       ,
    output              o_stall          
);
    reg                 r_stall;
    
    assign o_stall = r_stall;

    always@(posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            r_stall <= `DELAY 1'b0;
        end
        else begin
            if(i_clr) begin
                r_stall <= `DELAY 1'b0;
            end
            else begin
                if(i_signal) begin
                    r_stall <= `DELAY 1'b1;
                end
            end
        end    
    end    

endmodule