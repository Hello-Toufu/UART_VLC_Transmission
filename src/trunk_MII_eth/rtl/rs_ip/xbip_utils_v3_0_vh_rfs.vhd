-------------------------------------------------------------------------------
--  (c) Copyright 2008-2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library std;
use std.standard.all;
use std.textio.all;

package xbip_utils_v3_0_7_pkg is

  constant simulating : integer := 0
                                   -- synthesis translate off
                                   + 1
                                   -- synthesis translate on
                                   ;
  constant c_xdevicefamily_str_len : integer := 20;
  -----------------------------------------------------------------------------
  -- Start of code lifted from prims_constants
  -----------------------------------------------------------------------------
  -- c_sync_priority constants
  constant c_set   : integer := 0;
  constant c_clear : integer := 1;

  -- c_sync_enable constants
  constant c_override    : integer := 0;
  constant c_no_override : integer := 1;

  -- bus datatype constants
  constant c_signed   : integer := 0;
  constant c_unsigned : integer := 1;
  constant c_pin      : integer := 2;

  --T_REG_TYPE
  constant c_reg_undefined : integer := 0;  -- to match java code
  constant c_reg_fd        : integer := 1;  -- a flipflop
  constant c_reg_ld        : integer := 2;  -- a latch

  -- constants for the addsub
  constant c_add     : integer := 0;
  constant c_sub     : integer := 1;
  constant c_add_sub : integer := 2;

  -- constants for c_gate_bit
  constant c_and  : integer := 0;
  constant c_nand : integer := 1;
  constant c_or   : integer := 2;
  constant c_nor  : integer := 3;
  constant c_xor  : integer := 4;
  constant c_xnor : integer := 5;
  constant c_inv  : integer := 6;
  constant c_buf  : integer := 7;

  -- These must match the c_add, c_sub and c_add_sub values respectively!
  constant c_up     : integer := 0;
  constant c_down   : integer := 1;
  constant c_updown : integer := 2;

  -- constants for c_dist_mem*
  constant c_rom    : integer := 0;
  constant c_sp_ram : integer := 1;
  constant c_dp_ram : integer := 2;
  constant c_srl16  : integer := 3;

  -- constants for memory configurations
  constant c_single_port : integer := 0;
  constant c_dual_port   : integer := 1;

  -- constants for bux mux implementations
  constant c_lut_based  : integer := 0;
  constant c_buft_based : integer := 1;

  -- constant for shift ram shift modes
  constant c_fixed             : integer := 0;
  constant c_variable_lossless : integer := 1;
  constant c_variable_lossy    : integer := 2;

  -- constants for shift FD
  constant c_lsb_to_msb    : integer := 0;
  constant c_msb_to_lsb    : integer := 1;
  constant c_bidirectional : integer := 2;

  -- constants for shift FD fill modes
  constant c_zeros : integer := 0;
  constant c_ones  : integer := 1;
  constant c_lsb   : integer := 2;
  constant c_msb   : integer := 3;
  constant c_wrap  : integer := 4;
  constant c_sdin  : integer := 5;

  -- constants for shift ram optimisation
  constant c_area  : integer := 0;
  constant c_speed : integer := 1;

  --constants for supports_ suite of functions
  constant c_no_support       : integer := 0;  --device does not have this primitive
  constant c_native_support   : integer := 1;  --device has this primitive
  constant c_retarget_support : integer := 2;  --device supports this primitive via retargetting

  constant empty_string : string(1 to c_xdevicefamily_str_len) := "                    ";

  -----------------------------------------------------------------------------
  -- Start of code lifted from prims_utils
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- original prims_utils functions
  -----------------------------------------------------------------------------

  function bv_to_slv(bitsin           : bit_vector) return std_logic_vector;
  function str_to_slv(bitsin          : string) return std_logic_vector;
  function str_to_slv_0(bitsin        : string; nbits : integer) return std_logic_vector;
  function str_to_slv_1(bitsin        : string; nbits : integer) return std_logic_vector;
  function str_to_bound_slv(bitsin    : string; nbits : integer; pad : std_logic) return std_logic_vector;
  function str_to_bound_slv_0 (bitsin : string; nbits : integer) return std_logic_vector;
  function str_to_bv(bitsin           : string) return bit_vector;
  function b_to_sl(bitin              : bit) return std_logic;
  function char_to_sl(bitin           : character) return std_logic;
  function slv_to_bv(bitsin           : std_logic_vector) return bit_vector;
  function slv_to_str(bitsin          : std_logic_vector) return string;
  function sl_to_b(bitin              : std_logic) return bit;
  function sl_to_char(bitin           : std_logic) return character;
  function int_to_str(int_value       : integer) return string;
  function all_Xs (i                  : integer) return std_logic_vector;
  function sl_to_str(sl               : std_logic) return string;
  function padded_slv_to_str (slv     : std_logic_vector; width : integer) return string;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_conv
  -----------------------------------------------------------------------------

  function rat(value                    : std_logic) return std_logic;
  function slv_to_int(vect              : std_logic_vector) return integer;
  function two_comp(vect                : std_logic_vector) return std_logic_vector;
  function int_to_slv(value, bitwidth   : integer) return std_logic_vector;
  function slv_to_posint(vect           : std_logic_vector) return integer;
  function int_to_string(val            : integer) return string;  -- duplicate of int_to_str..
  function bool_to_str (val             : boolean) return string;
  function number_of_digits (data_value : integer; radix : integer) return integer;
  function conv_int_to_new_radix(number : integer; target_str_len : integer; target_radix : integer) return string;
  function int_to_hex(value, bitwidth   : integer) return string;
  function bin_to_hex_string(bin        : string) return string;
  function hexstr_to_slv(arg1           : string; size : integer) return std_logic_vector;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_math
  -----------------------------------------------------------------------------

  function addr_width_for_depth (depth         : integer) return integer;
  function binary_width_of_integer (data_value : integer) return integer;
  function log2roundup (data_value             : integer) return integer;
  function get_min (a                          : integer; b : integer) return integer;
  function get_max (a                          : integer; b : integer) return integer;
  function div4roundup (data_value             : integer) return integer;
  function divroundup (data_value              : integer; divisor : integer) return integer;
  function divrounddown (data_value            : integer; divisor : integer) return integer;
  function roundup_to_multiple(data_value      : integer; multipleof : integer) return integer;
  function rand_int_base (seed                 : integer; maxval : integer; iterations : integer; feedback_val : integer) return integer;
  function rand_int (seed                      : integer; maxval : integer) return integer;
  function rand_slv_bits (seed                 : integer; width : integer) return std_logic_vector;
  function rand_slv (seed                      : integer; width : integer; maxval : integer) return std_logic_vector;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_misc
  -----------------------------------------------------------------------------

  function index_in_str(stringtosearch   : string; stringsize : integer; char : string; instnum : integer) return integer;
  function lcase(instring                : string) return string;
  function ucase(instring                : string) return string;
  function case_sensitive_compare(a, b   : string) return boolean;
  function case_insensitive_compare(a, b : string) return boolean;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_family
  -----------------------------------------------------------------------------

  function derived (child, ancestor      : string) return boolean;
  function derived_base (child, ancestor : string; recurse : boolean) return boolean;
  function equalIgnoreCase(str1, str2    : string) return boolean;

  -----------------------------------------------------------------------------
  -- new family-related functions as of 17th Feb 2006
  -----------------------------------------------------------------------------
  function valid_family (family                       : string) return boolean;
  function c_xdevicefamily_to_c_family (xdevicefamily : string) return string;
  function has_dsp (family                            : string) return boolean;
  function has_dsp48 (family                          : string) return boolean;
  function has_dsp48e (family                         : string) return boolean;
  function has_dsp48e1 (family                        : string) return boolean;  -- 30thJune2008
  function has_dsp48e2 (family                        : string) return boolean;  -- 28thJan2013
  function has_dsp48a (family                         : string) return boolean;
  function has_dsp48a1 (family                        : string) return boolean;  -- 30thJune2008
  function has_mult18x18 (family                      : string) return boolean;
  function has_mult18x18s (family                     : string) return boolean;
  function has_mult18x18sio (family                   : string) return boolean;
  function has_SRLC16E (family                        : string) return boolean;
  function has_SRLC32E (family                        : string) return boolean;
  function has_LUT4 (family                           : string) return boolean;
  function has_LUT6 (family                           : string) return boolean;
  function has_F7MUX (family                          : string) return boolean;
  function has_F8MUX (family                          : string) return boolean;
  function has_F9MUX (family                          : string) return boolean;  --28thJan2013

  -----------------------------------------------------------------------------
  -- new family-related functions as of 30th June 2008
  -----------------------------------------------------------------------------
--  function supports_dsp (family : string) return --  integer;  --makes little
--  sense.
  function supports_dsp48 (family        : string) return integer;
  function supports_dsp48e (family       : string) return integer;
  function supports_dsp48e1 (family      : string) return integer;
  function supports_dsp48e2 (family      : string) return integer;  --28thJan2013
  function supports_dsp48a (family       : string) return integer;
  function supports_dsp48a1 (family      : string) return integer;
  function supports_mult18x18 (family    : string) return integer;
  function supports_mult18x18s (family   : string) return integer;
  function supports_mult18x18sio (family : string) return integer;
  function supports_SRLC16E (family      : string) return integer;
  function supports_SRLC32E (family      : string) return integer;
  function supports_LUT4 (family         : string) return integer;
  function supports_LUT6 (family         : string) return integer;
  function supports_RAMB16 (family       : string) return integer;
  function supports_RAMB16_S_S (family   : string) return integer;
  function supports_RAMB16BWE (family    : string) return integer;
  function supports_RAMB16BWER (family   : string) return integer;
  function supports_RAMB18 (family       : string) return integer;
  function supports_RAMB18E1 (family     : string) return integer;
  function supports_RAMB18E2 (family     : string) return integer;  --19thMarch2013
  function supports_RAMB36 (family       : string) return integer;
  function supports_RAMB36E1 (family     : string) return integer;
  function supports_RAMB36E2 (family     : string) return integer;  --19thMarch2013
  function supports_RAMB8BWER (family    : string) return integer;
  function supports_RAMB18SDP (family    : string) return integer;
  function supports_RAMB36SDP (family    : string) return integer;
  function supports_URAM (family : string; device : string := "") return integer;

  -----------------------------------------------------------------------------
  -- Family-related stuff moved here from bip_usecase_utils_pkg
  -----------------------------------------------------------------------------

  constant ci_dsp48e2_a_width     : integer := 30;  --19thMarch2013
  constant ci_dsp48e2_amult_width : integer := 27;
  constant ci_dsp48e2_b_width     : integer := 18;
  constant ci_dsp48e2_c_width     : integer := 48;
  constant ci_dsp48e2_d_width     : integer := 27;
  constant ci_dsp48e2_p_width     : integer := 48;

  constant ci_dsp48e1_a_width     : integer := 30;
  constant ci_dsp48e1_amult_width : integer := 25;
  constant ci_dsp48e1_b_width     : integer := 18;
  constant ci_dsp48e1_c_width     : integer := 48;
  constant ci_dsp48e1_d_width     : integer := 25;
  constant ci_dsp48e1_p_width     : integer := 48;

  function fn_dsp48_a_width (p_xdevicefamily        : string) return integer;
  function fn_dsp48_b_width (p_xdevicefamily        : string) return integer;
  function fn_dsp48_amult_width (p_xdevicefamily    : string) return integer;
  function fn_dsp48_amultcin_width (p_xdevicefamily : string; p_use_acin : integer) return integer;
  function fn_dsp48_c_width (p_xdevicefamily        : string) return integer;
  function fn_dsp48_d_width (p_xdevicefamily        : string) return integer;
  function fn_dsp48_concat_width (p_xdevicefamily   : string) return integer;
  function fn_dsp48_preadd_width (p_xdevicefamily   : string) return integer;
  function fn_dsp48_add3_x_width (p_xdevicefamily   : string) return integer;
  function fn_dsp48_p_width (p_xdevicefamily        : string) return integer;

  -----------------------------------------------------------------------------
  -- New Routines
  -----------------------------------------------------------------------------
  function str_to_bound_str (           -- G.Old 30/5/06
    instring  : string;                 -- unknown direction
    outlength : integer;                -- return string length
    pad       : string)                 -- fill pattern character
    return string;

  -----------------------------------------------------------------------------
  -- File I/O routines that work with XST *and* ModelSim
  -- Currently don't go through XCC though...
  -----------------------------------------------------------------------------

  -- xcc exclude
  impure function read_meminit_file(filename  : in string; depth, width, lines : in positive) return std_logic_vector;
  impure function write_meminit_file(filename : in string; depth, width : in positive; memvect : in std_logic_vector) return boolean;
  -- xcc include

  -----------------------------------------------------------------------------
  -- Simulation functions moved from ul_utils
  -----------------------------------------------------------------------------

  function anyX(vect     : std_logic_vector) return boolean;
  function any0(vect     : std_logic_vector) return boolean;
  function setallX(width : integer) return std_logic_vector;
  function setall0(width : integer) return std_logic_vector;

  -----------------------------------------------------------------------------
  -- other stuff
  -----------------------------------------------------------------------------

  type log2array is array (0 to 128) of integer;
  constant log2 : log2array := (0   => 0, 1 => 0,
                                2   => 1,
                                3   => 2, 4 => 2,
                                5   => 3, 6 => 3, 7 => 3, 8 => 3,
                                9   => 4, 10 => 4, 11 => 4, 12 => 4, 13 => 4, 14 => 4, 15 => 4, 16 => 4,
                                17  => 5, 18 => 5, 19 => 5, 20 => 5, 21 => 5, 22 => 5, 23 => 5, 24 => 5, 25 => 5, 26 => 5, 27 => 5, 28 => 5, 29 => 5, 30 => 5, 31 => 5, 32 => 5,
                                33  => 6, 34 => 6, 35 => 6, 36 => 6, 37 => 6, 38 => 6, 39 => 6, 40 => 6, 41 => 6, 42 => 6, 43 => 6, 44 => 6, 45 => 6, 46 => 6, 47 => 6, 48 => 6,
                                49  => 6, 50 => 6, 51 => 6, 52 => 6, 53 => 6, 54 => 6, 55 => 6, 56 => 6, 57 => 6, 58 => 6, 59 => 6, 60 => 6, 61 => 6, 62 => 6, 63 => 6, 64 => 6,
                                65  => 7, 66 => 7, 67 => 7, 68 => 7, 69 => 7, 70 => 7, 71 => 7, 72 => 7, 73 => 7, 74 => 7, 75 => 7, 76 => 7, 77 => 7, 78 => 7, 79 => 7, 80 => 7,
                                81  => 7, 82 => 7, 83 => 7, 84 => 7, 85 => 7, 86 => 7, 87 => 7, 88 => 7, 89 => 7, 90 => 7, 91 => 7, 92 => 7, 93 => 7, 94 => 7, 95 => 7, 96 => 7,
                                97  => 7, 98 => 7, 99 => 7, 100 => 7, 101 => 7, 102 => 7, 103 => 7, 104 => 7, 105 => 7, 106 => 7, 107 => 7, 108 => 7, 109 => 7, 110 => 7, 111 => 7, 112 => 7,
                                113 => 7, 114 => 7, 115 => 7, 116 => 7, 117 => 7, 118 => 7, 119 => 7, 120 => 7, 121 => 7, 122 => 7, 123 => 7, 124 => 7, 125 => 7, 126 => 7, 127 => 7, 128 => 7);


  type XBIP_UTILS_integer_vector is array (natural range <>) of integer;

  -----------------------------------------------------------------------------
  -- Start of code lifted from pkg_baseblox.
  -----------------------------------------------------------------------------
  type T_REGTYPE is (REGTYPE_FD, REGTYPE_LD);
  type T_SYNC_ENABLE is (SYNC_OVERRIDES_CE, CE_OVERRIDES_SYNC);
  type T_REG_PRIORITY is (RESET_OVERRIDES_SET, SET_OVERRIDES_RESET);
  type T_BYPASS_ENABLE is (BYPASS_OVERRIDES_CE, CE_OVERRIDES_BYPASS);
  type T_ADD_MODE is (MODE_ADD, MODE_SUB, MODE_ADDSUB);
  -- NUM_PIN is for pin-specified signed/unsigned numbers
  type T_NUMBER_FORMAT is (NUM_SIGNED, NUM_UNSIGNED, NUM_PIN);
  type T_DEVICE_FAMILY is (
    VIRTEX7,                            --fuji
    KINTEX7,                            --fuji
    ARTIX7,                             --fuji
    SPARTAN7,                           --whistler
    ZYNQ,                               --fuji
    KINTEXU,                            --olympus
    VIRTEXU                             --olympus
    );

  function fn_select_sync_enable (sync_enable     : integer) return T_SYNC_ENABLE;
  function fn_select_bypass_enable (bypass_enable : integer) return T_BYPASS_ENABLE;
  function fn_select_sync_priority (sync_priority : integer) return T_REG_PRIORITY;
  function fn_select_reg_type (reg_type           : integer) return T_REGTYPE;
  function fn_select_add_mode (add_mode           : integer) return T_ADD_MODE;
  function fn_select_number_format (number_format : integer) return T_NUMBER_FORMAT;
  function fn_check_family(family                 : string) return T_DEVICE_FAMILY;
  function fn_syncs_in_d_lut (has_sclr, has_sset, has_sinit,
                              has_aclr, has_aset, has_ainit : integer  -- the legacy type
                              ) return integer;
  function fn_get_lut_size(device_family : T_DEVICE_FAMILY) return integer;
  function fn_get_por_value(c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit : integer;
                            ainit_val, sinit_val                                                     : std_logic_vector;
                            c_width                                                                  : integer) return std_logic_vector;

end xbip_utils_v3_0_7_pkg;

package body xbip_utils_v3_0_7_pkg is

  -- purpose: converts a bit_vector to a std_logic_vector
  function bv_to_slv(bitsin : bit_vector) return std_logic_vector is
    variable ret : std_logic_vector(bitsin'range);
  begin
    for i in bitsin'range loop
      if bitsin(i) = '1' then
        ret(i) := '1';
      else
        ret(i) := '0';
      end if;
    end loop;

    return ret;
  end bv_to_slv;

  -- purpose: converts a string to a std_logic_vector
  function str_to_slv(bitsin : string) return std_logic_vector is
    variable ret : std_logic_vector(bitsin'range);
  begin
    for i in bitsin'range loop
      if bitsin(i) = '1' then
        ret(i) := '1';
      elsif (bitsin(i) = 'X' or bitsin(i) = 'x') then
        ret(i) := 'X';
      elsif (bitsin(i) = 'Z' or bitsin(i) = 'z') then
        ret(i) := 'Z';
      elsif (bitsin(i) = '0') then
        ret(i) := '0';
      end if;
    end loop;

    return ret;
  end str_to_slv;

  -- purpose: converts a string to a std_logic_vector with padding of 0's
  function str_to_slv_0(bitsin : string; nbits : integer) return std_logic_vector is
    variable ret       : std_logic_vector(bitsin'range);
    -- String types range from 1 to len!!!
    variable ret0s     : std_logic_vector(1 to nbits) := (others => '0');
    variable retpadded : std_logic_vector(1 to nbits) := (others => '0');
    variable offset    : integer                      := 0;
  begin
    if(bitsin'length = 0) then          -- Make all '0's
      return ret0s;
    end if;
    if(bitsin'length < nbits) then      -- pad MSBs with '0's
      offset := nbits - bitsin'length;
      for i in bitsin'range loop
        if bitsin(i) = '1' then
          retpadded(i+offset) := '1';
        elsif (bitsin(i) = 'X' or bitsin(i) = 'x') then
          retpadded(i+offset) := 'X';
        elsif (bitsin(i) = 'Z' or bitsin(i) = 'z') then
          retpadded(i+offset) := 'Z';
        elsif (bitsin(i) = '0') then
          retpadded(i+offset) := '0';
        end if;
      end loop;
      retpadded(1 to offset) := (others => '0');
      return retpadded;
    end if;
    for i in bitsin'range loop
      if bitsin(i) = '1' then
        ret(i) := '1';
      elsif (bitsin(i) = 'X' or bitsin(i) = 'x') then
        ret(i) := 'X';
      elsif (bitsin(i) = 'Z' or bitsin(i) = 'z') then
        ret(i) := 'Z';
      elsif (bitsin(i) = '0') then
        ret(i) := '0';
      end if;
    end loop;

    return ret;
  end str_to_slv_0;

  -- purpose: converts a string to a std_logic_vector with padding of 1's
  function str_to_slv_1(bitsin : string; nbits : integer) return std_logic_vector is
    variable ret       : std_logic_vector(bitsin'range);
    -- String types range from 1 to len!!!
    variable ret1s     : std_logic_vector(1 to nbits) := (others => '1');
    variable retpadded : std_logic_vector(1 to nbits) := (others => '1');
    variable offset    : integer                      := 0;
  begin
    if(bitsin'length = 0) then          -- make all '1's
      return ret1s;
    end if;
    if(bitsin'length < nbits) then      -- pad MSBs with '1's
      offset := nbits - bitsin'length;
      for i in bitsin'range loop
        if bitsin(i) = '1' then
          retpadded(i+offset) := '1';
        elsif (bitsin(i) = 'X' or bitsin(i) = 'x') then
          retpadded(i+offset) := 'X';
        elsif (bitsin(i) = 'Z' or bitsin(i) = 'z') then
          retpadded(i+offset) := 'Z';
        elsif (bitsin(i) = '0') then
          retpadded(i+offset) := '0';
        end if;
      end loop;
      retpadded(1 to offset) := (others => '1');
      return retpadded;
    end if;
    for i in bitsin'range loop
      if bitsin(i) = '1' then
        ret(i) := '1';
      elsif (bitsin(i) = 'X' or bitsin(i) = 'x') then
        ret(i) := 'X';
      elsif (bitsin(i) = 'Z' or bitsin(i) = 'z') then
        ret(i) := 'Z';
      elsif (bitsin(i) = '0') then
        ret(i) := '0';
      end if;
    end loop;

    return ret;
  end str_to_slv_1;

  -- purpose: converts a string to a std_logic_vector of bound length
  -- truncating or padding with pad as necessary
  -- truncation and padding occurs at the LEFT
  -- eg "11", 4 => "0011"
  -- or "100000", 4 => "0000"
  function str_to_bound_slv (bitsin : string; nbits : integer; pad : std_logic)
    return std_logic_vector is
    variable ret          : std_logic_vector (1 to nbits);
    -- offset is the amount that bitsin needs to move to the right
    -- for its right end to be coincident with ret's.
    -- negative values of offset mean bitsin must move to the left
    -- and that bitsin will be truncated.
    constant offset       : integer                    := nbits - bitsin'length;  -- was variable
    constant bitsinlen    : integer                    := bitsin'length;  -- was variable
    constant bitsin_const : string(1 to bitsin'length) := bitsin;
    variable temp         : string(1 to bitsin'length);
  begin
    assert nbits >= 1
      report "ERROR - str_to_bound_slv: Cannot have zero or negative length array"
      severity failure;
    assert offset >= 0
      report "Note - str_to_bound_slv: Input string too long, will truncate it"
      severity Note;

    for i in 1 to nbits loop
      ret(i) := pad;
    end loop;
    if bitsin_const'length = 0 then  -- use instead of bitsin = "" to avoid XST warning
      return ret;
    end if;

    temp := bitsin;

    for i in 1 to nbits loop
--      assert false report "i ="&integer'IMAGE(i)&" offset="&integer'IMAGE(offset) severity note;
      if i <= offset then
        -- this cell of the vector will become padding
        ret(i) := pad;
      else
        -- the following IF effectively does ret(i) := temp(i - offset)
        case temp(i-offset) is
          when '1' =>
            ret(i) := '1';
          when '0' =>
            ret(i) := '0';
          when 'x' | 'X' =>
            ret(i) := 'X';
          when 'u' | 'U' =>
            ret(i) := 'U';
          when others =>
            assert false report "ERROR - str_to_bound_slv: Invalid character encountered (Only 1, X, U or 0 are recognised) "&bitsin_const(i-offset)
              severity warning;
        end case;
      end if;
    end loop;
    return ret;
  end str_to_bound_slv;

  -- purpose: same as above, but pad with '0' rather than user-defined pad.
  function str_to_bound_slv_0 (bitsin : string; nbits : integer) return std_logic_vector is
  begin
    return str_to_bound_slv(bitsin, nbits, '0');
  end str_to_bound_slv_0;

  -- purpose: converts a string to a bit_Vector
  function str_to_bv(bitsin : string) return bit_vector is
    variable ret : bit_vector(bitsin'range) := (others => '0');
  begin
    for i in bitsin'range loop
      if bitsin(i) = '1' then
        ret(i) := '1';
      elsif (bitsin(i) = '0') then
        ret(i) := '0';
      else
        assert false
          report "Cannot translate STR_TO_BV with unknowns in STR"
          severity error;
      end if;
    end loop;

    return ret;
  end str_to_bv;

  -- purpose: converts a bit value to a std_logic value
  function b_to_sl(bitin : bit) return std_logic is
    variable ret : std_logic;
  begin
    if bitin = '1' then
      ret := '1';
    else
      ret := '0';
    end if;
    return ret;
  end b_to_sl;

  -- purpose: converts a character to a std_logic value
  function char_to_sl(bitin : character) return std_logic is
    variable ret : std_logic;
  begin
    if bitin = '1' then
      ret := '1';
    elsif bitin = 'X' or bitin = 'x' then
      ret := 'X';
    elsif bitin = 'Z' or bitin = 'z' then
      ret := 'Z';
    else
      ret := '0';
    end if;
    return ret;
  end char_to_sl;

  -- purpose: converts a std_logic_vector to a bit_vector
  function slv_to_bv(bitsin : std_logic_vector) return bit_vector is
    variable ret : bit_vector(bitsin'range);
  begin
    for i in bitsin'range loop
      if bitsin(i) = '1' then
        ret(i) := '1';
      elsif bitsin(i) = '0' then
        ret(i) := '0';
      else
        assert false
          report "Cannot translate SLV_TO_BV with unknowns in SLV"
          severity error;
      end if;
    end loop;

    return ret;
  end slv_to_bv;

  -- purpose: converts a std_logic_Vector to a string
  function slv_to_str(bitsin : std_logic_vector) return string is
    variable ret : string(1 to bitsin'length);
  begin
    if bitsin'length = 0 then
      return "";
    else
      if bitsin'ascending then
        for i in 0 to bitsin'length-1 loop
          if bitsin(bitsin'left+i) = '1' then
            ret(ret'left+i) := '1';
          elsif (bitsin(bitsin'left+i) = 'X') then
            ret(ret'left+i) := 'X';
          elsif (bitsin(bitsin'left+i) = 'Z') then
            ret(ret'left+i) := 'Z';
          elsif (bitsin(bitsin'left+i) = 'U') then
            ret(ret'left+i) := 'U';
          elsif (bitsin(bitsin'left+i) = '0') then
            ret(ret'left+i) := '0';
          end if;
        end loop;
      else                              -- bitsin'descending
        for i in 0 to bitsin'length-1 loop
          if bitsin(bitsin'left-i) = '1' then
            ret(ret'left+i) := '1';
          elsif (bitsin(bitsin'left-i) = 'X') then
            ret(ret'left+i) := 'X';
          elsif (bitsin(bitsin'left-i) = 'Z') then
            ret(ret'left+i) := 'Z';
          elsif (bitsin(bitsin'left-i) = 'U') then
            ret(ret'left+i) := 'U';
          elsif (bitsin(bitsin'left-i) = '0') then
            ret(ret'left+i) := '0';
          end if;
        end loop;
      end if;
    end if;
    return ret;
  end slv_to_str;

  -- purpose: converts a std_logic value to a bit value
  function sl_to_b(bitin : std_logic) return bit is
    variable ret : bit;
  begin
    if bitin = '1' then
      ret := '1';
    else
      ret := '0';
    end if;
    return ret;
  end sl_to_b;

  -- purpose: converts a std_logic value to a character
  function sl_to_char(bitin : std_logic) return character is
    variable ret : character;
  begin
    if bitin = '1' then
      ret := '1';
    elsif bitin = 'X' then
      ret := 'X';
    elsif bitin = 'Z' then
      ret := 'Z';
    elsif bitin = 'U' then
      ret := 'U';
    else
      ret := '0';
    end if;
    return ret;
  end sl_to_char;

  -- purpose: converts an integer to a string
  function int_to_str(int_value : integer) return string is
  begin
    return integer'image(int_value);
  end int_to_str;

  function all_Xs(i : integer) return std_logic_vector is
    variable stmp : std_logic_vector(i-1 downto 0) := (others => 'X');
  begin
    return stmp;
  end all_Xs;

  -- purpose: Converts std_logic 0 or 1 to equivalent STRING
  function sl_to_str(sl : std_logic) return string is
  begin  -- FUNCTION sl_to_str
    case sl is
      when '0' => return "0";
      when '1' => return "1";
      when others =>
        assert false
          report "WARNING: Unexpected STD_LOGIC value (not 0 or 1) detected - returning 0"
          severity warning;
        return "0";
    end case;
  end function sl_to_str;

  -- purpose: Converts std_logic_vectors to equivalent strings
  function padded_slv_to_str (slv : std_logic_vector; width : integer) return string is
    variable ret : string(1 to width);
    variable itr : integer;
    variable temp : string(1 to 3);
  begin  -- FUNCTION padded_slv_to_str

    if slv'ascending then
      itr := 1;
    else
      itr := width;
    end if;

    for i in slv'low to slv'high loop
      temp(1 to 3) := std_logic'image(slv(i));  -- returns string in format '1'
                                                -- including the ' characters
      ret(itr to itr) := temp(2 to 2);  -- Extract only the value of interest
      if slv'ascending then
        itr := itr + 1;
      else
        itr := itr - 1;
      end if;
    end loop;  -- i

    return ret;
  end function padded_slv_to_str;

  -----------------------------------------------------------------------------
  -- new functions imported from iputils_conv
  -----------------------------------------------------------------------------

  -- purpose: rationalises input SL value
  -- utility function for functions below
  function rat(value : std_logic) return std_logic is
  begin
    case value is
      when '0' | '1' => return value;
      when 'H'       => return '1';
      when 'L'       => return '0';
      when others    => return 'X';
    end case;
  end rat;

  -- purpose: returns two's complement of the input SLV
  function two_comp(vect : std_logic_vector) return std_logic_vector is
    variable local_vect : std_logic_vector(vect'high downto 0);
    variable toggle     : integer := 0;
  begin
    for i in 0 to vect'high loop
      if (toggle = 1) then
        if (vect(i) = '0') then
          local_vect(i) := '1';
        else
          local_vect(i) := '0';
        end if;
      else
        local_vect(i) := vect(i);
        if (vect(i) = '1') then
          toggle := 1;
        end if;
      end if;
    end loop;
    return local_vect;
  end two_comp;

  -- purpose: converts a std_logic_Vector to an integer
  function slv_to_int(vect : std_logic_vector) return integer is
    variable local_vect : std_logic_vector(vect'high downto 0);
    variable result     : integer := 0;
  begin
    if (rat(vect(vect'high)) = '1') then  -- negative number
      local_vect := two_comp(vect);
    else
      local_vect := vect;
    end if;

    for i in vect'high downto 0 loop
      result := result * 2;
      if (rat(local_vect(i)) = '1') then
        result := result + 1;
      end if;
    end loop;

    if (rat(vect(vect'high)) = '1') then
      result := -1 * result;
    end if;

    return result;

  end slv_to_int;

  -- purpose: converts an integer value to a std_logic_Vector
  function int_to_slv(value, bitwidth : integer) return std_logic_vector is
    variable running_value  : integer := value;
    variable running_result : std_logic_vector(bitwidth-1 downto 0);
  begin

    if (value < 0) then
      running_value := -1 * value;
    end if;

    for i in 0 to bitwidth-1 loop

      if running_value mod 2 = 0 then
        running_result(i) := '0';
      else
        running_result(i) := '1';
      end if;
      running_value := running_value/2;
    end loop;

    if (value < 0) then                 -- find the 2s complement
      return two_comp(running_result);
    else
      return running_result;
    end if;
  end int_to_slv;

  -- purpose: converts a std_logic_vector to a positive integer
  function slv_to_posint(vect : std_logic_vector) return integer is
    variable result : integer := 0;
  begin
    for i in vect'high downto vect'low loop
      result := result * 2;
      if (rat(vect(i)) = '1') then
        result := result + 1;
      end if;
    end loop;
    return result;
  end slv_to_posint;

  -- purpose: converts an Integer value to a string
  function int_to_string(val : integer) return string is
  begin
    return integer'image(val);
  end int_to_string;

  -- purpose: converts a Boolean value to a string
  function bool_to_str (val : boolean) return string is
  begin  -- FUNCTION bool_to_str
    if val then
      return "true";
    else
      return "false";
    end if;
  end function bool_to_str;

  -- purpose: Calculates the number of bits needed to represent the specified data_value
  -- based on the supplied radix
  function number_of_digits (data_value : integer; radix : integer) return integer is
    variable dwidth : integer := 0;
  begin
    while radix**dwidth-1 < data_value and data_value > 0 loop
      dwidth := dwidth + 1;
    end loop;
    return dwidth;
  end number_of_digits;

-- Purpose:
-- Converts an integer to a string of the specified radix (2 to 16)
-- Algorithm:
-- Based on the destination string size, or the input number, the function
-- determines the largest possible exponent to attempt.
-- It then loops downward, determining the coefficient for each exponent value
-- and subtracting the value from the remaining value.
-- Parameters:
-- number : the integer value to convert
-- target_str_len : the number of terms in the target string
-- target_radix : the desired radix of the output string
-- return : string formatted number in the desired radix (padded with 0's)
  function conv_int_to_new_radix(number : integer; target_str_len : integer; target_radix : integer) return string is
    variable return_string   : string(1 to target_str_len) := (others => '0');
    variable string_location : integer                     := 0;
    variable tmp_string_val  : integer                     := 0;
    variable new_number      : integer                     := number;
    variable hexdigits       : string(1 to 16)             := "0123456789ABCDEF";
    variable max_exp         : integer                     := 0;
  begin
    max_exp := number_of_digits(number, target_radix);
    if target_str_len < max_exp then
      max_exp := target_str_len;
    end if;

    new_number := number;

    for exp in max_exp-1 downto 0 loop
      string_location                := target_str_len-exp;
      tmp_string_val                 := new_number/(target_radix**exp);
      new_number                     := new_number - tmp_string_val*(target_radix**exp);
      return_string(string_location) := hexdigits(tmp_string_val+1);
    end loop;
    return return_string;
  end conv_int_to_new_radix;

--   purpose: Converts an integer to a hexidecimal string value
  function int_to_hex(value, bitwidth : integer) return string is
    variable hexdigits      : string(1 to 16) := "0123456789ABCDEF";
    variable running_value  : integer         := value;
    variable digit_value    : integer         := 0;
    variable digit_position : integer         := 1;
    variable results_string : string(1 to (bitwidth+3)/4);
  begin

    for i in bitwidth-1 downto 0 loop

      if (2**i) <= running_value then
        running_value := running_value - (2**i);
        digit_value   := digit_value + (2**(i mod 4));
      end if;

      if i mod 4 = 0 then
        results_string(digit_position) := hexdigits(1+digit_value);
        digit_value                    := 0;
        digit_position                 := digit_position + 1;
      end if;

    end loop;

    return results_string;

  end int_to_hex;

  -- purpose: Returns the ceiling value of the division by 4
  --  This version of this function is only for use by the
  --  bin_to_hex_string function.  Users should use
  --  div4roundup from iputils_math.
  function div4roundup_v2 (data_value : integer) return integer is
    variable div : integer;
  begin
    div := data_value/4;
    if ((data_value mod 4) /= 0) then
      div := div+1;
    end if;
    return div;
  end div4roundup_v2;

  -- purpose: This function converts a standard logic vector to a string.
  function bin_to_hex_string(bin : string) return string is
    variable hex_len : integer := div4roundup_v2(bin'high);
    variable bin_ext : string(1 to hex_len*4);
    variable hex     : string(1 to hex_len);
    variable sub_bin : string (1 to 4);
  begin

    -- extend binary string to a multiple of 4
    for j in 1 to hex_len*4 loop
      if (j <= hex_len*4-bin'high) then
        bin_ext(j) := '0';
      else
        bin_ext(j) := bin(j-(hex_len*4-bin'high));
      end if;
    end loop;

    for i in 0 to hex_len-1 loop
      sub_bin := bin_ext(i*4+1 to i*4+4);
      case sub_bin is
        when "0000" => hex(i+1) := '0';
        when "0001" => hex(i+1) := '1';
        when "0010" => hex(i+1) := '2';
        when "0011" => hex(i+1) := '3';
        when "0100" => hex(i+1) := '4';
        when "0101" => hex(i+1) := '5';
        when "0110" => hex(i+1) := '6';
        when "0111" => hex(i+1) := '7';
        when "1000" => hex(i+1) := '8';
        when "1001" => hex(i+1) := '9';
        when "1010" => hex(i+1) := 'a';
        when "1011" => hex(i+1) := 'b';
        when "1100" => hex(i+1) := 'c';
        when "1101" => hex(i+1) := 'd';
        when "1110" => hex(i+1) := 'e';
        when "1111" => hex(i+1) := 'f';
        when others => hex(i+1) := 'X';
      end case;
    end loop;

    return hex;

  end bin_to_hex_string;

--  purpose: This function converts a hex string to a std_logic_vector
  function hexstr_to_slv(arg1 : string; size : integer) return std_logic_vector is
    variable RESULT : std_logic_vector(size-1 downto 0) := (others => '0');
    variable BIN    : std_logic_vector(3 downto 0);
    variable INDEX  : integer                           := 0;
  begin
    for i in arg1'reverse_range loop
      case arg1(i) is
        when '0' => BIN := (others => '0');
        when '1' => BIN := (0 => '1', others => '0');
        when '2' => BIN := (1 => '1', others => '0');
        when '3' => BIN := (0 => '1', 1 => '1', others => '0');
        when '4' => BIN := (2 => '1', others => '0');
        when '5' => BIN := (0 => '1', 2 => '1', others => '0');
        when '6' => BIN := (1 => '1', 2 => '1', others => '0');
        when '7' => BIN := (3 => '0', others => '1');
        when '8' => BIN := (3 => '1', others => '0');
        when '9' => BIN := (0 => '1', 3 => '1', others => '0');
        when 'A' => BIN := (0 => '0', 2 => '0', others => '1');
        when 'a' => BIN := (0 => '0', 2 => '0', others => '1');
        when 'B' => BIN := (2 => '0', others => '1');
        when 'b' => BIN := (2 => '0', others => '1');
        when 'C' => BIN := (0 => '0', 1 => '0', others => '1');
        when 'c' => BIN := (0 => '0', 1 => '0', others => '1');
        when 'D' => BIN := (1 => '0', others => '1');
        when 'd' => BIN := (1 => '0', others => '1');
        when 'E' => BIN := (0 => '0', others => '1');
        when 'e' => BIN := (0 => '0', others => '1');
        when 'F' => BIN := (others => '1');
        when 'f' => BIN := (others => '1');
        when others =>
          --ASSERT false
          --  REPORT "NOT A HEX CHARACTER" SEVERITY error;
          for j in 0 to 3 loop
            BIN(j) := 'X';
          end loop;
      end case;
      for j in 0 to 3 loop
        if (INDEX*4)+j < size then
          RESULT((INDEX*4)+j) := BIN(j);
        end if;
      end loop;
      INDEX := INDEX + 1;
    end loop;
    return RESULT;
  end hexstr_to_slv;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_math
  -----------------------------------------------------------------------------

  -- Purpose:
  --   Calculates the number of bits necessary for addressing a memory of
  --    of the specified depth.
  --   Equivalently, calculates the minimum number of bits required to have
  --    the specified number of unique states.
  -- Example: A memory with depth 256 requires an 8-bit addr bus.
  -- Example: To represent 256 unique values/states requires 8 bits.
  -- Algorithm:
  --   roundup(log2(depth))
  -- Parameters:
  --   depth : memory depth or unique values or states
  -- Return:
  --   integer number of bits
  -- NOTES: By definition, log2(0) is undefined. However, this function will
  --   simply return a 0 for any input <= 0.
  function addr_width_for_depth (depth : integer) return integer is
    variable bits : integer := 0;
  begin
    while 2**bits < depth and depth > 1 loop
      bits := bits + 1;
    end loop;
    return bits;
  end addr_width_for_depth;

  -- Purpose:
  --   Calculates the number of bits/registers needed to represent/store the
  --    specified maximum value
  -- Example:
  --   A max value of 0 does not require any bits for storage.
  --   A max value of 255 requires 8 bits to represent/store.
  --   A max value of 256 requires 9 bits to represent/store.
  -- Algorithm:
  --   roundup(log2(data_value+1))
  -- Parameters:
  --   data_value : input number
  -- Return : number of bits needed
  -- NOTES: By definition, log2(-1+1) is undefined. However, this function will
  --   simply return a 0 for any input < 0.
  function binary_width_of_integer (data_value : integer) return integer is
    variable dwidth : integer := 0;
  begin
    while 2**dwidth-1 < data_value and data_value > 0 loop
      dwidth := dwidth + 1;
    end loop;
    return dwidth;
  end binary_width_of_integer;

  -- purpose:
  function log2roundup (data_value : integer) return integer is
    variable width       : integer := 0;
    variable cnt         : integer := 1;
    constant lower_limit : integer := 1;
    constant upper_limit : integer := 8;
  begin
    if (data_value <= 1) then
      width := 0;
    else
      while (cnt < data_value) loop
        width := width + 1;
        cnt   := cnt *2;
      end loop;
    end if;
    return width;
  end log2roundup;

  -- purpose: Returns the min(a,b)
  function get_min (a : integer; b : integer) return integer is
    variable smallest : integer := 1;
  begin
    if (a < b) then
      smallest := a;
    else
      smallest := b;
    end if;
    return smallest;
  end get_min;

  -- purpose: Returns the max(a,b)
  function get_max (a : integer; b : integer) return integer is
    variable biggest : integer := 1;
  begin
    if (a > b) then
      biggest := a;
    else
      biggest := b;
    end if;
    return biggest;
  end get_max;

  -- purpose: Returns the ceiling value of the division by 4
  function div4roundup (data_value : integer) return integer is
    variable div : integer;
  begin
    div := data_value/4;
    if ((data_value mod 4) /= 0) then
      div := div+1;
    end if;
    return div;
  end div4roundup;

  -- purpose: Returns the ceiling value of the division
  -- Data_value - the quantity to be divided, dividend
  -- Divisor - the value to divide the data_value by
  function divroundup (data_value : integer; divisor : integer) return integer is
    variable div : integer;
  begin
    div := data_value/divisor;
    if ((data_value mod divisor) /= 0) then
      div := div+1;
    end if;
    return div;
  end divroundup;



  -- purpose: Returns the floor value of the division
  -- Data_value - the quantity to be divided, dividend
  -- Divisor - the value to divide the data_value by
  function divrounddown (data_value : integer; divisor : integer) return integer is
    variable div : integer;
  begin
    div := data_value/divisor;
    return div;
  end divrounddown;

  -- Purpose:
  --   Round up to the next nearest integer value which is divisible by the
  --    specified number.
  --   Round the number up to the next multiple of a number.
  -- Example:
  --   For the number 7, the nearest higher integer divisible by 2 is 8.
  --   For the number 4, the nearest higher integer divisible by 4 is 4.
  -- Algorithm:
  --   multipleof*roundup(data_value/multipleof)
  -- Parameters:
  --   data_value : number to be rounded
  --   multipleof : value of which the output should be a multiple
  -- Return : data_value rounded up to nearest multiple of "multipleof"
  function roundup_to_multiple(data_value : integer; multipleof : integer) return integer is
    variable retval : integer;
  begin
    retval := data_value/multipleof;
    if ((data_value mod multipleof) /= 0) then
      retval := retval+1;
    end if;
    retval := multipleof * retval;
    return retval;
  end roundup_to_multiple;

-- Purpose: To randomly generate an integer between 0 and maxval.
-- This function is the underlying function for all of the rand_ functions.
--
-- Inputs:
-- seed : Any integer value. Given the same seed, this function will
-- always generate the same output. It is recommended to always
-- use the output of this function as the seed for the next call.
-- maxval : The maximum value allowed. The randomly generated value will
-- not exceed this value.
-- iterations : To a point, more iterations increase "randomness" of
-- output value.
-- feedback_val : Feedback modifier.
--
-- Return:
-- pseudo-random integer from 0 to maxval.
--
-- Details:
-- This function is based on Linear Feedback.
-- Mathematically, the priniciple is the same as the linear feedback shift
-- register, where each iteration is a "clock cycle", and the taps are
-- the feedback_val.
-- The number of iterations and feedback_val can be any value, and will result
-- in a pseudo-random sequence.
-- However, iterations creates more "random" results when > 1.
-- Also, feedback_val is best when a large prime number (like 19).
  function rand_int_base (seed : integer; maxval : integer; iterations : integer; feedback_val : integer) return integer is
    variable ret_val : integer := 0;
  begin
    ret_val := seed;
    for i in 0 to iterations loop
      if ret_val >= maxval/2 then
        ret_val := ret_val * 2 + feedback_val;
      else
        ret_val := ret_val * 2;
      end if;

      while ret_val > maxval loop
        ret_val := ret_val - maxval;
      end loop;
    end loop;  -- i
    return ret_val;
  end rand_int_base;

-- Purpose: To randomly generate an integer between 0 and maxval.
--          (including 0 and maxval)
--
-- Inputs:
-- seed : Any integer value. Given the same seed, this function will
-- always generate the same output. It is recommended to always
-- use the output of this function as the seed for the next call.
-- maxval : The maximum value allowed. The randomly generated value will
-- not exceed this value.
--
-- Return:
-- pseudo-random integer from 0 to maxval.
--
-- Details:
-- This function is based on Linear Feedback.
  function rand_int (seed : integer; maxval : integer) return integer is
    variable ret_val : integer := 0;
  begin
    ret_val := rand_int_base(seed, maxval + 15000, 2, 19);
    while ret_val > maxval loop
      ret_val := ret_val - maxval;
    end loop;
    return ret_val;
  end rand_int;

-- Purpose: To randomly generate a std_logic_vector between 0 and 2^width-1.
--          (including 0 and 2^width-1)
--
-- Inputs:
-- seed : Any integer value. Given the same seed, this function will
-- always generate the same output. It is recommended to always
-- use the output of this function as the seed for the next call.
-- width : The number of bits in the output. (2^width-1 is the maximum
-- random value from this function)
-- Return:
-- pseudo-random std_logic_vector from 0 to 2^width-1.
  function rand_slv_bits (seed : integer; width : integer) return std_logic_vector is
    variable ret_vect : std_logic_vector(width-1 downto 0) := (others => '0');
    variable rand_val : integer                            := seed;
  begin
    for i in 0 to width-1 loop
      rand_val := rand_int(rand_val, 19);
      if rand_val >= 10 then
        ret_vect(i) := '1';
      else
        ret_vect(i) := '0';
      end if;
    end loop;  -- i
    return ret_vect;
  end rand_slv_bits;


-- Purpose: To randomly generate a std_logic_vector between 0 and maxval.
--          (including 0 and maxval)
-- Inputs:
-- seed : Any integer value. Given the same seed, this function will
-- always generate the same output. It is recommended to always
-- use the output of this function as the seed for the next call.
-- width : The number of bits in the output.
-- maxval : The maximum value allowed. This may be less than or
-- equal to 2^width-1.
-- Return:
-- pseudo-random std_logic_vector from 0 to maxval.
  function rand_slv (seed : integer; width : integer; maxval : integer) return std_logic_vector is
    variable ret_vect : std_logic_vector(width-1 downto 0) := (others => '0');
    variable rand_val : integer                            := seed;
  begin
    --Generate a random integer using the seed
    rand_val := rand_int(rand_val, maxval);
    --Put it into a std_logic_vector of the correct size
    ret_vect := int_to_slv(rand_val, width);
    return ret_vect;
  end rand_slv;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_misc
  -----------------------------------------------------------------------------

-- purpose: Returns the index of a specified instance of a specified character in another string
-- Example: What is the index of the third "l" in "Hello World"? =10
-- Inputs:
-- string of characters of any length
-- length of string (number of characters)
-- character to search for
-- number of instance to locate
-- Outputs:
-- integer index value 1 to stringsize, if char exists. Returns 0 if the char
-- was not found.
  function index_in_str(stringtosearch : string; stringsize : integer; char : string; instnum : integer) return integer is
    variable instfound    : integer := 0;
    variable foundatindex : integer := 0;
  begin
    for i in 1 to stringsize loop
      if stringtosearch(i) = char(1) then
        instfound := instfound + 1;
        if instfound = instnum then
          foundatindex := i;
        end if;
      end if;
    end loop;  -- i
    return foundatindex;
  end index_in_str;

--   purpose: Converts a string to all lowercase.
  function lcase(instring : string) return string is
    variable retstring : string (instring'low to instring'high);
  begin
    retstring := instring;
    for i in instring'low to instring'high loop
      case instring(i) is
        when 'A'    => retstring(i) := 'a';
        when 'B'    => retstring(i) := 'b';
        when 'C'    => retstring(i) := 'c';
        when 'D'    => retstring(i) := 'd';
        when 'E'    => retstring(i) := 'e';
        when 'F'    => retstring(i) := 'f';
        when 'G'    => retstring(i) := 'g';
        when 'H'    => retstring(i) := 'h';
        when 'I'    => retstring(i) := 'i';
        when 'J'    => retstring(i) := 'j';
        when 'K'    => retstring(i) := 'k';
        when 'L'    => retstring(i) := 'l';
        when 'M'    => retstring(i) := 'm';
        when 'N'    => retstring(i) := 'n';
        when 'O'    => retstring(i) := 'o';
        when 'P'    => retstring(i) := 'p';
        when 'Q'    => retstring(i) := 'q';
        when 'R'    => retstring(i) := 'r';
        when 'S'    => retstring(i) := 's';
        when 'T'    => retstring(i) := 't';
        when 'U'    => retstring(i) := 'u';
        when 'V'    => retstring(i) := 'v';
        when 'W'    => retstring(i) := 'w';
        when 'X'    => retstring(i) := 'x';
        when 'Y'    => retstring(i) := 'y';
        when 'Z'    => retstring(i) := 'z';
        when others => retstring(i) := instring(i);
      end case;
    end loop;  -- i

    return retstring;

  end lcase;



--   purpose: Converts a string to all uppercase.
  function ucase(instring : string) return string is
    variable retstring : string (instring'low to instring'high);
  begin
    retstring := instring;
    for i in instring'low to instring'high loop
      case instring(i) is
        when 'a'    => retstring(i) := 'A';
        when 'b'    => retstring(i) := 'B';
        when 'c'    => retstring(i) := 'C';
        when 'd'    => retstring(i) := 'D';
        when 'e'    => retstring(i) := 'E';
        when 'f'    => retstring(i) := 'F';
        when 'g'    => retstring(i) := 'G';
        when 'h'    => retstring(i) := 'H';
        when 'i'    => retstring(i) := 'I';
        when 'j'    => retstring(i) := 'J';
        when 'k'    => retstring(i) := 'K';
        when 'l'    => retstring(i) := 'L';
        when 'm'    => retstring(i) := 'M';
        when 'n'    => retstring(i) := 'N';
        when 'o'    => retstring(i) := 'O';
        when 'p'    => retstring(i) := 'P';
        when 'q'    => retstring(i) := 'Q';
        when 'r'    => retstring(i) := 'R';
        when 's'    => retstring(i) := 'S';
        when 't'    => retstring(i) := 'T';
        when 'u'    => retstring(i) := 'U';
        when 'v'    => retstring(i) := 'V';
        when 'w'    => retstring(i) := 'W';
        when 'x'    => retstring(i) := 'X';
        when 'y'    => retstring(i) := 'Y';
        when 'z'    => retstring(i) := 'Z';
        when others => retstring(i) := instring(i);
      end case;
    end loop;  -- i

    return retstring;

  end ucase;



--     purpose: Compares two strings for equality, case dependent
  function case_sensitive_compare(a, b : string) return boolean is
    variable retval : boolean := true;
  begin
    --If strings are not the same length can they not be considered equivalent
    if not(a'length = b'length) then
      retval := false;
    else
      --if strings are the same length
      --compare each character
      for i in a'low to a'high loop
        --if a character doesn't match, return false
        if a(i) /= b(i) then
          retval := false;
        end if;
      end loop;  -- i
    end if;
    return retval;
  end case_sensitive_compare;



--      purpose: Compares two strings for equality, ignoring case differences.
  function case_insensitive_compare(a, b : string) return boolean is
  begin
    return case_sensitive_compare(ucase(a), ucase(b));
  end case_insensitive_compare;

  -----------------------------------------------------------------------------
  -- functions imported from iputils_family
  -----------------------------------------------------------------------------

  -- Wrapper for derived_base.  Required because XCC can't compile functions
  -- which have a default value on an argument, which would be required for the
  -- 'recurse' arg if derived_base was just called derived.  (to avoid infinite recursion)
  function derived (child, ancestor : string) return boolean is
    constant recurse : boolean := true;
  begin
    return derived_base(child, ancestor, recurse);
  end function derived;

  -- Returns 'true' if architecture "child" is derived from, or equal to,
  -- the architecture "ancestor".
  function derived_base (child, ancestor : string; recurse : boolean) return boolean is
    ---------------------------------------------------------------------------
    --
    -- This list of constants needs to be updated when new device families are released!
    --
    -- Use the following Vivado commands to show the list of supported families:
    --   set families [dict create]
    --   foreach part [get_parts] { dict incr families [get_property FAMILY [get_parts $part]] }
    --   puts [dict keys $families]
    --
    -- If you are editing this function, please try to continue with the pattern
    -- already present for the definition of the constants and the if/elsif blocks
    --
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- Any supported device
    ---------------------------------------------------------------------------
    constant any        : string(1 to c_xdevicefamily_str_len) := "any                 ";
    ---------------------------------------------------------------------------
    -- Virtex series
    ---------------------------------------------------------------------------
    --Virtex7
    constant virtex7    : string(1 to c_xdevicefamily_str_len) := "virtex7             ";
    constant avirtex7   : string(1 to c_xdevicefamily_str_len) := "avirtex7            ";
    constant qvirtex7   : string(1 to c_xdevicefamily_str_len) := "qvirtex7            ";
    constant qrvirtex7  : string(1 to c_xdevicefamily_str_len) := "qrvirtex7           ";
    --Virtex7 L - permanently removed
    --Kintex7
    constant kintex7    : string(1 to c_xdevicefamily_str_len) := "kintex7             ";
    constant akintex7   : string(1 to c_xdevicefamily_str_len) := "akintex7            ";
    constant qkintex7   : string(1 to c_xdevicefamily_str_len) := "qkintex7            ";
    constant qrkintex7  : string(1 to c_xdevicefamily_str_len) := "qrkintex7           ";
    --Kintex7 L
    constant kintex7l   : string(1 to c_xdevicefamily_str_len) := "kintex7l            ";
    constant akintex7l  : string(1 to c_xdevicefamily_str_len) := "akintex7l           ";
    constant qkintex7l  : string(1 to c_xdevicefamily_str_len) := "qkintex7l           ";
    constant qrkintex7l : string(1 to c_xdevicefamily_str_len) := "qrkintex7l          ";
    --Artix7
    constant artix7     : string(1 to c_xdevicefamily_str_len) := "artix7              ";
    constant aartix7    : string(1 to c_xdevicefamily_str_len) := "aartix7             ";
    constant qartix7    : string(1 to c_xdevicefamily_str_len) := "qartix7             ";
    constant qrartix7   : string(1 to c_xdevicefamily_str_len) := "qrartix7            ";
    --Artix7 L
    constant artix7l    : string(1 to c_xdevicefamily_str_len) := "artix7l             ";
    constant aartix7l   : string(1 to c_xdevicefamily_str_len) := "aartix7l            ";
    constant qartix7l   : string(1 to c_xdevicefamily_str_len) := "qartix7l            ";
    constant qrartix7l  : string(1 to c_xdevicefamily_str_len) := "qrartix7l           ";
    --Spartan7
    constant spartan7   : string(1 to c_xdevicefamily_str_len) := "spartan7            ";
    constant aspartan7  : string(1 to c_xdevicefamily_str_len) := "aspartan7           ";
    constant qspartan7  : string(1 to c_xdevicefamily_str_len) := "qspartan7           ";
    constant qrspartan7 : string(1 to c_xdevicefamily_str_len) := "qrspartan7          ";
    --Spartan7 L                                                       
    constant spartan7l  : string(1 to c_xdevicefamily_str_len) := "spartan7l           ";
    constant aspartan7l : string(1 to c_xdevicefamily_str_len) := "aspartan7l          ";
    constant qspartan7l : string(1 to c_xdevicefamily_str_len) := "qspartan7l          ";
    constant qrspartan7l: string(1 to c_xdevicefamily_str_len) := "qrspartan7l         ";
    --Zynq
    constant zynq       : string(1 to c_xdevicefamily_str_len) := "zynq                ";
    constant azynq      : string(1 to c_xdevicefamily_str_len) := "azynq               ";
    constant qzynq      : string(1 to c_xdevicefamily_str_len) := "qzynq               ";
    constant qrzynq     : string(1 to c_xdevicefamily_str_len) := "qrzynq              ";
    --VirtexU
    constant virtexu    : string(1 to c_xdevicefamily_str_len) := "virtexu             ";
    constant avirtexu   : string(1 to c_xdevicefamily_str_len) := "avirtexu            ";
    constant qvirtexu   : string(1 to c_xdevicefamily_str_len) := "qvirtexu            ";
    constant qrvirtexu  : string(1 to c_xdevicefamily_str_len) := "qrvirtexu           ";
    --VirtexUL
    constant virtexul   : string(1 to c_xdevicefamily_str_len) := "virtexul            ";
    constant avirtexul  : string(1 to c_xdevicefamily_str_len) := "avirtexul           ";
    constant qvirtexul  : string(1 to c_xdevicefamily_str_len) := "qvirtexul           ";
    constant qrvirtexul : string(1 to c_xdevicefamily_str_len) := "qrvirtexul          ";
    --KintexU
    constant kintexu    : string(1 to c_xdevicefamily_str_len) := "kintexu             ";
    constant akintexu   : string(1 to c_xdevicefamily_str_len) := "akintexu            ";
    constant qkintexu   : string(1 to c_xdevicefamily_str_len) := "qkintexu            ";
    constant qrkintexu  : string(1 to c_xdevicefamily_str_len) := "qrkintexu           ";
    --KintexUL
    constant kintexul   : string(1 to c_xdevicefamily_str_len) := "kintexul            ";
    constant akintexul  : string(1 to c_xdevicefamily_str_len) := "akintexul           ";
    constant qkintexul  : string(1 to c_xdevicefamily_str_len) := "qkintexul           ";
    constant qrkintexul : string(1 to c_xdevicefamily_str_len) := "qrkintexul          ";
    --ArtixU
    constant artixu     : string(1 to c_xdevicefamily_str_len) := "artixu              ";
    constant aartixu    : string(1 to c_xdevicefamily_str_len) := "aartixu             ";
    constant qartixu    : string(1 to c_xdevicefamily_str_len) := "qartixu             ";
    constant qrartixu   : string(1 to c_xdevicefamily_str_len) := "qrartixu            ";
    --ArtixU L
    constant artixul    : string(1 to c_xdevicefamily_str_len) := "artixul             ";
    constant aartixul   : string(1 to c_xdevicefamily_str_len) := "aartixul            ";
    constant qartixul   : string(1 to c_xdevicefamily_str_len) := "qartixul            ";
    constant qrartixul  : string(1 to c_xdevicefamily_str_len) := "qrartixul           ";
    --Spartanu
    constant spartanu   : string(1 to c_xdevicefamily_str_len) := "spartanu            ";
    constant aspartanu  : string(1 to c_xdevicefamily_str_len) := "aspartanu           ";
    constant qspartanu  : string(1 to c_xdevicefamily_str_len) := "qspartanu           ";
    constant qrspartanu : string(1 to c_xdevicefamily_str_len) := "qrspartanu          ";
    --Spartanu L
    constant spartanul  : string(1 to c_xdevicefamily_str_len) := "spartanul           ";
    constant aspartanul : string(1 to c_xdevicefamily_str_len) := "aspartanul          ";
    constant qspartanul : string(1 to c_xdevicefamily_str_len) := "qspartanul          ";
    constant qrspartanul: string(1 to c_xdevicefamily_str_len) := "qrspartanul         ";
    --Zynq Ultrascale (Diablo - 16nm
    constant zynquplus     : string(1 to c_xdevicefamily_str_len) := "zynquplus           ";
    constant azynquplus    : string(1 to c_xdevicefamily_str_len) := "azynquplus          ";
    constant qzynquplus    : string(1 to c_xdevicefamily_str_len) := "qzynquplus          ";
    constant qrzynquplus   : string(1 to c_xdevicefamily_str_len) := "qrzynquplus         ";
    --Zynq Ultrascale (Diablo - 16nm RFSoC)
    constant zynquplusrfsoc     : string(1 to c_xdevicefamily_str_len) := "zynquplusrfsoc      ";
    constant azynquplusrfsoc    : string(1 to c_xdevicefamily_str_len) := "azynquplusrfsoc     ";
    constant qzynquplusrfsoc    : string(1 to c_xdevicefamily_str_len) := "qzynquplusrfsoc     ";
    constant qrzynquplusrfsoc   : string(1 to c_xdevicefamily_str_len) := "qrzynquplusrfsoc    ";
    --KintexU (Diablo - 16nm)
    constant kintexuplus   : string(1 to c_xdevicefamily_str_len) := "kintexuplus         ";
    constant akintexuplus  : string(1 to c_xdevicefamily_str_len) := "akintexuplus        ";
    constant qkintexuplus  : string(1 to c_xdevicefamily_str_len) := "qkintexuplus        ";
    constant qrkintexuplus : string(1 to c_xdevicefamily_str_len) := "qrkintexuplus       ";
    --VirtexU (diablo - 16nm)
    constant virtexuplus   : string(1 to c_xdevicefamily_str_len) := "virtexuplus         ";
    constant avirtexuplus  : string(1 to c_xdevicefamily_str_len) := "avirtexuplus        ";
    constant qvirtexuplus  : string(1 to c_xdevicefamily_str_len) := "qvirtexuplus        ";
    constant qrvirtexuplus : string(1 to c_xdevicefamily_str_len) := "qrvirtexuplus       ";
    ---------------------------------------------------------------------------
    variable is_derived : boolean         := false;

    variable child_i    : string(empty_string'range) := empty_string;
    variable ancestor_i : string(empty_string'range) := empty_string;

  begin

    child_i(1 to child'length)       := child;
    ancestor_i(1 to ancestor'length) := ancestor;

    if
      ---------------------------------------------------------------------------
      -- Virtex series
      ---------------------------------------------------------------------------
      -- Virtex7
      ((child_i = virtex7) and ((ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = avirtex7) and ((ancestor_i = avirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qvirtex7) and ((ancestor_i = qvirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qrvirtex7) and ((ancestor_i = qrvirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      -- Kintex7
      ((child_i = kintex7) and ((ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = akintex7) and ((ancestor_i = akintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qkintex7) and ((ancestor_i = qkintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qrkintex7) and ((ancestor_i = qrkintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      -- Kintex7 L
      ((child_i = kintex7l) and ((ancestor_i = kintex7l) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = akintex7l) and ((ancestor_i = akintex7l) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qkintex7l) and ((ancestor_i = qkintex7l) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qrkintex7l) and ((ancestor_i = qrkintex7l) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      -- Artix7
      ((child_i = artix7) and ((ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = aartix7) and ((ancestor_i = aartix7) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qartix7) and ((ancestor_i = qartix7) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qrartix7) and ((ancestor_i = qrartix7) or (ancestor_i = artix7) or (ancestor_i = any))) or

      -- Artix7 L
      ((child_i = artix7l) and ((ancestor_i = artix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = aartix7l) and ((ancestor_i = aartix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qartix7l) and ((ancestor_i = qartix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qrartix7l) and ((ancestor_i = qrartix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      -- Spartan7
      ((child_i = spartan7) and ((ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = aspartan7) and ((ancestor_i = aspartan7) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qspartan7) and ((ancestor_i = qspartan7) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qrspartan7) and ((ancestor_i = qrspartan7) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      -- Spartan7 L
      ((child_i = spartan7l) and ((ancestor_i = spartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = aspartan7l) and ((ancestor_i = aspartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qspartan7l) and ((ancestor_i = qspartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qrspartan7l) and ((ancestor_i = qrspartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      -- Zynq
      ((child_i = zynq) and ((ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = azynq) and ((ancestor_i = azynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = qzynq) and ((ancestor_i = qzynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = qrzynq) and ((ancestor_i = qrzynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      -- VirtexU
      ((child_i = virtexu) and ((ancestor_i = virtexu) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = avirtexu) and ((ancestor_i = avirtexu) or (ancestor_i = avirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qvirtexu) and ((ancestor_i = qvirtexu) or (ancestor_i = qvirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qrvirtexu) and ((ancestor_i = qrvirtexu) or (ancestor_i = qrvirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      -- VirtexU L
      ((child_i = virtexul) and ((ancestor_i = virtexul) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = avirtexul) and ((ancestor_i = avirtexul) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qvirtexul) and ((ancestor_i = qvirtexul) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qrvirtexul) and ((ancestor_i = qrvirtexul) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      -- KintexU
      ((child_i = kintexu) and ((ancestor_i = kintexu) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = akintexu) and ((ancestor_i = akintexu) or (ancestor_i = akintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qkintexu) and ((ancestor_i = qkintexu) or (ancestor_i = qkintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qrkintexu) and ((ancestor_i = qrkintexu) or (ancestor_i = qrkintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      -- KintexU L
      ((child_i = kintexul) and ((ancestor_i = kintexul) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = akintexul) and ((ancestor_i = akintexul) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qkintexul) and ((ancestor_i = qkintexul) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qrkintexul) and ((ancestor_i = qrkintexul) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      -- ArtixU
      ((child_i = artixu) and ((ancestor_i = artixu) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = aartixu) and ((ancestor_i = aartixu) or (ancestor_i = aartix7) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qartixu) and ((ancestor_i = qartixu) or (ancestor_i = qartix7) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qrartixu) and ((ancestor_i = qrartixu) or (ancestor_i = qrartix7) or (ancestor_i = artix7) or (ancestor_i = any))) or

      -- ArtixU L
      ((child_i = artixul) and ((ancestor_i = artixul) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = aartixul) and ((ancestor_i = aartixul) or (ancestor_i = aartix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qartixul) and ((ancestor_i = qartixul) or (ancestor_i = qartix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      ((child_i = qrartixul) and ((ancestor_i = qrartixul) or (ancestor_i = qrartix7l) or (ancestor_i = artix7) or (ancestor_i = any))) or

      -- SpartanU
      ((child_i = spartanu) and ((ancestor_i = spartanu) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = aspartanu) and ((ancestor_i = aspartanu) or (ancestor_i = aspartan7) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qspartanu) and ((ancestor_i = qspartanu) or (ancestor_i = qspartan7) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qrspartanu) and ((ancestor_i = qrspartanu) or (ancestor_i = qrspartan7) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      -- SpartanU L
      ((child_i = spartanul) and ((ancestor_i = spartanul) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = aspartanul) and ((ancestor_i = aspartanul) or (ancestor_i = aspartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qspartanul) and ((ancestor_i = qspartanul) or (ancestor_i = qspartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      ((child_i = qrspartanul) and ((ancestor_i = qrspartanul) or (ancestor_i = qrspartan7l) or (ancestor_i = spartan7) or (ancestor_i = any))) or

      -- Zynq 16nm (diablo)
      ((child_i = zynquplus) and ((ancestor_i = zynquplus) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = azynquplus) and ((ancestor_i = azynquplus) or (ancestor_i = azynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = qzynquplus) and ((ancestor_i = qzynquplus) or (ancestor_i = qzynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = qrzynquplus) and ((ancestor_i = qrzynquplus) or (ancestor_i = qrzynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      -- Zynq 16nm (caher and hood?) note: zynquplusrfsoc is currently not a
      -- value passed to c_xdevicefamily, but it is to c_family which breaks
      -- convention. Should this ever change such that rfsoc does appear in c_
      -- xdevicefamily,this code will cope. Else this code is harmless  
      ((child_i = zynquplusrfsoc) and ((ancestor_i = zynquplusrfsoc) or (ancestor_i = zynquplus) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = azynquplusrfsoc) and ((ancestor_i = azynquplusrfsoc) or (ancestor_i = azynquplus) or (ancestor_i = azynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = qzynquplusrfsoc) and ((ancestor_i = qzynquplusrfsoc) or (ancestor_i = qzynquplus) or (ancestor_i = qzynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      ((child_i = qrzynquplusrfsoc) and ((ancestor_i = qrzynquplusrfsoc) or (ancestor_i = qrzynquplus) or (ancestor_i = qrzynq) or (ancestor_i = zynq) or (ancestor_i = any))) or

      -- VirtexU
      ((child_i = virtexuplus) and ((ancestor_i = virtexuplus) or (ancestor_i = virtexu) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = avirtexuplus) and ((ancestor_i = avirtexuplus) or (ancestor_i = avirtexu) or (ancestor_i = avirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qvirtexuplus) and ((ancestor_i = qvirtexuplus) or (ancestor_i = qvirtexu) or (ancestor_i = qvirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      ((child_i = qrvirtexuplus) and ((ancestor_i = qrvirtexuplus) or (ancestor_i = qrvirtexu) or (ancestor_i = qrvirtex7) or (ancestor_i = virtex7) or (ancestor_i = any))) or

      -- KintexU
      ((child_i = kintexuplus) and ((ancestor_i = kintexuplus) or (ancestor_i = kintexu) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = akintexuplus) and ((ancestor_i = akintexuplus) or (ancestor_i = akintexu) or (ancestor_i = akintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qkintexuplus) and ((ancestor_i = qkintexuplus) or (ancestor_i = qkintexu) or (ancestor_i = qkintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ((child_i = qrkintexuplus) and ((ancestor_i = qrkintexuplus) or (ancestor_i = qrkintexu) or (ancestor_i = qrkintex7) or (ancestor_i = kintex7) or (ancestor_i = any))) or

      ---------------------------------------------------------------------------
      -- Any other family
      ---------------------------------------------------------------------------
      ((child_i = any) and (ancestor_i = any)) then
      return true;

    end if;

    -- Recursively call derived if there was no match - the case might be wrong
    -- on the child or the ancestor arguments
    if is_derived = false and recurse = true then
--      assert false report "WARNING: derived: No device matched - trying lower-cased child and ancestor" severity warning;
      is_derived := derived_base(lcase(child), lcase(ancestor), false);
    end if;

    return is_derived;
  end derived_base;

  -- Returns true if case insensitive string comparison determines that
  -- str1 and str2 are equal
  function equalIgnoreCase(str1, str2 : string) return boolean is
    constant len1  : integer := str1'length;
    constant len2  : integer := str2'length;
    variable equal : boolean := true;
  begin
    if not (len1 = len2) then
      equal := false;
    else
      equal := case_insensitive_compare(str1, str2);
    end if;
    return equal;
  end equalIgnoreCase;

  -- purpose: checks if the family string passed in is one of the valid families in the
  -- constant list in the header of the 'derived' FUNCTION
  -- If you need to check for specific families, you need to call the derived FUNCTION
  -- as below but with only the family names required in place of "any"
  function valid_family (family : string) return boolean is
  begin  -- FUNCTION valid_family
    return derived(family, "any");
  end function valid_family;

  -- purpose: converts c_xdevicefamily to c_family to make generic checking quicker
  function c_xdevicefamily_to_c_family (xdevicefamily : string) return string is
  begin  -- FUNCTION c_xdevicefamily_to_c_family

    -- PRIORITY MATTERS!!!
    -- The latest devices must be checked against /first/ to ensure that the
    -- derived function returns the expected result

    --check VirtexU-series 16nm devices
    if derived(xdevicefamily, "virtexuplus") then
      return "virtexu";
    end if;

    --check KintexU-series 16nm devices
    if derived(xdevicefamily, "kintexuplus") then
      return "kintexu";
    end if;

    --check Zynq-series 16nm devices
    if derived(xdevicefamily, "zynquplus") then
      return "zynquplus";
    end if;

    --check Zynq-series 16nm rfsoc devices
    if derived(xdevicefamily, "zynquplusrfsoc") then
      return "zynquplusrfsoc";     --there is now a C_FAMILY entry
                                   --zynquplusrfsoc,so there may be a C_
                                   --XDEVICEFAMILY entry in future 
    end if;

    --check VirtexU-series devices
    if derived(xdevicefamily, "virtexu") then
      return "virtexu";
    end if;

    --check KintexU-series devices
    if derived(xdevicefamily, "kintexu") then
      return "kintexu";
    end if;

    --check ArtixU-series devices
    if derived(xdevicefamily, "artixu") then
      return "artixu";
    end if;

    --check SpartanU-series devices
    if derived(xdevicefamily, "spartanu") then
      return "spartanu";
    end if;

    --check Virtex7-series devices
    if derived(xdevicefamily, "virtex7") then
      return "virtex7";
    end if;

    --check Kintex7-series devices
    if derived(xdevicefamily, "kintex7") then
      return "kintex7";
    end if;

    --check Artix7-series devices
    if derived(xdevicefamily, "artix7") then
      return "artix7";
    end if;

    --check Spartan7-series devices
    if derived(xdevicefamily, "spartan7") then
      return "spartan7";
    end if;

    --check Zynq-series devices
    if derived(xdevicefamily, "zynq") then
      return "zynq";
    end if;

    -- if none of the above conditionals have returned,
    -- return a sensible error string instead
    -- ** This assert doesn't compile with XCC **
--    assert false report "ERROR: bip_utils_pkg_v3_0:c_xdevicefamily_to_c_family - invalid c_xdevicefamily caught: " & xdevicefamily severity error;
    return "bad_c_xdevicefamily";

  end function c_xdevicefamily_to_c_family;

  -----------------------------------------------------------------------------
  -- note that we have to use the string representations of the family names in
  -- these functions because the constants are declared locally in the 'derived'
  -- function.  We cannot declare them globally otherwise they clash with the
  -- enumerated device names in pkg_baseblox
  -----------------------------------------------------------------------------

  -- purpose: returns true if the device family passed in as the argument contains DSP48* primitives
  function has_dsp (family : string) return boolean is
  begin  -- FUNCTION has_dsp
    return has_dsp48e1(family) or has_dsp48e2(family);
  end function has_dsp;

  -- purpose: returns true if the device family passed in as the argument contains DSP48 blocks
  function has_dsp48 (family : string) return boolean is
  begin  -- FUNCTION has_dsp48
    return false;
  end function has_dsp48;

  -- purpose: returns true if the device family passed in as the argument contains DSP48E blocks
  function has_dsp48e (family : string) return boolean is
  begin  -- FUNCTION has_dsp48e
    return false;
  end function has_dsp48e;

  -- purpose: returns true if the device family passed in as the argument contains DSP48E1 blocks
  function has_dsp48e1 (family : string) return boolean is
  begin  -- FUNCTION has_dsp48e1
    return ((c_xdevicefamily_to_c_family(family) = "virtex7") or
            (c_xdevicefamily_to_c_family(family) = "kintex7") or
            (c_xdevicefamily_to_c_family(family) = "artix7") or
            (c_xdevicefamily_to_c_family(family) = "spartan7") or
            (c_xdevicefamily_to_c_family(family) = "zynq"));
  end function has_dsp48e1;

  -- purpose: returns true if the device family passed in as the argument contains DSP48E2 blocks
  function has_dsp48e2 (family : string) return boolean is
  begin  -- FUNCTION has_dsp48e2
    return ((c_xdevicefamily_to_c_family(family) = "zynquplus") or --no need for vup or kup as these map to vu/ku
            (c_xdevicefamily_to_c_family(family) = "artixu") or
            (c_xdevicefamily_to_c_family(family) = "spartanu") or
            (c_xdevicefamily_to_c_family(family) = "virtexu") or
            (c_xdevicefamily_to_c_family(family) = "kintexu"));
  end function has_dsp48e2;

  -- purpose: returns true if the device family passed in as the argument contains DSP48A blocks
  -- Pad strings to avoid warnings from tools
  function has_dsp48a (family : string) return boolean is
  begin  -- FUNCTION has_dsp48a
    return false;
  end function has_dsp48a;

  -- purpose: returns true if the device family passed in as the argument contains DSP48A1 blocks
  function has_dsp48a1 (family : string) return boolean is
  begin  -- FUNCTION has_dsp48a1
    return false;
  end function has_dsp48a1;

  -- purpose: returns true if the device family passed in as the argument contains MULT18X18(S) blocks
  function has_mult18x18 (family : string) return boolean is
  begin  -- FUNCTION has_mult18
    return false;
  end function has_mult18x18;

  -- purpose: wrapper for has_mult18x18
  function has_mult18x18s (family : string) return boolean is
  begin  -- FUNCTION has_mult18x18s
    return false;
  end function has_mult18x18s;

  -- purpose: returns true if the device family passed in as the argument contains MULT18X18SIO blocks
  function has_mult18x18sio (family : string) return boolean is
  begin  -- FUNCTION has_mult18x18sio
    return false;
  end function has_mult18x18sio;

  -- purpose: returns true if the device family passed in as the argument contains SRLC16(E) primitives
  function has_SRLC16E (family : string) return boolean is
  begin  -- FUNCTION has_SRLC16E
    return
      derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "virtexu") or
      derived(family, "kintexu") or
      derived(family, "zynquplus") or
      derived(family, "virtexuplus") or
      derived(family, "kintexuplus");
  end function has_SRLC16E;

  -- purpose: returns true if the device family passed in as the argument contains SRLC32E primitives
  function has_SRLC32E (family : string) return boolean is
  begin  -- FUNCTION has_SRLC32E
    return
      derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus");
  end function has_SRLC32E;

  -- purpose: returns true if the family in question has 4-input LUTs
  function has_lut4 (family : string) return boolean is
  begin  -- FUNCTION has_lut4
    return false;
  end function has_lut4;

  -- purpose: returns true if the family in question has 6-input LUTs
  function has_lut6 (family : string) return boolean is
  begin  -- FUNCTION has_lut6
    return
      derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus");
  end function has_lut6;

  -- purpose: returns true if the family in question has MUXF7s
  function has_f7mux (family : string) return boolean is
  begin  -- FUNCTION has_f7mux
    return
      derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus");
  end function has_f7mux;

  -- purpose: returns true if the family in question has MUXF8s
  function has_f8mux (family : string) return boolean is
  begin  -- FUNCTION has_f8mux
    return
      derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus");
  end function has_f8mux;

  -- purpose: returns true if the family in question has MUXF9s
  function has_f9mux (family : string) return boolean is
  begin  -- FUNCTION has_f9mux
    return
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus");
  end function has_f9mux;

  -----------------------------------------------------------------------------
  -- 'Supports' Suite of functions
  -- return 0 (c_no_support) if family does not support primitive
  -- return 1 (c_native_support) if family has the primitive
  -- return 2 (c_retarget_support) if family supports the primitive via retargetting
  -----------------------------------------------------------------------------
  function supports_dsp48 (family : string) return integer is
  begin  -- FUNCTION supports_dsp48
    if has_dsp48e1(family) or has_dsp48e2(family) then
      return 2;
    end if;
    return 0;
  end function supports_dsp48;

  function supports_dsp48e (family : string) return integer is
  begin  -- FUNCTION supports_dsp48e
    if has_dsp48e1(family) or has_dsp48e2(family) then
      return 2;
    end if;
    return 0;
  end function supports_dsp48e;

  function supports_dsp48e1 (family : string) return integer is
  begin  -- FUNCTION supports_dsp48e
    if has_dsp48e1(family) then
      return 1;
    elsif has_dsp48e2(family) then
      return 2;
    end if;
    return 0;
  end function supports_dsp48e1;

  function supports_dsp48e2 (family : string) return integer is
  begin  -- FUNCTION supports_dsp48e2
    if has_dsp48e2(family) then
      return 1;
    end if;
    return 0;
  end function supports_dsp48e2;

  function supports_dsp48a (family : string) return integer is
  begin  -- FUNCTION supports_dsp48a
    return 0;
  end function supports_dsp48a;

  function supports_dsp48a1 (family : string) return integer is
  begin  -- FUNCTION supports_dsp48a1
    return 0;
  end function supports_dsp48a1;

  function supports_mult18x18 (family : string) return integer is
  begin  -- FUNCTION supports_mult18
    if has_dsp48e1(family) or has_dsp48e2(family) then
      return 2;
    end if;
    return 0;
  end function supports_mult18x18;

  function supports_mult18x18s (family : string) return integer is
  begin  -- FUNCTION supports_mult18x18s
    if has_dsp48e1(family) or has_dsp48e2(family) then
      return 2;
    end if;
    return 0;
  end function supports_mult18x18s;

  function supports_mult18x18sio (family : string) return integer is
  begin  -- FUNCTION supports_mult18x18sio
    return 0;
  end function supports_mult18x18sio;

  function supports_SRLC16E (family : string) return integer is
  begin  -- FUNCTION supports_SRLC16E
    if has_lut6(family) then
      return 2;
    end if;
    return 0;
  end function supports_SRLC16E;

  function supports_SRLC32E (family : string) return integer is
  begin  -- FUNCTION supports_SRLC32E
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 1;
    end if;
    return 0;
  end function supports_SRLC32E;

  function supports_lut4 (family : string) return integer is
  begin  -- FUNCTION supports_lut4
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 1;
  end function supports_lut4;

  function supports_lut6 (family : string) return integer is
  begin  -- FUNCTION supports_lut6
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 1;
    end if;
    return 0;
  end function supports_lut6;

  -- This is the RAMB16 with the built-in output registers (DOA_REG, DOB_REG)
  function supports_RAMB16 (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB16;

  -- This is the RAMB16 that doesn't have the optional output register
  function supports_RAMB16_S_S (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB16_S_S;

  function supports_RAMB16BWE (family : string) return integer is
  begin
    return 0;
  end function supports_RAMB16BWE;

  function supports_RAMB16BWER (family : string) return integer is
  begin
    return 0;
  end function supports_RAMB16BWER;

  function supports_RAMB18 (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB18;

  function supports_RAMB18E1 (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") then
      return 1;
    elsif derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB18E1;

  function supports_RAMB18E2 (family : string) return integer is
  begin
    if derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 1;
    end if;
    return 0;
  end function supports_RAMB18E2;

  function supports_RAMB36 (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB36;

  function supports_RAMB36E1 (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") then
      return 1;
    elsif derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB36E1;

  function supports_RAMB36E2 (family : string) return integer is
  begin
    if derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 1;
    end if;
    return 0;
  end function supports_RAMB36E2;

  function supports_RAMB8BWER (family : string) return integer is
  begin
    return 0;
  end function supports_RAMB8BWER;

  -- The RAMB18SDP and RAMB36SDP are different in Virtex-5 and Virtex-6
  -- See BRAM usage doc for more details
  function supports_RAMB18SDP (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB18SDP;

  function supports_RAMB36SDP (family : string) return integer is
  begin
    if derived(family, "virtex7") or
      derived(family, "kintex7") or
      derived(family, "artix7") or
      derived(family, "spartan7") or
      derived(family, "zynq") or
      derived(family, "kintexu") or
      derived(family, "virtexu") or
      derived(family, "zynquplus") or
      derived(family, "kintexuplus") or
      derived(family, "virtexuplus") then
      return 2;
    end if;
    return 0;
  end function supports_RAMB36SDP;

  function supports_URAM (family : string; device : string := "") return integer is
    constant local_device : string := lcase(device);
  begin
    if derived(family, "virtexuplus") then
      -- All devices have URAM
      return 1;
    elsif derived(family, "zynquplus") then
      if device = "" then
        -- Default to this clause for safety
        assert false report "ERROR: A second argument (use C_XDEVICE generic) must be specified to correctly determine URAM presence in this device" severity error;
      elsif local_device = "xczu2eg" or
        local_device = "xczu3eg" or
        local_device = "xczu6eg" or
        local_device = "xczu9eg" then
        -- These devices have no URAM according to http://www.xilinx.com/support/documentation/selection-guides/zynq-ultrascale-plus-product-selection-guide.pdf
        return 0;
      elsif local_device = "xczu4ev" or
        local_device = "xczu5ev" or
        local_device = "xczu7ev" or
        local_device = "xczu15eg" or
        local_device = "xczu11eg" or
        local_device = "xczu17eg" or
        local_device = "xczu19eg"
      then
        return 1;
      else
        assert false report "ERROR: Unrecognized device " & local_device severity error;
        return 0;
      end if;
    elsif derived(family, "kintexuplus") then
      if device = "" then
        -- Default to this clause for safety
        assert false report "ERROR: A second argument (use C_XDEVICE generic) must be specified to correctly determine URAM presence in this device" severity error;
      elsif local_device = "xcku9p" then
        -- These devices have no URAM according to http://www.xilinx.com/products/silicon-devices/fpga/kintex-ultrascale-plus.html
        return 0;
      elsif local_device = "xcku3p" or
        local_device = "xcku7p" or
        local_device = "xcku11p" or
        local_device = "xcku15p" or
        local_device = "xcku5p" or
        local_device = "xcku13p"
      then
        return 1;
      else
        assert false report "ERROR: Unrecognized device " & local_device severity error;
        return 0;
      end if;
    end if;
    return 0;
  end function supports_URAM;

  -----------------------------------------------------------------------------
  -- Family-related functions moved here from bip_usecase_utils_pkg
  -----------------------------------------------------------------------------

  function fn_dsp48_a_width (p_xdevicefamily : string) return integer is
  begin
    return ci_dsp48e1_a_width;
  end function fn_dsp48_a_width;

  function fn_dsp48_b_width (p_xdevicefamily : string) return integer is
  begin
    return ci_dsp48e1_b_width;
  end function fn_dsp48_b_width;

  function fn_dsp48_amult_width (p_xdevicefamily : string) return integer is
  begin
    if supports_dsp48e2(p_xdevicefamily) > 0 then
      return ci_dsp48e2_amult_width;
    else
      return ci_dsp48e1_amult_width;
    end if;
  end function fn_dsp48_amult_width;

  function fn_dsp48_amultcin_width (p_xdevicefamily : string; p_use_acin : integer) return integer is
  begin
    if supports_dsp48e2(p_xdevicefamily) > 0 and p_use_acin = 1 then
      return ci_dsp48e2_a_width;
    elsif supports_dsp48e2(p_xdevicefamily) > 0 and p_use_acin = 0 then
      return ci_dsp48e2_amult_width;
    elsif supports_dsp48e1(p_xdevicefamily) > 0 and p_use_acin = 1 then
      return ci_dsp48e1_a_width;
    else
      return ci_dsp48e1_amult_width;
    end if;
  end function fn_dsp48_amultcin_width;

  function fn_dsp48_c_width (p_xdevicefamily : string) return integer is
  begin
    return ci_dsp48e1_c_width;
  end function fn_dsp48_c_width;

  function fn_dsp48_d_width (p_xdevicefamily : string) return integer is
  begin
    if supports_dsp48e2(p_xdevicefamily) > 0 then
      return ci_dsp48e2_d_width;
    else
      return ci_dsp48e1_d_width;
    end if;
  end function fn_dsp48_d_width;

  function fn_dsp48_concat_width (p_xdevicefamily : string) return integer is
  begin
    -- Same for both DSP48E1 and DSP48E2
    return ci_dsp48e1_a_width + ci_dsp48e1_b_width;
  end function fn_dsp48_concat_width;

  function fn_dsp48_preadd_width (p_xdevicefamily : string) return integer is
  begin
    if supports_dsp48e2(p_xdevicefamily) > 0 then
      return ci_dsp48e2_amult_width;
    else
      return ci_dsp48e1_amult_width;
    end if;
  end fn_dsp48_preadd_width;

  function fn_dsp48_add3_x_width (p_xdevicefamily : string) return integer is
  begin
    return fn_dsp48_concat_width(p_xdevicefamily);
  end fn_dsp48_add3_x_width;

  function fn_dsp48_p_width (p_xdevicefamily : string) return integer is
  begin
    return ci_dsp48e1_p_width;
  end function fn_dsp48_p_width;

  -----------------------------------------------------------------------------
  -- New Routines
  -----------------------------------------------------------------------------

  --This function gives a robust way of assigning a string to a string where
  --the lengths and directions may not match.
  function str_to_bound_str (
    instring  : string;                 -- unknown direction
    outlength : integer;                -- return string length
    pad       : string)                 -- fill pattern character
    return string is
    variable ret       : string(1 to outlength);
    constant rectified : string(1 to instring'length) := instring;
    constant inlength  : integer                      := instring'length;
  begin  -- str_to_bound_str
    for i in ret'range loop
      ret(i) := pad(pad'right);  --in case some eejit makes pad > 1 character
    end loop;
    if outlength >= inlength then
      ret(ret'left+outlength-inlength to ret'right) := rectified;
    else
      ret := rectified(rectified'left+inlength-outlength to rectified'right);
    end if;
    return ret;
  end str_to_bound_str;


  -- xcc exclude
  -----------------------------------------------------------------------------
  -- File I/O routines
  -----------------------------------------------------------------------------

  -- Function to read a MIF file and place the data in a STD_LOGIC_VECTOR
  -- Takes parameters:
  --   filename : Name of the file from which to read data
  --   depth    : Depth of memory in words
  --   width    : Width of memory in bits
  --   lines    : Number of lines to be read from file
  --              If the file has fewer lines then only the available
  --              data is read. If lines > depth then the return vector
  --              is padded with '0's.
  impure function read_meminit_file(filename : in string; depth, width, lines : in positive) return std_logic_vector is
    file meminitfile     : text;
    variable mif_status  : file_open_status;
    variable bit         : integer;
    variable bitline     : line;
    variable bitchar     : character;
    variable bits_good   : boolean;
    variable offset      : integer                                  := 0;
    variable total_lines : integer;
    variable num_lines   : integer                                  := 0;
    variable mem_vector  : string(width downto 1);
    variable return_vect : std_logic_vector(width*lines-1 downto 0) := (others => '0');
  begin

    file_open(mif_status, meminitfile, filename, read_mode);  -- does not compile with XCC when using xbld
--    meminitfile := file_open(mif_status, filename, read_mode); -- works with XCC

    assert mif_status = open_ok report "Error: couldn't open MIF file " & filename severity failure;

    if mif_status = open_ok then

      if (lines > 0 and lines <= depth) then
        total_lines := lines;
      else
        total_lines := depth;
      end if;

      while (not(ENDFILE(meminitfile)) and (num_lines < total_lines)) loop
        READLINE(meminitfile, bitline);
        exit when endfile(meminitfile);  -- XST safety net
        READ(bitline, mem_vector, bits_good);
        assert bits_good report "Error: problem reading MIF file " & filename severity failure;
        for bit in 0 to width-1 loop
          bitchar := mem_vector(bit+1);
          if (bitchar = '1') then
            return_vect(offset+bit) := '1';
          else
            return_vect(offset+bit) := '0';
          end if;
        end loop;  -- FOR
        num_lines := num_lines+1;
        offset    := offset + width;
      end loop;  -- WHILE
    end if;  -- mif_status

    -- close the file being read from
    file_close(meminitfile);

    return return_vect;

  end read_meminit_file;

  impure function write_meminit_file(filename : in string; depth, width : in positive; memvect : in std_logic_vector) return boolean is
    file meminitfile        : text;
    variable mif_status     : file_open_status;
    variable addrs          : integer;
    variable bit            : integer;
    variable bitline        : line;
    variable bitstring      : string(width downto 1);
    variable slv            : std_logic_vector(width downto 1);
    variable offset         : integer;
    variable contents       : std_logic_vector(1 to width);
    constant mem_bits       : integer := depth * width;
    constant vec_bits       : integer := memvect'length;
    variable padded_memvect : std_logic_vector(1 to mem_bits);
    variable check_ok       : boolean;
  begin

    assert false report "writing MIF " & filename severity note;

    -- created a padded out vector that has the same number of bits in it as is specified by mem_bits
    padded_memvect(1 to memvect'length) := memvect;

    if memvect'length < mem_bits then
      padded_memvect(memvect'length+1 to mem_bits) := (others => '0');
    end if;

    file_open(mif_status, meminitfile, filename, write_mode);  -- does not compile with XCC when using xbld
--    meminitfile := file_open(mif_status, filename, read_mode); -- works with XCC

    assert mif_status = open_ok
      report "Error: couldn't open memory initialization file."
      severity failure;

    if mif_status = open_ok then
      offset := 0;
      for addrs in 0 to depth-1 loop
        contents := padded_memvect(padded_memvect'high-offset-width+1 to padded_memvect'high-offset);
        write(bitline, slv_to_bv(slv));  -- convert the SLV to a BV to use std.textio.write function
        writeline(meminitfile, bitline);
        offset   := offset + width;
      end loop;  -- addrs
    end if;  -- mif_status
    -- close the file we wrote to
    FILE_CLOSE(meminitfile);
    return true;                        -- XCC requires a return value
  end write_meminit_file;
  -- xcc include

  -----------------------------------------------------------------------------
  -- Simulation functions moved from ul_utils
  -----------------------------------------------------------------------------

  function anyX(vect : std_logic_vector) return boolean is
  begin
    for i in vect'range loop
      if (rat(vect(i)) = 'X') then
        return true;
      end if;
    end loop;
    return false;
  end anyX;

  function any0(vect : std_logic_vector) return boolean is
  begin
    for i in vect'range loop
      if (rat(vect(i)) = '0') then
        return true;
      end if;
    end loop;
    return false;
  end any0;

  function setallX(width : integer) return std_logic_vector is
    variable vect : std_logic_vector(width-1 downto 0);
  begin
    for i in 0 to width-1 loop
      vect(i) := 'X';
    end loop;
    return vect;
  end setallX;

  function setall0(width : integer) return std_logic_vector is
    variable vect : std_logic_vector(width-1 downto 0);
  begin
    for i in 0 to width-1 loop
      vect(i) := '0';
    end loop;
    return vect;
  end setall0;

  -----------------------------------------------------------------------------
  -- Start of code lifted from pkg_baseblox
  -----------------------------------------------------------------------------
  function fn_select_sync_enable (
    sync_enable : integer               -- the legacy type
    )
    return T_SYNC_ENABLE is
  begin
    case sync_enable is
      when c_override =>
        return SYNC_OVERRIDES_CE;
      when c_no_override =>
        return CE_OVERRIDES_SYNC;
      when others =>
        assert false report "illegal value of sync_enable. Defaulting to sync_overrides_ce" severity warning;
        return SYNC_OVERRIDES_CE;
    end case;
  end;  --fn_select_sync_enable

  function fn_select_bypass_enable (
    bypass_enable : integer             -- the legacy type
    )
    return T_BYPASS_ENABLE is
  begin
    case bypass_enable is
      when c_override =>
        return BYPASS_OVERRIDES_CE;
      when c_no_override =>
        return CE_OVERRIDES_BYPASS;
      when others =>
        assert false report "illegal value of BYPASS_enable. Defaulting to BYPASS_overrides_ce" severity warning;
        return BYPASS_OVERRIDES_CE;
    end case;
  end;  --fn_select_BYPASS_enable

  function fn_select_sync_priority (
    sync_priority : integer             -- the legacy type
    )
    return T_REG_PRIORITY is
  begin
    case sync_priority is
      when c_set =>
        return SET_OVERRIDES_RESET;
      when c_clear =>
        return RESET_OVERRIDES_SET;
      when others =>
        assert false report "illegal value of sync_priority. Defaulting to reset overrides set" severity warning;
        return RESET_OVERRIDES_SET;
    end case;
  end;  --fn_select_sync_priority

  function fn_select_reg_type (
    reg_type : integer                  -- the legacy type
    )
    return T_REGTYPE is
  begin
    case reg_type is
      when c_reg_undefined =>
        assert false report "Undefined Register type. Must be FF or latch" severity warning;
        return REGTYPE_FD;
      when c_reg_fd =>
        return REGTYPE_FD;
      when c_reg_ld =>
        return REGTYPE_LD;
      when others =>
        assert false report "Unknown Register type. Must be FF or latch" severity warning;
        return REGTYPE_FD;
    end case;
  end;  --fn_select_reg_type

  function fn_select_add_mode(add_mode : integer) return T_ADD_MODE is
    variable ret_val : T_ADD_MODE;
  begin
    case add_mode is
      when c_add     => ret_val := MODE_ADD;
      when c_sub     => ret_val := MODE_SUB;
      when c_add_sub => ret_val := MODE_ADDSUB;
      when others =>
        assert false report "Invalid add mode value. Must be add, subtract, or add/subtract. Defaulting to add" severity warning;
        ret_val := MODE_ADD;
    end case;
    return ret_val;
  end;

  function fn_select_number_format(number_format : integer) return T_NUMBER_FORMAT is
    variable ret_val : T_NUMBER_FORMAT;
  begin
    case number_format is
      when c_signed   => ret_val := NUM_SIGNED;
      when c_unsigned => ret_val := NUM_UNSIGNED;
      when c_pin      => ret_val := NUM_PIN;
      when others =>
        assert false report "Invalid number format specified. Must be c_signed, c_unsigned or c_pin. Defaulting to c_signed" severity warning;
        ret_val := NUM_SIGNED;
    end case;
    return ret_val;
  end;

  -- original purpose: Checks the family generic string for a valid device family name
  -- and provides a sensible default if it is not specified or misspelt
  -- We define an 8-character string and put the family string into it.
  -- This avoids the warning from synthesis that the string lengths in the IF statement
  -- comparisons are different lengths.
  -- However, this is only now used to return a T_DEVICE_FAMILY value which is
  -- then used to determine LUT size. Since LUT size is always 6 in Vivado-
  -- supported devices, this function now always returns VIRTEX7.
  function fn_check_family(family : string) return T_DEVICE_FAMILY is
    variable fam : string(1 to c_xdevicefamily_str_len) := "                    ";
  begin  -- FUNCTION fn_check_family

    return VIRTEX7;
--    report "Note: use of this function is not recommended. Use has_lut4 and has_lut6 instead."
--      severity note;
    -- Have to assign character by character for VTFC support
    -- The original code was:
    --fam(1 to family'length) := family;
    
--    for i in 1 to family'length loop
--      fam(i) := family(i);
--    end loop;  -- i

--    if fam = "virtex7             " then
--      return VIRTEX7;
--    elsif fam = "kintex7             " then
--      return KINTEX7;
--    elsif fam = "artix7              " then
--      return ARTIX7;
--    elsif fam = "spartan7            " then
--      return SPARTAN7;
--    elsif fam = "zynq                " then
--      return ZYNQ;
--    elsif fam = "kintexu             " then
--      return KINTEXU;
--    elsif fam = "virtexu             " then
--      return VIRTEXU;
--    else
--      assert false
--        report "Note: Defaulting to Virtex7"
--        severity note;
--      return VIRTEX7;
--    end if;
  end;

  --The following utility function calculates the number of synchronous
  --controls which must be gated into the logic for the d input of a register
  --This can be useful in optimising logic to the register.
  function fn_syncs_in_d_lut (
    has_sclr, has_sset, has_sinit, has_aclr, has_aset, has_ainit : integer  -- the legacy type
    )
    return integer is
  begin
    if has_aclr = 0 and has_aset = 0 and has_ainit = 0 then
      return 0;
    elsif has_sinit /= 0 then
      return 1;
    elsif has_sclr = 0 then
      if has_sset = 0 then
        return 0;
      else
        return 1;
      end if;
    else
      if has_sset = 0 then
        return 1;
      else
        return 2;
      end if;
    end if;
  end;  --fn_select_reg_type

-- purpose: Determines the LUT size used in the target architecture specified by device_family
  function fn_get_lut_size(device_family : T_DEVICE_FAMILY) return integer is
  begin  -- FUNCTION fn_get_lut_size
    return 6;
  end function fn_get_lut_size;


  -- purpose: Determines what the POR value should be from the register controls that are present
  function fn_get_por_value(c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit : integer;
                            ainit_val, sinit_val                                                     : std_logic_vector;
                            c_width                                                                  : integer) return std_logic_vector is
    variable ret : std_logic_vector(c_width downto 1);
  begin  -- FUNCTION fn_get_por_value
    -- define power-up value
    if c_has_aclr /= 0 then
      ret := (others => '0');
    elsif c_has_aset /= 0 then
      ret := (others => '1');
    elsif c_has_ainit /= 0 then
      ret := ainit_val;
    elsif (c_has_sclr /= 0) then
      ret := (others => '0');
    elsif (c_has_sset /= 0) then
      ret := (others => '1');
    elsif (c_has_sinit /= 0) then
      ret := sinit_val;
    else
      ret := ainit_val;
    end if;
    return ret;
  end function fn_get_por_value;

end xbip_utils_v3_0_7_pkg;


-- $Id: xcc_utils_v3_0.vhd,v 1.5 2010/03/19 10:37:35 julian Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 1995-2006 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------------------
--LIBRARY IEEE;
--USE IEEE.std_logic_1164.ALL;
--
--LIBRARY std;
--USE std.standard.ALL;
package xcc_utils_v3_0 is

  function sel_lines_reqd (p_width : integer) return integer;

end xcc_utils_v3_0;

package body xcc_utils_v3_0 is

  -- purpose: Returns the number of mux address lines needed to address a bus of the width input. Log2 rounded up
  --Note: deliberately returns 1 for width = 1 or 0, so that exception code is
  --not required for extremely small buses
  function sel_lines_reqd (p_width : integer) return integer is
    variable ret_val : integer := 0;
    variable max_bus : integer := 0;
  begin  -- sel_lines_reqd
    assert p_width >= 0 report "Illegal (negative) value input to sel_lines_reqd (xcc_utils)" severity ERROR;
    ret_val := 1;
    max_bus := 2;
    while ret_val < 1000 loop
      if max_bus >= p_width then
        return ret_val;
      end if;
      ret_val := ret_val +1;
      max_bus := max_bus + max_bus;     --*2, but + should be faster to execute.
    end loop;
    return ret_val;                         --unnecessary, but silences an xst warning
  end sel_lines_reqd;

end xcc_utils_v3_0;



