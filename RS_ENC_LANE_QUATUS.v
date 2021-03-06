// megafunction wizard: %Reed Solomon v18.0%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			auk_rs_enc_top_atl
// ============================================================
// Generated by Reed Solomon 18.0 [Altera, IP Toolbench 1.3.0 Build 614]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2019 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.


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
	source_eop);


	input		clk;
	input		reset;
	input	[8:1]	rsin;
	input		sink_val;
	input		sink_sop;
	input		sink_eop;
	input		source_ena;
	output	[8:1]	rsout;
	output		sink_ena;
	output		source_val;
	output		source_sop;
	output		source_eop;

	wire [4:1] signal_wire0 = 4'b0;

	auk_rs_enc_top_atl	auk_rs_enc_top_atl_inst(
		.clk(clk),
		.reset(reset),
		.rsin(rsin),
		.sink_val(sink_val),
		.sink_sop(sink_sop),
		.sink_eop(sink_eop),
		.source_ena(source_ena),
		.numcheck(signal_wire0),
		.rsout(rsout),
		.sink_ena(sink_ena),
		.source_val(source_val),
		.source_sop(source_sop),
		.source_eop(source_eop));

	defparam
		auk_rs_enc_top_atl_inst.m = 8,
		auk_rs_enc_top_atl_inst.n = 40,
		auk_rs_enc_top_atl_inst.check = 8,
		auk_rs_enc_top_atl_inst.genstart = 0,
		auk_rs_enc_top_atl_inst.irrpol = 285,
		auk_rs_enc_top_atl_inst.rootspace = 1,
		auk_rs_enc_top_atl_inst.wide = 4,
		auk_rs_enc_top_atl_inst.Varcheck = "false";
endmodule

// =========================================================
// Reed Solomon Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, Reed Solomon Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="Reed-Solomon Compiler"  version="18.0"  build="614"  iptb_version="1.3.0 Build 614"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION active_core="auk_rs_enc_top_atl" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "use_mem" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "mem_type" value="M512"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "devicefamily" value="Cyclone IV E"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "Function_core" value="Encoder"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "Erasures" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "Varcheck" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "rserr_connect" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "err_bit_connect" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "full_errbit" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "test_for" value="BER"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "keysize" value="full"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "m" value="8"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "n" value="40"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "check" value="8"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "genstart" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "irrpol" value="285"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "rootspace" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="Verilog HDL"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "gb_enabled" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="RS_ENC_LANE_QUATUS.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "filename" value="RS_ENC_LANE_QUATUS_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:     <NAMESPACE name = "quartus_settings">
// Retrieval info:      <PRIVATE name = "DEVICE" value="EP4CE6F17C8"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Cyclone IV E"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <CONSTANTS>
// Retrieval info:     <CONSTANT name = "m" value="8"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "n" value="40"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "check" value="8"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "genstart" value="0"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "irrpol" value="285"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "rootspace" value="1"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "wide" value="4"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "Varcheck" value="false"  type="STRING" />
// Retrieval info:    </CONSTANTS>
// Retrieval info:    <PORTS>
// Retrieval info:     <PORT name = "clk" direction="INPUT"  connect_to="clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "reset" direction="INPUT"  connect_to="reset"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rsin" direction="INPUT"  connect_to="rsin"  default="NODEFVAL"  high_width="8"  low_width="1"  description="" />
// Retrieval info:     <PORT name = "rsout" direction="OUTPUT"  connect_to="rsout"  default="NODEFVAL"  high_width="8"  low_width="1"  description="" />
// Retrieval info:     <PORT name = "sink_ena" direction="OUTPUT"  connect_to="sink_ena"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sink_val" direction="INPUT"  connect_to="sink_val"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sink_sop" direction="INPUT"  connect_to="sink_sop"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sink_eop" direction="INPUT"  connect_to="sink_eop"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "source_ena" direction="INPUT"  connect_to="source_ena"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "source_val" direction="OUTPUT"  connect_to="source_val"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "source_sop" direction="OUTPUT"  connect_to="source_sop"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "source_eop" direction="OUTPUT"  connect_to="source_eop"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "numcheck" direction="INPUT"  connect_to="gnd"  default="NODEFVAL"  high_width="4"  low_width="1"  description="" />
// Retrieval info:    </PORTS>
// Retrieval info:    <LIBRARIES>
// Retrieval info:     <LIBRARY name = "ReedS"/>
// Retrieval info:    </LIBRARIES>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
// RELATED_FILES: RS_ENC_LANE_QUATUS.v;
// IPFS_FILES: RS_ENC_LANE_QUATUS.vo;
// =========================================================
