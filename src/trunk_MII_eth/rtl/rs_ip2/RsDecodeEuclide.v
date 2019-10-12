//===================================================================
// Module Name : RsDecodeEuclide
// File Name   : RsDecodeEuclide.v
// Function    : Rs Decoder Euclide algorithm Module
// 
// Revision History:
// Date          By           Version    Change Description
//===================================================================
// 2009/02/03  Gael Sapience     1.0       Original
//
//===================================================================
// (C) COPYRIGHT 2009 SYSTEM LSI CO., Ltd.
//


module RsDecodeEuclide(
   CLK,           // system clock
   RESET,         // system reset
   enable,        // enable signal
   sync,          // sync signal
   syndrome_0,    // syndrome polynom 0
   syndrome_1,    // syndrome polynom 1
   syndrome_2,    // syndrome polynom 2
   syndrome_3,    // syndrome polynom 3
   syndrome_4,    // syndrome polynom 4
   syndrome_5,    // syndrome polynom 5
   syndrome_6,    // syndrome polynom 6
   syndrome_7,    // syndrome polynom 7
   syndrome_8,    // syndrome polynom 8
   syndrome_9,    // syndrome polynom 9
   syndrome_10,   // syndrome polynom 10
   syndrome_11,   // syndrome polynom 11
   syndrome_12,   // syndrome polynom 12
   syndrome_13,   // syndrome polynom 13
   syndrome_14,   // syndrome polynom 14
   syndrome_15,   // syndrome polynom 15
   lambda_0,      // lambda polynom 0
   lambda_1,      // lambda polynom 1
   lambda_2,      // lambda polynom 2
   lambda_3,      // lambda polynom 3
   lambda_4,      // lambda polynom 4
   lambda_5,      // lambda polynom 5
   lambda_6,      // lambda polynom 6
   lambda_7,      // lambda polynom 7
   lambda_8,      // lambda polynom 8
   omega_8,       // omega polynom 8
   omega_9,       // omega polynom 9
   omega_10,      // omega polynom 10
   omega_11,      // omega polynom 11
   omega_12,      // omega polynom 12
   omega_13,      // omega polynom 13
   omega_14,      // omega polynom 14
   omega_15,      // omega polynom 15
   numShifted,    // shift amount
   done           // done signal
);


   input          CLK;           // system clock
   input          RESET;         // system reset
   input          enable;        // enable signal
   input          sync;          // sync signal
   input  [7:0]   syndrome_0;    // syndrome polynom 0
   input  [7:0]   syndrome_1;    // syndrome polynom 1
   input  [7:0]   syndrome_2;    // syndrome polynom 2
   input  [7:0]   syndrome_3;    // syndrome polynom 3
   input  [7:0]   syndrome_4;    // syndrome polynom 4
   input  [7:0]   syndrome_5;    // syndrome polynom 5
   input  [7:0]   syndrome_6;    // syndrome polynom 6
   input  [7:0]   syndrome_7;    // syndrome polynom 7
   input  [7:0]   syndrome_8;    // syndrome polynom 8
   input  [7:0]   syndrome_9;    // syndrome polynom 9
   input  [7:0]   syndrome_10;   // syndrome polynom 10
   input  [7:0]   syndrome_11;   // syndrome polynom 11
   input  [7:0]   syndrome_12;   // syndrome polynom 12
   input  [7:0]   syndrome_13;   // syndrome polynom 13
   input  [7:0]   syndrome_14;   // syndrome polynom 14
   input  [7:0]   syndrome_15;   // syndrome polynom 15

   output [7:0]   lambda_0;       // lambda polynom 0
   output [7:0]   lambda_1;       // lambda polynom 1
   output [7:0]   lambda_2;       // lambda polynom 2
   output [7:0]   lambda_3;       // lambda polynom 3
   output [7:0]   lambda_4;       // lambda polynom 4
   output [7:0]   lambda_5;       // lambda polynom 5
   output [7:0]   lambda_6;       // lambda polynom 6
   output [7:0]   lambda_7;       // lambda polynom 7
   output [7:0]   lambda_8;       // lambda polynom 8
   output [7:0]   omega_8;        // omega polynom 8
   output [7:0]   omega_9;        // omega polynom 9
   output [7:0]   omega_10;       // omega polynom 10
   output [7:0]   omega_11;       // omega polynom 11
   output [7:0]   omega_12;       // omega polynom 12
   output [7:0]   omega_13;       // omega polynom 13
   output [7:0]   omega_14;       // omega polynom 14
   output [7:0]   omega_15;       // omega polynom 15
   output [4:0]   numShifted;     // shift amount
   output         done;           // done signal





   //------------------------------------------------------------------------
   // -registers
   //------------------------------------------------------------------------
   reg [7:0]   omegaBkp_0;
   reg [7:0]   omegaBkp_1;
   reg [7:0]   omegaBkp_2;
   reg [7:0]   omegaBkp_3;
   reg [7:0]   omegaBkp_4;
   reg [7:0]   omegaBkp_5;
   reg [7:0]   omegaBkp_6;
   reg [7:0]   omegaBkp_7;
   reg [7:0]   omegaBkp_8;
   reg [7:0]   omegaBkp_9;
   reg [7:0]   omegaBkp_10;
   reg [7:0]   omegaBkp_11;
   reg [7:0]   omegaBkp_12;
   reg [7:0]   omegaBkp_13;
   reg [7:0]   omegaBkp_14;
   reg [7:0]   omegaBkp_15;
   reg [7:0]   lambdaBkp_0;
   reg [7:0]   lambdaBkp_1;
   reg [7:0]   lambdaBkp_2;
   reg [7:0]   lambdaBkp_3;
   reg [7:0]   lambdaBkp_4;
   reg [7:0]   lambdaBkp_5;
   reg [7:0]   lambdaBkp_6;
   reg [7:0]   lambdaBkp_7;
   reg [7:0]   lambdaBkp_8;
   reg [7:0]   lambdaInner_0;
   reg [7:0]   lambdaInner_1;
   reg [7:0]   lambdaInner_2;
   reg [7:0]   lambdaInner_3;
   reg [7:0]   lambdaInner_4;
   reg [7:0]   lambdaInner_5;
   reg [7:0]   lambdaInner_6;
   reg [7:0]   lambdaInner_7;
   reg [7:0]   lambdaInner_8;
   reg [7:0]   lambdaXorReg_0;
   reg [7:0]   lambdaXorReg_1;
   reg [7:0]   lambdaXorReg_2;
   reg [7:0]   lambdaXorReg_3;
   reg [7:0]   lambdaXorReg_4;
   reg [7:0]   lambdaXorReg_5;
   reg [7:0]   lambdaXorReg_6;
   reg [7:0]   lambdaXorReg_7;
   wire [7:0]   omegaMultqNew_0;
   wire [7:0]   omegaMultqNew_1;
   wire [7:0]   omegaMultqNew_2;
   wire [7:0]   omegaMultqNew_3;
   wire [7:0]   omegaMultqNew_4;
   wire [7:0]   omegaMultqNew_5;
   wire [7:0]   omegaMultqNew_6;
   wire [7:0]   omegaMultqNew_7;
   wire [7:0]   omegaMultqNew_8;
   wire [7:0]   omegaMultqNew_9;
   wire [7:0]   omegaMultqNew_10;
   wire [7:0]   omegaMultqNew_11;
   wire [7:0]   omegaMultqNew_12;
   wire [7:0]   omegaMultqNew_13;
   wire [7:0]   omegaMultqNew_14;
   wire [7:0]   lambdaMultqNew_0;
   wire [7:0]   lambdaMultqNew_1;
   wire [7:0]   lambdaMultqNew_2;
   wire [7:0]   lambdaMultqNew_3;
   wire [7:0]   lambdaMultqNew_4;
   wire [7:0]   lambdaMultqNew_5;
   wire [7:0]   lambdaMultqNew_6;
   wire [7:0]   lambdaMultqNew_7;
   wire [7:0]   lambdaMultqNew_8;
   reg  [4:0]   offset;
   reg  [4:0]   numShiftedReg;



   //------------------------------------------------------------------------
   // + phase
   // Counters
   //------------------------------------------------------------------------
   reg     [1:0]   phase;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         phase [1:0] <= 2'd0;
      end
      else if (enable == 1'b1) begin
         if (sync == 1'b1) begin
            phase [1:0] <= 2'd1;
         end
         else if (phase [1:0] == 2'd2) begin
            phase [1:0] <= 2'd0;
         end
         else begin
            phase [1:0] <= phase [1:0] + 2'd1;
         end
      end
   end



   //------------------------------------------------------------------------
   // + count
   //- Counter
   //------------------------------------------------------------------------
   reg     [5:0]   count;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         count [5:0] <= 6'd0;
      end
      else if (enable == 1'b1) begin
         if (sync == 1'b1) begin
            count [5:0] <= 6'd1;
         end
         else if ( (count [5:0]==6'd0) ||  (count [5:0]==6'd51) ) begin
            count [5:0] <= 6'd0;
         end
         else begin
            count [5:0] <=  count [5:0] + 6'd1;
         end
      end
   end



   //------------------------------------------------------------------
   // + skip
   //------------------------------------------------------------------
   reg [7:0]   omegaInner_0;
   reg [7:0]   omegaInner_1;
   reg [7:0]   omegaInner_2;
   reg [7:0]   omegaInner_3;
   reg [7:0]   omegaInner_4;
   reg [7:0]   omegaInner_5;
   reg [7:0]   omegaInner_6;
   reg [7:0]   omegaInner_7;
   reg [7:0]   omegaInner_8;
   reg [7:0]   omegaInner_9;
   reg [7:0]   omegaInner_10;
   reg [7:0]   omegaInner_11;
   reg [7:0]   omegaInner_12;
   reg [7:0]   omegaInner_13;
   reg [7:0]   omegaInner_14;
   reg [7:0]   omegaInner_15;
   reg         skip;

   always @(omegaInner_15) begin
      if (omegaInner_15 [7:0] == 8'd0) begin
         skip   = 1'b1;
      end else begin
         skip   = 1'b0;
      end
   end


   //------------------------------------------------------------------------
   // + done
   //------------------------------------------------------------------------
   reg         done;
   always @(count) begin
      if (count[5:0] == 6'd51) begin
         done = 1'b1;
      end
      else begin
         done = 1'b0;
      end
   end


   //------------------------------------------------------------------
   // + enable_E
   //------------------------------------------------------------------
   reg          enable_E;
   always @(enable) begin
      enable_E   = enable;
   end


   //------------------------------------------------------------------------
   // Get Partial Q
   //------------------------------------------------------------------------
   wire   [7:0]   omegaInv;
   reg    [7:0]   omegaInvReg;
   wire   [7:0]   qNew;
   reg    [7:0]   qNewReg;
   reg    [7:0]   omegaBkpReg;

   RsDecodeInv RsDecodeInv_Q (.B(omegaInner_15[7:0]), .R(omegaInv[7:0]));
   RsDecodeMult RsDecodeMult_Q (.A(omegaBkpReg[7:0]), .B(omegaInvReg[7:0]), .P(qNew[7:0]) );


   //------------------------------------------------------------------
   // + omegaInvReg
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         omegaInvReg   <= 8'd0;
      end
      else if (enable == 1'b1) begin
         omegaInvReg   <= omegaInv;
      end
   end


   //------------------------------------------------------------------
   // + omegaBkpReg
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         omegaBkpReg   <= 8'd0;
      end
      else if (enable == 1'b1) begin
         omegaBkpReg   <= omegaBkp_15[7:0];
      end
   end


   //------------------------------------------------------------------
   // + qNewReg
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         qNewReg   <= 8'd0;
      end
      else if (enable == 1'b1) begin
         qNewReg   <= qNew;
      end
   end


   //------------------------------------------------------------------------
   // + omegaMultqNew_0,..., omegaMultqNew_18
   //- QT = qNewReg * omegaInner
   //- Multipliers
   //------------------------------------------------------------------------
   RsDecodeMult   RsDecodeMult_PDIV0 (.A(qNewReg[7:0]), .B(omegaInner_0[7:0]), .P(omegaMultqNew_0[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV1 (.A(qNewReg[7:0]), .B(omegaInner_1[7:0]), .P(omegaMultqNew_1[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV2 (.A(qNewReg[7:0]), .B(omegaInner_2[7:0]), .P(omegaMultqNew_2[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV3 (.A(qNewReg[7:0]), .B(omegaInner_3[7:0]), .P(omegaMultqNew_3[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV4 (.A(qNewReg[7:0]), .B(omegaInner_4[7:0]), .P(omegaMultqNew_4[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV5 (.A(qNewReg[7:0]), .B(omegaInner_5[7:0]), .P(omegaMultqNew_5[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV6 (.A(qNewReg[7:0]), .B(omegaInner_6[7:0]), .P(omegaMultqNew_6[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV7 (.A(qNewReg[7:0]), .B(omegaInner_7[7:0]), .P(omegaMultqNew_7[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV8 (.A(qNewReg[7:0]), .B(omegaInner_8[7:0]), .P(omegaMultqNew_8[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV9 (.A(qNewReg[7:0]), .B(omegaInner_9[7:0]), .P(omegaMultqNew_9[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV10 (.A(qNewReg[7:0]), .B(omegaInner_10[7:0]), .P(omegaMultqNew_10[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV11 (.A(qNewReg[7:0]), .B(omegaInner_11[7:0]), .P(omegaMultqNew_11[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV12 (.A(qNewReg[7:0]), .B(omegaInner_12[7:0]), .P(omegaMultqNew_12[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV13 (.A(qNewReg[7:0]), .B(omegaInner_13[7:0]), .P(omegaMultqNew_13[7:0]) );
   RsDecodeMult   RsDecodeMult_PDIV14 (.A(qNewReg[7:0]), .B(omegaInner_14[7:0]), .P(omegaMultqNew_14[7:0]) );


   //------------------------------------------------------------------------
   // + lambdaMultqNew_0, ..., QA_19
   //- QA22 = qNewReg * lambdaInner
   //- Multipliers
   //------------------------------------------------------------------------
   RsDecodeMult   RsDecodeMult_PMUL0 (.A(qNewReg[7:0]), .B(lambdaInner_0[7:0]), .P(lambdaMultqNew_0[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL1 (.A(qNewReg[7:0]), .B(lambdaInner_1[7:0]), .P(lambdaMultqNew_1[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL2 (.A(qNewReg[7:0]), .B(lambdaInner_2[7:0]), .P(lambdaMultqNew_2[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL3 (.A(qNewReg[7:0]), .B(lambdaInner_3[7:0]), .P(lambdaMultqNew_3[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL4 (.A(qNewReg[7:0]), .B(lambdaInner_4[7:0]), .P(lambdaMultqNew_4[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL5 (.A(qNewReg[7:0]), .B(lambdaInner_5[7:0]), .P(lambdaMultqNew_5[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL6 (.A(qNewReg[7:0]), .B(lambdaInner_6[7:0]), .P(lambdaMultqNew_6[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL7 (.A(qNewReg[7:0]), .B(lambdaInner_7[7:0]), .P(lambdaMultqNew_7[7:0]) );
   RsDecodeMult   RsDecodeMult_PMUL8 (.A(qNewReg[7:0]), .B(lambdaInner_8[7:0]), .P(lambdaMultqNew_8[7:0]) );


   //------------------------------------------------------------------------
   // + omegaBkp_0, ..., omegaBkp_19
   //- Registers
   //------------------------------------------------------------------------
      always @(posedge CLK or negedge RESET) begin
         if (~RESET) begin
            omegaBkp_0 [7:0]   <= 8'd0;
            omegaBkp_1 [7:0]   <= 8'd0;
            omegaBkp_2 [7:0]   <= 8'd0;
            omegaBkp_3 [7:0]   <= 8'd0;
            omegaBkp_4 [7:0]   <= 8'd0;
            omegaBkp_5 [7:0]   <= 8'd0;
            omegaBkp_6 [7:0]   <= 8'd0;
            omegaBkp_7 [7:0]   <= 8'd0;
            omegaBkp_8 [7:0]   <= 8'd0;
            omegaBkp_9 [7:0]   <= 8'd0;
            omegaBkp_10 [7:0]  <= 8'd0;
            omegaBkp_11 [7:0]  <= 8'd0;
            omegaBkp_12 [7:0]  <= 8'd0;
            omegaBkp_13 [7:0]  <= 8'd0;
            omegaBkp_14 [7:0]  <= 8'd0;
            omegaBkp_15 [7:0]  <= 8'd0;
         end
         else if (enable_E == 1'b1) begin
            if (sync == 1'b1) begin
                omegaBkp_0 [7:0]   <= 8'd0;
                omegaBkp_1 [7:0]   <= 8'd0;
                omegaBkp_2 [7:0]   <= 8'd0;
                omegaBkp_3 [7:0]   <= 8'd0;
                omegaBkp_4 [7:0]   <= 8'd0;
                omegaBkp_5 [7:0]   <= 8'd0;
                omegaBkp_6 [7:0]   <= 8'd0;
                omegaBkp_7 [7:0]   <= 8'd0;
                omegaBkp_8 [7:0]   <= 8'd0;
                omegaBkp_9 [7:0]   <= 8'd0;
                omegaBkp_10 [7:0]  <= 8'd0;
                omegaBkp_11 [7:0]  <= 8'd0;
                omegaBkp_12 [7:0]  <= 8'd0;
                omegaBkp_13 [7:0]  <= 8'd0;
                omegaBkp_14 [7:0]  <= 8'd0;
                omegaBkp_15[7:0]   <= 8'd1;
            end
            else if (phase[1:0] == 2'b00) begin
               if ((skip== 1'b0) && (offset == 5'd0)) begin
                  omegaBkp_0 [7:0]   <= omegaInner_0[7:0];
                  omegaBkp_1 [7:0]   <= omegaInner_1[7:0];
                  omegaBkp_2 [7:0]   <= omegaInner_2[7:0];
                  omegaBkp_3 [7:0]   <= omegaInner_3[7:0];
                  omegaBkp_4 [7:0]   <= omegaInner_4[7:0];
                  omegaBkp_5 [7:0]   <= omegaInner_5[7:0];
                  omegaBkp_6 [7:0]   <= omegaInner_6[7:0];
                  omegaBkp_7 [7:0]   <= omegaInner_7[7:0];
                  omegaBkp_8 [7:0]   <= omegaInner_8[7:0];
                  omegaBkp_9 [7:0]   <= omegaInner_9[7:0];
                  omegaBkp_10 [7:0]  <= omegaInner_10[7:0];
                  omegaBkp_11 [7:0]  <= omegaInner_11[7:0];
                  omegaBkp_12 [7:0]  <= omegaInner_12[7:0];
                  omegaBkp_13 [7:0]  <= omegaInner_13[7:0];
                  omegaBkp_14 [7:0]  <= omegaInner_14[7:0];
                  omegaBkp_15 [7:0]  <= omegaInner_15[7:0];
               end
               else if (skip== 1'b0) begin
                  omegaBkp_0 [7:0]   <= 8'd0;
                  omegaBkp_1 [7:0]   <= omegaMultqNew_0[7:0] ^ omegaBkp_0[7:0];
                  omegaBkp_2 [7:0]   <= omegaMultqNew_1[7:0] ^ omegaBkp_1[7:0];
                  omegaBkp_3 [7:0]   <= omegaMultqNew_2[7:0] ^ omegaBkp_2[7:0];
                  omegaBkp_4 [7:0]   <= omegaMultqNew_3[7:0] ^ omegaBkp_3[7:0];
                  omegaBkp_5 [7:0]   <= omegaMultqNew_4[7:0] ^ omegaBkp_4[7:0];
                  omegaBkp_6 [7:0]   <= omegaMultqNew_5[7:0] ^ omegaBkp_5[7:0];
                  omegaBkp_7 [7:0]   <= omegaMultqNew_6[7:0] ^ omegaBkp_6[7:0];
                  omegaBkp_8 [7:0]   <= omegaMultqNew_7[7:0] ^ omegaBkp_7[7:0];
                  omegaBkp_9 [7:0]   <= omegaMultqNew_8[7:0] ^ omegaBkp_8[7:0];
                  omegaBkp_10 [7:0]  <= omegaMultqNew_9[7:0] ^ omegaBkp_9[7:0];
                  omegaBkp_11 [7:0]  <= omegaMultqNew_10[7:0] ^ omegaBkp_10[7:0];
                  omegaBkp_12 [7:0]  <= omegaMultqNew_11[7:0] ^ omegaBkp_11[7:0];
                  omegaBkp_13 [7:0]  <= omegaMultqNew_12[7:0] ^ omegaBkp_12[7:0];
                  omegaBkp_14 [7:0]  <= omegaMultqNew_13[7:0] ^ omegaBkp_13[7:0];
                  omegaBkp_15 [7:0]  <= omegaMultqNew_14[7:0] ^ omegaBkp_14[7:0];
               end
            end
         end
      end


   //------------------------------------------------------------------
   // +omegaInner
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         omegaInner_0 [7:0]  <= 8'd0;
         omegaInner_1 [7:0]  <= 8'd0;
         omegaInner_2 [7:0]  <= 8'd0;
         omegaInner_3 [7:0]  <= 8'd0;
         omegaInner_4 [7:0]  <= 8'd0;
         omegaInner_5 [7:0]  <= 8'd0;
         omegaInner_6 [7:0]  <= 8'd0;
         omegaInner_7 [7:0]  <= 8'd0;
         omegaInner_8 [7:0]  <= 8'd0;
         omegaInner_9 [7:0]  <= 8'd0;
         omegaInner_10 [7:0] <= 8'd0;
         omegaInner_11 [7:0] <= 8'd0;
         omegaInner_12 [7:0] <= 8'd0;
         omegaInner_13 [7:0] <= 8'd0;
         omegaInner_14 [7:0] <= 8'd0;
         omegaInner_15 [7:0] <= 8'd0;
      end
      else if (enable_E == 1'b1) begin
         if (sync == 1'b1) begin
            omegaInner_0 [7:0]  <= syndrome_0[7:0];
            omegaInner_1 [7:0]  <= syndrome_1[7:0];
            omegaInner_2 [7:0]  <= syndrome_2[7:0];
            omegaInner_3 [7:0]  <= syndrome_3[7:0];
            omegaInner_4 [7:0]  <= syndrome_4[7:0];
            omegaInner_5 [7:0]  <= syndrome_5[7:0];
            omegaInner_6 [7:0]  <= syndrome_6[7:0];
            omegaInner_7 [7:0]  <= syndrome_7[7:0];
            omegaInner_8 [7:0]  <= syndrome_8[7:0];
            omegaInner_9 [7:0]  <= syndrome_9[7:0];
            omegaInner_10 [7:0] <= syndrome_10[7:0];
            omegaInner_11 [7:0] <= syndrome_11[7:0];
            omegaInner_12 [7:0] <= syndrome_12[7:0];
            omegaInner_13 [7:0] <= syndrome_13[7:0];
            omegaInner_14 [7:0] <= syndrome_14[7:0];
            omegaInner_15 [7:0] <= syndrome_15[7:0];
         end
         else if (phase == 2'b00) begin
            if ((skip == 1'b0) && (offset == 5'd0)) begin
               omegaInner_0 [7:0]  <= 8'd0;
               omegaInner_1 [7:0]  <= omegaMultqNew_0 [7:0] ^ omegaBkp_0 [7:0];
               omegaInner_2 [7:0]  <= omegaMultqNew_1 [7:0] ^ omegaBkp_1 [7:0];
               omegaInner_3 [7:0]  <= omegaMultqNew_2 [7:0] ^ omegaBkp_2 [7:0];
               omegaInner_4 [7:0]  <= omegaMultqNew_3 [7:0] ^ omegaBkp_3 [7:0];
               omegaInner_5 [7:0]  <= omegaMultqNew_4 [7:0] ^ omegaBkp_4 [7:0];
               omegaInner_6 [7:0]  <= omegaMultqNew_5 [7:0] ^ omegaBkp_5 [7:0];
               omegaInner_7 [7:0]  <= omegaMultqNew_6 [7:0] ^ omegaBkp_6 [7:0];
               omegaInner_8 [7:0]  <= omegaMultqNew_7 [7:0] ^ omegaBkp_7 [7:0];
               omegaInner_9 [7:0]  <= omegaMultqNew_8 [7:0] ^ omegaBkp_8 [7:0];
               omegaInner_10 [7:0] <= omegaMultqNew_9 [7:0] ^ omegaBkp_9 [7:0];
               omegaInner_11 [7:0] <= omegaMultqNew_10 [7:0] ^ omegaBkp_10 [7:0];
               omegaInner_12 [7:0] <= omegaMultqNew_11 [7:0] ^ omegaBkp_11 [7:0];
               omegaInner_13 [7:0] <= omegaMultqNew_12 [7:0] ^ omegaBkp_12 [7:0];
               omegaInner_14 [7:0] <= omegaMultqNew_13 [7:0] ^ omegaBkp_13 [7:0];
               omegaInner_15 [7:0] <= omegaMultqNew_14 [7:0] ^ omegaBkp_14 [7:0];
            end
            else if (skip == 1'b1) begin
               omegaInner_0 [7:0]  <= 8'd0;
               omegaInner_1 [7:0]  <= omegaInner_0 [7:0];
               omegaInner_2 [7:0]  <= omegaInner_1 [7:0];
               omegaInner_3 [7:0]  <= omegaInner_2 [7:0];
               omegaInner_4 [7:0]  <= omegaInner_3 [7:0];
               omegaInner_5 [7:0]  <= omegaInner_4 [7:0];
               omegaInner_6 [7:0]  <= omegaInner_5 [7:0];
               omegaInner_7 [7:0]  <= omegaInner_6 [7:0];
               omegaInner_8 [7:0]  <= omegaInner_7 [7:0];
               omegaInner_9 [7:0]  <= omegaInner_8 [7:0];
               omegaInner_10 [7:0] <= omegaInner_9 [7:0];
               omegaInner_11 [7:0] <= omegaInner_10 [7:0];
               omegaInner_12 [7:0] <= omegaInner_11 [7:0];
               omegaInner_13 [7:0] <= omegaInner_12 [7:0];
               omegaInner_14 [7:0] <= omegaInner_13 [7:0];
               omegaInner_15 [7:0] <= omegaInner_14 [7:0];
            end
         end
      end
   end


   //------------------------------------------------------------------
   // + lambdaBkp_0,..,lambdaBkp_15
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         lambdaBkp_0 [7:0]   <= 8'd0;
         lambdaBkp_1 [7:0]   <= 8'd0;
         lambdaBkp_2 [7:0]   <= 8'd0;
         lambdaBkp_3 [7:0]   <= 8'd0;
         lambdaBkp_4 [7:0]   <= 8'd0;
         lambdaBkp_5 [7:0]   <= 8'd0;
         lambdaBkp_6 [7:0]   <= 8'd0;
         lambdaBkp_7 [7:0]   <= 8'd0;
         lambdaBkp_8 [7:0]   <= 8'd0;
      end
      else if (enable_E == 1'b1) begin
         if (sync == 1'b1) begin
            lambdaBkp_0 [7:0]  <= 8'd0;
            lambdaBkp_1 [7:0]  <= 8'd0;
            lambdaBkp_2 [7:0]  <= 8'd0;
            lambdaBkp_3 [7:0]  <= 8'd0;
            lambdaBkp_4 [7:0]  <= 8'd0;
            lambdaBkp_5 [7:0]  <= 8'd0;
            lambdaBkp_6 [7:0]  <= 8'd0;
            lambdaBkp_7 [7:0]  <= 8'd0;
            lambdaBkp_8 [7:0]  <= 8'd0;
         end
         else if ((phase == 2'b00) && (skip == 1'b0) && (offset == 5'd0)) begin
            lambdaBkp_0 [7:0]  <= lambdaInner_0[7:0];
            lambdaBkp_1 [7:0]  <= lambdaInner_1[7:0];
            lambdaBkp_2 [7:0]  <= lambdaInner_2[7:0];
            lambdaBkp_3 [7:0]  <= lambdaInner_3[7:0];
            lambdaBkp_4 [7:0]  <= lambdaInner_4[7:0];
            lambdaBkp_5 [7:0]  <= lambdaInner_5[7:0];
            lambdaBkp_6 [7:0]  <= lambdaInner_6[7:0];
            lambdaBkp_7 [7:0]  <= lambdaInner_7[7:0];
            lambdaBkp_8 [7:0]  <= lambdaInner_8[7:0];
         end
      end
   end


   //------------------------------------------------------------------
   // + lambdaInner_0, lambdaInner_15
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         lambdaInner_0 [7:0]  <= 8'd0;
         lambdaInner_1 [7:0]  <= 8'd0;
         lambdaInner_2 [7:0]  <= 8'd0;
         lambdaInner_3 [7:0]  <= 8'd0;
         lambdaInner_4 [7:0]  <= 8'd0;
         lambdaInner_5 [7:0]  <= 8'd0;
         lambdaInner_6 [7:0]  <= 8'd0;
         lambdaInner_7 [7:0]  <= 8'd0;
         lambdaInner_8 [7:0]  <= 8'd0;
      end
      else if (enable_E == 1'b1) begin
         if (sync == 1'b1) begin
            lambdaInner_0 [7:0]  <= 8'd1;
            lambdaInner_1 [7:0]  <= 8'd0;
            lambdaInner_2 [7:0]  <= 8'd0;
            lambdaInner_3 [7:0]  <= 8'd0;
            lambdaInner_4 [7:0]  <= 8'd0;
            lambdaInner_5 [7:0]  <= 8'd0;
            lambdaInner_6 [7:0]  <= 8'd0;
            lambdaInner_7 [7:0]  <= 8'd0;
            lambdaInner_8 [7:0]  <= 8'd0;
         end
         else if ((phase[1:0] == 2'b00) && (skip == 1'b0) && (offset== 5'd0)) begin
            lambdaInner_0 [7:0]  <= lambdaBkp_0 [7:0] ^ lambdaMultqNew_0 [7:0];
            lambdaInner_1 [7:0]  <= lambdaBkp_1 [7:0] ^ lambdaMultqNew_1 [7:0] ^ lambdaXorReg_0 [7:0];
            lambdaInner_2 [7:0]  <= lambdaBkp_2 [7:0] ^ lambdaMultqNew_2 [7:0] ^ lambdaXorReg_1 [7:0];
            lambdaInner_3 [7:0]  <= lambdaBkp_3 [7:0] ^ lambdaMultqNew_3 [7:0] ^ lambdaXorReg_2 [7:0];
            lambdaInner_4 [7:0]  <= lambdaBkp_4 [7:0] ^ lambdaMultqNew_4 [7:0] ^ lambdaXorReg_3 [7:0];
            lambdaInner_5 [7:0]  <= lambdaBkp_5 [7:0] ^ lambdaMultqNew_5 [7:0] ^ lambdaXorReg_4 [7:0];
            lambdaInner_6 [7:0]  <= lambdaBkp_6 [7:0] ^ lambdaMultqNew_6 [7:0] ^ lambdaXorReg_5 [7:0];
            lambdaInner_7 [7:0]  <= lambdaBkp_7 [7:0] ^ lambdaMultqNew_7 [7:0] ^ lambdaXorReg_6 [7:0];
            lambdaInner_8 [7:0]  <= lambdaBkp_8 [7:0] ^ lambdaMultqNew_8 [7:0] ^ lambdaXorReg_7 [7:0];
         end
      end
   end


   //------------------------------------------------------------------
   // + lambdaXorReg_0,..., lambdaXorReg_16
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         lambdaXorReg_0 [7:0]  <= 8'd0;
         lambdaXorReg_1 [7:0]  <= 8'd0;
         lambdaXorReg_2 [7:0]  <= 8'd0;
         lambdaXorReg_3 [7:0]  <= 8'd0;
         lambdaXorReg_4 [7:0]  <= 8'd0;
         lambdaXorReg_5 [7:0]  <= 8'd0;
         lambdaXorReg_6 [7:0]  <= 8'd0;
         lambdaXorReg_7 [7:0]  <= 8'd0;
      end
      else if (enable_E == 1'b1) begin
         if (sync == 1'b1) begin
            lambdaXorReg_0 [7:0]  <= 8'd0;
            lambdaXorReg_1 [7:0]  <= 8'd0;
            lambdaXorReg_2 [7:0]  <= 8'd0;
            lambdaXorReg_3 [7:0]  <= 8'd0;
            lambdaXorReg_4 [7:0]  <= 8'd0;
            lambdaXorReg_5 [7:0]  <= 8'd0;
            lambdaXorReg_6 [7:0]  <= 8'd0;
            lambdaXorReg_7 [7:0]  <= 8'd0;
         end
         else if (phase == 2'b00) begin
            if ((skip == 1'b0) && (offset == 5'd0)) begin
               lambdaXorReg_0 [7:0]  <= 8'd0;
               lambdaXorReg_1 [7:0]  <= 8'd0;
               lambdaXorReg_2 [7:0]  <= 8'd0;
               lambdaXorReg_3 [7:0]  <= 8'd0;
               lambdaXorReg_4 [7:0]  <= 8'd0;
               lambdaXorReg_5 [7:0]  <= 8'd0;
               lambdaXorReg_6 [7:0]  <= 8'd0;
               lambdaXorReg_7 [7:0]  <= 8'd0;
            end
            else if (skip == 1'b0) begin
               lambdaXorReg_0 [7:0]  <= lambdaMultqNew_0 [7:0];
               lambdaXorReg_1 [7:0]  <= lambdaMultqNew_1 [7:0] ^ lambdaXorReg_0[7:0];
               lambdaXorReg_2 [7:0]  <= lambdaMultqNew_2 [7:0] ^ lambdaXorReg_1[7:0];
               lambdaXorReg_3 [7:0]  <= lambdaMultqNew_3 [7:0] ^ lambdaXorReg_2[7:0];
               lambdaXorReg_4 [7:0]  <= lambdaMultqNew_4 [7:0] ^ lambdaXorReg_3[7:0];
               lambdaXorReg_5 [7:0]  <= lambdaMultqNew_5 [7:0] ^ lambdaXorReg_4[7:0];
               lambdaXorReg_6 [7:0]  <= lambdaMultqNew_6 [7:0] ^ lambdaXorReg_5[7:0];
               lambdaXorReg_7 [7:0]  <= lambdaMultqNew_7 [7:0] ^ lambdaXorReg_6[7:0];
            end
         end
      end
   end


   //------------------------------------------------------------------
   // + offset
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         offset [4:0] <= 5'd0;
      end
      else if (enable_E == 1'b1) begin
         if (sync == 1'b1) begin
            offset [4:0] <= 5'd1;
         end
         else if (phase [1:0] == 2'b00) begin
            if ((skip == 1'b0) && (offset[4:0]==5'd0)) begin
               offset [4:0] <= 5'd1;
            end
            else if (skip == 1'b1) begin
               offset [4:0] <= offset [4:0] + 5'd1;
            end
            else begin
               offset [4:0] <= offset [4:0] - 5'd1;
            end
         end
      end
   end


   //------------------------------------------------------------------
   // + numShiftedReg
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         numShiftedReg   [4:0] <= 5'd0;
      end
      else if (enable_E == 1'b1) begin
         if (sync == 1'b1) begin
            numShiftedReg   <= 5'd0;
         end
         else if (phase == 2'd0) begin
            if ((skip == 1'b0) && (offset == 5'd0)) begin
               numShiftedReg   <= numShiftedReg + 5'd1;
            end
            else if (skip == 1'b1) begin
               numShiftedReg   <= numShiftedReg + 5'd1;
            end
         end
      end
   end


   //------------------------------------------------------------------------
   //- OutputPorts
   //------------------------------------------------------------------------
   assign lambda_0 [7:0]  = lambdaInner_0 [7:0];
   assign lambda_1 [7:0]  = lambdaInner_1 [7:0];
   assign lambda_2 [7:0]  = lambdaInner_2 [7:0];
   assign lambda_3 [7:0]  = lambdaInner_3 [7:0];
   assign lambda_4 [7:0]  = lambdaInner_4 [7:0];
   assign lambda_5 [7:0]  = lambdaInner_5 [7:0];
   assign lambda_6 [7:0]  = lambdaInner_6 [7:0];
   assign lambda_7 [7:0]  = lambdaInner_7 [7:0];
   assign lambda_8 [7:0]  = lambdaInner_8 [7:0];

   assign omega_8 [7:0]  = omegaInner_8 [7:0];
   assign omega_9 [7:0]  = omegaInner_9 [7:0];
   assign omega_10 [7:0] = omegaInner_10 [7:0];
   assign omega_11 [7:0] = omegaInner_11 [7:0];
   assign omega_12 [7:0] = omegaInner_12 [7:0];
   assign omega_13 [7:0] = omegaInner_13 [7:0];
   assign omega_14 [7:0] = omegaInner_14 [7:0];
   assign omega_15 [7:0] = omegaInner_15 [7:0];
   assign numShifted     = numShiftedReg;


endmodule
