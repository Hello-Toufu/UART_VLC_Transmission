#cd C:/Users/Administrator/Desktop/vlc_m_8x_syn/1_test_vlc_msequence_8x_syn_sim
######################################################################################
# from quartus who luanch the modelsim via .do
######################################################################################
#vlib verilog_libs/altera_ver
#vmap altera_ver ./verilog_libs/altera_ver
#vlog -vlog01compat -work altera_ver {f:/intelfpga/18.0/quartus/eda/sim_lib/altera_primitives.v}
#
#vlib verilog_libs/cycloneive_ver
#vmap cycloneive_ver ./verilog_libs/cycloneive_ver
#vlog -vlog01compat -work cycloneive_ver {f:/intelfpga/18.0/quartus/eda/sim_lib/cycloneive_atoms.v}
######################################################################################
#vlog -sv vo_files/RS_ENC_LANE_QUATUS.vo
#vlog -sv vo_files/RS_DE_LANE_QUATUS.vo

vlog -sv trunk_MII_eth/rtl/manchester_sync/fir.v
vlog -sv trunk_MII_eth/rtl/manchester_sync/delay1.v
vlog -sv trunk_MII_eth/rtl/manchester_sync/product.v
vcom trunk_MII_eth/rtl/manchester_sync/add_synheader_p.vhd
vcom trunk_MII_eth/rtl/manchester_sync/data_p2s.vhd
vcom trunk_MII_eth/rtl/manchester_sync/data_s2p.vhd
vcom -2008 trunk_MII_eth/rtl/manchester_sync/desyn.vhd
vcom trunk_MII_eth/rtl/manchester_sync/man_code.vhd
vlog -f filelist.f  -sv +define+GMAC_MII
#vlog -f filelist.f  -sv +define+RECOVER_TEST
#vlog -f filelist.f  -sv +define+MDIO_TEST
vlog -sv trunk_MII_eth/rtl/pub/def.v 
vlog -sv tb_rs_manchester_switchable.v
vlog +define+DELAY=#0.1 -sv frame_eof_regen.v 
vlog -sv pat_gen.v
vlog -sv pat_gen_switchable.v
vlog -sv pac_chek.v
vlog -sv pulse_gen.v
vlog +define+DELAY=#0.1 -sv ps_avalon_tx_2_tx_interface.v

#vlog -vlog01compat -work work +incdir+. {nios2_SG_DMA_test.vo}

vsim +nowarnTSCALE -novopt  tb_rs_manchester_switchable -l tb_rs_manchester_switchable.log 
#vsim +nowarnTSCALE -novopt  -L altera_ver -L cycloneive_ver tb_rs_manchester_switchable -l tb_rs_manchester_switchable.log 

#-novopt debugdb
log -r *
#run -all
run 10000us

#view -new wave
# .main_pane.wave1.interior.cs.body.pw.wf
#add wave -position insertpoint sim:/tb_rs_manchester_switchable/*
#add wave -position insertpoint  \
#sim:/tb_rs_manchester_switchable/r_serial_tx_clk \
#sim:/tb_rs_manchester_switchable/r_serial_rx_clk \
#sim:/tb_rs_manchester_switchable/r_vl_tx_clk \
#sim:/tb_rs_manchester_switchable/r_resetn \
#sim:/tb_rs_manchester_switchable/r_switch \
#sim:/tb_rs_manchester_switchable/tx_fifo_out_data \
#sim:/tb_rs_manchester_switchable/tx_fifo_out_valid \
#sim:/tb_rs_manchester_switchable/tx_fifo_out_ready \
#sim:/tb_rs_manchester_switchable/tx_fifo_out_startofpacket \
#sim:/tb_rs_manchester_switchable/tx_fifo_out_endofpacket \
#sim:/tb_rs_manchester_switchable/tx_fifo_out_empty \
#sim:/tb_rs_manchester_switchable/rx_fifo_in_data \
#sim:/tb_rs_manchester_switchable/rx_fifo_in_valid \
#sim:/tb_rs_manchester_switchable/rx_fifo_in_ready \
#sim:/tb_rs_manchester_switchable/rx_fifo_in_startofpacket \
#sim:/tb_rs_manchester_switchable/rx_fifo_in_endofpacket \
#sim:/tb_rs_manchester_switchable/rx_fifo_in_empty \
#sim:/tb_rs_manchester_switchable/c_ari_data \
#sim:/tb_rs_manchester_switchable/c_ari_be \
#sim:/tb_rs_manchester_switchable/c_ari_frame_len \
#sim:/tb_rs_manchester_switchable/c_pl_data \
#sim:/tb_rs_manchester_switchable/c_pl_be \
#sim:/tb_rs_manchester_switchable/c_serial_rx_data \
#sim:/tb_rs_manchester_switchable/c_serial_tx_data \
#sim:/tb_rs_manchester_switchable/c_ari_val \
#sim:/tb_rs_manchester_switchable/c_ari_sof \
#sim:/tb_rs_manchester_switchable/c_ari_eof \
#sim:/tb_rs_manchester_switchable/c_ari_ack \
#sim:/tb_rs_manchester_switchable/c_ari_frame_len_val \
#sim:/tb_rs_manchester_switchable/c_pl_val \
#sim:/tb_rs_manchester_switchable/c_pl_sof \
#sim:/tb_rs_manchester_switchable/c_pl_eof \
#sim:/tb_rs_manchester_switchable/c_pl_rdy \
#sim:/tb_rs_manchester_switchable/r_good_word_num \
#sim:/tb_rs_manchester_switchable/r_state

