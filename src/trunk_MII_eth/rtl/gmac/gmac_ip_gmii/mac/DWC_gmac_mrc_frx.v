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
// File Version     :        $Revision: #13 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// dwc_gmac_mrc_frx (dwc_gmac_mrc_frx.v)
//
// DESCRIPTION:
// GMAC Filter Control Frame (FRX)
// 1. Detects the pause control frame in Full-Duplex mode and requests the 
// GMAC transmit protocol engine to pause the transmission for the pause 
// time specified in control frame.
// 2. Monitors the receiving frames for multicast address and indicates the
// match of the address to RFC module
//--------------------------------------------------------------------------

module DWC_gmac_mrc_frx (

       clk_rx_i,
       rst_clk_rx_n,
//Input from RPE

       rpe_data,
       rpe_data_valid,
       rpe_sof,
       rpe_eof,
       rpe_status,
       rpe_status_valid,

// Input from AFB

       afb_daf_filterfail,
       afb_daf_filterfail_valid,
       afb_rcvmulticast,
       afb_rcvbroadcast,
       afb_daf_addr,

// Input from CSR

       scr_unicastdetect,
       scr_duplexmode,
       scr_flowctrl_e,

// Outputs

       frx_load_pause_time,
       frx_pause_time,
       frx_ctrlframe_valid,
       frx_ctrlframe,
       frx_pausframe_valid,
       frx_pausframe,
       frx2mmc_ctrlframe );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

input                       clk_rx_i;                // Rx clock
input                       rst_clk_rx_n;          // Reset synchronous to Rx clock
input [7:0]                 rpe_data; // Frame data
input                       rpe_data_valid; // Frame data valid
input                       rpe_sof; // start of frame indication
input                       rpe_eof; // end of frame indication
input [23:0]                rpe_status; // status 
input                       rpe_status_valid; // status valid

input                       afb_daf_filterfail; // DA filter fail 
input                       afb_daf_filterfail_valid; // DA filte fail valid
input                       afb_rcvmulticast; // Received multicast
input                       afb_rcvbroadcast; // Received broadcast
input [4:0]                 afb_daf_addr; // MAC DA Register which matches the DA
input                       scr_unicastdetect; // detect unicast frames
input                       scr_duplexmode; // duplex mode of operation
input                       scr_flowctrl_e; // enable flow control

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

output                      frx_load_pause_time; // load value on frx_pause_time
output [15:0]               frx_pause_time; // Pause time from received pause frame.
output                      frx_ctrlframe_valid; // valid for control frames
output                      frx_ctrlframe; // control frame indication
output                      frx_pausframe_valid; // valid for pause control frame 
output                      frx_pausframe; // pause control frame indication
output                      frx2mmc_ctrlframe; // control frame indication to MMC

// ---------------------------------------------
// Output Port Register Declarations. ----------------------------------------
// ---------------------------------------------

reg   [15:0]                frx_pause_time;
reg                         frx2mmc_ctrlframe;
reg                         frx_ctrlframe_valid;

// ---------------------------------------------
// Output Port Wire Declarations. ----------------------------------------
// ---------------------------------------------
wire                        frx_load_pause_time;
wire                        frx_ctrlframe;
wire                        frx_pausframe_valid;
wire                        frx_pausframe;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------

reg                         spl_mcast_addr_match; // special multicast address match
reg [2:0]                   lfsr_cnt; // to count bytes of DA, SA, LT & opcode
reg                         type_mismatch; // Length / Type mismatch (8808 H)
reg                         opcode_mismatch; // pause frame opcode mismatch (0001 H)
reg [5:0]                   frx_state; // FSM current state
reg [5:0]                   next_frx_state; // FSM next state
reg                         da_match_ctrlframe; // special multicast or valid unicast
reg                         ucast_addr_match; // unicast address is matched
reg                         pausframe_valid; // indicates that 2nd byte of OPCODE is present on rpe_data

// ---------------------------------------------
// Parameter Declarations. ----------------------------------------
// ---------------------------------------------

parameter [5:0]              FRX_IDLE=6'd0,
                             FRX_RCV_DA=6'd1,
                             FRX_RCV_SA=6'd2,
                             FRX_LEN_TYP=6'd3,
                             FRX_OPCODE=6'd4,
                             FRX_WAIT_FOR_STS=6'd5;
// LFSR counter values sequence 7,6,5,2,4,1,3			     
parameter                    LFSR_COUNT_ONE   = 3'b111;
parameter                    LFSR_COUNT_TWO   = 3'b110;
parameter                    LFSR_COUNT_THREE = 3'b101;
parameter                    LFSR_COUNT_FOUR  = 3'b010;
parameter                    LFSR_COUNT_FIVE  = 3'b100;
parameter                    LFSR_COUNT_SIX   = 3'b001;
parameter                    LFSR_COUNT_SEVEN = 3'b011;

// ---------------------------------------------
// Combinational statements. FSM  Block-------------------------------------
// ---------------------------------------------

always @(*)
begin
  next_frx_state = 6'b000000;
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off  
  case (`H) //synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on  

  frx_state[FRX_IDLE]: begin
    if (rpe_data_valid & rpe_sof & !rpe_eof)
      next_frx_state[FRX_RCV_DA] = `H;
    else 
      next_frx_state[FRX_IDLE] = `H;
  end

  frx_state[FRX_RCV_DA]: begin
    if (rpe_eof)
      next_frx_state[FRX_IDLE] = `H;
    else if (lfsr_cnt == LFSR_COUNT_SIX & rpe_data_valid) 
      next_frx_state[FRX_RCV_SA] = `H;
    else 
      next_frx_state[FRX_RCV_DA] = `H;
  end

  frx_state[FRX_RCV_SA]: begin
    if (rpe_eof)
      next_frx_state[FRX_IDLE] = `H;
    else if (lfsr_cnt == LFSR_COUNT_SIX & rpe_data_valid)
      next_frx_state[FRX_LEN_TYP] = `H;
    else 
      next_frx_state[FRX_RCV_SA] = `H;
  end

  frx_state[FRX_LEN_TYP]: begin
    if (type_mismatch | rpe_eof | (!da_match_ctrlframe &
        lfsr_cnt == LFSR_COUNT_TWO))
      next_frx_state[FRX_IDLE] = `H;
    else if (lfsr_cnt == LFSR_COUNT_TWO & rpe_data_valid
        & !type_mismatch & da_match_ctrlframe) 
      next_frx_state[FRX_OPCODE] = `H;
    else 
      next_frx_state[FRX_LEN_TYP] = `H;
  end
   
  frx_state[FRX_OPCODE]: begin
    if (opcode_mismatch | rpe_eof | !scr_duplexmode | 
        !scr_flowctrl_e)
      next_frx_state[FRX_IDLE] = `H;
    else if (lfsr_cnt == LFSR_COUNT_FOUR & rpe_data_valid)
      next_frx_state[FRX_WAIT_FOR_STS] = `H;
    else 
      next_frx_state[FRX_OPCODE] = `H; 
  end

  frx_state[FRX_WAIT_FOR_STS]: begin
    if (rpe_status_valid)
      next_frx_state[FRX_IDLE] = `H;
    else
      next_frx_state[FRX_WAIT_FOR_STS] = `H;
  end

  endcase
// leda W225 on  
end


// ---------------------------------------------
// Registered statements. Control  Block-------------------------------------
// ---------------------------------------------
// Functions of control block:
// 1. Looks for special multicast address or unicast address in each frame
// 2. Looks for the pause control opcode and type.
// 3. Keeps track of the slot time and indicates the slot time completion.
// 4. Acknowledges the pause time value after reception of error free control frame

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    spl_mcast_addr_match <= `L;
  else begin
      if (rpe_eof & rpe_data_valid)
        spl_mcast_addr_match <= `L;
      else if (rpe_sof & rpe_data_valid) 
        spl_mcast_addr_match <= (rpe_data == 8'h01) ;
      else if (rpe_data_valid & spl_mcast_addr_match & frx_state[FRX_RCV_DA])
        spl_mcast_addr_match <= (rpe_data == 8'h80 & lfsr_cnt == LFSR_COUNT_ONE) |
	                        (rpe_data == 8'hc2 & lfsr_cnt == LFSR_COUNT_TWO) |
				(rpe_data == 8'h00 & lfsr_cnt == LFSR_COUNT_THREE) |
				(rpe_data == 8'h00 & lfsr_cnt == LFSR_COUNT_FOUR) |
				(rpe_data == 8'h01 & lfsr_cnt == LFSR_COUNT_FIVE);
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    lfsr_cnt <= LFSR_COUNT_ONE;
  else begin
    if (rpe_data_valid) begin
      if (((frx_state[FRX_RCV_DA] | frx_state[FRX_RCV_SA]) & lfsr_cnt == LFSR_COUNT_SIX) |
          frx_state[FRX_IDLE] | (frx_state[FRX_OPCODE] & lfsr_cnt == LFSR_COUNT_FOUR))
        lfsr_cnt <= LFSR_COUNT_ONE;
      else if (!frx_state[FRX_IDLE] & lfsr_cnt != LFSR_COUNT_SEVEN)
        lfsr_cnt <= {lfsr_cnt[1], lfsr_cnt[0], (lfsr_cnt[2] ^ lfsr_cnt[0])};
    end
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    type_mismatch <= `L;
  else if (rpe_data_valid) begin
    if (frx_state[FRX_RCV_SA] & lfsr_cnt == LFSR_COUNT_SIX)
      type_mismatch <= (rpe_data != 8'h88);
    else if (frx_state[FRX_LEN_TYP] & lfsr_cnt == LFSR_COUNT_ONE & ~type_mismatch)
      type_mismatch <= (rpe_data != 8'h08);
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    opcode_mismatch <= `L;
  else if (rpe_data_valid) begin
    if (frx_state[FRX_LEN_TYP] & lfsr_cnt == LFSR_COUNT_TWO)
      opcode_mismatch <= (rpe_data != 8'h00);
    else if (frx_state[FRX_OPCODE] & lfsr_cnt == LFSR_COUNT_THREE & ~opcode_mismatch) 
      opcode_mismatch <= (rpe_data != 8'h01);
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    frx_state <= 6'b000001;
  else
    frx_state <= next_frx_state;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    da_match_ctrlframe <= `L;
  else if (frx_state[FRX_IDLE]) 
    da_match_ctrlframe <= `L;
  else if ((spl_mcast_addr_match & frx_state[FRX_RCV_DA] &
           next_frx_state[FRX_RCV_SA]) | 
          (frx_state[FRX_RCV_SA] & ucast_addr_match)) 
    da_match_ctrlframe <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    ucast_addr_match <= `L;
  else if (!afb_daf_filterfail & afb_daf_filterfail_valid &
           !afb_rcvmulticast & !(&afb_daf_addr) & scr_unicastdetect)
    ucast_addr_match <= `H;
  else if (!rpe_data_valid)
    ucast_addr_match <= `L;
end




      
// ---------------------------------------------
// Combinatorial statements. Output  Block-------------------------------------
// ---------------------------------------------
// The output block is responsible for generating the various control and status
// information for RFC and MMC modules. 

assign frx_ctrlframe = !type_mismatch;
assign frx_pausframe = !opcode_mismatch & rpe_data == 8'h01 & frx_state[FRX_OPCODE];
assign frx_pausframe_valid = pausframe_valid & rpe_data_valid;

// Pulse signal is given to use this value if pause frame received is error-free.
assign frx_load_pause_time = (frx_state[FRX_WAIT_FOR_STS] & rpe_status_valid &
                              rpe_status == `STATUS_OK);

// ---------------------------------------------
// Registered statements. Output  Block-------------------------------------
// ---------------------------------------------

// Pause time from received frame is picked up. 
always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    frx_pause_time <= {16{`L}};
  else if (rpe_data_valid) begin
    if (frx_state[FRX_OPCODE] & lfsr_cnt == LFSR_COUNT_FOUR)
      frx_pause_time[15:8] <= rpe_data;
    else if (frx_state[FRX_WAIT_FOR_STS] & lfsr_cnt == LFSR_COUNT_ONE)
      frx_pause_time[7:0]  <= rpe_data;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    frx_ctrlframe_valid <= `L;
  else 
    frx_ctrlframe_valid <= (frx_state[FRX_LEN_TYP] & lfsr_cnt == LFSR_COUNT_ONE &
                            (rpe_data_valid | type_mismatch));
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    pausframe_valid <= `L;
  else if (rpe_data_valid) 
    pausframe_valid <= frx_state[FRX_LEN_TYP] & lfsr_cnt == LFSR_COUNT_TWO;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    frx2mmc_ctrlframe <= `L;
  else if (frx_state[FRX_WAIT_FOR_STS] & rpe_status_valid & 
           rpe_status == `STATUS_OK)
    frx2mmc_ctrlframe <= `H;
  else 
    frx2mmc_ctrlframe <= `L;
end


endmodule
