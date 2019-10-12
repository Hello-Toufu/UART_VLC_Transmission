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
// Date             :        $Date: 2008/08/12 $
// File Version     :        $Revision: #24 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Transmit Protocol Engine (DWC_gmac_mte_tpe.v)
//
// DESCRIPTION:
// This module is responsible for transmission of frame in compliance with 
// IEEE 802.3/802.3z specification.
//--------------------------------------------------------------------------

`define LFSR_CNT_1 4'hF 
`define LFSR_CNT_4 4'hA 
`define LFSR_CNT_5 4'h5 
`define LFSR_CNT_7 4'h6 
`define LFSR_CNT_8 4'hC 
`define LFSR_CNT_10 4'h2 
`define LFSR_CNT_14 4'h3 

`define EXSSDEF_LMT_GMII 15'h4BEB
`define EXSSDEF_LMT_MII 15'h17B7

`define EARLY_BST_LMT 14'h1FF4

module DWC_gmac_mte_tpe (
        clk_tx_i,
                         rst_clk_tx_n,
                         // TFC <-> TPE request handshake signals
                         tfc_req,
                         tpe_gnt,
                         // TFC Interface signals
                         tfc_data_valid,
                         tfc_data,
                         tfc_sof,
                         tfc_eof,
                         tpe_ack,
                         tpe_abort,
                         // Transmit status output
                         tpe_txstatus_valid,
                         tpe_txstatus,
                         tpe_fsm_sts,
                         sct_portselect,
                         sct_duplexmode,
                         sct_transmit_e,
                         sct_disretry,
                         sct_col,
                         sct_crs,
                         sct_backpressure,
                         sct_txflowctrl_e,
                         sct_frameburst_e,
                         sct_deferral_chk,
                         sct_jabber_e,
                         sct_jumboframe_e,
                         mti_txfifoflush_i,
                         mti_flowctrl_i,
                         tpe_txcarrier,
                         tpe_backoff_strt,
                         stx_xmitok,
                         stx_backoff,
                         // GMII Outputs
                         gmii_txen_o,
                         gmii_txer_o,
                         gmii_txd_o
                         );

// Input and Output port declarations
        
  input            clk_tx_i;            // Transmit clock (2.5/25/125)Mhz.  
  input            rst_clk_tx_n;        // Active low reset synchronous to clk_tx_i. 

  // TFC <-> TPE request handshake signals
  input            tfc_req;             // Frame Transmit request from TFC. 
  output           tpe_gnt;             // Grant ackowledging the TFC request.

  // TFC Interface signals
  input            tfc_data_valid;      // Data valid for frame data from TFC.
  input  [7:0]     tfc_data;            // 8-bit frame data.
  input            tfc_sof;             // Start of frame. 
  input            tfc_eof;             // End of frame.
  output           tpe_ack;             // Acknowledge signal for frame data. 
  output           tpe_abort;           // Frame aborted in TPE. 
  
  // Transmit status output
  output           tpe_txstatus_valid;  // Tx status valid from TFC.
  output [31:0]    tpe_txstatus;        // Tx Frame status. 
  output           tpe_fsm_sts;         // When low, TPE FSM is in IDLE state
  
  // MMC outputs
                                        // which is not intimated to application 

  // SYNC Block inputs
  input            sct_portselect;      // Port select qualifying the MII/GMII interface.
  input            sct_duplexmode;      // Mode signal qualifying half/full duplex mode.
  input            sct_transmit_e;      // Transmit Enable from CSR.

  input            sct_disretry;        // Disable retransmission of frame.     
  input            sct_col;             // Collision detect indication from PHY 
                                        // synchronous to clk_tx_i.
                                        
  input            sct_crs;             // Carrier sense indication from PHY 
                                        // synchronous to clk_tx_i.
                                        
  input            sct_backpressure;    // Back pressure active signal from CSR
                                        // (valid for half duplex only).
                                        
  input            sct_txflowctrl_e;      // Flow control enable from CSR.
  input            sct_frameburst_e;    // Frame burst enable from CSR 
                                        // (valid for full duplex only).
                                        
  input            sct_deferral_chk;    // Deferral check enable from CSR.
  input            sct_jabber_e;        // Jabber funcion enable from CSR.
  input            sct_jumboframe_e;    // Jumbo frame enable from CSR.

  input            mti_txfifoflush_i;     // Tx FIFO Flush pulse from application                                      
  
  input            mti_flowctrl_i;      // H/W flow control request from application. 
  output           tpe_txcarrier;       // Signal indicating transmit  on 
                                        // GMII/MII interface.
                                        
  output           tpe_backoff_strt;    // Back off start indication to 
                                        // Transmit scheduler(STX).
                                        
  
  input            stx_xmitok;          // Transmit Ok from scheduler indicating 
                                        // end of deference.
  input            stx_backoff;         // Backoff interval signal from scheduler					
        
  // GMII/MII Outputs
  output                   gmii_txen_o;         // GMII/MII Transmit data enable.     
  output                   gmii_txer_o;         // GMII/MII Transmit error.
  output [`TXD_WIDTH-1:0]  gmii_txd_o;          // GMII/MII Transmit data.
// Internal reg and wire declarations
  reg    [7:0]     tfc_data_r;          // Registered tfc_data signal.
  reg              tfc_eof_r;           // Registered tfc_eof signal.
  reg              tpe_abort_int;           // Frame aborted due to collision,no carrier,
  
  wire             col_det_d;           // Always low

                                      
  reg              tpe_txcarrier;       // Signal indicating transmit  on 
                                        // GMII/MII interface.
  
wire             nibble_sel;          // Nibble select qualifying the upper/lower 
                                      // nibble(MII).

  
  reg    [3:0]     lfsr4_cnt;           // LFSR to track number of preambles, 
                                        // jam patterns and IFG period.
                                        
  reg    [13:0]    byte_cnt;            // Byte counter tracking the number of bytes 
                                        // transmitted.
  reg              def_cnt15;           // Bit set when Byte_cnt overflows during deferral
 
  reg    [13:0]    tx_bytecount;        // Length of frame in bytes. 

  reg  [4:0]     tpe_state;           // Current state of Control FSM
  reg  [4:0]     next_tpe_state;      // Next state of Control FSM.

  reg                  gmii_txen_o;         // GMII/MII transmit data enable
  reg [`TXD_WIDTH-1:0] gmii_txd_o;          // GMII/MII trasnmit data. 
  reg [7:0]            tx_data;             // Combinationally derived transmit data signal.   
                                        // All signals below tied to 0 in full duplex
  wire             gmii_txer_o;       // GMII/MII transmit error. 
  wire             loss_of_carrier;   // loss of carrier during transmission.
  wire             no_carrier;        // No carrier detected during 
                                        // start of transmission.
  wire             deferred;          // Deferred status for current transmit frame. 
  wire             exssdef;           // Excessive deferral.    
  wire             exsscol;           // Excessive collision.
  wire             late_col;          // Late collision.
  wire             retry_req;         // frame retry request to application.
  wire  [3:0]      retry_cnt;         // Number of retries attempted.
  wire             tpe_backoff_strt;  // Back off timer start request to STX.


  reg              from_ss_ifg_cj2;     // Delayed TPE_SEND_STATUS or
                                        // TPE_WIAT_FOR_IFG or TPE_SEND_CARR_JAM2
                                        // state indicator.
  
  reg              tpe_jabber_timeout;  // jabber limit reached. 
  reg              vlan_frame;          // VLAN frame indication for curent frame.
  reg              broadcast_addr;      // Signal qualifying the destination 
                                        // address of frame as broadcast address.
                                        
  reg              multicast_addr;      // Signal qualifying the destination 
                                        // address of the frame as multicast address.
                                        
  wire [31:0]      tpe_txstatus;        // Frame status.
  reg              tpe_txstatus_valid;  // Signal qualifying frame status.   
  
  wire             jabber_limit;        // Signal qualifying jabber limit  
  wire             nibble_sel_inv;      // Inverse of nibble_sel signal 
                                        // (Valid in MII mode only).
                                        
  wire [31:0]      tx_status;           // Combinationally derived transmit status.
  wire             frame_abrtd;         // Frame aborted in TPE.  
  wire [1:0]       addr_type;           // Address type indicator.
  wire             enable_transmit;     // Enable MAC transmitter
  wire             col_det;             // Collision detect for half duplexmode.
  wire             crs_det;             // Carrier sencse for half duplexmode.
  wire             frameburst_en;       // Frameburst enable for half duplexmode.
  wire             vlan_hi_en;          // In MII mode to enable the higher byte check
  wire             tpe_txcarrier_ps;    // tpe_txcarrier in M110 mode
  
// Parameter declarations for states
  
    parameter [4:0]  TPE_IDLE = 5'd0,
                     TPE_SEND_PREAMBLE = 5'd1,
                     TPE_SEND_FRAME = 5'd2,
                     TPE_SEND_LAST_BYTE = 5'd3,
                     TPE_SEND_STATUS = 5'd4;


// Parameter declarations for special data encoding.
    parameter JAM_PATTERN       =  8'h55;
    parameter PREAMBLEONLY      =  8'h55;
    parameter PREAMBLESFD       =  8'hD5;
    parameter CARR_JAM_PATTERN  =  8'h1F;
    parameter CARRIEREXT        =  8'h0F;

//--------------------------------------------------
// signals for Half duplex operation from SYNC block.
//--------------------------------------------------
assign enable_transmit = sct_transmit_e; 

assign col_det = (enable_transmit | tpe_txcarrier) & sct_col & ~sct_duplexmode;
assign crs_det = sct_crs & ~sct_duplexmode;
assign frameburst_en = sct_frameburst_e & ~sct_duplexmode & ~sct_portselect;

  assign col_det_d = `L;


//---------------------------------------------
// Data and control signals from TFC interface.
//--------------------------------------------
  
  assign tpe_gnt = (sct_portselect) ? 
                   (tpe_state[TPE_SEND_PREAMBLE] & (lfsr4_cnt == `LFSR_CNT_8) & nibble_sel & ~tpe_abort_int) :
                   (tpe_state[TPE_SEND_PREAMBLE] & (lfsr4_cnt == `LFSR_CNT_7) & ~tpe_abort_int);
    
  assign tpe_ack = tfc_data_valid & ~nibble_sel;

  assign tpe_abort = tpe_abort_int & ~tpe_state[TPE_SEND_PREAMBLE]; // combinationally generated 
                                                                    // signal to mask the tpe_abort_int
                                                                    // during TPE_SEND_PREAMBLE
  
  // 8-bit frame data from TFC
  always @(`TX_RST_MODE) begin
   if (~rst_clk_tx_n) begin
     tfc_data_r <= {8{`L}};
   end  
   else begin
     if (tfc_data_valid & tpe_ack) 
       tfc_data_r <= tfc_data;
     end  
  end  
 
  // Frame abort from TPE
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tpe_abort_int <= `L;
    end
    else begin
      if (tpe_state[TPE_IDLE] & from_ss_ifg_cj2) begin
        tpe_abort_int <= `L;
      end  
      // jabber function not applicable for 1000 Mbps mode.
      else if ((col_det & ~col_det_d & 
                (tpe_state[TPE_SEND_PREAMBLE] | 

                 tpe_state[TPE_SEND_FRAME])) | 
               (tpe_state[TPE_IDLE] & exssdef) | 
               (tpe_state[TPE_SEND_FRAME] & (no_carrier | jabber_limit | loss_of_carrier))) begin
        tpe_abort_int <= `H;
      end  
    end  
  end

  // End of frame from TFC registered 
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tfc_eof_r <= `L;
    end
    else if (~nibble_sel)
      tfc_eof_r <= tfc_eof & tpe_ack;
  end

      
 
//--------------
// Control Block
//--------------


  assign jabber_limit = (sct_jabber_e) ? 
                             (sct_jumboframe_e ? (byte_cnt[13] & byte_cnt[11])  //10240
			                       : (byte_cnt[11]))                //2048
				        : (&byte_cnt[13:0]);                    //16383
  assign nibble_sel_inv = (sct_portselect) ? ~nibble_sel : `L;

  // Status of the transmitter (transmitting/Not transmitting)
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tpe_txcarrier    <= `L;
    end
    else begin
         if (tpe_state[TPE_SEND_LAST_BYTE] | 
               (tpe_state[TPE_SEND_FRAME] & jabber_limit & ~nibble_sel_inv )) begin 
            tpe_txcarrier <= `L;
          end  
          else if (tpe_state[TPE_SEND_PREAMBLE]) begin
            tpe_txcarrier <= `H;
          end

    end
  end 

// Upper/lower Nibble select for MII
    assign nibble_sel = `L;

  
  assign tpe_txcarrier_ps = sct_portselect ? tpe_txcarrier : `H;
  
  // 4-bit Lfsr to count the number of preamble , jam pattern and
  // carrier extension sent during IFG (of a frame burst).
  // Count Seqence: F,E,D,A,5,B,6,C,9,2,4,8,1,3,7,F,..
  always @(`TX_RST_MODE) begin
    if (!rst_clk_tx_n) begin
      lfsr4_cnt <= `LFSR_CNT_1;
    end
    else begin
      if (tpe_state[TPE_IDLE])
        lfsr4_cnt <= `LFSR_CNT_1;
      else if (tpe_state[TPE_SEND_PREAMBLE] & ~nibble_sel & tpe_txcarrier_ps)
        lfsr4_cnt <= {lfsr4_cnt[2],lfsr4_cnt[1],lfsr4_cnt[0],(lfsr4_cnt[0] ^ lfsr4_cnt[3])};

    end
  end
  
  
  //Byte Counter
  // This counter is used to track the number of bytes transmitted(including carrier extesion),
  // number of jam patterns during back pressure and deference.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
       byte_cnt <= {14{`L}};
       def_cnt15<= `L;
    end
    else begin
      if (tpe_state[TPE_SEND_PREAMBLE]) begin
        byte_cnt <= {14{`L}};
        def_cnt15<= `L;
      end
      else if ((tpe_state[TPE_SEND_FRAME] | tpe_state[TPE_SEND_LAST_BYTE]) & 
	         ~nibble_sel_inv) begin
        byte_cnt <= byte_cnt + 14'h0001;
        def_cnt15<= `L;
      end

    end  
  end      
                      
  // Transmit frame Length is derived from byte_cnt as required.
  always @(`TX_RST_MODE) begin
    if(~rst_clk_tx_n) begin
      tx_bytecount <= {14{`L}};
    end
    else if (tpe_state[TPE_IDLE]) begin
      tx_bytecount <= {14{`L}};
    end  
    else begin
      if (tpe_state[TPE_SEND_LAST_BYTE] | (tpe_state[TPE_SEND_FRAME] & jabber_limit)) begin

        tx_bytecount <= byte_cnt;
      end
    end  
  end  


//------------
// Control FSM
//------------

// Sequential next state assignment.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
        tpe_state <= {{4{`L}},`H};  // FSM reset to TPE_IDLE

    end
    else
      tpe_state <= next_tpe_state;
    end  

// Combinational logic deriving the next state.
  always @(*)
    begin
    
      next_tpe_state = 5'b00000;

// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off
    case(1'b1)  // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
    tpe_state[TPE_IDLE]: // Idle.Wait for IFG during full duplex and non frame bursting mode.
      begin
            if (enable_transmit & stx_xmitok & tfc_req) begin 

          next_tpe_state[TPE_SEND_PREAMBLE] = `H;
        end
        else
          next_tpe_state[TPE_IDLE] = `H; 
    end // TPE_IDLE 
    

    tpe_state[TPE_SEND_PREAMBLE]: // Send preamble and SFD.
      begin
          if ((lfsr4_cnt == `LFSR_CNT_8) & ~nibble_sel) begin
            next_tpe_state[TPE_SEND_FRAME] = `H;
          end

          else 
            next_tpe_state[TPE_SEND_PREAMBLE] = `H;
      end // TPE_SEND_PREAMBLE

    tpe_state[TPE_SEND_FRAME]: // Send Frame data from application   
      begin
          if (jabber_limit & ~nibble_sel_inv) begin  
            next_tpe_state[TPE_SEND_STATUS] = `H;
          end
          else if (tfc_eof_r & ~nibble_sel) begin
            next_tpe_state[TPE_SEND_LAST_BYTE] = `H;
          end

          else
            next_tpe_state[TPE_SEND_FRAME] = `H;
      end // TPE_SEND_FRAME
    
    
    tpe_state[TPE_SEND_LAST_BYTE]:  // Last byte of frame data or last byte of extension is sent.
      begin
        next_tpe_state[TPE_SEND_STATUS] = `H;
      end  // TPE_SEND_LAST_BYTE 

          
    tpe_state[TPE_SEND_STATUS]:   // Aggregate Transmit frame status for to TFC block 
      begin
        if (tpe_txstatus_valid) begin
          next_tpe_state[TPE_IDLE] = `H;
        end
        else
          next_tpe_state[TPE_SEND_STATUS] = `H;

      end // TPE_SEND_STATUS

    endcase
// leda W225 on    
  end // always block ends
    

//--------------------
// GMII Tranmit enable
//--------------------
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      gmii_txen_o <= `L;
    end
    else if (tpe_state[TPE_SEND_LAST_BYTE] |
             (tpe_state[TPE_SEND_FRAME] & jabber_limit & ~nibble_sel_inv )) begin
      gmii_txen_o <= `L;                                       
    end
    else if (tpe_state[TPE_SEND_PREAMBLE]) begin
      gmii_txen_o <= `H;
    end

  end   
  
//--------------------
// GMII Transmit Error
//--------------------
  
  assign gmii_txer_o = `L;


//---------------------
// GMII Transmit Data
//---------------------

//combinational data mux
  always @(*)
    begin
      tx_data = 8'h00;
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W225 W226 W455 off 
    case (1'b1)  // synopsys full_case parallel_case
// leda C_4C_R_B C_5C_R DFT_022 FM_2_12 W226 W455 on    
    tpe_state[TPE_IDLE]:
    begin
        tx_data = 8'h00;
    end

    tpe_state[TPE_SEND_PREAMBLE]:
    begin 
      if (lfsr4_cnt != `LFSR_CNT_8)
        tx_data = PREAMBLEONLY;
      else if (lfsr4_cnt == `LFSR_CNT_8) 
        tx_data = PREAMBLESFD; 
      end 
 
    
    tpe_state[TPE_SEND_FRAME]:
    begin
      if (loss_of_carrier)
        tx_data = ~tfc_data_r;
      else if (~(no_carrier | jabber_limit) | ~nibble_sel)
        tx_data = tfc_data_r;
      else  
        tx_data = 8'h00;
    end
    
    tpe_state[TPE_SEND_LAST_BYTE],tpe_state[TPE_SEND_STATUS]:
    begin 
      tx_data = 8'h00;
    end

  endcase
// leda W225 on  
end

// Registered MII/GMII data signals
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
        gmii_txd_o <= {8{`L}};

    end
    else begin
      gmii_txd_o <= tx_data;

    end  
  end


//------------------------
// Status Generation Logic
//------------------------
       

  // Delayed TPE_SEND_STATUS , TPE_WAIT_FOR_IFG, TPE_SEND_CARR_JAM2, TPE_BACKPRESSURE state
  // signal.
    always @(`TX_RST_MODE) begin
      if (~rst_clk_tx_n) begin
        from_ss_ifg_cj2 <= `L;
      end
      else 
        from_ss_ifg_cj2 <= tpe_state[TPE_SEND_STATUS];

    end
  
    assign loss_of_carrier = `L;
    assign no_carrier = `L; 
    assign deferred = `L;
    assign exssdef = `L;
    assign late_col = `L;
    assign exsscol = `L;
    assign retry_req = `L;
    assign retry_cnt = {4{`L}};
    assign tpe_backoff_strt = `L;

    

 
    

  // jabber timeout for MII mode
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tpe_jabber_timeout <= `L;
    end              
    else begin       
      if (tpe_state[TPE_IDLE]) begin
        tpe_jabber_timeout <= `L;
      end            
      else if (tpe_state[TPE_SEND_FRAME] & ~next_tpe_state[TPE_SEND_LAST_BYTE] & 
               ~col_det & jabber_limit) begin
        tpe_jabber_timeout <= `H;
      end
    end
  end 
  
  // Enable for vlan high-byte check in MII mode
  assign vlan_hi_en = sct_portselect ? nibble_sel : `H;

  // vlan frame transmitted.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      vlan_frame <= `L;
    end
    else begin
      if (tpe_state[TPE_IDLE])
        vlan_frame <= `L;
      else if (byte_cnt == 14'hC) begin
        vlan_frame <= (tfc_data_r == 8'h81);
      end
      else if ((byte_cnt == 14'hD) & vlan_frame & vlan_hi_en) begin
        vlan_frame <= (tfc_data_r == 8'h00);
      end
    end
  end

  // packet transmitted with broadcast address.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      broadcast_addr <= `L;
    end
    else begin
      if (tpe_state[TPE_IDLE])
        broadcast_addr <= `L;
      else if (~(|byte_cnt) & tpe_state[TPE_SEND_FRAME] & tfc_data_valid) begin
        broadcast_addr <= (tfc_data_r == 8'hFF);
      end
      else if ((byte_cnt < 14'h6) & tpe_state[TPE_SEND_FRAME] & broadcast_addr & tfc_data_valid) begin
        broadcast_addr <= (tfc_data_r == 8'hFF);
      end
    end
  end  

  
  // packet transmitted with multicast address.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      multicast_addr <= `L;
    end
    else begin
      if (tpe_state[TPE_IDLE])
        multicast_addr <= `L;
      else if (~(|byte_cnt) & tpe_state[TPE_SEND_FRAME] & tfc_data_valid) begin
        multicast_addr <= tfc_data_r[0];
      end
    end
  end  
  
  // Aggregation of status bits
  assign frame_abrtd = (tpe_jabber_timeout | no_carrier | loss_of_carrier | exssdef | late_col | 
                       exsscol); 
  
  
  assign addr_type = (broadcast_addr & (byte_cnt >= 14'h0006)) ? 2'b11 : 
                     (multicast_addr) ? 2'b01 : 2'b00;
  
  assign tx_status = {retry_req, 
                      1'b0, 
                      vlan_frame, 
                      addr_type, 
                      tx_bytecount,
                      retry_cnt, 
                      deferred,
                      1'b0, 
                      exsscol, 
                      late_col, 
                      exssdef, 
                      loss_of_carrier, 
                      no_carrier, 
                      tpe_jabber_timeout, 
                      frame_abrtd};

  

  // Frame status pushed to TFC.
  assign tpe_txstatus = tx_status;
  assign tpe_fsm_sts = !tpe_state[TPE_IDLE];

  // Status valid to TFC.
  always @(`TX_RST_MODE) begin
    if (~rst_clk_tx_n) begin
      tpe_txstatus_valid <= `L;
    end
    else begin
      if (tpe_txstatus_valid) begin
        tpe_txstatus_valid <= `L;
      end
      else if (tpe_state[TPE_SEND_STATUS]) begin
        tpe_txstatus_valid <= `H;
      end
    end  
  end  

 
  


endmodule 
