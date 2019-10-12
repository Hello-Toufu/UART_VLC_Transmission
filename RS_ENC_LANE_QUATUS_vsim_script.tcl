#########################################################################
#########################################################################
## Description	:  Generic script to be customized by Megawizard 
##                 for running RTL, vital or IP Functional simulation in Modelsim
##
## ALTERA Proprietary
## Copyright 2008 (c) Altera Corporation
## All rights reserved
##
#########################################################################
#########################################################################

set megacore_lib_dir {f:/intelfpga/18.0/ip/altera/reed_solomon/lib/}

set design_name "RS_ENC_LANE_QUATUS"
set rs_arch "ENC"
set hdl_extension ".v"

global env
if ![info exists env(QUARTUS_ROOTDIR)] {
	puts "Expected Enviroment variable QUARTUS_ROOTDIR pointing to a valid Quartus installation"
	exit
}
set q_sim_lib [file join $env(QUARTUS_ROOTDIR) eda sim_lib]
quit -sim
set megacore_wrapper_dir [pwd]

onbreak {resume}
set test_bench_location $megacore_lib_dir
if {[info exists megacore_wrapper_dir]} {
	set vsim_working_dir $megacore_wrapper_dir
} else {
	puts "Error: megacore_wrapper_dir variable is not defined and not development mode identified: Exiting"
	exit
}

if {![info exists use_ipfs]} {
    set use_ipfs 1
}
if {![info exists rs_arch]} {
    set rs_arch "DEC"
}
if {![info exists bypass_MW]} {
    set bypass_MW "NO"
}

cd $vsim_working_dir

set st [string tolower $rs_arch]

set quartus_libs [list \
		altera_mf	{altera_mf_components altera_mf} {altera_mf} 		"$q_sim_lib" 	\
		lpm			{220pack 220model} {220model}						"$q_sim_lib" 	\
		sgate		{sgate_pack sgate} {sgate}							"$q_sim_lib" 	]

if {[file exists ${design_name}.vho]} {
	puts "Info: IPFS file ${design_name}.vho found"
	set ext_ipfs "vho"
	set use_ipfs 1
} elseif {[file exists ${design_name}.vo]} {
	puts "Info: IPFS file ${design_name}.vo found"
	set ext_ipfs "vo"
	set use_ipfs 1
} else {
	puts "Info: No IPFS model found. Simulating with ModelSim development library"
	set use_ipfs 0
}

if {($use_ipfs == 1) && ([vsimAuth] != "ALTERA")} {
	foreach {lib file_vhdl_list file_verilog_list src_files_loc} $quartus_libs {
		vlib $lib
		vmap $lib $lib
		if {[string match "vho" $ext_ipfs]} {
			foreach file_item $file_vhdl_list {
				catch {vcom -explicit -93 -work $lib [file join $src_files_loc ${file_item}.vhd]} err_msg
				if {![string match "" $err_msg]} {return $err_msg}
			}
		} elseif {[string match "vo" $ext_ipfs]} {
			foreach file_item $file_verilog_list {
				catch {vlog -work $lib [file join $src_files_loc ${file_item}.v]} err_msg
				if {![string match "" $err_msg]} {return $err_msg}
			}
		}
	}
}
catch {
	vdel -lib rs_work -all
}
catch {
	vlib rs_work
	vmap rs_work [file join $vsim_working_dir rs_work]
} 
catch {
	if {$use_ipfs == 1} {
		if {[string match "vho" $ext_ipfs]} {
			vcom -explicit -93 -work rs_work [file join $vsim_working_dir ${design_name}.vho]
		} elseif {[string match "vo" $ext_ipfs]} {
			vlog -work rs_work [file join $vsim_working_dir ${design_name}.vo]
		}
	}
	if {[string match ".vhd" $hdl_extension]} {
		if {[string match -nocase "NO" $bypass_MW] && $use_ipfs==0} {
			vcom -explicit -93 -work rs_work [file join $vsim_working_dir ${design_name}.vhd]
		}
		vcom -explicit -93 -work rs_work [file join $test_bench_location Bench_rs_${st}_atl_ent.vhd]
		vcom -explicit -93 -work rs_work [file join $test_bench_location Bench_rs_${st}_atl_arc_ben.vhd]
			vcom -explicit -93 -work rs_work [file join $vsim_working_dir ${design_name}_testbench.vhd]
	} elseif {[string match ".v" $hdl_extension]} {
		if {[string match -nocase "NO" $bypass_MW] && $use_ipfs==0} {
			vlog -work rs_work [file join $vsim_working_dir ${design_name}.v]
		}
		vlog -vlog01compat -work rs_work [file join $test_bench_location Bench_rs_${st}_atl.v]
		vlog -vlog01compat -work rs_work [file join $vsim_working_dir ${design_name}_testbench.v]
	}
}

set timing_resolution "1ns"
if {$use_ipfs == 1} {
	set timing_resolution "1ps"
}
if {[info exists run_ModelSim_vho]} {
	if {[string match "YES" $run_ModelSim_vho]} {
		set timing_resolution "1ps"
	}
}

set vsim_cmd vsim

if {[vsimAuth] == "ALTERA"} {
	lappend vsim_cmd "-L" "Sgate_ver" "-L" "altera_mf_ver" "-L" "lpm_ver"
} elseif {[vsimAuth] != "ALTERA"} {
	lappend vsim_cmd "-L" "Sgate" "-L" "altera_mf" "-L" "lpm"
} 

lappend vsim_cmd "rs_work.testbench"

lappend vsim_cmd "-t"
lappend vsim_cmd "$timing_resolution"

catch {
	eval $vsim_cmd
	add wave sim:/testbench/test_controller/sink_???
	add wave sim:/testbench/test_controller/source_???
	add wave sim:/testbench/test_controller/clk
	add wave sim:/testbench/test_controller/reset
	add wave sim:/testbench/test_controller/???????_2_bench
	add wave sim:/testbench/test_controller/bench_2_???????
	
	
} vsim_msg

catch {run -all} run_msg

