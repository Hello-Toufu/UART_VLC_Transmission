// File               : tx_rs_enc.v
// Author             : Tao Wu
// Created On         : 2017-06-22 17:50
// Last Modified      : 2017-07-28 15:36
// Description        : 
//  reed solomon encoder, adapter the interface with the rs_enc ip
//  one lane

module TX_RS_ENC #(
    parameter           RS_ENC_DLY = `RS_ENC_DLY   
)(
    input               i_clk
    ,input              i_rst_n

    ,input              i_rs_en

    //raw data before encode
    ,input              i_raw_sof
    ,input  [7:0]       i_raw_data
    ,input              i_raw_rs_data_symbol
    ,input              i_raw_rs_check_symbol

    //encoded data
    ,output             o_enc_sof
    ,output [7:0]       o_enc_data
    ,output             o_enc_data_valid
);

    wire                c_s_axis_input_tready;
    wire                c_event_s_input_tlast_missing    ;
    wire                c_event_s_input_tlast_unexpected ;
    wire    [7:0]       c_enc_data          ;
    wire                c_enc_data_valid    ;

    wire                c_raw_data_valid;
    reg                 r_raw_rs_data_symbol;
    wire                c_raw_rs_data_symbol_rise;

    reg [RS_ENC_DLY-1:0]    r_sof_dly;
    reg [RS_ENC_DLY-1:0]    r_data_valid;

    assign c_raw_data_valid = (i_raw_rs_data_symbol|| i_raw_rs_check_symbol);

    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_sof_dly[0] <= `DELAY 1'b0;
            r_data_valid[0] <= `DELAY 1'b0;
        end
        else begin
            r_sof_dly[0] <= `DELAY i_raw_sof;
            r_data_valid[0] <= `DELAY c_raw_data_valid;
        end
    end

    genvar i;
    generate
        for(i=1; i<=RS_ENC_DLY-1; i=i+1) begin: DLY_SOF
            always@(posedge i_clk or negedge i_rst_n) begin
                if (~i_rst_n) begin
                    r_sof_dly[i] <= `DELAY 1'b0;
                    r_data_valid[i] <= `DELAY 1'b0;
                end
                else begin
                    r_sof_dly[i] <= `DELAY r_sof_dly[i-1];
                    r_data_valid[i] <= `DELAY r_data_valid[i-1];
                end
            end
        end
    endgenerate
    assign o_enc_sof = i_rs_en ? r_sof_dly[RS_ENC_DLY-1] : i_raw_sof;

        
//================================================================================
//Function  : gen the rs start signal
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_raw_rs_data_symbol <= `DELAY 1'b0;
        end
        else begin
            r_raw_rs_data_symbol <= `DELAY i_raw_rs_data_symbol;
        end
    end
    assign c_raw_rs_data_symbol_rise = i_raw_rs_data_symbol && (~r_raw_rs_data_symbol);
`ifndef XILINX_RS_IP
//================================================================================
//Function  : our rs ip
//================================================================================
   RsEncodeTop m_rs_encoder(
      // Inputs
      .CLK      (i_clk),           // system clock
      .RESET    (i_rst_n),         // system reset
      .enable   (i_rs_en),   // RSenc enable signal
      .startPls (c_raw_rs_data_symbol_rise), // RSenc sync signal
      // Outputs
      .dataIn   (i_raw_data),   // RSenc data in
      .dataOut  (c_enc_data)   // RSenc data out
   );
`else
//================================================================================
//Function  : instance xilinx ip
//================================================================================
    rs_encoder_0 m_rs_encoder(
         .aclk                              (i_clk)
        ,.aresetn                           (i_rst_n)
        ,.s_axis_input_tdata                (i_raw_data)
        ,.s_axis_input_tvalid               (i_raw_rs_data_symbol)
        ,.s_axis_input_tready               (c_s_axis_input_tready)
        ,.s_axis_input_tlast                (1'b0)
        ,.m_axis_output_tdata               (c_enc_data)
        ,.m_axis_output_tvalid              (c_enc_data_valid)
        ,.m_axis_output_tlast               ()
        ,.event_s_input_tlast_missing       (c_event_s_input_tlast_missing    )
        ,.event_s_input_tlast_unexpected    (c_event_s_input_tlast_unexpected )
    );
`endif

    assign o_enc_data = i_rs_en ? c_enc_data : i_raw_data;
    //assign o_enc_data_valid = i_rs_en ? c_enc_data_valid : c_raw_data_valid;
    assign o_enc_data_valid = i_rs_en ? r_data_valid[RS_ENC_DLY-1] : c_raw_data_valid;
//================================================================================
//Function  : check
//  TODO: 
//      c_s_axis_input_tready should always be '1' when i_raw_rs_data_symbol is '1'
//      the c_event_s_input_tlast_unexpected should never assert
//================================================================================

endmodule 
