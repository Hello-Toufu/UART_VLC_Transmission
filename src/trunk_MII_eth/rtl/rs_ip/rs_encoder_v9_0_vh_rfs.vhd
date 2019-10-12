--------------------------------------------------------------------------------
--  (c) Copyright 1995-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--------------------------------------------------------------------------------
--
-- $RCSfile: rs_encoder_v9_0_11_consts.vhd,v $ $Revision: 1.1 $ $Date: 2011/05/23 12:55:41 $
--
--------------------------------------------------------------------------------
--
-- Constants and functions for use in top level component statement.
--

library ieee;
use ieee.std_logic_1164.all;

package rs_encoder_v9_0_11_consts is


--------------------------------------------------------------------------------
--
-- Group: Top level component generic defaults
--
-- Constants:
--  
constant c_has_aclken_default                 : integer := 0;                   
constant c_has_aresetn_default                : integer := 0;                  
constant c_has_s_axis_ctrl_default            : integer := 0;           
constant c_has_s_axis_input_tuser_default     : integer := 0;       
constant c_has_m_axis_output_tuser_default    : integer := 0;       
constant c_has_m_axis_output_tready_default   : integer := 1;
constant c_s_axis_input_tdata_width_default   : integer := 8;     
constant c_s_axis_input_tuser_width_default   : integer := 1;     
constant c_s_axis_ctrl_tdata_width_default    : integer := 8;   
constant c_m_axis_output_tdata_width_default  : integer := 8;    
constant c_m_axis_output_tuser_width_default  : integer := 1;    
constant c_has_info_default                   : integer := 0;
constant c_has_r_in_default                   : integer := 0;
constant c_has_n_in_default                   : integer := 0;
constant c_gen_start_default                  : integer := 0;
constant c_h_default                          : integer := 1;
constant c_k_default                          : integer := 239;
constant c_n_default                          : integer := 255;
constant c_polynomial_default                 : integer := 0;
constant c_spec_default                       : integer := 0;
constant c_symbol_width_default               : integer := 8;
constant c_gen_poly_type_default              : integer := 0;
constant c_num_channels_default               : integer := 1;
constant c_memstyle_default                   : integer := 2; -- automatic
constant c_optimization_default               : integer := 2; -- optimize for speed
constant c_mem_init_prefix_default            : string  := "rse1";
constant c_elaboration_dir_default            : string  := "./";
constant c_xdevicefamily_default              : string  := "no_family";
constant c_family_default                     : string  := "no_family";


--------------------------------------------------------------------------------
--
-- Defaults for old top level - remove once switch to new AXI top level is complete!!!!!!!!!!!!!!!!!!!
--
--------------------------------------------------------------------------------
-- constant c_ce_default              : integer  := 0;
-- constant c_n_in_default            : integer  := 0;
-- constant c_r_in_default            : integer  := 0;
-- constant c_nd_default              : integer  := 0;
-- constant c_rdy_default             : integer  := 0;
-- constant c_rfd_default             : integer  := 0;
-- constant c_rffd_default            : integer  := 0;
-- constant c_sclr_default            : integer  := 0;
-- constant c_userpm_default          : integer  := 0; -- no longer used

--------------------------------------------------------------------------------
--
-- Group: General constants
--
-- Constants:
--
constant axi_field_factor : integer := 8; -- All sub-fields of tdata busses must be a multiple of this value


--------------------------------------------------------------------------------
--
-- Constants to define dual basis or normal basis
--
--------------------------------------------------------------------------------
constant c_spec_min : integer := 0;
constant c_spec_max : integer := 2;

subtype spec_type is integer range c_spec_min to c_spec_max;

constant j83_b_spec   : spec_type := 2;
constant ccsds_spec   : spec_type := 1;
constant custom_spec  : spec_type := 0;
constant default_spec : spec_type := custom_spec;

--------------------------------------------------------------------------------
--
-- min/max's
--
--------------------------------------------------------------------------------
constant min_s_axis_input_tdata_width  : integer := 8;
constant max_s_axis_input_tdata_width  : integer := 16;
constant min_s_axis_input_tuser_width  : integer := 1;
constant max_s_axis_input_tuser_width  : integer := 16;
constant min_s_axis_ctrl_tdata_width   : integer := 8;  -- r_in, n_in fields,
constant max_s_axis_ctrl_tdata_width   : integer := 40; --  each field rounded up to nearest multiple of 8
constant min_m_axis_output_tdata_width : integer := 8;  -- info, data_out fields,
constant max_m_axis_output_tdata_width : integer := 24; --  each field rounded up to nearest multiple of 8
constant min_m_axis_output_tuser_width : integer := min_s_axis_input_tuser_width;
constant max_m_axis_output_tuser_width : integer := max_s_axis_input_tuser_width;


constant min_symbol_width          : integer := 3;
constant max_symbol_width          : integer := 12;
constant max_symbol_width_minus_1  : integer := max_symbol_width - 1;
constant min_num_channels          : integer := 1;
constant max_num_channels          : integer := 128;
constant min_gen_start             : integer := 0;
constant max_gen_start             : integer := 1023;
constant encoder_min_n_minus_k     : integer := 2;
constant encoder_max_n_minus_k     : integer := 256;
constant encoder_min_n             : integer := 4;
constant encoder_max_n             : integer := (2**max_symbol_width) -1;
constant encoder_min_k             : integer := 2;
constant encoder_max_k             : integer := encoder_max_n - encoder_min_n_minus_k;
constant encoder_min_h             : integer := 1;
constant encoder_max_h             : integer := (2**16)-1;




--------------------------------------------------------------------------------
--
-- Function declarations
--
--------------------------------------------------------------------------------
function integer_width( integer_value : integer ) return integer;
      
end rs_encoder_v9_0_11_consts;
          
          
          
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package body rs_encoder_v9_0_11_consts is

function integer_width( integer_value : integer ) return integer is
    variable width : integer := 1;
begin
  for i in 30 downto 0 loop
    if integer_value >= 2**i then
      width := i+1;
      exit;
    end if;
  end loop;

  return width;

end integer_width;
  



end rs_encoder_v9_0_11_consts;




--------------------------------------------------------------------------------
--  (c) Copyright 1995-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--------------------------------------------------------------------------------
--
-- Description - This file contains the component declaration for
--               the top level XST file. This package allows the core
--               to be instantiated by higher level XST cores.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library rs_encoder_v9_0_11;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_consts.all;

package rs_encoder_v9_0_11_viv_comp is

--------------------------------------------------------------------------------
--core_if on component rs_encoder_v9_0_11_viv
component rs_encoder_v9_0_11_viv
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := c_has_aclken_default;                   
  C_HAS_ARESETN                : integer := c_has_aresetn_default;                  
  C_HAS_S_AXIS_CTRL            : integer := c_has_s_axis_ctrl_default;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := c_has_s_axis_input_tuser_default;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := c_has_m_axis_output_tuser_default;       
  C_HAS_M_AXIS_OUTPUT_TREADY   : integer := c_has_m_axis_output_tready_default;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := c_s_axis_input_tdata_width_default;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := c_s_axis_input_tuser_width_default;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := c_s_axis_ctrl_tdata_width_default;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := c_m_axis_output_tdata_width_default;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := c_m_axis_output_tuser_width_default;    
    
  -- AXI channel sub-field parameters
  C_HAS_INFO                   : integer := c_has_info_default; 
  C_HAS_N_IN                   : integer := c_has_n_in_default;
  C_HAS_R_IN                   : integer := c_has_r_in_default;
  
  -- Reed-Solomon code word parameters
  C_GEN_START                  : integer := c_gen_start_default;
  C_H                          : integer := c_h_default;
  C_K                          : integer := c_k_default;
  C_N                          : integer := c_n_default;
  C_POLYNOMIAL                 : integer := c_polynomial_default;
  C_SPEC                       : integer := c_spec_default;
  C_SYMBOL_WIDTH               : integer := c_symbol_width_default;
  
  -- Implementation parameters
  C_GEN_POLY_TYPE              : integer := c_gen_poly_type_default;
  C_NUM_CHANNELS               : integer := c_num_channels_default;
  C_MEMSTYLE                   : integer := c_memstyle_default;
  C_OPTIMIZATION               : integer := c_optimization_default;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string  := c_mem_init_prefix_default;
  C_ELABORATION_DIR            : string  := c_elaboration_dir_default;
  C_XDEVICEFAMILY              : string  := c_xdevicefamily_default;
  C_FAMILY                     : string  := c_family_default
);
port (
  aclk                           : in  std_logic;                                                                 
  aclken                         : in  std_logic := '1';                                                          
  aresetn                        : in  std_logic := '1';                                                          
  
  s_axis_input_tdata             : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser             : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid            : in  std_logic;                                                                 
  s_axis_input_tready            : out std_logic;                                                                 
  s_axis_input_tlast             : in  std_logic;                                                                 
    
  s_axis_ctrl_tdata              : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid             : in  std_logic := '0';                                                
  s_axis_ctrl_tready             : out std_logic;                                                                 
  
  m_axis_output_tdata            : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser            : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid           : out std_logic;                                                                 
  m_axis_output_tready           : in  std_logic := '1';                                                          
  m_axis_output_tlast            : out std_logic;                                                                 

  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
);
--core_if off
end component; -- rs_encoder_v9_0_11_viv

end rs_encoder_v9_0_11_viv_comp;
          


-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_encoder_v9_0_11/hdl/rs_encoder_pkg.vhd,v 1.2 2011/10/19 12:55:09 screaney Exp $
--------------------------------------------------------------------------------
-- Package that provides the component definitions
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library rs_encoder_v9_0_11;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_consts.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.gf_pkg.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.ul_utils.all;

package rs_encoder_pkg is


type is_primitive_vector is array(natural range <>) of integer;


function get_latency(num_channels : integer;
                     spec         : integer) return integer;


-- define function that checks if the polynomial is primitive
function field_poly_is_primitive(symbol_width : integer;
                                 field_poly   : integer ) return boolean;
                                 

--------------------------------------------------------------------------------
component j83_cell is
  generic (
    C_FAMILY             : string;
    C_XDEVICEFAMILY      : string;
    C_ELABORATION_DIR    : string;
    C_NUM_CHANNELS       : integer;
    POLYNOMIAL           : integer;
    SYMBOL_WIDTH         : symbol_width_type;
    CONSTANT_COEFFICIENT : integer;
    ALPHA_TO_SHORT       : integer_array_type;
    C_HAS_CE             : integer
  );
  port (
    reset     : in  std_logic;
    output_ce : in  std_logic;
    accum_ce  : in  std_logic;
    clk       : in  std_logic;
    init      : in  std_logic;
    extend    : in  std_logic;
    din       : in  std_logic_vector(symbol_width - 1 downto 0);
    dout      : out std_logic_vector(symbol_width - 1 downto 0)
    );
end component; -- j83_cell

component j83_encode is
  generic (
    C_FAMILY             : string;
    C_XDEVICEFAMILY      : string;
    C_ELABORATION_DIR    : string;
    C_NUM_CHANNELS       : integer;
    C_HAS_CE             : integer
  );
  port (
    reset      : in  std_logic;
    accum_ce   : in  std_logic;
    output_ce  : in  std_logic;
    clk        : in  std_logic;
    din        : in  std_logic_vector(6 downto 0);
    fd         : in  std_logic;
    extend     : in  std_logic;
    dout       : out std_logic_vector(6 downto 0)
  );
end component; -- j83_encode

component rs_encoder_axi_wrapper is
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer;                   
  C_HAS_ARESETN                : integer;                  
  C_HAS_S_AXIS_CTRL            : integer;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer;       
  C_HAS_M_AXIS_OUTPUT_TREADY   : integer;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer;    
    
  -- AXI channel sub-field parameters
  C_HAS_INFO                   : integer; 
  C_HAS_N_IN                   : integer;
  C_HAS_R_IN                   : integer;
  
  -- Reed-Solomon code word parameters
  C_GEN_START                  : integer;
  C_H                          : integer;
  C_K                          : integer;
  C_N                          : integer;
  C_POLYNOMIAL                 : integer;
  C_SPEC                       : integer;
  C_SYMBOL_WIDTH               : integer;
  
  -- Implementation parameters
  C_GEN_POLY_TYPE              : integer;
  C_NUM_CHANNELS               : integer;
  C_MEMSTYLE                   : integer;
  C_OPTIMIZATION               : integer;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string;
  C_ELABORATION_DIR            : string;
  C_EVALUATION                 : integer;
  C_XDEVICEFAMILY              : string;
  C_FAMILY                     : string );
port (
  aclk                  : in  std_logic;                                                                 
  aclken                : in  std_logic := '1';                                                          
  aresetn               : in  std_logic := '1';                                                          
  
  s_axis_input_tdata    : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser    : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid   : in  std_logic;                                                                 
  s_axis_input_tready   : out std_logic;                                                                 
  s_axis_input_tlast    : in  std_logic;                                                                 
    
  s_axis_ctrl_tdata     : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid    : in  std_logic := '0';                                                
  s_axis_ctrl_tready    : out std_logic;                                                                 
  
  m_axis_output_tdata   : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser   : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid  : out std_logic;                                                                 
  m_axis_output_tready  : in  std_logic := '1';                                                          
  m_axis_output_tlast   : out std_logic;                                                                 

  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
  
);
end component; -- rs_encoder_axi_wrapper

component rs_encoder_main is
  generic (
    C_EVALUATION      : integer;
    C_FAMILY          : string;
    C_XDEVICEFAMILY   : string;
    C_HAS_CE          : integer;
    C_HAS_N_IN        : integer;
    C_HAS_ND          : integer;
    C_HAS_R_IN        : integer;
    C_HAS_RDY         : integer;
    C_HAS_RFD         : integer;
    C_HAS_RFFD        : integer;
    C_HAS_SCLR        : integer;
    C_MEM_INIT_PREFIX : string;
    C_ELABORATION_DIR : string;
    C_SPEC            : spec_type;
    C_GEN_POLY_TYPE   : integer;
    C_GEN_START       : integer;
    C_H               : integer;
    C_K               : k_type;
    C_N               : n_type;
    C_POLYNOMIAL      : integer;
    C_NUM_CHANNELS    : integer;
    C_SYMBOL_WIDTH    : symbol_width_type;
    C_MEMSTYLE        : mem_style_type
    );
  port (
    data_in         : in  std_logic_vector(C_SYMBOL_WIDTH - 1 downto 0);
    n_in            : in  std_logic_vector(C_SYMBOL_WIDTH - 1 downto 0);
    r_in            : in  std_logic_vector(bitsneededtorepresent(C_N-C_K) - 1 downto 0);
    start           : in  std_logic;
    bypass          : in  std_logic;
    nd              : in  std_logic;
    sclr            : in  std_logic;
    in_tlast        : in  std_logic;
    data_out        : out std_logic_vector(C_SYMBOL_WIDTH - 1 downto 0);
    info            : out std_logic;
    rdy             : out std_logic;
    rfd             : out std_logic;
    rfd_din         : out std_logic;
    rffd            : out std_logic;
    rffd_din        : out std_logic;
    last_data       : out std_logic;
    last_data_tlast : out std_logic;
    event_s_input_tlast_missing    : out std_logic;
    event_s_input_tlast_unexpected : out std_logic;
    event_s_ctrl_tdata_invalid     : out std_logic;
    ce              : in  std_logic;
    clk             : in  std_logic
    );
end component; -- rs_encoder_main

end rs_encoder_pkg;


package body  rs_encoder_pkg is



-----------------------------------------------------------------------------
-- Get latency function
-- Latency is defined as number of rising clock edges from sampling DATA_IN
-- to outputting on DATA_OUT.
-- Used by GUI so place in this package that will be processed by XCC.
-----------------------------------------------------------------------------
function get_latency(num_channels : integer;
                     spec         : integer) return integer is
  variable latency: integer;
begin
  latency := 2 + num_channels;
  
  -- optimization parameter removed from version 4.1 on.
  --if optimization = 2 then        -- speed
  --  latency := 3; 
  --elsif optimization = 1 then     --area
  --  latency:=2;
  --else
  --    assert false
  --        report "Invalid optimization value" severity failure;
  --end if;
    
  if spec = ccsds_spec then -- CCSDS standard
    latency := latency + 2;
  elsif spec = j83_b_spec then
    latency := latency + 1;
  end if;
  
  assert false
    report " Reed-Solomon Encoder: " & new_line &
           " latency = " & integer'image(latency) & new_line &
           new_line
    severity note;
    
  return latency;
end get_latency;



--------------------------------------------------------------------------------
-- Define function that checks if the polynomial is primitive
--------------------------------------------------------------------------------
function field_poly_is_primitive(symbol_width : integer;
                                 field_poly   : integer ) return boolean is
  -- gfas = galois field array size
  constant  gfas   : integer := 2**symbol_width;
  constant  gfasm1 : integer := gfas - 1;
  constant  gfasm2 : integer := gfas - 2;
  constant  gfasm3 : integer := gfas - 3;
  
  variable mask         : integer := 0;   
  variable temp         : integer := 0; 
  variable alpha_to     : is_primitive_vector(0 to gfasm2);
  variable index_of     : is_primitive_vector(0 to gfasm1);
  variable is_primitive : boolean := true;

begin            
   
   --
   -- Check to see if the polynomial is valid
   --
   if (field_poly = 0) then
       --default polynomial - assume it's correct
       assert false
            report "Checking field polynomial " & new_line &
                    "note: using default field polynomial" & new_line 
            severity note;
       return true;            
   elsif (field_poly > (2**(symbol_width+1))) then
       --degree of polynomial is too high
       assert false
            report "Checking field polynomial " & new_line &
                   "ERROR: field polynomial out of range " & new_line
       severity note; 
       return false;
   end if; -- field_poly = 0
    
   --
   -- Create the Galois Field elements alpha_to(0 to symbol_width - 1)
   --
   mask := 1;
   for i in 0 to (symbol_width-1) loop
     alpha_to(i) := mask;
     mask := mask*2;
   end loop;
   -- if field_poly > 2**sw, remove msb's
   alpha_to(symbol_width) := field_poly rem gfas;
   mask := mask/2; -- reduce mask 
   --
   -- Create the remaining Galois Field elements
   --  
   for j in (symbol_width + 1) to gfasm2 loop
     if (alpha_to(j - 1) >= mask) then
       temp := 2*(alpha_to(j - 1) - mask);
       alpha_to(j) := natural_xor(field_poly, temp, symbol_width);
     else 
       alpha_to(j) := alpha_to(j - 1)*2;
     end if;  
   end loop; -- j
    
   for i in 0 to gfasm1 loop
       index_of(i) := 0;        
   end loop;
   -- Find index for each Galois Field element
   for i in 0 to gfasm2 loop
       index_of(alpha_to(i)) := i;        
   end loop;
    
   -- don't check index_of(0) as it has been set to zero
   -- don't check index_of(1) as it is always zero
   is_primitive:= true;
   for i in 2 to gfasm1 loop
     if index_of(i) = 0 then
       is_primitive := false;
     end if;
   end loop; -- i
    
   assert is_primitive = true
     report  "Checking field polynomial " & new_line &
             "ERROR: specified polynomial is not primitive for specified symbol width. " & 
             "Expect erroneous behavior!" & new_line
     severity note;
      
   assert is_primitive = false
     report "Checking field polynomial " & new_line &
            " Specified polynomial is primitive!" & new_line
     severity note;
 
    
  return is_primitive;
   
end field_poly_is_primitive;

  
end rs_encoder_pkg;



-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_encoder_v9_0_11/hdl/j83_cell.vhd,v 1.1 2011/05/23 12:55:40 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : j83_cell
-- Function : Building block for RS Encoder J.83 extension unit
--  The J.83 spec calls for a 128th symbol, even though the symbol width is only
--  7. The standard RS Encoder outputs the normal 127 symbols. These are passed
--  through this unit. The 128th is computed by this unit and output when
--  "extend" is asserted. "Init" should be asserted when the 1st symbol of the
--  block is on din.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY j83_cell IS
  GENERIC (
    c_family             : STRING;
    c_xdevicefamily      : STRING;
    c_elaboration_dir    : STRING;
    c_num_channels       : INTEGER;
    polynomial           : INTEGER;
    symbol_width         : symbol_width_type;
    constant_coefficient : INTEGER;
    alpha_to_short       : integer_array_type;
    c_has_ce             : INTEGER
  );
  PORT (
    reset     : IN  STD_LOGIC;
    output_ce : IN  STD_LOGIC;
    accum_ce  : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    init      : IN  STD_LOGIC;
    extend    : IN  STD_LOGIC;
    din       : IN  STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    dout      : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0)
    );
END j83_cell;

--------------------------------------------------------------------------------
ARCHITECTURE synth OF j83_cell IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

    
    CONSTANT gfcx : gfcx_record_type := gfcx_calc_record(symbol_width,
                                                         polynomial,
                                                         alpha_to_short,
                                                         constant_coefficient);

    SIGNAL cc        : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    SIGNAL dout_din  : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    SIGNAL ff        : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    SIGNAL ff_din    : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    SIGNAL accum_out : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    
    SIGNAL accum_ce_int  : STD_LOGIC;
    SIGNAL output_ce_int : STD_LOGIC;
    

BEGIN
   
  ------------------------------------------------------------------------------
  -- Optional CE inputs
  --
  nce: IF c_has_ce=0 GENERATE
    accum_ce_int <= '1';
    output_ce_int <= '1';
  END GENERATE; -- nce
  
  yce: IF c_has_ce/=0 GENERATE
    accum_ce_int <= accum_ce;
    output_ce_int <= output_ce;
  END GENERATE; -- yce
  
  
  
  ------------------------------------------------------------------------------
  -- Instantiate the Galois Field constant coefficient multiplier
  --
  ccm : gfcmul
  GENERIC MAP (gfcx=>gfcx, q_mode=>no_reg)
  PORT MAP (bb=>accum_out, cc=>cc, cc_reg=>OPEN); 
    
  --
  -- Instantiate syndrome mux/xor2's and registers
  -- Note that registers are only enabled at the slow clock rate
  --
  ff_din <= din WHEN init = '1' ELSE (din XOR cc);
  
  reg1 : rs_reg
  GENERIC MAP (c_width=>symbol_width, c_has_ce=>1, c_has_aclr=>1)
  PORT MAP (d=>ff_din, clk=>clk, ce=>accum_ce_int, aclr=>reset, q=>ff);
                  
  
  
  
  -- If we have multiple channels add SRL16 after ff reg
  ncg0: IF c_num_channels <= 1 GENERATE
    accum_out <= ff;
  END GENERATE; -- ncg0
  
  
  ncg1: IF c_num_channels > 1 GENERATE
  
    bd1 : big_delay
    GENERIC MAP (c_family=>c_family, c_xdevicefamily=>c_xdevicefamily,
                 c_elaboration_dir=>c_elaboration_dir,
                 bus_width=>symbol_width, clk_delay=>c_num_channels-1,
                 memstyle=>dist_mem, c_has_ce=>c_has_ce)
    PORT MAP (din=>ff, clk=>clk, ce=>accum_ce_int, dout=>accum_out);
    
  END GENERATE; -- ncg1
  
  
  
  
  ------------------------------------------------------------------------------
  -- Instantiate final output register.
  -- If "extend" is asserted then "accum_out" is output, else "din".
  -- Note that this has its own ce
  --
  dout_din <= accum_out WHEN extend = '1' ELSE din;
    
  reg2 : rs_reg
  GENERIC MAP (c_width=>symbol_width, c_has_ce=>1, c_has_aclr=>1)
  PORT MAP (d=>dout_din, clk=>clk, ce=>output_ce_int, aclr=>reset, q=>dout);
                  

END synth;






-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_encoder_v9_0_11/hdl/j83_encode.vhd,v 1.1 2011/05/23 12:55:40 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : j83_encode
-- Function : RS Encoder post-processing unit for ITU J.83 standard
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;

LIBRARY rs_encoder_v9_0_11;
USE rs_encoder_v9_0_11.rs_encoder_pkg.ALL;


ENTITY j83_encode IS
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER;
    c_has_ce          : INTEGER
  );
  PORT (
    reset      : IN  STD_LOGIC;
    accum_ce   : IN  STD_LOGIC;
    output_ce  : IN  STD_LOGIC;
    clk        : IN  STD_LOGIC;
    din        : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
    fd         : IN  STD_LOGIC;
    extend     : IN  STD_LOGIC;
    dout       : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END j83_encode;


--------------------------------------------------------------------------------
ARCHITECTURE synth OF j83_encode IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- ITU J.83 parameters
  CONSTANT symbol_width  : INTEGER := 7; -- Change din & dout if this changes
  CONSTANT polynomial    : INTEGER := 137;
  
  CONSTANT symbol_width_minus_1 : INTEGER := symbol_width-1;
  SUBTYPE  symbol_type IS STD_LOGIC_VECTOR(symbol_width_minus_1 DOWNTO 0);

  ------------------------------------------------------------------------------
  -- Create Galois field array
  CONSTANT gfas   : INTEGER := 2**symbol_width;
  CONSTANT gfasm2 : INTEGER := gfas - 2;
  
  -- GF(2^sw) element array
  CONSTANT alpha_to : integer_array_type(0 TO gfasm2) :=
                                     gf_calc_elements(symbol_width, polynomial);
  -- Get the 1st 2*symbol_width elements from alpha_to as they are all that
  -- GF multipliers need
  CONSTANT alpha_to_short : integer_array_type(0 TO 2*symbol_width-1) :=
                                                alpha_to(0 TO 2*symbol_width-1);
  
  ------------------------------------------------------------------------------
  -- Calculate the fixed coefficient value for the constant GF multiplier
  --
  CONSTANT coeff : INTEGER := alpha_to(6);

  --CONSTANT disp1 : BOOLEAN := display_int3(coeff, alpha_to(3), alpha_to(2));
  
  
--------------------------------------------------------------------------------
-- Beginning of ARCHITECTURE body.
--------------------------------------------------------------------------------
BEGIN
  
  --
  -- Instantiate the syndrome cell
  --
  sc0: j83_cell
  GENERIC MAP(
    c_family             => c_family,
    c_xdevicefamily      => c_xdevicefamily,
    c_elaboration_dir    => c_elaboration_dir,
    c_num_channels       => c_num_channels,
    polynomial           => polynomial,
    symbol_width         => symbol_width,
    constant_coefficient => coeff,
    alpha_to_short       => alpha_to_short,
    c_has_ce             => c_has_ce
  )
  PORT MAP(
    reset      => reset,
    output_ce  => output_ce,
    accum_ce   => accum_ce,
    clk        => clk,
    init       => fd,
    extend     => extend,
    din        => din,
    dout       => dout
  );
  
  
END synth;







--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES.
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_encoder_v9_0_11/hdl/rs_encoder_main.vhd,v 1.2 2011/10/19 12:55:09 screaney Exp $
--
-- Description: Reed-Solomon Encoder
--
-- Author: Bill Wilkie
--
-- Modifications : Jeffrey Graham
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library rs_encoder_v9_0_11;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_consts.all;
use rs_encoder_v9_0_11.rs_encoder_pkg.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

-- Library for primitive entities such as fdce
library unisim;
use unisim.vcomponents.all;

--library unisim;
--use unisim.vcomponents.ram64x1s; -- Required for hardware timeout


-- Port: rfd_din
--  Output. This is the input to the RFD register. It needs to be gated with other signals
--  in the AXI wrapper to disable tready if the output FIFO is full, etc. The top level tready
--  will also use a different clock enable to the RFD register in this entity.
--
-- Port: rffd_din
--  Output. This is the input to the RFFD register. It needs to be gated with other signals
--  in the AXI wrapper to disable tready if the output FIFO is full, etc. The top level tready
--  will also use a different clock enable to the RFFD register in this entity.

entity rs_encoder_main is
  generic (
    C_EVALUATION      : integer;
    C_FAMILY          : string;
    C_XDEVICEFAMILY   : string;
    C_HAS_CE          : integer;
    C_HAS_N_IN        : integer;
    C_HAS_ND          : integer;
    C_HAS_R_IN        : integer;
    C_HAS_RDY         : integer;
    C_HAS_RFD         : integer;
    C_HAS_RFFD        : integer;
    C_HAS_SCLR        : integer;
    C_MEM_INIT_PREFIX : string;
    C_ELABORATION_DIR : string;
    C_SPEC            : spec_type;
    C_GEN_POLY_TYPE   : integer;
    C_GEN_START       : integer;
    C_H               : integer;
    C_K               : k_type;
    C_N               : n_type;
    C_POLYNOMIAL      : integer;
    C_NUM_CHANNELS    : integer;
    C_SYMBOL_WIDTH    : symbol_width_type;
    C_MEMSTYLE        : mem_style_type
    );
  port (
    data_in         : in  std_logic_vector(C_SYMBOL_WIDTH - 1 downto 0);
    n_in            : in  std_logic_vector(C_SYMBOL_WIDTH - 1 downto 0);
    r_in            : in  std_logic_vector(bitsneededtorepresent(C_N-C_K) - 1 downto 0);
    start           : in  std_logic;
    bypass          : in  std_logic;
    nd              : in  std_logic;
    sclr            : in  std_logic;
    in_tlast        : in  std_logic;
    data_out        : out std_logic_vector(C_SYMBOL_WIDTH - 1 downto 0);
    info            : out std_logic;
    rdy             : out std_logic;
    rfd             : out std_logic;
    rfd_din         : out std_logic;
    rffd            : out std_logic;
    rffd_din        : out std_logic;
    last_data       : out std_logic;
    last_data_tlast : out std_logic;
    event_s_input_tlast_missing    : out std_logic;
    event_s_input_tlast_unexpected : out std_logic;
    event_s_ctrl_tdata_invalid     : out std_logic;
    ce              : in  std_logic;
    clk             : in  std_logic
    );
end rs_encoder_main;

architecture synth of rs_encoder_main is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  ------------------------------------------------------------------------------
  --
  -- constant, subtype and type declarations
  --

  -- rdy_delay is number of registers from data_out_db to final data_out
  -- 0 for normal mode
  -- 1 for J.83B
  -- 2 for CCSDS
  constant rdy_delay_tmp1 : integer := select_val_b(0, 2, (C_SPEC = ccsds_spec));

  constant rdy_delay : integer := select_val_b(rdy_delay_tmp1, 1, (C_SPEC = j83_b_spec));

  constant total_latency : integer := get_latency(C_NUM_CHANNELS, C_SPEC);


  constant c_memstyle_int : integer := select_val_b(dist_mem, block_mem,
         (not( (C_MEMSTYLE = dist_mem) or (C_MEMSTYLE = auto_mem and C_GEN_POLY_TYPE = c_variable_gen_poly_type))));



  -- Calculate derivatives of <C_SYMBOL_WIDTH> once
  constant sw      : integer := C_SYMBOL_WIDTH;
  constant swo2    : integer := sw/2;
  constant swx2    : integer := sw*2;
  constant swm1    : integer := sw - 1;
  constant swm2    : integer := sw - 2;
  constant swp1o2  : integer := (sw + 1)/2;
  -- Calculate derivatives of n minus k once
  constant nmk     : integer := C_N - C_K;
  constant nmkm1   : integer := nmk - 1;
  constant nmko2   : integer := nmk/2;
  constant nmko2p1 : integer := nmko2 + 1;
  constant nmko2p2 : integer := nmko2 + 2;
  constant nmko4   : integer := nmk/4;
  constant nmko4p1 : integer := nmko4 + 1;
  constant nmkrem4 : integer := nmk rem 4;

  constant nmkp1o2 : integer := (nmk + 1)/2;
  constant nmkm1o2 : integer := nmkp1o2 - 1;
  constant nmkp3o2 : integer := nmkp1o2 + 1;

  constant var_pw  : integer := select_val_b(nmk, nmkp1o2, (C_GEN_POLY_TYPE=c_hybrid_gen_poly_type));

  constant r_width : integer := bitsneededtorepresent(nmk);

  constant chan_count_width : integer := bitsneededtorepresent(C_NUM_CHANNELS - 1);

  constant rom_addr_width_block : integer := (r_width * 2) + 1;
  constant rom_addr_width_dist : integer := r_width;

  constant rom_addr_width : integer := select_val_b(rom_addr_width_dist,
                                                    rom_addr_width_block,
                                                    (c_memstyle_int = block_mem));

  --CONSTANT debug1 : BOOLEAN := display_int3(rom_addr_width,
  --                                          r_width,
  --                                          c_memstyle_int);

  -- J.83 Annex B requires a 128th check symbol
  constant num_check_symbols : integer := select_val_b(nmk, nmk+1, (C_SPEC = j83_b_spec));

  -- It is assumed that n=127, k=122 for J.83b, but the extra check symbol
  -- adds 1 to the final block length
  constant block_length : integer := select_val_b(C_N, C_N+1, (C_SPEC = j83_b_spec));

  -- This is how you create Galois field arrays
  constant gfas : integer := 2**C_SYMBOL_WIDTH;
  constant gfasm1 : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;
  constant gfasm3 : integer := gfas - 3;


  -- GF(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

  -- Get the first 2*C_SYMBOL_WIDTH elements from alpha_to as they are all that GF multipliers need
  constant alpha_to_short : integer_array_type(0 to 2*C_SYMBOL_WIDTH - 1) := alpha_to(0 to 2*C_SYMBOL_WIDTH - 1);

  -- GF(2^sw) index array
  constant index_of : integer_array_type(0 to gfasm1) := gf_calc_indices(C_SYMBOL_WIDTH, alpha_to);

  -- Check primitivity
  constant is_primitive : boolean := gf_check_primitivity(C_SYMBOL_WIDTH, index_of);

  -- GF(2^sw) inverse array
  constant inverse_of : integer_array_type(0 to gfasm1) := gf_calc_inverses(C_SYMBOL_WIDTH, alpha_to, index_of);



  -- finished creating Galois field arrays

  ------------------------------------------------------------------------------
  -- Function to check parameters are legal
  --
  function check_params return boolean is
  begin
    ----------------------------------------------------------------------------
    -- Check N
    --
    -- Optimized for Flexibility variable R encoder requires n to be at least 5
    assert not(C_HAS_R_IN/=0 and C_GEN_POLY_TYPE=c_variable_gen_poly_type and (C_N < 5 or C_N > gfasm1))
      report new_line &
        "ERROR: Reed-Solomon Encoder: C_N must be between 5 and " &
        "2**C_SYMBOL_WIDTH-1 when using the Optimized for Flexibility variable " &
        "check symbol Encoder." &
        new_line
      severity error;

    -- Optimized for Area variable R encoder requires n to be at least 2 * (n-k)
    assert not(C_HAS_R_IN/=0 and C_GEN_POLY_TYPE=c_hybrid_gen_poly_type and (C_N < 2*nmk or C_N > gfasm1))
      report new_line &
        "ERROR: Reed-Solomon Encoder: C_N must be between 2 * (C_N-C_K) and " &
        "2**C_SYMBOL_WIDTH-1 when using the Optimized for Area variable " &
        "check symbol Encoder." &
        new_line
      severity error;

    -- Fixed number of check symbols
    assert not(C_HAS_R_IN=0 and (C_N < 4 or C_N > gfasm1))
      report new_line &
        "ERROR: Reed-Solomon Encoder: C_N must be between 4 and " &
        "2**C_SYMBOL_WIDTH-1 when using the Fixed " &
        "check symbol Encoder." &
        new_line
      severity error;

    ----------------------------------------------------------------------------
    -- Check K
    --
    -- Variable R encoder requires k to be between 3 and (2**C_SYMBOL_WIDTH)-3
    assert not(C_HAS_R_IN/=0 and (C_K < 3 or C_K > gfasm3))
      report new_line &
        "ERROR: Reed-Solomon Encoder: C_K must be between 3 and " &
        "2**C_SYMBOL_WIDTH-3 when using the Variable check symbol Encoder." &
        new_line
      severity error;

    -- Fixed number of check symbols
    assert not(C_HAS_R_IN=0 and (C_K < 2 or C_K > gfasm3))
      report new_line &
        "ERROR: Reed-Solomon Encoder: C_K must be between 2 and " &
        "2**C_SYMBOL_WIDTH-3 when using the Fixed " &
        "check symbol Encoder." &
        new_line
      severity error;



    ----------------------------------------------------------------------------
    -- Check H
    --
    assert (get_gcd(C_H, gfasm1) = 1)
      report new_line &
       "ERROR: Reed-Solomon Encoder: h and (2^C_SYMBOL_WIDTH-1) must have " &
       "a greatest common divisor of 1" & new_line &
       "(i.e. they must be relative primes)." & new_line
       severity error;

     return true;
  end check_params;

  constant do_params_check : boolean := check_params;

  ------------------------------------------------------------------------------
  -- Hardware timeout declarations
  -- Code copied from hardware timeout module. Placed here so that hwt isn't
  -- directly instantiated, making it more obvious to security crackers.
  --
  constant clock_mhz    : real := 100.0; -- use value 0 to test = < 9000 cycles
  constant timeout_secs : real := 14400.0; -- 4hrs at 100mhz


  function calc_gcs_init return std_logic_vector is
    variable delay    : real := 0.0;
    variable d, e     : integer := 0;
    variable updates  : unsigned(63 downto 0) := (others => '0');
    variable gcs_init : std_logic_vector(63 downto 0) := (others => '0');
  begin

    -- Work out how many state updates are required. Each one takes
    -- 3*2*2^6 = 384 cycles.

    delay := timeout_secs * clock_mhz * 1000000.0 / 384.0;

    -- Get a 64-bit unsigned binary representation of it. Don't you just hate
    -- VHDL's naff numerical data types for stuff like this? Actually we'll
    -- only get ~30 significant digits this way, but that is plenty accurate.

    while delay > real(2**30) loop
      e := e + 1;
      delay := delay / 2.0;
    end loop;
    d := integer(delay);

    updates(e+29 downto e) := to_unsigned(d, 30);

    -- Subtract from maximum 64-bit value and convert to Gray code.

    updates := unsigned'(X"ffffffffffffffff") - updates;
    gcs_init :=  std_logic_vector(updates xor ("0" & updates(63 downto 1)));
    return gcs_init;

  end calc_gcs_init;

  signal y, j, d, v, cy, m, w, f, dsc : std_logic := '0';
  signal x : std_logic := '1';
  signal i : unsigned(5 downto 0) := (others => '0');
  signal gcs_do : std_logic;



  ---------------------------------------------------------------------------------------
  --
  -- Function to return the maximum number of LUTs required to
  -- implement the encoder's constant coefficient multipliers
  --
  ---------------------------------------------------------------------------------------
  function calc_max_num_luts_required(sw : integer)
    return integer is
  begin
    --
    -- these values have been hand calculated except
    -- for sw > 12 which has been guessimated !
    --
    if (sw = 8) then
      return 102;
    elsif (sw = 3) then
      return 3;
    elsif (sw = 4) then
      return 6;
    elsif (sw = 5) then
      return 15;
    elsif (sw = 6) then
      return 30;
    elsif (sw = 7) then
      return 57;
    elsif (sw = 9) then
      return 172;
    elsif (sw = 10) then
      return 281;
    elsif (sw = 11) then
      return 450;
    elsif (sw = 12) then
      return 706;
    else
      return 3000; -- should be enough !
    end if;
  end calc_max_num_luts_required;

  constant max_num_luts_required : integer := calc_max_num_luts_required(sw);

  type lut_record_type is record
    times_used      : integer;
    num_inputs      : integer;
    i0              : integer;
    i1              : integer;
    i2              : integer;
    i3              : integer;
  end record; -- lut_record_type

  type lut_array_type is array(natural range <>) of lut_record_type;

  type gc_array_type is array(0 to nmkm1) of integer; -- generator coefficients

  constant dummy : integer := 0; -- passed in to impure functions with no inputs

  ------------------------------------------------------------------------------
  --
  -- Calculate generator polynomial product coefficients:
  --
  -- (X + @**(i*h)), where i = C_GEN_START, C_GEN_START+1, ..., C_GEN_START+(n-k-1)
  --
  -- Function works for any value of C_GEN_START and h
  --
  ------------------------------------------------------------------------------
  function calc_gcs(dummy : integer)
    return gc_array_type is
    variable gc          : gc_array_type; -- generator coefficient array
    variable inner_index : integer; -- temporary variable
    variable index       : integer; -- temporary variable
    variable lalpha_to   : integer; -- local temporary variable
  begin
    -- g(x) = (x + @**(C_GEN_START*h)) initially
    gc(0) := alpha_to((C_GEN_START*C_H) rem gfasm1);

    for i in 1 to nmkm1 loop
      gc(i) := 1;
    end loop;

    for i in 2 to nmk loop
      -- multiply (gg(0) + gg(1)*x + ... + gg(i)*x**i) by (@**(g+(i-1)*h) + x),
      for j in (i - 1) downto 1 loop
        inner_index  := gc(j);
        if inner_index /= 0 then
          index := (index_of(inner_index)+(C_GEN_START+i-1)*C_H) rem gfasm1;
          lalpha_to := alpha_to(index);
          gc(j) := integer_xor(gc(j-1), lalpha_to, sw);
        else
          gc(j) := gc(j-1);
        end if;
      end loop; -- j
      -- generator(0) can never be zero
      inner_index := gc(0);
      index := (index_of(inner_index)+(C_GEN_START+i-1)*C_H) rem gfasm1;
      gc(0) := alpha_to(index);
    end loop; --i
    return gc;
  end calc_gcs;

  constant gc : gc_array_type := calc_gcs(dummy);

  ------------------------------------------------------------------------------
  --
  -- Function to calculate Galois Field constant coefficient
  -- multiplier cterm record details for each of the generator stages.
  --
  ------------------------------------------------------------------------------
  function calc_gfcx_cterm_records(sw             : integer;
                                   polynomial     : integer;
                                   gc             : gc_array_type)
    return gfcx_array_type is
    variable gfcx : gfcx_array_type(0 to nmkm1);
  begin
    for si in 0 to nmkm1 loop
      gfcx(si) := gfcx_calc_record(sw, polynomial, alpha_to_short, gc(si));
    end loop; -- si

    return gfcx;
  end calc_gfcx_cterm_records;

  constant gfcx : gfcx_array_type(0 to nmkm1) := calc_gfcx_cterm_records(sw, C_POLYNOMIAL, gc);

  ------------------------------------------------------------------------------
  --
  -- Function to calculate the actual number of LUTs required to
  -- implement the nmk Galois field constant coefficient multipliers
  --
  -- It uses a semi-global optimization algorithm to re-use LUTs that have
  -- already been created.
  --
  --    WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING !
  --
  -- EVERYTHING INSIDE THE xi FOR LOOP OF THIS FUNCTION IMPLEMENTS EXACTLY THE SAME
  -- ALGORITHM AS calc_actual_num_luts_required(). IF YOU MAKE A CHANGE TO EITHER OF
  -- THESE FUNCTIONS, MAKE SURE YOU REFLECT THE CHANGE IN THE OTHER - OTHERWISE
  -- THERE MAY BE A MISMATCH BETWEEN THE NUMBER OF LUTS EACH FUNCTION
  -- THINKS ARE REQUIRED TO IMPLEMENT THE MULTIPLIERS.
  --
  -- THIS IS THE ONLY WAY I COULD THINK OF "DYNAMICALLY" ALLOCATING JUST
  -- ENOUGH LUTS IN THE gbr RECORD.
  -- HOPEFULLY THE HIT OF HAVING TO DO THIS LUT CREATION ALGORITHM TWICE WITH
  -- BE MORE THAN COMPENSATED FOR BY HAVING A SMALLER gbr RECORD.
  -- NOTE THAT ALL THIS IS A RESULT OF ALL THE ARRAYS WITHIN A RECORD HAVING TO
  -- BE CONSTRAINED WHEN IT IS BEING DECLARED.
  --
  --    WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING !
  --
  --------------------------------------------------------------------------------
  function calc_actual_num_luts_required(gfcx : gfcx_array_type)
    return integer is
    --
    -- Create two arrays to hold the LUT input indices
    -- This should make this implementation of the algorithm faster than
    -- the version in gbr_map_cterm_to_luts() which must store this and
    -- other information in LUT records
    --
    variable lut_i0           : integer_array_type(0 to max_num_luts_required);
    variable lut_i1           : integer_array_type(0 to max_num_luts_required);
    variable li               : integer := 0; -- LUT index
    variable num_sterms       : integer := 0; -- local num_sterms
    variable xli              : integer := 0; -- another LUT index
    variable alo              : integer_array_type(0 to swm2);
    variable aterm            : integer := 0;
    variable nstltp           : integer := 0; -- num sterms left to process
    variable num_sos          : integer := 0;
    variable num_sosx4        : integer := 0;
    variable so               : integer_array_type(0 to 5); -- enough for sw < 17
    variable nls0             : integer := 0; -- (potentially) new LUT s(0)
    variable nls1             : integer := 0; -- (potentially) new LUT s(0)
    variable lii              : integer := 0; -- another LUT index for searching
    variable lut_already_exists : boolean := false;
  begin
    --
    -- Create xterm LUTs. as an example the following pairs of xterms
    -- are created for sw = 8
    --
    --  0,1 0,2 0,3 0,4 0,5 0,6 0,7
    --      1,2 1,3 1,4 1,5 1,6 1,7
    --          2,3 2,4 2,5 2,6 2,7
    --              3,4 3,5 3,6 3,7
    --                  4,5 4,6 4,7
    --                      5,6 5,7
    --                          6,7
    --
    li := 0; -- initialise LUT index
    for ai in 0 to swm2 loop
      --
      -- Initialise alo vector which is essentially a "pointer to an
      -- array of pointers" used to find efficiently which xterm LUT a
      -- pair of sterms corresponds to i.e.
      -- LUT index = alo(s(0)) + s(1) - s(0);
      --
      alo(ai) := li - 1;
      for bi in (ai + 1) to swm1 loop
        lut_i0(li) := ai;
        lut_i1(li) := bi;
        li := li + 1;
      end loop; -- bi
    end loop; -- ai
    --
    -- Examine each cterm equation of each gfcx in turn, building up required LUTs
    --
    for xi in 0 to nmkm1 loop
      for ci in 0 to swm1 loop -- cterm index
        num_sterms := gfcx(xi).cterm(ci).num_sterms;
        if (num_sterms > 4) then
          --
          -- Concatenate groups of four sterms using a LUT, then check if this LUT
          -- already exists. if not create it !
          --
          nstltp := num_sterms;
          num_sos := 0;
          while (nstltp > 3) loop
            num_sosx4 := num_sos*4;
            -- get s0 for potentially new LUT
            aterm := gfcx(xi).cterm(ci).s(num_sosx4); -- get once
            xli := alo(aterm) + gfcx(xi).cterm(ci).s(num_sosx4 + 1) - aterm;
            nls0 := xli + sw;
            -- get s1 for potentially new LUT
            aterm := gfcx(xi).cterm(ci).s(num_sosx4 + 2); -- get once
            xli := alo(aterm) + gfcx(xi).cterm(ci).s(num_sosx4 + 3) - aterm;
            nls1 := xli + sw;
             -- check if this potentially new LUT already exists
            lut_already_exists := false;
            -- initialise search LUT index,
            -- start after last xterm LUT, need to add 2 to get correct offset
            lii := alo(swm2) + 2;
            while (lii < li) loop
              if (nls0 = lut_i0(lii)) then
                if (nls1 = lut_i1(lii)) then
                  lut_already_exists := true;
                  exit;
                end if;
              end if;
              lii := lii + 1;
            end loop;
            if (lut_already_exists = true) then
              -- update suboutput array
              so(num_sos) := lii + sw;
            else
              -- create new LUT
              lut_i0(li) := nls0;
              lut_i1(li) := nls1;
              -- update suboutput array
              so(num_sos) := li + sw;
              -- get ready for next LUT
              li := li + 1;
            end if;
            num_sos := num_sos + 1;
            nstltp := nstltp - 4;
          end loop; -- nstltp > 3
          --
          -- concatenate any remaining pair of sterms
          --
          while (nstltp > 1) loop
            aterm := gfcx(xi).cterm(ci).s(num_sos*4); -- get once
            xli := alo(aterm) + gfcx(xi).cterm(ci).s(num_sos*4 + 1) - aterm;
            -- update suboutput array
            so(num_sos) :=  xli + sw;
            num_sos := num_sos + 1;
            nstltp := nstltp - 2;
          end loop;  -- nstltp > 1
          --
          -- if there are an odd number of sterms, add last one to suboutput array
          --
          if (nstltp = 1) then
            -- update suboutput array
            so(num_sos) := gfcx(xi).cterm(ci).s(num_sterms - 1);
            num_sos := num_sos + 1;
            nstltp := 0;
          end if;
          --
          -- iteratively concatenate the signals in suboutput array, starting
          -- with the last pair of signals.
          -- this simple algorithm will generate slightly deeper logic trees
          -- than really necessary, the delay through the xor's will pale into
          -- insignificance wrt routing delays !
          --
          while (num_sos > 2) loop
            -- concatenate last two so's using a (potentially) new LUT
            nls0 := so(num_sos - 2);
            nls1 := so(num_sos - 1);
            -- check if this potentially new LUT already exists
            lut_already_exists := false;
            -- initialise search LUT index,
            -- start after last xterm LUT, need to add 2 to get correct offset
            lii := alo(swm2) + 2;
            while (lii < li) loop
              if (nls0 = lut_i0(lii)) then
                if (nls1 = lut_i1(lii)) then
                  lut_already_exists := true;
                  exit;
                end if;
              end if;
              lii := lii + 1;
            end loop;
            if (lut_already_exists = true) then
              -- update suboutput array
              so(num_sos - 2) := lii + sw;
              so(num_sos - 1) := integer'low;
              num_sos := num_sos - 1;
            else
              -- create new LUT
              lut_i0(li) := nls0;
              lut_i1(li) := nls1;
              -- update suboutput array
              so(num_sos - 2) := li + sw;
              so(num_sos - 1) := integer'low;
              num_sos := num_sos - 1;
              -- get ready for next LUT
              li := li + 1;
            end if;
          end loop;
        end if;
      end loop; -- ci
    end loop; -- xi
    return li; -- actual number of LUTs required
  end calc_actual_num_luts_required;

  constant actual_num_luts_required : integer := calc_actual_num_luts_required(gfcx);
  --
  -- now actual_num_luts_required is known, create gbr record
  --
  type generator_record_type is record
    gc           : gc_array_type;
    gfcx         : gfcx_array_type(0 to nmkm1);
    lut          : lut_array_type(0 to actual_num_luts_required - 1);
    num_luts     : integer;
    num_used     : integer;
  end record; -- generator_record_type

  ------------------------------------------------------------------------------
  --
  -- Function to decompose cterm equations for constant coefficient multipliers.
  --
  -- It uses a semi-global optimization algorithm to re-use LUTs that have
  -- already been created.
  --
  --
  --    WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING !
  --
  -- EVERYTHING INSIDE THE xi FOR LOOP OF THIS FUNCTION IMPLEMENTS EXACTLY THE SAME
  -- ALGORITHM AS calc_actual_num_luts_required(). IF YOU MAKE A CHANGE TO EITHER OF
  -- THESE FUNCTIONS, MAKE SURE YOU REFLECT THE CHANGE IN THE OTHER - OTHERWISE
  -- THERE MAY BE A MISMATCH BETWEEN THE NUMBER OF LUTS EACH FUNCTION
  -- THINKS ARE REQUIRED TO IMPLEMENT THE MULTIPLIERS.
  --
  -- THIS IS THE ONLY WAY I COULD THINK OF "DYNAMICALLY" ALLOCATING JUST
  -- ENOUGH LUTS IN THE gbr RECORD.
  -- HOPEFULLY THE HIT OF HAVING TO DO THIS LUT CREATION ALGORITHM TWICE WITH
  -- BE MORE THAN COMPENSATED FOR BY HAVING A SMALLER gbr RECORD.
  -- NOTE THAT ALL THIS IS A RESULT OF ALL THE ARRAYS WITHIN A RECORD HAVING TO
  -- BE CONSTRAINED WHEN IT IS BEING DECLARED.
  --
  --    WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING ! WARNING !
  --
  ------------------------------------------------------------------------------
  function gbr_map_cterms_to_luts(initial_gbr : generator_record_type)
    return generator_record_type is
    variable gbr              : generator_record_type := initial_gbr;
    variable li               : integer := 0; -- LUT index
    variable num_sterms       : integer := 0; -- local num_sterms
    variable xli              : integer := 0; -- another LUT index
    variable alo              : integer_array_type(0 to swm2);
    variable aterm            : integer := 0;
    variable num_xterm_luts   : integer := 0;
    variable nstltp           : integer := 0; -- num sterms left to process
    variable num_sos          : integer := 0;
    variable num_sosx4        : integer := 0;
    variable so               : integer_array_type(0 to 5); -- enough for sw < 17
    variable nls0             : integer := 0; -- (potentially) new LUT s(0)
    variable nls1             : integer := 0; -- (potentially) new LUT s(0)
    variable lii              : integer := 0; -- another LUT index for searching
    variable li0, li1         : integer := 0; -- more LUT indices
    variable lut_already_exists  : boolean := false;
    variable num_hmaps_available : integer := 0;
    variable num_hmaps_remaining : integer := 0;
    variable num_hmap_columns    : integer := 0;
    variable num_fgmaps_needed   : integer := 0;
    variable num_extra_columns_needed : integer := 0;
    variable mid_width        : integer;
    variable quad_width       : integer_array_type(0 to 3);
    variable quad_threshold   : integer_array_type(0 to 2);
    constant nmkrem4          : integer := nmk rem 4;
    variable li2_start        : integer := 0;
    variable li2_stop         : integer := 0;
    variable tally            : integer := 0;
  begin
    -- initialise luts
    for liii in 0 to (actual_num_luts_required - 1) loop
      gbr.lut(liii).times_used := 0;
      gbr.lut(liii).num_inputs := 0;
      gbr.lut(liii).i0 := -1;
      gbr.lut(liii).i1 := -1;
      gbr.lut(liii).i2 := -1;
      gbr.lut(liii).i3 := -1;
    end loop; -- liii
    --
    -- create xterm LUTs. as an example the following pairs of xterms
    -- are created for sw = 8
    --
    --  0,1 0,2 0,3 0,4 0,5 0,6 0,7
    --      1,2 1,3 1,4 1,5 1,6 1,7
    --          2,3 2,4 2,5 2,6 2,7
    --              3,4 3,5 3,6 3,7
    --                  4,5 4,6 4,7
    --                      5,6 5,7
    --                          6,7
    --
    li := 0; -- initialise LUT index
    for ai in 0 to swm2 loop
    --
    -- initialise alo vector which is essentially a "pointer to an
    -- array of pointers" used to find efficiently which xterm LUT a
    -- pair of sterms corresponds to i.e.
    -- LUT index = alo(s(0)) + s(1) - s(0);
    --
      alo(ai) := li - 1;
      for bi in (ai + 1) to swm1 loop
        gbr.lut(li).times_used := 0;
        gbr.lut(li).num_inputs := 2;
        gbr.lut(li).i0 := ai;
        gbr.lut(li).i1 := bi;
        li := li + 1;
      end loop; -- bi
    end loop; -- ai
    num_xterm_luts := alo(swm2) + 2;
    --
    -- examine each cterm equation of each gfcx in turn, building up required LUTs
    --
    for xi in 0 to nmkm1 loop
      for ci in 0 to swm1 loop -- cterm index
        num_sterms := gbr.gfcx(xi).cterm(ci).num_sterms;
        if (num_sterms = 0) then
          gbr.gfcx(xi).cterm(ci).num_sos := 0;
        elsif (num_sterms = 1) then
          gbr.gfcx(xi).cterm(ci).num_sos := 1;
          gbr.gfcx(xi).cterm(ci).so(0) := gbr.gfcx(xi).cterm(ci).s(0);
        elsif (num_sterms = 2) then
          --
          -- just connect two sterms to the cterm suboutputs
          --
          gbr.gfcx(xi).cterm(ci).num_sos := 2;
          gbr.gfcx(xi).cterm(ci).so(0) := gbr.gfcx(xi).cterm(ci).s(0);
          gbr.gfcx(xi).cterm(ci).so(1) := gbr.gfcx(xi).cterm(ci).s(1);
        elsif (num_sterms = 3) then
          --
          -- find xterm LUT corresponding to .s(0 to 1), and connect its
          -- output to cterm so(0).then, connect .s(2) to cterm .so(1)
          --
          gbr.gfcx(xi).cterm(ci).num_sos := 2;
          aterm := gbr.gfcx(xi).cterm(ci).s(0); -- get once
          xli := alo(aterm) + gbr.gfcx(xi).cterm(ci).s(1) - aterm;
          gbr.gfcx(xi).cterm(ci).so(0) :=  xli + sw;
          gbr.gfcx(xi).cterm(ci).so(1) := gbr.gfcx(xi).cterm(ci).s(2);
        elsif (num_sterms = 4) then
          --
          -- connect appropriate xterm LUTs to the two cterm suboutputs
          --
          gbr.gfcx(xi).cterm(ci).num_sos := 2;
          aterm := gbr.gfcx(xi).cterm(ci).s(0); -- get once
          xli := alo(aterm) + gbr.gfcx(xi).cterm(ci).s(1) - aterm;
          gbr.gfcx(xi).cterm(ci).so(0) :=  xli + sw;
          aterm := gbr.gfcx(xi).cterm(ci).s(2); -- get once
          xli := alo(aterm) + gbr.gfcx(xi).cterm(ci).s(3) - aterm;
          gbr.gfcx(xi).cterm(ci).so(1) :=  xli + sw;
        else -- num_sterms <= sw
          --
          -- concatenate groups of four sterms using a LUT, then check if this LUT
          -- already exists. if not create it !
          --
          nstltp := num_sterms;
          num_sos := 0;
          while (nstltp > 3) loop
            num_sosx4 := num_sos*4;
            -- get s0 for potentially new LUT
            aterm := gbr.gfcx(xi).cterm(ci).s(num_sosx4); -- get once
            xli := alo(aterm) + gbr.gfcx(xi).cterm(ci).s(num_sosx4 + 1) - aterm;
            nls0 := xli + sw;
            -- get s1 for potentially new LUT
            aterm := gbr.gfcx(xi).cterm(ci).s(num_sosx4 + 2); -- get once
            xli := alo(aterm) + gbr.gfcx(xi).cterm(ci).s(num_sosx4 + 3) - aterm;
            nls1 := xli + sw;
             -- check if this potentially new LUT already exists
            lut_already_exists := false;
            -- initialise search LUT index,
            -- start after last xterm LUT, need to add 2 to get correct offset
            lii := alo(swm2) + 2;
            while (lii < li) loop
              if (nls0 = gbr.lut(lii).i0) then
                if (nls1 = gbr.lut(lii).i1) then
                  lut_already_exists := true;
                  exit;
                end if;
              end if;
              lii := lii + 1;
            end loop;
            if (lut_already_exists = true) then
              -- no need to create new LUT
              -- update suboutput array
              so(num_sos) := lii + sw;
            else
              -- create new LUT
              gbr.lut(li).num_inputs := 2;
              gbr.lut(li).i0 := nls0;
              gbr.lut(li).i1 := nls1;
              -- update suboutput array
              so(num_sos) := li + sw;
              -- get ready for next LUT
              li := li + 1;
            end if;
            num_sos := num_sos + 1;
            nstltp := nstltp - 4;
          end loop; -- nstltp > 3
          --
          -- concatenate any remaining pair of sterms
          --
          while (nstltp > 1) loop
            aterm := gbr.gfcx(xi).cterm(ci).s(num_sos*4); -- get once
            xli := alo(aterm) + gbr.gfcx(xi).cterm(ci).s(num_sos*4 + 1) - aterm;
            -- update suboutput array
            so(num_sos) :=  xli + sw;
            num_sos := num_sos + 1;
            nstltp := nstltp - 2;
          end loop;  -- nstltp > 1
          --
          -- if there are an odd number of sterms, add last one to suboutput array
          --
          if (nstltp = 1) then
            -- update suboutput array
            so(num_sos) := gbr.gfcx(xi).cterm(ci).s(num_sterms - 1);
            num_sos := num_sos + 1;
            nstltp := 0;
          end if;
          --
          -- iteratively concatenate the signals in suboutput array, starting
          -- with the last pair of signals.
          -- this simple algorithm will generate slightly deeper logic trees
          -- than really necessary, the delay through the xor's will pale into
          -- insignificance wrt routing delays !
          --
          while (num_sos > 2) loop
            -- concatenate last two so's using a (potentially) new LUT
            nls0 := so(num_sos - 2);
            nls1 := so(num_sos - 1);
            -- check if this potentially new LUT already exists
            lut_already_exists := false;
            -- initialise search LUT index,
            -- start after last xterm LUT, need to add 2 to get correct offset
            lii := alo(swm2) + 2;
            while (lii < li) loop
              if (nls0 = gbr.lut(lii).i0) then
                if (nls1 = gbr.lut(lii).i1) then
                  lut_already_exists := true;
                  exit;
                end if;
              end if;
              lii := lii + 1;
            end loop;
            if (lut_already_exists = true) then
              -- no need to create new LUT
              -- update suboutput array
              so(num_sos - 2) := lii + sw;
              so(num_sos - 1) := integer'low;
              num_sos := num_sos - 1;
            else
              -- create new LUT
              gbr.lut(li).num_inputs := 2;
              gbr.lut(li).i0 := nls0;
              gbr.lut(li).i1 := nls1;
              -- update suboutput array
              so(num_sos - 2) := li + sw;
              so(num_sos - 1) := integer'low;
              num_sos := num_sos - 1;
              -- get ready for next LUT
              li := li + 1;
            end if;
          end loop;
          -- there will be two cterm suboutputs
          gbr.gfcx(xi).cterm(ci).num_sos := 2;
          -- update these cterm suboutputs
          gbr.gfcx(xi).cterm(ci).so(0) := so(0);
          gbr.gfcx(xi).cterm(ci).so(1) := so(1);
        end if;
      end loop; -- ci
    end loop; -- xi

    -- update number of LUTs in gbr record
    gbr.num_luts := li;
    assert actual_num_luts_required = gbr.num_luts
      report "ERROR: Probable error - results from the two " &
             "calcnumluts functions don't match !"
      severity warning;

    --
    -- for a typical generator stage there are four logic levels:
    --
    --   1. fmap to generate feedback
    --   2. xor2 for an xterm
    --   3. xor2 for concatenation of constant coefficient multiplication terms
    --   4. generator stage input fmap for addition and synchronous start
    --
    -- for speed optimization, fgmap's are used to implement logic levels 2 & 3.
    -- As the fgmaps have up to four inputs, the xterm xor2 logic can be
    -- incorporated into the logic level 3 fmap thus reducing the number of
    -- logic levels to 3.
    -- Note that the xterm xor2's will probably still be required by the cterm
    -- suboutputs, but if the .times_used of an xterm xor2 reduces to zero, it
    -- will not be generated.
    --
    -- only go round this loop if there are LUTs to process !
    if (num_xterm_luts < gbr.num_luts) then
      for li2 in num_xterm_luts to (gbr.num_luts - 1) loop
        nls0 := gbr.lut(li2).i0;
        li0 := nls0 - sw;
        -- only do incorporation if li0 refers to an xterm lut
        if (li0 < num_xterm_luts) then
          nls1 := gbr.lut(li2).i1;
          -- need to check if nls1 refers to a lut output or a feedback bit
          if (nls1 < sw) then -- it refers to a feedback bit
            gbr.lut(li2).num_inputs := 3;
            gbr.lut(li2).i0 := gbr.lut(li0).i0;
            gbr.lut(li2).i1 := gbr.lut(li0).i1;
            gbr.lut(li2).i2 := nls1;
          else -- it refers to a LUT output
            li1 := nls1 - sw; -- calculate LUT number
            -- only do incorporations if li1 refers to an xterm LUT
            if (li1 < num_xterm_luts) then
              gbr.lut(li2).num_inputs := 4;
              gbr.lut(li2).i0 := gbr.lut(li0).i0;
              gbr.lut(li2).i1 := gbr.lut(li0).i1;
              gbr.lut(li2).i2 := gbr.lut(li1).i0;
              gbr.lut(li2).i3 := gbr.lut(li1).i1;
            end if;
          end if;
        end if;
      end loop; -- li2
    end if; -- (num_xterm_luts < gbr.num_luts)

    --
    -- calculate the number of times each LUT is used
    --
    for xi in 0 to nmkm1 loop
      for ci in 0 to swm1 loop
        if (gbr.gfcx(xi).cterm(ci).num_sos > 0) then
          for si in 0 to (gbr.gfcx(xi).cterm(ci).num_sos - 1) loop
            if (gbr.gfcx(xi).cterm(ci).so(si) > swm1) then
              xli := gbr.gfcx(xi).cterm(ci).so(si) - sw;
              gbr.lut(xli).times_used := gbr.lut(xli).times_used + 1;
            end if;
          end loop; -- si
        end if; -- .num_sos
      end loop; -- ci
    end loop; -- xi

    -- also need to go through concatenation LUTs to see if
    -- they use any other LUTs
    if (num_xterm_luts < gbr.num_luts) then
      for li2 in num_xterm_luts to (gbr.num_luts - 1) loop
        if (gbr.lut(li2).i0 > swm1) then
          xli := gbr.lut(li2).i0 - sw;
          gbr.lut(xli).times_used := gbr.lut(xli).times_used + 1;
        end if;
        if (gbr.lut(li2).i1 > swm1) then
          xli := gbr.lut(li2).i1 - sw;
          gbr.lut(xli).times_used := gbr.lut(xli).times_used + 1;
        end if;
        if (gbr.lut(li2).i2 > swm1) then
          xli := gbr.lut(li2).i2 - sw;
          gbr.lut(xli).times_used := gbr.lut(xli).times_used + 1;
        end if;
        if (gbr.lut(li2).i3 > swm1) then
          xli := gbr.lut(li2).i3 - sw;
          gbr.lut(xli).times_used := gbr.lut(xli).times_used + 1;
        end if;
      end loop; -- li2
    end if;

    --
    -- count how many xterm LUT2s aren't actually used
    --
    lii := 0;
    for li2 in 0 to (alo(swm2) + 1) loop
      if (gbr.lut(li2).times_used = 0) then
        lii := lii + 1;
      end if;
    end loop; -- li2
    gbr.num_used := gbr.num_luts - lii;
    return gbr;
  end gbr_map_cterms_to_luts;

  ------------------------------------------------------------------------------
  --
  -- Function to calculate generator record
  --
  ------------------------------------------------------------------------------
  function gbr_calc_record(gc   : gc_array_type;
                           gfcx : gfcx_array_type)
    return generator_record_type is
    variable gbr : generator_record_type;
  begin
    gbr.gc := gc;
    gbr.gfcx := gfcx;
    --
    -- gfcx has to be in gbr as some of its elements will be changed by
    -- gbr_map_cterms_to_luts()
    --
    gbr := gbr_map_cterms_to_luts(gbr);

    --assert false
    --  report
    --    "actual_num_luts_required = " &
    --                      integer'image(actual_num_luts_required) & new_line &
    --    "gbr.num_luts = " & integer'image(gbr.num_luts) & new_line &
    --    "gbr.num_used = " & integer'image(gbr.num_used) & new_line
    --  severity note;

    return gbr;
  end gbr_calc_record;
  --
  -- create generator block record
  --
  constant gbr : generator_record_type := gbr_calc_record(gc, gfcx);

  subtype cont_string_type is string(1 to 5);
  type cont_string_array_type is array(0 to nmkm1) of cont_string_type;



  --------------------------------------------------------------------------------
  --
  -- Construct equation for generator stage LUT
  --
  --------------------------------------------------------------------------------
--  function get_xor_eqn(width : integer)
--    return string is
--    variable eqn : string(1 to 17);
--  begin
--    if width = 0 then
--      eqn := "                 ";
--    elsif width = 1 then
--      eqn := "i0               ";
--    elsif width = 2 then
--      eqn := "i0 @ i1          ";
--    elsif width = 3 then
--      eqn := "i0 @ i1 @ i2     ";
--    elsif width = 4 then
--      eqn := "i0 @ i1 @ i2 @ i3";
--    end if; -- width = 0
--    return eqn;
--  end get_xor_eqn;


  subtype symbol_type is std_logic_vector(swm1 downto 0);
  type gs_reg_type is array(0 to nmkm1) of symbol_type;


  constant gfx_mul : gfx_record_type := gfx_calc_record(C_SYMBOL_WIDTH,
                                                        C_POLYNOMIAL,
                                                        false,
                                                        alpha_to_short);

  constant sym_count_load_val : integer := select_val_b(gfasm1, block_length-1, (C_HAS_N_IN=0));

  -- If C_HAS_N_IN then counter is always loaded with full sampled N value and
  -- then counts down, otherwise counter is loaded with 0 and counts up (this
  -- makes carry chain shorter in counter as re-loadable counter feeds load
  -- signal through inverter into CIN).
  constant sym_count_fix_done_comp_val : integer :=
     select_val_b(num_check_symbols+2, C_K-2, ((C_HAS_N_IN=0) and(C_HAS_R_IN=0)));

  constant sym_count_check_done_comp_val : integer :=
           select_val_b(2, block_length-2, ((C_HAS_N_IN=0) and (C_HAS_R_IN=0)));

  constant sym_count_var_init_comp_val : integer := num_check_symbols+nmk+2;

  -- Note sym_count_var_done_comp_val is a signal this signal depends
  -- on nmk_in.

  constant sym_count_width : integer := bitsneededtorepresent(sym_count_load_val);

  subtype sym_count_type is std_logic_vector(sym_count_width-1 downto 0);



  -- Delay by 1 less if CCSDS because dual-basis ROM has a delay of 1
  constant din_delay : integer := select_val_b(C_NUM_CHANNELS, C_NUM_CHANNELS-1, (C_SPEC=ccsds_spec));


  ------------------------------------------------------------------------------
  -- Signal declarations
  --
  signal allow_sym_count   : std_logic;
  signal not_bypass_reg    : std_logic;
  signal bypass_reg_tmp    : std_logic;

  signal chan_count : std_logic_vector(chan_count_width-1 downto 0);
  signal chan_count_ce     : std_logic;
  signal chan_count_en     : std_logic;
  signal chan_count_tc     : std_logic; -- terminal count
  signal chan_count_tc_p1  : std_logic; -- tc 1 cycle early

  signal data              : symbol_type;
  signal data_in_reg       : symbol_type;
  signal data_in_reg2      : symbol_type;

  signal data_out_db       : symbol_type;
  signal data_out_db_din   : symbol_type;

  signal core_d            : std_logic; -- for evaluation version

  signal fix_feedback      : symbol_type;
  signal var_feedback      : symbol_type;

  signal fix_check          : std_logic;
  signal fix_check_tmp      : std_logic_vector(0 downto 0);
  signal fix_check_vec      : std_logic_vector(0 downto 0);
  signal var_check          : std_logic;
  signal var_check_tmp      : std_logic_vector(0 downto 0);
  signal var_check_vec      : std_logic_vector(0 downto 0);
  signal enc_check          : std_logic;

  signal fix_check_bypass          : std_logic;
  signal fix_check_bypass_tmp      : std_logic_vector(0 downto 0);
  signal fix_check_bypass_vec      : std_logic_vector(0 downto 0);

  signal enc_enable_ce            : std_logic;
  signal enc_enable_tmp_vec       : std_logic_vector(0 downto 0);
  signal enc_enable_vec           : std_logic_vector(0 downto 0);

  signal gs_reg            : gs_reg_type;
  signal gs_reg_din        : gs_reg_type;
  signal gs_reg_tmp        : gs_reg_type;
  signal isig              : std_logic_vector( (sw + actual_num_luts_required) downto 0);

  signal deassert_fix_data_reset : std_logic;
  signal fix_data_reset          : std_logic;
  signal hyb_data_reset          : std_logic;

  signal idle              : std_logic;
  signal idle_din          : std_logic;
  signal info_dly          : std_logic;
  signal info_tmp          : std_logic;
  signal info_i            : std_logic;

  signal int_ce            : std_logic;
  signal int_nd            : std_logic;
  signal int_sclr          : std_logic;

  signal fix_rfd_tmp       : std_logic;
  signal var_rfd_tmp       : std_logic;
  signal fix_rfd_tmp_reg   : std_logic;
  signal var_rfd_tmp_reg   : std_logic;
  signal reset             : std_logic := '0'; -- async reset no longer used
  signal rfd_tmp_reg       : std_logic;
  signal rfd_tmp           : std_logic;

  signal sce_comp_val      : std_logic_vector(sym_count_width downto 0);
  signal sclr_stretch      : std_logic := '0';

  signal sym_count         : sym_count_type;
  signal sym_count_fix_done_p1  : std_logic;
  signal sym_count_fix_done     : std_logic;
  signal sym_count_var_done_p1  : std_logic;
  signal sym_count_var_done     : std_logic;
  signal sym_count_check_done      : std_logic;
  signal sym_count_check_done_p1   : std_logic;
  signal sym_count_ce      : std_logic;

  signal tc                : std_logic;
  signal valid_start       : std_logic;
  signal valid_start_reg   : std_logic;

  signal int_n_in          : symbol_type;

  signal r_int_reg         : std_logic_vector(r_width-1 downto 0);
  signal r_int_signed_reg  : std_logic_vector(r_width downto 0);
  signal r_int_p2_reg      : std_logic_vector(r_width downto 0);
  signal r_int_p2_ext_reg  : std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  signal r_rom_addr        : std_logic_vector(rom_addr_width-1 downto 0);
  signal r_int_reg_ce      : std_logic;

  signal var_mult_mode     : std_logic_vector(r_width downto 0);

  type   symbol_array_type is array (var_pw-1 downto 0) of symbol_type;
  type   symbol_array_p1_type is array (var_pw downto 0) of symbol_type;

  signal var_mult_input_vec : symbol_array_type;
  signal var_mult_input_reg : symbol_array_type;

  signal var_mult_param     : symbol_array_type;
  signal var_mult_param_reg : symbol_array_type;
  signal var_mult_out       : symbol_array_type;
  signal var_add_out        : symbol_array_type;
  signal var_add_out_din    : symbol_array_type;

  signal var_mult_param_en_ce    : std_logic_vector(var_pw-1 downto 0);
  signal var_mult_data_en        : std_logic_vector(var_pw-1 downto 0);
  signal var_mult_data_en_din    : std_logic_vector(var_pw-1 downto 0);
  signal var_mult_param_en_din   : std_logic_vector(var_pw-1 downto 0);
  signal var_mult_param_en_tmp   : std_logic_vector(var_pw-1 downto 0);

  --(GO) adding last_data_tlast - basically TLAST on output of legacy core
  signal last_data_tlast_p : std_logic := '0';
  signal last_data_i : std_logic := '0';

  signal in_tlast_d       : std_logic := '0';

  signal n_ctrl_invalid         : std_logic := '0';
  signal r_ctrl_min_invalid     : std_logic := '0';
  signal r_ctrl_max_rel_invalid : std_logic := '0';
  signal r_ctrl_max_abs_invalid : std_logic := '0';

  signal go_var_rfd_din : std_logic := '0';
  signal go_fix_rfd_din : std_logic := '0';

begin

  ------------------------------------------------------------------------------
  -- Optional Pins
  --

  -- Handle optional ce pin
  gice1 : if C_HAS_CE/=0 generate
    int_ce <= ce;
  end generate; -- gice1
  gice0 : if C_HAS_CE=0 generate
    int_ce <= '1';
  end generate; -- gice0

  -- Handle optional nd pin
  gind1 : if C_HAS_ND/=0 generate
    int_nd <= nd;
  end generate; -- gind1
  gind0 : if C_HAS_ND=0 generate
    int_nd <= '1';
  end generate; -- gind0

  -- Handle optional n_in pin
  gini1 : if C_HAS_N_IN/=0 generate
    int_n_in <= n_in;
  end generate; -- gini1
  gini0 : if C_HAS_N_IN=0 generate
    int_n_in <= natural_to_std_logic_vector(C_N, C_SYMBOL_WIDTH);
  end generate; -- gini0

  -- Generate optional rfd output
  --
  grfd1 : if C_HAS_RFD /= 0 generate
    rfd <= rfd_tmp;
  end generate; -- rfdg1




  ------------------------------------------------------------------------------
  -- Handle optional sclr pin

  -- Generate circuit to lengthen sclr pulse so that primary outputs are
  -- held in reset state until delay lines have flushed out.
  scg1 : if C_HAS_SCLR/=0 generate
    constant stretch_cycles : integer := total_latency;
  begin

    int_sclr <= sclr;

    scg1a : if stretch_cycles <= 1 generate
      sclr_stretch <= int_sclr;
    end generate; -- scg1a


    -- Create a register delay line and "or" the outputs of all the registers
    -- with sclr to generate sclr_stretch
    scg1b : if stretch_cycles > 1 and stretch_cycles <= 6 generate
      signal sclr_stretch_keep_high : std_logic_vector(stretch_cycles-1 downto 0) := (others=>'0');
    begin

      sclr_stretch_keep_high(0) <= int_sclr;

      -- Generate a register for each stretch cycle
      scg1c : for i in 1 to stretch_cycles-1 generate

        -- First stage register cannot have clock enable, as sclr overrides ce
        scg1e : if i = 1 generate
        begin
          -- Set register on sclr and reset on first ce after sclr has gone low.
          scp1 : process (clk)
          begin
            if rising_edge(clk) then

                sclr_stretch_keep_high(1) <= int_sclr or (sclr_stretch_keep_high(1) and not(int_ce));

            end if; -- rising_edge(clk)
          end process; -- scp1

        end generate; -- scg1e

        scg1f : if i /= 1 generate
        begin
          scp1a : process (clk)
          begin
            if rising_edge(clk) then

              if int_ce = '1' then
                sclr_stretch_keep_high(i) <= sclr_stretch_keep_high(i-1);
              end if; -- int_ce

            end if; -- rising_edge(clk)
          end process; -- scp1a
        end generate; -- scg1f

        -- "or" the outputs of all the sclr_stretch_keep_high registers
        -- together to generate the stretched sclr pulse.
        scp2 : process (sclr_stretch_keep_high)
          variable sclr_stretch_var : std_logic_vector(stretch_cycles-1 downto 0);
        begin
          sclr_stretch_var(0) := sclr_stretch_keep_high(0);

          for j in 1 to stretch_cycles-1 loop
            sclr_stretch_var(j) := sclr_stretch_keep_high(j) or sclr_stretch_var(j-1);
          end loop; -- j

          sclr_stretch <= sclr_stretch_var(stretch_cycles-1);
        end process; -- scp2

      end generate; -- scg1c

    end generate; -- scg1b


    -- Set an SR flip-flop (sclr_stretch_keep_high) with sclr and start
    -- counting. Reset SR FF once counter reaches stretch_cycles-2.
    -- Generate sclr_stretch by "or"ing sclr and sclr_stretch_keep_high.
    scg1d : if stretch_cycles > 6 generate
      -- Terminal count is registered so only count to stretch_cycles-3
      constant sclr_count_to        : integer := stretch_cycles-3;
      constant sclr_count_width     : integer := bitsneededtorepresent(sclr_count_to);
      signal sclr_stretch_keep_high : std_logic := '0';
      signal reset_sclr_stretch     : std_logic := '0';
      signal sclr_count             : unsigned(sclr_count_width-1 downto 0) := (others=>'0');
      signal sclr_count_ce          : std_logic;
    begin
      sclr_stretch <= int_sclr or sclr_stretch_keep_high;

      -- infer SR FF
      scp3 : process (clk)
      begin
        if rising_edge(clk) then

          -- sclr overrides ce
          sclr_stretch_keep_high <=
               int_sclr or (sclr_stretch_keep_high and not(reset_sclr_stretch and int_ce));

        end if; -- rising_edge(clk)
      end process; -- scp3


      -- Only enable counter when sclr_stretch is asserted
      sclr_count_ce <= int_ce and sclr_stretch;


      -- infer counter and terminal count comparator
      scp4 : process (clk)
      begin
        if rising_edge(clk) then

          if (int_sclr = '1') then
            sclr_count <= (others=>'0');
            reset_sclr_stretch <= '0';

          elsif sclr_count_ce = '1' then

            -- counter
            sclr_count <= sclr_count + 1;

            -- terminal count comparator
            if sclr_count = to_unsigned(sclr_count_to, sclr_count_width) then
              reset_sclr_stretch <= '1';
            else
              reset_sclr_stretch <= '0';
            end if; -- sclr_count

          end if; -- sclr_count_ce

        end if; -- rising_edge(clk)
      end process; -- scp4


    end generate; -- scg1d


  end generate; -- scg1

  scg2 : if C_HAS_SCLR=0 generate
    int_sclr     <= '0';
    sclr_stretch <= '0';
  end generate; -- scg2



  ------------------------------------------------------------------------------
  -- Create last_data marker
  ------------------------------------------------------------------------------
  gldo : if true generate
  begin

    ----------------------------------------------------------------------------
    -- Generate last_data from symbol counter terminal value flags
    ----------------------------------------------------------------------------
    gld1 : if C_NUM_CHANNELS <= 1 generate
      last_data_i <= sym_count_check_done_p1;
    end generate; -- gld1

    gld2 : if C_NUM_CHANNELS > 1 generate
      last_data_i <= sym_count_check_done;
    end generate; -- gld2

  end generate; -- gldo

  last_data <= last_data_i;
  --&&& (GO) experiment
  last_data_tlast_p <= '1' when sym_count_check_done = '1' and chan_count_tc = '1' else '0';
--  last_data_tlast_p <= '1' when last_data_i = '1' and chan_count_tc = '1' else '0';

  i_tlast_delay  : xbip_pipe_v3_0_3_viv
    generic map(
      C_LATENCY  => total_latency-1,  --the counter itself counts as 1.
      C_HAS_CE   => 1,
      C_HAS_SCLR => 0,                --no need, allows SRL use.
      C_WIDTH    => 1
      )
    port map(
      CLK     => clk,
      CE      => int_ce,           --same ce as core
      D(0)    => last_data_tlast_p,
      Q(0)    => last_data_tlast
      );



  ------------------------------------------------------------------------------
  -- Instantiate bypass register
  --
  ibr : fdce
  port map(clr=>reset, ce=>int_ce, c=>clk, d=>bypass, q=>bypass_reg_tmp);


  ------------------------------------------------------------------------------
  -- Instantiate symbol counter
  ------------------------------------------------------------------------------
  gscup : if ((C_HAS_N_IN = 0) and (C_HAS_R_IN = 0)) generate
    ----------------------------------------------------------------------------
    -- If both n and nmk are fixed then implement a simple up counter.
    -- if n or nmk are variable the implement a down counter with fixed comparison values.
    ----------------------------------------------------------------------------

    constant one_string         : string := int_2_logic_string(1, sym_count_width);
    constant sym_count_init_str : string := int_2_logic_string(sym_count_load_val, sym_count_width);
  begin

    -- Use addsub rather than counter because it has c_ainit_val. Needs
    -- to be initialized to end value so that sym_count_check_done is asserted
    -- to prevent counter from counting after async reset.
    -- Don't need to initialize with sclr as sym_count will have no effect
    -- until the next valid_start.
    iscup : rs_addsub
    generic map(
      c_xdevicefamily => C_XDEVICEFAMILY,
      instance_name   => "iscup",
      c_a_width       => sym_count_width,
      c_b_width       => sym_count_width,
      c_out_width     => sym_count_width,
      c_latency       => 1,
      c_a_type        => c_unsigned,
      c_b_type        => c_unsigned,
      c_b_constant    => 1,
      c_b_value       => one_string,
      c_ainit_val     => sym_count_init_str,
      c_sinit_val     => sym_count_init_str,
      c_sync_enable   => c_no_override, -- not cleared by sclr
      c_has_ce        => 1,
      c_has_sclr      => 1)
    port map(
      a       => sym_count,
      b       => sym_count, -- not used
      clk     => clk,
      ce      => sym_count_ce,
      sclr    => valid_start,
      s       => sym_count);

  end generate; -- gscup

  gscdwn : if ((C_HAS_N_IN /= 0) or (C_HAS_R_IN /= 0))generate
    ----------------------------------------------------------------------------
    -- For a variable N or a varaiable R encoder core, a down-counter is used to
    -- generate the symbol counter
    ----------------------------------------------------------------------------
  begin

    -- Symbol counter - loaded with n_in at start of each new block.
    -- Don't need to initialize with sclr as sym_count will have no effect
    -- until the next valid_start.
    iscdwn : rs_counter
    generic map (
      c_xdevicefamily => C_XDEVICEFAMILY,
      c_width         => sym_count_width,
      use_count_to    => false,
      count_to        => sym_count_fix_done_comp_val, -- not used
      c_count_mode    => c_down,
      c_has_load      => 1,
      c_has_ce        => 1,
      c_has_sclr      => 0,
      c_sync_enable   => c_no_override)
    port map (
      clk  => clk,
      ce   => sym_count_ce,
      load => valid_start,
      l    => int_n_in,
      up   => '0', -- not used
      sclr => '0',
      q    => sym_count );

  end generate; -- gscdwn

  ------------------------------------------------------------------------------
  -- Variable check symbol -> r_in input
  ------------------------------------------------------------------------------
  gri : if (C_HAS_R_IN /= 0) generate

    constant r_zero_string : string := int_2_logic_string(0, r_width+1);
    constant r_two_string : string := int_2_logic_string(2, r_width+1);
    constant r_nmk_string : string := int_2_logic_string(nmk, r_width+1);
    constant r_half_comp_slv : std_logic_vector(r_width downto 0) :=
               int_2_std_logic_vector(((nmk+1)/2),r_width+1);
  begin

    ------------------------------------------------------------------------------
    -- For variable r the value for nmk is loaded when valid_start is asserted
    ------------------------------------------------------------------------------

    -- Generate ce signal to activate r_in register when valid start is detected.
    r_int_reg_ce <= valid_start and int_ce;

    -- Register to store r_in when valid start is detected.
    irir : rs_reg
    generic map (c_width=>r_width, c_has_ce=>1, c_has_aset=>1)
    port map (d=>r_in, clk=>clk, ce=>r_int_reg_ce, aset=>reset, q=>r_int_reg);


    -- Extend r_in_reg so it is correct length for adder.
    grisr: for i in r_width downto 0 generate
      grisrt: if i = r_width generate
        r_int_signed_reg(i) <= '0';
      end generate;
      grisrb: if i /= r_width generate
        r_int_signed_reg(i) <= r_int_reg(i);
      end generate;
    end generate;



    -- Determine what sort of sliding multiplier is required.
    -- If r_int_reg > nmkp1o2 then use a sliding multiplier else use variable multiplier.
    -- Does this need sinit on valid_start????? --billw ?????????????????????????????
    ivmma : rs_addsub
    generic map(
      c_xdevicefamily => C_XDEVICEFAMILY,
      instance_name   => "ivmma",
      c_a_width       => r_width+1,
      c_b_width       => r_width+1,
      c_out_width     => r_width+1,
      c_latency       => 1,
      c_a_type        => c_signed,
      c_b_type        => c_signed,
      c_add_mode      => c_sub,
      c_ainit_val     => r_zero_string,
      c_has_ce        => 1,
      c_has_sclr      => 0)
    port map(
      a       => r_half_comp_slv,
      b       => r_int_signed_reg,
      clk     => clk,
      ce      => sym_count_ce,
      s       => var_mult_mode);

    -- Note this adder must be initialized on valid_start or
    -- sym_count_var_done_p1 will not be reset in time for new block.
    ira : rs_addsub
    generic map(
      c_xdevicefamily => C_XDEVICEFAMILY,
      instance_name   => "ira",
      c_a_width       => r_width+1,
      c_b_width       => r_width+1,
      c_out_width     => r_width+1,
      c_latency       => 1,
      c_a_type        => c_unsigned,
      c_b_type        => c_unsigned,
      c_b_constant    => 1,
      c_b_value       => r_two_string,
      c_add_mode      => c_add,
--      c_sinit_val     => r_nmk_string,
      c_ainit_val     => r_nmk_string,
      c_sync_enable   => c_no_override, -- not cleared by sclr
      c_has_ce        => 1,
      c_has_sclr      => 1,
      c_has_sinit     => 0)
    port map(
      a       => r_int_signed_reg,
      b       => r_int_signed_reg,--not used
      clk     => clk,
      ce      => sym_count_ce,
      sclr    => valid_start,
--      sinit   => valid_start,
      s       => r_int_p2_reg);

  end generate; -- gri

  ------------------------------------------------------------------------------
  -- Instantiate symbol counter compare blocks
  ------------------------------------------------------------------------------

  -- Need to match the end of fixed check_symbol calculation for fixed and hybrid
  -- check_symbol generators.
  gscfdcmp : if ( (C_GEN_POLY_TYPE = c_fixed_gen_poly_type) or
                  (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) )  generate
  begin

    ------------------------------------------------------------------------------
    -- Detects when symcnt_down reaches last r cycles.
    iscfdcmp : comp_eq
    generic map (
      c_family      => C_FAMILY,
      width         => sym_count_width,
      comp_val      => sym_count_fix_done_comp_val,
      c_has_sclr    => 1,
      c_sync_enable => c_no_override, -- not cleared by sclr
      q_mode        => reg_and_no_reg )
    port map (
      i     => sym_count,
      c     => clk,
      ce    => sym_count_ce,
      sclr  => valid_start,
      reset => reset,
      o     => sym_count_fix_done_p1,
      o_reg => sym_count_fix_done
    );
  end generate; -- gscfdcmp

  -- Need to know the end of the variable check_symbol calculation for variable
  -- and hybrid check_symbol generators.
  gscvd : if ( (C_GEN_POLY_TYPE = c_variable_gen_poly_type) or
                           (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) )  generate
  begin
    ------------------------------------------------------------------------------
    -- Detects when symcnt_down reaches r_int cycles. This signal stops the check
    -- symbol calculation for the variable multiplier array. (Only required for
    -- variable R)

    -- Generate extended r_int plus 2 to match end of variable check symbol calc.
    grire : for i in sym_count_width-1 downto 0 generate
      griret : if (i > r_width) generate
        r_int_p2_ext_reg(i) <= '0';
      end generate; -- griret
      grireb : if (i <= r_width) generate
        r_int_p2_ext_reg(i) <= r_int_p2_reg(i);
      end generate; -- grireb
    end generate; -- grire

    iscvdcmp : comp_eq_var
    generic map (
      width         => sym_count_width,
      q_mode        => reg_and_no_reg,
      c_family      => C_FAMILY,
      c_sync_enable => c_no_override, -- not cleared by sclr
      c_has_sclr    => 1
    )
    port map (
      a     => sym_count,
      b     => r_int_p2_ext_reg,
      c     => clk,
      ce    => sym_count_ce,
      sclr  => valid_start,
      reset => reset,
      o     => sym_count_var_done_p1,
      o_reg => sym_count_var_done
    );

  end generate; -- gscvd


  ------------------------------------------------------------------------------
  -- Note must force sym_count_check_done low on valid start. This is necessary
  -- in case an abort occurs and the valid_start pulse occurs when
  -- sym_count_check_done_p1 = '1'. If we don't force this low then
  -- sym_count_check_done will become set after the start and remain set
  -- because "idle" will be stuck high.
  gsccvt : for i in 0 to sym_count_width-1 generate
    sce_comp_val(i) <= sym_count(i);
  end generate; -- gscecvt
  sce_comp_val(sym_count_width) <= valid_start;

  isccdpcmp: comp_eq
  generic map (
    c_family   => C_FAMILY,
    width      => sym_count_width+1,
    comp_val   => sym_count_check_done_comp_val,
    c_has_sclr => 0,
    q_mode     => no_reg )
  port map (
    i => sce_comp_val,
    o => sym_count_check_done_p1
  );



  -- <sym_count_check_done> initialized to 1
  isccdr : rs_reg_bit
  generic map (c_has_ce=>1, c_has_sset=>C_HAS_SCLR, c_ainit_val=>"1")
  port map (d=>sym_count_check_done_p1, clk=>clk, ce=>sym_count_ce, sset=>int_sclr, q=>sym_count_check_done);


  -- Only enable counters when processing a block
  allow_sym_count <= not(sym_count_check_done) and not(bypass) and
                     ((rfd_tmp and int_nd) or not(rfd_tmp));


  ------------------------------------------------------------------------------
  -- Generate rfd_tmp (always required)
  --
  grfdtmp1 : if C_NUM_CHANNELS <= 1 generate
  begin

    gfrfdtmp1 : if ( (C_GEN_POLY_TYPE = c_fixed_gen_poly_type) or
                  (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) )  generate
      signal fix_rfd_din : std_logic;
    begin

      -- Assert fix_rfd_tmp on sym_count_fix_done_p1 + valid_start.
      -- Deassert on sym_count_check_done_p1.
      fix_rfd_din <= sym_count_check_done_p1 or valid_start or
                     (not(sym_count_fix_done_p1) and fix_rfd_tmp);
      -- <rfd_din> is the same as <fix_rfd_din> except it can only change when <chan_count_en> = '1'
      -- This drives a register in the AXI wrapper that just uses the standard clock enable, so we
      -- can't use <chan_count_ce>
      go_fix_rfd_din <= ((sym_count_check_done_p1 or valid_start) and chan_count_en) or
                     (not(sym_count_fix_done_p1 and chan_count_en) and fix_rfd_tmp);


      frfdr1 : rs_reg_bit
      generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>1)
      port map (d=>fix_rfd_din, clk=>clk, ce=>chan_count_ce, sset=>int_sclr, q=>fix_rfd_tmp);

    end generate; -- gfrfdtmp1


    gvrfdtmp1 : if (C_HAS_R_IN /= 0)  generate
      signal var_rfd_din : std_logic;
    begin

      -- Assert var_rfd_tmp on sym_count_var_done_p1 + valid_start.
      -- Deassert on sym_count_check_done_p1.
      var_rfd_din <= sym_count_check_done_p1 or valid_start or
                     (not(sym_count_var_done_p1) and var_rfd_tmp);
      -- <rfd_din> is the same as <var_rfd_din> except it can only change when <chan_count_en> = '1'
      -- This drives a register in the AXI wrapper that just uses the standard clock enable, so we
      -- can't use <chan_count_ce>
      go_var_rfd_din <= ((sym_count_check_done_p1 or valid_start) and chan_count_en) or
                     (not(sym_count_var_done_p1 and chan_count_en) and var_rfd_tmp);


      vrfdr1 : rs_reg_bit
      generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>1)
      port map (d=>var_rfd_din, clk=>clk, ce=>chan_count_ce, sset=>int_sclr, q=>var_rfd_tmp);

    end generate; -- gvrfdtmp1

    -- Select appropriate rfd signal between fixed r and variable r
    grfdt0 : if (C_HAS_R_IN = 0) generate
      rfd_din <= go_fix_rfd_din;
    end generate; -- grfdt0
    grfdt1 : if (C_HAS_R_IN /= 0) generate
      rfd_din <= go_var_rfd_din;
    end generate; -- grfdt1
  end generate; -- grfdtmp1


  grfdtmp2 : if C_NUM_CHANNELS > 1 generate
    signal assert_fix_rfd : std_logic;
    signal assert_var_rfd : std_logic;
    signal fix_rfd_din    : std_logic;
  begin

    assert_fix_rfd <= (sym_count_check_done and chan_count_tc_p1) or valid_start;

    -- It is important that this reg is only enabled on sym_count_ce
    -- otherwise fix_rfd will be asserted and deasserted too early if there
    -- are multiple channels.
    -- Deasserted on sym_count_fix_done * chan_count_tc_p1
    fix_rfd_din <= assert_fix_rfd or
                   (not(sym_count_fix_done and chan_count_tc_p1) and fix_rfd_tmp);
    -- <rfd_din> is the same as <fix_rfd_din> except it can only change when <chan_count_en> = '1'
    -- This drives a register in the AXI wrapper that just uses the standard clock enable, so we
    -- can't use <chan_count_ce>
    rfd_din <= (assert_fix_rfd and chan_count_en) or
                   (not(sym_count_fix_done and chan_count_tc_p1 and chan_count_en) and fix_rfd_tmp);


    frfdr2 : rs_reg_bit
    generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>1)
    port map (d=>fix_rfd_din, clk=>clk, ce=>chan_count_ce, sset=>int_sclr, q=>fix_rfd_tmp);

  end generate; -- rfdg3

  -- Select appropriate rfd signal between fixed r and variable r
  grfdt0 : if (C_HAS_R_IN = 0) generate
    rfd_tmp <= fix_rfd_tmp;
  end generate; -- grfdt0
  grfdt1 : if (C_HAS_R_IN /= 0) generate
    rfd_tmp <= var_rfd_tmp;
  end generate; -- grfdt1




  ------------------------------------------------------------------------------
  -- Generate channel counter signals.
  --

  ----------------------------------------
  -- single channel
  --
  gcc1 : if C_NUM_CHANNELS <= 1 generate
  begin

    chan_count_tc    <= '1';
    chan_count_tc_p1 <= '1';
    sym_count_ce     <= chan_count_ce;

    chan_count_en <= valid_start or allow_sym_count;
    chan_count_ce <= chan_count_en and int_ce;

  end generate; -- gcc1

  ----------------------------------------
  -- multi-channel
  --
  gcc2: if C_NUM_CHANNELS > 1 generate

    signal chan_count_clr    : std_logic;

  begin

    -- Instantiate channel counter
    icccnt : cntre_a
    generic map(
      width         => chan_count_width,
      use_count_to  => false,
      count_to      => C_NUM_CHANNELS - 1,
      sync_reset_to => 0,
      c_family      => C_FAMILY)
    port map(
      r    => chan_count_clr,
      sclr => int_sclr,
      ce   => chan_count_ce,
      c    => clk,
      cnt  => chan_count,
      tc   => open ); -- tc handled externally


    -- Must force chan_count_tc low on valid start. This is necessary in
    -- case an abort occurs and the valid_start pulse occurs when
    -- chan_count_tc_p1 = '1'. If we don't force this low then
    -- chan_count_tc will become set after the start and remain set
    -- for an entire symbol period. This breaks "fix_data_reset" among other things.
    icccmp: comp_eq
    generic map (
      c_family      => C_FAMILY,
      width         => chan_count_width,
      comp_val      => C_NUM_CHANNELS-2,
      c_has_sclr    => 1,
      c_sync_enable => c_no_override, -- not cleared by sclr
      q_mode        => reg_and_no_reg )
    port map (
      i     => chan_count,
      c     => clk,
      ce    => chan_count_ce,
      sclr  => valid_start,
      reset => reset,
      o     => chan_count_tc_p1,
      o_reg => chan_count_tc
    );


    -- Generate clock enable for channel counter
    --
    -- In the multi-channel case chan_count must be allowed to continue
    -- for 1 more symbol period in order to correctly drive rfd, etc.
    -- <allow_sym_count> prevents counting in between blocks
    chan_count_en <= valid_start or (not(bypass) and (allow_sym_count or not(rfd_tmp)));

    chan_count_ce <= chan_count_en and int_ce;

    chan_count_clr <= valid_start or chan_count_tc;


    -- Generate clock enable for symbol counter
    -- Gate with <chan_count_tc> so symbol counter is only enabled as
    -- first symbol in a channel group is sampled.
    sym_count_ce <= (valid_start or (chan_count_tc and allow_sym_count)) and int_ce;

  end generate; -- gcc2


  ------------------------------------------------------------------------------
  -- "idle" causes data sampled in between blocks to be automatically
  -- treated like bypass data.
  -- note this now means "info" will be high in between blocks, which is
  -- a change in behavior from previous versions of this core.
  -- this prevents start from re-synchronizing the channel
  -- counter immediately and breaking "rdy" or "extend" for previous
  -- block. this can happen if a start pulse occurs a non- C_NUM_CHANNELS
  -- multiple of clock cycles after the last symbol of the previous block.

  -- Reset idle on valid_start, set on (sym_count_check_done * chan_count_tc)
  idle_din <= not(valid_start) and
              (idle or (sym_count_check_done and chan_count_tc));

  iir1 : rs_reg_bit
  generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>1)
  port map (d=>idle_din, clk=>clk, ce=>int_ce, sset=>int_sclr, q=>idle);



  not_bypass_reg <= not(bypass_reg_tmp or idle);




  ------------------------------------------------------------------------------
  -- Generate rdy and associated control signals
  grdy1 : if C_HAS_RDY /= 0 generate

    signal sample_vec : std_logic_vector(0 downto 0);
    signal sample_del : std_logic_vector(0 downto 0);
  begin

    gsvnd0 : if C_HAS_ND = 0 generate

      -- <not_bypass_reg> is now forced low in between blocks so this will force
      -- rdy low after a block is completed.
      sample_vec(0) <= not_bypass_reg;

    end generate; -- grdynd0

    gsvnd1 : if C_HAS_ND /= 0 generate
      signal nd_reg : std_logic;
    begin

      indr : fdce
      port map(clr=>reset, ce=>int_ce, c=>clk, d=>int_nd, q=>nd_reg);


      -- Generate a pulse if valid output data has been produced.
      sample_vec(0) <= (nd_reg or not(rfd_tmp_reg)) and not_bypass_reg;

    end generate; -- gsvnd1



    -- Delay sample_vec to compensate for delay to output
    -- Note cannot be reset
    isd : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => 1,
      clk_delay         => C_NUM_CHANNELS+rdy_delay,
      memstyle          => dist_mem,
      c_has_ce          => C_HAS_CE)
    port map (
      din  => sample_vec,
      clk  => clk,
      ce   => int_ce,
      dout => sample_del );


    -- Final primary output register
    irdyr : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SCLR)
    port map (d=>sample_del(0), clk=>clk, ce=>int_ce, sclr=>sclr_stretch, q=>rdy);

  end generate; -- grdy1



  ------------------------------------------------------------------------------
  -- Generate optional rffd output.
  --
  grffd1 : if C_HAS_RFFD /= 0 generate
    signal assert_rffd       : std_logic;
    signal rffd_din_internal : std_logic;
    signal rffd_tmp          : std_logic;
  begin

    gar1 : if C_NUM_CHANNELS <= 1 generate
      assert_rffd <= sym_count_check_done_p1;
    end generate; -- gar1

    gar2 : if C_NUM_CHANNELS > 1 generate
      assert_rffd <= sym_count_check_done;
    end generate; -- gar2


    -- Assert at end of sym_count. Deassert on valid_start.
    rffd_din_internal <= not(valid_start) and
                         (rffd_tmp or (assert_rffd and chan_count_tc_p1));

    -- <rffd_din> is the same as <rffd_din_internal> except it can only change when <chan_count_en> = '1'
    -- This drives a register in the AXI wrapper that just uses the standard clock enable, so we
    -- can't use <chan_count_ce>
    rffd_din <= not(valid_start and chan_count_en) and
                (rffd_tmp or (assert_rffd and chan_count_tc_p1 and chan_count_en));


    rffdr1 : rs_reg_bit
    generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>1)
    port map (d=>rffd_din_internal, clk=>clk, ce=>chan_count_ce, sset=>int_sclr, q=>rffd_tmp);

    rffd <= rffd_tmp;

  end generate; -- grffd1



  ------------------------------------------------------------------------------
  -- "valid_start" initiates processing of a new block, regardless of whether we
  -- are in the middle of a prior block or not.
  --
  valid_start <= start and int_nd and not(bypass) and not(int_sclr);

  vsr1 : rs_reg_bit
  generic map (c_has_ce=>1, c_has_sclr=>1)
  port map (d=>valid_start, clk=>clk, ce=>int_ce, sclr=>int_sclr, q=>valid_start_reg);


  ------------------------------------------------------------------------------
  --
  -- Generate fix_check, fix_check_bypass and var_check
  --

  gfcv1 : if ( (C_GEN_POLY_TYPE = c_fixed_gen_poly_type) or
               (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) ) generate
  begin
    -- Generate fix_check
    -- Delay by C_NUM_CHANNELS-1 because gclr reg accounts for 1 delay
    ifcd : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => 1,
      clk_delay         => C_NUM_CHANNELS-1,
      memstyle          => dist_mem,
      init_to_1         => true,
      c_has_ce          => C_HAS_CE)
    port map (
      din  => fix_check_tmp,
      clk  => clk,
      ce   => int_ce,
      dout => fix_check_vec );

    fix_check <= fix_check_vec(0);

  end generate; -- gfcv1

  gfcb1 : if (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) generate
  begin

     -- delay by C_NUM_CHANNELS-1 because gclr reg accounts for 1 delay
     ifcbd : big_delay
     generic map (
       c_family          => C_FAMILY,
       c_xdevicefamily   => C_XDEVICEFAMILY,
       c_elaboration_dir => C_ELABORATION_DIR,
       bus_width         => 1,
       clk_delay         => C_NUM_CHANNELS-1,
       memstyle          => dist_mem,
       init_to_1         => true,
       c_has_ce          => C_HAS_CE)
     port map (
       din  => fix_check_bypass_tmp,
       clk  => clk,
       ce   => int_ce,
       dout => fix_check_bypass_vec );

    fix_check_bypass <= fix_check_bypass_vec(0);

  end generate; -- gfcb1

  -- generate var_check
  gvc1 : if (C_HAS_R_IN /= 0) generate
  begin

    -- delay by C_NUM_CHANNELS-1 because gclr reg accounts for 1 delay
    ivcd : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => 1,
      clk_delay         => C_NUM_CHANNELS-1,
      memstyle          => dist_mem,
      init_to_1         => true,
      c_has_ce          => C_HAS_CE)
    port map (
      din  => var_check_tmp,
      clk  => clk,
      ce   => int_ce,
      dout => var_check_vec );

    var_check <= var_check_vec(0);

  end generate; -- gvc1

  --select appropriate check signal between fixed check and variable check
  gec0 : if (C_HAS_R_IN = 0) generate
    enc_check <= fix_check;
  end generate; -- gec0
  gec1 : if (C_HAS_R_IN /= 0) generate
    enc_check <= var_check;
  end generate; -- gec1



  ------------------------------------------------------------------------------
  -- enc_enable
  --
  -- delay chan_count_ce to produce enc_enable
  ieer : rs_reg_bit
  generic map (c_has_ce=>C_HAS_CE)
  port map (d=>chan_count_ce, clk=>clk, ce=>int_ce, q=>enc_enable_tmp_vec(0));



  -- delay enc_enable
  ieed : big_delay
  generic map (
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    bus_width         => 1,
    clk_delay         => C_NUM_CHANNELS,
    memstyle          => dist_mem,
    c_has_ce          => C_HAS_CE)
  port map (
    din  => enc_enable_tmp_vec,
    clk  => clk,
    ce   => int_ce,
    dout => enc_enable_vec );


  -- force enable if fix_data_reset = '1', otherwise generator registers
  -- may not be properly reset after a bypass.
  enc_enable_ce <= (enc_enable_vec(0) or fix_data_reset) and int_ce;



  ------------------------------------------------------------------------------
  -- Generate rfd_tmp_reg signal
  -- while rfd_tmp = '1' keep calculating encoder parity bits
  --
  gfrfdr1 : if ( (C_GEN_POLY_TYPE = c_fixed_gen_poly_type) or
                  (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) )  generate
  begin
    ifrfdr : fdpe
    port map (d=>fix_rfd_tmp, c=>clk, pre=>reset, ce=>int_ce, q=>fix_rfd_tmp_reg);
  end generate; -- gfrfdr1

  grfdtr0 : if (C_HAS_R_IN = 0) generate
    rfd_tmp_reg <= fix_rfd_tmp_reg;
  end generate; -- grfdtr0

  grfdtr1 : if (C_HAS_R_IN /= 0) generate
  begin
    ivrfdtr : fdpe
    port map (d=>var_rfd_tmp, c=>clk, pre=>reset, ce=>int_ce, q=>var_rfd_tmp_reg);

    rfd_tmp_reg <= var_rfd_tmp_reg;
  end generate; -- grfdtr1


  ------------------------------------------------------------------------------
  -- LUT used in generation of gs_check
  --
  gfchkt1 : if ( (C_GEN_POLY_TYPE = c_fixed_gen_poly_type) or
                  (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) )  generate
    signal fix_check_din : std_logic;
  begin

    fix_check_din <=not(core_d) and
                    (not(not_bypass_reg) or valid_start_reg or fix_rfd_tmp_reg);

    fcr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_aset=>1)
    port map (d=>fix_check_din, clk=>clk, ce=>int_ce, aset=>reset, q=>fix_check_tmp(0));

   end generate; -- gfchkt1


  gfcbt1 : if (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) generate
    signal fix_check_bypass_din : std_logic;
  begin

    fix_check_bypass_din <= not(core_d) and
                            (valid_start_reg or fix_rfd_tmp_reg);

    fcbr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_aset=>1)
    port map (d=>fix_check_bypass_din, clk=>clk, ce=>int_ce, aset=>reset, q=>fix_check_bypass_tmp(0));

  end generate; -- gfcbt1


  gvct1 : if (C_HAS_R_IN /= 0) generate
    signal var_check_din : std_logic;
  begin

    var_check_din <= not(core_d) and
                     (not(not_bypass_reg) or valid_start_reg or var_rfd_tmp_reg);

    vcr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_aset=>1)
    port map (d=>var_check_din, clk=>clk, ce=>int_ce, aset=>reset, q=>var_check_tmp(0));


  end generate; -- gvct1

  ------------------------------------------------------------------------------
  -- Instantiate final info out
  iir : rs_reg_bit
  generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SCLR)
  port map (d=>info_tmp, clk=>clk, ce=>int_ce, sset=>sclr_stretch, q=>info_i);
  info <= info_i;                       --(GO) added to allow read of output



  ------------------------------------------------------------------------------
  -- Generate <fix_data_reset>
  --
  gfdr1: if C_NUM_CHANNELS <= 1 generate
    fix_data_reset <= valid_start_reg;
  end generate; -- gfdr1

  --  <fix_data_reset> (multi channel)
  gfdr2: if C_NUM_CHANNELS > 1 generate

    signal clr_fix_data_reset_counter : std_logic;
    signal fix_data_reset_din         : std_logic;
    signal fix_data_reset_count       : std_logic_vector(chan_count_width-1 downto 0);

  begin

    -- Clear counter on "valid_start". Keep it reset after fix_data_reset pulse.
    clr_fix_data_reset_counter <= valid_start or not(fix_data_reset);


    -- "fix_data_reset" must remain asserted for exactly num_channel cycles
    fix_data_reset_din <= valid_start or
                          (not(deassert_fix_data_reset) and fix_data_reset);

    fdrr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE)
    port map (d=>fix_data_reset_din, clk=>clk, ce=>int_ce, q=>fix_data_reset);



    -- Counter to count clock cycles after valid_start.
    -- Can't use channel counter in case nd=0 or bypass=1 immediately
    -- after start pulse. <fix_data_reset> must only be asserted for C_NUM_CHANNELS
    -- cycles. It must be low by the time the first symbol appears on "data".
    -- this counter is only required if C_HAS_ND or bypass, otherwise
    -- chan_count_tc can be used to deassert fix_data_reset.
    -- Can't simply delay valid_start because an abort may occur immediately.
    idfdrcnt : cntre_a
    generic map(
      width         => chan_count_width,
      use_count_to  => true,
      count_to      => C_NUM_CHANNELS - 1,
      sync_reset_to => 0,
      c_family      => C_FAMILY)
    port map(
      r   => clr_fix_data_reset_counter,
      ce  => int_ce,
      c   => clk,
      cnt => fix_data_reset_count, -- not used
      tc  => deassert_fix_data_reset );


  end generate; -- gfdr2

  ------------------------------------------------------------------------------
  -- Generate <hyb_data_reset>
  --
  gvdr : if (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) generate
  begin
    -- Note number of channels is always = 1 for variable r implementations
    ivdrr : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE)
    port map (d=>sym_count_fix_done, clk=>clk, ce=>int_ce, q=>hyb_data_reset);

  end generate; -- gvdr


  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  --
  -- Instantiate parity generator array
  --
  -- The parity generator array comprises an array of golois field multipiers
  -- connected to an array of galois field adders. the three possibilities for
  -- implementing the multipliers for the parity generator arrays, fixed
  -- multipliers, variable multipliers and hybrid multipliers.
  --
  ------------------------------------------------------------------------------

  ------------------------------------------------------------------------------
  -- Implementing the parity generator array using fixed gf_multipliers is
  -- efficently implemented by sharing the partial products.
  gfp : if (C_GEN_POLY_TYPE = c_fixed_gen_poly_type) generate

    stage:
    for xi in 0 to nmkm1 generate
    begin

      bit: for bi in 0 to swm1 generate
        signal i0, i1 : std_logic; -- local cterm suboutputs
        signal ldin : std_logic; -- local din
      begin
        nso0:
        if (gbr.gfcx(xi).cterm(bi).num_sos = 0) generate
        begin
          i0 <= '0';
          i1 <= '0';
        end generate; -- .num_sos = 1
        nso1:
        if (gbr.gfcx(xi).cterm(bi).num_sos = 1) generate
        begin
          i0 <= '0';
          i1 <= isig(gbr.gfcx(xi).cterm(bi).so(0));
        end generate; -- .num_sos = 1
        nso2:
        if (gbr.gfcx(xi).cterm(bi).num_sos = 2) generate
        begin
          i0 <= isig(gbr.gfcx(xi).cterm(bi).so(0));
          i1 <= isig(gbr.gfcx(xi).cterm(bi).so(1));
        end generate; -- .num_sos = 2
        -- note that first stage is special
        c0:
        if (xi = 0) generate
          ldin <= '0';
        end generate;
        -- connect previous stage output to ldin
        c:
        if (xi > 0) generate
          ldin <= gs_reg(xi - 1)(bi);
        end generate;


        -- stage bit
        gs_reg_din(xi)(bi) <= (i0 xor i1 xor ldin) and not(fix_data_reset);

        gsr1 : rs_reg_bit
        generic map (c_has_ce=>1)
        port map (d=>gs_reg_din(xi)(bi), clk=>clk, ce=>enc_enable_ce, q=>gs_reg_tmp(xi)(bi));

      end generate; -- ci


      grg1: if (C_NUM_CHANNELS <= 1) generate
        gs_reg(xi) <= gs_reg_tmp(xi);
      end generate; -- grg1


      -- add delay line for multi-channel generator register
      grg2: if (C_NUM_CHANNELS > 1) generate

        gsrd : big_delay
        generic map (c_family=>C_FAMILY,
                     c_xdevicefamily=>C_XDEVICEFAMILY,
                     c_elaboration_dir=>C_ELABORATION_DIR,
                     bus_width=>C_SYMBOL_WIDTH, clk_delay=>C_NUM_CHANNELS-1,
                     memstyle=>dist_mem, c_has_ce=>1)
        port map (din=>gs_reg_tmp(xi), clk=>clk, ce=>enc_enable_ce,
                  dout=>gs_reg(xi));

      end generate; -- grg2


    end generate; -- xi



    -- Instantiate the shared LUTs for the constant coefficient multipliers
    slg1:
    if (gbr.num_luts > 0 and gbr.num_used > 0) generate

      lg1: for li in 0 to (gbr.num_luts - 1) generate

        tg0: if (gbr.lut(li).times_used > 0) generate
          signal i0, i1, i2, i3 : std_logic;
        begin
          ni2:
          if (gbr.lut(li).num_inputs = 2) generate
          begin
            i0 <= isig(gbr.lut(li).i0);
            i1 <= isig(gbr.lut(li).i1);
            i2 <= '0';
            i3 <= '0';
          end generate; -- ni2
          ni3:
          if (gbr.lut(li).num_inputs = 3) generate
          begin
            i0 <= isig(gbr.lut(li).i0);
            i1 <= isig(gbr.lut(li).i1);
            i2 <= isig(gbr.lut(li).i2);
            i3 <= '0';
          end generate; -- ni3
          ni4:
          if (gbr.lut(li).num_inputs = 4) generate
          begin
            i0 <= isig(gbr.lut(li).i0);
            i1 <= isig(gbr.lut(li).i1);
            i2 <= isig(gbr.lut(li).i2);
            i3 <= isig(gbr.lut(li).i3);
          end generate; -- ni4

          isig(li + sw) <= i0 xor i1 xor i2 xor i3;

        end generate; -- tg0
      end generate; -- lg1
    end generate; -- slg1


    -- Select data and register it
    o: for bi in swm1 downto 0 generate
    begin
      data_out_db_din(bi) <= gs_reg(nmkm1)(bi) xor fix_feedback(bi);

      dor1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>data_out_db_din(bi), clk=>clk, ce=>int_ce, q=>data_out_db(bi));


    end generate; -- bi

    -- Generator fix_feedback block
    fb: for bi in swm1 downto 0 generate

      fix_feedback(bi) <= fix_check and (data(bi) xor gs_reg(nmkm1)(bi));

      -- copy fix_feedback bus onto internal signal (isig) bus so that
      -- appropriate LUT input/output signals can be selected using single
      -- indices
      isig(bi) <= fix_feedback(bi);
    end generate; -- fb

  end generate; -- gfp




  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Implementing the parity generator array using variable gf_multipliers is
  -- the straightforward way to implement an rs_encoder with variable nmk.
  -- Note parity generator is implemented from lsb to msb.
  gvp : if (C_GEN_POLY_TYPE = c_variable_gen_poly_type) generate
    constant c_mem_init_prefix_int : string := concatenate_strings(C_MEM_INIT_PREFIX, "_var_");
    signal r_int_reg_ext : std_logic_vector(rom_addr_width-1 downto 0);
  begin

    grire : for i in rom_addr_width-1 downto 0 generate
      griret : if i >= r_width generate
        r_int_reg_ext(i) <= '0';
      end generate;
      grireb : if i < r_width generate
        r_int_reg_ext(i) <= r_int_reg(i);
      end generate;
    end generate;

    ----------------------------------------------------------------------------
    -- Instantiate variable multiplier adder array
    gvmaa : for i in nmk-1 downto 0 generate

      -- Instantiate coefficient ROM
      ivgfr: gf_var_mult_const_rom
        generic map(
          c_addr_width      => rom_addr_width,
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_has_ce          => C_HAS_CE,
          c_memstyle        => dist_mem,
          c_mem_init_prefix => c_mem_init_prefix_int,
          c_elaboration_dir => C_ELABORATION_DIR,
          gen_start         => C_GEN_START,
          h                 => C_H,
          iteration         => i,
          nmk               => nmk,
          polynomial        => C_POLYNOMIAL,
          symbol_width      => C_SYMBOL_WIDTH
          )
        port map(
          ce                => valid_start_reg,
          clk               => clk,
          addr_in           => r_int_reg_ext,
          coeff_out         => var_mult_param(i)
          );

      -- Instantiate variable multiplier
      ivgfm : gfmul
      generic map (c_family          => C_FAMILY,
                   c_xdevicefamily   => C_XDEVICEFAMILY,
                   c_elaboration_dir => C_ELABORATION_DIR,
                   gfx               => gfx_mul,
                   q_mode            => no_reg)
      port map (   aa=>var_feedback,
                   bb=>var_mult_param(i),
                   cc=>var_mult_out(i),
                   cc_reg=>open);


      gadd0 : if i = 0 generate
        gvai : for j in swm1 downto 0 generate

          -- Instantiate adder array bit
          -- Note need to use <fix_data_reset> (var is for hybrid)
          var_add_out_din(i)(j) <= var_mult_out(i)(j) and not(fix_data_reset);

          iva1 : rs_reg_bit
          generic map (c_has_ce=>1)
          port map (d=>var_add_out_din(i)(j), clk=>clk, ce=>enc_enable_ce, q=>var_add_out(i)(j));

        end generate; -- gvai
      end generate; -- gadd0


      gadd1 : if i /= 0 generate
        gvaj : for j in swm1 downto 0 generate

          -- Instantiate adder array bit
          -- Note need to use <fix_data_reset> (var is for hybrid)
          var_add_out_din(i)(j) <= (var_add_out(i-1)(j) xor var_mult_out(i)(j))
                                   and not(fix_data_reset);

          iva2 : rs_reg_bit
          generic map (c_has_ce=>1)
          port map (d=>var_add_out_din(i)(j), clk=>clk, ce=>enc_enable_ce, q=>var_add_out(i)(j));

        end generate; -- gvai
      end generate; -- gadd1

    end generate; -- gvmaa


    ----------------------------------------------------------------------------
    -- Instantiate mult_adder array feedback and data out
    gvfb : for j in swm1 downto 0 generate

      var_feedback(j) <= var_check and (data(j) xor var_add_out(nmkm1)(j));

      data_out_db_din(j) <= var_add_out(nmkm1)(j) xor var_feedback(j);

      idor1 : rs_reg_bit
      generic map (c_has_ce=>1)
      port map (d=>data_out_db_din(j), clk=>clk, ce=>int_ce, q=>data_out_db(j));

    end generate; -- gdodb

  end generate; -- gvp





  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Implementing the parity generator array using hybrid gf_multipliers uses
  -- both fixed and variable multipliers to implement the rs_encoder with
  -- variable r.
  --
  -- Warning: the parity generator is implemented from lsb to msb.
  -- ie. the msb of the polynomial is term 0, the lsb is term nmkm1.
  ghp : if (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) generate
    constant c_mem_init_prefix_int : string := concatenate_strings(C_MEM_INIT_PREFIX, "_hyb_");

  begin

    ----------------------------------------------------------------------------
    -- Instantiated fixed-multiplier polynomial array
    stage:
    for xi in 0 to nmkm1 generate
    begin

      bit: for bi in 0 to swm1 generate
        signal i0, i1 : std_logic; -- local cterm suboutputs
        signal ldin : std_logic; -- local din
      begin
        nso0:
        if (gbr.gfcx(xi).cterm(bi).num_sos = 0) generate
        begin
          i0 <= '0';
          i1 <= '0';
        end generate; -- .num_sos = 1
        nso1:
        if (gbr.gfcx(xi).cterm(bi).num_sos = 1) generate
        begin
          i0 <= '0';
          i1 <= isig(gbr.gfcx(xi).cterm(bi).so(0));
        end generate; -- .num_sos = 1
        nso2:
        if (gbr.gfcx(xi).cterm(bi).num_sos = 2) generate
        begin
          i0 <= isig(gbr.gfcx(xi).cterm(bi).so(0));
          i1 <= isig(gbr.gfcx(xi).cterm(bi).so(1));
        end generate; -- .num_sos = 2
        -- note that first stage is special
        c0:
        if (xi = 0) generate
          ldin <= '0';
        end generate;
        -- connect previous stage output to ldin
        c:
        if (xi > 0) generate
          ldin <= gs_reg(xi - 1)(bi);
        end generate;

        -- instantiate stage bit
        gs_reg_din(xi)(bi) <= (i0 xor i1 xor ldin) and not(fix_data_reset);

        lr4 : rs_reg_bit
        generic map (c_has_ce=>1)
        port map (d=>gs_reg_din(xi)(bi), clk=>clk, ce=>enc_enable_ce, q=>gs_reg_tmp(xi)(bi));

      end generate; -- ci


      grg1: if (C_NUM_CHANNELS <= 1) generate
        gs_reg(xi) <= gs_reg_tmp(xi);
      end generate; -- grg1


      -- Add delay line for multi-channel generator register
      grg2: if (C_NUM_CHANNELS > 1) generate
      begin
        gsrd : big_delay
        generic map (c_family=>C_FAMILY,
                     c_xdevicefamily=>C_XDEVICEFAMILY,
                     c_elaboration_dir=>C_ELABORATION_DIR,
                     bus_width=>C_SYMBOL_WIDTH, clk_delay=>C_NUM_CHANNELS-1,
                     memstyle=>dist_mem, c_has_ce=>1)
        port map (din=>gs_reg_tmp(xi), clk=>clk, ce=>enc_enable_ce, dout=>gs_reg(xi));
      end generate; -- grg2

    end generate; -- xi



    -- Instantiate the shared LUTs for the constant coefficient multipliers
    slg2:
    if (gbr.num_luts > 0 and gbr.num_used > 0) generate

      lg2: for li in 0 to (gbr.num_luts - 1) generate

         tug0: if (gbr.lut(li).times_used > 0) generate
           signal i0, i1, i2, i3 : std_logic;
         begin
          ni2:
          if (gbr.lut(li).num_inputs = 2) generate
            i0 <= isig(gbr.lut(li).i0);
            i1 <= isig(gbr.lut(li).i1);
            i2 <= '0';
            i3 <= '0';
          end generate; --ni2
          ni3:
          if (gbr.lut(li).num_inputs = 3) generate
            i0 <= isig(gbr.lut(li).i0);
            i1 <= isig(gbr.lut(li).i1);
            i2 <= isig(gbr.lut(li).i2);
            i3 <= '0';
          end generate; -- ni3
          ni4:
          if (gbr.lut(li).num_inputs = 4) generate
            i0 <= isig(gbr.lut(li).i0);
            i1 <= isig(gbr.lut(li).i1);
            i2 <= isig(gbr.lut(li).i2);
            i3 <= isig(gbr.lut(li).i3);
          end generate; -- ni4


         isig(li + sw) <= i0 xor i1 xor i2 xor i3;

        end generate; -- tug0

      end generate; -- lg2
    end generate; -- slg2


    -- Generator fix_feedback block
    fb: for bi in swm1 downto 0 generate

      fix_feedback(bi) <= fix_check and (data(bi) xor gs_reg(nmkm1)(bi));

      -- Copy fix_feedback bus onto internal signal (isig) bus so that
      -- appropriate LUT input/output signals can be selected using single
      -- indices
      isig(bi) <= fix_feedback(bi);

    end generate; -- fb


    ----------------------------------------------------------------------------
    -- Instantiated variable-multiplier polynomial array (vmpa)

    --------------------------------------
    -- Variable multiplier coefficient ROM

    -- Generate variable multiplier coefficient ROM address
    gra: for i in rom_addr_width-1 downto 0 generate

      -- gen rom top
      grat: if i > 2*r_width generate
        r_rom_addr(i) <= '0';
      end generate;

      -- gen rom middle
      gram: if (i > r_width) and (i <= 2*r_width) generate
        r_rom_addr(i) <= r_int_reg(i-r_width-1);
      end generate;

      -- gen rom bottom
--       grab: if (i <= r_width) generate
--         r_rom_addr(i) <= sym_count(i);
--       end generate;

      -- <sym_count> counts down so it is ok to use the least significant
      -- r_width bits of sym_count to count the check symbols
      grab: if (i <= r_width) and (i < sym_count_width) generate
        r_rom_addr(i) <= sym_count(i);
      end generate;
      -- In some cases sym_count_width is not wider than r_width.
      -- In this case tie upper bit to 0
      grab0: if (i <= r_width) and (i >= sym_count_width) generate
        r_rom_addr(i) <= '0';
      end generate;

    end generate; -- gra

    -- Instantiate variable multiplier coefficient ROM
    igfvmrom: gf_var_mult_const_rom
    generic map(
      c_addr_width      => rom_addr_width,
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_has_ce          => 1,
      c_memstyle        => c_memstyle_int,
      c_mem_init_prefix => c_mem_init_prefix_int,
      c_elaboration_dir => C_ELABORATION_DIR,
      gen_start         => C_GEN_START,
      h                 => C_H,
      iteration         => 1,
      nmk               => nmk,
      polynomial        => C_POLYNOMIAL,
      symbol_width      => C_SYMBOL_WIDTH
      )
    port map(
      ce                => int_ce,
      clk               => clk,
      addr_in           => r_rom_addr,
      coeff_out         => var_mult_param(0)
      );

    ----------------------------------------------------------------------------
    -- Array of multiplier adder stages making up RS encoder check symbol polynomial
    gvma : for i in 0 to var_pw-1 generate
    begin

      -- Generate a variable multiplier slice.

      -- Registers to store the coefficients for the variable multipliers.
      gvmcr : if i /= var_pw-1 generate
      begin
      -- Do not need to register last parameters

        icr0 : rs_reg
        generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>1)
        port map (d=>var_mult_param(i), clk=>clk, ce=>var_mult_param_en_ce(i), q=>var_mult_param_reg(i+1));

        icr1 : rs_reg
        generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>1)
        port map (d=>var_mult_param_reg(i+1), clk=>clk, ce=>var_mult_param_en_ce(i), q=>var_mult_param(i+1));

        gvmpen0 : if (i = 0) generate

          var_mult_param_en_din(i) <= (hyb_data_reset and var_mult_mode(r_width)) or
                                      (fix_check_bypass and not(hyb_data_reset)) or
                                      var_mult_mode(r_width);

          vmpr1 : rs_reg_bit
          generic map (c_has_ce=>1)
          port map (d=>var_mult_param_en_din(i), clk=>clk, ce=>enc_enable_ce, q=>var_mult_param_en_tmp(i));

        end generate; -- gvmpen0

        gvmpen1 : if (i /= 0) generate

          var_mult_param_en_din(i) <= ((var_mult_param_en_tmp(i-1) and var_mult_mode(r_width)) or
                                      fix_check_bypass) and not(hyb_data_reset);

          vmpr2 : rs_reg_bit
          generic map (c_has_ce=>1)
          port map (d=>var_mult_param_en_din(i), clk=>clk, ce=>enc_enable_ce, q=>var_mult_param_en_tmp(i));

        end generate; -- gvmpen1


        var_mult_param_en_ce(i) <= var_mult_param_en_tmp(i) and
                                   enc_enable_ce and
                                   not(fix_check xor fix_check_bypass);

      end generate; --gvmcr

      -- Registers to store the input data for the variable multipliers.
      -- The sliding hybrid multiplier needs to delay the input data.
      gvmin: for j in swm1 downto 0 generate

        var_mult_input_vec(i)(j) <= ((var_mult_data_en(i) and var_feedback(j)) or
                                    (not(var_mult_data_en(i)) and var_mult_input_reg(i)(j))) and
                                     not(hyb_data_reset);

        vmpr3 : rs_reg_bit
        generic map (c_has_ce=>1)
        port map (d=>var_mult_input_vec(i)(j), clk=>clk, ce=>enc_enable_ce, q=>var_mult_input_reg(i)(j));
      end generate; -- gvmin


      gvmden0 : if (i = 0) generate

        var_mult_data_en_din(i) <= fix_check_bypass or
                                   not(var_mult_mode(r_width));

        vmdr1 : rs_reg_bit
        generic map (c_has_ce=>1)
        port map (d=>var_mult_data_en_din(i), clk=>clk, ce=>enc_enable_ce, q=>var_mult_data_en(i));

      end generate; -- gvmden0



      gvmen1 : if (i /= 0) generate

        var_mult_data_en_din(i) <= fix_check_bypass or var_mult_data_en(i-1);

        vmdr2 : rs_reg_bit
        generic map (c_has_ce=>1)
        port map (d=>var_mult_data_en_din(i), clk=>clk, ce=>enc_enable_ce, q=>var_mult_data_en(i));

      end generate; -- gvmen1



      ivgfm : gfmul
      generic map (c_family          => C_FAMILY,
                   c_xdevicefamily   => C_XDEVICEFAMILY,
                   c_elaboration_dir => C_ELABORATION_DIR,
                   gfx               => gfx_mul,
                   q_mode            => no_reg)
      port map (aa=>var_mult_input_vec(i),
                bb=>var_mult_param(i),
                cc=>var_mult_out(i),
                cc_reg=>open);



      -- Generate an adder slice

      -- Instantiate first slice of adder (mult_out + 0)
      gadd0 : if i = 0 generate
        ivar1 : rs_reg
        generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>1)
        port map (d=>var_mult_out(i), clk=>clk, ce=>enc_enable_ce, q=>var_add_out(i));
      end generate; -- gadd0

      -- Instantiate first slice of adder (mult_out + previous adder)
      gadd1 : if i /= 0 generate
        gvaddj : for j in swm1 downto 0 generate

          var_add_out_din(i)(j) <= (var_add_out(i-1)(j) xor var_mult_out(i)(j)) and not(hyb_data_reset);

          ivar2 : rs_reg_bit
          generic map (c_has_ce=>1)
          port map (d=>var_add_out_din(i)(j), clk=>clk, ce=>enc_enable_ce, q=>var_add_out(i)(j));

        end generate; -- gvaddj
      end generate; -- gadd1

    end generate; -- gvma



    ----------------------------------------------------------------------------
    -- Instantiate mult_adder array feedback and data out

    gvfb : for j in swm1 downto 0 generate

      var_feedback(j) <= var_check and (gs_reg(nmkm1)(j) xor data(j) xor var_add_out(var_pw-1)(j));

      data_out_db_din(j) <= data(j) when var_check = '1' else
                            (var_add_out(var_pw-1)(j) xor gs_reg(nmkm1)(j));

      ddbr1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>data_out_db_din(j), clk=>clk, ce=>int_ce, q=>data_out_db(j));

    end generate; -- gvfb

  end generate; -- ghp


  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Instantiate logic to convert from and to dual-basis symbols required
  -- for CCSDS spec.
  -- A dual-port ROM is used with the lower half storing the db->normal values
  -- (accessed by din_a) and the upper half storing the normal->db values
  -- (accessed by din_b).
  --
  db : if C_SPEC = ccsds_spec generate --use dual basis lookup table
    constant db_mif_name : string := concatenate_strings(C_MEM_INIT_PREFIX, "basis_conv.mif");

    signal data_out_reg : symbol_type;
  begin
    db1 : gf_dual_basis_rom
    generic map (
      c_width           => C_SYMBOL_WIDTH,
      c_has_dout_b      => 1,
      c_has_ena         => C_HAS_CE,
      c_has_enb         => C_HAS_CE,
      conv_data_db2     => ccsds_basis_conv_inv,
      conv_data_2db     => ccsds_basis_conv,
      mif_file_name     => db_mif_name,
      c_elaboration_dir => C_ELABORATION_DIR,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_family          => C_FAMILY)
    port map (
      ena    => int_ce,
      enb    => int_ce,
      clk    => clk,
      din_a  => data_in_reg,
      din_b  => data_out_db,
      dout_a => data_in_reg2,
      dout_b => data_out_reg );


    -- Final data output register
    dr1g : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
    port map (d=>data_out_reg, clk=>clk, ce=>int_ce, q=>data_out);



    -- Need to delay the info output by two clocks for CCSDS case
    lr2 : fdpe
    port map (d=>enc_check, c=>clk, pre=>reset, ce=>int_ce, q=>info_dly);

    lr3 : fdpe
    port map (d=>info_dly, c=>clk, pre=>reset, ce=>int_ce, q=>info_tmp);

  end generate; -- db






  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- ITU j.83 annex b requires a 128th symbol appended to end of codeword.
  -- This block generates and adds that symbol.
  --
  j83 : if C_SPEC = j83_b_spec generate

    signal accum_ce          : std_logic;
    signal allow_extend      : std_logic;
    signal extend            : std_logic;
    signal extend_din        : std_logic;
    signal enc_enable_del    : std_logic;
    signal load_accum        : std_logic;
    signal sym_count_check_done_del : std_logic_vector(0 downto 0);
    signal sym_count_check_done_vec : std_logic_vector(0 downto 0);

  begin

    ----------------------------------------------------------------------------
    -- Calculate 128th j.83 symbol
    j83e : j83_encode
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      c_num_channels    => C_NUM_CHANNELS,
      c_has_ce          => 1) -- always need to use accum_ce
    port map (
      reset     => '0', -- no longer supported
      accum_ce  => accum_ce,
      output_ce => int_ce,
      clk       => clk,
      din       => data_out_db(6 downto 0),
      fd        => load_accum,
      extend    => extend,
      dout      => data_out(6 downto 0) );




    ----------------------------------------------------------------------------
    -- Generate accum_ce
    --
    -- delay enc_enable to form ce for accumulator in j83_encode
    gsdr1 : fdce
    port map (d=>enc_enable_ce, c=>clk, clr=>reset, ce=>int_ce, q=>enc_enable_del);

    accum_ce <= enc_enable_del and int_ce;




    ----------------------------------------------------------------------------
    -- Generate signal to flag first symbol of block on data_out_db
    -- (= load_accum)
    --

    -- just delay "fix_data_reset" by 1 to generate "load_accum"
    lag1 : if C_NUM_CHANNELS <= 1 generate
      signal fix_data_reset_del1 : std_logic;
    begin

      fdr1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>fix_data_reset, clk=>clk, ce=>int_ce, q=>fix_data_reset_del1);

      fdr2 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>fix_data_reset_del1, clk=>clk, ce=>int_ce, q=>load_accum);

    end generate; -- lag1


    -- Have to detect when 1st symbol is on "data" - delay "deassert_fix_data_reset"
    -- by 1 to do this. Then have to detect when 1st symbol for the last
    -- channel is on "data" in order to deassert "load_accum". Do this by
    -- delaying "chan_count_tc". Strictly speaking we should and this with
    -- a sym_count = 0, but we can get away with just "chan_count_tc".
    lag2 : if C_NUM_CHANNELS > 1 generate
      signal chan_count_tc_vec   : std_logic_vector(0 downto 0);
      signal chan_count_tc_del   : std_logic_vector(0 downto 0);
      signal assert_load_accum   : std_logic;
      signal deassert_load_accum : std_logic;
      signal load_accum_din      : std_logic;
    begin

      -- delay chan_count_tc to generate "deassert_load_accum"
      chan_count_tc_vec(0) <= chan_count_tc;

      ctcd : big_delay
      generic map (c_family=>C_FAMILY,
                   c_xdevicefamily=>C_XDEVICEFAMILY,
                   c_elaboration_dir=>C_ELABORATION_DIR,
                   bus_width=>1, clk_delay=>C_NUM_CHANNELS+1,
                   memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
      port map (din  => chan_count_tc_vec,
                clk  => clk,
                ce   => int_ce,
                dout => chan_count_tc_del );

      deassert_load_accum <= chan_count_tc_del(0);

      -- delay "deassert_fix_data_reset" to generate "deassert_load_accum"
      fdr3 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>deassert_fix_data_reset, clk=>clk, ce=>int_ce, q=>assert_load_accum);

      load_accum_din <= assert_load_accum or
                        (not(deassert_load_accum) and load_accum);

      lar1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>load_accum_din, clk=>clk, ce=>int_ce, q=>load_accum);

    end generate; -- lag2




    ----------------------------------------------------------------------------
    -- Generate "extend" signal
    --
    -- Assert "extend" only when check is low and sym_count comes to an end.

    -- Final "extend" register
    extend_din <= not(enc_check) and allow_extend;

    exr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE)
    port map (d=>extend_din, clk=>clk, ce=>int_ce, q=>extend);


    sym_count_check_done_vec(0) <= sym_count_check_done;

    -- Delay "sym_count_check_done" to produce "allow_extend"
    -- When sym_count_check_done = '1' this tells us that the 1st channel of the
    -- 6th check symbol has been sampled on the input. "allow_extend" must
    -- go high "num_channel" cycles after this, regardless of "bypass".
    dsce : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => 1,
      clk_delay         => C_NUM_CHANNELS,
      memstyle          => dist_mem,
      c_has_ce          => C_HAS_CE)
    port map (
      din  => sym_count_check_done_vec,
      clk  => clk,
      ce   => int_ce,
      dout => sym_count_check_done_del);


    allow_extend <= sym_count_check_done_del(0);


    -- Need to delay the info output by 1 cycle to compensate for extra
    -- output register in j83_encode unit.
    ifr1 : fdpe
    port map (d=>enc_check, c=>clk, pre=>reset, ce=>int_ce, q=>info_tmp);


  end generate; -- j83


  ------------------------------------------------------------------------------
  -- Default spec
  --
  dbg4 : if C_SPEC /= ccsds_spec and C_SPEC /= j83_b_spec generate
    data_out <= data_out_db;
    info_tmp <= enc_check;
  end generate; -- dbg4


  ------------------------------------------------------------------------------
  -- Input data registers
  -- --------------------
  --

  -- Input data is registered to minimize input delays
  --
  dir: for bi in swm1 downto 0 generate
    reg1 : fdce
    port map (clr=>reset, ce=>int_ce, c=>clk, d=>data_in(bi), q=>data_in_reg(bi));
  end generate; -- dir



  -- No dual-basis ROM if not CCSDS
  drg1 : if C_SPEC /= ccsds_spec generate
    data_in_reg2 <= data_in_reg;
  end generate; -- drg1



  -- Delay data by 1 more symbol period
  dr2d : big_delay
  generic map (c_family=>C_FAMILY,
               c_xdevicefamily=>C_XDEVICEFAMILY,
               c_elaboration_dir=>C_ELABORATION_DIR,
               bus_width=>C_SYMBOL_WIDTH, clk_delay=>din_delay,
               memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
  port map (din=>data_in_reg2, clk=>clk, ce=>int_ce, dout=>data);

  ------------------------------------------------------------------------------
  -- Full version of core
  --
  -- core_d is signal to disable core - keep name slightly obscure
  evg1 : if C_EVALUATION = 0 generate
    core_d <= '0';
  end generate; -- evg1


  ------------------------------------------------------------------------------
  -- Instantiate hardware timeout for evaluation core.
  -- This will disable rfd_tmp register after a fixed number of clock cycles.
  --
  evg2 : if C_EVALUATION /= 0 generate
  begin
    ----------------------------------------------------------------------------
    -- Hardware timeout logic, copied from hardware timeout entity and placed within
    -- this file to make it less obvious than an instantiation.
    --
    -- Gray-code state RAM
    gcsram : ram64x1s
    generic map (init => to_bitvector(calc_gcs_init))
    port map (
      wclk => clk,
      o    => gcs_do,
      d    => v,
      we   => f,
      a0   => i(0), a1 => i(1), a2 => i(2), a3 => i(3), a4 => i(4), a5 => i(5)
    );

    process(clk)
      variable next_ji : unsigned(7 downto 0);
    begin
      if rising_edge(clk) then

        -- Ring counter for read/modify/write cycle (hardened against reset-skew)
        m <= not m and not w;
        w <=     m and not w;

        -- read data register for RAM output
        d <= gcs_do;

        -- invert data for writeback
        v <= not d;

        -- RAM write enable
        f <= m and j and x and not y;

        -- next counter state
        next_ji := ("0" & j & i) + (unsigned'("00000001"));

        if cy = '1' then

          -- counter overflow event resets most things.
          x <= '1';
          y <= '0';
          cy <= '0';
          j  <= '0';
          i  <= (others => '0');

        elsif w = '1' then

          -- increment counter
          i  <= next_ji(5 downto 0);
          j  <= next_ji(6);
          cy <= next_ji(7);

          -- latch up y when we see a 1 on x during the update phase
          y <= (y or (x and j));

          -- update x according to phase...
          x <= d xor (x and not j);  -- update: copy d into x; parity calc: xor d into x

        end if;

        dsc <= dsc or (cy and not y); -- timeout happens if the counter overflows and y was 0

      end if;
    end process;

    core_d <= dsc; -- disable core timeout signal

  end generate; -- evg2

  -----------------------------------------------------------------------------
  -- Event handling additions G.Old 10/11/11
  -----------------------------------------------------------------------------
  i_in_tlast_delay  : xbip_pipe_v3_0_3_viv
    generic map(
      C_LATENCY  => total_latency,  --to sync with the 'info' signal
      C_HAS_CE   => 1,
      C_HAS_SCLR => 1,
      C_WIDTH    => 1
      )
    port map(
      CLK     => clk,
      CE      => int_ce,           --same ce as core
      SCLR    => int_sclr,
      D(0)    => in_tlast,
      Q(0)    => in_tlast_d
      );

  --info is a delayed version of info_tmp except when sclr_stretch occurs.
  --the intention is to trigger on the falling edge of info_tmp as this is the
  --end of the K symbols (input data) block - i.e. when input tlast ought to occur.
  --There are registered in the AXI wrapper as they must be clock-enabled by the master CE, not the legacy core CE.
  event_s_input_tlast_missing    <= '1' when info_tmp = '0' and info_i = '1' and in_tlast_d = '0' and sclr_stretch = '0' else '0';
  event_s_input_tlast_unexpected <= '1' when in_tlast_d = '1' and not (info_tmp = '0' and info_i = '1' and sclr_stretch = '0') else '0';



  -----------------------------------------------------------------------------
  -- ctrl channel checking
  -----------------------------------------------------------------------------
  -- The range values are taken from the Block Code Settings of v8.0 Datasheet
  -- (page 16)

  fixed_n : if (C_HAS_N_IN = 0) generate
    -- if there is no control, it can't be invalid
    event_s_ctrl_tdata_invalid <= '0';
  end generate fixed_n;

  var_n : if (C_HAS_N_IN /= 0) generate
    signal n_uns : unsigned(C_SYMBOL_WIDTH-1 downto 0);
    signal r_uns : unsigned(r_width-1 downto 0);
  begin

    n_uns <= unsigned(n_in);

    fixed_r : if (C_HAS_R_IN = 0) generate
      -- R is fixed by generics at (C_N - C_K). K must be at least 2. So N must be at least (C_N - C_K) + 2.
      n_ctrl_invalid <= '1' when (n_uns < to_unsigned(2 + C_N - C_K, C_SYMBOL_WIDTH)) else '0';
      r_ctrl_min_invalid     <= '0';
      r_ctrl_max_rel_invalid <= '0';
      r_ctrl_max_abs_invalid <= '0';
    end generate fixed_r;

    var_r : if (C_HAS_R_IN /= 0) generate

      r_uns <= unsigned(r_in);

      -- R must always be at least 2.
      r_ctrl_min_invalid <= '1' when (r_uns < to_unsigned(2, r_width)) else '0';

      -- K must be at least 3, therefore R must never be greater than N-3.
      r_ctrl_max_rel_invalid <= '1' when (resize(r_uns, C_SYMBOL_WIDTH) > (n_uns - 3)) else '0';

      -- There is an absolute limit to the value of R as well
      r_cap_128 : if (C_N - C_K) >= 128 generate
        r_ctrl_max_abs_invalid <= '1' when (r_uns > to_unsigned(128, r_width)) else '0';
      end generate r_cap_128;

      r_cap_nmk : if (C_N - C_K) < 128 generate
        r_ctrl_max_abs_invalid <= '1' when (r_uns > to_unsigned(C_N - C_K, r_width)) else '0';
      end generate r_cap_nmk;

      var_poly : if (C_GEN_POLY_TYPE = c_variable_gen_poly_type) generate
        -- Flexible polynomial has minimum N of 5
        n_ctrl_invalid <= '1' when (n_uns < to_unsigned(5, C_SYMBOL_WIDTH)) else '0';
      end generate var_poly;

      hybrid_poly : if (C_GEN_POLY_TYPE = c_hybrid_gen_poly_type) generate
        -- Hybrid polynomial has minimum N of 2*(C_N - C_K)
        n_ctrl_invalid <= '1' when (n_uns < to_unsigned(2*(C_N - C_K), C_SYMBOL_WIDTH)) else '0';
      end generate hybrid_poly;

    end generate var_r;

    event_s_ctrl_tdata_invalid <= start and
      (n_ctrl_invalid or r_ctrl_min_invalid or r_ctrl_max_rel_invalid or r_ctrl_max_abs_invalid);

  end generate var_n;

-- Old invalid-ctrl detection code:
--
--   i_fixed_r: if C_HAS_R_IN = 0 generate
--     signal n_in_zeros : std_logic_vector(n_in'left downto 2) := (others => '0');
--   begin
--     n_ctrl_invalid <= '1' when n_in(n_in'left downto 2) = n_in_zeros else '0';  -- i.e. <4
--     r_ctrl_min_invalid <= '0';
--     r_ctrl_max_invalid <= '0';
--   end generate i_n_in_fixed_r;
--
--   i_flex_r: if C_HAS_R_IN = 1 generate
--   begin
--     n_ctrl_invalid <= '1' when to_integer(unsigned(n_in)) < 5 else '0';
--     r_ctrl_min_invalid <= '1' when r_in(r_in'left downto 1) = r_in_zeros else '0'; -- i.e. <2
--     r_ctrl_max_invalid <= '1' when to_integer(unsigned(r_in)) > to_integer(unsigned(n_in)) - C_K else '0';
--   end generate i_n_in_flex_r;
--
--
--   ctrl_event <= '1' when start = '1' and (n_ctrl_invalid = '1' or
--                                           r_ctrl_min_invalid = '1' or
--                                           r_ctrl_max_invalid = '1') else '0';
--
--   i_ctrl_event_delay  : xbip_pipe_v3_0_3_viv
--     generic map(
--       C_LATENCY  => 1,
--       C_HAS_CE   => 1,
--       C_HAS_SCLR => 1,
--       C_WIDTH    => 1
--       )
--     port map(
--       CLK     => clk,
--       CE      => int_ce,           --same ce as core
--       SCLR    => int_sclr,
--       D(0)    => ctrl_event,
--       Q(0)    => event_s_ctrl_tdata_invalid
--       );
--

end synth;






-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_encoder_v9_0_11/hdl/rs_encoder_axi_wrapper.vhd,v 1.2 2011/10/19 12:55:09 screaney Exp $
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: rs_encoder_axi_wrapper
--  Translate between AXI channels in top level to individual busses and control
--  signals required by <rs_encoder_main>.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Generics and ports are defined in the file for <rs_encoder_v9_0_11>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

-- AXI utils contains slave and master FIFOs
library axi_utils_v2_0_3;
use axi_utils_v2_0_3.axi_utils_v2_0_3_pkg.all;
use axi_utils_v2_0_3.axi_utils_comps.all;
use axi_utils_v2_0_3.global_util_pkg.all;

--library rs_toolbox_v9_0_3;
--use rs_toolbox_v9_0_3.util_xcc.all;
--use rs_toolbox_v9_0_3.ul_utils.all;
--use rs_toolbox_v9_0_3.toolbox_comps.all;

library rs_encoder_v9_0_11;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_consts.all;
use rs_encoder_v9_0_11.rs_encoder_pkg.all;


entity rs_encoder_axi_wrapper is
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := 0;                   
  C_HAS_ARESETN                : integer := 0;                  
  C_HAS_S_AXIS_CTRL            : integer := 0;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := 0;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := 0;       
  C_HAS_M_AXIS_OUTPUT_TREADY   : integer := 1;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := 8;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := 1;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := 8;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := 8;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := 1;    
    
  -- AXI channel sub-field parameters
  C_HAS_INFO                   : integer := 0; 
  C_HAS_N_IN                   : integer := 0;
  C_HAS_R_IN                   : integer := 0;
  
  -- Reed-Solomon code word parameters
  C_GEN_START                  : integer := 0;
  C_H                          : integer := 1;
  C_K                          : integer := 239;
  C_N                          : integer := 255;
  C_POLYNOMIAL                 : integer := 0;
  C_SPEC                       : integer := 0;
  C_SYMBOL_WIDTH               : integer := 8;
  
  -- Implementation parameters
  C_GEN_POLY_TYPE              : integer := 0;
  C_NUM_CHANNELS               : integer := 1;
  C_MEMSTYLE                   : integer := 2;
  C_OPTIMIZATION               : integer := 2;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string := "rsel";
  C_ELABORATION_DIR            : string := "./";
  C_EVALUATION                 : integer;
  C_XDEVICEFAMILY              : string := "no_family";
  C_FAMILY                     : string := "no_family"
  );
port (
  aclk                  : in  std_logic := '0';                                                                 
  aclken                : in  std_logic := '1';                                                          
  aresetn               : in  std_logic := '1';                                                          
  
  s_axis_input_tdata    : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser    : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid   : in  std_logic := '0';                                                                 
  s_axis_input_tready   : out std_logic := '0';                                                                 
  s_axis_input_tlast    : in  std_logic := '0';                                                                 
    
  s_axis_ctrl_tdata     : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid    : in  std_logic := '0';
  s_axis_ctrl_tready    : out std_logic := '0';
  
  m_axis_output_tdata   : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser   : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid  : out std_logic := '0';                                                                 
  m_axis_output_tready  : in  std_logic := '0';                                                          
  m_axis_output_tlast   : out std_logic := '0';                                                                 

  event_s_input_tlast_missing    : out std_logic := '0';
  event_s_input_tlast_unexpected : out std_logic := '0';
  event_s_ctrl_tdata_invalid     : out std_logic := '0'
  
);

end rs_encoder_axi_wrapper;



--------------------------------------------------------------------------------
architecture synth of rs_encoder_axi_wrapper is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Group: architecture
  
  ------------------------------------------------------------------------------
  -- Group: constants

  constant new_line : string(1 to 1) := (1 => lf); -- for assertion reports
  
  -- boolean: multi_channel
  -- true if there is more than one input channel
  constant multi_channel : boolean := C_NUM_CHANNELS > 1;
  
  -- boolean: enc_can_be_stalled
  -- true if <rs_encoder_main> can be stalled because AXI output channel is stalled
  constant enc_can_be_stalled : boolean := C_HAS_M_AXIS_OUTPUT_TREADY /= 0;
  
  -- integer: enc_has_ce
  -- 1 if <rs_encoder_main> required a clock enable
  constant enc_has_ce : integer := boolean'pos(C_HAS_ACLKEN /= 0 or enc_can_be_stalled);
  
  
  ------------------------------------------------------------------------------
  -- Fields within AXI busses
  
  -- integer: data_in_field_width
  -- Size of data_in field in <s_axis_input_tdata>
  constant data_in_field_width : integer := byte_roundup(C_SYMBOL_WIDTH);
  
  -- integer: data_out_field_width
  -- Size of data_out field in <m_axis_output_tdata>
  constant data_out_field_width : integer := data_in_field_width;
  
  -- integer: n_in_field_width
  -- Size of n_in field in <s_axis_ctrl_tdata>
  constant n_in_field_width : integer :=
    GLB_if(C_HAS_N_IN>0, byte_roundup(C_SYMBOL_WIDTH), 0);
    --select_val(0, roundup_to_multiple(C_SYMBOL_WIDTH, axi_field_factor), C_HAS_N_IN);
  
             
  -- integer: r_constant
  -- Number of check symbols, R=N-K
  constant r_constant : integer := C_N - C_K;
  -- integer: r_in_width
  -- Optional r_in port needs enough bits to represent the largest N-K value
  constant r_in_width : integer := integer_width(r_constant);
  
  
  -- integer: r_in_lsb_index
  -- r_in field of input data starts after n_in field
  constant r_in_lsb_index : integer := n_in_field_width;
  -- integer: r_in_msb_index
  -- Index of r_in field MSB in <s_axis_ctrl_tdata>
  constant r_in_msb_index : integer := r_in_lsb_index + r_in_width - 1;
    
  -- integer: s_axis_ctrl_fifo_r_in_lsb
  -- r_in is placed immediately after n_in if n_in is present, else it is the least significant
  -- field in the ctrl FIFO input.
  --constant s_axis_ctrl_fifo_r_in_lsb : integer := select_val(0, C_SYMBOL_WIDTH, C_HAS_N_IN);
  constant s_axis_ctrl_fifo_r_in_lsb : integer := GLB_if(C_HAS_N_IN>0, C_SYMBOL_WIDTH, 0);
  
  -- integer: s_axis_ctrl_fifo_r_in_msb
  -- Index of r_in field MSB in <s_axis_ctrl_fifo_in>
  constant s_axis_ctrl_fifo_r_in_msb : integer := s_axis_ctrl_fifo_r_in_lsb + r_in_width - 1;
    
    
  -- integer: symbol_width_minus_1
  --  Define this to save repeated re-calculation. Used to define <symbol_type>
  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH-1;
  
  
  ------------------------------------------------------------------------------
  -- FIFO constants
  --
  
  -- integer: min_ifx_fifo_depth 
  -- The glb_ifx_* components used for AXI FIFOs have a minimum depth of 4.
  constant min_ifx_fifo_depth : integer := 4;
  
  ------------------------------------------------------------------------------
  -- s_axis_input FIFO constants
  -- FIFO bus is composed of (mark_in, data_in)
  
  -- integer: s_axis_input_fifo_mark_in_lsb
  -- LSB bit position of <mark_in> within s_axis_input_fifo input and output
  constant s_axis_input_fifo_mark_in_lsb : integer := C_SYMBOL_WIDTH;
                                                                 
  -- integer: s_axis_input_fifo_mark_in_msb
  -- MSB bit position of <mark_in> within s_axis_output_fifo data input and output
  constant s_axis_input_fifo_mark_in_msb : integer := s_axis_input_fifo_mark_in_lsb + C_S_AXIS_INPUT_TUSER_WIDTH - 1;
  
  -- integer: s_axis_input_fifo_width 
  -- Combined width of all the elements of s_axis_input_tdata and s_axis_input_tuser (if present)
  -- and s_axis_input_tlast, not including any padding bits (as we don't want to waste resources
  -- storing those in a FIFO).
  -- s_axis_input_tlast will be the MSB of the FIFO data bus
  constant s_axis_input_fifo_width : integer :=
    GLB_if(C_HAS_S_AXIS_INPUT_TUSER>0,
             s_axis_input_fifo_mark_in_lsb+C_S_AXIS_INPUT_TUSER_WIDTH+1,
             s_axis_input_fifo_mark_in_lsb+1
          );
    --select_val(s_axis_input_fifo_mark_in_lsb+1,
    --           s_axis_input_fifo_mark_in_lsb+C_S_AXIS_INPUT_TUSER_WIDTH+1,
    --           C_HAS_S_AXIS_INPUT_TUSER);
               
  -- integer: s_axis_input_fifo_depth
  -- Depth of AXI input FIFO. Set to 16, as this has minimal cost when SRL16 is used.
  -- Allow an additional 5 symbols in multi-channel case as FIFO can become full earlier
  -- than expected because of internal pipelining.
  -- Depth must be a power of 2 for <glb_srl_fifo> component.
  constant s_axis_input_fifo_depth : integer := GLB_max(GLB_next_pow2(C_NUM_CHANNELS+5), 16);
  
  
  ------------------------------------------------------------------------------
  -- s_axis_ctrl FIFO constants
  
  -- integer: s_axis_ctrl_fifo_width_tmp
  -- Combined width of all the elements of s_axis_ctrl_tdata, not including any padding bits
  -- (as we don't want to waste resources storing those in a FIFO).
  --constant s_axis_ctrl_fifo_width_tmp : integer := select_val(0, C_SYMBOL_WIDTH, C_HAS_N_IN) +
  --                                                 select_val(0, r_in_width, C_HAS_R_IN);
  constant s_axis_ctrl_fifo_width_tmp : integer := GLB_if(C_HAS_N_IN>0, C_SYMBOL_WIDTH, 0) +
                                                   GLB_if(C_HAS_R_IN>0, r_in_width,     0);
   
  -- integer: s_axis_ctrl_fifo_width
  -- Don't let width go below 1 to avoid compiler warnings if C_HAS_S_AXIS_CTRL=0
  constant s_axis_ctrl_fifo_width : integer := GLB_max(1, s_axis_ctrl_fifo_width_tmp);
               
  
  -- integer: s_axis_ctrl_fifo_depth 
  -- Depth of AXI ctrl FIFO. 
  -- FIFO holds up to 16 control values. 16 costs the same as 2 if an SRL16 is used, so always set to 16.
  constant s_axis_ctrl_fifo_depth : integer := GLB_max(min_ifx_fifo_depth, 16);
    
  
  ------------------------------------------------------------------------------
  -- m_axis_output FIFO constants
  -- FIFO bus is composed of (mark_out, info, data_out)
  
  -- integer: m_axis_output_fifo_info_lsb
  -- LSB bit position of <info> within m_axis_output_fifo data input and output
  constant m_axis_output_fifo_info_lsb : integer := C_SYMBOL_WIDTH;
  
  -- integer: m_axis_output_fifo_mark_out_lsb
  -- LSB bit position of <mark_out> within m_axis_output_fifo data input and output
  --constant m_axis_output_fifo_mark_out_lsb : integer := select_val(m_axis_output_fifo_info_lsb,
  --                                                                 m_axis_output_fifo_info_lsb + 1,
  --                                                                 C_HAS_INFO);
  constant m_axis_output_fifo_mark_out_lsb : integer := GLB_if(C_HAS_INFO>0,
                                                               m_axis_output_fifo_info_lsb + 1,
                                                               m_axis_output_fifo_info_lsb
                                                               );
  -- integer: m_axis_output_fifo_width 
  -- Combined width of all the elements of m_axis_output_tdata and m_axis_output_tuser (if present)
  -- not including any padding bits (as we don't want to waste resources storing those in a FIFO).
  -- Add 1 for <last_data_out> signal to be passed through to generate m_axis_output_tlast
  constant m_axis_output_fifo_width : integer :=
    GLB_if(C_HAS_S_AXIS_INPUT_TUSER>0,
           m_axis_output_fifo_mark_out_lsb+1+C_S_AXIS_INPUT_TUSER_WIDTH,
           m_axis_output_fifo_mark_out_lsb+1
           );
    --select_val(m_axis_output_fifo_mark_out_lsb+1,
    --           m_axis_output_fifo_mark_out_lsb+1+C_S_AXIS_INPUT_TUSER_WIDTH,
    --           C_HAS_S_AXIS_INPUT_TUSER);
               
  -- integer: m_axis_output_fifo_depth 
  -- Depth of AXI output FIFO. The glb_ifx_master component used for this FIFO has a minimum depth of 4,
  -- although we only actually need a depth of 2 in order to retime tready and switch off the
  -- clock enable for the Forney unit. Allow an additional 3 cycles to be sure almost full output works
  -- correctly.
  --constant m_axis_output_fifo_depth : integer := min_ifx_fifo_depth + 3;
--  constant m_axis_output_fifo_depth : integer := GLB_max(GLB_next_pow2(min_ifx_fifo_depth + 3), 16);
  constant m_axis_output_fifo_depth : integer := 16;
  
  
  ------------------------------------------------------------------------------
  -- Latency calculation
  -- Required to set delay for TUSER signal in parallel to main core
  -----------------------------------------------------------------------------
  -- Get latency function
  -- Latency is defined as number of rising clock edges from sampling DATA_IN
  -- to outputting on DATA_OUT.
  -- Used by GUI so place in this package that will be processed by XCC.
  -----------------------------------------------------------------------------
  function get_latency(num_channels : integer;
                       spec         : integer) return integer is
  variable latency: integer;
  begin
  latency := 2 + num_channels;
  
  -- optimization parameter removed from version 4.1 on.
  --if optimization = 2 then        -- speed
  --  latency := 3; 
  --elsif optimization = 1 then     --area
  --  latency:=2;
  --else
  --    assert false
  --        report "Invalid optimization value" severity failure;
  --end if;
    
  if spec = ccsds_spec then -- CCSDS standard
    latency := latency + 2;
  elsif spec = j83_b_spec then
    latency := latency + 1;
  end if;
  
  assert false
    report " Reed-Solomon Encoder: " & new_line &
           " latency = " & integer'image(latency) & new_line &
           new_line
    severity note;
    
  return latency;
  end get_latency;


  constant core_latency : integer := get_latency(C_NUM_CHANNELS, C_SPEC);
    
  ------------------------------------------------------------------------------
  -- Group: types
  
  -- type: symbol_type
  -- Standard vector type for data symbols
  subtype symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);
  
  ------------------------------------------------------------------------------
  -- Group: signals
  
  -- Group: Signals to drive <rs_encoder_main> inputs
  --  data_in     - Data to be encoded 
  --  enc_ce      - Clock enable for <rs_encoder_main>
  --  nd_in       - New Data input (equivalent of tvalid for <rs_encoder_main>
  --  n_in        - Optional variable N input
  --  r_in        - Optional variable R
  --  mark_in     - tuser bits, passed from <rs_encoder_main> mark_in to mark_out
  --  sr_smpld    - <aresetn> is inverted and retimed to produce active high synchronous reset
  --  start_enc   - Assert high at same time as first data symbol of a new block is provided
  --                to <rs_encoder_main>
  signal data_in      : symbol_type;
  signal enc_ce       : std_logic;
  signal nd_in        : std_logic;
  signal n_in         : symbol_type;
  signal r_in         : std_logic_vector(r_in_width-1 downto 0);
  signal mark_in      : std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0);
  signal sr_smpld     : std_logic := '0';
  signal start_enc    : std_logic := '0';
  
  -- Group: Signals to receive <rs_encoder_main> outputs
  --  data_out    - Output corrected data from encoder
  --  info        - Output high when information symbols on data_out, low for check symbols
  --  mark_out    - tuser bits, passed from <rs_encoder_main> mark_in to mark_out
  --  rdy_out     - asserted high when <rs_encoder_main> has output data ready
  --  rfd_din     - Input to rfd register in <rs_encoder_main>
--  --  rfd_out     - <rs_encoder_main> ready for data output
  --  rffd_din    - Input to rffd register in <rs_encoder_main>
  --  rffd_out    - <rs_encoder_main> ready for first data output
  signal data_out    : symbol_type;
  signal info        : std_logic;
  signal mark_out    : std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0);
  signal rdy_out     : std_logic;
  signal rfd_din     : std_logic;
--  signal rfd_out     : std_logic;
  signal rffd_din    : std_logic;
  signal rffd_out    : std_logic;

  -- Group: Other signals
  --  aclken_int  - Internal clock enable, tied high if <C_HAS_ACLKEN> = 0
--  --  s_axis_input_fifo_in - Input bus for AXI input FIFO, concatenation of all the input channel information
--  --  s_axis_input_fifo_out - Output bus for AXI output FIFO
  --  s_axis_ctrl_fifo_in - Input bus for AXI ctrl FIFO, concatenation of all the ctrl channel information
  --  s_axi_ctrl_fifo_out - Output bus for AXI ctrl FIFO
  --  m_axis_output_fifo_in - Input bus for AXI output FIFO, concatenation of all the output channel information
  --  m_axis_output_fifo_out - Output bus for AXI output FIFO
  --  m_axis_output_tdata_tmp - Used to give default assignment of zeroes to unused bits in <m_axis_output_tdata>
  --  last_data_out - High when last symbol is on data_out bus from <rs_encoder_main> component
  --  output_fifo_has_room - Low when o/p FIFO full - used to stop processing
  --  output_fifo_has_room_del - Delayed version of <output_fifo_has_room>
  --  output_fifo_wr_en - Write enable for AXI output FIFO
  --  ctrl_fifo_rd_en - read enable for ctrl FIFO
  --  ctrl_fifo_not_empty - asserted when ctrl FIFO contains data to be read
  --  input_fifo_rd_en - read enable for input FIFO
  --  input_tready - tready signal signalling core is ready to receive input data
  --  input_tvalid - tvalid signal signalling valid data on data_in
  --  input_tlast - tlast pulse to inner core
  signal aclken_int               : std_logic;
  --signal s_axis_input_fifo_in     : std_logic_vector(s_axis_input_fifo_width-1 downto 0);
  --signal s_axis_input_fifo_out    : std_logic_vector(s_axis_input_fifo_width-1 downto 0);
  signal s_axis_ctrl_fifo_in      : std_logic_vector(s_axis_ctrl_fifo_width-1 downto 0);
  signal s_axis_ctrl_fifo_out     : std_logic_vector(s_axis_ctrl_fifo_width-1 downto 0);
  signal m_axis_output_fifo_in    : std_logic_vector(m_axis_output_fifo_width-1 downto 0);
  signal m_axis_output_fifo_out   : std_logic_vector(m_axis_output_fifo_width-1 downto 0);
  signal m_axis_output_tdata_tmp  : std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');
  signal last_data_out            : std_logic;
  signal output_fifo_has_room_pre : std_logic;
  signal output_fifo_has_room     : std_logic := '1';
  signal output_fifo_has_room_del : std_logic := '1';
  signal output_fifo_has_room_both: std_logic := '1';
  signal output_fifo_wr_en        : std_logic;
  signal ctrl_fifo_rd_en          : std_logic;
  signal ctrl_fifo_not_empty      : std_logic;
  signal input_fifo_rd_en         : std_logic;
  signal input_tready             : std_logic := '0';
  signal input_tvalid             : std_logic;
  signal input_tlast              : std_logic;
  signal in_tlast                 : std_logic; --qualified by tvalid. Fed to event checker in rs_encoder_main
  signal tlast_missing            : std_logic;
  signal tlast_missing_qual       : std_logic;
  signal tlast_unexpected         : std_logic;
  signal tlast_unexpected_qual    : std_logic;
  signal ctrl_invalid             : std_logic;
  signal ctrl_invalid_qual        : std_logic;
  signal ctrl_invalid_event       : std_logic;
begin
  -- Group: architecture body

  
  
  ------------------------------------------------------------------------------
  -- Generate optional clock enable input
  ceg1: if C_HAS_ACLKEN /= 0 generate
  begin
    aclken_int <= aclken;
  end generate; -- ceg1
  
  ceg2: if C_HAS_ACLKEN = 0 generate
  begin
    aclken_int <= '1';
  end generate; -- ceg2
  
  ------------------------------------------------------------------------------
  -- Generate optional synchronous reset input
  arg1: if C_HAS_ARESETN /= 0 generate
  begin
    
    -- Invert and retime aresetn to produce an active high synchronous reset for <rs_encoder_main>
    srp1 : process (aclk)
    begin
      if rising_edge(aclk) then
        sr_smpld <= not(aresetn);
      end if; -- clk
    end process; -- srp1
    
    
  end generate; -- arg1
  
  arg2: if C_HAS_ARESETN = 0 generate
  begin
    sr_smpld    <= '0';
  end generate; -- arg2
  

  
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Extract fields from AXI ctrl channel and outputs from AXI ctrl FIFO
  --
  
  ------------------------------------------------------------------------------
  -- Generate optional n_in input
  nig1: if C_HAS_N_IN /= 0 generate
  begin
    s_axis_ctrl_fifo_in(symbol_width_minus_1 downto 0) <= s_axis_ctrl_tdata(symbol_width_minus_1 downto 0);
    n_in <= s_axis_ctrl_fifo_out(symbol_width_minus_1 downto 0);
  end generate; -- nig1
  
  nig2: if C_HAS_N_IN = 0 generate
  begin
    n_in <= std_logic_vector(to_unsigned(C_N, n_in'length)); -- force to fixed value
  end generate; -- nig2
  
  
  ------------------------------------------------------------------------------
  -- Generate optional r_in input
  rig1: if C_HAS_R_IN /= 0 generate
  begin
    s_axis_ctrl_fifo_in(s_axis_ctrl_fifo_r_in_msb downto s_axis_ctrl_fifo_r_in_lsb) <= 
                                                   s_axis_ctrl_tdata(r_in_msb_index downto r_in_lsb_index);
                                                   
    r_in <= s_axis_ctrl_fifo_out(s_axis_ctrl_fifo_r_in_msb downto s_axis_ctrl_fifo_r_in_lsb);
  end generate; -- rig1
  
  rig2: if C_HAS_R_IN = 0 generate
  begin
    r_in <= std_logic_vector(to_unsigned(r_constant, r_in'length)); -- force to fixed value
  end generate; -- rig2
  
  

  
  
  ------------------------------------------------------------------------------
  -- AXI interface components
  --
  
  ------------------------------------------------------------------------------
  -- AXI input channel
  --
  s_axis_input_tready <= input_tready; -- Primary output
  

  
  ------------------------------------------------------------------------------
  -- AXI ctrl channel FIFO
  --
  cfg1 : if C_HAS_S_AXIS_CTRL /= 0 generate
    signal start_enc_set : std_logic;
  begin
  
    ----------------------------------------------------------------------------
    -- Object: axi_ctrl_fifo
    -- This FIFO buffers incoming control data from the AXI s_axis_ctrl channel.
    -- This minimizes fan-in of AXI handshaking signals and allows control information
    -- for up to 16 blocks of input data to be set up in advance.
    -- If this FIFO is empty the s_axis_input channel will be stalled.
    -- The FIFO is read just as <rs_encoder_main> is ready to accept a new block of input data.
    --axi_ctrl_fifo : rs_ifx_slave
    axi_ctrl_fifo : glb_ifx_slave
    generic map(
      WIDTH          => s_axis_ctrl_fifo_width,
      DEPTH          => s_axis_ctrl_fifo_depth,
      HAS_IFX        => true, -- for AXI compatible outputs
      AEMPTY_THRESH1 => 0,
      AEMPTY_THRESH0 => 0 )
    port map(
      aclk      => aclk,
      aclken    => aclken_int,
      areset    => sr_smpld,
      aresetn   => '1',
      ifx_valid => s_axis_ctrl_tvalid,
      ifx_ready => s_axis_ctrl_tready,
      ifx_data  => s_axis_ctrl_fifo_in,
      rd_enable => ctrl_fifo_rd_en,
      rd_valid  => open,
      rd_data   => s_axis_ctrl_fifo_out,
      not_empty => ctrl_fifo_not_empty );
      
    -- Registers enabled by <aclken>
    cfp1 : process (aclk)
    begin
      if rising_edge(aclk) then
        if sr_smpld = '1' then
          start_enc <= '0';
          
        --[GO] aclken replaced with aclken_int
        elsif aclken_int = '1' then
        
          -- Signal to start <rs_encoder_main> with a new block
          --start_enc <= start_enc_set;
          if (start_enc_set = '1') then
            start_enc <= '1';
          elsif (rffd_out and nd_in) = '1' then
            start_enc <= '0';
          end if;

        end if; -- sr_smpld = '1'
      end if; -- rising_edge(aclk)
    end process; -- cfp1


    -- Start a new block on the next valid sample when rffd='1' and core is not stalled
    -- due to o/p FIFO being full and a ctrl value is available to be read.
    start_enc_set <= rffd_din and output_fifo_has_room and ctrl_fifo_not_empty;

    -- Read ctrl FIFO on cycle immediately before <rs_encoder_main> is started with
    -- <start_enc>
    --[GO] aclken replaced with aclken_int
    ctrl_fifo_rd_en <= start_enc_set and not(start_enc) and aclken_int;



  end generate; -- cfg1

  cfg2 : if C_HAS_S_AXIS_CTRL = 0 generate
  begin
    ctrl_fifo_not_empty <= '1'; -- Set to '1' to prevent input channel from being blocked

    -- <rffd_out> goes high when <rs_encoder_main> is ready for first data, i.e. it
    -- is ready to start a new block. If the <start> input is driven with this signal
    -- then a new block will be started on the first <nd> pulse after <rffd_out> goes
    -- high.
    -- Need to gate with <input_tready> to ensure <start_enc> is low during a reset.
    start_enc <= rffd_out and input_tready;

  end generate; -- cfg2
  
  
  
  ------------------------------------------------------------------------------
  -- AXI output channel FIFO
  --
  --
  -- Generate m_axis_output_tdata
  -- Undriven bits will be forced to '0' by signal declaration initialization
  m_axis_output_tdata <= m_axis_output_tdata_tmp;


  ofg1 : if C_HAS_M_AXIS_OUTPUT_TREADY /= 0 generate
  begin

    ----------------------------------------------------------------------------
    -- Object: axi_output_fifo
    -- This FIFO decouples the data output from the actual AXI m_axis_output channel.
    -- Without this FIFO the unregistered tready input would have to be used to
    -- disable the core as soon as it went low.
    -- in early v8.0 development the almost full flag was set such that the
    -- FIFO would almost fill in the worst case. Now, the threshold is set
    -- approx half way (8-3). 8 is half-way, 3 is the latency of feedback from
    -- the fifo to the core and back. To minimise OR logic in control and
    -- specifically in CE logic, the fifo almost full flag is delayed several
    -- times such that combinations can be OR'd then registered. This registering
    -- increases the latency and hysteresis to the FIFO operation. Whether this
    -- adds a genuine hazard of underflow is not clear, but that's why half-way is
    -- chosen.
    axi_output_fifo : glb_ifx_master
    generic map(
      WIDTH         => m_axis_output_fifo_width,
      DEPTH         => m_axis_output_fifo_depth,
      AFULL_THRESH1 => 5,--see comments above.
      AFULL_THRESH0 => 5 
    )
    port map(
      aclk      => aclk,
      aclken    => aclken_int,
      areset    => sr_smpld, -- sampled active high sync reset
      wr_enable => output_fifo_wr_en,
      wr_data   => m_axis_output_fifo_in,
      ifx_valid => m_axis_output_tvalid,
      ifx_ready => m_axis_output_tready,
      ifx_data  => m_axis_output_fifo_out,
      not_afull => output_fifo_has_room_pre
      );

    -- Write to FIFO when there is valid data (<rdy_out> = '1') and inner core is enabled
    output_fifo_wr_en <= rdy_out and enc_ce;
      
      
    -- Registers enabled by <aclken>
    ofp1 : process (aclk)
    begin
      if rising_edge(aclk) then
        if sr_smpld = '1' then
          output_fifo_has_room      <= '1';
          output_fifo_has_room_del  <= '1';
          output_fifo_has_room_both <= '1';

        --[GO] aclken replaced with aclken_int
        elsif aclken_int = '1' then

          -- Delay <output_fifo_has_room> by the number of cycles it takes to de-assert rfd
          -- after <output_fifo_has_room> goes low (i.e. 1 cycle)
          output_fifo_has_room      <= output_fifo_has_room_pre;
          output_fifo_has_room_del  <= output_fifo_has_room;
          output_fifo_has_room_both <= output_fifo_has_room_pre or output_fifo_has_room;
          
        end if; -- sr_smpld = '1'
      end if; -- rising_edge(aclk)
    end process; -- ofp1
    
    
    -- Connect FIFO data inputs and outputs
    
    -- Include data_out
    m_axis_output_fifo_in(symbol_width_minus_1 downto 0) <= data_out;
    
    m_axis_output_tdata_tmp(symbol_width_minus_1 downto 0) <= m_axis_output_fifo_out(symbol_width_minus_1 downto 0);

    -- Pad data field with zeroes if required
    pdo: if (C_M_AXIS_OUTPUT_TDATA_WIDTH-(8*boolean'pos(C_HAS_INFO>0))) > C_SYMBOL_WIDTH generate
    begin
      m_axis_output_tdata_tmp(data_out_field_width-1 downto C_SYMBOL_WIDTH) <= (others => '0');
    end generate; -- ifg1

    -- Include info
    ifg1: if C_HAS_INFO /= 0 generate
    begin
      m_axis_output_fifo_in(m_axis_output_fifo_info_lsb) <= info;
   
      m_axis_output_tdata_tmp(data_out_field_width) <= m_axis_output_fifo_out(m_axis_output_fifo_info_lsb);
      
      -- Pad info field to byte boundary
      m_axis_output_tdata_tmp(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto C_M_AXIS_OUTPUT_TDATA_WIDTH-7) <= (others => '0');
          
    end generate; -- ifg1
    
    
    ----------------------------------------------------------------------------
    -- Generate optional m_axis_output_tuser output from mark_out
    -- C_M_AXIS_OUTPUT_TUSER_WIDTH should equal C_S_AXIS_INPUT_TUSER width
    -- (=mark_out width), but it might not, so use ieee.numeric_std resize
    -- function to either pad with zeroes or strip off MSBs to match
    -- C_M_AXIS_OUTPUT_TUSER_WIDTH
    tug2: if C_HAS_M_AXIS_OUTPUT_TUSER /= 0 generate
    begin
      m_axis_output_fifo_in(mark_out'length+m_axis_output_fifo_mark_out_lsb-1 downto
                            m_axis_output_fifo_mark_out_lsb) <= mark_out;
        
      m_axis_output_tuser <= std_logic_vector(resize(unsigned(
        m_axis_output_fifo_out(mark_out'length+m_axis_output_fifo_mark_out_lsb-1 downto
                               m_axis_output_fifo_mark_out_lsb)), C_M_AXIS_OUTPUT_TUSER_WIDTH));
    end generate; -- tug2
   
   
   
    ----------------------------------------------------------------------------
    -- Generate m_axis_output_tlast signal by passing last_data_out through the
    -- AXI output FIFO on the MSB of the FIFO data bus.
    m_axis_output_fifo_in(m_axis_output_fifo_width-1) <= last_data_out;
    m_axis_output_tlast <= m_axis_output_fifo_out(m_axis_output_fifo_width-1);
  
  end generate; -- ofg1
  

  ofg2 : if C_HAS_M_AXIS_OUTPUT_TREADY = 0 generate
  begin
    output_fifo_has_room <= '1'; -- output never stalls core
    output_fifo_has_room_del <= '1';
    output_fifo_has_room_both <= '1';
    
    m_axis_output_tvalid <= rdy_out;

    --[GO] previous code    m_axis_output_tlast <= last_data_out;
    --3 cycle delay added to last_data_out because legacy core gives signal out
    --3 cycles early.
    m_axis_output_tlast <= last_data_out;
    
    -- Connect AXI data inputs and outputs
    
    -- Include data_out
    m_axis_output_tdata_tmp(symbol_width_minus_1 downto 0) <= data_out;
    
    -- Include info if required
    ifg1: if C_HAS_INFO /= 0 generate
    begin
      m_axis_output_tdata_tmp(data_out_field_width) <= info;
    end generate; -- ifg1
    
    -- Include optional m_axis_output_tuser output from mark_out
    -- C_M_AXIS_OUTPUT_TUSER_WIDTH should equal C_S_AXIS_INPUT_TUSER width (=mark_out width)
    tug2: if C_HAS_M_AXIS_OUTPUT_TUSER /= 0 generate
    begin
      m_axis_output_tuser <= mark_out;
    end generate; -- tug2
  
  end generate; -- ofg2

  ------------------------------------------------------------------------------
  -- Event signals
  -- Event signals are single cycle active high flags to indicate protocol error
  -- events occuring on either the input or output streaming interfaces.
  --The event signals have been implemented in the rs_encoder_main entity
  --because that is where the symbol counters reside.
  ------------------------------------------------------------------------------
  -- <rs_encoder_main> Connections
  
  -- Clock enable, inner core is disabled if there is no more room in output FIFO
  enc_ce <= aclken_int and (output_fifo_has_room_both);

  -- New Data (nd) input driven whenever there's a valid beat on the AXI interface
  nd_in <= s_axis_input_tvalid and input_tready and output_fifo_has_room_del;
  
  -- Generate incoming data bus
  data_in <= s_axis_input_tdata(symbol_width_minus_1 downto 0);
  
  -- Generate optional mark_in input from s_axis_input_tuser
  tug1: if C_HAS_S_AXIS_INPUT_TUSER /= 0 generate
  begin
    mark_in <= s_axis_input_tuser;
  end generate; -- tug1
 
  input_tlast <= s_axis_input_tlast;
  
  -- Registers enabled by <aclken>
  rgp1 : process (aclk)
  begin
    if rising_edge(aclk) then
      if sr_smpld = '1' then
        input_tready <= '0'; -- AXI standard requires tready to be low during reset
          
      --[GO] aclken replaced with aclken_int     
      elsif aclken_int = '1' then

        -- Input tready is high when <rs_encoder_main> rfd output is high unless
        -- o/p FIFO is stalled or we are ready to start a new block but the ctrl FIFO is empty
        if C_HAS_S_AXIS_CTRL = 0 then
          -- Could just use rfd output from <rs_encoder_main> directly in this case except
          -- it is reset to a '1', which violates the AXI standard.
          input_tready <= rfd_din and output_fifo_has_room;
        else
          input_tready <= rfd_din and output_fifo_has_room and (ctrl_fifo_not_empty or not(rffd_din));
        end if; -- C_HAS_S_AXIS_CTRL = 0

      end if; -- sr_smpld = '1'
    end if; -- rising_edge(aclk)
  end process; -- rgp1

  -- Register event outputs.

  tlast_missing_qual    <=  enc_ce and tlast_missing;
  tlast_unexpected_qual <=  enc_ce and tlast_unexpected;
  ctrl_invalid_qual     <= (enc_ce and ctrl_invalid) or ctrl_invalid_event; -- sticky

  i_event_reg  : xbip_pipe_v3_0_3_viv
    generic map(
      C_LATENCY  => 1,
      C_HAS_CE   => 1,
      C_HAS_SCLR => 1,
      C_WIDTH    => 3
      )
    port map(
      CLK     => aclk,
      CE      => aclken_int,
      SCLR    => sr_smpld,
      D(0)    => tlast_missing_qual,
      D(1)    => tlast_unexpected_qual,
      D(2)    => ctrl_invalid_qual,
      Q(0)    => event_s_input_tlast_missing,
      Q(1)    => event_s_input_tlast_unexpected,
      Q(2)    => ctrl_invalid_event
    );

  event_s_ctrl_tdata_invalid <= ctrl_invalid_event;

  ------------------------------------------------------------------------------
  -- Need to delay TUSER by number of cycles of latency within the main core
  ------------------------------------------------------------------------------
  i_marker_delay  : xbip_pipe_v3_0_3_viv
    generic map(
        C_LATENCY  => core_latency,
        C_HAS_CE   => 1,
        C_HAS_SCLR => 0,                --no need, allows SRL use.
        C_WIDTH    => C_S_AXIS_INPUT_TUSER_WIDTH
        )
      port map(
        CLK     => aclk,
        CE      => enc_ce,           --same ce as core
        D       => mark_in,
        Q       => mark_out
        );

  in_tlast <= s_axis_input_tlast and nd_in;
  ------------------------------------------------------------------------------
  -- Object: enc
  -- Instantiate the main encoder entity, <rs_encoder_main>
  ------------------------------------------------------------------------------
  enc : rs_encoder_main
    generic map (
      C_EVALUATION                   => C_EVALUATION,
      C_FAMILY                       => C_FAMILY,
      C_XDEVICEFAMILY                => C_XDEVICEFAMILY,
      C_HAS_CE                       => enc_has_ce,
      C_HAS_N_IN                     => C_HAS_N_IN,
      C_HAS_ND                       => 1,  -- Top level always has tvalid
      C_HAS_R_IN                     => C_HAS_R_IN,
      C_HAS_RDY                      => 1,  -- Used to produce output tvalid
      C_HAS_RFD                      => 1,  -- Top level always has tready
      C_HAS_RFFD                     => 1,  -- Use RFFD to start a new block as soon as possible
      C_HAS_SCLR                     => C_HAS_ARESETN,
      C_MEM_INIT_PREFIX              => C_MEM_INIT_PREFIX,
      C_ELABORATION_DIR              => C_ELABORATION_DIR,
      C_SPEC                         => C_SPEC,
      C_GEN_POLY_TYPE                => C_GEN_POLY_TYPE,
      C_GEN_START                    => C_GEN_START,
      C_H                            => C_H,
      C_K                            => C_K,
      C_N                            => C_N,
      C_POLYNOMIAL                   => C_POLYNOMIAL,
      C_NUM_CHANNELS                 => C_NUM_CHANNELS,
      C_SYMBOL_WIDTH                 => C_SYMBOL_WIDTH,
      C_MEMSTYLE                     => C_MEMSTYLE
      )
    port map (
      data_in                        => data_in,
      n_in                           => n_in,
      r_in                           => r_in,
      start                          => start_enc,
      bypass                         => '0',  -- Not supported
      nd                             => nd_in,
      sclr                           => sr_smpld,
      in_tlast                       => in_tlast,
      data_out                       => data_out,
      info                           => info,
      rdy                            => rdy_out,
      rfd                            => open,
      rfd_din                        => rfd_din,
      rffd                           => rffd_out,
      rffd_din                       => rffd_din,
      last_data_tlast                => last_data_out,
      event_s_input_tlast_missing    => tlast_missing,
      event_s_input_tlast_unexpected => tlast_unexpected,
      event_s_ctrl_tdata_invalid     => ctrl_invalid,
      ce                             => enc_ce,
      clk                            => aclk
      );

end synth;






--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010, 2012 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_encoder_v9_0_11/hdl/rs_encoder_v9_0_11_viv.vhd,v 1.2 2011/10/19 12:55:09 screaney Exp $
--
--------------------------------------------------------------------------------
-- Unit     : rs_encoder_v9_0_11_viv
-- Function : Generic ReedSolomon encoder, top-level instantiations
--------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: rs_encoder_v9_0_11_viv
-- This is the top level XST ENTITY for the Xilinx parameterizable Reed-Solomon Encoder Logicore.
--
--
--------------------------------------------------------------------------------
-- Generics and ports are defined in the file for <rs_encoder_v9_0_11>

library ieee;
use ieee.std_logic_1164.all;

library rs_encoder_v9_0_11;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_consts.all;
use rs_encoder_v9_0_11.rs_encoder_pkg.all;


--core_if on entity rs_encoder_v9_0_11_viv
  entity rs_encoder_v9_0_11_viv is
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := c_has_aclken_default;                   
  C_HAS_ARESETN                : integer := c_has_aresetn_default;                  
  C_HAS_S_AXIS_CTRL            : integer := c_has_s_axis_ctrl_default;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := c_has_s_axis_input_tuser_default;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := c_has_m_axis_output_tuser_default;       
  C_HAS_M_AXIS_OUTPUT_TREADY   : integer := c_has_m_axis_output_tready_default;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := c_s_axis_input_tdata_width_default;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := c_s_axis_input_tuser_width_default;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := c_s_axis_ctrl_tdata_width_default;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := c_m_axis_output_tdata_width_default;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := c_m_axis_output_tuser_width_default;    
    
  -- AXI channel sub-field parameters
  C_HAS_INFO                   : integer := c_has_info_default; 
  C_HAS_N_IN                   : integer := c_has_n_in_default;
  C_HAS_R_IN                   : integer := c_has_r_in_default;
  
  -- Reed-Solomon code word parameters
  C_GEN_START                  : integer := c_gen_start_default;
  C_H                          : integer := c_h_default;
  C_K                          : integer := c_k_default;
  C_N                          : integer := c_n_default;
  C_POLYNOMIAL                 : integer := c_polynomial_default;
  C_SPEC                       : integer := c_spec_default;
  C_SYMBOL_WIDTH               : integer := c_symbol_width_default;
  
  -- Implementation parameters
  C_GEN_POLY_TYPE              : integer := c_gen_poly_type_default;
  C_NUM_CHANNELS               : integer := c_num_channels_default;
  C_MEMSTYLE                   : integer := c_memstyle_default;
  C_OPTIMIZATION               : integer := c_optimization_default;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string  := c_mem_init_prefix_default;
  C_ELABORATION_DIR            : string  := c_elaboration_dir_default;
  C_XDEVICEFAMILY              : string  := c_xdevicefamily_default;
  C_FAMILY                     : string  := c_family_default
);
port (
  aclk                           : in  std_logic;                                                                 
  aclken                         : in  std_logic := '1';                                                          
  aresetn                        : in  std_logic := '1';                                                          
  
  s_axis_input_tdata             : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser             : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid            : in  std_logic;                                                                 
  s_axis_input_tready            : out std_logic;                                                                 
  s_axis_input_tlast             : in  std_logic;                                                                 
    
  s_axis_ctrl_tdata              : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid             : in  std_logic := '0';                                                
  s_axis_ctrl_tready             : out std_logic;                                                                 
  
  m_axis_output_tdata            : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser            : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid           : out std_logic;                                                                 
  m_axis_output_tready           : in  std_logic := '1';                                                          
  m_axis_output_tlast            : out std_logic;                                                                 

  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
);
--core_if off

  attribute secure_netname                     : string;
  attribute secure_netname of rs_encoder_v9_0_11_viv : entity is "obfuscate";

  attribute check_license : string;
  attribute check_license of rs_encoder_v9_0_11_viv : entity is "rs_encoder@2013.03";


  --xlpp license_switch rs_encoder@2013.03 begin

    ---- This core doesn't have a simulation license option - just include as a
    ---- placeholder.
    --xlpp simulation_license begin
      ----SECURE_FLOW (Secure bitstream flow)
      ----ngdbuild generates NGD file. bitgen fails to generate bit stream and
      ----outputs the following error message: 
      ----ERROR:Bitgen:169 - This design contains one or more evaluation cores
      ----for which bitstream generation is not supported.
      attribute secure_bitstream : string;
      attribute secure_bitstream of rs_encoder_v9_0_11_viv : entity is "prohibit";
      ----SECURE_FLOW (Secure fpga_editor flow)
      ----fpga_editor prevents 'opening' of components, displaying the following
      ----error message: 
      ----ERROR:FPGAEditor:196 - Component <name> is protected. 
      ----Components' configuration strings are encrypted in the output from
      ----ncdread.
      attribute secure_config : string;
      attribute secure_config of rs_encoder_v9_0_11_viv : entity is "protect";
      ---- This line is required to make netlists encrypted.
      attribute secure_netlist : string;
      attribute secure_netlist of rs_encoder_v9_0_11_viv : entity is "encrypt";
      attribute secure_extras : string;
      attribute secure_extras of rs_encoder_v9_0_11_viv : entity is "A";
      ---- Prevent pins being added or deleted in FPGA Editor
      attribute secure_net_editing : string;
      attribute secure_net_editing of rs_encoder_v9_0_11_viv : entity is "prohibit";
    -- xlpp simulation_license end

    
    -- xlpp eval_license begin 
      ----SECURE_FLOW (Secure fpga_editor flow)
      ----fpga_editor prevents 'opening' of components, displaying the following
      ----error message: 
      ----ERROR:FPGAEditor:196 - Component <name> is protected. 
      ---- Allow bitstream generation
      --attribute secure_bitstream : string;
      --attribute secure_bitstream of rs_encoder_v9_0_11_viv : entity is "off";
      ----Components' configuration strings are encrypted in the output from
      ----ncdread.
      --attribute secure_config : string;
      --attribute secure_config of rs_encoder_v9_0_11_viv : entity is "protect";
      ---- This line is required to make netlists encrypted.
      --attribute secure_netlist : string;
      --attribute secure_netlist of rs_encoder_v9_0_11_viv : entity is "encrypt";
      --attribute secure_extras : string;
      --attribute secure_extras of rs_encoder_v9_0_11_viv : entity is "A";
      ---- Prevent pins being added or deleted in FPGA Editor
      --attribute secure_net_editing : string;
      --attribute secure_net_editing of rs_encoder_v9_0_11_viv : entity is "prohibit";
    -- xlpp eval_license end 

    
    -- xlpp bought_license begin 
      ----SECURE_FLOW (Secure fpga_editor flow)
      ----fpga_editor prevents 'opening' of components, displaying the following
      ---- error message: 
      ----ERROR:FPGAEditor:196 - Component <name> is protected. 
      ---- Allow bitstream generation
      --attribute secure_bitstream : string;
      --attribute secure_bitstream of rs_encoder_v9_0_11_viv : entity is "off";
      ----Components' configuration strings are encrypted in the output from
      ----ncdread.
      --attribute secure_config : string;
      --attribute secure_config of rs_encoder_v9_0_11_viv : entity is "protect";    
      ---- This line is required to make netlists encrypted.
      --attribute secure_netlist : string;
      --attribute secure_netlist of rs_encoder_v9_0_11_viv : entity is "encrypt";
      --attribute secure_extras : string;
      --attribute secure_extras of rs_encoder_v9_0_11_viv : entity is "A";
      ---- Prevent pins being added or deleted in FPGA Editor
      --attribute secure_net_editing : string;
      --attribute secure_net_editing of rs_encoder_v9_0_11_viv : entity is "off";
    -- xlpp bought_license end 

  -- xlpp license_switch end  
  
END rs_encoder_v9_0_11_viv;



architecture synth of rs_encoder_v9_0_11_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Group: architecture
  
  ------------------------------------------------------------------------------
  -- Group: constants
  
  -- boolean: c_is_eval
  -- Set the licensing status/type 
  -- At run time XLPP will change true to false if a "bought" or "source"
  -- license is found.
  -- xlpp eval_constant rs_encoder@2013.03 begin
     constant c_is_eval : boolean := true;
  -- xlpp eval_constant end
  
  -- Note rs_encoder will not pass testbench tests if evaluation version
  -- because tests set clk to X. H/W timeout counter cannot recover from this.


  -- boolean: do_check_generics
  -- Set to true if generics are legal, otherwise the check_generics() function
  -- will cause a failure assertion.
  -- Still to be written!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--   constant do_check_generics : boolean :=
--     check_generics(
--       C_HAS_ACLKEN                => C_HAS_ACLKEN,
--       C_HAS_ARESETN               => C_HAS_ARESETN,
--       C_HAS_S_AXIS_CTRL           => C_HAS_S_AXIS_CTRL,
--       C_HAS_S_AXIS_INPUT_TUSER    => C_HAS_S_AXIS_INPUT_TUSER,
--       C_HAS_M_AXIS_OUTPUT_TUSER   => C_HAS_M_AXIS_OUTPUT_TUSER,
--       C_HAS_M_AXIS_OUTPUT_TREADY  => C_HAS_M_AXIS_OUTPUT_TREADY,
--       C_S_AXIS_INPUT_TDATA_WIDTH  => C_S_AXIS_INPUT_TDATA_WIDTH,
--       C_S_AXIS_INPUT_TUSER_WIDTH  => C_S_AXIS_INPUT_TUSER_WIDTH,
--       C_S_AXIS_CTRL_TDATA_WIDTH   => C_S_AXIS_CTRL_TDATA_WIDTH,
--       C_M_AXIS_OUTPUT_TDATA_WIDTH => C_M_AXIS_OUTPUT_TDATA_WIDTH,
--       C_M_AXIS_OUTPUT_TUSER_WIDTH => C_M_AXIS_OUTPUT_TUSER_WIDTH,
--       C_HAS_INFO                  => C_HAS_INFO,
--       C_HAS_N_IN                  => C_HAS_N_IN,
--       C_HAS_R_IN                  => C_HAS_R_IN,
--       C_GEN_START                 => C_GEN_START,
--       C_H                         => C_H,
--       C_K                         => C_K,
--       C_N                         => C_N,
--       C_POLYNOMIAL                => C_POLYNOMIAL,
--       C_SPEC                      => C_SPEC,
--       C_SYMBOL_WIDTH              => C_SYMBOL_WIDTH,
--       C_GEN_POLY_TYPE             => C_GEN_POLY_TYPE,
--       C_NUM_CHANNELS              => C_NUM_CHANNELS,
--       C_MEMSTYLE                  => C_MEMSTYLE,
--       C_OPTIMIZATION              => C_OPTIMIZATION,
--       C_MEM_INIT_PREFIX           => C_MEM_INIT_PREFIX,
--       C_ELABORATION_DIR           => C_ELABORATION_DIR,
--       C_XDEVICEFAMILY             => C_XDEVICEFAMILY,
--       C_FAMILY                    => C_FAMILY );
    
         
begin
      
  -- Group: architecture body
  
  ------------------------------------------------------------------------------
  -- Object: e1
  -- This is the encoder AXI wrapper, <rs_encoder_axi_wrapper>.
  -- This extracts signals from the AXI slave channels and combines signals
  -- to form the AXI master channels.
  e1: rs_encoder_axi_wrapper
  generic map(
    C_HAS_ACLKEN                  => C_HAS_ACLKEN,
    C_HAS_ARESETN                 => C_HAS_ARESETN,
    C_HAS_S_AXIS_CTRL             => C_HAS_S_AXIS_CTRL,
    C_HAS_S_AXIS_INPUT_TUSER      => C_HAS_S_AXIS_INPUT_TUSER,
    C_HAS_M_AXIS_OUTPUT_TUSER     => C_HAS_M_AXIS_OUTPUT_TUSER,
    C_HAS_M_AXIS_OUTPUT_TREADY    => C_HAS_M_AXIS_OUTPUT_TREADY,
    C_S_AXIS_INPUT_TDATA_WIDTH    => C_S_AXIS_INPUT_TDATA_WIDTH,
    C_S_AXIS_INPUT_TUSER_WIDTH    => C_S_AXIS_INPUT_TUSER_WIDTH,
    C_S_AXIS_CTRL_TDATA_WIDTH     => C_S_AXIS_CTRL_TDATA_WIDTH,
    C_M_AXIS_OUTPUT_TDATA_WIDTH   => C_M_AXIS_OUTPUT_TDATA_WIDTH,
    C_M_AXIS_OUTPUT_TUSER_WIDTH   => C_M_AXIS_OUTPUT_TUSER_WIDTH,
    C_HAS_INFO                    => C_HAS_INFO,   
    C_HAS_N_IN                    => C_HAS_N_IN,   
    C_HAS_R_IN                    => C_HAS_R_IN,   
    C_GEN_START                   => C_GEN_START,   
    C_H                           => C_H,   
    C_K                           => C_K,   
    C_N                           => C_N,   
    C_POLYNOMIAL                  => C_POLYNOMIAL,   
    C_SPEC                        => C_SPEC,   
    C_SYMBOL_WIDTH                => C_SYMBOL_WIDTH,   
    C_GEN_POLY_TYPE               => C_GEN_POLY_TYPE,
    C_NUM_CHANNELS                => C_NUM_CHANNELS,       
    C_MEMSTYLE                    => C_MEMSTYLE,
    C_OPTIMIZATION                => C_OPTIMIZATION,
    C_MEM_INIT_PREFIX             => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR             => C_ELABORATION_DIR,
    C_EVALUATION                  => boolean'pos(c_is_eval),
    C_XDEVICEFAMILY               => C_XDEVICEFAMILY,
    C_FAMILY                      => C_FAMILY
  )
  port map(
    aclk                           => aclk,
    aclken                         => aclken,
    aresetn                        => aresetn,
    s_axis_input_tdata             => s_axis_input_tdata,
    s_axis_input_tuser             => s_axis_input_tuser,
    s_axis_input_tvalid            => s_axis_input_tvalid,
    s_axis_input_tready            => s_axis_input_tready,
    s_axis_input_tlast             => s_axis_input_tlast,
    s_axis_ctrl_tdata              => s_axis_ctrl_tdata,
    s_axis_ctrl_tvalid             => s_axis_ctrl_tvalid,
    s_axis_ctrl_tready             => s_axis_ctrl_tready,
    m_axis_output_tdata            => m_axis_output_tdata,
    m_axis_output_tuser            => m_axis_output_tuser,
    m_axis_output_tvalid           => m_axis_output_tvalid,
    m_axis_output_tready           => m_axis_output_tready,
    m_axis_output_tlast            => m_axis_output_tlast,
    event_s_input_tlast_missing    => event_s_input_tlast_missing,
    event_s_input_tlast_unexpected => event_s_input_tlast_unexpected,
    event_s_ctrl_tdata_invalid     => event_s_ctrl_tdata_invalid
  );

end synth;










-- (c) Copyright 2002 - 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

-- AXI utils contains slave and master FIFOs
library axi_utils_v2_0_3;
use axi_utils_v2_0_3.axi_utils_v2_0_3_pkg.all;
use axi_utils_v2_0_3.axi_utils_comps.all;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_encoder_v9_0_11;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_consts.all;
use rs_encoder_v9_0_11.rs_encoder_v9_0_11_viv_comp.all;

entity rs_encoder_v9_0_11 is
  generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := 0;                   
  C_HAS_ARESETN                : integer := 0;                  
  C_HAS_S_AXIS_CTRL            : integer := 0;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := 0;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := 0;       
  C_HAS_M_AXIS_OUTPUT_TREADY   : integer := 0;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := 8;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := 1;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := 8;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := 8;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := 1;    
    
  -- AXI channel sub-field parameters
  C_HAS_INFO                   : integer := 0; 
  C_HAS_N_IN                   : integer := 0;
  C_HAS_R_IN                   : integer := 0;
  
  -- Reed-Solomon code word parameters
  C_GEN_START                  : integer := 0;
  C_H                          : integer := 1;
  C_K                          : integer := 239;
  C_N                          : integer := 255;
  C_POLYNOMIAL                 : integer := 0;
  C_SPEC                       : integer := 0;
  C_SYMBOL_WIDTH               : integer := 8;
  
  -- Implementation parameters
  C_GEN_POLY_TYPE              : integer := 0;
  C_NUM_CHANNELS               : integer := 1;
  C_MEMSTYLE                   : integer := 2;
  C_OPTIMIZATION               : integer := 2;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string  := "rse1";
  C_ELABORATION_DIR            : string  := "./";
  C_XDEVICEFAMILY              : string  := "no_family";
  C_FAMILY                     : string  := "no_family"
);
  port (
  aclk                           : in  std_logic;                                                                 
  aclken                         : in  std_logic := '1';                                                          
  aresetn                        : in  std_logic := '1';                                                          
  
  s_axis_input_tdata             : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser             : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid            : in  std_logic;                                                                 
  s_axis_input_tready            : out std_logic;                                                                 
  s_axis_input_tlast             : in  std_logic;                                                                 
    
  s_axis_ctrl_tdata              : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid             : in  std_logic := '0';                                                
  s_axis_ctrl_tready             : out std_logic;                                                                 
  
  m_axis_output_tdata            : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser            : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid           : out std_logic;                                                                 
  m_axis_output_tready           : in  std_logic := '1';                                                          
  m_axis_output_tlast            : out std_logic;                                                                 

  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
);
--core_if off

end entity rs_encoder_v9_0_11;

architecture xilinx of rs_encoder_v9_0_11 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  e1 : rs_encoder_v9_0_11_viv
    generic map (
      C_HAS_ACLKEN                => C_HAS_ACLKEN,
      C_HAS_ARESETN               => C_HAS_ARESETN,
      C_HAS_S_AXIS_CTRL           => C_HAS_S_AXIS_CTRL,
      C_HAS_S_AXIS_INPUT_TUSER    => C_HAS_S_AXIS_INPUT_TUSER,
      C_HAS_M_AXIS_OUTPUT_TUSER   => C_HAS_M_AXIS_OUTPUT_TUSER,
      C_HAS_M_AXIS_OUTPUT_TREADY  => C_HAS_M_AXIS_OUTPUT_TREADY,
      C_S_AXIS_INPUT_TDATA_WIDTH  => C_S_AXIS_INPUT_TDATA_WIDTH,
      C_S_AXIS_INPUT_TUSER_WIDTH  => C_S_AXIS_INPUT_TUSER_WIDTH,
      C_S_AXIS_CTRL_TDATA_WIDTH   => C_S_AXIS_CTRL_TDATA_WIDTH,
      C_M_AXIS_OUTPUT_TDATA_WIDTH => C_M_AXIS_OUTPUT_TDATA_WIDTH,
      C_M_AXIS_OUTPUT_TUSER_WIDTH => C_M_AXIS_OUTPUT_TUSER_WIDTH,
      C_HAS_INFO                  => C_HAS_INFO,
      C_HAS_N_IN                  => C_HAS_N_IN,
      C_HAS_R_IN                  => C_HAS_R_IN,
      C_GEN_START                 => C_GEN_START,
      C_H                         => C_H,
      C_K                         => C_K,
      C_N                         => C_N,
      C_POLYNOMIAL                => C_POLYNOMIAL,
      C_SPEC                      => C_SPEC,
      C_SYMBOL_WIDTH              => C_SYMBOL_WIDTH,
      C_GEN_POLY_TYPE             => C_GEN_POLY_TYPE,
      C_NUM_CHANNELS              => C_NUM_CHANNELS,
      C_MEMSTYLE                  => C_MEMSTYLE,
      C_OPTIMIZATION              => C_OPTIMIZATION,
      C_MEM_INIT_PREFIX           => C_MEM_INIT_PREFIX,
      C_ELABORATION_DIR           => C_ELABORATION_DIR,
      C_XDEVICEFAMILY             => C_XDEVICEFAMILY,
      C_FAMILY                    => C_FAMILY
      )
    port map (
      aclk                           => aclk,
      aclken                         => aclken,
      aresetn                        => aresetn,
      s_axis_input_tdata             => s_axis_input_tdata,
      s_axis_input_tuser             => s_axis_input_tuser,
      s_axis_input_tvalid            => s_axis_input_tvalid,
      s_axis_input_tlast             => s_axis_input_tlast,
      s_axis_input_tready            => s_axis_input_tready,
      s_axis_ctrl_tdata              => s_axis_ctrl_tdata,
      s_axis_ctrl_tvalid             => s_axis_ctrl_tvalid,
      s_axis_ctrl_tready             => s_axis_ctrl_tready,
      m_axis_output_tdata            => m_axis_output_tdata,
      m_axis_output_tuser            => m_axis_output_tuser,
      m_axis_output_tvalid           => m_axis_output_tvalid,
      m_axis_output_tready           => m_axis_output_tready,
      m_axis_output_tlast            => m_axis_output_tlast,
      event_s_input_tlast_missing    => event_s_input_tlast_missing,
      event_s_input_tlast_unexpected => event_s_input_tlast_unexpected,
      event_s_ctrl_tdata_invalid     => event_s_ctrl_tdata_invalid
      );
  
end architecture xilinx;




