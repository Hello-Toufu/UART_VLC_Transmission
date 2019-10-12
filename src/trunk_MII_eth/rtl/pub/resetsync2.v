`ifndef DELAY
`define DELAY #0.1
`endif

module RESETSYNC2
    (
     output wire                sync_rst_N,
     input wire                 clk,
     input wire                 async_rst_N
     );

    reg                         d_s1, d_s2;
    always @(posedge clk or negedge async_rst_N)
        if (~async_rst_N) begin
            d_s1 <= `DELAY 1'b0;
            d_s2 <= `DELAY 1'b0;
        end else begin
            d_s1 <= `DELAY 1'b1;
            d_s2 <= `DELAY d_s1;
        end

    assign sync_rst_N = d_s2 ;
    
    
endmodule

////////////////////////////////////////////////////////////////////////////// 
//
