--------------------------------------------------------------------------------
--  (c) Copyright 1995-2011 Xilinx, Inc. All rights reserved.
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
-- $RCSfile: rs_decoder_v9_0_12_consts.vhd,v $ $Revision: 1.3 $ $Date: 2011/05/25 10:24:14 $
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: rs_decoder_v9_0_12_consts
-- Constants and functions for use in top level component statement.
--

library ieee;
use ieee.std_logic_1164.all;

package rs_decoder_v9_0_12_consts is

--------------------------------------------------------------------------------
--
-- Group: General constants
--
-- Constants:
--
constant axi_field_factor : integer := 8; -- All sub-fields of tdata busses must be a multiple of this value


--------------------------------------------------------------------------------
--
-- Group: Constants to define dual basis or normal basis
--
-- Constants:
--
constant c_spec_min : integer := 0;
constant c_spec_max : integer := 2;

constant j83_b_spec  : integer := 2;
constant ccsds_spec  : integer := 1;
constant custom_spec : integer := 0;


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
constant c_s_axis_input_tdata_width_default   : integer := 8;     
constant c_s_axis_input_tuser_width_default   : integer := 1;     
constant c_s_axis_ctrl_tdata_width_default    : integer := 8;   
constant c_m_axis_output_tdata_width_default  : integer := 8;    
constant c_m_axis_output_tuser_width_default  : integer := 1;    
constant c_m_axis_stat_tdata_width_default    : integer := 8;   
constant c_has_data_del_default               : integer := 0;
constant c_has_erase_default                  : integer := 0;
constant c_has_err_stats_default              : integer := 0; 
constant c_has_info_default                   : integer := 0; 
constant c_has_n_in_default                   : integer := 0;
constant c_has_r_in_default                   : integer := 0;
constant c_gen_start_default                  : integer := 0;
constant c_h_default                          : integer := 1;
constant c_k_default                          : integer := 239;
constant c_n_default                          : integer := 255;
constant c_polynomial_default                 : integer := 0;
constant c_spec_default                       : integer := 0;
constant c_symbol_width_default               : integer := 8;
constant c_ignore_illegal_n_r_default         : integer := 1;
constant c_define_legal_r_vals_default        : integer := 0;
constant c_num_legal_r_values_default         : integer := 2;
constant c_legal_r_vector_file_default        : string  := "null.mif";
constant c_num_channels_default               : integer := 1;
constant c_num_punc_patterns_default          : integer := 0;
constant c_puncture_select_file_default       : string  := "null.mif";
constant c_puncture_vector_file_default       : string  := "null.mif";
constant c_memstyle_default                   : integer := 2;
constant c_output_check_symbols_default       : integer := 1;
constant c_optimisation_default               : integer := 1;
constant c_self_recovering_default            : integer := 0;
constant c_mem_init_prefix_default            : string  := "rsd1";
constant c_elaboration_dir_default            : string  := "./";
constant c_default_xdevicefamily              : string  := "no_family";
constant c_default_family                     : string  := "no_family";


--------------------------------------------------------------------------------
--
-- Group: Parameter limit constants (min/max's)
--
-- Constants:
--
constant min_symbol_width          : integer := 3;
constant max_symbol_width          : integer := 12;
constant max_symbol_width_minus_1  : integer := max_symbol_width - 1;
constant min_num_channels          : integer := 1;
constant max_num_channels          : integer := 128;
constant min_num_marker_bits       : integer := 1;
constant max_num_marker_bits       : integer := 16; -- arbitrary, but make it a multiple of 8 for AXI
constant min_gen_start             : integer := 0;
constant max_gen_start             : integer := 1023;

-- Minimum value for fixed R decoder
constant decoder_min_n_minus_k       : integer := 2;
constant decoder_min_n_minus_k_ccsds : integer := 3;
constant decoder_max_n_minus_k       : integer := 256;
constant min_num_legal_r_values      : integer := 2;
constant max_num_legal_r_values      : integer := decoder_max_n_minus_k-decoder_min_n_minus_k+1;

-- Limited to stop erasure ROMS from getting too big
constant min_num_punc_patterns     : integer := 0;
constant max_num_punc_patterns     : integer := 128;
constant variable_decoder_min_n    : integer := 5;
constant decoder_min_n             : integer := 5;
constant decoder_max_n             : integer := (2**max_symbol_width) -1;
constant decoder_min_k             : integer := 1;
constant decoder_max_k             : integer := decoder_max_n - decoder_min_n_minus_k;
constant decoder_min_h             : integer := 1;
constant decoder_max_h             : integer := (2**16)-1;

-- AXI width limits
constant min_s_axis_input_tdata_width  : integer := 8;  -- erase, data_in fields,
constant max_s_axis_input_tdata_width  : integer := 24; --  each field rounded up to nearest multiple of 8
constant min_s_axis_input_tuser_width  : integer := min_num_marker_bits; 
constant max_s_axis_input_tuser_width  : integer := max_num_marker_bits;
constant min_s_axis_ctrl_tdata_width   : integer := 8;  -- punc_sel, r_in, n_in fields,
constant max_s_axis_ctrl_tdata_width   : integer := 40; --  each field rounded up to nearest multiple of 8
constant min_m_axis_stat_tdata_width   : integer := 8;  -- bit_err, erase_cnt, err_cnt, err_found, fail fields,
constant max_m_axis_stat_tdata_width   : integer := 48; --  each field rounded up to nearest multiple of 8
constant min_m_axis_output_tdata_width : integer := 8;  -- info, data_del, data_out fields,
constant max_m_axis_output_tdata_width : integer := 40; --  each field rounded up to nearest multiple of 8
constant min_m_axis_output_tuser_width : integer := min_num_marker_bits; 
constant max_m_axis_output_tuser_width : integer := max_num_marker_bits;



--------------------------------------------------------------------------------
--
-- Function declarations
--
--------------------------------------------------------------------------------
function integer_width( integer_value : integer ) return integer;
      
      
end rs_decoder_v9_0_12_consts;
          
          
          
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package body rs_decoder_v9_0_12_consts is

-- Group: Functions


--------------------------------------------------------------------------------
-- Function: integer_width
--  Return number of bits needed to represent the supplied integer as an
--  unsigned binary number. This only works for 0 or positive integers.
--
-- Parameters:
--  integer_value - a non-negative integer
--
-- Returns:
--  Integer number of bits needed to represent integer_value
--
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
  
  
end rs_decoder_v9_0_12_consts;




--------------------------------------------------------------------------------
--  (c) Copyright 1995-2011 Xilinx, Inc. All rights reserved.
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
-- Object: rs_decoder_v9_0_12_viv_comp
--  This file contains the component declaration for the top level XST file.
--  This package allows the core to be instantiated by higher level XST cores.
--  It is analyzed by XST.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;

package rs_decoder_v9_0_12_viv_comp is

--------------------------------------------------------------------------------
component rs_decoder_v9_0_12_viv
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := c_has_aclken_default;                   
  C_HAS_ARESETN                : integer := c_has_aresetn_default;                  
  C_HAS_S_AXIS_CTRL            : integer := c_has_s_axis_ctrl_default;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := c_has_s_axis_input_tuser_default;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := c_has_m_axis_output_tuser_default;       
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := c_s_axis_input_tdata_width_default;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := c_s_axis_input_tuser_width_default;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := c_s_axis_ctrl_tdata_width_default;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := c_m_axis_output_tdata_width_default;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := c_m_axis_output_tuser_width_default;    
  C_M_AXIS_STAT_TDATA_WIDTH    : integer := c_m_axis_stat_tdata_width_default;   
    
  -- AXI channel sub-field parameters
  C_HAS_DATA_DEL               : integer := c_has_data_del_default;
  C_HAS_ERASE                  : integer := c_has_erase_default;
  C_HAS_ERR_STATS              : integer := c_has_err_stats_default; 
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
  C_IGNORE_ILLEGAL_N_R         : integer := c_ignore_illegal_n_r_default;
  C_DEFINE_LEGAL_R_VALS        : integer := c_define_legal_r_vals_default;
  C_NUM_LEGAL_R_VALUES         : integer := c_num_legal_r_values_default;
  C_LEGAL_R_VECTOR_FILE        : string  := c_legal_r_vector_file_default;
  C_NUM_CHANNELS               : integer := c_num_channels_default;
  C_NUM_PUNC_PATTERNS          : integer := c_num_punc_patterns_default;
  C_PUNCTURE_SELECT_FILE       : string  := c_puncture_select_file_default;
  C_PUNCTURE_VECTOR_FILE       : string  := c_puncture_vector_file_default;
  C_MEMSTYLE                   : integer := c_memstyle_default;
  C_OUTPUT_CHECK_SYMBOLS       : integer := c_output_check_symbols_default;
  C_OPTIMISATION               : integer := c_optimisation_default;
  C_SELF_RECOVERING            : integer := c_self_recovering_default;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string  := c_mem_init_prefix_default;
  C_ELABORATION_DIR            : string  := c_elaboration_dir_default;
  C_XDEVICEFAMILY              : string  := c_default_xdevicefamily;
  C_FAMILY                     : string  := c_default_family
);
port (
  aclk                           : in  std_logic;                                                                 
  aclken                         : in  std_logic := '1';                                                          
  aresetn                        : in  std_logic := '1';                                                          
  
  s_axis_input_tdata             : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser             : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid            : in  std_logic;                                                                 
  s_axis_input_tlast             : in  std_logic;                                                                 
  s_axis_input_tready            : out std_logic;                                                                 
    
  s_axis_ctrl_tdata              : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid             : in  std_logic := '0';                                                
  s_axis_ctrl_tready             : out std_logic;                                                                 
  
  m_axis_output_tdata            : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser            : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid           : out std_logic;                                                                 
  m_axis_output_tready           : in  std_logic := '1';                                                          
  m_axis_output_tlast            : out std_logic;                                                                 

  m_axis_stat_tdata              : out std_logic_vector(C_M_AXIS_STAT_TDATA_WIDTH-1 downto 0);                  
  m_axis_stat_tvalid             : out std_logic;                                                                 
  m_axis_stat_tlast              : out std_logic;                                                                 
  m_axis_stat_tready             : in  std_logic := '1';
  
  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
  
);
end component; -- rs_decoder_v9_0_12_viv


end rs_decoder_v9_0_12_viv_comp;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/dec_pkg.vhd,v 1.6 2011/06/30 14:35:50 andreww Exp $
--
-- Reed-Solomon Decoder Package
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--
--  Model:  PACKAGE dec_pkg
--
--  Shared functions
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;


library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;


--------------------------------------------------------------------------------
package dec_pkg is

type is_primitive_vector is array(natural range <>) of integer;


-- Check param within min and max
procedure check_min_max(param       : in    integer;
                        min         : in    integer;
                        max         : in    integer;
                        param_name  : in    string;
                        param_legal : inout boolean);

-- Check top level generics
function check_generics(
  C_HAS_ACLKEN                 : integer;
  C_HAS_ARESETN                : integer;
  C_HAS_S_AXIS_CTRL            : integer;
  C_HAS_S_AXIS_INPUT_TUSER     : integer;
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer;
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer;
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer;
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer;
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer;
  C_M_AXIS_STAT_TDATA_WIDTH    : integer;
  C_HAS_DATA_DEL               : integer;
  C_HAS_ERASE                  : integer;
  C_HAS_ERR_STATS              : integer;
  C_HAS_INFO                   : integer;
  C_HAS_N_IN                   : integer;
  C_HAS_R_IN                   : integer;
  C_GEN_START                  : integer;
  C_H                          : integer;
  C_K                          : integer;
  C_N                          : integer;
  C_POLYNOMIAL                 : integer;
  C_SPEC                       : integer;
  C_SYMBOL_WIDTH               : integer;
  C_IGNORE_ILLEGAL_N_R         : integer;
  C_DEFINE_LEGAL_R_VALS        : integer;
  C_NUM_LEGAL_R_VALUES         : integer;
  C_LEGAL_R_VECTOR_FILE        : string ;
  C_NUM_CHANNELS               : integer;
  C_NUM_PUNC_PATTERNS          : integer;
  C_PUNCTURE_SELECT_FILE       : string ;
  C_PUNCTURE_VECTOR_FILE       : string ;
  C_MEMSTYLE                   : integer;
  C_OUTPUT_CHECK_SYMBOLS       : integer;
  C_OPTIMISATION               : integer;
  C_SELF_RECOVERING            : integer;
  C_MEM_INIT_PREFIX            : string ;
  C_ELABORATION_DIR            : string ;
  C_XDEVICEFAMILY              : string ;
  C_FAMILY                     : string ) return boolean;

function get_decoder_latency(n_val               : natural;
                             r_val               : natural;
                             c_spec              : integer;
                             c_symbol_width      : integer;
                             c_has_erase         : integer;
                             c_has_n_in          : integer;
                             c_num_channels      : integer;
                             c_num_punc_patterns : integer) return natural;

-- Min and max values allowed for r_in
function get_r_in_limits(c_has_r_in             : integer;
                         legal_r_vector         : XBIP_UTILS_integer_vector;
                         define_legal_r_values  : integer;
                         has_puncturing         : boolean;
                         puncture_select_vector : XBIP_UTILS_integer_vector;
                         n_minus_k              : integer;
                         c_spec                 : integer) return min_max_int_type;

-- Min and max values allowed for n_in
function get_n_in_limits(c_has_n_in             : integer;
                         c_n                    : integer;
                         num_punc_patterns      : integer;
                         puncture_vector        : XBIP_UTILS_integer_vector;
                         puncture_select_vector : XBIP_UTILS_integer_vector) return min_max_int_type;

-- produce xor of natural numbers
function natural_xor(a, b, num_bits : integer) return integer;

-- define function that cheks if the polynomial is primitive
function field_poly_is_primitive(symbol_width : integer;
                                 field_poly   : integer;
                                 disp_debug   : integer ) return boolean;

-- function to calculate the processing delay
function get_proc_delay (n             : integer;
                         k             : integer;
                         has_erase     : integer;
                         num_channels  : integer) return integer;

end dec_pkg;




--------------------------------------------------------------------------------
-- PACKAGE BODY
--------------------------------------------------------------------------------
package body dec_pkg is




--------------------------------------------------------------------------------
-- Procedure: check_min_max
--  Check if supplied parameter is within minimum and maximum limits.
--
-- Parameters:
--  param      - integer value to be checked
--  min        - minimum legal value
--  max        - maximum legal value
--  param_name - string name of param to be displayed in error message
--  param_legal - inout boolean, set to false if param is illegal, otherwise untouched
--                This allows a sequence of calls to check_min_max and if any one call
--                fails then the supplied value for param_legal will be false.
--
--  An assertion note will be displayed if param is out of range.
--
procedure check_min_max(param       : in    integer;
                        min         : in    integer;
                        max         : in    integer;
                        param_name  : in    string;
                        param_legal : inout boolean) is
begin

  -- coverage off
  if (param < min or param > max) then
    param_legal := false;

    assert false
      report "ERROR: Reed-Solomon Decoder: " & param_name & " (" & integer'image(param) &
             ") is out of range (" & integer'image(min) & " to " & integer'image(max) & ")" & new_line
      severity note;

  end if;
  -- coverage on

end check_min_max;





--------------------------------------------------------------------------------
-- Function: check_generics
--  Check if supplied generics are legal. Include function in this package so
--  it is accessible from the top level.
--
-- Parameters:
--  All core generics...
-- Returns:
--  Boolean true if generics are legal. Function will not return if generics
--  are illegal; a failure assertion will be generated.
--
function check_generics(
  C_HAS_ACLKEN                 : integer;
  C_HAS_ARESETN                : integer;
  C_HAS_S_AXIS_CTRL            : integer;
  C_HAS_S_AXIS_INPUT_TUSER     : integer;
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer;
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer;
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer;
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer;
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer;
  C_M_AXIS_STAT_TDATA_WIDTH    : integer;
  C_HAS_DATA_DEL               : integer;
  C_HAS_ERASE                  : integer;
  C_HAS_ERR_STATS              : integer;
  C_HAS_INFO                   : integer;
  C_HAS_N_IN                   : integer;
  C_HAS_R_IN                   : integer;
  C_GEN_START                  : integer;
  C_H                          : integer;
  C_K                          : integer;
  C_N                          : integer;
  C_POLYNOMIAL                 : integer;
  C_SPEC                       : integer;
  C_SYMBOL_WIDTH               : integer;
  C_IGNORE_ILLEGAL_N_R         : integer;
  C_DEFINE_LEGAL_R_VALS        : integer;
  C_NUM_LEGAL_R_VALUES         : integer;
  C_LEGAL_R_VECTOR_FILE        : string ;
  C_NUM_CHANNELS               : integer;
  C_NUM_PUNC_PATTERNS          : integer;
  C_PUNCTURE_SELECT_FILE       : string ;
  C_PUNCTURE_VECTOR_FILE       : string ;
  C_MEMSTYLE                   : integer;
  C_OUTPUT_CHECK_SYMBOLS       : integer;
  C_OPTIMISATION               : integer;
  C_SELF_RECOVERING            : integer;
  C_MEM_INIT_PREFIX            : string ;
  C_ELABORATION_DIR            : string ;
  C_XDEVICEFAMILY              : string ;
  C_FAMILY                     : string ) return boolean is

  constant erase_field_width   : integer := axi_field_factor;
  constant info_field_width    : integer := axi_field_factor;
  constant gf_max              : integer := 2**C_SYMBOL_WIDTH - 1;
  constant max_k               : integer := C_N-decoder_min_n_minus_k;
  constant max_n               : integer := gf_max;
  constant n_minus_k           : integer := C_N - C_K;
  constant r_width             : integer := integer_width(n_minus_k);


  variable bit_err_width                      : integer;
  variable data_in_field_width                : integer;
  variable n_in_field_width                   : integer;
  variable r_in_field_width                   : integer;
  variable punc_sel_field_width               : integer;
  variable err_cnt_width                      : integer;
  variable erase_cnt_width                    : integer;
  variable expected_c_has_s_axis_ctrl         : integer;
  variable expected_m_axis_output_tdata_width : integer;
  variable expected_m_axis_stat_tdata_width   : integer;
  variable expected_s_axis_ctrl_tdata_width   : integer;
  variable expected_s_axis_input_tdata_width  : integer;
  variable generics_legal                     : boolean := true;

begin

  ------------------------------------------------------------------------------
  -- Check C_HAS_S_AXIS_CTRL
  expected_c_has_s_axis_ctrl := boolean'pos(C_HAS_N_IN/=0 or C_HAS_R_IN/=0 or C_NUM_PUNC_PATTERNS>1);

  -- coverage off
  if (C_HAS_S_AXIS_CTRL /= expected_c_has_s_axis_ctrl) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: C_HAS_S_AXIS_CTRL value (" &
       integer'image(C_HAS_S_AXIS_CTRL) &
       ") is not compatible with C_HAS_N_IN (" & integer'image(C_HAS_N_IN) &
       ") or C_HAS_R_IN (" & integer'image(C_HAS_R_IN) &
       ") or C_NUM_PUNC_PATTERNS (" & integer'image(C_NUM_PUNC_PATTERNS) & ")" &
       new_line
      severity note;
  end if;
  -- coverage on

  ------------------------------------------------------------------------------
  -- Check C_HAS_S_AXIS_INPUT_TUSER and C_HAS_M_AXIS_OUTPUT_TUSER
  -- coverage off
  if (C_HAS_S_AXIS_INPUT_TUSER /= C_HAS_M_AXIS_OUTPUT_TUSER) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: C_HAS_S_AXIS_INPUT_TUSER is not equal to C_HAS_M_AXIS_OUTPUT_TUSER." &
       "There is no point having an input tuser port without an output tuser port, and vice-versa." &
       new_line
      severity note;
  end if;
  -- coverage on


  ------------------------------------------------------------------------------
  -- Check C_S_AXIS_INPUT_TDATA_WIDTH
  data_in_field_width := roundup_to_multiple(C_SYMBOL_WIDTH, axi_field_factor);

  if (C_HAS_ERASE = 0) then
    expected_s_axis_input_tdata_width := data_in_field_width;
  else
    expected_s_axis_input_tdata_width := data_in_field_width + erase_field_width;
  end if; -- C_HAS_ERASE = 0

  -- coverage off
  if (C_S_AXIS_INPUT_TDATA_WIDTH /= expected_s_axis_input_tdata_width) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: C_S_AXIS_INPUT_TDATA_WIDTH (" &
       integer'image(C_S_AXIS_INPUT_TDATA_WIDTH) &
       ") does not equal expected value (" &
       integer'image(expected_s_axis_input_tdata_width) & ")" &
       new_line
      severity note;
  end if;
  -- coverage on


  ------------------------------------------------------------------------------
  -- Check C_S_AXIS_INPUT_TUSER_WIDTH is within limits
  check_min_max(param=>C_S_AXIS_INPUT_TUSER_WIDTH, min=>min_num_marker_bits, max=>max_num_marker_bits,
                param_name=>"C_S_AXIS_INPUT_TUSER_WIDTH", param_legal=>generics_legal);



  ------------------------------------------------------------------------------
  -- Check C_S_AXIS_CTRL_TDATA_WIDTH
  if (C_HAS_S_AXIS_CTRL /= 0) then
    n_in_field_width     := data_in_field_width;
    r_in_field_width     := roundup_to_multiple(r_width, axi_field_factor);
    punc_sel_field_width := roundup_to_multiple(integer_width(C_NUM_PUNC_PATTERNS-1), axi_field_factor);

    if (C_HAS_N_IN /= 0) then
      expected_s_axis_ctrl_tdata_width := n_in_field_width;
    else
      expected_s_axis_ctrl_tdata_width := 0;
    end if; -- C_HAS_N_IN /= 0

    if (C_HAS_R_IN /= 0) then
      expected_s_axis_ctrl_tdata_width := expected_s_axis_ctrl_tdata_width + r_in_field_width;
    end if; -- C_HAS_R_IN /= 0

    if (C_NUM_PUNC_PATTERNS > 1) then
      expected_s_axis_ctrl_tdata_width := expected_s_axis_ctrl_tdata_width + punc_sel_field_width;
    end if; -- C_NUM_PUNC_PATTERNS > 1

    -- coverage off
    if (C_S_AXIS_CTRL_TDATA_WIDTH /= expected_s_axis_ctrl_tdata_width) then
      generics_legal := false;

      assert false
        report new_line &
         "ERROR: Reed-Solomon Decoder: C_S_AXIS_CTRL_TDATA_WIDTH (" &
         integer'image(C_S_AXIS_CTRL_TDATA_WIDTH) &
         ") does not equal expected value (" &
         integer'image(expected_s_axis_ctrl_tdata_width) & ")" &
         new_line
        severity note;
    end if;
    -- coverage off
  else

    -- Just check it is within acceptable limits if ctrl port is not used
    -- coverage off
    if (C_S_AXIS_CTRL_TDATA_WIDTH <= 0) then
      generics_legal := false;

      assert false
        report new_line &
         "ERROR: Reed-Solomon Decoder: C_S_AXIS_CTRL_TDATA_WIDTH (" &
         integer'image(C_S_AXIS_CTRL_TDATA_WIDTH) &
         ") must be greater than 0" &
         new_line
        severity note;
      end if;
      -- coverage on
  end if; -- C_HAS_S_AXIS_CTRL



  ------------------------------------------------------------------------------
  -- Check C_M_AXIS_OUTPUT_TDATA_WIDTH
  if (C_HAS_DATA_DEL /= 0) then
    expected_m_axis_output_tdata_width := data_in_field_width + data_in_field_width;
  else
    expected_m_axis_output_tdata_width := data_in_field_width;
  end if; -- C_HAS_DATA_DEL /= 0

  if (C_HAS_INFO /= 0) then
    expected_m_axis_output_tdata_width := expected_m_axis_output_tdata_width + info_field_width;
  end if; -- C_HAS_INFO /= 0

  -- coverage off
  if (C_M_AXIS_OUTPUT_TDATA_WIDTH /= expected_m_axis_output_tdata_width) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: C_M_AXIS_OUTPUT_TDATA_WIDTH (" &
       integer'image(C_M_AXIS_OUTPUT_TDATA_WIDTH) &
       ") does not equal expected value (" &
       integer'image(expected_m_axis_output_tdata_width) & ")" &
       new_line
      severity note;
  end if;
  -- coverage on

  ------------------------------------------------------------------------------
  -- Check C_M_AXIS_OUTPUT_TUSER_WIDTH is within limits
  check_min_max(param=>C_M_AXIS_OUTPUT_TUSER_WIDTH, min=>min_num_marker_bits, max=>max_num_marker_bits,
                param_name=>"C_M_AXIS_OUTPUT_TUSER_WIDTH", param_legal=>generics_legal);


  ------------------------------------------------------------------------------
  -- Check C_M_AXIS_STAT_TDATA_WIDTH
  err_cnt_width := r_width;

  if (C_HAS_ERASE /= 0) or (C_NUM_PUNC_PATTERNS > 0) then
    erase_cnt_width := integer_width(C_N);
    expected_m_axis_stat_tdata_width := 2 + err_cnt_width + erase_cnt_width;
  else
    expected_m_axis_stat_tdata_width := 2 + err_cnt_width;
  end if; -- (C_HAS_ERASE /= 0) or (C_NUM_PUNC_PATTERNS > 0)

  if (C_HAS_ERR_STATS /= 0) then
    bit_err_width := integer_width(n_minus_k * C_SYMBOL_WIDTH);
    expected_m_axis_stat_tdata_width := expected_m_axis_stat_tdata_width + (2 * bit_err_width);
  end if; -- (C_HAS_ERR_STATS /= 0)

  expected_m_axis_stat_tdata_width := roundup_to_multiple(expected_m_axis_stat_tdata_width, axi_field_factor);

  -- coverage off
  if (C_M_AXIS_STAT_TDATA_WIDTH /= expected_m_axis_stat_tdata_width) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: C_M_AXIS_STAT_TDATA_WIDTH (" &
       integer'image(C_M_AXIS_STAT_TDATA_WIDTH) &
       ") does not equal expected value (" &
       integer'image(expected_m_axis_stat_tdata_width) & ")" &
       new_line
       severity note;
   end if;
  -- coverage off

  ------------------------------------------------------------------------------
  -- Check C_SYMBOL_WIDTH
  check_min_max(param=>C_SYMBOL_WIDTH, min=>min_symbol_width, max=>max_symbol_width,
                param_name=>"C_SYMBOL_WIDTH", param_legal=>generics_legal);

  -- coverage off
  if (C_SPEC = ccsds_spec and C_SYMBOL_WIDTH /= 8) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: C_SYMBOL_WIDTH must be set to 8 in CCSDS mode" &
       new_line
      severity note;
  end if;
  -- coverage on

  ------------------------------------------------------------------------------
  -- Check C_GEN_START
  check_min_max(param=>C_GEN_START, min=>min_gen_start, max=>max_gen_start,
                param_name=>"C_GEN_START", param_legal=>generics_legal);



  ------------------------------------------------------------------------------
  -- Check that the field polynomial is primitive
  -- coverage off
  if not(field_poly_is_primitive(C_SYMBOL_WIDTH, C_POLYNOMIAL, 0)) then

    generics_legal := false;

    assert false
      report "ERROR: Reed-Solomon Decoder: field polynomial is not valid"&new_line
      severity note;

  end if;
  -- coverage on



  ------------------------------------------------------------------------------
  -- Check C_H is valid
  -- coverage off
  if (get_gcd(C_H, gf_max) /= 1) then
    generics_legal := false;

    assert false
      report "ERROR: Reed-Solomon Decoder: H and (2^symbol_width-1) must have " &
             "a greatest common divisor of 1" & new_line &
             "(i.e. they must be relative primes)." & new_line
      severity note;
  end if;
  -- coverage on

  ------------------------------------------------------------------------------
  -- Check C_N is valid
  -- coverage off
  if (C_HAS_N_IN /= 0 and C_N /= gf_max) then
    generics_legal := false;

    assert false
      report "ERROR: Reed-Solomon Decoder: N must be set to 2^symbol_width -1 (=" &
             integer'image(gf_max) & ")" & new_line
      severity note;
  end if;
  -- coverage on

  check_min_max(param=>C_N, min=>decoder_min_n, max=>max_n, param_name=>"C_N", param_legal=>generics_legal);

  ------------------------------------------------------------------------------
  -- Check C_K is valid
  check_min_max(param=>C_K, min=>decoder_min_k, max=>max_k, param_name=>"C_K", param_legal=>generics_legal);



  ------------------------------------------------------------------------------
  -- Check C_N-C_K is valid
  check_min_max(param=>n_minus_k, min=>decoder_min_n_minus_k, max=>decoder_max_n_minus_k,
                param_name=>"C_N-C_K", param_legal=>generics_legal);

  -- coverage off
  if (C_SPEC = ccsds_spec and n_minus_k < decoder_min_n_minus_k_ccsds) then
    generics_legal := false;

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: (C_N-C_K) must be " & integer'image(decoder_min_n_minus_k_ccsds) &
       " or more for CCSDS. It is set to " & integer'image(n_minus_k) & "." &
       new_line
      severity note;
  end if;
  -- coverage on


  ------------------------------------------------------------------------------
  -- Check C_NUM_CHANNELS
  -- coverage off
  if ((C_HAS_N_IN /= 0 or C_HAS_R_IN /= 0) and C_NUM_CHANNELS > 1) then
    generics_legal := false;

    assert false
      report "ERROR: Reed-Solomon Decoder: Multiple channels not supported if N or R is variable." & new_line
      severity note;
  end if;
  -- coverage on

  check_min_max(param=>C_NUM_CHANNELS, min=>min_num_channels, max=>max_num_channels,
                param_name=>"C_NUM_CHANNELS", param_legal=>generics_legal);


  ------------------------------------------------------------------------------
  -- Check C_NUM_LEGAL_R_VALUES
  check_min_max(param=>C_NUM_LEGAL_R_VALUES, min=>min_num_legal_r_values, max=>max_num_legal_r_values,
                param_name=>"C_NUM_LEGAL_R_VALUES", param_legal=>generics_legal);


  ------------------------------------------------------------------------------
  -- Check Puncturing not selected along with Erasures
  -- coverage off
  if (C_HAS_ERASE /= 0 and C_NUM_PUNC_PATTERNS > 0) then
    generics_legal := false;

    assert false
      report "ERROR: Reed-Solomon Decoder: Puncturing not supported if core has " &
             "erasure handling. Assert erase input when symbols are to be punctured instead." & new_line
      severity note;

  end if;
  -- coverage on

  check_min_max(param=>C_NUM_PUNC_PATTERNS, min=>min_num_punc_patterns, max=>max_num_punc_patterns,
                param_name=>"C_NUM_PUNC_PATTERNS", param_legal=>generics_legal);


  ------------------------------------------------------------------------------
  -- Check <C_OUTPUT_CHECK_SYMBOLS> dependencies
  if (C_OUTPUT_CHECK_SYMBOLS = 0) then

    -- coverage off
    if (C_HAS_INFO /= 0) then
      generics_legal := false;

      assert false
        report "ERROR: Reed-Solomon Decoder:  Cannot have info output if " &
               "not outputting the check symbols. " & new_line
        severity note;
    end if;
    -- coverage on
  end if;


  -- Uncomment if you want to be sure this function has been run
--   assert false
--     report new_line &
--      "Reed-Solomon Decoder: parameter checking completed" & new_line
--     severity note;


  ------------------------------------------------------------------------------
  -- If generics are not legal do not return from this function. This forces
  -- Modelsim to print the assertion report. If function returns then the
  -- assertion report is not printed.
  -- coverage off
  if (generics_legal) then
    return true;
  else

    assert false
      report new_line &
       "ERROR: Reed-Solomon Decoder: illegal parameters supplied" & new_line
      severity failure;

    --return false; -- Comment this out or Modelsim does not print the assertion report messages
  end if;
  -- coverage on

end check_generics;


--------------------------------------------------------------------------------
-- Function: get_r_in_limits
--  Determine minimum and maximum values of r_in, based on supplied parameters.
-- Parameters:
--  c_has_r_in - integer, 0 if core has fixed number of check symbols, 1 if it is variable
--  legal_r_vector - array of integers, containing legal values of r_in
--  define_legal_r_vector - integer=1 if legal_r_vector is to be used, else 0
--  has_puncturing - boolean, true if there is a puncture_select_vector
--  puncture_select_vector - array of integers, containing number of punctures for each
--                           punc_sel input value
--  n_minus_k - integer, number of check symbols provided to core as generics (C_N-C_K)
--  c_spec - integer, core C_SPEC parameter
-- Returns:
--  <min_max_int_type> record containing minimum and maximum legal r_in values
--
function get_r_in_limits(c_has_r_in             : integer;
                         legal_r_vector         : XBIP_UTILS_integer_vector;
                         define_legal_r_values  : integer;
                         has_puncturing         : boolean;
                         puncture_select_vector : XBIP_UTILS_integer_vector;
                         n_minus_k              : integer;
                         c_spec                 : integer) return min_max_int_type is

  -- Determine absolute minimum and maximum based on hard limits in consts pkg
  constant abs_min_r : integer :=
    select_val_b(decoder_min_n_minus_k, decoder_min_n_minus_k_ccsds, c_spec=ccsds_spec);
  variable min_r_val  : integer;
  variable max_r_val  : integer;
  variable return_val : min_max_int_type;
begin


  if c_has_r_in = 0 then -- fixed r_in
    min_r_val := n_minus_k;
    max_r_val := n_minus_k;

  else -- variable r_in


    if define_legal_r_values /= 0 then

      min_r_val := n_minus_k; -- Init to max and look for lower values in legal_r_vector
      max_r_val := abs_min_r; -- Init to min and look for higher values in legal_r_vector

      for i in legal_r_vector'range loop
        if legal_r_vector(i) < min_r_val then
          min_r_val := legal_r_vector(i);
        end if;
        if legal_r_vector(i) > max_r_val then
          max_r_val := legal_r_vector(i);
        end if;
      end loop;

      -- coverage off
      -- Check we are still within absolute limits
      if min_r_val < abs_min_r then
        min_r_val := abs_min_r;
      end if;
      if max_r_val > n_minus_k then
        max_r_val := n_minus_k;
      end if;
      -- coverage on

    elsif has_puncturing then

      -- r_in must always be large enough to correct the minimum number of punctures
      min_r_val := n_minus_k; -- Init to max and look for lower values in puncture_select_vector
      max_r_val := n_minus_k;

      for i in puncture_select_vector'range loop
        if puncture_select_vector(i) < min_r_val then
          min_r_val := puncture_select_vector(i);
        end if;
      end loop;

      -- Check we are still within absolute limits
      if min_r_val < abs_min_r then
        min_r_val := abs_min_r;
      end if;

    else -- no puncturing and no defined legal r values

      -- Set limits to absolute values
      min_r_val := abs_min_r;
      max_r_val := n_minus_k;

    end if; -- define_legal_r_values /= 0

  end if; -- c_has_r_in = 0

  return_val.min := min_r_val;
  return_val.max := max_r_val;
  return return_val;

end get_r_in_limits;



--------------------------------------------------------------------------------
-- Function: get_n_in_limits
--  Determine minimum and maximum values of n_in, based on supplied parameters.
-- Parameters:
--  c_has_n_in - integer, 1 if core has variable block length, else 0
--  c_n - block length (core C_N parameter)
--  num_punc_patterns - integer, number of legitimate punc_sel values
--  puncture_vector - array of integers representing symbol positions to be punctured for each punc_sel input value
--  puncture_select_vector - array of integers, containing number of punctures for each punc_sel input value
-- Returns:
--  <min_max_int_type> record containing minimum and maximum legal n_in values
--
function get_n_in_limits(c_has_n_in             : integer;
                         c_n                    : integer;
                         num_punc_patterns      : integer;
                         puncture_vector        : XBIP_UTILS_integer_vector;
                         puncture_select_vector : XBIP_UTILS_integer_vector) return min_max_int_type is

  variable start_v    : integer;
  variable end_v      : integer;
  variable min        : integer;
  variable min_n_val  : integer;
  variable max_n_val  : integer;
  variable return_val : min_max_int_type;
begin


  if c_has_n_in = 0 then -- fixed n_in
    min_n_val := C_N;
    max_n_val := C_N;

  else -- variable n_in

    if num_punc_patterns > 0 then

      -- Assume C_N values always required until we find a punc_sel value that does not
      -- need this many symbols in the block
      min_n_val := C_N;

      -- Take each punc_sel value in turn and determine the highest symbol position that must be
      -- punctured. N_IN must be at least large enough to support the lowest of these values over
      -- all the valid punc_sel values.
      start_v := 0; -- Index into puncture_vector

      for punc_sel_val in 0 to num_punc_patterns-1 loop

        if puncture_select_vector(punc_sel_val) = 0 then

          -- If there is a punc_sel_val that has no punctures then min N is simply the absolute min N
          min_n_val := decoder_min_n;
          exit;

        else
          -- Position of last punctured symbol index in puncture_vector for this punc_sel_val
          -- start_v = start position, end_v = end position
          end_v := start_v + puncture_select_vector(punc_sel_val)-1;

          if end_v >= start_v then
            -- Find highest symbol position that is punctured for this punc_sel value
            min := 0;
            for i in start_v to end_v loop
              if puncture_vector(i) > min then
                min := puncture_vector(i);
              end if;
            end loop;

            -- add 1 to min because puncture vector entries are from 0 to n-1
            min := min+1;
            if min < min_n_val then
              min_n_val := min;
            end if;

            start_v := end_v + 1; -- index of next puncture_vector entry

          end if; -- end_v >= start_v
        end if; -- puncture_select_vector(punc_sel_val) = 0

      end loop; -- punc_sel_val

      -- coverage off
      -- N must always be at least the absolute minimum defined by the hard limit in the consts package
      if min_n_val < decoder_min_n then
        min_n_val := decoder_min_n;
      end if;
      -- coverage on

    else
      min_n_val := decoder_min_n;
    end if; -- num_punc_patterns > 0


    max_n_val := C_N;

  end if; -- c_has_n_in = 0

  return_val.min := min_n_val;
  return_val.max := max_n_val;
  return return_val;

end get_n_in_limits;


-- coverage off
-- This function is not called directly from the HDL, but is duplicated in the
-- test packages for use by the testbench
--------------------------------------------------------------------------------
-- Function: get_decoder_latency
-- Returns: latency in symbol periods. Takes number of channels into account.
-- Returned latency is the number of clock periods from the rising clock
-- edge immediately prior to first symbol until rising clock edge that
-- causes first symbol to appear on data_out.
--------------------------------------------------------------------------------
function get_decoder_latency(n_val               : natural;
                             r_val               : natural;
                             c_spec              : integer;
                             c_symbol_width      : integer;
                             c_has_erase         : integer;
                             c_has_n_in          : integer;
                             c_num_channels      : integer;
                             c_num_punc_patterns : integer) return natural is

  -- Output FIFO takes a 2 cycles (1 to write, 1 to read)
  constant output_fifo_latency   : natural := 2;

  variable ccsds_bool            : boolean;
  variable has_erase_or_punc     : natural;
  variable input_fifo_latency    : natural;
  variable input_sam_latency     : natural;
  variable bma_latency           : natural;
  variable chien_latency         : natural;
  variable forney_latency        : natural;
  variable inv_ccsds_rom_latency : natural;
  variable locator_order         : natural;
  variable syndrome_latency      : natural;
  variable total_latency         : integer;
  variable t_val                 : natural;
begin
  t_val := r_val/2; -- Number of errors that can be corrected

  ccsds_bool := c_spec = ccsds_spec;

  has_erase_or_punc := select_val(c_has_erase,1,c_num_punc_patterns);

  -- Input FIFO latency
  -- Input FIFO takes at least 3 cycles (1 for input reg, 1 for write to SRL, 1 for read from SRL)
  -- In multi-channel case <C_NUM_CHANNELS> values must be written to FIFO before FIFO is read
  if c_num_channels > 1 then
    input_fifo_latency := c_num_channels + 3;
  else
    input_fifo_latency := 3;
  end if;

  -- Input sampler latency
  -- If CCSDS or (erasures with variable N) then an extra level of input registering is included.
  if ccsds_bool or (c_has_erase/=0 and c_has_n_in/=0) then
    input_sam_latency := 1;
  else
    input_sam_latency := 0;
  end if; -- ccsds_bool

  -- Syndrome unit latency
  syndrome_latency := n_val * c_num_channels + 1;--(equal to n_in when C_HAS_N_IN = 1)

  -- BMA unit latency
  if (has_erase_or_punc = 0) then
    bma_latency := (2*t_val*t_val + 8*t_val + 2) * c_num_channels + 1;
  else --has_erase = 1
    bma_latency := (r_val*r_val +5*r_val + 3) * c_num_channels + 1;
  end if;

  -- Chien unit latency
  locator_order := select_val(t_val, r_val, has_erase_or_punc);
  chien_latency := (locator_order+1) * c_num_channels;
  if c_num_channels <= 1 then
    chien_latency := chien_latency + 2;
  else
    chien_latency := chien_latency + 1 + c_num_channels;
  end if;

  -- Forney unit latency
  if c_symbol_width = 8 then
    forney_latency := 3;
  else
    forney_latency := 2;
  end if;
  if c_num_channels > 1 then
    forney_latency := forney_latency+1;
  end if;

  -- Additional latency where the CCSDS ROMs are selected.
  if ccsds_bool then
    inv_ccsds_rom_latency := 2;
  else
    inv_ccsds_rom_latency := 0;
  end if;


  total_latency := input_fifo_latency + input_sam_latency + syndrome_latency + bma_latency +
                   chien_latency + forney_latency + inv_ccsds_rom_latency + output_fifo_latency;

  report "Decoder latency = " & integer'image(total_latency)
  severity note;

  return total_latency;
end get_decoder_latency;
-- coverage on


--------------------------------------------------------------------------------
--
-- Calculate xor of two natural numbers without converting to std_logic_vector's
--
--------------------------------------------------------------------------------
function natural_xor(a, b, num_bits : integer) return integer is
  variable a_temp     : integer := a;
  variable b_temp     : integer := b;
  variable a_bit      : integer := 0;
  variable b_bit      : integer := 0;
  variable bit_weight : integer := 1;
  variable result_bit : integer := 0;
  variable result     : integer := 0;
begin
  bit_weight := 1;
  for bi in 0 to (num_bits - 1) loop
    a_bit := a_temp rem 2;
    b_bit := b_temp rem 2;
    result_bit := a_bit + b_bit;
    if (result_bit = 1) then -- can only be 0, 1 or 2
      result := result + bit_weight;
    end if;
    -- get ready for next bit
    a_temp := a_temp/2;
    b_temp := b_temp/2;
    bit_weight := bit_weight*2;
  end loop;
  return result;
end natural_xor;


--------------------------------------------------------------------------------
-- Define function that cheks if the polynomial is primitive
--------------------------------------------------------------------------------
function field_poly_is_primitive(symbol_width : integer;
                                 field_poly   : integer;
                                 disp_debug   : integer ) return boolean is

  -- gfas = Galois field array size
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

  -- coverage off
  if (field_poly = 0) then
     --default polynomial - assume it's correct
    if disp_debug /= 0 then
      report " Checking field polynomial " & new_line &
             "note: using default field polynomial" & new_line
      severity note;
    end if; --disp_debug

    return true;

  elsif (field_poly > (2**(symbol_width+1))) then
    --degree of polynomial is too high
    report " Checking field polynomial " & new_line &
           " ERROR: field polynomial out of range " & new_line
    severity note;

    return false;
  end if; -- field_poly = 0
  -- coverage on

  --
  -- Create the Galois Field elements alpha_to(0 TO symbol_width - 1)
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
   -- find index for each galois field element
   for i in 0 to gfasm2 loop
       index_of(alpha_to(i)) := i;
   end loop;

   -- Don't check index_of(0) as it has been set to zero
   -- Don't check index_of(1) as it is always zero
   is_primitive:= true;
   for i in 2 to gfasm1 loop
     -- coverage off
     if index_of(i) = 0 then
       is_primitive := false;
     end if;
     -- coverage on
   end loop; -- i

   assert (is_primitive)
     report  "Checking field polynomial " & new_line &
             "ERROR: Specified polynomial is not primitive for specified symbol width. " &
             "Expect erroneous behavior!" & new_line
     severity note;

    assert not(is_primitive)
      report " Checking field polynomial " & new_line &
             " Note: Specified polynomial is primitive!" & new_line
      severity note;

  return is_primitive;

end field_poly_is_primitive;


-------------------------------------------------------------------------------
-- Calculate Processing Delay
-- This is the number of symbol periods from the beginning of the "start_bma"
-- pulse until the BMA FSM returns to state 0. At this point it is safe to
-- apply another "start_bma" pulse.
-------------------------------------------------------------------------------
function get_proc_delay (n            : integer;
                         k            : integer;
                         has_erase    : integer;
                         num_channels : integer) return integer is

  constant t : integer := (n-k)/2;
  constant r : integer := select_val(2*t, n-k, has_erase);

  variable apparent_proc_delay : integer;
  variable proc_delay          : integer;
begin
  proc_delay := 0;

  if has_erase = 0 then
    for i in 1 to (t+1) loop
      proc_delay := proc_delay + i;
    end loop;

    proc_delay := t*t + 2*(proc_delay + 3*t) + 1;
  else
    for i in 1 to (r+1) loop
      proc_delay := proc_delay + i;
    end loop;

    proc_delay := 2*proc_delay + 3*r + 2;
  end if; -- has_erase

--   -- There is a 1 clock cycle delay between BMA pf_d and "start_chien",
--   -- regardless of the number of channels. Add this on after scaling by
--   -- number of channels.
--   proc_delay := (proc_delay * num_channels) + 1;
   proc_delay := proc_delay * num_channels;


--   if num_channels > 1 then
--     -- For the multi-channel case, "proc_delay", as computed to this point,
--     -- is the number of clock cycles from the start of "start_bma" until the
--     -- start of the "load" pulse inside the Chien unit. i.e. it includes all
--     -- the cycles required to load the coefficients from the BMA unit into
--     -- the Chien unit shift registers. The BMA FSM actually re-enters state 0
--     -- 1 fast clock cycle before this point so subtract 1.
--     proc_delay := proc_delay-1;
--
--   end if; -- num_channels > 1

  --  report "proc_delay = " & integer'image(apparent_proc_delay) & new_line
  --  severity note;

  return proc_delay;
end get_proc_delay;


end dec_pkg;







--------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/dec_comps_pkg.vhd,v 1.3 2011/06/23 15:14:21 andreww Exp $
--
-- Reed-Solomon Decoder Components Package
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--
--  Model:  PACKAGE dec_comps_pkg
--
--  Constant definitions
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;


--------------------------------------------------------------------------------
package dec_comps_pkg is

--
-- Component declarations
--
component bma
  generic (
    C_K                    : integer;
    C_N                    : integer;
    C_POLYNOMIAL           : integer;
    C_SYMBOL_WIDTH         : integer;
    C_NUM_CHANNELS         : integer;
    C_HAS_CE               : boolean;
    C_HAS_ERASE            : integer;
    C_HAS_SCLR             : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_R_WIDTH              : integer;
    C_OPTIMISATION         : integer;        --0=area 1=speed
    C_SELF_RECOVERING      : integer;
    C_ELABORATION_DIR      : string;
    C_XDEVICEFAMILY        : string;
    C_FAMILY               : string
    );
  port (
    syndromes      : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    start_bma      : in  std_logic;
    start_bma_p1   : in  std_logic;     -- Goes high 1 cycle before start_bma
    -- Can be used to get ready for start
    chien_ready    : in  std_logic;
    clk            : in  std_logic;
    ce             : in  std_logic := '1';
    erase_loc      : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    erase_cnt      : in  std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0) := (others => '0');
    sclr           : in  std_logic := '0';
    n_in           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in           : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    bma_ready      : out std_logic; -- Only used for variable N
    erase_cnt_out  : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    err_loc        : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval       : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_out          : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_out          : out std_logic_vector(C_R_WIDTH-1 downto 0);
    loc_deg        : out std_logic_vector(C_R_WIDTH-1 downto 0);
    poly_flag      : out std_logic;
    start_chien_p1 : out std_logic;
    start_chien_p2 : out std_logic;
    bma_dead       : out std_logic
    );
end component; -- bma

component chien
  generic (
    C_POLYNOMIAL           : integer;
    C_SYMBOL_WIDTH         : integer;
    C_NUM_CHANNELS         : integer;
    C_N                    : integer;
    C_K                    : integer;
    C_H                    : integer;
    C_GEN_START            : integer;
    C_HAS_INFO_END         : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_R_WIDTH              : integer;
    C_DEFINE_LEGAL_R_VALS  : integer;
    C_NUM_LEGAL_R_VALUES   : integer;
    C_LEGAL_R_VECTOR_FILE  : string;
    C_HAS_CE               : integer;
    C_HAS_ERASE            : integer;
    C_HAS_SCLR             : integer;
    C_CLKS_PER_SYM         : integer;
    C_MEMSTYLE             : integer;
    C_FAMILY               : string;
    C_MEM_INIT_PREFIX      : string;
    C_ELABORATION_DIR      : string;
    C_XDEVICEFAMILY        : string
  );
  port (
    start             : in  std_logic;
    start_p1          : in  std_logic;
    start_p2          : in  std_logic;
    erase_cnt_in      : in  std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0) := (others=>'0');
    err_loc           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval          : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    loc_deg_in        : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    n_in              : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_in_latched      : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in_latched      : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    clk               : in  std_logic;
    ce                : in  std_logic := '1';
    slow_ce           : in  std_logic := '1';
    sclr              : in  std_logic := '0';
    erase_cnt_out     : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    err_loc_eval      : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_loc_diff_eval : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval_eval     : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    loc_deg_out       : out std_logic_vector(C_R_WIDTH-1 downto 0);
    chien_ready       : out std_logic;
    done              : out std_logic;
    done_p1           : out std_logic;
    last_info         : out std_logic;
    last_value        : out std_logic;
    last_value_p1     : out std_logic
  );
end component; -- chien

component csubcell
  generic (
    c_family          : string;
    c_xdevicefamily   : string;
    c_elaboration_dir : string;
    c_num_channels    : integer;
    gfcx              : gfcx_record_type;
    c_enable_rlocs    : integer
  );
  port (
    enable    : in  std_logic;
    clk       : in  std_logic;
    sel       : in  std_logic;
    zero_cout : in  std_logic;
    din       : in  std_logic_vector(gfcx.symbol_width - 1 downto 0);
    cout      : out std_logic_vector(gfcx.symbol_width - 1 downto 0)
    );
end component; -- csubcell

component ccell
  generic (
    c_family          : string;
    c_xdevicefamily   : string;
    c_elaboration_dir : string;
    c_num_channels    : integer;
    c_has_disable     : integer;
    polynomial        : integer;
    symbol_width      : integer;
    alpha_to_short    : integer_array_type;
    coeff1            : integer;
    coeff2            : integer;
    c_enable_rlocs    : integer
  );
  port (
    ce        : in  std_logic;
    slow_ce   : in  std_logic;
    clk       : in  std_logic;
    sel       : in  std_logic;
    input_sel : in  std_logic;
    disable   : in  std_logic;
    din       : in  std_logic_vector(symbol_width - 1 downto 0);
    sout_d    : in  std_logic_vector(symbol_width - 1 downto 0);
    sout      : out std_logic_vector(symbol_width - 1 downto 0);
    cout      : out std_logic_vector(symbol_width - 1 downto 0)
    );
end component; -- ccell

component err_stats
  generic (
    c_symbol_width  : integer;
    c_r             : integer;
    c_has_ce        : integer;
    c_has_sr        : integer;
    c_num_channels  : integer;
    c_family        : string
  );
  port (
    corrected_data    : in  std_logic_vector(c_symbol_width-1 downto 0);
    original_data     : in  std_logic_vector(c_symbol_width-1 downto 0);
    clk               : in  std_logic;
    ce                : in  std_logic := '1';
    sr                : in  std_logic := '0';
    blk_strt          : in  std_logic;
    blk_end           : in  std_logic;
    bit_err_0_to_1    : out std_logic_vector(bitsneededtorepresent(c_r * c_symbol_width)-1 downto 0);
    bit_err_1_to_0    : out std_logic_vector(bitsneededtorepresent(c_r * c_symbol_width)-1 downto 0);
    bit_err_rdy       : out std_logic;
    bit_err_rdy_p1    : out std_logic;
    bit_err_rdy_p2    : out std_logic
  );
end component; -- err_stats

component ecell
  generic (
    c_family          : string;
    c_xdevicefamily   : string;
    c_elaboration_dir : string;
    ecell_type        : integer;
    gfx_mul           : gfx_record_type;
    init_val          : std_logic_vector;
    symbol_width      : integer;
    c_has_ce          : integer;
    c_has_slow_ce     : integer;
    c_has_n_in        : integer;
    c_num_channels    : integer;
    c_enable_rlocs    : integer
  );
  port (
    ce           : in  std_logic;
    cin          : in  std_logic_vector(symbol_width-1 downto 0) := (others=>'0');
    clk          : in  std_logic;
    eloc_in      : in  std_logic_vector(symbol_width - 1 downto 0);
    erase        : in  std_logic;
    load         : in  std_logic;
    prev_stage   : in  std_logic_vector(symbol_width - 1 downto 0);
    er_en        : in  std_logic;
    slow_ce      : in  std_logic;
    sr           : in  std_logic;
    cout         : out std_logic_vector(symbol_width - 1 downto 0);
    mult_out     : out std_logic_vector(symbol_width - 1 downto 0)
    );
end component; -- ecell

component erasure
  generic (
    C_FAMILY                : STRING;
    C_XDEVICEFAMILY         : STRING;
    C_ELABORATION_DIR       : STRING;
    C_CLKS_PER_SYMBOL       : INTEGER;
    C_POLYNOMIAL            : INTEGER;
    C_SYMBOL_WIDTH          : INTEGER;
    C_N                     : INTEGER;
    C_K                     : INTEGER;
    C_H                     : INTEGER;
    C_HAS_CE                : INTEGER;
    C_HAS_SLOW_CE           : INTEGER;
    C_HAS_N_IN              : INTEGER;
    C_HAS_R_IN              : INTEGER;
    C_NUM_CHANNELS          : INTEGER
  );
  port (
    ce           : in  std_logic;
    load_piso    : in  std_logic;
    start        : in  std_logic;
    erase        : in  std_logic;
    clk          : in  std_logic;
    chan_ce      : in  std_logic;
    slow_ce      : in  std_logic;
    init_coeff   : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    erase_poly   : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    num_erase    : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0)
  );
end component; -- erasure

component forney
  generic (
    C_NUM_CHANNELS         : integer;
    C_POLYNOMIAL           : integer;
    C_SYMBOL_WIDTH         : integer;
    C_N                    : integer;
    C_K                    : integer;
    C_HAS_ERR_STATS        : integer;
    C_HAS_INFO             : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_R_WIDTH              : integer;
    C_MEMSTYLE             : integer;
    C_OUTPUT_CHECK_SYMBOLS : integer;
    C_SPEC                 : integer;
    C_HAS_CE               : integer;
    C_HAS_ERASE            : integer;
    C_HAS_SR               : integer;
    C_HAS_DATA_DEL         : integer;
    C_MEM_INIT_PREFIX      : string;
    C_ELABORATION_DIR      : string;
    C_XDEVICEFAMILY        : string;
    C_FAMILY               : string
  );
  port (
    rx_symbol            : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    dout_reg             : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    chien_last_info      : in  std_logic;
    erase_cnt_in         : in  std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0) := (others=>'0');
    err_loc_eval         : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_loc_diff_eval    : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval_eval        : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    start                : in  std_logic;
    start_p1             : in  std_logic;
    last_value           : in  std_logic;
    last_value_p1        : in  std_logic;
    loc_deg              : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    clk                  : in  std_logic;
    ce                   : in  std_logic := '1';
    sr                   : in  std_logic := '0';
    output_fifo_has_room : in  std_logic;
    erase_cnt_out        : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    s_out                : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    data_del             : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    bit_err_0_to_1       : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
    bit_err_1_to_0       : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
    blk_strt             : out std_logic;
    blk_end              : out std_logic;
    err_found            : out std_logic;
    err_cnt              : out std_logic_vector(C_R_WIDTH-1 downto 0);
    fail                 : out std_logic;
    info_out             : out std_logic;
    last_data            : out std_logic;
    last_stat            : out std_logic;
    read_data_en         : out std_logic;
    data_out_rdy         : out std_logic;
    status_out_rdy       : out std_logic;
    status_out_rdy_p2    : out std_logic
  );
end component; -- forney

component puncture
  generic (
    C_FAMILY                : string;
    C_XDEVICEFAMILY         : string;
    C_NUM_CHANNELS          : integer;
    C_NUM_PUNC_PATTERNS     : integer;
    C_PUNCTURE_SELECT_FILE  : string;
    C_PUNCTURE_VECTOR_FILE  : string;
    C_MEM_INIT_PREFIX       : string;
    C_ELABORATION_DIR       : string;
    C_PUNC_SEL_WIDTH        : integer;
    C_CLKS_PER_SYM          : integer;
    C_POLYNOMIAL            : integer;
    C_SYMBOL_WIDTH          : integer;
    C_MEM_STYLE             : integer;
    C_N                     : integer;
    C_K                     : integer;
    C_H                     : integer;
    C_HAS_CE                : integer;
    C_HAS_N_IN              : integer;
    C_HAS_SLOW_CE           : integer;
    C_HAS_PISO_CE           : integer
  );
  port (
    ce           : in  std_logic;
    slow_ce      : in  std_logic;
    piso_ce      : in  std_logic;
    sync         : in  std_logic;
    start_bma    : in  std_logic;
    load_piso    : in  std_logic;
    load_piso_p1 : in  std_logic;
    clk          : in  std_logic;
    punc_sel     : in  std_logic_vector(c_punc_sel_width-1 downto 0);
    erase_poly   : out std_logic_vector(c_symbol_width-1 downto 0);
    num_erase    : out std_logic_vector(integer_width(c_n)-1 downto 0)
  );
end component; -- puncture

component rs_decoder_axi_wrapper
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer;
  C_HAS_ARESETN                : integer;
  C_HAS_S_AXIS_CTRL            : integer;
  C_HAS_S_AXIS_INPUT_TUSER     : integer;
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer;
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer;
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer;
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer;
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer;
  C_M_AXIS_STAT_TDATA_WIDTH    : integer;

  -- AXI channel sub-field parameters
  C_HAS_DATA_DEL               : integer;
  C_HAS_ERASE                  : integer;
  C_HAS_ERR_STATS              : integer;
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
  C_IGNORE_ILLEGAL_N_R         : integer;
  C_DEFINE_LEGAL_R_VALS        : integer;
  C_NUM_LEGAL_R_VALUES         : integer;
  C_LEGAL_R_VECTOR_FILE        : string;
  C_NUM_CHANNELS               : integer;
  C_NUM_PUNC_PATTERNS          : integer;
  C_PUNCTURE_SELECT_FILE       : string;
  C_PUNCTURE_VECTOR_FILE       : string;
  C_MEMSTYLE                   : integer;
  C_OUTPUT_CHECK_SYMBOLS       : integer;
  C_OPTIMISATION               : integer;
  C_SELF_RECOVERING            : integer;

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
  s_axis_input_tlast    : in  std_logic;
  s_axis_input_tready   : out std_logic;

  s_axis_ctrl_tdata     : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid    : in  std_logic := '0';
  s_axis_ctrl_tready    : out std_logic;

  m_axis_output_tdata   : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);
  m_axis_output_tuser   : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);
  m_axis_output_tvalid  : out std_logic;
  m_axis_output_tready  : in  std_logic := '1';
  m_axis_output_tlast   : out std_logic;

  m_axis_stat_tdata     : out std_logic_vector(C_M_AXIS_STAT_TDATA_WIDTH-1 downto 0);
  m_axis_stat_tvalid    : out std_logic;
  m_axis_stat_tlast     : out std_logic;
  m_axis_stat_tready    : in  std_logic := '1';

  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic

);
end component; -- rs_decoder_axi_wrapper

component rs_decoder_main
generic (
  C_HAS_ACLKEN                 : integer;
  C_HAS_ARESETN                : integer;
  C_NUM_PUNC_PATTERNS          : integer;
  C_PUNCTURE_SELECT_FILE       : string;
  C_PUNCTURE_VECTOR_FILE       : string;
  C_NUM_CHANNELS               : integer;
  C_GEN_START                  : integer;
  C_H                          : integer;
  C_K                          : integer;
  C_N                          : integer;
  C_POLYNOMIAL                 : integer;
  C_SYMBOL_WIDTH               : integer;
  C_PUNC_SEL_WIDTH             : integer;
  C_HAS_MARKER_BITS            : integer;
  C_NUM_MARKER_BITS            : integer;
  C_EVALUATION                 : integer;
  C_HAS_ERASE                  : integer;
  C_HAS_ERR_STATS              : integer;
  C_HAS_DATA_DEL               : integer;
  C_HAS_INFO                   : integer;
  C_HAS_N_IN                   : integer;
  C_HAS_R_IN                   : integer;
  C_IGNORE_ILLEGAL_N_R         : integer;
  C_R_WIDTH                    : integer;
  C_DEFINE_LEGAL_R_VALS        : integer;
  C_NUM_LEGAL_R_VALUES         : integer;
  C_LEGAL_R_VECTOR_FILE        : string;
  C_OUTPUT_CHECK_SYMBOLS       : integer;
  C_CLKS_PER_SYM               : integer;
  C_SPEC                       : integer;
  C_MEMSTYLE                   : integer;
  C_MEM_INIT_PREFIX            : string;
  C_ELABORATION_DIR            : string;
  C_XDEVICEFAMILY              : string;
  C_FAMILY                     : string;
  C_OPTIMISATION               : integer;
  C_SELF_RECOVERING            : integer );
port (
  aclk                           : in  std_logic;
  aclken                         : in  std_logic := '1';
  aresetn                        : in  std_logic := '1';
  ctrl_fifo_not_empty            : in  std_logic;
  input_tvalid                   : in  std_logic;
  input_tlast                    : in  std_logic;
  nc_samples_avail               : in  std_logic;
  data_in                        : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  mark_in                        : in  std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
  n_in                           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  r_in                           : in  std_logic_vector(C_R_WIDTH-1 downto 0);
  erase                          : in  std_logic := '0';
  punc_sel                       : in  std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
  output_fifo_has_room           : in  std_logic;
  stat_fifo_has_room             : in  std_logic;
  ctrl_fifo_rd_en                : out std_logic;
  input_tready                   : out std_logic;
  slow_ce_out                    : out std_logic;
  sr_reg_out                     : out std_logic;
  bit_err_0_to_1                 : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
  bit_err_1_to_0                 : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
  data_out                       : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  mark_out                       : out std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
  data_del                       : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  info_out                       : out std_logic;
  last_data_out                  : out std_logic;
  last_stat_out                  : out std_logic;
  erase_cnt                      : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
  err_found                      : out std_logic;
  err_cnt                        : out std_logic_vector(C_R_WIDTH-1 downto 0);
  fail                           : out std_logic;
  data_out_rdy                   : out std_logic;
  stat_out_rdy                   : out std_logic;
  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
  );
end component; -- rs_decoder_main

component sampler
  generic (
    C_EVALUATION           : integer;
    C_NUM_CHANNELS         : integer;
    C_POLYNOMIAL           : integer;
    C_H                    : integer;
    C_R                    : integer;
    C_N                    : integer;
    C_SYMBOL_WIDTH         : integer;
    C_R_WIDTH              : integer;
    C_PUNC_SEL_WIDTH       : integer;
    C_HAS_PUNC_SEL         : integer;
    C_NUM_PUNC_PATTERNS    : integer;
    C_PUNCTURE_SELECT_FILE : string;
    C_PUNCTURE_VECTOR_FILE : string;
    C_HAS_MARKER_BITS      : integer;
    C_NUM_MARKER_BITS      : integer;
    C_HAS_CE               : integer;
    C_HAS_ERASE            : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_IGNORE_ILLEGAL_N_R   : integer;
    C_DEFINE_LEGAL_R_VALS  : integer;
    C_NUM_LEGAL_R_VALUES   : integer;
    C_LEGAL_R_VECTOR_FILE  : string;
    C_HAS_ARESETN          : integer;
    C_SPEC                 : integer;
    C_MEMSTYLE             : integer;
    C_CLKS_PER_SYM         : integer;
    C_XDEVICEFAMILY        : string;
    C_FAMILY               : string;
    C_MEM_INIT_PREFIX      : string;
    C_ELABORATION_DIR      : string;
    C_SELF_RECOVERING      : integer
  );
  port (
    ctrl_fifo_not_empty            : in  std_logic;
    input_tvalid                   : in  std_logic;
    input_tlast                    : in  std_logic;
    nc_samples_avail               : in  std_logic;
    syndrome_piso_full             : in  std_logic;
    load_piso_pending              : in  std_logic;
    data_in                        : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    mark_in                        : in  std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
    n_in                           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in                           : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    punc_sel                       : in  std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
    clk                            : in  std_logic;
    ce                             : in  std_logic;
    erase                          : in  std_logic;
    aresetn                        : in  std_logic;
    bma_dead                       : in  std_logic;
    ctrl_fifo_rd_en                : out std_logic;
    input_tready                   : out std_logic;
    input_chan_ce                  : out std_logic;
    input_pipe_ce                  : out std_logic;
    input_reg_ce                   : out std_logic;
    write_data_en                  : out std_logic;
    last_symbol                    : out std_logic;
    data_in_smpld                  : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    mark_in_smpld                  : out std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
    erase_init_coeff               : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_in_smpld                     : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in_smpld                     : out std_logic_vector(C_R_WIDTH-1 downto 0);
    punc_sel_smpld                 : out std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
    erase_smpld                    : out std_logic;
    slow_ce                        : out std_logic;
    sr_smpld                       : out std_logic;
    sync_smpld                     : out std_logic;
    event_s_input_tlast_missing    : out std_logic;
    event_s_input_tlast_unexpected : out std_logic;
    event_s_ctrl_tdata_invalid     : out std_logic
  );
end component; -- sampler

component scell
  generic (
    c_family             : string;
    c_xdevicefamily      : string;
    c_elaboration_dir    : string;
    c_num_channels       : integer;
    c_has_ce             : integer;
    c_has_slow_ce        : integer;
    polynomial           : integer;
    symbol_width         : integer;
    constant_coefficient : integer;
    alpha_to_short       : integer_array_type;
    c_enable_rlocs       : integer
  );
  port (
    ce        : in  std_logic;
    slow_ce   : in  std_logic;
    clk       : in  std_logic;
    sel       : in  std_logic;
    load      : in  std_logic;
    din       : in  std_logic_vector(symbol_width - 1 downto 0);
    sin       : in  std_logic_vector(symbol_width - 1 downto 0);
    sout      : out std_logic_vector(symbol_width - 1 downto 0)
    );
end component; -- scell

component sr_length_unit
  generic( w                 : integer;
           c_has_ce          : integer;
           c_num_channels    : integer;
           c_xdevicefamily   : string;
           c_family          : string;
           c_elaboration_dir : string;
           c_enable_rlocs    : integer );
  port( a   : in  std_logic_vector(w-1 downto 0);
        b   : in  std_logic_vector(w-1 downto 0);
        clk : in  std_logic;
        ce  : in  std_logic;
     update : in  std_logic;
       load : in  std_logic;
        r   : in  std_logic;
        s   : out std_logic_vector(w-1 downto 0) );
end component; -- sr_length_unit

component sr_length_unit_bit
   generic( c_has_co          : boolean;
            c_has_ce          : integer;
            c_num_channels    : integer;
            c_xdevicefamily   : string;
            c_family          : string;
            c_elaboration_dir : string;
            c_enable_rlocs    : integer );
   port( a0     : in  std_logic;
         b0     : in  std_logic;
         ci     : in  std_logic;
         clk    : in  std_logic;
         r      : in  std_logic;
         ce     : in  std_logic;
         load   : in  std_logic;
         co     : out std_logic;
         s0     : out std_logic);
end component; -- sr_length_unit_bit

component syndrome
  generic (
    C_FAMILY                : string;
    C_XDEVICEFAMILY         : string;
    C_NUM_PUNC_PATTERNS     : integer;
    C_PUNCTURE_SELECT_FILE  : string;
    C_PUNCTURE_VECTOR_FILE  : string;
    C_MEM_INIT_PREFIX       : string;
    C_ELABORATION_DIR       : string;
    C_MEM_STYLE             : integer;
    C_PROC_DELAY            : integer;
    C_POLYNOMIAL            : integer;
    C_SYMBOL_WIDTH          : integer;
    C_PUNC_SEL_WIDTH        : integer;
    C_N                     : integer;
    C_K                     : integer;
    C_GEN_START             : integer;
    C_H                     : integer;
    C_CLKS_PER_SYM          : integer;
    C_SPEC                  : integer;
    C_NUM_CHANNELS          : integer;
    C_HAS_ERASE             : integer;
    C_HAS_N_IN              : integer;
    C_HAS_R_IN              : integer;
    C_R_WIDTH               : integer;
    C_HAS_CE                : boolean;
    C_HAS_SCLR              : boolean
  );
  port (
    ce                : in  std_logic;
    slow_ce           : in  std_logic;
    input_chan_ce     : in  std_logic;
    input_pipe_ce     : in  std_logic;
    clk               : in  std_logic;
    last_din          : in  std_logic;
    din               : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_in              : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in              : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    erase_init_coeff  : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    bma_ready         : in  std_logic;
    erase             : in  std_logic := '0'; -- optional pin
    sync              : in  std_logic;
    sclr              : in  std_logic := '0'; -- optional pin
    punc_sel          : in  std_logic_vector(bitsneededtorepresent(C_NUM_PUNC_PATTERNS-1)-1 downto 0);
    erase_poly        : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_out             : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_out             : out std_logic_vector(C_R_WIDTH-1 downto 0);
    num_erase         : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    synd_piso_full    : out std_logic;
    load_piso_pending : out std_logic;
    sout              : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    done_p1           : out std_logic; -- only used if C_NUM_CHANNELS > 1
    done              : out std_logic
  );
end component; -- syndrome


end dec_comps_pkg;





--------------------------------------------------------------------------------
--  (c) Copyright 1995-2011 Xilinx, Inc. All rights reserved.
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
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/err_stats.vhd,v 1.2 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit : err_stats
--
-- Function : Compute error statistics on RS codeword just received.
--
-- Currently computes number of 1 to 0 bit errors and number of 0 to 1 bit
-- errors in a codeword. These are computed in real time as the data symbols
-- are output. The final values are flagged with a pulse on the bit_err_rdy
-- output. This occurs a small number of clock cycles after the blk_end pulse.
-- The data_del output must be available for this block.
--
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;



-- Port: corrected_data
--  Input, drive with core data_out
--
-- Port: original_data
--  Input, drive with core data_del
--
-- Port: blk_strt
--  Input, pulse when first data symbol is on <corrected_data> input
--
-- Port: blk_end
--  Input, pulse when final data symbol is on <corrected_data> input
--
-- Port: bit_err_rdy
--  Output high for one cycle when <bit_err_0_to_1> and <bit_err_1_to_0> are ready
--
-- Port: bit_err_rdy_p1
--  Output high one cycle prior to <bit_err_rdy>
--
-- Port: bit_err_rdy_p2
--  Output high two cycles prior to <bit_err_rdy>
--
entity err_stats is
  generic (
    c_symbol_width  : integer;
    c_r             : integer;
    c_has_ce        : integer;
    c_has_sr        : integer;
    c_num_channels  : integer;
    c_family        : string
  );
  port (
    corrected_data    : in  std_logic_vector(c_symbol_width-1 downto 0);
    original_data     : in  std_logic_vector(c_symbol_width-1 downto 0);
    clk               : in  std_logic;
    ce                : in  std_logic := '1';
    sr                : in  std_logic := '0';
    blk_strt          : in  std_logic;
    blk_end           : in  std_logic;
    bit_err_0_to_1    : out std_logic_vector(bitsneededtorepresent(c_r * c_symbol_width)-1 downto 0);
    bit_err_1_to_0    : out std_logic_vector(bitsneededtorepresent(c_r * c_symbol_width)-1 downto 0);
    bit_err_rdy       : out std_logic;
    bit_err_rdy_p1    : out std_logic;
    bit_err_rdy_p2    : out std_logic
  );
end err_stats;


--------------------------------------------------------------------------------
architecture synth of err_stats is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Round up number of nibbles
  constant round_up : integer := bool_to_int((c_symbol_width rem 4) /= 0);
  constant num_nibbles : integer := (c_symbol_width / 4) + round_up;

  -- Type for representing all the sub-nibbles of the detect busses
  subtype nibble_type is std_logic_vector(3 downto 0);
  type detect_nibble_type is array(0 to num_nibbles-1) of nibble_type;
  signal detect_nibble_0_to_1 : detect_nibble_type := (others => (others => '0'));
  signal detect_nibble_1_to_0 : detect_nibble_type := (others => (others => '0'));


  -- Pad detect bus with 0's to make up to a whole number of nibbles. This is
  -- required because detect bus is examined in 4 bit slices.
  constant detect_bus_width : integer := num_nibbles * 4;
  signal detect_1_to_0 : std_logic_vector(detect_bus_width-1 downto 0) := (others => '0');
  signal detect_0_to_1 : std_logic_vector(detect_bus_width-1 downto 0) := (others => '0');


  -- Type for bus representing number of 1 to 0 or 0 to 1 errors in a single
  -- symbol. Can be a maximum of c_symbol_width.
  constant total_symbol_width : integer := bitsneededtorepresent(c_symbol_width);

  subtype total_symbol_type is std_logic_vector(total_symbol_width-1 downto 0);

  constant ts_zeroes : total_symbol_type := (others=>'0');


  -- Type for representing number of 1's in each nibble
  -- These signals actually only need to be 3 bits wide but pad out to match
  -- total_0_to_1 so addition works.
  type num01_type is array(0 to num_nibbles-1) of total_symbol_type;
  signal num_0_to_1 : num01_type := (others=>ts_zeroes);
  signal num_1_to_0 : num01_type := (others=>ts_zeroes);


  -- The worst case number of bit errors is all bits in c_r symbols.
  constant final_output_width : integer := bitsneededtorepresent(c_r * c_symbol_width);

  subtype final_output_vector_type is std_logic_vector(final_output_width-1 downto 0);

  constant fo_zeroes : final_output_vector_type := (others=>'0');

  type final_output_type is array(0 to c_num_channels-1) of final_output_vector_type;

  signal final_total_0_to_1 : final_output_type := (others=>fo_zeroes);
  signal final_total_1_to_0 : final_output_type := (others=>fo_zeroes);

  -- These signals only need to be total_symbol_width wide but pad with 0's
  -- so they can be added to final_total
  signal total_0_to_1 : final_output_vector_type := fo_zeroes;
  signal total_1_to_0 : final_output_vector_type := fo_zeroes;


  -- Match delays through total_0_to_1 logic (=2) + accum (=c_num_channels)
  constant num_blk_end_retimes : integer := 2 + c_num_channels;
  signal blk_end_del : std_logic_vector(num_blk_end_retimes downto 0) := (others=>'0');


  signal blk_strt_del1      : std_logic := '0';
  signal blk_strt_del2      : std_logic := '0';

  signal int_ce             : std_logic := '0';
  signal int_sr             : std_logic := '0';
  signal load_accum         : std_logic := '0';



--------------------------------------------------------------------------------
-- Beginning of architecture body.
--------------------------------------------------------------------------------
BEGIN

  -- Handle optional ce pin
  y_ce : if c_has_ce /= 0 generate
    int_ce <= ce;
  end generate; -- y_ce

  n_ce : if c_has_ce = 0 generate
    int_ce <= '1';
  end generate; -- n_ce


  -- Handle optional sr pin
  y_sr : if c_has_sr /= 0 generate
    int_sr <= sr;
  end generate; -- y_sr

  n_sr : if c_has_sr = 0 generate
    int_sr <= '0';
  end generate; -- n_sr






  -- Detect 0 to 1 errors (i.e. original data=1, corrected data=0)
  -- Detect 1 to 0 errors (i.e. original data=0, corrected data=1)
  ozg1 : for i in 0 to detect_bus_width-1 generate

    ozg2 : if i < c_symbol_width generate
      detect_0_to_1(i) <= not(corrected_data(i)) and original_data(i);
      detect_1_to_0(i) <= corrected_data(i) and not(original_data(i));
    end generate; -- ozg2

    ozg3 : if i >= c_symbol_width generate
      detect_0_to_1(i) <= '0'; -- pad with 0's
      detect_1_to_0(i) <= '0'; -- pad with 0's
    end generate; -- ozg3

  end generate; -- ozg1




  -- Split detect busses into nibbles, count number of 1's in each
  -- nibble and then add all the results together. The symbol width
  -- will typically be 8, so there will only be 2 nibbles.
  ng1 : for i in 0 to num_nibbles-1 generate

    -- Take a 4-bit slice from detect_0_to_1
    detect_nibble_0_to_1(i) <= detect_0_to_1((i*4)+3 downto (i*4));
    detect_nibble_1_to_0(i) <= detect_1_to_0((i*4)+3 downto (i*4));

    -- Count number of 1's in the nibble
    -- There can only be 0 to 4 1's in a nibble so a maximum of 3 output bits is required.
    acp5 : process (clk)
    begin

      -- No need to reset registers as they are only examined after a blk_strt pulse.
      if rising_edge(clk) then

        if int_ce = '1' then

          -- Detect all 4-bit values with 1 or 3 ones
          num_0_to_1(i)(0) <= detect_nibble_0_to_1(i)(0) xor
                              detect_nibble_0_to_1(i)(1) xor
                              detect_nibble_0_to_1(i)(2) xor
                              detect_nibble_0_to_1(i)(3);

          num_1_to_0(i)(0) <= detect_nibble_1_to_0(i)(0) xor
                              detect_nibble_1_to_0(i)(1) xor
                              detect_nibble_1_to_0(i)(2) xor
                              detect_nibble_1_to_0(i)(3);


          -- Detect all 4-bit values with 2 or 3 ones
          if ((detect_nibble_0_to_1(i) = "0011") or
              (detect_nibble_0_to_1(i) = "0101") or
              (detect_nibble_0_to_1(i) = "0110") or
              (detect_nibble_0_to_1(i) = "0111") or
              (detect_nibble_0_to_1(i) = "1001") or
              (detect_nibble_0_to_1(i) = "1010") or
              (detect_nibble_0_to_1(i) = "1011") or
              (detect_nibble_0_to_1(i) = "1100") or
              (detect_nibble_0_to_1(i) = "1101") or
              (detect_nibble_0_to_1(i) = "1110")) then
            num_0_to_1(i)(1) <= '1';
          else
            num_0_to_1(i)(1) <= '0';
          end if;

          if ((detect_nibble_1_to_0(i) = "0011") or
              (detect_nibble_1_to_0(i) = "0101") or
              (detect_nibble_1_to_0(i) = "0110") or
              (detect_nibble_1_to_0(i) = "0111") or
              (detect_nibble_1_to_0(i) = "1001") or
              (detect_nibble_1_to_0(i) = "1010") or
              (detect_nibble_1_to_0(i) = "1011") or
              (detect_nibble_1_to_0(i) = "1100") or
              (detect_nibble_1_to_0(i) = "1101") or
              (detect_nibble_1_to_0(i) = "1110")) then
            num_1_to_0(i)(1) <= '1';
          else
            num_1_to_0(i)(1) <= '0';
          end if;


        end if; -- int_ce

      end if; -- rising_edge(clk)

    end process;



    -- If total_symbol_width is less than 3 then don't bother generating 3rd
    -- bit as it will always be 0. (There can only be a maximum of 3 0 to 1
    -- or 1 to 0 transitions.
    ng2 : if total_symbol_width > 2 generate

      -- count number of 1's in the nibble
      acp6 : process (clk)
      begin

        -- No need to reset registers as they are only examined after a blk_strt pulse.
        if rising_edge(clk) then

          if int_ce = '1' then

            -- detect all 4-bit values with 4 ones (i.e. "1111")
            num_0_to_1(i)(2) <= detect_nibble_0_to_1(i)(0) and
                                detect_nibble_0_to_1(i)(1) and
                                detect_nibble_0_to_1(i)(2) and
                                detect_nibble_0_to_1(i)(3);

            num_1_to_0(i)(2) <= detect_nibble_1_to_0(i)(0) and
                                detect_nibble_1_to_0(i)(1) and
                                detect_nibble_1_to_0(i)(2) and
                                detect_nibble_1_to_0(i)(3);

          end if; -- int_ce

        end if; -- rising_edge(clk)

      end process;

    end generate; -- ng2



    -- Pad with unused bits with 0's
    ng3 : if total_symbol_width > 3 generate
      num_0_to_1(i)(total_symbol_width-1 downto 3) <= (others=>'0');
      num_1_to_0(i)(total_symbol_width-1 downto 3) <= (others=>'0');
    end generate; -- ng3

  end generate; -- ng1




  -- Add the counts for all the nibbles to form final total for this symbol
  acp7 : process(clk)
    variable total_0_to_1_var : total_symbol_type;
    variable total_1_to_0_var : total_symbol_type;
  begin


    if rising_edge(clk) then

      if int_ce = '1' then

        for i in 0 to num_nibbles-1 loop
          if i=0 then
            total_0_to_1_var := num_0_to_1(0);
            total_1_to_0_var := num_1_to_0(0);
          else
            total_0_to_1_var := num_0_to_1(i) + total_0_to_1_var;
            total_1_to_0_var := num_1_to_0(i) + total_1_to_0_var;
          end if; -- i=0

        end loop; -- i

        total_0_to_1(total_symbol_width-1 downto 0) <= total_0_to_1_var;
        total_1_to_0(total_symbol_width-1 downto 0) <= total_1_to_0_var;

      end if; -- int_ce

    end if; -- rising_edge(clk)

  end process;


  -- Pad un-used bits with 0
  total_0_to_1(final_output_width-1 downto total_symbol_width) <= (others=>'0');
  total_1_to_0(final_output_width-1 downto total_symbol_width) <= (others=>'0');




  -- Generate final accumulator to accumulate totals for entire block
  -- No need to reset this as final totals are only valid when qualified by
  -- bit_err_rdy and this will not go high until after the 1st blk_end after a reset.
  -- Accumulator has a register stage for each channel.
  acp1 : process(clk)
  begin

    if rising_edge(clk) then

      if int_ce = '1' then

        if load_accum = '1' then
          final_total_0_to_1(0) <= total_0_to_1; -- load value for 1st symbol
          final_total_1_to_0(0) <= total_1_to_0; -- load value for 1st symbol
        else
          final_total_0_to_1(0) <= final_total_0_to_1(c_num_channels-1) + total_0_to_1;
          final_total_1_to_0(0) <= final_total_1_to_0(c_num_channels-1) + total_1_to_0;
        end if; -- load_accum

      end if; -- int_ce

    end if; -- rising_edge(clk)

  end process;

  -- Primary output
  bit_err_0_to_1 <= final_total_0_to_1(c_num_channels-1);
  bit_err_1_to_0 <= final_total_1_to_0(c_num_channels-1);


  -- Register stages for multiple channel values
  mcg1 : if c_num_channels > 1 generate
    mcg2 : for i in 1 to c_num_channels-1 generate

      acp2 : process(clk)
      begin
        if rising_edge(clk) then

          -- No need to reset as values for new block will be shifted in when required
          if int_ce = '1' then
            final_total_0_to_1(i) <= final_total_0_to_1(i-1);
            final_total_1_to_0(i) <= final_total_1_to_0(i-1);
          end if; -- int_ce

        end if; -- rising_edge(clk)

      end process;

    end generate; -- mcg2
  end generate; -- mcg1






  -- Generate accumulator load pulse by delaying blk_strt
  -- No need to reset this as final totals are only valid when qualified by
  -- bit_err_rdy and this will not go high until after the 1st blk_end after
  -- a reset.
  acp3 : process(clk)
  begin

    if rising_edge(clk) then
      if (int_ce = '1') then
        blk_strt_del2 <= blk_strt_del1;
        blk_strt_del1 <= blk_strt;
      end if; -- int_ce
    end if; -- rising_edge(clk)

  end process;

  load_accum <= blk_strt_del2;


  -- Generate bit_err_rdy pulse by delaying blk_end
  brg1 : for i in 1 to num_blk_end_retimes generate

    acp4 : process(clk)
    begin

      if rising_edge(clk) then
        if int_sr = '1' then
          blk_end_del(i) <= '0';

        elsif int_ce = '1' then
          blk_end_del(i) <= blk_end_del(i-1);

        end if; -- int_ce
      end if; -- rising_edge(clk)

    end process;

  end generate; -- brg1

  blk_end_del(0) <= blk_end;

  bit_err_rdy    <= blk_end_del(num_blk_end_retimes);
  bit_err_rdy_p1 <= blk_end_del(num_blk_end_retimes-1);
  bit_err_rdy_p2 <= blk_end_del(num_blk_end_retimes-2);



end synth;




--------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/sr_length_unit.vhd,v 1.2 2011/06/23 15:14:21 andreww Exp $
--
-- Building block for the Reed-Solomon Decoder Core BMA unit
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- sr_length_unit building block
-- 1-bit subtract with sync reset, ce, ci, carry-in
-- For sync reset to work in single channel case, carry in of lsb must be tied
-- high.
-- In multi-channel mode an extra mux is inserted prior to register.
-- This allows the delay line to rotate round through the values for each
-- channel when load = '0'
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;

LIBRARY unisim;
USE unisim.vcomponents.fde;
USE unisim.vcomponents.xorcy;
USE unisim.vcomponents.muxcy;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;



ENTITY sr_length_unit_bit IS
   GENERIC( c_has_co          : BOOLEAN;
            c_has_ce          : INTEGER;
            c_num_channels    : INTEGER;
            c_xdevicefamily   : STRING;
            c_family          : STRING;
            c_elaboration_dir : STRING;
            c_enable_rlocs    : INTEGER );
   PORT( a0     : IN  STD_LOGIC;
         b0     : IN  STD_LOGIC;
         ci     : IN  STD_LOGIC;
         clk    : IN  STD_LOGIC;
         r      : IN  STD_LOGIC;
         ce     : IN  STD_LOGIC;
         load   : IN  STD_LOGIC;
         co     : OUT STD_LOGIC;
         s0     : OUT STD_LOGIC);
END sr_length_unit_bit;

ARCHITECTURE synth OF sr_length_unit_bit IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  SIGNAL lut_sig, r_sig, s_sig : STD_LOGIC := '0';

BEGIN

  -- Synchronous reset signal
  cg1 : IF c_num_channels <= 1 GENERATE
    r_sig <= r;
  END GENERATE; -- cg1

  -- Sync reset is handled in separate LUT in multi-channel case
  cg2 : IF c_num_channels > 1 GENERATE
    r_sig <= '0';
  END GENERATE; -- cg2

  lut_sig <= r_sig OR NOT(a0 XOR b0);



  y_co : IF c_has_co GENERATE
  BEGIN
    m0 : muxcy
    PORT MAP( di => a0,
              ci => ci,
              s  => lut_sig,
              o  => co );
  END GENERATE; -- y_co

  n_co : IF NOT(c_has_co) GENERATE
    co <= '0';
  END GENERATE; -- n_co

  x0 : xorcy
  PORT MAP( li => lut_sig,
            ci => ci,
            o  => s_sig );



  mcg1 : IF c_num_channels <= 1 GENERATE
    ff0 : fde
    PORT MAP(d=>s_sig, ce=>ce, c=>clk, q=>s0);
  END GENERATE; -- mcg1




  ------------------------------------------------------------------------------
  -- Additional logic for multi-channel
  --
  mcg2 : IF c_num_channels > 1 GENERATE
    SIGNAL new_s0      : STD_LOGIC;
    SIGNAL new_s0_d_in : STD_LOGIC;
    SIGNAL new_s0_tmp  : STD_LOGIC;
    SIGNAL new_s0_vec  : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s0_vec      : STD_LOGIC_VECTOR(0 DOWNTO 0);
  BEGIN

    -- Select s_sig if load = '1' else select b0
    -- sr_length is fed back to b0 outside this unit so this
    -- causes each channel's sr_length value to rotate through
    -- the output reg. "r" resets output to 0 regarless of "load".
    new_s0_tmp <= s_sig WHEN load = '1' ELSE b0;
    new_s0_d_in <= new_s0_tmp AND NOT(r);

    lr1 : fde
    PORT MAP(d=>new_s0_d_in, ce=>ce, c=>clk, q=>new_s0);

    new_s0_vec(0) <= new_s0;

    -- SRL16 to hold sr_length values for each channel
    gmd : big_delay
    GENERIC MAP (
      c_family          => c_family,
      c_xdevicefamily   => c_xdevicefamily,
      instance_name     => "sr_length_unit_gmd",
      c_elaboration_dir => c_elaboration_dir,
      bus_width         => 1,
      clk_delay         => c_num_channels-1, -- lr1 holds 1 channel
      memstyle          => dist_mem,
      c_has_ce          => c_has_ce)
    PORT MAP (
      din  => new_s0_vec,
      clk  => clk,
      ce   => ce,
      dout => s0_vec );

    s0 <= s0_vec(0);

  END GENERATE; -- mcg2



END synth;





--------------------------------------------------------------------------------
-- Unit for computing sr_length in RS Decoder BMA
-- s <= a - b if update = 1, else s <= b
-- In multi-channel case "r" always resets output to 0 regardless of "load" and
-- "update". In single channel case "load" or "update" must be high for "r" to
-- have any effect.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_decoder_v9_0_12;
USE rs_decoder_v9_0_12.dec_comps_pkg.ALL;


ENTITY sr_length_unit IS
  GENERIC( w                 : INTEGER;
           c_has_ce          : INTEGER;
           c_num_channels    : INTEGER;
           c_xdevicefamily   : STRING;
           c_family          : STRING;
           c_elaboration_dir : STRING;
           c_enable_rlocs    : INTEGER );
  PORT( a   : IN  STD_LOGIC_VECTOR(w-1 DOWNTO 0);
        b   : IN  STD_LOGIC_VECTOR(w-1 DOWNTO 0);
        clk : IN  STD_LOGIC;
        ce  : IN  STD_LOGIC;
     update : IN  STD_LOGIC;
       load : IN  STD_LOGIC;
        r   : IN  STD_LOGIC;
        s   : OUT STD_LOGIC_VECTOR(w-1 DOWNTO 0) );
END sr_length_unit;


ARCHITECTURE synth OF sr_length_unit IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  SIGNAL carries   : STD_LOGIC_VECTOR (w DOWNTO 0);
  SIGNAL int_ce    : STD_LOGIC;
  SIGNAL load_unit : STD_LOGIC;

BEGIN

  ------------------------------------------------------------------------------
  -- subtracter lsb has cin tied high
  carries(0) <= '1';

  sb : FOR i IN 0 TO w-1 GENERATE
  BEGIN
    su1 : sr_length_unit_bit
    GENERIC MAP (c_has_co          => (i < w-1),
                 c_has_ce          => c_has_ce,
                 c_num_channels    => c_num_channels,
                 c_xdevicefamily   => c_xdevicefamily,
                 c_family          => c_family,
                 c_elaboration_dir => c_elaboration_dir,
                 c_enable_rlocs    => c_enable_rlocs)
    PORT MAP (a0     => a(i),
              b0     => b(i),
              ci     => carries(i),
              clk    => clk,
              r      => r,
              ce     => int_ce,
              load   => load_unit,
              s0     => s(i),
              co     => carries(i+1));

  END GENERATE; -- sb



  ------------------------------------------------------------------------------
  -- Drive clock enable and "load_unit"
  --
  mcg1 : IF c_num_channels <= 1 GENERATE
    -- Only update register when update = 1, or it is being reset.
    -- load must also always be asserted to update.
    int_ce <= ce AND load AND (r OR update);

    load_unit <= load; -- Not used
  END GENERATE; -- mcg1


  mcg2 : IF c_num_channels > 1 GENERATE
  BEGIN
    int_ce <= ce;

    -- "load" and "update" must both be asserted to update output
    -- If "r" is asserted then output will be reset to 0 regarless
    -- of "load_unit".
    load_unit <= load AND update;

  END GENERATE; -- mcg2

END synth;









--------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/bma.vhd,v 1.8 2011/06/30 14:35:50 andreww Exp $
--
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Unit      : bma
-- Function  : Generic Berlekamp-Massey circuit
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.dec_pkg.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;

--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- The following Ports are provided:

-- syndromes : Syndrome polynomial (least significant coefficient first)
-- start_bma : Start flag, high for 1 clock cycle, coincident with the least
--             significant coefficient of the syndrome polynomial.
-- erase_loc : Erasure locator polynomial coefficients (ls first)
-- erase_cnt : Number of erasures in block
-- err_loc   : output error locator (least significant coefficient first).
-- err_eval  : output error evaluator (least significant coefficient first).
--             Note that the evaluator coefficients emerge 1 cycle LATER than
--             the corresponding locator coefficients. This is deliberate, and
--             makes the loading of the polynomial coefficients into the Chien
--             search circuit easier.
-- poly_flag : output flag, high for 1 clock cycle coincident with the
--             least significant coefficient of the locator polynomial.
-- bma_dead  : asserted high if one-hot FSM gets into an illegal state.
-- n_out     : latched value of n_in.


-- If erasures are not supported then latency of bma block is:
--    2t + 2(1+2+...+(t+1)) + (t+1) + t(t+2)
--    = 195 cycles for t=8
--    = 283 cycles for t=10
-- from entry of first syndrome until the first locator coefficient emerges.
-- i.e. from trailing edge of start_bma pulse to trailing edge of
-- poly_flag pulse
-- This total + (t+1) must be <= n for circuit to function correctly.
-- (t+1) is the time taken to shift the coefficients into the Chien unit.


entity bma is
  generic (
    C_K                    : integer;
    C_N                    : integer;
    C_POLYNOMIAL           : integer;
    C_SYMBOL_WIDTH         : integer;
    C_NUM_CHANNELS         : integer;
    C_HAS_CE               : boolean;
    C_HAS_ERASE            : integer;
    C_HAS_SCLR             : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_R_WIDTH              : integer;
    C_OPTIMISATION         : integer;        --0=area 1=speed
    C_SELF_RECOVERING      : integer;
    C_ELABORATION_DIR      : string;
    C_XDEVICEFAMILY        : string;
    C_FAMILY               : string
    );
  port (
    syndromes      : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    start_bma      : in  std_logic;
    start_bma_p1   : in  std_logic;     -- Goes high 1 cycle before start_bma
    -- Can be used to get ready for start
    chien_ready    : in  std_logic;
    clk            : in  std_logic;
    ce             : in  std_logic := '1';
    erase_loc      : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    erase_cnt      : in  std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0) := (others => '0');
    sclr           : in  std_logic := '0';
    n_in           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in           : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    bma_ready      : out std_logic;
    erase_cnt_out  : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    err_loc        : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval       : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_out          : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_out          : out std_logic_vector(C_R_WIDTH-1 downto 0);
    loc_deg        : out std_logic_vector(C_R_WIDTH-1 downto 0);
    poly_flag      : out std_logic;
    start_chien_p1 : out std_logic;
    start_chien_p2 : out std_logic;
    bma_dead       : out std_logic
    );
end bma;

--------------------------------------------------------------------------------
--
-- Parallel Reed Solomon decoder Berlekamp-Massey Unit
--
--------------------------------------------------------------------------------

architecture synth of bma is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant multi_channel : boolean := C_NUM_CHANNELS > 1;

-- 1 if multi-channel, else 0
  constant multi_channel_int : integer := bool_to_int(multi_channel);


-- Possible combinations of multi-channel, optimisation and extra_pipeline:
--
--  Multi-channel  User's Optimisation Actual Optimisation  Extra-Pipeline
--       0                0                  0                   0
--       0                1                  1                   0
--       1                0                  1                   1
--       1                1                  1                   1


-- Force optimisation to 1 if multi-channel as we need to used new_lambda_d
-- when writing to lambda memory. This is because new_lambda is not directly
-- accessible due to the pipeline registers in the GF multipliers.
  constant actual_optimisation : integer := bool_to_int(multi_channel or C_OPTIMISATION /= 0);

-- Add pipeline reg to disc generator. This will speed core up slightly but has
-- a knock-on effect of increasing complexity of B and bshift generation.
  constant extra_pipeline : integer := bool_to_int(multi_channel);


  constant c_has_ce_int : integer := bool_to_int(C_HAS_CE);

-- If component uses chan_ce then C_HAS_CE must be forced high in
-- multi-channel mode for that component.
  constant c_has_chan_ce : integer := bool_to_int(C_HAS_CE or multi_channel);


  constant chan_count_width : integer := bitsneededtorepresent(C_NUM_CHANNELS-1);
  constant chan_count_bits  : integer := select_val(0, chan_count_width, multi_channel_int);

--------------------------------------------------------------------------------
-- Codeword parameters
--
  constant t         : integer := (C_N-C_K)/2;  -- trunc towards 0
  constant t_plus_1  : integer := t+1;
  constant t_minus_1 : integer := t-1;
  constant r_const   : r_type  := select_val(2*t, C_N-C_K, C_HAS_ERASE);
  constant r_plus_1  : integer := r_const+1;
  constant r_minus_1 : integer := r_const-1;
  constant n_minus_1 : integer := C_N-1;

  constant t_width : integer := C_R_WIDTH-1;

-- Add variable versions of above constants
  signal var_t         : std_logic_vector(t_width-1 downto 0) := (others => '0');
  signal var_t_minus_1 : std_logic_vector(t_width-1 downto 0) := (others => '0');
  signal var_r         : std_logic_vector(C_R_WIDTH-1 downto 0) := (others => '0');
  signal var_r_minus_1 : std_logic_vector(C_R_WIDTH-1 downto 0) := (others => '0');


  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH - 1;
  constant symbol_width_plus_1  : integer := C_SYMBOL_WIDTH + 1;
  subtype symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);

--------------------------------------------------------------------------------
--
-- Number of iterations = r. Iteration counter must be able to count up to r.
  constant it_count_width         : integer := C_R_WIDTH;
  constant it_count_width_minus_1 : integer := it_count_width-1;
  subtype it_count_type is std_logic_vector(it_count_width_minus_1 downto 0);

-- delta_cmp is wide enough to accomodate it_count_width+1 bits
  subtype delta_cmp_type is std_logic_vector(it_count_width downto 0);

-- Number of syndrome memory locations = r. Addresses 0 to r-1
-- If multi-channel then need this amount of space per channel.
  constant sm_add_width_1_channel : integer := bitsneededtorepresent(r_minus_1);

  subtype sm_add_1_channel_type is std_logic_vector(sm_add_width_1_channel-1 downto 0);

  constant sm_add_width : integer := sm_add_width_1_channel + chan_count_bits;

  subtype sm_add_type is std_logic_vector(sm_add_width-1 downto 0);

  constant erase_cnt_width         : integer := bitsneededtorepresent(C_N);
  constant erase_cnt_width_minus_1 : integer := erase_cnt_width - 1;
  subtype erase_cnt_type is std_logic_vector(erase_cnt_width_minus_1 downto 0);


-- Upper address bits of RAM are driven by channel counter
  constant syn_mem_depth : integer := select_val(r_const,
                                                 C_NUM_CHANNELS * (2**sm_add_width_1_channel),
                                                 multi_channel_int);


--------------------------------------------------------------------------------
-- Polynomial memory
--
-- Need to store r+1 coefficients if supporting erasures, t+1 if not supporting
-- erasures
  constant lb_mem_depth_1_channel : integer := select_val(t_plus_1, r_plus_1, C_HAS_ERASE);


-- Function used to calculate width of iteration counter output decode
  function calc_width (cnt_width : integer) return integer is
    variable w : integer;
  begin
    if C_HAS_ERASE = 0 then
      -- e.g. if r=6 then t-1=2, which requires 2 bits but still need
      -- to decode all 3 bits because 6 would give a false output
      w := bitsneededtorepresent(t_minus_1);

      if (t_minus_1 + 2**w) > r_const then
        return w;                       -- t-1 + 2**w will never be reached
      else
        return w+1;                     -- need to check an extra bit
      end if;
    else
      return bitsneededtorepresent(r_minus_1);
    end if;  -- C_HAS_ERASE
  end calc_width;

-- Addresses 0 to lb_mem_depth-1 (i.e. t or r depending on erasure support)
  constant polymem_add_width_1_channel : integer
    := bitsneededtorepresent(lb_mem_depth_1_channel-1);

  subtype polymem_add_1_channel_type is
    std_logic_vector(polymem_add_width_1_channel-1 downto 0);

  constant polymem_add_width : integer := polymem_add_width_1_channel + chan_count_bits;

  subtype polymem_add_type is std_logic_vector(polymem_add_width-1 downto 0);

  constant lb_mem_depth : integer :=
    select_val(lb_mem_depth_1_channel,
               C_NUM_CHANNELS * (2**polymem_add_width_1_channel),
               multi_channel_int);

--CONSTANT temp1 : BOOLEAN := display_int3(polymem_add_width_1_channel,
--                                         polymem_add_width,
--                                         chan_count_bits);


--------------------------------------------------------------------------------
-- BMA state machine
--
  constant num_states         : integer := 10;
  constant num_states_minus_1 : integer := num_states-1;
  subtype fsm_type is std_logic_vector(num_states_minus_1 downto 0);

-- Control state machine states (one-hot)
  constant idle                  : fsm_type := "0000000001";
  constant init_mem              : fsm_type := "0000000010";
  constant update_disc           : fsm_type := "0000000100";
  constant update_poly           : fsm_type := "0000001000";
  constant update_poly_disc      : fsm_type := "0000010000";
  constant req_lambda_eval       : fsm_type := "0000100000";
  constant update_disc_eval      : fsm_type := "0001000000";
  constant update_disc_eval_last : fsm_type := "0010000000";
  constant read_poly             : fsm_type := "0100000000";
  constant wait_for_chien        : fsm_type := "1000000000";



--------------------------------------------------------------------------------
-- Create Galois field array
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gf_max : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;

-- GF(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

-- Get the 1st 2*symbol_width elements from alpha_to, as they are all that
-- GF multipliers need
  constant alpha_to_short : integer_array_type(0 to 2*C_SYMBOL_WIDTH-1) := alpha_to(0 to 2*C_SYMBOL_WIDTH-1);


-- Record for variable coefficient GF multipliers
  constant gfx_mul : gfx_record_type := gfx_calc_record(C_SYMBOL_WIDTH,
                                                        C_POLYNOMIAL,
                                                        false,
                                                        alpha_to_short);

  constant gfx_mac : gfx_record_type := gfx_calc_record(C_SYMBOL_WIDTH,
                                                        C_POLYNOMIAL,
                                                        true,
                                                        alpha_to_short);


--------------------------------------------------------------------------------
-- Constant STRINGs used by addsub baseblock
--
  constant one_r_str : string(1 to C_R_WIDTH) := integer_to_logic_string(1, C_R_WIDTH);
  constant one_t_str : string(1 to t_width) := integer_to_logic_string(1, t_width);



--------------------------------------------------------------------------------
  signal disc, bshift, bshift_d, m1_out, m2_out, disc_add_out,
         current_lambda, gamma, syn_select, new_gamma, new_lambda,
         bmux_o1, new_b, new_lambda_d : symbol_type := (others => '0');

  signal bshift_tmp         : symbol_type := (others => '0');
  signal chan_ce            : std_logic := '0';
  signal chan_count         : std_logic_vector(chan_count_width-1 downto 0) := (others => '0');
  signal current_b          : symbol_type := (others => '0');
  signal current_b_sr       : symbol_type := (others => '0');
  signal current_lambda_tmp : symbol_type := (others => '0');
  signal current_state      : fsm_type := idle;

  signal ec_lt_itcnt        : std_logic := '0';
  signal erase_cnt_reg      : erase_cnt_type := (others => '0');
  signal err_loc_tmp        : symbol_type := (others => '0');

  signal eval_add           : polymem_add_type := (others => '0');
  signal eval_add_1_channel : polymem_add_1_channel_type := (others => '0');
  signal eval_we            : std_logic := '0';
  signal eval_add_sr        : std_logic := '0';

  signal init_b_to_0            : std_logic := '0';
  signal init_b_to_1            : std_logic := '0';
  signal init_new_lambda_d_to_1 : std_logic := '0';
  signal init_new_lambda_d_to_0 : std_logic := '0';
  signal int_ce                 : std_logic := '0';  -- Internal clock enable
  signal int_sclr               : std_logic := '0';  -- Internal sync reset
  signal it_cnt                 : it_count_type := (others => '0');
  signal it_cnt_en              : std_logic := '0';
  signal it_cnt_sr              : std_logic := '0';
  signal it_cnt_tc              : std_logic := '0';
  signal last_coeff             : std_logic := '0';
  signal itc_is_0               : std_logic := '0';

  signal keep_start_high        : std_logic := '0';

  signal lbm_add            : polymem_add_type := (others => '0');
  signal lbm_add_1_channel  : polymem_add_1_channel_type := (others => '0');
  signal lbm_add_sr         : std_logic := '0';
  signal lbm_add_tc         : std_logic := '0';
  signal lbm_we             : std_logic := '0';

  signal loc_deg_en         : std_logic := '0';
  signal loc_deg_out        : it_count_type := (others => '0');  -- These are necessary so output signals
  signal poly_flag_out      : std_logic := '0';      -- can be re-used within this entity
  constant r_zeroes         : std_logic_vector(C_R_WIDTH-1 downto 0) := (others => '0');
  signal sm_add             : sm_add_type := (others => '0');
  signal sm_add_1_channel   : sm_add_1_channel_type := (others => '0');
  signal sm_add_load        : sm_add_1_channel_type := (others => '0');
  signal sm_add_ld          : std_logic := '0';
  signal sm_add_sr          : std_logic := '0';
  signal sm_add_tc          : std_logic := '0';
  signal sm_add_ud          : std_logic := '0';
  signal sm_we              : std_logic := '0';
  signal sma_is_1           : std_logic := '0';
  signal state_add_tc       : std_logic := '0';
  signal start              : std_logic := '0';
  signal start_chien_p1_tmp : std_logic := '0';
  signal start_chien_p2_tmp : std_logic := '0';

  signal itc_ex, sr_length_x2       : delta_cmp_type := (others => '0');
  signal sr_length                  : it_count_type := (others => '0');
  signal sr_length_sr, sr_length_en : std_logic := '0';

  signal disc_add_sr, disc_add_sr_tmp         : std_logic := '0';
  signal disc_en, disc_en_tmp                 : std_logic := '0';
  signal gamma_sr, gamma_en, bshift_sr, delta : std_logic := '0';

  signal pf, pf_d : std_logic := '0';


--------------------------------------------------------------------------------
-- Beginning of architecture body
--------------------------------------------------------------------------------
begin

  -- Handle optional ce pin
  y_ce : if C_HAS_CE generate
    int_ce <= ce;
  end generate;  -- y_ce

  n_ce : if not(C_HAS_CE) generate
    int_ce <= '1';
  end generate;  -- n_ce

  -- Handle optional sr pin
  y_sr : if C_HAS_SCLR /= 0 generate
    int_sclr <= sclr;
  end generate;  -- y_sr

  n_sr : if C_HAS_SCLR = 0 generate
    int_sclr <= '0';
  end generate;  -- n_sr


  ------------------------------------------------------------------------------
  -- If r is variable, need to compute t-1 and r-1 for each new block
  --
  vr1 : if C_HAS_R_IN /= 0 generate

    var_t <= r_in(C_R_WIDTH-1 downto 1);  -- t = r/2


    vr1a : if C_HAS_ERASE = 0 generate
      var_r <= r_in(C_R_WIDTH-1 downto 1) & '0';  -- Round down to even value

      -- Subtract 1 from t
      sb1 : rs_addsub
        generic map (
          c_xdevicefamily => C_XDEVICEFAMILY,
          c_a_width       => t_width,
          c_b_width       => t_width,
          c_a_type        => c_unsigned,
          c_b_type        => c_unsigned,
          c_out_width     => t_width,
          c_latency       => 1,
          c_add_mode      => c_sub,
          c_b_constant    => 1,
          c_b_value       => one_t_str,
          c_has_ce        => c_has_ce_int)
        port map (
          a   => var_t,
          b   => var_t, -- not used
          clk => clk,
          ce  => int_ce,
          s   => var_t_minus_1);

    end generate;  -- vr1a

    vr1b : if C_HAS_ERASE /= 0 generate
      var_r <= r_in;                    -- Use full r_in, including odd values
    end generate;  -- vr1b



    -- Subtract 1 from r
    sb2 : rs_addsub
      generic map (
        c_xdevicefamily => C_XDEVICEFAMILY,
        c_a_width       => C_R_WIDTH,
        c_b_width       => C_R_WIDTH,
        c_a_type        => c_unsigned,
        c_b_type        => c_unsigned,
        c_out_width     => C_R_WIDTH,
        c_latency       => 1,
        c_add_mode      => c_sub,
        c_b_constant    => 1,
        c_b_value       => one_r_str,
        c_has_ce        => c_has_ce_int
        )
      port map (
        a   => var_r,
        b   => var_r,                   -- not used
        clk => clk,
        ce  => int_ce,
        s   => var_r_minus_1
        );

  end generate;  -- vr1



  -- "bma_ready" signals that it is safe to assert "start_bma"
  bma_ready <= current_state(0);

  err_loc <= err_loc_tmp;               -- Primary output

  ------------------------------------------------------------------------------
  -- Memories to hold the syndrome and B polynomials.

  -- Syndrome memory is r x C_SYMBOL_WIDTH
  syn_mem : syncmem
    generic map (
      width             => C_SYMBOL_WIDTH,
      reqd_depth        => syn_mem_depth,
      memstyle          => dist_mem,
      c_has_ce          => c_has_ce_int,
      c_has_we          => 1,
      q_mode            => no_reg,
      debug_string      => "syn_mem",
      c_elaboration_dir => C_ELABORATION_DIR,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_family          => C_FAMILY
      )
    port map (
      a     => sm_add,
      d     => syndromes,
      we    => sm_we,
      c     => clk,
      ce    => int_ce,
      q     => syn_select,
      q_reg => open
      );




  ------------------------------------------------------------------------------
  -- BMA iteration counter (counts from 0 to r for BMA, then 0 to t-1 for the
  -- evaluator calculation (r-1 if erasures are supported). It is always reset
  -- once it has reached r.

  vr2 : if C_HAS_R_IN = 0 generate
    icnt1 : cntre_a
      generic map (
        width         => it_count_width,
        use_count_to  => true,
        count_to      => r_const,
        sync_reset_to => 0,
        c_family      => C_FAMILY
        )
      port map (
        r   => it_cnt_sr,
        ce  => it_cnt_en,
        c   => clk,
        cnt => it_cnt,
        tc  => it_cnt_tc
        );
  end generate;  -- vr2

  -- Replace fixed terminal-count counter with a variable one
  vr3 : if C_HAS_R_IN /= 0 generate

    icnt2 : rs_counter
      generic map (
        c_xdevicefamily => C_XDEVICEFAMILY,
        c_width         => it_count_width,
        use_count_to    => false,
        count_to        => 0,
        c_count_mode    => c_up,
        c_has_ce        => 1,
        c_has_sclr      => 1,
        c_sync_enable   => c_no_override -- Only reset if it_cnt_en='1'
        )
      port map (
        clk  => clk,
        ce   => it_cnt_en,
        l    => r_zeroes,               -- Not used
        up   => '1',
        sclr => it_cnt_sr,              -- Activated when count reaches r
        q    => it_cnt
        );

    -- Counter rolls over when it reaches r
    cmp2 : rs_compare_eq_var
      generic map (
        c_family       => C_FAMILY,
        c_width        => it_count_width,
        c_enable_rlocs => 0
        )
      port map (
        a      => it_cnt,
        b      => var_r,
        a_eq_b => it_cnt_tc
        );

  end generate;  -- vr3
  ------------------------------------------------------------------------------



  -- Check when the iteration count is zero (some things need to be set
  -- up before the first lambda polynomial is calculated) and when it is
  -- t-1 (indicates the end of the evaluator calculation sequence).
  --
  -- Check if it_cnt is 0
  -- itc_is_0 <= '1' WHEN it_cnt=0 ELSE '0';
  itc0 : comp_eq
  generic map (c_family=>C_FAMILY, width=>it_count_width, comp_val=>0, q_mode=>no_reg)
  port map (i=>it_cnt, o=>itc_is_0);




  ------------------------------------------------------------------------------
  -- Check if it_cnt is t-1 (r-1 for erasures)
  -- last_coeff <= '1' WHEN it_cnt=t-1 ELSE '0';
  lcblk : block
    -- itc always counts UP so don't usually need to include msb in decode
    constant width : integer := calc_width(it_count_width);
  begin

    n_e : if C_HAS_ERASE = 0 generate

      vr5 : if C_HAS_R_IN = 0 generate
        itctm1 : comp_eq
        generic map (c_family=>C_FAMILY, width=>width, comp_val=>t_minus_1, q_mode=>no_reg)
        port map (i=>it_cnt(width-1 downto 0), o=>last_coeff);
      end generate;  -- vr5

      vr5a : if C_HAS_R_IN /= 0 generate
        -- Replace with variable version
        itctm2 : rs_compare_eq_var
          generic map (
            c_family       => C_FAMILY,
            c_width        => t_width,
            c_enable_rlocs => 0
            )
          port map (
            a      => it_cnt(t_width-1 downto 0),
            b      => var_t_minus_1,
            a_eq_b => last_coeff
            );
      end generate;  -- vr5a

    end generate;  -- n_e


    e : if C_HAS_ERASE /= 0 generate

      vr5b : if C_HAS_R_IN = 0 generate
        itctm3 : comp_eq
        generic map (c_family=>C_FAMILY, width=>width, comp_val=>r_minus_1, q_mode=>no_reg)
        port map (i=>it_cnt(width-1 downto 0), o=>last_coeff);
      end generate;  -- vr5b

      vr5c : if C_HAS_R_IN /= 0 generate
        -- Replace with variable version
        itctm4 : rs_compare_eq_var
          generic map (
            c_family       => C_FAMILY,
            c_width        => C_R_WIDTH,
            c_enable_rlocs => 0
            )
          port map (
            a      => it_cnt(C_R_WIDTH-1 downto 0),
            b      => var_r_minus_1,
            a_eq_b => last_coeff
            );
      end generate;  -- vr5c

    end generate;  -- e

  end block lcblk;




  -- If erasures are supported we need a signal to determine when 'it_cnt'
  -- has reached the number of erasures. This is the time to start updating
  -- the BMA polynomials and variables.
  eli : if C_HAS_ERASE /= 0 generate
--     cmp1 : comp_lt_var
--       generic map (
--         c_family => C_FAMILY,
--         width    => it_count_width,
--         mode     => 0
--         )
--       port map (
--         a  => erase_cnt_reg(it_count_width_minus_1 downto 0),
--         b  => it_cnt,
--         en => '1',
--         o  => ec_lt_itcnt
--         );

    ec_lt_itcnt <= '1' when
     (unsigned(erase_cnt_reg(it_count_width_minus_1 downto 0)) < unsigned(it_cnt)) else '0';

  end generate;  -- eli


  -- 'ec_lt_itcnt' is not used if erasures are not supported
  n_eli : if C_HAS_ERASE = 0 generate
    ec_lt_itcnt <= '0';
  end generate;  -- n_eli





  -----------------------------------------------------------------------------
  -- Syndrome memory address counter (Up/Down 0 to r-1)
  scnt : ud_cntre
  generic map (
    c_xdevicefamily => C_XDEVICEFAMILY,
    width           => sm_add_width_1_channel,
    use_count_to    => false
    )
  port map (
    r     => sm_add_sr,
    ce    => chan_ce,
    c     => clk,
    d_in  => sm_add_load,
    load  => sm_add_ld,
    up_dn => sm_add_ud,
    cnt   => sm_add_1_channel,
    tc    => open
    );

  -- Check for syndrome memory address reaching r-1
  -- sm_add_tc <= '1' WHEN sm_add=r-1 ELSE '0';
  -- Note sm_add_tc is not used if C_HAS_ERASE
  vr6 : if C_HAS_R_IN = 0 generate
    smatc1 : comp_eq
    generic map (c_family=>C_FAMILY, width=>sm_add_width_1_channel, comp_val=>r_minus_1, q_mode=>no_reg)
    port map (i=>sm_add_1_channel, o=>sm_add_tc);
  end generate;  -- vr6

  -- Replace with variable version
  -- Note var_r_minus_1 can be 1 bit wider than sm_add_1_channel but the
  -- msb will be 0 for all legal r values. An illegal r value could
  -- result in sm_add_tc never being asserted.
  vr6a : if C_HAS_R_IN /= 0 generate
    smatc2 : rs_compare_eq_var
      generic map (
        c_family       => C_FAMILY,
        c_width        => sm_add_width_1_channel,
        c_enable_rlocs => 0
        )
      port map (
        a      => sm_add_1_channel,
        b      => var_r_minus_1(sm_add_width_1_channel-1 downto 0),
        a_eq_b => sm_add_tc
        );
  end generate;  -- vr6a



  ------------------------------------------------------------------------------
  mcg12 : if not(multi_channel) generate
    sm_add <= sm_add_1_channel;
  end generate;  -- mcg12

  -- Channel count forms msbs of memory address
  mcg9 : if multi_channel generate
    mcg10 : for i in 0 to sm_add_width_1_channel-1 generate
      sm_add(i) <= sm_add_1_channel(i);
    end generate;  -- mcg10
    mcg11 : for i in 0 to chan_count_bits-1 generate
      sm_add(i+sm_add_width_1_channel) <= chan_count(i);
    end generate;  -- mcg11
  end generate;  -- mcg9



  -- When the syndrome counter is synchronously loaded, it gets the current
  -- iteration count.
  sm_add_load <= it_cnt(sm_add_load'high downto 0);




  -- To flag the state change from updating both polynomials and discrepency
  -- to updating discrepency alone, we need to flag when the syndrome counter
  -- reaches 1 (counting down).
  -- sma_is_1 <= '1' when sm_add=1 else '0';
  sma1 : comp_eq
  generic map (c_family=>C_FAMILY, width=>sm_add_width_1_channel, comp_val=>1, q_mode=>no_reg)
  port map (i=>sm_add_1_channel, o=>sma_is_1);





  -- Address counter for lambda and B (0 to t (r if handling erasures)).
  --
  -- To help control the state machine, we need to flag when the lambda/B
  -- counter reaches its terminal count of t.
  -- Counter will roll over to 0 when terminal count is reached. This is
  -- important so that at the end of the read_poly state it is returned to
  -- 0 in case idle state is only 1 cycle duration and lbm_add_sr is not
  -- asserted.
  vr7 : if C_HAS_R_IN = 0 generate
    lbcnt1 : cntre_a
      generic map (
        width         => polymem_add_width_1_channel,
        use_count_to  => true,
        count_to      => lb_mem_depth_1_channel-1,
        sync_reset_to => 0,
        c_family      => C_FAMILY
        )
      port map (
        r   => lbm_add_sr,
        ce  => chan_ce,
        c   => clk,
        cnt => lbm_add_1_channel,
        tc  => lbm_add_tc
        );

    -- Address counter for evaluator (0 to t (r if handling erasures))
    evcnt1 : cntre_a
      generic map (
        width         => polymem_add_width_1_channel,
        use_count_to  => true,
        count_to      => lb_mem_depth_1_channel-1,
        sync_reset_to => 0,
        c_family      => C_FAMILY
        )
      port map (
        r   => eval_add_sr,
        ce  => chan_ce,
        c   => clk,
        cnt => eval_add_1_channel,
        tc  => open
        );
  end generate;  -- vr7


  -- Replace terminal counts with variable versions
  vr7a : if C_HAS_R_IN /= 0 generate
    -- t or r bits depending on whether erasures supported
    signal poly_zeroes  : polymem_add_1_channel_type := (others => '0');
    signal max_lbm_add  : polymem_add_1_channel_type := (others => '0');
    signal eval_add_sr1 : std_logic := '0';
    signal eval_add_tc  : std_logic := '0';
  begin

    poly_zeroes <= (others => '0');

    vr7b : if C_HAS_ERASE = 0 generate
      max_lbm_add <= var_t;
    end generate;  -- vr7b

    vr7c : if C_HAS_ERASE /= 0 generate
      max_lbm_add <= var_r;
    end generate;  -- vr7c

    -- This counter is not reset on global reset. It will be cleared when a new
    -- block is started
    lbcnt2 : rs_counter
      generic map (
        c_xdevicefamily => C_XDEVICEFAMILY,
        c_width         => polymem_add_width_1_channel,
        use_count_to    => false,
        count_to        => 0,
        c_count_mode    => c_up,
        c_has_ce        => 1,
        c_has_sclr      => 1,
        c_sync_enable   => c_no_override -- Only reset if chan_ce='1'
        )
      port map (
        clk  => clk,
        ce   => chan_ce,
        load => '0',
        l    => poly_zeroes,
        up   => '1',
        sclr => lbm_add_sr,  -- Will go high when terminal count reached
        q    => lbm_add_1_channel
        );

    cmp3 : rs_compare_eq_var
      generic map (
        c_family       => C_FAMILY,
        c_width        => polymem_add_width_1_channel,
        c_enable_rlocs => 0
        )
      port map (
        a      => lbm_add_1_channel,
        b      => max_lbm_add,
        a_eq_b => lbm_add_tc
        );




    -- Address counter for evaluator (0 to t (r if handling erasures))
    evcnt2 : rs_counter
      generic map (
        c_xdevicefamily => C_XDEVICEFAMILY,
        c_width         => polymem_add_width_1_channel,
        use_count_to    => false,
        count_to        => 0,
        c_count_mode    => c_up,
        c_has_ce        => 1,
        c_has_sclr      => 1,
        c_sync_enable   => c_no_override -- Only reset if chan_ce='1'
        )
      port map (
        clk  => clk,
        ce   => chan_ce,
        load => '0',
        l    => poly_zeroes,
        up   => '1',
        sclr => eval_add_sr1,
        q    => eval_add_1_channel
        );

    -- Counter doesn't auto roll-over so force sclr high when terminal count
    eval_add_sr1 <= eval_add_tc or eval_add_sr;


    cmp4 : rs_compare_eq_var
      generic map (
        c_family       => C_FAMILY,
        c_width        => polymem_add_width_1_channel,
        c_enable_rlocs => 0
        )
      port map (
        a      => eval_add_1_channel,
        b      => max_lbm_add,
        a_eq_b => eval_add_tc
        );


  end generate;  -- vr7a





  mcg5 : if not(multi_channel) generate
    lbm_add  <= lbm_add_1_channel;
    eval_add <= eval_add_1_channel;
  end generate;  -- mcg5

  -- Channel count forms msbs of memory address
  mcg6 : if multi_channel generate
    mcg7 : for i in 0 to polymem_add_width_1_channel-1 generate
      lbm_add(i)  <= lbm_add_1_channel(i);
      eval_add(i) <= eval_add_1_channel(i);
    end generate;  -- mcg7
    mcg8 : for i in 0 to chan_count_bits-1 generate
      lbm_add(i+polymem_add_width_1_channel)  <= chan_count(i);
      eval_add(i+polymem_add_width_1_channel) <= chan_count(i);
    end generate;  -- mcg8
  end generate;  -- mcg6







  ------------------------------------------------------------------------------
  -- Register to provide a shifted version of B for the BMA

  bshift_d <= current_b when bshift_sr = '0' else (others => '0');

  -- bshift is current_b delayed by 1 cycle (for single channel)
  br1 : rs_reg
  generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>c_has_ce_int)
  port map (d=>bshift_d, clk=>clk, ce=>int_ce, q=>current_b_sr);

  -- bshift is current_b delayed by C_NUM_CHANNELS (for multi-channel)
  bsd : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => C_SYMBOL_WIDTH,
      clk_delay         => C_NUM_CHANNELS-1,  -- 1 delay accounted for in br1
      memstyle          => dist_mem,
      c_has_ce          => c_has_ce_int
      )
    port map (
      din  => current_b_sr,
      clk  => clk,
      ce   => int_ce,
      dout => bshift
      );









  ------------------------------------------------------------------------------
  -- Using the inverse-free BMA, so we need to keep the correction term gamma.
  -- The updated gamma is either the old value (when delta is 0) or the
  -- value of the current discrepency (when delta is 1). When gamma_sr is
  -- asserted, gamma is synchronously reset to 1;
  --
  gmux : for i in symbol_width_minus_1 downto 1 generate

    new_gamma(i) <= ((delta and disc(i)) or (gamma(i) and not(delta))) and not(gamma_sr);

  end generate;  -- gmux

  -- Bit 0 of the gamma register needs dealt with separately, since it
  -- must be reset to '1'.
  new_gamma(0) <= ((delta and disc(0)) or (gamma(0) and not(delta))) or gamma_sr;



  gg1 : if not(multi_channel) generate

    -- bshift is current_b delayed by 1 cycle (for single channel)
    gr1 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>1)
    port map (d=>new_gamma, clk=>clk, ce=>gamma_en, q=>gamma);

  end generate;  -- gg1


  -- For multi-channel operation we need to select the appropriate
  -- gamma value for each channel. We could use a wide mux to do this
  -- but a more efficient way is to use an SRL16 (or register based
  -- shift register) and continuously rotate the required gamma values
  -- through so that the required one is on the output. This avoids the
  -- combinatorial mux delay and is smaller.
  gg2 : if multi_channel generate
    signal new_gamma_d   : symbol_type := (others => '0');
    signal new_gamma_reg : symbol_type := (others => '0');
  begin

    -- gamma_en selects whether gamma or new_gamma is fed to delay line.
    -- Only allow new_gamma in when gamma is to be updated.
    -- Reg is enabled all the time to rotate gamma for each channel.
    new_gamma_d <= new_gamma when gamma_en = '1' else gamma;

    gm1 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>c_has_ce_int)
    port map (d=>new_gamma_d, clk=>clk, ce=>int_ce, q=>new_gamma_reg);


    -- SRL16 to hold gamma values for each channel
    gmd : big_delay
      generic map (
        c_family          => C_FAMILY,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_elaboration_dir => C_ELABORATION_DIR,
        bus_width         => C_SYMBOL_WIDTH,
        clk_delay         => C_NUM_CHANNELS-1,  -- new_gamma_reg holds 1 channel
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int
        )
      port map (
        din  => new_gamma_reg,
        clk  => clk,
        ce   => int_ce,
        dout => gamma
        );

  end generate;  -- gg2




  -----------------------------------------------------------------------------
  -- Register to hold the length of the shift register. Synchronously reset
  -- when sr_length_sr is asserted. The input to the register is muxed,
  -- selecting sr_length when delta=0 else it_cnt-sr_length.

  srlblk : block
  begin
    no_e : if C_HAS_ERASE = 0 generate
      -- sub_a uses the registers' clock enable to hold its current value
      -- or to update
      -- Note unit is always reset when "r" input asserted. This is ok
      -- because "sr_length_en" is always high when "sr_length_sr" is
      -- asserted.
      sru1 : sr_length_unit
        generic map (
          w                 => it_count_width,
          c_has_ce          => c_has_ce_int,
          c_num_channels    => C_NUM_CHANNELS,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_family          => C_FAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          c_enable_rlocs    => 0
          )
        port map (
          a      => it_cnt,
          b      => sr_length,
          clk    => clk,
          ce     => int_ce,
          update => delta,
          load   => sr_length_en,
          r      => sr_length_sr,
          s      => sr_length
          );

    end generate;  -- no_e

    -- If erasure decoding is enabled, 'sr_length' is initialized to
    -- 'erase_cnt', causing the BMA to only run for r - 'erase_cnt'
    -- iterations. This is done by loading it_cnt + erase_cnt_reg during
    -- the last cycle of the init_mem state. it_cnt = 0, so sr_length is
    -- initialized to erase_cnt_reg.
    --
    -- sr_length is now updated with it_cnt-sr_length+erase_cnt_reg.
    e : if C_HAS_ERASE /= 0 generate
      signal update_val : std_logic := '0';
      signal sub_out    : delta_cmp_type := (others => '0');
    begin

      update_val <= current_state(1) or delta;

      -- Note unit is always reset when "r" input asserted. This is ok
      -- because "sr_length_en" is always high when "sr_length_sr" is
      -- asserted.
      sru1 : sr_length_unit
        generic map (
          w                 => it_count_width+1,
          c_has_ce          => c_has_ce_int,
          c_num_channels    => C_NUM_CHANNELS,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_family          => C_FAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          c_enable_rlocs    => 0
          )
        port map (
          a      => itc_ex,
          b      => sub_out,
          clk    => clk,
          ce     => int_ce,
          update => update_val,
          load   => sr_length_en,
          r      => sr_length_sr,
          s      => sub_out
          );

      sr_length <= sub_out(it_count_width_minus_1 downto 0);

    end generate;  -- e


  end block srlblk;





  ------------------------------------------------------------------------------
  -- Main BMA calculations...
  -- Calculation of delta.
  -- '1' IF (disc/=0 AND sr_length_x2<it_cnt) ELSE '0'.
  --
  -- For r=16:
  -- Note that "sr_length_x2" has been extended to 6 bits and the locator degree
  -- output of the Berlekamp-Massey to 5 bits. This is to facilitate the
  -- detection of the (admittedly unlikely) uncorrectable error pattern where
  -- the first r-1 syndromes are 0 and the r'th is non-zero (a locator degree
  -- of r can then be reported). If only 4 bits represents the locator degree
  -- output, this case will be reported as degree 0 (only 4 least significant
  -- bits kept) and, if the polynomial evaluation indicates no symbols for which
  -- the locator evaluates to 0, then the uncorrectability checker will be
  -- fooled into thinking this is a correctable block with no errors in it.

  -- XCC can't cope with this construct
  --  sr_length_x2(sr_length_x2'HIGH DOWNTO 1) <= sr_length;
  srlg : for bi in it_count_width downto 1 generate
    sr_length_x2(bi) <= sr_length(bi - 1);
  end generate;  -- srlg
  sr_length_x2(0) <= '0';


  dblk : block
    signal disc_neq_0 : std_logic := '0';
    signal delta_tmp  : std_logic := '0';
  begin

    mcg14 : if not(multi_channel) generate
      -- delta is high if the discrepency is not 0
      dneq0 : comp_neq
        generic map (
          c_family => C_FAMILY,
          width    => C_SYMBOL_WIDTH,
          comp_val => 0,
          q_mode   => no_reg,
          c_has_r  => false
          )
        port map (
          i     => disc,
          c     => open,
          ce    => open,
          r     => open,
          o     => disc_neq_0
          );

      -- o is high if a < b
--    comp_lt_var not working in post-synthesis simulation, so infer instead
--       d_cmp : comp_lt_var
--         generic map (
--           c_family => C_FAMILY,
--           width    => it_count_width+1,
--           mode     => 0,
--           c_has_en => 1
--           )
--         port map (
--           a  => sr_length_x2,
--           b  => itc_ex,
--           en => disc_neq_0,
--           o  => delta
--           );

      delta_tmp <= '1' when (unsigned(sr_length_x2) < unsigned(itc_ex)) else '0';

      delta <= delta_tmp and disc_neq_0;

    end generate;  -- mcg14


    -- Instantiate register structure to hold multiple delta values. These
    -- values rotate around as long as int_ce is high. New values are
    -- shifted in when disc_en_tmp is high (as well as int_ce).
    mcg13 : if multi_channel generate
      signal delta_tmp     : std_logic := '0';
      signal delta_mux_d   : std_logic := '0';
      signal delta_mux_del : std_logic_vector(0 downto 0) := (others => '0');
      signal delta_mux_o   : std_logic_vector(0 downto 0) := (others => '0');
      signal sr_lt_itc     : std_logic := '0';
    begin
      -- Use unregistered discrepency as input, as delta is captured at same
      -- time as "disc"
      dneq0 : comp_neq
        generic map (
          c_family => C_FAMILY,
          width    => C_SYMBOL_WIDTH,
          comp_val => 0,
          q_mode   => no_reg,
          c_has_r  => false
          )
        port map (
          i     => disc_add_out,
          c     => open,
          ce    => open,
          r     => open,
          o     => disc_neq_0
          );

      -- o is high if a < b
      -- comp_lt_var component has incorrect behavior. Infer comparator instead.
--       d_cmp : comp_lt_var
--         generic map (
--           c_family => C_FAMILY,
--           width    => it_count_width+1,
--           mode     => 0,
--           c_has_en => 0
--           )
--         port map (
--           a  => sr_length_x2,
--           b  => itc_ex,
--           en => '1',
--           o  => sr_lt_itc
--           );

      sr_lt_itc <= '1' when (unsigned(sr_length_x2) < unsigned(itc_ex)) else '0';


      -- sr_lt_itc, disc_add_out and disc_en are all aligned in time. Note that
      -- there is no need to delay itc_ex because delta is combinatorial in
      -- single channel case and is affected immediately by the new itc value.
      -- If we delayed itc_ex then this wouldn't be true in the multi-channel
      -- case.


      -- 2:1 mux to allow a new delta value to pass in to shift reg
      -- delta is high if disc_neq_0 = '1' and sr_lt_itc = '1'
      delta_mux_d <= (disc_neq_0 and sr_lt_itc) when disc_en_tmp = '1'
                     else delta;

      dmr : rs_reg_bit
      generic map (c_has_ce=>c_has_ce_int)
      port map (d=>delta_mux_d, clk=>clk, ce=>int_ce, q=>delta_mux_o(0));


      -- SRL16 to hold delta values for each channel.
      -- 1 stage of delay taken up in dmr reg above.
      deld : big_delay
        generic map (
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          bus_width         => 1,
          clk_delay         => C_NUM_CHANNELS-1,
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int
          )
        port map (
          din  => delta_mux_o,
          clk  => clk,
          ce   => int_ce,
          dout => delta_mux_del
          );

      delta <= delta_mux_del(0);

    end generate;  -- mcg13



    -- No erasures:
    --   srl_lt_itc <= '1' when sr_length_x2 < it_cnt else '0';
    n_e : if C_HAS_ERASE = 0 generate
      itc_ex(it_count_width) <= '0';

      itc_ex_others_gen:
      for i in it_count_width_minus_1 downto 0 generate
        itc_ex(i) <= it_cnt(i);
      end generate;  -- itc_ex_others_gen

    end generate;  -- n_e

    -- Erasures:
    --   srl_lt_itc <= '1' when sr_length_x2 < (it_cnt + erase_cnt_reg) else '0'
    e : if C_HAS_ERASE /= 0 generate
      d_add : add_a
        generic map (
          c_xdevicefamily => C_XDEVICEFAMILY,
          w               => it_count_width
          )
        port map (
          a => it_cnt,
          b => erase_cnt_reg(it_count_width_minus_1 downto 0),
          s => itc_ex
          );
    end generate;  -- e



  end block dblk;


  -----------------------------------------------------------------------------
  -- Updated lambda and B polynomials
  --
  -- If no erasure decoding:
  --    new_b <= 1      WHEN current_state(0)='1' ELSE
  --             0      WHEN current_state(1)='1' ELSE
  --             bshift WHEN delta='0'            ELSE
  --             current_lambda;
  --
  -- If erasure decoding is enabled, lambda memory must be initialised
  -- with the coefficients of the erasure locator polynomial.
  --
  --    new_b <= erase_loc WHEN current_state(0)='1' OR
  --                            current_state(1)='1'
  --                       ELSE
  --             bshift WHEN delta='0'            ELSE
  --             current_lambda;
  --
  --
  nbg1 : if extra_pipeline = 0 generate
    current_lambda_tmp     <= current_lambda;
    bshift_tmp             <= bshift;
    init_b_to_1            <= current_state(0);
    init_b_to_0            <= current_state(1);
    init_new_lambda_d_to_1 <= current_state(0);
    init_new_lambda_d_to_0 <= current_state(1);
    disc_add_sr            <= disc_add_sr_tmp;
    disc_en_tmp            <= current_state(2);
  end generate;  -- nbg1

  -- Must delay all the inputs to this unit as lbm_we is now delayed
  -- by 1 clock cycle. Don't delay delta because it is already delayed
  -- due to the 1 cycle delay on disc.
  nbg2 : if extra_pipeline /= 0 generate
    signal current_state01     : std_logic_vector(1 downto 0) := (others => '0');
    signal current_state01_del : std_logic_vector(1 downto 0) := (others => '0');
  begin

    -- err_loc_tmp is a 1 clock cycle delayed version of current_lambda
    -- so just delay by C_NUM_CHANNELS-1 to obtain a C_NUM_CHANNELS
    -- delayed version of current_lambda
    clr1 : big_delay
      generic map (
        c_family          => C_FAMILY,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_elaboration_dir => C_ELABORATION_DIR,
        bus_width         => C_SYMBOL_WIDTH,
        clk_delay         => C_NUM_CHANNELS-1,
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int
        )
      port map (
        din  => err_loc_tmp,
        clk  => clk,
        ce   => int_ce,
        dout => current_lambda_tmp
        );


    -- No need to reset because bshift_tmp only used after register has
    -- been loaded. Delay line holds b_shift values for each channel.
    bsr1 : big_delay
      generic map (
        c_family          => C_FAMILY,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_elaboration_dir => C_ELABORATION_DIR,
        bus_width         => C_SYMBOL_WIDTH,
        clk_delay         => C_NUM_CHANNELS,
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int
        )
      port map (
        din  => bshift,
        clk  => clk,
        ce   => int_ce,
        dout => bshift_tmp
        );

    -- Delay current_state by C_NUM_CHANNELS-1 FAST clock cycles, as this is
    -- how much new_lambda is delayed in multi-channel mode.
    current_state01(0) <= current_state(0);
    current_state01(1) <= current_state(1);

    cd1 : big_delay
      generic map (
        c_family          => C_FAMILY,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_elaboration_dir => C_ELABORATION_DIR,
        bus_width         => 2,
        clk_delay         => C_NUM_CHANNELS-1,
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int
        )
      port map (
        din  => current_state01,
        clk  => clk,
        ce   => int_ce,
        dout => current_state01_del
        );

    init_new_lambda_d_to_1 <= current_state01_del(0);
    init_new_lambda_d_to_0 <= current_state01_del(1);


    -- Delay current_state by C_NUM_CHANNELS FAST clock cycles, as this is
    -- how much WE to B mem is delayed in pipelined mode.
    cs0r : rs_reg_bit
    generic map (c_has_ce=>c_has_chan_ce)
    port map (d=>current_state(0), clk=>clk, ce=>chan_ce, q=>init_b_to_1);

    cs1r : rs_reg_bit
    generic map (c_has_ce=>c_has_chan_ce)
    port map (d=>current_state(1), clk=>clk, ce=>chan_ce, q=>init_b_to_0);


    -- Delay disc_en by 1 clock cycle if pipelined. disc_en needs to
    -- be delayed by C_NUM_CHANNELS FAST clock cycles so use chan_ce
    -- as the clock enable here.
    der1 : rs_reg_bit
    generic map (c_has_ce=>c_has_chan_ce)
    port map (d=>current_state(2), clk=>clk, ce=>chan_ce, q=>disc_en_tmp);

    dsr1 : rs_reg_bit
    generic map (c_has_ce=>c_has_chan_ce)
    port map (d=>disc_add_sr_tmp, clk=>clk, ce=>chan_ce, q=>disc_add_sr);

  end generate;  -- nbg2






  -----------------------------------------------------------------------------
  -- Generate new_lambda and new_b
  --
  -- If no erasure decoding:
  --
  n_e2 : if C_HAS_ERASE = 0 generate
  begin

    ----------------------------------------------------------------------------
    bmg1 : for i in symbol_width_minus_1 downto 1 generate
    begin

      bmux_o1(i) <= current_lambda_tmp(i) when delta = '1' else bshift_tmp(i);

      new_b(i) <= bmux_o1(i) and not(init_b_to_1) and not(init_b_to_0);

    end generate;  -- bmg1

    -- Bit 0 is separate, since it needs to be initialised to '1'.
    --
    bmux_o1(0) <= not((delta and current_lambda_tmp(0)) or
                      (not(delta) and bshift_tmp(0)) or init_b_to_1);

    new_b(0) <= not(bmux_o1(0) or init_b_to_0);



    ----------------------------------------------------------------------------
    --
    --    new_lambda <= 1 WHEN current_state(0)='1' ELSE
    --                  0 WHEN current_state(1)='1' ELSE
    --                  add_xor;
    --
    -- If erasure decoding is enabled, lambda memory must be initialised
    -- with the coefficients of the erasure locator polynomial.
    --
    --    new_lambda <= erase_loc WHEN current_state(0)='1' OR
    --                                 current_state(1)='1'
    --                            ELSE
    --                  add_xor;
    --
    -- Place this logic beside gfmul1 as this is the critical path.
    -- Pitch match logic to gf mul outputs.

    -- The updated lambda is fed into the discrepency calculation of the
    -- next BM iteration. This path is broken up by a register, to prevent
    -- long combinatorial delays.

    -- Bit0 is separate, as it is initialized to 1 by current_state(0)
    new_lambda(0) <= ((m1_out(0) xor m2_out(0)) and
                      not(init_new_lambda_d_to_0)) or init_new_lambda_d_to_1;

    nlg1 : for i in 1 to symbol_width_minus_1 generate
    begin
      new_lambda(i) <= (m1_out(i) xor m2_out(i)) and
                       not(init_new_lambda_d_to_1) and not(init_new_lambda_d_to_0);

    end generate;  -- nlg1

  end generate;  -- n_e2



  ------------------------------------------------------------------------------
  -- Generate new_lambda and new_b
  --
  -- If erasure decoding:
  e2 : if C_HAS_ERASE /= 0 generate
    signal erase_loc_bmem    : symbol_type := (others => '0');
    signal erase_loc_del     : symbol_type := (others => '0');
    signal sm_add_ud_bmem    : std_logic := '0';
    signal sm_add_ud_del     : std_logic := '0';
    signal sm_add_ud_vec     : std_logic_vector(0 downto 0) := (others => '0');
    signal sm_add_ud_del_vec : std_logic_vector(0 downto 0) := (others => '0');
  begin

    -- If actual_optimisation = 0 then Lambda Mem is written directly with
    -- lbm_we and there is no need to delay the data for the memory write.
    opg1 : if actual_optimisation = 0 generate
    begin
      erase_loc_del  <= erase_loc;
      sm_add_ud_del  <= sm_add_ud;
      erase_loc_bmem <= erase_loc;
      sm_add_ud_bmem <= sm_add_ud;
    end generate;  -- opg1

    -- Need to delay write data for Lambda memory to match delay on lbm_we_del
    opg2 : if actual_optimisation /= 0 generate
    begin

      -- Shift reg holds erase_loc value for each channel
      eld1 : big_delay
        generic map (
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          bus_width         => C_SYMBOL_WIDTH,
          clk_delay         => C_NUM_CHANNELS-1,  -- 1 delay accounted for in elr1
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int
          )
        port map (
          din  => erase_loc,
          clk  => clk,
          ce   => int_ce,
          dout => erase_loc_del
          );

      -- Delay sm_add_ud to match erase_loc_del
      sm_add_ud_vec(0) <= sm_add_ud;
      sm_add_ud_del    <= sm_add_ud_del_vec(0);

      smd1 : big_delay
        generic map (
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          bus_width         => 1,
          clk_delay         => C_NUM_CHANNELS-1,  -- 1 delay accounted for in smd2
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int
          )
        port map (
          din  => sm_add_ud_vec,
          clk  => clk,
          ce   => int_ce,
          dout => sm_add_ud_del_vec
          );


      nbg3 : if extra_pipeline = 0 generate
      begin
        erase_loc_bmem <= erase_loc;
        sm_add_ud_bmem <= sm_add_ud;
      end generate;  -- nbg3

      -- Must delay all the inputs to this unit as lbm_we is now delayed
      -- by 1 clock cycle.
      nbg4 : if extra_pipeline /= 0 generate
      begin

        -- No need to reset because bshift_tmp only used after register has
        -- been loaded.
        elr1 : rs_reg
        generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>c_has_ce_int)
        port map (d=>erase_loc_del, clk=>clk, ce=>int_ce, q=>erase_loc_bmem);

        smd2 : rs_reg_bit
        generic map (c_has_ce=>c_has_ce_int)
        port map (d=>sm_add_ud_del, clk=>clk, ce=>int_ce, q=>sm_add_ud_bmem);

      end generate;  -- nbg4

    end generate;  -- opg2


    bmg2 : for i in symbol_width_minus_1 downto 0 generate
    begin

      bmux_o1(i) <= current_lambda_tmp(i) when delta = '1' else bshift_tmp(i);

      new_b(i) <= erase_loc_bmem(i) when sm_add_ud_bmem = '1' else bmux_o1(i);

    end generate;  -- bmg2


    -- If erasure decoding is enabled, lambda memory must be initialised
    -- with the coefficients of the erasure locator polynomial.
    nlg2 : for i in 0 to symbol_width_minus_1 generate
    begin

      -- Select (m1 XOR m2) (sm_add_ud = 0) or erase_loc (sm_add_ud = 1)
      new_lambda(i) <= erase_loc_del(i) when sm_add_ud_del = '1'
                       else (m1_out(i) xor m2_out(i));

    end generate;  -- nlg2

  end generate;  -- e2


  -- new_lambda_d = new_lambda delayed by 1 clock cycle
  nl1 : rs_reg
  generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>c_has_ce_int)
  port map (d=>new_lambda, clk=>clk, ce=>int_ce, q=>new_lambda_d);


  ------------------------------------------------------------------------------
  -- We have one block length (n cycles) to complete the BMA algorithm. Using
  -- the approach where the discrepency calculation and polynomial update for
  -- each BMA iteration are carried out sequentially can result in the BMA
  -- algorithm taking too many cycles to complete. Solutions to this include
  -- processing 2 polynomial coeffients at a time or overlapping the update of
  -- the polynomials for iteration x with the discrepency calculation for x+1.
  -- The latter choice has been used here.

  -- Polynomial update circuitry (gamma*lambda + disc*bshift)

  -- Part of polynomial update circuitry (gamma * lambda)
  -- Place this multiplier beside lambda mem as this is the critical path.

  -- Total delay through this multiplier is C_NUM_CHANNELS-1 clock cycles
  gfm1 : gfmul
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      c_num_channels    => C_NUM_CHANNELS,
      gfx               => gfx_mul,
      q_mode            => no_reg,
      extra_pipeline    => multi_channel_int  -- Split feedback loop
      )
    port map (
      reset       => '0',
      enable_pipe => int_ce,
      enable      => int_ce,
      clk         => clk,
      aa          => gamma,
      bb          => current_lambda,
      cc          => m1_out,
      cc_reg      => open
      );



  ------------------------------------------------------------------------------
  -- Part of polynomial update circuitry (disc * bshift)
  -- Position at this point in file so that placement directives place it in
  -- the correct place.
  -- Total delay through this multiplier is C_NUM_CHANNELS-1 clock cycles
  gfm2 : gfmul
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      C_NUM_CHANNELS    => C_NUM_CHANNELS,
      gfx               => gfx_mul,
      q_mode            => no_reg,
      extra_pipeline    => multi_channel_int  -- Split feedback loop
      )
    port map (
      reset       => '0',
      enable_pipe => int_ce,
      enable      => int_ce,
      clk         => clk,
      aa          => disc,
      bb          => bshift,
      cc          => m2_out,
      cc_reg      => open
      );



  ------------------------------------------------------------------------------
  -- Memories to hold lambda and B polynomials.
  -- lambda memory - position at his point in file to ensure correct place in
  -- lmrow vector container
  -- Optimised for area
  a_opt : if actual_optimisation = 0 generate
  begin
    l_mem : syncmem
      generic map (
        width             => C_SYMBOL_WIDTH,
        reqd_depth        => lb_mem_depth,
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int,
        c_has_we          => 1,
        q_mode            => reg_and_no_reg,
        debug_string      => "l_mem",
        c_elaboration_dir => C_ELABORATION_DIR,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_family          => C_FAMILY
        )
      port map (
        a     => lbm_add,
        d     => new_lambda,
        we    => lbm_we,
        c     => clk,
        ce    => int_ce,
        q     => current_lambda,
        q_reg => err_loc_tmp
        );

    -- B memory
    b_mem : syncmem
      generic map (
        width             => C_SYMBOL_WIDTH,
        reqd_depth        => lb_mem_depth,
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int,
        c_has_we          => 1,
        q_mode            => no_reg,
        debug_string      => "b_mem",
        c_elaboration_dir => C_ELABORATION_DIR,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_family          => C_FAMILY
        )
      port map (
        a     => lbm_add,
        d     => new_b,
        we    => lbm_we,
        c     => clk,
        ce    => int_ce,
        q     => current_b,
        q_reg => open
        );

    -- Note that with this version of the Berlekamp-Massey, we have a separate
    -- RAM to hold the calculated evaluator coefficients. It is possible to do
    -- without this memory, and reuse the B memory during the evaluator
    -- calculation, but it makes the input mux to the B memory even larger,
    -- and further reduces what litle regularity there is in the BM structure.

    -- Evaluator memory
    e_mem : syncmem
      generic map (
        width             => C_SYMBOL_WIDTH,
        reqd_depth        => lb_mem_depth,
        memstyle          => dist_mem,
        c_has_ce          => c_has_ce_int,
        c_has_we          => 1,
        q_mode            => reg,
        debug_string      => "e_mem",
        c_elaboration_dir => C_ELABORATION_DIR,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_family          => C_FAMILY
        )
      port map (
        a     => eval_add,
        d     => disc_add_out,
        we    => eval_we,
        c     => clk,
        ce    => int_ce,
        q     => open,
        q_reg => err_eval
        );

  end generate;  --a_opt


  ----------------------differences from v2 start here-------------------------
  -- Use bigger but faster dual port memory with 1 cycle delayed write to allow
  -- a registered feedback path
  -- Optimised for speed
  s_opt : if actual_optimisation /= 0 generate
    signal lbm_add_1_channel_del : polymem_add_1_channel_type := (others => '0');
    signal lbm_add_del           : polymem_add_type := (others => '0');
    signal lbm_we_del            : std_logic := '0';
    signal lbm_we_del_tmp        : std_logic := '0';
  begin
    -- Remember CE doesn't do anything in dist mem so we must gate WE
    l_mem : dp_syncmem
      generic map (
        width             => C_SYMBOL_WIDTH,
        reqd_depth        => lb_mem_depth,
        c_has_ce          => c_has_ce_int,
        c_has_we          => 1,
        debug_string      => "l_mem_dp",
        c_elaboration_dir => C_ELABORATION_DIR,
        c_family          => C_FAMILY
        )
      port map (
        rd_addr => lbm_add,
        wr_addr => lbm_add_del,
        d       => new_lambda_d,
        we      => lbm_we_del,
        clk     => clk,
        ce      => int_ce,
        q       => current_lambda,
        q_reg   => err_loc_tmp
        );

    -- B & E memory
    bo1 : if extra_pipeline = 0 generate
      b_mem : syncmem
        generic map (
          width             => C_SYMBOL_WIDTH,
          reqd_depth        => lb_mem_depth,
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int,
          c_has_we          => 1,
          q_mode            => no_reg,
          debug_string      => "b_mem",
          c_elaboration_dir => C_ELABORATION_DIR,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_family          => C_FAMILY
          )
        port map (
          a     => lbm_add,
          d     => new_b,
          we    => lbm_we,
          c     => clk,
          ce    => int_ce,
          q     => current_b,
          q_reg => open
          );

      e_mem : syncmem
        generic map (
          width             => C_SYMBOL_WIDTH,
          reqd_depth        => lb_mem_depth,
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int,
          c_has_we          => 1,
          q_mode            => reg,
          debug_string      => "e_mem",
          c_elaboration_dir => C_ELABORATION_DIR,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_family          => C_FAMILY
          )
        port map (
          a     => eval_add,
          d     => disc_add_out,
          we    => eval_we,
          c     => clk,
          ce    => int_ce,
          q     => open,
          q_reg => err_eval
          );
    end generate;  -- bo1

    bo2 : if extra_pipeline /= 0 generate
      signal eval_add_1_channel_del : polymem_add_1_channel_type := (others => '0');
      signal eval_add_del           : polymem_add_type := (others => '0');
      signal eval_we_del            : std_logic := '0';
      signal eval_we_del_tmp        : std_logic := '0';
    begin
      b_mem : dp_syncmem
        generic map (
          width             => C_SYMBOL_WIDTH,
          reqd_depth        => lb_mem_depth,
          c_has_ce          => c_has_ce_int,
          c_has_we          => 1,
          debug_string      => "b_mem_dp",
          c_elaboration_dir => C_ELABORATION_DIR,
          c_family          => C_FAMILY)
        port map (
          rd_addr => lbm_add,
          wr_addr => lbm_add_del,
          d       => new_b,
          we      => lbm_we_del,
          clk     => clk,
          ce      => int_ce,
          q       => current_b,
          q_reg   => open
          );

      e_mem : dp_syncmem
        generic map (
          width             => C_SYMBOL_WIDTH,
          reqd_depth        => lb_mem_depth,
          c_has_ce          => c_has_ce_int,
          c_has_we          => 1,
          debug_string      => "e_mem_dp",
          c_elaboration_dir => C_ELABORATION_DIR,
          c_family          => C_FAMILY
          )
        port map (
          rd_addr => eval_add,
          wr_addr => eval_add_del,
          d       => disc_add_out,
          we      => eval_we_del,
          clk     => clk,
          ce      => int_ce,
          q       => open,
          q_reg   => err_eval
          );

      -- Should actually be able to use lbm_add_del for this??
      eag1 : rs_reg
        generic map (
          c_width  => polymem_add_width_1_channel,
          c_has_ce => c_has_chan_ce
          )
        port map (
          d   => eval_add_1_channel,
          clk => clk,
          ce  => chan_ce,
          q   => eval_add_1_channel_del
          );

      -- Form delayed eval address bus
      sog1 : if not(multi_channel) generate
        eval_add_del <= eval_add_1_channel_del;
      end generate;  -- sog1

      -- Channel count forms msbs of memory address
      sog2 : if multi_channel generate
        sog3 : for i in 0 to polymem_add_width_1_channel-1 generate
          eval_add_del(i) <= eval_add_1_channel_del(i);
        end generate;  -- sog3
        sog4 : for i in 0 to chan_count_bits-1 generate
          eval_add_del(i+polymem_add_width_1_channel) <= chan_count(i);
        end generate;  -- sog4
      end generate;  -- sog2


      -- Delay the eval write enable to account for the delayed disc_add_out values
      ewg1 : rs_reg_bit
      generic map (c_has_ce=>c_has_chan_ce)
      port map (d=>eval_we, clk=>clk, ce=>chan_ce, q=>eval_we_del_tmp);

      -- Disable eval mem writes when ce low to help people using multi-cycle
      -- clock constraints.
      eval_we_del <= eval_we_del_tmp and int_ce;

    end generate;  -- bo2


    -- Delay the l_mem write address so I can use a registered feedback value
    dly : rs_reg
    generic map (c_width=>polymem_add_width_1_channel, c_has_ce=>c_has_chan_ce)
      port map (d=>lbm_add_1_channel, clk=>clk, ce=>chan_ce, q=>lbm_add_1_channel_del);

    -- Delay the lambda write enable to account for the delayed new_lambda
    -- values
    lweg0 : if C_HAS_ERASE = 0 generate
    begin
      dly1 : rs_reg_bit
      generic map (c_has_ce=>c_has_chan_ce)
      port map (d=>lbm_we, clk=>clk, ce=>chan_ce, q=>lbm_we_del_tmp);
    end generate;  -- lweg0

    -- In the case of erasures there is a separate lbm_we value for each channel
    -- as lbm_we is disabled if ec_lt_itcnt, therefore we need to store a
    -- separate value for each channel's lbm_we
    lweg1 : if C_HAS_ERASE /= 0 generate
      signal lbm_we_vec     : std_logic_vector(0 downto 0) := (others => '0');
      signal lbm_we_del_vec : std_logic_vector(0 downto 0) := (others => '0');
    begin

      lbm_we_vec(0) <= lbm_we;

      lwed : big_delay
        generic map (
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          bus_width         => 1,
          clk_delay         => C_NUM_CHANNELS,
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int
          )
        port map (
          din  => lbm_we_vec,
          clk  => clk,
          ce   => int_ce,
          dout => lbm_we_del_vec
          );

      lbm_we_del_tmp <= lbm_we_del_vec(0);

    end generate;  -- lweg1


    -- Cannot have 'lbm_we_del' active if 'int_ce' = '0' because 'new_lambda'
    -- may be changing
    lbm_we_del <= lbm_we_del_tmp and int_ce;



    ----------------------------------------------------------------------------
    -- Form delayed lbm address bus
    --
    sog5 : if not(multi_channel) generate
      lbm_add_del <= lbm_add_1_channel_del;
    end generate;  -- sog5

    -- Channel count forms msbs of memory address
    sog6 : if multi_channel generate
      sog7 : for i in 0 to polymem_add_width_1_channel-1 generate
        lbm_add_del(i) <= lbm_add_1_channel_del(i);
      end generate;  -- sog7
      sog8 : for i in 0 to chan_count_bits-1 generate
        lbm_add_del(i+polymem_add_width_1_channel) <= chan_count(i);
      end generate;  -- sog8
    end generate;  -- sog6


  end generate;  -- s_opt

  --------end of differences from v2-------------------------------------------



  ------------------------------------------------------------------------------
  -- Discrepency calculation circuitry (convolve "lambda" and "synd")
  -- Uses a multiply/add, with registered feedback from the adder output
  -- to one of the adder inputs. Note the reset signal to clear the accumulated
  -- value at the start of each new discrepency calculation.
  -- Includes discrepency value register.
  --
  gfma1 : gfmac
  generic map (
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    c_num_channels    => C_NUM_CHANNELS,
    gfx               => gfx_mac,
    extra_pipeline    => extra_pipeline
    )
  port map (
    reset   => '0',
    enable  => int_ce,
    enable2 => disc_en,
    clk     => clk,
    mac_sr  => disc_add_sr,
    aa      => syn_select,
    bb      => new_lambda_d,
    cc      => disc_add_out,
    cc_reg  => disc
    );



  ------------------------------------------------------------------------------
  -- Remaining output registers
  --

  -- pf is a 1-cycle high pulse that ultimately forms poly_flag
  --
  --
  pf <= ((current_state(7) and last_coeff) or current_state(9)) and chien_ready;


  -- pf_d is reset to 0 so that any "start_chien" pulses in the pipeline will
  -- not emerge after a sync reset.
  pfr1 : rs_reg_bit
  generic map (c_has_ce=>c_has_chan_ce, c_has_sclr=>C_HAS_SCLR)
  port map (d=>pf, sclr=>int_sclr, clk=>clk, ce=>chan_ce, q=>pf_d);


  -- Enable poly_flag_out with FAST int_ce as 1st coefficient will appear on
  -- output 1 FAST clock cycle after pf_d goes high.
  po1 : rs_reg_bit
  generic map (c_has_ce=>c_has_ce_int, c_has_sclr=>C_HAS_SCLR)
  port map (d=>pf_d, sclr=>int_sclr, clk=>clk, ce=>int_ce, q=>poly_flag_out);


  poly_flag <= poly_flag_out;


  scpg1 : if not(multi_channel) generate
    -- start_chien_p1 goes high 1 cycle before start_chien
    start_chien_p1_tmp <= pf_d;
  end generate;  --scpg1

  scpg2 : if multi_channel generate
    -- start_chien_p1 is a 1 FAST cycle pulse immediately prior to start_chien.
    -- It is used in the Chien unit to initialize the channel counter.
    -- Note a registered output could be provided here if necessary by
    -- ANDing chan_ce and pf and retiming with an int_ce enabled register.
    start_chien_p1_tmp <= pf_d and not(poly_flag_out);
  end generate;  --scpg2

  -- start_chien_p2 goes high 2 cycles before start_chien
  start_chien_p2_tmp <= pf;

  start_chien_p1 <= start_chien_p1_tmp;  -- Primary output
  start_chien_p2 <= start_chien_p2_tmp;  -- Primary output


  ------------------------------------------------------------------------------
  -- Retime loc_deg

  lg1 : if not(multi_channel) generate

    -- Enable signal for loc_deg register must be ANDed with global enable if
    -- there is one
    loc_deg_en <= poly_flag_out and int_ce;

  end generate;  -- lg1

  -- Cannot latch a single loc_deg value if multi-channel as each channel
  -- will have its own value. All these separate values must be stored in
  -- a rotating shift register. This needs to go in the Chien unit as the
  -- Chien channel counter is different to the BMA channel counter.
  -- Delay sr_length by 1 clock cycle so first channel loc_deg_out appears
  -- as poly_flag goes high.
  lg2 : if multi_channel generate
    loc_deg_en <= int_ce;
  end generate;  -- lg2

  locdr : rs_reg
  generic map (c_width=>it_count_width, c_has_ce=>1)
  port map (d=>sr_length, clk=>clk, ce=>loc_deg_en, q=>loc_deg_out);


  loc_deg <= loc_deg_out;




  ------------------------------------------------------------------------------
  nig1 : if C_HAS_N_IN /= 0 generate
  begin

    -- Latch n_in value as first value coefficient is shifted in.
    -- It is possible for a load pulse to occur simultaneously with "poly_flag"
    -- in the Chien unit so this is the earliest this value can be safely
    -- latched. If "pf_d" was used to generate the ce signal then this n_out
    -- would change before the Chien n_out register had saved it for the Forney
    -- unit.
    --
    -- Holds the n_in value corresponding to the coefficients in the Chien unit shift register.
    nir1 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>1)
    port map (d=>n_in, clk=>clk, ce=>loc_deg_en, q=>n_out);

  end generate;  -- nig1

  nig1a : if C_HAS_N_IN = 0 generate
  begin
    n_out <= n_in;
  end generate;  -- nig1a





  ------------------------------------------------------------------------------
  rig1 : if C_HAS_R_IN /= 0 generate
    signal r_out_ce : std_logic := '0';
  begin

    -- Latch r_in value
    --
    -- Must latch 2 cycles before Chien start pulse so that r_in to Chien
    -- unit is ready in time for Chien dly_cnt and disable_ccell logic.
    r_out_ce <= start_chien_p2_tmp and int_ce;

    -- Holds the r_in value corresponding to the coefficients in the Chien unit
    -- shift register.
    rir1 : rs_reg
    generic map (c_width=>C_R_WIDTH, c_has_ce=>1)
    port map (d=>r_in, clk=>clk, ce=>r_out_ce, q=>r_out);

  end generate;  -- rig1


  rig1a : if C_HAS_R_IN = 0 generate
    r_out <= r_in;
  end generate;  -- rig1a








  ------------------------------------------------------------------------------
  -- BMA control state machine.
  -- Behavioural Description

  -- sm_logic : PROCESS (current_state, keep_start_high, sm_add_tc, it_cnt_tc,
  --                     sma_is_1, lbm_add_tc, last_coeff, itc_is_0)
  -- BEGIN

  -- CASE current_state IS

  -- WHEN idle =>

  -- Jump to the memory initialisation state when the keep_start_high
  -- flag goes to 1.

  -- IF keep_start_high='1' THEN next_state <= init_mem;
  -- ELSE next_state <= current_state;
  -- END IF;


  -- WHEN init_mem =>

  -- Write the syndromes and initialise the lambda and B memories

  --  IF sm_add_tc='1' THEN next_state <= update_poly;
  -- ELSE next_state <= current_state;
  --  END IF;


  -- WHEN update_disc =>

  -- Due to the feedback register between new_lambda and the discrepency
  -- circuitry, there is a one cycle delay between getting the first
  -- new_lambda coefficient and starting the next discrepency calculation.
  --
  -- new_lambda(0)  XXXX             state update_poly
  -- new_lambda(1)  NEW_disc(0)      state update_poly_disc
  -- new_lambda(2)  NEW_disc(1)      state update_poly_disc
  --
  -- new_lambda(t)  NEW_disc(t-1)    state update_poly_disc
  -- XXXX           NEW_disc(t)      state update_disc

  -- The three different states mark when the discrepency, the polynomials
  -- or both are being updated

  -- update_disc lasts only one cycle, then jumps to update_poly for the
  -- next BMA iteration, or else to the first evaluator calculation
  -- state if the r iterations are complete

  -- IF it_cnt_tc='1' THEN next_state <= req_lambda_eval;
  -- ELSE next_state <= update_poly;
  -- END IF;



  -- WHEN update_poly =>

  -- When the iteration count is first zero, the update_poly state is
  -- entered just to read the very first lambda(0), which is stored
  -- in the new_lambda_d register. When we then jump to update_disc
  -- for the first time, the correct value for the first discrepency
  -- is formed (S(0)*lambda(0)).

  -- In subsequent iterations, the update_poly state lasts one cycle and
  -- jumps to update_poly_disc, as explained above.

  -- IF itc_is_0='1' THEN next_state <= update_disc;
  -- ELSE next_state <= update_poly_disc;
  -- END if;



  -- WHEN update_poly_disc =>
  --  IF sma_is_1='1' OR lbm_add_tc='1' THEN next_state <= update_disc;
  -- ELSE next_state <= current_state;
  --  END IF;


  -- WHEN req_lambda_eval =>

  -- since the evaluator coeffients are formed by a similar convolution
  -- between SYN and lambda as is used in the discrepency calculation,
  -- the new_lambda_d register causes a similar one cycle offset between
  -- reading a lambda coefficient and using it in the discrepency
  -- calculation. req_lambda_eval provides a 1-cycle state that reads the
  -- first lambda coefficient, before jumping to update_disc_eval
  -- (equivalent to update_poly_disc before) or direct to
  -- update_disc_eval_last (equivalent to update_disc) if this is the
  -- first evaluator coefficient calculation.

  --  IF itc_is_0='1' THEN next_state <= update_disc_eval_last;
  -- ELSE next_state <= update_disc_eval;
  --  END IF;



  -- WHEN update_disc_eval =>

  -- continue to accumulate evaluator value and read lambda.
  -- Leave when the syndrome address is 1 (next cycle is last
  -- in convolution)

  --  IF sma_is_1 = '1' THEN next_state <= update_disc_eval_last;
  -- ELSE next_state <= current_state;
  --  END if;


  -- WHEN update_disc_eval_last =>

  -- 1-cycle state. Jump back to req_lambda_eval to begin the calculation
  -- of the next evaluator coefficient, or to the read_poly state if this
  -- is the last evaluator coefficient.

  --  IF last_coeff='1' THEN next_state <= read_poly;
  -- ELSE next_state <= req_lambda_eval;
  --  END IF;


  -- WHEN OTHERS =>

  -- Read out lambda and B memories (note that B has now been overwritten
  -- by the evalutor). Start at address 0 and work up to 8, then return
  -- to idle. Note that, because of the new_lambda_d register and the
  -- use of the update_disc_eval_last state, the evaluator coefficients
  -- are stored in address location one higher than their significance
  -- would suggest ie locations 1 to 8, rather than 0 to 7. This can be
  -- compensated for in the Chien BLOCK, and it is probably more efficient
  -- to do this that further complicate the BMA circuitry to get the
  -- evaluator into locations 0 to 7.

  --  IF lbm_add_tc='1' THEN next_state <= idle;
  -- ELSE next_state <= current_state;
  --  END if;


  -- END CASE;

  -- END PROCESS sm_LOGIC;







  ------------------------------------------------------------------------------
  -- One-hot state machine to control BMA
  --
  smp1 : process (clk)
  begin

    if rising_edge(clk) then

      if (int_sclr = '1') then
        -- If there is a sync reset then state bit 0 has to be forced high
        current_state(0) <= '1';
        current_state(1) <= '0';
        current_state(2) <= '0';
        current_state(3) <= '0';
        current_state(4) <= '0';
        current_state(5) <= '0';
        current_state(6) <= '0';
        current_state(7) <= '0';
        current_state(8) <= '0';
        current_state(9) <= '0';

      -- Clock Enable
      elsif (chan_ce = '1') then

        -- State bit 0 (idle)
        -- Use "keep_start_high" rather than "start" for FSM to prevent
        -- unexpected exit from state 0 on the first clock cycle if
        -- chan_count_tc happens to be asserted during that clock cycle before
        -- it has been reset by start_bma.
        current_state(0) <= ((lbm_add_tc and current_state(8)) or
                             (not(keep_start_high) and current_state(0)));

        -- State bit 1 (init_mem) - ignore first row of FEC coverage table, since state(0) never '0' entering state(1)
        -- coverage off -item e 1 -fecexprrow 1
        current_state(1) <= (current_state(0) and keep_start_high) or
                            (current_state(1) and not(state_add_tc));

        -- State bit 2 (update_disc)
        current_state(2) <= (current_state(3) and itc_is_0) or
                            (current_state(4) and (sma_is_1 or lbm_add_tc));

        -- State bit 3 (update_poly)
        current_state(3) <= (current_state(1) and state_add_tc) or
                            (current_state(2) and not(it_cnt_tc));

        -- State bit 4 (update_poly_disc)
        current_state(4) <= (current_state(3) and not(itc_is_0)) or
                            (current_state(4) and not(sma_is_1 or lbm_add_tc));

        -- State bit 5 (req_lambda_eval)
        current_state(5) <= (current_state(2) and it_cnt_tc) or
                            (current_state(7) and not(last_coeff));

        -- State bit 6 (update_disc_eval)
        current_state(6) <= (current_state(5) and not(itc_is_0)) or
                            (current_state(6) and not(sma_is_1));

        -- State bit 7 (update_disc_eval_last)
        current_state(7) <= (current_state(5) and itc_is_0) or
                            (current_state(6) and sma_is_1);

        -- State bit 8 (read_poly)
        -- The FSM moves to state 8 when pf goes high.
        current_state(8) <= pf or (current_state(8) and not(lbm_add_tc));

        -- State bit 9 (wait_for_chien)
        -- The FSM goes to state 9 and waits there if the Chien unit isn't ready to receive
        -- the polynomial coefficients.
        current_state(9) <= (current_state(7) and last_coeff and not(chien_ready)) or
                            (current_state(9) and not(chien_ready));

      end if;  -- int_sclr

    end if;  -- clk

  end process;






  -- Generate add_tc bit for current_state(1) and (3) logic
  s1n_e : if C_HAS_ERASE = 0 generate
    state_add_tc <= sm_add_tc;
  end generate;  -- s1n_e

  s1e : if C_HAS_ERASE /= 0 generate
    state_add_tc <= lbm_add_tc;
  end generate;  -- s1e


  --
  -- End of FSM
  ------------------------------------------------------------------------------









  ------------------------------------------------------------------------------
  -- BMA Control Signals. Combine state bits and other inputs.


  -- Syndrome address counter load signal
  sm_add_ld <= current_state(3) or current_state(5);





  -- Syndrome address counter synchronous reset signal
  -- Make sure it is asserted in read_poly state as idle state may only
  -- last 1 cycle. In this case the counter would not be reset. The
  -- counter output is not required in the read_poly state so we can
  -- safely reset the counter here so it will be ready if the idle
  -- state is only 1 cycle duration.
  sm_add_sr <= (current_state(0) and not(start)) or current_state(7) or current_state(8);




  -- Syndrome address counter up/down signal
  sm_add_ud <= current_state(0) or current_state(1);





  -- Syndrome memory write enable
  n_e3 : if C_HAS_ERASE = 0 generate
    sm_we <= int_ce and ((current_state(0) and start) or current_state(1));
  end generate;  -- n_e3

  e3 : if C_HAS_ERASE /= 0 generate
    signal sm_we_tmp : std_logic;
  begin
    sm_we <= int_ce and ((current_state(0) and start) or (current_state(1) and not(lbm_add_tc)));
  end generate;  -- e3








  -- Common lambda and B memory address counter synchronous reset
  --
  lbmasr : block
    signal lbmasr_o1            : std_logic := '0';
  begin

    -- It is important that sm_add_tc goes to second LUT as this can be on the
    -- critical path
    lbmasr_o1 <= (current_state(0) and not(start)) or
                 current_state(7) or
                 current_state(9);



    n_e : if C_HAS_ERASE = 0 generate

      vg7 : if C_HAS_R_IN = 0 generate
      begin

        lbm_add_sr <= lbmasr_o1 or
                      (current_state(1) and sm_add_tc) or
                      current_state(2);

      end generate;  -- vg7


      -- If r is variable then lbm counter doesn't automatically roll-over and
      -- lbm_add_sr must be forced high when lbm_add_tc=1
      vg7a : if C_HAS_R_IN /= 0 generate
        signal lbmasr_o2            : std_logic := '0';
      begin

        lbmasr_o2 <= current_state(2) or lbmasr_o1;

        lbm_add_sr <= lbmasr_o2 or
                      lbm_add_tc or     -- Force sr on terminal count
                      (current_state(1) and sm_add_tc);

      end generate;  -- vg7a

    end generate;  -- n_e


    e : if C_HAS_ERASE /= 0 generate

      lbm_add_sr <= lbmasr_o1 or current_state(2) or lbm_add_tc;

    end generate;  -- e

  end block lbmasr;








  -- Common lambda and B memory write enable
  --
  n_e4 : if C_HAS_ERASE = 0 generate
    signal sma_lte_t, lbm_we_tmp : std_logic := '0';
  begin

    -- Check when the syndrome address count is <= t, so that lambda and B
    -- memory initialization can cease once t+1 locations have been written
    -- to. The syndrome initialisation will obviously continue for r
    -- locations.  sma_lte_t <= '1' when sm_add<=t else '0';
    vr8 : if C_HAS_R_IN = 0 generate
      cmp5 : comp_lt
        generic map (
          c_family => C_FAMILY,
          width    => sm_add_width_1_channel,
          comp_val => t_plus_1
          )
        port map (
          i => sm_add_1_channel,
          o => sma_lte_t
          );
    end generate;  --vr8a


    -- Generate variable version
    vr8a : if C_HAS_R_IN /= 0 generate
      signal comp_val : sm_add_1_channel_type := (others => '0');
    begin

      comp_val(t_width-1 downto 0) <= var_t;  -- r_in/2

      vr8b : if sm_add_width_1_channel > t_width generate
        -- r_in/2 padded with 0's
        comp_val(sm_add_width_1_channel-1 downto t_width) <= (others => '0');
      end generate;  -- vr8b


      -- Use mode pin to generate a less than or equal to comparator
      -- i.e. lte(t) is the same as lt(t+1)
      -- This saves generation of var_t_plus_1 (use var_t instead)
--       cmp6 : comp_lt_var
--         generic map (
--           c_family => C_FAMILY,
--           width    => sm_add_width_1_channel,
--           mode     => 1,
--           c_has_en => 0
--           )
--         port map (
--           a  => sm_add_1_channel,
--           b  => comp_val,               -- = t
--           en => '1',
--           o  => sma_lte_t
--           );

      sma_lte_t <= '1' when (unsigned(sm_add_1_channel) <= unsigned(comp_val)) else '0';

    end generate;  --vr8a



    lbm_we_tmp <= (current_state(0) and start) or
                  (current_state(1) and sma_lte_t) or
                  (current_state(3) and not(itc_is_0)) or
                  current_state(4);

    -- Cannot have 'lbm_we' active if 'int_ce' = '0' because 'new_lambda'
    -- may be changing
    -- Don't need this LUT if o/ptimised for speed because lbm_we is gated
    -- with ce after register delay.
    y_ce7 : if C_HAS_CE and (actual_optimisation = 0 or extra_pipeline = 0) generate

      lbm_we <= lbm_we_tmp and int_ce;

    end generate;  -- y_ce7

    n_ce7 : if not(C_HAS_CE) or (actual_optimisation /= 0 and extra_pipeline /= 0) generate
      lbm_we <= lbm_we_tmp;
    end generate;  -- n_ce7

  end generate;  -- n_e4


  e4 : if C_HAS_ERASE /= 0 generate

    -- Cannot have 'lbm_we' active if 'int_ce' = '0' because 'new_lambda'
    -- may be changing
    lbm_we <= int_ce and
              ((current_state(0) and start) or
               current_state(1) or
               ((current_state(3) or current_state(4)) and ec_lt_itcnt));

  end generate;  -- e4











  -- Evaluator memory address counter synchronous reset
  eval_add_sr <= (current_state(2) and it_cnt_tc) or
                 current_state(7) or
                 current_state(9);





  ------------------------------------------------------------------------------
  -- Evaluator memory write enable
  --

  -- Disable eval mem writes when ce low to help people using multi-cycle
  -- clock constraints.
  ev_ceg1 : if C_HAS_CE and (actual_optimisation = 0 or extra_pipeline = 0) generate
    eval_we <= current_state(7) and int_ce;
  end generate;  -- ev_ceg1

  ev_ceg2 : if not(C_HAS_CE) or
              (actual_optimisation /= 0 and extra_pipeline /= 0) generate
    eval_we <= current_state(7);
  end generate;  -- ev_ceg2



  -- Berlekamp-Massey iteration counter enable
  it_cnt_en <= (current_state(0) or current_state(2) or current_state(7)) and
               chan_ce;                 -- Includes int_ce



  -- Iteration counter synchronous reset
  --
  vr4 : if C_HAS_R_IN = 0 generate
    -- Note that the iteration counter is automatically reset if it reaches r
    -- if C_HAS_R_IN=0
    it_cnt_sr <= current_state(0) or (current_state(7) and last_coeff);

  end generate;  -- vr4


  vr4a : if C_HAS_R_IN /= 0 generate
    -- Counter roll-over implemented externally if C_HAS_R_IN, therefore
    -- need to also activate it_cnt_sr if counter terminal count (r) reached.
    it_cnt_sr <= current_state(0) or (current_state(7) and last_coeff) or
                 it_cnt_tc;

  end generate;  -- vr4a


  -- Synchronous reset for the register to shift the B polynomial
  -- coefficients up one place of significance.
  bssr : block
  begin

    n_e : if C_HAS_ERASE = 0 generate
      bshift_sr <= current_state(1) or current_state(2) or
                   current_state(5) or current_state(6) or current_state(7);

    end generate;  -- n_e

    e : if C_HAS_ERASE /= 0 generate

      -- Force bshift low initially to prevent initial values of 'disc'
      -- affecting 'new_lambda_d' calculation
      bshift_sr <= current_state(1) or current_state(2) or
                   current_state(5) or current_state(6) or current_state(7) or
                   not(ec_lt_itcnt);

    end generate;  -- e

  end block bssr;

  -- Enable for the register that holds the calculated discrepency values
  --
  disc_en <= int_ce and disc_en_tmp;

  -- Synchronous reset for the register that holds the discrepency value.
  --
  disc_add_sr_tmp <= current_state(0) or current_state(3) or current_state(5);


  -- Enable for the register that holds the scalar gamma (used to remove
  -- Finite Field inverter from the algorithm)
  --
  geg1 : if C_HAS_ERASE = 0 generate

    gamma_en <= int_ce and
                (current_state(0) or (current_state(2) and not(itc_is_0)));

  end generate;  -- geg1

  geg2 : if C_HAS_ERASE /= 0 generate

    gamma_en <= int_ce and
                (current_state(0) or (current_state(2) and ec_lt_itcnt));

  end generate;  -- geg2


  -- Synchronous reset for the gamma register
  --
  gamma_sr <= current_state(0) or (current_state(2) and it_cnt_tc);



  -- Enable for the register that holds the shift register length (i.e. the
  -- degree of the current locator polynomial).
  --
  -- sr_length_en is gated with CE inside sr_length unit if necessary.
  srl1 : if C_HAS_ERASE = 0 generate

    sr_length_en <= current_state(0) or (current_state(2) and not(itc_is_0));

  end generate;  -- srl1

  srl2 : if C_HAS_ERASE /= 0 generate

    sr_length_en <= current_state(0) or
                    (current_state(1) and lbm_add_tc) or
                    (current_state(2) and ec_lt_itcnt);

  end generate;  -- srl2


  -- Synchronous reset for the shift register length
  --
  sr_length_sr <= current_state(0);




  ------------------------------------------------------------------------------
  -- Register to hold number of erasures
  --
  erg : if C_HAS_ERASE /= 0 generate
  begin

    rg1 : if not(multi_channel) generate
      signal erase_reg_en : std_logic := '0';
    begin

      erase_reg_en <= int_ce and current_state(0) and start;

      erg1 : rs_reg
      generic map (c_width=>erase_cnt_width, c_has_ce=>1)
      port map (d=>erase_cnt, clk=>clk, ce=>erase_reg_en, q=>erase_cnt_reg);

    end generate;  -- rg1

    -- For multi-channel case we need a register to store erase count value
    -- for each channel and to cycle through them every clock cycle.
    rg2 : if multi_channel generate
      signal erase_cnt_mux_reg   : erase_cnt_type;
      signal erase_cnt_mux_reg_d : erase_cnt_type;
    begin

      erase_cnt_mux_reg_d <= erase_cnt when (current_state(0) and start) = '1'
                             else erase_cnt_reg;


      -- Reg is loaded from Syndrome unit when "start" AND "current_state(0)"
      eclr : rs_reg
        generic map (
          c_width  => erase_cnt_width,
          c_has_ce => c_has_ce_int
          )
        port map (
          d   => erase_cnt_mux_reg_d,
          clk => clk,
          ce  => int_ce,
          q   => erase_cnt_mux_reg
          );


      ecd1 : big_delay
        generic map (
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          bus_width         => erase_cnt_width,
          clk_delay         => C_NUM_CHANNELS-1,  -- 1 delay accounted for in eclr reg
          memstyle          => dist_mem,
          c_has_ce          => c_has_ce_int
          )
        port map (
          din  => erase_cnt_mux_reg,
          clk  => clk,
          ce   => int_ce,
          dout => erase_cnt_reg
          );

    end generate;  -- rg2


    -- Final output register to output erase count to Chien unit
    --
    -- Cannot latch a single erase_cnt value if multi-channel as each channel
    -- will have its own value. All these separate values must be stored in
    -- a rotating shift register. This needs to go in the Chien unit as the
    -- Chien channel counter is different to the BMA channel counter.
    -- Delay erase_cnt_reg by 1 clock cycle so first channel erase_cnt_out
    -- appears as poly_flag goes high.
    ero : rs_reg
    generic map (c_width=>erase_cnt_width, c_has_ce=>1)
    port map (d=>erase_cnt_reg, clk=>clk, ce=>loc_deg_en, q=>erase_cnt_out);

  end generate;  -- erg


  n_erg : if C_HAS_ERASE = 0 generate
    erase_cnt_reg <= (others => '0'); -- Not used
    erase_cnt_out <= erase_cnt_reg;
  end generate;  -- n_erg


  ------------------------------------------------------------------------------
  --
  -- Multi-channel
  --
  mcg1 : if not(multi_channel) generate
    chan_ce         <= int_ce;
    keep_start_high <= start_bma;
    start           <= start_bma;
  end generate;  -- mcg1

  mcg2 : if multi_channel generate

    signal chan_count_clr    : std_logic := '0';
    signal chan_count_tc     : std_logic := '0';  -- terminal count
    signal keep_start_high_d : std_logic := '0';

  begin

    ----------------------------------------------------------------------------
    -- Generate 'start'. For single channel this is just the start_bma pulse
    -- but in the multi-channel case it has to remain high for C_NUM_CHANNEL
    -- cycles in order to load 1st syndrome value for all channels. Syndrome
    -- unit channel counter operates on slow_ce so it cannot be used to
    -- stretch start_bma pulse.

    -- SR flip-flop set by start_bma and reset by chan_count_tc. S overrides R.
    keep_start_high_d <= start_bma or (keep_start_high and not(chan_count_tc));

    kshr : rs_reg_bit
    generic map (c_has_ce=>c_has_ce_int, c_has_sclr=>C_HAS_SCLR)
    port map (d=>keep_start_high_d, clk=>clk, ce=>int_ce, sclr=>int_sclr, q=>keep_start_high);


    start <= start_bma or keep_start_high;



    ----------------------------------------------------------------------------
    -- Instantiate channel counter
    --
    -- Channel counter keeps track of which channel the current symbol belongs
    -- to. It must be initialized to 0 by start_bma_p1 because it needs to
    -- be at 0 coincident with start_bma. The 1st write to syndrome RAM occurs
    -- on the very first clock cycle when start_bma = '1'.

    -- 2 channels is a special case as counter can be simplified
    mcg3 : if C_NUM_CHANNELS <= 2 generate
      signal chan_count0   : std_logic := '0';
      signal chan_count0_d : std_logic := '0';
    begin

      chan_count_clr <= start_bma_p1;

      chan_count0_d <= not(chan_count0) and not(chan_count_clr);

      -- No need to reset with sclr because register will be reset when a new block starts
      ccr1 : rs_reg_bit
      generic map (c_has_ce=>c_has_ce_int)
      port map (d=>chan_count0_d, clk=>clk, ce=>int_ce, q=>chan_count0);



      -- If there are only two channels just use chan_count as chan_count_tc.
      -- It is already registered.
      chan_count_tc <= chan_count0;
      chan_count(0) <= chan_count0;

    end generate;  -- mcg3

    mcg4 : if C_NUM_CHANNELS > 2 generate
      constant pwr_of_2_channels : boolean := is_power_of_two(C_NUM_CHANNELS);
    begin

      -- Don't need to clear with terminal count as counter will just
      -- roll over.
      mcg4a : if pwr_of_2_channels generate
        chan_count_clr <= start_bma_p1;
      end generate;  -- mcg4a

      mcg4b : if not(pwr_of_2_channels) generate
        -- Channel counter must start counting 0,1,... as soon as start_bma
        -- pulse occurs.
        chan_count_clr <= start_bma_p1 or chan_count_tc;

      end generate;  -- mcg4b


      -- Instantiate Channel Counter
      cc1 : cntre_a
        generic map(
          width         => chan_count_width,
          use_count_to  => false,
          count_to      => C_NUM_CHANNELS - 1,
          sync_reset_to => 0,
          c_family      => C_FAMILY
          )
        port map(
          r   => chan_count_clr,
          ce  => int_ce,
          c   => clk,
          cnt => chan_count,
          tc  => open
          );                            -- TC handled externally


      -- Look for C_NUM_CHANNELS-2 so we can register comparator output
      cmp1 : comp_eq
        generic map (
          c_family      => C_FAMILY,
          width         => chan_count_width,
          comp_val      => C_NUM_CHANNELS-2,
          c_has_sclr    => 1,
          q_mode        => reg,
          c_sync_enable => c_no_override -- Not cleared by int_sclr
          )
        port map (
          i     => chan_count,
          c     => clk,
          ce    => int_ce,
          sclr  => start_bma_p1,
          reset => '0',
          o     => open,
          o_reg => chan_count_tc
          );

    end generate;  -- mcg4



    -- Enable registers when channel counter reaches its terminal count
    chan_ce <= int_ce and chan_count_tc;


  end generate;  -- mcg2



  -- For the ultra-paranoid, optional logic to detect if the state machine has
  -- entered an illegal state. This has actually happened with some customers
  -- as they switch clocks, causing glitches and they expect the core to
  -- recover.
  --
  -- We cannot test this with the regular testbench in the automation, so this
  -- code will never be hit in code coverage.  Ignore them for expression coverage.
  --
  -- coverage off e
  pg1 : if C_SELF_RECOVERING /= 0 generate
    signal any_state0123 : std_logic := '0';
    signal any_state4567 : std_logic := '0';
    signal ill_state0123 : std_logic := '0';
    signal ill_state4567 : std_logic := '0';
    signal ill_state89   : std_logic := '0';

  begin

    -- any_state0123 will be high if any one of states 0, 1, 2 or 3 is high,
    -- assuming only one of them is high. If more than one is high then
    -- ill_state0123 will detect that.
    any_state0123 <= ((current_state(0) xor current_state(1)) xor
                      current_state(2)) xor current_state(3);

    any_state4567 <= ((current_state(4) xor current_state(5)) xor
                      current_state(6)) xor current_state(7);

    -- Illegal if both (S0 and S1) or either one of S0 or S1, AND S2, etc
    ill_state0123 <= (current_state(0) and current_state(1)) or
                     ((current_state(0) xor current_state(1)) and
                      current_state(2)) or
                     (((current_state(0) xor current_state(1)) xor current_state(2)) and
                      current_state(3));

    ill_state4567 <= (current_state(4) and current_state(5)) or
                     ((current_state(4) xor current_state(5)) and
                      current_state(6)) or
                     (((current_state(4) xor current_state(5)) xor current_state(6)) and
                      current_state(7));

    -- Detect if in state 8 or 9 illegally or in both 0123 and 4567 or if in no
    -- state at all
    ill_state89 <= (any_state0123 and any_state4567) or
                   ((any_state0123 or any_state4567) and current_state(8)) or
                   ((any_state0123 or any_state4567) and current_state(9)) or
                   (current_state(8) and current_state(9)) or
                   (not(any_state0123 or any_state4567 or
                        current_state(8) or current_state(9)));


    -- Register output to reduce combinatorial delay on output. This signal will
    -- be used to reset the core.
    bma_dead <= ill_state0123 or ill_state4567 or ill_state89;

  end generate;  -- pg1
  -- coverage on


  -- Do not attempt to detect illegal states. This results in a smaller core.
  pg2 : if C_SELF_RECOVERING = 0 generate
    bma_dead <= '0';
  end generate;  -- pg2

end synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/ecell.vhd,v 1.2 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : ecell
-- Function : Building block for RS Decoder Erasure Unit
--            This component calculates the value of a single erasure polynomial
--            coefficient. The coefficient register is updated every time there
--            is an erasure.
--
--            If there is an erasure at location i, then the entire erasure
--            polynomial must be multiplied by (1 + alpha^i * x)
--
--            A PISO is also implemented so that the erasure polynomial
--            coefficients can be shifted out one at a time after the block has
--            been sampled.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY ecell IS
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    ecell_type        : INTEGER;
    gfx_mul           : gfx_record_type;
    init_val          : STD_LOGIC_VECTOR;
    symbol_width      : INTEGER;
    c_has_ce          : INTEGER;
    c_has_slow_ce     : INTEGER;
    c_has_n_in        : INTEGER;
    c_num_channels    : INTEGER;
    c_enable_rlocs    : INTEGER
  );
  PORT (
    ce           : IN  STD_LOGIC;
    cin          : IN  STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0) := (OTHERS=>'0');
    clk          : IN  STD_LOGIC;
    eloc_in      : IN  STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0);
    erase        : IN  STD_LOGIC;
    load         : IN  STD_LOGIC;
    prev_stage   : IN  STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    er_en        : IN  STD_LOGIC;
    slow_ce      : IN  STD_LOGIC;
    sr           : IN  STD_LOGIC;
    cout         : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    mult_out     : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0)
    );
END ecell;

--------------------------------------------------------------------------------
-- ecell_type : 1 => cell for coeff(1) - more complicated reg init logic
--              2 => cell for coeff(2..r-1)
--              3 => cell for coeff(r) - no multiplier
-- er_en      : ce for coefficient reg in single channel case. Mux select in
--              multi-channel case.
-- slow_ce    : Only used in multi-channel case.
-- eloc_in    : Current value of the erasure locator coefficient
-- prev_stage : Multiplication result from previous stage
-- cin        : Erasure polynomial coefficient from PISO of previous stage
-- cout       : Erasure polynomial coefficient from PISO of this stage
-- mult_out   : Multiplication result from this stage

--------------------------------------------------------------------------------
ARCHITECTURE synth OF ecell IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT userpm : BOOLEAN := (c_enable_rlocs /=0);

  CONSTANT multi_channel : BOOLEAN := (c_num_channels > 1);


  -- multiplier is registered in multi-channel mode
  CONSTANT mult_mode : INTEGER := select_val_b(no_reg, reg, multi_channel);

  CONSTANT symbol_width_minus_1 : INTEGER := symbol_width-1;
  CONSTANT height               : INTEGER := (symbol_width+1)/2;

  SUBTYPE symbol_type IS STD_LOGIC_VECTOR(symbol_width_minus_1 DOWNTO 0);

  SIGNAL cout_tmp     : symbol_type;
  SIGNAL mult_in      : symbol_type;
  SIGNAL mux_reg_out  : symbol_type;
  SIGNAL mux_reg_d_in : symbol_type;

--------------------------------------------------------------------------------
BEGIN

  --
  -- Instantiate the variable Galois Field multiplier
  --
  -- In multi-channel case o/p is registered. This gives a total of
  -- 1 (mux o/p reg) + 1 (mult o/p reg) = 2 delay stages. If num channels > 2
  -- then we can add a further pipeline reg in the middle of the multiplier.
  -- If c_num_channels > 3 then the extra delays are inserted with an SRL16
  -- after the mux o/p reg.
  mg : IF (ecell_type < 3) GENERATE
  BEGIN
    gfm : gfmul
    GENERIC MAP (
      c_family          => c_family,
      c_xdevicefamily   => c_xdevicefamily,
      c_elaboration_dir => c_elaboration_dir,
      gfx               => gfx_mul,
      q_mode            => mult_mode, -- combinatorial for single chan
      extra_pipeline    => bool_to_int(c_num_channels>2)
      )
    PORT MAP (
      reset       => '0',
      enable_pipe => slow_ce,
      enable      => slow_ce,
      clk         => clk,
      aa          => mult_in,
      bb          => eloc_in,
      cc          => mult_out, -- registered in multi-channel case
      cc_reg      => OPEN);
  END GENERATE; -- mg


  n_mg : IF (ecell_type = 3) GENERATE
    m : FOR bit IN 0 TO symbol_width_minus_1 GENERATE
      mult_out(bit) <= '0';
    END GENERATE; -- m
  END GENERATE; -- n_mg


  ------------------------------------------------------------------------------
  --
  -- Instantiate Galois Field Adder
  -- Note that registers are only enabled at slow clock rate
  --
  mcg1 : IF NOT(multi_channel) GENERATE

    mult_in <= mux_reg_out;

    -- Coefficient 1 register is loaded with alpha^(h(n-1)) or 0 at the
    -- start of a new block, depending on whether the first symbol is
    -- erased or not, respectively.
    ec1 : IF (ecell_type = 1) GENERATE

      -- For fixed N we have a fixed initialization value
      nig0 : IF c_has_n_in = 0 GENERATE

        lg1 : FOR i IN 0 TO symbol_width_minus_1 GENERATE

          z : IF (init_val(i) = '0') GENERATE
          BEGIN

            mux_reg_d_in(i) <= (prev_stage(i) XOR mux_reg_out(i)) AND NOT(sr);

            l0 : rs_reg_bit
            GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
            PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>er_en, aclr=>'0',
                     q=>mux_reg_out(i));

          END GENERATE; -- z

          g1 : IF (init_val(i) = '1') GENERATE
          BEGIN

            mux_reg_d_in(i) <=
              ((NOT(NOT(erase) AND sr)) AND (prev_stage(i) XOR mux_reg_out(i)))
              OR (erase AND sr);

            l1 : rs_reg_bit
            GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
            PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>er_en, aclr=>'0',
                     q=>mux_reg_out(i));

          END GENERATE; -- g1

        END GENERATE; -- lg1

      END GENERATE; -- nig0



      -- For variable N the initialization value comes from a ROM
      nig1 : IF c_has_n_in /= 0 GENERATE

        log : FOR i IN 0 TO symbol_width_minus_1 GENERATE
        BEGIN

          -- Note that prev_stage will equal initial coeff value
          -- when start is high hence,
          --
          -- Select prev_stage if start & erase,
          --                 0 if start & ~erase,
          --   else GF add prev_stage and mux_reg_out
          mux_reg_d_in(i) <= ((prev_stage(i) XOR mux_reg_out(i)) AND NOT(sr)) OR
                             (prev_stage(i) AND erase AND sr);

          l0 : rs_reg_bit
          GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
          PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>er_en, aclr=>'0', q=>mux_reg_out(i));

        END GENERATE; -- log

      END GENERATE; -- nig1


    END GENERATE; -- ec1


    -- Coefficient 2 to r-1 register is loaded with 0 at start of a new block
    -- There is no mult_out for ecell_type = 3
    ec23 : IF (ecell_type = 2) OR (ecell_type = 3) GENERATE
      ecl : FOR i IN 0 TO symbol_width_minus_1 GENERATE
      BEGIN
          mux_reg_d_in(i) <= (prev_stage(i) XOR mux_reg_out(i)) AND NOT(sr);

          l0 : rs_reg_bit
          GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
          PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>er_en, aclr=>'0', q=>mux_reg_out(i));

      END GENERATE; -- ecl
    END GENERATE; -- ec23



  END GENERATE; -- mcg1





  ------------------------------------------------------------------------------
  -- Multi-channel operates in the same way as single channel except a mux is
  -- included to select between the previous value for the channel and a new
  -- value, if there has been an erasure. In the multi-channel case the
  -- register is enabled all the time (as long as slow_ce = 1) and the values
  -- for the different channels just rotate round.
  --
  mcg2 : IF multi_channel GENERATE
    SIGNAL mult_in_del : symbol_type;
    SIGNAL reg_out     : symbol_type;
  BEGIN

    ec1 : IF (ecell_type = 1) GENERATE

      lg2 : FOR i IN 0 TO symbol_width_minus_1 GENERATE

        z : IF (init_val(i) = '0') GENERATE

          -- If sr (=start) = '1' then init reg to 0, else set to
          -- reg_out + prev_stage when an erasure occurs, else retain current
          -- value
          mux_reg_d_in(i) <= NOT(sr) AND
                             ((erase AND (prev_stage(i) XOR reg_out(i))) OR
                              (NOT(erase) AND reg_out(i)));

          l0 : rs_reg_bit
          GENERIC MAP (c_has_ce=>c_has_slow_ce, c_has_aclr=>1)
          PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>slow_ce, aclr=>'0',
                   q=>mux_reg_out(i));

        END GENERATE; -- z

        g1 : IF (init_val(i) = '1') GENERATE

          -- If sr (=start) = '1' and an erasure occurs at the same tim then
          -- init reg to 1, else set to reg_out + prev_stage when an erasure
          -- occurs, else retain current value
          mux_reg_d_in(i) <= (sr AND erase) OR
                             (NOT(sr) AND erase AND (prev_stage(i) XOR reg_out(i))) OR
                             (NOT(sr) AND NOT(erase) AND reg_out(i));

          l1 : rs_reg_bit
          GENERIC MAP (c_has_ce=>c_has_slow_ce, c_has_aclr=>1)
          PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>slow_ce, aclr=>'0',
                   q=>mux_reg_out(i));

        END GENERATE; -- g1

      END GENERATE; -- lg2

    END GENERATE; -- ec1



    -- Coefficient 2 to r-1 register is loaded with 0 at start of a new block
    -- There is no mult_out for ecell_type = 3
    ec23 : IF (ecell_type = 2) OR (ecell_type = 3) GENERATE
        ecl : FOR i IN 0 TO symbol_width_minus_1 GENERATE
        BEGIN

          mux_reg_d_in(i) <=
             ((NOT(sr) AND (prev_stage(i) XOR reg_out(i))) AND (erase OR sr)) OR
             (reg_out(i) AND NOT(erase OR sr));

          l0 : rs_reg_bit
          GENERIC MAP (c_has_ce=>c_has_slow_ce, c_has_aclr=>1)
          PORT MAP(d=>mux_reg_d_in(i), clk=>clk, ce=>slow_ce, aclr=>'0',
                   q=>mux_reg_out(i));

        END GENERATE; -- ecl
    END GENERATE; -- ec23


    mcg4 : IF c_num_channels > 3 GENERATE

      -- Shift reg holds mux output value for each channel, apart from values
      -- held in mux_reg_out and the 2 registers after this delay line.
      ecd1 : big_delay
      GENERIC MAP (
        c_family          => c_family,
        c_xdevicefamily   => c_xdevicefamily,
        c_elaboration_dir => c_elaboration_dir,
        bus_width         => symbol_width,
        clk_delay         => c_num_channels-3, -- 1 delay accounted for in adder reg
        memstyle          => dist_mem,         -- 2 more in regs after mult_in
        c_has_ce          => c_has_slow_ce)
      PORT MAP (
        din  => mux_reg_out,
        clk  => clk,
        ce   => slow_ce,
        dout => mult_in );

    END GENERATE; -- mcg4



    mcg5 : IF c_num_channels <= 3 GENERATE
      mult_in <= mux_reg_out;
    END GENERATE; -- mcg5


    mcg6 : IF c_num_channels > 2 GENERATE
      -- This register matches the delay caused by the pipeline register inside the multiplier.
      mr2 : rs_reg
      GENERIC MAP (c_width=>symbol_width, c_has_ce=>c_has_slow_ce, c_has_aclr=>1)
      PORT MAP (d=>mult_in, clk=>clk, ce=>slow_ce, aclr=>'0', q=>mult_in_del);

    END GENERATE; -- mcg6


    mcg7 : IF c_num_channels <= 2 GENERATE
      mult_in_del <= mult_in;
    END GENERATE; -- mcg7


    -- This register matches the delay caused by the register on the multiplier
    -- output.
    mr1 : rs_reg
    GENERIC MAP (c_width=>symbol_width, c_has_ce=>c_has_slow_ce, c_has_aclr=>1)
    PORT MAP (d=>mult_in_del, clk=>clk, ce=>slow_ce, aclr=>'0', q=>reg_out);


  END GENERATE; -- mcg2




  ----------------------------------------------------------------------------
  --
  -- Instantiate parallel-to-serial converter
  -- Note that registers are enabled at full clock rate
  --
  pg : IF (ecell_type < 3) GENERATE
    SIGNAL cout_tmp_d_in : symbol_type;
  BEGIN

    cout_tmp_d_in <= mux_reg_out WHEN load = '1' ELSE cin;

    l2 : rs_reg
    GENERIC MAP (c_width=>symbol_width, c_has_ce=>c_has_ce, c_has_aclr=>1)
    PORT MAP (d=>cout_tmp_d_in, clk=>clk, ce=>ce, aclr=>'0', q=>cout_tmp);

  END GENERATE; -- pg


  -- MS cell doesn't need a mux as it is the LS stage in the shift register
  pg3 : IF (ecell_type = 3) GENERATE

    psr : rs_reg
    GENERIC MAP (c_width=>symbol_width, c_has_ce=>c_has_ce, c_has_aclr=>1)
    PORT MAP (d=>mux_reg_out, clk=>clk, ce=>ce, aclr=>'0', q=>cout_tmp);

  END GENERATE; -- pg3

  -- Delay line to hold cout value for each channel. In single channel
  -- case this degenerates into a straight through connection.
  -- The mux output reg counts as 1 delay element so we only need a
  -- further c_num_channels-1.
  cod1 : big_delay
  GENERIC MAP (
    c_family          => c_family,
    c_xdevicefamily   => c_xdevicefamily,
    c_elaboration_dir => c_elaboration_dir,
    bus_width         => symbol_width,
    clk_delay         => c_num_channels-1,
    memstyle          => dist_mem,
    c_has_ce          => c_has_ce)
  PORT MAP (
    din  => cout_tmp,
    clk  => clk,
    ce   => ce,
    dout => cout);



END synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/erasure.vhd,v 1.3 2011/06/23 15:14:21 andreww Exp $
--
-------------------------------------------------------------------------------
--
-- Unit     : erasure
-- Function : Generates erasure locator polynomial
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.dec_comps_pkg.all;


-- start        : Start of block flag (one symbol long)
-- erase        : If asserted, indicates input symbol is to be erased
-- erase_poly   : Output Erasure polynomial (r+1 coefficients shifted out,
--                least significant first
-- num_erase    : Number of erasures in the block just processed
-- init_coeff   : Value to initialize coeff to (alpha^(h(n-1)). Only used if <C_HAS_N_IN> = 1.

entity erasure is
  generic (
    C_FAMILY                : STRING;
    C_XDEVICEFAMILY         : STRING;
    C_ELABORATION_DIR       : STRING;
    C_CLKS_PER_SYMBOL       : INTEGER;
    C_POLYNOMIAL            : INTEGER;
    C_SYMBOL_WIDTH          : INTEGER;
    C_N                     : INTEGER;
    C_K                     : INTEGER;
    C_H                     : INTEGER;
    C_HAS_CE                : INTEGER;
    C_HAS_SLOW_CE           : INTEGER;
    C_HAS_N_IN              : INTEGER;
    C_HAS_R_IN              : INTEGER;
    C_NUM_CHANNELS          : INTEGER
  );
  port (
    ce           : in  std_logic;
    load_piso    : in  std_logic;
    start        : in  std_logic;
    erase        : in  std_logic;
    clk          : in  std_logic;
    chan_ce      : in  std_logic;
    slow_ce      : in  std_logic;
    init_coeff   : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    erase_poly   : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    num_erase    : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0)
  );
end erasure;


--------------------------------------------------------------------------------
architecture synth of erasure is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  ------------------------------------------------------------------------------
  constant c_enable_rlocs      : integer := 0;
  constant c_enable_rlocs_bool : boolean := (c_enable_rlocs /= 0);

  constant multi_channel : boolean := (C_NUM_CHANNELS > 1);


  -- Create Galois field array
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gf_max : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;

  -- GF(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

  -- Get the 1st 2*symbol_width elements from alpha_to, as they are all that GF multipliers need
  constant alpha_to_short : integer_array_type(0 to 2*C_SYMBOL_WIDTH-1) := alpha_to(0 to 2*C_SYMBOL_WIDTH-1);


  -- Record for variable coefficient GF multiplier
  constant gfx_mul : gfx_record_type := gfx_calc_record(C_SYMBOL_WIDTH,
                                                        C_POLYNOMIAL,
                                                        false,
                                                        alpha_to_short);

  -- Record for constant coefficient GF multiplier (= alpha^(-h))
  constant gfcx : gfcx_record_type :=
                     gfcx_calc_record(C_SYMBOL_WIDTH, C_POLYNOMIAL, alpha_to_short,
                                      alpha_to((C_H * (gf_max-1)) rem gf_max) );

  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH - 1;
  subtype symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);


  -- For fixed N, init_coeff is not used. A fixed value of alpha^(h(n-1)) is
  -- used. When "start" is asserted, coeff is set to this value, however it
  -- is not used as the polynomial registers are being initialized when
  -- "start" = '1'. On the next symbol period coeff will be alpha^(h(n-2)).
  constant init_val_const : integer := C_N-1;

  constant init_val : symbol_type :=
    std_logic_vector(to_unsigned(alpha_to((C_H * init_val_const) rem gf_max), C_SYMBOL_WIDTH));

  -- Polynomial coefficient 1 is always initialized to alpha^(h(n-1)) inside
  -- ecell if there is an erasure during the start pulse.
  constant init_val_coeff1 : symbol_type :=
    std_logic_vector(to_unsigned(alpha_to((C_H * (C_N-1)) rem gf_max), C_SYMBOL_WIDTH));

  -- coeff is registered in multi-channel mode

  constant zeros : symbol_type := (others=>'0');

  constant num_check_symbols : integer := C_N - C_K;

  type cout_type     is array(0 to num_check_symbols) of symbol_type;
  type mult_out_type is array(0 to num_check_symbols-1) of symbol_type;

  constant erase_cnt_width         : integer := bitsneededtorepresent(C_N);
  constant erase_cnt_width_minus_1 : integer := erase_cnt_width - 1;
  subtype  erase_cnt_type is std_logic_vector(erase_cnt_width_minus_1 downto 0);

  signal er_en, erase_cnt_load : std_logic := '0';

  signal cout          : cout_type := (others => (others => '0'));
  signal coeff         : symbol_type := (others => '0');
  signal eloc_in       : symbol_type := (others => '0');
  signal erase_cnt     : erase_cnt_type := (others => '0');
  signal ec_load_value : erase_cnt_type := (others => '0');
  signal init_val_sig  : symbol_type := (others => '0');
  signal int_ce        : std_logic := '0';
  signal mult_out      : mult_out_type := (others => (others => '0'));
  signal next_coeff    : symbol_type := (others => '0');


--------------------------------------------------------------------------------
begin

  int_ce <= ce;


  ------------------------------------------------------------------------------
  nig0 : if C_HAS_N_IN = 0 generate
    nig1 : for i in 0 to symbol_width_minus_1 generate
      init_val_sig(i) <= init_val(i);
    end generate; -- nig1
  end generate; -- nig0

  nig2 : if C_HAS_N_IN /= 0 generate
    nig3 : for i in 0 to symbol_width_minus_1 generate
      init_val_sig(i) <= init_coeff(i);
    end generate; -- nig3
  end generate; -- nig2




  ------------------------------------------------------------------------------
  -- Erasure polynomial is formed by initialising the polynomial register to 1
  -- on block start, then for each flagged erasure, multiply the current erasure
  -- polynomial by alpha^i, shift it 1 position to the left, and add it to the
  -- original register contents.


  --
  -- Instantiate the Galois Field constant coefficient multiplier
  --
  ccm : gfcmul
  generic map (GFCX=>gfcx, Q_MODE=>reg)
  port map (reset=>'0', enable=>slow_ce, clk=>clk, bb=>coeff, cc=>open, cc_reg=>next_coeff);




  ------------------------------------------------------------------------------
  mcg1 : if not(multi_channel) generate
  begin

    -- Multiplier coefficient. Initialised to alpha(h * (n-1)) at block start,
    -- then gets multiplied by (alpha^-h) for each successive symbol.

    -- Multiplexer to select between next_coeff and init_val_sig
    coeff <= init_val_sig when start = '1' else next_coeff;


    -- Enable signal for erasure polynomial register. Register is only enabled
    -- when slow_ce is high and either block start is high or erase is high.
    er_en <= (start or erase) and slow_ce;


    -- Value to be fed to GF multiplier in ecell
    eloc_in <= coeff;

  end generate; -- mcg1


  ------------------------------------------------------------------------------
  mcg1a : if multi_channel generate
    signal coeff_reg : symbol_type := (others => '0');
  begin

    -- Only want to update coeff once per group of symbols for all channels so
    -- use chan_ce as clock enable.
    l0 : rs_reg
    generic map (C_WIDTH=>C_SYMBOL_WIDTH, C_HAS_CE=>1, C_HAS_ACLR=>1)
    port map (d=>next_coeff, clk=>clk, ce=>chan_ce, aclr=>'0', q=>coeff_reg);

    -- Select between next_coeff and init_val during start pulse
    -- Put mux after reg as we need next_coeff to go to alpha(h(n-2)) during the
    -- start pulse period in case there is an erasure during the first symbol.
    -- chan_ce would prevent this if mux was before reg.
    coeff <= init_val_sig when start = '1' else coeff_reg;





    -- Enable signal is only used to control mux select in multi-channel case.
    -- It doesn't control a clock enable, so no need to gate with slow_ce.
    er_en <= start or erase;


    -- Value to be fed to GF multiplier in ecell
    -- next_coeff is available (num_channels-1 symbol periods before ecell
    -- mult_out has to be generated. It is necessary to provide eloc_in
    -- this number of cycles beforehand as the multiplier has num_channels-1
    -- stages of delay. eloc_in must match the mult_in signal in the ecell.
    mcg1b : if C_NUM_CHANNELS > 3 generate

      ncd1 : big_delay
      generic map (
        C_FAMILY          => C_FAMILY,
        C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
        C_ELABORATION_DIR => C_ELABORATION_DIR,
        BUS_WIDTH         => C_SYMBOL_WIDTH,
        CLK_DELAY         => C_NUM_CHANNELS-3,
        MEMSTYLE          => dist_mem,
        C_HAS_CE          => C_HAS_SLOW_CE)
      port map (
        din  => next_coeff,
        clk  => clk,
        ce   => slow_ce,
        dout => eloc_in);

    end generate; -- mcg1b

    mcg1c : if C_NUM_CHANNELS <= 3 generate
      eloc_in <= next_coeff;
    end generate; -- mcg1c

  end generate; -- mcg1a






  ------------------------------------------------------------------------------
  -- Instantiate polynomial coefficient registers and multipliers.
  --
  eg : for i in num_check_symbols downto 0 generate

    -- Least significant coefficient ID always 1.
    -- Just instantiate the PISO portion of an ecell for this coefficient.
    i0 : if i = 0 generate
      signal cout_tmp      : symbol_type := (others => '0');
      signal cout_tmp_d_in : symbol_type := (others => '0');
    begin
      mult_out(0) <= coeff;

      cout_tmp_d_in(0) <= cout(1)(0) or load_piso;

      cout_tmp_d_in(C_SYMBOL_WIDTH-1 downto 1) <=
         cout(1)(C_SYMBOL_WIDTH-1 downto 1) when load_piso = '0' else (others=>'0');

      c0 : rs_reg
      generic map (C_WIDTH=>C_SYMBOL_WIDTH, C_HAS_CE=>C_HAS_CE, C_HAS_ACLR=>1)
      port map (d=>cout_tmp_d_in, clk=>clk, ce=>int_ce, aclr=>'0', q=>cout_tmp);


      -- Delay line to hold cout value for each channel. In single channel
      -- case this degenerates into a straight through connection.
      -- The mux output reg counts as 1 delay element so we only need a
      -- further C_NUM_CHANNELS-1.
      cod1 : big_delay
      generic map (
        C_FAMILY          => C_FAMILY,
        C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
        C_ELABORATION_DIR => C_ELABORATION_DIR,
        BUS_WIDTH         => C_SYMBOL_WIDTH,
        CLK_DELAY         => C_NUM_CHANNELS-1,
        MEMSTYLE          => dist_mem,
        C_HAS_CE          => C_HAS_CE)
      port map (
        din  => cout_tmp,
        clk  => clk,
        ce   => int_ce,
        dout => cout(0));


    end generate; -- i0



    -- Instantiate the Erasure Poly Coeff 1 calculation cell
    -- Coefficient 1 is initialised to either zero (first block symbol is not
    -- an erasure) or alpha(n-1) (first symbol is an erasure).
    i1 : if i = 1 generate
      e1 : ecell
      generic map (C_FAMILY          => C_FAMILY,
                   C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
                   C_ELABORATION_DIR => C_ELABORATION_DIR,
                   ECELL_TYPE        => 1,
                   GFX_MUL           => gfx_mul,
                   INIT_VAL          => init_val_coeff1,
                   SYMBOL_WIDTH      => C_SYMBOL_WIDTH,
                   C_HAS_CE          => C_HAS_CE,
                   C_HAS_SLOW_CE     => C_HAS_SLOW_CE,
                   C_HAS_N_IN        => C_HAS_N_IN,
                   C_NUM_CHANNELS    => C_NUM_CHANNELS,
                   C_ENABLE_RLOCS    => C_ENABLE_RLOCS )
      port map (ce           => int_ce,
                cin          => cout(2),
                clk          => clk,
                eloc_in      => eloc_in,
                erase        => erase,
                load         => load_piso,
                prev_stage   => mult_out(0),
                er_en        => er_en,
                slow_ce      => slow_ce,
                sr           => start,
                cout         => cout(1),
                mult_out     => mult_out(1));
    end generate; -- i1


    -- Instantiate middle Erasure Poly Coeff calculation cells
    im : if ((i > 1) and (i < num_check_symbols)) generate
      em : ecell
      generic map (C_FAMILY            => C_FAMILY,
                   C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
                   C_ELABORATION_DIR   => C_ELABORATION_DIR,
                   ECELL_TYPE          => 2,
                   GFX_MUL             => gfx_mul,
                   INIT_VAL            => init_val_coeff1,
                   SYMBOL_WIDTH        => C_SYMBOL_WIDTH,
                   C_HAS_CE            => C_HAS_CE,
                   C_HAS_SLOW_CE       => C_HAS_SLOW_CE,
                   C_HAS_N_IN          => C_HAS_N_IN,
                   C_NUM_CHANNELS      => C_NUM_CHANNELS,
                   C_ENABLE_RLOCS      => C_ENABLE_RLOCS )
      port map (ce           => int_ce,
                cin          => cout(i+1),
                clk          => clk,
                eloc_in      => eloc_in,
                erase        => erase,
                load         => load_piso,
                prev_stage   => mult_out(i-1),
                er_en        => er_en,
                slow_ce      => slow_ce,
                sr           => start,
                cout         => cout(i),
                mult_out     => mult_out(i));
    end generate; -- im


    -- Instantiate Erasure Poly Coeff r calculation cells
    -- Mult_Out(num_check_symbols) is not used
    it : if i = num_check_symbols generate
      et : ecell
      generic map (C_FAMILY          => C_FAMILY,
                   C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
                   C_ELABORATION_DIR => C_ELABORATION_DIR,
                   ECELL_TYPE        => 3,
                   GFX_MUL           => gfx_mul,
                   INIT_VAL          => init_val_coeff1,
                   SYMBOL_WIDTH      => C_SYMBOL_WIDTH,
                   C_HAS_CE          => C_HAS_CE,
                   C_HAS_SLOW_CE     => C_HAS_SLOW_CE,
                   C_HAS_N_IN        => C_HAS_N_IN,
                   C_NUM_CHANNELS    => C_NUM_CHANNELS,
                   C_ENABLE_RLOCS    => c_enable_rlocs )
      port map (ce           => int_ce,
                clk          => clk,
                eloc_in      => eloc_in,
                erase        => erase,
                load         => load_piso,
                prev_stage   => mult_out(num_check_symbols-1),
                er_en        => er_en,
                slow_ce      => slow_ce,
                sr           => start,
                cout         => cout(num_check_symbols),
                mult_out     => open);
    end generate; -- it


  end generate; -- eg



  erase_poly <= cout(0);





  ------------------------------------------------------------------------------
  -- Number of erasures counter. Initialised with either zero (first block
  -- symbol is not an erasure) or 1 (first symbol is an erasure). It is then
  -- enabled for increment every time erase is high.


  ec_load_value(erase_cnt_width_minus_1 downto 1 ) <= (others=>'0');
  ec_load_value(0) <= erase;



  -- For single channel case, count erasures by enabling a counter whenever
  -- an erasure is flagged.
  -- <erase_cnt> is always read as soon as load_piso goes high.
  mcg2 : if not(multi_channel) generate
  begin


    erase_cnt_load <= not(start); -- Counter load is active low


    -- Instantiate erase counter
    -- Enable counter whenever an erasure is flagged
    ecnt3 : cntre_b
    generic map (C_XDEVICEFAMILY=>C_XDEVICEFAMILY, WIDTH=>erase_cnt_width)
    port map (ce=>er_en, c=>clk, din=>ec_load_value, load_bar=>erase_cnt_load, cnt=>erase_cnt);

  end generate; -- mcg2



  -- For multi-channel case, use an adder plus an SRL16 delay line to hold
  -- the values for each channel.
  mcg3 : if multi_channel generate
    signal erase_cnt_zeroes : erase_cnt_type := (others=>'0');
    signal erase_add_out    : erase_cnt_type := (others=>'0');
    signal erase_cnt_del    : erase_cnt_type := (others=>'0');
    signal init_erase_add   : std_logic := '0';
  begin

    init_erase_add <= start;

    erase_cnt_zeroes <= (others=>'0');

    -- Use slow_ce as adder is counting input erasures. these are clocked in
    -- at the slow_ce rate if C_CLKS_PER_SYMBOL > 1

    -- Adder b input is set to '1' if there is an erasure. this is added to
    -- the erase_cnt value for that channel. This is fed back from the shift
    -- reg output. When "init_erase_add" is asserted the initial ec_load_val
    -- is added to the 0 on the a1 input. This initializes the shift reg.
    ecnt2 : rs_adder2
    generic map (C_WIDTH        => erase_cnt_width,
                 C_OUT_WIDTH    => erase_cnt_width,
                 C_HAS_CE       => C_HAS_SLOW_CE,
                 C_HAS_ACLR     => 1)
    port map (ce    => slow_ce,
              clk   => clk,
              aclr  => '0',
              a0    => erase_cnt_del,
              a1    => erase_cnt_zeroes,
              b     => ec_load_value,
              a_sel => init_erase_add,
              q     => erase_cnt);

    -- shift reg holds erase_cnt value for each channel
    ecd1 : big_delay
    generic map (
      C_FAMILY          => C_FAMILY,
      C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
      C_ELABORATION_DIR => C_ELABORATION_DIR,
      BUS_WIDTH         => erase_cnt_width,
      CLK_DELAY         => C_NUM_CHANNELS-1, --1 delay accounted for in adder reg
      MEMSTYLE          => dist_mem,
      C_HAS_CE          => C_HAS_SLOW_CE)
    port map (
      din  => erase_cnt,
      clk  => clk,
      ce   => slow_ce,
      dout => erase_cnt_del );

  end generate; -- mcg3



  -- Shift reg holds erase_cnt value for each channel while the erasure locator polynomial is held in the PISO.
  -- Always loaded by "load_piso" prior to use. Use <int_ce> so that it is loaded by <load_piso> and
  -- unloaded when <piso_ce> is high in Syndrome unit.
  ecd2 : big_delay
  generic map (C_FAMILY=>C_FAMILY, C_XDEVICEFAMILY=>C_XDEVICEFAMILY, C_ELABORATION_DIR=>C_ELABORATION_DIR,
               BUS_WIDTH=>erase_cnt_width, CLK_DELAY=>C_NUM_CHANNELS, MEMSTYLE=>dist_mem, C_HAS_CE=>1)
  port map (din=>erase_cnt, clk=>clk, ce=>int_ce, dout=>num_erase);




end synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/puncture.vhd,v 1.4 2011/06/23 15:14:21 andreww Exp $
--
-------------------------------------------------------------------------------
--
-- Unit     : puncture
-- Function : Generates erasure locator polynomial when erasure positions
--            are known ahead of time.
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.mem_init_file_pack.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.dec_comps_pkg.all;


-- C_NUM_PUNC_PATTERNS : must be at least 1 or we don't need this ENTITY.

-- ce           : Global ce
-- piso_ce      : piso_ce from Syndrome unit, gated with output channel terminal count.
--                High once every <C_NUM_CHANNELS> cycles when PISO is to be clocked.
-- start_bma    : High when BMA unit is started and first coefficient is being loaded from
--                Syndrome unit into the BMA unit.
-- load_piso_p1 : High one cycle before PISO is to be loaded. Not reqd in multi-channel case.
-- load_piso    : High when PISO is to be loaded
-- sync         : Start of block flag (one symbol long)
-- punc_sel     : Selects which puncture pattern to use. Not used if there is
--                only a single puncture pattern. Sampled when sync is high.
-- erase_poly   : Output Erasure polynomial (r+1 coefficients shifted out,
--                least significant first
-- num_erase    : Number of erasures in the block just processed

entity puncture is
  generic (
    C_FAMILY                : string;
    C_XDEVICEFAMILY         : string;
    C_NUM_CHANNELS          : integer;
    C_NUM_PUNC_PATTERNS     : integer;
    C_PUNCTURE_SELECT_FILE  : string;
    C_PUNCTURE_VECTOR_FILE  : string;
    C_MEM_INIT_PREFIX       : string;
    C_ELABORATION_DIR       : string;
    C_PUNC_SEL_WIDTH        : integer;
    C_CLKS_PER_SYM          : integer;
    C_POLYNOMIAL            : integer;
    C_SYMBOL_WIDTH          : integer;
    C_MEM_STYLE             : integer;
    C_N                     : integer;
    C_K                     : integer;
    C_H                     : integer;
    C_HAS_CE                : integer;
    C_HAS_N_IN              : integer;
    C_HAS_SLOW_CE           : integer;
    C_HAS_PISO_CE           : integer
  );
  port (
    ce           : in  std_logic;
    slow_ce      : in  std_logic;
    piso_ce      : in  std_logic;
    sync         : in  std_logic;
    start_bma    : in  std_logic;
    load_piso    : in  std_logic;
    load_piso_p1 : in  std_logic;
    clk          : in  std_logic;
    punc_sel     : in  std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
    erase_poly   : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    num_erase    : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0)
  );
end puncture;


--------------------------------------------------------------------------------
architecture synth of puncture is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  ------------------------------------------------------------------------------


  constant multi_channel : boolean := (C_NUM_CHANNELS > 1);

  ------------------------------------------------------------------------------
  -- Filenames must be dealt with outside of main block due to the way xcc
  -- works (or doesn't!)
  constant q_puncture_select_file : string := C_PUNCTURE_SELECT_FILE;
  attribute qualified_by_project_dir of q_puncture_select_file: constant is true;
  constant q_puncture_vector_file : string := C_PUNCTURE_VECTOR_FILE;
  attribute qualified_by_project_dir of q_puncture_vector_file: constant is true;

  ------------------------------------------------------------------------------

  constant e_poly_rom_mif_name : string := concatenate_strings(C_MEM_INIT_PREFIX, "_epr.mif");

  constant q_e_poly_rom_mif_name : string := e_poly_rom_mif_name;
  attribute qualified_by_project_dir of q_e_poly_rom_mif_name : constant is true;


  ------------------------------------------------------------------------------

  constant num_erase_rom_mif_name : string := concatenate_strings(C_MEM_INIT_PREFIX, "_ner.mif");

  constant q_num_erase_rom_mif_name : string := num_erase_rom_mif_name;
  attribute qualified_by_project_dir of q_num_erase_rom_mif_name : constant is true;


  ------------------------------------------------------------------------------

  subtype symbol_type is std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);

  constant string_1 : string(1 to C_SYMBOL_WIDTH) := int_2_logic_string(1, C_SYMBOL_WIDTH);

  constant num_erase_width : integer := bitsneededtorepresent(C_N);
  subtype num_erase_type is std_logic_vector(num_erase_width-1 downto 0);


  -- Create galois field array
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gf_max : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;

  -- gf(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

  -- gf(2^sw) index array
  constant index_of : integer_array_type(0 to gf_max) := gf_calc_indices(C_SYMBOL_WIDTH, alpha_to);


  ------------------------------------------------------------------------------
  -- Compute erasure polynomial coefficients corresponding to the puncture
  -- pattern defined in the puncture_vector. Note that this puncture vector
  -- is only for a single punc_sel value.
  -- The puncture vector contains the index of the symbol to be punctured,
  -- with 0 indicating the last received symbol, 1 the second last, etc. Thus
  -- the puncture vector is independent of the block length.
  -- If symbol 0 is erased then e = alpha^(0)
  -- If symbol 1 is erased then e = alpha^(h)
  -- If symbol 2 is erased then e = alpha^(2h) etc
  --
  function get_e_poly (num_roots       : integer;
                       e_poly_degree   : integer;
                       puncture_vector : XBIP_UTILS_integer_vector)
    return XBIP_UTILS_integer_vector is
    variable coeff_update : integer;
    variable e_poly       : XBIP_UTILS_integer_vector(0 to e_poly_degree);
    variable prev_e_poly  : XBIP_UTILS_integer_vector(0 to e_poly_degree);
    -- <e_vector> holds the x coefficients for each of the erasure polynomial
    -- factors. i.e. (1 + ex) if a root of alpha^(-3) is required then
    -- e=alpha^3.
    variable e_vector : XBIP_UTILS_integer_vector(0 to num_roots-1);
  begin

    -- Initialize e_poly to 00..01
    for i in 1 to e_poly_degree loop
      e_poly(i) := 0;
    end loop; -- i

    e_poly(0) := 1; -- ls coeff is always 1
    prev_e_poly(0) := 1;


    -- Just return 000...01 if no roots
    if num_roots > 0 then

      -- Compute e(r) values, based on supplied puncture_vector
      -- store e(r) values as index (log) values so they can be easily
      -- multiplied
      for r in 0 to num_roots-1 loop
        e_vector(r) := C_H * puncture_vector(r);
      end loop; -- r


      -- Now compute coefficients based on required roots
      for r in 0 to num_roots-1 loop
--       report
--        "e_vector(" & integer'image(r) & ") = " & integer'image(e_vector(r)) &
--        new_line
--       severity note;

        -- Save current e_poly as it is required to compute next e_poly values
        for i in 1 to e_poly_degree loop
          prev_e_poly(i) := e_poly(i);
        end loop; -- i


        -- For each new root we need to multiply e_poly by (1 + e(r)x). The 1
        -- yields the first term in the following equation. the e(r)x term
        -- yields the second term.
        -- e_poly(i) := prev_e_poly(i) + (prev_e_poly(i-1) * e(r))
        -- Operations use galois field arithmetic => add becomes xor, add
        -- indices and take log to multiply.
        for i in 1 to e_poly_degree loop

          if prev_e_poly(i-1) = 0 then
            coeff_update := 0; -- can't take index_of(0)
          else
            coeff_update := alpha_to((index_of(prev_e_poly(i-1)) + e_vector(r)) rem gf_max);
          end if; -- prev_e_poly

          e_poly(i) := integer_xor(prev_e_poly(i), coeff_update, C_SYMBOL_WIDTH);

        end loop; -- i

      end loop; -- r


--      for i in 0 to e_poly_degree loop
--        report
--         "e_poly(" & integer'image(i) & ") = " & integer'image(e_poly(i)) &
--         new_line
--        severity note;
--      end loop; -- i

    end if; -- num_roots > 0

    return e_poly;

  end get_e_poly;




  ------------------------------------------------------------------------------
  -- The e_poly ROM stores the erasure polynomial coefficients for each
  -- punc_sel value. Note that the ls coefficient is always 1 so this isn't
  -- stored.
  function get_e_poly_rom_contents (e_poly_degree          : integer;
                                    e_poly_rom_depth       : integer;
                                    puncture_select_vector : XBIP_UTILS_integer_vector;
                                    puncture_vector        : XBIP_UTILS_integer_vector)
    return XBIP_UTILS_integer_vector is
    variable e_poly                     : XBIP_UTILS_integer_vector(0 to e_poly_degree);
    variable mem_depth_per_punc_pattern : integer;
    variable mem_index                  : integer;
    variable num_roots                  : integer;
    variable pv_index                   : integer;
    variable result : XBIP_UTILS_integer_vector(0 to e_poly_rom_depth-1);
    -- Set length of this_puncture_vector to maximum possible value even though
    -- not all the elements will always be required.
    variable this_puncture_vector : XBIP_UTILS_integer_vector(0 to e_poly_degree-1);
  begin

    -- Round e_poly_degree up to nearest power of 2.
    mem_depth_per_punc_pattern := 2**(log2u(e_poly_degree));

    mem_index := 0;
    pv_index := 0;

    -- Store mem_depth_per_punc_pattern for each possible punc_sel value.
    for ps in 0 to (C_NUM_PUNC_PATTERNS - 1) loop

      num_roots := puncture_select_vector(ps);

      -- coverage off
      assert num_roots <= e_poly_degree
        report
         "ERROR: Reed-Solomon Decoder: Puncture select file, " &
         C_PUNCTURE_SELECT_FILE &
         ", contains an entry with more punctures than can be supported " &
         "by the RS code." & new_line &
         "The maximum number of punctured symbols must be less than or " &
         "equal to N - K  (=" & integer'image(e_poly_degree) & ")." &
         new_line
        severity failure;
      -- coverage on

      for pvi in 0 to num_roots-1 loop
        this_puncture_vector(pvi) := puncture_vector(pv_index);

        -- coverage off
        assert this_puncture_vector(pvi) < C_N
          report
           "ERROR: Reed-Solomon Decoder: Puncture vector file, " &
           C_PUNCTURE_VECTOR_FILE &
           ", contains an entry greater than N-1." &
           new_line &
           "The maximum value is " & integer'image(C_N-1) & "." &
           "This value means the first symbol in the block of " &
           integer'image(C_N) & " symbols is to be punctured. " &
           "A value of 0 means the last symbol in the block is to " &
           "be punctured." &
           new_line
          severity failure;
        -- coverage on


--       report "puncture_vector(" & integer'image(pv_index) & ") = " &
--               integer'image(puncture_vector(pv_index)) &
--               new_line
--       severity note;

        pv_index := pv_index + 1;
      end loop; --pvi


      -- Get erasure polynomial for this punc_sel value
      e_poly := get_e_poly(num_roots,
                           e_poly_degree,
                           this_puncture_vector);

      for i in 0 to (mem_depth_per_punc_pattern - 1) loop
        -- Ignore e_poly(0) as it is always 1.
        if (i < e_poly_degree) then
          result(mem_index) := e_poly(i+1);
        else
          result(mem_index) := 0; -- pad unused locations with 0
        end if;

        mem_index := mem_index + 1;
      end loop; -- i

    end loop; -- ps

    -- Pad remaining memory locations with 0. This means illegal punc_sel
    -- values will result in no puncturing as the erasure polynomial will
    -- be 00...01. Remember LS coeff (1) doesn't come from rom, it is
    -- generated when the reg on the rom output is initialized.
    if mem_index < e_poly_rom_depth-1 then
      for i in mem_index to e_poly_rom_depth-1 loop
        result(i) := 0;
      end loop; -- i
    end if; -- mem_index

    return result;

  end get_e_poly_rom_contents;




  ------------------------------------------------------------------------------
  -- Create contents for num_erase ROM.
  -- This stores the number of erasures for each punc_sel value. Illegal values
  -- are padded with 0's.
  --
  function get_num_erase_rom_contents(num_erase_rom_depth    : integer;
                                      puncture_select_vector : XBIP_UTILS_integer_vector)
    return XBIP_UTILS_integer_vector is
    variable result : XBIP_UTILS_integer_vector(0 to num_erase_rom_depth-1);
  begin

    -- Store number of erasures for each punc_sel value
    for ps in 0 to (num_erase_rom_depth - 1) loop

      if ps < C_NUM_PUNC_PATTERNS then
        result(ps) := puncture_select_vector(ps);
      else
        result(ps) := 0; -- pad unused locations with 0
      end if; -- ps

    end loop; -- ps


    return result;

  end get_num_erase_rom_contents;

--------------------------------------------------------------------------------
-- Beginning of architecture body
--
begin

--bk1 : block -- dummy block so qualified_by_project_dir works
bk1 : if true generate

  -- This vector holds the number of punctured symbols for each possible
  -- punc_sel input value.
  -- e.g. [4, 8, 10] means if punc_sel = 0 there are 4 punctured symbols,
  -- If punc_sel = 1 there are 8 and if punc_sel = 2 there are 10.
  -- If punc_sel = 3, it is assumed there are no punctured symbols.

  constant puncture_select_vector : XBIP_UTILS_integer_vector(0 to C_NUM_PUNC_PATTERNS-1)
           := get_integer_vector_from_mif(true,
                                          q_puncture_select_file,
                                          C_ELABORATION_DIR,
                                          C_NUM_PUNC_PATTERNS,
                                          mif_width);

  constant puncture_vector_length : integer := get_sum(puncture_select_vector);

--------------------------------------------------------------------------------------
  -- The puncture vector holds lists of the symbols to be punctured for all
  -- the punc_sel values.
  -- e.g. [0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7, 0, 1, ... etc] means
  -- If punc_sel = 0 then puncture the last 4 symbols, assuming
  -- puncture_select_vector(0)=4
  -- If punc_sel = 1 then puncture the last 8 symbols, assuming
  -- puncture_select_vector(1)=8 and so on.

  constant puncture_vector : XBIP_UTILS_integer_vector(0 to puncture_vector_length-1)
           := get_integer_vector_from_mif(true,
                                          q_puncture_vector_file,
                                          C_ELABORATION_DIR,
                                          puncture_vector_length,
                                          mif_width);

  -- Degree of polynomial is highest x power. e.g. 5x^2 + 4x + 1 has degree 2
  constant e_poly_degree : integer := C_N - C_K;

  -- Round e_poly_degree up to nearest power of 2.
  constant addr_width_per_punc_pattern : integer := log2u(e_poly_degree);
  constant mem_depth_per_punc_pattern  : integer := 2**addr_width_per_punc_pattern;

  constant e_poly_rom_depth_guess : integer := mem_depth_per_punc_pattern * C_NUM_PUNC_PATTERNS;


  -- We need to store the coefficient for each power of x. There is no need to
  -- store the x^0 coefficient, as it is always 1.
  constant e_poly_rom_style : integer := get_memstyle(e_poly_rom_depth_guess,
                                                      C_SYMBOL_WIDTH,
                                                      C_MEM_STYLE,
                                                      c_rom,
                                                      C_FAMILY, true);

  constant e_poly_rom_depth : integer :=
                        get_mem_depth(e_poly_rom_depth_guess, e_poly_rom_style);

  -- Compute contents for erasure polynomial ROM
  constant e_poly_rom_contents : XBIP_UTILS_integer_vector(0 to e_poly_rom_depth-1) :=
                                 get_e_poly_rom_contents(e_poly_degree,
                                                         e_poly_rom_depth,
                                                         puncture_select_vector,
                                                         puncture_vector);

  constant e_poly_rom_num_bits : integer := e_poly_rom_depth * C_SYMBOL_WIDTH;

  constant e_poly_rom_mif_contents : bit_vector(e_poly_rom_num_bits-1 downto 0)
             := XBIP_UTILS_integer_vector_to_bit_vector(e_poly_rom_contents, C_SYMBOL_WIDTH);

  constant e_poly_rom_mif_written : boolean :=
                write_meminit_file(q_e_poly_rom_mif_name, C_ELABORATION_DIR,
                                   e_poly_rom_depth, C_SYMBOL_WIDTH,
                                   e_poly_rom_mif_contents);

  -- e_poly_rom declarations
  constant e_poly_rom_addr_width : integer :=
                                      bitsneededtorepresent(e_poly_rom_depth-1);




  ------------------------------------------------------------------------------
  -- Declarations for num_erase ROM. This stores the number of erasures for
  -- each punc_sel value. Illegal punc_sel values are padded with 0's.
  --

  constant num_erase_rom_depth_guess : integer := C_NUM_PUNC_PATTERNS;


  -- We need to store the number of erasures for each punc_sel value
  constant num_erase_rom_style : integer := get_memstyle(num_erase_rom_depth_guess,
                                                        num_erase_width,
                                                        C_MEM_STYLE,
                                                        c_rom,
                                                        C_FAMILY, true);

  constant num_erase_rom_depth : integer := get_mem_depth(num_erase_rom_depth_guess, num_erase_rom_style);

  -- Compute contents for ROM
  constant num_erase_rom_contents :
    XBIP_UTILS_integer_vector(0 to num_erase_rom_depth-1) := get_num_erase_rom_contents(num_erase_rom_depth,
                                                                             puncture_select_vector);

  constant num_erase_rom_num_bits : integer := num_erase_rom_depth * num_erase_width;

  constant num_erase_rom_mif_contents : bit_vector(num_erase_rom_num_bits-1 downto 0) :=
    XBIP_UTILS_integer_vector_to_bit_vector(num_erase_rom_contents, num_erase_width);


  constant num_erase_rom_mif_written : boolean :=
               write_meminit_file(q_num_erase_rom_mif_name, C_ELABORATION_DIR,
                                  num_erase_rom_depth, num_erase_width,
                                  num_erase_rom_mif_contents);

  -- num_erase_rom declarations
  constant num_erase_rom_addr_width : integer := bitsneededtorepresent(num_erase_rom_depth-1);






  ------------------------------------------------------------------------------
  -- Signal declarations
  --

  signal addr_counter_ce          : std_logic := '0';
  signal addr_counter_clr         : std_logic := '0';
  signal rom_ce                   : std_logic := '0';
  signal e_poly_rom_a             : std_logic_vector(e_poly_rom_addr_width-1 downto 0) := (others=>'0');

  -- Dummy signals for e_poly_rom
  signal e_poly_rom_d_dummy       : symbol_type := (others=>'0');
  signal e_poly_rom_dpra_dummy    : std_logic_vector(e_poly_rom_addr_width-1 downto 0) := (others=>'0');

  signal e_poly_coeff             : symbol_type := (others=>'0');
  signal e_poly_coeff_select      : std_logic_vector(addr_width_per_punc_pattern-1 downto 0) := (others=>'0');

  signal init_e_poly              : std_logic := '0';
  signal int_ce                   : std_logic := '0';
  signal load_punc_sel_reg        : std_logic := '0';

  signal num_erase_d_dummy        : num_erase_type := (others=>'0');

  signal num_erase_rom_a          : std_logic_vector(num_erase_rom_addr_width-1 downto 0) := (others=>'0');

  signal num_erase_rom_dpra_dummy : std_logic_vector(num_erase_rom_addr_width-1 downto 0) := (others=>'0');

  signal punc_sel_reg             : std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0) := (others=>'0');

  signal zeroes                   : std_logic_vector(addr_width_per_punc_pattern-1 downto 0) := (others=>'0');




begin -- of block bk1

  -- Need to have an assert for every mif read or write to fool xst into
  -- thinking the boolean constant is actually used, otherwise it removes
  -- the constant and doesn't do the file operation.
  assert false
    report q_e_poly_rom_mif_name & " written: " &
           boolean'image(e_poly_rom_mif_written)
    severity note;

  assert false
    report q_num_erase_rom_mif_name & " written: " &
           boolean'image(num_erase_rom_mif_written)
    severity note;

  ------------------------------------------------------------------------------
  int_ce <= ce;

  ------------------------------------------------------------------------------
  -- punc_sel is only required if C_NUM_PUNC_PATTERNS > 1
  --
  psg0 : if C_NUM_PUNC_PATTERNS > 1 generate
    signal punc_sel_ce   : std_logic := '0';
    signal punc_sel_ce1  : std_logic := '0';
    signal punc_sel_reg1 : std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0) := (others=>'0');
  begin

    -- Generate ce for first punc_sel reg
    psg1 : if C_HAS_SLOW_CE = 0 generate
      punc_sel_ce1 <= sync;
    end generate; -- psg1

    psg2 : if C_HAS_SLOW_CE /= 0 generate
      punc_sel_ce1 <= sync and slow_ce;
    end generate; -- psg2


    -- Generate ce for second punc_sel reg
    psg3 : if C_HAS_CE = 0 generate
      punc_sel_ce <= load_punc_sel_reg;
    end generate; -- psg3

    psg4 : if C_HAS_CE /= 0 generate

      -- Note have to use int_ce here rather than piso_ce as load_piso_p1
      -- may pulse before piso_ce is asserted and punc_sel_ce will never
      -- go high.
      punc_sel_ce <= load_punc_sel_reg and int_ce;

    end generate; -- psg4



    -- Register to latch punc_sel at start of a new block. This
    -- is required because punc_sel may only be stable for one clock cycle
    -- when sync is asserted.
    psr1 : rs_reg
    generic map (c_width=>C_PUNC_SEL_WIDTH, C_HAS_CE=>1)
    port map (d=>punc_sel, clk=>clk, ce=>punc_sel_ce1, q=>punc_sel_reg1);


    -- Register to latch and hold punc_sel_reg1 value steady whilst coefficients
    -- are shifted out. Enable with load_piso_p1 as the e_poly rom address must be
    -- stable when load_piso pulse occurs.
    -- This is necessary because a new block can start while the coefficients
    -- for the previous block are still being shifted out.
    psr2 : rs_reg
    generic map (c_width=>C_PUNC_SEL_WIDTH, C_HAS_CE=>1)
    port map (d=>punc_sel_reg1, clk=>clk, ce=>punc_sel_ce, q=>punc_sel_reg);



    ----------------------------------------------------------------------------
    -- Lower bits of num_erase ROM address bus select the appropriate number
    -- of punctured symbols for the punc_sel input.
    -- Unused bits in num_erase_rom_a must be padded with zeroes
    --
    ag2: for bi in 0 to (num_erase_rom_addr_width-1) generate
    begin
      ag2a : if bi < C_PUNC_SEL_WIDTH generate
        num_erase_rom_a(bi) <= punc_sel_reg(bi);
      end generate; -- ag2a

      ag2b : if bi >= C_PUNC_SEL_WIDTH generate
        num_erase_rom_a(bi) <= '0';
      end generate; -- ag2b

    end generate; -- ag2



    --
    -- num_erase ROM holding number of erasures for each punc_sel value
    --
    ner1 : rs_mem
    generic map(
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      c_memstyle        => num_erase_rom_style,
      c_addr_width      => num_erase_rom_addr_width,
      c_depth           => num_erase_rom_depth,
      c_width           => num_erase_width,
      c_has_dout_a      => 1,
      c_has_dout_b      => 0,
      c_has_en          => C_HAS_PISO_CE,
      c_has_we          => 0,
      c_mem_init_file   => num_erase_rom_mif_name,
      c_mem_type        => c_rom,
      c_read_mif        => 1)
    port map(
      addra    => num_erase_rom_a,
      addrb    => num_erase_rom_dpra_dummy,
      d        => num_erase_d_dummy,
      clk      => clk,
      en       => rom_ce,
      we       => '0',
      dout_a   => num_erase,
      dout_b   => open);


  end generate; -- psg0


  -- punc_sel is not required if C_NUM_PUNC_PATTERNS = 1
  psg3 : if C_NUM_PUNC_PATTERNS <= 1 generate
  begin
    punc_sel_reg <= (others=>'0');

    -- There must only be 1 puncture pattern so we don't need a ROM to store
    -- the different number of erasures for each punc_sel value. Just hard
    -- code with the single fixed number of erasures.
    num_erase <= std_logic_vector(to_unsigned(puncture_select_vector(0), num_erase_width));
  end generate; -- psg3







  -- Counter to drive lower part of e_poly rom address bus
  c0 : rs_counter
  generic map (c_xdevicefamily => C_XDEVICEFAMILY,
               c_width         => addr_width_per_punc_pattern,
               use_count_to    => false,
               count_to        => mem_depth_per_punc_pattern-1,
               c_count_mode    => c_up,
               c_has_ce        => 1, -- always has ce
               c_has_sclr      => 1,
               c_sync_enable   => c_no_override) -- only reset if ce='1'
  port map(clk   => clk,
           ce    => addr_counter_ce,
           l     => zeroes,
           up    => '1',
           sclr  => addr_counter_clr,
           q     => e_poly_coeff_select);





  ----------------------------------------------------------------------------
  -- Lower bits of e_poly rom address bus select the appropriate e(x)
  -- coefficient. The upper bits are driven from the punc_sel input.
  -- Unused bits in e_poly_rom_a must be padded with zeroes
  --
  ag1: for bi in 0 to (e_poly_rom_addr_width-1) generate
  begin
    ag1a : if bi < addr_width_per_punc_pattern generate
      e_poly_rom_a(bi) <= e_poly_coeff_select(bi);
    end generate; -- ag1a

    ag1b : if bi >= addr_width_per_punc_pattern and
              bi < addr_width_per_punc_pattern + C_PUNC_SEL_WIDTH generate
      e_poly_rom_a(bi) <= punc_sel_reg(bi - addr_width_per_punc_pattern);
    end generate; -- ag1b

    ag1c : if bi >= addr_width_per_punc_pattern + C_PUNC_SEL_WIDTH generate
      e_poly_rom_a(bi) <= '0';
    end generate; -- ag1c
  end generate; -- ag1

  --
  -- e_poly rom holding (n-k) erasure polynomial coefficients for each
  -- punc_sel value.
  --
  epr1 : rs_mem
  generic map(
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    c_memstyle        => e_poly_rom_style,
    c_addr_width      => e_poly_rom_addr_width,
    c_depth           => e_poly_rom_depth,
    c_width           => C_SYMBOL_WIDTH,
    c_has_dout_a      => 1,
    c_has_dout_b      => 0,
    c_has_en          => C_HAS_PISO_CE,
    c_has_we          => 0,
    c_mem_init_file   => e_poly_rom_mif_name,
    c_mem_type        => c_rom,
    c_read_mif        => 1)
  port map(
    addra    => e_poly_rom_a,
    addrb    => e_poly_rom_dpra_dummy,
    d        => e_poly_rom_d_dummy,
    clk      => clk,
    en       => rom_ce,
    we       => '0',
    dout_a   => e_poly_coeff,
    dout_b   => open);



  -- This register is initialized to 1 on <load_piso>. This forms the LS
  -- erasure polynomial coefficient and is shifted out first.
  -- Use <piso_ce> as register must be initialized to 1 when <load_piso>
  -- occurs and then hold it until <piso_ce> goes high again.
  -- It is possible for <load_piso> to be pulsed and then a long
  -- gap before <piso_ce> goes high again to shift the data out of the PISO.
  er1 : rs_reg_ainit
  generic map (
    c_width        => C_SYMBOL_WIDTH,
    c_ainit_val    => string_1,
    c_sinit_val    => string_1,
    c_has_ce       => C_HAS_PISO_CE,
    c_has_sclr     => 0,  -- always loaded by "load_piso" prior to use
    c_has_sinit    => 1,
    c_sync_enable  => c_no_override) -- only initialize if ce='1'. not reset by global reset.
  port map (
    d     => e_poly_coeff,
    clk   => clk,
    ce    => piso_ce,
    sinit => init_e_poly,
    q     => erase_poly );



  ------------------------------------------------------------------------------
  mcg1 : if not(multi_channel) generate
  begin

    rom_ce <= piso_ce;

    init_e_poly <= load_piso;

    load_punc_sel_reg <= load_piso_p1;


    ------------------------------------------------------------------------------
    -- Generate sclr signal for address counter
    -- Need to clear address counter before <load_piso> pulse so that address = 0
    -- during <load_piso> pulse and first value from e_poly ROM is on ROM output
    -- immediately after <load_piso> pulse.
    --
    addr_counter_clr <= load_piso_p1;

    -- The <load_piso> pulse may occur and then there will be a delay before
    -- the PISO is unloaded. The counter must still be cleared prior to the
    -- <load_piso> pulse but then must be held until the PISO is to be unloaded.
    -- <piso_ce> from the Syndrome unit is used for this reason. This will
    -- remain low until the PISO contents are to be shifted out into the BMA
    -- unit.
    addr_counter_ce <= (addr_counter_clr or piso_ce) and int_ce;

  end generate; -- mcg1



  ------------------------------------------------------------------------------
  -- Multi-channel logic
  --
  mcg2 : if multi_channel generate
  begin

    -- ROM addresses are updated on <piso_ce> pulse, once per <C_NUM_CHANNELS> cycles.
    -- ROM output then changes on the next clock edge, ready to be loaded into the final
    -- <erase_poly> reg on the next <piso_ce> pulse.
    rom_ce <= int_ce;

    addr_counter_ce <= piso_ce;

    -- Syndrome channel counter is reset by <start_bma>, so <piso_ce> might still be
    -- asserted when <start_bma> is high. This would cause the counter to be clocked
    -- too early after the clr pulse, so force clr high.
    addr_counter_clr <= load_piso or start_bma;

    init_e_poly <= addr_counter_clr;

    -- <punc_sel_reg> has to be loaded early enough to allow e_poly_coeff
    -- to be addressed and then output on erase_poly in time for "done"
    -- pulse. In multi-channel case there is more time for this so we don't
    -- need to use load_piso_p1.
    load_punc_sel_reg <= load_piso;

  end generate; -- mcg2


--end block; -- bk1
end generate; -- bk1

end synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/scell.vhd,v 1.2 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : scell
-- Function : Building block for RS Decoder syndrome calculator
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY scell IS
  GENERIC (
    c_family             : STRING;
    c_xdevicefamily      : STRING;
    c_elaboration_dir    : STRING;
    c_num_channels       : INTEGER;
    c_has_ce             : INTEGER;
    c_has_slow_ce        : INTEGER;
    polynomial           : INTEGER;
    symbol_width         : INTEGER;
    constant_coefficient : INTEGER;
    alpha_to_short       : integer_array_type;
    c_enable_rlocs       : INTEGER
  );
  PORT (
    ce        : IN  STD_LOGIC;
    slow_ce   : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    sel       : IN  STD_LOGIC;
    load      : IN  STD_LOGIC;
    din       : IN  STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    sin       : IN  STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    sout      : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0)
    );
END scell;

--------------------------------------------------------------------------------
ARCHITECTURE synth OF scell IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  CONSTANT gfcx : gfcx_record_type := gfcx_calc_record(symbol_width,
                                                       polynomial,
                                                       alpha_to_short,
                                                       constant_coefficient);

  SIGNAL cc            : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
  SIGNAL cc_reg        : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
  SIGNAL cc_final      : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
  SIGNAL ff            : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
  SIGNAL ff_d_in       : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
  SIGNAL sout_tmp_d_in : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
  SIGNAL sout_tmp      : STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);

  CONSTANT multi_channel : BOOLEAN := (c_num_channels > 1);

  -- We can register the multiplier output if there are multiple
  -- channels.
  CONSTANT multiplier_output_mode : INTEGER :=
                                       select_val_b(no_reg, reg, multi_channel);

BEGIN

  --
  -- Instantiate the Galois Field constant coefficient multiplier
  --
  ccm : gfcmul
  GENERIC MAP (
    gfcx   => gfcx,
    q_mode => multiplier_output_mode)
  PORT MAP (
    reset  => '0',
    enable => slow_ce,
    clk    => clk,
    bb     => ff,
    cc     => cc, -- Only used in single channel case
    cc_reg => cc_reg); -- Only used in multi-channel case

  mcg1 : IF NOT(multi_channel) GENERATE
    cc_final <= cc;
  END GENERATE; -- mcg1

  -- Delay cc_reg by a total of c_num_channels-1. Multiplier output reg
  -- already accounts for a delay of 1, so we need to delay by a further
  -- c_num_channels-2. Each stage of the delay line will hold the current
  -- syndrome accumulation value for each channel.
  mcg2 : IF multi_channel GENERATE

    ccd1 : big_delay
    GENERIC MAP (
      c_family          => c_family,
      c_xdevicefamily   => c_xdevicefamily,
      c_elaboration_dir => c_elaboration_dir,
      bus_width         => symbol_width,
      clk_delay         => c_num_channels-2,
      memstyle          => dist_mem,
      c_has_ce          => c_has_slow_ce)
    PORT MAP (
      din  => cc_reg,
      clk  => clk,
      ce   => slow_ce,
      dout => cc_final);

  END GENERATE; -- mcg2;


  --
  -- Instantiate syndrome mux/xor2's and registers
  -- Note that registers are only enabled at the slow clock rate
  --
  ff_d_in <= din WHEN sel = '1' ELSE (din XOR cc_final);

  l0 : rs_reg
  GENERIC MAP (c_width=>symbol_width, c_has_ce=>c_has_slow_ce, c_has_aclr=>1)
  PORT MAP (d=>ff_d_in, clk=>clk, aclr=>'0', ce=>slow_ce, q=>ff);


  --
  -- Instantiate parallel-to-serial converter
  -- Note that this is enabled at the full clock rate
  --
  sout_tmp_d_in <= ff WHEN load = '1' ELSE sin;

  l1 : rs_reg
  GENERIC MAP (c_width=>symbol_width, c_has_ce=>c_has_ce, c_has_aclr=>1)
  PORT MAP (d=>sout_tmp_d_in, clk=>clk, aclr=>'0', ce=>ce, q=>sout_tmp);


  -- Delay line to hold sout value for each channel. In single channel
  -- case this degenerates into a straight through connection.
  -- The mux output reg counts as 1 delay element so we only need a
  -- further c_num_channels-1.
  sod1 : big_delay
  GENERIC MAP (
    c_family          => c_family,
    c_xdevicefamily   => c_xdevicefamily,
    c_elaboration_dir => c_elaboration_dir,
    bus_width         => symbol_width,
    clk_delay         => c_num_channels-1,
    memstyle          => dist_mem,
    c_has_ce          => c_has_ce)
  PORT MAP (
    din  => sout_tmp,
    clk  => clk,
    ce   => ce,
    dout => sout);


END synth;






-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/syndrome.vhd,v 1.5 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : syndrome
-- Function : Generic RS Decoder syndrome calculator
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;
use rs_decoder_v9_0_12.dec_pkg.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;


--------------------------------------------------------------------------------
--
-- Port: ce
--   Input, general clock enable, used for output logic.
--
-- Port: slow_ce
--   Input, general clock enable. This used to be enabled once every <C_CLKS_PER_SYM>
--   cycles, but now that <C_CLKS_PER_SYM> is obsolete, it is just the same as <ce>.
--
-- Port: input_pipe_ce
--  Input, clock enable high when input processing is enabled, i.e. when a valid sample
--  is on <din> or PISO is to be loaded.
--
-- Port: input_chan_ce
--  Input, clock enable high when input processing is enabled and the input channel
--  counter is on the last channel.
--
-- Port: sync
--   Input. The sync input must be provided with a signal which is high for the
--   duration of the first <C_NUM_CHANNELS> data symbols and then low for the
--   remainder of the block.
--
-- Port: synd_piso_full
--  Output, high when Syndrome unit PISO is full
--
-- Port: load_piso_pending
--  Output, high when Syndrome unit is waiting to load its PISO or is actively loading
--  its PISO. The Syndrome unit is not ready for new data if <load_piso_pending> = '1'
--  and <synd_piso_full> = '1'
--
-- Port: sout
--  Output, syndromes are shifted out on sout
--
-- Port: done_p1
--  Output, 1 clock cycle pulse just before done goes high. It is used in the BMA unit to reset the channel
--  counter. The BMA channel counter needs to be reset to 0, ready for "start_bma", as it is used  immediately.
--  Only used if C_NUM_CHANNELS > 1.
--
-- Port: done
--  Output, pulsed high for 1 clock cycle coincident with the first syndrome appearing on <sout>.
--

entity syndrome is
  generic (
    C_FAMILY                : string;
    C_XDEVICEFAMILY         : string;
    C_NUM_PUNC_PATTERNS     : integer;
    C_PUNCTURE_SELECT_FILE  : string;
    C_PUNCTURE_VECTOR_FILE  : string;
    C_MEM_INIT_PREFIX       : string;
    C_ELABORATION_DIR       : string;
    C_MEM_STYLE             : integer;
    C_PROC_DELAY            : integer;
    C_POLYNOMIAL            : integer;
    C_SYMBOL_WIDTH          : integer;
    C_PUNC_SEL_WIDTH        : integer;
    C_N                     : integer;
    C_K                     : integer;
    C_GEN_START             : integer;
    C_H                     : integer;
    C_CLKS_PER_SYM          : integer;
    C_SPEC                  : integer;
    C_NUM_CHANNELS          : integer;
    C_HAS_ERASE             : integer;
    C_HAS_N_IN              : integer;
    C_HAS_R_IN              : integer;
    C_R_WIDTH               : integer;
    C_HAS_CE                : boolean;
    C_HAS_SCLR              : boolean
  );
  port (
    ce                : in  std_logic;
    slow_ce           : in  std_logic;
    input_pipe_ce     : in  std_logic;
    input_chan_ce     : in  std_logic;
    clk               : in  std_logic;
    last_din          : in  std_logic;
    din               : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_in              : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in              : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    erase_init_coeff  : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    bma_ready         : in  std_logic;
    erase             : in  std_logic := '0'; -- optional pin
    sync              : in  std_logic;
    sclr              : in  std_logic := '0'; -- optional pin
    punc_sel          : in  std_logic_vector(bitsneededtorepresent(C_NUM_PUNC_PATTERNS-1)-1 downto 0);
    erase_poly        : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_out             : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_out             : out std_logic_vector(C_R_WIDTH-1 downto 0);
    num_erase         : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    synd_piso_full    : out std_logic;
    load_piso_pending : out std_logic;
    sout              : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    done_p1           : out std_logic := '0';
    done              : out std_logic := '0'
  );
end syndrome;


--------------------------------------------------------------------------------
architecture synth of syndrome is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant multi_channel : boolean := (C_NUM_CHANNELS > 1);

  constant has_puncturing : boolean := (C_NUM_PUNC_PATTERNS > 0);

  constant erase_or_puncture : integer := boolean'pos(C_HAS_ERASE/=0 or has_puncturing);


  constant c_has_ce_int : integer := boolean'pos(C_HAS_CE);

  -- slow_ce always required as it is used to stall input pipeline when tvalid is low
  constant c_has_slow_ce_int : integer := 1;
  constant c_has_slow_ce     : boolean := true;

  -- <synd_ce> is used as slow_ce in scells to hold syndromes stable until PISO is unloaded.
  constant c_has_synd_ce : integer := 1;

  -- Clock enable for registers enabled once every C_NUM_CHANNELS cycles
  constant c_has_chan_ce : integer := 1;

  -- Variable r mode has same timing as variable n
  constant c_has_n_or_r_in : integer := boolean'pos(C_HAS_N_IN/=0 or C_HAS_R_IN/=0);


  -- PISO always has a ce now, because it must hold its contents if BMA is not ready
  constant c_has_piso_ce : integer := 1;

  constant ccsds_int : integer := boolean'pos(C_SPEC = ccsds_spec);

  constant c_has_sclr_int : integer := boolean'pos(C_HAS_SCLR);


  -- Codeword parameters
  constant r_const   : integer  := C_N-C_K;
  constant r_minus_1 : integer  := r_const-1;
  constant t_const   : integer  := r_const/2; -- trunc towards 0

  -- Always assume there are an even number of syndromes if no erasure support
  constant r_even         : integer := select_val(2*t_const, r_const, erase_or_puncture);
  constant r_even_minus_1 : integer  := r_even-1;
  constant n_minus_1      : integer  := C_N-1;
  constant n_minus_2      : integer  := C_N-2;
  constant n_minus_3      : integer  := C_N-3;

  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH-1;
  subtype symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);

  subtype r_type is std_logic_vector(C_R_WIDTH-1 downto 0);

  type symbol_array_type is array (0 to r_minus_1) of symbol_type;


  ------------------------------------------------------------------------------
  -- Function for debugging
  --
  -- coverage off
  function display_int(i0, i1, i2, i3, i4, i5 : integer) return integer is
  begin
     assert false
       report  new_line &
               "Syndrome display_int i0 = " & x_to_string(i0) & new_line &
               "Syndrome display_int i1 = " & x_to_string(i1) & new_line &
               "Syndrome display_int i2 = " & x_to_string(i2) & new_line &
               "Syndrome display_int i3 = " & x_to_string(i3) & new_line &
               "Syndrome display_int i4 = " & x_to_string(i4) & new_line &
               "Syndrome display_int i5 = " & x_to_string(i5) & new_line &
               new_line
       severity note;
    return 1;
  end display_int;
  -- coverage on

  ------------------------------------------------------------------------------

  ------------------------------------------------------------------------------
  -- Create galois field array
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gfasm2 : integer := gfas - 2;

  -- gf(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

  -- Get the 1st 2*C_SYMBOL_WIDTH elements from alpha_to as they are all that
  -- gf multipliers need
  constant alpha_to_short : integer_array_type(0 to 2*C_SYMBOL_WIDTH-1) := alpha_to(0 to 2*C_SYMBOL_WIDTH-1);

  ------------------------------------------------------------------------------
  -- Calculate the fixed coefficient values for the constant gf multipliers
  --
  type coeff_array_type is array(0 to r_even_minus_1) of integer;
  constant gf_max : integer := 2**C_SYMBOL_WIDTH - 1;

  function calc_coeff_array(c_gen_start, h : integer) return coeff_array_type is
    constant start  : integer := c_gen_start rem gf_max;
    variable coeffs : coeff_array_type;
  begin
    --report "syndrome:calc_coeff_array:" & new_line
    --severity note;

    for ri in start to (start + r_even_minus_1) loop
      coeffs(ri - start) := alpha_to((h*ri) rem gf_max);
      --report " coeffs(" & integer'image(ri - start) & ") = alpha_to(" & integer'image(h*ri) & ") = " &
      --       integer'image(coeffs(ri-start))
      --severity note;
    end loop; -- ri

    return coeffs;
  end calc_coeff_array;


  constant coeff_array : coeff_array_type := calc_coeff_array(C_GEN_START, C_H);


  ------------------------------------------------------------------------------
  constant chan_count_width : integer := bitsneededtorepresent(C_NUM_CHANNELS-1);

  constant sym_cnt_width_fixed_n : integer := bitsneededtorepresent(n_minus_1);

  constant sym_cnt_width_variable_n : integer := C_SYMBOL_WIDTH;

  constant sym_cnt_width : integer := select_val(sym_cnt_width_fixed_n,
                                                 sym_cnt_width_variable_n,
                                                 c_has_n_or_r_in);


  constant sym_cnt_zeroes : std_logic_vector(sym_cnt_width-1 downto 0) := (others=>'0');



  ------------------------------------------------------------------------------
  -- Constants to derive PISO control signals
  --

  -- Number of symbol periods from last symbol being sampled to piso being loaded.
--  constant last_sym_to_load_piso_delay : integer := 2;

  -- This is the number of clock cycles that piso_full_p1 must go low before
  -- piso_full in order to generate "ready". This should be 2 symbol periods.
--  constant last_sym_to_load_piso_cycles : integer := last_sym_to_load_piso_delay;

  -- Add an extra clock cycle if C_HAS_ERASE to allow time to shift
  -- erasure polynomial into BMA unit. This takes 1 cycle longer than time
  -- to shift syndromes into BMA.
  --constant erase_poly_delay : integer := boolean'pos(erase_or_puncture /= 0); -- doesn't work see cr207600
  constant erase_poly_delay : integer := bool_to_int(erase_or_puncture /= 0);

  -- Subtract 1 if ccsds. this is because syndrome unit is started 1
  -- symbol period later in this case so "ready" must go go high one symbol
  -- period earlier.
  constant ccsds_delay : integer := ccsds_int;

  -- Total delay from "start_bma" to "start_bma_del" must always be (r-2) clock cycles.
  -- Add an extra symbol period if multi-channel as <piso_full> must stay high until PISO
  -- is completely emptied.
  constant total_delay : integer := erase_poly_delay + r_const-2 + bool_to_int(multi_channel);

  constant start_bma_del_delay : integer := select_val_b(total_delay, 0, (total_delay<0));


  ------------------------------------------------------------------------------
  -- Signal declarations
  --
  signal first_syndrome         : std_logic := '0';
  signal done_p1_tmp            : std_logic := '0';
  signal int_ce                 : std_logic := '0';
  signal int_sr                 : std_logic := '0';
  signal load_piso_pend         : std_logic := '0';
  signal load_piso_pend_d_in    : std_logic := '0';
  signal load_scell             : std_logic := '0';
  signal load_piso              : std_logic := '0';
  signal load_piso_d_in         : std_logic := '0';
  signal load_piso_del          : std_logic := '0';
  signal load_piso_del_vec      : std_logic_vector(0 downto 0) := (others => '0');
  signal load_piso_vec          : std_logic_vector(0 downto 0) := (others => '0');
  signal n_out_tmp              : symbol_type := (others => '0');
  signal output_chan_ce         : std_logic := '0';
  signal output_chan_count      : std_logic_vector(chan_count_width-1 downto 0) := (others => '0');
  signal output_chan_count_tc   : std_logic := '0'; -- terminal count
  signal piso_full              : std_logic := '0';
  signal piso_ce                : std_logic := '0';
  signal piso_ce_tmp            : std_logic := '0';
  signal piso_full_d_in         : std_logic := '0';
  signal r_out_tmp              : r_type := (others => '0');
  signal sin                    : symbol_array_type := (others => (others => '0'));
  signal start_bma              : std_logic := '0';
  signal start_bma_del          : std_logic := '0';
  signal start_bma_del_vec_in   : std_logic_vector(0 downto 0);
  signal start_bma_del_vec_out  : std_logic_vector(0 downto 0);
  signal start_bma_pend         : std_logic := '0';
  signal start_bma_pend_d_in    : std_logic := '0';
  signal synd_ce                : std_logic := '0';


--------------------------------------------------------------------------------
-- Beginning of architecture body.
--------------------------------------------------------------------------------
begin

  ceg1 : if C_HAS_CE generate
    int_ce <= ce;
  end generate; -- ceg1

  ceg2 : if not(C_HAS_CE) generate
    int_ce <= '1';
  end generate; -- ceg2


  srg1 : if C_HAS_SCLR generate
    int_sr <= sclr;
  end generate; -- srg1

  srg2 : if not(C_HAS_SCLR) generate
    int_sr <= '0';
  end generate; -- srg2


  ------------------------------------------------------------------------------
  -- Primary outputs
  load_piso_pending <= load_piso_pend;

  n_out <= n_out_tmp;
  r_out <= r_out_tmp;


  ------------------------------------------------------------------------------
  -- Generate <synd_ce>
  --
  -- Input section is only enabled when there is a valid sample on the inputs
  -- or the PISO is being loaded.
  -- Need to hold syndrome values if input_tready is low because we don't want
  -- them over-written until they have been safely loaded into the PISO.
  synd_ce <= input_pipe_ce;


  ------------------------------------------------------------------------------
  -- Generate 'load_scell'.
  -- <sync> is high for <C_NUM_CHANNELS> cycles in order to load values for all channels.
  load_scell <= sync;

  done_p1 <= done_p1_tmp;

  synd_piso_full <= piso_full;



  ----------------------------------------------------------------------------
  -- Instantiate erasure unit
  --
  eg : if C_HAS_ERASE /= 0 generate

    -- Note that "synd_ce" is used for "slow_ce" input. This prevents
    -- the erasure polynomial and counter from changing if "erase" is
    -- held high in between blocks when the polynomial, etc are being
    -- held in the first registers, waiting for the PISO to become free.
    eu: erasure
    generic map (
      C_FAMILY            => C_FAMILY,
      C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
      C_ELABORATION_DIR   => C_ELABORATION_DIR,
      C_CLKS_PER_SYMBOL   => C_CLKS_PER_SYM,
      C_POLYNOMIAL        => C_POLYNOMIAL,
      C_SYMBOL_WIDTH      => C_SYMBOL_WIDTH,
      C_N                 => C_N,
      C_K                 => C_K,
      C_H                 => C_H,
      C_HAS_CE            => c_has_piso_ce,
      C_HAS_SLOW_CE       => c_has_synd_ce,
      C_HAS_N_IN          => C_HAS_N_IN,
      C_HAS_R_IN          => C_HAS_R_IN,
      C_NUM_CHANNELS      => C_NUM_CHANNELS
    )
    port map (
      ce            => piso_ce,
      load_piso     => load_piso,
      start         => load_scell,
      erase         => erase,
      clk           => clk,
      chan_ce       => input_chan_ce,
      slow_ce       => synd_ce,
      init_coeff    => erase_init_coeff,
      erase_poly    => erase_poly,
      num_erase     => num_erase
    );

  end generate; -- eg

  -- Puncture module and erasure module are mutually exclusive. They both generate erase_poly and num_erase.
  -- The puncture module does it with a fixed look-up table.
  pg1 : if has_puncturing generate
    signal output_puncture_ce : std_logic := '0';
  begin

    pu1 : puncture
    generic map (
      C_FAMILY               => C_FAMILY,
      C_XDEVICEFAMILY        => C_XDEVICEFAMILY,
      C_NUM_CHANNELS         => C_NUM_CHANNELS,
      C_NUM_PUNC_PATTERNS    => C_NUM_PUNC_PATTERNS,
      C_PUNCTURE_SELECT_FILE => C_PUNCTURE_SELECT_FILE,
      C_PUNCTURE_VECTOR_FILE => C_PUNCTURE_VECTOR_FILE,
      C_MEM_INIT_PREFIX      => C_MEM_INIT_PREFIX,
      C_ELABORATION_DIR      => C_ELABORATION_DIR,
      C_PUNC_SEL_WIDTH       => C_PUNC_SEL_WIDTH,
      C_CLKS_PER_SYM         => C_CLKS_PER_SYM,
      C_POLYNOMIAL           => C_POLYNOMIAL,
      C_SYMBOL_WIDTH         => C_SYMBOL_WIDTH,
      C_MEM_STYLE            => C_MEM_STYLE,
      C_N                    => C_N,
      C_K                    => C_K,
      C_H                    => C_H,
      C_HAS_CE               => c_has_ce_int,
      -- c_has_n_in parameter only affects timing and now fixed N_IN has same timing as variable N_IN
      C_HAS_N_IN             => 1,--c_has_n_or_r_in,
      C_HAS_SLOW_CE          => c_has_slow_ce_int,
      C_HAS_PISO_CE          => c_has_piso_ce
    )
    port map (
      ce            => int_ce,
      slow_ce       => slow_ce,
      piso_ce       => output_puncture_ce,
      sync          => sync,
      start_bma     => start_bma,
      load_piso     => load_piso,
      load_piso_p1  => load_piso_d_in,--load_piso_p1,
      clk           => clk,
      punc_sel      => punc_sel,
      erase_poly    => erase_poly,
      num_erase     => num_erase
    );

    pg2 : if not(multi_channel) generate
    begin
      output_puncture_ce <= piso_ce;
    end generate; -- pg2

    pg3 : if multi_channel generate
    begin
      -- output_chan_count_tc is continuously toggling but don't want puncture
      -- address counter to count during the gap between <load_piso> and <start_bma>
      -- (if there is a gap) so gate with <piso_ce>.
      output_puncture_ce <= piso_ce and output_chan_count_tc;
    end generate; -- pg3

  end generate; -- pg1

  neg : if erase_or_puncture = 0 generate
  begin
    erase_poly <= (others => '0');
    num_erase  <= (others => '0');
  end generate; -- neg


  sin(r_even_minus_1) <= (others => '0');

  --
  -- Instantiate all the syndrome cells except for the least significant cell
  --
  scg : for si in r_even_minus_1 downto 1 generate
  begin
    -- Note ce will sometimes be driven by slow_ce in multi-channel mode
    -- therefore need to force C_HAS_CE high if multi-channel.
    sc: scell
    generic map(
      c_family             => C_FAMILY,
      c_xdevicefamily      => C_XDEVICEFAMILY,
      c_elaboration_dir    => C_ELABORATION_DIR,
      c_num_channels       => C_NUM_CHANNELS,
      c_has_ce             => c_has_piso_ce,
      c_has_slow_ce        => c_has_synd_ce,
      polynomial           => C_POLYNOMIAL,
      symbol_width         => C_SYMBOL_WIDTH,
      constant_coefficient => coeff_array(si),
      alpha_to_short       => alpha_to_short,
      c_enable_rlocs       => 0
    )
    port map(
      ce         => piso_ce,
      slow_ce    => synd_ce,
      clk        => clk,
      sel        => load_scell,
      load       => load_piso,
      din        => din,
      sin        => sin(si),
      sout       => sin(si-1)
    );
  end generate; -- scell_inst

  --
  -- Instantiate the least significant syndrome cell
  --
  sc0: scell
  generic map(
    c_family             => C_FAMILY,
    c_xdevicefamily      => C_XDEVICEFAMILY,
    c_elaboration_dir    => C_ELABORATION_DIR,
    c_num_channels       => C_NUM_CHANNELS,
    c_has_ce             => c_has_piso_ce,
    c_has_slow_ce        => c_has_synd_ce,
    polynomial           => C_POLYNOMIAL,
    symbol_width         => C_SYMBOL_WIDTH,
    constant_coefficient => coeff_array(0),
    alpha_to_short       => alpha_to_short,
    c_enable_rlocs       => 0
  )
  port map(
    ce         => piso_ce,
    slow_ce    => synd_ce,
    clk        => clk,
    sel        => load_scell,
    load       => load_piso,
    din        => din,
    sin        => sin(0),
    sout       => sout
  );


  ------------------------------------------------------------------------------
  -- Control logic
  --



  ------------------------------------------------------------------------------
  -- Specific logic for when n is fixed.
  --
  nig0: if c_has_n_or_r_in = 0 generate
  begin

    n_out_tmp <= n_in;
    r_out_tmp <= r_in;

  end generate; -- nig0






  ------------------------------------------------------------------------------
  -- Generate timing logic for variable n input ("n_in")
  --
  nig1: if c_has_n_or_r_in /= 0 generate

    -- A FIFO is used to store n_in and r_in values
    constant fifo_width_n : integer := select_val(0, C_SYMBOL_WIDTH, C_HAS_N_IN);
    constant fifo_width : integer := select_val(fifo_width_n, fifo_width_n+C_R_WIDTH, C_HAS_R_IN);


    signal fifo_din    : std_logic_vector(fifo_width-1 downto 0) := (others => '0');
    signal fifo_dout   : std_logic_vector(fifo_width-1 downto 0) := (others => '0');
    signal fifo_rd_en  : std_logic := '0';
    signal write_en    : std_logic := '0';
  begin

    ----------------------------------------------------------------------------
    -- Sample N_IN when sync asserted
    --

    -- wr_en and rd_en must be gated with ce.
    -- Use "start_bma" as rd_en. By the time a new start_bma pulse occurs
    -- it is certain that the Chien unit has finished using the FIFO N
    -- output because all the coefficients are shifted in to the Chien
    -- unit before the BMA state machine returns to state 0 (and "bma_ready"
    -- is asserted.
    -- Use same FIFO to store r_in values as well if C_HAS_R_IN
    --
    fig1 : if C_HAS_R_IN = 0 generate
      n_out_tmp  <= fifo_dout;
      r_out_tmp  <= r_in;
      fifo_din   <= n_in;
      fifo_rd_en <= start_bma; -- <start_bma> is already gated with int_ce
    end generate; -- fig1

    fig2 : if C_HAS_R_IN /= 0 generate
      signal r_out_latched : r_type := (others => '0');
    begin

      -- Need to read FIFO earlier than <start_bma> pulse in order to set up
      -- r_in on BMA inputs in time. This is necessary to deal with special
      -- case of r=2. If r_out is not driven until after start_bma pulse
      -- the sm_add counter in the BMA will have already passed its terminal
      -- count value before the BMA can compute r_in-1.
      -- Read FIFO when PISO is loaded and hold.
      -- Transfer output value into r_out_latched register when "bma_ready" is
      -- high.
      fifo_rd_en <= load_piso and slow_ce;


      -- Mux to select FIFO output or latched value. Switches to latched
      -- value as soon as BMA is started. "bma_ready" is high during "start_bma"
      -- pulse so FIFO output is used for the first cycle. It then swtiches to
      -- the latched value for the remainder of the BMA operation.
      fig2a : if C_HAS_N_IN /= 0 generate
        signal n_out_latched : symbol_type := (others => '0');
      begin

        fifo_din(C_SYMBOL_WIDTH-1 downto 0) <= n_in;
        fifo_din(fifo_width-1 downto C_SYMBOL_WIDTH) <= r_in;

        r_out_tmp <= fifo_dout(fifo_width-1 downto C_SYMBOL_WIDTH)
                                                            when bma_ready = '1'
                                                            else r_out_latched;

        n_out_tmp <= fifo_dout(C_SYMBOL_WIDTH-1 downto 0) when bma_ready = '1'
                                                        else n_out_latched;

        -- Latch FIFO output when "bma_ready" = '1'
        -- Don't need to clr this as it is only read when bma_ready=0
        ff14 : rs_reg
        generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>c_has_ce_int)
        port map (
          d    => n_out_tmp,
          clk  => clk,
          ce   => int_ce, -- same as bma_ready
          q    => n_out_latched);

      end generate; -- fig2a

      fig2b : if C_HAS_N_IN = 0 generate
      begin

        fifo_din(fifo_width-1 downto 0) <= r_in;

        r_out_tmp <= fifo_dout(fifo_width-1 downto 0) when bma_ready = '1'
                                                      else r_out_latched;

        n_out_tmp <= n_in;
      end generate; -- fig2b


      -- Latch FIFO output when "bma_ready" = '1'
      -- Don't need to clr this as it is only read when bma_ready=0
      ff15 : rs_reg
      generic map (c_width=>C_R_WIDTH, c_has_ce=>c_has_ce_int)
      port map (
        d    => r_out_tmp,
        clk  => clk,
        ce   => int_ce, -- same as bma_ready
        q    => r_out_latched);

    end generate; -- fig2


    -- Must force dout to all 1's after reset. If it is 0's then this may
    -- cause problems for BMA unit.
    ffo1: rs_sync_fifo
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      c_init_to_1       => 1,
      c_memory_type     => dist_mem, -- cannot use BRAM as we require init to 1
      c_width           => fifo_width,
      c_depth           => 16, -- only need 5 but 16 is min size for FIFO
      c_has_aclr        => 0,
      c_has_sclr        => c_has_sclr_int)
    port map (
      clk   => clk,
      aclr  => '0',
      sclr  => int_sr,
      din   => fifo_din,
      wr_en => write_en,
      rd_en => fifo_rd_en,
      dout  => fifo_dout);



    -- write_en is used to write to FIFO.
    -- Must AND with <synd_ce> as <load_scell> can be held high for multiple cycles if <synd_ce> is low
    write_en <= load_scell and synd_ce;



  end generate; -- nig1


  ----------------------------------------------------------------------------
  -- "load_piso_pend" register
  -- Set when last din sample is on the <din> input, and will therefore be in the scell register on the
  -- next clock cycle.
  -- Reset by last channel value of "load_piso" pulse
  load_piso_pend_d_in <= last_din or
                         (load_piso_pend and not(load_piso_pend and not(piso_full) and load_piso_del));

  lpr1 : rs_reg_bit
  generic map (c_has_ce=>c_has_slow_ce_int, c_has_sclr=>c_has_sclr_int)
  port map (d=>load_piso_pend_d_in, clk=>clk, sclr=>int_sr, ce=>slow_ce, q=>load_piso_pend);



  ------------------------------------------------------------------------------
  -- Generate "load_piso"
  --
--   -- Must be gated with ce because it is used as a FIFO rd_en if C_HAS_R_IN
--   load_piso <= load_piso_pend and not(piso_full) and slow_ce;
--   load_piso_old <= load_piso_pend and not(piso_full);

  -- <load_piso> could be generated combinatorially by simply as load_piso_pend and not(piso_full);
  -- however it is better to register <load_piso> as it is used in several places. This also
  -- provides a one cycle early version of <load_piso> (<load_piso_d_in>), as this is required by
  -- the puncture unit.
  load_piso_d_in <= load_piso_pend_d_in and not(piso_full_d_in);

  lpp1 : process(clk)
  begin
    if rising_edge(clk) then
      if int_sr = '1' then
        load_piso <= '0';
      elsif int_ce = '1' then
        load_piso <= load_piso_d_in;
      end if;
    end if; -- rising_edge(clk)
  end process; -- lpp1





  -- Delay <load_piso> by <C_NUM_CHANNELS>-1 to produce a pulse coincident with last channel
  -- value being loaded.
  ldy1: big_delay
  generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
               bus_width=>1, clk_delay=>C_NUM_CHANNELS-1, memstyle=>dist_mem, c_has_ce=>c_has_slow_ce_int)
  port map (din=>load_piso_vec, clk=>clk, ce=>slow_ce, dout=>load_piso_del_vec);


  load_piso_vec(0) <= load_piso; -- Input to delay line

  -- Take care in use of <load_piso_del>, as it is not reset and can have spurious '1's on it, up
  -- to C_NUM_CHANNELS-1 cycles after a reset. It is only used when <load_piso> is high, so the
  -- SRL delay line should have flushed itself out by then.
  load_piso_del <= load_piso_del_vec(0); -- Output from delay line







  ----------------------------------------------------------------------------
  -- "piso_full"
  --  Set by last channel value of <load_piso> pulse
  --  Reset by <start_bma_del>
  --  <piso_full> goes low just before last syndrome is output. This means the last syndrome
  --  is safely in the final register to be output to the BMA, so it is safe to re-assert
  --  <load_piso> if required.
  --
  -- In multi-channel case, <piso_full> must stay high until PISO is completely emptied.
  --
  -- Goes high at same time as "piso_full_p1". Goes low x cycles after
  -- "piso_full_p1" goes low, where 'x' is the number of cycles from last
  -- symbol being sampled (in syndrome unit) to "load_piso_pend"
  piso_full_d_in <= (load_piso and load_piso_del) or
                    (not(start_bma_del and output_chan_count_tc) and piso_full);

  pfr1 : rs_reg_bit
  generic map (c_has_ce=>c_has_ce_int, c_has_sclr=>c_has_sclr_int)
  port map (d=>piso_full_d_in, clk=>clk, sclr=>int_sr, ce=>int_ce, q=>piso_full);







  ----------------------------------------------------------------------------
  -- Must enable PISO at full speed as data is shifted out at full clock rate.
  -- Note that piso_ce is higher for 1 cycle longer if C_HAS_ERASE to give
  -- time for all (r+1) erasure polynomial coefficients to be shifted out.
  --
  piso_ce_tmp <= load_piso or start_bma or (not(start_bma_pend) and piso_full);

  piso_ce <= piso_ce_tmp and int_ce;




  ----------------------------------------------------------------------------
  -- Generate "start_bma_pend"
  --
  -- "start_bma_pend" register
  --  Set by last channel value of <load_piso> pulse
  --  Reset by <start_bma> pulse, as <start_bma> is only ever one clock cycle duration,
  --  even in multi-channel mode.
  -- This register must be enabled using the full speed ce because <start_bma> may only be
  -- asserted for a single clock period (because <bma_ready> operates at full speed).
  start_bma_pend_d_in <= (load_piso and load_piso_del) or
                         (start_bma_pend and not(start_bma));

  sbr1 : rs_reg_bit
  generic map (c_has_ce=>c_has_ce_int, c_has_sclr=>c_has_sclr_int)
  port map (d=>start_bma_pend_d_in, clk=>clk, sclr=>int_sr, ce=>int_ce, q=>start_bma_pend);




  -- <start_bma> is used as FIFO read enable as well as to start the BMA algorithm off.
  -- Must AND with int_ce as it is used as FIFO rd_en.
  start_bma <= start_bma_pend and bma_ready and int_ce;


  done <= start_bma;

  mcg10 : if not(multi_channel) generate
    first_syndrome <= start_bma;
  end generate; -- mcg10

  mcg11 : if multi_channel generate
  begin
    -- Generate pulse 1 cycle before start_bma. Cannot do if bma_ready=0.
    -- In this case BMA channel counter must roll over without being reset.
    done_p1_tmp <= load_piso and bma_ready;

    -- SR flip-flop to signal first syndromes for each channel are appearing on output to BMA.
    -- Will not be high for first channel, as this occurs when <start_bma>='1' and this is used
    -- to set this register. It is cleared when the next output_chan_count_tc pulse arrives.
    -- <start_bma> is used to initialize the output channel counter, so <first_syndrome> will
    -- always stay high until the first syndrome for each channel has been output.
    fsp1 : process(clk)
    begin
      if rising_edge(clk) then
        if int_sr = '1' then
          first_syndrome <= '0';
        elsif int_ce = '1' then
          first_syndrome <= start_bma or (first_syndrome and not(output_chan_count_tc));
        end if;
      end if; -- rising_edge(clk)
    end process; -- fsp1

  end generate; -- mcg11





  ----------------------------------------------------------------------------
  -- Delay line to generate "start_bma_del"
  -- "start_bma_del" goes high 1 clock cycle before last syndrome appears
  -- on sout. This is used to reset "piso_full" as the last syndrome
  -- appears on sout.
--   -- In variable r case this delay always assumes the worst case r. This
--   -- can result in the syndrome unit appearing to be full when in fact it
--   -- could be accepting new data. It shouldn't affect ultimate throughput,
--   -- as this is determined by the BMA processing delay unless the minimum r yields
--   -- a processing delay that is less than <start_bma_del_delay>. The throughput
--   -- could be improved in this case by dynamically updating <start_bma_del_delay>
--   -- based on the sampled r_in value. This is not currently implemented.
--   --
--   sbdg1 : if C_HAS_R_IN=0 or C_HAS_N_IN=0 or not(C_HAS_SCLR) or start_bma_del_delay < 3 generate
  sbdg1 : if C_HAS_R_IN=0 generate
  begin

    sbd1 : big_delay
    generic map (instance_name=>"sbd1", c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY,
                 c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>1, clk_delay=>start_bma_del_delay, memstyle=>dist_mem, c_has_ce=>c_has_chan_ce)
    port map (din=>start_bma_del_vec_in, clk=>clk, ce=>output_chan_ce, dout=>start_bma_del_vec_out);

    start_bma_del_vec_in(0) <= first_syndrome;
    -- <start_bma_del> resets <piso_full>. It can have spurious '1's on it after a reset,
    -- until the SRL delay line is flushed out, but this shouldn't matter, as <piso_full>
    -- will not have gone high until after the SRL is flushed out.
    start_bma_del <= start_bma_del_vec_out(0);

  end generate; -- sbdg1

  -- With variable block length and variable number of check symbols, it is possible
  -- for <start_bma_del_delay> to be greater than N_IN. This could mean the start_bma_del
  -- delay line wouldn't be flushed out in time if a small block was started immediately
  -- after a reset. Also, if R is variable, we don't want to always wait for the worst case
  -- R value before de-asserting <piso_full>, as it only takes R cycles to load the syndromes
  -- into the BMA Unit. Use a down counter instead.
  -- Counter is held at 0 by <reset_start_bma_del_count>. <first_syndrome> releases the reset
  -- and also loads the counter with the R_IN value for this block.
  -- Ideally the output of the counter should be compared to 4 to assert <start_bma_del> (and
  -- hence de-assert <piso_full> as soon as possible; however this wouldn't work for R_IN values
  -- less than 4. R_IN can go down to 2, so compare with 2. This will leave <piso_full> asserted
  -- for 2 cycles longer than necessary (1 in erase case), but this shouldn't matter as the BMA
  -- Unit is going to be busy for longer than R_IN+2 cycles anyway and wouldn't be able to take
  -- new syndromes that quickly.
  sbdg2 : if C_HAS_R_IN/=0 generate
    signal start_bma_del_count       : r_type := (others => '0');
    signal reset_start_bma_del_count : std_logic := '1';
  begin

    sbdp1 : process (clk)
    begin
      if rising_edge(clk) then

        if int_sr = '1' then
          reset_start_bma_del_count <= '1';
          start_bma_del             <= '0';

        elsif output_chan_ce = '1' then

          -- SR flip-flop for <reset_start_bma_del_count>. Reset overrides Set.
          reset_start_bma_del_count <= (reset_start_bma_del_count or start_bma_del) and not(first_syndrome);

          start_bma_del <= GLB_to_std_logic(unsigned(start_bma_del_count) = to_unsigned(2, C_R_WIDTH));

        end if; -- int_sr

      end if; -- rising_edge(clk)

    end process; -- icep0


    -- Loadable down-counter
    -- sclr overrides ce, ce overrides rclr and load, load overrides rclr
    sbdc1 : cntre_d
    generic map (width=>C_R_WIDTH)
    port map (
      din  => r_out_tmp,
      load => first_syndrome,
      rclr => reset_start_bma_del_count,
      sclr => int_sr,
      ce   => output_chan_ce,
      c    => clk,
      cnt  => start_bma_del_count
      );

  end generate; -- sbdg2
--   -- With variable block length and variable number of check symbols, it is possible
--   -- for <start_bma_del_delay> to be greater than N_IN. This could mean the start_bma_del
--   -- delay line wouldn't be flushed out in time if a small block was started immediately
--   -- after a reset. Use a counter instead.
--   -- Counter is held at 0 by <reset_start_bma_del_count>. <first_syndrome> releases the reset.
--   -- The output of the counter is compared to start_bma_del_delay-2 (to allow 1 cycle for
--   -- <reset_start_bma_del_count to be released and another for the <start_bma_del> register),
--   -- so start_bma_del_delay must be >= 3. If it is less than 3 the delay line method can be used,
--   -- because the minimum legal block size is 5 and the delay line is guaranteed to be flushed
--   -- after a reset.
--   sbdg2 : if C_HAS_R_IN/=0 and C_HAS_N_IN/=0 and C_HAS_SCLR and start_bma_del_delay >= 3 generate
--     constant start_bma_del_count_width     : integer := bitsneededtorepresent(start_bma_del_delay);
--     signal start_bma_del_count             : std_logic_vector(start_bma_del_count_width-1 downto 0);
--     signal reset_start_bma_del_count       : std_logic := '1';
--     signal reset_start_bma_del_count_final : std_logic;
--   begin
--
--     sbdp1 : process (clk)
--     begin
--       if rising_edge(clk) then
--
--         if int_sr = '1' then
--           reset_start_bma_del_count <= '1';
--           start_bma_del             <= '0';
--
--         elsif output_chan_ce = '1' then
--
--           -- SR flip-flop for <reset_start_bma_del_count>. Reset overrides Set.
--           reset_start_bma_del_count <= (reset_start_bma_del_count or start_bma_del) and not(first_syndrome);
--
--           start_bma_del <= GLB_to_std_logic(
--             (unsigned(start_bma_del_count) = to_unsigned(start_bma_del_delay-2, start_bma_del_count_width)));
--
--         end if; -- int_sr
--
--       end if; -- rising_edge(clk)
--
--     end process; -- icep0
--
--     -- Ensure <first_syndrome> always resets the counter
--     reset_start_bma_del_count_final <= reset_start_bma_del_count or first_syndrome;
--
--     sbdc1 : cntre_a
--     generic map (
--       width         => start_bma_del_count_width,
--       use_count_to  => false,
--       sync_reset_to => 0,
--       c_family      => C_FAMILY
--       )
--     port map (
--       r    => reset_start_bma_del_count_final,
--       ce   => output_chan_ce,
--       c    => clk,
--       sclr => int_sr,
--       cnt  => start_bma_del_count,
--       tc   => open
--       );
--
--   end generate; -- sbdg2
--


  ------------------------------------------------------------------------------
  --
  -- Channel counter for multi-channel operation
  --

  mcg1 : if not(multi_channel) generate
    output_chan_ce       <= int_ce;
    output_chan_count_tc <= '1';
  end generate; -- mcg1


  mcg2 : if multi_channel generate
  begin


    ----------------------------------------------------------------------------
    -- Output channel counter (<output_chan_count>) is required for the output PISO.
    -- The output shift register might need to shift new syndromes out while the
    -- processing unit is busy with the next block, so <input_chan_ce> cannot be used.
    -- It must be initialized to 1 because we will already be on the 2nd
    -- channel by that time. Note that this means the count sequence will
    -- be x, 1, 2, ... C_NUM_CHANNELS-1, 0, 1, 2, ...
    -- Could use <piso_ce> as clock enable, rather than <int_ce>, to keep power down when
    -- the counter isn't required, however this can leave '1's stuck in SRLs enabled
    -- by <output_chan_ce> (such as the <start_bma_del> SRL) after a reset. Use <int_ce>
    -- so that SRLs are clock enabled after a reset and any left over '1's are shifted out.

    -- 2 channels is a special case as counter can be simplified
    mcg3 : if C_NUM_CHANNELS <= 2 generate
      signal output_chan_count0   : std_logic := '0';
      signal output_chan_count0_d : std_logic := '0';
    begin

      output_chan_count0_d <= not(output_chan_count0) or start_bma; -- Init to 1 on <start_bma>

      -- Reset by <start_bma>, so no reset required
      ccl2 : rs_reg_bit
      generic map (c_has_ce=>1)
      port map (d=>output_chan_count0_d, clk=>clk, ce=>int_ce, q=>output_chan_count0);


      -- If there are only two channels just use chan_count as chan_count_tc.
      -- It is already registered.
      output_chan_count_tc <= output_chan_count0;
      output_chan_count(0) <= output_chan_count0;

    end generate; -- mcg3

    mcg7 : if C_NUM_CHANNELS > 2 generate
      signal output_chan_count_din      : std_logic_vector(chan_count_width-1 downto 0) := (others => '0');
      signal output_chan_count_init_bar : std_logic := '0';
    begin

      -- Channel counter must start counting 0,1,... as soon as start_bma pulse occurs.
      output_chan_count_init_bar <= not(start_bma or output_chan_count_tc);

      -- Instantiate output channel counter
      cc2 : cntre_b
      generic map (c_xdevicefamily=>C_XDEVICEFAMILY, width=>chan_count_width)
      port map(ce=>int_ce, c=>clk, din=>output_chan_count_din, load_bar=>output_chan_count_init_bar,
               cnt=>output_chan_count);

      -- Load with 1, as <start_bma> pulse occurs when counter would have output 0
      output_chan_count_din(0)                           <= start_bma;
      output_chan_count_din(chan_count_width-1 downto 1) <= (others=>'0');


      -- Comparator for output channel count
      cmp3: comp_eq
      generic map (c_family=>C_FAMILY, width=>chan_count_width, comp_val=>C_NUM_CHANNELS-2, c_has_sclr=>1,
                   q_mode=>reg, c_sync_enable=>c_no_override) -- not cleared by int_sclr
      port map (i=>output_chan_count, c=>clk, ce=>int_ce, sclr=>start_bma , o=>open,
                o_reg=>output_chan_count_tc);

    end generate; -- mcg7


    output_chan_ce <= output_chan_count_tc and int_ce;


  end generate; -- mcg2


end synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/csubcell.vhd,v 1.2 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : csubcell
-- Function : Generic RS Decoder Chien Search unit sub-cell
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY csubcell IS
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER;
    gfcx              : gfcx_record_type;
    c_enable_rlocs    : INTEGER
  );
  PORT (
    enable    : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    sel       : IN  STD_LOGIC;
    zero_cout : IN  STD_LOGIC; -- Forces i/p to cout reg to 0
    din       : IN  STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0);
    cout      : OUT STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0)
    );
END csubcell;

--------------------------------------------------------------------------------
ARCHITECTURE synth OF csubcell IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  CONSTANT symbol_width         : INTEGER := gfcx.symbol_width;
  CONSTANT symbol_width_minus_1 : INTEGER := symbol_width-1;
  SUBTYPE  symbol_type IS STD_LOGIC_VECTOR(symbol_width_minus_1 DOWNTO 0);

  CONSTANT multi_channel : BOOLEAN := c_num_channels > 1;

  -- Use reg if multi-channel
  CONSTANT mult_q_mode : INTEGER := select_val_b(no_reg, reg, multi_channel);

  SIGNAL cc          : symbol_type;
  SIGNAL cc_reg      : symbol_type;
  SIGNAL ff          : symbol_type;
  SIGNAL ff_d_in     : symbol_type;
  SIGNAL ff_d_in_tmp : symbol_type;
  SIGNAL mm          : symbol_type;

BEGIN

  --
  -- Instantiate the Galois Field constant coefficient multiplier
  --
  ccm : gfcmul
  GENERIC MAP (
    gfcx   => gfcx,
    q_mode => mult_q_mode)
  PORT MAP (
    reset  => '0',
    enable => enable,
    clk    => clk,
    bb     => ff,
    cc     => cc,
    cc_reg => cc_reg);


  mcg1 : IF NOT(multi_channel) GENERATE
    mm <= cc; -- Unregistered multiplier output

    cout <= mm; -- Final output is just multiplier output
  END GENERATE; -- mcg1


  mcg2 : IF multi_channel GENERATE
    -- Delay line to hold multiplier output for each channel.
    -- Reg in gfcmul accounts for 1 delay stage and reg on mux output
    -- accounts for another so only require c_num_channels-2 stages.
    did : big_delay
    GENERIC MAP (
      c_family          => c_family,
      c_xdevicefamily   => c_xdevicefamily,
      c_elaboration_dir => c_elaboration_dir,
      bus_width         => symbol_width,
      clk_delay         => c_num_channels-2,
      memstyle          => dist_mem,
      c_has_ce          => 1)
    PORT MAP (
      din  => cc_reg,
      clk  => clk,
      ce   => enable,
      dout => mm );

    cout <= mm; -- Final output is delayed multiplier output

  END GENERATE; -- mcg2

  --
  -- Instantiate Chien subcell mux and register
  --
  ff_d_in_tmp <= din WHEN sel = '1' ELSE mm;

  -- Force low when zero_cout asserted
  ff_d_in <= ff_d_in_tmp WHEN zero_cout = '0' ELSE (OTHERS=>'0');

  l0 : rs_reg
  GENERIC MAP (c_width=>symbol_width, c_has_ce=>1, c_has_aclr=>1)
  PORT MAP (d=>ff_d_in, clk=>clk, aclr=>'0', ce=>enable, q=>ff);


END synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/ccell.vhd,v 1.2 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : ccell
-- Function : Generic RS Decoder Chien Search unit cell
--
-- c_has_disable should be set to 1 if c_has_r_in. This will insert a mux to
-- select between the normal sout and sout_d. This is necessary as number of
-- ccells varies depending on r_in and the ms ccell always has to be fed the
-- coefficients from the BMA. The mux select input is controlled by the
-- input_sel input.
-- The input to the csubcell register will also be forced low when disable=1,
-- ensuring this ccell does not contribute to the sum of ccell outputs in the
-- Chien unit.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;

LIBRARY rs_decoder_v9_0_12;
USE rs_decoder_v9_0_12.dec_comps_pkg.ALL;


ENTITY ccell IS
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER;
    c_has_disable     : INTEGER;
    polynomial        : INTEGER;
    symbol_width      : INTEGER;
    alpha_to_short    : integer_array_type;
    coeff1            : INTEGER;
    coeff2            : INTEGER;
    c_enable_rlocs    : INTEGER
  );
  PORT (
    ce        : IN  STD_LOGIC;
    slow_ce   : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    sel       : IN  STD_LOGIC;
    input_sel : IN  STD_LOGIC;
    disable   : IN  STD_LOGIC;
    din       : IN  STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    sout_d    : IN  STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    sout      : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    cout      : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0)
    );
END ccell;

--------------------------------------------------------------------------------
ARCHITECTURE synth OF ccell IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT gfcx1 : gfcx_record_type := gfcx_calc_record(symbol_width,
                                                        polynomial,
                                                        alpha_to_short,
                                                        coeff1);

  CONSTANT gfcx2 : gfcx_record_type := gfcx_calc_record(symbol_width,
                                                        polynomial,
                                                        alpha_to_short,
                                                        coeff2);

  SIGNAL dint        : STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0);
  SIGNAL dint_tmp    : STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0);
  SIGNAL disable_int : STD_LOGIC;
BEGIN


  --
  -- Instantiate the registered Galois Field constant coefficient multiplier
  -- This scales the incoming coefficients to compensate for any code
  -- shortening.
  --
  gm : gfcmul
  GENERIC MAP(
    gfcx           => gfcx1,
    q_mode         => reg)
  PORT MAP(
    reset     => '0',
    enable    => ce,
    clk       => clk,
    bb        => din,
    cc        => OPEN,
    cc_reg    => dint_tmp );


  -- Delay line to hold scaled coefficient value for each channel
  -- These will be shifted into csubcell when load (=sel) is asserted.
  did : big_delay
  GENERIC MAP (
    c_family          => c_family,
    c_xdevicefamily   => c_xdevicefamily,
    c_elaboration_dir => c_elaboration_dir,
    bus_width         => symbol_width,
    clk_delay         => c_num_channels-1, -- reg in gfcmul accounts for 1
    memstyle          => dist_mem,
    c_has_ce          => 1)
  PORT MAP (
    din  => dint_tmp,
    clk  => clk,
    ce   => ce,
    dout => dint );


  -- Output for next cell input
  isg1 : IF c_has_disable = 0 GENERATE
    sout <= dint;
    disable_int <= '0';
  END GENERATE; -- isg1


  -- This is used with variable r_in to drive the din input to the next ls
  -- stage in the shift chain. Select between the output of this stage's
  -- scaling multiplier or the coefficients from the BMA directly if
  -- the next stage is the ms stage for the current r_in value.
  isg2 : IF c_has_disable /= 0 GENERATE
    disable_int <= disable;

    sout <= dint WHEN input_sel = '0' ELSE sout_d;
  END GENERATE; -- isg2



  --
  -- Instantiate Chien subcell
  --
  cs : csubcell
  GENERIC MAP(
    c_family          => c_family,
    c_xdevicefamily   => c_xdevicefamily,
    c_elaboration_dir => c_elaboration_dir,
    c_num_channels    => c_num_channels,
    gfcx              => gfcx2,
    c_enable_rlocs    => c_enable_rlocs
  )
  PORT MAP(
    enable    => slow_ce,
    clk       => clk,
    sel       => sel,
    zero_cout => disable_int,
    din       => dint,
    cout      => cout
  );

END synth;





-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/chien.vhd,v 1.6 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : chien
-- Function : Generic RS Decoder Chien Search unit
--------------------------------------------------------------------------------

-- Latency of Chien Unit is t+3 cycles (r+3 if erasures are supported)

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.dec_comps_pkg.all;

--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- The following Ports are provided:

-- start             : Single clock cycle pulse to indicate that 1st locator
--                     coeff is on err_loc.
-- start_p1          : Single clock cycle pulse occurring 1 cycle prior to
--                     start.
-- start_p2          : Single clock cycle pulse occurring 2 cycles prior to
--                     start.
-- err_loc_eval      : Current evaluaton value for the error locator
-- err_loc_diff_eval : Current evaluation value for the differentiated
--                     error locator
-- err_eval_eval     : Current evaluation value for the error evaluator
-- loc_deg_out       : Retimed version of the locator degree, as provided
--                     by the Berlekamp-Massey unit. This is updated coincident
--                     with the evaluation results for the first symbol in each
--                     block.
-- erase_cnt_out     : Retimed version of erasure count, as provided by BMA.
-- chien_ready       : Signal that it is safe to assert start_p2, as Chien
--                     input shift register is at most 2 clock cycles away from
--                     being empty.
-- done              : High for the evaluation results for the first symbol in
--                     each block, low otherwise.
-- done_p1           : Goes high 1 slow cycle before "done". This is only
--                     used in multi-channel mode to reset the Forney channel
--                     counter.
-- last_value        : Signals last values for current block on outputs. Only
--                     generated if c_has_n_or_r_in.
-- last_value_p1     : This is high for the symbol period immediately before <last_value>
--                     is asserted.

entity chien is
  generic (
    C_POLYNOMIAL           : integer;
    C_SYMBOL_WIDTH         : integer;
    C_NUM_CHANNELS         : integer;
    C_N                    : integer;
    C_K                    : integer;
    C_H                    : integer;
    C_GEN_START            : integer;
    C_HAS_INFO_END         : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_R_WIDTH              : integer;
    C_DEFINE_LEGAL_R_VALS  : integer;
    C_NUM_LEGAL_R_VALUES   : integer;
    C_LEGAL_R_VECTOR_FILE  : string;
    C_HAS_CE               : integer;
    C_HAS_ERASE            : integer;
    C_HAS_SCLR             : integer;
    C_CLKS_PER_SYM         : integer;
    C_MEMSTYLE             : integer;
    C_FAMILY               : string;
    C_MEM_INIT_PREFIX      : string;
    C_ELABORATION_DIR      : string;
    C_XDEVICEFAMILY        : string
  );
  port (
    start             : in  std_logic;
    start_p1          : in  std_logic;
    start_p2          : in  std_logic;
    erase_cnt_in      : in  std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0) := (others=>'0');
    err_loc           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval          : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    loc_deg_in        : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    n_in              : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_in_latched      : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in_latched      : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    clk               : in  std_logic;
    ce                : in  std_logic := '1';
    slow_ce           : in  std_logic := '1';
    sclr              : in  std_logic := '0';
    erase_cnt_out     : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    err_loc_eval      : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_loc_diff_eval : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval_eval     : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    loc_deg_out       : out std_logic_vector(C_R_WIDTH-1 downto 0);
    chien_ready       : out std_logic;
    done              : out std_logic;
    done_p1           : out std_logic;
    last_info         : out std_logic;
    last_value        : out std_logic;
    last_value_p1     : out std_logic
  );
end chien;


--------------------------------------------------------------------------------
architecture synth of chien is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Variable R mode has same timing as variable N
  constant c_has_n_or_r_in : integer := bool_to_int(C_HAS_N_IN/=0 or C_HAS_R_IN/=0);

  -- c_enable_rlocs no longer supported
  constant c_enable_rlocs : integer := 0;

  constant multi_channel : boolean := C_NUM_CHANNELS > 1;

  -- Use this for registers that need slow rate clock enable
  -- Must always provide clock enable because output pipe can be stalled if tready=0
  -- on core top level output.
  constant c_has_slow_ce : integer := 1;

  constant chan_count_width : integer := bitsneededtorepresent(C_NUM_CHANNELS-1);


  -- Codeword parameters
  constant r_const    : integer := C_N-C_K;
  constant num_coeffs : integer := select_val(r_const/2, r_const, C_HAS_ERASE);
  constant nc_minus_1 : integer := num_coeffs-1;


  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH-1;
  subtype  symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);

  constant loc_deg_width           : integer := C_R_WIDTH;
  constant loc_deg_width_minus_1   : integer := loc_deg_width-1;

  constant erase_cnt_width         : integer := bitsneededtorepresent(C_N);
  constant erase_cnt_width_minus_1 : integer := erase_cnt_width - 1;

  ------------------------------------------------------------------------------
  -- Galois Field constants
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gf_max : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;

  -- Use H rem gf_max in GF power calculations to avoid going above 2^31
  -- For example alpha((H * a * b) rem gf_max)), H * a * b may be > 2^31 so it
  -- will not work in VHDL.
  -- It is a mathematical property that (a * b) rem c = ((a rem c) * b) rem c
  -- so we can use H rem gf_max instead of H to avoid going over the maximum
  -- vhdl integer value.
  constant h_rem : integer := C_H rem gf_max;

  ------------------------------------------------------------------------------
  -- Create Galois Field array

  -- gf(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

  -- Get the 1st 2*C_SYMBOL_WIDTH elements from alpha_to as they are all that GF multipliers need
  constant alpha_to_short : integer_array_type(0 to 2*symbol_width_minus_1) := alpha_to(0 to 2*symbol_width_minus_1);

  type coeff_array_type is array(natural range <>) of integer;

  ------------------------------------------------------------------------------
  -- Define evaluator arrays
  --
  -- There are 'num_coeffs' evaluator coefficients, therefore there are 'num_coeffs' stages
  type eval_array_type is array (0 to nc_minus_1) of symbol_type;

  -- nc-bit-wide bus forms the input to an adder to generate a single bit of err_eval_eval
  subtype eval_add_in_type is std_logic_vector(nc_minus_1 downto 0);

  -- There are <C_SYMBOL_WIDTH> of these busses, as 'C_SYMBOL_WIDTH' adders are required
  type eval_add_array_type is array (0 to symbol_width_minus_1) of eval_add_in_type;

  -- an array of <C_SYMBOL_WIDTH> t-bit busses
  signal eval_add_in : eval_add_array_type := (others => (others => '0'));

  ------------------------------------------------------------------------------
  -- Define locator arrays
  --
  -- There are t+1 locator coefficients, therefore there are t+1 stages
  type loc_array_type is array (0 to num_coeffs) of symbol_type;

  constant n_loc_odd_busses  : integer := (num_coeffs+1)/2;
  constant n_loc_even_busses : integer := 1+((num_coeffs+2)/2);

  -- The even adder adds all the even stage outputs (of which there are
  -- (t+2)/2 rounded down) and the output from the odd adder
  subtype loc_add_in_even_type is std_logic_vector(n_loc_even_busses-1 downto 0);

  -- The odd adder adds all the odd stage outputs (of which there are
  -- (t+1)/2 rounded down)
  subtype loc_add_in_odd_type  is std_logic_vector(n_loc_odd_busses-1
                                                       downto 0);

  -- There are <C_SYMBOL_WIDTH> of these busses, as <C_SYMBOL_WIDTH> adders are required
  type loc_add_array_even_type is array (0 to symbol_width_minus_1) of loc_add_in_even_type;
  type loc_add_array_odd_type  is array (0 to symbol_width_minus_1) of loc_add_in_odd_type;


  -- an array of <C_SYMBOL_WIDTH> ((t+2)/2 + 1)-bit busses
  signal loc_add_in_even : loc_add_array_even_type := (others => (others => '0'));

  -- an array of <C_SYMBOL_WIDTH> ((t+1)/2)-bit busses
  signal loc_add_in_odd : loc_add_array_odd_type := (others => (others => '0'));

  ------------------------------------------------------------------------------
  --
  -- Calculate the coefficient values for the evaluator polynomial
  -- coefficient constant GF multipliers
  --
  impure function calc_eval_array1 return coeff_array_type is
    variable coeff_array : coeff_array_type(0 to 1);
    variable index : integer;
    variable a     : integer;
  begin
    -- If n is variable then the constant coefficient scaling multiplers
    -- are not used. force a to 0 so that multipliers all multiply by
    -- alpha^0 = 1. This will be reduced by gfcmul to no LUTs.
    if c_has_n_or_r_in = 0 then
      a := gf_max-C_N;
    else
      a := 0;
    end if; -- c_has_n_or_r_in

    -- MS stage multiplies by (alpha^(h*a*(nc-1))),
    -- where a=(2^C_SYMBOL_WIDTH)-1-n. only 1 coefficient if 'num_coeffs'=1
    if num_coeffs > 1 then
      coeff_array(1) := alpha_to((h_rem * a * nc_minus_1) rem gf_max);

      -- other stages multiply by (alpha^(-ha))
      index := (-1 * h_rem * a) rem gf_max;
      if (index < 0) then
        index := gf_max + index;
      end if; -- index

      coeff_array(0) := alpha_to(index);
    else
      coeff_array(0) := alpha_to((h_rem * a * nc_minus_1) rem gf_max);
    end if; -- num_coeffs > 1

    return coeff_array;
  end calc_eval_array1;

  --
  -- Calculate the coefficient values for the evaluator evaluator
  -- constant GF multipliers
  --
  impure function calc_eval_array2 return coeff_array_type is
    variable coeff_array : coeff_array_type(0 to nc_minus_1);
  begin

    -- each stage multiplies by (alpha^(hi))
    for i in 0 to nc_minus_1 loop
        coeff_array(i) := alpha_to((h_rem * i) rem gf_max);
    end loop; -- i

    return coeff_array;
  end calc_eval_array2;

  --
  -- Calculate the record parameter values for the locator polynomial
  -- coefficient constant GF multipliers
  --
  impure function calc_loc_array1 return coeff_array_type is
    variable coeff_array : coeff_array_type(0 to 1);
    variable index       : integer;
    variable a           : integer;
    variable ncmgs_x_a   : integer;
  begin
    -- If n is variable then the constant coefficient scaling multiplers
    -- are not used. Force a to 0 so that multipliers all multiply by
    -- alpha^0 = 1. this will be reduced by gfcmul to no LUTs.
    if c_has_n_or_r_in = 0 then
      a := gf_max-C_N;
    else
      a := 0;
    end if; -- c_has_n_or_r_in


    -- Need to compute index := (h_rem * a * (num_coeffs-C_GEN_START)) rem gf_max;
    -- but (h_rem * a * (num_coeffs-C_GEN_START)) can exceed VHDL integer limit.
    -- Can use remainder to keep under VHDL integer limit, as ncmgs_x_a is only used
    -- in an expression where the final result is rem'd with gf_max.
    ncmgs_x_a := ((num_coeffs-C_GEN_START) * a) rem gf_max;
    -- Both h_rem and ncmgs_x_a have been rem'd with gf_max
    index := (h_rem * ncmgs_x_a) rem gf_max;

    if (index < 0) then
      index := gf_max + index;
    end if; -- index

    -- MS stage multiplies by (alpha^(a*(num_coeffs-C_GEN_START))),
    --    where a=(2^C_SYMBOL_WIDTH)-1-n)
    coeff_array(1) := alpha_to(index);

    -- other stages multiply by (alpha^(-ah))
    index := (-1 * (a * h_rem)) rem gf_max;

    if (index < 0) then
      index := gf_max + index;
    end if; -- index

    coeff_array(0) := alpha_to(index);

    return coeff_array;
  end calc_loc_array1;

  --
  -- Calculate the record parameter values for the locator evaluator
  -- constant GF multipliers
  --
  impure function calc_loc_array2 return coeff_array_type is
    variable coeff_array : coeff_array_type(0 to num_coeffs);
    variable index : integer;
  begin
    -- each stage multiplies by (alpha^(h*(i-C_GEN_START)))
    for i in 0 to num_coeffs loop
        index := (h_rem * (i-C_GEN_START)) rem gf_max;

        if (index < 0) then
            index := gf_max + index;
        end if; -- index

        coeff_array(i) := alpha_to(index);
    end loop; -- i

    return coeff_array;
  end calc_loc_array2;



  ------------------------------------------------------------------------------
  constant coeff_eval1 : coeff_array_type(0 to 1)          := calc_eval_array1;
  constant coeff_eval2 : coeff_array_type(0 to nc_minus_1) := calc_eval_array2;
  constant coeff_loc1  : coeff_array_type(0 to 1)          := calc_loc_array1;
  constant coeff_loc2  : coeff_array_type(0 to num_coeffs) := calc_loc_array2;



  ------------------------------------------------------------------------------
  constant r_min : integer := select_val(2, 1, C_HAS_ERASE); -- absolute r_min
  constant t_min : integer := r_min/2;

  constant t_width : integer := C_R_WIDTH-1;

  -- For variable r_in determine how many ccells will be in use when
  -- r_in=min value

  -- Locator polynomial has t+1 or r+1 coeffs => always need 2 ccells
  constant min_num_loc_ccells : integer := select_val(t_min+1, r_min+1, C_HAS_ERASE);

  -- Evaluator polynomial has t or r coeffs => always need 1 ccell
  constant min_num_eval_ccells : integer := select_val(t_min, r_min, C_HAS_ERASE);



  ------------------------------------------------------------------------------
  -- Read legal r values from mif file
  --
  constant legal_r_vector : XBIP_UTILS_integer_vector(0 to C_NUM_LEGAL_R_VALUES-1)
           := get_integer_vector_from_mif((C_HAS_R_IN /= 0 and C_DEFINE_LEGAL_R_VALS /= 0 ),
                                           C_LEGAL_R_VECTOR_FILE,
                                           C_ELABORATION_DIR,
                                           C_NUM_LEGAL_R_VALUES,
                                           mif_width);



  ------------------------------------------------------------------------------
  -- Initialize r_legal_flags array. This is an array with an element
  -- corresponding to each possible r value, from 0 to c_const. If an r value is
  -- legal then its corresponding element is set to 1, otherwise it is 0.
  --
  function set_r_legal_flags return XBIP_UTILS_integer_vector is
    variable r_legal_flags : XBIP_UTILS_integer_vector(0 to r_const);
    variable lrv : integer;
  begin

    -- Assume all r values illegal until proven otherwise
    for i in 0 to r_const loop
      r_legal_flags(i) := 0;
    end loop;

    if C_DEFINE_LEGAL_R_VALS = 0 then

      -- All r values > r_min are legal
      for i in r_min to r_const loop
        r_legal_flags(i) := 1;
      end loop;

    else

      for i in 0 to C_NUM_LEGAL_R_VALUES-1 loop
        lrv := legal_r_vector(i);

        assert false
          report new_line &
                 "legal_r_vector(" & integer'image(i) & ") = " & integer'image(lrv)
          severity note;

        -- coverage off
        -- Check R value is valid
        assert (lrv >= r_min and lrv <= r_const)
          report new_line &
                 "Reed-Solomon Decoder: out of range R value specified in legal_r_vector array."
          severity failure;
        -- coverage on

        r_legal_flags(lrv) := 1;
      end loop; --i

    end if; -- C_DEFINE_LEGAL_R_VALS

    -- uncomment for debugging
    --for i in 0 to r_const loop
    --  assert false
    --    report new_line & "r_legal_flags(" & integer'image(i) & ") = " &
    --           integer'image(r_legal_flags(i))
    --    severity note;
    --end loop; --i

    return r_legal_flags;

  end set_r_legal_flags;


  ------------------------------------------------------------------------------
  -- Count to <num_coeffs>-1 in fixed N case because the terminal count is used to set
  -- <load_pending> and <load> can potentially be set 1 cycle later. In variable N case,
  -- counter is started 2 cycles earlier, so count to <num_coeffs>+1.
  constant dly_cnt_to    : integer := select_val(num_coeffs-1, num_coeffs+1, c_has_n_or_r_in);
  constant dly_cnt_width : integer := bitsneededtorepresent(dly_cnt_to);



  ------------------------------------------------------------------------------
  signal ccell_enable         : std_logic := '0';
  signal ccell_input_sel      : std_logic_vector(num_coeffs downto 0) := (others=>'0');
  signal chien_busy           : std_logic := '0'; -- only used if c_has_n_or_r_in=1
  signal chien_busy_d_in      : std_logic := '0';
  signal chien_ready_d        : std_logic := '0';
  signal chien_ready_q        : std_logic := '0';
  signal disable_ccell        : std_logic_vector(num_coeffs downto 0);
  signal dle                  : symbol_type := (others=>'0');
  signal dly_cnt              : std_logic_vector(dly_cnt_width-1 downto 0);
  signal dly_cnt_sr           : std_logic := '0';
  signal dly_cnt_sr_d_in      : std_logic := '0';
  signal dly_cnt_tc           : std_logic := '0';
  signal done_tmp             : std_logic := '0';
  signal eval_in              : eval_array_type := (others => (others => '0'));
  signal eval_mult            : eval_array_type := (others => (others => '0'));
  signal inp_sreg_en          : std_logic := '0';
  signal input_chan_ce        : std_logic := '0';
  signal input_chan_count     : std_logic_vector(chan_count_width-1 downto 0) := (others=>'0');
  signal input_chan_count_tc  : std_logic := '0'; -- terminal count
  signal int_ce               : std_logic := '0';
  signal int_sclr             : std_logic := '0';
  signal last_value_p2        : std_logic := '0';
  signal load                 : std_logic := '0';
  signal load_d               : std_logic := '0';
  signal load_del             : std_logic := '0';
  signal load_del_vec         : std_logic_vector(0 downto 0) := (others=>'0');
  signal load_vec             : std_logic_vector(0 downto 0) := (others=>'0');
  signal load_enabled         : std_logic := '0';
  signal load_pending         : std_logic := '0';
  signal load_pending_d_in    : std_logic := '0';
  signal loc_in               : loc_array_type := (others => (others => '0'));
  signal loc_mult             : loc_array_type := (others => (others => '0'));
  signal n_in_latched_int     : symbol_type:= (others=>'0');
  signal output_chan_ce       : std_logic := '0';
  signal output_chan_count    : std_logic_vector(chan_count_width-1 downto 0);
  signal output_chan_count_tc : std_logic := '0'; -- terminal count
  signal reset_load_pulse     : std_logic := '0';
  signal scaled_err_eval      : symbol_type:= (others=>'0');
  signal scaled_err_loc       : symbol_type:= (others=>'0');
  signal scnt_eq_1            : std_logic := '0';
  signal scnt_sr              : std_logic := '0';
  signal scnt_sr_d_in         : std_logic := '0';
  signal scnt_tc              : std_logic := '0';
  signal sym_cnt              : symbol_type:= (others=>'0');
  signal var_r                : std_logic_vector(C_R_WIDTH-1 downto 0);
  constant zeroes             : symbol_type := (others=>'0');


  -- Keep <load> to stop it being merged in with ccell LUTs. This can lead to a
  -- higher overall LUT count as <load> requires multiple inputs and the logic
  -- for this is merged into the LUTs in the ccells, preventing the xor gate logic
  -- in the ccells from fitting in a single LUT.
  attribute keep of load : signal is "true";

--------------------------------------------------------------------------------
-- Beginning of architecture body.
--------------------------------------------------------------------------------
begin

  int_sclr     <= sclr;
  int_ce       <= ce;
  ccell_enable <= slow_ce;

  --
  -- For a shortened RS code (n < 2^C_SYMBOL_WIDTH -1) the first Chien
  -- rotation needs to evaluate at alpha^(h * (2^C_SYMBOL_WIDTH)-1-n ). Therefore,
  -- we need to pre-multiply each locator polynomial coefficient by
  -- alpha^(h*(i-C_GEN_START)*((2^C_SYMBOL_WIDTH)-1-n) ), where i is the coefficient
  -- number, ranging from 0 to t.
  --
  -- The evaluator coefficients do not require the 'C_GEN_START' term. This is
  -- only required for the locator to ensure the results of the forney algorithm
  -- are correct for non-zero values of C_GEN_START. the evaluator coefficients
  -- are pre-scaled by alpha^( h*i*((2^C_SYMBOL_WIDTH)-1-n) ), where i is the
  -- coefficient number, ranging from 0 to t-1.
  --
  -- If we let a = (2^C_SYMBOL_WIDTH)-1-n, then since the polynomials emerge
  -- least significant coefficient first, we multiply the incoming locator
  -- coefficient by (alpha^(a*h*(t-C_GEN_START))), then as this value works its
  -- way down the serial/parallel converter, it gets multiplied by a further
  -- alpha^(-ah) at each stage. This means that when the least significant
  -- coefficient reaches the bottom of the converter, it is only multiplied by
  -- (alpha^(ah*(-C_GEN_START)) (multiplied by (alpha^(a*h*(t-C_GEN_START))) then
  -- multiplied t times by alpha^(-ah)). The next coefficient has been
  -- multiplied by an overall factor of alpha^(a*h*(1-C_GEN_START)), etc.
  --
  -- The idea behind doing the scaling and serial/parallel conversion this way
  -- is that the logic for the constant multipliers (polynomial scaling) will be
  -- merged into the same CLBs as used for the registers (serial/parallel
  -- conversion of polynomial coefficients).

  -- The evaluator polynomial is processed in the same way, except the first
  -- multiplication is alpha^(a*h*(t-1)).

  -- If erasures are supported then substitute 'r' for 't' in the above
  -- comments.

  ------------------------------------------------------------------------------
  -- Evaluator evaluator
  --
  nig1 : if c_has_n_or_r_in = 0 generate
    eval_in(nc_minus_1) <= err_eval;
  end generate; -- nig1

  -- In variable n case err_eval is pre-scaled by full variable GF multiplier.
  nig2 : if c_has_n_or_r_in /= 0 generate
    eval_in(nc_minus_1) <= scaled_err_eval;
  end generate; -- nig2


  --
  -- Instantiate the most significant evaluator cell
  --
  -- Note index numbering of disable_ccell(i) input is determined from
  -- locator coefficient number.
  -- If disable_ccell(num_coeffs) = 1 then the ms cell of both the locator
  -- and the evaluator shift chains should be disabled. This is because the
  -- locator has one more coefficient than the evaluator polynomial.
  -- If ccell_input_sel=1 then this cell takes it's input from sout_d
  -- rather than din.
  mse : if num_coeffs > 1 generate

    msc: ccell
    generic map(
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      c_num_channels    => C_NUM_CHANNELS,
      c_has_disable     => C_HAS_R_IN,
      polynomial        => C_POLYNOMIAL,
      symbol_width      => C_SYMBOL_WIDTH,
      alpha_to_short    => alpha_to_short,
      coeff1            => coeff_eval1(1),
      coeff2            => coeff_eval2(nc_minus_1),
      c_enable_rlocs    => c_enable_rlocs
    )
    port map(
      ce        => inp_sreg_en,
      slow_ce   => ccell_enable,
      clk       => clk,
      sel       => load,
      input_sel => ccell_input_sel(num_coeffs),
      disable   => disable_ccell(num_coeffs), -- turn this ccell off?
      din       => eval_in(nc_minus_1),
      sout_d    => eval_in(nc_minus_1), -- driven onto sout if input_sel=1
      sout      => eval_in(nc_minus_1-1),
      cout      => eval_mult(nc_minus_1)
    );
  end generate; -- mse

  --
  -- Instantiate the middle evaluator cells
  --
  mde : if num_coeffs > 2 generate

    ecg : for i in nc_minus_1-1 downto 1 generate

      ec: ccell
      generic map(
        c_family          => C_FAMILY,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_elaboration_dir => C_ELABORATION_DIR,
        c_num_channels    => C_NUM_CHANNELS,
        c_has_disable     => select_val_b(0, C_HAS_R_IN, (i>=min_num_eval_ccells)),
        polynomial        => C_POLYNOMIAL,
        symbol_width      => C_SYMBOL_WIDTH,
        alpha_to_short    => alpha_to_short,
        coeff1            => coeff_eval1(0),
        coeff2            => coeff_eval2(i),
        c_enable_rlocs    => c_enable_rlocs
      )
      port map(
        ce        => inp_sreg_en,
        slow_ce   => ccell_enable,
        clk       => clk,
        sel       => load,
        input_sel => ccell_input_sel(i+1),
        disable   => disable_ccell(i+1),
        din       => eval_in(i),
        sout_d    => eval_in(nc_minus_1), -- driven onto sout if input_sel=1
        sout      => eval_in(i-1),
        cout      => eval_mult(i)
      );
    end generate; -- ecg

  end generate; -- mde

  --
  -- Instantiate the least significant evaluator cell
  --
  ec0: ccell
  generic map(
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    c_num_channels    => C_NUM_CHANNELS,
    c_has_disable     => 0, -- this ccell has no sout
    polynomial        => C_POLYNOMIAL,
    symbol_width      => C_SYMBOL_WIDTH,
    alpha_to_short    => alpha_to_short,
    coeff1            => coeff_eval1(0),
    coeff2            => coeff_eval2(0),
    c_enable_rlocs    => c_enable_rlocs
  )
  port map(
    ce        => inp_sreg_en,
    slow_ce   => ccell_enable,
    clk       => clk,
    sel       => load,
    input_sel => '0', -- not used
    disable   => '0', -- not used
    din       => eval_in(0),
    sout_d    => zeroes, -- not used
    sout      => open,
    cout      => eval_mult(0)
  );


  ------------------------------------------------------------------------------
  -- Locator evaluator
  --
  nig3 : if c_has_n_or_r_in = 0 generate
    loc_in(num_coeffs) <= err_loc;
  end generate; -- nig3

  -- In variable n case err_loc is pre-scaled by full variable GF multiplier.
  nig4 : if c_has_n_or_r_in /= 0 generate
    loc_in(num_coeffs) <= scaled_err_loc;
  end generate; -- nig4


  --
  -- Instantiate the most significant locator cell
  --
  msl: ccell
  generic map(
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    c_num_channels    => C_NUM_CHANNELS,
    c_has_disable     => C_HAS_R_IN,
    polynomial        => C_POLYNOMIAL,
    symbol_width      => C_SYMBOL_WIDTH,
    alpha_to_short    => alpha_to_short,
    coeff1            => coeff_loc1(1),
    coeff2            => coeff_loc2(num_coeffs),
    c_enable_rlocs    => c_enable_rlocs
  )
  port map(
    ce        => inp_sreg_en,
    slow_ce   => ccell_enable,
    clk       => clk,
    sel       => load,
    input_sel => ccell_input_sel(num_coeffs),
    disable   => disable_ccell(num_coeffs),
    din       => loc_in(num_coeffs),
    sout_d    => loc_in(num_coeffs), -- driven onto sout if input_sel=1
    sout      => loc_in(nc_minus_1),
    cout      => loc_mult(num_coeffs)
  );

  --
  -- Instantiate the middle locator cells
  --
  mdl : if num_coeffs > 1 generate

    lcg : for i in nc_minus_1 downto 1 generate

      lc: ccell
      generic map(
        c_family          => C_FAMILY,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_elaboration_dir => C_ELABORATION_DIR,
        c_num_channels    => C_NUM_CHANNELS,
        c_has_disable     => select_val_b(0, C_HAS_R_IN, (i>=min_num_loc_ccells)),
        polynomial        => C_POLYNOMIAL,
        symbol_width      => C_SYMBOL_WIDTH,
        alpha_to_short    => alpha_to_short,
        coeff1            => coeff_loc1(0),
        coeff2            => coeff_loc2(i),
        c_enable_rlocs    => c_enable_rlocs
      )
      port map(
        ce        => inp_sreg_en,
        slow_ce   => ccell_enable,
        clk       => clk,
        sel       => load,
        input_sel => ccell_input_sel(i),
        disable   => disable_ccell(i), -- turn this ccell off?
        din       => loc_in(i),
        sout_d    => loc_in(num_coeffs), -- driven onto sout if input_sel=1
        sout      => loc_in(i-1),
        cout      => loc_mult(i)
      );
    end generate; -- lcg

  end generate; -- mdl

  --
  -- Instantiate the least significant locator cell
  --
  lc0: ccell
  generic map(
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    c_num_channels    => C_NUM_CHANNELS,
    c_has_disable     => 0, -- this ccell must always be present
    polynomial        => C_POLYNOMIAL,
    symbol_width      => C_SYMBOL_WIDTH,
    alpha_to_short    => alpha_to_short,
    coeff1            => coeff_loc1(0),
    coeff2            => coeff_loc2(0),
    c_enable_rlocs    => c_enable_rlocs
  )
  port map(
    ce        => inp_sreg_en,
    slow_ce   => ccell_enable,
    clk       => clk,
    sel       => load,
    input_sel => '0', -- not used
    disable   => '0', -- not used
    din       => loc_in(0),
    sout_d    => zeroes, -- not used
    sout      => open,
    cout      => loc_mult(0)
  );




  -----------------------------------------------------------------------------
  -- Generate disables for ccells in variable r_in case
  --
  -- <disable_ccell> disables the outputs of ccells in the case that r is less
  -- than the maximum, so that their results are not taken into account
  -- during the successive add operation.
  --
  -- disable_ccell(i) is activated in the case that r_in is less than 2i if
  -- no erasures and i if erasures.
  --
  rig1 : if C_HAS_R_IN /= 0 generate
    constant one_or_two : integer := select_val(2, 1, C_HAS_ERASE);
    constant r_legal_flags : XBIP_UTILS_integer_vector(0 to r_const) := set_r_legal_flags;

    signal ccell_input_sel_en    : std_logic := '0';
    signal ccell_input_sel_reg   : std_logic_vector(num_coeffs downto 1) := (others => '0');
    signal disable_ccell_latched : std_logic_vector(num_coeffs downto 1) := (others => '0');
  begin

    -- Enable compare reg as last coeff shifted into input sreg
    ccell_input_sel_en <= dly_cnt_tc and int_ce;

    disable_ccell(0) <= '0'; -- ls ccell is always required
    ccell_input_sel(0) <= '0';

    -- Generate outputs to determine if r_in < 4, 6, 8, etc (no erasures), or
    -- if r_in < 2, 3, 4, 5, 6, 7, 8, etc (if erasures)
    rig1a : for i in 1 to num_coeffs generate

      -- Allow for odd values of r in non-erasure case
      constant disable_ccell_reqd : boolean :=
        (C_HAS_ERASE/=0 and r_legal_flags(i-1)/=0) or
        (C_HAS_ERASE=0 and (r_legal_flags((i-1)*2)/=0 or
                            r_legal_flags((i-1)*2+1)/=0));
    begin

      -- We need to check if the previous cell can be the ms cell to determine
      -- if we require disable_ccell(i), hence use r_legal_flags(i-1). this is
      -- because cell i contains the input select mux for cell i-1 and cell
      -- i's output must be disabled if cell i-1 is the ms cell.
      rig1b : if not(disable_ccell_reqd) generate
        -- If this value of r cannot occur then clone signals from previous
        -- r value
        disable_ccell(i) <= disable_ccell(i-1);
        ccell_input_sel(i) <= '0'; -- input mux in ccell not required
      end generate; -- rig1b

      rig1c : if disable_ccell_reqd generate
        constant cmp_string : string := int_2_logic_string(i*one_or_two, C_R_WIDTH);
      begin

        -- Check if r_in < i * one_or_two
        -- ccell_input_sel is activated based on r_in as it only matters
        -- during the coefficient loading phase.
        -- Registered output is only updated when last coeff is loaded in
        -- to input shift reg and passed on to disable_ccell when load
        -- pulse occurs.
        cmp1 : rs_compare_lt
        generic map (
          c_family   => C_FAMILY,
          c_width    => C_R_WIDTH,
          c_b_value  => cmp_string,
          c_has_a_lt_b => 1,
          c_has_ce     => 1,
          c_has_aclr   => 0, -- don't need to clear reg as it will be re-loaded
          c_has_sclr   => 0) -- prior to use for every new block
        port map (
          a       => r_in_latched,
          ce      => ccell_input_sel_en,
          clk     => clk,
          a_lt_b  => ccell_input_sel(i),
          qa_lt_b => ccell_input_sel_reg(i) );



        -- This reg is updated with disable_ccell when load='1'
        -- This will hold disable_ccell steady for the duration of the chien search.
        rb1 : rs_reg_bit
        generic map (c_has_ce=>C_HAS_CE)
        port map (d=>disable_ccell(i), clk=>clk, ce=>int_ce, q=>disable_ccell_latched(i));


        -- disable_ccell needs to be ready when load pulse occurs, so
        -- select ccell_input_sel_reg during load pulse as disable_ccell_latched
        -- is not updated until load pulse has occured.
        disable_ccell(i) <= ccell_input_sel_reg(i) when load='1' else
                            disable_ccell_latched(i);

      end generate; -- rig1c

    end generate; -- rig1a


  end generate; -- rig1




  rig2 : if C_HAS_R_IN = 0 generate
  begin
    ccell_input_sel <= (others=>'0');
    disable_ccell <= (others=>'0');
  end generate; -- rig2







  ------------------------------------------------------------------------------
  -- The Locator polynomial coefficients are each multiplied by a constant value
  -- each cycle. These (t+1) outputs are summed to form the evaluation value. A
  -- similar structure operates on the t evaluator polynomial coefficients. For
  -- the differentiated locator output, we sum only the odd coefficient
  -- multiplier outputs. Note that this is not the true differentiated locator,
  -- since the odd coefficient outputs are not shifted down one place of
  -- significance (as would occur in proper differentiation). This means that
  -- each differentiated output has been scaled by an extra factor. This factor
  -- (x) is the inverse of the scaling factor defined in the Forney algorithm
  -- when C_GEN_START=0, thereby cancelling out. when C_GEN_START/=0, the prescaling
  -- in the constant coefficient multipliers adjusts the polynomial result so
  -- that the x^(C_GEN_START-1) term in the Forney algorithm is again cancelled
  -- out.
  --
  -- Substitute 'r' for 't' in above if erasures are supported.
  --

  ------------------------------------------------------------------------------
  -- Construct the evaluator adder input busses
  eab : for i in 0 to symbol_width_minus_1 generate

    b : for bit_num in 0 to nc_minus_1 generate
      eval_add_in(i)(bit_num) <= eval_mult(bit_num)(i);
    end generate; -- b

  end generate; -- eab

  -- Instantiate the evaluator adders
  eag : for i in 0 to symbol_width_minus_1 generate
  begin
    ea : gate_xor
    generic map (
      width  => num_coeffs,
      invout => false,
      q_mode => reg)
    port map (
      inp   => eval_add_in(i),
      c     => clk,
      ce    => slow_ce,
      reset => '0',
      o     => open,
      o_reg => err_eval_eval(i));
  end generate; -- eag



  ------------------------------------------------------------------------------
  -- Construct the locator odd adder input busses
  olb : for i in 0 to symbol_width_minus_1 generate

    b : for bit_num in 0 to n_loc_odd_busses-1 generate
      loc_add_in_odd(i)(bit_num) <= loc_mult(2*bit_num + 1)(i);
    end generate; -- b

  end generate; -- olb

  -- Instantiate the locator odd adders
  log : for i in 0 to symbol_width_minus_1 generate
  begin
    lao : gate_xor
    generic map (
      width  => n_loc_odd_busses,
      invout => false,
      q_mode => reg_and_no_reg)
    port map (
      inp   => loc_add_in_odd(i),
      c     => clk,
      ce    => slow_ce,
      reset => '0',
      o     => dle(i),
      o_reg => err_loc_diff_eval(i));
  end generate; -- log



  ------------------------------------------------------------------------------
  -- Construct the locator even adder input busses
  ela : for i in 0 to symbol_width_minus_1 generate

    b : for bit_num in 0 to n_loc_even_busses-2 generate
      loc_add_in_even(i)(bit_num) <= loc_mult(2*bit_num)(i);
    end generate; -- b

    loc_add_in_even(i)(n_loc_even_busses-1) <= dle(i);

  end generate; -- ela

  -- Instantiate the locator even adders
  leg : for i in 0 to symbol_width_minus_1 generate
  begin
    lae : gate_xor
    generic map (
      width  => n_loc_even_busses,
      invout => false,
      q_mode => reg)
    port map (
      inp   => loc_add_in_even(i),
      c     => clk,
      ce    => slow_ce,
      reset => '0',
      o     => open,
      o_reg => err_loc_eval(i));
  end generate; -- leg







  ------------------------------------------------------------------------------
  -- <n_in_latched_int> is loaded into the Chien symbol counter when <load> is asserted
  gn0 : if C_HAS_N_IN = 0 generate
    n_in_latched_int <= int_2_std_logic_vector(C_N, C_SYMBOL_WIDTH);
  end generate; -- gn0
  gn1 : if C_HAS_N_IN /= 0 generate
    n_in_latched_int <= n_in_latched;
  end generate; -- gn1



  ----------------------------------------------------------------------------
  -- Counter to count incoming coefficients from BMA unit
  --
  nig9a : if c_has_n_or_r_in = 0 generate
  begin

   -- If there is only 1 coefficient then counter just has to "count" to 0
   -- i.e. No counter is required and the incoming <start> pulse is used as the
   -- terminal count
   nig9a1 : if dly_cnt_to <= 0 generate

     -- <dly_cnt_tc> is asserted <num_coeffs> cycles after the start pulse. In this case
     -- <num_coeffs> = 1, so just delay start pulse by one cycle to produce <dly_cnt_tc>.
     -- This is used to set <load_pending> one cycle later, giving time for the 2 values
     -- to be shifted in from the BMA.
     ff4 : rs_reg_bit
     generic map (c_has_ce=>1, c_has_sclr=>C_HAS_SCLR)
     port map (d=>start, clk=>clk, sclr=>int_sclr, ce=>input_chan_ce, q=>dly_cnt_tc);

     -- Although there is no counter to reset, <dly_cnt_sr> is still used to control
     -- <inp_sreg_en>. It should go low for one cycle just after the start pulse.
     dly_cnt_sr <= not(dly_cnt_tc);

     dly_cnt <= (others=>'0'); -- not used
   end generate; -- nig9a1


   nig9a2 : if dly_cnt_to > 0 generate
   begin
      -- RS flip-flop to control counter synchronous reset
      --  Set by counter reaching terminal count
      --  Cleared by start. This allows the counter to start counting.
      dly_cnt_sr_d_in <= not(start) and (dly_cnt_tc or dly_cnt_sr);

      ff0 : rs_reg_bit
      generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>C_HAS_SCLR)
      port map (d=>dly_cnt_sr_d_in, clk=>clk, sset=>int_sclr, ce=>input_chan_ce, q=>dly_cnt_sr);


      -- dly_cnt output not used
      c0 : cntre_a
      generic map (width=>dly_cnt_width, use_count_to=>true,
                   count_to=>dly_cnt_to, sync_reset_to=>0, c_family=>C_FAMILY )
      port map (r=>dly_cnt_sr, ce=>input_chan_ce, c=>clk, sclr=>int_sclr,
                cnt=>dly_cnt, tc=>dly_cnt_tc);

   end generate; -- nig9a2

    ----------------------------------------------------------------------------
    -- Generate clock enable for input shift reg
    --
    nig9a3 : if not(multi_channel) generate
    begin
      -- Only enable input shift register when coefficients are actually being shifted in.
      -- This means it will hold the coefficients safely until "load" is asserted.
      inp_sreg_en <= (start or not(dly_cnt_sr)) and int_ce;
    end generate; -- nig9a3

    nig9a4 : if multi_channel generate
    begin
      -- In multi-channel case, have to keep input shift reg enabled at slow rate
      -- during load pulse, as C_NUM_CHANNELS values have to be loaded for each
      -- coefficient, and these must be shifted out of the input shift reg at the
      -- slow_ce rate.
      inp_sreg_en <= slow_ce when load = '1' else ((start or not(dly_cnt_sr)) and int_ce);
    end generate; -- nig9a4

  end generate; -- nig9a


  nig9b : if c_has_n_or_r_in /= 0 generate
    signal dly_cnt_sr_del1 : std_logic  := '0';
  begin

    -- RS flip-flop to control counter synchronous reset
    --  Set by "dly_cnt_tc" pulse.
    --  Cleared by "start_p2". This allows the counter to start counting.
    --  Release reset 2 cycles before "start" in order to have correct scaling
    --  factor ready in time for "start".
    dly_cnt_sr_d_in <= not(start_p2) and (dly_cnt_tc or dly_cnt_sr);

    lr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SCLR)
    port map (d=>dly_cnt_sr_d_in, clk=>clk, ce=>int_ce, sset=>int_sclr, q=>dly_cnt_sr);



    vr3 : if C_HAS_R_IN = 0 generate

      -- Instantiate the counter
      dc1 : cntre_a
      generic map (
        width         => dly_cnt_width,
        use_count_to  => true,
        count_to      => dly_cnt_to,
        sync_reset_to => 0,
        c_family      => C_FAMILY )
      port map (
        r    => dly_cnt_sr,
        ce   => int_ce,
        c    => clk,
        sclr => int_sclr,
        cnt  => dly_cnt,
        tc   => dly_cnt_tc); -- unregistered tc

    end generate; -- vr3


    -- Replace fixed terminal-count counter with a variable one
    vr4 : if C_HAS_R_IN /= 0 generate
      constant dly_cnt_zeroes : std_logic_vector(dly_cnt_width-1 downto 0) := (others => '0');
      -- added default zero assignment to deal with r is a power of 2 -1
      signal max_dly_cnt_m1 : std_logic_vector(dly_cnt_width-1 downto 0) := (others => '0');
      signal dly_cnt_sr_tc  : std_logic := '0';
      signal var_t          : std_logic_vector(t_width-1 downto 0) := (others => '0');
    begin

      var_r <= r_in_latched(C_R_WIDTH-1 downto 0);

      -- Terminal count implemented outside counter if C_HAS_R_IN
      dly_cnt_sr_tc <= dly_cnt_sr or dly_cnt_tc;


      -- Instantiate the counter
      dlc1 : cntre_a
      generic map (
        width    => dly_cnt_width,
        c_family => C_FAMILY )
      port map (
        r    => dly_cnt_sr_tc, -- when count exceeds max_dly_cnt_m1
        ce   => int_ce,
        c    => clk,
        sclr => int_sclr,
        cnt  => dly_cnt,
        tc   => open);


      vr2a : if C_HAS_ERASE = 0 generate
        var_t <= r_in_latched(C_R_WIDTH-1 downto 1); -- t = r/2
        max_dly_cnt_m1(var_t'length-1 downto 0) <= var_t; -- count to t+1
      end generate; -- vr2a

      vr2b : if C_HAS_ERASE /= 0 generate
        max_dly_cnt_m1(var_r'length-1 downto 0) <= var_r; -- count to r+1
      end generate; -- vr2b


      -- Counter rolls over when it exceeds max_dly_cnt_m1
      -- Use gte comparator to save us requirement for an adder to produce num_coeffs+1
      cmp3 : rs_compare_gt_var
      generic map (
        c_family => C_FAMILY,
        c_width  => dly_cnt_width)
      port map (
        a      => dly_cnt,
        b      => max_dly_cnt_m1,
        a_gt_b => dly_cnt_tc);

    end generate; -- vr4

    ----------------------------------------------------------------------------
    -- Generate clock enable for input shift reg.
    --
    -- Disable input shift reg as soon as it is full. This means it
    -- will hold the coefficients safely until "load" is asserted.
    inp_sreg_en <= not(dly_cnt_sr_del1) and not(dly_cnt_sr) and int_ce;

    isff : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SCLR)
    port map (d=>dly_cnt_sr, clk=>clk, ce=>int_ce, sset=>int_sclr, q=>dly_cnt_sr_del1);

  end generate; -- nig9b



  ----------------------------------------------------------------------------
  -- Generate <load> signal to load coefficients from input shift register into the
  -- Chien processing unit

  -- "load_pending" is set by "dly_cnt_tc" for last channel value and reset by
  -- last channel value of "load" (as signaled by load and load_del). It is important
  -- that <load> is gated with slow_ce, as lpr1 register is enabled by <int_ce> and
  -- not <slow_ce>.
  load_pending_d_in <= (load_pending or (dly_cnt_tc and input_chan_count_tc)) and
                       not(load_enabled and load_del);

  lpr1 : rs_reg_bit
  generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SCLR)
  port map (d=>load_pending_d_in, clk=>clk, ce=>int_ce, sclr=>int_sclr, q=>load_pending);



  -- Assert <load> as soon as previous Chien search has completed
  -- "load" is used to generate load_d
  load <= load_pending and not(chien_busy);

  -- Version of <load>, gated with <slow_ce> so that it can be used as a clock enable
  load_enabled <= load_pending and not(chien_busy) and slow_ce;

  -- Single slow_ce cycle pulse to signal end of load pulse
  -- <reset_load_pulse> will be low after a reset, because <load_pending> will be low
  reset_load_pulse <= load_pending and not(chien_busy) and load_del;


  -- Delay <load> by <C_NUM_CHANNELS>-1 to produce a pulse coincident with last channel
  -- value being loaded. Cannot use input_chan_count because it might have been re-synchronized
  -- by a new start pulse.
  ldy1: big_delay
  generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
               bus_width=>1, clk_delay=>C_NUM_CHANNELS-1, memstyle=>dist_mem, c_has_ce=>c_has_slow_ce)
  port map (din=>load_vec, clk=>clk, ce=>slow_ce, dout=>load_del_vec);


  load_vec(0) <= load; -- Input to delay line

  -- Take care in use of <load_del>, as it is not reset and can have spurious '1's on it, up
  -- to C_NUM_CHANNELS-1 cycles after a reset.
  load_del <= load_del_vec(0); -- Output from delay line




  ----------------------------------------------------------------------------
  -- Generate "chien_busy"
  --
  -- "chien_busy" signals that evaluator is still computing values for the previous block.


  -- Detect when <sym_cnt> = 3. <chien_busy> will be reset on the next slow_ce, allowing <load> to
  -- be asserted in the same slow_ce cycle and allowing the coefficients to be loaded just as <sym_cnt>
  -- would have reached 0. This is the earliest they can be loaded without over-writing values from
  -- the previous block.
  cmp2 : comp_eq
  generic map (c_family=>C_FAMILY, width=>C_SYMBOL_WIDTH, comp_val=>3, q_mode=>reg)
  port map (i=>sym_cnt, c=>clk, ce=>output_chan_ce, o=>open, o_reg=>last_value_p2);


  -- RS flip-flop for "chien_busy"
  --  Set by "load" pulse.
  --  Cleared by "last_value_p2". This allows "load" to be asserted as
  --  soon as possible after the previous block finishes.
  chien_busy_d_in <= (chien_busy and not(last_value_p2)) or reset_load_pulse;

  lr3 : rs_reg_bit
  generic map (c_has_ce=>1, c_has_sclr=>C_HAS_SCLR)
  port map (d=>chien_busy_d_in, clk=>clk, ce=>output_chan_ce, sclr=>int_sclr, q=>chien_busy);



  ----------------------------------------------------------------------------
  -- Generate "chien_ready"
  --
  -- "chien_ready" signals BMA unit that it is safe to assert start_p2 and
  -- start the process of shifting coefficients into the chien input shift
  -- register.
  -- RS flip-flop for "chien_ready"
  --  Set by last channel value of "load" pulse as this signals freeing up of the
  --  input shift register. Do not use <reset_load_pulse> directly as the "set"
  --  signal must be gated with <slow_ce> because the <chien_ready> register is
  --  enabled at the full rate. Use "load_enabled and load_del", as <load_enabled>
  --  is already gated with <slow_ce>.
  --  Cleared by "start". This must override the set because it is possible
  --  for "start" and "load" to occur simultaneously.
  --
  -- Cannot set this ahead of load (in anticipation) to allow BMA to start outputting
  -- coefficients asap because the core output might be stalled at any time by tready. This
  -- could result in <chien_ready> being asserted and the BMA starting to shift coefficients in
  -- before the previous coefficients had been loaded from the input shift register.
  chien_ready_d <= (chien_ready_q or (load_enabled and load_del)) and not(start);



  -- Force high on reset
  crr : rs_reg_bit
  generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SCLR)
  port map (d=>chien_ready_d, clk=>clk, sset=>int_sclr, ce=>int_ce, q=>chien_ready_q);

  chien_ready <= chien_ready_q; -- Primary output




  ----------------------------------------------------------------------------
  -- Count the possible roots as they are tried by the Chien Search evaluator.
  -- For variable N it is more efficient to use a down-counter and check for
  -- it reaching a fixed value than to use an up counter and check for it
  -- reaching a variable value.
  -- Counter is held at 0 by the "scnt_sr" RS flip-flop. "load" resets "scnt_sr".
  -- The counter is instantiated here rather than in the Forney unit
  -- because we need to start counting asap.
  --
  cnt1 : cntre_d
  generic map (width=>C_SYMBOL_WIDTH)
  port map (c=>clk, ce=>output_chan_ce, sclr=>int_sclr, rclr=>scnt_sr,
            load=>reset_load_pulse, din=>n_in_latched_int, cnt=>sym_cnt);

  -- RS flip-flop to generate scnt_sr. Set by "scnt_eq_1", reset by "load".
  -- Note cannot use "scnt_tc" to set because "load" can sometimes occur
  -- 1 cycle before "scnt_tc".
  scnt_sr_d_in <= not(reset_load_pulse) and (scnt_eq_1 or scnt_sr);

  lr2 : rs_reg_bit
  generic map (c_has_ce=>1, c_ainit_val=>"1", c_has_sset=>C_HAS_SCLR)
  port map (d=>scnt_sr_d_in, clk=>clk, ce=>output_chan_ce, sset=>int_sclr, q=>scnt_sr);





  ----------------------------------------------------------------------------
  -- Detect when sym_cnt reaches 1
  -- This signals the last value in the evaluator.
  -- Assert "scnt_tc".
  --
  cmp1 : comp_eq
  generic map (c_family=>C_FAMILY, width=>C_SYMBOL_WIDTH, comp_val=>1,
               c_has_sclr=>C_HAS_SCLR, q_mode=>reg_and_no_reg)
  port map (i=>sym_cnt, c=>clk, ce=>output_chan_ce, sclr=>int_sclr, o=>scnt_eq_1, o_reg=>scnt_tc);


  ------------------------------------------------------------------------------
  -- Generate last_* outputs used by Forney in variable N/R modes
  --
  nig7 : if c_has_n_or_r_in /= 0 generate
  begin


    -- "scnt_tc" signals that the final values for the block are currently on the Chien unit outputs.
    -- This is used by Forney unit to derive it's own "scnt_tc".
    last_value    <= scnt_tc;
    last_value_p1 <= scnt_eq_1;


    ----------------------------------------------------------------------------
    -- Detect when sym_cnt reaches r
    -- This signals the last information value in the evaluator.
    -- Assert "last_info".
    ieg1 : if C_HAS_INFO_END /= 0 generate
    begin

      -- Fixed r_in
      ieg2 : if C_HAS_R_IN = 0 generate
        constant r_string : string := int_2_logic_string(r_const, C_SYMBOL_WIDTH);
      begin
        --
        cmp4 : rs_compare
        generic map (
          c_family      => C_FAMILY,
          instance_name => "chien_cmp4",
          c_width       => C_SYMBOL_WIDTH,
          c_b_constant  => 1,
          c_b_value     => r_string,
          c_has_ce      => c_has_slow_ce,
          c_has_sclr    => C_HAS_SCLR,
          c_has_qa_eq_b => 1 )
        port map (
          a       => sym_cnt,
          b       => sym_cnt, -- not used
          clk     => clk,
          ce      => slow_ce,
          sclr    => int_sclr,
          qa_eq_b => last_info);
      end generate; -- ieg2

      -- Variable r_in
      ieg3 : if C_HAS_R_IN /= 0 generate
        signal comp_a     : std_logic_vector(C_SYMBOL_WIDTH downto 0) := (others => '0');
        signal comp_b     : std_logic_vector(C_SYMBOL_WIDTH downto 0) := (others => '0');
        signal rr1_ce     : std_logic := '0';
        signal var_r_reg1 : std_logic_vector(C_R_WIDTH-1 downto 0) := (others => '0');
        signal var_r_reg2 : std_logic_vector(C_R_WIDTH-1 downto 0) := (others => '0');
      begin

        -- Detect when sym_cnt reaches r
        -- This signals the last information value in the evaluator.
        -- Assert "last_info".
        --
        -- Comparator to check if sym_cnt = r_in value. scnt_sr forms the MSB
        -- of the A input and '0' forms the MSB of the B input. This forces
        -- last_info low when scnt_sr=1. This ensures comparison is only done
        -- when var_r is valid
        cmp5 : rs_compare
        generic map (
          c_family      => C_FAMILY,
          instance_name => "chien_cmp5",
          c_width       => C_SYMBOL_WIDTH+1,
          c_has_ce      => c_has_slow_ce,
          c_has_sclr    => C_HAS_SCLR,
          c_has_qa_eq_b => 1 )
        port map (
          a       => comp_a,
          b       => comp_b,
          clk     => clk,
          ce      => slow_ce,
          sclr    => int_sclr,
          qa_eq_b => last_info);

        -- scnt_sr is MSB of A input. This forces comparator output low if scnt_sr = '1'
        comp_a <= scnt_sr & sym_cnt;
        comp_b <= (C_SYMBOL_WIDTH downto C_R_WIDTH=>'0') & var_r_reg2;

        -- Hold var_r steady in a register because it can change before last_info pulse
        -- Register on "start" pulse
        -- Cannot just register on "load" pulse because var_r can change again
        -- before the load pulse occurs. This happens if a subsequent "start"
        -- pulse is coincident with the "load" pulse.
        rr1_ce <= start and int_ce;

        rr1 : rs_reg
        generic map (c_width=>C_R_WIDTH, c_has_ce=>1)
        port map (d=>var_r, clk=>clk, ce=>rr1_ce, q=>var_r_reg1);

        -- Register again on load pulse as it is possible for another "start"
        -- pulse to occur before sym_cnt has counted down to r.
        -- Note - <load_enabled> is already gated with slow_ce
        rr2 : rs_reg
        generic map (c_width=>C_R_WIDTH, c_has_ce=>1)
        port map (d=>var_r_reg1, clk=>clk, ce=>load_enabled, q=>var_r_reg2);

      end generate; -- ieg3

    end generate; -- ieg1

  end generate; -- nig7







  ------------------------------------------------------------------------------
  -- Generate signal for Forney unit to start (="done")
  ------------------------------------------------------------------------------
  --
  dog1 : if not(multi_channel) generate
  begin
    -- Retime load
    ff1 : rs_reg_bit
    generic map (c_has_ce=>c_has_slow_ce, c_has_sclr=>C_HAS_SCLR)
    port map (d=>load, clk=>clk, sclr=>int_sclr, ce=>slow_ce, q=>load_d);

    -- Instantiate final "done" register. This must to be forced low by sclr.
    dff2 : rs_reg_bit
    generic map (c_has_ce=>c_has_slow_ce, c_has_sclr=>C_HAS_SCLR)
    port map (d=>load_d, clk=>clk, sclr=>int_sclr, ce=>slow_ce, q=>done_tmp);

  end generate; -- dog1


  -- Assert "done" for C_NUM_CHANNELS slow cycles as first channel values
  -- appear on Chien unit outputs.
  dog2 : if multi_channel generate
    signal chan_count_tc_del : std_logic := '0';
    signal done_tmp_d_in     : std_logic := '0';
    signal load_d_d_in       : std_logic := '0';

    signal output_chan_count_tc_del : std_logic := '0';
  begin

    -- "load_d" is a 1 slow cycle pulse immediately after "load" goes low.
    -- This is used to generate the "done" pulse and also as a done_p1
    -- signal to initialize the Forney channel counter.
    load_d_d_in <= reset_load_pulse;

    dr1a : rs_reg_bit
    generic map (c_has_ce=>c_has_slow_ce, c_has_sclr=>C_HAS_SCLR)
    port map (d=>load_d_d_in, clk=>clk, ce=>slow_ce, sclr=>int_sclr, q=>load_d);

    ccf : rs_reg_bit
    generic map (c_has_ce=>c_has_slow_ce)
    port map (d=>output_chan_count_tc, clk=>clk, ce=>slow_ce, q=>output_chan_count_tc_del);

    -- RS flip-flop to generate "done". Set as 1st channel's values
    -- are being output. Reset on 1st slow_ce after chan count tc. This
    -- compensates for the 1 slow cycle delay on final outputs.
    done_tmp_d_in <= load_d or (not(output_chan_count_tc_del) and done_tmp);

    dr2a : rs_reg_bit
    generic map (c_has_ce=>c_has_slow_ce, c_has_sclr=>C_HAS_SCLR)
    port map (d=>done_tmp_d_in, clk=>clk, ce=>slow_ce, sclr=>int_sclr, q=>done_tmp);

  end generate; -- dog2



  done    <= done_tmp;
  done_p1 <= load_d;



  ------------------------------------------------------------------------------
  -- Retime error statistics from BMA unit, so they are ready to output at same
  -- time as <done> pulse

  lrg1 : if not(multi_channel) generate
    signal loc_deg_en : std_logic := '0';
  begin
    ----------------------------------------------------------------------------
    -- Use load pulse to load registers.
    -- Cannot wait any later as BMA might change its outputs with a new start pulse.
    loc_deg_en <= load_enabled;

    ----------------------------------------------------------------------------
    -- Retime loc_deg_in
    --
    ff3 : rs_reg
    generic map (c_width=>loc_deg_width, c_has_ce=>1)
    port map(d=>loc_deg_in, clk=>clk, ce=>loc_deg_en, q=>loc_deg_out);


    ----------------------------------------------------------------------------
    -- Retime erase_cnt_in
    --
    erg1 : if C_HAS_ERASE /= 0 generate
    begin
      er1 : rs_reg
      generic map (c_width=>erase_cnt_width, c_has_ce=>1)
      port map (d=>erase_cnt_in, clk=>clk, ce=>loc_deg_en, q=>erase_cnt_out);
    end generate; -- erg1

    ner1 : if C_HAS_ERASE = 0 generate
      erase_cnt_out <= (others=>'0'); -- not used
    end generate; -- ner1


  end generate; -- lrg1


  -- Store values for each channel in a FIFO. Write contents during start pulse.
  -- Read out during start_forney.
  lrg2 : if multi_channel generate
    -- In multi-channel mode FIFOs store the locator degree, etc for each channel. These are loaded
    -- during the start pulse and unloaded for the <done> pulse. There can potentially be another start
    -- pulse before the values are unloaded for the first one, so make FIFO deep enough for two blocks.
    constant stats_fifo_depth : integer := 2 * C_NUM_CHANNELS;

    signal stats_fifo_rd_en : std_logic := '0';
    signal stats_fifo_wr_en : std_logic := '0';
    signal load_delay1      : std_logic := '0';
    signal load_delay1_d_in : std_logic := '0';
  begin

    stats_fifo_wr_en <= start and int_ce;
    stats_fifo_rd_en <= load_delay1 and slow_ce;

    -- Produce a delayed version of the load pulse to read stats from FIFO
    -- Data must be read so that it is on the outputs at same time as <done> pulse
    -- Implement as SR flip-flop,
    --  Set when reset_load_pulse is high, i.e. the end of the load pulse
    --  Reset when output_chan_count_tc is high, i.e. keep high for C_NUM_CHANNELS slow cycles
    load_delay1_d_in <= (load_delay1 and not(output_chan_count_tc)) or reset_load_pulse;

    ldr1 : rs_reg_bit
    generic map (c_has_ce=>c_has_slow_ce, c_has_sclr=>C_HAS_SCLR)
    port map (d=>load_delay1_d_in, clk=>clk, ce=>slow_ce, sclr=>int_sclr, q=>load_delay1);

    ----------------------------------------------------------------------------
    -- Store loc_deg_in
    --
    ffo1: rs_sync_fifo
    generic map (C_FAMILY=>C_FAMILY, C_XDEVICEFAMILY=>C_XDEVICEFAMILY, C_ELABORATION_DIR=>C_ELABORATION_DIR,
                 C_MEMORY_TYPE=>dist_mem, C_WIDTH=>loc_deg_width, C_DEPTH=>stats_fifo_depth, C_HAS_SCLR=>C_HAS_SCLR)
    port map (clk=>clk, sclr=>int_sclr, din=>loc_deg_in, wr_en=>stats_fifo_wr_en, rd_en=>stats_fifo_rd_en,
              dout=>loc_deg_out);

    ----------------------------------------------------------------------------
    -- Store erase_cnt_in
    --
    erg2 : if C_HAS_ERASE /= 0 generate
    begin

      ffo2: rs_sync_fifo
      generic map (C_FAMILY=>C_FAMILY, C_XDEVICEFAMILY=>C_XDEVICEFAMILY, C_ELABORATION_DIR=>C_ELABORATION_DIR,
                   C_MEMORY_TYPE=>dist_mem, C_WIDTH=>erase_cnt_width, C_DEPTH=>stats_fifo_depth, C_HAS_SCLR=>C_HAS_SCLR)
      port map (clk=>clk, sclr=>int_sclr, din=>erase_cnt_in, wr_en=>stats_fifo_wr_en, rd_en=>stats_fifo_rd_en,
                dout=>erase_cnt_out);

    end generate; -- erg2

    ner2 : if C_HAS_ERASE = 0 generate
      erase_cnt_out <= (others=>'0'); -- not used
    end generate; -- ner2

  end generate; -- lrg2












  ------------------------------------------------------------------------------
  -- Instantiate logic to scale incoming coefficients in the variable N case.
  --
  nig5 : if c_has_n_or_r_in /= 0 generate
    -- Lower order address bits tied to n_in iff C_HAS_N_IN, else there is
    -- only one value to be stored for each coefficient
    constant ccr_upper_addr_start : integer := select_val(0, C_SYMBOL_WIDTH, C_HAS_N_IN);

    -- Allow C_SYMBOL_WIDTH bits for lsbs (connected to n_in) + enough
    -- bits to select which coefficient is being scaled.
    constant ccr_addr_width : integer := bitsneededtorepresent(nc_minus_1) + ccr_upper_addr_start;

    -- record for variable coefficient GF multipliers
    constant gfx_mul : gfx_record_type := gfx_calc_record(C_SYMBOL_WIDTH,
                                                          C_POLYNOMIAL,
                                                          false,
                                                          alpha_to_short);

    signal ccr_addra             : std_logic_vector(ccr_addr_width-1 downto 0) := (others => '0');
    signal ccr_addrb             : std_logic_vector(ccr_addr_width-1 downto 0) := (others => '0');
    signal eval_scale_factor     : symbol_type := (others => '0');
    signal loc_scale_factor      : symbol_type := (others => '0');
    signal loc_scale_factor_d_in : symbol_type := (others => '0');
    signal one_val               : symbol_type := (others => '0');
    signal scale_factor_a        : symbol_type := (others => '0');
    signal scale_factor_b        : symbol_type := (others => '0');

  begin

    --------------------------------------------------------------------------
    -- ROM to hold all required coefficient scaling values for all possible
    -- n_in values.
    -- ROM requires n_in to be valid 1 cycle before start_p2
    -- pulse so we use the unlatched n_in value from the Syndrome FIFO.
    --
    -- Note that because dly_cnt counts up to num_coeffs+1 it is possible for
    -- an illegal address to be given to the rom. This results in a warning
    -- from the block mem core but it doesn't matter as the illegal address
    -- occurs after all the rom contents have been read.
    ccr : gf_chien_const_rom
    generic map (
      symbol_width      => C_SYMBOL_WIDTH,
      alpha_to          => alpha_to,
      c_has_n_in        => C_HAS_N_IN,
      h_param           => C_H,
      c_n               => C_N,
      num_coeffs        => num_coeffs,
      gen_start         => C_GEN_START,
      c_has_ce          => C_HAS_CE,
      memstyle          => C_MEMSTYLE,
      c_addr_width      => ccr_addr_width,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_family          => C_FAMILY,
      c_mem_init_prefix => C_MEM_INIT_PREFIX,
      c_elaboration_dir => C_ELABORATION_DIR)
    port map (
      ce     => int_ce, -- full speed ce
      clk    => clk,
      addra  => ccr_addra,
      addrb  => ccr_addrb, -- only used if C_GEN_START > 1
      dout_a => scale_factor_a,
      dout_b => scale_factor_b); -- only used if C_GEN_START > 1



    ----------------------------------------------------------------------------
    -- Connect ROM address busses
    --

    cag1a : if C_HAS_N_IN /= 0 generate
      -- Connect n_in to ROM address LSBs
      cag1 : for i in 0 to symbol_width_minus_1 generate
        ccr_addra(i) <= n_in(i);
        ccr_addrb(i) <= n_in(i);
      end generate; -- cag1
    end generate; -- cag1a


    -- Connect ROM address MSBs
    cag2 : for i in ccr_upper_addr_start to ccr_addr_width-1 generate

      -- For general case hard wire address msbs to 00...01
      cag3 : if C_GEN_START > 1 and i=ccr_upper_addr_start generate
        ccr_addra(i) <= '1';
      end generate; -- cag3
      cag4 : if C_GEN_START > 1 and i/=ccr_upper_addr_start generate
        ccr_addra(i) <= '0';
      end generate; -- cag4

      -- For special case C_GEN_START <= 1 address = dly_cnt
      cag5 : if C_GEN_START <= 1 generate
        ccr_addra(i) <= dly_cnt(i-ccr_upper_addr_start);
      end generate; -- cag4

      ccr_addrb(i) <= dly_cnt(i-ccr_upper_addr_start);
    end generate; -- cag2



    ----------------------------------------------------------------------------
    -- Use ROM output to scale incoming coefficients
    --
    one_val <= int_2_std_logic_vector(1, C_SYMBOL_WIDTH);

    -- Most codes use C_GEN_START = 0 or 1 so make sure we deal with these cases
    -- as efficiently as possible.

    ----------------------------------------------------------------------------
    -- C_GEN_START = 0 special case
    -- Evaluator scale factor is just the locator scale factor delayed
    -- by 1 cycle. This is because evaluator polynomial has one less
    -- coefficient than locator. First coefficient on err_eval input
    -- is a dummy one.
    scg1 : if C_GEN_START = 0 generate

      -- Select alpha^0 (=1) for first coefficient, then select ROM output.
      loc_scale_factor_d_in <= one_val when start_p1 = '1' else scale_factor_a;

      sfm : rs_reg
      generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
      port map (d=>loc_scale_factor_d_in, clk=>clk, ce=>int_ce, q=>loc_scale_factor);



      -- Delay loc_scale_factor by 1 cycle to produce eval_scale_factor
      -- No need to reset this reg
      sfr1 : rs_reg
      generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
      port map (d=>loc_scale_factor, clk=>clk, ce=>int_ce, q=>eval_scale_factor);

    end generate; -- scg1




    ----------------------------------------------------------------------------
    -- C_GEN_START = 1 special case
    -- Evaluator scale factor is identical to the locator scale factor.
    -- First coefficient on err_eval input is a dummy one. This is because
    -- evaluator polynomial has one less coefficient than locator.
    scg2 : if C_GEN_START = 1 generate

      -- Select alpha^0 (=1) for 2nd coefficient, select ROM output for
      -- others.
      loc_scale_factor_d_in <= one_val when start = '1' else scale_factor_a;

      -- No need to reset this reg
      sfm : rs_reg
      generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
      port map (d=>loc_scale_factor_d_in, clk=>clk, ce=>int_ce, q=>loc_scale_factor);

      eval_scale_factor <= loc_scale_factor;

    end generate; -- scg2




    ----------------------------------------------------------------------------
    -- C_GEN_START > 1 general case
    --
    -- In the general case the number of different scale factors required to
    -- cover both the locator and evaluator will generally not fit in a single
    -- block ram. We still get by with a single block ram by storing all the
    -- evaluator scaling values and computing the locator scaling values.
    -- the first locator scaling value = alpha^(ah(0-C_GEN_START)), where
    -- a = gf_max - n. subsequent values are generated by multiplying this
    -- initial value by alpha^(ah) every clock cycle. Thus the second scaling
    -- factor of alpha(ah(1-C_GEN_START)) is generated, etc. alpha^(ah) is
    -- continuously output on the ROM douta port for this purpose.
    -- The ROM doutb port is used to provide the initial locator scaling
    -- value and then the evaluator scaling values: alpha^ah, alpha^2ah, etc.
    --
    scg3 : if C_GEN_START > 1 generate
      signal eval_scale_factor_d_in : symbol_type := (others => '0');
      signal next_loc_scale_factor  : symbol_type := (others => '0');
    begin


      -- Select ROM b output for 1st coefficient, then select muliplier output for the rest.
      loc_scale_factor_d_in <= scale_factor_b when start_p1 = '1'
                                              else next_loc_scale_factor;

      -- No need to reset this reg
      sfm : rs_reg
      generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
      port map (d=>loc_scale_factor_d_in, clk=>clk, ce=>int_ce, q=>loc_scale_factor);



      -- Generate 2nd and subsequent locator scaling values by multiplying
      -- the previous value by alpha^(ah) = ROM a output.
      scg3a : if C_HAS_N_IN /= 0 generate
        gfm3 : gfmul
        generic map (
          c_family          => C_FAMILY,
          c_xdevicefamily   => C_XDEVICEFAMILY,
          c_elaboration_dir => C_ELABORATION_DIR,
          gfx               => gfx_mul,
          q_mode            => no_reg
        )
        port map (
          aa              => loc_scale_factor,
          bb              => scale_factor_a, -- = alpha^(ah)
          cc              => next_loc_scale_factor,
          cc_reg          => open
        );

      end generate; -- scg3a

      scg3b : if C_HAS_N_IN = 0 generate
        constant gfcx1 : gfcx_record_type :=
                    gfcx_calc_record(C_SYMBOL_WIDTH,
                                     C_POLYNOMIAL,
                                     alpha_to_short,
                                     alpha_to(((gf_max-C_N) * h_rem) rem gf_max));
      begin
        gfm4 : gfcmul
        generic map (
          gfcx   => gfcx1,
          q_mode => no_reg)
        port map (
          bb     => loc_scale_factor,
          cc     => next_loc_scale_factor,
          cc_reg => open);

      end generate; -- scg3b



      -- Select alpha^0 (=1) for first evaluator coefficient, then select ROM b output.
      eval_scale_factor_d_in <= one_val when start = '1' else scale_factor_b;

      -- No need to reset this reg
      sfm2 : rs_reg
      generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
      port map (d=>eval_scale_factor_d_in, clk=>clk, ce=>int_ce, q=>eval_scale_factor);

    end generate; -- scg3




    ----------------------------------------------------------------------------
    -- Multiply incoming locator coefficients by locator scale factor for that coefficient.
    gfm1 : gfmul
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      gfx               => gfx_mul,
      q_mode            => no_reg
    )
    port map (
      aa              => loc_scale_factor,
      bb              => err_loc,
      cc              => scaled_err_loc,
      cc_reg          => open
    );


    -- Multiply incoming evaluator coefficients by evaluator scale factor for that coefficient.
    gfm2 : gfmul
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      gfx               => gfx_mul,
      q_mode            => no_reg
    )
    port map (
      aa              => eval_scale_factor,
      bb              => err_eval,
      cc              => scaled_err_eval,
      cc_reg          => open
    );


  end generate; -- nig5






  ------------------------------------------------------------------------------
  --
  -- Multi-channel
  --
  mcg1 : if not(multi_channel) generate
    input_chan_ce        <= int_ce;
    output_chan_ce       <= slow_ce;
    input_chan_count_tc  <= '1';
    output_chan_count_tc <= '1';
  end generate; -- mcg1

  mcg2 : if multi_channel generate
    signal input_chan_count_clr  : std_logic := '0';
    signal output_chan_count_clr : std_logic := '0';
  begin

    ----------------------------------------------------------------------------
    -- Instantiate channel counters
    --
    -- Channel counter keeps track of which channel the current symbol belongs
    -- to. It must be initialized to 0 by start_p1 because it needs to
    -- clear any pending chan_ce from previous counts. This would prematurely
    -- release the Chien counter.
    -- One channel counter (<input_chan_count>) is required for the input shift register,
    -- as this operates at the full <int_ce> clock rate and another (<chan_count>) for
    -- the main Chien processing unit as this operates at the <slow_ce> clock rate.
    -- The input shift register might need to load new coefficients in while the
    -- processing unit is still busy with the previous block, so two channel
    -- counters are required even if C_CLKS_PER_SYM=1.

    -- 2 channels is a special case as counter can be simplified
    mcg3 : if C_NUM_CHANNELS <= 2 generate
      signal input_chan_count0       : std_logic := '0';
      signal input_chan_count0_d_in  : std_logic := '0';
      signal output_chan_count0      : std_logic := '0';
      signal output_chan_count0_d_in : std_logic := '0';
    begin

      input_chan_count_clr  <= start_p1;
      output_chan_count_clr <= reset_load_pulse;

      input_chan_count0_d_in  <= not(input_chan_count0)  and not(input_chan_count_clr);
      output_chan_count0_d_in <= not(output_chan_count0) and not(output_chan_count_clr);

      ccl1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>input_chan_count0_d_in, clk=>clk, ce=>int_ce, q=>input_chan_count0);

      ccl2 : rs_reg_bit
      generic map (c_has_ce=>c_has_slow_ce)
      port map (d=>output_chan_count0_d_in, clk=>clk, ce=>slow_ce, q=>output_chan_count0);


      -- If there are only two channels just use chan_count as chan_count_tc.
      -- It is already registered.
      input_chan_count_tc  <= input_chan_count0;
      input_chan_count(0)  <= input_chan_count0;
      output_chan_count_tc <= output_chan_count0;
      output_chan_count(0) <= output_chan_count0;

    end generate; -- mcg3

    mcg4 : if C_NUM_CHANNELS > 2 generate
      constant pwr_of_2_channels : boolean := is_power_of_two(C_NUM_CHANNELS);
    begin

      -- Don't need to clear with terminal count as counter will just roll over.
      mcg4a : if pwr_of_2_channels generate
        input_chan_count_clr  <= start_p1;
        output_chan_count_clr <= reset_load_pulse;
      end generate; -- mcg4a

      mcg4b : if not(pwr_of_2_channels) generate
        -- Input Channel Counter must start counting 0,1,... as soon as start_bma pulse occurs.
        -- Output Channel Counter must start counting immediately after end of <load> pulse
        input_chan_count_clr  <= start_p1 or input_chan_count_tc;
        output_chan_count_clr <= reset_load_pulse or output_chan_count_tc;
      end generate; -- mcg4b


      -- Instantiate input shift reg channel counter
      cc2 : cntre_a
      generic map(
        width         => chan_count_width,
        use_count_to  => false,
        count_to      => C_NUM_CHANNELS - 1,
        sync_reset_to => 0,
        c_family      => C_FAMILY )
      port map(
        r    => input_chan_count_clr,
        ce   => int_ce,
        c    => clk,
        sclr => int_sclr,
        cnt  => input_chan_count,
        tc   => open ); -- tc handled externally

      -- Instantiate output channel counter
      cc3 : cntre_a
      generic map(
        width         => chan_count_width,
        use_count_to  => false,
        count_to      => C_NUM_CHANNELS - 1,
        sync_reset_to => 0,
        c_family      => C_FAMILY )
      port map(
        r    => output_chan_count_clr,
        ce   => slow_ce,
        c    => clk,
        sclr => int_sclr,
        cnt  => output_chan_count,
        tc   => open ); -- tc handled externally


      -- Comparator for input shift register channel count
      cmp2: comp_eq
      generic map (c_family=>C_FAMILY, width=>chan_count_width, comp_val=>C_NUM_CHANNELS-2, c_has_sclr=>1,
                   q_mode=>reg, c_sync_enable=>c_no_override) -- not cleared by int_sclr
      port map (i=>input_chan_count, c=>clk, ce=>int_ce, sclr=>start_p1, o=>open,
                o_reg=>input_chan_count_tc);

      -- Comparator for output channel count
      cmp3: comp_eq
      generic map (c_family=>C_FAMILY, width=>chan_count_width, comp_val=>C_NUM_CHANNELS-2, c_has_sclr=>1,
                   q_mode=>reg, c_sync_enable=>c_no_override) -- not cleared by int_sclr
      port map (i=>output_chan_count, c=>clk, ce=>slow_ce, sclr=>reset_load_pulse, o=>open,
                o_reg=>output_chan_count_tc);


    end generate; -- mcg4


    input_chan_ce <= input_chan_count_tc and int_ce;

    -- Output channel counter is reset by <reset_load_pulse>, as are all the registers
    -- enabled by <output_chan_ce>, so force <output_chan_ce> high during <reset_load_pulse>
    output_chan_ce <= (output_chan_count_tc or reset_load_pulse) and slow_ce;

  end generate; -- mcg2



end synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/forney.vhd,v 1.5 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: forney
-- Generic RS Decoder Forney unit
-- Latency of Forney Unit is 2 cycles for symbol widths of 8 and 1 cycle for
-- other symbol widths.
--
--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Group: Optional Pins
--        -------------
-- Parameter: C_HAS_CE
--  Set to 1 to turn on optional input <ce>
--
-- Parameter: C_HAS_SR
--  Set to 1 to turn on optional input <ce>
--
-- Parameter: C_HAS_DATA_DEL
--  Set to 1 to turn on optional output <data_del>
--
-- Parameter: C_HAS_ERASE
--  Set to 1 if erasure decoding is required.
--
-- Parameter: C_HAS_ERR_STATS
--  Set to 1 if <bit_err_0_to_1> and <bit_err_1_to_0> outputs are to be provided.
--
-- Parameter: C_HAS_INFO
--  Set to 1 if <m_axis_output_tdata> is to include a bit to flag when output symbols are information
--  data or check symbols.
--
-- Parameter: C_HAS_N_IN
--  Set to 1 to allow code block length, N, to be varied for each new block. Makes core a lot bigger.
--  Determines whether <s_axis_ctrl_tdata> will have an N_IN field or not.
--
-- Parameter: C_HAS_R_IN
--  Set to 1 to allow number of check symbols, R, to be varied for each new block. Makes core a bit bigger
--  than <C_HAS_N_IN> alone. Variable R mode has same timing as variable N.
--  Determines whether <s_axis_ctrl_tdata> will have an R_IN field or not.
--
--
-- Group: Reed-Solomon code word parameters
--        ---------------------------------
-- Parameter: C_K
--  Number of data symbols in a code block. If <C_HAS_N_IN> = 1 this should be set to <C_N> minus the number of
--  check symbols. If <C_HAS_R_IN> = 1, <C_K> should be set such that C_N-C_K equals the largest number of check
--  symbols to be supported.
--
-- Parameter: C_N
--  Total number of symbols (data + check) in a code block. If <C_HAS_N_IN> = 1, this should be set to
--  (2^C_SYMBOL_WIDTH)-1
--
-- Parameter: C_POLYNOMIAL
--  Galois Field polynomial. See <gf_pkg> for more information on this.
--  Supplying a value of 0 will cause the default polynomial for the given symbol width to be selected.
--
-- Parameter: C_SPEC
--  Specification code, used if a predefined code specification is being used that requires special processing.
--  See <gf_pkg> for details of the supported values. Determines whether CCSDS dual-basis ROMs are required.
--  For standard Reed-Solomon codes, this should be set to 0.
--
-- Parameter: C_SYMBOL_WIDTH
--  Galois field symbol size in bits. This is the bus width of the data to be decoded. It must equal the width
--  of the Galois field elements.
--
--
-- Group: Implementation parameters
--        -------------------------
-- Parameter: C_NUM_CHANNELS
--  Input data from multiple channels can be interlaced in the DATA_IN field of <s_axis_input_tdata>.
--  e.g. if there are 3 channels (A,B,C), data is input in the following order:
--  A0,B0,C0,A1,B1,C1,etc. If <C_HAS_N_IN> = 1 or <C_HAS_R_IN> = 1 then <C_NUM_CHANNELS> must equal 1.
--
-- Parameter: C_R_WIDTH
--  Width of <r_in> input
--
-- Parameter: C_MEMSTYLE
--  Tell core whether to use block or distributed memory, or let it decide itself, based on size.
--  - dist_mem  (0) => Do not use any block memories
--  - block_mem (1) => Use block memories wherever possible
--  - auto_mem  (2) => Allow core to choose memory styles
--
-- Parameter: C_OUTPUT_CHECK_SYMBOLS
--  1 if all N symbols are to be output from core on output channel, 0 if only
--  the K information symbols are to be output.
--
-- Group: Generation parameters
--        ---------------------
-- Parameter: C_MEM_INIT_PREFIX
--  A string which is prepended to internally generated .mif file names. This prevents
--  problems if multiple cores are being generated simultaneously, as each one can use a
--  different string and the .mif file names will not clash.
--
-- Parameter: C_ELABORATION_DIR
-- Coregen provides the path to the elaboration directory. This is prepended to file names.
--
-- Parameter: C_XDEVICEFAMILY
--  Indicates the FPGA sub-family. Set to legal string, as defined by Coregen.
--
-- Parameter: C_FAMILY
--  Indicates the FPGA family. Set to legal string, as defined by Coregen.
--
--
--------------------------------------------------------------------------------
-- The following Ports are provided:
--
-- Port: clk
--  Input. The core is a completely synchronous design. All inputs must be synchronous to this input.
--
-- Port: ce
--  Input. Clock enable - All state is frozen when <ce> = '0' unless <sr> is asserted. <sr> overrides <ce>.
--
-- Port: sr
--  Input. Synchronous reset - Assert high for one or more cycles to reset. <sr> overrides <ce>.
--
-- Port: chien_last_info
--  Input, high when last information symbol is being input. In multi-channel case it is high for
--  the last symbol of all channels.
--
-- Port: erase_cnt_in
--  Input, erase count from Chien unit
--
-- Port: err_loc_eval
--  Input, error locator polynomial coefficients from Chien unit
--
-- Port: err_loc_diff_eval
--  Input, differential of error locator polynomial coefficients from Chien unit
--
-- Port: err_eval_eval
--  Input, error evaluator polynomial coefficients from Chien unit
--
-- Port: start
--  Input, pulse to signal Forney unit to start. It is a 1 cycle pulse, co-incident with
--  the first input values from the Chien unit. In multi-channel mode it is high for
--  C_NUM_CHANNELS symbol periods.
--
-- Port: start_p1
--  Input, high for 1 symbol period before "start". Only used in multi-channel mode to
--  reset the channel counter.
--
-- Port: last_value
--  Input, high when last value of a block is on <rx_symbol>.
--
-- Port: last_value_p1
--  Input, high when 2nd last value of a block is on <rx_symbol>.

-- Port: loc_deg
--  Input, degree of locator polynomial from Chien unit.
--
-- Port: rx_symbol
--  Input. This is the uncorrected received symbol from the main data FIFO. It is used
--  to add to the calculated error value to produce the final data output.
--
-- Port: dout_reg
--  Input. Output from data output register in higher level. This is the final register before
--  the AXI output FIFO. It must be fed back in to the Forney unit for calculation of the error statistics.
--  In CCSDS mode there is a dual-basis conversion ROM in the higher level entity, hence the need to feed the
--  data output back in to the Forney unit. The dual-basis ROM has to go in the higher level because it is
--  dual-port and the other port is used for the input symbol dual-basis conversion.
--
-- Port: output_fifo_has_room
--  Input, from top level AXI FIFO. If this FIFO is full then the Forney unit must pause.
--
-- Port: bit_err_0_to_1
--  Optional output, count of number of 0 to 1 bit errors in the block
--
-- Port: bit_err_1_to_0
--  Optional output, count of number of 1 to 0 bit errors in the block
--
-- Port: erase_cnt_out
--  Output erasure count for final output on AXI stat channel
--
-- Port: err_found
--  Output flag which is high if >=1 errors where detected in the RS block, low otherwise.
--
-- Port: err_cnt
--  Output, Number of symbol errors corrected in the current block
--
-- Port: fail
--  Output, flag which is high if the block is uncorrectable, low otherwise.
--
-- Port: info_out
--  Output, high when information symbols are on s_out, low when check symbols are being output. Only valid between
--  start and end of block.
--
-- Port: last_data
--  Output, high when last symbol of last channel is on <s_out>. This can be used to produce
--  TLAST signal for AXI output interface.
--
-- Port: last_stat
--  Output, high when last stat information of last channel is on outputs. This can be used to produce
--  TLAST signal for AXI stat interface.
--
-- Port: s_out
--  Output, corrected symbol
--
-- Port: data_del
--  Output, uncorrected symbol which was originally input to core, delayed by core latency.
--  i.e. <data_del> is the uncorrected version of <s_out>.
--
-- Port: read_data_en
--  Output, only used if C_HAS_N_IN=1. Read enable for main data in FIFO.
--
-- Port: data_out_rdy
--  Output, high when valid new data is ready on <data_out>
--
-- Port: status_out_rdy
--  Output, pulsed high when new error statistics are available on the output ports
--
-- Port: status_out_rdy_p2
--  Output, pulsed high 2 symbol periods before new error statistics are available on the output ports
--
-- Port: blk_strt
--  Output, block start flag. High for the first symbol in each RS block, low otherwise.
--  This port is no longer required at a higher level but is used internally to this block.
--
-- Port: blk_end
--  Output, block end flag. High for the last symbol in each RS block, low otherwise.
--  This port is no longer required at a higher level but is used internally to this block.

--
-- To avoid the use of extra memory to buffer data, err_found, err_cnt and
-- fail are updated during the LAST symbol in the RS block to which they refer,
-- rather than the first symbol.


--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;


entity forney is
  generic (
    C_NUM_CHANNELS         : integer;
    C_POLYNOMIAL           : integer;
    C_SYMBOL_WIDTH         : integer;
    C_N                    : integer;
    C_K                    : integer;
    C_HAS_ERR_STATS        : integer;
    C_HAS_INFO             : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_R_WIDTH              : integer;
    C_MEMSTYLE             : integer;
    C_OUTPUT_CHECK_SYMBOLS : integer;
    C_SPEC                 : integer;
    C_HAS_CE               : integer;
    C_HAS_ERASE            : integer;
    C_HAS_SR               : integer;
    C_HAS_DATA_DEL         : integer;
    C_MEM_INIT_PREFIX      : string;
    C_ELABORATION_DIR      : string;
    C_XDEVICEFAMILY        : string;
    C_FAMILY               : string
  );
  port (
    rx_symbol            : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    dout_reg             : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    chien_last_info      : in  std_logic;
    erase_cnt_in         : in  std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0) := (others=>'0');
    err_loc_eval         : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_loc_diff_eval    : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    err_eval_eval        : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    start                : in  std_logic;
    start_p1             : in  std_logic;
    last_value           : in  std_logic;
    last_value_p1        : in  std_logic;
    loc_deg              : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    clk                  : in  std_logic;
    ce                   : in  std_logic := '1';
    sr                   : in  std_logic := '0';
    output_fifo_has_room : in  std_logic;
    erase_cnt_out        : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
    s_out                : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    data_del             : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    bit_err_0_to_1       : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
    bit_err_1_to_0       : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
    blk_strt             : out std_logic;
    blk_end              : out std_logic;
    err_found            : out std_logic;
    err_cnt              : out std_logic_vector(C_R_WIDTH-1 downto 0);
    fail                 : out std_logic;
    info_out             : out std_logic;
    last_data            : out std_logic;
    last_stat            : out std_logic;
    read_data_en         : out std_logic;
    data_out_rdy         : out std_logic := '0';
    status_out_rdy       : out std_logic;
    status_out_rdy_p2    : out std_logic
  );
end forney;


--------------------------------------------------------------------------------
architecture synth of forney is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Variable R mode has same timing as variable N
  constant c_has_n_or_r_in_bool : boolean := C_HAS_N_IN/=0 or C_HAS_R_IN/=0;
  constant c_has_n_or_r_in      : integer := bool_to_int(c_has_n_or_r_in_bool);

  -- Need to generate <data_del> internally if <C_HAS_ERR_STATS> = 1 because it is
  -- required to generate the bit_err_* outputs
  constant has_data_del : boolean := (C_HAS_DATA_DEL /= 0) or (C_HAS_ERR_STATS /= 0);

  constant multi_channel : boolean := C_NUM_CHANNELS > 1;

  constant multi_channel_int : integer := bool_to_int(multi_channel);

  constant c_has_sr_bool : boolean := C_HAS_SR /= 0;

  constant ccsds : boolean := (C_SPEC = ccsds_spec);


  constant chan_count_width : integer := bitsneededtorepresent(C_NUM_CHANNELS-1);

  -- Register multiplier output in multi-channel mode to provide extra
  -- pipelining as this could be the critical path in some cases.
  constant gfmul_mode : integer := no_reg;--select_val_b(no_reg, reg, multi_channel);

  -- Codeword parameters
  constant n_minus_k : natural := C_N-C_K;
  constant t         : natural := n_minus_k/2; -- trunc towards 0
  constant r         : r_type  := select_val(2*t, n_minus_k, C_HAS_ERASE);


  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH-1;

  subtype  symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);


  constant r_width_minus_1  : integer := C_R_WIDTH-1;

  subtype r_type is std_logic_vector(r_width_minus_1 downto 0);


  constant erase_cnt_width         : integer := bitsneededtorepresent(C_N);
  constant erase_cnt_width_minus_1 : integer := erase_cnt_width - 1;

  subtype erase_cnt_type is std_logic_vector(erase_cnt_width_minus_1 downto 0);

  constant bit_err_width : integer := bitsneededtorepresent(n_minus_k * C_SYMBOL_WIDTH);

  subtype bit_err_type is std_logic_vector(bit_err_width-1 downto 0);

  ------------------------------------------------------------------------------
  -- Create Galois Field array
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gf_max : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;

  -- gf(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);

  -- Get the 1st 2*C_SYMBOL_WIDTH elements from alpha_to as they are all that
  -- GF multipliers need
  constant alpha_to_short : integer_array_type(0 to 2*C_SYMBOL_WIDTH-1) := alpha_to(0 to 2*C_SYMBOL_WIDTH-1);

  -- record for variable coefficient GF multiplier
  constant gfx_mul : gfx_record_type := gfx_calc_record(C_SYMBOL_WIDTH,
                                                        C_POLYNOMIAL,
                                                        false,
                                                        alpha_to_short);


  constant scnt_width : integer := select_val(bitsneededtorepresent(C_N-1), C_SYMBOL_WIDTH, C_HAS_N_IN);


  -- Delay from "err_loc_diff_eval" input to the input to gfmul. There is an
  -- exta register in the GF inverter if the symbol width is 8.
  constant delay_to_gfmul : integer := select_val_b(1, 2, C_SYMBOL_WIDTH=8);

  -- integer: start_to_start_d_delay
  -- Delay from start pulse to <start_d> is either 0 or 1 cycle
  constant start_to_start_d_delay : integer := select_val_b(0, 1, multi_channel or delay_to_gfmul=2);

  -- integer: ccsds_delay
  -- Number of additional symbol periods that data is delayed by in higher level entities in CCSDS mode
  constant ccsds_delay : integer := select_val_b(0, 2, ccsds);

  ------------------------------------------------------------------------------
  -- Function to calculate latency of the Forney unit
  -- This is not the total latency. It is the number of cycles from the input
  -- to the output of the GF multiplier.
  --
  function calc_latency return integer is
    variable latency : integer;
  begin
    latency := delay_to_gfmul;

    if multi_channel then
      latency := latency + 1; -- extra register in GF multiplier
    end if;

    return latency;
  end calc_latency;


  constant latency : integer := calc_latency;


  --  1 to to cover final output register and additional 2 registers for CCSDS if necessary
  constant output_reg_delay : integer := 1 + ccsds_delay;


  -- integer: total_latency
  --  Total data latency of Forney unit plus additional registers at higher level (in CCSDS case).
  constant total_latency : integer := latency + output_reg_delay;


  -- Need to add 1 to loc_deg_delay to compensate for value being latched 1 cycle earlier in Chien unit.
  -- loc_deg is latched 1 cycle before Forney start pulse in Chien unit, to
  -- prevent it being overwritten by the next incoming block
  constant loc_deg_delay : integer := latency+1;


  ------------------------------------------------------------------------------
  -- "start_d" (instead of <start>) is used to generate "blk_strt" so we can
  -- remove 1 delay element. In single channel case "start_d" is just "start"
  -- if dly_to_gfmul < 2.
  constant blk_strt_delay_single_channel : integer := 2 + ccsds_delay;

  constant blk_strt_delay : integer :=
    select_val_b(blk_strt_delay_single_channel, total_latency-1, multi_channel);


  ------------------------------------------------------------------------------
  -- "blk_end" is generated by delaying "scnt_tc" by an appropriate amount.
  --
  constant blk_end_delay_single_channel : integer := output_reg_delay;

  -- integer: blk_end_delay
  --  Delay from <scnt_tc> pulse (=last symbol) to <blk_end> pulse
  constant blk_end_delay : integer := select_val_b(blk_end_delay_single_channel, total_latency, multi_channel);



  -- Number of symbol periods from <blk_end> to <bit_err_rdy>
  -- This is the latency of the err_stats module itself
  -- If <C_HAS_ERR_STATS> = 0 then <bit_err_rdy> is not produced by err_stats module.
  constant err_stats_delay : integer := select_val(0, 2 + C_NUM_CHANNELS, C_HAS_ERR_STATS);


  -- integer: bit_err_delay
  --  Delay from <scnt_tc> pulse (last symbol) to <bit_err_rdy>. This is the amount of
  --  time that status values will have to be delayed to match <bit_err_rdy>.
  --  Need to add <output_reg_delay> to account for additional delay on data output before
  --  it is fed back into this entity for processing by err_stats module.
  constant bit_err_delay : integer := select_val(0, blk_end_delay + err_stats_delay, C_HAS_ERR_STATS);






  ------------------------------------------------------------------------------
  signal bit_err_1_to_0_p1     : bit_err_type := (others => '0');
  signal bit_err_0_to_1_p1     : bit_err_type := (others => '0');
  signal bit_err_rdy           : std_logic := '0';
  signal bit_err_rdy_p2        : std_logic := '0';
  signal blk_end_loc           : std_logic := '0';
  signal blk_end_p1            : std_logic := '0';
  signal blk_strt_p1           : std_logic := '0';
  signal blk_strt_loc          : std_logic := '0';
  signal ccsds_data_del_reg    : symbol_type := (others => '0');
  signal chan_ce               : std_logic := '0';
  signal chan_count            : std_logic_vector(chan_count_width-1 downto 0) := (others => '0');
  signal chan_count_tc         : std_logic := '0'; -- terminal count
  signal data_del_reg          : symbol_type := (others => '0');
  signal data_out_rdy_tmp      : std_logic := '0';
  signal erase_cnt_d           : erase_cnt_type := (others => '0');
  signal info_out_tmp          : std_logic := '0';
  signal int_ce                : std_logic := '0';
  signal int_sr                : std_logic := '0';
  signal eee_d, reciprocal     : symbol_type := (others => '0');
  signal enable_flags          : std_logic := '0';
  signal enable_flags_p2       : std_logic := '0';
  signal end_del               : std_logic_vector(blk_end_delay downto 0) := (others => '0');
  signal gfmul_cc              : symbol_type := (others => '0');
  signal gfmul_cc_reg          : symbol_type := (others => '0');
  signal gfmul_out             : symbol_type := (others => '0');
  signal info_end              : std_logic := '0';
  signal last_info             : std_logic := '0';
  signal ld_neq_0              : std_logic := '0';
  signal ld_neq_0_vec          : std_logic_vector(0 downto 0) := (others => '0');
  signal ld_neq_0_del          : std_logic := '0';
  signal ld_neq_0_del_vec      : std_logic_vector(0 downto 0) := (others => '0');
  signal loc_is_0              : std_logic := '0';
  signal loc_is_0_d            : std_logic := '0';
  signal loc_is_0_reg          : std_logic := '0';
  signal loc_deg_d             : r_type := (others => '0');
  signal rc_load_val           : r_type := (others => '0');
  signal rc_neq_ld             : std_logic := '0';
  signal rc_neq_ld_vec         : std_logic_vector(0 downto 0) := (others => '0');
  signal rc_neq_ld_del         : std_logic := '0';
  signal rc_neq_ld_del_vec     : std_logic_vector(0 downto 0) := (others => '0');
  signal read_data_en_del1     : std_logic := '0';
  signal read_data_en_tmp      : std_logic := '0';
  signal root_count            : r_type := (others => '0');
  signal root_count_del        : r_type := (others => '0');
  signal rx_symbol_del         : symbol_type := (others => '0');
  signal s_out_d_in            : symbol_type := (others => '0');
  signal scnt_sr               : std_logic := '0';
  signal scnt_sr_d_in          : std_logic := '0';
  signal scnt_tc               : std_logic := '0';
  signal scnt_tc_p1            : std_logic := '0';
  signal scnt_tc_p2            : std_logic := '0';
  signal start_d               : std_logic := '0';
  signal start_d_bar           : std_logic := '0';
  signal start_del             : std_logic_vector(blk_strt_delay downto 0) := (others => '0');
  signal update_flags          : std_logic := '0';


--------------------------------------------------------------------------------
-- Beginning of architecture body
--------------------------------------------------------------------------------
begin


  -- handle optional ce pin
  y_ce : if C_HAS_CE /= 0 generate
    int_ce <= ce;
  end generate; -- y_ce

  n_ce : if C_HAS_CE = 0 generate
    int_ce <= '1';
  end generate; -- n_ce


  -- handle optional sr pin
  y_sr : if C_HAS_SR /= 0 generate
    int_sr <= sr;
  end generate; -- y_sr

  n_sr : if C_HAS_SR = 0 generate
    int_sr <= '0';
  end generate; -- n_sr




  ------------------------------------------------------------------------------
  -- Sample loc_deg
  --
  ldg1 : if not(multi_channel) generate
    -- Retime loc_deg
    -- required because a new value for the next block may follow immediately.
    ld1 : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => C_R_WIDTH,
      clk_delay         => loc_deg_delay,
      memstyle          => dist_mem,
      c_has_ce          => C_HAS_CE)
    port map (
      din  => loc_deg,
      clk  => clk,
      ce   => int_ce,
      dout => loc_deg_d);
  end generate; -- ldg1


  ldg2 : if multi_channel generate
    signal loc_deg_d_p1 : r_type := (others => '0');
  begin

    -- loc_deg values are written in when start='1'. This does not need to
    -- be gated with ce as the same value will just be written to the same
    -- address multiple times if ce='0'. The RAM is not read until some time
    -- after all the writes have been completed.
    -- The ce input to syncmem only affects the reading of the ram. Values
    -- are read out to coincide with final root count values so we can
    -- check that loc_deg = number of roots.
    ldmem : syncmem
    generic map (width=>C_R_WIDTH, reqd_depth=>C_NUM_CHANNELS,
                 memstyle=>dist_mem,
                 c_has_ce=>C_HAS_CE, c_has_we=>1,
                 q_mode=>reg, debug_string=>"forney_ldmem",
                 c_elaboration_dir=>C_ELABORATION_DIR,
                 c_xdevicefamily=>C_XDEVICEFAMILY, c_family=>C_FAMILY)
    port map (a=>chan_count, d=>loc_deg, we=>start, c=>clk,
              ce=>int_ce, q=>open, q_reg=>loc_deg_d_p1);

    -- Delay by 1 more cycle to match 2 cycle delay on root_count (due
    -- to 1 cycle delay on loc_is_0 + 1 cycle delay on root counter
    -- output).
    -- Don't need to clear as "err_cnt" only upated on "update_flags".
    ldr1 : rs_reg
    generic map (c_width=>C_R_WIDTH, c_has_ce=>C_HAS_CE)
    port map (d=>loc_deg_d_p1, clk=>clk, ce=>int_ce, q=>loc_deg_d);

  end generate; -- ldg2





  ------------------------------------------------------------------------------
  -- Retime <erase_cnt_in> to generate <erase_cnt_out>
  --
  edg : if C_HAS_ERASE /= 0 generate
  begin

    edg1 : if not(multi_channel) generate
      -- Delay to match delay from new start pulse for current block to update flags pulse
      -- for previous block, assuming blocks have no gap between them. New <erase_cnt_in> value
      -- appears at same time as start pulse. <erase_cnt_d> for previous block is not latched
      -- into <erase_cnt_out> register until <erase_cnt_delay> -1 cycles, and we must not
      -- overwrite it until it has been latched, hence the need for the delay line.
      constant erase_cnt_delay : integer := loc_deg_delay + bit_err_delay;
    begin

      ed1 : big_delay
      generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                   bus_width=>erase_cnt_width, clk_delay=>erase_cnt_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
      port map (din=>erase_cnt_in, clk=>clk, ce=>int_ce, dout=>erase_cnt_d);

      -- Final erase_cnt register
      -- No need to reset as final output is qualified with tvalid
      lr0 : rs_reg
      generic map (c_width=>erase_cnt_width, c_has_ce=>1)
      port map (d=>erase_cnt_d, clk=>clk, ce=>update_flags, q=>erase_cnt_out);

    end generate; -- edg1



    edg2 : if multi_channel generate
      signal erase_cnt_d_p1 : erase_cnt_type := (others => '0');
      -- Must delay erase count to line up with <enable_flags> pulse. Note that a new start pulse
      -- can re-synchronize <chan_count> so can't rely on anything coming from the erase_cnt memory
      -- after a new start pulse. Subtract 1 because erase_cnt memory delays by 1 cycle.
      -- If there are no bit error stats then delay is the delay from start to symbols being processed
      -- minus 1 for the delay in erase_cnt memory (=1+start_to_start_d_delay-1).
      constant erase_cnt_delay : integer := select_val(start_to_start_d_delay, bit_err_delay-1, C_HAS_ERR_STATS);
    begin

      -- Write values into RAM using "start" rather than simply delaying
      -- because erase_cnt_in may change for next block whilst current block
      -- is still being processed in Forney unit.
      -- Use same logic as for loc_deg.
      -- erase_cnt_in values are written in when start='1'. This does not need to
      -- be gated with ce as the same value will just be written to the same
      -- address multiple times if ce='0'. The RAM is not read until some time
      -- after all the writes have been completed.
      -- The ce input to syncmem only affects the reading of the RAM.
      ecmem : syncmem
      generic map (width=>erase_cnt_width, reqd_depth=>C_NUM_CHANNELS,
                   memstyle=>dist_mem,
                   c_has_ce=>C_HAS_CE, c_has_we=>1,
                   q_mode=>reg, debug_string=>"forney_ecmem",
                   c_elaboration_dir=>C_ELABORATION_DIR,
                   c_xdevicefamily=>C_XDEVICEFAMILY, c_family=>C_FAMILY)
      port map (a=>chan_count, d=>erase_cnt_in, we=>start, c=>clk,
                ce=>int_ce, q=>open, q_reg=>erase_cnt_d_p1);

      -- Delay to match delay from chan_count=0 (and 1st value being read
      -- from ecmem) to worst case of update_flags pulse for previous block
      -- finishing. update_flags must finish at least 1 cycle before blk_strt
      -- begins for the new block. "total_latency" measures the delay from
      -- start to blk_strt. Subtract 2 from total_latency as there is always
      -- 1 cycle from start pulse to erase_cnt_d_p1 changing and update_flags
      -- is always finished at least 1 cycle before blk_strt goes high.
      ed2 : big_delay
      generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                   bus_width=>erase_cnt_width, clk_delay=>erase_cnt_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
      port map (din=>erase_cnt_d_p1, clk=>clk, ce=>int_ce, dout=>erase_cnt_out);

    end generate; -- edg2

  end generate; -- edg


  edg2 : if C_HAS_ERASE = 0 generate
    erase_cnt_out <= (others=>'0');
  end generate; -- edg2



  ----------------------------------------------------------------------------
  -- Generate loc_is_0 and loc_is_0_d signals
  -- Look for roots of locator polynomial
  ----------------------------------------------------------------------------

  -- If an extra stage of delay has been inserted in the GF inverter to
  -- reduce combinatorial delays then this must be compensated for.
  la2 : if delay_to_gfmul = 2 generate
    signal eee_d_a : symbol_type := (others => '0');
  begin
    cm0 : comp_eq
    generic map (c_family=>C_FAMILY, width=>C_SYMBOL_WIDTH, comp_val=>0, q_mode=>reg)
    port map (i=>err_loc_eval, c=>clk, ce=>int_ce, reset=>'0', o_reg=>loc_is_0);

    ff1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE)
    port map (d=>loc_is_0, clk=>clk, ce=>int_ce, q=>loc_is_0_reg);

    l0g0 : if not(multi_channel) generate
      loc_is_0_d <= loc_is_0_reg;
    end generate; -- l0g0

    -- 1 extra delay to compensate for extra reg on gfmul output
    l0g1 : if multi_channel generate
    begin
      l0ff : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>loc_is_0_reg, clk=>clk, ce=>int_ce, q=>loc_is_0_d);

    end generate; -- l0g1


    -- Retime err_eval_eval twice
    ff6 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
    port map (d=>err_eval_eval, clk=>clk, ce=>int_ce, q=>eee_d_a);

    ff7 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
    port map (d=>eee_d_a, clk=>clk, ce=>int_ce, q=>eee_d);

  end generate; -- la2


  ------------------------------------------------------------------------------
  -- No extra stage of delay has been inserted in the GF inverter therefore no
  -- extra delay is required
  --
  la1 : if delay_to_gfmul /= 2 generate
    signal loc_is_0_tmp : std_logic := '0';
  begin

    -- generate loc_is_0 and loc_is_0_d signals
    cm0 : comp_eq
    generic map (c_family=>C_FAMILY, width=>C_SYMBOL_WIDTH, comp_val=>0,
                 q_mode=>reg_and_no_reg)
    port map (i=>err_loc_eval, c=>clk, ce=>int_ce, reset=>'0',
              o=>loc_is_0_tmp, o_reg=>loc_is_0_reg);


    l0g0 : if not(multi_channel) generate
      loc_is_0_d <= loc_is_0_reg;
      loc_is_0   <= loc_is_0_tmp;
    end generate; -- l0g0

    l0g1 : if multi_channel generate
    begin
      -- 1 extra delay to compensate for extra reg on gfmul output
      l0ff : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>loc_is_0_reg, clk=>clk, ce=>int_ce, q=>loc_is_0_d);

      -- loc_is_0 is always registered in multi-channel mode to increase
      -- pipelining.
      loc_is_0 <= loc_is_0_reg;
    end generate; -- l0g1


    -- Retime err_eval_eval once
    ff3 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
    port map (d=>err_eval_eval, clk=>clk, ce=>int_ce, q=>eee_d);


  end generate; -- la1




  ----------------------------------------------------------------------------
  -- Generate start_d signal
  --
  -- Multi-channel always uses start_d to intialize root_count as loc_is_0
  -- is always registered to improve performance.
  sdg0 : if start_to_start_d_delay /= 0 generate

    sdr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SR)
    port map (d=>start, clk=>clk, sclr=>int_sr, ce=>int_ce, q=>start_d);

  end generate; -- sdg1

  sdg1 : if start_to_start_d_delay = 0 generate
    start_d <= start;
  end generate; -- sdg1




  ------------------------------------------------------------------------------
  -- 'blk_strt' register
  -- Signal to mark start of block is simply 'start' retimed to balance the
  -- delay of the Forney unit
  ------------------------------------------------------------------------------

  -- "blk_strt" is start delayed by "blk_strt_delay" clock cycles. This
  -- is used to indicate the first symbol of the block is on s_out.
  start_del(0) <= start_d;

  bsg1 : for i in 1 to blk_strt_delay generate
  begin
    bsd1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SR)
    port map (d=>start_del(i-1), clk=>clk, sclr=>int_sr, ce=>int_ce, q=>start_del(i));

  end generate; -- bsg1

  blk_strt_p1  <= start_del(blk_strt_delay-1); -- high 1 cycle before blk_strt
  blk_strt_loc <= start_del(blk_strt_delay);
  blk_strt     <= blk_strt_loc;                -- Primary output




  --------------------------------------------------------------------------
  -- 'blk_end' register
  -- Signal to mark end of block is simply the terminal count from the
  -- symbol counter delayed.
  -- Adds a two clock cycle delay if CCSDS dual basis is required
  --------------------------------------------------------------------------

  -- "blk_end" is scnt_tc delayed by "blk_end_delay" symbol periods. This
  -- is used to indicate the last symbol of the block is on s_out.
  end_del(0) <= scnt_tc;

  beg1 : for i in 1 to blk_end_delay generate
  begin
    bed1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SR)
    port map (d=>end_del(i-1), clk=>clk, sclr=>int_sr, ce=>int_ce, q=>end_del(i));
  end generate; -- beg1

  blk_end_p1  <= end_del(blk_end_delay-1); -- high 1 cycle before blk_end
  blk_end_loc <= end_del(blk_end_delay);   -- Local signal for use in this entity
  blk_end     <= blk_end_loc;              -- Primary output



  ------------------------------------------------------------------------------
  -- Generate <info_out>
  --
  iog1 : if C_HAS_INFO /= 0 generate

    -- C_K=1 with fixed N,R is treated as a special case as <start> pulse is used to generate <last_info>
    constant info_end_delay_fixed_n_r : integer := select_val_b(total_latency, blk_end_delay, C_K > 1);
    constant info_end_delay : integer := select_val_b(info_end_delay_fixed_n_r, total_latency-1, c_has_n_or_r_in_bool);
    signal info_end_del : std_logic_vector(info_end_delay downto 0) := (others => '0');

  begin

    info_out <= info_out_tmp; -- Primary output

    ----------------------------------------------------------------------------
    -- Set-Reset flip-flop, set when <blk_strt_p1> is asserted, so that <info_out> goes high at same time
    -- as <blk_strt>. Reset by <info_end> pulse, so that <info_out> goes low after the last information
    -- symbol has been output.
    iep1 : process (clk)
    begin
      if rising_edge(clk) then

        if int_sr = '1' then
          info_out_tmp <= '0';
        elsif int_ce = '1' then
          if blk_strt_p1 = '1' then
            info_out_tmp <= '1';
          elsif info_end = '1' then
            info_out_tmp <= '0';
          end if; -- blk_strt_p1 = '1'
        end if; -- int_sr = '1'
      end if; -- rising_edge(clk)
    end process; -- iep1


    ----------------------------------------------------------------------------
    -- 'info_end' register
    -- Register signal to mark end of K information symbols
    -- This is used to reset <info_out> and also as the output_tlast signal if <C_OUTPUT_CHECK_SYMBOLS> = 0.
    --
    -- "info_end" is <last_info> delayed by "info_end_delay" symbol periods.
    -- This is used to indicate the last information symbol of the block is on s_out.
    -- No need to reset register as <info_out> and tlast are qualified by tvalid signal on final output.
    -- Adds a 2 cycle delay if CCSDS dual basis is required, to compensate for 2 cycle delay on <s_out>
    -- in <rs_decoder_main>
    --
    info_end_del(0) <= last_info;

    ieg2 : for i in 1 to info_end_delay generate
    begin
      ied1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>info_end_del(i-1), clk=>clk, ce=>int_ce, q=>info_end_del(i));
    end generate; -- ieg2

    info_end <= info_end_del(info_end_delay);

  end generate; -- iog1






  ----------------------------------------------------------------------------
  -- Status flags are updated at the end of a block
  --
  update_flags <= enable_flags and int_ce;

  -- Signal error statistics ready on output ports
  status_out_rdy    <= enable_flags;
  status_out_rdy_p2 <= enable_flags_p2;



  ------------------------------------------------------------------------------
  -- Generate logic to register final status outputs and count the number of
  -- locator roots. This consists of incrementing a value every time loc_is_0.
  ------------------------------------------------------------------------------

  -- Must initialize count value to 1 if very first symbol is a root, else
  -- initialize to 0.

  -- xcc can't cope with the concatenated buses
  --  rc_load_val <= rc_zeros & loc_is_0;
  bg : for bi in r_width_minus_1 downto 1 generate
  begin
    rc_load_val(bi) <= '0';
  end generate;
  rc_load_val(0) <= loc_is_0;



  rcg1 : if not(multi_channel) generate
    signal root_cnt_en : std_logic := '0';
  begin

    -- Final clock enable for status output registers
    efd0 : if C_HAS_ERR_STATS = 0 generate
      enable_flags    <= scnt_tc;
      enable_flags_p2 <= scnt_tc_p2; -- pulse 2 symbol periods before enable_flags pulse
    end generate; -- efd0


    efd1 : if C_HAS_ERR_STATS /= 0 generate
      enable_flags    <= bit_err_rdy; -- High for 1 cycle when <bit_err_0_to_1> to be loaded into final register
      enable_flags_p2 <= bit_err_rdy_p2; -- High 2 cycles earlier
    end generate; -- efd1



    ----------------------------------------------------------------------------
    -- Counter to count the number of block positions for which the locator
    -- evaluation value is zero. It is re-loaded with 0 (or with 1 if the first
    -- block symbol happens to correspond to an erroneous symbol) via 'start'.

    start_d_bar <= not(start_d);


    -- Increment root counter when a locator root is found
    root_cnt_en <= (loc_is_0 or start_d) and int_ce;


    c1 : cntre_b
    generic map (c_xdevicefamily=>C_XDEVICEFAMILY, width=>C_R_WIDTH)
    port map (ce=>root_cnt_en, c=>clk, din=>rc_load_val, load_bar=>start_d_bar, cnt=>root_count);


    --------------------------------------------------------------------------
    -- Data for err_cnt register
    -- Primary output register for err_cnt

    -- Insert an extra delay so <err_cnt> is ready at exactly the same time as <bit_err_0_to_1>
    ecd1 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>C_R_WIDTH, clk_delay=>bit_err_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>root_count, clk=>clk, ce=>int_ce, dout=>root_count_del);

    -- Do not need to reset register as values are qualified by tvalid on final output
    lr3 : rs_reg
    generic map (c_width=>C_R_WIDTH, c_has_ce=>1)
    port map (d=>root_count_del, clk=>clk, ce=>update_flags, q=>err_cnt);


    ----------------------------------------------------------------------------
    -- Compare root count with locator degree at the end of the block. If
    -- they are not equal then the error correction has failed.
    cm1 : comp_neq_var
    generic map (width=>C_R_WIDTH, c_family=>C_FAMILY)
    port map (a=>root_count, b=>loc_deg_d, o=>rc_neq_ld);

    -- Insert an extra delay so <fail> is ready at exactly the same time as <bit_err_0_to_1>
    rc_neq_ld_vec(0) <= rc_neq_ld;

    fld1 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>1, clk_delay=>bit_err_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>rc_neq_ld_vec, clk=>clk, ce=>int_ce, dout=>rc_neq_ld_del_vec);

    rc_neq_ld_del <= rc_neq_ld_del_vec(0);

    -- Final <fail> register
    -- No need to reset as final output is qualified by tvalid
    fl1a : rs_reg_bit
    generic map (c_has_ce=>1)
    port map (d=>rc_neq_ld_del, clk=>clk, ce=>update_flags, q=>fail);


    ----------------------------------------------------------------------------
    -- If the locator degree is non-zero then errors were found
    --
    cm2 : comp_neq
    generic map (c_family=>C_FAMILY, width=>C_R_WIDTH, comp_val=>0)
    port map (i=>loc_deg_d, o=>ld_neq_0);

    -- Insert an extra delay so <err_found> is ready at exactly the same time as <bit_err_0_to_1>
    ld_neq_0_vec(0) <= ld_neq_0;

    erd1 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>1, clk_delay=>bit_err_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>ld_neq_0_vec, clk=>clk, ce=>int_ce, dout=>ld_neq_0_del_vec);

    ld_neq_0_del <= ld_neq_0_del_vec(0);

    -- Final <err_found> register
    -- No need to reset as final output is qualified by tvalid
    ef1a : rs_reg_bit
    generic map (c_has_ce=>1)
    port map (d=>ld_neq_0_del, clk=>clk, ce=>update_flags, q=>err_found);

    ----------------------------------------------------------------------------
    -- Generate <last_data> and <last_stat>
    mcg1a : if C_OUTPUT_CHECK_SYMBOLS /= 0 generate
    begin
      last_data <= blk_end_loc;
    end generate; -- mcg1a

    mcg1b : if C_OUTPUT_CHECK_SYMBOLS = 0 generate
    begin
      last_data <= info_end;
    end generate; -- mcg1b

    -- m_axis_stat_tlast output has no meaning in single channel case, as it is only asserted
    -- when stat info for last channel is on m_axis_stat_tdata
    last_stat <= '1';

  end generate; -- rcg1




  rcg2 : if multi_channel generate
    -- Amount to delay <root_count> and other status info
    -- If we have to generate <bit_err_0_to_1> there is an additional delay to match <bit_err_rdy> delay.
    constant stat_delay : integer := select_val(0,
                                                bit_err_delay-2, -- -2 for delay from start of <blk_end> to <root_count>
                                                C_HAS_ERR_STATS);

    signal last_data_n         : std_logic := '0'; -- High when Nth symbol is on s_out
    -- chan_count_tc must be delayed by <blk_end_delay> to produce last_data_n signal
    signal last_del_in_vec     : std_logic_vector(0 downto 0) := (others => '0');
    signal last_del_out_vec    : std_logic_vector(0 downto 0) := (others => '0');
    signal last_stat_out_vec   : std_logic_vector(0 downto 0) := (others => '0');
    signal previous_root_count : r_type := (others => '0');
  begin

     rcg2a : if C_OUTPUT_CHECK_SYMBOLS /= 0 generate
     begin
       last_data <= last_data_n;
     end generate; -- rcg2a

     rcg2b : if C_OUTPUT_CHECK_SYMBOLS = 0 generate
     begin
       last_data <= info_end;
     end generate; -- rcg2b


    ----------------------------------------------------------------------------
    -- Generate <last_data_n> and <last_stat> signals
    --
    -- Delay chan_count_tc by Forney latency to produce pulse coincident with very last
    -- symbol of the block (from the last channel) on s_out. This can be used to produce the
    -- TLAST signal for the output AXI interface.
    -- Gate with <scnt_tc> as this is high when the last symbol is ready. <blk_end> is a
    -- delayed version of scnt_tc
    -- Don't need to reset as tlast is always qualified with tvalid signal
    last_del_in_vec(0) <= chan_count_tc and scnt_tc;

    lad1 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>1, clk_delay=>blk_end_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>last_del_in_vec, clk=>clk, ce=>int_ce, dout=>last_del_out_vec);

    last_data_n <= last_del_out_vec(0);

    -- Final clock enable for status output registers
    efd2 : if C_HAS_ERR_STATS = 0 generate
      -- Delay from <scnt_tc> to status values being available
      -- This is 1 for root_count adder register + delay from start pulse to start_d (which initializes
      -- <root_count> adder).
      -- Need to include start_to_start_d because channel counter is synchronized to <start> and
      -- so is <scnt_tc>. Final <root_count> values will be available <ef_delay> clk cycles after <scnt_tc>
      -- is high for last channel.
      constant ef_delay : integer := 1 + start_to_start_d_delay;
    begin
      enable_flags    <= end_del(ef_delay);   -- = scnt_tc delayed by 2 cycles
      enable_flags_p2 <= end_del(ef_delay-2); -- = scnt_tc

      -- Generate tlast signal for AXI stat channel
      lad2 : big_delay
      generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                   bus_width=>1, clk_delay=>ef_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
      port map (din=>last_del_in_vec, clk=>clk, ce=>int_ce, dout=>last_stat_out_vec);

      last_stat <= last_stat_out_vec(0);

    end generate; -- efd2


    efd3 : if C_HAS_ERR_STATS /= 0 generate
    begin
      enable_flags    <= bit_err_rdy; -- High for 1 cycle when <bit_err_0_to_1> to be loaded into final register
      enable_flags_p2 <= bit_err_rdy_p2; -- High 2 cycles earlier

      -- Generate tlast signal for AXI stat channel by delaying <last_data_n>. <bit_err_rdy> pulse
      -- always occurs <err_stats_delay> cycles after <blk_end> pulse, so all we need to do is delay the
      -- <last_data_n> pulse by the same amount
      lad3 : big_delay
      generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                   bus_width=>1, clk_delay=>err_stats_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
      port map (din=>last_del_out_vec, clk=>clk, ce=>int_ce, dout=>last_stat_out_vec);

      last_stat <= last_stat_out_vec(0);


    end generate; -- efd3



    ----------------------------------------------------------------------------
    -- Counter to count the number of block positions for which the locator
    -- evaluation value is zero. It is re-loaded with 0 (or with 1 if the first
    -- block symbol happens to correspond to an erroneous symbol) via 'start'.

    -- Adder increments root count for a particular channel if loc_is_0.
    -- It is initialized to the b input when "start_d" is high.
    -- Use "start_d" rather than "start" so that loc_is_0 can be registered.
    add1 : add_b
    generic map (in_width  => C_R_WIDTH,
                 out_width => C_R_WIDTH,
                 c_has_q   => 1)
    port map (a      => previous_root_count,
              b      => rc_load_val,
              init_b => start_d,
              ce     => int_ce,
              clk    => clk,
              aclr   => '0',
              o      => open,
              q      => root_count);

    -- Delay line to hold root_count values for each channel.
    rcd1 : big_delay
    generic map (
      c_family          => C_FAMILY,
      c_xdevicefamily   => C_XDEVICEFAMILY,
      c_elaboration_dir => C_ELABORATION_DIR,
      bus_width         => C_R_WIDTH,
      clk_delay         => C_NUM_CHANNELS-1, -- adder o/p reg is 1 stage
      memstyle          => dist_mem,
      c_has_ce          => C_HAS_CE)
    port map (
      din  => root_count,
      clk  => clk,
      ce   => int_ce,
      dout => previous_root_count );

    -- Delay <root_count> by latency to provide <err_cnt> output.
    rcd2 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>C_R_WIDTH, clk_delay=>stat_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>root_count, clk=>clk, ce=>int_ce, dout=>root_count_del);


    -- <err_cnt> is fed to AXI stat channel FIFO at higher level
    err_cnt <= root_count_del;



    ----------------------------------------------------------------------------
    -- Compare root count with locator degree at the end of the block. If
    -- they are not equal then the error correction has failed.
    cm1 : comp_neq_var
    generic map (width=>C_R_WIDTH, q_mode=>no_reg, c_has_r=>false, c_family=>C_FAMILY)
    port map (a=>root_count, b=>loc_deg_d, o=>rc_neq_ld);

    rc_neq_ld_vec(0) <= rc_neq_ld;

    fdl1 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>1, clk_delay=>stat_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>rc_neq_ld_vec, clk=>clk, ce=>int_ce, dout=>rc_neq_ld_del_vec);

    rc_neq_ld_del <= rc_neq_ld_del_vec(0);

    -- <fail> is fed to AXI stat channel FIFO at higher level
    fail <= rc_neq_ld_del;

    ----------------------------------------------------------------------------
    -- If the locator degree is non-zero then errors were found
    --
    cm2 : comp_neq
    generic map (c_family=>C_FAMILY, width=>C_R_WIDTH, comp_val=>0, q_mode=>no_reg, c_has_r=>false)
    port map (i=>loc_deg_d, o=>ld_neq_0);

    ld_neq_0_vec(0) <= ld_neq_0;

    efd1 : big_delay
    generic map (c_family=>C_FAMILY, c_xdevicefamily=>C_XDEVICEFAMILY, c_elaboration_dir=>C_ELABORATION_DIR,
                 bus_width=>1, clk_delay=>stat_delay, memstyle=>dist_mem, c_has_ce=>C_HAS_CE)
    port map (din=>ld_neq_0_vec, clk=>clk, ce=>int_ce, dout=>ld_neq_0_del_vec);

    ld_neq_0_del <= ld_neq_0_del_vec(0);

    -- <err_found> is fed to AXI stat channel FIFO at higher level
    err_found <= ld_neq_0_del;

  end generate; -- rcg2






  ------------------------------------------------------------------------------
  -- For Forney algorithm we are calculating
  -- err_eval_eval * (1/err_loc_diff_eval)
  --
  finv : gfinv
  generic map (polynomial        => C_POLYNOMIAL,
               symbol_width      => C_SYMBOL_WIDTH,
               memstyle          => C_MEMSTYLE,
               c_mem_init_prefix => C_MEM_INIT_PREFIX,
               c_elaboration_dir => C_ELABORATION_DIR,
               c_xdevicefamily   => C_XDEVICEFAMILY,
               c_family          => C_FAMILY)
  port map (enable=>int_ce, clk=>clk,
            aa=>err_loc_diff_eval, ii=>reciprocal);


  -- Multiplier needs a single register stage in multi-channel mode.
  -- It was found that the best timing was achieved when this was the
  -- pipeline reg rather than the output reg.
  fmul : gfmul
  generic map (
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    gfx               => gfx_mul,
    q_mode            => gfmul_mode,
    extra_pipeline    => multi_channel_int)
  port map (
    reset       => '0',
    enable_pipe => int_ce,
    enable      => int_ce,
    clk         => clk,
    aa          => reciprocal,
    bb          => eee_d,
    cc          => gfmul_cc,
    cc_reg      => gfmul_cc_reg);

  gfmg1 : if gfmul_mode = no_reg generate
    gfmul_out <= gfmul_cc;
  end generate; -- gfmg1

  gfmg2 : if gfmul_mode /= no_reg generate
    gfmul_out <= gfmul_cc_reg;
  end generate; -- gfmg1


  -- Add error value to corresponding received symbol whenever a locator
  -- root is found (i.e. loc_is_0_d = '1')
  --
  ag : for i in 0 to symbol_width_minus_1 generate
    s_out_d_in(i) <= rx_symbol(i) xor (loc_is_0_d and gfmul_out(i));
  end generate; -- ag

  lr4 : rs_reg
  generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>1)
  port map (d=>s_out_d_in, clk=>clk, ce=>int_ce, q=>s_out);






  ------------------------------------------------------------------------------
  -- Generate data_del output if required.
  --

  ddg0 : if not(has_data_del) generate
    rx_symbol_del <= (others=>'0'); -- not used
  end generate; -- ddg0

  ddg1 : if has_data_del generate

    -- Duplicate lut reg delay
    dr2 : rs_reg
    generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
    port map (d=>rx_symbol, clk=>clk, ce=>int_ce, q=>rx_symbol_del);

    ----------------------------------------------------------------------------
    -- Instantiate dual-basis conversion output ROM if implementing CCSDS spec.
    ----------------------------------------------------------------------------
    dbg1 : if C_SPEC = ccsds_spec generate
      constant db_mif_name : string := concatenate_strings(C_MEM_INIT_PREFIX, "dd_basis_conv.mif");

    begin

      db1 : gf_dual_basis_rom
      generic map (
        C_WIDTH           => C_SYMBOL_WIDTH,
        C_HAS_DOUT_B      => 0,
        C_HAS_ENA         => C_HAS_CE,
        C_HAS_ENB         => C_HAS_CE,
        CONV_DATA_DB2     => ccsds_basis_conv,
        CONV_DATA_2DB     => ccsds_basis_conv, -- not used
        MIF_FILE_NAME     => db_mif_name,
        C_ELABORATION_DIR => C_ELABORATION_DIR,
        C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
        C_FAMILY          => C_FAMILY)
      port map (
        ena    => int_ce,
        enb    => int_ce,
        clk    => clk,
        din_a  => rx_symbol_del,
        din_b  => rx_symbol_del, -- not used
        dout_a => ccsds_data_del_reg,
        dout_b => open);


      -- Delay output of CCSDS ROM to get the correct data out.
      dr1 : rs_reg
      generic map (c_width=>C_SYMBOL_WIDTH, c_has_ce=>C_HAS_CE)
      port map (d=>ccsds_data_del_reg, clk=>clk, ce=>int_ce, q=>data_del_reg);

    end generate; -- dbg1


    -- Output data_del
    ddg2 : if C_SPEC /= ccsds_spec generate
      data_del_reg <= rx_symbol_del;
    end generate; -- ddg2


    data_del <= data_del_reg; -- Primary output

  end generate; -- ddg1




  ------------------------------------------------------------------------------
  -- RS flip-flop to control counter synchronous reset
  --  Set by counter reaching terminal count.
  --  Cleared by start. This allows the counter to start counting.
  --
  mcg5 : if not(multi_channel) generate

    scnt_sr_d_in <= not(start_d) and (scnt_tc or scnt_sr);

    ff12 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SR)
    port map (d=>scnt_sr_d_in, clk=>clk, ce=>int_ce, sset=>int_sr, q=>scnt_sr);

    -- Generate signal to read data from main data_in FIFO.
    -- Read data when symbol counter is not being reset.
    --
    read_data_en_tmp <= ((start_d or (not(scnt_sr) and not(scnt_tc))) and
                         output_fifo_has_room and int_ce) and not(int_sr);

  end generate; -- mcg5


  -- In multi-channel case, <scnt_sr> is reset by start_p1 so that scnt can
  -- start counting immediately after start pulse.
  -- Set after last symbol for last channel has been sampled.
  -- (i.e. scnt_tc & chan_count_tc = '1')
  -- Note channel counter is clock enabled by chan_ce but at least one
  -- chan_ce with scnt_sr='1' is guaranteed between blocks.
  mcg6 : if multi_channel generate
    signal set_scnt_sr  : std_logic := '0';
    signal scnt_sr_del  : std_logic_vector(delay_to_gfmul downto 0) := (others => '0');
    signal scnt_sr_del1 : std_logic := '1';
  begin

    set_scnt_sr <= scnt_tc and chan_count_tc;

    scnt_sr_d_in <= not(start_p1) and (set_scnt_sr or scnt_sr);

    ff12 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SR)
    port map (d=>scnt_sr_d_in, clk=>clk, ce=>int_ce, sset=>int_sr, q=>scnt_sr);


    -- Generate signal to read data from main data_in FIFO.
    -- Read data when symbol counter is not being reset.
    --
    -- Delay symbol count reset signal (<scnt_sr>) by the delay from input to gfmul,
    -- as <read_data_en> must also be delayed by this amount so that <rx_symbol>
    -- is on the input at the correct time.
    scnt_sr_del(0) <= scnt_sr;

    ssd1 : for i in 1 to delay_to_gfmul generate
      ssr1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE, c_ainit_val=>"1", c_has_sset=>C_HAS_SR)
      port map (d=>scnt_sr_del(i-1), clk=>clk, sset=>int_sr, ce=>int_ce, q=>scnt_sr_del(i));
    end generate; -- ssd1

    scnt_sr_del1 <= scnt_sr_del(delay_to_gfmul);

    read_data_en_tmp <= (not(scnt_sr_del1) and
                         output_fifo_has_room and int_ce) and not(int_sr);

  end generate; -- mcg6


  read_data_en <= read_data_en_tmp; -- Drive primary output


  ------------------------------------------------------------------------------
  -- data_out_rdy must go high when valid new data is ready on <data_out>, so
  -- delay read_data_en by 2 cycles to compensate for Rx FIFO read cycle and
  -- s_out register cycle
  --
  dorp1: process (clk)
  begin
    if rising_edge(clk) then
      if int_sr = '1' then
        data_out_rdy_tmp  <= '0';
        read_data_en_del1 <= '0';

      elsif int_ce = '1' then
        data_out_rdy_tmp  <= read_data_en_del1;
        read_data_en_del1 <= read_data_en_tmp;

      end if; -- int_sr = '1'
    end if; -- rising_edge(clk)
  end process; -- dorp1

  data_out_rdy <= data_out_rdy_tmp; -- Drive primary output



  ------------------------------------------------------------------------------
  -- Control logic specific to fixed N version. This version uses a different
  -- symbol counter.
  --
  nig0 : if not(c_has_n_or_r_in_bool) generate
    -- Need to detect last sym_cnt value early, so that signals can be registered
    constant last_sym_compare_val : integer := C_N-4;
    signal scnt : std_logic_vector(scnt_width-1 downto 0) := (others=> '0');
  begin

    ----------------------------------------------------------------------------
    -- Counter to count symbols in a block, <scnt>. Counts from 0 to N-1 and
    -- then sets an RS flip-flop which holds the counter at 0 until another
    -- start pulse comes along and clears the rs flip-flop. If the blocks are
    -- continuous then the next start pulse will be coincident with scnt_tc
    -- and the RS flip-flop will remain at 0.
    --
    -- <scnt_tc> must be high when <scnt> = C_N - 1
    -- Detect when we are two cycles away from scnt_tc as early tc signal can
    -- be used to disable core if the AXI status output FIFO is full
    stcp1 : process (clk)
    begin

      if rising_edge(clk) then

        if int_sr = '1' then
          scnt       <= (others=>'0');
          scnt_tc    <= '0';
          scnt_tc_p1 <= '0';
          scnt_tc_p2 <= '0';
        elsif chan_ce = '1' then

          if scnt_sr = '1' or scnt_tc = '1' then
            scnt <= (others=>'0');
          else
            scnt <= scnt + 1; -- increment symbol count
          end if; -- scnt_sr

          scnt_tc    <= scnt_tc_p1;
          scnt_tc_p1 <= scnt_tc_p2;

          if unsigned(scnt) = last_sym_compare_val then
            scnt_tc_p2 <= '1';
          else
            scnt_tc_p2 <= '0';
          end if;

        end if; -- int_sr = '1'

      end if; -- rising_edge(clk)

    end process; -- stcp1


    ----------------------------------------------------------------------------
    -- Generate <last_info>
    --
    ieg3 : if C_HAS_INFO /= 0 generate
    begin

      -- When count = K-1 then last information symbol is coming from Chien unit.
      ig1 : if C_K > 1 generate
        constant km1_string : string := int_2_logic_string(C_K-1, scnt_width);
        signal last_info_tmp : std_logic := '0';
      begin

        cmp2 : rs_compare
        generic map (
          c_family      => C_FAMILY,
          instance_name => "forney_cmp2",
          c_width       => scnt_width,
          c_b_constant  => 1,
          c_b_value     => km1_string,
          c_has_a_eq_b  => 1)
        port map (
          a      => scnt,
          b      => scnt, -- not used
          a_eq_b => last_info_tmp);

        -- <last_info_tmp> will be high for <C_NUM_CHANNELS> cycles but <last_info> must only be high for
        -- the very last info symbol of the very last channel.
        last_info <= last_info_tmp and chan_count_tc;

      end generate; -- ig1

      -- K=1 is a special case, as <start> can be used as <last_info> signal as it signals the first
      -- (and therefore last symbol on the input)
      ig2 : if C_K <= 1 generate
      begin
        last_info <= start and chan_count_tc;
      end generate; -- ig2

    end generate; -- ieg3


  end generate; -- nig0






  ------------------------------------------------------------------------------
  -- Control logic specific to variable N version.
  --
  nig1 : if c_has_n_or_r_in_bool generate
    signal last_value_d : std_logic := '0';
  begin

    -- Delay "last_value" to compensate for 1 cycle delay of GF inverter.
    lvr1 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SR)
    port map (d=>last_value, clk=>clk, ce=>int_ce, sclr=>int_sr, q=>last_value_d);


    -- If an extra stage of delay has been inserted in the GF inverter to
    -- reduce combinatorial delays then this must be compensated for.
    tcg1 : if latency > 1 generate

      -- Delay "scnt_tc" to compensate for extra 1 cycle latency
      lvr2 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>C_HAS_SR)
      port map (d=>last_value_d, clk=>clk, ce=>int_ce, sclr=>int_sr, q=>scnt_tc);

      scnt_tc_p2 <= last_value;

    end generate; -- tcg1

    tcg2 : if latency <= 1 generate
      scnt_tc    <= last_value_d;
      scnt_tc_p2 <= last_value_p1;
    end generate; -- tcg2


    -- last_info is generated in the Chien unit
    last_info <= chien_last_info and chan_count_tc; -- Need a pulse for last info symbol of last channel


  end generate; -- nig1




  ------------------------------------------------------------------------------
  -- Instantiate additional error statistics module. This counts number of 0 to 1 and 1 to 0 bit errors.
  --
  esg1 : if C_HAS_ERR_STATS /= 0 generate
  begin

    -- Generate <bit_err_0_to_1> and <bit_err_1_to_0>i
    -- These values need to be captured when <update_flags> is high.
    es1 : err_stats
    generic map (
      c_symbol_width => C_SYMBOL_WIDTH,
      c_r            => C_N-C_K,
      c_has_ce       => C_HAS_CE,
      c_has_sr       => C_HAS_SR,
      c_num_channels => C_NUM_CHANNELS,
      c_family       => C_FAMILY)
    port map (
      corrected_data => dout_reg,
      original_data  => data_del_reg,
      clk            => clk,
      ce             => int_ce,
      sr             => int_sr,
      blk_strt       => blk_strt_loc,
      blk_end        => blk_end_loc,
      bit_err_0_to_1 => bit_err_0_to_1_p1,
      bit_err_1_to_0 => bit_err_1_to_0_p1,
      bit_err_rdy    => bit_err_rdy,
      bit_err_rdy_p1 => open,
      bit_err_rdy_p2 => bit_err_rdy_p2);

    -- In single channel mode these are the final primary output registers for the core.
    esg2 : IF not(multi_channel) generate
      -- Do not need to reset registers as values are qualified by tvalid on final output
      ber0 : rs_reg
      generic map (c_width=>bit_err_width, c_has_ce=>1)
      port map (d=>bit_err_0_to_1_p1, clk=>clk, ce=>update_flags, q=>bit_err_0_to_1);

      ber1 : rs_reg
      generic map (c_width=>bit_err_width, c_has_ce=>1)
      port map (d=>bit_err_1_to_0_p1, clk=>clk, ce=>update_flags, q=>bit_err_1_to_0);
    end generate; -- esg2

    -- In multi-channel mode the bit_err_ values are fed to the AXI stat FIFO in the higher level
    esg3 : IF multi_channel generate
      bit_err_0_to_1 <= bit_err_0_to_1_p1;
      bit_err_1_to_0 <= bit_err_1_to_0_p1;
    end generate; -- esg3

  end generate; -- esg1










  ------------------------------------------------------------------------------
  --
  -- Multi-channel
  --
  mcg1 : if not(multi_channel) generate
  begin
    chan_ce   <= int_ce;

    chan_count_tc <= '1'; -- No channel counter, so terminal count is always high
  end generate; -- mcg1

  mcg2 : if multi_channel generate
    signal chan_count_clr : std_logic := '0';
  begin

    ----------------------------------------------------------------------------
    -- Instantiate channel counter
    --
    -- Channel counter keeps track of which channel the current symbol belongs
    -- to. It must be initialized to 0 by start_p1 because it needs to
    -- clear any pending chan_ce from previous counts. This would prematurely
    -- release the Forney counter.

    -- 2 channels is a special case as counter can be simplified
    mcg3 : if C_NUM_CHANNELS <= 2 generate
      signal chan_count0      : std_logic := '0';
      signal chan_count0_d_in : std_logic := '0';
    begin

      chan_count_clr <= start_p1;

      chan_count0_d_in <= not(chan_count0) and not(chan_count_clr);

      ccl1 : rs_reg_bit
      generic map (c_has_ce=>C_HAS_CE)
      port map (d=>chan_count0_d_in, clk=>clk, ce=>int_ce, q=>chan_count0);


      -- If there are only two channels just use chan_count as chan_count_tc.
      -- It is already registered.
      chan_count_tc <= chan_count0;
      chan_count(0) <= chan_count0;

    end generate; -- mcg3

    mcg4 : if C_NUM_CHANNELS > 2 generate
      constant pwr_of_2_channels : boolean := is_power_of_two(C_NUM_CHANNELS);
    begin

      -- Don't need to clear with terminal count as counter will just
      -- roll over.
      mcg4a : if pwr_of_2_channels generate
        chan_count_clr <= start_p1;
      end generate; -- mcg4a

      mcg4b : if not(pwr_of_2_channels) generate
        -- Channel counter must start counting 0,1,... as soon as start_bma
        -- pulse occurs.
        chan_count_clr <= start_p1 or chan_count_tc;

      end generate; -- mcg4b


      -- Instantiate channel counter
      cc1 : cntre_a
      generic map(
        width         => chan_count_width,
        use_count_to  => false,
        count_to      => C_NUM_CHANNELS - 1,
        sync_reset_to => 0,
        c_family      => C_FAMILY)
      port map(
        r   => chan_count_clr,
        ce  => int_ce,
        c   => clk,
        cnt => chan_count,
        tc  => open ); -- tc handled externally


      -- Look for C_NUM_CHANNELS-2 so we can register comparator output
      cmp1: comp_eq
      generic map (
        c_family      => C_FAMILY,
        width         => chan_count_width,
        comp_val      => C_NUM_CHANNELS-2,
        c_has_sclr    => 1,
        q_mode        => reg,
        c_sync_enable => c_no_override -- not cleared by int_sr
      )
      port map (
        i     => chan_count,
        c     => clk,
        ce    => int_ce,
        sclr  => start_p1,
        reset => '0',
        o     => open,
        o_reg => chan_count_tc
      );

    end generate; -- mcg4



    chan_ce <= chan_count_tc and int_ce;

  end generate; -- mcg2


end synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/sampler.vhd,v 1.6 2011/06/30 14:35:50 andreww Exp $
--
--------------------------------------------------------------------------------
-- Unit     : sampler
-- Function : Retimes primary inputs and handles higher rate clock
--            synchronization.
--            This unit also produces the final RFFD output.
--
--
-- Changes from v4.0
-- =================
-- Supports variable N input.
--
-- Clock Enable is now a true clock enable. It is no longer retimed with a
-- register. It will immediately freeze the state of the core.
--
-- sync is ignored if rffd_in = '0'
--
-- Changes from v5.1
-- =================
-- Supports variable R input.
--
-- Changes for v8.0
-- ================
-- Updated for AXI support.
-- Removed logic for multiple clocks per symbol, as this is now obsolete. Input
-- rate can be controlled through the input_tvalid signal instead.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Parameter: C_EVALUATION
--  1 for evaluation core, 0 for full core (no hardware timeout)
--
--------------------------------------------------------------------------------
-- The following Ports are provided:
--
-- Port: syndrome_piso_full
--  Input, high when Syndrome unit's PISO is full. The Syndrome unit might still be
--  ready for data, as it might not have a load PISO pending.
--
-- Port: load_piso_pending
--  Input, high when Syndrome unit is waiting to load its PISO or is actively loading
--  its PISO. The Syndrome unit is not ready for new data if <load_piso_pending> = '1'
--  and <syndrome_piso_full> = '1'
--
-- Port: nc_samples_avail
--  Input, high when the AXI input FIFO contains at least C_NUM_CHANNELS samples. Only valid
--  in multi-channel mode.
--
-- Port: input_chan_ce
--  Output, clock enable high when input processing is enabled and the input channel
--  counter is on the last channel.
--
-- Port: input_reg_ce
--  Output, clock enable for first level of input registers. Used by input side of CCSDS
--  conversion ROM at level above. Input registers need to hold their values when the
--  Syndrome PISO is full in the multi-channel case.
--
--
library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.ram64x1s; -- Required for hardware timeout

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.rs_blocks_pkg.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;
use rs_decoder_v9_0_12.dec_pkg.all;



entity sampler is
  generic (
    C_EVALUATION           : integer;
    C_NUM_CHANNELS         : integer;
    C_POLYNOMIAL           : integer;
    C_H                    : integer;
    C_R                    : integer;
    C_N                    : integer;
    C_SYMBOL_WIDTH         : integer;
    C_R_WIDTH              : integer;
    C_PUNC_SEL_WIDTH       : integer;
    C_HAS_PUNC_SEL         : integer;
    C_NUM_PUNC_PATTERNS    : integer;
    C_PUNCTURE_SELECT_FILE : string;
    C_PUNCTURE_VECTOR_FILE : string;
    C_HAS_MARKER_BITS      : integer;
    C_NUM_MARKER_BITS      : integer;
    C_HAS_CE               : integer;
    C_HAS_ERASE            : integer;
    C_HAS_N_IN             : integer;
    C_HAS_R_IN             : integer;
    C_IGNORE_ILLEGAL_N_R   : integer;
    C_DEFINE_LEGAL_R_VALS  : integer;
    C_NUM_LEGAL_R_VALUES   : integer;
    C_LEGAL_R_VECTOR_FILE  : string;
    C_HAS_ARESETN          : integer;
    C_SPEC                 : integer;
    C_MEMSTYLE             : integer;
    C_CLKS_PER_SYM         : integer;
    C_XDEVICEFAMILY        : string;
    C_FAMILY               : string;
    C_MEM_INIT_PREFIX      : string;
    C_ELABORATION_DIR      : string;
    C_SELF_RECOVERING      : integer
  );
  port (
    ctrl_fifo_not_empty            : in  std_logic;
    input_tvalid                   : in  std_logic;
    input_tlast                    : in  std_logic;
    nc_samples_avail               : in  std_logic;
    syndrome_piso_full             : in  std_logic;
    load_piso_pending              : in  std_logic;
    data_in                        : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    mark_in                        : in  std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
    n_in                           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in                           : in  std_logic_vector(C_R_WIDTH-1 downto 0);
    punc_sel                       : in  std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
    clk                            : in  std_logic;
    ce                             : in  std_logic;
    erase                          : in  std_logic;
    aresetn                        : in  std_logic;
    bma_dead                       : in  std_logic;
    ctrl_fifo_rd_en                : out std_logic;
    input_tready                   : out std_logic;
    input_chan_ce                  : out std_logic;
    input_pipe_ce                  : out std_logic;
    input_reg_ce                   : out std_logic;
    write_data_en                  : out std_logic;
    last_symbol                    : out std_logic;
    data_in_smpld                  : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    mark_in_smpld                  : out std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
    erase_init_coeff               : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    n_in_smpld                     : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
    r_in_smpld                     : out std_logic_vector(C_R_WIDTH-1 downto 0);
    punc_sel_smpld                 : out std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
    erase_smpld                    : out std_logic;
    slow_ce                        : out std_logic;
    sr_smpld                       : out std_logic;
    sync_smpld                     : out std_logic;
    event_s_input_tlast_missing    : out std_logic;
    event_s_input_tlast_unexpected : out std_logic;
    event_s_ctrl_tdata_invalid     : out std_logic
  );
end sampler;

--------------------------------------------------------------------------------
architecture synth of sampler is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Self recovery requires core to be able to synchronously reset itself
  constant c_has_sr_final : integer := boolean'pos((C_HAS_ARESETN /= 0) or (C_SELF_RECOVERING /= 0));

  -- <data_in_registered> is true if <data_in_smpld> will be a one cycle delayed version
  -- of <data_in>. If it is false then <data_in_smpled> = <data_in>
  -- The register may be in this entity or in the dual-basis conversion ROM at the level above, in
  -- the CCSDS case.
  constant data_in_registered : boolean := C_SPEC = ccsds_spec or (C_HAS_ERASE /= 0 and C_HAS_N_IN /= 0);

  constant multi_channel : boolean := (C_NUM_CHANNELS > 1);

  constant sym_cnt_width : integer := select_val(bitsneededtorepresent(C_N), C_SYMBOL_WIDTH, C_HAS_N_IN);

  subtype symbol_type is std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);

  subtype punc_sel_type is std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);

  subtype r_in_type is std_logic_vector(C_R_WIDTH-1 downto 0);
  subtype sym_cnt_type is std_logic_vector(sym_cnt_width-1 downto 0);

  -- Create Galois field array
  constant gfas   : integer := 2**C_SYMBOL_WIDTH;
  constant gf_max : integer := gfas - 1;
  constant gfasm2 : integer := gfas - 2;


  -- gf(2^sw) element array
  constant alpha_to : integer_array_type(0 to gfasm2) := gf_calc_elements(C_SYMBOL_WIDTH, C_POLYNOMIAL);


  signal erase_smpld_db      : std_logic := '0';
  signal int_ce              : std_logic := '0';
  signal n_in_smpld_db       : symbol_type := (others => '0');
  signal r_in_smpld_db       : r_in_type := (others => '0');
  signal punc_sel_smpld_db   : punc_sel_type := (others => '0');
  signal sr_smpld_out        : std_logic := '0';
  signal sr_smpld_tmp        : std_logic := '0';
  signal sync_smpld_out      : std_logic := '0';
  signal valid_n_in          : std_logic := '0';
  signal valid_r_in          : std_logic := '0';
  signal valid_n_r_in        : std_logic := '1';

  signal input_tready_tmp           : std_logic := '0';
  signal input_tready_final         : std_logic := '0';
  signal rffd_int                   : std_logic := '0';
  signal penultimate_symbol_sampled : std_logic := '0';
  signal input_reg_ce_tmp           : std_logic := '0';
  signal load_sym_cnt               : std_logic := '0';
  signal first_symbol               : std_logic := '0';
  signal last_sample                : std_logic := '0';
  signal last_symbol_tmp            : std_logic := '0';
  signal reset_input_tready         : std_logic := '0';
  signal reset_rffd                 : std_logic := '0';
  signal set_rffd                   : std_logic := '0';
  signal chan_count_tc              : std_logic := '0';
  signal cnt_ce                     : std_logic := '0';
  signal sym_cnt_ce                 : std_logic := '0';
  signal sync_qualifier             : std_logic := '0';
  signal synd_ce_tmp                : std_logic := '0';
  signal synd_input_chan_count_tc   : std_logic := '0';
  signal sym_cnt                    : sym_cnt_type := (others => '0');
  signal n_in_safe                  : symbol_type := (others => '0');
  signal r_in_safe                  : r_in_type := (others => '0');
  signal valid_sample               : std_logic := '0';
  signal valid_sample_d1            : std_logic := '0';
  signal write_data_en_tmp          : std_logic := '0';

  signal event_s_input_tlast_missing_tmp    : std_logic := '0';
  signal event_s_input_tlast_unexpected_tmp : std_logic := '0';
  signal event_s_ctrl_tdata_invalid_tmp     : std_logic := '0';



  -- Force a LUT for these signals or XST will merge the logic for these into
  -- their destinations. This uses up more LUT inputs at the destination and
  -- results in an overall higher LUT count.
  attribute keep of sr_smpld_out   : signal is "true";
  attribute keep of sync_smpld_out : signal is "true";

  ------------------------------------------------------------------------------
  -- Filenames dealt with outside of main block due to XCC problem. This might not be required anymore.
  constant q_puncture_select_file : string := C_PUNCTURE_SELECT_FILE;
  attribute qualified_by_project_dir of q_puncture_select_file: constant is true;
  constant q_puncture_vector_file : string := C_PUNCTURE_VECTOR_FILE;
  attribute qualified_by_project_dir of q_puncture_vector_file: constant is true;


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
  signal gcs_do : std_logic := '0';

  -- Tell XST not to use set/reset lines when LUTs will do fine
  attribute use_sync_set of dsc: signal is "no";
  attribute use_sync_set of m: signal is "no";
  attribute use_sync_set of w: signal is "no";
  attribute use_sync_set of v: signal is "no";
  attribute use_sync_set of f: signal is "no";

  attribute use_sync_reset of dsc: signal is "no";
  attribute use_sync_reset of m: signal is "no";
  attribute use_sync_reset of w: signal is "no";
  attribute use_sync_reset of v: signal is "no";
  attribute use_sync_reset of f: signal is "no";

  attribute use_clock_enable of dsc: signal is "no";
  attribute use_clock_enable of m: signal is "no";
  attribute use_clock_enable of w: signal is "no";
  attribute use_clock_enable of v: signal is "no";
  attribute use_clock_enable of f: signal is "no";

  attribute use_carry_chain of i: signal is "yes";
  --
  -- end of hardware timeout circuit declarations
  ------------------------------------------------------------------------------


begin

--bk1 : block -- Dummy block so qualified_by_project_dir works
bk1 : if true generate

  -- Use <num_punc_patterns> when declaring <puncture_select_vector> rather than
  -- <C_NUM_PUNC_PATTERNS>, as this could be 0 and cause a Lint error due to negative vector range
  constant num_punc_patterns : integer := select_val(1, C_NUM_PUNC_PATTERNS, C_NUM_PUNC_PATTERNS);

  -- Need to know smallest number of punctures to determine minimum legal r_in
  constant puncture_select_vector : XBIP_UTILS_integer_vector(0 TO num_punc_patterns-1)
           := get_integer_vector_from_mif(C_NUM_PUNC_PATTERNS > 0,
                                          q_puncture_select_file,
                                          C_ELABORATION_DIR,
                                          num_punc_patterns,
                                          mif_width);

  -- Force to 1 if not using puncturing to avoid a negative length vector
  constant puncture_vector_length : integer := select_val(1, get_sum(puncture_select_vector), C_NUM_PUNC_PATTERNS);

  -- Need to know which symbols are punctured to determine minimum legal n_in value
  constant puncture_vector : XBIP_UTILS_integer_vector(0 to puncture_vector_length-1)
           := get_integer_vector_from_mif(C_NUM_PUNC_PATTERNS > 0,
                                          q_puncture_vector_file,
                                          C_ELABORATION_DIR,
                                          puncture_vector_length,
                                          mif_width);


  -- Need to know legal r_in values so values outside absolute min and max can be ignored
  constant legal_r_vector : XBIP_UTILS_integer_vector(0 to C_NUM_LEGAL_R_VALUES-1)
           := get_integer_vector_from_mif((C_HAS_R_IN /= 0 and C_DEFINE_LEGAL_R_VALS /= 0 ),
                                           C_LEGAL_R_VECTOR_FILE,
                                           C_ELABORATION_DIR,
                                           C_NUM_LEGAL_R_VALUES,
                                           mif_width);

  -- Determine minimum and maximum allowable r_in values
  constant r_in_limits : min_max_int_type :=
    get_r_in_limits(c_has_r_in             => C_HAS_R_IN,
                    legal_r_vector         => legal_r_vector,
                    define_legal_r_values  => C_DEFINE_LEGAL_R_VALS,
                    has_puncturing         => C_NUM_PUNC_PATTERNS > 0,
                    puncture_select_vector => puncture_select_vector,
                    n_minus_k              => C_R,
                    c_spec                 => C_SPEC);

  constant n_in_limits : min_max_int_type :=
    get_n_in_limits(c_has_n_in             => C_HAS_N_IN,
                    c_n                    => C_N,
                    num_punc_patterns      => C_NUM_PUNC_PATTERNS,
                    puncture_vector        => puncture_vector,
                    puncture_select_vector => puncture_select_vector);



  -- If n_in is less than <min_n_in> it is illegal and <event_s_ctrl_tdata_invalid> should be asserted
  constant min_k_in     : integer := decoder_min_k;
  constant min_k_plus_r : integer := r_in_limits.min + min_k_in;
  constant min_n_in     : integer := max_of(min_k_plus_r, n_in_limits.min);

  --constant debug_temp1  : boolean := display_int3(r_in_limits.min, n_in_limits.min, min_k_plus_r);



begin

  int_ce <= ce;


  ------------------------------------------------------------------------------
  -- Primary outputs
  --
  ------------------------------------------------------------------------------

  -- Previous versions of core provided a slow rate clock enable; however this is obsolete with AXI,
  -- so always drive <slow_ce> output with the global clock enable.
  slow_ce         <= int_ce;
  sr_smpld        <= sr_smpld_out;
  sync_smpld      <= sync_smpld_out;
  -- <sync_qualifier> is set to '0' after hardware timeout if <C_EVALUATION> = '0'
  sync_smpld_out  <= first_symbol and sync_qualifier; -- Signals first sample on <data_in_smpld>

  punc_sel_smpld  <= punc_sel_smpld_db;
  n_in_smpld      <= n_in_safe;
  r_in_smpld      <= r_in_safe;

  -- Read ctrl FIFO once (and only once). <set_rffd> can be use to read ctrl FIFO, so
  -- that ctrl info for next block is available at same time as first data symbol is
  -- on AXI input FIFO <rd_data> output. <set_rffd> can be high for more than one clock
  -- cycle, so gate with <rffd_int> to ensure ctrl FIFO is read only once per block.
  ctrl_fifo_rd_en <= set_rffd and not(rffd_int) and int_ce;

  input_tready    <= input_tready_final;
  input_chan_ce   <= synd_ce_tmp and synd_input_chan_count_tc;
  input_pipe_ce   <= synd_ce_tmp;
  input_reg_ce    <= input_reg_ce_tmp;
  write_data_en   <= write_data_en_tmp;
  last_symbol     <= last_symbol_tmp;


  event_s_input_tlast_missing    <= event_s_input_tlast_missing_tmp;
  event_s_input_tlast_unexpected <= event_s_input_tlast_unexpected_tmp;
  event_s_ctrl_tdata_invalid     <= event_s_ctrl_tdata_invalid_tmp;




  ------------------------------------------------------------------------------
  -- Handle optional synchronous reset
  -- aresetn is active low, so is inverted to make an sclr, but is also
  -- registered for speed, as the sclr port on many primitives is slow.
  --
  -- For some reason, this register appears as a coverage hole when performing
  -- Modelsim code coverage.  It's definitely active and toggling (as seen in
  -- local simulation), and does not appear to be a -vopt issue.  This has not
  -- been excluded from coverage collection in case it has to be investigated later.
  --
  srg: if C_HAS_ARESETN /= 0 generate
  begin

    srp1 : process(clk)
    begin

      if rising_edge(clk) then
        sr_smpld_tmp <= not aresetn;
      end if; -- rising_edge(clk)

    end process; -- srp1

  end generate; -- srg

  n_srg: if C_HAS_ARESETN = 0 generate
  begin
    sr_smpld_tmp <= '0';
  end generate; -- n_srg






  -- If BMA state machine is stuck then force a synchronous reset. This should
  -- never happen but is possible if there are clock glitches, etc.
  pg0 : if C_SELF_RECOVERING /= 0 generate
    signal bma_dead_q : std_logic := '0';
  begin
    -- Retime "dead" signal to reduce number of logic levels on signal. It will
    -- not matter if circuit remains dead for 1 extra clock cycle.
    ff9 : rs_reg_bit
    generic map (c_has_ce=>C_HAS_CE, c_has_sclr=>c_has_sr_final)
    port map (d=>bma_dead, clk=>clk, sclr=>sr_smpld_out, ce=>int_ce, q=>bma_dead_q);


    -- Handle optional sr pin
    sr_smpld_out <= sr_smpld_tmp or bma_dead_q;

  end generate; -- pg0

  pg1 : if C_SELF_RECOVERING = 0 generate
    sr_smpld_out <= sr_smpld_tmp;
  end generate; -- pg1



  ------------------------------------------------------------------------------
  -- Handle optional punc_sel port
  psg1 : if C_HAS_PUNC_SEL /= 0 generate
    punc_sel_smpld_db <= punc_sel;
  end generate; -- psg1

  psg1a : if C_HAS_PUNC_SEL = 0 generate
    punc_sel_smpld_db <= (others=>'0');
  end generate; -- psg1a



  ------------------------------------------------------------------------------
  -- Handle optional n_in port
  nig1 : if C_HAS_N_IN /= 0 generate

    n_in_smpld_db <= n_in;


    -- Check for illegal n_in
    -- Note this only checks absolute limits. It doesn't check n_in against r_in.
    vng1 : if C_IGNORE_ILLEGAL_N_R /= 0 generate
    begin

      cmp3 : rs_compare
      generic map (
        instance_name => "sampler_cmp3",
        c_family      => C_FAMILY,
        c_width       => C_SYMBOL_WIDTH,
        c_b_constant  => 1,
        c_b_value     => int_2_logic_string(min_n_in, C_SYMBOL_WIDTH),
        c_has_a_ge_b  => 1)
      port map (
        a      => n_in_smpld_db(C_SYMBOL_WIDTH-1 downto 0),
        b      => n_in_smpld_db(C_SYMBOL_WIDTH-1 downto 0), -- not used
        a_ge_b => valid_n_in);
    end generate; -- C_IGNORE_ILLEGAL_N_R


    -- Use only if illegal n_in values guaranteed not to occur (otherwise core could hang up).
    vng2 : if C_IGNORE_ILLEGAL_N_R = 0 generate
      valid_n_in <= '1';
    end generate; -- C_IGNORE_ILLEGAL_N_R



    ----------------------------------------------------------------------------
    -- ROM address must be available one cycle before first data sample is fed to
    -- syndrome unit or init_val_sig will be produced too late for start pulse
    -- in erasure unit.
    --
    nig4 : if C_HAS_ERASE /= 0 generate
      constant ecr_addr_width : integer := C_SYMBOL_WIDTH;
      signal ecr_addra : symbol_type := (others => '0');
    begin

      ecr_addra <= n_in_safe;

      -- ROM to hold initialization value (= alpha^h(n-1)) for all possible n_in values.
      -- Doesn't matter if n_in changes after sync pulse because
      -- erase_init_val_sig is only required once during erasure start pulse.
      ecr : gf_erase_const_rom
      generic map (
        symbol_width      => C_SYMBOL_WIDTH,
        alpha_to          => alpha_to,
        h_param           => C_H,
        c_has_ce          => C_HAS_CE,
        memstyle          => C_MEMSTYLE,
        c_addr_width      => ecr_addr_width,
        c_xdevicefamily   => C_XDEVICEFAMILY,
        c_family          => C_FAMILY,
        c_mem_init_prefix => C_MEM_INIT_PREFIX,
        c_elaboration_dir => C_ELABORATION_DIR)
      port map (
        ce     => int_ce,
        clk    => clk,
        addra  => ecr_addra,
        addrb  => ecr_addra, -- not used
        dout_a => erase_init_coeff,
        dout_b => open );

    end generate; -- nig4


  end generate; -- nig1



  nig1a : if C_HAS_N_IN = 0 generate
    constant n_in_max : symbol_type := std_logic_vector(to_unsigned(C_N, C_SYMBOL_WIDTH));
  begin
    n_in_smpld_db <= n_in_max;
    valid_n_in <= '1';
  end generate; -- nig1a





  ------------------------------------------------------------------------------
  -- Handle optional r_in port
  rig1 : if C_HAS_R_IN /= 0 generate

    r_in_smpld_db <= r_in;

    -- If r_in=0 is sampled it will cause the decoder to lock up so it must be detected
    vrg1 : if C_IGNORE_ILLEGAL_N_R /= 0 generate
      signal r_in_le_max : std_logic := '0';
      signal r_in_ge_min : std_logic := '0';
      constant r_in_limits_min2 : boolean := (r_in_limits.min = 2);
    begin

      -- Use trick of ignoring LSB and checking all other bits = 0 to see if r_in >= 2
      vrg1a : if r_in_limits_min2 generate
      begin
        cmp1 : comp_neq
        generic map (c_family=>C_FAMILY, width=>C_R_WIDTH-1, comp_val=>0, q_mode=>no_reg)
        port map (i=>r_in_smpld_db(C_R_WIDTH-1 downto 1), o=>r_in_ge_min);
      end generate; -- vrg1a

      vrg1b : if not(r_in_limits_min2) generate
      begin
        r_in_ge_min <= '1' when unsigned(r_in_smpld_db) >= to_unsigned(r_in_limits.min, C_R_WIDTH) else '0';
      end generate; -- vrg1b



      cmp2 : rs_compare
      generic map (c_family     => C_FAMILY,
                   c_width      => C_R_WIDTH,
                   c_b_constant => 1,
                   c_b_value    => int_2_logic_string(r_in_limits.max, C_R_WIDTH),
                   c_has_a_le_b => 1)
      port map (a      => r_in_smpld_db,
                b      => r_in_smpld_db, -- not used
                a_le_b => r_in_le_max);

      valid_r_in <= r_in_le_max and r_in_ge_min;

    end generate; -- vrg1


    -- Use only if illegal r_in values guaranteed not to occur (otherwise core could hang up).
    vrg2 : if C_IGNORE_ILLEGAL_N_R = 0 generate
      valid_r_in <= '1';
    end generate; -- vrg2

  end generate; -- rig1


  rig1a : if C_HAS_R_IN = 0 generate
    constant r_in_max : r_in_type := std_logic_vector(to_unsigned(C_R, C_R_WIDTH));
  begin
    r_in_smpld_db <= r_in_max;
    valid_r_in <= '1';
  end generate; -- rig1a



  ------------------------------------------------------------------------------
  -- Check N - R is legal (i.e. >= minimum K)
  nrig1a : if C_HAS_N_IN /= 0 and C_HAS_R_IN /= 0 generate
    constant min_k_vec     : signed(C_SYMBOL_WIDTH downto 0) := to_signed(min_k_in, C_SYMBOL_WIDTH+1);
    signal n_in_minus_r_in : signed(C_SYMBOL_WIDTH downto 0) := min_k_vec; -- 1 bit wider than n_in
  begin

    -- Generate a subtracter to compute N-R and a comparator to check N-R >= min K
    nmrp1 : process(clk)
    begin

      if rising_edge(clk) then

        -- Reset to a valid value
        if sr_smpld_out = '1' then
          n_in_minus_r_in <= min_k_vec;
          valid_n_r_in    <= '1';

        -- Only enable when valid samples are being consumed
        elsif cnt_ce = '1' then
          n_in_minus_r_in <= signed('0' & n_in_smpld_db) - signed('0' & r_in_smpld_db);

          valid_n_r_in <= GLB_to_std_logic(n_in_minus_r_in >= min_k_vec);

        end if; -- cnt_ce = '1'

      end if; -- rising_edge(clk)

    end process; -- nmrp1

  end generate; -- nrig1a

  nrig1b : if C_HAS_N_IN = 0 or C_HAS_R_IN = 0 generate
  begin
    valid_n_r_in <= '1';
  end generate; -- nrig1b


  ------------------------------------------------------------------------------
  -- Handle optional erase pin
  eg : if C_HAS_ERASE /= 0 generate
  begin
    erase_smpld_db <= erase;
  end generate; -- eg

  neg : if C_HAS_ERASE = 0 generate
  begin
    erase_smpld_db <= '0';
  end generate; -- neg




  ------------------------------------------------------------------------------
  -- Registers enabled by <int_ce>
  --
  icep0 : process (clk)
  begin
    if rising_edge(clk) then

      if sr_smpld_out = '1' then
        rffd_int <= '0';
        -- AXI interface must not assert tready until aresetn has gone high
        input_tready_tmp <= '0';

      elsif int_ce = '1' then

        -- SR flip-flop for <rffd_int> - Ready for First Data. Set overrides reset.
        -- This is high when the next sample will be the first of a new block.
        -- It remains high while all <C_NUM_CHANNELS> samples of the first symbol
        -- are on the AXI input FIFO <rd_data> output.
        rffd_int <= (rffd_int and not(reset_rffd)) or set_rffd;

        -- SR flip-flop for <input_tready>
        -- <reset_input_tready> is driven differently depending on whether core is multi-channel
        -- or not. Timing is different for multi-channel case.
        input_tready_tmp <= (input_tready_tmp and not(reset_input_tready)) or set_rffd;

      end if; -- sr_smpld_out

    end if; -- rising_edge(clk)

  end process; -- icep0


  -- Reset <rffd> when the first symbol (all channels) has been sampled
  reset_rffd <= valid_sample and chan_count_tc;






  ------------------------------------------------------------------------------
  -- In the following cases the control signals to the Syndrome unit need to be
  -- delayed by one clock cycle:
  -- 1. CCSDS mode - to compensate for one cycle delay of CCSDS dual-basis conversion
  --    ROM (one level up from this entity), which delays data_in by 1 cycle
  -- 2. If C_HAS_ERASE=1 and C_HAS_N_IN then there is a one cycle delay from
  --    n_in to <erase_init_coeff> going to the Syndrome unit. This signal must be
  --    valid when the sync pulse is applied to the Syndrome unit, so sync and
  --    data_in must be delayed by one cycle.
  --
  dbg1 : if data_in_registered generate
    signal synd_input_chan_count_tc_reg : std_logic := '0';
  begin
    -- Registers enabled by <cnt_ce>
    ccep2 : process (clk)
    begin
      if rising_edge(clk) then
        if sr_smpld_out = '1' then
          first_symbol                 <= '0';
          synd_input_chan_count_tc_reg <= '0';

        elsif cnt_ce = '1' then
          -- If <cnt_ce>='1' there must have been a valid sample, and if <first_symbol>='1'
          -- this must be the first symbol of a new block
          -- Gate with <last_sample> to prevent <first_symbol> being asserted while <rffd_int>
          -- is high and <input_tready and <input_tvalid> are asserted but data for the next
          -- block isn't on the Syndrome unit inputs yet. This can happen in the 3 channel
          -- case.
          first_symbol <= rffd_int and not(last_sample);

          -- Delay <chan_count_tc> by 1 to match delay on data to Syndrome unit in multi-channel case
          synd_input_chan_count_tc_reg <= chan_count_tc;
        end if; -- sr_smpld_out
      end if; -- rising_edge(clk)
    end process; -- ccep2

    synd_input_chan_count_tc <= synd_input_chan_count_tc_reg;


    -- Registers enabled by <int_ce>
    ccp1 : process (clk)
    begin
      if rising_edge(clk) then

        if sr_smpld_out = '1' then
          valid_sample_d1 <= '0';
        elsif int_ce = '1' then
          valid_sample_d1 <= input_tvalid and input_tready_final;
        end if; -- sr_smpld_out

        -- The following registers do not need to be reset
        if input_reg_ce_tmp = '1' then
          erase_smpld   <= erase_smpld_db;
          mark_in_smpld <= mark_in;
        end if; -- sr_smpld_out

      end if; -- rising_edge(clk)

    end process; -- ccp1

    -- Data for main FIFO is delayed by 1 cycle if inputs registered
    write_data_en_tmp <= valid_sample_d1 and int_ce;

  end generate; -- dbg1


  -- Data is just passed straight through in this case and control signals to Syndrome
  -- do not need to be delayed.
  dbg2 : if not(data_in_registered) generate
    -- Everything that uses <first_symbol> is gated with tvalid and tready so don't
    -- need to gate <rffd_int> as well.
    -- Gate with <last_sample> to prevent <first_symbol> being asserted while <rffd_int>
    -- is high and <input_tready and <input_tvalid> are asserted but data for the next
    -- block isn't on the Syndrome unit inputs yet. This can happen in the two channel
    -- case.
    first_symbol <= rffd_int and not(last_sample);

    erase_smpld       <= erase_smpld_db;
    mark_in_smpld     <= mark_in;
    write_data_en_tmp <= input_tvalid and input_tready_final and int_ce;
    -- Input channel count terminal count to be used in Syndrome unit
    synd_input_chan_count_tc <= chan_count_tc;

  end generate; -- dbg2


  -- Data only registered if it needs to be delayed due to delay on <erase_init_coeff>
  -- and it isn't already delayed by CCSDS dual-basis convesion ROM
  dbg3 : if C_SPEC = ccsds_spec or (C_HAS_ERASE = 0 or C_HAS_N_IN = 0) generate
    data_in_smpld <= data_in;
  end generate; -- dbg3

  dbg4 : if C_SPEC /= ccsds_spec and (C_HAS_ERASE /= 0 and C_HAS_N_IN /= 0) generate
    ccp2 : process (clk)
    begin
      if rising_edge(clk) then
        if input_reg_ce_tmp = '1' then
          data_in_smpld <= data_in;
        end if;
      end if; -- rising_edge(clk)
    end process; -- ccp2
  end generate; -- dbg4




  ------------------------------------------------------------------------------
  -- Symbol Counter and tvalid/tready logic
  --

  -- Don't try and modify input n_in or r_in values if they are illegal as core will just end
  -- up expecting the wrong number of samples and system will be out of sync.
  -- event_s_ctrl_tdata_invalid will be asserted if values are illegal and core will have to be reset.
  n_in_safe <= n_in_smpld_db;
  r_in_safe <= r_in_smpld_db;

  -- Clock enable for channel counter
  cnt_ce <= input_tvalid and input_tready_final and int_ce;

  -- Clock enable for symbol counter (= <cnt_ce> in single channel case)
  sym_cnt_ce <= chan_count_tc and input_tvalid and input_tready_final and int_ce;

  -- If tvalid='1' and tready='1' then this must be a valid sample
  valid_sample <= input_tvalid and input_tready_final;


  -- Count down from N to 3. Counter is not loaded until after 2nd symbol has been sampled, hence
  -- count down to 3 to detect last symbol sampled on primary input. This can then be used to change
  -- state of tready and <rffd>.
  c1 : cntre_d
  generic map (width=>sym_cnt_width)
  port map (c=>clk, ce=>sym_cnt_ce, sclr=>sr_smpld_out, rclr=>last_sample,
            load=>load_sym_cnt, din=>n_in_safe(sym_cnt_width-1 downto 0), cnt=>sym_cnt);


  -- Registers enabled by <sym_cnt_ce>
  scep1 : process (clk)
    -- Counter is loaded one cycle later if data_in is registered in single channel case,
    -- so need compare value for last symbol to be one higher.
    constant penultimate_sym_cnt_value : integer := select_val_b(3, 4, data_in_registered and not(multi_channel));
  begin
    if rising_edge(clk) then

      if sr_smpld_out = '1' then
        penultimate_symbol_sampled <= '0';

      elsif sym_cnt_ce = '1' then
        -- Detect penultimate symbol being sampled
        penultimate_symbol_sampled <= GLB_to_std_logic(unsigned(sym_cnt) = penultimate_sym_cnt_value);
      end if; -- sr_smpld_out

    end if; -- rising_edge(clk)

  end process; -- scep1


  -- Registers enabled by <cnt_ce>
  ccep1 : process (clk)
  begin
    if rising_edge(clk) then

      if sr_smpld_out = '1' then
        event_s_input_tlast_missing_tmp    <= '0';
        event_s_input_tlast_unexpected_tmp <= '0';
        event_s_ctrl_tdata_invalid_tmp     <= '0';

      elsif cnt_ce = '1' then
        -- Assert event output if an error condition is detected. Keep event output
        -- asserted until the next "beat" (=valid sample) when the error condition
        -- does not exist, hence clock enable with <cnt_ce>
        event_s_input_tlast_missing_tmp    <= last_sample and chan_count_tc and not(input_tlast);

        event_s_input_tlast_unexpected_tmp <= not(last_sample and chan_count_tc) and input_tlast;

        -- Keep <event_s_ctrl_tdata_invalid> asserted once it has occurred. Core must be reset to recover.
        event_s_ctrl_tdata_invalid_tmp     <= not(valid_r_in) or not(valid_n_in) or not(valid_n_r_in) or
                                              event_s_ctrl_tdata_invalid_tmp;
      end if; -- sr_smpld_out

    end if; -- rising_edge(clk)

  end process; -- ccep1




  ------------------------------------------------------------------------------
  mcg1 : if not(multi_channel) generate
  begin

    -- Generate <last_symbol>. This signals last symbol is on Syndrome unit input
    mcg1a : if data_in_registered generate
    begin
      -- Registers enabled by <int_ce>
      lsp1 : process (clk)
      begin
        if rising_edge(clk) then

          if sr_smpld_out = '1' then
            last_symbol_tmp <= '0';
          elsif int_ce = '1' then
            last_symbol_tmp <= last_sample;
          end if; -- sr_smpld_out

        end if; -- rising_edge(clk)
      end process; -- lsp1
    end generate; -- mcg1a

    mcg1b : if not(data_in_registered) generate
      last_symbol_tmp <= last_sample;
    end generate; -- mcg1b


    -- Clock enable for input registers (only present if <data_in_registered> is true)
    -- input registers do not need to hold their values if the Syndrome unit is stalled
    -- because its PISO is full, as the last sample will be safely held in the Syndrome
    -- scell reg and the next sample will be held on the AXI FIFO output.
    input_reg_ce_tmp <= int_ce;

    -- Write data to Syndrome unit as it it written to main FIFO
    synd_ce_tmp <= write_data_en_tmp;


    -- Load symbol counter when first symbol is on sampler output
    load_sym_cnt <= first_symbol;

    -- Once penultimate symbol has been sampled then the next valid input must be the last symbol.
    last_sample <= valid_sample and penultimate_symbol_sampled;

    -- Reset input_tready after last sample taken. <set_rffd> will override this if Syndrome unit is
    -- ready to take more data.
    reset_input_tready <= last_sample;

    input_tready_final <= input_tready_tmp;

    -- Set <rffd_int> on last symbol if the Syndrome PISO is not full or...
    --  The last sample has already been taken (<input_tready_final> = '0' and the Syndrome unit is not full.
    -- Keep <rffd_int> low if <last_symbol_tmp> = '1' in this case, as there is a one cycle delay
    -- in <load_piso_pending> going high if the data input is registered.
    -- Do not set if the ctrl FIFO is empty, as input channel must be blocked until ctrl information is available.
    set_rffd <= ctrl_fifo_not_empty and
                ((last_sample and not(syndrome_piso_full)) or
                 (not(last_symbol_tmp) and not(input_tready_final) and
                  not(syndrome_piso_full and load_piso_pending))
                );

  end generate; -- mcg1


  mcg2 : if multi_channel generate
  begin

    -- Generate <last_symbol>. This signals last symbol is on Syndrome unit input.
    mcg2a : if data_in_registered generate
    begin
      -- This is as SR flip-flop, set by <last_sample> and reset when <last_sample> has
      -- gone low and the Syndrome PISO is empty. We can't simply delay <last_sample>
      -- because this won't work if <C_NUM_CHANNELS> = 2, as <last_sample> could go low
      -- long before the PISO is empty and the last symbol remains on the Syndrome inputs
      -- until the PISO is detected empty.
      lsp2 : process (clk)
      begin
        if rising_edge(clk) then

          if sr_smpld_out = '1' then
            last_symbol_tmp <= '0';
          elsif int_ce = '1' then
            last_symbol_tmp <= (last_symbol_tmp and (last_sample or syndrome_piso_full)) or
                               last_sample;
          end if; -- sr_smpld_out

        end if; -- rising_edge(clk)
      end process; -- lsp2

    end generate; -- mcg2a

    mcg2b : if not(data_in_registered) generate
    begin
      last_symbol_tmp <= last_sample;
    end generate; -- mcg2b


    -- Clock enable for Syndrome input side
    -- Do not retime this if inputs are registered because input registers are treated as
    -- part of the Syndrome input processing and need to hold their values.
    -- Keep enabled when <last_symbol> is asserted and the PISO is being loaded to shift
    -- data out of the input registers.
    synd_ce_tmp <= ((input_tvalid and input_tready_final) or
                    (last_symbol_tmp and not(syndrome_piso_full))) and int_ce;


    -- Clock enable for input registers (only present if <data_in_registered> is true)
    -- Treat input registers as if they are part of the Syndrome unit in multi-channel case
    -- as they need to hold their values if they Syndrome input pipeline is disabled because
    -- the Syndrom PISO is full.
    input_reg_ce_tmp <= synd_ce_tmp;


    -- In multi-channel case sym_cnt keeps track of count of symbols on input to sampler
    -- and not output of sampler, so use <rffd_int> instead of <first_symbol>
    load_sym_cnt <= rffd_int;


    -- Once penultimate symbol has been sampled then the <penultimate_symbol_sampled> will
    -- remain asserted until the next <chan_tc> pulse.
    last_sample <= penultimate_symbol_sampled;

    -- Generate signal to reset input_tready. <set_rffd> will override this if Syndrome unit is ready
    -- to take more data.
    -- Reset if the last symbol has just been sampled and the PISO is full
    -- Use <last_symbol> to reset the register rather than <last_sample> to
    -- allow 1 extra clock cycle in the registered input case, so that if the
    -- PISO is full 3 values will be read from the AXI input FIFO before input_tready
    -- goes low - i.e. One for the Syndrome scell reg, one for the input reg and
    -- a third on the output of the AXI input FIFO, then once the PISO is empty and
    -- <load_piso> is asserted in the Syndrome unit, these values will be loaded into
    -- the Syndrome unit.
    reset_input_tready <= last_symbol_tmp and not(rffd_int);

    -- Set rffd at end of last sample regardless of <syndrome_piso_full> as first sample of
    -- next block could already have been read from AXI FIFO
    -- Do not set if the ctrl FIFO is empty, as input channel must be blocked until ctrl information is available
    mcg2e : IF C_NUM_CHANNELS > 2 or data_in_registered generate
      --    set_rffd <= not(rffd_int) and ctrl_fifo_not_empty and
      set_rffd <= ctrl_fifo_not_empty and
                  ((last_sample and chan_count_tc) or (not(last_sample) and not(input_tready_tmp)));
    end generate; -- mcg2e

    mcg2f : IF C_NUM_CHANNELS <= 2 and not(data_in_registered) generate
      -- Don't assert <set_rffd> if PISO is full, as last symbol of previous block will
      -- be held on AXI FIFO output and we are not ready for a new block until the PISO
      -- is empty.
      set_rffd <= ctrl_fifo_not_empty and
                  ((last_sample and chan_count_tc and not(syndrome_piso_full)) or
                   (not(last_sample) and not(input_tready_tmp)));
    end generate; -- mcg2f



    mcg2c : if C_NUM_CHANNELS > 2 and not(data_in_registered and C_NUM_CHANNELS <= 3) generate
    begin
      -- Only allow input_tready if input FIFO contains at least <C_NUM_CHANNELS> samples or
      -- we have started processing the last sample and the Syndrome unit PISO is not full.
      -- If the Syndrome unit PISO is full then the Syndrome unit must be stalled until it
      -- can be loaded and the samples for the last symbol are held in the input FIFO.
      -- Once <last_sample> is high we don't care about <nc_samples_avail> because <last_sample>
      -- can only be set once all the samples for the final symbol are in the AXI input FIFO.
      input_tready_final <= (input_tready_tmp and (nc_samples_avail or last_sample)) or
                            (last_sample and not(syndrome_piso_full));

    end generate; -- mcg2c

    mcg2d : if C_NUM_CHANNELS <= 2 or (data_in_registered and C_NUM_CHANNELS <= 3) generate
    begin
      -- Same as for > 2 channels, except do not allow <input_tready_tmp> to drive signal high
      -- if <last_symbol_tmp> AND <syndrome_piso_full>. This can happen if <set_rffd> sets
      -- <input_tready_tmp> high while <syndrome_piso_full> is still asserted.
      -- If inputs are registered this can happen for 3 channels or less.
      input_tready_final <= (input_tready_tmp and (nc_samples_avail or last_sample) and
                             not(last_symbol_tmp and syndrome_piso_full and rffd_int)) or
                            (last_sample and not(syndrome_piso_full));

    end generate; -- mcg2d


  end generate; -- mcg2






  ------------------------------------------------------------------------------
  -- Channel Counter Logic
  -- Channel counter keeps track of which channel the current symbol belongs to.
  --
  mcg3 : if not(multi_channel) generate
  begin
    chan_count_tc <= '1'; -- No channel counter, so terminal count is always high
  end generate; -- mcg3

  mcg4 : if multi_channel generate
    constant chan_count_width : integer := bitsneededtorepresent(C_NUM_CHANNELS-1);
    signal chan_count     : std_logic_vector(chan_count_width-1 downto 0);
    signal chan_count_clr : std_logic;
  begin

    -- 2 channels is a special case as counter can be simplified
    mcg3 : if C_NUM_CHANNELS <= 2 generate
      signal chan_count0_d_in : std_logic;
    begin

      chan_count_clr <= set_rffd;

      chan_count0_d_in <= not(chan_count(0)) and not(chan_count_clr);

      ccl1 : rs_reg_bit
      generic map (c_has_ce=>1, c_has_sclr=>1)
      port map (d=>chan_count0_d_in, clk=>clk, ce=>cnt_ce, sclr=>sr_smpld_out, q=>chan_count(0));


      -- If there are only two channels just use chan_count as chan_count_tc.
      -- It is already registered.
      chan_count_tc <= chan_count(0);

    end generate; -- mcg3

    mcg4a : if C_NUM_CHANNELS > 2 generate
      constant pwr_of_2_channels : boolean := is_power_of_two(C_NUM_CHANNELS);
      signal chan_count_tc_reg   : std_logic := '0';
    begin

      -- Don't need to clear with terminal count as counter will just roll over.
      mcg4a : if pwr_of_2_channels generate
      begin
        chan_count_clr <= set_rffd;
      end generate; -- mcg4a

      mcg4b : if not(pwr_of_2_channels) generate
      begin
        -- Channel counter must be reset when it reaches the terminal count
        chan_count_clr <= set_rffd or chan_count_tc;
      end generate; -- mcg4b


      -- Instantiate channel counter
      cc1 : cntre_a
      generic map(
        width         => chan_count_width,
        use_count_to  => false,
        count_to      => C_NUM_CHANNELS - 1,
        sync_reset_to => 0,
        c_family      => C_FAMILY)
      port map(
        sclr => sr_smpld_out, -- overrides ce
        r    => chan_count_clr,
        ce   => cnt_ce, -- Only enable when there is a valid sample
        c    => clk,
        cnt  => chan_count,
        tc   => open ); -- tc handled externally


      -- Look for C_NUM_CHANNELS-2 so we can register comparator output
      ctcp1 : process (clk)
      begin
        if rising_edge(clk) then

          if sr_smpld_out = '1' then
            chan_count_tc_reg <= '0';

          elsif cnt_ce = '1' then
            chan_count_tc_reg <= not(chan_count_clr) and GLB_to_std_logic(unsigned(chan_count) = C_NUM_CHANNELS-2);

          end if; -- sr_smpld_out

        end if; -- rising_edge(clk)

      end process; -- ctcp1

      chan_count_tc <= chan_count_tc_reg;
    end generate; -- mcg4a


  end generate; -- mcg4




  ------------------------------------------------------------------------------
  -- Instantiate hardware timeout for evaluation core.
  -- This will disable ce to s_out_db register after a fixed number of clock
  -- cycles.
  --
  evg1 : if C_EVALUATION = 0 generate
    sync_qualifier <= '1'; -- Let <sync_smpld> out
  end generate; -- evg1



  evg2 : if C_EVALUATION /= 0 generate
      ----------------------------------------------------------------------------
    -- Hardware timeout logic, copied from hardware timeout entity and placed within
    -- this file to make it less obvious than an instantiation.
    --
    -- Gray-code state RAM
    gcsram : ram64x1s
    generic map (INIT => to_bitvector(calc_gcs_init))
    port map (
      WCLK => clk,
      O    => gcs_do,
      D    => v,
      WE   => f,
      A0   => i(0), A1 => i(1), A2 => i(2), A3 => i(3), A4 => i(4), A5 => i(5)
    );

    process(clk)
      variable next_ji : unsigned(7 downto 0);
    begin
      if rising_edge(clk) then

        -- Ring counter for read/modify/write cycle (hardened against reset-skew)
        m <= not m and not w;
        w <=     m and not w;

        -- Read data register for RAM output
        d <= gcs_do;

        -- Invert data for writeback
        v <= not d;

        -- RAM write enable
        f <= m and j and x and not y;

        -- Next counter state
        next_ji := ("0" & j & i) + (unsigned'("00000001"));

        if cy = '1' then

          -- Counter overflow event resets most things.
          x <= '1';
          y <= '0';
          cy <= '0';
          j  <= '0';
          i  <= (others => '0');

        elsif w = '1' then

          -- Increment counter
          i  <= next_ji(5 downto 0);
          j  <= next_ji(6);
          cy <= next_ji(7);

          -- Latch up y when we see a 1 on x during the update phase
          y <= (y or (x and j));

          -- Update x according to phase...
          x <= d xor (x and not j);  -- Update: copy d into x; parity calc: XOR d into x

        end if;

        dsc <= dsc or (cy and not y); -- timeout happens if the counter overflows and y was 0

      end if;
    end process;

    sync_qualifier <= not(dsc); -- Disable <sync_smpld> after timeout

  end generate; -- evg2



--end block; -- bk1
end generate; -- bk1

end synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/rs_decoder_main.vhd,v 1.4 2011/06/23 15:14:21 andreww Exp $
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: rs_decoder_main
-- Generic Reed-Solomon decoder Logicore, top-level instantiations.
-- This is the level of the core where the main blocks are connected together.
--
--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Group: AXI channel parameters
--        ----------------------
-- Parameter: C_HAS_ACLKEN
--  Set to 1 if core has an <aclken> port, else 0
--
-- Parameter: C_HAS_ARESETN
--  Set to 1 if core has an <aresetn> port, else 0
--
--
-- Group: AXI channel sub-field parameters
--        --------------------------------
-- Parameter: C_HAS_DATA_DEL
--  Optional output field in <m_axis_output_tdata> provides a version of the input data
--  with no FEC applied, with the same latency as corrected data stream.
--
-- Parameter: C_HAS_ERASE
--  Set to 1 if erasure decoding is required. The optional 'ERASE' input bit in <s_axis_input_tdata>
--  is then used to flag symbols which are known to be erased.
--
-- Parameter: C_HAS_ERR_STATS
--  Set to 1 if BIT_ERR_0_TO_1 and BIT_ERR_1_TO_0 fields are to be included in <m_axis_stat_tdata>.
--  These fields require additional logic.
--
-- Parameter: C_HAS_INFO
--  Set to 1 if <m_axis_output_tdata> is to include a bit to flag when output symbols are information
--  data or check symbols.
--
-- Parameter: C_HAS_N_IN
--  Set to 1 to allow code block length, N, to be varied for each new block. Makes core a lot bigger.
--  Determines whether <s_axis_ctrl_tdata> will have an N_IN field or not.
--
-- Parameter: C_HAS_R_IN
--  Set to 1 to allow number of check symbols, R, to be varied for each new block. Makes core a bit bigger
--  than <C_HAS_N_IN> alone. Variable R mode has same timing as variable N.
--  Determines whether <s_axis_ctrl_tdata> will have an R_IN field or not.
--
--
-- Group: Reed-Solomon code word parameters
--        ---------------------------------
-- Parameter: C_GEN_START
--  Start index for generator polynomial (see datasheet)
--
-- Parameter: C_H
--  The h parameter for the generator polynomial (see datasheet)
--
-- Parameter: C_K
--  Number of data symbols in a code block. If <C_HAS_N_IN> = 1 this should be set to <C_N> minus the number of
--  check symbols. If <C_HAS_R_IN> = 1, <C_K> should be set such that C_N-C_K equals the largest number of check
--  symbols to be supported.
--
-- Parameter: C_N
--  Total number of symbols (data + check) in a code block. If <C_HAS_N_IN> = 1, this should be set to
--  (2^C_SYMBOL_WIDTH)-1
--
-- Parameter: C_POLYNOMIAL
--  Galois Field polynomial. See <gf_pkg> for more information on this.
--  Supplying a value of 0 will cause the default polynomial for the given symbol width to be selected.
--
-- Parameter: C_SPEC
--  Specification code, used if a predefined code specification is being used that requires special processing.
--  See <gf_pkg> for details of the supported values. Determines whether CCSDS dual-basis ROMs are required.
--  For standard Reed-Solomon codes, this should be set to 0.
--
-- Parameter: C_SYMBOL_WIDTH
--  Galois field symbol size in bits. This is the bus width of the data to be decoded. It must equal the width
--  of the Galois field elements.
--
--
-- Group: Implementation parameters
--        -------------------------
-- Parameter: C_R_WIDTH
--  Width of <r_in> input
--
-- Parameter: C_HAS_MARKER_BITS
--  Determines whether <mark_in> and <mark_out> are used.
--
-- Parameter: C_NUM_MARKER_BITS
--  Width of <mark_in> and <mark_out>
--
-- Parameter: C_CLKS_PER_SYM
--  The number of clock cycles per symbol. This can be any positive number. The higher the value, the
--  lower the Berlekamp-Massey processing delay (in symbol periods). This parameter is obsolete and no longer
--  supported.
--
-- Parameter: C_IGNORE_ILLEGAL_N_R
--  If set to 1, the core will check sampled N and R values are within the absolute limits.
--  If they are outside these limits then the incoming code block will be ignored. Extra logic is required
--  to perform this check so this parameter should be set to 0 if it is known that N and R will always be legal.
--  If an illegal value is sampled, and the parameter is not set, then the core behavior is not defined and it
--  may have to be reset.
--  The core does not check that the resulting values of N and R are compatible.
--  e.g. N < R, will not be detected if both N and R are inside their absolute limits.
--
-- Parameter: C_DEFINE_LEGAL_R_VALS
--  Normally 0, set to 1 if <C_LEGAL_R_VECTOR_FILE> is to be used.
--
-- Parameter: C_NUM_LEGAL_R_VALUES
--  Number of values in <C_LEGAL_R_VECTOR_FILE>
--
-- Parameter: C_LEGAL_R_VECTOR_FILE
--  Optional file to define which R values are legal when <C_HAS_R_IN> = 1.
--  If it is known that some R values will never be required then some logic can be removed in the Chien unit.
--
-- Parameter: C_OUTPUT_CHECK_SYMBOLS
--  Set to 0 to output full block on N symbols. Set to 0 to only output K information symbols.
--  The check symbols are still processed to generate the error statistics; however only the K
--  information symbols will be output and <m_axis_output_tlast> will be asserted when the last
--  channel value of the Kth symbol is being output.
--  If this parameter equals 1 then <info_end> is redundant.
--
-- Parameter: C_NUM_CHANNELS
--  Input data from multiple channels can be interlaced in the DATA_IN field of <s_axis_input_tdata>.
--  e.g. if there are 3 channels (A,B,C), data is input in the following order:
--  A0,B0,C0,A1,B1,C1,etc. If <C_HAS_N_IN> = 1 or <C_HAS_R_IN> = 1 then <C_NUM_CHANNELS> must equal 1.
--
-- Parameter: C_NUM_PUNC_PATTERNS
--  Defines number of different puncture patters that PUNC_SEL will select between. PUNC_SEL is a field
--  in <s_axis_ctrl_tdata>.
--  Set to 0 for no puncturing. If set to 0 or 1 then PUNC_SEL input field is not required.
--
-- Parameter: C_PUNCTURE_SELECT_FILE
--  File name of a file containing a list of how many symbols are punctured for each PUNC_SEL value.
--
-- Parameter: C_PUNCTURE_VECTOR_FILE
--  File name of a file containing the actual symbols to be punctured for each PUNC_SEL value.
--
-- Parameter: C_PUNC_SEL_WIDTH
--  Width of <punc_sel> input bus
--
-- Parameter: C_MEMSTYLE
--  Tell core whether to use block or distributed memory, or let it decide itself, based on size.
--  - dist_mem  (0) => Do not use any block memories
--  - block_mem (1) => Use block memories wherever possible
--  - auto_mem  (2) => Allow core to choose memory styles
--
-- Parameter: C_OPTIMISATION
--  Indicates the optimization requirement: 0 for area, 1 for speed
--
-- Parameter: C_SELF_RECOVERING
--  Insert extra logic to detect if BMA state machine enters an illegal state and synchronously reset
--  the entire core.
--
--
-- Group: Generation parameters
--        ---------------------
-- Parameter: C_EVALUATION
--  1 for evaluation core, 0 for full core (no hardware timeout)
--
-- Parameter: C_MEM_INIT_PREFIX
--  A string which is prepended to internally generated .mif file names. This prevents
--  problems if multiple cores are being generated simultaneously, as each one can use a
--  different string and the .mif file names will not clash.
--
-- Parameter: C_ELABORATION_DIR
-- Coregen provides the path to the elaboration directory. This is prepended to file names.
--
-- Parameter: C_XDEVICEFAMILY
--  Indicates the FPGA sub-family. Set to legal string, as defined by Coregen.
--
-- Parameter: C_FAMILY
--  Indicates the FPGA family. Set to legal string, as defined by Coregen.
--
--
--
--------------------------------------------------------------------------------
-- The following Ports are provided:
--
-- Port: aclk
--  Input. The core is a completely synchronous design. All inputs must be synchronous to this input.
--
-- Port: aclken
--  Input. The clock enable input is an optional pin, controlled by <C_HAS_ACLKEN>.
--  It is recommended to use the core without this input if possible as it might reduce performance.
--
-- Port: aresetn
--  Optional input, active low synchronous reset, controlled by <C_HAS_ARESETN>.
--  It is recommended to use the core without this input if possible, as it will increase the
--  area and possibly slow the core down due to routing congestion.
--
-- Port: ctrl_fifo_not_empty
--  Input: high when valid ctrl channel information is available to be read from the ctrl FIFO.
--  This entity generates the read signal for the ctrl FIFO and also uses this input to stall the
--  s_axis_input channel if there is no ctrl data in the FIFO.
--
-- Port: input_tvalid
--  Input: high when valid input channel information is on core inputs
--
-- Port: nc_samples_avail
--  Input: high when the AXI input FIFO contains at least C_NUM_CHANNELS samples. Only valid
--  in multi-channel mode.
--
-- Port: data_in
--  Input. Bus for incoming symbols to be decoded.
--
-- Port: mark_in
--  Optional input. Values sampled on <mark_in> are passed through to <mark_out> with the
--  same latency as <data_in> to <data_out>
--
-- Port n_in
--  Optional input. Allows a new value of N to be sampled at start of each new block.
--
-- Port: r_in
--  Optional input. Allows a new value of r (=N-K) to be sampled at start of each new block.
--
-- Port: erase
--  Optional input, used to flag symbols which have been erased.
--  i.e. Symbols which the receiver decides are likely to contain errors.
--
-- Port: punc_sel
--  Optional input to select which predefined puncture pattern to use.
--
-- Port: output_fifo_has_room
--  Input, high when AXI output FIFO is not full
--
-- Port: stat_fifo_has_room   : in  std_logic;
--  Input, high when AXI stat FIFO is not full. In single channel case this is just and indicator that
--  the status information in the Forney unit has been consumed and it is safe to write new status information.
--
-- Port:  ctrl_fifo_rd_en
--  Output: Read enable signal for ctrl FIFO. FIFO is read one cycle before core sets <s_axis_input_tready> for
--  a new block of input data.
--
-- Port: input_tready
--  Output: high when core is ready to sample input channel information
--
-- Port: slow_ce_out
--  Output, clock enable signal for logic which must operate at the slow sample rate. i.e. It must only be
--  enabled once every <C_CLKS_PER_SYM> cycles.
--
-- Port: sr_reg_out
--  Output, aresetn is inverted and registerd in the sampler unit. The active high synchronous reset
--  is output for use with AXI FIFOs, etc in higher levels.
--
-- Port: bit_err_0_to_1
--  Optional output, count of number of 0 to 1 bit errors in the block
--
-- Port: bit_err_1_to_0
--  Optional output, count of number of 1 to 0 bit errors in the block
--
-- Port: data_out
--  Output bus for decoded symbols.
--
-- Port: mark_out
--  Output, <mark_in> delayed by core latency
--
-- Port: erase_cnt
--  Output set to the number of erasures flagged in the block just received.

-- Port: err_found
--  Output is set high if the core detected at least one error in the code block.
--
-- Port: err_count
--  Output bus, set to the number of symbols the decoder detected as erroneous.
--
-- Port: fail
--  Output, set high if the core determines that it failed to correct the code block due to too many errors.
--
-- Port: info_out
--  Output, high when information symbols are on <data_out>, as opposed to check symbols
--  (i.e. the first K symbols of a block)
--
-- Port: last_data
--  Output, high when last symbol of last channel is on <data_out>. This can be used to produce
--  TLAST signal for AXI output interface.
--
-- Port: data_out_rdy
--  Output, high when new output data is ready on data_out
--
-- Port: stat_out_rdy
--  Output, high when new status information is ready
--
-- Port: event_s_input_tlast_missing
--  Output, signalling the <s_axis_input_tlast> was not asserted when it was expected. Users should
--  not connect anything to this if they don't need it and the logic will be optimized away.
--
-- Port: event_s_input_tlast_unexpected
--  Output, signalling the <s_axis_input_tlast> was asserted when it was not expected. Users should
--  not connect anything to this if they don't need it and the logic will be optimized away.
--
-- Port: event_s_ctrl_tdata_invalid
--  Output, signalling that an invalid ctrl channel value was sampled
--  Core only checks against absolute limits, so it is possible to sample invalid values without
--  them being detected.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.buf;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.gf_pkg.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;
use rs_decoder_v9_0_12.dec_pkg.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;



entity rs_decoder_main is
generic (
  C_HAS_ACLKEN                 : integer;
  C_HAS_ARESETN                : integer;
  C_NUM_PUNC_PATTERNS          : integer;
  C_PUNCTURE_SELECT_FILE       : string;
  C_PUNCTURE_VECTOR_FILE       : string;
  C_NUM_CHANNELS               : integer;
  C_GEN_START                  : integer;
  C_H                          : integer;
  C_K                          : integer;
  C_N                          : integer;
  C_POLYNOMIAL                 : integer;
  C_SYMBOL_WIDTH               : integer;
  C_PUNC_SEL_WIDTH             : integer;
  C_HAS_MARKER_BITS            : integer;
  C_NUM_MARKER_BITS            : integer;
  C_EVALUATION                 : integer;
  C_HAS_ERASE                  : integer;
  C_HAS_ERR_STATS              : integer;
  C_HAS_DATA_DEL               : integer;
  C_HAS_INFO                   : integer;
  C_HAS_N_IN                   : integer;
  C_HAS_R_IN                   : integer;
  C_IGNORE_ILLEGAL_N_R         : integer;
  C_R_WIDTH                    : integer;
  C_DEFINE_LEGAL_R_VALS        : integer;
  C_NUM_LEGAL_R_VALUES         : integer;
  C_LEGAL_R_VECTOR_FILE        : string;
  C_OUTPUT_CHECK_SYMBOLS       : integer;
  C_CLKS_PER_SYM               : integer;
  C_SPEC                       : integer;
  C_MEMSTYLE                   : integer;
  C_MEM_INIT_PREFIX            : string;
  C_ELABORATION_DIR            : string;
  C_XDEVICEFAMILY              : string;
  C_FAMILY                     : string;
  C_OPTIMISATION               : integer;
  C_SELF_RECOVERING            : integer );
port (
  aclk                           : in  std_logic;
  aclken                         : in  std_logic := '1';
  aresetn                        : in  std_logic := '1';
  ctrl_fifo_not_empty            : in  std_logic;
  input_tvalid                   : in  std_logic;
  input_tlast                    : in  std_logic;
  nc_samples_avail               : in  std_logic;
  data_in                        : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  mark_in                        : in  std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
  n_in                           : in  std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  r_in                           : in  std_logic_vector(C_R_WIDTH-1 downto 0);
  erase                          : in  std_logic := '0';
  punc_sel                       : in  std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0);
  output_fifo_has_room           : in  std_logic;
  stat_fifo_has_room             : in  std_logic;
  ctrl_fifo_rd_en                : out std_logic;
  input_tready                   : out std_logic;
  slow_ce_out                    : out std_logic;
  sr_reg_out                     : out std_logic;
  bit_err_0_to_1                 : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
  bit_err_1_to_0                 : out std_logic_vector(bitsneededtorepresent((C_N-C_K) * C_SYMBOL_WIDTH)-1 downto 0);
  data_out                       : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  mark_out                       : out std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);
  data_del                       : out std_logic_vector(C_SYMBOL_WIDTH-1 downto 0);
  info_out                       : out std_logic;
  last_data_out                  : out std_logic;
  last_stat_out                  : out std_logic;
  erase_cnt                      : out std_logic_vector(bitsneededtorepresent(C_N)-1 downto 0);
  err_found                      : out std_logic;
  err_cnt                        : out std_logic_vector(C_R_WIDTH-1 downto 0);
  fail                           : out std_logic;
  data_out_rdy                   : out std_logic;
  stat_out_rdy                   : out std_logic;
  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic );
end rs_decoder_main;


--------------------------------------------------------------------------------
architecture synth of rs_decoder_main is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Group: architecture


  ------------------------------------------------------------------------------
  -- Group: constants

  -- integer: multi_channel
  -- true if there is more than one input channel
  constant multi_channel : boolean := C_NUM_CHANNELS > 1;

  -- integer: c_has_sr_final
  -- Self recovery requires core to be able to synchronously reset itself
  constant c_has_sr_final : integer := bool_to_int(C_HAS_ARESETN /= 0 or C_SELF_RECOVERING /= 0);

  constant c_has_ce_bool : boolean := C_HAS_ACLKEN /= 0;
  constant c_has_sr_bool : boolean := c_has_sr_final /= 0;

  constant c_has_slow_ce : integer := bool_to_int(c_has_ce_bool or (C_EVALUATION/=0));

  constant spec_eq_ccsds : boolean := (C_SPEC = ccsds_spec);

  constant has_puncturing : boolean := (C_NUM_PUNC_PATTERNS > 0);
  constant has_punc_sel : integer := bool_to_int(C_NUM_PUNC_PATTERNS > 1);

  constant erase_or_puncture : integer := bool_to_int(C_HAS_ERASE/=0 or has_puncturing);


  constant n_minus_k : integer := C_N - C_K;


  -- Can't set C_NUM_MARKER_BITS to 0
  constant symbol_plus_mark_width : integer := select_val(
             C_SYMBOL_WIDTH, C_SYMBOL_WIDTH + C_NUM_MARKER_BITS, C_HAS_MARKER_BITS);



  -- Codeword parameters
  constant t : integer := n_minus_k/2;
  -- Causes sampler to reject max odd value, e.g. 7 if C_N-C_K=7, therefore
  -- leave as n_minus_k
  --constant r_val : r_type  := select_val(2*t, n_minus_k, erase_or_puncture);
  constant r_val : r_type  := n_minus_k;

  -- Get processing delay (number of symbol periods)
  constant proc_delay : integer := get_proc_delay(C_N, C_K, erase_or_puncture, C_NUM_CHANNELS);


  ------------------------------------------------------------------------------
  -- Function: check_proc_delay
  --
  -- Check if continuous code blocks are possible (i.e. blocks can be input
  -- with no gap between them). This is not an error, but just report it as a note.
  --
  -- Returns:
  --  boolean true if continuous code blocks are possible, else false
  --
  function check_proc_delay return boolean is
    constant max_proc_delay : integer := C_N * C_NUM_CHANNELS;
  begin

    -- If processing delay is longer than n symbols then decoder will not accept continuous code blocks
    if (proc_delay > max_proc_delay) then

      report "(N-K) is too large for continuous code blocks." & new_line &
             "Processing delay = " & integer'image(proc_delay) & new_line &
             "Must be less than " & integer'image(max_proc_delay+1) &
             " for continuous blocks." & new_line
      severity note;

      return false;
    else
      return true;
    end if;

  end check_proc_delay;

  constant do_proc_delay : boolean := check_proc_delay;



  ------------------------------------------------------------------------------
  -- Function: calc_fifo_depth
  --  Calculate depth of FIFO required to store incoming data while RS algorithm
  --  is applied to determine error values and locations
  --  Need to allow at least-
  --   One block being processed by Syndrome unit
  --   One block whose syndromes are waiting to be loaded into BMA unit
  --   One block being processed by BMA unit
  --   One block whose coefficients are waiting to be loaded into Chien unit
  --   One block being processed by Chien/Forney unit
  --   Add 3 cycles contingency for additional latency
  -- Returns:
  --  Integer depth of FIFO required
  --
  function calc_fifo_depth return integer is
  begin

    return ((5 * C_N) + 3) * C_NUM_CHANNELS;

  end calc_fifo_depth;

  -- Calculate size of main data FIFO
  constant data_fifo_depth : integer := calc_fifo_depth;

  ------------------------------------------------------------------------------

  constant symbol_width_minus_1 : integer := C_SYMBOL_WIDTH-1;
  subtype  symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);

  constant loc_deg_width         : integer := C_R_WIDTH;
  constant loc_deg_width_minus_1 : integer := loc_deg_width-1;
  subtype  loc_deg_type is std_logic_vector(loc_deg_width_minus_1 downto 0);

  constant erase_cnt_width_minus_1 : integer := bitsneededtorepresent(C_N)-1;
  subtype  erase_cnt_type is std_logic_vector(erase_cnt_width_minus_1 downto 0);

  subtype r_in_type is std_logic_vector(C_R_WIDTH-1 downto 0);

  subtype mark_in_type is std_logic_vector(C_NUM_MARKER_BITS-1 downto 0);

  -- Additional delay on dout added in this entity
  constant final_dout_delay : integer := select_val_b(0, 1, spec_eq_ccsds);
  -- Additional delay on dout added in forney entity
  constant forney_latency : integer := select_val_b(1, 2, spec_eq_ccsds);
  -- Additional delay on dout after block memory delay line (or FIFO)
  constant mark_in_delay : integer := final_dout_delay + forney_latency;

  type mark_in_delay_type is array(0 to mark_in_delay) of mark_in_type;

  -- Need Chien unit to output last_info signal if core is not outputting check symbols as this
  -- is used by the Forney unit
  constant chien_has_info : integer := boolean'pos(C_HAS_INFO /= 0 or C_OUTPUT_CHECK_SYMBOLS = 0);
  -- Need Forney unit to output <info_out> signal if <C_OUTPUT_CHECK_SYMBOLS> = 0, as it is used to gate <data_out_rdy>
  constant forney_has_info : integer := boolean'pos(C_HAS_INFO /= 0 or C_OUTPUT_CHECK_SYMBOLS = 0);

  ------------------------------------------------------------------------------
  -- Group: signals

  signal bma_dead              : std_logic := '0';
  signal bma_ready             : std_logic := '0';
  signal ccsds_dout_reg        : symbol_type := (others => '0');
  signal chien_last_info       : std_logic := '0';
  signal chien_ready           : std_logic := '0';
  signal data_del_forney       : symbol_type := (others => '0');
  signal data_in_smpld         : symbol_type := (others => '0');
  signal din_and_mark_in       : std_logic_vector(symbol_plus_mark_width-1 downto 0);
  signal din_reg               : symbol_type := (others => '0');
  signal dout_reg              : symbol_type := (others => '0');
  signal enable_output_pipe    : std_logic := '1';
  signal erase_cnt_bma         : erase_cnt_type := (others => '0');
  signal erase_cnt_chien       : erase_cnt_type := (others => '0');
  signal erase_cnt_forney      : erase_cnt_type := (others => '0');
  signal erase_cnt_syn         : erase_cnt_type := (others => '0');
  signal erase_init_coeff      : symbol_type := (others => '0');
  signal erase_loc             : symbol_type := (others => '0');
  signal erase_reg             : std_logic := '0';
  signal err_eval_eval         : symbol_type := (others => '0');
  signal err_loc, err_eval     : symbol_type := (others => '0');
  signal err_loc_eval          : symbol_type := (others => '0');
  signal err_loc_diff_eval     : symbol_type := (others => '0');
  signal forney_output_rdy     : std_logic := '0';
  signal forney_output_rdy_del : std_logic := '0';
  signal forney_status_rdy     : std_logic := '0';
  signal info_out_tmp          : std_logic := '0';
  signal input_chan_ce         : std_logic := '0';
  signal input_pipe_ce         : std_logic := '0';
  signal input_reg_ce          : std_logic := '0';
  signal int_ce                : std_logic := '0';
  signal last_chien_value      : std_logic := '0';
  signal last_chien_value_p1   : std_logic := '0';
  signal last_sampler_value    : std_logic := '0';
  signal loc_deg               : loc_deg_type := (others => '0');
  signal loc_deg_out           : loc_deg_type := (others => '0');
  signal mark_in_del           : mark_in_delay_type := (others => (others => '0'));
  signal mark_in_del1          : mark_in_type := (others => '0');
  signal mark_in_smpld         : mark_in_type := (others => '0');
  signal n_in_reg              : symbol_type := (others => '0');
  signal n_in_reg2             : symbol_type := (others => '0');
  signal n_in_reg3             : symbol_type := (others => '0');
  signal output_pipe_ce        : std_logic := '0';
  signal r_in_reg              : r_in_type := (others => '0');
  signal r_in_reg2             : r_in_type := (others => '0');
  signal r_in_reg3             : r_in_type := (others => '0');
  signal punc_sel_reg          : std_logic_vector(C_PUNC_SEL_WIDTH-1 downto 0) := (others => '0');
  signal read_data_en          : std_logic := '0';
  signal received_symbol       : symbol_type := (others => '0');
  signal rx_and_markers        : std_logic_vector(symbol_plus_mark_width-1 downto 0) := (others => '0');
  signal s_out                 : symbol_type := (others => '0');
  signal start_bma             : std_logic := '0';
  signal start_bma_p1          : std_logic := '0';
  signal start_chien           : std_logic := '0';
  -- start_chien_p1 goes high 1 cycle before start_chien
  signal start_chien_p1        : std_logic := '0';
  -- start_chien_p2 goes high 2 cycles before start_chien
  signal start_chien_p2          : std_logic := '0';
  signal start_forney            : std_logic := '0';
  signal start_forney_p1         : std_logic := '0';
  signal stat_fifo_wr_pending    : std_logic := '0';
  signal slow_ce                 : std_logic := '0';
  signal sr_reg                  : std_logic := '0';
  signal sync_reg                : std_logic := '0';
  signal syndromes               : symbol_type := (others => '0');
  signal syndrome_piso_full      : std_logic := '0';
  signal syndrome_load_piso_pend : std_logic := '0';
  signal write_data_en           : std_logic := '0';


--   -- Do not share primary output registers. We don't want primary outputs
--   -- being routed back into the design.
--   attribute equivalent_register_removal of data_del : signal is "no";
--   attribute equivalent_register_removal of data_out : signal is "no";

--------------------------------------------------------------------------------
-- Beginning of architecture body
--------------------------------------------------------------------------------
begin

  -- Sampled active high synchronous reset
  sr_reg_out <= sr_reg;

  -- Symbol rate clock enable. This is already gated with <aclken>
  slow_ce_out <= slow_ce;

  -- handle optional ce input
  n_ce : if C_HAS_ACLKEN = 0 generate
    int_ce <= '1';
  end generate; -- n_ce

  y_ce : if C_HAS_ACLKEN /= 0 generate
    int_ce <= aclken;
  end generate; -- y_ce




  ------------------------------------------------------------------------------
  -- Instantiate and connect the constituent parts of the RS Decoder
  --
  ------------------------------------------------------------------------------
  -- Object: sp
  -- Sampler includes dual-basis conversion ROM if necessary
  -- Note this must use the direct <C_HAS_ARESETN> parameter as it instantiates
  -- logic to sample the <aresetn> input based on this. c_has_sr_bool can be
  -- forced true if <C_SELF_RECOVERING> =1.
  sp : sampler
  generic map (
    C_EVALUATION           => C_EVALUATION,
    C_NUM_CHANNELS         => C_NUM_CHANNELS,
    C_HAS_MARKER_BITS      => C_HAS_MARKER_BITS,
    C_NUM_MARKER_BITS      => C_NUM_MARKER_BITS,
    C_POLYNOMIAL           => C_POLYNOMIAL,
    C_H                    => C_H,
    C_R                    => r_val,
    C_N                    => C_N,
    C_SYMBOL_WIDTH         => C_SYMBOL_WIDTH,
    C_R_WIDTH              => C_R_WIDTH,
    C_PUNC_SEL_WIDTH       => C_PUNC_SEL_WIDTH,
    C_HAS_PUNC_SEL         => has_punc_sel,
    C_NUM_PUNC_PATTERNS    => C_NUM_PUNC_PATTERNS,
    C_PUNCTURE_SELECT_FILE => C_PUNCTURE_SELECT_FILE,
    C_PUNCTURE_VECTOR_FILE => C_PUNCTURE_VECTOR_FILE,
    C_HAS_CE               => C_HAS_ACLKEN,
    C_HAS_ERASE            => C_HAS_ERASE,
    C_HAS_N_IN             => C_HAS_N_IN,
    C_HAS_R_IN             => C_HAS_R_IN,
    C_IGNORE_ILLEGAL_N_R   => C_IGNORE_ILLEGAL_N_R,
    C_DEFINE_LEGAL_R_VALS  => C_DEFINE_LEGAL_R_VALS,
    C_NUM_LEGAL_R_VALUES   => C_NUM_LEGAL_R_VALUES,
    C_LEGAL_R_VECTOR_FILE  => C_LEGAL_R_VECTOR_FILE,
    C_HAS_ARESETN          => C_HAS_ARESETN,
    C_SPEC                 => C_SPEC,
    C_MEMSTYLE             => C_MEMSTYLE,
    C_CLKS_PER_SYM         => C_CLKS_PER_SYM,
    C_XDEVICEFAMILY        => C_XDEVICEFAMILY,
    C_FAMILY               => C_FAMILY,
    C_MEM_INIT_PREFIX      => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR      => C_ELABORATION_DIR,
    C_SELF_RECOVERING      => C_SELF_RECOVERING)
  port map (
    ctrl_fifo_not_empty            => ctrl_fifo_not_empty,
    input_tvalid                   => input_tvalid,
    syndrome_piso_full             => syndrome_piso_full,
    load_piso_pending              => syndrome_load_piso_pend,
    data_in                        => data_in,
    mark_in                        => mark_in,
    n_in                           => n_in,
    r_in                           => r_in,
    punc_sel                       => punc_sel,
    clk                            => aclk,
    ce                             => int_ce,
    erase                          => erase,
    aresetn                        => aresetn,
    bma_dead                       => bma_dead,
    ctrl_fifo_rd_en                => ctrl_fifo_rd_en,
    input_tready                   => input_tready,
    input_tlast                    => input_tlast,
    nc_samples_avail               => nc_samples_avail,
    input_chan_ce                  => input_chan_ce,
    input_pipe_ce                  => input_pipe_ce,
    input_reg_ce                   => input_reg_ce,
    write_data_en                  => write_data_en,
    last_symbol                    => last_sampler_value,
    data_in_smpld                  => data_in_smpld,
    mark_in_smpld                  => mark_in_smpld,
    erase_init_coeff               => erase_init_coeff,
    n_in_smpld                     => n_in_reg,
    r_in_smpld                     => r_in_reg,
    punc_sel_smpld                 => punc_sel_reg,
    erase_smpld                    => erase_reg,
    sr_smpld                       => sr_reg,
    sync_smpld                     => sync_reg,
    slow_ce                        => slow_ce,
    event_s_input_tlast_missing    => event_s_input_tlast_missing,
    event_s_input_tlast_unexpected => event_s_input_tlast_unexpected,
    event_s_ctrl_tdata_invalid     => event_s_ctrl_tdata_invalid
    );


  ------------------------------------------------------------------------------
  sy : syndrome
  generic map (
    C_FAMILY               => C_FAMILY,
    C_XDEVICEFAMILY        => C_XDEVICEFAMILY,
    C_NUM_PUNC_PATTERNS    => C_NUM_PUNC_PATTERNS,
    C_PUNCTURE_SELECT_FILE => C_PUNCTURE_SELECT_FILE,
    C_PUNCTURE_VECTOR_FILE => C_PUNCTURE_VECTOR_FILE,
    C_MEM_INIT_PREFIX      => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR      => C_ELABORATION_DIR,
    C_MEM_STYLE            => C_MEMSTYLE,
    C_PROC_DELAY           => proc_delay,
    C_N                    => C_N,
    C_K                    => C_K,
    C_GEN_START            => C_GEN_START,
    C_H                    => C_H,
    C_POLYNOMIAL           => C_POLYNOMIAL,
    C_SYMBOL_WIDTH         => C_SYMBOL_WIDTH,
    C_PUNC_SEL_WIDTH       => C_PUNC_SEL_WIDTH,
    C_CLKS_PER_SYM         => C_CLKS_PER_SYM,
    C_SPEC                 => C_SPEC,
    C_NUM_CHANNELS         => C_NUM_CHANNELS,
    C_HAS_ERASE            => C_HAS_ERASE,
    C_HAS_N_IN             => C_HAS_N_IN,
    C_HAS_R_IN             => C_HAS_R_IN,
    C_R_WIDTH              => C_R_WIDTH,
    C_HAS_CE               => c_has_ce_bool,
    C_HAS_SCLR             => c_has_sr_bool)
  port map (
    ce                => int_ce,
    slow_ce           => slow_ce,
    input_chan_ce     => input_chan_ce,
    input_pipe_ce     => input_pipe_ce,
    clk               => aclk,
    last_din          => last_sampler_value,
    din               => din_reg,
    n_in              => n_in_reg,
    r_in              => r_in_reg,
    erase_init_coeff  => erase_init_coeff,
    bma_ready         => bma_ready,
    erase             => erase_reg,
    sync              => sync_reg,
    sclr              => sr_reg,
    punc_sel          => punc_sel_reg,
    erase_poly        => erase_loc,
    n_out             => n_in_reg2,
    r_out             => r_in_reg2,
    num_erase         => erase_cnt_syn,
    synd_piso_full    => syndrome_piso_full,
    load_piso_pending => syndrome_load_piso_pend,
    sout              => syndromes,
    done_p1           => start_bma_p1,
    done              => start_bma);


  ------------------------------------------------------------------------------
  bm : bma
  generic map (
    C_K                    => C_K,
    C_N                    => C_N,
    C_POLYNOMIAL           => C_POLYNOMIAL,
    C_SYMBOL_WIDTH         => C_SYMBOL_WIDTH,
    C_NUM_CHANNELS         => C_NUM_CHANNELS,
    C_HAS_CE               => c_has_ce_bool,
    C_HAS_ERASE            => erase_or_puncture,
    C_HAS_SCLR             => c_has_sr_final,
    C_HAS_N_IN             => C_HAS_N_IN,
    C_HAS_R_IN             => C_HAS_R_IN,
    C_R_WIDTH              => C_R_WIDTH,
    C_OPTIMISATION         => C_OPTIMISATION,
    C_SELF_RECOVERING      => C_SELF_RECOVERING,
    C_ELABORATION_DIR      => C_ELABORATION_DIR,
    C_XDEVICEFAMILY        => C_XDEVICEFAMILY,
    C_FAMILY               => C_FAMILY)
  port map (
    syndromes      => syndromes,
    start_bma      => start_bma,
    start_bma_p1   => start_bma_p1,
    chien_ready    => chien_ready,
    clk            => aclk,
    ce             => int_ce,
    erase_loc      => erase_loc,
    erase_cnt      => erase_cnt_syn,
    sclr           => sr_reg,
    n_in           => n_in_reg2,
    r_in           => r_in_reg2,
    bma_ready      => bma_ready,
    erase_cnt_out  => erase_cnt_bma,
    err_loc        => err_loc,
    err_eval       => err_eval,
    n_out          => n_in_reg3,
    r_out          => r_in_reg3,
    loc_deg        => loc_deg,
    poly_flag      => start_chien,
    start_chien_p1 => start_chien_p1,
    start_chien_p2 => start_chien_p2,
    bma_dead       => bma_dead);


  ------------------------------------------------------------------------------
  -- Chien input operates at full clock rate (int_ce) but processing and output
  -- operates at the slow_ce rate. If output pipeline is stalled by tready then
  -- the <chien_ready> signal will stall the input when input data can no longer
  -- be accepted.
  ch : chien
  generic map (
    C_POLYNOMIAL           => C_POLYNOMIAL,
    C_SYMBOL_WIDTH         => C_SYMBOL_WIDTH,
    C_NUM_CHANNELS         => C_NUM_CHANNELS,
    C_N                    => C_N,
    C_K                    => C_K,
    C_H                    => C_H,
    C_GEN_START            => C_GEN_START,
    C_HAS_INFO_END         => chien_has_info,
    C_HAS_N_IN             => C_HAS_N_IN,
    C_HAS_R_IN             => C_HAS_R_IN,
    C_R_WIDTH              => C_R_WIDTH,
    C_DEFINE_LEGAL_R_VALS  => C_DEFINE_LEGAL_R_VALS,
    C_NUM_LEGAL_R_VALUES   => C_NUM_LEGAL_R_VALUES,
    C_LEGAL_R_VECTOR_FILE  => C_LEGAL_R_VECTOR_FILE,
    C_HAS_CE               => C_HAS_ACLKEN,
    C_HAS_ERASE            => erase_or_puncture,
    C_HAS_SCLR             => c_has_sr_final,
    C_CLKS_PER_SYM         => C_CLKS_PER_SYM,
    C_MEMSTYLE             => C_MEMSTYLE,
    C_FAMILY               => C_FAMILY,
    C_MEM_INIT_PREFIX      => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR      => C_ELABORATION_DIR,
    C_XDEVICEFAMILY        => C_XDEVICEFAMILY)
  port map (
    start             => start_chien,
    start_p1          => start_chien_p1,
    start_p2          => start_chien_p2,
    erase_cnt_in      => erase_cnt_bma,
    err_loc           => err_loc,
    err_eval          => err_eval,
    loc_deg_in        => loc_deg,
    n_in              => n_in_reg2,
    n_in_latched      => n_in_reg3,
    r_in_latched      => r_in_reg3,
    clk               => aclk,
    ce                => int_ce,
    slow_ce           => output_pipe_ce,-- Stalled if output FIFOs full --slow_ce,
    sclr              => sr_reg,
    erase_cnt_out     => erase_cnt_chien,
    err_loc_eval      => err_loc_eval,
    err_loc_diff_eval => err_loc_diff_eval,
    err_eval_eval     => err_eval_eval,
    loc_deg_out       => loc_deg_out,
    chien_ready       => chien_ready,
    done              => start_forney,
    done_p1           => start_forney_p1,
    last_info         => chien_last_info,
    last_value        => last_chien_value,
    last_value_p1     => last_chien_value_p1);



  -- din forms LS bits of concatenated data & marker bus
  mig1 : if C_HAS_MARKER_BITS /= 0 generate
    din_and_mark_in <= mark_in_smpld & din_reg;

    mark_in_del1 <= rx_and_markers(symbol_plus_mark_width-1 downto C_SYMBOL_WIDTH);
  end generate; -- mig1

  mig2 : if C_HAS_MARKER_BITS = 0 generate
    din_and_mark_in <= din_reg;
  end generate; -- mig2

  -- Split bus into received data and marker bits
  received_symbol <= rx_and_markers(C_SYMBOL_WIDTH-1 downto 0);


  ------------------------------------------------------------------------------
  -- Use a FIFO to delay incoming data. This means we don't have to worry about
  -- the varying latency caused by variable N or R, or pipeline stalls caused
  -- by input tvalid or output tready de-assertion.
  --
  ffo1: rs_sync_fifo
  generic map (
    C_FAMILY          => C_FAMILY,
    C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
    C_ELABORATION_DIR => C_ELABORATION_DIR,
    C_MEMORY_TYPE     => C_MEMSTYLE,
    C_WIDTH           => symbol_plus_mark_width,
    C_DEPTH           => data_fifo_depth, -- Allow for worst case
    C_HAS_SCLR        => c_has_sr_final)
  port map (
    clk   => aclk,
    sclr  => sr_reg,
    din   => din_and_mark_in,
    wr_en => write_data_en,
    rd_en => read_data_en,
    dout  => rx_and_markers);






  ------------------------------------------------------------------------------
  -- The Forney unit is clock enabled with slow_ce as it operates on a symbol
  -- by symbol basis.
  fy : forney
  generic map (
    C_NUM_CHANNELS         => C_NUM_CHANNELS,
    C_POLYNOMIAL           => C_POLYNOMIAL,
    C_SYMBOL_WIDTH         => C_SYMBOL_WIDTH,
    C_N                    => C_N,
    C_K                    => C_K,
    C_HAS_ERR_STATS        => C_HAS_ERR_STATS,
    C_HAS_INFO             => forney_has_info,
    C_HAS_N_IN             => C_HAS_N_IN,
    C_HAS_R_IN             => C_HAS_R_IN,
    C_R_WIDTH              => C_R_WIDTH,
    C_MEMSTYLE             => C_MEMSTYLE,
    C_OUTPUT_CHECK_SYMBOLS => C_OUTPUT_CHECK_SYMBOLS,
    C_SPEC                 => C_SPEC,
    C_HAS_CE               => 1, -- <output_pipe_ce> can stall Forney unit
    C_HAS_ERASE            => erase_or_puncture,
    C_HAS_SR               => c_has_sr_final,
    C_HAS_DATA_DEL         => C_HAS_DATA_DEL,
    C_MEM_INIT_PREFIX      => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR      => C_ELABORATION_DIR,
    C_XDEVICEFAMILY        => C_XDEVICEFAMILY,
    C_FAMILY               => C_FAMILY)
  port map (
    rx_symbol            => received_symbol,
    dout_reg             => dout_reg,
    chien_last_info      => chien_last_info,
    erase_cnt_in         => erase_cnt_chien,
    err_loc_eval         => err_loc_eval,
    err_loc_diff_eval    => err_loc_diff_eval,
    err_eval_eval        => err_eval_eval,
    start                => start_forney,
    start_p1             => start_forney_p1,
    last_value           => last_chien_value,
    last_value_p1        => last_chien_value_p1,
    loc_deg              => loc_deg_out,
    clk                  => aclk,
    ce                   => output_pipe_ce,-- Stalled if output FIFOs full --slow_ce,
    sr                   => sr_reg,
    output_fifo_has_room => output_fifo_has_room,
    erase_cnt_out        => erase_cnt_forney,
    s_out                => s_out,
    data_del             => data_del_forney,
    bit_err_0_to_1       => bit_err_0_to_1,
    bit_err_1_to_0       => bit_err_1_to_0,
    blk_strt             => open,
    blk_end              => open,
    err_found            => err_found,
    err_cnt              => err_cnt,
    fail                 => fail,
    info_out             => info_out_tmp,
    last_data            => last_data_out,
    last_stat            => last_stat_out,
    read_data_en         => read_data_en,
    data_out_rdy         => forney_output_rdy,
    status_out_rdy       => forney_status_rdy,
    status_out_rdy_p2    => stat_fifo_wr_pending);

  ------------------------------------------------------------------------------
  -- Generate <info_out>
  --
  iog1 : if C_HAS_INFO /= 0 generate
    info_out <= info_out_tmp; -- Primary output
  end generate; -- iog1


  ------------------------------------------------------------------------------
  -- Generate write enable signal for AXI output FIFO. This must be gated with <slow_ce> because
  -- <forney_output_rdy_del> changes at the slow_ce rate.
  -- Must also stop writes if the output pipeline is stalled because the status FIFO is full, so
  -- gate with <output_pipe_ce>.
  dorg1 : if C_OUTPUT_CHECK_SYMBOLS /= 0 generate
    data_out_rdy <= forney_output_rdy_del and slow_ce and output_fifo_has_room and output_pipe_ce;
  end generate; -- dorg1

  dorg2 : if C_OUTPUT_CHECK_SYMBOLS = 0 generate
    data_out_rdy <= forney_output_rdy_del and slow_ce and output_fifo_has_room and output_pipe_ce and info_out_tmp;
  end generate; -- dorg2

  -- Disable stat_out_rdy if output FIFO is full as Forney clock enable will be low in this case,
  -- and stat_out_rdy could be stuck high for multiple clock cycles
  stat_out_rdy <= forney_status_rdy and slow_ce and output_fifo_has_room and stat_fifo_has_room;

  -- Generate clock enable for output data pipe in Chien and Forney units. This must be stopped
  -- if the output FIFO is full or the status FIFO is full and a new status write is about
  -- to occur.
  -- There is no status FIFO in the single channel case, so output pipline has to be stopped
  -- if a status value is about to be output and the previous value has not been consumed.
  -- It is held in the Forney unit until it is consumed.
  -- In this case <stat_fifo_has_room> is just keeping track of whether the last value has
  -- been consumed.
  eog1 : if not(multi_channel) generate

    -- Use an SR flip-flop, set when stat_fifo_has_room and cleared when
    -- stat_fifo_wr_pending (if stat_fifo_has_room='0')
    eop1 : process (aclk)
    begin
      if rising_edge(aclk) then
        if sr_reg = '1' then
          enable_output_pipe <= '1';
        elsif int_ce = '1' then
          enable_output_pipe <= ((stat_fifo_has_room or not(stat_fifo_wr_pending)) and enable_output_pipe) or
                                stat_fifo_has_room;
        end if; -- sr_reg = '1'
      end if; -- rising_edge(aclk)
    end process; -- eop1

  end generate; -- eog1

  -- In multi-channel case there is a proper status FIFO so pipeline must be stopped as soon as it is full
  eog2 : if multi_channel generate
    enable_output_pipe <= stat_fifo_has_room;
  end generate; -- eog2

  output_pipe_ce <= enable_output_pipe and output_fifo_has_room and slow_ce;



  ------------------------------------------------------------------------------
  -- If no erasures or puncturing then leave 'erase_cnt' undriven.
  nebg : if C_HAS_ERASE /= 0 or has_puncturing generate
    erase_cnt <= erase_cnt_forney;
  end generate; -- nebg

  ddg : if C_HAS_DATA_DEL /= 0 generate
    data_del <= data_del_forney;
  end generate; -- ddg


  ------------------------------------------------------------------------------
  -- Instantiate dual-basis conversion ROM if implementing CCSDS spec
  --
  dbg1 : if spec_eq_ccsds generate
    constant db_mif_name : string := concatenate_strings(C_MEM_INIT_PREFIX, "basis_conv.mif");
    signal forney_output_rdy_del1 : std_logic := '0';
  begin

    db1 : gf_dual_basis_rom
    generic map (
      C_WIDTH           => C_SYMBOL_WIDTH,
      C_HAS_DOUT_B      => 1,
      C_HAS_ENA         => 1,
      C_HAS_ENB         => 1, -- Output port might be stalled by tready
      CONV_DATA_DB2     => ccsds_basis_conv_inv,
      CONV_DATA_2DB     => ccsds_basis_conv,
      MIF_FILE_NAME     => db_mif_name,
      C_ELABORATION_DIR => C_ELABORATION_DIR,
      C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
      C_FAMILY          => C_FAMILY)
    port map (
      ena    => input_reg_ce,
      enb    => output_pipe_ce,
      clk    => aclk,
      din_a  => data_in_smpld, -- Convert din_a from DB to normal
      din_b  => s_out,         -- Convert din_b from normal to DB
      dout_a => din_reg,
      dout_b => ccsds_dout_reg );


    -- Final data output register
    dr1 : rs_reg
    generic map (c_has_ce=>1, c_width=>C_SYMBOL_WIDTH)
    port map (d=>ccsds_dout_reg, clk=>aclk, ce=>output_pipe_ce, q=>dout_reg);

    -- forney_output_rdy_del must go high when valid new data is ready on <data_out>, so
    -- delay by a further 2 cycles to compensate for CCSDS ROM and final output reg
    dor1 : rs_reg_bit
    generic map (c_has_sclr=>c_has_sr_final)
    port map (d=>forney_output_rdy, clk=>aclk, ce=>output_pipe_ce, sclr=>sr_reg, q=>forney_output_rdy_del1);

    dor2 : rs_reg_bit
    generic map (c_has_sclr=>c_has_sr_final)
    port map (d=>forney_output_rdy_del1, clk=>aclk, ce=>output_pipe_ce, sclr=>sr_reg, q=>forney_output_rdy_del);

  end generate; -- dbg1

  dbg2 : if not(spec_eq_ccsds) generate
    din_reg               <= data_in_smpld;
    dout_reg              <= s_out;
    forney_output_rdy_del <= forney_output_rdy;
  end generate; -- dbg2

  data_out <= dout_reg; -- Primary data output. This will be fed to AXI FIFO in higher level entity.


  ------------------------------------------------------------------------------
  -- Delay mark_in to match delay on din
  --
  mbg1 : if C_HAS_MARKER_BITS /= 0 generate

    mark_in_del(0) <= mark_in_del1;

    mbg2 : for i in 1 to mark_in_delay generate

      process(aclk)
      begin
        if rising_edge(aclk) then
          if (output_pipe_ce = '1') then
            mark_in_del(i) <= mark_in_del(i-1);
          end if; -- int_ce
        end if; -- rising_edge(aclk)
      end process;

    end generate; -- mbg2

  end generate; -- mbg1


  mark_out <= mark_in_del(mark_in_delay);

end synth;









-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/rs_decoder_axi_wrapper.vhd,v 1.6 2011/06/30 14:35:50 andreww Exp $
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: rs_decoder_axi_wrapper
--  Translate between AXI channels in top level to individual busses and control
--  signals required by <rs_decoder_main>.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Group: AXI channel parameters
--        ----------------------
-- Parameter: C_HAS_ACLKEN
--  Set to 1 if core has an <aclken> port, else 0
--
-- Parameter: C_HAS_ARESETN
--  Set to 1 if core has an <aresetn> port, else 0
--
-- Parameter: C_HAS_S_AXIS_CTRL
--  Set to 1 if core has an AXI S_AXIS_CTRL channel, else 0
--  This should only be set to 1 if <C_HAS_N_IN> = 1, <C_HAS_R_IN> = 1 or <C_NUM_PUNC_PATTERNS> is greater than 0.
--
-- Parameter: C_HAS_S_AXIS_INPUT_TUSER
--  Set to 1 if core has an <s_axis_input_tuser> port, else 0
--
-- Parameter: C_HAS_M_AXIS_OUTPUT_TUSER
--   Set to 1 if core has an <m_axis_output_tuser> port, else 0. Should be set to the same value
--   as <C_HAS_S_AXIS_INPUT_TUSER>
--
-- Parameter: C_S_AXIS_INPUT_TDATA_WIDTH
--  Width of <s_axis_input_tdata> port. Must be a multiple of 8.
--
-- Parameter: C_S_AXIS_INPUT_TUSER_WIDTH
--  Width of <s_axis_input_tuser> port
--
-- Parameter: C_S_AXIS_CTRL_TDATA_WIDTH
--  Width of <s_axis_ctrl_tdata> port. Must be a multiple of 8.
--
-- Parameter: C_M_AXIS_OUTPUT_TDATA_WIDTH
--  Width of <m_axis_output_tdata> port. Must be a multiple of 8.
--
-- Parameter: C_M_AXIS_OUTPUT_TUSER_WIDTH
--  Width of <m_axis_output_tuser> port
--
-- Parameter: C_M_AXIS_STAT_TDATA_WIDTH
--  Width of <m_axis_stat_tdata> port. Must be a multiple of 8.
--
--
-- Group: AXI channel sub-field parameters
--        --------------------------------
-- Parameter: C_HAS_DATA_DEL
--  Optional output field in <m_axis_output_tdata> provides a version of the input data
--  with no FEC applied, with the same latency as corrected data stream.
--
-- Parameter: C_HAS_ERASE
--  Set to 1 if erasure decoding is required. The optional 'ERASE' input bit in <s_axis_input_tdata>
--  is then used to flag symbols which are known to be erased.
--
-- Parameter: C_HAS_ERR_STATS
--  Set to 1 if BIT_ERR_0_TO_1 and BIT_ERR_1_TO_0 fields are to be included in <m_axis_stat_tdata>.
--  These fields require additional logic.
--
-- Parameter: C_HAS_INFO
--  Set to 1 if <m_axis_output_tdata> is to include a bit to flag when output symbols are information
--  data or check symbols.
--
-- Parameter: C_HAS_N_IN
--  Set to 1 to allow code block length, N, to be varied for each new block. Makes core a lot bigger.
--  Determines whether <s_axis_ctrl_tdata> will have an N_IN field or not.
--
-- Parameter: C_HAS_R_IN
--  Set to 1 to allow number of check symbols, R, to be varied for each new block. Makes core a bit bigger
--  than <C_HAS_N_IN> alone. Variable R mode has same timing as variable N.
--  Determines whether <s_axis_ctrl_tdata> will have an R_IN field or not.
--
--
-- Group: Reed-Solomon code word parameters
--        ---------------------------------
-- Parameter: C_GEN_START
--  Start index for generator polynomial (see datasheet)
--
-- Parameter: C_H
--  The h parameter for the generator polynomial (see datasheet)
--
-- Parameter: C_K
--  Number of data symbols in a code block. If <C_HAS_N_IN> = 1 this should be set to <C_N> minus the number of
--  check symbols. If <C_HAS_R_IN> = 1, <C_K> should be set such that C_N-C_K equals the largest number of check
--  symbols to be supported.
--
-- Parameter: C_N
--  Total number of symbols (data + check) in a code block. If <C_HAS_N_IN> = 1, this should be set to
--  (2^C_SYMBOL_WIDTH)-1
--
-- Parameter: C_POLYNOMIAL
--  Galois Field polynomial. See <gf_pkg> for more information on this.
--  Supplying a value of 0 will cause the default polynomial for the given symbol width to be selected.
--
-- Parameter: C_SPEC
--  Specification code, used if a predefined code specification is being used that requires special processing.
--  See <gf_pkg> for details of the supported values. Determines whether CCSDS dual-basis ROMs are required.
--  For standard Reed-Solomon codes, this should be set to 0.
--
-- Parameter: C_SYMBOL_WIDTH
--  Galois field symbol size in bits. This is the bus width of the data to be decoded. It must equal the width
--  of the Galois field elements.
--
--
-- Group: Implementation parameters
--        -------------------------
--
-- Parameter: C_IGNORE_ILLEGAL_N_R
--  If set to 1, the core will check sampled N and R values are within the absolute limits.
--  If they are outside these limits then the incoming code block will be ignored. Extra logic is required
--  to perform this check so this parameter should be set to 0 if it is known that N and R will always be legal.
--  If an illegal value is sampled, and the parameter is not set, then the core behavior is not defined and it
--  may have to be reset.
--  The core does not check that the resulting values of N and R are compatible.
--  e.g. N < R, will not be detected if both N and R are inside their absolute limits.
--
-- Parameter: C_DEFINE_LEGAL_R_VALS
--  Normally 0, set to 1 if <C_LEGAL_R_VECTOR_FILE> is to be used.
--
-- Parameter: C_NUM_LEGAL_R_VALUES
--  Number of values in <C_LEGAL_R_VECTOR_FILE>
--
-- Parameter: C_LEGAL_R_VECTOR_FILE
--  Optional file to define which R values are legal when <C_HAS_R_IN> = 1.
--  If it is known that some R values will never be required then some logic can be removed in the Chien unit.
--
-- Parameter: C_NUM_CHANNELS
--  Input data from multiple channels can be interlaced in the DATA_IN field of <s_axis_input_tdata>.
--  e.g. if there are 3 channels (A,B,C), data is input in the following order:
--  A0,B0,C0,A1,B1,C1,etc. If <C_HAS_N_IN> = 1 or <C_HAS_R_IN> = 1 then <C_NUM_CHANNELS> must equal 1.
--
-- Parameter: C_NUM_PUNC_PATTERNS
--  Defines number of different puncture patters that PUNC_SEL will select between. PUNC_SEL is a field
--  in <s_axis_ctrl_tdata>.
--  Set to 0 for no puncturing. If set to 0 or 1 then PUNC_SEL input field is not required.
--
-- Parameter: C_PUNCTURE_SELECT_FILE
--  File name of a file containing a list of how many symbols are punctured for each PUNC_SEL value.
--
-- Parameter: C_PUNCTURE_VECTOR_FILE
--  File name of a file containing the actual symbols to be punctured for each PUNC_SEL value.
--
-- Parameter: C_MEMSTYLE
--  Tell core whether to use block or distributed memory, or let it decide itself, based on size.
--  - dist_mem  (0) => Do not use any block memories
--  - block_mem (1) => Use block memories wherever possible
--  - auto_mem  (2) => Allow core to choose memory styles
--
-- Parameter: C_OUTPUT_CHECK_SYMBOLS
--  Set to 0 to output full block on N symbols. Set to 0 to only output K information symbols.
--  The check symbols are still processed to generate the error statistics; however only the K
--  information symbols will be output and <m_axis_output_tlast> will be asserted when the Kth
--  symbol is being output.
--  If this parameter equals 1 then <info_end> is redundant.
--
-- Parameter: C_OPTIMISATION
--  Indicates the optimization requirement: 0 for area, 1 for speed
--
-- Parameter: C_SELF_RECOVERING
--  Insert extra logic to detect if BMA state machine enters an illegal state and synchronously reset
--  the entire core.
--
--
-- Group: Generation parameters
--        ---------------------
-- Parameter: C_MEM_INIT_PREFIX
--  A string which is prepended to internally generated .mif file names. This prevents
--  problems if multiple cores are being generated simultaneously, as each one can use a
--  different string and the .mif file names will not clash.
--
-- Parameter: C_ELABORATION_DIR
-- Coregen provides the path to the elaboration directory. This is prepended to file names.
--
-- Parameter:  C_EVALUATION
-- Set to 1 if hardware timeout circuit is to be included, 0 if not.
--
-- Parameter: C_XDEVICEFAMILY
--  Indicates the FPGA sub-family. Set to legal string, as defined by Coregen.
--
-- Parameter: C_FAMILY
--  Indicates the FPGA family. Set to legal string, as defined by Coregen.
--
--
--------------------------------------------------------------------------------
-- The following ports are provided:
--
-- Group: Ports
--        -----
-- Port: aclk
--  Single global clock. The core is a completely synchronous design and only the rising edge is used. All
--  inputs must be synchronous to the aclk input.
--
-- Port: aclken
--  The clock enable input is an optional pin, controlled by <C_HAS_ACLKEN>. It is recommended to use the core
--  without this input if possible.
--
-- Port: aresetn
--  The active low synchronous reset input is an optional pin, controlled by <C_HAS_ARESETN>.
--  aresetn is registered inside the core so the actual reset takes place on the clock cycle after
--  aresetn is sampled low. It is possible to reset the core with a single clock cycle pulse; however
--  to maintain AXI compliance, aresetn must be asserted (low) for at least two clock cycles. This allows
--  time for *_tready outputs to go low before aresetn is de-asserted and avoids the situation where
--  valid input data immediately after aresetn with _tready still high needs to be sampled.
--  It is recommended to use the core without this input if possible, as it will increase the area and
--  possibly slow the core down due to routing congestion.
--
-- Port: s_axis_input_tdata
--  Input data bus, composed of the following parts: [PAD][ERASE][PAD][DATA_IN]
--  - DATA_IN: <C_SYMBOL_WIDTH> width bus for incoming symbols to be decoded
--  - ERASE: Optional bit, controlled by <C_HAS_ERASE>. Used to flag symbols which have been erased.
--           i.e. Symbols which the receiver decides are likely to contain errors.
--  - PAD: Ignored inputs, added to pad fields to a multiple of 8 bits
--
-- Port: s_axis_input_tuser
--  Optional input, controlled by <C_HAS_S_AXIS_INPUT_TUSER>. This is used to pass information through the
--  core with the same latency as DATA_IN. This could be marker bits to identify certain input symbols.
--  Symbols input on this port are output on <m_axis_output_tuser>.
--
-- Port: s_axis_input_tvalid
--  Input, signalling valid data on <s_axis_input_tdata>
--
-- Port: s_axis_input_tlast
--  Input, signalling the last symbol of the last channel is on <s_axis_input_tdata>. Not used by core
--  except to check against its own internal symbol count. Event flags are asserted if a discrepency
--  is detected.
--
-- Port: s_axis_input_tready
--  Output, signalling core is ready to sample data on <s_axis_input_tdata>. <s_axis_input_tvalid> is
--  ignored if this output is low.
--
-- Port: s_axis_ctrl_tdata
--  Optional input control bus, controlled by <C_HAS_S_AXIS_CTRL>. It is composed of the following parts
--  [PAD][PUNC_SEL][PAD][R_IN][PAD][N_IN]
--  - N_IN: Optional field, controlled by <C_HAS_N_IN>. Allows a new value of N to be sampled at start of
--          each new block. Limits for variable N decoder, 5 <= N_IN <= 2^C_SYMBOL_WIDTH-1
--  - R_IN: Optional field, controlled by <C_HAS_R_IN>. Allows a new value of r (=N-K) to be sampled at
--          start of each new block.
--  - PUNC_SEL: Optional field, controlled by <C_NUM_PUNC_PATTERNS>. This selects which predefined puncture
--              pattern to use.
--  - PAD: Ignored inputs, added to pad fields to a multiple of 8 bits
--
-- Port: s_axis_ctrl_tvalid
--  Input, signalling valid data on <s_axis_ctrl_tdata>
--
-- Port: s_axis_ctrl_tready
--  Output, signalling core is ready to sample data on <s_axis_ctrl_tdata>.
--
-- Port: m_axis_output_tdata
--  Output data bus, composed of the following parts [PAD][INFO][PAD][DATA_DEL][PAD][DATA_OUT]
--  - DATA_OUT: <C_SYMBOL_WIDTH> bus for output of decoded symbols
--  - DATA_DEL: Optional field, controlled by <C_HAS_DATA_DEL>. This is DATA_OUT with no error correction
--              applied.
--  - INFO: Optional output bit, controlled by <C_HAS_INFO>. INFO is high when information data is on
--          DATA_OUT and low when check symbols are on DATA_OUT
--  - PAD: Zeroes, added to pad fields to a multiple of 8 bits
--
-- Port: m_axis_output_tuser
--  Optional output, controlled by <C_HAS_M_AXIS_OUTPUT_TUSER>. This is <s_axis_input_tuser>, delayed by
--  the latency of the core.
--
-- Port: m_axis_output_tvalid
--  Output, signalling there is valid data on <m_axis_output_tdata>
--
-- Port: m_axis_output_tready
--  Input, signalling the downstream block is ready to sample <m_axis_output_tdata>. This permits the
--  core to output the next sample if it has one. If <m_axis_output_tvalid> is high and <m_axis_output_tready>
--  is low then the core has to stop outputting data and some internal processing will be stalled.
--  Once all buffers are full the input will be stalled and <s_axis_input_tready> will be de-asserted.
--
-- Port: m_axis_output_tlast
--  Output, signalling that the last symbol of a code block is on <m_axis_output_tdata>. In the
--  multi-channel case <m_axis_output_tlast> is asserted when the last symbol of the last channel
--  is being output.
--
-- Port: m_axis_stat_tdata
--  Output status bus. It is composed of the following parts
--  [PAD][BIT_ERR_1_TO_0][BIT_ERR_0_TO_1][ERASE_CNT][ERR_CNT][ERR_FOUND][FAIL]
--  - FAIL: Set high if the core determines that it failed to correct the code block due to too many errors.
--  - ERR_FOUND: Set high if the core detected at least one error in the code block just received.
--  - ERR_CNT: Set to the number of symbols the decoder detected as erroneous in the code block just received.
--  - ERASE_CNT: Set to the number of erasures flagged in the block just received.
--  - BIT_ERR_0_TO_1: Optional field, controlled by <C_HAS_ERR_STATS>. Set to the number of bits that
--                    were corrected from 1 to 0 in the block just received. This field is not present if
--                    <C_HAS_ERR_STATS> = 0. The width of this field is equal to the number of bits needed to
--                    represent ((<C_N>-<C_K>) * <C_SYMBOL_WIDTH>).
--  - BIT_ERR_1_TO_0: Optional field, controlled by <C_HAS_ERR_STATS>. Set to the number of bits that
--                    were corrected from 0 to 1 in the block just received. This field is not present if
--                    <C_HAS_ERR_STATS> = 0. The width of this field is equal to the number of bits needed to
--                    represent ((<C_N>-<C_K>) * <C_SYMBOL_WIDTH>).
--  - PAD: Zeroes, added to pad port to a multiple of 8 bits
--
-- Port: m_axis_stat_tvalid
--  Output, signalling there is valid data on <m_axis_stat_tvalid>. This will be asserted as soon as
--  possible after the block has been decoded, usually coincident with the last symbol of a block being
--  output on <m_axis_output_tdata>.
--
-- Port: m_axis_stat_tlast
--  Output, present if <C_NUM_CHANNELS> > 1. Signals that the status info for the last channel is
--  on <m_axis_stat_tdata>.
--
-- Port: m_axis_stat_tready
--  Input, signalling the downstream block is ready to sample <m_axis_stat_tdata>. This permits the
--  core to output the next sample if it has one. If <m_axis_stat_tdata> has not been consumed and
--  a new value is ready to be output then the core will stall and not be ready to accept new samples
--  on <s_axis_input_tdata>.
--
-- Port: event_s_input_tlast_missing
--  Output, signalling the <s_axis_input_tlast> was not asserted when it was expected. Users should
--  not connect anything to this if they don't need it and the logic will be optimized away.
--
-- Port: event_s_input_tlast_unexpected
--  Output, signalling the <s_axis_input_tlast> was asserted when it was not expected. Users should
--  not connect anything to this if they don't need it and the logic will be optimized away.
--
-- Port: event_s_ctrl_tdata_invalid
--  Output, signalling that an invalid ctrl channel value was sampled
--  Core only checks against absolute limits, so it is possible to sample invalid values without
--  them being detected.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

-- AXI utils contains slave and master FIFOs
library axi_utils_v2_0_3;
use axi_utils_v2_0_3.axi_utils_v2_0_3_pkg.all;
use axi_utils_v2_0_3.axi_utils_comps.all;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;


entity rs_decoder_axi_wrapper is
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer;
  C_HAS_ARESETN                : integer;
  C_HAS_S_AXIS_CTRL            : integer;
  C_HAS_S_AXIS_INPUT_TUSER     : integer;
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer;
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer;
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer;
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer;
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer;
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer;
  C_M_AXIS_STAT_TDATA_WIDTH    : integer;

  -- AXI channel sub-field parameters
  C_HAS_DATA_DEL               : integer;
  C_HAS_ERASE                  : integer;
  C_HAS_ERR_STATS              : integer;
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
  C_IGNORE_ILLEGAL_N_R         : integer;
  C_DEFINE_LEGAL_R_VALS        : integer;
  C_NUM_LEGAL_R_VALUES         : integer;
  C_LEGAL_R_VECTOR_FILE        : string;
  C_NUM_CHANNELS               : integer;
  C_NUM_PUNC_PATTERNS          : integer;
  C_PUNCTURE_SELECT_FILE       : string;
  C_PUNCTURE_VECTOR_FILE       : string;
  C_MEMSTYLE                   : integer;
  C_OUTPUT_CHECK_SYMBOLS       : integer;
  C_OPTIMISATION               : integer;
  C_SELF_RECOVERING            : integer;

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
  s_axis_input_tlast    : in  std_logic;
  s_axis_input_tready   : out std_logic;

  s_axis_ctrl_tdata     : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid    : in  std_logic := '0';
  s_axis_ctrl_tready    : out std_logic;

  m_axis_output_tdata   : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);
  m_axis_output_tuser   : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);
  m_axis_output_tvalid  : out std_logic;
  m_axis_output_tready  : in  std_logic := '1';
  m_axis_output_tlast   : out std_logic;

  m_axis_stat_tdata     : out std_logic_vector(C_M_AXIS_STAT_TDATA_WIDTH-1 downto 0);
  m_axis_stat_tvalid    : out std_logic;
  m_axis_stat_tlast     : out std_logic;
  m_axis_stat_tready    : in  std_logic := '1';

  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic

);

end rs_decoder_axi_wrapper;



--------------------------------------------------------------------------------
architecture synth of rs_decoder_axi_wrapper is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Group: architecture

  ------------------------------------------------------------------------------
  -- Group: constants

  -- boolean: multi_channel
  -- true if there is more than one input channel
  constant multi_channel : boolean := C_NUM_CHANNELS > 1;

  -- boolean: has_puncturing
  -- true if core implements puncture patterns
  constant has_puncturing : boolean := C_NUM_PUNC_PATTERNS > 0;

  -- boolean: erase_or_puncture
  -- true if core has an <erase_cnt> output. This will be the case if it has and <erase>
  -- or <punc_sel> input.
  constant erase_or_puncture : boolean := C_HAS_ERASE/=0 or has_puncturing;

  ------------------------------------------------------------------------------
  -- Fields within AXI busses

  -- integer: data_in_field_width
  -- Size of data_in field in <s_axis_input_tdata>
  constant data_in_field_width : integer := roundup_to_multiple(C_SYMBOL_WIDTH, axi_field_factor);

  -- integer: data_out_field_width
  -- Size of data_out field in <m_axis_output_tdata>
  constant data_out_field_width : integer := data_in_field_width;

  -- integer: data_del_field_width
  -- Size of data_del field in <m_axis_output_tdata>
  constant data_del_field_width : integer := select_val(0, data_out_field_width, C_HAS_DATA_DEL);

  -- integer: n_in_field_width
  -- Size of n_in field in <s_axis_ctrl_tdata>
  constant n_in_field_width : integer :=
    select_val(0, roundup_to_multiple(C_SYMBOL_WIDTH, axi_field_factor), C_HAS_N_IN);


  -- integer: r_constant
  -- Number of check symbols, R=N-K
  constant r_constant : integer := C_N - C_K;
  -- integer: r_in_width
  -- Optional r_in port needs enough bits to represent the largest N-K value
  constant r_in_width : integer := integer_width(r_constant);

  -- integer: err_cnt_width
  -- There can be up to R errors, so err_cnt can be same width as r_in
  constant err_cnt_width : integer := r_in_width;

  -- integer: erase_cnt_width
  -- There can be up to N erasures
  constant erase_cnt_width : integer := integer_width(C_N);

  -- integer: actual_erase_cnt_width
  -- 0 if there is not <erase_cnt> bus, else set to the width of the bus
  constant actual_erase_cnt_width : integer := select_val_b(0, erase_cnt_width, erase_or_puncture);

  -- integer: bit_err_width
  -- There can be <C_SYMBOL_WIDTH> bit errors in each symbol and up to R symbols in error
  constant bit_err_width : integer := integer_width((r_constant) * C_SYMBOL_WIDTH);

  -- integer: actual_bit_err_width
  -- 0 if there are no bit error outputs, else set to the width of <bit_err_0_to_1> + <bit_err_1_to_0>
  constant actual_bit_err_width : integer := select_val(0, bit_err_width, C_HAS_ERR_STATS);

  -- integer: total_error_status_width
  --  Total width of all error stats to go on <m_axis_stat_output>, not including padding bits
  --  2 (for <fail> & <err_found>) plus <err_cnt> plus optional <erase_cnt> and bit error statistics
  constant total_error_status_width : integer := 2 + err_cnt_width +
                                                 actual_erase_cnt_width + (2 * actual_bit_err_width);



  -- integer: erase_cnt_lsb_index
  -- Index of erase_cnt field LSB in <m_axis_stat_tdata>
  constant erase_cnt_lsb_index : integer := err_cnt_width + 2;
  -- integer: erase_cnt_msb_index
  -- Index of erase_cnt field MSB in <m_axis_stat_tdata>
  constant erase_cnt_msb_index : integer := erase_cnt_width + err_cnt_width + 1;

  -- integer: r_in_lsb_index
  -- r_in field of input data starts after n_in field
  constant r_in_lsb_index : integer := n_in_field_width;
  -- integer: r_in_msb_index
  -- Index of r_in field MSB in <s_axis_ctrl_tdata>
  constant r_in_msb_index : integer := r_in_lsb_index + r_in_width - 1;

  -- integer: s_axis_ctrl_fifo_r_in_lsb
  -- r_in is placed immediately after n_in if n_in is present, else it is the least significant
  -- field in the ctrl FIFO input.
  constant s_axis_ctrl_fifo_r_in_lsb : integer := select_val(0, C_SYMBOL_WIDTH, C_HAS_N_IN);

  -- integer: s_axis_ctrl_fifo_r_in_msb
  -- Index of r_in field MSB in <s_axis_ctrl_fifo_in>
  constant s_axis_ctrl_fifo_r_in_msb : integer := s_axis_ctrl_fifo_r_in_lsb + r_in_width - 1;

  -- integer: punc_sel_width
  -- Optional punc_sel port needs enough bits to represent <C_NUM_PUNC_PATTERNS>-1
  constant punc_sel_width : integer := integer_width(C_NUM_PUNC_PATTERNS-1);


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
  -- FIFO bus is composed of (mark_in, erase, data_in)

  -- integer: s_axis_input_fifo_mark_in_lsb
  -- LSB bit position of <mark_in> within s_axis_input_fifo input and output
  constant s_axis_input_fifo_mark_in_lsb : integer := select_val(C_SYMBOL_WIDTH,
                                                                 C_SYMBOL_WIDTH+1,
                                                                 C_HAS_ERASE);

  -- integer: s_axis_input_fifo_mark_in_msb
  -- MSB bit position of <mark_in> within s_axis_output_fifo data input and output
  constant s_axis_input_fifo_mark_in_msb : integer := s_axis_input_fifo_mark_in_lsb + C_S_AXIS_INPUT_TUSER_WIDTH - 1;

  -- integer: s_axis_input_fifo_width
  -- Combined width of all the elements of s_axis_input_tdata and s_axis_input_tuser (if present)
  -- and s_axis_input_tlast, not including any padding bits (as we don't want to waste resources
  -- storing those in a FIFO).
  -- s_axis_input_tlast will be the MSB of the FIFO data bus
  constant s_axis_input_fifo_width : integer :=
    select_val(s_axis_input_fifo_mark_in_lsb+1,
               s_axis_input_fifo_mark_in_lsb+C_S_AXIS_INPUT_TUSER_WIDTH+1,
               C_HAS_S_AXIS_INPUT_TUSER);

  -- integer: s_axis_input_fifo_depth
  -- Depth of AXI input FIFO. Set to 16, as this has minimal cost when SRL16 is used.
  -- Must also be large enough to hold all samples for a channel so that an entire
  -- block can be loaded into the core even if the output of the Syndrome Unit is blocked.
  -- Allow an additional 5 symbols in multi-channel case as FIFO can become full earlier
  -- than expected because of internal pipelining.
  -- Depth must be a power of 2 for <glb_srl_fifo> component.
  constant s_axis_input_fifo_depth : integer := max_of(GLB_next_pow2(C_NUM_CHANNELS+5), 16);


  ------------------------------------------------------------------------------
  -- s_axis_ctrl FIFO constants

  -- integer: s_axis_ctrl_fifo_width_tmp
  -- Combined width of all the elements of s_axis_ctrl_tdata, not including any padding bits
  -- (as we don't want to waste resources storing those in a FIFO).
  constant s_axis_ctrl_fifo_width_tmp : integer := select_val(0, C_SYMBOL_WIDTH, C_HAS_N_IN) +
                                                   select_val(0, r_in_width, C_HAS_R_IN) +
                                                   select_val_b(0, punc_sel_width, has_puncturing);

  -- integer: s_axis_ctrl_fifo_width
  -- Don't let width go below 1 to avoid compiler warnings if C_HAS_S_AXIS_CTRL=0
  constant s_axis_ctrl_fifo_width : integer := max_of(1, s_axis_ctrl_fifo_width_tmp);


  -- integer: s_axis_ctrl_fifo_depth
  -- Depth of AXI ctrl FIFO.
  -- FIFO holds up to 16 control values. 16 costs the same as 2 if an SRL16 is used, so always set to 16.
  constant s_axis_ctrl_fifo_depth : integer := max_of(min_ifx_fifo_depth, 16);


  ------------------------------------------------------------------------------
  -- m_axis_output FIFO constants
  -- FIFO bus is composed of (mark_out, info, data_del, data_out)

  -- integer: m_axis_output_fifo_data_del_lsb
  -- LSB bit position of <data_del> within m_axis_output_fifo data input and output
  constant m_axis_output_fifo_data_del_lsb : integer := C_SYMBOL_WIDTH;

  -- integer: m_axis_output_fifo_info_lsb
  -- LSB bit position of <info> within m_axis_output_fifo data input and output
  constant m_axis_output_fifo_info_lsb : integer := select_val(m_axis_output_fifo_data_del_lsb,
                                                               m_axis_output_fifo_data_del_lsb + C_SYMBOL_WIDTH,
                                                               C_HAS_DATA_DEL);

  -- integer: m_axis_output_fifo_mark_out_lsb
  -- LSB bit position of <mark_out> within m_axis_output_fifo data input and output
  constant m_axis_output_fifo_mark_out_lsb : integer := select_val(m_axis_output_fifo_info_lsb,
                                                                   m_axis_output_fifo_info_lsb + 1,
                                                                   C_HAS_INFO);
  -- integer: m_axis_output_fifo_width
  -- Combined width of all the elements of m_axis_output_tdata and m_axis_output_tuser (if present)
  -- not including any padding bits (as we don't want to waste resources storing those in a FIFO).
  -- Add 1 for <last_data_out> signal to be passed through to generate m_axis_output_tlast
  constant m_axis_output_fifo_width : integer :=
    select_val(m_axis_output_fifo_mark_out_lsb+1,
               m_axis_output_fifo_mark_out_lsb+1+C_S_AXIS_INPUT_TUSER_WIDTH,
               C_HAS_S_AXIS_INPUT_TUSER);

  -- integer: m_axis_output_fifo_depth
  -- Depth of AXI output FIFO. The glb_ifx_master component used for this FIFO has a minimum depth of 4,
  -- although we only actually need a depth of 2 in order to retime tready and switch off the
  -- clock enable for the Forney unit.
  constant m_axis_output_fifo_depth : integer := min_ifx_fifo_depth;

  ------------------------------------------------------------------------------
  -- m_axis_stat FIFO constants

  -- integer: m_axis_stat_fifo_width
  -- Width of all the elements of <m_axis_stat_tdata>, not including any padding bits (as we don't want
  -- to waste resources storing those in a FIFO).
  -- In multi-channel case, add 1 for <stat_data_out> signal to be passed through to generate <m_axis_stat_tlast>
  constant m_axis_stat_fifo_width : integer :=
    select_val_b(total_error_status_width, 1+total_error_status_width, multi_channel);

  -- integer: m_axis_stat_fifo_depth
  -- Depth of AXI stat FIFO.
  -- FIFO holds stat values for <C_NUM_CHANNELS> channels + 1. This allows values for one complete block to
  -- be stored plus the start of the next block, so that data pipeline is not stalled until the end of the
  -- second block if <m_axis_stat_tready> is held low. The "+1" is actually read out of the FIFO RAM into the
  -- FIFO output register, even when tready = '0', so actual depth of FIFO only needs to be <C_NUM_CHANNELS>.
  -- Minimum depth of FIFO used is actually 4, so FIFO may be deeper than needed, but this just means it will
  -- be slightly longer until core stalls. FIFO component also requires depth to be a power of 2.
  -- FIFO can go full earlier than expected due to internal pipelining, so add 5 to required depth.
--  constant m_axis_stat_fifo_depth : integer := max_of(2**(log2roundup(C_NUM_CHANNELS)), 16);
  constant m_axis_stat_fifo_depth : integer := max_of(GLB_next_pow2(C_NUM_CHANNELS+5), 16);

  ------------------------------------------------------------------------------
  -- Group: types

  -- type: symbol_type
  -- Standard vector type for data symbols
  subtype symbol_type is std_logic_vector(symbol_width_minus_1 downto 0);

  ------------------------------------------------------------------------------
  -- Group: signals

  -- Group: Signals to drive <rs_decoder_main> inputs
  --  aclken_int  - Internal clock enable, tied high if <C_HAS_ACLKEN> = 0
  --  aresetn_int - Internal active low sync reset, tied high if <C_HAS_ARESETN> = 0
  --  data_in     - Data to be decoded
  --  erase       - High to indicate erasure on data_in
  --  n_in        - Optional variable N input
  --  punc_sel    - Optional punc_sel input
   -- r_in        - Optional variable R
  --  mark_in     - tuser bits, passed from <rs_decoder_main> mark_in to mark_out
  signal aclken_int  : std_logic := '0';
  signal aresetn_int : std_logic := '0';
  signal data_in     : symbol_type := (others => '0');
  signal erase       : std_logic := '0';
  signal n_in        : symbol_type := (others => '0');
  signal punc_sel    : std_logic_vector(punc_sel_width-1 downto 0) := (others => '0');
  signal r_in        : std_logic_vector(r_in_width-1 downto 0) := (others => '0');
  signal mark_in     : std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others => '0');

  -- Group: Signals to receive <rs_decoder_main> outputs
  --  bit_err_0_to_1 - Count of 0 to 1 bit errors found
  --  bit_err_1_to_0 - Count of 1 to 0 bit errors found
  --  data_del       - Output un-corrected data from decoder
  --  data_out       - Output corrected data from decoder
  --  erase_cnt      - Count of erasures flagged
  --  err_cnt        - Count of errors found
  --  err_found      - Output high if error found
  --  fail           - Output high if decoder fails
  --  info           - Output high when information symbols on data_out, low for check symbols
  --  mark_out       - tuser bits, passed from <rs_decoder_main> mark_in to mark_out
  signal bit_err_0_to_1 : std_logic_vector(bit_err_width-1 downto 0) := (others => '0');
  signal bit_err_1_to_0 : std_logic_vector(bit_err_width-1 downto 0) := (others => '0');
  signal data_del       : symbol_type := (others => '0');
  signal data_out       : symbol_type := (others => '0');
  signal erase_cnt      : std_logic_vector(erase_cnt_width-1 downto 0) := (others => '0');
  signal err_cnt        : std_logic_vector(err_cnt_width-1 downto 0) := (others => '0');
  signal err_found      : std_logic := '0';
  signal fail           : std_logic := '0';
  signal info           : std_logic := '0';
  signal mark_out       : std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others => '0');

  -- Group: Other signals
  --  s_axis_input_fifo_in - Input bus for AXI input FIFO, concatenation of all the input channel information
  --  s_axis_input_fifo_out - Output bus for AXI output FIFO
  --  s_axis_ctrl_fifo_in - Input bus for AXI ctrl FIFO, concatenation of all the ctrl channel information
  --  s_axi_ctrl_fifo_out - Output bus for AXI ctrl FIFO
  --  m_axis_output_fifo_in - Input bus for AXI output FIFO, concatenation of all the output channel information
  --  m_axis_output_fifo_out - Output bus for AXI output FIFO
  --  m_axis_output_tdata_tmp - Used to give default assignment of zeroes to unused bits in <m_axis_output_tdata>
  --  m_axis_stat_fifo_in - Input bus for AXI stat FIFO, concatenation of all the stat channel information
  --  m_axis_stat_fifo_out - Output bus for AXI stat FIFO
  --  m_axis_stat_tdata_tmp - Used to give default assignment of zeroes to unused bits in <m_axis_stat_tdata>
  --  m_axis_stat_tvalid_tmp - Signal to assign to primary output, providing there is a STAT channel
  --  m_axis_stat_tlast_tmp - Signal to assign to primary output, providing there is a STAT channel
  --  last_data_out - High when last symbol is on data_out bus from <rs_decoder_main> component
  --  last_stat_out - High when last channel info is on outputs from <rs_decoder_main> component
  --  output_fifo_has_room - Low when o/p FIFO full - used to stop processing
  --  stat_fifo_has_room - Low when status FIFO full - used to stop processing
  --  slow_ce - symbol rate clock enable from sampler unit.
  --  sr_reg - <aresetn> is inverted and registerd in the sampler unit to give an active high synchronous reset
  --  data_out_rdy - asserted high when data is to be written to the AXI output FIFO
  --  stat_out_rdy - asserted high when status info is to be written to the AXI status FIFO
  --  ctrl_fifo_rd_en - read enable for ctrl FIFO
  --  ctrl_fifo_not_empty - asserted when ctrl FIFO contains data to be read
  --  input_fifo_rd_en - read enable for input FIFO
  --  input_tready - tready signal for <rs_decoder_main>, signalling it is ready to receive input data
  --  input_tvalid - tvalid signal for <rs_decoder_main>, signalling valid data on data_in
  --  input_tlast - tlast pulse to inner core
  --  input_fifo_add - Input FIFO internal address bus
  --  input_fifo_wr_en - Write enable for input FIFO
  --  nc_samples_available - high when input FIFO contains <C_NUM_CHANNELS> samples
  signal s_axis_input_fifo_in    : std_logic_vector(s_axis_input_fifo_width-1 downto 0) := (others => '0');
  signal s_axis_input_fifo_out   : std_logic_vector(s_axis_input_fifo_width-1 downto 0) := (others => '0');
  signal s_axis_ctrl_fifo_in     : std_logic_vector(s_axis_ctrl_fifo_width-1 downto 0) := (others => '0');
  signal s_axis_ctrl_fifo_out    : std_logic_vector(s_axis_ctrl_fifo_width-1 downto 0) := (others => '0');
  signal m_axis_output_fifo_in   : std_logic_vector(m_axis_output_fifo_width-1 downto 0) := (others => '0');
  signal m_axis_output_fifo_out  : std_logic_vector(m_axis_output_fifo_width-1 downto 0) := (others => '0');
  signal m_axis_output_tdata_tmp : std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');
  signal m_axis_stat_fifo_in     : std_logic_vector(m_axis_stat_fifo_width-1 downto 0) := (others => '0');
  signal m_axis_stat_fifo_out    : std_logic_vector(m_axis_stat_fifo_width-1 downto 0) := (others => '0');
  signal m_axis_stat_tdata_tmp   : std_logic_vector(C_M_AXIS_STAT_TDATA_WIDTH-1 downto 0) := (others=>'0');
  signal m_axis_stat_tvalid_tmp  : std_logic := '0';
  signal m_axis_stat_tlast_tmp   : std_logic := '0';
  signal last_data_out           : std_logic := '0';
  signal last_stat_out           : std_logic := '0';
  signal output_fifo_has_room    : std_logic := '0';
  signal stat_fifo_has_room      : std_logic := '1';
  signal slow_ce                 : std_logic := '0';
  signal sr_reg                  : std_logic := '0';
  signal data_out_rdy            : std_logic := '0';
  signal stat_out_rdy            : std_logic := '0';
  signal ctrl_fifo_rd_en         : std_logic := '0';
  signal ctrl_fifo_not_empty     : std_logic := '0';
  signal input_fifo_rd_en        : std_logic := '0';
  signal input_tready            : std_logic := '0';
  signal input_tvalid            : std_logic := '0';
  signal input_tlast             : std_logic := '0';
  signal input_fifo_add          : signed(GLB_log2(s_axis_input_fifo_depth+1)-1 downto 0) := (others => '0');
  signal input_fifo_wr_en        : std_logic := '0';
  signal nc_samples_avail        : std_logic := '0';

  -- Internal signals (not connected to anything) to allow use of toggle coverage
  -- to determine if FIFOs have been filled and emptied
  signal axi_input_fifo_full, axi_input_fifo_empty : std_logic := '0';
  signal axi_ctrl_fifo_full, axi_ctrl_fifo_empty   : std_logic := '0';
  signal axi_output_fifo_full                      : std_logic := '0';
  signal axi_stat_fifo_full                        : std_logic := '0';

begin
  -- Group: architecture body


  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Extract fields from AXI input channel and outputs from AXI input FIFO
  --

  ------------------------------------------------------------------------------
  -- Generate incoming data bus
  s_axis_input_fifo_in(symbol_width_minus_1 downto 0) <= s_axis_input_tdata(symbol_width_minus_1 downto 0);
  data_in <= s_axis_input_fifo_out(symbol_width_minus_1 downto 0);

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
    aresetn_int <= aresetn;
  end generate; -- arg1

  arg2: if C_HAS_ARESETN = 0 generate
  begin
    aresetn_int <= '1';
  end generate; -- arg2


  ------------------------------------------------------------------------------
  -- Generate optional erase input
  eg1: if C_HAS_ERASE /= 0 generate
  begin
    s_axis_input_fifo_in(C_SYMBOL_WIDTH) <= s_axis_input_tdata(data_in_field_width);
    erase <= s_axis_input_fifo_out(C_SYMBOL_WIDTH);
  end generate; -- eg1

  eg2: if C_HAS_ERASE = 0 generate
  begin
    erase <= '0';
  end generate; -- eg2

  ------------------------------------------------------------------------------
  -- Generate optional mark_in input from s_axis_input_tuser
  tug1: if C_HAS_S_AXIS_INPUT_TUSER /= 0 generate
  begin
    s_axis_input_fifo_in(s_axis_input_fifo_mark_in_msb downto s_axis_input_fifo_mark_in_lsb) <= s_axis_input_tuser;
    mark_in <= s_axis_input_fifo_out(s_axis_input_fifo_mark_in_msb downto s_axis_input_fifo_mark_in_lsb);
  end generate; -- tug1

  ------------------------------------------------------------------------------
  -- Pass incoming tlast signal through input FIFO so that it appears in Sampler unit
  -- at the same time as last input data symbol
  s_axis_input_fifo_in(s_axis_input_fifo_width-1) <= s_axis_input_tlast;
  input_tlast <= s_axis_input_fifo_out(s_axis_input_fifo_width-1);



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
  -- Generate optional punc_sel input
  psg1: if C_NUM_PUNC_PATTERNS > 1 generate
    -- PUNC_SEL field of input data starts after R_IN field
    constant punc_sel_lsb_index : integer := select_val(r_in_lsb_index,
                                                        roundup_to_multiple(r_in_msb_index+1,axi_field_factor),
                                                        C_HAS_R_IN);

    constant punc_sel_msb_index : integer := punc_sel_lsb_index + punc_sel_width - 1;

    constant s_axis_ctrl_fifo_punc_sel_lsb : integer := select_val(s_axis_ctrl_fifo_r_in_lsb,
                                                                   s_axis_ctrl_fifo_r_in_msb+1,
                                                                   C_HAS_R_IN);
    constant s_axis_ctrl_fifo_punc_sel_msb : integer := s_axis_ctrl_fifo_punc_sel_lsb + punc_sel_width - 1;

  begin
    s_axis_ctrl_fifo_in(s_axis_ctrl_fifo_punc_sel_msb downto s_axis_ctrl_fifo_punc_sel_lsb) <=
                                           s_axis_ctrl_tdata(punc_sel_msb_index downto punc_sel_lsb_index);

    punc_sel <= s_axis_ctrl_fifo_out(s_axis_ctrl_fifo_punc_sel_msb downto s_axis_ctrl_fifo_punc_sel_lsb);
  end generate; -- psg1

  psg2: if C_NUM_PUNC_PATTERNS <= 1 generate
  begin
    punc_sel <= (others=>'0'); -- force to fixed value
  end generate; -- psg2



  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Generate fields for AXI outputs and inputs to AXI output FIFO
  --

  ------------------------------------------------------------------------------
  -- Generate m_axis_output_tdata
  -- Undriven bits will be forced to '0' by signal declaration initialization
  m_axis_output_tdata <= m_axis_output_tdata_tmp;

  -- Include data_out
  m_axis_output_fifo_in(symbol_width_minus_1 downto 0) <= data_out;

  m_axis_output_tdata_tmp(symbol_width_minus_1 downto 0) <= m_axis_output_fifo_out(symbol_width_minus_1 downto 0);

  -- Include data_del
  ddg1: if C_HAS_DATA_DEL /= 0 generate
  begin
    m_axis_output_fifo_in(C_SYMBOL_WIDTH+m_axis_output_fifo_data_del_lsb-1 downto m_axis_output_fifo_data_del_lsb) <=
      data_del;

    m_axis_output_tdata_tmp(C_SYMBOL_WIDTH+data_out_field_width-1 downto data_out_field_width) <=
      m_axis_output_fifo_out(C_SYMBOL_WIDTH+m_axis_output_fifo_data_del_lsb-1 downto m_axis_output_fifo_data_del_lsb);
  end generate; -- ddg1

  -- Include info
  ifg1: if C_HAS_INFO /= 0 generate
  begin
    m_axis_output_fifo_in(m_axis_output_fifo_info_lsb) <= info;

    m_axis_output_tdata_tmp(data_out_field_width + data_del_field_width) <=
      m_axis_output_fifo_out(m_axis_output_fifo_info_lsb);
  end generate; -- ifg1



  ------------------------------------------------------------------------------
  -- Generate optional m_axis_output_tuser output from mark_out
  -- C_M_AXIS_OUTPUT_TUSER_WIDTH should equal C_S_AXIS_INPUT_TUSER width
  -- (=mark_out width), but it might not, so use ieee.numeric_std resize
  -- function to either pad with zeroes or strip off MSBs to match
  -- C_M_AXIS_OUTPUT_TUSER_WIDTH
  tug2: if C_HAS_M_AXIS_OUTPUT_TUSER /= 0 generate
  begin
    m_axis_output_fifo_in(mark_out'length+m_axis_output_fifo_mark_out_lsb-1 downto m_axis_output_fifo_mark_out_lsb) <=
      mark_out;

    m_axis_output_tuser <= std_logic_vector(resize(unsigned(
      m_axis_output_fifo_out(mark_out'length+m_axis_output_fifo_mark_out_lsb-1 downto m_axis_output_fifo_mark_out_lsb)),
      C_M_AXIS_OUTPUT_TUSER_WIDTH));
  end generate; -- tug2



  ------------------------------------------------------------------------------
  -- Generate m_axis_output_tlast signal by passing last_data_out through the
  -- AXI output FIFO on the MSB of the FIFO data bus.
  m_axis_output_fifo_in(m_axis_output_fifo_width-1) <= last_data_out;
  m_axis_output_tlast <= m_axis_output_fifo_out(m_axis_output_fifo_width-1);



  ------------------------------------------------------------------------------
  -- Generate m_axis_stat_tdata
  --
  -- Undriven bits will be forced to '0' by signal declaration initialization
  m_axis_stat_tdata <= m_axis_stat_tdata_tmp;


  -- Copy FIFO output into tmp signal which has unused padding bits tied to '0'
  -- Don't copy entire FIFO output in multi-channel case, as MSB = tlast signal
  m_axis_stat_tdata_tmp(total_error_status_width-1 downto 0) <=
            m_axis_stat_fifo_out(total_error_status_width-1 downto 0);

  m_axis_stat_tvalid <= m_axis_stat_tvalid_tmp;
  m_axis_stat_tlast  <= m_axis_stat_tlast_tmp;




  ------------------------------------------------------------------------------
  -- AXI interface components
  --

  ------------------------------------------------------------------------------
  -- AXI input channel FIFO
  --

  ------------------------------------------------------------------------------
  -- Object: axi_input_fifo
  -- This FIFO buffers incoming input data from the AXI s_axis_input channel.
  -- This minimizes fan-in of AXI handshaking signals
  axi_input_fifo : rs_ifx_slave
  generic map(
    WIDTH          => s_axis_input_fifo_width,
    DEPTH          => s_axis_input_fifo_depth,
    HAS_IFX        => true, -- for AXI compatible outputs
    AEMPTY_THRESH0 => 0,
    AEMPTY_THRESH1 => 0 )
  port map(
    aclk      => aclk,
    aclken    => aclken_int,
    areset    => sr_reg, -- sampled active high sync reset
    ifx_valid => s_axis_input_tvalid,
    ifx_ready => s_axis_input_tready,
    ifx_data  => s_axis_input_fifo_in,
    rd_enable => input_fifo_rd_en,
    rd_valid  => input_tvalid,
    rd_data   => s_axis_input_fifo_out,
    not_empty => open,
    wr_enable => input_fifo_wr_en, -- Probe internal FIFO write enable
    add       => input_fifo_add,   -- Probe internal FIFO address
    full      => axi_input_fifo_full,
    empty     => axi_input_fifo_empty
    );

  input_fifo_rd_en <= input_tready and aclken_int; -- FIFO rd_enable and wr_enable must be gated with ce




  ------------------------------------------------------------------------------
  -- AXI ctrl channel FIFO
  --
  cfg1 : if C_HAS_S_AXIS_CTRL /= 0 generate
  begin

    ----------------------------------------------------------------------------
    -- Object: axi_ctrl_fifo
    -- This FIFO buffers incoming control data from the AXI s_axis_ctrl channel.
    -- This minimizes fan-in of AXI handshaking signals and allows control information
    -- for up to 16 blocks of input data to be set up in advance.
    -- If this FIFO is empty the s_axis_input channel will be stalled.
    -- The FIFO is read just as <rs_decoder_main> is ready to accept a new block of input data.
    axi_ctrl_fifo : rs_ifx_slave
    generic map(
      WIDTH          => s_axis_ctrl_fifo_width,
      DEPTH          => s_axis_ctrl_fifo_depth,
      HAS_IFX        => true, -- for AXI compatible outputs
      AEMPTY_THRESH1 => 0,
      AEMPTY_THRESH0 => 0 )
    port map(
      aclk      => aclk,
      aclken    => aclken_int,
      areset    => sr_reg, -- sampled active high sync reset
      ifx_valid => s_axis_ctrl_tvalid,
      ifx_ready => s_axis_ctrl_tready,
      ifx_data  => s_axis_ctrl_fifo_in,
      rd_enable => ctrl_fifo_rd_en,
      rd_valid  => open,
      rd_data   => s_axis_ctrl_fifo_out,
      not_empty => ctrl_fifo_not_empty,
      full      => axi_ctrl_fifo_full,
      empty     => axi_ctrl_fifo_empty);

  end generate; -- cfg1

  cfg2 : if C_HAS_S_AXIS_CTRL = 0 generate
  begin
    ctrl_fifo_not_empty <= '1'; -- Set to '1' to prevent input channel from being blocked
  end generate; -- cfg2

  ------------------------------------------------------------------------------
  -- AXI output channel FIFO
  --
  ------------------------------------------------------------------------------
  -- Object: axi_output_fifo
  -- This FIFO decouples the decoded data output from the actual AXI m_axis_output channel.
  -- Without this FIFO the unregistered tready input would have to be used to
  -- disable the core as soon as it went low.
  axi_output_fifo : glb_ifx_master
  generic map(
    WIDTH         => m_axis_output_fifo_width,
    DEPTH         => m_axis_output_fifo_depth,
    AFULL_THRESH1 => 0,
    AFULL_THRESH0 => 0 )
  port map(
    aclk      => aclk,
    aclken    => aclken_int,
    areset    => sr_reg, -- sampled active high sync reset
    wr_enable => data_out_rdy,
    wr_data   => m_axis_output_fifo_in,
    ifx_valid => m_axis_output_tvalid,
    ifx_ready => m_axis_output_tready,
    ifx_data  => m_axis_output_fifo_out,
    not_full  => output_fifo_has_room,
    full      => axi_output_fifo_full);

  ------------------------------------------------------------------------------
  -- AXI stat channel output FIFO
  --
  -- If single channel then we don't need a status FIFO as the status values are
  -- held in the final registers in the Forney unit (using a special clock enable).
  -- They are held there until consumed by the M_AXIS_STAT channel. If they are
  -- not consumed within a block length and the next lot of status values are about
  -- to be written then output pipeline is stalled.
  -- In the multi-channel case a FIFO is necessary as the values for all the channels
  -- have to be held until the end of the next block if necessary. The FIFO is deep
  -- enough to hold status values for all the channels + 1, so the core will not be
  -- stalled providing the status values for a block are consumed before the end of
  -- the next block.
  --
  sfg1 : if not(multi_channel) generate
    signal stat_valid : std_logic := '0';
  begin

    -- Object: axi_status_process
    -- Set stat_valid register if stat_out_rdy because a new value is being written
    -- Reset if tvalid and tready are both high, indicating that the value will be
    -- consumed
    -- It is ok to register the stat_fifo_has_room signal because there will always
    -- be at least n symbol periods from this signal going low until the next write.
    axi_status_process : process(aclk)
    begin
      if rising_edge(aclk) then
        if sr_reg = '1' then
          stat_valid <= '0';
          stat_fifo_has_room <= '1';

        elsif aclken_int = '1' then
          stat_valid <= stat_out_rdy or (stat_valid and not(m_axis_stat_tready));

          stat_fifo_has_room <= not(stat_valid and not(m_axis_stat_tready));
        end if; -- sr_reg = '1'
      end if; -- rising_edge(aclk)

    end process; -- axi_status_process

    m_axis_stat_tvalid_tmp <= stat_valid; -- Primary output
    --m_axis_stat_tlast_tmp  <= '1'; -- tlast has no meanining for single channel stat output

    -- There is no actual FIFO in the single channel case, only the control logic, so just
    -- drive the FIFO output with the status outputs directly from the <rs_decoder_main> component.

    -- Include standard error flags and err_cnt
    m_axis_stat_fifo_out(0) <= fail;
    m_axis_stat_fifo_out(1) <= err_found;
    m_axis_stat_fifo_out(err_cnt_width+1 downto 2) <= err_cnt;


    -- Include optional erase_cnt field
    ecg1: if erase_or_puncture generate
    begin
      m_axis_stat_fifo_out(erase_cnt_msb_index downto erase_cnt_lsb_index) <= erase_cnt;
    end generate; -- ecg1


    -- Include optional bit_err field
    esg1: if C_HAS_ERR_STATS /= 0 generate
      constant err_stats_lsb_index : integer :=
        select_val_b(erase_cnt_lsb_index, erase_cnt_msb_index+1, erase_or_puncture);
    begin
      m_axis_stat_fifo_out(bit_err_width-1+err_stats_lsb_index downto err_stats_lsb_index) <= bit_err_0_to_1;
      m_axis_stat_fifo_out((2*bit_err_width)-1+err_stats_lsb_index downto
                            bit_err_width+err_stats_lsb_index) <= bit_err_1_to_0;
    end generate; -- esg1

    nc_samples_avail <= '1'; -- not used

  end generate; -- sfg1

  sfg2 : if multi_channel generate
  begin

    -- Object: axi_stat_fifo
    -- This FIFO decouples the stat tdata output from the actual AXI m_axis_stat channel.
    -- FIFO holds stat values for <C_NUM_CHANNELS> channels + 1 if tready = '0'. The "+1" is necessary so that the
    -- FIFO full flag is not asserted immediately when a block completes if tready = '0' as this would stall the
    -- data pipeline. Another block can be processed and the stat value for the first channel written to the FIFO.
    -- If the previous block's stat values have not been read from the FIFO by this point then the full flag will
    -- be asserted and the core output data pipeline will be stalled.
    axi_stat_fifo : glb_ifx_master
    generic map(
      WIDTH         => m_axis_stat_fifo_width,
      DEPTH         => m_axis_stat_fifo_depth,
      AFULL_THRESH1 => 0,
      AFULL_THRESH0 => 0 )
    port map(
      aclk      => aclk,
      aclken    => aclken_int,
      areset    => sr_reg, -- sampled active high sync reset
      wr_enable => stat_out_rdy,
      wr_data   => m_axis_stat_fifo_in,
      ifx_valid => m_axis_stat_tvalid_tmp,
      ifx_ready => m_axis_stat_tready,
      ifx_data  => m_axis_stat_fifo_out,
      not_full  => stat_fifo_has_room,
      full      => axi_stat_fifo_full);

    -- Generate m_axis_stat_tlast signal by passing last_stat_out through the
    -- AXI stat FIFO on the MSB of the FIFO data bus.
    -- tlast is high when stat information for last channel is on <m_axis_stat_tdata>
    m_axis_stat_fifo_in(m_axis_stat_fifo_width-1) <= last_stat_out;
    m_axis_stat_tlast_tmp <= m_axis_stat_fifo_out(m_axis_stat_fifo_width-1);

    -- Drive FIFO data input
    -- Include standard error flags and err_cnt
    m_axis_stat_fifo_in(0) <= fail;
    m_axis_stat_fifo_in(1) <= err_found;
    m_axis_stat_fifo_in(err_cnt_width+1 downto 2) <= err_cnt;


    -- Include optional erase_cnt field
    ecg1: if erase_or_puncture generate
    begin
      m_axis_stat_fifo_in(erase_cnt_msb_index downto erase_cnt_lsb_index) <= erase_cnt;
    end generate; -- ecg1


    -- Include optional bit_err field
    esg1: if C_HAS_ERR_STATS /= 0 generate
      constant err_stats_lsb_index : integer :=
        select_val_b(erase_cnt_lsb_index, erase_cnt_msb_index+1, erase_or_puncture);
    begin
      m_axis_stat_fifo_in(bit_err_width-1+err_stats_lsb_index downto err_stats_lsb_index) <= bit_err_0_to_1;
      m_axis_stat_fifo_in((2*bit_err_width)-1+err_stats_lsb_index downto
                            bit_err_width+err_stats_lsb_index) <= bit_err_1_to_0;
    end generate; -- esg1

    -- Generate <nc_samples_avail> signal. This flags that the input FIFO is
    -- holding at least C_NUM_CHANNELS samples.
    -- FIFO address goes from -1 to 0 after first sample is written, hence address will equal
    -- C_NUM_CHANNELS-1 when C_NUM_CHANNELS samples have been taken. Look for address equal to
    -- C_NUM_CHANNELS-2 and a write, or address > C_NUM_CHANNELS-2
    -- The register is NOT clock enabled because <input_fifo_wr_en> and <input_fifo_add> can
    -- change when clock enable is low.
    nc_avail_process : process(aclk)
      constant num_channels_m2 : signed(input_fifo_add'range) := to_signed(C_NUM_CHANNELS-2, input_fifo_add'length);
      constant num_channels_m1 : signed(input_fifo_add'range) := to_signed(C_NUM_CHANNELS-1, input_fifo_add'length);
    begin
      if rising_edge(aclk) then
        if sr_reg = '1' then
          nc_samples_avail <= '0';

        else
--          nc_samples_avail <= GLB_to_std_logic(((input_fifo_add = num_channels_m2) and input_fifo_wr_en='1') or
--                                                (input_fifo_add > num_channels_m2));
          nc_samples_avail <= GLB_to_std_logic(
            ((input_fifo_add = num_channels_m1) and (input_fifo_wr_en='1' or input_fifo_rd_en='0')) or
            (input_fifo_add > num_channels_m1));

        end if; -- sr_reg = '1'
      end if; -- rising_edge(aclk)

    end process; -- axi_status_process



  end generate; -- sfg2




  ------------------------------------------------------------------------------
  -- Object: dec
  -- Instantiate the main decoder entity, <rs_decoder_main>
  dec: rs_decoder_main
  generic map(
    C_HAS_ACLKEN                  => C_HAS_ACLKEN,
    C_HAS_ARESETN                 => C_HAS_ARESETN,
    C_NUM_PUNC_PATTERNS           => C_NUM_PUNC_PATTERNS,
    C_PUNCTURE_SELECT_FILE        => C_PUNCTURE_SELECT_FILE,
    C_PUNCTURE_VECTOR_FILE        => C_PUNCTURE_VECTOR_FILE,
    C_NUM_CHANNELS                => C_NUM_CHANNELS,
    C_GEN_START                   => C_GEN_START,
    C_H                           => C_H,
    C_K                           => C_K,
    C_N                           => C_N,
    C_POLYNOMIAL                  => C_POLYNOMIAL,
    C_SYMBOL_WIDTH                => C_SYMBOL_WIDTH,
    C_PUNC_SEL_WIDTH              => punc_sel_width,
    C_HAS_MARKER_BITS             => C_HAS_S_AXIS_INPUT_TUSER,
    C_NUM_MARKER_BITS             => C_S_AXIS_INPUT_TUSER_WIDTH,
    C_EVALUATION                  => C_EVALUATION, -- 0=>bought, 1=>eval
    C_HAS_ERASE                   => C_HAS_ERASE,
    C_HAS_ERR_STATS               => C_HAS_ERR_STATS,
    C_HAS_DATA_DEL                => C_HAS_DATA_DEL,
    C_HAS_INFO                    => C_HAS_INFO,
    C_HAS_N_IN                    => C_HAS_N_IN,
    C_HAS_R_IN                    => C_HAS_R_IN,
    C_IGNORE_ILLEGAL_N_R          => C_IGNORE_ILLEGAL_N_R,
    C_R_WIDTH                     => r_in_width,
    C_DEFINE_LEGAL_R_VALS         => C_DEFINE_LEGAL_R_VALS,
    C_NUM_LEGAL_R_VALUES          => C_NUM_LEGAL_R_VALUES,
    C_LEGAL_R_VECTOR_FILE         => C_LEGAL_R_VECTOR_FILE,
    C_OUTPUT_CHECK_SYMBOLS        => C_OUTPUT_CHECK_SYMBOLS,
    C_CLKS_PER_SYM                => 1, -- obsolete parameter, no longer supported
    C_SPEC                        => C_SPEC,
    C_MEMSTYLE                    => C_MEMSTYLE,
    C_MEM_INIT_PREFIX             => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR             => C_ELABORATION_DIR,
    C_XDEVICEFAMILY               => C_XDEVICEFAMILY,
    C_FAMILY                      => C_FAMILY,
    C_OPTIMISATION                => C_OPTIMISATION,
    C_SELF_RECOVERING             => C_SELF_RECOVERING)
  port map (
    aclk                           => aclk,
    aclken                         => aclken_int,
    aresetn                        => aresetn_int,
    ctrl_fifo_not_empty            => ctrl_fifo_not_empty,
    input_tvalid                   => input_tvalid,
    input_tlast                    => input_tlast,
    nc_samples_avail               => nc_samples_avail,
    data_in                        => data_in,
    mark_in                        => mark_in,
    n_in                           => n_in,
    r_in                           => r_in,
    erase                          => erase,
    punc_sel                       => punc_sel,
    output_fifo_has_room           => output_fifo_has_room,
    stat_fifo_has_room             => stat_fifo_has_room,
    ctrl_fifo_rd_en                => ctrl_fifo_rd_en,
    input_tready                   => input_tready,
    slow_ce_out                    => slow_ce,
    sr_reg_out                     => sr_reg,
    bit_err_0_to_1                 => bit_err_0_to_1,
    bit_err_1_to_0                 => bit_err_1_to_0,
    data_out                       => data_out,
    mark_out                       => mark_out,
    data_del                       => data_del,
    info_out                       => info,
    last_data_out                  => last_data_out,
    last_stat_out                  => last_stat_out,
    erase_cnt                      => erase_cnt,
    err_found                      => err_found,
    err_cnt                        => err_cnt,
    fail                           => fail,
    data_out_rdy                   => data_out_rdy,
    stat_out_rdy                   => stat_out_rdy,
    event_s_input_tlast_missing    => event_s_input_tlast_missing,
    event_s_input_tlast_unexpected => event_s_input_tlast_unexpected,
    event_s_ctrl_tdata_invalid     => event_s_ctrl_tdata_invalid
    );

end synth;






-------------------------------------------------------------------------------
--  (c) Copyright 2002-2011 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_decoder_v9_0_12/hdl/rs_decoder_v9_0_12_viv.vhd,v 1.4 2011/05/25 10:24:14 billw Exp $
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header

-- Object: rs_decoder_v9_0_12_viv
-- This is the top level XST ENTITY for the Xilinx parameterizable Reed-Solomon
-- decoder Logicore. This includes the licensing code.
--
--
--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Group: AXI channel parameters
--        ----------------------
-- Parameter: C_HAS_ACLKEN
--  Set to 1 if core has an <aclken> port, else 0
--
-- Parameter: C_HAS_ARESETN
--  Set to 1 if core has an <aresetn> port, else 0
--
-- Parameter: C_HAS_S_AXIS_CTRL
--  Set to 1 if core has an AXI S_AXIS_CTRL channel, else 0
--  This should only be set to 1 if <C_HAS_N_IN> = 1, <C_HAS_R_IN> = 1 or <C_NUM_PUNC_PATTERNS> is greater than 0.
--
-- Parameter: C_HAS_S_AXIS_INPUT_TUSER
--  Set to 1 if core has an <s_axis_input_tuser> port, else 0
--
-- Parameter: C_HAS_M_AXIS_OUTPUT_TUSER
--   Set to 1 if core has an <m_axis_output_tuser> port, else 0. Should be set to the same value
--   as <C_HAS_S_AXIS_INPUT_TUSER>
--
-- Parameter: C_S_AXIS_INPUT_TDATA_WIDTH
--  Width of <s_axis_input_tdata> port. Must be a multiple of 8.
--
-- Parameter: C_S_AXIS_INPUT_TUSER_WIDTH
--  Width of <s_axis_input_tuser> port
--
-- Parameter: C_S_AXIS_CTRL_TDATA_WIDTH
--  Width of <s_axis_ctrl_tdata> port. Must be a multiple of 8.
--
-- Parameter: C_M_AXIS_OUTPUT_TDATA_WIDTH
--  Width of <m_axis_output_tdata> port. Must be a multiple of 8.
--
-- Parameter: C_M_AXIS_OUTPUT_TUSER_WIDTH
--  Width of <m_axis_output_tuser> port
--
-- Parameter: C_M_AXIS_STAT_TDATA_WIDTH
--  Width of <m_axis_stat_tdata> port. Must be a multiple of 8.
--
--
-- Group: AXI channel sub-field parameters
--        --------------------------------
-- Parameter: C_HAS_DATA_DEL
--  Optional output field in <m_axis_output_tdata> provides a version of the input data
--  with no FEC applied, with the same latency as corrected data stream.
--
-- Parameter: C_HAS_ERASE
--  Set to 1 if erasure decoding is required. The optional 'ERASE' input bit in <s_axis_input_tdata>
--  is then used to flag symbols which are known to be erased.
--
-- Parameter: C_HAS_ERR_STATS
--  Set to 1 if BIT_ERR_0_TO_1 and BIT_ERR_1_TO_0 fields are to be included in <m_axis_stat_tdata>.
--  These fields require additional logic.
--
-- Parameter: C_HAS_INFO
--  Set to 1 if <m_axis_output_tdata> is to include a bit to flag when output symbols are information
--  data or check symbols.
--
-- Parameter: C_HAS_N_IN
--  Set to 1 to allow code block length, N, to be varied for each new block. Makes core a lot bigger.
--  Determines whether <s_axis_ctrl_tdata> will have an N_IN field or not.
--
-- Parameter: C_HAS_R_IN
--  Set to 1 to allow number of check symbols, R, to be varied for each new block. Makes core a bit bigger
--  than <C_HAS_N_IN> alone. Variable R mode has same timing as variable N.
--  Determines whether <s_axis_ctrl_tdata> will have an R_IN field or not.
--
--
-- Group: Reed-Solomon code word parameters
--        ---------------------------------
-- Parameter: C_GEN_START
--  Start index for generator polynomial (see datasheet)
--
-- Parameter: C_H
--  The h parameter for the generator polynomial (see datasheet)
--
-- Parameter: C_K
--  Number of data symbols in a code block. If <C_HAS_N_IN> = 1 this should be set to <C_N> minus the number of
--  check symbols. If <C_HAS_R_IN> = 1, <C_K> should be set such that C_N-C_K equals the largest number of check
--  symbols to be supported.
--
-- Parameter: C_N
--  Total number of symbols (data + check) in a code block. If <C_HAS_N_IN> = 1, this should be set to
--  (2^C_SYMBOL_WIDTH)-1
--
-- Parameter: C_POLYNOMIAL
--  Galois Field polynomial. See <gf_pkg> for more information on this.
--  Supplying a value of 0 will cause the default polynomial for the given symbol width to be selected.
--
-- Parameter: C_SPEC
--  Specification code, used if a predefined code specification is being used that requires special processing.
--  See <gf_pkg> for details of the supported values. Determines whether CCSDS dual-basis ROMs are required.
--  For standard Reed-Solomon codes, this should be set to 0.
--
-- Parameter: C_SYMBOL_WIDTH
--  Galois field symbol size in bits. This is the bus width of the data to be decoded. It must equal the width
--  of the Galois field elements.
--
--
-- Group: Implementation parameters
--        -------------------------
--
-- Parameter: C_IGNORE_ILLEGAL_N_R
--  If set to 1, the core will check sampled N and R values are within the absolute limits.
--  If they are outside these limits then the incoming code block will be ignored. Extra logic is required
--  to perform this check so this parameter should be set to 0 if it is known that N and R will always be legal.
--  If an illegal value is sampled, and the parameter is not set, then the core behavior is not defined and it
--  may have to be reset.
--  The core does not check that the resulting values of N and R are compatible.
--  e.g. N < R, will not be detected if both N and R are inside their absolute limits.
--
-- Parameter: C_DEFINE_LEGAL_R_VALS
--  Normally 0, set to 1 if <C_LEGAL_R_VECTOR_FILE> is to be used.
--
-- Parameter: C_NUM_LEGAL_R_VALUES
--  Number of values in <C_LEGAL_R_VECTOR_FILE>
--
-- Parameter: C_LEGAL_R_VECTOR_FILE
--  Optional file to define which R values are legal when <C_HAS_R_IN> = 1.
--  If it is known that some R values will never be required then some logic can be removed in the Chien unit.
--
-- Parameter: C_NUM_CHANNELS
--  Input data from multiple channels can be interlaced in the DATA_IN field of <s_axis_input_tdata>.
--  e.g. if there are 3 channels (A,B,C), data is input in the following order:
--  A0,B0,C0,A1,B1,C1,etc. If <C_HAS_N_IN> = 1 or <C_HAS_R_IN> = 1 then <C_NUM_CHANNELS> must equal 1.
--
-- Parameter: C_NUM_PUNC_PATTERNS
--  Defines number of different puncture patters that PUNC_SEL will select between. PUNC_SEL is a field
--  in <s_axis_ctrl_tdata>.
--  Set to 0 for no puncturing. If set to 0 or 1 then PUNC_SEL input field is not required.
--
-- Parameter: C_PUNCTURE_SELECT_FILE
--  File name of a file containing a list of how many symbols are punctured for each PUNC_SEL value.
--
-- Parameter: C_PUNCTURE_VECTOR_FILE
--  File name of a file containing the actual symbols to be punctured for each PUNC_SEL value.
--
-- Parameter: C_MEMSTYLE
--  Tell core whether to use block or distributed memory, or let it decide itself, based on size.
--  - dist_mem  (0) => Do not use any block memories
--  - block_mem (1) => Use block memories wherever possible
--  - auto_mem  (2) => Allow core to choose memory styles
--
-- Parameter: C_OUTPUT_CHECK_SYMBOLS
--  Set to 0 to output full block on N symbols. Set to 0 to only output K information symbols.
--  The check symbols are still processed to generate the error statistics; however only the K
--  information symbols will be output and <m_axis_output_tlast> will be asserted when the Kth
--  symbol is being output.
--  If this parameter equals 1 then <info_end> is redundant.
--
-- Parameter: C_OPTIMISATION
--  Indicates the optimization requirement: 0 for area, 1 for speed
--
-- Parameter: C_SELF_RECOVERING
--  Insert extra logic to detect if BMA state machine enters an illegal state and synchronously reset
--  the entire core.
--
--
-- Group: Generation parameters
--        ---------------------
-- Parameter: C_MEM_INIT_PREFIX
--  A string which is prepended to internally generated .mif file names. This prevents
--  problems if multiple cores are being generated simultaneously, as each one can use a
--  different string and the .mif file names will not clash.
--
-- Parameter: C_ELABORATION_DIR
-- Coregen provides the path to the elaboration directory. This is prepended to file names.
--
-- Parameter: C_XDEVICEFAMILY
--  Indicates the FPGA sub-family. Set to legal string, as defined by Coregen. 
--
-- Parameter: C_FAMILY
--  Indicates the FPGA family. Set to legal string, as defined by Coregen. 
--                   
--
--------------------------------------------------------------------------------
-- The following ports are provided:
--
-- Group: Ports
--        -----
-- Port: aclk
--  Single global clock. The core is a completely synchronous design and only the rising edge is used. All
--  inputs must be synchronous to the aclk input.
--
-- Port: aclken
--  The clock enable input is an optional pin, controlled by <C_HAS_ACLKEN>. It is recommended to use the core
--  without this input if possible.
--
-- Port: aresetn
--  The active low synchronous reset input is an optional pin, controlled by <C_HAS_ARESETN>.
--  aresetn is registered inside the core so the actual reset takes place on the clock cycle after
--  aresetn is sampled low. It is possible to reset the core with a single clock cycle pulse; however
--  to maintain AXI compliance, aresetn must be asserted (low) for at least two clock cycles. This means
--  any valid input data immediately after aresetn is de-asserted will not be ignored.
--  It is recommended to use the core without this input if possible, as it will increase the area and
--  possibly slow the core down due to routing congestion.
--
-- Port: s_axis_input_tdata
--  Input data bus, composed of the following parts: [PAD][ERASE][PAD][DATA_IN]
--  - DATA_IN: <C_SYMBOL_WIDTH> width bus for incoming symbols to be decoded
--  - ERASE: Optional bit, controlled by <C_HAS_ERASE>. Used to flag symbols which have been erased.
--           i.e. Symbols which the receiver decides are likely to contain errors.
--  - PAD: Ignored inputs, added to pad fields to a multiple of 8 bits
--
-- Port: s_axis_input_tuser
--  Optional input, controlled by <C_HAS_S_AXIS_INPUT_TUSER>. This is used to pass information through the
--  core with the same latency as DATA_IN. This could be marker bits to identify certain input symbols.
--  Symbols input on this port are output on <m_axis_output_tuser>.
--
-- Port: s_axis_input_tvalid
--  Input, signalling valid data on <s_axis_input_tdata>
--
-- Port: s_axis_input_tlast
--  Input, signalling the last symbol of the last channel is on <s_axis_input_tdata>. Not used by core
--  except to check against its own internal symbol count. Event flags are asserted if a discrepency
--  is detected.
--
-- Port: s_axis_input_tready
--  Output, signalling core is ready to sample data on <s_axis_input_tdata>. <s_axis_input_tvalid> is
--  ignored if this output is low.
--
-- Port: s_axis_ctrl_tdata
--  Optional input control bus, controlled by <C_HAS_S_AXIS_CTRL>. It is composed of the following parts
--  [PAD][PUNC_SEL][PAD][R_IN][PAD][N_IN]
--  - N_IN: Optional field, controlled by <C_HAS_N_IN>. Allows a new value of N to be sampled at start of
--          each new block. Limits for variable N decoder, 5 <= N_IN <= 2^C_SYMBOL_WIDTH-1
--  - R_IN: Optional field, controlled by <C_HAS_R_IN>. Allows a new value of r (=N-K) to be sampled at
--          start of each new block.
--  - PUNC_SEL: Optional field, controlled by <C_NUM_PUNC_PATTERNS>. This selects which predefined puncture
--              pattern to use.
--  - PAD: Ignored inputs, added to pad fields to a multiple of 8 bits
--
-- Port: s_axis_ctrl_tvalid
--  Input, signalling valid data on <s_axis_ctrl_tdata>
--
-- Port: s_axis_ctrl_tready
--  Output, signalling core is ready to sample data on <s_axis_ctrl_tdata>.
--
-- Port: m_axis_output_tdata
--  Output data bus, composed of the following parts [PAD][INFO][PAD][DATA_DEL][PAD][DATA_OUT]
--  - DATA_OUT: <C_SYMBOL_WIDTH> bus for output of decoded symbols
--  - DATA_DEL: Optional field, controlled by <C_HAS_DATA_DEL>. This is DATA_OUT with no error correction
--              applied.
--  - INFO: Optional output bit, controlled by <C_HAS_INFO>. INFO is high when information data is on
--          DATA_OUT and low when check symbols are on DATA_OUT
--  - PAD: Zeroes, added to pad fields to a multiple of 8 bits
--
-- Port: m_axis_output_tuser
--  Optional output, controlled by <C_HAS_M_AXIS_OUTPUT_TUSER>. This is <s_axis_input_tuser>, delayed by
--  the latency of the core.
-- 
-- Port: m_axis_output_tvalid
--  Output, signalling there is valid data on <m_axis_output_tdata>
--
-- Port: m_axis_output_tready
--  Input, signalling the downstream block is ready to sample <m_axis_output_tdata>. This permits the
--  core to output the next sample if it has one. If <m_axis_output_tvalid> is high and <m_axis_output_tready>
--  is low then the core has to stop outputting data and some internal processing will be stalled.
--  Once all buffers are full the input will be stalled and <s_axis_input_tready> will be de-asserted.
--
-- Port: m_axis_output_tlast
--  Output, signalling that the last symbol of a code block is on <m_axis_output_tdata>. In the
--  multi-channel case <m_axis_output_tlast> is asserted when the last symbol of the last channel
--  is being output.
-- 
-- Port: m_axis_stat_tdata
--  Output status bus. It is composed of the following parts
--  [PAD][BIT_ERR_1_TO_0][BIT_ERR_0_TO_1][ERASE_CNT][ERR_CNT][ERR_FOUND][FAIL]
--  - FAIL: Set high if the core determines that it failed to correct the code block due to too many errors.
--  - ERR_FOUND: Set high if the core detected at least one error in the code block just received.
--  - ERR_CNT: Set to the number of symbols the decoder detected as erroneous in the code block just received.
--  - ERASE_CNT: Set to the number of erasures flagged in the block just received.
--  - BIT_ERR_0_TO_1: Optional field, controlled by <C_HAS_ERR_STATS>. Set to the number of bits that
--                    were corrected from 1 to 0 in the block just received. This field is not present if
--                    <C_HAS_ERR_STATS> = 0. The width of this field is equal to the number of bits needed to
--                    represent ((<C_N>-<C_K>) * <C_SYMBOL_WIDTH>).
--  - BIT_ERR_1_TO_0: Optional field, controlled by <C_HAS_ERR_STATS>. Set to the number of bits that
--                    were corrected from 0 to 1 in the block just received. This field is not present if
--                    <C_HAS_ERR_STATS> = 0. The width of this field is equal to the number of bits needed to
--                    represent ((<C_N>-<C_K>) * <C_SYMBOL_WIDTH>).
--  - PAD: Zeroes, added to pad port to a multiple of 8 bits
--
-- Port: m_axis_stat_tvalid
--  Output, signalling there is valid data on <m_axis_stat_tvalid>. This will be asserted as soon as
--  possible after the block has been decoded, usually coincident with the last symbol of a block being
--  output on <m_axis_output_tdata>.
--
-- Port: m_axis_stat_tlast
--  Output, present if <C_NUM_CHANNELS> > 1. Signals that the status info for the last channel is
--  on <m_axis_stat_tdata>.
--
-- Port: m_axis_stat_tready
--  Input, signalling the downstream block is ready to sample <m_axis_stat_tdata>. This permits the
--  core to output the next sample if it has one. If <m_axis_stat_tdata> has not been consumed and
--  a new value is ready to be output then the core will stall and not be ready to accept new samples
--  on <s_axis_input_tdata>.
--
-- Port: event_s_input_tlast_missing
--  Output, signalling the <s_axis_input_tlast> was not asserted when it was expected. Users should
--  not connect anything to this if they don't need it and the logic will be optimized away.
--
-- Port: event_s_input_tlast_unexpected
--  Output, signalling the <s_axis_input_tlast> was asserted when it was not expected. Users should
--  not connect anything to this if they don't need it and the logic will be optimized away.
--
-- Port: event_s_ctrl_tdata_invalid
--  Output, signalling that an invalid ctrl channel value was sampled
--  Core only checks against absolute limits, so it is possible to sample invalid values without
--  them being detected.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_consts.all;
use rs_decoder_v9_0_12.dec_pkg.all;
use rs_decoder_v9_0_12.dec_comps_pkg.all;


entity rs_decoder_v9_0_12_viv is
generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := c_has_aclken_default;                   
  C_HAS_ARESETN                : integer := c_has_aresetn_default;                  
  C_HAS_S_AXIS_CTRL            : integer := c_has_s_axis_ctrl_default;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := c_has_s_axis_input_tuser_default;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := c_has_m_axis_output_tuser_default;       
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := c_s_axis_input_tdata_width_default;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := c_s_axis_input_tuser_width_default;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := c_s_axis_ctrl_tdata_width_default;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := c_m_axis_output_tdata_width_default;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := c_m_axis_output_tuser_width_default;    
  C_M_AXIS_STAT_TDATA_WIDTH    : integer := c_m_axis_stat_tdata_width_default;   
    
  -- AXI channel sub-field parameters
  C_HAS_DATA_DEL               : integer := c_has_data_del_default;
  C_HAS_ERASE                  : integer := c_has_erase_default;
  C_HAS_ERR_STATS              : integer := c_has_err_stats_default; 
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
  C_IGNORE_ILLEGAL_N_R         : integer := c_ignore_illegal_n_r_default;
  C_DEFINE_LEGAL_R_VALS        : integer := c_define_legal_r_vals_default;
  C_NUM_LEGAL_R_VALUES         : integer := c_num_legal_r_values_default;
  C_LEGAL_R_VECTOR_FILE        : string  := c_legal_r_vector_file_default;
  C_NUM_CHANNELS               : integer := c_num_channels_default;
  C_NUM_PUNC_PATTERNS          : integer := c_num_punc_patterns_default;
  C_PUNCTURE_SELECT_FILE       : string  := c_puncture_select_file_default;
  C_PUNCTURE_VECTOR_FILE       : string  := c_puncture_vector_file_default;
  C_MEMSTYLE                   : integer := c_memstyle_default;
  C_OUTPUT_CHECK_SYMBOLS       : integer := c_output_check_symbols_default;
  C_OPTIMISATION               : integer := c_optimisation_default;
  C_SELF_RECOVERING            : integer := c_self_recovering_default;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string  := c_mem_init_prefix_default;
  C_ELABORATION_DIR            : string  := c_elaboration_dir_default;
  C_XDEVICEFAMILY              : string  := c_default_xdevicefamily;
  C_FAMILY                     : string  := c_default_family
);
port (
  aclk                           : in  std_logic;                                                                 
  aclken                         : in  std_logic := '1';                                                          
  aresetn                        : in  std_logic := '1';                                                          
  
  s_axis_input_tdata             : in  std_logic_vector(C_S_AXIS_INPUT_TDATA_WIDTH-1 downto 0) := (others=>'0');                   
  s_axis_input_tuser             : in  std_logic_vector(C_S_AXIS_INPUT_TUSER_WIDTH-1 downto 0) := (others=>'0'); 
  s_axis_input_tvalid            : in  std_logic;                                                                 
  s_axis_input_tlast             : in  std_logic;                                                                 
  s_axis_input_tready            : out std_logic;                                                                 
    
  s_axis_ctrl_tdata              : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid             : in  std_logic := '0';                                                
  s_axis_ctrl_tready             : out std_logic;                                                                 
  
  m_axis_output_tdata            : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser            : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid           : out std_logic;                                                                 
  m_axis_output_tready           : in  std_logic := '1';                                                          
  m_axis_output_tlast            : out std_logic;                                                                 

  m_axis_stat_tdata              : out std_logic_vector(C_M_AXIS_STAT_TDATA_WIDTH-1 downto 0);                  
  m_axis_stat_tvalid             : out std_logic;                                                                 
  m_axis_stat_tlast              : out std_logic;                                                                 
  m_axis_stat_tready             : in  std_logic := '1';
  
  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
 
);

  
  attribute secure_netname                     : string;
  attribute secure_netname of rs_decoder_v9_0_12_viv : entity is "obfuscate";

  attribute check_license : string;
  attribute check_license of rs_decoder_v9_0_12_viv : entity is "rs_decoder@2013.03";

  --xlpp license_switch rs_decoder@2013.03 begin

    ---- This core doesn't have a simulation license option - just include as a
    ---- placeholder.
    --xlpp simulation_license begin
      ----SECURE_FLOW (Secure bitstream flow)
      ----ngdbuild generates NGD file. bitgen fails to generate bit stream and
      ----outputs the following error message: 
      ----ERROR:Bitgen:169 - This design contains one or more evaluation cores
      ----for which bitstream generation is not supported.
      attribute secure_bitstream : string;
      attribute secure_bitstream of rs_decoder_v9_0_12_viv : entity is "prohibit";
      ----SECURE_FLOW (Secure fpga_editor flow)
      ----fpga_editor prevents 'opening' of components, displaying the following
      ----error message: 
      ----ERROR:FPGAEditor:196 - Component <name> is protected. 
      ----Components' configuration strings are encrypted in the output from
      ----ncdread.
      attribute secure_config : string;
      attribute secure_config of rs_decoder_v9_0_12_viv : entity is "protect";
      ---- this line is required to make netlists encrypted.
      attribute secure_netlist : string;
      attribute secure_netlist of rs_decoder_v9_0_12_viv : entity is "encrypt";
      attribute secure_extras : string;
      attribute secure_extras of rs_decoder_v9_0_12_viv : entity is "A";
      ---- prevent pins being added or deleted in fpga editor
      attribute secure_net_editing : string;
      attribute secure_net_editing of rs_decoder_v9_0_12_viv : entity is "prohibit";
    -- xlpp simulation_license end

    
    -- xlpp eval_license begin 
      ----SECURE_FLOW (Secure fpga_editor flow)
      ----fpga_editor prevents 'opening' of components, displaying the following
      ----error message: 
      ----ERROR:FPGAEditor:196 - Component <name> is protected. 
      ---- Allow bitstream generation
      --attribute secure_bitstream : string;
      --attribute secure_bitstream of rs_decoder_v9_0_12_viv : entity is "off";
      ----components' configuration strings are encrypted in the output from
      ----ncdread.
      --attribute secure_config : string;
      --attribute secure_config of rs_decoder_v9_0_12_viv : entity is "protect";
      ---- this line is required to make netlists encrypted.
      --attribute secure_netlist : string;
      --attribute secure_netlist of rs_decoder_v9_0_12_viv : entity is "encrypt";
      --attribute secure_extras : string;
      --attribute secure_extras of rs_decoder_v9_0_12_viv : entity is "A";
      ---- prevent pins being added or deleted in fpga editor
      --attribute secure_net_editing : string;
      --attribute secure_net_editing of rs_decoder_v9_0_12_viv : entity is "prohibit";
    -- xlpp eval_license end 

    
    -- xlpp bought_license begin 
      ----SECURE_FLOW (Secure fpga_editor flow)
      ----fpga_editor prevents 'opening' of components, displaying the following
      ---- error message: 
      ----ERROR:FPGAEditor:196 - Component <name> is protected. 
      ---- Allow bitstream generation
      --attribute secure_bitstream : string;
      --attribute secure_bitstream of rs_decoder_v9_0_12_viv : entity is "off";
      ----components' configuration strings are encrypted in the output from
      ----ncdread.
      --attribute secure_config : string;
      --attribute secure_config of rs_decoder_v9_0_12_viv : entity is "protect";    
      ---- this line is required to make netlists encrypted.
      --attribute secure_netlist : string;
      --attribute secure_netlist of rs_decoder_v9_0_12_viv : entity is "encrypt";
      --attribute secure_extras : string;
      --attribute secure_extras of rs_decoder_v9_0_12_viv : entity is "A";
      ---- prevent pins being added or deleted in fpga editor
      --attribute secure_net_editing : string;
      --attribute secure_net_editing of rs_decoder_v9_0_12_viv : entity is "off";
    -- xlpp bought_license end 

  -- xlpp license_switch end  
  
  
end rs_decoder_v9_0_12_viv;



--------------------------------------------------------------------------------
architecture synth of rs_decoder_v9_0_12_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Group: architecture
  
  ------------------------------------------------------------------------------
  -- Group: constants
  
  -- boolean: c_is_eval
  -- Used to control instantiation of hardware timeout circuit.
  -- At run time XLPP will change true to false if a "bought" or "source"
  -- license is found.
  -- xlpp eval_constant rs_decoder@2013.03 begin
     constant c_is_eval : boolean := true;
  -- xlpp eval_constant end
   

  -- boolean: do_check_generics
  -- Set to true if generics are legal, otherwise the check_generics() function
  -- will cause a failure assertion.
  constant do_check_generics : boolean :=
    check_generics(
      C_HAS_ACLKEN                => C_HAS_ACLKEN,
      C_HAS_ARESETN               => C_HAS_ARESETN,
      C_HAS_S_AXIS_CTRL           => C_HAS_S_AXIS_CTRL,
      C_HAS_S_AXIS_INPUT_TUSER    => C_HAS_S_AXIS_INPUT_TUSER,
      C_HAS_M_AXIS_OUTPUT_TUSER   => C_HAS_M_AXIS_OUTPUT_TUSER,
      C_S_AXIS_INPUT_TDATA_WIDTH  => C_S_AXIS_INPUT_TDATA_WIDTH,
      C_S_AXIS_INPUT_TUSER_WIDTH  => C_S_AXIS_INPUT_TUSER_WIDTH,
      C_S_AXIS_CTRL_TDATA_WIDTH   => C_S_AXIS_CTRL_TDATA_WIDTH,
      C_M_AXIS_OUTPUT_TDATA_WIDTH => C_M_AXIS_OUTPUT_TDATA_WIDTH,
      C_M_AXIS_OUTPUT_TUSER_WIDTH => C_M_AXIS_OUTPUT_TUSER_WIDTH,
      C_M_AXIS_STAT_TDATA_WIDTH   => C_M_AXIS_STAT_TDATA_WIDTH,
      C_HAS_DATA_DEL              => C_HAS_DATA_DEL,
      C_HAS_ERASE                 => C_HAS_ERASE,
      C_HAS_ERR_STATS             => C_HAS_ERR_STATS,
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
      C_IGNORE_ILLEGAL_N_R        => C_IGNORE_ILLEGAL_N_R,
      C_DEFINE_LEGAL_R_VALS       => C_DEFINE_LEGAL_R_VALS,
      C_NUM_LEGAL_R_VALUES        => C_NUM_LEGAL_R_VALUES,
      C_LEGAL_R_VECTOR_FILE       => C_LEGAL_R_VECTOR_FILE,
      C_NUM_CHANNELS              => C_NUM_CHANNELS,
      C_NUM_PUNC_PATTERNS         => C_NUM_PUNC_PATTERNS,
      C_PUNCTURE_SELECT_FILE      => C_PUNCTURE_SELECT_FILE,
      C_PUNCTURE_VECTOR_FILE      => C_PUNCTURE_VECTOR_FILE,
      C_MEMSTYLE                  => C_MEMSTYLE,
      C_OUTPUT_CHECK_SYMBOLS      => C_OUTPUT_CHECK_SYMBOLS,
      C_OPTIMISATION              => C_OPTIMISATION,
      C_SELF_RECOVERING           => C_SELF_RECOVERING,
      C_MEM_INIT_PREFIX           => C_MEM_INIT_PREFIX,
      C_ELABORATION_DIR           => C_ELABORATION_DIR,
      C_XDEVICEFAMILY             => C_XDEVICEFAMILY,
      C_FAMILY                    => C_FAMILY );
    
    
begin

  -- Group: architecture body
  
  ------------------------------------------------------------------------------
  -- Object: d1
  -- This is the decoder AXI wrapper, <rs_decoder_axi_wrapper>.
  -- This extracts signals from the AXI slave channels and combines signals
  -- to form the AXI master channels.
  d1: rs_decoder_axi_wrapper
  generic map(
    C_HAS_ACLKEN                  => C_HAS_ACLKEN,
    C_HAS_ARESETN                 => C_HAS_ARESETN,
    C_HAS_S_AXIS_CTRL             => C_HAS_S_AXIS_CTRL,
    C_HAS_S_AXIS_INPUT_TUSER      => C_HAS_S_AXIS_INPUT_TUSER,
    C_HAS_M_AXIS_OUTPUT_TUSER     => C_HAS_M_AXIS_OUTPUT_TUSER,
    C_S_AXIS_INPUT_TDATA_WIDTH    => C_S_AXIS_INPUT_TDATA_WIDTH,
    C_S_AXIS_INPUT_TUSER_WIDTH    => C_S_AXIS_INPUT_TUSER_WIDTH,
    C_S_AXIS_CTRL_TDATA_WIDTH     => C_S_AXIS_CTRL_TDATA_WIDTH,
    C_M_AXIS_OUTPUT_TDATA_WIDTH   => C_M_AXIS_OUTPUT_TDATA_WIDTH,
    C_M_AXIS_OUTPUT_TUSER_WIDTH   => C_M_AXIS_OUTPUT_TUSER_WIDTH,
    C_M_AXIS_STAT_TDATA_WIDTH     => C_M_AXIS_STAT_TDATA_WIDTH,
    C_HAS_DATA_DEL                => C_HAS_DATA_DEL,   
    C_HAS_ERASE                   => C_HAS_ERASE,   
    C_HAS_ERR_STATS               => C_HAS_ERR_STATS,   
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
    C_IGNORE_ILLEGAL_N_R          => C_IGNORE_ILLEGAL_N_R,   
    C_DEFINE_LEGAL_R_VALS         => C_DEFINE_LEGAL_R_VALS,
    C_NUM_LEGAL_R_VALUES          => C_NUM_LEGAL_R_VALUES,
    C_LEGAL_R_VECTOR_FILE         => C_LEGAL_R_VECTOR_FILE,
    C_NUM_CHANNELS                => C_NUM_CHANNELS,       
    C_NUM_PUNC_PATTERNS           => C_NUM_PUNC_PATTERNS,
    C_PUNCTURE_SELECT_FILE        => C_PUNCTURE_SELECT_FILE,
    C_PUNCTURE_VECTOR_FILE        => C_PUNCTURE_VECTOR_FILE,
    C_MEMSTYLE                    => C_MEMSTYLE,
    C_OUTPUT_CHECK_SYMBOLS        => C_OUTPUT_CHECK_SYMBOLS,
    C_OPTIMISATION                => C_OPTIMISATION,
    C_SELF_RECOVERING             => C_SELF_RECOVERING,
    C_MEM_INIT_PREFIX             => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR             => C_ELABORATION_DIR,
    C_EVALUATION                  => boolean'pos(c_is_eval),
    C_XDEVICEFAMILY               => C_XDEVICEFAMILY,
    C_FAMILY                      => C_FAMILY)
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
    m_axis_stat_tdata              => m_axis_stat_tdata,
    m_axis_stat_tvalid             => m_axis_stat_tvalid,
    m_axis_stat_tlast              => m_axis_stat_tlast,
    m_axis_stat_tready             => m_axis_stat_tready,
    event_s_input_tlast_missing    => event_s_input_tlast_missing,
    event_s_input_tlast_unexpected => event_s_input_tlast_unexpected,
    event_s_ctrl_tdata_invalid     => event_s_ctrl_tdata_invalid );

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

library rs_decoder_v9_0_12;
use rs_decoder_v9_0_12.rs_decoder_v9_0_12_viv_comp.all;

entity rs_decoder_v9_0_12 is
  generic (
  -- AXI channel parameters
  C_HAS_ACLKEN                 : integer := 0;                   
  C_HAS_ARESETN                : integer := 0;                  
  C_HAS_S_AXIS_CTRL            : integer := 0;           
  C_HAS_S_AXIS_INPUT_TUSER     : integer := 0;       
  C_HAS_M_AXIS_OUTPUT_TUSER    : integer := 0;       
  C_S_AXIS_INPUT_TDATA_WIDTH   : integer := 8;     
  C_S_AXIS_INPUT_TUSER_WIDTH   : integer := 1;     
  C_S_AXIS_CTRL_TDATA_WIDTH    : integer := 8;   
  C_M_AXIS_OUTPUT_TDATA_WIDTH  : integer := 8;    
  C_M_AXIS_OUTPUT_TUSER_WIDTH  : integer := 1;    
  C_M_AXIS_STAT_TDATA_WIDTH    : integer := 8;   
    
  -- AXI channel sub-field parameters
  C_HAS_DATA_DEL               : integer := 0;
  C_HAS_ERASE                  : integer := 0;
  C_HAS_ERR_STATS              : integer := 0; 
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
  C_IGNORE_ILLEGAL_N_R         : integer := 1;
  C_DEFINE_LEGAL_R_VALS        : integer := 0;
  C_NUM_LEGAL_R_VALUES         : integer := 2;
  C_LEGAL_R_VECTOR_FILE        : string  := "null.mif";
  C_NUM_CHANNELS               : integer := 1;
  C_NUM_PUNC_PATTERNS          : integer := 0;
  C_PUNCTURE_SELECT_FILE       : string  := "null.mif";
  C_PUNCTURE_VECTOR_FILE       : string  := "null.mif";
  C_MEMSTYLE                   : integer := 2;
  C_OUTPUT_CHECK_SYMBOLS       : integer := 1;
  C_OPTIMISATION               : integer := 1;
  C_SELF_RECOVERING            : integer := 0;
  
  -- Generation parameters
  C_MEM_INIT_PREFIX            : string  := "rsd1";
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
  s_axis_input_tlast             : in  std_logic;                                                                 
  s_axis_input_tready            : out std_logic;                                                                 
    
  s_axis_ctrl_tdata              : in  std_logic_vector(C_S_AXIS_CTRL_TDATA_WIDTH-1 downto 0) := (others=>'1');
  s_axis_ctrl_tvalid             : in  std_logic := '0';                                                
  s_axis_ctrl_tready             : out std_logic;                                                                 
  
  m_axis_output_tdata            : out std_logic_vector(C_M_AXIS_OUTPUT_TDATA_WIDTH-1 downto 0);                  
  m_axis_output_tuser            : out std_logic_vector(C_M_AXIS_OUTPUT_TUSER_WIDTH-1 downto 0);                  
  m_axis_output_tvalid           : out std_logic;                                                                 
  m_axis_output_tready           : in  std_logic := '1';                                                          
  m_axis_output_tlast            : out std_logic;                                                                 

  m_axis_stat_tdata              : out std_logic_vector(C_M_AXIS_STAT_TDATA_WIDTH-1 downto 0);                  
  m_axis_stat_tvalid             : out std_logic;                                                                 
  m_axis_stat_tlast              : out std_logic;                                                                 
  m_axis_stat_tready             : in  std_logic := '1';
  
  event_s_input_tlast_missing    : out std_logic;
  event_s_input_tlast_unexpected : out std_logic;
  event_s_ctrl_tdata_invalid     : out std_logic
 
);

  
end entity rs_decoder_v9_0_12;


--------------------------------------------------------------------------------
architecture xilinx of rs_decoder_v9_0_12 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin

  -- Group: architecture body
  
  ------------------------------------------------------------------------------
  -- Object: d1
  -- Instantiate the decoder XST top level, <rs_decoder_v9_0_12_viv>
  d1: rs_decoder_v9_0_12_viv
  generic map(
    C_HAS_ACLKEN                  => C_HAS_ACLKEN,
    C_HAS_ARESETN                 => C_HAS_ARESETN,
    C_HAS_S_AXIS_CTRL             => C_HAS_S_AXIS_CTRL,
    C_HAS_S_AXIS_INPUT_TUSER      => C_HAS_S_AXIS_INPUT_TUSER,
    C_HAS_M_AXIS_OUTPUT_TUSER     => C_HAS_M_AXIS_OUTPUT_TUSER,
    C_S_AXIS_INPUT_TDATA_WIDTH    => C_S_AXIS_INPUT_TDATA_WIDTH,
    C_S_AXIS_INPUT_TUSER_WIDTH    => C_S_AXIS_INPUT_TUSER_WIDTH,
    C_S_AXIS_CTRL_TDATA_WIDTH     => C_S_AXIS_CTRL_TDATA_WIDTH,
    C_M_AXIS_OUTPUT_TDATA_WIDTH   => C_M_AXIS_OUTPUT_TDATA_WIDTH,
    C_M_AXIS_OUTPUT_TUSER_WIDTH   => C_M_AXIS_OUTPUT_TUSER_WIDTH,
    C_M_AXIS_STAT_TDATA_WIDTH     => C_M_AXIS_STAT_TDATA_WIDTH,
    C_HAS_DATA_DEL                => C_HAS_DATA_DEL,   
    C_HAS_ERASE                   => C_HAS_ERASE,   
    C_HAS_ERR_STATS               => C_HAS_ERR_STATS,   
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
    C_IGNORE_ILLEGAL_N_R          => C_IGNORE_ILLEGAL_N_R,   
    C_DEFINE_LEGAL_R_VALS         => C_DEFINE_LEGAL_R_VALS,
    C_NUM_LEGAL_R_VALUES          => C_NUM_LEGAL_R_VALUES,
    C_LEGAL_R_VECTOR_FILE         => C_LEGAL_R_VECTOR_FILE,
    C_NUM_CHANNELS                => C_NUM_CHANNELS,       
    C_NUM_PUNC_PATTERNS           => C_NUM_PUNC_PATTERNS,
    C_PUNCTURE_SELECT_FILE        => C_PUNCTURE_SELECT_FILE,
    C_PUNCTURE_VECTOR_FILE        => C_PUNCTURE_VECTOR_FILE,
    C_MEMSTYLE                    => C_MEMSTYLE,
    C_OUTPUT_CHECK_SYMBOLS        => C_OUTPUT_CHECK_SYMBOLS,
    C_OPTIMISATION                => C_OPTIMISATION,
    C_SELF_RECOVERING             => C_SELF_RECOVERING,
    C_MEM_INIT_PREFIX             => C_MEM_INIT_PREFIX,
    C_ELABORATION_DIR             => C_ELABORATION_DIR,
    C_XDEVICEFAMILY               => C_XDEVICEFAMILY,
    C_FAMILY                      => C_FAMILY)
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
    m_axis_stat_tdata              => m_axis_stat_tdata,
    m_axis_stat_tvalid             => m_axis_stat_tvalid,
    m_axis_stat_tlast              => m_axis_stat_tlast,
    m_axis_stat_tready             => m_axis_stat_tready,
    event_s_input_tlast_missing    => event_s_input_tlast_missing,
    event_s_input_tlast_unexpected => event_s_input_tlast_unexpected,
    event_s_ctrl_tdata_invalid     => event_s_ctrl_tdata_invalid);

end xilinx;







