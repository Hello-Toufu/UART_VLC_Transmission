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
// Date             :        $Date: 2008/08/14 $
// File Version     :        $Revision: #18 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// mac_rfc (mac_rfc.v)
//
// DESCRIPTION: This block converts the 8-bit input data into DWORD.
// This block also performs the CRC stripping and IP Checksum append
// operation.
// 
// 
//--------------------------------------------------------------------------

module DWC_gmac_mrc_rfc (


       clk_rx_i,
                         rst_clk_rx_n,
                         // Inputs from the RPE block
                         rpe_data,
                         rpe_data_valid,
                         rpe_sof,
                         rpe_eof,
                         rpe_padcrc_strip,
                         rpe_status_valid,
                         rpe_rcvd_frame_size,
                         rpe_status,
                         // Inputs from the Address Filter block
                         afb_daf_filterfail,
                         afb_daf_filterfail_valid,
                         afb_saf_filterfail,
                         afb_saf_filterfail_valid,
                         afb_rcvbroadcast,
                         afb_rcvmulticast,
                         afb_sa_selected,
                         afb_daf_addr,
                         // Inputs from the CSR block
                         scr_type_crcstrip_e,
                         scr_ipchksum_e,
                         scr_receiveall,
                         scr_passctrlframe,
                         scr_safilter_e,
                         // Inputs from the FRX block
                         frx_ctrlframe_valid,
                         frx_ctrlframe,
                         frx_pausframe_valid,
                         frx_pausframe,
                         // Outputs to RBU block
                         rfc_sof,
                         rfc_eof,
                         rfc_data,
                         rfc_data_valid,
                         rfc_be,
                         rfc_status,
                         rfc_fsm_sts,
                         // Outputs to the MMC block
                         rfc_rxstatus_valid,
                         rfc_rxstatus
                         );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

input              clk_rx_i;           // Rx clk
input              rst_clk_rx_n;       // Reset synchronous to Rx clk
// Inputs from the RPE block
input [7:0]        rpe_data;           // Frame data from RPE
input              rpe_data_valid;     // Frame data valid
input              rpe_sof;            // start of frame indication
input              rpe_eof;            // end of frame indication
input              rpe_padcrc_strip;   // pad / crc strip indication
input [23:0]       rpe_status;         // status 
input [13:0]       rpe_rcvd_frame_size;// Received frame size 
input              rpe_status_valid;   // status valid
// Inputs from the IP Checksum block
// Inputs from the Address Filter block
input              afb_daf_filterfail; // DA filter fail indication
input              afb_daf_filterfail_valid; // valid for DA filter fail 
input              afb_saf_filterfail; // SA filter fail indication
input              afb_saf_filterfail_valid; // valid for SA filter fail
input              afb_rcvbroadcast;   // received broadcast frame 
input              afb_rcvmulticast;   // received multicast frame 
input              afb_sa_selected;    // Indicates atleast 1 MAC reg. is 
                                       // selected for SA filtering.
input [4:0]        afb_daf_addr;       // register that passed the DA filter}] endSub
// Inputs from the CSR block
input              scr_type_crcstrip_e;// enable CRC stripping in Type frames
input              scr_ipchksum_e;     // enable for IP checksum
input              scr_receiveall;     // indication to receive all frames
input              scr_safilter_e;     // to drop frames based on SA
input [1:0]        scr_passctrlframe;  // pass the control frames
// Inputs from the FRX block
input              frx_ctrlframe_valid;// control frame valid 
input              frx_ctrlframe;      // indication of control frame received
input              frx_pausframe_valid;// pause control frame valid 
input              frx_pausframe;      // indication of pause control frame received
// Inputs from the PTP Processing Module

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

// Outputs to RBU block
output             rfc_sof;           // start of frame 
output             rfc_eof;           // end of frame
output [31:0]      rfc_data;          // 32-bit frame data 
output             rfc_data_valid;    // frame data valid 
output [3:0]       rfc_be;            // byte enables for data
output [`CORE_STATUS_WIDTH-1:0]      rfc_status;        // status from rfc
output [1:0]       rfc_fsm_sts;       // FSM IDLE status from rfc
// Outputs to the MMC block
output [25:0]      rfc_rxstatus;      // status from rfc to mmc
output             rfc_rxstatus_valid;// status valid

// ---------------------------------------------
// Output Port Register Declarations. ----------------------------------------
// ---------------------------------------------
reg [25:0]         rfc_rxstatus; 
reg [`CORE_STATUS_WIDTH-1:0]         rfc_status;


// ---------------------------------------------
// Output Port Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire               rfc_sof;
wire               rfc_data_valid;
wire               rfc_eof;
wire [31:0]        rfc_data;
wire [3:0]         rfc_be;
wire               rfc_rxstatus_valid;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------

reg [7:0]         rpe_data_d;         // registered rpe frame data
reg [7:0]         rfc_rstate;         // current state, read FSM
reg [7:0]         next_rfc_rstate;    // next state, read FSM
reg [4:0]         rfc_wstate;         // current state, write FSM
reg [4:0]         next_rfc_wstate;    // next state, write FSM

reg               rpe_status_valid_r; // registered rpe_status_valid
reg               first_read;         // indicates the first read for SOF
reg               sa_fail;            // indicates SA has failed
reg               afb_daf_filterfail_r; // registered DA filter fail
reg [4:0]         da_addr;            // which DA out of 31 matched the address
reg               frx_ctrlframe_r;    // registered control frame 
reg [1:0]         wcntr;              // to count bytes for FIFO write enable &
                                      // byte enables during EOF
reg               eof_in_fifo;        // indicates EOF is written & present 
                                      // in FIFO
reg [3:0]         byte_enb;
reg               rcvbroadcast;       // registered received broadcast frame
reg               rcvmulticast;       // registered received multicast frame
reg               afb_daf_result_lat; // indicates the DAF result is stored
reg [13:0]        status_len_mod;     // modified status reg, based on
                                      // checksum append
reg               eof_for_abort_state; // generate eof if status valid delayed comes 
                                       // before abort state is reached
reg               read_aborted; //Indicates that decision to read the frame out of FIFO 
                                //is aborted after partially reading out the frame.


reg               rfc_sof_r;          // latched rfc_sof_c  
reg [31:0]        rfc_data_r;         // latched rfc_data_c
reg               rfc_eof_r;          // registered rfc_eof_c 
reg [3:0]         rfc_be_r;           // registered rfc_be_c
reg               rfc_data_valid_ext; // rfc_data_valid_c extented by 1 clock at EOF
reg               type_frame;         // when high indicates that current frame is of "type"

// ---------------------------------------------
// Internal Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire [32:0]        fifo_wdata;     // FIFO write data byte-wise
wire [32:0]        fifo_rdata;     // FIFO read data 
wire               fifo_read_e;    // read enable for the FIFO
wire               write_e;        // to write data into FIFO byte-wise
wire               fifo_write_e;   // to increment write pointer  			
wire               fifo_wdata0_we; // write enable for byte 0
wire               fifo_wdata1_we; // write enable for byte 1
wire               fifo_wdata2_we; // write enable for byte 2
wire               fifo_wdata3_we; // write enable for byte 3
wire               w_abort;        //frame abort signal when filter fails
wire               fifo_empty;     // indication of FIFO empty signal
wire               fifo_last;  // Indication of FIFO having just one location left for write
wire               daf_failed; //High when Destination Address Filtering indicates fail result.
wire               saf_failed; //High when Source Address Filtering indicates fail result.
wire               ctrl_frame; //High when control frame is detected.
wire               paus_frame; //High when Pause control frame is detected.
wire               drop_frame; //High when frame can be dropped/filtered.
wire [`CORE_STATUS_WIDTH-1:0] rfc_normal_status; //Status for normal frames
wire [`CORE_STATUS_WIDTH-1:0] rfc_abort_status;  //Status for frames aborted after partial read (read_aborted)

wire               rpe_data_val_pwr;      //rpe_data_valid after taking power_down into account.
wire               rpe_status_val_pwr;    //rpe_status_valid after taking power_down into account.
wire               frx_ctrlframe_val_pwr; //frx_ctrlframe_valid after taking power_down into account.
wire               afb_daf_ff_val_pwr;    //afb_daf_filterfail_valid after taking power_down into account.
wire               afb_saf_ff_val_pwr;    //afb_saf_filterfail_valid after taking power_down into account.

wire               rfc_eof_c;          // Combinational rfc_eof 
wire               rfc_sof_c;          // Combinational rfc_sof 
wire               rfc_data_valid_c;   // Combinational rfc_data_valid 
wire [3:0]         rfc_be_c;           // Combinational rfc_be;
wire [31:0]        rfc_data_c;         // Combinational rfc_data;
wire               type_crcstrip_e;    // qualified scr_type_crcstrip_e

// ---------------------------------------------
// Parameter Declarations. ----------------------------------------
// ---------------------------------------------

parameter [4:0]                     W_IDLE          = 6'd0,
                                    W_WRITE         = 6'd1,
                                    W_PAD_CRC_STRIP = 6'd2,
                                    W_ABORT         = 6'd3,
                                    W_LAST_DATA     = 6'd4;

parameter [7:0]                     R_IDLE          = 8'd0,
                                    R_START         = 8'd1,
                                    R_DAPASS        = 8'd2,
                                    R_DAFAIL        = 8'd3,
                                    R_SAPASS        = 8'd4,
                                    R_SAFAIL        = 8'd5,
                                    R_READ          = 8'd6,
                                    R_ABORT         = 8'd7;


assign rpe_data_val_pwr = rpe_data_valid;
assign rpe_status_val_pwr = rpe_status_valid;
assign frx_ctrlframe_val_pwr = frx_ctrlframe_valid;
assign afb_daf_ff_val_pwr = afb_daf_filterfail_valid;
assign afb_saf_ff_val_pwr = afb_saf_filterfail_valid;





				    
// ---------------------------------------------
// Combinatorial statements. Data Assembly Block-----------------------
// ---------------------------------------------
// This block writes to the FIFO byte-wise to form DWORDs. This block
// strips the CRC and Pad based rpe_padcrc_strip & appends the checksum
// based on scr_ipchksum_e

assign fifo_wdata[32]    = rpe_status_valid_r;
assign fifo_wdata[31:0]  = {rpe_data_d,rpe_data_d,rpe_data_d,rpe_data_d};


// ---------------------------------------------
// Registered statements. Data Assembly Block-----------------------
// ---------------------------------------------
	    
always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rpe_data_d <= 8'h00;
  else if (rpe_data_val_pwr & !rpe_padcrc_strip & !w_abort)
    rpe_data_d <= rpe_data;
end

always @(`RX_RST_MODE)
begin 
  if (!rst_clk_rx_n)
    rpe_status_valid_r <= `L;
  else
    rpe_status_valid_r <= rpe_status_val_pwr;
end

// ---------------------------------------------
// Combinatorial statements. Write Control & FSM Block-----------------------
// ---------------------------------------------
// This block generates the counter output and the write enables for 
// the FIFO. This block also has a state machine which control the 
// write operation, pad / crc strip and checksum append

always @(*)
begin
 next_rfc_wstate = 5'b00000;

// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off  
  case (`H) // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on  

  rfc_wstate[W_IDLE] : begin
    if (rpe_sof & rpe_data_val_pwr)
      next_rfc_wstate[W_WRITE] = `H;
    else 
      next_rfc_wstate[W_IDLE] = `H;
  end

  rfc_wstate[W_WRITE] : begin
    if (w_abort & rpe_status_valid_r)
      next_rfc_wstate[W_IDLE] = `H;
    else if (w_abort)
      next_rfc_wstate[W_ABORT] = `H;
   else if (rpe_eof)

      next_rfc_wstate[W_LAST_DATA] = `H;
    else if (rpe_padcrc_strip & rpe_data_valid & !rpe_eof)
      next_rfc_wstate[W_PAD_CRC_STRIP] = `H;
    else 
      next_rfc_wstate[W_WRITE] = `H;
  end

  rfc_wstate[W_PAD_CRC_STRIP] : begin
    if (w_abort & rpe_status_valid_r)
      next_rfc_wstate[W_IDLE] = `H;
    else if (w_abort)
      next_rfc_wstate[W_ABORT] = `H;
    else if (rpe_eof)
      next_rfc_wstate[W_LAST_DATA] = `H;
    else
      next_rfc_wstate[W_PAD_CRC_STRIP] = `H;
  end

  rfc_wstate[W_LAST_DATA] : begin
    if (w_abort & rpe_status_valid_r)
      next_rfc_wstate[W_IDLE] = `H;
    else if (w_abort)
      next_rfc_wstate[W_ABORT] = `H;
    else if (rpe_status_valid_r | eof_for_abort_state)
      next_rfc_wstate[W_IDLE] = `H;
    else
      next_rfc_wstate[W_LAST_DATA] = `H;
  end

  rfc_wstate[W_ABORT] : begin
    if (rpe_status_valid_r | eof_for_abort_state) 
      next_rfc_wstate[W_IDLE] = `H;
    else
      next_rfc_wstate[W_ABORT] = `H;
  end

  endcase
// leda W225 on  
end

assign write_e = ((rfc_wstate[W_WRITE] & rpe_data_valid & !rpe_padcrc_strip) |
                  (rfc_wstate[W_LAST_DATA] & rpe_status_valid_r)) &
                  !w_abort;

assign fifo_write_e   = ((wcntr == 2'b11 | fifo_wdata[32]) & write_e);
assign fifo_wdata0_we = (wcntr == 2'b00) & write_e;
assign fifo_wdata1_we = (wcntr == 2'b01) & write_e;
assign fifo_wdata2_we = (wcntr == 2'b10) & write_e;
assign fifo_wdata3_we = (wcntr == 2'b11) & write_e; 

// ---------------------------------------------
// Registered statements. Write Control & FSM Block-----------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    eof_for_abort_state <= `L;
  else if (rfc_wstate[W_IDLE])
    eof_for_abort_state <= `L;
  else if (rpe_status_valid_r)
    eof_for_abort_state <= `H;
end    
    
always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
rfc_wstate <= 5'b00001;

  else 
    rfc_wstate <= next_rfc_wstate;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    wcntr <= 2'b00;
  else if ((rpe_data_valid & rpe_sof) | rfc_wstate[W_IDLE] | w_abort)
    wcntr <= 2'b00;
  else if (write_e)
    wcntr <= wcntr + 2'b01;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    eof_in_fifo <= `L;
  else if (w_abort | (fifo_rdata[32] & fifo_read_e))
    eof_in_fifo <= `L;
  else if (fifo_wdata[32] & fifo_write_e)
    eof_in_fifo <= `H;
end
    
always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    byte_enb <= {4{`L}};
  else if (write_e & fifo_wdata[32]) begin  // when EOF is getting written into FIFO
    case(wcntr)
      2'b00 : byte_enb   <= 4'b0001;
      2'b01 : byte_enb   <= 4'b0011;
      2'b10 : byte_enb   <= 4'b0111;
      2'b11 : byte_enb   <= 4'b1111;
    endcase
  end
end

// ---------------------------------------------
// FIFO Instantiation ------------------------------------------------
// ---------------------------------------------

DWC_gmac_mrc_sync_fifo
 DWC_gmac_mrc_sync_fifo_inst (
  // Inputs.
  .clk_rx_i(clk_rx_i),
  .rst_clk_rx_n(rst_clk_rx_n),
  .fifo_write_e(fifo_write_e),
  .fifo_wdata(fifo_wdata),
  .fifo_read_e(fifo_read_e),
  .fifo_flush(w_abort),
  .fifo_wdata0_we(fifo_wdata0_we),
  .fifo_wdata1_we(fifo_wdata1_we),
  .fifo_wdata2_we(fifo_wdata2_we),
  .fifo_wdata3_we(fifo_wdata3_we),

  // Outputs.
  .fifo_rdata(fifo_rdata),
  .fifo_empty(fifo_empty),
  .fifo_last(fifo_last));

// ---------------------------------------------
// Combinatorial statements. Read FSM Block----------------------------------
// ---------------------------------------------

always @(*)
begin
  next_rfc_rstate = 8'h00;
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off  
  case (`H) // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on  

    rfc_rstate[R_IDLE]: begin
      if (!fifo_empty) begin
        if (scr_receiveall)
          next_rfc_rstate[R_READ] = `H;
        else 
          next_rfc_rstate[R_START] = `H;
      end
      else 
        next_rfc_rstate[R_IDLE] = `H;
    end

    rfc_rstate[R_START]: begin
      if (eof_in_fifo)
        next_rfc_rstate[R_ABORT] = `H;  
      else if (fifo_last) begin
        if (drop_frame)
          next_rfc_rstate[R_ABORT] = `H;  
        else
          next_rfc_rstate[R_READ] = `H;
      end
      else if (afb_daf_filterfail_valid) begin
        if (afb_daf_filterfail)
          next_rfc_rstate[R_DAFAIL] = `H;
        else
          next_rfc_rstate[R_DAPASS] = `H;
      end
      else
        next_rfc_rstate[R_START] = `H;
    end

    rfc_rstate[R_DAPASS]: begin
      if (eof_in_fifo)
        next_rfc_rstate[R_ABORT] = `H;
      else if (fifo_last) begin
        if (drop_frame)
          next_rfc_rstate[R_ABORT] = `H;  
        else
          next_rfc_rstate[R_READ] = `H;
      end
      // go to SA filtering state only if any of the MAC registers are selected for
      // SA filtering
      else if (scr_safilter_e & afb_saf_filterfail_valid & afb_sa_selected)
        if (afb_saf_filterfail)                 
          next_rfc_rstate[R_SAFAIL] = `H;
        else 
          next_rfc_rstate[R_SAPASS] = `H;
      else if (frx_ctrlframe_valid) begin
        if (frx_ctrlframe & scr_passctrlframe == 2'b00) 
          next_rfc_rstate[R_ABORT] = `H;
        else
          next_rfc_rstate[R_READ] = `H;
      end
      else 
        next_rfc_rstate[R_DAPASS] = `H;
    end

    rfc_rstate[R_DAFAIL]: begin
      if (eof_in_fifo)
        next_rfc_rstate[R_ABORT] = `H;
      else if (fifo_last) begin
        if (drop_frame)
          next_rfc_rstate[R_ABORT] = `H;  
        else
          next_rfc_rstate[R_READ] = `H;
      end
      else if (frx_ctrlframe_valid) begin
        if ((scr_passctrlframe == 2'b01 | scr_passctrlframe == 2'b10) & frx_ctrlframe)
          next_rfc_rstate[R_READ] = `H;
        else
          next_rfc_rstate[R_ABORT] = `H;
      end
      else 
        next_rfc_rstate[R_DAFAIL] = `H;
    end

    rfc_rstate[R_SAPASS]: begin
      if (eof_in_fifo)
        next_rfc_rstate[R_ABORT] = `H;
      else if (fifo_last) begin
        if (drop_frame)
          next_rfc_rstate[R_ABORT] = `H;  
        else
          next_rfc_rstate[R_READ] = `H;
      end
      else if (frx_ctrlframe_valid) begin
        if (frx_ctrlframe & scr_passctrlframe == 2'b00) 
          next_rfc_rstate[R_ABORT] = `H;
        else
          next_rfc_rstate[R_READ] = `H;
      end
      else 
        next_rfc_rstate[R_SAPASS] = `H;
    end

    rfc_rstate[R_SAFAIL]: begin
      if (eof_in_fifo)
        next_rfc_rstate[R_ABORT] = `H;
      else if (fifo_last) begin
        if (drop_frame)
          next_rfc_rstate[R_ABORT] = `H;  
        else
          next_rfc_rstate[R_READ] = `H;
      end
      else if (frx_ctrlframe_valid) begin
        if ((scr_passctrlframe == 2'b01 | scr_passctrlframe == 2'b10) & frx_ctrlframe)
          next_rfc_rstate[R_READ] = `H;
        else
          next_rfc_rstate[R_ABORT] = `H;
      end
      else
        next_rfc_rstate[R_SAFAIL] = `H;
    end

    rfc_rstate[R_READ]: begin
      if (rfc_eof_c & fifo_read_e)
        next_rfc_rstate[R_IDLE] = `H;
      else if (!scr_receiveall & paus_frame & scr_passctrlframe == 2'b01)
        next_rfc_rstate[R_ABORT] = `H; //Filter Pause Control Frames
      else if (!scr_receiveall & ctrl_frame & scr_passctrlframe == 2'b00) 
        next_rfc_rstate[R_ABORT] = `H; //Filter All Control Frames
      else if (!scr_receiveall & (!(ctrl_frame & scr_passctrlframe == 2'b10)) &
               afb_daf_filterfail & afb_daf_filterfail_valid)
        next_rfc_rstate[R_ABORT] = `H; //Filter DAF Fail
      else if (!scr_receiveall & (!(ctrl_frame & scr_passctrlframe == 2'b10)) &
               afb_saf_filterfail & afb_saf_filterfail_valid & 
               afb_sa_selected & scr_safilter_e) //ASSUMPTION : SAF result will come after DAF result.
        next_rfc_rstate[R_ABORT] = `H; //Filter SAF Fail
      else
        next_rfc_rstate[R_READ] = `H;
    end

    rfc_rstate[R_ABORT]: begin
        next_rfc_rstate[R_IDLE] = `H;
    end

    endcase
// leda W225 on    
end

// ---------------------------------------------
// Registered statements. Read FSM Block----------------------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    rfc_rstate <= 8'b00000001;
  else 
    rfc_rstate <= next_rfc_rstate;
end


//---------------------------------------------
// Logic for Deciding whether to drop the frame
// or not when FIFO is almost full.
//---------------------------------------------
assign daf_failed = (afb_daf_filterfail & afb_daf_filterfail_valid) |
                    (afb_daf_filterfail_r & afb_daf_result_lat);

assign saf_failed = ((afb_saf_filterfail_valid & afb_saf_filterfail & 
                      afb_sa_selected) | sa_fail) & scr_safilter_e;

assign ctrl_frame = (frx_ctrlframe & frx_ctrlframe_valid) | frx_ctrlframe_r;
assign paus_frame = (frx_pausframe & frx_pausframe_valid);

assign drop_frame = (ctrl_frame & scr_passctrlframe == 2'b00) |
                    (paus_frame & scr_passctrlframe == 2'b01) | 
                    ((!(ctrl_frame & scr_passctrlframe == 2'b10)) & 
                      (daf_failed | saf_failed));

// ---------------------------------------------
// Combinatorial statements.  Control & Enable Logic Block--------------------
// ---------------------------------------------
// This block generates various control signals. 
// This block also generates output data

assign fifo_read_e     = (!fifo_empty & rfc_rstate[R_READ]);
assign rfc_sof_c         = (fifo_read_e & !first_read);
assign rfc_data_valid_c  = fifo_read_e | read_aborted;
assign rfc_eof_c         = (fifo_rdata[32] & fifo_read_e) | read_aborted;
assign rfc_data_c        = fifo_rdata[31:0];
assign rfc_be_c          = fifo_rdata[32] ? byte_enb : 4'b1111;
assign w_abort         = rfc_rstate[R_ABORT];

// Registering the rfc_xxx_c signals so as to delay it by 1 clock; This logic is added to enable 
// CRC byte stripping of "type" Frames. Data and control signals are delayed by 1 active 
// data_valid cycle (4 bytes) until EOF is received; If frame is of "Type" and CRC stripping is 
// enabled, then the last 4 bytes of the frame are dropped by sending the EOF 1 clock in advance.
// If CRC strippping for "Type" frames is NOT enabled, then original rfc_xxx_c signals are directly 
// output to the RBU block.

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    rfc_sof_r    <= `L;
    rfc_data_r   <= 32'h0000_0000;
  end
  else if (rfc_data_valid_c) begin // To delay SOF/Data by 1 active data_valid
    rfc_sof_r    <= rfc_sof_c;
    rfc_data_r   <= rfc_data_c;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    rfc_data_valid_ext <= `L;
    rfc_eof_r    <= `L;
    rfc_be_r     <= 4'h0;
  end
  else begin
    rfc_data_valid_ext <= rfc_data_valid_c & rfc_eof_c; //extend data_valid by 1 clock at EOF
    rfc_eof_r    <= rfc_eof_c;
    rfc_be_r     <= rfc_be_c;
  end
end

// Samples RxStatus of current frame to identify "type" frame;

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    type_frame   <= `L;
  else
    if (rfc_rstate[R_IDLE])
      type_frame   <= `L;
    else if (rpe_status_val_pwr)
      type_frame   <= rpe_status[18];
end

// Output signals are delayed only when CRC stripping is enabled & TYPE1 COE disabled;
assign type_crcstrip_e = scr_type_crcstrip_e & !scr_ipchksum_e;

assign rfc_sof   = !type_crcstrip_e ? rfc_sof_c : rfc_sof_r; 
assign rfc_data  = !type_crcstrip_e ? rfc_data_c : rfc_data_r; 

assign rfc_eof   = !type_crcstrip_e ? rfc_eof_c :
                                      type_frame ? rfc_eof_c : rfc_eof_r;

assign rfc_be    = !type_crcstrip_e ? rfc_be_c :
                                      type_frame ? rfc_be_c : rfc_be_r;

assign rfc_data_valid = !type_crcstrip_e ? rfc_data_valid_c :
                                           ((rfc_data_valid_c & first_read) | 
                                            (rfc_data_valid_ext & !type_frame));


// ---------------------------------------------
// Registered statements.  Control Logic Block----------------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    first_read <= `L;
  else if (rfc_rstate[R_IDLE])
    first_read <= `L;
  else if (fifo_read_e)
    first_read <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    read_aborted <= `L;
  else 
    if ((fifo_read_e | first_read) & 
        rfc_rstate[R_READ] & next_rfc_rstate[R_ABORT])
      read_aborted <= `H;
    else
      read_aborted <= `L;
end


// ---------------------------------------------
// Combinatorial statements.  Status Logic Block----------------------------
// ---------------------------------------------
// This block append DA register address which passed the DA filter
// IP Header checksum error, Control frame indication, SA & DA filter
// match and change of received frame length based on checksum append

assign rfc_normal_status  = {
                             (da_addr[3:0] & {4{!da_addr[4]}}), 1'b0, frx_ctrlframe_r,
                             sa_fail, afb_daf_filterfail_r, rfc_rxstatus[23:14],status_len_mod};

 //Dummy status with crc error bit set, runt frame bit set and frame length equal to 0.
assign rfc_abort_status   = {
                             (da_addr[3:0] & {4{!da_addr[4]}}), 1'b0, frx_ctrlframe_r, sa_fail,
                             afb_daf_filterfail_r, 24'h20_80_00}; //CRC_ERROR, RUNT_FRAME, ZERO_LENGTH

always @(*)
  if (read_aborted)
    rfc_status = rfc_abort_status;
  else
    rfc_status = rfc_normal_status;


assign rfc_rxstatus_valid = rpe_status_valid_r & !afb_daf_filterfail_r;
assign rfc_fsm_sts = {!rfc_rstate[R_IDLE], !rfc_wstate[W_IDLE]};


// ---------------------------------------------
// Registered statements.  Status Logic Block----------------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    rcvmulticast <= `L;
    rcvbroadcast <= `L;
  end
  else if (rpe_sof) begin
    rcvmulticast <= `L;
    rcvbroadcast <= `L;
  end
  else if (afb_daf_ff_val_pwr) begin
    rcvmulticast <= afb_rcvmulticast;
    rcvbroadcast <= afb_rcvbroadcast;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    rfc_rxstatus   <= {26{`L}};
    status_len_mod <= {14{`L}};
  end
  else if (rpe_status_val_pwr) begin
    rfc_rxstatus[25] <= rcvmulticast;
    rfc_rxstatus[24] <= rcvbroadcast;
    rfc_rxstatus[23:14]<= rpe_status[23:14];
    rfc_rxstatus[13:0] <= rpe_rcvd_frame_size;
    status_len_mod     <= (!frx_ctrlframe_r & scr_ipchksum_e) ? 
                                rpe_status[13:0] + 14'd2 : 
                            (type_crcstrip_e & rpe_status[18]) ?
                                rpe_status[13:0] - 14'd4 : rpe_status[13:0];
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    afb_daf_filterfail_r <= `L;
    afb_daf_result_lat   <= `L;
  end
  else if (rpe_sof) begin
    afb_daf_filterfail_r <= `L;
    afb_daf_result_lat   <= `L;
  end
  else if (afb_daf_ff_val_pwr | (!afb_daf_result_lat & rpe_eof)) begin
    afb_daf_filterfail_r <= afb_daf_filterfail;
    afb_daf_result_lat   <= `H;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    sa_fail <= `L;
  else if (rfc_rstate[R_IDLE]) 
    sa_fail <= `L;
  else if (afb_saf_ff_val_pwr & afb_sa_selected)
    sa_fail <= afb_saf_filterfail;
end


always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    da_addr <= 5'h00;
  else if (afb_daf_ff_val_pwr)
    da_addr <= afb_daf_addr;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    frx_ctrlframe_r <= `L;
  else if (rpe_sof) 
    frx_ctrlframe_r <= `L;
  else if (frx_ctrlframe_val_pwr)
    frx_ctrlframe_r <= frx_ctrlframe;
end



endmodule
    
  
