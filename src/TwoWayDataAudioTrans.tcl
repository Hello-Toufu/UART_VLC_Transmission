# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II 64-Bit Version 13.1.0 Build 162 10/23/2013 SJ Full Version
# File: E:\3_WS\30_TwoWayTrans\20190226#TwoWayDataAudioTrans_noKey_onlyFPGA_8xsyn\src\TwoWayDataAudioTrans.tcl
# Generated on: Sat Sep 28 09:39:51 2019

package require ::quartus::project

set_location_assignment PIN_127 -to i_sys_clk
set_location_assignment PIN_98 -to rx
set_location_assignment PIN_101 -to tx
set_location_assignment PIN_104 -to vlc_tx
set_location_assignment PIN_106 -to vlc_rx
set_location_assignment PIN_110 -to arm_rx
set_location_assignment PIN_112 -to arm_tx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to arm_rx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to arm_tx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to i_sys_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to rx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to tx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to vlc_rx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to vlc_tx
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to o_pwm_64k
set_location_assignment PIN_31 -to o_pwm_64k
set_location_assignment PIN_83 -to PB3
set_location_assignment PIN_80 -to PB4
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to PB3
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to PB4
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to F_LED1
set_location_assignment PIN_76 -to F_LED1
set_location_assignment PIN_77 -to F_LED2
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to F_LED2
