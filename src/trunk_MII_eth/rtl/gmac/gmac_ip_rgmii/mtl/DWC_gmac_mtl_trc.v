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
// Date             :        $Date: 2007/11/15 $
// File Version     :        $Revision: #36 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:                                                                  //
// MTL Transmit Write controller(DWC_gmac_mtl_twc.v)                        //
//                                                                          //
// DESCRIPTION:                                                             //
// The primary function of MTL Transmit Write Controller(TWC) includes      //
// 1. Transmission of frame from the Tx data FIFO to the GMAC core when     //
//    core is ready to accept the fraem.                                    //
// 2. Retransmission of frames based on the retry request from GMAC core    //
// 3. Flushing out the remaining data of the aborted frame                  //
// 4. Storing the transmit status from the GMAC core into the status FIFO   //
//--------------------------------------------------------------------------//

module DWC_gmac_mtl_trc (

       clk_tx_i,
                         rst_clk_tx_n,
                         // MAC Transmit Interface
                         mti_rdy_i,
                         mti_val_o,
                         mti_data_o,
                         mti_sof_o,
                         mti_eof_o,
                         mti_be_o,
                         mti_txfifoflush_o,
                         // Status Control signals
                         mti_txstatus_val_i,
                         mti_txstatus_i,
                         trc_sts_wr_done,
                         trc_sts_wdata,
                         // MTL <-> TxData FIFO Read Interface
                         trc_rd_addr_o,
                         trc_rd_csn_o,
                         trc_rd_data_i,
                         trc_rd_en_o,
                         // Disable pad,Disable crc controls
                         trc_dpdc_rd,
                         // Sync Block signals
                         tsb_wrptr_2_rd_sync_ack,
                         wrptr_2_rd_sync,
                         trc_sw_flush_done,
                         trc_abort_detect,
                         trc_rdptr_2_wr,
                         trc_dbg_sts,
                         // port select
                         mac_portselect_i
                         );

// Input and output port declarations

// Clock and reset

  input                         clk_tx_i;      // Transmit clock(2.5/25/125)Mhz.
  input                         rst_clk_tx_n;  // Active low reset synchroronous 
                                               // to clk_tx_i.

// MAC Transmit Interface
  input                         mti_rdy_i;     // Signal indicates GMAC is 
                                               // ready to accept data.
                                               
  output                        mti_val_o;     // Signal qualifies TxData and 
                                               // control signals.
                                               
  output [`DATAWIDTH-1:0]       mti_data_o;    // Frame data.
  output                        mti_sof_o;     // Start of frame signal. 
  output                        mti_eof_o;     // End of frame signal.
  output [`DATAWIDTH/64+1:0]    mti_be_o;      // Byte enables for frame data
  output                        mti_txfifoflush_o;  // Tx FIFO Flush pulse to
                                                    // GMAC.

// Status Control signals
  input                         mti_txstatus_val_i;  // Status valid from GMAC.
  input  [31:0]                 mti_txstatus_i;      // Transmit Frame Status 
                                                     // from GMAC
  output                        trc_sts_wr_done; // Status write towards Status FIFO
  output [17:0]                 trc_sts_wdata;   // Status Word towards Status FIFO

// MTI <-> TxData FIFO Read Interface
  output [`TX_FIFO_PTR_WIDTH-1:0]trc_rd_addr_o;  // Read address to Txdata FIFO
  output                         trc_rd_csn_o;   // Chip select to Txdata FIFO. 
  input  [`FIFO_DATA_WIDTH-1:0]  trc_rd_data_i;  // Read data from Txdata FIFO.
  output                         trc_rd_en_o;    // Read enable to Txdata FIFO.

// Disable pad,Disable crc controls
  output                        trc_dpdc_rd;    // dpdc FIFO write enable.

// Sync Block signals
  
  input  [`TX_FIFO_PTR_WIDTH:0] wrptr_2_rd_sync;  // Write pointer and Tx FIFO
                                                   // flush(MSB) synchronised
                                                   // to read clock.
  
  input                         tsb_wrptr_2_rd_sync_ack; // Ack indicates 
                                                         // write pointer 
                                                         // sync'd to Tx clock.
                                                
                                                     // is written into TxFIFO.
                                                
                                                           // pointer for first
                                                           // frame
                                                           // pointer for second
  
                                                
  output                        trc_sw_flush_done;// Signal indicates TRC has
                                                  // completed S/W flush 
                                                  // operation
                                                
  output                        trc_abort_detect; // Signal indicates Frame 
                                                  // aborted by GMAC.
  
  output [`TX_FIFO_PTR_WIDTH-1:0]  trc_rdptr_2_wr;// Read pointer to be sync'd to
                                                  // write clock(combinational).
  output [1:0]                  trc_dbg_sts;      // TRC Debug signals


// port select
  input                         mac_portselect_i;// Port select from GMAC.

  

// Parameter declarations
  parameter [4:0]  TRC_IDLE = 5'd0,
                   TRC_READ = 5'd1,
                   TRC_WAIT_FOR_STS = 5'd2,
                   TRC_STS_RCVD = 5'd3,
                   TRC_FRAME_FLUSH= 5'd4;

// compensation for the delay between the detection of frame abort in 
// MAC and assertion of mti_txstatus_val_i




  
// Internal Reg and Wire declarations
  reg                           sct_txfifoflush_lat;// Latched sct_txfifoflush
                                                    // when waiting for status
                                                    // from MAC
  
  reg                           sct_txfifoflush_d; // delayed sct_txfifoflush.

  reg  [4:0]                    trc_state;         // Transmit Read Control FSM
                                                   // current state variable
                                                   
  reg  [4:0]                    next_trc_state;    // Transmit Read Control FSM
                                                   // next state variable
                                                   
  reg                           trc_pftch_state;   // Read Prefetch FSM state 
                                                   // variable
                                                   
  reg                           data_pftch;        // prefetch data from 
                                                   // Txdata FIFO.
                                                   
  reg                           trc_rd_ptr_incr;   // Increment read pointer.
  reg                           trc_rd_ptr_incr_r; // Registered read pointer
                                                   // increment signal.
  reg                           trc_rd_en_o;       // Read enable to Txdata FIFO
                                                   
  reg  [`DATAWIDTH-1:0]         reg0_data;    // registered Txdata ,first stage
  reg  [`DATAWIDTH-1:0]         reg1_data;    // registered Txdata ,Second stage
  reg  [1:0]                    fill_status;  // Signal indicating the fill 
                                              // status of 2 register stages
                                              
  reg                           eof0_rcvd_r;  // End of frame register1
  reg                           eof1_rcvd_r;  // End of frame register2
  reg  [`DATAWIDTH/64+1:0]      be0_rcvd_r;   // Byte Enable register1
  reg  [`DATAWIDTH/64+1:0]      be1_rcvd_r;   // Byte Enable register2
  reg                           mti_val;      // Data valid to MAC.
  reg                           mti_sof_o;    // Start of frame to MAC.
  reg  [`TX_FIFO_PTR_WIDTH-1:0] trc_rd_ptr;   // Txdata FIFO read pointer.
  reg  [`TX_FIFO_PTR_WIDTH-1:0] rdptr_2_wr;   // Txdata FIFO read pointer
                                              // to be sync'd to write clock.
  reg [1:0]                     trc_fsm_sts;  // state of TRC_FSM
                                              
  reg                           trc_fifo_empty;     // Txdata FIFO empty.
  reg                           trc_fifo_empty_mns1;// Txdata FIFO almost empty.
  reg                           abort_r;            // Frame Aborted by MAC. 


  
  reg                           sts_wr_reg;        // Status write signal
  wire                          sct_txfifoflush;   // FIFO flush Signal 
                                                   // to reset the TxData
                                                   // FIFO control logic.

  wire                          sw_flush_done;     // S/W flush operation done.
  wire                          sts_wr_done;       // Status write done asserted
                                                   // when normal status is written
                                                   // of during Tx data FIFO flush. 
  
  wire                          abort;        // Frame abort indication by GMAC.
  wire                          retry;        // Frame Retry request from GMAC.
  wire                          txfifoflush;  // Combinational signal 
                                              // indicating the FIFO flush
                                              // operation in progress.

  wire                          tx_fifo_empty;// signal asserted when TxData 
                                              // FIFO is empty or almost empty.
  
  wire                          ready;        // Internal ready signal when
                                              // mti_rdy_i is not asserted
                                              // during frame abort. 
                                              
  wire                          stop_pftch;   // stop prefetch operation.
  wire                          start_pftch;  // start prefetch operation.
                                              
  wire                          trc_rd_ptr_incr_c; // combinational read pointer 
                                                   // increment signal
                                                   
  wire                          mti_eof;           // End of frame 
                                                      
                                                   
                                                   
                                                   
                                                   
  wire                          updt_thrshld;      // Threshold after which
                                                   // read pointer is ready for
                                                   // updation to write clock


  wire                          trc_frame_retry;    // Retry current frame
  wire                          trc_frame_flush_done; // Frame Flush done on
                                                      // on frame abort

  wire [17:0]                   sts_wdata;   // Status Write data.
  wire [`TX_FIFO_PTR_WIDTH-1:0] trc_rd_ptr_pls1;      // trc_rd_ptr + 1
  wire [`TX_FIFO_PTR_WIDTH-1:0] trc_rd_ptr_pls2;      // trc_rd_ptr + 2

  wire                          eof_rcvd;        // Last data of Frame
                                                 // indication from TxFIFO data
  wire [`DATAWIDTH/64+1:0]      be_rcvd;         // Byte Enables for Last data
                                                 // received from TxFIFO data
  
//--------------------------------------------------------------------------//
// Transmit Read Control FSM                                                //
// FSM schedules the data transfer from the Asynchronous Tx data FIFO to    //
// GMAC controller.                                                         //
//--------------------------------------------------------------------------//
  
  assign sct_txfifoflush = wrptr_2_rd_sync[`TX_FIFO_PTR_WIDTH];

  assign abort = mti_txstatus_val_i & mti_txstatus_i[0] & ~mti_txstatus_i[31] &
                 ~(sct_txfifoflush | sct_txfifoflush_lat);  
  assign retry = mti_txstatus_val_i & mti_txstatus_i[31] & ~(sct_txfifoflush | 
                 sct_txfifoflush_lat);
  assign txfifoflush = sct_txfifoflush & ~sct_txfifoflush_d;

  // Delayed sct_txfifoflush.
  always @(`TX_RST_MODE) begin 
    if (~rst_clk_tx_n)
      sct_txfifoflush_d <= `L;
    else 
      sct_txfifoflush_d <= sct_txfifoflush;
  end
  
  //Latched  sct_txfifoflush.
  always @(`TX_RST_MODE) begin 
    if (~rst_clk_tx_n)
      sct_txfifoflush_lat <= `L;
    else if (sct_txfifoflush_lat & trc_state[TRC_WAIT_FOR_STS] & 
                                   next_trc_state[TRC_IDLE]) 
      sct_txfifoflush_lat <= `L;
    else if (sct_txfifoflush & tsb_wrptr_2_rd_sync_ack & 
             ~(mti_txstatus_val_i | trc_state[TRC_IDLE] | trc_state[TRC_FRAME_FLUSH]))   
      sct_txfifoflush_lat <= `H;
  end
  
  // Sequential state assignment
  always @(`TX_RST_MODE) begin 
    if (~rst_clk_tx_n)
      trc_state <= 5'b00001;
    else
      trc_state <= next_trc_state;
  end

  // combinational logic deriving next state 
  always @(*)
  begin
    next_trc_state = 5'b00000;

    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 W225 off
    case(1'b1) // synopsys full_case parallel_case
    // leda DFT_022 C_5C_R C_4C_R_B FM_2_12 W455 W226 on
      trc_state[TRC_IDLE]: // Idle
        begin
          if (~(sct_txfifoflush) & trc_rd_ptr_incr_c)
            if(eof_rcvd)
              next_trc_state[TRC_WAIT_FOR_STS] = `H;
            else
              next_trc_state[TRC_READ] = `H;
          else
            next_trc_state[TRC_IDLE] = `H;
        end
      
      trc_state[TRC_READ]: // Data Read from Txdata FIFO.
        begin
          if ((sct_txfifoflush & mti_txstatus_val_i) | (retry & ~updt_thrshld) |
              (abort & trc_frame_flush_done))
            next_trc_state[TRC_IDLE] = `H;
          else if ((abort | (retry & updt_thrshld)) & ~sct_txfifoflush)
            next_trc_state[TRC_FRAME_FLUSH] = `H;
          else if (eof_rcvd | sct_txfifoflush)
            next_trc_state[TRC_WAIT_FOR_STS] = `H;
          else
            next_trc_state[TRC_READ] = `H;
        end

      trc_state[TRC_WAIT_FOR_STS]: // Wait for Transmit Status from GMAC
        begin
          if (((sct_txfifoflush | sct_txfifoflush_lat) & mti_txstatus_val_i) | 
        (retry & ~updt_thrshld))
            next_trc_state[TRC_IDLE] = `H;
          else if (mti_txstatus_val_i)
            next_trc_state[TRC_STS_RCVD] = `H;
          else
            next_trc_state[TRC_WAIT_FOR_STS] = `H;
        end

      trc_state[TRC_STS_RCVD]: // Once status is received check for frame abort,
                               // write the status to Status FIFO.
        begin
          if ((~sct_txfifoflush & sts_wr_done) | sw_flush_done)
            next_trc_state[TRC_IDLE] = `H;
          else  
            next_trc_state[TRC_STS_RCVD] = `H;
        end
      
      trc_state[TRC_FRAME_FLUSH]: // Flushes the frame in case of frame abort.
        begin
          if ((~sct_txfifoflush & trc_frame_flush_done) | sw_flush_done)
            next_trc_state[TRC_IDLE] = `H;
          else
            next_trc_state[TRC_FRAME_FLUSH] = `H;
        end
      
    endcase
    // leda W225 on
  end
  
// TRC FSM status registered and given out for proper synchronization
   always @(`TX_RST_MODE) begin 
     if (~rst_clk_tx_n)
       trc_fsm_sts <= {2{`L}};
     else 
    // leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off    
        case(1'b1)  // synopsys full_case parallel_case
    // leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
          trc_state[TRC_IDLE]        : trc_fsm_sts <= 2'b00;
          trc_state[TRC_READ]        : trc_fsm_sts <= 2'b01;
          trc_state[TRC_WAIT_FOR_STS]: trc_fsm_sts <= 2'b10;
          trc_state[TRC_STS_RCVD]    : trc_fsm_sts <= 2'b11;
          trc_state[TRC_FRAME_FLUSH] : trc_fsm_sts <= 2'b11;
        endcase
   end

   assign trc_dbg_sts = trc_fsm_sts;

//--------------------------------------------------------------------------//
// Transmit Read Prefetch FSM                                               //
// FSM schedules the prefetch operation when space is available in the 2    //
// stage registers (used to store the prefetched data).Start and stop of the//
// prefetch operation is also scheduled by this FSM.                        //
//--------------------------------------------------------------------------//

  // prefetch control signals.
  assign tx_fifo_empty = trc_fifo_empty | 
                         (trc_fifo_empty_mns1 & trc_rd_ptr_incr);
                         
  assign start_pftch = (trc_state[TRC_IDLE] & ~trc_rd_ptr_incr_r) | 
                       trc_state[TRC_READ] | trc_state[TRC_FRAME_FLUSH];

  assign stop_pftch = sct_txfifoflush | sct_txfifoflush_lat |
                      eof_rcvd | trc_frame_retry;

  
  // Sequential state assignment
  always @(`TX_RST_MODE) begin 
    if (~rst_clk_tx_n)
      trc_pftch_state <= `L;
    else if (stop_pftch | tx_fifo_empty) 
      trc_pftch_state <= `L;  // TRC_PFTCH_IDLE state
    else if (start_pftch)
      trc_pftch_state <= `H;  // TRC_PFTCH state
  end
  
                      
//--------------------------------------------------------------------------//
// Txdata FIFO Read Control                                                 //
// This block generates the neccessary FIFO control signals for reading the // 
// data from the Txdata FIFO.The FIFO read logic for asynchronous and       //
// synchronous memory read can be selected through parameters ASYNC_RAM,   //
// SYNC_RAM                                                                // 
//--------------------------------------------------------------------------//
  // Internal ready when mti_rdy_i is not asserted during frame abort.
  assign ready = (mti_rdy_i & mti_val) | trc_state[TRC_FRAME_FLUSH];
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      data_pftch <= `L;
    else
      data_pftch <= start_pftch & ~tx_fifo_empty & ~stop_pftch &
                    ((~trc_rd_ptr_incr_r & (fill_status == 2'b00)) |
                     ((fill_status == 2'b01 | trc_pftch_state) & ready));
  end

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      trc_rd_ptr_incr <= `L;
    else  
      trc_rd_ptr_incr <= start_pftch & ~tx_fifo_empty & ~stop_pftch &
                         ((~trc_rd_ptr_incr_r & (fill_status == 2'b00)) |
                          ((fill_status == 2'b01 | trc_pftch_state) & ready));
  end

  assign trc_rd_addr_o = trc_rd_ptr;
  // Data Read has to be stopped when End of frame is detected.
  
  assign trc_rd_ptr_incr_c = trc_rd_ptr_incr & ~eof_rcvd;
  // Last data of the frame is received from TxFIFO
  assign eof_rcvd = (trc_rd_ptr_incr_r) ? (trc_rd_data_i[`FIFO_DATA_WIDTH-1]):
                                           `L;
    // Byte Enbales for the last data received from TxFIFO
  assign be_rcvd = (trc_rd_ptr_incr_r) ? 
                                 trc_rd_data_i[`FIFO_DATA_WIDTH-2:`DATAWIDTH]:
                                 {(`DATAWIDTH/64+2){`H}};
  
  // Chip select and Read Enable to TxData FIFO.
  assign trc_rd_csn_o = ~(data_pftch & ~eof_rcvd);

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      trc_rd_en_o <= `L;
    else 
      trc_rd_en_o <= data_pftch & ~eof_rcvd;
  end    

    // Delayed Read pointer increment
    always @(`TX_RST_MODE) begin
      if (~rst_clk_tx_n) 
        trc_rd_ptr_incr_r <= `L;
      else
        trc_rd_ptr_incr_r <= trc_rd_ptr_incr_c;
    end
 
  // Two Stage Registering to prefetch 2 data in advance.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      reg0_data <= {`DATAWIDTH{`L}};
      reg1_data <= {`DATAWIDTH{`L}};
    end
    else begin
        if (trc_rd_ptr_incr_r) begin
          reg0_data <= trc_rd_data_i[`DATAWIDTH-1:0];
          reg1_data <= reg0_data;
        end
    end
  end

  // Fill status of the 2 stage register
  always @(`TX_RST_MODE) begin
   if (~rst_clk_tx_n)
     fill_status <= {2{`L}};
   else  
     if (sct_txfifoflush | sct_txfifoflush_lat)
       fill_status <= {2{`L}};
       else if (trc_rd_ptr_incr_r & ~(mti_val & ready))
         fill_status <= fill_status + 1;
       else if (~trc_rd_ptr_incr_r & mti_val & ready)
         fill_status <= fill_status - 1;
  end
       
  // Two state registering for End of frame 
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      eof0_rcvd_r <= `L;
      eof1_rcvd_r <= `L;
    end  
    else begin
      if ((mti_eof & ready) | sct_txfifoflush) begin
        eof0_rcvd_r <= `L;
        eof1_rcvd_r <= `L;
      end
      else begin 
        if (trc_rd_ptr_incr_r) begin
            eof0_rcvd_r <= trc_rd_data_i[`FIFO_DATA_WIDTH-1];
            eof1_rcvd_r <= eof0_rcvd_r;
        end
    end
  end      
end  
       
  // Two stage registering for Byte enables     
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      be0_rcvd_r <= {(`DATAWIDTH/64+2){`L}};
      be1_rcvd_r <= {(`DATAWIDTH/64+2){`L}};
    end  
    else begin
        if (trc_rd_ptr_incr_r) begin
          be0_rcvd_r <= trc_rd_data_i[`FIFO_DATA_WIDTH-2:`DATAWIDTH];
          be1_rcvd_r <= be0_rcvd_r;
        end
    end
  end      
      
  // Data valid
  assign mti_val_o = mti_val;
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) 
      mti_val <= `L;
    else
      if ((mti_eof & ready) | sct_txfifoflush | sct_txfifoflush_lat |
          (((~trc_rd_ptr_incr_r & ~trc_rd_ptr_incr_c & (fill_status == 2'b01)) |
            (~trc_rd_ptr_incr_c & (fill_status == 2'b00))) &  ready))
        mti_val <= `L;
      else if (trc_pftch_state)
        mti_val <= `H;
  end
  
  // MTL data

  assign mti_data_o = (fill_status == 2'b00) ? 
                       ((trc_rd_ptr_incr_r) ? 
                                              trc_rd_data_i[`DATAWIDTH-1:0] :
                                              {`DATAWIDTH{`L}}) :
                      (fill_status == 2'b01) ? reg0_data[`DATAWIDTH-1:0] : 
                                               reg1_data[`DATAWIDTH-1:0];
  
  // Start of frame
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      mti_sof_o <= `L;
    else
      mti_sof_o <= trc_state[TRC_IDLE] & trc_rd_ptr_incr_c;
  end    
  
  // End of frame
  assign mti_eof_o = mti_eof;

    assign mti_eof = (fill_status == 2'b00) ? eof_rcvd:
                     (fill_status == 2'b01) ? eof0_rcvd_r : 
                                              eof1_rcvd_r ;

                                                 
  // Byte Enables for MTL data                                             

    assign mti_be_o = (fill_status == 2'b00) ? be_rcvd : 
                      (fill_status == 2'b01) ? be0_rcvd_r :
                                               be1_rcvd_r ;


  // Flush signal to clear the retry counter in TPE.
  assign mti_txfifoflush_o = sct_txfifoflush_lat | sct_txfifoflush;

//--------------------------------------------------------------------------//
// Read pointer Generation and Update                                       //
// This block generates the read address for the Txdata Read operation      // 
// The read pointer which is synchronised to the write clock domain is also //
// updated by this logic.                                                   //
//--------------------------------------------------------------------------//
  // Txdata FIFO Read pointer
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      trc_rd_ptr <= {`TX_FIFO_PTR_WIDTH{`L}};
    else
      if (sw_flush_done)
        trc_rd_ptr <= {`TX_FIFO_PTR_WIDTH{`L}};
      else if (trc_frame_retry)
        trc_rd_ptr <= rdptr_2_wr;
      else if (trc_rd_ptr_incr_c)
        trc_rd_ptr <= trc_rd_ptr + 1;
  end


  
  // Txdata FIFO Empty
  assign trc_rd_ptr_pls1 = trc_rd_ptr + 1;
  assign trc_rd_ptr_pls2 = trc_rd_ptr + 2;
  
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      trc_fifo_empty <= `H;
    else
      if (sct_txfifoflush | sct_txfifoflush_lat)
         trc_fifo_empty <= `H;
      else if ((trc_rd_ptr_pls1 == wrptr_2_rd_sync[`TX_FIFO_PTR_WIDTH-1:0]) & 
                trc_rd_ptr_incr_c)
         trc_fifo_empty <= `H;
    // leda NTL_RST06 off
      else if (trc_rd_ptr != wrptr_2_rd_sync[`TX_FIFO_PTR_WIDTH-1:0])
         trc_fifo_empty <= `L; 
    // leda NTL_RST06 on
  end       
         
  // Txdata FIFO Almost Empty
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      trc_fifo_empty_mns1 <= `L;
    else
      if (sct_txfifoflush | sct_txfifoflush_lat)
         trc_fifo_empty_mns1 <= `L;
      else if ((trc_rd_ptr_pls2 == wrptr_2_rd_sync[`TX_FIFO_PTR_WIDTH-1:0]) & 
                trc_rd_ptr_incr_c)
         trc_fifo_empty_mns1 <= `H;
      else if ((trc_rd_ptr_pls1 == wrptr_2_rd_sync[`TX_FIFO_PTR_WIDTH-1:0]) & 
                ~trc_rd_ptr_incr_c)
         trc_fifo_empty_mns1 <= `H;
      else   
         trc_fifo_empty_mns1 <= `L; 
  end 


  
  

  assign updt_thrshld = `H;

  
  // Read pointer Updated for synchronisation to write clock domain 
  assign trc_rdptr_2_wr = rdptr_2_wr;

  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
     rdptr_2_wr <= {`TX_FIFO_PTR_WIDTH{`L}}; 
    else 
      if (sw_flush_done)
        rdptr_2_wr <= {`TX_FIFO_PTR_WIDTH{`L}};
      else if ((updt_thrshld | (mti_txstatus_val_i & ~mti_txstatus_i[31])) & 
                trc_rd_ptr_incr_c)
        rdptr_2_wr <= trc_rd_ptr_pls1;
      else if (updt_thrshld | (mti_txstatus_val_i & ~mti_txstatus_i[31]) | 
                trc_state[TRC_FRAME_FLUSH])
        rdptr_2_wr <= trc_rd_ptr;
  end      
 

  // Registered frame abort
  assign trc_abort_detect = abort & ~abort_r; // Frame abort pulse
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      abort_r <= `L;
    else
      if (trc_state[TRC_IDLE])
        abort_r <= `L;
      else if (abort) 
        abort_r <= `H;
  end
  
  // Qualifies the frame retry request with the read pointer update threshold
  assign trc_frame_retry = retry & ~updt_thrshld;
  
  assign trc_frame_flush_done = eof_rcvd;

  // S/W Flush completion by TRC block
  assign sw_flush_done = (sct_txfifoflush & tsb_wrptr_2_rd_sync_ack);
  assign trc_sw_flush_done = sw_flush_done;
  
//--------------------------------------------------------------------------//
// Status FIFO Write and dpdc FIFO read Control                             //
// This block generates the control signals for writing the transmit status //
// from GMAC to Status FIFO,reading dpdc(Disable pad,Disable crc) FIFO.     //
//--------------------------------------------------------------------------//

// Status Write 
  assign trc_sts_wr_done = sts_wr_done;
  assign sts_wr_done = sts_wr_reg | 
                       (txfifoflush & ~sct_txfifoflush_lat &
                        ~(trc_state[TRC_IDLE] | trc_state[TRC_FRAME_FLUSH]));
                       
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n)
      sts_wr_reg <= `L;
    else
      if (sct_txfifoflush | sct_txfifoflush_lat) 
        sts_wr_reg <= `L;
      else 
        sts_wr_reg <= (mti_txstatus_val_i & (~mti_txstatus_i[31] |
                                              updt_thrshld));
  end

// Status word to Status FIFO.
  assign sts_wdata = {`L,

                      `L,
                      mti_txstatus_i[0],

                      mti_txstatus_i[1],   // Jabber Timeout.
                       2'b00,               // 13-Tx FIFO Flush,12-reserved

                      mti_txstatus_i[3],   // Loss of carrier.
                      mti_txstatus_i[2],   // No carrier
                      mti_txstatus_i[5],   // Late collision
                      mti_txstatus_i[6],   // Excessive Collision
                      mti_txstatus_i[29],  // VLAN Frame
                      mti_txstatus_i[12:9],// Collision Count
                      mti_txstatus_i[4],   // Excessive Deferral.
                      mti_txstatus_i[7],   // Underflow.
                      mti_txstatus_i[8]};  // Deferred.

  assign trc_sts_wdata = (sct_txfifoflush) ? 
                            {`L,`L,`DUMMY_STS} : // FIFO flush,underflow
                            (retry & updt_thrshld) ? 
                              {sts_wdata[17:16],`H,sts_wdata[14:10],`H,sts_wdata[8:0]} : 
                              sts_wdata;

// dpdc FIFO read 
  assign trc_dpdc_rd = sts_wr_done;







  


                           
endmodule  

