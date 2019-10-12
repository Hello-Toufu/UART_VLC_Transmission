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
// Date             :        $Date: 2007/11/16 $
// File Version     :        $Revision: #19 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Bus Interface Unit (DWC_gmac_mtc_tbu.v)
//
// DESCRIPTION:
// This module interfaces with the application through a FIFO interface and
// transforms 128/64/32-bit application data to 32-bit data.This module also
// does decoding of Byte enables and Endian Mode conversion of application 
// data.
//--------------------------------------------------------------------------

module DWC_gmac_mtc_tbu (
        clk_tx_i,
                         rst_clk_tx_n,
                         // MAC Transmit Interface signals
                         mti_val_i,
                         mti_data_i,
                         mti_sof_i,
                         mti_eof_i,
                         mti_be_i,
                         mti_rdy_o,
                         // TFC Interface signals
                         tfc_rdy,
                         tfc_abort,
                         tbu_data_valid, 
                         tbu_data,
                         tbu_sof,
                         tbu_eof,
                         tbu_be,
                         //Transmit control signals and transmit status
                         mti_dispad_i,
                         mti_discrc_i,
                         tfc_sts_valid,
                         tfc_sts,
                         tbu_dispad,
                         tbu_discrc,
                         mti_txstatus_o,
                         mti_txstatus_val_o
                         );

// Input and output port declarations
  
// Clock and reset  
  input                       clk_tx_i;            // Transmit clock (2.5/25/125)Mhz.            
  input                       rst_clk_tx_n;        // Active low reset synchroronous 
                                                   // to clk_tx_i.

// MTI Interface 
  input                       mti_val_i;           // Data valid signal.
  input  [`DATAWIDTH-1:0]     mti_data_i;          // 32/64/128-bit application data.
  input                       mti_sof_i;           // Start of frame signal.
  input                       mti_eof_i;           // End of frame signal.
  input  [`DATAWIDTH/64+1:0]  mti_be_i;            // Byte enables for application data. 
  output                      mti_rdy_o;           // Ready signal for application.

// TFC Interface
  input                       tfc_rdy;             // TFC ready signal.
  input                       tfc_abort;           // Abort frame signal from TFC.
  output                      tbu_data_valid;      // Data valid for 32-bit transmit data.
  output [31:0]               tbu_data;            // Transmit data.
  output                      tbu_sof;             // Start of frame signal.
  output                      tbu_eof;             // End of frame signal.
  output [3:0]                tbu_be;              // Byte enables for transmit data.

//Transmit control signals and transmit status 
  input                       mti_dispad_i;        // Disable padding in GMAC.
  input                       mti_discrc_i;        // Disable FCS addition in GMAC.  
  input                       tfc_sts_valid;       // Transmit status valid. 
  input  [31:0]               tfc_sts;             // Transmit frame status.
		
  output                      tbu_dispad;          // Disable padding.
  output                      tbu_discrc;          // Disable crc.
  output [31:0]               mti_txstatus_o;      // Transmit Frame Status from GMAC.
  output                      mti_txstatus_val_o;  // Status valid from GMAC.
  
// End of port declarations  

// Internal reg and wire declarations

  reg                       mti_val_r;         // registered data valid indicating 
                                               // presence of valid data.
                                               
  reg  [`DATAWIDTH-1:0]     mti_data_r;        // 32/64/128 bit internal register.
  reg                       eof_r;             // registered end of frame signal
  reg  [`DATAWIDTH/64+1:0]  be_r;              // registered byte enables to be decoded.
  reg                       frame_abort;       // frame abort signal indicates 
                                               // underflow or abort from TPE.

  wire                      tbu_dispad;
  wire                      tbu_discrc;

                                               
  reg                       tbu_sof;           // signal asserted when first dword
                                               // of frame is transmitted to TFC.

  reg  [`TBU_NO_OF_STATES-1:0] next_tbu_state;   // Combinatinally derived next TBU state.
  reg  [`TBU_NO_OF_STATES-1:0] tbu_state;        // Current TBU state. 


  wire  [3:0]               dec_be;           // decoded byte enables.

// Parameter declarations
  parameter [`TBU_NO_OF_STATES-1:0]
                                      TBU_IDLE = 3'd0,
                                      TBU_WORD_1 = 3'd1,
                                      TBU_WAIT_FOR_STS = 3'd2;

//---------------------
// Input Register Block
//---------------------

// This block registers the input signals from the MTI interface and TFC interface 
// and generates the control signals for the Control FSM.

  assign tbu_dispad = mti_dispad_i;
  assign tbu_discrc = mti_discrc_i;

  assign mti_txstatus_o = tfc_sts;
  assign mti_txstatus_val_o = tfc_sts_valid;

  // abort signal from TFC registered to flush the subsequent data from MTI.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      frame_abort <= `L;
    end
    else begin
      if (next_tbu_state[TBU_WORD_1]) begin
        frame_abort <= `L;
      end  
      else if (tfc_abort & ~tbu_state[TBU_WAIT_FOR_STS]) begin
        frame_abort <= `H;
      end
    end  
  end
  
  // Data valid signal registered along with the 32/64/128 -bit data.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      mti_val_r <= `L;
    end
    else begin
      if ((frame_abort | (tbu_eof & tfc_rdy)) & ~mti_sof_i) begin
        mti_val_r <= `L;
      end  
      else if (mti_rdy_o) begin
        mti_val_r <= mti_val_i;
      end
    end  
  end


  // Start of frame signal from MTI asserted until TFC is ready to accept data.    
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tbu_sof <= `L;
    end
    else begin
      if (tbu_state[TBU_WORD_1] & tfc_rdy) begin
        tbu_sof <= `L;
      end
      else if (tbu_state[TBU_IDLE] & mti_val_i & mti_sof_i) begin
        tbu_sof <= `H;
      end
    end  
  end


  // End of frame signal registered with the last data received from MTI.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      eof_r <= `L;
    end
    else begin
      if(tfc_sts_valid)
        eof_r <= `L;
      else if (mti_val_i & mti_rdy_o) begin
        eof_r <= mti_eof_i;
      end
    end  
  end
  
  // Byte enables registered with the last data received from MTI.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      be_r <= {`DATAWIDTH/64+2{`L}};
    end
    else begin
      if (mti_val_i & mti_rdy_o & mti_eof_i) begin
        be_r <= mti_be_i;
      end
      else if (mti_val_i & mti_rdy_o)
        be_r <= {`DATAWIDTH/64+2{`H}}; 
    end
  end
    
  // 32/64/128-bit frame data from MTI registered after endian swapping.
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      mti_data_r <= {`DATAWIDTH{1'b0}};
    end  
    else begin 
      if (mti_val_i & mti_rdy_o) begin
        mti_data_r <= mti_data_i;
      end
    end  
  end 
  
//-------------
// Control FSM 
//-------------

// Control FSM schedules the 32-bit data transfers from the Transmit Bus Interface Unit 
// to TFC.The FSM switches between states as an when valid data is available in the 
// internal 32/64/128 bit register and TFC is ready to accept the 32-bit data. When tx frame 
// is aborted by TFC the FSM flushes all the subsequent data from application until it
// receives the next packet from MTI.

// sequential state assignment
    always @(`TX_RST_MODE) begin
      if (~rst_clk_tx_n) begin
          tbu_state <= 3'b001;
      end
      else  
        tbu_state <= next_tbu_state;
    end
  
// combinational logic deriving the next state.
  always @(*)
    begin
          next_tbu_state = 3'b000;
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off
    case(1'b1) // synopsys full_case parallel_case 
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
      tbu_state[TBU_IDLE]: //Idle
        begin
          if (mti_val_i & mti_sof_i) begin
            next_tbu_state[TBU_WORD_1] = `H;
          end
          else
            next_tbu_state[TBU_IDLE] = `H;
        end
      
      tbu_state[TBU_WORD_1]: // Transfer first Dword
        begin
          if ((tfc_rdy & mti_val_r & eof_r) | tfc_abort) begin
            next_tbu_state[TBU_WAIT_FOR_STS] = `H;
          end
          else
            next_tbu_state[TBU_WORD_1] = `H;
        end
      tbu_state[TBU_WAIT_FOR_STS]: // Wait until frame status is received from TFC
        begin
          if (tfc_sts_valid) begin
            next_tbu_state[TBU_IDLE] = `H;
          end
          else
            next_tbu_state[TBU_WAIT_FOR_STS] = `H;
        end
	
    endcase
// leda W225 on    
  end 

   
//-------------
// Output Block
//-------------

// This block performs the multiplexing of 64/128-bit data onto the 32-bit data bus
// towards TFC.This block also generates the neccessary control signals for data
// transfer.

// Data valid signal for frame data to TFC
  assign tbu_data_valid = mti_val_r & !tbu_state[TBU_IDLE];
  
// End of frame for frame data to TFC
  assign tbu_eof = eof_r;

// Byte Enables for frame data to TFC
  assign tbu_be = (tbu_eof) ? dec_be : 4'b1111;

  assign dec_be[3] = be_r[1] & be_r[0]; // decoding of byte enables
  assign dec_be[2] = be_r[1];
  assign dec_be[1] = be_r[1] | be_r[0];
  assign dec_be[0] = `H;
 
// 32-bit frame data to TFC
  assign tbu_data = mti_data_r;

// TBU Ready signal to MTI
 assign mti_rdy_o = (tbu_state[TBU_IDLE]) ? `H : 
                    (tbu_state[TBU_WORD_1] & ~eof_r) ? tfc_rdy :
                    (tbu_state[TBU_WAIT_FOR_STS] | frame_abort) ? `L : `L;







  
    
endmodule
