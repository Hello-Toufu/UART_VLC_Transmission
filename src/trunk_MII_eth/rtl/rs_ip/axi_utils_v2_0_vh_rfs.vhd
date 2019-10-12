------------------------------------------------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/axi_utils_v2_0_3/hdl/global_util_pkg.vhd,v 1.1 2011/02/02 12:20:40 gordono Exp $
------------------------------------------------------------------------------------------------------------------------
--
--  (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------------------------------------------------------------------
--
--  Title: global_util_pkg.vhd
--  Author: David Andrews
--  Date  : August 2008
--  Description: Define global utility functions.
--               In general functions/types/constants that are not project specific are defined here.
--
--               Project specific functions/types/constants are defined in the
--               global_func_pkg/global_types_pkg/global_const_pkg packages
--
------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package global_util_pkg is

  ------------------------------------------------------------------------------------------------------------------------
  --Useful Xilinx attributes
  attribute use_carry_chain      : string;
  attribute register_duplication : string;
  attribute use_clock_enable     : string;
  attribute use_sync_set         : string;
  attribute use_sync_reset       : string;
  attribute keep_hierarchy       : string;
  attribute signal_encoding      : string;
  attribute fsm_encoding         : string;
  attribute keep                 : string;
  attribute shreg_extract        : string;


  ------------------------------------------------------------------------------------------------------------------------
  --Generic integer vector
  type GLB_IntegerVector is array(natural range <>) of integer;

  --Generic natural vector
  type GLB_NaturalVector is array(natural range <>) of natural;

  --Generic positive vector
  type GLB_PositiveVector is array(natural range <>) of positive;

  --Generic real vector
  type GLB_RealVector is array(natural range <>) of real;

  --Boolean vector
  type GLB_BooleanVector is array(natural range <>) of boolean;

  ------------------------------------------------------------------------------------------------------------------------
  --Functions for determining environment

  --True if this is simulation
  function GLB_is_simulation return boolean;

  --True if this is synthesis/implementation
  function GLB_is_synthesis return boolean;

  ------------------------------------------------------------------------------------------------------------------------
  --Functions for reducing boolean vectors

  --True if any of the elements of a boolean_vector are true
  function GLB_any_true(v : GLB_BooleanVector) return boolean;

  --True if any of the elements of a boolean_vector are false
  function GLB_any_false(v : GLB_BooleanVector) return boolean;

  --True if all of the elements of a boolean_vector are true
  function GLB_all_true(v : GLB_BooleanVector) return boolean;

  --True if all of the elements of a boolean_vector are false
  function GLB_all_false(v : GLB_BooleanVector) return boolean;

  ------------------------------------------------------------------------------------------------------------------------
  --Calculate ceil(log2(x))
  function GLB_log2(x : natural) return natural;

  --Calculate min(ceil(log2(x)),y) (i.e. log2min(x,1) is always >=1)
  function GLB_log2min(x, y : natural) return natural;

  --Calculate next power-of-2 >=x
  function GLB_next_pow2(x : natural) return natural;

  --Find bit number of LSB/MSB in x
  function GLB_find_lsb(x : natural) return natural;
  function GLB_find_msb(x : natural) return natural;

  ------------------------------------------------------------------------------------------------------------------------
  --Return true if log2(x)==ceil(log2(x))
  function GLB_is_pow2(x : natural) return boolean;

  --Return true if x is even
  function GLB_is_even(x : integer) return boolean;
  function GLB_is_even(x : unsigned) return boolean;
  function GLB_is_even(x : signed) return boolean;

  --Return true if x is odd
  function GLB_is_odd(x : integer) return boolean;
  function GLB_is_odd(x : unsigned) return boolean;
  function GLB_is_odd(x : signed) return boolean;

  --Select a value based on boolean [equivalent to (cond ? v_true : v_false) in C/C++/Verilog]
  --  Overloaded for lots of useful types
  function GLB_if(cond : boolean; v_true, v_false : integer) return integer;
  function GLB_if(cond : boolean; v_true, v_false : real) return real;
  function GLB_if(cond : boolean; v_true, v_false : string) return string;
  function GLB_if(cond : boolean; v_true, v_false : std_logic) return std_logic;
  function GLB_if(cond : boolean; v_true, v_false : std_logic_vector) return std_logic_vector;
  function GLB_if(cond : boolean; v_true, v_false : signed) return signed;
  function GLB_if(cond : boolean; v_true, v_false : unsigned) return unsigned;
  function GLB_if(cond : boolean; v_true, v_false : time) return time;
  function GLB_if(cond : boolean; v_true, v_false : character) return character;
  function GLB_if(cond : boolean; v_true, v_false : boolean) return boolean;
  function GLB_if(cond : std_logic; v_true, v_false : std_logic) return std_logic;

  --Convert a boolean to std_logic (false->'0', true->'1')
  function GLB_to_std_logic(x : boolean) return std_logic;
  function GLB_to_sl(x        : boolean) return std_logic;

  --Convert a boolean to bit (false->'0', true->'1')
  function GLB_to_bit(x : boolean) return bit;

  --Convert a number to boolean (0->false, anything else->true)
  function GLB_to_boolean(x : integer) return boolean;
  function GLB_to_boolean(x : real) return boolean;

  --Convert a std_logic to boolean ('1/H'->true, anything else->false)
  function GLB_to_boolean(x : std_logic) return boolean;

  --Convert a boolean to integer (true->1, anything else->0)
  function GLB_to_integer(x : boolean) return integer;
  function GLB_to_integer(x : std_logic) return integer;

  --Return minimum of a pair of values
  function GLB_min(a, b : integer) return integer;
  function GLB_min(a, b : real) return real;
  function GLB_min(a, b : time) return time;
  function GLB_min(a, b : signed) return signed;
  function GLB_min(a, b : unsigned) return unsigned;

  --Return maximum of a pair of values
  function GLB_max(a, b : integer) return integer;
  function GLB_max(a, b : real) return real;
  function GLB_max(a, b : time) return time;
  function GLB_max(a, b : signed) return signed;
  function GLB_max(a, b : unsigned) return unsigned;

  --Limit value within range [a,b]
  function GLB_limit(value, a, b : integer) return integer;
  function GLB_limit(value, a, b : real) return real;
  function GLB_limit(value, a, b : time) return time;
  function GLB_limit(value, a, b : signed) return signed;
  function GLB_limit(value, a, b : unsigned) return unsigned;

  -----------------------------------------------------------------------------------------------------------------------
  --Reduce a std_logic_vector to std_logic by applying logic function
  function GLB_and_reduce(v  : std_logic_vector) return std_logic;
  function GLB_or_reduce(v   : std_logic_vector) return std_logic;
  function GLB_xor_reduce(v  : std_logic_vector) return std_logic;
  function GLB_nand_reduce(v : std_logic_vector) return std_logic;
  function GLB_nor_reduce(v  : std_logic_vector) return std_logic;
  function GLB_xnor_reduce(v : std_logic_vector) return std_logic;

  --Reduce a signed to std_logic by applying logic function
  function GLB_and_reduce(v  : signed) return std_logic;
  function GLB_or_reduce(v   : signed) return std_logic;
  function GLB_xor_reduce(v  : signed) return std_logic;
  function GLB_nand_reduce(v : signed) return std_logic;
  function GLB_nor_reduce(v  : signed) return std_logic;
  function GLB_xnor_reduce(v : signed) return std_logic;

  --Reduce an unsigned to std_logic by applying logic function
  function GLB_and_reduce(v  : unsigned) return std_logic;
  function GLB_or_reduce(v   : unsigned) return std_logic;
  function GLB_xor_reduce(v  : unsigned) return std_logic;
  function GLB_nand_reduce(v : unsigned) return std_logic;
  function GLB_nor_reduce(v  : unsigned) return std_logic;
  function GLB_xnor_reduce(v : unsigned) return std_logic;

  --Reduce a bit_vector to bit by applying logic function
  function GLB_and_reduce(v  : bit_vector) return bit;
  function GLB_or_reduce(v   : bit_vector) return bit;
  function GLB_xor_reduce(v  : bit_vector) return bit;
  function GLB_nand_reduce(v : bit_vector) return bit;
  function GLB_nor_reduce(v  : bit_vector) return bit;
  function GLB_xnor_reduce(v : bit_vector) return bit;

  -----------------------------------------------------------------------------------------------------------------------
  --Perform a vector resize, but check that numerical represntation of result is identical to x
  --  Note that Modeltech numeric_std does this check automatically, but there is no guarentee
  function GLB_safe_resize(x : unsigned; len : natural) return unsigned;
  function GLB_safe_resize(x : signed; len : natural) return signed;
  function GLB_safe_resize(x : std_logic_vector; len : natural) return std_logic_vector;

  -----------------------------------------------------------------------------------------------------------------------
  --Slice a vector with stride and offset
  --  e.g.
  --    variable x:  unsigned(7 downto 0);
  --    GLB_slice(x,2,0)       --Returns (x(6) & x(4) & x(2) & x(0))
  --    GLB_slice(x,2,1)       --Returns (x(7) & x(5) & x(3) & x(1))

  function GLB_slice(x : bit_vector; stride : positive; offset : natural) return bit_vector;
  function GLB_slice(x : std_logic_vector; stride : positive; offset : natural) return std_logic_vector;
  function GLB_slice(x : unsigned; stride : positive; offset : natural) return unsigned;
  function GLB_slice(x : signed; stride : positive; offset : natural) return signed;

  -----------------------------------------------------------------------------------------------------------------------
  --Pad a vector upto a length with the given bit
  --  x must be a descending vector (m downto n) and is placed in the LSBs of the result
  --  pad is applied to the MSBs of the result
  function GLB_pad(x : bit_vector; len : positive; pad : bit) return bit_vector;
  function GLB_pad(x : std_logic_vector; len : positive; pad : std_logic) return std_logic_vector;
  function GLB_pad(x : unsigned; len : positive; pad : std_logic) return unsigned;
  function GLB_pad(x : signed; len : positive; pad : std_logic) return signed;

  -----------------------------------------------------------------------------------------------------------------------
  --Replicate each bit of a vector
  --  e.g.
  --    variable x:  unsigned(1 downto 0);
  --    GLB_replicate(x,2)         --Returns (x(1) & x(1) & x(0) & x(0))
  --    GLB_replicate(x,3)         --Returns (x(1) & x(1) & x(1) & x(0) & x(0) & x(0))
  function GLB_replicate(x : std_logic_vector; rep : positive) return std_logic_vector;
  function GLB_replicate(x : unsigned; rep : positive) return unsigned;
  function GLB_replicate(x : signed; rep : positive) return signed;

  -----------------------------------------------------------------------------------------------------------------------
  --Convert a hex character into a slv4
  function GLB_hex_to_slv(digit : character) return std_logic_vector;

  --Convert a hex string into a slv
  function GLB_hex_to_slv(digits : string) return std_logic_vector;

  --Convert a hex string into a slv of given width
  function GLB_hex_to_slv(digits : string; width : positive) return std_logic_vector;

  --Convert a slv4 to a hex character
  function GLB_slv_to_hex(v : std_logic_vector) return character;

  --Convert a slv to a hex string
  function GLB_slv_to_hex(v : std_logic_vector) return string;

  ------------------------------------------------------------------------------------------------------------------------
  --Polymorphic method to translate anything into a string
  function GLB_to_string(x : integer) return string;
  function GLB_to_string(x : real) return string;
  function GLB_to_string(x : boolean) return string;
  function GLB_to_string(x : time) return string;
  function GLB_to_string(x : character) return string;
  function GLB_to_string(x : string) return string;  --For completeness
  function GLB_to_string(x : bit) return string;
  function GLB_to_string(x : bit_vector) return string;
  function GLB_to_string(x : std_logic) return string;
  function GLB_to_string(x : std_logic_vector) return string;
  function GLB_to_string(x : unsigned) return string;
  function GLB_to_string(x : signed) return string;

  function GLB_to_hstring(x : std_logic_vector) return string;
  function GLB_to_hstring(x : unsigned) return string;
  function GLB_to_hstring(x : signed) return string;

  --Convert to character
  function GLB_to_character(x : bit) return character;
  function GLB_to_character(x : std_logic) return character;

  ------------------------------------------------------------------------------------------------------------------------
  --Convert character/string to upper/lower case
  function GLB_toupper(c : character) return character;
  function GLB_tolower(c : character) return character;
  function GLB_toupper(s : string) return string;
  function GLB_tolower(s : string) return string;

  ------------------------------------------------------------------------------------------------------------------------
  --Convert an unsigned number into real (not limited by width of x)
  function GLB_to_real(x : unsigned) return real;
  --Convert an unsigned number with given number of fractional bits into real (not limited by width of x)
  function GLB_to_real(x : unsigned; frac : natural) return real;

  --Convert a signed number into real (not limited by width of x)
  function GLB_to_real(x : signed) return real;
  --Convert a signed number with given number of fractional bits into real (not limited by width of x)
  function GLB_to_real(x : signed; frac : natural) return real;

  --Convert a real to an unsigned fixed point value
  function GLB_to_unsigned(x : real; width : positive; frac : natural) return unsigned;
  function GLB_to_unsigned(x : real; width : positive) return unsigned;

  --Convert a real to a signed fixed point value
  function GLB_to_signed(x : real; width : positive; frac : natural) return signed;
  function GLB_to_signed(x : real; width : positive) return signed;

  --Convert a fixed point value from one number format to the other
  --  An error is produced is the result is numerically different from the input
  --  i.e. truncation of significant bits is not permitted
  function GLB_resize(x : unsigned; IN_NBITS : natural; IN_BINPT : natural; OUT_NBITS : natural; OUT_BINPT : natural) return unsigned;
  function GLB_resize(x : signed; IN_NBITS : natural; IN_BINPT : natural; OUT_NBITS : natural; OUT_BINPT : natural) return signed;

  ------------------------------------------------------------------------------------------------------------------------
  --Perform an equality test between two vectors by reducing to a sum-of-product form on the carry-chain
  --  The reduction parameter controls how many bits are combined into each muxcy stage
  --  On V4: comparison to a constant should use reduction=4, comparison to a signal should use reduction=2
  --  On V5: comparison to a constant should use reduction=6, comparison to a signal should use reduction=3
  function GLB_muxcy_eq(lhs : signed; rhs : signed; reduction : natural     := 2) return std_logic;
  function GLB_muxcy_eq(lhs : unsigned; rhs : unsigned; reduction : natural := 2) return std_logic;

  --Perform magnitude comparisons using subtraction
  --  XST has a bad habit of producing LUT-MUXCY-INV structures for comparisons
  --  These functions avoid that
  function GLB_lt(lhs : unsigned; rhs : unsigned) return std_logic;
  function GLB_lt(lhs : signed; rhs : signed) return std_logic;
  function GLB_lt(lhs : unsigned; rhs : integer) return std_logic;
  function GLB_lt(lhs : signed; rhs : integer) return std_logic;

  function GLB_gt(lhs : unsigned; rhs : unsigned) return std_logic;
  function GLB_gt(lhs : signed; rhs : signed) return std_logic;
  function GLB_gt(lhs : unsigned; rhs : integer) return std_logic;
  function GLB_gt(lhs : signed; rhs : integer) return std_logic;

  function GLB_le(lhs : unsigned; rhs : unsigned) return std_logic;
  function GLB_le(lhs : signed; rhs : signed) return std_logic;
  function GLB_le(lhs : unsigned; rhs : integer) return std_logic;
  function GLB_le(lhs : signed; rhs : integer) return std_logic;

  function GLB_ge(lhs : unsigned; rhs : unsigned) return std_logic;
  function GLB_ge(lhs : signed; rhs : signed) return std_logic;
  function GLB_ge(lhs : unsigned; rhs : integer) return std_logic;
  function GLB_ge(lhs : signed; rhs : integer) return std_logic;

  ------------------------------------------------------------------------------------------------------------------------
  --Return either x or -x depending on a control signal
  --    neg    result
  --    false  x
  --    true   -x
  --  The result is one bit wider than x due to sign extension
  --  Always implemened as a single adder (ie. returns x+0 or not(x)+1)
  function GLB_negate(neg : std_logic; x : signed) return signed;
  function GLB_negate(neg : std_logic; x : unsigned) return signed;

  ------------------------------------------------------------------------------------------------------------------------
  --Implements a two input mux as a boolean equation:
  --  result(n)=(not sel and in0(n)) or (sel and in1(n))
  --Result width will be max(in0'length,in1'length) with both inputs extended (zero or sign depending on type) to the required width
  --This form is useful with registered MUXes where XST is using the R/S control signal to implement logic in silly ways
  function GLB_mux(sel : std_logic; in0 : std_logic; in1 : std_logic) return std_logic;
  function GLB_mux(sel : std_logic; in0 : std_logic_vector; in1 : std_logic_vector) return std_logic_vector;
  function GLB_mux(sel : std_logic; in0 : unsigned; in1 : unsigned) return unsigned;
  function GLB_mux(sel : std_logic; in0 : natural; in1 : unsigned) return unsigned;
  function GLB_mux(sel : std_logic; in0 : unsigned; in1 : natural) return unsigned;
  function GLB_mux(sel : std_logic; in0 : signed; in1 : signed) return signed;
  function GLB_mux(sel : std_logic; in0 : integer; in1 : signed) return signed;
  function GLB_mux(sel : std_logic; in0 : signed; in1 : integer) return signed;

end package;


------------------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package body global_util_pkg is

  --True if this is simulation
  function GLB_is_simulation return boolean is
  begin
    --translate off
    return true;
    --translate on
    return false;
  end function;

  --True if this is synthesis/implementation
  function GLB_is_synthesis return boolean is
  begin
    return not GLB_is_simulation;
  end function;

  --True if any of the elements of a boolean_vector are true
  function GLB_any_true(v : GLB_BooleanVector) return boolean is
  begin
    for I in v'range loop
      if v(I) then return true; end if;
    end loop;
    return false;
  end function;

  --True if any of the elements of a boolean_vector are false
  function GLB_any_false(v : GLB_BooleanVector) return boolean is
  begin
    for I in v'range loop
      if not v(I) then return true; end if;
    end loop;
    return false;
  end function;

  --True if all of the elements of a boolean_vector are true
  function GLB_all_true(v : GLB_BooleanVector) return boolean is
  begin
    return not GLB_any_false(v);
  end function;

  --True if all of the elements of a boolean_vector are false
  function GLB_all_false(v : GLB_BooleanVector) return boolean is
  begin
    return not GLB_any_true(v);
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  function GLB_log2(x : natural) return natural is
    variable width : natural := 0;
    variable cnt   : natural := 1;
  begin
    while (cnt < x) loop
      width := width+1;
      cnt   := cnt*2;
    end loop;
    return width;
  end;

  function GLB_log2min(x, y : natural) return natural is
  begin
    return GLB_min(GLB_log2(x), y);
  end function;

  function GLB_next_pow2(x : natural) return natural is
    variable width : natural := 0;
    variable cnt   : natural := 1;
  begin
    while (cnt < x) loop
      width := width+1;
      cnt   := cnt*2;
    end loop;
    return cnt;
  end function;

  function GLB_find_lsb(x : natural) return natural is
    variable xx    : natural := x;
    variable width : natural := 0;
  begin
    while (GLB_is_even(xx)) loop
      xx    := xx/2;
      width := width+1;
    end loop;
    return width;
  end function;

  function GLB_find_msb(x : natural) return natural is
    variable xx    : natural := x;
    variable width : natural := 0;
  begin
    while (xx > 1) loop
      xx    := xx/2;
      width := width+1;
    end loop;
    return width;
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_is_pow2(x : natural) return boolean is
  begin
    return x = GLB_next_pow2(x);
  end function;

  function GLB_is_even(x : integer) return boolean is
  begin
    return (x rem 2) = 0;
  end function;

  function GLB_is_even(x : unsigned) return boolean is
  begin
    return (x(x'right) = '0');
  end function;

  function GLB_is_even(x : signed) return boolean is
  begin
    return (x(x'right) = '0');
  end function;

  function GLB_is_odd(x : integer) return boolean is
  begin
    return (x rem 2) /= 0;
  end function;

  function GLB_is_odd(x : unsigned) return boolean is
  begin
    return (x(x'right) = '1');
  end function;

  function GLB_is_odd(x : signed) return boolean is
  begin
    return (x(x'right) = '1');
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_if(cond : boolean; v_true, v_false : integer) return integer is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : real) return real is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : string) return string is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : std_logic) return std_logic is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : std_logic_vector) return std_logic_vector is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : signed) return signed is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : unsigned) return unsigned is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : time) return time is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : character) return character is
  begin
    if (cond) then return v_true; else return v_false; end if;
  end function;

  function GLB_if(cond : boolean; v_true, v_false : boolean) return boolean is
  begin
    return (cond and v_true) or (not cond and v_false);
  end function;

  function GLB_if(cond : std_logic; v_true, v_false : std_logic) return std_logic is
  begin
    return (cond and v_true) or (not cond and v_false);
  end function;

  function GLB_to_std_logic(x : boolean) return std_logic is
  begin
    if (x) then return '1'; else return '0'; end if;
  end function;

  function GLB_to_sl(x : boolean) return std_logic is
  begin
    if (x) then return '1'; else return '0'; end if;
  end function;

  function GLB_to_bit(x : boolean) return bit is
  begin
    if (x) then return '1'; else return '0'; end if;
  end function;

  function GLB_to_boolean(x : integer) return boolean is
  begin
    if (x /= 0) then return true; else return false; end if;
  end function;

  function GLB_to_boolean(x : real) return boolean is
  begin
    if (x /= 0.0) then return true; else return false; end if;
  end function;

  function GLB_to_boolean(x : std_logic) return boolean is
  begin
    if (to_X01(x) = '1') then return true; else return false; end if;
  end function;

  function GLB_to_integer(x : boolean) return integer is
  begin
    if x then return 1; else return 0; end if;
  end function;

  function GLB_to_integer(x: std_logic) return integer is
  begin
    if x='1' then return 1; else return 0; end if;
  end function;
------------------------------------------------------------------------------------------------------------------------
  function GLB_min(a, b : integer) return integer is
  begin
    if (a < b) then return a; else return b; end if;
  end function;

  function GLB_min(a, b : real) return real is
  begin
    if (a < b) then return a; else return b; end if;
  end function;

  function GLB_min(a, b : time) return time is
  begin
    if (a < b) then return a; else return b; end if;
  end function;

  function GLB_min(a, b : signed) return signed is
  begin
    if (a < b) then return a; else return b; end if;
  end function;

  function GLB_min(a, b : unsigned) return unsigned is
  begin
    if (a < b) then return a; else return b; end if;
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_max(a, b : integer) return integer is
  begin
    if (a > b) then return a; else return b; end if;
  end function;

  function GLB_max(a, b : real) return real is
  begin
    if (a > b) then return a; else return b; end if;
  end function;

  function GLB_max(a, b : time) return time is
  begin
    if (a > b) then return a; else return b; end if;
  end function;

  function GLB_max(a, b : signed) return signed is
  begin
    if (a > b) then return a; else return b; end if;
  end function;

  function GLB_max(a, b : unsigned) return unsigned is
  begin
    if (a > b) then return a; else return b; end if;
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_limit(value, a, b : integer) return integer is
  begin
    if (value < a) then return a; end if;
    if (value > b) then return b; end if;
    return value;
  end function;

  function GLB_limit(value, a, b : real) return real is
  begin
    if (value < a) then return a; end if;
    if (value > b) then return b; end if;
    return value;
  end function;

  function GLB_limit(value, a, b : time) return time is
  begin
    if (value < a) then return a; end if;
    if (value > b) then return b; end if;
    return value;
  end function;

  function GLB_limit(value, a, b : signed) return signed is
  begin
    if (value < a) then return a; end if;
    if (value > b) then return b; end if;
    return value;
  end function;

  function GLB_limit(value, a, b : unsigned) return unsigned is
  begin
    if (value < a) then return a; end if;
    if (value > b) then return b; end if;
    return value;
  end function;

-----------------------------------------------------------------------------------------------------------------------
  --Reduce a std_logic_vector to std_logic by applying logic function
  function GLB_and_reduce(v : std_logic_vector) return std_logic is
    variable res : std_logic := '1';
  begin
    for I in v'range loop
      res := res and v(I);
    end loop;
    return res;
  end function;

  function GLB_or_reduce(v : std_logic_vector) return std_logic is
    variable res : std_logic := '0';
  begin
    for I in v'range loop
      res := res or v(I);
    end loop;
    return res;
  end function;

  function GLB_xor_reduce(v : std_logic_vector) return std_logic is
    variable res : std_logic := '0';
  begin
    for I in v'range loop
      res := res xor v(I);
    end loop;
    return res;
  end function;

  function GLB_nand_reduce(v : std_logic_vector) return std_logic is
  begin
    return not GLB_and_reduce(v);
  end function;

  function GLB_nor_reduce(v : std_logic_vector) return std_logic is
  begin
    return not GLB_or_reduce(v);
  end function;

  function GLB_xnor_reduce(v : std_logic_vector) return std_logic is
  begin
    return not GLB_xor_reduce(v);
  end function;

  --Reduce a signed to std_logic by applying logic function
  function GLB_and_reduce(v : signed) return std_logic is
  begin
    return GLB_and_reduce(std_logic_vector(v));
  end function;

  function GLB_or_reduce(v : signed) return std_logic is
  begin
    return GLB_or_reduce(std_logic_vector(v));
  end function;

  function GLB_xor_reduce(v : signed) return std_logic is
  begin
    return GLB_xor_reduce(std_logic_vector(v));
  end function;

  function GLB_nand_reduce(v : signed) return std_logic is
  begin
    return GLB_nand_reduce(std_logic_vector(v));
  end function;

  function GLB_nor_reduce(v : signed) return std_logic is
  begin
    return GLB_nor_reduce(std_logic_vector(v));
  end function;

  function GLB_xnor_reduce(v : signed) return std_logic is
  begin
    return GLB_xnor_reduce(std_logic_vector(v));
  end function;

  --Reduce an unsigned to std_logic by applying logic function
  function GLB_and_reduce(v : unsigned) return std_logic is
  begin
    return GLB_and_reduce(std_logic_vector(v));
  end function;

  function GLB_or_reduce(v : unsigned) return std_logic is
  begin
    return GLB_or_reduce(std_logic_vector(v));
  end function;

  function GLB_xor_reduce(v : unsigned) return std_logic is
  begin
    return GLB_xor_reduce(std_logic_vector(v));
  end function;

  function GLB_nand_reduce(v : unsigned) return std_logic is
  begin
    return GLB_nand_reduce(std_logic_vector(v));
  end function;

  function GLB_nor_reduce(v : unsigned) return std_logic is
  begin
    return GLB_nor_reduce(std_logic_vector(v));
  end function;

  function GLB_xnor_reduce(v : unsigned) return std_logic is
  begin
    return GLB_xnor_reduce(std_logic_vector(v));
  end function;

  --Reduce a bit_vector to bit by applying logic function
  function GLB_and_reduce(v : bit_vector) return bit is
    variable res : bit := '1';
  begin
    for I in v'range loop
      res := res and v(I);
    end loop;
    return res;
  end function;

  function GLB_or_reduce(v : bit_vector) return bit is
    variable res : bit := '0';
  begin
    for I in v'range loop
      res := res or v(I);
    end loop;
    return res;
  end function;

  function GLB_xor_reduce(v : bit_vector) return bit is
    variable res : bit := '0';
  begin
    for I in v'range loop
      res := res xor v(I);
    end loop;
    return res;
  end function;

  function GLB_nand_reduce(v : bit_vector) return bit is
  begin
    return not GLB_and_reduce(v);
  end function;

  function GLB_nor_reduce(v : bit_vector) return bit is
  begin
    return not GLB_or_reduce(v);
  end function;

  function GLB_xnor_reduce(v : bit_vector) return bit is
  begin
    return not GLB_xor_reduce(v);
  end function;

------------------------------------------------------------------------------------------------------------------------
  --Perform a vector resize, but check that numerical represntation of result is identical to x
  function GLB_safe_resize(x : unsigned; len : natural) return unsigned is
    variable res : unsigned(len-1 downto 0) := resize(x, len);
  begin
    --translate off
    assert x = res
      report "ERROR:Resize operation caused change in numerical value of result"
      severity failure;
    --translate on
    return res;
  end function;

  function GLB_safe_resize(x : signed; len : natural) return signed is
    variable res : signed(len-1 downto 0) := resize(x, len);
  begin
    --translate off
    assert x = res
      report "ERROR:Resize operation caused change in numerical value of result"
      severity failure;
    --translate on
    return res;
  end function;

  function GLB_safe_resize(x : std_logic_vector; len : natural) return std_logic_vector is
  begin
    return std_logic_vector(GLB_safe_resize(unsigned(x), len));
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_slice(x : bit_vector; stride : positive; offset : natural) return bit_vector is
    constant SLICE_LEN : natural                          := x'length/stride;
    variable res       : bit_vector(SLICE_LEN-1 downto 0) := (others => '0');
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    assert x'length = SLICE_LEN*stride
      report "ERROR:x'length must be an integer multiple of stride"
      severity failure;
    assert offset >= 0 and offset < stride
      report "ERROR:offset must be in range [0 stride-1]"
      severity failure;
    --translate on

    for I in res'range loop
      res(I) := x(x'right+I*stride+offset);
    end loop;

    return res;
  end function;

  function GLB_slice(x : std_logic_vector; stride : positive; offset : natural) return std_logic_vector is
    constant SLICE_LEN : natural                                := x'length/stride;
    variable res       : std_logic_vector(SLICE_LEN-1 downto 0) := (others => '0');
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    assert x'length = SLICE_LEN*stride
      report "ERROR:x'length must be an integer multiple of stride"
      severity failure;
    assert offset >= 0 and offset < stride
      report "ERROR:offset must be in range [0 stride-1]"
      severity failure;
    --translate on

    for I in res'range loop
      res(I) := x(x'right+I*stride+offset);
    end loop;

    return res;
  end function;

  function GLB_slice(x : unsigned; stride : positive; offset : natural) return unsigned is
  begin
    return unsigned(GLB_slice(std_logic_vector(x), stride, offset));
  end function;

  function GLB_slice(x : signed; stride : positive; offset : natural) return signed is
  begin
    return signed(GLB_slice(std_logic_vector(x), stride, offset));
  end function;

-----------------------------------------------------------------------------------------------------------------------
  function GLB_pad(x : bit_vector; len : positive; pad : bit) return bit_vector is
    variable res : bit_vector(len-1 downto 0) := (others => pad);
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    assert len >= x'length
      report "ERROR:len must be >=x'length"
      severity failure;
    --translate on

    res(x'length-1 downto 0) := x;

    return res;
  end function;

  function GLB_pad(x : std_logic_vector; len : positive; pad : std_logic) return std_logic_vector is
    variable res : std_logic_vector(len-1 downto 0) := (others => pad);
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    assert len >= x'length
      report "ERROR:len must be >=x'length"
      severity failure;
    --translate on

    res(x'length-1 downto 0) := x;

    return res;
  end function;

  function GLB_pad(x : unsigned; len : positive; pad : std_logic) return unsigned is
  begin
    return unsigned(GLB_pad(std_logic_vector(x), len, pad));
  end function;

  function GLB_pad(x : signed; len : positive; pad : std_logic) return signed is
  begin
    return signed(GLB_pad(std_logic_vector(x), len, pad));
  end function;


------------------------------------------------------------------------------------------------------------------------
  function GLB_replicate(x : bit_vector; rep : positive) return bit_vector is
    variable res : bit_vector(x'length*rep-1 downto 0) := (others => '0');
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    --translate on

    for I in 0 to x'length-1 loop
      res(I*rep+rep-1 downto I*rep) := (others => x(x'low+I));
    end loop;

    return res;
  end function;

  function GLB_replicate(x : std_logic_vector; rep : positive) return std_logic_vector is
    variable res : std_logic_vector(x'length*rep-1 downto 0) := (others => '0');
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    --translate on

    for I in 0 to x'length-1 loop
      res(I*rep+rep-1 downto I*rep) := (others => x(x'low+I));
    end loop;

    return res;
  end function;

  function GLB_replicate(x : unsigned; rep : positive) return unsigned is
  begin
    return unsigned(GLB_replicate(std_logic_vector(x), rep));
  end function;

  function GLB_replicate(x : signed; rep : positive) return signed is
  begin
    return signed(GLB_replicate(std_logic_vector(x), rep));
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_hex_to_slv(digit : character) return std_logic_vector is
  begin
    case digit is
      when '0'       => return "0000";
      when '1'       => return "0001";
      when '2'       => return "0010";
      when '3'       => return "0011";
      when '4'       => return "0100";
      when '5'       => return "0101";
      when '6'       => return "0110";
      when '7'       => return "0111";
      when '8'       => return "1000";
      when '9'       => return "1001";
      when 'a' | 'A' => return "1010";
      when 'b' | 'B' => return "1011";
      when 'c' | 'C' => return "1100";
      when 'd' | 'D' => return "1101";
      when 'e' | 'E' => return "1110";
      when 'f' | 'F' => return "1111";
      when others    => return "XXXX";
    end case;
  end function;

  function GLB_hex_to_slv(digits : string) return std_logic_vector is
    variable i   : integer := 0;
    variable res : std_logic_vector(digits'length*4-1 downto 0);
  begin
    for x in digits'reverse_range loop
      res(i+3 downto i) := GLB_hex_to_slv(digits(x));
      i                 :=i+4;
    end loop;
    return res;
  end function;

  function GLB_hex_to_slv(digits : string; width : positive) return std_logic_vector is
    variable x   : std_logic_vector(digits'length*4-1 downto 0) := GLB_hex_to_slv(digits);
    variable res : std_logic_vector(width-1 downto 0)           := (others => '0');
  begin
    if (digits'length*4 < width) then
      res(x'range) := x;
    else
      res := x(res'range);
    end if;
    return res;
  end function;

  --Convert a slv4 to a hex character
  function GLB_slv_to_hex(v : std_logic_vector) return character is
    variable vv : std_logic_vector(3 downto 0) := v;
  begin
    case vv is
      when "0000" => return '0';
      when "0001" => return '1';
      when "0010" => return '2';
      when "0011" => return '3';
      when "0100" => return '4';
      when "0101" => return '5';
      when "0110" => return '6';
      when "0111" => return '7';
      when "1000" => return '8';
      when "1001" => return '9';
      when "1010" => return 'A';
      when "1011" => return 'B';
      when "1100" => return 'C';
      when "1101" => return 'D';
      when "1110" => return 'E';
      when "1111" => return 'F';
      when others => return 'X';
    end case;
  end function;

  --Convert a slv to a hex string
  function GLB_slv_to_hex(v : std_logic_vector) return string is
    constant NUM_DIGITS : integer                               := (v'length+3)/4;
    variable x          : std_logic_vector(0 to 4*NUM_DIGITS-1) := std_logic_vector(resize(unsigned(v), 4*NUM_DIGITS));
    variable res        : string(1 to NUM_DIGITS);
  begin
    for i in res'range loop
      res(i) := GLB_slv_to_hex(x(4*i-4 to 4*i-1));
    end loop;
    return res;
  end function;

------------------------------------------------------------------------------------------------------------------------
  function GLB_to_string(x : integer) return string is
  begin
    return integer'image(x);
  end function;

  function GLB_to_string(x : real) return string is
  begin
    return real'image(x);
  end function;

  function GLB_to_string(x : boolean) return string is
  begin
    return boolean'image(x);
  end function;

  function GLB_to_string(x : time) return string is
  begin
    return time'image(x);
  end function;

  function GLB_to_string(x : character) return string is
  begin
    --Note that this converts all characters to a textual representation (i.e. 0->nul, 9->ht, etc.)
    return character'image(x);
  end function;

  function GLB_to_string(x : string) return string is
  begin
    return x;
  end function;

  function GLB_to_string(x : std_logic) return string is
  begin
    return GLB_to_string(GLB_to_character(x));
  end function;

  function GLB_to_string(x : bit) return string is
  begin
    return GLB_to_string(GLB_to_character(x));
  end function;

  function GLB_to_string(x : bit_vector) return string is
    variable res : string(1 to x'length);
    variable j   : integer := 1;
  begin
    for i in x'range loop
      res(j) := GLB_to_character(x(i));
      j      :=j+1;
    end loop;
    return res;
  end function;

  function GLB_to_string(x : std_logic_vector) return string is
    variable res : string(1 to x'length);
    variable j   : integer := 1;
  begin
    for i in x'range loop
      res(j) := GLB_to_character(x(i));
      j      :=j+1;
    end loop;
    return res;
  end function;

  function GLB_to_string(x : unsigned) return string is
  begin
    return GLB_to_string(std_logic_vector(x));
  end function;

  function GLB_to_string(x : signed) return string is
  begin
    return GLB_to_string(std_logic_vector(x));
  end function;

  function GLB_to_hstring(x : std_logic_vector) return string is
  begin
    return GLB_slv_to_hex(x);
  end function;

  function GLB_to_hstring(x : unsigned) return string is
  begin
    return GLB_to_hstring(std_logic_vector(x));
  end function;

  function GLB_to_hstring(x : signed) return string is
  begin
    return GLB_to_hstring(std_logic_vector(x));
  end function;

  function GLB_to_character(x : bit) return character is
  begin
    case x is
      when '0'    => return '0';
      when '1'    => return '1';
      when others => return '.';
    end case;
  end function;

  function GLB_to_character(x : std_logic) return character is
  begin
    case x is
      when 'U'    => return 'U';
      when 'X'    => return 'X';
      when '0'    => return '0';
      when '1'    => return '1';
      when 'Z'    => return 'Z';
      when 'W'    => return 'W';
      when 'L'    => return 'L';
      when 'H'    => return 'H';
      when '-'    => return '-';
      when others => return '.';
    end case;
  end function;

------------------------------------------------------------------------------------------------------------------------
  --Convert character/string to upper/lower case
  function GLB_toupper(c : character) return character is
    constant LUT : string(64 to 126) := "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~";
    variable res : character         := c;
  begin
    if (res >= 'a' and res <= 'z') then
      res := LUT(character'pos(res));
    end if;
    return res;
  end function;

  function GLB_tolower(c : character) return character is
    constant LUT : string(64 to 126) := "@abcdefghijklmnopqrstuvwxyz[\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
    variable res : character         := c;
  begin
    if (res >= 'A' and res <= 'Z') then
      res := LUT(character'pos(res));
    end if;
    return res;
  end function;

  function GLB_toupper(s : string) return string is
    variable res : string(s'range) := s;
  begin
    for I in res'range loop
      res(I) := GLB_toupper(res(I));
    end loop;
    return res;
  end function;

  function GLB_tolower(s : string) return string is
    variable res : string(s'range) := s;
  begin
    for I in res'range loop
      res(I) := GLB_tolower(res(I));
    end loop;
    return res;
  end function;


------------------------------------------------------------------------------------------------------------------------
  --Generating large integers in VHDL is painful - so split long vectors into managable chunks
  constant VEC_CHUNK : positive := 28;
  constant VEC_SCALE : real     := real(2**VEC_CHUNK);

  function GLB_to_real(x : unsigned) return real is
  begin
    if (x'length > VEC_CHUNK) then
      if (x'ascending) then
        return GLB_to_real(x(x'left to x'right-VEC_CHUNK))*VEC_SCALE+GLB_to_real(x(x'right-VEC_CHUNK+1 to x'right));
      else
        return GLB_to_real(x(x'left downto x'right+VEC_CHUNK))*VEC_SCALE+GLB_to_real(x(x'right+VEC_CHUNK-1 downto x'right));
      end if;
    end if;

    --Simple vector, so convert directly
    return real(to_integer(x));
  end function;

  function GLB_to_real(x : signed) return real is
    variable res : real := 0.0;
  begin
    if (x < 0) then
      return -GLB_to_real(unsigned(-x));
    else
      return GLB_to_real(unsigned(x));
    end if;
  end function;

  function GLB_to_real(x : unsigned; frac : natural) return real is
  begin
    return GLB_to_real(x)/(2.0**real(frac));
  end function;

  function GLB_to_real(x : signed; frac : natural) return real is
  begin
    return GLB_to_real(x)/(2.0**real(frac));
  end function;

  function GLB_to_unsigned(x : real; width : positive) return unsigned is
    variable v     : unsigned(VEC_CHUNK-1 downto 0);
    constant SCALE : real := 2.0**(width-VEC_CHUNK);
    variable y     : real;
    variable i, j  : integer;
  begin
    --Is resulting vector too large to calculate in one?
    if (width > VEC_CHUNK) then
      v :=GLB_to_unsigned(x/SCALE, VEC_CHUNK);
      y :=x-GLB_to_real(v)*SCALE;
      return v & GLB_to_unsigned(y, width-VEC_CHUNK);
    end if;

    j :=2**width;
    i :=GLB_limit(integer(x-0.499999), 0, j-1);
    return to_unsigned(i, width);
  end function;

  function GLB_to_signed(x : real; width : positive) return signed is
    variable v     : signed(VEC_CHUNK-1 downto 0);
    constant SCALE : real := 2.0**(width-VEC_CHUNK);
    variable y     : real;
    variable i, j  : integer;
  begin
    --Is resulting vector too large to calculate in one?
    if (width > VEC_CHUNK) then
      v :=GLB_to_signed(x/SCALE, VEC_CHUNK);
      y :=x-GLB_to_real(v)*SCALE;
      return v & signed(GLB_to_unsigned(y, width-VEC_CHUNK));
    end if;

    j :=2**(width-1);
    i :=GLB_limit(integer(x-0.499999), -j, j-1);
    return to_signed(i, width);
  end function;

  function GLB_to_unsigned(x : real; width : positive; frac : natural) return unsigned is
  begin
    return GLB_to_unsigned(x*(2.0**real(frac)), width);
  end function;

  function GLB_to_signed(x : real; width : positive; frac : natural) return signed is
  begin
    return GLB_to_signed(x*(2.0**real(frac)), width);
  end function;

  function GLB_resize(x : unsigned; IN_NBITS : natural; IN_BINPT : natural; OUT_NBITS : natural; OUT_BINPT : natural) return unsigned is
    variable res : unsigned(OUT_NBITS-1 downto 0);
    variable xx  : unsigned(OUT_NBITS-1 downto 0);
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    assert x'length = IN_NBITS
      report "ERROR:Invalid x and/or IN_NBITS; length of x must be the same as IN_NBITS"
      severity failure;
    --translate on

    if (IN_NBITS >= OUT_NBITS) then
      res := x(x'low+OUT_NBITS-1 downto x'low);
    else
      res(IN_NBITS-1 downto 0) := x;
    end if;

    --Need to realign binary point
    if (IN_BINPT >= OUT_BINPT) then
      --res:=res sra (IN_BINPT-OUT_BINPT);
      --xx :=res sla (IN_BINPT-OUT_BINPT);
      res := resize(res(OUT_NBITS-1 downto (IN_BINPT-OUT_BINPT)), OUT_NBITS);
      xx  := res sll (IN_BINPT-OUT_BINPT);
    else
      --res:=res sla (OUT_BINPT-IN_BINPT);
      --xx :=res sra (OUT_BINPT-IN_BINPT);
      res := res sll (OUT_BINPT-IN_BINPT);
      xx  := resize(res(OUT_NBITS-1 downto (OUT_BINPT-IN_BINPT)), OUT_NBITS);
    end if;

    --Check for change in value
    --translate off
    if (not is_x(std_logic_vector(x))) then
      assert x = xx
        report "ERROR:Numeric value changed after resize"
        severity failure;
    end if;
    --translate on

    return res;
  end function;

  function GLB_resize(x : signed; IN_NBITS : natural; IN_BINPT : natural; OUT_NBITS : natural; OUT_BINPT : natural) return signed is
    variable res : signed(OUT_NBITS-1 downto 0);
    variable xx  : signed(OUT_NBITS-1 downto 0);
  begin
    --translate off
    assert not x'ascending
      report "ERROR:x must be a descending vector (n downto m)"
      severity failure;
    assert x'length = IN_NBITS
      report "ERROR:Invalid x and/or IN_NBITS; length of x must be the same as IN_NBITS"
      severity failure;
    --translate on

    if (IN_NBITS >= OUT_NBITS) then
      res := x(x'low+OUT_NBITS-1 downto x'low);
    else
      res(IN_NBITS-1 downto 0) := x;
    end if;

    --Need to realign binary point
    if (IN_BINPT >= OUT_BINPT) then
      --res:=res sra (IN_BINPT-OUT_BINPT);
      --xx :=res sla (IN_BINPT-OUT_BINPT);
      res := resize(res(OUT_NBITS-1 downto (IN_BINPT-OUT_BINPT)), OUT_NBITS);
      xx  := res sll (IN_BINPT-OUT_BINPT);
    else
      --res:=res sla (OUT_BINPT-IN_BINPT);
      --xx :=res sra (OUT_BINPT-IN_BINPT);
      res := res sll (OUT_BINPT-IN_BINPT);
      xx  := resize(res(OUT_NBITS-1 downto (OUT_BINPT-IN_BINPT)), OUT_NBITS);
    end if;

    --Check for change in value
    --translate off
    if (not is_x(std_logic_vector(x))) then
      assert x = xx
        report "ERROR:Numeric value changed after resize"
        severity failure;
    end if;
    --translate on

    return res;
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  --Perform an equality test between two vectors by reducing to a sum-of-product form on the carry-chain
  --  The reduction parameter controls how many bits are combined into each muxcy stage
  --  On V4: comparison to a constant should use reduction=4, comparison to a signal should use reduction=2
  --  On V5: comparison to a constant should use reduction=6, comparison to a signal should use reduction=3
  function GLB_muxcy_eq(lhs : unsigned; rhs : unsigned; reduction : natural := 2) return std_logic is
    constant WIDTH : natural                    := (GLB_max(lhs'length, rhs'length)+reduction-1)/reduction;
    variable int   : unsigned(WIDTH*reduction-1 downto 0);
    variable add   : unsigned(WIDTH-1 downto 0) := (others => '0');
    variable cin   : unsigned(0 downto 0)       := (others => '1');
    variable res   : unsigned(WIDTH downto 0);
  begin
    --Intermediate result is the bit wise xor
    int := resize(lhs, int'length) xor resize(rhs, int'length);

    --Reduce each pair of bits to a product
    for I in add'range loop
      if (int(I*reduction+reduction-1 downto I*reduction) = 0) then add(I) := '1'; end if;
    end loop;

    --Final addition
    res := resize(add, res'length)+cin;

    return res(res'left);
  end function;

  function GLB_muxcy_eq(lhs : signed; rhs : signed; reduction : natural := 2) return std_logic is
    constant WIDTH : natural                    := (GLB_max(lhs'length, rhs'length)+reduction-1)/reduction;
    variable int   : signed(WIDTH*reduction-1 downto 0);
    --We're using addition to implement sum-of-product, not arithemtic
    --  We can drop the signedness of the inputs now
    variable add   : unsigned(WIDTH-1 downto 0) := (others => '0');
    variable cin   : unsigned(0 downto 0)       := (others => '1');
    variable res   : unsigned(WIDTH downto 0);
  begin
    --Intermediate result is the bit wise xor
    int := resize(lhs, int'length) xor resize(rhs, int'length);

    --Reduce each pair of bits to a product
    for I in add'range loop
      if (int(I*reduction+reduction-1 downto I*reduction) = 0) then add(I) := '1'; end if;
    end loop;

    --Final addition
    res := resize(add, res'length)+cin;

    return res(res'left);
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  -- lhs<rhs can be re-written as lhs-rhs<0
  function GLB_lt(lhs : unsigned; rhs : unsigned) return std_logic is
    variable res : unsigned(GLB_max(lhs'length, rhs'length)+1 downto 0);
  begin
    res := resize(lhs, res'length)-resize(rhs, res'length);
    return res(res'left);
  end function;

  function GLB_lt(lhs : signed; rhs : signed) return std_logic is
    variable res : signed(GLB_max(lhs'length, rhs'length)+1 downto 0);
  begin
    res := resize(lhs, res'length)-resize(rhs, res'length);
    return res(res'left);
  end function;

  function GLB_lt(lhs : unsigned; rhs : integer) return std_logic is
  begin
    return GLB_lt(lhs, to_unsigned(rhs, lhs'length));
  end function;

  function GLB_lt(lhs : signed; rhs : integer) return std_logic is
  begin
    return GLB_lt(lhs, to_signed(rhs, lhs'length));
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  -- lhs>rhs is equivalent to rhs<lhs
  function GLB_gt(lhs : unsigned; rhs : unsigned) return std_logic is
  begin
    return GLB_lt(rhs, lhs);
  end function;

  function GLB_gt(lhs : signed; rhs : signed) return std_logic is
  begin
    return GLB_lt(rhs, lhs);
  end function;

  function GLB_gt(lhs : unsigned; rhs : integer) return std_logic is
  begin
    return GLB_gt(lhs, to_unsigned(rhs, lhs'length));
  end function;

  function GLB_gt(lhs : signed; rhs : integer) return std_logic is
  begin
    return GLB_gt(lhs, to_signed(rhs, lhs'length));
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  --  lhs<=rhs can be re-written as:
  --  lhs-rhs<=0
  --  lhs+not(rhs)+1<=0  (i.e. 2's compliment addition)
  --  lhs+not(rhs)<=-1
  --  lhs+not(rhs)<0
  function GLB_le(lhs : unsigned; rhs : unsigned) return std_logic is
    variable res : unsigned(GLB_max(lhs'length, rhs'length)+1 downto 0);
  begin
    res := resize(lhs, res'length)+not(resize(rhs, res'length));
    return res(res'left);
  end function;

  function GLB_le(lhs : signed; rhs : signed) return std_logic is
    variable res : signed(GLB_max(lhs'length, rhs'length)+1 downto 0);
  begin
    res := resize(lhs, res'length)+not(resize(rhs, res'length));
    return res(res'left);
  end function;

  function GLB_le(lhs : unsigned; rhs : integer) return std_logic is
  begin
    return GLB_le(lhs, to_unsigned(rhs, lhs'length));
  end function;

  function GLB_le(lhs : signed; rhs : integer) return std_logic is
  begin
    return GLB_le(lhs, to_signed(rhs, lhs'length));
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  --  lhs>=rhs can be re-written as rhs<=lhs
  function GLB_ge(lhs : unsigned; rhs : unsigned) return std_logic is
  begin
    return GLB_le(rhs, lhs);
  end function;

  function GLB_ge(lhs : signed; rhs : signed) return std_logic is
  begin
    return GLB_le(rhs, lhs);
  end function;

  function GLB_ge(lhs : unsigned; rhs : integer) return std_logic is
  begin
    return GLB_ge(lhs, to_unsigned(rhs, lhs'length));
  end function;

  function GLB_ge(lhs : signed; rhs : integer) return std_logic is
  begin
    return GLB_ge(lhs, to_signed(rhs, lhs'length));
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  --Return either x or -x depending on a control signal
  --    neg    result
  --    false  x
  --    true   -x
  --  Note that when x is unsigned, the result is one bit wider than x to allow for sign extension
  --  Always implemened as a single adder (ie. returns x+0 or not(x)+1)
  function GLB_negate(neg : std_logic; x : signed) return signed is
    variable res : signed(x'length downto 0) := resize(x, x'length+1);
    variable cin : signed(1 downto 0)        := (others => '0');
  begin
    if (to_X01(neg) = '1') then
      res    := not res;
      cin(0) := '1';
    end if;
    return res+cin;
  end function;

  function GLB_negate(neg : std_logic; x : unsigned) return signed is
    variable res : signed(x'length downto 0) := signed(resize(x, x'length+1));
    variable cin : signed(1 downto 0)        := (others => '0');
  begin
    if (to_X01(neg) = '1') then
      res    := not res;
      cin(0) := '1';
    end if;
    return res+cin;
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  --Implements a two input mux as a boolean equation:
  --  result(n)=(not sel and in0(n)) or (sel and in1(n))
  --This form is useful with registered MUXes where XST is using the R/S control signal to implement logic in silly ways
  function GLB_mux(sel : std_logic; in0 : std_logic; in1 : std_logic) return std_logic is
  begin
    return (not sel and in0) or (sel and in1);
  end function;

  function GLB_mux(sel : std_logic; in0 : std_logic_vector; in1 : std_logic_vector) return std_logic_vector is
    constant RES_NBITS : natural                                := GLB_max(in0'length, in1'length);
    variable sel_wide  : std_logic_vector(RES_NBITS-1 downto 0) := (others => sel);
    variable in0_wide  : std_logic_vector(RES_NBITS-1 downto 0);
    variable in1_wide  : std_logic_vector(RES_NBITS-1 downto 0);
  begin
    in0_wide(in0'length-1 downto 0) := in0;
    in1_wide(in1'length-1 downto 0) := in1;
    return (not sel_wide and in0_wide) or (sel_wide and in1_wide);
  end function;

  function GLB_mux(sel : std_logic; in0 : unsigned; in1 : unsigned) return unsigned is
    constant RES_NBITS : natural                        := GLB_max(in0'length, in1'length);
    variable sel_wide  : unsigned(RES_NBITS-1 downto 0) := (others => sel);
    variable in0_wide  : unsigned(RES_NBITS-1 downto 0) := resize(in0, RES_NBITS);
    variable in1_wide  : unsigned(RES_NBITS-1 downto 0) := resize(in1, RES_NBITS);
  begin
    return (not sel_wide and in0_wide) or (sel_wide and in1_wide);
  end function;

  function GLB_mux(sel : std_logic; in0 : natural; in1 : unsigned) return unsigned is
  begin
    return GLB_mux(sel, to_unsigned(in0, in1'length), in1);
  end function;

  function GLB_mux(sel : std_logic; in0 : unsigned; in1 : natural) return unsigned is
  begin
    return GLB_mux(sel, in0, to_unsigned(in1, in0'length));
  end function;

  function GLB_mux(sel : std_logic; in0 : signed; in1 : signed) return signed is
    constant RES_NBITS : natural                      := GLB_max(in0'length, in1'length);
    variable sel_wide  : signed(RES_NBITS-1 downto 0) := (others => sel);
    variable in0_wide  : signed(RES_NBITS-1 downto 0) := resize(in0, RES_NBITS);
    variable in1_wide  : signed(RES_NBITS-1 downto 0) := resize(in1, RES_NBITS);
  begin
    return (not sel_wide and in0_wide) or (sel_wide and in1_wide);
  end function;

  function GLB_mux(sel : std_logic; in0 : integer; in1 : signed) return signed is
  begin
    return GLB_mux(sel, to_signed(in0, in1'length), in1);
  end function;

  function GLB_mux(sel : std_logic; in0 : signed; in1 : integer) return signed is
  begin
    return GLB_mux(sel, in0, to_signed(in1, in0'length));
  end function;

end package body;


-- $Id: axi_utils_v2_0_3_pkg.vhd,v 1.2 2011/02/02 15:12:09 gordono Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2010 Xilinx, Inc. All rights reserved.
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

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

package axi_utils_v2_0_3_pkg is

  --c_throttle_scheme values
  constant ci_no_throttle         : integer := 0;
  constant ci_ce_throttle         : integer := 1;
  constant ci_rfd_throttle        : integer := 2;
  constant ci_and_tvalid_throttle : integer := 3;
  constant ci_gen_throttle        : integer := 4;

  --c_aclken_scheme
  constant ci_aclken_ifandcore : integer := 0;
  constant ci_aclken_ifonly    : integer := 1;

  --c_tlast_resolution values
  constant ci_tlast_null    : integer := 0;
  constant ci_tlast_pass_a  : integer := 1;
  constant ci_tlast_pass_b  : integer := 2;
  constant ci_tlast_pass_c  : integer := 3;
  constant ci_tlast_pass_d  : integer := 4;
  constant ci_tlast_pass_e  : integer := 5;
  constant ci_tlast_pass_f  : integer := 6;
  constant ci_tlast_pass_g  : integer := 7;
  constant ci_tlast_pass_h  : integer := 8;
  constant ci_tlast_pass_i  : integer := 9;
  constant ci_tlast_pass_j  : integer := 10;
  constant ci_tlast_pass_k  : integer := 11;
  constant ci_tlast_pass_l  : integer := 12;
  constant ci_tlast_pass_m  : integer := 13;
  constant ci_tlast_pass_n  : integer := 14;
  constant ci_tlast_pass_o  : integer := 15;
  constant ci_tlast_or_all  : integer := 16;
  constant ci_tlast_and_all : integer := 17;

  function byte_roundup (width : integer) return integer;
  function four_byte_roundup (width : integer) return integer;

end axi_utils_v2_0_3_pkg;

package body axi_utils_v2_0_3_pkg is
  function byte_roundup (
    width : integer
    ) return integer is
  begin
    return ((width+7)/8)*8;
  end;

  function four_byte_roundup (
    width : integer
    ) return integer is
  begin
    return ((width+31)/32)*32;
  end;


end axi_utils_v2_0_3_pkg;


-- $Id: axi_utils_comps.vhd,v 1.2 2011/02/02 13:34:59 gordono Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2010 Xilinx, Inc. All rights reserved.
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
use ieee.numeric_std.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

package axi_utils_comps is

  component axi_skid_buffer
    generic (
      c_has_ce    : integer := 0;
      c_has_reset : integer := 0;
      c_width     : integer := 6
      );
    port (
      aclk      : in  std_logic                             := '0';
      ce        : in  std_logic                             := '0';
      areset    : in  std_logic                             := '0';
      rfd       : out std_logic                             := '0';
      din       : in  std_logic_vector(c_width -1 downto 0) := (others => '0');
      valid_in  : in  std_logic                             := '0';
      cts       : in  std_logic                             := '0';
      dout      : out std_logic_vector(c_width -1 downto 0) := (others => '0');
      valid_out : out std_logic                             := '0'
      );
  end component;

  component axi_fifo is
    generic(
      c_width           : integer;
      c_depth_w         : integer;
      c_reg             : integer;
      c_mem_type        : integer;
      c_family          : string;
      c_xdevicefamily   : string;
      c_elaboration_dir : string
      );
    port (
      aclk   : in  std_logic;
      din    : in  std_logic_vector(c_width-1 downto 0);
      rd_en  : in  std_logic;
      areset : in  std_logic;
      wr_en  : in  std_logic;
      dout   : out std_logic_vector(c_width-1 downto 0);
      empty  : out std_logic;
      full   : out std_logic;
      valid  : out std_logic);
  end component;

  component glb_ifx_master is

    generic (
      WIDTH : positive := 32;           --Width of FIFO in bits
      DEPTH : positive := 16;           --Depth of FIFO in words

      AFULL_THRESH1 : natural := 0;     --Almost full assertion threshold
      --  afull asserted as count goes from AFULL_THRESH1 to AFULL_THRESH1+1
      AFULL_THRESH0 : natural := 0      --Almost full deassertion threshold
      --  afull deasserted as count goes from AFULL_THRESH0 to AFULL_THRESH0-1
      --If AFULL_THRESH1 and AFULL_THRESH0 are both zero, afull/not_afull are disabled
      );
    port (
      aclk   : in std_logic;
      aclken : in std_logic := '1';  --Note that this *only* applies to the ifx_valid, ifx_ready and ifx_data ports
      areset : in std_logic;

      --Write interface
      wr_enable : in std_logic;                           --True to write data
      wr_data   : in std_logic_vector(WIDTH-1 downto 0);  --Write data

      --Interface X master interface
      ifx_valid : out std_logic;        --True when master is sending data
      ifx_ready : in  std_logic;        --True when slave is receiving data
      ifx_data  : out std_logic_vector(WIDTH-1 downto 0);  --Data from master (only valied when ifx_valid and ifx_ready asserted)

      --FIFO status
      full      : out std_logic;        --FIFO full
      afull     : out std_logic;        --FIFO almost full
      not_full  : out std_logic;  --FIFO not full (logical inverse of full)
      not_afull : out std_logic;  --FIFO not almost full (logical inverse of afull)
      add       : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
      );
  end component;

  component glb_ifx_slave is
    generic (
      WIDTH : positive := 8;            --Width of FIFO in bits
      DEPTH : positive := 16;           --Depth of FIFO in words

      HAS_UVPROT : boolean := false;  --True if FIFO has underflow protection (i.e. rd_enable to an empty FIFO is safe)
      HAS_IFX    : boolean := false;  --True if FIFO has Interface-X compatible output (note that this also sets HAS_UVPROT=true).

      AEMPTY_THRESH0 : natural := 0;    --Almost empty deassertion threshold
      --  aempty deasserted as count goes from AEMPTY_THRESH0 to AEMPTY_THRESH0+1
      AEMPTY_THRESH1 : natural := 0     --Almost empty assertion threshold
      --  aempty asserted as count goes from AEMPTY_THRESH1 to AEMPTY_THRESH1-1
      --If AEMPTY_THRESH1 and AEMPTY_THRESH0 are both zero, aempty/not_aempty are disabled
      );
    port (
      aclk   : in std_logic;
      aclken : in std_logic := '1';  --Note that this *only* applies to the ifx_valid, ifx_ready and ifx_data ports
      areset : in std_logic; --inverted, registered aresetn
      aresetn : in std_logic; --raw aresetn

      --Interface X slave interface
      ifx_valid : in  std_logic;        --True when master is sending data
      ifx_ready : out std_logic;        --True when slave is receiving data
      ifx_data  : in  std_logic_vector(WIDTH-1 downto 0);  --Data from master (only valied when ifx_valid and ifx_ready asserted)

      --Read interface
      rd_enable : in  std_logic;        --True to read data
      rd_avail  : out std_logic;        --True when rd_data is available
      rd_valid  : out std_logic;  --True when rd_data is available and valid (i.e. has been read)
      rd_data   : out std_logic_vector(WIDTH-1 downto 0);  --Read data (only valid when rd_avail asserted)

      --FIFO status
      full       : out std_logic;       --FIFO full
      empty      : out std_logic;       --FIFO empty
      aempty     : out std_logic;       --FIFO almost empty
      not_full   : out std_logic;  --FIFO not full (logical inverse of full)
      not_empty  : out std_logic;  --FIFO not empty (logical inverse of empty)
      not_aempty : out std_logic;  --FIFO not almost empty (logical inverse of aempty)
      add        : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
      );
  end component;

  component glb_srl_fifo is

    generic (
      WIDTH : positive := 32;           --Width of FIFO in bits
      DEPTH : positive := 16;  --Depth of FIFO in words (must be a power of 2)

      HAS_UVPROT : boolean := false;  --True if FIFO has underflow protection (i.e. rd_enable to an empty FIFO is safe)
      HAS_IFX    : boolean := false;  --True if FIFO has Interface-X compatible output (note that this also sets HAS_UVPROT=true)

      AFULL_THRESH1 : natural := 0;     --Almost full assertion threshold
                                        --  afull asserted as count goes from AFULL_THRESH1 to AFULL_THRESH1+1
      AFULL_THRESH0 : natural := 0;     --Almost full deassertion threshold
                                        --  afull deasserted as count goes from AFULL_THRESH0 to AFULL_THRESH0-1
                                        --If AFULL_THRESH1 and AFULL_THRESH0 are both zero, afull/not_afull are disabled

      AEMPTY_THRESH0 : natural := 0;    --Almost empty deassertion threshold
                                        --  aempty deasserted as count goes from AEMPTY_THRESH0 to AEMPTY_THRESH0+1
      AEMPTY_THRESH1 : natural := 0;    --Almost empty assertion threshold
                                        --  aempty asserted as count goes from AEMPTY_THRESH1 to AEMPTY_THRESH1-1
                                        --If AEMPTY_THRESH1 and AEMPTY_THRESH0 are both zero, aempty/not_aempty are disabled

      HAS_HIERARCHY : boolean := true  --True to apply KEEP_HIERARCHY="soft" to FIFO, false to apply KEEP_HIERARCHY="no"
      );
    port (
      aclk   : in std_logic;
      areset : in std_logic;

      --Write interface
      wr_enable : in std_logic;                           --True to write data
      wr_data   : in std_logic_vector(WIDTH-1 downto 0);  --Write data

      --Read interface
      rd_enable : in  std_logic;        --True to read data
      rd_avail  : out std_logic;        --True when rd_data is available
      rd_valid  : out std_logic;  --True when rd_data is available and valid (i.e. has been read)
      rd_data   : out std_logic_vector(WIDTH-1 downto 0);  --Read data (only valid when rd_avail asserted)

      --FIFO status
      full       : out std_logic;       --FIFO full
      not_full   : out std_logic;  --FIFO not full (logical inverse of full)
      empty      : out std_logic;       --FIFO empty
      not_empty  : out std_logic;  --FIFO not empty (logical inverse of empty)
      afull      : out std_logic;       --FIFO almost full
      not_afull  : out std_logic;  --FIFO not almost full (logical inverse of afull)
      aempty     : out std_logic;       --FIFO almost empty
      not_aempty : out std_logic;  --FIFO not almost empty (logical inverse of aempty)
      add        : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
      );
  end component;

  component axi_slave_2to1
    generic (
      C_A_TDATA_WIDTH : positive := 8;      -- Width of s_axis_a_tdata in bits
      C_HAS_A_TUSER   : boolean  := false;  -- Indicates if s_axis_a_tuser signal is used
      C_A_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_a_tuser in bits (if C_HAS_A_TUSER = true)
      C_HAS_A_TLAST   : boolean  := false;  -- Indicates if s_axis_a_tlast signal is used
      C_B_TDATA_WIDTH : positive := 8;      -- Width of s_axis_b_tdata in bits
      C_HAS_B_TUSER   : boolean  := false;  -- Indicates if s_axis_b_tuser signal is used
      C_B_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_b_tuser in bits (if C_HAS_B_TUSER = true)
      C_HAS_B_TLAST   : boolean  := false;  -- Indicates if s_axis_b_tlast signal is used
      C_HAS_Z_TREADY  : boolean  := true    -- Indicates if m_axis_z_tready signal is used
      );
    port (
      aclk   : in std_logic := '0';       -- Clock
      aclken : in std_logic := '1';       -- Clock enable
      sclr   : in std_logic := '0';       -- Reset, active HIGH

      -- AXI slave interface A
      s_axis_a_tready : out std_logic                                    := '0';              -- TREADY for channel A
      s_axis_a_tvalid : in  std_logic                                    := '0';              -- TVALID for channel A
      s_axis_a_tdata  : in  std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel A
      s_axis_a_tuser  : in  std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel A
      s_axis_a_tlast  : in  std_logic                                    := '0';              -- TLAST for channel A

      -- AXI slave interface B
      s_axis_b_tready : out std_logic                                    := '0';              -- TREADY for channel B
      s_axis_b_tvalid : in  std_logic                                    := '0';              -- TVALID for channel B
      s_axis_b_tdata  : in  std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel B
      s_axis_b_tuser  : in  std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel B
      s_axis_b_tlast  : in  std_logic                                    := '0';              -- TLAST for channel B

      -- Read interface to core
      m_axis_z_tready  : in  std_logic                                    := '1';              -- TREADY for channel Z
      m_axis_z_tvalid  : out std_logic                                    := '0';              -- TVALID for channel Z
      m_axis_z_tdata_a : out std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from A
      m_axis_z_tuser_a : out std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from A
      m_axis_z_tlast_a : out std_logic                                    := '0';              -- Channel Z TLAST from A
      m_axis_z_tdata_b : out std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from B
      m_axis_z_tuser_b : out std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from B
      m_axis_z_tlast_b : out std_logic                                    := '0'               -- Channel Z TLAST from B
      );

  end component;

  component axi_slave_3to1
    generic (
      C_A_TDATA_WIDTH : positive := 8;      -- Width of s_axis_a_tdata in bits
      C_HAS_A_TUSER   : boolean  := false;  -- Indicates if s_axis_a_tuser signal is used
      C_A_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_a_tuser in bits (if C_HAS_A_TUSER = true)
      C_HAS_A_TLAST   : boolean  := false;  -- Indicates if s_axis_a_tlast signal is used
      C_B_TDATA_WIDTH : positive := 8;      -- Width of s_axis_b_tdata in bits
      C_HAS_B_TUSER   : boolean  := false;  -- Indicates if s_axis_b_tuser signal is used
      C_B_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_b_tuser in bits (if C_HAS_B_TUSER = true)
      C_HAS_B_TLAST   : boolean  := false;  -- Indicates if s_axis_b_tlast signal is used
      C_C_TDATA_WIDTH : positive := 8;      -- Width of s_axis_c_tdata in bits
      C_HAS_C_TUSER   : boolean  := false;  -- Indicates if s_axis_c_tuser signal is used
      C_C_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_c_tuser in bits (if C_HAS_C_TUSER = true)
      C_HAS_C_TLAST   : boolean  := false;  -- Indicates if s_axis_c_tlast signal is used
      C_HAS_Z_TREADY  : boolean  := true    -- Indicates if m_axis_z_tready signal is used
      );
    port (
      aclk   : in std_logic := '0';       -- Clock
      aclken : in std_logic := '1';       -- Clock enable
      sclr   : in std_logic := '0';       -- Reset, active HIGH

      -- AXI slave interface A
      s_axis_a_tready : out std_logic                                    := '0';              -- TREADY for channel A
      s_axis_a_tvalid : in  std_logic                                    := '0';              -- TVALID for channel A
      s_axis_a_tdata  : in  std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel A
      s_axis_a_tuser  : in  std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel A
      s_axis_a_tlast  : in  std_logic                                    := '0';              -- TLAST for channel A

      -- AXI slave interface B
      s_axis_b_tready : out std_logic                                    := '0';              -- TREADY for channel B
      s_axis_b_tvalid : in  std_logic                                    := '0';              -- TVALID for channel B
      s_axis_b_tdata  : in  std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel B
      s_axis_b_tuser  : in  std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel B
      s_axis_b_tlast  : in  std_logic                                    := '0';              -- TLAST for channel B

      -- AXI slave interface C
      s_axis_c_tready : out std_logic                                    := '0';              -- TREADY for channel C
      s_axis_c_tvalid : in  std_logic                                    := '0';              -- TVALID for channel C
      s_axis_c_tdata  : in  std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel C
      s_axis_c_tuser  : in  std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel C
      s_axis_c_tlast  : in  std_logic                                    := '0';              -- TLAST for channel C

      -- Read interface to core
      m_axis_z_tready  : in  std_logic                                    := '1';              -- TREADY for channel Z
      m_axis_z_tvalid  : out std_logic                                    := '0';              -- TVALID for channel Z
      m_axis_z_tdata_a : out std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from A
      m_axis_z_tuser_a : out std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from A
      m_axis_z_tlast_a : out std_logic                                    := '0';              -- Channel Z TLAST from A
      m_axis_z_tdata_b : out std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from B
      m_axis_z_tuser_b : out std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from B
      m_axis_z_tlast_b : out std_logic                                    := '0';              -- Channel Z TLAST from B
      m_axis_z_tdata_c : out std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from C
      m_axis_z_tuser_c : out std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from C
      m_axis_z_tlast_c : out std_logic                                    := '0'               -- Channel Z TLAST from C
      );

  end component;

  component axi_slave_4to1
    generic (
      C_A_TDATA_WIDTH : positive := 8;  -- Width of s_axis_a_tdata in bits
      C_HAS_A_TUSER   : boolean  := false;  -- Indicates if s_axis_a_tuser signal is used
      C_A_TUSER_WIDTH : natural  := 1;  -- Width of s_axis_a_tuser in bits (if C_HAS_A_TUSER = true)
      C_HAS_A_TLAST   : boolean  := false;  -- Indicates if s_axis_a_tlast signal is used
      C_B_TDATA_WIDTH : positive := 8;  -- Width of s_axis_b_tdata in bits
      C_HAS_B_TUSER   : boolean  := false;  -- Indicates if s_axis_b_tuser signal is used
      C_B_TUSER_WIDTH : natural  := 1;  -- Width of s_axis_b_tuser in bits (if C_HAS_B_TUSER = true)
      C_HAS_B_TLAST   : boolean  := false;  -- Indicates if s_axis_b_tlast signal is used
      C_C_TDATA_WIDTH : positive := 8;  -- Width of s_axis_c_tdata in bits
      C_HAS_C_TUSER   : boolean  := false;  -- Indicates if s_axis_c_tuser signal is used
      C_C_TUSER_WIDTH : natural  := 1;  -- Width of s_axis_c_tuser in bits (if C_HAS_C_TUSER = true)
      C_HAS_C_TLAST   : boolean  := false;  -- Indicates if s_axis_c_tlast signal is used
      C_D_TDATA_WIDTH : positive := 8;  -- Width of s_axis_d_tdata in bits
      C_HAS_D_TUSER   : boolean  := false;  -- Indicates if s_axis_d_tuser signal is used
      C_D_TUSER_WIDTH : natural  := 1;  -- Width of s_axis_d_tuser in bits (if C_HAS_D_TUSER = true)
      C_HAS_D_TLAST   : boolean  := false;  -- Indicates if s_axis_d_tlast signal is used
      C_HAS_Z_TREADY  : boolean  := true  -- Indicates if m_axis_z_tready signal is used
      );
    port (
      aclk   : in std_logic := '0';     -- Clock
      aclken : in std_logic := '1';     -- Clock enable
      sclr   : in std_logic := '0';     -- Reset, active HIGH

      -- AXI slave interface A
      s_axis_a_tready : out std_logic                                    := '0';  -- TREADY for channel A
      s_axis_a_tvalid : in  std_logic                                    := '0';  -- TVALID for channel A
      s_axis_a_tdata  : in  std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel A
      s_axis_a_tuser  : in  std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel A
      s_axis_a_tlast  : in  std_logic                                    := '0';  -- TLAST for channel A

      -- AXI slave interface B
      s_axis_b_tready : out std_logic                                    := '0';  -- TREADY for channel B
      s_axis_b_tvalid : in  std_logic                                    := '0';  -- TVALID for channel B
      s_axis_b_tdata  : in  std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel B
      s_axis_b_tuser  : in  std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel B
      s_axis_b_tlast  : in  std_logic                                    := '0';  -- TLAST for channel B

      -- AXI slave interface C
      s_axis_c_tready : out std_logic                                    := '0';  -- TREADY for channel C
      s_axis_c_tvalid : in  std_logic                                    := '0';  -- TVALID for channel C
      s_axis_c_tdata  : in  std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel C
      s_axis_c_tuser  : in  std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel C
      s_axis_c_tlast  : in  std_logic                                    := '0';  -- TLAST for channel C

      -- AXI slave interface D
      s_axis_d_tready : out std_logic                                    := '0';  -- TREADY for channel D
      s_axis_d_tvalid : in  std_logic                                    := '0';  -- TVALID for channel D
      s_axis_d_tdata  : in  std_logic_vector(C_D_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel D
      s_axis_d_tuser  : in  std_logic_vector(C_D_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel D
      s_axis_d_tlast  : in  std_logic                                    := '0';  -- TLAST for channel D

      -- Read interface to core
      m_axis_z_tready  : in  std_logic                                    := '1';  -- TREADY for channel Z
      m_axis_z_tvalid  : out std_logic                                    := '0';  -- TVALID for channel Z
      m_axis_z_tdata_a : out std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from A
      m_axis_z_tuser_a : out std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from A
      m_axis_z_tlast_a : out std_logic                                    := '0';  -- Channel Z TLAST from A
      m_axis_z_tdata_b : out std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from B
      m_axis_z_tuser_b : out std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from B
      m_axis_z_tlast_b : out std_logic                                    := '0';  -- Channel Z TLAST from B
      m_axis_z_tdata_c : out std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from C
      m_axis_z_tuser_c : out std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from C
      m_axis_z_tlast_c : out std_logic                                    := '0';  -- Channel Z TLAST from C
      m_axis_z_tdata_d : out std_logic_vector(C_D_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from D
      m_axis_z_tuser_d : out std_logic_vector(C_D_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from D
      m_axis_z_tlast_d : out std_logic                                    := '0'  -- Channel Z TLAST from D
      );

  end component;

end axi_utils_comps;

package body axi_utils_comps is

end axi_utils_comps;


------------------------------------------------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/axi_utils_v2_0_3/hdl/glb_srl_fifo.vhd,v 1.2 2011/02/09 11:37:58 gordono Exp $
------------------------------------------------------------------------------------------------------------------------
--
--  (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------------------------------------------------------------------
--
--  Title: glb_srl_fifo.vhd
--  Author: David Andrews
--  Date  : August 2008
--  Description: SRL based FIFO
--
--  Simple and fast SRL FIFO with the following features:
--    o Very small overhead over a single register [uses ceil(log2(DEPTH+1)) extra FDs for control]
--    o Optional underflow protection (HAS_UVPROT)
--      Gates rd_enable with not empty to prevent reads when FIFO is empty
--    o Optional Interface-X compatible output (HAS_IFX)
--      User should drive rd_enable with (not valid or ready)
--      Uses clock enable on the post-SRL FD to hold data until valid and ready asserted
--      Note that FIFO also requires underflow protection for this to work
--    o Optional programmable almost full/empty flags, with potential hysteresis
--      FIFO also contains negated version of the same outputs.
--      These output are sometimes more useful (e.g. not_afull can drive a CE directly without the need for inverter)
--    o The FIFO does not have a count output
--      Instead, the FIFO has an add output (SRL address) - at all times add=count-1
--
--  Performance:
--    The FIFO will generally run at full speed when DEPTH<=16, but note the following:
--    o Use of the empty/add outputs does not increase resource usage (they are uses internally by the FIFO so are always present)
--    o Use of the full/afull/not_afull/aempty/not_aempty/rd_avail outputs increases resource usage
--    o The HAS_IFX mode uses a gated clock enable (e.g. LUT feeding CE)
--        If map does a reasonable job, this is generally acceptable.
--        If map does a bad job...
--    o afull/not_afull logic is disabled when AFULL_THRESH1=AFULL_THRESH0=0
--    o aempty/not_aempty logic is disabled when AEMPTY_THRESH1=AEMPTY_THRESH0=0
--    o afull/not_afull logic is minimised when AFULL_THRESH1=AFULL_THRESH0 (i.e. no hysteresis)
--    o aempty/not_aempty logic is mninimised when AEMPTY_THRESH1=AEMPTY_THRESH0 (i.e. no hysteresis)
--
------------------------------------------------------------------------------------------------------------------------
--  SRL FIFO: DEPTH=4, HAS_UVPROT=false, HAS_IFX=false, AFULL_THRESH0=AFULL_THRESH1=2, AEMPTY_THRESH0=AEMPTY_THRESH1=1
--              _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
--  aclk       | |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_
--
--                  _______________                             _______________
--  wr_enable  ____|               |___________________________|               |___________
--                  ___ ___ ___ ___                             ___ ___ ___ ___
--  wr_data    XXXX|a__|b__|c__|d__|XXXXXXXXXXXXXXXXXXXXXXXXXXX|A__|B__|C__|D__|XXXXXXXXXXX
--
--                                      _______________             _______________
--  rd_enable  ________________________|               |___________|               |_______
--                                          _______________             _______________
--  rd_valid   ____________________________|               |___________|               |___
--                          _______________________________             _______________
--  rd_avail   ____________|                               |___________|               |___
--                          ___________________ ___ ___ ___             ___ ___ ___ ___
--  rd_data    XXXXXXXXXXXX|a__________________|b__|c__|d__|XXXXXXXXXXX|A__|B__|C__|D__|XXX
--
--                                  _______
--  full       ____________________|       |_______________________________________________
--             ________                                 ___________                 _______
--  empty              |_______________________________|           |_______________|
--                              ___________________
--  afull      ________________|                   |_______________________________________
--             ____________                             ___________________________________
--  aempty                 |___________________________|
--             ________ ___ ___ ___ _______ ___ ___ ___ ___________ _______________ _______
--  add        _-1_____|0__|1__|2__|3______|2__|1__|0__|-1_________|0______________|-1_____
--
--                                                     http://rann:1337/mywave.cgi/iFBdL1YE
------------------------------------------------------------------------------------------------------------------------
--  SRL FIFO: DEPTH=4, HAS_UVPROT=true, HAS_IFX=true, AFULL_THRESH0=AFULL_THRESH1=2, AEMPTY_THRESH0=AEMPTY_THRESH1=1
--              _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
--  aclk       | |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_
--
--                  _______________                             _______________
--  wr_enable  ____|               |___________________________|               |___________
--                  ___ ___ ___ ___                             ___ ___ ___ ___
--  wr_data    XXXX|a__|b__|c__|d__|XXXXXXXXXXXXXXXXXXXXXXXXXXX|A__|B__|C__|D__|XXXXXXXXXXX
--
--                                          ___________     _______________________________
--  ifx_ready  ____________________________|           |___|
--             ____________                 ___________     _______________________________
--  rd_enable              |_______________|           |___|
--                          ___________________________________         _______________
--  rd_valid   ____________|                                   |_______|               |___
--                          ___________________________________         _______________
--  rd_avail   ____________|                                   |_______|               |___
--                          ___________________ ___ ___ _______         ___ ___ ___ ___
--  rd_data    XXXXXXXXXXXX|a__________________|b__|c__|d______|XXXXXXX|A__|B__|C__|D__|XXX
--
--                                                     http://rann:1337/mywave.cgi/mrIfuKeM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

entity glb_srl_fifo is

  generic (
    WIDTH : positive := 32;             --Width of FIFO in bits
    DEPTH : positive := 16;  --Depth of FIFO in words (must be a power of 2)

    HAS_UVPROT : boolean := false;  --True if FIFO has underflow protection (i.e. rd_enable to an empty FIFO is safe)
    HAS_IFX    : boolean := false;  --True if FIFO has Interface-X compatible output (note that this also sets HAS_UVPROT=true)

    AFULL_THRESH1 : natural := 0;       --Almost full assertion threshold
                                        --  afull asserted as count goes from AFULL_THRESH1 to AFULL_THRESH1+1
    AFULL_THRESH0 : natural := 0;       --Almost full deassertion threshold
                                        --  afull deasserted as count goes from AFULL_THRESH0 to AFULL_THRESH0-1
                                        --If AFULL_THRESH1 and AFULL_THRESH0 are both zero, afull/not_afull are disabled

    AEMPTY_THRESH0 : natural := 0;      --Almost empty deassertion threshold
                                        --  aempty deasserted as count goes from AEMPTY_THRESH0 to AEMPTY_THRESH0+1
    AEMPTY_THRESH1 : natural := 0;      --Almost empty assertion threshold
                                        --  aempty asserted as count goes from AEMPTY_THRESH1 to AEMPTY_THRESH1-1
                                        --If AEMPTY_THRESH1 and AEMPTY_THRESH0 are both zero, aempty/not_aempty are disabled

    HAS_HIERARCHY : boolean := true  --True to apply KEEP_HIERARCHY="soft" to FIFO, false to apply KEEP_HIERARCHY="no"
    );
  port (
    aclk   : in std_logic;
    areset : in std_logic;

    --Write interface
    wr_enable : in std_logic;                           --True to write data
    wr_data   : in std_logic_vector(WIDTH-1 downto 0);  --Write data

    --Read interface
    rd_enable : in  std_logic;          --True to read data
    rd_avail  : out std_logic;          --True when rd_data is available
    rd_valid  : out std_logic;  --True when rd_data is available and valid (i.e. has been read)
    rd_data   : out std_logic_vector(WIDTH-1 downto 0);  --Read data (only valid when rd_avail asserted)

    --FIFO status
    full       : out std_logic;         --FIFO full
    not_full   : out std_logic;  --FIFO not full (logical inverse of full)
    empty      : out std_logic;         --FIFO empty
    not_empty  : out std_logic;  --FIFO not empty (logical inverse of empty)
    afull      : out std_logic;         --FIFO almost full
    not_afull  : out std_logic;  --FIFO not almost full (logical inverse of afull)
    aempty     : out std_logic;         --FIFO almost empty
    not_aempty : out std_logic;  --FIFO not almost empty (logical inverse of aempty)
    add        : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
    );

end entity;

------------------------------------------------------------------------------------------------------------------------
architecture xilinx of glb_srl_fifo is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  constant HAS_AFULL  : boolean := (AFULL_THRESH0 > 0 and AFULL_THRESH1 > 0);
  constant HAS_AEMPTY : boolean := (AEMPTY_THRESH0 > 0 and AEMPTY_THRESH1 > 0);

  --Types
  subtype Word is std_logic_vector(WIDTH-1 downto 0);
  type WordArray is array (natural range <>) of Word;

  --Gated read/write signals
  signal rd_en : std_logic;
  signal wr_en : std_logic;

  --FIFO data
  signal fifo_1 : WordArray(0 to DEPTH-1) := (others => (others => '0'));

  --FIFO address/count
  signal add_1 : signed(add'range) := (others => '1');

  --Full/empty flags
  signal full_1       : std_logic := '0';
  signal not_full_1   : std_logic := '1';
  signal empty_1      : std_logic := '1';  --This is an alias of MSB of add_1
  signal not_empty_1  : std_logic := '0';
  signal afull_1      : std_logic := '0';
  signal aempty_1     : std_logic := '1';
  signal not_afull_1  : std_logic := '1';
  signal not_aempty_1 : std_logic := '0';

  --Data avail/valid flags
  signal rd_avail_2 : std_logic := '0';
  signal rd_valid_2 : std_logic := '0';

  --FIFO read data
  signal fifo_2 : Word := (others => '0');

  ------------------------------------------------------------------------------------------------------------------------
  --Compare FIFO count with THRESH (i.e. compare add with THRESH-1)
  --  Note that we actually only compare the LSBs of add and ignore the sign
  --  This makes the compare ambiguous between add=-1 and add=DEPTH-1
  --  This ambiguity must be resolved by the caller
  function eq(THRESH : integer; add : signed) return boolean is
    constant T : signed(add'range) := to_signed(THRESH-1, add'length);
  begin
    assert THRESH >= 0 and THRESH <= DEPTH
                                  report "ERROR:THRESH must be in range [0,DEPTH]"
                                  severity failure;
    return (add(add'left-1 downto 0) = T(add'left-1 downto 0));
  end function;

  ------------------------------------------------------------------------------------------------------------------------
  --We want carry chains for adders
  attribute use_carry_chain of add_1 : signal is "yes";

  --Don't replicate high fan-in registers
  attribute register_duplication of add_1        : signal is "no";
  attribute register_duplication of full_1       : signal is "no";
  attribute register_duplication of not_full_1   : signal is "no";
  attribute register_duplication of not_empty_1  : signal is "no";
  attribute register_duplication of afull_1      : signal is "no";
  attribute register_duplication of aempty_1     : signal is "no";
  attribute register_duplication of not_afull_1  : signal is "no";
  attribute register_duplication of not_aempty_1 : signal is "no";

  --Stop XST trying to use CE on these signals
  attribute use_clock_enable of add_1        : signal is "no";
  attribute use_clock_enable of full_1       : signal is "no";
  attribute use_clock_enable of not_full_1   : signal is "no";
  attribute use_clock_enable of not_empty_1  : signal is "no";
  attribute use_clock_enable of afull_1      : signal is "no";
  attribute use_clock_enable of aempty_1     : signal is "no";
  attribute use_clock_enable of not_afull_1  : signal is "no";
  attribute use_clock_enable of not_aempty_1 : signal is "no";
  attribute use_clock_enable of rd_avail_2   : signal is "no";
  attribute use_clock_enable of rd_valid_2   : signal is "no";

  --Stop XST trying to use SET on these signals
  attribute use_sync_set of not_empty_1  : signal is "no";
  attribute use_sync_set of full_1       : signal is "no";
  attribute use_sync_set of afull_1      : signal is "no";
  attribute use_sync_set of not_aempty_1 : signal is "no";
  attribute use_sync_set of rd_avail_2   : signal is "no";
  attribute use_sync_set of rd_valid_2   : signal is "no";

  --Stop XST trying to use RESET on these signals
  attribute use_sync_reset of add_1       : signal is "no";
  attribute use_sync_reset of not_full_1  : signal is "no";
  attribute use_sync_reset of aempty_1    : signal is "no";
  attribute use_sync_reset of not_afull_1 : signal is "no";
  attribute use_sync_reset of rd_valid_2  : signal is "no";

  --Keep hierarchy around this entity
  constant ci_keep_hierarchy : string := GLB_if(HAS_HIERARCHY, "soft", "no");
  attribute keep_hierarchy of xilinx : architecture is ci_keep_hierarchy;

begin
  -- synthesis translate off
  ------------------------------------------------------------------------------------------------------------------------
  assumptions : block 
  begin
    assert DEPTH >= 4
      report "ERROR:DEPTH must be >=4"
      severity failure;
    assert GLB_is_pow2(DEPTH)
      report "ERROR:DEPTH must be a power of 2"
      severity failure;

    --Check the thresholds
    --  The eq() function has an ambiguity when a threshold is 0 or DEPTH - we need to make sure that we avoid the ambiguity
    --  If a threshold is only used when the FIFO count is incrementing, we know it makes no sense to looks for count=DEPTH (as we'd be overflowing)
    --  If a threshold is only used when the FIFO count is decrementing, we know it makes no sense to looks for count=0 (as we'd be underflowing)
    assert not HAS_AFULL or AFULL_THRESH1 < DEPTH
      report "ERROR:AFULL_THRESH1 muts be <DEPTH"
      severity failure;
    assert not HAS_AEMPTY or AEMPTY_THRESH0 < DEPTH
      report "ERROR:AEMPTY_THRESH0 muts be <DEPTH"
      severity failure;
    assert not HAS_AFULL or AFULL_THRESH0 > 0
      report "ERROR:AFULL_THRESH0 muts be >0"
      severity failure;
    assert not HAS_AEMPTY or AEMPTY_THRESH1 > 0
      report "ERROR:AEMPTY_THRESH1 muts be >0"
      severity failure;
  end block;
  --synthesis translate on

  ------------------------------------------------------------------------------------------------------------------------
  io : block
  begin
    --Empty flag is always MSB of add_1 (if add_1<0 FIFO is empty)
    empty_1 <= add_1(add_1'left);

    --Outputs
    rd_avail   <= rd_avail_2;
    rd_valid   <= rd_valid_2;
    rd_data    <= fifo_2;
    full       <= full_1;
    not_full   <= not_full_1;
    empty      <= empty_1;
    not_empty  <= not_empty_1;
    afull      <= afull_1;
    aempty     <= aempty_1;
    not_afull  <= not_afull_1;
    not_aempty <= not_aempty_1;
    add        <= add_1;

    --Gate rd_enable against not empty if HAS_UVPROT or HAS_IFX generics set
    rd_en <= rd_enable and GLB_if(HAS_UVPROT or HAS_IFX, not empty_1, '1');
    wr_en <= wr_enable;
  end block;

  ------------------------------------------------------------------------------------------------------------------------
  reg_proc : process (aclk)
    --Increment/decrement value for add_1 signal
    variable add_lhs : unsigned(add_1'range);
    variable add_cin : unsigned(0 downto 0);

  begin
    if rising_edge(aclk) then

      if (areset = '1') then
        add_1        <= (others => '1');
        not_empty_1  <= '0';
        full_1       <= '0';
        not_full_1   <= '1';
        afull_1      <= '0';
        aempty_1     <= '1';
        not_afull_1  <= '1';
        not_aempty_1 <= '0';
        rd_avail_2   <= '0';
        rd_valid_2   <= '0';
      else
        if (not HAS_IFX or rd_enable = '1') then
                                        --Data is available when we're not empty
          rd_avail_2 <= not empty_1;
                                        --Data is valid if we're doing a read
          rd_valid_2 <= rd_en;
        end if;

        if (rd_en = '0' and wr_en = '1') then
                                        --No read, write (add word to FIFO)

                                        -- synthesis translate off
          assert full_1 = '0'
            report "ERROR:Write to full FIFO"
            severity failure;
                                        -- synthesis translate on

                                        --Update flags
          if eq(DEPTH-1, add_1) then
            full_1     <= '1';
            not_full_1 <= '0';
          end if;

          not_empty_1 <= '1';  --Adding word to FIFO, so can not be empty

          if (HAS_AFULL and eq(AFULL_THRESH1, add_1)) then
            afull_1     <= '1';
            not_afull_1 <= '0';
          end if;

          if (HAS_AEMPTY and eq(AEMPTY_THRESH0, add_1)) then
            aempty_1     <= '0';
            not_aempty_1 <= '1';
          end if;

        elsif (rd_en = '1' and wr_en = '0') then
                                        --Read, no write (remove word from FIFO)

                                        -- synthesis translate off
          assert empty_1 = '0'
            report "ERROR:Read from empty FIFO"
            severity failure;
                                        -- synthesis translate on

                                        --Update flags
          full_1     <= '0';  --Removing word from FIFO, so can not be full
          not_full_1 <= '1';

          if (eq(1, add_1)) then
            not_empty_1 <= '0';
          end if;

          if (HAS_AFULL and eq(AFULL_THRESH0, add_1)) then
            afull_1     <= '0';
            not_afull_1 <= '1';
          end if;

          if (HAS_AEMPTY and eq(AEMPTY_THRESH1, add_1)) then
            aempty_1     <= '1';
            not_aempty_1 <= '0';
          end if;

        elsif (rd_en = '1' and wr_en = '1') then
                                        --Read and write

                                        -- synthesis translate off
          assert empty_1 = '0'
            report "ERROR:Read/write from empty FIFO"
            severity failure;
                                        -- synthesis translate on

          null;                         --FIFO state doesn't change
        end if;

        --Need to add n to add_1 (where n=-1,0 or +1 depending on wr_en/rd_en)
        --  By using the cin we save one input to the LUT, which helps when absorbing logic on rd_enable
        add_lhs    := (others => rd_en);  --When rd_en is high, add_lhs is 11.11 (i.e. -1)
        add_cin(0) := wr_en;  --When wr_en is high, add_cin is 1 (i.e. +1)
        add_1      <= signed(std_logic_vector(add_lhs+unsigned(add_1)+add_cin));  --Note that the order (lhs+add+cin) is important otehrwise XST infers an accumulator...

      end if;

      --Write word to FIFO
      if (wr_en = '1') then
        fifo_1 <= (wr_data & fifo_1(0 to DEPTH-2));
      end if;

      --Read from FIFO
      -- When addressing the SRL, we ignore the sign of add_1. Note we're slicing a signed into an unsigned
      if (not HAS_IFX or rd_enable = '1') then
        fifo_2 <= fifo_1(to_integer(unsigned(add_1(add'left-1 downto 0))));
      end if;

    end if;
  end process;

  ------------------------------------------------------------------------------------------------------------------------
  --Simulation only checking process
  -- synthesis translate off
  check_proc : process (aclk)
    --Coverpoints
    constant READS  : natural := 0;
    constant WRITES : natural := 0;
    constant COUNT  : natural := 0;
    constant DATA   : natural := 0;
  begin
    if rising_edge(aclk) then
      --Invariants
      assert rd_valid_2 = '0' or rd_avail_2 = '1'
        report "ERROR:rd_avail asserted when rd_valid deasserted"
        severity failure;
      assert (add_1 >= -1 and add_1 <= DEPTH-1)
        report "ERROR:add_1 must be in range [-1,DEPTH-1]"
        severity failure;
      assert (add_1 = -1) = (empty_1 = '1')
        report "ERROR:add_1 and empty_1 are inconsistent"
        severity failure;
      assert (add_1 = DEPTH-1) = (full_1 = '1')
        report "ERROR:add_1 and full_1 are inconsistent"
        severity failure;
      assert full_1 = '0' or empty_1 = '0'
        report "ERROR:full and empty asserted at the same time"
        severity failure;
      assert full_1 = not not_full_1
        report "ERROR:full_1 and not_full_1 are inconsistent"
        severity failure;
      assert empty_1 = not not_empty_1
        report "ERROR:empty_1 and not_empty_1 are inconsistent"
        severity failure;
      assert afull_1 = not not_afull_1
        report "ERROR:afull_1 and not_afull_1 are inconsistent"
        severity failure;
      assert aempty_1 = not not_aempty_1
        report "ERROR:aempty_1 and not_aempty_1 are inconsistent"
        severity failure;
    end if;
  end process;
  -- synthesis translate on

end architecture;



------------------------------------------------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/axi_utils_v2_0_3/hdl/glb_ifx_slave.vhd,v 1.3 2011/02/02 15:12:09 gordono Exp $
------------------------------------------------------------------------------------------------------------------------
--
--  (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------------------------------------------------------------------
--
--  Title: glb_ifx_slave.vhd
--  Author: David Andrews
--  Date  : August 2008
--  Description: Interface-X like slave interface with SRL FIFO
--
--  Note that the aclken input *only* affects the IFX side of the interface (ifx_valid, ifx_data and ifx_ready)
--  The local interfaces run directly from the ungated aclk.
--
------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;
use axi_utils_v2_0_3.axi_utils_comps.all;

entity glb_ifx_slave is
  generic (
    WIDTH : positive := 8;              --Width of FIFO in bits
    DEPTH : positive := 16;             --Depth of FIFO in words
    
    HAS_UVPROT : boolean := false;  --True if FIFO has underflow protection (i.e. rd_enable to an empty FIFO is safe)
    HAS_IFX    : boolean := false;  --True if FIFO has Interface-X compatible output (note that this also sets HAS_UVPROT=true).  

    AEMPTY_THRESH0 : natural := 0;      --Almost empty deassertion threshold
    --  aempty deasserted as count goes from AEMPTY_THRESH0 to AEMPTY_THRESH0+1
    AEMPTY_THRESH1 : natural := 0       --Almost empty assertion threshold
    --  aempty asserted as count goes from AEMPTY_THRESH1 to AEMPTY_THRESH1-1
    --If AEMPTY_THRESH1 and AEMPTY_THRESH0 are both zero, aempty/not_aempty are disabled
    );
  port (
    aclk   : in std_logic;
    aclken : in std_logic := '1';  --Note that this *only* applies to the ifx_valid, ifx_ready and ifx_data ports
    areset : in std_logic; -- inverted, registered aresetn
    aresetn : in std_logic; --raw aresetn

    --Interface X slave interface
    ifx_valid : in  std_logic;          --True when master is sending data
    ifx_ready : out std_logic;          --True when slave is receiving data
    ifx_data  : in  std_logic_vector(WIDTH-1 downto 0);  --Data from master (only valied when ifx_valid and ifx_ready asserted)

    --Read interface
    rd_enable : in  std_logic;          --True to read data
    rd_avail  : out std_logic;          --True when rd_data is available
    rd_valid  : out std_logic;  --True when rd_data is available and valid (i.e. has been read)
    rd_data   : out std_logic_vector(WIDTH-1 downto 0);  --Read data (only valid when rd_avail asserted)

    --FIFO status
    full       : out std_logic;         --FIFO full
    empty      : out std_logic;         --FIFO empty
    aempty     : out std_logic;         --FIFO almost empty
    not_full   : out std_logic;  --FIFO not full (logical inverse of full)
    not_empty  : out std_logic;  --FIFO not empty (logical inverse of empty)
    not_aempty : out std_logic;  --FIFO not almost empty (logical inverse of aempty)
    add        : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
    );

end entity;

------------------------------------------------------------------------------------------------------------------------
architecture xilinx of glb_ifx_slave is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  signal not_afull : std_logic;
  signal mod_ready : std_logic;

  signal fifo_wr_enable_1 : std_logic                          := '0';
  signal fifo_wr_data_1   : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal ifx_ready_1      : std_logic                          := '0';

begin

  ------------------------------------------------------------------------------------------------------------------------
  -- synthesis translate off
  assumptions : block
  begin
    assert DEPTH >= 4
      report "ERROR:DEPTH must be >=4"
      severity failure;
  end block;
  -- synthesis translate on

  ------------------------------------------------------------------------------------------------------------------------
  io : block
  begin
    ifx_ready <= ifx_ready_1;
  end block;

  ------------------------------------------------------------------------------------------------------------------------
  --FIFO instance (note that the afull flag thresholds are used by this instance)
  fifo0 : glb_srl_fifo
    generic map (
      WIDTH          => WIDTH,
      DEPTH          => DEPTH,
      HAS_UVPROT     => HAS_UVPROT,
      HAS_IFX        => HAS_IFX,
      AFULL_THRESH1  => DEPTH-3,
      AFULL_THRESH0  => DEPTH-3,
      AEMPTY_THRESH1 => AEMPTY_THRESH1,
      AEMPTY_THRESH0 => AEMPTY_THRESH0
      )
    port map (
      aclk       => aclk,
      areset     => areset,
      wr_enable  => fifo_wr_enable_1,
      wr_data    => fifo_wr_data_1,
      rd_enable  => rd_enable,
      rd_avail   => rd_avail,
      rd_valid   => rd_valid,
      rd_data    => rd_data,
      full       => full,
      not_full   => not_full,
      empty      => empty,
      not_empty  => not_empty,
      afull      => open,
      not_afull  => not_afull,
      aempty     => aempty,
      not_aempty => not_aempty,
      add        => add
      );

  ------------------------------------------------------------------------------------------------------------------------
  --Slave engine
  mod_ready <= not_afull and aresetn;

  regProc : process (aclk)
  begin
    if rising_edge(aclk) then
      fifo_wr_enable_1 <= aclken and (ifx_valid and ifx_ready_1 and not areset);
      fifo_wr_data_1   <= ifx_data;
      --v1.0 code below, modified to squelch ready during reset.
--      ifx_ready_1      <= GLB_if(aclken, not_afull, ifx_ready_1);
      if areset = '1' then
        ifx_ready_1 <= '0';
      elsif aclken = '1' then
        ifx_ready_1 <= mod_ready;
      end if;
    end if;
  end process;

end architecture;



------------------------------------------------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/axi_utils_v2_0_3/hdl/glb_ifx_master.vhd,v 1.1 2011/02/02 12:20:39 gordono Exp $
------------------------------------------------------------------------------------------------------------------------
--
--  (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------------------------------------------------------------------
--
--  Title: glb_ifx_master.vhd
--  Author: David Andrews
--  Date  : August 2008
--  Description: Interface-X like master interface with SRL FIFO
--
--  Note that the aclken input *only* affects the IFX side of the interface (ifx_valid, ifx_data and ifx_ready)
--  The local interfaces run directly from the ungated aclk.
--
------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;
use axi_utils_v2_0_3.axi_utils_comps.all;

entity glb_ifx_master is

  generic (
    WIDTH : positive := 32;             --Width of FIFO in bits
    DEPTH : positive := 16;             --Depth of FIFO in words

    AFULL_THRESH1 : natural := 0;       --Almost full assertion threshold
    --  afull asserted as count goes from AFULL_THRESH1 to AFULL_THRESH1+1
    AFULL_THRESH0 : natural := 0        --Almost full deassertion threshold
    --  afull deasserted as count goes from AFULL_THRESH0 to AFULL_THRESH0-1
    --If AFULL_THRESH1 and AFULL_THRESH0 are both zero, afull/not_afull are disabled
    );
  port (
    aclk   : in std_logic;
    aclken : in std_logic := '1';  --Note that this *only* applies to the ifx_valid, ifx_ready and ifx_data ports
    areset : in std_logic;

    --Write interface
    wr_enable : in std_logic;                           --True to write data
    wr_data   : in std_logic_vector(WIDTH-1 downto 0);  --Write data

    --Interface X master interface
    ifx_valid : out std_logic;          --True when master is sending data
    ifx_ready : in  std_logic;          --True when slave is receiving data
    ifx_data  : out std_logic_vector(WIDTH-1 downto 0);  --Data from master (only valied when ifx_valid and ifx_ready asserted)

    --FIFO status
    full      : out std_logic;          --FIFO full
    afull     : out std_logic;          --FIFO almost full
    not_full  : out std_logic;  --FIFO not full (logical inverse of full)
    not_afull : out std_logic;  --FIFO not almost full (logical inverse of afull)
    add       : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
    );

end entity;

------------------------------------------------------------------------------------------------------------------------
architecture xilinx of glb_ifx_master is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  signal fifo_rd_enable : std_logic;
  signal fifo_rd_valid  : std_logic;
  signal fifo_rd_data   : std_logic_vector(WIDTH-1 downto 0);

  ------------------------------------------------------------------------------------------------------------------------
  --Keep hierarchy around this entity
  attribute keep_hierarchy of xilinx : architecture is "soft";

begin

  ------------------------------------------------------------------------------------------------------------------------
  --synthesis translate off
  assumptions : block
  begin
    assert DEPTH >= 4
      report "ERROR:DEPTH must be >=4"
      severity failure;
  end block;
  --synthesis translate on

  ------------------------------------------------------------------------------------------------------------------------
  io : block
  begin
    ifx_valid      <= fifo_rd_valid;
    ifx_data       <= fifo_rd_data;
    fifo_rd_enable <= aclken and (not fifo_rd_valid or ifx_ready);
  end block;

  ------------------------------------------------------------------------------------------------------------------------
  --FIFO instance
  fifo0 : glb_srl_fifo
    generic map (
      WIDTH         => WIDTH, DEPTH => DEPTH, HAS_UVPROT => true, HAS_IFX => true,
      AFULL_THRESH1 => AFULL_THRESH1, AFULL_THRESH0 => AFULL_THRESH0,
      HAS_HIERARCHY => false  --Don't keep the hierarchy so that gates at this level can be absorbed into FIFO
      )
    port map (
      aclk      => aclk, areset => areset,
      wr_enable => wr_enable, wr_data => wr_data,
      rd_enable => fifo_rd_enable, rd_avail => open, rd_valid => fifo_rd_valid, rd_data => fifo_rd_data,
      full      => full, not_full => not_full,
      empty     => open, not_empty => open,
      afull     => afull, not_afull => not_afull,
      aempty    => open, not_aempty => open,
      add       => add
      );

end architecture;



-- $Header : $
------------------------------------------------------------
--  (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------
-- axi_slave_2to1.vhd
-- A 2 to 1 AXI slave channel synchronizer.
-- Provides 2 AXI slave interfaces for input channels
-- and 1 AXI master interface for connection to a core.
-- A transaction must be received on each slave interface
-- before a transaction is created on the master interface.
-- Latency = 1 while m_axis_z_tready is high (full throughput).
-- The master interface TREADY is optional (it is typically the
-- logical AND of the core's RFD and the output FIFO's TREADY).
-- Payload signals (TDATA, TUSER, TLAST) are not combined,
-- and are presented synchronized but separately on the
-- master interface.
--
-- Slave interfaces: A, B
-- Master interface: Z
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity axi_slave_2to1 is
  generic (
    C_A_TDATA_WIDTH : positive := 8;      -- Width of s_axis_a_tdata in bits
    C_HAS_A_TUSER   : boolean  := false;  -- Indicates if s_axis_a_tuser signal is used
    C_A_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_a_tuser in bits (if C_HAS_A_TUSER = true)
    C_HAS_A_TLAST   : boolean  := false;  -- Indicates if s_axis_a_tlast signal is used
    C_B_TDATA_WIDTH : positive := 8;      -- Width of s_axis_b_tdata in bits
    C_HAS_B_TUSER   : boolean  := false;  -- Indicates if s_axis_b_tuser signal is used
    C_B_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_b_tuser in bits (if C_HAS_B_TUSER = true)
    C_HAS_B_TLAST   : boolean  := false;  -- Indicates if s_axis_b_tlast signal is used
    C_HAS_Z_TREADY  : boolean  := true    -- Indicates if m_axis_z_tready signal is used
    );
  port (
    aclk   : in std_logic := '0';       -- Clock
    aclken : in std_logic := '1';       -- Clock enable
    sclr   : in std_logic := '0';       -- Reset, active HIGH

    -- AXI slave interface A
    s_axis_a_tready : out std_logic                                    := '0';              -- TREADY for channel A
    s_axis_a_tvalid : in  std_logic                                    := '0';              -- TVALID for channel A
    s_axis_a_tdata  : in  std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel A
    s_axis_a_tuser  : in  std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel A
    s_axis_a_tlast  : in  std_logic                                    := '0';              -- TLAST for channel A

    -- AXI slave interface B
    s_axis_b_tready : out std_logic                                    := '0';              -- TREADY for channel B
    s_axis_b_tvalid : in  std_logic                                    := '0';              -- TVALID for channel B
    s_axis_b_tdata  : in  std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel B
    s_axis_b_tuser  : in  std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel B
    s_axis_b_tlast  : in  std_logic                                    := '0';              -- TLAST for channel B

    -- Read interface to core
    m_axis_z_tready  : in  std_logic                                    := '1';              -- TREADY for channel Z
    m_axis_z_tvalid  : out std_logic                                    := '0';              -- TVALID for channel Z
    m_axis_z_tdata_a : out std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from A
    m_axis_z_tuser_a : out std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from A
    m_axis_z_tlast_a : out std_logic                                    := '0';              -- Channel Z TLAST from A
    m_axis_z_tdata_b : out std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from B
    m_axis_z_tuser_b : out std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from B
    m_axis_z_tlast_b : out std_logic                                    := '0'               -- Channel Z TLAST from B
    );

end entity;


------------------------------------------------------------

architecture xilinx of axi_slave_2to1 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  -- Internal versions of A and B input channels signals
  signal a_valid : std_logic;  -- Internal version of s_axis_a_tvalid;
  signal b_valid : std_logic;  -- Internal version of s_axis_b_tvalid;

  -- Identify when a transaction is being accepted on input channels A and B
  signal a_tx : std_logic;  -- Transaction is being accepted on input channel A
  signal b_tx : std_logic;  -- Transaction is being accepted on input channel B
  signal z_tx : std_logic;  -- Transaction is being accepted on output channel Z

  -- Reg1 handshake and control signals
  signal reg1_a_ready     : std_logic := '1';  -- Reg1 A ready to receive data
  signal reg1_b_ready     : std_logic := '1';  -- Reg1 B ready to receive data
  signal reg1_a_ready_nxt : std_logic;         -- Reg1 A ready to receive data, next value
  signal reg1_b_ready_nxt : std_logic;         -- Reg1 B ready to receive data, next value
  signal reg1_a_wr        : std_logic;         -- Write new data into reg1 A
  signal reg1_b_wr        : std_logic;         -- Write new data into reg1 B
  signal reg1_a_valid     : std_logic := '0';  -- Reg1 A contains valid data
  signal reg1_b_valid     : std_logic := '0';  -- Reg1 B contains valid data
  signal reg1_a_valid_nxt : std_logic;         -- Reg1 A contains valid data, next value
  signal reg1_b_valid_nxt : std_logic;         -- Reg1 B contains valid data, next value

  -- Reg1 data signals
  signal reg1_a_tdata : std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 A TDATA register
  signal reg1_a_tuser : std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 A TUSER register
  signal reg1_a_tlast : std_logic                                    := '0';              -- Reg1 A TLAST register
  signal reg1_b_tdata : std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 B TDATA register
  signal reg1_b_tuser : std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 B TUSER register
  signal reg1_b_tlast : std_logic                                    := '0';              -- Reg1 B TLAST register

  -- Reg2 handshake and control signals
  signal reg2_a_ready     : std_logic;         -- Reg2 A ready to receive data
  signal reg2_b_ready     : std_logic;         -- Reg2 B ready to receive data
  signal reg2_a_valid     : std_logic := '0';  -- Reg2 A contains valid data
  signal reg2_b_valid     : std_logic := '0';  -- Reg2 B contains valid data
  signal reg2_a_valid_nxt : std_logic;         -- Reg2 A contains valid data, next value
  signal reg2_b_valid_nxt : std_logic;         -- Reg2 B contains valid data, next value

  -- Reg2 data signals
  signal reg2_a_tdata : std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 A TDATA register
  signal reg2_a_tuser : std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 A TUSER register
  signal reg2_a_tlast : std_logic                                    := '0';              -- Reg2 A TLAST register
  signal reg2_b_tdata : std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 B TDATA register
  signal reg2_b_tuser : std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 B TUSER register
  signal reg2_b_tlast : std_logic                                    := '0';              -- Reg2 B TLAST register

  -- Z output channel signals
  signal z_ready : std_logic;           -- Internal version of m_axis_z_tready;
  signal z_valid : std_logic := '0';    -- Internal version of m_axis_z_tvalid;

begin

  -- There is a small amount of common code between C_HAS_Z_TREADY = 0 or 1, but not very much.
  -- For simplicity and ease of understanding, keep everything separate.

  --------------------------------------------------------------------------------
  -- Using m_axis_z_tready (probably the most common case; requires more resources)
  --------------------------------------------------------------------------------

  gen_has_z_tready : if C_HAS_Z_TREADY generate

    -- Drive TREADY outputs for input channels A and B
    s_axis_a_tready <= reg1_a_ready;
    s_axis_b_tready <= reg1_b_ready;

    -- Connect internal versions of TVALID inputs for input channels A and B
    a_valid <= s_axis_a_tvalid;
    b_valid <= s_axis_b_tvalid;

    -- Identify when a transaction is being accepted on input channels A and B, and on output channel Z
    a_tx <= a_valid and reg1_a_ready;
    b_tx <= b_valid and reg1_b_ready;
    z_tx <= z_valid and z_ready;

    --------------------------------------------------------------------------------
    -- Reg1
    --------------------------------------------------------------------------------

    -- reg1 A and B are ready to receive data if they are not holding valid data,
    -- and are not ready if reg2 holds valid data but reg2 of the other A/B does not.
    -- These ready signals must be registered as they are also input channel A and B ready signals.
    reg1_a_ready_nxt <= not reg1_a_valid_nxt and not (reg2_a_valid_nxt and not reg2_b_valid_nxt);
    reg1_b_ready_nxt <= not reg1_b_valid_nxt and not (reg2_b_valid_nxt and not reg2_a_valid_nxt);
    reg1_ready : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_ready <= '0';
          reg1_b_ready <= '0';
        elsif aclken = '1' then
          reg1_a_ready <= reg1_a_ready_nxt;
          reg1_b_ready <= reg1_b_ready_nxt;
        end if;
      end if;
    end process reg1_ready;

    -- Write new data into reg1 A and B if reg1 is ready and the input channel is valid, but not if reg2 is ready:
    -- note that if reg1 and reg2 are both ready when the input channel is valid, then only reg2 receives the data
    reg1_a_wr <= a_tx and not reg2_a_ready;
    reg1_b_wr <= b_tx and not reg2_b_ready;

    -- Data for reg1 comes from the input channel
    reg1 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if reg1_a_wr = '1' then
            reg1_a_tdata <= s_axis_a_tdata;
            reg1_a_tuser <= s_axis_a_tuser;
            reg1_a_tlast <= s_axis_a_tlast;
          end if;
          if reg1_b_wr = '1' then
            reg1_b_tdata <= s_axis_b_tdata;
            reg1_b_tuser <= s_axis_b_tuser;
            reg1_b_tlast <= s_axis_b_tlast;
          end if;
        end if;
      end if;
    end process reg1;

    -- reg1 A and B become valid when they receive data, and stop being valid when their data is sent to reg2
    reg1_a_valid_nxt <= (reg1_a_valid and not (reg2_a_valid and reg2_a_ready)) or reg1_a_wr;
    reg1_b_valid_nxt <= (reg1_b_valid and not (reg2_b_valid and reg2_b_ready)) or reg1_b_wr;
    reg1_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_valid <= '0';
          reg1_b_valid <= '0';
        elsif aclken = '1' then
          reg1_a_valid <= reg1_a_valid_nxt;
          reg1_b_valid <= reg1_b_valid_nxt;
        end if;
      end if;
    end process reg1_valid;

    --------------------------------------------------------------------------------
    -- Reg2
    --------------------------------------------------------------------------------

    -- reg2 A and B are ready to receive data if Z channel is ready or reg2 is not holding valid data,
    -- and are not ready if reg2 holds valid data but reg2 of the other A/B does not
    reg2_a_ready <= (z_ready or not reg2_a_valid) and not (reg2_a_valid and not reg2_b_valid);
    reg2_b_ready <= (z_ready or not reg2_b_valid) and not (reg2_b_valid and not reg2_a_valid);

    -- Data for reg2 comes from reg1 if reg1 is valid, or from the input channel if a transaction is received on it
    reg2 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if reg2_a_ready = '1' then
            if reg1_a_valid = '1' then
              reg2_a_tdata <= reg1_a_tdata;
              reg2_a_tuser <= reg1_a_tuser;
              reg2_a_tlast <= reg1_a_tlast;
            else
              reg2_a_tdata <= s_axis_a_tdata;
              reg2_a_tuser <= s_axis_a_tuser;
              reg2_a_tlast <= s_axis_a_tlast;
            end if;
          end if;
          if reg2_b_ready = '1' then
            if reg1_b_valid = '1' then
              reg2_b_tdata <= reg1_b_tdata;
              reg2_b_tuser <= reg1_b_tuser;
              reg2_b_tlast <= reg1_b_tlast;
            else
              reg2_b_tdata <= s_axis_b_tdata;
              reg2_b_tuser <= s_axis_b_tuser;
              reg2_b_tlast <= s_axis_b_tlast;
            end if;
          end if;
        end if;
      end if;
    end process reg2;

    -- reg2 A and B become valid when they receive data, and stop being valid when their data is sent on the Z channel
    reg2_a_valid_nxt <= (reg2_a_valid and not z_tx) or (reg2_a_ready and (reg1_a_valid or a_tx));
    reg2_b_valid_nxt <= (reg2_b_valid and not z_tx) or (reg2_b_ready and (reg1_b_valid or b_tx));
    reg2_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg2_a_valid <= '0';
          reg2_b_valid <= '0';
        elsif aclken = '1' then
          reg2_a_valid <= reg2_a_valid_nxt;
          reg2_b_valid <= reg2_b_valid_nxt;
        end if;
      end if;
    end process reg2_valid;

    --------------------------------------------------------------------------------
    -- Z channel (output master interface)
    --------------------------------------------------------------------------------

    -- Connect internal version of m_axis_z_tready
    z_ready <= m_axis_z_tready;

    -- Assign Z channel outputs from internal signals
    m_axis_z_tvalid    <= z_valid;
    m_axis_z_tdata_a   <= reg2_a_tdata;
    GEN_A_TUSER : if C_HAS_A_TUSER generate
      m_axis_z_tuser_a <= reg2_a_tuser;
    end generate GEN_A_TUSER;
    GEN_A_TLAST : if C_HAS_A_TLAST generate
      m_axis_z_tlast_a <= reg2_a_tlast;
    end generate GEN_A_TLAST;
    m_axis_z_tdata_b   <= reg2_b_tdata;
    GEN_B_TUSER : if C_HAS_B_TUSER generate
      m_axis_z_tuser_b <= reg2_b_tuser;
    end generate GEN_B_TUSER;
    GEN_B_TLAST : if C_HAS_B_TLAST generate
      m_axis_z_tlast_b <= reg2_b_tlast;
    end generate GEN_B_TLAST;

    -- Z channel payload is valid if reg2 A and B are both valid
    reg_z_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          z_valid <= '0';
        elsif aclken = '1' then
          z_valid <= reg2_a_valid_nxt and reg2_b_valid_nxt;
        end if;
      end if;
    end process reg_z_valid;

    -- End of code using m_axis_z_tready
  end generate gen_has_z_tready;

  --------------------------------------------------------------------------------
  -- Not using m_axis_z_tready (less common, fewer resources)
  --------------------------------------------------------------------------------

  gen_no_z_tready : if not C_HAS_Z_TREADY generate

    -- Drive TREADY outputs for input channels A and B
    s_axis_a_tready <= reg1_a_ready;
    s_axis_b_tready <= reg1_b_ready;

    -- Connect internal versions of TVALID inputs for input channels A and B
    a_valid <= s_axis_a_tvalid;
    b_valid <= s_axis_b_tvalid;

    -- Identify when a transaction is being accepted on input channels A and B
    a_tx <= a_valid and reg1_a_ready;
    b_tx <= b_valid and reg1_b_ready;

    --------------------------------------------------------------------------------
    -- Reg1 (only register in this case)
    --------------------------------------------------------------------------------

    -- reg1 A and B are ready except if holding valid data but the other A/B reg1 is not
    reg1_a_ready_nxt <= not (reg1_a_valid_nxt and not reg1_b_valid_nxt);
    reg1_b_ready_nxt <= not (reg1_b_valid_nxt and not reg1_a_valid_nxt);
    reg1_ready : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_ready <= '0';
          reg1_b_ready <= '0';
        elsif aclken = '1' then
          reg1_a_ready <= reg1_a_ready_nxt;
          reg1_b_ready <= reg1_b_ready_nxt;
        end if;
      end if;
    end process reg1_ready;

    -- Write new data into reg1 A and B when a transaction is accepted
    -- Data for reg1 comes from the input channel
    reg1 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if a_tx = '1' then
            reg1_a_tdata <= s_axis_a_tdata;
            reg1_a_tuser <= s_axis_a_tuser;
            reg1_a_tlast <= s_axis_a_tlast;
          end if;
          if b_tx = '1' then
            reg1_b_tdata <= s_axis_b_tdata;
            reg1_b_tuser <= s_axis_b_tuser;
            reg1_b_tlast <= s_axis_b_tlast;
          end if;
        end if;
      end if;
    end process reg1;

    -- reg1 A and B become valid when they receive data, and stop being valid when their data is sent on the Z channel
    reg1_a_valid_nxt <= (reg1_a_valid and not z_valid) or a_tx;
    reg1_b_valid_nxt <= (reg1_b_valid and not z_valid) or b_tx;
    reg1_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_valid <= '0';
          reg1_b_valid <= '0';
        elsif aclken = '1' then
          reg1_a_valid <= reg1_a_valid_nxt;
          reg1_b_valid <= reg1_b_valid_nxt;
        end if;
      end if;
    end process reg1_valid;

    --------------------------------------------------------------------------------
    -- Z channel (output master interface)
    --------------------------------------------------------------------------------

    -- Assign Z channel outputs from internal signals
    m_axis_z_tvalid    <= z_valid;
    m_axis_z_tdata_a   <= reg1_a_tdata;
    GEN_A_TUSER : if C_HAS_A_TUSER generate
      m_axis_z_tuser_a <= reg1_a_tuser;
    end generate GEN_A_TUSER;
    GEN_A_TLAST : if C_HAS_A_TLAST generate
      m_axis_z_tlast_a <= reg1_a_tlast;
    end generate GEN_A_TLAST;
    m_axis_z_tdata_b   <= reg1_b_tdata;
    GEN_B_TUSER : if C_HAS_B_TUSER generate
      m_axis_z_tuser_b <= reg1_b_tuser;
    end generate GEN_B_TUSER;
    GEN_B_TLAST : if C_HAS_B_TLAST generate
      m_axis_z_tlast_b <= reg1_b_tlast;
    end generate GEN_B_TLAST;

    -- Z channel payload is valid if reg1 A and B are both valid
    reg_z_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          z_valid <= '0';
        elsif aclken = '1' then
          z_valid <= reg1_a_valid_nxt and reg1_b_valid_nxt;
        end if;
      end if;
    end process reg_z_valid;

    -- End of code not using m_axis_z_tready
  end generate gen_no_z_tready;

end architecture xilinx;



-- $Header : $
------------------------------------------------------------
--  (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------
-- axi_slave_3to1.vhd
-- A 3 to 1 AXI slave channel synchronizer.
-- Provides 3 AXI slave interfaces for input channels
-- and 1 AXI master interface for connection to a core.
-- A transaction must be received on each slave interface
-- before a transaction is created on the master interface.
-- Latency = 1 while m_axis_z_tready is high (full throughput).
-- The master interface TREADY is optional (it is typically the
-- logical AND of the core's RFD and the output FIFO's TREADY).
-- Payload signals (TDATA, TUSER, TLAST) are not combined,
-- and are presented synchronized but separately on the
-- master interface.
--
-- Slave interfaces: A, B, C
-- Master interface: Z
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity axi_slave_3to1 is
  generic (
    C_A_TDATA_WIDTH : positive := 8;      -- Width of s_axis_a_tdata in bits
    C_HAS_A_TUSER   : boolean  := false;  -- Indicates if s_axis_a_tuser signal is used
    C_A_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_a_tuser in bits (if C_HAS_A_TUSER = true)
    C_HAS_A_TLAST   : boolean  := false;  -- Indicates if s_axis_a_tlast signal is used
    C_B_TDATA_WIDTH : positive := 8;      -- Width of s_axis_b_tdata in bits
    C_HAS_B_TUSER   : boolean  := false;  -- Indicates if s_axis_b_tuser signal is used
    C_B_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_b_tuser in bits (if C_HAS_B_TUSER = true)
    C_HAS_B_TLAST   : boolean  := false;  -- Indicates if s_axis_b_tlast signal is used
    C_C_TDATA_WIDTH : positive := 8;      -- Width of s_axis_c_tdata in bits
    C_HAS_C_TUSER   : boolean  := false;  -- Indicates if s_axis_c_tuser signal is used
    C_C_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_c_tuser in bits (if C_HAS_C_TUSER = true)
    C_HAS_C_TLAST   : boolean  := false;  -- Indicates if s_axis_c_tlast signal is used
    C_HAS_Z_TREADY  : boolean  := true    -- Indicates if m_axis_z_tready signal is used
    );
  port (
    aclk   : in std_logic := '0';       -- Clock
    aclken : in std_logic := '1';       -- Clock enable
    sclr   : in std_logic := '0';       -- Reset, active HIGH

    -- AXI slave interface A
    s_axis_a_tready : out std_logic                                    := '0';              -- TREADY for channel A
    s_axis_a_tvalid : in  std_logic                                    := '0';              -- TVALID for channel A
    s_axis_a_tdata  : in  std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel A
    s_axis_a_tuser  : in  std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel A
    s_axis_a_tlast  : in  std_logic                                    := '0';              -- TLAST for channel A

    -- AXI slave interface B
    s_axis_b_tready : out std_logic                                    := '0';              -- TREADY for channel B
    s_axis_b_tvalid : in  std_logic                                    := '0';              -- TVALID for channel B
    s_axis_b_tdata  : in  std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel B
    s_axis_b_tuser  : in  std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel B
    s_axis_b_tlast  : in  std_logic                                    := '0';              -- TLAST for channel B

    -- AXI slave interface C
    s_axis_c_tready : out std_logic                                    := '0';              -- TREADY for channel C
    s_axis_c_tvalid : in  std_logic                                    := '0';              -- TVALID for channel C
    s_axis_c_tdata  : in  std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel C
    s_axis_c_tuser  : in  std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel C
    s_axis_c_tlast  : in  std_logic                                    := '0';              -- TLAST for channel C

    -- Read interface to core
    m_axis_z_tready  : in  std_logic                                    := '1';              -- TREADY for channel Z
    m_axis_z_tvalid  : out std_logic                                    := '0';              -- TVALID for channel Z
    m_axis_z_tdata_a : out std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from A
    m_axis_z_tuser_a : out std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from A
    m_axis_z_tlast_a : out std_logic                                    := '0';              -- Channel Z TLAST from A
    m_axis_z_tdata_b : out std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from B
    m_axis_z_tuser_b : out std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from B
    m_axis_z_tlast_b : out std_logic                                    := '0';              -- Channel Z TLAST from B
    m_axis_z_tdata_c : out std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from C
    m_axis_z_tuser_c : out std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from C
    m_axis_z_tlast_c : out std_logic                                    := '0'               -- Channel Z TLAST from C
    );

end entity;


------------------------------------------------------------

architecture xilinx of axi_slave_3to1 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  -- Internal versions of A, B and C input channels signals
  signal a_valid : std_logic;  -- Internal version of s_axis_a_tvalid
  signal b_valid : std_logic;  -- Internal version of s_axis_b_tvalid
  signal c_valid : std_logic;  -- Internal version of s_axis_c_tvalid

  -- Identify when a transaction is being accepted on input channels A, B and C
  signal a_tx : std_logic;  -- Transaction is being accepted on input channel A
  signal b_tx : std_logic;  -- Transaction is being accepted on input channel B
  signal c_tx : std_logic;  -- Transaction is being accepted on input channel C
  signal z_tx : std_logic;  -- Transaction is being accepted on output channel Z

  -- Reg1 handshake and control signals
  signal reg1_a_ready     : std_logic := '1';  -- Reg1 A ready to receive data
  signal reg1_b_ready     : std_logic := '1';  -- Reg1 B ready to receive data
  signal reg1_c_ready     : std_logic := '1';  -- Reg1 C ready to receive data
  signal reg1_a_ready_nxt : std_logic;         -- Reg1 A ready to receive data, next value
  signal reg1_b_ready_nxt : std_logic;         -- Reg1 B ready to receive data, next value
  signal reg1_c_ready_nxt : std_logic;         -- Reg1 C ready to receive data, next value
  signal reg1_a_wr        : std_logic;         -- Write new data into reg1 A
  signal reg1_b_wr        : std_logic;         -- Write new data into reg1 B
  signal reg1_c_wr        : std_logic;         -- Write new data into reg1 C
  signal reg1_a_valid     : std_logic := '0';  -- Reg1 A contains valid data
  signal reg1_b_valid     : std_logic := '0';  -- Reg1 B contains valid data
  signal reg1_c_valid     : std_logic := '0';  -- Reg1 C contains valid data
  signal reg1_a_valid_nxt : std_logic;         -- Reg1 A contains valid data, next value
  signal reg1_b_valid_nxt : std_logic;         -- Reg1 B contains valid data, next value
  signal reg1_c_valid_nxt : std_logic;         -- Reg1 C contains valid data, next value

  -- Reg1 data signals
  signal reg1_a_tdata : std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 A TDATA register
  signal reg1_a_tuser : std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 A TUSER register
  signal reg1_a_tlast : std_logic                                    := '0';              -- Reg1 A TLAST register
  signal reg1_b_tdata : std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 B TDATA register
  signal reg1_b_tuser : std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 B TUSER register
  signal reg1_b_tlast : std_logic                                    := '0';              -- Reg1 B TLAST register
  signal reg1_c_tdata : std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 C TDATA register
  signal reg1_c_tuser : std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 C TUSER register
  signal reg1_c_tlast : std_logic                                    := '0';              -- Reg1 C TLAST register

  -- Reg2 handshake and control signals
  signal reg2_a_ready     : std_logic;         -- Reg2 A ready to receive data
  signal reg2_b_ready     : std_logic;         -- Reg2 B ready to receive data
  signal reg2_c_ready     : std_logic;         -- Reg2 C ready to receive data
  signal reg2_a_valid     : std_logic := '0';  -- Reg2 A contains valid data
  signal reg2_b_valid     : std_logic := '0';  -- Reg2 B contains valid data
  signal reg2_c_valid     : std_logic := '0';  -- Reg2 C contains valid data
  signal reg2_a_valid_nxt : std_logic;         -- Reg2 A contains valid data, next value
  signal reg2_b_valid_nxt : std_logic;         -- Reg2 B contains valid data, next value
  signal reg2_c_valid_nxt : std_logic;         -- Reg2 C contains valid data, next value

  -- Reg2 data signals
  signal reg2_a_tdata : std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 A TDATA register
  signal reg2_a_tuser : std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 A TUSER register
  signal reg2_a_tlast : std_logic                                    := '0';              -- Reg2 A TLAST register
  signal reg2_b_tdata : std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 B TDATA register
  signal reg2_b_tuser : std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 B TUSER register
  signal reg2_b_tlast : std_logic                                    := '0';              -- Reg2 B TLAST register
  signal reg2_c_tdata : std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 C TDATA register
  signal reg2_c_tuser : std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 C TUSER register
  signal reg2_c_tlast : std_logic                                    := '0';              -- Reg2 C TLAST register

  -- Z output channel signals
  signal z_ready : std_logic;           -- Internal version of m_axis_z_tready
  signal z_valid : std_logic := '0';    -- Internal version of m_axis_z_tvalid

begin

  -- There is a small amount of common code between C_HAS_Z_TREADY = 0 or 1, but not very much.
  -- For simplicity and ease of understanding, keep everything separate.

  --------------------------------------------------------------------------------
  -- Using m_axis_z_tready (probably the most common case; requires more resources)
  --------------------------------------------------------------------------------

  gen_has_z_tready : if C_HAS_Z_TREADY generate

    -- Drive TREADY outputs for input channels A, B and C
    s_axis_a_tready <= reg1_a_ready;
    s_axis_b_tready <= reg1_b_ready;
    s_axis_c_tready <= reg1_c_ready;

    -- Connect internal versions of TVALID inputs for input channels A, B and C
    a_valid <= s_axis_a_tvalid;
    b_valid <= s_axis_b_tvalid;
    c_valid <= s_axis_c_tvalid;

    -- Identify when a transaction is being accepted on input channels A, B and C, and on output channel Z
    a_tx <= a_valid and reg1_a_ready;
    b_tx <= b_valid and reg1_b_ready;
    c_tx <= c_valid and reg1_c_ready;
    z_tx <= z_valid and z_ready;

    --------------------------------------------------------------------------------
    -- Reg1
    --------------------------------------------------------------------------------

    -- reg1 A, B and C are ready to receive data if they are not holding valid data,
    -- and are not ready if reg2 holds valid data but reg2 of any of the other A/B/C do not.
    -- These ready signals must be registered as they are also input channel A, B and C ready signals.
    reg1_a_ready_nxt <= not reg1_a_valid_nxt and
                        not (reg2_a_valid_nxt and (not reg2_b_valid_nxt or not reg2_c_valid_nxt));
    reg1_b_ready_nxt <= not reg1_b_valid_nxt and
                        not (reg2_b_valid_nxt and (not reg2_a_valid_nxt or not reg2_c_valid_nxt));
    reg1_c_ready_nxt <= not reg1_c_valid_nxt and
                        not (reg2_c_valid_nxt and (not reg2_a_valid_nxt or not reg2_b_valid_nxt));
    reg1_ready : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_ready <= '0';
          reg1_b_ready <= '0';
          reg1_c_ready <= '0';
        elsif aclken = '1' then
          reg1_a_ready <= reg1_a_ready_nxt;
          reg1_b_ready <= reg1_b_ready_nxt;
          reg1_c_ready <= reg1_c_ready_nxt;
        end if;
      end if;
    end process reg1_ready;

    -- Write new data into reg1 A, B and C if reg1 is ready and the input channel is valid, but not if reg2 is ready:
    -- note that if reg1 and reg2 are both ready when the input channel is valid, then only reg2 receives the data.
    -- In fact, while the above is true, preventing the write if reg2 receives the data makes timing closure hard.
    -- The same effect can be achieved by allowing the write but not marking it as valid.
    reg1_a_wr <= a_tx and not reg2_a_ready;
    reg1_b_wr <= b_tx and not reg2_b_ready;
    reg1_c_wr <= c_tx and not reg2_c_ready;

    -- Data for reg1 comes from the input channel
    -- Write data into registers when an input transaction is received; ignore reg1_*_wr here (see comments above)
    reg1 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if a_tx = '1' then
            reg1_a_tdata <= s_axis_a_tdata;
            reg1_a_tuser <= s_axis_a_tuser;
            reg1_a_tlast <= s_axis_a_tlast;
          end if;
          if b_tx = '1' then
            reg1_b_tdata <= s_axis_b_tdata;
            reg1_b_tuser <= s_axis_b_tuser;
            reg1_b_tlast <= s_axis_b_tlast;
          end if;
          if c_tx = '1' then
            reg1_c_tdata <= s_axis_c_tdata;
            reg1_c_tuser <= s_axis_c_tuser;
            reg1_c_tlast <= s_axis_c_tlast;
          end if;
        end if;
      end if;
    end process reg1;

    -- reg1 A, B and C become valid when they receive data, and stop being valid when their data is sent to reg2
    reg1_a_valid_nxt <= (reg1_a_valid and not (reg2_a_valid and reg2_a_ready)) or reg1_a_wr;
    reg1_b_valid_nxt <= (reg1_b_valid and not (reg2_b_valid and reg2_b_ready)) or reg1_b_wr;
    reg1_c_valid_nxt <= (reg1_c_valid and not (reg2_c_valid and reg2_c_ready)) or reg1_c_wr;
    reg1_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_valid <= '0';
          reg1_b_valid <= '0';
          reg1_c_valid <= '0';
        elsif aclken = '1' then
          reg1_a_valid <= reg1_a_valid_nxt;
          reg1_b_valid <= reg1_b_valid_nxt;
          reg1_c_valid <= reg1_c_valid_nxt;
        end if;
      end if;
    end process reg1_valid;

    --------------------------------------------------------------------------------
    -- Reg2
    --------------------------------------------------------------------------------

    -- reg2 A, B and C are ready to receive data if Z channel is ready or reg2 is not holding valid data,
    -- and are not ready if reg2 holds valid data but reg2 of any other A/B/C does not
    reg2_a_ready <= (z_ready or not reg2_a_valid) and not (reg2_a_valid and (not reg2_b_valid or not reg2_c_valid));
    reg2_b_ready <= (z_ready or not reg2_b_valid) and not (reg2_b_valid and (not reg2_a_valid or not reg2_c_valid));
    reg2_c_ready <= (z_ready or not reg2_c_valid) and not (reg2_c_valid and (not reg2_a_valid or not reg2_b_valid));

    -- Data for reg2 comes from reg1 if reg1 is valid, or from the input channel if a transaction is received on it
    reg2 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if reg2_a_ready = '1' then
            if reg1_a_valid = '1' then
              reg2_a_tdata <= reg1_a_tdata;
              reg2_a_tuser <= reg1_a_tuser;
              reg2_a_tlast <= reg1_a_tlast;
            else
              reg2_a_tdata <= s_axis_a_tdata;
              reg2_a_tuser <= s_axis_a_tuser;
              reg2_a_tlast <= s_axis_a_tlast;
            end if;
          end if;
          if reg2_b_ready = '1' then
            if reg1_b_valid = '1' then
              reg2_b_tdata <= reg1_b_tdata;
              reg2_b_tuser <= reg1_b_tuser;
              reg2_b_tlast <= reg1_b_tlast;
            else
              reg2_b_tdata <= s_axis_b_tdata;
              reg2_b_tuser <= s_axis_b_tuser;
              reg2_b_tlast <= s_axis_b_tlast;
            end if;
          end if;
          if reg2_c_ready = '1' then
            if reg1_c_valid = '1' then
              reg2_c_tdata <= reg1_c_tdata;
              reg2_c_tuser <= reg1_c_tuser;
              reg2_c_tlast <= reg1_c_tlast;
            else
              reg2_c_tdata <= s_axis_c_tdata;
              reg2_c_tuser <= s_axis_c_tuser;
              reg2_c_tlast <= s_axis_c_tlast;
            end if;
          end if;
        end if;
      end if;
    end process reg2;

    -- reg2 A, B and C become valid when they receive data, and stop being valid when their data is sent on Z channel
    reg2_a_valid_nxt <= (reg2_a_valid and not z_tx) or (reg2_a_ready and (reg1_a_valid or a_tx));
    reg2_b_valid_nxt <= (reg2_b_valid and not z_tx) or (reg2_b_ready and (reg1_b_valid or b_tx));
    reg2_c_valid_nxt <= (reg2_c_valid and not z_tx) or (reg2_c_ready and (reg1_c_valid or c_tx));
    reg2_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg2_a_valid <= '0';
          reg2_b_valid <= '0';
          reg2_c_valid <= '0';
        elsif aclken = '1' then
          reg2_a_valid <= reg2_a_valid_nxt;
          reg2_b_valid <= reg2_b_valid_nxt;
          reg2_c_valid <= reg2_c_valid_nxt;
        end if;
      end if;
    end process reg2_valid;

    --------------------------------------------------------------------------------
    -- Z channel (output master interface)
    --------------------------------------------------------------------------------

    -- Connect internal version of m_axis_z_tready
    z_ready <= m_axis_z_tready;

    -- Assign Z channel outputs from internal signals
    m_axis_z_tvalid    <= z_valid;
    m_axis_z_tdata_a   <= reg2_a_tdata;
    GEN_A_TUSER : if C_HAS_A_TUSER generate
      m_axis_z_tuser_a <= reg2_a_tuser;
    end generate GEN_A_TUSER;
    GEN_A_TLAST : if C_HAS_A_TLAST generate
      m_axis_z_tlast_a <= reg2_a_tlast;
    end generate GEN_A_TLAST;
    m_axis_z_tdata_b   <= reg2_b_tdata;
    GEN_B_TUSER : if C_HAS_B_TUSER generate
      m_axis_z_tuser_b <= reg2_b_tuser;
    end generate GEN_B_TUSER;
    GEN_B_TLAST : if C_HAS_B_TLAST generate
      m_axis_z_tlast_b <= reg2_b_tlast;
    end generate GEN_B_TLAST;
    m_axis_z_tdata_c   <= reg2_c_tdata;
    GEN_C_TUSER : if C_HAS_C_TUSER generate
      m_axis_z_tuser_c <= reg2_c_tuser;
    end generate GEN_C_TUSER;
    GEN_C_TLAST : if C_HAS_C_TLAST generate
      m_axis_z_tlast_c <= reg2_c_tlast;
    end generate GEN_C_TLAST;

    -- Z channel payload is valid if reg2 A, B and C are all valid
    reg_z_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          z_valid <= '0';
        elsif aclken = '1' then
          z_valid <= reg2_a_valid_nxt and reg2_b_valid_nxt and reg2_c_valid_nxt;
        end if;
      end if;
    end process reg_z_valid;

    -- End of code using m_axis_z_tready
  end generate gen_has_z_tready;

  --------------------------------------------------------------------------------
  -- Not using m_axis_z_tready (less common, fewer resources)
  --------------------------------------------------------------------------------

  gen_no_z_tready : if not C_HAS_Z_TREADY generate

    -- Drive TREADY outputs for input channels A, B and C
    s_axis_a_tready <= reg1_a_ready;
    s_axis_b_tready <= reg1_b_ready;
    s_axis_c_tready <= reg1_c_ready;

    -- Connect internal versions of TVALID inputs for input channels A, B and C
    a_valid <= s_axis_a_tvalid;
    b_valid <= s_axis_b_tvalid;
    c_valid <= s_axis_c_tvalid;

    -- Identify when a transaction is being accepted on input channels A, B and C
    a_tx <= a_valid and reg1_a_ready;
    b_tx <= b_valid and reg1_b_ready;
    c_tx <= c_valid and reg1_c_ready;

    --------------------------------------------------------------------------------
    -- Reg1 (only register in this case)
    --------------------------------------------------------------------------------

    -- reg1 A, B and C are ready except if holding valid data but any other A/B/C reg1 is not
    reg1_a_ready_nxt <= not (reg1_a_valid_nxt and (not reg1_b_valid_nxt or not reg1_c_valid_nxt));
    reg1_b_ready_nxt <= not (reg1_b_valid_nxt and (not reg1_a_valid_nxt or not reg1_c_valid_nxt));
    reg1_c_ready_nxt <= not (reg1_c_valid_nxt and (not reg1_a_valid_nxt or not reg1_b_valid_nxt));
    reg1_ready : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_ready <= '0';
          reg1_b_ready <= '0';
          reg1_c_ready <= '0';
        elsif aclken = '1' then
          reg1_a_ready <= reg1_a_ready_nxt;
          reg1_b_ready <= reg1_b_ready_nxt;
          reg1_c_ready <= reg1_c_ready_nxt;
        end if;
      end if;
    end process reg1_ready;

    -- Write new data into reg1 A, B and C when a transaction is accepted
    -- Data for reg1 comes from the input channel
    reg1 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if a_tx = '1' then
            reg1_a_tdata <= s_axis_a_tdata;
            reg1_a_tuser <= s_axis_a_tuser;
            reg1_a_tlast <= s_axis_a_tlast;
          end if;
          if b_tx = '1' then
            reg1_b_tdata <= s_axis_b_tdata;
            reg1_b_tuser <= s_axis_b_tuser;
            reg1_b_tlast <= s_axis_b_tlast;
          end if;
          if c_tx = '1' then
            reg1_c_tdata <= s_axis_c_tdata;
            reg1_c_tuser <= s_axis_c_tuser;
            reg1_c_tlast <= s_axis_c_tlast;
          end if;
        end if;
      end if;
    end process reg1;

    -- reg1 A, B and C become valid when they receive data, and stop being valid when their data is sent on Z channel
    reg1_a_valid_nxt <= (reg1_a_valid and not z_valid) or a_tx;
    reg1_b_valid_nxt <= (reg1_b_valid and not z_valid) or b_tx;
    reg1_c_valid_nxt <= (reg1_c_valid and not z_valid) or c_tx;
    reg1_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_valid <= '0';
          reg1_b_valid <= '0';
          reg1_c_valid <= '0';
        elsif aclken = '1' then
          reg1_a_valid <= reg1_a_valid_nxt;
          reg1_b_valid <= reg1_b_valid_nxt;
          reg1_c_valid <= reg1_c_valid_nxt;
        end if;
      end if;
    end process reg1_valid;

    --------------------------------------------------------------------------------
    -- Z channel (output master interface)
    --------------------------------------------------------------------------------

    -- Assign Z channel outputs from internal signals
    m_axis_z_tvalid    <= z_valid;
    m_axis_z_tdata_a   <= reg1_a_tdata;
    GEN_A_TUSER : if C_HAS_A_TUSER generate
      m_axis_z_tuser_a <= reg1_a_tuser;
    end generate GEN_A_TUSER;
    GEN_A_TLAST : if C_HAS_A_TLAST generate
      m_axis_z_tlast_a <= reg1_a_tlast;
    end generate GEN_A_TLAST;
    m_axis_z_tdata_b   <= reg1_b_tdata;
    GEN_B_TUSER : if C_HAS_B_TUSER generate
      m_axis_z_tuser_b <= reg1_b_tuser;
    end generate GEN_B_TUSER;
    GEN_B_TLAST : if C_HAS_B_TLAST generate
      m_axis_z_tlast_b <= reg1_b_tlast;
    end generate GEN_B_TLAST;
    m_axis_z_tdata_c   <= reg1_c_tdata;
    GEN_C_TUSER : if C_HAS_C_TUSER generate
      m_axis_z_tuser_c <= reg1_c_tuser;
    end generate GEN_C_TUSER;
    GEN_C_TLAST : if C_HAS_C_TLAST generate
      m_axis_z_tlast_c <= reg1_c_tlast;
    end generate GEN_C_TLAST;

    -- Z channel payload is valid if reg1 A, B and C are all valid
    reg_z_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          z_valid <= '0';
        elsif aclken = '1' then
          z_valid <= reg1_a_valid_nxt and reg1_b_valid_nxt and reg1_c_valid_nxt;
        end if;
      end if;
    end process reg_z_valid;

    -- End of code not using m_axis_z_tready
  end generate gen_no_z_tready;

end architecture xilinx;



-- $Header : $
------------------------------------------------------------
--  (c) Copyright 2012 Xilinx, Inc. All rights reserved.
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
------------------------------------------------------------
-- axi_slave_4to1.vhd
-- A 4 to 1 AXI slave channel synchronizer.
-- Provides 4 AXI slave interfaces for input channels
-- and 1 AXI master interface for connection to a core.
-- A transaction must be received on each slave interface
-- before a transaction is created on the master interface.
-- Latency = 1 while m_axis_z_tready is high (full throughput).
-- The master interface TREADY is optional (it is typically the
-- logical AND of the core's RFD and the output FIFO's TREADY).
-- Payload signals (TDATA, TUSER, TLAST) are not combined,
-- and are presented synchronized but separately on the
-- master interface.
--
-- Slave interfaces: A, B, C, D
-- Master interface: Z
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity axi_slave_4to1 is
  generic (
    C_A_TDATA_WIDTH : positive := 8;      -- Width of s_axis_a_tdata in bits
    C_HAS_A_TUSER   : boolean  := false;  -- Indicates if s_axis_a_tuser signal is used
    C_A_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_a_tuser in bits (if C_HAS_A_TUSER = true)
    C_HAS_A_TLAST   : boolean  := false;  -- Indicates if s_axis_a_tlast signal is used
    C_B_TDATA_WIDTH : positive := 8;      -- Width of s_axis_b_tdata in bits
    C_HAS_B_TUSER   : boolean  := false;  -- Indicates if s_axis_b_tuser signal is used
    C_B_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_b_tuser in bits (if C_HAS_B_TUSER = true)
    C_HAS_B_TLAST   : boolean  := false;  -- Indicates if s_axis_b_tlast signal is used
    C_C_TDATA_WIDTH : positive := 8;      -- Width of s_axis_c_tdata in bits
    C_HAS_C_TUSER   : boolean  := false;  -- Indicates if s_axis_c_tuser signal is used
    C_C_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_c_tuser in bits (if C_HAS_C_TUSER = true)
    C_HAS_C_TLAST   : boolean  := false;  -- Indicates if s_axis_c_tlast signal is used
    C_D_TDATA_WIDTH : positive := 8;      -- Width of s_axis_d_tdata in bits
    C_HAS_D_TUSER   : boolean  := false;  -- Indicates if s_axis_d_tuser signal is used
    C_D_TUSER_WIDTH : natural  := 1;      -- Width of s_axis_d_tuser in bits (if C_HAS_D_TUSER = true)
    C_HAS_D_TLAST   : boolean  := false;  -- Indicates if s_axis_d_tlast signal is used
    C_HAS_Z_TREADY  : boolean  := true    -- Indicates if m_axis_z_tready signal is used
    );
  port (
    aclk   : in std_logic := '0';       -- Clock
    aclken : in std_logic := '1';       -- Clock enable
    sclr   : in std_logic := '0';       -- Reset, active HIGH

    -- AXI slave interface A
    s_axis_a_tready : out std_logic                                    := '0';              -- TREADY for channel A
    s_axis_a_tvalid : in  std_logic                                    := '0';              -- TVALID for channel A
    s_axis_a_tdata  : in  std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel A
    s_axis_a_tuser  : in  std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel A
    s_axis_a_tlast  : in  std_logic                                    := '0';              -- TLAST for channel A

    -- AXI slave interface B
    s_axis_b_tready : out std_logic                                    := '0';              -- TREADY for channel B
    s_axis_b_tvalid : in  std_logic                                    := '0';              -- TVALID for channel B
    s_axis_b_tdata  : in  std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel B
    s_axis_b_tuser  : in  std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel B
    s_axis_b_tlast  : in  std_logic                                    := '0';              -- TLAST for channel B

    -- AXI slave interface C
    s_axis_c_tready : out std_logic                                    := '0';              -- TREADY for channel C
    s_axis_c_tvalid : in  std_logic                                    := '0';              -- TVALID for channel C
    s_axis_c_tdata  : in  std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel C
    s_axis_c_tuser  : in  std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel C
    s_axis_c_tlast  : in  std_logic                                    := '0';              -- TLAST for channel C

    -- AXI slave interface D
    s_axis_d_tready : out std_logic                                    := '0';              -- TREADY for channel D
    s_axis_d_tvalid : in  std_logic                                    := '0';              -- TVALID for channel D
    s_axis_d_tdata  : in  std_logic_vector(C_D_TDATA_WIDTH-1 downto 0) := (others => '0');  -- TDATA for channel D
    s_axis_d_tuser  : in  std_logic_vector(C_D_TUSER_WIDTH-1 downto 0) := (others => '0');  -- TUSER for channel D
    s_axis_d_tlast  : in  std_logic                                    := '0';              -- TLAST for channel D

    -- Read interface to core
    m_axis_z_tready  : in  std_logic                                    := '1';              -- TREADY for channel Z
    m_axis_z_tvalid  : out std_logic                                    := '0';              -- TVALID for channel Z
    m_axis_z_tdata_a : out std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from A
    m_axis_z_tuser_a : out std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from A
    m_axis_z_tlast_a : out std_logic                                    := '0';              -- Channel Z TLAST from A
    m_axis_z_tdata_b : out std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from B
    m_axis_z_tuser_b : out std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from B
    m_axis_z_tlast_b : out std_logic                                    := '0';              -- Channel Z TLAST from B
    m_axis_z_tdata_c : out std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from C
    m_axis_z_tuser_c : out std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from C
    m_axis_z_tlast_c : out std_logic                                    := '0';              -- Channel Z TLAST from C
    m_axis_z_tdata_d : out std_logic_vector(C_D_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TDATA from D
    m_axis_z_tuser_d : out std_logic_vector(C_D_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Channel Z TUSER from D
    m_axis_z_tlast_d : out std_logic                                    := '0'               -- Channel Z TLAST from D
    );

end entity;


------------------------------------------------------------

architecture xilinx of axi_slave_4to1 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  -- Internal versions of A, B, C and D input channels signals
  signal a_valid : std_logic;  -- Internal version of s_axis_a_tvalid
  signal b_valid : std_logic;  -- Internal version of s_axis_b_tvalid
  signal c_valid : std_logic;  -- Internal version of s_axis_c_tvalid
  signal d_valid : std_logic;  -- Internal version of s_axis_d_tvalid

  -- Identify when a transaction is being accepted on input channels A, B, C and D
  signal a_tx : std_logic;  -- Transaction is being accepted on input channel A
  signal b_tx : std_logic;  -- Transaction is being accepted on input channel B
  signal c_tx : std_logic;  -- Transaction is being accepted on input channel C
  signal d_tx : std_logic;  -- Transaction is being accepted on input channel D
  signal z_tx : std_logic;  -- Transaction is being accepted on output channel Z

  -- Reg1 handshake and control signals
  signal reg1_a_ready     : std_logic := '1';  -- Reg1 A ready to receive data
  signal reg1_b_ready     : std_logic := '1';  -- Reg1 B ready to receive data
  signal reg1_c_ready     : std_logic := '1';  -- Reg1 C ready to receive data
  signal reg1_d_ready     : std_logic := '1';  -- Reg1 D ready to receive data
  signal reg1_a_ready_nxt : std_logic;         -- Reg1 A ready to receive data, next value
  signal reg1_b_ready_nxt : std_logic;         -- Reg1 B ready to receive data, next value
  signal reg1_c_ready_nxt : std_logic;         -- Reg1 C ready to receive data, next value
  signal reg1_d_ready_nxt : std_logic;         -- Reg1 D ready to receive data, next value
  signal reg1_a_wr        : std_logic;         -- Write new data into reg1 A
  signal reg1_b_wr        : std_logic;         -- Write new data into reg1 B
  signal reg1_c_wr        : std_logic;         -- Write new data into reg1 C
  signal reg1_d_wr        : std_logic;         -- Write new data into reg1 D
  signal reg1_a_valid     : std_logic := '0';  -- Reg1 A contains valid data
  signal reg1_b_valid     : std_logic := '0';  -- Reg1 B contains valid data
  signal reg1_c_valid     : std_logic := '0';  -- Reg1 C contains valid data
  signal reg1_d_valid     : std_logic := '0';  -- Reg1 D contains valid data
  signal reg1_a_valid_nxt : std_logic;         -- Reg1 A contains valid data, next value
  signal reg1_b_valid_nxt : std_logic;         -- Reg1 B contains valid data, next value
  signal reg1_c_valid_nxt : std_logic;         -- Reg1 C contains valid data, next value
  signal reg1_d_valid_nxt : std_logic;         -- Reg1 D contains valid data, next value

  -- Reg1 data signals
  signal reg1_a_tdata : std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 A TDATA register
  signal reg1_a_tuser : std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 A TUSER register
  signal reg1_a_tlast : std_logic                                    := '0';              -- Reg1 A TLAST register
  signal reg1_b_tdata : std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 B TDATA register
  signal reg1_b_tuser : std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 B TUSER register
  signal reg1_b_tlast : std_logic                                    := '0';              -- Reg1 B TLAST register
  signal reg1_c_tdata : std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 C TDATA register
  signal reg1_c_tuser : std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 C TUSER register
  signal reg1_c_tlast : std_logic                                    := '0';              -- Reg1 C TLAST register
  signal reg1_d_tdata : std_logic_vector(C_D_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg1 D TDATA register
  signal reg1_d_tuser : std_logic_vector(C_D_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg1 D TUSER register
  signal reg1_d_tlast : std_logic                                    := '0';              -- Reg1 D TLAST register

  -- Reg2 handshake and control signals
  signal reg2_a_ready     : std_logic;         -- Reg2 A ready to receive data
  signal reg2_b_ready     : std_logic;         -- Reg2 B ready to receive data
  signal reg2_c_ready     : std_logic;         -- Reg2 C ready to receive data
  signal reg2_d_ready     : std_logic;         -- Reg2 D ready to receive data
  signal reg2_a_valid     : std_logic := '0';  -- Reg2 A contains valid data
  signal reg2_b_valid     : std_logic := '0';  -- Reg2 B contains valid data
  signal reg2_c_valid     : std_logic := '0';  -- Reg2 C contains valid data
  signal reg2_d_valid     : std_logic := '0';  -- Reg2 D contains valid data
  signal reg2_a_valid_nxt : std_logic;         -- Reg2 A contains valid data, next value
  signal reg2_b_valid_nxt : std_logic;         -- Reg2 B contains valid data, next value
  signal reg2_c_valid_nxt : std_logic;         -- Reg2 C contains valid data, next value
  signal reg2_d_valid_nxt : std_logic;         -- Reg2 D contains valid data, next value

  -- Reg2 data signals
  signal reg2_a_tdata : std_logic_vector(C_A_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 A TDATA register
  signal reg2_a_tuser : std_logic_vector(C_A_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 A TUSER register
  signal reg2_a_tlast : std_logic                                    := '0';              -- Reg2 A TLAST register
  signal reg2_b_tdata : std_logic_vector(C_B_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 B TDATA register
  signal reg2_b_tuser : std_logic_vector(C_B_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 B TUSER register
  signal reg2_b_tlast : std_logic                                    := '0';              -- Reg2 B TLAST register
  signal reg2_c_tdata : std_logic_vector(C_C_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 C TDATA register
  signal reg2_c_tuser : std_logic_vector(C_C_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 C TUSER register
  signal reg2_c_tlast : std_logic                                    := '0';              -- Reg2 C TLAST register
  signal reg2_d_tdata : std_logic_vector(C_D_TDATA_WIDTH-1 downto 0) := (others => '0');  -- Reg2 D TDATA register
  signal reg2_d_tuser : std_logic_vector(C_D_TUSER_WIDTH-1 downto 0) := (others => '0');  -- Reg2 D TUSER register
  signal reg2_d_tlast : std_logic                                    := '0';              -- Reg2 D TLAST register

  -- Z output channel signals
  signal z_ready : std_logic;           -- Internal version of m_axis_z_tready
  signal z_valid : std_logic := '0';    -- Internal version of m_axis_z_tvalid

begin

  -- There is a small amount of common code between C_HAS_Z_TREADY = 0 or 1, but not very much.
  -- For simplicity and ease of understanding, keep everything separate.

  --------------------------------------------------------------------------------
  -- Using m_axis_z_tready (probably the most common case; requires more resources)
  --------------------------------------------------------------------------------

  gen_has_z_tready : if C_HAS_Z_TREADY generate

    -- Drive TREADY outputs for input channels A, B, C and D
    s_axis_a_tready <= reg1_a_ready;
    s_axis_b_tready <= reg1_b_ready;
    s_axis_c_tready <= reg1_c_ready;
    s_axis_d_tready <= reg1_d_ready;

    -- Connect internal versions of TVALID inputs for input channels A, B, C and D
    a_valid <= s_axis_a_tvalid;
    b_valid <= s_axis_b_tvalid;
    c_valid <= s_axis_c_tvalid;
    d_valid <= s_axis_d_tvalid;

    -- Identify when a transaction is being accepted on input channels A, B, C and D, and on output channel Z
    a_tx <= a_valid and reg1_a_ready;
    b_tx <= b_valid and reg1_b_ready;
    c_tx <= c_valid and reg1_c_ready;
    d_tx <= d_valid and reg1_d_ready;
    z_tx <= z_valid and z_ready;

    --------------------------------------------------------------------------------
    -- Reg1
    --------------------------------------------------------------------------------

    -- reg1 A, B, C and D are ready to receive data if they are not holding valid data,
    -- and are not ready if reg2 holds valid data but reg2 of any of the other A/B/C/D do not.
    -- These ready signals must be registered as they are also input channel A, B, C and D ready signals.
    reg1_a_ready_nxt <= not reg1_a_valid_nxt and
                        not (reg2_a_valid_nxt and (not reg2_b_valid_nxt or not reg2_c_valid_nxt or not reg2_d_valid_nxt));
    reg1_b_ready_nxt <= not reg1_b_valid_nxt and
                        not (reg2_b_valid_nxt and (not reg2_a_valid_nxt or not reg2_c_valid_nxt or not reg2_d_valid_nxt));
    reg1_c_ready_nxt <= not reg1_c_valid_nxt and
                        not (reg2_c_valid_nxt and (not reg2_a_valid_nxt or not reg2_b_valid_nxt or not reg2_d_valid_nxt));
    reg1_d_ready_nxt <= not reg1_d_valid_nxt and
                        not (reg2_d_valid_nxt and (not reg2_a_valid_nxt or not reg2_b_valid_nxt or not reg2_c_valid_nxt));
    reg1_ready : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_ready <= '0';
          reg1_b_ready <= '0';
          reg1_c_ready <= '0';
          reg1_d_ready <= '0';
        elsif aclken = '1' then
          reg1_a_ready <= reg1_a_ready_nxt;
          reg1_b_ready <= reg1_b_ready_nxt;
          reg1_c_ready <= reg1_c_ready_nxt;
          reg1_d_ready <= reg1_d_ready_nxt;
        end if;
      end if;
    end process reg1_ready;

    -- Write new data into reg1 A, B, C and D if reg1 is ready and the input channel is valid, but not if reg2 is ready:
    -- note that if reg1 and reg2 are both ready when the input channel is valid, then only reg2 receives the data.
    -- In fact, while the above is true, preventing the write if reg2 receives the data makes timing closure hard.
    -- The same effect can be achieved by allowing the write but not marking it as valid.
    reg1_a_wr <= a_tx and not reg2_a_ready;
    reg1_b_wr <= b_tx and not reg2_b_ready;
    reg1_c_wr <= c_tx and not reg2_c_ready;
    reg1_d_wr <= d_tx and not reg2_d_ready;

    -- Data for reg1 comes from the input channel
    -- Write data into registers when an input transaction is received; ignore reg1_*_wr here (see comments above)
    reg1 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if a_tx = '1' then
            reg1_a_tdata <= s_axis_a_tdata;
            reg1_a_tuser <= s_axis_a_tuser;
            reg1_a_tlast <= s_axis_a_tlast;
          end if;
          if b_tx = '1' then
            reg1_b_tdata <= s_axis_b_tdata;
            reg1_b_tuser <= s_axis_b_tuser;
            reg1_b_tlast <= s_axis_b_tlast;
          end if;
          if c_tx = '1' then
            reg1_c_tdata <= s_axis_c_tdata;
            reg1_c_tuser <= s_axis_c_tuser;
            reg1_c_tlast <= s_axis_c_tlast;
          end if;
          if d_tx = '1' then
            reg1_d_tdata <= s_axis_d_tdata;
            reg1_d_tuser <= s_axis_d_tuser;
            reg1_d_tlast <= s_axis_d_tlast;
          end if;
        end if;
      end if;
    end process reg1;

    -- reg1 A, B, C and D become valid when they receive data, and stop being valid when their data is sent to reg2
    reg1_a_valid_nxt <= (reg1_a_valid and not (reg2_a_valid and reg2_a_ready)) or reg1_a_wr;
    reg1_b_valid_nxt <= (reg1_b_valid and not (reg2_b_valid and reg2_b_ready)) or reg1_b_wr;
    reg1_c_valid_nxt <= (reg1_c_valid and not (reg2_c_valid and reg2_c_ready)) or reg1_c_wr;
    reg1_d_valid_nxt <= (reg1_d_valid and not (reg2_d_valid and reg2_d_ready)) or reg1_d_wr;
    reg1_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_valid <= '0';
          reg1_b_valid <= '0';
          reg1_c_valid <= '0';
          reg1_d_valid <= '0';
        elsif aclken = '1' then
          reg1_a_valid <= reg1_a_valid_nxt;
          reg1_b_valid <= reg1_b_valid_nxt;
          reg1_c_valid <= reg1_c_valid_nxt;
          reg1_d_valid <= reg1_d_valid_nxt;
        end if;
      end if;
    end process reg1_valid;

    --------------------------------------------------------------------------------
    -- Reg2
    --------------------------------------------------------------------------------

    -- reg2 A, B, C and D are ready to receive data if Z channel is ready or reg2 is not holding valid data,
    -- and are not ready if reg2 holds valid data but reg2 of any other A/B/C/D does not
    reg2_a_ready <= (z_ready or not reg2_a_valid) and not (reg2_a_valid and (not reg2_b_valid or not reg2_c_valid or not reg2_d_valid));
    reg2_b_ready <= (z_ready or not reg2_b_valid) and not (reg2_b_valid and (not reg2_a_valid or not reg2_c_valid or not reg2_d_valid));
    reg2_c_ready <= (z_ready or not reg2_c_valid) and not (reg2_c_valid and (not reg2_a_valid or not reg2_b_valid or not reg2_d_valid));
    reg2_d_ready <= (z_ready or not reg2_d_valid) and not (reg2_d_valid and (not reg2_a_valid or not reg2_b_valid or not reg2_c_valid));

    -- Data for reg2 comes from reg1 if reg1 is valid, or from the input channel if a transaction is received on it
    reg2 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if reg2_a_ready = '1' then
            if reg1_a_valid = '1' then
              reg2_a_tdata <= reg1_a_tdata;
              reg2_a_tuser <= reg1_a_tuser;
              reg2_a_tlast <= reg1_a_tlast;
            else
              reg2_a_tdata <= s_axis_a_tdata;
              reg2_a_tuser <= s_axis_a_tuser;
              reg2_a_tlast <= s_axis_a_tlast;
            end if;
          end if;
          if reg2_b_ready = '1' then
            if reg1_b_valid = '1' then
              reg2_b_tdata <= reg1_b_tdata;
              reg2_b_tuser <= reg1_b_tuser;
              reg2_b_tlast <= reg1_b_tlast;
            else
              reg2_b_tdata <= s_axis_b_tdata;
              reg2_b_tuser <= s_axis_b_tuser;
              reg2_b_tlast <= s_axis_b_tlast;
            end if;
          end if;
          if reg2_c_ready = '1' then
            if reg1_c_valid = '1' then
              reg2_c_tdata <= reg1_c_tdata;
              reg2_c_tuser <= reg1_c_tuser;
              reg2_c_tlast <= reg1_c_tlast;
            else
              reg2_c_tdata <= s_axis_c_tdata;
              reg2_c_tuser <= s_axis_c_tuser;
              reg2_c_tlast <= s_axis_c_tlast;
            end if;
          end if;
          if reg2_d_ready = '1' then
            if reg1_d_valid = '1' then
              reg2_d_tdata <= reg1_d_tdata;
              reg2_d_tuser <= reg1_d_tuser;
              reg2_d_tlast <= reg1_d_tlast;
            else
              reg2_d_tdata <= s_axis_d_tdata;
              reg2_d_tuser <= s_axis_d_tuser;
              reg2_d_tlast <= s_axis_d_tlast;
            end if;
          end if;
        end if;
      end if;
    end process reg2;

    -- reg2 A, B, C and D become valid when they receive data, and stop being valid when their data is sent on Z channel
    reg2_a_valid_nxt <= (reg2_a_valid and not z_tx) or (reg2_a_ready and (reg1_a_valid or a_tx));
    reg2_b_valid_nxt <= (reg2_b_valid and not z_tx) or (reg2_b_ready and (reg1_b_valid or b_tx));
    reg2_c_valid_nxt <= (reg2_c_valid and not z_tx) or (reg2_c_ready and (reg1_c_valid or c_tx));
    reg2_d_valid_nxt <= (reg2_d_valid and not z_tx) or (reg2_d_ready and (reg1_d_valid or d_tx));
    reg2_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg2_a_valid <= '0';
          reg2_b_valid <= '0';
          reg2_c_valid <= '0';
          reg2_d_valid <= '0';
        elsif aclken = '1' then
          reg2_a_valid <= reg2_a_valid_nxt;
          reg2_b_valid <= reg2_b_valid_nxt;
          reg2_c_valid <= reg2_c_valid_nxt;
          reg2_d_valid <= reg2_d_valid_nxt;
        end if;
      end if;
    end process reg2_valid;

    --------------------------------------------------------------------------------
    -- Z channel (output master interface)
    --------------------------------------------------------------------------------

    -- Connect internal version of m_axis_z_tready
    z_ready <= m_axis_z_tready;

    -- Assign Z channel outputs from internal signals
    m_axis_z_tvalid    <= z_valid;
    m_axis_z_tdata_a   <= reg2_a_tdata;
    GEN_A_TUSER : if C_HAS_A_TUSER generate
      m_axis_z_tuser_a <= reg2_a_tuser;
    end generate GEN_A_TUSER;
    GEN_A_TLAST : if C_HAS_A_TLAST generate
      m_axis_z_tlast_a <= reg2_a_tlast;
    end generate GEN_A_TLAST;
    m_axis_z_tdata_b   <= reg2_b_tdata;
    GEN_B_TUSER : if C_HAS_B_TUSER generate
      m_axis_z_tuser_b <= reg2_b_tuser;
    end generate GEN_B_TUSER;
    GEN_B_TLAST : if C_HAS_B_TLAST generate
      m_axis_z_tlast_b <= reg2_b_tlast;
    end generate GEN_B_TLAST;
    m_axis_z_tdata_c   <= reg2_c_tdata;
    GEN_C_TUSER : if C_HAS_C_TUSER generate
      m_axis_z_tuser_c <= reg2_c_tuser;
    end generate GEN_C_TUSER;
    GEN_C_TLAST : if C_HAS_C_TLAST generate
      m_axis_z_tlast_c <= reg2_c_tlast;
    end generate GEN_C_TLAST;
    m_axis_z_tdata_d   <= reg2_d_tdata;
    GEN_D_TUSER : if C_HAS_D_TUSER generate
      m_axis_z_tuser_d <= reg2_d_tuser;
    end generate GEN_D_TUSER;
    GEN_D_TLAST : if C_HAS_D_TLAST generate
      m_axis_z_tlast_d <= reg2_d_tlast;
    end generate GEN_D_TLAST;

    -- Z channel payload is valid if reg2 A, B, C and D are all valid
    reg_z_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          z_valid <= '0';
        elsif aclken = '1' then
          z_valid <= reg2_a_valid_nxt and reg2_b_valid_nxt and reg2_c_valid_nxt and reg2_d_valid_nxt;
        end if;
      end if;
    end process reg_z_valid;

    -- End of code using m_axis_z_tready
  end generate gen_has_z_tready;

  --------------------------------------------------------------------------------
  -- Not using m_axis_z_tready (less common, fewer resources)
  --------------------------------------------------------------------------------

  gen_no_z_tready : if not C_HAS_Z_TREADY generate

    -- Drive TREADY outputs for input channels A, B, C and D
    s_axis_a_tready <= reg1_a_ready;
    s_axis_b_tready <= reg1_b_ready;
    s_axis_c_tready <= reg1_c_ready;
    s_axis_d_tready <= reg1_d_ready;

    -- Connect internal versions of TVALID inputs for input channels A, B, C and D
    a_valid <= s_axis_a_tvalid;
    b_valid <= s_axis_b_tvalid;
    c_valid <= s_axis_c_tvalid;
    d_valid <= s_axis_d_tvalid;

    -- Identify when a transaction is being accepted on input channels A, B, C and D
    a_tx <= a_valid and reg1_a_ready;
    b_tx <= b_valid and reg1_b_ready;
    c_tx <= c_valid and reg1_c_ready;
    d_tx <= d_valid and reg1_d_ready;

    --------------------------------------------------------------------------------
    -- Reg1 (only register in this case)
    --------------------------------------------------------------------------------

    -- reg1 A, B, C and D are ready except if holding valid data but any other A/B/C/D reg1 is not
    reg1_a_ready_nxt <= not (reg1_a_valid_nxt and (not reg1_b_valid_nxt or not reg1_c_valid_nxt or not reg1_d_valid_nxt));
    reg1_b_ready_nxt <= not (reg1_b_valid_nxt and (not reg1_a_valid_nxt or not reg1_c_valid_nxt or not reg1_d_valid_nxt));
    reg1_c_ready_nxt <= not (reg1_c_valid_nxt and (not reg1_a_valid_nxt or not reg1_b_valid_nxt or not reg1_d_valid_nxt));
    reg1_d_ready_nxt <= not (reg1_d_valid_nxt and (not reg1_a_valid_nxt or not reg1_b_valid_nxt or not reg1_c_valid_nxt));
    reg1_ready : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_ready <= '0';
          reg1_b_ready <= '0';
          reg1_c_ready <= '0';
          reg1_d_ready <= '0';
        elsif aclken = '1' then
          reg1_a_ready <= reg1_a_ready_nxt;
          reg1_b_ready <= reg1_b_ready_nxt;
          reg1_c_ready <= reg1_c_ready_nxt;
          reg1_d_ready <= reg1_d_ready_nxt;
        end if;
      end if;
    end process reg1_ready;

    -- Write new data into reg1 A, B, C and D when a transaction is accepted
    -- Data for reg1 comes from the input channel
    reg1 : process(aclk)
    begin
      if rising_edge(aclk) then
        -- no need for reset on these datapath registers
        if aclken = '1' then
          if a_tx = '1' then
            reg1_a_tdata <= s_axis_a_tdata;
            reg1_a_tuser <= s_axis_a_tuser;
            reg1_a_tlast <= s_axis_a_tlast;
          end if;
          if b_tx = '1' then
            reg1_b_tdata <= s_axis_b_tdata;
            reg1_b_tuser <= s_axis_b_tuser;
            reg1_b_tlast <= s_axis_b_tlast;
          end if;
          if c_tx = '1' then
            reg1_c_tdata <= s_axis_c_tdata;
            reg1_c_tuser <= s_axis_c_tuser;
            reg1_c_tlast <= s_axis_c_tlast;
          end if;
          if d_tx = '1' then
            reg1_d_tdata <= s_axis_d_tdata;
            reg1_d_tuser <= s_axis_d_tuser;
            reg1_d_tlast <= s_axis_d_tlast;
          end if;
        end if;
      end if;
    end process reg1;

    -- reg1 A, B, C and D become valid when they receive data, and stop being valid when their data is sent on Z channel
    reg1_a_valid_nxt <= (reg1_a_valid and not z_valid) or a_tx;
    reg1_b_valid_nxt <= (reg1_b_valid and not z_valid) or b_tx;
    reg1_c_valid_nxt <= (reg1_c_valid and not z_valid) or c_tx;
    reg1_d_valid_nxt <= (reg1_d_valid and not z_valid) or d_tx;
    reg1_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          reg1_a_valid <= '0';
          reg1_b_valid <= '0';
          reg1_c_valid <= '0';
          reg1_d_valid <= '0';
        elsif aclken = '1' then
          reg1_a_valid <= reg1_a_valid_nxt;
          reg1_b_valid <= reg1_b_valid_nxt;
          reg1_c_valid <= reg1_c_valid_nxt;
          reg1_d_valid <= reg1_d_valid_nxt;
        end if;
      end if;
    end process reg1_valid;

    --------------------------------------------------------------------------------
    -- Z channel (output master interface)
    --------------------------------------------------------------------------------

    -- Assign Z channel outputs from internal signals
    m_axis_z_tvalid    <= z_valid;
    m_axis_z_tdata_a   <= reg1_a_tdata;
    GEN_A_TUSER : if C_HAS_A_TUSER generate
      m_axis_z_tuser_a <= reg1_a_tuser;
    end generate GEN_A_TUSER;
    GEN_A_TLAST : if C_HAS_A_TLAST generate
      m_axis_z_tlast_a <= reg1_a_tlast;
    end generate GEN_A_TLAST;
    m_axis_z_tdata_b   <= reg1_b_tdata;
    GEN_B_TUSER : if C_HAS_B_TUSER generate
      m_axis_z_tuser_b <= reg1_b_tuser;
    end generate GEN_B_TUSER;
    GEN_B_TLAST : if C_HAS_B_TLAST generate
      m_axis_z_tlast_b <= reg1_b_tlast;
    end generate GEN_B_TLAST;
    m_axis_z_tdata_c   <= reg1_c_tdata;
    GEN_C_TUSER : if C_HAS_C_TUSER generate
      m_axis_z_tuser_c <= reg1_c_tuser;
    end generate GEN_C_TUSER;
    GEN_C_TLAST : if C_HAS_C_TLAST generate
      m_axis_z_tlast_c <= reg1_c_tlast;
    end generate GEN_C_TLAST;
    m_axis_z_tdata_d   <= reg1_d_tdata;
    GEN_D_TUSER : if C_HAS_D_TUSER generate
      m_axis_z_tuser_d <= reg1_d_tuser;
    end generate GEN_D_TUSER;
    GEN_D_TLAST : if C_HAS_D_TLAST generate
      m_axis_z_tlast_d <= reg1_d_tlast;
    end generate GEN_D_TLAST;

    -- Z channel payload is valid if reg1 A, B, C and D are all valid
    reg_z_valid : process(aclk)
    begin
      if rising_edge(aclk) then
        if sclr = '1' then
          z_valid <= '0';
        elsif aclken = '1' then
          z_valid <= reg1_a_valid_nxt and reg1_b_valid_nxt and reg1_c_valid_nxt and reg1_d_valid_nxt;
        end if;
      end if;
    end process reg_z_valid;

    -- End of code not using m_axis_z_tready
  end generate gen_no_z_tready;

end architecture xilinx;




