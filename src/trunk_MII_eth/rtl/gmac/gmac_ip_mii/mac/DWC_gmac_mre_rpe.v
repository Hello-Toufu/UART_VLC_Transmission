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
// File Version     :        $Revision: #19 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// dwc_gmac_mre_rpe (dwc_gmac_mre_rpe.v)
//
// DESCRIPTION:
// GMAC Receive Protocol Engine (RPE)
// This module converts the 8-bit GMII/MII interface running at full receive
// clock. The state machine runs at recieve clock and receives data from 
// input data assembly logic. RPE transfers data along with status to RFC 
// module. the data assembly logic selects data between txd and rxd upon  
// loopback. An asyn fifo handles the clock transition from clk_tx_i to
// clk_rx_i.
//--------------------------------------------------------------------------

`define SFD 8'b1101_0101
`define MIN_FRAME_LEN 14'd46
`define MIN_FRAME_LEN_VLAN 14'd42
`define MAX_FRAME_LEN 14'd1500
`define MAX_FRAME_LEN_VLAN 14'd1522

module DWC_gmac_mre_rpe (
  // Inputs from GMII / MII.
       clk_rx_i,
                         rst_clk_rx_n,
                         gmii_rxdv_i,
                         gmii_rxer_i,
                         gmii_rxd_i,
                         // Inputs from CSR     
                         scr_col,
                         scr_autocrcpadstrip,
                         scr_loopback_mode,
                         scr_disreceiveown,
                         scr_receive_e,
                         scr_duplexmode,
                         scr_portselect,
                         scr_jumboframe_e,
                         scr_watchdog_e,
                         scr_vlantag,
                         // Input from CRX
                         crx_match,
                         // Loopback input
                         lpbk_data,
                         // Outputs.
                         rpe_data,
                         rpe_data_valid,
                         rpe_padcrc_strip,
                         rpe_sof,
                         rpe_eof,
                         rpe_payload_start,
                         rpe_status_valid,
                         rpe_rcvd_frame_size,
                         rpe_fsm_sts,
                         rpe_status
                         );

// ---------------------------------------------
// Input Port Declarations. ----------------------------------------
// ---------------------------------------------

// Clock and Reset Signals.
input                        clk_rx_i;         // receive GMII/MII clock
input                        rst_clk_rx_n;   // synchronous reset to clk_rx1_i
// GMII/MII interface signals.
input                        gmii_rxdv_i;       // receive enable for gmii_rxd_i
input                        gmii_rxer_i;       // receive error, when gmii_rxdv_i
input  [`RXD_WIDTH-1:0]      gmii_rxd_i;        // 8bit receive data 

// Control and Miscellaneous Signals.
input                        scr_col;           // collision detected on medium
input                        scr_autocrcpadstrip;  // strips both pad and crc
input                        scr_loopback_mode;  // receiver loops back gmii_txd_o 
input                        scr_disreceiveown; // during transmit, in halfduplex
input                        scr_receive_e;     // enables receive state machine
input                        scr_duplexmode;    // set on full duplex mode
input                        scr_portselect;    // indicates GMII/MII port
input                        scr_jumboframe_e;  // max upto 9000(9018) byte frames
input                        scr_watchdog_e;  // cuts off, above 2048 bytes
input  [16:0]                scr_vlantag;        // VLAN tag register.
input                        crx_match;          // calculated CRC from CRX checker
input  [`RXD_WIDTH+1:0]      lpbk_data;          // FIFO data for loopback

// ---------------------------------------------
// Output Port Declarations. ----------------------------------------
// ---------------------------------------------

output  [7:0]               rpe_data;       // the received data, valid with rpe_data_valid
output                      rpe_data_valid; // valid signal for rpe_data
output                      rpe_padcrc_strip; // indicates pad / or crc is stripped
output                      rpe_sof;        // indicates the start of frame
output                      rpe_eof;        // indicates the end of frame
output                      rpe_fsm_sts;    // when low, RPE FSM is in IDLE state
output  [23:0]              rpe_status;     // the received frame status
output                      rpe_status_valid; // enable for rpe_status
output  [13:0]              rpe_rcvd_frame_size; // Actual size of frame received
output                      rpe_payload_start;// indicates the start of the frame payload

// ---------------------------------------------
// Output Port Register Declarations. ----------------------------------------
// ---------------------------------------------

reg                         rpe_status_valid; 
reg [13:0]                  rpe_rcvd_frame_size;
reg [7:0]                   rpe_data;
reg                         rpe_data_valid;
reg                         rpe_sof;
reg                         rpe_payload_start;
reg                         rpe_eof;

// ---------------------------------------------
// Output Port Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire                        rpe_padcrc_strip;
wire   [23:0]               rpe_status;

// ---------------------------------------------
// Internal Register Declarations. ----------------------------------------
// ---------------------------------------------

reg                         rxdv;             // register gmii_rxdv_i 
reg                         rxer;             // register gmii_rxer_i 
reg                         rxdv_d1;          // register rxdv_muxed
reg                         rxer_d1;          // register rxer_muxed
reg  [`RXD_WIDTH-1:0]       rxd_d;            // register gmii_rxd_i or gmii_txd_o
reg  [`RXD_WIDTH-1:0]       rxd_d1;           // register and select loopback data or 
                                              // registered data input
reg                         sfd_det_mii_prev; // for MII mode check for first nibble of SFD
reg                         data_valid_gmii;  // valid signal for data in GMII mode
reg                         data_valid_mii;   // valid signal for data in MII mode
reg                         data_valid_mii_en;// valid signal for data_valid_mii
reg  [3:0]                  rxd_prev_mii;     // storing the previous nibble for forming a byte in MII 
reg  [5:0]                  rpe_state;        // Current state of the RPE state machine.
reg  [5:0]                  next_rpe_state;   // Next state of the RPE state machine. 


reg  [13:0]                 byte_cntr;        // To count the number of bytes received
reg  [7:0]                  length_type_lo;   // Lower byte of length / type field
reg  [7:0]                  length_type_hi;   // Higher byte of length / type field
reg  [13:0]                 status_frame_len; //frame length status
reg                         dribble_bit;      // dribble error
reg                         length_err;       // Length error indication
reg                         vlan_frame_status;// Indication of VLAN frame to status block
reg                         gmii_er;          // GMII error indication
reg                         late_col;         // Late Collision
reg                         giant_frame;      // Giant frame indication 
reg                         runt_frame;       // Runt frame indication 
reg                         wdt_timeout;      // Watchdog timer timeout for status
reg                         vlan_frame;       // indicates a VLAN type frame
reg                         autocrcpadstrip;  // Mask data valid for Auto Pad and CRC strip

// ---------------------------------------------
// Internal Wire Declarations. ----------------------------------------
// ---------------------------------------------

wire                        sfd_det_gmii;     //indication of SFD detected in GMII mode
wire                        sfd_det_mii;      //indication of SFD detected in MII mode
wire                        data_valid;       //data mux o/p GMII / MII
wire                        sfd_det;          //SFD mux o/p GMII / MII
wire                        rxdv_muxed;       // mux betn reg. input rxdv or loopback txdv
wire                        rxer_muxed;       // mux betn reg. input rxer or loopback txer
wire [7:0]                  rxd;              //mux o/p GMII / MII
wire                        rxdv_rxer_mask;   // Masks the input path during Half-Duplex and
                                              // receive own is disabled
wire [15:0]                 frame_len1;       // two-byte data in the Length / Type field
wire                        frame_type;       //type frame indication
wire                        wdt_cutoff;       //watchdog timer cutoff reached
wire [15:0]                 rcvd_frame_len;   // registered value of the frame length
wire                        ext_err;          // Extension error indication

// ---------------------------------------------
// Parameter Declarations. ----------------------------------------
// ---------------------------------------------


parameter [5:0]             RPE_IDLE   =6'd0,
                            RPE_ADDR   =6'd1,
                            RPE_LT     =6'd2,
                            RPE_DATA   =6'd3,
                            RPE_STATUS =6'd4,
			    RPE_FLUSH  =6'd5;


// ---------------------------------------------
// Combinational statements. Input Assembly Block-----------------------
// ---------------------------------------------
// This block assembles the input data based on the input mode of operation (GMII/MII).
// The mode is selected by scr_portselect (0-GMII, 1-MII). In MII mode, the 4-bit data
// is converted into 8-bit in two clock cycles. This block also generates the data_valid
// signal which validates the 8-bit data on rxd. The SFD detect signal (sfd_det) is 
// generated to indicate the Start of Frame data. This block also multiplexes the input
// receive data and the transmit data (synchronized to clk_rx_i) based on the 
// scr_loopback_mode

assign sfd_det_gmii   = `L;

assign sfd_det_mii    = ((rxd_d1[3:0] == 4'hd) & rxdv_d1 & sfd_det_mii_prev);
assign data_valid     = scr_portselect ? data_valid_mii: data_valid_gmii;
assign sfd_det        = scr_portselect ? sfd_det_mii: sfd_det_gmii;
assign rxd            = {rxd_d1,rxd_prev_mii[3:0]};
assign rxdv_rxer_mask = (!scr_duplexmode & !scr_loopback_mode & scr_disreceiveown &
                        (lpbk_data[`RXD_WIDTH+1] | lpbk_data[`RXD_WIDTH]));
assign rxdv_muxed     = rxdv_rxer_mask ? `L : (scr_loopback_mode ? lpbk_data[`RXD_WIDTH] : rxdv);
assign rxer_muxed     = rxdv_rxer_mask ? `L : (scr_loopback_mode ? lpbk_data[`RXD_WIDTH+1] : rxer);

// ---------------------------------------------
// Registered statements. Input Assembly Block-----------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rxd_prev_mii <= 4'h0;
  else if (data_valid_mii_en)
    rxd_prev_mii <= rxd_d1[3:0];
end
  
always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    sfd_det_mii_prev <= `L;
  else if (rxdv_d1 & rxd_d1[3:0] == 4'h5)
      sfd_det_mii_prev <= `H;
  else
      sfd_det_mii_prev <= `L;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rxd_d <= {4{`L}};
  else
    rxd_d <= gmii_rxd_i;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    rxd_d1 <= {4{`L}};
  else if (scr_loopback_mode)
      rxd_d1 <= lpbk_data[`RXD_WIDTH-1:0];
  else
      rxd_d1 <= rxd_d;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    rxdv <= `L;
    rxer <= `L;
  end
  else begin
    rxdv <= gmii_rxdv_i;
    rxer <= gmii_rxer_i;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    rxdv_d1 <= `L;
    rxer_d1 <= `L;
  end
  else begin
    rxdv_d1 <= rxdv_muxed;
    rxer_d1 <= rxer_muxed;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    data_valid_gmii <= `L;
  else if (!rxdv_muxed)
    data_valid_gmii <= `L;
  else if (sfd_det_gmii)
    data_valid_gmii <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    data_valid_mii_en <= `L;
  else if (!rxdv_muxed)
    data_valid_mii_en <= `L;
  else if (sfd_det_mii)
    data_valid_mii_en <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    data_valid_mii <= 1'b0;
  else if (data_valid_mii_en)
    data_valid_mii <= !data_valid_mii;
  else if (sfd_det_mii) 
    data_valid_mii <= 1'b0;
  else if (rxdv_muxed)
    data_valid_mii <= `L;
end


// ---------------------------------------------
// RPE State Machine. Combinatorial part------------------------------------ 
// ---------------------------------------------

  always @(*) 
  begin
    next_rpe_state  = 6'b000000;

// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off
    case (`H) // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on
      rpe_state[RPE_IDLE]: begin
        if (scr_receive_e & sfd_det & rxdv_d1) 

            next_rpe_state[RPE_ADDR] = `H;
        else
            next_rpe_state[RPE_IDLE] = `H;
      end

      rpe_state[RPE_ADDR]: begin
        if (rxdv_d1) begin
          if (data_valid & byte_cntr == 14'd11)
            next_rpe_state[RPE_LT] = `H;
          else
            next_rpe_state[RPE_ADDR] = `H;
        end
        else 
            next_rpe_state[RPE_STATUS] = `H;
      end

      rpe_state[RPE_LT]: begin
        if (rxdv_d1) begin
          if (data_valid & ((vlan_frame & byte_cntr == 14'd17) | //Change the data after length / type
              ((frame_len1 != 16'h8100) & byte_cntr == 14'd13)))  // (after 14 bytes) for normal frames 
            next_rpe_state[RPE_DATA] = `H;                        // and after MAC length field (after 
          else                                                    // 18 bytes) in VLAN frame for gen.
            next_rpe_state[RPE_LT] = `H;                          // of payload for IPC.
        end
        else
            next_rpe_state[RPE_STATUS] = `H;
      end
          
      rpe_state[RPE_DATA]: begin
        if (!rxdv_d1) begin
            next_rpe_state[RPE_STATUS] = `H;

        end
        else begin
          if (wdt_cutoff) 
            next_rpe_state[RPE_STATUS] = `H;
          else
            next_rpe_state[RPE_DATA] = `H;
        end
      end
      

      rpe_state[RPE_STATUS]: begin
        if (rxdv_d1)
          next_rpe_state[RPE_FLUSH] = `H;
        else
          next_rpe_state[RPE_IDLE] = `H;
      end

      rpe_state[RPE_FLUSH]: begin
        if (!rxdv_d1)
          next_rpe_state[RPE_IDLE] = `H;
        else
          next_rpe_state[RPE_FLUSH] = `H;
      end
    endcase
// leda W225 on
  end

// ---------------------------------------------
// RPE State Machine. Sequential part------------------------------------ 
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rpe_state <= 6'b000001;

  else
    rpe_state <= next_rpe_state;
end

// ---------------------------------------------
// Combinational statements. Control Logic Block-----------------------
// ---------------------------------------------
// This block generates various control signals.


assign frame_len1     = {length_type_lo, rxd[7:0]};
assign frame_type     = ({length_type_lo, length_type_hi} >= 16'h600);
assign wdt_cutoff     = rpe_state[RPE_DATA] & rxdv_d1 & scr_watchdog_e ? 
                        (scr_jumboframe_e ?  (byte_cntr[13] & byte_cntr[11]) : // 14'd10240
			                     (|byte_cntr[13:11])) :            // 14'd2048
                                             (&byte_cntr);                     // 14'd16383
assign rcvd_frame_len = {length_type_lo, length_type_hi};

// ---------------------------------------------
// Registered statements. Control Logic Block-----------------------
// ---------------------------------------------


always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    length_type_lo <= 8'h00;
  else if (rpe_state[RPE_IDLE])
    length_type_lo <= 8'h00;
  else if (rxdv_d1 & data_valid & byte_cntr == 14'd12)
    length_type_lo <= rxd;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    length_type_hi <= 8'h00;
  else if (rpe_state[RPE_IDLE])
    length_type_hi <= 8'h00;
  else if (rxdv_d1 & data_valid & byte_cntr == 14'd13)
    length_type_hi <= rxd;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    wdt_timeout <= `L;
  else if (rpe_state[RPE_IDLE])
    wdt_timeout <= `L;
  else if (wdt_cutoff)
    wdt_timeout <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) begin
    giant_frame <= 1'b0;
  end
  else begin
    if (rpe_state[RPE_STATUS] & !vlan_frame) begin
      if (scr_jumboframe_e)
        giant_frame <= (byte_cntr > 9018);
      else
        giant_frame <= (byte_cntr > 1518);
    end
    else
    if (rpe_state[RPE_STATUS] & vlan_frame) begin
      if (scr_jumboframe_e)
        giant_frame <= (byte_cntr > 9022);
      else
        giant_frame <= (byte_cntr > 1522);
    end
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    vlan_frame <= `L;
  else if (rpe_state[RPE_IDLE])
    vlan_frame <= `L;
  else if (rpe_state[RPE_LT] & byte_cntr == 14'd13)
    vlan_frame <= (frame_len1 == 16'h8100);
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    autocrcpadstrip <= `L;
  else if (rpe_state[RPE_IDLE])
    autocrcpadstrip <= `L;
  else if (rpe_state[RPE_DATA] & !frame_type & 
          (byte_cntr > (rcvd_frame_len + 14'd13)) & scr_autocrcpadstrip)
    autocrcpadstrip <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    vlan_frame_status <= `L;
  else if (rpe_state[RPE_IDLE])
    vlan_frame_status <= `L;
  else begin
    if (vlan_frame) begin
      if ((scr_vlantag == {1'b0,16'h0000}) | 
          (scr_vlantag[16] & scr_vlantag[11:0] == 12'h000)) 
        vlan_frame_status <= `H;
      else if (data_valid & byte_cntr ==  14'd14 & !vlan_frame_status) begin
        if (scr_vlantag[16])
          vlan_frame_status <= (scr_vlantag[11:8] == rxd[3:0]);
        else
          vlan_frame_status <= (scr_vlantag[15:8] == rxd);
      end
      else if (data_valid & byte_cntr == 14'd15 & vlan_frame_status)
        vlan_frame_status <= (scr_vlantag[7:0] == rxd);
    end
    else 
      vlan_frame_status <= `L;
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    byte_cntr <= 14'd0;
  else if (rpe_state[RPE_IDLE]) 
    byte_cntr <= 14'd0;
    else if (data_valid & byte_cntr != 14'h3fff)

      byte_cntr <= byte_cntr + 14'd1;
end

// ---------------------------------------------
// Combinational statements. Status Logic Block-----------------------
// ---------------------------------------------
// This block generates the status logic which is validated by the status valid
// signal.

assign ext_err     = `L;

assign rpe_status  = {(length_err & !frame_type), vlan_frame_status, 
                      !crx_match, dribble_bit, gmii_er, frame_type, late_col,
                      giant_frame, runt_frame,wdt_timeout, status_frame_len};

// ---------------------------------------------
// Registered statements. Status Logic Block-----------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rpe_status_valid <= `L;
  else if (rpe_state[RPE_IDLE] | rpe_state[RPE_FLUSH])
    rpe_status_valid <= `L;
  else if (rpe_state[RPE_STATUS] & (next_rpe_state[RPE_IDLE] |
           next_rpe_state[RPE_FLUSH])) 
    rpe_status_valid <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    late_col <= `L;
  else if (rpe_state[RPE_IDLE])
    late_col <= `L;
  else begin
    if (rpe_state[RPE_DATA] & scr_col & !scr_duplexmode) begin
      if (scr_portselect)
        late_col <= (byte_cntr > 14'd63);
      else
        late_col <= (byte_cntr > 14'd511);
    end
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    length_err <= `L;
  else if (rpe_state[RPE_IDLE])
    length_err <= `L;
  else if(rcvd_frame_len < `MIN_FRAME_LEN) begin
    if (rpe_state[RPE_STATUS])
       length_err <= (rpe_padcrc_strip)? (status_frame_len < rcvd_frame_len + 14'd14):
                                         (status_frame_len < rcvd_frame_len + 14'd18);
  end
  else if(rcvd_frame_len <= `MAX_FRAME_LEN) begin
    if (rpe_state[RPE_DATA] & !next_rpe_state[RPE_DATA])
       length_err <= (byte_cntr != rcvd_frame_len + 14'd18) ; 
  end
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rpe_rcvd_frame_size <= 14'd0;
  else if ((rpe_state[RPE_DATA] | rpe_state[RPE_ADDR] | rpe_state[RPE_LT]) & 
               next_rpe_state[RPE_STATUS])

    rpe_rcvd_frame_size <= byte_cntr;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    status_frame_len <= 14'd0;
  else if (rpe_state[RPE_IDLE])
    status_frame_len <= 14'd0;
  else if ((rpe_state[RPE_DATA] & !autocrcpadstrip) | ((rpe_state[RPE_ADDR] | rpe_state[RPE_LT]) &
                next_rpe_state[RPE_STATUS]))

    status_frame_len <= byte_cntr;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    gmii_er <= `L;
  else if (rpe_state[RPE_IDLE] & !rxdv_d1)
    gmii_er <= `L;
  else if ((rxer_d1 & rxdv_d1) | (ext_err & !gmii_er))
    gmii_er <= `H;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    runt_frame <= `L;
  else if (rpe_state[RPE_IDLE]) 
    runt_frame <= `L;
  else if (rxdv_d1 & !scr_duplexmode & scr_col)
    runt_frame <= (byte_cntr < 14'd64);
  else if ((rpe_state[RPE_DATA] | rpe_state[RPE_ADDR] | rpe_state[RPE_LT]) & 
           next_rpe_state[RPE_STATUS])

    runt_frame <= (byte_cntr < 14'd64);
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    dribble_bit <= `L;
  else if (rpe_state[RPE_IDLE])
    dribble_bit <= `L;
  else if ((rpe_state[RPE_DATA] | rpe_state[RPE_ADDR] | rpe_state[RPE_LT])
            & scr_portselect & rpe_data_valid)
    dribble_bit <= rxdv_d1 & !wdt_cutoff;
end

// ---------------------------------------------
// Combinatorial statements. Output Logic Block-----------------------
// ---------------------------------------------

assign rpe_padcrc_strip  = autocrcpadstrip;
assign rpe_fsm_sts = !rpe_state[RPE_IDLE];

// ---------------------------------------------
// Registered statements. Output Logic Block-----------------------
// ---------------------------------------------

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    rpe_data <= 8'h00;
  else if (data_valid)
    rpe_data <= rxd;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rpe_data_valid <= `L;
  else if ((rpe_state[RPE_ADDR] | rpe_state[RPE_LT] | rpe_state[RPE_DATA]) & !wdt_cutoff)
    rpe_data_valid <= data_valid & (~scr_portselect | (scr_portselect & data_valid_mii_en));
  else 
    rpe_data_valid <= `L;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    rpe_sof <= `L;
  else if (data_valid & rpe_state[RPE_ADDR] & byte_cntr == 14'd0)
    rpe_sof <= `H;
  else
    rpe_sof <= `L;
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n)
    rpe_payload_start <= 1'b0;
  else if (rpe_state[RPE_DATA] & !vlan_frame)
    rpe_payload_start <= (byte_cntr == 14'd14);
  else if (rpe_state[RPE_DATA])
    rpe_payload_start <= (byte_cntr == 14'd18);
end

always @(`RX_RST_MODE)
begin
  if (!rst_clk_rx_n) 
    rpe_eof <= `L;
  else if (rpe_eof)
    rpe_eof <= `L;
  else if ((rpe_state[RPE_ADDR] | rpe_state[RPE_LT]) & 
               next_rpe_state[RPE_STATUS])

    rpe_eof <= `H;
  else if (rpe_state[RPE_DATA] & (!rxdv_muxed | (wdt_cutoff & 
           next_rpe_state[RPE_STATUS]))) 
    rpe_eof <= `H;
end






endmodule
