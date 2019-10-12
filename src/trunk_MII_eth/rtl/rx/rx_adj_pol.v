// File               : rx_adj_pol.v
// Author             : Tao Wu
// Created On         : 2017-08-30 13:50
// Last Modified      : 2017-09-01 17:29
// Description        : 
// Adjust the data polarity according to the pol comma received 
// since the received data may have bit error
// we should treat successfule detect as N continues same polarity comma
//
// recover
// K28.2+/- -> K28.5+
// K28.5+/- -> K28.6-
                        
module RX_ADJ_POL#(
    parameter       COMMA_POS = 10'b10_1011_1100    //K28.2+
    ,parameter      COMMA_NEG = 10'b10_0100_0011    //K28.6-
    ,parameter      ORI_COMMA_POS = 10'b01_0111_1100    //K28.5+
)(
    input               i_clk
    ,input              i_rst_n

    ,input              i_pol_adj_en
    ,input              i_pol_cont_adj          //0: only detect once after reset, 1: detect continuesly
    ,input              i_pol_ow
    ,input              i_pol_ow_val

    ,input  [9:0]       i_ori_data
    ,output [9:0]       o_adj_data

    ,output             o_pol_done
    ,output             o_pol_status
);

    reg [9:0]           r_adj_data;
    reg [9:0]           r_rep_data;

    localparam  INIT    = 2'd0,     //initial state
                DET_PRE = 2'd1,     //detect N continues same polarity comma, treat as polarity detected, jump to POL_GOT
                POL_GOT = 2'd2,     //pol is done, detect 1 reversed polarity comma, jump to POL_CHK
                POL_CHK = 2'd3;     //check if the polarity is right

    reg [1:0]           r_state;
    reg [1:0]           c_state_next;

    localparam  DET_PRE_NUM = 16;
    localparam  POL_CHK_NUM = 16;

    reg [3:0]           r_pol_comma_cnt;

    reg                 r_cur_pol;  //0 means no need to inv, 1 means need to inv
    wire                c_pol_comma_hit;
    wire                c_pol_inv_comma_hit;
    wire                c_pol_match_hit;
    wire                c_pol_unmatch_hit;


    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_state <= `DELAY INIT;
        end
        else begin
            if(~i_pol_adj_en)
                r_state <= `DELAY INIT;
            else
                r_state <= `DELAY c_state_next;
        end
    end
    
    always@( * ) begin
        c_state_next = r_state;
        case(r_state)
            INIT   : begin
                if(i_pol_adj_en)
                    c_state_next = DET_PRE;
                else
                    c_state_next = INIT;
            end
            DET_PRE: begin
                if(r_pol_comma_cnt == DET_PRE_NUM-1)
                    c_state_next = POL_GOT;
                else
                    c_state_next = DET_PRE;
            end
            POL_GOT: begin
                if((c_pol_unmatch_hit) && i_pol_cont_adj)
                    c_state_next = POL_CHK;
                else
                    c_state_next = POL_GOT;
            end
            POL_CHK: begin
                if(c_pol_match_hit && (r_pol_comma_cnt == 0))
                    c_state_next = POL_GOT;
                else if(r_pol_comma_cnt == POL_CHK_NUM -1)
                    c_state_next = DET_PRE;
                else
                    c_state_next = POL_CHK;
            end
        endcase
    end

//================================================================================
//Function  : detect pol comma match
//================================================================================
    assign c_pol_comma_hit = (i_ori_data == COMMA_POS) || (i_ori_data == COMMA_NEG);
    assign c_pol_inv_comma_hit = (i_ori_data == (~COMMA_POS)) || (i_ori_data == (~COMMA_NEG));

    assign c_pol_match_hit = ((~r_cur_pol) && c_pol_comma_hit) || (r_cur_pol && c_pol_inv_comma_hit);
    assign c_pol_unmatch_hit = (r_cur_pol && c_pol_comma_hit) || ((~r_cur_pol) && (c_pol_inv_comma_hit));

//================================================================================
//Function  : store the current pol
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_cur_pol <= `DELAY 1'b0;
        end
        else begin
            if(i_pol_ow)
                r_cur_pol <= `DELAY i_pol_ow_val;
            else if(r_state == INIT)
                r_cur_pol <= `DELAY 1'b0;
            //in DET_PRE state, always store the lastest pol status
            //in other state, keep the cur_pol state unchanged
            else if(r_state == DET_PRE) begin
                if(c_pol_comma_hit)
                    r_cur_pol <= `DELAY 1'b0;
                else if(c_pol_inv_comma_hit)
                    r_cur_pol <= `DELAY 1'b1;
            end
        end
    end

//================================================================================
//Function  :pol counter 
//================================================================================
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_pol_comma_cnt <= `DELAY 4'd0;
        end
        else begin
            if(r_state == DET_PRE) begin
                if(c_pol_match_hit)
                    r_pol_comma_cnt <= `DELAY r_pol_comma_cnt + 4'd1;
                else if(c_pol_unmatch_hit) 
                    r_pol_comma_cnt <= `DELAY 4'd0;
            end
            else if(r_state == POL_GOT)
                r_pol_comma_cnt <= `DELAY 4'd0;
            else if(r_state == POL_CHK) begin
                if(c_pol_match_hit)
                    r_pol_comma_cnt <= `DELAY r_pol_comma_cnt - 4'd1;
                else if(c_pol_unmatch_hit)
                    r_pol_comma_cnt <= `DELAY r_pol_comma_cnt + 4'd1;
            end
        end
    end

//================================================================================
//Function  : replace comma K28.6 to K28.5, and treat the polarity
//================================================================================
    //replace comma and treat polarity
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_adj_data <= `DELAY COMMA_POS;
        end
        else begin
            //all the COM_POS or ~COM_POS should be convert to ORI_COMMA_POS
            //all the COM_NEG or ~COM_NEG should be convert to ~ORI_COMMA_POS
            if((i_ori_data == COMMA_POS) || (i_ori_data == (~COMMA_POS)))
                r_adj_data <= `DELAY ORI_COMMA_POS;
            else if( (i_ori_data == COMMA_NEG) || (i_ori_data == (~COMMA_NEG)) )  
                r_adj_data <= `DELAY (~ORI_COMMA_POS);
            else begin
                //no need inv
                if(~r_cur_pol) 
                    r_adj_data <= `DELAY i_ori_data;
                //need inv
                else 
                    r_adj_data <= `DELAY (~i_ori_data);
            end
        end
    end

    //replace comma only, incase the other side enable the pol_adj feature
    //if other side not enabled po_adj, all data are passed unchanged
    always@(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_rep_data <= `DELAY COMMA_POS;
        end
        else begin
            //the ~COMMA_XXX case should not happen, if happen, the means there is
                //polarity invert outside, this module is designed to be
                //enable in this case
            //however, incase we disable pol_adj, we will try to recover the
            //comma to meet the 8b10b +- rule, so repace the 
            //positive K28.6 with positive K28.5, to keep accordance with
            //negtive K28.5
            if((i_ori_data == COMMA_POS) || (i_ori_data == (~COMMA_POS)))
                r_rep_data <= `DELAY ORI_COMMA_POS;
            else if( (i_ori_data == COMMA_NEG) || (i_ori_data == (~COMMA_NEG)) )  
                r_rep_data <= `DELAY (~ORI_COMMA_POS);
            else if(i_ori_data == (~COMMA_NEG))    
                r_rep_data <= `DELAY (COMMA_POS);
            else begin
                r_rep_data <= `DELAY i_ori_data;
            end
        end
    end
//================================================================================
//Function  : outputs
//================================================================================
    assign o_adj_data = i_pol_adj_en ? r_adj_data : r_rep_data;
    assign o_pol_done = (r_state == POL_GOT) || (r_state == POL_CHK);
    assign o_pol_status = r_cur_pol;
endmodule
