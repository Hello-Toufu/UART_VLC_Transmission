`timescale 1ps/1ps
`define CLK_FREQ	200000
`define BAUD_RATE	9600

module nios2_SG_DMA_test(
	//*********** global clock and reset signal *********
	input              	i_sys_clk,
	input              	rx,//UART RX
	output             	tx,//UART TX
		
	output             	arm_rx,// must be input for RX only
	input              	arm_tx,
		
	input              	vlc_rx,
	output             	vlc_tx,
	
	input				PB4,
	input				PB3,
	
	input				F_LED1, //Switch 1: ARM 閹稿鎸崇挧閿嬫降 0: FPGA 閹稿鎸抽幐澶夌瑓
	input				F_LED2,
	
	output				o_pwm_64k
);
	//---------Switch 1: ARM 0: FPGA------------------------
	assign arm_rx 					= 1'b1;
	//assign r_serial_rx_data 	= vlc_rx;

	assign vlc_tx = r_serial_tx_data;
	//-------------------------------------------------------------
	clk_gen_1 m_clk_gen(
		 //.areset    (1'b0)
		.inclk0     (i_sys_clk)
		,.c0        (s_clk_8x)             //200k 8x
		,.c1        (s_clk)       //25k
		,.c2        (clk_6_4M)     //6.4M
		,.locked    (clk_locked) //(o_led3)
	);

	assign c_serial_tx_clk = s_clk;
	assign c_8x_serial_tx_clk = s_clk_8x;
	assign c_vl_tx_clk = s_clk_16d;
	//------------------------- 25K/16 clk--------------------------
	reg [4:0] count_clk_16;
	reg s_clk_16d;
	always@(posedge s_clk or negedge rst_n)begin
		if(!rst_n) begin s_clk_16d<=1'b0; end
		else if(count_clk_16>=0 && count_clk_16<=7) begin s_clk_16d<=1'b1; end
		else begin s_clk_16d<=1'b0; end
	end

	always@(posedge s_clk or negedge rst_n)begin
		if(!rst_n)  count_clk_16<=5'd0;
		else if(count_clk_16>=15) count_clk_16<=5'd0;
		else count_clk_16<=count_clk_16+1'd1;
	end
	//-------------------------------------------------------------


	//----------------------------64K clk--------------------------
	reg [6:0] count_clk;
	reg clk_64k;
	assign o_pwm_64k = clk_64k;
	always@(posedge clk_6_4M or negedge rst_n)begin
		if(!rst_n)  clk_64k<=1'b0;
		else if(count_clk>=0 && count_clk<=8) clk_64k<=1'b1;  //APD voltage control: 9% 150V 10% 163
		else clk_64k<=1'b0;
	end

	always@(posedge clk_6_4M or negedge rst_n)begin
		if(!rst_n)  count_clk<=7'd0;
		else if(count_clk>=99) count_clk<=7'd0;
		else count_clk<=count_clk+1'd1;
	end
	//-------------------------------------------------------------
	assign rst_n = clk_locked;

	wire [7:0] 	c_uart_tdata;
	wire [7:0] 	c_uart_rdata;

	wire [7:0] 	c_tx_rd_data;
	wire		c_tx_rd_empty;
	wire		c_tx_wr_full;
	wire [5:0] 	c_tx_rdusedw;

	reg			i_rd_en;

	UART uart_0(
		.iCLK(s_clk_8x),
		.iRST_N(rst_n),
		.iRX(rx),
		.oTX(tx),
		.oR(rt),
		.oT(tfinish),
		.iT(i_rd_en),
		.iTDATA(c_uart_tdata),
		.oRDATA(c_uart_rdata)
	);
	defparam uart_0.CLK_FREQ=`CLK_FREQ;
	defparam uart_0.BAUD_RATE=`BAUD_RATE;

	
	wire 			c_fifo_tx_req;
	wire [7 : 0]	c_fifo_tx_wr_data;
	assign c_fifo_tx_req 		=  rt;
	assign c_fifo_tx_wr_data 	=  c_uart_rdata;
	
	(*keep = "true"*)wire [11 : 0] 	c_fifo_tx_wrusedw;
	(*keep = "true"*)wire [11 : 0] 	c_fifo_tx_rdusedw;
	(*keep = "true"*)wire [7 : 0] 	c_fifo_tx_rd_data;
	fifo_tx fifo_tx_inst  (
		.aclr		(~clk_locked),
		.wrclk		(s_clk_8x),
		.wrreq		(c_fifo_tx_req   ),
		.data		(c_fifo_tx_wr_data  ),
		.wrfull		(c_fifo_tx_full),
		//.wrempty(wrempty),
		.wrusedw	(c_fifo_tx_wrusedw),
		
		.rdclk		(c_vl_tx_clk),
		.rdreq		(c_fifo_tx_rd_en),
		.q			(c_fifo_tx_rd_data),
		.rdfull		(c_fifo_tx_rdfull),
		.rdempty	(c_fifo_tx_rdempty),
		.rdusedw	(c_fifo_tx_rdusedw)
		);	 
	
	wire [7:0] 	c_wait_time_threshold;
    wait_time_threshold m_wait_time_threshold (
        .source (c_wait_time_threshold)  // 1/25K /16 *64 = 0.16ms
    );
	wire [7:0]	c_fifo_tx_ari_data;
	wire [1:0] 	c_fifo_tx_ari_be;
	wire [15:0] c_fifo_tx_ari_frame_len;
	fifo_2_pcs_tx_interface  #(1024)	m_fifo_2_pcs_tx_interface(
		.i_clk                        (c_vl_tx_clk					)
        ,.i_rst_n                     (clk_locked					)
        ,.i_wait_time_len             (c_wait_time_threshold					)
                                     
        ,.o_fifo_rd_en                (c_fifo_tx_rd_en				)
        ,.i_fifo_rd_data              (c_fifo_tx_rd_data					)
        ,.i_fifo_rd_full              (c_fifo_tx_rdfull					)
        ,.i_fifo_rd_empty             (c_fifo_tx_rdempty					)
        ,.i_fifo_rdusedw              (c_fifo_tx_rdusedw					)
		//,.i_fifo_tx_wr_remainder		(r_fifo_tx_wr_remainder)
                                   
        ,.o_ari_val                   (c_fifo_tx_ari_val                  				)
        ,.o_ari_sof                   (c_fifo_tx_ari_sof                  				)
        ,.o_ari_eof                   (c_fifo_tx_ari_eof                  				)
        ,.o_ari_be                    (c_fifo_tx_ari_be                   				)
        ,.o_ari_data                  (c_fifo_tx_ari_data                 				)
        ,.i_ari_ack                   (c_fifo_tx_ari_ack                  				)
        ,.o_ari_frame_len             (c_fifo_tx_ari_frame_len            				)
        ,.o_ari_frame_len_val         (c_fifo_tx_ari_frame_len_val        				)
	);
	//===============================================================================
	// FSMC interface rx part
	//===============================================================================	
	(*keep = "true"*)wire [7 : 0] 	c_fifo_rx_wr_data;
	(*keep = "true"*)wire [31 : 0] 	c_fifo_rx_wr_cnt;

	(*keep = "true"*)wire [10 : 0] 	c_fifo_rx_rd_cnt;
	(*keep = "true"*)wire [7 : 0] 	c_fifo_rx_rd_data;
	fifo_rx fifo_rx_inst  (
		.aclr	(~clk_locked		),
		.wrclk	(c_vl_tx_clk	),
		.wrreq	(c_fifo_rx_wr_en   ),
		.data	(c_fifo_rx_wr_data ),
		.wrfull	(c_fifo_rx_wr_full	),
		//.wrempty(wrempty),
		//.wrusedw(c_fifo_rx_wr_cnt	),
		
		.rdclk	(s_clk_8x),
		.rdreq	(i_rd_en),
		.q		(c_uart_tdata),
		.rdfull	(c_fifo_rx_rdfull),
		.rdempty(o_rd_empty)
		//.rdusedw(c_fifo_rx_rd_cnt)
		);	 

	//------------------------------------Read data from fifo to UART TX------------------------------------------------
	reg [2:0] sta_rd;
	reg [4:0] r_wait_cnt;
	localparam P_RD_STA_0=3'b000;
	localparam P_RD_STA_1=3'b001;
	localparam P_RD_STA_2=3'b010;
	localparam P_RD_STA_3=3'b100;
	always@(posedge s_clk_8x or negedge rst_n)begin
		if(!rst_n) sta_rd<=P_RD_STA_0;
		else begin
			case(sta_rd)
				P_RD_STA_0: 
				begin
					if(o_rd_empty==1'b0 && tfinish==1'b1) 
						sta_rd<=P_RD_STA_1;
				end
				P_RD_STA_1://rd data
					sta_rd<=P_RD_STA_2;	
				P_RD_STA_2: //wait one clk
					if(r_wait_cnt==5)
						sta_rd<=P_RD_STA_0;	
					else
						sta_rd<=P_RD_STA_2;	
				default:sta_rd<=P_RD_STA_0;
			endcase
		end
	end

	always@(posedge s_clk_8x or negedge rst_n)begin
		if(!rst_n) i_rd_en<=1'b0;
		else if(sta_rd==P_RD_STA_1) i_rd_en<=1'b1;
		else i_rd_en<=1'b0;
	end

	always@(posedge s_clk_8x or negedge rst_n)begin
		if(!rst_n) r_wait_cnt<=5'b0;
		else if(sta_rd==P_RD_STA_2 && r_wait_cnt<=10) r_wait_cnt<=r_wait_cnt+1'b1;
		else r_wait_cnt<=5'b0;
	end
	//------------------------------------Read data from fifo to UART TX------------------------------------------------
	wire [31:0]	c_pcs_ari_data;
	wire [1:0] 	c_pcs_ari_be;
	wire [14:0] c_pcs_ari_frame_len;

	wire [31:0]	c_pcs_ati_data;
	wire [1:0] 	c_pcs_ati_be;
	//===============================================================================
	// PCS (physical coding sublayer) part
	//===============================================================================	
	PCS_TOP
//	#(
//        .PULSE_POSEDGE_TIME(32'd0_001), //time to 
//        .PULSE_NEGEDGE_TIME(32'd60_000),  //time to rst
//        .PULSE_WAITING_TIME(32'd10_000)  
//	)
	m_PCS_TOP	(
		.i_pon_rst_n       			(1'b1                       )

		,.i_vl_tx_rst_n				(clk_locked                  )
		,.i_serial_rx_rst_n			(clk_locked                  )
		,.i_serial_tx_clk				(c_serial_tx_clk                  )
		,.i_serial_rx_clk          (c_8x_serial_tx_clk                  )
		,.o_serial_tx_data         (r_serial_tx_data                 )
		,.i_serial_rx_data         (r_serial_rx_data                 )
		,.i_vl_tx_clk              (c_vl_tx_clk                      )																						 
	                                                                 
		,.i_ari_val                (c_pcs_ari_val                        )
		,.i_ari_sof                (c_pcs_ari_sof                        )
		,.i_ari_eof                (c_pcs_ari_eof                        )
		,.i_ari_be                 (c_pcs_ari_be                         )
		,.i_ari_data               (c_pcs_ari_data                       )
		,.o_ari_ack                (c_pcs_ari_ack                        )
		,.i_ari_frame_len          (c_pcs_ari_frame_len                  )
		,.i_ari_frame_len_val      (c_pcs_ari_frame_len_val              )
		                                                             
		,.o_ati_val                (c_pcs_ati_val      )
		,.o_ati_sof                (c_pcs_ati_sof      )
		,.o_ati_eof                (c_pcs_ati_eof      )
		,.o_ati_be                 (c_pcs_ati_be       )
		,.o_ati_data               (c_pcs_ati_data     )
		,.i_ati_rdy     	       (c_pcs_ati_rdy      )
		
		,.i_threshold				(c_threshold)
	);
	// 1: debug 0: fsmc
	// ari interface
	assign  c_pcs_ari_val              =  c_switch_of_pcs_signals ? c_avalon_ari_val          	: c_fifo_tx_ari_val          ;  
	assign  c_pcs_ari_sof              =  c_switch_of_pcs_signals ? c_avalon_ari_sof          	: c_fifo_tx_ari_sof          ;  
	assign  c_pcs_ari_eof              =  c_switch_of_pcs_signals ? c_avalon_ari_eof          	: c_fifo_tx_ari_eof          ;  
	assign  c_pcs_ari_be               =  c_switch_of_pcs_signals ? c_avalon_ari_be           	: c_fifo_tx_ari_be           ;  
	assign  c_pcs_ari_data[7:0]        =  c_switch_of_pcs_signals ? c_avalon_ari_data[7:0]         	: c_fifo_tx_ari_data         ;  
	assign  c_pcs_ari_frame_len        =  c_switch_of_pcs_signals ? c_avalon_ari_frame_len    	: c_fifo_tx_ari_frame_len    ;  
	assign  c_pcs_ari_frame_len_val    =  c_switch_of_pcs_signals ? c_avalon_ari_frame_len_val	: c_fifo_tx_ari_frame_len_val;  
	
	assign	c_avalon_ari_ack		   =  c_switch_of_pcs_signals ? c_pcs_ari_ack 	: 1'b0;
	assign	c_fifo_tx_ari_ack		   =  c_switch_of_pcs_signals ? 1'b0 			: c_pcs_ari_ack;
	// ati interface
	assign  c_pcs_ati_rdy		       =  c_switch_of_pcs_signals ? c_avalon_ati_rdy			: (~c_fifo_rx_wr_full);       

	// assign c_avalon_ati_val 			=  c_switch_of_pcs_signals ? c_pcs_ati_val  	: 1'b0;
	// assign c_avalon_ati_sof 			=  c_switch_of_pcs_signals ? c_pcs_ati_sof  	: 1'b0;
	// assign c_avalon_ati_eof 			=  c_switch_of_pcs_signals ? c_pcs_ati_eof  	: 1'b0;
	// assign c_avalon_ati_be  			=  c_switch_of_pcs_signals ? c_pcs_ati_be   	: 2'd0;
	// assign c_avalon_ati_data			=  c_switch_of_pcs_signals ? c_pcs_ati_data 	: 32'd0;
	//pac chek will always work
	assign c_avalon_ati_val 			=  1'b1 ? c_pcs_ati_val  	: 1'b0;
	assign c_avalon_ati_sof 			=  1'b1 ? c_pcs_ati_sof  	: 1'b0;
	assign c_avalon_ati_eof 			=  1'b1 ? c_pcs_ati_eof  	: 1'b0;
	assign c_avalon_ati_be  			=  1'b1 ? c_pcs_ati_be   	: 2'd0;
	assign c_avalon_ati_data			=  1'b1 ? c_pcs_ati_data 	: 32'd0;

	assign c_fifo_rx_wr_en              =  c_switch_of_pcs_signals ? 1'b0 			: c_pcs_ati_val;
    assign c_fifo_rx_wr_data            =  c_switch_of_pcs_signals ? 8'd0 			: c_pcs_ati_data[7:0];
	
	//===============================================================================
	// debug part
	//===============================================================================
			
	//===============================================================================
	// interface: ack <--------> ready
	//===============================================================================	
	// pac gen
	wire [31:0]	c_pac_gen_data             ; 
	wire		c_pac_gen_valid            ; 
	wire		c_pac_gen_ready            ; 
	wire		c_pac_gen_startofpacket    ; 
	wire		c_pac_gen_endofpacket      ;
	wire [1:0]	c_pac_gen_empty            ;

	wire [31:0]	c_avalon_ari_data;
	wire [1:0] 	c_avalon_ari_be;
	wire [15:0] c_avalon_ari_frame_len;
	ps_avalon_tx_2_tx_interface	m_ps_avalon_tx_2_tx_interface(
		
		.i_clk                              (c_vl_tx_clk          )
		,.i_rst_n                           (clk_locked           )
                                                                  
		,.i_sgdma_tx_pcs_in_data            (c_pac_gen_data          )           
		,.i_sgdma_tx_pcs_in_valid           (c_pac_gen_valid         )          
		,.o_sgdma_tx_pcs_in_ready           (c_pac_gen_ready         )          
		,.i_sgdma_tx_pcs_in_endofpacket     (c_pac_gen_endofpacket 		)    
		,.i_sgdma_tx_pcs_in_startofpacket   (c_pac_gen_startofpacket   )  
		,.i_sgdma_tx_pcs_in_empty           (c_pac_gen_empty         )           

		,.o_ari_val                         (c_avalon_ari_val             )
		,.o_ari_sof                         (c_avalon_ari_sof             )
		,.o_ari_eof                         (c_avalon_ari_eof             )
		,.o_ari_be                          (c_avalon_ari_be              )
		,.o_ari_data                        ({c_avalon_ari_data[7:0], c_avalon_ari_data[15:8], c_avalon_ari_data[23:16],c_avalon_ari_data[31:24]}            )
		,.i_ari_ack                         (c_avalon_ari_ack             )
		,.o_ari_frame_len                   (c_avalon_ari_frame_len       )
		,.o_ari_frame_len_val               (c_avalon_ari_frame_len_val   )
	);                                         
	
	//===============================================================================
	// avalon need the eof of pac 
	//===============================================================================	
	wire [31:0]	c_avalon_ati_data;
	wire [1:0] 	c_avalon_ati_be;

	//pac check
	wire [31:0]		c_pac_chec_data               ;  
	wire 			c_pac_chec_valid              ;  
	wire 			c_pac_chec_ready              ;  
	wire 			c_pac_chec_startofpacket      ;  
	wire 			c_pac_chec_endofpacket        ;  
	wire [1:0]		c_pac_chec_empty             ;
	frame_eof_regen	m_frame_eof_regen(
		
		.i_clk                              (c_vl_tx_clk          )
		,.i_rst_n                           (clk_locked           )
                                                                  
		,.i_pl_val    						(c_avalon_ati_val      )
		,.i_pl_sof    						(c_avalon_ati_sof      )
		,.i_pl_eof    						(c_avalon_ati_eof      )
		,.i_pl_be     						(c_avalon_ati_be       )
		,.i_pl_data   						(c_avalon_ati_data     )
		,.o_pl_rdy    						(c_avalon_ati_rdy      )

		,.o_ps_val                         (c_pac_chec_valid            )
		,.o_ps_sof                         (c_pac_chec_startofpacket    )
		,.o_ps_eof                         (c_pac_chec_endofpacket      )
		,.o_ps_be                          (c_pac_chec_empty           )
		,.o_ps_data                        ({c_pac_chec_data[7:0], c_pac_chec_data[15:8], c_pac_chec_data[23:16],c_pac_chec_data[31:24]}               )
		,.i_ps_rdy                         (c_pac_chec_ready            )
	);		
	
	//===============================================================================
	// threshold of syn 
	//===============================================================================
	wire [15:0]	c_threshold;
    syn_threshold m_syn_threshold (
        .source (c_threshold)  // syn_threshold
    );	
	wire [3:0]	c_manual_prob;
    manual_rst m_manual_rst (
        .source (c_manual_prob)  // sources.source
    );	
	assign c_manual_rst 			= c_manual_prob[0];
	assign c_tx_frame_num_cnt_rst   = c_manual_prob[1];
	// 1: debug 0: fsmc
	assign c_switch_of_pcs_signals	= c_manual_prob[2];
	assign r_serial_rx_data	 		= c_manual_prob[3] ?  r_serial_tx_data : vlc_rx ;
	//===============================================================================
	// rst gen
	//===============================================================================
	//generate a periodical rst 
    periodical_pulse_gen#(
        .PULSE_POSEDGE_TIME(32'd0_001), //time to 
        .PULSE_NEGEDGE_TIME(32'd60_000),  //time to rst
        .PULSE_WAITING_TIME(32'd10_000)  
	)m_periodical_rst_gen(
        .i_rst_n				(clk_locked && c_manual_rst),
        .i_clk					(c_vl_tx_clk),
        .o_pulse				(r_periodical_rst)
    );
	
	//===============================================================================
	// TX frame cnt
	//===============================================================================	
	(* preserve *) reg r_pcs_ari_sof_d1 /*synthesis keep*/;
   always @ (posedge c_vl_tx_clk or negedge c_tx_frame_num_cnt_rst)
   begin
       if (!c_tx_frame_num_cnt_rst)
           r_pcs_ari_sof_d1 <= 1'd0;
       else begin
           r_pcs_ari_sof_d1 <= c_pcs_ari_sof;
       end
   end
	(* keep *) reg [31:0] r_tx_frame_cnt /* synthesis preserve */;
   always @ (posedge c_vl_tx_clk or negedge c_tx_frame_num_cnt_rst)
   begin
       if (!c_tx_frame_num_cnt_rst)
           r_tx_frame_cnt <= 32'd0;
       else begin
           if ( c_pcs_ari_sof == 1'b1 && r_pcs_ari_sof_d1 == 1'b0) begin // posedge of sof
               r_tx_frame_cnt <= r_tx_frame_cnt + 1'b1;
           end
       end
   end
	assign o_tx_frame_cnt = r_tx_frame_cnt;
	 
	//===============================================================================
	// turn on-off IR LED
	//===============================================================================	
	//generate a pulse
	//reg r_turn_on_ir_led;
    pulse_gen#(
        .PULSE_POSEDGE_TIME(32'd00_001), //time to turn on
        .PULSE_NEGEDGE_TIME(32'd50_000)  //time to turn off
	)m_turn_on_ir_led(
        .i_rst_n				(clk_locked && c_manual_rst && r_periodical_rst),
        .i_clk					(c_vl_tx_clk),
        .o_pulse				(r_led1)
    );
	//assign o_led1 =  c_always_turn_on_tx ? 1'b1 : r_led1;
	
	// delay before sending packet: 10ms() is not enough, 50ms is enough
	// delay after sending packet: 10 ms is enough
	//===============================================================================
	// pac gen and checker
	//===============================================================================	
	//reg turn_on_pac_gen;
    pulse_gen#(
	  .PULSE_POSEDGE_TIME(32'd40_010), //time to send packet
	  .PULSE_NEGEDGE_TIME(32'd40_020)
	)m_turn_on_pac_gen(
	  .i_rst_n				(clk_locked && c_manual_rst && r_periodical_rst),
	  .i_clk					(c_vl_tx_clk),
	  .o_pulse				(c_turn_on_pac_gen)
    );

	//test source gen
    pat_gen_switchable#(
	  .FRAME_LEN_VAL(16'd1024),
	  .FRAME_GAP_VAL(16'd100)
	)m_pat_gen_switchable(
	  .arst_n					(clk_locked && c_manual_rst && r_periodical_rst),
	  .light_modu_clk			(c_vl_tx_clk),
	  .i_switch					(c_turn_on_pac_gen),
	  .light_modu_tdata			(c_pac_gen_data),
	  .light_modu_tvalid		(c_pac_gen_valid),
	  .light_modu_tlast			(c_pac_gen_endofpacket),
	  .light_modu_tready		(c_pac_gen_ready)
    );		
	
	wire [31:0]	c_good_word_num;
	wire [31:0]	c_good_frame_num;
	wire [31:0]	c_frame_num;
	//packet checker 
    pac_chek#(
	  .FRAME_LEN_VAL(16'd1024)
	)m_pac_chek(
	  .i_rst_n					(clk_locked && c_manual_rst),
	  .i_pac_chek_clk			(c_vl_tx_clk),
	  .i_pac_chek_data			(c_pac_chec_data),
	  .i_pac_chek_data_valid	(c_pac_chec_valid),
	  .i_pac_chek_sof			(c_pac_chec_startofpacket),
	  
	  .o_good_word_num			(c_good_word_num),//o_good_word_num == FRAME_LEN_VAL
	  .o_good_frame_num			(c_good_frame_num),
	  .o_frame_num 				(c_frame_num)
	);
	 assign c_pac_chec_ready = 1'b1;
	 assign o_good_frame_num = c_good_frame_num;
endmodule