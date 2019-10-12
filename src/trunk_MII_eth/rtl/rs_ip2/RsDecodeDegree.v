//===================================================================
// Module Name : RsDecodeDegree
// File Name   : RsDecodeDegree.v
// Function    : Rs Decoder Degree Module
// 
// Revision History:
// Date          By           Version    Change Description
//===================================================================
// 2009/02/03  Gael Sapience     1.0       Original
//
//===================================================================
// (C) COPYRIGHT 2009 SYSTEM LSI CO., Ltd.
//


module RsDecodeDegree(
   polynom_0,
   polynom_1,
   polynom_2,
   polynom_3,
   polynom_4,
   polynom_5,
   polynom_6,
   polynom_7,
   polynom_8,
   degree
);


   input  [7:0]   polynom_0;    // polynom 0
   input  [7:0]   polynom_1;    // polynom 1
   input  [7:0]   polynom_2;    // polynom 2
   input  [7:0]   polynom_3;    // polynom 3
   input  [7:0]   polynom_4;    // polynom 4
   input  [7:0]   polynom_5;    // polynom 5
   input  [7:0]   polynom_6;    // polynom 6
   input  [7:0]   polynom_7;    // polynom 7
   input  [7:0]   polynom_8;    // polynom 8
   output [3:0]   degree;       // polynom degree



   //------------------------------------------------------------------------
   //- registers
   //------------------------------------------------------------------------
//---------------------------------------------------------------
//- step 0
//---------------------------------------------------------------
wire [3:0]   winner0Step0;
assign winner0Step0 =(polynom_1 [7:0] == 8'd0) ? ((polynom_0 [7:0] == 8'd0) ? 4'd0 : 4'd0):  4'd1;
wire [3:0]   winner1Step0;
assign winner1Step0 =(polynom_3 [7:0] == 8'd0) ? ((polynom_2 [7:0] == 8'd0) ? 4'd0 : 4'd2):  4'd3;
wire [3:0]   winner2Step0;
assign winner2Step0 =(polynom_5 [7:0] == 8'd0) ? ((polynom_4 [7:0] == 8'd0) ? 4'd0 : 4'd4):  4'd5;
wire [3:0]   winner3Step0;
assign winner3Step0 =(polynom_7 [7:0] == 8'd0) ? ((polynom_6 [7:0] == 8'd0) ? 4'd0 : 4'd6):  4'd7;
wire [3:0]   winner4Step0;
assign winner4Step0 =(polynom_8 [7:0] == 8'd0) ? 4'd0 : 4'd8;
//---------------------------------------------------------------
//- step 1
//---------------------------------------------------------------
wire [3:0]   winner0Step1;
assign winner0Step1 =( winner1Step0 [3:0] < winner0Step0  [3:0]) ? winner0Step0  [3:0]:  winner1Step0  [3:0];
wire [3:0]   winner1Step1;
assign winner1Step1 =( winner3Step0 [3:0] < winner2Step0  [3:0]) ? winner2Step0  [3:0]:  winner3Step0  [3:0];
//---------------------------------------------------------------
//- step 2
//---------------------------------------------------------------
wire [3:0]   winner0Step2;
assign winner0Step2 =( winner1Step1 [3:0] < winner0Step1  [3:0]) ? winner0Step1  [3:0]:  winner1Step1  [3:0];
//---------------------------------------------------------------
//- step 3
//---------------------------------------------------------------
wire [3:0]   winner0Step3;
assign winner0Step3 =( winner4Step0 [3:0] < winner0Step2  [3:0]) ? winner0Step2  [3:0]:  winner4Step0  [3:0];
//---------------------------------------------------------------
//---------------------------------------------------------------
assign degree [3:0] =  winner0Step3 [3:0] ;



endmodule
