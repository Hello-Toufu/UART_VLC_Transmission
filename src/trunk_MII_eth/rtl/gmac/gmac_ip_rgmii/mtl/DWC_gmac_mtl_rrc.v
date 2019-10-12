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
// Date             :        $Date: 2007/11/19 $
// File Version     :        $Revision: #44 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                   //
// MTL Receive Read Controller                                               //
//                                                                           //
// DESCRIPTION:                                                              //
// The primary functions of MTL Receive Read Controller(RRC) are             //
// 1. Monitoring for the number of bytes of frame in the FIFO and start a    //
//    a frame transmission to application of the number of bytes available   //
//    crosses the threshold or the entire frame is written into the FIFO     //
// 2. When application requests MTL to flush the current frame,this block    //
//    keeps on reading the data from Rxdata FIFO until the End of frame and  //
//    and status is read out.                                                //
//---------------------------------------------------------------------------//

module DWC_gmac_mtl_rrc (
 
        clk_app_i,
                         rst_clk_app_n,
                         // MTL Receive Application interface.
                         ari_ack_i,
                         ari_val_o,
                         ari_sof_o,
                         ari_eof_o,
                         ari_data_o,
                         ari_be_o,
                         ari_rxstatus_val_o,
                         // MTL <-> RxData FIFO Read Interface.
                         rrc_rd_addr_o,
                         rrc_rd_csn_o,
                         rrc_rd_data_i,
                         rrc_rd_en_o,
                         // MTL <-> Rx Frame Length FIFO read interface
                         rrc_len_rd_addr_o,
                         rrc_len_rd_csn_o,
                         rrc_len_rd_data_i,
                         rrc_len_rd_en_o,
                         // SYNC Block signals
                         rwc_sts_wrtn_sync,
                         wrptr_2_rd_sync,
                         rsb_wrptr_2_rd_syncd,
                         rrc_rdptr_2_wr,
                         rrc_dbg_sts,
                         // Miscellanous signals
                         ari_frameflush_i,
                         ari_pbl_i,
                         ari_rxfifo_frm_cnt_o,
                         ari_frame_len_o,
                         ari_frame_len_val_o,
                         ari_err_frame_o,        
                         ari_rx_watermark_o
                         );

// Input and Output potr declarations

// Clock and reset
  input                         clk_app_i;         // Application Clock.
  input                         rst_clk_app_n;     // Active low reset
                                                   // synchronous to clk_app_i.

// MTL Receive Application interface.
  input                         ari_ack_i;         // Ack from application for
                                                   // received frame data and 
                                                   // received status.
                                                   
  output                        ari_val_o;         // Qualifies ari_sof_o
                                                   // ari_eof_o, ari_data_o
                                                   // ari_be_o and frame status 
                                                   
  output                        ari_sof_o;         // Start of frame
  output                        ari_eof_o;         // End of frame 
  output [`DATAWIDTH-1:0]       ari_data_o;        // Frame data to application
  output [`DATAWIDTH/64+1:0]    ari_be_o;          // Byte enables for frame
                                                   // data.
  output                        ari_rxstatus_val_o;// Receive frame status 
                                                   // valid.

// MTL <-> RxData FIFO Read Interface.
  output [`RX_FIFO_PTR_WIDTH-1:0] rrc_rd_addr_o;   // Read address of RxData 
                                                   // FIFO.
                                                   
  output                          rrc_rd_csn_o;    // Chip select to RxData FIFO
  input  [`FIFO_DATA_WIDTH-1:0]   rrc_rd_data_i;   // Read data from RxData FIFO
  output                          rrc_rd_en_o;     // Read enable from RxData
                                                   // FIFO

// MTL <-> Rx Frame Length FIFO read interface                                                   
  output [`MAX_FRAME_CNT_WIDTH-2:0]  rrc_len_rd_addr_o; // read address to
                                                        // Rx Frame Length FIFO
                                                        
  output                             rrc_len_rd_csn_o;  // chip select to read
                                                        // Rx Frame Length FIFO
                                                        
  input  [`FRAME_LEN_FIFO_WIDTH-1:0] rrc_len_rd_data_i; // Rx Frame Length from
                                                        // FIFO

  output                             rrc_len_rd_en_o;   // read enable to 
                                                        // Rx Frame Length FIFO

// SYNC Block signals
  input                           rwc_sts_wrtn_sync; // End of frame sync'd
                                                     // to application clock
                                                     
  input  [`RX_FIFO_PTR_WIDTH:0]   wrptr_2_rd_sync; // Rxdata FIFO Write pointer
                                                   // synchronised to read clock
                                                   // domain
  input                           rsb_wrptr_2_rd_syncd; // Signal indicates the
                                                        // wrptr from the rwc is
                                                        // sync'd to read clock
  output [1:0]                  rrc_dbg_sts;        // RRC Debug signals
                                                    
  output [`RX_FIFO_PTR_WIDTH:0]   rrc_rdptr_2_wr;  // Rxdata FIFO read pointer
                                                   // to SYNC block.
                                                   
// Miscellanous signals
  input                         ari_frameflush_i;  // Flush current frame, 
                                                   // request from application
                                                   
  input  [`ARI_PBL_WIDTH-1:0]   ari_pbl_i;     // Maximum number of data phases
                                              // during a single burst transfer

  output                        ari_rx_watermark_o; // Signal indicates the 
                                                    // availability of data in
                                                    // Rxdata FIFO as requested 
                                                    // through ari_pbl_i.
  output [`MAX_FRAME_CNT_WIDTH-1:0]	 ari_rxfifo_frm_cnt_o; // Indicates # of EOFs
                                                           // in FIFO

  output [`FRAME_LEN_FIFO_WIDTH-2:0] ari_frame_len_o;// Indicates the Length of
                                                     // frame (i.e currently 
                                                     // transmitted or pending for
                                                     // transmission) to appln
  
  output                        ari_frame_len_val_o; // Signal validating the
                                                     // frame length on 
                                                     // ari_frame_len_o

  output                        ari_err_frame_o;     // Signal indicates the
                                                     // error frame when forward
                                                     // error frame(bit7 of OMR)
                                                     // is not set.
// Parameter declarations
  parameter  [3:0]  RRC_IDLE = 4'd0,
                    RRC_READ = 4'd1,
                    RRC_ABORT = 4'd2, 
                    RRC_SEND_STS = 4'd3;

  reg                           ari_rxstatus_val_o; 
  reg                           rrc_send_rxstatus_r; // Registered version of rrc_send_rxstatus_c
                    
  reg [3:0]                     rrc_state;          // Current state variable
                                                    // of Read Control FSM.
                                                    
  reg [3:0]                     next_rrc_state;     // Next state variable of 
                                                    // Read Control FSM.
                                                    
  reg                           frameflush_lat;     // Latched ari_frameflush_i                                                  
                                                    
  reg                           data_pftch;         // Data prefetch ON
  reg                           rrc_rd_ptr_incr;    // RxData FIFO Read pointer
                                                    // increment

  reg [`RX_FIFO_PTR_WIDTH:0]    rrc_rd_ptr;         // RxData FIFO Read pointer                                                    
                                                    
  reg                           rrc_rd_ptr_incr_r;  // Registered pointer
                                                    // increment signal.
  reg                           rrc_rd_en_o;        // Read enable from RxData
                                                    // FIFO
                                                    
  reg [1:0]                     fill_status;        // Signal indicating
                                                    // data fill level of 2
                                                    // stage registers.
                                                    
  reg [`DATAWIDTH-1:0]          reg0_data;          // First data register stage
  reg [`DATAWIDTH-1:0]          reg1_data;          // Second data register
                                                    // stage
  reg                           eof0_rcvd_r;        // First EOF register stage 
  reg                           eof1_rcvd_r;        // Second EOF register stage
  reg [`DATAWIDTH/64+1:0]       be0_rcvd_r;         // First Byte enable register
  reg [`DATAWIDTH/64+1:0]       be1_rcvd_r;         // Second Byte enable register
  reg [`DATAWIDTH-1:0]          ari_data_o;         // Frame data to application                                                    
  reg                           eof;                // End of frame bit 
                                                    // from Rxdata FIFO
  reg [`DATAWIDTH/64+1:0]       rrc_be;   // internal byte enables (sequential)
  reg [`DATAWIDTH/64+1:0]       rrc_be_c; // internal byte enables (combinational)
  
  reg                           data_valid;         // Qualifies ari_sof_o
                                                    // ari_eof_o, ari_data_o
                                                    // ari_be_o and frame status.
                                                    
  reg                           ari_sof_o;          // Start of frame 
  reg [1:0]                     rrc_fsm_sts;        // RRC FSM state
                                                    
  reg                           rrc_fifo_empty;     // Rxdata FIFO empty
  reg                           rrc_fifo_empty_mns1;// Rxdata FIFO almost empty
  
  reg [`MAX_FRAME_CNT_WIDTH-1:0]rx_fifo_frm_cnt;    // Counter to track the 
                                                    // number of frames written
  reg [`MAX_FRAME_CNT_WIDTH-2:0] rrc_len_rd_ptr;    // Rx Frame length FIFO 
                                                    // read pointer  
  
  reg                           rrc_len_rd_incr;    // RxData Frame length FIFO
                                                    // read pointer increment
  reg                           rrc_len_rd_incr_r;  // Registered rrc_len_rd_incr
                                                    // signal
  reg                           rrc_len_rd_en_o;    // read enable to 
                                                    // Rx Frame Length FIFO
  
  reg                           ari_rx_watermark_o; // Signal indicates the 
                                                    // availability of data in
                                                    // Rxdata FIFO as requested 
                                                    // through ari_pbl_i.
  reg                           sts_not_read;       // registered signal used 
                                                    // to indicate status is not 
                                                    // read from RxFIFO

  reg                           rsb_wrptr_2_rd_syncd_r; // registered signal
                                                        // indicating that 
                                                        // wrptr from the rwc is
                                                        // sync'd to read clock

  reg [`FRAME_LEN_FIFO_WIDTH-2:0] ari_frame_len_o;   // Indicates the Length of
                                                     // frame (i.e currently 
                                                     // transmitted or pending for
                                                     // transmission) to appln
                                                     
  reg                           ari_frame_len_val_o; // Signal validating the
                                                     // frame length on 
                                                     // ari_frame_len_o

  reg                           ari_err_frame_o;     // Signal indicates the error
                                                     // frame to appln when fwd
                                                     // error frame(OMR) is reset
  
  reg                           drop_err_frame;      // Error frame indication
                                                     // from the Frame Length FIFO
                                                     // used to drop the frame.

  
                                                    
  wire                          ack;                // Internal Ack generated 
                                                    // for frame flush
                                                    
  wire                          rrc_rd_ptr_incr_c;  // Comibanational read
                                                    // pointer increment
                                                    
                                                    
  wire  [`RX_FIFO_PTR_WIDTH-1:0] fifo_fill_level;   // Data availability in
                                                    // Rxdata FIFO
                                                    
  wire                           watermark;         // Signal indicates the 
                                                    // availability of data in
                                                    // Rxdata FIFO as requested 
                                                    // through ari_pbl_i
  wire  [`RX_FIFO_PTR_WIDTH:0]   rrc_rd_ptr_pls1;   // Read pointer value + 1 
  wire  [`RX_FIFO_PTR_WIDTH:0]   rrc_rd_ptr_pls2;   // Read pointer value + 2

  wire  [`MAX_FRAME_CNT_WIDTH-2:0] rrc_len_rd_ptr_pls1; // rrc_len_rd_ptr + 1

  wire                           drop_err_frame_c;  // Combinational error frame 
                                                    // signal from Frame Length 
                                                    // FIFO. 

  wire                           rx_fifo_empty;     // FIFO empty or almost empty
                                                    // indication.
  wire                           sts_wrtn_pulse;    // Pulse indicating status of 
                                                    // frame has been written 
                                                    // into RxFIFO
  wire                           rrc_send_rxstatus; // asserted when rx status is 
                                                    // available for sending to appl
  wire                           rrc_send_rxstatus_c; // combinational rrc_send_rxstatus
  wire [`DATAWIDTH/64+1:0]       ari_be_o; // Byte enables for frame data to application


  
//-----------------------------------------------------------------------//  
// Receive Read Control FSM                                              //
// Read control FSM schedules the transfer of the receive frame data from//
// RxData FIFO to the application. When application requests MTL to flush//
// the current frame being transferred to application,MTL reads out the  //
// entire frame data and the status.                                     //
//-----------------------------------------------------------------------//

  // Registered Frame Flush request.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      frameflush_lat <= `L;
    else
      if (rrc_send_rxstatus | rrc_state[RRC_IDLE]) 

        frameflush_lat <= `L;
      else if (ari_frameflush_i)
        frameflush_lat <= `H;
  end
  


  // Sequential state assignment
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_state <= 4'b0001;
    else
      rrc_state <= next_rrc_state;
  end

  // Combinational logic deriving next state
  always @(*)
  begin
    next_rrc_state = 4'h0;

    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 W225 off
    case(1'b1) // synopsys full_case parallel_case 
    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 on
    rrc_state[RRC_IDLE]: // Idle
      begin
        if (~ari_frameflush_i & (~rrc_fifo_empty | (|rx_fifo_frm_cnt)) & 
            rrc_rd_ptr_incr)
          next_rrc_state[RRC_READ] = `H;
        else  
          next_rrc_state[RRC_IDLE] = `H;
      end

    rrc_state[RRC_READ]: // Read Frame from RxData FIFO.
      begin
        if (ari_frameflush_i & (~eof | (sts_not_read & ~rrc_rd_ptr_incr_r)))

          next_rrc_state[RRC_ABORT] = `H;
else if (((~sts_not_read | ari_frameflush_i | rrc_rd_ptr_incr_r) & 
           eof & ack) | (~eof & sts_not_read & rrc_rd_ptr_incr_r & 
                         (fill_status == 2'b01))) 

          next_rrc_state[RRC_SEND_STS] = `H;
        else  
          next_rrc_state[RRC_READ] = `H;
      end

    rrc_state[RRC_SEND_STS]: // Send receive status to application.
      begin
        if (ack)
          next_rrc_state[RRC_IDLE] = `H;
        else  
          next_rrc_state[RRC_SEND_STS] = `H;
      end

    rrc_state[RRC_ABORT]:  // Flush out the entire frame
      begin
        if ((~sts_not_read & (eof | eof0_rcvd_r)) | 
            (sts_not_read & rrc_rd_ptr_incr_r)) 

          next_rrc_state[RRC_SEND_STS] = `H;
        else
          next_rrc_state[RRC_ABORT] = `H;
      end
    endcase
    // leda W225 on
  end 

// RRC FSM status registered and given out for proper synchronization
   always @(`APP_RST_MODE) begin
     if (~rst_clk_app_n)
       rrc_fsm_sts <= {2{`L}};
     else 
    // leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off    
        case(1'b1)  // synopsys full_case parallel_case
    // leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
          rrc_state[RRC_IDLE]     : rrc_fsm_sts <= 2'b00;
          rrc_state[RRC_READ]     : rrc_fsm_sts <= 2'b01;
          rrc_state[RRC_SEND_STS] : rrc_fsm_sts <= 2'b10;
          rrc_state[RRC_ABORT]    : rrc_fsm_sts <= 2'b11;
        endcase
   end

   assign rrc_dbg_sts = rrc_fsm_sts;


// Signal used when RxFIFO is empty and status is not read out from the
// RxFIFO.
always @(`APP_RST_MODE) begin
  if (~rst_clk_app_n)
    sts_not_read <= `L;
  else
    if (sts_not_read & rrc_rd_ptr_incr_r) 

      sts_not_read <= `L;
    else if (~rrc_rd_ptr_incr & rrc_rd_data_i[`FIFO_DATA_WIDTH-1] &
             rrc_rd_ptr_incr_r & 
             (rrc_state[RRC_READ] | rrc_state[RRC_ABORT])) 

      sts_not_read <= `H;
end


//--------------------------------------------------------------------------//
// Rxdata FIFO Read Control                                                 //
// This block generates the neccessary FIFO control signals for reading the // 
// data from the Rxdata FIFO.The FIFO read logic for asynchronous and       //
// synchronous memory read can be selected through parameters ASYNC_RAM,   //
// SYNC_READ                                                                // 
//--------------------------------------------------------------------------//
  // Internal ack when ari_ack_i is not asserted during frame flush.
  assign ack = ((ari_ack_i | ari_frameflush_i | frameflush_lat | drop_err_frame) & 

                (data_valid | rrc_send_rxstatus)) | 

                rrc_state[RRC_ABORT] | (drop_err_frame & !rrc_state[RRC_SEND_STS]);


  // Data prefetch
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      data_pftch <= `L;
    else
      data_pftch <= (~rrc_send_rxstatus_c & (~fill_status[1] | ack)) & 
                    (~rx_fifo_empty | ((|rx_fifo_frm_cnt) & rrc_state[RRC_IDLE])) & 
                    (~(eof0_rcvd_r | eof1_rcvd_r) | sts_not_read) & 
                    ~(rrc_rd_ptr_incr & rrc_rd_data_i[`FIFO_DATA_WIDTH-1] & 
                     rrc_rd_ptr_incr_r); 

  end

  // Read pointer Increment.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_rd_ptr_incr <= `L;
    else
      rrc_rd_ptr_incr <= (~rrc_send_rxstatus_c & (~fill_status[1] | ack)) & 
                         (~rx_fifo_empty | ((|rx_fifo_frm_cnt) & rrc_state[RRC_IDLE])) & 
                         (~(eof0_rcvd_r | eof1_rcvd_r) | sts_not_read) & 
                         ~(rrc_rd_ptr_incr & rrc_rd_data_i[`FIFO_DATA_WIDTH-1] & 
                           rrc_rd_ptr_incr_r); 

  end
  //-------------RX Data FIFO Read Control Signals---------------//
  assign rrc_rd_csn_o = ~(data_pftch & ~rrc_send_rxstatus_c);
  assign rrc_rd_addr_o = rrc_rd_ptr[`RX_FIFO_PTR_WIDTH-1:0];
  
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_rd_en_o <= `L;
    else
      rrc_rd_en_o <= rrc_rd_ptr_incr & ~rrc_send_rxstatus_c;
  end    
  //-------------------------------------------------------------//
  
  // Data Read has to be stopped after status is read.
  assign  rrc_rd_ptr_incr_c = rrc_rd_ptr_incr & ~rrc_send_rxstatus_c;

  // Read pointer Generation
  assign rrc_rdptr_2_wr = rrc_rd_ptr;
  assign rrc_rd_ptr_pls1 = rrc_rd_ptr + 1; 
  assign rrc_rd_ptr_pls2 = rrc_rd_ptr + 2; 
    
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_rd_ptr <= {(`RX_FIFO_PTR_WIDTH+1){`L}};
    else
      if (rrc_rd_ptr_incr_c) 
        rrc_rd_ptr <= rrc_rd_ptr_pls1;
  end
  
  // Delayed Read pointer Increment
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) 
      rrc_rd_ptr_incr_r <= `L;
    else
      rrc_rd_ptr_incr_r <= rrc_rd_ptr_incr_c;
  end
  
  // Fill status of the 2 stage Register 
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      fill_status <= {2{`L}};
    else
      if (rrc_rd_ptr_incr_c & ~ack)
        fill_status <= fill_status + 1;
      else if (ack & ~rrc_rd_ptr_incr_c & (fill_status != 2'b00))
        fill_status <= fill_status - 1;
  end      
  
  // Two Stage Registering of RxData inorder to sustain a burst
  // in the MTL Receive Application interface
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) begin
      reg0_data <= {`DATAWIDTH{`L}};
      reg1_data <= {`DATAWIDTH{`L}};
    end
    else begin
      if (rrc_rd_ptr_incr_r) begin
        reg0_data <= rrc_rd_data_i[`DATAWIDTH-1:0];
        reg1_data <= reg0_data;
      end
    end
  end  
        
 // Two state registering for End of frame 
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) begin
      eof0_rcvd_r <= `L;
      eof1_rcvd_r <= `L;
    end  
    else if (rrc_send_rxstatus & ack) begin
       eof0_rcvd_r <= `L;
       eof1_rcvd_r <= `L;
    end
    else begin
      if (rrc_rd_ptr_incr_r) begin
        eof0_rcvd_r <= rrc_rd_data_i[`FIFO_DATA_WIDTH-1];
        eof1_rcvd_r <= eof0_rcvd_r;
      end
    end
  end 

 // Two stage registering for Byte enables     
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) begin
      be0_rcvd_r <= {`DATAWIDTH/64+2{`L}};
      be1_rcvd_r <= {`DATAWIDTH/64+2{`L}};
    end  
    else begin
      if (rrc_rd_ptr_incr_r) begin
        be0_rcvd_r <= rrc_rd_data_i[`FIFO_DATA_WIDTH-2:`DATAWIDTH];
        be1_rcvd_r <= be0_rcvd_r;
      end
    end
  end
  
  // Data valid qualifying the ari_data_o and other control signals
  assign ari_val_o = data_valid;

  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) 
      data_valid <= `L;
    else
    if (ari_frameflush_i | frameflush_lat | drop_err_frame | ((eof | 

        (~rrc_rd_ptr_incr_r & (fill_status == 2'b01))) & 
         ari_ack_i & data_valid))

        data_valid <= `L;
      else if ((rrc_rd_ptr_incr_r | fill_status[1]) &
               (watermark | (rx_fifo_frm_cnt > 0)) &

               ~(rrc_state[RRC_SEND_STS] | next_rrc_state[RRC_SEND_STS]))
        data_valid <= `H;
  end

  
// MTL receive data to application.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) begin
      ari_data_o <= {`DATAWIDTH{`L}};
    end
    else begin
      if (rrc_rd_ptr_incr_r & (((fill_status[1:0] == 2'b10) & ack) |
                               (fill_status[1:0] == 2'b01)))
        ari_data_o <= rrc_rd_data_i[`DATAWIDTH-1:0];
      else if ((~rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b10) | 
               (rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b11))) & ack)
        ari_data_o <= reg0_data;
      else if (~rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b11) & ack)
        ari_data_o <= reg1_data;
    end
  end  
  
  // Start of frame
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      ari_sof_o <= `L;
    else
      if (ack | ari_frameflush_i | frameflush_lat)
        ari_sof_o <= `L;
      else if (rrc_state[RRC_IDLE] & rrc_rd_ptr_incr_c)
        ari_sof_o <= `H;
  end    
  
  // End of frame
  assign ari_eof_o = eof;
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) begin
      eof <= `L;
    end
    else if (eof & ack)
      eof <= `L;
    else begin
      if (rrc_rd_ptr_incr_r & (((fill_status[1:0] == 2'b10) & ack) |
                               (fill_status[1:0] == 2'b01)))
        eof <= rrc_rd_data_i[`FIFO_DATA_WIDTH-1];
      else if ((~rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b10) | 
               (rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b11))) & ack)
        eof <= eof0_rcvd_r;
      else if (~rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b11) & ack)
        eof <= eof1_rcvd_r;
    end
  end
                                                 
  // Byte Enables for MTL data                                             
  assign ari_be_o = rrc_be;

  always @(*) begin
    rrc_be_c = rrc_be;
    if (rrc_rd_ptr_incr_r & (((fill_status[1:0] == 2'b10) & ack) |
                             (fill_status[1:0] == 2'b01) | (fill_status[1:0] == 2'b00)))
      rrc_be_c = rrc_rd_data_i[`FIFO_DATA_WIDTH-2:`DATAWIDTH];
    else if ((~rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b10) | 
             (rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b11))) & ack)
      rrc_be_c = be0_rcvd_r;
    else if (~rrc_rd_ptr_incr_r & (fill_status[1:0] == 2'b11) & ack)
      rrc_be_c = be1_rcvd_r;  
  end

  always @(`APP_RST_MODE)
    if (~rst_clk_app_n)
      rrc_be <= {`DATAWIDTH/64+2{`L}}; 
    else
      rrc_be <= rrc_be_c;

  // rrc_send_rxstatus : Asserted when rx status is available for sending to app
  assign rrc_send_rxstatus = rrc_send_rxstatus_r;

  assign rrc_send_rxstatus_c = rrc_state[RRC_SEND_STS];


  always @(`APP_RST_MODE)
    if (!rst_clk_app_n)
      rrc_send_rxstatus_r <= `L;
    else
      if (rrc_send_rxstatus_r & ack)
        rrc_send_rxstatus_r <= `L;
      else
        rrc_send_rxstatus_r <= rrc_send_rxstatus_c;

  // Receive Status Valid generation
  always @(`APP_RST_MODE)
    if (!rst_clk_app_n)
      ari_rxstatus_val_o <= `L;
    else
      if (rrc_send_rxstatus_r & ack)
        ari_rxstatus_val_o <= `L;
      else
        if (~frameflush_lat & ~drop_err_frame)
          ari_rxstatus_val_o <= rrc_send_rxstatus_c;
        else
          ari_rxstatus_val_o <= `L;









  assign rx_fifo_empty = rrc_fifo_empty | (rrc_fifo_empty_mns1 & rrc_rd_ptr_incr);


  // FIFO Empty 
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_fifo_empty <= `H;
    else
      if ((rrc_rd_ptr_pls1 == wrptr_2_rd_sync) & rrc_rd_ptr_incr)
        rrc_fifo_empty <= `H;
    // leda NTL_RST06 off
      else if (rrc_rd_ptr != wrptr_2_rd_sync)
        rrc_fifo_empty <= `L;
    // leda NTL_RST06 on
    end

  // FIFO Almost Empty
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_fifo_empty_mns1 <= `L;
    else
      if ((rrc_rd_ptr_pls2 == wrptr_2_rd_sync) & rrc_rd_ptr_incr)
        rrc_fifo_empty_mns1 <= `H;
      else if ((rrc_rd_ptr_pls1 == wrptr_2_rd_sync) & ~rrc_rd_ptr_incr)
        rrc_fifo_empty_mns1 <= `H;
      else
        rrc_fifo_empty_mns1 <= `L;
  end
  
  assign fifo_fill_level = {`RX_FIFO_PTR_WIDTH{`H}} + 
                            wrptr_2_rd_sync[`RX_FIFO_PTR_WIDTH-1:0] - 
                            rrc_rd_ptr[`RX_FIFO_PTR_WIDTH-1:0];
                          
  // Watermark indication to application.
  assign watermark = (fifo_fill_level > {`L,ari_pbl_i}) & ~rrc_fifo_empty;

  // End of Frame Written Pulse generation
  assign sts_wrtn_pulse = rsb_wrptr_2_rd_syncd_r & rwc_sts_wrtn_sync;

  // rsb_wrptr_2_rd_syncd register
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rsb_wrptr_2_rd_syncd_r <= `L;
    else  
      rsb_wrptr_2_rd_syncd_r <= rsb_wrptr_2_rd_syncd;
  end
  
  // Frame in Rx Data FIFO counter.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
       rx_fifo_frm_cnt <= {`MAX_FRAME_CNT_WIDTH{`L}};
    else if (sts_wrtn_pulse & ~(rrc_send_rxstatus & ack))
      rx_fifo_frm_cnt <= rx_fifo_frm_cnt + 1;
    else if ((rrc_send_rxstatus & ack) & ~sts_wrtn_pulse)
      rx_fifo_frm_cnt <= rx_fifo_frm_cnt - 1;
  end    
  assign ari_rxfifo_frm_cnt_o = rx_fifo_frm_cnt;

  
  //------------------------------------//
  //----Rx Frame Length FIFO Control----//
  //------------------------------------//

  assign rrc_len_rd_ptr_pls1 = rrc_len_rd_ptr + 1;
  // Frame Length FIFO read pointer generation
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_len_rd_ptr <= {`MAX_FRAME_CNT_WIDTH-1{`L}};
    else if (rrc_len_rd_incr)  
      rrc_len_rd_ptr <= rrc_len_rd_ptr_pls1;
  end

  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_len_rd_incr <= `L;
    else
      rrc_len_rd_incr <= (rx_fifo_frm_cnt == 0) ? sts_wrtn_pulse :
                         (rx_fifo_frm_cnt == 1) ? (rrc_send_rxstatus & ack & sts_wrtn_pulse) :
                                                  (rrc_send_rxstatus & ack);
  end

  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_len_rd_incr_r <= `L;
    else
      rrc_len_rd_incr_r <= rrc_len_rd_incr;
  end

  // Frame Length FIFO read Control signals
  assign rrc_len_rd_addr_o = rrc_len_rd_ptr;
  assign rrc_len_rd_csn_o = ~rrc_len_rd_incr;
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      rrc_len_rd_en_o <= `L;
    else
      rrc_len_rd_en_o <= rrc_len_rd_incr;
  end    

  // Frame Length valid 
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      ari_frame_len_val_o <= `L;
    else if ((rx_fifo_frm_cnt == 0) || (rrc_send_rxstatus & ack)) 
      ari_frame_len_val_o <= `L;
    else if (rrc_len_rd_incr_r & ~(rrc_state[RRC_IDLE] & 
                                   rrc_len_rd_data_i[`FRAME_LEN_FIFO_WIDTH-1])) 

      ari_frame_len_val_o <= `H;
  end
  
  // Frame Length of current frame
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      ari_frame_len_o <= {(`FRAME_LEN_FIFO_WIDTH-1){`L}};
    else if (rrc_len_rd_incr_r) 

      ari_frame_len_o <= rrc_len_rd_data_i[`FRAME_LEN_FIFO_WIDTH-2:0]; 
  end

  // Drop Error Frame Indication to the application
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      ari_err_frame_o <= `L;
    else if (rrc_len_rd_incr_r & ~rrc_state[RRC_IDLE]) 

      ari_err_frame_o <= rrc_len_rd_data_i[`FRAME_LEN_FIFO_WIDTH-1]; 
    else if (rrc_send_rxstatus & ack)
      ari_err_frame_o <= `L;
  end


  // Error Frame received indication used to drop the frame internally
  assign drop_err_frame_c = rrc_len_rd_incr_r & rrc_state[RRC_IDLE] &
                            rrc_len_rd_data_i[`FRAME_LEN_FIFO_WIDTH-1];
  
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      drop_err_frame <= `L;
    else if (rrc_send_rxstatus & ack)
      drop_err_frame <= `L;
    else if (drop_err_frame_c)  
      drop_err_frame <= `H; 
  end
  
  // Watermark output to application	
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      ari_rx_watermark_o <= `L;
    else
      ari_rx_watermark_o <= (watermark | (rx_fifo_frm_cnt >0));
  end

    
  

endmodule
