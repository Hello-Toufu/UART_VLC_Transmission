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
// Date             :        $Date: 2007/11/02 $
// File Version     :        $Revision: #14 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Frame control (DWC_gmac_mtc_tfc.v)
//
// DESCRIPTION:
// This module interfaces with the transmit bus interface unit and transforms
// 32-bit frame data to 8-bit data.This module also priortises the normal and 
// control frame request and sends the appropariate frame. This block also 
// adds pads and CRC based on the frame length and padding,CRC inclusion
// request from the application.
//--------------------------------------------------------------------------

module DWC_gmac_mtc_tfc (
        clk_tx_i,
                         rst_clk_tx_n,
                         // TBU Interface signals
                         tbu_data_valid,
                         tbu_data,
                         tbu_be,
                         tbu_sof,
                         tbu_eof,
                         tfc_rdy,
                         tfc_abort,
                         // TPE Interface signals 
                         tfc_data_valid,
                         tfc_data,
                         tfc_sof,
                         tfc_eof,
                         tpe_ack,
                         tpe_abort,
                         // TFC <-> TPE request handshake signals
                         tfc_req,
                         tpe_gnt,
                         // FTX Interface signals
                         ftx_data_valid,
                         ftx_data,
                         ftx_sof,
                         ftx_eof,
                         tfc_ftx_ack,
                         // TX byte counter signals
                         count_4,
                         dword_cnt,
                         // CTX Interface signals
                         ctx_data,
                         tfc_data_en,
                         tfc_strt_crc,
                         // STX Interface
                         stx_rxpause_e,
                         //Transmit control signals and transmit status
                         tbu_dispad,
                         tbu_discrc,
                         tpe_txstatus_valid,
                         tpe_txstatus,
                         tfc_sts_valid,
                         tfc_sts,
                         tfc_fsm_sts,
                         // Status to MMC
                         tfc_mmc_txstatus,
                         tfc_mmc_txstatus_valid
                         );
        
// Input and Output port declarations
        
// clock and reset
  input            clk_tx_i;                //  Transmit clock (2.5/25/125)Mhz.
  input            rst_clk_tx_n;            //  Active low reset synchronous to clk_tx_i

// TBU Interface signals
  input            tbu_data_valid;          // Data valid for 32-bit transmit data.
  input  [31:0]    tbu_data;                // Transmit data.
  input  [3:0]     tbu_be;                  // Byte enables for transmit data.
  input            tbu_sof;                 // Start of frame signal.
  input            tbu_eof;                 // End of frame signal.
  output           tfc_rdy;                 // TFC ready signal.
  output           tfc_abort;               // Abort frame signal from TFC.

// TPE Interface signals 
  output           tfc_data_valid;          // Data valid for 8-bit data to TPE
  output [7:0]     tfc_data;                // Transmit data
  output           tfc_sof;                 // Start of frame signal
  output           tfc_eof;                 // End of frame signal
  input            tpe_ack;                 // Acknowledge signal for transmit data.
  input            tpe_abort;               // Frame aborted in TPE.

// TFC <-> TPE handshake signals
  output           tfc_req;                 // Frame transmit request signal
  input            tpe_gnt;                 // Grant for transmit request
                                           
// FTX Interface signals
  input            ftx_data_valid;          // data valid for 8-bit control frame data from FTX.
  input  [7:0]     ftx_data;                // 8-bit data from FTX.
  input            ftx_sof;                 // Start of frame signal.
  input            ftx_eof;                 // End of frame signal. 
  output           tfc_ftx_ack;             // Acknowledge signal for control frame from FTX.

// TX byte counter signals to FTX
  output [1:0]     count_4;                 // 2-bit counter signal
  output [3:0]     dword_cnt;               // 4-bit lfsr to count the number of dwords

// CTX Interface signals
  input  [31:0]    ctx_data;                // 32-bit CRC data from CTX. 
  output           tfc_data_en;             // Enable for 8-bit data to CTX.
  output           tfc_strt_crc;            // Start crc calculation.

// SYNC block interface
  input            stx_rxpause_e;           // Transmit pause request from STX block.

//Transmit control signals and transmit status
  input            tbu_dispad;              // Disable padding.
  input            tbu_discrc;              // Disable crc.
  input            tpe_txstatus_valid;      // Tx status valid from TPE
  input  [31:0]    tpe_txstatus;            // Tx stattus from TPE.
  output           tfc_sts_valid;           // Tx status valid towards TBU
  output [31:0]    tfc_sts;                 // Tx status towards TBU
  output [1:0]     tfc_fsm_sts;             // TFC FSM status for CSR

// Status to MMC
  output [31:0]    tfc_mmc_txstatus;        // Tx status to MMC.
  output           tfc_mmc_txstatus_valid;  // Tx status valid to MMC  
// End of port declarations.

// Internal reg and wire declarations

  reg              fifo_wptr;               // write pointer to FIFO.
  reg              fifo_rptr;               // read pointer to FIFO.
  reg  [1:0]       fifo_fill_sts;           // FIFO occupancy or fifo fill status. 
  reg  [32:0]      fifo_reg0,fifo_reg1;     // 33-bit FIFO elements storing 
                                            // 32-bit data,End of frame
  reg  [1:0]       count_4;                 // Mod-4 counter to track the 
                                            // number of bytes transferred.
  reg  [3:0]       lfsr_cnt;                // LFSR to track the number of dwords 
                                            // transferred.
  reg  [6:0]       next_tfc_state;          // Combinationally derived next TFC state.
  reg  [6:0]       tfc_state;               // Current TFC state.
  reg              tfc_data_valid;          // Data valid signal  
  reg              tfc_sof;                 // Start of frame.
  reg              ctrl_frame;              // Signal asserted when TFC services 
                                            // pause control frame request from FTX.
                                            
  reg              underflow_r;             // underflow status to TBU.
  reg  [3:1]       byte_en;                 // byte enable from TBU.
  reg  [1:0]       tfc_fsm_sts;             // 00 => IDLE
                                            // 01 => Wait for GNT or Status
                                            // 10 => Tx Pause control frame
                                            // 11 => Tx data frame

  reg [31:0]       tfc_mmc_txstatus;        // Tx status to MMC.
  reg              tfc_mmc_txstatus_valid;  // Tx status valid to MMC  
  
  wire [32:0]      fifo_wdata;              // consolidated 33-bit data going to FIFO.
  wire             fifo_wr_en;              // FIFO write enable. 
  wire [32:0]      fifo_rdata;              // 33-bit read data from FIFO.
  wire             rd_ptr_incr;             // signal asserted when one dword of 
                                            // normal frame is transmitted to TPE.
                                            
  wire             fifo_clr;                // Clear signal to flush the FIFO after 
                                            // normal frame transmission.
       
  wire             fifo_empty;              // FIFO empty indicator.
  wire             fifo_eof;                // End of frame signal from FIFO.
  wire             last_byte_tx;            // Signal asserted when current data byte 
                                            // transferred is the last byte of 
                                            // the frame in the FIFO.
  wire [7:0]       fifo_data;               // 8 bit frame data towards TPE.
  wire [7:0]       crc_data;                // 8 bit control frame data towards TPE.
  wire             underflow;               // Signal asserted when empty FIFO is read. 
  
// parameter definitions

  parameter [6:0]  TFC_IDLE = 7'd0,
                   TFC_WAIT_FOR_GNT = 7'd1,
                   TFC_XMT_CTRL_FRAME = 7'd2,
                   TFC_SEND_BYTE = 7'd3,
                   TFC_XMT_PAD = 7'd4,
                   TFC_XMT_CRC = 7'd5,
                   TFC_WAIT_FOR_STS = 7'd6;

//----------------
// FIFO Controller
//----------------
// FIFO controller assembles the dword ,byte enables and end of frame from TBU. It also 
// generates FIFO read and write control signals. 

  assign fifo_wdata = {tbu_eof,tbu_data[31:0]};  // fifo write data
  assign fifo_wr_en = tbu_data_valid & tfc_rdy; 

  // fifo write pointer
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      fifo_wptr <= `L;
    end
    else begin
      if (fifo_clr) begin
        fifo_wptr <= `L;
      end
      else if (fifo_wr_en) begin
        fifo_wptr <= ~fifo_wptr;
      end
    end
  end
  
  // clear fifo after frame transmission.
  assign fifo_clr = tpe_txstatus_valid & ~ctrl_frame; 
  
  // Increment read pointer after transferring a dword to TPE.
  assign rd_ptr_incr = tfc_state[TFC_SEND_BYTE] & tpe_ack & ~fifo_empty & (count_4 == 2'b11);  
  
  // fifo read pointer
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      fifo_rptr <= `L;
    end
    else begin
      if (fifo_clr) begin
        fifo_rptr <= `L;
      end  
      else if (rd_ptr_incr) begin
       fifo_rptr <= ~fifo_rptr;
      end
    end
  end  

//-----
// FIFO
//-----
// The 2 deep FIFO performs writes and read onto the registers.It also maintains FIFO full and empty
// status.
   
  assign fifo_empty = (fifo_fill_sts == 2'b00);
  assign tfc_rdy = !(fifo_fill_sts[1] & fifo_fill_sts[0]);

  // fifo fill status
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      fifo_fill_sts <= 2'b00;
    end
    else begin
      if (fifo_clr) begin
        fifo_fill_sts <= 2'b00;
      end
      else if (fifo_wr_en & ~rd_ptr_incr) begin
        fifo_fill_sts <= {fifo_fill_sts[0],1'b1};
      end
      else if (~fifo_wr_en & rd_ptr_incr) begin
        fifo_fill_sts <= {1'b0,fifo_fill_sts[1]};
      end
    end
  end

  // fifo write operation
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      fifo_reg0 <= {33{1'b0}};
      fifo_reg1 <= {33{1'b0}};
    end
    else begin
      if (~fifo_wptr & fifo_wr_en) begin
        fifo_reg0 <= fifo_wdata;
      end
      else if (fifo_wptr & fifo_wr_en) begin
        fifo_reg1 <= fifo_wdata;
      end
    end
  end

  // Byte Enables for the last dword.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      byte_en <= {3{`H}};
    end
    else begin
      if (fifo_wr_en & tbu_eof) 
        byte_en <= tbu_be[3:1];
    end
  end  
      
  // fifo read operation
  assign fifo_rdata = (fifo_rptr) ? fifo_reg1 : fifo_reg0;
  assign fifo_eof = fifo_rdata[32];

//----------------------
// Transmit Byte Counter
//----------------------
 
  assign dword_cnt = lfsr_cnt;
 
  // Mod-4 counter  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      count_4 <= 2'b00;
    end  
    else begin
      //if (tpe_abort | tpe_txstatus_valid | (~tbu_discrc & (lfsr_cnt == 4'h7))) begin
      if (tpe_abort | tpe_txstatus_valid | (tfc_state[TFC_SEND_BYTE] & next_tfc_state[TFC_XMT_CRC])) begin
        count_4 <= 2'b00;
      end
      else if (tfc_data_valid & tpe_ack) begin
        count_4 <= count_4 + 1;
      end
    end
  end 

  // LFSR for counting number of DWORD received.
  // Count Seqence: F,E,D,A,5,B,6,C,9,2,4,8,1,3,7,F,..
  always @(`TX_RST_MODE) begin
    if (!rst_clk_tx_n) begin
      lfsr_cnt <= 4'h0;
    end
    else begin
      if (tpe_abort | tpe_txstatus_valid) begin
        lfsr_cnt <= 4'h0;
      end
      else if ((lfsr_cnt != 4'hF) & tfc_data_valid & tpe_ack & (count_4 == 2'b11)) begin
//        lfsr_cnt <= {lfsr_cnt[2],lfsr_cnt[1],lfsr_cnt[0],(lfsr_cnt[0] ^ lfsr_cnt[3])};
          lfsr_cnt <= lfsr_cnt + 1;
      end
    end
  end
  
   
//------------
// Control FSM
//------------
// FSM prioritises the control frame and normal frame requests and governs the flow of 8-bit
// frame data to TPE.The FSM also governs the addition of pads and FCS based on the padding and
// FCS addition requests from application.

  assign last_byte_tx = fifo_eof & ((count_4 == 2'b00) ? (~byte_en[1]) : 
                                    (count_4 == 2'b01) ? (~byte_en[2]) :
                                    (count_4 == 2'b10) ? (~byte_en[3]) : `H);

  //sequential next state assignment
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tfc_state <= 7'b0000001;
    end  
    else
      tfc_state <= next_tfc_state;
  end    
  
  
  // combinational logic deriving the next state.
  always @* 
    begin
    next_tfc_state = 7'b0000000;
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off    
    case(1'b1)  // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
      tfc_state[TFC_IDLE]: // Idle
        begin
          if (((ftx_data_valid & ftx_sof) | 
              (~stx_rxpause_e & ~fifo_empty)) & ~tpe_gnt) begin
            next_tfc_state[TFC_WAIT_FOR_GNT] = `H;
          end
          else
            next_tfc_state[TFC_IDLE] = `H;
        end
      
      tfc_state[TFC_WAIT_FOR_GNT]: // Wait for grant from TPE
        begin
          if (tpe_abort) begin
            next_tfc_state[TFC_WAIT_FOR_STS] = `H;
          end  
          else if (tpe_gnt) begin
            if (ftx_data_valid) begin
              next_tfc_state[TFC_XMT_CTRL_FRAME] = `H;
            end
            else begin
              next_tfc_state[TFC_SEND_BYTE] = `H;
            end
          end  
          else  
            next_tfc_state[TFC_WAIT_FOR_GNT] = `H;
        end    
            
      tfc_state[TFC_XMT_CTRL_FRAME]: // Control Frame transfer
        begin
          if (ftx_eof & ftx_data_valid & tpe_ack) begin
            next_tfc_state[TFC_XMT_CRC] = `H;
          end
          else 
            next_tfc_state[TFC_XMT_CTRL_FRAME] = `H;
        end
        
      tfc_state[TFC_SEND_BYTE]: // Normal Frame transfer
        begin
          if (tpe_abort | (((last_byte_tx & tbu_dispad & tbu_discrc)| 
	                    fifo_empty) & tpe_ack)) begin
            next_tfc_state[TFC_WAIT_FOR_STS] = `H;
          end
          else if (last_byte_tx & tbu_dispad & ~tbu_discrc & tpe_ack) 
            next_tfc_state[TFC_XMT_CRC] = `H;
          else if (last_byte_tx & tpe_ack & ~tbu_dispad & 
                ((lfsr_cnt < 4'hE) | ((lfsr_cnt == 4'hE) & (count_4 != 2'b11)))) 
            next_tfc_state[TFC_XMT_PAD] = `H;
          else if (last_byte_tx & tpe_ack & ((lfsr_cnt == 4'hE) & (count_4 == 2'b11))) 
            next_tfc_state[TFC_XMT_CRC] = `H;
          else if (last_byte_tx & tpe_ack)
            if (tbu_discrc) 
              next_tfc_state[TFC_WAIT_FOR_STS] = `H;
            else
              next_tfc_state[TFC_XMT_CRC] = `H;
          else
            next_tfc_state[TFC_SEND_BYTE] = `H;
        end 

      tfc_state[TFC_XMT_PAD]: // Transfer pads for frames < 60 bytes in length
        begin
          if (tpe_abort) begin
            next_tfc_state[TFC_WAIT_FOR_STS] = `H;
          end
          else if ((lfsr_cnt == 4'hE) & (count_4 == 2'b11) & tpe_ack) begin
            next_tfc_state[TFC_XMT_CRC] = `H;
          end  
          else
            next_tfc_state[TFC_XMT_PAD] = `H;
        end
        
      tfc_state[TFC_XMT_CRC]: // Transfer FCS for the frame
        begin
          if (tpe_abort | ((count_4 == 2'b11) & tpe_ack)) begin
            next_tfc_state[TFC_WAIT_FOR_STS] = `H;
          end
          else
            next_tfc_state[TFC_XMT_CRC] = `H;
        end
        
      tfc_state[TFC_WAIT_FOR_STS]: // Wait for transmit frame status from TPE
        begin
          if (tpe_txstatus_valid) begin
            next_tfc_state[TFC_IDLE] = `H;
          end
          else
            next_tfc_state[TFC_WAIT_FOR_STS] = `H;
        end
    endcase
// leda W225 on    
    end

// Data path from the FIFO,FTX and CTX.
  assign fifo_data = (count_4 == 2'b01) ? fifo_rdata[15:8] :
                     (count_4 == 2'b10) ? fifo_rdata[23:16] :
                     (count_4 == 2'b11) ? fifo_rdata[31:24] : fifo_rdata[7:0]; 

  assign crc_data = (count_4 == 2'b01) ? ctx_data[15:8] :
                    (count_4 == 2'b10) ? ctx_data[23:16] :
                    (count_4 == 2'b11) ? ctx_data[31:24] : ctx_data[7:0];

  assign tfc_data = (underflow) ? ~crc_data :
                    (tfc_state[TFC_XMT_CRC]) ? crc_data :
                    (ctrl_frame) ? ftx_data : 
                    (tfc_state[TFC_SEND_BYTE]) ? fifo_data : 8'h00;

//----------------------
// TPE Interface Outputs
//----------------------

  assign tfc_req = (((~stx_rxpause_e & ~fifo_empty) | ftx_data_valid) & (tfc_state[TFC_IDLE] |
                     tfc_state[TFC_WAIT_FOR_GNT]));
  
  assign tfc_eof = (last_byte_tx & (((tbu_dispad & tbu_discrc) | 
                    (~tbu_dispad & tbu_discrc & lfsr_cnt == 4'hF)) & tfc_state[TFC_SEND_BYTE])) |   
                   (tfc_state[TFC_XMT_CRC] & (count_4 == 2'b11)) | underflow;

  assign tfc_abort = tpe_abort | underflow;                  
// Data valid for 8-bit data to TPE
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tfc_data_valid <= `L;
    end
    else begin
      if (tpe_abort | (tfc_eof & tpe_ack & (tfc_state[TFC_SEND_BYTE] | tfc_state[TFC_XMT_CRC]))) begin
        tfc_data_valid <= `L;
      end
      else if (tpe_gnt & (tfc_state[TFC_WAIT_FOR_GNT])) begin
        tfc_data_valid <= `H;
      end
    end
  end

// Start of frame 
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tfc_sof <= `L;
    end
    else begin
      if (tfc_data_valid & tpe_ack) begin
        tfc_sof <= `L;
      end
      else if (tpe_gnt & (tfc_state[TFC_WAIT_FOR_GNT])) begin
        tfc_sof <= `H;
      end
    end
  end

// underflow and control frame status signals
  assign underflow = tfc_state[TFC_SEND_BYTE] & fifo_empty & ~tpe_abort;
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      underflow_r <= `L;
    end
    else begin
      if (tfc_state[TFC_IDLE]) begin
        underflow_r <= `L;
      end
      else if (underflow) begin
        underflow_r <= `H;
      end
    end
  end

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      ctrl_frame <= `L;
    end
    else begin
      if (tpe_txstatus_valid) begin
        ctrl_frame <= `L;
      end
      else if (tfc_state[TFC_WAIT_FOR_GNT] & tpe_gnt & ftx_data_valid) begin
        ctrl_frame <= `H;
      end
    end
  end
  
// Acknowledgment for FTX data

   assign tfc_ftx_ack = ctrl_frame & ftx_data_valid & tpe_ack;

// crc reset and data valid signals to CTX

   assign tfc_strt_crc = tfc_state[TFC_WAIT_FOR_GNT] & tpe_gnt;
   assign tfc_data_en = tfc_data_valid & tpe_ack & (~tfc_state[TFC_XMT_CRC]);

// TFC FSM status registered and given out for proper synchronization
   always @(`TX_RST_MODE) begin 
     if (~rst_clk_tx_n)
       tfc_fsm_sts <= {2{`L}};
     else 
    // leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off    
        case(1'b1)  // synopsys full_case parallel_case
    // leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
          tfc_state[TFC_IDLE]          : tfc_fsm_sts <= 2'b00;
          tfc_state[TFC_WAIT_FOR_GNT]  : tfc_fsm_sts <= 2'b01;
          tfc_state[TFC_WAIT_FOR_STS]  : tfc_fsm_sts <= 2'b01;
          tfc_state[TFC_XMT_CTRL_FRAME]: tfc_fsm_sts <= 2'b10;
          tfc_state[TFC_SEND_BYTE]     : tfc_fsm_sts <= 2'b11;
          tfc_state[TFC_XMT_PAD]       : tfc_fsm_sts <= 2'b11;
          tfc_state[TFC_XMT_CRC]       : tfc_fsm_sts <= 2'b11;
        endcase
   end
       
// 32-bit status towards MMC block
   always @(`TX_RST_MODE) begin 
     if (~rst_clk_tx_n)
       tfc_mmc_txstatus <= {32{`L}};
     else 
       if (tpe_txstatus_valid)
         tfc_mmc_txstatus <= {tpe_txstatus[31],ctrl_frame,tpe_txstatus[29:8],
                              underflow_r,tpe_txstatus[6:1], 
                              (tpe_txstatus[0]|underflow_r)};
   end
   
   always @(`TX_RST_MODE) begin 
     if (~rst_clk_tx_n)
       tfc_mmc_txstatus_valid <= `L;
     else 
       tfc_mmc_txstatus_valid <= tpe_txstatus_valid;
   end

// 32-bit status towards TBU
   
   assign tfc_sts = {tfc_mmc_txstatus[31],1'b0,tfc_mmc_txstatus[29:0]};

   assign tfc_sts_valid =  tfc_mmc_txstatus_valid & !tfc_mmc_txstatus[30];


endmodule
   

  
