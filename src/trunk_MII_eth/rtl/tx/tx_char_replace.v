// File               : tx_char_replace.v
// Author             : Tao Wu
// Created On         : 2017-06-23 09:07
// Last Modified      : 2017-07-11 12:56
// Description        : 
//  replace the char before 8b/10b encoder
//  1. replace the sof char with |S| (0xFB, K27.7)
//  2. replace the invalid data symbol with |I| (0xBC, K28.5)
//  3. replace the invalid data symbol with |A| at the interval of 16 (0x7C, K28.3)
//  4. all the replaced data symbols are fixed value and can be recovered on
//  rx
//
//  in x1 mode, the sof is replaced with |S|, |A|, 0x55, 0x00


module TX_CHAR_REPLACE#(
    parameter           AM_INTERVAL = 64    //should be large than the rx deksew fifo depth
)(
    input               i_clk
    ,input              i_rst_n

    //rs encoded data
    ,input              i_sof_in
    ,input [31:0]       i_data_in
    ,input  [3:0]       i_data_valid_in

    //output for 8b/10b encoder
    ,output  [31:0]     o_data_out
    ,output  [3:0]      o_datak_out       

    ,input              i_x1_mode
);

    reg [31:0]          r_data_out;
    reg [3:0]           r_datak_out;

    reg [7:0]           r_align_interval_cnt;
    
    reg [1:0]           r_sof_byte_cnt;
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            //default send K28.5
            r_data_out <= `DELAY {4{`CHAR_I}}; //32'hBC_BC_BC_BC;
            r_datak_out <= `DELAY 4'hF;
        end
        else begin
            if(i_data_valid_in) begin
                if(i_sof_in) begin
                    if(r_sof_byte_cnt == 2'd0) begin
                        //|S|
                        r_data_out <= `DELAY {4{`CHAR_S}}; //32'hFB_FB_FB_FB;
                        r_datak_out <= `DELAY 4'hF;
                    end
                    else if(r_sof_byte_cnt == 2'd1) begin
                        r_data_out[7:0] <= `DELAY `CHAR_A;
                        r_datak_out[0] <= `DELAY 1'b1;
                    end
                    else if(r_sof_byte_cnt == 2'd2) begin
                        r_data_out[7:0] <= `DELAY 8'h55;
                        r_datak_out[0] <= `DELAY 1'b0;
                    end
                    else if(r_sof_byte_cnt == 2'd3) begin
                        r_data_out[7:0] <= `DELAY 8'h00;
                        r_datak_out[0] <= `DELAY 1'b0;
                    end
                end
                else begin
                    //Data
                    r_data_out <= `DELAY i_data_in;
                    r_datak_out <= `DELAY 4'h0;
                end
            end
            else begin
                // |A| is not inserted in X1 mode
                if((r_align_interval_cnt == 8'h0) && (~i_x1_mode)) begin
                    //|A|
                    r_data_out <= `DELAY {4{`CHAR_A}}; //32'h7C_7C_7C_7C;
                    r_datak_out <= `DELAY 4'hF; 
                end
                else begin
                    //|I|
                    r_data_out <= `DELAY {4{`CHAR_I}}; //32'hBC_BC_BC_BC;
                    r_datak_out <= `DELAY 4'hF;
                end
            end
        end
    end
    //in x1 mode, lane1/2/3 all send idles
    assign o_data_out = i_x1_mode ? { {3{`CHAR_I}}, r_data_out[7:0]} : r_data_out;
    assign o_datak_out = i_x1_mode ? {3'b111, r_datak_out[0]} : r_datak_out;

    //align interval cnt
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_align_interval_cnt <= `DELAY AM_INTERVAL;
        end
        else begin
            if(r_align_interval_cnt == 8'd0) begin
                //reset the counter to 15 when /A/ is sent
                //otherwise, keep it as '0'
                if(~i_data_valid_in)
                    r_align_interval_cnt <= `DELAY AM_INTERVAL; 
            end
            else
                r_align_interval_cnt <= `DELAY r_align_interval_cnt - 8'd1;
        end
    end
                        
    //sof count, for x1 only
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof_byte_cnt <= `DELAY 2'd0;
        end
        else begin
            if(~i_x1_mode)
                r_sof_byte_cnt <= `DELAY 2'd0;
            else if(r_sof_byte_cnt == 2'd0) begin
                if((i_data_valid_in && i_sof_in))
                    r_sof_byte_cnt <= `DELAY 2'd1;
            end
            else 
                r_sof_byte_cnt <= `DELAY r_sof_byte_cnt + 2'd1;
        end
    end
endmodule
