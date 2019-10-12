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

// DATE "08/10/2019 17:23:06"

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module RS_ENC_LANE_QUATUS (
	clk,
	reset,
	rsin,
	sink_val,
	sink_sop,
	sink_eop,
	source_ena,
	rsout,
	sink_ena,
	source_val,
	source_sop,
	source_eop)/* synthesis synthesis_greybox=1 */;
input 	clk;
input 	reset;
input 	[8:1] rsin;
input 	sink_val;
input 	sink_sop;
input 	sink_eop;
input 	source_ena;
output 	[8:1] rsout;
output 	sink_ena;
output 	source_val;
output 	source_sop;
output 	source_eop;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][1]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][2]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][3]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][4]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][5]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][6]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][7]~q ;
wire \auk_rs_enc_top_atl_inst|rsin_pipe[3][8]~q ;
wire \auk_rs_enc_top_atl_inst|sink_sop_pipe[3]~q ;
wire \auk_rs_enc_top_atl_inst|sink_ready_tap~0_combout ;
wire \auk_rs_enc_top_atl_inst|source_val~combout ;
wire \auk_rs_enc_top_atl_inst|source_eop~q ;
wire \source_ena~input_o ;
wire \clk~input_o ;
wire \reset~input_o ;
wire \sink_val~input_o ;
wire \sink_eop~input_o ;
wire \sink_sop~input_o ;
wire \rsin[1]~input_o ;
wire \rsin[2]~input_o ;
wire \rsin[3]~input_o ;
wire \rsin[4]~input_o ;
wire \rsin[5]~input_o ;
wire \rsin[6]~input_o ;
wire \rsin[7]~input_o ;
wire \rsin[8]~input_o ;


RS_ENC_LANE_QUATUS_auk_rs_enc_top_atl auk_rs_enc_top_atl_inst(
	.rsin_pipe_1_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][1]~q ),
	.rsin_pipe_2_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][2]~q ),
	.rsin_pipe_3_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][3]~q ),
	.rsin_pipe_4_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][4]~q ),
	.rsin_pipe_5_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][5]~q ),
	.rsin_pipe_6_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][6]~q ),
	.rsin_pipe_7_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][7]~q ),
	.rsin_pipe_8_3(\auk_rs_enc_top_atl_inst|rsin_pipe[3][8]~q ),
	.sink_sop_pipe_3(\auk_rs_enc_top_atl_inst|sink_sop_pipe[3]~q ),
	.sink_ready_tap(\auk_rs_enc_top_atl_inst|sink_ready_tap~0_combout ),
	.source_val1(\auk_rs_enc_top_atl_inst|source_val~combout ),
	.source_eop1(\auk_rs_enc_top_atl_inst|source_eop~q ),
	.source_ena(\source_ena~input_o ),
	.clk(\clk~input_o ),
	.reset(\reset~input_o ),
	.sink_val(\sink_val~input_o ),
	.sink_eop(\sink_eop~input_o ),
	.sink_sop(\sink_sop~input_o ),
	.rsin_1(\rsin[1]~input_o ),
	.rsin_2(\rsin[2]~input_o ),
	.rsin_3(\rsin[3]~input_o ),
	.rsin_4(\rsin[4]~input_o ),
	.rsin_5(\rsin[5]~input_o ),
	.rsin_6(\rsin[6]~input_o ),
	.rsin_7(\rsin[7]~input_o ),
	.rsin_8(\rsin[8]~input_o ));

assign \source_ena~input_o  = source_ena;

assign \clk~input_o  = clk;

assign \reset~input_o  = reset;

assign \sink_val~input_o  = sink_val;

assign \sink_eop~input_o  = sink_eop;

assign \sink_sop~input_o  = sink_sop;

assign \rsin[1]~input_o  = rsin[1];

assign \rsin[2]~input_o  = rsin[2];

assign \rsin[3]~input_o  = rsin[3];

assign \rsin[4]~input_o  = rsin[4];

assign \rsin[5]~input_o  = rsin[5];

assign \rsin[6]~input_o  = rsin[6];

assign \rsin[7]~input_o  = rsin[7];

assign \rsin[8]~input_o  = rsin[8];

assign rsout[1] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][1]~q ;

assign rsout[2] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][2]~q ;

assign rsout[3] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][3]~q ;

assign rsout[4] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][4]~q ;

assign rsout[5] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][5]~q ;

assign rsout[6] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][6]~q ;

assign rsout[7] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][7]~q ;

assign rsout[8] = \auk_rs_enc_top_atl_inst|rsin_pipe[3][8]~q ;

assign sink_ena = \auk_rs_enc_top_atl_inst|sink_ready_tap~0_combout ;

assign source_val = \auk_rs_enc_top_atl_inst|source_val~combout ;

assign source_sop = \auk_rs_enc_top_atl_inst|sink_sop_pipe[3]~q ;

assign source_eop = \auk_rs_enc_top_atl_inst|source_eop~q ;

endmodule

module RS_ENC_LANE_QUATUS_auk_rs_enc_top_atl (
	rsin_pipe_1_3,
	rsin_pipe_2_3,
	rsin_pipe_3_3,
	rsin_pipe_4_3,
	rsin_pipe_5_3,
	rsin_pipe_6_3,
	rsin_pipe_7_3,
	rsin_pipe_8_3,
	sink_sop_pipe_3,
	sink_ready_tap,
	source_val1,
	source_eop1,
	source_ena,
	clk,
	reset,
	sink_val,
	sink_eop,
	sink_sop,
	rsin_1,
	rsin_2,
	rsin_3,
	rsin_4,
	rsin_5,
	rsin_6,
	rsin_7,
	rsin_8)/* synthesis synthesis_greybox=1 */;
output 	rsin_pipe_1_3;
output 	rsin_pipe_2_3;
output 	rsin_pipe_3_3;
output 	rsin_pipe_4_3;
output 	rsin_pipe_5_3;
output 	rsin_pipe_6_3;
output 	rsin_pipe_7_3;
output 	rsin_pipe_8_3;
output 	sink_sop_pipe_3;
output 	sink_ready_tap;
output 	source_val1;
output 	source_eop1;
input 	source_ena;
input 	clk;
input 	reset;
input 	sink_val;
input 	sink_eop;
input 	sink_sop;
input 	rsin_1;
input 	rsin_2;
input 	rsin_3;
input 	rsin_4;
input 	rsin_5;
input 	rsin_6;
input 	rsin_7;
input 	rsin_8;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \ifg_std:cmuln|c[3]~12_combout ;
wire \ifg_std:cmuln|c[3]~combout ;
wire \ifg_std:cmuln|c[4]~combout ;
wire \ifg_std:cmuln|c[5]~combout ;
wire \ifg_std:cmuln|c[6]~13_combout ;
wire \ifg_std:cmuln|c[7]~combout ;
wire \ifg_std:cmuln|c[8]~combout ;
wire \ifg_std:cmuln|c[1]~14_combout ;
wire \ifg_std:cmuln|c[6]~15_combout ;
wire \ifg_std:cmuln|c[2]~combout ;
wire \source_ena_q~q ;
wire \rsin_pipe_bk~17_combout ;
wire \process_2~0_combout ;
wire \count~5_combout ;
wire \count[2]~2_combout ;
wire \count[1]~q ;
wire \count~4_combout ;
wire \count[2]~q ;
wire \count~3_combout ;
wire \count[3]~q ;
wire \shift3~0_combout ;
wire \count~6_combout ;
wire \count[4]~q ;
wire \shift3~1_combout ;
wire \shift3_bk~0_combout ;
wire \shift3_bk~q ;
wire \sink_eop_pipe_bk~0_combout ;
wire \sink_eop_pipe_bk[1]~q ;
wire \sink_eop_pipe~0_combout ;
wire \sink_eop_pipe[1]~q ;
wire \shift3~2_combout ;
wire \shift3~3_combout ;
wire \shift3~q ;
wire \sink_eop_pipe_bk[1]~1_combout ;
wire \rsin_pipe_bk[1][1]~q ;
wire \rsin_pipe~17_combout ;
wire \rsin_pipe[1][3]~16_combout ;
wire \rsin_pipe[1][1]~q ;
wire \sink_val_pipe_bk~3_combout ;
wire \sink_val_pipe_bk[1]~q ;
wire \sink_val_pipe~2_combout ;
wire \sink_val_pipe[1]~q ;
wire \rsin_pipe_bk~9_combout ;
wire \sink_val_pipe_bk~2_combout ;
wire \rsin_pipe_bk[2][1]~q ;
wire \rsin_pipe~8_combout ;
wire \rsin_pipe[2][1]~q ;
wire \sink_val_pipe_bk~1_combout ;
wire \sink_val_pipe_bk[2]~q ;
wire \sink_val_pipe~1_combout ;
wire \sink_val_pipe[2]~q ;
wire \sink_eop_pipe_bk~3_combout ;
wire \sink_eop_pipe_bk[2]~q ;
wire \sink_eop_pipe~1_combout ;
wire \sink_eop_pipe[2]~q ;
wire \sink_eop_pipe_bk~2_combout ;
wire \rsin_pipe_bk~1_combout ;
wire \sink_eop_pipe_bk[3]~q ;
wire \shift_point~0_combout ;
wire \sink_sop_pipe_bk~2_combout ;
wire \sink_sop_pipe_bk[1]~q ;
wire \sink_sop_pipe~2_combout ;
wire \sink_sop_pipe[1]~q ;
wire \sink_sop_pipe_bk~1_combout ;
wire \sink_sop_pipe_bk[2]~q ;
wire \process_0~2_combout ;
wire \sink_eop_pipe~2_combout ;
wire \sink_eop_pipe[3]~q ;
wire \count_del~3_combout ;
wire \count_del[1]~q ;
wire \count_del~2_combout ;
wire \count_del[2]~q ;
wire \Add2~0_combout ;
wire \count_del~1_combout ;
wire \count_del[3]~q ;
wire \eop_source_gen~0_combout ;
wire \count_del~0_combout ;
wire \count_del[4]~q ;
wire \shift_point~1_combout ;
wire \shift_point~2_combout ;
wire \shift_point~q ;
wire \point[1]~combout ;
wire \reg_d[6][3]~10_combout ;
wire \rsin_pipe_bk~23_combout ;
wire \rsin_pipe_bk[1][7]~q ;
wire \rsin_pipe~23_combout ;
wire \rsin_pipe[1][7]~q ;
wire \rsin_pipe_bk~15_combout ;
wire \rsin_pipe_bk[2][7]~q ;
wire \rsin_pipe~14_combout ;
wire \rsin_pipe[2][7]~q ;
wire \point[7]~combout ;
wire \rsin_pipe_bk~21_combout ;
wire \rsin_pipe_bk[1][5]~q ;
wire \rsin_pipe~21_combout ;
wire \rsin_pipe[1][5]~q ;
wire \rsin_pipe_bk~13_combout ;
wire \rsin_pipe_bk[2][5]~q ;
wire \rsin_pipe~12_combout ;
wire \rsin_pipe[2][5]~q ;
wire \reg_d[7][5]~15_combout ;
wire \enable~0_combout ;
wire \reg_q[8][5]~q ;
wire \reg_d[7][5]~combout ;
wire \reg_q[7][5]~q ;
wire \rsin_pipe_bk~24_combout ;
wire \rsin_pipe_bk[1][8]~q ;
wire \rsin_pipe~24_combout ;
wire \rsin_pipe[1][8]~q ;
wire \rsin_pipe_bk~16_combout ;
wire \rsin_pipe_bk[2][8]~q ;
wire \rsin_pipe~15_combout ;
wire \rsin_pipe[2][8]~q ;
wire \point[8]~combout ;
wire \reg_q[8][2]~q ;
wire \reg_d[7][2]~combout ;
wire \reg_q[7][2]~q ;
wire \reg_d[6][2]~combout ;
wire \reg_q[6][2]~q ;
wire \reg_d[5][2]~combout ;
wire \reg_q[5][2]~q ;
wire \reg_d[4][2]~14_combout ;
wire \reg_q[4][2]~q ;
wire \reg_d[3][2]~combout ;
wire \reg_q[3][2]~q ;
wire \reg_d[2][2]~combout ;
wire \reg_q[2][2]~q ;
wire \reg_d[1][2]~combout ;
wire \reg_q[1][2]~q ;
wire \rsin_pipe_bk~18_combout ;
wire \rsin_pipe_bk[1][2]~q ;
wire \rsin_pipe~18_combout ;
wire \rsin_pipe[1][2]~q ;
wire \rsin_pipe_bk~10_combout ;
wire \rsin_pipe_bk[2][2]~q ;
wire \rsin_pipe~9_combout ;
wire \rsin_pipe[2][2]~q ;
wire \point[2]~combout ;
wire \reg_d[4][4]~13_combout ;
wire \reg_q[8][8]~q ;
wire \reg_d[7][8]~combout ;
wire \reg_q[7][8]~q ;
wire \reg_d[6][8]~combout ;
wire \reg_q[6][8]~q ;
wire \reg_d[5][8]~combout ;
wire \reg_q[5][8]~q ;
wire \reg_d[4][8]~combout ;
wire \reg_q[4][8]~q ;
wire \reg_d[3][8]~combout ;
wire \reg_q[3][8]~q ;
wire \reg_d[2][8]~combout ;
wire \reg_q[2][8]~q ;
wire \reg_d[1][8]~combout ;
wire \reg_q[1][8]~q ;
wire \reg_d[6][5]~combout ;
wire \reg_q[6][5]~q ;
wire \reg_d[5][5]~combout ;
wire \reg_q[5][5]~q ;
wire \reg_d[4][5]~combout ;
wire \reg_q[4][5]~q ;
wire \reg_d[3][5]~combout ;
wire \reg_q[3][5]~q ;
wire \reg_d[2][5]~combout ;
wire \reg_q[2][5]~q ;
wire \reg_d[1][5]~combout ;
wire \reg_q[1][5]~q ;
wire \point[5]~combout ;
wire \reg_q[8][7]~q ;
wire \reg_d[7][7]~combout ;
wire \reg_q[7][7]~q ;
wire \reg_d[6][7]~combout ;
wire \reg_q[6][7]~q ;
wire \reg_d[5][7]~combout ;
wire \reg_q[5][7]~q ;
wire \reg_d[4][7]~combout ;
wire \reg_q[4][7]~q ;
wire \reg_d[3][7]~combout ;
wire \reg_q[3][7]~q ;
wire \reg_d[2][7]~combout ;
wire \reg_q[2][7]~q ;
wire \reg_d[1][7]~12_combout ;
wire \reg_d[1][7]~combout ;
wire \reg_q[1][7]~q ;
wire \reg_d[7][7]~16_combout ;
wire \reg_q[8][4]~q ;
wire \reg_d[7][4]~combout ;
wire \reg_q[7][4]~q ;
wire \reg_d[6][4]~combout ;
wire \reg_q[6][4]~q ;
wire \reg_d[5][4]~combout ;
wire \reg_q[5][4]~q ;
wire \reg_d[4][4]~combout ;
wire \reg_q[4][4]~q ;
wire \reg_d[3][4]~combout ;
wire \reg_q[3][4]~q ;
wire \reg_d[2][4]~combout ;
wire \reg_q[2][4]~q ;
wire \reg_d[1][4]~9_combout ;
wire \reg_d[1][4]~combout ;
wire \reg_q[1][4]~q ;
wire \rsin_pipe_bk~20_combout ;
wire \rsin_pipe_bk[1][4]~q ;
wire \rsin_pipe~20_combout ;
wire \rsin_pipe[1][4]~q ;
wire \rsin_pipe_bk~12_combout ;
wire \rsin_pipe_bk[2][4]~q ;
wire \rsin_pipe~11_combout ;
wire \rsin_pipe[2][4]~q ;
wire \point[4]~combout ;
wire \reg_d[7][4]~11_combout ;
wire \reg_q[8][6]~q ;
wire \reg_d[7][6]~combout ;
wire \reg_q[7][6]~q ;
wire \reg_d[6][6]~combout ;
wire \reg_q[6][6]~q ;
wire \reg_d[5][6]~combout ;
wire \reg_q[5][6]~q ;
wire \reg_d[4][6]~combout ;
wire \reg_q[4][6]~q ;
wire \reg_d[3][6]~combout ;
wire \reg_q[3][6]~q ;
wire \reg_d[2][6]~combout ;
wire \reg_q[2][6]~q ;
wire \reg_d[1][6]~combout ;
wire \reg_q[1][6]~q ;
wire \rsin_pipe_bk~22_combout ;
wire \rsin_pipe_bk[1][6]~q ;
wire \rsin_pipe~22_combout ;
wire \rsin_pipe[1][6]~q ;
wire \rsin_pipe_bk~14_combout ;
wire \rsin_pipe_bk[2][6]~q ;
wire \rsin_pipe~13_combout ;
wire \rsin_pipe[2][6]~q ;
wire \point[6]~combout ;
wire \reg_q[8][3]~q ;
wire \reg_d[7][3]~combout ;
wire \reg_q[7][3]~q ;
wire \reg_d[6][3]~combout ;
wire \reg_q[6][3]~q ;
wire \reg_d[5][3]~combout ;
wire \reg_q[5][3]~q ;
wire \reg_d[4][3]~combout ;
wire \reg_q[4][3]~q ;
wire \reg_d[3][3]~combout ;
wire \reg_q[3][3]~q ;
wire \reg_d[2][3]~combout ;
wire \reg_q[2][3]~q ;
wire \reg_d[1][3]~combout ;
wire \reg_q[1][3]~q ;
wire \rsin_pipe_bk~19_combout ;
wire \rsin_pipe_bk[1][3]~q ;
wire \rsin_pipe~19_combout ;
wire \rsin_pipe[1][3]~q ;
wire \rsin_pipe_bk~11_combout ;
wire \rsin_pipe_bk[2][3]~q ;
wire \rsin_pipe~10_combout ;
wire \rsin_pipe[2][3]~q ;
wire \point[3]~combout ;
wire \reg_d[5][2]~8_combout ;
wire \reg_q[8][1]~q ;
wire \reg_d[7][1]~combout ;
wire \reg_q[7][1]~q ;
wire \reg_d[6][1]~combout ;
wire \reg_q[6][1]~q ;
wire \reg_d[5][1]~combout ;
wire \reg_q[5][1]~q ;
wire \reg_d[4][1]~combout ;
wire \reg_q[4][1]~q ;
wire \reg_d[3][1]~combout ;
wire \reg_q[3][1]~q ;
wire \reg_d[2][1]~combout ;
wire \reg_q[2][1]~q ;
wire \reg_d[1][1]~combout ;
wire \reg_q[1][1]~q ;
wire \rsin_pipe_bk~0_combout ;
wire \rsin_pipe_bk[3][1]~q ;
wire \process_0~0_combout ;
wire \rsin_pipe[3][1]~0_combout ;
wire \process_0~1_combout ;
wire \rsin_pipe_bk~2_combout ;
wire \rsin_pipe_bk[3][2]~q ;
wire \rsin_pipe[3][2]~1_combout ;
wire \rsin_pipe_bk~3_combout ;
wire \rsin_pipe_bk[3][3]~q ;
wire \rsin_pipe[3][3]~2_combout ;
wire \rsin_pipe_bk~4_combout ;
wire \rsin_pipe_bk[3][4]~q ;
wire \rsin_pipe[3][4]~3_combout ;
wire \rsin_pipe_bk~5_combout ;
wire \rsin_pipe_bk[3][5]~q ;
wire \rsin_pipe[3][5]~4_combout ;
wire \rsin_pipe_bk~6_combout ;
wire \rsin_pipe_bk[3][6]~q ;
wire \rsin_pipe[3][6]~5_combout ;
wire \rsin_pipe_bk~7_combout ;
wire \rsin_pipe_bk[3][7]~q ;
wire \rsin_pipe[3][7]~6_combout ;
wire \rsin_pipe_bk~8_combout ;
wire \rsin_pipe_bk[3][8]~q ;
wire \rsin_pipe[3][8]~7_combout ;
wire \sink_sop_pipe~1_combout ;
wire \sink_sop_pipe[2]~q ;
wire \sink_sop_pipe_bk~0_combout ;
wire \sink_sop_pipe_bk[3]~q ;
wire \sink_sop_pipe~0_combout ;
wire \source_ena_q_val~q ;
wire \sink_val_pipe_bk~0_combout ;
wire \sink_val_pipe_bk[3]~q ;
wire \sink_val_pipe~0_combout ;
wire \sink_val_pipe[3]~q ;
wire \eop_source_gen~1_combout ;


RS_ENC_LANE_QUATUS_auk_rs_gfmul_cnt \ifg_std:cmuln (
	.rsin_pipe_3_2(\rsin_pipe[2][3]~q ),
	.rsin_pipe_5_2(\rsin_pipe[2][5]~q ),
	.rsin_pipe_7_2(\rsin_pipe[2][7]~q ),
	.shift_point(\shift_point~q ),
	.reg_q_3_1(\reg_q[1][3]~q ),
	.reg_q_5_1(\reg_q[1][5]~q ),
	.reg_q_7_1(\reg_q[1][7]~q ),
	.point_3(\point[3]~combout ),
	.point_4(\point[4]~combout ),
	.point_1(\point[1]~combout ),
	.point_2(\point[2]~combout ),
	.point_5(\point[5]~combout ),
	.point_7(\point[7]~combout ),
	.point_8(\point[8]~combout ),
	.point_6(\point[6]~combout ),
	.c_3(\ifg_std:cmuln|c[3]~12_combout ),
	.c_31(\ifg_std:cmuln|c[3]~combout ),
	.c_4(\ifg_std:cmuln|c[4]~combout ),
	.c_5(\ifg_std:cmuln|c[5]~combout ),
	.c_6(\ifg_std:cmuln|c[6]~13_combout ),
	.c_7(\ifg_std:cmuln|c[7]~combout ),
	.c_8(\ifg_std:cmuln|c[8]~combout ),
	.c_1(\ifg_std:cmuln|c[1]~14_combout ),
	.c_61(\ifg_std:cmuln|c[6]~15_combout ),
	.c_2(\ifg_std:cmuln|c[2]~combout ));

dffeas \rsin_pipe[3][1] (
	.clk(clk),
	.d(\rsin_pipe[3][1]~0_combout ),
	.asdata(\rsin_pipe[2][1]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_1_3),
	.prn(vcc));
defparam \rsin_pipe[3][1] .is_wysiwyg = "true";
defparam \rsin_pipe[3][1] .power_up = "low";

dffeas \rsin_pipe[3][2] (
	.clk(clk),
	.d(\rsin_pipe[3][2]~1_combout ),
	.asdata(\rsin_pipe[2][2]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_2_3),
	.prn(vcc));
defparam \rsin_pipe[3][2] .is_wysiwyg = "true";
defparam \rsin_pipe[3][2] .power_up = "low";

dffeas \rsin_pipe[3][3] (
	.clk(clk),
	.d(\rsin_pipe[3][3]~2_combout ),
	.asdata(\rsin_pipe[2][3]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_3_3),
	.prn(vcc));
defparam \rsin_pipe[3][3] .is_wysiwyg = "true";
defparam \rsin_pipe[3][3] .power_up = "low";

dffeas \rsin_pipe[3][4] (
	.clk(clk),
	.d(\rsin_pipe[3][4]~3_combout ),
	.asdata(\rsin_pipe[2][4]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_4_3),
	.prn(vcc));
defparam \rsin_pipe[3][4] .is_wysiwyg = "true";
defparam \rsin_pipe[3][4] .power_up = "low";

dffeas \rsin_pipe[3][5] (
	.clk(clk),
	.d(\rsin_pipe[3][5]~4_combout ),
	.asdata(\rsin_pipe[2][5]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_5_3),
	.prn(vcc));
defparam \rsin_pipe[3][5] .is_wysiwyg = "true";
defparam \rsin_pipe[3][5] .power_up = "low";

dffeas \rsin_pipe[3][6] (
	.clk(clk),
	.d(\rsin_pipe[3][6]~5_combout ),
	.asdata(\rsin_pipe[2][6]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_6_3),
	.prn(vcc));
defparam \rsin_pipe[3][6] .is_wysiwyg = "true";
defparam \rsin_pipe[3][6] .power_up = "low";

dffeas \rsin_pipe[3][7] (
	.clk(clk),
	.d(\rsin_pipe[3][7]~6_combout ),
	.asdata(\rsin_pipe[2][7]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_7_3),
	.prn(vcc));
defparam \rsin_pipe[3][7] .is_wysiwyg = "true";
defparam \rsin_pipe[3][7] .power_up = "low";

dffeas \rsin_pipe[3][8] (
	.clk(clk),
	.d(\rsin_pipe[3][8]~7_combout ),
	.asdata(\rsin_pipe[2][8]~q ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\process_0~1_combout ),
	.ena(source_ena),
	.q(rsin_pipe_8_3),
	.prn(vcc));
defparam \rsin_pipe[3][8] .is_wysiwyg = "true";
defparam \rsin_pipe[3][8] .power_up = "low";

dffeas \sink_sop_pipe[3] (
	.clk(clk),
	.d(\sink_sop_pipe~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(sink_sop_pipe_3),
	.prn(vcc));
defparam \sink_sop_pipe[3] .is_wysiwyg = "true";
defparam \sink_sop_pipe[3] .power_up = "low";

cycloneive_lcell_comb \sink_ready_tap~0 (
	.dataa(source_ena),
	.datab(gnd),
	.datac(gnd),
	.datad(\shift3~q ),
	.cin(gnd),
	.combout(sink_ready_tap),
	.cout());
defparam \sink_ready_tap~0 .lut_mask = 16'hAAFF;
defparam \sink_ready_tap~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb source_val(
	.dataa(\source_ena_q_val~q ),
	.datab(\sink_val_pipe[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(source_val1),
	.cout());
defparam source_val.lut_mask = 16'hEEEE;
defparam source_val.sum_lutc_input = "datac";

dffeas source_eop(
	.clk(clk),
	.d(\eop_source_gen~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ena),
	.q(source_eop1),
	.prn(vcc));
defparam source_eop.is_wysiwyg = "true";
defparam source_eop.power_up = "low";

dffeas source_ena_q(
	.clk(clk),
	.d(source_ena),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\source_ena_q~q ),
	.prn(vcc));
defparam source_ena_q.is_wysiwyg = "true";
defparam source_ena_q.power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~17 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_1),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~17_combout ),
	.cout());
defparam \rsin_pipe_bk~17 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \process_2~0 (
	.dataa(sink_val),
	.datab(sink_eop),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\process_2~0_combout ),
	.cout());
defparam \process_2~0 .lut_mask = 16'hEEEE;
defparam \process_2~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \count~5 (
	.dataa(\count[1]~q ),
	.datab(sink_val),
	.datac(sink_eop),
	.datad(gnd),
	.cin(gnd),
	.combout(\count~5_combout ),
	.cout());
defparam \count~5 .lut_mask = 16'h7F7F;
defparam \count~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \count[2]~2 (
	.dataa(source_ena),
	.datab(\shift3~q ),
	.datac(sink_val),
	.datad(sink_eop),
	.cin(gnd),
	.combout(\count[2]~2_combout ),
	.cout());
defparam \count[2]~2 .lut_mask = 16'hFFFE;
defparam \count[2]~2 .sum_lutc_input = "datac";

dffeas \count[1] (
	.clk(clk),
	.d(\count~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\count[2]~2_combout ),
	.q(\count[1]~q ),
	.prn(vcc));
defparam \count[1] .is_wysiwyg = "true";
defparam \count[1] .power_up = "low";

cycloneive_lcell_comb \count~4 (
	.dataa(\count[1]~q ),
	.datab(sink_val),
	.datac(sink_eop),
	.datad(\count[2]~q ),
	.cin(gnd),
	.combout(\count~4_combout ),
	.cout());
defparam \count~4 .lut_mask = 16'h7FBF;
defparam \count~4 .sum_lutc_input = "datac";

dffeas \count[2] (
	.clk(clk),
	.d(\count~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\count[2]~2_combout ),
	.q(\count[2]~q ),
	.prn(vcc));
defparam \count[2] .is_wysiwyg = "true";
defparam \count[2] .power_up = "low";

cycloneive_lcell_comb \count~3 (
	.dataa(\process_2~0_combout ),
	.datab(\count[2]~q ),
	.datac(\count[1]~q ),
	.datad(\count[3]~q ),
	.cin(gnd),
	.combout(\count~3_combout ),
	.cout());
defparam \count~3 .lut_mask = 16'hD77D;
defparam \count~3 .sum_lutc_input = "datac";

dffeas \count[3] (
	.clk(clk),
	.d(\count~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\count[2]~2_combout ),
	.q(\count[3]~q ),
	.prn(vcc));
defparam \count[3] .is_wysiwyg = "true";
defparam \count[3] .power_up = "low";

cycloneive_lcell_comb \shift3~0 (
	.dataa(\count[3]~q ),
	.datab(\count[2]~q ),
	.datac(\count[1]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\shift3~0_combout ),
	.cout());
defparam \shift3~0 .lut_mask = 16'hFEFE;
defparam \shift3~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \count~6 (
	.dataa(sink_val),
	.datab(sink_eop),
	.datac(\count[4]~q ),
	.datad(\shift3~0_combout ),
	.cin(gnd),
	.combout(\count~6_combout ),
	.cout());
defparam \count~6 .lut_mask = 16'hEFFE;
defparam \count~6 .sum_lutc_input = "datac";

dffeas \count[4] (
	.clk(clk),
	.d(\count~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\count[2]~2_combout ),
	.q(\count[4]~q ),
	.prn(vcc));
defparam \count[4] .is_wysiwyg = "true";
defparam \count[4] .power_up = "low";

cycloneive_lcell_comb \shift3~1 (
	.dataa(source_ena),
	.datab(\count[4]~q ),
	.datac(\shift3~0_combout ),
	.datad(\shift3~q ),
	.cin(gnd),
	.combout(\shift3~1_combout ),
	.cout());
defparam \shift3~1 .lut_mask = 16'hFEFF;
defparam \shift3~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \shift3_bk~0 (
	.dataa(source_ena),
	.datab(gnd),
	.datac(gnd),
	.datad(\shift3~2_combout ),
	.cin(gnd),
	.combout(\shift3_bk~0_combout ),
	.cout());
defparam \shift3_bk~0 .lut_mask = 16'hFF55;
defparam \shift3_bk~0 .sum_lutc_input = "datac";

dffeas shift3_bk(
	.clk(clk),
	.d(\shift3_bk~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\shift3_bk~q ),
	.prn(vcc));
defparam shift3_bk.is_wysiwyg = "true";
defparam shift3_bk.power_up = "low";

cycloneive_lcell_comb \sink_eop_pipe_bk~0 (
	.dataa(sink_val),
	.datab(sink_eop),
	.datac(\source_ena_q~q ),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\sink_eop_pipe_bk~0_combout ),
	.cout());
defparam \sink_eop_pipe_bk~0 .lut_mask = 16'hFEFF;
defparam \sink_eop_pipe_bk~0 .sum_lutc_input = "datac";

dffeas \sink_eop_pipe_bk[1] (
	.clk(clk),
	.d(\sink_eop_pipe_bk~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\sink_eop_pipe_bk[1]~q ),
	.prn(vcc));
defparam \sink_eop_pipe_bk[1] .is_wysiwyg = "true";
defparam \sink_eop_pipe_bk[1] .power_up = "low";

cycloneive_lcell_comb \sink_eop_pipe~0 (
	.dataa(source_ena),
	.datab(sink_eop),
	.datac(\sink_eop_pipe_bk[1]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\sink_eop_pipe~0_combout ),
	.cout());
defparam \sink_eop_pipe~0 .lut_mask = 16'hFAFC;
defparam \sink_eop_pipe~0 .sum_lutc_input = "datac";

dffeas \sink_eop_pipe[1] (
	.clk(clk),
	.d(\sink_eop_pipe~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_eop_pipe[1]~q ),
	.prn(vcc));
defparam \sink_eop_pipe[1] .is_wysiwyg = "true";
defparam \sink_eop_pipe[1] .power_up = "low";

cycloneive_lcell_comb \shift3~2 (
	.dataa(\shift3_bk~q ),
	.datab(\process_2~0_combout ),
	.datac(\sink_eop_pipe[1]~q ),
	.datad(\sink_eop_pipe_bk[1]~q ),
	.cin(gnd),
	.combout(\shift3~2_combout ),
	.cout());
defparam \shift3~2 .lut_mask = 16'hEFFF;
defparam \shift3~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \shift3~3 (
	.dataa(\shift3~1_combout ),
	.datab(gnd),
	.datac(source_ena),
	.datad(\shift3~2_combout ),
	.cin(gnd),
	.combout(\shift3~3_combout ),
	.cout());
defparam \shift3~3 .lut_mask = 16'hFFF5;
defparam \shift3~3 .sum_lutc_input = "datac";

dffeas shift3(
	.clk(clk),
	.d(\shift3~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\shift3~q ),
	.prn(vcc));
defparam shift3.is_wysiwyg = "true";
defparam shift3.power_up = "low";

cycloneive_lcell_comb \sink_eop_pipe_bk[1]~1 (
	.dataa(\source_ena_q~q ),
	.datab(sink_val),
	.datac(\shift3~q ),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_eop_pipe_bk[1]~1_combout ),
	.cout());
defparam \sink_eop_pipe_bk[1]~1 .lut_mask = 16'hEBBE;
defparam \sink_eop_pipe_bk[1]~1 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][1] (
	.clk(clk),
	.d(\rsin_pipe_bk~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][1]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][1] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][1] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~17 (
	.dataa(sink_ready_tap),
	.datab(rsin_1),
	.datac(\rsin_pipe_bk[1][1]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~17_combout ),
	.cout());
defparam \rsin_pipe~17 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~17 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe[1][3]~16 (
	.dataa(sink_val),
	.datab(gnd),
	.datac(source_ena),
	.datad(\shift3~q ),
	.cin(gnd),
	.combout(\rsin_pipe[1][3]~16_combout ),
	.cout());
defparam \rsin_pipe[1][3]~16 .lut_mask = 16'hAFFF;
defparam \rsin_pipe[1][3]~16 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][1] (
	.clk(clk),
	.d(\rsin_pipe~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][1]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][1] .is_wysiwyg = "true";
defparam \rsin_pipe[1][1] .power_up = "low";

cycloneive_lcell_comb \sink_val_pipe_bk~3 (
	.dataa(\sink_val_pipe_bk[1]~q ),
	.datab(sink_val),
	.datac(\source_ena_q~q ),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\sink_val_pipe_bk~3_combout ),
	.cout());
defparam \sink_val_pipe_bk~3 .lut_mask = 16'hFEFF;
defparam \sink_val_pipe_bk~3 .sum_lutc_input = "datac";

dffeas \sink_val_pipe_bk[1] (
	.clk(clk),
	.d(\sink_val_pipe_bk~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_val_pipe_bk[1]~q ),
	.prn(vcc));
defparam \sink_val_pipe_bk[1] .is_wysiwyg = "true";
defparam \sink_val_pipe_bk[1] .power_up = "low";

cycloneive_lcell_comb \sink_val_pipe~2 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\sink_val_pipe_bk[1]~q ),
	.datac(sink_val),
	.datad(\shift3~q ),
	.cin(gnd),
	.combout(\sink_val_pipe~2_combout ),
	.cout());
defparam \sink_val_pipe~2 .lut_mask = 16'hEFFE;
defparam \sink_val_pipe~2 .sum_lutc_input = "datac";

dffeas \sink_val_pipe[1] (
	.clk(clk),
	.d(\sink_val_pipe~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_val_pipe[1]~q ),
	.prn(vcc));
defparam \sink_val_pipe[1] .is_wysiwyg = "true";
defparam \sink_val_pipe[1] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~9 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][1]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~9_combout ),
	.cout());
defparam \rsin_pipe_bk~9 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sink_val_pipe_bk~2 (
	.dataa(gnd),
	.datab(gnd),
	.datac(source_ena),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\sink_val_pipe_bk~2_combout ),
	.cout());
defparam \sink_val_pipe_bk~2 .lut_mask = 16'h0FF0;
defparam \sink_val_pipe_bk~2 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][1] (
	.clk(clk),
	.d(\rsin_pipe_bk~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][1]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][1] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][1] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~8 (
	.dataa(\rsin_pipe[1][1]~q ),
	.datab(\rsin_pipe_bk[2][1]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~8_combout ),
	.cout());
defparam \rsin_pipe~8 .lut_mask = 16'hAACC;
defparam \rsin_pipe~8 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][1] (
	.clk(clk),
	.d(\rsin_pipe~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][1]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][1] .is_wysiwyg = "true";
defparam \rsin_pipe[2][1] .power_up = "low";

cycloneive_lcell_comb \sink_val_pipe_bk~1 (
	.dataa(\sink_val_pipe_bk[2]~q ),
	.datab(\sink_val_pipe[1]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_val_pipe_bk~1_combout ),
	.cout());
defparam \sink_val_pipe_bk~1 .lut_mask = 16'hEEFF;
defparam \sink_val_pipe_bk~1 .sum_lutc_input = "datac";

dffeas \sink_val_pipe_bk[2] (
	.clk(clk),
	.d(\sink_val_pipe_bk~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_val_pipe_bk[2]~q ),
	.prn(vcc));
defparam \sink_val_pipe_bk[2] .is_wysiwyg = "true";
defparam \sink_val_pipe_bk[2] .power_up = "low";

cycloneive_lcell_comb \sink_val_pipe~1 (
	.dataa(\sink_val_pipe_bk[2]~q ),
	.datab(\sink_val_pipe[1]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sink_val_pipe~1_combout ),
	.cout());
defparam \sink_val_pipe~1 .lut_mask = 16'hEEEE;
defparam \sink_val_pipe~1 .sum_lutc_input = "datac";

dffeas \sink_val_pipe[2] (
	.clk(clk),
	.d(\sink_val_pipe~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_val_pipe[2]~q ),
	.prn(vcc));
defparam \sink_val_pipe[2] .is_wysiwyg = "true";
defparam \sink_val_pipe[2] .power_up = "low";

cycloneive_lcell_comb \sink_eop_pipe_bk~3 (
	.dataa(\sink_eop_pipe[1]~q ),
	.datab(\sink_val_pipe[1]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_eop_pipe_bk~3_combout ),
	.cout());
defparam \sink_eop_pipe_bk~3 .lut_mask = 16'hEEFF;
defparam \sink_eop_pipe_bk~3 .sum_lutc_input = "datac";

dffeas \sink_eop_pipe_bk[2] (
	.clk(clk),
	.d(\sink_eop_pipe_bk~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\sink_eop_pipe_bk[2]~q ),
	.prn(vcc));
defparam \sink_eop_pipe_bk[2] .is_wysiwyg = "true";
defparam \sink_eop_pipe_bk[2] .power_up = "low";

cycloneive_lcell_comb \sink_eop_pipe~1 (
	.dataa(\sink_eop_pipe[1]~q ),
	.datab(\sink_eop_pipe_bk[2]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\sink_eop_pipe~1_combout ),
	.cout());
defparam \sink_eop_pipe~1 .lut_mask = 16'hAACC;
defparam \sink_eop_pipe~1 .sum_lutc_input = "datac";

dffeas \sink_eop_pipe[2] (
	.clk(clk),
	.d(\sink_eop_pipe~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_eop_pipe[2]~q ),
	.prn(vcc));
defparam \sink_eop_pipe[2] .is_wysiwyg = "true";
defparam \sink_eop_pipe[2] .power_up = "low";

cycloneive_lcell_comb \sink_eop_pipe_bk~2 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\sink_eop_pipe[2]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_eop_pipe_bk~2_combout ),
	.cout());
defparam \sink_eop_pipe_bk~2 .lut_mask = 16'hEEFF;
defparam \sink_eop_pipe_bk~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~1 (
	.dataa(gnd),
	.datab(gnd),
	.datac(source_ena),
	.datad(\sink_val_pipe[2]~q ),
	.cin(gnd),
	.combout(\rsin_pipe_bk~1_combout ),
	.cout());
defparam \rsin_pipe_bk~1 .lut_mask = 16'h0FF0;
defparam \rsin_pipe_bk~1 .sum_lutc_input = "datac";

dffeas \sink_eop_pipe_bk[3] (
	.clk(clk),
	.d(\sink_eop_pipe_bk~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\sink_eop_pipe_bk[3]~q ),
	.prn(vcc));
defparam \sink_eop_pipe_bk[3] .is_wysiwyg = "true";
defparam \sink_eop_pipe_bk[3] .power_up = "low";

cycloneive_lcell_comb \shift_point~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\sink_eop_pipe_bk[3]~q ),
	.datad(\sink_eop_pipe[2]~q ),
	.cin(gnd),
	.combout(\shift_point~0_combout ),
	.cout());
defparam \shift_point~0 .lut_mask = 16'h0FFF;
defparam \shift_point~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sink_sop_pipe_bk~2 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(sink_sop),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\sink_sop_pipe_bk~2_combout ),
	.cout());
defparam \sink_sop_pipe_bk~2 .lut_mask = 16'hFEFF;
defparam \sink_sop_pipe_bk~2 .sum_lutc_input = "datac";

dffeas \sink_sop_pipe_bk[1] (
	.clk(clk),
	.d(\sink_sop_pipe_bk~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\sink_sop_pipe_bk[1]~q ),
	.prn(vcc));
defparam \sink_sop_pipe_bk[1] .is_wysiwyg = "true";
defparam \sink_sop_pipe_bk[1] .power_up = "low";

cycloneive_lcell_comb \sink_sop_pipe~2 (
	.dataa(sink_ready_tap),
	.datab(sink_sop),
	.datac(\sink_sop_pipe_bk[1]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\sink_sop_pipe~2_combout ),
	.cout());
defparam \sink_sop_pipe~2 .lut_mask = 16'hFAFC;
defparam \sink_sop_pipe~2 .sum_lutc_input = "datac";

dffeas \sink_sop_pipe[1] (
	.clk(clk),
	.d(\sink_sop_pipe~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\sink_sop_pipe[1]~q ),
	.prn(vcc));
defparam \sink_sop_pipe[1] .is_wysiwyg = "true";
defparam \sink_sop_pipe[1] .power_up = "low";

cycloneive_lcell_comb \sink_sop_pipe_bk~1 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\sink_sop_pipe[1]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_sop_pipe_bk~1_combout ),
	.cout());
defparam \sink_sop_pipe_bk~1 .lut_mask = 16'hEEFF;
defparam \sink_sop_pipe_bk~1 .sum_lutc_input = "datac";

dffeas \sink_sop_pipe_bk[2] (
	.clk(clk),
	.d(\sink_sop_pipe_bk~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\sink_sop_pipe_bk[2]~q ),
	.prn(vcc));
defparam \sink_sop_pipe_bk[2] .is_wysiwyg = "true";
defparam \sink_sop_pipe_bk[2] .power_up = "low";

cycloneive_lcell_comb \process_0~2 (
	.dataa(source_ena),
	.datab(\shift_point~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\process_0~2_combout ),
	.cout());
defparam \process_0~2 .lut_mask = 16'hEEEE;
defparam \process_0~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sink_eop_pipe~2 (
	.dataa(\sink_eop_pipe[2]~q ),
	.datab(\sink_eop_pipe_bk[3]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[2]~q ),
	.cin(gnd),
	.combout(\sink_eop_pipe~2_combout ),
	.cout());
defparam \sink_eop_pipe~2 .lut_mask = 16'hAACC;
defparam \sink_eop_pipe~2 .sum_lutc_input = "datac";

dffeas \sink_eop_pipe[3] (
	.clk(clk),
	.d(\sink_eop_pipe~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_eop_pipe[3]~q ),
	.prn(vcc));
defparam \sink_eop_pipe[3] .is_wysiwyg = "true";
defparam \sink_eop_pipe[3] .power_up = "low";

cycloneive_lcell_comb \count_del~3 (
	.dataa(\shift_point~q ),
	.datab(\count_del[1]~q ),
	.datac(\sink_eop_pipe[3]~q ),
	.datad(source_ena),
	.cin(gnd),
	.combout(\count_del~3_combout ),
	.cout());
defparam \count_del~3 .lut_mask = 16'h6996;
defparam \count_del~3 .sum_lutc_input = "datac";

dffeas \count_del[1] (
	.clk(clk),
	.d(\count_del~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\count_del[1]~q ),
	.prn(vcc));
defparam \count_del[1] .is_wysiwyg = "true";
defparam \count_del[1] .power_up = "low";

cycloneive_lcell_comb \count_del~2 (
	.dataa(\sink_eop_pipe[3]~q ),
	.datab(\process_0~2_combout ),
	.datac(\count_del[1]~q ),
	.datad(\count_del[2]~q ),
	.cin(gnd),
	.combout(\count_del~2_combout ),
	.cout());
defparam \count_del~2 .lut_mask = 16'hD77D;
defparam \count_del~2 .sum_lutc_input = "datac";

dffeas \count_del[2] (
	.clk(clk),
	.d(\count_del~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\count_del[2]~q ),
	.prn(vcc));
defparam \count_del[2] .is_wysiwyg = "true";
defparam \count_del[2] .power_up = "low";

cycloneive_lcell_comb \Add2~0 (
	.dataa(gnd),
	.datab(\count_del[3]~q ),
	.datac(\count_del[2]~q ),
	.datad(\count_del[1]~q ),
	.cin(gnd),
	.combout(\Add2~0_combout ),
	.cout());
defparam \Add2~0 .lut_mask = 16'hC33C;
defparam \Add2~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \count_del~1 (
	.dataa(\sink_eop_pipe[3]~q ),
	.datab(\process_0~2_combout ),
	.datac(\count_del[3]~q ),
	.datad(\Add2~0_combout ),
	.cin(gnd),
	.combout(\count_del~1_combout ),
	.cout());
defparam \count_del~1 .lut_mask = 16'hF7D5;
defparam \count_del~1 .sum_lutc_input = "datac";

dffeas \count_del[3] (
	.clk(clk),
	.d(\count_del~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\count_del[3]~q ),
	.prn(vcc));
defparam \count_del[3] .is_wysiwyg = "true";
defparam \count_del[3] .power_up = "low";

cycloneive_lcell_comb \eop_source_gen~0 (
	.dataa(\count_del[3]~q ),
	.datab(\count_del[2]~q ),
	.datac(\count_del[1]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\eop_source_gen~0_combout ),
	.cout());
defparam \eop_source_gen~0 .lut_mask = 16'hFEFE;
defparam \eop_source_gen~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \count_del~0 (
	.dataa(\process_0~2_combout ),
	.datab(\eop_source_gen~0_combout ),
	.datac(\count_del[4]~q ),
	.datad(\sink_eop_pipe[3]~q ),
	.cin(gnd),
	.combout(\count_del~0_combout ),
	.cout());
defparam \count_del~0 .lut_mask = 16'hFF96;
defparam \count_del~0 .sum_lutc_input = "datac";

dffeas \count_del[4] (
	.clk(clk),
	.d(\count_del~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\count_del[4]~q ),
	.prn(vcc));
defparam \count_del[4] .is_wysiwyg = "true";
defparam \count_del[4] .power_up = "low";

cycloneive_lcell_comb \shift_point~1 (
	.dataa(\sink_sop_pipe[1]~q ),
	.datab(\sink_sop_pipe_bk[2]~q ),
	.datac(\count_del[4]~q ),
	.datad(\eop_source_gen~0_combout ),
	.cin(gnd),
	.combout(\shift_point~1_combout ),
	.cout());
defparam \shift_point~1 .lut_mask = 16'hFFFE;
defparam \shift_point~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \shift_point~2 (
	.dataa(\shift_point~0_combout ),
	.datab(\shift_point~1_combout ),
	.datac(source_ena),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\shift_point~2_combout ),
	.cout());
defparam \shift_point~2 .lut_mask = 16'hF737;
defparam \shift_point~2 .sum_lutc_input = "datac";

dffeas shift_point(
	.clk(clk),
	.d(\shift_point~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\shift_point~q ),
	.prn(vcc));
defparam shift_point.is_wysiwyg = "true";
defparam shift_point.power_up = "low";

cycloneive_lcell_comb \point[1] (
	.dataa(gnd),
	.datab(\reg_q[1][1]~q ),
	.datac(\rsin_pipe[2][1]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[1]~combout ),
	.cout());
defparam \point[1] .lut_mask = 16'h3CFF;
defparam \point[1] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[6][3]~10 (
	.dataa(\point[3]~combout ),
	.datab(\point[1]~combout ),
	.datac(\point[6]~combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[6][3]~10_combout ),
	.cout());
defparam \reg_d[6][3]~10 .lut_mask = 16'h9696;
defparam \reg_d[6][3]~10 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~23 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_7),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~23_combout ),
	.cout());
defparam \rsin_pipe_bk~23 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~23 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][7] (
	.clk(clk),
	.d(\rsin_pipe_bk~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][7]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][7] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][7] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~23 (
	.dataa(sink_ready_tap),
	.datab(rsin_7),
	.datac(\rsin_pipe_bk[1][7]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~23_combout ),
	.cout());
defparam \rsin_pipe~23 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~23 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][7] (
	.clk(clk),
	.d(\rsin_pipe~23_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][7]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][7] .is_wysiwyg = "true";
defparam \rsin_pipe[1][7] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~15 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][7]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~15_combout ),
	.cout());
defparam \rsin_pipe_bk~15 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~15 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][7] (
	.clk(clk),
	.d(\rsin_pipe_bk~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][7]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][7] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][7] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~14 (
	.dataa(\rsin_pipe[1][7]~q ),
	.datab(\rsin_pipe_bk[2][7]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~14_combout ),
	.cout());
defparam \rsin_pipe~14 .lut_mask = 16'hAACC;
defparam \rsin_pipe~14 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][7] (
	.clk(clk),
	.d(\rsin_pipe~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][7]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][7] .is_wysiwyg = "true";
defparam \rsin_pipe[2][7] .power_up = "low";

cycloneive_lcell_comb \point[7] (
	.dataa(gnd),
	.datab(\reg_q[1][7]~q ),
	.datac(\rsin_pipe[2][7]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[7]~combout ),
	.cout());
defparam \point[7] .lut_mask = 16'h3CFF;
defparam \point[7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~21 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_5),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~21_combout ),
	.cout());
defparam \rsin_pipe_bk~21 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~21 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][5] (
	.clk(clk),
	.d(\rsin_pipe_bk~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][5]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][5] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][5] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~21 (
	.dataa(sink_ready_tap),
	.datab(rsin_5),
	.datac(\rsin_pipe_bk[1][5]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~21_combout ),
	.cout());
defparam \rsin_pipe~21 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~21 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][5] (
	.clk(clk),
	.d(\rsin_pipe~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][5]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][5] .is_wysiwyg = "true";
defparam \rsin_pipe[1][5] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~13 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][5]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~13_combout ),
	.cout());
defparam \rsin_pipe_bk~13 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~13 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][5] (
	.clk(clk),
	.d(\rsin_pipe_bk~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][5]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][5] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][5] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~12 (
	.dataa(\rsin_pipe[1][5]~q ),
	.datab(\rsin_pipe_bk[2][5]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~12_combout ),
	.cout());
defparam \rsin_pipe~12 .lut_mask = 16'hAACC;
defparam \rsin_pipe~12 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][5] (
	.clk(clk),
	.d(\rsin_pipe~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][5]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][5] .is_wysiwyg = "true";
defparam \rsin_pipe[2][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][5]~15 (
	.dataa(\reg_q[1][5]~q ),
	.datab(\rsin_pipe[2][5]~q ),
	.datac(\shift_point~q ),
	.datad(\point[7]~combout ),
	.cin(gnd),
	.combout(\reg_d[7][5]~15_combout ),
	.cout());
defparam \reg_d[7][5]~15 .lut_mask = 16'h6996;
defparam \reg_d[7][5]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \enable~0 (
	.dataa(source_ena),
	.datab(\sink_val_pipe[2]~q ),
	.datac(gnd),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\enable~0_combout ),
	.cout());
defparam \enable~0 .lut_mask = 16'hAACC;
defparam \enable~0 .sum_lutc_input = "datac";

dffeas \reg_q[8][5] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][5]~q ),
	.prn(vcc));
defparam \reg_q[8][5] .is_wysiwyg = "true";
defparam \reg_q[8][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][5] (
	.dataa(\point[5]~combout ),
	.datab(\point[7]~combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[8][5]~q ),
	.cin(gnd),
	.combout(\reg_d[7][5]~combout ),
	.cout());
defparam \reg_d[7][5] .lut_mask = 16'h6996;
defparam \reg_d[7][5] .sum_lutc_input = "datac";

dffeas \reg_q[7][5] (
	.clk(clk),
	.d(\reg_d[7][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][5]~q ),
	.prn(vcc));
defparam \reg_q[7][5] .is_wysiwyg = "true";
defparam \reg_q[7][5] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~24 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_8),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~24_combout ),
	.cout());
defparam \rsin_pipe_bk~24 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~24 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][8] (
	.clk(clk),
	.d(\rsin_pipe_bk~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][8]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][8] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][8] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~24 (
	.dataa(sink_ready_tap),
	.datab(rsin_8),
	.datac(\rsin_pipe_bk[1][8]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~24_combout ),
	.cout());
defparam \rsin_pipe~24 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~24 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][8] (
	.clk(clk),
	.d(\rsin_pipe~24_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][8]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][8] .is_wysiwyg = "true";
defparam \rsin_pipe[1][8] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~16 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][8]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~16_combout ),
	.cout());
defparam \rsin_pipe_bk~16 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~16 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][8] (
	.clk(clk),
	.d(\rsin_pipe_bk~16_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][8]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][8] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][8] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~15 (
	.dataa(\rsin_pipe[1][8]~q ),
	.datab(\rsin_pipe_bk[2][8]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~15_combout ),
	.cout());
defparam \rsin_pipe~15 .lut_mask = 16'hAACC;
defparam \rsin_pipe~15 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][8] (
	.clk(clk),
	.d(\rsin_pipe~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][8]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][8] .is_wysiwyg = "true";
defparam \rsin_pipe[2][8] .power_up = "low";

cycloneive_lcell_comb \point[8] (
	.dataa(gnd),
	.datab(\reg_q[1][8]~q ),
	.datac(\rsin_pipe[2][8]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[8]~combout ),
	.cout());
defparam \point[8] .lut_mask = 16'h3CFF;
defparam \point[8] .sum_lutc_input = "datac";

dffeas \reg_q[8][2] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][2]~q ),
	.prn(vcc));
defparam \reg_q[8][2] .is_wysiwyg = "true";
defparam \reg_q[8][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][2] (
	.dataa(\point[3]~combout ),
	.datab(\point[4]~combout ),
	.datac(\reg_q[8][2]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[7][2]~combout ),
	.cout());
defparam \reg_d[7][2] .lut_mask = 16'h9696;
defparam \reg_d[7][2] .sum_lutc_input = "datac";

dffeas \reg_q[7][2] (
	.clk(clk),
	.d(\reg_d[7][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][2]~q ),
	.prn(vcc));
defparam \reg_q[7][2] .is_wysiwyg = "true";
defparam \reg_q[7][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][2] (
	.dataa(\point[3]~combout ),
	.datab(\point[2]~combout ),
	.datac(\point[5]~combout ),
	.datad(\reg_q[7][2]~q ),
	.cin(gnd),
	.combout(\reg_d[6][2]~combout ),
	.cout());
defparam \reg_d[6][2] .lut_mask = 16'h6996;
defparam \reg_d[6][2] .sum_lutc_input = "datac";

dffeas \reg_q[6][2] (
	.clk(clk),
	.d(\reg_d[6][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][2]~q ),
	.prn(vcc));
defparam \reg_q[6][2] .is_wysiwyg = "true";
defparam \reg_q[6][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][2] (
	.dataa(\reg_d[5][2]~8_combout ),
	.datab(\point[5]~combout ),
	.datac(\point[8]~combout ),
	.datad(\reg_q[6][2]~q ),
	.cin(gnd),
	.combout(\reg_d[5][2]~combout ),
	.cout());
defparam \reg_d[5][2] .lut_mask = 16'h6996;
defparam \reg_d[5][2] .sum_lutc_input = "datac";

dffeas \reg_q[5][2] (
	.clk(clk),
	.d(\reg_d[5][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][2]~q ),
	.prn(vcc));
defparam \reg_q[5][2] .is_wysiwyg = "true";
defparam \reg_q[5][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][2]~14 (
	.dataa(\point[1]~combout ),
	.datab(\point[8]~combout ),
	.datac(\ifg_std:cmuln|c[1]~14_combout ),
	.datad(\reg_q[5][2]~q ),
	.cin(gnd),
	.combout(\reg_d[4][2]~14_combout ),
	.cout());
defparam \reg_d[4][2]~14 .lut_mask = 16'h6996;
defparam \reg_d[4][2]~14 .sum_lutc_input = "datac";

dffeas \reg_q[4][2] (
	.clk(clk),
	.d(\reg_d[4][2]~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][2]~q ),
	.prn(vcc));
defparam \reg_q[4][2] .is_wysiwyg = "true";
defparam \reg_q[4][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][2] (
	.dataa(\point[8]~combout ),
	.datab(\reg_d[4][4]~13_combout ),
	.datac(\reg_q[4][2]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[3][2]~combout ),
	.cout());
defparam \reg_d[3][2] .lut_mask = 16'h9696;
defparam \reg_d[3][2] .sum_lutc_input = "datac";

dffeas \reg_q[3][2] (
	.clk(clk),
	.d(\reg_d[3][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][2]~q ),
	.prn(vcc));
defparam \reg_q[3][2] .is_wysiwyg = "true";
defparam \reg_q[3][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][2] (
	.dataa(\point[1]~combout ),
	.datab(\point[2]~combout ),
	.datac(\point[7]~combout ),
	.datad(\reg_q[3][2]~q ),
	.cin(gnd),
	.combout(\reg_d[2][2]~combout ),
	.cout());
defparam \reg_d[2][2] .lut_mask = 16'h6996;
defparam \reg_d[2][2] .sum_lutc_input = "datac";

dffeas \reg_q[2][2] (
	.clk(clk),
	.d(\reg_d[2][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][2]~q ),
	.prn(vcc));
defparam \reg_q[2][2] .is_wysiwyg = "true";
defparam \reg_q[2][2] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][2] (
	.dataa(\reg_d[5][2]~8_combout ),
	.datab(\point[8]~combout ),
	.datac(\reg_q[2][2]~q ),
	.datad(\ifg_std:cmuln|c[1]~14_combout ),
	.cin(gnd),
	.combout(\reg_d[1][2]~combout ),
	.cout());
defparam \reg_d[1][2] .lut_mask = 16'h6996;
defparam \reg_d[1][2] .sum_lutc_input = "datac";

dffeas \reg_q[1][2] (
	.clk(clk),
	.d(\reg_d[1][2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][2]~q ),
	.prn(vcc));
defparam \reg_q[1][2] .is_wysiwyg = "true";
defparam \reg_q[1][2] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~18 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_2),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~18_combout ),
	.cout());
defparam \rsin_pipe_bk~18 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~18 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][2] (
	.clk(clk),
	.d(\rsin_pipe_bk~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][2]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][2] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][2] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~18 (
	.dataa(sink_ready_tap),
	.datab(rsin_2),
	.datac(\rsin_pipe_bk[1][2]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~18_combout ),
	.cout());
defparam \rsin_pipe~18 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~18 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][2] (
	.clk(clk),
	.d(\rsin_pipe~18_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][2]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][2] .is_wysiwyg = "true";
defparam \rsin_pipe[1][2] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~10 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][2]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~10_combout ),
	.cout());
defparam \rsin_pipe_bk~10 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~10 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][2] (
	.clk(clk),
	.d(\rsin_pipe_bk~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][2]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][2] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][2] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~9 (
	.dataa(\rsin_pipe[1][2]~q ),
	.datab(\rsin_pipe_bk[2][2]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~9_combout ),
	.cout());
defparam \rsin_pipe~9 .lut_mask = 16'hAACC;
defparam \rsin_pipe~9 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][2] (
	.clk(clk),
	.d(\rsin_pipe~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][2]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][2] .is_wysiwyg = "true";
defparam \rsin_pipe[2][2] .power_up = "low";

cycloneive_lcell_comb \point[2] (
	.dataa(gnd),
	.datab(\reg_q[1][2]~q ),
	.datac(\rsin_pipe[2][2]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[2]~combout ),
	.cout());
defparam \point[2] .lut_mask = 16'h3CFF;
defparam \point[2] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[4][4]~13 (
	.dataa(\point[4]~combout ),
	.datab(\point[2]~combout ),
	.datac(\point[6]~combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[4][4]~13_combout ),
	.cout());
defparam \reg_d[4][4]~13 .lut_mask = 16'h9696;
defparam \reg_d[4][4]~13 .sum_lutc_input = "datac";

dffeas \reg_q[8][8] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][8]~q ),
	.prn(vcc));
defparam \reg_q[8][8] .is_wysiwyg = "true";
defparam \reg_q[8][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][8] (
	.dataa(\point[1]~combout ),
	.datab(\point[2]~combout ),
	.datac(\point[8]~combout ),
	.datad(\reg_q[8][8]~q ),
	.cin(gnd),
	.combout(\reg_d[7][8]~combout ),
	.cout());
defparam \reg_d[7][8] .lut_mask = 16'h6996;
defparam \reg_d[7][8] .sum_lutc_input = "datac";

dffeas \reg_q[7][8] (
	.clk(clk),
	.d(\reg_d[7][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][8]~q ),
	.prn(vcc));
defparam \reg_q[7][8] .is_wysiwyg = "true";
defparam \reg_q[7][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][8] (
	.dataa(\point[3]~combout ),
	.datab(\point[1]~combout ),
	.datac(\reg_q[7][8]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[6][8]~combout ),
	.cout());
defparam \reg_d[6][8] .lut_mask = 16'h9696;
defparam \reg_d[6][8] .sum_lutc_input = "datac";

dffeas \reg_q[6][8] (
	.clk(clk),
	.d(\reg_d[6][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][8]~q ),
	.prn(vcc));
defparam \reg_q[6][8] .is_wysiwyg = "true";
defparam \reg_q[6][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][8] (
	.dataa(\point[2]~combout ),
	.datab(\point[8]~combout ),
	.datac(\reg_d[6][3]~10_combout ),
	.datad(\reg_q[6][8]~q ),
	.cin(gnd),
	.combout(\reg_d[5][8]~combout ),
	.cout());
defparam \reg_d[5][8] .lut_mask = 16'h6996;
defparam \reg_d[5][8] .sum_lutc_input = "datac";

dffeas \reg_q[5][8] (
	.clk(clk),
	.d(\reg_d[5][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][8]~q ),
	.prn(vcc));
defparam \reg_q[5][8] .is_wysiwyg = "true";
defparam \reg_q[5][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][8] (
	.dataa(\point[3]~combout ),
	.datab(\point[4]~combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[5][8]~q ),
	.cin(gnd),
	.combout(\reg_d[4][8]~combout ),
	.cout());
defparam \reg_d[4][8] .lut_mask = 16'h6996;
defparam \reg_d[4][8] .sum_lutc_input = "datac";

dffeas \reg_q[4][8] (
	.clk(clk),
	.d(\reg_d[4][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][8]~q ),
	.prn(vcc));
defparam \reg_q[4][8] .is_wysiwyg = "true";
defparam \reg_q[4][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][8] (
	.dataa(\reg_d[7][7]~16_combout ),
	.datab(\reg_d[4][4]~13_combout ),
	.datac(\reg_q[4][8]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[3][8]~combout ),
	.cout());
defparam \reg_d[3][8] .lut_mask = 16'h9696;
defparam \reg_d[3][8] .sum_lutc_input = "datac";

dffeas \reg_q[3][8] (
	.clk(clk),
	.d(\reg_d[3][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][8]~q ),
	.prn(vcc));
defparam \reg_q[3][8] .is_wysiwyg = "true";
defparam \reg_q[3][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][8] (
	.dataa(\point[5]~combout ),
	.datab(\point[7]~combout ),
	.datac(\point[8]~combout ),
	.datad(\reg_q[3][8]~q ),
	.cin(gnd),
	.combout(\reg_d[2][8]~combout ),
	.cout());
defparam \reg_d[2][8] .lut_mask = 16'h6996;
defparam \reg_d[2][8] .sum_lutc_input = "datac";

dffeas \reg_q[2][8] (
	.clk(clk),
	.d(\reg_d[2][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][8]~q ),
	.prn(vcc));
defparam \reg_q[2][8] .is_wysiwyg = "true";
defparam \reg_q[2][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][8] (
	.dataa(\reg_d[5][2]~8_combout ),
	.datab(\point[6]~combout ),
	.datac(\reg_q[2][8]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[1][8]~combout ),
	.cout());
defparam \reg_d[1][8] .lut_mask = 16'h9696;
defparam \reg_d[1][8] .sum_lutc_input = "datac";

dffeas \reg_q[1][8] (
	.clk(clk),
	.d(\reg_d[1][8]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][8]~q ),
	.prn(vcc));
defparam \reg_q[1][8] .is_wysiwyg = "true";
defparam \reg_q[1][8] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][5] (
	.dataa(\reg_q[7][5]~q ),
	.datab(\shift_point~q ),
	.datac(\reg_q[1][8]~q ),
	.datad(\rsin_pipe[2][8]~q ),
	.cin(gnd),
	.combout(\reg_d[6][5]~combout ),
	.cout());
defparam \reg_d[6][5] .lut_mask = 16'h6996;
defparam \reg_d[6][5] .sum_lutc_input = "datac";

dffeas \reg_q[6][5] (
	.clk(clk),
	.d(\reg_d[6][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][5]~q ),
	.prn(vcc));
defparam \reg_q[6][5] .is_wysiwyg = "true";
defparam \reg_q[6][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][5] (
	.dataa(\point[3]~combout ),
	.datab(\point[5]~combout ),
	.datac(\reg_q[6][5]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[5][5]~combout ),
	.cout());
defparam \reg_d[5][5] .lut_mask = 16'h9696;
defparam \reg_d[5][5] .sum_lutc_input = "datac";

dffeas \reg_q[5][5] (
	.clk(clk),
	.d(\reg_d[5][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][5]~q ),
	.prn(vcc));
defparam \reg_q[5][5] .is_wysiwyg = "true";
defparam \reg_q[5][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][5] (
	.dataa(\point[3]~combout ),
	.datab(\point[1]~combout ),
	.datac(\reg_q[5][5]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[4][5]~combout ),
	.cout());
defparam \reg_d[4][5] .lut_mask = 16'h9696;
defparam \reg_d[4][5] .sum_lutc_input = "datac";

dffeas \reg_q[4][5] (
	.clk(clk),
	.d(\reg_d[4][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][5]~q ),
	.prn(vcc));
defparam \reg_q[4][5] .is_wysiwyg = "true";
defparam \reg_q[4][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][5] (
	.dataa(\point[4]~combout ),
	.datab(\reg_d[7][5]~15_combout ),
	.datac(\reg_d[6][3]~10_combout ),
	.datad(\reg_q[4][5]~q ),
	.cin(gnd),
	.combout(\reg_d[3][5]~combout ),
	.cout());
defparam \reg_d[3][5] .lut_mask = 16'h6996;
defparam \reg_d[3][5] .sum_lutc_input = "datac";

dffeas \reg_q[3][5] (
	.clk(clk),
	.d(\reg_d[3][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][5]~q ),
	.prn(vcc));
defparam \reg_q[3][5] .is_wysiwyg = "true";
defparam \reg_q[3][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][5] (
	.dataa(\reg_d[7][5]~15_combout ),
	.datab(\reg_q[3][5]~q ),
	.datac(\reg_d[4][4]~13_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[2][5]~combout ),
	.cout());
defparam \reg_d[2][5] .lut_mask = 16'h9696;
defparam \reg_d[2][5] .sum_lutc_input = "datac";

dffeas \reg_q[2][5] (
	.clk(clk),
	.d(\reg_d[2][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][5]~q ),
	.prn(vcc));
defparam \reg_q[2][5] .is_wysiwyg = "true";
defparam \reg_q[2][5] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][5] (
	.dataa(\point[7]~combout ),
	.datab(\reg_d[6][3]~10_combout ),
	.datac(\reg_q[2][5]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[1][5]~combout ),
	.cout());
defparam \reg_d[1][5] .lut_mask = 16'h9696;
defparam \reg_d[1][5] .sum_lutc_input = "datac";

dffeas \reg_q[1][5] (
	.clk(clk),
	.d(\reg_d[1][5]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][5]~q ),
	.prn(vcc));
defparam \reg_q[1][5] .is_wysiwyg = "true";
defparam \reg_q[1][5] .power_up = "low";

cycloneive_lcell_comb \point[5] (
	.dataa(gnd),
	.datab(\reg_q[1][5]~q ),
	.datac(\rsin_pipe[2][5]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[5]~combout ),
	.cout());
defparam \point[5] .lut_mask = 16'h3CFF;
defparam \point[5] .sum_lutc_input = "datac";

dffeas \reg_q[8][7] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][7]~q ),
	.prn(vcc));
defparam \reg_q[8][7] .is_wysiwyg = "true";
defparam \reg_q[8][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][7] (
	.dataa(\point[1]~combout ),
	.datab(\point[7]~combout ),
	.datac(\point[8]~combout ),
	.datad(\reg_q[8][7]~q ),
	.cin(gnd),
	.combout(\reg_d[7][7]~combout ),
	.cout());
defparam \reg_d[7][7] .lut_mask = 16'h6996;
defparam \reg_d[7][7] .sum_lutc_input = "datac";

dffeas \reg_q[7][7] (
	.clk(clk),
	.d(\reg_d[7][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][7]~q ),
	.prn(vcc));
defparam \reg_q[7][7] .is_wysiwyg = "true";
defparam \reg_q[7][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][7] (
	.dataa(\reg_q[7][7]~q ),
	.datab(\shift_point~q ),
	.datac(\reg_q[1][2]~q ),
	.datad(\rsin_pipe[2][2]~q ),
	.cin(gnd),
	.combout(\reg_d[6][7]~combout ),
	.cout());
defparam \reg_d[6][7] .lut_mask = 16'h6996;
defparam \reg_d[6][7] .sum_lutc_input = "datac";

dffeas \reg_q[6][7] (
	.clk(clk),
	.d(\reg_d[6][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][7]~q ),
	.prn(vcc));
defparam \reg_q[6][7] .is_wysiwyg = "true";
defparam \reg_q[6][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][7] (
	.dataa(\point[1]~combout ),
	.datab(\point[2]~combout ),
	.datac(\reg_d[7][5]~15_combout ),
	.datad(\reg_q[6][7]~q ),
	.cin(gnd),
	.combout(\reg_d[5][7]~combout ),
	.cout());
defparam \reg_d[5][7] .lut_mask = 16'h6996;
defparam \reg_d[5][7] .sum_lutc_input = "datac";

dffeas \reg_q[5][7] (
	.clk(clk),
	.d(\reg_d[5][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][7]~q ),
	.prn(vcc));
defparam \reg_q[5][7] .is_wysiwyg = "true";
defparam \reg_q[5][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][7] (
	.dataa(\point[3]~combout ),
	.datab(\point[2]~combout ),
	.datac(\point[5]~combout ),
	.datad(\reg_q[5][7]~q ),
	.cin(gnd),
	.combout(\reg_d[4][7]~combout ),
	.cout());
defparam \reg_d[4][7] .lut_mask = 16'h6996;
defparam \reg_d[4][7] .sum_lutc_input = "datac";

dffeas \reg_q[4][7] (
	.clk(clk),
	.d(\reg_d[4][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][7]~q ),
	.prn(vcc));
defparam \reg_q[4][7] .is_wysiwyg = "true";
defparam \reg_q[4][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][7] (
	.dataa(\reg_d[6][3]~10_combout ),
	.datab(\ifg_std:cmuln|c[3]~12_combout ),
	.datac(\reg_q[4][7]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[3][7]~combout ),
	.cout());
defparam \reg_d[3][7] .lut_mask = 16'h9696;
defparam \reg_d[3][7] .sum_lutc_input = "datac";

dffeas \reg_q[3][7] (
	.clk(clk),
	.d(\reg_d[3][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][7]~q ),
	.prn(vcc));
defparam \reg_q[3][7] .is_wysiwyg = "true";
defparam \reg_q[3][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][7] (
	.dataa(\point[4]~combout ),
	.datab(\point[6]~combout ),
	.datac(\reg_d[7][7]~16_combout ),
	.datad(\reg_q[3][7]~q ),
	.cin(gnd),
	.combout(\reg_d[2][7]~combout ),
	.cout());
defparam \reg_d[2][7] .lut_mask = 16'h6996;
defparam \reg_d[2][7] .sum_lutc_input = "datac";

dffeas \reg_q[2][7] (
	.clk(clk),
	.d(\reg_d[2][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][7]~q ),
	.prn(vcc));
defparam \reg_q[2][7] .is_wysiwyg = "true";
defparam \reg_q[2][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][7]~12 (
	.dataa(\reg_q[2][7]~q ),
	.datab(\shift_point~q ),
	.datac(\reg_q[1][8]~q ),
	.datad(\rsin_pipe[2][8]~q ),
	.cin(gnd),
	.combout(\reg_d[1][7]~12_combout ),
	.cout());
defparam \reg_d[1][7]~12 .lut_mask = 16'h6996;
defparam \reg_d[1][7]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[1][7] (
	.dataa(\point[1]~combout ),
	.datab(\point[5]~combout ),
	.datac(\reg_d[1][7]~12_combout ),
	.datad(\ifg_std:cmuln|c[6]~15_combout ),
	.cin(gnd),
	.combout(\reg_d[1][7]~combout ),
	.cout());
defparam \reg_d[1][7] .lut_mask = 16'h6996;
defparam \reg_d[1][7] .sum_lutc_input = "datac";

dffeas \reg_q[1][7] (
	.clk(clk),
	.d(\reg_d[1][7]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][7]~q ),
	.prn(vcc));
defparam \reg_q[1][7] .is_wysiwyg = "true";
defparam \reg_q[1][7] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][7]~16 (
	.dataa(\reg_q[1][7]~q ),
	.datab(\rsin_pipe[2][7]~q ),
	.datac(\shift_point~q ),
	.datad(\point[8]~combout ),
	.cin(gnd),
	.combout(\reg_d[7][7]~16_combout ),
	.cout());
defparam \reg_d[7][7]~16 .lut_mask = 16'h6996;
defparam \reg_d[7][7]~16 .sum_lutc_input = "datac";

dffeas \reg_q[8][4] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][4]~q ),
	.prn(vcc));
defparam \reg_q[8][4] .is_wysiwyg = "true";
defparam \reg_q[8][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][4] (
	.dataa(\reg_d[7][4]~11_combout ),
	.datab(\ifg_std:cmuln|c[1]~14_combout ),
	.datac(\reg_q[8][4]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[7][4]~combout ),
	.cout());
defparam \reg_d[7][4] .lut_mask = 16'h9696;
defparam \reg_d[7][4] .sum_lutc_input = "datac";

dffeas \reg_q[7][4] (
	.clk(clk),
	.d(\reg_d[7][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][4]~q ),
	.prn(vcc));
defparam \reg_q[7][4] .is_wysiwyg = "true";
defparam \reg_q[7][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][4] (
	.dataa(\point[3]~combout ),
	.datab(\point[1]~combout ),
	.datac(\point[7]~combout ),
	.datad(\reg_q[7][4]~q ),
	.cin(gnd),
	.combout(\reg_d[6][4]~combout ),
	.cout());
defparam \reg_d[6][4] .lut_mask = 16'h6996;
defparam \reg_d[6][4] .sum_lutc_input = "datac";

dffeas \reg_q[6][4] (
	.clk(clk),
	.d(\reg_d[6][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][4]~q ),
	.prn(vcc));
defparam \reg_q[6][4] .is_wysiwyg = "true";
defparam \reg_q[6][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][4] (
	.dataa(\point[4]~combout ),
	.datab(\point[8]~combout ),
	.datac(\reg_d[6][3]~10_combout ),
	.datad(\reg_q[6][4]~q ),
	.cin(gnd),
	.combout(\reg_d[5][4]~combout ),
	.cout());
defparam \reg_d[5][4] .lut_mask = 16'h6996;
defparam \reg_d[5][4] .sum_lutc_input = "datac";

dffeas \reg_q[5][4] (
	.clk(clk),
	.d(\reg_d[5][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][4]~q ),
	.prn(vcc));
defparam \reg_q[5][4] .is_wysiwyg = "true";
defparam \reg_q[5][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][4] (
	.dataa(\point[3]~combout ),
	.datab(\reg_d[4][4]~13_combout ),
	.datac(\reg_q[5][4]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[4][4]~combout ),
	.cout());
defparam \reg_d[4][4] .lut_mask = 16'h9696;
defparam \reg_d[4][4] .sum_lutc_input = "datac";

dffeas \reg_q[4][4] (
	.clk(clk),
	.d(\reg_d[4][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][4]~q ),
	.prn(vcc));
defparam \reg_q[4][4] .is_wysiwyg = "true";
defparam \reg_q[4][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][4] (
	.dataa(\point[3]~combout ),
	.datab(\ifg_std:cmuln|c[3]~12_combout ),
	.datac(\reg_q[4][4]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[3][4]~combout ),
	.cout());
defparam \reg_d[3][4] .lut_mask = 16'h9696;
defparam \reg_d[3][4] .sum_lutc_input = "datac";

dffeas \reg_q[3][4] (
	.clk(clk),
	.d(\reg_d[3][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][4]~q ),
	.prn(vcc));
defparam \reg_q[3][4] .is_wysiwyg = "true";
defparam \reg_q[3][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][4] (
	.dataa(\point[4]~combout ),
	.datab(\reg_d[6][3]~10_combout ),
	.datac(\reg_d[7][7]~16_combout ),
	.datad(\reg_q[3][4]~q ),
	.cin(gnd),
	.combout(\reg_d[2][4]~combout ),
	.cout());
defparam \reg_d[2][4] .lut_mask = 16'h6996;
defparam \reg_d[2][4] .sum_lutc_input = "datac";

dffeas \reg_q[2][4] (
	.clk(clk),
	.d(\reg_d[2][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][4]~q ),
	.prn(vcc));
defparam \reg_q[2][4] .is_wysiwyg = "true";
defparam \reg_q[2][4] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][4]~9 (
	.dataa(\point[3]~combout ),
	.datab(\point[4]~combout ),
	.datac(\point[1]~combout ),
	.datad(\point[5]~combout ),
	.cin(gnd),
	.combout(\reg_d[1][4]~9_combout ),
	.cout());
defparam \reg_d[1][4]~9 .lut_mask = 16'h6996;
defparam \reg_d[1][4]~9 .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[1][4] (
	.dataa(gnd),
	.datab(gnd),
	.datac(\reg_q[2][4]~q ),
	.datad(\reg_d[1][4]~9_combout ),
	.cin(gnd),
	.combout(\reg_d[1][4]~combout ),
	.cout());
defparam \reg_d[1][4] .lut_mask = 16'h0FF0;
defparam \reg_d[1][4] .sum_lutc_input = "datac";

dffeas \reg_q[1][4] (
	.clk(clk),
	.d(\reg_d[1][4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][4]~q ),
	.prn(vcc));
defparam \reg_q[1][4] .is_wysiwyg = "true";
defparam \reg_q[1][4] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~20 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_4),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~20_combout ),
	.cout());
defparam \rsin_pipe_bk~20 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~20 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][4] (
	.clk(clk),
	.d(\rsin_pipe_bk~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][4]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][4] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][4] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~20 (
	.dataa(sink_ready_tap),
	.datab(rsin_4),
	.datac(\rsin_pipe_bk[1][4]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~20_combout ),
	.cout());
defparam \rsin_pipe~20 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~20 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][4] (
	.clk(clk),
	.d(\rsin_pipe~20_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][4]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][4] .is_wysiwyg = "true";
defparam \rsin_pipe[1][4] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~12 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][4]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~12_combout ),
	.cout());
defparam \rsin_pipe_bk~12 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~12 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][4] (
	.clk(clk),
	.d(\rsin_pipe_bk~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][4]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][4] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][4] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~11 (
	.dataa(\rsin_pipe[1][4]~q ),
	.datab(\rsin_pipe_bk[2][4]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~11_combout ),
	.cout());
defparam \rsin_pipe~11 .lut_mask = 16'hAACC;
defparam \rsin_pipe~11 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][4] (
	.clk(clk),
	.d(\rsin_pipe~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][4]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][4] .is_wysiwyg = "true";
defparam \rsin_pipe[2][4] .power_up = "low";

cycloneive_lcell_comb \point[4] (
	.dataa(gnd),
	.datab(\reg_q[1][4]~q ),
	.datac(\rsin_pipe[2][4]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[4]~combout ),
	.cout());
defparam \point[4] .lut_mask = 16'h3CFF;
defparam \point[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[7][4]~11 (
	.dataa(\point[4]~combout ),
	.datab(\point[1]~combout ),
	.datac(\point[2]~combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[7][4]~11_combout ),
	.cout());
defparam \reg_d[7][4]~11 .lut_mask = 16'h9696;
defparam \reg_d[7][4]~11 .sum_lutc_input = "datac";

dffeas \reg_q[8][6] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[6]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][6]~q ),
	.prn(vcc));
defparam \reg_q[8][6] .is_wysiwyg = "true";
defparam \reg_q[8][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][6] (
	.dataa(\point[7]~combout ),
	.datab(\point[8]~combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[8][6]~q ),
	.cin(gnd),
	.combout(\reg_d[7][6]~combout ),
	.cout());
defparam \reg_d[7][6] .lut_mask = 16'h6996;
defparam \reg_d[7][6] .sum_lutc_input = "datac";

dffeas \reg_q[7][6] (
	.clk(clk),
	.d(\reg_d[7][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][6]~q ),
	.prn(vcc));
defparam \reg_q[7][6] .is_wysiwyg = "true";
defparam \reg_q[7][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][6] (
	.dataa(\reg_q[7][6]~q ),
	.datab(\shift_point~q ),
	.datac(\reg_q[1][1]~q ),
	.datad(\rsin_pipe[2][1]~q ),
	.cin(gnd),
	.combout(\reg_d[6][6]~combout ),
	.cout());
defparam \reg_d[6][6] .lut_mask = 16'h6996;
defparam \reg_d[6][6] .sum_lutc_input = "datac";

dffeas \reg_q[6][6] (
	.clk(clk),
	.d(\reg_d[6][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][6]~q ),
	.prn(vcc));
defparam \reg_q[6][6] .is_wysiwyg = "true";
defparam \reg_q[6][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][6] (
	.dataa(\point[4]~combout ),
	.datab(\point[1]~combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[6][6]~q ),
	.cin(gnd),
	.combout(\reg_d[5][6]~combout ),
	.cout());
defparam \reg_d[5][6] .lut_mask = 16'h6996;
defparam \reg_d[5][6] .sum_lutc_input = "datac";

dffeas \reg_q[5][6] (
	.clk(clk),
	.d(\reg_d[5][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][6]~q ),
	.prn(vcc));
defparam \reg_q[5][6] .is_wysiwyg = "true";
defparam \reg_q[5][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][6] (
	.dataa(\point[4]~combout ),
	.datab(\point[1]~combout ),
	.datac(\point[2]~combout ),
	.datad(\reg_q[5][6]~q ),
	.cin(gnd),
	.combout(\reg_d[4][6]~combout ),
	.cout());
defparam \reg_d[4][6] .lut_mask = 16'h6996;
defparam \reg_d[4][6] .sum_lutc_input = "datac";

dffeas \reg_q[4][6] (
	.clk(clk),
	.d(\reg_d[4][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][6]~q ),
	.prn(vcc));
defparam \reg_q[4][6] .is_wysiwyg = "true";
defparam \reg_q[4][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][6] (
	.dataa(\reg_d[4][4]~13_combout ),
	.datab(\ifg_std:cmuln|c[3]~12_combout ),
	.datac(\reg_q[4][6]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[3][6]~combout ),
	.cout());
defparam \reg_d[3][6] .lut_mask = 16'h9696;
defparam \reg_d[3][6] .sum_lutc_input = "datac";

dffeas \reg_q[3][6] (
	.clk(clk),
	.d(\reg_d[3][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][6]~q ),
	.prn(vcc));
defparam \reg_q[3][6] .is_wysiwyg = "true";
defparam \reg_q[3][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][6] (
	.dataa(\point[3]~combout ),
	.datab(\point[6]~combout ),
	.datac(\ifg_std:cmuln|c[3]~12_combout ),
	.datad(\reg_q[3][6]~q ),
	.cin(gnd),
	.combout(\reg_d[2][6]~combout ),
	.cout());
defparam \reg_d[2][6] .lut_mask = 16'h6996;
defparam \reg_d[2][6] .sum_lutc_input = "datac";

dffeas \reg_q[2][6] (
	.clk(clk),
	.d(\reg_d[2][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][6]~q ),
	.prn(vcc));
defparam \reg_q[2][6] .is_wysiwyg = "true";
defparam \reg_q[2][6] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][6] (
	.dataa(\reg_d[7][4]~11_combout ),
	.datab(\reg_d[7][7]~16_combout ),
	.datac(\reg_q[2][6]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[1][6]~combout ),
	.cout());
defparam \reg_d[1][6] .lut_mask = 16'h9696;
defparam \reg_d[1][6] .sum_lutc_input = "datac";

dffeas \reg_q[1][6] (
	.clk(clk),
	.d(\reg_d[1][6]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][6]~q ),
	.prn(vcc));
defparam \reg_q[1][6] .is_wysiwyg = "true";
defparam \reg_q[1][6] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~22 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_6),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~22_combout ),
	.cout());
defparam \rsin_pipe_bk~22 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~22 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][6] (
	.clk(clk),
	.d(\rsin_pipe_bk~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][6]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][6] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][6] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~22 (
	.dataa(sink_ready_tap),
	.datab(rsin_6),
	.datac(\rsin_pipe_bk[1][6]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~22_combout ),
	.cout());
defparam \rsin_pipe~22 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~22 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][6] (
	.clk(clk),
	.d(\rsin_pipe~22_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][6]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][6] .is_wysiwyg = "true";
defparam \rsin_pipe[1][6] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~14 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][6]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~14_combout ),
	.cout());
defparam \rsin_pipe_bk~14 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~14 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][6] (
	.clk(clk),
	.d(\rsin_pipe_bk~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][6]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][6] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][6] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~13 (
	.dataa(\rsin_pipe[1][6]~q ),
	.datab(\rsin_pipe_bk[2][6]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~13_combout ),
	.cout());
defparam \rsin_pipe~13 .lut_mask = 16'hAACC;
defparam \rsin_pipe~13 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][6] (
	.clk(clk),
	.d(\rsin_pipe~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][6]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][6] .is_wysiwyg = "true";
defparam \rsin_pipe[2][6] .power_up = "low";

cycloneive_lcell_comb \point[6] (
	.dataa(gnd),
	.datab(\reg_q[1][6]~q ),
	.datac(\rsin_pipe[2][6]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[6]~combout ),
	.cout());
defparam \point[6] .lut_mask = 16'h3CFF;
defparam \point[6] .sum_lutc_input = "datac";

dffeas \reg_q[8][3] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][3]~q ),
	.prn(vcc));
defparam \reg_q[8][3] .is_wysiwyg = "true";
defparam \reg_q[8][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][3] (
	.dataa(\point[4]~combout ),
	.datab(\point[5]~combout ),
	.datac(\ifg_std:cmuln|c[6]~15_combout ),
	.datad(\reg_q[8][3]~q ),
	.cin(gnd),
	.combout(\reg_d[7][3]~combout ),
	.cout());
defparam \reg_d[7][3] .lut_mask = 16'h6996;
defparam \reg_d[7][3] .sum_lutc_input = "datac";

dffeas \reg_q[7][3] (
	.clk(clk),
	.d(\reg_d[7][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][3]~q ),
	.prn(vcc));
defparam \reg_q[7][3] .is_wysiwyg = "true";
defparam \reg_q[7][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][3] (
	.dataa(\point[2]~combout ),
	.datab(\reg_d[6][3]~10_combout ),
	.datac(\reg_q[7][3]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[6][3]~combout ),
	.cout());
defparam \reg_d[6][3] .lut_mask = 16'h9696;
defparam \reg_d[6][3] .sum_lutc_input = "datac";

dffeas \reg_q[6][3] (
	.clk(clk),
	.d(\reg_d[6][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][3]~q ),
	.prn(vcc));
defparam \reg_q[6][3] .is_wysiwyg = "true";
defparam \reg_q[6][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][3] (
	.dataa(\point[1]~combout ),
	.datab(\reg_d[7][5]~15_combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[6][3]~q ),
	.cin(gnd),
	.combout(\reg_d[5][3]~combout ),
	.cout());
defparam \reg_d[5][3] .lut_mask = 16'h6996;
defparam \reg_d[5][3] .sum_lutc_input = "datac";

dffeas \reg_q[5][3] (
	.clk(clk),
	.d(\reg_d[5][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][3]~q ),
	.prn(vcc));
defparam \reg_q[5][3] .is_wysiwyg = "true";
defparam \reg_q[5][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][3] (
	.dataa(\reg_d[7][4]~11_combout ),
	.datab(\ifg_std:cmuln|c[1]~14_combout ),
	.datac(\reg_q[5][3]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[4][3]~combout ),
	.cout());
defparam \reg_d[4][3] .lut_mask = 16'h9696;
defparam \reg_d[4][3] .sum_lutc_input = "datac";

dffeas \reg_q[4][3] (
	.clk(clk),
	.d(\reg_d[4][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][3]~q ),
	.prn(vcc));
defparam \reg_q[4][3] .is_wysiwyg = "true";
defparam \reg_q[4][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][3] (
	.dataa(\reg_q[4][3]~q ),
	.datab(\shift_point~q ),
	.datac(\reg_q[1][8]~q ),
	.datad(\rsin_pipe[2][8]~q ),
	.cin(gnd),
	.combout(\reg_d[3][3]~combout ),
	.cout());
defparam \reg_d[3][3] .lut_mask = 16'h6996;
defparam \reg_d[3][3] .sum_lutc_input = "datac";

dffeas \reg_q[3][3] (
	.clk(clk),
	.d(\reg_d[3][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][3]~q ),
	.prn(vcc));
defparam \reg_q[3][3] .is_wysiwyg = "true";
defparam \reg_q[3][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][3] (
	.dataa(\point[3]~combout ),
	.datab(\point[2]~combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[3][3]~q ),
	.cin(gnd),
	.combout(\reg_d[2][3]~combout ),
	.cout());
defparam \reg_d[2][3] .lut_mask = 16'h6996;
defparam \reg_d[2][3] .sum_lutc_input = "datac";

dffeas \reg_q[2][3] (
	.clk(clk),
	.d(\reg_d[2][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][3]~q ),
	.prn(vcc));
defparam \reg_q[2][3] .is_wysiwyg = "true";
defparam \reg_q[2][3] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][3] (
	.dataa(\point[1]~combout ),
	.datab(\point[6]~combout ),
	.datac(\reg_q[2][3]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[1][3]~combout ),
	.cout());
defparam \reg_d[1][3] .lut_mask = 16'h9696;
defparam \reg_d[1][3] .sum_lutc_input = "datac";

dffeas \reg_q[1][3] (
	.clk(clk),
	.d(\reg_d[1][3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][3]~q ),
	.prn(vcc));
defparam \reg_q[1][3] .is_wysiwyg = "true";
defparam \reg_q[1][3] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~19 (
	.dataa(sink_val),
	.datab(\source_ena_q~q ),
	.datac(rsin_3),
	.datad(sink_ready_tap),
	.cin(gnd),
	.combout(\rsin_pipe_bk~19_combout ),
	.cout());
defparam \rsin_pipe_bk~19 .lut_mask = 16'hFEFF;
defparam \rsin_pipe_bk~19 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[1][3] (
	.clk(clk),
	.d(\rsin_pipe_bk~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_eop_pipe_bk[1]~1_combout ),
	.q(\rsin_pipe_bk[1][3]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[1][3] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[1][3] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~19 (
	.dataa(sink_ready_tap),
	.datab(rsin_3),
	.datac(\rsin_pipe_bk[1][3]~q ),
	.datad(sink_val),
	.cin(gnd),
	.combout(\rsin_pipe~19_combout ),
	.cout());
defparam \rsin_pipe~19 .lut_mask = 16'hFAFC;
defparam \rsin_pipe~19 .sum_lutc_input = "datac";

dffeas \rsin_pipe[1][3] (
	.clk(clk),
	.d(\rsin_pipe~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe[1][3]~16_combout ),
	.q(\rsin_pipe[1][3]~q ),
	.prn(vcc));
defparam \rsin_pipe[1][3] .is_wysiwyg = "true";
defparam \rsin_pipe[1][3] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~11 (
	.dataa(\sink_val_pipe[1]~q ),
	.datab(\rsin_pipe[1][3]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~11_combout ),
	.cout());
defparam \rsin_pipe_bk~11 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~11 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[2][3] (
	.clk(clk),
	.d(\rsin_pipe_bk~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_pipe_bk~2_combout ),
	.q(\rsin_pipe_bk[2][3]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[2][3] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[2][3] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe~10 (
	.dataa(\rsin_pipe[1][3]~q ),
	.datab(\rsin_pipe_bk[2][3]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\rsin_pipe~10_combout ),
	.cout());
defparam \rsin_pipe~10 .lut_mask = 16'hAACC;
defparam \rsin_pipe~10 .sum_lutc_input = "datac";

dffeas \rsin_pipe[2][3] (
	.clk(clk),
	.d(\rsin_pipe~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\rsin_pipe[2][3]~q ),
	.prn(vcc));
defparam \rsin_pipe[2][3] .is_wysiwyg = "true";
defparam \rsin_pipe[2][3] .power_up = "low";

cycloneive_lcell_comb \point[3] (
	.dataa(gnd),
	.datab(\reg_q[1][3]~q ),
	.datac(\rsin_pipe[2][3]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\point[3]~combout ),
	.cout());
defparam \point[3] .lut_mask = 16'h3CFF;
defparam \point[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \reg_d[5][2]~8 (
	.dataa(\point[3]~combout ),
	.datab(\point[4]~combout ),
	.datac(\point[1]~combout ),
	.datad(\point[2]~combout ),
	.cin(gnd),
	.combout(\reg_d[5][2]~8_combout ),
	.cout());
defparam \reg_d[5][2]~8 .lut_mask = 16'h6996;
defparam \reg_d[5][2]~8 .sum_lutc_input = "datac";

dffeas \reg_q[8][1] (
	.clk(clk),
	.d(\ifg_std:cmuln|c[1]~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[8][1]~q ),
	.prn(vcc));
defparam \reg_q[8][1] .is_wysiwyg = "true";
defparam \reg_q[8][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[7][1] (
	.dataa(\point[3]~combout ),
	.datab(\point[2]~combout ),
	.datac(\reg_q[8][1]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[7][1]~combout ),
	.cout());
defparam \reg_d[7][1] .lut_mask = 16'h9696;
defparam \reg_d[7][1] .sum_lutc_input = "datac";

dffeas \reg_q[7][1] (
	.clk(clk),
	.d(\reg_d[7][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[7][1]~q ),
	.prn(vcc));
defparam \reg_q[7][1] .is_wysiwyg = "true";
defparam \reg_q[7][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[6][1] (
	.dataa(\point[4]~combout ),
	.datab(\point[1]~combout ),
	.datac(\point[2]~combout ),
	.datad(\reg_q[7][1]~q ),
	.cin(gnd),
	.combout(\reg_d[6][1]~combout ),
	.cout());
defparam \reg_d[6][1] .lut_mask = 16'h6996;
defparam \reg_d[6][1] .sum_lutc_input = "datac";

dffeas \reg_q[6][1] (
	.clk(clk),
	.d(\reg_d[6][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[6][1]~q ),
	.prn(vcc));
defparam \reg_q[6][1] .is_wysiwyg = "true";
defparam \reg_q[6][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[5][1] (
	.dataa(\reg_d[5][2]~8_combout ),
	.datab(\point[7]~combout ),
	.datac(\reg_q[6][1]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[5][1]~combout ),
	.cout());
defparam \reg_d[5][1] .lut_mask = 16'h9696;
defparam \reg_d[5][1] .sum_lutc_input = "datac";

dffeas \reg_q[5][1] (
	.clk(clk),
	.d(\reg_d[5][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[5][1]~q ),
	.prn(vcc));
defparam \reg_q[5][1] .is_wysiwyg = "true";
defparam \reg_q[5][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[4][1] (
	.dataa(\point[4]~combout ),
	.datab(\point[5]~combout ),
	.datac(\point[7]~combout ),
	.datad(\reg_q[5][1]~q ),
	.cin(gnd),
	.combout(\reg_d[4][1]~combout ),
	.cout());
defparam \reg_d[4][1] .lut_mask = 16'h6996;
defparam \reg_d[4][1] .sum_lutc_input = "datac";

dffeas \reg_q[4][1] (
	.clk(clk),
	.d(\reg_d[4][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[4][1]~q ),
	.prn(vcc));
defparam \reg_q[4][1] .is_wysiwyg = "true";
defparam \reg_q[4][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[3][1] (
	.dataa(\point[3]~combout ),
	.datab(\point[1]~combout ),
	.datac(\ifg_std:cmuln|c[3]~12_combout ),
	.datad(\reg_q[4][1]~q ),
	.cin(gnd),
	.combout(\reg_d[3][1]~combout ),
	.cout());
defparam \reg_d[3][1] .lut_mask = 16'h6996;
defparam \reg_d[3][1] .sum_lutc_input = "datac";

dffeas \reg_q[3][1] (
	.clk(clk),
	.d(\reg_d[3][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[3][1]~q ),
	.prn(vcc));
defparam \reg_q[3][1] .is_wysiwyg = "true";
defparam \reg_q[3][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[2][1] (
	.dataa(\point[1]~combout ),
	.datab(\point[8]~combout ),
	.datac(\point[6]~combout ),
	.datad(\reg_q[3][1]~q ),
	.cin(gnd),
	.combout(\reg_d[2][1]~combout ),
	.cout());
defparam \reg_d[2][1] .lut_mask = 16'h6996;
defparam \reg_d[2][1] .sum_lutc_input = "datac";

dffeas \reg_q[2][1] (
	.clk(clk),
	.d(\reg_d[2][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[2][1]~q ),
	.prn(vcc));
defparam \reg_q[2][1] .is_wysiwyg = "true";
defparam \reg_q[2][1] .power_up = "low";

cycloneive_lcell_comb \reg_d[1][1] (
	.dataa(\reg_d[5][2]~8_combout ),
	.datab(\reg_q[2][1]~q ),
	.datac(\reg_d[7][5]~15_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\reg_d[1][1]~combout ),
	.cout());
defparam \reg_d[1][1] .lut_mask = 16'h9696;
defparam \reg_d[1][1] .sum_lutc_input = "datac";

dffeas \reg_q[1][1] (
	.clk(clk),
	.d(\reg_d[1][1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable~0_combout ),
	.q(\reg_q[1][1]~q ),
	.prn(vcc));
defparam \reg_q[1][1] .is_wysiwyg = "true";
defparam \reg_q[1][1] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe_bk~0 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][1]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~0_combout ),
	.cout());
defparam \rsin_pipe_bk~0 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~0 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][1] (
	.clk(clk),
	.d(\rsin_pipe_bk~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][1]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][1] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][1] .power_up = "low";

cycloneive_lcell_comb \process_0~0 (
	.dataa(source_ena),
	.datab(gnd),
	.datac(\sink_val_pipe[2]~q ),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\process_0~0_combout ),
	.cout());
defparam \process_0~0 .lut_mask = 16'hAFFF;
defparam \process_0~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe[3][1]~0 (
	.dataa(\reg_q[1][1]~q ),
	.datab(\rsin_pipe_bk[3][1]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][1]~0_combout ),
	.cout());
defparam \rsin_pipe[3][1]~0 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][1]~0 .sum_lutc_input = "datac";

cycloneive_lcell_comb \process_0~1 (
	.dataa(source_ena),
	.datab(\sink_val_pipe[2]~q ),
	.datac(gnd),
	.datad(\shift_point~q ),
	.cin(gnd),
	.combout(\process_0~1_combout ),
	.cout());
defparam \process_0~1 .lut_mask = 16'hEEFF;
defparam \process_0~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~2 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][2]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~2_combout ),
	.cout());
defparam \rsin_pipe_bk~2 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~2 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][2] (
	.clk(clk),
	.d(\rsin_pipe_bk~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][2]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][2] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][2] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][2]~1 (
	.dataa(\reg_q[1][2]~q ),
	.datab(\rsin_pipe_bk[3][2]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][2]~1_combout ),
	.cout());
defparam \rsin_pipe[3][2]~1 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][2]~1 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~3 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][3]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~3_combout ),
	.cout());
defparam \rsin_pipe_bk~3 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~3 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][3] (
	.clk(clk),
	.d(\rsin_pipe_bk~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][3]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][3] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][3] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][3]~2 (
	.dataa(\reg_q[1][3]~q ),
	.datab(\rsin_pipe_bk[3][3]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][3]~2_combout ),
	.cout());
defparam \rsin_pipe[3][3]~2 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][3]~2 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~4 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][4]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~4_combout ),
	.cout());
defparam \rsin_pipe_bk~4 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~4 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][4] (
	.clk(clk),
	.d(\rsin_pipe_bk~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][4]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][4] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][4] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][4]~3 (
	.dataa(\reg_q[1][4]~q ),
	.datab(\rsin_pipe_bk[3][4]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][4]~3_combout ),
	.cout());
defparam \rsin_pipe[3][4]~3 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][4]~3 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~5 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][5]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~5_combout ),
	.cout());
defparam \rsin_pipe_bk~5 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~5 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][5] (
	.clk(clk),
	.d(\rsin_pipe_bk~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][5]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][5] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][5] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][5]~4 (
	.dataa(\reg_q[1][5]~q ),
	.datab(\rsin_pipe_bk[3][5]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][5]~4_combout ),
	.cout());
defparam \rsin_pipe[3][5]~4 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][5]~4 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~6 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][6]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~6_combout ),
	.cout());
defparam \rsin_pipe_bk~6 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~6 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][6] (
	.clk(clk),
	.d(\rsin_pipe_bk~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][6]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][6] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][6] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][6]~5 (
	.dataa(\reg_q[1][6]~q ),
	.datab(\rsin_pipe_bk[3][6]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][6]~5_combout ),
	.cout());
defparam \rsin_pipe[3][6]~5 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][6]~5 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~7 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][7]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~7_combout ),
	.cout());
defparam \rsin_pipe_bk~7 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~7 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][7] (
	.clk(clk),
	.d(\rsin_pipe_bk~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][7]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][7] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][7] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][7]~6 (
	.dataa(\reg_q[1][7]~q ),
	.datab(\rsin_pipe_bk[3][7]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][7]~6_combout ),
	.cout());
defparam \rsin_pipe[3][7]~6 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][7]~6 .sum_lutc_input = "datac";

cycloneive_lcell_comb \rsin_pipe_bk~8 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\rsin_pipe[2][8]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\rsin_pipe_bk~8_combout ),
	.cout());
defparam \rsin_pipe_bk~8 .lut_mask = 16'hEEFF;
defparam \rsin_pipe_bk~8 .sum_lutc_input = "datac";

dffeas \rsin_pipe_bk[3][8] (
	.clk(clk),
	.d(\rsin_pipe_bk~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\rsin_pipe_bk[3][8]~q ),
	.prn(vcc));
defparam \rsin_pipe_bk[3][8] .is_wysiwyg = "true";
defparam \rsin_pipe_bk[3][8] .power_up = "low";

cycloneive_lcell_comb \rsin_pipe[3][8]~7 (
	.dataa(\reg_q[1][8]~q ),
	.datab(\rsin_pipe_bk[3][8]~q ),
	.datac(gnd),
	.datad(\process_0~0_combout ),
	.cin(gnd),
	.combout(\rsin_pipe[3][8]~7_combout ),
	.cout());
defparam \rsin_pipe[3][8]~7 .lut_mask = 16'hAACC;
defparam \rsin_pipe[3][8]~7 .sum_lutc_input = "datac";

cycloneive_lcell_comb \sink_sop_pipe~1 (
	.dataa(\sink_sop_pipe[1]~q ),
	.datab(\sink_sop_pipe_bk[2]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[1]~q ),
	.cin(gnd),
	.combout(\sink_sop_pipe~1_combout ),
	.cout());
defparam \sink_sop_pipe~1 .lut_mask = 16'hAACC;
defparam \sink_sop_pipe~1 .sum_lutc_input = "datac";

dffeas \sink_sop_pipe[2] (
	.clk(clk),
	.d(\sink_sop_pipe~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_sop_pipe[2]~q ),
	.prn(vcc));
defparam \sink_sop_pipe[2] .is_wysiwyg = "true";
defparam \sink_sop_pipe[2] .power_up = "low";

cycloneive_lcell_comb \sink_sop_pipe_bk~0 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\sink_sop_pipe[2]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_sop_pipe_bk~0_combout ),
	.cout());
defparam \sink_sop_pipe_bk~0 .lut_mask = 16'hEEFF;
defparam \sink_sop_pipe_bk~0 .sum_lutc_input = "datac";

dffeas \sink_sop_pipe_bk[3] (
	.clk(clk),
	.d(\sink_sop_pipe_bk~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\rsin_pipe_bk~1_combout ),
	.q(\sink_sop_pipe_bk[3]~q ),
	.prn(vcc));
defparam \sink_sop_pipe_bk[3] .is_wysiwyg = "true";
defparam \sink_sop_pipe_bk[3] .power_up = "low";

cycloneive_lcell_comb \sink_sop_pipe~0 (
	.dataa(\sink_sop_pipe[2]~q ),
	.datab(\sink_sop_pipe_bk[3]~q ),
	.datac(gnd),
	.datad(\sink_val_pipe[2]~q ),
	.cin(gnd),
	.combout(\sink_sop_pipe~0_combout ),
	.cout());
defparam \sink_sop_pipe~0 .lut_mask = 16'hAACC;
defparam \sink_sop_pipe~0 .sum_lutc_input = "datac";

dffeas source_ena_q_val(
	.clk(clk),
	.d(\process_0~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\source_ena_q_val~q ),
	.prn(vcc));
defparam source_ena_q_val.is_wysiwyg = "true";
defparam source_ena_q_val.power_up = "low";

cycloneive_lcell_comb \sink_val_pipe_bk~0 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\sink_val_pipe_bk[3]~q ),
	.datac(gnd),
	.datad(source_ena),
	.cin(gnd),
	.combout(\sink_val_pipe_bk~0_combout ),
	.cout());
defparam \sink_val_pipe_bk~0 .lut_mask = 16'hEEFF;
defparam \sink_val_pipe_bk~0 .sum_lutc_input = "datac";

dffeas \sink_val_pipe_bk[3] (
	.clk(clk),
	.d(\sink_val_pipe_bk~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_val_pipe_bk[3]~q ),
	.prn(vcc));
defparam \sink_val_pipe_bk[3] .is_wysiwyg = "true";
defparam \sink_val_pipe_bk[3] .power_up = "low";

cycloneive_lcell_comb \sink_val_pipe~0 (
	.dataa(\sink_val_pipe[2]~q ),
	.datab(\sink_val_pipe_bk[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sink_val_pipe~0_combout ),
	.cout());
defparam \sink_val_pipe~0 .lut_mask = 16'hEEEE;
defparam \sink_val_pipe~0 .sum_lutc_input = "datac";

dffeas \sink_val_pipe[3] (
	.clk(clk),
	.d(\sink_val_pipe~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(!source_ena),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_val_pipe[3]~q ),
	.prn(vcc));
defparam \sink_val_pipe[3] .is_wysiwyg = "true";
defparam \sink_val_pipe[3] .power_up = "low";

cycloneive_lcell_comb \eop_source_gen~1 (
	.dataa(\shift_point~q ),
	.datab(\count_del[4]~q ),
	.datac(\eop_source_gen~0_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\eop_source_gen~1_combout ),
	.cout());
defparam \eop_source_gen~1 .lut_mask = 16'hFEFE;
defparam \eop_source_gen~1 .sum_lutc_input = "datac";

endmodule

module RS_ENC_LANE_QUATUS_auk_rs_gfmul_cnt (
	rsin_pipe_3_2,
	rsin_pipe_5_2,
	rsin_pipe_7_2,
	shift_point,
	reg_q_3_1,
	reg_q_5_1,
	reg_q_7_1,
	point_3,
	point_4,
	point_1,
	point_2,
	point_5,
	point_7,
	point_8,
	point_6,
	c_3,
	c_31,
	c_4,
	c_5,
	c_6,
	c_7,
	c_8,
	c_1,
	c_61,
	c_2)/* synthesis synthesis_greybox=1 */;
input 	rsin_pipe_3_2;
input 	rsin_pipe_5_2;
input 	rsin_pipe_7_2;
input 	shift_point;
input 	reg_q_3_1;
input 	reg_q_5_1;
input 	reg_q_7_1;
input 	point_3;
input 	point_4;
input 	point_1;
input 	point_2;
input 	point_5;
input 	point_7;
input 	point_8;
input 	point_6;
output 	c_3;
output 	c_31;
output 	c_4;
output 	c_5;
output 	c_6;
output 	c_7;
output 	c_8;
output 	c_1;
output 	c_61;
output 	c_2;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cycloneive_lcell_comb \c[3]~12 (
	.dataa(point_5),
	.datab(point_7),
	.datac(point_8),
	.datad(gnd),
	.cin(gnd),
	.combout(c_3),
	.cout());
defparam \c[3]~12 .lut_mask = 16'h9696;
defparam \c[3]~12 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[3] (
	.dataa(point_5),
	.datab(point_7),
	.datac(point_8),
	.datad(point_6),
	.cin(gnd),
	.combout(c_31),
	.cout());
defparam \c[3] .lut_mask = 16'h6996;
defparam \c[3] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[4] (
	.dataa(point_1),
	.datab(point_5),
	.datac(point_7),
	.datad(point_8),
	.cin(gnd),
	.combout(c_4),
	.cout());
defparam \c[4] .lut_mask = 16'h6996;
defparam \c[4] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[5] (
	.dataa(point_1),
	.datab(point_2),
	.datac(point_5),
	.datad(point_8),
	.cin(gnd),
	.combout(c_5),
	.cout());
defparam \c[5] .lut_mask = 16'h6996;
defparam \c[5] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~13 (
	.dataa(point_3),
	.datab(point_2),
	.datac(point_6),
	.datad(gnd),
	.cin(gnd),
	.combout(c_6),
	.cout());
defparam \c[6]~13 .lut_mask = 16'h9696;
defparam \c[6]~13 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[7] (
	.dataa(point_3),
	.datab(point_4),
	.datac(point_7),
	.datad(gnd),
	.cin(gnd),
	.combout(c_7),
	.cout());
defparam \c[7] .lut_mask = 16'h9696;
defparam \c[7] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[8] (
	.dataa(point_4),
	.datab(point_5),
	.datac(point_8),
	.datad(gnd),
	.cin(gnd),
	.combout(c_8),
	.cout());
defparam \c[8] .lut_mask = 16'h9696;
defparam \c[8] .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[1]~14 (
	.dataa(reg_q_5_1),
	.datab(rsin_pipe_5_2),
	.datac(shift_point),
	.datad(point_6),
	.cin(gnd),
	.combout(c_1),
	.cout());
defparam \c[1]~14 .lut_mask = 16'h6996;
defparam \c[1]~14 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[6]~15 (
	.dataa(reg_q_3_1),
	.datab(rsin_pipe_3_2),
	.datac(shift_point),
	.datad(point_2),
	.cin(gnd),
	.combout(c_61),
	.cout());
defparam \c[6]~15 .lut_mask = 16'h6996;
defparam \c[6]~15 .sum_lutc_input = "datac";

cycloneive_lcell_comb \c[2] (
	.dataa(reg_q_7_1),
	.datab(rsin_pipe_7_2),
	.datac(shift_point),
	.datad(point_6),
	.cin(gnd),
	.combout(c_2),
	.cout());
defparam \c[2] .lut_mask = 16'h6996;
defparam \c[2] .sum_lutc_input = "datac";

endmodule
