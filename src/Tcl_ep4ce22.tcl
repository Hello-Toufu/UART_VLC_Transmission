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
# File: C:\Users\Administrator\Desktop\ep4ce22.tcl
# Generated on: Mon Feb 11 17:11:35 2019

package require ::quartus::project

set_location_assignment PIN_42 -to i_gmii_col
set_location_assignment PIN_43 -to i_gmii_crs
set_location_assignment PIN_52 -to i_gmii_rx_clk
set_location_assignment PIN_72 -to i_gmii_rx_dv
set_location_assignment PIN_39 -to i_gmii_rx_er
set_location_assignment PIN_67 -to i_gmii_rxd[3]
set_location_assignment PIN_68 -to i_gmii_rxd[2]
set_location_assignment PIN_69 -to i_gmii_rxd[1]
set_location_assignment PIN_71 -to i_gmii_rxd[0]
set_location_assignment PIN_54 -to i_mii_tx_clk
set_location_assignment PIN_143 -to i_rst_n
#set_location_assignment PIN_142 -to i_spi_cs
#set_location_assignment PIN_137 -to i_spi_sck
#set_location_assignment PIN_135 -to i_spi_si
set_location_assignment PIN_127 -to i_sys_clk
set_location_assignment PIN_58 -to o_gmii_tx_en
set_location_assignment PIN_64 -to o_gmii_tx_er
set_location_assignment PIN_59 -to o_gmii_txd[3]
set_location_assignment PIN_60 -to o_gmii_txd[2]
set_location_assignment PIN_65 -to o_gmii_txd[1]
set_location_assignment PIN_66 -to o_gmii_txd[0]
set_location_assignment PIN_110 -to o_led1
#set_location_assignment PIN_111 -to o_led2
#set_location_assignment PIN_112 -to o_led3
#set_location_assignment PIN_113 -to o_led4
#set_location_assignment PIN_132 -to o_spi_so
#set_location_assignment PIN_144 -to i_phy_rst_n
set_location_assignment PIN_51 -to o_phy_rst_n
set_location_assignment PIN_44 -to io_gmii_mdio
set_location_assignment PIN_46 -to o_gmii_mdc
set_location_assignment PIN_89 -to i_serial_rx_clk[0]
set_location_assignment PIN_99 -to i_serial_rx_data[0]
set_location_assignment PIN_104 -to o_serial_tx_data[0]
set_instance_assignment -name IO_STANDARD LVDS -to i_serial_rx_clk[0]
set_location_assignment PIN_88 -to "i_serial_rx_clk[0](n)"
set_instance_assignment -name IO_STANDARD LVDS -to i_serial_rx_data[0]
set_location_assignment PIN_98 -to "i_serial_rx_data[0](n)"
set_location_assignment PIN_28 -to o_serial_tx_data_33V[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to o_serial_tx_data_33V[0]