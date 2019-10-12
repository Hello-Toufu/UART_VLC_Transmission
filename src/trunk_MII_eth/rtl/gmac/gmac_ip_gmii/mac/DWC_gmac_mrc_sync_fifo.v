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
// File Version     :        $Revision: #10 $
//--                                                                        
//--------------------------------------------------------------------------
// MODULE:
// dwc_gmac_mrc_sync_fifo (dwc_gmac_mrc_sync_fifo.v)
//
// DESCRIPTION:
// Synchronous FIFO of data width 37 bit and 4 deep.
//--------------------------------------------------------------------------

module DWC_gmac_mrc_sync_fifo (
  // Inputs.
  clk_rx_i,
  rst_clk_rx_n,
  fifo_write_e,
  fifo_wdata,
  fifo_read_e,
  fifo_flush,
  fifo_wdata0_we,
  fifo_wdata1_we,
  fifo_wdata2_we,
  fifo_wdata3_we,

  // Outputs.
  fifo_rdata,
  fifo_empty,
  fifo_last
);

// ---------------------------------------------
// Port Declarations. ----------------------------------------
// ---------------------------------------------
input                       clk_rx_i; // Rx clock
input                       rst_clk_rx_n; // Rst synchronous to Rx clock
input                       fifo_write_e; // FIFO increment the write ptr 
input [32:0]                fifo_wdata; // FIFO write data
input                       fifo_read_e; // FIFO read enable
input                       fifo_flush; // Reset the pointers to zero.
input                       fifo_wdata0_we; // write enable for byte 0
input                       fifo_wdata1_we; // write enable for byte 1
input                       fifo_wdata2_we; // write enable for byte 2
input                       fifo_wdata3_we; // write enable for byte 3

output [32:0]               fifo_rdata; // FIFO read data
output                      fifo_empty; // FIFO is empty
output                      fifo_last; // FIFO is having only 1 location available for write.

// ---------------------------------------------
// Register Declarations. ----------------------------------------
// ---------------------------------------------

reg [`RFC_FPTRWIDTH -1:0]    wr_ptr;
reg [`RFC_FPTRWIDTH -1:0]    rd_ptr;
reg                          fifo_empty;
reg                          fifo_last;

// ---------------------------------------------
// Fifo memory Declarations. ----------------------------------------
// ---------------------------------------------

reg [32:0]                  mem [0:`RFC_FDEPTH-1]; // FIFO memory

// ---------------------------------------------
// Wire Declarations. ----------------------------------------------
// ---------------------------------------------

wire [`RFC_FPTRWIDTH -1:0]   wr_ptr_p1;
wire [`RFC_FPTRWIDTH -1:0]   rd_ptr_p1;
wire [32:0]                 fdbk_data;

// --------------------------------
// Block Instantiations. -------------------------
// --------------------------------

// fifo write logic
  always @(`RX_RST_MODE) begin
    if(!rst_clk_rx_n) begin // need to reset for all memory location 
      mem[0]  <= 33'd0;
      mem[1]  <= 33'd0;
      mem[2]  <= 33'd0;
      mem[3]  <= 33'd0;
    end
    else if (fifo_wdata0_we)
      mem[wr_ptr]  <= {fifo_wdata[32], fdbk_data[31:8], fifo_wdata[7:0]};
    else if (fifo_wdata1_we)
      mem[wr_ptr]  <= {fifo_wdata[32], fdbk_data[31:16], 
                       fifo_wdata[15:8], fdbk_data[7:0]};
    else if (fifo_wdata2_we)
      mem[wr_ptr]  <= {fifo_wdata[32], fdbk_data[31:24],
                       fifo_wdata[23:16], fdbk_data[15:0]};
    else if (fifo_wdata3_we)
      mem[wr_ptr]  <= {fifo_wdata[32], fifo_wdata[31:24], fdbk_data[23:0]};
  end

// fifo read logic
  assign fifo_rdata   = mem[rd_ptr];
  assign fdbk_data    = mem[wr_ptr];
  assign wr_ptr_p1    = wr_ptr + (`RFC_FPTRWIDTH-1'h1);
  assign rd_ptr_p1    = rd_ptr + (`RFC_FPTRWIDTH-1'h1);

  always @(`RX_RST_MODE) begin
    if(!rst_clk_rx_n)
      rd_ptr  <= {`RFC_FPTRWIDTH{`L}};
    else if (fifo_flush)
      rd_ptr  <= {`RFC_FPTRWIDTH{`L}};
    else if(fifo_read_e)
      rd_ptr  <= rd_ptr_p1;
  end

  always @(`RX_RST_MODE) begin
    if (!rst_clk_rx_n)
      wr_ptr  <= {`RFC_FPTRWIDTH{`L}};
    else if (fifo_flush)
      wr_ptr  <= {`RFC_FPTRWIDTH{`L}};
    else if(fifo_write_e)
      wr_ptr  <= wr_ptr_p1;
  end

  always @(`RX_RST_MODE)
  begin
    if (!rst_clk_rx_n)
      fifo_empty <= `H;
    else if (fifo_flush)
      fifo_empty <= `H;
    else if ((wr_ptr == rd_ptr) & fifo_write_e & !fifo_read_e)
      fifo_empty <= `L;
    else if ((rd_ptr_p1 == wr_ptr) & !fifo_write_e & fifo_read_e)
      fifo_empty <= `H;
  end


  always @(`RX_RST_MODE)
  begin
    if (!rst_clk_rx_n)
      fifo_last <= `L;
    else if (fifo_flush)
      fifo_last <= `L;
    else if (fifo_write_e | fifo_read_e)
      fifo_last <= `L;
    else if ((wr_ptr_p1 == rd_ptr) & fifo_wdata2_we)
      fifo_last <= `H;
  end

endmodule // sync_fifo
