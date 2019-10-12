// File               : rx_ld.v
// Author             : Tao Wu
// Created On         : 2017-06-23 10:38
// Last Modified      : 2017-07-06 15:50
// Description        : 
//  deskew 4 lanes

                        
module RX_LD# (
    parameter           LNUM                = 4
    ,parameter          DSKWBUF_ADD_WIDTH   = 5
)
(
    //skewed data
    //serdes clock domain
    input   [LNUM-1:0]                      i_srd_rx_clk    
    ,input  [LNUM-1:0]                      i_srd_rx_rst_n  
    ,input  [8*LNUM-1:0]                    i_s_rx_data
    ,input  [LNUM-1:0]                      i_s_rx_datak
    ,input   [DSKWBUF_ADD_WIDTH-1:0]        i_s_half_thres            
    ,input  [LNUM-1:0]                      i_s_comma_aligned

    //deskewd data
    ,input                                  i_unif_clk
    ,input                                  i_unif_rst_n
    ,input   [7:0]                          i_u_align_det_thres       
    ,input   [7:0]                          i_u_align_los_thres       
    ,output [8*LNUM-1:0]                    o_u_aligned_data
    ,output [LNUM-1:0]                      o_u_aligned_datak
    ,output                                 o_u_deskew_aligned
    
    //debug status
    ,output  [LNUM-1:0]                     o_s_rx_fifo_full          
    ,output  [LNUM-1:0]                     o_s_overflow              
    ,output   [LNUM-1:0]                    o_u_rx_fifo_empty           
    ,output   [LNUM-1:0]                    o_u_underflow               
    ,output                                 o_u_am_match_err
    ,output [1:0]                           o_u_rxld_fsm        
);
    localparam      ALIGN_CHAR = 8'h7C; // |A| is defined as K28.3

    wire [LNUM-1:0]         c_u_wr_half_full_reg   ;
    wire [LNUM-1:0]         c_u_rd_data_isam       ;
    wire [LNUM-1:0]         c_u_flow               ;
    wire                    c_u_rd_en              ;
    reg                     r_u_rd_en              ;
    wire                    c_u_unif_rst_n         ;
  
    wire  [LNUM-1:0]        c_u_rx_am_locked;

    wire [LNUM-1:0]         c_s_rx_is_am;
    
    //20150515-twu: delay dskw_valid by 1 clock since data is delayed by 1 clock
    always@(posedge i_unif_clk or negedge i_unif_rst_n) begin
        if(~i_unif_rst_n) begin
            r_u_rd_en <= `DELAY 1'b0;
        end
        else begin
            r_u_rd_en <= `DELAY c_u_rd_en;
        end
    end

  
    RXLDCTRL #(
        .LNUM(LNUM)
    ) rxldctrl (
        .i_rst_n               (i_unif_rst_n         )
        ,.i_clk                (i_unif_clk           )
        ,.i_wr_half_full_reg   (c_u_wr_half_full_reg )
        ,.i_am_locked          (c_u_rx_am_locked     )
        ,.i_is_am              (c_u_rd_data_isam     )
        ,.i_flow               (c_u_flow             )
        ,.i_lden               ({LNUM{1'b1}}         )//always align all lanes
        ,.i_align_det_thres    (i_u_align_det_thres)
        ,.i_align_los_thres    (i_u_align_los_thres)
        ,.o_rd_en              (c_u_rd_en            )
        ,.o_rst_all_n          (c_u_unif_rst_n       )
        ,.o_align_acqr         (o_u_deskew_aligned   )
        ,.o_am_match_err       (o_u_am_match_err     )
        ,.o_rxld_fsm           (o_u_rxld_fsm         )
        );

    wire [9*LNUM-1:0] c_s_wr_data;
    wire [9*LNUM-1:0] c_u_rd_data;

    genvar i;
    generate
        for(i=0; i<LNUM; i=i+1) begin: rxldln
            //generate is_am signal
            assign c_s_rx_is_am[i]  = (i_s_rx_datak[i] && (i_s_rx_data[i*8+:8] == ALIGN_CHAR));

            //use comma align to indicate the AM is locked
            DoubleSync m_dff_amlock( 
                .i_aIReset_N(i_srd_rx_rst_n[i]), 
                .i_IClk(i_srd_rx_clk[i]), 
                .i_iSig(i_s_comma_aligned[i]), 
                .i_aOReset_N(i_unif_rst_n), 
                .i_OClk(i_unif_clk), 
                .o_oSig(c_u_rx_am_locked[i]) ) ;
                
            assign c_s_wr_data[i*9+:9] = {i_s_rx_datak[i], i_s_rx_data[i*8+:8]};
            //20150401-twu: add o_u_rx_dskw_sucess to output |I| when deskew is not finished yet
            //so the downstream module will not run to unknow state
            assign o_u_aligned_data[i*8+:8] = o_u_deskew_aligned ? c_u_rd_data[i*9+:8] : `CHAR_I;
            assign o_u_aligned_datak[i] = o_u_deskew_aligned ? c_u_rd_data[i*9+8] : 1'b1;
        
            RXLDBUF #(
                .DATA_WIDTH     (9),
                .ADD_WIDTH      (DSKWBUF_ADD_WIDTH)//,
            ) rxldbuf (
                .i_rec_clk             (i_srd_rx_clk[i]         )
                ,.i_uniform_clk        (i_unif_clk              )
                ,.i_u_unif_rst_n       (c_u_unif_rst_n          )
                ,.i_r_wr_data          (c_s_wr_data[i*9+:9]     )
                ,.i_r_wr_data_valid    (1'b1                    )
                ,.i_r_wr_data_isam     (c_s_rx_is_am[i]         )
                ,.i_r_half_thres       (i_s_half_thres          )
                ,.o_r_overflow         (o_s_overflow[i]         )
                ,.o_r_wr_cnt           (                        )
                ,.o_u_rd_data          (c_u_rd_data[i*9+:9]     )
                ,.o_u_rd_data_valid    (                        )
                ,.o_u_rd_data_isam     (c_u_rd_data_isam[i]     )
                ,.i_u_rd_en            (c_u_rd_en               )
                ,.o_u_wr_half_full_reg (c_u_wr_half_full_reg[i] )
                ,.o_u_flow             (c_u_flow[i]             )
                ,.o_r_fifo_full        (o_s_rx_fifo_full[i]     )
                ,.o_u_fifo_empty       (o_u_rx_fifo_empty[i]    )
                ,.o_u_underflow        (o_u_underflow[i]        )
                ,.i_u_lden             (1'b1                    )
                );
        end
    endgenerate
    
endmodule
