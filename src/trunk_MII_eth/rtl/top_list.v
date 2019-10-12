//Created on :2017-6-23 18:2:8

`include "pub/def.v"
`include "pub/resetsync2.v"
`include "pub/dff.v"
`include "pub/asyncfifoga.v"
`include "pub/DoubleSync.v"
`include "pub/PulseSync.v"
`include "pub/Handshake.v"
`include "pub/clkcrosspls.v"
`include "pub/clkcrossbus.v"
`include "pub/clkcrossdff.v"
`include "pub/stall.v"
`include "pub/rdstall.v"
`include "pub/frame_cnt.v" //20190908

`include "rx/rx_8b10b_dec.v"
`include "rx/rx10to8cal.v"
`include "rx/rx10b8bbyte.v"
`include "rx/comchk.v"
`include "rx/rx_interface.v"
`include "rx/rx_ld.v"
`include "rx/rx_ld_buf.v"
`include "rx/rx_ld_ctrl.v"
`include "rx/rx_rs_bl_sync_x1.v"
`include "rx/rx_rs_bl_sync_x4.v"
`include "rx/rx_rs_dec.v"
`include "rx/rx_adj_pol.v"
`include "rx/rx_top.v"
`include "rx/remove_chec_symbol.v" //20190809 ZDF

`include "tx/tx_8b10b_enc.v"
`include "tx/txenc8to10byte.v"
`include "tx/tx_char_replace.v"
`include "tx/tx_interface.v"
`include "tx/tx_rs_enc.v"
`include "tx/tx_insrt_pol_comma.v"
`include "tx/tx_top.v"

`include "cfg/regdef.v"
`include "cfg/reg.v"
`include "cfg/cdc.v"
`include "cfg/cfg.v"

`include "clk_rst/clk_rst.v"

`ifdef GMAC_GMII
    `include "gmac/gmac_ip_gmii/gmac_ip_list.v"
`elsif GMAC_MII
    `include "gmac/gmac_ip_mii/gmac_ip_list.v"
`elsif GMAC_RGMII
    `include "gmac/gmac_ip_rgmii/gmac_ip_list.v"
`endif
`include "ram/dpram.v"

`ifndef XILINX_RS_IP
    `include "rs_ip2/RsDecodeChien.v"
    `include "rs_ip2/RsDecodeDegree.v"
    `include "rs_ip2/RsDecodeDelay.v"
    `include "rs_ip2/RsDecodeDpRam.v"
    `include "rs_ip2/RsDecodeEuclide.v"
    `include "rs_ip2/RsDecodeInv.v"
    `include "rs_ip2/RsDecodeMult.v"
    `include "rs_ip2/RsDecodeShiftOmega.v"
    `include "rs_ip2/RsDecodeSyndrome.v"
    `include "rs_ip2/RsDecodeTop.v"
    `include "rs_ip2/RsEncodeTop.v"
`endif

`include "gmac/mac_speed_ctrl_mbytwu/mac_reg_access.v" 
`include "gmac/mac_speed_ctrl_mbytwu/mac_speed_crtl_top.v" 
`include "gmac/mac_speed_ctrl_mbytwu/phy_reg_access.v" 
`include "gmac/mac_speed_ctrl_mbytwu/poll_speed.v" 

//pcs_top.v use some defines from gmac_ip_list
`include "top/pcs_top.v"

// `include  "manchester_sync/add_synheader_p.vhd"
// `include  "manchester_sync/data_p2s.vhd"
// `include  "manchester_sync/data_s2p.vhd"
// `include  "manchester_sync/desyn.vhd"
// `include  "manchester_sync/man_code.vhd"
