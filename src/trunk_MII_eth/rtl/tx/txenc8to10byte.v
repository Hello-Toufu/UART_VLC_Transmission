// File               : txenc8to10byte.v
// Author             : Tao Wu
// Created On         : 2017-06-27 09:54
// Last Modified      : 2017-06-27 09:54
// Description        : 
// 8b 10b encoder
// LSB first IN for 8bit data
// MSB first Out for 10bit data
                        
module TXENC8TO10BYTE(
        input           i_Tx8B10BUse        ,
        input           i_DataK             ,
        input    [7:0]  i_Data              ,
        input           i_TxDisp            ,
    
        output   [9:0]  o_EncData           ,
        output          o_TxKErr            ,
        output          o_TxDisp     
    
        );

    wire [7:0]   data_in;
    wire         datak_in;
    wire         disp_in;
    wire [9:0]  data_out;
    wire        disp_out;
    wire        err;


    // Split incoming data into 3-bit and 5-bit chunks. By convention,
    // the most-significant three bits are labeled HGF and the bottom
    // five bits are labeled EDCBA.  The upper-case indicates that
    // they are 8b bits instead of 10b bits.  Since we don't want to
    // use upper case, we'll stick 8b in the middle to distinguish it
    // from the encoded data later.
    //
    // To make things more interesting, the coding scheme requires that
    // the 'a' bit will be the first to go out.  To make this work
    // for most modern serial transmitters (MSB of the encoded word goes
    // out first), we swizzle the input bits around so they are in the
    // correct order for sending out after they've been transformed by
    // the code.  If this is confusing, just think of the vectors below
    // as being backwards.
    //
    wire [2:0]          data_8b_fgh = {data_in[5], data_in[6], data_in[7]};
    wire [4:0]          data_8b_abcde = {data_in[0], data_in[1],
        data_in[2], data_in[3], data_in[4]};

    // Generate some enables (per the Widmer/Franaszek paper) from the
    // EDCBA data.  These terms will be used to perform specific
    // translations on the incoming data stream.  Where W & F used
    // names like "L04", we'll use an alternate naming convention,
    // e.g. en_04, to eliminate the use of upper-case and to reduce
    // confusion between l (the letter) and 1 (the number).
    //
    wire                en_04 = (data_8b_abcde[4:1] == 4'b0000);
    wire                en_13 = ((data_8b_abcde[4:1] == 4'b0001) ||
            (data_8b_abcde[4:1] == 4'b0010) ||
            (data_8b_abcde[4:1] == 4'b0100) ||
            (data_8b_abcde[4:1] == 4'b1000));
    wire                en_22 = ((data_8b_abcde[4:1] == 4'b0011) ||
            (data_8b_abcde[4:1] == 4'b0101) ||
            (data_8b_abcde[4:1] == 4'b0110) ||
            (data_8b_abcde[4:1] == 4'b1001) ||
            (data_8b_abcde[4:1] == 4'b1010) ||
            (data_8b_abcde[4:1] == 4'b1100));
    wire                en_31 = ((data_8b_abcde[4:1] == 4'b1110) ||
            (data_8b_abcde[4:1] == 4'b1101) ||
            (data_8b_abcde[4:1] == 4'b1011) ||
            (data_8b_abcde[4:1] == 4'b0111));
    wire                en_40 = (data_8b_abcde[4:1] == 4'b1111);
    wire                d_in = data_8b_abcde[1];
    wire                e_in = data_8b_abcde[0];

    // The "typical" encoding from ABCDE->abcdei is simply to copy the original bits
    // and tack on a zero.  Generate that value here and we'll modify it as necessary.
    //
    wire [5:0]          data_10b_abcdei_pre = {data_8b_abcde, 1'b0};

    // Generate a set of bits to be forced to one based on the 5b/6b input controls
    //
    wire [5:0]          force_10b_abcdei = {// bit 'a'
        1'b0,

        // bit 'b'
        en_04,

        // bit 'c'
        en_04 ||
        (en_13 && d_in && e_in),

        // bit 'd'
        1'b0,

        // bit 'e'
        (en_13 && !e_in),

        // bit 'i'
        (en_22 && !e_in) ||
        (en_04 && e_in) ||
        (en_13 && !d_in && e_in) ||
        (en_22 && datak_in) ||
        (en_40 && e_in)};

    // Generate a set of bits to be forced to zero based on the 5b/6b input controls
    //
    wire [5:0]          clear_10b_abcdei = {// bit 'a'
        1'b0,

        // bit 'b'
        en_40,

        // bit 'c'
        1'b0,

        // bit 'd'
        en_40,

        // bit 'e'
        (en_13 && d_in && e_in),

        // bit 'i'
        1'b0};

    // Generate the output of the 5b/6b encoding table, without taking the current running disparity
    // into account.
    //
    wire [5:0]          data_10b_abcdei_init = (data_10b_abcdei_pre | force_10b_abcdei) & ~clear_10b_abcdei;


    // Generate some terms which indicate whether or not to invert the 6b data based on the current
    // running disparity
    //
    wire                disp_6b_neg = ((!en_22 && !en_31 && !e_in) ||
            (en_13 && d_in && e_in));
    wire                disp_6b_pos = ((!en_22 && !en_13 & e_in) ||
            datak_in);
    wire                compl_6b = disp_in ? (disp_6b_pos || (data_8b_abcde == 5'b11100)) : disp_6b_neg;

    // Generate final 6b encoding and calculate post-6b disparity
    //
    wire [5:0]          data_10b_abcdei = data_10b_abcdei_init ^ {6{compl_6b}};
    wire                disp_post_6b = disp_in ^ (disp_6b_neg | disp_6b_pos);


    // 3b/4b encoder
    //
    // Generate some controls which are specific to the 3b/4b portion of the encoder
    //
    wire                f_in = data_8b_fgh[2];
    wire                g_in = data_8b_fgh[1];
    wire                h_in = data_8b_fgh[0];
    wire                e_out = data_10b_abcdei[1];
    wire                i_out = data_10b_abcdei[0];
    wire                en_alt7 = ((data_8b_fgh == 3'b111) &&
            (datak_in ||
                (e_out && i_out && !disp_post_6b) ||
                (!e_out && !i_out && disp_post_6b)));

    // The "typical" encoding from FGH->fghj is simply to copy the original bits
    // and tack on a zero.  Generate that value here and we'll modify it as necessary.
    //
    wire [3:0]          data_10b_fghj_pre = {data_8b_fgh, 1'b0};


    // Generate a set of bits to be forced to one based on the 3b/4b input controls
    //
    wire [3:0]          force_10b_fghj = {// bit 'f'
        1'b0,

        // bit 'g'
        (data_8b_fgh == 3'b000),

        // bit 'h'
        1'b0,

        // bit 'j'
        (f_in ^ g_in) & !h_in};

    // Generate the output of the 3b/4b encoding table, without taking the current running disparity
    // into account.
    //
    wire [3:0]          data_10b_fghj_init = en_alt7 ? 4'b0111 : (data_10b_fghj_pre | force_10b_fghj);

    // Generate some terms which indicate whether or not to invert the 6b data based on the current
    // running disparity
    //
    wire                disp_4b_neg = (!f_in & !g_in);
    wire                disp_4b_pos = (f_in & g_in & h_in);
    wire                compl_if_pos = f_in & g_in;
    wire                compl_if_neg = disp_4b_neg || ((f_in ^ g_in) && datak_in);
    wire                compl_4b = disp_post_6b ? compl_if_pos : compl_if_neg;

    // Generate final 4b encoding and calculate post-4b disparity (i.e. the final disparity)
    //
    wire [3:0]          data_10b_fghj = data_10b_fghj_init ^ {4{compl_4b}};
    assign              disp_out = disp_post_6b ^ (disp_4b_neg | disp_4b_pos);


        // The only error that the encoder can generate is due to illegal k-code requests.  The only
        // valid k-codes are K28.X (where X can be 0-7), and K23.7, K27.7, K29.7, and K30.7.  Verify
        // validity of incoming data here
        //
    wire                k_valid = ((data_8b_abcde == 5'b00111) || // Any K28 is OK
            ((data_8b_fgh == 3'b111) && e_in && en_31)); // K23/27/29/30.7 is OK

    // Finally assign to the outputs
    //
    assign              err = datak_in && !k_valid;
    assign              data_out = {data_10b_abcdei, data_10b_fghj};

        
    assign data_in = i_Data;
    assign datak_in = i_DataK;
    assign disp_in = i_TxDisp;
    
    assign o_EncData = i_Tx8B10BUse ?data_out : 10'h0;
    assign o_TxDisp = i_Tx8B10BUse ? disp_out : 1'b0;
    assign o_TxKErr = i_Tx8B10BUse ?err : 1'b0;

endmodule
//`endif
