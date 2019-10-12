// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Standard Edition"

// DATE "08/10/2019 17:20:02"

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module RS_DE_LANE_QUATUS (
	clk,
	reset,
	rsin,
	sink_val,
	sink_sop,
	sink_eop,
	source_ena,
	bypass,
	rsout,
	sink_ena,
	source_val,
	source_sop,
	source_eop,
	decfail,
	num_err_sym,
	rserr)/* synthesis synthesis_greybox=1 */;
input 	clk;
input 	reset;
input 	[8:1] rsin;
input 	sink_val;
input 	sink_sop;
input 	sink_eop;
input 	source_ena;
input 	bypass;
output 	[8:1] rsout;
output 	sink_ena;
output 	source_val;
output 	source_sop;
output 	source_eop;
output 	decfail;
output 	[4:1] num_err_sym;
output 	[8:1] rserr;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[1]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[2]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[3]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[4]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[5]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[6]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[7]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[8]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|sink_ena_master~1_combout ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|source_val~combout ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|sop_source_pipe[4]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|eop_source_pipe[4]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|decfail_bis~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[1]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[2]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[3]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[4]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[1]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[2]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[3]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[4]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[5]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[6]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[7]~q ;
wire \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[8]~q ;
wire \clk~input_o ;
wire \reset~input_o ;
wire \source_ena~input_o ;
wire \sink_eop~input_o ;
wire \sink_val~input_o ;
wire \bypass~input_o ;
wire \sink_sop~input_o ;
wire \rsin[1]~input_o ;
wire \rsin[2]~input_o ;
wire \rsin[3]~input_o ;
wire \rsin[4]~input_o ;
wire \rsin[5]~input_o ;
wire \rsin[6]~input_o ;
wire \rsin[7]~input_o ;
wire \rsin[8]~input_o ;


RS_DE_LANE_QUATUS_auk_rs_dec_top_atl auk_rs_dec_top_atl_inst(
	.rsoutff_q_1(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[1]~q ),
	.rsoutff_q_2(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[2]~q ),
	.rsoutff_q_3(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[3]~q ),
	.rsoutff_q_4(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[4]~q ),
	.rsoutff_q_5(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[5]~q ),
	.rsoutff_q_6(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[6]~q ),
	.rsoutff_q_7(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[7]~q ),
	.rsoutff_q_8(\auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[8]~q ),
	.sink_ena(\auk_rs_dec_top_atl_inst|mem_ctrl|sink_ena_master~1_combout ),
	.source_val(\auk_rs_dec_top_atl_inst|mem_ctrl|source_val~combout ),
	.sop_source_pipe_4(\auk_rs_dec_top_atl_inst|mem_ctrl|sop_source_pipe[4]~q ),
	.eop_source_pipe_4(\auk_rs_dec_top_atl_inst|mem_ctrl|eop_source_pipe[4]~q ),
	.decfail_bis(\auk_rs_dec_top_atl_inst|mem_ctrl|decfail_bis~q ),
	.num_err_sym_1(\auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[1]~q ),
	.num_err_sym_2(\auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[2]~q ),
	.num_err_sym_3(\auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[3]~q ),
	.num_err_sym_4(\auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[4]~q ),
	.rserrff_q_1(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[1]~q ),
	.rserrff_q_2(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[2]~q ),
	.rserrff_q_3(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[3]~q ),
	.rserrff_q_4(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[4]~q ),
	.rserrff_q_5(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[5]~q ),
	.rserrff_q_6(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[6]~q ),
	.rserrff_q_7(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[7]~q ),
	.rserrff_q_8(\auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[8]~q ),
	.clk(\clk~input_o ),
	.reset(\reset~input_o ),
	.source_ena(\source_ena~input_o ),
	.sink_eop(\sink_eop~input_o ),
	.sink_val(\sink_val~input_o ),
	.bypass(\bypass~input_o ),
	.sink_sop(\sink_sop~input_o ),
	.rsin({\rsin[8]~input_o ,\rsin[7]~input_o ,\rsin[6]~input_o ,\rsin[5]~input_o ,\rsin[4]~input_o ,\rsin[3]~input_o ,\rsin[2]~input_o ,\rsin[1]~input_o }));

assign \clk~input_o  = clk;

assign \reset~input_o  = reset;

assign \source_ena~input_o  = source_ena;

assign \sink_eop~input_o  = sink_eop;

assign \sink_val~input_o  = sink_val;

assign \bypass~input_o  = bypass;

assign \sink_sop~input_o  = sink_sop;

assign \rsin[1]~input_o  = rsin[1];

assign \rsin[2]~input_o  = rsin[2];

assign \rsin[3]~input_o  = rsin[3];

assign \rsin[4]~input_o  = rsin[4];

assign \rsin[5]~input_o  = rsin[5];

assign \rsin[6]~input_o  = rsin[6];

assign \rsin[7]~input_o  = rsin[7];

assign \rsin[8]~input_o  = rsin[8];

assign rsout[1] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[1]~q ;

assign rsout[2] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[2]~q ;

assign rsout[3] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[3]~q ;

assign rsout[4] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[4]~q ;

assign rsout[5] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[5]~q ;

assign rsout[6] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[6]~q ;

assign rsout[7] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[7]~q ;

assign rsout[8] = \auk_rs_dec_top_atl_inst|mem_ctrl|rsoutff_q[8]~q ;

assign sink_ena = \auk_rs_dec_top_atl_inst|mem_ctrl|sink_ena_master~1_combout ;

assign source_val = \auk_rs_dec_top_atl_inst|mem_ctrl|source_val~combout ;

assign source_sop = \auk_rs_dec_top_atl_inst|mem_ctrl|sop_source_pipe[4]~q ;

assign source_eop = \auk_rs_dec_top_atl_inst|mem_ctrl|eop_source_pipe[4]~q ;

assign decfail = \auk_rs_dec_top_atl_inst|mem_ctrl|decfail_bis~q ;

assign num_err_sym[1] = \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[1]~q ;

assign num_err_sym[2] = \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[2]~q ;

assign num_err_sym[3] = \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[3]~q ;

assign num_err_sym[4] = \auk_rs_dec_top_atl_inst|mem_ctrl|num_err_sym[4]~q ;

assign rserr[1] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[1]~q ;

assign rserr[2] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[2]~q ;

assign rserr[3] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[3]~q ;

assign rserr[4] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[4]~q ;

assign rserr[5] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[5]~q ;

assign rserr[6] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[6]~q ;

assign rserr[7] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[7]~q ;

assign rserr[8] = \auk_rs_dec_top_atl_inst|mem_ctrl|rserrff_q[8]~q ;

endmodule

module RS_DE_LANE_QUATUS_auk_rs_dec_top_atl (
	rsoutff_q_1,
	rsoutff_q_2,
	rsoutff_q_3,
	rsoutff_q_4,
	rsoutff_q_5,
	rsoutff_q_6,
	rsoutff_q_7,
	rsoutff_q_8,
	sink_ena,
	source_val,
	sop_source_pipe_4,
	eop_source_pipe_4,
	decfail_bis,
	num_err_sym_1,
	num_err_sym_2,
	num_err_sym_3,
	num_err_sym_4,
	rserrff_q_1,
	rserrff_q_2,
	rserrff_q_3,
	rserrff_q_4,
	rserrff_q_5,
	rserrff_q_6,
	rserrff_q_7,
	rserrff_q_8,
	clk,
	reset,
	source_ena,
	sink_eop,
	sink_val,
	bypass,
	sink_sop,
	rsin)/* synthesis synthesis_greybox=1 */;
output 	rsoutff_q_1;
output 	rsoutff_q_2;
output 	rsoutff_q_3;
output 	rsoutff_q_4;
output 	rsoutff_q_5;
output 	rsoutff_q_6;
output 	rsoutff_q_7;
output 	rsoutff_q_8;
output 	sink_ena;
output 	source_val;
output 	sop_source_pipe_4;
output 	eop_source_pipe_4;
output 	decfail_bis;
output 	num_err_sym_1;
output 	num_err_sym_2;
output 	num_err_sym_3;
output 	num_err_sym_4;
output 	rserrff_q_1;
output 	rserrff_q_2;
output 	rserrff_q_3;
output 	rserrff_q_4;
output 	rserrff_q_5;
output 	rserrff_q_6;
output 	rserrff_q_7;
output 	rserrff_q_8;
input 	clk;
input 	reset;
input 	source_ena;
input 	sink_eop;
input 	sink_val;
input 	bypass;
input 	sink_sop;
input 	[8:1] rsin;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \key_full:key|bdprev_q[3][2]~q ;
wire \key_full:key|bdprev_q[2][2]~q ;
wire \key_full:key|bdprev_q[4][2]~q ;
wire \key_full:key|bdprev_q[1][1]~q ;
wire \key_full:key|bdprev_q[3][1]~q ;
wire \key_full:key|bdprev_q[2][1]~q ;
wire \key_full:key|bdprev_q[4][1]~q ;
wire \key_full:key|bdprev_q[3][3]~q ;
wire \key_full:key|bdprev_q[2][3]~q ;
wire \key_full:key|bdprev_q[4][3]~q ;
wire \key_full:key|bdprev_q[3][4]~q ;
wire \key_full:key|bdprev_q[2][4]~q ;
wire \key_full:key|bdprev_q[4][4]~q ;
wire \key_full:key|bdprev_q[3][5]~q ;
wire \key_full:key|bdprev_q[2][5]~q ;
wire \key_full:key|bdprev_q[4][5]~q ;
wire \key_full:key|bdprev_q[3][6]~q ;
wire \key_full:key|bdprev_q[2][6]~q ;
wire \key_full:key|bdprev_q[4][6]~q ;
wire \key_full:key|bdprev_q[3][7]~q ;
wire \key_full:key|bdprev_q[2][7]~q ;
wire \key_full:key|bdprev_q[4][7]~q ;
wire \key_full:key|bdprev_q[3][8]~q ;
wire \key_full:key|bdprev_q[2][8]~q ;
wire \key_full:key|bdprev_q[4][8]~q ;
wire \sink_eop_q~q ;
wire \key_full:key|state.S98~q ;
wire \mem_ctrl|chn_status.booked~q ;
wire \mem_ctrl|bms_status.idle~q ;
wire \mem_ctrl|Selector6~1_combout ;
wire \sink_eop_shunt~q ;
wire \sink_eop_q~0_combout ;
wire \sink_eop_q~1_combout ;
wire \bypass_q~q ;
wire \mem_ctrl|load_syn_gen~1_combout ;
wire \mem_ctrl|chn_status.load~q ;
wire \mem_ctrl|Selector20~1_combout ;
wire \chnr|polyz~combout ;
wire \rsin_q[1]~q ;
wire \bypass_q~0_combout ;
wire \chnr|errvec[1]~combout ;
wire \rsin_q[2]~q ;
wire \chnr|errvec[2]~combout ;
wire \rsin_q[3]~q ;
wire \chnr|errvec[3]~combout ;
wire \rsin_q[4]~q ;
wire \chnr|errvec[4]~combout ;
wire \rsin_q[5]~q ;
wire \chnr|errvec[5]~combout ;
wire \rsin_q[6]~q ;
wire \chnr|errvec[6]~combout ;
wire \rsin_q[7]~q ;
wire \chnr|errvec[7]~combout ;
wire \rsin_q[8]~q ;
wire \chnr|errvec[8]~combout ;
wire \mem_ctrl|bms_clear~0_combout ;
wire \mem_ctrl|load_syn_gen~2_combout ;
wire \mem_ctrl|Selector20~4_combout ;
wire \mem_ctrl|bms_clear~1_combout ;
wire \mem_ctrl|bms_clear~2_combout ;
wire \key_full:key|bdprev_q[1][2]~q ;
wire \key_full:key|bdprev_q[1][3]~q ;
wire \key_full:key|bdprev_q[1][4]~q ;
wire \key_full:key|bdprev_q[1][5]~q ;
wire \key_full:key|bdprev_q[1][6]~q ;
wire \key_full:key|bdprev_q[1][7]~q ;
wire \key_full:key|bdprev_q[1][8]~q ;
wire \key_full:key|llnum_q[2]~q ;
wire \key_full:key|llnum_q[1]~q ;
wire \key_full:key|llnum_q[4]~q ;
wire \key_full:key|llnum_q[3]~q ;
wire \rsin_shunt[1]~q ;
wire \rsin_q~0_combout ;
wire \rsin_shunt[2]~q ;
wire \rsin_q~1_combout ;
wire \rsin_shunt[3]~q ;
wire \rsin_q~2_combout ;
wire \rsin_shunt[4]~q ;
wire \rsin_q~3_combout ;
wire \rsin_shunt[5]~q ;
wire \rsin_q~4_combout ;
wire \rsin_shunt[6]~q ;
wire \rsin_q~5_combout ;
wire \rsin_shunt[7]~q ;
wire \rsin_q~6_combout ;
wire \rsin_shunt[8]~q ;
wire \rsin_q~7_combout ;
wire \key_full:key|bd_q[1][2]~q ;
wire \key_full:key|bd_q[3][2]~q ;
wire \key_full:key|bd_q[2][2]~q ;
wire \key_full:key|bd_q[4][2]~q ;
wire \key_full:key|bd_q[1][1]~q ;
wire \key_full:key|bd_q[3][1]~q ;
wire \key_full:key|bd_q[2][1]~q ;
wire \key_full:key|bd_q[4][1]~q ;
wire \key_full:key|bd_q[1][3]~q ;
wire \key_full:key|bd_q[3][3]~q ;
wire \key_full:key|bd_q[2][3]~q ;
wire \key_full:key|bd_q[4][3]~q ;
wire \key_full:key|bd_q[1][4]~q ;
wire \key_full:key|bd_q[3][4]~q ;
wire \key_full:key|bd_q[2][4]~q ;
wire \key_full:key|bd_q[4][4]~q ;
wire \key_full:key|bd_q[1][5]~q ;
wire \key_full:key|bd_q[3][5]~q ;
wire \key_full:key|bd_q[2][5]~q ;
wire \key_full:key|bd_q[4][5]~q ;
wire \key_full:key|bd_q[1][6]~q ;
wire \key_full:key|bd_q[3][6]~q ;
wire \key_full:key|bd_q[2][6]~q ;
wire \key_full:key|bd_q[4][6]~q ;
wire \key_full:key|bd_q[1][7]~q ;
wire \key_full:key|bd_q[3][7]~q ;
wire \key_full:key|bd_q[2][7]~q ;
wire \key_full:key|bd_q[4][7]~q ;
wire \key_full:key|bd_q[1][8]~q ;
wire \key_full:key|bd_q[3][8]~q ;
wire \key_full:key|bd_q[2][8]~q ;
wire \key_full:key|bd_q[4][8]~q ;
wire \sink_sop_q~q ;
wire \syn|syn[1][8]~combout ;
wire \syn|syn[1][7]~combout ;
wire \syn|syn[1][6]~combout ;
wire \syn|syn[1][5]~combout ;
wire \syn|syn[1][4]~combout ;
wire \syn|syn[1][3]~combout ;
wire \syn|syn[1][2]~combout ;
wire \syn|syn[1][1]~combout ;
wire \syn|synin~0_combout ;
wire \syn|syn[8][8]~combout ;
wire \syn|synin~1_combout ;
wire \syn|syn[8][5]~combout ;
wire \syn|syn[8][4]~combout ;
wire \syn|syn[8][3]~combout ;
wire \syn|syn[8][1]~combout ;
wire \syn|synin~2_combout ;
wire \syn|syn[3][7]~combout ;
wire \syn|syn[6][7]~combout ;
wire \syn|syn[3][8]~combout ;
wire \syn|synin~3_combout ;
wire \syn|syn[3][6]~combout ;
wire \syn|syn[6][6]~combout ;
wire \syn|syn[3][5]~combout ;
wire \syn|synin~4_combout ;
wire \syn|syn[3][4]~combout ;
wire \syn|syn[6][4]~combout ;
wire \syn|syn[3][3]~combout ;
wire \syn|synin~5_combout ;
wire \syn|syn[3][1]~combout ;
wire \syn|syn[6][1]~combout ;
wire \syn|syn[3][2]~combout ;
wire \syn|syn[6][2]~combout ;
wire \syn|syn[2][7]~combout ;
wire \syn|syn[7][7]~combout ;
wire \syn|syn[2][8]~combout ;
wire \syn|syn[7][8]~combout ;
wire \syn|syn[2][6]~combout ;
wire \syn|syn[7][6]~combout ;
wire \syn|syn[2][5]~combout ;
wire \syn|syn[7][5]~combout ;
wire \syn|syn[2][4]~combout ;
wire \syn|syn[7][4]~combout ;
wire \syn|syn[2][3]~combout ;
wire \syn|syn[7][3]~combout ;
wire \syn|syn[2][1]~combout ;
wire \syn|syn[7][1]~combout ;
wire \syn|syn[2][2]~combout ;
wire \syn|syn[7][2]~combout ;
wire \syn|syn[4][7]~combout ;
wire \syn|synin~6_combout ;
wire \syn|syn[4][8]~combout ;
wire \syn|syn[5][8]~combout ;
wire \syn|syn[4][6]~combout ;
wire \syn|syn[5][6]~combout ;
wire \syn|syn[4][5]~combout ;
wire \syn|syn[5][5]~combout ;
wire \syn|syn[4][4]~combout ;
wire \syn|synin~9_combout ;
wire \syn|syn[4][3]~combout ;
wire \syn|syn[5][3]~combout ;
wire \syn|syn[4][1]~combout ;
wire \syn|syn[5][1]~combout ;
wire \syn|syn[4][2]~combout ;
wire \syn|syn[5][2]~combout ;
wire \sink_sop_shunt~q ;
wire \sink_sop_q~0_combout ;


RS_DE_LANE_QUATUS_auk_rs_mem_atl mem_ctrl(
	.rsoutff_q_1(rsoutff_q_1),
	.rsoutff_q_2(rsoutff_q_2),
	.rsoutff_q_3(rsoutff_q_3),
	.rsoutff_q_4(rsoutff_q_4),
	.rsoutff_q_5(rsoutff_q_5),
	.rsoutff_q_6(rsoutff_q_6),
	.rsoutff_q_7(rsoutff_q_7),
	.rsoutff_q_8(rsoutff_q_8),
	.sink_eop_q(\sink_eop_q~q ),
	.sink_ena_master(sink_ena),
	.source_val1(source_val),
	.sop_source_pipe_4(sop_source_pipe_4),
	.eop_source_pipe_4(eop_source_pipe_4),
	.decfail_bis1(decfail_bis),
	.num_err_sym_1(num_err_sym_1),
	.num_err_sym_2(num_err_sym_2),
	.num_err_sym_3(num_err_sym_3),
	.num_err_sym_4(num_err_sym_4),
	.rserrff_q_1(rserrff_q_1),
	.rserrff_q_2(rserrff_q_2),
	.rserrff_q_3(rserrff_q_3),
	.rserrff_q_4(rserrff_q_4),
	.rserrff_q_5(rserrff_q_5),
	.rserrff_q_6(rserrff_q_6),
	.rserrff_q_7(rserrff_q_7),
	.rserrff_q_8(rserrff_q_8),
	.stateS98(\key_full:key|state.S98~q ),
	.chn_statusbooked(\mem_ctrl|chn_status.booked~q ),
	.bms_statusidle(\mem_ctrl|bms_status.idle~q ),
	.Selector6(\mem_ctrl|Selector6~1_combout ),
	.bypass_q(\bypass_q~q ),
	.load_syn_gen(\mem_ctrl|load_syn_gen~1_combout ),
	.chn_statusload(\mem_ctrl|chn_status.load~q ),
	.Selector20(\mem_ctrl|Selector20~1_combout ),
	.polyz(\chnr|polyz~combout ),
	.rsin({\rsin_q[8]~q ,\rsin_q[7]~q ,\rsin_q[6]~q ,\rsin_q[5]~q ,\rsin_q[4]~q ,\rsin_q[3]~q ,\rsin_q[2]~q ,\rsin_q[1]~q }),
	.errvec({\chnr|errvec[8]~combout ,\chnr|errvec[7]~combout ,\chnr|errvec[6]~combout ,\chnr|errvec[5]~combout ,\chnr|errvec[4]~combout ,\chnr|errvec[3]~combout ,\chnr|errvec[2]~combout ,\chnr|errvec[1]~combout }),
	.bms_clear(\mem_ctrl|bms_clear~0_combout ),
	.load_syn_gen1(\mem_ctrl|load_syn_gen~2_combout ),
	.Selector201(\mem_ctrl|Selector20~4_combout ),
	.bms_clear1(\mem_ctrl|bms_clear~1_combout ),
	.bms_clear2(\mem_ctrl|bms_clear~2_combout ),
	.llnum_q_2(\key_full:key|llnum_q[2]~q ),
	.llnum_q_1(\key_full:key|llnum_q[1]~q ),
	.llnum_q_4(\key_full:key|llnum_q[4]~q ),
	.llnum_q_3(\key_full:key|llnum_q[3]~q ),
	.clk(clk),
	.reset(reset),
	.source_ena(source_ena),
	.sink_eop(sink_eop),
	.sink_val(sink_val));

RS_DE_LANE_QUATUS_auk_rs_chn_atl chnr(
	.bdprev_q_2_3(\key_full:key|bdprev_q[3][2]~q ),
	.bdprev_q_2_2(\key_full:key|bdprev_q[2][2]~q ),
	.bdprev_q_2_4(\key_full:key|bdprev_q[4][2]~q ),
	.bdprev_q_1_1(\key_full:key|bdprev_q[1][1]~q ),
	.bdprev_q_1_3(\key_full:key|bdprev_q[3][1]~q ),
	.bdprev_q_1_2(\key_full:key|bdprev_q[2][1]~q ),
	.bdprev_q_1_4(\key_full:key|bdprev_q[4][1]~q ),
	.bdprev_q_3_3(\key_full:key|bdprev_q[3][3]~q ),
	.bdprev_q_3_2(\key_full:key|bdprev_q[2][3]~q ),
	.bdprev_q_3_4(\key_full:key|bdprev_q[4][3]~q ),
	.bdprev_q_4_3(\key_full:key|bdprev_q[3][4]~q ),
	.bdprev_q_4_2(\key_full:key|bdprev_q[2][4]~q ),
	.bdprev_q_4_4(\key_full:key|bdprev_q[4][4]~q ),
	.bdprev_q_5_3(\key_full:key|bdprev_q[3][5]~q ),
	.bdprev_q_5_2(\key_full:key|bdprev_q[2][5]~q ),
	.bdprev_q_5_4(\key_full:key|bdprev_q[4][5]~q ),
	.bdprev_q_6_3(\key_full:key|bdprev_q[3][6]~q ),
	.bdprev_q_6_2(\key_full:key|bdprev_q[2][6]~q ),
	.bdprev_q_6_4(\key_full:key|bdprev_q[4][6]~q ),
	.bdprev_q_7_3(\key_full:key|bdprev_q[3][7]~q ),
	.bdprev_q_7_2(\key_full:key|bdprev_q[2][7]~q ),
	.bdprev_q_7_4(\key_full:key|bdprev_q[4][7]~q ),
	.bdprev_q_8_3(\key_full:key|bdprev_q[3][8]~q ),
	.bdprev_q_8_2(\key_full:key|bdprev_q[2][8]~q ),
	.bdprev_q_8_4(\key_full:key|bdprev_q[4][8]~q ),
	.polyz1(\chnr|polyz~combout ),
	.errvec_1(\chnr|errvec[1]~combout ),
	.errvec_2(\chnr|errvec[2]~combout ),
	.errvec_3(\chnr|errvec[3]~combout ),
	.errvec_4(\chnr|errvec[4]~combout ),
	.errvec_5(\chnr|errvec[5]~combout ),
	.errvec_6(\chnr|errvec[6]~combout ),
	.errvec_7(\chnr|errvec[7]~combout ),
	.errvec_8(\chnr|errvec[8]~combout ),
	.load_chn(\mem_ctrl|Selector20~4_combout ),
	.bdprev_q_2_1(\key_full:key|bdprev_q[1][2]~q ),
	.bdprev_q_3_1(\key_full:key|bdprev_q[1][3]~q ),
	.bdprev_q_4_1(\key_full:key|bdprev_q[1][4]~q ),
	.bdprev_q_5_1(\key_full:key|bdprev_q[1][5]~q ),
	.bdprev_q_6_1(\key_full:key|bdprev_q[1][6]~q ),
	.bdprev_q_7_1(\key_full:key|bdprev_q[1][7]~q ),
	.bdprev_q_8_1(\key_full:key|bdprev_q[1][8]~q ),
	.omega_1_2(\key_full:key|bd_q[1][2]~q ),
	.bd_q_2_3(\key_full:key|bd_q[3][2]~q ),
	.bd_q_2_2(\key_full:key|bd_q[2][2]~q ),
	.bd_q_2_4(\key_full:key|bd_q[4][2]~q ),
	.omega_1_1(\key_full:key|bd_q[1][1]~q ),
	.bd_q_1_3(\key_full:key|bd_q[3][1]~q ),
	.bd_q_1_2(\key_full:key|bd_q[2][1]~q ),
	.bd_q_1_4(\key_full:key|bd_q[4][1]~q ),
	.omega_1_3(\key_full:key|bd_q[1][3]~q ),
	.bd_q_3_3(\key_full:key|bd_q[3][3]~q ),
	.bd_q_3_2(\key_full:key|bd_q[2][3]~q ),
	.bd_q_3_4(\key_full:key|bd_q[4][3]~q ),
	.omega_1_4(\key_full:key|bd_q[1][4]~q ),
	.bd_q_4_3(\key_full:key|bd_q[3][4]~q ),
	.bd_q_4_2(\key_full:key|bd_q[2][4]~q ),
	.bd_q_4_4(\key_full:key|bd_q[4][4]~q ),
	.omega_1_5(\key_full:key|bd_q[1][5]~q ),
	.bd_q_5_3(\key_full:key|bd_q[3][5]~q ),
	.bd_q_5_2(\key_full:key|bd_q[2][5]~q ),
	.bd_q_5_4(\key_full:key|bd_q[4][5]~q ),
	.omega_1_6(\key_full:key|bd_q[1][6]~q ),
	.bd_q_6_3(\key_full:key|bd_q[3][6]~q ),
	.bd_q_6_2(\key_full:key|bd_q[2][6]~q ),
	.bd_q_6_4(\key_full:key|bd_q[4][6]~q ),
	.omega_1_7(\key_full:key|bd_q[1][7]~q ),
	.bd_q_7_3(\key_full:key|bd_q[3][7]~q ),
	.bd_q_7_2(\key_full:key|bd_q[2][7]~q ),
	.bd_q_7_4(\key_full:key|bd_q[4][7]~q ),
	.omega_1_8(\key_full:key|bd_q[1][8]~q ),
	.bd_q_8_3(\key_full:key|bd_q[3][8]~q ),
	.bd_q_8_2(\key_full:key|bd_q[2][8]~q ),
	.bd_q_8_4(\key_full:key|bd_q[4][8]~q ),
	.clk(clk),
	.reset(reset));

RS_DE_LANE_QUATUS_auk_rs_bms_atl \key_full:key (
	.bdprev_q_2_3(\key_full:key|bdprev_q[3][2]~q ),
	.bdprev_q_2_2(\key_full:key|bdprev_q[2][2]~q ),
	.bdprev_q_2_4(\key_full:key|bdprev_q[4][2]~q ),
	.bdprev_q_1_1(\key_full:key|bdprev_q[1][1]~q ),
	.bdprev_q_1_3(\key_full:key|bdprev_q[3][1]~q ),
	.bdprev_q_1_2(\key_full:key|bdprev_q[2][1]~q ),
	.bdprev_q_1_4(\key_full:key|bdprev_q[4][1]~q ),
	.bdprev_q_3_3(\key_full:key|bdprev_q[3][3]~q ),
	.bdprev_q_3_2(\key_full:key|bdprev_q[2][3]~q ),
	.bdprev_q_3_4(\key_full:key|bdprev_q[4][3]~q ),
	.bdprev_q_4_3(\key_full:key|bdprev_q[3][4]~q ),
	.bdprev_q_4_2(\key_full:key|bdprev_q[2][4]~q ),
	.bdprev_q_4_4(\key_full:key|bdprev_q[4][4]~q ),
	.bdprev_q_5_3(\key_full:key|bdprev_q[3][5]~q ),
	.bdprev_q_5_2(\key_full:key|bdprev_q[2][5]~q ),
	.bdprev_q_5_4(\key_full:key|bdprev_q[4][5]~q ),
	.bdprev_q_6_3(\key_full:key|bdprev_q[3][6]~q ),
	.bdprev_q_6_2(\key_full:key|bdprev_q[2][6]~q ),
	.bdprev_q_6_4(\key_full:key|bdprev_q[4][6]~q ),
	.bdprev_q_7_3(\key_full:key|bdprev_q[3][7]~q ),
	.bdprev_q_7_2(\key_full:key|bdprev_q[2][7]~q ),
	.bdprev_q_7_4(\key_full:key|bdprev_q[4][7]~q ),
	.bdprev_q_8_3(\key_full:key|bdprev_q[3][8]~q ),
	.bdprev_q_8_2(\key_full:key|bdprev_q[2][8]~q ),
	.bdprev_q_8_4(\key_full:key|bdprev_q[4][8]~q ),
	.sink_eop_q(\sink_eop_q~q ),
	.stateS98(\key_full:key|state.S98~q ),
	.chn_statusbooked(\mem_ctrl|chn_status.booked~q ),
	.bms_statusidle(\mem_ctrl|bms_status.idle~q ),
	.load_syn_gen(\mem_ctrl|load_syn_gen~1_combout ),
	.chn_statusload(\mem_ctrl|chn_status.load~q ),
	.Selector20(\mem_ctrl|Selector20~1_combout ),
	.rsin_q_2(\rsin_q[2]~q ),
	.rsin_q_3(\rsin_q[3]~q ),
	.rsin_q_4(\rsin_q[4]~q ),
	.rsin_q_5(\rsin_q[5]~q ),
	.rsin_q_6(\rsin_q[6]~q ),
	.rsin_q_7(\rsin_q[7]~q ),
	.rsin_q_8(\rsin_q[8]~q ),
	.bms_clear(\mem_ctrl|bms_clear~0_combout ),
	.load_syn_gen1(\mem_ctrl|load_syn_gen~2_combout ),
	.Selector201(\mem_ctrl|Selector20~4_combout ),
	.bms_clear1(\mem_ctrl|bms_clear~1_combout ),
	.bms_clear2(\mem_ctrl|bms_clear~2_combout ),
	.bdprev_q_2_1(\key_full:key|bdprev_q[1][2]~q ),
	.bdprev_q_3_1(\key_full:key|bdprev_q[1][3]~q ),
	.bdprev_q_4_1(\key_full:key|bdprev_q[1][4]~q ),
	.bdprev_q_5_1(\key_full:key|bdprev_q[1][5]~q ),
	.bdprev_q_6_1(\key_full:key|bdprev_q[1][6]~q ),
	.bdprev_q_7_1(\key_full:key|bdprev_q[1][7]~q ),
	.bdprev_q_8_1(\key_full:key|bdprev_q[1][8]~q ),
	.llnum_q_2(\key_full:key|llnum_q[2]~q ),
	.llnum_q_1(\key_full:key|llnum_q[1]~q ),
	.llnum_q_4(\key_full:key|llnum_q[4]~q ),
	.llnum_q_3(\key_full:key|llnum_q[3]~q ),
	.bd_q_2_1(\key_full:key|bd_q[1][2]~q ),
	.bd_q_2_3(\key_full:key|bd_q[3][2]~q ),
	.bd_q_2_2(\key_full:key|bd_q[2][2]~q ),
	.bd_q_2_4(\key_full:key|bd_q[4][2]~q ),
	.bd_q_1_1(\key_full:key|bd_q[1][1]~q ),
	.bd_q_1_3(\key_full:key|bd_q[3][1]~q ),
	.bd_q_1_2(\key_full:key|bd_q[2][1]~q ),
	.bd_q_1_4(\key_full:key|bd_q[4][1]~q ),
	.bd_q_3_1(\key_full:key|bd_q[1][3]~q ),
	.bd_q_3_3(\key_full:key|bd_q[3][3]~q ),
	.bd_q_3_2(\key_full:key|bd_q[2][3]~q ),
	.bd_q_3_4(\key_full:key|bd_q[4][3]~q ),
	.bd_q_4_1(\key_full:key|bd_q[1][4]~q ),
	.bd_q_4_3(\key_full:key|bd_q[3][4]~q ),
	.bd_q_4_2(\key_full:key|bd_q[2][4]~q ),
	.bd_q_4_4(\key_full:key|bd_q[4][4]~q ),
	.bd_q_5_1(\key_full:key|bd_q[1][5]~q ),
	.bd_q_5_3(\key_full:key|bd_q[3][5]~q ),
	.bd_q_5_2(\key_full:key|bd_q[2][5]~q ),
	.bd_q_5_4(\key_full:key|bd_q[4][5]~q ),
	.bd_q_6_1(\key_full:key|bd_q[1][6]~q ),
	.bd_q_6_3(\key_full:key|bd_q[3][6]~q ),
	.bd_q_6_2(\key_full:key|bd_q[2][6]~q ),
	.bd_q_6_4(\key_full:key|bd_q[4][6]~q ),
	.bd_q_7_1(\key_full:key|bd_q[1][7]~q ),
	.bd_q_7_3(\key_full:key|bd_q[3][7]~q ),
	.bd_q_7_2(\key_full:key|bd_q[2][7]~q ),
	.bd_q_7_4(\key_full:key|bd_q[4][7]~q ),
	.bd_q_8_1(\key_full:key|bd_q[1][8]~q ),
	.bd_q_8_3(\key_full:key|bd_q[3][8]~q ),
	.bd_q_8_2(\key_full:key|bd_q[2][8]~q ),
	.bd_q_8_4(\key_full:key|bd_q[4][8]~q ),
	.syn_8_1(\syn|syn[1][8]~combout ),
	.syn_7_1(\syn|syn[1][7]~combout ),
	.syn_6_1(\syn|syn[1][6]~combout ),
	.syn_5_1(\syn|syn[1][5]~combout ),
	.syn_4_1(\syn|syn[1][4]~combout ),
	.syn_3_1(\syn|syn[1][3]~combout ),
	.syn_2_1(\syn|syn[1][2]~combout ),
	.syn_1_1(\syn|syn[1][1]~combout ),
	.synin(\syn|synin~0_combout ),
	.syn_8_8(\syn|syn[8][8]~combout ),
	.synin1(\syn|synin~1_combout ),
	.syn_5_8(\syn|syn[8][5]~combout ),
	.syn_4_8(\syn|syn[8][4]~combout ),
	.syn_3_8(\syn|syn[8][3]~combout ),
	.syn_1_8(\syn|syn[8][1]~combout ),
	.synin2(\syn|synin~2_combout ),
	.syn_7_3(\syn|syn[3][7]~combout ),
	.syn_7_6(\syn|syn[6][7]~combout ),
	.syn_8_3(\syn|syn[3][8]~combout ),
	.synin3(\syn|synin~3_combout ),
	.syn_6_3(\syn|syn[3][6]~combout ),
	.syn_6_6(\syn|syn[6][6]~combout ),
	.syn_5_3(\syn|syn[3][5]~combout ),
	.synin4(\syn|synin~4_combout ),
	.syn_4_3(\syn|syn[3][4]~combout ),
	.syn_4_6(\syn|syn[6][4]~combout ),
	.syn_3_3(\syn|syn[3][3]~combout ),
	.synin5(\syn|synin~5_combout ),
	.syn_1_3(\syn|syn[3][1]~combout ),
	.syn_1_6(\syn|syn[6][1]~combout ),
	.syn_2_3(\syn|syn[3][2]~combout ),
	.syn_2_6(\syn|syn[6][2]~combout ),
	.syn_7_2(\syn|syn[2][7]~combout ),
	.syn_7_7(\syn|syn[7][7]~combout ),
	.syn_8_2(\syn|syn[2][8]~combout ),
	.syn_8_7(\syn|syn[7][8]~combout ),
	.syn_6_2(\syn|syn[2][6]~combout ),
	.syn_6_7(\syn|syn[7][6]~combout ),
	.syn_5_2(\syn|syn[2][5]~combout ),
	.syn_5_7(\syn|syn[7][5]~combout ),
	.syn_4_2(\syn|syn[2][4]~combout ),
	.syn_4_7(\syn|syn[7][4]~combout ),
	.syn_3_2(\syn|syn[2][3]~combout ),
	.syn_3_7(\syn|syn[7][3]~combout ),
	.syn_1_2(\syn|syn[2][1]~combout ),
	.syn_1_7(\syn|syn[7][1]~combout ),
	.syn_2_2(\syn|syn[2][2]~combout ),
	.syn_2_7(\syn|syn[7][2]~combout ),
	.syn_7_4(\syn|syn[4][7]~combout ),
	.synin6(\syn|synin~6_combout ),
	.syn_8_4(\syn|syn[4][8]~combout ),
	.syn_8_5(\syn|syn[5][8]~combout ),
	.syn_6_4(\syn|syn[4][6]~combout ),
	.syn_6_5(\syn|syn[5][6]~combout ),
	.syn_5_4(\syn|syn[4][5]~combout ),
	.syn_5_5(\syn|syn[5][5]~combout ),
	.syn_4_4(\syn|syn[4][4]~combout ),
	.synin7(\syn|synin~9_combout ),
	.syn_3_4(\syn|syn[4][3]~combout ),
	.syn_3_5(\syn|syn[5][3]~combout ),
	.syn_1_4(\syn|syn[4][1]~combout ),
	.syn_1_5(\syn|syn[5][1]~combout ),
	.syn_2_4(\syn|syn[4][2]~combout ),
	.syn_2_5(\syn|syn[5][2]~combout ),
	.clk(clk),
	.reset(reset));

RS_DE_LANE_QUATUS_auk_rs_syn_atl syn(
	.ena(\mem_ctrl|Selector6~1_combout ),
	.rsin_q_1(\rsin_q[1]~q ),
	.rsin_q_2(\rsin_q[2]~q ),
	.rsin_q_3(\rsin_q[3]~q ),
	.rsin_q_4(\rsin_q[4]~q ),
	.rsin_q_5(\rsin_q[5]~q ),
	.rsin_q_6(\rsin_q[6]~q ),
	.rsin_q_7(\rsin_q[7]~q ),
	.rsin_q_8(\rsin_q[8]~q ),
	.sink_sop_q(\sink_sop_q~q ),
	.syn_8_1(\syn|syn[1][8]~combout ),
	.syn_7_1(\syn|syn[1][7]~combout ),
	.syn_6_1(\syn|syn[1][6]~combout ),
	.syn_5_1(\syn|syn[1][5]~combout ),
	.syn_4_1(\syn|syn[1][4]~combout ),
	.syn_3_1(\syn|syn[1][3]~combout ),
	.syn_2_1(\syn|syn[1][2]~combout ),
	.syn_1_1(\syn|syn[1][1]~combout ),
	.synin(\syn|synin~0_combout ),
	.syn_8_8(\syn|syn[8][8]~combout ),
	.synin1(\syn|synin~1_combout ),
	.syn_5_8(\syn|syn[8][5]~combout ),
	.syn_4_8(\syn|syn[8][4]~combout ),
	.syn_3_8(\syn|syn[8][3]~combout ),
	.syn_1_8(\syn|syn[8][1]~combout ),
	.synin2(\syn|synin~2_combout ),
	.syn_7_3(\syn|syn[3][7]~combout ),
	.syn_7_6(\syn|syn[6][7]~combout ),
	.syn_8_3(\syn|syn[3][8]~combout ),
	.synin3(\syn|synin~3_combout ),
	.syn_6_3(\syn|syn[3][6]~combout ),
	.syn_6_6(\syn|syn[6][6]~combout ),
	.syn_5_3(\syn|syn[3][5]~combout ),
	.synin4(\syn|synin~4_combout ),
	.syn_4_3(\syn|syn[3][4]~combout ),
	.syn_4_6(\syn|syn[6][4]~combout ),
	.syn_3_3(\syn|syn[3][3]~combout ),
	.synin5(\syn|synin~5_combout ),
	.syn_1_3(\syn|syn[3][1]~combout ),
	.syn_1_6(\syn|syn[6][1]~combout ),
	.syn_2_3(\syn|syn[3][2]~combout ),
	.syn_2_6(\syn|syn[6][2]~combout ),
	.syn_7_2(\syn|syn[2][7]~combout ),
	.syn_7_7(\syn|syn[7][7]~combout ),
	.syn_8_2(\syn|syn[2][8]~combout ),
	.syn_8_7(\syn|syn[7][8]~combout ),
	.syn_6_2(\syn|syn[2][6]~combout ),
	.syn_6_7(\syn|syn[7][6]~combout ),
	.syn_5_2(\syn|syn[2][5]~combout ),
	.syn_5_7(\syn|syn[7][5]~combout ),
	.syn_4_2(\syn|syn[2][4]~combout ),
	.syn_4_7(\syn|syn[7][4]~combout ),
	.syn_3_2(\syn|syn[2][3]~combout ),
	.syn_3_7(\syn|syn[7][3]~combout ),
	.syn_1_2(\syn|syn[2][1]~combout ),
	.syn_1_7(\syn|syn[7][1]~combout ),
	.syn_2_2(\syn|syn[2][2]~combout ),
	.syn_2_7(\syn|syn[7][2]~combout ),
	.syn_7_4(\syn|syn[4][7]~combout ),
	.synin6(\syn|synin~6_combout ),
	.syn_8_4(\syn|syn[4][8]~combout ),
	.syn_8_5(\syn|syn[5][8]~combout ),
	.syn_6_4(\syn|syn[4][6]~combout ),
	.syn_6_5(\syn|syn[5][6]~combout ),
	.syn_5_4(\syn|syn[4][5]~combout ),
	.syn_5_5(\syn|syn[5][5]~combout ),
	.syn_4_4(\syn|syn[4][4]~combout ),
	.synin7(\syn|synin~9_combout ),
	.syn_3_4(\syn|syn[4][3]~combout ),
	.syn_3_5(\syn|syn[5][3]~combout ),
	.syn_1_4(\syn|syn[4][1]~combout ),
	.syn_1_5(\syn|syn[5][1]~combout ),
	.syn_2_4(\syn|syn[4][2]~combout ),
	.syn_2_5(\syn|syn[5][2]~combout ),
	.clk(clk),
	.reset(reset));

dffeas sink_eop_q(
	.clk(clk),
	.d(\sink_eop_q~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_eop_q~q ),
	.prn(vcc));
defparam sink_eop_q.is_wysiwyg = "true";
defparam sink_eop_q.power_up = "low";

dffeas sink_eop_shunt(
	.clk(clk),
	.d(sink_eop),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\sink_eop_shunt~q ),
	.prn(vcc));
defparam sink_eop_shunt.is_wysiwyg = "true";
defparam sink_eop_shunt.power_up = "low";

cycloneive_lcell_comb \sink_eop_q~0 (
	.dataa(sink_eop),
	.datab(\sink_eop_shunt~q ),
	.datac(sink_val),
	.datad(\sink_eop_q~q ),
	.cin(gnd),
	.combout(\sink_eop_q~0_combout ),
	.cout());
defparam \sink_eop_q~0 .lut_mask = 16'hACFF;
defparam \sink_eop_q~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sink_eop_q~1 (
	.dataa(\mem_ctrl|Selector6~1_combout ),
	.datab(\sink_eop_q~0_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sink_eop_q~1_combout ),
	.cout());
defparam \sink_eop_q~1 .lut_mask = 16'hEEEE;
defparam \sink_eop_q~1 .sum_lutc_input = "datac";

dffeas bypass_q(
	.clk(clk),
	.d(\bypass_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\bypass_q~q ),
	.prn(vcc));
defparam bypass_q.is_wysiwyg = "true";
defparam bypass_q.power_up = "low";

dffeas \rsin_q[1] (
	.clk(clk),
	.d(\rsin_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[1]~q ),
	.prn(vcc));
defparam \rsin_q[1] .is_wysiwyg = "true";
defparam \rsin_q[1] .power_up = "low";

cycloneive_lcell_comb \bypass_q~0 (
	.dataa(bypass),
	.datab(\bypass_q~q ),
	.datac(sink_val),
	.datad(sink_sop),
	.cin(gnd),
	.combout(\bypass_q~0_combout ),
	.cout());
defparam \bypass_q~0 .lut_mask = 16'hEFFE;
defparam \bypass_q~0 .sum_lutc_input = "datac";

dffeas \rsin_q[2] (
	.clk(clk),
	.d(\rsin_q~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[2]~q ),
	.prn(vcc));
defparam \rsin_q[2] .is_wysiwyg = "true";
defparam \rsin_q[2] .power_up = "low";

dffeas \rsin_q[3] (
	.clk(clk),
	.d(\rsin_q~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[3]~q ),
	.prn(vcc));
defparam \rsin_q[3] .is_wysiwyg = "true";
defparam \rsin_q[3] .power_up = "low";

dffeas \rsin_q[4] (
	.clk(clk),
	.d(\rsin_q~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[4]~q ),
	.prn(vcc));
defparam \rsin_q[4] .is_wysiwyg = "true";
defparam \rsin_q[4] .power_up = "low";

dffeas \rsin_q[5] (
	.clk(clk),
	.d(\rsin_q~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[5]~q ),
	.prn(vcc));
defparam \rsin_q[5] .is_wysiwyg = "true";
defparam \rsin_q[5] .power_up = "low";

dffeas \rsin_q[6] (
	.clk(clk),
	.d(\rsin_q~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[6]~q ),
	.prn(vcc));
defparam \rsin_q[6] .is_wysiwyg = "true";
defparam \rsin_q[6] .power_up = "low";

dffeas \rsin_q[7] (
	.clk(clk),
	.d(\rsin_q~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[7]~q ),
	.prn(vcc));
defparam \rsin_q[7] .is_wysiwyg = "true";
defparam \rsin_q[7] .power_up = "low";

dffeas \rsin_q[8] (
	.clk(clk),
	.d(\rsin_q~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\rsin_q[8]~q ),
	.prn(vcc));
defparam \rsin_q[8] .is_wysiwyg = "true";
defparam \rsin_q[8] .power_up = "low";

dffeas \rsin_shunt[1] (
	.clk(clk),
	.d(rsin[1]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[1]~q ),
	.prn(vcc));
defparam \rsin_shunt[1] .is_wysiwyg = "true";
defparam \rsin_shunt[1] .power_up = "low";

cycloneive_lcell_comb \rsin_q~0 (
	.dataa(rsin[1]),
	.datab(\rsin_shunt[1]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~0_combout ),
	.cout());
defparam \rsin_q~0 .lut_mask = 16'hAACC;
defparam \rsin_q~0 .sum_lutc_input = "datac";

dffeas \rsin_shunt[2] (
	.clk(clk),
	.d(rsin[2]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[2]~q ),
	.prn(vcc));
defparam \rsin_shunt[2] .is_wysiwyg = "true";
defparam \rsin_shunt[2] .power_up = "low";

cycloneive_lcell_comb \rsin_q~1 (
	.dataa(rsin[2]),
	.datab(\rsin_shunt[2]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~1_combout ),
	.cout());
defparam \rsin_q~1 .lut_mask = 16'hAACC;
defparam \rsin_q~1 .sum_lutc_input = "datac";

dffeas \rsin_shunt[3] (
	.clk(clk),
	.d(rsin[3]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[3]~q ),
	.prn(vcc));
defparam \rsin_shunt[3] .is_wysiwyg = "true";
defparam \rsin_shunt[3] .power_up = "low";

cycloneive_lcell_comb \rsin_q~2 (
	.dataa(rsin[3]),
	.datab(\rsin_shunt[3]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~2_combout ),
	.cout());
defparam \rsin_q~2 .lut_mask = 16'hAACC;
defparam \rsin_q~2 .sum_lutc_input = "datac";

dffeas \rsin_shunt[4] (
	.clk(clk),
	.d(rsin[4]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[4]~q ),
	.prn(vcc));
defparam \rsin_shunt[4] .is_wysiwyg = "true";
defparam \rsin_shunt[4] .power_up = "low";

cycloneive_lcell_comb \rsin_q~3 (
	.dataa(rsin[4]),
	.datab(\rsin_shunt[4]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~3_combout ),
	.cout());
defparam \rsin_q~3 .lut_mask = 16'hAACC;
defparam \rsin_q~3 .sum_lutc_input = "datac";

dffeas \rsin_shunt[5] (
	.clk(clk),
	.d(rsin[5]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[5]~q ),
	.prn(vcc));
defparam \rsin_shunt[5] .is_wysiwyg = "true";
defparam \rsin_shunt[5] .power_up = "low";

cycloneive_lcell_comb \rsin_q~4 (
	.dataa(rsin[5]),
	.datab(\rsin_shunt[5]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~4_combout ),
	.cout());
defparam \rsin_q~4 .lut_mask = 16'hAACC;
defparam \rsin_q~4 .sum_lutc_input = "datac";

dffeas \rsin_shunt[6] (
	.clk(clk),
	.d(rsin[6]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[6]~q ),
	.prn(vcc));
defparam \rsin_shunt[6] .is_wysiwyg = "true";
defparam \rsin_shunt[6] .power_up = "low";

cycloneive_lcell_comb \rsin_q~5 (
	.dataa(rsin[6]),
	.datab(\rsin_shunt[6]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~5_combout ),
	.cout());
defparam \rsin_q~5 .lut_mask = 16'hAACC;
defparam \rsin_q~5 .sum_lutc_input = "datac";

dffeas \rsin_shunt[7] (
	.clk(clk),
	.d(rsin[7]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[7]~q ),
	.prn(vcc));
defparam \rsin_shunt[7] .is_wysiwyg = "true";
defparam \rsin_shunt[7] .power_up = "low";

cycloneive_lcell_comb \rsin_q~6 (
	.dataa(rsin[7]),
	.datab(\rsin_shunt[7]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~6_combout ),
	.cout());
defparam \rsin_q~6 .lut_mask = 16'hAACC;
defparam \rsin_q~6 .sum_lutc_input = "datac";

dffeas \rsin_shunt[8] (
	.clk(clk),
	.d(rsin[8]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\rsin_shunt[8]~q ),
	.prn(vcc));
defparam \rsin_shunt[8] .is_wysiwyg = "true";
defparam \rsin_shunt[8] .power_up = "low";

cycloneive_lcell_comb \rsin_q~7 (
	.dataa(rsin[8]),
	.datab(\rsin_shunt[8]~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_q~7_combout ),
	.cout());
defparam \rsin_q~7 .lut_mask = 16'hAACC;
defparam \rsin_q~7 .sum_lutc_input = "datac";

dffeas sink_sop_q(
	.clk(clk),
	.d(\sink_sop_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\mem_ctrl|Selector6~1_combout ),
	.q(\sink_sop_q~q ),
	.prn(vcc));
defparam sink_sop_q.is_wysiwyg = "true";
defparam sink_sop_q.power_up = "low";

dffeas sink_sop_shunt(
	.clk(clk),
	.d(sink_sop),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_val),
	.q(\sink_sop_shunt~q ),
	.prn(vcc));
defparam sink_sop_shunt.is_wysiwyg = "true";
defparam sink_sop_shunt.power_up = "low";

cycloneive_lcell_comb \sink_sop_q~0 (
	.dataa(sink_sop),
	.datab(\sink_sop_shunt~q ),
	.datac(gnd),
	.datad(sink_val),
	.cin(gnd),
	.combout(\sink_sop_q~0_combout ),
	.cout());
defparam \sink_sop_q~0 .lut_mask = 16'hAACC;
defparam \sink_sop_q~0 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_bms_atl (
	bdprev_q_2_3,
	bdprev_q_2_2,
	bdprev_q_2_4,
	bdprev_q_1_1,
	bdprev_q_1_3,
	bdprev_q_1_2,
	bdprev_q_1_4,
	bdprev_q_3_3,
	bdprev_q_3_2,
	bdprev_q_3_4,
	bdprev_q_4_3,
	bdprev_q_4_2,
	bdprev_q_4_4,
	bdprev_q_5_3,
	bdprev_q_5_2,
	bdprev_q_5_4,
	bdprev_q_6_3,
	bdprev_q_6_2,
	bdprev_q_6_4,
	bdprev_q_7_3,
	bdprev_q_7_2,
	bdprev_q_7_4,
	bdprev_q_8_3,
	bdprev_q_8_2,
	bdprev_q_8_4,
	sink_eop_q,
	stateS98,
	chn_statusbooked,
	bms_statusidle,
	load_syn_gen,
	chn_statusload,
	Selector20,
	rsin_q_2,
	rsin_q_3,
	rsin_q_4,
	rsin_q_5,
	rsin_q_6,
	rsin_q_7,
	rsin_q_8,
	bms_clear,
	load_syn_gen1,
	Selector201,
	bms_clear1,
	bms_clear2,
	bdprev_q_2_1,
	bdprev_q_3_1,
	bdprev_q_4_1,
	bdprev_q_5_1,
	bdprev_q_6_1,
	bdprev_q_7_1,
	bdprev_q_8_1,
	llnum_q_2,
	llnum_q_1,
	llnum_q_4,
	llnum_q_3,
	bd_q_2_1,
	bd_q_2_3,
	bd_q_2_2,
	bd_q_2_4,
	bd_q_1_1,
	bd_q_1_3,
	bd_q_1_2,
	bd_q_1_4,
	bd_q_3_1,
	bd_q_3_3,
	bd_q_3_2,
	bd_q_3_4,
	bd_q_4_1,
	bd_q_4_3,
	bd_q_4_2,
	bd_q_4_4,
	bd_q_5_1,
	bd_q_5_3,
	bd_q_5_2,
	bd_q_5_4,
	bd_q_6_1,
	bd_q_6_3,
	bd_q_6_2,
	bd_q_6_4,
	bd_q_7_1,
	bd_q_7_3,
	bd_q_7_2,
	bd_q_7_4,
	bd_q_8_1,
	bd_q_8_3,
	bd_q_8_2,
	bd_q_8_4,
	syn_8_1,
	syn_7_1,
	syn_6_1,
	syn_5_1,
	syn_4_1,
	syn_3_1,
	syn_2_1,
	syn_1_1,
	synin,
	syn_8_8,
	synin1,
	syn_5_8,
	syn_4_8,
	syn_3_8,
	syn_1_8,
	synin2,
	syn_7_3,
	syn_7_6,
	syn_8_3,
	synin3,
	syn_6_3,
	syn_6_6,
	syn_5_3,
	synin4,
	syn_4_3,
	syn_4_6,
	syn_3_3,
	synin5,
	syn_1_3,
	syn_1_6,
	syn_2_3,
	syn_2_6,
	syn_7_2,
	syn_7_7,
	syn_8_2,
	syn_8_7,
	syn_6_2,
	syn_6_7,
	syn_5_2,
	syn_5_7,
	syn_4_2,
	syn_4_7,
	syn_3_2,
	syn_3_7,
	syn_1_2,
	syn_1_7,
	syn_2_2,
	syn_2_7,
	syn_7_4,
	synin6,
	syn_8_4,
	syn_8_5,
	syn_6_4,
	syn_6_5,
	syn_5_4,
	syn_5_5,
	syn_4_4,
	synin7,
	syn_3_4,
	syn_3_5,
	syn_1_4,
	syn_1_5,
	syn_2_4,
	syn_2_5,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
output 	bdprev_q_2_3;
output 	bdprev_q_2_2;
output 	bdprev_q_2_4;
output 	bdprev_q_1_1;
output 	bdprev_q_1_3;
output 	bdprev_q_1_2;
output 	bdprev_q_1_4;
output 	bdprev_q_3_3;
output 	bdprev_q_3_2;
output 	bdprev_q_3_4;
output 	bdprev_q_4_3;
output 	bdprev_q_4_2;
output 	bdprev_q_4_4;
output 	bdprev_q_5_3;
output 	bdprev_q_5_2;
output 	bdprev_q_5_4;
output 	bdprev_q_6_3;
output 	bdprev_q_6_2;
output 	bdprev_q_6_4;
output 	bdprev_q_7_3;
output 	bdprev_q_7_2;
output 	bdprev_q_7_4;
output 	bdprev_q_8_3;
output 	bdprev_q_8_2;
output 	bdprev_q_8_4;
input 	sink_eop_q;
output 	stateS98;
input 	chn_statusbooked;
input 	bms_statusidle;
input 	load_syn_gen;
input 	chn_statusload;
input 	Selector20;
input 	rsin_q_2;
input 	rsin_q_3;
input 	rsin_q_4;
input 	rsin_q_5;
input 	rsin_q_6;
input 	rsin_q_7;
input 	rsin_q_8;
input 	bms_clear;
input 	load_syn_gen1;
input 	Selector201;
input 	bms_clear1;
input 	bms_clear2;
output 	bdprev_q_2_1;
output 	bdprev_q_3_1;
output 	bdprev_q_4_1;
output 	bdprev_q_5_1;
output 	bdprev_q_6_1;
output 	bdprev_q_7_1;
output 	bdprev_q_8_1;
output 	llnum_q_2;
output 	llnum_q_1;
output 	llnum_q_4;
output 	llnum_q_3;
output 	bd_q_2_1;
output 	bd_q_2_3;
output 	bd_q_2_2;
output 	bd_q_2_4;
output 	bd_q_1_1;
output 	bd_q_1_3;
output 	bd_q_1_2;
output 	bd_q_1_4;
output 	bd_q_3_1;
output 	bd_q_3_3;
output 	bd_q_3_2;
output 	bd_q_3_4;
output 	bd_q_4_1;
output 	bd_q_4_3;
output 	bd_q_4_2;
output 	bd_q_4_4;
output 	bd_q_5_1;
output 	bd_q_5_3;
output 	bd_q_5_2;
output 	bd_q_5_4;
output 	bd_q_6_1;
output 	bd_q_6_3;
output 	bd_q_6_2;
output 	bd_q_6_4;
output 	bd_q_7_1;
output 	bd_q_7_3;
output 	bd_q_7_2;
output 	bd_q_7_4;
output 	bd_q_8_1;
output 	bd_q_8_3;
output 	bd_q_8_2;
output 	bd_q_8_4;
input 	syn_8_1;
input 	syn_7_1;
input 	syn_6_1;
input 	syn_5_1;
input 	syn_4_1;
input 	syn_3_1;
input 	syn_2_1;
input 	syn_1_1;
input 	synin;
input 	syn_8_8;
input 	synin1;
input 	syn_5_8;
input 	syn_4_8;
input 	syn_3_8;
input 	syn_1_8;
input 	synin2;
input 	syn_7_3;
input 	syn_7_6;
input 	syn_8_3;
input 	synin3;
input 	syn_6_3;
input 	syn_6_6;
input 	syn_5_3;
input 	synin4;
input 	syn_4_3;
input 	syn_4_6;
input 	syn_3_3;
input 	synin5;
input 	syn_1_3;
input 	syn_1_6;
input 	syn_2_3;
input 	syn_2_6;
input 	syn_7_2;
input 	syn_7_7;
input 	syn_8_2;
input 	syn_8_7;
input 	syn_6_2;
input 	syn_6_7;
input 	syn_5_2;
input 	syn_5_7;
input 	syn_4_2;
input 	syn_4_7;
input 	syn_3_2;
input 	syn_3_7;
input 	syn_1_2;
input 	syn_1_7;
input 	syn_2_2;
input 	syn_2_7;
input 	syn_7_4;
input 	synin6;
input 	syn_8_4;
input 	syn_8_5;
input 	syn_6_4;
input 	syn_6_5;
input 	syn_5_4;
input 	syn_5_5;
input 	syn_4_4;
input 	synin7;
input 	syn_3_4;
input 	syn_3_5;
input 	syn_1_4;
input 	syn_1_5;
input 	syn_2_4;
input 	syn_2_5;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \mulleft_q[1][7]~q ;
wire \mulleft_q[1][8]~q ;
wire \mulleft_q[1][6]~q ;
wire \mulleft_q[1][5]~q ;
wire \mulleft_q[1][4]~q ;
wire \mulleft_q[1][3]~q ;
wire \mulleft_q[1][1]~q ;
wire \mulleft_q[1][2]~q ;
wire \mulleft_q[3][7]~q ;
wire \mulleft_q[3][8]~q ;
wire \mulleft_q[3][6]~q ;
wire \mulleft_q[3][5]~q ;
wire \mulleft_q[3][4]~q ;
wire \mulleft_q[3][3]~q ;
wire \mulleft_q[3][1]~q ;
wire \mulleft_q[3][2]~q ;
wire \mulleft_q[2][7]~q ;
wire \mulleft_q[2][8]~q ;
wire \mulleft_q[2][6]~q ;
wire \mulleft_q[2][5]~q ;
wire \mulleft_q[2][4]~q ;
wire \mulleft_q[2][3]~q ;
wire \mulleft_q[2][1]~q ;
wire \mulright_q[2][1]~q ;
wire \mulleft_q[2][2]~q ;
wire \mulleft_q[4][7]~q ;
wire \mulleft_q[4][8]~q ;
wire \mulleft_q[4][6]~q ;
wire \mulleft_q[4][5]~q ;
wire \mulleft_q[4][4]~q ;
wire \mulleft_q[4][3]~q ;
wire \mulleft_q[4][1]~q ;
wire \mulleft_q[4][2]~q ;
wire \mulleft_q[1][7]~10_combout ;
wire \mulleft_q[1][8]~9_combout ;
wire \mulleft_q[1][6]~11_combout ;
wire \mulleft_q[1][5]~12_combout ;
wire \mulleft_q[1][4]~13_combout ;
wire \mulleft_q[1][3]~14_combout ;
wire \mulright_q[2][1]~0_combout ;
wire \mulleft_q[1][1]~8_combout ;
wire \mulleft_q[1][2]~15_combout ;
wire \mulleft_q[3][7]~18_combout ;
wire \mulleft_q[3][8]~17_combout ;
wire \mulleft_q[3][6]~19_combout ;
wire \mulleft_q[3][5]~20_combout ;
wire \mulleft_q[3][4]~21_combout ;
wire \mulleft_q[3][3]~22_combout ;
wire \mulleft_q[3][1]~16_combout ;
wire \mulleft_q[3][2]~23_combout ;
wire \mulleft_q[2][7]~2_combout ;
wire \mulleft_q[2][8]~1_combout ;
wire \mulleft_q[2][6]~3_combout ;
wire \mulleft_q[2][5]~4_combout ;
wire \mulleft_q[2][4]~5_combout ;
wire \mulleft_q[2][3]~6_combout ;
wire \mulleft_q[2][1]~0_combout ;
wire \mulleft_q[2][2]~7_combout ;
wire \mulleft_q[4][7]~26_combout ;
wire \mulleft_q[4][8]~25_combout ;
wire \mulleft_q[4][6]~27_combout ;
wire \mulleft_q[4][5]~28_combout ;
wire \mulleft_q[4][4]~29_combout ;
wire \mulleft_q[4][3]~30_combout ;
wire \mulleft_q[4][1]~24_combout ;
wire \mulleft_q[4][2]~31_combout ;
wire \mulright_q[1][7]~q ;
wire \mulright_q[1][8]~q ;
wire \mulright_q[1][4]~q ;
wire \mulright_q[1][3]~q ;
wire \mulright_q[1][6]~q ;
wire \mulright_q[1][5]~q ;
wire \mulright_q[1][1]~q ;
wire \mulright_q[1][2]~q ;
wire \g13:1:gf_mul1|c[2]~combout ;
wire \mulright_q[3][7]~q ;
wire \mulright_q[3][8]~q ;
wire \mulright_q[3][4]~q ;
wire \mulright_q[3][3]~q ;
wire \mulright_q[3][6]~q ;
wire \mulright_q[3][5]~q ;
wire \mulright_q[3][1]~q ;
wire \mulright_q[3][2]~q ;
wire \g13:3:gf_mul1|c[2]~combout ;
wire \mulright_q[2][7]~q ;
wire \mulright_q[2][8]~q ;
wire \mulright_q[2][4]~q ;
wire \mulright_q[2][3]~q ;
wire \mulright_q[2][6]~q ;
wire \mulright_q[2][5]~q ;
wire \mulright_q[2][2]~q ;
wire \g13:2:gf_mul1|c[2]~combout ;
wire \mulright_q[4][7]~q ;
wire \mulright_q[4][8]~q ;
wire \mulright_q[4][4]~q ;
wire \mulright_q[4][3]~q ;
wire \mulright_q[4][6]~q ;
wire \mulright_q[4][5]~q ;
wire \mulright_q[4][1]~q ;
wire \mulright_q[4][2]~q ;
wire \g13:4:gf_mul1|c[2]~combout ;
wire \g13:1:gf_mul1|c[1]~combout ;
wire \g13:3:gf_mul1|c[1]~combout ;
wire \g13:2:gf_mul1|c[1]~combout ;
wire \g13:4:gf_mul1|c[1]~combout ;
wire \g13:1:gf_mul1|c[3]~combout ;
wire \g13:3:gf_mul1|c[3]~combout ;
wire \g13:2:gf_mul1|c[3]~combout ;
wire \g13:4:gf_mul1|c[3]~combout ;
wire \g13:1:gf_mul1|c[4]~combout ;
wire \g13:3:gf_mul1|c[4]~combout ;
wire \g13:2:gf_mul1|c[4]~combout ;
wire \g13:4:gf_mul1|c[4]~combout ;
wire \g13:1:gf_mul1|c[5]~11_combout ;
wire \g13:3:gf_mul1|c[5]~11_combout ;
wire \g13:2:gf_mul1|c[5]~10_combout ;
wire \g13:4:gf_mul1|c[5]~combout ;
wire \g13:1:gf_mul1|c[6]~16_combout ;
wire \g13:3:gf_mul1|c[6]~16_combout ;
wire \g13:2:gf_mul1|c[6]~16_combout ;
wire \g13:4:gf_mul1|c[6]~13_combout ;
wire \g13:1:gf_mul1|c[7]~22_combout ;
wire \g13:3:gf_mul1|c[7]~22_combout ;
wire \g13:2:gf_mul1|c[7]~22_combout ;
wire \g13:4:gf_mul1|c[7]~19_combout ;
wire \g13:1:gf_mul1|c[8]~28_combout ;
wire \g13:3:gf_mul1|c[8]~28_combout ;
wire \g13:2:gf_mul1|c[8]~28_combout ;
wire \g13:4:gf_mul1|c[8]~25_combout ;
wire \deltamult_q[7]~q ;
wire \WideOr7~combout ;
wire \mulright_d~62_combout ;
wire \mulright_d~63_combout ;
wire \deltamult_q[8]~q ;
wire \mulright_d~64_combout ;
wire \mulright_d~65_combout ;
wire \deltamult_q[4]~q ;
wire \mulright_d~66_combout ;
wire \mulright_d~67_combout ;
wire \deltamult_q[3]~q ;
wire \mulright_d~68_combout ;
wire \deltamult_q[6]~q ;
wire \mulright_d~69_combout ;
wire \deltamult_q[5]~q ;
wire \mulright_d~70_combout ;
wire \deltamult_q[1]~q ;
wire \omegaright[1][1]~combout ;
wire \deltamult_q[2]~q ;
wire \mulright_d~71_combout ;
wire \gf_div1|gf_mul|c[7]~5_combout ;
wire \gf_div1|gf_mul|c[8]~11_combout ;
wire \gf_div1|gf_mul|c[4]~combout ;
wire \gf_div1|gf_mul|c[3]~combout ;
wire \gf_div1|gf_mul|c[6]~21_combout ;
wire \gf_div1|gf_mul|c[5]~25_combout ;
wire \gf_div1|gf_mul|c[1]~combout ;
wire \gf_div1|gf_mul|c[2]~combout ;
wire \deltaprev_ena~combout ;
wire \deltaprev_d[1]~combout ;
wire \deltaprev_d[2]~combout ;
wire \deltaprev_d[3]~combout ;
wire \deltaprev_d[4]~combout ;
wire \deltaprev_d[5]~combout ;
wire \deltaprev_d[6]~combout ;
wire \deltaprev_d[7]~combout ;
wire \deltaprev_d[8]~combout ;
wire \mulright_d[1][7]~combout ;
wire \mulright_d[1][8]~combout ;
wire \mulright_d[1][4]~combout ;
wire \mulright_d[1][3]~combout ;
wire \mulright_d[1][6]~combout ;
wire \mulright_d[1][5]~combout ;
wire \mulright_d[1][1]~72_combout ;
wire \mulright_d[1][2]~combout ;
wire \mulright_d[3][7]~combout ;
wire \mulright_d[3][8]~combout ;
wire \mulright_d[3][4]~combout ;
wire \mulright_d[3][3]~combout ;
wire \mulright_d[3][6]~combout ;
wire \mulright_d[3][5]~combout ;
wire \mulright_d[3][1]~73_combout ;
wire \mulright_d[3][2]~combout ;
wire \mulright_d[2][7]~combout ;
wire \mulright_d[2][8]~combout ;
wire \mulright_d[2][4]~combout ;
wire \mulright_d[2][3]~combout ;
wire \mulright_d[2][6]~combout ;
wire \mulright_d[2][5]~combout ;
wire \mulright_d[2][2]~combout ;
wire \mulright_d[4][7]~combout ;
wire \mulright_d[4][8]~combout ;
wire \mulright_d[4][4]~combout ;
wire \mulright_d[4][3]~combout ;
wire \mulright_d[4][6]~combout ;
wire \mulright_d[4][5]~combout ;
wire \mulright_d[4][1]~74_combout ;
wire \mulright_d[4][2]~combout ;
wire \Selector6~0_combout ;
wire \state.S99~q ;
wire \bms_clear~2_combout ;
wire \Selector1~0_combout ;
wire \state.S0c~q ;
wire \Selector0~0_combout ;
wire \state.S0~q ;
wire \Selector2~0_combout ;
wire \Selector2~1_combout ;
wire \state.S1~q ;
wire \bms_clear~0_combout ;
wire \bms_clear~1_combout ;
wire \bms_clear~3_combout ;
wire \mloop~1_combout ;
wire \cnt_mloop~0_combout ;
wire \mloop[1]~q ;
wire \bms_clear~4_combout ;
wire \mloop~0_combout ;
wire \mloop[2]~q ;
wire \Add0~0_combout ;
wire \mloop~3_combout ;
wire \mloop[3]~q ;
wire \LessThan0~0_combout ;
wire \bms_clear~5_combout ;
wire \mloop~2_combout ;
wire \mloop[4]~q ;
wire \LessThan0~1_combout ;
wire \next_state.S10~0_combout ;
wire \next_state.S2a~0_combout ;
wire \state.S2a~q ;
wire \state.S3~q ;
wire \mulout_q[4][8]~q ;
wire \synreg_d[8][8]~9_combout ;
wire \synreg_2~0_combout ;
wire \synreg_q[8][8]~q ;
wire \synreg_d[7][8]~43_combout ;
wire \synreg_q[7][8]~q ;
wire \synreg_d[6][8]~21_combout ;
wire \synreg_q[6][8]~q ;
wire \synreg_d[5][8]~67_combout ;
wire \synreg_q[5][8]~q ;
wire \state.S11~q ;
wire \omegaloop~0_combout ;
wire \cnt_omegaloop~0_combout ;
wire \omegaloop[1]~q ;
wire \omegaloop~1_combout ;
wire \omegaloop[2]~q ;
wire \omegaloop~3_combout ;
wire \omegaloop[3]~q ;
wire \Add3~0_combout ;
wire \omegaloop~2_combout ;
wire \omegaloop[4]~q ;
wire \Selector5~0_combout ;
wire \Selector4~0_combout ;
wire \state.S12~q ;
wire \WideOr7~0_combout ;
wire \synreg_d[4][8]~65_combout ;
wire \synreg_d[4][8]~66_combout ;
wire \synreg_2~1_combout ;
wire \synreg_q[4][8]~q ;
wire \synreg_d[3][8]~19_combout ;
wire \synreg_d[3][8]~20_combout ;
wire \synreg_q[3][8]~q ;
wire \synreg_d[2][8]~41_combout ;
wire \synreg_d[2][8]~42_combout ;
wire \synreg_q[2][8]~q ;
wire \synreg_d[1][8]~0_combout ;
wire \synreg_q[1][8]~q ;
wire \mulout_q[1][8]~q ;
wire \mulout_q[2][8]~q ;
wire \mulout_q[3][8]~q ;
wire \mulsum[4][8]~0_combout ;
wire \mulsum[4][8]~combout ;
wire \delta_q[8]~q ;
wire \mulout_q[4][7]~q ;
wire \synreg_d[8][7]~8_combout ;
wire \synreg_q[8][7]~q ;
wire \synreg_d[7][7]~40_combout ;
wire \synreg_q[7][7]~q ;
wire \synreg_d[6][7]~18_combout ;
wire \synreg_q[6][7]~q ;
wire \synreg_d[5][7]~64_combout ;
wire \synreg_q[5][7]~q ;
wire \synreg_d[4][7]~62_combout ;
wire \synreg_d[4][7]~63_combout ;
wire \synreg_q[4][7]~q ;
wire \synreg_d[3][7]~16_combout ;
wire \synreg_d[3][7]~17_combout ;
wire \synreg_q[3][7]~q ;
wire \synreg_d[2][7]~38_combout ;
wire \synreg_d[2][7]~39_combout ;
wire \synreg_q[2][7]~q ;
wire \synreg_d[1][7]~1_combout ;
wire \synreg_q[1][7]~q ;
wire \mulout_q[1][7]~q ;
wire \mulout_q[2][7]~q ;
wire \mulout_q[3][7]~q ;
wire \mulsum[4][7]~1_combout ;
wire \mulsum[4][7]~combout ;
wire \delta_q[7]~q ;
wire \mulout_q[4][6]~q ;
wire \synreg_d[4][6]~68_combout ;
wire \synreg_d[8][6]~10_combout ;
wire \synreg_q[8][6]~q ;
wire \synreg_d[7][6]~46_combout ;
wire \synreg_q[7][6]~q ;
wire \synreg_d[6][6]~24_combout ;
wire \synreg_q[6][6]~q ;
wire \synreg_d[5][6]~69_combout ;
wire \synreg_q[5][6]~q ;
wire \synreg_d[4][6]~combout ;
wire \synreg_q[4][6]~q ;
wire \synreg_d[3][6]~22_combout ;
wire \synreg_d[3][6]~23_combout ;
wire \synreg_q[3][6]~q ;
wire \synreg_d[2][6]~44_combout ;
wire \synreg_d[2][6]~45_combout ;
wire \synreg_q[2][6]~q ;
wire \synreg_d[1][6]~2_combout ;
wire \synreg_q[1][6]~q ;
wire \mulout_q[1][6]~q ;
wire \mulout_q[2][6]~q ;
wire \mulout_q[3][6]~q ;
wire \mulsum[4][6]~2_combout ;
wire \mulsum[4][6]~combout ;
wire \delta_q[6]~q ;
wire \mulout_q[4][5]~q ;
wire \synreg_d[3][5]~25_combout ;
wire \synreg_d[8][5]~11_combout ;
wire \synreg_q[8][5]~q ;
wire \synreg_d[7][5]~49_combout ;
wire \synreg_q[7][5]~q ;
wire \synreg_d[6][5]~26_combout ;
wire \synreg_q[6][5]~q ;
wire \synreg_d[5][5]~71_combout ;
wire \synreg_q[5][5]~q ;
wire \synreg_d[4][5]~70_combout ;
wire \synreg_d[4][5]~combout ;
wire \synreg_q[4][5]~q ;
wire \synreg_d[3][5]~combout ;
wire \synreg_q[3][5]~q ;
wire \synreg_d[2][5]~47_combout ;
wire \synreg_d[2][5]~48_combout ;
wire \synreg_q[2][5]~q ;
wire \synreg_d[1][5]~3_combout ;
wire \synreg_q[1][5]~q ;
wire \mulout_q[1][5]~q ;
wire \mulout_q[2][5]~q ;
wire \mulout_q[3][5]~q ;
wire \mulsum[4][5]~3_combout ;
wire \mulsum[4][5]~combout ;
wire \delta_q[5]~q ;
wire \deltazero[8]~0_combout ;
wire \mulout_q[4][4]~q ;
wire \synreg_d[3][4]~27_combout ;
wire \synreg_d[4][4]~72_combout ;
wire \synreg_d[8][4]~12_combout ;
wire \synreg_q[8][4]~q ;
wire \synreg_d[7][4]~52_combout ;
wire \synreg_q[7][4]~q ;
wire \synreg_d[6][4]~28_combout ;
wire \synreg_q[6][4]~q ;
wire \synreg_d[5][4]~73_combout ;
wire \synreg_q[5][4]~q ;
wire \synreg_d[4][4]~combout ;
wire \synreg_q[4][4]~q ;
wire \synreg_d[3][4]~combout ;
wire \synreg_q[3][4]~q ;
wire \synreg_d[2][4]~50_combout ;
wire \synreg_d[2][4]~51_combout ;
wire \synreg_q[2][4]~q ;
wire \synreg_d[1][4]~4_combout ;
wire \synreg_q[1][4]~q ;
wire \mulout_q[1][4]~q ;
wire \mulout_q[2][4]~q ;
wire \mulout_q[3][4]~q ;
wire \mulsum[4][4]~4_combout ;
wire \mulsum[4][4]~combout ;
wire \delta_q[4]~q ;
wire \mulout_q[4][3]~q ;
wire \synreg_d[8][3]~13_combout ;
wire \synreg_q[8][3]~q ;
wire \synreg_d[7][3]~55_combout ;
wire \synreg_q[7][3]~q ;
wire \synreg_d[6][3]~31_combout ;
wire \synreg_q[6][3]~q ;
wire \synreg_d[5][3]~76_combout ;
wire \synreg_q[5][3]~q ;
wire \synreg_d[4][3]~74_combout ;
wire \synreg_d[4][3]~75_combout ;
wire \synreg_q[4][3]~q ;
wire \synreg_d[3][3]~29_combout ;
wire \synreg_d[3][3]~30_combout ;
wire \synreg_q[3][3]~q ;
wire \synreg_d[2][3]~53_combout ;
wire \synreg_d[2][3]~54_combout ;
wire \synreg_q[2][3]~q ;
wire \synreg_d[1][3]~5_combout ;
wire \synreg_q[1][3]~q ;
wire \mulout_q[1][3]~q ;
wire \mulout_q[2][3]~q ;
wire \mulout_q[3][3]~q ;
wire \mulsum[4][3]~5_combout ;
wire \mulsum[4][3]~combout ;
wire \delta_q[3]~q ;
wire \mulout_q[4][2]~q ;
wire \synreg_d[8][2]~15_combout ;
wire \synreg_q[8][2]~q ;
wire \synreg_d[7][2]~61_combout ;
wire \synreg_q[7][2]~q ;
wire \synreg_d[6][2]~37_combout ;
wire \synreg_q[6][2]~q ;
wire \synreg_d[5][2]~82_combout ;
wire \synreg_q[5][2]~q ;
wire \synreg_d[4][2]~80_combout ;
wire \synreg_d[4][2]~81_combout ;
wire \synreg_q[4][2]~q ;
wire \synreg_d[3][2]~35_combout ;
wire \synreg_d[3][2]~36_combout ;
wire \synreg_q[3][2]~q ;
wire \synreg_d[2][2]~59_combout ;
wire \synreg_d[2][2]~60_combout ;
wire \synreg_q[2][2]~q ;
wire \synreg_d[1][2]~6_combout ;
wire \synreg_q[1][2]~q ;
wire \mulout_q[1][2]~q ;
wire \mulout_q[2][2]~q ;
wire \mulout_q[3][2]~q ;
wire \mulsum[4][2]~6_combout ;
wire \mulsum[4][2]~combout ;
wire \delta_q[2]~q ;
wire \mulout_q[4][1]~q ;
wire \synreg_d[8][1]~14_combout ;
wire \synreg_q[8][1]~q ;
wire \synreg_d[7][1]~58_combout ;
wire \synreg_q[7][1]~q ;
wire \synreg_d[6][1]~34_combout ;
wire \synreg_q[6][1]~q ;
wire \synreg_d[5][1]~79_combout ;
wire \synreg_q[5][1]~q ;
wire \synreg_d[4][1]~77_combout ;
wire \synreg_d[4][1]~78_combout ;
wire \synreg_q[4][1]~q ;
wire \synreg_d[3][1]~32_combout ;
wire \synreg_d[3][1]~33_combout ;
wire \synreg_q[3][1]~q ;
wire \synreg_d[2][1]~56_combout ;
wire \synreg_d[2][1]~57_combout ;
wire \synreg_q[2][1]~q ;
wire \synreg_d[1][1]~7_combout ;
wire \synreg_q[1][1]~q ;
wire \mulout_q[1][1]~q ;
wire \mulout_q[2][1]~q ;
wire \mulout_q[3][1]~q ;
wire \mulsum[4][1]~7_combout ;
wire \mulsum[4][1]~combout ;
wire \delta_q[1]~q ;
wire \deltazero[8]~1_combout ;
wire \next_state.S4~0_combout ;
wire \state.S4~q ;
wire \state.S5~q ;
wire \next_state.S6~0_combout ;
wire \state.S6~q ;
wire \Selector3~0_combout ;
wire \Selector3~1_combout ;
wire \state.S8~q ;
wire \next_state.S2~combout ;
wire \state.S2~q ;
wire \next_state.S10~1_combout ;
wire \state.S10~q ;
wire \WideOr8~0_combout ;
wire \bdtemp_q[3][2]~q ;
wire \bdprev_q[3][2]~6_combout ;
wire \bdprev~0_combout ;
wire \bdprev~1_combout ;
wire \bdtemp_q[2][2]~q ;
wire \bdprev_q[2][2]~4_combout ;
wire \bdtemp_q[4][2]~q ;
wire \bdprev_q[4][2]~5_combout ;
wire \bdtemp_q[1][1]~q ;
wire \onereg_q~0_combout ;
wire \onereg_q~1_combout ;
wire \onereg_q~q ;
wire \bdprev_q[1][1]~1_combout ;
wire \bdtemp_q[3][1]~q ;
wire \bdprev_q[3][1]~2_combout ;
wire \bdtemp_q[2][1]~q ;
wire \bdprev_q[2][1]~0_combout ;
wire \bdtemp_q[4][1]~q ;
wire \bdprev_q[4][1]~3_combout ;
wire \bdtemp_q[3][3]~q ;
wire \bdprev_q[3][3]~9_combout ;
wire \bdtemp_q[2][3]~q ;
wire \bdprev_q[2][3]~7_combout ;
wire \bdtemp_q[4][3]~q ;
wire \bdprev_q[4][3]~8_combout ;
wire \bdtemp_q[3][4]~q ;
wire \bdprev_q[3][4]~12_combout ;
wire \bdtemp_q[2][4]~q ;
wire \bdprev_q[2][4]~10_combout ;
wire \bdtemp_q[4][4]~q ;
wire \bdprev_q[4][4]~11_combout ;
wire \bdtemp_q[3][5]~q ;
wire \bdprev_q[3][5]~15_combout ;
wire \bdtemp_q[2][5]~q ;
wire \bdprev_q[2][5]~13_combout ;
wire \bdtemp_q[4][5]~q ;
wire \bdprev_q[4][5]~14_combout ;
wire \bdtemp_q[3][6]~q ;
wire \bdprev_q[3][6]~18_combout ;
wire \bdtemp_q[2][6]~q ;
wire \bdprev_q[2][6]~16_combout ;
wire \bdtemp_q[4][6]~q ;
wire \bdprev_q[4][6]~17_combout ;
wire \bdtemp_q[3][7]~q ;
wire \bdprev_q[3][7]~21_combout ;
wire \bdtemp_q[2][7]~q ;
wire \bdprev_q[2][7]~19_combout ;
wire \bdtemp_q[4][7]~q ;
wire \bdprev_q[4][7]~20_combout ;
wire \bdtemp_q[3][8]~q ;
wire \bdprev_q[3][8]~24_combout ;
wire \bdtemp_q[2][8]~q ;
wire \bdprev_q[2][8]~22_combout ;
wire \bdtemp_q[4][8]~q ;
wire \bdprev_q[4][8]~23_combout ;
wire \Selector5~1_combout ;
wire \bdprev_d[1][2]~0_combout ;
wire \bdtemp_q[1][2]~q ;
wire \bdprev_d[1][2]~1_combout ;
wire \bdtemp_q[1][3]~q ;
wire \bdprev_d[1][3]~2_combout ;
wire \bdtemp_q[1][4]~q ;
wire \bdprev_d[1][4]~3_combout ;
wire \bdtemp_q[1][5]~q ;
wire \bdprev_d[1][5]~4_combout ;
wire \bdtemp_q[1][6]~q ;
wire \bdprev_d[1][6]~5_combout ;
wire \bdtemp_q[1][7]~q ;
wire \bdprev_d[1][7]~6_combout ;
wire \bdtemp_q[1][8]~q ;
wire \bdprev_d[1][8]~7_combout ;
wire \Add1~1 ;
wire \Add1~2_combout ;
wire \llnum_d[2]~combout ;
wire \llnum~0_combout ;
wire \Add1~0_combout ;
wire \llnum_d[1]~combout ;
wire \Add1~3 ;
wire \Add1~5 ;
wire \Add1~6_combout ;
wire \Add1~4_combout ;
wire \llnum_d[4]~combout ;
wire \llnum_d[3]~combout ;
wire \bd_d[1][2]~combout ;
wire \omsel[1]~q ;
wire \bd~0_combout ;
wire \bd~1_combout ;
wire \bd_d[3][2]~combout ;
wire \omsel~1_combout ;
wire \omsel[2]~q ;
wire \omsel~0_combout ;
wire \omsel[3]~q ;
wire \bd~2_combout ;
wire \bd~3_combout ;
wire \bd_d[2][2]~combout ;
wire \bd~4_combout ;
wire \bd~5_combout ;
wire \bd_d[4][2]~combout ;
wire \omsel~2_combout ;
wire \omsel[4]~q ;
wire \bd~6_combout ;
wire \bd~7_combout ;
wire \bd_d[1][1]~combout ;
wire \bd_d[3][1]~combout ;
wire \bd_d[2][1]~combout ;
wire \bd_d[4][1]~combout ;
wire \bd_d[1][3]~combout ;
wire \bd_d[3][3]~combout ;
wire \bd_d[2][3]~combout ;
wire \bd_d[4][3]~combout ;
wire \bd_d[1][4]~combout ;
wire \bd_d[3][4]~combout ;
wire \bd_d[2][4]~combout ;
wire \bd_d[4][4]~combout ;
wire \bd_d[1][5]~combout ;
wire \bd_d[3][5]~combout ;
wire \bd_d[2][5]~combout ;
wire \bd_d[4][5]~combout ;
wire \bd_d[1][6]~combout ;
wire \bd_d[3][6]~combout ;
wire \bd_d[2][6]~combout ;
wire \bd_d[4][6]~combout ;
wire \bd_d[1][7]~combout ;
wire \bd_d[3][7]~combout ;
wire \bd_d[2][7]~combout ;
wire \bd_d[4][7]~combout ;
wire \bd_d[1][8]~combout ;
wire \bd_d[3][8]~combout ;
wire \bd_d[2][8]~combout ;
wire \bd_d[4][8]~combout ;


RS_DE_LANE_QUATUS_auk_rs_gfdiv gf_div1(
	.delta_q_8(\delta_q[8]~q ),
	.delta_q_7(\delta_q[7]~q ),
	.delta_q_6(\delta_q[6]~q ),
	.delta_q_5(\delta_q[5]~q ),
	.delta_q_4(\delta_q[4]~q ),
	.delta_q_3(\delta_q[3]~q ),
	.delta_q_2(\delta_q[2]~q ),
	.delta_q_1(\delta_q[1]~q ),
	.c_7(\gf_div1|gf_mul|c[7]~5_combout ),
	.c_8(\gf_div1|gf_mul|c[8]~11_combout ),
	.c_4(\gf_div1|gf_mul|c[4]~combout ),
	.c_3(\gf_div1|gf_mul|c[3]~combout ),
	.c_6(\gf_div1|gf_mul|c[6]~21_combout ),
	.c_5(\gf_div1|gf_mul|c[5]~25_combout ),
	.c_1(\gf_div1|gf_mul|c[1]~combout ),
	.c_2(\gf_div1|gf_mul|c[2]~combout ),
	.ena_one(\deltaprev_ena~combout ),
	.d({\deltaprev_d[8]~combout ,\deltaprev_d[7]~combout ,\deltaprev_d[6]~combout ,\deltaprev_d[5]~combout ,\deltaprev_d[4]~combout ,\deltaprev_d[3]~combout ,\deltaprev_d[2]~combout ,\deltaprev_d[1]~combout }),
	.clk(clk),
	.reset(reset));

RS_DE_LANE_QUATUS_auk_rs_gfmul_4 \g13:4:gf_mul1 (
	.mulleft_q_7_4(\mulleft_q[4][7]~q ),
	.mulleft_q_8_4(\mulleft_q[4][8]~q ),
	.mulleft_q_6_4(\mulleft_q[4][6]~q ),
	.mulleft_q_5_4(\mulleft_q[4][5]~q ),
	.mulleft_q_4_4(\mulleft_q[4][4]~q ),
	.mulleft_q_3_4(\mulleft_q[4][3]~q ),
	.mulleft_q_1_4(\mulleft_q[4][1]~q ),
	.mulleft_q_2_4(\mulleft_q[4][2]~q ),
	.mulright_q_7_4(\mulright_q[4][7]~q ),
	.mulright_q_8_4(\mulright_q[4][8]~q ),
	.mulright_q_4_4(\mulright_q[4][4]~q ),
	.mulright_q_3_4(\mulright_q[4][3]~q ),
	.mulright_q_6_4(\mulright_q[4][6]~q ),
	.mulright_q_5_4(\mulright_q[4][5]~q ),
	.mulright_q_1_4(\mulright_q[4][1]~q ),
	.mulright_q_2_4(\mulright_q[4][2]~q ),
	.c_2(\g13:4:gf_mul1|c[2]~combout ),
	.c_1(\g13:4:gf_mul1|c[1]~combout ),
	.c_3(\g13:4:gf_mul1|c[3]~combout ),
	.c_4(\g13:4:gf_mul1|c[4]~combout ),
	.c_5(\g13:4:gf_mul1|c[5]~combout ),
	.c_6(\g13:4:gf_mul1|c[6]~13_combout ),
	.c_7(\g13:4:gf_mul1|c[7]~19_combout ),
	.c_8(\g13:4:gf_mul1|c[8]~25_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_3 \g13:3:gf_mul1 (
	.mulleft_q_7_3(\mulleft_q[3][7]~q ),
	.mulleft_q_8_3(\mulleft_q[3][8]~q ),
	.mulleft_q_6_3(\mulleft_q[3][6]~q ),
	.mulleft_q_5_3(\mulleft_q[3][5]~q ),
	.mulleft_q_4_3(\mulleft_q[3][4]~q ),
	.mulleft_q_3_3(\mulleft_q[3][3]~q ),
	.mulleft_q_1_3(\mulleft_q[3][1]~q ),
	.mulleft_q_2_3(\mulleft_q[3][2]~q ),
	.mulright_q_7_3(\mulright_q[3][7]~q ),
	.mulright_q_8_3(\mulright_q[3][8]~q ),
	.mulright_q_4_3(\mulright_q[3][4]~q ),
	.mulright_q_3_3(\mulright_q[3][3]~q ),
	.mulright_q_6_3(\mulright_q[3][6]~q ),
	.mulright_q_5_3(\mulright_q[3][5]~q ),
	.mulright_q_1_3(\mulright_q[3][1]~q ),
	.mulright_q_2_3(\mulright_q[3][2]~q ),
	.c_2(\g13:3:gf_mul1|c[2]~combout ),
	.c_1(\g13:3:gf_mul1|c[1]~combout ),
	.c_3(\g13:3:gf_mul1|c[3]~combout ),
	.c_4(\g13:3:gf_mul1|c[4]~combout ),
	.c_5(\g13:3:gf_mul1|c[5]~11_combout ),
	.c_6(\g13:3:gf_mul1|c[6]~16_combout ),
	.c_7(\g13:3:gf_mul1|c[7]~22_combout ),
	.c_8(\g13:3:gf_mul1|c[8]~28_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_2 \g13:2:gf_mul1 (
	.mulleft_q_7_2(\mulleft_q[2][7]~q ),
	.mulleft_q_8_2(\mulleft_q[2][8]~q ),
	.mulleft_q_6_2(\mulleft_q[2][6]~q ),
	.mulleft_q_5_2(\mulleft_q[2][5]~q ),
	.mulleft_q_4_2(\mulleft_q[2][4]~q ),
	.mulleft_q_3_2(\mulleft_q[2][3]~q ),
	.mulleft_q_1_2(\mulleft_q[2][1]~q ),
	.mulright_q_1_2(\mulright_q[2][1]~q ),
	.mulleft_q_2_2(\mulleft_q[2][2]~q ),
	.mulright_q_7_2(\mulright_q[2][7]~q ),
	.mulright_q_8_2(\mulright_q[2][8]~q ),
	.mulright_q_4_2(\mulright_q[2][4]~q ),
	.mulright_q_3_2(\mulright_q[2][3]~q ),
	.mulright_q_6_2(\mulright_q[2][6]~q ),
	.mulright_q_5_2(\mulright_q[2][5]~q ),
	.mulright_q_2_2(\mulright_q[2][2]~q ),
	.c_2(\g13:2:gf_mul1|c[2]~combout ),
	.c_1(\g13:2:gf_mul1|c[1]~combout ),
	.c_3(\g13:2:gf_mul1|c[3]~combout ),
	.c_4(\g13:2:gf_mul1|c[4]~combout ),
	.c_5(\g13:2:gf_mul1|c[5]~10_combout ),
	.c_6(\g13:2:gf_mul1|c[6]~16_combout ),
	.c_7(\g13:2:gf_mul1|c[7]~22_combout ),
	.c_8(\g13:2:gf_mul1|c[8]~28_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_1 \g13:1:gf_mul1 (
	.mulleft_q_7_1(\mulleft_q[1][7]~q ),
	.mulleft_q_8_1(\mulleft_q[1][8]~q ),
	.mulleft_q_6_1(\mulleft_q[1][6]~q ),
	.mulleft_q_5_1(\mulleft_q[1][5]~q ),
	.mulleft_q_4_1(\mulleft_q[1][4]~q ),
	.mulleft_q_3_1(\mulleft_q[1][3]~q ),
	.mulleft_q_1_1(\mulleft_q[1][1]~q ),
	.mulleft_q_2_1(\mulleft_q[1][2]~q ),
	.mulright_q_7_1(\mulright_q[1][7]~q ),
	.mulright_q_8_1(\mulright_q[1][8]~q ),
	.mulright_q_4_1(\mulright_q[1][4]~q ),
	.mulright_q_3_1(\mulright_q[1][3]~q ),
	.mulright_q_6_1(\mulright_q[1][6]~q ),
	.mulright_q_5_1(\mulright_q[1][5]~q ),
	.mulright_q_1_1(\mulright_q[1][1]~q ),
	.mulright_q_2_1(\mulright_q[1][2]~q ),
	.c_2(\g13:1:gf_mul1|c[2]~combout ),
	.c_1(\g13:1:gf_mul1|c[1]~combout ),
	.c_3(\g13:1:gf_mul1|c[3]~combout ),
	.c_4(\g13:1:gf_mul1|c[4]~combout ),
	.c_5(\g13:1:gf_mul1|c[5]~11_combout ),
	.c_6(\g13:1:gf_mul1|c[6]~16_combout ),
	.c_7(\g13:1:gf_mul1|c[7]~22_combout ),
	.c_8(\g13:1:gf_mul1|c[8]~28_combout ));

dffeas \mulleft_q[1][7] (
	.clk(clk),
	.d(\mulleft_q[1][7]~10_combout ),
	.asdata(\synreg_q[8][7]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][7]~q ),
	.prn(vcc));
defparam \mulleft_q[1][7] .is_wysiwyg = "true";
defparam \mulleft_q[1][7] .power_up = "low";

dffeas \mulleft_q[1][8] (
	.clk(clk),
	.d(\mulleft_q[1][8]~9_combout ),
	.asdata(\synreg_q[8][8]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][8]~q ),
	.prn(vcc));
defparam \mulleft_q[1][8] .is_wysiwyg = "true";
defparam \mulleft_q[1][8] .power_up = "low";

dffeas \mulleft_q[1][6] (
	.clk(clk),
	.d(\mulleft_q[1][6]~11_combout ),
	.asdata(\synreg_q[8][6]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][6]~q ),
	.prn(vcc));
defparam \mulleft_q[1][6] .is_wysiwyg = "true";
defparam \mulleft_q[1][6] .power_up = "low";

dffeas \mulleft_q[1][5] (
	.clk(clk),
	.d(\mulleft_q[1][5]~12_combout ),
	.asdata(\synreg_q[8][5]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][5]~q ),
	.prn(vcc));
defparam \mulleft_q[1][5] .is_wysiwyg = "true";
defparam \mulleft_q[1][5] .power_up = "low";

dffeas \mulleft_q[1][4] (
	.clk(clk),
	.d(\mulleft_q[1][4]~13_combout ),
	.asdata(\synreg_q[8][4]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][4]~q ),
	.prn(vcc));
defparam \mulleft_q[1][4] .is_wysiwyg = "true";
defparam \mulleft_q[1][4] .power_up = "low";

dffeas \mulleft_q[1][3] (
	.clk(clk),
	.d(\mulleft_q[1][3]~14_combout ),
	.asdata(\synreg_q[8][3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][3]~q ),
	.prn(vcc));
defparam \mulleft_q[1][3] .is_wysiwyg = "true";
defparam \mulleft_q[1][3] .power_up = "low";

dffeas \mulleft_q[1][1] (
	.clk(clk),
	.d(\mulleft_q[1][1]~8_combout ),
	.asdata(\synreg_q[8][1]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][1]~q ),
	.prn(vcc));
defparam \mulleft_q[1][1] .is_wysiwyg = "true";
defparam \mulleft_q[1][1] .power_up = "low";

dffeas \mulleft_q[1][2] (
	.clk(clk),
	.d(\mulleft_q[1][2]~15_combout ),
	.asdata(\synreg_q[8][2]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[1][2]~q ),
	.prn(vcc));
defparam \mulleft_q[1][2] .is_wysiwyg = "true";
defparam \mulleft_q[1][2] .power_up = "low";

dffeas \mulleft_q[3][7] (
	.clk(clk),
	.d(\mulleft_q[3][7]~18_combout ),
	.asdata(\synreg_q[6][7]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][7]~q ),
	.prn(vcc));
defparam \mulleft_q[3][7] .is_wysiwyg = "true";
defparam \mulleft_q[3][7] .power_up = "low";

dffeas \mulleft_q[3][8] (
	.clk(clk),
	.d(\mulleft_q[3][8]~17_combout ),
	.asdata(\synreg_q[6][8]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][8]~q ),
	.prn(vcc));
defparam \mulleft_q[3][8] .is_wysiwyg = "true";
defparam \mulleft_q[3][8] .power_up = "low";

dffeas \mulleft_q[3][6] (
	.clk(clk),
	.d(\mulleft_q[3][6]~19_combout ),
	.asdata(\synreg_q[6][6]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][6]~q ),
	.prn(vcc));
defparam \mulleft_q[3][6] .is_wysiwyg = "true";
defparam \mulleft_q[3][6] .power_up = "low";

dffeas \mulleft_q[3][5] (
	.clk(clk),
	.d(\mulleft_q[3][5]~20_combout ),
	.asdata(\synreg_q[6][5]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][5]~q ),
	.prn(vcc));
defparam \mulleft_q[3][5] .is_wysiwyg = "true";
defparam \mulleft_q[3][5] .power_up = "low";

dffeas \mulleft_q[3][4] (
	.clk(clk),
	.d(\mulleft_q[3][4]~21_combout ),
	.asdata(\synreg_q[6][4]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][4]~q ),
	.prn(vcc));
defparam \mulleft_q[3][4] .is_wysiwyg = "true";
defparam \mulleft_q[3][4] .power_up = "low";

dffeas \mulleft_q[3][3] (
	.clk(clk),
	.d(\mulleft_q[3][3]~22_combout ),
	.asdata(\synreg_q[6][3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][3]~q ),
	.prn(vcc));
defparam \mulleft_q[3][3] .is_wysiwyg = "true";
defparam \mulleft_q[3][3] .power_up = "low";

dffeas \mulleft_q[3][1] (
	.clk(clk),
	.d(\mulleft_q[3][1]~16_combout ),
	.asdata(\synreg_q[6][1]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][1]~q ),
	.prn(vcc));
defparam \mulleft_q[3][1] .is_wysiwyg = "true";
defparam \mulleft_q[3][1] .power_up = "low";

dffeas \mulleft_q[3][2] (
	.clk(clk),
	.d(\mulleft_q[3][2]~23_combout ),
	.asdata(\synreg_q[6][2]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[3][2]~q ),
	.prn(vcc));
defparam \mulleft_q[3][2] .is_wysiwyg = "true";
defparam \mulleft_q[3][2] .power_up = "low";

dffeas \mulleft_q[2][7] (
	.clk(clk),
	.d(\mulleft_q[2][7]~2_combout ),
	.asdata(\synreg_q[7][7]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][7]~q ),
	.prn(vcc));
defparam \mulleft_q[2][7] .is_wysiwyg = "true";
defparam \mulleft_q[2][7] .power_up = "low";

dffeas \mulleft_q[2][8] (
	.clk(clk),
	.d(\mulleft_q[2][8]~1_combout ),
	.asdata(\synreg_q[7][8]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][8]~q ),
	.prn(vcc));
defparam \mulleft_q[2][8] .is_wysiwyg = "true";
defparam \mulleft_q[2][8] .power_up = "low";

dffeas \mulleft_q[2][6] (
	.clk(clk),
	.d(\mulleft_q[2][6]~3_combout ),
	.asdata(\synreg_q[7][6]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][6]~q ),
	.prn(vcc));
defparam \mulleft_q[2][6] .is_wysiwyg = "true";
defparam \mulleft_q[2][6] .power_up = "low";

dffeas \mulleft_q[2][5] (
	.clk(clk),
	.d(\mulleft_q[2][5]~4_combout ),
	.asdata(\synreg_q[7][5]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][5]~q ),
	.prn(vcc));
defparam \mulleft_q[2][5] .is_wysiwyg = "true";
defparam \mulleft_q[2][5] .power_up = "low";

dffeas \mulleft_q[2][4] (
	.clk(clk),
	.d(\mulleft_q[2][4]~5_combout ),
	.asdata(\synreg_q[7][4]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][4]~q ),
	.prn(vcc));
defparam \mulleft_q[2][4] .is_wysiwyg = "true";
defparam \mulleft_q[2][4] .power_up = "low";

dffeas \mulleft_q[2][3] (
	.clk(clk),
	.d(\mulleft_q[2][3]~6_combout ),
	.asdata(\synreg_q[7][3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][3]~q ),
	.prn(vcc));
defparam \mulleft_q[2][3] .is_wysiwyg = "true";
defparam \mulleft_q[2][3] .power_up = "low";

dffeas \mulleft_q[2][1] (
	.clk(clk),
	.d(\mulleft_q[2][1]~0_combout ),
	.asdata(\synreg_q[7][1]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][1]~q ),
	.prn(vcc));
defparam \mulleft_q[2][1] .is_wysiwyg = "true";
defparam \mulleft_q[2][1] .power_up = "low";

dffeas \mulright_q[2][1] (
	.clk(clk),
	.d(\mulright_q[2][1]~0_combout ),
	.asdata(bd_q_1_2),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulright_q[2][1]~q ),
	.prn(vcc));
defparam \mulright_q[2][1] .is_wysiwyg = "true";
defparam \mulright_q[2][1] .power_up = "low";

dffeas \mulleft_q[2][2] (
	.clk(clk),
	.d(\mulleft_q[2][2]~7_combout ),
	.asdata(\synreg_q[7][2]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[2][2]~q ),
	.prn(vcc));
defparam \mulleft_q[2][2] .is_wysiwyg = "true";
defparam \mulleft_q[2][2] .power_up = "low";

dffeas \mulleft_q[4][7] (
	.clk(clk),
	.d(\mulleft_q[4][7]~26_combout ),
	.asdata(\synreg_q[5][7]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][7]~q ),
	.prn(vcc));
defparam \mulleft_q[4][7] .is_wysiwyg = "true";
defparam \mulleft_q[4][7] .power_up = "low";

dffeas \mulleft_q[4][8] (
	.clk(clk),
	.d(\mulleft_q[4][8]~25_combout ),
	.asdata(\synreg_q[5][8]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][8]~q ),
	.prn(vcc));
defparam \mulleft_q[4][8] .is_wysiwyg = "true";
defparam \mulleft_q[4][8] .power_up = "low";

dffeas \mulleft_q[4][6] (
	.clk(clk),
	.d(\mulleft_q[4][6]~27_combout ),
	.asdata(\synreg_q[5][6]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][6]~q ),
	.prn(vcc));
defparam \mulleft_q[4][6] .is_wysiwyg = "true";
defparam \mulleft_q[4][6] .power_up = "low";

dffeas \mulleft_q[4][5] (
	.clk(clk),
	.d(\mulleft_q[4][5]~28_combout ),
	.asdata(\synreg_q[5][5]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][5]~q ),
	.prn(vcc));
defparam \mulleft_q[4][5] .is_wysiwyg = "true";
defparam \mulleft_q[4][5] .power_up = "low";

dffeas \mulleft_q[4][4] (
	.clk(clk),
	.d(\mulleft_q[4][4]~29_combout ),
	.asdata(\synreg_q[5][4]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][4]~q ),
	.prn(vcc));
defparam \mulleft_q[4][4] .is_wysiwyg = "true";
defparam \mulleft_q[4][4] .power_up = "low";

dffeas \mulleft_q[4][3] (
	.clk(clk),
	.d(\mulleft_q[4][3]~30_combout ),
	.asdata(\synreg_q[5][3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][3]~q ),
	.prn(vcc));
defparam \mulleft_q[4][3] .is_wysiwyg = "true";
defparam \mulleft_q[4][3] .power_up = "low";

dffeas \mulleft_q[4][1] (
	.clk(clk),
	.d(\mulleft_q[4][1]~24_combout ),
	.asdata(\synreg_q[5][1]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][1]~q ),
	.prn(vcc));
defparam \mulleft_q[4][1] .is_wysiwyg = "true";
defparam \mulleft_q[4][1] .power_up = "low";

dffeas \mulleft_q[4][2] (
	.clk(clk),
	.d(\mulleft_q[4][2]~31_combout ),
	.asdata(\synreg_q[5][2]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\next_state.S2~combout ),
	.ena(vcc),
	.q(\mulleft_q[4][2]~q ),
	.prn(vcc));
defparam \mulleft_q[4][2] .is_wysiwyg = "true";
defparam \mulleft_q[4][2] .power_up = "low";

cycloneive_lcell_comb \mulleft_q[1][7]~10 (
	.dataa(bdprev_q_7_1),
	.datab(\synreg_q[1][7]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][7]~10_combout ),
	.cout());
defparam \mulleft_q[1][7]~10 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][7]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][8]~9 (
	.dataa(bdprev_q_8_1),
	.datab(\synreg_q[1][8]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][8]~9_combout ),
	.cout());
defparam \mulleft_q[1][8]~9 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][8]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][6]~11 (
	.dataa(bdprev_q_6_1),
	.datab(\synreg_q[1][6]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][6]~11_combout ),
	.cout());
defparam \mulleft_q[1][6]~11 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][6]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][5]~12 (
	.dataa(bdprev_q_5_1),
	.datab(\synreg_q[1][5]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][5]~12_combout ),
	.cout());
defparam \mulleft_q[1][5]~12 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][5]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][4]~13 (
	.dataa(bdprev_q_4_1),
	.datab(\synreg_q[1][4]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][4]~13_combout ),
	.cout());
defparam \mulleft_q[1][4]~13 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][4]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][3]~14 (
	.dataa(bdprev_q_3_1),
	.datab(\synreg_q[1][3]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][3]~14_combout ),
	.cout());
defparam \mulleft_q[1][3]~14 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][3]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_q[2][1]~0 (
	.dataa(\deltamult_q[1]~q ),
	.datab(\omegaright[1][1]~combout ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulright_q[2][1]~0_combout ),
	.cout());
defparam \mulright_q[2][1]~0 .lut_mask = 16'hAACC;
defparam \mulright_q[2][1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][1]~8 (
	.dataa(bdprev_q_1_1),
	.datab(\synreg_q[1][1]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][1]~8_combout ),
	.cout());
defparam \mulleft_q[1][1]~8 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][1]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[1][2]~15 (
	.dataa(bdprev_q_2_1),
	.datab(\synreg_q[1][2]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[1][2]~15_combout ),
	.cout());
defparam \mulleft_q[1][2]~15 .lut_mask = 16'hAACC;
defparam \mulleft_q[1][2]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][7]~18 (
	.dataa(bdprev_q_7_3),
	.datab(\synreg_q[3][7]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][7]~18_combout ),
	.cout());
defparam \mulleft_q[3][7]~18 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][7]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][8]~17 (
	.dataa(bdprev_q_8_3),
	.datab(\synreg_q[3][8]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][8]~17_combout ),
	.cout());
defparam \mulleft_q[3][8]~17 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][8]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][6]~19 (
	.dataa(bdprev_q_6_3),
	.datab(\synreg_q[3][6]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][6]~19_combout ),
	.cout());
defparam \mulleft_q[3][6]~19 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][6]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][5]~20 (
	.dataa(bdprev_q_5_3),
	.datab(\synreg_q[3][5]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][5]~20_combout ),
	.cout());
defparam \mulleft_q[3][5]~20 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][5]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][4]~21 (
	.dataa(bdprev_q_4_3),
	.datab(\synreg_q[3][4]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][4]~21_combout ),
	.cout());
defparam \mulleft_q[3][4]~21 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][4]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][3]~22 (
	.dataa(bdprev_q_3_3),
	.datab(\synreg_q[3][3]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][3]~22_combout ),
	.cout());
defparam \mulleft_q[3][3]~22 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][3]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][1]~16 (
	.dataa(bdprev_q_1_3),
	.datab(\synreg_q[3][1]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][1]~16_combout ),
	.cout());
defparam \mulleft_q[3][1]~16 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][1]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[3][2]~23 (
	.dataa(bdprev_q_2_3),
	.datab(\synreg_q[3][2]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[3][2]~23_combout ),
	.cout());
defparam \mulleft_q[3][2]~23 .lut_mask = 16'hAACC;
defparam \mulleft_q[3][2]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][7]~2 (
	.dataa(bdprev_q_7_2),
	.datab(\synreg_q[2][7]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][7]~2_combout ),
	.cout());
defparam \mulleft_q[2][7]~2 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][7]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][8]~1 (
	.dataa(bdprev_q_8_2),
	.datab(\synreg_q[2][8]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][8]~1_combout ),
	.cout());
defparam \mulleft_q[2][8]~1 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][8]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][6]~3 (
	.dataa(bdprev_q_6_2),
	.datab(\synreg_q[2][6]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][6]~3_combout ),
	.cout());
defparam \mulleft_q[2][6]~3 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][6]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][5]~4 (
	.dataa(bdprev_q_5_2),
	.datab(\synreg_q[2][5]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][5]~4_combout ),
	.cout());
defparam \mulleft_q[2][5]~4 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][5]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][4]~5 (
	.dataa(bdprev_q_4_2),
	.datab(\synreg_q[2][4]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][4]~5_combout ),
	.cout());
defparam \mulleft_q[2][4]~5 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][4]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][3]~6 (
	.dataa(bdprev_q_3_2),
	.datab(\synreg_q[2][3]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][3]~6_combout ),
	.cout());
defparam \mulleft_q[2][3]~6 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][3]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][1]~0 (
	.dataa(bdprev_q_1_2),
	.datab(\synreg_q[2][1]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][1]~0_combout ),
	.cout());
defparam \mulleft_q[2][1]~0 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[2][2]~7 (
	.dataa(bdprev_q_2_2),
	.datab(\synreg_q[2][2]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[2][2]~7_combout ),
	.cout());
defparam \mulleft_q[2][2]~7 .lut_mask = 16'hAACC;
defparam \mulleft_q[2][2]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][7]~26 (
	.dataa(bdprev_q_7_4),
	.datab(\synreg_q[4][7]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][7]~26_combout ),
	.cout());
defparam \mulleft_q[4][7]~26 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][7]~26 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][8]~25 (
	.dataa(bdprev_q_8_4),
	.datab(\synreg_q[4][8]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][8]~25_combout ),
	.cout());
defparam \mulleft_q[4][8]~25 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][8]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][6]~27 (
	.dataa(bdprev_q_6_4),
	.datab(\synreg_q[4][6]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][6]~27_combout ),
	.cout());
defparam \mulleft_q[4][6]~27 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][6]~27 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][5]~28 (
	.dataa(bdprev_q_5_4),
	.datab(\synreg_q[4][5]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][5]~28_combout ),
	.cout());
defparam \mulleft_q[4][5]~28 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][5]~28 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][4]~29 (
	.dataa(bdprev_q_4_4),
	.datab(\synreg_q[4][4]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][4]~29_combout ),
	.cout());
defparam \mulleft_q[4][4]~29 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][4]~29 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][3]~30 (
	.dataa(bdprev_q_3_4),
	.datab(\synreg_q[4][3]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][3]~30_combout ),
	.cout());
defparam \mulleft_q[4][3]~30 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][3]~30 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][1]~24 (
	.dataa(bdprev_q_1_4),
	.datab(\synreg_q[4][1]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][1]~24_combout ),
	.cout());
defparam \mulleft_q[4][1]~24 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][1]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulleft_q[4][2]~31 (
	.dataa(bdprev_q_2_4),
	.datab(\synreg_q[4][2]~q ),
	.datac(gnd),
	.datad(\WideOr7~combout ),
	.cin(gnd),
	.combout(\mulleft_q[4][2]~31_combout ),
	.cout());
defparam \mulleft_q[4][2]~31 .lut_mask = 16'hAACC;
defparam \mulleft_q[4][2]~31 .sum_lutc_input = "datac";

dffeas \mulright_q[1][7] (
	.clk(clk),
	.d(\mulright_d[1][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][7]~q ),
	.prn(vcc));
defparam \mulright_q[1][7] .is_wysiwyg = "true";
defparam \mulright_q[1][7] .power_up = "low";

dffeas \mulright_q[1][8] (
	.clk(clk),
	.d(\mulright_d[1][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][8]~q ),
	.prn(vcc));
defparam \mulright_q[1][8] .is_wysiwyg = "true";
defparam \mulright_q[1][8] .power_up = "low";

dffeas \mulright_q[1][4] (
	.clk(clk),
	.d(\mulright_d[1][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][4]~q ),
	.prn(vcc));
defparam \mulright_q[1][4] .is_wysiwyg = "true";
defparam \mulright_q[1][4] .power_up = "low";

dffeas \mulright_q[1][3] (
	.clk(clk),
	.d(\mulright_d[1][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][3]~q ),
	.prn(vcc));
defparam \mulright_q[1][3] .is_wysiwyg = "true";
defparam \mulright_q[1][3] .power_up = "low";

dffeas \mulright_q[1][6] (
	.clk(clk),
	.d(\mulright_d[1][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][6]~q ),
	.prn(vcc));
defparam \mulright_q[1][6] .is_wysiwyg = "true";
defparam \mulright_q[1][6] .power_up = "low";

dffeas \mulright_q[1][5] (
	.clk(clk),
	.d(\mulright_d[1][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][5]~q ),
	.prn(vcc));
defparam \mulright_q[1][5] .is_wysiwyg = "true";
defparam \mulright_q[1][5] .power_up = "low";

dffeas \mulright_q[1][1] (
	.clk(clk),
	.d(\mulright_d[1][1]~72_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][1]~q ),
	.prn(vcc));
defparam \mulright_q[1][1] .is_wysiwyg = "true";
defparam \mulright_q[1][1] .power_up = "low";

dffeas \mulright_q[1][2] (
	.clk(clk),
	.d(\mulright_d[1][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[1][2]~q ),
	.prn(vcc));
defparam \mulright_q[1][2] .is_wysiwyg = "true";
defparam \mulright_q[1][2] .power_up = "low";

dffeas \mulright_q[3][7] (
	.clk(clk),
	.d(\mulright_d[3][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][7]~q ),
	.prn(vcc));
defparam \mulright_q[3][7] .is_wysiwyg = "true";
defparam \mulright_q[3][7] .power_up = "low";

dffeas \mulright_q[3][8] (
	.clk(clk),
	.d(\mulright_d[3][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][8]~q ),
	.prn(vcc));
defparam \mulright_q[3][8] .is_wysiwyg = "true";
defparam \mulright_q[3][8] .power_up = "low";

dffeas \mulright_q[3][4] (
	.clk(clk),
	.d(\mulright_d[3][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][4]~q ),
	.prn(vcc));
defparam \mulright_q[3][4] .is_wysiwyg = "true";
defparam \mulright_q[3][4] .power_up = "low";

dffeas \mulright_q[3][3] (
	.clk(clk),
	.d(\mulright_d[3][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][3]~q ),
	.prn(vcc));
defparam \mulright_q[3][3] .is_wysiwyg = "true";
defparam \mulright_q[3][3] .power_up = "low";

dffeas \mulright_q[3][6] (
	.clk(clk),
	.d(\mulright_d[3][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][6]~q ),
	.prn(vcc));
defparam \mulright_q[3][6] .is_wysiwyg = "true";
defparam \mulright_q[3][6] .power_up = "low";

dffeas \mulright_q[3][5] (
	.clk(clk),
	.d(\mulright_d[3][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][5]~q ),
	.prn(vcc));
defparam \mulright_q[3][5] .is_wysiwyg = "true";
defparam \mulright_q[3][5] .power_up = "low";

dffeas \mulright_q[3][1] (
	.clk(clk),
	.d(\mulright_d[3][1]~73_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][1]~q ),
	.prn(vcc));
defparam \mulright_q[3][1] .is_wysiwyg = "true";
defparam \mulright_q[3][1] .power_up = "low";

dffeas \mulright_q[3][2] (
	.clk(clk),
	.d(\mulright_d[3][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[3][2]~q ),
	.prn(vcc));
defparam \mulright_q[3][2] .is_wysiwyg = "true";
defparam \mulright_q[3][2] .power_up = "low";

dffeas \mulright_q[2][7] (
	.clk(clk),
	.d(\mulright_d[2][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][7]~q ),
	.prn(vcc));
defparam \mulright_q[2][7] .is_wysiwyg = "true";
defparam \mulright_q[2][7] .power_up = "low";

dffeas \mulright_q[2][8] (
	.clk(clk),
	.d(\mulright_d[2][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][8]~q ),
	.prn(vcc));
defparam \mulright_q[2][8] .is_wysiwyg = "true";
defparam \mulright_q[2][8] .power_up = "low";

dffeas \mulright_q[2][4] (
	.clk(clk),
	.d(\mulright_d[2][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][4]~q ),
	.prn(vcc));
defparam \mulright_q[2][4] .is_wysiwyg = "true";
defparam \mulright_q[2][4] .power_up = "low";

dffeas \mulright_q[2][3] (
	.clk(clk),
	.d(\mulright_d[2][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][3]~q ),
	.prn(vcc));
defparam \mulright_q[2][3] .is_wysiwyg = "true";
defparam \mulright_q[2][3] .power_up = "low";

dffeas \mulright_q[2][6] (
	.clk(clk),
	.d(\mulright_d[2][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][6]~q ),
	.prn(vcc));
defparam \mulright_q[2][6] .is_wysiwyg = "true";
defparam \mulright_q[2][6] .power_up = "low";

dffeas \mulright_q[2][5] (
	.clk(clk),
	.d(\mulright_d[2][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][5]~q ),
	.prn(vcc));
defparam \mulright_q[2][5] .is_wysiwyg = "true";
defparam \mulright_q[2][5] .power_up = "low";

dffeas \mulright_q[2][2] (
	.clk(clk),
	.d(\mulright_d[2][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[2][2]~q ),
	.prn(vcc));
defparam \mulright_q[2][2] .is_wysiwyg = "true";
defparam \mulright_q[2][2] .power_up = "low";

dffeas \mulright_q[4][7] (
	.clk(clk),
	.d(\mulright_d[4][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][7]~q ),
	.prn(vcc));
defparam \mulright_q[4][7] .is_wysiwyg = "true";
defparam \mulright_q[4][7] .power_up = "low";

dffeas \mulright_q[4][8] (
	.clk(clk),
	.d(\mulright_d[4][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][8]~q ),
	.prn(vcc));
defparam \mulright_q[4][8] .is_wysiwyg = "true";
defparam \mulright_q[4][8] .power_up = "low";

dffeas \mulright_q[4][4] (
	.clk(clk),
	.d(\mulright_d[4][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][4]~q ),
	.prn(vcc));
defparam \mulright_q[4][4] .is_wysiwyg = "true";
defparam \mulright_q[4][4] .power_up = "low";

dffeas \mulright_q[4][3] (
	.clk(clk),
	.d(\mulright_d[4][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][3]~q ),
	.prn(vcc));
defparam \mulright_q[4][3] .is_wysiwyg = "true";
defparam \mulright_q[4][3] .power_up = "low";

dffeas \mulright_q[4][6] (
	.clk(clk),
	.d(\mulright_d[4][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][6]~q ),
	.prn(vcc));
defparam \mulright_q[4][6] .is_wysiwyg = "true";
defparam \mulright_q[4][6] .power_up = "low";

dffeas \mulright_q[4][5] (
	.clk(clk),
	.d(\mulright_d[4][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][5]~q ),
	.prn(vcc));
defparam \mulright_q[4][5] .is_wysiwyg = "true";
defparam \mulright_q[4][5] .power_up = "low";

dffeas \mulright_q[4][1] (
	.clk(clk),
	.d(\mulright_d[4][1]~74_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][1]~q ),
	.prn(vcc));
defparam \mulright_q[4][1] .is_wysiwyg = "true";
defparam \mulright_q[4][1] .power_up = "low";

dffeas \mulright_q[4][2] (
	.clk(clk),
	.d(\mulright_d[4][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulright_q[4][2]~q ),
	.prn(vcc));
defparam \mulright_q[4][2] .is_wysiwyg = "true";
defparam \mulright_q[4][2] .power_up = "low";

dffeas \deltamult_q[7] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[7]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[7]~q ),
	.prn(vcc));
defparam \deltamult_q[7] .is_wysiwyg = "true";
defparam \deltamult_q[7] .power_up = "low";

cycloneive_lcell_comb WideOr7(
	.dataa(\state.S12~q ),
	.datab(\state.S11~q ),
	.datac(\state.S10~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\WideOr7~combout ),
	.cout());
defparam WideOr7.lut_mask = 16'hFEFE;
defparam WideOr7.sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d~62 (
	.dataa(\deltamult_q[7]~q ),
	.datab(bdprev_q_7_1),
	.datac(\WideOr7~combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~62_combout ),
	.cout());
defparam \mulright_d~62 .lut_mask = 16'hACFF;
defparam \mulright_d~62 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d~63 (
	.dataa(bdprev_q_8_1),
	.datab(\state.S12~q ),
	.datac(\state.S11~q ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~63_combout ),
	.cout());
defparam \mulright_d~63 .lut_mask = 16'hFEFF;
defparam \mulright_d~63 .sum_lutc_input = "datac";

dffeas \deltamult_q[8] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[8]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[8]~q ),
	.prn(vcc));
defparam \deltamult_q[8] .is_wysiwyg = "true";
defparam \deltamult_q[8] .power_up = "low";

cycloneive_lcell_comb \mulright_d~64 (
	.dataa(\mulright_d~63_combout ),
	.datab(\deltamult_q[8]~q ),
	.datac(\WideOr7~combout ),
	.datad(\next_state.S2~combout ),
	.cin(gnd),
	.combout(\mulright_d~64_combout ),
	.cout());
defparam \mulright_d~64 .lut_mask = 16'hEFFF;
defparam \mulright_d~64 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d~65 (
	.dataa(bdprev_q_4_1),
	.datab(\state.S12~q ),
	.datac(\state.S11~q ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~65_combout ),
	.cout());
defparam \mulright_d~65 .lut_mask = 16'hFEFF;
defparam \mulright_d~65 .sum_lutc_input = "datac";

dffeas \deltamult_q[4] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[4]~q ),
	.prn(vcc));
defparam \deltamult_q[4] .is_wysiwyg = "true";
defparam \deltamult_q[4] .power_up = "low";

cycloneive_lcell_comb \mulright_d~66 (
	.dataa(\mulright_d~65_combout ),
	.datab(\deltamult_q[4]~q ),
	.datac(\WideOr7~combout ),
	.datad(\next_state.S2~combout ),
	.cin(gnd),
	.combout(\mulright_d~66_combout ),
	.cout());
defparam \mulright_d~66 .lut_mask = 16'hEFFF;
defparam \mulright_d~66 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d~67 (
	.dataa(bdprev_q_3_1),
	.datab(\state.S12~q ),
	.datac(\state.S11~q ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~67_combout ),
	.cout());
defparam \mulright_d~67 .lut_mask = 16'hFEFF;
defparam \mulright_d~67 .sum_lutc_input = "datac";

dffeas \deltamult_q[3] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[3]~q ),
	.prn(vcc));
defparam \deltamult_q[3] .is_wysiwyg = "true";
defparam \deltamult_q[3] .power_up = "low";

cycloneive_lcell_comb \mulright_d~68 (
	.dataa(\mulright_d~67_combout ),
	.datab(\deltamult_q[3]~q ),
	.datac(\WideOr7~combout ),
	.datad(\next_state.S2~combout ),
	.cin(gnd),
	.combout(\mulright_d~68_combout ),
	.cout());
defparam \mulright_d~68 .lut_mask = 16'hEFFF;
defparam \mulright_d~68 .sum_lutc_input = "datac";

dffeas \deltamult_q[6] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[6]~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[6]~q ),
	.prn(vcc));
defparam \deltamult_q[6] .is_wysiwyg = "true";
defparam \deltamult_q[6] .power_up = "low";

cycloneive_lcell_comb \mulright_d~69 (
	.dataa(\deltamult_q[6]~q ),
	.datab(bdprev_q_6_1),
	.datac(\WideOr7~combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~69_combout ),
	.cout());
defparam \mulright_d~69 .lut_mask = 16'hACFF;
defparam \mulright_d~69 .sum_lutc_input = "datac";

dffeas \deltamult_q[5] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[5]~25_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[5]~q ),
	.prn(vcc));
defparam \deltamult_q[5] .is_wysiwyg = "true";
defparam \deltamult_q[5] .power_up = "low";

cycloneive_lcell_comb \mulright_d~70 (
	.dataa(\deltamult_q[5]~q ),
	.datab(bdprev_q_5_1),
	.datac(\WideOr7~combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~70_combout ),
	.cout());
defparam \mulright_d~70 .lut_mask = 16'hACFF;
defparam \mulright_d~70 .sum_lutc_input = "datac";

dffeas \deltamult_q[1] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[1]~q ),
	.prn(vcc));
defparam \deltamult_q[1] .is_wysiwyg = "true";
defparam \deltamult_q[1] .power_up = "low";

cycloneive_lcell_comb \omegaright[1][1] (
	.dataa(bdprev_q_1_1),
	.datab(\state.S10~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\omegaright[1][1]~combout ),
	.cout());
defparam \omegaright[1][1] .lut_mask = 16'hEEEE;
defparam \omegaright[1][1] .sum_lutc_input = "datac";

dffeas \deltamult_q[2] (
	.clk(clk),
	.d(\gf_div1|gf_mul|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\deltamult_q[2]~q ),
	.prn(vcc));
defparam \deltamult_q[2] .is_wysiwyg = "true";
defparam \deltamult_q[2] .power_up = "low";

cycloneive_lcell_comb \mulright_d~71 (
	.dataa(\deltamult_q[2]~q ),
	.datab(bdprev_q_2_1),
	.datac(\WideOr7~combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\mulright_d~71_combout ),
	.cout());
defparam \mulright_d~71 .lut_mask = 16'hACFF;
defparam \mulright_d~71 .sum_lutc_input = "datac";

cycloneive_lcell_comb deltaprev_ena(
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~4_combout ),
	.datac(\state.S5~q ),
	.datad(\LessThan0~1_combout ),
	.cin(gnd),
	.combout(\deltaprev_ena~combout ),
	.cout());
defparam deltaprev_ena.lut_mask = 16'hFEFF;
defparam deltaprev_ena.sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[1] (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\delta_q[1]~q ),
	.cin(gnd),
	.combout(\deltaprev_d[1]~combout ),
	.cout());
defparam \deltaprev_d[1] .lut_mask = 16'hFFFE;
defparam \deltaprev_d[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[2] (
	.dataa(\delta_q[2]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[2]~combout ),
	.cout());
defparam \deltaprev_d[2] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[3] (
	.dataa(\delta_q[3]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[3]~combout ),
	.cout());
defparam \deltaprev_d[3] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[4] (
	.dataa(\delta_q[4]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[4]~combout ),
	.cout());
defparam \deltaprev_d[4] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[5] (
	.dataa(\delta_q[5]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[5]~combout ),
	.cout());
defparam \deltaprev_d[5] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[6] (
	.dataa(\delta_q[6]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[6]~combout ),
	.cout());
defparam \deltaprev_d[6] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[7] (
	.dataa(\delta_q[7]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[7]~combout ),
	.cout());
defparam \deltaprev_d[7] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \deltaprev_d[8] (
	.dataa(\delta_q[8]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\deltaprev_d[8]~combout ),
	.cout());
defparam \deltaprev_d[8] .lut_mask = 16'hBFFF;
defparam \deltaprev_d[8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][7] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_7_1),
	.datad(\mulright_d~62_combout ),
	.cin(gnd),
	.combout(\mulright_d[1][7]~combout ),
	.cout());
defparam \mulright_d[1][7] .lut_mask = 16'hFFF6;
defparam \mulright_d[1][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][8] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~64_combout ),
	.datad(bd_q_8_1),
	.cin(gnd),
	.combout(\mulright_d[1][8]~combout ),
	.cout());
defparam \mulright_d[1][8] .lut_mask = 16'hFFFE;
defparam \mulright_d[1][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][4] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~66_combout ),
	.datad(bd_q_4_1),
	.cin(gnd),
	.combout(\mulright_d[1][4]~combout ),
	.cout());
defparam \mulright_d[1][4] .lut_mask = 16'hFFFE;
defparam \mulright_d[1][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][3] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~68_combout ),
	.datad(bd_q_3_1),
	.cin(gnd),
	.combout(\mulright_d[1][3]~combout ),
	.cout());
defparam \mulright_d[1][3] .lut_mask = 16'hFFFE;
defparam \mulright_d[1][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][6] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_6_1),
	.datad(\mulright_d~69_combout ),
	.cin(gnd),
	.combout(\mulright_d[1][6]~combout ),
	.cout());
defparam \mulright_d[1][6] .lut_mask = 16'hFFF6;
defparam \mulright_d[1][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][5] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_5_1),
	.datad(\mulright_d~70_combout ),
	.cin(gnd),
	.combout(\mulright_d[1][5]~combout ),
	.cout());
defparam \mulright_d[1][5] .lut_mask = 16'hFFF6;
defparam \mulright_d[1][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][1]~72 (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_1_1),
	.datad(\mulright_q[2][1]~0_combout ),
	.cin(gnd),
	.combout(\mulright_d[1][1]~72_combout ),
	.cout());
defparam \mulright_d[1][1]~72 .lut_mask = 16'hFFF6;
defparam \mulright_d[1][1]~72 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[1][2] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_2_1),
	.datad(\mulright_d~71_combout ),
	.cin(gnd),
	.combout(\mulright_d[1][2]~combout ),
	.cout());
defparam \mulright_d[1][2] .lut_mask = 16'hFFF6;
defparam \mulright_d[1][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][7] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_7_3),
	.datad(\mulright_d~62_combout ),
	.cin(gnd),
	.combout(\mulright_d[3][7]~combout ),
	.cout());
defparam \mulright_d[3][7] .lut_mask = 16'hFFF6;
defparam \mulright_d[3][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][8] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~64_combout ),
	.datad(bd_q_8_3),
	.cin(gnd),
	.combout(\mulright_d[3][8]~combout ),
	.cout());
defparam \mulright_d[3][8] .lut_mask = 16'hFFFE;
defparam \mulright_d[3][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][4] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~66_combout ),
	.datad(bd_q_4_3),
	.cin(gnd),
	.combout(\mulright_d[3][4]~combout ),
	.cout());
defparam \mulright_d[3][4] .lut_mask = 16'hFFFE;
defparam \mulright_d[3][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][3] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~68_combout ),
	.datad(bd_q_3_3),
	.cin(gnd),
	.combout(\mulright_d[3][3]~combout ),
	.cout());
defparam \mulright_d[3][3] .lut_mask = 16'hFFFE;
defparam \mulright_d[3][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][6] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_6_3),
	.datad(\mulright_d~69_combout ),
	.cin(gnd),
	.combout(\mulright_d[3][6]~combout ),
	.cout());
defparam \mulright_d[3][6] .lut_mask = 16'hFFF6;
defparam \mulright_d[3][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][5] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_5_3),
	.datad(\mulright_d~70_combout ),
	.cin(gnd),
	.combout(\mulright_d[3][5]~combout ),
	.cout());
defparam \mulright_d[3][5] .lut_mask = 16'hFFF6;
defparam \mulright_d[3][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][1]~73 (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_1_3),
	.datad(\mulright_q[2][1]~0_combout ),
	.cin(gnd),
	.combout(\mulright_d[3][1]~73_combout ),
	.cout());
defparam \mulright_d[3][1]~73 .lut_mask = 16'hFFF6;
defparam \mulright_d[3][1]~73 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[3][2] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_2_3),
	.datad(\mulright_d~71_combout ),
	.cin(gnd),
	.combout(\mulright_d[3][2]~combout ),
	.cout());
defparam \mulright_d[3][2] .lut_mask = 16'hFFF6;
defparam \mulright_d[3][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][7] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_7_2),
	.datad(\mulright_d~62_combout ),
	.cin(gnd),
	.combout(\mulright_d[2][7]~combout ),
	.cout());
defparam \mulright_d[2][7] .lut_mask = 16'hFFF6;
defparam \mulright_d[2][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][8] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~64_combout ),
	.datad(bd_q_8_2),
	.cin(gnd),
	.combout(\mulright_d[2][8]~combout ),
	.cout());
defparam \mulright_d[2][8] .lut_mask = 16'hFFFE;
defparam \mulright_d[2][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][4] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~66_combout ),
	.datad(bd_q_4_2),
	.cin(gnd),
	.combout(\mulright_d[2][4]~combout ),
	.cout());
defparam \mulright_d[2][4] .lut_mask = 16'hFFFE;
defparam \mulright_d[2][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][3] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~68_combout ),
	.datad(bd_q_3_2),
	.cin(gnd),
	.combout(\mulright_d[2][3]~combout ),
	.cout());
defparam \mulright_d[2][3] .lut_mask = 16'hFFFE;
defparam \mulright_d[2][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][6] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_6_2),
	.datad(\mulright_d~69_combout ),
	.cin(gnd),
	.combout(\mulright_d[2][6]~combout ),
	.cout());
defparam \mulright_d[2][6] .lut_mask = 16'hFFF6;
defparam \mulright_d[2][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][5] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_5_2),
	.datad(\mulright_d~70_combout ),
	.cin(gnd),
	.combout(\mulright_d[2][5]~combout ),
	.cout());
defparam \mulright_d[2][5] .lut_mask = 16'hFFF6;
defparam \mulright_d[2][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[2][2] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_2_2),
	.datad(\mulright_d~71_combout ),
	.cin(gnd),
	.combout(\mulright_d[2][2]~combout ),
	.cout());
defparam \mulright_d[2][2] .lut_mask = 16'hFFF6;
defparam \mulright_d[2][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][7] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_7_4),
	.datad(\mulright_d~62_combout ),
	.cin(gnd),
	.combout(\mulright_d[4][7]~combout ),
	.cout());
defparam \mulright_d[4][7] .lut_mask = 16'hFFF6;
defparam \mulright_d[4][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][8] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~64_combout ),
	.datad(bd_q_8_4),
	.cin(gnd),
	.combout(\mulright_d[4][8]~combout ),
	.cout());
defparam \mulright_d[4][8] .lut_mask = 16'hFFFE;
defparam \mulright_d[4][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][4] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~66_combout ),
	.datad(bd_q_4_4),
	.cin(gnd),
	.combout(\mulright_d[4][4]~combout ),
	.cout());
defparam \mulright_d[4][4] .lut_mask = 16'hFFFE;
defparam \mulright_d[4][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][3] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(\mulright_d~68_combout ),
	.datad(bd_q_3_4),
	.cin(gnd),
	.combout(\mulright_d[4][3]~combout ),
	.cout());
defparam \mulright_d[4][3] .lut_mask = 16'hFFFE;
defparam \mulright_d[4][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][6] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_6_4),
	.datad(\mulright_d~69_combout ),
	.cin(gnd),
	.combout(\mulright_d[4][6]~combout ),
	.cout());
defparam \mulright_d[4][6] .lut_mask = 16'hFFF6;
defparam \mulright_d[4][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][5] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_5_4),
	.datad(\mulright_d~70_combout ),
	.cin(gnd),
	.combout(\mulright_d[4][5]~combout ),
	.cout());
defparam \mulright_d[4][5] .lut_mask = 16'hFFF6;
defparam \mulright_d[4][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][1]~74 (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_1_4),
	.datad(\mulright_q[2][1]~0_combout ),
	.cin(gnd),
	.combout(\mulright_d[4][1]~74_combout ),
	.cout());
defparam \mulright_d[4][1]~74 .lut_mask = 16'hFFF6;
defparam \mulright_d[4][1]~74 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulright_d[4][2] (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(bd_q_2_4),
	.datad(\mulright_d~71_combout ),
	.cin(gnd),
	.combout(\mulright_d[4][2]~combout ),
	.cout());
defparam \mulright_d[4][2] .lut_mask = 16'hFFF6;
defparam \mulright_d[4][2] .sum_lutc_input = "datac";

dffeas \bdprev_q[3][2] (
	.clk(clk),
	.d(\bdprev_q[3][2]~6_combout ),
	.asdata(bdprev_q_2_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_2_3),
	.prn(vcc));
defparam \bdprev_q[3][2] .is_wysiwyg = "true";
defparam \bdprev_q[3][2] .power_up = "low";

dffeas \bdprev_q[2][2] (
	.clk(clk),
	.d(\bdprev_q[2][2]~4_combout ),
	.asdata(bdprev_q_2_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_2_2),
	.prn(vcc));
defparam \bdprev_q[2][2] .is_wysiwyg = "true";
defparam \bdprev_q[2][2] .power_up = "low";

dffeas \bdprev_q[4][2] (
	.clk(clk),
	.d(\bdprev_q[4][2]~5_combout ),
	.asdata(bdprev_q_2_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_2_4),
	.prn(vcc));
defparam \bdprev_q[4][2] .is_wysiwyg = "true";
defparam \bdprev_q[4][2] .power_up = "low";

dffeas \bdprev_q[1][1] (
	.clk(clk),
	.d(\bdprev_q[1][1]~1_combout ),
	.asdata(bdprev_q_1_2),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_1_1),
	.prn(vcc));
defparam \bdprev_q[1][1] .is_wysiwyg = "true";
defparam \bdprev_q[1][1] .power_up = "low";

dffeas \bdprev_q[3][1] (
	.clk(clk),
	.d(\bdprev_q[3][1]~2_combout ),
	.asdata(bdprev_q_1_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_1_3),
	.prn(vcc));
defparam \bdprev_q[3][1] .is_wysiwyg = "true";
defparam \bdprev_q[3][1] .power_up = "low";

dffeas \bdprev_q[2][1] (
	.clk(clk),
	.d(\bdprev_q[2][1]~0_combout ),
	.asdata(bdprev_q_1_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_1_2),
	.prn(vcc));
defparam \bdprev_q[2][1] .is_wysiwyg = "true";
defparam \bdprev_q[2][1] .power_up = "low";

dffeas \bdprev_q[4][1] (
	.clk(clk),
	.d(\bdprev_q[4][1]~3_combout ),
	.asdata(bdprev_q_1_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_1_4),
	.prn(vcc));
defparam \bdprev_q[4][1] .is_wysiwyg = "true";
defparam \bdprev_q[4][1] .power_up = "low";

dffeas \bdprev_q[3][3] (
	.clk(clk),
	.d(\bdprev_q[3][3]~9_combout ),
	.asdata(bdprev_q_3_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_3_3),
	.prn(vcc));
defparam \bdprev_q[3][3] .is_wysiwyg = "true";
defparam \bdprev_q[3][3] .power_up = "low";

dffeas \bdprev_q[2][3] (
	.clk(clk),
	.d(\bdprev_q[2][3]~7_combout ),
	.asdata(bdprev_q_3_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_3_2),
	.prn(vcc));
defparam \bdprev_q[2][3] .is_wysiwyg = "true";
defparam \bdprev_q[2][3] .power_up = "low";

dffeas \bdprev_q[4][3] (
	.clk(clk),
	.d(\bdprev_q[4][3]~8_combout ),
	.asdata(bdprev_q_3_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_3_4),
	.prn(vcc));
defparam \bdprev_q[4][3] .is_wysiwyg = "true";
defparam \bdprev_q[4][3] .power_up = "low";

dffeas \bdprev_q[3][4] (
	.clk(clk),
	.d(\bdprev_q[3][4]~12_combout ),
	.asdata(bdprev_q_4_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_4_3),
	.prn(vcc));
defparam \bdprev_q[3][4] .is_wysiwyg = "true";
defparam \bdprev_q[3][4] .power_up = "low";

dffeas \bdprev_q[2][4] (
	.clk(clk),
	.d(\bdprev_q[2][4]~10_combout ),
	.asdata(bdprev_q_4_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_4_2),
	.prn(vcc));
defparam \bdprev_q[2][4] .is_wysiwyg = "true";
defparam \bdprev_q[2][4] .power_up = "low";

dffeas \bdprev_q[4][4] (
	.clk(clk),
	.d(\bdprev_q[4][4]~11_combout ),
	.asdata(bdprev_q_4_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_4_4),
	.prn(vcc));
defparam \bdprev_q[4][4] .is_wysiwyg = "true";
defparam \bdprev_q[4][4] .power_up = "low";

dffeas \bdprev_q[3][5] (
	.clk(clk),
	.d(\bdprev_q[3][5]~15_combout ),
	.asdata(bdprev_q_5_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_5_3),
	.prn(vcc));
defparam \bdprev_q[3][5] .is_wysiwyg = "true";
defparam \bdprev_q[3][5] .power_up = "low";

dffeas \bdprev_q[2][5] (
	.clk(clk),
	.d(\bdprev_q[2][5]~13_combout ),
	.asdata(bdprev_q_5_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_5_2),
	.prn(vcc));
defparam \bdprev_q[2][5] .is_wysiwyg = "true";
defparam \bdprev_q[2][5] .power_up = "low";

dffeas \bdprev_q[4][5] (
	.clk(clk),
	.d(\bdprev_q[4][5]~14_combout ),
	.asdata(bdprev_q_5_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_5_4),
	.prn(vcc));
defparam \bdprev_q[4][5] .is_wysiwyg = "true";
defparam \bdprev_q[4][5] .power_up = "low";

dffeas \bdprev_q[3][6] (
	.clk(clk),
	.d(\bdprev_q[3][6]~18_combout ),
	.asdata(bdprev_q_6_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_6_3),
	.prn(vcc));
defparam \bdprev_q[3][6] .is_wysiwyg = "true";
defparam \bdprev_q[3][6] .power_up = "low";

dffeas \bdprev_q[2][6] (
	.clk(clk),
	.d(\bdprev_q[2][6]~16_combout ),
	.asdata(bdprev_q_6_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_6_2),
	.prn(vcc));
defparam \bdprev_q[2][6] .is_wysiwyg = "true";
defparam \bdprev_q[2][6] .power_up = "low";

dffeas \bdprev_q[4][6] (
	.clk(clk),
	.d(\bdprev_q[4][6]~17_combout ),
	.asdata(bdprev_q_6_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_6_4),
	.prn(vcc));
defparam \bdprev_q[4][6] .is_wysiwyg = "true";
defparam \bdprev_q[4][6] .power_up = "low";

dffeas \bdprev_q[3][7] (
	.clk(clk),
	.d(\bdprev_q[3][7]~21_combout ),
	.asdata(bdprev_q_7_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_7_3),
	.prn(vcc));
defparam \bdprev_q[3][7] .is_wysiwyg = "true";
defparam \bdprev_q[3][7] .power_up = "low";

dffeas \bdprev_q[2][7] (
	.clk(clk),
	.d(\bdprev_q[2][7]~19_combout ),
	.asdata(bdprev_q_7_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_7_2),
	.prn(vcc));
defparam \bdprev_q[2][7] .is_wysiwyg = "true";
defparam \bdprev_q[2][7] .power_up = "low";

dffeas \bdprev_q[4][7] (
	.clk(clk),
	.d(\bdprev_q[4][7]~20_combout ),
	.asdata(bdprev_q_7_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_7_4),
	.prn(vcc));
defparam \bdprev_q[4][7] .is_wysiwyg = "true";
defparam \bdprev_q[4][7] .power_up = "low";

dffeas \bdprev_q[3][8] (
	.clk(clk),
	.d(\bdprev_q[3][8]~24_combout ),
	.asdata(bdprev_q_8_4),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_8_3),
	.prn(vcc));
defparam \bdprev_q[3][8] .is_wysiwyg = "true";
defparam \bdprev_q[3][8] .power_up = "low";

dffeas \bdprev_q[2][8] (
	.clk(clk),
	.d(\bdprev_q[2][8]~22_combout ),
	.asdata(bdprev_q_8_3),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_8_2),
	.prn(vcc));
defparam \bdprev_q[2][8] .is_wysiwyg = "true";
defparam \bdprev_q[2][8] .power_up = "low";

dffeas \bdprev_q[4][8] (
	.clk(clk),
	.d(\bdprev_q[4][8]~23_combout ),
	.asdata(bdprev_q_8_1),
	.clrn(!reset),
	.aload(gnd),
	.sclr(\bms_clear~5_combout ),
	.sload(\state.S12~q ),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_8_4),
	.prn(vcc));
defparam \bdprev_q[4][8] .is_wysiwyg = "true";
defparam \bdprev_q[4][8] .power_up = "low";

dffeas \state.S98 (
	.clk(clk),
	.d(\Selector5~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(stateS98),
	.prn(vcc));
defparam \state.S98 .is_wysiwyg = "true";
defparam \state.S98 .power_up = "low";

dffeas \bdprev_q[1][2] (
	.clk(clk),
	.d(\bdprev_d[1][2]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_2_1),
	.prn(vcc));
defparam \bdprev_q[1][2] .is_wysiwyg = "true";
defparam \bdprev_q[1][2] .power_up = "low";

dffeas \bdprev_q[1][3] (
	.clk(clk),
	.d(\bdprev_d[1][3]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_3_1),
	.prn(vcc));
defparam \bdprev_q[1][3] .is_wysiwyg = "true";
defparam \bdprev_q[1][3] .power_up = "low";

dffeas \bdprev_q[1][4] (
	.clk(clk),
	.d(\bdprev_d[1][4]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_4_1),
	.prn(vcc));
defparam \bdprev_q[1][4] .is_wysiwyg = "true";
defparam \bdprev_q[1][4] .power_up = "low";

dffeas \bdprev_q[1][5] (
	.clk(clk),
	.d(\bdprev_d[1][5]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_5_1),
	.prn(vcc));
defparam \bdprev_q[1][5] .is_wysiwyg = "true";
defparam \bdprev_q[1][5] .power_up = "low";

dffeas \bdprev_q[1][6] (
	.clk(clk),
	.d(\bdprev_d[1][6]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_6_1),
	.prn(vcc));
defparam \bdprev_q[1][6] .is_wysiwyg = "true";
defparam \bdprev_q[1][6] .power_up = "low";

dffeas \bdprev_q[1][7] (
	.clk(clk),
	.d(\bdprev_d[1][7]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_7_1),
	.prn(vcc));
defparam \bdprev_q[1][7] .is_wysiwyg = "true";
defparam \bdprev_q[1][7] .power_up = "low";

dffeas \bdprev_q[1][8] (
	.clk(clk),
	.d(\bdprev_d[1][8]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bdprev~1_combout ),
	.q(bdprev_q_8_1),
	.prn(vcc));
defparam \bdprev_q[1][8] .is_wysiwyg = "true";
defparam \bdprev_q[1][8] .power_up = "low";

dffeas \llnum_q[2] (
	.clk(clk),
	.d(\llnum_d[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\llnum~0_combout ),
	.q(llnum_q_2),
	.prn(vcc));
defparam \llnum_q[2] .is_wysiwyg = "true";
defparam \llnum_q[2] .power_up = "low";

dffeas \llnum_q[1] (
	.clk(clk),
	.d(\llnum_d[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\llnum~0_combout ),
	.q(llnum_q_1),
	.prn(vcc));
defparam \llnum_q[1] .is_wysiwyg = "true";
defparam \llnum_q[1] .power_up = "low";

dffeas \llnum_q[4] (
	.clk(clk),
	.d(\llnum_d[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\llnum~0_combout ),
	.q(llnum_q_4),
	.prn(vcc));
defparam \llnum_q[4] .is_wysiwyg = "true";
defparam \llnum_q[4] .power_up = "low";

dffeas \llnum_q[3] (
	.clk(clk),
	.d(\llnum_d[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\llnum~0_combout ),
	.q(llnum_q_3),
	.prn(vcc));
defparam \llnum_q[3] .is_wysiwyg = "true";
defparam \llnum_q[3] .power_up = "low";

dffeas \bd_q[1][2] (
	.clk(clk),
	.d(\bd_d[1][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_2_1),
	.prn(vcc));
defparam \bd_q[1][2] .is_wysiwyg = "true";
defparam \bd_q[1][2] .power_up = "low";

dffeas \bd_q[3][2] (
	.clk(clk),
	.d(\bd_d[3][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_2_3),
	.prn(vcc));
defparam \bd_q[3][2] .is_wysiwyg = "true";
defparam \bd_q[3][2] .power_up = "low";

dffeas \bd_q[2][2] (
	.clk(clk),
	.d(\bd_d[2][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_2_2),
	.prn(vcc));
defparam \bd_q[2][2] .is_wysiwyg = "true";
defparam \bd_q[2][2] .power_up = "low";

dffeas \bd_q[4][2] (
	.clk(clk),
	.d(\bd_d[4][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_2_4),
	.prn(vcc));
defparam \bd_q[4][2] .is_wysiwyg = "true";
defparam \bd_q[4][2] .power_up = "low";

dffeas \bd_q[1][1] (
	.clk(clk),
	.d(\bd_d[1][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_1_1),
	.prn(vcc));
defparam \bd_q[1][1] .is_wysiwyg = "true";
defparam \bd_q[1][1] .power_up = "low";

dffeas \bd_q[3][1] (
	.clk(clk),
	.d(\bd_d[3][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_1_3),
	.prn(vcc));
defparam \bd_q[3][1] .is_wysiwyg = "true";
defparam \bd_q[3][1] .power_up = "low";

dffeas \bd_q[2][1] (
	.clk(clk),
	.d(\bd_d[2][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_1_2),
	.prn(vcc));
defparam \bd_q[2][1] .is_wysiwyg = "true";
defparam \bd_q[2][1] .power_up = "low";

dffeas \bd_q[4][1] (
	.clk(clk),
	.d(\bd_d[4][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_1_4),
	.prn(vcc));
defparam \bd_q[4][1] .is_wysiwyg = "true";
defparam \bd_q[4][1] .power_up = "low";

dffeas \bd_q[1][3] (
	.clk(clk),
	.d(\bd_d[1][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_3_1),
	.prn(vcc));
defparam \bd_q[1][3] .is_wysiwyg = "true";
defparam \bd_q[1][3] .power_up = "low";

dffeas \bd_q[3][3] (
	.clk(clk),
	.d(\bd_d[3][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_3_3),
	.prn(vcc));
defparam \bd_q[3][3] .is_wysiwyg = "true";
defparam \bd_q[3][3] .power_up = "low";

dffeas \bd_q[2][3] (
	.clk(clk),
	.d(\bd_d[2][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_3_2),
	.prn(vcc));
defparam \bd_q[2][3] .is_wysiwyg = "true";
defparam \bd_q[2][3] .power_up = "low";

dffeas \bd_q[4][3] (
	.clk(clk),
	.d(\bd_d[4][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_3_4),
	.prn(vcc));
defparam \bd_q[4][3] .is_wysiwyg = "true";
defparam \bd_q[4][3] .power_up = "low";

dffeas \bd_q[1][4] (
	.clk(clk),
	.d(\bd_d[1][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_4_1),
	.prn(vcc));
defparam \bd_q[1][4] .is_wysiwyg = "true";
defparam \bd_q[1][4] .power_up = "low";

dffeas \bd_q[3][4] (
	.clk(clk),
	.d(\bd_d[3][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_4_3),
	.prn(vcc));
defparam \bd_q[3][4] .is_wysiwyg = "true";
defparam \bd_q[3][4] .power_up = "low";

dffeas \bd_q[2][4] (
	.clk(clk),
	.d(\bd_d[2][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_4_2),
	.prn(vcc));
defparam \bd_q[2][4] .is_wysiwyg = "true";
defparam \bd_q[2][4] .power_up = "low";

dffeas \bd_q[4][4] (
	.clk(clk),
	.d(\bd_d[4][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_4_4),
	.prn(vcc));
defparam \bd_q[4][4] .is_wysiwyg = "true";
defparam \bd_q[4][4] .power_up = "low";

dffeas \bd_q[1][5] (
	.clk(clk),
	.d(\bd_d[1][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_5_1),
	.prn(vcc));
defparam \bd_q[1][5] .is_wysiwyg = "true";
defparam \bd_q[1][5] .power_up = "low";

dffeas \bd_q[3][5] (
	.clk(clk),
	.d(\bd_d[3][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_5_3),
	.prn(vcc));
defparam \bd_q[3][5] .is_wysiwyg = "true";
defparam \bd_q[3][5] .power_up = "low";

dffeas \bd_q[2][5] (
	.clk(clk),
	.d(\bd_d[2][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_5_2),
	.prn(vcc));
defparam \bd_q[2][5] .is_wysiwyg = "true";
defparam \bd_q[2][5] .power_up = "low";

dffeas \bd_q[4][5] (
	.clk(clk),
	.d(\bd_d[4][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_5_4),
	.prn(vcc));
defparam \bd_q[4][5] .is_wysiwyg = "true";
defparam \bd_q[4][5] .power_up = "low";

dffeas \bd_q[1][6] (
	.clk(clk),
	.d(\bd_d[1][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_6_1),
	.prn(vcc));
defparam \bd_q[1][6] .is_wysiwyg = "true";
defparam \bd_q[1][6] .power_up = "low";

dffeas \bd_q[3][6] (
	.clk(clk),
	.d(\bd_d[3][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_6_3),
	.prn(vcc));
defparam \bd_q[3][6] .is_wysiwyg = "true";
defparam \bd_q[3][6] .power_up = "low";

dffeas \bd_q[2][6] (
	.clk(clk),
	.d(\bd_d[2][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_6_2),
	.prn(vcc));
defparam \bd_q[2][6] .is_wysiwyg = "true";
defparam \bd_q[2][6] .power_up = "low";

dffeas \bd_q[4][6] (
	.clk(clk),
	.d(\bd_d[4][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_6_4),
	.prn(vcc));
defparam \bd_q[4][6] .is_wysiwyg = "true";
defparam \bd_q[4][6] .power_up = "low";

dffeas \bd_q[1][7] (
	.clk(clk),
	.d(\bd_d[1][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_7_1),
	.prn(vcc));
defparam \bd_q[1][7] .is_wysiwyg = "true";
defparam \bd_q[1][7] .power_up = "low";

dffeas \bd_q[3][7] (
	.clk(clk),
	.d(\bd_d[3][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_7_3),
	.prn(vcc));
defparam \bd_q[3][7] .is_wysiwyg = "true";
defparam \bd_q[3][7] .power_up = "low";

dffeas \bd_q[2][7] (
	.clk(clk),
	.d(\bd_d[2][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_7_2),
	.prn(vcc));
defparam \bd_q[2][7] .is_wysiwyg = "true";
defparam \bd_q[2][7] .power_up = "low";

dffeas \bd_q[4][7] (
	.clk(clk),
	.d(\bd_d[4][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_7_4),
	.prn(vcc));
defparam \bd_q[4][7] .is_wysiwyg = "true";
defparam \bd_q[4][7] .power_up = "low";

dffeas \bd_q[1][8] (
	.clk(clk),
	.d(\bd_d[1][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~1_combout ),
	.q(bd_q_8_1),
	.prn(vcc));
defparam \bd_q[1][8] .is_wysiwyg = "true";
defparam \bd_q[1][8] .power_up = "low";

dffeas \bd_q[3][8] (
	.clk(clk),
	.d(\bd_d[3][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~3_combout ),
	.q(bd_q_8_3),
	.prn(vcc));
defparam \bd_q[3][8] .is_wysiwyg = "true";
defparam \bd_q[3][8] .power_up = "low";

dffeas \bd_q[2][8] (
	.clk(clk),
	.d(\bd_d[2][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~5_combout ),
	.q(bd_q_8_2),
	.prn(vcc));
defparam \bd_q[2][8] .is_wysiwyg = "true";
defparam \bd_q[2][8] .power_up = "low";

dffeas \bd_q[4][8] (
	.clk(clk),
	.d(\bd_d[4][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\bd~7_combout ),
	.q(bd_q_8_4),
	.prn(vcc));
defparam \bd_q[4][8] .is_wysiwyg = "true";
defparam \bd_q[4][8] .power_up = "low";

cycloneive_lcell_comb \Selector6~0 (
	.dataa(\bms_clear~2_combout ),
	.datab(load_syn_gen),
	.datac(bms_clear1),
	.datad(Selector201),
	.cin(gnd),
	.combout(\Selector6~0_combout ),
	.cout());
defparam \Selector6~0 .lut_mask = 16'hBFFF;
defparam \Selector6~0 .sum_lutc_input = "datac";

dffeas \state.S99 (
	.clk(clk),
	.d(\Selector6~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S99~q ),
	.prn(vcc));
defparam \state.S99 .is_wysiwyg = "true";
defparam \state.S99 .power_up = "low";

cycloneive_lcell_comb \bms_clear~2 (
	.dataa(stateS98),
	.datab(\state.S99~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\bms_clear~2_combout ),
	.cout());
defparam \bms_clear~2 .lut_mask = 16'hEEEE;
defparam \bms_clear~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector1~0 (
	.dataa(\state.S0c~q ),
	.datab(bms_clear2),
	.datac(\bms_clear~2_combout ),
	.datad(Selector201),
	.cin(gnd),
	.combout(\Selector1~0_combout ),
	.cout());
defparam \Selector1~0 .lut_mask = 16'hFEFF;
defparam \Selector1~0 .sum_lutc_input = "datac";

dffeas \state.S0c (
	.clk(clk),
	.d(\Selector1~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S0c~q ),
	.prn(vcc));
defparam \state.S0c .is_wysiwyg = "true";
defparam \state.S0c .power_up = "low";

cycloneive_lcell_comb \Selector0~0 (
	.dataa(\bms_clear~2_combout ),
	.datab(Selector201),
	.datac(\state.S0~q ),
	.datad(bms_clear2),
	.cin(gnd),
	.combout(\Selector0~0_combout ),
	.cout());
defparam \Selector0~0 .lut_mask = 16'hFFF7;
defparam \Selector0~0 .sum_lutc_input = "datac";

dffeas \state.S0 (
	.clk(clk),
	.d(\Selector0~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S0~q ),
	.prn(vcc));
defparam \state.S0 .is_wysiwyg = "true";
defparam \state.S0 .power_up = "low";

cycloneive_lcell_comb \Selector2~0 (
	.dataa(\state.S0c~q ),
	.datab(Selector201),
	.datac(bms_clear2),
	.datad(\state.S0~q ),
	.cin(gnd),
	.combout(\Selector2~0_combout ),
	.cout());
defparam \Selector2~0 .lut_mask = 16'hFEFF;
defparam \Selector2~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector2~1 (
	.dataa(\Selector2~0_combout ),
	.datab(bms_clear2),
	.datac(\bms_clear~2_combout ),
	.datad(Selector201),
	.cin(gnd),
	.combout(\Selector2~1_combout ),
	.cout());
defparam \Selector2~1 .lut_mask = 16'hFFFE;
defparam \Selector2~1 .sum_lutc_input = "datac";

dffeas \state.S1 (
	.clk(clk),
	.d(\Selector2~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S1~q ),
	.prn(vcc));
defparam \state.S1 .is_wysiwyg = "true";
defparam \state.S1 .power_up = "low";

cycloneive_lcell_comb \bms_clear~0 (
	.dataa(\state.S0c~q ),
	.datab(chn_statusload),
	.datac(chn_statusbooked),
	.datad(Selector20),
	.cin(gnd),
	.combout(\bms_clear~0_combout ),
	.cout());
defparam \bms_clear~0 .lut_mask = 16'hFFFE;
defparam \bms_clear~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bms_clear~1 (
	.dataa(load_syn_gen1),
	.datab(sink_eop_q),
	.datac(bms_statusidle),
	.datad(\state.S0~q ),
	.cin(gnd),
	.combout(\bms_clear~1_combout ),
	.cout());
defparam \bms_clear~1 .lut_mask = 16'hEFFF;
defparam \bms_clear~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bms_clear~3 (
	.dataa(\bms_clear~2_combout ),
	.datab(Selector201),
	.datac(load_syn_gen),
	.datad(bms_clear1),
	.cin(gnd),
	.combout(\bms_clear~3_combout ),
	.cout());
defparam \bms_clear~3 .lut_mask = 16'hFFFE;
defparam \bms_clear~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mloop~1 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\mloop[1]~q ),
	.cin(gnd),
	.combout(\mloop~1_combout ),
	.cout());
defparam \mloop~1 .lut_mask = 16'h7FFF;
defparam \mloop~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \cnt_mloop~0 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\state.S8~q ),
	.cin(gnd),
	.combout(\cnt_mloop~0_combout ),
	.cout());
defparam \cnt_mloop~0 .lut_mask = 16'hFFFE;
defparam \cnt_mloop~0 .sum_lutc_input = "datac";

dffeas \mloop[1] (
	.clk(clk),
	.d(\mloop~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_mloop~0_combout ),
	.q(\mloop[1]~q ),
	.prn(vcc));
defparam \mloop[1] .is_wysiwyg = "true";
defparam \mloop[1] .power_up = "low";

cycloneive_lcell_comb \bms_clear~4 (
	.dataa(\bms_clear~1_combout ),
	.datab(bms_clear2),
	.datac(\bms_clear~2_combout ),
	.datad(Selector201),
	.cin(gnd),
	.combout(\bms_clear~4_combout ),
	.cout());
defparam \bms_clear~4 .lut_mask = 16'hFFFE;
defparam \bms_clear~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mloop~0 (
	.dataa(\mloop[1]~q ),
	.datab(\mloop[2]~q ),
	.datac(\bms_clear~0_combout ),
	.datad(\bms_clear~4_combout ),
	.cin(gnd),
	.combout(\mloop~0_combout ),
	.cout());
defparam \mloop~0 .lut_mask = 16'h6FFF;
defparam \mloop~0 .sum_lutc_input = "datac";

dffeas \mloop[2] (
	.clk(clk),
	.d(\mloop~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_mloop~0_combout ),
	.q(\mloop[2]~q ),
	.prn(vcc));
defparam \mloop[2] .is_wysiwyg = "true";
defparam \mloop[2] .power_up = "low";

cycloneive_lcell_comb \Add0~0 (
	.dataa(\mloop[1]~q ),
	.datab(\mloop[2]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\Add0~0_combout ),
	.cout());
defparam \Add0~0 .lut_mask = 16'hEEEE;
defparam \Add0~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mloop~3 (
	.dataa(\mloop[3]~q ),
	.datab(\Add0~0_combout ),
	.datac(\bms_clear~0_combout ),
	.datad(\bms_clear~4_combout ),
	.cin(gnd),
	.combout(\mloop~3_combout ),
	.cout());
defparam \mloop~3 .lut_mask = 16'h6FFF;
defparam \mloop~3 .sum_lutc_input = "datac";

dffeas \mloop[3] (
	.clk(clk),
	.d(\mloop~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_mloop~0_combout ),
	.q(\mloop[3]~q ),
	.prn(vcc));
defparam \mloop[3] .is_wysiwyg = "true";
defparam \mloop[3] .power_up = "low";

cycloneive_lcell_comb \LessThan0~0 (
	.dataa(llnum_q_2),
	.datab(llnum_q_1),
	.datac(\mloop[2]~q ),
	.datad(\mloop[3]~q ),
	.cin(gnd),
	.combout(\LessThan0~0_combout ),
	.cout());
defparam \LessThan0~0 .lut_mask = 16'hEFFF;
defparam \LessThan0~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bms_clear~5 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\bms_clear~5_combout ),
	.cout());
defparam \bms_clear~5 .lut_mask = 16'hFEFE;
defparam \bms_clear~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mloop~2 (
	.dataa(\mloop[4]~q ),
	.datab(\mloop[3]~q ),
	.datac(\Add0~0_combout ),
	.datad(\bms_clear~5_combout ),
	.cin(gnd),
	.combout(\mloop~2_combout ),
	.cout());
defparam \mloop~2 .lut_mask = 16'h96FF;
defparam \mloop~2 .sum_lutc_input = "datac";

dffeas \mloop[4] (
	.clk(clk),
	.d(\mloop~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_mloop~0_combout ),
	.q(\mloop[4]~q ),
	.prn(vcc));
defparam \mloop[4] .is_wysiwyg = "true";
defparam \mloop[4] .power_up = "low";

cycloneive_lcell_comb \LessThan0~1 (
	.dataa(llnum_q_4),
	.datab(llnum_q_3),
	.datac(\LessThan0~0_combout ),
	.datad(\mloop[4]~q ),
	.cin(gnd),
	.combout(\LessThan0~1_combout ),
	.cout());
defparam \LessThan0~1 .lut_mask = 16'hFEFF;
defparam \LessThan0~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \next_state.S10~0 (
	.dataa(\mloop[4]~q ),
	.datab(\mloop[1]~q ),
	.datac(\mloop[2]~q ),
	.datad(\mloop[3]~q ),
	.cin(gnd),
	.combout(\next_state.S10~0_combout ),
	.cout());
defparam \next_state.S10~0 .lut_mask = 16'hBFFF;
defparam \next_state.S10~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \next_state.S2a~0 (
	.dataa(\next_state.S10~0_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\next_state.S2a~0_combout ),
	.cout());
defparam \next_state.S2a~0 .lut_mask = 16'hFF55;
defparam \next_state.S2a~0 .sum_lutc_input = "datac";

dffeas \state.S2a (
	.clk(clk),
	.d(\next_state.S2a~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S2a~q ),
	.prn(vcc));
defparam \state.S2a .is_wysiwyg = "true";
defparam \state.S2a .power_up = "low";

dffeas \state.S3 (
	.clk(clk),
	.d(\state.S2a~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S3~q ),
	.prn(vcc));
defparam \state.S3 .is_wysiwyg = "true";
defparam \state.S3 .power_up = "low";

dffeas \mulout_q[4][8] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[8]~25_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][8]~q ),
	.prn(vcc));
defparam \mulout_q[4][8] .is_wysiwyg = "true";
defparam \mulout_q[4][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[8][8]~9 (
	.dataa(\synreg_q[1][8]~q ),
	.datab(syn_8_8),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[8][8]~9_combout ),
	.cout());
defparam \synreg_d[8][8]~9 .lut_mask = 16'hAACC;
defparam \synreg_d[8][8]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_2~0 (
	.dataa(load_syn_gen),
	.datab(\state.S3~q ),
	.datac(sink_eop_q),
	.datad(bms_clear),
	.cin(gnd),
	.combout(\synreg_2~0_combout ),
	.cout());
defparam \synreg_2~0 .lut_mask = 16'hFEFF;
defparam \synreg_2~0 .sum_lutc_input = "datac";

dffeas \synreg_q[8][8] (
	.clk(clk),
	.d(\synreg_d[8][8]~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][8]~q ),
	.prn(vcc));
defparam \synreg_q[8][8] .is_wysiwyg = "true";
defparam \synreg_q[8][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][8]~43 (
	.dataa(\synreg_q[8][8]~q ),
	.datab(syn_8_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][8]~43_combout ),
	.cout());
defparam \synreg_d[7][8]~43 .lut_mask = 16'hAACC;
defparam \synreg_d[7][8]~43 .sum_lutc_input = "datac";

dffeas \synreg_q[7][8] (
	.clk(clk),
	.d(\synreg_d[7][8]~43_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][8]~q ),
	.prn(vcc));
defparam \synreg_q[7][8] .is_wysiwyg = "true";
defparam \synreg_q[7][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][8]~21 (
	.dataa(\synreg_q[7][8]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_8),
	.datad(synin3),
	.cin(gnd),
	.combout(\synreg_d[6][8]~21_combout ),
	.cout());
defparam \synreg_d[6][8]~21 .lut_mask = 16'hEBBE;
defparam \synreg_d[6][8]~21 .sum_lutc_input = "datac";

dffeas \synreg_q[6][8] (
	.clk(clk),
	.d(\synreg_d[6][8]~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][8]~q ),
	.prn(vcc));
defparam \synreg_q[6][8] .is_wysiwyg = "true";
defparam \synreg_q[6][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][8]~67 (
	.dataa(\synreg_q[6][8]~q ),
	.datab(syn_8_5),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[5][8]~67_combout ),
	.cout());
defparam \synreg_d[5][8]~67 .lut_mask = 16'hAACC;
defparam \synreg_d[5][8]~67 .sum_lutc_input = "datac";

dffeas \synreg_q[5][8] (
	.clk(clk),
	.d(\synreg_d[5][8]~67_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][8]~q ),
	.prn(vcc));
defparam \synreg_q[5][8] .is_wysiwyg = "true";
defparam \synreg_q[5][8] .power_up = "low";

dffeas \state.S11 (
	.clk(clk),
	.d(\state.S10~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S11~q ),
	.prn(vcc));
defparam \state.S11 .is_wysiwyg = "true";
defparam \state.S11 .power_up = "low";

cycloneive_lcell_comb \omegaloop~0 (
	.dataa(\omegaloop[1]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\omegaloop~0_combout ),
	.cout());
defparam \omegaloop~0 .lut_mask = 16'h7FFF;
defparam \omegaloop~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \cnt_omegaloop~0 (
	.dataa(\state.S12~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\cnt_omegaloop~0_combout ),
	.cout());
defparam \cnt_omegaloop~0 .lut_mask = 16'hFFFE;
defparam \cnt_omegaloop~0 .sum_lutc_input = "datac";

dffeas \omegaloop[1] (
	.clk(clk),
	.d(\omegaloop~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omegaloop[1]~q ),
	.prn(vcc));
defparam \omegaloop[1] .is_wysiwyg = "true";
defparam \omegaloop[1] .power_up = "low";

cycloneive_lcell_comb \omegaloop~1 (
	.dataa(\omegaloop[1]~q ),
	.datab(\omegaloop[2]~q ),
	.datac(\bms_clear~0_combout ),
	.datad(\bms_clear~4_combout ),
	.cin(gnd),
	.combout(\omegaloop~1_combout ),
	.cout());
defparam \omegaloop~1 .lut_mask = 16'h6FFF;
defparam \omegaloop~1 .sum_lutc_input = "datac";

dffeas \omegaloop[2] (
	.clk(clk),
	.d(\omegaloop~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omegaloop[2]~q ),
	.prn(vcc));
defparam \omegaloop[2] .is_wysiwyg = "true";
defparam \omegaloop[2] .power_up = "low";

cycloneive_lcell_comb \omegaloop~3 (
	.dataa(\omegaloop[3]~q ),
	.datab(\omegaloop[1]~q ),
	.datac(\omegaloop[2]~q ),
	.datad(\bms_clear~5_combout ),
	.cin(gnd),
	.combout(\omegaloop~3_combout ),
	.cout());
defparam \omegaloop~3 .lut_mask = 16'h96FF;
defparam \omegaloop~3 .sum_lutc_input = "datac";

dffeas \omegaloop[3] (
	.clk(clk),
	.d(\omegaloop~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omegaloop[3]~q ),
	.prn(vcc));
defparam \omegaloop[3] .is_wysiwyg = "true";
defparam \omegaloop[3] .power_up = "low";

cycloneive_lcell_comb \Add3~0 (
	.dataa(\omegaloop[4]~q ),
	.datab(\omegaloop[1]~q ),
	.datac(\omegaloop[2]~q ),
	.datad(\omegaloop[3]~q ),
	.cin(gnd),
	.combout(\Add3~0_combout ),
	.cout());
defparam \Add3~0 .lut_mask = 16'h6996;
defparam \Add3~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omegaloop~2 (
	.dataa(\Add3~0_combout ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\omegaloop~2_combout ),
	.cout());
defparam \omegaloop~2 .lut_mask = 16'hBFFF;
defparam \omegaloop~2 .sum_lutc_input = "datac";

dffeas \omegaloop[4] (
	.clk(clk),
	.d(\omegaloop~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omegaloop[4]~q ),
	.prn(vcc));
defparam \omegaloop[4] .is_wysiwyg = "true";
defparam \omegaloop[4] .power_up = "low";

cycloneive_lcell_comb \Selector5~0 (
	.dataa(\omegaloop[1]~q ),
	.datab(\omegaloop[2]~q ),
	.datac(\omegaloop[4]~q ),
	.datad(\omegaloop[3]~q ),
	.cin(gnd),
	.combout(\Selector5~0_combout ),
	.cout());
defparam \Selector5~0 .lut_mask = 16'hEFFF;
defparam \Selector5~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector4~0 (
	.dataa(\state.S11~q ),
	.datab(\state.S12~q ),
	.datac(gnd),
	.datad(\Selector5~0_combout ),
	.cin(gnd),
	.combout(\Selector4~0_combout ),
	.cout());
defparam \Selector4~0 .lut_mask = 16'hEEFF;
defparam \Selector4~0 .sum_lutc_input = "datac";

dffeas \state.S12 (
	.clk(clk),
	.d(\Selector4~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S12~q ),
	.prn(vcc));
defparam \state.S12 .is_wysiwyg = "true";
defparam \state.S12 .power_up = "low";

cycloneive_lcell_comb \WideOr7~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\state.S12~q ),
	.datad(\state.S11~q ),
	.cin(gnd),
	.combout(\WideOr7~0_combout ),
	.cout());
defparam \WideOr7~0 .lut_mask = 16'h0FFF;
defparam \WideOr7~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][8]~65 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[5][8]~q ),
	.datac(\synreg_q[3][8]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[4][8]~65_combout ),
	.cout());
defparam \synreg_d[4][8]~65 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][8]~65 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][8]~66 (
	.dataa(\synreg_d[4][8]~65_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_8_4),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][8]~66_combout ),
	.cout());
defparam \synreg_d[4][8]~66 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][8]~66 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_2~1 (
	.dataa(load_syn_gen),
	.datab(bms_clear1),
	.datac(\state.S3~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_2~1_combout ),
	.cout());
defparam \synreg_2~1 .lut_mask = 16'hFEFF;
defparam \synreg_2~1 .sum_lutc_input = "datac";

dffeas \synreg_q[4][8] (
	.clk(clk),
	.d(\synreg_d[4][8]~66_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][8]~q ),
	.prn(vcc));
defparam \synreg_q[4][8] .is_wysiwyg = "true";
defparam \synreg_q[4][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][8]~19 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[4][8]~q ),
	.datac(\synreg_q[2][8]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[3][8]~19_combout ),
	.cout());
defparam \synreg_d[3][8]~19 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][8]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[3][8]~20 (
	.dataa(\synreg_d[3][8]~19_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_8_3),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][8]~20_combout ),
	.cout());
defparam \synreg_d[3][8]~20 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][8]~20 .sum_lutc_input = "datac";

dffeas \synreg_q[3][8] (
	.clk(clk),
	.d(\synreg_d[3][8]~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][8]~q ),
	.prn(vcc));
defparam \synreg_q[3][8] .is_wysiwyg = "true";
defparam \synreg_q[3][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][8]~41 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][8]~q ),
	.datac(\synreg_q[1][8]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][8]~41_combout ),
	.cout());
defparam \synreg_d[2][8]~41 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][8]~41 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][8]~42 (
	.dataa(\synreg_d[2][8]~41_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_8_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][8]~42_combout ),
	.cout());
defparam \synreg_d[2][8]~42 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][8]~42 .sum_lutc_input = "datac";

dffeas \synreg_q[2][8] (
	.clk(clk),
	.d(\synreg_d[2][8]~42_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][8]~q ),
	.prn(vcc));
defparam \synreg_q[2][8] .is_wysiwyg = "true";
defparam \synreg_q[2][8] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][8]~0 (
	.dataa(\synreg_q[2][8]~q ),
	.datab(syn_8_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][8]~0_combout ),
	.cout());
defparam \synreg_d[1][8]~0 .lut_mask = 16'hAACC;
defparam \synreg_d[1][8]~0 .sum_lutc_input = "datac";

dffeas \synreg_q[1][8] (
	.clk(clk),
	.d(\synreg_d[1][8]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][8]~q ),
	.prn(vcc));
defparam \synreg_q[1][8] .is_wysiwyg = "true";
defparam \synreg_q[1][8] .power_up = "low";

dffeas \mulout_q[1][8] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[8]~28_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][8]~q ),
	.prn(vcc));
defparam \mulout_q[1][8] .is_wysiwyg = "true";
defparam \mulout_q[1][8] .power_up = "low";

dffeas \mulout_q[2][8] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[8]~28_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][8]~q ),
	.prn(vcc));
defparam \mulout_q[2][8] .is_wysiwyg = "true";
defparam \mulout_q[2][8] .power_up = "low";

dffeas \mulout_q[3][8] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[8]~28_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][8]~q ),
	.prn(vcc));
defparam \mulout_q[3][8] .is_wysiwyg = "true";
defparam \mulout_q[3][8] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][8]~0 (
	.dataa(\synreg_q[1][8]~q ),
	.datab(\mulout_q[1][8]~q ),
	.datac(\mulout_q[2][8]~q ),
	.datad(\mulout_q[3][8]~q ),
	.cin(gnd),
	.combout(\mulsum[4][8]~0_combout ),
	.cout());
defparam \mulsum[4][8]~0 .lut_mask = 16'h6996;
defparam \mulsum[4][8]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][8] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][8]~q ),
	.datad(\mulsum[4][8]~0_combout ),
	.cin(gnd),
	.combout(\mulsum[4][8]~combout ),
	.cout());
defparam \mulsum[4][8] .lut_mask = 16'h0FF0;
defparam \mulsum[4][8] .sum_lutc_input = "datac";

dffeas \delta_q[8] (
	.clk(clk),
	.d(\mulsum[4][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[8]~q ),
	.prn(vcc));
defparam \delta_q[8] .is_wysiwyg = "true";
defparam \delta_q[8] .power_up = "low";

dffeas \mulout_q[4][7] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[7]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][7]~q ),
	.prn(vcc));
defparam \mulout_q[4][7] .is_wysiwyg = "true";
defparam \mulout_q[4][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[8][7]~8 (
	.dataa(\synreg_q[1][7]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_7),
	.datad(synin),
	.cin(gnd),
	.combout(\synreg_d[8][7]~8_combout ),
	.cout());
defparam \synreg_d[8][7]~8 .lut_mask = 16'hEBBE;
defparam \synreg_d[8][7]~8 .sum_lutc_input = "datac";

dffeas \synreg_q[8][7] (
	.clk(clk),
	.d(\synreg_d[8][7]~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][7]~q ),
	.prn(vcc));
defparam \synreg_q[8][7] .is_wysiwyg = "true";
defparam \synreg_q[8][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][7]~40 (
	.dataa(\synreg_q[8][7]~q ),
	.datab(syn_7_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][7]~40_combout ),
	.cout());
defparam \synreg_d[7][7]~40 .lut_mask = 16'hAACC;
defparam \synreg_d[7][7]~40 .sum_lutc_input = "datac";

dffeas \synreg_q[7][7] (
	.clk(clk),
	.d(\synreg_d[7][7]~40_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][7]~q ),
	.prn(vcc));
defparam \synreg_q[7][7] .is_wysiwyg = "true";
defparam \synreg_q[7][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][7]~18 (
	.dataa(\synreg_q[7][7]~q ),
	.datab(syn_7_6),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[6][7]~18_combout ),
	.cout());
defparam \synreg_d[6][7]~18 .lut_mask = 16'hAACC;
defparam \synreg_d[6][7]~18 .sum_lutc_input = "datac";

dffeas \synreg_q[6][7] (
	.clk(clk),
	.d(\synreg_d[6][7]~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][7]~q ),
	.prn(vcc));
defparam \synreg_q[6][7] .is_wysiwyg = "true";
defparam \synreg_q[6][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][7]~64 (
	.dataa(\synreg_q[6][7]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_7),
	.datad(synin6),
	.cin(gnd),
	.combout(\synreg_d[5][7]~64_combout ),
	.cout());
defparam \synreg_d[5][7]~64 .lut_mask = 16'hEBBE;
defparam \synreg_d[5][7]~64 .sum_lutc_input = "datac";

dffeas \synreg_q[5][7] (
	.clk(clk),
	.d(\synreg_d[5][7]~64_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][7]~q ),
	.prn(vcc));
defparam \synreg_q[5][7] .is_wysiwyg = "true";
defparam \synreg_q[5][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][7]~62 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[5][7]~q ),
	.datac(\synreg_q[3][7]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[4][7]~62_combout ),
	.cout());
defparam \synreg_d[4][7]~62 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][7]~62 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][7]~63 (
	.dataa(\synreg_d[4][7]~62_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_7_4),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][7]~63_combout ),
	.cout());
defparam \synreg_d[4][7]~63 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][7]~63 .sum_lutc_input = "datac";

dffeas \synreg_q[4][7] (
	.clk(clk),
	.d(\synreg_d[4][7]~63_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][7]~q ),
	.prn(vcc));
defparam \synreg_q[4][7] .is_wysiwyg = "true";
defparam \synreg_q[4][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][7]~16 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[4][7]~q ),
	.datac(\synreg_q[2][7]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[3][7]~16_combout ),
	.cout());
defparam \synreg_d[3][7]~16 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][7]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[3][7]~17 (
	.dataa(\synreg_d[3][7]~16_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_7_3),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][7]~17_combout ),
	.cout());
defparam \synreg_d[3][7]~17 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][7]~17 .sum_lutc_input = "datac";

dffeas \synreg_q[3][7] (
	.clk(clk),
	.d(\synreg_d[3][7]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][7]~q ),
	.prn(vcc));
defparam \synreg_q[3][7] .is_wysiwyg = "true";
defparam \synreg_q[3][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][7]~38 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][7]~q ),
	.datac(\synreg_q[1][7]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][7]~38_combout ),
	.cout());
defparam \synreg_d[2][7]~38 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][7]~38 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][7]~39 (
	.dataa(\synreg_d[2][7]~38_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_7_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][7]~39_combout ),
	.cout());
defparam \synreg_d[2][7]~39 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][7]~39 .sum_lutc_input = "datac";

dffeas \synreg_q[2][7] (
	.clk(clk),
	.d(\synreg_d[2][7]~39_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][7]~q ),
	.prn(vcc));
defparam \synreg_q[2][7] .is_wysiwyg = "true";
defparam \synreg_q[2][7] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][7]~1 (
	.dataa(\synreg_q[2][7]~q ),
	.datab(syn_7_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][7]~1_combout ),
	.cout());
defparam \synreg_d[1][7]~1 .lut_mask = 16'hAACC;
defparam \synreg_d[1][7]~1 .sum_lutc_input = "datac";

dffeas \synreg_q[1][7] (
	.clk(clk),
	.d(\synreg_d[1][7]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][7]~q ),
	.prn(vcc));
defparam \synreg_q[1][7] .is_wysiwyg = "true";
defparam \synreg_q[1][7] .power_up = "low";

dffeas \mulout_q[1][7] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[7]~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][7]~q ),
	.prn(vcc));
defparam \mulout_q[1][7] .is_wysiwyg = "true";
defparam \mulout_q[1][7] .power_up = "low";

dffeas \mulout_q[2][7] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[7]~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][7]~q ),
	.prn(vcc));
defparam \mulout_q[2][7] .is_wysiwyg = "true";
defparam \mulout_q[2][7] .power_up = "low";

dffeas \mulout_q[3][7] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[7]~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][7]~q ),
	.prn(vcc));
defparam \mulout_q[3][7] .is_wysiwyg = "true";
defparam \mulout_q[3][7] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][7]~1 (
	.dataa(\synreg_q[1][7]~q ),
	.datab(\mulout_q[1][7]~q ),
	.datac(\mulout_q[2][7]~q ),
	.datad(\mulout_q[3][7]~q ),
	.cin(gnd),
	.combout(\mulsum[4][7]~1_combout ),
	.cout());
defparam \mulsum[4][7]~1 .lut_mask = 16'h6996;
defparam \mulsum[4][7]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][7] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][7]~q ),
	.datad(\mulsum[4][7]~1_combout ),
	.cin(gnd),
	.combout(\mulsum[4][7]~combout ),
	.cout());
defparam \mulsum[4][7] .lut_mask = 16'h0FF0;
defparam \mulsum[4][7] .sum_lutc_input = "datac";

dffeas \delta_q[7] (
	.clk(clk),
	.d(\mulsum[4][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[7]~q ),
	.prn(vcc));
defparam \delta_q[7] .is_wysiwyg = "true";
defparam \delta_q[7] .power_up = "low";

dffeas \mulout_q[4][6] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[6]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][6]~q ),
	.prn(vcc));
defparam \mulout_q[4][6] .is_wysiwyg = "true";
defparam \mulout_q[4][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][6]~68 (
	.dataa(\synreg_q[3][6]~q ),
	.datab(syn_6_4),
	.datac(\WideOr7~0_combout ),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][6]~68_combout ),
	.cout());
defparam \synreg_d[4][6]~68 .lut_mask = 16'hACFF;
defparam \synreg_d[4][6]~68 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[8][6]~10 (
	.dataa(\synreg_q[1][6]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_6),
	.datad(synin1),
	.cin(gnd),
	.combout(\synreg_d[8][6]~10_combout ),
	.cout());
defparam \synreg_d[8][6]~10 .lut_mask = 16'hEBBE;
defparam \synreg_d[8][6]~10 .sum_lutc_input = "datac";

dffeas \synreg_q[8][6] (
	.clk(clk),
	.d(\synreg_d[8][6]~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][6]~q ),
	.prn(vcc));
defparam \synreg_q[8][6] .is_wysiwyg = "true";
defparam \synreg_q[8][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][6]~46 (
	.dataa(\synreg_q[8][6]~q ),
	.datab(syn_6_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][6]~46_combout ),
	.cout());
defparam \synreg_d[7][6]~46 .lut_mask = 16'hAACC;
defparam \synreg_d[7][6]~46 .sum_lutc_input = "datac";

dffeas \synreg_q[7][6] (
	.clk(clk),
	.d(\synreg_d[7][6]~46_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][6]~q ),
	.prn(vcc));
defparam \synreg_q[7][6] .is_wysiwyg = "true";
defparam \synreg_q[7][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][6]~24 (
	.dataa(\synreg_q[7][6]~q ),
	.datab(syn_6_6),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[6][6]~24_combout ),
	.cout());
defparam \synreg_d[6][6]~24 .lut_mask = 16'hAACC;
defparam \synreg_d[6][6]~24 .sum_lutc_input = "datac";

dffeas \synreg_q[6][6] (
	.clk(clk),
	.d(\synreg_d[6][6]~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][6]~q ),
	.prn(vcc));
defparam \synreg_q[6][6] .is_wysiwyg = "true";
defparam \synreg_q[6][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][6]~69 (
	.dataa(\synreg_q[6][6]~q ),
	.datab(syn_6_5),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[5][6]~69_combout ),
	.cout());
defparam \synreg_d[5][6]~69 .lut_mask = 16'hAACC;
defparam \synreg_d[5][6]~69 .sum_lutc_input = "datac";

dffeas \synreg_q[5][6] (
	.clk(clk),
	.d(\synreg_d[5][6]~69_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][6]~q ),
	.prn(vcc));
defparam \synreg_q[5][6] .is_wysiwyg = "true";
defparam \synreg_q[5][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][6] (
	.dataa(\synreg_d[4][6]~68_combout ),
	.datab(\state.S3~q ),
	.datac(\synreg_q[5][6]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\synreg_d[4][6]~combout ),
	.cout());
defparam \synreg_d[4][6] .lut_mask = 16'hFEFE;
defparam \synreg_d[4][6] .sum_lutc_input = "datac";

dffeas \synreg_q[4][6] (
	.clk(clk),
	.d(\synreg_d[4][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][6]~q ),
	.prn(vcc));
defparam \synreg_q[4][6] .is_wysiwyg = "true";
defparam \synreg_q[4][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][6]~22 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[4][6]~q ),
	.datac(\synreg_q[2][6]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[3][6]~22_combout ),
	.cout());
defparam \synreg_d[3][6]~22 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][6]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[3][6]~23 (
	.dataa(\synreg_d[3][6]~22_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_6_3),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][6]~23_combout ),
	.cout());
defparam \synreg_d[3][6]~23 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][6]~23 .sum_lutc_input = "datac";

dffeas \synreg_q[3][6] (
	.clk(clk),
	.d(\synreg_d[3][6]~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][6]~q ),
	.prn(vcc));
defparam \synreg_q[3][6] .is_wysiwyg = "true";
defparam \synreg_q[3][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][6]~44 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][6]~q ),
	.datac(\synreg_q[1][6]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][6]~44_combout ),
	.cout());
defparam \synreg_d[2][6]~44 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][6]~44 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][6]~45 (
	.dataa(\synreg_d[2][6]~44_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_6_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][6]~45_combout ),
	.cout());
defparam \synreg_d[2][6]~45 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][6]~45 .sum_lutc_input = "datac";

dffeas \synreg_q[2][6] (
	.clk(clk),
	.d(\synreg_d[2][6]~45_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][6]~q ),
	.prn(vcc));
defparam \synreg_q[2][6] .is_wysiwyg = "true";
defparam \synreg_q[2][6] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][6]~2 (
	.dataa(\synreg_q[2][6]~q ),
	.datab(syn_6_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][6]~2_combout ),
	.cout());
defparam \synreg_d[1][6]~2 .lut_mask = 16'hAACC;
defparam \synreg_d[1][6]~2 .sum_lutc_input = "datac";

dffeas \synreg_q[1][6] (
	.clk(clk),
	.d(\synreg_d[1][6]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][6]~q ),
	.prn(vcc));
defparam \synreg_q[1][6] .is_wysiwyg = "true";
defparam \synreg_q[1][6] .power_up = "low";

dffeas \mulout_q[1][6] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[6]~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][6]~q ),
	.prn(vcc));
defparam \mulout_q[1][6] .is_wysiwyg = "true";
defparam \mulout_q[1][6] .power_up = "low";

dffeas \mulout_q[2][6] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[6]~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][6]~q ),
	.prn(vcc));
defparam \mulout_q[2][6] .is_wysiwyg = "true";
defparam \mulout_q[2][6] .power_up = "low";

dffeas \mulout_q[3][6] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[6]~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][6]~q ),
	.prn(vcc));
defparam \mulout_q[3][6] .is_wysiwyg = "true";
defparam \mulout_q[3][6] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][6]~2 (
	.dataa(\synreg_q[1][6]~q ),
	.datab(\mulout_q[1][6]~q ),
	.datac(\mulout_q[2][6]~q ),
	.datad(\mulout_q[3][6]~q ),
	.cin(gnd),
	.combout(\mulsum[4][6]~2_combout ),
	.cout());
defparam \mulsum[4][6]~2 .lut_mask = 16'h6996;
defparam \mulsum[4][6]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][6] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][6]~q ),
	.datad(\mulsum[4][6]~2_combout ),
	.cin(gnd),
	.combout(\mulsum[4][6]~combout ),
	.cout());
defparam \mulsum[4][6] .lut_mask = 16'h0FF0;
defparam \mulsum[4][6] .sum_lutc_input = "datac";

dffeas \delta_q[6] (
	.clk(clk),
	.d(\mulsum[4][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[6]~q ),
	.prn(vcc));
defparam \delta_q[6] .is_wysiwyg = "true";
defparam \delta_q[6] .power_up = "low";

dffeas \mulout_q[4][5] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][5]~q ),
	.prn(vcc));
defparam \mulout_q[4][5] .is_wysiwyg = "true";
defparam \mulout_q[4][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][5]~25 (
	.dataa(\synreg_q[2][5]~q ),
	.datab(syn_5_3),
	.datac(\WideOr7~0_combout ),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][5]~25_combout ),
	.cout());
defparam \synreg_d[3][5]~25 .lut_mask = 16'hACFF;
defparam \synreg_d[3][5]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[8][5]~11 (
	.dataa(\synreg_q[1][5]~q ),
	.datab(syn_5_8),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[8][5]~11_combout ),
	.cout());
defparam \synreg_d[8][5]~11 .lut_mask = 16'hAACC;
defparam \synreg_d[8][5]~11 .sum_lutc_input = "datac";

dffeas \synreg_q[8][5] (
	.clk(clk),
	.d(\synreg_d[8][5]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][5]~q ),
	.prn(vcc));
defparam \synreg_q[8][5] .is_wysiwyg = "true";
defparam \synreg_q[8][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][5]~49 (
	.dataa(\synreg_q[8][5]~q ),
	.datab(syn_5_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][5]~49_combout ),
	.cout());
defparam \synreg_d[7][5]~49 .lut_mask = 16'hAACC;
defparam \synreg_d[7][5]~49 .sum_lutc_input = "datac";

dffeas \synreg_q[7][5] (
	.clk(clk),
	.d(\synreg_d[7][5]~49_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][5]~q ),
	.prn(vcc));
defparam \synreg_q[7][5] .is_wysiwyg = "true";
defparam \synreg_q[7][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][5]~26 (
	.dataa(\synreg_q[7][5]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_5),
	.datad(synin4),
	.cin(gnd),
	.combout(\synreg_d[6][5]~26_combout ),
	.cout());
defparam \synreg_d[6][5]~26 .lut_mask = 16'hEBBE;
defparam \synreg_d[6][5]~26 .sum_lutc_input = "datac";

dffeas \synreg_q[6][5] (
	.clk(clk),
	.d(\synreg_d[6][5]~26_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][5]~q ),
	.prn(vcc));
defparam \synreg_q[6][5] .is_wysiwyg = "true";
defparam \synreg_q[6][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][5]~71 (
	.dataa(\synreg_q[6][5]~q ),
	.datab(syn_5_5),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[5][5]~71_combout ),
	.cout());
defparam \synreg_d[5][5]~71 .lut_mask = 16'hAACC;
defparam \synreg_d[5][5]~71 .sum_lutc_input = "datac";

dffeas \synreg_q[5][5] (
	.clk(clk),
	.d(\synreg_d[5][5]~71_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][5]~q ),
	.prn(vcc));
defparam \synreg_q[5][5] .is_wysiwyg = "true";
defparam \synreg_q[5][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][5]~70 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[5][5]~q ),
	.datac(\synreg_q[3][5]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[4][5]~70_combout ),
	.cout());
defparam \synreg_d[4][5]~70 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][5]~70 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][5] (
	.dataa(\synreg_d[4][5]~70_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_5_4),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][5]~combout ),
	.cout());
defparam \synreg_d[4][5] .lut_mask = 16'hFEFF;
defparam \synreg_d[4][5] .sum_lutc_input = "datac";

dffeas \synreg_q[4][5] (
	.clk(clk),
	.d(\synreg_d[4][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][5]~q ),
	.prn(vcc));
defparam \synreg_q[4][5] .is_wysiwyg = "true";
defparam \synreg_q[4][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][5] (
	.dataa(\synreg_d[3][5]~25_combout ),
	.datab(\state.S3~q ),
	.datac(\synreg_q[4][5]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\synreg_d[3][5]~combout ),
	.cout());
defparam \synreg_d[3][5] .lut_mask = 16'hFEFE;
defparam \synreg_d[3][5] .sum_lutc_input = "datac";

dffeas \synreg_q[3][5] (
	.clk(clk),
	.d(\synreg_d[3][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][5]~q ),
	.prn(vcc));
defparam \synreg_q[3][5] .is_wysiwyg = "true";
defparam \synreg_q[3][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][5]~47 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][5]~q ),
	.datac(\synreg_q[1][5]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][5]~47_combout ),
	.cout());
defparam \synreg_d[2][5]~47 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][5]~47 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][5]~48 (
	.dataa(\synreg_d[2][5]~47_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_5_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][5]~48_combout ),
	.cout());
defparam \synreg_d[2][5]~48 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][5]~48 .sum_lutc_input = "datac";

dffeas \synreg_q[2][5] (
	.clk(clk),
	.d(\synreg_d[2][5]~48_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][5]~q ),
	.prn(vcc));
defparam \synreg_q[2][5] .is_wysiwyg = "true";
defparam \synreg_q[2][5] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][5]~3 (
	.dataa(\synreg_q[2][5]~q ),
	.datab(syn_5_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][5]~3_combout ),
	.cout());
defparam \synreg_d[1][5]~3 .lut_mask = 16'hAACC;
defparam \synreg_d[1][5]~3 .sum_lutc_input = "datac";

dffeas \synreg_q[1][5] (
	.clk(clk),
	.d(\synreg_d[1][5]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][5]~q ),
	.prn(vcc));
defparam \synreg_q[1][5] .is_wysiwyg = "true";
defparam \synreg_q[1][5] .power_up = "low";

dffeas \mulout_q[1][5] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[5]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][5]~q ),
	.prn(vcc));
defparam \mulout_q[1][5] .is_wysiwyg = "true";
defparam \mulout_q[1][5] .power_up = "low";

dffeas \mulout_q[2][5] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[5]~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][5]~q ),
	.prn(vcc));
defparam \mulout_q[2][5] .is_wysiwyg = "true";
defparam \mulout_q[2][5] .power_up = "low";

dffeas \mulout_q[3][5] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[5]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][5]~q ),
	.prn(vcc));
defparam \mulout_q[3][5] .is_wysiwyg = "true";
defparam \mulout_q[3][5] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][5]~3 (
	.dataa(\synreg_q[1][5]~q ),
	.datab(\mulout_q[1][5]~q ),
	.datac(\mulout_q[2][5]~q ),
	.datad(\mulout_q[3][5]~q ),
	.cin(gnd),
	.combout(\mulsum[4][5]~3_combout ),
	.cout());
defparam \mulsum[4][5]~3 .lut_mask = 16'h6996;
defparam \mulsum[4][5]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][5] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][5]~q ),
	.datad(\mulsum[4][5]~3_combout ),
	.cin(gnd),
	.combout(\mulsum[4][5]~combout ),
	.cout());
defparam \mulsum[4][5] .lut_mask = 16'h0FF0;
defparam \mulsum[4][5] .sum_lutc_input = "datac";

dffeas \delta_q[5] (
	.clk(clk),
	.d(\mulsum[4][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[5]~q ),
	.prn(vcc));
defparam \delta_q[5] .is_wysiwyg = "true";
defparam \delta_q[5] .power_up = "low";

cycloneive_lcell_comb \deltazero[8]~0 (
	.dataa(\delta_q[8]~q ),
	.datab(\delta_q[7]~q ),
	.datac(\delta_q[6]~q ),
	.datad(\delta_q[5]~q ),
	.cin(gnd),
	.combout(\deltazero[8]~0_combout ),
	.cout());
defparam \deltazero[8]~0 .lut_mask = 16'hFFFE;
defparam \deltazero[8]~0 .sum_lutc_input = "datac";

dffeas \mulout_q[4][4] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][4]~q ),
	.prn(vcc));
defparam \mulout_q[4][4] .is_wysiwyg = "true";
defparam \mulout_q[4][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][4]~27 (
	.dataa(\synreg_q[2][4]~q ),
	.datab(syn_4_3),
	.datac(\WideOr7~0_combout ),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][4]~27_combout ),
	.cout());
defparam \synreg_d[3][4]~27 .lut_mask = 16'hACFF;
defparam \synreg_d[3][4]~27 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][4]~72 (
	.dataa(\synreg_q[3][4]~q ),
	.datab(syn_4_4),
	.datac(\WideOr7~0_combout ),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][4]~72_combout ),
	.cout());
defparam \synreg_d[4][4]~72 .lut_mask = 16'hACFF;
defparam \synreg_d[4][4]~72 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[8][4]~12 (
	.dataa(\synreg_q[1][4]~q ),
	.datab(syn_4_8),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[8][4]~12_combout ),
	.cout());
defparam \synreg_d[8][4]~12 .lut_mask = 16'hAACC;
defparam \synreg_d[8][4]~12 .sum_lutc_input = "datac";

dffeas \synreg_q[8][4] (
	.clk(clk),
	.d(\synreg_d[8][4]~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][4]~q ),
	.prn(vcc));
defparam \synreg_q[8][4] .is_wysiwyg = "true";
defparam \synreg_q[8][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][4]~52 (
	.dataa(\synreg_q[8][4]~q ),
	.datab(syn_4_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][4]~52_combout ),
	.cout());
defparam \synreg_d[7][4]~52 .lut_mask = 16'hAACC;
defparam \synreg_d[7][4]~52 .sum_lutc_input = "datac";

dffeas \synreg_q[7][4] (
	.clk(clk),
	.d(\synreg_d[7][4]~52_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][4]~q ),
	.prn(vcc));
defparam \synreg_q[7][4] .is_wysiwyg = "true";
defparam \synreg_q[7][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][4]~28 (
	.dataa(\synreg_q[7][4]~q ),
	.datab(syn_4_6),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[6][4]~28_combout ),
	.cout());
defparam \synreg_d[6][4]~28 .lut_mask = 16'hAACC;
defparam \synreg_d[6][4]~28 .sum_lutc_input = "datac";

dffeas \synreg_q[6][4] (
	.clk(clk),
	.d(\synreg_d[6][4]~28_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][4]~q ),
	.prn(vcc));
defparam \synreg_q[6][4] .is_wysiwyg = "true";
defparam \synreg_q[6][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][4]~73 (
	.dataa(\synreg_q[6][4]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_4),
	.datad(synin7),
	.cin(gnd),
	.combout(\synreg_d[5][4]~73_combout ),
	.cout());
defparam \synreg_d[5][4]~73 .lut_mask = 16'hEBBE;
defparam \synreg_d[5][4]~73 .sum_lutc_input = "datac";

dffeas \synreg_q[5][4] (
	.clk(clk),
	.d(\synreg_d[5][4]~73_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][4]~q ),
	.prn(vcc));
defparam \synreg_q[5][4] .is_wysiwyg = "true";
defparam \synreg_q[5][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][4] (
	.dataa(\synreg_d[4][4]~72_combout ),
	.datab(\state.S3~q ),
	.datac(\synreg_q[5][4]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\synreg_d[4][4]~combout ),
	.cout());
defparam \synreg_d[4][4] .lut_mask = 16'hFEFE;
defparam \synreg_d[4][4] .sum_lutc_input = "datac";

dffeas \synreg_q[4][4] (
	.clk(clk),
	.d(\synreg_d[4][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][4]~q ),
	.prn(vcc));
defparam \synreg_q[4][4] .is_wysiwyg = "true";
defparam \synreg_q[4][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][4] (
	.dataa(\synreg_d[3][4]~27_combout ),
	.datab(\state.S3~q ),
	.datac(\synreg_q[4][4]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\synreg_d[3][4]~combout ),
	.cout());
defparam \synreg_d[3][4] .lut_mask = 16'hFEFE;
defparam \synreg_d[3][4] .sum_lutc_input = "datac";

dffeas \synreg_q[3][4] (
	.clk(clk),
	.d(\synreg_d[3][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][4]~q ),
	.prn(vcc));
defparam \synreg_q[3][4] .is_wysiwyg = "true";
defparam \synreg_q[3][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][4]~50 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][4]~q ),
	.datac(\synreg_q[1][4]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][4]~50_combout ),
	.cout());
defparam \synreg_d[2][4]~50 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][4]~50 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][4]~51 (
	.dataa(\synreg_d[2][4]~50_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_4_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][4]~51_combout ),
	.cout());
defparam \synreg_d[2][4]~51 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][4]~51 .sum_lutc_input = "datac";

dffeas \synreg_q[2][4] (
	.clk(clk),
	.d(\synreg_d[2][4]~51_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][4]~q ),
	.prn(vcc));
defparam \synreg_q[2][4] .is_wysiwyg = "true";
defparam \synreg_q[2][4] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][4]~4 (
	.dataa(\synreg_q[2][4]~q ),
	.datab(syn_4_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][4]~4_combout ),
	.cout());
defparam \synreg_d[1][4]~4 .lut_mask = 16'hAACC;
defparam \synreg_d[1][4]~4 .sum_lutc_input = "datac";

dffeas \synreg_q[1][4] (
	.clk(clk),
	.d(\synreg_d[1][4]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][4]~q ),
	.prn(vcc));
defparam \synreg_q[1][4] .is_wysiwyg = "true";
defparam \synreg_q[1][4] .power_up = "low";

dffeas \mulout_q[1][4] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][4]~q ),
	.prn(vcc));
defparam \mulout_q[1][4] .is_wysiwyg = "true";
defparam \mulout_q[1][4] .power_up = "low";

dffeas \mulout_q[2][4] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][4]~q ),
	.prn(vcc));
defparam \mulout_q[2][4] .is_wysiwyg = "true";
defparam \mulout_q[2][4] .power_up = "low";

dffeas \mulout_q[3][4] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][4]~q ),
	.prn(vcc));
defparam \mulout_q[3][4] .is_wysiwyg = "true";
defparam \mulout_q[3][4] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][4]~4 (
	.dataa(\synreg_q[1][4]~q ),
	.datab(\mulout_q[1][4]~q ),
	.datac(\mulout_q[2][4]~q ),
	.datad(\mulout_q[3][4]~q ),
	.cin(gnd),
	.combout(\mulsum[4][4]~4_combout ),
	.cout());
defparam \mulsum[4][4]~4 .lut_mask = 16'h6996;
defparam \mulsum[4][4]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][4] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][4]~q ),
	.datad(\mulsum[4][4]~4_combout ),
	.cin(gnd),
	.combout(\mulsum[4][4]~combout ),
	.cout());
defparam \mulsum[4][4] .lut_mask = 16'h0FF0;
defparam \mulsum[4][4] .sum_lutc_input = "datac";

dffeas \delta_q[4] (
	.clk(clk),
	.d(\mulsum[4][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[4]~q ),
	.prn(vcc));
defparam \delta_q[4] .is_wysiwyg = "true";
defparam \delta_q[4] .power_up = "low";

dffeas \mulout_q[4][3] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][3]~q ),
	.prn(vcc));
defparam \mulout_q[4][3] .is_wysiwyg = "true";
defparam \mulout_q[4][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[8][3]~13 (
	.dataa(\synreg_q[1][3]~q ),
	.datab(syn_3_8),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[8][3]~13_combout ),
	.cout());
defparam \synreg_d[8][3]~13 .lut_mask = 16'hAACC;
defparam \synreg_d[8][3]~13 .sum_lutc_input = "datac";

dffeas \synreg_q[8][3] (
	.clk(clk),
	.d(\synreg_d[8][3]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][3]~q ),
	.prn(vcc));
defparam \synreg_q[8][3] .is_wysiwyg = "true";
defparam \synreg_q[8][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][3]~55 (
	.dataa(\synreg_q[8][3]~q ),
	.datab(syn_3_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][3]~55_combout ),
	.cout());
defparam \synreg_d[7][3]~55 .lut_mask = 16'hAACC;
defparam \synreg_d[7][3]~55 .sum_lutc_input = "datac";

dffeas \synreg_q[7][3] (
	.clk(clk),
	.d(\synreg_d[7][3]~55_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][3]~q ),
	.prn(vcc));
defparam \synreg_q[7][3] .is_wysiwyg = "true";
defparam \synreg_q[7][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][3]~31 (
	.dataa(\synreg_q[7][3]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_3),
	.datad(synin5),
	.cin(gnd),
	.combout(\synreg_d[6][3]~31_combout ),
	.cout());
defparam \synreg_d[6][3]~31 .lut_mask = 16'hEBBE;
defparam \synreg_d[6][3]~31 .sum_lutc_input = "datac";

dffeas \synreg_q[6][3] (
	.clk(clk),
	.d(\synreg_d[6][3]~31_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][3]~q ),
	.prn(vcc));
defparam \synreg_q[6][3] .is_wysiwyg = "true";
defparam \synreg_q[6][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][3]~76 (
	.dataa(\synreg_q[6][3]~q ),
	.datab(syn_3_5),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[5][3]~76_combout ),
	.cout());
defparam \synreg_d[5][3]~76 .lut_mask = 16'hAACC;
defparam \synreg_d[5][3]~76 .sum_lutc_input = "datac";

dffeas \synreg_q[5][3] (
	.clk(clk),
	.d(\synreg_d[5][3]~76_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][3]~q ),
	.prn(vcc));
defparam \synreg_q[5][3] .is_wysiwyg = "true";
defparam \synreg_q[5][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][3]~74 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[5][3]~q ),
	.datac(\synreg_q[3][3]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[4][3]~74_combout ),
	.cout());
defparam \synreg_d[4][3]~74 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][3]~74 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][3]~75 (
	.dataa(\synreg_d[4][3]~74_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_3_4),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][3]~75_combout ),
	.cout());
defparam \synreg_d[4][3]~75 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][3]~75 .sum_lutc_input = "datac";

dffeas \synreg_q[4][3] (
	.clk(clk),
	.d(\synreg_d[4][3]~75_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][3]~q ),
	.prn(vcc));
defparam \synreg_q[4][3] .is_wysiwyg = "true";
defparam \synreg_q[4][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][3]~29 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[4][3]~q ),
	.datac(\synreg_q[2][3]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[3][3]~29_combout ),
	.cout());
defparam \synreg_d[3][3]~29 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][3]~29 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[3][3]~30 (
	.dataa(\synreg_d[3][3]~29_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_3_3),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][3]~30_combout ),
	.cout());
defparam \synreg_d[3][3]~30 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][3]~30 .sum_lutc_input = "datac";

dffeas \synreg_q[3][3] (
	.clk(clk),
	.d(\synreg_d[3][3]~30_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][3]~q ),
	.prn(vcc));
defparam \synreg_q[3][3] .is_wysiwyg = "true";
defparam \synreg_q[3][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][3]~53 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][3]~q ),
	.datac(\synreg_q[1][3]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][3]~53_combout ),
	.cout());
defparam \synreg_d[2][3]~53 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][3]~53 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][3]~54 (
	.dataa(\synreg_d[2][3]~53_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_3_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][3]~54_combout ),
	.cout());
defparam \synreg_d[2][3]~54 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][3]~54 .sum_lutc_input = "datac";

dffeas \synreg_q[2][3] (
	.clk(clk),
	.d(\synreg_d[2][3]~54_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][3]~q ),
	.prn(vcc));
defparam \synreg_q[2][3] .is_wysiwyg = "true";
defparam \synreg_q[2][3] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][3]~5 (
	.dataa(\synreg_q[2][3]~q ),
	.datab(syn_3_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][3]~5_combout ),
	.cout());
defparam \synreg_d[1][3]~5 .lut_mask = 16'hAACC;
defparam \synreg_d[1][3]~5 .sum_lutc_input = "datac";

dffeas \synreg_q[1][3] (
	.clk(clk),
	.d(\synreg_d[1][3]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][3]~q ),
	.prn(vcc));
defparam \synreg_q[1][3] .is_wysiwyg = "true";
defparam \synreg_q[1][3] .power_up = "low";

dffeas \mulout_q[1][3] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][3]~q ),
	.prn(vcc));
defparam \mulout_q[1][3] .is_wysiwyg = "true";
defparam \mulout_q[1][3] .power_up = "low";

dffeas \mulout_q[2][3] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][3]~q ),
	.prn(vcc));
defparam \mulout_q[2][3] .is_wysiwyg = "true";
defparam \mulout_q[2][3] .power_up = "low";

dffeas \mulout_q[3][3] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][3]~q ),
	.prn(vcc));
defparam \mulout_q[3][3] .is_wysiwyg = "true";
defparam \mulout_q[3][3] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][3]~5 (
	.dataa(\synreg_q[1][3]~q ),
	.datab(\mulout_q[1][3]~q ),
	.datac(\mulout_q[2][3]~q ),
	.datad(\mulout_q[3][3]~q ),
	.cin(gnd),
	.combout(\mulsum[4][3]~5_combout ),
	.cout());
defparam \mulsum[4][3]~5 .lut_mask = 16'h6996;
defparam \mulsum[4][3]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][3] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][3]~q ),
	.datad(\mulsum[4][3]~5_combout ),
	.cin(gnd),
	.combout(\mulsum[4][3]~combout ),
	.cout());
defparam \mulsum[4][3] .lut_mask = 16'h0FF0;
defparam \mulsum[4][3] .sum_lutc_input = "datac";

dffeas \delta_q[3] (
	.clk(clk),
	.d(\mulsum[4][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[3]~q ),
	.prn(vcc));
defparam \delta_q[3] .is_wysiwyg = "true";
defparam \delta_q[3] .power_up = "low";

dffeas \mulout_q[4][2] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][2]~q ),
	.prn(vcc));
defparam \mulout_q[4][2] .is_wysiwyg = "true";
defparam \mulout_q[4][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[8][2]~15 (
	.dataa(\synreg_q[1][2]~q ),
	.datab(\state.S3~q ),
	.datac(rsin_q_2),
	.datad(synin2),
	.cin(gnd),
	.combout(\synreg_d[8][2]~15_combout ),
	.cout());
defparam \synreg_d[8][2]~15 .lut_mask = 16'hEBBE;
defparam \synreg_d[8][2]~15 .sum_lutc_input = "datac";

dffeas \synreg_q[8][2] (
	.clk(clk),
	.d(\synreg_d[8][2]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][2]~q ),
	.prn(vcc));
defparam \synreg_q[8][2] .is_wysiwyg = "true";
defparam \synreg_q[8][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][2]~61 (
	.dataa(\synreg_q[8][2]~q ),
	.datab(syn_2_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][2]~61_combout ),
	.cout());
defparam \synreg_d[7][2]~61 .lut_mask = 16'hAACC;
defparam \synreg_d[7][2]~61 .sum_lutc_input = "datac";

dffeas \synreg_q[7][2] (
	.clk(clk),
	.d(\synreg_d[7][2]~61_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][2]~q ),
	.prn(vcc));
defparam \synreg_q[7][2] .is_wysiwyg = "true";
defparam \synreg_q[7][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][2]~37 (
	.dataa(\synreg_q[7][2]~q ),
	.datab(syn_2_6),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[6][2]~37_combout ),
	.cout());
defparam \synreg_d[6][2]~37 .lut_mask = 16'hAACC;
defparam \synreg_d[6][2]~37 .sum_lutc_input = "datac";

dffeas \synreg_q[6][2] (
	.clk(clk),
	.d(\synreg_d[6][2]~37_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][2]~q ),
	.prn(vcc));
defparam \synreg_q[6][2] .is_wysiwyg = "true";
defparam \synreg_q[6][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][2]~82 (
	.dataa(\synreg_q[6][2]~q ),
	.datab(syn_2_5),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[5][2]~82_combout ),
	.cout());
defparam \synreg_d[5][2]~82 .lut_mask = 16'hAACC;
defparam \synreg_d[5][2]~82 .sum_lutc_input = "datac";

dffeas \synreg_q[5][2] (
	.clk(clk),
	.d(\synreg_d[5][2]~82_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][2]~q ),
	.prn(vcc));
defparam \synreg_q[5][2] .is_wysiwyg = "true";
defparam \synreg_q[5][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][2]~80 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[5][2]~q ),
	.datac(\synreg_q[3][2]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[4][2]~80_combout ),
	.cout());
defparam \synreg_d[4][2]~80 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][2]~80 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][2]~81 (
	.dataa(\synreg_d[4][2]~80_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_2_4),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][2]~81_combout ),
	.cout());
defparam \synreg_d[4][2]~81 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][2]~81 .sum_lutc_input = "datac";

dffeas \synreg_q[4][2] (
	.clk(clk),
	.d(\synreg_d[4][2]~81_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][2]~q ),
	.prn(vcc));
defparam \synreg_q[4][2] .is_wysiwyg = "true";
defparam \synreg_q[4][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][2]~35 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[4][2]~q ),
	.datac(\synreg_q[2][2]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[3][2]~35_combout ),
	.cout());
defparam \synreg_d[3][2]~35 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][2]~35 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[3][2]~36 (
	.dataa(\synreg_d[3][2]~35_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_2_3),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][2]~36_combout ),
	.cout());
defparam \synreg_d[3][2]~36 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][2]~36 .sum_lutc_input = "datac";

dffeas \synreg_q[3][2] (
	.clk(clk),
	.d(\synreg_d[3][2]~36_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][2]~q ),
	.prn(vcc));
defparam \synreg_q[3][2] .is_wysiwyg = "true";
defparam \synreg_q[3][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][2]~59 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][2]~q ),
	.datac(\synreg_q[1][2]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][2]~59_combout ),
	.cout());
defparam \synreg_d[2][2]~59 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][2]~59 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][2]~60 (
	.dataa(\synreg_d[2][2]~59_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_2_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][2]~60_combout ),
	.cout());
defparam \synreg_d[2][2]~60 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][2]~60 .sum_lutc_input = "datac";

dffeas \synreg_q[2][2] (
	.clk(clk),
	.d(\synreg_d[2][2]~60_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][2]~q ),
	.prn(vcc));
defparam \synreg_q[2][2] .is_wysiwyg = "true";
defparam \synreg_q[2][2] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][2]~6 (
	.dataa(\synreg_q[2][2]~q ),
	.datab(syn_2_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][2]~6_combout ),
	.cout());
defparam \synreg_d[1][2]~6 .lut_mask = 16'hAACC;
defparam \synreg_d[1][2]~6 .sum_lutc_input = "datac";

dffeas \synreg_q[1][2] (
	.clk(clk),
	.d(\synreg_d[1][2]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][2]~q ),
	.prn(vcc));
defparam \synreg_q[1][2] .is_wysiwyg = "true";
defparam \synreg_q[1][2] .power_up = "low";

dffeas \mulout_q[1][2] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][2]~q ),
	.prn(vcc));
defparam \mulout_q[1][2] .is_wysiwyg = "true";
defparam \mulout_q[1][2] .power_up = "low";

dffeas \mulout_q[2][2] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][2]~q ),
	.prn(vcc));
defparam \mulout_q[2][2] .is_wysiwyg = "true";
defparam \mulout_q[2][2] .power_up = "low";

dffeas \mulout_q[3][2] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][2]~q ),
	.prn(vcc));
defparam \mulout_q[3][2] .is_wysiwyg = "true";
defparam \mulout_q[3][2] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][2]~6 (
	.dataa(\synreg_q[1][2]~q ),
	.datab(\mulout_q[1][2]~q ),
	.datac(\mulout_q[2][2]~q ),
	.datad(\mulout_q[3][2]~q ),
	.cin(gnd),
	.combout(\mulsum[4][2]~6_combout ),
	.cout());
defparam \mulsum[4][2]~6 .lut_mask = 16'h6996;
defparam \mulsum[4][2]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][2]~q ),
	.datad(\mulsum[4][2]~6_combout ),
	.cin(gnd),
	.combout(\mulsum[4][2]~combout ),
	.cout());
defparam \mulsum[4][2] .lut_mask = 16'h0FF0;
defparam \mulsum[4][2] .sum_lutc_input = "datac";

dffeas \delta_q[2] (
	.clk(clk),
	.d(\mulsum[4][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[2]~q ),
	.prn(vcc));
defparam \delta_q[2] .is_wysiwyg = "true";
defparam \delta_q[2] .power_up = "low";

dffeas \mulout_q[4][1] (
	.clk(clk),
	.d(\g13:4:gf_mul1|c[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[4][1]~q ),
	.prn(vcc));
defparam \mulout_q[4][1] .is_wysiwyg = "true";
defparam \mulout_q[4][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[8][1]~14 (
	.dataa(\synreg_q[1][1]~q ),
	.datab(syn_1_8),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[8][1]~14_combout ),
	.cout());
defparam \synreg_d[8][1]~14 .lut_mask = 16'hAACC;
defparam \synreg_d[8][1]~14 .sum_lutc_input = "datac";

dffeas \synreg_q[8][1] (
	.clk(clk),
	.d(\synreg_d[8][1]~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[8][1]~q ),
	.prn(vcc));
defparam \synreg_q[8][1] .is_wysiwyg = "true";
defparam \synreg_q[8][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[7][1]~58 (
	.dataa(\synreg_q[8][1]~q ),
	.datab(syn_1_7),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[7][1]~58_combout ),
	.cout());
defparam \synreg_d[7][1]~58 .lut_mask = 16'hAACC;
defparam \synreg_d[7][1]~58 .sum_lutc_input = "datac";

dffeas \synreg_q[7][1] (
	.clk(clk),
	.d(\synreg_d[7][1]~58_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[7][1]~q ),
	.prn(vcc));
defparam \synreg_q[7][1] .is_wysiwyg = "true";
defparam \synreg_q[7][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[6][1]~34 (
	.dataa(\synreg_q[7][1]~q ),
	.datab(syn_1_6),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[6][1]~34_combout ),
	.cout());
defparam \synreg_d[6][1]~34 .lut_mask = 16'hAACC;
defparam \synreg_d[6][1]~34 .sum_lutc_input = "datac";

dffeas \synreg_q[6][1] (
	.clk(clk),
	.d(\synreg_d[6][1]~34_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[6][1]~q ),
	.prn(vcc));
defparam \synreg_q[6][1] .is_wysiwyg = "true";
defparam \synreg_q[6][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[5][1]~79 (
	.dataa(\synreg_q[6][1]~q ),
	.datab(syn_1_5),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[5][1]~79_combout ),
	.cout());
defparam \synreg_d[5][1]~79 .lut_mask = 16'hAACC;
defparam \synreg_d[5][1]~79 .sum_lutc_input = "datac";

dffeas \synreg_q[5][1] (
	.clk(clk),
	.d(\synreg_d[5][1]~79_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[5][1]~q ),
	.prn(vcc));
defparam \synreg_q[5][1] .is_wysiwyg = "true";
defparam \synreg_q[5][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[4][1]~77 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[5][1]~q ),
	.datac(\synreg_q[3][1]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[4][1]~77_combout ),
	.cout());
defparam \synreg_d[4][1]~77 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][1]~77 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[4][1]~78 (
	.dataa(\synreg_d[4][1]~77_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_1_4),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[4][1]~78_combout ),
	.cout());
defparam \synreg_d[4][1]~78 .lut_mask = 16'hFEFF;
defparam \synreg_d[4][1]~78 .sum_lutc_input = "datac";

dffeas \synreg_q[4][1] (
	.clk(clk),
	.d(\synreg_d[4][1]~78_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[4][1]~q ),
	.prn(vcc));
defparam \synreg_q[4][1] .is_wysiwyg = "true";
defparam \synreg_q[4][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[3][1]~32 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[4][1]~q ),
	.datac(\synreg_q[2][1]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[3][1]~32_combout ),
	.cout());
defparam \synreg_d[3][1]~32 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][1]~32 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[3][1]~33 (
	.dataa(\synreg_d[3][1]~32_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_1_3),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[3][1]~33_combout ),
	.cout());
defparam \synreg_d[3][1]~33 .lut_mask = 16'hFEFF;
defparam \synreg_d[3][1]~33 .sum_lutc_input = "datac";

dffeas \synreg_q[3][1] (
	.clk(clk),
	.d(\synreg_d[3][1]~33_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[3][1]~q ),
	.prn(vcc));
defparam \synreg_q[3][1] .is_wysiwyg = "true";
defparam \synreg_q[3][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[2][1]~56 (
	.dataa(\state.S3~q ),
	.datab(\synreg_q[3][1]~q ),
	.datac(\synreg_q[1][1]~q ),
	.datad(\WideOr7~0_combout ),
	.cin(gnd),
	.combout(\synreg_d[2][1]~56_combout ),
	.cout());
defparam \synreg_d[2][1]~56 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][1]~56 .sum_lutc_input = "datac";

cycloneive_lcell_comb \synreg_d[2][1]~57 (
	.dataa(\synreg_d[2][1]~56_combout ),
	.datab(\WideOr7~0_combout ),
	.datac(syn_1_2),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[2][1]~57_combout ),
	.cout());
defparam \synreg_d[2][1]~57 .lut_mask = 16'hFEFF;
defparam \synreg_d[2][1]~57 .sum_lutc_input = "datac";

dffeas \synreg_q[2][1] (
	.clk(clk),
	.d(\synreg_d[2][1]~57_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~1_combout ),
	.q(\synreg_q[2][1]~q ),
	.prn(vcc));
defparam \synreg_q[2][1] .is_wysiwyg = "true";
defparam \synreg_q[2][1] .power_up = "low";

cycloneive_lcell_comb \synreg_d[1][1]~7 (
	.dataa(\synreg_q[2][1]~q ),
	.datab(syn_1_1),
	.datac(gnd),
	.datad(\state.S3~q ),
	.cin(gnd),
	.combout(\synreg_d[1][1]~7_combout ),
	.cout());
defparam \synreg_d[1][1]~7 .lut_mask = 16'hAACC;
defparam \synreg_d[1][1]~7 .sum_lutc_input = "datac";

dffeas \synreg_q[1][1] (
	.clk(clk),
	.d(\synreg_d[1][1]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\synreg_2~0_combout ),
	.q(\synreg_q[1][1]~q ),
	.prn(vcc));
defparam \synreg_q[1][1] .is_wysiwyg = "true";
defparam \synreg_q[1][1] .power_up = "low";

dffeas \mulout_q[1][1] (
	.clk(clk),
	.d(\g13:1:gf_mul1|c[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[1][1]~q ),
	.prn(vcc));
defparam \mulout_q[1][1] .is_wysiwyg = "true";
defparam \mulout_q[1][1] .power_up = "low";

dffeas \mulout_q[2][1] (
	.clk(clk),
	.d(\g13:2:gf_mul1|c[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[2][1]~q ),
	.prn(vcc));
defparam \mulout_q[2][1] .is_wysiwyg = "true";
defparam \mulout_q[2][1] .power_up = "low";

dffeas \mulout_q[3][1] (
	.clk(clk),
	.d(\g13:3:gf_mul1|c[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\mulout_q[3][1]~q ),
	.prn(vcc));
defparam \mulout_q[3][1] .is_wysiwyg = "true";
defparam \mulout_q[3][1] .power_up = "low";

cycloneive_lcell_comb \mulsum[4][1]~7 (
	.dataa(\synreg_q[1][1]~q ),
	.datab(\mulout_q[1][1]~q ),
	.datac(\mulout_q[2][1]~q ),
	.datad(\mulout_q[3][1]~q ),
	.cin(gnd),
	.combout(\mulsum[4][1]~7_combout ),
	.cout());
defparam \mulsum[4][1]~7 .lut_mask = 16'h6996;
defparam \mulsum[4][1]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \mulsum[4][1] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\mulout_q[4][1]~q ),
	.datad(\mulsum[4][1]~7_combout ),
	.cin(gnd),
	.combout(\mulsum[4][1]~combout ),
	.cout());
defparam \mulsum[4][1] .lut_mask = 16'h0FF0;
defparam \mulsum[4][1] .sum_lutc_input = "datac";

dffeas \delta_q[1] (
	.clk(clk),
	.d(\mulsum[4][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\state.S2a~q ),
	.q(\delta_q[1]~q ),
	.prn(vcc));
defparam \delta_q[1] .is_wysiwyg = "true";
defparam \delta_q[1] .power_up = "low";

cycloneive_lcell_comb \deltazero[8]~1 (
	.dataa(\delta_q[4]~q ),
	.datab(\delta_q[3]~q ),
	.datac(\delta_q[2]~q ),
	.datad(\delta_q[1]~q ),
	.cin(gnd),
	.combout(\deltazero[8]~1_combout ),
	.cout());
defparam \deltazero[8]~1 .lut_mask = 16'hFFFE;
defparam \deltazero[8]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \next_state.S4~0 (
	.dataa(\state.S3~q ),
	.datab(\deltazero[8]~0_combout ),
	.datac(\deltazero[8]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\next_state.S4~0_combout ),
	.cout());
defparam \next_state.S4~0 .lut_mask = 16'hFEFE;
defparam \next_state.S4~0 .sum_lutc_input = "datac";

dffeas \state.S4 (
	.clk(clk),
	.d(\next_state.S4~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S4~q ),
	.prn(vcc));
defparam \state.S4 .is_wysiwyg = "true";
defparam \state.S4 .power_up = "low";

dffeas \state.S5 (
	.clk(clk),
	.d(\state.S4~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S5~q ),
	.prn(vcc));
defparam \state.S5 .is_wysiwyg = "true";
defparam \state.S5 .power_up = "low";

cycloneive_lcell_comb \next_state.S6~0 (
	.dataa(\LessThan0~1_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\state.S5~q ),
	.cin(gnd),
	.combout(\next_state.S6~0_combout ),
	.cout());
defparam \next_state.S6~0 .lut_mask = 16'hFF55;
defparam \next_state.S6~0 .sum_lutc_input = "datac";

dffeas \state.S6 (
	.clk(clk),
	.d(\next_state.S6~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S6~q ),
	.prn(vcc));
defparam \state.S6 .is_wysiwyg = "true";
defparam \state.S6 .power_up = "low";

cycloneive_lcell_comb \Selector3~0 (
	.dataa(\state.S6~q ),
	.datab(\state.S3~q ),
	.datac(\deltazero[8]~0_combout ),
	.datad(\deltazero[8]~1_combout ),
	.cin(gnd),
	.combout(\Selector3~0_combout ),
	.cout());
defparam \Selector3~0 .lut_mask = 16'hEFFF;
defparam \Selector3~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector3~1 (
	.dataa(\Selector3~0_combout ),
	.datab(\state.S5~q ),
	.datac(\LessThan0~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector3~1_combout ),
	.cout());
defparam \Selector3~1 .lut_mask = 16'hFEFE;
defparam \Selector3~1 .sum_lutc_input = "datac";

dffeas \state.S8 (
	.clk(clk),
	.d(\Selector3~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S8~q ),
	.prn(vcc));
defparam \state.S8 .is_wysiwyg = "true";
defparam \state.S8 .power_up = "low";

cycloneive_lcell_comb \next_state.S2 (
	.dataa(\state.S1~q ),
	.datab(\state.S8~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\next_state.S2~combout ),
	.cout());
defparam \next_state.S2 .lut_mask = 16'hEEEE;
defparam \next_state.S2 .sum_lutc_input = "datac";

dffeas \state.S2 (
	.clk(clk),
	.d(\next_state.S2~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S2~q ),
	.prn(vcc));
defparam \state.S2 .is_wysiwyg = "true";
defparam \state.S2 .power_up = "low";

cycloneive_lcell_comb \next_state.S10~1 (
	.dataa(\state.S2~q ),
	.datab(\next_state.S10~0_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\next_state.S10~1_combout ),
	.cout());
defparam \next_state.S10~1 .lut_mask = 16'hEEEE;
defparam \next_state.S10~1 .sum_lutc_input = "datac";

dffeas \state.S10 (
	.clk(clk),
	.d(\next_state.S10~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\state.S10~q ),
	.prn(vcc));
defparam \state.S10 .is_wysiwyg = "true";
defparam \state.S10 .power_up = "low";

cycloneive_lcell_comb \WideOr8~0 (
	.dataa(\state.S10~q ),
	.datab(\state.S1~q ),
	.datac(\state.S4~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\WideOr8~0_combout ),
	.cout());
defparam \WideOr8~0 .lut_mask = 16'hFEFE;
defparam \WideOr8~0 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][2] (
	.clk(clk),
	.d(bd_q_2_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][2]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][2] .is_wysiwyg = "true";
defparam \bdtemp_q[3][2] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][2]~6 (
	.dataa(\bdtemp_q[3][2]~q ),
	.datab(bdprev_q_2_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][2]~6_combout ),
	.cout());
defparam \bdprev_q[3][2]~6 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][2]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bdprev~0 (
	.dataa(\state.S12~q ),
	.datab(\state.S11~q ),
	.datac(\state.S6~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\bdprev~0_combout ),
	.cout());
defparam \bdprev~0 .lut_mask = 16'hFEFE;
defparam \bdprev~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bdprev~1 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~4_combout ),
	.datac(\state.S2~q ),
	.datad(\bdprev~0_combout ),
	.cin(gnd),
	.combout(\bdprev~1_combout ),
	.cout());
defparam \bdprev~1 .lut_mask = 16'hFFFE;
defparam \bdprev~1 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][2] (
	.clk(clk),
	.d(bd_q_2_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][2]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][2] .is_wysiwyg = "true";
defparam \bdtemp_q[2][2] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][2]~4 (
	.dataa(\bdtemp_q[2][2]~q ),
	.datab(bdprev_q_2_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][2]~4_combout ),
	.cout());
defparam \bdprev_q[2][2]~4 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][2]~4 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][2] (
	.clk(clk),
	.d(bd_q_2_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][2]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][2] .is_wysiwyg = "true";
defparam \bdtemp_q[4][2] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][2]~5 (
	.dataa(\bdtemp_q[4][2]~q ),
	.datab(bdprev_q_2_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][2]~5_combout ),
	.cout());
defparam \bdprev_q[4][2]~5 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][2]~5 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][1] (
	.clk(clk),
	.d(bd_q_1_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][1]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][1] .is_wysiwyg = "true";
defparam \bdtemp_q[1][1] .power_up = "low";

cycloneive_lcell_comb \onereg_q~0 (
	.dataa(\state.S11~q ),
	.datab(\state.S6~q ),
	.datac(\onereg_q~q ),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\onereg_q~0_combout ),
	.cout());
defparam \onereg_q~0 .lut_mask = 16'hFEFF;
defparam \onereg_q~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \onereg_q~1 (
	.dataa(\onereg_q~0_combout ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\onereg_q~1_combout ),
	.cout());
defparam \onereg_q~1 .lut_mask = 16'hBFFF;
defparam \onereg_q~1 .sum_lutc_input = "datac";

dffeas onereg_q(
	.clk(clk),
	.d(\onereg_q~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\onereg_q~q ),
	.prn(vcc));
defparam onereg_q.is_wysiwyg = "true";
defparam onereg_q.power_up = "low";

cycloneive_lcell_comb \bdprev_q[1][1]~1 (
	.dataa(\bdtemp_q[1][1]~q ),
	.datab(\onereg_q~q ),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[1][1]~1_combout ),
	.cout());
defparam \bdprev_q[1][1]~1 .lut_mask = 16'hAACC;
defparam \bdprev_q[1][1]~1 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][1] (
	.clk(clk),
	.d(bd_q_1_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][1]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][1] .is_wysiwyg = "true";
defparam \bdtemp_q[3][1] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][1]~2 (
	.dataa(\bdtemp_q[3][1]~q ),
	.datab(bdprev_q_1_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][1]~2_combout ),
	.cout());
defparam \bdprev_q[3][1]~2 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][1]~2 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][1] (
	.clk(clk),
	.d(bd_q_1_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][1]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][1] .is_wysiwyg = "true";
defparam \bdtemp_q[2][1] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][1]~0 (
	.dataa(\bdtemp_q[2][1]~q ),
	.datab(bdprev_q_1_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][1]~0_combout ),
	.cout());
defparam \bdprev_q[2][1]~0 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][1]~0 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][1] (
	.clk(clk),
	.d(bd_q_1_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][1]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][1] .is_wysiwyg = "true";
defparam \bdtemp_q[4][1] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][1]~3 (
	.dataa(\bdtemp_q[4][1]~q ),
	.datab(bdprev_q_1_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][1]~3_combout ),
	.cout());
defparam \bdprev_q[4][1]~3 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][1]~3 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][3] (
	.clk(clk),
	.d(bd_q_3_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][3]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][3] .is_wysiwyg = "true";
defparam \bdtemp_q[3][3] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][3]~9 (
	.dataa(\bdtemp_q[3][3]~q ),
	.datab(bdprev_q_3_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][3]~9_combout ),
	.cout());
defparam \bdprev_q[3][3]~9 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][3]~9 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][3] (
	.clk(clk),
	.d(bd_q_3_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][3]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][3] .is_wysiwyg = "true";
defparam \bdtemp_q[2][3] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][3]~7 (
	.dataa(\bdtemp_q[2][3]~q ),
	.datab(bdprev_q_3_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][3]~7_combout ),
	.cout());
defparam \bdprev_q[2][3]~7 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][3]~7 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][3] (
	.clk(clk),
	.d(bd_q_3_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][3]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][3] .is_wysiwyg = "true";
defparam \bdtemp_q[4][3] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][3]~8 (
	.dataa(\bdtemp_q[4][3]~q ),
	.datab(bdprev_q_3_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][3]~8_combout ),
	.cout());
defparam \bdprev_q[4][3]~8 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][3]~8 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][4] (
	.clk(clk),
	.d(bd_q_4_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][4]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][4] .is_wysiwyg = "true";
defparam \bdtemp_q[3][4] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][4]~12 (
	.dataa(\bdtemp_q[3][4]~q ),
	.datab(bdprev_q_4_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][4]~12_combout ),
	.cout());
defparam \bdprev_q[3][4]~12 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][4]~12 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][4] (
	.clk(clk),
	.d(bd_q_4_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][4]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][4] .is_wysiwyg = "true";
defparam \bdtemp_q[2][4] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][4]~10 (
	.dataa(\bdtemp_q[2][4]~q ),
	.datab(bdprev_q_4_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][4]~10_combout ),
	.cout());
defparam \bdprev_q[2][4]~10 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][4]~10 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][4] (
	.clk(clk),
	.d(bd_q_4_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][4]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][4] .is_wysiwyg = "true";
defparam \bdtemp_q[4][4] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][4]~11 (
	.dataa(\bdtemp_q[4][4]~q ),
	.datab(bdprev_q_4_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][4]~11_combout ),
	.cout());
defparam \bdprev_q[4][4]~11 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][4]~11 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][5] (
	.clk(clk),
	.d(bd_q_5_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][5]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][5] .is_wysiwyg = "true";
defparam \bdtemp_q[3][5] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][5]~15 (
	.dataa(\bdtemp_q[3][5]~q ),
	.datab(bdprev_q_5_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][5]~15_combout ),
	.cout());
defparam \bdprev_q[3][5]~15 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][5]~15 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][5] (
	.clk(clk),
	.d(bd_q_5_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][5]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][5] .is_wysiwyg = "true";
defparam \bdtemp_q[2][5] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][5]~13 (
	.dataa(\bdtemp_q[2][5]~q ),
	.datab(bdprev_q_5_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][5]~13_combout ),
	.cout());
defparam \bdprev_q[2][5]~13 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][5]~13 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][5] (
	.clk(clk),
	.d(bd_q_5_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][5]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][5] .is_wysiwyg = "true";
defparam \bdtemp_q[4][5] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][5]~14 (
	.dataa(\bdtemp_q[4][5]~q ),
	.datab(bdprev_q_5_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][5]~14_combout ),
	.cout());
defparam \bdprev_q[4][5]~14 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][5]~14 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][6] (
	.clk(clk),
	.d(bd_q_6_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][6]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][6] .is_wysiwyg = "true";
defparam \bdtemp_q[3][6] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][6]~18 (
	.dataa(\bdtemp_q[3][6]~q ),
	.datab(bdprev_q_6_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][6]~18_combout ),
	.cout());
defparam \bdprev_q[3][6]~18 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][6]~18 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][6] (
	.clk(clk),
	.d(bd_q_6_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][6]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][6] .is_wysiwyg = "true";
defparam \bdtemp_q[2][6] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][6]~16 (
	.dataa(\bdtemp_q[2][6]~q ),
	.datab(bdprev_q_6_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][6]~16_combout ),
	.cout());
defparam \bdprev_q[2][6]~16 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][6]~16 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][6] (
	.clk(clk),
	.d(bd_q_6_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][6]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][6] .is_wysiwyg = "true";
defparam \bdtemp_q[4][6] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][6]~17 (
	.dataa(\bdtemp_q[4][6]~q ),
	.datab(bdprev_q_6_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][6]~17_combout ),
	.cout());
defparam \bdprev_q[4][6]~17 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][6]~17 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][7] (
	.clk(clk),
	.d(bd_q_7_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][7]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][7] .is_wysiwyg = "true";
defparam \bdtemp_q[3][7] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][7]~21 (
	.dataa(\bdtemp_q[3][7]~q ),
	.datab(bdprev_q_7_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][7]~21_combout ),
	.cout());
defparam \bdprev_q[3][7]~21 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][7]~21 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][7] (
	.clk(clk),
	.d(bd_q_7_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][7]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][7] .is_wysiwyg = "true";
defparam \bdtemp_q[2][7] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][7]~19 (
	.dataa(\bdtemp_q[2][7]~q ),
	.datab(bdprev_q_7_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][7]~19_combout ),
	.cout());
defparam \bdprev_q[2][7]~19 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][7]~19 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][7] (
	.clk(clk),
	.d(bd_q_7_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][7]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][7] .is_wysiwyg = "true";
defparam \bdtemp_q[4][7] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][7]~20 (
	.dataa(\bdtemp_q[4][7]~q ),
	.datab(bdprev_q_7_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][7]~20_combout ),
	.cout());
defparam \bdprev_q[4][7]~20 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][7]~20 .sum_lutc_input = "datac";

dffeas \bdtemp_q[3][8] (
	.clk(clk),
	.d(bd_q_8_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[3][8]~q ),
	.prn(vcc));
defparam \bdtemp_q[3][8] .is_wysiwyg = "true";
defparam \bdtemp_q[3][8] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[3][8]~24 (
	.dataa(\bdtemp_q[3][8]~q ),
	.datab(bdprev_q_8_2),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[3][8]~24_combout ),
	.cout());
defparam \bdprev_q[3][8]~24 .lut_mask = 16'hAACC;
defparam \bdprev_q[3][8]~24 .sum_lutc_input = "datac";

dffeas \bdtemp_q[2][8] (
	.clk(clk),
	.d(bd_q_8_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[2][8]~q ),
	.prn(vcc));
defparam \bdtemp_q[2][8] .is_wysiwyg = "true";
defparam \bdtemp_q[2][8] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[2][8]~22 (
	.dataa(\bdtemp_q[2][8]~q ),
	.datab(bdprev_q_8_1),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[2][8]~22_combout ),
	.cout());
defparam \bdprev_q[2][8]~22 .lut_mask = 16'hAACC;
defparam \bdprev_q[2][8]~22 .sum_lutc_input = "datac";

dffeas \bdtemp_q[4][8] (
	.clk(clk),
	.d(bd_q_8_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[4][8]~q ),
	.prn(vcc));
defparam \bdtemp_q[4][8] .is_wysiwyg = "true";
defparam \bdtemp_q[4][8] .power_up = "low";

cycloneive_lcell_comb \bdprev_q[4][8]~23 (
	.dataa(\bdtemp_q[4][8]~q ),
	.datab(bdprev_q_8_3),
	.datac(gnd),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_q[4][8]~23_combout ),
	.cout());
defparam \bdprev_q[4][8]~23 .lut_mask = 16'hAACC;
defparam \bdprev_q[4][8]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector5~1 (
	.dataa(\state.S12~q ),
	.datab(\Selector5~0_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector5~1_combout ),
	.cout());
defparam \Selector5~1 .lut_mask = 16'hEEEE;
defparam \Selector5~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bdprev_d[1][2]~0 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\state.S2~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][2]~0_combout ),
	.cout());
defparam \bdprev_d[1][2]~0 .lut_mask = 16'h7FFF;
defparam \bdprev_d[1][2]~0 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][2] (
	.clk(clk),
	.d(bd_q_2_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][2]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][2] .is_wysiwyg = "true";
defparam \bdtemp_q[1][2] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][2]~1 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_2_2),
	.datac(\bdtemp_q[1][2]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][2]~1_combout ),
	.cout());
defparam \bdprev_d[1][2]~1 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][2]~1 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][3] (
	.clk(clk),
	.d(bd_q_3_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][3]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][3] .is_wysiwyg = "true";
defparam \bdtemp_q[1][3] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][3]~2 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_3_2),
	.datac(\bdtemp_q[1][3]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][3]~2_combout ),
	.cout());
defparam \bdprev_d[1][3]~2 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][3]~2 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][4] (
	.clk(clk),
	.d(bd_q_4_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][4]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][4] .is_wysiwyg = "true";
defparam \bdtemp_q[1][4] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][4]~3 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_4_2),
	.datac(\bdtemp_q[1][4]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][4]~3_combout ),
	.cout());
defparam \bdprev_d[1][4]~3 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][4]~3 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][5] (
	.clk(clk),
	.d(bd_q_5_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][5]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][5] .is_wysiwyg = "true";
defparam \bdtemp_q[1][5] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][5]~4 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_5_2),
	.datac(\bdtemp_q[1][5]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][5]~4_combout ),
	.cout());
defparam \bdprev_d[1][5]~4 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][5]~4 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][6] (
	.clk(clk),
	.d(bd_q_6_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][6]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][6] .is_wysiwyg = "true";
defparam \bdtemp_q[1][6] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][6]~5 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_6_2),
	.datac(\bdtemp_q[1][6]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][6]~5_combout ),
	.cout());
defparam \bdprev_d[1][6]~5 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][6]~5 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][7] (
	.clk(clk),
	.d(bd_q_7_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][7]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][7] .is_wysiwyg = "true";
defparam \bdtemp_q[1][7] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][7]~6 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_7_2),
	.datac(\bdtemp_q[1][7]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][7]~6_combout ),
	.cout());
defparam \bdprev_d[1][7]~6 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][7]~6 .sum_lutc_input = "datac";

dffeas \bdtemp_q[1][8] (
	.clk(clk),
	.d(bd_q_8_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr8~0_combout ),
	.q(\bdtemp_q[1][8]~q ),
	.prn(vcc));
defparam \bdtemp_q[1][8] .is_wysiwyg = "true";
defparam \bdtemp_q[1][8] .power_up = "low";

cycloneive_lcell_comb \bdprev_d[1][8]~7 (
	.dataa(\bdprev_d[1][2]~0_combout ),
	.datab(bdprev_q_8_2),
	.datac(\bdtemp_q[1][8]~q ),
	.datad(\state.S12~q ),
	.cin(gnd),
	.combout(\bdprev_d[1][8]~7_combout ),
	.cout());
defparam \bdprev_d[1][8]~7 .lut_mask = 16'hFAFC;
defparam \bdprev_d[1][8]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Add1~0 (
	.dataa(llnum_q_1),
	.datab(\mloop[1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add1~0_combout ),
	.cout(\Add1~1 ));
defparam \Add1~0 .lut_mask = 16'h66DD;
defparam \Add1~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Add1~2 (
	.dataa(llnum_q_2),
	.datab(\mloop[2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~1 ),
	.combout(\Add1~2_combout ),
	.cout(\Add1~3 ));
defparam \Add1~2 .lut_mask = 16'h96BF;
defparam \Add1~2 .sum_lutc_input = "cin";

cycloneive_lcell_comb \llnum_d[2] (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\Add1~2_combout ),
	.cin(gnd),
	.combout(\llnum_d[2]~combout ),
	.cout());
defparam \llnum_d[2] .lut_mask = 16'h7FFF;
defparam \llnum_d[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \llnum~0 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\state.S6~q ),
	.cin(gnd),
	.combout(\llnum~0_combout ),
	.cout());
defparam \llnum~0 .lut_mask = 16'hFFFE;
defparam \llnum~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \llnum_d[1] (
	.dataa(\Add1~0_combout ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\llnum_d[1]~combout ),
	.cout());
defparam \llnum_d[1] .lut_mask = 16'hBFFF;
defparam \llnum_d[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \Add1~4 (
	.dataa(llnum_q_3),
	.datab(\mloop[3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~3 ),
	.combout(\Add1~4_combout ),
	.cout(\Add1~5 ));
defparam \Add1~4 .lut_mask = 16'h96DF;
defparam \Add1~4 .sum_lutc_input = "cin";

cycloneive_lcell_comb \Add1~6 (
	.dataa(llnum_q_4),
	.datab(\mloop[4]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add1~5 ),
	.combout(\Add1~6_combout ),
	.cout());
defparam \Add1~6 .lut_mask = 16'h9696;
defparam \Add1~6 .sum_lutc_input = "cin";

cycloneive_lcell_comb \llnum_d[4] (
	.dataa(\Add1~6_combout ),
	.datab(\Add1~2_combout ),
	.datac(\Add1~4_combout ),
	.datad(\bms_clear~5_combout ),
	.cin(gnd),
	.combout(\llnum_d[4]~combout ),
	.cout());
defparam \llnum_d[4] .lut_mask = 16'h96FF;
defparam \llnum_d[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \llnum_d[3] (
	.dataa(\Add1~2_combout ),
	.datab(\Add1~4_combout ),
	.datac(\bms_clear~0_combout ),
	.datad(\bms_clear~4_combout ),
	.cin(gnd),
	.combout(\llnum_d[3]~combout ),
	.cout());
defparam \llnum_d[3] .lut_mask = 16'h6FFF;
defparam \llnum_d[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][2] (
	.dataa(bd_q_2_1),
	.datab(\g13:1:gf_mul1|c[2]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][2]~combout ),
	.cout());
defparam \bd_d[1][2] .lut_mask = 16'h6FFF;
defparam \bd_d[1][2] .sum_lutc_input = "datac";

dffeas \omsel[1] (
	.clk(clk),
	.d(\bms_clear~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omsel[1]~q ),
	.prn(vcc));
defparam \omsel[1] .is_wysiwyg = "true";
defparam \omsel[1] .power_up = "low";

cycloneive_lcell_comb \bd~0 (
	.dataa(\omsel[1]~q ),
	.datab(\state.S12~q ),
	.datac(\state.S11~q ),
	.datad(\state.S5~q ),
	.cin(gnd),
	.combout(\bd~0_combout ),
	.cout());
defparam \bd~0 .lut_mask = 16'hFFFE;
defparam \bd~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd~1 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~4_combout ),
	.datac(\state.S10~q ),
	.datad(\bd~0_combout ),
	.cin(gnd),
	.combout(\bd~1_combout ),
	.cout());
defparam \bd~1 .lut_mask = 16'hFFFE;
defparam \bd~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][2] (
	.dataa(bd_q_2_3),
	.datab(\g13:3:gf_mul1|c[2]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][2]~combout ),
	.cout());
defparam \bd_d[3][2] .lut_mask = 16'h6FFF;
defparam \bd_d[3][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \omsel~1 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~1_combout ),
	.datac(\bms_clear~3_combout ),
	.datad(\omsel[1]~q ),
	.cin(gnd),
	.combout(\omsel~1_combout ),
	.cout());
defparam \omsel~1 .lut_mask = 16'h7FFF;
defparam \omsel~1 .sum_lutc_input = "datac";

dffeas \omsel[2] (
	.clk(clk),
	.d(\omsel~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omsel[2]~q ),
	.prn(vcc));
defparam \omsel[2] .is_wysiwyg = "true";
defparam \omsel[2] .power_up = "low";

cycloneive_lcell_comb \omsel~0 (
	.dataa(\omsel[2]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\omsel~0_combout ),
	.cout());
defparam \omsel~0 .lut_mask = 16'hBFFF;
defparam \omsel~0 .sum_lutc_input = "datac";

dffeas \omsel[3] (
	.clk(clk),
	.d(\omsel~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omsel[3]~q ),
	.prn(vcc));
defparam \omsel[3] .is_wysiwyg = "true";
defparam \omsel[3] .power_up = "low";

cycloneive_lcell_comb \bd~2 (
	.dataa(\state.S12~q ),
	.datab(\state.S11~q ),
	.datac(\state.S5~q ),
	.datad(\omsel[3]~q ),
	.cin(gnd),
	.combout(\bd~2_combout ),
	.cout());
defparam \bd~2 .lut_mask = 16'hFEFF;
defparam \bd~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd~3 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~4_combout ),
	.datac(\state.S10~q ),
	.datad(\bd~2_combout ),
	.cin(gnd),
	.combout(\bd~3_combout ),
	.cout());
defparam \bd~3 .lut_mask = 16'hFFFE;
defparam \bd~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][2] (
	.dataa(bd_q_2_2),
	.datab(\g13:2:gf_mul1|c[2]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][2]~combout ),
	.cout());
defparam \bd_d[2][2] .lut_mask = 16'h6FFF;
defparam \bd_d[2][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd~4 (
	.dataa(\state.S12~q ),
	.datab(\state.S11~q ),
	.datac(\state.S5~q ),
	.datad(\omsel[2]~q ),
	.cin(gnd),
	.combout(\bd~4_combout ),
	.cout());
defparam \bd~4 .lut_mask = 16'hFEFF;
defparam \bd~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd~5 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~4_combout ),
	.datac(\state.S10~q ),
	.datad(\bd~4_combout ),
	.cin(gnd),
	.combout(\bd~5_combout ),
	.cout());
defparam \bd~5 .lut_mask = 16'hFFFE;
defparam \bd~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][2] (
	.dataa(bd_q_2_4),
	.datab(\g13:4:gf_mul1|c[2]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][2]~combout ),
	.cout());
defparam \bd_d[4][2] .lut_mask = 16'h6FFF;
defparam \bd_d[4][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \omsel~2 (
	.dataa(\omsel[3]~q ),
	.datab(\bms_clear~0_combout ),
	.datac(\bms_clear~1_combout ),
	.datad(\bms_clear~3_combout ),
	.cin(gnd),
	.combout(\omsel~2_combout ),
	.cout());
defparam \omsel~2 .lut_mask = 16'hBFFF;
defparam \omsel~2 .sum_lutc_input = "datac";

dffeas \omsel[4] (
	.clk(clk),
	.d(\omsel~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cnt_omegaloop~0_combout ),
	.q(\omsel[4]~q ),
	.prn(vcc));
defparam \omsel[4] .is_wysiwyg = "true";
defparam \omsel[4] .power_up = "low";

cycloneive_lcell_comb \bd~6 (
	.dataa(\state.S12~q ),
	.datab(\state.S11~q ),
	.datac(\state.S5~q ),
	.datad(\omsel[4]~q ),
	.cin(gnd),
	.combout(\bd~6_combout ),
	.cout());
defparam \bd~6 .lut_mask = 16'hFEFF;
defparam \bd~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd~7 (
	.dataa(\bms_clear~0_combout ),
	.datab(\bms_clear~4_combout ),
	.datac(\state.S10~q ),
	.datad(\bd~6_combout ),
	.cin(gnd),
	.combout(\bd~7_combout ),
	.cout());
defparam \bd~7 .lut_mask = 16'hFFFE;
defparam \bd~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][1] (
	.dataa(bd_q_1_1),
	.datab(\g13:1:gf_mul1|c[1]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][1]~combout ),
	.cout());
defparam \bd_d[1][1] .lut_mask = 16'h6FFF;
defparam \bd_d[1][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][1] (
	.dataa(bd_q_1_3),
	.datab(\g13:3:gf_mul1|c[1]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][1]~combout ),
	.cout());
defparam \bd_d[3][1] .lut_mask = 16'h6FFF;
defparam \bd_d[3][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][1] (
	.dataa(bd_q_1_2),
	.datab(\g13:2:gf_mul1|c[1]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][1]~combout ),
	.cout());
defparam \bd_d[2][1] .lut_mask = 16'h6FFF;
defparam \bd_d[2][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][1] (
	.dataa(bd_q_1_4),
	.datab(\g13:4:gf_mul1|c[1]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][1]~combout ),
	.cout());
defparam \bd_d[4][1] .lut_mask = 16'h6FFF;
defparam \bd_d[4][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][3] (
	.dataa(bd_q_3_1),
	.datab(\g13:1:gf_mul1|c[3]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][3]~combout ),
	.cout());
defparam \bd_d[1][3] .lut_mask = 16'h6FFF;
defparam \bd_d[1][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][3] (
	.dataa(bd_q_3_3),
	.datab(\g13:3:gf_mul1|c[3]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][3]~combout ),
	.cout());
defparam \bd_d[3][3] .lut_mask = 16'h6FFF;
defparam \bd_d[3][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][3] (
	.dataa(bd_q_3_2),
	.datab(\g13:2:gf_mul1|c[3]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][3]~combout ),
	.cout());
defparam \bd_d[2][3] .lut_mask = 16'h6FFF;
defparam \bd_d[2][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][3] (
	.dataa(bd_q_3_4),
	.datab(\g13:4:gf_mul1|c[3]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][3]~combout ),
	.cout());
defparam \bd_d[4][3] .lut_mask = 16'h6FFF;
defparam \bd_d[4][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][4] (
	.dataa(bd_q_4_1),
	.datab(\g13:1:gf_mul1|c[4]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][4]~combout ),
	.cout());
defparam \bd_d[1][4] .lut_mask = 16'h6FFF;
defparam \bd_d[1][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][4] (
	.dataa(bd_q_4_3),
	.datab(\g13:3:gf_mul1|c[4]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][4]~combout ),
	.cout());
defparam \bd_d[3][4] .lut_mask = 16'h6FFF;
defparam \bd_d[3][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][4] (
	.dataa(bd_q_4_2),
	.datab(\g13:2:gf_mul1|c[4]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][4]~combout ),
	.cout());
defparam \bd_d[2][4] .lut_mask = 16'h6FFF;
defparam \bd_d[2][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][4] (
	.dataa(bd_q_4_4),
	.datab(\g13:4:gf_mul1|c[4]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][4]~combout ),
	.cout());
defparam \bd_d[4][4] .lut_mask = 16'h6FFF;
defparam \bd_d[4][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][5] (
	.dataa(bd_q_5_1),
	.datab(\g13:1:gf_mul1|c[5]~11_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][5]~combout ),
	.cout());
defparam \bd_d[1][5] .lut_mask = 16'h6FFF;
defparam \bd_d[1][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][5] (
	.dataa(bd_q_5_3),
	.datab(\g13:3:gf_mul1|c[5]~11_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][5]~combout ),
	.cout());
defparam \bd_d[3][5] .lut_mask = 16'h6FFF;
defparam \bd_d[3][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][5] (
	.dataa(bd_q_5_2),
	.datab(\g13:2:gf_mul1|c[5]~10_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][5]~combout ),
	.cout());
defparam \bd_d[2][5] .lut_mask = 16'h6FFF;
defparam \bd_d[2][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][5] (
	.dataa(bd_q_5_4),
	.datab(\g13:4:gf_mul1|c[5]~combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][5]~combout ),
	.cout());
defparam \bd_d[4][5] .lut_mask = 16'h6FFF;
defparam \bd_d[4][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][6] (
	.dataa(bd_q_6_1),
	.datab(\g13:1:gf_mul1|c[6]~16_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][6]~combout ),
	.cout());
defparam \bd_d[1][6] .lut_mask = 16'h6FFF;
defparam \bd_d[1][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][6] (
	.dataa(bd_q_6_3),
	.datab(\g13:3:gf_mul1|c[6]~16_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][6]~combout ),
	.cout());
defparam \bd_d[3][6] .lut_mask = 16'h6FFF;
defparam \bd_d[3][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][6] (
	.dataa(bd_q_6_2),
	.datab(\g13:2:gf_mul1|c[6]~16_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][6]~combout ),
	.cout());
defparam \bd_d[2][6] .lut_mask = 16'h6FFF;
defparam \bd_d[2][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][6] (
	.dataa(bd_q_6_4),
	.datab(\g13:4:gf_mul1|c[6]~13_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][6]~combout ),
	.cout());
defparam \bd_d[4][6] .lut_mask = 16'h6FFF;
defparam \bd_d[4][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][7] (
	.dataa(bd_q_7_1),
	.datab(\g13:1:gf_mul1|c[7]~22_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][7]~combout ),
	.cout());
defparam \bd_d[1][7] .lut_mask = 16'h6FFF;
defparam \bd_d[1][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][7] (
	.dataa(bd_q_7_3),
	.datab(\g13:3:gf_mul1|c[7]~22_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][7]~combout ),
	.cout());
defparam \bd_d[3][7] .lut_mask = 16'h6FFF;
defparam \bd_d[3][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][7] (
	.dataa(bd_q_7_2),
	.datab(\g13:2:gf_mul1|c[7]~22_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][7]~combout ),
	.cout());
defparam \bd_d[2][7] .lut_mask = 16'h6FFF;
defparam \bd_d[2][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][7] (
	.dataa(bd_q_7_4),
	.datab(\g13:4:gf_mul1|c[7]~19_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][7]~combout ),
	.cout());
defparam \bd_d[4][7] .lut_mask = 16'h6FFF;
defparam \bd_d[4][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[1][8] (
	.dataa(bd_q_8_1),
	.datab(\g13:1:gf_mul1|c[8]~28_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[1][8]~combout ),
	.cout());
defparam \bd_d[1][8] .lut_mask = 16'h6FFF;
defparam \bd_d[1][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[3][8] (
	.dataa(bd_q_8_3),
	.datab(\g13:3:gf_mul1|c[8]~28_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[3][8]~combout ),
	.cout());
defparam \bd_d[3][8] .lut_mask = 16'h6FFF;
defparam \bd_d[3][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[2][8] (
	.dataa(bd_q_8_2),
	.datab(\g13:2:gf_mul1|c[8]~28_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[2][8]~combout ),
	.cout());
defparam \bd_d[2][8] .lut_mask = 16'h6FFF;
defparam \bd_d[2][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \bd_d[4][8] (
	.dataa(bd_q_8_4),
	.datab(\g13:4:gf_mul1|c[8]~25_combout ),
	.datac(\bms_clear~5_combout ),
	.datad(\state.S10~q ),
	.cin(gnd),
	.combout(\bd_d[4][8]~combout ),
	.cout());
defparam \bd_d[4][8] .lut_mask = 16'h6FFF;
defparam \bd_d[4][8] .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfdiv (
	delta_q_8,
	delta_q_7,
	delta_q_6,
	delta_q_5,
	delta_q_4,
	delta_q_3,
	delta_q_2,
	delta_q_1,
	c_7,
	c_8,
	c_4,
	c_3,
	c_6,
	c_5,
	c_1,
	c_2,
	ena_one,
	d,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
input 	delta_q_8;
input 	delta_q_7;
input 	delta_q_6;
input 	delta_q_5;
input 	delta_q_4;
input 	delta_q_3;
input 	delta_q_2;
input 	delta_q_1;
output 	c_7;
output 	c_8;
output 	c_4;
output 	c_3;
output 	c_6;
output 	c_5;
output 	c_1;
output 	c_2;
input 	ena_one;
input 	[8:1] d;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \rom|auto_generated|q_a[6] ;
wire \rom|auto_generated|q_a[5] ;
wire \rom|auto_generated|q_a[7] ;
wire \rom|auto_generated|q_a[4] ;
wire \rom|auto_generated|q_a[3] ;
wire \rom|auto_generated|q_a[1] ;
wire \rom|auto_generated|q_a[0] ;
wire \rom|auto_generated|q_a[2] ;
wire \b_q[7]~q ;
wire \b_q[6]~q ;
wire \b_q[8]~q ;
wire \b_q[5]~q ;
wire \b_q[4]~q ;
wire \b_q[2]~q ;
wire \b_q[1]~q ;
wire \b_q[3]~q ;


RS_DE_LANE_QUATUS_auk_rs_gfmul gf_mul(
	.delta_q_8(delta_q_8),
	.delta_q_7(delta_q_7),
	.delta_q_6(delta_q_6),
	.delta_q_5(delta_q_5),
	.delta_q_4(delta_q_4),
	.delta_q_3(delta_q_3),
	.delta_q_2(delta_q_2),
	.delta_q_1(delta_q_1),
	.b_q_7(\b_q[7]~q ),
	.b_q_6(\b_q[6]~q ),
	.b_q_8(\b_q[8]~q ),
	.b_q_5(\b_q[5]~q ),
	.b_q_4(\b_q[4]~q ),
	.b_q_2(\b_q[2]~q ),
	.b_q_1(\b_q[1]~q ),
	.b_q_3(\b_q[3]~q ),
	.c_7(c_7),
	.c_8(c_8),
	.c_4(c_4),
	.c_3(c_3),
	.c_6(c_6),
	.c_5(c_5),
	.c_1(c_1),
	.c_2(c_2));

RS_DE_LANE_QUATUS_altsyncram_1 rom(
	.q_a({\rom|auto_generated|q_a[7] ,\rom|auto_generated|q_a[6] ,\rom|auto_generated|q_a[5] ,\rom|auto_generated|q_a[4] ,\rom|auto_generated|q_a[3] ,\rom|auto_generated|q_a[2] ,\rom|auto_generated|q_a[1] ,\rom|auto_generated|q_a[0] }),
	.clocken0(ena_one),
	.address_a({gnd,gnd,d[8],d[7],d[6],d[5],d[4],d[3],d[2],d[1]}),
	.clock0(clk));

dffeas \b_q[7] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[6] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[7]~q ),
	.prn(vcc));
defparam \b_q[7] .is_wysiwyg = "true";
defparam \b_q[7] .power_up = "low";

dffeas \b_q[6] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[5] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[6]~q ),
	.prn(vcc));
defparam \b_q[6] .is_wysiwyg = "true";
defparam \b_q[6] .power_up = "low";

dffeas \b_q[8] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[7] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[8]~q ),
	.prn(vcc));
defparam \b_q[8] .is_wysiwyg = "true";
defparam \b_q[8] .power_up = "low";

dffeas \b_q[5] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[4] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[5]~q ),
	.prn(vcc));
defparam \b_q[5] .is_wysiwyg = "true";
defparam \b_q[5] .power_up = "low";

dffeas \b_q[4] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[3] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[4]~q ),
	.prn(vcc));
defparam \b_q[4] .is_wysiwyg = "true";
defparam \b_q[4] .power_up = "low";

dffeas \b_q[2] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[1] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[2]~q ),
	.prn(vcc));
defparam \b_q[2] .is_wysiwyg = "true";
defparam \b_q[2] .power_up = "low";

dffeas \b_q[1] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[0] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[1]~q ),
	.prn(vcc));
defparam \b_q[1] .is_wysiwyg = "true";
defparam \b_q[1] .power_up = "low";

dffeas \b_q[3] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[2] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[3]~q ),
	.prn(vcc));
defparam \b_q[3] .is_wysiwyg = "true";
defparam \b_q[3] .power_up = "low";

endmodule

module RS_DE_LANE_QUATUS_altsyncram_1 (
	q_a,
	clocken0,
	address_a,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_a;
input 	clocken0;
input 	[9:0] address_a;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



RS_DE_LANE_QUATUS_altsyncram_udq3 auto_generated(
	.q_a({q_a[7],q_a[6],q_a[5],q_a[4],q_a[3],q_a[2],q_a[1],q_a[0]}),
	.clocken0(clocken0),
	.address_a({address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clock0(clock0));

endmodule

module RS_DE_LANE_QUATUS_altsyncram_udq3 (
	q_a,
	clocken0,
	address_a,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_a;
input 	clocken0;
input 	[7:0] address_a;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a6_PORTADATAOUT_bus;
wire [143:0] ram_block1a5_PORTADATAOUT_bus;
wire [143:0] ram_block1a7_PORTADATAOUT_bus;
wire [143:0] ram_block1a4_PORTADATAOUT_bus;
wire [143:0] ram_block1a3_PORTADATAOUT_bus;
wire [143:0] ram_block1a1_PORTADATAOUT_bus;
wire [143:0] ram_block1a0_PORTADATAOUT_bus;
wire [143:0] ram_block1a2_PORTADATAOUT_bus;

assign q_a[6] = ram_block1a6_PORTADATAOUT_bus[0];

assign q_a[5] = ram_block1a5_PORTADATAOUT_bus[0];

assign q_a[7] = ram_block1a7_PORTADATAOUT_bus[0];

assign q_a[4] = ram_block1a4_PORTADATAOUT_bus[0];

assign q_a[3] = ram_block1a3_PORTADATAOUT_bus[0];

assign q_a[1] = ram_block1a1_PORTADATAOUT_bus[0];

assign q_a[0] = ram_block1a0_PORTADATAOUT_bus[0];

assign q_a[2] = ram_block1a2_PORTADATAOUT_bus[0];

cycloneive_ram_block ram_block1a6(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a6_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a6.clk0_core_clock_enable = "ena0";
defparam ram_block1a6.clk0_input_clock_enable = "ena0";
defparam ram_block1a6.data_interleave_offset_in_bits = 1;
defparam ram_block1a6.data_interleave_width_in_bits = 1;
defparam ram_block1a6.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a6.init_file_layout = "port_a";
defparam ram_block1a6.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a6.operation_mode = "rom";
defparam ram_block1a6.port_a_address_clear = "none";
defparam ram_block1a6.port_a_address_width = 8;
defparam ram_block1a6.port_a_data_out_clear = "none";
defparam ram_block1a6.port_a_data_out_clock = "none";
defparam ram_block1a6.port_a_data_width = 1;
defparam ram_block1a6.port_a_first_address = 0;
defparam ram_block1a6.port_a_first_bit_number = 6;
defparam ram_block1a6.port_a_last_address = 255;
defparam ram_block1a6.port_a_logical_ram_depth = 256;
defparam ram_block1a6.port_a_logical_ram_width = 8;
defparam ram_block1a6.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.ram_block_type = "auto";
defparam ram_block1a6.mem_init0 = 256'hFFCB97CC0EFE2F120B3E0168428EB172E3FA25AE8E84602E85E58B3B46DF4458;

cycloneive_ram_block ram_block1a5(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a5_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a5.clk0_core_clock_enable = "ena0";
defparam ram_block1a5.clk0_input_clock_enable = "ena0";
defparam ram_block1a5.data_interleave_offset_in_bits = 1;
defparam ram_block1a5.data_interleave_width_in_bits = 1;
defparam ram_block1a5.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a5.init_file_layout = "port_a";
defparam ram_block1a5.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a5.operation_mode = "rom";
defparam ram_block1a5.port_a_address_clear = "none";
defparam ram_block1a5.port_a_address_width = 8;
defparam ram_block1a5.port_a_data_out_clear = "none";
defparam ram_block1a5.port_a_data_out_clock = "none";
defparam ram_block1a5.port_a_data_width = 1;
defparam ram_block1a5.port_a_first_address = 0;
defparam ram_block1a5.port_a_first_bit_number = 5;
defparam ram_block1a5.port_a_last_address = 255;
defparam ram_block1a5.port_a_logical_ram_depth = 256;
defparam ram_block1a5.port_a_logical_ram_width = 8;
defparam ram_block1a5.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.ram_block_type = "auto";
defparam ram_block1a5.mem_init0 = 256'hFC0FFFEE0E1BE67CCAFECA109420AED4CAB1FC1148C725459A1CD15790B231E8;

cycloneive_ram_block ram_block1a7(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a7_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a7.clk0_core_clock_enable = "ena0";
defparam ram_block1a7.clk0_input_clock_enable = "ena0";
defparam ram_block1a7.data_interleave_offset_in_bits = 1;
defparam ram_block1a7.data_interleave_width_in_bits = 1;
defparam ram_block1a7.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a7.init_file_layout = "port_a";
defparam ram_block1a7.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a7.operation_mode = "rom";
defparam ram_block1a7.port_a_address_clear = "none";
defparam ram_block1a7.port_a_address_width = 8;
defparam ram_block1a7.port_a_data_out_clear = "none";
defparam ram_block1a7.port_a_data_out_clock = "none";
defparam ram_block1a7.port_a_data_width = 1;
defparam ram_block1a7.port_a_first_address = 0;
defparam ram_block1a7.port_a_first_bit_number = 7;
defparam ram_block1a7.port_a_last_address = 255;
defparam ram_block1a7.port_a_logical_ram_depth = 256;
defparam ram_block1a7.port_a_logical_ram_width = 8;
defparam ram_block1a7.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.ram_block_type = "auto";
defparam ram_block1a7.mem_init0 = 256'hA6EF4DFC90DC53E4F1F7D12EDE3280E4F97A2E341618825C9C3222823B15AFAC;

cycloneive_ram_block ram_block1a4(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a4_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a4.clk0_core_clock_enable = "ena0";
defparam ram_block1a4.clk0_input_clock_enable = "ena0";
defparam ram_block1a4.data_interleave_offset_in_bits = 1;
defparam ram_block1a4.data_interleave_width_in_bits = 1;
defparam ram_block1a4.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a4.init_file_layout = "port_a";
defparam ram_block1a4.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a4.operation_mode = "rom";
defparam ram_block1a4.port_a_address_clear = "none";
defparam ram_block1a4.port_a_address_width = 8;
defparam ram_block1a4.port_a_data_out_clear = "none";
defparam ram_block1a4.port_a_data_out_clock = "none";
defparam ram_block1a4.port_a_data_width = 1;
defparam ram_block1a4.port_a_first_address = 0;
defparam ram_block1a4.port_a_first_bit_number = 4;
defparam ram_block1a4.port_a_last_address = 255;
defparam ram_block1a4.port_a_logical_ram_depth = 256;
defparam ram_block1a4.port_a_logical_ram_width = 8;
defparam ram_block1a4.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.ram_block_type = "auto";
defparam ram_block1a4.mem_init0 = 256'hFA444FABDFDAABABB860DA150EB3929BCBEE895A5121991F4180472C072BDEC8;

cycloneive_ram_block ram_block1a3(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a3_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a3.clk0_core_clock_enable = "ena0";
defparam ram_block1a3.clk0_input_clock_enable = "ena0";
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a3.init_file_layout = "port_a";
defparam ram_block1a3.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.operation_mode = "rom";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 8;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 255;
defparam ram_block1a3.port_a_logical_ram_depth = 256;
defparam ram_block1a3.port_a_logical_ram_width = 8;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.ram_block_type = "auto";
defparam ram_block1a3.mem_init0 = 256'hF4A891027815E8A268DC7F0537FB2939E9F9669C242D0E263C8FACC7C2697FC4;

cycloneive_ram_block ram_block1a1(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a1_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a1.clk0_core_clock_enable = "ena0";
defparam ram_block1a1.clk0_input_clock_enable = "ena0";
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a1.init_file_layout = "port_a";
defparam ram_block1a1.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.operation_mode = "rom";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 8;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 255;
defparam ram_block1a1.port_a_logical_ram_depth = 256;
defparam ram_block1a1.port_a_logical_ram_width = 8;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.ram_block_type = "auto";
defparam ram_block1a1.mem_init0 = 256'h717BC55626E88FC1ECFDC36EC15A54014F60CD4E7D22BC7316ACFCA0E2A2A0F4;

cycloneive_ram_block ram_block1a0(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a0_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a0.clk0_core_clock_enable = "ena0";
defparam ram_block1a0.clk0_input_clock_enable = "ena0";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a0.init_file_layout = "port_a";
defparam ram_block1a0.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.operation_mode = "rom";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 8;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 255;
defparam ram_block1a0.port_a_logical_ram_depth = 256;
defparam ram_block1a0.port_a_logical_ram_width = 8;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.ram_block_type = "auto";
defparam ram_block1a0.mem_init0 = 256'hB8F734A2D273325E1DDB8684655ABF0D2BBE4EDADFD2E40ADC26640E64005732;

cycloneive_ram_block ram_block1a2(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(clocken0),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a2_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a2.clk0_core_clock_enable = "ena0";
defparam ram_block1a2.clk0_input_clock_enable = "ena0";
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a2.init_file_layout = "port_a";
defparam ram_block1a2.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_bms_atl:\\key_full:key|auk_rs_gfdiv:gf_div1|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.operation_mode = "rom";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 8;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 255;
defparam ram_block1a2.port_a_logical_ram_depth = 256;
defparam ram_block1a2.port_a_logical_ram_width = 8;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.ram_block_type = "auto";
defparam ram_block1a2.mem_init0 = 256'hFA261A1704C8329CD7C7DDDD5EEE8C7AF60066E3704878EB649C946306E0D73C;

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul (
	delta_q_8,
	delta_q_7,
	delta_q_6,
	delta_q_5,
	delta_q_4,
	delta_q_3,
	delta_q_2,
	delta_q_1,
	b_q_7,
	b_q_6,
	b_q_8,
	b_q_5,
	b_q_4,
	b_q_2,
	b_q_1,
	b_q_3,
	c_7,
	c_8,
	c_4,
	c_3,
	c_6,
	c_5,
	c_1,
	c_2)/* synthesis synthesis_greybox=1 */;
input 	delta_q_8;
input 	delta_q_7;
input 	delta_q_6;
input 	delta_q_5;
input 	delta_q_4;
input 	delta_q_3;
input 	delta_q_2;
input 	delta_q_1;
input 	b_q_7;
input 	b_q_6;
input 	b_q_8;
input 	b_q_5;
input 	b_q_4;
input 	b_q_2;
input 	b_q_1;
input 	b_q_3;
output 	c_7;
output 	c_8;
output 	c_4;
output 	c_3;
output 	c_6;
output 	c_5;
output 	c_1;
output 	c_2;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \logic:total[8][13]~0_combout ;
wire \logic:total[8][13]~1_combout ;
wire \logic:total[8][12]~0_combout ;
wire \logic:total[8][12]~1_combout ;
wire \c[7]~0_combout ;
wire \logic:extra[5][9]~0_combout ;
wire \logic:extra[5][9]~1_combout ;
wire \logic:extra[5][9]~2_combout ;
wire \c[7]~1_combout ;
wire \c[7]~2_combout ;
wire \c[7]~3_combout ;
wire \c[7]~4_combout ;
wire \c[8]~6_combout ;
wire \logic:total[8][14]~combout ;
wire \c[8]~7_combout ;
wire \c[8]~8_combout ;
wire \c[8]~9_combout ;
wire \c[8]~10_combout ;
wire \logic:extra[6][9]~0_combout ;
wire \logic:extra[7][9]~0_combout ;
wire \logic:extra[7][9]~1_combout ;
wire \logic:extra[7][9]~2_combout ;
wire \logic:extra[7][9]~3_combout ;
wire \logic:extra[7][9]~combout ;
wire \logic:extra[6][9]~1_combout ;
wire \logic:extra[6][9]~2_combout ;
wire \logic:extra[6][9]~3_combout ;
wire \logic:extra[6][9]~4_combout ;
wire \c[6]~12_combout ;
wire \c[4]~13_combout ;
wire \c[4]~14_combout ;
wire \c[3]~15_combout ;
wire \c[3]~16_combout ;
wire \logic:total[8][15]~combout ;
wire \c[6]~17_combout ;
wire \c[6]~18_combout ;
wire \c[6]~19_combout ;
wire \c[6]~20_combout ;
wire \c[5]~22_combout ;
wire \c[5]~23_combout ;
wire \c[5]~24_combout ;
wire \c[2]~26_combout ;


cycloneive_lcell_comb \c[7]~5 (
	.dataa(\c[7]~0_combout ),
	.datab(\logic:extra[5][9]~2_combout ),
	.datac(\c[7]~1_combout ),
	.datad(\c[7]~4_combout ),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~5 .lut_mask = 16'h6996;
defparam \c[7]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~11 (
	.dataa(\c[7]~0_combout ),
	.datab(\c[8]~6_combout ),
	.datac(\c[8]~10_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~11 .lut_mask = 16'h9696;
defparam \c[8]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(\logic:extra[7][9]~combout ),
	.datab(\c[6]~12_combout ),
	.datac(\c[4]~13_combout ),
	.datad(\c[4]~14_combout ),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(delta_q_1),
	.datab(b_q_3),
	.datac(\c[3]~15_combout ),
	.datad(\c[3]~16_combout ),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~21 (
	.dataa(\logic:total[8][15]~combout ),
	.datab(\c[6]~12_combout ),
	.datac(\logic:extra[5][9]~2_combout ),
	.datad(\c[6]~20_combout ),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~21 .lut_mask = 16'h6996;
defparam \c[6]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~25 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~4_combout ),
	.datac(\c[3]~15_combout ),
	.datad(\c[5]~24_combout ),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~25 .lut_mask = 16'h6996;
defparam \c[5]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1] (
	.dataa(gnd),
	.datab(\logic:extra[7][9]~combout ),
	.datac(delta_q_1),
	.datad(b_q_1),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1] .lut_mask = 16'hC33C;
defparam \c[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\logic:extra[6][9]~4_combout ),
	.datad(\c[2]~26_combout ),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h0FF0;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~0 (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_7),
	.datad(b_q_6),
	.cin(gnd),
	.combout(\logic:total[8][13]~0_combout ),
	.cout());
defparam \logic:total[8][13]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][13]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~1 (
	.dataa(gnd),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(delta_q_6),
	.datad(b_q_8),
	.cin(gnd),
	.combout(\logic:total[8][13]~1_combout ),
	.cout());
defparam \logic:total[8][13]~1 .lut_mask = 16'hC33C;
defparam \logic:total[8][13]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~0 (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_6),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\logic:total[8][12]~0_combout ),
	.cout());
defparam \logic:total[8][12]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~1 (
	.dataa(delta_q_6),
	.datab(delta_q_5),
	.datac(b_q_8),
	.datad(b_q_7),
	.cin(gnd),
	.combout(\logic:total[8][12]~1_combout ),
	.cout());
defparam \logic:total[8][12]~1 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~0 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[7]~0_combout ),
	.cout());
defparam \c[7]~0 .lut_mask = 16'h9696;
defparam \c[7]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~0 (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_5),
	.datad(b_q_4),
	.cin(gnd),
	.combout(\logic:extra[5][9]~0_combout ),
	.cout());
defparam \logic:extra[5][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~1 (
	.dataa(delta_q_6),
	.datab(delta_q_5),
	.datac(b_q_7),
	.datad(b_q_6),
	.cin(gnd),
	.combout(\logic:extra[5][9]~1_combout ),
	.cout());
defparam \logic:extra[5][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~2 (
	.dataa(delta_q_4),
	.datab(b_q_8),
	.datac(\logic:extra[5][9]~0_combout ),
	.datad(\logic:extra[5][9]~1_combout ),
	.cin(gnd),
	.combout(\logic:extra[5][9]~2_combout ),
	.cout());
defparam \logic:extra[5][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~1 (
	.dataa(delta_q_7),
	.datab(delta_q_6),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[7]~1_combout ),
	.cout());
defparam \c[7]~1 .lut_mask = 16'h6996;
defparam \c[7]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~2 (
	.dataa(delta_q_5),
	.datab(delta_q_4),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\c[7]~2_combout ),
	.cout());
defparam \c[7]~2 .lut_mask = 16'h6996;
defparam \c[7]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~3 (
	.dataa(delta_q_3),
	.datab(delta_q_2),
	.datac(b_q_6),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\c[7]~3_combout ),
	.cout());
defparam \c[7]~3 .lut_mask = 16'h6996;
defparam \c[7]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~4 (
	.dataa(delta_q_1),
	.datab(b_q_7),
	.datac(\c[7]~2_combout ),
	.datad(\c[7]~3_combout ),
	.cin(gnd),
	.combout(\c[7]~4_combout ),
	.cout());
defparam \c[7]~4 .lut_mask = 16'h6996;
defparam \c[7]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~6 (
	.dataa(delta_q_2),
	.datab(delta_q_1),
	.datac(b_q_8),
	.datad(b_q_7),
	.cin(gnd),
	.combout(\c[8]~6_combout ),
	.cout());
defparam \c[8]~6 .lut_mask = 16'h6996;
defparam \c[8]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][14] (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_8),
	.datad(b_q_7),
	.cin(gnd),
	.combout(\logic:total[8][14]~combout ),
	.cout());
defparam \logic:total[8][14] .lut_mask = 16'h6996;
defparam \logic:total[8][14] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~7 (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[8]~7_combout ),
	.cout());
defparam \c[8]~7 .lut_mask = 16'h6996;
defparam \c[8]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~8 (
	.dataa(delta_q_6),
	.datab(delta_q_5),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\c[8]~8_combout ),
	.cout());
defparam \c[8]~8 .lut_mask = 16'h6996;
defparam \c[8]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~9 (
	.dataa(delta_q_4),
	.datab(delta_q_3),
	.datac(b_q_6),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\c[8]~9_combout ),
	.cout());
defparam \c[8]~9 .lut_mask = 16'h6996;
defparam \c[8]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~10 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[8]~7_combout ),
	.datac(\c[8]~8_combout ),
	.datad(\c[8]~9_combout ),
	.cin(gnd),
	.combout(\c[8]~10_combout ),
	.cout());
defparam \c[8]~10 .lut_mask = 16'h6996;
defparam \c[8]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~0 (
	.dataa(delta_q_7),
	.datab(b_q_7),
	.datac(delta_q_8),
	.datad(b_q_8),
	.cin(gnd),
	.combout(\logic:extra[6][9]~0_combout ),
	.cout());
defparam \logic:extra[6][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~0 (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_3),
	.datad(b_q_2),
	.cin(gnd),
	.combout(\logic:extra[7][9]~0_combout ),
	.cout());
defparam \logic:extra[7][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~1 (
	.dataa(delta_q_6),
	.datab(delta_q_5),
	.datac(b_q_5),
	.datad(b_q_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~1_combout ),
	.cout());
defparam \logic:extra[7][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~2 (
	.dataa(delta_q_4),
	.datab(delta_q_3),
	.datac(b_q_7),
	.datad(b_q_6),
	.cin(gnd),
	.combout(\logic:extra[7][9]~2_combout ),
	.cout());
defparam \logic:extra[7][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~3 (
	.dataa(delta_q_2),
	.datab(b_q_8),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(\logic:extra[7][9]~2_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~3_combout ),
	.cout());
defparam \logic:extra[7][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9] (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~0_combout ),
	.datac(\logic:extra[7][9]~0_combout ),
	.datad(\logic:extra[7][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~combout ),
	.cout());
defparam \logic:extra[7][9] .lut_mask = 16'h6996;
defparam \logic:extra[7][9] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~1 (
	.dataa(delta_q_8),
	.datab(delta_q_7),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\logic:extra[6][9]~1_combout ),
	.cout());
defparam \logic:extra[6][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~2 (
	.dataa(delta_q_6),
	.datab(delta_q_5),
	.datac(b_q_6),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\logic:extra[6][9]~2_combout ),
	.cout());
defparam \logic:extra[6][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~3 (
	.dataa(delta_q_4),
	.datab(delta_q_3),
	.datac(b_q_8),
	.datad(b_q_7),
	.cin(gnd),
	.combout(\logic:extra[6][9]~3_combout ),
	.cout());
defparam \logic:extra[6][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~4 (
	.dataa(\logic:extra[6][9]~0_combout ),
	.datab(\logic:extra[6][9]~1_combout ),
	.datac(\logic:extra[6][9]~2_combout ),
	.datad(\logic:extra[6][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[6][9]~4_combout ),
	.cout());
defparam \logic:extra[6][9]~4 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~12 (
	.dataa(\logic:total[8][12]~0_combout ),
	.datab(\logic:total[8][12]~1_combout ),
	.datac(\logic:extra[6][9]~4_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[6]~12_combout ),
	.cout());
defparam \c[6]~12 .lut_mask = 16'h9696;
defparam \c[6]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~13 (
	.dataa(delta_q_4),
	.datab(delta_q_3),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[4]~13_combout ),
	.cout());
defparam \c[4]~13 .lut_mask = 16'h6996;
defparam \c[4]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~14 (
	.dataa(delta_q_2),
	.datab(delta_q_1),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\c[4]~14_combout ),
	.cout());
defparam \c[4]~14 .lut_mask = 16'h6996;
defparam \c[4]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~15 (
	.dataa(delta_q_8),
	.datab(b_q_8),
	.datac(\logic:extra[7][9]~combout ),
	.datad(\logic:extra[5][9]~2_combout ),
	.cin(gnd),
	.combout(\c[3]~15_combout ),
	.cout());
defparam \c[3]~15 .lut_mask = 16'h6996;
defparam \c[3]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~16 (
	.dataa(delta_q_3),
	.datab(delta_q_2),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[3]~16_combout ),
	.cout());
defparam \c[3]~16 .lut_mask = 16'h6996;
defparam \c[3]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][15] (
	.dataa(delta_q_8),
	.datab(b_q_8),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:total[8][15]~combout ),
	.cout());
defparam \logic:total[8][15] .lut_mask = 16'hEEEE;
defparam \logic:total[8][15] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~17 (
	.dataa(delta_q_6),
	.datab(delta_q_5),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[6]~17_combout ),
	.cout());
defparam \c[6]~17 .lut_mask = 16'h6996;
defparam \c[6]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~18 (
	.dataa(delta_q_4),
	.datab(delta_q_3),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\c[6]~18_combout ),
	.cout());
defparam \c[6]~18 .lut_mask = 16'h6996;
defparam \c[6]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~19 (
	.dataa(delta_q_2),
	.datab(delta_q_1),
	.datac(b_q_6),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\c[6]~19_combout ),
	.cout());
defparam \c[6]~19 .lut_mask = 16'h6996;
defparam \c[6]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~20 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[6]~17_combout ),
	.datac(\c[6]~18_combout ),
	.datad(\c[6]~19_combout ),
	.cin(gnd),
	.combout(\c[6]~20_combout ),
	.cout());
defparam \c[6]~20 .lut_mask = 16'h6996;
defparam \c[6]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~22 (
	.dataa(delta_q_5),
	.datab(delta_q_4),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[5]~22_combout ),
	.cout());
defparam \c[5]~22 .lut_mask = 16'h6996;
defparam \c[5]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~23 (
	.dataa(delta_q_3),
	.datab(delta_q_2),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\c[5]~23_combout ),
	.cout());
defparam \c[5]~23 .lut_mask = 16'h6996;
defparam \c[5]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~24 (
	.dataa(delta_q_1),
	.datab(b_q_5),
	.datac(\c[5]~22_combout ),
	.datad(\c[5]~23_combout ),
	.cin(gnd),
	.combout(\c[5]~24_combout ),
	.cout());
defparam \c[5]~24 .lut_mask = 16'h6996;
defparam \c[5]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~26 (
	.dataa(delta_q_2),
	.datab(delta_q_1),
	.datac(b_q_2),
	.datad(b_q_1),
	.cin(gnd),
	.combout(\c[2]~26_combout ),
	.cout());
defparam \c[2]~26 .lut_mask = 16'h6996;
defparam \c[2]~26 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_1 (
	mulleft_q_7_1,
	mulleft_q_8_1,
	mulleft_q_6_1,
	mulleft_q_5_1,
	mulleft_q_4_1,
	mulleft_q_3_1,
	mulleft_q_1_1,
	mulleft_q_2_1,
	mulright_q_7_1,
	mulright_q_8_1,
	mulright_q_4_1,
	mulright_q_3_1,
	mulright_q_6_1,
	mulright_q_5_1,
	mulright_q_1_1,
	mulright_q_2_1,
	c_2,
	c_1,
	c_3,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8)/* synthesis synthesis_greybox=1 */;
input 	mulleft_q_7_1;
input 	mulleft_q_8_1;
input 	mulleft_q_6_1;
input 	mulleft_q_5_1;
input 	mulleft_q_4_1;
input 	mulleft_q_3_1;
input 	mulleft_q_1_1;
input 	mulleft_q_2_1;
input 	mulright_q_7_1;
input 	mulright_q_8_1;
input 	mulright_q_4_1;
input 	mulright_q_3_1;
input 	mulright_q_6_1;
input 	mulright_q_5_1;
input 	mulright_q_1_1;
input 	mulright_q_2_1;
output 	c_2;
output 	c_1;
output 	c_3;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \logic:extra[7][9]~0_combout ;
wire \logic:extra[6][9]~0_combout ;
wire \logic:extra[6][9]~1_combout ;
wire \logic:extra[6][9]~2_combout ;
wire \logic:extra[6][9]~3_combout ;
wire \c[2]~0_combout ;
wire \logic:total[8][13]~0_combout ;
wire \logic:total[8][13]~1_combout ;
wire \logic:extra[7][9]~1_combout ;
wire \logic:extra[7][9]~2_combout ;
wire \logic:extra[7][9]~3_combout ;
wire \logic:extra[7][9]~4_combout ;
wire \logic:extra[7][9]~combout ;
wire \logic:extra[5][9]~0_combout ;
wire \c[3]~1_combout ;
wire \logic:extra[5][9]~1_combout ;
wire \c[3]~2_combout ;
wire \c[3]~3_combout ;
wire \c[3]~4_combout ;
wire \c[4]~5_combout ;
wire \c[4]~6_combout ;
wire \logic:total[8][12]~0_combout ;
wire \logic:total[8][12]~1_combout ;
wire \c[6]~7_combout ;
wire \c[5]~8_combout ;
wire \c[5]~9_combout ;
wire \c[5]~10_combout ;
wire \logic:total[8][15]~combout ;
wire \logic:extra[5][9]~2_combout ;
wire \logic:total[8][14]~combout ;
wire \c[6]~12_combout ;
wire \c[6]~13_combout ;
wire \c[6]~14_combout ;
wire \c[6]~15_combout ;
wire \c[7]~17_combout ;
wire \c[7]~18_combout ;
wire \c[7]~19_combout ;
wire \c[7]~20_combout ;
wire \c[7]~21_combout ;
wire \c[8]~23_combout ;
wire \c[8]~24_combout ;
wire \c[8]~25_combout ;
wire \c[8]~26_combout ;
wire \c[8]~27_combout ;


cycloneive_lcell_comb \c[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\logic:extra[6][9]~3_combout ),
	.datad(\c[2]~0_combout ),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h0FF0;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1] (
	.dataa(gnd),
	.datab(\logic:extra[7][9]~combout ),
	.datac(mulright_q_1_1),
	.datad(mulleft_q_1_1),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1] .lut_mask = 16'hC33C;
defparam \c[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(mulleft_q_1_1),
	.datab(mulright_q_3_1),
	.datac(\c[3]~3_combout ),
	.datad(\c[3]~4_combout ),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(\logic:extra[7][9]~combout ),
	.datab(\c[4]~5_combout ),
	.datac(\c[4]~6_combout ),
	.datad(\c[6]~7_combout ),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~11 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~3_combout ),
	.datac(\c[3]~3_combout ),
	.datad(\c[5]~10_combout ),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~11 .lut_mask = 16'h6996;
defparam \c[5]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~16 (
	.dataa(\logic:total[8][15]~combout ),
	.datab(\logic:extra[5][9]~2_combout ),
	.datac(\c[6]~7_combout ),
	.datad(\c[6]~15_combout ),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~16 .lut_mask = 16'h6996;
defparam \c[6]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~22 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\c[7]~17_combout ),
	.datac(\c[7]~18_combout ),
	.datad(\c[7]~21_combout ),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~22 .lut_mask = 16'h6996;
defparam \c[7]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~28 (
	.dataa(\c[7]~17_combout ),
	.datab(\c[8]~23_combout ),
	.datac(\c[8]~27_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~28 .lut_mask = 16'h9696;
defparam \c[8]~28 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~0 (
	.dataa(mulright_q_7_1),
	.datab(mulleft_q_7_1),
	.datac(mulright_q_8_1),
	.datad(mulleft_q_8_1),
	.cin(gnd),
	.combout(\logic:extra[7][9]~0_combout ),
	.cout());
defparam \logic:extra[7][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~0 (
	.dataa(mulleft_q_8_1),
	.datab(mulleft_q_7_1),
	.datac(mulright_q_4_1),
	.datad(mulright_q_3_1),
	.cin(gnd),
	.combout(\logic:extra[6][9]~0_combout ),
	.cout());
defparam \logic:extra[6][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~1 (
	.dataa(mulleft_q_6_1),
	.datab(mulright_q_6_1),
	.datac(mulleft_q_5_1),
	.datad(mulright_q_5_1),
	.cin(gnd),
	.combout(\logic:extra[6][9]~1_combout ),
	.cout());
defparam \logic:extra[6][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~2 (
	.dataa(mulright_q_8_1),
	.datab(mulright_q_7_1),
	.datac(mulleft_q_4_1),
	.datad(mulleft_q_3_1),
	.cin(gnd),
	.combout(\logic:extra[6][9]~2_combout ),
	.cout());
defparam \logic:extra[6][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~3 (
	.dataa(\logic:extra[7][9]~0_combout ),
	.datab(\logic:extra[6][9]~0_combout ),
	.datac(\logic:extra[6][9]~1_combout ),
	.datad(\logic:extra[6][9]~2_combout ),
	.cin(gnd),
	.combout(\logic:extra[6][9]~3_combout ),
	.cout());
defparam \logic:extra[6][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~0 (
	.dataa(mulright_q_1_1),
	.datab(mulleft_q_1_1),
	.datac(mulright_q_2_1),
	.datad(mulleft_q_2_1),
	.cin(gnd),
	.combout(\c[2]~0_combout ),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h6996;
defparam \c[2]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~0 (
	.dataa(mulright_q_6_1),
	.datab(mulright_q_7_1),
	.datac(mulleft_q_7_1),
	.datad(mulleft_q_8_1),
	.cin(gnd),
	.combout(\logic:total[8][13]~0_combout ),
	.cout());
defparam \logic:total[8][13]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][13]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~1 (
	.dataa(gnd),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(mulright_q_8_1),
	.datad(mulleft_q_6_1),
	.cin(gnd),
	.combout(\logic:total[8][13]~1_combout ),
	.cout());
defparam \logic:total[8][13]~1 .lut_mask = 16'hC33C;
defparam \logic:total[8][13]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~1 (
	.dataa(mulleft_q_8_1),
	.datab(mulleft_q_7_1),
	.datac(mulright_q_3_1),
	.datad(mulright_q_2_1),
	.cin(gnd),
	.combout(\logic:extra[7][9]~1_combout ),
	.cout());
defparam \logic:extra[7][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~2 (
	.dataa(mulleft_q_6_1),
	.datab(mulright_q_5_1),
	.datac(mulleft_q_5_1),
	.datad(mulright_q_4_1),
	.cin(gnd),
	.combout(\logic:extra[7][9]~2_combout ),
	.cout());
defparam \logic:extra[7][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~3 (
	.dataa(mulright_q_6_1),
	.datab(mulright_q_7_1),
	.datac(mulleft_q_3_1),
	.datad(mulleft_q_4_1),
	.cin(gnd),
	.combout(\logic:extra[7][9]~3_combout ),
	.cout());
defparam \logic:extra[7][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~4 (
	.dataa(mulright_q_8_1),
	.datab(mulleft_q_2_1),
	.datac(\logic:extra[7][9]~2_combout ),
	.datad(\logic:extra[7][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~4_combout ),
	.cout());
defparam \logic:extra[7][9]~4 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9] (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[7][9]~0_combout ),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(\logic:extra[7][9]~4_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~combout ),
	.cout());
defparam \logic:extra[7][9] .lut_mask = 16'h6996;
defparam \logic:extra[7][9] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~0 (
	.dataa(mulleft_q_6_1),
	.datab(mulright_q_7_1),
	.datac(mulleft_q_5_1),
	.datad(mulright_q_6_1),
	.cin(gnd),
	.combout(\logic:extra[5][9]~0_combout ),
	.cout());
defparam \logic:extra[5][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~1 (
	.dataa(mulright_q_8_1),
	.datab(mulleft_q_8_1),
	.datac(mulleft_q_4_1),
	.datad(\logic:extra[5][9]~0_combout ),
	.cin(gnd),
	.combout(\c[3]~1_combout ),
	.cout());
defparam \c[3]~1 .lut_mask = 16'h6996;
defparam \c[3]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~1 (
	.dataa(mulleft_q_8_1),
	.datab(mulleft_q_7_1),
	.datac(mulright_q_5_1),
	.datad(mulright_q_4_1),
	.cin(gnd),
	.combout(\logic:extra[5][9]~1_combout ),
	.cout());
defparam \logic:extra[5][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(\logic:extra[7][9]~0_combout ),
	.datab(\logic:extra[7][9]~1_combout ),
	.datac(\logic:extra[5][9]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[3]~2_combout ),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h9696;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~3 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[7][9]~4_combout ),
	.datac(\c[3]~1_combout ),
	.datad(\c[3]~2_combout ),
	.cin(gnd),
	.combout(\c[3]~3_combout ),
	.cout());
defparam \c[3]~3 .lut_mask = 16'h6996;
defparam \c[3]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~4 (
	.dataa(mulright_q_1_1),
	.datab(mulright_q_2_1),
	.datac(mulleft_q_2_1),
	.datad(mulleft_q_3_1),
	.cin(gnd),
	.combout(\c[3]~4_combout ),
	.cout());
defparam \c[3]~4 .lut_mask = 16'h6996;
defparam \c[3]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~5 (
	.dataa(mulright_q_1_1),
	.datab(mulright_q_2_1),
	.datac(mulleft_q_3_1),
	.datad(mulleft_q_4_1),
	.cin(gnd),
	.combout(\c[4]~5_combout ),
	.cout());
defparam \c[4]~5 .lut_mask = 16'h6996;
defparam \c[4]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~6 (
	.dataa(mulleft_q_1_1),
	.datab(mulright_q_3_1),
	.datac(mulleft_q_2_1),
	.datad(mulright_q_4_1),
	.cin(gnd),
	.combout(\c[4]~6_combout ),
	.cout());
defparam \c[4]~6 .lut_mask = 16'h6996;
defparam \c[4]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~0 (
	.dataa(mulright_q_6_1),
	.datab(mulleft_q_8_1),
	.datac(mulright_q_5_1),
	.datad(mulleft_q_7_1),
	.cin(gnd),
	.combout(\logic:total[8][12]~0_combout ),
	.cout());
defparam \logic:total[8][12]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~1 (
	.dataa(mulright_q_8_1),
	.datab(mulleft_q_6_1),
	.datac(mulright_q_7_1),
	.datad(mulleft_q_5_1),
	.cin(gnd),
	.combout(\logic:total[8][12]~1_combout ),
	.cout());
defparam \logic:total[8][12]~1 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~7 (
	.dataa(\logic:extra[6][9]~3_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[6]~7_combout ),
	.cout());
defparam \c[6]~7 .lut_mask = 16'h9696;
defparam \c[6]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~8 (
	.dataa(mulright_q_1_1),
	.datab(mulright_q_2_1),
	.datac(mulleft_q_4_1),
	.datad(mulleft_q_5_1),
	.cin(gnd),
	.combout(\c[5]~8_combout ),
	.cout());
defparam \c[5]~8 .lut_mask = 16'h6996;
defparam \c[5]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~9 (
	.dataa(mulright_q_3_1),
	.datab(mulright_q_4_1),
	.datac(mulleft_q_2_1),
	.datad(mulleft_q_3_1),
	.cin(gnd),
	.combout(\c[5]~9_combout ),
	.cout());
defparam \c[5]~9 .lut_mask = 16'h6996;
defparam \c[5]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~10 (
	.dataa(mulleft_q_1_1),
	.datab(mulright_q_5_1),
	.datac(\c[5]~8_combout ),
	.datad(\c[5]~9_combout ),
	.cin(gnd),
	.combout(\c[5]~10_combout ),
	.cout());
defparam \c[5]~10 .lut_mask = 16'h6996;
defparam \c[5]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][15] (
	.dataa(mulright_q_8_1),
	.datab(mulleft_q_8_1),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:total[8][15]~combout ),
	.cout());
defparam \logic:total[8][15] .lut_mask = 16'hEEEE;
defparam \logic:total[8][15] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~2 (
	.dataa(mulright_q_8_1),
	.datab(mulleft_q_4_1),
	.datac(\logic:extra[5][9]~1_combout ),
	.datad(\logic:extra[5][9]~0_combout ),
	.cin(gnd),
	.combout(\logic:extra[5][9]~2_combout ),
	.cout());
defparam \logic:extra[5][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][14] (
	.dataa(mulright_q_8_1),
	.datab(mulleft_q_8_1),
	.datac(mulright_q_7_1),
	.datad(mulleft_q_7_1),
	.cin(gnd),
	.combout(\logic:total[8][14]~combout ),
	.cout());
defparam \logic:total[8][14] .lut_mask = 16'h6996;
defparam \logic:total[8][14] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~12 (
	.dataa(mulright_q_1_1),
	.datab(mulright_q_2_1),
	.datac(mulleft_q_5_1),
	.datad(mulleft_q_6_1),
	.cin(gnd),
	.combout(\c[6]~12_combout ),
	.cout());
defparam \c[6]~12 .lut_mask = 16'h6996;
defparam \c[6]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~13 (
	.dataa(mulright_q_3_1),
	.datab(mulright_q_4_1),
	.datac(mulleft_q_3_1),
	.datad(mulleft_q_4_1),
	.cin(gnd),
	.combout(\c[6]~13_combout ),
	.cout());
defparam \c[6]~13 .lut_mask = 16'h6996;
defparam \c[6]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~14 (
	.dataa(mulleft_q_1_1),
	.datab(mulright_q_5_1),
	.datac(mulleft_q_2_1),
	.datad(mulright_q_6_1),
	.cin(gnd),
	.combout(\c[6]~14_combout ),
	.cout());
defparam \c[6]~14 .lut_mask = 16'h6996;
defparam \c[6]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~15 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[6]~12_combout ),
	.datac(\c[6]~13_combout ),
	.datad(\c[6]~14_combout ),
	.cin(gnd),
	.combout(\c[6]~15_combout ),
	.cout());
defparam \c[6]~15 .lut_mask = 16'h6996;
defparam \c[6]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~17 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[7]~17_combout ),
	.cout());
defparam \c[7]~17 .lut_mask = 16'h9696;
defparam \c[7]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~18 (
	.dataa(mulright_q_1_1),
	.datab(mulleft_q_6_1),
	.datac(mulright_q_2_1),
	.datad(mulleft_q_7_1),
	.cin(gnd),
	.combout(\c[7]~18_combout ),
	.cout());
defparam \c[7]~18 .lut_mask = 16'h6996;
defparam \c[7]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~19 (
	.dataa(mulright_q_3_1),
	.datab(mulright_q_4_1),
	.datac(mulleft_q_4_1),
	.datad(mulleft_q_5_1),
	.cin(gnd),
	.combout(\c[7]~19_combout ),
	.cout());
defparam \c[7]~19 .lut_mask = 16'h6996;
defparam \c[7]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~20 (
	.dataa(mulright_q_6_1),
	.datab(mulright_q_5_1),
	.datac(mulleft_q_3_1),
	.datad(mulleft_q_2_1),
	.cin(gnd),
	.combout(\c[7]~20_combout ),
	.cout());
defparam \c[7]~20 .lut_mask = 16'h6996;
defparam \c[7]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~21 (
	.dataa(mulleft_q_1_1),
	.datab(mulright_q_7_1),
	.datac(\c[7]~19_combout ),
	.datad(\c[7]~20_combout ),
	.cin(gnd),
	.combout(\c[7]~21_combout ),
	.cout());
defparam \c[7]~21 .lut_mask = 16'h6996;
defparam \c[7]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~23 (
	.dataa(mulleft_q_1_1),
	.datab(mulright_q_7_1),
	.datac(mulleft_q_2_1),
	.datad(mulright_q_8_1),
	.cin(gnd),
	.combout(\c[8]~23_combout ),
	.cout());
defparam \c[8]~23 .lut_mask = 16'h6996;
defparam \c[8]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~24 (
	.dataa(mulright_q_1_1),
	.datab(mulleft_q_7_1),
	.datac(mulright_q_2_1),
	.datad(mulleft_q_8_1),
	.cin(gnd),
	.combout(\c[8]~24_combout ),
	.cout());
defparam \c[8]~24 .lut_mask = 16'h6996;
defparam \c[8]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~25 (
	.dataa(mulleft_q_6_1),
	.datab(mulright_q_4_1),
	.datac(mulleft_q_5_1),
	.datad(mulright_q_3_1),
	.cin(gnd),
	.combout(\c[8]~25_combout ),
	.cout());
defparam \c[8]~25 .lut_mask = 16'h6996;
defparam \c[8]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~26 (
	.dataa(mulright_q_6_1),
	.datab(mulright_q_5_1),
	.datac(mulleft_q_4_1),
	.datad(mulleft_q_3_1),
	.cin(gnd),
	.combout(\c[8]~26_combout ),
	.cout());
defparam \c[8]~26 .lut_mask = 16'h6996;
defparam \c[8]~26 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~27 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[8]~24_combout ),
	.datac(\c[8]~25_combout ),
	.datad(\c[8]~26_combout ),
	.cin(gnd),
	.combout(\c[8]~27_combout ),
	.cout());
defparam \c[8]~27 .lut_mask = 16'h6996;
defparam \c[8]~27 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_2 (
	mulleft_q_7_2,
	mulleft_q_8_2,
	mulleft_q_6_2,
	mulleft_q_5_2,
	mulleft_q_4_2,
	mulleft_q_3_2,
	mulleft_q_1_2,
	mulright_q_1_2,
	mulleft_q_2_2,
	mulright_q_7_2,
	mulright_q_8_2,
	mulright_q_4_2,
	mulright_q_3_2,
	mulright_q_6_2,
	mulright_q_5_2,
	mulright_q_2_2,
	c_2,
	c_1,
	c_3,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8)/* synthesis synthesis_greybox=1 */;
input 	mulleft_q_7_2;
input 	mulleft_q_8_2;
input 	mulleft_q_6_2;
input 	mulleft_q_5_2;
input 	mulleft_q_4_2;
input 	mulleft_q_3_2;
input 	mulleft_q_1_2;
input 	mulright_q_1_2;
input 	mulleft_q_2_2;
input 	mulright_q_7_2;
input 	mulright_q_8_2;
input 	mulright_q_4_2;
input 	mulright_q_3_2;
input 	mulright_q_6_2;
input 	mulright_q_5_2;
input 	mulright_q_2_2;
output 	c_2;
output 	c_1;
output 	c_3;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \logic:extra[7][9]~0_combout ;
wire \logic:extra[6][9]~0_combout ;
wire \logic:extra[6][9]~1_combout ;
wire \logic:extra[6][9]~2_combout ;
wire \logic:extra[6][9]~3_combout ;
wire \c[2]~0_combout ;
wire \logic:total[8][13]~0_combout ;
wire \logic:total[8][13]~1_combout ;
wire \logic:extra[7][9]~1_combout ;
wire \logic:extra[7][9]~2_combout ;
wire \logic:extra[7][9]~3_combout ;
wire \logic:extra[7][9]~4_combout ;
wire \logic:extra[7][9]~combout ;
wire \logic:extra[5][9]~0_combout ;
wire \logic:extra[5][9]~1_combout ;
wire \logic:extra[5][9]~2_combout ;
wire \c[3]~1_combout ;
wire \c[3]~2_combout ;
wire \c[3]~3_combout ;
wire \c[4]~4_combout ;
wire \c[4]~5_combout ;
wire \logic:total[8][12]~0_combout ;
wire \logic:total[8][12]~1_combout ;
wire \c[6]~6_combout ;
wire \c[5]~7_combout ;
wire \c[5]~8_combout ;
wire \c[5]~9_combout ;
wire \c[6]~11_combout ;
wire \c[6]~12_combout ;
wire \c[6]~13_combout ;
wire \logic:total[8][14]~combout ;
wire \c[6]~14_combout ;
wire \c[6]~15_combout ;
wire \c[7]~17_combout ;
wire \c[7]~18_combout ;
wire \c[7]~19_combout ;
wire \c[7]~20_combout ;
wire \c[7]~21_combout ;
wire \c[8]~23_combout ;
wire \c[8]~24_combout ;
wire \c[8]~25_combout ;
wire \c[8]~26_combout ;
wire \c[8]~27_combout ;


cycloneive_lcell_comb \c[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\logic:extra[6][9]~3_combout ),
	.datad(\c[2]~0_combout ),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h0FF0;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1] (
	.dataa(gnd),
	.datab(\logic:extra[7][9]~combout ),
	.datac(mulleft_q_1_2),
	.datad(mulright_q_1_2),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1] .lut_mask = 16'hC33C;
defparam \c[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_3_2),
	.datac(\c[3]~2_combout ),
	.datad(\c[3]~3_combout ),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(\logic:extra[7][9]~combout ),
	.datab(\c[4]~4_combout ),
	.datac(\c[4]~5_combout ),
	.datad(\c[6]~6_combout ),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~10 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~3_combout ),
	.datac(\c[3]~2_combout ),
	.datad(\c[5]~9_combout ),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~10 .lut_mask = 16'h6996;
defparam \c[5]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~16 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\logic:extra[6][9]~3_combout ),
	.datac(\c[6]~13_combout ),
	.datad(\c[6]~15_combout ),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~16 .lut_mask = 16'h6996;
defparam \c[6]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~22 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\c[7]~17_combout ),
	.datac(\c[7]~18_combout ),
	.datad(\c[7]~21_combout ),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~22 .lut_mask = 16'h6996;
defparam \c[7]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~28 (
	.dataa(\c[7]~17_combout ),
	.datab(\c[8]~23_combout ),
	.datac(\c[8]~27_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~28 .lut_mask = 16'h9696;
defparam \c[8]~28 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~0 (
	.dataa(mulright_q_7_2),
	.datab(mulleft_q_7_2),
	.datac(mulright_q_8_2),
	.datad(mulleft_q_8_2),
	.cin(gnd),
	.combout(\logic:extra[7][9]~0_combout ),
	.cout());
defparam \logic:extra[7][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~0 (
	.dataa(mulleft_q_8_2),
	.datab(mulleft_q_7_2),
	.datac(mulright_q_4_2),
	.datad(mulright_q_3_2),
	.cin(gnd),
	.combout(\logic:extra[6][9]~0_combout ),
	.cout());
defparam \logic:extra[6][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~1 (
	.dataa(mulleft_q_6_2),
	.datab(mulright_q_6_2),
	.datac(mulleft_q_5_2),
	.datad(mulright_q_5_2),
	.cin(gnd),
	.combout(\logic:extra[6][9]~1_combout ),
	.cout());
defparam \logic:extra[6][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~2 (
	.dataa(mulright_q_8_2),
	.datab(mulright_q_7_2),
	.datac(mulleft_q_4_2),
	.datad(mulleft_q_3_2),
	.cin(gnd),
	.combout(\logic:extra[6][9]~2_combout ),
	.cout());
defparam \logic:extra[6][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~3 (
	.dataa(\logic:extra[7][9]~0_combout ),
	.datab(\logic:extra[6][9]~0_combout ),
	.datac(\logic:extra[6][9]~1_combout ),
	.datad(\logic:extra[6][9]~2_combout ),
	.cin(gnd),
	.combout(\logic:extra[6][9]~3_combout ),
	.cout());
defparam \logic:extra[6][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~0 (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_1_2),
	.datac(mulleft_q_2_2),
	.datad(mulright_q_2_2),
	.cin(gnd),
	.combout(\c[2]~0_combout ),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h6996;
defparam \c[2]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~0 (
	.dataa(mulright_q_6_2),
	.datab(mulright_q_7_2),
	.datac(mulleft_q_7_2),
	.datad(mulleft_q_8_2),
	.cin(gnd),
	.combout(\logic:total[8][13]~0_combout ),
	.cout());
defparam \logic:total[8][13]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][13]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~1 (
	.dataa(gnd),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(mulright_q_8_2),
	.datad(mulleft_q_6_2),
	.cin(gnd),
	.combout(\logic:total[8][13]~1_combout ),
	.cout());
defparam \logic:total[8][13]~1 .lut_mask = 16'hC33C;
defparam \logic:total[8][13]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~1 (
	.dataa(mulleft_q_8_2),
	.datab(mulleft_q_7_2),
	.datac(mulright_q_3_2),
	.datad(mulright_q_2_2),
	.cin(gnd),
	.combout(\logic:extra[7][9]~1_combout ),
	.cout());
defparam \logic:extra[7][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~2 (
	.dataa(mulleft_q_6_2),
	.datab(mulright_q_5_2),
	.datac(mulleft_q_5_2),
	.datad(mulright_q_4_2),
	.cin(gnd),
	.combout(\logic:extra[7][9]~2_combout ),
	.cout());
defparam \logic:extra[7][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~3 (
	.dataa(mulright_q_6_2),
	.datab(mulright_q_7_2),
	.datac(mulleft_q_3_2),
	.datad(mulleft_q_4_2),
	.cin(gnd),
	.combout(\logic:extra[7][9]~3_combout ),
	.cout());
defparam \logic:extra[7][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~4 (
	.dataa(mulright_q_8_2),
	.datab(mulleft_q_2_2),
	.datac(\logic:extra[7][9]~2_combout ),
	.datad(\logic:extra[7][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~4_combout ),
	.cout());
defparam \logic:extra[7][9]~4 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9] (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[7][9]~0_combout ),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(\logic:extra[7][9]~4_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~combout ),
	.cout());
defparam \logic:extra[7][9] .lut_mask = 16'h6996;
defparam \logic:extra[7][9] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~0 (
	.dataa(mulleft_q_8_2),
	.datab(mulleft_q_7_2),
	.datac(mulright_q_5_2),
	.datad(mulright_q_4_2),
	.cin(gnd),
	.combout(\logic:extra[5][9]~0_combout ),
	.cout());
defparam \logic:extra[5][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~1 (
	.dataa(mulleft_q_6_2),
	.datab(mulright_q_7_2),
	.datac(mulleft_q_5_2),
	.datad(mulright_q_6_2),
	.cin(gnd),
	.combout(\logic:extra[5][9]~1_combout ),
	.cout());
defparam \logic:extra[5][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~2 (
	.dataa(mulright_q_8_2),
	.datab(mulleft_q_4_2),
	.datac(\logic:extra[5][9]~0_combout ),
	.datad(\logic:extra[5][9]~1_combout ),
	.cin(gnd),
	.combout(\logic:extra[5][9]~2_combout ),
	.cout());
defparam \logic:extra[5][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~1 (
	.dataa(mulright_q_8_2),
	.datab(mulleft_q_8_2),
	.datac(\logic:extra[7][9]~0_combout ),
	.datad(\logic:extra[7][9]~1_combout ),
	.cin(gnd),
	.combout(\c[3]~1_combout ),
	.cout());
defparam \c[3]~1 .lut_mask = 16'h6996;
defparam \c[3]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\logic:total[8][13]~1_combout ),
	.datac(\logic:extra[7][9]~4_combout ),
	.datad(\c[3]~1_combout ),
	.cin(gnd),
	.combout(\c[3]~2_combout ),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h6996;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~3 (
	.dataa(mulright_q_1_2),
	.datab(mulright_q_2_2),
	.datac(mulleft_q_2_2),
	.datad(mulleft_q_3_2),
	.cin(gnd),
	.combout(\c[3]~3_combout ),
	.cout());
defparam \c[3]~3 .lut_mask = 16'h6996;
defparam \c[3]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~4 (
	.dataa(mulright_q_1_2),
	.datab(mulright_q_2_2),
	.datac(mulleft_q_3_2),
	.datad(mulleft_q_4_2),
	.cin(gnd),
	.combout(\c[4]~4_combout ),
	.cout());
defparam \c[4]~4 .lut_mask = 16'h6996;
defparam \c[4]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~5 (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_3_2),
	.datac(mulleft_q_2_2),
	.datad(mulright_q_4_2),
	.cin(gnd),
	.combout(\c[4]~5_combout ),
	.cout());
defparam \c[4]~5 .lut_mask = 16'h6996;
defparam \c[4]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~0 (
	.dataa(mulright_q_6_2),
	.datab(mulleft_q_8_2),
	.datac(mulright_q_5_2),
	.datad(mulleft_q_7_2),
	.cin(gnd),
	.combout(\logic:total[8][12]~0_combout ),
	.cout());
defparam \logic:total[8][12]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~1 (
	.dataa(mulright_q_8_2),
	.datab(mulleft_q_6_2),
	.datac(mulright_q_7_2),
	.datad(mulleft_q_5_2),
	.cin(gnd),
	.combout(\logic:total[8][12]~1_combout ),
	.cout());
defparam \logic:total[8][12]~1 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~6 (
	.dataa(\logic:extra[6][9]~3_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[6]~6_combout ),
	.cout());
defparam \c[6]~6 .lut_mask = 16'h9696;
defparam \c[6]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~7 (
	.dataa(mulright_q_1_2),
	.datab(mulright_q_2_2),
	.datac(mulleft_q_4_2),
	.datad(mulleft_q_5_2),
	.cin(gnd),
	.combout(\c[5]~7_combout ),
	.cout());
defparam \c[5]~7 .lut_mask = 16'h6996;
defparam \c[5]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~8 (
	.dataa(mulright_q_3_2),
	.datab(mulright_q_4_2),
	.datac(mulleft_q_2_2),
	.datad(mulleft_q_3_2),
	.cin(gnd),
	.combout(\c[5]~8_combout ),
	.cout());
defparam \c[5]~8 .lut_mask = 16'h6996;
defparam \c[5]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~9 (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_5_2),
	.datac(\c[5]~7_combout ),
	.datad(\c[5]~8_combout ),
	.cin(gnd),
	.combout(\c[5]~9_combout ),
	.cout());
defparam \c[5]~9 .lut_mask = 16'h6996;
defparam \c[5]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~11 (
	.dataa(mulright_q_3_2),
	.datab(mulright_q_4_2),
	.datac(mulleft_q_3_2),
	.datad(mulleft_q_4_2),
	.cin(gnd),
	.combout(\c[6]~11_combout ),
	.cout());
defparam \c[6]~11 .lut_mask = 16'h6996;
defparam \c[6]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~12 (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_5_2),
	.datac(mulleft_q_2_2),
	.datad(mulright_q_6_2),
	.cin(gnd),
	.combout(\c[6]~12_combout ),
	.cout());
defparam \c[6]~12 .lut_mask = 16'h6996;
defparam \c[6]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~13 (
	.dataa(\c[6]~11_combout ),
	.datab(\c[6]~12_combout ),
	.datac(mulright_q_8_2),
	.datad(mulleft_q_8_2),
	.cin(gnd),
	.combout(\c[6]~13_combout ),
	.cout());
defparam \c[6]~13 .lut_mask = 16'h6996;
defparam \c[6]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][14] (
	.dataa(mulright_q_8_2),
	.datab(mulleft_q_8_2),
	.datac(mulright_q_7_2),
	.datad(mulleft_q_7_2),
	.cin(gnd),
	.combout(\logic:total[8][14]~combout ),
	.cout());
defparam \logic:total[8][14] .lut_mask = 16'h6996;
defparam \logic:total[8][14] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~14 (
	.dataa(mulright_q_1_2),
	.datab(mulright_q_2_2),
	.datac(mulleft_q_5_2),
	.datad(mulleft_q_6_2),
	.cin(gnd),
	.combout(\c[6]~14_combout ),
	.cout());
defparam \c[6]~14 .lut_mask = 16'h6996;
defparam \c[6]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~15 (
	.dataa(\logic:total[8][12]~0_combout ),
	.datab(\logic:total[8][12]~1_combout ),
	.datac(\logic:total[8][14]~combout ),
	.datad(\c[6]~14_combout ),
	.cin(gnd),
	.combout(\c[6]~15_combout ),
	.cout());
defparam \c[6]~15 .lut_mask = 16'h6996;
defparam \c[6]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~17 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[7]~17_combout ),
	.cout());
defparam \c[7]~17 .lut_mask = 16'h9696;
defparam \c[7]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~18 (
	.dataa(mulright_q_1_2),
	.datab(mulleft_q_6_2),
	.datac(mulright_q_2_2),
	.datad(mulleft_q_7_2),
	.cin(gnd),
	.combout(\c[7]~18_combout ),
	.cout());
defparam \c[7]~18 .lut_mask = 16'h6996;
defparam \c[7]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~19 (
	.dataa(mulright_q_3_2),
	.datab(mulright_q_4_2),
	.datac(mulleft_q_4_2),
	.datad(mulleft_q_5_2),
	.cin(gnd),
	.combout(\c[7]~19_combout ),
	.cout());
defparam \c[7]~19 .lut_mask = 16'h6996;
defparam \c[7]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~20 (
	.dataa(mulright_q_6_2),
	.datab(mulright_q_5_2),
	.datac(mulleft_q_3_2),
	.datad(mulleft_q_2_2),
	.cin(gnd),
	.combout(\c[7]~20_combout ),
	.cout());
defparam \c[7]~20 .lut_mask = 16'h6996;
defparam \c[7]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~21 (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_7_2),
	.datac(\c[7]~19_combout ),
	.datad(\c[7]~20_combout ),
	.cin(gnd),
	.combout(\c[7]~21_combout ),
	.cout());
defparam \c[7]~21 .lut_mask = 16'h6996;
defparam \c[7]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~23 (
	.dataa(mulleft_q_1_2),
	.datab(mulright_q_7_2),
	.datac(mulleft_q_2_2),
	.datad(mulright_q_8_2),
	.cin(gnd),
	.combout(\c[8]~23_combout ),
	.cout());
defparam \c[8]~23 .lut_mask = 16'h6996;
defparam \c[8]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~24 (
	.dataa(mulright_q_1_2),
	.datab(mulleft_q_7_2),
	.datac(mulright_q_2_2),
	.datad(mulleft_q_8_2),
	.cin(gnd),
	.combout(\c[8]~24_combout ),
	.cout());
defparam \c[8]~24 .lut_mask = 16'h6996;
defparam \c[8]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~25 (
	.dataa(mulleft_q_6_2),
	.datab(mulright_q_4_2),
	.datac(mulleft_q_5_2),
	.datad(mulright_q_3_2),
	.cin(gnd),
	.combout(\c[8]~25_combout ),
	.cout());
defparam \c[8]~25 .lut_mask = 16'h6996;
defparam \c[8]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~26 (
	.dataa(mulright_q_6_2),
	.datab(mulright_q_5_2),
	.datac(mulleft_q_4_2),
	.datad(mulleft_q_3_2),
	.cin(gnd),
	.combout(\c[8]~26_combout ),
	.cout());
defparam \c[8]~26 .lut_mask = 16'h6996;
defparam \c[8]~26 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~27 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[8]~24_combout ),
	.datac(\c[8]~25_combout ),
	.datad(\c[8]~26_combout ),
	.cin(gnd),
	.combout(\c[8]~27_combout ),
	.cout());
defparam \c[8]~27 .lut_mask = 16'h6996;
defparam \c[8]~27 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_3 (
	mulleft_q_7_3,
	mulleft_q_8_3,
	mulleft_q_6_3,
	mulleft_q_5_3,
	mulleft_q_4_3,
	mulleft_q_3_3,
	mulleft_q_1_3,
	mulleft_q_2_3,
	mulright_q_7_3,
	mulright_q_8_3,
	mulright_q_4_3,
	mulright_q_3_3,
	mulright_q_6_3,
	mulright_q_5_3,
	mulright_q_1_3,
	mulright_q_2_3,
	c_2,
	c_1,
	c_3,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8)/* synthesis synthesis_greybox=1 */;
input 	mulleft_q_7_3;
input 	mulleft_q_8_3;
input 	mulleft_q_6_3;
input 	mulleft_q_5_3;
input 	mulleft_q_4_3;
input 	mulleft_q_3_3;
input 	mulleft_q_1_3;
input 	mulleft_q_2_3;
input 	mulright_q_7_3;
input 	mulright_q_8_3;
input 	mulright_q_4_3;
input 	mulright_q_3_3;
input 	mulright_q_6_3;
input 	mulright_q_5_3;
input 	mulright_q_1_3;
input 	mulright_q_2_3;
output 	c_2;
output 	c_1;
output 	c_3;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \logic:extra[7][9]~0_combout ;
wire \logic:extra[6][9]~0_combout ;
wire \logic:extra[6][9]~1_combout ;
wire \logic:extra[6][9]~2_combout ;
wire \logic:extra[6][9]~3_combout ;
wire \c[2]~0_combout ;
wire \logic:total[8][13]~0_combout ;
wire \logic:total[8][13]~1_combout ;
wire \logic:extra[7][9]~1_combout ;
wire \logic:extra[7][9]~2_combout ;
wire \logic:extra[7][9]~3_combout ;
wire \logic:extra[7][9]~4_combout ;
wire \logic:extra[7][9]~combout ;
wire \c[3]~1_combout ;
wire \logic:extra[5][9]~0_combout ;
wire \logic:extra[5][9]~1_combout ;
wire \c[3]~2_combout ;
wire \c[3]~3_combout ;
wire \c[3]~4_combout ;
wire \c[4]~5_combout ;
wire \c[4]~6_combout ;
wire \logic:total[8][12]~0_combout ;
wire \logic:total[8][12]~1_combout ;
wire \c[6]~7_combout ;
wire \c[5]~8_combout ;
wire \c[5]~9_combout ;
wire \c[5]~10_combout ;
wire \logic:total[8][15]~combout ;
wire \logic:extra[5][9]~2_combout ;
wire \logic:total[8][14]~combout ;
wire \c[6]~12_combout ;
wire \c[6]~13_combout ;
wire \c[6]~14_combout ;
wire \c[6]~15_combout ;
wire \c[7]~17_combout ;
wire \c[7]~18_combout ;
wire \c[7]~19_combout ;
wire \c[7]~20_combout ;
wire \c[7]~21_combout ;
wire \c[8]~23_combout ;
wire \c[8]~24_combout ;
wire \c[8]~25_combout ;
wire \c[8]~26_combout ;
wire \c[8]~27_combout ;


cycloneive_lcell_comb \c[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\logic:extra[6][9]~3_combout ),
	.datad(\c[2]~0_combout ),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h0FF0;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1] (
	.dataa(gnd),
	.datab(\logic:extra[7][9]~combout ),
	.datac(mulright_q_1_3),
	.datad(mulleft_q_1_3),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1] .lut_mask = 16'hC33C;
defparam \c[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(mulleft_q_1_3),
	.datab(mulright_q_3_3),
	.datac(\c[3]~3_combout ),
	.datad(\c[3]~4_combout ),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(\logic:extra[7][9]~combout ),
	.datab(\c[4]~5_combout ),
	.datac(\c[4]~6_combout ),
	.datad(\c[6]~7_combout ),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~11 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~3_combout ),
	.datac(\c[3]~3_combout ),
	.datad(\c[5]~10_combout ),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~11 .lut_mask = 16'h6996;
defparam \c[5]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~16 (
	.dataa(\logic:total[8][15]~combout ),
	.datab(\logic:extra[5][9]~2_combout ),
	.datac(\c[6]~7_combout ),
	.datad(\c[6]~15_combout ),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~16 .lut_mask = 16'h6996;
defparam \c[6]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~22 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\c[7]~17_combout ),
	.datac(\c[7]~18_combout ),
	.datad(\c[7]~21_combout ),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~22 .lut_mask = 16'h6996;
defparam \c[7]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~28 (
	.dataa(\c[7]~17_combout ),
	.datab(\c[8]~23_combout ),
	.datac(\c[8]~27_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~28 .lut_mask = 16'h9696;
defparam \c[8]~28 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~0 (
	.dataa(mulright_q_7_3),
	.datab(mulleft_q_7_3),
	.datac(mulright_q_8_3),
	.datad(mulleft_q_8_3),
	.cin(gnd),
	.combout(\logic:extra[7][9]~0_combout ),
	.cout());
defparam \logic:extra[7][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~0 (
	.dataa(mulleft_q_8_3),
	.datab(mulleft_q_7_3),
	.datac(mulright_q_4_3),
	.datad(mulright_q_3_3),
	.cin(gnd),
	.combout(\logic:extra[6][9]~0_combout ),
	.cout());
defparam \logic:extra[6][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~1 (
	.dataa(mulleft_q_6_3),
	.datab(mulright_q_6_3),
	.datac(mulleft_q_5_3),
	.datad(mulright_q_5_3),
	.cin(gnd),
	.combout(\logic:extra[6][9]~1_combout ),
	.cout());
defparam \logic:extra[6][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~2 (
	.dataa(mulright_q_8_3),
	.datab(mulright_q_7_3),
	.datac(mulleft_q_4_3),
	.datad(mulleft_q_3_3),
	.cin(gnd),
	.combout(\logic:extra[6][9]~2_combout ),
	.cout());
defparam \logic:extra[6][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~3 (
	.dataa(\logic:extra[7][9]~0_combout ),
	.datab(\logic:extra[6][9]~0_combout ),
	.datac(\logic:extra[6][9]~1_combout ),
	.datad(\logic:extra[6][9]~2_combout ),
	.cin(gnd),
	.combout(\logic:extra[6][9]~3_combout ),
	.cout());
defparam \logic:extra[6][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~0 (
	.dataa(mulright_q_1_3),
	.datab(mulleft_q_1_3),
	.datac(mulright_q_2_3),
	.datad(mulleft_q_2_3),
	.cin(gnd),
	.combout(\c[2]~0_combout ),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h6996;
defparam \c[2]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~0 (
	.dataa(mulright_q_6_3),
	.datab(mulright_q_7_3),
	.datac(mulleft_q_7_3),
	.datad(mulleft_q_8_3),
	.cin(gnd),
	.combout(\logic:total[8][13]~0_combout ),
	.cout());
defparam \logic:total[8][13]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][13]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~1 (
	.dataa(gnd),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(mulright_q_8_3),
	.datad(mulleft_q_6_3),
	.cin(gnd),
	.combout(\logic:total[8][13]~1_combout ),
	.cout());
defparam \logic:total[8][13]~1 .lut_mask = 16'hC33C;
defparam \logic:total[8][13]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~1 (
	.dataa(mulleft_q_8_3),
	.datab(mulleft_q_7_3),
	.datac(mulright_q_3_3),
	.datad(mulright_q_2_3),
	.cin(gnd),
	.combout(\logic:extra[7][9]~1_combout ),
	.cout());
defparam \logic:extra[7][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~2 (
	.dataa(mulleft_q_6_3),
	.datab(mulright_q_5_3),
	.datac(mulleft_q_5_3),
	.datad(mulright_q_4_3),
	.cin(gnd),
	.combout(\logic:extra[7][9]~2_combout ),
	.cout());
defparam \logic:extra[7][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~3 (
	.dataa(mulright_q_6_3),
	.datab(mulright_q_7_3),
	.datac(mulleft_q_3_3),
	.datad(mulleft_q_4_3),
	.cin(gnd),
	.combout(\logic:extra[7][9]~3_combout ),
	.cout());
defparam \logic:extra[7][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~4 (
	.dataa(mulright_q_8_3),
	.datab(mulleft_q_2_3),
	.datac(\logic:extra[7][9]~2_combout ),
	.datad(\logic:extra[7][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~4_combout ),
	.cout());
defparam \logic:extra[7][9]~4 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9] (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[7][9]~0_combout ),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(\logic:extra[7][9]~4_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~combout ),
	.cout());
defparam \logic:extra[7][9] .lut_mask = 16'h6996;
defparam \logic:extra[7][9] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~1 (
	.dataa(mulright_q_8_3),
	.datab(mulleft_q_8_3),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(mulleft_q_4_3),
	.cin(gnd),
	.combout(\c[3]~1_combout ),
	.cout());
defparam \c[3]~1 .lut_mask = 16'h6996;
defparam \c[3]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~0 (
	.dataa(mulleft_q_8_3),
	.datab(mulleft_q_7_3),
	.datac(mulright_q_5_3),
	.datad(mulright_q_4_3),
	.cin(gnd),
	.combout(\logic:extra[5][9]~0_combout ),
	.cout());
defparam \logic:extra[5][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~1 (
	.dataa(mulleft_q_6_3),
	.datab(mulright_q_7_3),
	.datac(mulleft_q_5_3),
	.datad(mulright_q_6_3),
	.cin(gnd),
	.combout(\logic:extra[5][9]~1_combout ),
	.cout());
defparam \logic:extra[5][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(\logic:extra[7][9]~0_combout ),
	.datab(\logic:extra[5][9]~0_combout ),
	.datac(\logic:extra[5][9]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[3]~2_combout ),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h9696;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~3 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[7][9]~4_combout ),
	.datac(\c[3]~1_combout ),
	.datad(\c[3]~2_combout ),
	.cin(gnd),
	.combout(\c[3]~3_combout ),
	.cout());
defparam \c[3]~3 .lut_mask = 16'h6996;
defparam \c[3]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~4 (
	.dataa(mulright_q_1_3),
	.datab(mulright_q_2_3),
	.datac(mulleft_q_2_3),
	.datad(mulleft_q_3_3),
	.cin(gnd),
	.combout(\c[3]~4_combout ),
	.cout());
defparam \c[3]~4 .lut_mask = 16'h6996;
defparam \c[3]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~5 (
	.dataa(mulright_q_1_3),
	.datab(mulright_q_2_3),
	.datac(mulleft_q_3_3),
	.datad(mulleft_q_4_3),
	.cin(gnd),
	.combout(\c[4]~5_combout ),
	.cout());
defparam \c[4]~5 .lut_mask = 16'h6996;
defparam \c[4]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~6 (
	.dataa(mulleft_q_1_3),
	.datab(mulright_q_3_3),
	.datac(mulleft_q_2_3),
	.datad(mulright_q_4_3),
	.cin(gnd),
	.combout(\c[4]~6_combout ),
	.cout());
defparam \c[4]~6 .lut_mask = 16'h6996;
defparam \c[4]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~0 (
	.dataa(mulright_q_6_3),
	.datab(mulleft_q_8_3),
	.datac(mulright_q_5_3),
	.datad(mulleft_q_7_3),
	.cin(gnd),
	.combout(\logic:total[8][12]~0_combout ),
	.cout());
defparam \logic:total[8][12]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~1 (
	.dataa(mulright_q_8_3),
	.datab(mulleft_q_6_3),
	.datac(mulright_q_7_3),
	.datad(mulleft_q_5_3),
	.cin(gnd),
	.combout(\logic:total[8][12]~1_combout ),
	.cout());
defparam \logic:total[8][12]~1 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~7 (
	.dataa(\logic:extra[6][9]~3_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[6]~7_combout ),
	.cout());
defparam \c[6]~7 .lut_mask = 16'h9696;
defparam \c[6]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~8 (
	.dataa(mulright_q_1_3),
	.datab(mulright_q_2_3),
	.datac(mulleft_q_4_3),
	.datad(mulleft_q_5_3),
	.cin(gnd),
	.combout(\c[5]~8_combout ),
	.cout());
defparam \c[5]~8 .lut_mask = 16'h6996;
defparam \c[5]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~9 (
	.dataa(mulright_q_3_3),
	.datab(mulright_q_4_3),
	.datac(mulleft_q_2_3),
	.datad(mulleft_q_3_3),
	.cin(gnd),
	.combout(\c[5]~9_combout ),
	.cout());
defparam \c[5]~9 .lut_mask = 16'h6996;
defparam \c[5]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~10 (
	.dataa(mulleft_q_1_3),
	.datab(mulright_q_5_3),
	.datac(\c[5]~8_combout ),
	.datad(\c[5]~9_combout ),
	.cin(gnd),
	.combout(\c[5]~10_combout ),
	.cout());
defparam \c[5]~10 .lut_mask = 16'h6996;
defparam \c[5]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][15] (
	.dataa(mulright_q_8_3),
	.datab(mulleft_q_8_3),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:total[8][15]~combout ),
	.cout());
defparam \logic:total[8][15] .lut_mask = 16'hEEEE;
defparam \logic:total[8][15] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~2 (
	.dataa(mulright_q_8_3),
	.datab(mulleft_q_4_3),
	.datac(\logic:extra[5][9]~0_combout ),
	.datad(\logic:extra[5][9]~1_combout ),
	.cin(gnd),
	.combout(\logic:extra[5][9]~2_combout ),
	.cout());
defparam \logic:extra[5][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][14] (
	.dataa(mulright_q_8_3),
	.datab(mulleft_q_8_3),
	.datac(mulright_q_7_3),
	.datad(mulleft_q_7_3),
	.cin(gnd),
	.combout(\logic:total[8][14]~combout ),
	.cout());
defparam \logic:total[8][14] .lut_mask = 16'h6996;
defparam \logic:total[8][14] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~12 (
	.dataa(mulright_q_1_3),
	.datab(mulright_q_2_3),
	.datac(mulleft_q_5_3),
	.datad(mulleft_q_6_3),
	.cin(gnd),
	.combout(\c[6]~12_combout ),
	.cout());
defparam \c[6]~12 .lut_mask = 16'h6996;
defparam \c[6]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~13 (
	.dataa(mulright_q_3_3),
	.datab(mulright_q_4_3),
	.datac(mulleft_q_3_3),
	.datad(mulleft_q_4_3),
	.cin(gnd),
	.combout(\c[6]~13_combout ),
	.cout());
defparam \c[6]~13 .lut_mask = 16'h6996;
defparam \c[6]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~14 (
	.dataa(mulleft_q_1_3),
	.datab(mulright_q_5_3),
	.datac(mulleft_q_2_3),
	.datad(mulright_q_6_3),
	.cin(gnd),
	.combout(\c[6]~14_combout ),
	.cout());
defparam \c[6]~14 .lut_mask = 16'h6996;
defparam \c[6]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~15 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[6]~12_combout ),
	.datac(\c[6]~13_combout ),
	.datad(\c[6]~14_combout ),
	.cin(gnd),
	.combout(\c[6]~15_combout ),
	.cout());
defparam \c[6]~15 .lut_mask = 16'h6996;
defparam \c[6]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~17 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[7]~17_combout ),
	.cout());
defparam \c[7]~17 .lut_mask = 16'h9696;
defparam \c[7]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~18 (
	.dataa(mulright_q_1_3),
	.datab(mulleft_q_6_3),
	.datac(mulright_q_2_3),
	.datad(mulleft_q_7_3),
	.cin(gnd),
	.combout(\c[7]~18_combout ),
	.cout());
defparam \c[7]~18 .lut_mask = 16'h6996;
defparam \c[7]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~19 (
	.dataa(mulright_q_3_3),
	.datab(mulright_q_4_3),
	.datac(mulleft_q_4_3),
	.datad(mulleft_q_5_3),
	.cin(gnd),
	.combout(\c[7]~19_combout ),
	.cout());
defparam \c[7]~19 .lut_mask = 16'h6996;
defparam \c[7]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~20 (
	.dataa(mulright_q_6_3),
	.datab(mulright_q_5_3),
	.datac(mulleft_q_3_3),
	.datad(mulleft_q_2_3),
	.cin(gnd),
	.combout(\c[7]~20_combout ),
	.cout());
defparam \c[7]~20 .lut_mask = 16'h6996;
defparam \c[7]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~21 (
	.dataa(mulleft_q_1_3),
	.datab(mulright_q_7_3),
	.datac(\c[7]~19_combout ),
	.datad(\c[7]~20_combout ),
	.cin(gnd),
	.combout(\c[7]~21_combout ),
	.cout());
defparam \c[7]~21 .lut_mask = 16'h6996;
defparam \c[7]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~23 (
	.dataa(mulleft_q_1_3),
	.datab(mulright_q_7_3),
	.datac(mulleft_q_2_3),
	.datad(mulright_q_8_3),
	.cin(gnd),
	.combout(\c[8]~23_combout ),
	.cout());
defparam \c[8]~23 .lut_mask = 16'h6996;
defparam \c[8]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~24 (
	.dataa(mulright_q_1_3),
	.datab(mulleft_q_7_3),
	.datac(mulright_q_2_3),
	.datad(mulleft_q_8_3),
	.cin(gnd),
	.combout(\c[8]~24_combout ),
	.cout());
defparam \c[8]~24 .lut_mask = 16'h6996;
defparam \c[8]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~25 (
	.dataa(mulleft_q_6_3),
	.datab(mulright_q_4_3),
	.datac(mulleft_q_5_3),
	.datad(mulright_q_3_3),
	.cin(gnd),
	.combout(\c[8]~25_combout ),
	.cout());
defparam \c[8]~25 .lut_mask = 16'h6996;
defparam \c[8]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~26 (
	.dataa(mulright_q_6_3),
	.datab(mulright_q_5_3),
	.datac(mulleft_q_4_3),
	.datad(mulleft_q_3_3),
	.cin(gnd),
	.combout(\c[8]~26_combout ),
	.cout());
defparam \c[8]~26 .lut_mask = 16'h6996;
defparam \c[8]~26 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~27 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[8]~24_combout ),
	.datac(\c[8]~25_combout ),
	.datad(\c[8]~26_combout ),
	.cin(gnd),
	.combout(\c[8]~27_combout ),
	.cout());
defparam \c[8]~27 .lut_mask = 16'h6996;
defparam \c[8]~27 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_4 (
	mulleft_q_7_4,
	mulleft_q_8_4,
	mulleft_q_6_4,
	mulleft_q_5_4,
	mulleft_q_4_4,
	mulleft_q_3_4,
	mulleft_q_1_4,
	mulleft_q_2_4,
	mulright_q_7_4,
	mulright_q_8_4,
	mulright_q_4_4,
	mulright_q_3_4,
	mulright_q_6_4,
	mulright_q_5_4,
	mulright_q_1_4,
	mulright_q_2_4,
	c_2,
	c_1,
	c_3,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8)/* synthesis synthesis_greybox=1 */;
input 	mulleft_q_7_4;
input 	mulleft_q_8_4;
input 	mulleft_q_6_4;
input 	mulleft_q_5_4;
input 	mulleft_q_4_4;
input 	mulleft_q_3_4;
input 	mulleft_q_1_4;
input 	mulleft_q_2_4;
input 	mulright_q_7_4;
input 	mulright_q_8_4;
input 	mulright_q_4_4;
input 	mulright_q_3_4;
input 	mulright_q_6_4;
input 	mulright_q_5_4;
input 	mulright_q_1_4;
input 	mulright_q_2_4;
output 	c_2;
output 	c_1;
output 	c_3;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \logic:extra[7][9]~0_combout ;
wire \logic:extra[6][9]~0_combout ;
wire \logic:extra[6][9]~1_combout ;
wire \logic:extra[6][9]~2_combout ;
wire \logic:extra[6][9]~3_combout ;
wire \c[2]~0_combout ;
wire \logic:expand[8][13]~combout ;
wire \logic:total[8][13]~0_combout ;
wire \logic:extra[7][9]~1_combout ;
wire \logic:extra[7][9]~2_combout ;
wire \logic:extra[7][9]~3_combout ;
wire \logic:extra[7][9]~4_combout ;
wire \logic:extra[7][9]~5_combout ;
wire \logic:total[8][15]~combout ;
wire \logic:extra[5][9]~0_combout ;
wire \logic:extra[5][9]~1_combout ;
wire \logic:extra[5][9]~2_combout ;
wire \c[3]~1_combout ;
wire \c[3]~2_combout ;
wire \logic:total[8][13]~1_combout ;
wire \logic:extra[7][9]~combout ;
wire \c[4]~3_combout ;
wire \c[4]~4_combout ;
wire \logic:total[8][12]~0_combout ;
wire \logic:total[8][12]~1_combout ;
wire \c[6]~5_combout ;
wire \logic:expand[5][5]~combout ;
wire \c[5]~6_combout ;
wire \c[5]~7_combout ;
wire \c[5]~8_combout ;
wire \logic:total[8][14]~combout ;
wire \c[6]~9_combout ;
wire \c[6]~10_combout ;
wire \c[6]~11_combout ;
wire \c[6]~12_combout ;
wire \c[7]~14_combout ;
wire \c[7]~15_combout ;
wire \c[7]~16_combout ;
wire \c[7]~17_combout ;
wire \c[7]~18_combout ;
wire \c[8]~20_combout ;
wire \c[8]~21_combout ;
wire \c[8]~22_combout ;
wire \c[8]~23_combout ;
wire \c[8]~24_combout ;


cycloneive_lcell_comb \c[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\logic:extra[6][9]~3_combout ),
	.datad(\c[2]~0_combout ),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h0FF0;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1] (
	.dataa(mulright_q_1_4),
	.datab(mulleft_q_1_4),
	.datac(\logic:extra[7][9]~2_combout ),
	.datad(\logic:extra[7][9]~5_combout ),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1] .lut_mask = 16'h6996;
defparam \c[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(mulleft_q_1_4),
	.datab(mulright_q_3_4),
	.datac(\c[3]~1_combout ),
	.datad(\c[3]~2_combout ),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(\logic:extra[7][9]~combout ),
	.datab(\c[4]~3_combout ),
	.datac(\c[4]~4_combout ),
	.datad(\c[6]~5_combout ),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5] (
	.dataa(\logic:extra[6][9]~3_combout ),
	.datab(\c[3]~1_combout ),
	.datac(\logic:expand[5][5]~combout ),
	.datad(\c[5]~8_combout ),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5] .lut_mask = 16'h6996;
defparam \c[5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~13 (
	.dataa(\logic:total[8][15]~combout ),
	.datab(\logic:extra[5][9]~2_combout ),
	.datac(\c[6]~5_combout ),
	.datad(\c[6]~12_combout ),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~13 .lut_mask = 16'h6996;
defparam \c[6]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~19 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\c[7]~14_combout ),
	.datac(\c[7]~15_combout ),
	.datad(\c[7]~18_combout ),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~19 .lut_mask = 16'h6996;
defparam \c[7]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~25 (
	.dataa(\c[7]~14_combout ),
	.datab(\c[8]~20_combout ),
	.datac(\c[8]~24_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~25 .lut_mask = 16'h9696;
defparam \c[8]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~0 (
	.dataa(mulright_q_7_4),
	.datab(mulleft_q_7_4),
	.datac(mulright_q_8_4),
	.datad(mulleft_q_8_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~0_combout ),
	.cout());
defparam \logic:extra[7][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~0 (
	.dataa(mulleft_q_8_4),
	.datab(mulleft_q_7_4),
	.datac(mulright_q_4_4),
	.datad(mulright_q_3_4),
	.cin(gnd),
	.combout(\logic:extra[6][9]~0_combout ),
	.cout());
defparam \logic:extra[6][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~1 (
	.dataa(mulleft_q_6_4),
	.datab(mulright_q_6_4),
	.datac(mulleft_q_5_4),
	.datad(mulright_q_5_4),
	.cin(gnd),
	.combout(\logic:extra[6][9]~1_combout ),
	.cout());
defparam \logic:extra[6][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~2 (
	.dataa(mulright_q_8_4),
	.datab(mulright_q_7_4),
	.datac(mulleft_q_4_4),
	.datad(mulleft_q_3_4),
	.cin(gnd),
	.combout(\logic:extra[6][9]~2_combout ),
	.cout());
defparam \logic:extra[6][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~3 (
	.dataa(\logic:extra[7][9]~0_combout ),
	.datab(\logic:extra[6][9]~0_combout ),
	.datac(\logic:extra[6][9]~1_combout ),
	.datad(\logic:extra[6][9]~2_combout ),
	.cin(gnd),
	.combout(\logic:extra[6][9]~3_combout ),
	.cout());
defparam \logic:extra[6][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~0 (
	.dataa(mulright_q_1_4),
	.datab(mulleft_q_1_4),
	.datac(mulright_q_2_4),
	.datad(mulleft_q_2_4),
	.cin(gnd),
	.combout(\c[2]~0_combout ),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h6996;
defparam \c[2]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:expand[8][13] (
	.dataa(mulright_q_8_4),
	.datab(mulleft_q_6_4),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:expand[8][13]~combout ),
	.cout());
defparam \logic:expand[8][13] .lut_mask = 16'hEEEE;
defparam \logic:expand[8][13] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~0 (
	.dataa(mulright_q_6_4),
	.datab(mulright_q_7_4),
	.datac(mulleft_q_7_4),
	.datad(mulleft_q_8_4),
	.cin(gnd),
	.combout(\logic:total[8][13]~0_combout ),
	.cout());
defparam \logic:total[8][13]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][13]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~1 (
	.dataa(mulleft_q_8_4),
	.datab(mulleft_q_7_4),
	.datac(mulright_q_3_4),
	.datad(mulright_q_2_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~1_combout ),
	.cout());
defparam \logic:extra[7][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~2 (
	.dataa(\logic:expand[8][13]~combout ),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(\logic:extra[7][9]~0_combout ),
	.datad(\logic:extra[7][9]~1_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~2_combout ),
	.cout());
defparam \logic:extra[7][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~3 (
	.dataa(mulleft_q_6_4),
	.datab(mulright_q_5_4),
	.datac(mulleft_q_5_4),
	.datad(mulright_q_4_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~3_combout ),
	.cout());
defparam \logic:extra[7][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~4 (
	.dataa(mulright_q_6_4),
	.datab(mulright_q_7_4),
	.datac(mulleft_q_3_4),
	.datad(mulleft_q_4_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~4_combout ),
	.cout());
defparam \logic:extra[7][9]~4 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~5 (
	.dataa(mulright_q_8_4),
	.datab(mulleft_q_2_4),
	.datac(\logic:extra[7][9]~3_combout ),
	.datad(\logic:extra[7][9]~4_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~5_combout ),
	.cout());
defparam \logic:extra[7][9]~5 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][15] (
	.dataa(mulright_q_8_4),
	.datab(mulleft_q_8_4),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:total[8][15]~combout ),
	.cout());
defparam \logic:total[8][15] .lut_mask = 16'hEEEE;
defparam \logic:total[8][15] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~0 (
	.dataa(mulleft_q_8_4),
	.datab(mulleft_q_7_4),
	.datac(mulright_q_5_4),
	.datad(mulright_q_4_4),
	.cin(gnd),
	.combout(\logic:extra[5][9]~0_combout ),
	.cout());
defparam \logic:extra[5][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~1 (
	.dataa(mulleft_q_6_4),
	.datab(mulright_q_7_4),
	.datac(mulleft_q_5_4),
	.datad(mulright_q_6_4),
	.cin(gnd),
	.combout(\logic:extra[5][9]~1_combout ),
	.cout());
defparam \logic:extra[5][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~2 (
	.dataa(mulright_q_8_4),
	.datab(mulleft_q_4_4),
	.datac(\logic:extra[5][9]~0_combout ),
	.datad(\logic:extra[5][9]~1_combout ),
	.cin(gnd),
	.combout(\logic:extra[5][9]~2_combout ),
	.cout());
defparam \logic:extra[5][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~1 (
	.dataa(\logic:total[8][15]~combout ),
	.datab(\logic:extra[7][9]~2_combout ),
	.datac(\logic:extra[7][9]~5_combout ),
	.datad(\logic:extra[5][9]~2_combout ),
	.cin(gnd),
	.combout(\c[3]~1_combout ),
	.cout());
defparam \c[3]~1 .lut_mask = 16'h6996;
defparam \c[3]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(mulright_q_1_4),
	.datab(mulright_q_2_4),
	.datac(mulleft_q_2_4),
	.datad(mulleft_q_3_4),
	.cin(gnd),
	.combout(\c[3]~2_combout ),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h6996;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~1 (
	.dataa(gnd),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(mulright_q_8_4),
	.datad(mulleft_q_6_4),
	.cin(gnd),
	.combout(\logic:total[8][13]~1_combout ),
	.cout());
defparam \logic:total[8][13]~1 .lut_mask = 16'hC33C;
defparam \logic:total[8][13]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9] (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[7][9]~0_combout ),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(\logic:extra[7][9]~5_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~combout ),
	.cout());
defparam \logic:extra[7][9] .lut_mask = 16'h6996;
defparam \logic:extra[7][9] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~3 (
	.dataa(mulright_q_1_4),
	.datab(mulright_q_2_4),
	.datac(mulleft_q_3_4),
	.datad(mulleft_q_4_4),
	.cin(gnd),
	.combout(\c[4]~3_combout ),
	.cout());
defparam \c[4]~3 .lut_mask = 16'h6996;
defparam \c[4]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~4 (
	.dataa(mulleft_q_1_4),
	.datab(mulright_q_3_4),
	.datac(mulleft_q_2_4),
	.datad(mulright_q_4_4),
	.cin(gnd),
	.combout(\c[4]~4_combout ),
	.cout());
defparam \c[4]~4 .lut_mask = 16'h6996;
defparam \c[4]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~0 (
	.dataa(mulright_q_6_4),
	.datab(mulleft_q_8_4),
	.datac(mulright_q_5_4),
	.datad(mulleft_q_7_4),
	.cin(gnd),
	.combout(\logic:total[8][12]~0_combout ),
	.cout());
defparam \logic:total[8][12]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~1 (
	.dataa(mulright_q_8_4),
	.datab(mulleft_q_6_4),
	.datac(mulright_q_7_4),
	.datad(mulleft_q_5_4),
	.cin(gnd),
	.combout(\logic:total[8][12]~1_combout ),
	.cout());
defparam \logic:total[8][12]~1 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~5 (
	.dataa(\logic:extra[6][9]~3_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[6]~5_combout ),
	.cout());
defparam \c[6]~5 .lut_mask = 16'h9696;
defparam \c[6]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:expand[5][5] (
	.dataa(mulleft_q_1_4),
	.datab(mulright_q_5_4),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:expand[5][5]~combout ),
	.cout());
defparam \logic:expand[5][5] .lut_mask = 16'hEEEE;
defparam \logic:expand[5][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~6 (
	.dataa(mulright_q_1_4),
	.datab(mulright_q_2_4),
	.datac(mulleft_q_4_4),
	.datad(mulleft_q_5_4),
	.cin(gnd),
	.combout(\c[5]~6_combout ),
	.cout());
defparam \c[5]~6 .lut_mask = 16'h6996;
defparam \c[5]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~7 (
	.dataa(mulright_q_3_4),
	.datab(mulright_q_4_4),
	.datac(mulleft_q_2_4),
	.datad(mulleft_q_3_4),
	.cin(gnd),
	.combout(\c[5]~7_combout ),
	.cout());
defparam \c[5]~7 .lut_mask = 16'h6996;
defparam \c[5]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~8 (
	.dataa(\logic:expand[8][13]~combout ),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(\c[5]~6_combout ),
	.datad(\c[5]~7_combout ),
	.cin(gnd),
	.combout(\c[5]~8_combout ),
	.cout());
defparam \c[5]~8 .lut_mask = 16'h6996;
defparam \c[5]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][14] (
	.dataa(mulright_q_8_4),
	.datab(mulleft_q_8_4),
	.datac(mulright_q_7_4),
	.datad(mulleft_q_7_4),
	.cin(gnd),
	.combout(\logic:total[8][14]~combout ),
	.cout());
defparam \logic:total[8][14] .lut_mask = 16'h6996;
defparam \logic:total[8][14] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~9 (
	.dataa(mulright_q_1_4),
	.datab(mulright_q_2_4),
	.datac(mulleft_q_5_4),
	.datad(mulleft_q_6_4),
	.cin(gnd),
	.combout(\c[6]~9_combout ),
	.cout());
defparam \c[6]~9 .lut_mask = 16'h6996;
defparam \c[6]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~10 (
	.dataa(mulright_q_3_4),
	.datab(mulright_q_4_4),
	.datac(mulleft_q_3_4),
	.datad(mulleft_q_4_4),
	.cin(gnd),
	.combout(\c[6]~10_combout ),
	.cout());
defparam \c[6]~10 .lut_mask = 16'h6996;
defparam \c[6]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~11 (
	.dataa(mulleft_q_1_4),
	.datab(mulright_q_5_4),
	.datac(mulleft_q_2_4),
	.datad(mulright_q_6_4),
	.cin(gnd),
	.combout(\c[6]~11_combout ),
	.cout());
defparam \c[6]~11 .lut_mask = 16'h6996;
defparam \c[6]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~12 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[6]~9_combout ),
	.datac(\c[6]~10_combout ),
	.datad(\c[6]~11_combout ),
	.cin(gnd),
	.combout(\c[6]~12_combout ),
	.cout());
defparam \c[6]~12 .lut_mask = 16'h6996;
defparam \c[6]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~14 (
	.dataa(\logic:expand[8][13]~combout ),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(\logic:total[8][12]~0_combout ),
	.datad(\logic:total[8][12]~1_combout ),
	.cin(gnd),
	.combout(\c[7]~14_combout ),
	.cout());
defparam \c[7]~14 .lut_mask = 16'h6996;
defparam \c[7]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~15 (
	.dataa(mulright_q_1_4),
	.datab(mulleft_q_6_4),
	.datac(mulright_q_2_4),
	.datad(mulleft_q_7_4),
	.cin(gnd),
	.combout(\c[7]~15_combout ),
	.cout());
defparam \c[7]~15 .lut_mask = 16'h6996;
defparam \c[7]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~16 (
	.dataa(mulright_q_3_4),
	.datab(mulright_q_4_4),
	.datac(mulleft_q_4_4),
	.datad(mulleft_q_5_4),
	.cin(gnd),
	.combout(\c[7]~16_combout ),
	.cout());
defparam \c[7]~16 .lut_mask = 16'h6996;
defparam \c[7]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~17 (
	.dataa(mulright_q_6_4),
	.datab(mulright_q_5_4),
	.datac(mulleft_q_3_4),
	.datad(mulleft_q_2_4),
	.cin(gnd),
	.combout(\c[7]~17_combout ),
	.cout());
defparam \c[7]~17 .lut_mask = 16'h6996;
defparam \c[7]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~18 (
	.dataa(mulleft_q_1_4),
	.datab(mulright_q_7_4),
	.datac(\c[7]~16_combout ),
	.datad(\c[7]~17_combout ),
	.cin(gnd),
	.combout(\c[7]~18_combout ),
	.cout());
defparam \c[7]~18 .lut_mask = 16'h6996;
defparam \c[7]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~20 (
	.dataa(mulleft_q_1_4),
	.datab(mulright_q_7_4),
	.datac(mulleft_q_2_4),
	.datad(mulright_q_8_4),
	.cin(gnd),
	.combout(\c[8]~20_combout ),
	.cout());
defparam \c[8]~20 .lut_mask = 16'h6996;
defparam \c[8]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~21 (
	.dataa(mulright_q_1_4),
	.datab(mulleft_q_7_4),
	.datac(mulright_q_2_4),
	.datad(mulleft_q_8_4),
	.cin(gnd),
	.combout(\c[8]~21_combout ),
	.cout());
defparam \c[8]~21 .lut_mask = 16'h6996;
defparam \c[8]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~22 (
	.dataa(mulleft_q_6_4),
	.datab(mulright_q_4_4),
	.datac(mulleft_q_5_4),
	.datad(mulright_q_3_4),
	.cin(gnd),
	.combout(\c[8]~22_combout ),
	.cout());
defparam \c[8]~22 .lut_mask = 16'h6996;
defparam \c[8]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~23 (
	.dataa(mulright_q_6_4),
	.datab(mulright_q_5_4),
	.datac(mulleft_q_4_4),
	.datad(mulleft_q_3_4),
	.cin(gnd),
	.combout(\c[8]~23_combout ),
	.cout());
defparam \c[8]~23 .lut_mask = 16'h6996;
defparam \c[8]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~24 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[8]~21_combout ),
	.datac(\c[8]~22_combout ),
	.datad(\c[8]~23_combout ),
	.cin(gnd),
	.combout(\c[8]~24_combout ),
	.cout());
defparam \c[8]~24 .lut_mask = 16'h6996;
defparam \c[8]~24 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_chn_atl (
	bdprev_q_2_3,
	bdprev_q_2_2,
	bdprev_q_2_4,
	bdprev_q_1_1,
	bdprev_q_1_3,
	bdprev_q_1_2,
	bdprev_q_1_4,
	bdprev_q_3_3,
	bdprev_q_3_2,
	bdprev_q_3_4,
	bdprev_q_4_3,
	bdprev_q_4_2,
	bdprev_q_4_4,
	bdprev_q_5_3,
	bdprev_q_5_2,
	bdprev_q_5_4,
	bdprev_q_6_3,
	bdprev_q_6_2,
	bdprev_q_6_4,
	bdprev_q_7_3,
	bdprev_q_7_2,
	bdprev_q_7_4,
	bdprev_q_8_3,
	bdprev_q_8_2,
	bdprev_q_8_4,
	polyz1,
	errvec_1,
	errvec_2,
	errvec_3,
	errvec_4,
	errvec_5,
	errvec_6,
	errvec_7,
	errvec_8,
	load_chn,
	bdprev_q_2_1,
	bdprev_q_3_1,
	bdprev_q_4_1,
	bdprev_q_5_1,
	bdprev_q_6_1,
	bdprev_q_7_1,
	bdprev_q_8_1,
	omega_1_2,
	bd_q_2_3,
	bd_q_2_2,
	bd_q_2_4,
	omega_1_1,
	bd_q_1_3,
	bd_q_1_2,
	bd_q_1_4,
	omega_1_3,
	bd_q_3_3,
	bd_q_3_2,
	bd_q_3_4,
	omega_1_4,
	bd_q_4_3,
	bd_q_4_2,
	bd_q_4_4,
	omega_1_5,
	bd_q_5_3,
	bd_q_5_2,
	bd_q_5_4,
	omega_1_6,
	bd_q_6_3,
	bd_q_6_2,
	bd_q_6_4,
	omega_1_7,
	bd_q_7_3,
	bd_q_7_2,
	bd_q_7_4,
	omega_1_8,
	bd_q_8_3,
	bd_q_8_2,
	bd_q_8_4,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
input 	bdprev_q_2_3;
input 	bdprev_q_2_2;
input 	bdprev_q_2_4;
input 	bdprev_q_1_1;
input 	bdprev_q_1_3;
input 	bdprev_q_1_2;
input 	bdprev_q_1_4;
input 	bdprev_q_3_3;
input 	bdprev_q_3_2;
input 	bdprev_q_3_4;
input 	bdprev_q_4_3;
input 	bdprev_q_4_2;
input 	bdprev_q_4_4;
input 	bdprev_q_5_3;
input 	bdprev_q_5_2;
input 	bdprev_q_5_4;
input 	bdprev_q_6_3;
input 	bdprev_q_6_2;
input 	bdprev_q_6_4;
input 	bdprev_q_7_3;
input 	bdprev_q_7_2;
input 	bdprev_q_7_4;
input 	bdprev_q_8_3;
input 	bdprev_q_8_2;
input 	bdprev_q_8_4;
output 	polyz1;
output 	errvec_1;
output 	errvec_2;
output 	errvec_3;
output 	errvec_4;
output 	errvec_5;
output 	errvec_6;
output 	errvec_7;
output 	errvec_8;
input 	load_chn;
input 	bdprev_q_2_1;
input 	bdprev_q_3_1;
input 	bdprev_q_4_1;
input 	bdprev_q_5_1;
input 	bdprev_q_6_1;
input 	bdprev_q_7_1;
input 	bdprev_q_8_1;
input 	omega_1_2;
input 	bd_q_2_3;
input 	bd_q_2_2;
input 	bd_q_2_4;
input 	omega_1_1;
input 	bd_q_1_3;
input 	bd_q_1_2;
input 	bd_q_1_4;
input 	omega_1_3;
input 	bd_q_3_3;
input 	bd_q_3_2;
input 	bd_q_3_4;
input 	omega_1_4;
input 	bd_q_4_3;
input 	bd_q_4_2;
input 	bd_q_4_4;
input 	omega_1_5;
input 	bd_q_5_3;
input 	bd_q_5_2;
input 	bd_q_5_4;
input 	omega_1_6;
input 	bd_q_6_3;
input 	bd_q_6_2;
input 	bd_q_6_4;
input 	omega_1_7;
input 	bd_q_7_3;
input 	bd_q_7_2;
input 	bd_q_7_4;
input 	omega_1_8;
input 	bd_q_8_3;
input 	bd_q_8_2;
input 	bd_q_8_4;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \g5:3:gf_mul2|c[2]~0_combout ;
wire \g5:2:gf_mul2|c[2]~0_combout ;
wire \g5:4:gf_mul2|c[2]~combout ;
wire \g5:3:gf_mul2|c[1]~1_combout ;
wire \g5:4:gf_mul2|c[1]~0_combout ;
wire \g5:3:gf_mul2|c[3]~2_combout ;
wire \g5:4:gf_mul2|c[3]~1_combout ;
wire \g5:3:gf_mul2|c[4]~combout ;
wire \g5:4:gf_mul2|c[8]~2_combout ;
wire \delom_q[8]~q ;
wire \delom_q[7]~q ;
wire \delom_q[6]~q ;
wire \delom_q[2]~q ;
wire \delom_q[5]~q ;
wire \delom_q[3]~q ;
wire \delom_q[4]~q ;
wire \delom_q[1]~q ;
wire \gf_div|gf_mul|c[1]~combout ;
wire \gf_div|gf_mul|c[2]~combout ;
wire \gf_div|gf_mul|c[3]~combout ;
wire \gf_div|gf_mul|c[4]~combout ;
wire \gf_div|gf_mul|c[5]~9_combout ;
wire \gf_div|gf_mul|c[6]~14_combout ;
wire \gf_div|gf_mul|c[7]~20_combout ;
wire \gf_div|gf_mul|c[8]~26_combout ;
wire \omadder_q[8]~q ;
wire \omadder_q[7]~q ;
wire \omadder_q[6]~q ;
wire \omadder_q[2]~q ;
wire \omadder_q[5]~q ;
wire \omadder_q[3]~q ;
wire \omadder_q[4]~q ;
wire \omadder_q[1]~q ;
wire \omega_one[8]~q ;
wire \omreg_q[1][8]~q ;
wire \omreg_q[2][8]~q ;
wire \omreg_q[3][8]~q ;
wire \delom_d[8]~0_combout ;
wire \omega_one[7]~q ;
wire \omreg_q[1][7]~q ;
wire \omreg_q[2][7]~q ;
wire \omreg_q[3][7]~q ;
wire \delom_d[7]~1_combout ;
wire \drvadder_in[1]~combout ;
wire \drvadder_in[3]~combout ;
wire \drvadder_in[5]~combout ;
wire \drvadder_in[7]~combout ;
wire \omega_one[6]~q ;
wire \omreg_q[1][6]~q ;
wire \omreg_q[2][6]~q ;
wire \omreg_q[3][6]~q ;
wire \delom_d[6]~2_combout ;
wire \omega_one[2]~q ;
wire \omreg_q[1][2]~q ;
wire \omreg_q[2][2]~q ;
wire \omreg_q[3][2]~q ;
wire \delom_d[2]~3_combout ;
wire \omega_one[5]~q ;
wire \omreg_q[1][5]~q ;
wire \omreg_q[2][5]~q ;
wire \omreg_q[3][5]~q ;
wire \delom_d[5]~4_combout ;
wire \omega_one[3]~q ;
wire \omreg_q[1][3]~q ;
wire \omreg_q[2][3]~q ;
wire \omreg_q[3][3]~q ;
wire \delom_d[3]~5_combout ;
wire \omega_one[4]~q ;
wire \omreg_q[1][4]~q ;
wire \omreg_q[2][4]~q ;
wire \omreg_q[3][4]~q ;
wire \delom_d[4]~6_combout ;
wire \omega_one[1]~q ;
wire \omreg_q[1][1]~q ;
wire \omreg_q[2][1]~q ;
wire \omreg_q[3][1]~q ;
wire \delom_d[1]~7_combout ;
wire \omreg_d[1][8]~2_combout ;
wire \omreg_d[2][8]~3_combout ;
wire \ifg4:g9:3:gf_mul3|c[8]~0_combout ;
wire \omreg_d[1][7]~4_combout ;
wire \omreg_d[2][7]~5_combout ;
wire \omreg_d[3][7]~6_combout ;
wire \omreg_d[1][6]~7_combout ;
wire \omreg_d[2][6]~8_combout ;
wire \omreg_d[3][6]~9_combout ;
wire \omreg_d[1][2]~10_combout ;
wire \ifg4:g9:2:gf_mul3|c[2]~0_combout ;
wire \omreg_d[2][2]~11_combout ;
wire \ifg4:g9:3:gf_mul3|c[2]~1_combout ;
wire \omreg_d[3][2]~12_combout ;
wire \omreg_d[1][5]~13_combout ;
wire \omreg_d[2][5]~14_combout ;
wire \omreg_d[3][5]~15_combout ;
wire \omreg_d[1][3]~16_combout ;
wire \omreg_d[2][3]~17_combout ;
wire \ifg4:g9:3:gf_mul3|c[3]~2_combout ;
wire \omreg_d[3][3]~18_combout ;
wire \omreg_d[1][4]~19_combout ;
wire \omreg_d[2][4]~20_combout ;
wire \omreg_d[3][4]~21_combout ;
wire \omreg_d[1][1]~22_combout ;
wire \omreg_d[2][1]~23_combout ;
wire \ifg4:g9:3:gf_mul3|c[1]~3_combout ;
wire \omreg_d[3][1]~24_combout ;
wire \omreg_d[3][8]~25_combout ;
wire \reg_d[1][1]~4_combout ;
wire \reg_q[1][1]~q ;
wire \reg_d[1][8]~28_combout ;
wire \reg_q[1][8]~q ;
wire \reg_d[1][7]~24_combout ;
wire \reg_q[1][7]~q ;
wire \reg_d[1][6]~20_combout ;
wire \reg_q[1][6]~q ;
wire \reg_d[1][5]~16_combout ;
wire \reg_q[1][5]~q ;
wire \reg_d[1][4]~12_combout ;
wire \reg_q[1][4]~q ;
wire \reg_d[1][3]~8_combout ;
wire \reg_q[1][3]~q ;
wire \reg_d[1][2]~0_combout ;
wire \reg_q[1][2]~q ;
wire \reg_d[3][2]~1_combout ;
wire \reg_q[3][2]~q ;
wire \drvadder_in[2]~combout ;
wire \reg_d[2][8]~30_combout ;
wire \reg_q[2][8]~q ;
wire \reg_d[2][6]~22_combout ;
wire \reg_q[2][6]~q ;
wire \reg_d[2][4]~14_combout ;
wire \reg_q[2][4]~q ;
wire \reg_d[2][2]~2_combout ;
wire \reg_q[2][2]~q ;
wire \reg_d[4][2]~3_combout ;
wire \reg_q[4][2]~q ;
wire \reg_d[3][1]~5_combout ;
wire \reg_q[3][1]~q ;
wire \reg_d[2][7]~26_combout ;
wire \reg_q[2][7]~q ;
wire \reg_d[2][5]~18_combout ;
wire \reg_q[2][5]~q ;
wire \reg_d[2][3]~10_combout ;
wire \reg_q[2][3]~q ;
wire \reg_d[2][1]~6_combout ;
wire \reg_q[2][1]~q ;
wire \reg_d[4][1]~7_combout ;
wire \reg_q[4][1]~q ;
wire \halfadd[1]~0_combout ;
wire \polyz~0_combout ;
wire \reg_d[3][3]~9_combout ;
wire \reg_q[3][3]~q ;
wire \reg_d[4][3]~11_combout ;
wire \reg_q[4][3]~q ;
wire \halfadd[3]~1_combout ;
wire \reg_d[3][4]~13_combout ;
wire \reg_q[3][4]~q ;
wire \drvadder_in[4]~combout ;
wire \reg_d[4][8]~31_combout ;
wire \reg_q[4][8]~q ;
wire \reg_d[4][4]~15_combout ;
wire \reg_q[4][4]~q ;
wire \polyz~1_combout ;
wire \reg_d[3][8]~29_combout ;
wire \reg_q[3][8]~q ;
wire \reg_d[3][5]~17_combout ;
wire \reg_q[3][5]~q ;
wire \reg_d[4][5]~19_combout ;
wire \reg_q[4][5]~q ;
wire \halfadd[5]~2_combout ;
wire \reg_d[3][6]~21_combout ;
wire \reg_q[3][6]~q ;
wire \drvadder_in[6]~combout ;
wire \reg_d[4][6]~23_combout ;
wire \reg_q[4][6]~q ;
wire \polyz~2_combout ;
wire \reg_d[3][7]~25_combout ;
wire \reg_q[3][7]~q ;
wire \reg_d[4][7]~27_combout ;
wire \reg_q[4][7]~q ;
wire \halfadd[7]~3_combout ;
wire \drvadder_in[8]~combout ;
wire \polyz~3_combout ;
wire \divfield_q[1]~q ;
wire \polyzero_del[1]~q ;
wire \polyzero_del[2]~q ;
wire \polyzero_del[3]~q ;
wire \divfield_q[2]~q ;
wire \divfield_q[3]~q ;
wire \divfield_q[4]~q ;
wire \divfield_q[5]~q ;
wire \divfield_q[6]~q ;
wire \divfield_q[7]~q ;
wire \divfield_q[8]~q ;


RS_DE_LANE_QUATUS_auk_rs_gfdiv_1 gf_div(
	.d({\drvadder_in[8]~combout ,\drvadder_in[7]~combout ,\drvadder_in[6]~combout ,\drvadder_in[5]~combout ,\drvadder_in[4]~combout ,\drvadder_in[3]~combout ,\drvadder_in[2]~combout ,\drvadder_in[1]~combout }),
	.delom_q_8(\delom_q[8]~q ),
	.delom_q_7(\delom_q[7]~q ),
	.delom_q_6(\delom_q[6]~q ),
	.delom_q_2(\delom_q[2]~q ),
	.delom_q_5(\delom_q[5]~q ),
	.delom_q_3(\delom_q[3]~q ),
	.delom_q_4(\delom_q[4]~q ),
	.delom_q_1(\delom_q[1]~q ),
	.c_1(\gf_div|gf_mul|c[1]~combout ),
	.c_2(\gf_div|gf_mul|c[2]~combout ),
	.c_3(\gf_div|gf_mul|c[3]~combout ),
	.c_4(\gf_div|gf_mul|c[4]~combout ),
	.c_5(\gf_div|gf_mul|c[5]~9_combout ),
	.c_6(\gf_div|gf_mul|c[6]~14_combout ),
	.c_7(\gf_div|gf_mul|c[7]~20_combout ),
	.c_8(\gf_div|gf_mul|c[8]~26_combout ),
	.clk(clk),
	.reset(reset));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_6 \ifg4:g9:3:gf_mul3 (
	.omreg_q_6_3(\omreg_q[3][6]~q ),
	.omreg_q_2_3(\omreg_q[3][2]~q ),
	.omreg_q_5_3(\omreg_q[3][5]~q ),
	.omreg_q_3_3(\omreg_q[3][3]~q ),
	.omreg_q_4_3(\omreg_q[3][4]~q ),
	.omreg_q_1_3(\omreg_q[3][1]~q ),
	.c_8(\ifg4:g9:3:gf_mul3|c[8]~0_combout ),
	.c_2(\ifg4:g9:3:gf_mul3|c[2]~1_combout ),
	.c_3(\ifg4:g9:3:gf_mul3|c[3]~2_combout ),
	.c_1(\ifg4:g9:3:gf_mul3|c[1]~3_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_5 \ifg4:g9:2:gf_mul3 (
	.omreg_q_2_2(\omreg_q[2][2]~q ),
	.omreg_q_1_2(\omreg_q[2][1]~q ),
	.c_2(\ifg4:g9:2:gf_mul3|c[2]~0_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_3 \g5:4:gf_mul2 (
	.reg_q_2_4(\reg_q[4][2]~q ),
	.reg_q_1_4(\reg_q[4][1]~q ),
	.reg_q_3_4(\reg_q[4][3]~q ),
	.reg_q_4_4(\reg_q[4][4]~q ),
	.reg_q_5_4(\reg_q[4][5]~q ),
	.reg_q_6_4(\reg_q[4][6]~q ),
	.reg_q_7_4(\reg_q[4][7]~q ),
	.c_2(\g5:4:gf_mul2|c[2]~combout ),
	.c_1(\g5:4:gf_mul2|c[1]~0_combout ),
	.c_3(\g5:4:gf_mul2|c[3]~1_combout ),
	.c_8(\g5:4:gf_mul2|c[8]~2_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_2 \g5:3:gf_mul2 (
	.reg_q_2_3(\reg_q[3][2]~q ),
	.reg_q_1_3(\reg_q[3][1]~q ),
	.reg_q_3_3(\reg_q[3][3]~q ),
	.reg_q_4_3(\reg_q[3][4]~q ),
	.reg_q_5_3(\reg_q[3][5]~q ),
	.reg_q_6_3(\reg_q[3][6]~q ),
	.reg_q_7_3(\reg_q[3][7]~q ),
	.c_2(\g5:3:gf_mul2|c[2]~0_combout ),
	.c_1(\g5:3:gf_mul2|c[1]~1_combout ),
	.c_3(\g5:3:gf_mul2|c[3]~2_combout ),
	.c_4(\g5:3:gf_mul2|c[4]~combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_1 \g5:2:gf_mul2 (
	.reg_q_2_2(\reg_q[2][2]~q ),
	.reg_q_1_2(\reg_q[2][1]~q ),
	.c_2(\g5:2:gf_mul2|c[2]~0_combout ));

dffeas \delom_q[8] (
	.clk(clk),
	.d(\omadder_q[8]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[8]~q ),
	.prn(vcc));
defparam \delom_q[8] .is_wysiwyg = "true";
defparam \delom_q[8] .power_up = "low";

dffeas \delom_q[7] (
	.clk(clk),
	.d(\omadder_q[7]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[7]~q ),
	.prn(vcc));
defparam \delom_q[7] .is_wysiwyg = "true";
defparam \delom_q[7] .power_up = "low";

dffeas \delom_q[6] (
	.clk(clk),
	.d(\omadder_q[6]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[6]~q ),
	.prn(vcc));
defparam \delom_q[6] .is_wysiwyg = "true";
defparam \delom_q[6] .power_up = "low";

dffeas \delom_q[2] (
	.clk(clk),
	.d(\omadder_q[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[2]~q ),
	.prn(vcc));
defparam \delom_q[2] .is_wysiwyg = "true";
defparam \delom_q[2] .power_up = "low";

dffeas \delom_q[5] (
	.clk(clk),
	.d(\omadder_q[5]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[5]~q ),
	.prn(vcc));
defparam \delom_q[5] .is_wysiwyg = "true";
defparam \delom_q[5] .power_up = "low";

dffeas \delom_q[3] (
	.clk(clk),
	.d(\omadder_q[3]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[3]~q ),
	.prn(vcc));
defparam \delom_q[3] .is_wysiwyg = "true";
defparam \delom_q[3] .power_up = "low";

dffeas \delom_q[4] (
	.clk(clk),
	.d(\omadder_q[4]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[4]~q ),
	.prn(vcc));
defparam \delom_q[4] .is_wysiwyg = "true";
defparam \delom_q[4] .power_up = "low";

dffeas \delom_q[1] (
	.clk(clk),
	.d(\omadder_q[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\delom_q[1]~q ),
	.prn(vcc));
defparam \delom_q[1] .is_wysiwyg = "true";
defparam \delom_q[1] .power_up = "low";

dffeas \omadder_q[8] (
	.clk(clk),
	.d(\delom_d[8]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[8]~q ),
	.prn(vcc));
defparam \omadder_q[8] .is_wysiwyg = "true";
defparam \omadder_q[8] .power_up = "low";

dffeas \omadder_q[7] (
	.clk(clk),
	.d(\delom_d[7]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[7]~q ),
	.prn(vcc));
defparam \omadder_q[7] .is_wysiwyg = "true";
defparam \omadder_q[7] .power_up = "low";

dffeas \omadder_q[6] (
	.clk(clk),
	.d(\delom_d[6]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[6]~q ),
	.prn(vcc));
defparam \omadder_q[6] .is_wysiwyg = "true";
defparam \omadder_q[6] .power_up = "low";

dffeas \omadder_q[2] (
	.clk(clk),
	.d(\delom_d[2]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[2]~q ),
	.prn(vcc));
defparam \omadder_q[2] .is_wysiwyg = "true";
defparam \omadder_q[2] .power_up = "low";

dffeas \omadder_q[5] (
	.clk(clk),
	.d(\delom_d[5]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[5]~q ),
	.prn(vcc));
defparam \omadder_q[5] .is_wysiwyg = "true";
defparam \omadder_q[5] .power_up = "low";

dffeas \omadder_q[3] (
	.clk(clk),
	.d(\delom_d[3]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[3]~q ),
	.prn(vcc));
defparam \omadder_q[3] .is_wysiwyg = "true";
defparam \omadder_q[3] .power_up = "low";

dffeas \omadder_q[4] (
	.clk(clk),
	.d(\delom_d[4]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[4]~q ),
	.prn(vcc));
defparam \omadder_q[4] .is_wysiwyg = "true";
defparam \omadder_q[4] .power_up = "low";

dffeas \omadder_q[1] (
	.clk(clk),
	.d(\delom_d[1]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omadder_q[1]~q ),
	.prn(vcc));
defparam \omadder_q[1] .is_wysiwyg = "true";
defparam \omadder_q[1] .power_up = "low";

dffeas \omega_one[8] (
	.clk(clk),
	.d(omega_1_8),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[8]~q ),
	.prn(vcc));
defparam \omega_one[8] .is_wysiwyg = "true";
defparam \omega_one[8] .power_up = "low";

dffeas \omreg_q[1][8] (
	.clk(clk),
	.d(\omreg_d[1][8]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][8]~q ),
	.prn(vcc));
defparam \omreg_q[1][8] .is_wysiwyg = "true";
defparam \omreg_q[1][8] .power_up = "low";

dffeas \omreg_q[2][8] (
	.clk(clk),
	.d(\omreg_d[2][8]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][8]~q ),
	.prn(vcc));
defparam \omreg_q[2][8] .is_wysiwyg = "true";
defparam \omreg_q[2][8] .power_up = "low";

dffeas \omreg_q[3][8] (
	.clk(clk),
	.d(\omreg_d[3][8]~25_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][8]~q ),
	.prn(vcc));
defparam \omreg_q[3][8] .is_wysiwyg = "true";
defparam \omreg_q[3][8] .power_up = "low";

cycloneive_lcell_comb \delom_d[8]~0 (
	.dataa(\omega_one[8]~q ),
	.datab(\omreg_q[1][8]~q ),
	.datac(\omreg_q[2][8]~q ),
	.datad(\omreg_q[3][8]~q ),
	.cin(gnd),
	.combout(\delom_d[8]~0_combout ),
	.cout());
defparam \delom_d[8]~0 .lut_mask = 16'h6996;
defparam \delom_d[8]~0 .sum_lutc_input = "datac";

dffeas \omega_one[7] (
	.clk(clk),
	.d(omega_1_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[7]~q ),
	.prn(vcc));
defparam \omega_one[7] .is_wysiwyg = "true";
defparam \omega_one[7] .power_up = "low";

dffeas \omreg_q[1][7] (
	.clk(clk),
	.d(\omreg_d[1][7]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][7]~q ),
	.prn(vcc));
defparam \omreg_q[1][7] .is_wysiwyg = "true";
defparam \omreg_q[1][7] .power_up = "low";

dffeas \omreg_q[2][7] (
	.clk(clk),
	.d(\omreg_d[2][7]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][7]~q ),
	.prn(vcc));
defparam \omreg_q[2][7] .is_wysiwyg = "true";
defparam \omreg_q[2][7] .power_up = "low";

dffeas \omreg_q[3][7] (
	.clk(clk),
	.d(\omreg_d[3][7]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][7]~q ),
	.prn(vcc));
defparam \omreg_q[3][7] .is_wysiwyg = "true";
defparam \omreg_q[3][7] .power_up = "low";

cycloneive_lcell_comb \delom_d[7]~1 (
	.dataa(\omega_one[7]~q ),
	.datab(\omreg_q[1][7]~q ),
	.datac(\omreg_q[2][7]~q ),
	.datad(\omreg_q[3][7]~q ),
	.cin(gnd),
	.combout(\delom_d[7]~1_combout ),
	.cout());
defparam \delom_d[7]~1 .lut_mask = 16'h6996;
defparam \delom_d[7]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \drvadder_in[1] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][1]~q ),
	.datad(\reg_q[3][1]~q ),
	.cin(gnd),
	.combout(\drvadder_in[1]~combout ),
	.cout());
defparam \drvadder_in[1] .lut_mask = 16'h0FF0;
defparam \drvadder_in[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \drvadder_in[3] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][3]~q ),
	.datad(\reg_q[3][3]~q ),
	.cin(gnd),
	.combout(\drvadder_in[3]~combout ),
	.cout());
defparam \drvadder_in[3] .lut_mask = 16'h0FF0;
defparam \drvadder_in[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \drvadder_in[5] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][5]~q ),
	.datad(\reg_q[3][5]~q ),
	.cin(gnd),
	.combout(\drvadder_in[5]~combout ),
	.cout());
defparam \drvadder_in[5] .lut_mask = 16'h0FF0;
defparam \drvadder_in[5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \drvadder_in[7] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][7]~q ),
	.datad(\reg_q[3][7]~q ),
	.cin(gnd),
	.combout(\drvadder_in[7]~combout ),
	.cout());
defparam \drvadder_in[7] .lut_mask = 16'h0FF0;
defparam \drvadder_in[7] .sum_lutc_input = "datac";

dffeas \omega_one[6] (
	.clk(clk),
	.d(omega_1_6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[6]~q ),
	.prn(vcc));
defparam \omega_one[6] .is_wysiwyg = "true";
defparam \omega_one[6] .power_up = "low";

dffeas \omreg_q[1][6] (
	.clk(clk),
	.d(\omreg_d[1][6]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][6]~q ),
	.prn(vcc));
defparam \omreg_q[1][6] .is_wysiwyg = "true";
defparam \omreg_q[1][6] .power_up = "low";

dffeas \omreg_q[2][6] (
	.clk(clk),
	.d(\omreg_d[2][6]~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][6]~q ),
	.prn(vcc));
defparam \omreg_q[2][6] .is_wysiwyg = "true";
defparam \omreg_q[2][6] .power_up = "low";

dffeas \omreg_q[3][6] (
	.clk(clk),
	.d(\omreg_d[3][6]~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][6]~q ),
	.prn(vcc));
defparam \omreg_q[3][6] .is_wysiwyg = "true";
defparam \omreg_q[3][6] .power_up = "low";

cycloneive_lcell_comb \delom_d[6]~2 (
	.dataa(\omega_one[6]~q ),
	.datab(\omreg_q[1][6]~q ),
	.datac(\omreg_q[2][6]~q ),
	.datad(\omreg_q[3][6]~q ),
	.cin(gnd),
	.combout(\delom_d[6]~2_combout ),
	.cout());
defparam \delom_d[6]~2 .lut_mask = 16'h6996;
defparam \delom_d[6]~2 .sum_lutc_input = "datac";

dffeas \omega_one[2] (
	.clk(clk),
	.d(omega_1_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[2]~q ),
	.prn(vcc));
defparam \omega_one[2] .is_wysiwyg = "true";
defparam \omega_one[2] .power_up = "low";

dffeas \omreg_q[1][2] (
	.clk(clk),
	.d(\omreg_d[1][2]~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][2]~q ),
	.prn(vcc));
defparam \omreg_q[1][2] .is_wysiwyg = "true";
defparam \omreg_q[1][2] .power_up = "low";

dffeas \omreg_q[2][2] (
	.clk(clk),
	.d(\omreg_d[2][2]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][2]~q ),
	.prn(vcc));
defparam \omreg_q[2][2] .is_wysiwyg = "true";
defparam \omreg_q[2][2] .power_up = "low";

dffeas \omreg_q[3][2] (
	.clk(clk),
	.d(\omreg_d[3][2]~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][2]~q ),
	.prn(vcc));
defparam \omreg_q[3][2] .is_wysiwyg = "true";
defparam \omreg_q[3][2] .power_up = "low";

cycloneive_lcell_comb \delom_d[2]~3 (
	.dataa(\omega_one[2]~q ),
	.datab(\omreg_q[1][2]~q ),
	.datac(\omreg_q[2][2]~q ),
	.datad(\omreg_q[3][2]~q ),
	.cin(gnd),
	.combout(\delom_d[2]~3_combout ),
	.cout());
defparam \delom_d[2]~3 .lut_mask = 16'h6996;
defparam \delom_d[2]~3 .sum_lutc_input = "datac";

dffeas \omega_one[5] (
	.clk(clk),
	.d(omega_1_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[5]~q ),
	.prn(vcc));
defparam \omega_one[5] .is_wysiwyg = "true";
defparam \omega_one[5] .power_up = "low";

dffeas \omreg_q[1][5] (
	.clk(clk),
	.d(\omreg_d[1][5]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][5]~q ),
	.prn(vcc));
defparam \omreg_q[1][5] .is_wysiwyg = "true";
defparam \omreg_q[1][5] .power_up = "low";

dffeas \omreg_q[2][5] (
	.clk(clk),
	.d(\omreg_d[2][5]~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][5]~q ),
	.prn(vcc));
defparam \omreg_q[2][5] .is_wysiwyg = "true";
defparam \omreg_q[2][5] .power_up = "low";

dffeas \omreg_q[3][5] (
	.clk(clk),
	.d(\omreg_d[3][5]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][5]~q ),
	.prn(vcc));
defparam \omreg_q[3][5] .is_wysiwyg = "true";
defparam \omreg_q[3][5] .power_up = "low";

cycloneive_lcell_comb \delom_d[5]~4 (
	.dataa(\omega_one[5]~q ),
	.datab(\omreg_q[1][5]~q ),
	.datac(\omreg_q[2][5]~q ),
	.datad(\omreg_q[3][5]~q ),
	.cin(gnd),
	.combout(\delom_d[5]~4_combout ),
	.cout());
defparam \delom_d[5]~4 .lut_mask = 16'h6996;
defparam \delom_d[5]~4 .sum_lutc_input = "datac";

dffeas \omega_one[3] (
	.clk(clk),
	.d(omega_1_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[3]~q ),
	.prn(vcc));
defparam \omega_one[3] .is_wysiwyg = "true";
defparam \omega_one[3] .power_up = "low";

dffeas \omreg_q[1][3] (
	.clk(clk),
	.d(\omreg_d[1][3]~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][3]~q ),
	.prn(vcc));
defparam \omreg_q[1][3] .is_wysiwyg = "true";
defparam \omreg_q[1][3] .power_up = "low";

dffeas \omreg_q[2][3] (
	.clk(clk),
	.d(\omreg_d[2][3]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][3]~q ),
	.prn(vcc));
defparam \omreg_q[2][3] .is_wysiwyg = "true";
defparam \omreg_q[2][3] .power_up = "low";

dffeas \omreg_q[3][3] (
	.clk(clk),
	.d(\omreg_d[3][3]~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][3]~q ),
	.prn(vcc));
defparam \omreg_q[3][3] .is_wysiwyg = "true";
defparam \omreg_q[3][3] .power_up = "low";

cycloneive_lcell_comb \delom_d[3]~5 (
	.dataa(\omega_one[3]~q ),
	.datab(\omreg_q[1][3]~q ),
	.datac(\omreg_q[2][3]~q ),
	.datad(\omreg_q[3][3]~q ),
	.cin(gnd),
	.combout(\delom_d[3]~5_combout ),
	.cout());
defparam \delom_d[3]~5 .lut_mask = 16'h6996;
defparam \delom_d[3]~5 .sum_lutc_input = "datac";

dffeas \omega_one[4] (
	.clk(clk),
	.d(omega_1_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[4]~q ),
	.prn(vcc));
defparam \omega_one[4] .is_wysiwyg = "true";
defparam \omega_one[4] .power_up = "low";

dffeas \omreg_q[1][4] (
	.clk(clk),
	.d(\omreg_d[1][4]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][4]~q ),
	.prn(vcc));
defparam \omreg_q[1][4] .is_wysiwyg = "true";
defparam \omreg_q[1][4] .power_up = "low";

dffeas \omreg_q[2][4] (
	.clk(clk),
	.d(\omreg_d[2][4]~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][4]~q ),
	.prn(vcc));
defparam \omreg_q[2][4] .is_wysiwyg = "true";
defparam \omreg_q[2][4] .power_up = "low";

dffeas \omreg_q[3][4] (
	.clk(clk),
	.d(\omreg_d[3][4]~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][4]~q ),
	.prn(vcc));
defparam \omreg_q[3][4] .is_wysiwyg = "true";
defparam \omreg_q[3][4] .power_up = "low";

cycloneive_lcell_comb \delom_d[4]~6 (
	.dataa(\omega_one[4]~q ),
	.datab(\omreg_q[1][4]~q ),
	.datac(\omreg_q[2][4]~q ),
	.datad(\omreg_q[3][4]~q ),
	.cin(gnd),
	.combout(\delom_d[4]~6_combout ),
	.cout());
defparam \delom_d[4]~6 .lut_mask = 16'h6996;
defparam \delom_d[4]~6 .sum_lutc_input = "datac";

dffeas \omega_one[1] (
	.clk(clk),
	.d(omega_1_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(load_chn),
	.q(\omega_one[1]~q ),
	.prn(vcc));
defparam \omega_one[1] .is_wysiwyg = "true";
defparam \omega_one[1] .power_up = "low";

dffeas \omreg_q[1][1] (
	.clk(clk),
	.d(\omreg_d[1][1]~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[1][1]~q ),
	.prn(vcc));
defparam \omreg_q[1][1] .is_wysiwyg = "true";
defparam \omreg_q[1][1] .power_up = "low";

dffeas \omreg_q[2][1] (
	.clk(clk),
	.d(\omreg_d[2][1]~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[2][1]~q ),
	.prn(vcc));
defparam \omreg_q[2][1] .is_wysiwyg = "true";
defparam \omreg_q[2][1] .power_up = "low";

dffeas \omreg_q[3][1] (
	.clk(clk),
	.d(\omreg_d[3][1]~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\omreg_q[3][1]~q ),
	.prn(vcc));
defparam \omreg_q[3][1] .is_wysiwyg = "true";
defparam \omreg_q[3][1] .power_up = "low";

cycloneive_lcell_comb \delom_d[1]~7 (
	.dataa(\omega_one[1]~q ),
	.datab(\omreg_q[1][1]~q ),
	.datac(\omreg_q[2][1]~q ),
	.datad(\omreg_q[3][1]~q ),
	.cin(gnd),
	.combout(\delom_d[1]~7_combout ),
	.cout());
defparam \delom_d[1]~7 .lut_mask = 16'h6996;
defparam \delom_d[1]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][8]~2 (
	.dataa(bd_q_8_2),
	.datab(\omreg_q[1][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[1][8]~2_combout ),
	.cout());
defparam \omreg_d[1][8]~2 .lut_mask = 16'hAACC;
defparam \omreg_d[1][8]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][8]~3 (
	.dataa(bd_q_8_3),
	.datab(\omreg_q[2][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[2][8]~3_combout ),
	.cout());
defparam \omreg_d[2][8]~3 .lut_mask = 16'hAACC;
defparam \omreg_d[2][8]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][7]~4 (
	.dataa(bd_q_7_2),
	.datab(\omreg_q[1][8]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[1][7]~4_combout ),
	.cout());
defparam \omreg_d[1][7]~4 .lut_mask = 16'hAACC;
defparam \omreg_d[1][7]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][7]~5 (
	.dataa(bd_q_7_3),
	.datab(\omreg_q[2][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[2][7]~5_combout ),
	.cout());
defparam \omreg_d[2][7]~5 .lut_mask = 16'hAACC;
defparam \omreg_d[2][7]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][7]~6 (
	.dataa(bd_q_7_4),
	.datab(\omreg_q[3][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][7]~6_combout ),
	.cout());
defparam \omreg_d[3][7]~6 .lut_mask = 16'hAACC;
defparam \omreg_d[3][7]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][6]~7 (
	.dataa(bd_q_6_2),
	.datab(\omreg_q[1][7]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[1][6]~7_combout ),
	.cout());
defparam \omreg_d[1][6]~7 .lut_mask = 16'hAACC;
defparam \omreg_d[1][6]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][6]~8 (
	.dataa(bd_q_6_3),
	.datab(\omreg_q[2][8]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[2][6]~8_combout ),
	.cout());
defparam \omreg_d[2][6]~8 .lut_mask = 16'hAACC;
defparam \omreg_d[2][6]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][6]~9 (
	.dataa(bd_q_6_4),
	.datab(\omreg_q[3][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][6]~9_combout ),
	.cout());
defparam \omreg_d[3][6]~9 .lut_mask = 16'hAACC;
defparam \omreg_d[3][6]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][2]~10 (
	.dataa(bd_q_2_2),
	.datab(load_chn),
	.datac(\omreg_q[1][1]~q ),
	.datad(\omreg_q[1][3]~q ),
	.cin(gnd),
	.combout(\omreg_d[1][2]~10_combout ),
	.cout());
defparam \omreg_d[1][2]~10 .lut_mask = 16'hEBBE;
defparam \omreg_d[1][2]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][2]~11 (
	.dataa(bd_q_2_3),
	.datab(load_chn),
	.datac(\omreg_q[2][4]~q ),
	.datad(\ifg4:g9:2:gf_mul3|c[2]~0_combout ),
	.cin(gnd),
	.combout(\omreg_d[2][2]~11_combout ),
	.cout());
defparam \omreg_d[2][2]~11 .lut_mask = 16'hEBBE;
defparam \omreg_d[2][2]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][2]~12 (
	.dataa(bd_q_2_4),
	.datab(\ifg4:g9:3:gf_mul3|c[2]~1_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][2]~12_combout ),
	.cout());
defparam \omreg_d[3][2]~12 .lut_mask = 16'hAACC;
defparam \omreg_d[3][2]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][5]~13 (
	.dataa(bd_q_5_2),
	.datab(\omreg_q[1][6]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[1][5]~13_combout ),
	.cout());
defparam \omreg_d[1][5]~13 .lut_mask = 16'hAACC;
defparam \omreg_d[1][5]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][5]~14 (
	.dataa(bd_q_5_3),
	.datab(\omreg_q[2][7]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[2][5]~14_combout ),
	.cout());
defparam \omreg_d[2][5]~14 .lut_mask = 16'hAACC;
defparam \omreg_d[2][5]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][5]~15 (
	.dataa(bd_q_5_4),
	.datab(\omreg_q[3][8]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][5]~15_combout ),
	.cout());
defparam \omreg_d[3][5]~15 .lut_mask = 16'hAACC;
defparam \omreg_d[3][5]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][3]~16 (
	.dataa(bd_q_3_2),
	.datab(load_chn),
	.datac(\omreg_q[1][1]~q ),
	.datad(\omreg_q[1][4]~q ),
	.cin(gnd),
	.combout(\omreg_d[1][3]~16_combout ),
	.cout());
defparam \omreg_d[1][3]~16 .lut_mask = 16'hEBBE;
defparam \omreg_d[1][3]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][3]~17 (
	.dataa(bd_q_3_3),
	.datab(load_chn),
	.datac(\omreg_q[2][5]~q ),
	.datad(\ifg4:g9:2:gf_mul3|c[2]~0_combout ),
	.cin(gnd),
	.combout(\omreg_d[2][3]~17_combout ),
	.cout());
defparam \omreg_d[2][3]~17 .lut_mask = 16'hEBBE;
defparam \omreg_d[2][3]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][3]~18 (
	.dataa(bd_q_3_4),
	.datab(\ifg4:g9:3:gf_mul3|c[3]~2_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][3]~18_combout ),
	.cout());
defparam \omreg_d[3][3]~18 .lut_mask = 16'hAACC;
defparam \omreg_d[3][3]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][4]~19 (
	.dataa(bd_q_4_2),
	.datab(load_chn),
	.datac(\omreg_q[1][1]~q ),
	.datad(\omreg_q[1][5]~q ),
	.cin(gnd),
	.combout(\omreg_d[1][4]~19_combout ),
	.cout());
defparam \omreg_d[1][4]~19 .lut_mask = 16'hEBBE;
defparam \omreg_d[1][4]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][4]~20 (
	.dataa(bd_q_4_3),
	.datab(load_chn),
	.datac(\omreg_q[2][6]~q ),
	.datad(\omreg_q[2][2]~q ),
	.cin(gnd),
	.combout(\omreg_d[2][4]~20_combout ),
	.cout());
defparam \omreg_d[2][4]~20 .lut_mask = 16'hEBBE;
defparam \omreg_d[2][4]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][4]~21 (
	.dataa(bd_q_4_4),
	.datab(load_chn),
	.datac(\omreg_q[3][7]~q ),
	.datad(\ifg4:g9:3:gf_mul3|c[8]~0_combout ),
	.cin(gnd),
	.combout(\omreg_d[3][4]~21_combout ),
	.cout());
defparam \omreg_d[3][4]~21 .lut_mask = 16'hEBBE;
defparam \omreg_d[3][4]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[1][1]~22 (
	.dataa(bd_q_1_2),
	.datab(\omreg_q[1][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[1][1]~22_combout ),
	.cout());
defparam \omreg_d[1][1]~22 .lut_mask = 16'hAACC;
defparam \omreg_d[1][1]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[2][1]~23 (
	.dataa(bd_q_1_3),
	.datab(load_chn),
	.datac(\omreg_q[2][1]~q ),
	.datad(\omreg_q[2][3]~q ),
	.cin(gnd),
	.combout(\omreg_d[2][1]~23_combout ),
	.cout());
defparam \omreg_d[2][1]~23 .lut_mask = 16'hEBBE;
defparam \omreg_d[2][1]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][1]~24 (
	.dataa(bd_q_1_4),
	.datab(\ifg4:g9:3:gf_mul3|c[1]~3_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][1]~24_combout ),
	.cout());
defparam \omreg_d[3][1]~24 .lut_mask = 16'hAACC;
defparam \omreg_d[3][1]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \omreg_d[3][8]~25 (
	.dataa(\omreg_q[3][1]~q ),
	.datab(\omreg_q[3][3]~q ),
	.datac(bd_q_8_4),
	.datad(load_chn),
	.cin(gnd),
	.combout(\omreg_d[3][8]~25_combout ),
	.cout());
defparam \omreg_d[3][8]~25 .lut_mask = 16'hF9F6;
defparam \omreg_d[3][8]~25 .sum_lutc_input = "datac";

cycloneive_lcell_comb polyz(
	.dataa(\polyz~0_combout ),
	.datab(\polyz~1_combout ),
	.datac(\polyz~2_combout ),
	.datad(\polyz~3_combout ),
	.cin(gnd),
	.combout(polyz1),
	.cout());
defparam polyz.lut_mask = 16'h7FFF;
defparam polyz.sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[1] (
	.dataa(\divfield_q[1]~q ),
	.datab(\polyzero_del[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_1),
	.cout());
defparam \errvec[1] .lut_mask = 16'hEEEE;
defparam \errvec[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[2] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[2]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_2),
	.cout());
defparam \errvec[2] .lut_mask = 16'hEEEE;
defparam \errvec[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[3] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_3),
	.cout());
defparam \errvec[3] .lut_mask = 16'hEEEE;
defparam \errvec[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[4] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[4]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_4),
	.cout());
defparam \errvec[4] .lut_mask = 16'hEEEE;
defparam \errvec[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[5] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[5]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_5),
	.cout());
defparam \errvec[5] .lut_mask = 16'hEEEE;
defparam \errvec[5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[6] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[6]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_6),
	.cout());
defparam \errvec[6] .lut_mask = 16'hEEEE;
defparam \errvec[6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[7] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[7]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_7),
	.cout());
defparam \errvec[7] .lut_mask = 16'hEEEE;
defparam \errvec[7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \errvec[8] (
	.dataa(\polyzero_del[3]~q ),
	.datab(\divfield_q[8]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(errvec_8),
	.cout());
defparam \errvec[8] .lut_mask = 16'hEEEE;
defparam \errvec[8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[1][1]~4 (
	.dataa(bdprev_q_1_1),
	.datab(\reg_q[1][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[1][1]~4_combout ),
	.cout());
defparam \reg_d[1][1]~4 .lut_mask = 16'hAACC;
defparam \reg_d[1][1]~4 .sum_lutc_input = "datac";

dffeas \reg_q[1][1] (
	.clk(clk),
	.d(\reg_d[1][1]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][1]~q ),
	.prn(vcc));
defparam \reg_q[1][1] .is_wysiwyg = "true";
defparam \reg_q[1][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][8]~28 (
	.dataa(bdprev_q_8_1),
	.datab(\reg_q[1][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[1][8]~28_combout ),
	.cout());
defparam \reg_d[1][8]~28 .lut_mask = 16'hAACC;
defparam \reg_d[1][8]~28 .sum_lutc_input = "datac";

dffeas \reg_q[1][8] (
	.clk(clk),
	.d(\reg_d[1][8]~28_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][8]~q ),
	.prn(vcc));
defparam \reg_q[1][8] .is_wysiwyg = "true";
defparam \reg_q[1][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][7]~24 (
	.dataa(bdprev_q_7_1),
	.datab(\reg_q[1][8]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[1][7]~24_combout ),
	.cout());
defparam \reg_d[1][7]~24 .lut_mask = 16'hAACC;
defparam \reg_d[1][7]~24 .sum_lutc_input = "datac";

dffeas \reg_q[1][7] (
	.clk(clk),
	.d(\reg_d[1][7]~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][7]~q ),
	.prn(vcc));
defparam \reg_q[1][7] .is_wysiwyg = "true";
defparam \reg_q[1][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][6]~20 (
	.dataa(bdprev_q_6_1),
	.datab(\reg_q[1][7]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[1][6]~20_combout ),
	.cout());
defparam \reg_d[1][6]~20 .lut_mask = 16'hAACC;
defparam \reg_d[1][6]~20 .sum_lutc_input = "datac";

dffeas \reg_q[1][6] (
	.clk(clk),
	.d(\reg_d[1][6]~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][6]~q ),
	.prn(vcc));
defparam \reg_q[1][6] .is_wysiwyg = "true";
defparam \reg_q[1][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][5]~16 (
	.dataa(bdprev_q_5_1),
	.datab(\reg_q[1][6]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[1][5]~16_combout ),
	.cout());
defparam \reg_d[1][5]~16 .lut_mask = 16'hAACC;
defparam \reg_d[1][5]~16 .sum_lutc_input = "datac";

dffeas \reg_q[1][5] (
	.clk(clk),
	.d(\reg_d[1][5]~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][5]~q ),
	.prn(vcc));
defparam \reg_q[1][5] .is_wysiwyg = "true";
defparam \reg_q[1][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][4]~12 (
	.dataa(bdprev_q_4_1),
	.datab(load_chn),
	.datac(\reg_q[1][1]~q ),
	.datad(\reg_q[1][5]~q ),
	.cin(gnd),
	.combout(\reg_d[1][4]~12_combout ),
	.cout());
defparam \reg_d[1][4]~12 .lut_mask = 16'hEBBE;
defparam \reg_d[1][4]~12 .sum_lutc_input = "datac";

dffeas \reg_q[1][4] (
	.clk(clk),
	.d(\reg_d[1][4]~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][4]~q ),
	.prn(vcc));
defparam \reg_q[1][4] .is_wysiwyg = "true";
defparam \reg_q[1][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][3]~8 (
	.dataa(bdprev_q_3_1),
	.datab(load_chn),
	.datac(\reg_q[1][1]~q ),
	.datad(\reg_q[1][4]~q ),
	.cin(gnd),
	.combout(\reg_d[1][3]~8_combout ),
	.cout());
defparam \reg_d[1][3]~8 .lut_mask = 16'hEBBE;
defparam \reg_d[1][3]~8 .sum_lutc_input = "datac";

dffeas \reg_q[1][3] (
	.clk(clk),
	.d(\reg_d[1][3]~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][3]~q ),
	.prn(vcc));
defparam \reg_q[1][3] .is_wysiwyg = "true";
defparam \reg_q[1][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][2]~0 (
	.dataa(bdprev_q_2_1),
	.datab(load_chn),
	.datac(\reg_q[1][1]~q ),
	.datad(\reg_q[1][3]~q ),
	.cin(gnd),
	.combout(\reg_d[1][2]~0_combout ),
	.cout());
defparam \reg_d[1][2]~0 .lut_mask = 16'hEBBE;
defparam \reg_d[1][2]~0 .sum_lutc_input = "datac";

dffeas \reg_q[1][2] (
	.clk(clk),
	.d(\reg_d[1][2]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[1][2]~q ),
	.prn(vcc));
defparam \reg_q[1][2] .is_wysiwyg = "true";
defparam \reg_q[1][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][2]~1 (
	.dataa(bdprev_q_2_3),
	.datab(\g5:3:gf_mul2|c[2]~0_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][2]~1_combout ),
	.cout());
defparam \reg_d[3][2]~1 .lut_mask = 16'hAACC;
defparam \reg_d[3][2]~1 .sum_lutc_input = "datac";

dffeas \reg_q[3][2] (
	.clk(clk),
	.d(\reg_d[3][2]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][2]~q ),
	.prn(vcc));
defparam \reg_q[3][2] .is_wysiwyg = "true";
defparam \reg_q[3][2] .power_up = "low";

cycloneive_lcell_comb \drvadder_in[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][2]~q ),
	.datad(\reg_q[3][2]~q ),
	.cin(gnd),
	.combout(\drvadder_in[2]~combout ),
	.cout());
defparam \drvadder_in[2] .lut_mask = 16'h0FF0;
defparam \drvadder_in[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[2][8]~30 (
	.dataa(bdprev_q_8_2),
	.datab(\reg_q[2][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[2][8]~30_combout ),
	.cout());
defparam \reg_d[2][8]~30 .lut_mask = 16'hAACC;
defparam \reg_d[2][8]~30 .sum_lutc_input = "datac";

dffeas \reg_q[2][8] (
	.clk(clk),
	.d(\reg_d[2][8]~30_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][8]~q ),
	.prn(vcc));
defparam \reg_q[2][8] .is_wysiwyg = "true";
defparam \reg_q[2][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][6]~22 (
	.dataa(bdprev_q_6_2),
	.datab(\reg_q[2][8]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[2][6]~22_combout ),
	.cout());
defparam \reg_d[2][6]~22 .lut_mask = 16'hAACC;
defparam \reg_d[2][6]~22 .sum_lutc_input = "datac";

dffeas \reg_q[2][6] (
	.clk(clk),
	.d(\reg_d[2][6]~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][6]~q ),
	.prn(vcc));
defparam \reg_q[2][6] .is_wysiwyg = "true";
defparam \reg_q[2][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][4]~14 (
	.dataa(bdprev_q_4_2),
	.datab(load_chn),
	.datac(\reg_q[2][2]~q ),
	.datad(\reg_q[2][6]~q ),
	.cin(gnd),
	.combout(\reg_d[2][4]~14_combout ),
	.cout());
defparam \reg_d[2][4]~14 .lut_mask = 16'hEBBE;
defparam \reg_d[2][4]~14 .sum_lutc_input = "datac";

dffeas \reg_q[2][4] (
	.clk(clk),
	.d(\reg_d[2][4]~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][4]~q ),
	.prn(vcc));
defparam \reg_q[2][4] .is_wysiwyg = "true";
defparam \reg_q[2][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][2]~2 (
	.dataa(bdprev_q_2_2),
	.datab(load_chn),
	.datac(\reg_q[2][4]~q ),
	.datad(\g5:2:gf_mul2|c[2]~0_combout ),
	.cin(gnd),
	.combout(\reg_d[2][2]~2_combout ),
	.cout());
defparam \reg_d[2][2]~2 .lut_mask = 16'hEBBE;
defparam \reg_d[2][2]~2 .sum_lutc_input = "datac";

dffeas \reg_q[2][2] (
	.clk(clk),
	.d(\reg_d[2][2]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][2]~q ),
	.prn(vcc));
defparam \reg_q[2][2] .is_wysiwyg = "true";
defparam \reg_q[2][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][2]~3 (
	.dataa(bdprev_q_2_4),
	.datab(\g5:4:gf_mul2|c[2]~combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[4][2]~3_combout ),
	.cout());
defparam \reg_d[4][2]~3 .lut_mask = 16'hAACC;
defparam \reg_d[4][2]~3 .sum_lutc_input = "datac";

dffeas \reg_q[4][2] (
	.clk(clk),
	.d(\reg_d[4][2]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][2]~q ),
	.prn(vcc));
defparam \reg_q[4][2] .is_wysiwyg = "true";
defparam \reg_q[4][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][1]~5 (
	.dataa(bdprev_q_1_3),
	.datab(\g5:3:gf_mul2|c[1]~1_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][1]~5_combout ),
	.cout());
defparam \reg_d[3][1]~5 .lut_mask = 16'hAACC;
defparam \reg_d[3][1]~5 .sum_lutc_input = "datac";

dffeas \reg_q[3][1] (
	.clk(clk),
	.d(\reg_d[3][1]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][1]~q ),
	.prn(vcc));
defparam \reg_q[3][1] .is_wysiwyg = "true";
defparam \reg_q[3][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][7]~26 (
	.dataa(bdprev_q_7_2),
	.datab(\reg_q[2][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[2][7]~26_combout ),
	.cout());
defparam \reg_d[2][7]~26 .lut_mask = 16'hAACC;
defparam \reg_d[2][7]~26 .sum_lutc_input = "datac";

dffeas \reg_q[2][7] (
	.clk(clk),
	.d(\reg_d[2][7]~26_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][7]~q ),
	.prn(vcc));
defparam \reg_q[2][7] .is_wysiwyg = "true";
defparam \reg_q[2][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][5]~18 (
	.dataa(bdprev_q_5_2),
	.datab(\reg_q[2][7]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[2][5]~18_combout ),
	.cout());
defparam \reg_d[2][5]~18 .lut_mask = 16'hAACC;
defparam \reg_d[2][5]~18 .sum_lutc_input = "datac";

dffeas \reg_q[2][5] (
	.clk(clk),
	.d(\reg_d[2][5]~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][5]~q ),
	.prn(vcc));
defparam \reg_q[2][5] .is_wysiwyg = "true";
defparam \reg_q[2][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][3]~10 (
	.dataa(bdprev_q_3_2),
	.datab(load_chn),
	.datac(\reg_q[2][5]~q ),
	.datad(\g5:2:gf_mul2|c[2]~0_combout ),
	.cin(gnd),
	.combout(\reg_d[2][3]~10_combout ),
	.cout());
defparam \reg_d[2][3]~10 .lut_mask = 16'hEBBE;
defparam \reg_d[2][3]~10 .sum_lutc_input = "datac";

dffeas \reg_q[2][3] (
	.clk(clk),
	.d(\reg_d[2][3]~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][3]~q ),
	.prn(vcc));
defparam \reg_q[2][3] .is_wysiwyg = "true";
defparam \reg_q[2][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][1]~6 (
	.dataa(bdprev_q_1_2),
	.datab(load_chn),
	.datac(\reg_q[2][1]~q ),
	.datad(\reg_q[2][3]~q ),
	.cin(gnd),
	.combout(\reg_d[2][1]~6_combout ),
	.cout());
defparam \reg_d[2][1]~6 .lut_mask = 16'hEBBE;
defparam \reg_d[2][1]~6 .sum_lutc_input = "datac";

dffeas \reg_q[2][1] (
	.clk(clk),
	.d(\reg_d[2][1]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[2][1]~q ),
	.prn(vcc));
defparam \reg_q[2][1] .is_wysiwyg = "true";
defparam \reg_q[2][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][1]~7 (
	.dataa(bdprev_q_1_4),
	.datab(\g5:4:gf_mul2|c[1]~0_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[4][1]~7_combout ),
	.cout());
defparam \reg_d[4][1]~7 .lut_mask = 16'hAACC;
defparam \reg_d[4][1]~7 .sum_lutc_input = "datac";

dffeas \reg_q[4][1] (
	.clk(clk),
	.d(\reg_d[4][1]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][1]~q ),
	.prn(vcc));
defparam \reg_q[4][1] .is_wysiwyg = "true";
defparam \reg_q[4][1] .power_up = "low";

cycloneive_lcell_comb \halfadd[1]~0 (
	.dataa(\reg_q[1][1]~q ),
	.datab(\reg_q[3][1]~q ),
	.datac(\reg_q[2][1]~q ),
	.datad(\reg_q[4][1]~q ),
	.cin(gnd),
	.combout(\halfadd[1]~0_combout ),
	.cout());
defparam \halfadd[1]~0 .lut_mask = 16'h6996;
defparam \halfadd[1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \polyz~0 (
	.dataa(\drvadder_in[2]~combout ),
	.datab(\reg_q[2][2]~q ),
	.datac(\reg_q[4][2]~q ),
	.datad(\halfadd[1]~0_combout ),
	.cin(gnd),
	.combout(\polyz~0_combout ),
	.cout());
defparam \polyz~0 .lut_mask = 16'h96FF;
defparam \polyz~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[3][3]~9 (
	.dataa(bdprev_q_3_3),
	.datab(\g5:3:gf_mul2|c[3]~2_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][3]~9_combout ),
	.cout());
defparam \reg_d[3][3]~9 .lut_mask = 16'hAACC;
defparam \reg_d[3][3]~9 .sum_lutc_input = "datac";

dffeas \reg_q[3][3] (
	.clk(clk),
	.d(\reg_d[3][3]~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][3]~q ),
	.prn(vcc));
defparam \reg_q[3][3] .is_wysiwyg = "true";
defparam \reg_q[3][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][3]~11 (
	.dataa(bdprev_q_3_4),
	.datab(\g5:4:gf_mul2|c[3]~1_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[4][3]~11_combout ),
	.cout());
defparam \reg_d[4][3]~11 .lut_mask = 16'hAACC;
defparam \reg_d[4][3]~11 .sum_lutc_input = "datac";

dffeas \reg_q[4][3] (
	.clk(clk),
	.d(\reg_d[4][3]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][3]~q ),
	.prn(vcc));
defparam \reg_q[4][3] .is_wysiwyg = "true";
defparam \reg_q[4][3] .power_up = "low";

cycloneive_lcell_comb \halfadd[3]~1 (
	.dataa(\reg_q[1][3]~q ),
	.datab(\reg_q[3][3]~q ),
	.datac(\reg_q[2][3]~q ),
	.datad(\reg_q[4][3]~q ),
	.cin(gnd),
	.combout(\halfadd[3]~1_combout ),
	.cout());
defparam \halfadd[3]~1 .lut_mask = 16'h6996;
defparam \halfadd[3]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[3][4]~13 (
	.dataa(bdprev_q_4_3),
	.datab(\g5:3:gf_mul2|c[4]~combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][4]~13_combout ),
	.cout());
defparam \reg_d[3][4]~13 .lut_mask = 16'hAACC;
defparam \reg_d[3][4]~13 .sum_lutc_input = "datac";

dffeas \reg_q[3][4] (
	.clk(clk),
	.d(\reg_d[3][4]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][4]~q ),
	.prn(vcc));
defparam \reg_q[3][4] .is_wysiwyg = "true";
defparam \reg_q[3][4] .power_up = "low";

cycloneive_lcell_comb \drvadder_in[4] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][4]~q ),
	.datad(\reg_q[3][4]~q ),
	.cin(gnd),
	.combout(\drvadder_in[4]~combout ),
	.cout());
defparam \drvadder_in[4] .lut_mask = 16'h0FF0;
defparam \drvadder_in[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[4][8]~31 (
	.dataa(bdprev_q_8_4),
	.datab(\g5:4:gf_mul2|c[8]~2_combout ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[4][8]~31_combout ),
	.cout());
defparam \reg_d[4][8]~31 .lut_mask = 16'hAACC;
defparam \reg_d[4][8]~31 .sum_lutc_input = "datac";

dffeas \reg_q[4][8] (
	.clk(clk),
	.d(\reg_d[4][8]~31_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][8]~q ),
	.prn(vcc));
defparam \reg_q[4][8] .is_wysiwyg = "true";
defparam \reg_q[4][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][4]~15 (
	.dataa(bdprev_q_4_4),
	.datab(load_chn),
	.datac(\reg_q[4][8]~q ),
	.datad(\g5:4:gf_mul2|c[8]~2_combout ),
	.cin(gnd),
	.combout(\reg_d[4][4]~15_combout ),
	.cout());
defparam \reg_d[4][4]~15 .lut_mask = 16'hEBBE;
defparam \reg_d[4][4]~15 .sum_lutc_input = "datac";

dffeas \reg_q[4][4] (
	.clk(clk),
	.d(\reg_d[4][4]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][4]~q ),
	.prn(vcc));
defparam \reg_q[4][4] .is_wysiwyg = "true";
defparam \reg_q[4][4] .power_up = "low";

cycloneive_lcell_comb \polyz~1 (
	.dataa(\halfadd[3]~1_combout ),
	.datab(\drvadder_in[4]~combout ),
	.datac(\reg_q[2][4]~q ),
	.datad(\reg_q[4][4]~q ),
	.cin(gnd),
	.combout(\polyz~1_combout ),
	.cout());
defparam \polyz~1 .lut_mask = 16'hEBBE;
defparam \polyz~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[3][8]~29 (
	.dataa(bdprev_q_8_3),
	.datab(load_chn),
	.datac(\reg_q[3][1]~q ),
	.datad(\reg_q[3][3]~q ),
	.cin(gnd),
	.combout(\reg_d[3][8]~29_combout ),
	.cout());
defparam \reg_d[3][8]~29 .lut_mask = 16'hEBBE;
defparam \reg_d[3][8]~29 .sum_lutc_input = "datac";

dffeas \reg_q[3][8] (
	.clk(clk),
	.d(\reg_d[3][8]~29_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][8]~q ),
	.prn(vcc));
defparam \reg_q[3][8] .is_wysiwyg = "true";
defparam \reg_q[3][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][5]~17 (
	.dataa(bdprev_q_5_3),
	.datab(\reg_q[3][8]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][5]~17_combout ),
	.cout());
defparam \reg_d[3][5]~17 .lut_mask = 16'hAACC;
defparam \reg_d[3][5]~17 .sum_lutc_input = "datac";

dffeas \reg_q[3][5] (
	.clk(clk),
	.d(\reg_d[3][5]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][5]~q ),
	.prn(vcc));
defparam \reg_q[3][5] .is_wysiwyg = "true";
defparam \reg_q[3][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][5]~19 (
	.dataa(bdprev_q_5_4),
	.datab(\reg_q[4][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[4][5]~19_combout ),
	.cout());
defparam \reg_d[4][5]~19 .lut_mask = 16'hAACC;
defparam \reg_d[4][5]~19 .sum_lutc_input = "datac";

dffeas \reg_q[4][5] (
	.clk(clk),
	.d(\reg_d[4][5]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][5]~q ),
	.prn(vcc));
defparam \reg_q[4][5] .is_wysiwyg = "true";
defparam \reg_q[4][5] .power_up = "low";

cycloneive_lcell_comb \halfadd[5]~2 (
	.dataa(\reg_q[1][5]~q ),
	.datab(\reg_q[3][5]~q ),
	.datac(\reg_q[2][5]~q ),
	.datad(\reg_q[4][5]~q ),
	.cin(gnd),
	.combout(\halfadd[5]~2_combout ),
	.cout());
defparam \halfadd[5]~2 .lut_mask = 16'h6996;
defparam \halfadd[5]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[3][6]~21 (
	.dataa(bdprev_q_6_3),
	.datab(\reg_q[3][1]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][6]~21_combout ),
	.cout());
defparam \reg_d[3][6]~21 .lut_mask = 16'hAACC;
defparam \reg_d[3][6]~21 .sum_lutc_input = "datac";

dffeas \reg_q[3][6] (
	.clk(clk),
	.d(\reg_d[3][6]~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][6]~q ),
	.prn(vcc));
defparam \reg_q[3][6] .is_wysiwyg = "true";
defparam \reg_q[3][6] .power_up = "low";

cycloneive_lcell_comb \drvadder_in[6] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][6]~q ),
	.datad(\reg_q[3][6]~q ),
	.cin(gnd),
	.combout(\drvadder_in[6]~combout ),
	.cout());
defparam \drvadder_in[6] .lut_mask = 16'h0FF0;
defparam \drvadder_in[6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[4][6]~23 (
	.dataa(bdprev_q_6_4),
	.datab(\reg_q[4][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[4][6]~23_combout ),
	.cout());
defparam \reg_d[4][6]~23 .lut_mask = 16'hAACC;
defparam \reg_d[4][6]~23 .sum_lutc_input = "datac";

dffeas \reg_q[4][6] (
	.clk(clk),
	.d(\reg_d[4][6]~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][6]~q ),
	.prn(vcc));
defparam \reg_q[4][6] .is_wysiwyg = "true";
defparam \reg_q[4][6] .power_up = "low";

cycloneive_lcell_comb \polyz~2 (
	.dataa(\halfadd[5]~2_combout ),
	.datab(\drvadder_in[6]~combout ),
	.datac(\reg_q[2][6]~q ),
	.datad(\reg_q[4][6]~q ),
	.cin(gnd),
	.combout(\polyz~2_combout ),
	.cout());
defparam \polyz~2 .lut_mask = 16'hEBBE;
defparam \polyz~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[3][7]~25 (
	.dataa(bdprev_q_7_3),
	.datab(\reg_q[3][2]~q ),
	.datac(gnd),
	.datad(load_chn),
	.cin(gnd),
	.combout(\reg_d[3][7]~25_combout ),
	.cout());
defparam \reg_d[3][7]~25 .lut_mask = 16'hAACC;
defparam \reg_d[3][7]~25 .sum_lutc_input = "datac";

dffeas \reg_q[3][7] (
	.clk(clk),
	.d(\reg_d[3][7]~25_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[3][7]~q ),
	.prn(vcc));
defparam \reg_q[3][7] .is_wysiwyg = "true";
defparam \reg_q[3][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][7]~27 (
	.dataa(bdprev_q_7_4),
	.datab(load_chn),
	.datac(\reg_q[4][1]~q ),
	.datad(\reg_q[4][3]~q ),
	.cin(gnd),
	.combout(\reg_d[4][7]~27_combout ),
	.cout());
defparam \reg_d[4][7]~27 .lut_mask = 16'hEBBE;
defparam \reg_d[4][7]~27 .sum_lutc_input = "datac";

dffeas \reg_q[4][7] (
	.clk(clk),
	.d(\reg_d[4][7]~27_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\reg_q[4][7]~q ),
	.prn(vcc));
defparam \reg_q[4][7] .is_wysiwyg = "true";
defparam \reg_q[4][7] .power_up = "low";

cycloneive_lcell_comb \halfadd[7]~3 (
	.dataa(\reg_q[1][7]~q ),
	.datab(\reg_q[3][7]~q ),
	.datac(\reg_q[2][7]~q ),
	.datad(\reg_q[4][7]~q ),
	.cin(gnd),
	.combout(\halfadd[7]~3_combout ),
	.cout());
defparam \halfadd[7]~3 .lut_mask = 16'h6996;
defparam \halfadd[7]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \drvadder_in[8] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[1][8]~q ),
	.datad(\reg_q[3][8]~q ),
	.cin(gnd),
	.combout(\drvadder_in[8]~combout ),
	.cout());
defparam \drvadder_in[8] .lut_mask = 16'h0FF0;
defparam \drvadder_in[8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \polyz~3 (
	.dataa(\halfadd[7]~3_combout ),
	.datab(\drvadder_in[8]~combout ),
	.datac(\reg_q[2][8]~q ),
	.datad(\reg_q[4][8]~q ),
	.cin(gnd),
	.combout(\polyz~3_combout ),
	.cout());
defparam \polyz~3 .lut_mask = 16'hEBBE;
defparam \polyz~3 .sum_lutc_input = "datac";

dffeas \divfield_q[1] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[1]~q ),
	.prn(vcc));
defparam \divfield_q[1] .is_wysiwyg = "true";
defparam \divfield_q[1] .power_up = "low";

dffeas \polyzero_del[1] (
	.clk(clk),
	.d(polyz1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\polyzero_del[1]~q ),
	.prn(vcc));
defparam \polyzero_del[1] .is_wysiwyg = "true";
defparam \polyzero_del[1] .power_up = "low";

dffeas \polyzero_del[2] (
	.clk(clk),
	.d(\polyzero_del[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\polyzero_del[2]~q ),
	.prn(vcc));
defparam \polyzero_del[2] .is_wysiwyg = "true";
defparam \polyzero_del[2] .power_up = "low";

dffeas \polyzero_del[3] (
	.clk(clk),
	.d(\polyzero_del[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\polyzero_del[3]~q ),
	.prn(vcc));
defparam \polyzero_del[3] .is_wysiwyg = "true";
defparam \polyzero_del[3] .power_up = "low";

dffeas \divfield_q[2] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[2]~q ),
	.prn(vcc));
defparam \divfield_q[2] .is_wysiwyg = "true";
defparam \divfield_q[2] .power_up = "low";

dffeas \divfield_q[3] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[3]~q ),
	.prn(vcc));
defparam \divfield_q[3] .is_wysiwyg = "true";
defparam \divfield_q[3] .power_up = "low";

dffeas \divfield_q[4] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[4]~q ),
	.prn(vcc));
defparam \divfield_q[4] .is_wysiwyg = "true";
defparam \divfield_q[4] .power_up = "low";

dffeas \divfield_q[5] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[5]~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[5]~q ),
	.prn(vcc));
defparam \divfield_q[5] .is_wysiwyg = "true";
defparam \divfield_q[5] .power_up = "low";

dffeas \divfield_q[6] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[6]~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[6]~q ),
	.prn(vcc));
defparam \divfield_q[6] .is_wysiwyg = "true";
defparam \divfield_q[6] .power_up = "low";

dffeas \divfield_q[7] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[7]~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[7]~q ),
	.prn(vcc));
defparam \divfield_q[7] .is_wysiwyg = "true";
defparam \divfield_q[7] .power_up = "low";

dffeas \divfield_q[8] (
	.clk(clk),
	.d(\gf_div|gf_mul|c[8]~26_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\divfield_q[8]~q ),
	.prn(vcc));
defparam \divfield_q[8] .is_wysiwyg = "true";
defparam \divfield_q[8] .power_up = "low";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfdiv_1 (
	d,
	delom_q_8,
	delom_q_7,
	delom_q_6,
	delom_q_2,
	delom_q_5,
	delom_q_3,
	delom_q_4,
	delom_q_1,
	c_1,
	c_2,
	c_3,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
input 	[8:1] d;
input 	delom_q_8;
input 	delom_q_7;
input 	delom_q_6;
input 	delom_q_2;
input 	delom_q_5;
input 	delom_q_3;
input 	delom_q_4;
input 	delom_q_1;
output 	c_1;
output 	c_2;
output 	c_3;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \rom|auto_generated|q_a[6] ;
wire \rom|auto_generated|q_a[5] ;
wire \rom|auto_generated|q_a[7] ;
wire \rom|auto_generated|q_a[2] ;
wire \rom|auto_generated|q_a[1] ;
wire \rom|auto_generated|q_a[4] ;
wire \rom|auto_generated|q_a[3] ;
wire \rom|auto_generated|q_a[0] ;
wire \b_q[7]~q ;
wire \b_q[6]~q ;
wire \b_q[8]~q ;
wire \b_q[3]~q ;
wire \b_q[2]~q ;
wire \b_q[5]~q ;
wire \b_q[4]~q ;
wire \b_q[1]~q ;


RS_DE_LANE_QUATUS_auk_rs_gfmul_5 gf_mul(
	.delom_q_8(delom_q_8),
	.delom_q_7(delom_q_7),
	.b_q_7(\b_q[7]~q ),
	.b_q_6(\b_q[6]~q ),
	.delom_q_6(delom_q_6),
	.b_q_8(\b_q[8]~q ),
	.b_q_3(\b_q[3]~q ),
	.b_q_2(\b_q[2]~q ),
	.delom_q_2(delom_q_2),
	.delom_q_5(delom_q_5),
	.b_q_5(\b_q[5]~q ),
	.b_q_4(\b_q[4]~q ),
	.delom_q_3(delom_q_3),
	.delom_q_4(delom_q_4),
	.delom_q_1(delom_q_1),
	.b_q_1(\b_q[1]~q ),
	.c_1(c_1),
	.c_2(c_2),
	.c_3(c_3),
	.c_4(c_4),
	.c_5(c_5),
	.c_6(c_6),
	.c_7(c_7),
	.c_8(c_8));

RS_DE_LANE_QUATUS_altsyncram_2 rom(
	.q_a({\rom|auto_generated|q_a[7] ,\rom|auto_generated|q_a[6] ,\rom|auto_generated|q_a[5] ,\rom|auto_generated|q_a[4] ,\rom|auto_generated|q_a[3] ,\rom|auto_generated|q_a[2] ,\rom|auto_generated|q_a[1] ,\rom|auto_generated|q_a[0] }),
	.address_a({gnd,gnd,d[8],d[7],d[6],d[5],d[4],d[3],d[2],d[1]}),
	.clock0(clk));

dffeas \b_q[7] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[6] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[7]~q ),
	.prn(vcc));
defparam \b_q[7] .is_wysiwyg = "true";
defparam \b_q[7] .power_up = "low";

dffeas \b_q[6] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[5] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[6]~q ),
	.prn(vcc));
defparam \b_q[6] .is_wysiwyg = "true";
defparam \b_q[6] .power_up = "low";

dffeas \b_q[8] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[7] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[8]~q ),
	.prn(vcc));
defparam \b_q[8] .is_wysiwyg = "true";
defparam \b_q[8] .power_up = "low";

dffeas \b_q[3] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[2] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[3]~q ),
	.prn(vcc));
defparam \b_q[3] .is_wysiwyg = "true";
defparam \b_q[3] .power_up = "low";

dffeas \b_q[2] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[1] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[2]~q ),
	.prn(vcc));
defparam \b_q[2] .is_wysiwyg = "true";
defparam \b_q[2] .power_up = "low";

dffeas \b_q[5] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[4] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[5]~q ),
	.prn(vcc));
defparam \b_q[5] .is_wysiwyg = "true";
defparam \b_q[5] .power_up = "low";

dffeas \b_q[4] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[3] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[4]~q ),
	.prn(vcc));
defparam \b_q[4] .is_wysiwyg = "true";
defparam \b_q[4] .power_up = "low";

dffeas \b_q[1] (
	.clk(clk),
	.d(\rom|auto_generated|q_a[0] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\b_q[1]~q ),
	.prn(vcc));
defparam \b_q[1] .is_wysiwyg = "true";
defparam \b_q[1] .power_up = "low";

endmodule

module RS_DE_LANE_QUATUS_altsyncram_2 (
	q_a,
	address_a,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_a;
input 	[9:0] address_a;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



RS_DE_LANE_QUATUS_altsyncram_udq3_1 auto_generated(
	.q_a({q_a[7],q_a[6],q_a[5],q_a[4],q_a[3],q_a[2],q_a[1],q_a[0]}),
	.address_a({address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clock0(clock0));

endmodule

module RS_DE_LANE_QUATUS_altsyncram_udq3_1 (
	q_a,
	address_a,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_a;
input 	[7:0] address_a;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a6_PORTADATAOUT_bus;
wire [143:0] ram_block1a5_PORTADATAOUT_bus;
wire [143:0] ram_block1a7_PORTADATAOUT_bus;
wire [143:0] ram_block1a2_PORTADATAOUT_bus;
wire [143:0] ram_block1a1_PORTADATAOUT_bus;
wire [143:0] ram_block1a4_PORTADATAOUT_bus;
wire [143:0] ram_block1a3_PORTADATAOUT_bus;
wire [143:0] ram_block1a0_PORTADATAOUT_bus;

assign q_a[6] = ram_block1a6_PORTADATAOUT_bus[0];

assign q_a[5] = ram_block1a5_PORTADATAOUT_bus[0];

assign q_a[7] = ram_block1a7_PORTADATAOUT_bus[0];

assign q_a[2] = ram_block1a2_PORTADATAOUT_bus[0];

assign q_a[1] = ram_block1a1_PORTADATAOUT_bus[0];

assign q_a[4] = ram_block1a4_PORTADATAOUT_bus[0];

assign q_a[3] = ram_block1a3_PORTADATAOUT_bus[0];

assign q_a[0] = ram_block1a0_PORTADATAOUT_bus[0];

cycloneive_ram_block ram_block1a6(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a6_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a6.data_interleave_offset_in_bits = 1;
defparam ram_block1a6.data_interleave_width_in_bits = 1;
defparam ram_block1a6.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a6.init_file_layout = "port_a";
defparam ram_block1a6.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a6.operation_mode = "rom";
defparam ram_block1a6.port_a_address_clear = "none";
defparam ram_block1a6.port_a_address_width = 8;
defparam ram_block1a6.port_a_data_out_clear = "none";
defparam ram_block1a6.port_a_data_out_clock = "none";
defparam ram_block1a6.port_a_data_width = 1;
defparam ram_block1a6.port_a_first_address = 0;
defparam ram_block1a6.port_a_first_bit_number = 6;
defparam ram_block1a6.port_a_last_address = 255;
defparam ram_block1a6.port_a_logical_ram_depth = 256;
defparam ram_block1a6.port_a_logical_ram_width = 8;
defparam ram_block1a6.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.ram_block_type = "auto";
defparam ram_block1a6.mem_init0 = 256'hFFCB97CC0EFE2F120B3E0168428EB172E3FA25AE8E84602E85E58B3B46DF4458;

cycloneive_ram_block ram_block1a5(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a5_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a5.data_interleave_offset_in_bits = 1;
defparam ram_block1a5.data_interleave_width_in_bits = 1;
defparam ram_block1a5.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a5.init_file_layout = "port_a";
defparam ram_block1a5.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a5.operation_mode = "rom";
defparam ram_block1a5.port_a_address_clear = "none";
defparam ram_block1a5.port_a_address_width = 8;
defparam ram_block1a5.port_a_data_out_clear = "none";
defparam ram_block1a5.port_a_data_out_clock = "none";
defparam ram_block1a5.port_a_data_width = 1;
defparam ram_block1a5.port_a_first_address = 0;
defparam ram_block1a5.port_a_first_bit_number = 5;
defparam ram_block1a5.port_a_last_address = 255;
defparam ram_block1a5.port_a_logical_ram_depth = 256;
defparam ram_block1a5.port_a_logical_ram_width = 8;
defparam ram_block1a5.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.ram_block_type = "auto";
defparam ram_block1a5.mem_init0 = 256'hFC0FFFEE0E1BE67CCAFECA109420AED4CAB1FC1148C725459A1CD15790B231E8;

cycloneive_ram_block ram_block1a7(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a7_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a7.data_interleave_offset_in_bits = 1;
defparam ram_block1a7.data_interleave_width_in_bits = 1;
defparam ram_block1a7.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a7.init_file_layout = "port_a";
defparam ram_block1a7.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a7.operation_mode = "rom";
defparam ram_block1a7.port_a_address_clear = "none";
defparam ram_block1a7.port_a_address_width = 8;
defparam ram_block1a7.port_a_data_out_clear = "none";
defparam ram_block1a7.port_a_data_out_clock = "none";
defparam ram_block1a7.port_a_data_width = 1;
defparam ram_block1a7.port_a_first_address = 0;
defparam ram_block1a7.port_a_first_bit_number = 7;
defparam ram_block1a7.port_a_last_address = 255;
defparam ram_block1a7.port_a_logical_ram_depth = 256;
defparam ram_block1a7.port_a_logical_ram_width = 8;
defparam ram_block1a7.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.ram_block_type = "auto";
defparam ram_block1a7.mem_init0 = 256'hA6EF4DFC90DC53E4F1F7D12EDE3280E4F97A2E341618825C9C3222823B15AFAC;

cycloneive_ram_block ram_block1a2(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a2_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a2.init_file_layout = "port_a";
defparam ram_block1a2.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.operation_mode = "rom";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 8;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 255;
defparam ram_block1a2.port_a_logical_ram_depth = 256;
defparam ram_block1a2.port_a_logical_ram_width = 8;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.ram_block_type = "auto";
defparam ram_block1a2.mem_init0 = 256'hFA261A1704C8329CD7C7DDDD5EEE8C7AF60066E3704878EB649C946306E0D73C;

cycloneive_ram_block ram_block1a1(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a1_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a1.init_file_layout = "port_a";
defparam ram_block1a1.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.operation_mode = "rom";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 8;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 255;
defparam ram_block1a1.port_a_logical_ram_depth = 256;
defparam ram_block1a1.port_a_logical_ram_width = 8;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.ram_block_type = "auto";
defparam ram_block1a1.mem_init0 = 256'h717BC55626E88FC1ECFDC36EC15A54014F60CD4E7D22BC7316ACFCA0E2A2A0F4;

cycloneive_ram_block ram_block1a4(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a4_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a4.data_interleave_offset_in_bits = 1;
defparam ram_block1a4.data_interleave_width_in_bits = 1;
defparam ram_block1a4.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a4.init_file_layout = "port_a";
defparam ram_block1a4.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a4.operation_mode = "rom";
defparam ram_block1a4.port_a_address_clear = "none";
defparam ram_block1a4.port_a_address_width = 8;
defparam ram_block1a4.port_a_data_out_clear = "none";
defparam ram_block1a4.port_a_data_out_clock = "none";
defparam ram_block1a4.port_a_data_width = 1;
defparam ram_block1a4.port_a_first_address = 0;
defparam ram_block1a4.port_a_first_bit_number = 4;
defparam ram_block1a4.port_a_last_address = 255;
defparam ram_block1a4.port_a_logical_ram_depth = 256;
defparam ram_block1a4.port_a_logical_ram_width = 8;
defparam ram_block1a4.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.ram_block_type = "auto";
defparam ram_block1a4.mem_init0 = 256'hFA444FABDFDAABABB860DA150EB3929BCBEE895A5121991F4180472C072BDEC8;

cycloneive_ram_block ram_block1a3(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a3_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a3.init_file_layout = "port_a";
defparam ram_block1a3.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.operation_mode = "rom";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 8;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 255;
defparam ram_block1a3.port_a_logical_ram_depth = 256;
defparam ram_block1a3.port_a_logical_ram_width = 8;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.ram_block_type = "auto";
defparam ram_block1a3.mem_init0 = 256'hF4A891027815E8A268DC7F0537FB2939E9F9669C242D0E263C8FACC7C2697FC4;

cycloneive_ram_block ram_block1a0(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(gnd),
	.ena0(vcc),
	.ena1(vcc),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain(1'b0),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr(1'b0),
	.portbbyteenamasks(1'b1),
	.portadataout(ram_block1a0_PORTADATAOUT_bus),
	.portbdataout());
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.init_file = "RS_DE_LANE_QUATUS_inv_8_285.hex";
defparam ram_block1a0.init_file_layout = "port_a";
defparam ram_block1a0.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_chn_atl:chnr|auk_rs_gfdiv:gf_div|altsyncram:rom|altsyncram_udq3:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.operation_mode = "rom";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 8;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 255;
defparam ram_block1a0.port_a_logical_ram_depth = 256;
defparam ram_block1a0.port_a_logical_ram_width = 8;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.ram_block_type = "auto";
defparam ram_block1a0.mem_init0 = 256'hB8F734A2D273325E1DDB8684655ABF0D2BBE4EDADFD2E40ADC26640E64005732;

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_5 (
	delom_q_8,
	delom_q_7,
	b_q_7,
	b_q_6,
	delom_q_6,
	b_q_8,
	b_q_3,
	b_q_2,
	delom_q_2,
	delom_q_5,
	b_q_5,
	b_q_4,
	delom_q_3,
	delom_q_4,
	delom_q_1,
	b_q_1,
	c_1,
	c_2,
	c_3,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8)/* synthesis synthesis_greybox=1 */;
input 	delom_q_8;
input 	delom_q_7;
input 	b_q_7;
input 	b_q_6;
input 	delom_q_6;
input 	b_q_8;
input 	b_q_3;
input 	b_q_2;
input 	delom_q_2;
input 	delom_q_5;
input 	b_q_5;
input 	b_q_4;
input 	delom_q_3;
input 	delom_q_4;
input 	delom_q_1;
input 	b_q_1;
output 	c_1;
output 	c_2;
output 	c_3;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \logic:total[8][13]~0_combout ;
wire \logic:total[8][13]~1_combout ;
wire \logic:extra[6][9]~0_combout ;
wire \logic:extra[7][9]~0_combout ;
wire \logic:extra[7][9]~1_combout ;
wire \logic:extra[7][9]~2_combout ;
wire \logic:extra[7][9]~3_combout ;
wire \logic:extra[7][9]~combout ;
wire \logic:extra[6][9]~1_combout ;
wire \logic:extra[6][9]~2_combout ;
wire \logic:extra[6][9]~3_combout ;
wire \logic:extra[6][9]~4_combout ;
wire \c[2]~0_combout ;
wire \logic:extra[5][9]~0_combout ;
wire \logic:extra[5][9]~1_combout ;
wire \logic:extra[5][9]~2_combout ;
wire \c[5]~1_combout ;
wire \c[3]~2_combout ;
wire \c[4]~3_combout ;
wire \c[4]~4_combout ;
wire \logic:total[8][12]~0_combout ;
wire \logic:total[8][12]~1_combout ;
wire \c[6]~5_combout ;
wire \c[5]~6_combout ;
wire \c[5]~7_combout ;
wire \c[5]~8_combout ;
wire \logic:total[8][15]~combout ;
wire \logic:total[8][14]~combout ;
wire \c[6]~10_combout ;
wire \c[6]~11_combout ;
wire \c[6]~12_combout ;
wire \c[6]~13_combout ;
wire \c[7]~15_combout ;
wire \c[7]~16_combout ;
wire \c[7]~17_combout ;
wire \c[7]~18_combout ;
wire \c[7]~19_combout ;
wire \c[8]~21_combout ;
wire \c[8]~22_combout ;
wire \c[8]~23_combout ;
wire \c[8]~24_combout ;
wire \c[8]~25_combout ;


cycloneive_lcell_comb \c[1] (
	.dataa(gnd),
	.datab(\logic:extra[7][9]~combout ),
	.datac(delom_q_1),
	.datad(b_q_1),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1] .lut_mask = 16'hC33C;
defparam \c[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\logic:extra[6][9]~4_combout ),
	.datad(\c[2]~0_combout ),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h0FF0;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(delom_q_1),
	.datab(b_q_3),
	.datac(\c[5]~1_combout ),
	.datad(\c[3]~2_combout ),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(\logic:extra[7][9]~combout ),
	.datab(\c[4]~3_combout ),
	.datac(\c[4]~4_combout ),
	.datad(\c[6]~5_combout ),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~9 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~4_combout ),
	.datac(\c[5]~1_combout ),
	.datad(\c[5]~8_combout ),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~9 .lut_mask = 16'h6996;
defparam \c[5]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~14 (
	.dataa(\logic:total[8][15]~combout ),
	.datab(\logic:extra[5][9]~2_combout ),
	.datac(\c[6]~5_combout ),
	.datad(\c[6]~13_combout ),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~14 .lut_mask = 16'h6996;
defparam \c[6]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~20 (
	.dataa(\logic:extra[5][9]~2_combout ),
	.datab(\c[7]~15_combout ),
	.datac(\c[7]~16_combout ),
	.datad(\c[7]~19_combout ),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~20 .lut_mask = 16'h6996;
defparam \c[7]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~26 (
	.dataa(\c[7]~15_combout ),
	.datab(\c[8]~21_combout ),
	.datac(\c[8]~25_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~26 .lut_mask = 16'h9696;
defparam \c[8]~26 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~0 (
	.dataa(delom_q_8),
	.datab(delom_q_7),
	.datac(b_q_7),
	.datad(b_q_6),
	.cin(gnd),
	.combout(\logic:total[8][13]~0_combout ),
	.cout());
defparam \logic:total[8][13]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][13]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][13]~1 (
	.dataa(gnd),
	.datab(\logic:total[8][13]~0_combout ),
	.datac(delom_q_6),
	.datad(b_q_8),
	.cin(gnd),
	.combout(\logic:total[8][13]~1_combout ),
	.cout());
defparam \logic:total[8][13]~1 .lut_mask = 16'hC33C;
defparam \logic:total[8][13]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~0 (
	.dataa(b_q_7),
	.datab(delom_q_7),
	.datac(b_q_8),
	.datad(delom_q_8),
	.cin(gnd),
	.combout(\logic:extra[6][9]~0_combout ),
	.cout());
defparam \logic:extra[6][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~0 (
	.dataa(delom_q_8),
	.datab(delom_q_7),
	.datac(b_q_3),
	.datad(b_q_2),
	.cin(gnd),
	.combout(\logic:extra[7][9]~0_combout ),
	.cout());
defparam \logic:extra[7][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~1 (
	.dataa(delom_q_6),
	.datab(delom_q_5),
	.datac(b_q_5),
	.datad(b_q_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~1_combout ),
	.cout());
defparam \logic:extra[7][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~2 (
	.dataa(b_q_6),
	.datab(b_q_7),
	.datac(delom_q_3),
	.datad(delom_q_4),
	.cin(gnd),
	.combout(\logic:extra[7][9]~2_combout ),
	.cout());
defparam \logic:extra[7][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9]~3 (
	.dataa(b_q_8),
	.datab(delom_q_2),
	.datac(\logic:extra[7][9]~1_combout ),
	.datad(\logic:extra[7][9]~2_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~3_combout ),
	.cout());
defparam \logic:extra[7][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[7][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[7][9] (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:extra[6][9]~0_combout ),
	.datac(\logic:extra[7][9]~0_combout ),
	.datad(\logic:extra[7][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[7][9]~combout ),
	.cout());
defparam \logic:extra[7][9] .lut_mask = 16'h6996;
defparam \logic:extra[7][9] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~1 (
	.dataa(delom_q_8),
	.datab(delom_q_7),
	.datac(b_q_4),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\logic:extra[6][9]~1_combout ),
	.cout());
defparam \logic:extra[6][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~2 (
	.dataa(delom_q_6),
	.datab(b_q_6),
	.datac(delom_q_5),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\logic:extra[6][9]~2_combout ),
	.cout());
defparam \logic:extra[6][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~3 (
	.dataa(b_q_8),
	.datab(b_q_7),
	.datac(delom_q_4),
	.datad(delom_q_3),
	.cin(gnd),
	.combout(\logic:extra[6][9]~3_combout ),
	.cout());
defparam \logic:extra[6][9]~3 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[6][9]~4 (
	.dataa(\logic:extra[6][9]~0_combout ),
	.datab(\logic:extra[6][9]~1_combout ),
	.datac(\logic:extra[6][9]~2_combout ),
	.datad(\logic:extra[6][9]~3_combout ),
	.cin(gnd),
	.combout(\logic:extra[6][9]~4_combout ),
	.cout());
defparam \logic:extra[6][9]~4 .lut_mask = 16'h6996;
defparam \logic:extra[6][9]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~0 (
	.dataa(delom_q_1),
	.datab(b_q_1),
	.datac(delom_q_2),
	.datad(b_q_2),
	.cin(gnd),
	.combout(\c[2]~0_combout ),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h6996;
defparam \c[2]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~0 (
	.dataa(delom_q_8),
	.datab(delom_q_7),
	.datac(b_q_5),
	.datad(b_q_4),
	.cin(gnd),
	.combout(\logic:extra[5][9]~0_combout ),
	.cout());
defparam \logic:extra[5][9]~0 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~1 (
	.dataa(delom_q_6),
	.datab(b_q_7),
	.datac(delom_q_5),
	.datad(b_q_6),
	.cin(gnd),
	.combout(\logic:extra[5][9]~1_combout ),
	.cout());
defparam \logic:extra[5][9]~1 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:extra[5][9]~2 (
	.dataa(b_q_8),
	.datab(delom_q_4),
	.datac(\logic:extra[5][9]~0_combout ),
	.datad(\logic:extra[5][9]~1_combout ),
	.cin(gnd),
	.combout(\logic:extra[5][9]~2_combout ),
	.cout());
defparam \logic:extra[5][9]~2 .lut_mask = 16'h6996;
defparam \logic:extra[5][9]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~1 (
	.dataa(b_q_8),
	.datab(delom_q_8),
	.datac(\logic:extra[7][9]~combout ),
	.datad(\logic:extra[5][9]~2_combout ),
	.cin(gnd),
	.combout(\c[5]~1_combout ),
	.cout());
defparam \c[5]~1 .lut_mask = 16'h6996;
defparam \c[5]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(b_q_1),
	.datab(b_q_2),
	.datac(delom_q_2),
	.datad(delom_q_3),
	.cin(gnd),
	.combout(\c[3]~2_combout ),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h6996;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~3 (
	.dataa(b_q_1),
	.datab(b_q_2),
	.datac(delom_q_3),
	.datad(delom_q_4),
	.cin(gnd),
	.combout(\c[4]~3_combout ),
	.cout());
defparam \c[4]~3 .lut_mask = 16'h6996;
defparam \c[4]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~4 (
	.dataa(delom_q_1),
	.datab(b_q_3),
	.datac(delom_q_2),
	.datad(b_q_4),
	.cin(gnd),
	.combout(\c[4]~4_combout ),
	.cout());
defparam \c[4]~4 .lut_mask = 16'h6996;
defparam \c[4]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~0 (
	.dataa(delom_q_8),
	.datab(b_q_6),
	.datac(delom_q_7),
	.datad(b_q_5),
	.cin(gnd),
	.combout(\logic:total[8][12]~0_combout ),
	.cout());
defparam \logic:total[8][12]~0 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][12]~1 (
	.dataa(delom_q_6),
	.datab(b_q_8),
	.datac(delom_q_5),
	.datad(b_q_7),
	.cin(gnd),
	.combout(\logic:total[8][12]~1_combout ),
	.cout());
defparam \logic:total[8][12]~1 .lut_mask = 16'h6996;
defparam \logic:total[8][12]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~5 (
	.dataa(\logic:extra[6][9]~4_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[6]~5_combout ),
	.cout());
defparam \c[6]~5 .lut_mask = 16'h9696;
defparam \c[6]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~6 (
	.dataa(b_q_1),
	.datab(b_q_2),
	.datac(delom_q_4),
	.datad(delom_q_5),
	.cin(gnd),
	.combout(\c[5]~6_combout ),
	.cout());
defparam \c[5]~6 .lut_mask = 16'h6996;
defparam \c[5]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~7 (
	.dataa(b_q_3),
	.datab(b_q_4),
	.datac(delom_q_2),
	.datad(delom_q_3),
	.cin(gnd),
	.combout(\c[5]~7_combout ),
	.cout());
defparam \c[5]~7 .lut_mask = 16'h6996;
defparam \c[5]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~8 (
	.dataa(delom_q_1),
	.datab(b_q_5),
	.datac(\c[5]~6_combout ),
	.datad(\c[5]~7_combout ),
	.cin(gnd),
	.combout(\c[5]~8_combout ),
	.cout());
defparam \c[5]~8 .lut_mask = 16'h6996;
defparam \c[5]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][15] (
	.dataa(b_q_8),
	.datab(delom_q_8),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\logic:total[8][15]~combout ),
	.cout());
defparam \logic:total[8][15] .lut_mask = 16'hEEEE;
defparam \logic:total[8][15] .sum_lutc_input = "datac";

cycloneive_lcell_comb \logic:total[8][14] (
	.dataa(b_q_8),
	.datab(delom_q_8),
	.datac(b_q_7),
	.datad(delom_q_7),
	.cin(gnd),
	.combout(\logic:total[8][14]~combout ),
	.cout());
defparam \logic:total[8][14] .lut_mask = 16'h6996;
defparam \logic:total[8][14] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~10 (
	.dataa(b_q_1),
	.datab(b_q_2),
	.datac(delom_q_5),
	.datad(delom_q_6),
	.cin(gnd),
	.combout(\c[6]~10_combout ),
	.cout());
defparam \c[6]~10 .lut_mask = 16'h6996;
defparam \c[6]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~11 (
	.dataa(b_q_3),
	.datab(b_q_4),
	.datac(delom_q_3),
	.datad(delom_q_4),
	.cin(gnd),
	.combout(\c[6]~11_combout ),
	.cout());
defparam \c[6]~11 .lut_mask = 16'h6996;
defparam \c[6]~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~12 (
	.dataa(delom_q_1),
	.datab(b_q_5),
	.datac(delom_q_2),
	.datad(b_q_6),
	.cin(gnd),
	.combout(\c[6]~12_combout ),
	.cout());
defparam \c[6]~12 .lut_mask = 16'h6996;
defparam \c[6]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~13 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[6]~10_combout ),
	.datac(\c[6]~11_combout ),
	.datad(\c[6]~12_combout ),
	.cin(gnd),
	.combout(\c[6]~13_combout ),
	.cout());
defparam \c[6]~13 .lut_mask = 16'h6996;
defparam \c[6]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~15 (
	.dataa(\logic:total[8][13]~1_combout ),
	.datab(\logic:total[8][12]~0_combout ),
	.datac(\logic:total[8][12]~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\c[7]~15_combout ),
	.cout());
defparam \c[7]~15 .lut_mask = 16'h9696;
defparam \c[7]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~16 (
	.dataa(b_q_1),
	.datab(delom_q_6),
	.datac(b_q_2),
	.datad(delom_q_7),
	.cin(gnd),
	.combout(\c[7]~16_combout ),
	.cout());
defparam \c[7]~16 .lut_mask = 16'h6996;
defparam \c[7]~16 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~17 (
	.dataa(b_q_3),
	.datab(b_q_4),
	.datac(delom_q_4),
	.datad(delom_q_5),
	.cin(gnd),
	.combout(\c[7]~17_combout ),
	.cout());
defparam \c[7]~17 .lut_mask = 16'h6996;
defparam \c[7]~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~18 (
	.dataa(b_q_6),
	.datab(b_q_5),
	.datac(delom_q_3),
	.datad(delom_q_2),
	.cin(gnd),
	.combout(\c[7]~18_combout ),
	.cout());
defparam \c[7]~18 .lut_mask = 16'h6996;
defparam \c[7]~18 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7]~19 (
	.dataa(delom_q_1),
	.datab(b_q_7),
	.datac(\c[7]~17_combout ),
	.datad(\c[7]~18_combout ),
	.cin(gnd),
	.combout(\c[7]~19_combout ),
	.cout());
defparam \c[7]~19 .lut_mask = 16'h6996;
defparam \c[7]~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~21 (
	.dataa(delom_q_1),
	.datab(b_q_7),
	.datac(delom_q_2),
	.datad(b_q_8),
	.cin(gnd),
	.combout(\c[8]~21_combout ),
	.cout());
defparam \c[8]~21 .lut_mask = 16'h6996;
defparam \c[8]~21 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~22 (
	.dataa(b_q_1),
	.datab(delom_q_7),
	.datac(b_q_2),
	.datad(delom_q_8),
	.cin(gnd),
	.combout(\c[8]~22_combout ),
	.cout());
defparam \c[8]~22 .lut_mask = 16'h6996;
defparam \c[8]~22 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~23 (
	.dataa(delom_q_6),
	.datab(b_q_4),
	.datac(delom_q_5),
	.datad(b_q_3),
	.cin(gnd),
	.combout(\c[8]~23_combout ),
	.cout());
defparam \c[8]~23 .lut_mask = 16'h6996;
defparam \c[8]~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~24 (
	.dataa(b_q_6),
	.datab(b_q_5),
	.datac(delom_q_4),
	.datad(delom_q_3),
	.cin(gnd),
	.combout(\c[8]~24_combout ),
	.cout());
defparam \c[8]~24 .lut_mask = 16'h6996;
defparam \c[8]~24 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~25 (
	.dataa(\logic:total[8][14]~combout ),
	.datab(\c[8]~22_combout ),
	.datac(\c[8]~23_combout ),
	.datad(\c[8]~24_combout ),
	.cin(gnd),
	.combout(\c[8]~25_combout ),
	.cout());
defparam \c[8]~25 .lut_mask = 16'h6996;
defparam \c[8]~25 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_1 (
	reg_q_2_2,
	reg_q_1_2,
	c_2)/* synthesis synthesis_greybox=1 */;
input 	reg_q_2_2;
input 	reg_q_1_2;
output 	c_2;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[2]~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(reg_q_1_2),
	.datad(reg_q_2_2),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h0FF0;
defparam \c[2]~0 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_2 (
	reg_q_2_3,
	reg_q_1_3,
	reg_q_3_3,
	reg_q_4_3,
	reg_q_5_3,
	reg_q_6_3,
	reg_q_7_3,
	c_2,
	c_1,
	c_3,
	c_4)/* synthesis synthesis_greybox=1 */;
input 	reg_q_2_3;
input 	reg_q_1_3;
input 	reg_q_3_3;
input 	reg_q_4_3;
input 	reg_q_5_3;
input 	reg_q_6_3;
input 	reg_q_7_3;
output 	c_2;
output 	c_1;
output 	c_3;
output 	c_4;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[2]~0 (
	.dataa(reg_q_2_3),
	.datab(reg_q_3_3),
	.datac(reg_q_5_3),
	.datad(gnd),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h9696;
defparam \c[2]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1]~1 (
	.dataa(reg_q_1_3),
	.datab(reg_q_2_3),
	.datac(reg_q_4_3),
	.datad(gnd),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1]~1 .lut_mask = 16'h9696;
defparam \c[1]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(reg_q_1_3),
	.datab(reg_q_2_3),
	.datac(reg_q_3_3),
	.datad(reg_q_6_3),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h6996;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(reg_q_1_3),
	.datab(reg_q_3_3),
	.datac(reg_q_7_3),
	.datad(gnd),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h9696;
defparam \c[4] .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_3 (
	reg_q_2_4,
	reg_q_1_4,
	reg_q_3_4,
	reg_q_4_4,
	reg_q_5_4,
	reg_q_6_4,
	reg_q_7_4,
	c_2,
	c_1,
	c_3,
	c_8)/* synthesis synthesis_greybox=1 */;
input 	reg_q_2_4;
input 	reg_q_1_4;
input 	reg_q_3_4;
input 	reg_q_4_4;
input 	reg_q_5_4;
input 	reg_q_6_4;
input 	reg_q_7_4;
output 	c_2;
output 	c_1;
output 	c_3;
output 	c_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[2] (
	.dataa(reg_q_3_4),
	.datab(reg_q_4_4),
	.datac(reg_q_6_4),
	.datad(gnd),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h9696;
defparam \c[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1]~0 (
	.dataa(reg_q_2_4),
	.datab(reg_q_3_4),
	.datac(reg_q_5_4),
	.datad(gnd),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1]~0 .lut_mask = 16'h9696;
defparam \c[1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~1 (
	.dataa(reg_q_2_4),
	.datab(reg_q_3_4),
	.datac(reg_q_4_4),
	.datad(reg_q_7_4),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3]~1 .lut_mask = 16'h6996;
defparam \c[3]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~2 (
	.dataa(reg_q_1_4),
	.datab(reg_q_2_4),
	.datac(reg_q_4_4),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~2 .lut_mask = 16'h9696;
defparam \c[8]~2 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_5 (
	omreg_q_2_2,
	omreg_q_1_2,
	c_2)/* synthesis synthesis_greybox=1 */;
input 	omreg_q_2_2;
input 	omreg_q_1_2;
output 	c_2;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[2]~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(omreg_q_1_2),
	.datad(omreg_q_2_2),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2]~0 .lut_mask = 16'h0FF0;
defparam \c[2]~0 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_6 (
	omreg_q_6_3,
	omreg_q_2_3,
	omreg_q_5_3,
	omreg_q_3_3,
	omreg_q_4_3,
	omreg_q_1_3,
	c_8,
	c_2,
	c_3,
	c_1)/* synthesis synthesis_greybox=1 */;
input 	omreg_q_6_3;
input 	omreg_q_2_3;
input 	omreg_q_5_3;
input 	omreg_q_3_3;
input 	omreg_q_4_3;
input 	omreg_q_1_3;
output 	c_8;
output 	c_2;
output 	c_3;
output 	c_1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[8]~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(omreg_q_1_3),
	.datad(omreg_q_3_3),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~0 .lut_mask = 16'h0FF0;
defparam \c[8]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2]~1 (
	.dataa(omreg_q_5_3),
	.datab(omreg_q_2_3),
	.datac(omreg_q_3_3),
	.datad(gnd),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2]~1 .lut_mask = 16'h9696;
defparam \c[2]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3]~2 (
	.dataa(omreg_q_1_3),
	.datab(omreg_q_6_3),
	.datac(omreg_q_2_3),
	.datad(omreg_q_3_3),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3]~2 .lut_mask = 16'h6996;
defparam \c[3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1]~3 (
	.dataa(omreg_q_1_3),
	.datab(omreg_q_2_3),
	.datac(omreg_q_4_3),
	.datad(gnd),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1]~3 .lut_mask = 16'h9696;
defparam \c[1]~3 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_mem_atl (
	rsoutff_q_1,
	rsoutff_q_2,
	rsoutff_q_3,
	rsoutff_q_4,
	rsoutff_q_5,
	rsoutff_q_6,
	rsoutff_q_7,
	rsoutff_q_8,
	sink_eop_q,
	sink_ena_master,
	source_val1,
	sop_source_pipe_4,
	eop_source_pipe_4,
	decfail_bis1,
	num_err_sym_1,
	num_err_sym_2,
	num_err_sym_3,
	num_err_sym_4,
	rserrff_q_1,
	rserrff_q_2,
	rserrff_q_3,
	rserrff_q_4,
	rserrff_q_5,
	rserrff_q_6,
	rserrff_q_7,
	rserrff_q_8,
	stateS98,
	chn_statusbooked,
	bms_statusidle,
	Selector6,
	bypass_q,
	load_syn_gen,
	chn_statusload,
	Selector20,
	polyz,
	rsin,
	errvec,
	bms_clear,
	load_syn_gen1,
	Selector201,
	bms_clear1,
	bms_clear2,
	llnum_q_2,
	llnum_q_1,
	llnum_q_4,
	llnum_q_3,
	clk,
	reset,
	source_ena,
	sink_eop,
	sink_val)/* synthesis synthesis_greybox=1 */;
output 	rsoutff_q_1;
output 	rsoutff_q_2;
output 	rsoutff_q_3;
output 	rsoutff_q_4;
output 	rsoutff_q_5;
output 	rsoutff_q_6;
output 	rsoutff_q_7;
output 	rsoutff_q_8;
input 	sink_eop_q;
output 	sink_ena_master;
output 	source_val1;
output 	sop_source_pipe_4;
output 	eop_source_pipe_4;
output 	decfail_bis1;
output 	num_err_sym_1;
output 	num_err_sym_2;
output 	num_err_sym_3;
output 	num_err_sym_4;
output 	rserrff_q_1;
output 	rserrff_q_2;
output 	rserrff_q_3;
output 	rserrff_q_4;
output 	rserrff_q_5;
output 	rserrff_q_6;
output 	rserrff_q_7;
output 	rserrff_q_8;
input 	stateS98;
output 	chn_statusbooked;
output 	bms_statusidle;
output 	Selector6;
input 	bypass_q;
output 	load_syn_gen;
output 	chn_statusload;
output 	Selector20;
input 	polyz;
input 	[8:1] rsin;
input 	[8:1] errvec;
output 	bms_clear;
output 	load_syn_gen1;
output 	Selector201;
output 	bms_clear1;
output 	bms_clear2;
input 	llnum_q_2;
input 	llnum_q_1;
input 	llnum_q_4;
input 	llnum_q_3;
input 	clk;
input 	reset;
input 	source_ena;
input 	sink_eop;
input 	sink_val;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \RAM_DP_34|auto_generated|q_b[0] ;
wire \RAM_DP_12|auto_generated|q_b[0] ;
wire \RAM_DP_err_value|auto_generated|q_b[0] ;
wire \RAM_DP_34|auto_generated|q_b[1] ;
wire \RAM_DP_12|auto_generated|q_b[1] ;
wire \RAM_DP_err_value|auto_generated|q_b[1] ;
wire \RAM_DP_34|auto_generated|q_b[2] ;
wire \RAM_DP_12|auto_generated|q_b[2] ;
wire \RAM_DP_err_value|auto_generated|q_b[2] ;
wire \RAM_DP_34|auto_generated|q_b[3] ;
wire \RAM_DP_12|auto_generated|q_b[3] ;
wire \RAM_DP_err_value|auto_generated|q_b[3] ;
wire \RAM_DP_34|auto_generated|q_b[4] ;
wire \RAM_DP_12|auto_generated|q_b[4] ;
wire \RAM_DP_err_value|auto_generated|q_b[4] ;
wire \RAM_DP_34|auto_generated|q_b[5] ;
wire \RAM_DP_12|auto_generated|q_b[5] ;
wire \RAM_DP_err_value|auto_generated|q_b[5] ;
wire \RAM_DP_34|auto_generated|q_b[6] ;
wire \RAM_DP_12|auto_generated|q_b[6] ;
wire \RAM_DP_err_value|auto_generated|q_b[6] ;
wire \RAM_DP_34|auto_generated|q_b[7] ;
wire \RAM_DP_12|auto_generated|q_b[7] ;
wire \RAM_DP_err_value|auto_generated|q_b[7] ;
wire \wr_state.S3~q ;
wire \wr_state.S4~q ;
wire \wr34~0_combout ;
wire \wr_state.S2~q ;
wire \wr_state.S1~q ;
wire \wr12~0_combout ;
wire \wr_errvec_altern[1]~q ;
wire \wr_errvec_altern[2]~q ;
wire \rd_errvec_altern[1]~q ;
wire \rd_errvec_altern[2]~q ;
wire \wr_errvec_altern[1]~0_combout ;
wire \wr_errvec_altern[2]~1_combout ;
wire \rd_errvec_altern[1]~0_combout ;
wire \rd_errvec_altern[2]~1_combout ;
wire \wr_state.S2~0_combout ;
wire \wr_state.S1~0_combout ;
wire \rsout_shunt[1]~q ;
wire \seed_cnt[1]~8_combout ;
wire \writeadd[1]~8_combout ;
wire \ena_syn_int_q~q ;
wire \writeadd~10_combout ;
wire \writeadd[1]~q ;
wire \seed_cnt[2]~11 ;
wire \seed_cnt[3]~13_combout ;
wire \writeadd[1]~9 ;
wire \writeadd[2]~11_combout ;
wire \writeadd[2]~q ;
wire \writeadd[2]~12 ;
wire \writeadd[3]~13_combout ;
wire \writeadd[3]~q ;
wire \pipe_wr_ptr~23_combout ;
wire \pipe_ptr~1_combout ;
wire \pipe_ptr~2_combout ;
wire \wr_ptr_ctrl[3]~1_combout ;
wire \wr_ptr_ctrl[3]~q ;
wire \pipe_wr_ptr[1][8]~25_combout ;
wire \pipe_wr_ptr[1][3]~q ;
wire \pipe_ptr~3_combout ;
wire \pipe_wr_ptr~15_combout ;
wire \pipe_wr_ptr[2][3]~9_combout ;
wire \pipe_wr_ptr[2][3]~q ;
wire \cwsize_logic_fifo~0_combout ;
wire \toggle_cnt_del[1]~q ;
wire \toggle_cnt_del[2]~q ;
wire \toggle_cnt_del[3]~q ;
wire \FSM_wradd~0_combout ;
wire \wr_errvec_ctrl~q ;
wire \seed_cnt[8]~12_combout ;
wire \seed_cnt[3]~q ;
wire \Equal2~0_combout ;
wire \seed_cnt_eq_zero_q~q ;
wire \next_load_status~0_combout ;
wire \load_status~q ;
wire \atl_buffer_state.S0~q ;
wire \lf_status_cwsize~2_combout ;
wire \lf_status_cwsize[1]~q ;
wire \lf_status_cwsize~5_combout ;
wire \lf_status_cwsize[2]~4_combout ;
wire \lf_status_cwsize[2]~q ;
wire \lf_status_cwsize~6_combout ;
wire \lf_status_cwsize[3]~q ;
wire \lf_status_cwsize~3_combout ;
wire \lf_status_cwsize[4]~q ;
wire \lf_cw_size_ptr~29_combout ;
wire \lf_cw_size_ptr[4][2]~30_combout ;
wire \lf_cw_size_ptr[4][1]~q ;
wire \cwsize_logic_fifo~6_combout ;
wire \cwsize_logic_fifo~7_combout ;
wire \lf_cw_size_ptr~19_combout ;
wire \lf_cw_size_ptr[3][4]~20_combout ;
wire \lf_cw_size_ptr[3][4]~21_combout ;
wire \lf_cw_size_ptr[3][1]~q ;
wire \cwsize_logic_fifo~5_combout ;
wire \lf_cw_size_ptr~9_combout ;
wire \lf_cw_size_ptr[2][8]~10_combout ;
wire \lf_cw_size_ptr[2][8]~11_combout ;
wire \lf_cw_size_ptr[2][1]~q ;
wire \cwsize_logic_fifo~4_combout ;
wire \lf_cw_size_ptr~0_combout ;
wire \lf_cw_size_ptr[1][8]~1_combout ;
wire \lf_cw_size_ptr[1][1]~q ;
wire \pipe_wr_ptr~17_combout ;
wire \pipe_wr_ptr[1][2]~q ;
wire \pipe_wr_ptr~8_combout ;
wire \pipe_wr_ptr[2][2]~q ;
wire \lf_cw_size_ptr~31_combout ;
wire \lf_cw_size_ptr[4][2]~q ;
wire \lf_cw_size_ptr~22_combout ;
wire \lf_cw_size_ptr[3][2]~q ;
wire \lf_cw_size_ptr~12_combout ;
wire \lf_cw_size_ptr[2][2]~q ;
wire \lf_cw_size_ptr~2_combout ;
wire \lf_cw_size_ptr[1][2]~q ;
wire \readadd~17_combout ;
wire \readadd[4]~16_combout ;
wire \readadd[2]~q ;
wire \Add2~0_combout ;
wire \readadd~18_combout ;
wire \readadd[1]~q ;
wire \Add2~1 ;
wire \Add2~2_combout ;
wire \Equal3~0_combout ;
wire \lf_cw_size_ptr~32_combout ;
wire \lf_cw_size_ptr[4][3]~q ;
wire \lf_cw_size_ptr~23_combout ;
wire \lf_cw_size_ptr[3][3]~q ;
wire \lf_cw_size_ptr~13_combout ;
wire \lf_cw_size_ptr[2][3]~q ;
wire \lf_cw_size_ptr~3_combout ;
wire \lf_cw_size_ptr[1][3]~q ;
wire \writeadd[3]~14 ;
wire \writeadd[4]~15_combout ;
wire \writeadd[4]~q ;
wire \pipe_wr_ptr~18_combout ;
wire \pipe_wr_ptr[1][4]~q ;
wire \pipe_wr_ptr~10_combout ;
wire \pipe_wr_ptr[2][4]~q ;
wire \lf_cw_size_ptr~33_combout ;
wire \lf_cw_size_ptr[4][4]~q ;
wire \lf_cw_size_ptr~24_combout ;
wire \lf_cw_size_ptr[3][4]~q ;
wire \lf_cw_size_ptr~14_combout ;
wire \lf_cw_size_ptr[2][4]~q ;
wire \lf_cw_size_ptr~4_combout ;
wire \lf_cw_size_ptr[1][4]~q ;
wire \readadd~19_combout ;
wire \readadd[4]~q ;
wire \Add2~3 ;
wire \Add2~4_combout ;
wire \readadd~20_combout ;
wire \readadd[3]~q ;
wire \Add2~5 ;
wire \Add2~6_combout ;
wire \Equal3~1_combout ;
wire \writeadd[4]~16 ;
wire \writeadd[5]~17_combout ;
wire \writeadd[5]~q ;
wire \pipe_wr_ptr~19_combout ;
wire \pipe_wr_ptr[1][5]~q ;
wire \pipe_wr_ptr~11_combout ;
wire \pipe_wr_ptr[2][5]~q ;
wire \lf_cw_size_ptr~34_combout ;
wire \lf_cw_size_ptr[4][5]~q ;
wire \lf_cw_size_ptr~25_combout ;
wire \lf_cw_size_ptr[3][5]~q ;
wire \lf_cw_size_ptr~15_combout ;
wire \lf_cw_size_ptr[2][5]~q ;
wire \lf_cw_size_ptr~5_combout ;
wire \lf_cw_size_ptr[1][5]~q ;
wire \writeadd[5]~18 ;
wire \writeadd[6]~19_combout ;
wire \writeadd[6]~q ;
wire \pipe_wr_ptr~20_combout ;
wire \pipe_wr_ptr[1][6]~q ;
wire \pipe_wr_ptr~12_combout ;
wire \pipe_wr_ptr[2][6]~q ;
wire \lf_cw_size_ptr~35_combout ;
wire \lf_cw_size_ptr[4][6]~q ;
wire \lf_cw_size_ptr~26_combout ;
wire \lf_cw_size_ptr[3][6]~q ;
wire \lf_cw_size_ptr~16_combout ;
wire \lf_cw_size_ptr[2][6]~q ;
wire \lf_cw_size_ptr~6_combout ;
wire \lf_cw_size_ptr[1][6]~q ;
wire \readadd~21_combout ;
wire \readadd[6]~q ;
wire \Add2~7 ;
wire \Add2~8_combout ;
wire \readadd~22_combout ;
wire \readadd[5]~q ;
wire \Add2~9 ;
wire \Add2~10_combout ;
wire \Equal3~2_combout ;
wire \writeadd[6]~20 ;
wire \writeadd[7]~21_combout ;
wire \writeadd[7]~q ;
wire \pipe_wr_ptr~21_combout ;
wire \pipe_wr_ptr[1][7]~q ;
wire \pipe_wr_ptr~13_combout ;
wire \pipe_wr_ptr[2][7]~q ;
wire \lf_cw_size_ptr~36_combout ;
wire \lf_cw_size_ptr[4][7]~q ;
wire \lf_cw_size_ptr~27_combout ;
wire \lf_cw_size_ptr[3][7]~q ;
wire \lf_cw_size_ptr~17_combout ;
wire \lf_cw_size_ptr[2][7]~q ;
wire \lf_cw_size_ptr~7_combout ;
wire \lf_cw_size_ptr[1][7]~q ;
wire \writeadd[7]~22 ;
wire \writeadd[8]~23_combout ;
wire \writeadd[8]~q ;
wire \pipe_wr_ptr~22_combout ;
wire \pipe_wr_ptr[1][8]~q ;
wire \pipe_wr_ptr~14_combout ;
wire \pipe_wr_ptr[2][8]~q ;
wire \lf_cw_size_ptr~37_combout ;
wire \lf_cw_size_ptr[4][8]~q ;
wire \lf_cw_size_ptr~28_combout ;
wire \lf_cw_size_ptr[3][8]~q ;
wire \lf_cw_size_ptr~18_combout ;
wire \lf_cw_size_ptr[2][8]~q ;
wire \lf_cw_size_ptr~8_combout ;
wire \lf_cw_size_ptr[1][8]~q ;
wire \readadd~23_combout ;
wire \readadd[8]~q ;
wire \Add2~11 ;
wire \Add2~12_combout ;
wire \readadd~24_combout ;
wire \readadd[7]~q ;
wire \Add2~13 ;
wire \Add2~14_combout ;
wire \Equal3~3_combout ;
wire \Equal3~4_combout ;
wire \rd_ge_block_size_q~q ;
wire \rd_ge_block_size~0_combout ;
wire \cwsize_logic_fifo~2_combout ;
wire \cwsize_logic_fifo~3_combout ;
wire \lf_status_swap[5]~0_combout ;
wire \lf_status_swap[5]~q ;
wire \lf_status_swap~1_combout ;
wire \lf_status_swap[4]~2_combout ;
wire \lf_status_swap[4]~q ;
wire \lf_status_swap~5_combout ;
wire \lf_status_swap[3]~q ;
wire \lf_status_swap~6_combout ;
wire \lf_status_swap[2]~q ;
wire \lf_status_swap~3_combout ;
wire \lf_status_swap~4_combout ;
wire \lf_status_swap[1]~q ;
wire \readadd_ctrl.S0~0_combout ;
wire \readadd_ctrl.S0~q ;
wire \Selector26~0_combout ;
wire \Selector26~1_combout ;
wire \Selector26~2_combout ;
wire \Selector26~3_combout ;
wire \readadd_ctrl.busy~q ;
wire \dav_source_gen~q ;
wire \dav_source_del[1]~q ;
wire \dav_source_del[2]~q ;
wire \Selector29~0_combout ;
wire \atl_buffer_state.out_active~q ;
wire \Selector28~0_combout ;
wire \Selector28~1_combout ;
wire \atl_buffer_state.out_idle~q ;
wire \Selector30~0_combout ;
wire \atl_buffer_state.out_hold~q ;
wire \enable~0_combout ;
wire \lf_status_cwsize[5]~0_combout ;
wire \lf_status_cwsize[5]~1_combout ;
wire \lf_status_cwsize[5]~q ;
wire \pipe_ptr~0_combout ;
wire \wr_ptr_ctrl[2]~2_combout ;
wire \wr_ptr_ctrl[2]~3_combout ;
wire \wr_ptr_ctrl[2]~q ;
wire \wr_ptr_ctrl[1]~0_combout ;
wire \wr_ptr_ctrl[1]~q ;
wire \pipe_ptr~4_combout ;
wire \pipe_ptr~5_combout ;
wire \pipe_wr_ptr~24_combout ;
wire \pipe_wr_ptr[1][1]~q ;
wire \pipe_wr_ptr~16_combout ;
wire \pipe_wr_ptr[2][1]~q ;
wire \seed_cnt[1]~q ;
wire \seed_cnt[1]~9 ;
wire \seed_cnt[2]~10_combout ;
wire \seed_cnt[2]~q ;
wire \seed_cnt[3]~14 ;
wire \seed_cnt[4]~15_combout ;
wire \seed_cnt[4]~q ;
wire \seed_cnt[4]~16 ;
wire \seed_cnt[5]~17_combout ;
wire \seed_cnt[5]~q ;
wire \seed_cnt[5]~18 ;
wire \seed_cnt[6]~19_combout ;
wire \seed_cnt[6]~q ;
wire \Equal1~0_combout ;
wire \seed_cnt[6]~20 ;
wire \seed_cnt[7]~21_combout ;
wire \seed_cnt[7]~q ;
wire \seed_cnt[7]~22 ;
wire \seed_cnt[8]~23_combout ;
wire \seed_cnt[8]~q ;
wire \Equal1~1_combout ;
wire \Equal1~2_combout ;
wire \chn_end_point_q~q ;
wire \rd_state.S0~0_combout ;
wire \rd_state.S0~q ;
wire \Selector13~0_combout ;
wire \eop_source_gen~0_combout ;
wire \rd_state.S2~q ;
wire \rd_state.S3~q ;
wire \rd_state.S4~q ;
wire \Selector13~1_combout ;
wire \rd_state.S1~q ;
wire \tmp_del[1]~q ;
wire \oneout_del~q ;
wire \tmp_del[2]~q ;
wire \twoout_del~q ;
wire \data_2_correct~0_combout ;
wire \tmp_del[3]~q ;
wire \throut_del~q ;
wire \tmp_del[4]~q ;
wire \forout_del~q ;
wire \data_2_correct~1_combout ;
wire \data_2_correct[1]~combout ;
wire \Selector22~0_combout ;
wire \Selector22~1_combout ;
wire \Selector22~2_combout ;
wire \Selector22~3_combout ;
wire \chn_status.busy~q ;
wire \Selector21~0_combout ;
wire \chn_status.idle~q ;
wire \decfail_lf~0_combout ;
wire \FSM_chn~1_combout ;
wire \pipe_numerr~5_combout ;
wire \numerr_ctrl~2_combout ;
wire \numerr_ctrl[2]~q ;
wire \numerr_ctrl~0_combout ;
wire \numerr_ctrl~1_combout ;
wire \numerr_ctrl[1]~q ;
wire \numerr_ctrl[0]~3_combout ;
wire \numerr_ctrl[0]~4_combout ;
wire \numerr_ctrl[0]~q ;
wire \pipe_numerr~4_combout ;
wire \numerrhold_q~5_combout ;
wire \numerrhold_q[1][1]~6_combout ;
wire \numerrhold_q[1][2]~q ;
wire \pipe_numerr~1_combout ;
wire \numerrhold_q~0_combout ;
wire \numerrhold_q[2][1]~1_combout ;
wire \numerrhold_q[2][2]~q ;
wire \numroots~2_combout ;
wire \numroots[1]~q ;
wire \numroots~0_combout ;
wire \numroots~1_combout ;
wire \numroots[2]~q ;
wire \numerrhold_q~7_combout ;
wire \numerrhold_q[1][1]~q ;
wire \numerrhold_q~2_combout ;
wire \numerrhold_q[2][1]~q ;
wire \decfail_gen_d~0_combout ;
wire \numerrhold_q~8_combout ;
wire \numerrhold_q[1][4]~q ;
wire \numerrhold_q~3_combout ;
wire \numerrhold_q[2][4]~q ;
wire \numroots~3_combout ;
wire \numroots[4]~q ;
wire \numroots~4_combout ;
wire \numroots[3]~q ;
wire \Add5~0_combout ;
wire \numerrhold_q~9_combout ;
wire \numerrhold_q[1][3]~q ;
wire \numerrhold_q~4_combout ;
wire \numerrhold_q[2][3]~q ;
wire \Equal4~0_combout ;
wire \decfail_gen_d~1_combout ;
wire \decfail_gen_d~2_combout ;
wire \Equal5~0_combout ;
wire \decfail_gen_d~3_combout ;
wire \decfail_lf~1_combout ;
wire \sop_source_gen~0_combout ;
wire \sop_source_gen~1_combout ;
wire \sop_source_gen~2_combout ;
wire \sop_source_pipe[1]~q ;
wire \sop_source_pipe[2]~q ;
wire \sop_source_pipe[3]~q ;
wire \pull_numerr_fifo2~combout ;
wire \pipe_numerr~3_combout ;
wire \numerr_ctrl_lf2~2_combout ;
wire \numerr_ctrl_lf2[2]~3_combout ;
wire \numerr_ctrl_lf2[2]~q ;
wire \numerr_ctrl_lf2~4_combout ;
wire \numerr_ctrl_lf2~8_combout ;
wire \numerr_ctrl_lf2[3]~q ;
wire \numerr_ctrl_lf2[0]~6_combout ;
wire \numerr_ctrl_lf2[0]~7_combout ;
wire \numerr_ctrl_lf2[0]~q ;
wire \numerr_ctrl_lf2~5_combout ;
wire \numerr_ctrl_lf2[1]~q ;
wire \decfail_lf~5_combout ;
wire \pipe_numerr~6_combout ;
wire \numerr_lf[1][1]~9_combout ;
wire \decfail_lf[1]~q ;
wire \pipe_numerr~2_combout ;
wire \decfail_lf~3_combout ;
wire \decfail_lf[2]~4_combout ;
wire \decfail_lf[2]~q ;
wire \pipe_numerr~0_combout ;
wire \decfail_lf~2_combout ;
wire \numerr_lf[3][1]~0_combout ;
wire \decfail_lf[3]~q ;
wire \eop_gen_pipe_ena_2~1_combout ;
wire \eop_gen_pipe_ena_2[1]~q ;
wire \eop_gen_pipe_ena_2~0_combout ;
wire \eop_gen_pipe_ena_2[2]~q ;
wire \clocking_decfail~0_combout ;
wire \decfail_1q~0_combout ;
wire \decfail_1q~q ;
wire \dat_source_int_d[1]~0_combout ;
wire \align1_bis[1]~q ;
wire \rsoutff_d~0_combout ;
wire \rsout_shunt[2]~q ;
wire \data_2_correct[2]~combout ;
wire \dat_source_int_d[2]~1_combout ;
wire \align1_bis[2]~q ;
wire \rsoutff_d~1_combout ;
wire \rsout_shunt[3]~q ;
wire \data_2_correct[3]~combout ;
wire \dat_source_int_d[3]~2_combout ;
wire \align1_bis[3]~q ;
wire \rsoutff_d~2_combout ;
wire \rsout_shunt[4]~q ;
wire \data_2_correct[4]~combout ;
wire \dat_source_int_d[4]~3_combout ;
wire \align1_bis[4]~q ;
wire \rsoutff_d~3_combout ;
wire \rsout_shunt[5]~q ;
wire \data_2_correct[5]~combout ;
wire \dat_source_int_d[5]~4_combout ;
wire \align1_bis[5]~q ;
wire \rsoutff_d~4_combout ;
wire \rsout_shunt[6]~q ;
wire \data_2_correct[6]~combout ;
wire \dat_source_int_d[6]~5_combout ;
wire \align1_bis[6]~q ;
wire \rsoutff_d~5_combout ;
wire \rsout_shunt[7]~q ;
wire \data_2_correct[7]~combout ;
wire \dat_source_int_d[7]~6_combout ;
wire \align1_bis[7]~q ;
wire \rsoutff_d~6_combout ;
wire \rsout_shunt[8]~q ;
wire \data_2_correct[8]~combout ;
wire \dat_source_int_d[8]~7_combout ;
wire \align1_bis[8]~q ;
wire \rsoutff_d~7_combout ;
wire \Selector18~0_combout ;
wire \Selector18~1_combout ;
wire \bms_status.busy~q ;
wire \syn_bms_chn_synch_FSM~5_combout ;
wire \syn_bms_chn_synch_FSM~6_combout ;
wire \sink_eop_c~q ;
wire \syn_bms_chn_synch_FSM~7_combout ;
wire \syn_bms_chn_synch_FSM~8_combout ;
wire \next_syn_bms_chn_synch_ctrl~0_combout ;
wire \syn_bms_chn_synch_FSM~9_combout ;
wire \syn_bms_chn_synch_FSM~10_combout ;
wire \syn_bms_chn_synch_FSM~11_combout ;
wire \Selector0~0_combout ;
wire \Selector3~0_combout ;
wire \syn_bms_chn_synch_FSM~12_combout ;
wire \Selector3~1_combout ;
wire \Selector3~2_combout ;
wire \syn_bms_chn_synch_ctrl.bms_chn_block~q ;
wire \Selector2~0_combout ;
wire \Selector2~1_combout ;
wire \syn_bms_chn_synch_ctrl.chn_block~q ;
wire \Selector0~1_combout ;
wire \Selector5~0_combout ;
wire \syn_bms_chn_synch_ctrl.fifo_block2~q ;
wire \Selector0~2_combout ;
wire \Selector1~0_combout ;
wire \Selector1~1_combout ;
wire \syn_bms_chn_synch_ctrl.bms_block~q ;
wire \Selector4~0_combout ;
wire \syn_bms_chn_synch_ctrl.fifo_block~q ;
wire \Selector0~3_combout ;
wire \Selector0~4_combout ;
wire \syn_bms_chn_synch_ctrl.allow_ena~q ;
wire \cwsize_logic_fifo~1_combout ;
wire \lf_status_ram_ctrl~4_combout ;
wire \lf_status_ram_ctrl[2]~1_combout ;
wire \lf_status_ram_ctrl[3]~q ;
wire \lf_status_ram_ctrl~6_combout ;
wire \lf_status_ram_ctrl[2]~q ;
wire \lf_status_ram_ctrl~5_combout ;
wire \lf_status_ram_ctrl[1]~q ;
wire \lf_status_ram_ctrl[5]~2_combout ;
wire \lf_status_ram_ctrl[5]~3_combout ;
wire \lf_status_ram_ctrl[5]~q ;
wire \lf_status_ram_ctrl~0_combout ;
wire \lf_status_ram_ctrl[4]~q ;
wire \sink_ena_master~0_combout ;
wire \data_val_shunt~q ;
wire \data_val_shunt~0_combout ;
wire \data_val_pipe~q ;
wire \Selector31~0_combout ;
wire \val_source_q~q ;
wire \sop_source_shunt~q ;
wire \sop_source_d~0_combout ;
wire \eop_source_shunt~q ;
wire \eop_source_pipe[1]~q ;
wire \eop_source_pipe[2]~q ;
wire \eop_source_pipe[3]~q ;
wire \eop_source_d~0_combout ;
wire \numerr_lf~10_combout ;
wire \numerr_lf[1][1]~q ;
wire \numerr_lf~5_combout ;
wire \numerr_lf[2][1]~q ;
wire \numerr_lf~1_combout ;
wire \numerr_lf[3][1]~q ;
wire \numerr_lf~11_combout ;
wire \numerr_lf[1][2]~q ;
wire \numerr_lf~6_combout ;
wire \numerr_lf[2][2]~q ;
wire \numerr_lf~2_combout ;
wire \numerr_lf[3][2]~q ;
wire \numerr_lf~12_combout ;
wire \numerr_lf[1][3]~q ;
wire \numerr_lf~7_combout ;
wire \numerr_lf[2][3]~q ;
wire \numerr_lf~3_combout ;
wire \numerr_lf[3][3]~q ;
wire \numerr_lf~13_combout ;
wire \numerr_lf[1][4]~q ;
wire \numerr_lf~8_combout ;
wire \numerr_lf[2][4]~q ;
wire \numerr_lf~4_combout ;
wire \numerr_lf[3][4]~q ;
wire \rserr_shunt[1]~q ;
wire \align1_err_bis[1]~q ;
wire \rserrff_d~0_combout ;
wire \rserr_shunt[2]~q ;
wire \align1_err_bis[2]~q ;
wire \rserrff_d~1_combout ;
wire \rserr_shunt[3]~q ;
wire \align1_err_bis[3]~q ;
wire \rserrff_d~2_combout ;
wire \rserr_shunt[4]~q ;
wire \align1_err_bis[4]~q ;
wire \rserrff_d~3_combout ;
wire \rserr_shunt[5]~q ;
wire \align1_err_bis[5]~q ;
wire \rserrff_d~4_combout ;
wire \rserr_shunt[6]~q ;
wire \align1_err_bis[6]~q ;
wire \rserrff_d~5_combout ;
wire \rserr_shunt[7]~q ;
wire \align1_err_bis[7]~q ;
wire \rserrff_d~6_combout ;
wire \rserr_shunt[8]~q ;
wire \align1_err_bis[8]~q ;
wire \rserrff_d~7_combout ;
wire \Selector23~0_combout ;
wire \FSM_chn~0_combout ;
wire \Selector23~1_combout ;
wire \Selector17~0_combout ;
wire \Selector17~1_combout ;
wire \ena_ctrl_state.able~q ;
wire \Selector8~0_combout ;
wire \ena_ctrl_state.disable_val_active~q ;
wire \Selector6~0_combout ;
wire \syn_transfer~0_combout ;
wire \syn_transfer~1_combout ;
wire \syn_transfer~2_combout ;
wire \syn_transfer~q ;
wire \load_syn_gen~0_combout ;
wire \Selector24~0_combout ;
wire \Selector24~1_combout ;
wire \Selector24~2_combout ;
wire \chn_status.waiting~q ;
wire \next_chn_status.load~0_combout ;
wire \Selector20~2_combout ;
wire \Selector20~3_combout ;


RS_DE_LANE_QUATUS_altsyncram_5 RAM_DP_err_value(
	.q_b({\RAM_DP_err_value|auto_generated|q_b[7] ,\RAM_DP_err_value|auto_generated|q_b[6] ,\RAM_DP_err_value|auto_generated|q_b[5] ,\RAM_DP_err_value|auto_generated|q_b[4] ,\RAM_DP_err_value|auto_generated|q_b[3] ,\RAM_DP_err_value|auto_generated|q_b[2] ,
\RAM_DP_err_value|auto_generated|q_b[1] ,\RAM_DP_err_value|auto_generated|q_b[0] }),
	.address_a({\wr_errvec_altern[2]~q ,\wr_errvec_altern[1]~q ,\seed_cnt[8]~q ,\seed_cnt[7]~q ,\seed_cnt[6]~q ,\seed_cnt[5]~q ,\seed_cnt[4]~q ,\seed_cnt[3]~q ,\seed_cnt[2]~q ,\seed_cnt[1]~q }),
	.wren_a(\wr_errvec_ctrl~q ),
	.clocken1(\enable~0_combout ),
	.address_b({\rd_errvec_altern[2]~q ,\rd_errvec_altern[1]~q ,\readadd[8]~q ,\readadd[7]~q ,\readadd[6]~q ,\readadd[5]~q ,\readadd[4]~q ,\readadd[3]~q ,\readadd[2]~q ,\readadd[1]~q }),
	.data_a({errvec[8],errvec[7],errvec[6],errvec[5],errvec[4],errvec[3],errvec[2],errvec[1]}),
	.clock1(clk));

RS_DE_LANE_QUATUS_altsyncram_4 RAM_DP_34(
	.q_b({\RAM_DP_34|auto_generated|q_b[7] ,\RAM_DP_34|auto_generated|q_b[6] ,\RAM_DP_34|auto_generated|q_b[5] ,\RAM_DP_34|auto_generated|q_b[4] ,\RAM_DP_34|auto_generated|q_b[3] ,\RAM_DP_34|auto_generated|q_b[2] ,\RAM_DP_34|auto_generated|q_b[1] ,
\RAM_DP_34|auto_generated|q_b[0] }),
	.address_a({gnd,\wr_state.S4~q ,\writeadd[8]~q ,\writeadd[7]~q ,\writeadd[6]~q ,\writeadd[5]~q ,\writeadd[4]~q ,\writeadd[3]~q ,\writeadd[2]~q ,\writeadd[1]~q }),
	.clocken1(\enable~0_combout ),
	.address_b({gnd,\rd_state.S4~q ,\readadd[8]~q ,\readadd[7]~q ,\readadd[6]~q ,\readadd[5]~q ,\readadd[4]~q ,\readadd[3]~q ,\readadd[2]~q ,\readadd[1]~q }),
	.wren_a(\wr34~0_combout ),
	.data_a({rsin[8],rsin[7],rsin[6],rsin[5],rsin[4],rsin[3],rsin[2],rsin[1]}),
	.clock1(clk));

RS_DE_LANE_QUATUS_altsyncram_3 RAM_DP_12(
	.q_b({\RAM_DP_12|auto_generated|q_b[7] ,\RAM_DP_12|auto_generated|q_b[6] ,\RAM_DP_12|auto_generated|q_b[5] ,\RAM_DP_12|auto_generated|q_b[4] ,\RAM_DP_12|auto_generated|q_b[3] ,\RAM_DP_12|auto_generated|q_b[2] ,\RAM_DP_12|auto_generated|q_b[1] ,
\RAM_DP_12|auto_generated|q_b[0] }),
	.address_a({gnd,\wr_state.S2~q ,\writeadd[8]~q ,\writeadd[7]~q ,\writeadd[6]~q ,\writeadd[5]~q ,\writeadd[4]~q ,\writeadd[3]~q ,\writeadd[2]~q ,\writeadd[1]~q }),
	.clocken1(\enable~0_combout ),
	.address_b({gnd,\rd_state.S2~q ,\readadd[8]~q ,\readadd[7]~q ,\readadd[6]~q ,\readadd[5]~q ,\readadd[4]~q ,\readadd[3]~q ,\readadd[2]~q ,\readadd[1]~q }),
	.data_a({rsin[8],rsin[7],rsin[6],rsin[5],rsin[4],rsin[3],rsin[2],rsin[1]}),
	.wren_a(\wr12~0_combout ),
	.clock1(clk));

dffeas \wr_state.S3 (
	.clk(clk),
	.d(\wr_state.S2~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_eop_q),
	.q(\wr_state.S3~q ),
	.prn(vcc));
defparam \wr_state.S3 .is_wysiwyg = "true";
defparam \wr_state.S3 .power_up = "low";

dffeas \wr_state.S4 (
	.clk(clk),
	.d(\wr_state.S3~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_eop_q),
	.q(\wr_state.S4~q ),
	.prn(vcc));
defparam \wr_state.S4 .is_wysiwyg = "true";
defparam \wr_state.S4 .power_up = "low";

cycloneive_lcell_comb \wr34~0 (
	.dataa(\ena_syn_int_q~q ),
	.datab(\wr_state.S3~q ),
	.datac(\wr_state.S4~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\wr34~0_combout ),
	.cout());
defparam \wr34~0 .lut_mask = 16'hFEFE;
defparam \wr34~0 .sum_lutc_input = "datac";

dffeas \wr_state.S2 (
	.clk(clk),
	.d(\wr_state.S2~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_eop_q),
	.q(\wr_state.S2~q ),
	.prn(vcc));
defparam \wr_state.S2 .is_wysiwyg = "true";
defparam \wr_state.S2 .power_up = "low";

dffeas \wr_state.S1 (
	.clk(clk),
	.d(\wr_state.S1~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(sink_eop_q),
	.q(\wr_state.S1~q ),
	.prn(vcc));
defparam \wr_state.S1 .is_wysiwyg = "true";
defparam \wr_state.S1 .power_up = "low";

cycloneive_lcell_comb \wr12~0 (
	.dataa(\ena_syn_int_q~q ),
	.datab(\wr_state.S2~q ),
	.datac(gnd),
	.datad(\wr_state.S1~q ),
	.cin(gnd),
	.combout(\wr12~0_combout ),
	.cout());
defparam \wr12~0 .lut_mask = 16'hEEFF;
defparam \wr12~0 .sum_lutc_input = "datac";

dffeas \wr_errvec_altern[1] (
	.clk(clk),
	.d(\wr_errvec_altern[1]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wr_errvec_altern[1]~q ),
	.prn(vcc));
defparam \wr_errvec_altern[1] .is_wysiwyg = "true";
defparam \wr_errvec_altern[1] .power_up = "low";

dffeas \wr_errvec_altern[2] (
	.clk(clk),
	.d(\wr_errvec_altern[2]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wr_errvec_altern[2]~q ),
	.prn(vcc));
defparam \wr_errvec_altern[2] .is_wysiwyg = "true";
defparam \wr_errvec_altern[2] .power_up = "low";

dffeas \rd_errvec_altern[1] (
	.clk(clk),
	.d(\rd_errvec_altern[1]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rd_errvec_altern[1]~q ),
	.prn(vcc));
defparam \rd_errvec_altern[1] .is_wysiwyg = "true";
defparam \rd_errvec_altern[1] .power_up = "low";

dffeas \rd_errvec_altern[2] (
	.clk(clk),
	.d(\rd_errvec_altern[2]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rd_errvec_altern[2]~q ),
	.prn(vcc));
defparam \rd_errvec_altern[2] .is_wysiwyg = "true";
defparam \rd_errvec_altern[2] .power_up = "low";

cycloneive_lcell_comb \wr_errvec_altern[1]~0 (
	.dataa(gnd),
	.datab(\wr_errvec_altern[1]~q ),
	.datac(\seed_cnt_eq_zero_q~q ),
	.datad(\wr_errvec_ctrl~q ),
	.cin(gnd),
	.combout(\wr_errvec_altern[1]~0_combout ),
	.cout());
defparam \wr_errvec_altern[1]~0 .lut_mask = 16'hC33C;
defparam \wr_errvec_altern[1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \wr_errvec_altern[2]~1 (
	.dataa(\wr_errvec_altern[2]~q ),
	.datab(\seed_cnt_eq_zero_q~q ),
	.datac(\wr_errvec_ctrl~q ),
	.datad(\wr_errvec_altern[1]~q ),
	.cin(gnd),
	.combout(\wr_errvec_altern[2]~1_combout ),
	.cout());
defparam \wr_errvec_altern[2]~1 .lut_mask = 16'h6996;
defparam \wr_errvec_altern[2]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rd_errvec_altern[1]~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\eop_source_gen~0_combout ),
	.datad(\rd_errvec_altern[1]~q ),
	.cin(gnd),
	.combout(\rd_errvec_altern[1]~0_combout ),
	.cout());
defparam \rd_errvec_altern[1]~0 .lut_mask = 16'h0FF0;
defparam \rd_errvec_altern[1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rd_errvec_altern[2]~1 (
	.dataa(gnd),
	.datab(\rd_errvec_altern[2]~q ),
	.datac(\eop_source_gen~0_combout ),
	.datad(\rd_errvec_altern[1]~q ),
	.cin(gnd),
	.combout(\rd_errvec_altern[2]~1_combout ),
	.cout());
defparam \rd_errvec_altern[2]~1 .lut_mask = 16'hC33C;
defparam \rd_errvec_altern[2]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \wr_state.S2~0 (
	.dataa(\wr_state.S1~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\wr_state.S2~0_combout ),
	.cout());
defparam \wr_state.S2~0 .lut_mask = 16'h5555;
defparam \wr_state.S2~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \wr_state.S1~0 (
	.dataa(\wr_state.S4~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\wr_state.S1~0_combout ),
	.cout());
defparam \wr_state.S1~0 .lut_mask = 16'h5555;
defparam \wr_state.S1~0 .sum_lutc_input = "datac";

dffeas \rsoutff_q[1] (
	.clk(clk),
	.d(\rsoutff_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_1),
	.prn(vcc));
defparam \rsoutff_q[1] .is_wysiwyg = "true";
defparam \rsoutff_q[1] .power_up = "low";

dffeas \rsoutff_q[2] (
	.clk(clk),
	.d(\rsoutff_d~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_2),
	.prn(vcc));
defparam \rsoutff_q[2] .is_wysiwyg = "true";
defparam \rsoutff_q[2] .power_up = "low";

dffeas \rsoutff_q[3] (
	.clk(clk),
	.d(\rsoutff_d~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_3),
	.prn(vcc));
defparam \rsoutff_q[3] .is_wysiwyg = "true";
defparam \rsoutff_q[3] .power_up = "low";

dffeas \rsoutff_q[4] (
	.clk(clk),
	.d(\rsoutff_d~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_4),
	.prn(vcc));
defparam \rsoutff_q[4] .is_wysiwyg = "true";
defparam \rsoutff_q[4] .power_up = "low";

dffeas \rsoutff_q[5] (
	.clk(clk),
	.d(\rsoutff_d~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_5),
	.prn(vcc));
defparam \rsoutff_q[5] .is_wysiwyg = "true";
defparam \rsoutff_q[5] .power_up = "low";

dffeas \rsoutff_q[6] (
	.clk(clk),
	.d(\rsoutff_d~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_6),
	.prn(vcc));
defparam \rsoutff_q[6] .is_wysiwyg = "true";
defparam \rsoutff_q[6] .power_up = "low";

dffeas \rsoutff_q[7] (
	.clk(clk),
	.d(\rsoutff_d~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_7),
	.prn(vcc));
defparam \rsoutff_q[7] .is_wysiwyg = "true";
defparam \rsoutff_q[7] .power_up = "low";

dffeas \rsoutff_q[8] (
	.clk(clk),
	.d(\rsoutff_d~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rsoutff_q_8),
	.prn(vcc));
defparam \rsoutff_q[8] .is_wysiwyg = "true";
defparam \rsoutff_q[8] .power_up = "low";

cycloneive_lcell_comb \sink_ena_master~1 (
	.dataa(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.datab(\sink_ena_master~0_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(sink_ena_master),
	.cout());
defparam \sink_ena_master~1 .lut_mask = 16'hEEEE;
defparam \sink_ena_master~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb source_val(
	.dataa(\data_val_pipe~q ),
	.datab(\val_source_q~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(source_val1),
	.cout());
defparam source_val.lut_mask = 16'hEEEE;
defparam source_val.sum_lutc_input = "datac";

dffeas \sop_source_pipe[4] (
	.clk(clk),
	.d(\sop_source_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(sop_source_pipe_4),
	.prn(vcc));
defparam \sop_source_pipe[4] .is_wysiwyg = "true";
defparam \sop_source_pipe[4] .power_up = "low";

dffeas \eop_source_pipe[4] (
	.clk(clk),
	.d(\eop_source_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(eop_source_pipe_4),
	.prn(vcc));
defparam \eop_source_pipe[4] .is_wysiwyg = "true";
defparam \eop_source_pipe[4] .power_up = "low";

dffeas decfail_bis(
	.clk(clk),
	.d(\decfail_lf[3]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pull_numerr_fifo2~combout ),
	.q(decfail_bis1),
	.prn(vcc));
defparam decfail_bis.is_wysiwyg = "true";
defparam decfail_bis.power_up = "low";

dffeas \num_err_sym[1] (
	.clk(clk),
	.d(\numerr_lf[3][1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pull_numerr_fifo2~combout ),
	.q(num_err_sym_1),
	.prn(vcc));
defparam \num_err_sym[1] .is_wysiwyg = "true";
defparam \num_err_sym[1] .power_up = "low";

dffeas \num_err_sym[2] (
	.clk(clk),
	.d(\numerr_lf[3][2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pull_numerr_fifo2~combout ),
	.q(num_err_sym_2),
	.prn(vcc));
defparam \num_err_sym[2] .is_wysiwyg = "true";
defparam \num_err_sym[2] .power_up = "low";

dffeas \num_err_sym[3] (
	.clk(clk),
	.d(\numerr_lf[3][3]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pull_numerr_fifo2~combout ),
	.q(num_err_sym_3),
	.prn(vcc));
defparam \num_err_sym[3] .is_wysiwyg = "true";
defparam \num_err_sym[3] .power_up = "low";

dffeas \num_err_sym[4] (
	.clk(clk),
	.d(\numerr_lf[3][4]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pull_numerr_fifo2~combout ),
	.q(num_err_sym_4),
	.prn(vcc));
defparam \num_err_sym[4] .is_wysiwyg = "true";
defparam \num_err_sym[4] .power_up = "low";

dffeas \rserrff_q[1] (
	.clk(clk),
	.d(\rserrff_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_1),
	.prn(vcc));
defparam \rserrff_q[1] .is_wysiwyg = "true";
defparam \rserrff_q[1] .power_up = "low";

dffeas \rserrff_q[2] (
	.clk(clk),
	.d(\rserrff_d~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_2),
	.prn(vcc));
defparam \rserrff_q[2] .is_wysiwyg = "true";
defparam \rserrff_q[2] .power_up = "low";

dffeas \rserrff_q[3] (
	.clk(clk),
	.d(\rserrff_d~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_3),
	.prn(vcc));
defparam \rserrff_q[3] .is_wysiwyg = "true";
defparam \rserrff_q[3] .power_up = "low";

dffeas \rserrff_q[4] (
	.clk(clk),
	.d(\rserrff_d~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_4),
	.prn(vcc));
defparam \rserrff_q[4] .is_wysiwyg = "true";
defparam \rserrff_q[4] .power_up = "low";

dffeas \rserrff_q[5] (
	.clk(clk),
	.d(\rserrff_d~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_5),
	.prn(vcc));
defparam \rserrff_q[5] .is_wysiwyg = "true";
defparam \rserrff_q[5] .power_up = "low";

dffeas \rserrff_q[6] (
	.clk(clk),
	.d(\rserrff_d~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_6),
	.prn(vcc));
defparam \rserrff_q[6] .is_wysiwyg = "true";
defparam \rserrff_q[6] .power_up = "low";

dffeas \rserrff_q[7] (
	.clk(clk),
	.d(\rserrff_d~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_7),
	.prn(vcc));
defparam \rserrff_q[7] .is_wysiwyg = "true";
defparam \rserrff_q[7] .power_up = "low";

dffeas \rserrff_q[8] (
	.clk(clk),
	.d(\rserrff_d~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(rserrff_q_8),
	.prn(vcc));
defparam \rserrff_q[8] .is_wysiwyg = "true";
defparam \rserrff_q[8] .power_up = "low";

dffeas \chn_status.booked (
	.clk(clk),
	.d(\Selector23~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(chn_statusbooked),
	.prn(vcc));
defparam \chn_status.booked .is_wysiwyg = "true";
defparam \chn_status.booked .power_up = "low";

dffeas \bms_status.idle (
	.clk(clk),
	.d(\Selector17~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(bms_statusidle),
	.prn(vcc));
defparam \bms_status.idle .is_wysiwyg = "true";
defparam \bms_status.idle .power_up = "low";

cycloneive_lcell_comb \Selector6~1 (
	.dataa(\ena_ctrl_state.disable_val_active~q ),
	.datab(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.datac(\sink_ena_master~0_combout ),
	.datad(\Selector6~0_combout ),
	.cin(gnd),
	.combout(Selector6),
	.cout());
defparam \Selector6~1 .lut_mask = 16'hFFFE;
defparam \Selector6~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \load_syn_gen~1 (
	.dataa(stateS98),
	.datab(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datac(\syn_transfer~q ),
	.datad(\load_syn_gen~0_combout ),
	.cin(gnd),
	.combout(load_syn_gen),
	.cout());
defparam \load_syn_gen~1 .lut_mask = 16'hFFFE;
defparam \load_syn_gen~1 .sum_lutc_input = "datac";

dffeas \chn_status.load (
	.clk(clk),
	.d(\next_chn_status.load~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(chn_statusload),
	.prn(vcc));
defparam \chn_status.load .is_wysiwyg = "true";
defparam \chn_status.load .power_up = "low";

cycloneive_lcell_comb \Selector20~1 (
	.dataa(\chn_end_point_q~q ),
	.datab(gnd),
	.datac(\lf_status_swap[5]~q ),
	.datad(\lf_status_swap[4]~q ),
	.cin(gnd),
	.combout(Selector20),
	.cout());
defparam \Selector20~1 .lut_mask = 16'hAFFF;
defparam \Selector20~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bms_clear~0 (
	.dataa(bms_statusidle),
	.datab(gnd),
	.datac(\bms_status.busy~q ),
	.datad(stateS98),
	.cin(gnd),
	.combout(bms_clear),
	.cout());
defparam \bms_clear~0 .lut_mask = 16'hAFFF;
defparam \bms_clear~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \load_syn_gen~2 (
	.dataa(\chn_end_point_q~q ),
	.datab(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datac(\syn_transfer~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(load_syn_gen1),
	.cout());
defparam \load_syn_gen~2 .lut_mask = 16'hFEFE;
defparam \load_syn_gen~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector20~4 (
	.dataa(\Selector20~2_combout ),
	.datab(Selector20),
	.datac(\Selector20~3_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(Selector201),
	.cout());
defparam \Selector20~4 .lut_mask = 16'hFEFE;
defparam \Selector20~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bms_clear~1 (
	.dataa(sink_eop_q),
	.datab(\bms_status.busy~q ),
	.datac(stateS98),
	.datad(bms_statusidle),
	.cin(gnd),
	.combout(bms_clear1),
	.cout());
defparam \bms_clear~1 .lut_mask = 16'hFEFF;
defparam \bms_clear~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \bms_clear~2 (
	.dataa(load_syn_gen),
	.datab(bms_clear1),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(bms_clear2),
	.cout());
defparam \bms_clear~2 .lut_mask = 16'hEEEE;
defparam \bms_clear~2 .sum_lutc_input = "datac";

dffeas \rsout_shunt[1] (
	.clk(clk),
	.d(\rsoutff_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[1]~q ),
	.prn(vcc));
defparam \rsout_shunt[1] .is_wysiwyg = "true";
defparam \rsout_shunt[1] .power_up = "low";

cycloneive_lcell_comb \seed_cnt[1]~8 (
	.dataa(\seed_cnt[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\seed_cnt[1]~8_combout ),
	.cout(\seed_cnt[1]~9 ));
defparam \seed_cnt[1]~8 .lut_mask = 16'h55AA;
defparam \seed_cnt[1]~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \writeadd[1]~8 (
	.dataa(\writeadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\writeadd[1]~8_combout ),
	.cout(\writeadd[1]~9 ));
defparam \writeadd[1]~8 .lut_mask = 16'h55AA;
defparam \writeadd[1]~8 .sum_lutc_input = "datac";

dffeas ena_syn_int_q(
	.clk(clk),
	.d(Selector6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ena_syn_int_q~q ),
	.prn(vcc));
defparam ena_syn_int_q.is_wysiwyg = "true";
defparam ena_syn_int_q.power_up = "low";

cycloneive_lcell_comb \writeadd~10 (
	.dataa(sink_eop_q),
	.datab(\ena_syn_int_q~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writeadd~10_combout ),
	.cout());
defparam \writeadd~10 .lut_mask = 16'hEEEE;
defparam \writeadd~10 .sum_lutc_input = "datac";

dffeas \writeadd[1] (
	.clk(clk),
	.d(\writeadd[1]~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[1]~q ),
	.prn(vcc));
defparam \writeadd[1] .is_wysiwyg = "true";
defparam \writeadd[1] .power_up = "low";

cycloneive_lcell_comb \seed_cnt[2]~10 (
	.dataa(\seed_cnt[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\seed_cnt[1]~9 ),
	.combout(\seed_cnt[2]~10_combout ),
	.cout(\seed_cnt[2]~11 ));
defparam \seed_cnt[2]~10 .lut_mask = 16'h5A5F;
defparam \seed_cnt[2]~10 .sum_lutc_input = "cin";

cycloneive_lcell_comb \seed_cnt[3]~13 (
	.dataa(\seed_cnt[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\seed_cnt[2]~11 ),
	.combout(\seed_cnt[3]~13_combout ),
	.cout(\seed_cnt[3]~14 ));
defparam \seed_cnt[3]~13 .lut_mask = 16'h5AAF;
defparam \seed_cnt[3]~13 .sum_lutc_input = "cin";

cycloneive_lcell_comb \writeadd[2]~11 (
	.dataa(\writeadd[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\writeadd[1]~9 ),
	.combout(\writeadd[2]~11_combout ),
	.cout(\writeadd[2]~12 ));
defparam \writeadd[2]~11 .lut_mask = 16'h5A5F;
defparam \writeadd[2]~11 .sum_lutc_input = "cin";

dffeas \writeadd[2] (
	.clk(clk),
	.d(\writeadd[2]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[2]~q ),
	.prn(vcc));
defparam \writeadd[2] .is_wysiwyg = "true";
defparam \writeadd[2] .power_up = "low";

cycloneive_lcell_comb \writeadd[3]~13 (
	.dataa(\writeadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\writeadd[2]~12 ),
	.combout(\writeadd[3]~13_combout ),
	.cout(\writeadd[3]~14 ));
defparam \writeadd[3]~13 .lut_mask = 16'h5AAF;
defparam \writeadd[3]~13 .sum_lutc_input = "cin";

dffeas \writeadd[3] (
	.clk(clk),
	.d(\writeadd[3]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[3]~q ),
	.prn(vcc));
defparam \writeadd[3] .is_wysiwyg = "true";
defparam \writeadd[3] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~23 (
	.dataa(\writeadd[3]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~23_combout ),
	.cout());
defparam \pipe_wr_ptr~23 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~23 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_ptr~1 (
	.dataa(\wr_ptr_ctrl[3]~q ),
	.datab(\pipe_ptr~0_combout ),
	.datac(gnd),
	.datad(sink_eop_q),
	.cin(gnd),
	.combout(\pipe_ptr~1_combout ),
	.cout());
defparam \pipe_ptr~1 .lut_mask = 16'hEEFF;
defparam \pipe_ptr~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_ptr~2 (
	.dataa(sink_eop_q),
	.datab(\wr_ptr_ctrl[3]~q ),
	.datac(\pipe_ptr~0_combout ),
	.datad(\wr_ptr_ctrl[1]~q ),
	.cin(gnd),
	.combout(\pipe_ptr~2_combout ),
	.cout());
defparam \pipe_ptr~2 .lut_mask = 16'hBFFF;
defparam \pipe_ptr~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \wr_ptr_ctrl[3]~1 (
	.dataa(\wr_ptr_ctrl[2]~q ),
	.datab(\pipe_ptr~1_combout ),
	.datac(\wr_ptr_ctrl[3]~q ),
	.datad(\pipe_ptr~2_combout ),
	.cin(gnd),
	.combout(\wr_ptr_ctrl[3]~1_combout ),
	.cout());
defparam \wr_ptr_ctrl[3]~1 .lut_mask = 16'hFFF7;
defparam \wr_ptr_ctrl[3]~1 .sum_lutc_input = "datac";

dffeas \wr_ptr_ctrl[3] (
	.clk(clk),
	.d(\wr_ptr_ctrl[3]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wr_ptr_ctrl[3]~q ),
	.prn(vcc));
defparam \wr_ptr_ctrl[3] .is_wysiwyg = "true";
defparam \wr_ptr_ctrl[3] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr[1][8]~25 (
	.dataa(\wr_ptr_ctrl[3]~q ),
	.datab(\pipe_ptr~0_combout ),
	.datac(\wr_ptr_ctrl[2]~q ),
	.datad(sink_eop_q),
	.cin(gnd),
	.combout(\pipe_wr_ptr[1][8]~25_combout ),
	.cout());
defparam \pipe_wr_ptr[1][8]~25 .lut_mask = 16'hFFD8;
defparam \pipe_wr_ptr[1][8]~25 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][3] (
	.clk(clk),
	.d(\pipe_wr_ptr~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][3]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][3] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][3] .power_up = "low";

cycloneive_lcell_comb \pipe_ptr~3 (
	.dataa(sink_eop_q),
	.datab(\pipe_ptr~0_combout ),
	.datac(\wr_ptr_ctrl[2]~q ),
	.datad(\wr_ptr_ctrl[3]~q ),
	.cin(gnd),
	.combout(\pipe_ptr~3_combout ),
	.cout());
defparam \pipe_ptr~3 .lut_mask = 16'hFEFF;
defparam \pipe_ptr~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_wr_ptr~15 (
	.dataa(\writeadd[3]~q ),
	.datab(\pipe_wr_ptr[1][3]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~15_combout ),
	.cout());
defparam \pipe_wr_ptr~15 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_wr_ptr[2][3]~9 (
	.dataa(gnd),
	.datab(\wr_ptr_ctrl[3]~q ),
	.datac(sink_eop_q),
	.datad(\pipe_ptr~0_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr[2][3]~9_combout ),
	.cout());
defparam \pipe_wr_ptr[2][3]~9 .lut_mask = 16'hF3C0;
defparam \pipe_wr_ptr[2][3]~9 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][3] (
	.clk(clk),
	.d(\pipe_wr_ptr~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][3]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][3] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][3] .power_up = "low";

cycloneive_lcell_comb \cwsize_logic_fifo~0 (
	.dataa(\wr_ptr_ctrl[3]~q ),
	.datab(\pipe_ptr~0_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~0_combout ),
	.cout());
defparam \cwsize_logic_fifo~0 .lut_mask = 16'hEEEE;
defparam \cwsize_logic_fifo~0 .sum_lutc_input = "datac";

dffeas \toggle_cnt_del[1] (
	.clk(clk),
	.d(Selector201),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\toggle_cnt_del[1]~q ),
	.prn(vcc));
defparam \toggle_cnt_del[1] .is_wysiwyg = "true";
defparam \toggle_cnt_del[1] .power_up = "low";

dffeas \toggle_cnt_del[2] (
	.clk(clk),
	.d(\toggle_cnt_del[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\toggle_cnt_del[2]~q ),
	.prn(vcc));
defparam \toggle_cnt_del[2] .is_wysiwyg = "true";
defparam \toggle_cnt_del[2] .power_up = "low";

dffeas \toggle_cnt_del[3] (
	.clk(clk),
	.d(\toggle_cnt_del[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\toggle_cnt_del[3]~q ),
	.prn(vcc));
defparam \toggle_cnt_del[3] .is_wysiwyg = "true";
defparam \toggle_cnt_del[3] .power_up = "low";

cycloneive_lcell_comb \FSM_wradd~0 (
	.dataa(\seed_cnt_eq_zero_q~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(\toggle_cnt_del[3]~q ),
	.cin(gnd),
	.combout(\FSM_wradd~0_combout ),
	.cout());
defparam \FSM_wradd~0 .lut_mask = 16'hFF55;
defparam \FSM_wradd~0 .sum_lutc_input = "datac";

dffeas wr_errvec_ctrl(
	.clk(clk),
	.d(\FSM_wradd~0_combout ),
	.asdata(\toggle_cnt_del[3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(!\wr_errvec_ctrl~q ),
	.ena(vcc),
	.q(\wr_errvec_ctrl~q ),
	.prn(vcc));
defparam wr_errvec_ctrl.is_wysiwyg = "true";
defparam wr_errvec_ctrl.power_up = "low";

cycloneive_lcell_comb \seed_cnt[8]~12 (
	.dataa(\wr_errvec_ctrl~q ),
	.datab(\wr_ptr_ctrl[3]~q ),
	.datac(\pipe_ptr~0_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\seed_cnt[8]~12_combout ),
	.cout());
defparam \seed_cnt[8]~12 .lut_mask = 16'hFEFE;
defparam \seed_cnt[8]~12 .sum_lutc_input = "datac";

dffeas \seed_cnt[3] (
	.clk(clk),
	.d(\seed_cnt[3]~13_combout ),
	.asdata(\pipe_wr_ptr[2][3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[3]~q ),
	.prn(vcc));
defparam \seed_cnt[3] .is_wysiwyg = "true";
defparam \seed_cnt[3] .power_up = "low";

cycloneive_lcell_comb \Equal2~0 (
	.dataa(\Equal1~1_combout ),
	.datab(\seed_cnt[1]~q ),
	.datac(gnd),
	.datad(\seed_cnt[3]~q ),
	.cin(gnd),
	.combout(\Equal2~0_combout ),
	.cout());
defparam \Equal2~0 .lut_mask = 16'hEEFF;
defparam \Equal2~0 .sum_lutc_input = "datac";

dffeas seed_cnt_eq_zero_q(
	.clk(clk),
	.d(\Equal2~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\seed_cnt_eq_zero_q~q ),
	.prn(vcc));
defparam seed_cnt_eq_zero_q.is_wysiwyg = "true";
defparam seed_cnt_eq_zero_q.power_up = "low";

cycloneive_lcell_comb \next_load_status~0 (
	.dataa(\wr_ptr_ctrl[3]~q ),
	.datab(\pipe_ptr~0_combout ),
	.datac(\load_status~q ),
	.datad(\seed_cnt_eq_zero_q~q ),
	.cin(gnd),
	.combout(\next_load_status~0_combout ),
	.cout());
defparam \next_load_status~0 .lut_mask = 16'hFEFF;
defparam \next_load_status~0 .sum_lutc_input = "datac";

dffeas load_status(
	.clk(clk),
	.d(\next_load_status~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\load_status~q ),
	.prn(vcc));
defparam load_status.is_wysiwyg = "true";
defparam load_status.power_up = "low";

dffeas \atl_buffer_state.S0 (
	.clk(clk),
	.d(vcc),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\atl_buffer_state.S0~q ),
	.prn(vcc));
defparam \atl_buffer_state.S0 .is_wysiwyg = "true";
defparam \atl_buffer_state.S0 .power_up = "low";

cycloneive_lcell_comb \lf_status_cwsize~2 (
	.dataa(\rd_ge_block_size~0_combout ),
	.datab(\lf_status_cwsize[2]~q ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\lf_status_cwsize[1]~q ),
	.cin(gnd),
	.combout(\lf_status_cwsize~2_combout ),
	.cout());
defparam \lf_status_cwsize~2 .lut_mask = 16'hFFF7;
defparam \lf_status_cwsize~2 .sum_lutc_input = "datac";

dffeas \lf_status_cwsize[1] (
	.clk(clk),
	.d(\lf_status_cwsize~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_cwsize[1]~q ),
	.prn(vcc));
defparam \lf_status_cwsize[1] .is_wysiwyg = "true";
defparam \lf_status_cwsize[1] .power_up = "low";

cycloneive_lcell_comb \lf_status_cwsize~5 (
	.dataa(\lf_status_cwsize[3]~q ),
	.datab(\rd_ge_block_size~0_combout ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\lf_status_cwsize[1]~q ),
	.cin(gnd),
	.combout(\lf_status_cwsize~5_combout ),
	.cout());
defparam \lf_status_cwsize~5 .lut_mask = 16'hBEFF;
defparam \lf_status_cwsize~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_cwsize[2]~4 (
	.dataa(\lf_status_cwsize[1]~q ),
	.datab(\wr_ptr_ctrl[3]~q ),
	.datac(\pipe_ptr~0_combout ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_status_cwsize[2]~4_combout ),
	.cout());
defparam \lf_status_cwsize[2]~4 .lut_mask = 16'hEBBE;
defparam \lf_status_cwsize[2]~4 .sum_lutc_input = "datac";

dffeas \lf_status_cwsize[2] (
	.clk(clk),
	.d(\lf_status_cwsize~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_cwsize[2]~4_combout ),
	.q(\lf_status_cwsize[2]~q ),
	.prn(vcc));
defparam \lf_status_cwsize[2] .is_wysiwyg = "true";
defparam \lf_status_cwsize[2] .power_up = "low";

cycloneive_lcell_comb \lf_status_cwsize~6 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\lf_status_cwsize[2]~q ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_status_cwsize~6_combout ),
	.cout());
defparam \lf_status_cwsize~6 .lut_mask = 16'hEFFE;
defparam \lf_status_cwsize~6 .sum_lutc_input = "datac";

dffeas \lf_status_cwsize[3] (
	.clk(clk),
	.d(\lf_status_cwsize~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_cwsize[2]~4_combout ),
	.q(\lf_status_cwsize[3]~q ),
	.prn(vcc));
defparam \lf_status_cwsize[3] .is_wysiwyg = "true";
defparam \lf_status_cwsize[3] .power_up = "low";

cycloneive_lcell_comb \lf_status_cwsize~3 (
	.dataa(\lf_status_cwsize[5]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\lf_status_cwsize[3]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_status_cwsize~3_combout ),
	.cout());
defparam \lf_status_cwsize~3 .lut_mask = 16'hFEFF;
defparam \lf_status_cwsize~3 .sum_lutc_input = "datac";

dffeas \lf_status_cwsize[4] (
	.clk(clk),
	.d(\lf_status_cwsize~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_cwsize[2]~4_combout ),
	.q(\lf_status_cwsize[4]~q ),
	.prn(vcc));
defparam \lf_status_cwsize[4] .is_wysiwyg = "true";
defparam \lf_status_cwsize[4] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~29 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][1]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~29_combout ),
	.cout());
defparam \lf_cw_size_ptr~29 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~29 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr[4][2]~30 (
	.dataa(\lf_status_cwsize[1]~q ),
	.datab(\lf_status_cwsize[4]~q ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr[4][2]~30_combout ),
	.cout());
defparam \lf_cw_size_ptr[4][2]~30 .lut_mask = 16'hFAFC;
defparam \lf_cw_size_ptr[4][2]~30 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][1] (
	.clk(clk),
	.d(\lf_cw_size_ptr~29_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][1]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][1] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][1] .power_up = "low";

cycloneive_lcell_comb \cwsize_logic_fifo~6 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\rd_ge_block_size~0_combout ),
	.datac(\wr_ptr_ctrl[3]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~6_combout ),
	.cout());
defparam \cwsize_logic_fifo~6 .lut_mask = 16'hFBFB;
defparam \cwsize_logic_fifo~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \cwsize_logic_fifo~7 (
	.dataa(\lf_status_cwsize[3]~q ),
	.datab(\rd_ge_block_size~0_combout ),
	.datac(\pipe_ptr~0_combout ),
	.datad(\cwsize_logic_fifo~6_combout ),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~7_combout ),
	.cout());
defparam \cwsize_logic_fifo~7 .lut_mask = 16'hFFFE;
defparam \cwsize_logic_fifo~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr~19 (
	.dataa(\pipe_wr_ptr[2][1]~q ),
	.datab(\lf_cw_size_ptr[4][1]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~19_combout ),
	.cout());
defparam \lf_cw_size_ptr~19 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~19 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr[3][4]~20 (
	.dataa(\rd_ge_block_size~0_combout ),
	.datab(\lf_status_cwsize[4]~q ),
	.datac(\lf_status_cwsize[3]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\lf_cw_size_ptr[3][4]~20_combout ),
	.cout());
defparam \lf_cw_size_ptr[3][4]~20 .lut_mask = 16'h2727;
defparam \lf_cw_size_ptr[3][4]~20 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr[3][4]~21 (
	.dataa(\rd_ge_block_size~0_combout ),
	.datab(\lf_status_cwsize[1]~q ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\lf_cw_size_ptr[3][4]~20_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr[3][4]~21_combout ),
	.cout());
defparam \lf_cw_size_ptr[3][4]~21 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr[3][4]~21 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][1] (
	.clk(clk),
	.d(\lf_cw_size_ptr~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][1]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][1] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][1] .power_up = "low";

cycloneive_lcell_comb \cwsize_logic_fifo~5 (
	.dataa(\cwsize_logic_fifo~0_combout ),
	.datab(\lf_status_cwsize[3]~q ),
	.datac(\lf_status_cwsize[2]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~5_combout ),
	.cout());
defparam \cwsize_logic_fifo~5 .lut_mask = 16'hFAFC;
defparam \cwsize_logic_fifo~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr~9 (
	.dataa(\pipe_wr_ptr[2][1]~q ),
	.datab(\lf_cw_size_ptr[3][1]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~9_combout ),
	.cout());
defparam \lf_cw_size_ptr~9 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr[2][8]~10 (
	.dataa(\rd_ge_block_size~0_combout ),
	.datab(\lf_status_cwsize[3]~q ),
	.datac(\lf_status_cwsize[2]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\lf_cw_size_ptr[2][8]~10_combout ),
	.cout());
defparam \lf_cw_size_ptr[2][8]~10 .lut_mask = 16'h2727;
defparam \lf_cw_size_ptr[2][8]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr[2][8]~11 (
	.dataa(\rd_ge_block_size~0_combout ),
	.datab(\lf_status_cwsize[1]~q ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\lf_cw_size_ptr[2][8]~10_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr[2][8]~11_combout ),
	.cout());
defparam \lf_cw_size_ptr[2][8]~11 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr[2][8]~11 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][1] (
	.clk(clk),
	.d(\lf_cw_size_ptr~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][1]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][1] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][1] .power_up = "low";

cycloneive_lcell_comb \cwsize_logic_fifo~4 (
	.dataa(\cwsize_logic_fifo~0_combout ),
	.datab(\lf_status_cwsize[2]~q ),
	.datac(\rd_ge_block_size~0_combout ),
	.datad(\lf_status_cwsize[1]~q ),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~4_combout ),
	.cout());
defparam \cwsize_logic_fifo~4 .lut_mask = 16'hACFF;
defparam \cwsize_logic_fifo~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr~0 (
	.dataa(\pipe_wr_ptr[2][1]~q ),
	.datab(\lf_cw_size_ptr[2][1]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~0_combout ),
	.cout());
defparam \lf_cw_size_ptr~0 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr[1][8]~1 (
	.dataa(\lf_status_cwsize[2]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\lf_status_cwsize[1]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr[1][8]~1_combout ),
	.cout());
defparam \lf_cw_size_ptr[1][8]~1 .lut_mask = 16'hEFFE;
defparam \lf_cw_size_ptr[1][8]~1 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][1] (
	.clk(clk),
	.d(\lf_cw_size_ptr~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][1]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][1] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][1] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~17 (
	.dataa(\writeadd[2]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~17_combout ),
	.cout());
defparam \pipe_wr_ptr~17 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~17 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][2] (
	.clk(clk),
	.d(\pipe_wr_ptr~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][2]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][2] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][2] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~8 (
	.dataa(\writeadd[2]~q ),
	.datab(\pipe_wr_ptr[1][2]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~8_combout ),
	.cout());
defparam \pipe_wr_ptr~8 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~8 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][2] (
	.clk(clk),
	.d(\pipe_wr_ptr~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][2]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][2] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][2] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~31 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][2]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~31_combout ),
	.cout());
defparam \lf_cw_size_ptr~31 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~31 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][2] (
	.clk(clk),
	.d(\lf_cw_size_ptr~31_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][2]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][2] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][2] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~22 (
	.dataa(\pipe_wr_ptr[2][2]~q ),
	.datab(\lf_cw_size_ptr[4][2]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~22_combout ),
	.cout());
defparam \lf_cw_size_ptr~22 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~22 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][2] (
	.clk(clk),
	.d(\lf_cw_size_ptr~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][2]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][2] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][2] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~12 (
	.dataa(\pipe_wr_ptr[2][2]~q ),
	.datab(\lf_cw_size_ptr[3][2]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~12_combout ),
	.cout());
defparam \lf_cw_size_ptr~12 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~12 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][2] (
	.clk(clk),
	.d(\lf_cw_size_ptr~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][2]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][2] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][2] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~2 (
	.dataa(\pipe_wr_ptr[2][2]~q ),
	.datab(\lf_cw_size_ptr[2][2]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~2_combout ),
	.cout());
defparam \lf_cw_size_ptr~2 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~2 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][2] (
	.clk(clk),
	.d(\lf_cw_size_ptr~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][2]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][2] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][2] .power_up = "low";

cycloneive_lcell_comb \readadd~17 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~2_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~17_combout ),
	.cout());
defparam \readadd~17 .lut_mask = 16'hFBFF;
defparam \readadd~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \readadd[4]~16 (
	.dataa(\atl_buffer_state.S0~q ),
	.datab(\readadd_ctrl.busy~q ),
	.datac(\rd_ge_block_size_q~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\readadd[4]~16_combout ),
	.cout());
defparam \readadd[4]~16 .lut_mask = 16'hFEFF;
defparam \readadd[4]~16 .sum_lutc_input = "datac";

dffeas \readadd[2] (
	.clk(clk),
	.d(\readadd~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[2]~q ),
	.prn(vcc));
defparam \readadd[2] .is_wysiwyg = "true";
defparam \readadd[2] .power_up = "low";

cycloneive_lcell_comb \Add2~0 (
	.dataa(\readadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add2~0_combout ),
	.cout(\Add2~1 ));
defparam \Add2~0 .lut_mask = 16'h55AA;
defparam \Add2~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \readadd~18 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~0_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~18_combout ),
	.cout());
defparam \readadd~18 .lut_mask = 16'hFBFF;
defparam \readadd~18 .sum_lutc_input = "datac";

dffeas \readadd[1] (
	.clk(clk),
	.d(\readadd~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[1]~q ),
	.prn(vcc));
defparam \readadd[1] .is_wysiwyg = "true";
defparam \readadd[1] .power_up = "low";

cycloneive_lcell_comb \Add2~2 (
	.dataa(\readadd[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~1 ),
	.combout(\Add2~2_combout ),
	.cout(\Add2~3 ));
defparam \Add2~2 .lut_mask = 16'h5A5F;
defparam \Add2~2 .sum_lutc_input = "cin";

cycloneive_lcell_comb \Equal3~0 (
	.dataa(\lf_cw_size_ptr[1][1]~q ),
	.datab(\lf_cw_size_ptr[1][2]~q ),
	.datac(\Add2~2_combout ),
	.datad(\Add2~0_combout ),
	.cin(gnd),
	.combout(\Equal3~0_combout ),
	.cout());
defparam \Equal3~0 .lut_mask = 16'h6996;
defparam \Equal3~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_cw_size_ptr~32 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][3]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~32_combout ),
	.cout());
defparam \lf_cw_size_ptr~32 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~32 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][3] (
	.clk(clk),
	.d(\lf_cw_size_ptr~32_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][3]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][3] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][3] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~23 (
	.dataa(\pipe_wr_ptr[2][3]~q ),
	.datab(\lf_cw_size_ptr[4][3]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~23_combout ),
	.cout());
defparam \lf_cw_size_ptr~23 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~23 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][3] (
	.clk(clk),
	.d(\lf_cw_size_ptr~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][3]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][3] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][3] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~13 (
	.dataa(\pipe_wr_ptr[2][3]~q ),
	.datab(\lf_cw_size_ptr[3][3]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~13_combout ),
	.cout());
defparam \lf_cw_size_ptr~13 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~13 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][3] (
	.clk(clk),
	.d(\lf_cw_size_ptr~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][3]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][3] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][3] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~3 (
	.dataa(\pipe_wr_ptr[2][3]~q ),
	.datab(\lf_cw_size_ptr[2][3]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~3_combout ),
	.cout());
defparam \lf_cw_size_ptr~3 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~3 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][3] (
	.clk(clk),
	.d(\lf_cw_size_ptr~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][3]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][3] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][3] .power_up = "low";

cycloneive_lcell_comb \writeadd[4]~15 (
	.dataa(\writeadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\writeadd[3]~14 ),
	.combout(\writeadd[4]~15_combout ),
	.cout(\writeadd[4]~16 ));
defparam \writeadd[4]~15 .lut_mask = 16'h5A5F;
defparam \writeadd[4]~15 .sum_lutc_input = "cin";

dffeas \writeadd[4] (
	.clk(clk),
	.d(\writeadd[4]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[4]~q ),
	.prn(vcc));
defparam \writeadd[4] .is_wysiwyg = "true";
defparam \writeadd[4] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~18 (
	.dataa(\writeadd[4]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~18_combout ),
	.cout());
defparam \pipe_wr_ptr~18 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~18 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][4] (
	.clk(clk),
	.d(\pipe_wr_ptr~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][4]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][4] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][4] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~10 (
	.dataa(\writeadd[4]~q ),
	.datab(\pipe_wr_ptr[1][4]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~10_combout ),
	.cout());
defparam \pipe_wr_ptr~10 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~10 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][4] (
	.clk(clk),
	.d(\pipe_wr_ptr~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][4]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][4] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][4] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~33 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][4]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~33_combout ),
	.cout());
defparam \lf_cw_size_ptr~33 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~33 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][4] (
	.clk(clk),
	.d(\lf_cw_size_ptr~33_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][4]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][4] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][4] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~24 (
	.dataa(\pipe_wr_ptr[2][4]~q ),
	.datab(\lf_cw_size_ptr[4][4]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~24_combout ),
	.cout());
defparam \lf_cw_size_ptr~24 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~24 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][4] (
	.clk(clk),
	.d(\lf_cw_size_ptr~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][4]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][4] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][4] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~14 (
	.dataa(\pipe_wr_ptr[2][4]~q ),
	.datab(\lf_cw_size_ptr[3][4]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~14_combout ),
	.cout());
defparam \lf_cw_size_ptr~14 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~14 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][4] (
	.clk(clk),
	.d(\lf_cw_size_ptr~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][4]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][4] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][4] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~4 (
	.dataa(\pipe_wr_ptr[2][4]~q ),
	.datab(\lf_cw_size_ptr[2][4]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~4_combout ),
	.cout());
defparam \lf_cw_size_ptr~4 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~4 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][4] (
	.clk(clk),
	.d(\lf_cw_size_ptr~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][4]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][4] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][4] .power_up = "low";

cycloneive_lcell_comb \readadd~19 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~6_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~19_combout ),
	.cout());
defparam \readadd~19 .lut_mask = 16'hFBFF;
defparam \readadd~19 .sum_lutc_input = "datac";

dffeas \readadd[4] (
	.clk(clk),
	.d(\readadd~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[4]~q ),
	.prn(vcc));
defparam \readadd[4] .is_wysiwyg = "true";
defparam \readadd[4] .power_up = "low";

cycloneive_lcell_comb \Add2~4 (
	.dataa(\readadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~3 ),
	.combout(\Add2~4_combout ),
	.cout(\Add2~5 ));
defparam \Add2~4 .lut_mask = 16'h5AAF;
defparam \Add2~4 .sum_lutc_input = "cin";

cycloneive_lcell_comb \readadd~20 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~4_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~20_combout ),
	.cout());
defparam \readadd~20 .lut_mask = 16'hFBFF;
defparam \readadd~20 .sum_lutc_input = "datac";

dffeas \readadd[3] (
	.clk(clk),
	.d(\readadd~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[3]~q ),
	.prn(vcc));
defparam \readadd[3] .is_wysiwyg = "true";
defparam \readadd[3] .power_up = "low";

cycloneive_lcell_comb \Add2~6 (
	.dataa(\readadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~5 ),
	.combout(\Add2~6_combout ),
	.cout(\Add2~7 ));
defparam \Add2~6 .lut_mask = 16'h5A5F;
defparam \Add2~6 .sum_lutc_input = "cin";

cycloneive_lcell_comb \Equal3~1 (
	.dataa(\lf_cw_size_ptr[1][3]~q ),
	.datab(\lf_cw_size_ptr[1][4]~q ),
	.datac(\Add2~6_combout ),
	.datad(\Add2~4_combout ),
	.cin(gnd),
	.combout(\Equal3~1_combout ),
	.cout());
defparam \Equal3~1 .lut_mask = 16'h6996;
defparam \Equal3~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \writeadd[5]~17 (
	.dataa(\writeadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\writeadd[4]~16 ),
	.combout(\writeadd[5]~17_combout ),
	.cout(\writeadd[5]~18 ));
defparam \writeadd[5]~17 .lut_mask = 16'h5AAF;
defparam \writeadd[5]~17 .sum_lutc_input = "cin";

dffeas \writeadd[5] (
	.clk(clk),
	.d(\writeadd[5]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[5]~q ),
	.prn(vcc));
defparam \writeadd[5] .is_wysiwyg = "true";
defparam \writeadd[5] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~19 (
	.dataa(\writeadd[5]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~19_combout ),
	.cout());
defparam \pipe_wr_ptr~19 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~19 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][5] (
	.clk(clk),
	.d(\pipe_wr_ptr~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][5]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][5] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][5] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~11 (
	.dataa(\writeadd[5]~q ),
	.datab(\pipe_wr_ptr[1][5]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~11_combout ),
	.cout());
defparam \pipe_wr_ptr~11 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~11 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][5] (
	.clk(clk),
	.d(\pipe_wr_ptr~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][5]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][5] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][5] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~34 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][5]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~34_combout ),
	.cout());
defparam \lf_cw_size_ptr~34 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~34 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][5] (
	.clk(clk),
	.d(\lf_cw_size_ptr~34_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][5]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][5] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][5] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~25 (
	.dataa(\pipe_wr_ptr[2][5]~q ),
	.datab(\lf_cw_size_ptr[4][5]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~25_combout ),
	.cout());
defparam \lf_cw_size_ptr~25 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~25 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][5] (
	.clk(clk),
	.d(\lf_cw_size_ptr~25_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][5]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][5] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][5] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~15 (
	.dataa(\pipe_wr_ptr[2][5]~q ),
	.datab(\lf_cw_size_ptr[3][5]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~15_combout ),
	.cout());
defparam \lf_cw_size_ptr~15 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~15 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][5] (
	.clk(clk),
	.d(\lf_cw_size_ptr~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][5]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][5] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][5] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~5 (
	.dataa(\pipe_wr_ptr[2][5]~q ),
	.datab(\lf_cw_size_ptr[2][5]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~5_combout ),
	.cout());
defparam \lf_cw_size_ptr~5 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~5 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][5] (
	.clk(clk),
	.d(\lf_cw_size_ptr~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][5]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][5] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][5] .power_up = "low";

cycloneive_lcell_comb \writeadd[6]~19 (
	.dataa(\writeadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\writeadd[5]~18 ),
	.combout(\writeadd[6]~19_combout ),
	.cout(\writeadd[6]~20 ));
defparam \writeadd[6]~19 .lut_mask = 16'h5A5F;
defparam \writeadd[6]~19 .sum_lutc_input = "cin";

dffeas \writeadd[6] (
	.clk(clk),
	.d(\writeadd[6]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[6]~q ),
	.prn(vcc));
defparam \writeadd[6] .is_wysiwyg = "true";
defparam \writeadd[6] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~20 (
	.dataa(\writeadd[6]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~20_combout ),
	.cout());
defparam \pipe_wr_ptr~20 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~20 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][6] (
	.clk(clk),
	.d(\pipe_wr_ptr~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][6]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][6] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][6] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~12 (
	.dataa(\writeadd[6]~q ),
	.datab(\pipe_wr_ptr[1][6]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~12_combout ),
	.cout());
defparam \pipe_wr_ptr~12 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~12 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][6] (
	.clk(clk),
	.d(\pipe_wr_ptr~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][6]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][6] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][6] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~35 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][6]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~35_combout ),
	.cout());
defparam \lf_cw_size_ptr~35 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~35 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][6] (
	.clk(clk),
	.d(\lf_cw_size_ptr~35_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][6]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][6] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][6] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~26 (
	.dataa(\pipe_wr_ptr[2][6]~q ),
	.datab(\lf_cw_size_ptr[4][6]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~26_combout ),
	.cout());
defparam \lf_cw_size_ptr~26 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~26 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][6] (
	.clk(clk),
	.d(\lf_cw_size_ptr~26_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][6]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][6] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][6] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~16 (
	.dataa(\pipe_wr_ptr[2][6]~q ),
	.datab(\lf_cw_size_ptr[3][6]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~16_combout ),
	.cout());
defparam \lf_cw_size_ptr~16 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~16 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][6] (
	.clk(clk),
	.d(\lf_cw_size_ptr~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][6]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][6] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][6] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~6 (
	.dataa(\pipe_wr_ptr[2][6]~q ),
	.datab(\lf_cw_size_ptr[2][6]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~6_combout ),
	.cout());
defparam \lf_cw_size_ptr~6 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~6 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][6] (
	.clk(clk),
	.d(\lf_cw_size_ptr~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][6]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][6] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][6] .power_up = "low";

cycloneive_lcell_comb \readadd~21 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~10_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~21_combout ),
	.cout());
defparam \readadd~21 .lut_mask = 16'hFBFF;
defparam \readadd~21 .sum_lutc_input = "datac";

dffeas \readadd[6] (
	.clk(clk),
	.d(\readadd~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[6]~q ),
	.prn(vcc));
defparam \readadd[6] .is_wysiwyg = "true";
defparam \readadd[6] .power_up = "low";

cycloneive_lcell_comb \Add2~8 (
	.dataa(\readadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~7 ),
	.combout(\Add2~8_combout ),
	.cout(\Add2~9 ));
defparam \Add2~8 .lut_mask = 16'h5AAF;
defparam \Add2~8 .sum_lutc_input = "cin";

cycloneive_lcell_comb \readadd~22 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~8_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~22_combout ),
	.cout());
defparam \readadd~22 .lut_mask = 16'hFBFF;
defparam \readadd~22 .sum_lutc_input = "datac";

dffeas \readadd[5] (
	.clk(clk),
	.d(\readadd~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[5]~q ),
	.prn(vcc));
defparam \readadd[5] .is_wysiwyg = "true";
defparam \readadd[5] .power_up = "low";

cycloneive_lcell_comb \Add2~10 (
	.dataa(\readadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~9 ),
	.combout(\Add2~10_combout ),
	.cout(\Add2~11 ));
defparam \Add2~10 .lut_mask = 16'h5A5F;
defparam \Add2~10 .sum_lutc_input = "cin";

cycloneive_lcell_comb \Equal3~2 (
	.dataa(\lf_cw_size_ptr[1][5]~q ),
	.datab(\lf_cw_size_ptr[1][6]~q ),
	.datac(\Add2~10_combout ),
	.datad(\Add2~8_combout ),
	.cin(gnd),
	.combout(\Equal3~2_combout ),
	.cout());
defparam \Equal3~2 .lut_mask = 16'h6996;
defparam \Equal3~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \writeadd[7]~21 (
	.dataa(\writeadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\writeadd[6]~20 ),
	.combout(\writeadd[7]~21_combout ),
	.cout(\writeadd[7]~22 ));
defparam \writeadd[7]~21 .lut_mask = 16'h5AAF;
defparam \writeadd[7]~21 .sum_lutc_input = "cin";

dffeas \writeadd[7] (
	.clk(clk),
	.d(\writeadd[7]~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[7]~q ),
	.prn(vcc));
defparam \writeadd[7] .is_wysiwyg = "true";
defparam \writeadd[7] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~21 (
	.dataa(\writeadd[7]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~21_combout ),
	.cout());
defparam \pipe_wr_ptr~21 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~21 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][7] (
	.clk(clk),
	.d(\pipe_wr_ptr~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][7]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][7] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][7] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~13 (
	.dataa(\writeadd[7]~q ),
	.datab(\pipe_wr_ptr[1][7]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~13_combout ),
	.cout());
defparam \pipe_wr_ptr~13 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~13 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][7] (
	.clk(clk),
	.d(\pipe_wr_ptr~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][7]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][7] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][7] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~36 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][7]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~36_combout ),
	.cout());
defparam \lf_cw_size_ptr~36 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~36 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][7] (
	.clk(clk),
	.d(\lf_cw_size_ptr~36_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][7]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][7] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][7] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~27 (
	.dataa(\pipe_wr_ptr[2][7]~q ),
	.datab(\lf_cw_size_ptr[4][7]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~27_combout ),
	.cout());
defparam \lf_cw_size_ptr~27 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~27 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][7] (
	.clk(clk),
	.d(\lf_cw_size_ptr~27_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][7]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][7] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][7] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~17 (
	.dataa(\pipe_wr_ptr[2][7]~q ),
	.datab(\lf_cw_size_ptr[3][7]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~17_combout ),
	.cout());
defparam \lf_cw_size_ptr~17 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~17 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][7] (
	.clk(clk),
	.d(\lf_cw_size_ptr~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][7]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][7] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][7] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~7 (
	.dataa(\pipe_wr_ptr[2][7]~q ),
	.datab(\lf_cw_size_ptr[2][7]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~7_combout ),
	.cout());
defparam \lf_cw_size_ptr~7 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~7 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][7] (
	.clk(clk),
	.d(\lf_cw_size_ptr~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][7]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][7] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][7] .power_up = "low";

cycloneive_lcell_comb \writeadd[8]~23 (
	.dataa(\writeadd[8]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\writeadd[7]~22 ),
	.combout(\writeadd[8]~23_combout ),
	.cout());
defparam \writeadd[8]~23 .lut_mask = 16'h5A5A;
defparam \writeadd[8]~23 .sum_lutc_input = "cin";

dffeas \writeadd[8] (
	.clk(clk),
	.d(\writeadd[8]~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(sink_eop_q),
	.sload(gnd),
	.ena(\writeadd~10_combout ),
	.q(\writeadd[8]~q ),
	.prn(vcc));
defparam \writeadd[8] .is_wysiwyg = "true";
defparam \writeadd[8] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~22 (
	.dataa(\writeadd[8]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~22_combout ),
	.cout());
defparam \pipe_wr_ptr~22 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~22 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][8] (
	.clk(clk),
	.d(\pipe_wr_ptr~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][8]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][8] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][8] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~14 (
	.dataa(\writeadd[8]~q ),
	.datab(\pipe_wr_ptr[1][8]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~14_combout ),
	.cout());
defparam \pipe_wr_ptr~14 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~14 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][8] (
	.clk(clk),
	.d(\pipe_wr_ptr~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][8]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][8] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][8] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~37 (
	.dataa(\lf_status_cwsize[4]~q ),
	.datab(\cwsize_logic_fifo~0_combout ),
	.datac(\pipe_wr_ptr[2][8]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~37_combout ),
	.cout());
defparam \lf_cw_size_ptr~37 .lut_mask = 16'hFEFF;
defparam \lf_cw_size_ptr~37 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[4][8] (
	.clk(clk),
	.d(\lf_cw_size_ptr~37_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[4][2]~30_combout ),
	.q(\lf_cw_size_ptr[4][8]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[4][8] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[4][8] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~28 (
	.dataa(\pipe_wr_ptr[2][8]~q ),
	.datab(\lf_cw_size_ptr[4][8]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~7_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~28_combout ),
	.cout());
defparam \lf_cw_size_ptr~28 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~28 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[3][8] (
	.clk(clk),
	.d(\lf_cw_size_ptr~28_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[3][4]~21_combout ),
	.q(\lf_cw_size_ptr[3][8]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[3][8] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[3][8] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~18 (
	.dataa(\pipe_wr_ptr[2][8]~q ),
	.datab(\lf_cw_size_ptr[3][8]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~5_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~18_combout ),
	.cout());
defparam \lf_cw_size_ptr~18 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~18 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[2][8] (
	.clk(clk),
	.d(\lf_cw_size_ptr~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[2][8]~11_combout ),
	.q(\lf_cw_size_ptr[2][8]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[2][8] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[2][8] .power_up = "low";

cycloneive_lcell_comb \lf_cw_size_ptr~8 (
	.dataa(\pipe_wr_ptr[2][8]~q ),
	.datab(\lf_cw_size_ptr[2][8]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~4_combout ),
	.cin(gnd),
	.combout(\lf_cw_size_ptr~8_combout ),
	.cout());
defparam \lf_cw_size_ptr~8 .lut_mask = 16'hAACC;
defparam \lf_cw_size_ptr~8 .sum_lutc_input = "datac";

dffeas \lf_cw_size_ptr[1][8] (
	.clk(clk),
	.d(\lf_cw_size_ptr~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_cw_size_ptr[1][8]~1_combout ),
	.q(\lf_cw_size_ptr[1][8]~q ),
	.prn(vcc));
defparam \lf_cw_size_ptr[1][8] .is_wysiwyg = "true";
defparam \lf_cw_size_ptr[1][8] .power_up = "low";

cycloneive_lcell_comb \readadd~23 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~14_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~23_combout ),
	.cout());
defparam \readadd~23 .lut_mask = 16'hFBFF;
defparam \readadd~23 .sum_lutc_input = "datac";

dffeas \readadd[8] (
	.clk(clk),
	.d(\readadd~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[8]~q ),
	.prn(vcc));
defparam \readadd[8] .is_wysiwyg = "true";
defparam \readadd[8] .power_up = "low";

cycloneive_lcell_comb \Add2~12 (
	.dataa(\readadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~11 ),
	.combout(\Add2~12_combout ),
	.cout(\Add2~13 ));
defparam \Add2~12 .lut_mask = 16'h5AAF;
defparam \Add2~12 .sum_lutc_input = "cin";

cycloneive_lcell_comb \readadd~24 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\Add2~12_combout ),
	.datad(\rd_ge_block_size_q~q ),
	.cin(gnd),
	.combout(\readadd~24_combout ),
	.cout());
defparam \readadd~24 .lut_mask = 16'hFBFF;
defparam \readadd~24 .sum_lutc_input = "datac";

dffeas \readadd[7] (
	.clk(clk),
	.d(\readadd~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\readadd[4]~16_combout ),
	.q(\readadd[7]~q ),
	.prn(vcc));
defparam \readadd[7] .is_wysiwyg = "true";
defparam \readadd[7] .power_up = "low";

cycloneive_lcell_comb \Add2~14 (
	.dataa(\readadd[8]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add2~13 ),
	.combout(\Add2~14_combout ),
	.cout());
defparam \Add2~14 .lut_mask = 16'h5A5A;
defparam \Add2~14 .sum_lutc_input = "cin";

cycloneive_lcell_comb \Equal3~3 (
	.dataa(\lf_cw_size_ptr[1][7]~q ),
	.datab(\lf_cw_size_ptr[1][8]~q ),
	.datac(\Add2~14_combout ),
	.datad(\Add2~12_combout ),
	.cin(gnd),
	.combout(\Equal3~3_combout ),
	.cout());
defparam \Equal3~3 .lut_mask = 16'h6996;
defparam \Equal3~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Equal3~4 (
	.dataa(\Equal3~0_combout ),
	.datab(\Equal3~1_combout ),
	.datac(\Equal3~2_combout ),
	.datad(\Equal3~3_combout ),
	.cin(gnd),
	.combout(\Equal3~4_combout ),
	.cout());
defparam \Equal3~4 .lut_mask = 16'hFFFE;
defparam \Equal3~4 .sum_lutc_input = "datac";

dffeas rd_ge_block_size_q(
	.clk(clk),
	.d(\Equal3~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\rd_ge_block_size_q~q ),
	.prn(vcc));
defparam rd_ge_block_size_q.is_wysiwyg = "true";
defparam rd_ge_block_size_q.power_up = "low";

cycloneive_lcell_comb \rd_ge_block_size~0 (
	.dataa(\atl_buffer_state.S0~q ),
	.datab(\rd_ge_block_size_q~q ),
	.datac(gnd),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rd_ge_block_size~0_combout ),
	.cout());
defparam \rd_ge_block_size~0 .lut_mask = 16'hEEFF;
defparam \rd_ge_block_size~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \cwsize_logic_fifo~2 (
	.dataa(\chn_end_point_q~q ),
	.datab(\enable~0_combout ),
	.datac(\rd_ge_block_size_q~q ),
	.datad(\lf_status_swap[5]~q ),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~2_combout ),
	.cout());
defparam \cwsize_logic_fifo~2 .lut_mask = 16'hBFFF;
defparam \cwsize_logic_fifo~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \cwsize_logic_fifo~3 (
	.dataa(\rd_ge_block_size_q~q ),
	.datab(\lf_status_swap[1]~q ),
	.datac(\enable~0_combout ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~3_combout ),
	.cout());
defparam \cwsize_logic_fifo~3 .lut_mask = 16'hFEFF;
defparam \cwsize_logic_fifo~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_swap[5]~0 (
	.dataa(\cwsize_logic_fifo~2_combout ),
	.datab(\lf_status_swap[4]~q ),
	.datac(\lf_status_swap[5]~q ),
	.datad(\cwsize_logic_fifo~3_combout ),
	.cin(gnd),
	.combout(\lf_status_swap[5]~0_combout ),
	.cout());
defparam \lf_status_swap[5]~0 .lut_mask = 16'hFEFF;
defparam \lf_status_swap[5]~0 .sum_lutc_input = "datac";

dffeas \lf_status_swap[5] (
	.clk(clk),
	.d(\lf_status_swap[5]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_swap[5]~q ),
	.prn(vcc));
defparam \lf_status_swap[5] .is_wysiwyg = "true";
defparam \lf_status_swap[5] .power_up = "low";

cycloneive_lcell_comb \lf_status_swap~1 (
	.dataa(\lf_status_swap[5]~q ),
	.datab(\chn_end_point_q~q ),
	.datac(\lf_status_swap[3]~q ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_status_swap~1_combout ),
	.cout());
defparam \lf_status_swap~1 .lut_mask = 16'hFEFF;
defparam \lf_status_swap~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_swap[4]~2 (
	.dataa(\lf_status_swap[1]~q ),
	.datab(\rd_ge_block_size~0_combout ),
	.datac(\lf_status_swap[5]~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\lf_status_swap[4]~2_combout ),
	.cout());
defparam \lf_status_swap[4]~2 .lut_mask = 16'hBFEF;
defparam \lf_status_swap[4]~2 .sum_lutc_input = "datac";

dffeas \lf_status_swap[4] (
	.clk(clk),
	.d(\lf_status_swap~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_swap[4]~2_combout ),
	.q(\lf_status_swap[4]~q ),
	.prn(vcc));
defparam \lf_status_swap[4] .is_wysiwyg = "true";
defparam \lf_status_swap[4] .power_up = "low";

cycloneive_lcell_comb \lf_status_swap~5 (
	.dataa(\lf_status_swap[2]~q ),
	.datab(\lf_status_swap[4]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~2_combout ),
	.cin(gnd),
	.combout(\lf_status_swap~5_combout ),
	.cout());
defparam \lf_status_swap~5 .lut_mask = 16'hAACC;
defparam \lf_status_swap~5 .sum_lutc_input = "datac";

dffeas \lf_status_swap[3] (
	.clk(clk),
	.d(\lf_status_swap~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_swap[4]~2_combout ),
	.q(\lf_status_swap[3]~q ),
	.prn(vcc));
defparam \lf_status_swap[3] .is_wysiwyg = "true";
defparam \lf_status_swap[3] .power_up = "low";

cycloneive_lcell_comb \lf_status_swap~6 (
	.dataa(\lf_status_swap[3]~q ),
	.datab(gnd),
	.datac(\cwsize_logic_fifo~2_combout ),
	.datad(\lf_status_swap[1]~q ),
	.cin(gnd),
	.combout(\lf_status_swap~6_combout ),
	.cout());
defparam \lf_status_swap~6 .lut_mask = 16'hA0AF;
defparam \lf_status_swap~6 .sum_lutc_input = "datac";

dffeas \lf_status_swap[2] (
	.clk(clk),
	.d(\lf_status_swap~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_swap[4]~2_combout ),
	.q(\lf_status_swap[2]~q ),
	.prn(vcc));
defparam \lf_status_swap[2] .is_wysiwyg = "true";
defparam \lf_status_swap[2] .power_up = "low";

cycloneive_lcell_comb \lf_status_swap~3 (
	.dataa(\rd_ge_block_size~0_combout ),
	.datab(\lf_status_swap[2]~q ),
	.datac(\chn_end_point_q~q ),
	.datad(\lf_status_swap[1]~q ),
	.cin(gnd),
	.combout(\lf_status_swap~3_combout ),
	.cout());
defparam \lf_status_swap~3 .lut_mask = 16'hEFFF;
defparam \lf_status_swap~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_swap~4 (
	.dataa(\lf_status_swap~3_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~2_combout ),
	.cin(gnd),
	.combout(\lf_status_swap~4_combout ),
	.cout());
defparam \lf_status_swap~4 .lut_mask = 16'hFF55;
defparam \lf_status_swap~4 .sum_lutc_input = "datac";

dffeas \lf_status_swap[1] (
	.clk(clk),
	.d(\lf_status_swap~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_swap[1]~q ),
	.prn(vcc));
defparam \lf_status_swap[1] .is_wysiwyg = "true";
defparam \lf_status_swap[1] .power_up = "low";

cycloneive_lcell_comb \readadd_ctrl.S0~0 (
	.dataa(\readadd_ctrl.S0~q ),
	.datab(\seed_cnt_eq_zero_q~q ),
	.datac(\lf_status_swap[1]~q ),
	.datad(\enable~0_combout ),
	.cin(gnd),
	.combout(\readadd_ctrl.S0~0_combout ),
	.cout());
defparam \readadd_ctrl.S0~0 .lut_mask = 16'hFFFE;
defparam \readadd_ctrl.S0~0 .sum_lutc_input = "datac";

dffeas \readadd_ctrl.S0 (
	.clk(clk),
	.d(\readadd_ctrl.S0~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\readadd_ctrl.S0~q ),
	.prn(vcc));
defparam \readadd_ctrl.S0 .is_wysiwyg = "true";
defparam \readadd_ctrl.S0 .power_up = "low";

cycloneive_lcell_comb \Selector26~0 (
	.dataa(\seed_cnt_eq_zero_q~q ),
	.datab(\wr_errvec_ctrl~q ),
	.datac(\lf_status_swap[3]~q ),
	.datad(\lf_status_swap[2]~q ),
	.cin(gnd),
	.combout(\Selector26~0_combout ),
	.cout());
defparam \Selector26~0 .lut_mask = 16'hBFFF;
defparam \Selector26~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector26~1 (
	.dataa(\readadd_ctrl.busy~q ),
	.datab(\readadd_ctrl.S0~q ),
	.datac(\Selector26~0_combout ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\Selector26~1_combout ),
	.cout());
defparam \Selector26~1 .lut_mask = 16'hFEFF;
defparam \Selector26~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector26~2 (
	.dataa(\seed_cnt_eq_zero_q~q ),
	.datab(\wr_errvec_ctrl~q ),
	.datac(\readadd_ctrl.S0~q ),
	.datad(\readadd_ctrl.busy~q ),
	.cin(gnd),
	.combout(\Selector26~2_combout ),
	.cout());
defparam \Selector26~2 .lut_mask = 16'hA3FF;
defparam \Selector26~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector26~3 (
	.dataa(\Selector26~1_combout ),
	.datab(\lf_status_swap[1]~q ),
	.datac(\Selector26~2_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector26~3_combout ),
	.cout());
defparam \Selector26~3 .lut_mask = 16'hFEFE;
defparam \Selector26~3 .sum_lutc_input = "datac";

dffeas \readadd_ctrl.busy (
	.clk(clk),
	.d(\Selector26~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\readadd_ctrl.busy~q ),
	.prn(vcc));
defparam \readadd_ctrl.busy .is_wysiwyg = "true";
defparam \readadd_ctrl.busy .power_up = "low";

dffeas dav_source_gen(
	.clk(clk),
	.d(\readadd_ctrl.busy~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\dav_source_gen~q ),
	.prn(vcc));
defparam dav_source_gen.is_wysiwyg = "true";
defparam dav_source_gen.power_up = "low";

dffeas \dav_source_del[1] (
	.clk(clk),
	.d(\dav_source_gen~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\dav_source_del[1]~q ),
	.prn(vcc));
defparam \dav_source_del[1] .is_wysiwyg = "true";
defparam \dav_source_del[1] .power_up = "low";

dffeas \dav_source_del[2] (
	.clk(clk),
	.d(\dav_source_del[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\dav_source_del[2]~q ),
	.prn(vcc));
defparam \dav_source_del[2] .is_wysiwyg = "true";
defparam \dav_source_del[2] .power_up = "low";

cycloneive_lcell_comb \Selector29~0 (
	.dataa(source_ena),
	.datab(\dav_source_del[2]~q ),
	.datac(\atl_buffer_state.out_idle~q ),
	.datad(\Selector28~0_combout ),
	.cin(gnd),
	.combout(\Selector29~0_combout ),
	.cout());
defparam \Selector29~0 .lut_mask = 16'hFEFF;
defparam \Selector29~0 .sum_lutc_input = "datac";

dffeas \atl_buffer_state.out_active (
	.clk(clk),
	.d(\Selector29~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\atl_buffer_state.out_active~q ),
	.prn(vcc));
defparam \atl_buffer_state.out_active .is_wysiwyg = "true";
defparam \atl_buffer_state.out_active .power_up = "low";

cycloneive_lcell_comb \Selector28~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\atl_buffer_state.out_hold~q ),
	.datad(\atl_buffer_state.out_active~q ),
	.cin(gnd),
	.combout(\Selector28~0_combout ),
	.cout());
defparam \Selector28~0 .lut_mask = 16'h0FFF;
defparam \Selector28~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector28~1 (
	.dataa(\Selector28~0_combout ),
	.datab(source_ena),
	.datac(\atl_buffer_state.out_idle~q ),
	.datad(\dav_source_del[2]~q ),
	.cin(gnd),
	.combout(\Selector28~1_combout ),
	.cout());
defparam \Selector28~1 .lut_mask = 16'hEFFF;
defparam \Selector28~1 .sum_lutc_input = "datac";

dffeas \atl_buffer_state.out_idle (
	.clk(clk),
	.d(\Selector28~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\atl_buffer_state.out_idle~q ),
	.prn(vcc));
defparam \atl_buffer_state.out_idle .is_wysiwyg = "true";
defparam \atl_buffer_state.out_idle .power_up = "low";

cycloneive_lcell_comb \Selector30~0 (
	.dataa(\dav_source_del[2]~q ),
	.datab(\atl_buffer_state.out_idle~q ),
	.datac(\Selector28~0_combout ),
	.datad(source_ena),
	.cin(gnd),
	.combout(\Selector30~0_combout ),
	.cout());
defparam \Selector30~0 .lut_mask = 16'hEFFF;
defparam \Selector30~0 .sum_lutc_input = "datac";

dffeas \atl_buffer_state.out_hold (
	.clk(clk),
	.d(\Selector30~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\atl_buffer_state.out_hold~q ),
	.prn(vcc));
defparam \atl_buffer_state.out_hold .is_wysiwyg = "true";
defparam \atl_buffer_state.out_hold .power_up = "low";

cycloneive_lcell_comb \enable~0 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(\atl_buffer_state.S0~q ),
	.cin(gnd),
	.combout(\enable~0_combout ),
	.cout());
defparam \enable~0 .lut_mask = 16'hFF55;
defparam \enable~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_cwsize[5]~0 (
	.dataa(\lf_status_cwsize[5]~q ),
	.datab(\enable~0_combout ),
	.datac(\rd_ge_block_size_q~q ),
	.datad(\lf_status_cwsize[1]~q ),
	.cin(gnd),
	.combout(\lf_status_cwsize[5]~0_combout ),
	.cout());
defparam \lf_status_cwsize[5]~0 .lut_mask = 16'hBFFF;
defparam \lf_status_cwsize[5]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_cwsize[5]~1 (
	.dataa(\lf_status_cwsize[5]~0_combout ),
	.datab(\lf_status_cwsize[4]~q ),
	.datac(\cwsize_logic_fifo~0_combout ),
	.datad(\rd_ge_block_size~0_combout ),
	.cin(gnd),
	.combout(\lf_status_cwsize[5]~1_combout ),
	.cout());
defparam \lf_status_cwsize[5]~1 .lut_mask = 16'hFEFF;
defparam \lf_status_cwsize[5]~1 .sum_lutc_input = "datac";

dffeas \lf_status_cwsize[5] (
	.clk(clk),
	.d(\lf_status_cwsize[5]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_cwsize[5]~q ),
	.prn(vcc));
defparam \lf_status_cwsize[5] .is_wysiwyg = "true";
defparam \lf_status_cwsize[5] .power_up = "low";

cycloneive_lcell_comb \pipe_ptr~0 (
	.dataa(\seed_cnt_eq_zero_q~q ),
	.datab(\toggle_cnt_del[3]~q ),
	.datac(\load_status~q ),
	.datad(\lf_status_cwsize[5]~q ),
	.cin(gnd),
	.combout(\pipe_ptr~0_combout ),
	.cout());
defparam \pipe_ptr~0 .lut_mask = 16'hEFFF;
defparam \pipe_ptr~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \wr_ptr_ctrl[2]~2 (
	.dataa(\pipe_ptr~0_combout ),
	.datab(\wr_ptr_ctrl[1]~q ),
	.datac(\wr_ptr_ctrl[3]~q ),
	.datad(sink_eop_q),
	.cin(gnd),
	.combout(\wr_ptr_ctrl[2]~2_combout ),
	.cout());
defparam \wr_ptr_ctrl[2]~2 .lut_mask = 16'hEBBE;
defparam \wr_ptr_ctrl[2]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \wr_ptr_ctrl[2]~3 (
	.dataa(\wr_ptr_ctrl[2]~2_combout ),
	.datab(\wr_ptr_ctrl[2]~q ),
	.datac(\pipe_ptr~2_combout ),
	.datad(\pipe_ptr~1_combout ),
	.cin(gnd),
	.combout(\wr_ptr_ctrl[2]~3_combout ),
	.cout());
defparam \wr_ptr_ctrl[2]~3 .lut_mask = 16'hEFFF;
defparam \wr_ptr_ctrl[2]~3 .sum_lutc_input = "datac";

dffeas \wr_ptr_ctrl[2] (
	.clk(clk),
	.d(\wr_ptr_ctrl[2]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wr_ptr_ctrl[2]~q ),
	.prn(vcc));
defparam \wr_ptr_ctrl[2] .is_wysiwyg = "true";
defparam \wr_ptr_ctrl[2] .power_up = "low";

cycloneive_lcell_comb \wr_ptr_ctrl[1]~0 (
	.dataa(\wr_ptr_ctrl[1]~q ),
	.datab(sink_eop_q),
	.datac(\wr_ptr_ctrl[2]~q ),
	.datad(\cwsize_logic_fifo~0_combout ),
	.cin(gnd),
	.combout(\wr_ptr_ctrl[1]~0_combout ),
	.cout());
defparam \wr_ptr_ctrl[1]~0 .lut_mask = 16'hFEFF;
defparam \wr_ptr_ctrl[1]~0 .sum_lutc_input = "datac";

dffeas \wr_ptr_ctrl[1] (
	.clk(clk),
	.d(\wr_ptr_ctrl[1]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wr_ptr_ctrl[1]~q ),
	.prn(vcc));
defparam \wr_ptr_ctrl[1] .is_wysiwyg = "true";
defparam \wr_ptr_ctrl[1] .power_up = "low";

cycloneive_lcell_comb \pipe_ptr~4 (
	.dataa(\wr_ptr_ctrl[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(\wr_ptr_ctrl[3]~q ),
	.cin(gnd),
	.combout(\pipe_ptr~4_combout ),
	.cout());
defparam \pipe_ptr~4 .lut_mask = 16'hAAFF;
defparam \pipe_ptr~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_ptr~5 (
	.dataa(sink_eop_q),
	.datab(\wr_ptr_ctrl[1]~q ),
	.datac(\pipe_ptr~4_combout ),
	.datad(\cwsize_logic_fifo~0_combout ),
	.cin(gnd),
	.combout(\pipe_ptr~5_combout ),
	.cout());
defparam \pipe_ptr~5 .lut_mask = 16'hFAFC;
defparam \pipe_ptr~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_wr_ptr~24 (
	.dataa(\writeadd[1]~q ),
	.datab(\pipe_ptr~5_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\pipe_wr_ptr~24_combout ),
	.cout());
defparam \pipe_wr_ptr~24 .lut_mask = 16'hEEEE;
defparam \pipe_wr_ptr~24 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[1][1] (
	.clk(clk),
	.d(\pipe_wr_ptr~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[1][8]~25_combout ),
	.q(\pipe_wr_ptr[1][1]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[1][1] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[1][1] .power_up = "low";

cycloneive_lcell_comb \pipe_wr_ptr~16 (
	.dataa(\writeadd[1]~q ),
	.datab(\pipe_wr_ptr[1][1]~q ),
	.datac(gnd),
	.datad(\pipe_ptr~3_combout ),
	.cin(gnd),
	.combout(\pipe_wr_ptr~16_combout ),
	.cout());
defparam \pipe_wr_ptr~16 .lut_mask = 16'hAACC;
defparam \pipe_wr_ptr~16 .sum_lutc_input = "datac";

dffeas \pipe_wr_ptr[2][1] (
	.clk(clk),
	.d(\pipe_wr_ptr~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\pipe_wr_ptr[2][3]~9_combout ),
	.q(\pipe_wr_ptr[2][1]~q ),
	.prn(vcc));
defparam \pipe_wr_ptr[2][1] .is_wysiwyg = "true";
defparam \pipe_wr_ptr[2][1] .power_up = "low";

dffeas \seed_cnt[1] (
	.clk(clk),
	.d(\seed_cnt[1]~8_combout ),
	.asdata(\pipe_wr_ptr[2][1]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[1]~q ),
	.prn(vcc));
defparam \seed_cnt[1] .is_wysiwyg = "true";
defparam \seed_cnt[1] .power_up = "low";

dffeas \seed_cnt[2] (
	.clk(clk),
	.d(\seed_cnt[2]~10_combout ),
	.asdata(\pipe_wr_ptr[2][2]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[2]~q ),
	.prn(vcc));
defparam \seed_cnt[2] .is_wysiwyg = "true";
defparam \seed_cnt[2] .power_up = "low";

cycloneive_lcell_comb \seed_cnt[4]~15 (
	.dataa(\seed_cnt[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\seed_cnt[3]~14 ),
	.combout(\seed_cnt[4]~15_combout ),
	.cout(\seed_cnt[4]~16 ));
defparam \seed_cnt[4]~15 .lut_mask = 16'h5A5F;
defparam \seed_cnt[4]~15 .sum_lutc_input = "cin";

dffeas \seed_cnt[4] (
	.clk(clk),
	.d(\seed_cnt[4]~15_combout ),
	.asdata(\pipe_wr_ptr[2][4]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[4]~q ),
	.prn(vcc));
defparam \seed_cnt[4] .is_wysiwyg = "true";
defparam \seed_cnt[4] .power_up = "low";

cycloneive_lcell_comb \seed_cnt[5]~17 (
	.dataa(\seed_cnt[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\seed_cnt[4]~16 ),
	.combout(\seed_cnt[5]~17_combout ),
	.cout(\seed_cnt[5]~18 ));
defparam \seed_cnt[5]~17 .lut_mask = 16'h5AAF;
defparam \seed_cnt[5]~17 .sum_lutc_input = "cin";

dffeas \seed_cnt[5] (
	.clk(clk),
	.d(\seed_cnt[5]~17_combout ),
	.asdata(\pipe_wr_ptr[2][5]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[5]~q ),
	.prn(vcc));
defparam \seed_cnt[5] .is_wysiwyg = "true";
defparam \seed_cnt[5] .power_up = "low";

cycloneive_lcell_comb \seed_cnt[6]~19 (
	.dataa(\seed_cnt[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\seed_cnt[5]~18 ),
	.combout(\seed_cnt[6]~19_combout ),
	.cout(\seed_cnt[6]~20 ));
defparam \seed_cnt[6]~19 .lut_mask = 16'h5A5F;
defparam \seed_cnt[6]~19 .sum_lutc_input = "cin";

dffeas \seed_cnt[6] (
	.clk(clk),
	.d(\seed_cnt[6]~19_combout ),
	.asdata(\pipe_wr_ptr[2][6]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[6]~q ),
	.prn(vcc));
defparam \seed_cnt[6] .is_wysiwyg = "true";
defparam \seed_cnt[6] .power_up = "low";

cycloneive_lcell_comb \Equal1~0 (
	.dataa(\seed_cnt[2]~q ),
	.datab(\seed_cnt[4]~q ),
	.datac(\seed_cnt[5]~q ),
	.datad(\seed_cnt[6]~q ),
	.cin(gnd),
	.combout(\Equal1~0_combout ),
	.cout());
defparam \Equal1~0 .lut_mask = 16'h7FFF;
defparam \Equal1~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \seed_cnt[7]~21 (
	.dataa(\seed_cnt[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\seed_cnt[6]~20 ),
	.combout(\seed_cnt[7]~21_combout ),
	.cout(\seed_cnt[7]~22 ));
defparam \seed_cnt[7]~21 .lut_mask = 16'h5AAF;
defparam \seed_cnt[7]~21 .sum_lutc_input = "cin";

dffeas \seed_cnt[7] (
	.clk(clk),
	.d(\seed_cnt[7]~21_combout ),
	.asdata(\pipe_wr_ptr[2][7]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[7]~q ),
	.prn(vcc));
defparam \seed_cnt[7] .is_wysiwyg = "true";
defparam \seed_cnt[7] .power_up = "low";

cycloneive_lcell_comb \seed_cnt[8]~23 (
	.dataa(\seed_cnt[8]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\seed_cnt[7]~22 ),
	.combout(\seed_cnt[8]~23_combout ),
	.cout());
defparam \seed_cnt[8]~23 .lut_mask = 16'h5A5A;
defparam \seed_cnt[8]~23 .sum_lutc_input = "cin";

dffeas \seed_cnt[8] (
	.clk(clk),
	.d(\seed_cnt[8]~23_combout ),
	.asdata(\pipe_wr_ptr[2][8]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cwsize_logic_fifo~0_combout ),
	.ena(\seed_cnt[8]~12_combout ),
	.q(\seed_cnt[8]~q ),
	.prn(vcc));
defparam \seed_cnt[8] .is_wysiwyg = "true";
defparam \seed_cnt[8] .power_up = "low";

cycloneive_lcell_comb \Equal1~1 (
	.dataa(\Equal1~0_combout ),
	.datab(gnd),
	.datac(\seed_cnt[7]~q ),
	.datad(\seed_cnt[8]~q ),
	.cin(gnd),
	.combout(\Equal1~1_combout ),
	.cout());
defparam \Equal1~1 .lut_mask = 16'hAFFF;
defparam \Equal1~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Equal1~2 (
	.dataa(\Equal1~1_combout ),
	.datab(\seed_cnt[3]~q ),
	.datac(gnd),
	.datad(\seed_cnt[1]~q ),
	.cin(gnd),
	.combout(\Equal1~2_combout ),
	.cout());
defparam \Equal1~2 .lut_mask = 16'hEEFF;
defparam \Equal1~2 .sum_lutc_input = "datac";

dffeas chn_end_point_q(
	.clk(clk),
	.d(\Equal1~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\chn_end_point_q~q ),
	.prn(vcc));
defparam chn_end_point_q.is_wysiwyg = "true";
defparam chn_end_point_q.power_up = "low";

cycloneive_lcell_comb \rd_state.S0~0 (
	.dataa(\rd_state.S0~q ),
	.datab(\atl_buffer_state.S0~q ),
	.datac(\chn_end_point_q~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rd_state.S0~0_combout ),
	.cout());
defparam \rd_state.S0~0 .lut_mask = 16'hFEFF;
defparam \rd_state.S0~0 .sum_lutc_input = "datac";

dffeas \rd_state.S0 (
	.clk(clk),
	.d(\rd_state.S0~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rd_state.S0~q ),
	.prn(vcc));
defparam \rd_state.S0 .is_wysiwyg = "true";
defparam \rd_state.S0 .power_up = "low";

cycloneive_lcell_comb \Selector13~0 (
	.dataa(\chn_end_point_q~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(\rd_state.S0~q ),
	.cin(gnd),
	.combout(\Selector13~0_combout ),
	.cout());
defparam \Selector13~0 .lut_mask = 16'hAAFF;
defparam \Selector13~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \eop_source_gen~0 (
	.dataa(\atl_buffer_state.S0~q ),
	.datab(\readadd_ctrl.busy~q ),
	.datac(\rd_ge_block_size_q~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\eop_source_gen~0_combout ),
	.cout());
defparam \eop_source_gen~0 .lut_mask = 16'hFEFF;
defparam \eop_source_gen~0 .sum_lutc_input = "datac";

dffeas \rd_state.S2 (
	.clk(clk),
	.d(\rd_state.S1~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\eop_source_gen~0_combout ),
	.q(\rd_state.S2~q ),
	.prn(vcc));
defparam \rd_state.S2 .is_wysiwyg = "true";
defparam \rd_state.S2 .power_up = "low";

dffeas \rd_state.S3 (
	.clk(clk),
	.d(\rd_state.S2~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\eop_source_gen~0_combout ),
	.q(\rd_state.S3~q ),
	.prn(vcc));
defparam \rd_state.S3 .is_wysiwyg = "true";
defparam \rd_state.S3 .power_up = "low";

dffeas \rd_state.S4 (
	.clk(clk),
	.d(\rd_state.S3~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\eop_source_gen~0_combout ),
	.q(\rd_state.S4~q ),
	.prn(vcc));
defparam \rd_state.S4 .is_wysiwyg = "true";
defparam \rd_state.S4 .power_up = "low";

cycloneive_lcell_comb \Selector13~1 (
	.dataa(\Selector13~0_combout ),
	.datab(\rd_state.S4~q ),
	.datac(\rd_state.S1~q ),
	.datad(\eop_source_gen~0_combout ),
	.cin(gnd),
	.combout(\Selector13~1_combout ),
	.cout());
defparam \Selector13~1 .lut_mask = 16'hFAFC;
defparam \Selector13~1 .sum_lutc_input = "datac";

dffeas \rd_state.S1 (
	.clk(clk),
	.d(\Selector13~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\rd_state.S1~q ),
	.prn(vcc));
defparam \rd_state.S1 .is_wysiwyg = "true";
defparam \rd_state.S1 .power_up = "low";

dffeas \tmp_del[1] (
	.clk(clk),
	.d(\rd_state.S1~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\tmp_del[1]~q ),
	.prn(vcc));
defparam \tmp_del[1] .is_wysiwyg = "true";
defparam \tmp_del[1] .power_up = "low";

dffeas oneout_del(
	.clk(clk),
	.d(\tmp_del[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\oneout_del~q ),
	.prn(vcc));
defparam oneout_del.is_wysiwyg = "true";
defparam oneout_del.power_up = "low";

dffeas \tmp_del[2] (
	.clk(clk),
	.d(\rd_state.S2~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\tmp_del[2]~q ),
	.prn(vcc));
defparam \tmp_del[2] .is_wysiwyg = "true";
defparam \tmp_del[2] .power_up = "low";

dffeas twoout_del(
	.clk(clk),
	.d(\tmp_del[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\twoout_del~q ),
	.prn(vcc));
defparam twoout_del.is_wysiwyg = "true";
defparam twoout_del.power_up = "low";

cycloneive_lcell_comb \data_2_correct~0 (
	.dataa(\oneout_del~q ),
	.datab(\twoout_del~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\data_2_correct~0_combout ),
	.cout());
defparam \data_2_correct~0 .lut_mask = 16'hEEEE;
defparam \data_2_correct~0 .sum_lutc_input = "datac";

dffeas \tmp_del[3] (
	.clk(clk),
	.d(\rd_state.S3~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\tmp_del[3]~q ),
	.prn(vcc));
defparam \tmp_del[3] .is_wysiwyg = "true";
defparam \tmp_del[3] .power_up = "low";

dffeas throut_del(
	.clk(clk),
	.d(\tmp_del[3]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\throut_del~q ),
	.prn(vcc));
defparam throut_del.is_wysiwyg = "true";
defparam throut_del.power_up = "low";

dffeas \tmp_del[4] (
	.clk(clk),
	.d(\rd_state.S4~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\tmp_del[4]~q ),
	.prn(vcc));
defparam \tmp_del[4] .is_wysiwyg = "true";
defparam \tmp_del[4] .power_up = "low";

dffeas forout_del(
	.clk(clk),
	.d(\tmp_del[4]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\forout_del~q ),
	.prn(vcc));
defparam forout_del.is_wysiwyg = "true";
defparam forout_del.power_up = "low";

cycloneive_lcell_comb \data_2_correct~1 (
	.dataa(\throut_del~q ),
	.datab(\forout_del~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\data_2_correct~1_combout ),
	.cout());
defparam \data_2_correct~1 .lut_mask = 16'hEEEE;
defparam \data_2_correct~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \data_2_correct[1] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[0] ),
	.datad(\RAM_DP_12|auto_generated|q_b[0] ),
	.cin(gnd),
	.combout(\data_2_correct[1]~combout ),
	.cout());
defparam \data_2_correct[1] .lut_mask = 16'hFFFE;
defparam \data_2_correct[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector22~0 (
	.dataa(\chn_status.busy~q ),
	.datab(stateS98),
	.datac(\chn_end_point_q~q ),
	.datad(\lf_status_swap[4]~q ),
	.cin(gnd),
	.combout(\Selector22~0_combout ),
	.cout());
defparam \Selector22~0 .lut_mask = 16'hBEFF;
defparam \Selector22~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector22~1 (
	.dataa(stateS98),
	.datab(gnd),
	.datac(gnd),
	.datad(\chn_status.idle~q ),
	.cin(gnd),
	.combout(\Selector22~1_combout ),
	.cout());
defparam \Selector22~1 .lut_mask = 16'hAAFF;
defparam \Selector22~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector22~2 (
	.dataa(\Selector22~1_combout ),
	.datab(chn_statusbooked),
	.datac(\chn_end_point_q~q ),
	.datad(\lf_status_swap[4]~q ),
	.cin(gnd),
	.combout(\Selector22~2_combout ),
	.cout());
defparam \Selector22~2 .lut_mask = 16'hFEFF;
defparam \Selector22~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector22~3 (
	.dataa(chn_statusload),
	.datab(\Selector22~0_combout ),
	.datac(\Selector22~2_combout ),
	.datad(\lf_status_swap[5]~q ),
	.cin(gnd),
	.combout(\Selector22~3_combout ),
	.cout());
defparam \Selector22~3 .lut_mask = 16'hFEFF;
defparam \Selector22~3 .sum_lutc_input = "datac";

dffeas \chn_status.busy (
	.clk(clk),
	.d(\Selector22~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\chn_status.busy~q ),
	.prn(vcc));
defparam \chn_status.busy .is_wysiwyg = "true";
defparam \chn_status.busy .power_up = "low";

cycloneive_lcell_comb \Selector21~0 (
	.dataa(\chn_status.busy~q ),
	.datab(\chn_end_point_q~q ),
	.datac(\chn_status.idle~q ),
	.datad(stateS98),
	.cin(gnd),
	.combout(\Selector21~0_combout ),
	.cout());
defparam \Selector21~0 .lut_mask = 16'hFFF7;
defparam \Selector21~0 .sum_lutc_input = "datac";

dffeas \chn_status.idle (
	.clk(clk),
	.d(\Selector21~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\chn_status.idle~q ),
	.prn(vcc));
defparam \chn_status.idle .is_wysiwyg = "true";
defparam \chn_status.idle .power_up = "low";

cycloneive_lcell_comb \decfail_lf~0 (
	.dataa(\chn_end_point_q~q ),
	.datab(\chn_status.idle~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\decfail_lf~0_combout ),
	.cout());
defparam \decfail_lf~0 .lut_mask = 16'hEEEE;
defparam \decfail_lf~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \FSM_chn~1 (
	.dataa(\chn_end_point_q~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(stateS98),
	.cin(gnd),
	.combout(\FSM_chn~1_combout ),
	.cout());
defparam \FSM_chn~1 .lut_mask = 16'hAAFF;
defparam \FSM_chn~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_numerr~5 (
	.dataa(stateS98),
	.datab(gnd),
	.datac(\chn_end_point_q~q ),
	.datad(\numerr_ctrl[0]~q ),
	.cin(gnd),
	.combout(\pipe_numerr~5_combout ),
	.cout());
defparam \pipe_numerr~5 .lut_mask = 16'hAFFF;
defparam \pipe_numerr~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl~2 (
	.dataa(\FSM_chn~1_combout ),
	.datab(\numerr_ctrl[1]~q ),
	.datac(\numerr_ctrl[2]~q ),
	.datad(\pipe_numerr~5_combout ),
	.cin(gnd),
	.combout(\numerr_ctrl~2_combout ),
	.cout());
defparam \numerr_ctrl~2 .lut_mask = 16'hFFF7;
defparam \numerr_ctrl~2 .sum_lutc_input = "datac";

dffeas \numerr_ctrl[2] (
	.clk(clk),
	.d(\numerr_ctrl~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\numerr_ctrl[2]~q ),
	.prn(vcc));
defparam \numerr_ctrl[2] .is_wysiwyg = "true";
defparam \numerr_ctrl[2] .power_up = "low";

cycloneive_lcell_comb \numerr_ctrl~0 (
	.dataa(\numerr_ctrl[2]~q ),
	.datab(\numerr_ctrl[0]~q ),
	.datac(\numerr_ctrl[1]~q ),
	.datad(\FSM_chn~1_combout ),
	.cin(gnd),
	.combout(\numerr_ctrl~0_combout ),
	.cout());
defparam \numerr_ctrl~0 .lut_mask = 16'hFAFC;
defparam \numerr_ctrl~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl~1 (
	.dataa(\numerr_ctrl~0_combout ),
	.datab(\numerr_ctrl[1]~q ),
	.datac(\pipe_numerr~5_combout ),
	.datad(\numerr_ctrl[2]~q ),
	.cin(gnd),
	.combout(\numerr_ctrl~1_combout ),
	.cout());
defparam \numerr_ctrl~1 .lut_mask = 16'hACFF;
defparam \numerr_ctrl~1 .sum_lutc_input = "datac";

dffeas \numerr_ctrl[1] (
	.clk(clk),
	.d(\numerr_ctrl~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\numerr_ctrl[1]~q ),
	.prn(vcc));
defparam \numerr_ctrl[1] .is_wysiwyg = "true";
defparam \numerr_ctrl[1] .power_up = "low";

cycloneive_lcell_comb \numerr_ctrl[0]~3 (
	.dataa(stateS98),
	.datab(\numerr_ctrl[1]~q ),
	.datac(\chn_end_point_q~q ),
	.datad(\numerr_ctrl[0]~q ),
	.cin(gnd),
	.combout(\numerr_ctrl[0]~3_combout ),
	.cout());
defparam \numerr_ctrl[0]~3 .lut_mask = 16'hEFFF;
defparam \numerr_ctrl[0]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl[0]~4 (
	.dataa(\numerr_ctrl[0]~3_combout ),
	.datab(\numerr_ctrl[0]~q ),
	.datac(\FSM_chn~1_combout ),
	.datad(\numerr_ctrl[2]~q ),
	.cin(gnd),
	.combout(\numerr_ctrl[0]~4_combout ),
	.cout());
defparam \numerr_ctrl[0]~4 .lut_mask = 16'hEFFF;
defparam \numerr_ctrl[0]~4 .sum_lutc_input = "datac";

dffeas \numerr_ctrl[0] (
	.clk(clk),
	.d(\numerr_ctrl[0]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\numerr_ctrl[0]~q ),
	.prn(vcc));
defparam \numerr_ctrl[0] .is_wysiwyg = "true";
defparam \numerr_ctrl[0] .power_up = "low";

cycloneive_lcell_comb \pipe_numerr~4 (
	.dataa(stateS98),
	.datab(\numerr_ctrl[0]~q ),
	.datac(\numerr_ctrl[1]~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\pipe_numerr~4_combout ),
	.cout());
defparam \pipe_numerr~4 .lut_mask = 16'hFAFC;
defparam \pipe_numerr~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerrhold_q~5 (
	.dataa(llnum_q_2),
	.datab(\pipe_numerr~4_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerrhold_q~5_combout ),
	.cout());
defparam \numerrhold_q~5 .lut_mask = 16'hEEEE;
defparam \numerrhold_q~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerrhold_q[1][1]~6 (
	.dataa(gnd),
	.datab(\chn_end_point_q~q ),
	.datac(\numerr_ctrl[2]~q ),
	.datad(\pipe_numerr~4_combout ),
	.cin(gnd),
	.combout(\numerrhold_q[1][1]~6_combout ),
	.cout());
defparam \numerrhold_q[1][1]~6 .lut_mask = 16'hFFFC;
defparam \numerrhold_q[1][1]~6 .sum_lutc_input = "datac";

dffeas \numerrhold_q[1][2] (
	.clk(clk),
	.d(\numerrhold_q~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[1][1]~6_combout ),
	.q(\numerrhold_q[1][2]~q ),
	.prn(vcc));
defparam \numerrhold_q[1][2] .is_wysiwyg = "true";
defparam \numerrhold_q[1][2] .power_up = "low";

cycloneive_lcell_comb \pipe_numerr~1 (
	.dataa(stateS98),
	.datab(\numerr_ctrl[1]~q ),
	.datac(\chn_end_point_q~q ),
	.datad(\numerr_ctrl[2]~q ),
	.cin(gnd),
	.combout(\pipe_numerr~1_combout ),
	.cout());
defparam \pipe_numerr~1 .lut_mask = 16'hACFF;
defparam \pipe_numerr~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerrhold_q~0 (
	.dataa(llnum_q_2),
	.datab(\numerrhold_q[1][2]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~1_combout ),
	.cin(gnd),
	.combout(\numerrhold_q~0_combout ),
	.cout());
defparam \numerrhold_q~0 .lut_mask = 16'hAACC;
defparam \numerrhold_q~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerrhold_q[2][1]~1 (
	.dataa(\numerr_ctrl[1]~q ),
	.datab(stateS98),
	.datac(\numerr_ctrl[2]~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\numerrhold_q[2][1]~1_combout ),
	.cout());
defparam \numerrhold_q[2][1]~1 .lut_mask = 16'hEFFE;
defparam \numerrhold_q[2][1]~1 .sum_lutc_input = "datac";

dffeas \numerrhold_q[2][2] (
	.clk(clk),
	.d(\numerrhold_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[2][1]~1_combout ),
	.q(\numerrhold_q[2][2]~q ),
	.prn(vcc));
defparam \numerrhold_q[2][2] .is_wysiwyg = "true";
defparam \numerrhold_q[2][2] .power_up = "low";

cycloneive_lcell_comb \numroots~2 (
	.dataa(polyz),
	.datab(\toggle_cnt_del[1]~q ),
	.datac(\chn_status.idle~q ),
	.datad(\numroots[1]~q ),
	.cin(gnd),
	.combout(\numroots~2_combout ),
	.cout());
defparam \numroots~2 .lut_mask = 16'h6996;
defparam \numroots~2 .sum_lutc_input = "datac";

dffeas \numroots[1] (
	.clk(clk),
	.d(\numroots~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\numroots[1]~q ),
	.prn(vcc));
defparam \numroots[1] .is_wysiwyg = "true";
defparam \numroots[1] .power_up = "low";

cycloneive_lcell_comb \numroots~0 (
	.dataa(gnd),
	.datab(\numroots[1]~q ),
	.datac(\numroots[2]~q ),
	.datad(\toggle_cnt_del[1]~q ),
	.cin(gnd),
	.combout(\numroots~0_combout ),
	.cout());
defparam \numroots~0 .lut_mask = 16'h3CFF;
defparam \numroots~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numroots~1 (
	.dataa(\toggle_cnt_del[1]~q ),
	.datab(\chn_status.idle~q ),
	.datac(gnd),
	.datad(polyz),
	.cin(gnd),
	.combout(\numroots~1_combout ),
	.cout());
defparam \numroots~1 .lut_mask = 16'hFFEE;
defparam \numroots~1 .sum_lutc_input = "datac";

dffeas \numroots[2] (
	.clk(clk),
	.d(\numroots~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numroots~1_combout ),
	.q(\numroots[2]~q ),
	.prn(vcc));
defparam \numroots[2] .is_wysiwyg = "true";
defparam \numroots[2] .power_up = "low";

cycloneive_lcell_comb \numerrhold_q~7 (
	.dataa(llnum_q_1),
	.datab(\pipe_numerr~4_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerrhold_q~7_combout ),
	.cout());
defparam \numerrhold_q~7 .lut_mask = 16'hEEEE;
defparam \numerrhold_q~7 .sum_lutc_input = "datac";

dffeas \numerrhold_q[1][1] (
	.clk(clk),
	.d(\numerrhold_q~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[1][1]~6_combout ),
	.q(\numerrhold_q[1][1]~q ),
	.prn(vcc));
defparam \numerrhold_q[1][1] .is_wysiwyg = "true";
defparam \numerrhold_q[1][1] .power_up = "low";

cycloneive_lcell_comb \numerrhold_q~2 (
	.dataa(llnum_q_1),
	.datab(\numerrhold_q[1][1]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~1_combout ),
	.cin(gnd),
	.combout(\numerrhold_q~2_combout ),
	.cout());
defparam \numerrhold_q~2 .lut_mask = 16'hAACC;
defparam \numerrhold_q~2 .sum_lutc_input = "datac";

dffeas \numerrhold_q[2][1] (
	.clk(clk),
	.d(\numerrhold_q~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[2][1]~1_combout ),
	.q(\numerrhold_q[2][1]~q ),
	.prn(vcc));
defparam \numerrhold_q[2][1] .is_wysiwyg = "true";
defparam \numerrhold_q[2][1] .power_up = "low";

cycloneive_lcell_comb \decfail_gen_d~0 (
	.dataa(\numerrhold_q[2][2]~q ),
	.datab(\numroots[2]~q ),
	.datac(\numerrhold_q[2][1]~q ),
	.datad(\numroots[1]~q ),
	.cin(gnd),
	.combout(\decfail_gen_d~0_combout ),
	.cout());
defparam \decfail_gen_d~0 .lut_mask = 16'h6996;
defparam \decfail_gen_d~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerrhold_q~8 (
	.dataa(llnum_q_4),
	.datab(\pipe_numerr~4_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerrhold_q~8_combout ),
	.cout());
defparam \numerrhold_q~8 .lut_mask = 16'hEEEE;
defparam \numerrhold_q~8 .sum_lutc_input = "datac";

dffeas \numerrhold_q[1][4] (
	.clk(clk),
	.d(\numerrhold_q~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[1][1]~6_combout ),
	.q(\numerrhold_q[1][4]~q ),
	.prn(vcc));
defparam \numerrhold_q[1][4] .is_wysiwyg = "true";
defparam \numerrhold_q[1][4] .power_up = "low";

cycloneive_lcell_comb \numerrhold_q~3 (
	.dataa(llnum_q_4),
	.datab(\numerrhold_q[1][4]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~1_combout ),
	.cin(gnd),
	.combout(\numerrhold_q~3_combout ),
	.cout());
defparam \numerrhold_q~3 .lut_mask = 16'hAACC;
defparam \numerrhold_q~3 .sum_lutc_input = "datac";

dffeas \numerrhold_q[2][4] (
	.clk(clk),
	.d(\numerrhold_q~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[2][1]~1_combout ),
	.q(\numerrhold_q[2][4]~q ),
	.prn(vcc));
defparam \numerrhold_q[2][4] .is_wysiwyg = "true";
defparam \numerrhold_q[2][4] .power_up = "low";

cycloneive_lcell_comb \numroots~3 (
	.dataa(\Add5~0_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\toggle_cnt_del[1]~q ),
	.cin(gnd),
	.combout(\numroots~3_combout ),
	.cout());
defparam \numroots~3 .lut_mask = 16'hAAFF;
defparam \numroots~3 .sum_lutc_input = "datac";

dffeas \numroots[4] (
	.clk(clk),
	.d(\numroots~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numroots~1_combout ),
	.q(\numroots[4]~q ),
	.prn(vcc));
defparam \numroots[4] .is_wysiwyg = "true";
defparam \numroots[4] .power_up = "low";

cycloneive_lcell_comb \numroots~4 (
	.dataa(\numroots[3]~q ),
	.datab(\numroots[1]~q ),
	.datac(\numroots[2]~q ),
	.datad(\toggle_cnt_del[1]~q ),
	.cin(gnd),
	.combout(\numroots~4_combout ),
	.cout());
defparam \numroots~4 .lut_mask = 16'h96FF;
defparam \numroots~4 .sum_lutc_input = "datac";

dffeas \numroots[3] (
	.clk(clk),
	.d(\numroots~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numroots~1_combout ),
	.q(\numroots[3]~q ),
	.prn(vcc));
defparam \numroots[3] .is_wysiwyg = "true";
defparam \numroots[3] .power_up = "low";

cycloneive_lcell_comb \Add5~0 (
	.dataa(\numroots[4]~q ),
	.datab(\numroots[1]~q ),
	.datac(\numroots[2]~q ),
	.datad(\numroots[3]~q ),
	.cin(gnd),
	.combout(\Add5~0_combout ),
	.cout());
defparam \Add5~0 .lut_mask = 16'h6996;
defparam \Add5~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerrhold_q~9 (
	.dataa(llnum_q_3),
	.datab(\pipe_numerr~4_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerrhold_q~9_combout ),
	.cout());
defparam \numerrhold_q~9 .lut_mask = 16'hEEEE;
defparam \numerrhold_q~9 .sum_lutc_input = "datac";

dffeas \numerrhold_q[1][3] (
	.clk(clk),
	.d(\numerrhold_q~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[1][1]~6_combout ),
	.q(\numerrhold_q[1][3]~q ),
	.prn(vcc));
defparam \numerrhold_q[1][3] .is_wysiwyg = "true";
defparam \numerrhold_q[1][3] .power_up = "low";

cycloneive_lcell_comb \numerrhold_q~4 (
	.dataa(llnum_q_3),
	.datab(\numerrhold_q[1][3]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~1_combout ),
	.cin(gnd),
	.combout(\numerrhold_q~4_combout ),
	.cout());
defparam \numerrhold_q~4 .lut_mask = 16'hAACC;
defparam \numerrhold_q~4 .sum_lutc_input = "datac";

dffeas \numerrhold_q[2][3] (
	.clk(clk),
	.d(\numerrhold_q~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerrhold_q[2][1]~1_combout ),
	.q(\numerrhold_q[2][3]~q ),
	.prn(vcc));
defparam \numerrhold_q[2][3] .is_wysiwyg = "true";
defparam \numerrhold_q[2][3] .power_up = "low";

cycloneive_lcell_comb \Equal4~0 (
	.dataa(\numroots[1]~q ),
	.datab(\numroots[2]~q ),
	.datac(\numerrhold_q[2][3]~q ),
	.datad(\numroots[3]~q ),
	.cin(gnd),
	.combout(\Equal4~0_combout ),
	.cout());
defparam \Equal4~0 .lut_mask = 16'h6996;
defparam \Equal4~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_gen_d~1 (
	.dataa(\decfail_gen_d~0_combout ),
	.datab(\numerrhold_q[2][4]~q ),
	.datac(\Add5~0_combout ),
	.datad(\Equal4~0_combout ),
	.cin(gnd),
	.combout(\decfail_gen_d~1_combout ),
	.cout());
defparam \decfail_gen_d~1 .lut_mask = 16'hBEFF;
defparam \decfail_gen_d~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_gen_d~2 (
	.dataa(\numerrhold_q[2][1]~q ),
	.datab(\numerrhold_q[2][2]~q ),
	.datac(\numroots[2]~q ),
	.datad(\numroots[1]~q ),
	.cin(gnd),
	.combout(\decfail_gen_d~2_combout ),
	.cout());
defparam \decfail_gen_d~2 .lut_mask = 16'h6996;
defparam \decfail_gen_d~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Equal5~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\numerrhold_q[2][3]~q ),
	.datad(\numroots[3]~q ),
	.cin(gnd),
	.combout(\Equal5~0_combout ),
	.cout());
defparam \Equal5~0 .lut_mask = 16'h0FF0;
defparam \Equal5~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_gen_d~3 (
	.dataa(\decfail_gen_d~2_combout ),
	.datab(\numerrhold_q[2][4]~q ),
	.datac(\numroots[4]~q ),
	.datad(\Equal5~0_combout ),
	.cin(gnd),
	.combout(\decfail_gen_d~3_combout ),
	.cout());
defparam \decfail_gen_d~3 .lut_mask = 16'hBEFF;
defparam \decfail_gen_d~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_lf~1 (
	.dataa(\decfail_lf~0_combout ),
	.datab(polyz),
	.datac(\decfail_gen_d~1_combout ),
	.datad(\decfail_gen_d~3_combout ),
	.cin(gnd),
	.combout(\decfail_lf~1_combout ),
	.cout());
defparam \decfail_lf~1 .lut_mask = 16'h8BFF;
defparam \decfail_lf~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sop_source_gen~0 (
	.dataa(\readadd[5]~q ),
	.datab(\readadd[6]~q ),
	.datac(\readadd[7]~q ),
	.datad(\readadd[8]~q ),
	.cin(gnd),
	.combout(\sop_source_gen~0_combout ),
	.cout());
defparam \sop_source_gen~0 .lut_mask = 16'h7FFF;
defparam \sop_source_gen~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sop_source_gen~1 (
	.dataa(\readadd[1]~q ),
	.datab(\readadd[2]~q ),
	.datac(\readadd[3]~q ),
	.datad(\readadd[4]~q ),
	.cin(gnd),
	.combout(\sop_source_gen~1_combout ),
	.cout());
defparam \sop_source_gen~1 .lut_mask = 16'h7FFF;
defparam \sop_source_gen~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sop_source_gen~2 (
	.dataa(\readadd_ctrl.busy~q ),
	.datab(\sop_source_gen~0_combout ),
	.datac(\sop_source_gen~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\sop_source_gen~2_combout ),
	.cout());
defparam \sop_source_gen~2 .lut_mask = 16'hFEFE;
defparam \sop_source_gen~2 .sum_lutc_input = "datac";

dffeas \sop_source_pipe[1] (
	.clk(clk),
	.d(\sop_source_gen~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\sop_source_pipe[1]~q ),
	.prn(vcc));
defparam \sop_source_pipe[1] .is_wysiwyg = "true";
defparam \sop_source_pipe[1] .power_up = "low";

dffeas \sop_source_pipe[2] (
	.clk(clk),
	.d(\sop_source_pipe[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\sop_source_pipe[2]~q ),
	.prn(vcc));
defparam \sop_source_pipe[2] .is_wysiwyg = "true";
defparam \sop_source_pipe[2] .power_up = "low";

dffeas \sop_source_pipe[3] (
	.clk(clk),
	.d(\sop_source_pipe[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\sop_source_pipe[3]~q ),
	.prn(vcc));
defparam \sop_source_pipe[3] .is_wysiwyg = "true";
defparam \sop_source_pipe[3] .power_up = "low";

cycloneive_lcell_comb pull_numerr_fifo2(
	.dataa(\atl_buffer_state.S0~q ),
	.datab(\sop_source_pipe[3]~q ),
	.datac(gnd),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\pull_numerr_fifo2~combout ),
	.cout());
defparam pull_numerr_fifo2.lut_mask = 16'hEEFF;
defparam pull_numerr_fifo2.sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_numerr~3 (
	.dataa(\chn_end_point_q~q ),
	.datab(gnd),
	.datac(\pull_numerr_fifo2~combout ),
	.datad(\numerr_ctrl_lf2[0]~q ),
	.cin(gnd),
	.combout(\pipe_numerr~3_combout ),
	.cout());
defparam \pipe_numerr~3 .lut_mask = 16'hAFFF;
defparam \pipe_numerr~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl_lf2~2 (
	.dataa(\numerr_ctrl_lf2[1]~q ),
	.datab(gnd),
	.datac(\pipe_numerr~3_combout ),
	.datad(\numerr_ctrl_lf2[3]~q ),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2~2_combout ),
	.cout());
defparam \numerr_ctrl_lf2~2 .lut_mask = 16'hA0AF;
defparam \numerr_ctrl_lf2~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl_lf2[2]~3 (
	.dataa(\numerr_ctrl_lf2[3]~q ),
	.datab(\pull_numerr_fifo2~combout ),
	.datac(\numerr_ctrl_lf2[0]~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2[2]~3_combout ),
	.cout());
defparam \numerr_ctrl_lf2[2]~3 .lut_mask = 16'hBFEF;
defparam \numerr_ctrl_lf2[2]~3 .sum_lutc_input = "datac";

dffeas \numerr_ctrl_lf2[2] (
	.clk(clk),
	.d(\numerr_ctrl_lf2~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_ctrl_lf2[2]~3_combout ),
	.q(\numerr_ctrl_lf2[2]~q ),
	.prn(vcc));
defparam \numerr_ctrl_lf2[2] .is_wysiwyg = "true";
defparam \numerr_ctrl_lf2[2] .power_up = "low";

cycloneive_lcell_comb \numerr_ctrl_lf2~4 (
	.dataa(\pull_numerr_fifo2~combout ),
	.datab(\numerr_ctrl_lf2[2]~q ),
	.datac(\chn_end_point_q~q ),
	.datad(\numerr_ctrl_lf2[3]~q ),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2~4_combout ),
	.cout());
defparam \numerr_ctrl_lf2~4 .lut_mask = 16'hEFFF;
defparam \numerr_ctrl_lf2~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl_lf2~8 (
	.dataa(\chn_end_point_q~q ),
	.datab(\pull_numerr_fifo2~combout ),
	.datac(\numerr_ctrl_lf2[0]~q ),
	.datad(\numerr_ctrl_lf2~4_combout ),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2~8_combout ),
	.cout());
defparam \numerr_ctrl_lf2~8 .lut_mask = 16'hBFFF;
defparam \numerr_ctrl_lf2~8 .sum_lutc_input = "datac";

dffeas \numerr_ctrl_lf2[3] (
	.clk(clk),
	.d(\numerr_ctrl_lf2~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\numerr_ctrl_lf2[3]~q ),
	.prn(vcc));
defparam \numerr_ctrl_lf2[3] .is_wysiwyg = "true";
defparam \numerr_ctrl_lf2[3] .power_up = "low";

cycloneive_lcell_comb \numerr_ctrl_lf2[0]~6 (
	.dataa(\numerr_ctrl_lf2[0]~q ),
	.datab(\chn_end_point_q~q ),
	.datac(\pull_numerr_fifo2~combout ),
	.datad(\numerr_ctrl_lf2[3]~q ),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2[0]~6_combout ),
	.cout());
defparam \numerr_ctrl_lf2[0]~6 .lut_mask = 16'hEFFF;
defparam \numerr_ctrl_lf2[0]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_ctrl_lf2[0]~7 (
	.dataa(\numerr_ctrl_lf2[0]~6_combout ),
	.datab(\numerr_ctrl_lf2[1]~q ),
	.datac(\pipe_numerr~3_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2[0]~7_combout ),
	.cout());
defparam \numerr_ctrl_lf2[0]~7 .lut_mask = 16'hFEFE;
defparam \numerr_ctrl_lf2[0]~7 .sum_lutc_input = "datac";

dffeas \numerr_ctrl_lf2[0] (
	.clk(clk),
	.d(\numerr_ctrl_lf2[0]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\numerr_ctrl_lf2[0]~q ),
	.prn(vcc));
defparam \numerr_ctrl_lf2[0] .is_wysiwyg = "true";
defparam \numerr_ctrl_lf2[0] .power_up = "low";

cycloneive_lcell_comb \numerr_ctrl_lf2~5 (
	.dataa(\numerr_ctrl_lf2[0]~q ),
	.datab(\chn_end_point_q~q ),
	.datac(\numerr_ctrl_lf2[2]~q ),
	.datad(\pull_numerr_fifo2~combout ),
	.cin(gnd),
	.combout(\numerr_ctrl_lf2~5_combout ),
	.cout());
defparam \numerr_ctrl_lf2~5 .lut_mask = 16'hFEFF;
defparam \numerr_ctrl_lf2~5 .sum_lutc_input = "datac";

dffeas \numerr_ctrl_lf2[1] (
	.clk(clk),
	.d(\numerr_ctrl_lf2~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_ctrl_lf2[2]~3_combout ),
	.q(\numerr_ctrl_lf2[1]~q ),
	.prn(vcc));
defparam \numerr_ctrl_lf2[1] .is_wysiwyg = "true";
defparam \numerr_ctrl_lf2[1] .power_up = "low";

cycloneive_lcell_comb \decfail_lf~5 (
	.dataa(\pull_numerr_fifo2~combout ),
	.datab(\numerr_ctrl_lf2[1]~q ),
	.datac(\numerr_ctrl_lf2[0]~q ),
	.datad(\decfail_lf~1_combout ),
	.cin(gnd),
	.combout(\decfail_lf~5_combout ),
	.cout());
defparam \decfail_lf~5 .lut_mask = 16'hFFD8;
defparam \decfail_lf~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \pipe_numerr~6 (
	.dataa(\chn_end_point_q~q ),
	.datab(\numerr_ctrl_lf2[0]~q ),
	.datac(\numerr_ctrl_lf2[1]~q ),
	.datad(\pull_numerr_fifo2~combout ),
	.cin(gnd),
	.combout(\pipe_numerr~6_combout ),
	.cout());
defparam \pipe_numerr~6 .lut_mask = 16'hFAFC;
defparam \pipe_numerr~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_lf[1][1]~9 (
	.dataa(\numerr_ctrl_lf2[2]~q ),
	.datab(gnd),
	.datac(\pull_numerr_fifo2~combout ),
	.datad(\pipe_numerr~6_combout ),
	.cin(gnd),
	.combout(\numerr_lf[1][1]~9_combout ),
	.cout());
defparam \numerr_lf[1][1]~9 .lut_mask = 16'hFFF5;
defparam \numerr_lf[1][1]~9 .sum_lutc_input = "datac";

dffeas \decfail_lf[1] (
	.clk(clk),
	.d(\decfail_lf~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[1][1]~9_combout ),
	.q(\decfail_lf[1]~q ),
	.prn(vcc));
defparam \decfail_lf[1] .is_wysiwyg = "true";
defparam \decfail_lf[1] .power_up = "low";

cycloneive_lcell_comb \pipe_numerr~2 (
	.dataa(\chn_end_point_q~q ),
	.datab(\numerr_ctrl_lf2[1]~q ),
	.datac(\numerr_ctrl_lf2[2]~q ),
	.datad(\pull_numerr_fifo2~combout ),
	.cin(gnd),
	.combout(\pipe_numerr~2_combout ),
	.cout());
defparam \pipe_numerr~2 .lut_mask = 16'hFAFC;
defparam \pipe_numerr~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_lf~3 (
	.dataa(\decfail_lf~1_combout ),
	.datab(\decfail_lf[1]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~2_combout ),
	.cin(gnd),
	.combout(\decfail_lf~3_combout ),
	.cout());
defparam \decfail_lf~3 .lut_mask = 16'hAACC;
defparam \decfail_lf~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_lf[2]~4 (
	.dataa(\numerr_ctrl_lf2[2]~q ),
	.datab(\pull_numerr_fifo2~combout ),
	.datac(\numerr_ctrl_lf2[1]~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\decfail_lf[2]~4_combout ),
	.cout());
defparam \decfail_lf[2]~4 .lut_mask = 16'hFFF6;
defparam \decfail_lf[2]~4 .sum_lutc_input = "datac";

dffeas \decfail_lf[2] (
	.clk(clk),
	.d(\decfail_lf~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\decfail_lf[2]~4_combout ),
	.q(\decfail_lf[2]~q ),
	.prn(vcc));
defparam \decfail_lf[2] .is_wysiwyg = "true";
defparam \decfail_lf[2] .power_up = "low";

cycloneive_lcell_comb \pipe_numerr~0 (
	.dataa(\chn_end_point_q~q ),
	.datab(\numerr_ctrl_lf2[2]~q ),
	.datac(\pull_numerr_fifo2~combout ),
	.datad(\numerr_ctrl_lf2[3]~q ),
	.cin(gnd),
	.combout(\pipe_numerr~0_combout ),
	.cout());
defparam \pipe_numerr~0 .lut_mask = 16'hACFF;
defparam \pipe_numerr~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_lf~2 (
	.dataa(\decfail_lf~1_combout ),
	.datab(\decfail_lf[2]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~0_combout ),
	.cin(gnd),
	.combout(\decfail_lf~2_combout ),
	.cout());
defparam \decfail_lf~2 .lut_mask = 16'hAACC;
defparam \decfail_lf~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_lf[3][1]~0 (
	.dataa(\numerr_ctrl_lf2[2]~q ),
	.datab(\numerr_ctrl_lf2[3]~q ),
	.datac(\chn_end_point_q~q ),
	.datad(\pull_numerr_fifo2~combout ),
	.cin(gnd),
	.combout(\numerr_lf[3][1]~0_combout ),
	.cout());
defparam \numerr_lf[3][1]~0 .lut_mask = 16'hFFF7;
defparam \numerr_lf[3][1]~0 .sum_lutc_input = "datac";

dffeas \decfail_lf[3] (
	.clk(clk),
	.d(\decfail_lf~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[3][1]~0_combout ),
	.q(\decfail_lf[3]~q ),
	.prn(vcc));
defparam \decfail_lf[3] .is_wysiwyg = "true";
defparam \decfail_lf[3] .power_up = "low";

cycloneive_lcell_comb \eop_gen_pipe_ena_2~1 (
	.dataa(\eop_gen_pipe_ena_2[1]~q ),
	.datab(\atl_buffer_state.out_hold~q ),
	.datac(\rd_ge_block_size_q~q ),
	.datad(\atl_buffer_state.S0~q ),
	.cin(gnd),
	.combout(\eop_gen_pipe_ena_2~1_combout ),
	.cout());
defparam \eop_gen_pipe_ena_2~1 .lut_mask = 16'hF9F6;
defparam \eop_gen_pipe_ena_2~1 .sum_lutc_input = "datac";

dffeas \eop_gen_pipe_ena_2[1] (
	.clk(clk),
	.d(\eop_gen_pipe_ena_2~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\eop_gen_pipe_ena_2[1]~q ),
	.prn(vcc));
defparam \eop_gen_pipe_ena_2[1] .is_wysiwyg = "true";
defparam \eop_gen_pipe_ena_2[1] .power_up = "low";

cycloneive_lcell_comb \eop_gen_pipe_ena_2~0 (
	.dataa(\eop_gen_pipe_ena_2[2]~q ),
	.datab(\atl_buffer_state.out_hold~q ),
	.datac(\eop_gen_pipe_ena_2[1]~q ),
	.datad(\atl_buffer_state.S0~q ),
	.cin(gnd),
	.combout(\eop_gen_pipe_ena_2~0_combout ),
	.cout());
defparam \eop_gen_pipe_ena_2~0 .lut_mask = 16'hF9F6;
defparam \eop_gen_pipe_ena_2~0 .sum_lutc_input = "datac";

dffeas \eop_gen_pipe_ena_2[2] (
	.clk(clk),
	.d(\eop_gen_pipe_ena_2~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\eop_gen_pipe_ena_2[2]~q ),
	.prn(vcc));
defparam \eop_gen_pipe_ena_2[2] .is_wysiwyg = "true";
defparam \eop_gen_pipe_ena_2[2] .power_up = "low";

cycloneive_lcell_comb \clocking_decfail~0 (
	.dataa(\atl_buffer_state.S0~q ),
	.datab(\sop_source_pipe[1]~q ),
	.datac(\eop_gen_pipe_ena_2[2]~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\clocking_decfail~0_combout ),
	.cout());
defparam \clocking_decfail~0 .lut_mask = 16'hFEFF;
defparam \clocking_decfail~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \decfail_1q~0 (
	.dataa(\decfail_lf[3]~q ),
	.datab(\decfail_1q~q ),
	.datac(gnd),
	.datad(\clocking_decfail~0_combout ),
	.cin(gnd),
	.combout(\decfail_1q~0_combout ),
	.cout());
defparam \decfail_1q~0 .lut_mask = 16'hAACC;
defparam \decfail_1q~0 .sum_lutc_input = "datac";

dffeas decfail_1q(
	.clk(clk),
	.d(\decfail_1q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\decfail_1q~q ),
	.prn(vcc));
defparam decfail_1q.is_wysiwyg = "true";
defparam decfail_1q.power_up = "low";

cycloneive_lcell_comb \dat_source_int_d[1]~0 (
	.dataa(\data_2_correct[1]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[0] ),
	.cin(gnd),
	.combout(\dat_source_int_d[1]~0_combout ),
	.cout());
defparam \dat_source_int_d[1]~0 .lut_mask = 16'h6996;
defparam \dat_source_int_d[1]~0 .sum_lutc_input = "datac";

dffeas \align1_bis[1] (
	.clk(clk),
	.d(\dat_source_int_d[1]~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[1]~q ),
	.prn(vcc));
defparam \align1_bis[1] .is_wysiwyg = "true";
defparam \align1_bis[1] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~0 (
	.dataa(\rsout_shunt[1]~q ),
	.datab(\align1_bis[1]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~0_combout ),
	.cout());
defparam \rsoutff_d~0 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~0 .sum_lutc_input = "datac";

dffeas \rsout_shunt[2] (
	.clk(clk),
	.d(\rsoutff_d~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[2]~q ),
	.prn(vcc));
defparam \rsout_shunt[2] .is_wysiwyg = "true";
defparam \rsout_shunt[2] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[2] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[1] ),
	.datad(\RAM_DP_12|auto_generated|q_b[1] ),
	.cin(gnd),
	.combout(\data_2_correct[2]~combout ),
	.cout());
defparam \data_2_correct[2] .lut_mask = 16'hFFFE;
defparam \data_2_correct[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[2]~1 (
	.dataa(\data_2_correct[2]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[1] ),
	.cin(gnd),
	.combout(\dat_source_int_d[2]~1_combout ),
	.cout());
defparam \dat_source_int_d[2]~1 .lut_mask = 16'h6996;
defparam \dat_source_int_d[2]~1 .sum_lutc_input = "datac";

dffeas \align1_bis[2] (
	.clk(clk),
	.d(\dat_source_int_d[2]~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[2]~q ),
	.prn(vcc));
defparam \align1_bis[2] .is_wysiwyg = "true";
defparam \align1_bis[2] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~1 (
	.dataa(\rsout_shunt[2]~q ),
	.datab(\align1_bis[2]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~1_combout ),
	.cout());
defparam \rsoutff_d~1 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~1 .sum_lutc_input = "datac";

dffeas \rsout_shunt[3] (
	.clk(clk),
	.d(\rsoutff_d~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[3]~q ),
	.prn(vcc));
defparam \rsout_shunt[3] .is_wysiwyg = "true";
defparam \rsout_shunt[3] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[3] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[2] ),
	.datad(\RAM_DP_12|auto_generated|q_b[2] ),
	.cin(gnd),
	.combout(\data_2_correct[3]~combout ),
	.cout());
defparam \data_2_correct[3] .lut_mask = 16'hFFFE;
defparam \data_2_correct[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[3]~2 (
	.dataa(\data_2_correct[3]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[2] ),
	.cin(gnd),
	.combout(\dat_source_int_d[3]~2_combout ),
	.cout());
defparam \dat_source_int_d[3]~2 .lut_mask = 16'h6996;
defparam \dat_source_int_d[3]~2 .sum_lutc_input = "datac";

dffeas \align1_bis[3] (
	.clk(clk),
	.d(\dat_source_int_d[3]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[3]~q ),
	.prn(vcc));
defparam \align1_bis[3] .is_wysiwyg = "true";
defparam \align1_bis[3] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~2 (
	.dataa(\rsout_shunt[3]~q ),
	.datab(\align1_bis[3]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~2_combout ),
	.cout());
defparam \rsoutff_d~2 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~2 .sum_lutc_input = "datac";

dffeas \rsout_shunt[4] (
	.clk(clk),
	.d(\rsoutff_d~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[4]~q ),
	.prn(vcc));
defparam \rsout_shunt[4] .is_wysiwyg = "true";
defparam \rsout_shunt[4] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[4] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[3] ),
	.datad(\RAM_DP_12|auto_generated|q_b[3] ),
	.cin(gnd),
	.combout(\data_2_correct[4]~combout ),
	.cout());
defparam \data_2_correct[4] .lut_mask = 16'hFFFE;
defparam \data_2_correct[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[4]~3 (
	.dataa(\data_2_correct[4]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[3] ),
	.cin(gnd),
	.combout(\dat_source_int_d[4]~3_combout ),
	.cout());
defparam \dat_source_int_d[4]~3 .lut_mask = 16'h6996;
defparam \dat_source_int_d[4]~3 .sum_lutc_input = "datac";

dffeas \align1_bis[4] (
	.clk(clk),
	.d(\dat_source_int_d[4]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[4]~q ),
	.prn(vcc));
defparam \align1_bis[4] .is_wysiwyg = "true";
defparam \align1_bis[4] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~3 (
	.dataa(\rsout_shunt[4]~q ),
	.datab(\align1_bis[4]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~3_combout ),
	.cout());
defparam \rsoutff_d~3 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~3 .sum_lutc_input = "datac";

dffeas \rsout_shunt[5] (
	.clk(clk),
	.d(\rsoutff_d~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[5]~q ),
	.prn(vcc));
defparam \rsout_shunt[5] .is_wysiwyg = "true";
defparam \rsout_shunt[5] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[5] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[4] ),
	.datad(\RAM_DP_12|auto_generated|q_b[4] ),
	.cin(gnd),
	.combout(\data_2_correct[5]~combout ),
	.cout());
defparam \data_2_correct[5] .lut_mask = 16'hFFFE;
defparam \data_2_correct[5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[5]~4 (
	.dataa(\data_2_correct[5]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[4] ),
	.cin(gnd),
	.combout(\dat_source_int_d[5]~4_combout ),
	.cout());
defparam \dat_source_int_d[5]~4 .lut_mask = 16'h6996;
defparam \dat_source_int_d[5]~4 .sum_lutc_input = "datac";

dffeas \align1_bis[5] (
	.clk(clk),
	.d(\dat_source_int_d[5]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[5]~q ),
	.prn(vcc));
defparam \align1_bis[5] .is_wysiwyg = "true";
defparam \align1_bis[5] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~4 (
	.dataa(\rsout_shunt[5]~q ),
	.datab(\align1_bis[5]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~4_combout ),
	.cout());
defparam \rsoutff_d~4 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~4 .sum_lutc_input = "datac";

dffeas \rsout_shunt[6] (
	.clk(clk),
	.d(\rsoutff_d~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[6]~q ),
	.prn(vcc));
defparam \rsout_shunt[6] .is_wysiwyg = "true";
defparam \rsout_shunt[6] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[6] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[5] ),
	.datad(\RAM_DP_12|auto_generated|q_b[5] ),
	.cin(gnd),
	.combout(\data_2_correct[6]~combout ),
	.cout());
defparam \data_2_correct[6] .lut_mask = 16'hFFFE;
defparam \data_2_correct[6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[6]~5 (
	.dataa(\data_2_correct[6]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[5] ),
	.cin(gnd),
	.combout(\dat_source_int_d[6]~5_combout ),
	.cout());
defparam \dat_source_int_d[6]~5 .lut_mask = 16'h6996;
defparam \dat_source_int_d[6]~5 .sum_lutc_input = "datac";

dffeas \align1_bis[6] (
	.clk(clk),
	.d(\dat_source_int_d[6]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[6]~q ),
	.prn(vcc));
defparam \align1_bis[6] .is_wysiwyg = "true";
defparam \align1_bis[6] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~5 (
	.dataa(\rsout_shunt[6]~q ),
	.datab(\align1_bis[6]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~5_combout ),
	.cout());
defparam \rsoutff_d~5 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~5 .sum_lutc_input = "datac";

dffeas \rsout_shunt[7] (
	.clk(clk),
	.d(\rsoutff_d~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[7]~q ),
	.prn(vcc));
defparam \rsout_shunt[7] .is_wysiwyg = "true";
defparam \rsout_shunt[7] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[7] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[6] ),
	.datad(\RAM_DP_12|auto_generated|q_b[6] ),
	.cin(gnd),
	.combout(\data_2_correct[7]~combout ),
	.cout());
defparam \data_2_correct[7] .lut_mask = 16'hFFFE;
defparam \data_2_correct[7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[7]~6 (
	.dataa(\data_2_correct[7]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[6] ),
	.cin(gnd),
	.combout(\dat_source_int_d[7]~6_combout ),
	.cout());
defparam \dat_source_int_d[7]~6 .lut_mask = 16'h6996;
defparam \dat_source_int_d[7]~6 .sum_lutc_input = "datac";

dffeas \align1_bis[7] (
	.clk(clk),
	.d(\dat_source_int_d[7]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[7]~q ),
	.prn(vcc));
defparam \align1_bis[7] .is_wysiwyg = "true";
defparam \align1_bis[7] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~6 (
	.dataa(\rsout_shunt[7]~q ),
	.datab(\align1_bis[7]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~6_combout ),
	.cout());
defparam \rsoutff_d~6 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~6 .sum_lutc_input = "datac";

dffeas \rsout_shunt[8] (
	.clk(clk),
	.d(\rsoutff_d~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rsout_shunt[8]~q ),
	.prn(vcc));
defparam \rsout_shunt[8] .is_wysiwyg = "true";
defparam \rsout_shunt[8] .power_up = "low";

cycloneive_lcell_comb \data_2_correct[8] (
	.dataa(\data_2_correct~0_combout ),
	.datab(\data_2_correct~1_combout ),
	.datac(\RAM_DP_34|auto_generated|q_b[7] ),
	.datad(\RAM_DP_12|auto_generated|q_b[7] ),
	.cin(gnd),
	.combout(\data_2_correct[8]~combout ),
	.cout());
defparam \data_2_correct[8] .lut_mask = 16'hFFFE;
defparam \data_2_correct[8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \dat_source_int_d[8]~7 (
	.dataa(\data_2_correct[8]~combout ),
	.datab(bypass_q),
	.datac(\decfail_1q~q ),
	.datad(\RAM_DP_err_value|auto_generated|q_b[7] ),
	.cin(gnd),
	.combout(\dat_source_int_d[8]~7_combout ),
	.cout());
defparam \dat_source_int_d[8]~7 .lut_mask = 16'h6996;
defparam \dat_source_int_d[8]~7 .sum_lutc_input = "datac";

dffeas \align1_bis[8] (
	.clk(clk),
	.d(\dat_source_int_d[8]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_bis[8]~q ),
	.prn(vcc));
defparam \align1_bis[8] .is_wysiwyg = "true";
defparam \align1_bis[8] .power_up = "low";

cycloneive_lcell_comb \rsoutff_d~7 (
	.dataa(\rsout_shunt[8]~q ),
	.datab(\align1_bis[8]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rsoutff_d~7_combout ),
	.cout());
defparam \rsoutff_d~7 .lut_mask = 16'hEFFE;
defparam \rsoutff_d~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector18~0 (
	.dataa(sink_eop_q),
	.datab(stateS98),
	.datac(bms_statusidle),
	.datad(\bms_status.busy~q ),
	.cin(gnd),
	.combout(\Selector18~0_combout ),
	.cout());
defparam \Selector18~0 .lut_mask = 16'h6996;
defparam \Selector18~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector18~1 (
	.dataa(\Selector18~0_combout ),
	.datab(load_syn_gen),
	.datac(gnd),
	.datad(bms_statusidle),
	.cin(gnd),
	.combout(\Selector18~1_combout ),
	.cout());
defparam \Selector18~1 .lut_mask = 16'hEEFF;
defparam \Selector18~1 .sum_lutc_input = "datac";

dffeas \bms_status.busy (
	.clk(clk),
	.d(\Selector18~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\bms_status.busy~q ),
	.prn(vcc));
defparam \bms_status.busy .is_wysiwyg = "true";
defparam \bms_status.busy .power_up = "low";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~5 (
	.dataa(\bms_status.busy~q ),
	.datab(stateS98),
	.datac(\chn_status.busy~q ),
	.datad(chn_statusbooked),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~5_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~5 .lut_mask = 16'hFFFE;
defparam \syn_bms_chn_synch_FSM~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~6 (
	.dataa(chn_statusbooked),
	.datab(stateS98),
	.datac(gnd),
	.datad(bms_statusidle),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~6_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~6 .lut_mask = 16'hEEFF;
defparam \syn_bms_chn_synch_FSM~6 .sum_lutc_input = "datac";

dffeas sink_eop_c(
	.clk(clk),
	.d(sink_eop),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_eop_c~q ),
	.prn(vcc));
defparam sink_eop_c.is_wysiwyg = "true";
defparam sink_eop_c.power_up = "low";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~7 (
	.dataa(sink_eop),
	.datab(gnd),
	.datac(\sink_eop_c~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~7_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~7 .lut_mask = 16'hAFFF;
defparam \syn_bms_chn_synch_FSM~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~8 (
	.dataa(\lf_status_swap[5]~q ),
	.datab(sink_eop),
	.datac(gnd),
	.datad(\sink_eop_c~q ),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~8_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~8 .lut_mask = 16'hEEFF;
defparam \syn_bms_chn_synch_FSM~8 .sum_lutc_input = "datac";

cycloneive_lcell_comb \next_syn_bms_chn_synch_ctrl~0 (
	.dataa(\syn_bms_chn_synch_FSM~5_combout ),
	.datab(\syn_bms_chn_synch_FSM~6_combout ),
	.datac(\syn_bms_chn_synch_FSM~7_combout ),
	.datad(\syn_bms_chn_synch_FSM~8_combout ),
	.cin(gnd),
	.combout(\next_syn_bms_chn_synch_ctrl~0_combout ),
	.cout());
defparam \next_syn_bms_chn_synch_ctrl~0 .lut_mask = 16'h7FFF;
defparam \next_syn_bms_chn_synch_ctrl~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~9 (
	.dataa(sink_eop),
	.datab(\bms_status.busy~q ),
	.datac(\sink_eop_c~q ),
	.datad(stateS98),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~9_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~9 .lut_mask = 16'hEFFF;
defparam \syn_bms_chn_synch_FSM~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~10 (
	.dataa(\syn_bms_chn_synch_FSM~9_combout ),
	.datab(\chn_end_point_q~q ),
	.datac(gnd),
	.datad(\chn_status.idle~q ),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~10_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~10 .lut_mask = 16'hEEFF;
defparam \syn_bms_chn_synch_FSM~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~11 (
	.dataa(\syn_bms_chn_synch_FSM~9_combout ),
	.datab(\chn_status.busy~q ),
	.datac(chn_statusbooked),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~11_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~11 .lut_mask = 16'hFEFF;
defparam \syn_bms_chn_synch_FSM~11 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector0~0 (
	.dataa(\next_syn_bms_chn_synch_ctrl~0_combout ),
	.datab(\syn_bms_chn_synch_FSM~10_combout ),
	.datac(\syn_bms_chn_synch_FSM~11_combout ),
	.datad(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.cin(gnd),
	.combout(\Selector0~0_combout ),
	.cout());
defparam \Selector0~0 .lut_mask = 16'hBFFF;
defparam \Selector0~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector3~0 (
	.dataa(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.datab(gnd),
	.datac(stateS98),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\Selector3~0_combout ),
	.cout());
defparam \Selector3~0 .lut_mask = 16'hAFFF;
defparam \Selector3~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_bms_chn_synch_FSM~12 (
	.dataa(\syn_bms_chn_synch_FSM~7_combout ),
	.datab(\syn_bms_chn_synch_FSM~5_combout ),
	.datac(\syn_bms_chn_synch_FSM~6_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\syn_bms_chn_synch_FSM~12_combout ),
	.cout());
defparam \syn_bms_chn_synch_FSM~12 .lut_mask = 16'hFEFE;
defparam \syn_bms_chn_synch_FSM~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector3~1 (
	.dataa(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.datab(gnd),
	.datac(\syn_bms_chn_synch_FSM~12_combout ),
	.datad(\syn_bms_chn_synch_FSM~10_combout ),
	.cin(gnd),
	.combout(\Selector3~1_combout ),
	.cout());
defparam \Selector3~1 .lut_mask = 16'hAFFF;
defparam \Selector3~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector3~2 (
	.dataa(\Selector3~0_combout ),
	.datab(\syn_bms_chn_synch_FSM~11_combout ),
	.datac(\Selector3~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector3~2_combout ),
	.cout());
defparam \Selector3~2 .lut_mask = 16'hFEFE;
defparam \Selector3~2 .sum_lutc_input = "datac";

dffeas \syn_bms_chn_synch_ctrl.bms_chn_block (
	.clk(clk),
	.d(\Selector3~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.prn(vcc));
defparam \syn_bms_chn_synch_ctrl.bms_chn_block .is_wysiwyg = "true";
defparam \syn_bms_chn_synch_ctrl.bms_chn_block .power_up = "low";

cycloneive_lcell_comb \Selector2~0 (
	.dataa(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datab(stateS98),
	.datac(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\Selector2~0_combout ),
	.cout());
defparam \Selector2~0 .lut_mask = 16'hFEFF;
defparam \Selector2~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector2~1 (
	.dataa(\Selector2~0_combout ),
	.datab(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.datac(\syn_bms_chn_synch_FSM~12_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector2~1_combout ),
	.cout());
defparam \Selector2~1 .lut_mask = 16'hFEFE;
defparam \Selector2~1 .sum_lutc_input = "datac";

dffeas \syn_bms_chn_synch_ctrl.chn_block (
	.clk(clk),
	.d(\Selector2~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.prn(vcc));
defparam \syn_bms_chn_synch_ctrl.chn_block .is_wysiwyg = "true";
defparam \syn_bms_chn_synch_ctrl.chn_block .power_up = "low";

cycloneive_lcell_comb \Selector0~1 (
	.dataa(\chn_end_point_q~q ),
	.datab(stateS98),
	.datac(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datad(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.cin(gnd),
	.combout(\Selector0~1_combout ),
	.cout());
defparam \Selector0~1 .lut_mask = 16'hEFFF;
defparam \Selector0~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector5~0 (
	.dataa(\syn_bms_chn_synch_FSM~8_combout ),
	.datab(\Selector3~1_combout ),
	.datac(\syn_bms_chn_synch_FSM~11_combout ),
	.datad(\Selector0~2_combout ),
	.cin(gnd),
	.combout(\Selector5~0_combout ),
	.cout());
defparam \Selector5~0 .lut_mask = 16'hEFFF;
defparam \Selector5~0 .sum_lutc_input = "datac";

dffeas \syn_bms_chn_synch_ctrl.fifo_block2 (
	.clk(clk),
	.d(\Selector5~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_bms_chn_synch_ctrl.fifo_block2~q ),
	.prn(vcc));
defparam \syn_bms_chn_synch_ctrl.fifo_block2 .is_wysiwyg = "true";
defparam \syn_bms_chn_synch_ctrl.fifo_block2 .power_up = "low";

cycloneive_lcell_comb \Selector0~2 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\lf_status_swap[5]~q ),
	.datad(\syn_bms_chn_synch_ctrl.fifo_block2~q ),
	.cin(gnd),
	.combout(\Selector0~2_combout ),
	.cout());
defparam \Selector0~2 .lut_mask = 16'h0FFF;
defparam \Selector0~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector1~0 (
	.dataa(\syn_bms_chn_synch_ctrl.bms_block~q ),
	.datab(\chn_end_point_q~q ),
	.datac(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.datad(stateS98),
	.cin(gnd),
	.combout(\Selector1~0_combout ),
	.cout());
defparam \Selector1~0 .lut_mask = 16'hFEFF;
defparam \Selector1~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector1~1 (
	.dataa(\Selector1~0_combout ),
	.datab(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.datac(\syn_bms_chn_synch_FSM~10_combout ),
	.datad(\syn_bms_chn_synch_FSM~12_combout ),
	.cin(gnd),
	.combout(\Selector1~1_combout ),
	.cout());
defparam \Selector1~1 .lut_mask = 16'hFEFF;
defparam \Selector1~1 .sum_lutc_input = "datac";

dffeas \syn_bms_chn_synch_ctrl.bms_block (
	.clk(clk),
	.d(\Selector1~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_bms_chn_synch_ctrl.bms_block~q ),
	.prn(vcc));
defparam \syn_bms_chn_synch_ctrl.bms_block .is_wysiwyg = "true";
defparam \syn_bms_chn_synch_ctrl.bms_block .power_up = "low";

cycloneive_lcell_comb \Selector4~0 (
	.dataa(\wr_ptr_ctrl[1]~q ),
	.datab(\syn_bms_chn_synch_ctrl.fifo_block~q ),
	.datac(stateS98),
	.datad(\syn_bms_chn_synch_ctrl.bms_block~q ),
	.cin(gnd),
	.combout(\Selector4~0_combout ),
	.cout());
defparam \Selector4~0 .lut_mask = 16'hFFFE;
defparam \Selector4~0 .sum_lutc_input = "datac";

dffeas \syn_bms_chn_synch_ctrl.fifo_block (
	.clk(clk),
	.d(\Selector4~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_bms_chn_synch_ctrl.fifo_block~q ),
	.prn(vcc));
defparam \syn_bms_chn_synch_ctrl.fifo_block .is_wysiwyg = "true";
defparam \syn_bms_chn_synch_ctrl.fifo_block .power_up = "low";

cycloneive_lcell_comb \Selector0~3 (
	.dataa(stateS98),
	.datab(\syn_bms_chn_synch_ctrl.fifo_block~q ),
	.datac(\syn_bms_chn_synch_ctrl.bms_block~q ),
	.datad(\wr_ptr_ctrl[1]~q ),
	.cin(gnd),
	.combout(\Selector0~3_combout ),
	.cout());
defparam \Selector0~3 .lut_mask = 16'hBFFF;
defparam \Selector0~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector0~4 (
	.dataa(\Selector0~0_combout ),
	.datab(\Selector0~1_combout ),
	.datac(\Selector0~2_combout ),
	.datad(\Selector0~3_combout ),
	.cin(gnd),
	.combout(\Selector0~4_combout ),
	.cout());
defparam \Selector0~4 .lut_mask = 16'hFFFE;
defparam \Selector0~4 .sum_lutc_input = "datac";

dffeas \syn_bms_chn_synch_ctrl.allow_ena (
	.clk(clk),
	.d(\Selector0~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_bms_chn_synch_ctrl.allow_ena~q ),
	.prn(vcc));
defparam \syn_bms_chn_synch_ctrl.allow_ena .is_wysiwyg = "true";
defparam \syn_bms_chn_synch_ctrl.allow_ena .power_up = "low";

cycloneive_lcell_comb \cwsize_logic_fifo~1 (
	.dataa(sink_eop_q),
	.datab(gnd),
	.datac(\lf_status_ram_ctrl[5]~q ),
	.datad(\eop_source_gen~0_combout ),
	.cin(gnd),
	.combout(\cwsize_logic_fifo~1_combout ),
	.cout());
defparam \cwsize_logic_fifo~1 .lut_mask = 16'hAFFF;
defparam \cwsize_logic_fifo~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_ram_ctrl~4 (
	.dataa(\lf_status_ram_ctrl[2]~q ),
	.datab(\lf_status_ram_ctrl[4]~q ),
	.datac(gnd),
	.datad(\cwsize_logic_fifo~1_combout ),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl~4_combout ),
	.cout());
defparam \lf_status_ram_ctrl~4 .lut_mask = 16'hAACC;
defparam \lf_status_ram_ctrl~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_ram_ctrl[2]~1 (
	.dataa(\lf_status_ram_ctrl[1]~q ),
	.datab(\eop_source_gen~0_combout ),
	.datac(\lf_status_ram_ctrl[5]~q ),
	.datad(sink_eop_q),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl[2]~1_combout ),
	.cout());
defparam \lf_status_ram_ctrl[2]~1 .lut_mask = 16'hBFEF;
defparam \lf_status_ram_ctrl[2]~1 .sum_lutc_input = "datac";

dffeas \lf_status_ram_ctrl[3] (
	.clk(clk),
	.d(\lf_status_ram_ctrl~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_ram_ctrl[2]~1_combout ),
	.q(\lf_status_ram_ctrl[3]~q ),
	.prn(vcc));
defparam \lf_status_ram_ctrl[3] .is_wysiwyg = "true";
defparam \lf_status_ram_ctrl[3] .power_up = "low";

cycloneive_lcell_comb \lf_status_ram_ctrl~6 (
	.dataa(\lf_status_ram_ctrl[3]~q ),
	.datab(gnd),
	.datac(\cwsize_logic_fifo~1_combout ),
	.datad(\lf_status_ram_ctrl[1]~q ),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl~6_combout ),
	.cout());
defparam \lf_status_ram_ctrl~6 .lut_mask = 16'hA0AF;
defparam \lf_status_ram_ctrl~6 .sum_lutc_input = "datac";

dffeas \lf_status_ram_ctrl[2] (
	.clk(clk),
	.d(\lf_status_ram_ctrl~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_ram_ctrl[2]~1_combout ),
	.q(\lf_status_ram_ctrl[2]~q ),
	.prn(vcc));
defparam \lf_status_ram_ctrl[2] .is_wysiwyg = "true";
defparam \lf_status_ram_ctrl[2] .power_up = "low";

cycloneive_lcell_comb \lf_status_ram_ctrl~5 (
	.dataa(\lf_status_ram_ctrl[2]~q ),
	.datab(\lf_status_ram_ctrl[5]~q ),
	.datac(\eop_source_gen~0_combout ),
	.datad(sink_eop_q),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl~5_combout ),
	.cout());
defparam \lf_status_ram_ctrl~5 .lut_mask = 16'hFF7F;
defparam \lf_status_ram_ctrl~5 .sum_lutc_input = "datac";

dffeas \lf_status_ram_ctrl[1] (
	.clk(clk),
	.d(\lf_status_ram_ctrl~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_ram_ctrl[2]~1_combout ),
	.q(\lf_status_ram_ctrl[1]~q ),
	.prn(vcc));
defparam \lf_status_ram_ctrl[1] .is_wysiwyg = "true";
defparam \lf_status_ram_ctrl[1] .power_up = "low";

cycloneive_lcell_comb \lf_status_ram_ctrl[5]~2 (
	.dataa(\lf_status_ram_ctrl[5]~q ),
	.datab(sink_eop_q),
	.datac(\eop_source_gen~0_combout ),
	.datad(\lf_status_ram_ctrl[1]~q ),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl[5]~2_combout ),
	.cout());
defparam \lf_status_ram_ctrl[5]~2 .lut_mask = 16'hEFFF;
defparam \lf_status_ram_ctrl[5]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \lf_status_ram_ctrl[5]~3 (
	.dataa(\lf_status_ram_ctrl[5]~2_combout ),
	.datab(\lf_status_ram_ctrl[4]~q ),
	.datac(\cwsize_logic_fifo~1_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl[5]~3_combout ),
	.cout());
defparam \lf_status_ram_ctrl[5]~3 .lut_mask = 16'hFEFE;
defparam \lf_status_ram_ctrl[5]~3 .sum_lutc_input = "datac";

dffeas \lf_status_ram_ctrl[5] (
	.clk(clk),
	.d(\lf_status_ram_ctrl[5]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_ram_ctrl[5]~q ),
	.prn(vcc));
defparam \lf_status_ram_ctrl[5] .is_wysiwyg = "true";
defparam \lf_status_ram_ctrl[5] .power_up = "low";

cycloneive_lcell_comb \lf_status_ram_ctrl~0 (
	.dataa(\lf_status_ram_ctrl[5]~q ),
	.datab(sink_eop_q),
	.datac(\lf_status_ram_ctrl[3]~q ),
	.datad(\eop_source_gen~0_combout ),
	.cin(gnd),
	.combout(\lf_status_ram_ctrl~0_combout ),
	.cout());
defparam \lf_status_ram_ctrl~0 .lut_mask = 16'hFEFF;
defparam \lf_status_ram_ctrl~0 .sum_lutc_input = "datac";

dffeas \lf_status_ram_ctrl[4] (
	.clk(clk),
	.d(\lf_status_ram_ctrl~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_ram_ctrl[2]~1_combout ),
	.q(\lf_status_ram_ctrl[4]~q ),
	.prn(vcc));
defparam \lf_status_ram_ctrl[4] .is_wysiwyg = "true";
defparam \lf_status_ram_ctrl[4] .power_up = "low";

cycloneive_lcell_comb \sink_ena_master~0 (
	.dataa(sink_eop_q),
	.datab(\lf_status_ram_ctrl[4]~q ),
	.datac(\lf_status_cwsize[5]~q ),
	.datad(\lf_status_ram_ctrl[5]~q ),
	.cin(gnd),
	.combout(\sink_ena_master~0_combout ),
	.cout());
defparam \sink_ena_master~0 .lut_mask = 16'h7FFF;
defparam \sink_ena_master~0 .sum_lutc_input = "datac";

dffeas data_val_shunt(
	.clk(clk),
	.d(\data_val_shunt~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\data_val_shunt~q ),
	.prn(vcc));
defparam data_val_shunt.is_wysiwyg = "true";
defparam data_val_shunt.power_up = "low";

cycloneive_lcell_comb \data_val_shunt~0 (
	.dataa(\data_val_shunt~q ),
	.datab(\dav_source_del[2]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\data_val_shunt~0_combout ),
	.cout());
defparam \data_val_shunt~0 .lut_mask = 16'hEFFE;
defparam \data_val_shunt~0 .sum_lutc_input = "datac";

dffeas data_val_pipe(
	.clk(clk),
	.d(\data_val_shunt~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(\data_val_pipe~q ),
	.prn(vcc));
defparam data_val_pipe.is_wysiwyg = "true";
defparam data_val_pipe.power_up = "low";

cycloneive_lcell_comb \Selector31~0 (
	.dataa(\atl_buffer_state.out_hold~q ),
	.datab(\dav_source_del[2]~q ),
	.datac(\atl_buffer_state.out_idle~q ),
	.datad(\atl_buffer_state.out_active~q ),
	.cin(gnd),
	.combout(\Selector31~0_combout ),
	.cout());
defparam \Selector31~0 .lut_mask = 16'hFFFE;
defparam \Selector31~0 .sum_lutc_input = "datac";

dffeas val_source_q(
	.clk(clk),
	.d(\Selector31~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\val_source_q~q ),
	.prn(vcc));
defparam val_source_q.is_wysiwyg = "true";
defparam val_source_q.power_up = "low";

dffeas sop_source_shunt(
	.clk(clk),
	.d(\sop_source_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sop_source_shunt~q ),
	.prn(vcc));
defparam sop_source_shunt.is_wysiwyg = "true";
defparam sop_source_shunt.power_up = "low";

cycloneive_lcell_comb \sop_source_d~0 (
	.dataa(\sop_source_shunt~q ),
	.datab(\sop_source_pipe[3]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\sop_source_d~0_combout ),
	.cout());
defparam \sop_source_d~0 .lut_mask = 16'hEFFE;
defparam \sop_source_d~0 .sum_lutc_input = "datac";

dffeas eop_source_shunt(
	.clk(clk),
	.d(\eop_source_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\eop_source_shunt~q ),
	.prn(vcc));
defparam eop_source_shunt.is_wysiwyg = "true";
defparam eop_source_shunt.power_up = "low";

dffeas \eop_source_pipe[1] (
	.clk(clk),
	.d(\eop_source_gen~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\eop_source_pipe[1]~q ),
	.prn(vcc));
defparam \eop_source_pipe[1] .is_wysiwyg = "true";
defparam \eop_source_pipe[1] .power_up = "low";

dffeas \eop_source_pipe[2] (
	.clk(clk),
	.d(\eop_source_pipe[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\eop_source_pipe[2]~q ),
	.prn(vcc));
defparam \eop_source_pipe[2] .is_wysiwyg = "true";
defparam \eop_source_pipe[2] .power_up = "low";

dffeas \eop_source_pipe[3] (
	.clk(clk),
	.d(\eop_source_pipe[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\eop_source_pipe[3]~q ),
	.prn(vcc));
defparam \eop_source_pipe[3] .is_wysiwyg = "true";
defparam \eop_source_pipe[3] .power_up = "low";

cycloneive_lcell_comb \eop_source_d~0 (
	.dataa(\eop_source_shunt~q ),
	.datab(\eop_source_pipe[3]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\eop_source_d~0_combout ),
	.cout());
defparam \eop_source_d~0 .lut_mask = 16'hEFFE;
defparam \eop_source_d~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \numerr_lf~10 (
	.dataa(\numerrhold_q[2][1]~q ),
	.datab(\pipe_numerr~6_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerr_lf~10_combout ),
	.cout());
defparam \numerr_lf~10 .lut_mask = 16'hEEEE;
defparam \numerr_lf~10 .sum_lutc_input = "datac";

dffeas \numerr_lf[1][1] (
	.clk(clk),
	.d(\numerr_lf~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[1][1]~9_combout ),
	.q(\numerr_lf[1][1]~q ),
	.prn(vcc));
defparam \numerr_lf[1][1] .is_wysiwyg = "true";
defparam \numerr_lf[1][1] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~5 (
	.dataa(\numerrhold_q[2][1]~q ),
	.datab(\numerr_lf[1][1]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~2_combout ),
	.cin(gnd),
	.combout(\numerr_lf~5_combout ),
	.cout());
defparam \numerr_lf~5 .lut_mask = 16'hAACC;
defparam \numerr_lf~5 .sum_lutc_input = "datac";

dffeas \numerr_lf[2][1] (
	.clk(clk),
	.d(\numerr_lf~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\decfail_lf[2]~4_combout ),
	.q(\numerr_lf[2][1]~q ),
	.prn(vcc));
defparam \numerr_lf[2][1] .is_wysiwyg = "true";
defparam \numerr_lf[2][1] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~1 (
	.dataa(\numerrhold_q[2][1]~q ),
	.datab(\numerr_lf[2][1]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~0_combout ),
	.cin(gnd),
	.combout(\numerr_lf~1_combout ),
	.cout());
defparam \numerr_lf~1 .lut_mask = 16'hAACC;
defparam \numerr_lf~1 .sum_lutc_input = "datac";

dffeas \numerr_lf[3][1] (
	.clk(clk),
	.d(\numerr_lf~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[3][1]~0_combout ),
	.q(\numerr_lf[3][1]~q ),
	.prn(vcc));
defparam \numerr_lf[3][1] .is_wysiwyg = "true";
defparam \numerr_lf[3][1] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~11 (
	.dataa(\numerrhold_q[2][2]~q ),
	.datab(\pipe_numerr~6_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerr_lf~11_combout ),
	.cout());
defparam \numerr_lf~11 .lut_mask = 16'hEEEE;
defparam \numerr_lf~11 .sum_lutc_input = "datac";

dffeas \numerr_lf[1][2] (
	.clk(clk),
	.d(\numerr_lf~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[1][1]~9_combout ),
	.q(\numerr_lf[1][2]~q ),
	.prn(vcc));
defparam \numerr_lf[1][2] .is_wysiwyg = "true";
defparam \numerr_lf[1][2] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~6 (
	.dataa(\numerrhold_q[2][2]~q ),
	.datab(\numerr_lf[1][2]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~2_combout ),
	.cin(gnd),
	.combout(\numerr_lf~6_combout ),
	.cout());
defparam \numerr_lf~6 .lut_mask = 16'hAACC;
defparam \numerr_lf~6 .sum_lutc_input = "datac";

dffeas \numerr_lf[2][2] (
	.clk(clk),
	.d(\numerr_lf~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\decfail_lf[2]~4_combout ),
	.q(\numerr_lf[2][2]~q ),
	.prn(vcc));
defparam \numerr_lf[2][2] .is_wysiwyg = "true";
defparam \numerr_lf[2][2] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~2 (
	.dataa(\numerrhold_q[2][2]~q ),
	.datab(\numerr_lf[2][2]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~0_combout ),
	.cin(gnd),
	.combout(\numerr_lf~2_combout ),
	.cout());
defparam \numerr_lf~2 .lut_mask = 16'hAACC;
defparam \numerr_lf~2 .sum_lutc_input = "datac";

dffeas \numerr_lf[3][2] (
	.clk(clk),
	.d(\numerr_lf~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[3][1]~0_combout ),
	.q(\numerr_lf[3][2]~q ),
	.prn(vcc));
defparam \numerr_lf[3][2] .is_wysiwyg = "true";
defparam \numerr_lf[3][2] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~12 (
	.dataa(\numerrhold_q[2][3]~q ),
	.datab(\pipe_numerr~6_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerr_lf~12_combout ),
	.cout());
defparam \numerr_lf~12 .lut_mask = 16'hEEEE;
defparam \numerr_lf~12 .sum_lutc_input = "datac";

dffeas \numerr_lf[1][3] (
	.clk(clk),
	.d(\numerr_lf~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[1][1]~9_combout ),
	.q(\numerr_lf[1][3]~q ),
	.prn(vcc));
defparam \numerr_lf[1][3] .is_wysiwyg = "true";
defparam \numerr_lf[1][3] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~7 (
	.dataa(\numerrhold_q[2][3]~q ),
	.datab(\numerr_lf[1][3]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~2_combout ),
	.cin(gnd),
	.combout(\numerr_lf~7_combout ),
	.cout());
defparam \numerr_lf~7 .lut_mask = 16'hAACC;
defparam \numerr_lf~7 .sum_lutc_input = "datac";

dffeas \numerr_lf[2][3] (
	.clk(clk),
	.d(\numerr_lf~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\decfail_lf[2]~4_combout ),
	.q(\numerr_lf[2][3]~q ),
	.prn(vcc));
defparam \numerr_lf[2][3] .is_wysiwyg = "true";
defparam \numerr_lf[2][3] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~3 (
	.dataa(\numerrhold_q[2][3]~q ),
	.datab(\numerr_lf[2][3]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~0_combout ),
	.cin(gnd),
	.combout(\numerr_lf~3_combout ),
	.cout());
defparam \numerr_lf~3 .lut_mask = 16'hAACC;
defparam \numerr_lf~3 .sum_lutc_input = "datac";

dffeas \numerr_lf[3][3] (
	.clk(clk),
	.d(\numerr_lf~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[3][1]~0_combout ),
	.q(\numerr_lf[3][3]~q ),
	.prn(vcc));
defparam \numerr_lf[3][3] .is_wysiwyg = "true";
defparam \numerr_lf[3][3] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~13 (
	.dataa(\numerrhold_q[2][4]~q ),
	.datab(\pipe_numerr~6_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\numerr_lf~13_combout ),
	.cout());
defparam \numerr_lf~13 .lut_mask = 16'hEEEE;
defparam \numerr_lf~13 .sum_lutc_input = "datac";

dffeas \numerr_lf[1][4] (
	.clk(clk),
	.d(\numerr_lf~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[1][1]~9_combout ),
	.q(\numerr_lf[1][4]~q ),
	.prn(vcc));
defparam \numerr_lf[1][4] .is_wysiwyg = "true";
defparam \numerr_lf[1][4] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~8 (
	.dataa(\numerrhold_q[2][4]~q ),
	.datab(\numerr_lf[1][4]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~2_combout ),
	.cin(gnd),
	.combout(\numerr_lf~8_combout ),
	.cout());
defparam \numerr_lf~8 .lut_mask = 16'hAACC;
defparam \numerr_lf~8 .sum_lutc_input = "datac";

dffeas \numerr_lf[2][4] (
	.clk(clk),
	.d(\numerr_lf~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\decfail_lf[2]~4_combout ),
	.q(\numerr_lf[2][4]~q ),
	.prn(vcc));
defparam \numerr_lf[2][4] .is_wysiwyg = "true";
defparam \numerr_lf[2][4] .power_up = "low";

cycloneive_lcell_comb \numerr_lf~4 (
	.dataa(\numerrhold_q[2][4]~q ),
	.datab(\numerr_lf[2][4]~q ),
	.datac(gnd),
	.datad(\pipe_numerr~0_combout ),
	.cin(gnd),
	.combout(\numerr_lf~4_combout ),
	.cout());
defparam \numerr_lf~4 .lut_mask = 16'hAACC;
defparam \numerr_lf~4 .sum_lutc_input = "datac";

dffeas \numerr_lf[3][4] (
	.clk(clk),
	.d(\numerr_lf~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\numerr_lf[3][1]~0_combout ),
	.q(\numerr_lf[3][4]~q ),
	.prn(vcc));
defparam \numerr_lf[3][4] .is_wysiwyg = "true";
defparam \numerr_lf[3][4] .power_up = "low";

dffeas \rserr_shunt[1] (
	.clk(clk),
	.d(\rserrff_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[1]~q ),
	.prn(vcc));
defparam \rserr_shunt[1] .is_wysiwyg = "true";
defparam \rserr_shunt[1] .power_up = "low";

dffeas \align1_err_bis[1] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[0] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[1]~q ),
	.prn(vcc));
defparam \align1_err_bis[1] .is_wysiwyg = "true";
defparam \align1_err_bis[1] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~0 (
	.dataa(\rserr_shunt[1]~q ),
	.datab(\align1_err_bis[1]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~0_combout ),
	.cout());
defparam \rserrff_d~0 .lut_mask = 16'hEFFE;
defparam \rserrff_d~0 .sum_lutc_input = "datac";

dffeas \rserr_shunt[2] (
	.clk(clk),
	.d(\rserrff_d~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[2]~q ),
	.prn(vcc));
defparam \rserr_shunt[2] .is_wysiwyg = "true";
defparam \rserr_shunt[2] .power_up = "low";

dffeas \align1_err_bis[2] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[1] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[2]~q ),
	.prn(vcc));
defparam \align1_err_bis[2] .is_wysiwyg = "true";
defparam \align1_err_bis[2] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~1 (
	.dataa(\rserr_shunt[2]~q ),
	.datab(\align1_err_bis[2]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~1_combout ),
	.cout());
defparam \rserrff_d~1 .lut_mask = 16'hEFFE;
defparam \rserrff_d~1 .sum_lutc_input = "datac";

dffeas \rserr_shunt[3] (
	.clk(clk),
	.d(\rserrff_d~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[3]~q ),
	.prn(vcc));
defparam \rserr_shunt[3] .is_wysiwyg = "true";
defparam \rserr_shunt[3] .power_up = "low";

dffeas \align1_err_bis[3] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[2] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[3]~q ),
	.prn(vcc));
defparam \align1_err_bis[3] .is_wysiwyg = "true";
defparam \align1_err_bis[3] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~2 (
	.dataa(\rserr_shunt[3]~q ),
	.datab(\align1_err_bis[3]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~2_combout ),
	.cout());
defparam \rserrff_d~2 .lut_mask = 16'hEFFE;
defparam \rserrff_d~2 .sum_lutc_input = "datac";

dffeas \rserr_shunt[4] (
	.clk(clk),
	.d(\rserrff_d~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[4]~q ),
	.prn(vcc));
defparam \rserr_shunt[4] .is_wysiwyg = "true";
defparam \rserr_shunt[4] .power_up = "low";

dffeas \align1_err_bis[4] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[3] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[4]~q ),
	.prn(vcc));
defparam \align1_err_bis[4] .is_wysiwyg = "true";
defparam \align1_err_bis[4] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~3 (
	.dataa(\rserr_shunt[4]~q ),
	.datab(\align1_err_bis[4]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~3_combout ),
	.cout());
defparam \rserrff_d~3 .lut_mask = 16'hEFFE;
defparam \rserrff_d~3 .sum_lutc_input = "datac";

dffeas \rserr_shunt[5] (
	.clk(clk),
	.d(\rserrff_d~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[5]~q ),
	.prn(vcc));
defparam \rserr_shunt[5] .is_wysiwyg = "true";
defparam \rserr_shunt[5] .power_up = "low";

dffeas \align1_err_bis[5] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[4] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[5]~q ),
	.prn(vcc));
defparam \align1_err_bis[5] .is_wysiwyg = "true";
defparam \align1_err_bis[5] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~4 (
	.dataa(\rserr_shunt[5]~q ),
	.datab(\align1_err_bis[5]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~4_combout ),
	.cout());
defparam \rserrff_d~4 .lut_mask = 16'hEFFE;
defparam \rserrff_d~4 .sum_lutc_input = "datac";

dffeas \rserr_shunt[6] (
	.clk(clk),
	.d(\rserrff_d~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[6]~q ),
	.prn(vcc));
defparam \rserr_shunt[6] .is_wysiwyg = "true";
defparam \rserr_shunt[6] .power_up = "low";

dffeas \align1_err_bis[6] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[5] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[6]~q ),
	.prn(vcc));
defparam \align1_err_bis[6] .is_wysiwyg = "true";
defparam \align1_err_bis[6] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~5 (
	.dataa(\rserr_shunt[6]~q ),
	.datab(\align1_err_bis[6]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~5_combout ),
	.cout());
defparam \rserrff_d~5 .lut_mask = 16'hEFFE;
defparam \rserrff_d~5 .sum_lutc_input = "datac";

dffeas \rserr_shunt[7] (
	.clk(clk),
	.d(\rserrff_d~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[7]~q ),
	.prn(vcc));
defparam \rserr_shunt[7] .is_wysiwyg = "true";
defparam \rserr_shunt[7] .power_up = "low";

dffeas \align1_err_bis[7] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[6] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[7]~q ),
	.prn(vcc));
defparam \align1_err_bis[7] .is_wysiwyg = "true";
defparam \align1_err_bis[7] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~6 (
	.dataa(\rserr_shunt[7]~q ),
	.datab(\align1_err_bis[7]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~6_combout ),
	.cout());
defparam \rserrff_d~6 .lut_mask = 16'hEFFE;
defparam \rserrff_d~6 .sum_lutc_input = "datac";

dffeas \rserr_shunt[8] (
	.clk(clk),
	.d(\rserrff_d~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rserr_shunt[8]~q ),
	.prn(vcc));
defparam \rserr_shunt[8] .is_wysiwyg = "true";
defparam \rserr_shunt[8] .power_up = "low";

dffeas \align1_err_bis[8] (
	.clk(clk),
	.d(\RAM_DP_err_value|auto_generated|q_b[7] ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\align1_err_bis[8]~q ),
	.prn(vcc));
defparam \align1_err_bis[8] .is_wysiwyg = "true";
defparam \align1_err_bis[8] .power_up = "low";

cycloneive_lcell_comb \rserrff_d~7 (
	.dataa(\rserr_shunt[8]~q ),
	.datab(\align1_err_bis[8]~q ),
	.datac(\atl_buffer_state.S0~q ),
	.datad(\atl_buffer_state.out_hold~q ),
	.cin(gnd),
	.combout(\rserrff_d~7_combout ),
	.cout());
defparam \rserrff_d~7 .lut_mask = 16'hEFFE;
defparam \rserrff_d~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector23~0 (
	.dataa(\chn_status.busy~q ),
	.datab(stateS98),
	.datac(gnd),
	.datad(\chn_end_point_q~q ),
	.cin(gnd),
	.combout(\Selector23~0_combout ),
	.cout());
defparam \Selector23~0 .lut_mask = 16'hEEFF;
defparam \Selector23~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \FSM_chn~0 (
	.dataa(\chn_end_point_q~q ),
	.datab(\lf_status_swap[4]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\FSM_chn~0_combout ),
	.cout());
defparam \FSM_chn~0 .lut_mask = 16'hEEEE;
defparam \FSM_chn~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector23~1 (
	.dataa(\Selector23~0_combout ),
	.datab(chn_statusbooked),
	.datac(Selector20),
	.datad(\FSM_chn~0_combout ),
	.cin(gnd),
	.combout(\Selector23~1_combout ),
	.cout());
defparam \Selector23~1 .lut_mask = 16'hEFFF;
defparam \Selector23~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector17~0 (
	.dataa(stateS98),
	.datab(\bms_status.busy~q ),
	.datac(bms_statusidle),
	.datad(load_syn_gen),
	.cin(gnd),
	.combout(\Selector17~0_combout ),
	.cout());
defparam \Selector17~0 .lut_mask = 16'h8BFF;
defparam \Selector17~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector17~1 (
	.dataa(\Selector17~0_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(sink_eop_q),
	.cin(gnd),
	.combout(\Selector17~1_combout ),
	.cout());
defparam \Selector17~1 .lut_mask = 16'hFF55;
defparam \Selector17~1 .sum_lutc_input = "datac";

dffeas \ena_ctrl_state.able (
	.clk(clk),
	.d(sink_ena_master),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ena_ctrl_state.able~q ),
	.prn(vcc));
defparam \ena_ctrl_state.able .is_wysiwyg = "true";
defparam \ena_ctrl_state.able .power_up = "low";

cycloneive_lcell_comb \Selector8~0 (
	.dataa(\ena_ctrl_state.disable_val_active~q ),
	.datab(sink_val),
	.datac(\ena_ctrl_state.able~q ),
	.datad(sink_ena_master),
	.cin(gnd),
	.combout(\Selector8~0_combout ),
	.cout());
defparam \Selector8~0 .lut_mask = 16'hFEFF;
defparam \Selector8~0 .sum_lutc_input = "datac";

dffeas \ena_ctrl_state.disable_val_active (
	.clk(clk),
	.d(\Selector8~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ena_ctrl_state.disable_val_active~q ),
	.prn(vcc));
defparam \ena_ctrl_state.disable_val_active .is_wysiwyg = "true";
defparam \ena_ctrl_state.disable_val_active .power_up = "low";

cycloneive_lcell_comb \Selector6~0 (
	.dataa(sink_val),
	.datab(\ena_ctrl_state.able~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector6~0_combout ),
	.cout());
defparam \Selector6~0 .lut_mask = 16'hEEEE;
defparam \Selector6~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_transfer~0 (
	.dataa(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datab(\chn_end_point_q~q ),
	.datac(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\syn_transfer~0_combout ),
	.cout());
defparam \syn_transfer~0 .lut_mask = 16'hFEFE;
defparam \syn_transfer~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_transfer~1 (
	.dataa(\syn_bms_chn_synch_ctrl.bms_block~q ),
	.datab(stateS98),
	.datac(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datad(\syn_transfer~0_combout ),
	.cin(gnd),
	.combout(\syn_transfer~1_combout ),
	.cout());
defparam \syn_transfer~1 .lut_mask = 16'hFFAC;
defparam \syn_transfer~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn_transfer~2 (
	.dataa(sink_eop_q),
	.datab(\syn_transfer~q ),
	.datac(bms_clear),
	.datad(\syn_transfer~1_combout ),
	.cin(gnd),
	.combout(\syn_transfer~2_combout ),
	.cout());
defparam \syn_transfer~2 .lut_mask = 16'hFEFF;
defparam \syn_transfer~2 .sum_lutc_input = "datac";

dffeas syn_transfer(
	.clk(clk),
	.d(\syn_transfer~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\syn_transfer~q ),
	.prn(vcc));
defparam syn_transfer.is_wysiwyg = "true";
defparam syn_transfer.power_up = "low";

cycloneive_lcell_comb \load_syn_gen~0 (
	.dataa(\chn_end_point_q~q ),
	.datab(\syn_bms_chn_synch_ctrl.chn_block~q ),
	.datac(\syn_bms_chn_synch_ctrl.bms_block~q ),
	.datad(\syn_bms_chn_synch_ctrl.bms_chn_block~q ),
	.cin(gnd),
	.combout(\load_syn_gen~0_combout ),
	.cout());
defparam \load_syn_gen~0 .lut_mask = 16'hFFB8;
defparam \load_syn_gen~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector24~0 (
	.dataa(\chn_status.busy~q ),
	.datab(stateS98),
	.datac(\chn_end_point_q~q ),
	.datad(\lf_status_swap[4]~q ),
	.cin(gnd),
	.combout(\Selector24~0_combout ),
	.cout());
defparam \Selector24~0 .lut_mask = 16'hFFFE;
defparam \Selector24~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector24~1 (
	.dataa(\lf_status_swap[5]~q ),
	.datab(\chn_status.waiting~q ),
	.datac(stateS98),
	.datad(\chn_status.idle~q ),
	.cin(gnd),
	.combout(\Selector24~1_combout ),
	.cout());
defparam \Selector24~1 .lut_mask = 16'hFEFF;
defparam \Selector24~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector24~2 (
	.dataa(\Selector24~0_combout ),
	.datab(\Selector24~1_combout ),
	.datac(chn_statusbooked),
	.datad(\FSM_chn~0_combout ),
	.cin(gnd),
	.combout(\Selector24~2_combout ),
	.cout());
defparam \Selector24~2 .lut_mask = 16'hFFFE;
defparam \Selector24~2 .sum_lutc_input = "datac";

dffeas \chn_status.waiting (
	.clk(clk),
	.d(\Selector24~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\chn_status.waiting~q ),
	.prn(vcc));
defparam \chn_status.waiting .is_wysiwyg = "true";
defparam \chn_status.waiting .power_up = "low";

cycloneive_lcell_comb \next_chn_status.load~0 (
	.dataa(\lf_status_swap[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(\chn_status.waiting~q ),
	.cin(gnd),
	.combout(\next_chn_status.load~0_combout ),
	.cout());
defparam \next_chn_status.load~0 .lut_mask = 16'hFF55;
defparam \next_chn_status.load~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector20~2 (
	.dataa(chn_statusload),
	.datab(stateS98),
	.datac(\lf_status_swap[5]~q ),
	.datad(\chn_status.idle~q ),
	.cin(gnd),
	.combout(\Selector20~2_combout ),
	.cout());
defparam \Selector20~2 .lut_mask = 16'hEFFF;
defparam \Selector20~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \Selector20~3 (
	.dataa(chn_statusbooked),
	.datab(\chn_status.busy~q ),
	.datac(stateS98),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector20~3_combout ),
	.cout());
defparam \Selector20~3 .lut_mask = 16'hFEFE;
defparam \Selector20~3 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_altsyncram_3 (
	q_b,
	address_a,
	clocken1,
	address_b,
	data_a,
	wren_a,
	clock1)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_b;
input 	[9:0] address_a;
input 	clocken1;
input 	[9:0] address_b;
input 	[7:0] data_a;
input 	wren_a;
input 	clock1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



RS_DE_LANE_QUATUS_altsyncram_mj43 auto_generated(
	.q_b({q_b[7],q_b[6],q_b[5],q_b[4],q_b[3],q_b[2],q_b[1],q_b[0]}),
	.address_a({address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clocken1(clocken1),
	.address_b({address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.data_a({data_a[7],data_a[6],data_a[5],data_a[4],data_a[3],data_a[2],data_a[1],data_a[0]}),
	.wren_a(wren_a),
	.clock1(clock1),
	.clock0(clock1));

endmodule

module RS_DE_LANE_QUATUS_altsyncram_mj43 (
	q_b,
	address_a,
	clocken1,
	address_b,
	data_a,
	wren_a,
	clock1,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_b;
input 	[8:0] address_a;
input 	clocken1;
input 	[8:0] address_b;
input 	[7:0] data_a;
input 	wren_a;
input 	clock1;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a0_PORTBDATAOUT_bus;
wire [143:0] ram_block1a1_PORTBDATAOUT_bus;
wire [143:0] ram_block1a2_PORTBDATAOUT_bus;
wire [143:0] ram_block1a3_PORTBDATAOUT_bus;
wire [143:0] ram_block1a4_PORTBDATAOUT_bus;
wire [143:0] ram_block1a5_PORTBDATAOUT_bus;
wire [143:0] ram_block1a6_PORTBDATAOUT_bus;
wire [143:0] ram_block1a7_PORTBDATAOUT_bus;

assign q_b[0] = ram_block1a0_PORTBDATAOUT_bus[0];

assign q_b[1] = ram_block1a1_PORTBDATAOUT_bus[0];

assign q_b[2] = ram_block1a2_PORTBDATAOUT_bus[0];

assign q_b[3] = ram_block1a3_PORTBDATAOUT_bus[0];

assign q_b[4] = ram_block1a4_PORTBDATAOUT_bus[0];

assign q_b[5] = ram_block1a5_PORTBDATAOUT_bus[0];

assign q_b[6] = ram_block1a6_PORTBDATAOUT_bus[0];

assign q_b[7] = ram_block1a7_PORTBDATAOUT_bus[0];

cycloneive_ram_block ram_block1a0(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[0]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a0_PORTBDATAOUT_bus));
defparam ram_block1a0.clk0_core_clock_enable = "ena0";
defparam ram_block1a0.clk1_core_clock_enable = "ena1";
defparam ram_block1a0.clk1_input_clock_enable = "ena1";
defparam ram_block1a0.clk1_output_clock_enable = "ena1";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a0.operation_mode = "dual_port";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 9;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 511;
defparam ram_block1a0.port_a_logical_ram_depth = 512;
defparam ram_block1a0.port_a_logical_ram_width = 8;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_address_clear = "none";
defparam ram_block1a0.port_b_address_clock = "clock1";
defparam ram_block1a0.port_b_address_width = 9;
defparam ram_block1a0.port_b_data_out_clear = "none";
defparam ram_block1a0.port_b_data_out_clock = "clock1";
defparam ram_block1a0.port_b_data_width = 1;
defparam ram_block1a0.port_b_first_address = 0;
defparam ram_block1a0.port_b_first_bit_number = 0;
defparam ram_block1a0.port_b_last_address = 511;
defparam ram_block1a0.port_b_logical_ram_depth = 512;
defparam ram_block1a0.port_b_logical_ram_width = 8;
defparam ram_block1a0.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_read_enable_clock = "clock1";
defparam ram_block1a0.ram_block_type = "auto";

cycloneive_ram_block ram_block1a1(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[1]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a1_PORTBDATAOUT_bus));
defparam ram_block1a1.clk0_core_clock_enable = "ena0";
defparam ram_block1a1.clk1_core_clock_enable = "ena1";
defparam ram_block1a1.clk1_input_clock_enable = "ena1";
defparam ram_block1a1.clk1_output_clock_enable = "ena1";
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a1.operation_mode = "dual_port";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 9;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 511;
defparam ram_block1a1.port_a_logical_ram_depth = 512;
defparam ram_block1a1.port_a_logical_ram_width = 8;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_address_clear = "none";
defparam ram_block1a1.port_b_address_clock = "clock1";
defparam ram_block1a1.port_b_address_width = 9;
defparam ram_block1a1.port_b_data_out_clear = "none";
defparam ram_block1a1.port_b_data_out_clock = "clock1";
defparam ram_block1a1.port_b_data_width = 1;
defparam ram_block1a1.port_b_first_address = 0;
defparam ram_block1a1.port_b_first_bit_number = 1;
defparam ram_block1a1.port_b_last_address = 511;
defparam ram_block1a1.port_b_logical_ram_depth = 512;
defparam ram_block1a1.port_b_logical_ram_width = 8;
defparam ram_block1a1.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_read_enable_clock = "clock1";
defparam ram_block1a1.ram_block_type = "auto";

cycloneive_ram_block ram_block1a2(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[2]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a2_PORTBDATAOUT_bus));
defparam ram_block1a2.clk0_core_clock_enable = "ena0";
defparam ram_block1a2.clk1_core_clock_enable = "ena1";
defparam ram_block1a2.clk1_input_clock_enable = "ena1";
defparam ram_block1a2.clk1_output_clock_enable = "ena1";
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a2.operation_mode = "dual_port";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 9;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 511;
defparam ram_block1a2.port_a_logical_ram_depth = 512;
defparam ram_block1a2.port_a_logical_ram_width = 8;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_address_clear = "none";
defparam ram_block1a2.port_b_address_clock = "clock1";
defparam ram_block1a2.port_b_address_width = 9;
defparam ram_block1a2.port_b_data_out_clear = "none";
defparam ram_block1a2.port_b_data_out_clock = "clock1";
defparam ram_block1a2.port_b_data_width = 1;
defparam ram_block1a2.port_b_first_address = 0;
defparam ram_block1a2.port_b_first_bit_number = 2;
defparam ram_block1a2.port_b_last_address = 511;
defparam ram_block1a2.port_b_logical_ram_depth = 512;
defparam ram_block1a2.port_b_logical_ram_width = 8;
defparam ram_block1a2.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_read_enable_clock = "clock1";
defparam ram_block1a2.ram_block_type = "auto";

cycloneive_ram_block ram_block1a3(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[3]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a3_PORTBDATAOUT_bus));
defparam ram_block1a3.clk0_core_clock_enable = "ena0";
defparam ram_block1a3.clk1_core_clock_enable = "ena1";
defparam ram_block1a3.clk1_input_clock_enable = "ena1";
defparam ram_block1a3.clk1_output_clock_enable = "ena1";
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a3.operation_mode = "dual_port";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 9;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 511;
defparam ram_block1a3.port_a_logical_ram_depth = 512;
defparam ram_block1a3.port_a_logical_ram_width = 8;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_address_clear = "none";
defparam ram_block1a3.port_b_address_clock = "clock1";
defparam ram_block1a3.port_b_address_width = 9;
defparam ram_block1a3.port_b_data_out_clear = "none";
defparam ram_block1a3.port_b_data_out_clock = "clock1";
defparam ram_block1a3.port_b_data_width = 1;
defparam ram_block1a3.port_b_first_address = 0;
defparam ram_block1a3.port_b_first_bit_number = 3;
defparam ram_block1a3.port_b_last_address = 511;
defparam ram_block1a3.port_b_logical_ram_depth = 512;
defparam ram_block1a3.port_b_logical_ram_width = 8;
defparam ram_block1a3.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_read_enable_clock = "clock1";
defparam ram_block1a3.ram_block_type = "auto";

cycloneive_ram_block ram_block1a4(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[4]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a4_PORTBDATAOUT_bus));
defparam ram_block1a4.clk0_core_clock_enable = "ena0";
defparam ram_block1a4.clk1_core_clock_enable = "ena1";
defparam ram_block1a4.clk1_input_clock_enable = "ena1";
defparam ram_block1a4.clk1_output_clock_enable = "ena1";
defparam ram_block1a4.data_interleave_offset_in_bits = 1;
defparam ram_block1a4.data_interleave_width_in_bits = 1;
defparam ram_block1a4.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a4.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a4.operation_mode = "dual_port";
defparam ram_block1a4.port_a_address_clear = "none";
defparam ram_block1a4.port_a_address_width = 9;
defparam ram_block1a4.port_a_data_out_clear = "none";
defparam ram_block1a4.port_a_data_out_clock = "none";
defparam ram_block1a4.port_a_data_width = 1;
defparam ram_block1a4.port_a_first_address = 0;
defparam ram_block1a4.port_a_first_bit_number = 4;
defparam ram_block1a4.port_a_last_address = 511;
defparam ram_block1a4.port_a_logical_ram_depth = 512;
defparam ram_block1a4.port_a_logical_ram_width = 8;
defparam ram_block1a4.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.port_b_address_clear = "none";
defparam ram_block1a4.port_b_address_clock = "clock1";
defparam ram_block1a4.port_b_address_width = 9;
defparam ram_block1a4.port_b_data_out_clear = "none";
defparam ram_block1a4.port_b_data_out_clock = "clock1";
defparam ram_block1a4.port_b_data_width = 1;
defparam ram_block1a4.port_b_first_address = 0;
defparam ram_block1a4.port_b_first_bit_number = 4;
defparam ram_block1a4.port_b_last_address = 511;
defparam ram_block1a4.port_b_logical_ram_depth = 512;
defparam ram_block1a4.port_b_logical_ram_width = 8;
defparam ram_block1a4.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.port_b_read_enable_clock = "clock1";
defparam ram_block1a4.ram_block_type = "auto";

cycloneive_ram_block ram_block1a5(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[5]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a5_PORTBDATAOUT_bus));
defparam ram_block1a5.clk0_core_clock_enable = "ena0";
defparam ram_block1a5.clk1_core_clock_enable = "ena1";
defparam ram_block1a5.clk1_input_clock_enable = "ena1";
defparam ram_block1a5.clk1_output_clock_enable = "ena1";
defparam ram_block1a5.data_interleave_offset_in_bits = 1;
defparam ram_block1a5.data_interleave_width_in_bits = 1;
defparam ram_block1a5.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a5.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a5.operation_mode = "dual_port";
defparam ram_block1a5.port_a_address_clear = "none";
defparam ram_block1a5.port_a_address_width = 9;
defparam ram_block1a5.port_a_data_out_clear = "none";
defparam ram_block1a5.port_a_data_out_clock = "none";
defparam ram_block1a5.port_a_data_width = 1;
defparam ram_block1a5.port_a_first_address = 0;
defparam ram_block1a5.port_a_first_bit_number = 5;
defparam ram_block1a5.port_a_last_address = 511;
defparam ram_block1a5.port_a_logical_ram_depth = 512;
defparam ram_block1a5.port_a_logical_ram_width = 8;
defparam ram_block1a5.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.port_b_address_clear = "none";
defparam ram_block1a5.port_b_address_clock = "clock1";
defparam ram_block1a5.port_b_address_width = 9;
defparam ram_block1a5.port_b_data_out_clear = "none";
defparam ram_block1a5.port_b_data_out_clock = "clock1";
defparam ram_block1a5.port_b_data_width = 1;
defparam ram_block1a5.port_b_first_address = 0;
defparam ram_block1a5.port_b_first_bit_number = 5;
defparam ram_block1a5.port_b_last_address = 511;
defparam ram_block1a5.port_b_logical_ram_depth = 512;
defparam ram_block1a5.port_b_logical_ram_width = 8;
defparam ram_block1a5.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.port_b_read_enable_clock = "clock1";
defparam ram_block1a5.ram_block_type = "auto";

cycloneive_ram_block ram_block1a6(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[6]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a6_PORTBDATAOUT_bus));
defparam ram_block1a6.clk0_core_clock_enable = "ena0";
defparam ram_block1a6.clk1_core_clock_enable = "ena1";
defparam ram_block1a6.clk1_input_clock_enable = "ena1";
defparam ram_block1a6.clk1_output_clock_enable = "ena1";
defparam ram_block1a6.data_interleave_offset_in_bits = 1;
defparam ram_block1a6.data_interleave_width_in_bits = 1;
defparam ram_block1a6.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a6.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a6.operation_mode = "dual_port";
defparam ram_block1a6.port_a_address_clear = "none";
defparam ram_block1a6.port_a_address_width = 9;
defparam ram_block1a6.port_a_data_out_clear = "none";
defparam ram_block1a6.port_a_data_out_clock = "none";
defparam ram_block1a6.port_a_data_width = 1;
defparam ram_block1a6.port_a_first_address = 0;
defparam ram_block1a6.port_a_first_bit_number = 6;
defparam ram_block1a6.port_a_last_address = 511;
defparam ram_block1a6.port_a_logical_ram_depth = 512;
defparam ram_block1a6.port_a_logical_ram_width = 8;
defparam ram_block1a6.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.port_b_address_clear = "none";
defparam ram_block1a6.port_b_address_clock = "clock1";
defparam ram_block1a6.port_b_address_width = 9;
defparam ram_block1a6.port_b_data_out_clear = "none";
defparam ram_block1a6.port_b_data_out_clock = "clock1";
defparam ram_block1a6.port_b_data_width = 1;
defparam ram_block1a6.port_b_first_address = 0;
defparam ram_block1a6.port_b_first_bit_number = 6;
defparam ram_block1a6.port_b_last_address = 511;
defparam ram_block1a6.port_b_logical_ram_depth = 512;
defparam ram_block1a6.port_b_logical_ram_width = 8;
defparam ram_block1a6.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.port_b_read_enable_clock = "clock1";
defparam ram_block1a6.ram_block_type = "auto";

cycloneive_ram_block ram_block1a7(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[7]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a7_PORTBDATAOUT_bus));
defparam ram_block1a7.clk0_core_clock_enable = "ena0";
defparam ram_block1a7.clk1_core_clock_enable = "ena1";
defparam ram_block1a7.clk1_input_clock_enable = "ena1";
defparam ram_block1a7.clk1_output_clock_enable = "ena1";
defparam ram_block1a7.data_interleave_offset_in_bits = 1;
defparam ram_block1a7.data_interleave_width_in_bits = 1;
defparam ram_block1a7.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_12|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a7.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a7.operation_mode = "dual_port";
defparam ram_block1a7.port_a_address_clear = "none";
defparam ram_block1a7.port_a_address_width = 9;
defparam ram_block1a7.port_a_data_out_clear = "none";
defparam ram_block1a7.port_a_data_out_clock = "none";
defparam ram_block1a7.port_a_data_width = 1;
defparam ram_block1a7.port_a_first_address = 0;
defparam ram_block1a7.port_a_first_bit_number = 7;
defparam ram_block1a7.port_a_last_address = 511;
defparam ram_block1a7.port_a_logical_ram_depth = 512;
defparam ram_block1a7.port_a_logical_ram_width = 8;
defparam ram_block1a7.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.port_b_address_clear = "none";
defparam ram_block1a7.port_b_address_clock = "clock1";
defparam ram_block1a7.port_b_address_width = 9;
defparam ram_block1a7.port_b_data_out_clear = "none";
defparam ram_block1a7.port_b_data_out_clock = "clock1";
defparam ram_block1a7.port_b_data_width = 1;
defparam ram_block1a7.port_b_first_address = 0;
defparam ram_block1a7.port_b_first_bit_number = 7;
defparam ram_block1a7.port_b_last_address = 511;
defparam ram_block1a7.port_b_logical_ram_depth = 512;
defparam ram_block1a7.port_b_logical_ram_width = 8;
defparam ram_block1a7.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.port_b_read_enable_clock = "clock1";
defparam ram_block1a7.ram_block_type = "auto";

endmodule

module RS_DE_LANE_QUATUS_altsyncram_4 (
	q_b,
	address_a,
	clocken1,
	address_b,
	wren_a,
	data_a,
	clock1)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_b;
input 	[9:0] address_a;
input 	clocken1;
input 	[9:0] address_b;
input 	wren_a;
input 	[7:0] data_a;
input 	clock1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



RS_DE_LANE_QUATUS_altsyncram_mj43_1 auto_generated(
	.q_b({q_b[7],q_b[6],q_b[5],q_b[4],q_b[3],q_b[2],q_b[1],q_b[0]}),
	.address_a({address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clocken1(clocken1),
	.address_b({address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.wren_a(wren_a),
	.data_a({data_a[7],data_a[6],data_a[5],data_a[4],data_a[3],data_a[2],data_a[1],data_a[0]}),
	.clock1(clock1),
	.clock0(clock1));

endmodule

module RS_DE_LANE_QUATUS_altsyncram_mj43_1 (
	q_b,
	address_a,
	clocken1,
	address_b,
	wren_a,
	data_a,
	clock1,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_b;
input 	[8:0] address_a;
input 	clocken1;
input 	[8:0] address_b;
input 	wren_a;
input 	[7:0] data_a;
input 	clock1;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a0_PORTBDATAOUT_bus;
wire [143:0] ram_block1a1_PORTBDATAOUT_bus;
wire [143:0] ram_block1a2_PORTBDATAOUT_bus;
wire [143:0] ram_block1a3_PORTBDATAOUT_bus;
wire [143:0] ram_block1a4_PORTBDATAOUT_bus;
wire [143:0] ram_block1a5_PORTBDATAOUT_bus;
wire [143:0] ram_block1a6_PORTBDATAOUT_bus;
wire [143:0] ram_block1a7_PORTBDATAOUT_bus;

assign q_b[0] = ram_block1a0_PORTBDATAOUT_bus[0];

assign q_b[1] = ram_block1a1_PORTBDATAOUT_bus[0];

assign q_b[2] = ram_block1a2_PORTBDATAOUT_bus[0];

assign q_b[3] = ram_block1a3_PORTBDATAOUT_bus[0];

assign q_b[4] = ram_block1a4_PORTBDATAOUT_bus[0];

assign q_b[5] = ram_block1a5_PORTBDATAOUT_bus[0];

assign q_b[6] = ram_block1a6_PORTBDATAOUT_bus[0];

assign q_b[7] = ram_block1a7_PORTBDATAOUT_bus[0];

cycloneive_ram_block ram_block1a0(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[0]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a0_PORTBDATAOUT_bus));
defparam ram_block1a0.clk0_core_clock_enable = "ena0";
defparam ram_block1a0.clk1_core_clock_enable = "ena1";
defparam ram_block1a0.clk1_input_clock_enable = "ena1";
defparam ram_block1a0.clk1_output_clock_enable = "ena1";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a0.operation_mode = "dual_port";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 9;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 511;
defparam ram_block1a0.port_a_logical_ram_depth = 512;
defparam ram_block1a0.port_a_logical_ram_width = 8;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_address_clear = "none";
defparam ram_block1a0.port_b_address_clock = "clock1";
defparam ram_block1a0.port_b_address_width = 9;
defparam ram_block1a0.port_b_data_out_clear = "none";
defparam ram_block1a0.port_b_data_out_clock = "clock1";
defparam ram_block1a0.port_b_data_width = 1;
defparam ram_block1a0.port_b_first_address = 0;
defparam ram_block1a0.port_b_first_bit_number = 0;
defparam ram_block1a0.port_b_last_address = 511;
defparam ram_block1a0.port_b_logical_ram_depth = 512;
defparam ram_block1a0.port_b_logical_ram_width = 8;
defparam ram_block1a0.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_read_enable_clock = "clock1";
defparam ram_block1a0.ram_block_type = "auto";

cycloneive_ram_block ram_block1a1(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[1]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a1_PORTBDATAOUT_bus));
defparam ram_block1a1.clk0_core_clock_enable = "ena0";
defparam ram_block1a1.clk1_core_clock_enable = "ena1";
defparam ram_block1a1.clk1_input_clock_enable = "ena1";
defparam ram_block1a1.clk1_output_clock_enable = "ena1";
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a1.operation_mode = "dual_port";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 9;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 511;
defparam ram_block1a1.port_a_logical_ram_depth = 512;
defparam ram_block1a1.port_a_logical_ram_width = 8;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_address_clear = "none";
defparam ram_block1a1.port_b_address_clock = "clock1";
defparam ram_block1a1.port_b_address_width = 9;
defparam ram_block1a1.port_b_data_out_clear = "none";
defparam ram_block1a1.port_b_data_out_clock = "clock1";
defparam ram_block1a1.port_b_data_width = 1;
defparam ram_block1a1.port_b_first_address = 0;
defparam ram_block1a1.port_b_first_bit_number = 1;
defparam ram_block1a1.port_b_last_address = 511;
defparam ram_block1a1.port_b_logical_ram_depth = 512;
defparam ram_block1a1.port_b_logical_ram_width = 8;
defparam ram_block1a1.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_read_enable_clock = "clock1";
defparam ram_block1a1.ram_block_type = "auto";

cycloneive_ram_block ram_block1a2(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[2]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a2_PORTBDATAOUT_bus));
defparam ram_block1a2.clk0_core_clock_enable = "ena0";
defparam ram_block1a2.clk1_core_clock_enable = "ena1";
defparam ram_block1a2.clk1_input_clock_enable = "ena1";
defparam ram_block1a2.clk1_output_clock_enable = "ena1";
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a2.operation_mode = "dual_port";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 9;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 511;
defparam ram_block1a2.port_a_logical_ram_depth = 512;
defparam ram_block1a2.port_a_logical_ram_width = 8;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_address_clear = "none";
defparam ram_block1a2.port_b_address_clock = "clock1";
defparam ram_block1a2.port_b_address_width = 9;
defparam ram_block1a2.port_b_data_out_clear = "none";
defparam ram_block1a2.port_b_data_out_clock = "clock1";
defparam ram_block1a2.port_b_data_width = 1;
defparam ram_block1a2.port_b_first_address = 0;
defparam ram_block1a2.port_b_first_bit_number = 2;
defparam ram_block1a2.port_b_last_address = 511;
defparam ram_block1a2.port_b_logical_ram_depth = 512;
defparam ram_block1a2.port_b_logical_ram_width = 8;
defparam ram_block1a2.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_read_enable_clock = "clock1";
defparam ram_block1a2.ram_block_type = "auto";

cycloneive_ram_block ram_block1a3(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[3]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a3_PORTBDATAOUT_bus));
defparam ram_block1a3.clk0_core_clock_enable = "ena0";
defparam ram_block1a3.clk1_core_clock_enable = "ena1";
defparam ram_block1a3.clk1_input_clock_enable = "ena1";
defparam ram_block1a3.clk1_output_clock_enable = "ena1";
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a3.operation_mode = "dual_port";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 9;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 511;
defparam ram_block1a3.port_a_logical_ram_depth = 512;
defparam ram_block1a3.port_a_logical_ram_width = 8;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_address_clear = "none";
defparam ram_block1a3.port_b_address_clock = "clock1";
defparam ram_block1a3.port_b_address_width = 9;
defparam ram_block1a3.port_b_data_out_clear = "none";
defparam ram_block1a3.port_b_data_out_clock = "clock1";
defparam ram_block1a3.port_b_data_width = 1;
defparam ram_block1a3.port_b_first_address = 0;
defparam ram_block1a3.port_b_first_bit_number = 3;
defparam ram_block1a3.port_b_last_address = 511;
defparam ram_block1a3.port_b_logical_ram_depth = 512;
defparam ram_block1a3.port_b_logical_ram_width = 8;
defparam ram_block1a3.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_read_enable_clock = "clock1";
defparam ram_block1a3.ram_block_type = "auto";

cycloneive_ram_block ram_block1a4(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[4]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a4_PORTBDATAOUT_bus));
defparam ram_block1a4.clk0_core_clock_enable = "ena0";
defparam ram_block1a4.clk1_core_clock_enable = "ena1";
defparam ram_block1a4.clk1_input_clock_enable = "ena1";
defparam ram_block1a4.clk1_output_clock_enable = "ena1";
defparam ram_block1a4.data_interleave_offset_in_bits = 1;
defparam ram_block1a4.data_interleave_width_in_bits = 1;
defparam ram_block1a4.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a4.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a4.operation_mode = "dual_port";
defparam ram_block1a4.port_a_address_clear = "none";
defparam ram_block1a4.port_a_address_width = 9;
defparam ram_block1a4.port_a_data_out_clear = "none";
defparam ram_block1a4.port_a_data_out_clock = "none";
defparam ram_block1a4.port_a_data_width = 1;
defparam ram_block1a4.port_a_first_address = 0;
defparam ram_block1a4.port_a_first_bit_number = 4;
defparam ram_block1a4.port_a_last_address = 511;
defparam ram_block1a4.port_a_logical_ram_depth = 512;
defparam ram_block1a4.port_a_logical_ram_width = 8;
defparam ram_block1a4.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.port_b_address_clear = "none";
defparam ram_block1a4.port_b_address_clock = "clock1";
defparam ram_block1a4.port_b_address_width = 9;
defparam ram_block1a4.port_b_data_out_clear = "none";
defparam ram_block1a4.port_b_data_out_clock = "clock1";
defparam ram_block1a4.port_b_data_width = 1;
defparam ram_block1a4.port_b_first_address = 0;
defparam ram_block1a4.port_b_first_bit_number = 4;
defparam ram_block1a4.port_b_last_address = 511;
defparam ram_block1a4.port_b_logical_ram_depth = 512;
defparam ram_block1a4.port_b_logical_ram_width = 8;
defparam ram_block1a4.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.port_b_read_enable_clock = "clock1";
defparam ram_block1a4.ram_block_type = "auto";

cycloneive_ram_block ram_block1a5(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[5]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a5_PORTBDATAOUT_bus));
defparam ram_block1a5.clk0_core_clock_enable = "ena0";
defparam ram_block1a5.clk1_core_clock_enable = "ena1";
defparam ram_block1a5.clk1_input_clock_enable = "ena1";
defparam ram_block1a5.clk1_output_clock_enable = "ena1";
defparam ram_block1a5.data_interleave_offset_in_bits = 1;
defparam ram_block1a5.data_interleave_width_in_bits = 1;
defparam ram_block1a5.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a5.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a5.operation_mode = "dual_port";
defparam ram_block1a5.port_a_address_clear = "none";
defparam ram_block1a5.port_a_address_width = 9;
defparam ram_block1a5.port_a_data_out_clear = "none";
defparam ram_block1a5.port_a_data_out_clock = "none";
defparam ram_block1a5.port_a_data_width = 1;
defparam ram_block1a5.port_a_first_address = 0;
defparam ram_block1a5.port_a_first_bit_number = 5;
defparam ram_block1a5.port_a_last_address = 511;
defparam ram_block1a5.port_a_logical_ram_depth = 512;
defparam ram_block1a5.port_a_logical_ram_width = 8;
defparam ram_block1a5.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.port_b_address_clear = "none";
defparam ram_block1a5.port_b_address_clock = "clock1";
defparam ram_block1a5.port_b_address_width = 9;
defparam ram_block1a5.port_b_data_out_clear = "none";
defparam ram_block1a5.port_b_data_out_clock = "clock1";
defparam ram_block1a5.port_b_data_width = 1;
defparam ram_block1a5.port_b_first_address = 0;
defparam ram_block1a5.port_b_first_bit_number = 5;
defparam ram_block1a5.port_b_last_address = 511;
defparam ram_block1a5.port_b_logical_ram_depth = 512;
defparam ram_block1a5.port_b_logical_ram_width = 8;
defparam ram_block1a5.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.port_b_read_enable_clock = "clock1";
defparam ram_block1a5.ram_block_type = "auto";

cycloneive_ram_block ram_block1a6(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[6]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a6_PORTBDATAOUT_bus));
defparam ram_block1a6.clk0_core_clock_enable = "ena0";
defparam ram_block1a6.clk1_core_clock_enable = "ena1";
defparam ram_block1a6.clk1_input_clock_enable = "ena1";
defparam ram_block1a6.clk1_output_clock_enable = "ena1";
defparam ram_block1a6.data_interleave_offset_in_bits = 1;
defparam ram_block1a6.data_interleave_width_in_bits = 1;
defparam ram_block1a6.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a6.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a6.operation_mode = "dual_port";
defparam ram_block1a6.port_a_address_clear = "none";
defparam ram_block1a6.port_a_address_width = 9;
defparam ram_block1a6.port_a_data_out_clear = "none";
defparam ram_block1a6.port_a_data_out_clock = "none";
defparam ram_block1a6.port_a_data_width = 1;
defparam ram_block1a6.port_a_first_address = 0;
defparam ram_block1a6.port_a_first_bit_number = 6;
defparam ram_block1a6.port_a_last_address = 511;
defparam ram_block1a6.port_a_logical_ram_depth = 512;
defparam ram_block1a6.port_a_logical_ram_width = 8;
defparam ram_block1a6.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.port_b_address_clear = "none";
defparam ram_block1a6.port_b_address_clock = "clock1";
defparam ram_block1a6.port_b_address_width = 9;
defparam ram_block1a6.port_b_data_out_clear = "none";
defparam ram_block1a6.port_b_data_out_clock = "clock1";
defparam ram_block1a6.port_b_data_width = 1;
defparam ram_block1a6.port_b_first_address = 0;
defparam ram_block1a6.port_b_first_bit_number = 6;
defparam ram_block1a6.port_b_last_address = 511;
defparam ram_block1a6.port_b_logical_ram_depth = 512;
defparam ram_block1a6.port_b_logical_ram_width = 8;
defparam ram_block1a6.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.port_b_read_enable_clock = "clock1";
defparam ram_block1a6.ram_block_type = "auto";

cycloneive_ram_block ram_block1a7(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[7]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a7_PORTBDATAOUT_bus));
defparam ram_block1a7.clk0_core_clock_enable = "ena0";
defparam ram_block1a7.clk1_core_clock_enable = "ena1";
defparam ram_block1a7.clk1_input_clock_enable = "ena1";
defparam ram_block1a7.clk1_output_clock_enable = "ena1";
defparam ram_block1a7.data_interleave_offset_in_bits = 1;
defparam ram_block1a7.data_interleave_width_in_bits = 1;
defparam ram_block1a7.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_34|altsyncram_mj43:auto_generated|ALTSYNCRAM";
defparam ram_block1a7.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a7.operation_mode = "dual_port";
defparam ram_block1a7.port_a_address_clear = "none";
defparam ram_block1a7.port_a_address_width = 9;
defparam ram_block1a7.port_a_data_out_clear = "none";
defparam ram_block1a7.port_a_data_out_clock = "none";
defparam ram_block1a7.port_a_data_width = 1;
defparam ram_block1a7.port_a_first_address = 0;
defparam ram_block1a7.port_a_first_bit_number = 7;
defparam ram_block1a7.port_a_last_address = 511;
defparam ram_block1a7.port_a_logical_ram_depth = 512;
defparam ram_block1a7.port_a_logical_ram_width = 8;
defparam ram_block1a7.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.port_b_address_clear = "none";
defparam ram_block1a7.port_b_address_clock = "clock1";
defparam ram_block1a7.port_b_address_width = 9;
defparam ram_block1a7.port_b_data_out_clear = "none";
defparam ram_block1a7.port_b_data_out_clock = "clock1";
defparam ram_block1a7.port_b_data_width = 1;
defparam ram_block1a7.port_b_first_address = 0;
defparam ram_block1a7.port_b_first_bit_number = 7;
defparam ram_block1a7.port_b_last_address = 511;
defparam ram_block1a7.port_b_logical_ram_depth = 512;
defparam ram_block1a7.port_b_logical_ram_width = 8;
defparam ram_block1a7.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.port_b_read_enable_clock = "clock1";
defparam ram_block1a7.ram_block_type = "auto";

endmodule

module RS_DE_LANE_QUATUS_altsyncram_5 (
	q_b,
	address_a,
	wren_a,
	clocken1,
	address_b,
	data_a,
	clock1)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_b;
input 	[9:0] address_a;
input 	wren_a;
input 	clocken1;
input 	[9:0] address_b;
input 	[7:0] data_a;
input 	clock1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



RS_DE_LANE_QUATUS_altsyncram_4p43 auto_generated(
	.q_b({q_b[7],q_b[6],q_b[5],q_b[4],q_b[3],q_b[2],q_b[1],q_b[0]}),
	.address_a({address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.wren_a(wren_a),
	.clocken1(clocken1),
	.address_b({address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.data_a({data_a[7],data_a[6],data_a[5],data_a[4],data_a[3],data_a[2],data_a[1],data_a[0]}),
	.clock1(clock1),
	.clock0(clock1));

endmodule

module RS_DE_LANE_QUATUS_altsyncram_4p43 (
	q_b,
	address_a,
	wren_a,
	clocken1,
	address_b,
	data_a,
	clock1,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[7:0] q_b;
input 	[9:0] address_a;
input 	wren_a;
input 	clocken1;
input 	[9:0] address_b;
input 	[7:0] data_a;
input 	clock1;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a0_PORTBDATAOUT_bus;
wire [143:0] ram_block1a1_PORTBDATAOUT_bus;
wire [143:0] ram_block1a2_PORTBDATAOUT_bus;
wire [143:0] ram_block1a3_PORTBDATAOUT_bus;
wire [143:0] ram_block1a4_PORTBDATAOUT_bus;
wire [143:0] ram_block1a5_PORTBDATAOUT_bus;
wire [143:0] ram_block1a6_PORTBDATAOUT_bus;
wire [143:0] ram_block1a7_PORTBDATAOUT_bus;

assign q_b[0] = ram_block1a0_PORTBDATAOUT_bus[0];

assign q_b[1] = ram_block1a1_PORTBDATAOUT_bus[0];

assign q_b[2] = ram_block1a2_PORTBDATAOUT_bus[0];

assign q_b[3] = ram_block1a3_PORTBDATAOUT_bus[0];

assign q_b[4] = ram_block1a4_PORTBDATAOUT_bus[0];

assign q_b[5] = ram_block1a5_PORTBDATAOUT_bus[0];

assign q_b[6] = ram_block1a6_PORTBDATAOUT_bus[0];

assign q_b[7] = ram_block1a7_PORTBDATAOUT_bus[0];

cycloneive_ram_block ram_block1a0(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[0]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a0_PORTBDATAOUT_bus));
defparam ram_block1a0.clk0_core_clock_enable = "ena0";
defparam ram_block1a0.clk1_core_clock_enable = "ena1";
defparam ram_block1a0.clk1_input_clock_enable = "ena1";
defparam ram_block1a0.clk1_output_clock_enable = "ena1";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a0.operation_mode = "dual_port";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 10;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 1023;
defparam ram_block1a0.port_a_logical_ram_depth = 1024;
defparam ram_block1a0.port_a_logical_ram_width = 8;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_address_clear = "none";
defparam ram_block1a0.port_b_address_clock = "clock1";
defparam ram_block1a0.port_b_address_width = 10;
defparam ram_block1a0.port_b_data_out_clear = "none";
defparam ram_block1a0.port_b_data_out_clock = "clock1";
defparam ram_block1a0.port_b_data_width = 1;
defparam ram_block1a0.port_b_first_address = 0;
defparam ram_block1a0.port_b_first_bit_number = 0;
defparam ram_block1a0.port_b_last_address = 1023;
defparam ram_block1a0.port_b_logical_ram_depth = 1024;
defparam ram_block1a0.port_b_logical_ram_width = 8;
defparam ram_block1a0.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_read_enable_clock = "clock1";
defparam ram_block1a0.ram_block_type = "auto";

cycloneive_ram_block ram_block1a1(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[1]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a1_PORTBDATAOUT_bus));
defparam ram_block1a1.clk0_core_clock_enable = "ena0";
defparam ram_block1a1.clk1_core_clock_enable = "ena1";
defparam ram_block1a1.clk1_input_clock_enable = "ena1";
defparam ram_block1a1.clk1_output_clock_enable = "ena1";
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a1.operation_mode = "dual_port";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 10;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 1023;
defparam ram_block1a1.port_a_logical_ram_depth = 1024;
defparam ram_block1a1.port_a_logical_ram_width = 8;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_address_clear = "none";
defparam ram_block1a1.port_b_address_clock = "clock1";
defparam ram_block1a1.port_b_address_width = 10;
defparam ram_block1a1.port_b_data_out_clear = "none";
defparam ram_block1a1.port_b_data_out_clock = "clock1";
defparam ram_block1a1.port_b_data_width = 1;
defparam ram_block1a1.port_b_first_address = 0;
defparam ram_block1a1.port_b_first_bit_number = 1;
defparam ram_block1a1.port_b_last_address = 1023;
defparam ram_block1a1.port_b_logical_ram_depth = 1024;
defparam ram_block1a1.port_b_logical_ram_width = 8;
defparam ram_block1a1.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_read_enable_clock = "clock1";
defparam ram_block1a1.ram_block_type = "auto";

cycloneive_ram_block ram_block1a2(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[2]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a2_PORTBDATAOUT_bus));
defparam ram_block1a2.clk0_core_clock_enable = "ena0";
defparam ram_block1a2.clk1_core_clock_enable = "ena1";
defparam ram_block1a2.clk1_input_clock_enable = "ena1";
defparam ram_block1a2.clk1_output_clock_enable = "ena1";
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a2.operation_mode = "dual_port";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 10;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 1023;
defparam ram_block1a2.port_a_logical_ram_depth = 1024;
defparam ram_block1a2.port_a_logical_ram_width = 8;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_address_clear = "none";
defparam ram_block1a2.port_b_address_clock = "clock1";
defparam ram_block1a2.port_b_address_width = 10;
defparam ram_block1a2.port_b_data_out_clear = "none";
defparam ram_block1a2.port_b_data_out_clock = "clock1";
defparam ram_block1a2.port_b_data_width = 1;
defparam ram_block1a2.port_b_first_address = 0;
defparam ram_block1a2.port_b_first_bit_number = 2;
defparam ram_block1a2.port_b_last_address = 1023;
defparam ram_block1a2.port_b_logical_ram_depth = 1024;
defparam ram_block1a2.port_b_logical_ram_width = 8;
defparam ram_block1a2.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_read_enable_clock = "clock1";
defparam ram_block1a2.ram_block_type = "auto";

cycloneive_ram_block ram_block1a3(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[3]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a3_PORTBDATAOUT_bus));
defparam ram_block1a3.clk0_core_clock_enable = "ena0";
defparam ram_block1a3.clk1_core_clock_enable = "ena1";
defparam ram_block1a3.clk1_input_clock_enable = "ena1";
defparam ram_block1a3.clk1_output_clock_enable = "ena1";
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a3.operation_mode = "dual_port";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 10;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 1023;
defparam ram_block1a3.port_a_logical_ram_depth = 1024;
defparam ram_block1a3.port_a_logical_ram_width = 8;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_address_clear = "none";
defparam ram_block1a3.port_b_address_clock = "clock1";
defparam ram_block1a3.port_b_address_width = 10;
defparam ram_block1a3.port_b_data_out_clear = "none";
defparam ram_block1a3.port_b_data_out_clock = "clock1";
defparam ram_block1a3.port_b_data_width = 1;
defparam ram_block1a3.port_b_first_address = 0;
defparam ram_block1a3.port_b_first_bit_number = 3;
defparam ram_block1a3.port_b_last_address = 1023;
defparam ram_block1a3.port_b_logical_ram_depth = 1024;
defparam ram_block1a3.port_b_logical_ram_width = 8;
defparam ram_block1a3.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_read_enable_clock = "clock1";
defparam ram_block1a3.ram_block_type = "auto";

cycloneive_ram_block ram_block1a4(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[4]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a4_PORTBDATAOUT_bus));
defparam ram_block1a4.clk0_core_clock_enable = "ena0";
defparam ram_block1a4.clk1_core_clock_enable = "ena1";
defparam ram_block1a4.clk1_input_clock_enable = "ena1";
defparam ram_block1a4.clk1_output_clock_enable = "ena1";
defparam ram_block1a4.data_interleave_offset_in_bits = 1;
defparam ram_block1a4.data_interleave_width_in_bits = 1;
defparam ram_block1a4.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a4.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a4.operation_mode = "dual_port";
defparam ram_block1a4.port_a_address_clear = "none";
defparam ram_block1a4.port_a_address_width = 10;
defparam ram_block1a4.port_a_data_out_clear = "none";
defparam ram_block1a4.port_a_data_out_clock = "none";
defparam ram_block1a4.port_a_data_width = 1;
defparam ram_block1a4.port_a_first_address = 0;
defparam ram_block1a4.port_a_first_bit_number = 4;
defparam ram_block1a4.port_a_last_address = 1023;
defparam ram_block1a4.port_a_logical_ram_depth = 1024;
defparam ram_block1a4.port_a_logical_ram_width = 8;
defparam ram_block1a4.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.port_b_address_clear = "none";
defparam ram_block1a4.port_b_address_clock = "clock1";
defparam ram_block1a4.port_b_address_width = 10;
defparam ram_block1a4.port_b_data_out_clear = "none";
defparam ram_block1a4.port_b_data_out_clock = "clock1";
defparam ram_block1a4.port_b_data_width = 1;
defparam ram_block1a4.port_b_first_address = 0;
defparam ram_block1a4.port_b_first_bit_number = 4;
defparam ram_block1a4.port_b_last_address = 1023;
defparam ram_block1a4.port_b_logical_ram_depth = 1024;
defparam ram_block1a4.port_b_logical_ram_width = 8;
defparam ram_block1a4.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a4.port_b_read_enable_clock = "clock1";
defparam ram_block1a4.ram_block_type = "auto";

cycloneive_ram_block ram_block1a5(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[5]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a5_PORTBDATAOUT_bus));
defparam ram_block1a5.clk0_core_clock_enable = "ena0";
defparam ram_block1a5.clk1_core_clock_enable = "ena1";
defparam ram_block1a5.clk1_input_clock_enable = "ena1";
defparam ram_block1a5.clk1_output_clock_enable = "ena1";
defparam ram_block1a5.data_interleave_offset_in_bits = 1;
defparam ram_block1a5.data_interleave_width_in_bits = 1;
defparam ram_block1a5.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a5.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a5.operation_mode = "dual_port";
defparam ram_block1a5.port_a_address_clear = "none";
defparam ram_block1a5.port_a_address_width = 10;
defparam ram_block1a5.port_a_data_out_clear = "none";
defparam ram_block1a5.port_a_data_out_clock = "none";
defparam ram_block1a5.port_a_data_width = 1;
defparam ram_block1a5.port_a_first_address = 0;
defparam ram_block1a5.port_a_first_bit_number = 5;
defparam ram_block1a5.port_a_last_address = 1023;
defparam ram_block1a5.port_a_logical_ram_depth = 1024;
defparam ram_block1a5.port_a_logical_ram_width = 8;
defparam ram_block1a5.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.port_b_address_clear = "none";
defparam ram_block1a5.port_b_address_clock = "clock1";
defparam ram_block1a5.port_b_address_width = 10;
defparam ram_block1a5.port_b_data_out_clear = "none";
defparam ram_block1a5.port_b_data_out_clock = "clock1";
defparam ram_block1a5.port_b_data_width = 1;
defparam ram_block1a5.port_b_first_address = 0;
defparam ram_block1a5.port_b_first_bit_number = 5;
defparam ram_block1a5.port_b_last_address = 1023;
defparam ram_block1a5.port_b_logical_ram_depth = 1024;
defparam ram_block1a5.port_b_logical_ram_width = 8;
defparam ram_block1a5.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a5.port_b_read_enable_clock = "clock1";
defparam ram_block1a5.ram_block_type = "auto";

cycloneive_ram_block ram_block1a6(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[6]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a6_PORTBDATAOUT_bus));
defparam ram_block1a6.clk0_core_clock_enable = "ena0";
defparam ram_block1a6.clk1_core_clock_enable = "ena1";
defparam ram_block1a6.clk1_input_clock_enable = "ena1";
defparam ram_block1a6.clk1_output_clock_enable = "ena1";
defparam ram_block1a6.data_interleave_offset_in_bits = 1;
defparam ram_block1a6.data_interleave_width_in_bits = 1;
defparam ram_block1a6.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a6.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a6.operation_mode = "dual_port";
defparam ram_block1a6.port_a_address_clear = "none";
defparam ram_block1a6.port_a_address_width = 10;
defparam ram_block1a6.port_a_data_out_clear = "none";
defparam ram_block1a6.port_a_data_out_clock = "none";
defparam ram_block1a6.port_a_data_width = 1;
defparam ram_block1a6.port_a_first_address = 0;
defparam ram_block1a6.port_a_first_bit_number = 6;
defparam ram_block1a6.port_a_last_address = 1023;
defparam ram_block1a6.port_a_logical_ram_depth = 1024;
defparam ram_block1a6.port_a_logical_ram_width = 8;
defparam ram_block1a6.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.port_b_address_clear = "none";
defparam ram_block1a6.port_b_address_clock = "clock1";
defparam ram_block1a6.port_b_address_width = 10;
defparam ram_block1a6.port_b_data_out_clear = "none";
defparam ram_block1a6.port_b_data_out_clock = "clock1";
defparam ram_block1a6.port_b_data_width = 1;
defparam ram_block1a6.port_b_first_address = 0;
defparam ram_block1a6.port_b_first_bit_number = 6;
defparam ram_block1a6.port_b_last_address = 1023;
defparam ram_block1a6.port_b_logical_ram_depth = 1024;
defparam ram_block1a6.port_b_logical_ram_width = 8;
defparam ram_block1a6.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a6.port_b_read_enable_clock = "clock1";
defparam ram_block1a6.ram_block_type = "auto";

cycloneive_ram_block ram_block1a7(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock1),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[7]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_a[9],address_a[8],address_a[7],address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,address_b[9],address_b[8],address_b[7],address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a7_PORTBDATAOUT_bus));
defparam ram_block1a7.clk0_core_clock_enable = "ena0";
defparam ram_block1a7.clk1_core_clock_enable = "ena1";
defparam ram_block1a7.clk1_input_clock_enable = "ena1";
defparam ram_block1a7.clk1_output_clock_enable = "ena1";
defparam ram_block1a7.data_interleave_offset_in_bits = 1;
defparam ram_block1a7.data_interleave_width_in_bits = 1;
defparam ram_block1a7.logical_ram_name = "auk_rs_dec_top_atl:auk_rs_dec_top_atl_inst|auk_rs_mem_atl:mem_ctrl|altsyncram:RAM_DP_err_value|altsyncram_4p43:auto_generated|ALTSYNCRAM";
defparam ram_block1a7.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a7.operation_mode = "dual_port";
defparam ram_block1a7.port_a_address_clear = "none";
defparam ram_block1a7.port_a_address_width = 10;
defparam ram_block1a7.port_a_data_out_clear = "none";
defparam ram_block1a7.port_a_data_out_clock = "none";
defparam ram_block1a7.port_a_data_width = 1;
defparam ram_block1a7.port_a_first_address = 0;
defparam ram_block1a7.port_a_first_bit_number = 7;
defparam ram_block1a7.port_a_last_address = 1023;
defparam ram_block1a7.port_a_logical_ram_depth = 1024;
defparam ram_block1a7.port_a_logical_ram_width = 8;
defparam ram_block1a7.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.port_b_address_clear = "none";
defparam ram_block1a7.port_b_address_clock = "clock1";
defparam ram_block1a7.port_b_address_width = 10;
defparam ram_block1a7.port_b_data_out_clear = "none";
defparam ram_block1a7.port_b_data_out_clock = "clock1";
defparam ram_block1a7.port_b_data_width = 1;
defparam ram_block1a7.port_b_first_address = 0;
defparam ram_block1a7.port_b_first_bit_number = 7;
defparam ram_block1a7.port_b_last_address = 1023;
defparam ram_block1a7.port_b_logical_ram_depth = 1024;
defparam ram_block1a7.port_b_logical_ram_width = 8;
defparam ram_block1a7.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a7.port_b_read_enable_clock = "clock1";
defparam ram_block1a7.ram_block_type = "auto";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_syn_atl (
	ena,
	rsin_q_1,
	rsin_q_2,
	rsin_q_3,
	rsin_q_4,
	rsin_q_5,
	rsin_q_6,
	rsin_q_7,
	rsin_q_8,
	sink_sop_q,
	syn_8_1,
	syn_7_1,
	syn_6_1,
	syn_5_1,
	syn_4_1,
	syn_3_1,
	syn_2_1,
	syn_1_1,
	synin,
	syn_8_8,
	synin1,
	syn_5_8,
	syn_4_8,
	syn_3_8,
	syn_1_8,
	synin2,
	syn_7_3,
	syn_7_6,
	syn_8_3,
	synin3,
	syn_6_3,
	syn_6_6,
	syn_5_3,
	synin4,
	syn_4_3,
	syn_4_6,
	syn_3_3,
	synin5,
	syn_1_3,
	syn_1_6,
	syn_2_3,
	syn_2_6,
	syn_7_2,
	syn_7_7,
	syn_8_2,
	syn_8_7,
	syn_6_2,
	syn_6_7,
	syn_5_2,
	syn_5_7,
	syn_4_2,
	syn_4_7,
	syn_3_2,
	syn_3_7,
	syn_1_2,
	syn_1_7,
	syn_2_2,
	syn_2_7,
	syn_7_4,
	synin6,
	syn_8_4,
	syn_8_5,
	syn_6_4,
	syn_6_5,
	syn_5_4,
	syn_5_5,
	syn_4_4,
	synin7,
	syn_3_4,
	syn_3_5,
	syn_1_4,
	syn_1_5,
	syn_2_4,
	syn_2_5,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
input 	ena;
input 	rsin_q_1;
input 	rsin_q_2;
input 	rsin_q_3;
input 	rsin_q_4;
input 	rsin_q_5;
input 	rsin_q_6;
input 	rsin_q_7;
input 	rsin_q_8;
input 	sink_sop_q;
output 	syn_8_1;
output 	syn_7_1;
output 	syn_6_1;
output 	syn_5_1;
output 	syn_4_1;
output 	syn_3_1;
output 	syn_2_1;
output 	syn_1_1;
output 	synin;
output 	syn_8_8;
output 	synin1;
output 	syn_5_8;
output 	syn_4_8;
output 	syn_3_8;
output 	syn_1_8;
output 	synin2;
output 	syn_7_3;
output 	syn_7_6;
output 	syn_8_3;
output 	synin3;
output 	syn_6_3;
output 	syn_6_6;
output 	syn_5_3;
output 	synin4;
output 	syn_4_3;
output 	syn_4_6;
output 	syn_3_3;
output 	synin5;
output 	syn_1_3;
output 	syn_1_6;
output 	syn_2_3;
output 	syn_2_6;
output 	syn_7_2;
output 	syn_7_7;
output 	syn_8_2;
output 	syn_8_7;
output 	syn_6_2;
output 	syn_6_7;
output 	syn_5_2;
output 	syn_5_7;
output 	syn_4_2;
output 	syn_4_7;
output 	syn_3_2;
output 	syn_3_7;
output 	syn_1_2;
output 	syn_1_7;
output 	syn_2_2;
output 	syn_2_7;
output 	syn_7_4;
output 	synin6;
output 	syn_8_4;
output 	syn_8_5;
output 	syn_6_4;
output 	syn_6_5;
output 	syn_5_4;
output 	syn_5_5;
output 	syn_4_4;
output 	synin7;
output 	syn_3_4;
output 	syn_3_5;
output 	syn_1_4;
output 	syn_1_5;
output 	syn_2_4;
output 	syn_2_5;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \reg_q[8][1]~q ;
wire \g1:8:gf_mul1|c[8]~0_combout ;
wire \reg_q[8][2]~q ;
wire \g1:8:gf_mul1|c[5]~1_combout ;
wire \g1:8:gf_mul1|c[4]~2_combout ;
wire \g1:8:gf_mul1|c[1]~3_combout ;
wire \reg_q[6][2]~q ;
wire \g1:6:gf_mul1|c[7]~0_combout ;
wire \reg_q[6][1]~q ;
wire \g1:6:gf_mul1|c[6]~1_combout ;
wire \g1:3:gf_mul1|c[4]~0_combout ;
wire \g1:6:gf_mul1|c[4]~2_combout ;
wire \reg_q[7][7]~q ;
wire \reg_q[7][1]~q ;
wire \g1:7:gf_mul1|c[7]~0_combout ;
wire \reg_q[7][2]~q ;
wire \g1:7:gf_mul1|c[8]~1_combout ;
wire \g1:7:gf_mul1|c[5]~2_combout ;
wire \g1:7:gf_mul1|c[4]~3_combout ;
wire \g1:7:gf_mul1|c[1]~4_combout ;
wire \reg_q[5][2]~q ;
wire \g1:5:gf_mul1|c[6]~0_combout ;
wire \reg_q[4][2]~q ;
wire \g1:4:gf_mul1|c[5]~0_combout ;
wire \reg_q[5][1]~q ;
wire \g1:5:gf_mul1|c[5]~1_combout ;
wire \syn[8][2]~combout ;
wire \reg_q[1][8]~q ;
wire \reg_q[1][7]~q ;
wire \reg_q[1][6]~q ;
wire \reg_q[1][5]~q ;
wire \reg_q[1][4]~q ;
wire \reg_q[1][3]~q ;
wire \reg_q[1][2]~q ;
wire \reg_q[1][1]~q ;
wire \syn[8][6]~combout ;
wire \reg_q[8][6]~q ;
wire \reg_q[8][5]~q ;
wire \reg_q[8][4]~q ;
wire \reg_q[8][3]~q ;
wire \reg_q[8][8]~q ;
wire \syn[8][7]~combout ;
wire \reg_q[8][7]~q ;
wire \reg_q[3][5]~q ;
wire \reg_q[3][6]~q ;
wire \syn[6][8]~combout ;
wire \reg_q[6][8]~q ;
wire \reg_q[6][7]~q ;
wire \syn[6][3]~combout ;
wire \reg_q[6][3]~q ;
wire \reg_q[3][8]~q ;
wire \reg_q[3][4]~q ;
wire \reg_q[3][3]~q ;
wire \reg_q[6][4]~q ;
wire \reg_q[6][6]~q ;
wire \syn[6][5]~combout ;
wire \reg_q[6][5]~q ;
wire \reg_q[3][2]~q ;
wire \reg_q[3][7]~q ;
wire \reg_q[3][1]~q ;
wire \reg_q[2][6]~q ;
wire \reg_q[2][7]~q ;
wire \reg_q[2][5]~q ;
wire \reg_q[7][6]~q ;
wire \reg_q[2][8]~q ;
wire \reg_q[2][4]~q ;
wire \reg_q[7][3]~q ;
wire \reg_q[2][3]~q ;
wire \reg_q[2][2]~q ;
wire \reg_q[7][5]~q ;
wire \reg_q[2][1]~q ;
wire \reg_q[7][8]~q ;
wire \reg_q[7][4]~q ;
wire \reg_q[4][8]~q ;
wire \reg_q[4][4]~q ;
wire \reg_q[5][8]~q ;
wire \syn[5][7]~combout ;
wire \reg_q[5][7]~q ;
wire \reg_q[5][3]~q ;
wire \reg_q[4][5]~q ;
wire \syn[5][4]~combout ;
wire \reg_q[5][4]~q ;
wire \reg_q[4][7]~q ;
wire \reg_q[4][3]~q ;
wire \synin~7_combout ;
wire \reg_q[4][6]~q ;
wire \reg_q[4][1]~q ;
wire \synin~8_combout ;
wire \reg_q[5][5]~q ;
wire \reg_q[5][6]~q ;


RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_14 \g1:8:gf_mul1 (
	.reg_q_6_8(\reg_q[8][6]~q ),
	.reg_q_5_8(\reg_q[8][5]~q ),
	.reg_q_4_8(\reg_q[8][4]~q ),
	.reg_q_7_8(\reg_q[8][7]~q ),
	.reg_q_1_8(\reg_q[8][1]~q ),
	.c_8(\g1:8:gf_mul1|c[8]~0_combout ),
	.reg_q_3_8(\reg_q[8][3]~q ),
	.reg_q_8_8(\reg_q[8][8]~q ),
	.reg_q_2_8(\reg_q[8][2]~q ),
	.c_5(\g1:8:gf_mul1|c[5]~1_combout ),
	.c_4(\g1:8:gf_mul1|c[4]~2_combout ),
	.c_1(\g1:8:gf_mul1|c[1]~3_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_13 \g1:7:gf_mul1 (
	.reg_q_7_7(\reg_q[7][7]~q ),
	.reg_q_6_7(\reg_q[7][6]~q ),
	.reg_q_5_7(\reg_q[7][5]~q ),
	.reg_q_1_7(\reg_q[7][1]~q ),
	.c_7(\g1:7:gf_mul1|c[7]~0_combout ),
	.reg_q_8_7(\reg_q[7][8]~q ),
	.reg_q_2_7(\reg_q[7][2]~q ),
	.c_8(\g1:7:gf_mul1|c[8]~1_combout ),
	.reg_q_4_7(\reg_q[7][4]~q ),
	.c_5(\g1:7:gf_mul1|c[5]~2_combout ),
	.reg_q_3_7(\reg_q[7][3]~q ),
	.c_4(\g1:7:gf_mul1|c[4]~3_combout ),
	.c_1(\g1:7:gf_mul1|c[1]~4_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_12 \g1:6:gf_mul1 (
	.reg_q_8_6(\reg_q[6][8]~q ),
	.reg_q_6_6(\reg_q[6][6]~q ),
	.reg_q_7_6(\reg_q[6][7]~q ),
	.reg_q_2_6(\reg_q[6][2]~q ),
	.c_7(\g1:6:gf_mul1|c[7]~0_combout ),
	.reg_q_5_6(\reg_q[6][5]~q ),
	.reg_q_1_6(\reg_q[6][1]~q ),
	.c_6(\g1:6:gf_mul1|c[6]~1_combout ),
	.reg_q_4_6(\reg_q[6][4]~q ),
	.c_4(\g1:6:gf_mul1|c[4]~2_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_11 \g1:5:gf_mul1 (
	.reg_q_8_5(\reg_q[5][8]~q ),
	.reg_q_7_5(\reg_q[5][7]~q ),
	.reg_q_6_5(\reg_q[5][6]~q ),
	.reg_q_2_5(\reg_q[5][2]~q ),
	.c_6(\g1:5:gf_mul1|c[6]~0_combout ),
	.reg_q_5_5(\reg_q[5][5]~q ),
	.reg_q_1_5(\reg_q[5][1]~q ),
	.c_5(\g1:5:gf_mul1|c[5]~1_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_10 \g1:4:gf_mul1 (
	.reg_q_8_4(\reg_q[4][8]~q ),
	.reg_q_7_4(\reg_q[4][7]~q ),
	.reg_q_6_4(\reg_q[4][6]~q ),
	.reg_q_2_4(\reg_q[4][2]~q ),
	.c_5(\g1:4:gf_mul1|c[5]~0_combout ));

RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_9 \g1:3:gf_mul1 (
	.reg_q_8_3(\reg_q[3][8]~q ),
	.reg_q_7_3(\reg_q[3][7]~q ),
	.c_4(\g1:3:gf_mul1|c[4]~0_combout ));

dffeas \reg_q[8][1] (
	.clk(clk),
	.d(syn_1_8),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][1]~q ),
	.prn(vcc));
defparam \reg_q[8][1] .is_wysiwyg = "true";
defparam \reg_q[8][1] .power_up = "low";

dffeas \reg_q[8][2] (
	.clk(clk),
	.d(\syn[8][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][2]~q ),
	.prn(vcc));
defparam \reg_q[8][2] .is_wysiwyg = "true";
defparam \reg_q[8][2] .power_up = "low";

dffeas \reg_q[6][2] (
	.clk(clk),
	.d(syn_2_6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][2]~q ),
	.prn(vcc));
defparam \reg_q[6][2] .is_wysiwyg = "true";
defparam \reg_q[6][2] .power_up = "low";

dffeas \reg_q[6][1] (
	.clk(clk),
	.d(syn_1_6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][1]~q ),
	.prn(vcc));
defparam \reg_q[6][1] .is_wysiwyg = "true";
defparam \reg_q[6][1] .power_up = "low";

dffeas \reg_q[7][7] (
	.clk(clk),
	.d(syn_7_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][7]~q ),
	.prn(vcc));
defparam \reg_q[7][7] .is_wysiwyg = "true";
defparam \reg_q[7][7] .power_up = "low";

dffeas \reg_q[7][1] (
	.clk(clk),
	.d(syn_1_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][1]~q ),
	.prn(vcc));
defparam \reg_q[7][1] .is_wysiwyg = "true";
defparam \reg_q[7][1] .power_up = "low";

dffeas \reg_q[7][2] (
	.clk(clk),
	.d(syn_2_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][2]~q ),
	.prn(vcc));
defparam \reg_q[7][2] .is_wysiwyg = "true";
defparam \reg_q[7][2] .power_up = "low";

dffeas \reg_q[5][2] (
	.clk(clk),
	.d(syn_2_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][2]~q ),
	.prn(vcc));
defparam \reg_q[5][2] .is_wysiwyg = "true";
defparam \reg_q[5][2] .power_up = "low";

dffeas \reg_q[4][2] (
	.clk(clk),
	.d(syn_2_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][2]~q ),
	.prn(vcc));
defparam \reg_q[4][2] .is_wysiwyg = "true";
defparam \reg_q[4][2] .power_up = "low";

dffeas \reg_q[5][1] (
	.clk(clk),
	.d(syn_1_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][1]~q ),
	.prn(vcc));
defparam \reg_q[5][1] .is_wysiwyg = "true";
defparam \reg_q[5][1] .power_up = "low";

cycloneive_lcell_comb \syn[8][2] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_2),
	.datad(synin2),
	.cin(gnd),
	.combout(\syn[8][2]~combout ),
	.cout());
defparam \syn[8][2] .lut_mask = 16'h0FF0;
defparam \syn[8][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][8]~q ),
	.cin(gnd),
	.combout(syn_8_1),
	.cout());
defparam \syn[1][8] .lut_mask = 16'h9966;
defparam \syn[1][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][7] (
	.dataa(rsin_q_7),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][7]~q ),
	.cin(gnd),
	.combout(syn_7_1),
	.cout());
defparam \syn[1][7] .lut_mask = 16'h9966;
defparam \syn[1][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][6] (
	.dataa(rsin_q_6),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][6]~q ),
	.cin(gnd),
	.combout(syn_6_1),
	.cout());
defparam \syn[1][6] .lut_mask = 16'h9966;
defparam \syn[1][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][5]~q ),
	.cin(gnd),
	.combout(syn_5_1),
	.cout());
defparam \syn[1][5] .lut_mask = 16'h9966;
defparam \syn[1][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][4] (
	.dataa(rsin_q_4),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][4]~q ),
	.cin(gnd),
	.combout(syn_4_1),
	.cout());
defparam \syn[1][4] .lut_mask = 16'h9966;
defparam \syn[1][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][3]~q ),
	.cin(gnd),
	.combout(syn_3_1),
	.cout());
defparam \syn[1][3] .lut_mask = 16'h9966;
defparam \syn[1][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][2]~q ),
	.cin(gnd),
	.combout(syn_2_1),
	.cout());
defparam \syn[1][2] .lut_mask = 16'h9966;
defparam \syn[1][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[1][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[1][1]~q ),
	.cin(gnd),
	.combout(syn_1_1),
	.cout());
defparam \syn[1][1] .lut_mask = 16'h9966;
defparam \syn[1][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~0 (
	.dataa(\reg_q[8][6]~q ),
	.datab(\reg_q[8][5]~q ),
	.datac(\reg_q[8][4]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin),
	.cout());
defparam \synin~0 .lut_mask = 16'h96FF;
defparam \synin~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[8][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:8:gf_mul1|c[8]~0_combout ),
	.cin(gnd),
	.combout(syn_8_8),
	.cout());
defparam \syn[8][8] .lut_mask = 16'h9966;
defparam \syn[8][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~1 (
	.dataa(\reg_q[8][5]~q ),
	.datab(\reg_q[8][4]~q ),
	.datac(\reg_q[8][3]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin1),
	.cout());
defparam \synin~1 .lut_mask = 16'h96FF;
defparam \synin~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[8][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:8:gf_mul1|c[5]~1_combout ),
	.cin(gnd),
	.combout(syn_5_8),
	.cout());
defparam \syn[8][5] .lut_mask = 16'h9966;
defparam \syn[8][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[8][4] (
	.dataa(rsin_q_4),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:8:gf_mul1|c[4]~2_combout ),
	.cin(gnd),
	.combout(syn_4_8),
	.cout());
defparam \syn[8][4] .lut_mask = 16'h9966;
defparam \syn[8][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[8][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(\g1:8:gf_mul1|c[1]~3_combout ),
	.datad(\reg_q[8][4]~q ),
	.cin(gnd),
	.combout(syn_3_8),
	.cout());
defparam \syn[8][3] .lut_mask = 16'h6996;
defparam \syn[8][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[8][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(\reg_q[8][8]~q ),
	.datad(\g1:8:gf_mul1|c[1]~3_combout ),
	.cin(gnd),
	.combout(syn_1_8),
	.cout());
defparam \syn[8][1] .lut_mask = 16'h6996;
defparam \syn[8][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~2 (
	.dataa(\reg_q[8][8]~q ),
	.datab(\reg_q[8][7]~q ),
	.datac(\reg_q[8][3]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin2),
	.cout());
defparam \synin~2 .lut_mask = 16'h96FF;
defparam \synin~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][7] (
	.dataa(rsin_q_7),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[3][5]~q ),
	.cin(gnd),
	.combout(syn_7_3),
	.cout());
defparam \syn[3][7] .lut_mask = 16'h9966;
defparam \syn[3][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[6][7] (
	.dataa(rsin_q_7),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:6:gf_mul1|c[7]~0_combout ),
	.cin(gnd),
	.combout(syn_7_6),
	.cout());
defparam \syn[6][7] .lut_mask = 16'h9966;
defparam \syn[6][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[3][6]~q ),
	.cin(gnd),
	.combout(syn_8_3),
	.cout());
defparam \syn[3][8] .lut_mask = 16'h9966;
defparam \syn[3][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~3 (
	.dataa(\reg_q[6][8]~q ),
	.datab(\reg_q[6][7]~q ),
	.datac(\reg_q[6][3]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin3),
	.cout());
defparam \synin~3 .lut_mask = 16'h96FF;
defparam \synin~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][6] (
	.dataa(rsin_q_6),
	.datab(sink_sop_q),
	.datac(\reg_q[3][8]~q ),
	.datad(\reg_q[3][4]~q ),
	.cin(gnd),
	.combout(syn_6_3),
	.cout());
defparam \syn[3][6] .lut_mask = 16'h6996;
defparam \syn[3][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[6][6] (
	.dataa(rsin_q_6),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:6:gf_mul1|c[6]~1_combout ),
	.cin(gnd),
	.combout(syn_6_6),
	.cout());
defparam \syn[6][6] .lut_mask = 16'h9966;
defparam \syn[6][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(\reg_q[3][3]~q ),
	.datad(\g1:3:gf_mul1|c[4]~0_combout ),
	.cin(gnd),
	.combout(syn_5_3),
	.cout());
defparam \syn[3][5] .lut_mask = 16'h6996;
defparam \syn[3][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~4 (
	.dataa(\reg_q[6][4]~q ),
	.datab(\reg_q[6][6]~q ),
	.datac(\reg_q[6][5]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin4),
	.cout());
defparam \synin~4 .lut_mask = 16'h96FF;
defparam \synin~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][4] (
	.dataa(rsin_q_4),
	.datab(sink_sop_q),
	.datac(\g1:3:gf_mul1|c[4]~0_combout ),
	.datad(\reg_q[3][2]~q ),
	.cin(gnd),
	.combout(syn_4_3),
	.cout());
defparam \syn[3][4] .lut_mask = 16'h6996;
defparam \syn[3][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[6][4] (
	.dataa(rsin_q_4),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:6:gf_mul1|c[4]~2_combout ),
	.cin(gnd),
	.combout(syn_4_6),
	.cout());
defparam \syn[6][4] .lut_mask = 16'h9966;
defparam \syn[6][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(\reg_q[3][7]~q ),
	.datad(\reg_q[3][1]~q ),
	.cin(gnd),
	.combout(syn_3_3),
	.cout());
defparam \syn[3][3] .lut_mask = 16'h6996;
defparam \syn[3][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~5 (
	.dataa(\reg_q[6][8]~q ),
	.datab(\reg_q[6][4]~q ),
	.datac(\reg_q[6][6]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin5),
	.cout());
defparam \synin~5 .lut_mask = 16'h96FF;
defparam \synin~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[3][7]~q ),
	.cin(gnd),
	.combout(syn_1_3),
	.cout());
defparam \syn[3][1] .lut_mask = 16'h9966;
defparam \syn[3][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[6][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(\reg_q[6][8]~q ),
	.datad(\reg_q[6][4]~q ),
	.cin(gnd),
	.combout(syn_1_6),
	.cout());
defparam \syn[6][1] .lut_mask = 16'h6996;
defparam \syn[6][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[3][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[3][8]~q ),
	.cin(gnd),
	.combout(syn_2_3),
	.cout());
defparam \syn[3][2] .lut_mask = 16'h9966;
defparam \syn[3][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[6][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[6][5]~q ),
	.cin(gnd),
	.combout(syn_2_6),
	.cout());
defparam \syn[6][2] .lut_mask = 16'h9966;
defparam \syn[6][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][7] (
	.dataa(rsin_q_7),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[2][6]~q ),
	.cin(gnd),
	.combout(syn_7_2),
	.cout());
defparam \syn[2][7] .lut_mask = 16'h9966;
defparam \syn[2][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][7] (
	.dataa(rsin_q_7),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:7:gf_mul1|c[7]~0_combout ),
	.cin(gnd),
	.combout(syn_7_7),
	.cout());
defparam \syn[7][7] .lut_mask = 16'h9966;
defparam \syn[7][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[2][7]~q ),
	.cin(gnd),
	.combout(syn_8_2),
	.cout());
defparam \syn[2][8] .lut_mask = 16'h9966;
defparam \syn[2][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:7:gf_mul1|c[8]~1_combout ),
	.cin(gnd),
	.combout(syn_8_7),
	.cout());
defparam \syn[7][8] .lut_mask = 16'h9966;
defparam \syn[7][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][6] (
	.dataa(rsin_q_6),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[2][5]~q ),
	.cin(gnd),
	.combout(syn_6_2),
	.cout());
defparam \syn[2][6] .lut_mask = 16'h9966;
defparam \syn[2][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][6] (
	.dataa(rsin_q_6),
	.datab(sink_sop_q),
	.datac(\reg_q[7][6]~q ),
	.datad(\g1:7:gf_mul1|c[5]~2_combout ),
	.cin(gnd),
	.combout(syn_6_7),
	.cout());
defparam \syn[7][6] .lut_mask = 16'h6996;
defparam \syn[7][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(\reg_q[2][8]~q ),
	.datad(\reg_q[2][4]~q ),
	.cin(gnd),
	.combout(syn_5_2),
	.cout());
defparam \syn[2][5] .lut_mask = 16'h6996;
defparam \syn[2][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(\reg_q[7][3]~q ),
	.datad(\g1:7:gf_mul1|c[5]~2_combout ),
	.cin(gnd),
	.combout(syn_5_7),
	.cout());
defparam \syn[7][5] .lut_mask = 16'h6996;
defparam \syn[7][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][4] (
	.dataa(rsin_q_4),
	.datab(sink_sop_q),
	.datac(\reg_q[2][8]~q ),
	.datad(\reg_q[2][3]~q ),
	.cin(gnd),
	.combout(syn_4_2),
	.cout());
defparam \syn[2][4] .lut_mask = 16'h6996;
defparam \syn[2][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][4] (
	.dataa(rsin_q_4),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:7:gf_mul1|c[4]~3_combout ),
	.cin(gnd),
	.combout(syn_4_7),
	.cout());
defparam \syn[7][4] .lut_mask = 16'h9966;
defparam \syn[7][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(\reg_q[2][8]~q ),
	.datad(\reg_q[2][2]~q ),
	.cin(gnd),
	.combout(syn_3_2),
	.cout());
defparam \syn[2][3] .lut_mask = 16'h6996;
defparam \syn[2][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(\g1:7:gf_mul1|c[1]~4_combout ),
	.datad(\reg_q[7][5]~q ),
	.cin(gnd),
	.combout(syn_3_7),
	.cout());
defparam \syn[7][3] .lut_mask = 16'h6996;
defparam \syn[7][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[2][8]~q ),
	.cin(gnd),
	.combout(syn_1_2),
	.cout());
defparam \syn[2][1] .lut_mask = 16'h9966;
defparam \syn[2][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:7:gf_mul1|c[1]~4_combout ),
	.cin(gnd),
	.combout(syn_1_7),
	.cout());
defparam \syn[7][1] .lut_mask = 16'h9966;
defparam \syn[7][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[2][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[2][1]~q ),
	.cin(gnd),
	.combout(syn_2_2),
	.cout());
defparam \syn[2][2] .lut_mask = 16'h9966;
defparam \syn[2][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[7][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(\reg_q[7][8]~q ),
	.datad(\reg_q[7][4]~q ),
	.cin(gnd),
	.combout(syn_2_7),
	.cout());
defparam \syn[7][2] .lut_mask = 16'h6996;
defparam \syn[7][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][7] (
	.dataa(rsin_q_7),
	.datab(sink_sop_q),
	.datac(\reg_q[4][8]~q ),
	.datad(\reg_q[4][4]~q ),
	.cin(gnd),
	.combout(syn_7_4),
	.cout());
defparam \syn[4][7] .lut_mask = 16'h6996;
defparam \syn[4][7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~6 (
	.dataa(\reg_q[5][8]~q ),
	.datab(\reg_q[5][7]~q ),
	.datac(\reg_q[5][3]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin6),
	.cout());
defparam \synin~6 .lut_mask = 16'h96FF;
defparam \synin~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[4][5]~q ),
	.cin(gnd),
	.combout(syn_8_4),
	.cout());
defparam \syn[4][8] .lut_mask = 16'h9966;
defparam \syn[4][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[5][8] (
	.dataa(rsin_q_8),
	.datab(sink_sop_q),
	.datac(\reg_q[5][8]~q ),
	.datad(\reg_q[5][4]~q ),
	.cin(gnd),
	.combout(syn_8_5),
	.cout());
defparam \syn[5][8] .lut_mask = 16'h6996;
defparam \syn[5][8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][6] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_6),
	.datad(\synin~7_combout ),
	.cin(gnd),
	.combout(syn_6_4),
	.cout());
defparam \syn[4][6] .lut_mask = 16'h0FF0;
defparam \syn[4][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[5][6] (
	.dataa(rsin_q_6),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:5:gf_mul1|c[6]~0_combout ),
	.cin(gnd),
	.combout(syn_6_5),
	.cout());
defparam \syn[5][6] .lut_mask = 16'h9966;
defparam \syn[5][6] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:4:gf_mul1|c[5]~0_combout ),
	.cin(gnd),
	.combout(syn_5_4),
	.cout());
defparam \syn[4][5] .lut_mask = 16'h9966;
defparam \syn[4][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[5][5] (
	.dataa(rsin_q_5),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\g1:5:gf_mul1|c[5]~1_combout ),
	.cin(gnd),
	.combout(syn_5_5),
	.cout());
defparam \syn[5][5] .lut_mask = 16'h9966;
defparam \syn[5][5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][4] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_4),
	.datad(\synin~8_combout ),
	.cin(gnd),
	.combout(syn_4_4),
	.cout());
defparam \syn[4][4] .lut_mask = 16'h0FF0;
defparam \syn[4][4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \synin~9 (
	.dataa(\reg_q[5][5]~q ),
	.datab(\reg_q[5][8]~q ),
	.datac(\reg_q[5][6]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(synin7),
	.cout());
defparam \synin~9 .lut_mask = 16'h96FF;
defparam \synin~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(\reg_q[4][6]~q ),
	.datad(\reg_q[4][8]~q ),
	.cin(gnd),
	.combout(syn_3_4),
	.cout());
defparam \syn[4][3] .lut_mask = 16'h6996;
defparam \syn[4][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[5][3] (
	.dataa(rsin_q_3),
	.datab(sink_sop_q),
	.datac(\reg_q[5][5]~q ),
	.datad(\reg_q[5][7]~q ),
	.cin(gnd),
	.combout(syn_3_5),
	.cout());
defparam \syn[5][3] .lut_mask = 16'h6996;
defparam \syn[5][3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[4][6]~q ),
	.cin(gnd),
	.combout(syn_1_4),
	.cout());
defparam \syn[4][1] .lut_mask = 16'h9966;
defparam \syn[4][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[5][1] (
	.dataa(rsin_q_1),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[5][5]~q ),
	.cin(gnd),
	.combout(syn_1_5),
	.cout());
defparam \syn[5][1] .lut_mask = 16'h9966;
defparam \syn[5][1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[4][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[4][7]~q ),
	.cin(gnd),
	.combout(syn_2_4),
	.cout());
defparam \syn[4][2] .lut_mask = 16'h9966;
defparam \syn[4][2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \syn[5][2] (
	.dataa(rsin_q_2),
	.datab(sink_sop_q),
	.datac(gnd),
	.datad(\reg_q[5][6]~q ),
	.cin(gnd),
	.combout(syn_2_5),
	.cout());
defparam \syn[5][2] .lut_mask = 16'h9966;
defparam \syn[5][2] .sum_lutc_input = "datac";

dffeas \reg_q[1][8] (
	.clk(clk),
	.d(syn_8_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][8]~q ),
	.prn(vcc));
defparam \reg_q[1][8] .is_wysiwyg = "true";
defparam \reg_q[1][8] .power_up = "low";

dffeas \reg_q[1][7] (
	.clk(clk),
	.d(syn_7_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][7]~q ),
	.prn(vcc));
defparam \reg_q[1][7] .is_wysiwyg = "true";
defparam \reg_q[1][7] .power_up = "low";

dffeas \reg_q[1][6] (
	.clk(clk),
	.d(syn_6_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][6]~q ),
	.prn(vcc));
defparam \reg_q[1][6] .is_wysiwyg = "true";
defparam \reg_q[1][6] .power_up = "low";

dffeas \reg_q[1][5] (
	.clk(clk),
	.d(syn_5_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][5]~q ),
	.prn(vcc));
defparam \reg_q[1][5] .is_wysiwyg = "true";
defparam \reg_q[1][5] .power_up = "low";

dffeas \reg_q[1][4] (
	.clk(clk),
	.d(syn_4_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][4]~q ),
	.prn(vcc));
defparam \reg_q[1][4] .is_wysiwyg = "true";
defparam \reg_q[1][4] .power_up = "low";

dffeas \reg_q[1][3] (
	.clk(clk),
	.d(syn_3_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][3]~q ),
	.prn(vcc));
defparam \reg_q[1][3] .is_wysiwyg = "true";
defparam \reg_q[1][3] .power_up = "low";

dffeas \reg_q[1][2] (
	.clk(clk),
	.d(syn_2_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][2]~q ),
	.prn(vcc));
defparam \reg_q[1][2] .is_wysiwyg = "true";
defparam \reg_q[1][2] .power_up = "low";

dffeas \reg_q[1][1] (
	.clk(clk),
	.d(syn_1_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[1][1]~q ),
	.prn(vcc));
defparam \reg_q[1][1] .is_wysiwyg = "true";
defparam \reg_q[1][1] .power_up = "low";

cycloneive_lcell_comb \syn[8][6] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_6),
	.datad(synin1),
	.cin(gnd),
	.combout(\syn[8][6]~combout ),
	.cout());
defparam \syn[8][6] .lut_mask = 16'h0FF0;
defparam \syn[8][6] .sum_lutc_input = "datac";

dffeas \reg_q[8][6] (
	.clk(clk),
	.d(\syn[8][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][6]~q ),
	.prn(vcc));
defparam \reg_q[8][6] .is_wysiwyg = "true";
defparam \reg_q[8][6] .power_up = "low";

dffeas \reg_q[8][5] (
	.clk(clk),
	.d(syn_5_8),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][5]~q ),
	.prn(vcc));
defparam \reg_q[8][5] .is_wysiwyg = "true";
defparam \reg_q[8][5] .power_up = "low";

dffeas \reg_q[8][4] (
	.clk(clk),
	.d(syn_4_8),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][4]~q ),
	.prn(vcc));
defparam \reg_q[8][4] .is_wysiwyg = "true";
defparam \reg_q[8][4] .power_up = "low";

dffeas \reg_q[8][3] (
	.clk(clk),
	.d(syn_3_8),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][3]~q ),
	.prn(vcc));
defparam \reg_q[8][3] .is_wysiwyg = "true";
defparam \reg_q[8][3] .power_up = "low";

dffeas \reg_q[8][8] (
	.clk(clk),
	.d(syn_8_8),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][8]~q ),
	.prn(vcc));
defparam \reg_q[8][8] .is_wysiwyg = "true";
defparam \reg_q[8][8] .power_up = "low";

cycloneive_lcell_comb \syn[8][7] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_7),
	.datad(synin),
	.cin(gnd),
	.combout(\syn[8][7]~combout ),
	.cout());
defparam \syn[8][7] .lut_mask = 16'h0FF0;
defparam \syn[8][7] .sum_lutc_input = "datac";

dffeas \reg_q[8][7] (
	.clk(clk),
	.d(\syn[8][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[8][7]~q ),
	.prn(vcc));
defparam \reg_q[8][7] .is_wysiwyg = "true";
defparam \reg_q[8][7] .power_up = "low";

dffeas \reg_q[3][5] (
	.clk(clk),
	.d(syn_5_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][5]~q ),
	.prn(vcc));
defparam \reg_q[3][5] .is_wysiwyg = "true";
defparam \reg_q[3][5] .power_up = "low";

dffeas \reg_q[3][6] (
	.clk(clk),
	.d(syn_6_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][6]~q ),
	.prn(vcc));
defparam \reg_q[3][6] .is_wysiwyg = "true";
defparam \reg_q[3][6] .power_up = "low";

cycloneive_lcell_comb \syn[6][8] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_8),
	.datad(synin3),
	.cin(gnd),
	.combout(\syn[6][8]~combout ),
	.cout());
defparam \syn[6][8] .lut_mask = 16'h0FF0;
defparam \syn[6][8] .sum_lutc_input = "datac";

dffeas \reg_q[6][8] (
	.clk(clk),
	.d(\syn[6][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][8]~q ),
	.prn(vcc));
defparam \reg_q[6][8] .is_wysiwyg = "true";
defparam \reg_q[6][8] .power_up = "low";

dffeas \reg_q[6][7] (
	.clk(clk),
	.d(syn_7_6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][7]~q ),
	.prn(vcc));
defparam \reg_q[6][7] .is_wysiwyg = "true";
defparam \reg_q[6][7] .power_up = "low";

cycloneive_lcell_comb \syn[6][3] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_3),
	.datad(synin5),
	.cin(gnd),
	.combout(\syn[6][3]~combout ),
	.cout());
defparam \syn[6][3] .lut_mask = 16'h0FF0;
defparam \syn[6][3] .sum_lutc_input = "datac";

dffeas \reg_q[6][3] (
	.clk(clk),
	.d(\syn[6][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][3]~q ),
	.prn(vcc));
defparam \reg_q[6][3] .is_wysiwyg = "true";
defparam \reg_q[6][3] .power_up = "low";

dffeas \reg_q[3][8] (
	.clk(clk),
	.d(syn_8_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][8]~q ),
	.prn(vcc));
defparam \reg_q[3][8] .is_wysiwyg = "true";
defparam \reg_q[3][8] .power_up = "low";

dffeas \reg_q[3][4] (
	.clk(clk),
	.d(syn_4_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][4]~q ),
	.prn(vcc));
defparam \reg_q[3][4] .is_wysiwyg = "true";
defparam \reg_q[3][4] .power_up = "low";

dffeas \reg_q[3][3] (
	.clk(clk),
	.d(syn_3_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][3]~q ),
	.prn(vcc));
defparam \reg_q[3][3] .is_wysiwyg = "true";
defparam \reg_q[3][3] .power_up = "low";

dffeas \reg_q[6][4] (
	.clk(clk),
	.d(syn_4_6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][4]~q ),
	.prn(vcc));
defparam \reg_q[6][4] .is_wysiwyg = "true";
defparam \reg_q[6][4] .power_up = "low";

dffeas \reg_q[6][6] (
	.clk(clk),
	.d(syn_6_6),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][6]~q ),
	.prn(vcc));
defparam \reg_q[6][6] .is_wysiwyg = "true";
defparam \reg_q[6][6] .power_up = "low";

cycloneive_lcell_comb \syn[6][5] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_5),
	.datad(synin4),
	.cin(gnd),
	.combout(\syn[6][5]~combout ),
	.cout());
defparam \syn[6][5] .lut_mask = 16'h0FF0;
defparam \syn[6][5] .sum_lutc_input = "datac";

dffeas \reg_q[6][5] (
	.clk(clk),
	.d(\syn[6][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[6][5]~q ),
	.prn(vcc));
defparam \reg_q[6][5] .is_wysiwyg = "true";
defparam \reg_q[6][5] .power_up = "low";

dffeas \reg_q[3][2] (
	.clk(clk),
	.d(syn_2_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][2]~q ),
	.prn(vcc));
defparam \reg_q[3][2] .is_wysiwyg = "true";
defparam \reg_q[3][2] .power_up = "low";

dffeas \reg_q[3][7] (
	.clk(clk),
	.d(syn_7_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][7]~q ),
	.prn(vcc));
defparam \reg_q[3][7] .is_wysiwyg = "true";
defparam \reg_q[3][7] .power_up = "low";

dffeas \reg_q[3][1] (
	.clk(clk),
	.d(syn_1_3),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[3][1]~q ),
	.prn(vcc));
defparam \reg_q[3][1] .is_wysiwyg = "true";
defparam \reg_q[3][1] .power_up = "low";

dffeas \reg_q[2][6] (
	.clk(clk),
	.d(syn_6_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][6]~q ),
	.prn(vcc));
defparam \reg_q[2][6] .is_wysiwyg = "true";
defparam \reg_q[2][6] .power_up = "low";

dffeas \reg_q[2][7] (
	.clk(clk),
	.d(syn_7_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][7]~q ),
	.prn(vcc));
defparam \reg_q[2][7] .is_wysiwyg = "true";
defparam \reg_q[2][7] .power_up = "low";

dffeas \reg_q[2][5] (
	.clk(clk),
	.d(syn_5_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][5]~q ),
	.prn(vcc));
defparam \reg_q[2][5] .is_wysiwyg = "true";
defparam \reg_q[2][5] .power_up = "low";

dffeas \reg_q[7][6] (
	.clk(clk),
	.d(syn_6_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][6]~q ),
	.prn(vcc));
defparam \reg_q[7][6] .is_wysiwyg = "true";
defparam \reg_q[7][6] .power_up = "low";

dffeas \reg_q[2][8] (
	.clk(clk),
	.d(syn_8_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][8]~q ),
	.prn(vcc));
defparam \reg_q[2][8] .is_wysiwyg = "true";
defparam \reg_q[2][8] .power_up = "low";

dffeas \reg_q[2][4] (
	.clk(clk),
	.d(syn_4_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][4]~q ),
	.prn(vcc));
defparam \reg_q[2][4] .is_wysiwyg = "true";
defparam \reg_q[2][4] .power_up = "low";

dffeas \reg_q[7][3] (
	.clk(clk),
	.d(syn_3_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][3]~q ),
	.prn(vcc));
defparam \reg_q[7][3] .is_wysiwyg = "true";
defparam \reg_q[7][3] .power_up = "low";

dffeas \reg_q[2][3] (
	.clk(clk),
	.d(syn_3_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][3]~q ),
	.prn(vcc));
defparam \reg_q[2][3] .is_wysiwyg = "true";
defparam \reg_q[2][3] .power_up = "low";

dffeas \reg_q[2][2] (
	.clk(clk),
	.d(syn_2_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][2]~q ),
	.prn(vcc));
defparam \reg_q[2][2] .is_wysiwyg = "true";
defparam \reg_q[2][2] .power_up = "low";

dffeas \reg_q[7][5] (
	.clk(clk),
	.d(syn_5_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][5]~q ),
	.prn(vcc));
defparam \reg_q[7][5] .is_wysiwyg = "true";
defparam \reg_q[7][5] .power_up = "low";

dffeas \reg_q[2][1] (
	.clk(clk),
	.d(syn_1_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[2][1]~q ),
	.prn(vcc));
defparam \reg_q[2][1] .is_wysiwyg = "true";
defparam \reg_q[2][1] .power_up = "low";

dffeas \reg_q[7][8] (
	.clk(clk),
	.d(syn_8_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][8]~q ),
	.prn(vcc));
defparam \reg_q[7][8] .is_wysiwyg = "true";
defparam \reg_q[7][8] .power_up = "low";

dffeas \reg_q[7][4] (
	.clk(clk),
	.d(syn_4_7),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[7][4]~q ),
	.prn(vcc));
defparam \reg_q[7][4] .is_wysiwyg = "true";
defparam \reg_q[7][4] .power_up = "low";

dffeas \reg_q[4][8] (
	.clk(clk),
	.d(syn_8_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][8]~q ),
	.prn(vcc));
defparam \reg_q[4][8] .is_wysiwyg = "true";
defparam \reg_q[4][8] .power_up = "low";

dffeas \reg_q[4][4] (
	.clk(clk),
	.d(syn_4_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][4]~q ),
	.prn(vcc));
defparam \reg_q[4][4] .is_wysiwyg = "true";
defparam \reg_q[4][4] .power_up = "low";

dffeas \reg_q[5][8] (
	.clk(clk),
	.d(syn_8_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][8]~q ),
	.prn(vcc));
defparam \reg_q[5][8] .is_wysiwyg = "true";
defparam \reg_q[5][8] .power_up = "low";

cycloneive_lcell_comb \syn[5][7] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_7),
	.datad(synin6),
	.cin(gnd),
	.combout(\syn[5][7]~combout ),
	.cout());
defparam \syn[5][7] .lut_mask = 16'h0FF0;
defparam \syn[5][7] .sum_lutc_input = "datac";

dffeas \reg_q[5][7] (
	.clk(clk),
	.d(\syn[5][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][7]~q ),
	.prn(vcc));
defparam \reg_q[5][7] .is_wysiwyg = "true";
defparam \reg_q[5][7] .power_up = "low";

dffeas \reg_q[5][3] (
	.clk(clk),
	.d(syn_3_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][3]~q ),
	.prn(vcc));
defparam \reg_q[5][3] .is_wysiwyg = "true";
defparam \reg_q[5][3] .power_up = "low";

dffeas \reg_q[4][5] (
	.clk(clk),
	.d(syn_5_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][5]~q ),
	.prn(vcc));
defparam \reg_q[4][5] .is_wysiwyg = "true";
defparam \reg_q[4][5] .power_up = "low";

cycloneive_lcell_comb \syn[5][4] (
	.dataa(gnd),
	.datab(gnd),
	.datac(rsin_q_4),
	.datad(synin7),
	.cin(gnd),
	.combout(\syn[5][4]~combout ),
	.cout());
defparam \syn[5][4] .lut_mask = 16'h0FF0;
defparam \syn[5][4] .sum_lutc_input = "datac";

dffeas \reg_q[5][4] (
	.clk(clk),
	.d(\syn[5][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][4]~q ),
	.prn(vcc));
defparam \reg_q[5][4] .is_wysiwyg = "true";
defparam \reg_q[5][4] .power_up = "low";

dffeas \reg_q[4][7] (
	.clk(clk),
	.d(syn_7_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][7]~q ),
	.prn(vcc));
defparam \reg_q[4][7] .is_wysiwyg = "true";
defparam \reg_q[4][7] .power_up = "low";

dffeas \reg_q[4][3] (
	.clk(clk),
	.d(syn_3_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][3]~q ),
	.prn(vcc));
defparam \reg_q[4][3] .is_wysiwyg = "true";
defparam \reg_q[4][3] .power_up = "low";

cycloneive_lcell_comb \synin~7 (
	.dataa(\reg_q[4][8]~q ),
	.datab(\reg_q[4][7]~q ),
	.datac(\reg_q[4][3]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(\synin~7_combout ),
	.cout());
defparam \synin~7 .lut_mask = 16'h96FF;
defparam \synin~7 .sum_lutc_input = "datac";

dffeas \reg_q[4][6] (
	.clk(clk),
	.d(syn_6_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][6]~q ),
	.prn(vcc));
defparam \reg_q[4][6] .is_wysiwyg = "true";
defparam \reg_q[4][6] .power_up = "low";

dffeas \reg_q[4][1] (
	.clk(clk),
	.d(syn_1_4),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[4][1]~q ),
	.prn(vcc));
defparam \reg_q[4][1] .is_wysiwyg = "true";
defparam \reg_q[4][1] .power_up = "low";

cycloneive_lcell_comb \synin~8 (
	.dataa(\reg_q[4][6]~q ),
	.datab(\reg_q[4][7]~q ),
	.datac(\reg_q[4][1]~q ),
	.datad(sink_sop_q),
	.cin(gnd),
	.combout(\synin~8_combout ),
	.cout());
defparam \synin~8 .lut_mask = 16'h96FF;
defparam \synin~8 .sum_lutc_input = "datac";

dffeas \reg_q[5][5] (
	.clk(clk),
	.d(syn_5_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][5]~q ),
	.prn(vcc));
defparam \reg_q[5][5] .is_wysiwyg = "true";
defparam \reg_q[5][5] .power_up = "low";

dffeas \reg_q[5][6] (
	.clk(clk),
	.d(syn_6_5),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(ena),
	.q(\reg_q[5][6]~q ),
	.prn(vcc));
defparam \reg_q[5][6] .is_wysiwyg = "true";
defparam \reg_q[5][6] .power_up = "low";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_9 (
	reg_q_8_3,
	reg_q_7_3,
	c_4)/* synthesis synthesis_greybox=1 */;
input 	reg_q_8_3;
input 	reg_q_7_3;
output 	c_4;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[4]~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(reg_q_7_3),
	.datad(reg_q_8_3),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4]~0 .lut_mask = 16'h0FF0;
defparam \c[4]~0 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_10 (
	reg_q_8_4,
	reg_q_7_4,
	reg_q_6_4,
	reg_q_2_4,
	c_5)/* synthesis synthesis_greybox=1 */;
input 	reg_q_8_4;
input 	reg_q_7_4;
input 	reg_q_6_4;
input 	reg_q_2_4;
output 	c_5;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[5]~0 (
	.dataa(reg_q_6_4),
	.datab(reg_q_8_4),
	.datac(reg_q_7_4),
	.datad(reg_q_2_4),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~0 .lut_mask = 16'h6996;
defparam \c[5]~0 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_11 (
	reg_q_8_5,
	reg_q_7_5,
	reg_q_6_5,
	reg_q_2_5,
	c_6,
	reg_q_5_5,
	reg_q_1_5,
	c_5)/* synthesis synthesis_greybox=1 */;
input 	reg_q_8_5;
input 	reg_q_7_5;
input 	reg_q_6_5;
input 	reg_q_2_5;
output 	c_6;
input 	reg_q_5_5;
input 	reg_q_1_5;
output 	c_5;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[6]~0 (
	.dataa(reg_q_8_5),
	.datab(reg_q_6_5),
	.datac(reg_q_7_5),
	.datad(reg_q_2_5),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~0 .lut_mask = 16'h6996;
defparam \c[6]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~1 (
	.dataa(reg_q_5_5),
	.datab(reg_q_6_5),
	.datac(reg_q_7_5),
	.datad(reg_q_1_5),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~1 .lut_mask = 16'h6996;
defparam \c[5]~1 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_12 (
	reg_q_8_6,
	reg_q_6_6,
	reg_q_7_6,
	reg_q_2_6,
	c_7,
	reg_q_5_6,
	reg_q_1_6,
	c_6,
	reg_q_4_6,
	c_4)/* synthesis synthesis_greybox=1 */;
input 	reg_q_8_6;
input 	reg_q_6_6;
input 	reg_q_7_6;
input 	reg_q_2_6;
output 	c_7;
input 	reg_q_5_6;
input 	reg_q_1_6;
output 	c_6;
input 	reg_q_4_6;
output 	c_4;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[7]~0 (
	.dataa(reg_q_8_6),
	.datab(reg_q_6_6),
	.datac(reg_q_7_6),
	.datad(reg_q_2_6),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~0 .lut_mask = 16'h6996;
defparam \c[7]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~1 (
	.dataa(reg_q_6_6),
	.datab(reg_q_5_6),
	.datac(reg_q_7_6),
	.datad(reg_q_1_6),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~1 .lut_mask = 16'h6996;
defparam \c[6]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~2 (
	.dataa(reg_q_8_6),
	.datab(reg_q_4_6),
	.datac(reg_q_5_6),
	.datad(reg_q_7_6),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4]~2 .lut_mask = 16'h6996;
defparam \c[4]~2 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_13 (
	reg_q_7_7,
	reg_q_6_7,
	reg_q_5_7,
	reg_q_1_7,
	c_7,
	reg_q_8_7,
	reg_q_2_7,
	c_8,
	reg_q_4_7,
	c_5,
	reg_q_3_7,
	c_4,
	c_1)/* synthesis synthesis_greybox=1 */;
input 	reg_q_7_7;
input 	reg_q_6_7;
input 	reg_q_5_7;
input 	reg_q_1_7;
output 	c_7;
input 	reg_q_8_7;
input 	reg_q_2_7;
output 	c_8;
input 	reg_q_4_7;
output 	c_5;
input 	reg_q_3_7;
output 	c_4;
output 	c_1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[7]~0 (
	.dataa(reg_q_7_7),
	.datab(reg_q_6_7),
	.datac(reg_q_5_7),
	.datad(reg_q_1_7),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7]~0 .lut_mask = 16'h6996;
defparam \c[7]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8]~1 (
	.dataa(reg_q_8_7),
	.datab(reg_q_7_7),
	.datac(reg_q_6_7),
	.datad(reg_q_2_7),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~1 .lut_mask = 16'h6996;
defparam \c[8]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~2 (
	.dataa(gnd),
	.datab(gnd),
	.datac(reg_q_5_7),
	.datad(reg_q_4_7),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~2 .lut_mask = 16'h0FF0;
defparam \c[5]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~3 (
	.dataa(reg_q_7_7),
	.datab(reg_q_3_7),
	.datac(reg_q_6_7),
	.datad(reg_q_4_7),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4]~3 .lut_mask = 16'h6996;
defparam \c[4]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1]~4 (
	.dataa(reg_q_8_7),
	.datab(reg_q_7_7),
	.datac(reg_q_3_7),
	.datad(gnd),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1]~4 .lut_mask = 16'h9696;
defparam \c[1]~4 .sum_lutc_input = "datac";

endmodule

module RS_DE_LANE_QUATUS_auk_rs_gfmul_cnt_14 (
	reg_q_6_8,
	reg_q_5_8,
	reg_q_4_8,
	reg_q_7_8,
	reg_q_1_8,
	c_8,
	reg_q_3_8,
	reg_q_8_8,
	reg_q_2_8,
	c_5,
	c_4,
	c_1)/* synthesis synthesis_greybox=1 */;
input 	reg_q_6_8;
input 	reg_q_5_8;
input 	reg_q_4_8;
input 	reg_q_7_8;
input 	reg_q_1_8;
output 	c_8;
input 	reg_q_3_8;
input 	reg_q_8_8;
input 	reg_q_2_8;
output 	c_5;
output 	c_4;
output 	c_1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[8]~0 (
	.dataa(reg_q_7_8),
	.datab(reg_q_6_8),
	.datac(reg_q_5_8),
	.datad(reg_q_1_8),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8]~0 .lut_mask = 16'h6996;
defparam \c[8]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5]~1 (
	.dataa(reg_q_8_8),
	.datab(reg_q_2_8),
	.datac(reg_q_4_8),
	.datad(reg_q_3_8),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5]~1 .lut_mask = 16'h6996;
defparam \c[5]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4]~2 (
	.dataa(reg_q_6_8),
	.datab(reg_q_2_8),
	.datac(reg_q_5_8),
	.datad(reg_q_3_8),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4]~2 .lut_mask = 16'h6996;
defparam \c[4]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1]~3 (
	.dataa(reg_q_7_8),
	.datab(reg_q_6_8),
	.datac(reg_q_2_8),
	.datad(gnd),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1]~3 .lut_mask = 16'h9696;
defparam \c[1]~3 .sum_lutc_input = "datac";

endmodule
