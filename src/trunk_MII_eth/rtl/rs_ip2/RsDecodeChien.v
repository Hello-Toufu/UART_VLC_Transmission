//===================================================================
// Module Name : RsDecodeChien
// File Name   : RsDecodeChien.v
// Function    : Rs Decoder Chien search algorithm Module
// 
// Revision History:
// Date          By           Version    Change Description
//===================================================================
// 2009/02/03  Gael Sapience     1.0       Original
//
//===================================================================
// (C) COPYRIGHT 2009 SYSTEM LSI CO., Ltd.
//


module RsDecodeChien(
   CLK,            // system clock
   RESET,          // system reset
   enable,         // enable signal
   sync,           // sync signal
   lambdaIn_0,     // lambda polynom 0
   lambdaIn_1,     // lambda polynom 1
   lambdaIn_2,     // lambda polynom 2
   lambdaIn_3,     // lambda polynom 3
   lambdaIn_4,     // lambda polynom 4
   lambdaIn_5,     // lambda polynom 5
   lambdaIn_6,     // lambda polynom 6
   lambdaIn_7,     // lambda polynom 7
   lambdaIn_8,     // lambda polynom 8
   omegaIn_0,      // omega polynom 0
   omegaIn_1,      // omega polynom 1
   omegaIn_2,      // omega polynom 2
   omegaIn_3,      // omega polynom 3
   omegaIn_4,      // omega polynom 4
   omegaIn_5,      // omega polynom 5
   omegaIn_6,      // omega polynom 6
   omegaIn_7,      // omega polynom 7
   errorOut,       // error output
   numError,       // error amount
   done            // done signal
);


   input          CLK;            // system clock
   input          RESET;          // system reset
   input          enable;         // enable signal
   input          sync;           // sync signal
   input  [7:0]   lambdaIn_0;     // lambda polynom 0
   input  [7:0]   lambdaIn_1;     // lambda polynom 1
   input  [7:0]   lambdaIn_2;     // lambda polynom 2
   input  [7:0]   lambdaIn_3;     // lambda polynom 3
   input  [7:0]   lambdaIn_4;     // lambda polynom 4
   input  [7:0]   lambdaIn_5;     // lambda polynom 5
   input  [7:0]   lambdaIn_6;     // lambda polynom 6
   input  [7:0]   lambdaIn_7;     // lambda polynom 7
   input  [7:0]   lambdaIn_8;     // lambda polynom 8
   input  [7:0]   omegaIn_0;      // omega polynom 0
   input  [7:0]   omegaIn_1;      // omega polynom 1
   input  [7:0]   omegaIn_2;      // omega polynom 2
   input  [7:0]   omegaIn_3;      // omega polynom 3
   input  [7:0]   omegaIn_4;      // omega polynom 4
   input  [7:0]   omegaIn_5;      // omega polynom 5
   input  [7:0]   omegaIn_6;      // omega polynom 6
   input  [7:0]   omegaIn_7;      // omega polynom 7

   output [7:0]   errorOut;       // error output
   output [4:0]   numError;       // error amount
   output         done;           // done signal



   //------------------------------------------------------------------------
   // + 
   //- registers
   //------------------------------------------------------------------------
   reg  [7:0]   lambdaEven;
   reg  [7:0]   lambdaEvenReg;
   reg  [7:0]   lambdaEvenReg2;
   reg  [7:0]   lambdaEvenReg3;
   reg  [7:0]   lambdaOdd;
   reg  [7:0]   lambdaOddReg;
   reg  [7:0]   lambdaOddReg2;
   reg  [7:0]   lambdaOddReg3;
   wire [7:0]   denomE0;
   reg  [7:0]   denomE0Reg;
   wire [7:0]   denomE0Inv;
   reg  [7:0]   denomE0InvReg;
   reg  [7:0]   omegaSum;
   reg  [7:0]   omegaSumReg;
   reg  [7:0]   numeReg;
   reg  [7:0]   numeReg2;
   wire [7:0]   errorValueE0;
   reg  [7:0]   count;
   reg          doneOrg;





   //------------------------------------------------------------------
   // + count
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         count [7:0] <= 8'd0;
      end
      else if (enable == 1'b1) begin
         if (sync == 1'b1) begin
            count[7:0] <= 8'd1;
         end
         else if ((count[7:0] ==8'd0) || (count[7:0] ==8'd208)) begin
            count[7:0] <= 8'd0;
         end
         else begin
            count[7:0] <= count[7:0] + 8'd1;
         end
      end
   end



   //------------------------------------------------------------------
   // + doneOrg
   //------------------------------------------------------------------
   always @(count) begin
      if (count[7:0] == 8'd208) begin
         doneOrg   = 1'b1;
      end else begin
         doneOrg   = 1'b0;
      end
   end

   assign   done   = doneOrg;



   //------------------------------------------------------------------------
   //- lambdaIni
   //------------------------------------------------------------------------
   wire [7:0]   lambdaIni_0;
   wire [7:0]   lambdaIni_1;
   wire [7:0]   lambdaIni_2;
   wire [7:0]   lambdaIni_3;
   wire [7:0]   lambdaIni_4;
   wire [7:0]   lambdaIni_5;
   wire [7:0]   lambdaIni_6;
   wire [7:0]   lambdaIni_7;
   wire [7:0]   lambdaIni_8;


   assign lambdaIni_0 [0] = lambdaIn_0[0];
   assign lambdaIni_0 [1] = lambdaIn_0[1];
   assign lambdaIni_0 [2] = lambdaIn_0[2];
   assign lambdaIni_0 [3] = lambdaIn_0[3];
   assign lambdaIni_0 [4] = lambdaIn_0[4];
   assign lambdaIni_0 [5] = lambdaIn_0[5];
   assign lambdaIni_0 [6] = lambdaIn_0[6];
   assign lambdaIni_0 [7] = lambdaIn_0[7];
   assign lambdaIni_1 [0] = lambdaIn_1[1] ^ lambdaIn_1[5];
   assign lambdaIni_1 [1] = lambdaIn_1[0] ^ lambdaIn_1[1] ^ lambdaIn_1[2] ^ lambdaIn_1[5] ^ lambdaIn_1[6];
   assign lambdaIni_1 [2] = lambdaIn_1[0] ^ lambdaIn_1[2] ^ lambdaIn_1[3] ^ lambdaIn_1[5] ^ lambdaIn_1[6] ^ lambdaIn_1[7];
   assign lambdaIni_1 [3] = lambdaIn_1[0] ^ lambdaIn_1[1] ^ lambdaIn_1[3] ^ lambdaIn_1[4] ^ lambdaIn_1[6] ^ lambdaIn_1[7];
   assign lambdaIni_1 [4] = lambdaIn_1[1] ^ lambdaIn_1[2] ^ lambdaIn_1[4] ^ lambdaIn_1[5] ^ lambdaIn_1[7];
   assign lambdaIni_1 [5] = lambdaIn_1[2] ^ lambdaIn_1[3] ^ lambdaIn_1[5] ^ lambdaIn_1[6];
   assign lambdaIni_1 [6] = lambdaIn_1[0] ^ lambdaIn_1[3] ^ lambdaIn_1[4] ^ lambdaIn_1[6] ^ lambdaIn_1[7];
   assign lambdaIni_1 [7] = lambdaIn_1[0] ^ lambdaIn_1[4] ^ lambdaIn_1[7];
   assign lambdaIni_2 [0] = lambdaIn_2[0] ^ lambdaIn_2[1] ^ lambdaIn_2[3];
   assign lambdaIni_2 [1] = lambdaIn_2[0] ^ lambdaIn_2[2] ^ lambdaIn_2[3] ^ lambdaIn_2[4];
   assign lambdaIni_2 [2] = lambdaIn_2[4] ^ lambdaIn_2[5];
   assign lambdaIni_2 [3] = lambdaIn_2[5] ^ lambdaIn_2[6];
   assign lambdaIni_2 [4] = lambdaIn_2[0] ^ lambdaIn_2[6] ^ lambdaIn_2[7];
   assign lambdaIni_2 [5] = lambdaIn_2[0] ^ lambdaIn_2[1] ^ lambdaIn_2[7];
   assign lambdaIni_2 [6] = lambdaIn_2[0] ^ lambdaIn_2[1] ^ lambdaIn_2[2];
   assign lambdaIni_2 [7] = lambdaIn_2[0] ^ lambdaIn_2[2];
   assign lambdaIni_3 [0] = lambdaIn_3[1] ^ lambdaIn_3[2] ^ lambdaIn_3[3] ^ lambdaIn_3[4] ^ lambdaIn_3[7];
   assign lambdaIni_3 [1] = lambdaIn_3[1] ^ lambdaIn_3[5] ^ lambdaIn_3[7];
   assign lambdaIni_3 [2] = lambdaIn_3[1] ^ lambdaIn_3[3] ^ lambdaIn_3[4] ^ lambdaIn_3[6] ^ lambdaIn_3[7];
   assign lambdaIni_3 [3] = lambdaIn_3[0] ^ lambdaIn_3[2] ^ lambdaIn_3[4] ^ lambdaIn_3[5] ^ lambdaIn_3[7];
   assign lambdaIni_3 [4] = lambdaIn_3[1] ^ lambdaIn_3[3] ^ lambdaIn_3[5] ^ lambdaIn_3[6];
   assign lambdaIni_3 [5] = lambdaIn_3[2] ^ lambdaIn_3[4] ^ lambdaIn_3[6] ^ lambdaIn_3[7];
   assign lambdaIni_3 [6] = lambdaIn_3[3] ^ lambdaIn_3[5] ^ lambdaIn_3[7];
   assign lambdaIni_3 [7] = lambdaIn_3[0] ^ lambdaIn_3[1] ^ lambdaIn_3[2] ^ lambdaIn_3[3] ^ lambdaIn_3[6] ^ lambdaIn_3[7];
   assign lambdaIni_4 [0] = lambdaIn_4[1] ^ lambdaIn_4[2] ^ lambdaIn_4[4] ^ lambdaIn_4[5] ^ lambdaIn_4[6];
   assign lambdaIni_4 [1] = lambdaIn_4[1] ^ lambdaIn_4[3] ^ lambdaIn_4[4] ^ lambdaIn_4[7];
   assign lambdaIni_4 [2] = lambdaIn_4[1] ^ lambdaIn_4[6];
   assign lambdaIni_4 [3] = lambdaIn_4[2] ^ lambdaIn_4[7];
   assign lambdaIni_4 [4] = lambdaIn_4[0] ^ lambdaIn_4[3];
   assign lambdaIni_4 [5] = lambdaIn_4[0] ^ lambdaIn_4[1] ^ lambdaIn_4[4];
   assign lambdaIni_4 [6] = lambdaIn_4[1] ^ lambdaIn_4[2] ^ lambdaIn_4[5];
   assign lambdaIni_4 [7] = lambdaIn_4[0] ^ lambdaIn_4[1] ^ lambdaIn_4[3] ^ lambdaIn_4[4] ^ lambdaIn_4[5];
   assign lambdaIni_5 [0] = lambdaIn_5[0] ^ lambdaIn_5[3] ^ lambdaIn_5[7];
   assign lambdaIni_5 [1] = lambdaIn_5[0] ^ lambdaIn_5[1] ^ lambdaIn_5[3] ^ lambdaIn_5[4] ^ lambdaIn_5[7];
   assign lambdaIni_5 [2] = lambdaIn_5[1] ^ lambdaIn_5[2] ^ lambdaIn_5[3] ^ lambdaIn_5[4] ^ lambdaIn_5[5] ^ lambdaIn_5[7];
   assign lambdaIni_5 [3] = lambdaIn_5[2] ^ lambdaIn_5[3] ^ lambdaIn_5[4] ^ lambdaIn_5[5] ^ lambdaIn_5[6];
   assign lambdaIni_5 [4] = lambdaIn_5[0] ^ lambdaIn_5[3] ^ lambdaIn_5[4] ^ lambdaIn_5[5] ^ lambdaIn_5[6] ^ lambdaIn_5[7];
   assign lambdaIni_5 [5] = lambdaIn_5[0] ^ lambdaIn_5[1] ^ lambdaIn_5[4] ^ lambdaIn_5[5] ^ lambdaIn_5[6] ^ lambdaIn_5[7];
   assign lambdaIni_5 [6] = lambdaIn_5[1] ^ lambdaIn_5[2] ^ lambdaIn_5[5] ^ lambdaIn_5[6] ^ lambdaIn_5[7];
   assign lambdaIni_5 [7] = lambdaIn_5[2] ^ lambdaIn_5[6];
   assign lambdaIni_6 [0] = lambdaIn_6[3] ^ lambdaIn_6[5] ^ lambdaIn_6[6];
   assign lambdaIni_6 [1] = lambdaIn_6[0] ^ lambdaIn_6[3] ^ lambdaIn_6[4] ^ lambdaIn_6[5] ^ lambdaIn_6[7];
   assign lambdaIni_6 [2] = lambdaIn_6[1] ^ lambdaIn_6[3] ^ lambdaIn_6[4];
   assign lambdaIni_6 [3] = lambdaIn_6[0] ^ lambdaIn_6[2] ^ lambdaIn_6[4] ^ lambdaIn_6[5];
   assign lambdaIni_6 [4] = lambdaIn_6[0] ^ lambdaIn_6[1] ^ lambdaIn_6[3] ^ lambdaIn_6[5] ^ lambdaIn_6[6];
   assign lambdaIni_6 [5] = lambdaIn_6[0] ^ lambdaIn_6[1] ^ lambdaIn_6[2] ^ lambdaIn_6[4] ^ lambdaIn_6[6] ^ lambdaIn_6[7];
   assign lambdaIni_6 [6] = lambdaIn_6[1] ^ lambdaIn_6[2] ^ lambdaIn_6[3] ^ lambdaIn_6[5] ^ lambdaIn_6[7];
   assign lambdaIni_6 [7] = lambdaIn_6[2] ^ lambdaIn_6[4] ^ lambdaIn_6[5];
   assign lambdaIni_7 [0] = lambdaIn_7[1] ^ lambdaIn_7[2] ^ lambdaIn_7[3] ^ lambdaIn_7[5] ^ lambdaIn_7[6];
   assign lambdaIni_7 [1] = lambdaIn_7[1] ^ lambdaIn_7[4] ^ lambdaIn_7[5] ^ lambdaIn_7[7];
   assign lambdaIni_7 [2] = lambdaIn_7[1] ^ lambdaIn_7[3];
   assign lambdaIni_7 [3] = lambdaIn_7[0] ^ lambdaIn_7[2] ^ lambdaIn_7[4];
   assign lambdaIni_7 [4] = lambdaIn_7[0] ^ lambdaIn_7[1] ^ lambdaIn_7[3] ^ lambdaIn_7[5];
   assign lambdaIni_7 [5] = lambdaIn_7[1] ^ lambdaIn_7[2] ^ lambdaIn_7[4] ^ lambdaIn_7[6];
   assign lambdaIni_7 [6] = lambdaIn_7[2] ^ lambdaIn_7[3] ^ lambdaIn_7[5] ^ lambdaIn_7[7];
   assign lambdaIni_7 [7] = lambdaIn_7[0] ^ lambdaIn_7[1] ^ lambdaIn_7[2] ^ lambdaIn_7[4] ^ lambdaIn_7[5];
   assign lambdaIni_8 [0] = lambdaIn_8[2] ^ lambdaIn_8[5] ^ lambdaIn_8[6] ^ lambdaIn_8[7];
   assign lambdaIni_8 [1] = lambdaIn_8[2] ^ lambdaIn_8[3] ^ lambdaIn_8[5];
   assign lambdaIni_8 [2] = lambdaIn_8[2] ^ lambdaIn_8[3] ^ lambdaIn_8[4] ^ lambdaIn_8[5] ^ lambdaIn_8[7];
   assign lambdaIni_8 [3] = lambdaIn_8[0] ^ lambdaIn_8[3] ^ lambdaIn_8[4] ^ lambdaIn_8[5] ^ lambdaIn_8[6];
   assign lambdaIni_8 [4] = lambdaIn_8[1] ^ lambdaIn_8[4] ^ lambdaIn_8[5] ^ lambdaIn_8[6] ^ lambdaIn_8[7];
   assign lambdaIni_8 [5] = lambdaIn_8[0] ^ lambdaIn_8[2] ^ lambdaIn_8[5] ^ lambdaIn_8[6] ^ lambdaIn_8[7];
   assign lambdaIni_8 [6] = lambdaIn_8[0] ^ lambdaIn_8[1] ^ lambdaIn_8[3] ^ lambdaIn_8[6] ^ lambdaIn_8[7];
   assign lambdaIni_8 [7] = lambdaIn_8[1] ^ lambdaIn_8[4] ^ lambdaIn_8[5] ^ lambdaIn_8[6];



   //------------------------------------------------------------------------
   //- lambdaNew
   //------------------------------------------------------------------------
   reg  [7:0]   lambdaReg_0;
   reg  [7:0]   lambdaReg_1;
   reg  [7:0]   lambdaReg_2;
   reg  [7:0]   lambdaReg_3;
   reg  [7:0]   lambdaReg_4;
   reg  [7:0]   lambdaReg_5;
   reg  [7:0]   lambdaReg_6;
   reg  [7:0]   lambdaReg_7;
   reg  [7:0]   lambdaReg_8;
   wire [7:0]   lambdaUp_0;
   wire [7:0]   lambdaUp_1;
   wire [7:0]   lambdaUp_2;
   wire [7:0]   lambdaUp_3;
   wire [7:0]   lambdaUp_4;
   wire [7:0]   lambdaUp_5;
   wire [7:0]   lambdaUp_6;
   wire [7:0]   lambdaUp_7;
   wire [7:0]   lambdaUp_8;


   assign lambdaUp_0 [0] = lambdaReg_0[0];
   assign lambdaUp_0 [1] = lambdaReg_0[1];
   assign lambdaUp_0 [2] = lambdaReg_0[2];
   assign lambdaUp_0 [3] = lambdaReg_0[3];
   assign lambdaUp_0 [4] = lambdaReg_0[4];
   assign lambdaUp_0 [5] = lambdaReg_0[5];
   assign lambdaUp_0 [6] = lambdaReg_0[6];
   assign lambdaUp_0 [7] = lambdaReg_0[7];
   assign lambdaUp_1 [0] = lambdaReg_1[7];
   assign lambdaUp_1 [1] = lambdaReg_1[0] ^ lambdaReg_1[7];
   assign lambdaUp_1 [2] = lambdaReg_1[1] ^ lambdaReg_1[7];
   assign lambdaUp_1 [3] = lambdaReg_1[2];
   assign lambdaUp_1 [4] = lambdaReg_1[3];
   assign lambdaUp_1 [5] = lambdaReg_1[4];
   assign lambdaUp_1 [6] = lambdaReg_1[5];
   assign lambdaUp_1 [7] = lambdaReg_1[6] ^ lambdaReg_1[7];
   assign lambdaUp_2 [0] = lambdaReg_2[6] ^ lambdaReg_2[7];
   assign lambdaUp_2 [1] = lambdaReg_2[6];
   assign lambdaUp_2 [2] = lambdaReg_2[0] ^ lambdaReg_2[6];
   assign lambdaUp_2 [3] = lambdaReg_2[1] ^ lambdaReg_2[7];
   assign lambdaUp_2 [4] = lambdaReg_2[2];
   assign lambdaUp_2 [5] = lambdaReg_2[3];
   assign lambdaUp_2 [6] = lambdaReg_2[4];
   assign lambdaUp_2 [7] = lambdaReg_2[5] ^ lambdaReg_2[6] ^ lambdaReg_2[7];
   assign lambdaUp_3 [0] = lambdaReg_3[5] ^ lambdaReg_3[6] ^ lambdaReg_3[7];
   assign lambdaUp_3 [1] = lambdaReg_3[5];
   assign lambdaUp_3 [2] = lambdaReg_3[5] ^ lambdaReg_3[7];
   assign lambdaUp_3 [3] = lambdaReg_3[0] ^ lambdaReg_3[6];
   assign lambdaUp_3 [4] = lambdaReg_3[1] ^ lambdaReg_3[7];
   assign lambdaUp_3 [5] = lambdaReg_3[2];
   assign lambdaUp_3 [6] = lambdaReg_3[3];
   assign lambdaUp_3 [7] = lambdaReg_3[4] ^ lambdaReg_3[5] ^ lambdaReg_3[6] ^ lambdaReg_3[7];
   assign lambdaUp_4 [0] = lambdaReg_4[4] ^ lambdaReg_4[5] ^ lambdaReg_4[6] ^ lambdaReg_4[7];
   assign lambdaUp_4 [1] = lambdaReg_4[4];
   assign lambdaUp_4 [2] = lambdaReg_4[4] ^ lambdaReg_4[6] ^ lambdaReg_4[7];
   assign lambdaUp_4 [3] = lambdaReg_4[5] ^ lambdaReg_4[7];
   assign lambdaUp_4 [4] = lambdaReg_4[0] ^ lambdaReg_4[6];
   assign lambdaUp_4 [5] = lambdaReg_4[1] ^ lambdaReg_4[7];
   assign lambdaUp_4 [6] = lambdaReg_4[2];
   assign lambdaUp_4 [7] = lambdaReg_4[3] ^ lambdaReg_4[4] ^ lambdaReg_4[5] ^ lambdaReg_4[6] ^ lambdaReg_4[7];
   assign lambdaUp_5 [0] = lambdaReg_5[3] ^ lambdaReg_5[4] ^ lambdaReg_5[5] ^ lambdaReg_5[6] ^ lambdaReg_5[7];
   assign lambdaUp_5 [1] = lambdaReg_5[3];
   assign lambdaUp_5 [2] = lambdaReg_5[3] ^ lambdaReg_5[5] ^ lambdaReg_5[6] ^ lambdaReg_5[7];
   assign lambdaUp_5 [3] = lambdaReg_5[4] ^ lambdaReg_5[6] ^ lambdaReg_5[7];
   assign lambdaUp_5 [4] = lambdaReg_5[5] ^ lambdaReg_5[7];
   assign lambdaUp_5 [5] = lambdaReg_5[0] ^ lambdaReg_5[6];
   assign lambdaUp_5 [6] = lambdaReg_5[1] ^ lambdaReg_5[7];
   assign lambdaUp_5 [7] = lambdaReg_5[2] ^ lambdaReg_5[3] ^ lambdaReg_5[4] ^ lambdaReg_5[5] ^ lambdaReg_5[6] ^ lambdaReg_5[7];
   assign lambdaUp_6 [0] = lambdaReg_6[2] ^ lambdaReg_6[3] ^ lambdaReg_6[4] ^ lambdaReg_6[5] ^ lambdaReg_6[6] ^ lambdaReg_6[7];
   assign lambdaUp_6 [1] = lambdaReg_6[2];
   assign lambdaUp_6 [2] = lambdaReg_6[2] ^ lambdaReg_6[4] ^ lambdaReg_6[5] ^ lambdaReg_6[6] ^ lambdaReg_6[7];
   assign lambdaUp_6 [3] = lambdaReg_6[3] ^ lambdaReg_6[5] ^ lambdaReg_6[6] ^ lambdaReg_6[7];
   assign lambdaUp_6 [4] = lambdaReg_6[4] ^ lambdaReg_6[6] ^ lambdaReg_6[7];
   assign lambdaUp_6 [5] = lambdaReg_6[5] ^ lambdaReg_6[7];
   assign lambdaUp_6 [6] = lambdaReg_6[0] ^ lambdaReg_6[6];
   assign lambdaUp_6 [7] = lambdaReg_6[1] ^ lambdaReg_6[2] ^ lambdaReg_6[3] ^ lambdaReg_6[4] ^ lambdaReg_6[5] ^ lambdaReg_6[6];
   assign lambdaUp_7 [0] = lambdaReg_7[1] ^ lambdaReg_7[2] ^ lambdaReg_7[3] ^ lambdaReg_7[4] ^ lambdaReg_7[5] ^ lambdaReg_7[6];
   assign lambdaUp_7 [1] = lambdaReg_7[1] ^ lambdaReg_7[7];
   assign lambdaUp_7 [2] = lambdaReg_7[1] ^ lambdaReg_7[3] ^ lambdaReg_7[4] ^ lambdaReg_7[5] ^ lambdaReg_7[6];
   assign lambdaUp_7 [3] = lambdaReg_7[2] ^ lambdaReg_7[4] ^ lambdaReg_7[5] ^ lambdaReg_7[6] ^ lambdaReg_7[7];
   assign lambdaUp_7 [4] = lambdaReg_7[3] ^ lambdaReg_7[5] ^ lambdaReg_7[6] ^ lambdaReg_7[7];
   assign lambdaUp_7 [5] = lambdaReg_7[4] ^ lambdaReg_7[6] ^ lambdaReg_7[7];
   assign lambdaUp_7 [6] = lambdaReg_7[5] ^ lambdaReg_7[7];
   assign lambdaUp_7 [7] = lambdaReg_7[0] ^ lambdaReg_7[1] ^ lambdaReg_7[2] ^ lambdaReg_7[3] ^ lambdaReg_7[4] ^ lambdaReg_7[5];
   assign lambdaUp_8 [0] = lambdaReg_8[0] ^ lambdaReg_8[1] ^ lambdaReg_8[2] ^ lambdaReg_8[3] ^ lambdaReg_8[4] ^ lambdaReg_8[5];
   assign lambdaUp_8 [1] = lambdaReg_8[0] ^ lambdaReg_8[6];
   assign lambdaUp_8 [2] = lambdaReg_8[0] ^ lambdaReg_8[2] ^ lambdaReg_8[3] ^ lambdaReg_8[4] ^ lambdaReg_8[5] ^ lambdaReg_8[7];
   assign lambdaUp_8 [3] = lambdaReg_8[1] ^ lambdaReg_8[3] ^ lambdaReg_8[4] ^ lambdaReg_8[5] ^ lambdaReg_8[6];
   assign lambdaUp_8 [4] = lambdaReg_8[2] ^ lambdaReg_8[4] ^ lambdaReg_8[5] ^ lambdaReg_8[6] ^ lambdaReg_8[7];
   assign lambdaUp_8 [5] = lambdaReg_8[3] ^ lambdaReg_8[5] ^ lambdaReg_8[6] ^ lambdaReg_8[7];
   assign lambdaUp_8 [6] = lambdaReg_8[4] ^ lambdaReg_8[6] ^ lambdaReg_8[7];
   assign lambdaUp_8 [7] = lambdaReg_8[0] ^ lambdaReg_8[1] ^ lambdaReg_8[2] ^ lambdaReg_8[3] ^ lambdaReg_8[4] ^ lambdaReg_8[7];



   //------------------------------------------------------------------------
   // + lambdaReg_0,...,lambdaReg_8
   //- registers
   //------------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         lambdaReg_0 [7:0]  <= 8'd0;
         lambdaReg_1 [7:0]  <= 8'd0;
         lambdaReg_2 [7:0]  <= 8'd0;
         lambdaReg_3 [7:0]  <= 8'd0;
         lambdaReg_4 [7:0]  <= 8'd0;
         lambdaReg_5 [7:0]  <= 8'd0;
         lambdaReg_6 [7:0]  <= 8'd0;
         lambdaReg_7 [7:0]  <= 8'd0;
         lambdaReg_8 [7:0]  <= 8'd0;
      end
      else if (enable == 1'b1) begin
         if (sync == 1'b1) begin
            lambdaReg_0 [7:0]  <= lambdaIni_0 [7:0];
            lambdaReg_1 [7:0]  <= lambdaIni_1 [7:0];
            lambdaReg_2 [7:0]  <= lambdaIni_2 [7:0];
            lambdaReg_3 [7:0]  <= lambdaIni_3 [7:0];
            lambdaReg_4 [7:0]  <= lambdaIni_4 [7:0];
            lambdaReg_5 [7:0]  <= lambdaIni_5 [7:0];
            lambdaReg_6 [7:0]  <= lambdaIni_6 [7:0];
            lambdaReg_7 [7:0]  <= lambdaIni_7 [7:0];
            lambdaReg_8 [7:0]  <= lambdaIni_8 [7:0];
        end
        else begin
           lambdaReg_0 [7:0]  <= lambdaUp_0 [7:0];
           lambdaReg_1 [7:0]  <= lambdaUp_1 [7:0];
           lambdaReg_2 [7:0]  <= lambdaUp_2 [7:0];
           lambdaReg_3 [7:0]  <= lambdaUp_3 [7:0];
           lambdaReg_4 [7:0]  <= lambdaUp_4 [7:0];
           lambdaReg_5 [7:0]  <= lambdaUp_5 [7:0];
           lambdaReg_6 [7:0]  <= lambdaUp_6 [7:0];
           lambdaReg_7 [7:0]  <= lambdaUp_7 [7:0];
           lambdaReg_8 [7:0]  <= lambdaUp_8 [7:0];
         end
      end
   end



   //------------------------------------------------------------------------
   //- omegaIni
   //------------------------------------------------------------------------
   wire [7:0]  omegaIni_0;
   wire [7:0]  omegaIni_1;
   wire [7:0]  omegaIni_2;
   wire [7:0]  omegaIni_3;
   wire [7:0]  omegaIni_4;
   wire [7:0]  omegaIni_5;
   wire [7:0]  omegaIni_6;
   wire [7:0]  omegaIni_7;


   assign omegaIni_0 [0] = omegaIn_0[0];
   assign omegaIni_0 [1] = omegaIn_0[1];
   assign omegaIni_0 [2] = omegaIn_0[2];
   assign omegaIni_0 [3] = omegaIn_0[3];
   assign omegaIni_0 [4] = omegaIn_0[4];
   assign omegaIni_0 [5] = omegaIn_0[5];
   assign omegaIni_0 [6] = omegaIn_0[6];
   assign omegaIni_0 [7] = omegaIn_0[7];
   assign omegaIni_1 [0] = omegaIn_1[1] ^ omegaIn_1[5];
   assign omegaIni_1 [1] = omegaIn_1[0] ^ omegaIn_1[1] ^ omegaIn_1[2] ^ omegaIn_1[5] ^ omegaIn_1[6];
   assign omegaIni_1 [2] = omegaIn_1[0] ^ omegaIn_1[2] ^ omegaIn_1[3] ^ omegaIn_1[5] ^ omegaIn_1[6] ^ omegaIn_1[7];
   assign omegaIni_1 [3] = omegaIn_1[0] ^ omegaIn_1[1] ^ omegaIn_1[3] ^ omegaIn_1[4] ^ omegaIn_1[6] ^ omegaIn_1[7];
   assign omegaIni_1 [4] = omegaIn_1[1] ^ omegaIn_1[2] ^ omegaIn_1[4] ^ omegaIn_1[5] ^ omegaIn_1[7];
   assign omegaIni_1 [5] = omegaIn_1[2] ^ omegaIn_1[3] ^ omegaIn_1[5] ^ omegaIn_1[6];
   assign omegaIni_1 [6] = omegaIn_1[0] ^ omegaIn_1[3] ^ omegaIn_1[4] ^ omegaIn_1[6] ^ omegaIn_1[7];
   assign omegaIni_1 [7] = omegaIn_1[0] ^ omegaIn_1[4] ^ omegaIn_1[7];
   assign omegaIni_2 [0] = omegaIn_2[0] ^ omegaIn_2[1] ^ omegaIn_2[3];
   assign omegaIni_2 [1] = omegaIn_2[0] ^ omegaIn_2[2] ^ omegaIn_2[3] ^ omegaIn_2[4];
   assign omegaIni_2 [2] = omegaIn_2[4] ^ omegaIn_2[5];
   assign omegaIni_2 [3] = omegaIn_2[5] ^ omegaIn_2[6];
   assign omegaIni_2 [4] = omegaIn_2[0] ^ omegaIn_2[6] ^ omegaIn_2[7];
   assign omegaIni_2 [5] = omegaIn_2[0] ^ omegaIn_2[1] ^ omegaIn_2[7];
   assign omegaIni_2 [6] = omegaIn_2[0] ^ omegaIn_2[1] ^ omegaIn_2[2];
   assign omegaIni_2 [7] = omegaIn_2[0] ^ omegaIn_2[2];
   assign omegaIni_3 [0] = omegaIn_3[1] ^ omegaIn_3[2] ^ omegaIn_3[3] ^ omegaIn_3[4] ^ omegaIn_3[7];
   assign omegaIni_3 [1] = omegaIn_3[1] ^ omegaIn_3[5] ^ omegaIn_3[7];
   assign omegaIni_3 [2] = omegaIn_3[1] ^ omegaIn_3[3] ^ omegaIn_3[4] ^ omegaIn_3[6] ^ omegaIn_3[7];
   assign omegaIni_3 [3] = omegaIn_3[0] ^ omegaIn_3[2] ^ omegaIn_3[4] ^ omegaIn_3[5] ^ omegaIn_3[7];
   assign omegaIni_3 [4] = omegaIn_3[1] ^ omegaIn_3[3] ^ omegaIn_3[5] ^ omegaIn_3[6];
   assign omegaIni_3 [5] = omegaIn_3[2] ^ omegaIn_3[4] ^ omegaIn_3[6] ^ omegaIn_3[7];
   assign omegaIni_3 [6] = omegaIn_3[3] ^ omegaIn_3[5] ^ omegaIn_3[7];
   assign omegaIni_3 [7] = omegaIn_3[0] ^ omegaIn_3[1] ^ omegaIn_3[2] ^ omegaIn_3[3] ^ omegaIn_3[6] ^ omegaIn_3[7];
   assign omegaIni_4 [0] = omegaIn_4[1] ^ omegaIn_4[2] ^ omegaIn_4[4] ^ omegaIn_4[5] ^ omegaIn_4[6];
   assign omegaIni_4 [1] = omegaIn_4[1] ^ omegaIn_4[3] ^ omegaIn_4[4] ^ omegaIn_4[7];
   assign omegaIni_4 [2] = omegaIn_4[1] ^ omegaIn_4[6];
   assign omegaIni_4 [3] = omegaIn_4[2] ^ omegaIn_4[7];
   assign omegaIni_4 [4] = omegaIn_4[0] ^ omegaIn_4[3];
   assign omegaIni_4 [5] = omegaIn_4[0] ^ omegaIn_4[1] ^ omegaIn_4[4];
   assign omegaIni_4 [6] = omegaIn_4[1] ^ omegaIn_4[2] ^ omegaIn_4[5];
   assign omegaIni_4 [7] = omegaIn_4[0] ^ omegaIn_4[1] ^ omegaIn_4[3] ^ omegaIn_4[4] ^ omegaIn_4[5];
   assign omegaIni_5 [0] = omegaIn_5[0] ^ omegaIn_5[3] ^ omegaIn_5[7];
   assign omegaIni_5 [1] = omegaIn_5[0] ^ omegaIn_5[1] ^ omegaIn_5[3] ^ omegaIn_5[4] ^ omegaIn_5[7];
   assign omegaIni_5 [2] = omegaIn_5[1] ^ omegaIn_5[2] ^ omegaIn_5[3] ^ omegaIn_5[4] ^ omegaIn_5[5] ^ omegaIn_5[7];
   assign omegaIni_5 [3] = omegaIn_5[2] ^ omegaIn_5[3] ^ omegaIn_5[4] ^ omegaIn_5[5] ^ omegaIn_5[6];
   assign omegaIni_5 [4] = omegaIn_5[0] ^ omegaIn_5[3] ^ omegaIn_5[4] ^ omegaIn_5[5] ^ omegaIn_5[6] ^ omegaIn_5[7];
   assign omegaIni_5 [5] = omegaIn_5[0] ^ omegaIn_5[1] ^ omegaIn_5[4] ^ omegaIn_5[5] ^ omegaIn_5[6] ^ omegaIn_5[7];
   assign omegaIni_5 [6] = omegaIn_5[1] ^ omegaIn_5[2] ^ omegaIn_5[5] ^ omegaIn_5[6] ^ omegaIn_5[7];
   assign omegaIni_5 [7] = omegaIn_5[2] ^ omegaIn_5[6];
   assign omegaIni_6 [0] = omegaIn_6[3] ^ omegaIn_6[5] ^ omegaIn_6[6];
   assign omegaIni_6 [1] = omegaIn_6[0] ^ omegaIn_6[3] ^ omegaIn_6[4] ^ omegaIn_6[5] ^ omegaIn_6[7];
   assign omegaIni_6 [2] = omegaIn_6[1] ^ omegaIn_6[3] ^ omegaIn_6[4];
   assign omegaIni_6 [3] = omegaIn_6[0] ^ omegaIn_6[2] ^ omegaIn_6[4] ^ omegaIn_6[5];
   assign omegaIni_6 [4] = omegaIn_6[0] ^ omegaIn_6[1] ^ omegaIn_6[3] ^ omegaIn_6[5] ^ omegaIn_6[6];
   assign omegaIni_6 [5] = omegaIn_6[0] ^ omegaIn_6[1] ^ omegaIn_6[2] ^ omegaIn_6[4] ^ omegaIn_6[6] ^ omegaIn_6[7];
   assign omegaIni_6 [6] = omegaIn_6[1] ^ omegaIn_6[2] ^ omegaIn_6[3] ^ omegaIn_6[5] ^ omegaIn_6[7];
   assign omegaIni_6 [7] = omegaIn_6[2] ^ omegaIn_6[4] ^ omegaIn_6[5];
   assign omegaIni_7 [0] = omegaIn_7[1] ^ omegaIn_7[2] ^ omegaIn_7[3] ^ omegaIn_7[5] ^ omegaIn_7[6];
   assign omegaIni_7 [1] = omegaIn_7[1] ^ omegaIn_7[4] ^ omegaIn_7[5] ^ omegaIn_7[7];
   assign omegaIni_7 [2] = omegaIn_7[1] ^ omegaIn_7[3];
   assign omegaIni_7 [3] = omegaIn_7[0] ^ omegaIn_7[2] ^ omegaIn_7[4];
   assign omegaIni_7 [4] = omegaIn_7[0] ^ omegaIn_7[1] ^ omegaIn_7[3] ^ omegaIn_7[5];
   assign omegaIni_7 [5] = omegaIn_7[1] ^ omegaIn_7[2] ^ omegaIn_7[4] ^ omegaIn_7[6];
   assign omegaIni_7 [6] = omegaIn_7[2] ^ omegaIn_7[3] ^ omegaIn_7[5] ^ omegaIn_7[7];
   assign omegaIni_7 [7] = omegaIn_7[0] ^ omegaIn_7[1] ^ omegaIn_7[2] ^ omegaIn_7[4] ^ omegaIn_7[5];



   //------------------------------------------------------------------------
   //- omegaNew
   //------------------------------------------------------------------------
   reg [7:0]  omegaReg_0;
   reg [7:0]  omegaReg_1;
   reg [7:0]  omegaReg_2;
   reg [7:0]  omegaReg_3;
   reg [7:0]  omegaReg_4;
   reg [7:0]  omegaReg_5;
   reg [7:0]  omegaReg_6;
   reg [7:0]  omegaReg_7;
   wire [7:0]  omegaNew_0;
   wire [7:0]  omegaNew_1;
   wire [7:0]  omegaNew_2;
   wire [7:0]  omegaNew_3;
   wire [7:0]  omegaNew_4;
   wire [7:0]  omegaNew_5;
   wire [7:0]  omegaNew_6;
   wire [7:0]  omegaNew_7;


   assign omegaNew_0 [0] = omegaReg_0[0];
   assign omegaNew_0 [1] = omegaReg_0[1];
   assign omegaNew_0 [2] = omegaReg_0[2];
   assign omegaNew_0 [3] = omegaReg_0[3];
   assign omegaNew_0 [4] = omegaReg_0[4];
   assign omegaNew_0 [5] = omegaReg_0[5];
   assign omegaNew_0 [6] = omegaReg_0[6];
   assign omegaNew_0 [7] = omegaReg_0[7];
   assign omegaNew_1 [0] = omegaReg_1[7];
   assign omegaNew_1 [1] = omegaReg_1[0] ^ omegaReg_1[7];
   assign omegaNew_1 [2] = omegaReg_1[1] ^ omegaReg_1[7];
   assign omegaNew_1 [3] = omegaReg_1[2];
   assign omegaNew_1 [4] = omegaReg_1[3];
   assign omegaNew_1 [5] = omegaReg_1[4];
   assign omegaNew_1 [6] = omegaReg_1[5];
   assign omegaNew_1 [7] = omegaReg_1[6] ^ omegaReg_1[7];
   assign omegaNew_2 [0] = omegaReg_2[6] ^ omegaReg_2[7];
   assign omegaNew_2 [1] = omegaReg_2[6];
   assign omegaNew_2 [2] = omegaReg_2[0] ^ omegaReg_2[6];
   assign omegaNew_2 [3] = omegaReg_2[1] ^ omegaReg_2[7];
   assign omegaNew_2 [4] = omegaReg_2[2];
   assign omegaNew_2 [5] = omegaReg_2[3];
   assign omegaNew_2 [6] = omegaReg_2[4];
   assign omegaNew_2 [7] = omegaReg_2[5] ^ omegaReg_2[6] ^ omegaReg_2[7];
   assign omegaNew_3 [0] = omegaReg_3[5] ^ omegaReg_3[6] ^ omegaReg_3[7];
   assign omegaNew_3 [1] = omegaReg_3[5];
   assign omegaNew_3 [2] = omegaReg_3[5] ^ omegaReg_3[7];
   assign omegaNew_3 [3] = omegaReg_3[0] ^ omegaReg_3[6];
   assign omegaNew_3 [4] = omegaReg_3[1] ^ omegaReg_3[7];
   assign omegaNew_3 [5] = omegaReg_3[2];
   assign omegaNew_3 [6] = omegaReg_3[3];
   assign omegaNew_3 [7] = omegaReg_3[4] ^ omegaReg_3[5] ^ omegaReg_3[6] ^ omegaReg_3[7];
   assign omegaNew_4 [0] = omegaReg_4[4] ^ omegaReg_4[5] ^ omegaReg_4[6] ^ omegaReg_4[7];
   assign omegaNew_4 [1] = omegaReg_4[4];
   assign omegaNew_4 [2] = omegaReg_4[4] ^ omegaReg_4[6] ^ omegaReg_4[7];
   assign omegaNew_4 [3] = omegaReg_4[5] ^ omegaReg_4[7];
   assign omegaNew_4 [4] = omegaReg_4[0] ^ omegaReg_4[6];
   assign omegaNew_4 [5] = omegaReg_4[1] ^ omegaReg_4[7];
   assign omegaNew_4 [6] = omegaReg_4[2];
   assign omegaNew_4 [7] = omegaReg_4[3] ^ omegaReg_4[4] ^ omegaReg_4[5] ^ omegaReg_4[6] ^ omegaReg_4[7];
   assign omegaNew_5 [0] = omegaReg_5[3] ^ omegaReg_5[4] ^ omegaReg_5[5] ^ omegaReg_5[6] ^ omegaReg_5[7];
   assign omegaNew_5 [1] = omegaReg_5[3];
   assign omegaNew_5 [2] = omegaReg_5[3] ^ omegaReg_5[5] ^ omegaReg_5[6] ^ omegaReg_5[7];
   assign omegaNew_5 [3] = omegaReg_5[4] ^ omegaReg_5[6] ^ omegaReg_5[7];
   assign omegaNew_5 [4] = omegaReg_5[5] ^ omegaReg_5[7];
   assign omegaNew_5 [5] = omegaReg_5[0] ^ omegaReg_5[6];
   assign omegaNew_5 [6] = omegaReg_5[1] ^ omegaReg_5[7];
   assign omegaNew_5 [7] = omegaReg_5[2] ^ omegaReg_5[3] ^ omegaReg_5[4] ^ omegaReg_5[5] ^ omegaReg_5[6] ^ omegaReg_5[7];
   assign omegaNew_6 [0] = omegaReg_6[2] ^ omegaReg_6[3] ^ omegaReg_6[4] ^ omegaReg_6[5] ^ omegaReg_6[6] ^ omegaReg_6[7];
   assign omegaNew_6 [1] = omegaReg_6[2];
   assign omegaNew_6 [2] = omegaReg_6[2] ^ omegaReg_6[4] ^ omegaReg_6[5] ^ omegaReg_6[6] ^ omegaReg_6[7];
   assign omegaNew_6 [3] = omegaReg_6[3] ^ omegaReg_6[5] ^ omegaReg_6[6] ^ omegaReg_6[7];
   assign omegaNew_6 [4] = omegaReg_6[4] ^ omegaReg_6[6] ^ omegaReg_6[7];
   assign omegaNew_6 [5] = omegaReg_6[5] ^ omegaReg_6[7];
   assign omegaNew_6 [6] = omegaReg_6[0] ^ omegaReg_6[6];
   assign omegaNew_6 [7] = omegaReg_6[1] ^ omegaReg_6[2] ^ omegaReg_6[3] ^ omegaReg_6[4] ^ omegaReg_6[5] ^ omegaReg_6[6];
   assign omegaNew_7 [0] = omegaReg_7[1] ^ omegaReg_7[2] ^ omegaReg_7[3] ^ omegaReg_7[4] ^ omegaReg_7[5] ^ omegaReg_7[6];
   assign omegaNew_7 [1] = omegaReg_7[1] ^ omegaReg_7[7];
   assign omegaNew_7 [2] = omegaReg_7[1] ^ omegaReg_7[3] ^ omegaReg_7[4] ^ omegaReg_7[5] ^ omegaReg_7[6];
   assign omegaNew_7 [3] = omegaReg_7[2] ^ omegaReg_7[4] ^ omegaReg_7[5] ^ omegaReg_7[6] ^ omegaReg_7[7];
   assign omegaNew_7 [4] = omegaReg_7[3] ^ omegaReg_7[5] ^ omegaReg_7[6] ^ omegaReg_7[7];
   assign omegaNew_7 [5] = omegaReg_7[4] ^ omegaReg_7[6] ^ omegaReg_7[7];
   assign omegaNew_7 [6] = omegaReg_7[5] ^ omegaReg_7[7];
   assign omegaNew_7 [7] = omegaReg_7[0] ^ omegaReg_7[1] ^ omegaReg_7[2] ^ omegaReg_7[3] ^ omegaReg_7[4] ^ omegaReg_7[5];



   //------------------------------------------------------------------
   // + omegaReg_0,..., omegaReg_7
   //- registers
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         omegaReg_0 [7:0]  <= 8'd0;
         omegaReg_1 [7:0]  <= 8'd0;
         omegaReg_2 [7:0]  <= 8'd0;
         omegaReg_3 [7:0]  <= 8'd0;
         omegaReg_4 [7:0]  <= 8'd0;
         omegaReg_5 [7:0]  <= 8'd0;
         omegaReg_6 [7:0]  <= 8'd0;
         omegaReg_7 [7:0]  <= 8'd0;
      end
      else if (enable == 1'b1) begin
         if (sync == 1'b1) begin
            omegaReg_0 [7:0]  <= omegaIni_0 [7:0];
            omegaReg_1 [7:0]  <= omegaIni_1 [7:0];
            omegaReg_2 [7:0]  <= omegaIni_2 [7:0];
            omegaReg_3 [7:0]  <= omegaIni_3 [7:0];
            omegaReg_4 [7:0]  <= omegaIni_4 [7:0];
            omegaReg_5 [7:0]  <= omegaIni_5 [7:0];
            omegaReg_6 [7:0]  <= omegaIni_6 [7:0];
            omegaReg_7 [7:0]  <= omegaIni_7 [7:0];
         end
         else begin
            omegaReg_0 [7:0]  <= omegaNew_0 [7:0];
            omegaReg_1 [7:0]  <= omegaNew_1 [7:0];
            omegaReg_2 [7:0]  <= omegaNew_2 [7:0];
            omegaReg_3 [7:0]  <= omegaNew_3 [7:0];
            omegaReg_4 [7:0]  <= omegaNew_4 [7:0];
            omegaReg_5 [7:0]  <= omegaNew_5 [7:0];
            omegaReg_6 [7:0]  <= omegaNew_6 [7:0];
            omegaReg_7 [7:0]  <= omegaNew_7 [7:0];
         end
      end
   end



   //------------------------------------------------------------------------
   // Generate Error Pattern: Lambda
   //------------------------------------------------------------------------
   always @( lambdaReg_0   or lambdaReg_1   or lambdaReg_2   or lambdaReg_3   or lambdaReg_4   or lambdaReg_5   or lambdaReg_6   or lambdaReg_7   or lambdaReg_8 ) begin
      lambdaEven [7:0] = lambdaReg_0[7:0]   ^ lambdaReg_2[7:0]   ^ lambdaReg_4[7:0]   ^ lambdaReg_6[7:0]   ^ lambdaReg_8[7:0];
      lambdaOdd [7:0] =  lambdaReg_1[7:0]   ^ lambdaReg_3[7:0]   ^ lambdaReg_5[7:0]   ^ lambdaReg_7[7:0];
   end



   //------------------------------------------------------------------------
   // Generate Error Pattern: Omega
   //------------------------------------------------------------------------
   always @( omegaReg_0   or omegaReg_1   or omegaReg_2   or omegaReg_3   or omegaReg_4   or omegaReg_5   or omegaReg_6   or omegaReg_7 ) begin
      omegaSum [7:0] = omegaReg_0[7:0]   ^ omegaReg_1[7:0]   ^ omegaReg_2[7:0]   ^ omegaReg_3[7:0]   ^ omegaReg_4[7:0]   ^ omegaReg_5[7:0]   ^ omegaReg_6[7:0]   ^ omegaReg_7[7:0];
   end



   //------------------------------------------------------------------------
   //- RsDecodeMult instantiation, RsDecodeMult_MuldE0 && RsDecodeMult_MuldE1
   //------------------------------------------------------------------------
   assign denomE0[7:0] = lambdaOddReg[7:0];


   //------------------------------------------------------------------------
   //- RsDecodeInv instantiation, RsDecodeInv_InvE0 && RsDecodeInv_InvE1
   //------------------------------------------------------------------------
   RsDecodeInv RsDecodeInv_InvE0 (.B(denomE0Reg[7:0]), .R(denomE0Inv[7:0]));


   //------------------------------------------------------------------------
   //- RsDecodeMult instantiation, RsDecodeMult_MulE0 && RsDecodeMult_MulE1 
   //------------------------------------------------------------------------
   RsDecodeMult RsDecodeMult_MulE0 (.A(numeReg2[7:0]), .B(denomE0InvReg[7:0]), .P(errorValueE0[7:0]));




   //------------------------------------------------------------------------
   // + lambdaEvenReg, lambdaEvenReg2, lambdaEvenReg3, lambdaOddReg, lambdaOddReg2, lambdaOddReg3, denomE0Reg, denomE0InvReg
   // + omegaSumReg, numeReg, numeReg2
   //------------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         lambdaEvenReg  [7:0] <= 8'd0;
         lambdaEvenReg2 [7:0] <= 8'd0;
         lambdaEvenReg3 [7:0] <= 8'd0;
         lambdaOddReg   [7:0] <= 8'd0;
         lambdaOddReg2  [7:0] <= 8'd0;
         lambdaOddReg3  [7:0] <= 8'd0;
         denomE0Reg     [7:0] <= 8'd0;
         denomE0InvReg  [7:0] <= 8'd0;
         omegaSumReg    [7:0] <= 8'd0;
         numeReg        [7:0] <= 8'd0;
         numeReg2       [7:0] <= 8'd0;
      end
      else if (enable == 1'b1) begin
         lambdaEvenReg3 <= lambdaEvenReg2;
         lambdaEvenReg2 <= lambdaEvenReg;
         lambdaEvenReg  <= lambdaEven;
         lambdaOddReg3  <= lambdaOddReg2;
         lambdaOddReg2  <= lambdaOddReg;
         lambdaOddReg   <= lambdaOdd;
         denomE0Reg     <= denomE0;
         denomE0InvReg  <= denomE0Inv;
         numeReg2       <= numeReg;
         numeReg        <= omegaSumReg;
         omegaSumReg    <= omegaSum;
      end
   end



   //------------------------------------------------------------------
   // + errorOut
   //- 
   //------------------------------------------------------------------
   reg   [7:0]  errorOut;
   always @(lambdaEvenReg3 or lambdaOddReg3 or errorValueE0) begin
      if (lambdaEvenReg3 == lambdaOddReg3) begin
         errorOut = errorValueE0;
      end
      else begin
         errorOut = 8'd0;
      end
   end



   //------------------------------------------------------------------------
   // + numErrorReg
   //- Count Error
   //------------------------------------------------------------------------
   reg    [4:0]   numErrorReg;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         numErrorReg [4:0]   <= 5'd0;
      end
      else if (enable == 1'b1) begin
         if (sync == 1'b1) begin
            numErrorReg <= 5'd0;
         end
         else if (lambdaEven == lambdaOdd) begin
            numErrorReg <= numErrorReg + 5'd1;
         end
      end
   end



   //------------------------------------------------------------------
   // + numErrorReg2
   //------------------------------------------------------------------
   reg    [4:0]   numErrorReg2;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         numErrorReg2 <=  5'd0;
      end
      else if ((enable == 1'b1) && (doneOrg == 1'b1)) begin
         if (lambdaEven == lambdaOdd) begin
            numErrorReg2 <= numErrorReg + 5'd1;
         end
         else begin
            numErrorReg2 <= numErrorReg;
         end
      end
   end
   //------------------------------------------------------------------------
   //- Output Ports
   //------------------------------------------------------------------------
   assign   numError = numErrorReg2;


endmodule
