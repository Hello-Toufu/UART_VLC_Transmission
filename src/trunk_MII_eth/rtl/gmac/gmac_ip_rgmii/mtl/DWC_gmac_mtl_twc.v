//--------------------------------------------------------------------------//
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
//--------------------------------------------------------------------------//
//--                                                                        
// Release version :  3.50a
// Date             :        $Date: 2007/11/16 $
// File Version     :        $Revision: #48 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                  //
// MTL Transmit Write controller(DWC_gmac_mtl_twc.v)                        //
//                                                                          //
// DESCRIPTION:                                                             //
// The primary function of MTL Transmit Write Controller(TWC) includes      //
// 1. Generating control signals for writing frame data, byte enables into  //
//    the data FIFO and disable pad,disable crc controls into seprate FIFO. //
// 2. Intimates the availability of transmit frame status to the application//
//    when the status FIFO is not empty.                                    //
//--------------------------------------------------------------------------//  

module DWC_gmac_mtl_twc (
        
        clk_app_i,
                         rst_clk_app_n,
                         // MTL Transmit Application Interface
                         ati_val_i,
                         ati_sof_i,
                         ati_eof_i,
                         ati_data_i,
                         ati_be_i,
                         ati_rdy_o,
                         ati_pbl_i,
                         ati_tx_watermark_o,
                         // MTL <-> TxData FIFO Write Interface
                         twc_wr_addr_o,
                         twc_wr_csn_o,
                         twc_wr_data_o,
                         twc_wr_en_o,
                         sw_flush_done_sync,
                         sts_wr_done_sync,
                         frame_abort_sync,
                         rdptr_2_wr_sync,
                         twc_wrptr_2_rd,
                         tsb_wrptr_2_rd_ack,
                         // Disable pad,Disable crc FIFO Interface
                         ati_dispad_i,
                         ati_discrc_i,
                         twc_dpdc_wr,
                         twc_dpdc_data,
                         // Status Control Signals
                         twc_sts_fifo_rd,
                         sts_rd_data,
                         sts_fifo_empty,
                         ati_txstatus_val_o,
                         ati_txstatus_o,
                         twc_dbg_sts,
                         ati_ack_i,
                         // Miscellanous Control Signals
                         sca_txthreshctrl,
                         sca_str_n_fwd,
                         ati_txfifoflush_clr_o,
                         sca_txfifoflush
                         );

// Input and output port declarations
  
// Clock and reset
  input                         clk_app_i;      // Application Clock.
  input                         rst_clk_app_n;  // Active low reset
                                                // synchronous to clk_app_i.

// MTL Transmit Application Interface
  input                         ati_val_i;      // Trasnfer/Data valid signal.
  input                         ati_sof_i;      // Start of frame indicator.
  input                         ati_eof_i;      // End of frame indicator.
  input  [`DATAWIDTH-1:0]       ati_data_i;     // Application data.
  input  [`DATAWIDTH/64+1:0]    ati_be_i;       // Binary encoded byte enables
                                                // for application data.
  output                        ati_rdy_o;      // Signal indicates MTL is 
                                                // ready to accept data.
                                                
  input  [`ATI_PBL_WIDTH-1:0]   ati_pbl_i;      // Maximum number of data phases
                                                // during a single burst transfer
  
  output                        ati_tx_watermark_o;// Signal indicates the 
                                                   // availability of space in
                                                   // Txdata FIFO as requested 
                                                   // through ati_pbl_i. 
  
// MTL <-> TxData FIFO Write Interface
  output [`TX_FIFO_PTR_WIDTH-1:0]twc_wr_addr_o; // Write address to Txdata FIFO
  output                         twc_wr_csn_o;  // Chip select to Txdata FIFO.
                                                
  output [`FIFO_DATA_WIDTH-1:0]  twc_wr_data_o; // Write data to Txdata FIFO.
  output                         twc_wr_en_o;   // Write enable to Txdata FIFO.
  
// Sync block signals
  
                                                  
  input                      sw_flush_done_sync;// S/W Flush done signal from
                                                // TxFIFO read control logic
                                                // indicating completion of 
                                                // flush operation.
                                                
  input                      sts_wr_done_sync;  // Status write done from read
                                                // TxFIFO read control logic
                                                // indicating completion of
                                                // frame transmission to GMAC.

  input                      frame_abort_sync;  // Frame abort status from
                                                // MAC is synchronised to 
                                                // write clock domain.
                                                
  input  [`TX_FIFO_PTR_WIDTH-1:0] rdptr_2_wr_sync; // Read pointer synchronised
                                                   // to write clock domain.
  
  output [`TX_FIFO_PTR_WIDTH:0] twc_wrptr_2_rd;    // Write pointer and Tx FIFO
                                                   // flush to be sync'd
                                                   // to read clock domain.
  
  input                         tsb_wrptr_2_rd_ack;// ACK for the write pointer
                                                   // and FIFO flush sync'd to 
                                                   // Tx clock 
  
  
// Disable pad,Disable crc (dpdc) FIFO Interface
  input                        ati_dispad_i;        // Disable pad control. 
  input                        ati_discrc_i;        // Disable crc control.
  output                       twc_dpdc_wr;         // dpdc FIFO write enable.
  output [1:0]                 twc_dpdc_data;       // dpdc FIFO write data.

// Status FIFO Interface
  output                       twc_sts_fifo_rd;   // Status FIFO read enable.
  input                        sts_fifo_empty;    // Status FIFO empty indicator 
  output                       ati_txstatus_val_o;// Status valid signal to
                                                  // application.
                                                  
  input  [17:0]                sts_rd_data;       // 18-bit data from status FIFO 
  output [17:0]                ati_txstatus_o;    // 18-bit Status to application
  output [1:0]                 twc_dbg_sts;       // {TxFIFO  not empty, TWc FSM not IDLE}
  
  input                        ati_ack_i;         // Ack for the status sent to
                                                  // application.

  

// Miscellanous Control Signals
  input  [2:0]                 sca_txthreshctrl;  // Frame transmission to MAC
                                                  // starts when the number of 
                                                  // bytes of a frame in Txdata 
                                                  // FIFO,crosses this threshold 
                                                  
  input                        sca_str_n_fwd;     // Signal requesting the MTL
                                                  // to start frame transmission
                                                  // only when a entire frame 
                                                  // resides in the FIFO.
                                                  
  input                        sca_txfifoflush;   // Signal to reset the TxData
                                                  // FIFO control logic.
                                                  
  output                       ati_txfifoflush_clr_o; // Signal to clear the
                                                      // FIFO flush input from
                                                      // CSR.

// End of port declarations  

// Parameter declarations.
  parameter [4:0]  TWC_IDLE = 5'd0,
                   TWC_WRITE = 5'd1,
                   TWC_ABORT = 5'd2,
                   TWC_WAIT_STS_FLUSH = 5'd3,
                   TWC_ADD_DUMMY_STS = 5'd4;

  reg [1:0]  twc_dpdc_data;

// Internal Reg and wire declarations 
  reg  [4:0]                 twc_state;         // Write Control FSM 
                                                // current state.
                                                
  reg  [4:0]                 next_twc_state;    // Write Control FSM next state.
 
  reg                        twc_fifo_wr;       // Txdata FIFO write enable 
                                                // to TxData FIFO.

  reg                        twc_wr_ptr_incr;   // Duplicate Txdata FIFO write 
                                                // enable added to avoid excess
                                                // loading on the write enable 
                                                // to Txdata FIFO.
  
  reg  [`DATAWIDTH-1:0]         twc_wdata;      // 32/64/128 bit data to Txdata
  reg  [`TX_FIFO_PTR_WIDTH-1:0] twc_wr_ptr;     // Txdata FIFO Write pointer.
                                                // FIFO.

  reg                        twc_dpdc_wr;       // dpdc FIFO write enable.                                       
  reg  [`DATAWIDTH/64+1:0]   twc_be;            // Byte enables to Txdata FIFO.
  reg                        twc_eof;           // End of frame delimiter to 
                                                // Txdata FIFO.
     
  reg                        wr_ptr_updt;       // Signal qualifies the write
                                                // pointer for synchronisation
                                                // to read clock domain.
                                                
  reg                        tx_fifoflush_lat;  // Tx FIFO flush from app latched
                                                // until transferred to Tx clock
  
  reg  [`TX_FIFO_PTR_WIDTH-1:0] wrptr_2_rd;     // Write pointer for 
                                                // synchronisation to read clock.
  
  
  reg  [`STS_PTR_WIDTH:0]  sts_pending;   // Up/Down Counter to track  
                                          // number of frames waiting for 
                                          // status frrom GMAC core.

  
                                              
  reg                        twc_fifo_full;     // Txdata FIFO Full signal
  reg                        twc_fifo_full_mns1;// Txdata FIFO almost Full 
                                                // signal
  reg                        txfifo_nempty;     // TxFifo not empty
                                                
  reg  [`STS_PTR_WIDTH:0]  fifo_frm_cnt;    // Up/Down counter to track 
                                            // number of frames in FIFO
                                            // at any instance.
  
                                                
  reg                        ati_rdy;         // MTL ready signal
  reg  [`TX_FIFO_PTR_WIDTH-1:0]thrshld_cnt; // Frame Transmit Threshold based
                                            // on number of bytes of a frame
                                            // written into Txdata FIFO.

  reg                        sw_flush_done_lat; // Latched sw_flush_done_sync 
                                                // signal.
  
  reg                        ati_tx_watermark_o;// Signal indicates the 
                                                // availability of space in
                                                // Txdata FIFO as requested 
                                                // through ati_pbl_i. 
  
  reg                        sca_txfifoflush_lat; // Latched sca_txfifoflush
                                                  // signal indicating Flush
                                                  // operation in progress.
  

  reg                        ati_txfifoflush_clr_o;// Signal to clear the
                                                   // FIFO flush input from
                                                   // CSR.
  
  wire [`TX_FIFO_PTR_WIDTH-1:0] twc_wr_ptr_pls1;// twc_wr_ptr + 1
  wire [`TX_FIFO_PTR_WIDTH-1:0] twc_wr_ptr_pls2;// twc_wr_ptr + 2
  wire [`TX_FIFO_PTR_WIDTH-1:0] twc_wr_ptr_pls3;// twc_wr_ptr + 3
  
  wire                          fifoflush_clr;  // Signal to clear the s/w
                                                // transmit FIFO flush 
                                                // Control bit.
  wire                          fifoflush_c;    // Combintaional signal 
                                                // indicating Flush operation in
                                                // progress.
  
  wire                          curr_fr_abrtd;  // Signal indicates Frame being 
                                                // transferred to Txdata FIFO
                                                // aborted by MAC. 
                                                
  wire [`TX_FIFO_PTR_WIDTH:0]   filled_locns;   // Number of locations written
                                                // into TxData FIFO.
  
  wire [`TX_FIFO_PTR_WIDTH-1:0] sp_avbl;        // Actual space available in
                                                // TxData FIFO.
  
  wire [`TX_FIFO_PTR_WIDTH-1:0] full_threshold; // Threshold of FIFO : (Full-4-PBL)
  
  wire                          water_mark;     // Signal indicates the 
                                                // availability of space as
                                                // requested through ati_pbl_i. 

  wire                          fifo_almost_full; // signal indicates the fifo
                                                  // has just 2 locations empty.

  wire   [`DATAWIDTH-1:0]       ati_data_endian;     // Application data converted to little endian


//--------------------------------------------------------------------------//
// Transmit Write Control FSM                                               //
// FSM schedules the data transfer from the application to the Tx           //
// asychronous data FIFO.                                                   //
//--------------------------------------------------------------------------//

  // Sequential state assignment
  always @(`APP_RST_MODE) begin 
    if (~rst_clk_app_n)
      twc_state <= 5'b00001;
    else
      twc_state <= next_twc_state;
  end    

  // combinational logic to derive the next state
  always @(*)
  begin
    next_twc_state = 5'b00000;

    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 W225 off
    case(1'b1) // synopsys full_case parallel_case
    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 on
      twc_state[TWC_IDLE]:  // Idle
        begin
          if (ati_val_i & ati_sof_i & ati_rdy)
            next_twc_state[TWC_WRITE] = `H;
          else if (sca_txfifoflush)
            next_twc_state[TWC_WAIT_STS_FLUSH] = `H;
          else 
            next_twc_state[TWC_IDLE] = `H;
        end

      twc_state[TWC_WRITE]: // Data writes to Tx data FIFO
        begin
          if (fifoflush_c)
            next_twc_state[TWC_WAIT_STS_FLUSH] = `H;
          else if (twc_eof) 
            next_twc_state[TWC_IDLE] = `H;
          else if (curr_fr_abrtd) 
            next_twc_state[TWC_ABORT] =`H;
          else
            next_twc_state[TWC_WRITE] = `H;
        end

      twc_state[TWC_ABORT]: // Current frame transmitted to TxFIFO is aborted
        begin
          if (sca_txfifoflush)
            next_twc_state[TWC_WAIT_STS_FLUSH] = `H;
          else if (((fifo_frm_cnt == `MAX_FRAME_IN_TXFIFO) & ati_eof_i) |
	           (fifo_frm_cnt != `MAX_FRAME_IN_TXFIFO))
            next_twc_state[TWC_IDLE] = `H;
	  else  
            next_twc_state[TWC_ABORT] = `H;
        end
        
      // MTL might be trasferring a frame to GMAC core when sca_txfifoflush is
      // asserted.So wait until status of this frmae is read out by application
      twc_state[TWC_WAIT_STS_FLUSH]: 
        begin
	  if (sw_flush_done_lat & sts_fifo_empty) begin
	    if (|fifo_frm_cnt)
              next_twc_state[TWC_ADD_DUMMY_STS] = `H;
            else 
              next_twc_state[TWC_IDLE] = `H;
	  end    
          else
            next_twc_state[TWC_WAIT_STS_FLUSH] = `H;
        end
      
      twc_state[TWC_ADD_DUMMY_STS]: // ADD duumy status for frame remaining in
                                    // TxFIFO.
        begin
          if (~(|fifo_frm_cnt))
            next_twc_state[TWC_IDLE] = `H;
          else
            next_twc_state[TWC_ADD_DUMMY_STS] = `H;
        end
    endcase    
    // leda W225 on
  end

// --------------------------------------------------------------------------//
// Write Control Interface                                                   //
// This block generates control signals for writing the data and byte enables//
// into Txdata FIFO,disable pad and disable crc into another 2-bit wide FIFO //
// --------------------------------------------------------------------------//
  
  assign twc_wr_csn_o = ~twc_fifo_wr;
  assign twc_wr_en_o = twc_fifo_wr;
  assign twc_wr_data_o = {twc_eof,twc_be,twc_wdata};
  
  // Txdata FIFO Write
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_fifo_wr <= `L;
    else 
      if (twc_state[TWC_ABORT] | twc_state[TWC_WAIT_STS_FLUSH]) 
        twc_fifo_wr <= `L;
      else 
        twc_fifo_wr <= (ati_val_i & next_twc_state[TWC_WRITE] & ati_rdy) | 
                       (curr_fr_abrtd & ~twc_eof);
  end

  // Txdata FIFO Write pointer Increment
  // Duplicate twc_fifo_wr added to avoid excessive loading on twc_fifo_wr,
  // which goes to external Tx Data FIFO.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_wr_ptr_incr <= `L;
    else 
      if (twc_state[TWC_ABORT] | twc_state[TWC_WAIT_STS_FLUSH]) 
        twc_wr_ptr_incr <= `L;
      else 
        twc_wr_ptr_incr <= (ati_val_i & next_twc_state[TWC_WRITE] & ati_rdy) | 
                           (curr_fr_abrtd & ~twc_eof);
  end

  // This wire is used to convert the data to little endian when application data
  // is in big endian format only in GMAC-MTL config with TX_COE feature.
  assign ati_data_endian = ati_data_i;

  // Transmit Data to TxData FIFO
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_wdata <= {`DATAWIDTH{`L}};
    else 
      if (ati_val_i)
        twc_wdata <= ati_data_endian;
  end    

  // Byte Enables to TxData FIFO
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_be <= {`DATAWIDTH/64+2{`L}};
    else 
      if (ati_val_i & ati_eof_i & ati_rdy)
        twc_be <= ati_be_i;
      else
        twc_be <= {`DATAWIDTH/64+2{`H}};
  end
  
  // End of frame indication to TxFIFO 
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_eof <= `L;
    else
      if (~(twc_state[TWC_WRITE] | twc_state[TWC_IDLE]) |
          (twc_state[TWC_WRITE] & next_twc_state[TWC_IDLE]) |
          (twc_state[TWC_IDLE] & ~(ati_sof_i & ati_val_i)))
        twc_eof  <= `L;
      else  
        twc_eof <= (ati_val_i & ati_eof_i & ati_rdy) | 
                     curr_fr_abrtd | sca_txfifoflush; 
  end

  // Current Frame is aborted when abort status is received for the same
  // frame from GMAC transmitter.
    assign curr_fr_abrtd = (~|sts_pending) & frame_abort_sync & 
                           twc_state[TWC_WRITE];

  // FIFO Frame Count
  // Tracks the number of frames(both full and partial) available 
  // at any instance in Tx data FIFO.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      fifo_frm_cnt <= {`STS_PTR_WIDTH+1{`L}};
    else 
      if (fifoflush_clr)
        fifo_frm_cnt <= {`STS_PTR_WIDTH+1{`L}};
      else if (twc_state[TWC_IDLE] & next_twc_state[TWC_WRITE] & 
               ~(~sts_fifo_empty & ati_ack_i))
        fifo_frm_cnt <= fifo_frm_cnt + 1;
      else if ((~sts_fifo_empty  | twc_state[TWC_ADD_DUMMY_STS]) & ati_ack_i & 
               ~(twc_state[TWC_IDLE] & next_twc_state[TWC_WRITE]))
        fifo_frm_cnt <= fifo_frm_cnt - 1;
  end
 
    // Status pending Up/Down Counter
    // Tracks the number of frames for which the status is yet to be received
    // from the GMAC core.
  always @(`APP_RST_MODE) begin
  if (~rst_clk_app_n)
    sts_pending <= {`STS_PTR_WIDTH+1{`L}};
  else 
    if (fifoflush_clr)
      sts_pending <= {`STS_PTR_WIDTH+1{`L}};
    else if ((curr_fr_abrtd | (twc_eof & ~twc_state[TWC_ABORT])) 
             & ~sts_wr_done_sync)
      sts_pending <= sts_pending + 1;
    else if (~(curr_fr_abrtd | (twc_eof & ~twc_state[TWC_ABORT])) 
             & sts_wr_done_sync)
      sts_pending <= sts_pending - 1;
  end


 
  // Ready signal from MTL
  assign ati_rdy_o = ati_rdy;
  assign fifo_almost_full = (twc_wr_ptr_pls3 == rdptr_2_wr_sync & twc_wr_ptr_incr & 
                             ati_val_i) | 
                            (twc_wr_ptr_pls2 == rdptr_2_wr_sync & (ati_val_i |
                             twc_wr_ptr_incr)) |
                            twc_fifo_full | twc_fifo_full_mns1;
  
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      ati_rdy <= `L;
    else if (fifoflush_c | (ati_val_i & ati_eof_i & ati_rdy) | 
             ((fifo_frm_cnt == `MAX_FRAME_IN_TXFIFO) & 
	            twc_state[TWC_IDLE]))
        ati_rdy <= `L;
      else if (twc_state[TWC_WRITE])
        ati_rdy <= ~(fifo_almost_full | ((fifo_frm_cnt == `MAX_FRAME_IN_TXFIFO) &
                                          next_twc_state[TWC_IDLE]));
      else if (twc_state[TWC_IDLE] | twc_state[TWC_ABORT])
        ati_rdy <= ~(twc_fifo_full | twc_fifo_full_mns1 |
                     twc_wr_ptr_pls2 == rdptr_2_wr_sync);
  end      
  
  // Disable pad, Disable crc write control
  always @(`APP_RST_MODE)
    if (!rst_clk_app_n)
      twc_dpdc_data <= 2'b00;
    else
      if (ati_val_i & ati_sof_i & ati_rdy)
        twc_dpdc_data <= {ati_dispad_i, ati_discrc_i};

  
  always @(`APP_RST_MODE) begin
   if (~rst_clk_app_n)
     twc_dpdc_wr <= `L;
   else
     twc_dpdc_wr <= ati_val_i & ati_sof_i & ati_rdy;
  end
  
//-------------------------------------------------------------------------//
// Write pointer Updation Logic                                            //
// This block generates the write pointer for Txdata FIFO and the also     // 
// neccessary control signals for synchronisation of this pointer to the   //
// read clock domain                                                       //
//-------------------------------------------------------------------------//

  assign twc_wr_addr_o = twc_wr_ptr;
  assign twc_wr_ptr_pls1 = twc_wr_ptr + 1;
  assign twc_wr_ptr_pls2 = twc_wr_ptr + 2;
  assign twc_wr_ptr_pls3 = twc_wr_ptr + 3;

  // Write pointer to Txdata FIFO
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_wr_ptr <= {`TX_FIFO_PTR_WIDTH{`L}};
    else
      if (fifoflush_clr) 
        twc_wr_ptr <= {`TX_FIFO_PTR_WIDTH{`L}};
      else if (twc_wr_ptr_incr) 
        twc_wr_ptr <= twc_wr_ptr_pls1;
  end

  // Update Write pointer

  // Number of locations filled in the FIFO is calculated as follows
  // FIFO Depth - Start pointer (Current frame) + Current write pointer.
  // For e.g , if FIFO Depth is 16 . Start pointer = 3 and
  // current write pointer = 5 . 
  // Number of filled locations = 16 -3 + 5 = 18(mod 16) = 2;
   
  assign filled_locns = {`H,{`TX_FIFO_PTR_WIDTH{`L}}} - {`L,wrptr_2_rd}  
                        + {`L,twc_wr_ptr};

  // This is the fifo threshold of (FIFO depth - 4 - PBL) locations. 
  // To avoid deadlock, write-pointer will be transferred to read domain when fill_locns 
  // crosses this threshold in store&forward mode.

  assign full_threshold = {{(`TX_FIFO_PTR_WIDTH-4){`H}},4'hB} - {`L,ati_pbl_i};

  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      wr_ptr_updt <= 1'b0;
    else if (twc_state[TWC_IDLE])
      wr_ptr_updt <= `L;
    else if (twc_state[TWC_WRITE] & sca_str_n_fwd & 
             ((~water_mark & (filled_locns[`TX_FIFO_PTR_WIDTH-1:0] > full_threshold) &
               ((fifo_frm_cnt == {{(`STS_PTR_WIDTH){`L}},`H}) |
                ((fifo_frm_cnt == {{(`STS_PTR_WIDTH){`H}},`L}) & ~sts_fifo_empty))) |
              (filled_locns[`TX_FIFO_PTR_WIDTH-1:0] > `GNT_FRAME_THRSHLD)))
        wr_ptr_updt <= `H;
      else if (twc_state[TWC_WRITE] & ~sca_str_n_fwd & 
               (filled_locns[`TX_FIFO_PTR_WIDTH-1:0] >= thrshld_cnt))
        wr_ptr_updt <= `H;
  end 

  // MTL Txdata FIFO threshold
  always @(*) 
  begin
  case (sca_txthreshctrl[2])
    1'b1: thrshld_cnt = {{(`TX_FIFO_PTR_WIDTH-4){`L}}, 
                            ~(sca_txthreshctrl[1] | sca_txthreshctrl[0]),
                             (sca_txthreshctrl[1] ^ sca_txthreshctrl[0]),
                             sca_txthreshctrl[0],1'b1};
 


    default: thrshld_cnt = {{(`TX_FIFO_PTR_WIDTH-6){`L}},sca_txthreshctrl[1:0], 4'hF};

  endcase
  end

  // Write pointer Updata Signal to sync logic  
  assign twc_wrptr_2_rd = {(sca_txfifoflush | tx_fifoflush_lat), wrptr_2_rd};

  // FIFO flush latched until transferred to Tx clock.
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      tx_fifoflush_lat <= `L;
    else if (tsb_wrptr_2_rd_ack)
      tx_fifoflush_lat <= `L;
    else if (sca_txfifoflush)
      tx_fifoflush_lat <= `H;
  end
 
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      wrptr_2_rd <= {`TX_FIFO_PTR_WIDTH{`L}};
    else
      if (fifoflush_c)
        wrptr_2_rd <= {`TX_FIFO_PTR_WIDTH{`L}};
      else if ((wr_ptr_updt & twc_wr_ptr_incr) | twc_eof) 
        wrptr_2_rd <= twc_wr_ptr_pls1;
      else if (wr_ptr_updt)
        wrptr_2_rd <= twc_wr_ptr;
  end


  // FIFO Full control
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_fifo_full <= `L;
    else
      if (fifoflush_clr)
        twc_fifo_full <= `L;
      else if ((twc_wr_ptr_pls1 == rdptr_2_wr_sync) & twc_wr_ptr_incr) 
        twc_fifo_full <= `H;
      else if (twc_wr_ptr != rdptr_2_wr_sync)
        twc_fifo_full <= `L;
  end  
  
  // FIFO almost Full control
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n)
      twc_fifo_full_mns1 <= `L;
    else
      if (fifoflush_clr)
        twc_fifo_full_mns1 <= `L;
      else if ((twc_wr_ptr_pls2 == rdptr_2_wr_sync) & twc_wr_ptr_incr)
        twc_fifo_full_mns1 <= `H; 
      else if ((twc_wr_ptr_pls1 == rdptr_2_wr_sync) & ~twc_wr_ptr_incr)
        twc_fifo_full_mns1 <= `H;
      else  
        twc_fifo_full_mns1 <= `L;
  end  
  
  // Watermark Indication
  // The available space in Txdata FIFO is greater than the number of
  // beats as requested through ati_pbl_i.

  assign sp_avbl = {`TX_FIFO_PTR_WIDTH{`H}} - twc_wr_ptr + rdptr_2_wr_sync;

  assign water_mark = (sp_avbl > (({`L,ati_pbl_i}) + 
                                  ({{(`TX_FIFO_PTR_WIDTH-2){`L}},2'b10}))) & 
                      ~twc_fifo_full;
  
  always @(`APP_RST_MODE)
  begin
    if (~rst_clk_app_n)
      ati_tx_watermark_o <= `L;
    else
      ati_tx_watermark_o <= water_mark | sca_txfifoflush | 
                            sca_txfifoflush_lat;
  end    

//-------------------------------------------------------------------------//
// Software FIFO Flush                                                     //
// During software FIFO Flush this block generates control signals for     // 
// Transmit Write Control FSM to start transmission of DUMMY status for    //
// frames in the Txdata FIFO.This block also generates a clear signal to   //
// application to de-assert sca_txfifoflush.                               //
//-------------------------------------------------------------------------//

  // Combinational FIFO flush signal. 
  assign fifoflush_c = sca_txfifoflush | sca_txfifoflush_lat;

  // Tx FIFO Flush Latched internally until the flush operation is complete
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) 
      sca_txfifoflush_lat <= `L;
    else if (fifoflush_clr)
      sca_txfifoflush_lat <= `L;
    else if (sca_txfifoflush)
      sca_txfifoflush_lat <= `H;
  end
  
  assign fifoflush_clr = (twc_state[TWC_ADD_DUMMY_STS] | 
                          (twc_state[TWC_WAIT_STS_FLUSH] & sw_flush_done_lat & 
                           sts_fifo_empty)) & ~(|fifo_frm_cnt);
			  
  // FIFO FLUSH Clear generation
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) 
      ati_txfifoflush_clr_o <= `L;
    else
      ati_txfifoflush_clr_o <= fifoflush_clr;
  end                       

  // S/W Flush done
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) 
      sw_flush_done_lat <= `L;
    else
      if (fifoflush_clr)
        sw_flush_done_lat <= `L;
      else if (sw_flush_done_sync)
        sw_flush_done_lat <= `H;
  end
   
//-------------------------------------------------------------------------//
// Debug Status
//-------------------------------------------------------------------------//
  always @(`APP_RST_MODE) begin
    if (~rst_clk_app_n) 
      txfifo_nempty <= `L;
    else
      txfifo_nempty <= (twc_wr_ptr != rdptr_2_wr_sync); 
  end

  assign twc_dbg_sts = {txfifo_nempty,!twc_state[TWC_IDLE]};
//-------------------------------------------------------------------------//
// Status FIFO Read logic                                                  //
// This piece of logic generates the control signals for reading the status//
// FIFO and transfers the status to the application.                       //
//-------------------------------------------------------------------------//
         
  assign twc_sts_fifo_rd = ~sts_fifo_empty & ati_ack_i;
  
  // Status Valid Output
  assign ati_txstatus_val_o = ~sts_fifo_empty | 
                              (twc_state[TWC_ADD_DUMMY_STS] & (|fifo_frm_cnt));
  // Add FIFO flush status in case of S/W fifo flush
  assign ati_txstatus_o = (twc_state[TWC_ADD_DUMMY_STS]) ? {`L,`L,`DUMMY_TX_STS} : sts_rd_data;







                                                         
                                                         
endmodule 
