`timescale 1ps/1ps
/*
module for asynchronous communication, for expample, the serial port of PC
8/N/1
8 bits data, no parity check, 1 bit stop
adream307@gmail.com
2012-2-6
20190111 modified by ZDF 
*/

module UART(
	//*********** global clock and reset signal *********
	iCLK,	// system clock
	iRST_N,	// system reset
	//*********** serial lines ***************
	iRX,	//receiving line
	oTX,	//sending  line
	//************ controal signals *****************
	oR,		//receiving finish. this signal is in low level during receiving processing, it turn to high level after receiving finish.
	oT,		//sending finish. this signal is in low level during sending processing, it turn to high level after sending finish.
	iT,		//seding request. sending process will starts when this signal turn to high level from low level.
	iTDATA,	//the data for sending. 
		    //Attention: iTDATA should keep 2 clk at least, for it will be sampled when rTsyn_1 == 1
	oRDATA	//the data that received.
);

input iCLK;
input iRST_N;
input iRX;
output oTX;
output oR;
output oT;
input iT;
input [7:0] iTDATA;
output [7:0] oRDATA;

reg oTX;
reg oR;
reg oT;
reg [7:0] oRDATA;

parameter CLK_FREQ=200000;	//system clock frequence.
parameter BAUD_RATE=9600;	//the baud rate

localparam BAUD_CNT=CLK_FREQ/BAUD_RATE;	//baud rate count
localparam BAUD_1=BAUD_CNT/4;		//the first sampling point
localparam BAUD_2=BAUD_CNT/2;		//the sencond sampling point
localparam BAUD_3=(3*BAUD_CNT)/4;	//the thirt sampling point
reg [15:0] rRBaudCnt;	//baud rate count for seding
reg [15:0] rTBaudCnt;	//baud rate count for receiving

reg [7:0] rRData;	//received data
reg [7:0] rTData;	//seding data

reg [2:0] rSample_1;	//the count of sampling point which in high level
reg [2:0] rRBitCnt;		//bits count for receiving
reg [2:0] rTBitCnt;		//bits count for sending

reg rRX_syn,rRX_syn_0;	//iRX synch
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N){rRX_syn,rRX_syn_0}<=2'b11;
	else {rRX_syn,rRX_syn_0}<={rRX_syn_0,iRX};
end

reg [2:0] Rsta;	//receiving state machine
localparam Rsta_0=3'b000;
localparam Rsta_1=3'b001;
localparam Rsta_2=3'b010;
localparam Rsta_3=3'b100;
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) Rsta<=Rsta_0;
	else begin
		case(Rsta)
			Rsta_0:if(!rRX_syn) Rsta<=Rsta_1;	// iRX turn to low level from high leve indicates the receiving process starting
			Rsta_1:begin	//receiving the start bit
				if(rRBaudCnt==BAUD_CNT)begin
					if(rSample_1[1]) Rsta<=Rsta_0;	//wait for starting signal
					else Rsta<=Rsta_2;	//receiving date bits
				end
			end
			Rsta_2:begin //receiving data
				if(rRBitCnt==3'd7)begin
					if(rRBaudCnt==BAUD_CNT) Rsta<=Rsta_3;	//receiving stop bit
				end
			end
			Rsta_3:begin //receiving stop bit
				if(rRBaudCnt==BAUD_CNT)begin
					if(!rRX_syn) Rsta<=Rsta_1;
					else Rsta<=Rsta_0;
				end
			end
			default: Rsta<=Rsta_0;
		endcase
	end
end

wire wSampleEN=(rRBaudCnt==BAUD_1) | (rRBaudCnt==BAUD_2) | (rRBaudCnt==BAUD_3);
//rSample_1 will add if the sampling point is in high level
//rSample_1
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) rSample_1<=3'b0;
	else begin
		if(rRBaudCnt<BAUD_1)rSample_1<=3'b0;
		else if(wSampleEN)begin
			if(rRX_syn) rSample_1<={rSample_1[1:0],1'b1};
		end
	end
end

//bit count for receiving
//rRBitCnt
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) rRBitCnt<=3'd0;
	else if(Rsta==Rsta_2)begin
		if(rRBaudCnt==BAUD_CNT) rRBitCnt<=rRBitCnt+3'd1;
	end
	else rRBitCnt<=3'd0;
end

//rRBaudCnt
//baud rate count for receiving
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) rRBaudCnt<=0;
	else if(Rsta==Rsta_0)begin
		if(!rRX_syn) rRBaudCnt<=1;
		else rRBaudCnt<=0;
	end
	else begin
		if(rRBaudCnt==BAUD_CNT) rRBaudCnt<=1;
		else rRBaudCnt<=rRBaudCnt+1;
	end
end

//received data
//rRData
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N)rRData<=8'd0;
	else if(Rsta==Rsta_2)begin
		if(rRBaudCnt==BAUD_CNT)begin
			if(rSample_1[1]) rRData<={1'b1,rRData[7:1]};
			else rRData<={1'b0,rRData[7:1]};
		end
	end
end

//receiving finish
//oR
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) oR<=1'b0;   //20190117 modified by ZDF 
	else begin
		case(Rsta)
			Rsta_0:oR<=1'b0;//20190123 modified by ZDF oR
			Rsta_1:oR<=1'b0;
			Rsta_2:oR<=1'b0;
			Rsta_3:begin
				if(rRBaudCnt==BAUD_CNT)begin
					if(rSample_1[1]) oR<=1'b1;
					else oR<=1'b0;
				end
			end
		endcase
	end
end

//received data
//oRDATA
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) oRDATA<=8'd0;
	else if(Rsta==Rsta_3)begin
		if(rRBaudCnt==BAUD_CNT)begin
			if(rSample_1[1]) oRDATA<=rRData;
		end
	end
end

reg rTsyn,rTsyn_1,rTsyn_0;	//sending request
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) {rTsyn,rTsyn_1,rTsyn_0}<=3'b111;
	else {rTsyn,rTsyn_1,rTsyn_0}<={rTsyn_1,rTsyn_0,iT};
end

//sending state machine
reg[2:0] Tsta;
localparam Tsta_0=3'b000;
localparam Tsta_1=3'b001;
localparam Tsta_2=3'b010;
localparam Tsta_3=3'b100;
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) Tsta<=Tsta_0;
	else begin
		case(Tsta)
			Tsta_0:if({rTsyn,rTsyn_1}==2'b01) Tsta<=Tsta_1;
			Tsta_1:if(rTBaudCnt==BAUD_CNT)Tsta<=Tsta_2;	//sending start bit
			Tsta_2:begin //sending data
				if(rTBitCnt==3'd7)begin
					if(rTBaudCnt==BAUD_CNT) Tsta<=Tsta_3;
				end
			end
			Tsta_3:begin 	//sending stop bit
				if(rTBaudCnt==BAUD_CNT)begin
					if({rTsyn,rTsyn_1}==2'b01) Tsta<=Tsta_0;//20190111 ZDF old:Tsta<=Tsta_1;
					else Tsta<=Tsta_0;
				end
			end
			default:Tsta<=Tsta_0;
		endcase
	end
end

//sending bit count
//rTBitCnt
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) rTBitCnt<=3'd0;
	else if(Tsta==Tsta_2)begin
		if(rTBaudCnt==BAUD_CNT)rTBitCnt<=rTBitCnt+3'd1;
	end
	else rTBitCnt<=3'd0;
end

//baud rate count for sending
//rTBaudCnt
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) rTBaudCnt<=0;
	else if(Tsta==Tsta_0)begin
		if({rTsyn,rTsyn_1}==2'b01) rTBaudCnt<=1;
		else rTBaudCnt<=0;
	end
	else begin
		if(rTBaudCnt==BAUD_CNT) rTBaudCnt<=1;
		else rTBaudCnt<=rTBaudCnt+1;
	end
end

//sending data
//rTData
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) rTData<=8'd0;
	else if(Tsta==Tsta_0)begin
		if({rTsyn,rTsyn_1}==2'b01)begin 
			rTData<=iTDATA;
			//$display("%d",iTDATA); //just for debug
		end
	end
	else if(Tsta==Tsta_2)begin
		if(rTBaudCnt==BAUD_CNT)begin
			rTData<={1'b0,rTData[7:1]};
		end
	end
end

//the sending line
//oTX
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) oTX<=1'b1;
	else begin
		case(Tsta)
			Tsta_0:oTX<=1'b1;
			Tsta_1:oTX<=1'b0;	//sending start bit
			Tsta_2:begin	//sending data
				if(rTBaudCnt==1) oTX<=rTData[0];
			end
			Tsta_3:oTX<=1'b1;	//sending stop bit
		endcase
	end
end

//sending finish
//oT
always@(posedge iCLK or negedge iRST_N)begin
	if(!iRST_N) oT<=1'b1;
	else if(Tsta==Tsta_0) oT<=1'b1;
	else oT<=1'b0;
end

endmodule
