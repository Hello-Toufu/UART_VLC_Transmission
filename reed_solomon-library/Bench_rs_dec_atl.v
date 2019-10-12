////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-
// Description	:  testbench is for simulation on the standard
//                 atlantic RS decoder. Verilog version 
//
// Copyright 2008 (c) Altera Corporation
// All rights reserved
//
////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-


`timescale 1ns/100ps

module bench_rs_dec_atl (
	reset, clk,
	sink_ena,	sink_val,	sink_sop,	sink_eop,
		decoder_2_bench, rserr, 
		num_err_sym, num_err_bit, num_err_bit0, num_err_bit1, decfail, 
		bench_2_decoder, bench_2_dec_erasures, 
		numcheck, numn, 
		source_ena,	source_val, source_sop, source_eop, bypass
		);
		
	  parameter check = 6;
		parameter m = 4;
		parameter irrpol = 19; 
		parameter genstart = 0;
		parameter rootspace = 1;
		parameter Erasures = "false";
		parameter Varcheck = "false";
		parameter wide = 3;
		parameter bitwide = 4;
		parameter channel_bypass = 0;
		parameter seed = 1;
		parameter INPUT_FILE = "rs_encoded_data.txt";
		parameter BLOCKS_FILE = "block_period_stim.txt";
		parameter FSUM_IN_FILE = "summary_input.txt";
		parameter FSUM_OUT_FILE = "summary_output.txt";
		parameter test_for  = "BER";  
	
		input sink_val, sink_sop, sink_eop, decfail, source_ena;
		output reset, clk, sink_ena, bench_2_dec_erasures, source_val, source_sop, source_eop, bypass; 
		input [m:1] decoder_2_bench;
		input [m:1] rserr;
		input [wide:1] num_err_sym;
		input [bitwide:1] num_err_bit;
		input [bitwide:1] num_err_bit0;
		input [bitwide:1] num_err_bit1;
		output [m:1] bench_2_decoder;
		output [wide:1] numcheck;
		output [m:1] numn;
		
		reg clk_int, reset_int, bench_2_dec_erasures, bypass;
		reg [wide:1] numcheck;
		reg [m:1] numn;
		reg [m:1] bench_2_decoder;
		reg source_val, sink_ena;
		

`define clock_period #30
`define half_clock_period #15
`define clock_offset #4

parameter time_lapse_max = 1000000;
parameter integer gf_m = 2**m-1;
parameter str8 = "Parameters: check m irrpol genstart rootspace seed";

reg keep_clk_running, expecting_sop, data_available;
integer data_cw_pipe[0:4][gf_m:0];
reg decfail_cw_pipe[0:4]; 
integer  numerr_cw_pipe[0:4], size_cw_pipe[0:4], check_cw_pipe[0:4]; // : NATURAL_ARRAY(0 to 4);
reg fail_detect, fail_correct, misleading_decfail; 
integer count_fail_correct, pos_ptr_data, temp_pos;

reg dav_source_gen, decfail_q; 
reg [m:1] channel_2_source, file_2_channel, decoder_2_bench_q;

parameter S0 = 2'b00, out_idle = 2'b01, out_active = 2'b10, out_hold = 2'b11;
reg [1:0] atl_buffer_state; 

integer time_lapse;

reg [4:1] sop_source_pipe, eop_source_pipe;

reg [m:1] bench_2_decoder_shunt, bench_2_decoder_d;
reg eras_sym_shunt;
reg sop_source_gen, eop_source_gen;
reg sop_source_shunt, eop_source_shunt;
reg allow_val_assert, allow_ena_assert;
reg ena_sink_q, sink_val_q, sink_sop_q, sink_eop_q;
integer sink_eop_counter, source_eop_counter;
reg dav_source_int, ena_data_sourcing;
reg eras_source, eras_2_channel, eras_2_channel_var, eras_sym_d; 

integer file_data_stim, file_block_stim, file_summary_in, file_summary_out;
integer i, j, good_read;
reg [7:0]L_num_blocks;
reg [7:0]L_bypass[0:100];
reg [m:1]L_numcheck[0:100];
reg [m:1]L_size_of_block[0:100];
integer source_eop_cnt_var, block_index;
integer symbol_in_block;
integer symbol_val, wr_ptr_var, num_errors, num_eras;
integer n_err, n_era;
integer delivered_val, error_val, min_val;
reg error_mark[gf_m:0];
reg eras_mark[gf_m:0];
reg eras_noerror_mark[gf_m:0];
reg [23:0] rand;
reg reset_time_counter;
integer rd_ptr_var, cw_ptr_var;
reg sop_source_d, eop_source_d;

integer err_count;
assign clk = clk_int;
assign reset = reset_int;

//Osc: process
initial
	clk_int = 1'b1;

always
	begin: clock
	`half_clock_period
	if (keep_clk_running==1) 
		clk_int = ~clk_int;
	else
		$stop;
	end
	
//stim_atlantic: process
initial
	begin
	file_data_stim = $fopen(INPUT_FILE, "r");
	if (file_data_stim == 0) $finish;
	file_block_stim = $fopen(BLOCKS_FILE, "r");
	if (file_block_stim == 0) $finish;
	file_summary_in = $fopen("summary_input.txt", "w");
	if (file_summary_in == 0) $finish;
	
	good_read = $fscanf(file_block_stim,"%d",L_num_blocks);
	if (good_read == 0) $finish;
	$display("Number of blocks = %0d", L_num_blocks);
	for (i=0; i<L_num_blocks; i=i+1)
	begin
		good_read = $fscanf(file_block_stim,"%d",L_bypass[i]);
		if (good_read == 0) $display("0");
		if (good_read == 0) $finish;
	end
	for (i=0; i<L_num_blocks; i=i+1)
	begin
		good_read = $fscanf(file_block_stim,"%d",L_numcheck[i]);
		if (good_read == 0) $display("1");
		if (good_read == 0) $finish;
	end
	for (i=0; i<L_num_blocks; i=i+1)
	begin
		good_read = $fscanf(file_block_stim,"%d",L_size_of_block[i]);
		if (good_read == 0) $display("2");
		if (good_read == 0) $finish;
	end
	
$fwrite(file_summary_in, "%s\n", str8);
$fwrite(file_summary_in, "%0d %0d %0d %0d %0d\n", check, m, irrpol, genstart, rootspace);

data_available = 1;
sink_eop_counter = 0;
source_eop_counter = 0;
if (L_bypass[0]==0)
	bypass = 1'b0;
else
	bypass = 1'b1;
numcheck = L_numcheck[0];
numn     = L_size_of_block[0];
source_eop_cnt_var = 0;
symbol_in_block = 0;
reset_int <= 1'b1;
dav_source_gen = 1'b0;
file_2_channel = 0;
delivered_val = 0;

pos_ptr_data = 1'b0;
bench_2_dec_erasures = 1'b0;
sop_source_gen = 1'b0;
eop_source_gen = 1'b0;
`clock_period
`clock_offset reset_int = 1'b0;
`clock_period
dav_source_gen = 1'b1;

for(block_index=0; block_index < L_num_blocks; block_index=block_index+1) 
begin: main1 
	for(symbol_in_block=1; symbol_in_block<=L_size_of_block[block_index]; symbol_in_block=symbol_in_block+1)
	begin: insideblock
		if (symbol_in_block==1)
		begin
			wr_ptr_var = L_size_of_block[block_index];
			size_cw_pipe[pos_ptr_data] = L_size_of_block[block_index]; 
	
			if (L_numcheck[block_index] > check)
				begin
				$display("Variable Check value is greater than parameter Check");
				$finish;
				end
			check_cw_pipe[pos_ptr_data] = L_numcheck[block_index]; 
	
		  numcheck = L_numcheck[block_index];
			numn     = L_size_of_block[block_index];
			
			if ((L_numcheck[block_index] > L_size_of_block[block_index]-3) && (Erasures=="false"))
				min_val = L_size_of_block[block_index]-3;
			else if (Erasures=="false")
				min_val = L_numcheck[block_index]+1;
			else
				min_val = 3*L_numcheck[block_index]/5;
			rand = {$random} % min_val;
			if (!channel_bypass)
			begin
				num_errors = rand;
				if (Erasures=="true")
				begin
					rand = {$random} % min_val;
					num_eras = rand;
				end
				else
					num_eras = 0;
			end
			else
			begin
				num_errors = 0;
				num_eras = 0;
			end
			
			for (i=0; i<=gf_m; i=i+1)
			begin
				error_mark[i] = 1'b0;
				eras_mark[i] = 1'b0;
				eras_noerror_mark[i] = 1'b0;
			end
			
			$fwrite(file_summary_in, "Sequence %0d\n", source_eop_cnt_var);
			$fwrite(file_summary_in, "%0d errors.\n", num_errors);
			if (num_eras > 0)
				$fwrite(file_summary_in, "%0d erasures.\n", num_eras);
			min_val = 2*L_size_of_block[block_index]/3;
			rand = {$random} % min_val; 
			temp_pos = rand+1;
			n_era = num_eras;
			n_err = num_errors;
			for (i=1; i<=num_errors+num_eras; i=i+1)
			begin: forloop1
				if (!channel_bypass)
					if (!pos_ptr_data)
						if (i % 2 == 0)
							temp_pos = i/2;
						else
							temp_pos = (L_size_of_block[block_index]/2+i/2);
					else if (pos_ptr_data==1)
						// Errors at the end
						temp_pos = L_size_of_block[block_index]-i;
					else if (pos_ptr_data==2)
						// Errors at the begining and at the end
						if (i % 2 == 0)
							temp_pos = i/2;
						else
							temp_pos = L_size_of_block[block_index]-i/2;
					else if (pos_ptr_data==3)
						//  burst of errors
						if (temp_pos==L_size_of_block[block_index])
							temp_pos = 1;
						else
							temp_pos = temp_pos+1;
					else if (pos_ptr_data>=4)
						// dispersed errors
						while (error_mark[temp_pos] || eras_mark[temp_pos] || (eras_noerror_mark[temp_pos]==1'b1))
						begin: loop4pos
							min_val = 2*L_size_of_block[block_index]/3;
							rand = {$random} % min_val;
							temp_pos = rand+1; // +1 to avoid zero values
						end 
				if (!channel_bypass)
				// introduce error
				begin
					if ((n_err>0) && (n_era>0))
					begin
						rand = {$random} % 100;
						if (rand>50)   // introduce erasure
						begin
							rand = {$random} % 100; // flip coin again
							if (rand > 50)  // introduce error-erasure
							begin
								eras_mark[temp_pos] = 1'b1;
								$fwrite(file_summary_in, "Introducing error-erasure on pos %0d\n", temp_pos);
							end
							else
							begin
								eras_noerror_mark[temp_pos] = 1'b1;
								$fwrite(file_summary_in, "Introducing NON-error-erasure on pos %0d\n", temp_pos);
							end //if;
							n_era = n_era-1;
						end
						else  // introduce error
						begin
							error_mark[temp_pos] = 1'b1;
							n_err = n_err-1;
							$fwrite(file_summary_in, "Introducing error on pos %0d\n", temp_pos);
						end //if;
					end
					else if ((n_err==0) && (n_era>0))
					begin
						rand = {$random} % 100; // flip coin again
						if (rand>50)  // introduce error-erasure
						begin
							eras_mark[temp_pos] = 1'b1;
							$fwrite(file_summary_in, "Introducing error-erasure on pos %0d\n", temp_pos);
						end
						else
						begin
							eras_noerror_mark[temp_pos] = 1'b1;
							$fwrite(file_summary_in, "Introducing NON-error-erasure on pos %0d\n", temp_pos);
						end //if;
						n_era = n_era-1;
					end
					else if ((n_err > 0) && (n_era==0))
					begin
						error_mark[temp_pos] = 1'b1;
						$fwrite(file_summary_in, "Introducing error on pos %0d\n", temp_pos);
						n_err = n_err-1;
					end //if;
				end //if;
			end //loop;

			if (2*num_errors + num_eras <= numcheck)
				begin
				decfail_cw_pipe[pos_ptr_data] = 0;
				numerr_cw_pipe[pos_ptr_data] = num_errors + num_eras;
				end
			else   // decfail expected
				begin
				decfail_cw_pipe[pos_ptr_data] = 1;
				numerr_cw_pipe[pos_ptr_data] = (check+1)/2;
				end
			sop_source_gen = 1;
			eop_source_gen = 0;
		end //if symbol_in_block=1
		else if (symbol_in_block == L_size_of_block[block_index])
		begin
			sop_source_gen = 0;
			eop_source_gen = 1;
			if (L_bypass[block_index]==0)
				bypass = 1'b0;
			else
				bypass = 1'b1;
		end
		else
			begin
				sop_source_gen = 0;
				eop_source_gen = 0;
			end

		if (ena_data_sourcing)
		begin
			good_read = $fscanf(file_data_stim,"%d",symbol_val);
			if (!good_read) 
			begin
				$display("not good reading at symbol data");
				$finish;
			end
			if (error_mark[wr_ptr_var] || eras_mark[wr_ptr_var])
			begin
				// introduzing error
				min_val = (gf_m/2 - 1);
				rand = $random % min_val;
				error_val = rand; // + gf_m/2;
				if (error_val==0)	error_val=1;
				delivered_val = (symbol_val + error_val) % gf_m;
				if (eras_mark[wr_ptr_var])  // introduzing error-erasure
					eras_2_channel_var = 1'b1;
				else
					eras_2_channel_var = 1'b0;
			end
			else if (eras_noerror_mark[wr_ptr_var])  // introduzing NON-error-erasures
			begin
   			delivered_val = symbol_val;
				eras_2_channel_var = 1'b1;
			end
			else
			begin
				delivered_val = symbol_val;
				eras_2_channel_var = 1'b0;
			end
			data_cw_pipe[pos_ptr_data][wr_ptr_var] = symbol_val;
			if (wr_ptr_var > 0)
				wr_ptr_var = wr_ptr_var-1;
			//end if;
			rand = $random % 100;
			file_2_channel = delivered_val;
			eras_2_channel = eras_2_channel_var;
			`clock_period;
			if (symbol_in_block == L_size_of_block[block_index])
			begin
				pos_ptr_data = (pos_ptr_data + 1) % 5;
				source_eop_counter = source_eop_counter + 1;
				source_eop_cnt_var = source_eop_cnt_var + 1;
			end
		end
		else
		begin
			symbol_in_block=symbol_in_block-1;
			`clock_period;
		end // if ena_data_sourcing
	end //loop insideblock;
end //loop main;

dav_source_gen = 0;
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
$fclose(file_summary_in);

end //process stim_atlantic;


//channel: process(reset_int, clk_int, file_2_channel)
always @(posedge clk_int)  
begin: channel
	if (reset_int) 
	begin
		channel_2_source <= 0;
		dav_source_int <= 0;
		eras_source <= 0;
	end
	else if (ena_data_sourcing)
	begin
		dav_source_int <= dav_source_gen;
		channel_2_source <= file_2_channel;
		eras_source <= eras_2_channel;
	end //if;
			
end //process channel;

//monitor: Process
initial
begin: monitor
	file_summary_out = $fopen("summary_output.txt", "w");
	if (file_summary_out == 0) $finish;
	rd_ptr_var = 0;
	cw_ptr_var = 0;
	expecting_sop = 1; //TRUE;
	fail_detect = 0;
	fail_correct = 0;
	misleading_decfail = 0;
	count_fail_correct = 0;
	err_count = 0;
	
	@(negedge reset_int);
	`clock_period;
	`clock_period;
	@(sink_val_q)
	@(posedge clk_int);
	while (keep_clk_running)
	begin: reading
		if (expecting_sop && sink_val_q && !sink_sop_q)
			$display("Error: Sink_sop not asserted when expected at time %0d", $time);
		else if (expecting_sop && sink_val_q && sink_sop_q)
		begin
			expecting_sop <= 0;
			rd_ptr_var = size_cw_pipe[cw_ptr_var];
		
			if (decfail_cw_pipe[cw_ptr_var] == decfail_q)
			begin
				fail_detect = 0;
				misleading_decfail = 0;
				if (!decfail_q)
					if ((numerr_cw_pipe[cw_ptr_var] == num_err_sym) && 
					 (data_cw_pipe[cw_ptr_var][rd_ptr_var]==decoder_2_bench_q))
						fail_correct = 0;
					else
					begin
						fail_correct = 1;
						count_fail_correct = count_fail_correct + 1;
					end //if;
				else  // decfail = 1
					fail_correct = 0;
			end //if;
			else
			begin
				fail_correct = 0;
				if (decfail_q)
				begin
					fail_detect = 0;
					misleading_decfail = 1;
				end
				else
				begin
					misleading_decfail = 0;
					fail_detect = 1;
				end //if;
			end //if;
			rd_ptr_var = rd_ptr_var-1;
		end
		else if (sink_val_q && sink_eop_q)
		begin
			expecting_sop = 1;
			if (!decfail_q && !fail_detect && (data_cw_pipe[cw_ptr_var][rd_ptr_var]==decoder_2_bench_q)) //then
				fail_correct = 0;
			else if (!decfail_q && !fail_detect)
			begin
				fail_correct = 1;
				count_fail_correct = count_fail_correct + 1;
			end //if;
			if (rd_ptr_var!=1)
				$display("Error: Sink_eop asserted NOT when expected at time %0d", $time);
			if (misleading_decfail)
				err_count = err_count + 1;
			if (fail_detect)
				err_count = err_count + 1;
			if (count_fail_correct > 0)
			begin
				err_count = err_count + 1;
				count_fail_correct = 0;
			end
			cw_ptr_var = (cw_ptr_var + 1) % 5;
		end
		else if (sink_val_q && !sink_eop_q && (rd_ptr_var==1))
			$display("Error: Sink_eop NOT asserted when expected at time %0d", $time);
		else if (sink_val_q)
		begin
			if (!decfail && !fail_detect && (data_cw_pipe[cw_ptr_var][rd_ptr_var]==decoder_2_bench_q)) //then
				fail_correct = 0;
			else if (!decfail && !fail_detect)
			begin
				fail_correct = 1;
				count_fail_correct = count_fail_correct + 1;
			end //if;
			rd_ptr_var = rd_ptr_var-1;
		end //if;
		@(posedge clk_int || !keep_clk_running);		
	end //loop;
	
	if (err_count >= 1)
		$fwrite(file_summary_out, "Unpredictable results. Decoder fails to detect and correct errors. \n");
	else
		$fwrite(file_summary_out, "Data is decoded successfully.  All errors in input bitstream are detected and/or corrected. \n");

	$fclose(file_summary_out);
end //process monitor;


always @(negedge sink_eop_q or posedge reset_int) 
begin: end_block_stim
		if (reset_int)
			sink_eop_counter <= 0;
		else if (keep_clk_running)
			sink_eop_counter <= sink_eop_counter + 1;
end 

always @(reset_int or sink_val_q or sink_sop_q or sink_eop_q or data_available)																	
begin: monitor_toggling_activity_reset
	reset_time_counter <= 1;
	`clock_period;
	`clock_period;
	reset_time_counter <= 0;
end


always @(posedge clk_int or posedge reset_int)
begin: monitor_toggling_activity
		if (reset_time_counter || reset_int) 
			time_lapse <= 0; // ns;
		else
			time_lapse <= time_lapse + 30;
end 

always @(reset_int, source_eop_counter, 
												sink_eop_counter, data_available, time_lapse)
begin: clk_running_ctrl
	if (reset_int) 
		keep_clk_running <= 1;
	else if ((source_eop_counter == sink_eop_counter) && !data_available)
		keep_clk_running <= 0;
	else if (time_lapse > time_lapse_max)
	begin
		$display("Error: Reached time_lapse_max without activity, probable hang up");
		keep_clk_running <= 0;
		$finish;
	end //if;
end

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
		default: begin 
			allow_val_assert = 0;
			ena_data_sourcing = 0;
		end
		endcase
		
end

always @(posedge clk_int or posedge reset_int)
	begin: clk_atl_sink
	if (reset_int)
	begin
		ena_sink_q <= 0;
		source_val <= 0;
	end
	else
	begin
		ena_sink_q <= source_ena;
		source_val <= source_ena & allow_val_assert;
	end
end


always @(posedge clk_int or posedge reset_int)
begin: clk_atl_data_sink

	if (reset_int)
	begin
		bench_2_decoder_shunt <= 0;
		eras_sym_shunt	 <= 0;
		sop_source_pipe <= 0;
		eop_source_pipe <= 0;
		sop_source_shunt <= 0;
		eop_source_shunt <= 0;
		bench_2_decoder <= 0;
		bench_2_dec_erasures <= 0;
	end
	else 
	begin
		if (ena_data_sourcing)
		begin
			bench_2_decoder_d = channel_2_source;  
			eras_sym_d = eras_source;
			sop_source_d = sop_source_pipe[3];
			eop_source_d = eop_source_pipe[3];
		end
		else
		begin
			bench_2_decoder_d = bench_2_decoder_shunt; 
			eras_sym_d = eras_sym_shunt;
			sop_source_d = sop_source_shunt;
			eop_source_d = eop_source_shunt;
		end
		if (ena_data_sourcing)
		begin
			sop_source_pipe[3] <= sop_source_gen;
			eop_source_pipe[3] <= eop_source_gen;
			bench_2_decoder_shunt <= channel_2_source;
			eras_sym_shunt <= eras_source;
			sop_source_shunt <= sop_source_pipe[3];
			eop_source_shunt <= eop_source_pipe[3];
		end
		if (source_ena)
		begin
			bench_2_decoder <= bench_2_decoder_d;
			bench_2_dec_erasures <= eras_sym_d;
			sop_source_pipe[4] <= sop_source_d; 
			eop_source_pipe[4] <= eop_source_d;
		end
	end
end

assign source_sop = sop_source_pipe[4];
assign source_eop = eop_source_pipe[4];

// END ATLANTIC SOURCE CONTROL LOGIC

always @(posedge clk_int or posedge reset_int)
	begin: clk_atl_source
	if (reset_int)
	begin
		sink_ena	 <= 0;
		sink_val_q <= 0;
		sink_sop_q <= 0;
		sink_eop_q <= 0;
		decoder_2_bench_q <= 0;
		decfail_q <= 0;
	end
	else 
	begin
		`clock_offset	sink_ena   <= allow_ena_assert;
		sink_val_q <= sink_val;
		sink_sop_q <= sink_sop;
		sink_eop_q <= sink_eop & sink_val;
		decoder_2_bench_q <= decoder_2_bench;
		decfail_q <= decfail;
	end
end

initial
begin: ena_source_process
	  allow_ena_assert = 1;
end

endmodule
	
