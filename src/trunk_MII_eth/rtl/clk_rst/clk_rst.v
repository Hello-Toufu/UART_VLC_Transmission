// File               : clk_rst.v
// Author             : Tao Wu
// Created On         : 2017-07-01 15:34
// Last Modified      : 2017-07-06 15:05
// Description        : 
// clock and reset gen
                        
module CLK_RST(
    input                   i_pon_rst_n
    ,input                  c_soft_tx_rst_n
    ,input                  c_soft_rx_rst_n
    ,input                  c_soft_pcs_rst_n

    ,input                  i_rgmii_tx_clk
    ,input                  i_rgmii_rx_clk
    ,input                  i_rgmii_tx_180_clk
    ,input                  i_rgmii_rx_180_clk
    ,input                  i_vl_tx_clk
    ,input                  i_vl_rx_0_clk
    ,input                  i_vl_rx_1_clk
    ,input                  i_vl_rx_2_clk
    ,input                  i_vl_rx_3_clk
    ,input                  i_cfg_clk

    ,output                 o_rgmii_tx_rst_n
    ,output                 o_rgmii_rx_rst_n
    ,output                 o_rgmii_tx_180_rst_n
    ,output                 o_rgmii_rx_180_rst_n
    ,output                 o_vl_tx_rst_n
    ,output                 o_vl_rx_0_rst_n
    ,output                 o_vl_rx_1_rst_n
    ,output                 o_vl_rx_2_rst_n
    ,output                 o_vl_rx_3_rst_n
    ,output                 o_cfg_rst_n
);
    wire    c_tx_rst_n;
    wire    c_rx_rst_n;
    wire    c_pcs_rst_n;

    assign c_pcs_rst_n = i_pon_rst_n && c_soft_pcs_rst_n;
    assign c_tx_rst_n = c_pcs_rst_n && c_soft_tx_rst_n;
    assign c_rx_rst_n = c_pcs_rst_n && c_soft_rx_rst_n;

     RESETSYNC2 resetsync_rgmii_tx(.async_rst_N(c_tx_rst_n),   .clk(i_rgmii_tx_clk),   .sync_rst_N(o_rgmii_tx_rst_n));
     RESETSYNC2 resetsync_rgmii_rx(.async_rst_N(c_rx_rst_n),   .clk(i_rgmii_rx_clk),   .sync_rst_N(o_rgmii_rx_rst_n));
     RESETSYNC2 resetsync_rgmii_tx_180(.async_rst_N(c_tx_rst_n),   .clk(i_rgmii_tx_180_clk),   .sync_rst_N(o_rgmii_tx_180_rst_n));
     RESETSYNC2 resetsync_rgmii_rx_180(.async_rst_N(c_rx_rst_n),   .clk(i_rgmii_rx_180_clk),   .sync_rst_N(o_rgmii_rx_180_rst_n));
     RESETSYNC2 resetsync_vl_tx   (.async_rst_N(c_tx_rst_n),   .clk(i_vl_tx_clk),      .sync_rst_N(o_vl_tx_rst_n));
     RESETSYNC2 resetsync_vl_rx_0 (.async_rst_N(c_rx_rst_n),   .clk(i_vl_rx_0_clk),    .sync_rst_N(o_vl_rx_0_rst_n));
     RESETSYNC2 resetsync_vl_rx_1 (.async_rst_N(c_rx_rst_n),   .clk(i_vl_rx_1_clk),    .sync_rst_N(o_vl_rx_1_rst_n));
     RESETSYNC2 resetsync_vl_rx_2 (.async_rst_N(c_rx_rst_n),   .clk(i_vl_rx_2_clk),    .sync_rst_N(o_vl_rx_2_rst_n));
     RESETSYNC2 resetsync_vl_rx_3 (.async_rst_N(c_rx_rst_n),   .clk(i_vl_rx_3_clk),    .sync_rst_N(o_vl_rx_3_rst_n));
     RESETSYNC2 resetsync_cfg (.async_rst_N(i_pon_rst_n),   .clk(i_cfg_clk),    .sync_rst_N(o_cfg_rst_n));

endmodule
