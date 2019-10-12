//---------------------------------------------------------------------------//
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
//---------------------------------------------------------------------------//
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2008/01/17 $
// File Version     :        $Revision: #35 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                   //
// MTL Receive Write Controller                                              //
//                                                                           //
// DESCRIPTION:                                                              //
// The primary functions of MTL Receive Write Controller(RWC) includes       //
// 1. Generating FIFO control signals for writing frame data,byte enables,   //
//    frame status of received frame into the Rxdata FIFO.                   //
// 2. Allowing the reads to Rxdata FIFO only after the number of bytes in the//
//    FIFO reaches a threshold.                                              //
// 3. Indicating the applcation about FIFO overflow.                         //
//---------------------------------------------------------------------------//

module DWC_gmac_mtl_rwc (
        
        clk_rx_i,
                         rst_clk_rx_n,
                         // MAC Receive Interface
                         mri_val_i,
                         mri_data_i,
                         mri_be_i,
                         mri_sof_i,
                         mri_eof_i,
                         mri_rxstatus_i,
                         // MTL <-> RxData FIFO Write Interface 
                         rwc_wr_addr_o,
                         rwc_wr_csn_o,
                         rwc_wr_en_o,
                         rwc_wr_data_o,
                         // MTL <-> Rx Frame Length FIFO write interface
                         rwc_len_wr_addr_o,
                         rwc_len_wr_en_o,
                         rwc_len_wr_csn_o,
                         rwc_err_frame_o,        
                         scr_rxthreshctrl,
                         scr_thresh_act,
                         scr_thresh_deact,
                         scr_hwflowctrl_e,
                         scr_fwd_runt_e,
                         scr_fwd_err_frame,
                         scr_str_n_fwd,
                         rsb_ack_wrptr_2_rd,
                         rwc_fifo_ovf,
                         rwc_sts_wrtn,
                         rdptr_2_wr_sync,
                         rwc_dbg_sts,
                         rwc_flowctrl,
                         rwc_wrptr_2_rd
                         );
        
// Input and Output port declarations

  input                         clk_rx_i;      // Receive clock(2.5/25/125)Mhz.
  input                         rst_clk_rx_n;  // Active low reset synchroronous 
                                               // to clk_rx_i.

// MTL Receive Interface 
  input                         mri_val_i;     // Signal qualifying frame data,
                                               // byte enables,start of frame,
                                               // End of frame signals.
                                               
  input  [`DATAWIDTH-1:0]       mri_data_i;    // Receive Frame Data from GMAC
  input  [`DATAWIDTH/64+1:0]    mri_be_i;      // Byte Enables for frame data
  input                         mri_sof_i;     // Start of frame 
  input                         mri_eof_i;     // End of frame
  input  [`CORE_STATUS_WIDTH-1:0] mri_rxstatus_i;// 32-bit receive frame status 
        
// MTL <-> RxData FIFO Write Interface 
  output [`RX_FIFO_PTR_WIDTH-1:0]rwc_wr_addr_o; // Write address to Rxdata FIFO
  output                         rwc_wr_csn_o;  // Chip select to Rxdata FIFO
  output                         rwc_wr_en_o;   // Write Enable to Rxdata FIFO
  output [`FIFO_DATA_WIDTH-1:0]  rwc_wr_data_o; // Write data to Rxdata FIFO

// MTL <-> Rx Frame Length FIFO write interface
   output [`MAX_FRAME_CNT_WIDTH-2:0] rwc_len_wr_addr_o; // Write address to
                                                        // Rx Frame Length FIFO
   output                            rwc_len_wr_en_o;   // Write enable to 
                                                        // Rx Frame Length FIFO
   output                            rwc_len_wr_csn_o;  // Chip select to 
                                                        // Rx Frame Length FIFO
   output                            rwc_err_frame_o;   // Drop Error Frame flag
                                                        // to Frame Length FIFO
                                                        // set when Forward Error
                                                        // frame(bit7 OMR)not set.

// Sync Block Signals
  input  [1:0]                  scr_rxthreshctrl;   // Signal indicating 
                                                    // threshold for fill level
                                                    // on Rxdata FIFO.
                                                    
  input  [2:0]                  scr_thresh_act;     // Signal indicating 

                                                    // threshold for fill level
                                                    // on Rxdata FIFO to trigger
                                                    // flow control.
  input  [2:0]                  scr_thresh_deact;   // Signal indicating 

                                                    // threshold for fill level
                                                    // on Rxdata FIFO to 
                                                    // de-activate flow control
  input                         scr_hwflowctrl_e;   // Hardware flow control 
                                                    // enable
  input                         scr_fwd_runt_e;     // Enable forwarding of 
                                                    // undersized frames with 
                                                    // no error.
  
  input                         scr_fwd_err_frame;  // Forward frames with errors
                                                    // when this bit is asserted.
  
  input                         scr_str_n_fwd;      // Store and forward receive
                                                    // frame control from OMR

  input                         rsb_ack_wrptr_2_rd; // Acknowledgement for write
                                                    // pointer sync'd to read 
                                                    // clock domain
  
  input [`RX_FIFO_PTR_WIDTH:0]   rdptr_2_wr_sync;   // RxData FIFO read pointer
                                                    // sync'd to write clock.
                                                    
  output                        rwc_fifo_ovf;       // Signal asserted when 
                                                    // RxData FIFO overflows.
        
  output                        rwc_sts_wrtn;       // RxStatus written signal to  
                                                    // be sync'd to read clock;
                                                    
  output [`RX_FIFO_PTR_WIDTH:0]   rwc_wrptr_2_rd;   // Rxdata FIFO write pointer
                                                    // to be synchronised to read
                                                    // clock domain.
                                                    
  output [2:0]                  rwc_dbg_sts;        // {RxFIFO Empty, full, RWC_FSM=IDLE} 
  output                        rwc_flowctrl;       // Flowcontrol input to GMAC

// Paramter Declarations
  parameter [4:0] RWC_IDLE = 5'd0,
                  RWC_WRITE = 5'd1,
                  RWC_EOF_RCVD = 5'd2,
                  RWC_FRAME_FLUSH = 5'd3,
                  RWC_WR_WAIT = 5'd4;

// Internal Wire and reg declarations
  reg  [4:0]                    rwc_state;          // Write Control FSM 
                                                    // current state
                                                    
  reg  [4:0]                    next_rwc_state;     // Write Control FSM next 
                                                    // state
                                                    
  reg  [`RX_FIFO_PTR_WIDTH:0]   rwc_wr_ptr;         // Rxdata FIFO write pointer
  reg                           fifo_ovf_r;         // FIFO overflow indication
                                                    
  reg  [`RX_FIFO_PTR_WIDTH:0]   rwc_wrptr_2_rd;         // Write pointer to be
                                                    // sync'd to read clock
                                                    
  reg  [`DATAWIDTH-1:0]         mri_data_r;         // Frame data to Rxdata FIFO
  reg  [`DATAWIDTH/64+1:0]      rwc_be;             // Byte enables to 
                                                    // Rxdata FIFO
                                                    
  reg                           rwc_eof;            // End of frame to 
                                                    // Rxdata FIFO
  
  reg                           rwc_sts_wrtn;       // End of frame to be 
                                                    // sync'd to read clock;
                                                    
  reg                           updt_wr_ptr;        // Signal qualifies the
                                                    // write pointer for sync'd
                                                    // to read clock domain.
                                                    
  reg                           rwc_fifo_full;      // Rxdata FIFO Full(2spaces
                                                    // left for EOF and status)
                                                    
  reg                           rwc_fifo_full_mns1; // Rxdata FIFO almost Full.
  reg [`CORE_STATUS_WIDTH-1:0]  mri_rxstatus_r;     // Receive Frame Status to
                                                    // Rxdata FIFO.
                                                    
  wire                          rx_fifo_full;       // Rxdata FIFO Full
  wire                          rwc_fifo_wr;        // Rxdata FIFO Write signal
  wire                          rwc_wr_ptr_incr;    // Rxdata FIFO pointer 
                                                    // increment
                                                    
  reg  [`MAX_FRAME_CNT_WIDTH-2:0] rwc_len_wr_ptr;     // Rx Frame length FIFO 
                                                      // write pointer
                                                      
  reg                             rwc_err_frame_o;  // Drop Error Frame Flag
                                                    // to Frame Length FIFO,
                                                    // set when Forward Error
                                                    // frame(bit7 OMR)not set.
  reg     rxfifo_empty;                             // Indicates Empty RxFIFO

                                                    
  wire                          rwc_frame_flush;    // Request to flush frame
                                                    // currently written into 
                                                    // Rxdata FIFO
                                                    
  wire                          flush_curr_frame;   // Flush runt and 
                                                    // error frames
                                                    
  wire                          fifo_ovf;           // FIFO overflow indication
  wire [`RX_FIFO_PTR_WIDTH-1:0] rcv_thrshld;        // Receive Frame threshold 
                                                    // to start transmission 
                                                    // to application clock
                                                    
  wire [`RX_FIFO_PTR_WIDTH:0]   rwc_wr_ptr_pls1;    // rwc_wr_ptr + 1
  wire [`RX_FIFO_PTR_WIDTH:0]   rwc_wr_ptr_pls2;    // rwc_wr_ptr + 2
  wire [`RX_FIFO_PTR_WIDTH:0]   rwc_wr_ptr_pls3;    // rwc_wr_ptr + 3
  wire [`RX_FIFO_PTR_WIDTH:0]   rwc_wr_ptr_pls4;    // rwc_wr_ptr + 4
  
  wire                          sp_avbl_eof;        // 2 spaces available 
                                                    // in Rxdata FIFO

  wire [`MAX_FRAME_CNT_WIDTH-2:0]rwc_len_wr_ptr_pls1;// rwc_len_wr_ptr + 1
                                                    
  wire [31:0]                   rwc_sts;            // Receive Frame status
  wire                          error_frame;        // Error frame status
  wire [13:0]                   rx_frame_len;       // Receive Frame Length
  wire                          error;              // Received Frame with error
  
  wire [`RX_FIFO_PTR_WIDTH-1:0] act_thrshld;    // Threshold to activate GMAC 
                                                // flowctrl based on available
                                                // locations in RxData FIFO
                                                
  wire [`RX_FIFO_PTR_WIDTH-1:0] deact_thrshld;  // Threshold to activate GMAC
                                                // flowctrl based on available 
                                                // locations in RxData FIFO
                                                
  wire [`RX_FIFO_PTR_WIDTH-1:0] avail_locns;   // Available locations in 
                                               // RxData FIFO.
  wire                          flowctrl_assrt;     // Start flowcontrol
  wire                          flowctrl_deassrt;   // Stop flowcontrol
  reg                           rwc_flowctrl;       // Flowctrl input to GMAC 

  wire [`RX_FIFO_PTR_WIDTH:0]   filled_locns;   // Number of locations written
                                                // into RxData FIFO.
  wire                          wrptr_pls4_eq_rd; // signal indicates the diff 
                                                  // between write and read
                                                  // pointer is (FIFO_FULL-4).
  
  wire                          wrptr_pls3_eq_rd; // signal indicates the diff 
                                                  // between write and read
                                                  // pointer is (FIFO_FULL-3).
  
  wire                          wrptr_pls2_eq_rd; // signal indicates the diff 
                                                  // between write and read
                                                  // pointer is (FIFO_FULL-2).
                                                  
  wire                          wrptr_pls1_eq_rd; // signal indicates the diff 
                                                  // between write and read
                                                  // pointer is (FIFO_FULL-1).
                                                   
  wire                          wrptr_eq_rd;      // signal indicates the diff
                                                  // between write and read
                                                  // pointer is (FIFO_FULL).
                           
  
//---------------------------------------------------------------------------// 
// Receive Write Control FSM                                                 //
// Write Control FSM does the scheduling of data transfers from GMAC receive //
// control to Rxdata FIFO.                                                   // 
//---------------------------------------------------------------------------// 
  // Sequential state assignment
  always @(`RX_RST_MODE) begin 
    if (~rst_clk_rx_n)
      rwc_state <= 5'b00001;
    else
      rwc_state <= next_rwc_state;
  end

  // Combinatinal logic deriving next state
  always @(*)
  begin
    next_rwc_state = 5'b00000;

    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 W225 off
    case(1'b1) // synopsys full_case parallel_case
    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 on
    rwc_state[RWC_IDLE]: // Idle
      begin
        if (mri_val_i & mri_sof_i & ~flush_curr_frame)
          if (~rwc_fifo_full)
            if (~mri_eof_i)
              next_rwc_state[RWC_WRITE] = `H;
            else   
              next_rwc_state[RWC_EOF_RCVD] = `H;
          else 
            if (mri_eof_i & sp_avbl_eof)
              next_rwc_state[RWC_EOF_RCVD] = `H;
            else  
              next_rwc_state[RWC_IDLE] = `H;
        else     
          next_rwc_state[RWC_IDLE] = `H;
      end
    
    rwc_state[RWC_WRITE]: // Rxdata FIFO write
      begin
        if (flush_curr_frame | (fifo_ovf & ~updt_wr_ptr))
          next_rwc_state[RWC_FRAME_FLUSH] = `H;
        else if ((mri_val_i & mri_eof_i) | fifo_ovf)
          next_rwc_state[RWC_EOF_RCVD] = `H;
        else if (~mri_val_i)
          next_rwc_state[RWC_WR_WAIT] = `H;
        else
          next_rwc_state[RWC_WRITE] =`H;
      end
    
    rwc_state[RWC_EOF_RCVD]: // End of frame received from GMAC.
      begin
        if (~rwc_eof)
          next_rwc_state[RWC_IDLE] = `H;
        else
          next_rwc_state[RWC_EOF_RCVD] = `H;
      end    
    
    rwc_state[RWC_FRAME_FLUSH]: // Flush frame in case of overflow,error frame
                                // or runt frame received.
      begin
        next_rwc_state[RWC_IDLE] = `H;
      end    
                                
    rwc_state[RWC_WR_WAIT]: // WRITE wait state when GMAC is not ready with
                            // the data.
      begin
        if (mri_val_i) begin
          if (flush_curr_frame | (~mri_eof_i & rwc_fifo_full & ~updt_wr_ptr))
            next_rwc_state[RWC_FRAME_FLUSH] = `H;
          else if (rwc_fifo_full | mri_eof_i)  
            next_rwc_state[RWC_EOF_RCVD] = `H;
          else
            next_rwc_state[RWC_WRITE] = `H;
        end
        else
          next_rwc_state[RWC_WR_WAIT] = `H;
      end
    
    endcase
    // leda W225 on
  end



//---------------------------------------------------------------------------// 
// Rxdata FIFO Write Control                                                 //
// This block generates the control signals required for writing the frame   //
// into the Rxdata FIFO.                                                     // 
//---------------------------------------------------------------------------// 
  assign rx_fifo_full = (rwc_fifo_full | (rwc_fifo_full_mns1 & rwc_wr_ptr_incr));
  assign rwc_fifo_wr =  rwc_state[RWC_WRITE] | rwc_state[RWC_EOF_RCVD];
  assign rwc_wr_ptr_incr =  rwc_state[RWC_WRITE] | rwc_state[RWC_EOF_RCVD];
  
  
  // Rxdata FIFO pointer
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_wr_ptr <= {(`RX_FIFO_PTR_WIDTH+1){`L}};
    else
      if (rwc_frame_flush) 
        rwc_wr_ptr <= rwc_wrptr_2_rd;
      else if (rwc_wr_ptr_incr)
        rwc_wr_ptr <= rwc_wr_ptr_pls1;
  end

  // Flush Current Frame on Rxdata FIFO overflow or runt frame reception or
  // error frame reception, when the whole frame remains in Rxdata FIFO.
  
  assign rwc_frame_flush = rwc_state[RWC_FRAME_FLUSH];

  assign flush_curr_frame = mri_val_i & mri_eof_i & ~updt_wr_ptr &
                            ((mri_rxstatus_i[15] & (~scr_fwd_runt_e | error)) | 
                             (~scr_fwd_err_frame & error));
                            
  assign fifo_ovf = mri_val_i & (~mri_eof_i | (mri_eof_i & ~sp_avbl_eof)) & 
                    rx_fifo_full;
  
  // FIFO overflow detected
  assign rwc_fifo_ovf = fifo_ovf & ~fifo_ovf_r;
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      fifo_ovf_r <= `L;
    else
      if (mri_eof_i)
        fifo_ovf_r <= `L;
      else if ((fifo_ovf | flush_curr_frame) & 
               (rwc_state[RWC_IDLE] | rwc_state[RWC_WRITE] |
                rwc_state[RWC_WR_WAIT]))
        fifo_ovf_r <= `H;
  end    
  
  // Receive Threshold

                                                            

      assign rcv_thrshld = (scr_rxthreshctrl == 2'b11) ? 
                                        {{(`RX_FIFO_PTR_WIDTH-6){`L}},6'h20} :
                           (scr_rxthreshctrl == 2'b10) ? 
                                        {{(`RX_FIFO_PTR_WIDTH-5){`L}},5'h18} :
                           (scr_rxthreshctrl == 2'b01) ? 
                                        {{(`RX_FIFO_PTR_WIDTH-5){`L}},5'h08} :
                                        {{(`RX_FIFO_PTR_WIDTH-5){`L}},5'h10} ;

  
  // Update Write pointer

  // Number of bytes or locations available in the FIFO is calculated as follows
  // FIFO Depth - Start pointer (Current frame) + Current write pointer.
  // For e.g , if FIFO Depth is 16 .
  assign filled_locns = {`H,{`RX_FIFO_PTR_WIDTH{`L}}} - 
                        {`L,rwc_wrptr_2_rd[`RX_FIFO_PTR_WIDTH-1:0]} + 
                        {`L,rwc_wr_ptr[`RX_FIFO_PTR_WIDTH-1:0]};

  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      updt_wr_ptr <= `L;
    else
      if (rwc_state[RWC_IDLE] | 
          (rwc_state[RWC_WRITE] & next_rwc_state[RWC_FRAME_FLUSH]))
        updt_wr_ptr <= `L;
      else if (rwc_state[RWC_WRITE] & ~scr_str_n_fwd &
               (filled_locns[`RX_FIFO_PTR_WIDTH-1:0] >= rcv_thrshld))
        updt_wr_ptr <= `H;
  end
  
  // Write pointer for Synchronisation to read clock domain.
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_wrptr_2_rd <= {(`RX_FIFO_PTR_WIDTH+1){`L}};
    else
      if ((updt_wr_ptr & rwc_wr_ptr_incr) | 
          (rwc_state[RWC_EOF_RCVD] & next_rwc_state[RWC_IDLE])) 
        rwc_wrptr_2_rd <= rwc_wr_ptr_pls1;
      else if (updt_wr_ptr)  
        rwc_wrptr_2_rd <= rwc_wr_ptr;
  end
  
  // Status write to be Sync'd to Read clock is held high until this value
  // is transferred to read clock.When rsb_ack_wrptr_2_rd is high, the signal 
  // is sychronised to read clock.
  
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_sts_wrtn <= `L;
    else
      if (rwc_state[RWC_EOF_RCVD] & next_rwc_state[RWC_IDLE]) 
        rwc_sts_wrtn <= `H;
      else if (rsb_ack_wrptr_2_rd) 
        rwc_sts_wrtn <= `L;
  end

  //-------------------------//
  //-------FIFO Data---------//  
  //-------------------------//

  // Data Register
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      mri_data_r <= {`DATAWIDTH{`L}};
    else
      if (rwc_state[RWC_EOF_RCVD] & fifo_ovf_r)
        mri_data_r <= `OVF_STS;

      else if (rwc_state[RWC_EOF_RCVD])
        mri_data_r <= rwc_sts;

      else if (mri_val_i & (~rx_fifo_full | (mri_eof_i & sp_avbl_eof)))
        mri_data_r <= mri_data_i;
  end


  // Byte Enable Register
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_be <= {`DATAWIDTH/64+2{`L}};
    else
      if (mri_val_i & mri_eof_i) 
        rwc_be <= mri_be_i;
      else
        rwc_be <= {`DATAWIDTH/64+2{`H}};
  end


  // End of frame register
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_eof <= `L;
    else
      if ((rwc_state[RWC_IDLE] | rwc_state[RWC_WRITE] | rwc_state[RWC_WR_WAIT]) & 
          next_rwc_state[RWC_EOF_RCVD])
        rwc_eof <= `H;
      else if (rwc_state[RWC_EOF_RCVD]) 
        rwc_eof <= `L;
  end
   
  // FIFO Write Control and data signals
  assign rwc_wr_addr_o = rwc_wr_ptr[`RX_FIFO_PTR_WIDTH-1:0];
  assign rwc_wr_csn_o = ~rwc_fifo_wr;
  assign rwc_wr_en_o = rwc_fifo_wr;
  assign rwc_wr_data_o[`DATAWIDTH-1:0] = mri_data_r;
  assign rwc_wr_data_o[`FIFO_DATA_WIDTH-2:`DATAWIDTH] = rwc_be;
  assign rwc_wr_data_o[`FIFO_DATA_WIDTH-1] = rwc_eof;

  
  // FIFO Status Control signals
  assign rwc_wr_ptr_pls4 = rwc_wr_ptr + 4;
  assign rwc_wr_ptr_pls3 = rwc_wr_ptr + 3;
  assign rwc_wr_ptr_pls2 = rwc_wr_ptr + 2;
  assign rwc_wr_ptr_pls1 = rwc_wr_ptr + 1;
  assign wrptr_pls4_eq_rd = (rwc_wr_ptr_pls4[`RX_FIFO_PTR_WIDTH] != 
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH]) & 
                            (rwc_wr_ptr_pls4[`RX_FIFO_PTR_WIDTH-1:0] ==
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH-1:0]);
                            
  assign wrptr_pls3_eq_rd = (rwc_wr_ptr_pls3[`RX_FIFO_PTR_WIDTH] != 
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH]) & 
                            (rwc_wr_ptr_pls3[`RX_FIFO_PTR_WIDTH-1:0] ==
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH-1:0]);
                            
  assign wrptr_pls2_eq_rd = (rwc_wr_ptr_pls2[`RX_FIFO_PTR_WIDTH] != 
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH]) & 
                            (rwc_wr_ptr_pls2[`RX_FIFO_PTR_WIDTH-1:0] ==
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH-1:0]);
  
  assign wrptr_pls1_eq_rd = (rwc_wr_ptr_pls1[`RX_FIFO_PTR_WIDTH] != 
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH]) & 
                            (rwc_wr_ptr_pls1[`RX_FIFO_PTR_WIDTH-1:0] ==
                             rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH-1:0]);
                             
  assign wrptr_eq_rd = (rwc_wr_ptr[`RX_FIFO_PTR_WIDTH] != 
                        rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH]) & 
                       (rwc_wr_ptr[`RX_FIFO_PTR_WIDTH-1:0] ==
                        rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH-1:0]);

  
  // FIFO full control signal is high when only two or less than two spaces is
  // left in the Rxdata FIFO
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_fifo_full <= `L;
    else
      if (wrptr_pls3_eq_rd & rwc_wr_ptr_incr)
        rwc_fifo_full <= `H;
      else if (!wrptr_pls3_eq_rd & !wrptr_pls2_eq_rd & 
               !wrptr_pls1_eq_rd & !wrptr_eq_rd) 
        rwc_fifo_full <= `L;
  end

  // FIFO almost full control signal is high when only three spaces
  // are left in the Rxdata FIFO
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_fifo_full_mns1 <= `L;
    else
      if ((wrptr_pls4_eq_rd & rwc_wr_ptr_incr) |
          (wrptr_pls3_eq_rd & ~rwc_wr_ptr_incr))
        rwc_fifo_full_mns1 <= `H;
      else   
        rwc_fifo_full_mns1 <= `L;
  end
  
  // Space available for EOF and status.
  assign sp_avbl_eof = ~((wrptr_pls1_eq_rd | wrptr_eq_rd) & rwc_fifo_full);

  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rxfifo_empty <= `L;
    else
      rxfifo_empty <= (rwc_wr_ptr == rdptr_2_wr_sync); 
  end

  assign rwc_dbg_sts = {rxfifo_empty, rwc_fifo_full, !rwc_state[RWC_IDLE]};

  //----------------------------------------//
  //-----Receive Frame Length FIFO Control--//
  //----------------------------------------//
 
  assign rwc_len_wr_ptr_pls1 = rwc_len_wr_ptr + 1;
  
  // Frame Length FIFO write pointer generation
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_len_wr_ptr <= {`MAX_FRAME_CNT_WIDTH-1{`L}};
    else if (rwc_state[RWC_EOF_RCVD] & ~rwc_eof)

      rwc_len_wr_ptr <= rwc_len_wr_ptr_pls1;
  end    
  
  // Frame Length FIFO Write Control signals
  assign rwc_len_wr_addr_o = rwc_len_wr_ptr;
  assign rwc_len_wr_en_o = rwc_state[RWC_EOF_RCVD] & ~rwc_eof;
  assign rwc_len_wr_csn_o = ~(rwc_state[RWC_EOF_RCVD] & ~rwc_eof);


//---------------------------------------------------------------------------// 
// Status Generation for Rxdata FIFO                                         //
// This block generates the Status signal which is written into the Rxdata   //
// FIFO.                                                                     // 
//---------------------------------------------------------------------------//                                                   

  // Status Register to store Status from GMAC
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      mri_rxstatus_r <= {`CORE_STATUS_WIDTH{`L}};
    else
      if (mri_val_i & mri_eof_i & sp_avbl_eof) 
        mri_rxstatus_r <= mri_rxstatus_i;
  end                                                     
        

  assign rwc_sts = {1'b0, 
                    mri_rxstatus_r[24],   // Destination Addr Filter Fail
                    mri_rxstatus_r[13:0], // Frame Length 
                    error_frame,          // Error Summary to application
                    1'b0, 
                    mri_rxstatus_r[25],   // Source Addr Filter Fail
                    mri_rxstatus_r[23],   // Length Error
                    fifo_ovf_r,           // Overflow Error
                    mri_rxstatus_r[22],   // VLAN Frame
                    2'b00,        
                    mri_rxstatus_r[16],   // Giant Frame
                    mri_rxstatus_r[17],   // Late Collision Seen
                    mri_rxstatus_r[18],   // Frame Type
                    mri_rxstatus_r[14],   // Watch dog Timeout
                    mri_rxstatus_r[19],   // Receive Error
                    mri_rxstatus_r[20],   // Dribble Bit Error
                    mri_rxstatus_r[21],   // CRC Error
                    (|mri_rxstatus_r[31:28])}; // Rx MAC Addr Match reg     
  
  assign error_frame = 
                       mri_rxstatus_r[16] | 
                       mri_rxstatus_r[21] | mri_rxstatus_r[19] | 
                       mri_rxstatus_r[14] | mri_rxstatus_r[17] | fifo_ovf_r;

  assign rx_frame_len = mri_rxstatus_r[13:0];

  assign error = 
                 mri_rxstatus_i[16] |
                 mri_rxstatus_i[21] | mri_rxstatus_i[17] | mri_rxstatus_i[19] | 
                 mri_rxstatus_i[14] | fifo_ovf_r;

// Error Frame bit
  always @(`RX_RST_MODE) begin
  if (~rst_clk_rx_n)
    rwc_err_frame_o <= `L;
  else if (mri_val_i & mri_eof_i)
    rwc_err_frame_o <= error & ~scr_fwd_err_frame;
  end  

//---------------------------------------------------------------------------// 
// Hardware Flow Control                                                     //
// This block generates the flow control rwc_flowctrl signal for the GMAC to  //
// do backpressure or generate pause frame.The assertion and deassertion of  //
// flow control signal happens based on the Fill level threshold of the      //
// Rxdata FIFO                                                               //
//---------------------------------------------------------------------------//                                                   
 
  // Flow control activation Threshold










        assign act_thrshld = (scr_thresh_act == 3'b000) ? 13'h00FF:
                             (scr_thresh_act == 3'b001) ? 13'h01FF:
                             (scr_thresh_act == 3'b010) ? 13'h02FF:
                             (scr_thresh_act == 3'b011) ? 13'h03FF:
                             (scr_thresh_act == 3'b100) ? 13'h04FF:
                             (scr_thresh_act == 3'b101) ? 13'h05FF:
                             (scr_thresh_act == 3'b110) ? 13'h06FF:
                                                          13'h0000;


        assign deact_thrshld = (scr_thresh_deact == 3'b000) ? 13'h00FF:
                               (scr_thresh_deact == 3'b001) ? 13'h01FF:
                               (scr_thresh_deact == 3'b010) ? 13'h02FF:
                               (scr_thresh_deact == 3'b011) ? 13'h03FF:
                               (scr_thresh_deact == 3'b100) ? 13'h04FF:
                               (scr_thresh_deact == 3'b101) ? 13'h05FF:
                               (scr_thresh_deact == 3'b110) ? 13'h06FF:
                                                              13'h0000;



        
                                                             
      
  assign avail_locns = (wrptr_eq_rd == `L) ? 
                                ({13{`H}} -
                                 rwc_wr_ptr[`RX_FIFO_PTR_WIDTH-1:0] + 
                                 rdptr_2_wr_sync[`RX_FIFO_PTR_WIDTH-1:0]) : 
                                {13{`L}};

  assign flowctrl_assrt = (avail_locns <= act_thrshld) & scr_hwflowctrl_e;
  assign flowctrl_deassrt = (avail_locns >= deact_thrshld) & scr_hwflowctrl_e;

  // Flow control signal
  always @(`RX_RST_MODE) begin
    if (~rst_clk_rx_n)
      rwc_flowctrl <= `L;
    else
      if (flowctrl_deassrt) 
        rwc_flowctrl <= `L;
      else if (flowctrl_assrt)
        rwc_flowctrl <= `H;
  end 


endmodule
                                                         
