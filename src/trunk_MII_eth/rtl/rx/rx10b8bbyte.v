// File               : rx10b8bbyte.v
// Author             : Tao Wu
// Created On         : 2017-06-27 09:55
// Last Modified      : 2017-06-27 09:55
// Description        : 
//  8b 10b Decoder
//  MSB first for Data In of 10bit
//  LSB first for Data out of 8bit
  
`ifndef KCODE_V
`define KCODE_V

`define K281P 10'b001111_1001
`define K281M 10'b110000_0110
`define K285P 10'b001111_1010
`define K285M 10'b110000_0101
`define K287P 10'b001111_1000
`define K287M 10'b110000_0111

`endif


module RX10B8BBYTE (
    input wire  [9:0]   i_DataIn                ,
    input wire          i_DispIn                ,
    output wire [7:0]   o_DataOut               ,
    output wire         o_DataKOut              ,
    output wire         o_DispOut               ,
    output wire         o_DispErr               ,
    output wire         o_CodeErr               
);
    
    wire [5:0]          data_10b_abcdei = i_DataIn[9:4];
    wire [3:0]          data_10b_fghj = i_DataIn[3:0];

    wire                p_13 = ((data_10b_abcdei[5:2] == 4'b0001) ||
                                (data_10b_abcdei[5:2] == 4'b0010) ||
                                (data_10b_abcdei[5:2] == 4'b0100) ||
                                (data_10b_abcdei[5:2] == 4'b1000));
    wire                p_22 = ((data_10b_abcdei[5:2] == 4'b0011) ||
                                (data_10b_abcdei[5:2] == 4'b0101) ||
                                (data_10b_abcdei[5:2] == 4'b0110) ||
                                (data_10b_abcdei[5:2] == 4'b1001) ||
                                (data_10b_abcdei[5:2] == 4'b1010) ||
                                (data_10b_abcdei[5:2] == 4'b1100));
    wire                p_31 = ((data_10b_abcdei[5:2] == 4'b1110) ||
                                (data_10b_abcdei[5:2] == 4'b1101) ||
                                (data_10b_abcdei[5:2] == 4'b1011) ||
                                (data_10b_abcdei[5:2] == 4'b0111));

    wire                a_in = data_10b_abcdei[5];
    wire                b_in = data_10b_abcdei[4];
    wire                c_in = data_10b_abcdei[3];
    wire                d_in = data_10b_abcdei[2];
    wire                e_in = data_10b_abcdei[1];
    wire                i_in = data_10b_abcdei[0];
    wire                e_eq_i = (e_in == i_in);


    wire [4:0]          data_8b_abcde_pre = data_10b_abcdei[5:1];

    wire [4:0]          compl_8b_abcde = {// bit 'A'
                                          ((data_10b_abcdei[5:2] == 4'b1001) && e_eq_i) ||
                                          (p_31 && i_in) ||
                                          (data_10b_abcdei == 6'b000111) ||
                                          ((data_10b_abcdei[5:2] == 4'b0101) && e_eq_i) ||
                                          (p_13 && !e_in) ||
                                          (a_in && b_in && e_in && i_in) ||
                                          (data_10b_abcdei[3:0] == 4'b0000)
                                          ,

                                          // bit 'B'
                                          ((data_10b_abcdei[5:2] == 4'b0110) && e_eq_i) ||
                                          (p_31 && i_in) ||
                                          (data_10b_abcdei == 6'b000111) ||
                                          ((data_10b_abcdei[5:2] == 4'b1010) && e_eq_i) ||
                                          (p_13 && !e_in) ||
                                          (a_in && b_in && e_in && i_in) ||
                                          (data_10b_abcdei[3:0] == 4'b0000)
                                          ,

                                          // bit 'C'
                                          ((data_10b_abcdei[5:2] == 4'b0110) && e_eq_i) ||
                                          (p_31 && i_in) ||
                                          (data_10b_abcdei == 6'b000111) ||
                                          ((data_10b_abcdei[5:2] == 4'b0101) && e_eq_i) ||
                                          ((data_10b_abcdei[5:2] == 4'b0110) && e_eq_i) ||
                                          (p_13 && !e_in) ||
                                          (!a_in && !b_in && !e_in && !i_in) ||
                                          (data_10b_abcdei[3:0] == 4'b0000)
                                          ,

                                          // bit 'D'
                                          ((data_10b_abcdei[5:2] == 4'b1001) && e_eq_i) ||
                                          (p_31 && i_in) ||
                                          (data_10b_abcdei == 6'b000111) ||
                                          ((data_10b_abcdei[5:2] == 4'b1010) && e_eq_i) ||
                                          (p_13 && !e_in) ||
                                          (a_in && b_in && e_in && i_in) ||
                                          (data_10b_abcdei[3:0] == 4'b0000)
                                          ,

                                          // bit 'E'
                                          ((data_10b_abcdei[5:2] == 4'b1001) && e_eq_i) ||
                                          (p_13 && !i_in) ||
                                          (data_10b_abcdei == 6'b000111) ||
                                          ((data_10b_abcdei[5:2] == 4'b0101) && e_eq_i) ||
                                          (p_13 && !e_in) ||
                                          (!a_in && !b_in && !e_in && !i_in) ||
                                          (data_10b_abcdei[3:0] == 4'b0000)
                                          };


    wire [4:0]          data_8b_abcde = data_8b_abcde_pre ^ compl_8b_abcde;


   
    wire                disp_6b_neg = ((p_22 && !e_in && !i_in) ||
                                       (p_13 && !i_in) ||
                                       (p_13 && !e_in));
    wire                disp_6b_pos = ((p_22 && e_in && i_in) ||
                                       (p_31 && i_in) ||
                                       (p_31 && e_in));
    wire                disp_6b_err_if_rd_neg = disp_6b_neg || (data_10b_abcdei == 6'b000111);
    wire                disp_6b_err_if_rd_pos = disp_6b_pos || (data_10b_abcdei == 6'b111000);


    wire                disp_6b_err = i_DispIn ? disp_6b_err_if_rd_pos : disp_6b_err_if_rd_neg;
    wire                disp_post_5b = (disp_6b_err ?
                                        (disp_6b_pos || (data_10b_abcdei == 6'b000111)) :
                                        i_DispIn ^ (disp_6b_neg || disp_6b_pos));


    wire                f_in = data_10b_fghj[3];
    wire                g_in = data_10b_fghj[2];
    wire                h_in = data_10b_fghj[1];
    wire                j_in = data_10b_fghj[0];


    wire [2:0]          data_8b_fgh_pre = data_10b_fghj[3:1];


    wire                flip_fgh = ((!c_in && !d_in && !e_in && !i_in && (h_in != j_in)) ||
                                    (data_10b_fghj == 4'b0011) ||
                                    (f_in && g_in && j_in) ||
                                    (!f_in && !g_in && !h_in));

    wire [2:0]          compl_8b_fgh = {// bit 'F'
                                        ((f_in && h_in && j_in) ||
                                         flip_fgh ||
                                         (g_in && h_in && j_in))
                                        ,

                                        // bit 'G'
                                        ((!f_in && !h_in && !j_in) ||
                                         flip_fgh ||
                                         (!g_in && !h_in && !j_in))
                                        ,

                                        // bit 'H'
                                        ((f_in && h_in && j_in) ||
                                         flip_fgh ||
                                         (!g_in && !h_in && !j_in))
                                        };


    wire [2:0]          data_8b_fgh = data_8b_fgh_pre ^ compl_8b_fgh;


    wire                disp_4b_neg = ((!f_in && !h_in && !j_in) ||
                                       (!f_in && !g_in && !j_in) ||
                                       (!f_in && !g_in && !h_in) ||
                                       (!g_in && !h_in && !j_in));

    wire                disp_4b_pos = ((f_in && h_in && j_in) ||
                                       (f_in && g_in && j_in) ||
                                       (f_in && g_in && h_in) ||
                                       (g_in && h_in && j_in));
    wire                disp_4b_err_if_rd_neg = disp_4b_neg || (data_10b_fghj == 4'b0011);
    wire                disp_4b_err_if_rd_pos = disp_4b_pos || (data_10b_fghj == 4'b1100);



    wire                disp_4b_err  = disp_post_5b ? disp_4b_err_if_rd_pos : disp_4b_err_if_rd_neg;
    wire                disp_post_3b = (disp_4b_err ?
                                        (disp_4b_pos || (data_10b_fghj == 4'b0011)) :
                                        disp_post_5b ^ (disp_4b_neg || disp_4b_pos));


    wire                ghj_equiv = (g_in == h_in) && (h_in == j_in);
    assign              o_CodeErr  = ((data_10b_abcdei[5:2] == 4'b1111) ||
                                     (data_10b_abcdei[5:2] == 4'b0000) ||
                                     (p_13 && !e_in && !i_in) ||
                                     (p_31 && e_in && i_in) ||
                                     (data_10b_fghj == 4'b0000) ||
                                     (data_10b_fghj == 4'b1111) ||
                                     (disp_6b_pos && (data_10b_fghj == 4'b1100)) ||
                                     (disp_6b_neg && (data_10b_fghj == 4'b0011)) ||
                                     (disp_4b_err_if_rd_pos && (data_10b_abcdei == 6'b000111)) ||
                                     (disp_4b_err_if_rd_neg && (data_10b_abcdei == 6'b111000)) ||
                                     (c_in && d_in && e_in && i_in && !f_in && !g_in && !h_in) ||
                                     (!c_in && !d_in && !e_in && !i_in && f_in && g_in && h_in) ||
                                     (e_eq_i && (e_in == f_in) && (e_in == g_in) && (e_in == h_in)) ||
                                     (!e_eq_i && (e_in == g_in) && ghj_equiv) ||
                                     (e_eq_i && (e_in != g_in) && ghj_equiv &&
                                      !((c_in == d_in) && (d_in == e_in))) ||
                                     (!p_31 && e_in && !i_in && !g_in && !h_in && !j_in) ||
                                     (!p_13 && !e_in && i_in && g_in && h_in && j_in) ||
                                     (disp_6b_neg && disp_4b_neg) ||
                                     (disp_6b_pos && disp_4b_pos));

    
    //////////////////////////////////////////////////////////////////
    //outputs
    assign              o_DataOut = {data_8b_fgh[0],
                                    data_8b_fgh[1],
                                    data_8b_fgh[2],
                                    data_8b_abcde[0],
                                    data_8b_abcde[1],
                                    data_8b_abcde[2],
                                    data_8b_abcde[3],
                                    data_8b_abcde[4]};
    assign              o_DataKOut = (!c_in && !d_in && !e_in && !i_in) ||
                                    (c_in && d_in && e_in && i_in) ||
                                    (p_13 && !e_in && i_in && g_in && h_in && j_in) ||
                                    (p_31 && e_in && !i_in && !g_in && !h_in && !j_in);
    assign              o_DispErr = disp_6b_err || disp_4b_err;
    assign              o_DispOut = disp_post_3b;

endmodule
