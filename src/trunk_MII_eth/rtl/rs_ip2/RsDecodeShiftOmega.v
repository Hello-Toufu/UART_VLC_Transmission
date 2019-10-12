//===================================================================
// Module Name : RsDecodeShiftOmega
// File Name   : RsDecodeShiftOmega.v
// Function    : Rs Decoder Shift Omega Module
// 
// Revision History:
// Date          By           Version    Change Description
//===================================================================
// 2009/02/03  Gael Sapience     1.0       Original
//
//===================================================================
// (C) COPYRIGHT 2009 SYSTEM LSI CO., Ltd.
//


module RsDecodeShiftOmega(
   omega_8,           // omega polynom 8
   omega_9,           // omega polynom 9
   omega_10,          // omega polynom 10
   omega_11,          // omega polynom 11
   omega_12,          // omega polynom 12
   omega_13,          // omega polynom 13
   omega_14,          // omega polynom 14
   omega_15,          // omega polynom 15
   omegaShifted_0,    // omega shifted polynom 0
   omegaShifted_1,    // omega shifted polynom 1
   omegaShifted_2,    // omega shifted polynom 2
   omegaShifted_3,    // omega shifted polynom 3
   omegaShifted_4,    // omega shifted polynom 4
   omegaShifted_5,    // omega shifted polynom 5
   omegaShifted_6,    // omega shifted polynom 6
   omegaShifted_7,    // omega shifted polynom 7
   numShifted         // shift amount
);


   input [7:0] omega_8;            // omega polynom 8
   input [7:0] omega_9;            // omega polynom 9
   input [7:0] omega_10;           // omega polynom 10
   input [7:0] omega_11;           // omega polynom 11
   input [7:0] omega_12;           // omega polynom 12
   input [7:0] omega_13;           // omega polynom 13
   input [7:0] omega_14;           // omega polynom 14
   input [7:0] omega_15;           // omega polynom 15
   input [4:0] numShifted;         // shift amount

   output [7:0] omegaShifted_0;    // omega shifted polynom 0
   output [7:0] omegaShifted_1;    // omega shifted polynom 1
   output [7:0] omegaShifted_2;    // omega shifted polynom 2
   output [7:0] omegaShifted_3;    // omega shifted polynom 3
   output [7:0] omegaShifted_4;    // omega shifted polynom 4
   output [7:0] omegaShifted_5;    // omega shifted polynom 5
   output [7:0] omegaShifted_6;    // omega shifted polynom 6
   output [7:0] omegaShifted_7;    // omega shifted polynom 7



   //------------------------------------------------------------------------
   //+ omegaShifted_0,..., omegaShifted_15
   //- omegaShifted registers
   //------------------------------------------------------------------------
   reg [7:0]   omegaShiftedInner_0;
   reg [7:0]   omegaShiftedInner_1;
   reg [7:0]   omegaShiftedInner_2;
   reg [7:0]   omegaShiftedInner_3;
   reg [7:0]   omegaShiftedInner_4;
   reg [7:0]   omegaShiftedInner_5;
   reg [7:0]   omegaShiftedInner_6;
   reg [7:0]   omegaShiftedInner_7;


   always @ (numShifted or omega_8 or omega_9 or omega_10 or omega_11 or omega_12 or omega_13 or omega_14 or omega_15 ) begin
      case (numShifted)
         (5'd8): begin
            omegaShiftedInner_0 [7:0]  = omega_8 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_9 [7:0];
            omegaShiftedInner_2 [7:0]  = omega_10 [7:0];
            omegaShiftedInner_3 [7:0]  = omega_11 [7:0];
            omegaShiftedInner_4 [7:0]  = omega_12 [7:0];
            omegaShiftedInner_5 [7:0]  = omega_13 [7:0];
            omegaShiftedInner_6 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_7 [7:0]  = omega_15 [7:0];
         end
         (5'd9): begin
            omegaShiftedInner_0 [7:0]  = omega_9 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_10 [7:0];
            omegaShiftedInner_2 [7:0]  = omega_11 [7:0];
            omegaShiftedInner_3 [7:0]  = omega_12 [7:0];
            omegaShiftedInner_4 [7:0]  = omega_13 [7:0];
            omegaShiftedInner_5 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_6 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         (5'd10): begin
            omegaShiftedInner_0 [7:0]  = omega_10 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_11 [7:0];
            omegaShiftedInner_2 [7:0]  = omega_12 [7:0];
            omegaShiftedInner_3 [7:0]  = omega_13 [7:0];
            omegaShiftedInner_4 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_5 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         (5'd11): begin
            omegaShiftedInner_0 [7:0]  = omega_11 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_12 [7:0];
            omegaShiftedInner_2 [7:0]  = omega_13 [7:0];
            omegaShiftedInner_3 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_4 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_5 [7:0]  = 8'd0;
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         (5'd12): begin
            omegaShiftedInner_0 [7:0]  = omega_12 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_13 [7:0];
            omegaShiftedInner_2 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_3 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_4 [7:0]  = 8'd0;
            omegaShiftedInner_5 [7:0]  = 8'd0;
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         (5'd13): begin
            omegaShiftedInner_0 [7:0]  = omega_13 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_2 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_3 [7:0]  = 8'd0;
            omegaShiftedInner_4 [7:0]  = 8'd0;
            omegaShiftedInner_5 [7:0]  = 8'd0;
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         (5'd14): begin
            omegaShiftedInner_0 [7:0]  = omega_14 [7:0];
            omegaShiftedInner_1 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_2 [7:0]  = 8'd0;
            omegaShiftedInner_3 [7:0]  = 8'd0;
            omegaShiftedInner_4 [7:0]  = 8'd0;
            omegaShiftedInner_5 [7:0]  = 8'd0;
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         (5'd15): begin
            omegaShiftedInner_0 [7:0]  = omega_15 [7:0];
            omegaShiftedInner_1 [7:0]  = 8'd0;
            omegaShiftedInner_2 [7:0]  = 8'd0;
            omegaShiftedInner_3 [7:0]  = 8'd0;
            omegaShiftedInner_4 [7:0]  = 8'd0;
            omegaShiftedInner_5 [7:0]  = 8'd0;
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
         default: begin
            omegaShiftedInner_0 [7:0]  = 8'd0;
            omegaShiftedInner_1 [7:0]  = 8'd0;
            omegaShiftedInner_2 [7:0]  = 8'd0;
            omegaShiftedInner_3 [7:0]  = 8'd0;
            omegaShiftedInner_4 [7:0]  = 8'd0;
            omegaShiftedInner_5 [7:0]  = 8'd0;
            omegaShiftedInner_6 [7:0]  = 8'd0;
            omegaShiftedInner_7 [7:0]  = 8'd0;
         end
        endcase
    end



   //------------------------------------------------------------------------
   //- Output Ports
   //------------------------------------------------------------------------
   assign omegaShifted_0   = omegaShiftedInner_0;
   assign omegaShifted_1   = omegaShiftedInner_1;
   assign omegaShifted_2   = omegaShiftedInner_2;
   assign omegaShifted_3   = omegaShiftedInner_3;
   assign omegaShifted_4   = omegaShiftedInner_4;
   assign omegaShifted_5   = omegaShiftedInner_5;
   assign omegaShifted_6   = omegaShiftedInner_6;
   assign omegaShifted_7   = omegaShiftedInner_7;



endmodule
