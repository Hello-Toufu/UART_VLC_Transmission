// File               : rx_8b10b_dec.v
// Author             : Tao Wu
// Created On         : 2017-06-23 09:57
// Last Modified      : 2018-05-31 15:41
// Description        : 
// LSB first for input and output data
//  
                        
module RX_8B10B_DEC(
    input               i_clk
    ,input              i_rst_n

    ,input   [9:0]      i_10b_data
    
    //output for 8b/10b encoder
    ,output  [7:0]      o_8b_data
    ,output             o_8b_datak

    ,output             o_comma_aligned   
    ,output             o_disp_err

    ,input              i_pol_adj_en    
    ,input              i_pol_cont_adj          //0: only detect once after reset, 1: detect continuesly
    ,input              i_pol_ow
    ,input              i_pol_ow_val
    ,output             o_pol_done
    ,output             o_pol_status
);
    wire    [9:0]       c_aligned_10b_data;
    wire    [9:0]       c_pol_adjed_10b_data;
    wire    [9:0]       c_aligned_10b_data_msf;
    wire                c_not_in_table;
    wire                c_disp_err;

    reg                 r_disp_store;
    wire                c_disp_new;

    wire    [7:0]       c_dec_data;
    wire                c_dec_datak;

    reg     [7:0]       r_8b_data;
    reg                 r_8b_datak;

//================================================================================
//Function  : comma alignment
//================================================================================
    //TODO: make some parameters configurable later
    RX10TO8CAL m_rx10to8cal(
        .i_Clk                   (i_clk                 ),
        .i_Rst_N                 (i_rst_n               ),
        .i_RxCALDetUse           (1'b1                  ),
        .i_RxCAL10BEnable        (10'b00_1111_1111       ),  //detect only low 6bit abcdeif, so K28.0~K28.7 are all used for comma det
        .i_RxCALMCommaValue      (10'b01_0100_0011       ),
        .i_RxCALPCommaValue      (10'b10_1011_1100       ),
        .i_RxCALSlideMode        (1'b0                  ),  //disable slide mode
        .i_RxCALEnMComAlign      (1'b1                  ),
        .i_RxCALEnPComAlign      (1'b1                  ),
        .i_RxCALSlide            (1'b0                  ),  //disable slide mode
        .i_RxData                (i_10b_data            ),
        .o_RxAlignedData         (c_aligned_10b_data    ),
        .i_Rx8B10BNotInTable     (c_not_in_table        ),
        .i_Rx8B10BDispErr        (c_disp_err            ),
        .i_RxSyncEn              (1'b1                  ),
        .i_RxSyncIncDispErr      (1'b1                  ),  //disp err is also increase err cnt
        .i_RxSyncThres           (2'b11                 ),  //4 good Comma will cause sync sucess
        //20170928-twu: 
        // when light is cut and recover again, the comma of K28.2+ and K28.6-
        // may be aligned to a wrong place, ex: 10'h10e, 10'h2f2, 10'10e ...
        // that is decoded as D14.4- and D18.4+ instead of comma, and no error
        // is generated to reset the comma align module
        // however, the |A| comma will produce an not-in-table error in this
        // case: 10'h2f2, 10'h10e, 10'h0f2, 10'h10f, 10'h2f2, 10'h10e
        // but the |A| is inserted only ever 64 cycles, and will be cancelled
        // by 8 valid cycles, so never trigge the re-align
        // so change to 128 valid characters cancel out 1 invalid character
        // hope it will solve this issue
        // this method is to be proved: is there any position that all
        // misaligned data are in 8b10b table (include misaligned |A|)?
        // test on FPGA works well
        .i_RxSyncInvalidIncr     (3'h0                  ),  //256 valid characters cancel out 1 invalid character
		  //0 友邦自己
        //.i_RxSyncInvalidIncr     (3'h2                  ),  //8 valid characters cancel out 1 invalid character
        .i_RxSyncThreshold       (3'h0                  ),  //8 invalid character will cause los of sync
        .o_RxSyncState           (         ),
        .o_RxSyncLock            (o_comma_aligned       ),
        .o_RxCAL_DB1             (         ),
        .o_RxCAL_DB2             (         )
    );

//================================================================================
//Function  : polarity adjust
//================================================================================
    RX_ADJ_POL m_rx_adj_pol(
         .i_clk             (i_clk      )
        ,.i_rst_n           (i_rst_n    )
        ,.i_pol_adj_en      (i_pol_adj_en)
        ,.i_pol_cont_adj    (i_pol_cont_adj)
        ,.i_pol_ow          (i_pol_ow)
        ,.i_pol_ow_val      (i_pol_ow_val)
        ,.i_ori_data        (c_aligned_10b_data)
        ,.o_adj_data        (c_pol_adjed_10b_data)
        ,.o_pol_done        (o_pol_done)
        ,.o_pol_status      (o_pol_status)
    );
//================================================================================
//Function  : bit seq change
// the input and aligned data is LSB first
// the input of 8b/10b decoder is MSB first
//================================================================================
    genvar i;
    generate
        for(i=0; i<=9; i=i+1) begin: BIT_SEQ_ADJ
            assign c_aligned_10b_data_msf[i] = c_pol_adjed_10b_data[9-i];
        end
    endgenerate
    
//================================================================================
//Function  : decoder
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_disp_store <= `DELAY 1'b0;
        end
        else begin
            r_disp_store <= `DELAY c_disp_new;
        end
    end
    RX10B8BBYTE m_rx10b8bbyte(
        .i_DataIn       (c_aligned_10b_data_msf    ),
        .i_DispIn       (r_disp_store    ),
        .o_DataOut      (c_dec_data   ),
        .o_DataKOut     (c_dec_datak  ),
        .o_DispOut      (c_disp_new   ),
        .o_DispErr      (c_disp_err   ),
        .o_CodeErr      (c_not_in_table   )
    );
    assign o_disp_err = c_disp_err;


    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_8b_data <= `DELAY 8'h0;
            r_8b_datak <= `DELAY 1'b0;
        end
        else begin
            if(o_comma_aligned) begin
                r_8b_data <= `DELAY c_dec_data;
                r_8b_datak <= `DELAY c_dec_datak;
            end
            else begin
                r_8b_data <= `DELAY 8'h0;
                r_8b_datak <= `DELAY 1'b0;
            end
        end
    end
    assign o_8b_data = r_8b_data;
    assign o_8b_datak = r_8b_datak;

endmodule
