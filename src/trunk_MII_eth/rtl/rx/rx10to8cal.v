// File               : rx10to8cal.v
// Author             : Tao Wu
// Created On         : 2017-06-27 09:57
// Last Modified      : 2018-05-31 15:41
// Description        : 
//  Data is assumed to be LSB First

module RX10TO8CAL(
    input           i_Clk                   ,
    input           i_Rst_N                 ,
    //RXCAL                                            
    input           i_RxCALDetUse           ,
    input   [9:0]   i_RxCAL10BEnable        ,
    input   [9:0]   i_RxCALMCommaValue      ,
    input   [9:0]   i_RxCALPCommaValue      ,
    input           i_RxCALSlideMode        ,//bit1: 1: manual.0: auto    bit0: reserved.
    input           i_RxCALEnMComAlign      ,
    input           i_RxCALEnPComAlign      ,
    input           i_RxCALSlide           ,//manual. the posedge indicates that the muxout shift left 1 bit.
    
    input   [9:0]   i_RxData                ,//lsb is arrived first
    output  [9:0]   o_RxAlignedData         ,
    
    //RXSYNC
    input           i_Rx8B10BNotInTable         ,
    input           i_Rx8B10BDispErr            ,
    input           i_RxSyncEn                  ,
    input           i_RxSyncIncDispErr          ,
    input   [1:0]   i_RxSyncThres               ,// 00: 2   01: 4  10: 8   11: 16
    input   [2:0]   i_RxSyncInvalidIncr         ,// 1   2   4   8   16  32  64  128 
    input   [2:0]   i_RxSyncThreshold           ,// 4   8   16  32  64  128 256 512
    output  [1:0]   o_RxSyncState               ,
    output          o_RxSyncLock                ,
    output  [15:0]  o_RxCAL_DB1                 ,
    output  [5:0]   o_RxCAL_DB2             
);

    //Signal
    reg  [9:0] r_RxDataReg;
    wire [19:0] c_RxDataReg;    
    wire [9:0] c_ComAlign;
    reg [9:0] r_ComAlign;
    
    wire c_RxCalDetected;
    wire c_RxCALIsAligned;
    
    reg r_RxCALSlide;
    wire c_MuxSelLoad;
    reg [9:0] r_MuxSel;
    reg [9:0] c_RxAlignedData;
    reg [9:0] r_RxAlignedData;
    
    parameter   SYNC_LOS    = 2'b00;
    parameter   SYNC_PRE    = 2'b10;
    parameter   SYNC_TEST   = 2'b01;
    parameter   SYNC_SYNC   = 2'b11;
    reg     [1:0]   r_syncState         ;
    reg     [1:0]   c_syncStateNext     ;
    
    wire    c_BeatInTable;        
    reg     [4:0] r_syncTestValid;
    wire c_syncTestSucc;
    
    reg [9:0] r_losErrCnt; //0 to 511
    reg [7:0] r_losGoodCnt;//0 to 255
    
    reg [9:0] c_Threshold;
    reg [7:0] c_InvalidIncr;
    
    wire        c_decrByOne;
    
    wire        c_8B10BDecErr;
    wire        c_losErrCntTop;
    //Logic 
    
    
    ////////////////////////////////////////////////////////////////////////////
    //  Comma Detect and Word Align
    ////////////////////////////////////////////////////////////////////////////

    //RxDataReg.
    always @ (posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_RxDataReg <= `DELAY 10'h0;
        end
        else begin
            if(i_RxCALDetUse) begin
                r_RxDataReg <= `DELAY i_RxData[9:0];
            end
        end
    end
    
    assign c_RxDataReg = {i_RxData[9:0], r_RxDataReg[9:0]};
    
    //20 checker
    COMCHK m_comchk_00( .i_Data(c_RxDataReg[9:00]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[00]));
    COMCHK m_comchk_01( .i_Data(c_RxDataReg[10:01]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[01]));
    COMCHK m_comchk_02( .i_Data(c_RxDataReg[11:02]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[02]));
    COMCHK m_comchk_03( .i_Data(c_RxDataReg[12:03]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[03]));
    COMCHK m_comchk_04( .i_Data(c_RxDataReg[13:04]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[04]));
    COMCHK m_comchk_05( .i_Data(c_RxDataReg[14:05]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[05]));
    COMCHK m_comchk_06( .i_Data(c_RxDataReg[15:06]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[06]));
    COMCHK m_comchk_07( .i_Data(c_RxDataReg[16:07]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[07]));
    COMCHK m_comchk_08( .i_Data(c_RxDataReg[17:08]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[08]));
    COMCHK m_comchk_09( .i_Data(c_RxDataReg[18:09]),.i_Mask(i_RxCAL10BEnable),.i_MComma(i_RxCALMCommaValue),.i_PComma(i_RxCALPCommaValue),.i_PComAlignEn(i_RxCALEnPComAlign),.i_MComAlignEn(i_RxCALEnMComAlign),.o_ComDetForAlign(c_ComAlign[09]));
    

    //break the comb path
    always @(posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_ComAlign <= `DELAY 10'b00_0000_0000;
        end
        else begin
            r_ComAlign <= `DELAY c_ComAlign[9:0];
        end
    end
    
    assign c_RxCALIsAligned = | r_ComAlign;
    
    assign c_MuxSelLoad = r_syncState==SYNC_LOS;

    always @(posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_RxCALSlide <= `DELAY 1'b0;
        end
        else begin
            r_RxCALSlide <= `DELAY i_RxCALSlide;
        end
    end
    always @(posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_MuxSel <= `DELAY 10'h1;
        end
        else begin
            if(i_RxCALSlideMode) begin
                if(i_RxCALSlide & ~r_RxCALSlide) begin
                    r_MuxSel <= `DELAY {r_MuxSel[8:0], r_MuxSel[9]};
                end
                else begin
                    r_MuxSel <= `DELAY r_MuxSel;
                end
            end
            else if(c_MuxSelLoad) begin
                //when the r_ComAlign is like 'b...100100, this function will remove the multiple ones at higher bits, leaving only onehot.
                r_MuxSel <= `DELAY (|r_ComAlign) ? ((~(r_ComAlign - 10'b1)) & r_ComAlign) : 10'b1;
            end
        end
    end
    
    always @ ( * ) begin
        c_RxAlignedData = (c_RxDataReg[09:00] & {10{r_MuxSel[00]}})
                        | (c_RxDataReg[10:01] & {10{r_MuxSel[01]}})
                        | (c_RxDataReg[11:02] & {10{r_MuxSel[02]}})
                        | (c_RxDataReg[12:03] & {10{r_MuxSel[03]}})
                        | (c_RxDataReg[13:04] & {10{r_MuxSel[04]}})
                        | (c_RxDataReg[14:05] & {10{r_MuxSel[05]}})
                        | (c_RxDataReg[15:06] & {10{r_MuxSel[06]}})
                        | (c_RxDataReg[16:07] & {10{r_MuxSel[07]}})
                        | (c_RxDataReg[17:08] & {10{r_MuxSel[08]}})
                        | (c_RxDataReg[18:09] & {10{r_MuxSel[09]}}) ;
    end
    
    always @(posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_RxAlignedData <= `DELAY 10'h0;
        end
        else begin
            r_RxAlignedData <= `DELAY c_RxAlignedData;
        end
    end

    ////////////////////////////////////////////////////////////////////////////
    //  RX SYNC STATE-MACHINE
    ////////////////////////////////////////////////////////////////////////////
    
    //2014-7-18 twu: disparity error is also considered as invalid (Xilinx Ug366, Cadence, 802.3 36.2.4.6)
    // When error on both High & Low Byte, err_cnt += 2
    assign c_8B10BDecErr = i_Rx8B10BNotInTable | (i_Rx8B10BDispErr & i_RxSyncIncDispErr);
    assign c_BeatInTable = ~ c_8B10BDecErr;

    //sync test counter 
    always @ (posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_syncTestValid <= `DELAY 5'h0;
        end
        else begin
            if(r_syncState==SYNC_TEST) begin
                if(c_BeatInTable) begin
                    r_syncTestValid <= `DELAY r_syncTestValid + 5'h1;
                end
            end
            else begin
                r_syncTestValid <= `DELAY 5'h0;
            end
        end
    end
    

    assign c_syncTestSucc = (i_RxSyncThres == 2'b00) ? r_syncTestValid[0] == 1'b1 :
                            (i_RxSyncThres == 2'b01) ? r_syncTestValid[1] == 1'b1 :
                            (i_RxSyncThres == 2'b10) ? r_syncTestValid[2] == 1'b1 :
                                                       r_syncTestValid[3] == 1'b1 ;
    

    //  los counter
    always @ ( * ) begin
        case(i_RxSyncInvalidIncr)
            3'h0 :      c_InvalidIncr = 8'b11111110;
            3'h1 :      c_InvalidIncr = 8'b11111100;
            3'h2 :      c_InvalidIncr = 8'b11111000;
            3'h3 :      c_InvalidIncr = 8'b11110000;
            3'h4 :      c_InvalidIncr = 8'b11100000;
            3'h5 :      c_InvalidIncr = 8'b11000000;
            3'h6 :      c_InvalidIncr = 8'b10000000;
            default :   c_InvalidIncr = 8'b00000000;
        endcase
    end
    
    always @ (*) begin
        case (i_RxSyncThreshold)
            3'h0 :      c_Threshold = 10'h004;//9'h003;
            3'h1 :      c_Threshold = 10'h008;//9'h007;
            3'h2 :      c_Threshold = 10'h010;//9'h00F;
            3'h3 :      c_Threshold = 10'h020;//9'h01F;
            3'h4 :      c_Threshold = 10'h040;//9'h03F;
            3'h5 :      c_Threshold = 10'h080;//9'h07F;
            3'h6 :      c_Threshold = 10'h100;//9'h0FF;
            default :   c_Threshold = 10'h200;//9'h1FF;
        endcase
    end
    // los counter: good count
    always @ (posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_losGoodCnt <= `DELAY 8'h0;
        end
        else begin
            if(r_syncState==SYNC_SYNC) begin
                if(c_BeatInTable) begin
                    r_losGoodCnt <= `DELAY r_losGoodCnt + 8'h1;    //+1 means: one valid characters
                end
                else begin
                    r_losGoodCnt <= `DELAY r_losGoodCnt;
                end
            end
            else begin
                r_losGoodCnt <= `DELAY 8'h0;
            end
        end
    end
    
 
    assign c_decrByOne = (r_losGoodCnt[7:0] | c_InvalidIncr) == 8'hff; //when the r_losGoodCnt== 1 3 7 15 ...
    
    
    assign c_losErrCntTop = (r_losErrCnt==c_Threshold) ;
    // los counter: err count
    always @ (posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_losErrCnt <= `DELAY 10'h0;
        end
        else begin
            if(r_syncState==SYNC_SYNC) begin
                if(c_BeatInTable) begin
                    if(c_decrByOne) begin
                        if(r_losErrCnt!=10'h0) begin
                            r_losErrCnt <= `DELAY r_losErrCnt - 10'h1;
                        end
                        else begin
                            r_losErrCnt <= `DELAY r_losErrCnt;
                        end
                    end
                    else begin
                        r_losErrCnt <= `DELAY r_losErrCnt;
                    end
                end
                else begin
                    if( !c_losErrCntTop ) begin
                        r_losErrCnt <= `DELAY r_losErrCnt + 10'h1;
                    end
                    else begin
                        r_losErrCnt <= `DELAY r_losErrCnt;
                    end 
                end
            end
            else begin
                r_losErrCnt <= `DELAY 10'b0;
            end
        end
    end
    
    always @ ( * ) begin
        case(r_syncState)
        SYNC_LOS:
            begin
                if(c_RxCALIsAligned) begin
                    c_syncStateNext = SYNC_PRE;
                end
                else begin
                    c_syncStateNext = SYNC_LOS;
                end
            end
        SYNC_PRE:
            c_syncStateNext = SYNC_TEST;
        SYNC_TEST:
            begin
                if(c_syncTestSucc & c_BeatInTable) begin
                    c_syncStateNext = SYNC_SYNC;
                end
                else if(~c_BeatInTable) begin
                    c_syncStateNext = SYNC_LOS;
                end
                else begin
                    c_syncStateNext = SYNC_TEST;
                end
            end
        SYNC_SYNC:
            begin
                if( c_losErrCntTop ) begin
                    c_syncStateNext = SYNC_LOS;
                end
                else begin
                    c_syncStateNext = SYNC_SYNC;
                end
            end
   //     default:
   //         begin
   //             c_syncStateNext = SYNC_LOS;
   //         end
        endcase
    end
    
    always @ (posedge i_Clk or negedge i_Rst_N) begin
        if(~i_Rst_N) begin
            r_syncState <= `DELAY SYNC_LOS;
        end
        else begin
            if(i_RxSyncEn & i_RxCALDetUse)
                r_syncState <= `DELAY c_syncStateNext;
            else
                r_syncState <= `DELAY SYNC_LOS;
        end
    end
    
    
    //output 
    assign o_RxAlignedData = i_RxCALDetUse ? r_RxAlignedData : i_RxData;
    assign o_RxSyncState = r_syncState;
    assign o_RxSyncLock = (r_syncState==SYNC_SYNC);

    assign o_RxCAL_DB1[6:0]  = r_losGoodCnt[6:0];
    assign o_RxCAL_DB1[15:7] = r_losErrCnt;
    assign o_RxCAL_DB2[4:0] = r_syncTestValid;
    assign o_RxCAL_DB2[5] = c_RxCALIsAligned;

endmodule
