////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-
// Copyright 2008 (c) Altera Corporation
// All rights reserved
//
////////////////////////////////////////////////////////////////////////-
////////////////////////////////////////////////////////////////////////-

`timescale 1ns/100ps

module testbench();
parameter check= 8;
parameter m= 8;
parameter irrpol= 285;
parameter genstart= 0;
parameter rootspace= 1;
parameter wide= 4;
parameter Varcheck= "false";
parameter test_for = "BER";
parameter INPUT_FILE  = "RS_ENC_LANE_QUATUS_encoded_data.txt";
parameter BLOCKS_FILE = "RS_ENC_LANE_QUATUS_block_period_stim.txt";
parameter FSUM_OUT_FILE  = "RS_ENC_LANE_QUATUS_summary_output.txt";

parameter seed = 1;

wire clk, reset;
wire [m:1] bench_2_encoder;
wire [m:1] encoder_2_bench; 
wire [wide:1] numcheck;
wire ena_rs_ben, val_ben_rs, sop_ben_rs, eop_ben_rs;
wire ena_ben_rs, val_rs_ben, sop_rs_ben, eop_rs_ben;


bench_rs_enc_atl  test_controller(
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
		.encoder_2_bench(encoder_2_bench),
		.bench_2_encoder(bench_2_encoder),
		.numcheck(numcheck));
defparam
		test_controller.check = check,
		test_controller.m = m,
		test_controller.irrpol = irrpol, 
		test_controller.genstart = genstart,
		test_controller.rootspace = rootspace,
		test_controller.Varcheck = Varcheck,
		test_controller.wide = wide, 
		test_controller.seed = seed, 
		test_controller.INPUT_FILE = INPUT_FILE,
		test_controller.BLOCKS_FILE = BLOCKS_FILE,
		test_controller.FSUM_OUT_FILE = FSUM_OUT_FILE,
		test_controller.test_for = test_for;
		

RS_ENC_LANE_QUATUS wrapper_inst(
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
		.rsin(bench_2_encoder),
		.rsout(encoder_2_bench));

endmodule

