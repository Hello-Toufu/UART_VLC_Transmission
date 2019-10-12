//------------------------------------------------------------------------
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
//------------------------------------------------------------------------
//
// Release version :  3.50a
// Date             :        $Date: 2008/08/12 $
// File Version     :        $Revision: #86 $
//
//------------------------------------------------------------------------
// CoreTools Parameters defined here

// Constants defined in MAC files and are not configurable
`define L 1'b0
`define H 1'b1
`define STATUS_OK 24'h040040
`define GMAC_ADDR_13_8 6'h00
`define GMAC_EXTRA_ADDR_13_8 6'h08
`define PTP_REG_ADDR_13_8 6'h07 
`define MMC_ADDR_13_8 6'h01
`define MMC_IPC_ADDR_13_8 6'h02
`define DMA_ADDR_13_8 6'h10
`define AHB_GMAC
`define ADDR_BASE_MSB 31
`define ADDR_OFFSET_LSB 0
`define SNPS_VER 8'h35
`define UDP_HDR 8'h11
`define TCP_HDR 8'h06
`define ICMP_IPV4_HDR 8'h01
`define ICMP_IPV6_HDR 8'h3A
`define HOPBYHOP_HDR 8'h00
`define ROUTING_HDR 8'h2B
`define DESTOPTS_HDR 8'h3C
`define IPV4 4'h4
`define IPV6 4'h6

// Constants defined in AHB files and are not configurable
`define SINGLE 3'b000
`define INCR   3'b001
`define WRAP4  3'b010
`define INCR4  3'b011
`define WRAP8  3'b100
`define INCR8  3'b101
`define WRAP16 3'b110
`define INCR16 3'b111

`define IDLE  2'b00
`define BUSY  2'b01
`define NSEQ  2'b10
`define SEQ   2'b11

`define OK    2'b00
`define ERROR 2'b01
`define RETRY 2'b10
`define SPLIT 2'b11

`define DUMMY_TX_STS 16'hA000 // FIFO flush status
`define DUMMY_STS 16'hA002 // FIFO flush and underflow status
`define OVF_STS 32'h00008800 // Overflow and error frame status

`define NANOSEC_CARRY_CONST  32'h3B9A_CA00


// Name:         DW_MODEL_MISSAMPLES
// Default:      0
// Values:       0, 1
// 
// Random delay insertion for Double synchronizers in simulation
// `define DW_MODEL_MISSAMPLES


// Name:         USE_DPRAM_MODEL
// Default:      VERILOG
// Values:       VERILOG (0), CYPRESS (1), ARTISAN (2), VIRAGE (3), FLOWTRHU (4)
// 
// Parameter for internal regressions.
`define USE_DPRAM_MODEL 0


// Name:         USE_DWMM
// Default:      0
// Values:       0, 1
// 
// Parameter for internal regressions.
// `define USE_DWMM


// Name:         CODECOV
// Default:      0
// Values:       0, 1
// 
// Parameter for internal regressions.
// `define CODECOV


// Name:         RCE_SIM
// Default:      0
// Values:       0, 1
// 
// Parameter for internal regressions.
// `define RCE_SIM


// Name:         USE_FOUNDATION
// Default:      0
// Values:       0, 1
// 
// Designware Foundation Library used in Gray-code converter
// `define USE_FOUNDATION


// Name:         QUICK
// Default:      0
// Values:       0, 1
// 
// Use of values for faster simulation in PCS
// `define QUICK

// SELECT IF CORE ONLY OR CORE WITH SUBSYS 


// Name:         GMAC
// Default:      GMAC-AHB
// Values:       GMAC-AHB (0), GMAC-CORE (1), GMAC-MTL (2), GMAC-DMA (3), GMAC-AXI 
//               (4)
// 
// Select the top-level System Interface & configuration
`define GMAC 2


// Name:         GMAC_CORE
// Default:      0
// Values:       0, 1
// 
// Select the CORE without the AHB subsystem
// `define GMAC_CORE


// Name:         GMAC_MTL_SUBSYS
// Default:      1
// Values:       0, 1
// 
// Select the CORE with MTL only subsystem
`define GMAC_MTL_SUBSYS


// Name:         GMAC_AHB_SUBSYS
// Default:      0
// Values:       0, 1
// 
// Select the CORE with the AHB subsystem
// `define GMAC_AHB_SUBSYS


// Name:         GMAC_DMA_SUBSYS
// Default:      0
// Values:       0, 1
// 
// Select the CORE without the AHB/AXI but DMA subsystem
// `define GMAC_DMA_SUBSYS


// Name:         GMAC_AXI_SUBSYS
// Default:      0
// Values:       0, 1
// 
// Select the CORE with the AXI subsystem
// `define GMAC_AXI_SUBSYS


// Name:         TIME_STAMPING
// Default:      0
// Values:       0, 1
// 
// Enable IEEE 1588 Time Stamping in Hardware
// `define TIME_STAMPING


// Name:         EXT_TIME_STAMPING
// Default:      0
// Values:       0, 1
// Enabled:      TIME_STAMPING==1
// 
// Enable IEEE 1588 Time Stamp input through an external port
// `define EXT_TIME_STAMPING


// Name:         COARSE_FINE_CORRECTION
// Default:      Both Options
// Values:       Coarse (0), Fine (1), Both Options (2)
// Enabled:      TIME_STAMPING==1&&EXT_TIME_STAMPING==0
// 
// To choose between Coarse, Fine and Both options for System Time 
// update
`define COARSE_FINE_CORRECTION 2


// Name:         ADV_TIME_STAMPING
// Default:      0
// Values:       0, 1
// Enabled:      0 (value changes dynamically based on a command)
// 
// Enable advanced time stamp features like snooping PTP packets and 
// 1588v2 support
// `define ADV_TIME_STAMPING


// Name:         ADV_TIME_HIGH_WORD
// Default:      0
// Values:       0, 1
// Enabled:      ADV_TIME_STAMPING==1&&!EXT_TIME_STAMPING
// 
// This adds a register to store the most significant 16 bits of the 
// 48-bit seconds time register for IEEE 1588-2008 implementation
// `define ADV_TIME_HIGH_WORD


// Name:         ADV_TIME_AUX_SNAP
// Default:      0
// Values:       0, 1
// Enabled:      ADV_TIME_STAMPING==1
// 
// This adds the capability of storing time-stamps in a FIFO based on 
// an external trigger
// `define ADV_TIME_AUX_SNAP

// ENDIAN NESS PARAMETERS


// Name:         ENDIAN_NESS
// Default:      LITTLE_ENDIAN
// Values:       LITTLE_ENDIAN (0), BIG_ENDIAN (1), BOTH_OPTIONS (2)
// Enabled:      GMAC!=4
// 
// Parameter To set the ENDIANNESS on the System Interface
`define ENDIAN_NESS 0


// Name:         DATA_ENDIAN_NESS_BOTH
// Default:      0
// Values:       0, 1
// 
// Parameter indicating whether additional input to select data 
// endianess is present.
// `define DATA_ENDIAN_NESS_BOTH


// Name:         DATA_ENDIAN_NESS_HI
// Default:      0
// Values:       0, 1
// 
// Parameter indicating whether data endianess is Big.
// `define DATA_ENDIAN_NESS_HI


// Name:         ENDIAN_LO
// Default:      1
// Values:       0, 1
// 
// Parameter to enable the Little Endian Mode
`define ENDIAN_LO


// Name:         ENDIAN_HI
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the Big Endian Mode
// `define ENDIAN_HI


// Name:         AXI_ENDIAN_HI
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the Big Endian Mode (when AXI interface is 
// selected)
// `define AXI_ENDIAN_HI


// Name:         AXI_ENDIAN_LO
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the Little Endian Mode (when AXI interface is 
// selected)
// `define AXI_ENDIAN_LO


// Name:         AHB_ENDIAN_HI
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the Big Endian Mode (when AHB interface is 
// selected)
// `define AHB_ENDIAN_HI


// Name:         AHB_ENDIAN_LO
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the Little Endian Mode (when AHB interface is 
// selected)
// `define AHB_ENDIAN_LO


// Name:         MDC_ENDIAN_HI
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the Big Endian Mode
// `define MDC_ENDIAN_HI


// Name:         MDC_ENDIAN_LO
// Default:      1
// Values:       0, 1
// 
// Parameter to enable the Little Endian Mode
`define MDC_ENDIAN_LO


// Name:         DESC_ENDIAN_NESS
// Default:      SAME_ENDIANNESS
// Values:       SAME_ENDIANNESS (0), REVERSE_ENDIANNESS (1), BOTH_OPTIONS (2)
// Enabled:      GMAC!=1&&GMAC!=2&&GMAC!=4&&ENDIAN_NESS!=2
// 
// Parameter To Select Format of Descriptor Endianness w.r.t. Data 
// Endianness
`define DESC_ENDIAN_NESS 0


// Name:         DESC_ENDIAN_NESS_BOTH
// Default:      0
// Values:       0, 1
// 
// Parameter indicating whether additional input to select desc 
// endianess is present.
// `define DESC_ENDIAN_NESS_BOTH


// Name:         DESC_ENDIAN_NESS_REV
// Default:      0
// Values:       0, 1
// 
// Parameter indicating whether desc endianess is reverse.
// `define DESC_ENDIAN_NESS_REV


// Name:         DESC_ENHANCED_FORMAT
// Default:      0
// Values:       0, 1
// Enabled:      GMAC != 1&&GMAC != 2&&!ADV_TIME_STAMPING
// 
// Implements enhanced descriptor format that can support buffer of 
// size upto 8K. This new descriptor format is not backward compatible.
// `define DESC_ENHANCED_FORMAT

// AXI Specific parameters


// Name:         AXI_BL
// Default:      16
// Values:       16 32 64 128 256
// Enabled:      GMAC == 4
// 
// Parameter To set the Maximum burst length on AXI
`define AXI_BL 16


// Name:         BLW
// Default:      4
// Values:       4, ..., 8
// Enabled:      GMAC == 4
// 
// Parameter to support Extended Burst Length on AXI
`define BLW 4


// Name:         BL32
// Default:      0
// Values:       0, 1
// Enabled:      AXI_BL == 32
// 
// Parameter indicating max selected burst-length selected on AXI is 
// 32
// `define BL32


// Name:         BL64
// Default:      0
// Values:       0, 1
// Enabled:      AXI_BL == 64
// 
// Parameter indicating max selected burst-length selected on AXI is 
// 64
// `define BL64


// Name:         BL128
// Default:      0
// Values:       0, 1
// Enabled:      AXI_BL == 128
// 
// Parameter indicating max selected burst-length selected on AXI is 
// 128
// `define BL128


// Name:         BL256
// Default:      0
// Values:       0, 1
// Enabled:      AXI_BL == 256
// 
// Parameter indicating max selected burst-length selected on AXI is 
// 256
// `define BL256

 
// Name:         AXI_GM_STORE_AND_FORWARD
// Default:      0
// Values:       0, 1
// 
// Parameter indicating the selected burst length
// `define AXI_GM_STORE_AND_FORWARD


// Name:         AXI_GM_WRITE_INTERLEAVING
// Default:      0
// Values:       0, 1
// Enabled:      0
// 
// Parameter to enable AXI Write Channel Data Enable Inter Leaving
// `define AXI_GM_WRITE_INTERLEAVING


// Name:         AXI_GM_WRITE_REORDERING
// Default:      0
// Values:       0, 1
// Enabled:      0
// 
// Parameter to enable AXI Write Channel requests re-oerdering
// `define AXI_GM_WRITE_REORDERING


// Name:         AXI_GM_AXI_ID_WIDTH
// Default:      4
// Values:       1 2 3 4 5 6 7 8 9 10 11 12
// Enabled:      GMAC == 4
// 
// Parameter indicating ID width on AXI Master System Bus
`define AXI_GM_AXI_ID_WIDTH 4

 
// Name:         GS_ID
// Default:      8
// Values:       2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// Enabled:      CSR_PORT == 3
// 
// Parameter indicating ID width on AXI Slave System Bus
`define GS_ID 8

// OPERATING MODE 


// Name:         OP_MODE
// Default:      10/100/1000 Mbps
// Values:       10/100/1000 Mbps (0), 10/100 Mbps (1), 1000 Mbps (2)
// Enabled:      1 (value changes dynamically based on a command)
// 
// Parameter To set the mode of operation
`define OP_MODE 2


// Name:         FDUPLX_ONLY
// Default:      0
// Values:       0, 1
// 
// Disables & removes Half-Duplex operation related logic
`define FDUPLX_ONLY


// Name:         M110_ONLY
// Default:      0
// Values:       0, 1
// 
// Parameter to enable the 10/100 Mbps only mode
// `define M110_ONLY


// Name:         M1000_ONLY
// Default:      1
// Values:       0, 1
// 
// Parameter to enable the Full Duplex only mode
`define M1000_ONLY


// Name:         USER_VER
// Default:      0x10
// Values:       0x10, ..., 0xff
// 
// User Defined version# inserted in GMAC Register8 (e.g. 8'h10 for 
// version 1.0)
`define USER_VER 8'h10

// DATA WIDTH PARAMETERS


// Name:         DATAWIDTH
// Default:      32
// Values:       32 64 128
// 
// Parameter To set the width of the data bus on the System Interface
`define DATAWIDTH 32


// Name:         DATAWIDTH_32
// Default:      1
// Values:       0, 1
// 
// Parameter to enable 32-bit data width for System Interface
`define DATAWIDTH_32


// Name:         DATAWIDTH_64
// Default:      0
// Values:       0, 1
// 
// Parameter to enable 64-bit data width for system interface
// `define DATAWIDTH_64


// Name:         DATAWIDTH_128
// Default:      0
// Values:       0, 1
// 
// Parameter to enable 128-bit data width for the system interface
// `define DATAWIDTH_128


// Name:         RXFIFO_SIZE
// Default:      2048
// Values:       128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768
// Enabled:      GMAC != 1
// 
// Depth in data-bytes (excludes overhead bits) of MTL Receive FIFO
`define RXFIFO_SIZE 2048


// Name:         TXFIFO_SIZE
// Default:      2048
// Values:       256 512 1024 2048 4096 8192 16384
// Enabled:      GMAC != 1
// 
// Depth in data-bytes (excludes overhead bits) of MTL Transmit FIFO
`define TXFIFO_SIZE 2048


// Name:         MAX_FRAME_IN_TXFIFO
// Default:      2
// Values:       2 4 8
// Enabled:      GMAC == 2
// 
// Maximum Number of Frames in TX FIFO
// 20170707-twu: change to 8 to avoid short packet loss
//`define MAX_FRAME_IN_TXFIFO 2
`define MAX_FRAME_IN_TXFIFO 8


// Name:         RX_FRAME_LEN_IF
// Default:      0
// Values:       0, 1
// Enabled:      GMAC == 2
// 
// Select MTL only subsystem with Rx frame length I/F
`define RX_FRAME_LEN_IF


// Name:         ADD_TXFIFO_FLUSH_IO
// Default:      0
// Values:       0, 1
// Enabled:      (GMAC==2)
// 
// Top level inputs for flushing Tx FIFO
// `define ADD_TXFIFO_FLUSH_IO


// Name:         STS_PTR_WIDTH
// Default:      1
// Values:       1, ..., 3
// 
// Address width of Tx status FIFO
`define STS_PTR_WIDTH 1


// Name:         MAX_FRAME_IN_TXFIFO_2
// Default:      1
// Values:       0, 1
// 
// Maximum Number of Frames in TX FIFO is two
//`define MAX_FRAME_IN_TXFIFO_2 2


// Name:         RX_FIFO_PTR_WIDTH
// Default:      9
// Values:       3, ..., 13
// Enabled:      RXFIFO_SIZE
// 
// Address-bus width for selected Receive FIFO depth
//20170707-twu: increase fifo depth to avoid fifo flush, default 9, max 13
//`define RX_FIFO_PTR_WIDTH 9
`define RX_FIFO_PTR_WIDTH 13


// Name:         ARI_PBL_WIDTH
// Default:      8
// Values:       2, ..., 12
// Enabled:      GMAC == 2
// 
// Width of ari_pbl_i signal
`define ARI_PBL_WIDTH 8


// Name:         FIFO_DATA_WIDTH
// Default:      35
// Values:       35, ..., 133
// Enabled:      GMAC != 1
// 
// Data-bus width to DPRAM including overhead bits
`define FIFO_DATA_WIDTH 35


// Name:         TX_FIFO_PTR_WIDTH
// Default:      9
// Values:       4, ..., 12
// Enabled:      GMAC != 1
// 
// Address-bus width for selected Transmit FIFO depth
//20170707-twu: increase fifo depth to avoid fifo flush, default 9. max 12
//`define TX_FIFO_PTR_WIDTH 9
`define TX_FIFO_PTR_WIDTH 12


// Name:         ATI_PBL_WIDTH
// Default:      8
// Values:       3, ..., 11
// Enabled:      GMAC == 2
// 
// Width of ati_pbl_i signal
`define ATI_PBL_WIDTH 8


// Name:         ADDR_OFFSET_MSB
// Default:      1
// Values:       1, ..., 3
// Enabled:      GMAC != 1
// 
// ADDR OFFSET MSB
`define ADDR_OFFSET_MSB 1


// Name:         MIN_FRAME_SIZE
// Default:      16
// Values:       16 32 64
// Enabled:      RX_FRAME_LEN_IF
// 
// Minimum size (in bytes) of frame stored in MTL Rx FIFO
`define MIN_FRAME_SIZE 16


// Name:         MAX_FRAME_CNT_WIDTH
// Default:      8
// Values:       2, ..., 12
// Enabled:      GMAC != 1
// 
// MTL Rx FIFO Max frame counter width
`define MAX_FRAME_CNT_WIDTH 8


// Name:         FRAME_LEN_FIFO_WIDTH
// Default:      15
// Values:       12, ..., 15
// Enabled:      RX_FRAME_LEN_IF
// 
// Width of Rx Frame Length FIFO(Drop Error Frame Flag & Frame Length)
`define FRAME_LEN_FIFO_WIDTH 15


// Name:         ASYNC_RAM
// Default:      0
// Values:       0, 1
// Enabled:      GMAC==0||GMAC == 2||GMAC == 3||GMAC ==4
// 
// Selects Asynchronous DPRAM interface; Default is Synchronous DPRAM 
// interface
// `define ASYNC_RAM


// Name:         FAST_FLUSH_ON_ABT
// Default:      0
// Values:       0, 1
// Enabled:      GMAC == 2||GMAC == 3||GMAC==0||GMAC==4
// 
// Fast flush on Abort in MTL FIFO
// `define FAST_FLUSH_ON_ABT


// Name:         ADDR_BASE_LSB
// Default:      2
// Values:       2, ..., 4
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// Address Base LSB for MDC block
`define ADDR_BASE_LSB 2


// Name:         ADDR_BASE_SIZE
// Default:      30
// Values:       28, ..., 30
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// Address Base size MDC block
`define ADDR_BASE_SIZE 30


// Name:         ADDR_OFFSET_SIZE
// Default:      2
// Values:       2, ..., 4
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// Address Offset size MDC block
`define ADDR_OFFSET_SIZE 2


// Name:         SIZE_BASE_SIZE
// Default:      9
// Values:       7, ..., 11
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// Base size MDC block
`define SIZE_BASE_SIZE 9


// Name:         NEEDED_BEATS_SIZE
// Default:      10
// Values:       8, ..., 12
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// Needed Beats Size MDC block
`define NEEDED_BEATS_SIZE 10


// Name:         DESC_ADDR_MSB
// Default:      29
// Values:       27, ..., 29
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// Descriptor Address MSB MDC block
`define DESC_ADDR_MSB 29


// Name:         RX_BUF_SIZE_MSB
// Default:      8
// Values:       6, ..., 8
// Enabled:      GMAC==0||GMAC == 3||GMAC==4
// 
// RX Buffer Size MSB
`define RX_BUF_SIZE_MSB 8



// Name:         TBU_NO_OF_STATES
// Default:      3
// Values:       3, ..., 6
// 
// Parameter to calculate no . of states in the TBU
`define TBU_NO_OF_STATES 3


// Name:         CSR_PORT
// Default:      MCI Interface
// Values:       MCI Interface (0), APB Interface (1), AHB Interface (2), AXI 
//               Interface (3)
// 
// Provide APB, MCI (in GMAC-CORE/MTL/DMA config) or AHB (in GMAC-AHB 
// config) for CSR Interface
`define CSR_PORT 0


// Name:         APB_SLAVE
// Default:      0
// Values:       0, 1
// 
// Provide APB port for CSR Access
// `define APB_SLAVE


// Name:         GMAC_AXI_SLAVE
// Default:      0
// Values:       0, 1
// 
// Provide AXI port for CSR Access
// `define GMAC_AXI_SLAVE


// Name:         CSR_DATAWIDTH
// Default:      32
// Values:       32 64 128
// Enabled:      CSR_PORT==2
// 
// Parameter To set the width of the data bus on the AHB Slave Port 
// Interface
`define CSR_DATAWIDTH 32


// Name:         CSR_DATAWIDTH_32
// Default:      1
// Values:       0, 1
// 
// Parameter to enable 32-bit data width for csr system interface
`define CSR_DATAWIDTH_32


// Name:         CSR_DATAWIDTH_64
// Default:      0
// Values:       0, 1
// 
// Parameter to enable 64-bit data width for csr system interface
// `define CSR_DATAWIDTH_64


// Name:         CSR_DATAWIDTH_128
// Default:      0
// Values:       0, 1
// 
// Parameter to enable 128-bit data width for csr system interface
// `define CSR_DATAWIDTH_128

// Synchronization Group


// Name:         SYNC_MACADDR
// Default:      0
// Values:       0, 1
// 
// Double-synchronize MAC Address register contents to Tx/Rx clock 
// domains; Default is direct usage
// `define SYNC_MACADDR


// Name:         SYNC_PAUSETIME
// Default:      0
// Values:       0, 1
// 
// Double-synchronize Pause Time register bits to Tx clock domain; 
// Default is direct usage
// `define SYNC_PAUSETIME


// Name:         SYNC_VLANTAG
// Default:      0
// Values:       0, 1
// 
// Double-synchronize VLAN register bits to Rx clock domain; Default 
// is direct usage
// `define SYNC_VLANTAG


// Name:         HASH_DIS
// Default:      0
// Values:       0, 1
// 
// Removes Hash Table register & related filter logic
// `define HASH_DIS


// Name:         SYNC_HASHTABLE
// Default:      0
// Values:       0, 1
// Enabled:      HASH_DIS==0
// 
// Double-synchronize Hash Table register bits to Rx clock domain; 
// Default is direct usage
// `define SYNC_HASHTABLE

// Enable Mac Addresses 1 to 31


// Name:         ALL_MAC_ADDR_EN
// Default:      0
// Values:       0, 1
// 
// To Enable All additional 31 MAC Address Registers
// `define ALL_MAC_ADDR_EN


// Name:         MAC_ADDR1
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 1
// `define MAC_ADDR1


// Name:         MAC_ADDR2
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 2
// `define MAC_ADDR2


// Name:         MAC_ADDR3
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 3
// `define MAC_ADDR3


// Name:         MAC_ADDR4
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 4
// `define MAC_ADDR4


// Name:         MAC_ADDR5
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 5
// `define MAC_ADDR5


// Name:         MAC_ADDR6
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 6
// `define MAC_ADDR6


// Name:         MAC_ADDR7
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 7
// `define MAC_ADDR7


// Name:         MAC_ADDR8
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 8
// `define MAC_ADDR8


// Name:         MAC_ADDR9
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 9
// `define MAC_ADDR9


// Name:         MAC_ADDR10
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 10
// `define MAC_ADDR10


// Name:         MAC_ADDR11
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 11
// `define MAC_ADDR11


// Name:         MAC_ADDR12
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 12
// `define MAC_ADDR12


// Name:         MAC_ADDR13
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 13
// `define MAC_ADDR13


// Name:         MAC_ADDR14
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 14
// `define MAC_ADDR14


// Name:         MAC_ADDR15
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 15
// `define MAC_ADDR15


// Name:         MAC_ADDR16
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 16
// `define MAC_ADDR16


// Name:         MAC_ADDR17
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 17
// `define MAC_ADDR17


// Name:         MAC_ADDR18
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 18
// `define MAC_ADDR18


// Name:         MAC_ADDR19
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 19
// `define MAC_ADDR19


// Name:         MAC_ADDR20
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 20
// `define MAC_ADDR20


// Name:         MAC_ADDR21
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 21
// `define MAC_ADDR21


// Name:         MAC_ADDR22
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 22
// `define MAC_ADDR22


// Name:         MAC_ADDR23
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 23
// `define MAC_ADDR23


// Name:         MAC_ADDR24
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 24
// `define MAC_ADDR24


// Name:         MAC_ADDR25
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 25
// `define MAC_ADDR25


// Name:         MAC_ADDR26
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 26
// `define MAC_ADDR26


// Name:         MAC_ADDR27
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 27
// `define MAC_ADDR27


// Name:         MAC_ADDR28
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 28
// `define MAC_ADDR28


// Name:         MAC_ADDR29
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 29
// `define MAC_ADDR29


// Name:         MAC_ADDR30
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 30
// `define MAC_ADDR30


// Name:         MAC_ADDR31
// Default:      0
// Values:       0, 1
// Enabled:      !ALL_MAC_ADDR_EN
// 
// To Enable MAC Address Register 31
// `define MAC_ADDR31


// Name:         EXTRA_MAC_ADDR_REG
// Default:      0
// Values:       0, 1
// 
// This is defined when any of the MACADDR[16-31] is selected
// `define EXTRA_MAC_ADDR_REG

// RFC Fifo Depth


// Name:         RFC_FDEPTH
// Default:      4
// Values:       4 8 16 32
// 
// To Specify the FIFO Depth in RFC block
`define RFC_FDEPTH 4


// Name:         RFC_FPTRWIDTH
// Default:      2
// Values:       2, ..., 5
// 
// Parameter for FIFO pointer Width in RFC block
`define RFC_FPTRWIDTH 2


// Name:         ASYNC_RST
// Default:      1
// Values:       0, 1
// 
// To Enable the Asynchronous Reset for Flops
`define ASYNC_RST


// Name:         DWC_GMAC_SVA
// Default:      0
// Values:       0, 1
// 
// Enable Assertions for Core Simulation
// `define DWC_GMAC_SVA


// Name:         DWC_GMAC_MDC_SVA
// Default:      0
// Values:       0, 1
// Enabled:      GMAC==3||GMAC==0||GMAC==4
// 
// Enable Assertions for Subsys (MDC) Simulation
// `define DWC_GMAC_MDC_SVA


// Name:         DWC_GMAC_AXI_SVA
// Default:      0
// Values:       0, 1
// Enabled:      GMAC==4
// 
// Enable Assertions for Subsys (AXI) Simulation
// `define DWC_GMAC_AXI_SVA


// Name:         DWC_GMAC_MTL_SVA
// Default:      0
// Values:       0, 1
// Enabled:      GMAC==2||GMAC==3||GMAC==0||GMAC==4
// 
// Enable Assertions for Subsys (MTL) Simulation
// `define DWC_GMAC_MTL_SVA


// Name:         RGMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Enables Reduced GMI Interface as Line Interface
`define RGMII_EN


// Name:         RMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 1||OP_MODE == 0
// 
// Enables Reduced Media Independent Interface as Line Interface
// `define RMII_EN


// Name:         SMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 1||OP_MODE == 0
// 
// Enables Serial Media Independent Interface as Line Interface
// `define SMII_EN


// Name:         SGMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Enables SGMI Interface as Line Interface
// `define SGMII_EN


// Name:         TBI_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Enables Ten Bit Interface as Line Interface
// `define TBI_EN


// Name:         RTBI_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Enables Reduced Ten Bit Interface as Line Interface
// `define RTBI_EN


// Name:         RGMII_OR_SGMII
// Default:      1
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Indicates RGMII or SGMII has been chosen as Line Interface
`define RGMII_OR_SGMII


// Name:         RGMII_OR_RTBI
// Default:      1
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Indicates RGMII or RTBI has been chosen as Line Interface
`define RGMII_OR_RTBI


// Name:         RGMII_SGMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Indicates RGMII and SGMII has been chosen as Line Interface
// `define RGMII_SGMII_EN


// Name:         PCS_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Indicates PCS with TBI, SGMII or RTBI has been chosen as Line 
// Interface
// `define PCS_EN


// Name:         TBI_SGMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      OP_MODE == 0||OP_MODE == 2
// 
// Indicates TBI and SGMII has been chosen as Line Interface
// `define TBI_SGMII_EN


// Name:         XILINX
// Default:      0
// Values:       0, 1
// Enabled:      (RGMII_EN||RTBI_EN)&&SINGLE_PHY_INTF
// 
// Uses XILINX Virtex2 dual-edge Flops for RGMII/RTBI transmit signals
// `define XILINX


// Name:         GMAC_PHY_DELAY
// Default:      0
// Values:       0, 1
// Enabled:      RGMII_EN||RTBI_EN
// 
// Delay the transmit interface signals in RGMII/RTBI by half-clock
// `define GMAC_PHY_DELAY


// Name:         RGMII_DELAY
// Default:      0
// Values:       0, 1
// 
// Delay the transmit interface signals in RGMII by half-clock
// `define RGMII_DELAY


// Name:         RTBI_DELAY
// Default:      0
// Values:       0, 1
// 
// Delay the transmit interface signals in RTBI by half-clock
// `define RTBI_DELAY


// Name:         SPEED_SELECT
// Default:      1
// Values:       0, 1
// Enabled:      RGMII_EN||RMII_EN||SGMII_EN||SMII_EN
// 
// Additional output port for speed selection (10/100/1000 Mbps) for 
// RGMII/RMII/SGMII/SMII interface. It is a 1-bit port for RMII/SMII 
// (0-10 Mbps, 1-100Mbps) and 2-bit port for SGMII/RGMII (0x-1000 Mbps, 
// 10-10 Mbps, 11 - 100 Mbps).
// `define SPEED_SELECT


// Name:         SINGLE_PHY_INTF
// Default:      0
// Values:       0, 1
// Enabled:       
//               
//               
//               
//               
//               
//               
//               
//               SGMII_EN&&!RMII_EN&&!RGMII_EN&&!TBI_EN&&!RTBI_EN&&!SMII_EN)||(RGMII_EN&&!RMII_EN&&!SGMII_EN&&!TBI_EN&&!RTBI_EN&&!SMII_EN)||(RMII_EN&&!RGMII_EN&&!TBI_EN&&!RTBI_EN&&!SGMII_EN&&!SMII_EN&&M110_ONLY)||(TBI_EN&&!RMII_EN&&!RGMII_EN&&!RTBI_EN&&!SGMII_EN&&!SMII_EN)||(RTBI_EN&&!RMII_EN&&!RGMII_EN&&!TBI_EN&&!SGMII_EN&&!SMII_EN)||(!RTBI_EN&&!RMII_EN&&!RGMII_EN&&!TBI_EN&&!SGMII_EN&&!SMII_EN)||(SMII_EN&&!RMII_EN&&!RGMII_EN&&!TBI_EN&&!RTBI_EN&&!SGMII_EN&&M110_ONLY)
// 
// Single interface without mutliplexer at the output is selected
// `define SINGLE_PHY_INTF


// Name:         SSSMII_EN
// Default:      0
// Values:       0, 1
// Enabled:      SMII_EN
// 
// Source Synchronous Mode selection for Serial Media Independent 
// Interface.
// `define SSSMII_EN


// Name:         SSSMII_TXSYNC_IN
// Default:      0
// Values:       0, 1
// Enabled:      SMII_EN&&SSSMII_EN
// 
// TXSYNC IO in Source Synchronous Mode for Serial Media Independent 
// Interface.
// `define SSSMII_TXSYNC_IN


// Name:         RGMII_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select RGMI Interface only without the multiplexer at the output
// `define RGMII_INTF_ONLY


// Name:         SGMII_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select SGMI Interface only without the multiplexer at the output
// `define SGMII_INTF_ONLY


// Name:         RMII_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select RMI Interface only without the multiplexer at the output
// `define RMII_INTF_ONLY


// Name:         SMII_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select SMI Interface only without the multiplexer at the output
// `define SMII_INTF_ONLY


// Name:         TBI_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select TB Interface only without the multiplexer at the output
// `define TBI_INTF_ONLY


// Name:         RTBI_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select RTB Interface only without the multiplexer at the output
// `define RTBI_INTF_ONLY


// Name:         GMII_INTF_ONLY
// Default:      0
// Values:       0, 1
// 
// Select GMI Interface only without the multiplexer at the output
// `define GMII_INTF_ONLY

`define PHY_SELECT_VAL 3'b000



// Name:         IPCHKSUM_EN
// Default:      0
// Values:       0, 1
// Enabled:      ADV_TIME_STAMPING!=1
// 
// Enable IP checksum for received frames; The checksum is calculated 
// for entire IP payload
// `define IPCHKSUM_EN

// and IPV6 frames. Uncheck this option for backward compatibility to Type 1 COE.

// Name:         IPC_FULL_OFFLOAD
// Default:      0
// Values:       0, 1
// Enabled:      IPCHKSUM_EN==1 && ADV_TIME_STAMPING!=1
// 
// When selected, TCP/UDP/ICMP checksum is also checked for received 
// IPV4
// `define IPC_FULL_OFFLOAD


// Name:         TX_COE
// Default:      0
// Values:       0, 1
// Enabled:      GMAC!=1
// 
// When selected, TCP/UDP/ICMP Transmit checksum offloading is 
// enabled.
// `define TX_COE


// Name:         CHKSUM_FIFO_WIDTH
// Default:      32
// Values:       -2147483648, ..., 2147483647
// Enabled:      TX_COE==1 && GMAC!=1
// 
// Width of Transmit Checksum FIFO.
`define CHKSUM_FIFO_WIDTH 32


// Name:         CHKSUM_PTR_WIDTH
// Default:      2
// Values:       2, ..., 4
// Enabled:      TX_COE==1 && GMAC!=1
// 
// Width of Transmit Checksum FIFO.
`define CHKSUM_PTR_WIDTH 2


// Name:         PMT_EN
// Default:      0
// Values:       0, 1
// 
// Select the Power Management feature for the GMAC core using Magic 
// Packet or Wake-up frames
// `define PMT_EN


// Name:         PMT_MGK_EN
// Default:      0
// Values:       0, 1
// Enabled:      PMT_EN
// 
// Select the AMD's Magic Packet frame detection
// `define PMT_MGK_EN


// Name:         PMT_RWK_EN
// Default:      0
// Values:       0, 1
// Enabled:      PMT_EN
// 
// Select the Power Management block Remote Wake-up frame detection
// `define PMT_RWK_EN


// Name:         SMA_EN
// Default:      1
// Values:       0, 1
// 
// Select the Station Management Agent block
`define SMA_EN


// Name:         MMC_EN
// Default:      0
// Values:       0, 1
// 
// Enable GMAC Management (RMON) Counter(s)
// `define MMC_EN


// Name:         MMC_EN_TX_ALL
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN
// 
// Parameter to select all the RMON Counters for Tx GMAC Management
// `define MMC_EN_TX_ALL


// Name:         MMC_TXADDR_RNG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enables the octect counters for all transmitted frames of different 
// sizes ( =64, 65-127, 128-255, 256-511, 512-1023, 1024-maxsize)
// `define MMC_TXADDR_RNG_CNT_EN


// Name:         MMC_TXOCTGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable Octet counter for all good & bad transmitted frames
// `define MMC_TXOCTGB_CNT_EN


// Name:         MMC_TXFRMGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable Frame counter for all good & bad transmitted frames
// `define MMC_TXFRMGB_CNT_EN


// Name:         MMC_TXBCASTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable counter for good broadcast frames transmitted
// `define MMC_TXBCASTG_CNT_EN


// Name:         MMC_TXMCASTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable counter for good multicast frames transmitted
// `define MMC_TXMCASTG_CNT_EN


// Name:         MMC_TXUCASTGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable counter for good or bad unicast frames transmitted
// `define MMC_TXUCASTGB_CNT_EN


// Name:         MMC_TXMCASTGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable counter for good or bad multicast frames transmitted
// `define MMC_TXMCASTGB_CNT_EN


// Name:         MMC_TXBCASTGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable counter for good or bad broadcast frames transmitted
// `define MMC_TXBCASTGB_CNT_EN


// Name:         MMC_TXUNDRFLW_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable counter for frames transmitted with underflow error bit set
// `define MMC_TXUNDRFLW_CNT_EN


// Name:         MMC_TXSNGLCOLG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames transmitted with single collision in Half 
// Duplex mode
// `define MMC_TXSNGLCOLG_CNT_EN


// Name:         MMC_TXMULTCOLG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames transmitted with multiple collision in 
// Half Duplex mode
// `define MMC_TXMULTCOLG_CNT_EN


// Name:         MMC_TXDEFRD_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames that were deferred before transmission in 
// Half Duplex mode
// `define MMC_TXDEFRD_CNT_EN


// Name:         MMC_TXLATECOL_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames that were aborted due to late collision 
// in Half Duplex mode
// `define MMC_TXLATECOL_CNT_EN


// Name:         MMC_TXEXSCOL_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames aborted due to excessive collision in 
// Half Duplex mode
// `define MMC_TXEXSCOL_CNT_EN


// Name:         MMC_TXCARR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames aborted due to carrier errors in Half 
// Duplex mode
// `define MMC_TXCARR_CNT_EN


// Name:         MMC_TXOCTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable Octet counter for only good transmitted frames
// `define MMC_TXOCTG_CNT_EN


// Name:         MMC_TXFRMG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable Frame counter for only good transmitted frames
// `define MMC_TXFRMG_CNT_EN


// Name:         MMC_TXEXSDEF_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL&&!FDUPLX_ONLY
// 
// Enable counter for frames aborted due to excessive deferral in Half 
// Duplex mode
// `define MMC_TXEXSDEF_CNT_EN


// Name:         MMC_TXPAUSE_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable frame counter for transmitted PAUSE frames
// `define MMC_TXPAUSE_CNT_EN


// Name:         MMC_TXVLAN_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_TX_ALL
// 
// Enable frame counter for transmitted VLAN-tagged frames
// `define MMC_TXVLAN_CNT_EN


// Name:         MMC_EN_RX_ALL
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN
// 
// Parameter to select all the RMON Counters for Rx GMAC Management
// `define MMC_EN_RX_ALL


// Name:         MMC_RXFRMGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable Frame counter for received good & bad frames
// `define MMC_RXFRMGB_CNT_EN


// Name:         MMC_RXOCTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable Octect counter for received good frames
// `define MMC_RXOCTG_CNT_EN


// Name:         MMC_RXOCTGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable Octect counter for all received frames
// `define MMC_RXOCTGB_CNT_EN


// Name:         MMC_RXBCASTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for good broadcast frames received
// `define MMC_RXBCASTG_CNT_EN


// Name:         MMC_RXMCASTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for good multicast frames received
// `define MMC_RXMCASTG_CNT_EN


// Name:         MMC_RXCRCERR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for frames received with CRC error
// `define MMC_RXCRCERR_CNT_EN


// Name:         MMC_RXALGNERR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL&&!M1000_ONLY
// 
// Enable counter for frames received with Alignment Error (dribble) 
// in 100 Mbps mode
// `define MMC_RXALGNERR_CNT_EN


// Name:         MMC_RXRUNTERR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for received runt (size less than 64 bytes and CRC 
// error) frames
// `define MMC_RXRUNTERR_CNT_EN


// Name:         MMC_RXJABERR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for frames received with Jabber error
// `define MMC_RXJABERR_CNT_EN


// Name:         MMC_RXUNDERSZG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for received undersize (size less than 64 bytes and 
// no errors) frames
// `define MMC_RXUNDERSZG_CNT_EN


// Name:         MMC_RXOVERSZG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable the counter for received Oversize (size > 1518/1522 bytes) 
// frames
// `define MMC_RXOVERSZG_CNT_EN


// Name:         MMC_RXADDR_RNG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enables the octect counters for all received frames of different 
// sizes (64, 65-127, 128-255, 256-511, 512-1023, 1024-maxsize)
// `define MMC_RXADDR_RNG_CNT_EN


// Name:         MMC_RXUCASTG_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for Unicast frames received
// `define MMC_RXUCASTG_CNT_EN


// Name:         MMC_RXLENERR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for frames with Length error received
// `define MMC_RXLENERR_CNT_EN


// Name:         MMC_RXOUTOFRNG_TYP_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable Out of Range (LengthField between 1500 & 1536 decimal) frame 
// counter
// `define MMC_RXOUTOFRNG_TYP_CNT_EN


// Name:         MMC_RXPAUSEFRM_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for Pause frames received
// `define MMC_RXPAUSEFRM_CNT_EN


// Name:         MMC_RXFIFOOVFL_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL&&!GMAC_CORE
// 
// Enable counter to count the number of times Rx MTL FIFO has 
// overflowed
// `define MMC_RXFIFOOVFL_CNT_EN


// Name:         MMC_RXVLANFRGB_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for VLAN good/bad frames received
// `define MMC_RXVLANFRGB_CNT_EN


// Name:         MMC_RXWDGERR_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&!MMC_EN_RX_ALL
// 
// Enable counter for frames with Watchdog timeout error
// `define MMC_RXWDGERR_CNT_EN


// Name:         MMC_RX_EN_ATLEAST_ONE
// Default:      0
// Values:       0, 1
// 
// This is defined when atleast one MMC Receive Counter is enabled.
// `define MMC_RX_EN_ATLEAST_ONE


// Name:         MMC_IPC_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_EN&&IPC_FULL_OFFLOAD
// 
// Enable GMAC Management (RMON) Counter(s) for Receive TCP/IP 
// Checksum Offload
// `define MMC_IPC_EN



// Name:         MMC_IPC_EN_RX_ALL
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN
// 
// Parameter to select all the RMON Counters for Rx IPC
// `define MMC_IPC_EN_RX_ALL


// Name:         MMC_RX_IPV4_GD_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv4 frames with no checksum errors
// `define MMC_RX_IPV4_GD_FRMS_CNT_EN


// Name:         MMC_RX_IPV4_HDRERR_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv4 frames with checksum errors
// `define MMC_RX_IPV4_HDRERR_FRMS_CNT_EN


// Name:         MMC_RX_IPV4_NOPAY_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv4 frames which do not have TCP, 
// UDP, ICMP
// `define MMC_RX_IPV4_NOPAY_FRMS_CNT_EN


// Name:         MMC_RX_IPV4_FRAG_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv4 frames which were fragmented
// `define MMC_RX_IPV4_FRAG_FRMS_CNT_EN


// Name:         MMC_RX_IPV4_UDSBL_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv4 UDP frames with checksum 
// disabled.
// `define MMC_RX_IPV4_UDSBL_FRMS_CNT_EN


// Name:         MMC_RX_IPV6_GD_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv6 frames that do not have checksum 
// related errors
// `define MMC_RX_IPV6_GD_FRMS_CNT_EN


// Name:         MMC_RX_IPV6_HDRERR_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv6 frames that had header error.
// `define MMC_RX_IPV6_HDRERR_FRMS_CNT_EN


// Name:         MMC_RX_IPV6_NOPAY_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for IPv6 frames not having TCP, UDP, ICMP
// `define MMC_RX_IPV6_NOPAY_FRMS_CNT_EN


// Name:         MMC_RX_UDP_GD_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for frames containing UDP with no errors
// `define MMC_RX_UDP_GD_FRMS_CNT_EN


// Name:         MMC_RX_UDP_ERR_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for frames containing UDP with errors
// `define MMC_RX_UDP_ERR_FRMS_CNT_EN


// Name:         MMC_RX_TCP_GD_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for frames containing TCP with no errors
// `define MMC_RX_TCP_GD_FRMS_CNT_EN


// Name:         MMC_RX_TCP_ERR_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for frames containing TCP with errors
// `define MMC_RX_TCP_ERR_FRMS_CNT_EN


// Name:         MMC_RX_ICMP_GD_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for frames containing ICMP with no errors
// `define MMC_RX_ICMP_GD_FRMS_CNT_EN


// Name:         MMC_RX_ICMP_ERR_FRMS_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for frames containing ICMP with errors
// `define MMC_RX_ICMP_ERR_FRMS_CNT_EN


// Name:         MMC_RX_IPV4_GD_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting IPv4 datagrams bytes when there 
// are no checksum errors.
// `define MMC_RX_IPV4_GD_OCTET_CNT_EN


// Name:         MMC_RX_IPV4_HDRERR_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter for counting bytes of IPv4 datagrams in 
// which header checksum errors exist
// `define MMC_RX_IPV4_HDRERR_OCTET_CNT_EN


// Name:         MMC_RX_IPV4_NOPAY_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes of IPv4 datagrams with no 
// UDP, TCP, ICMP
// `define MMC_RX_IPV4_NOPAY_OCTET_CNT_EN


// Name:         MMC_RX_IPV4_FRAG_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in IPv4 datagrams that are 
// fragmented.
// `define MMC_RX_IPV4_FRAG_OCTET_CNT_EN


// Name:         MMC_RX_IPV4_UDSBL_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in IPv4 UDP datagram which 
// has checksum disabled. This includes only UDP bytes and not the 
// IPv4 header.
// `define MMC_RX_IPV4_UDSBL_OCTET_CNT_EN


// Name:         MMC_RX_IPV6_GD_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in IPv6 datagram having no 
// checksum errors.
// `define MMC_RX_IPV6_GD_OCTET_CNT_EN


// Name:         MMC_RX_IPV6_HDRERR_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in IPv6 datagram having 
// header errors.
// `define MMC_RX_IPV6_HDRERR_OCTET_CNT_EN


// Name:         MMC_RX_IPV6_NOPAY_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in IPv6 datagram not 
// having TCP, UDP, ICMP
// `define MMC_RX_IPV6_NOPAY_OCTET_CNT_EN


// Name:         MMC_RX_UDP_GD_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in UDP which do not have 
// checksum errors.
// `define MMC_RX_UDP_GD_OCTET_CNT_EN


// Name:         MMC_RX_UDP_ERR_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in UDP which have checksum 
// errors.
// `define MMC_RX_UDP_ERR_OCTET_CNT_EN


// Name:         MMC_RX_TCP_GD_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in TCP which do not have 
// checksum errors.
// `define MMC_RX_TCP_GD_OCTET_CNT_EN


// Name:         MMC_RX_TCP_ERR_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in TCP which have checksum 
// errors.
// `define MMC_RX_TCP_ERR_OCTET_CNT_EN


// Name:         MMC_RX_ICMP_GD_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in ICMP which do not have 
// checksum errors.
// `define MMC_RX_ICMP_GD_OCTET_CNT_EN


// Name:         MMC_RX_ICMP_ERR_OCTET_CNT_EN
// Default:      0
// Values:       0, 1
// Enabled:      MMC_IPC_EN&&!MMC_IPC_EN_RX_ALL
// 
// Parameter for MMC Counter counting bytes in ICMP which have 
// checksum errors.
// `define MMC_RX_ICMP_ERR_OCTET_CNT_EN



// Name:         MMC_IPC_RX_DGRAM_BCNT_ATLEAST_ONE
// Default:      0
// Values:       0, 1
// 
// This is defined when atleast one MMC IPC transmit counter is 
// selected
// `define MMC_IPC_RX_DGRAM_BCNT_ATLEAST_ONE


// Name:         MMC_IPC_RX_PAYLD_BCNT_ATLEAST_ONE
// Default:      0
// Values:       0, 1
// 
// This is defined when atleast one MMC IPC transmit counter is 
// selected
// `define MMC_IPC_RX_PAYLD_BCNT_ATLEAST_ONE


// Name:         MMC_IPC_RX_FRMS_ATLEAST_ONE
// Default:      0
// Values:       0, 1
// 
// This is defined when atleast one MMC IPC transmit counter is 
// selected
// `define MMC_IPC_RX_FRMS_ATLEAST_ONE


// Name:         MMC_IPC_RX_EN_ATLEAST_ONE
// Default:      0
// Values:       0, 1
// 
// This is defined when atleast one MMC IPC transmit counter is 
// selected
// `define MMC_IPC_RX_EN_ATLEAST_ONE



// Name:         FLTRVALID_DLY
// Default:      0
// Values:       0, 1
// 
// Register the filter valid signal in Address filter block
// `define FLTRVALID_DLY


// Name:         REG_DMA_INTF
// Default:      0
// Values:       0, 1
// 
// Use registered interface signals from DMA towards AHB.
// `define REG_DMA_INTF


// Name:         CSR_SLV_CLK
// Default:      0
// Values:       0, 1
// Enabled:      GMAC!=1&&CSR_PORT!=3
// 
// Use a different clock than App clk. for CSR slave
// `define CSR_SLV_CLK


// Name:         SBD_FC_EN
// Default:      0
// Values:       0, 1
// Enabled:      (GMAC!=1)
// 
// Enable Sideband Rx Flow Control input from application for RxFIFO 
// size less than 4K
// `define SBD_FC_EN


// Name:         ADD_TXRX_DIS_IO
// Default:      0
// Values:       0, 1
// Enabled:      (GMAC==1)||(GMAC==2)
// 
// Top level inputs for MAC Tx/Rx Disable
// `define ADD_TXRX_DIS_IO


// Name:         GNT_FRAME_THRSHLD
// Default:      510
// Values:       6, ..., 4094
// Enabled:      GMAC!=1
// 
// Giant Frame Threshold
`define GNT_FRAME_THRSHLD 510


// Name:         EXTENDED_STATUS
// Default:      0
// Values:       0, 1
// Enabled:      0
// 
// Extended status for CORE and MTL
// `define EXTENDED_STATUS


`define TXD_WIDTH 8


`define RXD_WIDTH 8

// PHY interface IO control (Not visible)


// Name:         TXEN_OP
// Default:      1
// Values:       0, 1
// 
// Parameter to indicate presence of phy_txen
`define TXEN_OP


// Name:         TXER_OP
// Default:      1
// Values:       0, 1
// 
// Parameter to indicate presence of phy_txer
`define TXER_OP


// Name:         RXDV_IP
// Default:      1
// Values:       0, 1
// 
// Parameter to indicate presence of phy_rxdv
`define RXDV_IP


// Name:         RXER_IP
// Default:      1
// Values:       0, 1
// 
// Parameter to indicate presence of phy_rxer
`define RXER_IP


// Name:         CRS_IP
// Default:      1
// Values:       0, 1
// 
// Parameter to indicate presence of phy_crs
`define CRS_IP


// Name:         COL_IP
// Default:      1
// Values:       0, 1
// 
// Parameter to indicate presence of phy_col
`define COL_IP

// AXI Interface specific Internal parameters (Not visible)

 
// Name:         AXI_GM_REQUEST_PRIORITY
// Default:      1
// Values:       0, 1
// 
// Parameter to Enabled the handling of Priority Requests on GM
`define AXI_GM_REQUEST_PRIORITY

 
// Name:         AXI_GM_ADDR_WIDTH
// Default:      32
// Values:       -2147483648, ..., 2147483647
// 
// Parameter which indicates the AXI bus Address width
`define AXI_GM_ADDR_WIDTH 32

 
// Name:         AXI_GM_DATA_WIDTH
// Default:      32
// Values:       -2147483648, ..., 2147483647
// 
// Parameter which indicates the AXI bus Data width
`define AXI_GM_DATA_WIDTH 32


// Name:         AXI_GM_DATA_WIDTH_64
// Default:      0
// Values:       0, 1
// 
// Parameter to enable 64-bit data width for system interface
// `define AXI_GM_DATA_WIDTH_64

 
// Name:         AXI_GM_DATA_WIDTH_128
// Default:      0
// Values:       0, 1
// 
// Parameter to enable 128-bit data width for system interface
// `define AXI_GM_DATA_WIDTH_128

 
// Name:         AXI_GM_GM_ID_WIDTH
// Default:      1
// Values:       1 2 3 4 5 6 7 8 9 10 11 12
// 
// Parameter indicates the ID widht on GM interface
`define AXI_GM_GM_ID_WIDTH 1

 
// Name:         AXI_GM_MAX_WR_REQUESTS
// Default:      4
// Values:       4 8
// Enabled:      GMAC==4
// 
// Parameter indicates maximun Write Requests on AXI interface
`define AXI_GM_MAX_WR_REQUESTS 4

 
// Name:         AXI_GM_PER_ID_MAX_WR_REQUESTS
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicates maximun per ID Write Requests on AXI
`define AXI_GM_PER_ID_MAX_WR_REQUESTS 2

 
// Name:         AXI_GM_WR_REQ_BUFFER
// Default:      2
// Values:       =(AXI_GM_REQUEST_PRIORITY) ? 2 : 1, ..., 16
// 
// Parameter indicates GM Commmand buffer depth
`define AXI_GM_WR_REQ_BUFFER 2

 
// Name:         WR_REQUEST_BUFFER_PRESENT
// Default:      0
// Values:       0, 1
// 
// Parameter indicates whether Command buffer is present or not
// `define WR_REQUEST_BUFFER_PRESENT

 
// Name:         AXI_GM_WDATA_BUFFER
// Default:      2
// Values:       1, ..., 256
// 
// Parameter indicates Data buffer depth
`define AXI_GM_WDATA_BUFFER 2

 
// Name:         AXI_GM_WRESP_BUFFER
// Default:      2
// Values:       1, ..., 256
// 
// Parameter indicates Response buffer depth
`define AXI_GM_WRESP_BUFFER 2

// Design Specific parameters on Read Interface

 
// Name:         AXI_GM_MAX_RD_REQUESTS
// Default:      4
// Values:       4 8
// Enabled:      GMAC==4
// 
// Parameter indicates maximun Read Requests on AXI interface
`define AXI_GM_MAX_RD_REQUESTS 4

 
// Name:         AXI_GM_PER_ID_MAX_RD_REQUESTS
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicates maximun per ID Read Requests on AXI
`define AXI_GM_PER_ID_MAX_RD_REQUESTS 2

 
// Name:         AXI_GM_RD_REQ_BUFFER
// Default:      2
// Values:       =(AXI_GM_REQUEST_PRIORITY) ? 2 : 1, ..., 16
// 
// Parameter indicates GM Commmand buffer depth
`define AXI_GM_RD_REQ_BUFFER 2

 
// Name:         RD_REQUEST_BUFFER_PRESENT
// Default:      0
// Values:       0, 1
// 
// Parameter indicates whether Command buffer is present or not
// `define RD_REQUEST_BUFFER_PRESENT

 
`define PAD_ZEROS 1

  // Derived Parameters
 
`define CNTW 16

 
`define TOT_IDS 2


// Name:         BSA
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating the selected burst length
`define BSA 2

 
// Name:         STRW
// Default:      4
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Write Strobes width
`define STRW 4

 
// Name:         WTOT_CMDS
// Default:      4
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Total Write commands
`define WTOT_CMDS 4

 
// Name:         WLBCW
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Width of the L bit counter of Data buffer
`define WLBCW 2

 
// Name:         WOSRCW
// Default:      3
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Width of Ost-standing write request counter
`define WOSRCW 3

 
// Name:         WCMN_CPTRW
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating the selected burst length
`define WCMN_CPTRW 2

 
// Name:         WPID_CPTRW
// Default:      1
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Width of per ID command pointer (Write)
`define WPID_CPTRW 1

 
// Name:         RTOT_CMDS
// Default:      4
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Total commands (Read)
`define RTOT_CMDS 4

 
// Name:         ROSRCW
// Default:      3
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating width of the Out-standing request count
`define ROSRCW 3

 
// Name:         RCMN_CPTRW
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating Common Command pointer Width (Read)
`define RCMN_CPTRW 2

 
// Name:         RPID_CPTRW
// Default:      1
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating the per ID Command pointer width (read)
`define RPID_CPTRW 1

 
// Name:         IO_DRQW
// Default:      12
// Values:       -2147483648, ..., 2147483647
// 
// Parameter indicating In-Order FIFO Depth
`define IO_DRQW 12

// AXI Slave Specific parameters taken from DW_axi_gs module
// Made visisble false


// Name:         GS_AXI_EX_ACCESS
// Default:      0
// Values:       0, ..., 16
// 
// Maximum number of exclusive accesses supported in parallel. 
//  A value of 0 means exclusive accesses are not supported.
`define GS_AXI_EX_ACCESS 0


// Name:         GS_GIF_LITE
// Default:      false
// Values:       false (0), true (1)
// 
// Lite version of GIF. Supports devices with one-cycle data 
//  response and no flow control.
`define GS_GIF_LITE 0


// Name:         GS_BID_BUFFER
// Default:      1
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Depth of BID buffer for outstanding GIF write requests. 
//  If set to 1, equivalent to blocking GIF write; current GIF write 
//  requests must complete (write response received from GIF Response 
//  Channel) before next AXI write request is accepted by DW_axi_gs. 
//  If greater than 1, AXI write IDs are allowed to be queued in BID 
//  buffer, while write request is transferred to GIF Request Channel 
//  before previous GIF writes responses are completed (up to the 
//  configured limit).
`define GS_BID_BUFFER 1


// Name:         GS_RID_BUFFER
// Default:      1
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Depth of RID buffer for outstanding RID requests. 
//  If set to 1, equivalent to blocking GIF read; current GIF read request 
//  must complete (read response received form GIF response channel) before 
//  next AXI read request is accepted by DW_axi_gs. 
//  If greater than 1, AXI read IDs are allowed to be queued in RID buffer, 
//  while read request if transferred to GIF Request Channel before previous 
//  GIF reads responsese are completed (up to the configured limit).
`define GS_RID_BUFFER 1


// Name:         GS_DIRECT_GIF_READY
// Default:      true
// Values:       false (0), true (1)
// 
// If true, GIF saccept input is combinationally connected to AXI 
//  awready, wready, and arready outputs. 
//  If false, GIF saccept input is registered, inserting one cycle 
//  of latency.
`define GS_DIRECT_GIF_READY 1


// Name:         GS_REQ_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of combined read and write AXI request buffer. Higher values 
//  allow AXI requests to be bufffered, rather than stalled, if GIF 
//  request channel stalls DW_axi_gs transactions.
`define GS_REQ_BUFFER 1


// Name:         GS_WDATA_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of AXI write data buffer. Higher values allow AXI write data 
//  to be buffered, rather than stalled, if GIF request channel stalls 
//  DW_axi_gs transactions data.
`define GS_WDATA_BUFFER 1

// See databook for side effect of DIRECT_AXI_READY
// and GIF_LITE both enabled with a slow GCLK.


// Name:         GS_DIRECT_AXI_READY
// Default:      true
// Values:       false (0), true (1)
// 
// If true, AXI rready and bready inputs are combinationally connected to 
//  GIF mready outputs. 
//  If false, AXI rready and bready inputs are registered, inserting one 
//  cycle of latency.
`define GS_DIRECT_AXI_READY 1


// Name:         GS_RESP_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of GIF response buffer. Higher values allow GIF responses to be 
//  buffered, rather than stalled, if AXI read data or write response 
//  channel stall DW_axi_gs responses.
`define GS_RESP_BUFFER 1

`define TX_RST_MODE posedge clk_tx_i or negedge rst_clk_tx_n
`define TX_180_RST_MODE posedge clk_tx_180_i or negedge rst_clk_tx_180_n
`define RX_RST_MODE posedge clk_rx_i or negedge rst_clk_rx_n
`define RX_180_RST_MODE posedge clk_rx_180_i or negedge rst_clk_rx_180_n
`define APP_RST_MODE posedge clk_app_i or negedge rst_clk_app_n
`define CSR_RST_MODE posedge clk_csr_i or negedge rst_clk_csr_n
`define SRC_RST_MODE posedge clk_src or negedge rst_clk_src_n     
`define AHB_RST_MODE posedge hclk_i or negedge hreset_n
`define RMII_RST_MODE posedge clk_rmii_i or negedge rst_clk_rmii_n
`define PTP_RST_MODE posedge clk_ptp_ref_i or negedge rst_clk_ptp_ref_n
`define TX_125_RST_MODE posedge clk_tx_125_i or negedge rst_clk_tx_125_n
`define RX_125_RST_MODE posedge clk_rx_125_i or negedge rst_clk_rx_125_n
 `define RST_GM_MODE posedge gm_clk or negedge gm_reset_n
 `define RST_GS_MODE posedge gs_clk or negedge gs_reset_n
 `define DWBB_RST_MODE or negedge reset_n





`define STS_WIDTH 16



`define BUFSIZE_WIDTH 11
`define DESC_READ_SIZE {3'b000,8'h10}
`define DESC_WRITE_SIZE {3'b000,8'h04}
`define TIME_WRITE_SIZE {3'b000,8'h08}
`define SIZE_BASE_MSB 10




`define WORDCNT_WIDTH 1 
`define HDRCNT_WIDTH 11



`define CORE_STATUS_WIDTH  32



`define ALT_DESC 0


`define RXCOE2 0


`define RXCOE1 0


`define TXCOE 0


`define TS_TYP2 0


`define TS_TYP1 0


`define MMCEN 0


`define PMTRWK 0


`define PMTMGK 0


`define SMAEN 1

`define PCSREG 0


`define MULTIADDR 0


`define HASHF 1

`define HD_EN 0


`define SPEED 2'b10 




`define TXD_IOW  `TXD_WIDTH
`define RXD_IOW  `RXD_WIDTH

