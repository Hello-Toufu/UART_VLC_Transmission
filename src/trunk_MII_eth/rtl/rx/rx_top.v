// File               : rx_top.v
// Author             : Tao Wu
// Created On         : 2017-06-22 14:52
// Last Modified      : 2018-05-28 15:15
// Description        : 
//   the rx top module (not including the GMAC)
                        
module RX_TOP(
    input               i_vl_tx_clk    //all tx modules work on this clock
    ,input              i_vl_tx_rst_n 
	
    ,input              i_serial_rx_rst_n
    ,input              i_serial_rx_clk 
    ,input              i_serial_rx_data 

    //interface with GMAC TX
    ,output             o_ati_val       
    ,output             o_ati_sof       
    ,output             o_ati_eof       
    ,output  [1:0]      o_ati_be        
    ,output  [31:0]     o_ati_data      
    ,input              i_ati_rdy        

    //visible light interface
    //,input              i_vl_rx_0_clk          //clock
    // ,input              i_vl_rx_1_clk          //clock
    // ,input              i_vl_rx_2_clk          //clock
    // ,input              i_vl_rx_3_clk          //clock
    //,input              i_serial_rx_rst_n          
    // ,input              i_vl_rx_1_rst_n          
    // ,input              i_vl_rx_2_rst_n          
    // ,input              i_vl_rx_3_rst_n          
    //,input				i_serial_rx_data     
    // ,input   [9:0]      i_serial_rx_data     
    // ,input   [9:0]      i_vl_rx_1_data     
    // ,input   [9:0]      i_vl_rx_2_data     
    // ,input   [9:0]      i_vl_rx_3_data     

    //control
    ,input              i_rs_en
    ,input              i_x1_mode
    ,input   [4:0]      i_rxld_half_thres            
    ,input   [7:0]      i_rxld_align_det_thres       
    ,input   [7:0]      i_rxld_align_los_thres       

    ,input              i_pol_adj_en    
    ,input              i_pol_cont_adj          //0: only detect once after reset, 1: detect continuesly
    ,input   [3:0]      i_pol_ow
    ,input   [3:0]      i_pol_ow_val
    // ,output  [3:0]      o_pol_done
    // ,output  [3:0]      o_pol_status

    //status
    // ,output [3:0]       o_vl_rx_disp_err
    // ,output [3:0]       o_vl_rx_comma_aligned
    // ,output  [3:0]      o_vl_rx_rxld_overflow              
    // ,output  [3:0]      o_vl_rx_0_rxld_underflow               
    // ,output             o_vl_rx_0_rxld_aligned
    ,output [3:0]       o_vl_rx_0_rs_fail    
    ,output [3:0]       o_vl_rx_0_rs_err_found
    ,output [19:0]      o_vl_rx_0_rs_err_num
	
	//debug
    ,output [7:0]      	o_sync_cnt
	 
	 ,input	[15:0]		i_threshold
);
    //parameter   SYN_THRESHOLD  = 16'd420;
    wire    [31:0]      c_dec_8b_data;
    wire    [3:0]       c_dec_8b_datak;
    wire    [3:0]       c_dec_8b_comma_aligned;

    wire    [31:0]      c_aligned_data;
    wire    [3:0]       c_aligned_datak;
    wire                c_deskew_aligned;

    wire    [31:0]      c_rbs_x4_data;
    wire                c_rbs_x4_sof;
    wire                c_rbs_x4_rs_data_symbol;
    wire                c_rbs_x4_rs_check_symbol;
    wire    [7:0]       c_rbs_x1_data;
    wire                c_rbs_x1_sof;
    wire                c_rbs_x1_rs_data_symbol;
    wire                c_rbs_x1_rs_check_symbol;
    wire    [31:0]      c_rbs_data;
    wire                c_rbs_sof;
    wire                c_rbs_rs_data_symbol;
    wire                c_rbs_rs_check_symbol;
    wire                c_rbs_data_aligned;

    wire    [31:0]      c_rsdec_data;
    wire    [3:0]       c_rsdec_data_valid;
    wire    [3:0]       c_rsdec_sof;
//================================================================================
//Function  : 8b/10b Decoder
//================================================================================
    // RX_8B10B_DEC m_rx_8b10b_dec_l0(
        // .i_clk                  (i_vl_rx_0_clk  ),
        // .i_rst_n                (i_serial_rx_rst_n),
        // .i_10b_data             (i_serial_rx_data),
        // .o_8b_data              (c_dec_8b_data[0+:8]),
        // .o_8b_datak             (c_dec_8b_datak[0]    ),
        // .o_comma_aligned        (c_dec_8b_comma_aligned[0]),     
        // .o_disp_err             (o_vl_rx_disp_err[0])      
        // ,.i_pol_adj_en          (i_pol_adj_en     ) 
        // ,.i_pol_cont_adj        (i_pol_cont_adj   )
        // ,.i_pol_ow              (i_pol_ow[0]         )
        // ,.i_pol_ow_val          (i_pol_ow_val[0]     )
        // ,.o_pol_done            (o_pol_done[0]       )
        // ,.o_pol_status          (o_pol_status[0]     )
    // );
    // RX_8B10B_DEC m_rx_8b10b_dec_l1(
        // .i_clk                  (i_vl_rx_1_clk  ),
        // .i_rst_n                (i_vl_rx_1_rst_n),
        // .i_10b_data             (i_vl_rx_1_data),
        // .o_8b_data              (c_dec_8b_data[8+:8]),
        // .o_8b_datak             (c_dec_8b_datak[1]    ),
        // .o_comma_aligned        (c_dec_8b_comma_aligned[1]),     
        // .o_disp_err             (o_vl_rx_disp_err[1])      
        // ,.i_pol_adj_en          (i_pol_adj_en     ) 
        // ,.i_pol_cont_adj        (i_pol_cont_adj   )
        // ,.i_pol_ow              (i_pol_ow[1]         )
        // ,.i_pol_ow_val          (i_pol_ow_val[1]     )
        // ,.o_pol_done            (o_pol_done[1]       )
        // ,.o_pol_status          (o_pol_status[1]     )
    // );
    // RX_8B10B_DEC m_rx_8b10b_dec_l2(
        // .i_clk                  (i_vl_rx_2_clk  ),
        // .i_rst_n                (i_vl_rx_2_rst_n),
        // .i_10b_data             (i_vl_rx_2_data),
        // .o_8b_data              (c_dec_8b_data[16+:8]),
        // .o_8b_datak             (c_dec_8b_datak[2]    ),
        // .o_comma_aligned        (c_dec_8b_comma_aligned[2]),     
        // .o_disp_err             (o_vl_rx_disp_err[2])      
        // ,.i_pol_adj_en          (i_pol_adj_en     ) 
        // ,.i_pol_cont_adj        (i_pol_cont_adj   )
        // ,.i_pol_ow              (i_pol_ow[2]         )
        // ,.i_pol_ow_val          (i_pol_ow_val[2]     )
        // ,.o_pol_done            (o_pol_done[2]       )
        // ,.o_pol_status          (o_pol_status[2]     )
    // );
    // RX_8B10B_DEC m_rx_8b10b_dec_l3(
        // .i_clk                  (i_vl_rx_3_clk  ),
        // .i_rst_n                (i_vl_rx_3_rst_n),
        // .i_10b_data             (i_vl_rx_3_data),
        // .o_8b_data              (c_dec_8b_data[24+:8]),
        // .o_8b_datak             (c_dec_8b_datak[3]    ),
        // .o_comma_aligned        (c_dec_8b_comma_aligned[3]),     
        // .o_disp_err             (o_vl_rx_disp_err[3])      
        // ,.i_pol_adj_en          (i_pol_adj_en     ) 
        // ,.i_pol_cont_adj        (i_pol_cont_adj   )
        // ,.i_pol_ow              (i_pol_ow[3]         )
        // ,.i_pol_ow_val          (i_pol_ow_val[3]     )
        // ,.o_pol_done            (o_pol_done[3]       )
        // ,.o_pol_status          (o_pol_status[3]     )
    // );
    //assign o_vl_rx_comma_aligned = c_dec_8b_comma_aligned;

//================================================================================
//Function  : lane deskew
//================================================================================
    // RX_LD m_rx_ld(
         // .i_srd_rx_clk          ({i_vl_rx_3_clk, i_vl_rx_2_clk, i_vl_rx_1_clk, i_vl_rx_0_clk})
        // ,.i_srd_rx_rst_n        ({i_vl_rx_3_rst_n, i_vl_rx_2_rst_n, i_vl_rx_1_rst_n, i_serial_rx_rst_n})
        // ,.i_s_rx_data           (c_dec_8b_data)
        // ,.i_s_rx_datak          (c_dec_8b_datak)
        // ,.i_s_half_thres        (i_rxld_half_thres)    //TODO: add to register config
        // ,.i_u_align_det_thres   (i_rxld_align_det_thres)    //TODO: add to register config
        // ,.i_u_align_los_thres   (i_rxld_align_los_thres)    //TODO: add to register config
        // ,.i_s_comma_aligned     (c_dec_8b_comma_aligned)
        // ,.i_unif_clk            (i_vl_rx_0_clk  )
        // ,.i_unif_rst_n          (i_serial_rx_rst_n)
        // ,.o_u_aligned_data      (c_aligned_data    )
        // ,.o_u_aligned_datak     (c_aligned_datak   )
        // ,.o_u_deskew_aligned    (c_deskew_aligned  )                      //TODO: add to debug signal
        // ,.o_s_rx_fifo_full      ()    //TODO: add to debug signal
        // ,.o_s_overflow          (o_vl_rx_rxld_overflow       )    //TODO: add to debug signal
        // ,.o_u_rx_fifo_empty     ()    //TODO: add to debug signal  
        // ,.o_u_underflow         (o_vl_rx_0_rxld_underflow      )    //TODO: add to debug signal  
        // ,.o_u_am_match_err      ()    //TODO: add to debug signal
        // ,.o_u_rxld_fsm          ()
    // );
    // assign o_vl_rx_0_rxld_aligned = c_deskew_aligned;

//================================================================================
//Function  : block sync
//================================================================================
    // RX_RS_BL_SYNC_X4 #(`RS_N,`RS_K) m_rx_rs_bl_sync_x4(
         // .i_clk             (i_vl_rx_0_clk            )
        // ,.i_rst_n           (i_serial_rx_rst_n          )
        // ,.i_data            (c_aligned_data           )
        // ,.i_datak           (c_aligned_datak          )
        // ,.i_deskew_aligned  (c_deskew_aligned     )
        // ,.o_data            (c_rbs_x4_data           )
        // ,.o_sof             (c_rbs_x4_sof            )
        // ,.o_rs_data_symbol  (c_rbs_x4_rs_data_symbol )
        // ,.o_rs_check_symbol (c_rbs_x4_rs_check_symbol)
    // );
    // RX_RS_BL_SYNC_X1 #(`RS_N,`RS_K) m_rx_rs_bl_sync_x1(
         // .i_clk             (i_vl_rx_0_clk            )
        // ,.i_rst_n           (i_serial_rx_rst_n          )
        // ,.i_data            (c_dec_8b_data[7:0]       )
        // ,.i_datak           (c_dec_8b_datak[0]          )
        // ,.i_comma_aligned   (c_dec_8b_comma_aligned[0])
        // ,.o_data            (c_rbs_x1_data           )
        // ,.o_sof             (c_rbs_x1_sof            )
        // ,.o_rs_data_symbol  (c_rbs_x1_rs_data_symbol )
        // ,.o_rs_check_symbol (c_rbs_x1_rs_check_symbol)
    // );
	
    // assign c_rbs_data[31:0] = i_x1_mode ? {24'h0, c_rbs_x1_data} : c_rbs_x4_data;
    // assign c_rbs_sof = i_x1_mode ? c_rbs_x1_sof : c_rbs_x4_sof;
    // assign c_rbs_rs_data_symbol = i_x1_mode ? c_rbs_x1_rs_data_symbol : c_rbs_x4_rs_data_symbol;
    // assign c_rbs_rs_check_symbol = i_x1_mode ? c_rbs_x1_rs_check_symbol : c_rbs_x4_rs_check_symbol;
    // assign c_rbs_data_aligned = i_x1_mode ? c_dec_8b_comma_aligned : c_deskew_aligned;

//================================================================================
//Function  : de sync
//================================================================================
	(*keep = "true"*)wire syn_data_out;
	(*keep = "true"*)wire syn_en_out;
	(*keep = "true"*)wire syn_eop_out;
	wire						 clk_div8_out;
	desyn #(`RS_N*8*2*8) 	desyn
     (
            .clk             (i_serial_rx_clk),
            .reset           (~i_serial_rx_rst_n),
            .data_in         (i_serial_rx_data),
			
            .data_out        (syn_data_out),
            .en_out          (syn_en_out),
            .eop_out         (syn_eop_out),
//			.syn_count_out         (syn_count_out),
//          .error_1000         (error_1000),
			.clk_div8_out	 (clk_div8_out),
			.i_threshold	 (i_threshold)
        );	 
	(* preserve *) reg [7:0]	r_sync_cnt;
    always@(posedge clk_div8_out or negedge i_serial_rx_rst_n) begin
        if (~i_serial_rx_rst_n) begin
            r_sync_cnt <= `DELAY 32'd0;
        end
        else begin
			if(syn_eop_out)
            r_sync_cnt <= r_sync_cnt + 1'b1;
        end
    end	
	assign o_sync_cnt = r_sync_cnt;
	
//================================================================================
//Function  : s2p
//================================================================================
	(*keep = "true"*)wire [7 : 0] parallel_data_out;
	(*keep = "true"*)wire parallel_en_out;
	(*keep = "true"*)wire parallel_clk_out;
	(*keep = "true"*)wire parallel_sop_out;
	(*keep = "true"*)wire parallel_eop_out;

	data_s2p  data_s2p
     (
            .clk                    (clk_div8_out),
            .reset                  (~i_serial_rx_rst_n),
            .data_in                (syn_data_out),
            .data_en        			(syn_en_out),
            .data_eop          		(syn_eop_out),
				
			.parallel_clk_out       	(parallel_clk_out),
            .parallel_data_out      (parallel_data_out),
            .parallel_en_out        (parallel_en_out),
			.parallel_sop_out				(parallel_sop_out),
            .parallel_eop_out       (parallel_eop_out)
		);		 

    reg [8:0]  	r_rs_symbol_cnt;	
	reg 		parallel_en_out_d1;
	reg 		parallel_en_out_d2;
	reg 		parallel_sop_out_d1;
	reg 		parallel_sop_out_d2;
	reg [7:0]		parallel_data_out_d1;
	reg [7:0]		parallel_data_out_d2;
    always@(posedge parallel_clk_out or negedge i_serial_rx_rst_n) begin
        if (~i_serial_rx_rst_n) begin
            r_rs_symbol_cnt <= 9'd0; 
			parallel_en_out_d1 <= 1'b0;
			parallel_en_out_d2 <= 1'b0;
        end
        else begin	
			parallel_en_out_d1  <= parallel_en_out;
			parallel_sop_out_d2 <= parallel_en_out_d1;
			if (parallel_sop_out) begin
				r_rs_symbol_cnt <= 9'd0; 
			end
			else if (parallel_en_out) begin
				r_rs_symbol_cnt <= r_rs_symbol_cnt +1'b1;
			end
        end
    end	
	
    always@(posedge parallel_clk_out or negedge i_serial_rx_rst_n) begin
        if (~i_serial_rx_rst_n) begin
            parallel_data_out_d1			<= 8'd0;
            parallel_data_out_d2 			<= 8'd0;
			parallel_sop_out_d1					<= 1'b0;
			parallel_sop_out_d2		<= 1'b0;
        end
        else begin	
			parallel_data_out_d1 <= parallel_data_out;
			parallel_data_out_d2 <= parallel_data_out_d1;
			
			parallel_sop_out_d1 <=parallel_sop_out;
			parallel_sop_out_d2 <=parallel_sop_out_d1;
        end
    end
	
    assign c_rbs_data = parallel_data_out_d1;
	assign c_rbs_sof = parallel_sop_out_d1;
	assign c_rbs_rs_data_symbol = ( r_rs_symbol_cnt< (`RS_K) ) ? parallel_en_out_d1 : 1'b0;
	assign c_rbs_rs_check_symbol = ( r_rs_symbol_cnt>= (`RS_K) ) ? parallel_en_out_d1 : 1'b0;
	
//================================================================================
//Function  : rs decoder
//================================================================================
`ifdef RS_QUATUS    
    wire [7:0]  	r_quatus_rs_data;	
    wire [7:0]  	c_rs_rserr;	
    wire   	c_rs_quatus_rserr_1bit;	
	wire 			r_quatus_rs_data_valid;
	wire 			r_quatus_rs_data_sof;
	RS_DE_LANE_QUATUS m_rx_rs_dec(
		.clk                	(parallel_clk_out)
		,.reset             	(r_quatus_rs_rst)
		,.rsin            		(parallel_data_out)
		,.sink_val          	(parallel_en_out )
		,.sink_sop             	(parallel_sop_out)
		,.sink_eop             	(parallel_eop_out)
		,.sink_ena             	(c_rs_in_ready)
			 ,.bypass					(1'b0)
			 
		,.rsout             	(r_quatus_rs_data)
		,.source_ena            (1'b1)
		,.source_val      		(r_quatus_rs_data_valid)
		,.source_sop      		(r_quatus_rs_data_sof)
		,.source_eop      		()
		,.decfail      			(c_rs_decfail)
		,.num_err_sym      		()
		,.num_err_bit0      	()
		,.num_err_bit1      	()
		,.rserr      				(c_rs_rserr)
	);
	assign c_rs_quatus_rserr_1bit = c_rs_rserr[7] | c_rs_rserr[6] | c_rs_rserr[5] | c_rs_rserr[4] | c_rs_rserr[3] | c_rs_rserr[2] | c_rs_rserr[1] | c_rs_rserr[0]; 
    
	reg r_quatus_rs_rst;
	always@(posedge parallel_clk_out or negedge i_serial_rx_rst_n) begin
        if (~i_serial_rx_rst_n) begin
            r_quatus_rs_rst			<= 1'd0;  //20190929
        end
        else begin	
			if (c_rs_decfail ) begin
				r_quatus_rs_rst			<= 1'd1;
			end
			else if ( parallel_eop_out == 1'b1 && r_quatus_rs_rst == 1'b1) begin
				r_quatus_rs_rst			<= 1'd0;
			end
        end
    end
	
	remove_chec_symbol m_remove_chec_symbol(
		.i_clk                	(parallel_clk_out)
		,.i_rst_n             	(i_serial_rx_rst_n)
		,.i_rs_de_data   		(r_quatus_rs_data)
		,.i_rs_de_data_valid    (r_quatus_rs_data_valid )
		,.i_rs_de_sof        	(r_quatus_rs_data_sof)
		,.i_rs_de_eof        	(1'b0)
	
		,.o_rs_re_data        		(c_rsdec_data[7:0])
		,.o_rs_re_data_valid 		(c_rsdec_data_valid[0])
		,.o_rs_re_sof          		(c_rsdec_sof[0])
		,.o_rs_re_eof           	()
	);
	
	
`else
    genvar i;
    generate
`ifdef X1_ONLY_MODE
        for(i=0; i<=0; i=i+1) begin: RS_DEC_LANE
`else
        for(i=0; i<=3; i=i+1) begin: RS_DEC_LANE
`endif
            RX_RS_DEC m_rx_rs_dec(
                 .i_clk             (parallel_clk_out            )
                ,.i_rst_n           (i_serial_rx_rst_n          )
                ,.i_rs_en           (i_rs_en)
                ,.i_data_aligned    (1'b1       )
                ,.i_enc_data        (c_rbs_data[i*8+:8]       )
                ,.i_sof             (c_rbs_sof            )
                ,.i_rs_data_symbol  (c_rbs_rs_data_symbol )
                ,.i_rs_check_symbol (c_rbs_rs_check_symbol)
                ,.o_dec_data        (c_rsdec_data[i*8+:8]   )
                ,.o_dec_data_valid  (c_rsdec_data_valid[i] )
                ,.o_dec_sof         (c_rsdec_sof[i]        )
                ,.o_rs_fail         (o_vl_rx_0_rs_fail[i]      )
                ,.o_rs_err_found    (o_vl_rx_0_rs_err_found[i] )
                ,.o_rs_err_num      (o_vl_rx_0_rs_err_num[i*5+:5])
            );
        end
    endgenerate
`endif
//================================================================================
//Function  : rx interface
//================================================================================
    RX_INTERFACE m_rx_interface(
         .i_rx_clk          (parallel_clk_out)
        ,.i_rx_rst_n        (i_serial_rx_rst_n)
        ,.i_rx_data         (c_rsdec_data)
        ,.i_rx_data_valid   (c_rsdec_data_valid[0])
        ,.i_rx_sof          (c_rsdec_sof[0])
        ,.i_ati_clk         (i_vl_tx_clk)
        ,.i_ati_rst_n       (i_vl_tx_rst_n)
        ,.o_ati_val         (o_ati_val )
        ,.o_ati_sof         (o_ati_sof )
        ,.o_ati_eof         (o_ati_eof )
        ,.o_ati_be          (o_ati_be  )
        ,.o_ati_data        (o_ati_data)
        ,.i_ati_rdy         (i_ati_rdy )
        ,.i_x1_mode         (i_x1_mode )
    );
endmodule
