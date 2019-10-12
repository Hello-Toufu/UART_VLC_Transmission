#########################################################################
#########################################################################
## Description	:  Generic script to set NativeLink in Quartus for Reed-Solomon
##
##
## ALTERA Proprietary
## Copyright 2008 (c) Altera Corporation
## All rights reserved
##
#########################################################################
#########################################################################

set megacore_lib_dir {f:/intelfpga/18.0/ip/altera/reed_solomon/lib/}

set design_name "RS_DE_LANE_QUATUS"
set rs_arch "DEC"
set hdl_extension ".v"

## EDA Tool  , 1 - Modelsim, 2 - Modelsim-Altera,  3 - NCSim , 4 - VCS, 5 - ActiveHDL
#set eda_tool 3

################
set rs_arch [string tolower $rs_arch]
set model 1

if {[string match "dec" $rs_arch]} {
	set hex_files [glob ${design_name}_inv_*.hex]
	set tmp ""
	catch {set tmp [glob ${design_name}_alpha_*.hex]} return_msg
	if {[llength $tmp]} {
		lappend hex_files $tmp
	}
}

if {[file exists ${design_name}.vho]} {
	set ipfs_ext ".vho"
	set hdl_ext "vhd"
	set lang_name "VHDL"
} elseif {[file exists ${design_name}.vo]} {
	set ipfs_ext ".vo"
	set hdl_ext "v"
	set lang_name "Verilog"
} else {
	puts "IPFS file not found!"
	set $model 0;
}

if {$model == 1} {
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "$lang_name" -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_NAME testbench -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME wrapper_inst -section_id testbench
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME rs_work.testbench -section_id testbench
	set_global_assignment -name EDA_TEST_BENCH_FILE "${design_name}_encoded_data.txt" -section_id testbench -library rs_work
	set_global_assignment -name EDA_TEST_BENCH_FILE "${design_name}_block_period_stim.txt" -section_id testbench -library rs_work
	if {[string match "dec" $rs_arch]} {
		foreach i $hex_files {
			set_global_assignment -name EDA_TEST_BENCH_FILE "$i" -section_id testbench -library rs_work
		}
	}

	if {[string match "vhd" $hdl_ext]} {
		set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir Bench_rs_${rs_arch}_atl_ent.vhd]" -section_id testbench -library rs_work
		set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir Bench_rs_${rs_arch}_atl_arc_ben.vhd]" -section_id testbench -library rs_work
	} else {
		set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir Bench_rs_${rs_arch}_atl.v]" -section_id testbench -library rs_work
	}
	set_global_assignment -name EDA_TEST_BENCH_FILE "${design_name}_testbench.${hdl_ext}" -section_id testbench -library rs_work
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH testbench -section_id eda_simulation
	set_global_assignment -name EDA_IPFS_FILE "${design_name}${ipfs_ext}" -section_id eda_simulation -library rs_work
}

