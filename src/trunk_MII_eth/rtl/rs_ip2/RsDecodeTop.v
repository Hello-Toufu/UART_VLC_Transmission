//===================================================================
// Module Name : RsDecodeTop
// File Name   : RsDecodeTop.v
// Function    : Rs Decoder Top Module
// 
// Revision History:
// Date          By           Version    Change Description
//===================================================================
// 2009/02/03  Gael Sapience     1.0       Original
//
//===================================================================
// (C) COPYRIGHT 2009 SYSTEM LSI CO., Ltd.
//


module RsDecodeTop(
   // Inputs
   CLK,            // system clock
   RESET,          // system reset
   enable,         // system enable
   startPls,       // sync signal
   dataIn,         // data input
   // Outputs
   outEnable,      // data out valid signal
   outStartPls,    // first decoded symbol trigger
   outDone,        // last symbol decoded trigger
   errorNum,       // number of errors corrected
   fail,           // decoding failure signal
   delayedData,    // decoding failure signal
   outData         // data output
);


   input          CLK;            // system clock
   input          RESET;          // system reset
   input          enable;         // system enable
   input          startPls;       // sync signal
   input  [7:0]   dataIn;         // data input
   output         outEnable;      // data out valid signal
   output         outStartPls;    // first decoded symbol trigger
   output         outDone;        // last symbol decoded trigger
   output [7:0]   errorNum;       // number of errors corrected
   output         fail;           // decoding failure signal
   output [7:0]   delayedData;    // delayed input data
   output [7:0]   outData;        // data output



   //------------------------------------------------------------------------
   // + dataInCheck
   //- assign to 0 if Erasure
   //------------------------------------------------------------------------
   wire [7:0]   dataInCheck;

   assign dataInCheck = dataIn;



    //------------------------------------------------------------------
    // + syndrome_0,...,syndrome_15
    // + doneSyndrome
    //- RS Syndrome calculation
    //------------------------------------------------------------------
    wire [7:0]   syndrome_0;
    wire [7:0]   syndrome_1;
    wire [7:0]   syndrome_2;
    wire [7:0]   syndrome_3;
    wire [7:0]   syndrome_4;
    wire [7:0]   syndrome_5;
    wire [7:0]   syndrome_6;
    wire [7:0]   syndrome_7;
    wire [7:0]   syndrome_8;
    wire [7:0]   syndrome_9;
    wire [7:0]   syndrome_10;
    wire [7:0]   syndrome_11;
    wire [7:0]   syndrome_12;
    wire [7:0]   syndrome_13;
    wire [7:0]   syndrome_14;
    wire [7:0]   syndrome_15;
    wire         doneSyndrome;


   RsDecodeSyndrome RsDecodeSyndrome(
      // Inputs
      .CLK           (CLK),
      .RESET         (RESET),
      .enable        (enable),
      .sync          (startPls),
      .dataIn        (dataInCheck),
      // Outputs
      .syndrome_0    (syndrome_0),
      .syndrome_1    (syndrome_1),
      .syndrome_2    (syndrome_2),
      .syndrome_3    (syndrome_3),
      .syndrome_4    (syndrome_4),
      .syndrome_5    (syndrome_5),
      .syndrome_6    (syndrome_6),
      .syndrome_7    (syndrome_7),
      .syndrome_8    (syndrome_8),
      .syndrome_9    (syndrome_9),
      .syndrome_10   (syndrome_10),
      .syndrome_11   (syndrome_11),
      .syndrome_12   (syndrome_12),
      .syndrome_13   (syndrome_13),
      .syndrome_14   (syndrome_14),
      .syndrome_15   (syndrome_15),
      .done          (doneSyndrome)
   );











   //------------------------------------------------------------------
   // + lambda_0,..., lambda_15
   // + omega_0,..., omega_15
   // + numShifted, doneEuclide
   //- RS EUCLIDE
   //------------------------------------------------------------------
   wire [7:0]   lambda_0;
   wire [7:0]   lambda_1;
   wire [7:0]   lambda_2;
   wire [7:0]   lambda_3;
   wire [7:0]   lambda_4;
   wire [7:0]   lambda_5;
   wire [7:0]   lambda_6;
   wire [7:0]   lambda_7;
   wire [7:0]   lambda_8;
   wire [7:0]   omega_8;
   wire [7:0]   omega_9;
   wire [7:0]   omega_10;
   wire [7:0]   omega_11;
   wire [7:0]   omega_12;
   wire [7:0]   omega_13;
   wire [7:0]   omega_14;
   wire [7:0]   omega_15;
   wire         doneEuclide;
   wire [4:0]   numShifted;


   RsDecodeEuclide  RsDecodeEuclide(
      // Inputs
      .CLK           (CLK),
      .RESET         (RESET),
      .enable        (enable),
      .sync          (doneSyndrome),
      .syndrome_0    (syndrome_0),
      .syndrome_1    (syndrome_1),
      .syndrome_2    (syndrome_2),
      .syndrome_3    (syndrome_3),
      .syndrome_4    (syndrome_4),
      .syndrome_5    (syndrome_5),
      .syndrome_6    (syndrome_6),
      .syndrome_7    (syndrome_7),
      .syndrome_8    (syndrome_8),
      .syndrome_9    (syndrome_9),
      .syndrome_10   (syndrome_10),
      .syndrome_11   (syndrome_11),
      .syndrome_12   (syndrome_12),
      .syndrome_13   (syndrome_13),
      .syndrome_14   (syndrome_14),
      .syndrome_15   (syndrome_15),
      // Outputs
      .lambda_0      (lambda_0),
      .lambda_1      (lambda_1),
      .lambda_2      (lambda_2),
      .lambda_3      (lambda_3),
      .lambda_4      (lambda_4),
      .lambda_5      (lambda_5),
      .lambda_6      (lambda_6),
      .lambda_7      (lambda_7),
      .lambda_8      (lambda_8),
      .omega_8       (omega_8),
      .omega_9       (omega_9),
      .omega_10      (omega_10),
      .omega_11      (omega_11),
      .omega_12      (omega_12),
      .omega_13      (omega_13),
      .omega_14      (omega_14),
      .omega_15      (omega_15),
      .numShifted    (numShifted),
      .done          (doneEuclide)
   );



   reg          doneShiftReg;
   wire         doneChien;
   reg [2:0]   doneReg;
   //------------------------------------------------------------------------
   // + doneShift
   //------------------------------------------------------------------------
   reg          doneShift;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         doneShift <= 1'b0;
      end
      else if (enable == 1'b1) begin
         doneShift <= doneEuclide;
      end
   end



   //------------------------------------------------------------------
   // + numShiftedReg
   //------------------------------------------------------------------
   reg [4:0]   numShiftedReg;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         numShiftedReg <= 5'd0;
      end
      else if ((enable == 1'b1) && (doneEuclide == 1'b1)) begin
         numShiftedReg <= numShifted;
      end
   end



   //------------------------------------------------------------------
   // + lambdaReg_0,..., lambdaReg_15
   //------------------------------------------------------------------
   reg [7:0]   lambdaReg_0;
   reg [7:0]   lambdaReg_1;
   reg [7:0]   lambdaReg_2;
   reg [7:0]   lambdaReg_3;
   reg [7:0]   lambdaReg_4;
   reg [7:0]   lambdaReg_5;
   reg [7:0]   lambdaReg_6;
   reg [7:0]   lambdaReg_7;
   reg [7:0]   lambdaReg_8;


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
      else if ((enable == 1'b1) && (doneEuclide == 1'b1)) begin
         lambdaReg_0 [7:0]  <= lambda_0 [7:0];
         lambdaReg_1 [7:0]  <= lambda_1 [7:0];
         lambdaReg_2 [7:0]  <= lambda_2 [7:0];
         lambdaReg_3 [7:0]  <= lambda_3 [7:0];
         lambdaReg_4 [7:0]  <= lambda_4 [7:0];
         lambdaReg_5 [7:0]  <= lambda_5 [7:0];
         lambdaReg_6 [7:0]  <= lambda_6 [7:0];
         lambdaReg_7 [7:0]  <= lambda_7 [7:0];
         lambdaReg_8 [7:0]  <= lambda_8 [7:0];
      end
   end



   //------------------------------------------------------------------
   // + omegaReg_0,..., omegaReg_15
   //------------------------------------------------------------------
   reg [7:0]   omegaReg_8;
   reg [7:0]   omegaReg_9;
   reg [7:0]   omegaReg_10;
   reg [7:0]   omegaReg_11;
   reg [7:0]   omegaReg_12;
   reg [7:0]   omegaReg_13;
   reg [7:0]   omegaReg_14;
   reg [7:0]   omegaReg_15;


   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         omegaReg_8 [7:0]  <= 8'd0;
         omegaReg_9 [7:0]  <= 8'd0;
         omegaReg_10 [7:0] <= 8'd0;
         omegaReg_11 [7:0] <= 8'd0;
         omegaReg_12 [7:0] <= 8'd0;
         omegaReg_13 [7:0] <= 8'd0;
         omegaReg_14 [7:0] <= 8'd0;
         omegaReg_15 [7:0] <= 8'd0;
      end
      else if ((enable == 1'b1) && (doneEuclide == 1'b1)) begin
         omegaReg_8 [7:0]  <= omega_8 [7:0];
         omegaReg_9 [7:0]  <= omega_9 [7:0];
         omegaReg_10 [7:0] <= omega_10 [7:0];
         omegaReg_11 [7:0] <= omega_11 [7:0];
         omegaReg_12 [7:0] <= omega_12 [7:0];
         omegaReg_13 [7:0] <= omega_13 [7:0];
         omegaReg_14 [7:0] <= omega_14 [7:0];
         omegaReg_15 [7:0] <= omega_15 [7:0];
      end
   end



   //------------------------------------------------------------------
   // + omegaShifted_0, ..., omegaShifted_15
   //- Rs Shift Omega
   //------------------------------------------------------------------
    wire [7:0]   omegaShifted_0;
    wire [7:0]   omegaShifted_1;
    wire [7:0]   omegaShifted_2;
    wire [7:0]   omegaShifted_3;
    wire [7:0]   omegaShifted_4;
    wire [7:0]   omegaShifted_5;
    wire [7:0]   omegaShifted_6;
    wire [7:0]   omegaShifted_7;


   RsDecodeShiftOmega RsDecodeShiftOmega(
      // Inputs
      .omega_8           (omegaReg_8),
      .omega_9           (omegaReg_9),
      .omega_10          (omegaReg_10),
      .omega_11          (omegaReg_11),
      .omega_12          (omegaReg_12),
      .omega_13          (omegaReg_13),
      .omega_14          (omegaReg_14),
      .omega_15          (omegaReg_15),
      // Outputs
      .omegaShifted_0    (omegaShifted_0),
      .omegaShifted_1    (omegaShifted_1),
      .omegaShifted_2    (omegaShifted_2),
      .omegaShifted_3    (omegaShifted_3),
      .omegaShifted_4    (omegaShifted_4),
      .omegaShifted_5    (omegaShifted_5),
      .omegaShifted_6    (omegaShifted_6),
      .omegaShifted_7    (omegaShifted_7),
      // Inputs
      .numShifted        (numShiftedReg)
   );



   //------------------------------------------------------------------
   // + omegaShiftedReg_0,.., omegaShiftedReg_15
   //------------------------------------------------------------------
    reg [7:0]   omegaShiftedReg_0;
    reg [7:0]   omegaShiftedReg_1;
    reg [7:0]   omegaShiftedReg_2;
    reg [7:0]   omegaShiftedReg_3;
    reg [7:0]   omegaShiftedReg_4;
    reg [7:0]   omegaShiftedReg_5;
    reg [7:0]   omegaShiftedReg_6;
    reg [7:0]   omegaShiftedReg_7;


   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         omegaShiftedReg_0 [7:0]  <= 8'd0;
         omegaShiftedReg_1 [7:0]  <= 8'd0;
         omegaShiftedReg_2 [7:0]  <= 8'd0;
         omegaShiftedReg_3 [7:0]  <= 8'd0;
         omegaShiftedReg_4 [7:0]  <= 8'd0;
         omegaShiftedReg_5 [7:0]  <= 8'd0;
         omegaShiftedReg_6 [7:0]  <= 8'd0;
         omegaShiftedReg_7 [7:0]  <= 8'd0;
      end
      else if (enable == 1'b1) begin
         omegaShiftedReg_0 [7:0]  <= omegaShifted_0 [7:0];
         omegaShiftedReg_1 [7:0]  <= omegaShifted_1 [7:0];
         omegaShiftedReg_2 [7:0]  <= omegaShifted_2 [7:0];
         omegaShiftedReg_3 [7:0]  <= omegaShifted_3 [7:0];
         omegaShiftedReg_4 [7:0]  <= omegaShifted_4 [7:0];
         omegaShiftedReg_5 [7:0]  <= omegaShifted_5 [7:0];
         omegaShiftedReg_6 [7:0]  <= omegaShifted_6 [7:0];
         omegaShiftedReg_7 [7:0]  <= omegaShifted_7 [7:0];
      end
   end



   //------------------------------------------------------------------
   // + degreeOmega
   //------------------------------------------------------------------
   wire   [3:0]   degreeOmega;


   RsDecodeDegree  RsDecodeDegree_1(
      // Inputs
      .polynom_0   (omegaShiftedReg_0),
      .polynom_1   (omegaShiftedReg_1),
      .polynom_2   (omegaShiftedReg_2),
      .polynom_3   (omegaShiftedReg_3),
      .polynom_4   (omegaShiftedReg_4),
      .polynom_5   (omegaShiftedReg_5),
      .polynom_6   (omegaShiftedReg_6),
      .polynom_7   (omegaShiftedReg_7),
      .polynom_8   (8'd0),
      // Outputs
      .degree      (degreeOmega)
   );



   //------------------------------------------------------------------
   // + lambdaReg2_0,.., lambdaReg2_15
   //------------------------------------------------------------------
   reg [7:0]   lambdaReg2_0;
   reg [7:0]   lambdaReg2_1;
   reg [7:0]   lambdaReg2_2;
   reg [7:0]   lambdaReg2_3;
   reg [7:0]   lambdaReg2_4;
   reg [7:0]   lambdaReg2_5;
   reg [7:0]   lambdaReg2_6;
   reg [7:0]   lambdaReg2_7;
   reg [7:0]   lambdaReg2_8;


   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         lambdaReg2_0 [7:0]  <= 8'd0;
         lambdaReg2_1 [7:0]  <= 8'd0;
         lambdaReg2_2 [7:0]  <= 8'd0;
         lambdaReg2_3 [7:0]  <= 8'd0;
         lambdaReg2_4 [7:0]  <= 8'd0;
         lambdaReg2_5 [7:0]  <= 8'd0;
         lambdaReg2_6 [7:0]  <= 8'd0;
         lambdaReg2_7 [7:0]  <= 8'd0;
         lambdaReg2_8 [7:0]  <= 8'd0;
      end
      else if (enable == 1'b1) begin
         lambdaReg2_0 [7:0]  <= lambdaReg_0 [7:0];
         lambdaReg2_1 [7:0]  <= lambdaReg_1 [7:0];
         lambdaReg2_2 [7:0]  <= lambdaReg_2 [7:0];
         lambdaReg2_3 [7:0]  <= lambdaReg_3 [7:0];
         lambdaReg2_4 [7:0]  <= lambdaReg_4 [7:0];
         lambdaReg2_5 [7:0]  <= lambdaReg_5 [7:0];
         lambdaReg2_6 [7:0]  <= lambdaReg_6 [7:0];
         lambdaReg2_7 [7:0]  <= lambdaReg_7 [7:0];
         lambdaReg2_8 [7:0]  <= lambdaReg_8 [7:0];
      end
   end



   //------------------------------------------------------------------
   // + degreeLambda
   //------------------------------------------------------------------
   wire [3:0]   degreeLambda;
   RsDecodeDegree  RsDecodeDegree_2(
      // Inputs
      .polynom_0   (lambdaReg2_0),
      .polynom_1   (lambdaReg2_1),
      .polynom_2   (lambdaReg2_2),
      .polynom_3   (lambdaReg2_3),
      .polynom_4   (lambdaReg2_4),
      .polynom_5   (lambdaReg2_5),
      .polynom_6   (lambdaReg2_6),
      .polynom_7   (lambdaReg2_7),
      .polynom_8   (lambdaReg2_8),
      // Outputs
      .degree      (degreeLambda)
   );



   //------------------------------------------------------------------
   // + degreeOmegaReg
   // + degreeLambdaReg
   //------------------------------------------------------------------
   reg [3:0]   degreeOmegaReg;
   reg [3:0]   degreeLambdaReg;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         degreeOmegaReg  <= 4'd0;
         degreeLambdaReg <= 4'd0;
      end
      else if ((enable == 1'b1) && (doneShiftReg == 1'b1)) begin
         degreeOmegaReg  <= degreeOmega;
         degreeLambdaReg <= degreeLambda;
      end
   end



   //------------------------------------------------------------------
   // + doneShiftReg
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         doneShiftReg <= 1'b0;
      end 
      else if (enable == 1'b1) begin
         doneShiftReg <= doneShift;
      end
   end



   //------------------------------------------------------------------
   // + 
   //- RS Chien Search Algorithm
   //------------------------------------------------------------------
   wire [4:0]   numErrorChien;
   wire [7:0]   error;


   RsDecodeChien RsDecodeChien(
      // Inputs
      .CLK            (CLK),
      .RESET          (RESET),
      .enable         (enable),
      .sync           (doneShiftReg),
      .lambdaIn_0     (lambdaReg2_0),
      .lambdaIn_1     (lambdaReg2_1),
      .lambdaIn_2     (lambdaReg2_2),
      .lambdaIn_3     (lambdaReg2_3),
      .lambdaIn_4     (lambdaReg2_4),
      .lambdaIn_5     (lambdaReg2_5),
      .lambdaIn_6     (lambdaReg2_6),
      .lambdaIn_7     (lambdaReg2_7),
      .lambdaIn_8     (lambdaReg2_8),
      .omegaIn_0      (omegaShiftedReg_0),
      .omegaIn_1      (omegaShiftedReg_1),
      .omegaIn_2      (omegaShiftedReg_2),
      .omegaIn_3      (omegaShiftedReg_3),
      .omegaIn_4      (omegaShiftedReg_4),
      .omegaIn_5      (omegaShiftedReg_5),
      .omegaIn_6      (omegaShiftedReg_6),
      .omegaIn_7      (omegaShiftedReg_7),
      // Outputs
      .errorOut       (error),
      .numError       (numErrorChien),
      .done           (doneChien)
   );



   //------------------------------------------------------------------
   // + delayOut
   //- Rs Decode Delay
   //------------------------------------------------------------------
   wire [7:0]   delayOut;
   wire [7:0]   delayIn;


   RsDecodeDelay  RsDecodeDelay(
      // Inputs
      .CLK      (CLK),
      .RESET    (RESET),
      .enable   (enable),
      .dataIn   (delayIn),
      // Outputs
      .dataOut  (delayOut)
   );



   //------------------------------------------------------------------
   // + delayIn, delayedErasureIn, delayedDataIn
   //------------------------------------------------------------------
   wire [7:0]   delayedDataIn;
   assign   delayIn          = dataInCheck;
   assign   delayedDataIn    = delayOut[7:0];



   //------------------------------------------------------------------------
   // + OutputValidReg
   //------------------------------------------------------------------------
   reg         OutputValidReg;
   reg [3:0]   startReg;

   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         OutputValidReg   <= 1'b0;
      end
      else if (enable == 1'b1) begin
         if (startReg[1] == 1'b1) begin
            OutputValidReg   <= 1'b1;
         end
         else if (doneReg[0] == 1'b1) begin
            OutputValidReg   <= 1'b0;
         end
      end
   end



   //------------------------------------------------------------------
   // + startReg, doneReg
   //------------------------------------------------------------------
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         startReg   [3:0] <= 4'd0;
         doneReg   [2:0]  <= 3'd0;
      end
      else if (enable == 1'b1) begin
         startReg [3:0] <= {doneShiftReg, startReg[3:1]};
         doneReg  [2:0] <= {doneChien, doneReg[2:1]};
      end
   end



   //------------------------------------------------------------------
   // + numErrorLambdaReg
   //------------------------------------------------------------------
   reg [3:0]   numErrorLambdaReg;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         numErrorLambdaReg   [3:0] <= 4'd0;
      end
      else if ((enable == 1'b1) && (startReg[1] == 1'b1)) begin
         numErrorLambdaReg   <= degreeLambdaReg;
      end
   end



   //------------------------------------------------------------------
   // + degreeErrorReg
   //------------------------------------------------------------------
   reg         degreeErrorReg;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         degreeErrorReg   <= 1'b0;
      end
      else if ((enable == 1'b1) && (startReg[1] == 1'b1)) begin
         if (({1'b0, degreeOmegaReg}) <= {1'b0, degreeLambdaReg}) begin
            degreeErrorReg   <= 1'b0;
         end
         else begin
            degreeErrorReg   <= 1'b1;
         end
      end
   end



   //------------------------------------------------------------------
   // + numErrorReg
   //------------------------------------------------------------------
   reg    [4:0]   numErrorReg;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         numErrorReg [4:0] <= 5'd0;
      end
      else if ((enable == 1'b1) && (doneReg[0] == 1'b1)) begin
         numErrorReg [4:0] <= numErrorChien[4:0];
      end
   end



   //------------------------------------------------------------------
   // + failReg
   //------------------------------------------------------------------
   reg          failReg;

   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         failReg <= 1'b0;
      end
      else if ((enable == 1'b1) && (doneReg[0] == 1'b1)) begin
         if (({1'd0, numErrorLambdaReg} == numErrorChien) && (degreeErrorReg == 1'b0)) begin
            failReg <= 1'b0;
         end
         else begin
            failReg <= 1'b1;
         end
      end
   end



   //------------------------------------------------------------------
   // + DataOutInner
   //------------------------------------------------------------------
   reg [7:0]   DataOutInner;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         DataOutInner <= 8'd0;
      end
      else begin
         DataOutInner <= delayedDataIn ^ error;
      end
   end



   //------------------------------------------------------------------
   // + DelayedDataOutInner
   //------------------------------------------------------------------
   reg [7:0]   DelayedDataOutInner;
   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         DelayedDataOutInner <= 8'd0;
      end
      else begin
         DelayedDataOutInner <= delayedDataIn;
      end
   end



   //------------------------------------------------------------------
   // - enableFF 
   //------------------------------------------------------------------
   reg       enableFF;


   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         enableFF <= 1'b0;
      end
      else begin
         enableFF <= enable;
      end
   end



   //------------------------------------------------------------------
   // - FF for Outputs 
   //------------------------------------------------------------------
   reg         startRegInner;
   reg         doneRegInner;
   reg [7:0]   numErrorRegInner;
   reg         failRegInner;


   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         startRegInner       <= 1'b0;
         doneRegInner        <= 1'b0;
         numErrorRegInner    <= 8'd0;
         failRegInner        <= 1'b0;
      end
      else begin
         startRegInner       <= startReg[0];
         doneRegInner        <= doneReg[0];
         numErrorRegInner    <= { 3'd0, numErrorReg[4:0]};
         failRegInner        <= failReg;
      end
   end



   //------------------------------------------------------------------
   // - OutputValidRegInner 
   //------------------------------------------------------------------
   reg         OutputValidRegInner;

   always @(posedge CLK or negedge RESET) begin
      if (~RESET) begin
         OutputValidRegInner <= 1'b0;
      end
      else if (enableFF == 1'b1) begin
         OutputValidRegInner <= OutputValidReg;
      end
      else begin
         OutputValidRegInner <= 1'b0;
      end
   end



   //------------------------------------------------------------------
   // - Output Ports
   //------------------------------------------------------------------
   assign   outEnable   = OutputValidRegInner;
   assign   outStartPls = startRegInner;
   assign   outDone     = doneRegInner;
   assign   outData     = DataOutInner;
   assign   errorNum    = numErrorRegInner;
   assign   delayedData = DelayedDataOutInner;
   assign   fail        = failRegInner;


endmodule
