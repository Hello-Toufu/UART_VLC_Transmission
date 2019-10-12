//--------------------------------------------------------------------------
//--
//--                  (C) COPYRIGHT 2005-2009 SYNOPSYS, INC.
//--                            ALL RIGHTS RESERVED
//--
//--  This software and the associated documentation are confidential and
//--  proprietary to Synopsys, Inc.  Your use or disclosure of this
//--  software is subject to the terms and conditions of a written
//--  license agreement between you, or your company, and Synopsys, Inc.
//--
//--  The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2008/08/12 $
// File Version     :        $Revision: #11 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Flow control (DWC_gmac_mtc_ftx.v)
//
// DESCRIPTION:
// This module generates pause control frame in full duplex mode based on the
// flow control request with appropariate pause time value from either 
// S/W(through CSR) or H/W(through mti_flowtrl_i).
//--------------------------------------------------------------------------

module DWC_gmac_mtc_ftx (
        // Clocks and reset
        clk_tx_i,
        rst_clk_tx_n,

        // flow control interface
        sct_txflowctrl_e,
        sct_disable_zqpf,
        sct_txctrlframe,
        sct_duplexmode,
        sct_flowthresh,
        mti_flowctrl_i,
        ftx_txctrl_done,

        // CSR signals
        sct_pausetime,
        sct_macaddr0,

        // TFC interface
        tfc_ftx_ack,
        ftx_data_valid,
        ftx_data,
        ftx_sof,
        ftx_eof,
        
        stx_pause_quanta,
        count_4,
        dword_cnt
);

// Input and Output port declarations
// Clocks and reset
  input            clk_tx_i;                // Transmit clock (2.5/25/125)Mhz. 
  input            rst_clk_tx_n;            // Active low reset synchronous to clk_tx_i.

// flow control interface
  input            sct_txflowctrl_e;        // Flow control Enable from CSR. 
  input            sct_disable_zqpf;        // Disable Automatic Zero Quanta Pause Frames.
  input            sct_txctrlframe;         // S/W request to transmit control frame.
  input            sct_duplexmode;          // Duplexmode sync'd to Tx clock.
  input  [1:0]     sct_flowthresh;          // Pause Low Threshold from CSR.
  input            mti_flowctrl_i;          // H/W request to transmit control frame. 
  output           ftx_txctrl_done;           // control frame transmitted.

// TFC interface
  input             tfc_ftx_ack;            // Ack for control frame.
  output            ftx_data_valid;         // valid data signal for control frame.  
  output [7:0]      ftx_data;               // control frame data.
  output            ftx_sof;                // Start of frame.
  output            ftx_eof;                // End of frame.

// CSR signals
  input  [15:0]    sct_pausetime;           // Pause time sent in control frame
  input  [47:0]    sct_macaddr0;            // Source address

  input            stx_pause_quanta;        // pause quanta from MTE.
  input  [1:0]     count_4;                 // Mod-4 count from TFC
  input  [3:0]     dword_cnt;               // dowrd count frim TFC

  
// Internal reg and wire declarations
  reg             txctrlframe_lat;            // delayed Transmit control frame 
                                            // request from S/W i.e CSR.     
  reg             mti_flowctrl_d;           // delayed flow control request 
                                            // from application
  reg  [15:0]     tx_pausetimer;            // A decrement counter keeping track
                                            // of the available pause time.
  reg  [2:0]      ftx_state;                // Current FTX state.
  reg  [2:0]      next_ftx_state;           // Combinationally derived next FTX state.
  reg             ftx_sof;                  // Start of pause control frame to TFC.
  reg             ftx_txctrl_done;          // Signal asserted when control frame 
                                            // transmission is complete.
  reg  [7:0]      ftx_data;                 // Control frame data to TFC.
  reg             ack_lat;                  // Latched tfc ack after pause opcode
                                            // transfer
   
  
  wire            flowctrl_assrt;           // Signal indicating a rising edge 
                                            // on mti_flowctrl_i.   
  wire            flowctrl_deassrt;         // signal indicating a falling edge 
                                            //on mti_flowctrl_i.
  wire [15:0]     pause_time_thrshld;       // pause time threshold.
  wire            send_next_pause;          // request to send next frame when 
                                            // pause timer reaches the pause time
                                            // threshold.
  wire [47:0]     spl_multicast_addr;       // special multicast address used 
                                            // for control frames.
  wire [15:0]     pause_opcode;             // Pause frame opcode
  wire [15:0]     pause_type;               // Control frame type. 
  wire [15:0]     tx_pausetime;             // Pause time sent in control frames.
  wire            txctrlframe;              // Qualified transmit control frame request.
                                            
// parameter definitions.
  parameter [2:0]  FTX_IDLE = 3'd0,
                   FTX_DATA = 3'd1,
                   FTX_END_OF_XFER = 3'd2;

//---------------------------------
// H/W or S/W Flow control Request.
//---------------------------------
 assign flowctrl_assrt = mti_flowctrl_i & (!mti_flowctrl_d) & sct_duplexmode;
 assign flowctrl_deassrt = mti_flowctrl_d & (!mti_flowctrl_i) & !sct_disable_zqpf;
 assign txctrlframe = (txctrlframe_lat | sct_txctrlframe) & sct_txflowctrl_e & sct_duplexmode;
 
 always @(`TX_RST_MODE) begin
   if (~rst_clk_tx_n) begin
     txctrlframe_lat <= `L;
   end
   else if (sct_txctrlframe & ~txctrlframe_lat)
     txctrlframe_lat <= `H;
   else if (ftx_txctrl_done)
     txctrlframe_lat <= `L;
 end    

 //New pause control frame transmission is triggered based on the value of mti_flowctrl_d 
 //before and after the transmission of control frame.
 always @(`TX_RST_MODE) begin
   if (~rst_clk_tx_n) begin
     mti_flowctrl_d <= `L;
   end
   else if ((ftx_state[FTX_IDLE] & (dword_cnt == 4'h0)) | 
            (ftx_state[FTX_DATA] & ~ack_lat))  
     mti_flowctrl_d <= mti_flowctrl_i & sct_txflowctrl_e & sct_duplexmode;
 end    

 //Ack from TFC latched after opcode is sent.  
 always @(`TX_RST_MODE) begin
   if (~rst_clk_tx_n) begin
     ack_lat <= `L;
   end
   else if (ftx_state[FTX_IDLE]) 
     ack_lat <= `L;
   else if (ftx_state[FTX_DATA] & tfc_ftx_ack & 
            ({dword_cnt,count_4} == 6'b001110))
     ack_lat <= `H;
 end    
 
 // pause time threshold indicating the lower limit of pause
 // time below which a new pause control frame would be scheduled
 // for transmission upon H/W request.
 assign pause_time_thrshld = (sct_flowthresh == 2'b01) ? 16'h001C:
                              (sct_flowthresh == 2'b10) ? 16'h0090:
                              (sct_flowthresh == 2'b11) ? 16'h0100: 16'h0004;

 assign send_next_pause = mti_flowctrl_d & (tx_pausetimer == pause_time_thrshld);


//------------
// Pause timer
//------------
// Pause timer keeps track of the diminishing pause time which decrements with every 
// pause quanta i.e 512 bit times.

  assign tx_pausetime = (txctrlframe | mti_flowctrl_d | sct_disable_zqpf) ? sct_pausetime: 16'h0000;

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tx_pausetimer <= 16'h0000;
    end
    else begin
      if (ftx_eof) begin 
        tx_pausetimer <= tx_pausetime;
      end
      else if (stx_pause_quanta & (|tx_pausetimer)) begin
        tx_pausetimer <= tx_pausetimer - 1;
      end
    end  
  end
  

//-------------
// Control FSM
//-------------
// The FSM schedules the transfer of pause control frames upon S/W or H/W flow 
// control request.In case of S/W transmit control frame request,FSM completes the pause
// frame transmission, sends an acknowledgment to the CSR ,waits for the request to become 
// inactive and the moves to IDLE state.

// sequential next state assignment.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      ftx_state <= 3'b001;
    end
    else 
      ftx_state <= next_ftx_state;
  end
 
// combinational logic deriving the next state.
  always @(*)
  begin
    next_ftx_state = 3'b000;
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off    
    case (1'b1) // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
      ftx_state[FTX_IDLE]: // Idle
        begin
	  if (txctrlframe | send_next_pause | 
              ((flowctrl_assrt | flowctrl_deassrt) & sct_txflowctrl_e)) begin  
            next_ftx_state[FTX_DATA] = `H;
          end 
          else 
            next_ftx_state[FTX_IDLE] = `H;
        end    
      
      ftx_state[FTX_DATA]: // Control frame transfer
        begin
          if (tfc_ftx_ack & (dword_cnt == 4'hF) & (count_4 == 2'b11)) begin
            next_ftx_state[FTX_END_OF_XFER] = `H;
          end
          else
            next_ftx_state[FTX_DATA] = `H;
        end

      ftx_state[FTX_END_OF_XFER]: //End of control frame transfer
        begin
          if (~txctrlframe) begin
            next_ftx_state[FTX_IDLE] = `H;
          end
          else
            next_ftx_state[FTX_END_OF_XFER] = `H;
        end
    endcase
// leda W225 on    
  end

//----------------------
// TFC interface Outputs
//----------------------
  
  assign ftx_data_valid = ftx_state[FTX_DATA];
  assign ftx_eof = (dword_cnt == 4'hE) & (count_4 == 2'b11) & tfc_ftx_ack;
  assign spl_multicast_addr = 48'h0180C2000001;
  assign pause_opcode = 16'h0001;
  assign pause_type = 16'h8808;
  
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      ftx_sof <= `L;
    end
    else begin
      if (ftx_sof & tfc_ftx_ack) begin
        ftx_sof <= `L;
      end  
      else if (next_ftx_state[FTX_DATA] & ftx_state[FTX_IDLE]) begin
        ftx_sof <= `H;
      end
    end
  end  

  always @(*)
    begin
      case ({dword_cnt,count_4})
        6'b000000: ftx_data = spl_multicast_addr[47:40];
        6'b000001: ftx_data = spl_multicast_addr[39:32]; 
        6'b000010: ftx_data = spl_multicast_addr[31:24]; 
        6'b000011: ftx_data = spl_multicast_addr[23:16]; 
        6'b000100: ftx_data = spl_multicast_addr[15:8]; 
        6'b000101: ftx_data = spl_multicast_addr[7:0];   
        6'b000110: ftx_data = sct_macaddr0[7:0];  
        6'b000111: ftx_data = sct_macaddr0[15:8];
        6'b001000: ftx_data = sct_macaddr0[23:16];
        6'b001001: ftx_data = sct_macaddr0[31:24];
        6'b001010: ftx_data = sct_macaddr0[39:32]; 
        6'b001011: ftx_data = sct_macaddr0[47:40];  
        6'b001100: ftx_data = pause_type[15:8];
        6'b001101: ftx_data = pause_type[7:0]; 
        6'b001110: ftx_data = pause_opcode[15:8]; 
        6'b001111: ftx_data = pause_opcode[7:0]; 
        6'b010000: ftx_data = tx_pausetime[15:8]; 
        6'b010001: ftx_data = tx_pausetime[7:0]; 
        default:   ftx_data = 8'h00; 
      endcase
    end

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      ftx_txctrl_done <= `L;
    end
    else 
      ftx_txctrl_done <= ftx_state[FTX_DATA] & next_ftx_state[FTX_END_OF_XFER];
  end  

  
endmodule
