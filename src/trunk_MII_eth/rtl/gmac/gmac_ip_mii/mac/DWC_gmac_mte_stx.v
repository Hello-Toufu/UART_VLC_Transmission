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
// File Version     :        $Revision: #15 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Scheduler (DWC_gmac_mte_stx.v)
//
// DESCRIPTION:
// This module implements a TBEB based random number generartor to schedule 
// a random back off times.The module also schedules the frame transmission
// after deference due to busy medium or IFG.
//--------------------------------------------------------------------------

module DWC_gmac_mte_stx (
        clk_tx_i,
                         rst_clk_tx_n,
                         tpe_txcarrier,
                         tpe_backoff_strt,
                         sct_backoff_lmt,
                         sct_crs,
                         sct_ifg,
                         sct_portselect,
                         sct_duplexmode,
                         sct_load_pause_time,
                         // FRX Block
                         frx_pause_time,
                         ftx_data_valid,
                         tfc_req,
                         stx_xmitok,
                         stx_backoff,
                         stx_rxpause_e,
                         stx_tx_in_paus,
                         stx_pause_quanta
                         );

// Input and Output port declarations.
  
  input            clk_tx_i;              // Transmit clock (2.5/25/125)Mhz.
  input            rst_clk_tx_n;          // Active low reset synchronous to clk_tx_i.
  input            tpe_txcarrier;         // Tx activity is in progress
  input            tpe_backoff_strt;      // Start backoff strobe.
  input [1:0]      sct_backoff_lmt;       // Encoded Backoff limit from CSR.
  input            sct_crs;               // Carrier sense synchronous to clk_tx1_i.
  input [2:0]      sct_ifg;               // Minimum IFG programmed through CSR .
  input            sct_portselect;        // GMII/MII port selection.
  input            sct_duplexmode;        // Duplex Mode Selection
  input            sct_load_pause_time; // Load value on frx_pause_time

  // From FRX
  input  [15:0]    frx_pause_time; // Pause time value from received pause frame.

  input            tfc_req;   // Indicates that TFC is requesting for frame transmission
  input            ftx_data_valid;      // data valid for 8-bit control frame data from FTX.

  output           stx_rxpause_e; // Instructs the transmitter to pause (due to rx pause frame)
  output           stx_xmitok;            // transmit ready signal for the tpe module.
  output           stx_backoff;           // When high indicating backoff interval
  output           stx_tx_in_paus;        // High when Txmtr is in pause
  output           stx_pause_quanta;      // signal indicating completion of one 
                                          // pause quanta(64 bit times).
// Internal reg and wire declarations.


  reg   [4:0]  ifg_counter;           // Inter frame Gap(period) counter.
  wire  [4:0]  ifg_value;             // actual Inter frame Gap.
  
  reg              stx_tx_in_paus;        // High when Txmtr is in pause
  
  reg  [6:0]       slot_timer;            // Timer keeping track of slot time interval.

  wire             stx_slottimetic;       // signal indicates completion of slot time.
  wire  [2:0]       ifg_min;              // Minimum encoded IFG from CSR.
  wire              ifg_clr;              // IFG counter clear signal.
  wire              ifg_ok;               // IFG complete signal.
  wire              ifg_cnt_lmt;          // IFG counter upper limit.
  wire              stx_pause_quanta;     // one pause quanta = 512 bit times.
  wire              pause_quanta_tic;     // one pause quanta = 512 bit times.

  wire             strt_pause_timer; // Initializes the slot timer (for pause timer)
  reg  [15:0]      pause_timer; // Pause Timer
  reg              defer_pause_timer; // Prevents pause timer from down-counting
  

// Parameter declarations
  parameter IFG_LMT_MII = 5'b11000;

   

//---------------
// IFG Scheduler
//---------------

  // Minimum value of IFG determined based on the IFG value programmed. 
  assign ifg_min = (sct_duplexmode) ? sct_ifg : 
                 (sct_ifg > 3'b100) ? 3'b100 : sct_ifg;

  assign ifg_value = IFG_LMT_MII - {1'b0,ifg_min,1'b0};                    
  assign ifg_clr = ~ifg_counter[4];                    
  assign ifg_cnt_lmt = (ifg_counter == IFG_LMT_MII);
  assign ifg_ok = (ifg_counter >= (ifg_value - 5'b00010));

  

  // IFG counter tracking the period between the frames based on the deference rules
  // stated for full duplex and half duplex modes.
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      ifg_counter <= {5{`L}};
    end
    else begin 
        if (tpe_txcarrier) begin

          ifg_counter <= {5{`L}};
      end
      else if (!ifg_cnt_lmt) begin
        ifg_counter <= ifg_counter + 1;
      end
    end  
  end  

//------------
// Slot timer
//------------


  // The slot_timer is a roll over counter that counts the slot time
  // interval. A slot time is 512 BT (128 MII clocks). When the
  // BackOff is started the slot_timer is reset and after that is
  // is incremented on every clock. When the counter reaches a value of 127
  // (one slot time) the backoff_counter is decremented by one, and the
  // counter rolls over to zero.
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      slot_timer <= {7{`L}};
    end
    else begin
      if (tpe_backoff_strt | strt_pause_timer)
        slot_timer <= {7{`L}};
      else

        slot_timer <= slot_timer + 7'b0000001;
    end
  end

  assign stx_pause_quanta = pause_quanta_tic | strt_pause_timer;

  assign stx_slottimetic = (&slot_timer);
  assign pause_quanta_tic = stx_slottimetic;




  assign stx_xmitok  = ifg_ok;
  assign stx_backoff = `L;



//---------------------------------------------------------------
// Pause Timer & Associated Logic
//---------------------------------------------------------------

  // strt_pause_timer initializes the slot timer
  assign strt_pause_timer = (sct_load_pause_time & !defer_pause_timer) |
                            (defer_pause_timer & stx_rxpause_e &
                             ((tfc_req & ftx_data_valid) | 
                              (!tpe_txcarrier & !stx_xmitok)));

  // pause timer implementation
  always @(`TX_RST_MODE)
    if (~rst_clk_tx_n)
      pause_timer <= {16{`L}};
    else
      if (sct_load_pause_time)
        pause_timer <= frx_pause_time;
      else
        if (pause_quanta_tic & stx_rxpause_e & !defer_pause_timer)
          pause_timer <= pause_timer - 16'h0001;

  // stx_rxpause_e pauses the transmission of data frames.
  assign stx_rxpause_e = (|pause_timer);

  // For debug status register
  always @(`TX_RST_MODE)
    if (!rst_clk_tx_n)
      stx_tx_in_paus  <= `L;
    else
      stx_tx_in_paus  <= !defer_pause_timer & stx_rxpause_e;

  // defer_pause_timer : This flag is set when data frame transmission is going 
  // on or about to start. This is cleared when pause frame transmission starts
  // or current frame transmission completes.
  // Pause timer start should be deferred when data frame is being transmitted.
  always @(`TX_RST_MODE)
    if (!rst_clk_tx_n)
      defer_pause_timer <= `L;
    else
      if (tfc_req & ftx_data_valid)
        defer_pause_timer <= `L;
      else
        if (tfc_req & stx_xmitok)
          defer_pause_timer <= `H;
        else
          if (!tpe_txcarrier & !stx_xmitok)
            defer_pause_timer <= `L;
      
endmodule
