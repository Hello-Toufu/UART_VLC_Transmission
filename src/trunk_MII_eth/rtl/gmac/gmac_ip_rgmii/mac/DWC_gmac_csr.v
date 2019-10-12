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
// Date             :        $Date: 2008/08/13 $
// File Version     :        $Revision: #64 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// MAC Control and Status Register block(DWC_gmac_csr.v)
//
// DESCRIPTION:
// This block contains the entire set of GMAC configuration registers
// These registers are provided to configure the GMAC and also to get the
// status of events triggered by the application.
//--------------------------------------------------------------------------

module DWC_gmac_csr (
        
        // Clock and reset
        clk_csr_i,
                     rst_clk_csr_n,
                     // MAC Control Interface(MCI)
                     mci_val_i,
                     mci_addr_i,
                     mci_rdwrn_i,
                     mci_wdata_i,
                     mci_be_i,
                     mci_ack_o,
                     mci_rdata_o,
                     mci_intr_o,
                     dcr_data,
                     sca_mtl_dbg_sts,
                     sca_mac_dbg_sts,
                     phy_select,
                     cr_smacmdvld,
                     cr_smaregaddr,
                     cr_smaphyaddr,
                     cr_smadata,
                     cr_appclkrange,
                     cr_rd_wrn,
                     sma_transdone_n,
                     sma_data,
                     phy_intf_sts,
                     // Config Register signals
                     cr_reg0,
                     cr_reg0_byte0_wr,
                     cr_reg0_byte1_wr,
                     cr_reg0_byte2_wr,
                     // Frame Filter Register signals
                     cr_reg1,
                     cr_reg1_byte0_wr,
                     cr_reg1_byte1_wr,
                     // Hash Table Register signals
                     cr_reg2,
                     cr_reg3,
                     // Flow control Register signals
                     cr_reg6,
                     cr_reg6_byte0_wr,
                     cr_pausetime,
                     sca_txctrl_done,
                     // MAC Addr0 Register signals
                     cr_macaddr0,
                     cr_vlantag
                     );        

// Input and Output Port declarations.

  // Clock and reset
  input            clk_csr_i;              // Application Clock. 
  input            rst_clk_csr_n;          // Active low reset synchronous to clk_csr_i. 

  // MAC Control Interface(MCI)
  input            mci_val_i;              // signal to validate the address, Read/write and 
                                           // data of CSR access.
  input  [13:0]    mci_addr_i;             // signal indicating the CSR address.
  input            mci_rdwrn_i;            // signal indication Read/Write(active low) of CSR
                                           // access.
  input  [31:0]    mci_wdata_i;            // Write data for CSR access.
  input  [3:0]     mci_be_i;               // Byte enables for CSR access. 
  output           mci_ack_o;              // Acknowledgement from CSR for all data transfers.
  output [31:0]    mci_rdata_o;            // Read data from CSR to the application.
  output           mci_intr_o;             // ORing of interrupts from MMC ,PCS and interrupts
  input  [31:0]    dcr_data;               // 32-bit DMA CSR read data.
  
  input  [9:0]     sca_mtl_dbg_sts;        // Debug status from MTL
  input  [6:0]     sca_mac_dbg_sts;        // Debug status from MAC


                                             // passing address filter as wakeup frame.

    
  // RGMII/PCS/SMII Interrupt and phy select
    input  [2:0]     phy_select;           // PHY select input
  
    output           cr_smacmdvld;         // command valid to PHY register access.
    output [4:0]     cr_smaregaddr;        // 5-bit PHY Register address. 
    output [4:0]     cr_smaphyaddr;        // 5-bit PHY ID.
    output [15:0]    cr_smadata;           // PHY reg write data.
    output [3:0]     cr_appclkrange;       // Encoded application clock range 
                                           // determining the clock
                                           // frequency for PHY register access.
                                           
    output           cr_rd_wrn;            // Read/write signal to PHY registers.
    input            sma_transdone_n;      // PHY register access completed.
    input  [15:0]    sma_data;             // Read data from PHY register.
 
                                           
    input  [5:0]     phy_intf_sts;         // Link status,speed and mode status
                                             // from RGMII or SGMII or SMII.
  
  // Config Register 
  output [26:2]     cr_reg0;               // Config reg signals. 
  output            cr_reg0_byte0_wr;      // MAC Config reg byte0 write pulse.
  output            cr_reg0_byte1_wr;      // MAC Config reg byte1 write pulse.
  output            cr_reg0_byte2_wr;      // MAC Config reg byte2 write pulse.
  
  // Source/Destination Address Frame Filter Register
  output [11:0]     cr_reg1;               // Frame Filter Register signals.
  output            cr_reg1_byte0_wr;      // Frame Filter reg byte0 write pulse.
  output            cr_reg1_byte1_wr;      // Frame Filter reg byte1 write pulse.

  // Hash Table Register signals
  output [31:0]     cr_reg2;               // Hash Table High register signals.
  output [31:0]     cr_reg3;               // Hash table Low register signals.
  // Flowcontrol Register
  output [15:0]     cr_reg6;               // Flow control register signals. 
  output            cr_reg6_byte0_wr;      // Flow control reg byte0 write pulse.

  output [15:0]     cr_pausetime;          // pause time value in pause frame.
  input             sca_txctrl_done;       // transmit control frame done.

  // VLAN Tag Register
  output [16:0]     cr_vlantag;            // VLAN Tag .
  // MAC Addr0 Register
  output [47:0]     cr_macaddr0;           // 1st MAC address of GMAC.
  // Additional MAC Address Registers

// wire declarations for outputs
  wire            mci_ack_o;             // Acknowledgement from CSR for all data transfers.
  wire            mci_intr_o;            // ORing of interrupts from MMC ,PCS and interrupts
  
  wire [26:2]     cr_reg0;               // Configuration register signals. 
  
  wire [11:0]     cr_reg1;               // Frame Filter Register signals.

  wire [31:0]     cr_reg2;               // Hash Table High register signals.
  wire [31:0]     cr_reg3;               // Hash table Low register signals.

  wire [15:0]     cr_reg6;               // Flow control register signals. 
  wire [15:0]     cr_pausetime;          // pause time value sent with pause frame.

  wire [16:0]     cr_vlantag;            // VLAN Tag .
  wire [47:0]     cr_macaddr0;           // 1st MAC address of GMAC.

    wire           cr_smacmdvld;         // command valid to PHY register access.
    wire [4:0]     cr_smaregaddr;        // 5-bit PHY Register address. 
    wire [4:0]     cr_smaphyaddr;        // 5-bit PHY ID.
    wire [15:0]    cr_smadata;           // PHY register write data in write operation.
    wire [3:0]     cr_appclkrange;       // Encoded application clock range 
                                         // determining the clock
                                         // frequency for PHY register access.
                                           
    wire           cr_rd_wrn;            // Read/write signal to PHY registers.




 
  reg  [5:0]       mci_addr_r;             // registered mci_addr_i [7:2] 
  reg  [26:2]      config_reg;             // MAC Configuration register bits.   
  reg  [31:0]      filter_reg;             // MAC Frame filter register bits.  
  wire [31:0]      filter_reg_rdata;       // MAC Frame filter register bits.  
  reg  [31:0]      hash_table_hreg;        // Hash Table high register bits.  
  reg  [31:0]      hash_table_lreg;        // Hash Table low register bits. 
  reg  [15:1]      gmii_addr_reg;          // GMII Address Register bits.
  reg              busy_bit;               // GMII address reg bit 0
  reg  [15:0]      gmii_data_reg;          // GMII Data Regieter bits.
  reg  [31:1]      flow_ctrl_reg;          // Flow control register bits.
  reg              flow_ctrl;              // Flow control register bits.
  reg  [16:0]      vlan_tag_reg;           // VLAN Tag register bits.
  reg  [15:0]      mac_addr0_hreg;         // MAC Address0 High register bits.
  reg  [31:0]      mac_addr0_lreg;         // MAC Address0 Low register bits.                   
  
    wire             ts_addr_sel;         // PTP address decoding


  wire             intf_intr;            // PCS/RGMII/SMII Interrupt to application.
  wire             port_select;
  wire             speed_reg; //High if 100Mbps
  wire             link_up; //High if link is up
  wire             cr_tx_config;       // Control bit governing the
                                       // transmission of duplex mode,speed
                                       // link up/down to PHY in RGMII/SGMII
  wire             ip_chksum;
  wire             duplexmode;
  wire             disretry;
  wire [1:0]       backoff_lmt;
  wire             deferral_chk;
  wire             disreceiveown;
  wire             frameburst_e;
  wire             no_crs;

  wire             flow_bkp;               // Flow control backpressure 
                                           // activation.
  wire             mac_csr_sel;            // select signal for GMAC CSR.
  wire             mac_addr_sel;           // select signal for Extra GMAC Addr Registers.
  wire             mmc_csr_sel;            // select signal for MMC CSR.
  wire             dma_csr_sel;            // select signal for DMA CSR.
  wire             reg_wr;                 // register write operation to GMAC CSR. 
  wire             reg_rd;                 // register read operation to GMAC CSR. 
  wire [26:2]      config_reg_rdata;       // GMAC configuration register0 read data.

  reg  [63:0]      reg_sel;                // register select signal.
  reg              rsvd_reg_sel;           // reserved register select signal. 
  reg  [31:0]      rdata;                  // Muxed read data from GMAC CSR registers. 
  reg  [31:0]      mci_rdata_o;            // Read data Output of MAC control interface.

  reg              mci_ack;                // Acknowledgment for the read/write through 
                                           // MAC control Interface.

  reg              mci_ack_int;            // Internal Ack for the read/write 
                                           // used when AHB Slave is not present

  reg          phy_intf_sts_intr_msk; // Mask for RGMII/SMII link status
                                   // interrupt
                                   
  reg          phy_intf_link_status;  // RGMII/SMII Link status interrupt
  reg          phy_intf_intr;         // RGMII/SMII Link status change interrupt


  
  // Generation of register selects based on the address decoding
    assign mac_csr_sel = (mci_addr_i[13:8] == `GMAC_ADDR_13_8); 
    assign mac_addr_sel = `L;

    assign mmc_csr_sel = (mci_addr_i[13:8] == `MMC_ADDR_13_8 | mci_addr_i[13:8] == `MMC_IPC_ADDR_13_8);
    assign dma_csr_sel = (mci_addr_i[13:8] == `DMA_ADDR_13_8);
   
    assign reg_wr = mci_val_i & mac_csr_sel & ~mci_rdwrn_i;
    assign reg_rd = mci_val_i & mac_csr_sel & mci_rdwrn_i;

    
  always @(`CSR_RST_MODE) begin
    if (!rst_clk_csr_n) begin
      mci_addr_r <= 6'b00_0000;
    end
    else if (mac_csr_sel | mac_addr_sel | ts_addr_sel) begin
      mci_addr_r <= mci_addr_i[7:2];
    end
  end
 
    // generation of acknowledgement for register reads and writes.
    assign mci_ack_o = mci_ack;
    
    always @(`CSR_RST_MODE) begin
      if (~rst_clk_csr_n) begin
        mci_ack <= `L;
          mci_ack_int <= `L;
      end
      else begin
          if (mci_rdwrn_i) begin
            if (mci_val_i & (mac_csr_sel | mac_addr_sel | dma_csr_sel | mmc_csr_sel | ts_addr_sel)) begin
              if (~mci_ack) begin
               mci_ack_int <= ~mci_ack_int;
              end
              mci_ack <= mci_ack_int;
            end  
            else if (mci_val_i & (mci_addr_i[13] == `L)) begin
              mci_ack_int <= `L;
              mci_ack <= ~mci_ack;
            end  
          end  
          else begin
            if (mci_val_i & (mac_csr_sel | mac_addr_sel | dma_csr_sel | mmc_csr_sel | ts_addr_sel |
                             (mci_addr_i[13] == `L))) begin
              mci_ack_int <= `L;
              mci_ack <= ~mci_ack;
            end
          end  
      end
    end

      // Registered CSR read data.
      always @(`CSR_RST_MODE) begin
        if (~rst_clk_csr_n) begin
           mci_rdata_o <= {32{`L}};
        end
        else begin
          if (mci_val_i) begin
            if (mac_csr_sel & mci_rdwrn_i) 
              mci_rdata_o <= rdata;
            else if (dma_csr_sel & mci_rdwrn_i)
              mci_rdata_o <= dcr_data;
            else if (mci_addr_i[13] == `L)
              mci_rdata_o <= 32'h00000000;
          end
        end
      end
    

  
    // Address decoding and read data muxing logic.   
    always @*
      begin
        reg_sel = {64{`L}};
        rsvd_reg_sel = 1'b0;
        rdata = {32{`L}};

        case (mci_addr_r)  


          6'b00_0000: begin
                        reg_sel[0] = 1'b1;
                        rdata = {{5{`L}}, config_reg_rdata, {2{`L}}};
                      end  
          6'b00_0001: begin
                        reg_sel[1] = 1'b1;
                        rdata = filter_reg_rdata;
                      end  
          6'b00_0010: begin  
                        reg_sel[2] = 1'b1;
                        rdata = hash_table_hreg;
                      end  
          6'b00_0011: begin
                        reg_sel[3] = 1'b1;
                        rdata = hash_table_lreg;
                      end
          6'b00_0100: begin
                        reg_sel[4] = 1'b1;
                        rdata = {{16{`L}}, gmii_addr_reg[15:1], busy_bit};
                      end  
          6'b00_0101: begin
                        reg_sel[5] = 1'b1;
                        rdata = {{16{`L}}, gmii_data_reg};
                      end  
          6'b00_0110: begin
                        reg_sel[6] = 1'b1;
                        rdata = {flow_ctrl_reg[31:16], {8{`L}}, flow_ctrl_reg[7],
                                 `L, flow_ctrl_reg[5:1], flow_bkp};
                      end  
          6'b00_0111: begin
                        reg_sel[7] = 1'b1;
                        rdata = {{15{`L}}, vlan_tag_reg};
                      end  
          6'b00_1000: begin
                        rdata = {{16{`L}}, `USER_VER, `SNPS_VER};
                      end  		      
          6'b00_1001: begin
                        rdata = {{6{`L}}, 
                                  sca_mtl_dbg_sts[9], // MTL Status Fifo Full
                                  sca_mtl_dbg_sts[6], // MTL TxFifo Not Empty
                                  `L,sca_mtl_dbg_sts[5], //MTL TWC FSM
                                  sca_mtl_dbg_sts[8:7],  //MTL TRC FSM
                                  sca_mac_dbg_sts[6:3], //Tx in Pause, MAC TFC FSM & TPE FSM
                                 {6{`L}}, 
                                  sca_mtl_dbg_sts[4:3], // MTL RxFifo status
                                  `L,sca_mtl_dbg_sts[2:0], //MTL RRC FSM & RWC FSM
                                  `L,sca_mac_dbg_sts[2:0]};//MAC RFC FSM, RPE FSM
                      end  		      
          6'b00_1110: begin // 
                        reg_sel[14] = 1'b1;
                        rdata = {{22{`L}},
                                 `L,
                                 {5{`L}},
                                 `L,
                                 {2{`L}},
                                 phy_intf_intr};
                      end
          6'b00_1111: begin // 
                        reg_sel[15] = 1'b1;
                        rdata = {{22{`L}},
                                 {6{`L}}, 
                                 `L,
                                 {2{`L}},
                                 phy_intf_sts_intr_msk};
                      end
          6'b01_0000: begin
                        reg_sel[16] = 1'b1;
                        rdata = {`H, {15{`L}}, mac_addr0_hreg};
                      end  
          6'b01_0001: begin
                        reg_sel[17] = 1'b1;
                        rdata = mac_addr0_lreg;
                      end  
            6'b11_0110: begin // 
                            reg_sel[54] = 1'b1;
                            rdata = {{26{`L}}, phy_intf_sts};
                          end
          default: begin
                      rsvd_reg_sel = 1'b1;
                      rdata = {32{`L}};
                   end          
        endcase
      end  

      assign ts_addr_sel = `L;
  // MAC Configuration register
   assign cr_reg0 = config_reg_rdata;

   assign port_select = `L;

   
    assign ip_chksum = `L;

   
    assign frameburst_e = `L;
    assign duplexmode = `H;
    assign disretry = `L;
    assign backoff_lmt = {2{`L}};
    assign deferral_chk = `L;
    assign disreceiveown= `L;

    assign cr_tx_config = config_reg[24];
    assign link_up = config_reg[8];

    assign speed_reg = config_reg[14];

  

    assign no_crs = `L;

   
  assign config_reg_rdata = {config_reg[26],config_reg[25],cr_tx_config, config_reg[23:22], frameburst_e, 
                            config_reg[20:17], no_crs,
                            port_select, speed_reg, disreceiveown, config_reg[12], duplexmode, 
                            ip_chksum, disretry, link_up, config_reg[7], backoff_lmt, 
                            deferral_chk, config_reg[3:2]};   
    
  // Register write pulses based on the byte enables
    assign cr_reg0_byte0_wr = reg_wr & reg_sel[0] & mci_ack & mci_be_i[0];
    assign cr_reg0_byte1_wr = reg_wr & reg_sel[0] & mci_ack & mci_be_i[1];
    assign cr_reg0_byte2_wr = reg_wr & reg_sel[0] & mci_ack & mci_be_i[2];
  
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
        //20170706-twu: default rx and tx enable
      //config_reg[26:2] <= {25{`L}};
      config_reg[26:2] <= {{23{`L}}, 2'b11};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[0]) begin
        config_reg[26]    <= `L;

        config_reg[25]    <= (mci_be_i[3]) ? mci_wdata_i[25] : config_reg[25];
        config_reg[23:22] <= (mci_be_i[2]) ? mci_wdata_i[23:22] : config_reg[23:22];
        config_reg[20:17] <= (mci_be_i[2]) ? mci_wdata_i[20:17] : config_reg[20:17];
        config_reg[12]    <= (mci_be_i[1]) ? mci_wdata_i[12] : config_reg[12];
        config_reg[10] <= `L;

        config_reg[7] <= (mci_be_i[0]) ? mci_wdata_i[7] : config_reg[7];
        config_reg[15]  <= `L;

        config_reg[24] <= (mci_be_i[3]) ? mci_wdata_i[24] : config_reg[24];
        config_reg[14] <= (mci_be_i[1]) ? mci_wdata_i[14] : config_reg[14];
        config_reg[8]  <= (mci_be_i[1]) ? mci_wdata_i[8] : config_reg[8];
        config_reg[21]  <= `L;

        config_reg[16]  <= `L;
        config_reg[13]  <= `L;
        config_reg[11]  <= `L;
        config_reg[9]  <= `L;
        config_reg[6:4]  <= {3{`L}};

        config_reg[3:2]   <= (mci_be_i[0]) ? mci_wdata_i[3:2] : config_reg[3:2];
      end
    end  
  end

// MAC frame filter register
  assign cr_reg1 = {filter_reg_rdata[31],filter_reg_rdata[10:0]};

  assign filter_reg_rdata = {filter_reg[31],{20{`L}},filter_reg[10:0]};


  // Register write pulses based on the byte enables
  assign cr_reg1_byte0_wr = reg_wr & reg_sel[1] & mci_ack & mci_be_i[0];
  assign cr_reg1_byte1_wr = reg_wr & reg_sel[1] & mci_ack & mci_be_i[1];
  
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
        //20170714-twu: set Receive All to '1', set Promiscuous Mode to '1'
      filter_reg[31:0] <= {1'b1, {30{`L}}, 1'b1};
      //filter_reg[31:0] <= {32{`L}};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[1]) begin
        filter_reg[31]    <= (mci_be_i[3]) ? mci_wdata_i[31] : filter_reg[31];
        filter_reg[30:11] <= {20{`L}}; 
        filter_reg[10:8] <= (mci_be_i[1]) ? mci_wdata_i[10:8] : filter_reg[10:8];
        filter_reg[7:0] <= (mci_be_i[0]) ? mci_wdata_i[7:0] : filter_reg[7:0];
      end
    end
  end  

    
// Hash Table high register
  assign cr_reg2 = hash_table_hreg;

  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      hash_table_hreg <= {32{`L}};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[2]) begin
        hash_table_hreg[31:24]  <= (mci_be_i[3]) ? mci_wdata_i[31:24] : hash_table_hreg[31:24];
        hash_table_hreg[23:16]  <= (mci_be_i[2]) ? mci_wdata_i[23:16] : hash_table_hreg[23:16];
        hash_table_hreg[15:8]   <= (mci_be_i[1]) ? mci_wdata_i[15:8] : hash_table_hreg[15:8];
        hash_table_hreg[7:0]    <= (mci_be_i[0]) ? mci_wdata_i[7:0] : hash_table_hreg[7:0];
      end
    end
  end  

// Hash Table low register
  assign cr_reg3 = hash_table_lreg;
  
// Register write pulse for 64-bit Hash table
  
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      hash_table_lreg <= {32{`L}};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[3]) begin
        hash_table_lreg[31:24]  <= (mci_be_i[3]) ? mci_wdata_i[31:24] : hash_table_lreg[31:24];
        hash_table_lreg[23:16]  <= (mci_be_i[2]) ? mci_wdata_i[23:16] : hash_table_lreg[23:16];
        hash_table_lreg[15:8]   <= (mci_be_i[1]) ? mci_wdata_i[15:8] : hash_table_lreg[15:8];
        hash_table_lreg[7:0]    <= (mci_be_i[0]) ? mci_wdata_i[7:0] : hash_table_lreg[7:0];
      end
    end
  end

    // GMII Address register
      assign cr_smacmdvld = busy_bit;
      assign cr_smaphyaddr = gmii_addr_reg[15:11];
      assign cr_smaregaddr = gmii_addr_reg[10:6];
      assign cr_appclkrange = gmii_addr_reg[5:2];
      assign cr_rd_wrn = ~gmii_addr_reg[1];
      assign cr_smadata = gmii_data_reg;
    
      always @(`CSR_RST_MODE) begin
        if (~rst_clk_csr_n) begin
          gmii_addr_reg[15:1] <= {15{`L}};
        end
        else begin
          if (~busy_bit & reg_wr & mci_ack & reg_sel[4]) begin
            gmii_addr_reg[15:8]  <= (mci_be_i[1]) ? mci_wdata_i[15:8] : gmii_addr_reg[15:8];
            gmii_addr_reg[7:1]   <= (mci_be_i[0]) ? mci_wdata_i[7:1] : gmii_addr_reg[7:1];
          end
        end
      end
    
    // GMII busy register(GMII address register bit 0)
    // GMII address register should not be written when GMII busy bit is asserted. 
      always @(`CSR_RST_MODE) begin
        if (~rst_clk_csr_n) begin
          busy_bit <= `L;
        end
        else begin
          if (~sma_transdone_n) 
            busy_bit <= `L;
          else if (~busy_bit & reg_wr & mci_ack & reg_sel[4])
            busy_bit <= (mci_be_i[0]) ? mci_wdata_i[0] : busy_bit;
        end
      end  
          
    // GMII data register  
      always @(`CSR_RST_MODE) begin
        if (~rst_clk_csr_n) begin
          gmii_data_reg[15:0] <= {16{`L}};
        end
        else begin
          if (busy_bit & ~gmii_addr_reg[1] & ~sma_transdone_n) 
            gmii_data_reg <= sma_data;
          else if (~busy_bit & reg_wr & mci_ack & reg_sel[5]) begin
            gmii_data_reg[15:8]  <= (mci_be_i[1]) ? mci_wdata_i[15:8] : gmii_data_reg[15:8];
            gmii_data_reg[7:0]  <= (mci_be_i[0]) ? mci_wdata_i[7:0] : gmii_data_reg[7:0];
          end
        end
      end

// flow control register.
  assign cr_reg6 = {{8{`L}},flow_ctrl_reg[7],`L,flow_ctrl_reg[5:1],flow_bkp};
  assign cr_pausetime = flow_ctrl_reg[31:16];
  
  // Register write pulses based on the byte enables
  assign cr_reg6_byte0_wr = reg_wr & reg_sel[6] & mci_ack & mci_be_i[0];

  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      flow_ctrl_reg[31:1] <= {31{`L}};
    end
    else begin
      if (~flow_ctrl & reg_wr & mci_ack & reg_sel[6]) begin
        flow_ctrl_reg[31:24] <= (mci_be_i[3]) ? mci_wdata_i[31:24] : flow_ctrl_reg[31:24];
        flow_ctrl_reg[23:16] <= (mci_be_i[2]) ? mci_wdata_i[23:16] : flow_ctrl_reg[23:16];
        flow_ctrl_reg[15:8] <= {8{`L}};
        flow_ctrl_reg[7] <= (mci_be_i[0]) ? mci_wdata_i[7] : flow_ctrl_reg[7];
        flow_ctrl_reg[6] <= `L;
        flow_ctrl_reg[5:1] <= (mci_be_i[0]) ? mci_wdata_i[5:1] : flow_ctrl_reg[5:1];
      end
    end
  end  

  assign flow_bkp = flow_ctrl;

// Flow control busy bit(flow control register bit 0)
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      flow_ctrl <= `L;
    end
    else begin
      if ((duplexmode & sca_txctrl_done) | ~duplexmode) 
        flow_ctrl <= `L;
      else if (duplexmode & ~flow_ctrl & reg_wr & mci_ack & reg_sel[6])
        flow_ctrl <= (mci_be_i[0]) ? mci_wdata_i[0] : flow_ctrl;
    end
  end
 
// VLAN Tag register
  assign cr_vlantag = vlan_tag_reg[16:0];
  // Register write pulse
  
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      vlan_tag_reg <= {17{`L}};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[7]) begin
        vlan_tag_reg[16]   <= (mci_be_i[2]) ? mci_wdata_i[16]  : vlan_tag_reg[16];
        vlan_tag_reg[15:8] <= (mci_be_i[1]) ? mci_wdata_i[15:8] : vlan_tag_reg[15:8];
        vlan_tag_reg[7:0]  <= (mci_be_i[0]) ? mci_wdata_i[7:0] : vlan_tag_reg[7:0];
      end
    end
  end
    

    
    



//-------------
// MAC Address0
//-------------
  
  assign cr_macaddr0 = {mac_addr0_hreg, mac_addr0_lreg};

// MAC Address0 high register
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      mac_addr0_hreg[15:0] <= {16{`H}};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[16]) begin
        mac_addr0_hreg[15:8] <= (mci_be_i[1]) ? mci_wdata_i[15:8] : mac_addr0_hreg[15:8];
        mac_addr0_hreg[7:0] <= (mci_be_i[0]) ? mci_wdata_i[7:0] : mac_addr0_hreg[7:0];
      end
    end
  end
  
  // Registering write pulse of MAC Address0 low register

// MAC Address0 low register
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      mac_addr0_lreg <= {32{`H}};
    end
    else begin
      if (reg_wr & mci_ack & reg_sel[17]) begin
        mac_addr0_lreg[31:24] <= (mci_be_i[3]) ? mci_wdata_i[31:24] : mac_addr0_lreg[31:24];
        mac_addr0_lreg[23:16] <= (mci_be_i[2]) ? mci_wdata_i[23:16] : mac_addr0_lreg[23:16];
        mac_addr0_lreg[15:8] <= (mci_be_i[1]) ? mci_wdata_i[15:8] : mac_addr0_lreg[15:8];
        mac_addr0_lreg[7:0] <= (mci_be_i[0]) ? mci_wdata_i[7:0] : mac_addr0_lreg[7:0];
      end
    end
  end  

    
      






































// Synchronous FIFO to store Auxiliary snapshot values


  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n) begin
      phy_intf_sts_intr_msk <= `L;
    end
    else if (reg_wr & mci_ack & reg_sel[15]) begin
      phy_intf_sts_intr_msk <= (mci_be_i[0]) ? mci_wdata_i[0] : phy_intf_sts_intr_msk;
    end
  end
      


// RGMII/SMII Link status
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n)
      phy_intf_link_status <= `L;
    else if (phy_select == 3'b001 | phy_select == 3'b110) 
      phy_intf_link_status <= phy_intf_sts[3];  
  end    

// Interrupt for change in RGMII/SMII link status
  always @(`CSR_RST_MODE) begin
    if (~rst_clk_csr_n)
      phy_intf_intr <= `L;
    else if (phy_intf_link_status != phy_intf_sts[3] &
             ~phy_intf_intr & (phy_select == 3'b001 | phy_select == 3'b110))
      phy_intf_intr <= `H;
    else if (reg_rd & mci_ack & reg_sel[54] & mci_be_i[0])
      phy_intf_intr <= `L;
  end    

assign intf_intr =  
                   (phy_intf_intr & ~phy_intf_sts_intr_msk) | 
                   `L;  


      
      assign mci_intr_o = 
                          intf_intr |
                          `L;
  
endmodule  

