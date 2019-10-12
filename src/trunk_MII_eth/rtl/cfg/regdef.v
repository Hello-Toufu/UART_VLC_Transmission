
//RESET_CTRL
`define ADDR_RESET_CTRL                          16'h00     
`define RANGE_SOFT_PCS_RST                       0:0        
`define RANGE_H_SOFT_PCS_RST                       0          
`define RANGE_L_SOFT_PCS_RST                       0          
`define DEFVAL_SOFT_PCS_RST                      1'b0       
`define RANGE_SOFT_TX_RST                        1:1        
`define RANGE_H_SOFT_TX_RST                        1          
`define RANGE_L_SOFT_TX_RST                        1          
`define DEFVAL_SOFT_TX_RST                       1'b0       
`define RANGE_SOFT_RX_RST                        2:2        
`define RANGE_H_SOFT_RX_RST                        2          
`define RANGE_L_SOFT_RX_RST                        2          
`define DEFVAL_SOFT_RX_RST                       1'b0       

//RW_TEST
`define ADDR_RW_TEST                             16'hFF     
`define RANGE_RW_SCRATCH                         15:0       
`define RANGE_H_RW_SCRATCH                         15         
`define RANGE_L_RW_SCRATCH                         0          
`define DEFVAL_RW_SCRATCH                        16'h0      

//LANE_MODE
`define ADDR_LANE_MODE                           16'h01     
`define RANGE_TX_X1_MODE_EN                      0:0        
`define RANGE_H_TX_X1_MODE_EN                      0          
`define RANGE_L_TX_X1_MODE_EN                      0          
`define DEFVAL_TX_X1_MODE_EN                     1'b0       
`define RANGE_RX_X1_MODE_EN                      1:1        
`define RANGE_H_RX_X1_MODE_EN                      1          
`define RANGE_L_RX_X1_MODE_EN                      1          
`define DEFVAL_RX_X1_MODE_EN                     1'b0       

//RS_CTRL
`define ADDR_RS_CTRL                             16'h02     
`define RANGE_TX_RS_EN                           0:0        
`define RANGE_H_TX_RS_EN                           0          
`define RANGE_L_TX_RS_EN                           0          
`define DEFVAL_TX_RS_EN                          1'b1       
`define RANGE_RX_RS_EN                           1:1        
`define RANGE_H_RX_RS_EN                           1          
`define RANGE_L_RX_RS_EN                           1          
`define DEFVAL_RX_RS_EN                          1'b1       

//RX_DEC_STAT
`define ADDR_RX_DEC_STAT                         16'h10     
`define RANGE_COMMA_ALIGNED_L0                   0:0        
`define RANGE_H_COMMA_ALIGNED_L0                   0          
`define RANGE_L_COMMA_ALIGNED_L0                   0          
`define DEFVAL_COMMA_ALIGNED_L0                  1'b0       
`define RANGE_COMMA_ALIGNED_L1                   1:1        
`define RANGE_H_COMMA_ALIGNED_L1                   1          
`define RANGE_L_COMMA_ALIGNED_L1                   1          
`define DEFVAL_COMMA_ALIGNED_L1                  1'b0       
`define RANGE_COMMA_ALIGNED_L2                   2:2        
`define RANGE_H_COMMA_ALIGNED_L2                   2          
`define RANGE_L_COMMA_ALIGNED_L2                   2          
`define DEFVAL_COMMA_ALIGNED_L2                  1'b0       
`define RANGE_COMMA_ALIGNED_L3                   3:3        
`define RANGE_H_COMMA_ALIGNED_L3                   3          
`define RANGE_L_COMMA_ALIGNED_L3                   3          
`define DEFVAL_COMMA_ALIGNED_L3                  1'b0       
`define RANGE_DISP_ERR_L0                        4:4        
`define RANGE_H_DISP_ERR_L0                        4          
`define RANGE_L_DISP_ERR_L0                        4          
`define DEFVAL_DISP_ERR_L0                       1'b0       
`define RANGE_DISP_ERR_L1                        5:5        
`define RANGE_H_DISP_ERR_L1                        5          
`define RANGE_L_DISP_ERR_L1                        5          
`define DEFVAL_DISP_ERR_L1                       1'b0       
`define RANGE_DISP_ERR_L2                        6:6        
`define RANGE_H_DISP_ERR_L2                        6          
`define RANGE_L_DISP_ERR_L2                        6          
`define DEFVAL_DISP_ERR_L2                       1'b0       
`define RANGE_DISP_ERR_L3                        7:7        
`define RANGE_H_DISP_ERR_L3                        7          
`define RANGE_L_DISP_ERR_L3                        7          
`define DEFVAL_DISP_ERR_L3                       1'b0       

//RXLD_CTRL1
`define ADDR_RXLD_CTRL1                          16'h20     
`define RANGE_RXLD_HALF_THRES                    4:0        
`define RANGE_H_RXLD_HALF_THRES                    4          
`define RANGE_L_RXLD_HALF_THRES                    0          
`define DEFVAL_RXLD_HALF_THRES                   5'd8       

//RXLD_CTRL2
`define ADDR_RXLD_CTRL2                          16'h21     
`define RANGE_RXLD_ALIGN_DET_THRES               7:0        
`define RANGE_H_RXLD_ALIGN_DET_THRES               7          
`define RANGE_L_RXLD_ALIGN_DET_THRES               0          
`define DEFVAL_RXLD_ALIGN_DET_THRES              8'd4       
`define RANGE_RXLD_ALIGN_LOS_THRES               15:8       
`define RANGE_H_RXLD_ALIGN_LOS_THRES               15         
`define RANGE_L_RXLD_ALIGN_LOS_THRES               8          
`define DEFVAL_RXLD_ALIGN_LOS_THRES              8'd8       

//RXLD_STAT
`define ADDR_RXLD_STAT                           16'h22     
`define RANGE_RXLD_OVERFLOW_L0                   0:0        
`define RANGE_H_RXLD_OVERFLOW_L0                   0          
`define RANGE_L_RXLD_OVERFLOW_L0                   0          
`define DEFVAL_RXLD_OVERFLOW_L0                  1'b0       
`define RANGE_RXLD_OVERFLOW_L1                   1:1        
`define RANGE_H_RXLD_OVERFLOW_L1                   1          
`define RANGE_L_RXLD_OVERFLOW_L1                   1          
`define DEFVAL_RXLD_OVERFLOW_L1                  1'b0       
`define RANGE_RXLD_OVERFLOW_L2                   2:2        
`define RANGE_H_RXLD_OVERFLOW_L2                   2          
`define RANGE_L_RXLD_OVERFLOW_L2                   2          
`define DEFVAL_RXLD_OVERFLOW_L2                  1'b0       
`define RANGE_RXLD_OVERFLOW_L3                   3:3        
`define RANGE_H_RXLD_OVERFLOW_L3                   3          
`define RANGE_L_RXLD_OVERFLOW_L3                   3          
`define DEFVAL_RXLD_OVERFLOW_L3                  1'b0       
`define RANGE_RXLD_UNDERFLOW_L0                  4:4        
`define RANGE_H_RXLD_UNDERFLOW_L0                  4          
`define RANGE_L_RXLD_UNDERFLOW_L0                  4          
`define DEFVAL_RXLD_UNDERFLOW_L0                 1'b0       
`define RANGE_RXLD_UNDERFLOW_L1                  5:5        
`define RANGE_H_RXLD_UNDERFLOW_L1                  5          
`define RANGE_L_RXLD_UNDERFLOW_L1                  5          
`define DEFVAL_RXLD_UNDERFLOW_L1                 1'b0       
`define RANGE_RXLD_UNDERFLOW_L2                  6:6        
`define RANGE_H_RXLD_UNDERFLOW_L2                  6          
`define RANGE_L_RXLD_UNDERFLOW_L2                  6          
`define DEFVAL_RXLD_UNDERFLOW_L2                 1'b0       
`define RANGE_RXLD_UNDERFLOW_L3                  7:7        
`define RANGE_H_RXLD_UNDERFLOW_L3                  7          
`define RANGE_L_RXLD_UNDERFLOW_L3                  7          
`define DEFVAL_RXLD_UNDERFLOW_L3                 1'b0       
`define RANGE_RXLD_ALIGNED                       12:12      
`define RANGE_H_RXLD_ALIGNED                       12         
`define RANGE_L_RXLD_ALIGNED                       12         
`define DEFVAL_RXLD_ALIGNED                      1'b0       

//RS_STATUS
`define ADDR_RS_STATUS                           16'h30     
`define RANGE_RS_FAIL_L0                         0:0        
`define RANGE_H_RS_FAIL_L0                         0          
`define RANGE_L_RS_FAIL_L0                         0          
`define DEFVAL_RS_FAIL_L0                        1'b0       
`define RANGE_RS_FAIL_L1                         1:1        
`define RANGE_H_RS_FAIL_L1                         1          
`define RANGE_L_RS_FAIL_L1                         1          
`define DEFVAL_RS_FAIL_L1                        1'b0       
`define RANGE_RS_FAIL_L2                         2:2        
`define RANGE_H_RS_FAIL_L2                         2          
`define RANGE_L_RS_FAIL_L2                         2          
`define DEFVAL_RS_FAIL_L2                        1'b0       
`define RANGE_RS_FAIL_L3                         3:3        
`define RANGE_H_RS_FAIL_L3                         3          
`define RANGE_L_RS_FAIL_L3                         3          
`define DEFVAL_RS_FAIL_L3                        1'b0       
`define RANGE_RS_FOUND_L0                        4:4        
`define RANGE_H_RS_FOUND_L0                        4          
`define RANGE_L_RS_FOUND_L0                        4          
`define DEFVAL_RS_FOUND_L0                       1'b0       
`define RANGE_RS_FOUND_L1                        5:5        
`define RANGE_H_RS_FOUND_L1                        5          
`define RANGE_L_RS_FOUND_L1                        5          
`define DEFVAL_RS_FOUND_L1                       1'b0       
`define RANGE_RS_FOUND_L2                        6:6        
`define RANGE_H_RS_FOUND_L2                        6          
`define RANGE_L_RS_FOUND_L2                        6          
`define DEFVAL_RS_FOUND_L2                       1'b0       
`define RANGE_RS_FOUND_L3                        7:7        
`define RANGE_H_RS_FOUND_L3                        7          
`define RANGE_L_RS_FOUND_L3                        7          
`define DEFVAL_RS_FOUND_L3                       1'b0       

//RS_FAIL_CNT_L0
`define ADDR_RS_FAIL_CNT_L0                      16'h34     
`define RANGE_RS_FAIL_CNT_L0                     15:0       
`define RANGE_H_RS_FAIL_CNT_L0                     15         
`define RANGE_L_RS_FAIL_CNT_L0                     0          
`define DEFVAL_RS_FAIL_CNT_L0                    16'h0      

//RS_FAIL_CNT_L1
`define ADDR_RS_FAIL_CNT_L1                      16'h35     
`define RANGE_RS_FAIL_CNT_L1                     15:0       
`define RANGE_H_RS_FAIL_CNT_L1                     15         
`define RANGE_L_RS_FAIL_CNT_L1                     0          
`define DEFVAL_RS_FAIL_CNT_L1                    16'h0      

//RS_FAIL_CNT_L2
`define ADDR_RS_FAIL_CNT_L2                      16'h36     
`define RANGE_RS_FAIL_CNT_L2                     15:0       
`define RANGE_H_RS_FAIL_CNT_L2                     15         
`define RANGE_L_RS_FAIL_CNT_L2                     0          
`define DEFVAL_RS_FAIL_CNT_L2                    16'h0      

//RS_FAIL_CNT_L3
`define ADDR_RS_FAIL_CNT_L3                      16'h37     
`define RANGE_RS_FAIL_CNT_L3                     15:0       
`define RANGE_H_RS_FAIL_CNT_L3                     15         
`define RANGE_L_RS_FAIL_CNT_L3                     0          
`define DEFVAL_RS_FAIL_CNT_L3                    16'h0      

//RS_COR_NUM_CNT_L0
`define ADDR_RS_COR_NUM_CNT_L0                   16'h38     
`define RANGE_RS_ERR_NUM_CNT_L0                  15:0       
`define RANGE_H_RS_ERR_NUM_CNT_L0                  15         
`define RANGE_L_RS_ERR_NUM_CNT_L0                  0          
`define DEFVAL_RS_ERR_NUM_CNT_L0                 16'h0      

//RS_COR_NUM_CNT_L1
`define ADDR_RS_COR_NUM_CNT_L1                   16'h39     
`define RANGE_RS_ERR_NUM_CNT_L1                  15:0       
`define RANGE_H_RS_ERR_NUM_CNT_L1                  15         
`define RANGE_L_RS_ERR_NUM_CNT_L1                  0          
`define DEFVAL_RS_ERR_NUM_CNT_L1                 16'h0      

//RS_COR_NUM_CNT_L2
`define ADDR_RS_COR_NUM_CNT_L2                   16'h3A     
`define RANGE_RS_ERR_NUM_CNT_L2                  15:0       
`define RANGE_H_RS_ERR_NUM_CNT_L2                  15         
`define RANGE_L_RS_ERR_NUM_CNT_L2                  0          
`define DEFVAL_RS_ERR_NUM_CNT_L2                 16'h0      

//RS_COR_NUM_CNT_L3
`define ADDR_RS_COR_NUM_CNT_L3                   16'h3B     
`define RANGE_RS_ERR_NUM_CNT_L3                  15:0       
`define RANGE_H_RS_ERR_NUM_CNT_L3                  15         
`define RANGE_L_RS_ERR_NUM_CNT_L3                  0          
`define DEFVAL_RS_ERR_NUM_CNT_L3                 16'h0      

//MANCHEST_CTRL
`define ADDR_MANCHEST_CTRL                       16'h3C     
`define RANGE_MANCHEST_EN                        0:0        
`define RANGE_H_MANCHEST_EN                        0          
`define RANGE_L_MANCHEST_EN                        0          
`define DEFVAL_MANCHEST_EN                       1'b0       
`define RANGE_POL_ADJ_EN                         1:1        
`define RANGE_H_POL_ADJ_EN                         1          
`define RANGE_L_POL_ADJ_EN                         1          
`define DEFVAL_POL_ADJ_EN                        1'b1       
`define RANGE_POL_CONT_ADJ                       2:2        
`define RANGE_H_POL_CONT_ADJ                       2          
`define RANGE_L_POL_CONT_ADJ                       2          
`define DEFVAL_POL_CONT_ADJ                      1'b1       

//RXPOL_OW
`define ADDR_RXPOL_OW                            16'h3D     
`define RANGE_POL_OW_L0                          0:0        
`define RANGE_H_POL_OW_L0                          0          
`define RANGE_L_POL_OW_L0                          0          
`define DEFVAL_POL_OW_L0                         1'b0       
`define RANGE_POL_OW_L1                          1:1        
`define RANGE_H_POL_OW_L1                          1          
`define RANGE_L_POL_OW_L1                          1          
`define DEFVAL_POL_OW_L1                         1'b0       
`define RANGE_POL_OW_L2                          2:2        
`define RANGE_H_POL_OW_L2                          2          
`define RANGE_L_POL_OW_L2                          2          
`define DEFVAL_POL_OW_L2                         1'b0       
`define RANGE_POL_OW_L3                          3:3        
`define RANGE_H_POL_OW_L3                          3          
`define RANGE_L_POL_OW_L3                          3          
`define DEFVAL_POL_OW_L3                         1'b0       
`define RANGE_POL_OW_VAL_L0                      4:4        
`define RANGE_H_POL_OW_VAL_L0                      4          
`define RANGE_L_POL_OW_VAL_L0                      4          
`define DEFVAL_POL_OW_VAL_L0                     1'b0       
`define RANGE_POL_OW_VAL_L1                      5:5        
`define RANGE_H_POL_OW_VAL_L1                      5          
`define RANGE_L_POL_OW_VAL_L1                      5          
`define DEFVAL_POL_OW_VAL_L1                     1'b0       
`define RANGE_POL_OW_VAL_L2                      6:6        
`define RANGE_H_POL_OW_VAL_L2                      6          
`define RANGE_L_POL_OW_VAL_L2                      6          
`define DEFVAL_POL_OW_VAL_L2                     1'b0       
`define RANGE_POL_OW_VAL_L3                      7:7        
`define RANGE_H_POL_OW_VAL_L3                      7          
`define RANGE_L_POL_OW_VAL_L3                      7          
`define DEFVAL_POL_OW_VAL_L3                     1'b0       

//RXPOL_STATUS
`define ADDR_RXPOL_STATUS                        16'h3E     
`define RANGE_RXPOL_DONE_L0                      0:0        
`define RANGE_H_RXPOL_DONE_L0                      0          
`define RANGE_L_RXPOL_DONE_L0                      0          
`define DEFVAL_RXPOL_DONE_L0                     1'b0       
`define RANGE_RXPOL_DONE_L1                      1:1        
`define RANGE_H_RXPOL_DONE_L1                      1          
`define RANGE_L_RXPOL_DONE_L1                      1          
`define DEFVAL_RXPOL_DONE_L1                     1'b0       
`define RANGE_RXPOL_DONE_L2                      2:2        
`define RANGE_H_RXPOL_DONE_L2                      2          
`define RANGE_L_RXPOL_DONE_L2                      2          
`define DEFVAL_RXPOL_DONE_L2                     1'b0       
`define RANGE_RXPOL_DONE_L3                      3:3        
`define RANGE_H_RXPOL_DONE_L3                      3          
`define RANGE_L_RXPOL_DONE_L3                      3          
`define DEFVAL_RXPOL_DONE_L3                     1'b0       
`define RANGE_RXPOL_STATUS_L0                    4:4        
`define RANGE_H_RXPOL_STATUS_L0                    4          
`define RANGE_L_RXPOL_STATUS_L0                    4          
`define DEFVAL_RXPOL_STATUS_L0                   1'b0       
`define RANGE_RXPOL_STATUS_L1                    5:5        
`define RANGE_H_RXPOL_STATUS_L1                    5          
`define RANGE_L_RXPOL_STATUS_L1                    5          
`define DEFVAL_RXPOL_STATUS_L1                   1'b0       
`define RANGE_RXPOL_STATUS_L2                    6:6        
`define RANGE_H_RXPOL_STATUS_L2                    6          
`define RANGE_L_RXPOL_STATUS_L2                    6          
`define DEFVAL_RXPOL_STATUS_L2                   1'b0       
`define RANGE_RXPOL_STATUS_L3                    7:7        
`define RANGE_H_RXPOL_STATUS_L3                    7          
`define RANGE_L_RXPOL_STATUS_L3                    7          
`define DEFVAL_RXPOL_STATUS_L3                   1'b0       

//SPEED_SEL
`define ADDR_SPEED_SEL                           16'h3F     
`define RANGE_SPEED_SEL_OW                       0:0        
`define RANGE_H_SPEED_SEL_OW                       0          
`define RANGE_L_SPEED_SEL_OW                       0          
`define DEFVAL_SPEED_SEL_OW                      1'b0       
`define RANGE_SPEED_SEL                          1:1        
`define RANGE_H_SPEED_SEL                          1          
`define RANGE_L_SPEED_SEL                          1          
`define DEFVAL_SPEED_SEL                         1'b0       

//GMAC_CFG1
`define ADDR_GMAC_CFG1                           16'h40     
`define RANGE_MCI_ADDR                           13:0       
`define RANGE_H_MCI_ADDR                           13         
`define RANGE_L_MCI_ADDR                           0          
`define DEFVAL_MCI_ADDR                          14'h0      

//GMAC_CFG2
`define ADDR_GMAC_CFG2                           16'h41     
`define RANGE_MCI_WDATA                          15:0       
`define RANGE_H_MCI_WDATA                          15         
`define RANGE_L_MCI_WDATA                          0          
`define DEFVAL_MCI_WDATA                         16'h0      

//GMAC_CFG3
`define ADDR_GMAC_CFG3                           16'h42     
`define RANGE_MCI_WDATA_EXT_1                    15:0       
`define RANGE_H_MCI_WDATA_EXT_1                    15         
`define RANGE_L_MCI_WDATA_EXT_1                    0          
`define DEFVAL_MCI_WDATA_EXT_1                   16'h0      

//GMAC_CFG4
`define ADDR_GMAC_CFG4                           16'h43     
`define RANGE_MCI_VAL                            8:8        
`define RANGE_H_MCI_VAL                            8          
`define RANGE_L_MCI_VAL                            8          
`define DEFVAL_MCI_VAL                           1'b0       
`define RANGE_MCI_RDWN                           4:4        
`define RANGE_H_MCI_RDWN                           4          
`define RANGE_L_MCI_RDWN                           4          
`define DEFVAL_MCI_RDWN                          1'b0       
`define RANGE_MCI_BE                             3:0        
`define RANGE_H_MCI_BE                             3          
`define RANGE_L_MCI_BE                             0          
`define DEFVAL_MCI_BE                            4'h0       

//GMAC_CFG5
`define ADDR_GMAC_CFG5                           16'h44     
`define RANGE_MCI_ACK                            0:0        
`define RANGE_H_MCI_ACK                            0          
`define RANGE_L_MCI_ACK                            0          
`define DEFVAL_MCI_ACK                           1'b0       
`define RANGE_MCI_INTR                           1:1        
`define RANGE_H_MCI_INTR                           1          
`define RANGE_L_MCI_INTR                           1          
`define DEFVAL_MCI_INTR                          1'b0       

//GMAC_CFG6
`define ADDR_GMAC_CFG6                           16'h45     
`define RANGE_MCI_RDATA                          15:0       
`define RANGE_H_MCI_RDATA                          15         
`define RANGE_L_MCI_RDATA                          0          
`define DEFVAL_MCI_RDATA                         16'h0      

//GMAC_CFG7
`define ADDR_GMAC_CFG7                           16'h46     
`define RANGE_MCI_RDATA_EXT_1                    15:0       
`define RANGE_H_MCI_RDATA_EXT_1                    15         
`define RANGE_L_MCI_RDATA_EXT_1                    0          
`define DEFVAL_MCI_RDATA_EXT_1                   16'h0      

//GMAC_CFG_OWNER
`define ADDR_GMAC_CFG_OWNER                      16'h47     
`define RANGE_MCI_OWNER                          0:0        
`define RANGE_H_MCI_OWNER                          0          
`define RANGE_L_MCI_OWNER                          0          
`define DEFVAL_MCI_OWNER                         1'b0       
