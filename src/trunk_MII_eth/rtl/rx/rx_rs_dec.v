// File               : rx_rs_dec.v
// Author             : Tao Wu
// Created On         : 2017-06-23 14:38
// Last Modified      : 2018-05-28 15:13
// Description        : 
// rs decoder

module RX_RS_DEC #(
    parameter           RS_DEC_DLY = `RS_DEC_DLY
)(
    input               i_clk
    ,input              i_rst_n

    ,input              i_rs_en
    //for x1 mode, it is comma align, for x4 mode, it is deskew align
    //incase the lane is bad and recover again, reset rs module after this
    ,input              i_data_aligned      

    ,input  [7:0]       i_enc_data
    ,input              i_sof
    ,input              i_rs_data_symbol
    ,input              i_rs_check_symbol

    ,output [7:0]       o_dec_data
    ,output             o_dec_data_valid
    ,output             o_dec_sof

    //debug status
    ,output             o_rs_fail
    ,output             o_rs_err_found
    ,output [4:0]       o_rs_err_num
);

    wire                c_s_axis_input_tready;
    wire  [7:0]         c_m_axis_stat_tdata             ;
    wire                c_m_axis_stat_tvalid            ;
    wire                c_event_s_input_tlast_missing   ;
    wire                c_event_s_input_tlast_unexpected;
    wire                c_event_s_ctrl_tdata_invalid    ;
    wire                c_m_axis_output_tlast;

    wire  [7:0]         c_dec_data;
    wire                c_dec_data_valid;

    reg     [7:0]       r_enc_data          ;
    reg                 r_sof               ;
    reg [RS_DEC_DLY:0]    r_sof_dly;
    reg                 r_rs_data_symbol    ;
    reg                 r_rs_data_symbol_d1 ;
    reg                 r_rs_check_symbol   ;
    wire                c_rs_data_valid;
    wire                c_rs_tlast;
    wire                c_rs_start;

    reg                 r_rs_fail       ;
    reg     [4:0]       r_rs_err_num    ;
    reg                 r_rs_err_found  ;

    //reset rs decoder when rs is los of sync of block
    reg   [1:0]         r_rs_los_rst    ;
    wire                c_rs_arst_n;
    reg                 r_rs_sof_detected;

   wire [7:0]           c_rs_err_num;
   wire                 c_rs_fail;
   wire                 c_rs_err_found;

   wire                 c_dec_data_start;
   reg  [7:0]           r_dec_data_valid_cnt;

    //delay data to generate tlast
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_enc_data          <= `DELAY 8'h0;
            r_sof               <= `DELAY 1'h0;
            r_rs_data_symbol    <= `DELAY 1'h0;
            r_rs_data_symbol_d1 <= `DELAY 1'h0;
            r_rs_check_symbol   <= `DELAY 1'h0;
        end
        else begin
            r_enc_data          <= `DELAY i_enc_data       ;
            r_sof               <= `DELAY i_sof            ;
            r_rs_data_symbol    <= `DELAY i_rs_data_symbol ;
            r_rs_data_symbol_d1 <= `DELAY r_rs_data_symbol;
            r_rs_check_symbol   <= `DELAY i_rs_check_symbol;
        end
    end
    assign c_rs_data_valid = (r_rs_data_symbol || r_rs_check_symbol) && r_rs_sof_detected;
    assign c_rs_tlast = (~i_rs_check_symbol) && r_rs_check_symbol;
    assign c_rs_start = r_rs_data_symbol && (~r_rs_data_symbol_d1);

    //generate sof
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof_dly[0] <= `DELAY 1'b0;
        end
        else begin
            r_sof_dly[0] <= `DELAY r_sof;
        end
    end
    genvar i;
    generate
        for(i=1; i<=RS_DEC_DLY; i=i+1) begin: DLY_SOF
            always@(posedge i_clk or negedge i_rst_n) begin
                if (~i_rst_n) begin
                    r_sof_dly[i] <= `DELAY 1'b0;
                end
                else begin
                    r_sof_dly[i] <= `DELAY r_sof_dly[i-1];
                end
            end
        end
    endgenerate
    assign o_dec_sof = i_rs_en ? r_sof_dly[RS_DEC_DLY-1] : i_sof;

//================================================================================
//Function  : reset rs decoder when
//  1. system reset
//  2. input data is not aligned yet
//  3. rs is los of block sync (indicated by tlast_missing)
//
//================================================================================
    assign c_rs_arst_n = i_data_aligned && i_rst_n && (~r_rs_los_rst[0]);

    //generate r_rs_los_rst
    //as is required by rs_decoder, aresetn is assert 2 clock cycles 
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_los_rst <= `DELAY 2'b00;
        end
        else begin
            if(c_event_s_input_tlast_missing)
                r_rs_los_rst <= `DELAY 2'b11;
            else
                r_rs_los_rst <= `DELAY {1'b0, r_rs_los_rst[1]};
        end
    end

    //mark sof detect when the first sof appear after reset
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_sof_detected <= `DELAY 1'b0;
        end
        else begin
            if((~i_data_aligned) || (r_rs_los_rst[0])) 
                r_rs_sof_detected <= `DELAY 1'b0;
            else if(i_sof)
                r_rs_sof_detected <= `DELAY 1'b1;
        end
    end

`ifndef XILINX_RS_IP
    RsDecodeTop m_rs_decoder(
        // Inputs
        .CLK          (i_clk),               // system clock
        .RESET        (c_rs_arst_n),             // system reset
        .enable       (i_rs_en),       // RSdec enable in
        .startPls     (c_rs_start),         // RSdec sync signal
        .dataIn       (r_enc_data),       // RSdec data in
        // Outputs
        .outEnable    (),    // RSdec enable out
        .outStartPls  (c_dec_data_start),  // RSdec start pulse out
        .outDone      (c_m_axis_output_tlast),      // RSdec done out
        .errorNum     (c_rs_err_num),     // RSdec error number
        .fail         (c_rs_fail),         // RSdec Pass/Fail flag
        .delayedData  (),  // RSdec delayed data
        .outData      (c_dec_data)       // Rsdec data out
    );
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_dec_data_valid_cnt <= `DELAY 8'd0;
        end
        else begin
            if(c_dec_data_start)
                r_dec_data_valid_cnt <= `DELAY 8'd1;
            else if(r_dec_data_valid_cnt != 8'd0) begin
                if(r_dec_data_valid_cnt == `RS_K-1)
                    r_dec_data_valid_cnt <= `DELAY 8'd0;
                else
                    r_dec_data_valid_cnt <= `DELAY r_dec_data_valid_cnt + 8'd1;
            end
        end
    end

    assign c_rs_err_found = (c_rs_err_num != 8'h0);
    assign c_event_s_input_tlast_missing = 1'b0;
    assign c_dec_data_valid = c_dec_data_start || (r_dec_data_valid_cnt != 8'd0);
    assign c_m_axis_stat_tvalid = 1'b1;
`else
//================================================================================
//Function  : instance xilinx ip
//================================================================================
    rs_decoder_0 m_rs_decoder(
         .aclk                              (i_clk                           )
        ,.aresetn                           (c_rs_arst_n)  
        ,.s_axis_input_tdata                (r_enc_data             )
        ,.s_axis_input_tvalid               (c_rs_data_valid)
        ,.s_axis_input_tlast                (c_rs_tlast           )
        ,.s_axis_input_tready               (c_s_axis_input_tready            )
        ,.m_axis_output_tdata               (c_dec_data            )
        ,.m_axis_output_tvalid              (c_dec_data_valid           )
        ,.m_axis_output_tready              (1'b1        )  //downstreams always ready to accept data
        ,.m_axis_output_tlast               (c_m_axis_output_tlast            )
        ,.m_axis_stat_tdata                 (c_m_axis_stat_tdata              )
        ,.m_axis_stat_tvalid                (c_m_axis_stat_tvalid             )
        ,.m_axis_stat_tready                (1'b1             )
        ,.event_s_input_tlast_missing       (c_event_s_input_tlast_missing    )
        ,.event_s_input_tlast_unexpected    (c_event_s_input_tlast_unexpected )
        ,.event_s_ctrl_tdata_invalid        (c_event_s_ctrl_tdata_invalid     )
    );
    assign c_rs_err_num[4:0] = c_m_axis_stat_tdata[6:2];
    assign c_rs_err_num[7:5] = 3'h0;
    assign c_rs_fail = c_m_axis_stat_tdata[0];
    assign c_rs_err_found = c_m_axis_stat_tdata[1];
`endif
    assign o_dec_data = i_rs_en ? c_dec_data : i_enc_data;
    assign o_dec_data_valid = i_rs_en ? c_dec_data_valid : i_rs_data_symbol;
    

//================================================================================
//Function  : debug signals
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rs_fail <= `DELAY 1'b0;
            r_rs_err_num <= `DELAY 5'd0;
            r_rs_err_found <= `DELAY 1'b0;
        end
        else begin
            if(c_m_axis_stat_tvalid) begin
                r_rs_fail <= `DELAY c_rs_fail;
                r_rs_err_num <= `DELAY c_rs_err_num;
                r_rs_err_found <= `DELAY c_rs_err_found;
            end
        end
    end
    //these rs status signal should only last 1 cycle, it is assert the next
    //cycle after sof
    assign o_rs_fail = r_rs_fail && r_sof_dly[RS_DEC_DLY];
    assign o_rs_err_found = r_rs_err_found && r_sof_dly[RS_DEC_DLY];
    assign o_rs_err_num = r_sof_dly[RS_DEC_DLY] ? r_rs_err_num : 5'd0;

endmodule
                        


