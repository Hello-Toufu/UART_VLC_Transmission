# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks
# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

#create_generated_clock -source [get_nets {m_r_clk_gen|altpll_component|auto_generated|wire_pll1_clk[0]}] -divide_by 16 -multiply_by 1 [get_nets {m_PCS_TOP|m_rx_top|data_s2p|parallel_clk}]

#set_clock_groups -asynchronous -group [get_clocks {i_serial_rx_clk[0] m_PCS_TOP|m_rx_top|data_s2p|parallel_clk|q m_r_clk_gen|altpll_component|auto_generated|pll1|clk[0] m_r_clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {i_sys_clk m_clk_gen|altpll_component|auto_generated|pll1|clk[1] m_clk_gen|altpll_component|auto_generated|pll1|clk[2]}]