`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/15
// Design Name: 
// Module Name: tb_rs_8b10b_manchester_switchable
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tb_rs_manchester_switchable();

	reg	r_serial_tx_clk;
	reg	r_serial_rx_clk;
	reg	r_vl_tx_clk;
	reg	r_resetn;
	//serial CLK gen
    initial
      begin 
        r_serial_tx_clk=0;
        forever  # 40 r_serial_tx_clk =~r_serial_tx_clk;
       end 
	//8x serial CLK gen
    initial
      begin 
        r_serial_rx_clk=0;
        forever  # 5 r_serial_rx_clk =~r_serial_rx_clk;
       end 
	//parallal CLK gen
    initial
      begin 
        r_vl_tx_clk=0;
        forever  # 640 r_vl_tx_clk =~r_vl_tx_clk;
       end 
	//Reset gen
    initial
      begin 
        r_resetn = 0;
        # 80000 r_resetn =1;
       end 

	reg	r_switch;
	//switch of the pac_gen
    initial
      begin 
        r_switch = 0;
        # 88000 r_switch =1;
        # 16000	r_switch =0;
        # 1300000 r_switch =1;
        # 16000	r_switch =0;
        # 1500000 r_switch =1;
        # 16000	r_switch =0;
		
       end 	

//================================================================================
//Part: modules \ wires \ regs
//================================================================================	
 
	wire [31:0]		tx_fifo_out_data             ; 
	wire			tx_fifo_out_valid            ; 
	wire			tx_fifo_out_ready            ; 
	wire			tx_fifo_out_startofpacket    ; 
	wire			tx_fifo_out_endofpacket      ;
	wire [1:0]		tx_fifo_out_empty            ;
	
 
	wire [31:0]		rx_fifo_in_data               ;  
	wire 			rx_fifo_in_valid              ;  
	wire 			rx_fifo_in_ready              ;  
	wire 			rx_fifo_in_startofpacket      ;  
	wire 			rx_fifo_in_endofpacket        ;  
	wire [1:0]		rx_fifo_in_empty             ;

	//generate a pulse
    // pulse_gen#(
        // .PULSE_POSEDGE_TIME(32'd1000),
        // .PULSE_NEGEDGE_TIME(32'd2000)
	// )m_pulse_gen(
        // .i_rst_n				(r_resetn),
        // .i_clk					(r_vl_tx_clk),
        // .o_pulse				(r_switch)
    // );


	//test source gen
    pat_gen_switchable#(
        .FRAME_LEN_VAL(16'd1024),
        .FRAME_GAP_VAL(16'd100)
	)m_pat_gen_switchable(
        .arst_n					(r_resetn),
        .light_modu_clk			(r_vl_tx_clk),
        .i_switch				(r_switch),
        .light_modu_tdata		(tx_fifo_out_data),
        .light_modu_tvalid		(tx_fifo_out_valid),
        .light_modu_tlast		(tx_fifo_out_endofpacket),
        .light_modu_tready		(tx_fifo_out_ready)
    );


	wire [31:0]		c_ari_data;
	wire [1:0] 		c_ari_be;
	wire [15:0] 	c_ari_frame_len;

	wire [31:0]		c_pl_data;
	wire [1:0] 		c_pl_be;
	wire			c_serial_rx_data;
	PCS_TOP m_PCS_TOP	(
		.i_pon_rst_n       			(1'b1                       )

		,.i_vl_tx_rst_n				(r_resetn                  )
		,.i_serial_rx_rst_n			(r_resetn                  )
		,.i_serial_tx_clk			(r_serial_tx_clk                  )
		,.i_serial_rx_clk          	(r_serial_rx_clk                  )
		,.o_serial_tx_data         	(c_serial_tx_data                 )
		,.i_serial_rx_data         	(c_serial_rx_data                 )
		,.i_vl_tx_clk              	(r_vl_tx_clk                      )
	
	
		,.i_ari_val                	(c_ari_val                        )
		,.i_ari_sof                	(c_ari_sof                        )
		,.i_ari_eof                	(c_ari_eof                        )
		,.i_ari_be                 	(c_ari_be                         )
		,.i_ari_data               	(c_ari_data                       )
		,.o_ari_ack                	(c_ari_ack                        )
		,.i_ari_frame_len          	(c_ari_frame_len                  )
		,.i_ari_frame_len_val      	(c_ari_frame_len_val              )
	
		,.o_ati_val                	(c_pl_val      )
		,.o_ati_sof                	(c_pl_sof      )
		,.o_ati_eof                	(c_pl_eof      )
		,.o_ati_be                 	(c_pl_be       )
		,.o_ati_data               	(c_pl_data     )
		,.i_ati_rdy     	       	(c_pl_rdy      )
		
		,.i_threshold					(16'd400)
	);
		
		
	ps_avalon_tx_2_tx_interface	m_ps_avalon_tx_2_tx_interface(
		
		.i_clk                              (r_vl_tx_clk          )
		,.i_rst_n                           (r_resetn           )

		,.i_sgdma_tx_pcs_in_data            (tx_fifo_out_data)           
		,.i_sgdma_tx_pcs_in_valid           (tx_fifo_out_valid)          
		,.o_sgdma_tx_pcs_in_ready           (tx_fifo_out_ready)          
		,.i_sgdma_tx_pcs_in_endofpacket     (tx_fifo_out_endofpacket)    
		,.i_sgdma_tx_pcs_in_startofpacket   (tx_fifo_out_startofpacket)  
		,.i_sgdma_tx_pcs_in_empty           (2'd0)           

		,.o_ari_val                         (c_ari_val             )
		,.o_ari_sof                         (c_ari_sof             )
		,.o_ari_eof                         (c_ari_eof             )
		,.o_ari_be                          (c_ari_be              )
		,.o_ari_data                        ({c_ari_data}            )
		,.i_ari_ack                         (c_ari_ack             )
		,.o_ari_frame_len                   (c_ari_frame_len       )
		,.o_ari_frame_len_val               (c_ari_frame_len_val   )
	);

	frame_eof_regen	m_frame_eof_regen(
		
		.i_clk                              (r_vl_tx_clk          )
		,.i_rst_n                           (r_resetn           )

		,.i_pl_val 							(c_pl_val      )
		,.i_pl_sof 							(c_pl_sof      )
		,.i_pl_eof 							(c_pl_eof      )
		,.i_pl_be  							(c_pl_be       )
		,.i_pl_data							(c_pl_data     )
		,.o_pl_rdy 							(c_pl_rdy      )

		,.o_ps_val                         	(rx_fifo_in_valid            )
		,.o_ps_sof                         	(rx_fifo_in_startofpacket    )
		,.o_ps_eof                         	(rx_fifo_in_endofpacket      )
		,.o_ps_be                          	(rx_fifo_in_empty           )
		,.o_ps_data                        	({rx_fifo_in_data}               )
		,.i_ps_rdy                         	(c_ps_rdy            )
	);		
	wire [31:0]	r_good_word_num;
	//packet checker 
    pac_chek#(
        .FRAME_LEN_VAL(16'd200)
	)m_pac_chek(
        .i_rst_n					(r_resetn),
        .i_pac_chek_clk				(r_vl_tx_clk),
        .i_pac_chek_data			(rx_fifo_in_data),
        .i_pac_chek_data_valid		(rx_fifo_in_valid),
        .i_pac_chek_sof				(rx_fifo_in_startofpacket),
        .o_good_word_num			(r_good_word_num)//o_good_word_num == FRAME_LEN_VAL
    );
	
	reg r_state;
	// vlc chain is blocked
	assign c_serial_rx_data = 1'b1 ? c_serial_tx_data : 1'b0;
	// fifo of rx_interface of RX_TOP will be full when c_ps_rdy == 1'b0
	assign c_ps_rdy 		= r_state ? 1'b1 : 1'b0;
    initial
      begin 
        recover_test;
       end 
// ================================================================================
// task  : recover_test
// ================================================================================
    task recover_test;
        begin
            #1;
            r_state = 1;

            #800000;
            r_state = 0;
            #800000;
            r_state = 1;
			

        end
    endtask

	
endmodule