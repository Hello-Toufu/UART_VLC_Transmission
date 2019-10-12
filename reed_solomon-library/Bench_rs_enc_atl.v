////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-
// Description	:  testbench is for simulation on the standard
//                 atlantic RS encoder.  Verilog version
//
// Copyright 2008 (c) Altera Corporation
// All rights reserved
//
////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-


`timescale 1ns/100ps


module bench_rs_enc_atl (
						reset, clk, 
						sink_ena, sink_val, sink_sop, sink_eop,
						encoder_2_bench, bench_2_encoder,numcheck, 
						source_ena, source_val, source_sop, source_eop
						);
		
parameter check = 6;
parameter m = 4;
parameter irrpol = 19; 
parameter genstart = 0;
parameter rootspace = 1;
parameter Varcheck = "false";
parameter wide = 3;
parameter seed = 1;

parameter INPUT_FILE   = "rs_encoded_data.txt";
parameter BLOCKS_FILE  = "block_period_stim.txt";
parameter FSUM_OUT_FILE = "summary_output.txt";
parameter test_for     = "BER";  
		
input sink_val, sink_sop, sink_eop, source_ena;
input [m:1] encoder_2_bench;
output reset, clk, sink_ena, source_val, source_sop, source_eop; 
output [m:1] bench_2_encoder;
output [wide:1] numcheck;

`define clock_period #30
`define half_clock_period #15
`define clock_offset #4

reg [wide:1] numcheck;
reg [m:1] bench_2_encoder;
reg sink_ena;
reg source_sop;
reg source_eop;

parameter time_lapse_max = 1000000;
parameter integer gf_m = 2**m-1;
parameter S0 = 2'b00;
parameter out_idle = 2'b01;
parameter out_active = 2'b10;
parameter out_hold = 2'b11;

reg [1:0] atl_buffer_state;
reg keep_clk_running;
reg expecting_sop;
reg data_available;
reg fail_encoding;
reg reset_int;
reg clk_int;
reg [m:1] file_2_source;
reg [m:1] encoder_2_bench_q;
reg [m:1] encoder_2_bench_int;
reg [m:1] bench_2_encoder_shunt; 
reg [m:1] bench_2_encoder_d; 
reg [4:1] sop_source_pipe;
reg [4:1] eop_source_pipe;

reg sop_source_gen ;
reg eop_source_gen ;
reg sop_source_shunt ;
reg eop_source_shunt;
reg sop_source_d ;
reg eop_source_d ;

reg allow_val_assert ;
reg allow_ena_assert;

reg ena_sink_q ;
reg source_val_q;
reg data_val_pipe ; 
reg data_val_shunt; 
reg data_val_d;

reg sink_val_q ;
reg sink_sop_q ;
reg sink_eop_q;
reg sink_val_int ;
reg sink_sop_int ;
reg sink_eop_int;

reg dav_source_int ;
reg ena_data_sourcing;
reg [7:0]L_num_blocks;
reg [7:0]L_bypass[0:100];
reg [m:1]L_numcheck[0:100];
reg [m:1]L_size_of_block[0:100];
reg [23:0] rand;
reg reset_time_counter;

integer data_cw_pipe[0:2][gf_m:0];
integer data_cw_hold[gf_m:0];

integer size_cw_pipe[0:2]; 
integer check_cw_pipe[0:2]; 

integer pos_ptr_data; 
integer time_lapse;
integer sink_eop_counter ;
integer source_eop_counter;

integer file_data_stim ;
integer file_block_stim ;
integer file_summary_out;
integer i ;
integer j ;
integer good_read;
integer block_index;
integer symbol_in_block;
integer symbol_val ;
integer delivered_val;
integer wr_ptr_var;
integer rd_ptr_var ;
integer cw_ptr_var;

integer err_count;

assign clk = clk_int;
assign reset = reset_int;


//**********************************************************************************************************************************
initial
begin
	clk_int = 1'b1;
end

always
	begin: clock
	`half_clock_period
	if (keep_clk_running==1) 
		clk_int = ~clk_int;
	else
		$stop;
	end

//**********************************************************************************************************************************
initial
begin
	
	file_data_stim = $fopen(INPUT_FILE, "r");
	if (file_data_stim == 0) $finish;
	
	file_block_stim = $fopen(BLOCKS_FILE, "r");
	if (file_block_stim == 0) $finish;
	
	good_read = $fscanf(file_block_stim,"%d",L_num_blocks);
	if (good_read == 0) $finish;
	$display("Number of blocks = %0d", L_num_blocks);
	
	for (i=0; i<L_num_blocks; i=i+1)
	begin
		good_read = $fscanf(file_block_stim,"%d",L_bypass[i]);
		if (good_read == 0) $finish;
	end
	
	for (i=0; i<L_num_blocks; i=i+1)
	begin
		good_read = $fscanf(file_block_stim,"%d",L_numcheck[i]);
		if (good_read == 0) $finish;
	end
	
	for (i=0; i<L_num_blocks; i=i+1)
	begin
		good_read = $fscanf(file_block_stim,"%d",L_size_of_block[i]);
		if (good_read == 0) $finish;
	end

	data_available = 1;
	sink_eop_counter = 0;
	source_eop_counter = 0;
	numcheck = L_numcheck[0];
	reset_int <= 1'b1;
	dav_source_int = 1'b0;

	file_2_source = 0; 
	pos_ptr_data = 0;

	sop_source_gen = 1'b0;
	eop_source_gen = 1'b0;
	`clock_period
	`clock_offset reset_int = 1'b0; //after Clock_Offset;

	for(block_index=0; block_index < L_num_blocks; block_index=block_index+1) 
	begin: main1 
		for(symbol_in_block=1; symbol_in_block<=L_size_of_block[block_index]; symbol_in_block=symbol_in_block+1)
		begin: readblock
			good_read = $fscanf(file_data_stim,"%d",symbol_val);
			
			if (!good_read) 
			begin
				$display("not good reading at symbol data");
				$finish;
			end
			
			data_cw_hold[symbol_in_block] = symbol_val;
			data_cw_pipe[pos_ptr_data][L_size_of_block[block_index] - symbol_in_block+1] = symbol_val;
		end
		
		for(symbol_in_block=1; symbol_in_block<=L_size_of_block[block_index]-L_numcheck[block_index]; symbol_in_block=symbol_in_block+1)
		begin: insideblock
			if (symbol_in_block==1)
			begin
				if (L_numcheck[block_index] > check)
				begin
					$display("Variable Check value is greater than parameter Check");
					$finish;
				end
				
				numcheck = L_numcheck[block_index];
				wr_ptr_var = L_size_of_block[block_index] - L_numcheck[block_index];
				size_cw_pipe[pos_ptr_data] = L_size_of_block[block_index];
				sop_source_gen = 1;
				eop_source_gen = 0;
			end //if symbol_in_block=1
			
			else if (symbol_in_block == L_size_of_block[block_index]-L_numcheck[block_index])
			begin
				sop_source_gen = 0;
				eop_source_gen = 1;
			end
			
			else
			begin
				sop_source_gen = 0;
				eop_source_gen = 0;
			end

			if (ena_data_sourcing)
			begin
				delivered_val = data_cw_hold[symbol_in_block];
				dav_source_int = 1;
				file_2_source = delivered_val;
				`clock_period;
			end // ena_data_sourcing
			
			else
			begin
				symbol_in_block=symbol_in_block-1;
				`clock_period;
			end

		end //insideblock
		source_eop_counter = source_eop_counter + 1;
		pos_ptr_data = (pos_ptr_data + 1) % 3; 
	end //main1;

	dav_source_int = 0;
	
	if (!ena_data_sourcing && keep_clk_running)
		@(posedge ena_data_sourcing);
	else
		`clock_period;
	//end if;
	
	if (!ena_data_sourcing && keep_clk_running)
		@(posedge ena_data_sourcing);
	else
		`clock_period;
	//end if;

	if (keep_clk_running)
	begin
		if (!sink_eop_q)	
			@(posedge sink_eop_q);
		`clock_period;
		`clock_period;
	end //if;
	data_available = 0;

end


//**********************************************************************************************************************************
initial
begin: monitor

	file_summary_out = $fopen("summary_output.txt", "w");
	if (file_summary_out == 0) $finish;
	
	rd_ptr_var = 0;
	cw_ptr_var = 0;
	expecting_sop = 1;
	fail_encoding = 0;
	err_count = 0;
	
	@(negedge reset_int);
	`clock_period;
	`clock_period;
	@(sink_val_q)
	
	@(posedge clk_int);
	while (keep_clk_running) // loop
	begin: reading
		if (expecting_sop && fail_encoding)
			fail_encoding = 0;
		//end if;
		
		if (expecting_sop && sink_val_q && !sink_sop_q)
			$display("Error: Sink_sop not asserted when expected");
			
		else if (expecting_sop && sink_val_q && sink_sop_q)
		begin
			`clock_offset;
			expecting_sop = 0;
			rd_ptr_var = size_cw_pipe[cw_ptr_var];
			
			if ((data_cw_pipe[cw_ptr_var][rd_ptr_var]==encoder_2_bench_q) && !fail_encoding)
				fail_encoding = 0;
			else
				fail_encoding = 1;
			//end if;
			
			rd_ptr_var = rd_ptr_var-1;
		end
		
		else if (sink_val_q && sink_eop_q)
		begin
			`clock_offset;
			expecting_sop = 1;
			
			if ((data_cw_pipe[cw_ptr_var][rd_ptr_var]==encoder_2_bench_q) && !fail_encoding)
				fail_encoding = 0;
			else
				fail_encoding = 1;
			//end if;
			
			if (rd_ptr_var!=1)
				$display("Error: Sink_eop asserted NOT when expected");
			//end if;
			
			rd_ptr_var = rd_ptr_var-1;
			
			if (fail_encoding)
			begin
				err_count = err_count + 1;
				fail_encoding = 0;
			end //if;
			
			cw_ptr_var = (cw_ptr_var + 1) % 3;
		end
		
		else if (sink_val_q && !sink_eop_q && (rd_ptr_var==1))
			$display("Error: Sink_eop asserted NOT when expected");
			
		else if (sink_val_q)
		begin
			if ((data_cw_pipe[cw_ptr_var][rd_ptr_var]==encoder_2_bench_q) && !fail_encoding)
				fail_encoding = 0;
			else
				fail_encoding = 1;
			//end if;
			rd_ptr_var = rd_ptr_var-1;
		end //if;
		@(posedge clk_int);
		
	end //loop;
	if (err_count >= 1)
		$fwrite(file_summary_out, "Encoder fails to encode the input data. \n");
	else
		$fwrite(file_summary_out, "All input data is encoded successfully. \n");

	$fclose(file_summary_out);
	
end


//**********************************************************************************************************************************
always @(negedge sink_eop_q or posedge reset_int) 
begin: end_block_stim 
	if (reset_int)
		sink_eop_counter <= 0;
	else if (keep_clk_running)
	begin
		sink_eop_counter <= sink_eop_counter + 1;
		`clock_period;
	end
end


//**********************************************************************************************************************************
always @(reset_int or sink_val_q or sink_sop_q or sink_eop_q or data_available)																	
begin: monitor_toggling_activity_reset
	reset_time_counter <= 1;
	`clock_period;
	`clock_period;
	reset_time_counter <= 0;
end


//**********************************************************************************************************************************
always @(posedge clk_int or posedge reset_int)
begin: monitor_toggling_activity
		if (reset_time_counter || reset_int) 
			time_lapse <= 0; // ns;
		else
			time_lapse <= time_lapse + 30; //clock_period;
end 


//**********************************************************************************************************************************
always @(reset_int, source_eop_counter, sink_eop_counter, data_available, time_lapse)
begin: clk_running_ctrl
	if (reset_int) 
		keep_clk_running <= 1;
	else if ((source_eop_counter == sink_eop_counter) && !data_available) // then
		keep_clk_running <= 0;
	else if (time_lapse > time_lapse_max)
	begin
		$display("Error: Reached time_lapse_max without activity, probable hang up");
		keep_clk_running <= 0;
		$finish;
	end //if;
end


//**********************************************************************************************************************************
// START ATLANTIC SOURCE CONTROL LOGIC
always @(posedge clk_int or posedge reset_int)
begin: FSM_out

  if (reset_int)
		atl_buffer_state <= S0;
	else
		case (atl_buffer_state)
		S0:	atl_buffer_state <= out_idle;
		out_idle:
			if (dav_source_int & source_ena) 
					atl_buffer_state <= out_active;
				else if (dav_source_int & !source_ena)
					atl_buffer_state <= out_hold;
		out_hold:
			if (dav_source_int & source_ena) 
				atl_buffer_state <= out_active;
			else if (!dav_source_int & source_ena) 
				atl_buffer_state <= out_idle;
		out_active:
			if (!source_ena) 
				atl_buffer_state <= out_hold;
			else if (!dav_source_int)
				atl_buffer_state <= out_idle;
		
		default: atl_buffer_state <= S0;
		endcase
	
end

always @(atl_buffer_state or dav_source_int) 
begin: outputs_FSM_atl
		case (atl_buffer_state)		
		S0: begin
			allow_val_assert = 0;
			ena_data_sourcing = 0;
		end
		out_idle: begin
			allow_val_assert = dav_source_int;
			ena_data_sourcing = 1;
		end
		out_active: begin
			allow_val_assert = dav_source_int;
			ena_data_sourcing = 1;
		end
		out_hold: begin
			allow_val_assert = 1;
			ena_data_sourcing = 0;
		end
		// coverage off
		default: begin 
			allow_val_assert = 0;
			ena_data_sourcing = 0;
		end
		// coverage on
		endcase
		
end


always @(posedge clk_int or posedge reset_int)
	begin: clk_atl_sink
	if (reset_int)
	begin
		ena_sink_q <= 0; // without size / base indicators, is that ok?
		source_val_q <= 0;
	end
	else
	begin
		ena_sink_q <= source_ena;
		source_val_q <= source_ena & allow_val_assert; // after Clock_Offset;
	end //if;
end

assign source_val = source_val_q && data_val_pipe;

always @(posedge clk_int or posedge reset_int)
begin: clk_atl_data_sink

	if (reset_int)
	begin
		bench_2_encoder_shunt <= 0;
		data_val_shunt <= 0;
		sop_source_shunt <= 0;
		eop_source_shunt <= 0;
		bench_2_encoder <= 0;
		data_val_pipe <= 0;
		source_sop <= 0;
		source_eop <= 0;
	end
	else 
	begin
		if (ena_data_sourcing)
		begin
			bench_2_encoder_d = file_2_source;  
			data_val_d = dav_source_int;
			sop_source_d = sop_source_gen;
			eop_source_d = eop_source_gen;
		end
		else
		begin
			bench_2_encoder_d = bench_2_encoder_shunt; 
			data_val_d = data_val_shunt;
			sop_source_d = sop_source_shunt;
			eop_source_d = eop_source_shunt;
		end //if;
		if (ena_data_sourcing)
		begin
			bench_2_encoder_shunt <= file_2_source;  
			data_val_shunt <= dav_source_int; 
			sop_source_shunt <= sop_source_gen; 
			eop_source_shunt <= eop_source_gen; 
		end //if;
		if (source_ena)
		begin
			bench_2_encoder <= bench_2_encoder_d;
			data_val_pipe <= data_val_d;
			source_sop <= sop_source_d;
			source_eop <= eop_source_d;
		end //if;
	end //if;
end
	
// END ATLANTIC SOURCE CONTROL LOGIC

always @(sink_val or sink_sop or sink_eop or encoder_2_bench) 
begin: input_delay
	`clock_offset	sink_val_int <= sink_val;
	sink_sop_int <= sink_sop;
	sink_eop_int <= sink_eop;
	encoder_2_bench_int <= encoder_2_bench;
end

always @(posedge clk_int or posedge reset_int)
begin: clk_atl_source
	if (reset_int)
	begin
		sink_ena	 <= 0;
		sink_val_q <= 0;
		sink_sop_q <= 0;
		sink_eop_q <= 0;
		encoder_2_bench_q <= 0;
	end
	else 
	begin
		`clock_offset	sink_ena   <= allow_ena_assert; // after Clock_Offset;
		sink_val_q <= sink_val_int;
		sink_sop_q <= sink_sop_int;
		sink_eop_q <= sink_eop_int & sink_val_int;
		encoder_2_bench_q <= encoder_2_bench_int;
	end //if;
end
		

initial
begin: ena_source_process
	  allow_ena_assert = 1;
end

endmodule	
