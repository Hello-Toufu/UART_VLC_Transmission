// File               : tx_top.v
// Author             : Tao Wu
// Created On         : 2017-06-22 14:15
// Last Modified      : 2017-08-30 15:30
// Description        : 
//  the tx top module (not including the GMAC)
                        
module TX_TOP(
    input               i_vl_tx_clk    //all tx modules work on this clock
    ,input              i_serial_tx_clk 
    ,input              i_vl_tx_rst_n 

    //interface with GMAC RX
    ,input              i_ari_val       
    ,input              i_ari_sof       
    ,input              i_ari_eof       
    ,input  [1:0]       i_ari_be        
    ,input  [31:0]      i_ari_data      
    ,output             o_ari_ack       
    ,input  [15:0]      i_ari_frame_len
    ,input              i_ari_frame_len_val

    //visible light interface
    ,output				o_vl_tx_data_0     
/*     ,output  [9:0]      o_vl_tx_data_0     
    ,output  [9:0]      o_vl_tx_data_1     
    ,output  [9:0]      o_vl_tx_data_2     
    ,output  [9:0]      o_vl_tx_data_3    */  

    //controls
    ,input              i_rs_en
    ,input              i_x1_mode
    ,input              i_pol_adj_en
    
);

    wire                c_tx_pre_rs_sof;
    wire  [31:0]        c_tx_pre_rs_data;
    wire                c_tx_pre_rs_rs_data_symbol;
    wire                c_tx_pre_rs_rs_check_symbol;

    wire  [3:0]         c_tx_post_rs_sof;
    wire  [31:0]        c_tx_post_rs_data;
    wire  [3:0]         c_tx_post_rs_data_valid;

    wire   [31:0]       c_tx_pre_8b10b_data;
    wire   [3:0]        c_tx_pre_8b10b_datak;

    wire    [39:0]      c_tx_post_8b10b_data;
    wire    [39:0]      c_tx_post_pol_adj_data;

    genvar i;

    TX_INTERFACE #(`RS_N,`RS_K) m_tx_interface(
        .i_clk                  (i_vl_tx_clk              )
        ,.i_rst_n               (i_vl_tx_rst_n            )
        ,.i_ari_val             (i_ari_val          )
        ,.i_ari_sof             (i_ari_sof          )
        ,.i_ari_eof             (i_ari_eof          )
        ,.i_ari_be              (i_ari_be           )
        ,.i_ari_data            (i_ari_data         )
        ,.o_ari_ack             (o_ari_ack          )
        ,.i_ari_frame_len       (i_ari_frame_len    )
        ,.i_ari_frame_len_val   (i_ari_frame_len_val)
        ,.o_sof                 (c_tx_pre_rs_sof              )
        ,.o_data                (c_tx_pre_rs_data             )
        ,.o_rs_data_symbol      (c_tx_pre_rs_rs_data_symbol   )
        ,.o_rs_check_symbol     (c_tx_pre_rs_rs_check_symbol  )
        ,.i_x1_mode             (i_x1_mode)
    );


//================================================================================
//Function  : signals for rs_encoder. eop will follow by two slot delay
//================================================================================
    reg [4:0]  	r_rs_check_symbol_cnt;
	reg 		c_tx_pre_rs_rs_data_symbol_d1;
	reg 		c_tx_pre_rs_sof_d1;
	reg 		c_tx_pre_rs_eop_d1;
	reg [7:0]  	c_tx_pre_rs_data_d1;

	reg 		c_tx_pre_rs_rs_data_symbol_d2;
	reg 		c_tx_pre_rs_sof_d2;
	reg 		c_tx_pre_rs_eop_d2;
	reg [7:0]  	c_tx_pre_rs_data_d2;
    always@(posedge i_vl_tx_clk or negedge i_vl_tx_rst_n) begin
        if (~i_vl_tx_rst_n) begin
            r_rs_check_symbol_cnt 			<= 5'd0; 
            c_tx_pre_rs_rs_data_symbol_d1 	<= 1'd0; 
            c_tx_pre_rs_sof_d1 				<= 1'd0; 
            c_tx_pre_rs_eop_d1 				<= 1'd0; 
            c_tx_pre_rs_data_d1 			<= 8'd0; 
            c_tx_pre_rs_rs_data_symbol_d2 <= 1'd0; 
            c_tx_pre_rs_sof_d2 				<= 1'd0; 
            c_tx_pre_rs_eop_d2 				<= 1'd0; 
            c_tx_pre_rs_data_d2 			<= 8'd0; 
        end
        else begin	
				c_tx_pre_rs_rs_data_symbol_d1 	<= c_tx_pre_rs_rs_data_symbol;
				c_tx_pre_rs_sof_d1 				<= c_tx_pre_rs_sof;
				c_tx_pre_rs_data_d1 			<= c_tx_pre_rs_data[7:0];
				
				c_tx_pre_rs_rs_data_symbol_d2 	<= c_tx_pre_rs_rs_data_symbol_d1;
				if ( c_tx_pre_rs_rs_data_symbol_d1 == 1'b1 && c_tx_pre_rs_rs_data_symbol_d2 == 1'b0 ) begin
					c_tx_pre_rs_sof_d2 <= 1'd1; 
				end
				else  begin
					c_tx_pre_rs_sof_d2 <= 1'd0;
				end
				//c_tx_pre_rs_sof_d2 				<= c_tx_pre_rs_sof_d1;
				c_tx_pre_rs_data_d2 			<= c_tx_pre_rs_data_d1;
				if ( c_tx_pre_rs_rs_data_symbol == 1'b0 && c_tx_pre_rs_rs_data_symbol_d1 == 1'b1 ) begin
					c_tx_pre_rs_eop_d2 <= 1'd1; 
				end
				else  begin
					c_tx_pre_rs_eop_d2 <= 1'd0;
				end
				
				if (c_tx_pre_rs_rs_data_symbol ) begin
					r_rs_check_symbol_cnt <= 5'd0; 
				end
				else if (c_tx_pre_rs_rs_check_symbol) begin
					r_rs_check_symbol_cnt <= r_rs_check_symbol_cnt +1'b1;
				end
        end
    end	
	
	wire c_tx_pre_rs_rs_check_symbol_16;
	
	assign c_tx_pre_rs_rs_check_symbol_16 = (r_rs_check_symbol_cnt<16) ? c_tx_pre_rs_rs_check_symbol : 1'b0;
	//assign c_tx_pre_rs_rs_check_symbol_eop = (r_rs_check_symbol_cnt==15) ? c_tx_pre_rs_rs_check_symbol : 1'b0;
	
//================================================================================
//Function  : rs encoder
//================================================================================
`ifdef RS_QUATUS    
    generate
        for(i=0; i<=0; i=i+1) begin: RS_ENC_LANE
            RS_ENC_LANE_QUATUS m_tx_rs_enc(
                .clk                	(i_vl_tx_clk)
                ,.reset             	(~i_vl_tx_rst_n)
                ,.rsin            		(c_tx_pre_rs_data_d2)
                ,.sink_val          	(c_tx_pre_rs_rs_data_symbol_d2 )
                ,.sink_sop             	(c_tx_pre_rs_sof_d2)
                ,.sink_eop             	(c_tx_pre_rs_eop_d2)
                ,.sink_ena             	()
					 
                ,.rsout             	(c_tx_post_rs_data[i*8+:8])
                ,.source_ena            (1'b1)
                ,.source_val      		(c_tx_post_rs_data_valid[i])
                ,.source_sop      		(c_tx_post_rs_sof[i])
                ,.source_eop      		()
            );
        end
    endgenerate
`else
    generate
        for(i=0; i<=0; i=i+1) begin: RS_ENC_LANE
            TX_RS_ENC m_tx_rs_enc(
                .i_clk                  (i_vl_tx_clk)
                ,.i_rst_n               (i_vl_tx_rst_n)
                ,.i_rs_en               (i_rs_en)
                ,.i_raw_sof             (c_tx_pre_rs_sof)
                ,.i_raw_data            (c_tx_pre_rs_data[i*8+:8])
                ,.i_raw_rs_data_symbol  (c_tx_pre_rs_rs_data_symbol)
                ,.i_raw_rs_check_symbol (c_tx_pre_rs_rs_check_symbol_16)
                ,.o_enc_sof             (c_tx_post_rs_sof[i])
                ,.o_enc_data            (c_tx_post_rs_data[i*8+:8])
                ,.o_enc_data_valid      (c_tx_post_rs_data_valid[i])
            );
        end
    endgenerate
`endif
/*     TX_CHAR_REPLACE m_tx_char_replace (
        .i_clk              (i_vl_tx_clk)
        ,.i_rst_n           (i_vl_tx_rst_n)
        ,.i_sof_in          (c_tx_post_rs_sof[0])
        ,.i_data_in         (c_tx_post_rs_data)
        ,.i_data_valid_in   (c_tx_post_rs_data_valid)
        ,.o_data_out        (c_tx_pre_8b10b_data)
        ,.o_datak_out       (c_tx_pre_8b10b_datak)
        ,.i_x1_mode         (i_x1_mode)
    );

    generate
        for(i=0; i<=3; i=i+1) begin: ENC_8B10B_LANE
            TX_8B10B_ENC m_tx_8b10b_enc(
                .i_clk                  (i_vl_tx_clk)
                ,.i_rst_n               (i_vl_tx_rst_n)
                ,.i_8b_data             (c_tx_pre_8b10b_data[i*8+:8])
                ,.i_8b_datak            (c_tx_pre_8b10b_datak[i])
                ,.o_10b_data            (c_tx_post_8b10b_data[i*10+:10]) 
            );

            TX_INSRT_POL_COMMA m_tx_insrt_pol_comma(
                 .i_clk                 (i_vl_tx_clk      )
                ,.i_rst_n               (i_vl_tx_rst_n    )
                ,.i_en                  (i_pol_adj_en       )
                ,.i_ori_data            (c_tx_post_8b10b_data[i*10+:10] )
                ,.o_rep_data            (c_tx_post_pol_adj_data[i*10+:10] )
            );
        end
    endgenerate */
	(*keep = "true"*)wire data_coded_en;
	(*keep = "true"*)wire [15 : 0] data_coded;
	man_code man_code_inst  (
		.reset(~i_vl_tx_rst_n),
		.clk(i_vl_tx_clk),
		.data_uncoded(c_tx_post_rs_data[7:0]),
		.data_uncoded_en(c_tx_post_rs_data_valid[0]),
		
		.data_coded_en(data_coded_en),
		.data_coded(data_coded)
		);	 	 

	(*keep = "true"*)wire [15 : 0] with_header_data_out;
	(*keep = "true"*)wire with_header_en_out;
		add_synheader_p add_synheader_p 
		(
				.clk          (i_vl_tx_clk),
				.reset        (~i_vl_tx_rst_n),
				.no_header_data_in      (data_coded),
				.no_header_en_in        (data_coded_en),

				.with_header_data_out     (with_header_data_out),
				.with_header_en_out       (with_header_en_out) 
		);	 
		 
	//(*keep = "true"*)wire s_data_out;
	(*keep = "true"*)wire s_data_out_temp;
	(*keep = "true"*)wire s_en_out;
	(*keep = "true"*)wire s_sop_out;
	(*keep = "true"*)wire s_eop_out;

	data_p2s  data_p2s
		 (
				.clk                    (i_serial_tx_clk),
				.reset                  (~i_vl_tx_rst_n),
				.data_in                (with_header_data_out),
				.data_en                (with_header_en_out),
				.serial_data_out        (s_data_out_temp),
				.serial_en_out          (s_en_out),
				.serial_sop_out         (s_sop_out),
				.serial_eop_out         (s_eop_out)
			);	 
    assign o_vl_tx_data_0 = s_data_out_temp;
/*     assign o_vl_tx_data_0 = c_tx_post_pol_adj_data[9:0];
    assign o_vl_tx_data_1 = c_tx_post_pol_adj_data[19:10];
    assign o_vl_tx_data_2 = c_tx_post_pol_adj_data[29:20];
    assign o_vl_tx_data_3 = c_tx_post_pol_adj_data[39:30]; 
 */
endmodule
