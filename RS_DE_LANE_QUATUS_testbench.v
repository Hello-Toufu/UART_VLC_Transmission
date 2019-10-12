////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-
// Copyright 2008 (c) Altera Corporation
// All rights reserved
//
////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-

`timescale 1ns/100ps

module testbench ();
parameter check= 8;
parameter m= 8;
parameter irrpol= 285;
parameter genstart= 0;
parameter rootspace= 1;
parameter wide= 4;
parameter bitwide= 6;
parameter keysize= "full";
parameter Varcheck= "false";
parameter Erasures= "false";
parameter rserr_connect= "true";
parameter err_bit_connect= "false";
parameter inv_file= "RS_DE_LANE_QUATUS_inv_8_285.hex";
parameter first_alpha_file= "RS_DE_LANE_QUATUS_alpha_8_285_1.hex";
parameter test_for = "BER";
parameter INPUT_FILE  = "RS_DE_LANE_QUATUS_encoded_data.txt";
parameter BLOCKS_FILE = "RS_DE_LANE_QUATUS_block_period_stim.txt";
parameter FSUM_IN_FILE  = "RS_DE_LANE_QUATUS_summary_input.txt";
parameter FSUM_OUT_FILE  = "RS_DE_LANE_QUATUS_summary_output.txt";
		parameter channel_bypass = 0;

parameter seed = 1;

wire clk, reset;
wire [wide:1] numcheck;
wire [m:1] numn;
wire [m:1] bench_2_decoder;
wire [m:1] rserr; 
wire [m:1] decoder_2_bench;
wire [wide:1] num_err_sym;
wire [bitwide:1] num_err_bit; 
wire [bitwide:1] num_err_bit0;
wire [bitwide:1] num_err_bit1;
wire decfail, eras_sym, bypass;
wire ena_rs_ben, val_ben_rs, sop_ben_rs, eop_ben_rs;
wire ena_ben_rs, val_rs_ben, sop_rs_ben, eop_rs_ben;


bench_rs_dec_atl  test_controller( 
		.clk(clk),
		.reset(reset),
		.source_ena(ena_rs_ben),
		.source_val(val_ben_rs),
		.source_sop(sop_ben_rs),
		.source_eop(eop_ben_rs),
		.sink_ena(ena_ben_rs),
		.sink_val(val_rs_ben),
		.sink_sop(sop_rs_ben),
		.sink_eop(eop_rs_ben),
		.decoder_2_bench(decoder_2_bench),
		.rserr(rserr),
		.num_err_sym(num_err_sym),
		.num_err_bit(num_err_bit),
		.num_err_bit0(num_err_bit0),
		.num_err_bit1(num_err_bit1),
		.decfail(decfail),
		.bench_2_dec_erasures(eras_sym),
		.bypass(bypass),
		.numcheck(numcheck),
		.numn(numn),
		.bench_2_decoder(bench_2_decoder));

		defparam
		test_controller.check = check,
		test_controller.m = m,
		test_controller.irrpol = irrpol, 
		test_controller.genstart = genstart,
		test_controller.rootspace = rootspace,
		test_controller.Erasures = Erasures,	
		test_controller.Varcheck = Varcheck,
		test_controller.wide = wide, 
		test_controller.bitwide = bitwide,
		test_controller.seed = seed, 
		test_controller.channel_bypass = channel_bypass,
		test_controller.INPUT_FILE = INPUT_FILE,
		test_controller.BLOCKS_FILE = BLOCKS_FILE,
		test_controller.FSUM_IN_FILE = FSUM_IN_FILE,
		test_controller.FSUM_OUT_FILE = FSUM_OUT_FILE,
		test_controller.test_for = test_for;


RS_DE_LANE_QUATUS wrapper_inst(
		.clk(clk), 
		.reset(reset), 
		.sink_ena(ena_rs_ben),
		.sink_val(val_ben_rs), 
		.sink_sop(sop_ben_rs), 
		.sink_eop(eop_ben_rs), 
		.source_ena(ena_ben_rs),
		.source_val(val_rs_ben),
		.source_sop(sop_rs_ben),
		.source_eop(eop_rs_ben),
		.bypass(bypass),
		.rsin(bench_2_decoder),
		.rsout(decoder_2_bench),
		.num_err_sym(num_err_sym),
			.rserr(rserr),
		.decfail(decfail));
	
endmodule	

