--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/ul_utils.vhd,v 1.3 2011/06/16 12:54:05 billw Exp $
--
--  Title:  Unified library utilities
--
--  Description: This is the version used in the Reed-Solomon Encoder & Decoder cores.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

package ul_utils is

--------------------------------------------------------------------------------
-- TYPES
--------------------------------------------------------------------------------

subtype mem_q_type is integer range 0 to 2;


--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------

-- c_family_int constants
constant c_virtex  : integer := 0;
constant c_virtex2 : integer := 1;

------------------------------------------------------------------------------
-- Constants for parser type. Must match values used in distributed memory
-- generator core.
constant xst_classic_parser : integer := 1;
constant xst_verific_parser : integer := 0;

-- Set parser type being used for old families
constant parser_type_for_old_families : integer := xst_verific_parser;


------------------------------------------------------------------------------
constant new_line : string(1 to 1) := (1 => lf); -- for assertion reports

constant no_reg              : mem_q_type := 0;
constant reg                 : mem_q_type := 1;
constant reg_and_no_reg      : mem_q_type := 2;
constant def_mem_q_type      : mem_q_type := reg;


  
--------------------------------------------------------------------------------
-- XST Attributes
--

-- The "keep" attribute is used in some places to force XST to route a
-- critical path signal to the 2nd of 2 LUTs in a chain. This may lead to
-- unneccessary additional LUTs in 6-LUT architectures so turn this off for
-- these.
--attribute keep : string; -- Now declared in axi_utils global_util_pkg

-- Use this attribute to prevent XST removing registers. Especially important
-- where duplicate registers have been added to reduce fan-out or prevent
-- primary outputs being routed back into the design.
attribute equivalent_register_removal : string;




  
--------------------------------------------------------------------------------
-- FUNCTION PROTOTYPES
--------------------------------------------------------------------------------

function concatenate_strings(i0 : string; i1 : string) return string;

function display_int3(int1 : integer;
                      int2 : integer;
                      int3 : integer) return boolean;
                      
function int_2_hex( value, bitwidth : integer ) return string;

function int_2_std_logic_vector( value, bitwidth : integer ) return std_logic_vector;

function is_old_family(c_family : string) return boolean;

function two_comp(vect : std_logic_vector) return std_logic_vector;

function std_logic_vector_2_posint(vect : std_logic_vector) return integer;

function int_2_string3(val : integer) return string;

function int_2_logic_string(value, bitwidth : integer) return string;

function integer_to_logic_string(value, bitwidth : integer) return string;

-- The range has to be specified because of Metamor bug
function mem_vector_2_int(bvec : std_logic_vector(15 downto 0)) return integer;

function bitsneededtorepresent( a_value : integer ) return integer;

function div2roundup( a_value : integer ) return integer;

function div_roundup( dividend : integer;
                      divisor  : integer) return integer;

function eval( condition : boolean ) return integer;

function trim( vector : std_logic_vector; bits : integer ) return std_logic_vector;

function extend( vector : std_logic_vector; bits : integer ) return std_logic_vector;

function extend( vector : std_logic_vector; bits : integer; signed : boolean ) return std_logic_vector;

function range_check( value, lower_limit, upper_limit : integer ) return integer;

function log2u(x : integer) return integer;

function log2d(x : integer) return integer;

function max_of(i0, i1 : integer) return integer;

function is_power_of_two(x : integer) return boolean;
  
  
--------------------------------------------------------------------------------
-- SIMULATION FUNCTION PROTOTYPES
--------------------------------------------------------------------------------

function std_logic_vector_2_int(vect : std_logic_vector) return integer;

function std_logic_vector_2_var(vect: std_logic_vector) return std_logic_vector;

end ul_utils;



package body ul_utils is

--------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- Return TRUE if the family is one of the pre-Virtex6, or Spartan6 families
------------------------------------------------------------------------------
function is_old_family(c_family : string) return boolean is
begin
  
  -- Check all legal pre-vx6/s6 values for c_family
  if equalignorecase(c_family, "virtex5") then
    return true;
  elsif equalignorecase(c_family, "spartan3") then
    return true;
  elsif equalignorecase(c_family, "virtex4") then
    return true;
  elsif equalignorecase(c_family, "virtex2") then
    return true;
  elsif equalignorecase(c_family, "virtex2p") then
    return true;
  elsif equalignorecase(c_family, "virtex") then
    return true;
  else
    return false; -- it must be newer than vx5/s3
  end if;

end is_old_family;



--------------------------------------------------------------------------------
-- Return logarithm to base 2 of input parameter. Result is rounded up to
-- nearest integer.
--------------------------------------------------------------------------------
function log2u(x : integer) return integer is
  variable y            : integer;
  variable two_to_the_y : integer;
begin
  y := 0;
  two_to_the_y := 1;
  
  while (two_to_the_y < x) loop
    y := y+1;
    two_to_the_y := two_to_the_y * 2;
  end loop;
  
  return y;
end log2u;

--------------------------------------------------------------------------------
-- Return logarithm to base 2 of input parameter. result is rounded down to
-- nearest integer.
--------------------------------------------------------------------------------
function log2d(x : integer) return integer is
  variable y            : integer;
  variable two_to_the_y : integer;
begin
  y := 0;
  two_to_the_y := 1;
  
  while (two_to_the_y < x) loop
    y := y+1;
    two_to_the_y := two_to_the_y * 2;
  end loop;
  
  if two_to_the_y > x then
    y := y - 1;
  end if;
  
  return y;
end log2d;



--------------------------------------------------------------------------------
-- Return true if parameter is a power of 2, else return false.
--------------------------------------------------------------------------------
function is_power_of_two(x : integer) return boolean is
  variable y : integer;
begin
  y := log2u(x);
  if 2**y = x then
    return true;
  else
    return false;
  end if;
end is_power_of_two;

  
  
--------------------------------------------------------------------------------
-- Return i0 if sel = 0, i1 if sel = 1
--------------------------------------------------------------------------------
function max_of(i0, i1 : integer) return integer is
begin
  if (i0 > i1) then
    return i0;
  else
    return i1;
  end if;
end max_of;



--------------------------------------------------------------------------------
-- Concatenate two STRINGs
--------------------------------------------------------------------------------
function concatenate_strings(i0 : string; i1 : string) return string is
  constant i0_length : integer := i0'length;
  constant i1_length : integer := i1'length;
  variable result    : string(1 to (i0_length + i1_length)); 
begin

  if i0_length > 0 then
    for ci in 1 to i0_length loop
      result(ci) := i0(ci);
    end loop;
  end if;
  
  if i1_length > 0 then
    for ci in 1 to i1_length loop
      result(ci+i0_length) := i1(ci);
    end loop;
  end if;
  
  return result;
  
end concatenate_strings;


--------------------------------------------------------------------------------
-- Useful FUNCTION for displaying INTEGERs during debugging
--------------------------------------------------------------------------------
function display_int3(int1 : integer;
                      int2 : integer;
                      int3 : integer) return boolean is
begin

  assert false
    report "DEBUG -  " & new_line &
           "int1 = " & integer'image(int1) & new_line &
           "int2 = " & integer'image(int2) & new_line &
           "int3 = " & integer'image(int3) & new_line
    severity note;

  return true;
end display_int3;



--------------------------------------------------------------------------------
function range_check( value, lower_limit, upper_limit : integer )
  return integer is

begin

  if value>upper_limit then
    return upper_limit;
  elsif value<lower_limit then
    return lower_limit;
  else
    return value;
  end if;

end range_check;

 ------------------------------------------------------------------------ --

function int_2_hex( value, bitwidth : integer )
  return string is

  constant hexdigits      : string(1 to 16) := "0123456789ABCDEF";
  variable running_value  : integer        := value;
  variable digit_value    : integer        := 0;
  variable digit_position : integer        := 1;
  variable results_string : string(1 to bitwidth/4);

begin

  for i in bitwidth-1 downto 0 loop

    if (2**i) <= running_value then
      running_value := running_value - (2**i);
      digit_value := digit_value + (2**(i mod 4));
    end if;

    if i mod 4 = 0 then
      results_string(digit_position) := hexdigits(1+digit_value);
      digit_value := 0;
      digit_position := digit_position + 1;
    end if;

  end loop;

  return results_string;

end int_2_hex;

 ------------------------------------------------------------------------ --

function int_2_std_logic_vector( value, bitwidth : integer )
  return std_logic_vector is

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

  if (value < 0) then -- find the 2s complement
     return two_comp(running_result);
  else
    return running_result;
  end if;

end int_2_std_logic_vector;

 ------------------------------------------------------------------------ --

function two_comp(vect : std_logic_vector)
  return std_logic_vector is

variable local_vect : std_logic_vector(vect'high downto 0);
variable toggle : integer := 0;

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

 ------------------------------------------------------------------------ --

function std_logic_vector_2_posint(vect : std_logic_vector) return integer is

  variable result : integer := 0;

begin

  for i in vect'high downto vect'low loop
    result := result * 2;
    if (rat(vect(i)) = '1') then
      result := result + 1;
    elsif (rat(vect(i)) /= '0') then
      assert false
        report "Treating a non 0-1 std_logic_vector as 0 in std_logic_vector_2_posint"
        severity warning;
    end if;
  end loop;

  return result;

end std_logic_vector_2_posint;

 ------------------------------------------------------------------------ --


function int_2_string3(val : integer) return string is

  variable digit : integer;
  variable value : integer := val;
  variable posn  : integer;
  constant str   : string(1 to 10) := "0123456789";
  variable ret_value : string(1 to 3) := "000";

begin

  assert (val >= 0)
  report "Function int_2_string3 must receive a positive integer."
  severity error;

  assert (val < 999)
  report "Function int_2_string3 must receive an integer < 999."
  severity error;

  if (val = 0) then
    return "000";
  else
    posn := 3;
    while (value /= 0) loop
        digit := value mod 10;
        ret_value(posn) := str(digit+1);
        value := value/10;
        posn := posn - 1;
    end loop;
  end if;

  return ret_value;

end int_2_string3;

--------------------------------------------------------------------------------
-- Not deal with negative number
-- Returns a STRING(bitwidth DOWNTO 1) where character bitwidth is the most
-- significant digit.
--------------------------------------------------------------------------------
function int_2_logic_string( value, bitwidth : integer ) return string is

  variable running_value  : integer := value;
  variable running_result : string(bitwidth downto 1);
  constant str: string(1 to 2) :="01";
begin

  for i in bitwidth-1 downto 0 loop

    if (2**i)>running_value then
      running_result(i+1) := str(1);
    else
      running_result(i+1) := str(2);
      running_value := running_value - (2**i);
    end if;

  end loop;

  return running_result;

end int_2_logic_string;
  
  
--------------------------------------------------------------------------------
-- Not deal with negative number
-- Returns a STRING(1 TO bitwidth) where character 1 is the most significant
-- digit.
--------------------------------------------------------------------------------
function integer_to_logic_string(value, bitwidth : integer) return string is
  variable running_value : integer := value;
  -- MSB leftmost
  variable running_result : string(1 to bitwidth);
  constant str : string(1 to 2) := "01";
begin

  for i in bitwidth-1 downto 0 loop

    if (2**i) > running_value then
      running_result(bitwidth-i) := str(1);
    else
      running_result(bitwidth-i) := str(2);
      running_value := running_value - (2**i);
    end if;

  end loop;

  return running_result;

end integer_to_logic_string;


-- ------------------------------------------------------------------------ --

function mem_vector_2_int(bvec : std_logic_vector(15 downto 0)) return integer is
  variable memint : integer;
  begin
    memint := 0;
    for nbit in bvec'range loop
      memint := 2*memint;
      if (bvec(nbit) = '1') then
        memint := memint+1;
      elsif (bvec(nbit) /= '0') then
        assert false 
          report "Treating a non 0-1 std_logic_vector as 0 in mem_vec_2_int"
          severity warning;
      end if;
    end loop;
  return memint;
end mem_vector_2_int;

-- ------------------------------------------------------------------------ --

function trim( vector : std_logic_vector; bits : integer ) return std_logic_vector is
begin

  return vector(bits-1 downto 0);

end trim;

-------------------------------------------------------------------------------
--  extend: sign extend a bit vector to the designated width.
-------------------------------------------------------------------------------

function extend( vector : std_logic_vector; bits : integer ) return std_logic_vector is

  constant return_width : integer := bits; -- greatest2( bits, vector'length );
  variable return_value : std_logic_vector(return_width-1 downto 0);

begin

  for i in 0 to return_width-1 loop
    if i <= vector'length-1 then
      return_value(i) := vector(i);
    else
      return_value(i) := vector(vector'high);
    end if;
  end loop;

  return return_value;

end extend;

-------------------------------------------------------------------------------
--  extend: extend a bit vector to the designated width.
--  Depending on the value of "signed", the vector is either sign-extended or
--  zero-extended.
-------------------------------------------------------------------------------

function extend( vector : std_logic_vector;
                 bits   : integer;
                 signed : boolean ) return std_logic_vector is

  variable return_value : std_logic_vector(bits-1 +vector'low  downto vector'low);

begin

--    report "extend(vector,"&integer'image(bits)&")"&cr&"return_value bounds: "
--  & integer'image(return_value'high) & " downto "
--  & integer'image(return_value'low) & cr
--  & "vector bounds: "
--  & integer'image(vector'high) & " downto "
--  & integer'image(vector'low) & cr;

  return_value(vector'high downto return_value'low) := vector;
  for i in vector'high +1 to return_value'high loop
    if (signed) then      --  sign extend.
      return_value(i) := vector(vector'high);
    else         --  zero extend.
      return_value(i) := '0';
    end if;
  end loop;

  return return_value;

end extend;

 ------------------------------------------------------------------------ --

function eval( condition : boolean ) return integer is
begin

  if condition=true then
    return 1;
  else
    return 0;
  end if;

end eval;

 ------------------------------------------------------------------------ --

function div2roundup( a_value : integer ) return integer is
begin

  return (a_value / 2) + (a_value mod 2);

end div2roundup;

--------------------------------------------------------------------------------
-- Only works for +ve integers
function div_roundup( dividend : integer;
                      divisor  : integer) return integer is
begin

  return (dividend + divisor-1) / divisor;

end div_roundup;

 ------------------------------------------------------------------------ --

function bitsneededtorepresent( a_value : integer ) return integer is
  variable return_value : integer := 1;
begin

  for i in 30 downto 0 loop
    if a_value >= 2**i then
      return_value := i+1;
      exit;
    end if;
  end loop;

  return return_value;

end bitsneededtorepresent;

-- ------------------------------------------------------------------------ --
-- SIMULATION FUNCTIONS 
-- ------------------------------------------------------------------------ --


-- ------------------------------------------------------------------------ --

function std_logic_vector_2_int(vect : std_logic_vector) return integer is
  variable local_vect : std_logic_vector(vect'high downto 0);
  variable result : integer := 0;
begin

  if (rat(vect(vect'high)) = '1') then -- negative number
    local_vect := two_comp(vect);
  else
    local_vect := vect;
  end if;

  for i in vect'high downto 0 loop
    result := result * 2;
    if (rat(local_vect(i)) = '1') then
      result := result + 1;
    elsif (rat(local_vect(i)) /= '0') then
      assert false
        report "Treating a non 0-1 std_logic_vector as 0 in std_logic_vector_2_int"
        severity warning;
    end if;
  end loop;

  if (rat(vect(vect'high)) = '1') then
    result := -1 * result;
  end if;

  return result;

end std_logic_vector_2_int;

-- ------------------------------------------------------------------------ --
function std_logic_vector_2_var (vect: std_logic_vector) 

return std_logic_vector is
  variable mvl: std_logic_vector(vect'left downto vect'right);

begin
  for i in vect'range loop
    mvl(i) := rat(vect(i));
  end loop;
  return mvl;

end std_logic_vector_2_var;



end ul_utils;

-- ------------------------------------------------------------------------ --

library ieee;

package math_int is

    --
    -- Function declarations
    --
    function sign (x: integer ) return integer;
  -- returns 1 if x > 0; 0 if x == 0; -1 if x < 0

    function ceiling (x : real ) return integer;
  -- returns smallest integer value not less than x

    function ceiling_rat (n, d : real ) return integer;
  -- returns smallest integer value not less than n / d

    function floor (x : real ) return integer;
  -- returns largest integer value not greater than x

    function imax (x, y : integer ) return integer;
  -- returns the algebraically larger of x and y

    function imin (x, y : integer ) return integer;
  -- returns the algebraically smaller of x and y

end  math_int;
library ieee;

package body math_int is

    --
    -- non-trascendental functions
    --
function sign (x: integer ) return integer is
  -- returns 1 if x > 0; 0 if x == 0; -1 if x < 0
begin
    if  ( x > 0 ) then
      return 1;
    elsif ( x < 0 ) then
      return -1;
    else
      return 0;
    end if;
end sign;

function ceiling (x : real ) return integer is
  -- returns smallest integer value (as integer) not less than x
  -- no conversion to an integer type is expected, so truncate cannot
  -- overflow for large arguments.

  constant large: integer  := 1073741824;
  --type long is range -1073741824 to 1073741824;
  -- 2**30 is longer than any single-precision mantissa
  variable round: integer;

  begin
    if integer(abs( x)) >= large then
      return integer(x);
    else
      round := integer(x);  -- defined as rounding (up or down)
--  report "ceiling(" & real'image(x) & ") = " & integer'image(round) & cr;
      if x > 0.0 then
        if real(round) >= x then
          return round;
        else
          return round + 1;
        end if;
      elsif  x = 0.0 then
        return 0;
      else
        if real(round) <= x then
          return round;
        else
          return round - 1;
        end if;
      end if;
    end if;
end ceiling;

--  a ceiling function for rational numbers.
function ceiling_rat (n, d : real ) return integer is
  -- returns smallest integer value (as integer) not less than n/d
  variable trunc: integer;
  variable mult : real;

begin
  trunc := integer(n / d);
  mult := d * real(trunc);
  if (n = 0.0) then
    trunc := 0;
  end if;

  if (n > 0.0 and d > 0.0) or (n < 0.0 and d < 0.0) then             --  result is positive
    if mult /= n then  --  truncation is towards 0.
      trunc := trunc +1;
    end if;
  --  if the result is negative, the result is either already exact or
  --  truncated in the correct direction.
  end if;
--  report "ceiling_rat(" & real'image(n) & ", " & real'image(d) & ") = " & integer'image(trunc) & cr;
  return (trunc);
end ceiling_rat;

function floor (x : real ) return integer is
  -- returns largest integer value (as integer) not greater than x
  -- no conversion to an integer type is expected, so truncate
  -- cannot overflow for large arguments.
  --
  variable large: integer  := 1073741824;
  --type long is range -1073741824 to 1073741824;
  -- 2**30 is longer than any single-precision mantissa
  variable round: integer;

begin
  if abs( x ) >= real(large) then
    return large;
  else
    round := integer(x);  -- defined as rounding (up or down).
    if x > 0.0 then
      if real(round) <= x then
        return round;
      else
        return round - 1;
      end if;
    elsif x = 0.0 then
      return 0;
    else
      if real(round) >= x then
        return round;
      else
        return round + 1;
      end if;
    end if;
  end if;
end floor;

function imax (x, y : integer ) return integer is
  -- returns the algebraically larger of x and y
begin
  if x > y then
    return x;
  else
    return y;
  end if;
end imax;

function imin (x, y : integer ) return integer is
  -- returns the algebraically smaller of x and y
begin
  if x < y then
    return x;
  else
    return y;
  end if;
end imin;

end math_int;


------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/util_xcc.vhd,v 1.2 2011/06/02 10:55:44 billw Exp $
--
--  Package: util
--  File:   util_xcc.vhd
--
--  Useful utilities.
--
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Now need to declare use of std for Modelsim to pick up XBIP_UTILS_integer_vector
-- Note that this change is not necessary for XST and has not been published
-- for v6.1
--library std;
--use std.standard.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;


library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;


---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
package util_xcc is


-- Coregen XCC attributes. These are also defined in xcc packages, but use a local definition
-- to avoid problems with finding and picking up xcc library
attribute qualified_by_project_dir : boolean;

-- Useful type for holding both minimum and maximum limits of an integer parameter
type min_max_int_type is record
  min : integer;
  max : integer;
end record;

subtype x_digit is integer range 0 to 9;

type char_tab is array (0 to 9) of character;

---------------------------------------------------------------------------------------

constant char_val : char_tab := ('0','1','2','3','4','5','6','7','8','9');
constant max_string_length : natural := 256;

---------------------------------------------------------------------------------------
function bit_vector_to_integer(bv : in bit_vector) return integer;

function bit_vector_to_integer_vector_left(bv                : in bit_vector;
                                           bv_element_length : in integer)
    return XBIP_UTILS_integer_vector;

function bit_vector_to_integer_vector_right(bv                : in bit_vector;
                                            bv_element_length : in integer)
    return XBIP_UTILS_integer_vector;

function bit_vector_to_string(bitsin : bit_vector;
                              nbits  : integer) return string;

function bool_to_int(bv : in boolean) return integer;

--function eval_license(license_type : string) return integer;

function get_family_int(fam : string) return integer;

function get_gcd(x,y : integer) return integer;

function get_sum(a : XBIP_UTILS_integer_vector) return integer;

function integer_to_bit_vector(i         : in integer;
                               bv_length : in integer) return bit_vector;

function integer_to_string(int_value : integer) return string;

function XBIP_UTILS_integer_vector_to_bit_vector(iv                : in XBIP_UTILS_integer_vector;
                                      bv_element_length : in integer)
  return bit_vector;

function select_string(i0  : string;
                       i1  : string;
                       sel : boolean) return string;

function select_val(i0 : integer; i1 : integer; sel : integer) return integer;

function select_val_b(i0 : integer; i1 : integer; sel : boolean) return integer;

function std_logic_vector_convert_h_to_1(in_val:in std_logic_vector) return std_logic_vector;

function bit_vector_to_natural(in_val:in bit_vector) return natural;

function std_logic_vector_to_natural(in_val:in std_logic_vector) return natural;

function natural_to_bit_vector(in_val:in natural; length: in natural) return bit_vector;

function std_logic_vector_to_bit_vector(in_val:in std_logic_vector; xmap:in bit) return bit_vector;

function natural_to_std_logic_vector(in_val:in natural; length: in natural) return std_logic_vector;

end util_xcc;




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- Package Body
-- ============
--
PACKAGE BODY util_xcc IS

--------------------------------------------------------------------------------
-- Convert BIT_VECTOR to INTEGER
-- BIT_VECTOR must have a descending range and be in 2's complement notation
--------------------------------------------------------------------------------
FUNCTION bit_vector_to_integer(bv : IN BIT_VECTOR) RETURN INTEGER IS
  VARIABLE found_msb       : BOOLEAN := FALSE;
  VARIABLE msb             : INTEGER := 0;
  VARIABLE unsigned_result : INTEGER := 0;
BEGIN
  IF bv'length > 32 THEN
    ASSERT FALSE
    REPORT "bit_vector_to_integer function doesn't support " &
           "bv_element_length > 32"
    SEVERITY FAILURE;
  END IF;
  found_msb := FALSE;
  FOR i IN bv'RANGE LOOP
    IF found_msb = TRUE THEN
      unsigned_result := unsigned_result * 2 + bit'POS(bv(i));
      msb := msb*2;
    ELSE
      IF bit'POS(bv(i)) = 1 THEN
        msb := -1;
      END IF;
      found_msb := TRUE;
    END IF;
  END LOOP;
  RETURN msb + unsigned_result;
END bit_vector_to_integer;


--------------------------------------------------------------------------------
--
-- Convert bit_vector to XBIP_UTILS_integer_vector
-- Assumes BIT_VECTOR is of type (N DOWNTO 0) with element 0 of the result in
-- the first (left-most) bv_element_length bits.
--
--------------------------------------------------------------------------------
FUNCTION bit_vector_to_integer_vector_left(bv                : IN BIT_VECTOR;
                                           bv_element_length : IN INTEGER)
  RETURN XBIP_UTILS_integer_vector IS
  CONSTANT bv_length : INTEGER := bv'LENGTH;
  CONSTANT iv_length : INTEGER := bv_length/bv_element_length;

  VARIABLE bv_element : BIT_VECTOR(bv_element_length - 1 DOWNTO 0) :=
                                                                  (OTHERS=>'0');
  VARIABLE result : XBIP_UTILS_integer_vector(0 TO iv_length - 1);
BEGIN
  IF bv_element_length > 32 THEN
    ASSERT FALSE
    REPORT "bit_vector_to_integer_vector function doesn't " &
           "support bv_element_length > 32"
    SEVERITY FAILURE;
  END IF;

  FOR ai IN 0 TO (iv_length - 1) LOOP -- ai = address index
    -- Build up element bit_vector
    FOR bi IN (bv_element_length - 1) DOWNTO 0 LOOP
      bv_element(bi) := bv(bv_length-((ai+1)*bv_element_length) + bi);
      --bv_element(bi) := bv(ai*bv_element_length + bi);
    END LOOP; -- bi
    result(ai) := bit_vector_to_integer(bv_element);
  END LOOP; -- ai

  RETURN result;
END bit_vector_to_integer_vector_left;





--------------------------------------------------------------------------------
--
-- Convert bit_vector to XBIP_UTILS_integer_vector
-- Assumes BIT_VECTOR is of type (N DOWNTO 0) with element 0 of the result in
-- the first (right-most) bv_element_length bits.
--
--------------------------------------------------------------------------------
FUNCTION bit_vector_to_integer_vector_right(bv                : IN BIT_VECTOR;
                                            bv_element_length : IN INTEGER)
  RETURN XBIP_UTILS_integer_vector IS
  CONSTANT bv_length : INTEGER := bv'LENGTH;
  CONSTANT iv_length : INTEGER := bv_length/bv_element_length;

  VARIABLE bv_element : BIT_VECTOR(bv_element_length - 1 DOWNTO 0) :=
                                                                  (OTHERS=>'0');
  VARIABLE result : XBIP_UTILS_integer_vector(0 TO iv_length - 1);
BEGIN
  IF bv_element_length > 32 THEN
    ASSERT FALSE
    REPORT "bit_vector_to_integer_vector function doesn't " &
           "support bv_element_length > 32"
    SEVERITY FAILURE;
  END IF;

  FOR ai IN 0 TO (iv_length - 1) LOOP -- ai = address index
    -- Build up element bit_vector
    FOR bi IN (bv_element_length - 1) DOWNTO 0 LOOP
      bv_element(bi) := bv(ai*bv_element_length + bi);
    END LOOP; -- bi
    result(ai) := bit_vector_to_integer(bv_element);
  END LOOP; -- ai

  RETURN result;
END bit_vector_to_integer_vector_right;





--------------------------------------------------------------------------------
-- Convert BIT_VECTOR to STRING
-- Assumes BIT_VECTOR of type (nbits-1 DOWNTO 0) with LSB in 0 position.
-- Assumes STRING is of type (n TO n+length-1) with MSB in 'n' position.
--------------------------------------------------------------------------------
FUNCTION bit_vector_to_string(bitsin : BIT_VECTOR; nbits : INTEGER)
  RETURN STRING IS
  VARIABLE ret     : STRING(1 TO nbits);
  VARIABLE bit_num : INTEGER;
BEGIN
  ret := (OTHERS => '0');

  bit_num := 1;

  FOR i IN bitsin'HIGH DOWNTO bitsin'LOW LOOP

    IF bitsin(i) = '1' THEN
      ret(bit_num) := '1';
    ELSE
      ret(bit_num) := '0';
    END IF;

    bit_num := bit_num + 1;

    IF bit_num > nbits THEN
      EXIT; -- Ignore ls bits in BV if BV is longer than STRING
    END IF;
  END LOOP;

  RETURN ret;

END bit_vector_to_string;



-- --
-- -- Return 1 if no license found
-- --
-- FUNCTION eval_license(license_type : STRING) RETURN INTEGER IS
--  VARIABLE res : INTEGER;
-- BEGIN
--   IF (license_type = LICENSE_BOUGHT) THEN
--     res := 0;
--   ELSE
--     res := 1;
--   END IF;
--
--   RETURN res;
-- END eval_license;


--
-- Return INTEGER value to represent family
-- 0 => Virtex based, 1 => Virtex-II based
--
FUNCTION get_family_int(fam : STRING) RETURN INTEGER IS
  VARIABLE res : INTEGER;
BEGIN
--  IF (fam = "virtex" OR fam = "virtexe" OR fam = "spartan2"  OR fam = "spartan2e") THEN
  IF derived(fam, "virtex") THEN
   res := c_virtex;
  ELSE
   res := c_virtex2;
  END IF;
  RETURN res;
END get_family_int;




--------------------------------------------------------------------------------
-- Perform same function as BOOLEAN'POS. XST appears to have some trouble
-- with BOOLEAN'POS so use this function in that case.
-- Return 1 or 0 if bv is TRUE or FALSE respectively.
--
FUNCTION bool_to_int(bv : IN BOOLEAN) RETURN INTEGER IS
BEGIN
  IF bv THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF; -- bv
END bool_to_int;


--
-- Return greatest common divisor of supplied parameters.
-- i.e. largest number that both x and y can be divided by with no remainder
--
FUNCTION get_gcd(x,y : INTEGER) RETURN INTEGER IS
  VARIABLE int_x : INTEGER := x;
  VARIABLE int_y : INTEGER := y;
  VARIABLE int_t : INTEGER;
BEGIN
  WHILE int_x > 0 LOOP
    IF (int_x < int_y) THEN
      int_t := int_x;
      int_x := int_y;
      int_y := int_t;
    END IF;
    int_x := int_x - int_y;
  END LOOP;
  RETURN int_y;
END get_gcd;


--------------------------------------------------------------------------------
-- Gets the sum of an array of integers
--------------------------------------------------------------------------------
FUNCTION get_sum(a : XBIP_UTILS_integer_vector) RETURN INTEGER IS
  VARIABLE sum : INTEGER;
BEGIN
  sum := 0;
  FOR i IN a'LOW TO a'HIGH LOOP
    sum := sum + a(i);
  END LOOP;
  RETURN sum;
END get_sum;


--------------------------------------------------------------------------------
--
-- Convert integer to BIT_VECTOR
--
--------------------------------------------------------------------------------
FUNCTION integer_to_bit_vector(i         : IN INTEGER;
                               bv_length : IN INTEGER) RETURN BIT_VECTOR IS
  VARIABLE temp   : INTEGER := i;
  VARIABLE result : BIT_VECTOR(bv_length-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  FOR bi IN result'LOW TO result'HIGH LOOP
    -- XST does not support BIT'VAL
    --result(bi) := BIT'VAL(temp MOD 2); -- a MOD b has the same sign as b
    IF temp MOD 2 = 0 THEN
      result(bi) := '0';
    ELSE
      result(bi) := '1';
    END IF;

    temp := temp/2;
    EXIT WHEN temp = 0;
  END LOOP;

  RETURN result;
END integer_to_bit_vector;



--------------------------------------------------------------------------------
-- Convert INTEGER to STRING
--------------------------------------------------------------------------------
FUNCTION integer_to_string(int_value : INTEGER) RETURN STRING IS

  VARIABLE digit        : INTEGER;
  VARIABLE value        : INTEGER;
  VARIABLE length       : INTEGER := 0;
  VARIABLE posn         : INTEGER;
  VARIABLE start_length : INTEGER;
  CONSTANT str          : STRING(1 TO 10) := "0123456789";
  VARIABLE ret_value    : STRING(1 TO 11);

BEGIN

  IF int_value < 0 THEN
    -- Largest possible negative number
    IF int_value < -2147483647 THEN
      RETURN ("less than VHDL minimum INTEGER value");
    ELSE
      value := -1 * int_value;
      start_length := 1;
      ret_value(1) := '-';
    END IF;
  ELSE
    value := int_value;
    start_length := 0;
  END IF;

  IF (value = 0) THEN
    RETURN "0";
  ELSIF (value < 10) THEN
    length := 1 + start_length;
  ELSIF (value < 100) THEN
    length := 2 + start_length;
  ELSIF (value < 1000) THEN
    length := 3 + start_length;
  ELSIF (value < 10000) THEN
    length := 4 + start_length;
  ELSIF (value < 100000) THEN
    length := 5 + start_length;
  ELSIF (value < 1000000) THEN
    length := 6 + start_length;
  ELSIF (value < 10000000) THEN
    length := 7 + start_length;
  ELSIF (value < 100000000) THEN
    length := 8 + start_length;
  ELSIF (value < 1000000000) THEN
    length := 9 + start_length;
  ELSE
    length := 10 + start_length;
  END IF;

  IF (length > 0) THEN -- Required because Metamor bombs without it
    posn := length;

    WHILE (value /= 0) LOOP
      digit := value MOD 10;
      ret_value(posn) := str(digit+1);
      value := value/10;
      posn := posn - 1;
    END LOOP;
  END IF;

  RETURN ret_value(1 TO length);

END integer_to_string;



--------------------------------------------------------------------------------
--
-- Convert XBIP_UTILS_integer_vector to BIT_VECTOR
--
--------------------------------------------------------------------------------
FUNCTION XBIP_UTILS_integer_vector_to_bit_vector(iv                : IN XBIP_UTILS_integer_vector;
                                      bv_element_length : IN INTEGER)
  RETURN BIT_VECTOR IS

  CONSTANT iv_length : INTEGER := iv'length;
  CONSTANT num_bits  : NATURAL := iv_length*bv_element_length;
  VARIABLE element_value : BIT_VECTOR(bv_element_length - 1 DOWNTO 0) :=
                                                                (OTHERS => '0');
  VARIABLE result : BIT_VECTOR(num_bits - 1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  FOR ai IN 0 TO (iv_length - 1) LOOP -- ai = address index
    element_value := integer_to_bit_vector(iv(ai), bv_element_length);

    FOR bi IN (bv_element_length - 1) DOWNTO 0 LOOP -- bi = bit index
      result(ai*bv_element_length + bi) := element_value(bi);
    END LOOP; -- bi

  END LOOP; -- ai

  RETURN result;
END XBIP_UTILS_integer_vector_to_bit_vector;



--------------------------------------------------------------------------------
-- Return i0 if sel = FALSE, i1 if sel = TRUE
--------------------------------------------------------------------------------
FUNCTION select_string(i0 : STRING; i1 : STRING; sel : BOOLEAN) RETURN STRING IS
BEGIN
  IF sel THEN
    RETURN i1;
  ELSE
    RETURN i0;
  END IF; -- sel
END select_string;


-- Return one off i0 or i1
FUNCTION select_val(i0 : INTEGER; i1 : INTEGER; sel : INTEGER) RETURN INTEGER IS
BEGIN
  IF sel = 0 THEN
    RETURN i0;
  ELSE
    RETURN i1;
  END IF; -- sel
END select_val;


-- Return one off i0 or i1
-- sel input is BOOLEAN in this version
FUNCTION select_val_b(i0 : INTEGER; i1 : INTEGER; sel : BOOLEAN) RETURN INTEGER IS
BEGIN
  IF sel THEN
    RETURN i1;
  ELSE
    RETURN i0;
  END IF; -- sel
END select_val_b;



-- Convert 'H's in a STD_LOGIC_VECTOR to 1's
-- This can be useful when using CASE statements and we don't care whether a signal is
-- strongly or weakly driven high.
FUNCTION std_logic_vector_convert_H_to_1(in_val:IN STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(in_val'RANGE);
BEGIN
    FOR i IN in_val'RANGE LOOP
        IF (in_val(i) = 'H') THEN
            result(i) := '1';
        ELSE
            result(i) := in_val(i);
        END IF;
    END LOOP;

    RETURN result;
END std_logic_vector_convert_H_to_1;




-- Convert NATURAL to BIT_VECTOR
FUNCTION natural_to_bit_vector(in_val : IN NATURAL;
                               length : IN NATURAL) RETURN BIT_VECTOR IS
    VARIABLE temp   : NATURAL := in_val;
    VARIABLE result : BIT_VECTOR(length-1 DOWNTO 0) := (OTHERS => '0');
BEGIN

  FOR i IN result'REVERSE_RANGE LOOP

    --result(i) := BIT'VAL(temp REM 2); -- XST doesn't support 'VAL
    IF (temp REM 2) = 0 THEN
      result(i) := '0';
    ELSE
      result(i) := '1';
    END IF;

    temp := temp/2;
    EXIT WHEN temp = 0;
  END LOOP;
  RETURN result;

END natural_to_bit_vector;


-- Convert STD_LOGIC_VECTOR to BIT_VECTOR
-- xmap is used for non-convertible values.
FUNCTION std_logic_vector_to_bit_vector(in_val : IN STD_LOGIC_VECTOR;
                                        xmap   : IN BIT) RETURN BIT_VECTOR IS
    VARIABLE failure : BOOLEAN := FALSE;
    VARIABLE result  : BIT_VECTOR(in_val'RANGE);
BEGIN
    FOR i IN in_val'RANGE LOOP
        IF (in_val(i) = '0' OR in_val(i) = 'L') THEN
          result(i) := '0';
        ELSIF (in_val(i) = '1' OR in_val(i) = 'H') THEN
          result(i) := '1';
        ELSE
          result(i) := xmap;
          failure   := TRUE;
        END IF;
    END LOOP;

    IF failure THEN
        -- Provide warning except at time 0. This is because there are loads of
        -- X's at time 0.
    --    IF NOW /= 0 PS THEN
        ASSERT FALSE
            REPORT "std_logic_to_bit_vector: There is a non-numeric bit in the argument."&
                   " It has been converted to " & char_val(BIT'POS(xmap)) & "."
            SEVERITY WARNING;
    --    END IF;
    END IF;

    RETURN result;
END std_logic_vector_to_bit_vector;



-- Convert BIT_VECTOR to NATURAL
-- BIT_VECTOR must have a descending range
FUNCTION bit_vector_to_natural(in_val:IN BIT_VECTOR) RETURN NATURAL IS
    VARIABLE result : NATURAL := 0;
BEGIN
  FOR i IN in_val'RANGE LOOP
      result := result * 2 + BIT'POS(in_val(i));
  END LOOP;

  RETURN result;
END bit_vector_to_natural;





-- Convert STD_LOGIC_VECTOR to NATURAL
-- STD_LOGIC_VECTOR must have a descending range
FUNCTION std_logic_vector_to_natural(in_val:IN STD_LOGIC_VECTOR) RETURN NATURAL IS
  VARIABLE result  : NATURAL := 0;
  VARIABLE failure : BOOLEAN := FALSE;
BEGIN
  FOR i IN in_val'RANGE LOOP
    result := result * 2;

    IF (in_val(i) = '1' OR in_val(i) = 'H') THEN
      result := result + 1;
    ELSIF (in_val(i) /= '0' AND in_val(i) /= 'L') THEN
      failure   := TRUE;
    END IF;
  END LOOP;

  IF failure THEN
    -- Provide warning except at time 0. This is because there are loads of
    -- X's at time 0.
    --IF NOW /= 0 PS THEN
        ASSERT FALSE
        REPORT "std_logic_vector_to_natural: There is a non-numeric bit in the argument."&
               " It has been converted to 0."
        SEVERITY WARNING;
    --END IF;
  END IF;

  RETURN result;
END std_logic_vector_to_natural;




-- Convert NATURAL to STD_LOGIC_VECTOR(length-1 DOWNTO 0)
FUNCTION natural_to_std_logic_vector(in_val:IN NATURAL; length: IN NATURAL)
                               RETURN STD_LOGIC_VECTOR IS
  VARIABLE temp   : NATURAL := in_val;
  VARIABLE result : STD_LOGIC_VECTOR(length-1 DOWNTO 0) := (OTHERS => '0');

  CONSTANT bit_val : STD_LOGIC_VECTOR(0 TO 1) := (0=> '0', 1=>'1');
BEGIN
  FOR i IN result'REVERSE_RANGE LOOP
    result(i) := bit_val(temp REM 2);
    temp := temp/2;
    EXIT WHEN temp = 0;
  END LOOP;
  RETURN result;
END natural_to_std_logic_vector;



END util_xcc;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/mem_init_file_pack.vhd,v 1.2 2011/05/10 11:21:41 billw Exp $
--
--  Description:
--   Memory Initialization File reading and writing procedures
--   VHDL-93 compatible version
--     Not compatible with VHDL-87
--
--------------------------------------------------------------------------------

LIBRARY std;
USE std.textio.ALL;
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--

-- This package contains functions to read and write Memory Initialization
-- Files into or from a memory stored as a single BIT_VECTOR

PACKAGE mem_init_file_pack IS

  IMPURE FUNCTION read_meminit_file(
                              filename          : IN STRING;
                              c_elaboration_dir : IN STRING;
                              depth             : IN INTEGER;
                              width             : IN INTEGER;
                              lines             : IN INTEGER
                            ) RETURN BIT_VECTOR;

  IMPURE FUNCTION write_meminit_file(
                               filename          : IN STRING;
                               c_elaboration_dir : IN STRING;
                               depth             : IN INTEGER;
                               width             : IN INTEGER;
                               memvect           : IN BIT_VECTOR
                             ) RETURN BOOLEAN;
END mem_init_file_pack;


PACKAGE BODY mem_init_file_pack IS

  ------------------------------------------------------------------------------
  -- Function to read a MIF file and place the data in a BIT_VECTOR
  -- Takes parameters:
  --   filename : Name of the file from which to read data
  --   c_elaboration_dir : Coregen requires mif files to be written to the
  --                       elaboration directory. Coregen automatically sets
  --                       c_elaboration_dir at the core top level. It must
  --                       be passed all the way down to this function.
  --   depth    : Depth of memory in words
  --   width    : Width of memory in bits
  --   lines    : Number of lines to be read from file
  --              If the file has fewer lines then only the available
  --              data is read. If lines > depth then the return vector
  --              is padded with '0's.
  IMPURE FUNCTION read_meminit_file(
                              filename          : IN STRING;
                              c_elaboration_dir : IN STRING;
                              depth             : IN INTEGER;
                              width             : IN INTEGER;
                              lines             : IN INTEGER
                            ) RETURN BIT_VECTOR IS
    FILE     meminitfile : TEXT;
    -- Prepend filename with elaboration directory path
    CONSTANT full_filename : STRING := c_elaboration_dir & filename;
    VARIABLE mif_status  : FILE_OPEN_STATUS;
    VARIABLE bit         : INTEGER;
    VARIABLE bitline     : LINE;
    VARIABLE bitchar     : CHARACTER;
    VARIABLE bits_good   : BOOLEAN;
    VARIABLE offset      : INTEGER;
    VARIABLE total_lines : INTEGER;
    VARIABLE num_lines   : INTEGER;
    VARIABLE mem_vector  : STRING(width DOWNTO 1);
    VARIABLE return_vect : BIT_VECTOR(width*lines-1 DOWNTO 0) := (OTHERS=>'0');
  BEGIN

--    ASSERT FALSE
--      REPORT "Reading mif file " & full_filename
--      SEVERITY NOTE;

    FILE_OPEN(mif_status, meminitfile, full_filename, read_mode);

    ASSERT mif_status = OPEN_OK
      REPORT "Error: couldn't open memory initialization file."
      SEVERITY FAILURE;

    IF mif_status = OPEN_OK THEN
        IF (lines > 0 AND lines <= depth) THEN
          total_lines := lines;
        ELSE
          total_lines := depth;
        END IF;

        num_lines := 0;
--        offset := 0;
        offset := (total_lines-1) * width;


        WHILE (NOT(ENDFILE(meminitfile)) AND (num_lines < total_lines)) LOOP
          READLINE(meminitfile, bitline);
          READ(bitline, mem_vector, bits_good);

          ASSERT bits_good
            REPORT "Error: problem reading memory initialization file " &
                   full_filename
            SEVERITY FAILURE;

          FOR bit IN 0 TO width-1 LOOP
            bitchar := mem_vector(bit+1);
            IF (bitchar = '1') THEN
              return_vect(offset+bit) := '1';
            ELSE
              return_vect(offset+bit) := '0';
            END IF;
          END LOOP; -- FOR

          num_lines := num_lines+1;
--          offset := offset + width;
          offset := offset - width;

        END LOOP; -- WHILE

    END IF; -- mif_status

    FILE_CLOSE( meminitfile );

    RETURN return_vect;

  END read_meminit_file;





  ------------------------------------------------------------------------------
  -- Function to write a MIF file using the data stored in a BIT_VECTOR
  -- Takes parameters
  --   filename : Name of the file to which data is to be written
  --   c_elaboration_dir : Coregen requires mif files to be written to the
  --                       elaboration directory. Coregen automatically sets
  --                       c_elaboration_dir at the core top level. It must
  --                       be passed all the way down to this function.
  --   depth    : Depth of memory in words
  --   width    : Width of memory in bits
  --   memvect  : Memory vector ( if length < depth*width then it is padded
  --                              with '0's )
  IMPURE FUNCTION write_meminit_file(
                               filename          : IN STRING;
                               c_elaboration_dir : IN STRING;
                               depth             : IN INTEGER;
                               width             : IN INTEGER;
                               memvect           : IN BIT_VECTOR
                             ) RETURN BOOLEAN IS

    -- Addresses CR729188 - Vivado Synthesis crash and heavy memory usage
    attribute mem_init_write_file : string;
    attribute mem_init_write_file of filename : constant is "yes";

    FILE     meminitfile   : TEXT;
    -- Prepend filename with elaboration directory path
    CONSTANT full_filename : STRING := c_elaboration_dir & filename;
    VARIABLE mif_status    : FILE_OPEN_STATUS;
    VARIABLE addrs         : INTEGER;
    VARIABLE bit           : INTEGER;
    VARIABLE bitline       : LINE;
    VARIABLE bitchar       : CHARACTER;
    VARIABLE offset        : INTEGER;
    VARIABLE contents      : BIT_VECTOR(width-1 DOWNTO 0);
    CONSTANT mem_bits      : INTEGER := depth * width;
    CONSTANT vec_bits      : INTEGER := memvect'LENGTH;
  BEGIN

--    ASSERT FALSE
--      REPORT "Writing mif file " & full_filename
--      SEVERITY NOTE;

    FILE_OPEN(mif_status, meminitfile, full_filename, write_mode);

    ASSERT mif_status = OPEN_OK
      REPORT "Error: couldn't open memory initialization file."
      SEVERITY FAILURE;

--    ASSERT FALSE
--      REPORT "mif file opened...."
--      SEVERITY NOTE;

    IF mif_status = OPEN_OK THEN
        offset := 0;

        FOR addrs IN 0 TO depth-1 LOOP
          FOR bit IN width-1 DOWNTO 0 LOOP
            IF (offset + bit) > (vec_bits-1) THEN
                bitchar := '0'; -- Pad with '0's if memvect bits all used
            ELSE
                IF ( memvect(offset+bit) = '1' ) THEN
                  bitchar := '1';
                ELSE
                  bitchar := '0';
                END IF;
            END IF; -- addrs

            WRITE(bitline, bitchar);
          END LOOP; -- bit

          WRITELINE(meminitfile, bitline);
          offset := offset + width;
        END LOOP; -- addrs

    END IF; -- mif_status

--    ASSERT FALSE
--      REPORT "mif file written...."
--      SEVERITY NOTE;

    FILE_CLOSE( meminitfile );

--    ASSERT FALSE
--      REPORT "mif file closed."
--      SEVERITY NOTE;

    RETURN TRUE; -- XCC requires a return value

  END write_meminit_file;

END mem_init_file_pack;


--------------------------------------------------------------------------------     
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/memutils.vhd,v 1.2 2011/05/10 11:21:41 billw Exp $
--
--  Description: Package for Parameterized Synchronous RAM
--
--------------------------------------------------------------------------------     
LIBRARY std;
USE std.standard.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.mem_init_file_pack.ALL;

PACKAGE mem_utils IS

-- Defaults
CONSTANT def_mem_width : INTEGER := 1;
CONSTANT def_mem_depth : INTEGER := 16;


-- Parameter ranges
CONSTANT abs_max_bm_depth_vx2 : INTEGER := 1048576; -- Block mem for Vx2
CONSTANT abs_max_bm_depth_vx  : INTEGER := 262144;  -- Block mem for Vx
CONSTANT max_dm_depth_vx2     : INTEGER := 65536; -- Dist mem for Vx2
CONSTANT max_dm_depth_vx      : INTEGER := 4096;  -- Dist mem for Vx
-- (2^31)/2 allows for 30-bit address bus (= max +ve INTEGER/2)
CONSTANT max_ext_ram_depth    : INTEGER := 1073741824; -- INTEGER'HIGH/2


-- Cannot have a dist mem > 'deepest_dist_mem' - have to use block mem
CONSTANT deepest_dist_mem : INTEGER := 256;
    
-- If depth > max_dist_mem then use block RAM, unless forced to use dist RAM.
CONSTANT max_dist_mem : INTEGER := 64;

  
-- Memory types
TYPE    memdatatype    IS ARRAY(NATURAL RANGE<>) OF INTEGER;
SUBTYPE mem_style_type IS INTEGER RANGE 0 TO 2;

CONSTANT dist_mem   : mem_style_type := 0;
CONSTANT block_mem  : mem_style_type := 1;
CONSTANT auto_mem   : mem_style_type := 2;

--
CONSTANT mem256allzero : memdatatype(0 TO 255) :=
(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0);
 
-- All mif files shall have mif_width bits per line
CONSTANT mif_width : INTEGER := 32;


--------------------------------------------------------------------------------
FUNCTION calc_depth(reqd_depth : INTEGER;
                    memstyle   : mem_style_type) RETURN INTEGER;
    
FUNCTION calc_depth_dp(reqd_depth : INTEGER) RETURN INTEGER;
    
IMPURE FUNCTION get_integer_vector_from_mif(really_read_mif : BOOLEAN;
                                            mif_name          : STRING;
                                            c_elaboration_dir : STRING;
                                            mif_depth         : INTEGER;
                                            mif_width         : INTEGER) RETURN XBIP_UTILS_integer_vector;
  
FUNCTION get_max_bm_depth(width    : INTEGER;
                          c_family : INTEGER) RETURN INTEGER;
                          
FUNCTION get_mem_depth(required_depth : INTEGER;
                       mem_style      : INTEGER) RETURN INTEGER;

FUNCTION get_mem_style(memstyle   : INTEGER;
                       q_mode     : INTEGER;
                       reqd_depth : INTEGER) RETURN mem_style_type;
                       
FUNCTION get_memstyle(depth    : INTEGER;
                      width    : INTEGER;
                      style    : INTEGER;
                      mem_type : INTEGER;
                      c_family : STRING;
                      smart    : BOOLEAN) RETURN INTEGER;
                       
END mem_utils;


--------------------------------------------------------------------------------
PACKAGE BODY mem_utils IS
 
--------------------------------------------------------------------------------
-- LUT memory depth must be a multiple of 16.
-- Block memory must be 16, 32, 64, 128, 256 or n * 256
--
FUNCTION calc_depth(reqd_depth : INTEGER;
                    memstyle   : mem_style_type) RETURN INTEGER IS
  VARIABLE extra      : INTEGER;
  VARIABLE addr_width : INTEGER;
BEGIN
  IF memstyle = dist_mem THEN
    extra := reqd_depth MOD 16;
    
    IF (extra = 0) THEN
        RETURN reqd_depth;
    ELSE
        RETURN (reqd_depth + 16 - extra);
    END IF;
  ELSE
    -- Must be block mem. Block mems must be 16, 32, 64, 128, 256 or n * 256
    -- deep
    IF reqd_depth <= 16 THEN
        RETURN 16;
    ELSIF reqd_depth <= 256 THEN
        RETURN 2**(bitsneededtorepresent(reqd_depth-1));
    ELSE
        RETURN 256 + (256 * ((reqd_depth-1)/256));
    END IF; -- reqd_depth
    
  END IF; -- memstyle
END calc_depth;


--------------------------------------------------------------------------------
-- Dual-port block memory must be a multiple of 256
--
FUNCTION calc_depth_dp(reqd_depth : INTEGER) RETURN INTEGER IS
  VARIABLE extra      : INTEGER;
BEGIN
  extra := reqd_depth MOD 256;
    
  IF (extra = 0) THEN
    RETURN reqd_depth;
  ELSE
    RETURN (reqd_depth + 256 - extra);
  END IF;
END calc_depth_dp;





--------------------------------------------------------------------------------
IMPURE FUNCTION get_integer_vector_from_mif(really_read_mif   : BOOLEAN;
                                            mif_name          : STRING;
                                            c_elaboration_dir : STRING;
                                            mif_depth         : INTEGER;
                                            mif_width         : INTEGER) RETURN XBIP_UTILS_integer_vector IS
  VARIABLE bv : BIT_VECTOR((mif_depth*mif_width - 1) DOWNTO 0);
  VARIABLE iv : XBIP_UTILS_integer_vector(0 TO mif_depth-1);
BEGIN
  IF (really_read_mif) THEN
    bv := read_meminit_file(mif_name, c_elaboration_dir, mif_depth,
                            mif_width, mif_depth);
--     ASSERT FALSE
--       REPORT "get_integer_from_mif : bit_vector bv = " & new_line &
--              bit_vector_to_string(bv, mif_depth*mif_width)
--       SEVERITY NOTE;
    iv := bit_vector_to_integer_vector_left(bv, mif_width);
  ELSE
    iv := (OTHERS=>0);
  END IF;
  
--   FOR i IN 0 TO mif_depth-1 LOOP
--     ASSERT FALSE
--       REPORT 
--        "iv(" & integer_to_string(i) & ") = " & integer_to_string(iv(i)) &
--        new_line
--       SEVERITY NOTE;
--   END LOOP; -- i
    
  RETURN iv;
END get_integer_vector_from_mif;


 
 
 
--------------------------------------------------------------------------------
-- Return maximum depth of Virtex block memory for a given width
-- These numbers were obtained from the block mem GUIs.
--------------------------------------------------------------------------------
FUNCTION get_max_bm_depth(width    : INTEGER;
                          c_family : INTEGER) RETURN INTEGER IS
  VARIABLE max_depth : INTEGER;
BEGIN
  IF width < 4 THEN
    max_depth := 262144;
  ELSIF width < 7 THEN
    max_depth := 131072;
  ELSIF width < 13 THEN
    max_depth := 65536;
  ELSIF width < 25 THEN
    max_depth := 32768;
  ELSIF width < 49 THEN
    max_depth := 16384;
  ELSIF width < 97 THEN
    max_depth := 8192;
  ELSIF width < 193 THEN
    max_depth := 4096;
  ELSE
    max_depth := 2048;
  END IF;
  
  IF c_family = c_virtex THEN
    RETURN max_depth;
  ELSE
    RETURN max_depth * 4; -- Virtex-II
  END IF;
  
END get_max_bm_depth;


--------------------------------------------------------------------------------
-- 
-- Distributed memory depth must be a multiple of 16.
-- Block memory must be 16, 32, 64, 128, 256 or n * 256
--
--------------------------------------------------------------------------------
FUNCTION get_mem_depth(required_depth : INTEGER;
                       mem_style      : INTEGER) RETURN INTEGER IS
  VARIABLE extra      : INTEGER;
  VARIABLE addr_width : INTEGER;
  VARIABLE result     : INTEGER := 0;
BEGIN
  ASSERT (mem_style=block_mem OR mem_style=dist_mem)
    REPORT "ERROR: RS memutils - get_mem_depth() function doesn't support " &
           "mem_style=" & INTEGER'IMAGE(mem_style)
    SEVERITY FAILURE;
    
  IF mem_style = dist_mem THEN
    extra := required_depth MOD 16;        
    IF (extra = 0) THEN
      result := required_depth;
    ELSE
      result := (required_depth + 16 - extra);
    END IF;
  ELSIF mem_style = block_mem THEN
    -- block mems must be 16, 32, 64, 128, 256 or n * 256 deep
    IF required_depth <= 16 THEN
      result := 16;
    ELSIF required_depth <= 256 THEN
      result := 2**(bitsneededtorepresent(required_depth-1));
    ELSE
      result := 256 + (256 * ((required_depth-1)/256));
    END IF; -- required_depth
  END IF; -- mem_style
  
  RETURN result;
END get_mem_depth;



--------------------------------------------------------------------------------
-- Determine type of memory to use if memstyle = auto_mem
--
FUNCTION get_mem_style(memstyle   : INTEGER;
                       q_mode     : INTEGER;
                       reqd_depth : INTEGER) RETURN mem_style_type IS
BEGIN
    
  IF memstyle = block_mem AND q_mode /= reg THEN
    ASSERT FALSE
    REPORT "Attempt to instantiate block memory without registered output." & new_line &
           "This is not possible. Substituting distributed memory instead."
    SEVERITY WARNING;

    RETURN dist_mem;
  END IF;
  
  -- Use block RAM if RAM is very deep but cannot use BRAM if combinatorial
  -- output is required.
  IF reqd_depth > deepest_dist_mem AND q_mode = reg THEN
    RETURN block_mem;
  END IF;
  
  IF memstyle = auto_mem THEN
    IF reqd_depth > max_dist_mem AND q_mode = reg THEN
      RETURN block_mem;
    ELSE
      RETURN dist_mem;
    END IF; -- reqd_depth
  ELSE
    RETURN memstyle;
  END IF; -- memstyle
  
END get_mem_style;




--------------------------------------------------------------------------------
--
-- This function returns the appropriate memory style dependent on the size
-- of the memory.
-- This is a more sophisticated version of get_mem_style.
--
-- Set 'smart' to TRUE to override ridiculously small block memories.
--
--------------------------------------------------------------------------------
FUNCTION get_memstyle(depth    : INTEGER;
                      width    : INTEGER;
                      style    : INTEGER;
                      mem_type : INTEGER;
                      c_family : STRING;
                      smart    : BOOLEAN) RETURN INTEGER IS
  VARIABLE max_bm_depth           : INTEGER;                    
  VARIABLE mem_size               : INTEGER;
  VARIABLE result                 : INTEGER := dist_mem;
  VARIABLE actual_block_mem_depth : INTEGER;
  VARIABLE actual_dist_mem_depth  : INTEGER;
  VARIABLE c_family_int           : INTEGER;
BEGIN
  c_family_int := get_family_int(c_family);
  
  max_bm_depth := get_max_bm_depth(width, c_family_int);
  
  -- Round up to actual depth required for each memory style
  actual_dist_mem_depth  := get_mem_depth(depth, dist_mem);
  actual_block_mem_depth := get_mem_depth(depth, block_mem);
  
  --ASSERT FALSE
  --  REPORT "RS memutils -  actual_dist_mem_depth = " &
  --         integer_to_string(actual_dist_mem_depth) & new_line &
  --         "            actual_block_mem_depth = " &
  --         integer_to_string(actual_block_mem_depth) & new_line &
  --         "            max_bm_depth = " &
  --         integer_to_string(max_bm_depth) & new_line &
  --         "            style = " &
  --         integer_to_string(style) & new_line &
  --         "            c_family = " &
  --         integer_to_string(c_family) & new_line
  --  SEVERITY NOTE;
    
  -- Check depth doesn't exceed limits
  IF (c_family_int = c_virtex AND
      actual_dist_mem_depth > max_dm_depth_vx AND
      actual_block_mem_depth <= max_bm_depth) OR
     (c_family_int /= c_virtex AND
      actual_dist_mem_depth > max_dm_depth_vx2 AND
      actual_block_mem_depth <= max_bm_depth) THEN
    
    ASSERT (style /= dist_mem)
      REPORT "WARNING : RS memutils - using block memory because " &
             "distributed memory is not large enough."
      SEVERITY WARNING;
    result := block_mem;
      
  ELSIF (c_family_int = c_virtex AND
         actual_block_mem_depth > max_bm_depth AND
         actual_dist_mem_depth <= max_dm_depth_vx) OR
        (c_family_int /= c_virtex AND
         actual_block_mem_depth > max_bm_depth AND
         actual_dist_mem_depth <= max_dm_depth_vx2) THEN
                  
    ASSERT (style /= block_mem)
      REPORT "WARNING : RS memutils - using distributed memory because " &
             "block memory is not large enough."
      SEVERITY WARNING;
    result := dist_mem;
      
  ELSE
  
  
    -- If depth didn't exceed max limits then determine style to use based
    -- on size and style parameter
    mem_size := actual_dist_mem_depth * width;
    -- Return value depends on memory size
    IF mem_type = c_dp_ram THEN
      mem_size := mem_size * 2; -- Only actually true for dist mem
    END IF;
 
    IF style = dist_mem THEN
      result := dist_mem;
      
    ELSIF style = block_mem THEN
      IF smart THEN
        IF mem_size <= 64 THEN
          result := dist_mem;
        ELSE
          result := block_mem;
        END IF; -- mem_size
      ELSE
        result := block_mem;
      END IF; -- smart
      
    ELSIF style = auto_mem THEN
      IF mem_size <= 512 THEN
        result := dist_mem;
      ELSE
        result := block_mem;
      END IF;
      
    ELSE -- catch errant values of style
      ASSERT FALSE
      REPORT "ERROR: RS memutils - memory style = " & INTEGER'IMAGE(style) &
             " is not supported!"
      SEVERITY FAILURE;
    END IF; -- style
    
  END IF; -- c_family_int
  
  --ASSERT FALSE
  --  REPORT "RS memutils : get_memstyle - mem_type = " &
  --         integer_to_string(mem_type) & new_line &
  --         "  style = " & 
  --         integer_to_string(style) & new_line &
  --         "  Depth = " &
  --         integer_to_string(depth) & new_line &
  --         "  Width = " &
  --         integer_to_string(width) & new_line &
  --         "  Size = " &
  --         integer_to_string(mem_size) & new_line &
  --         "  Returning " &
  --         integer_to_string(result) & new_line
  --   SEVERITY NOTE;
             
  RETURN result;
END get_memstyle;
  
  
  
END mem_utils;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/ml_comps.vhd,v 1.2 2011/05/10 11:21:41 billw Exp $
--
--  Title: 	Toolbox library component definitions
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;



--------------------------------------------------------------------------------
package toolbox_comps is

  constant def_mem_regd : boolean := true;
  
  constant mem16allzero : memdatatype(0 to 15) :=
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

  constant mem32allzero : memdatatype(0 to 31) :=
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    
component big_delay
generic (
  c_family          : string;
  c_xdevicefamily   : string;
  instance_name     : string := "";
  c_elaboration_dir : string;
  bus_width         : integer;
  clk_delay         : integer;
  memstyle          : mem_style_type := block_mem;
  init_to_1         : boolean := false;
  c_has_ce          : integer);
port (
  din  : in  std_logic_vector(bus_width-1 downto 0);
  clk  : in  std_logic;
  ce   : in  std_logic;
  dout : out std_logic_vector(bus_width-1 downto 0));
end component; -- big_delay
    
component bram_delay
generic (
  c_family          : string;
  c_xdevicefamily   : string;
  c_elaboration_dir : string;
  bus_width         : integer;
  clk_delay         : integer;
  c_has_ce          : integer);
port (
  din  : in  std_logic_vector(bus_width-1 downto 0);
  clk  : in  std_logic;
  ce   : in  std_logic;
  dout : out std_logic_vector(bus_width-1 downto 0));
end component; -- bram_delay

component lut_delay
  generic ( instance_name   : string := "";
            c_xdevicefamily : string;
            c_ainit_val     : string := "0";
            c_has_sinit     : integer := 0;
            c_has_sset      : integer := 0;
            c_reg_last_bit  : integer := 1;
            bus_width       : integer;
            clk_delay       : integer;
            c_has_ce        : integer );
  port ( din   : in  std_logic_vector(bus_width-1 downto 0);
         clk   : in  std_logic;
         ce    : in  std_logic;
         sset  : in  std_logic := '0';
         sinit : in  std_logic := '0';
         dout  : out std_logic_vector(bus_width-1 downto 0));
end component; -- lut_delay

component rs_ifx_slave
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
    aclken : in std_logic := '1'; --Note that this *only* applies to the ifx_valid, ifx_ready and ifx_data ports
    areset : in std_logic;

    --Interface X slave interface
    ifx_valid : in  std_logic; --True when master is sending data
    ifx_ready : out std_logic; --True when slave is receiving data
    ifx_data  : in  std_logic_vector(WIDTH-1 downto 0); --Data from master (only valied when ifx_valid and ifx_ready asserted)

    --Read interface
    rd_enable : in  std_logic; --True to read data
    rd_avail  : out std_logic; --True when rd_data is available
    rd_valid  : out std_logic; --True when rd_data is available and valid (i.e. has been read)
    rd_data   : out std_logic_vector(WIDTH-1 downto 0); --Read data (only valid when rd_avail asserted)

    --FIFO status
    full       : out std_logic; --FIFO full
    empty      : out std_logic; --FIFO empty
    aempty     : out std_logic; --FIFO almost empty
    not_full   : out std_logic; --FIFO not full (logical inverse of full)
    not_empty  : out std_logic; --FIFO not empty (logical inverse of empty)
    not_aempty : out std_logic; --FIFO not almost empty (logical inverse of aempty)
    wr_enable  : out std_logic; --High when FIFO is being written. Can change when aclken=0.
    add        : out signed(GLB_log2(DEPTH+1)-1 downto 0) --Read address of SRL (this is always FIFO count-1)
    );
end component; -- rs_ifx_slave

component shift_ram_delay 
  generic ( c_xdevicefamily : string;
            instance_name   : string := "";
            c_ainit_val     : string := "0";
            c_has_sinit     : integer := 0;
            c_has_sset      : integer := 0;
            bus_width       : integer;
            addr_width      : integer;
            c_has_addr      : integer;
            c_has_ce        : integer;
            clk_delay       : integer;
            c_reg_last_bit  : integer );
  port ( din   : in  std_logic_vector(bus_width-1 downto 0);
         addr  : in  std_logic_vector(addr_width-1 downto 0);
         clk   : in  std_logic;
         ce    : in  std_logic;
         sset  : in  std_logic := '0';
         sinit : in  std_logic := '0';
         dout  : out std_logic_vector(bus_width-1 downto 0));
end component; -- shift_ram_delay

component gate_and
  generic( width       : integer range 1 to 31 := 2;
           mask        : integer       := 0;
           invout      : boolean       := false;
           q_mode      : mem_q_type    := no_reg;
           c_has_r     : boolean       := false);
  port(inp     : in  std_logic_vector(width-1 downto 0);
       r       : in  std_logic := '0'; -- optional pin to zero output
       c       : in  std_logic := '0'; -- register pins are optional
       ce      : in  std_logic := '1';
       reset   : in  std_logic := '0';
       o       : out std_logic;
       o_reg   : out std_logic);
end component; -- gate_and

component rs_compare
generic (
  c_family      : string;
  instance_name : string := "";
  c_width       : integer;
  c_b_constant  : integer := 0;
  c_b_value     : string := "0";
  c_has_a_eq_b  : integer := 0;
  c_has_a_ne_b  : integer := 0;
  c_has_a_lt_b  : integer := 0;
  c_has_a_gt_b  : integer := 0;
  c_has_a_le_b  : integer := 0;
  c_has_a_ge_b  : integer := 0;
  c_has_qa_eq_b : integer := 0;
  c_has_qa_ne_b : integer := 0;
  c_has_qa_lt_b : integer := 0;
  c_has_qa_gt_b : integer := 0;
  c_has_qa_le_b : integer := 0;
  c_has_qa_ge_b : integer := 0;
  c_has_ce      : integer := 0;
  c_has_aclr    : integer := 0;
  c_has_sclr    : integer := 0; 
  c_sync_enable : integer := c_override); 
port (
  a       : in  std_logic_vector(c_width-1 downto 0);
  b       : in  std_logic_vector(c_width-1 downto 0);
  aclr    : in  std_logic := '0';
  ce      : in  std_logic := '1';
  sclr    : in  std_logic := '0';
  clk     : in  std_logic := '0';
  a_eq_b  : out std_logic;
  a_ne_b  : out std_logic;
  a_lt_b  : out std_logic;
  a_gt_b  : out std_logic;
  a_le_b  : out std_logic;
  a_ge_b  : out std_logic;
  qa_eq_b : out std_logic;
  qa_ne_b : out std_logic;
  qa_lt_b : out std_logic;
  qa_gt_b : out std_logic;
  qa_le_b : out std_logic;
  qa_ge_b : out std_logic);
end component; -- rs_compare

component rs_compare_ge_var
generic (
  c_family       : string;
  c_width        : integer;           
  c_enable_rlocs : integer := 0); 
port (
  a       : in  std_logic_vector(c_width-1 downto 0);
  b       : in  std_logic_vector(c_width-1 downto 0);
  a_ge_b  : out std_logic);
end component; -- rs_compare_ge_var

component gate_xor
  generic( width       : integer range 1 to 4096 := 2;
           invout      : boolean                 := false;
           q_mode      : mem_q_type              := no_reg );
  port(inp     : in  std_logic_vector(width-1 downto 0);
       c       : in  std_logic := '0'; -- register pins are optional
       ce      : in  std_logic := '1';
       reset   : in  std_logic := '0';
       o       : out std_logic;
       o_reg   : out std_logic);
end component; -- gate_xor

component rs_adder2 is
generic (
  c_width           : integer;            
  c_out_width       : integer;
  c_has_s           : integer := 0;
  c_has_q           : integer := 1;
  c_has_ce          : integer := 0;
  c_has_aclr        : integer := 0
  ); 
port (
  a0       : in  std_logic_vector(c_width-1 downto 0);
  a1       : in  std_logic_vector(c_width-1 downto 0);
  b        : in  std_logic_vector(c_width-1 downto 0);
  clk      : in  std_logic := '0'; -- clock
  ce       : in  std_logic := '1'; -- clock enable
  aclr     : in  std_logic := '0'; -- asynch init
  a_sel    : in  std_logic;
  s        : out std_logic_vector(c_out_width-1 downto 0); -- asynch output
  q        : out std_logic_vector(c_out_width-1 downto 0)); -- synch output
end component; -- rs_adder2

component rs_addsub
generic (
  c_xdevicefamily   : string;
  instance_name     : string := "";            
  c_a_width         : integer;            
  c_b_width         : integer;            
  c_out_width       : integer;
  c_add_mode        : integer := c_add; 
  c_a_type          : integer := c_unsigned; 
  c_b_type          : integer := c_unsigned; 
  c_b_constant      : integer := 0;             
  c_b_value         : string  := "0"; 
  c_ainit_val       : string  := "0"; 
  c_sinit_val       : string  := "0"; 
  c_bypass_enable   : integer := c_no_override;   
  c_bypass_low      : integer := 0; 
  c_sync_enable     : integer := c_override;      
  c_sync_priority   : integer := c_clear;     
  c_latency         : integer := 1;
  c_has_c_in        : integer := 0;
  c_has_c_out       : integer := 0;
  c_has_ce          : integer := 0;
  c_has_bypass      : integer := 0;
  c_has_sclr        : integer := 0;
  c_has_sset        : integer := 0;
  c_has_sinit       : integer := 0
  ); 
port (
  a        : in  std_logic_vector(c_a_width-1 downto 0); -- input value
  b        : in  std_logic_vector(c_b_width-1 downto 0); -- input value
  clk      : in  std_logic := '0'; -- clock
  add      : in  std_logic := '1'; -- when addsub mode 1=add, 0=subtract
  c_in     : in  std_logic := '0'; -- carry in
  b_in     : in  std_logic := '1'; -- borrow in
  ce       : in  std_logic := '1'; -- clock enable
  bypass   : in  std_logic := '0'; -- sync load of b into reg
  sclr     : in  std_logic := '0'; -- synch init
  sset     : in  std_logic := '0'; -- synch set
  sinit    : in  std_logic := '0'; -- synch init
  c_out    : out std_logic;
  s        : out std_logic_vector(c_out_width-1 downto 0));
end component; -- rs_addsub

component rs_block_mem
generic (
  c_family           : string;
  c_xdevicefamily    : string;
  c_elaboration_dir  : string;
  c_addr_width       : integer; -- assume both ports have same address width
  c_depth            : integer; -- assume both ports are same depth
  c_has_douta        : integer;
  c_has_doutb        : integer;
--  c_has_ena          : integer;
--  c_has_enb          : integer;
--  c_has_wea          : integer;
--  c_has_web          : integer;
--  c_has_sclr         : integer; -- assume both ports have same optional sclr
--  c_has_default_data : integer;
--  c_default_data     : string := "0";
  c_mem_init_file    : string := "no_coe_file_loaded"; 
  c_load_init_file   : integer;
  c_width            : integer;
  c_mem_type         : integer);
--  c_has_mux_reg      : integer; -- reg on output of ram muxs
--  c_has_mem_reg      : integer); -- reg on output of mem primitives
port (
  addra : in  std_logic_vector(c_addr_width-1 downto 0);
  addrb : in  std_logic_vector(c_addr_width-1 downto 0);
  dina  : in  std_logic_vector(c_width-1 downto 0);
  dinb  : in  std_logic_vector(c_width-1 downto 0);
  wea   : in  std_logic := '0';
--  web   : in  std_logic := '0';
  ena   : in  std_logic := '1';
  enb   : in  std_logic := '1';
  clk   : in  std_logic := '0'; -- common clock
  douta : out std_logic_vector(c_width-1 downto 0);
  doutb : out std_logic_vector(c_width-1 downto 0)); 
end component; -- rs_block_mem

component rs_compare_eq_var
generic (
  c_family       : string;
  c_width        : integer;           
  c_enable_rlocs : integer := 0); 
port (
  a      : in std_logic_vector(c_width-1 downto 0);
  b      : in std_logic_vector(c_width-1 downto 0);
  a_eq_b : out std_logic);
end component; -- rs_compare_eq_var

component rs_compare_gt_var
generic (
  c_family       : string;
  c_width        : integer); 
port (
  a      : in std_logic_vector(c_width-1 downto 0);
  b      : in std_logic_vector(c_width-1 downto 0);
  a_gt_b : out std_logic);
end component; -- rs_compare_gt_var

component rs_compare_lt
generic (
  c_family     : string;
  c_width      : integer; 
  c_b_value    : string;
  c_has_a_lt_b : integer := 0;
  c_has_ce     : integer := 0;
  c_has_aclr   : integer := 0;
  c_has_sclr   : integer := 0); 
port (
  a       : in  std_logic_vector(c_width-1 downto 0);
  aclr    : in  std_logic := '0';
  ce      : in  std_logic := '1';
  sclr    : in  std_logic := '0';
  clk     : in  std_logic;
  a_lt_b  : out std_logic;
  qa_lt_b : out std_logic);
end component; -- rs_compare_lt

component rs_counter
  generic (
    c_xdevicefamily  : string;
    c_width          : integer;
    use_count_to     : boolean;
    count_to         : integer;
    ainit_val        : integer := 0;
    sinit_val        : integer := 0;
    c_count_mode     : integer;
    c_has_load       : integer := 0;
    c_has_ce         : integer;
    c_has_sclr       : integer := 0;
    c_has_sset       : integer := 0;
    c_has_sinit      : integer := 0;
    c_sync_enable    : integer;
    c_has_thresh0    : integer := 0);
   port (
     clk      : in  std_logic;
     ce       : in  std_logic;
     load     : in  std_logic := '0'; -- optional sync load trigger
     l        : in  std_logic_vector(c_width-1 downto 0) := (others=>'0');
     up       : in  std_logic;
     sclr     : in  std_logic := '0'; 
     sset     : in  std_logic := '0'; 
     sinit    : in  std_logic := '0'; 
     thresh0  : out std_logic;
     q        : out std_logic_vector(c_width-1 downto 0) );
end component; -- rs_counter

component rs_distributed_mem
generic (
  c_elaboration_dir  : string;
  c_addr_width       : integer; -- assume both ports have same address width
  c_depth            : integer; -- assume both ports are same depth
  c_has_spo          : integer;
  c_has_qspo         : integer;
  c_has_dpo          : integer;
  c_has_qdpo         : integer;
  c_mem_init_file    : string := "no_coe_file_loaded"; 
  c_load_init_file   : integer;
  c_width            : integer;
  c_mem_type         : integer); -- valid types defined in bip_utils_pkg (c_rom, c_sp_ram, c_dp_ram)
port (
  addra : in  std_logic_vector(c_addr_width-1 downto 0);
  addrb : in  std_logic_vector(c_addr_width-1 downto 0);
  din   : in  std_logic_vector(c_width-1 downto 0);
  we    : in  std_logic := '0'; -- write enable, not affected by en
  en    : in  std_logic := '1'; -- clock enable for registered outputs
  clk   : in  std_logic := '0'; -- common clock
  spo   : out std_logic_vector(c_width-1 downto 0);
  qspo  : out std_logic_vector(c_width-1 downto 0);
  dpo   : out std_logic_vector(c_width-1 downto 0);
  qdpo  : out std_logic_vector(c_width-1 downto 0));
end component; -- rs_distributed_mem

component rs_dp_block_mem
generic (
  c_family           : string;
  c_xdevicefamily    : string;
  c_elaboration_dir  : string;
  c_addr_width       : integer; -- assume both ports have same address width
  c_depth            : integer; -- assume both ports are same depth
  c_has_douta        : integer;
  c_has_doutb        : integer;
  c_has_ena          : integer;
  c_has_enb          : integer;
  c_has_wea          : integer;
  c_has_web          : integer;
  c_has_sclr         : integer; -- assume both ports have same optional sclr
  c_has_default_data : integer;
  c_default_data     : string := "0";
  c_mem_init_file    : string := "no_coe_file_loaded"; 
  c_load_init_file   : integer;
  c_width            : integer;
  c_mem_type         : integer; -- 2 = full dual port
  c_has_mux_reg      : integer; -- reg on output of ram muxs
  c_has_mem_reg      : integer); -- reg on output of mem primitives
port (
  addra : in  std_logic_vector(c_addr_width-1 downto 0);
  addrb : in  std_logic_vector(c_addr_width-1 downto 0);
  dina  : in  std_logic_vector(c_width-1 downto 0);
  dinb  : in  std_logic_vector(c_width-1 downto 0);
  wea   : in  std_logic := '0';
  web   : in  std_logic := '0';
  ena   : in  std_logic := '1';
  enb   : in  std_logic := '1';
  clk   : in  std_logic := '0'; -- common clock
  sclr  : in  std_logic := '0'; -- common sclr
  douta : out std_logic_vector(c_width-1 downto 0);
  doutb : out std_logic_vector(c_width-1 downto 0)); 
end component; -- rs_dp_block_mem

component rs_mem
generic (
  c_family             : string;
  c_xdevicefamily      : string;
  c_elaboration_dir    : string;
  c_memstyle           : integer;
  c_addr_width         : integer;
  c_depth              : integer;
  c_width              : integer;
  c_has_dout_a         : integer;
  c_has_dout_b         : integer;
  c_has_en             : integer := 0;
  c_has_we             : integer := 1;
  c_mem_init_file      : string  := "null.mif";
  c_mem_type           : integer := c_sp_ram;
  c_read_mif           : integer := 0
  );
port (
  addra    : in  std_logic_vector(c_addr_width-1 downto 0);
  addrb    : in  std_logic_vector(c_addr_width-1 downto 0);
  d        : in  std_logic_vector(c_width-1 downto 0);
  clk      : in  std_logic;
  en       : in  std_logic;
  we       : in  std_logic;
  dout_a   : out std_logic_vector(c_width-1 downto 0);
  dout_b   : out std_logic_vector(c_width-1 downto 0)
  );
end component; -- rs_mem

component rs_reg
  generic (
    c_width        : integer;
    ainit_val      : string := "0";
    c_has_ce       : integer;
    c_has_aclr     : integer := 0;
    c_has_aset     : integer := 0;
    c_has_sclr     : integer := 0;
    c_has_sset     : integer := 0;
    c_sync_enable  : integer := c_override;
    c_enable_rlocs : integer := 0
    ); 
  port(
    d     : in  std_logic_vector(c_width-1 downto 0);
    clk   : in  std_logic := '0';
    ce    : in  std_logic := '1';
    aclr  : in  std_logic := '0';
    aset  : in  std_logic := '0';
    sclr  : in  std_logic := '0';
    sset  : in  std_logic := '0';
    q     : out std_logic_vector(c_width-1 downto 0)
  ); 
end component; -- rs_reg

component rs_reg_ainit
  generic (
    c_width                : integer := 16;
    c_ainit_val            : string  := "";
    c_sinit_val            : string  := "";
    c_sync_priority        : integer := c_clear;
    c_sync_enable          : integer := c_override;
    c_has_ce               : integer := 0;
    c_has_aclr             : integer := 0;
    c_has_aset             : integer := 0;
    c_has_ainit            : integer := 0;
    c_has_sclr             : integer := 0;
    c_has_sset             : integer := 0;
    c_has_sinit            : integer := 0;
    c_enable_rlocs         : integer := 0
  ); 
  port (
    d     : in std_logic_vector(c_width-1 downto 0); -- input value
    clk   : in std_logic; -- clock
    ce    : in std_logic := '1'; -- clock enable
    aclr  : in std_logic := '0'; -- asynch clear.
    aset  : in std_logic := '0'; -- asynch set.
    ainit : in std_logic := '0'; -- asynch init.
    sclr  : in std_logic := '0'; -- synch clear.
    sset  : in std_logic := '0'; -- synch set.
    sinit : in std_logic := '0'; -- synch init.
    q     : out std_logic_vector(c_width-1 downto 0)); -- output value
end component; -- rs_reg_ainit

component rs_reg_bit
  generic (
    c_has_ce       : integer := 1;
    c_ainit_val    : string  := "0";
    c_has_aclr     : integer := 0;
    c_has_aset     : integer := 0;
    c_has_sclr     : integer := 0;
    c_has_sset     : integer := 0;
    c_sync_enable  : integer := c_override;
    c_enable_rlocs : integer := 0 
    ); 
  port(
    d     : in  std_logic;
    clk   : in  std_logic := '0';
    ce    : in  std_logic := '1';
    aclr  : in  std_logic := '0';
    aset  : in  std_logic := '0';
    sclr  : in  std_logic := '0';
    sset  : in  std_logic := '0';
    q     : out std_logic
  ); 
end component; --rs_reg_bit;

component rs_reg_bit_ainit
  generic (
    c_has_ce       : integer;
    c_has_aclr     : integer := 0;
    c_has_sclr     : integer := 0;
    c_has_ainit    : integer;
    ainit_val	   : string(1 to 1);
    c_sync_enable  : integer := c_override;
    c_enable_rlocs : integer := 0
    ); 
  port(
    d     : in  std_logic;
    clk   : in  std_logic := '0';
    ce    : in  std_logic := '1';
    aclr  : in  std_logic := '0';
    sclr  : in  std_logic := '0';
    q     : out std_logic
  ); 
end component; --rs_reg_bit_ainit;

component rs_sp_block_mem
generic (
  c_family           : string;
  c_addr_width       : integer;
  c_depth            : integer;
  c_has_en           : integer;
  c_has_we           : integer;
  c_has_sclr         : integer;
  c_has_default_data : integer;
  c_mem_init_file    : string; -- ignored if c_has_default_data = 1
  c_width            : integer);
port (
  addr : in  std_logic_vector(c_addr_width-1 downto 0);
  din  : in  std_logic_vector(c_width-1 downto 0);
  we   : in  std_logic := '0';
  en   : in  std_logic := '1';
  clk  : in  std_logic := '0';
  sclr : in  std_logic := '0';
  dout : out std_logic_vector(c_width-1 downto 0)); 
end component; -- rs_sp_block_mem

component rs_sync_fifo
  generic (
     c_family          : string;
     c_xdevicefamily   : string;
     c_elaboration_dir : string;
     c_init_to_1       : integer := 0;
     c_memory_type     : integer;             
     c_width           : integer;
     c_depth           : integer;
     c_has_aclr        : integer := 0;
     c_has_sclr        : integer
  );
  port (
    clk   : in std_logic;  
    aclr  : in std_logic := '0';   
    sclr  : in std_logic;   
    din   : in std_logic_vector(c_width-1 downto 0);
    wr_en : in std_logic; 
    rd_en : in std_logic; 
    dout  : out std_logic_vector(c_width-1 downto 0)
  );
end component; -- rs_sync_fifo

component syncmem
  generic (
    width             : integer;
    reqd_depth        : integer;
    memstyle          : mem_style_type;
    c_has_ce          : integer;
    c_has_we          : integer;
    init_file         : string          := "null.mif";
    q_mode            : mem_q_type      := def_mem_q_type;
    debug_string      : string          := "dummy string";
    c_elaboration_dir : string;
    c_xdevicefamily   : string;
    c_family          : string);
  port (
    a     : in  std_logic_vector(bitsneededtorepresent(reqd_depth-1)-1 downto 0);
    d     : in  std_logic_vector(width-1 downto 0);
    we    : in  std_logic;
    c     : in  std_logic;
    ce    : in  std_logic;
    q     : out std_logic_vector(width-1 downto 0);
    q_reg : out std_logic_vector(width-1 downto 0) );
end component; -- syncmem

component dp_syncmem
  generic (
    width              : integer;
    reqd_depth         : integer;
    c_has_ce           : integer;
    c_has_we           : integer;
    init_file          : string         := "null.mif";
    debug_string       : string         := "dummy string";
    c_elaboration_dir  : string;
    c_family           : string );
  port (
    rd_addr  : in  std_logic_vector(bitsneededtorepresent(reqd_depth-1)-1 downto 0);
    wr_addr  : in  std_logic_vector(bitsneededtorepresent(reqd_depth-1)-1 downto 0);
    d        : in  std_logic_vector(width-1 downto 0);
    we       : in  std_logic;
    clk      : in  std_logic;
    ce       : in  std_logic;
    q        : out std_logic_vector(width-1 downto 0);
    q_reg    : out std_logic_vector(width-1 downto 0) );
end component; -- dp_syncmem;



end toolbox_comps;








--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/xorgate.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--------------------------------------------------------------------------------
--
--  Description: Variable width XOR gate with configurable registered
--               or unregistered outputs.
--
--  Author: Bill Wilkie
--
--------------------------------------------------------------------------------
--
--
--------------------------------------------------------------------------------
--
-- General purpose XOR gate
--
-- Builds a tall xor gate
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.fdce;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

ENTITY gate_xor IS
  GENERIC( width       : INTEGER RANGE 1 TO 4096 := 2;
           invout      : BOOLEAN                 := FALSE;
           q_mode      : mem_q_type              := no_reg
         );
  PORT(inp     : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
       c       : IN  STD_LOGIC := '0'; -- Register pins are optional
       ce      : IN  STD_LOGIC := '1';
       reset   : IN  STD_LOGIC := '0';
       o       : OUT STD_LOGIC;
       o_reg   : OUT STD_LOGIC);
END gate_xor;

ARCHITECTURE synth OF gate_xor IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

BEGIN
  ------------------------------------------------------------------------------
  -- Degenerate case
  z : IF width = 0 GENERATE
    o     <= '0';
    o_reg <= '0';
  END GENERATE; -- z
  
  -- XOR all bits of inp bus together
  nz : IF width /= 0 GENERATE
    SIGNAL o_tmp : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => '0');
    SIGNAL xor_out : STD_LOGIC := '0';
  BEGIN
  
    xg1 : IF width = 1 GENERATE
      o_tmp(0) <= inp(0);
    END GENERATE; -- xg1
  
    xg2 : IF width > 1 GENERATE
    
      o_tmp(0) <= inp(0);
      
      xg3 : FOR i IN 1 TO width-1 GENERATE
        o_tmp(i) <= inp(i) XOR o_tmp(i-1);
      END GENERATE; -- xg3
      
    END GENERATE; -- xg2
   
   
    -- Optional inverter on output
    xg4 : IF NOT(invout) GENERATE
      xor_out <= o_tmp(width-1);
    END GENERATE; -- xg4
    
    xg5 : IF invout GENERATE
      xor_out <= NOT(o_tmp(width-1));
    END GENERATE; -- xg5
    
    
    ----------------------------------------------------------------------------
    -- Optional registered output
    nr : IF q_mode = no_reg GENERATE
      o     <= xor_out;
      o_reg <= xor_out;
    END GENERATE; -- nr

    rnr : IF q_mode = reg_and_no_reg GENERATE
    
--      ff0 : fdce
--      PORT MAP(d=>xor_out, ce=>ce, c=>c, clr=>reset, q=>o_reg);

      process(c)
      begin
        if rising_edge(c) then
          if (ce = '1') then
            o_reg <= xor_out;
          end if; -- ce
          if(reset = '1') then
            o_reg <= '0';
          end if;
        end if; -- rising_edge(aclk)
      end process;

      o <= xor_out;
    END GENERATE; -- rnr
          
    r : IF q_mode = reg GENERATE
      SIGNAL reg_out : STD_LOGIC := '0';
    BEGIN
--      ff0 : fdce
--      PORT MAP(d=>xor_out, ce=>ce, c=>c, clr=>reset, q=>reg_out);

      process(c)
      begin
        if rising_edge(c) then
          if (ce = '1') then
            reg_out <= xor_out;
          end if; -- ce
          if(reset = '1') then
            reg_out <= '0';
          end if;
        end if; -- rising_edge(aclk)
      end process;
        
      o     <= reg_out;
      o_reg <= reg_out;
    END GENERATE; -- r
  
    
  END GENERATE; -- nz
  
      
  
END synth; -- gate_xor








--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_reg.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--------------------------------------------------------------------------------
-- Unit     : rs_reg
-- Author   : Bill Wilkie
-- Function : Register for RS cores
--------------------------------------------------------------------------------
-- Description
-- ===========
-- This module is a wrapper to simplify instantiation of the baseblox c_reg_fd
-- component.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;


ENTITY rs_reg IS
  GENERIC (
    c_width        : INTEGER;
    --ainit_val      : CHARACTER; -- XCC cannot handle this
    ainit_val      : STRING := "0"; -- Single char
    c_has_ce       : INTEGER;
    c_has_aclr     : INTEGER := 0;
    c_has_aset     : INTEGER := 0;
    c_has_sclr     : INTEGER := 0;
    c_has_sset     : INTEGER := 0;
    c_sync_enable  : INTEGER := c_override;
    c_enable_rlocs : INTEGER := 0
    ); 
  PORT(
    d     : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    clk   : IN  STD_LOGIC := '0';
    ce    : IN  STD_LOGIC := '1';
    aclr  : IN  STD_LOGIC := '0';
    aset  : IN  STD_LOGIC := '0';
    sclr  : IN  STD_LOGIC := '0';
    sset  : IN  STD_LOGIC := '0';
    q     : OUT STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)
  ); 
END rs_reg;


ARCHITECTURE synth OF rs_reg IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT init_bus : STRING(1 TO c_width) := (OTHERS => ainit_val(1));
  
  CONSTANT max_reg_width  : INTEGER := 256; -- Baseblox limitation
  CONSTANT number_of_regs : INTEGER := 1 + ((c_width-1)/max_reg_width);
  
  CONSTANT last_reg_width : INTEGER :=
                                 c_width - ((number_of_regs-1) * max_reg_width);
  
BEGIN
  
  r1g: FOR reg_num IN 1 TO number_of_regs GENERATE
    CONSTANT last_reg : BOOLEAN := reg_num = number_of_regs;
    
    CONSTANT reg_width : INTEGER :=
                        select_val_b(max_reg_width, last_reg_width, (last_reg));
                            
    CONSTANT reg_lsb : INTEGER := (reg_num-1) * max_reg_width;
    CONSTANT reg_msb : INTEGER := reg_lsb + reg_width - 1;
  BEGIN
  
    bbr : c_reg_fd_v12_0_3_viv
    GENERIC MAP (
      c_width          => reg_width,
      c_ainit_val      => init_bus,
      c_sinit_val      => "0",
      c_sync_priority  => c_clear,
      c_sync_enable    => c_sync_enable,
      c_has_ce         => c_has_ce,
      c_has_aclr       => c_has_aclr,
      c_has_aset       => c_has_aset,
      c_has_ainit      => 0,
      c_has_sclr       => c_has_sclr,
      c_has_sset       => c_has_sset,
      c_has_sinit      => 0,
      c_enable_rlocs   => c_enable_rlocs
      ) 
    PORT MAP(
      d     => d(reg_msb DOWNTO reg_lsb),
      clk   => clk,
      ce    => ce,
      aclr  => aclr,
      aset  => aset,
      ainit => '0',
      sclr  => sclr,
      sset  => sset,
      sinit => '0',
      q     => q(reg_msb DOWNTO reg_lsb)
    ); 
      
  END GENERATE; -- r1g

END synth;


-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_reg_ainit.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
-- Filename - rs_reg_ainit.vhd
-- Author Bill Wilkie
--
-- Description - This file contains a wrapper for c_reg_fd_v*_*
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;


ENTITY rs_reg_ainit IS
  GENERIC (
    c_width                : INTEGER := 16;
    c_ainit_val            : STRING  := "";
    c_sinit_val            : STRING  := "";
    c_sync_priority        : INTEGER := c_clear;
    c_sync_enable          : INTEGER := c_override;
    c_has_ce               : INTEGER := 0;
    c_has_aclr             : INTEGER := 0;
    c_has_aset             : INTEGER := 0;
    c_has_ainit            : INTEGER := 0;
    c_has_sclr             : INTEGER := 0;
    c_has_sset             : INTEGER := 0;
    c_has_sinit            : INTEGER := 0;
    c_enable_rlocs         : INTEGER := 0
  ); 
  PORT (
    d     : IN STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (others => '0'); -- input value
    clk   : IN STD_LOGIC := '0'; -- clock
    ce    : IN STD_LOGIC := '1'; -- clock enable
    aclr  : IN STD_LOGIC := '0'; -- asynch clear.
    aset  : IN STD_LOGIC := '0'; -- asynch set.
    ainit : IN STD_LOGIC := '0'; -- asynch init.
    sclr  : IN STD_LOGIC := '0'; -- synch clear.
    sset  : IN STD_LOGIC := '0'; -- synch set.
    sinit : IN STD_LOGIC := '0'; -- synch init.
    q     : OUT STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)); -- output value
END rs_reg_ainit;

ARCHITECTURE synth OF rs_reg_ainit IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

BEGIN  
  
  fd : c_reg_fd_v12_0_3_viv
  GENERIC MAP(
    c_enable_rlocs  => c_enable_rlocs,
    c_width         => c_width,
    c_ainit_val     => c_ainit_val,
    c_sinit_val     => c_sinit_val,
    c_sync_priority => c_sync_priority,
    c_sync_enable   => c_sync_enable,
    c_has_ce        => c_has_ce,
    c_has_aclr      => c_has_aclr,
    c_has_aset      => c_has_aset,
    c_has_ainit     => c_has_ainit,
    c_has_sclr      => c_has_sclr,
    c_has_sset      => c_has_sset,
    c_has_sinit     => c_has_sinit)
  PORT MAP(
    d     => d,
    q     => q,
    clk   => clk,
    ce    => ce,
    aclr  => aclr,
    aset  => aset,
    ainit => ainit,
    sclr  => sclr,
    sset  => sset,
    sinit => sinit);  
    
END synth;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_reg_bit.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--------------------------------------------------------------------------------
-- Unit     : rs_reg_bit
-- Author   : Bill Wilkie
-- Function : Single bit register for RS cores
--------------------------------------------------------------------------------
-- Description
-- ===========
-- This module is a wrapper to simplify instantiation of the baseblox c_reg_fd
-- component.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;


ENTITY rs_reg_bit IS
  GENERIC (
    c_has_ce       : INTEGER := 1;
    c_ainit_val    : STRING  := "0";
    c_has_aclr     : INTEGER := 0;
    c_has_aset     : INTEGER := 0;
    c_has_sclr     : INTEGER := 0;
    c_has_sset     : INTEGER := 0;
    c_sync_enable  : INTEGER := c_override;
    c_enable_rlocs : INTEGER := 0 
    ); 
  PORT(
    d     : IN  STD_LOGIC;
    clk   : IN  STD_LOGIC := '0';
    ce    : IN  STD_LOGIC := '1';
    aclr  : IN  STD_LOGIC := '0';
    aset  : IN  STD_LOGIC := '0';
    sclr  : IN  STD_LOGIC := '0';
    sset  : IN  STD_LOGIC := '0';
    q     : OUT STD_LOGIC
  ); 
END rs_reg_bit;


ARCHITECTURE synth OF rs_reg_bit IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

   
  SIGNAL d_vec: STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
  SIGNAL q_vec: STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
BEGIN
  
  -- Dummy link to change format to STD_LOGIC_VECTORs
  d_vec(0) <= d;
  q        <= q_vec(0);
  
  bbr : c_reg_fd_v12_0_3_viv
  GENERIC MAP (
    c_width          => 1,
    c_ainit_val      => c_ainit_val,
    c_sinit_val      => "0",
    c_sync_priority  => c_clear,
    c_sync_enable    => c_sync_enable,
    c_has_ce         => c_has_ce,
    c_has_aclr       => c_has_aclr,
    c_has_aset       => c_has_aset,
    c_has_ainit      => 0,
    c_has_sclr       => c_has_sclr,
    c_has_sset       => c_has_sset,
    c_has_sinit      => 0,
    c_enable_rlocs   => c_enable_rlocs
    ) 
  PORT MAP(
    d     => d_vec,
    clk   => clk,
    ce    => ce,
    aclr  => aclr,
    aset  => aset,
    ainit => '0',
    sclr  => sclr,
    sset  => sset,
    sinit => '0',
    q     => q_vec
  ); 
      

END synth;




--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_reg_bit_ainit.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Unit     : rs_reg_bit_ainit
-- Author   : Bill Wilkie
-- Function : Single bit register for RS cores with ainit value
--------------------------------------------------------------------------------
-- Description
-- ===========
-- This module is a wrapper to simplify instantiation of the baseblox c_reg_fd
-- component.
--------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;



ENTITY rs_reg_bit_ainit IS
  GENERIC (
    c_has_ce       : INTEGER;
    c_has_aclr     : INTEGER;
    c_has_sclr     : INTEGER;
    c_has_ainit    : INTEGER;
    ainit_val	   : STRING(1 TO 1);
    c_sync_enable  : INTEGER;
    c_enable_rlocs : INTEGER 
    ); 
  PORT(
    d     : IN  STD_LOGIC;
    clk   : IN  STD_LOGIC := '0';
    ce    : IN  STD_LOGIC := '1';
    aclr  : IN  STD_LOGIC := '0';
    sclr  : IN  STD_LOGIC := '0';
    q     : OUT STD_LOGIC
  ); 
END rs_reg_bit_ainit;


ARCHITECTURE synth OF rs_reg_bit_ainit IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

   
  SIGNAL d_vec: STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
  SIGNAL q_vec: STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
BEGIN
  
  -- dummy link to change format to STD_LOGIC_VECTORS
  d_vec(0) <= d;
  q        <= q_vec(0);
  
  bbr : c_reg_fd_v12_0_3_viv
  GENERIC MAP (
    c_width          => 1,
    c_ainit_val      => ainit_val,
    c_sinit_val      => "0",
    c_sync_priority  => c_clear,
    c_sync_enable    => c_sync_enable,
    c_has_ce         => c_has_ce,
    c_has_aclr       => c_has_aclr,
    c_has_aset       => 0,
    c_has_ainit      => c_has_ainit,
    c_has_sclr       => c_has_sclr,
    c_has_sset       => 0,
    c_has_sinit      => 0,
    c_enable_rlocs   => c_enable_rlocs
    ) 
  PORT MAP(
    d     => d_vec,
    clk   => clk,
    ce    => ce,
    aclr  => aclr,
    aset  => '0',
    ainit => '0',
    sclr  => sclr,
    sset  => '0',
    sinit => '0',
    q     => q_vec
  ); 
      

END synth;




--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/andgate.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--  Description: Variable width AND gate with configurable registered
--               or unregistered outputs.
--
--  Author: Bill Wilkie
--
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
--
-- General purpose AND gate
--
-- Width is restricted to 30 but 31 would be ok if there was no r input.
-- Uses carry mux chain to form a wide gate.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

ENTITY gate_and IS
  GENERIC( width       : INTEGER RANGE 1 TO 31 := 2;
           mask        : INTEGER     := 0;
           invout      : BOOLEAN     := FALSE;
           q_mode      : mem_q_type  := no_reg;
           c_has_r     : BOOLEAN     := FALSE);
  PORT(inp   : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
       r     : IN  STD_LOGIC := '0'; -- Optional pin to zero output
       c     : IN  STD_LOGIC := '0'; -- Register pins are optional
       ce    : IN  STD_LOGIC := '1';
       reset : IN  STD_LOGIC := '0';
       o     : OUT STD_LOGIC;
       o_reg : OUT STD_LOGIC);
END gate_and;

ARCHITECTURE synth OF gate_and IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT c_has_r_int : INTEGER := bool_to_int(c_has_r);
  
  SIGNAL int_o : STD_LOGIC := '0';
  
BEGIN
  ------------------------------------------------------------------------------
  -- Degenerate case
  z : IF width = 0 GENERATE
    int_o <= '0';
  END GENERATE; -- z
      
      
  ------------------------------------------------------------------------------
  n_z : IF width /= 0 GENERATE
    SIGNAL o_tmp : STD_LOGIC := '0'; 
  BEGIN
   
    -- RTL version
    o_tmp <= '1' WHEN inp = int_2_std_logic_vector(mask, width) ELSE '0';
   
   og1a : IF c_has_r GENERATE
      og1 : IF NOT(invout) GENERATE
        int_o <= o_tmp AND NOT(r);
      END GENERATE; -- og1
   
      og2 : IF invout GENERATE
        int_o <= NOT(o_tmp) AND NOT(r);
      END GENERATE; -- og2
    END GENERATE; -- og1a
    
    
   og2a : IF NOT(c_has_r) GENERATE
      og1 : IF NOT(invout) GENERATE
        int_o <= o_tmp;
      END GENERATE; -- og1
   
      og2 : IF invout GENERATE
        int_o <= NOT(o_tmp);
      END GENERATE; -- og2
    END GENERATE; -- og2a
    
  END GENERATE; -- n_z
  
  
  
  ------------------------------------------------------------------------------
  -- Optional registered output
  nr : IF q_mode = no_reg GENERATE
    o     <= int_o;
    o_reg <= int_o;
  END GENERATE; -- no_reg
  
  ranr : IF q_mode = reg_and_no_reg GENERATE
      
    ff : rs_reg_bit
    GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
    PORT MAP (d=>int_o, clk=>c, ce=>ce, aclr=>reset, q=>o_reg);
           
    o <= int_o;
  END GENERATE; -- reg_and_no_reg                
  
  rg : IF q_mode = reg GENERATE
    SIGNAL reg_out : STD_LOGIC := '0';
  BEGIN
  
    ff : rs_reg_bit
    GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
    PORT MAP (d=>int_o, clk=>c, ce=>ce, aclr=>reset, q=>reg_out);
           
    o     <= reg_out;
    o_reg <= reg_out;
  END GENERATE; -- rg
  
  
END synth; -- gate_and







--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_counter.vhd,v 1.2 2011/04/11 15:41:16 billw Exp $
--------------------------------------------------------------------------------
-- Unit     : rs_counter
-- Author   : Bill Wilkie
-- Function : Counter
--------------------------------------------------------------------------------
-- Description
-- ===========
-- Wrapper for baseblox binary counter.
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY c_counter_binary_v12_0_10;
USE c_counter_binary_v12_0_10.c_counter_binary_v12_0_10_viv_comp.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.ul_utils.ALL;


ENTITY rs_counter IS
  GENERIC (
    c_xdevicefamily  : STRING;
    c_width          : INTEGER;
    use_count_to     : BOOLEAN;
    count_to         : INTEGER;
    ainit_val        : INTEGER := 0;
    sinit_val        : INTEGER := 0;
    c_count_mode     : INTEGER;
    c_has_load       : INTEGER := 0;
    c_has_ce         : INTEGER;
    c_has_sclr       : INTEGER := 0;
    c_has_sset       : INTEGER := 0;
    c_has_sinit      : INTEGER := 0;
    c_sync_enable    : INTEGER;
    c_has_thresh0    : INTEGER := 0);
   PORT (
     clk      : IN  STD_LOGIC;
     ce       : IN  STD_LOGIC;
     load     : IN  STD_LOGIC := '0'; -- optional sync load trigger
     l        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS=>'0');
     up       : IN  STD_LOGIC := '0';
     sclr     : IN  STD_LOGIC := '0'; 
     sset     : IN  STD_LOGIC := '0'; 
     sinit    : IN  STD_LOGIC := '0'; 
     thresh0  : OUT STD_LOGIC;
     q        : OUT STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) );
END rs_counter;


ARCHITECTURE synth OF rs_counter IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  CONSTANT ce_overrides_sync : INTEGER := BOOLEAN'POS(c_sync_enable = c_no_override);

  CONSTANT count_by_str : STRING(1 TO c_width) := int_2_logic_string(1, c_width);
                                                 
  CONSTANT count_to_str : STRING(1 TO c_width) := int_2_logic_string(count_to, c_width);

  CONSTANT ainit_val_str : STRING(1 TO c_width) := int_2_logic_string(ainit_val, c_width);
                                         
  CONSTANT sinit_val_str : STRING(1 TO c_width) := int_2_logic_string(sinit_val, c_width);


  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Function for debugging only
  --
  FUNCTION display_params(c_has_up : INTEGER) RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT " rs_counter_binary parameters : " & new_line &
        " c_implementation = 0" & new_line &
        " c_xdevicefamily = " & c_xdevicefamily & new_line &
        " c_width = " & INTEGER'IMAGE(c_width) & new_line &
        " c_restrict_count = " & INTEGER'IMAGE(bool_to_int(use_count_to)) & new_line &
        " c_count_to = " & count_to_str & new_line &
        " c_count_by = " & count_by_str & new_line &
        " c_count_mode = " & INTEGER'IMAGE(c_count_mode) & new_line &
        " c_thresh0_value = " & count_to_str & new_line &
        " c_ce_overrides_sync = " & INTEGER'IMAGE(ce_overrides_sync) & new_line &
        " c_sclr_overrides_sset = 1" & new_line &
        " c_latency = 1" & new_line &
        " c_fb_latency = 0" & new_line &
        " c_ainit_val = " & ainit_val_str & new_line &
        " c_sinit_val = " & sinit_val_str & new_line &
        " c_has_thresh0 = " & INTEGER'IMAGE(c_has_thresh0) & new_line &
        " c_has_ce = " & INTEGER'IMAGE(c_has_ce) & new_line &
        " c_has_up = " & INTEGER'IMAGE(c_has_up) & new_line &
        " c_has_load = " & INTEGER'IMAGE(c_has_load) & new_line &
        " c_load_low = 0" & new_line &
        " c_has_sclr = " & INTEGER'IMAGE(c_has_sclr) & new_line &
        " c_has_sset = " & INTEGER'IMAGE(c_has_sset) & new_line &
        " c_has_sinit = " & INTEGER'IMAGE(c_has_sinit) & new_line &
        new_line
      SEVERITY NOTE;
        
    RETURN TRUE;
  END display_params;
  

BEGIN

-- V7.0 and earlier of baseblock had load input overriding sclr and sset.
-- v9.0 and later have sclr and sset overriding load.
-- Need to force v7.0 behavior.



cg: IF c_width>1 GENERATE
  
  CONSTANT c_has_up : INTEGER := select_val_b(0, 1, (c_count_mode = c_updown));
  
  --SIGNAL dummy_zeroes    : STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  SIGNAL dummy_thresh1   : STD_LOGIC :='0';
  SIGNAL dummy_q_thresh0 : STD_LOGIC :='0';
  SIGNAL dummy_q_thresh1 : STD_LOGIC :='0';

--  CONSTANT do_display_params : BOOLEAN := display_params(c_has_up);
  
BEGIN
  --dummy_zeroes <= (OTHERS=>'0');
  
  ctr0: c_counter_binary_v12_0_10_viv
  GENERIC MAP (
    c_implementation      => 0, -- 0=fabric, 1=DSP48
    c_verbosity           => 0,
    c_xdevicefamily       => c_xdevicefamily,
    c_width               => c_width,
    c_has_ce              => c_has_ce,
    c_has_sclr            => c_has_sclr,
    c_restrict_count      => bool_to_int(use_count_to),
    c_count_to            => count_to_str,
    c_count_by            => count_by_str,
    c_count_mode          => c_count_mode,
    c_thresh0_value       => count_to_str,
    c_ce_overrides_sync   => ce_overrides_sync,
    c_has_thresh0         => c_has_thresh0,
    c_has_load            => c_has_load,
    c_load_low            => 0,
    c_latency             => 1,
    c_fb_latency          => 0,
    c_ainit_val           => ainit_val_str,
    c_sinit_val           => sinit_val_str,
    c_sclr_overrides_sset => 1,
    c_has_sset            => c_has_sset,
    c_has_sinit           => c_has_sinit
    ) 
  PORT MAP (
    clk        => clk,
    up         => up,
    ce         => ce,
    load       => load,
    l          => l,
    sclr       => sclr,
    sset       => sset,
    sinit      => sinit,
    thresh0    => thresh0,
    q          => q );

END GENERATE; --cg    

--------------------------------------------------------------------------------
q0g: IF c_width=1 GENERATE
  SIGNAL regd0, regq0 : STD_LOGIC :='0';
  SIGNAL sclr_final, sset_final : STD_LOGIC :='0';
  
  CONSTANT has_sset : INTEGER := bool_to_int(c_has_sset/=0 OR (c_has_sinit/=0 AND sinit_val/=0));
  CONSTANT has_sclr : INTEGER := bool_to_int(c_has_sclr/=0 OR (c_has_sinit/=0 AND sinit_val=0));
BEGIN

  regd0 <= ((NOT(regq0) AND NOT(load)) OR (l(0) AND load));

  -- Use sclr input to force initialization to 0 when sinit asserted
  q0g1 : IF c_has_sinit /= 0 AND sinit_val=0 GENERATE
    sclr_final <= sinit;
  END GENERATE; -- q0g1
  
  q0g2 : IF c_has_sinit=0 OR sinit_val/=0 GENERATE
    sclr_final <= sclr;
  END GENERATE; -- q0g2
  
  -- Use sset input to force initialization to 1 when sinit asserted
  q0g3 : IF c_has_sinit /= 0 AND sinit_val/=0 GENERATE
    sset_final <= sinit;
  END GENERATE; -- q0g3
  
  q0g4 : IF c_has_sinit=0 OR sinit_val=0 GENERATE
    sset_final <= sset;
  END GENERATE; -- q0g4
  
  
  q0_reg: rs_reg_bit
  GENERIC MAP(
    c_has_ce       => c_has_ce,
    c_has_sclr     => has_sclr,
    c_has_sset     => has_sset,
    c_sync_enable  => c_sync_enable)
  PORT MAP(
    d    => regd0,
    clk  => clk,
    ce   => ce,
    sclr => sclr_final,
    sset => sset_final,
    q    => regq0);

  q(0) <= regq0; -- drive counter output
  
  -- Threshold must be '1' for a 1-bit counter
  thresh0 <= regq0;

END GENERATE; --q0g

END synth;
          





-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_compare.vhd,v 1.2 2011/05/10 11:21:41 billw Exp $
--
-- Description: Wrapper for baseblox compare. 
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.c_compare_v12_0_3_viv_comp.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;


ENTITY rs_compare IS
GENERIC (
  c_family      : STRING;
  instance_name : STRING := "";
  c_width       : INTEGER;
  c_b_constant  : INTEGER := 0;
  c_b_value     : STRING := "0";
  c_has_a_eq_b  : INTEGER := 0;
  c_has_a_ne_b  : INTEGER := 0;
  c_has_a_lt_b  : INTEGER := 0;
  c_has_a_gt_b  : INTEGER := 0;
  c_has_a_le_b  : INTEGER := 0;
  c_has_a_ge_b  : INTEGER := 0;
  c_has_qa_eq_b : INTEGER := 0;
  c_has_qa_ne_b : INTEGER := 0;
  c_has_qa_lt_b : INTEGER := 0;
  c_has_qa_gt_b : INTEGER := 0;
  c_has_qa_le_b : INTEGER := 0;
  c_has_qa_ge_b : INTEGER := 0;
  c_has_ce      : INTEGER := 0;
  c_has_aclr    : INTEGER := 0;
  c_has_sclr    : INTEGER := 0;
  c_sync_enable : INTEGER := c_override); 
PORT (
  a       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  b       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  aclr    : IN  STD_LOGIC := '0';
  ce      : IN  STD_LOGIC := '1';
  sclr    : IN  STD_LOGIC := '0';
  clk     : IN  STD_LOGIC := '0';
  a_eq_b  : OUT STD_LOGIC;
  a_ne_b  : OUT STD_LOGIC;
  a_lt_b  : OUT STD_LOGIC;
  a_gt_b  : OUT STD_LOGIC;
  a_le_b  : OUT STD_LOGIC;
  a_ge_b  : OUT STD_LOGIC;
  qa_eq_b : OUT STD_LOGIC;
  qa_ne_b : OUT STD_LOGIC;
  qa_lt_b : OUT STD_LOGIC;
  qa_gt_b : OUT STD_LOGIC;
  qa_le_b : OUT STD_LOGIC;
  qa_ge_b : OUT STD_LOGIC);
END rs_compare;

ARCHITECTURE synth OF rs_compare IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  -- Function for debugging only
  --
  FUNCTION display_params RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT " rs_compare parameters : " & new_line &
        " instance_name = " & instance_name & new_line &
        " c_family = " & c_family & new_line &
        " c_width = " & integer'image(c_width) & new_line &
        " c_ainit_val = 0" & new_line &
        " c_data_type = " & integer'image(c_unsigned) & new_line &
        " c_b_constant = " & integer'image(c_b_constant) & new_line &
        " c_b_value = " & c_b_value & new_line &
        " c_sync_enable = " & integer'image(c_sync_enable) & new_line &
        " c_sync_priority = " & integer'image(c_clear) & new_line &
        " c_pipe_stages = 0" & new_line &
        " c_has_a_eq_b = " & integer'image(c_has_a_eq_b) & new_line &
        " c_has_a_ne_b = " & integer'image(c_has_a_ne_b) & new_line &
        " c_has_a_lt_b = " & integer'image(c_has_a_lt_b) & new_line &
        " c_has_a_gt_b = " & integer'image(c_has_a_gt_b) & new_line &
        " c_has_a_le_b = " & integer'image(c_has_a_le_b) & new_line &
        " c_has_a_ge_b = " & integer'image(c_has_a_ge_b) & new_line &
        " c_has_qa_eq_b = " & integer'image(c_has_qa_eq_b) & new_line &
        " c_has_qa_ne_b = " & integer'image(c_has_qa_ne_b) & new_line &
        " c_has_qa_lt_b = " & integer'image(c_has_qa_lt_b) & new_line &
        " c_has_qa_gt_b = " & integer'image(c_has_qa_gt_b) & new_line &
        " c_has_qa_le_b = " & integer'image(c_has_qa_le_b) & new_line &
        " c_has_qa_ge_b = " & integer'image(c_has_qa_ge_b) & new_line &
        " c_has_ce = " & integer'image(c_has_ce) & new_line &
        " c_has_aclr = " & integer'image(c_has_aclr) & new_line &
        " c_has_aset = 0" & new_line &
        " c_has_sclr = " & integer'image(c_has_sclr) & new_line &
        " c_has_sset = 0" & new_line &
        " c_enable_rlocs = 0" & new_line &
        new_line
      SEVERITY NOTE;
        
    RETURN TRUE;
  END display_params;
  
--  CONSTANT disp_params : BOOLEAN := display_params;

BEGIN  

  c : c_compare_v12_0_3_viv
  GENERIC MAP(
    c_family        => c_family,
    c_width         => c_width,
    c_ainit_val     => "0",
    c_data_type     => c_unsigned,
    c_b_constant    => c_b_constant,
    c_b_value       => c_b_value,
    c_sync_enable   => c_sync_enable,
    c_sync_priority => c_clear,
    c_pipe_stages   => 0,
    c_has_a_eq_b    => c_has_a_eq_b,
    c_has_a_ne_b    => c_has_a_ne_b,
    c_has_a_lt_b    => c_has_a_lt_b,
    c_has_a_gt_b    => c_has_a_gt_b,
    c_has_a_le_b    => c_has_a_le_b,
    c_has_a_ge_b    => c_has_a_ge_b,
    c_has_qa_eq_b   => c_has_qa_eq_b,
    c_has_qa_ne_b   => c_has_qa_ne_b,
    c_has_qa_lt_b   => c_has_qa_lt_b,
    c_has_qa_gt_b   => c_has_qa_gt_b,
    c_has_qa_le_b   => c_has_qa_le_b,
    c_has_qa_ge_b   => c_has_qa_ge_b,
    c_has_ce        => c_has_ce,
    c_has_aclr      => c_has_aclr,
    c_has_aset      => 0,
    c_has_sclr      => c_has_sclr,
    c_has_sset      => 0,
    c_enable_rlocs  => 0)
  PORT MAP(
    a       => a,
    b       => b,
    clk     => clk,
    ce      => ce,
    aclr    => aclr,
    aset    => '0',
    sclr    => sclr,
    sset    => '0',
    a_eq_b  => a_eq_b,
    a_ne_b  => a_ne_b,
    a_lt_b  => a_lt_b,
    a_gt_b  => a_gt_b,
    a_le_b  => a_le_b,
    a_ge_b  => a_ge_b,
    qa_eq_b => qa_eq_b,
    qa_ne_b => qa_ne_b,
    qa_lt_b => qa_lt_b,
    qa_gt_b => qa_gt_b,
    qa_le_b => qa_le_b,
    qa_ge_b => qa_ge_b);

END synth;



-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_compare_ge_var.vhd,v 1.2 2011/06/16 12:54:05 billw Exp $
--
-- Description: Wrapper for baseblox compare. B is variable. Output is
-- unregistered.
-- Checks for a >= b
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.c_compare_v12_0_3_viv_comp.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;


ENTITY rs_compare_ge_var IS
GENERIC (
  c_family       : STRING;
  c_width        : INTEGER;           
  c_enable_rlocs : INTEGER := 0); 
PORT (
  a       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (others => '0');
  b       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (others => '0');
  a_ge_b  : OUT STD_LOGIC);
END rs_compare_ge_var;

ARCHITECTURE virtex OF rs_compare_ge_var IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of virtex : architecture is "yes";

  
  SIGNAL a_eq_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_ne_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_lt_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_gt_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_le_b_dummy  : STD_LOGIC := '0';
  SIGNAL qa_ne_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_eq_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_lt_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_le_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_gt_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_ge_b_dummy : STD_LOGIC := '0';
   
BEGIN  

  c : c_compare_v12_0_3_viv
  GENERIC MAP(
    c_family        => c_family,
    c_width         => c_width,
    c_ainit_val     => "0",
    c_data_type     => c_unsigned,
    c_b_constant    => 0,
    c_b_value       => "0", -- Not used, but use a non-zero length string to keep Lint happy
    c_sync_enable   => c_override,
    c_sync_priority => c_clear,
    c_pipe_stages   => 0,
    c_has_a_eq_b    => 0,
    c_has_a_ne_b    => 0,
    c_has_a_lt_b    => 0,
    c_has_a_gt_b    => 0,
    c_has_a_le_b    => 0,
    c_has_a_ge_b    => 1,
    c_has_qa_eq_b   => 0,
    c_has_qa_ne_b   => 0,
    c_has_qa_lt_b   => 0,
    c_has_qa_gt_b   => 0,
    c_has_qa_le_b   => 0,
    c_has_qa_ge_b   => 0,
    c_has_ce        => 0,
    c_has_aclr      => 0,
    c_has_aset      => 0,
    c_has_sclr      => 0,
    c_has_sset      => 0,
    c_enable_rlocs  => c_enable_rlocs)
  PORT MAP(
    a       => a,
    b       => b,
    clk     => '1',
    ce      => '1',
    aclr    => '0',
    aset    => '0',
    sclr    => '0',
    sset    => '0',
    a_eq_b  => a_eq_b_dummy,
    a_ne_b  => a_ne_b_dummy,
    a_lt_b  => a_lt_b_dummy,
    a_gt_b  => a_gt_b_dummy,
    a_le_b  => a_le_b_dummy,
    a_ge_b  => a_ge_b,
    qa_eq_b => qa_eq_b_dummy,
    qa_ne_b => qa_ne_b_dummy,
    qa_lt_b => qa_lt_b_dummy,
    qa_gt_b => qa_gt_b_dummy,
    qa_le_b => qa_le_b_dummy,
    qa_ge_b => qa_ge_b_dummy);

END virtex;


-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_compare_eq_var.vhd,v 1.2 2011/06/16 12:54:05 billw Exp $
--
-- Description: Wrapper for baseblox compare. B is variable. Output is
-- un-registered.
-- Performs a = b, output unregistered.
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.c_compare_v12_0_3_viv_comp.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;


ENTITY rs_compare_eq_var IS
GENERIC (
  c_family       : STRING;
  c_width        : INTEGER;           
  c_enable_rlocs : INTEGER := 0); 
PORT (
  a      : IN STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  b      : IN STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  a_eq_b : OUT STD_LOGIC);
END rs_compare_eq_var;

ARCHITECTURE synth OF rs_compare_eq_var IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  
  SIGNAL a_ne_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_lt_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_gt_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_le_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_ge_b_dummy  : STD_LOGIC :='0';
  SIGNAL qa_eq_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_ne_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_lt_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_gt_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_le_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_ge_b_dummy : STD_LOGIC :='0';
   
BEGIN  

  c : c_compare_v12_0_3_viv
  GENERIC MAP(
    c_family        => c_family,
    c_width         => c_width,
    c_ainit_val     => "0",
    c_data_type     => c_unsigned,
    c_b_constant    => 0,
    c_b_value       => "0", -- Not used, but use a non-zero length string to keep Lint happy
    c_sync_enable   => c_override,
    c_sync_priority => c_clear,
    c_pipe_stages   => 0,
    c_has_a_eq_b    => 1,
    c_has_a_ne_b    => 0,
    c_has_a_lt_b    => 0,
    c_has_a_gt_b    => 0,
    c_has_a_le_b    => 0,
    c_has_a_ge_b    => 0,
    c_has_qa_eq_b   => 0,
    c_has_qa_ne_b   => 0,
    c_has_qa_lt_b   => 0,
    c_has_qa_gt_b   => 0,
    c_has_qa_le_b   => 0,
    c_has_qa_ge_b   => 0,
    c_has_ce        => 0,
    c_has_aclr      => 0,
    c_has_aset      => 0,
    c_has_sclr      => 0,
    c_has_sset      => 0,
    c_enable_rlocs  => c_enable_rlocs)
  PORT MAP(
    a       => a,
    b       => b,
    clk     => '0',
    ce      => '1',
    aclr    => '0',
    aset    => '0',
    sclr    => '0',
    sset    => '0',
    a_eq_b  => a_eq_b,
    a_ne_b  => a_ne_b_dummy,
    a_lt_b  => a_lt_b_dummy,
    a_gt_b  => a_gt_b_dummy,
    a_le_b  => a_le_b_dummy,
    a_ge_b  => a_ge_b_dummy,
    qa_eq_b => qa_eq_b_dummy,
    qa_ne_b => qa_ne_b_dummy,
    qa_lt_b => qa_lt_b_dummy,
    qa_gt_b => qa_gt_b_dummy,
    qa_le_b => qa_le_b_dummy,
    qa_ge_b => qa_ge_b_dummy);

END synth;



-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_compare_gt_var.vhd,v 1.2 2011/06/16 12:54:05 billw Exp $
--
-- Description: Wrapper for baseblox compare. B is variable. Output is
-- unregistered.
-- Checks for a > b
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.c_compare_v12_0_3_viv_comp.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;


ENTITY rs_compare_gt_var IS
GENERIC (
  c_family       : STRING;
  c_width        : INTEGER); 
PORT (
  a       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (others => '0');
  b       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (others => '0');
  a_gt_b  : OUT STD_LOGIC);
END rs_compare_gt_var;

ARCHITECTURE virtex OF rs_compare_gt_var IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of virtex : architecture is "yes";

  
  SIGNAL a_eq_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_ne_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_lt_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_ge_b_dummy  : STD_LOGIC := '0';
  SIGNAL a_le_b_dummy  : STD_LOGIC := '0';
  SIGNAL qa_ne_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_eq_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_lt_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_le_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_gt_b_dummy : STD_LOGIC := '0';
  SIGNAL qa_ge_b_dummy : STD_LOGIC := '0';
   
BEGIN  

  c : c_compare_v12_0_3_viv
  GENERIC MAP(
    c_family        => c_family,
    c_width         => c_width,
    c_ainit_val     => "0",
    c_data_type     => c_unsigned,
    c_b_constant    => 0,
    c_b_value       => "0", -- Not used, but use a non-zero length string to keep Lint happy
    c_sync_enable   => c_override,
    c_sync_priority => c_clear,
    c_pipe_stages   => 0,
    c_has_a_eq_b    => 0,
    c_has_a_ne_b    => 0,
    c_has_a_lt_b    => 0,
    c_has_a_gt_b    => 1,
    c_has_a_le_b    => 0,
    c_has_a_ge_b    => 0,
    c_has_qa_eq_b   => 0,
    c_has_qa_ne_b   => 0,
    c_has_qa_lt_b   => 0,
    c_has_qa_gt_b   => 0,
    c_has_qa_le_b   => 0,
    c_has_qa_ge_b   => 0,
    c_has_ce        => 0,
    c_has_aclr      => 0,
    c_has_aset      => 0,
    c_has_sclr      => 0,
    c_has_sset      => 0,
    c_enable_rlocs  => 0)
  PORT MAP(
    a       => a,
    b       => b,
    clk     => '1',
    ce      => '1',
    aclr    => '0',
    aset    => '0',
    sclr    => '0',
    sset    => '0',
    a_eq_b  => a_eq_b_dummy,
    a_ne_b  => a_ne_b_dummy,
    a_lt_b  => a_lt_b_dummy,
    a_gt_b  => a_gt_b,
    a_le_b  => a_le_b_dummy,
    a_ge_b  => a_ge_b_dummy,
    qa_eq_b => qa_eq_b_dummy,
    qa_ne_b => qa_ne_b_dummy,
    qa_lt_b => qa_lt_b_dummy,
    qa_gt_b => qa_gt_b_dummy,
    qa_le_b => qa_le_b_dummy,
    qa_ge_b => qa_ge_b_dummy);

END virtex;


-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_compare_lt.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
-- Description: Wrapper for baseblox compare. B is fixed.
-- Checks for a < b
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY rs_compare_lt IS
GENERIC (
  c_family     : STRING;
  c_width      : INTEGER;
  c_b_value    : STRING;
  c_has_a_lt_b : INTEGER := 0;
  c_has_ce     : INTEGER := 0;
  c_has_aclr   : INTEGER := 0;
  c_has_sclr   : INTEGER := 0); 
PORT (
  a       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  aclr    : IN  STD_LOGIC := '0';
  ce      : IN  STD_LOGIC := '1';
  sclr    : IN  STD_LOGIC := '0';
  clk     : IN  STD_LOGIC;
  a_lt_b  : OUT STD_LOGIC;
  qa_lt_b : OUT STD_LOGIC);
END rs_compare_lt;

ARCHITECTURE virtex OF rs_compare_lt IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of virtex : architecture is "yes";

  
  SIGNAL a_eq_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_ne_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_ge_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_gt_b_dummy  : STD_LOGIC :='0';
  SIGNAL a_le_b_dummy  : STD_LOGIC :='0';
  SIGNAL qa_ne_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_eq_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_le_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_gt_b_dummy : STD_LOGIC :='0';
  SIGNAL qa_ge_b_dummy : STD_LOGIC :='0';
   
BEGIN

  c1 : rs_compare
  GENERIC MAP(
    c_family        => c_family,
    instance_name   => "rs_compare_lt/c1",
    c_width         => c_width,
    c_b_constant    => 1,
    c_b_value       => c_b_value,
    c_has_a_eq_b    => 0,
    c_has_a_ne_b    => 0,
    c_has_a_lt_b    => c_has_a_lt_b,
    c_has_a_gt_b    => 0,
    c_has_a_le_b    => 0,
    c_has_a_ge_b    => 0,
    c_has_qa_eq_b   => 0,
    c_has_qa_ne_b   => 0,
    c_has_qa_lt_b   => 1,
    c_has_qa_gt_b   => 0,
    c_has_qa_le_b   => 0,
    c_has_qa_ge_b   => 0,
    c_has_ce        => c_has_ce,
    c_has_aclr      => c_has_aclr,
    c_has_sclr      => c_has_sclr)
  PORT MAP(
    a       => a,
    b       => a, -- Not used
    clk     => clk,
    ce      => ce,
    aclr    => aclr,
    sclr    => sclr,
    a_eq_b  => a_eq_b_dummy,
    a_ne_b  => a_ne_b_dummy,
    a_lt_b  => a_lt_b,
    a_gt_b  => a_gt_b_dummy,
    a_le_b  => a_le_b_dummy,
    a_ge_b  => a_ge_b_dummy,
    qa_eq_b => qa_eq_b_dummy,
    qa_ne_b => qa_ne_b_dummy,
    qa_lt_b => qa_lt_b,
    qa_gt_b => qa_gt_b_dummy,
    qa_le_b => qa_le_b_dummy,
    qa_ge_b => qa_ge_b_dummy);

END virtex;



--  (c) Copyright 2011 Xilinx, Inc. All rights reserved.
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
--------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_block_mem.vhd,v 1.2 2011/06/16 12:54:05 billw Exp $
--
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header
--
-- Object: rs_block_mem
-- Inferred block RAM
-- Supports single port ROM, dual-port ROM, single-port WRITE_FIRST RAM, simple dual-port RAM
--
--
--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Group: Parameters
--        ----------
-- Parameter: C_FAMILY
--  Indicates the FPGA family. Set to legal string, as defined by Coregen. This parameter is not currently used in this entity.
--
-- Parameter: C_XDEVICEFAMILY
--  Indicates the FPGA sub-family. Set to legal string, as defined by Coregen. This parameter is not currently used in this entity.
--
-- Parameter: C_ELABORATION_DIR
--  String set to Coregen project directory path. This path will be pre-pended to <C_MEM_INIT_FILE>.
--
-- Parameter: C_ADDR_WIDTH
--  Integer width of a & b address ports. Assume both ports have same address width.
--
-- Parameter: C_DEPTH
--  Integer depth of memory. Assume both ports are the same depth.
--
-- Parameter: C_HAS_DOUTA
--  Integer set to 1 if component has optional <douta> port, else 0
--
-- Parameter: C_HAS_DOUTB
--  Integer set to 1 if component has optional <doutb> port, else 0
--
-- Parameter: C_MEM_INIT_FILE
--  String set to name of mif file containing initialization contents. This is a text file containing a list of
--  binary numbers, one line for each address, starting with address 0 at the top of the file.
--  C_MEM_INIT_FILE is only used if <C_LOAD_INIT_FILE> = 1
--
-- Parameter: C_LOAD_INIT_FILE
--  Integer set to 1 if memory is to be initialized with <C_MEM_INIT_FILE>
--
-- Parameter: C_WIDTH
--  Integer set to width of memory data ports. All data ports are of the same width.
--
-- Parameter: C_MEM_TYPE
--  Integer set to type of memory required.
--  Valid types defined in <bip_utils_pkg> (c_rom, c_sp_ram, c_dp_ram)
--
--
--------------------------------------------------------------------------------
-- The following ports are provided:
--
-- Group: Ports
--        -----
-- Port: clk
--  Input, single clock for all synchronous logic. Only rising edge is used. Writes are synchronous to clk.
--
-- Port: ena
--  Input, clock enable for reading and writing of "a" port
--
-- Port: enb
--  Input, clock enable for reading of "b" port
--
-- Port: addra
--  Input, <C_ADDR_WIDTH> address bus for port "a"
--
-- Port: addrb
--  Input, <C_ADDR_WIDTH> address bus for port "b"
--
-- Port: dina
--  Input, <C_WIDTH> data bus for memory writes to "a" port
--
-- Port: dinb
--  Input, <C_WIDTH> data bus for memory writes to "b" port
--
-- Port: wea
--  Input, write enable for "a" port
--
-- Port: douta
--  Output, <C_WIDTH> "a" port output. This is the memory location addressed by <addra>.
--  Output changes synchronously, after <addra> is sampled on rising clock edge.
--
-- Port: doutb
--  Output, <C_WIDTH> "b" port output. This is the memory location addressed by <addrb>.
--  Output changes synchronously, after <addrb> is sampled on rising clock edge.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;

entity rs_block_mem is
generic (
  C_FAMILY           : string;
  C_XDEVICEFAMILY    : string;
  C_ELABORATION_DIR  : string;
  C_ADDR_WIDTH       : integer; -- assume both ports have same address width
  C_DEPTH            : integer; -- assume both ports are same depth
  C_HAS_DOUTA        : integer;
  C_HAS_DOUTB        : integer;
  C_MEM_INIT_FILE    : string := "no_coe_file_loaded";
  C_LOAD_INIT_FILE   : integer;
  C_WIDTH            : integer;
  C_MEM_TYPE         : integer); -- valid types defined in bip_utils_pkg (c_rom, c_sp_ram, c_dp_ram)
port (
  addra : in  std_logic_vector(C_ADDR_WIDTH-1 downto 0);
  addrb : in  std_logic_vector(C_ADDR_WIDTH-1 downto 0);
  dina  : in  std_logic_vector(C_WIDTH-1 downto 0);
  dinb  : in  std_logic_vector(C_WIDTH-1 downto 0);
  wea   : in  std_logic := '0';
  ena   : in  std_logic := '1';
  enb   : in  std_logic := '1';
  clk   : in  std_logic := '0'; -- common clock
  douta : out std_logic_vector(C_WIDTH-1 downto 0);
  doutb : out std_logic_vector(C_WIDTH-1 downto 0));
end rs_block_mem;



--------------------------------------------------------------------------------
architecture synth of rs_block_mem is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


--------------------------------------------------------------------------------
constant dual_port   : boolean := (C_MEM_TYPE = c_dp_ram or C_HAS_DOUTB /= 0);
constant single_port : boolean := (C_MEM_TYPE /= c_dp_ram and C_HAS_DOUTB = 0);


subtype data_type is std_logic_vector(C_WIDTH-1 downto 0);
type ram_type is array (0 to C_DEPTH-1) of data_type;


-- Address signals after checking for illegal values
signal addra_final : std_logic_vector(C_ADDR_WIDTH-1 downto 0) := (others => '0');
signal addrb_final : std_logic_vector(C_ADDR_WIDTH-1 downto 0) := (others => '0');
-- temporary signals for primary outputs
signal douta_int : data_type := (others=>'0');
signal doutb_int : data_type := (others=>'0');


--------------------------------------------------------------------------------
-- RAM is either initialized with zeroes for every bit or using a supplied mif file
--
impure function get_initial_contents return ram_type is
  -- Prepend filename with elaboration directory path
  constant full_filename : string := C_ELABORATION_DIR & C_MEM_INIT_FILE;

  file     meminitfile   : text;

  variable bitline       : line; -- line read from mif file
  variable bits_good     : boolean; -- set to false if can't extract data from bitline
  variable bv            : bit_vector(C_WIDTH-1 downto 0); -- bit_vector extracted from bitline
  variable init_contents : ram_type; -- RAM contents are written to this variable
  variable mif_status    : file_open_status; -- use to determine if file opened ok

  constant LOOP_LIMIT : integer := 65538;
  variable blocks : integer := 0;
  variable s      : integer := 0;
  variable e      : integer := 0;

begin

  -- Workaround for loop limit in Vivado Synthesis.
  -- For very large MIF files (200000 lines is a possibility), split the processing
  -- into consecutive blocks, otherwise just continue to process as as a single block.
  if C_DEPTH >= LOOP_LIMIT then
    blocks := 4;
  else
    blocks := 1;
  end if;

  -- initialize to all zeroes if no mif file supplied
  if (C_LOAD_INIT_FILE = 0) then
    init_contents := (others => (others => '0'));
  else
    -- Load contents from mif file
    -- mif file is arranged as one row for each memory address value
    -- Read binary contents from mif file into a single bit vector
    assert false
      report "Reading mif file " & full_filename
      severity note;

    file_open(mif_status, meminitfile, full_filename, read_mode);

    assert mif_status = open_ok
      report "ERROR: couldn't open memory initialization file."
      severity failure;

    for j in 0 to blocks-1 loop
      s := j*C_DEPTH/blocks;
      e := (j*C_DEPTH/blocks)+(C_DEPTH/blocks)-1;
      for i in s to e loop
        readline(meminitfile, bitline);
        read(bitline, bv, bits_good);
        init_contents(i) := to_stdlogicvector(bv);

        assert bits_good
          report "ERROR: problem reading memory initialization file " &
          full_filename
          severity failure;

      end loop;
    end loop;

    file_close( meminitfile );

  end if; -- C_LOAD_INIT_FILE

  return init_contents;

end get_initial_contents;

constant initial_contents : ram_type := get_initial_contents;

signal ram_contents : ram_type := initial_contents;

--------------------------------------------------------------------------------
-- Check parameters are valid
--
function check_params return boolean is
begin

  assert not(C_MEM_TYPE /= c_rom and C_HAS_DOUTA /= 0 and C_HAS_DOUTB /= 0)
    report "ERROR: rs_block_mem does not support true dual port ram. " &
           "Must use simple dual port."
    severity failure;

  assert not(C_MEM_TYPE = c_dp_ram and C_HAS_DOUTB = 0)
    report "ERROR: rs_block_mem - C_MEM_TYPE set to c_dp_ram but C_HAS_DOUTB=0"
    severity failure;

  assert not(C_MEM_TYPE = c_sp_ram and C_HAS_DOUTB /= 0)
    report "ERROR: rs_block_mem - C_MEM_TYPE set to c_sp_ram but C_HAS_DOUTB/=0"
    severity failure;

  assert (C_DEPTH <= 2**C_ADDR_WIDTH)
    report "ERROR: rs_block_mem - C_DEPTH is larger than can be addressed by C_ADDR_WIDTH"
    severity failure;

  return true;
end check_params;

constant do_check_params : boolean := check_params;




-- XST attribute to force block memory usage. XST might still override this if
-- it thinks bram cannot be used.
attribute ram_style : string;
attribute ram_style of ram_contents : signal is "block";


--------------------------------------------------------------------------------
-- Beginning of architecture body
--
begin

-- Assign primary outputs
dg1: if (C_HAS_DOUTA /= 0) generate
begin
  douta <= douta_int;
end generate; -- dg1

dg2: if (C_HAS_DOUTB /= 0) generate
begin
  doutb <= doutb_int;
end generate; -- dg2


--------------------------------------------------------------------------------
-- For simulation of the source code we need to prevent illegal addresses
-- on the address bus or a fatal error will occur when the ram_contents
-- array is accessed. This is not a problem in the netlist.
-- Maximum legal value for address bus. values above this will result in the
-- following behavior:
--   simulation: address forced to all 0's and warning given
--   synthesis read/write: address will wrap, depending on how memory has been
--   synthesized

-- pragma translate_off
process (addra)
  variable addra_int : integer;
begin
    addra_int := conv_integer(addra);

    if (addra_int >= C_DEPTH) then
      assert false
      report "rs_block_mem, addra (" & integer'image(addra_int) &
             ") was greater than supported by memory depth (" &
             integer'image(C_DEPTH) & ")"
      severity warning;
      addra_final <= (others=>'0');
    else
      -- pragma translate_on
      addra_final <= addra;
      -- pragma translate_off
    end if;

end process;

adb1: if (dual_port) generate
begin

  process (addrb)
    variable addrb_int : integer;
  begin
      addrb_int := conv_integer(addrb);

      if (addrb_int >= C_DEPTH) then
        assert false
        report "rs_block_mem, addrb (" & integer'image(addrb_int) &
               ") was greater than supported by memory depth (" &
               integer'image(C_DEPTH) & ")"
        severity warning;
        addrb_final <= (others=>'0');
      else
        -- pragma translate_on
        addrb_final <= addrb;
        -- pragma translate_off
      end if;

  end process;

end generate; --adb1
-- pragma translate_on



--------------------------------------------------------------------------------
-- ROM
rom1: if (C_MEM_TYPE = c_rom) generate
begin

  -- port a
  process (clk)
  begin
    if rising_edge(clk) then
      if (ena = '1') then
        douta_int <= ram_contents(conv_integer(addra_final));
      end if; -- ena
    end if; -- clk
  end process;

  -- Add port b if dual port
  rom2: if (dual_port) generate
  begin

    process (clk)
    begin
      if rising_edge(clk) then
        if (enb = '1') then
          doutb_int <= ram_contents(conv_integer(addrb_final));
        end if; -- enb
      end if; -- clk
    end process;

  end generate; -- rom2

end generate; -- rom1


--------------------------------------------------------------------------------
-- RAM
--
ram1: if (C_MEM_TYPE /= c_rom) generate
begin

  ------------------------------------------------------------------------------
  -- write_first single-port RAM
  --
  ram2: if not(dual_port) generate
  begin

    process (clk)
    begin
      if rising_edge(clk) then
        if ena = '1' then
          if wea = '1' then
            ram_contents(conv_integer(addra_final)) <= dina;
            douta_int <= dina;
          else
            douta_int <= ram_contents(conv_integer(addra_final));
          end if; -- wea
        end if; -- ena
      end if; -- clk
    end process;

  end generate; -- ram2



  ------------------------------------------------------------------------------
  -- Simple dual-port RAM
  -- Write to "a" port, read from "b" port
  --
  ram3: if (dual_port) generate
  begin

    -- port a (write port)
    process (clk)
    begin
      if rising_edge(clk) then
        if ena = '1' then
          if wea = '1' then
            ram_contents(conv_integer(addra_final)) <= dina;
          end if; -- wea
        end if; -- ena
      end if; -- clk
    end process;

    -- port b (read port)
    process (clk)
    begin
      if rising_edge(clk) then
        if enb = '1' then
          doutb_int <= ram_contents(conv_integer(addrb_final));
        end if; -- enb
      end if; -- clk
    end process;


  end generate; -- ram3

end generate; -- ram1

end synth;



--  (c) Copyright 2011 Xilinx, Inc. All rights reserved.
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
--------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_distributed_mem.vhd,v 1.5 2011/06/16 12:54:05 billw Exp $
--
--
--------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header
--
-- Object: rs_distributed_mem
-- Inferred distributed RAM
-- Supports single port ROM, dual-port ROM, single-port RAM, simple dual-port RAM
--
--
--------------------------------------------------------------------------------
-- The following generics are provided:
--
-- Group: Parameters
--        ----------
-- Parameter: C_ELABORATION_DIR
--  String set to Coregen project directory path. This path will be pre-pended to <C_MEM_INIT_FILE>.
--
-- Parameter: C_ADDR_WIDTH
--  Integer width of a & b address ports. Assume both ports have same address width.
--
-- Parameter: C_DEPTH
--  Integer depth of memory. Assume both ports are the same depth.
--
-- Parameter: C_HAS_SPO
--  Integer set to 1 if component has optional <spo> port, else 0
--
-- Parameter: C_HAS_QSPO
--  Integer set to 1 if component has optional <qspo> port, else 0
--
-- Parameter: C_HAS_DPO
--  Integer set to 1 if component has optional <dpo> port, else 0
--
-- Parameter: C_HAS_QDPO
--  Integer set to 1 if component has optional <qdpo> port, else 0
--
-- Parameter: C_MEM_INIT_FILE
--  String set to name of mif file containing initialization contents. This is a text file containing a list of
--  binary numbers, one line for each address, starting with address 0 at the top of the file.
--  C_MEM_INIT_FILE is only used if <C_LOAD_INIT_FILE> = 1
--
-- Parameter: C_LOAD_INIT_FILE
--  Integer set to 1 if memory is to be initialized with <C_MEM_INIT_FILE>
--
-- Parameter: C_WIDTH
--  Integer set to width of memory data ports. All data ports are of the same width.
--
-- Parameter: C_MEM_TYPE
--  Integer set to type of memory required.
--  Valid types defined in <bip_utils_pkg> (c_rom, c_sp_ram, c_dp_ram)
--
--
--------------------------------------------------------------------------------
-- The following ports are provided:
--
-- Group: Ports
--        -----
-- Port: clk
--  Input, single clock for all synchronous logic. Only rising edge is used. Writes are synchronous to clk.
--
-- Port: en
--  Input, clock enable for registered outputs, <qspo> and <qdpo>
--
-- Port: addra
--  Input, <C_ADDR_WIDTH> address bus for port "a"
--
-- Port: addrb
--  Input, <C_ADDR_WIDTH> address bus for port "b"
--
-- Port: din
--  Input, <C_WIDTH> data bus for memory writes
--
-- Port: we
--  Input, write enable. This is not affected by <en> port so we must be externally gated with any clock enable.
--
-- Port: spo
--  Output, <C_WIDTH> single port output. This is the memory location addressed by <addra>.
--  Output changes asynchronously, as soon as addra changes.
--
-- Port: qspo
--  Output, <C_WIDTH> registered single port output.
--  Registered version of <spo>. <en> is the register clock enable.
--
-- Port: dpo
--  Output, <C_WIDTH> dual port output. This is the memory location addressed by <addrb>.
--  Output changes asynchronously, as soon as addrb changes.
--
-- Port: qdpo
--  Output, <C_WIDTH> registered dual port output.
--  Registered version of <dpo>. <en> is the register clock enable.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;

entity rs_distributed_mem is
generic (
  C_ELABORATION_DIR  : string;
  C_ADDR_WIDTH       : integer;
  C_DEPTH            : integer;
  C_HAS_SPO          : integer;
  C_HAS_QSPO         : integer;
  C_HAS_DPO          : integer;
  C_HAS_QDPO         : integer;
  C_MEM_INIT_FILE    : string := "no_coe_file_loaded";
  C_LOAD_INIT_FILE   : integer;
  C_WIDTH            : integer;
  C_MEM_TYPE         : integer);
port (
  clk   : IN  std_logic := '0';
  en    : IN  std_logic := '1';
  we    : IN  std_logic := '0';
  din   : IN  std_logic_vector(C_WIDTH-1 downto 0);
  addra : IN  std_logic_vector(C_ADDR_WIDTH-1 downto 0);
  addrb : IN  std_logic_vector(C_ADDR_WIDTH-1 downto 0);
  spo   : OUT std_logic_vector(C_WIDTH-1 downto 0);
  qspo  : OUT std_logic_vector(C_WIDTH-1 downto 0);
  dpo   : OUT std_logic_vector(C_WIDTH-1 downto 0);
  qdpo  : OUT std_logic_vector(C_WIDTH-1 downto 0));
end rs_distributed_mem;



--------------------------------------------------------------------------------
architecture synth of rs_distributed_mem is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


-- Group: architecture


--------------------------------------------------------------------------------
-- Group: types

-- type: data_type
--  <C_WIDTH> std_logic_vector for data buses
subtype data_type is std_logic_vector(C_WIDTH-1 downto 0);

-- type: ram_type
--  Array of <data_type> for memory contents
type ram_type is array (0 to C_DEPTH-1) of data_type;




--------------------------------------------------------------------------------
-- Group: Functions
--------------------------------------------------------------------------------
-- Function: check_params
--  Check parameters are valid. Exit with failure assertion if any parameter is invalid.
--
-- Returns:
--  boolean true if parameters are valid
--
function check_params return boolean is
begin

  assert not(C_MEM_TYPE = c_dp_ram and C_HAS_DPO = 0 and C_HAS_QDPO = 0)
    report "ERROR: rs_distributed_mem - C_MEM_TYPE set to c_dp_ram but c_has_doutb=0"
    severity failure;

  assert not(C_MEM_TYPE = c_sp_ram and (C_HAS_DPO /= 0 or C_HAS_QDPO /= 0))
    report "ERROR: rs_distributed_mem - C_MEM_TYPE set to c_sp_ram but c_has_doutb/=0"
    severity failure;

  assert (C_DEPTH <= 2**C_ADDR_WIDTH)
    report "ERROR: rs_distributed_mem - C_DEPTH is larger than can be addressed by C_ADDR_WIDTH"
    severity failure;

  return true;
end check_params;


--------------------------------------------------------------------------------
-- Function: get_initial_contents
--  Read mif file and convert into an array to initialize the memory. If <C_LOAD_INIT_FILE> = 0 then
--  fill array with zeroes for every bit.
--
-- Returns:
--  <ram_type> array of initial memory contents
--
impure function get_initial_contents return ram_type is
  -- Prepend filename with elaboration directory path
  constant full_filename : string := C_ELABORATION_DIR & C_MEM_INIT_FILE;

  file     meminitfile   : text;

  variable bitline       : line; -- Line read from mif file
  variable bits_good     : boolean; -- Set to false if can't extract data from bitline
  variable bv            : bit_vector(C_WIDTH-1 downto 0); -- bit_vector extracted from bitline
  variable init_contents : ram_type; -- RAM contents are written to this variable
  variable mif_status    : file_open_status; -- Use to determine if file opened ok

begin
  -- Initialize to all zeroes if no mif file supplied
  if (C_LOAD_INIT_FILE = 0) then
    init_contents := (others => (others => '0'));
  else
    -- Load contents from mif file
    -- mif file is arranged as one row for each memory address value
    -- Read binary contents from mif file into a single bit vector
--    assert false
--      report "Reading mif file " & full_filename
--      severity note;

    file_open(mif_status, meminitfile, full_filename, read_mode);

    assert mif_status = open_ok
      report "Error: couldn't open memory initialization file."
      severity failure;

    for i in 0 to C_DEPTH-1 loop
      readline(meminitfile, bitline);
      read(bitline, bv, bits_good);
      init_contents(i) := to_stdlogicvector(bv);

      assert bits_good
        report "Error: problem reading memory initialization file " &
               full_filename
        severity failure;

    end loop;

    file_close( meminitfile );

  end if; -- C_LOAD_INIT_FILE

  return init_contents;

end get_initial_contents;



--------------------------------------------------------------------------------
-- Group: constants

-- boolean: do_check_params
--  <check_params> function is called
constant do_check_params : boolean := check_params;

-- boolean: dual_port
--  True if component has two ports
constant dual_port   : boolean := (C_MEM_TYPE = c_dp_ram or C_HAS_DPO /= 0 or C_HAS_QDPO /= 0);

-- constant: initial_contents
--  Array of std_logic_vectors to hold initial memory contents
constant initial_contents : ram_type := get_initial_contents;


--------------------------------------------------------------------------------
-- Signal declarations
signal addrb_final    : std_logic_vector(C_ADDR_WIDTH-1 downto 0):= (others => '0');
signal ram_contents   : ram_type := initial_contents;
signal lut_out_single : data_type := (others => '0');

-- The following signals are for source code simulation only and not to be synthesized
-- pragma translate_off
signal addra_int : integer := 0;
signal addrb_int : integer := 0;
-- pragma translate_on
signal qspo_int : data_type := (others => '0');
--attribute keep : string;
--attribute keep of qspo_int : signal is "true";

--------------------------------------------------------------------------------
-- XST attribute to force distributed memory usage. XST might still override
-- this if it thinks distributed memory cannot be used.
attribute ram_style : string;
attribute ram_style of ram_contents : signal is "distributed";

--Make sure XST never tries to take the output register into a shift register
attribute shreg_extract: string;
attribute shreg_extract of lut_out_single:  signal is "no";
attribute shreg_extract of qspo:            signal is "no";
attribute shreg_extract of qdpo:            signal is "no";

attribute ram_extract : string;
attribute ram_extract of ram_contents : signal is "yes";


-- Keep hierarchy around this entity
-- May be necessary in future, but XST seems to do ok with this unset
--attribute keep_hierarchy: string;
--attribute keep_hierarchy of xilinx: architecture is "soft";


--------------------------------------------------------------------------------
-- Beginning of architecture body
--
begin
  -- Group: architecture body

  ------------------------------------------------------------------------------

  -- For simulation of the source code we need to prevent illegal addresses
  -- on the address bus or a fatal error will occur when the ram_contents
  -- array is accessed. This is not a problem in the netlist.
  -- Maximum legal value for address bus. Values above this will result in the
  -- following behavior:
  --   simulation: address forced to all 0's and warning given
  --   synthesis read/write: address will wrap, depending on how memory has been
  --   synthesized

  -- pragma translate_off
  aap1 : process (addra)
  begin
    addra_int <= conv_integer(addra);

    assert (addra_int < C_DEPTH)
      report "rs_distributed_mem, addra (" & integer'image(addra_int) &
             ") was greater than supported by memory depth (" & integer'image(C_DEPTH) & ")"
      severity warning;
  end process; -- aap1

  adb1: if (dual_port) generate
  begin

    abp1 : process (addrb)
    begin
      addrb_int <= conv_integer(addrb);

      assert (addrb_int < C_DEPTH)
        report "rs_distributed_mem, addrb (" & integer'image(addrb_int) &
               ") was greater than supported by memory depth (" & integer'image(C_DEPTH) & ")"
        severity warning;
    end process; -- abp1

  end generate; --adb1
  -- pragma translate_on


  ------------------------------------------------------------------------------
  -- RAM
  --
  ram1: if (C_MEM_TYPE /= c_rom) generate
  begin

    ----------------------------------------------------------------------------
    -- Only provide write port if this is a RAM
    --
    process (clk)
    begin
      if rising_edge(clk) then
        if we = '1' then
          -- pragma translate_off
          if (addra_int >= C_DEPTH) then
            ram_contents <= (others=>(others=>'X')); -- Force entire RAM contents to X if there is an illegal write
          else
            -- pragma translate_on
            ram_contents(conv_integer(addra)) <= din;
            -- pragma translate_off
          end if; -- (addra_int >= C_DEPTH)
          -- pragma translate_on
        end if; -- we
      end if; -- clk
    end process;

  end generate; -- ram1



  -- pragma translate_off
  process (addra_int, ram_contents)
  begin

    if (addra_int >= C_DEPTH) then
      lut_out_single <= (others=>'X'); -- Force RAM output to X
    else
      -- pragma translate_on
      -- Read RAM using single port read address (addra)
      lut_out_single <= ram_contents(conv_integer(addra));
      -- pragma translate_off
    end if;

  end process;
  -- pragma translate_on







  -- Register single-port LUT output
  qrg1: if (C_HAS_QSPO /= 0) generate
  begin

    -- Register RAM output (may be optimized away)
    process (clk)
    begin
      if rising_edge(clk) then
        if en = '1' then
          qspo_int <= lut_out_single;
        end if; -- wea
      end if; -- clk
    end process;

  end generate; -- qrg1
  qspo <= qspo_int;


  -- Final unregistered output
  spo1: if (C_HAS_SPO /= 0) generate
  begin
    spo <= lut_out_single;
  end generate; -- spo1




  ------------------------------------------------------------------------------
  -- Add second read port, if required
  --
  ram2: if (dual_port) generate
    signal lut_out_dual : data_type := (others => '0');
    signal qdpo_int     : data_type := (others => '0');
    attribute shreg_extract of lut_out_dual: signal is "no";
  begin

    -- pragma translate_off
    process (addrb_int, ram_contents)
    begin

      if (addrb_int >= C_DEPTH) then
        lut_out_dual <= (others=>'X'); -- Force RAM output to X
      else
        -- pragma translate_on
        -- Read RAM using dual port read address (addrb)
        lut_out_dual <= ram_contents(conv_integer(addrb));
        -- pragma translate_off
      end if;

    end process;
    -- pragma translate_on


    -- Register LUT output (may be optimized away)
    process (clk)
    begin
      if rising_edge(clk) then
        if en = '1' then
          qdpo_int <= lut_out_dual;
        end if; -- wea
      end if; -- clk
    end process;

    -- Final unregistered output
    dpo1: if (C_HAS_DPO /= 0) generate
    begin
      dpo <= lut_out_dual;
    end generate; -- dpo1

    -- Register dual-port LUT output
    qrg2: if (C_HAS_QDPO /= 0) generate
    begin
      qdpo <= qdpo_int;
    end generate; -- qrg2

  end generate; -- ram2


end synth;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_adder2.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
-- Description: Special adder. This operates like a regular
-- adder unless a_sel = '1'.
-- Outputs      a1 + b if a_sel = '1'
-- else outputs a0 + b
-- a_sel is a mandatory input.
-- c_out_width must only equal c_width or c_width+1
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY rs_adder2 IS
GENERIC (
  c_width           : INTEGER;            
  c_out_width       : INTEGER;
  c_has_s           : INTEGER := 0;
  c_has_q           : INTEGER := 1;
  c_has_ce          : INTEGER := 0;
  c_has_aclr        : INTEGER := 0
  ); 
PORT (
  a0       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  a1       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  b        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  clk      : IN  STD_LOGIC := '0'; -- clock
  ce       : IN  STD_LOGIC := '1'; -- clock enable
  aclr     : IN  STD_LOGIC := '0'; -- asynch init
  a_sel    : IN  STD_LOGIC;
  s        : OUT STD_LOGIC_VECTOR(c_out_width-1 DOWNTO 0); -- asynch output
  q        : OUT STD_LOGIC_VECTOR(c_out_width-1 DOWNTO 0)); -- synch output
END rs_adder2;

ARCHITECTURE synth OF rs_adder2 IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

    
  SIGNAL a_final : STD_LOGIC_VECTOR(c_width-1 DOWNTO 0):= (others => '0');
  SIGNAL s_tmp   : STD_LOGIC_VECTOR(c_out_width-1 DOWNTO 0):= (others => '0');
BEGIN
 
  -- RTL version
  a_final <= a1 WHEN a_sel = '1' ELSE a0;
  s_tmp <= b + a_final;
  -- Must not write as "a_final + b" or XST will not merge mux into adder LUT!
  
  sg1 : IF c_has_s /= 0 GENERATE
    s <= s_tmp;
  END GENERATE; -- sg1
  
  
  qg1 : IF c_has_q /= 0 GENERATE
  
    rg0 : rs_reg
    GENERIC MAP(c_width=>c_out_width, c_has_ce=>c_has_ce, c_has_aclr=>c_has_aclr)
    PORT MAP(d=>s_tmp, clk=>clk, ce=>ce, aclr=>aclr, q=>q);
  END GENERATE; -- qg1
  
  
  
--   -- Baseblox Version
--   add1 : rs_addsub
--   GENERIC MAP (
--     c_a_width    => c_width,
--     c_b_width    => c_width,
--     c_out_width  => c_out_width,
--     c_high_bit   => c_out_width-1,
--     c_has_s      => c_has_s,
--     c_has_q      => c_has_q,
--     c_has_aclr   => c_has_aclr,
--     c_has_ce     => c_has_ce)
--   PORT MAP (
--     a      => a_final, 
--     b      => b,
--     clk    => clk,
--     aclr   => aclr,
--     ce     => ce,
--     s      => s,
--     q      => q);


END synth;



-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_addsub.vhd,v 1.2 2011/05/10 11:21:41 billw Exp $
--
-- Description: addsub wrapper.
--
-- Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY c_addsub_v12_0_10;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_viv_comp.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;



ENTITY rs_addsub IS
GENERIC (
  c_xdevicefamily   : STRING;
  instance_name     : STRING := "";            
  c_a_width         : INTEGER;            
  c_b_width         : INTEGER;            
  c_out_width       : INTEGER;
  c_add_mode        : INTEGER := c_add; 
  c_a_type          : INTEGER := c_unsigned; 
  c_b_type          : INTEGER := c_unsigned; 
  c_b_constant      : INTEGER := 0;             
  c_b_value         : STRING  := "0"; 
  c_ainit_val       : STRING  := "0"; 
  c_sinit_val       : STRING  := "0"; 
  c_bypass_enable   : INTEGER := c_no_override;   
  c_bypass_low      : INTEGER := 0; 
  c_sync_enable     : INTEGER := c_override;      
  c_sync_priority   : INTEGER := c_clear;     
  c_latency         : INTEGER := 1;
  c_has_c_in        : INTEGER := 0;
  c_has_c_out       : INTEGER := 0;
  c_has_ce          : INTEGER := 0;
  c_has_bypass      : INTEGER := 0;
  c_has_sclr        : INTEGER := 0;
  c_has_sset        : INTEGER := 0;
  c_has_sinit       : INTEGER := 0
  ); 
PORT (
  a        : IN  STD_LOGIC_VECTOR(c_a_width-1 DOWNTO 0); -- input value
  b        : IN  STD_LOGIC_VECTOR(c_b_width-1 DOWNTO 0); -- input value
  clk      : IN  STD_LOGIC := '0'; -- clock
  add      : IN  STD_LOGIC := '1'; -- When addsub mode 1=add, 0=subtract
  c_in     : IN  STD_LOGIC := '0'; -- carry in
  b_in     : IN  STD_LOGIC := '1'; -- borrow in
  ce       : IN  STD_LOGIC := '1'; -- clock enable
  bypass   : IN  STD_LOGIC := '0'; -- sync load of b into reg
  sclr     : IN  STD_LOGIC := '0'; -- synch init
  sset     : IN  STD_LOGIC := '0'; -- synch set
  sinit    : IN  STD_LOGIC := '0'; -- synch init
  c_out    : OUT STD_LOGIC;
  s        : OUT STD_LOGIC_VECTOR(c_out_width-1 DOWNTO 0)); 
END rs_addsub;

ARCHITECTURE synth OF rs_addsub IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  
  ------------------------------------------------------------------------------
  -- Function for debugging only
  --
  FUNCTION display_params RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT " rs_addsub parameters : " & new_line &
        " Instance = " & instance_name & new_line &
        " c_a_width = " & INTEGER'IMAGE(c_a_width) & new_line &
        " c_b_width = " & INTEGER'IMAGE(c_b_width) & new_line &
        " c_out_width = " & INTEGER'IMAGE(c_out_width) & new_line &
        " c_add_mode = " & INTEGER'IMAGE(c_add_mode) & new_line &
        " c_a_type = " & INTEGER'IMAGE(c_a_type) & new_line &
        " c_b_type = " & INTEGER'IMAGE(c_b_type) & new_line &
        " c_b_constant = " & INTEGER'IMAGE(c_b_constant) & new_line &
        " c_b_value = " & c_b_value & new_line &
        " c_ainit_val = " & c_ainit_val & new_line &
        " c_sinit_val = " & c_sinit_val & new_line &
        " c_bypass_enable = " & INTEGER'IMAGE(c_bypass_enable) & new_line &
        " c_bypass_low = " & INTEGER'IMAGE(c_bypass_low) & new_line &
        " c_sync_enable = " & INTEGER'IMAGE(c_sync_enable) & new_line &
        " c_sync_priority = " & INTEGER'IMAGE(c_sync_priority) & new_line &
        " c_latency = " & INTEGER'IMAGE(c_latency) & new_line &
        " c_has_c_in = " & INTEGER'IMAGE(c_has_c_in) & new_line &
        " c_has_c_out = " & INTEGER'IMAGE(c_has_c_out) & new_line &
        " c_has_ce = " & INTEGER'IMAGE(c_has_ce) & new_line &
        " c_has_bypass = " & INTEGER'IMAGE(c_has_bypass) & new_line &
        " c_has_sclr = " & INTEGER'IMAGE(c_has_sclr) & new_line &
        " c_has_sset = " & INTEGER'IMAGE(c_has_sset) & new_line &
        " c_has_sinit = " & INTEGER'IMAGE(c_has_sinit) & new_line &
        new_line
      SEVERITY NOTE;
        
    RETURN TRUE;
  END display_params;
  
--  CONSTANT do_display_params : BOOLEAN := display_params;
  
BEGIN  
  
  as : c_addsub_v12_0_10_viv
  GENERIC MAP(
      c_verbosity           => 0,
      c_xdevicefamily       => c_xdevicefamily,
      c_implementation      => 0, -- 0=LUTs, 1=DSP48
      c_a_width             => c_a_width,
      c_b_width             => c_b_width,
      c_out_width           => c_out_width,
      c_ce_overrides_sclr   => c_sync_enable,
      c_a_type              => c_a_type,
      c_b_type              => c_b_type,
      c_latency             => c_latency,
      c_add_mode            => c_add_mode,
      c_b_constant          => c_b_constant,
      c_b_value             => c_b_value,
      c_ainit_val           => c_ainit_val,
      c_sinit_val           => c_sinit_val, 
      c_ce_overrides_bypass => c_bypass_enable,
      c_bypass_low          => c_bypass_low,
      c_sclr_overrides_sset => c_sync_priority,
      c_has_c_in            => c_has_c_in,
      c_has_c_out           => c_has_c_out,
      c_borrow_low          => 1, -- not used for LUT implementation
      c_has_ce              => c_has_ce,
      c_has_bypass          => c_has_bypass,
      c_has_sclr            => c_has_sclr,
      c_has_sset            => c_has_sset,
      c_has_sinit           => c_has_sinit)
    PORT MAP(
      a        => a,
      b        => b,
      s        => s,
      clk      => clk,
      add      => add,
      c_in     => c_in,
      c_out    => c_out,
      ce       => ce,
      bypass   => bypass,
      sclr     => sclr,
      sset     => sset,
      sinit    => sinit);
      
END synth;



-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_blocks_pkg.vhd,v 1.2 2011/04/11 15:41:16 billw Exp $
--
-------------------------------------------------------------------------------

------------------------------------------------------------------------
-- 
--  Model:  PACKAGE rs_blocks_pkg
--
--
------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
PACKAGE rs_blocks_pkg IS

--
-- COMPONENT declarations
--

COMPONENT add_a
  GENERIC (
    c_xdevicefamily : STRING;
    w               : INTEGER);
  PORT ( a : IN  STD_LOGIC_VECTOR(w-1 DOWNTO 0);
         b : IN  STD_LOGIC_VECTOR(w-1 DOWNTO 0);
         s : OUT STD_LOGIC_VECTOR(w DOWNTO 0) );
END COMPONENT; -- add_a

COMPONENT add_b
  GENERIC (in_width       : INTEGER;
           out_width      : INTEGER;
           c_has_q        : INTEGER);
  PORT (a      : IN  STD_LOGIC_VECTOR(in_width-1 DOWNTO 0);
        b      : IN  STD_LOGIC_VECTOR(in_width-1 DOWNTO 0);
        init_b : IN  STD_LOGIC;
        ce     : IN  STD_LOGIC;
        clk    : IN  STD_LOGIC;
        aclr   : IN  STD_LOGIC;
        o      : OUT STD_LOGIC_VECTOR(out_width-1 DOWNTO 0);
        q      : OUT STD_LOGIC_VECTOR(out_width-1 DOWNTO 0) );
END COMPONENT; --add_b

COMPONENT add_b_stage
  GENERIC( c_has_co       : INTEGER;
           c_has_q        : INTEGER;
           c_enable_rlocs : INTEGER );
  PORT( a0     : IN  STD_LOGIC;
        b0     : IN  STD_LOGIC;
        ci     : IN  STD_LOGIC;
        init_b : IN  STD_LOGIC;
        ce     : IN  STD_LOGIC;
        clk    : IN  STD_LOGIC;
        aclr   : IN  STD_LOGIC;
        co     : OUT STD_LOGIC;
        o      : OUT STD_LOGIC;
        q      : OUT STD_LOGIC );
END COMPONENT; --add_b_stage

COMPONENT cntre_a
    GENERIC (width           : INTEGER RANGE 1 TO 31;
             use_count_to    : BOOLEAN       := FALSE;
             count_to        : INTEGER       := INTEGER'HIGH;
             sync_reset_to   : INTEGER       := 0;
             c_family        : STRING);
    PORT (r        : IN  STD_LOGIC;
          ce       : IN  STD_LOGIC;
          c        : IN  STD_LOGIC;
          sclr     : IN  STD_LOGIC := '0';
          cnt      : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
          tc       : OUT STD_LOGIC);
END COMPONENT; -- cntre_a

COMPONENT cntre_b
    GENERIC (
      c_xdevicefamily : STRING;
      width           : INTEGER RANGE 1 TO 31);
    PORT (
      ce       : IN  STD_LOGIC;
      c        : IN  STD_LOGIC;
      din      : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
      load_bar : IN  STD_LOGIC;
      cnt      : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0) );
END COMPONENT; -- cntre_b

COMPONENT cntre_d
  GENERIC (
    width : INTEGER RANGE 1 TO 31
    );
  PORT (
    ce   : IN  STD_LOGIC;
    c    : IN  STD_LOGIC;
    rclr : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    din  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    load : IN  STD_LOGIC;
    cnt  : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0) );
END COMPONENT; -- cntre_d


COMPONENT comp_eq
  GENERIC (
    c_family      : STRING;
    width         : INTEGER RANGE 1 TO 31;
    comp_val      : INTEGER;
    c_has_sclr    : INTEGER := 0;
    q_mode        : mem_q_type := no_reg; 
    c_sync_enable : INTEGER := c_override);
  PORT (
    i       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    c       : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce      : IN  STD_LOGIC := '1';
    sclr    : IN  STD_LOGIC := '0';
    reset   : IN  STD_LOGIC := '0';
    o       : OUT STD_LOGIC;
    o_reg   : OUT STD_LOGIC);
END COMPONENT; -- comp_eq

COMPONENT comp_neq
  GENERIC (
    c_family  : STRING;
    width     : INTEGER RANGE 1 TO 31;
    comp_val  : INTEGER;
    q_mode    : mem_q_type    := no_reg;
    c_has_r   : BOOLEAN       := FALSE
   );
  PORT (
    i       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    c       : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce      : IN  STD_LOGIC := '1';
    r       : IN  STD_LOGIC := '0'; -- Optional pin to zero output
    o       : OUT STD_LOGIC;
    o_reg   : OUT STD_LOGIC);
END COMPONENT; -- comp_neq

COMPONENT comp_lt
  GENERIC (
    c_family : STRING;
    width    : INTEGER RANGE 1 TO 31;
    comp_val : INTEGER
  );
  PORT (
    i : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    o : OUT STD_LOGIC
  );
END COMPONENT; -- comp_lt

COMPONENT comp_lt_var
  GENERIC (c_family : STRING;
           width    : INTEGER RANGE 0 TO 10;
           mode     : INTEGER RANGE 0 TO 1 := 0;
           c_has_en : INTEGER := 1);
  PORT (a  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        b  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        en : IN  STD_LOGIC;
        o  : OUT STD_LOGIC);
END COMPONENT; -- comp_lt_var

COMPONENT comp_eq_var IS
  GENERIC (width         : INTEGER RANGE 0 TO 32;
           q_mode        : mem_q_type    := no_reg;
           c_has_sclr    : INTEGER       := 0;
           c_sync_enable : INTEGER       := c_override; 
           c_family      : STRING);
  PORT (a       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        b       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        c       : IN  STD_LOGIC := '0'; -- Register pins are optional
        ce      : IN  STD_LOGIC := '1';
        reset   : IN  STD_LOGIC := '0';
        sclr    : IN  STD_LOGIC := '0'; -- Optional pin to zero output
        o       : OUT STD_LOGIC;
        o_reg   : OUT STD_LOGIC);
END COMPONENT; --comp_eq_var

COMPONENT comp_neq_var
    GENERIC (width          : INTEGER RANGE 0 TO 32;
             q_mode         : mem_q_type    := no_reg;
             c_has_r        : BOOLEAN       := FALSE;
             c_family       : STRING );
    PORT (a       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
          b       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
          c       : IN  STD_LOGIC := '0'; -- Register pins are optional
          ce      : IN  STD_LOGIC := '1';
          r       : IN  STD_LOGIC := '0'; -- Optional pin to zero output
          o       : OUT STD_LOGIC;
          o_reg   : OUT STD_LOGIC);
END COMPONENT; -- comp_neq_var

COMPONENT ud_cntre
    GENERIC (
      c_xdevicefamily : STRING;
      width         : INTEGER RANGE 1 TO 31;
      use_count_to  : BOOLEAN       := FALSE;
      count_to      : INTEGER       := INTEGER'HIGH );
    PORT (
      r     : IN  STD_LOGIC;
      ce    : IN  STD_LOGIC;
      c     : IN  STD_LOGIC;
      d_in  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
      load  : IN  STD_LOGIC;
      up_dn : IN  STD_LOGIC;
      cnt   : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
      tc    : OUT STD_LOGIC);
END COMPONENT; -- ud_cntre


END rs_blocks_pkg;








-------------------------------------------------------------------------------- 
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_blocks.vhd,v 1.2 2011/04/11 15:41:16 billw Exp $
--
-- Building blocks for the Reed-Solomon Core
-------------------------------------------------------------------------------- 



-- -------------------------------------------------------------------------------
-- -- Adder building block 
-- -- 1-bit adder with carry-in and optional carry-out.
-- --------------------------------------------------------------------------------
-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;
-- 
-- LIBRARY rs_toolbox_v9_0_3;
-- USE rs_toolbox_v9_0_3.rs_lut_pkg.ALL;
-- 
-- LIBRARY unisim;
-- USE unisim.vcomponents.ALL;
-- 
-- 
-- ENTITY add_stage IS
--     GENERIC( c_has_co : BOOLEAN;
--              userpm   : INTEGER );
--     PORT( a0 : IN  STD_LOGIC;
--           b0 : IN  STD_LOGIC;
--           ci : IN  STD_LOGIC;
--           co : OUT STD_LOGIC;
--           s  : OUT STD_LOGIC );
-- END add_stage;
-- 
-- ARCHITECTURE synth OF add_stage IS
-- 
--   SIGNAL lut_sig : STD_LOGIC;
-- 
-- BEGIN
--    
--   -- lut_sig <= a0 XOR b0;
--   l0 : rs_c_lut 
--   GENERIC MAP (eqn => " I2 @ I3 ", c_enable_rlocs => userpm)
--   PORT MAP( i0    => '0',
--             i1    => '0',
--             i2    => b0,
--             i3    => a0,
--             o     => lut_sig);
--                 
--   
-- 
--   -- Optional carry-out
--   cg : IF c_has_co GENERATE
--   
--     m0 : muxcy
--     PORT MAP( di    => a0,
--               ci    => ci,
--               s     => lut_sig,
--               o     => co );
--   END GENERATE; -- cg
-- 
--   n_cg : IF NOT(c_has_co) GENERATE
--     co <= '0';
--   END GENERATE; -- n_cg
--   
--   
--   x0 : xorcy
--   PORT MAP( li    => lut_sig,
--             ci    => ci,
--             o     => s );
-- 
-- 
-- END synth;





--------------------------------------------------------------------------------
-- Variable width combinatorial adder.
-- Output is 1 bit wider than inputs.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
--USE rs_toolbox_v9_0_3.rs_blocks_pkg.ALL;

ENTITY add_a IS
  GENERIC (
    c_xdevicefamily : STRING;
    w               : INTEGER);
  PORT ( a : IN  STD_LOGIC_VECTOR(w-1 DOWNTO 0);
         b : IN  STD_LOGIC_VECTOR(w-1 DOWNTO 0);
         s : OUT STD_LOGIC_VECTOR(w DOWNTO 0) );
END add_a;


ARCHITECTURE synth OF add_a IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

BEGIN

    sb1 : rs_addsub
    GENERIC MAP (
      c_xdevicefamily => c_xdevicefamily,
      c_a_width       => w,
      c_b_width       => w,
      c_a_type        => c_unsigned,
      c_b_type        => c_unsigned,
      c_out_width     => w+1,
      c_latency       => 0,
      c_add_mode      => c_add)
    PORT MAP (
      a      => a,
      b      => b,
      s      => s);
   
END synth; -- add_a
 










--------------------------------------------------------------------------------
-- Variable width adder 
-- "out_width" can be either equal to "width" or "width"+1.
-- Output <a> + <b>, unless <init_b> is asserted. If <init_b> = '1' then output <b>
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY add_b IS
  GENERIC (in_width       : INTEGER;
           out_width      : INTEGER;
           c_has_q        : INTEGER);
  PORT (a      : IN  STD_LOGIC_VECTOR(in_width-1 DOWNTO 0);
        b      : IN  STD_LOGIC_VECTOR(in_width-1 DOWNTO 0);
        init_b : IN  STD_LOGIC;
        ce     : IN  STD_LOGIC;
        clk    : IN  STD_LOGIC;
        aclr   : IN  STD_LOGIC;
        o      : OUT STD_LOGIC_VECTOR(out_width-1 DOWNTO 0);
        q      : OUT STD_LOGIC_VECTOR(out_width-1 DOWNTO 0) );
END add_b;


ARCHITECTURE synth OF add_b IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  SIGNAL a_final : STD_LOGIC_VECTOR(in_width-1 DOWNTO 0) := (others => '0');
  SIGNAL o_tmp : STD_LOGIC_VECTOR(out_width-1 DOWNTO 0) := (others => '0');
BEGIN
 
  a_final <= a WHEN init_b='0' ELSE (OTHERS=>'0');
  
  o_tmp <= b + a_final;
  o <= o_tmp;
  
  ----------------------------------------------------------------------------
  -- Optional registered output
  qg1 : IF c_has_q /= 0 GENERATE
    ff0 : rs_reg
    GENERIC MAP (c_width=>out_width, c_has_ce=>1, c_has_aclr=>1)
    PORT MAP(d=>o_tmp, ce=>ce, clk=>clk, aclr=>aclr, q=>q);
  END GENERATE; -- qg1
  
  
END synth; -- add_b
 











--------------------------------------------------------------------------------
-- Synchronous binary Up-Counter with clock enable, synchronous clear (sclr) and
-- reset input (r). sclr always overrides ce. r does not override ce.
-- Note that terminal count alway forces counter to 0.
-- i.e. The counter will ALWAYS roll over to 0 once it reaches its count_to value.
-- If a non-zero sync_reset_to value is required then use_count_to must be set
-- to TRUE.
-- count_to must always be >= sync_reset_to
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;


ENTITY cntre_a IS
    GENERIC (width           : INTEGER RANGE 1 TO 31;
             use_count_to    : BOOLEAN       := FALSE;
             count_to        : INTEGER       := INTEGER'HIGH;
             sync_reset_to   : INTEGER       := 0;
             c_family        : STRING);
    PORT (r        : IN  STD_LOGIC;
          ce       : IN  STD_LOGIC;
          c        : IN  STD_LOGIC;
          sclr     : IN  STD_LOGIC := '0';
          cnt      : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
          tc       : OUT STD_LOGIC);
END cntre_a;

ARCHITECTURE synth OF cntre_a IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


--------------------------------------------------------------------------------
-- 
-- Determine if counter must auto-reset and generate a terminal count
-- signal after count_to
--
FUNCTION get_using_count_to(use_count_to : BOOLEAN; count_to : INTEGER)
    RETURN BOOLEAN IS
BEGIN
  IF (use_count_to = TRUE) THEN
    ASSERT (count_to < 2**width)
    REPORT "ERROR: cntre_a - count_to exceeds maximum permitted value."
    SEVERITY FAILURE;
    
    ASSERT (sync_reset_to <= count_to)
    REPORT "ERROR: cntre_a - sync_reset_to must be <= count_to."
    SEVERITY FAILURE;
    
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF; -- use_count_to
END get_using_count_to;

CONSTANT using_count_to : BOOLEAN := get_using_count_to(use_count_to, count_to);
-- 
-- Calculate number of bits required to detect count_to value
--
FUNCTION calc_decode_width(gt_equal_val_nat, max_width : INTEGER)
    RETURN INTEGER IS
    
    VARIABLE ls_1_bit : INTEGER; -- index of least significant 1 bit
    VARIABLE gt_equal_val : STD_LOGIC_VECTOR(max_width-1 DOWNTO 0);
BEGIN
    -- Returns 0 if there are no 1s in compare value
    ls_1_bit := max_width;
    gt_equal_val := int_2_std_logic_vector(gt_equal_val_nat, max_width);
    
    FOR i IN 0 TO max_width-1 LOOP
        IF gt_equal_val(i) = '1' THEN
            ls_1_bit := i;
            EXIT;
        END IF;
    END LOOP;
    
    RETURN (max_width - ls_1_bit);
END calc_decode_width;

CONSTANT decode_width : INTEGER := calc_decode_width(count_to, width);

CONSTANT sync_reset_to_val : STD_LOGIC_VECTOR(width-1 DOWNTO 0)
                                := int_2_std_logic_vector(sync_reset_to, width);
                             
--------------------------------------------------------------------------------
SIGNAL cout   : STD_LOGIC_VECTOR(width DOWNTO 0) := (OTHERS=>'0');
SIGNAL lcnt   : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (OTHERS=>'0');
SIGNAL tc_tmp : STD_LOGIC := '0';

--
-- ARCHITECTURE body
--
BEGIN

  -- cntre_a in pure RTL
  cp1 : PROCESS (c)
  BEGIN
      
    IF rising_edge(c) THEN
    
      IF sclr = '1' THEN
        lcnt <= sync_reset_to_val; -- sync reset to predefined value
        
      ELSIF ce = '1' THEN -- clock enable
      
        IF r = '1' THEN
          lcnt <= sync_reset_to_val; -- load with predefined value
        ELSIF tc_tmp = '1' THEN
          lcnt <= (OTHERS=>'0'); -- roll-over to 0
        ELSE
          lcnt <= lcnt + 1; -- or just count
        END IF; -- tc_tmp
        
      END IF; -- ce
      
    END IF; -- c'EVENT
  END PROCESS;

  
  
    
  cnt <= lcnt;
    

  
  
  ----------------------------------------------------------------------------
  -- Only require terminal count logic if counter must reset prior to natural
  -- rollover or if a tc output is required.
  -- 'tc_tmp' is input signal for counter stages
  tcu : IF using_count_to GENERATE
  BEGIN
    dw0 : IF decode_width = 0 GENERATE
      tc_tmp <= '1'; -- Count to 0
    END GENERATE; -- dw0
    
    
    dw1 : IF decode_width = 1 GENERATE
      tc_tmp <= lcnt(width-1); -- Must be the msb
    END GENERATE; -- dw1
    
    
    gt1 : IF decode_width > 1 GENERATE
      CONSTANT count_to_slv : STD_LOGIC_VECTOR(width-1 DOWNTO 0) :=
                                        int_2_std_logic_vector(count_to, width);
    BEGIN
      -- Must generate 'tc' with a decoder
      -- 'tc' must not go low asynchronously if 'r' input is asserted,
      -- therefore must always use counter q outputs and not rely on
      -- cout.
      tc_tmp <= '1' WHEN lcnt(width-1 DOWNTO width-decode_width) =
                         count_to_slv(width-1 DOWNTO width-decode_width)
                    ELSE '0';
    END GENERATE; -- gt1
    
  END GENERATE; -- tcu
  
  
  ntc : IF NOT(using_count_to) GENERATE
    tc_tmp <= '0';
  END GENERATE; -- ntc
  
  tc <= tc_tmp;

END synth; -- cntre_a


 
 
 
 
 





--------------------------------------------------------------------------------
-- Synchronous binary Up-Counter with clock enable and load
-- Note that load input is active low.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_unsigned.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

ENTITY cntre_b IS
    GENERIC (
      c_xdevicefamily : STRING;
      width           : INTEGER RANGE 1 TO 31);
    PORT (
      ce       : IN  STD_LOGIC;
      c        : IN  STD_LOGIC;
      din      : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
      load_bar : IN  STD_LOGIC;
      cnt      : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0) );
END cntre_b;

ARCHITECTURE synth OF cntre_b IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

    
  ------------------------------------------------------------------------------
  SIGNAL load : STD_LOGIC := '0';
--  SIGNAL lcnt : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (OTHERS=>'0');
  ------------------------------------------------------------------------------
    
BEGIN

  c1 : rs_counter
  GENERIC MAP (
    c_xdevicefamily => c_xdevicefamily,
    c_width         => width,
    use_count_to    => FALSE,
    count_to        => 0,
    c_count_mode    => c_up,
    c_has_load      => 1,
    c_has_ce        => 1,
    c_sync_enable   => c_override)
  PORT MAP (
    clk     => c,
    ce      => ce,
    l       => din,
    load    => load,
    up      => '1',
    q       => cnt);
    
  load <= NOT(load_bar);
    
--   -- cntre_b in pure RTL
--   cp1 : PROCESS (c, clr)
--   BEGIN
--     IF rising_edge(c) THEN
--     
--       IF ce = '1' THEN -- clock enable
--       
--         IF load_bar = '0' THEN
--           lcnt <= din; -- Active low load
--         ELSE
--           lcnt <= lcnt + 1; -- or just count
--         END IF; -- tc_tmp
--         
--       END IF; -- ce
--       
--     END IF; -- rising_edge(c)
--   END PROCESS;
--    
--  cnt <= lcnt;
  
  
END synth; -- cntre_b




 
 



--------------------------------------------------------------------------------
-- Synchronous binary Up/Down-Counter with clock enable, load and synchronous clear.
--
-- The following ports are provided:

-- r : synchronous reset, always overridden by clock enable (ce)
-- ce : clock enable
-- c : clock
-- d_in : value to be loaded into counter when <load> asserted
-- load : d_in is loaded into counter when <load> asserted high. <r> overrides <load>
-- up_dn : '1' to count up, '0' to count down
-- cnt : the output count value
-- tc : high when <count_to> value reached
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY ud_cntre IS
    GENERIC (
      c_xdevicefamily : STRING;
      width           : INTEGER RANGE 1 TO 31;
      use_count_to    : BOOLEAN       := FALSE;
      count_to        : INTEGER       := INTEGER'HIGH );
    PORT (
      r     : IN  STD_LOGIC;
      ce    : IN  STD_LOGIC;
      c     : IN  STD_LOGIC;
      d_in  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
      load  : IN  STD_LOGIC;
      up_dn : IN  STD_LOGIC;
      cnt   : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
      tc    : OUT STD_LOGIC);
END ud_cntre;

ARCHITECTURE synth OF ud_cntre IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  -- 
  -- Determine if counter must auto-reset and generate a terminal count
  -- signal after count_to
  --
  FUNCTION get_using_count_to(use_count_to : BOOLEAN; count_to : INTEGER)
      RETURN BOOLEAN IS
  BEGIN
      IF (use_count_to = TRUE) THEN
          ASSERT (count_to < 2**width)
          REPORT "ERROR: ud_cntre - count_to exceeds maximum permitted value."
          SEVERITY FAILURE;
          
          RETURN TRUE;
      ELSE
          RETURN FALSE;
      END IF;
  END get_using_count_to;
    
  CONSTANT using_count_to : BOOLEAN := get_using_count_to(use_count_to, count_to);
--------------------------------------------------------------------------------
BEGIN

  c1 : rs_counter
  GENERIC MAP (
    c_xdevicefamily => c_xdevicefamily,
    c_width         => width,
    use_count_to    => using_count_to,
    count_to        => count_to,
    c_count_mode    => c_updown,
    c_has_load      => 1,
    c_has_ce        => 1,
    c_has_sclr      => 1,
    c_sync_enable   => c_no_override, -- <ce> overrides <r>
    c_has_thresh0   => 1)
  PORT MAP (
    clk     => c,
    ce      => ce,
    sclr    => r,
    l       => d_in,
    load    => load,
    up      => up_dn,
    q       => cnt,
    thresh0 => tc);
    
END synth; -- ud_cntre

 




--------------------------------------------------------------------------------
-- Synchronous binary Down-Counter with clock enable, load and synchronous clear.
-- sclr overrides ce, rclr also clears counter but does not override ce or load.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cntre_d IS
  GENERIC (
    width : INTEGER RANGE 1 TO 31
    );
  PORT (
    ce   : IN  STD_LOGIC;
    c    : IN  STD_LOGIC;
    rclr : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    din  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    load : IN  STD_LOGIC;
    cnt  : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0) );
END cntre_d;

ARCHITECTURE synth OF cntre_d IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  SIGNAL lcnt : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (OTHERS=>'0');
BEGIN

  cp1 : PROCESS (c)
  BEGIN
      
    IF rising_edge(c) THEN
      IF sclr = '1' THEN
        lcnt <= (OTHERS=>'0'); -- sync reset to 0 regardless of ce
        
      ELSIF ce = '1' THEN -- clock enable
        IF load = '1' THEN
          lcnt <= din; -- load din into counter
        ELSIF rclr = '1' THEN
          lcnt <= (OTHERS=>'0'); -- reset to 0 if ce='1'
        ELSE
          lcnt <= lcnt - 1; -- or just count
        END IF; -- tc_tmp
        
      END IF; -- ce
      
    END IF; -- c'EVENT
  END PROCESS;
   
 cnt <= lcnt;
  
END synth; -- cntre_d
 
 

--------------------------------------------------------------------------------
-- Equality Comparator
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

ENTITY comp_eq IS
  GENERIC (
    c_family      : STRING;
    width         : INTEGER RANGE 1 TO 31;
    comp_val      : INTEGER;
    c_has_sclr    : INTEGER := 0;
    q_mode        : mem_q_type := no_reg;
    c_sync_enable : INTEGER := c_override);
  PORT (
    i       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    c       : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce      : IN  STD_LOGIC := '1';
    sclr    : IN  STD_LOGIC := '0';
    reset   : IN  STD_LOGIC := '0';
    o       : OUT STD_LOGIC;
    o_reg   : OUT STD_LOGIC);
END comp_eq;

ARCHITECTURE synth OF comp_eq IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT comp_string : STRING := int_2_logic_string(comp_val, width);
  CONSTANT has_a_eq_b  : INTEGER := boolean'pos(q_mode /= reg);
  CONSTANT has_qa_eq_b : INTEGER := boolean'pos(q_mode /= no_reg);
  
  SIGNAL a_eq_b  : STD_LOGIC := '0';
  SIGNAL qa_eq_b : STD_LOGIC := '0';
  
BEGIN

  c0: rs_compare
  GENERIC MAP(
    c_family      => c_family,
    instance_name => "comp_eq/c0",
    c_width       => width,
    c_b_constant  => 1,
    c_b_value     => comp_string,
    c_has_a_eq_b  => has_a_eq_b,
    c_has_qa_eq_b => has_qa_eq_b,
    c_has_ce      => has_qa_eq_b,
    c_has_aclr    => has_qa_eq_b,
    c_has_sclr    => c_has_sclr,
    c_sync_enable => c_sync_enable)
  PORT MAP(
    a       => i,
    b       => i, -- not used
    clk     => c,
    ce      => ce,
    aclr    => reset,
    sclr    => sclr,
    a_eq_b  => a_eq_b,
    qa_eq_b => qa_eq_b);
    
    
  ------------------------------------------------------------------------------
  -- Optional registered output
  nr : IF q_mode = no_reg GENERATE
    o     <= a_eq_b;
    o_reg <= a_eq_b;
  END GENERATE; -- no_reg
  
  ranr : IF q_mode = reg_and_no_reg GENERATE
    o     <= a_eq_b;
    o_reg <= qa_eq_b;
  END GENERATE; -- reg_and_no_reg                
  
  rg : IF q_mode = reg GENERATE
    o     <= qa_eq_b;
    o_reg <= qa_eq_b;
  END GENERATE; -- rg
 
END synth; -- comp_eq





--------------------------------------------------------------------------------
-- Inequality Comparator
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

ENTITY comp_neq IS
  GENERIC (
    c_family  : STRING;
    width     : INTEGER RANGE 1 TO 31;
    comp_val  : INTEGER;
    q_mode    : mem_q_type    := no_reg;
    c_has_r   : BOOLEAN       := FALSE
   );
  PORT (
    i       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    c       : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce      : IN  STD_LOGIC := '1';
    r       : IN  STD_LOGIC := '0'; -- Optional pin to zero output
    o       : OUT STD_LOGIC;
    o_reg   : OUT STD_LOGIC);
END comp_neq;

ARCHITECTURE synth OF comp_neq IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT comp_string : STRING := int_2_logic_string(comp_val, width);
  CONSTANT has_a_ne_b  : INTEGER := boolean'pos(q_mode /= reg);
  CONSTANT has_qa_ne_b : INTEGER := boolean'pos(q_mode /= no_reg);
  CONSTANT has_sclr    : INTEGER := boolean'pos(c_has_r);
  
  SIGNAL a_ne_b  : STD_LOGIC := '0';
  SIGNAL qa_ne_b : STD_LOGIC := '0';
BEGIN

  c0: rs_compare
  GENERIC MAP(
    c_family      => c_family,
    instance_name => "comp_neq/c0",
    c_width       => width,
    c_b_constant  => 1,
    c_b_value     => comp_string,
    c_has_a_ne_b  => has_a_ne_b,
    c_has_qa_ne_b => has_qa_ne_b,
    c_has_ce      => has_qa_ne_b,
    c_has_sclr    => has_sclr)
  PORT MAP(
    a       => i,
    b       => i, -- not used
    clk     => c,
    ce      => ce,
    sclr    => r,
    a_ne_b  => a_ne_b,
    qa_ne_b => qa_ne_b);
    
    
  ------------------------------------------------------------------------------
  -- Optional registered output
  nr : IF q_mode = no_reg GENERATE
    o     <= a_ne_b;
    o_reg <= a_ne_b;
  END GENERATE; -- no_reg
  
  ranr : IF q_mode = reg_and_no_reg GENERATE
    o     <= a_ne_b;
    o_reg <= qa_ne_b;
  END GENERATE; -- reg_and_no_reg                
  
  rg : IF q_mode = reg GENERATE
    o     <= qa_ne_b;
    o_reg <= qa_ne_b;
  END GENERATE; -- rg
 
   
--   a0: gate_and
--   GENERIC MAP(width=>width, mask=>comp_val,
--               invout=>TRUE, q_mode=>q_mode, c_has_r=>c_has_r)
--   PORT MAP(inp=>i, r=>r, c=>c, ce=>ce, reset=>reset, o=>o, o_reg=>o_reg);
    
END synth; -- comp_neq









--------------------------------------------------------------------------------
-- Unsigned binary Less Than Comparator 
-- Compares against fixed value supplied as a GENERIC.
-- Compare value must be less than 2^width
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY comp_lt IS
  GENERIC (
    c_family : STRING;
    width    : INTEGER RANGE 1 TO 31;
    comp_val : INTEGER
  );
  PORT (
    i : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    o : OUT STD_LOGIC
  );
END comp_lt;

ARCHITECTURE synth OF comp_lt IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  ------------------------------------------------------------------------------
  -- Check to see if 'i' will always be less than 'comp_val'
  FUNCTION check_comp_val RETURN BOOLEAN IS
  BEGIN

    --ASSERT FALSE
    --  REPORT "comp_lt: comp_val = " & INTEGER'IMAGE(comp_val) &
    --         " width = " & INTEGER'IMAGE(width)
    --  SEVERITY NOTE;

    IF bitsneededtorepresent(comp_val) > width THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
  END check_comp_val;
  
  CONSTANT o_always_hi : BOOLEAN := check_comp_val;
  
  
  ------------------------------------------------------------------------------
  -- Need all bits down to and including ls '1' bit
  FUNCTION calc_ls_comp_bit (comp_vec : BIT_VECTOR;
                             width    : INTEGER) RETURN INTEGER IS
    VARIABLE ls_comp_bit : INTEGER;
  BEGIN
    ls_comp_bit := width;
    
    FOR bit IN 0 TO width-1 LOOP
        IF comp_vec(bit+comp_vec'LOW) = '1' THEN
            ls_comp_bit := bit;
            EXIT;
        END IF; -- comp_vec
    END LOOP; -- bit
    
    RETURN ls_comp_bit;
  END calc_ls_comp_bit;
    
    
  CONSTANT comp_vec : BIT_VECTOR(width-1 DOWNTO 0) :=
                                       natural_to_bit_vector(comp_val, width);
  CONSTANT ls_comp_bit : INTEGER := calc_ls_comp_bit(comp_vec, width);
  
  
  ----------------------------------------------------------------------------
  -- Find number of bits required to do comparison
  FUNCTION calc_num_bits RETURN INTEGER IS
  BEGIN
      IF o_always_hi THEN
          RETURN 0;
      ELSE
          RETURN (width - ls_comp_bit);
      END IF; -- o_always_hi
  END calc_num_bits;
      
  CONSTANT num_bits : INTEGER := calc_num_bits;
  
--
-- ARCHITECTURE body
--
BEGIN
  ------------------------------------------------------------------------------
  -- Degenerate case
  w0 : IF num_bits = 0 GENERATE
    eq1 : IF o_always_hi GENERATE
        o <= '1'; -- Caused by comp_val being larger than max value of 'i'
    END GENERATE; -- eq1
    
    eq0 : IF NOT(o_always_hi) GENERATE
        o <= '0'; -- Caused by comp_val = 0
    END GENERATE; -- eq0
  END GENERATE; -- w0
  
  
  ------------------------------------------------------------------------------
  ne0 : IF num_bits /= 0 GENERATE
    
    -- Note XST doesn't work with unbound STRINGs here: CR231479
    CONSTANT comp_string_wide : STRING(width DOWNTO 1) :=
                                            int_2_logic_string(comp_val, width);

    CONSTANT comp_string : STRING(num_bits DOWNTO 1) :=
                                   comp_string_wide(width DOWNTO ls_comp_bit+1);
  BEGIN
    
    c0: rs_compare
    GENERIC MAP(
      c_family      => c_family,
      instance_name => "comp_lt/c0",
      c_width       => num_bits,
      c_b_constant  => 1,
      c_b_value     => comp_string,
      c_has_a_lt_b  => 1)
    PORT MAP(
      a      => i(width-1 DOWNTO ls_comp_bit),
      b      => i(width-1 DOWNTO ls_comp_bit), -- not used
      a_lt_b => o);

  END GENERATE; -- ne0
    
END synth; -- comp_lt





    
    


--------------------------------------------------------------------------------
-- Unsigned binary less-than comparator 
-- mode = 0 => less than. i.e. o hi if A < B, except lo if en = '0'.
-- mode = 1 => less than or equal to. i.e. o hi if A <= B, except lo if en = '0'
-- A and B must be the same width.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY comp_lt_var IS
  GENERIC (c_family : STRING;
           width    : INTEGER RANGE 0 TO 10;
           mode     : INTEGER RANGE 0 TO 1 := 0;
           c_has_en : INTEGER := 1);
  PORT (a  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        b  : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        en : IN  STD_LOGIC;
        o  : OUT STD_LOGIC);
END comp_lt_var;

ARCHITECTURE synth OF comp_lt_var IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

BEGIN
  ------------------------------------------------------------------------------
  -- Degenerate case if width = 0
  w0 : IF width = 0 GENERATE
    o <= en;
  END GENERATE; -- w0

  ne0 : IF width /= 0 GENERATE
    
    SIGNAL a_lt_b : STD_LOGIC := '0';
    SIGNAL a_le_b : STD_LOGIC := '0';
  BEGIN
  
    c0: rs_compare
    GENERIC MAP(
      c_family      => c_family,
      instance_name => "comp_lt_var/c0",
      c_width       => width,
      c_has_a_lt_b  => bool_to_int(mode=0),
      c_has_a_le_b  => bool_to_int(mode/=0))
    PORT MAP(
      a      => a,
      b      => b,
      a_lt_b => a_lt_b,
      a_le_b => a_le_b);
      
    
    og1a : IF c_has_en=0 GENERATE
      og1 : IF mode = 0 GENERATE
        o <= a_lt_b;
      END GENERATE; -- og1
  
      og2 : IF mode /= 0 GENERATE
        o <= a_le_b;
      END GENERATE; -- og2
    END GENERATE; -- og1a
  
    og2a : IF c_has_en/=0 GENERATE
      og1 : IF mode = 0 GENERATE
        o <= a_lt_b AND en;
      END GENERATE; -- og1
  
      og2 : IF mode /= 0 GENERATE
        o <= a_le_b AND en;
      END GENERATE; -- og2
    END GENERATE; -- og2a
  
  
--     -- RTL version
--     og1 : IF mode = 0 GENERATE
--       o <= '1' WHEN ((a < b) AND en = '1') ELSE '0';
--     END GENERATE; -- og1
--  
--     og2 : IF mode /= 0 GENERATE
--       o <= '1' WHEN ((a <= b) AND en = '1') ELSE '0';
--     END GENERATE; -- og2
    
  END GENERATE; -- ne0

END synth; -- comp_lt_var




    
    

               

--------------------------------------------------------------------------------
-- Unsigned variable width binary Inequality Comparator 
-- Output high if A/=B
-- A and B must be the same width
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY comp_neq_var IS
  GENERIC (width          : INTEGER RANGE 0 TO 32;
           q_mode         : mem_q_type    := no_reg;
           c_has_r        : BOOLEAN       := FALSE;
           c_family       : STRING);
  PORT (a       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        b       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        c       : IN  STD_LOGIC := '0'; -- Register pins are optional
        ce      : IN  STD_LOGIC := '1';
        r       : IN  STD_LOGIC := '0'; -- sclr
        o       : OUT STD_LOGIC;
        o_reg   : OUT STD_LOGIC);
END comp_neq_var;

ARCHITECTURE synth OF comp_neq_var IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT has_a_ne_b  : INTEGER := boolean'pos(q_mode /= reg);
  CONSTANT has_qa_ne_b : INTEGER := boolean'pos(q_mode /= no_reg);
  CONSTANT has_sclr    : INTEGER := boolean'pos(c_has_r);
  
  SIGNAL a_ne_b  : STD_LOGIC := '0';
  SIGNAL qa_ne_b : STD_LOGIC := '0';
BEGIN
  
  ------------------------------------------------------------------------------
  -- Degenerate case if width = 0
  --
  w0 : IF width = 0 GENERATE
    -- No point putting any register on the output
    o     <= '0';
    o_reg <= '0';
  END GENERATE; -- w0
  
  ------------------------------------------------------------------------------
  --
  ne0 : IF width /= 0 GENERATE
  
    c0: rs_compare
    GENERIC MAP(
      c_family      => c_family,
      instance_name => "comp_neq_var/c0",
      c_width       => width,
      c_has_a_ne_b  => has_a_ne_b,
      c_has_qa_ne_b => has_qa_ne_b,
      c_has_ce      => has_qa_ne_b,
      c_has_sclr    => has_sclr)
    PORT MAP(
      a       => a,
      b       => b,
      clk     => c,
      ce      => ce,
      sclr    => r,
      a_ne_b  => a_ne_b,
      qa_ne_b => qa_ne_b);
    
    
    ----------------------------------------------------------------------------
    -- Optional registered output
    nr : IF q_mode = no_reg GENERATE
      o     <= a_ne_b;
      o_reg <= a_ne_b;
    END GENERATE; -- no_reg
    
    ranr : IF q_mode = reg_and_no_reg GENERATE
      o     <= a_ne_b;
      o_reg <= qa_ne_b;
    END GENERATE; -- reg_and_no_reg                
    
    rg : IF q_mode = reg GENERATE
      o     <= qa_ne_b;
      o_reg <= qa_ne_b;
    END GENERATE; -- rg
 
  
  END GENERATE; -- ne0

END synth; -- comp_neq_var






--------------------------------------------------------------------------------
-- Unsigned variable width binary Equality Comparator 
-- Output high if A=B
-- A and B must be the same width
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY comp_eq_var IS
  GENERIC (width         : INTEGER RANGE 0 TO 32;
           q_mode        : mem_q_type    := no_reg;
           c_has_sclr    : INTEGER       := 0;
           c_sync_enable : INTEGER       := c_override; 
           c_family      : STRING); 
  PORT (a       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        b       : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
        c       : IN  STD_LOGIC := '0'; -- Register pins are optional
        ce      : IN  STD_LOGIC := '1';
        reset   : IN  STD_LOGIC := '0';
        sclr    : IN  STD_LOGIC := '0';
        o       : OUT STD_LOGIC;
        o_reg   : OUT STD_LOGIC);
END comp_eq_var;

ARCHITECTURE synth OF comp_eq_var IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT has_a_eq_b  : INTEGER := bool_to_int(q_mode /= reg);
  CONSTANT has_qa_eq_b : INTEGER := bool_to_int(q_mode /= no_reg);
  
  SIGNAL a_eq_b  : STD_LOGIC := '0';
  SIGNAL qa_eq_b : STD_LOGIC := '0';
BEGIN

  ----------------------------------------------------------------------------
  -- Degenerate case if width = 0
  --
  w0 : IF width = 0 GENERATE
    -- No point putting any register on the output
    o     <= '0';
    o_reg <= '0';
  END GENERATE; -- w0
  
  ----------------------------------------------------------------------------
  --
  ne0 : IF width /= 0 GENERATE
  
    c0: rs_compare
    GENERIC MAP(
      c_family      => c_family,
      instance_name => "comp_eq_var/c0",
      c_width       => width,
      c_has_a_eq_b  => has_a_eq_b,
      c_has_qa_eq_b => has_qa_eq_b,
      c_has_ce      => has_qa_eq_b,
      c_sync_enable => c_sync_enable,
      c_has_aclr    => has_qa_eq_b,
      c_has_sclr    => c_has_sclr)
    PORT MAP(
      a       => a,
      b       => b,
      clk     => c,
      ce      => ce,
      aclr    => reset,
      sclr    => sclr,
      a_eq_b  => a_eq_b,
      qa_eq_b => qa_eq_b);
    
    
    ----------------------------------------------------------------------------
    -- Optional registered output
    nr : IF q_mode = no_reg GENERATE
      o     <= a_eq_b;
      o_reg <= a_eq_b;
    END GENERATE; -- no_reg
    
    ranr : IF q_mode = reg_and_no_reg GENERATE
      o     <= a_eq_b;
      o_reg <= qa_eq_b;
    END GENERATE; -- reg_and_no_reg                
    
    rg : IF q_mode = reg GENERATE
      o     <= qa_eq_b;
      o_reg <= qa_eq_b;
    END GENERATE; -- rg
 
        
  END GENERATE; -- ne0

END synth; -- comp_eq_var





------------------------------------------------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_ifx_slave.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
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
--  Title: rs_ifx_slave.vhd
--  Description: Interface-X like slave interface with SRL FIFO
--               This is a modified copy of the axi_utils_v2_0_3 glb_ifx_slave.vhd. The only difference is that
--               ifx_ready is forced low when areset is asserted.
--
--  Note that the aclken input *only* affects the IFX side of the interface (ifx_valid, ifx_data and ifx_ready)
--  The local interfaces run directly from the ungated aclk.
--
------------------------------------------------------------------------------------------------------------------------
-- Must keep following line blank for NaturalDocs to distinguish the header


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;
use axi_utils_v2_0_3.axi_utils_comps.all;

entity rs_ifx_slave is
  generic (
    WIDTH : positive := 8;          --Width of FIFO in bits
    DEPTH : positive := 16;         --Depth of FIFO in words
    
    HAS_UVPROT : boolean := false;  --True if FIFO has underflow protection (i.e. rd_enable to an empty FIFO is safe)
    HAS_IFX    : boolean := false;  --True if FIFO has AXI compatible output (note that this also sets HAS_UVPROT=true)

    AEMPTY_THRESH0 : natural := 0;  --Almost empty deassertion threshold
    --  aempty deasserted as count goes from AEMPTY_THRESH0 to AEMPTY_THRESH0+1
    AEMPTY_THRESH1 : natural := 0   --Almost empty assertion threshold
    --  aempty asserted as count goes from AEMPTY_THRESH1 to AEMPTY_THRESH1-1
    --If AEMPTY_THRESH1 and AEMPTY_THRESH0 are both zero, aempty/not_aempty are disabled
    );
  port (
    aclk   : in std_logic :='0' ;
    aclken : in std_logic := '1'; --Note that this *only* applies to the ifx_valid, ifx_ready and ifx_data ports
    areset : in std_logic :='0';

    --Interface X slave interface
    ifx_valid : in  std_logic :='0'; --True when master is sending data
    ifx_ready : out std_logic; --True when slave is receiving data
    ifx_data  : in  std_logic_vector(WIDTH-1 downto 0) := (others => '0'); --Data from master (valid when ifx_valid and ifx_ready asserted)

    --Read interface
    rd_enable : in  std_logic :='0';  --True to read data
    rd_avail  : out std_logic;  --True when rd_data is available
    rd_valid  : out std_logic;  --True when rd_data is available and valid (i.e. has been read)
    rd_data   : out std_logic_vector(WIDTH-1 downto 0);  --Read data (only valid when rd_avail asserted)

    --FIFO status
    full       : out std_logic;  --FIFO full
    empty      : out std_logic;  --FIFO empty
    aempty     : out std_logic;  --FIFO almost empty
    not_full   : out std_logic;  --FIFO not full (logical inverse of full)
    not_empty  : out std_logic;  --FIFO not empty (logical inverse of empty)
    not_aempty : out std_logic;  --FIFO not almost empty (logical inverse of aempty)
    wr_enable  : out std_logic;  --High when FIFO is being written. Can change when aclken=0.
    add        : out signed(GLB_log2(DEPTH+1)-1 downto 0)  --Read address of SRL (this is always FIFO count-1)
    );

end entity;

------------------------------------------------------------------------------------------------------------------------
architecture xilinx of rs_ifx_slave is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  signal not_afull : std_logic := '0';

  signal fifo_wr_enable_1 : std_logic                          := '0';
  signal fifo_wr_data_1   : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal ifx_ready_1      : std_logic                          := '0';

begin

  ------------------------------------------------------------------------------------------------------------------------
  assumptions : block
  begin
    assert DEPTH >= 4
      report "ERROR:DEPTH must be >=4"
      severity failure;
  end block;

  ------------------------------------------------------------------------------------------------------------------------
  io : block
  begin
    ifx_ready <= ifx_ready_1;
    wr_enable <= fifo_wr_enable_1;
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

  ------------------------------------------------------------------------------
  --Slave engine
  regProc : process (aclk)
  begin
    if rising_edge(aclk) then
      fifo_wr_enable_1 <= aclken and (ifx_valid and ifx_ready_1 and not areset);
      fifo_wr_data_1   <= ifx_data;
      -- Adding "...and not areset" is the only change to the axi_utils_v2_0_3 version of this file
      ifx_ready_1      <= GLB_if(aclken, not_afull, ifx_ready_1) and not areset;
    end if;
  end process;
  
  
end architecture;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/syncmem.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--  Description: Parameterized Single Port Synchronous memory
--  This memory provides registered and unregistered outputs. The unregistered
--  output can only be used with distributed memory.
--
--  **** IMPORTANT NOTE -  if the ROM is < 16 words deep, the mif file must
--  still have 16 locations worth of data with data being repeated. e.g.
--  depth = 4 : mif contents = 0123012301230123, where 0 is the initial
--  data for location 0, 1 is the initial data for location 1, etc.
--  depth = 8 : mif contents = 0123456701234567
--
--------------------------------------------------------------------------------
LIBRARY std;
USE std.standard.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY syncmem IS  
  GENERIC (
    width             : INTEGER;
    reqd_depth        : INTEGER;
    memstyle          : mem_style_type;
    c_has_ce          : INTEGER;
    c_has_we          : INTEGER;
    init_file         : STRING         := "null.mif";
    q_mode            : mem_q_type     := def_mem_q_type;
    debug_string      : STRING         := "dummy string";
    c_elaboration_dir : STRING;
    c_xdevicefamily   : STRING;
    c_family          : STRING );
  PORT (
    a     : IN  STD_LOGIC_VECTOR(bitsneededtorepresent(reqd_depth-1)-1 DOWNTO 0);
    d     : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    we    : IN  STD_LOGIC;
    c     : IN  STD_LOGIC;
    ce    : IN  STD_LOGIC;
    q     : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    q_reg : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0) );
END syncmem;


ARCHITECTURE synth OF syncmem IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  ------------------------------------------------------------------------------
  CONSTANT style : mem_style_type :=get_mem_style(memstyle, q_mode, reqd_depth);
  
  CONSTANT depth    : INTEGER := calc_depth(reqd_depth, style);
  CONSTANT adrwid   : INTEGER := bitsneededtorepresent(depth-1);
  
  CONSTANT read_mif : INTEGER := select_val(1, 0, c_has_we);
  CONSTANT mem_type : INTEGER := select_val(c_rom, c_sp_ram, c_has_we);
      
  SIGNAL int_addr   : STD_LOGIC_VECTOR(adrwid-1 DOWNTO 0) := (others => '0');
  SIGNAL q_reg_tmp  : STD_LOGIC_VECTOR(width-1 DOWNTO 0)  := (others => '0');
  
  ------------------------------------------------------------------------------
  FUNCTION print_debug RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT " syncmem : " & new_line &
        "   width = " & integer'image(width) & new_line &
        "   adrwid = " & integer'image(adrwid) & new_line &
        "   reqd_depth = " & integer'image(reqd_depth) & new_line &
        "   depth = " & integer'image(depth) & new_line &
        "   c_has_ce = " & integer'image(c_has_ce) & new_line &
        "   c_has_we = " & integer'image(c_has_we) & new_line &
        "   init_file = " & init_file & new_line &
        new_line
      SEVERITY NOTE;
        
    RETURN TRUE;
  END print_debug;
  
--CONSTANT do_print_debug : BOOLEAN := print_debug;


 
-------------------------------------------------------------------------------
-- Architecture body
-------------------------------------------------------------------------------
BEGIN

  ----------------------------------------------------------------------------
  -- Pad address bus with dummy zeros if memory has been enlarged by
  -- calc_depth function
  ag : FOR bit IN 0 TO adrwid-1 GENERATE
    b : IF bit <= a'HIGH GENERATE
      int_addr(bit) <= a(bit);
    END GENERATE; -- b
    
    z : IF bit > a'HIGH GENERATE
      int_addr(bit) <= '0';
    END GENERATE; -- z
    
  END GENERATE; -- ag

  ----------------------------------------------------------------------------
  bg : IF style = block_mem GENERATE

    -- Instantiate single port block memory
    m0: rs_mem
    GENERIC MAP (
      c_family           => c_family,
      c_xdevicefamily    => c_xdevicefamily,
      c_elaboration_dir  => c_elaboration_dir,
      c_memstyle         => block_mem,
      c_addr_width       => adrwid,
      c_depth            => depth,
      c_width            => width,
      c_has_dout_a       => 1,
      c_has_dout_b       => 0,
      c_has_en           => c_has_ce,
      c_has_we           => c_has_we,
      c_mem_init_file    => init_file,
      c_mem_type         => mem_type,
      c_read_mif         => read_mif)
    PORT MAP (
      addra   => int_addr,
      addrb   => int_addr, -- Not used
      d       => d,
      clk     => c,
      en      => ce,
      we      => we,
      dout_a  => q_reg_tmp,
      dout_b  => OPEN);
  
    -- Block memory is ALWAYS registered
    q     <= q_reg_tmp;
    q_reg <= q_reg_tmp;
  
  END GENERATE; -- bg
  
  ------------------------------------------------------------------------------
  dg : IF style = dist_mem GENERATE
    
    SIGNAL q_tmp : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => '0');
  BEGIN
  
    m0 : rs_distributed_mem
    GENERIC MAP(
      c_elaboration_dir => c_elaboration_dir,
      c_addr_width      => adrwid,
      c_depth           => depth,
      c_has_spo         => BOOLEAN'POS(q_mode /= reg),
      c_has_qspo        => BOOLEAN'POS(q_mode /= no_reg),
      c_has_dpo         => 0,
      c_has_qdpo        => 0,
      c_mem_init_file   => init_file,
      c_load_init_file  => read_mif,
      c_width           => width,
      c_mem_type        => mem_type)
    PORT MAP(
      addra    => int_addr,
      addrb    => int_addr, -- Not used
      din      => d,
      we       => we,
      en       => ce,
      clk      => c,
      spo      => q_tmp,
      qspo     => q_reg_tmp,
      dpo      => OPEN,
      qdpo     => OPEN );
        
                       
    -- Handle optional registered output
    ng : IF q_mode = no_reg GENERATE
        q     <= q_tmp;
        q_reg <= q_tmp;
    END GENERATE; -- ng
    
    rg : IF q_mode = reg GENERATE
        q     <= q_reg_tmp;
        q_reg <= q_reg_tmp;
    END GENERATE; -- rg
        
    rng : IF q_mode = reg_and_no_reg GENERATE
        q     <= q_tmp;
        q_reg <= q_reg_tmp;
    END GENERATE; -- rng
        
  END GENERATE; -- dg
  
END synth;







--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/dp_syncmem.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--  Description: Parameterized Dual Port Synchronous distributed memory
--
--  **** IMPORTANT NOTE -  if the ROM is < 16 words deep, the mif file must
--  still have 16 locations worth of data with data being repeated. e.g.
--  depth = 4 : mif contents = 0123012301230123, where 0 is the initial
--  data for location 0, 1 is the initial data for location 1, etc.
--  depth = 8 : mif contents = 0123456701234567
--
--------------------------------------------------------------------------------
LIBRARY std, ieee;
USE std.standard.ALL;
USE ieee.std_logic_1164.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;


ENTITY dp_syncmem IS  
  GENERIC (
    width              : INTEGER;
    reqd_depth         : INTEGER;
    c_has_ce           : INTEGER;
    c_has_we           : INTEGER;
    init_file          : STRING := "null.mif";
    debug_string       : STRING := "dummy string";
    c_elaboration_dir  : STRING;
    c_family           : STRING );
  PORT (
    rd_addr  : IN  STD_LOGIC_VECTOR(bitsneededtorepresent(reqd_depth-1)-1 DOWNTO 0);
    wr_addr  : IN  STD_LOGIC_VECTOR(bitsneededtorepresent(reqd_depth-1)-1 DOWNTO 0);
    d        : IN  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    we       : IN  STD_LOGIC;
    clk      : IN  STD_LOGIC;
    ce       : IN  STD_LOGIC;
    q        : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    q_reg    : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0) );
END dp_syncmem;

ARCHITECTURE synth OF dp_syncmem IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  CONSTANT depth    : INTEGER := calc_depth(reqd_depth, dist_mem);
  CONSTANT adrwid   : INTEGER := bitsneededtorepresent(depth-1);
  
  SIGNAL int_rd_addr   : STD_LOGIC_VECTOR(adrwid-1 DOWNTO 0) := (others => '0');
  SIGNAL int_wr_addr   : STD_LOGIC_VECTOR(adrwid-1 DOWNTO 0) := (others => '0');
  SIGNAL spo_dummy     : STD_LOGIC_VECTOR(width-1 DOWNTO 0)  := (others => '0');    
  SIGNAL qspo_dummy    : STD_LOGIC_VECTOR(width-1 DOWNTO 0)  := (others => '0');    
  SIGNAL spra_dummy    : STD_LOGIC_VECTOR(adrwid-1 DOWNTO 0) := (OTHERS=>'0');
  
  ------------------------------------------------------------------------------
  FUNCTION print_debug RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT " dp_syncmem : " & new_line &
        "   width = " & integer'image(width) & new_line &
        "   adrwid = " & integer'image(adrwid) & new_line &
        "   reqd_depth = " & integer'image(reqd_depth) & new_line &
        "   depth = " & integer'image(depth) & new_line &
        "   c_has_ce = " & integer'image(c_has_ce) & new_line &
        "   c_has_we = " & integer'image(c_has_we) & new_line &
        "   c_family = " & c_family & new_line &
        "   init_file = " & init_file & new_line &
        new_line
      SEVERITY NOTE;
        
    RETURN TRUE;                                            
  END print_debug;
  
--CONSTANT do_print_debug : BOOLEAN := print_debug;


 
-------------------------------------------------------------------------------
-- Architecture body
-------------------------------------------------------------------------------
BEGIN

  ----------------------------------------------------------------------------
  -- Pad address bus with dummy zeros if memory has been enlarged by
  -- calc_depth function
  ag : FOR bit IN 0 TO adrwid-1 GENERATE
    b : IF bit <= rd_addr'HIGH GENERATE
      int_rd_addr(bit) <= rd_addr(bit);
      int_wr_addr(bit) <= wr_addr(bit);
    END GENERATE; -- b
    
    z : IF bit > rd_addr'HIGH GENERATE      
      int_rd_addr(bit) <= '0';
      int_wr_addr(bit) <= '0';      
    END GENERATE; -- z
    
  END GENERATE; -- ag

  
  m0 : rs_distributed_mem
  GENERIC MAP(
    c_elaboration_dir    => c_elaboration_dir,
    c_addr_width         => adrwid,
    c_depth              => depth,
    c_has_spo            => 0,
    c_has_qspo           => 0,
    c_has_dpo            => 1,
    c_has_qdpo           => 1,
    c_mem_init_file      => "null.mif",
    c_load_init_file     => 0,
    c_width              => width,
    c_mem_type           => c_dp_ram)
  PORT MAP(
    addra     => int_wr_addr,
    addrb     => int_rd_addr,
    din       => d,
    we        => we,
    en        => ce,
    clk       => clk,
    spo       => OPEN,
    qspo      => OPEN,
    dpo       => q,
    qdpo      => q_reg);     
    
END synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_mem.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
-- Filename - rs_mem.vhd
-- Author Bill Wilkie
--
-- Description - This file contains a wrapper for memories
--
-- For dual-port memories:
-- Assumes not true dual port - i.e. can't write both ports with different
-- addresses.
-- Can only write on A port because Dist Memory does not support writing on 'B'
-- port.
--
-- If dual-port dist ROM is selected c_mem_type is set to c_dp_ram, c_has_we is
-- asserted and we_int is tied low.
--
--          Block Memory            Dist Memory
-- we     -> wea                     we_int
-- ce     -> ena and enb             qspo_ce and qdpo_ce
-- d      -> dina                    d
-- sclr   -> sclr                    sclr on output regs
-- addra  -> addra                   a
-- addrb  -> addrb                   dpra
-- dout_a -> douta                   qspo
-- dout_b -> doutb                   qdpo
--
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY rs_mem IS
GENERIC (
  c_family             : STRING;
  c_xdevicefamily      : STRING;
  c_elaboration_dir    : STRING;
  c_memstyle           : INTEGER;
  c_addr_width         : INTEGER;
  c_depth              : INTEGER;
  c_width              : INTEGER;
  c_has_dout_a         : INTEGER;
  c_has_dout_b         : INTEGER;
  c_has_en             : INTEGER := 0;
  c_has_we             : INTEGER := 1;
  c_mem_init_file      : STRING  := "null.mif";
  c_mem_type           : INTEGER;
  c_read_mif           : INTEGER
  );
PORT (
  addra    : IN  STD_LOGIC_VECTOR(c_addr_width-1 DOWNTO 0) := (others => '0');
  addrb    : IN  STD_LOGIC_VECTOR(c_addr_width-1 DOWNTO 0) := (others => '0');
  d        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (others => '0');
  clk      : IN  STD_LOGIC := '0';
  en       : IN  STD_LOGIC := '0';
  we       : IN  STD_LOGIC := '0';
  dout_a   : OUT STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  dout_b   : OUT STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)
  );
END rs_mem;

--------------------------------------------------------------------------------
ARCHITECTURE synth OF rs_mem IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";



  CONSTANT style : mem_style_type := get_mem_style(c_memstyle,
                                                   reg,
                                                   c_depth);
  
  ------------------------------------------------------------------------------
  -- Function for debugging only
  --
--   FUNCTION display_params RETURN BOOLEAN IS
--   BEGIN
--     RETURN TRUE;
--   END display_params;
  
  --CONSTANT do_display_params : BOOLEAN := display_params;
  
  ------------------------------------------------------------------------------
--   FUNCTION check_params RETURN BOOLEAN IS
--   BEGIN
--       
--     RETURN TRUE;
--   END check_params;
--                                    
--   CONSTANT do_check_params : BOOLEAN := check_params;
  
  
  ------------------------------------------------------------------------------
  SUBTYPE data_type IS STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
  
  CONSTANT dual_port : BOOLEAN := c_mem_type = c_dp_ram OR c_has_dout_b /= 0;
  
  ------------------------------------------------------------------------------
  -- Return value for c_mem_type parameter.
  --
  FUNCTION get_mem_type RETURN INTEGER IS
  BEGIN
    IF dual_port THEN
    
      IF c_has_we = 0 THEN
        RETURN c_rom; -- Dual port ROM (same type as single port)
      ELSE
        RETURN c_dp_ram; -- Dual port RAM (could be simple or true)
      END IF;
      
    ELSE
    
      IF c_has_we = 0 THEN
        RETURN c_rom; -- Single port ROM
      ELSE
        RETURN c_sp_ram; -- Single port RAM
      END IF;
      
    END IF;
  
  END get_mem_type;
  
  
  ------------------------------------------------------------------------------
  CONSTANT mem_type : INTEGER := get_mem_type;
  
  CONSTANT int_addr_width : INTEGER := bitsneededtorepresent(c_depth-1);
  SUBTYPE int_addr_type IS STD_LOGIC_VECTOR(int_addr_width-1 DOWNTO 0);
  
  SIGNAL int_addra : int_addr_type:= (others => '0');
  SIGNAL int_addrb : int_addr_type:= (others => '0');
  
BEGIN  
  ------------------------------------------------------------------------------
  -- Construct address bus
  --
  ag1 : FOR i IN 0 TO int_addr_width-1 GENERATE
  
   ag2 : IF i < c_addr_width GENERATE
     int_addra(i) <= addra(i);
     int_addrb(i) <= addrb(i);
   END GENERATE; -- ag2
   
   ag3 : IF i >= c_addr_width GENERATE
     int_addra(i) <= '0';
     int_addrb(i) <= '0';
   END GENERATE; -- ag2
   
  END GENERATE; -- ag1
  


  ------------------------------------------------------------------------------
  -- Distributed memory
  --
  dmg : IF style = dist_mem GENERATE
  
    SIGNAL qspo_int   : data_type := (others => '0');
    SIGNAL qdpo_int   : data_type := (others => '0');
    SIGNAL we_int     : STD_LOGIC := '0';
    
  BEGIN

    -- There is no such thing as a Dist Mem dual-port ROM so we have to use
    -- a DP RAM with we tied low.
    gw0:IF c_mem_type = c_rom GENERATE
      we_int <= '0'; 
    END GENERATE;
    gw1:IF c_mem_type /= c_rom GENERATE
      we_int <= we;
    END GENERATE;
    
    dm : rs_distributed_mem
    GENERIC MAP(
      c_elaboration_dir    => c_elaboration_dir,
      c_addr_width         => int_addr_width,
      c_depth              => c_depth,
      c_has_spo            => 0,
      c_has_qspo           => c_has_dout_a,
      c_has_dpo            => 0,
      c_has_qdpo           => c_has_dout_b,
      c_mem_init_file      => c_mem_init_file,
      c_load_init_file     => c_read_mif,
      c_width              => c_width,
      c_mem_type           => mem_type)
    PORT MAP(
      addra     => int_addra,
      addrb     => int_addrb,
      din       => d,
      we        => we_int,
      en        => en,
      clk       => clk,
      spo       => OPEN,
      dpo       => OPEN,
      qspo      => qspo_int,
      qdpo      => qdpo_int);
    
    
      
    dag1 : IF c_has_dout_a /= 0 GENERATE
      dout_a <= qspo_int;
    END GENERATE; -- dag1
    
    dbg1 : IF c_has_dout_b /= 0 GENERATE
      dout_b <= qdpo_int;
    END GENERATE; -- dbg1
    
  END GENERATE; -- dmg
    
    
    
    
  ------------------------------------------------------------------------------
  -- Block memory
  --
  bmg : IF style /= dist_mem GENERATE
  BEGIN
  
      bm2 : rs_block_mem
      GENERIC MAP(
        c_family             => c_family,
        c_xdevicefamily      => c_xdevicefamily,
        c_elaboration_dir    => c_elaboration_dir,
        c_addr_width         => int_addr_width,    
        c_depth              => c_depth,
        c_has_douta          => c_has_dout_a,
        c_has_doutb          => c_has_dout_b,
        c_mem_init_file      => c_mem_init_file,
        c_load_init_file     => c_read_mif,
        c_width              => c_width,
        c_mem_type           => mem_type)
      PORT MAP(
        addra => int_addra,
        addrb => int_addrb,
        dina  => d,
        dinb  => d, -- Not used
        wea   => we,
        ena   => en, -- Common clock enable
        enb   => en,
        clk   => clk,
        douta => dout_a,
        doutb => dout_b);
  
    END GENERATE; -- dpg
          
  
END synth;
    
    


-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/shift_ram_delay.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : shift_ram_delay
-- Function : Delay line based on LUT RAM
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_shift_ram_v12_0_10;
USE c_shift_ram_v12_0_10.c_shift_ram_v12_0_10_viv_comp.ALL;


ENTITY shift_ram_delay IS
  GENERIC ( c_xdevicefamily : STRING;
            instance_name   : STRING := "";
            c_ainit_val     : STRING := "0";
            c_has_sinit     : INTEGER := 0;
            c_has_sset      : INTEGER := 0;
            bus_width       : INTEGER;
            addr_width      : INTEGER;
            c_has_addr      : INTEGER;
            c_has_ce        : INTEGER;
            clk_delay       : INTEGER;
            c_reg_last_bit  : INTEGER );
  PORT ( din   : IN  STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0) := (others => '0');
         addr  : IN  STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0) := (others => '0');
         clk   : IN  STD_LOGIC := '0';
         ce    : IN  STD_LOGIC := '0';
         sset  : IN  STD_LOGIC := '0';
         sinit : IN  STD_LOGIC := '0';
         dout  : OUT STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0) := (others => '0'));
END shift_ram_delay;


--------------------------------------------------------------------------------
ARCHITECTURE synth OF shift_ram_delay IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT c_shift_type : INTEGER := 
                     select_val_b(c_variable_lossless, c_fixed, (c_has_addr=0));
  ------------------------------------------------------------------------------
  -- Function for debugging only
  --
  FUNCTION display_params RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT
        " c_shift_ram parameters: " & new_line &
        " instance_name = " & instance_name & new_line &
        " c_xdevicefamily = " & c_xdevicefamily & new_line &
        " c_ainit_val = " & c_ainit_val & new_line &
        " c_addr_width = " & INTEGER'IMAGE(addr_width) & new_line &
        " c_depth = " & INTEGER'IMAGE(clk_delay) & new_line &
        " c_has_a = " & INTEGER'IMAGE(c_has_addr) & new_line &
        " c_has_ce = "  & INTEGER'IMAGE(c_has_ce) & new_line &
        " c_has_sclr = 0" & new_line &
        " c_has_sinit = " & INTEGER'IMAGE(c_has_sinit) & new_line &
        " c_has_sset = " & INTEGER'IMAGE(c_has_sset) & new_line &
        " c_read_mif = 0" & new_line &
        " c_reg_last_bit = " & INTEGER'IMAGE(c_reg_last_bit) & new_line &
        " c_shift_type = " & INTEGER'IMAGE(c_shift_type) & new_line &
        " c_sinit_val = " & c_ainit_val & new_line &
        " c_default_data = " & c_ainit_val & new_line &
        " c_sync_priority = " & INTEGER'IMAGE(c_clear) & new_line &
        " c_sync_enable = " & INTEGER'IMAGE(c_override) & new_line &
        " c_width = " & INTEGER'IMAGE(bus_width) & new_line &
        new_line
      SEVERITY NOTE;
        
    RETURN TRUE;
  END display_params;
  
  --CONSTANT do_display_params : BOOLEAN := display_params;
  
            
BEGIN

  r0: c_shift_ram_v12_0_10_viv
  GENERIC MAP(
           c_xdevicefamily      => c_xdevicefamily,
           c_verbosity          => 0,
           c_addr_width         => addr_width,
           c_ainit_val          => c_ainit_val,
           c_depth              => clk_delay,
           c_has_a              => c_has_addr,
           c_has_ce             => c_has_ce,
           c_has_sclr           => 0,
           c_has_sinit          => c_has_sinit,
           c_has_sset           => c_has_sset,
--           c_mem_init_file  => "null.mif";
--           c_mem_init_radix => 1,   -- for backwards compatibility
           c_read_mif           => 0,
           c_reg_last_bit       => c_reg_last_bit,
           c_shift_type         => c_shift_type,
           c_opt_goal           => 0, -- 0=area, 1=speed
           c_sinit_val          => c_ainit_val,
           c_default_data       => c_ainit_val,
           c_sync_priority      => c_clear,
           c_sync_enable        => c_override,
           c_width              => bus_width
       )
    PORT MAP (
           d     => din,
           a     => addr,
           clk   => clk,
           ce    => ce,
           sclr  => '0',
           sset  => sset,
           sinit => sinit,
           q     => dout);

END synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/rs_sync_fifo.vhd,v 1.2 2011/06/16 12:54:05 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : rs_sync_fifo
-- Function : Simple synchronous FIFO, based on sync_fifo core.
-- Description : Similar functionality to sync_fifo core without bells and whistles.
-- 
-- IMPORTANT - rd_en and wr_en must be gated with clock enable.
--             For the block mem version both wr_en and rd_en must be forced high.

--             Dist mem version behaves differently if C_INIT_TO_1 = 1. This 
--             will cause the final output register to be set to all 1s when
--             aclr or sclr are asserted, providing C_HAS_ACLR and C_HAS_SCLR.
--             BRAM version will be initialized to all 1's at power up but
--             will not be restored to that state with aclr or sclr.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;


entity rs_sync_fifo is
  generic (
     C_FAMILY          : string;
     C_XDEVICEFAMILY   : string;
     C_ELABORATION_DIR : string;
     C_INIT_TO_1       : integer := 0; -- initial value on dout will be all 1's
     C_MEMORY_TYPE     : integer;             
     C_WIDTH           : integer;
     C_DEPTH           : integer;
     C_HAS_ACLR        : integer := 0; -- No longer supported
     C_HAS_SCLR        : integer
  );
  port (
    clk   : in std_logic;  
    aclr  : in std_logic := '0';   
    sclr  : in std_logic;   
    din   : in std_logic_vector(C_WIDTH-1 downto 0);
    wr_en : in std_logic; 
    rd_en : in std_logic; 
    dout  : out std_logic_vector(C_WIDTH-1 downto 0)
  );
end rs_sync_fifo;



architecture synth of rs_sync_fifo is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant mem_style : mem_style_type := get_mem_style(C_MEMORY_TYPE, reg, C_DEPTH);
  
  function check_params return boolean is
  begin
    assert not(mem_style = block_mem and C_INIT_TO_1 /= 0)
      report "rs_sync_fifo: block mem will be initialized to all 1's on power" &
             " up, but will not be reset to that state."
      severity warning;
      
      return true;
  end function; -- check_params
  
  constant do_check_params  : boolean := check_params;
  signal used_locations     : integer := 0; -- For debug only
  signal max_used_locations : integer := 0; -- For debug only
  
begin

  
  ------------------------------------------------------------------------------
  -- If distributed memory is selected then use a shift RAM with an up/down
  -- address counter. This will take half the memory LUTs of a dual-port
  -- distributed memory.
  --
  srmg1: if (mem_style /= block_mem) generate
    constant depth      : integer := calc_depth(C_DEPTH, dist_mem);
    constant addr_width : integer := bitsneededtorepresent(depth-1);
    
    constant dmem_default_data : string := select_string("1", "0", C_INIT_TO_1=0);
    
    constant oreg_has_aset : integer := bool_to_int(C_INIT_TO_1 /= 0 and C_HAS_ACLR /= 0);
    constant oreg_has_sset : integer := bool_to_int(C_INIT_TO_1 /= 0 and C_HAS_SCLR /= 0);
    
    signal count_en     : std_logic := '0';
    signal dout_memory  : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
    signal mem_addr_bin : std_logic_vector(addr_width-1 downto 0) := (others => '0');
    signal zeroes       : std_logic_vector(addr_width-1 downto 0) := (others => '0');
    
  begin
  
    zeroes <= (others=>'0');
    
    
    ----------------------------------------------------------------------------
    -- This counter is used to control the shift_ram based memory mux. Only
    -- used for shift_ram based memory.
    -- Count up when wr_en = '1' else down if rd_en = '1'
    -- Initialized to all 1's so it rolls over to 0 after first write. Hence
    -- first read will be from address 0.
    --
    -- Don't need terminal count logic because counter should never go beyond
    -- "depth". If it does, it means FIFO has overloaded.
    udc1 : rs_counter
    generic map (
      c_xdevicefamily => C_XDEVICEFAMILY,
      c_width         => addr_width,
      use_count_to    => false,
      count_to        => depth-1,
      ainit_val       => (2**addr_width -1), -- init to all 1s
      sinit_val       => (2**addr_width -1), -- init to all 1s
      c_count_mode    => c_updown,
      c_has_ce        => 1,
      c_has_sset      => C_HAS_SCLR,
      c_sync_enable   => c_override)
    port map (
      clk   => clk,
      ce    => count_en,
      l     => zeroes,
      up    => wr_en,
      sset  => sclr,
      q     => mem_addr_bin);
        
  
    ----------------------------------------------------------------------------
    -- Generate CE signal to the up_down_counter and data_count counter
    -- Both rd_en and wr_en are gated with ce so we don't need to gate with ce
    -- again here.
    -- 
    count_en <= rd_en xor wr_en; 
 

 
    ----------------------------------------------------------------------------
    -- FIFO RAM is implemented with shift RAM
    --
    srm1 : shift_ram_delay
    generic map (instance_name   => "fifo_srm1",
                 c_xdevicefamily => C_XDEVICEFAMILY,
                 bus_width       => C_WIDTH,
                 addr_width      => addr_width,
                 c_has_addr      => 1,
                 c_has_ce        => 1,
                 clk_delay       => depth,
                 c_reg_last_bit  => 0)
    port map (din  => din,
              addr => mem_addr_bin,
              clk  => clk,
              ce   => wr_en,
              dout => dout_memory);
                

    -- No need to clr this register because only the control logic needs
    -- to be clr'd
    reg1 : rs_reg
    generic map (c_width=>C_WIDTH, ainit_val=>dmem_default_data, c_has_ce=>1,
                 c_has_aset=>oreg_has_aset, c_has_sset=>oreg_has_sset)
    port map (d=>dout_memory, clk=>clk, aset=>aclr, sset=>sclr, ce=>rd_en, q=>dout);

  end generate; -- srmg1



  
  -------------------------------------------------------------------------------
  -- The following read and write counters are used to generate addresses
  -- to the block RAM memory. Only used for block RAM based implementation.
  -------------------------------------------------------------------------------
  brmg1: if (mem_style = block_mem) generate
    -- Don't make counters any wider than they have to be, even though
    -- RAM may have to be deeper than C_DEPTH to be a legal block RAM
    -- depth.
    constant count_width  : integer := bitsneededtorepresent(C_DEPTH-1);
    constant depth        : integer := calc_depth_dp(C_DEPTH);
    constant addr_width   : integer := bitsneededtorepresent(depth-1);
    -- Only instantiate terminal count logic if it is required
    constant use_count_to : boolean := 2**count_width > depth;
    
    constant bram_default_data : string := select_string("f", "0", C_INIT_TO_1=0);
    
    signal ram_rd_en     : std_logic := '0';
    signal write_count   : std_logic_vector(count_width-1 downto 0) := (others => '0');
    signal read_count    : std_logic_vector(count_width-1 downto 0) := (others => '0');
    signal write_address : std_logic_vector(addr_width-1 downto 0) := (others => '0');
    signal read_address  : std_logic_vector(addr_width-1 downto 0) := (others => '0');
    signal zeroes        : std_logic_vector(count_width-1 downto 0) := (others => '0');
  begin
 
    zeroes <= (others=>'0');
  
    -- Read Address counter
    rc1 : rs_counter
    generic map (
      c_xdevicefamily => C_XDEVICEFAMILY,
      c_width         => count_width,
      use_count_to    => use_count_to,
      count_to        => C_DEPTH-1,
      c_count_mode    => c_up,
      c_has_ce        => 1,
      c_has_sclr      => C_HAS_SCLR,
      c_sync_enable   => c_override)
    port map (
      clk   => clk,
      ce    => rd_en,
      l     => zeroes,
      up    => '1',
      sclr  => sclr,
      q     => read_count);
        
    -- Write Address counter
    wc1 : rs_counter
    generic map (
      c_xdevicefamily => C_XDEVICEFAMILY,
      c_width         => count_width,
      use_count_to    => use_count_to,
      count_to        => C_DEPTH-1,
      c_count_mode    => c_up,
      c_has_ce        => 1,
      c_has_sclr      => C_HAS_SCLR,
      c_sync_enable   => c_override)
    port map (
      clk   => clk,
      ce    => wr_en,
      l     => zeroes,
      up    => '1',
      sclr  => sclr,
      q     => write_count);

    -- Form RAM addresses by padding counter outputs with 0's
    ag1: for i in 0 to addr_width-1 generate
      ag2: if i < count_width generate
        read_address(i) <= read_count(i);
        write_address(i) <= write_count(i);
      end generate; -- ag2
      
      ag3: if i >= count_width generate
        read_address(i) <= '0';
        write_address(i) <= '0';
      end generate; -- ag3
      
    end generate; -- ag1

    
              
    -- Use dual-port block memory with A as the write port
    -- and B as the read port
    br1 : rs_block_mem
    generic map(
      c_family           => C_FAMILY,
      c_xdevicefamily    => C_XDEVICEFAMILY,
      c_elaboration_dir  => C_ELABORATION_DIR,
      c_addr_width       => addr_width,
      c_depth            => depth,
      c_has_douta        => 0,
      c_has_doutb        => 1,
      c_load_init_file   => 0,
      c_mem_type         => c_dp_ram, -- simple dual-port
      c_width            => C_WIDTH)
    port map(
      addra => write_address,
      addrb => read_address,
      dina  => din,
      dinb  => din,
      wea   => wr_en,
      ena   => '1', -- qa not used
      enb   => ram_rd_en,
      clk   => clk,
      douta => open, -- not used
      doutb => dout);
      
      
    -- Force RAM rd_en low on sclr otherwise there may be a warning about
    -- reading from the address that is being written to. This will occur
    -- if the FIFO is empty when the sclr occurs due to rd_en and wr_en
    -- both being asserted and the rd and wr addresses being equal.
    rg1 : if C_HAS_SCLR /= 0 generate
      ram_rd_en <= rd_en and not(sclr);
    end generate; -- rg1
    
    rg2 : if C_HAS_SCLR = 0 generate
      ram_rd_en <= rd_en;
    end generate; -- rg2
    
      
  end generate; -- brmg1

  
  ------------------------------------------------------------------------------
  -- The following code consists of checks for verification only
  --
  --
  -- pragma translate_off
  -- Check FIFO is never written when full or read when empty
  cfp1: process(clk)
    variable used_locations_v : integer := 0;
  begin
    
    if rising_edge(clk) then
    
      if sclr = '1' then
        used_locations_v := 0;
      else
    
        if wr_en = '1' then
          used_locations_v := used_locations_v + 1;
        end if;
      
        if rd_en = '1' then
          used_locations_v := used_locations_v - 1;
        end if;
    
        assert (used_locations_v <= C_DEPTH)
          report "ERROR: attempt to write to full rs_sync_fifo" & new_line &
                 "FIFO depth = " & integer'image(C_DEPTH)
          severity failure;
        
        assert (used_locations_v >= 0)
          report "ERROR: attempt to read from empty rs_sync_fifo" & new_line &
                 "FIFO depth = " & integer'image(C_DEPTH)
          severity failure;
        
      end if; -- sclr = '1' 
    end if; -- rising_edge(clk)
    
    -- Uncomment these signal assignments for debugging
    used_locations <= used_locations_v;
    
    if used_locations_v > max_used_locations then
      max_used_locations <= used_locations_v;
    end if;
    
  end process; -- cfp1
  -- pragma translate_on

end synth;





-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/lut_delay.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : lut_delay
-- Function : Delay line based on LUT RAM
-- Delay must be > 2
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;


ENTITY lut_delay IS
  GENERIC ( instance_name   : STRING := "";
            c_xdevicefamily : STRING;
            c_ainit_val     : STRING := "0";
            c_has_sinit     : INTEGER := 0;
            c_has_sset      : INTEGER := 0;
            c_reg_last_bit  : INTEGER := 1;
            bus_width       : INTEGER;
            clk_delay       : INTEGER;
            c_has_ce        : INTEGER );
  PORT ( din   : IN  STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0);
         clk   : IN  STD_LOGIC;
         ce    : IN  STD_LOGIC;
         sset  : IN  STD_LOGIC := '0';
         sinit : IN  STD_LOGIC := '0';
         dout  : OUT STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0));
END lut_delay;


--------------------------------------------------------------------------------
ARCHITECTURE synth OF lut_delay IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT max_dly_blk_size : INTEGER := 1024;
  -- Subtract 1 from clk_delay to account for final reg on LUT
--  CONSTANT delay_unit  : INTEGER := (clk_delay-1)/max_dly_blk_size;
--  CONSTANT extra_delay : INTEGER := (clk_delay-1) REM max_dly_blk_size;
  CONSTANT delay_unit  : INTEGER := clk_delay/max_dly_blk_size;
  CONSTANT extra_delay : INTEGER := clk_delay REM max_dly_blk_size;

  SUBTYPE din_type   IS STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0);
  TYPE del_data_type IS ARRAY (NATURAL RANGE<>) OF din_type;

  CONSTANT max_dly_width : INTEGER := 10; --bits to represent max_dly_blk_size-1  
  CONSTANT max_dly_addr : STD_LOGIC_VECTOR(max_dly_width-1 DOWNTO 0) :=
    int_2_std_logic_vector(0, max_dly_width);

  FUNCTION gen_delay_addr_width(extra_delay_int : INTEGER ) RETURN INTEGER IS
    VARIABLE delay_width_int : INTEGER := 0;
  BEGIN
    IF extra_delay_int <= 4 THEN
      delay_width_int := 2;
    ELSE    
      delay_width_int := bitsneededtorepresent(extra_delay_int-1);
    END IF;
    RETURN delay_width_int;
  END FUNCTION;
  CONSTANT delay_addr_width : INTEGER := gen_delay_addr_width(extra_delay);
  CONSTANT delay_addr : STD_LOGIC_VECTOR(delay_addr_width-1 DOWNTO 0) :=
    int_2_std_logic_vector(0, delay_addr_width);

    
  SIGNAL del_data : del_data_type(0 TO delay_unit) := (others => (others => '0'));
    
  
BEGIN
    
    del_data(0) <= din;

    ----------------------------------------------------------------------------
    gt0 : IF (delay_unit > 0) GENERATE
    BEGIN
      dg : FOR i IN 0 TO delay_unit-1 GENERATE
      
        d0 : shift_ram_delay
        GENERIC MAP (c_xdevicefamily => c_xdevicefamily,
                     instance_name   => instance_name,
                     c_ainit_val     => c_ainit_val,
                     c_has_sinit     => c_has_sinit,
                     c_has_sset      => c_has_sset,
                     bus_width       => bus_width,
                     addr_width      => max_dly_width,
                     c_has_addr      => 0,
                     c_has_ce        => c_has_ce,
                     clk_delay       => max_dly_blk_size,
                     c_reg_last_bit  => c_reg_last_bit)
        PORT MAP (din   => del_data(i),
                  addr  => max_dly_addr,
                  clk   => clk, 
                  ce    => ce,
                  sset  => sset,
                  sinit => sinit,
                  dout  => del_data(i+1));
                      
      END GENERATE; -- dg
    
    END GENERATE; -- gt0
    
    
    ----------------------------------------------------------------------------
    ed0 : IF (extra_delay = 0) GENERATE
        dout <= del_data(delay_unit);
    END GENERATE; -- ed0
    
    
    ----------------------------------------------------------------------------
    ed : IF (extra_delay > 0) GENERATE
    
      d1 : shift_ram_delay
      GENERIC MAP (c_xdevicefamily => c_xdevicefamily,
                   instance_name   => instance_name,
                   c_ainit_val     => c_ainit_val,
                   c_has_sinit     => c_has_sinit,
                   c_has_sset      => c_has_sset,
                   bus_width       => bus_width,
                   addr_width      => delay_addr_width,
                   c_has_addr      => 0,
                   c_has_ce        => c_has_ce,
                   clk_delay       => extra_delay,
                   c_reg_last_bit  => c_reg_last_bit)
      PORT MAP (din   => del_data(delay_unit),
                addr  => delay_addr,
                clk   => clk, 
                ce    => ce,
                sset  => sset,
                sinit => sinit,
                dout  => dout);
      
    END GENERATE; -- ed
        
END synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/bram_delay.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : bram_delay
-- Function : Delay line based on block RAM
-- Delay must be > 2
-- Note that clr input only affects internal address counters.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.rs_blocks_pkg.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

ENTITY bram_delay IS
GENERIC (
  c_family          : STRING;
  c_xdevicefamily   : STRING;
  c_elaboration_dir : STRING;
  bus_width         : INTEGER;
  clk_delay         : INTEGER;
  c_has_ce          : INTEGER);
PORT (
  din  : IN  STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0);
  clk  : IN  STD_LOGIC;
  ce   : IN  STD_LOGIC;
  dout : OUT STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0));
END bram_delay;


--------------------------------------------------------------------------------
ARCHITECTURE synth OF bram_delay IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT depth         : INTEGER := calc_depth_dp(clk_delay);
  CONSTANT addr_width    : INTEGER := bitsneededtorepresent(depth-1);
  CONSTANT counter_width : INTEGER := bitsneededtorepresent(clk_delay-1);

  FUNCTION debug_delay RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
      REPORT "bram_delay : " & new_line &
             "   delay = " & integer'image(clk_delay) & new_line &
             "   depth = " & integer'image(depth) & new_line &
             "   addr_width = " & integer'image(addr_width) & new_line &
             "   counter_width = " & integer'image(counter_width) & new_line
      SEVERITY NOTE;
    RETURN TRUE;
  END debug_delay;
  
  --CONSTANT do_debug : BOOLEAN := debug_delay;
             
  SIGNAL read_addr  : STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0):= (others => '0');
  SIGNAL write_addr : STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0):= (others => '0');
  SIGNAL count      : STD_LOGIC_VECTOR(counter_width-1 DOWNTO 0):= (others => '0');
  SIGNAL count_d    : STD_LOGIC_VECTOR(counter_width-1 DOWNTO 0):= (others => '0');
  SIGNAL ce_int     : STD_LOGIC := '0';
  SIGNAL zeroes     : STD_LOGIC_VECTOR(counter_width-1 DOWNTO 0):= (others => '0');

BEGIN
  zeroes <= (OTHERS=>'0');
  
  ceg: IF c_has_ce /= 0 GENERATE
    ce_int <= ce;
  END GENERATE; -- ceg
  
  nceg: IF c_has_ce = 0 GENERATE
    ce_int <= '1';
  END GENERATE; -- nceg
  
  ------------------------------------------------------------------------------
  -- Counter cycles from 0 to clk_delay-1 continuously
  -- Use baseblox counter as it simulates with 0 output prior to reset
  c0 : rs_counter
  GENERIC MAP (c_xdevicefamily => c_xdevicefamily,
               c_width         => counter_width,
               use_count_to    => TRUE,
               count_to        => clk_delay-1,
               c_count_mode    => c_up,
               c_has_ce        => c_has_ce,
               c_has_sclr      => 0,
               c_sync_enable   => c_override)
  PORT MAP(clk   => clk,
           ce    => ce_int,
           l     => zeroes,
           up    => '1',
           sclr  => '0',
           q     => count);
           
  -- Must set the lead address to the latency of the delay to ensure that the
  -- first data value is always captured correctly.
  g:FOR i IN 0 TO counter_width-1 GENERATE
	CONSTANT init_string: STRING(counter_width DOWNTO 1):=int_2_logic_string(
													clk_delay-1,counter_width);
  	CONSTANT str : STRING (1 DOWNTO 1) := init_string(i+1 DOWNTO i+1);
  BEGIN
  	r : rs_reg_bit_ainit
  	GENERIC MAP (
      	c_has_ce       => c_has_ce,
    	c_has_ainit    => 1,
        ainit_val      => str)
  	PORT MAP(
    	d     => count(i),
    	clk   => clk,
    	ce    => ce_int,
    	aclr  => '0',
    	sclr  => '0',
    	q     => count_d(i));
  END GENERATE; 
           
           
  
    
  

           
  ------------------------------------------------------------------------------
  -- Pad address bus with dummy zeros if memory has been enlarged by
  -- calc_depth_dp function
  ag : FOR bit IN 0 TO addr_width-1 GENERATE
  BEGIN
  
      bg : IF bit < counter_width GENERATE
          read_addr(bit)  <= count(bit);
          write_addr(bit) <= count_d(bit);
      END GENERATE; -- bg
      
      z : IF bit >= counter_width GENERATE
          read_addr(bit)  <= '0';
          write_addr(bit) <= '0';
      END GENERATE; -- z
      
  END GENERATE; -- ag
                   
               
  ------------------------------------------------------------------------------
  -- Instantiate the block RAM
  -- Provides delay of depth+1 due to RAM registers
           
  -- Use dual-port block memory with A as the write port
  -- and B as the read port
  m0 : rs_block_mem
  GENERIC MAP(
    c_family           => c_family,
    c_xdevicefamily    => c_xdevicefamily,
    c_elaboration_dir  => c_elaboration_dir,
    c_addr_width       => addr_width,
    c_depth            => depth,
    c_has_douta        => 0,
    c_has_doutb        => 1,
    c_load_init_file   => 0,
    c_mem_type         => c_dp_ram, -- Simple dual port
    c_width            => bus_width)
  PORT MAP(
    addra => write_addr,
    addrb => read_addr,
    dina  => din,
    dinb  => din,
    wea   => '1',
    ena   => ce_int,
    enb   => ce_int,
    clk   => clk,
    douta => OPEN, -- not used
    doutb => dout);
  
END synth;





-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/big_delay.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--------------------------------------------------------------------------------
-- Unit     : big_delay
-- Function : Parameterized delay line
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;



ENTITY big_delay IS
GENERIC (
  c_family          : STRING;
  c_xdevicefamily   : STRING;
  instance_name     : STRING := "";
  c_elaboration_dir : STRING;
  bus_width         : INTEGER;
  clk_delay         : INTEGER;
  memstyle          : mem_style_type := block_mem;
  -- Set to TRUE if power-on reset to 1 is required. Not applicable for BRAM delays
  init_to_1         : BOOLEAN := FALSE;
  c_has_ce          : INTEGER);
PORT (
  din  : IN  STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0);
  clk  : IN  STD_LOGIC;
  ce   : IN  STD_LOGIC;
  dout : OUT STD_LOGIC_VECTOR(bus_width-1 DOWNTO 0));
END big_delay;


--------------------------------------------------------------------------------
ARCHITECTURE synth OF big_delay IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  --CONSTANT c_family_int : INTEGER := get_family_int(c_family);
  
  -- Cut off point for moving to block RAM implementation when
  -- memstyle = auto_mem
  CONSTANT max_srl_delay : INTEGER := 64;
  
  
  CONSTANT use_block_mem : BOOLEAN :=
    clk_delay > 1 AND ((memstyle = block_mem) OR
                       ((memstyle = auto_mem) AND (clk_delay > max_srl_delay)));
                       
                       
--   -- Check parameter combination is legal
--   FUNCTION check_params RETURN BOOLEAN IS
--   BEGIN
--     ASSERT NOT((c_has_aset /= 0 OR c_has_aclr /= 0) AND use_block_mem)
--     REPORT "rs_toolbox:big_delay - cannot have aclr or aset with block memory" &
--            new_line
--     SEVERITY FAILURE;
--     
--     RETURN TRUE;
--   END check_params;
-- 
--   CONSTANT do_check_params : BOOLEAN := check_params;
 
 
 
  -- Debug function to report length of delay
  FUNCTION report_delay RETURN BOOLEAN IS
  BEGIN
    ASSERT FALSE
    REPORT "Delay line = "& integer'image(clk_delay)&new_line
    SEVERITY NOTE;
    
    RETURN TRUE;
  END report_delay;

  
  -- Check parameters are legal
  FUNCTION check_params RETURN BOOLEAN IS
  BEGIN
  
    ASSERT NOT(init_to_1 AND memstyle=block_mem)
    REPORT "ERROR: Delay line " & instance_name &
           " trying to initialize block memory to ones" & new_line
    SEVERITY FAILURE;
  
    RETURN TRUE;
  END check_params;
  
  CONSTANT do_check_params : BOOLEAN := check_params;
  
  
  --CONSTANT rep_delay : BOOLEAN := report_delay;
  CONSTANT all0s : STRING(1 TO bus_width) := (OTHERS=>'0');
  CONSTANT all1s : STRING(1 TO bus_width) := (OTHERS=>'1');
  CONSTANT power_on_reset_value : STRING :=
                                         select_string(all0s, all1s, init_to_1);
  
  
BEGIN


  ------------------------------------------------------------------------------
  -- Just pass input straight through if clk_delay = 0
  eq0 : IF clk_delay = 0 GENERATE
  BEGIN
    dout <= din;
  END GENERATE; -- eq0_
  
  
  gt0 : IF clk_delay > 0 GENERATE
    SIGNAL ce_int : STD_LOGIC := '0';
  BEGIN
    ceg: IF c_has_ce /= 0 GENERATE
      ce_int <= ce;
    END GENERATE; -- ceg
    
    nceg: IF c_has_ce = 0 GENERATE
      ce_int <= '1';
    END GENERATE; -- nceg

    --------------------------------------------------------------------------
    -- Just use a single register if clk_delay = 1
    eq1 : IF clk_delay = 1 GENERATE
    
      ff0 : rs_reg
      GENERIC MAP (c_width        => bus_width,
                   ainit_val      => power_on_reset_value,
                   c_has_ce       => c_has_ce,
                   c_has_aclr     => 0,
                   c_has_aset     => 0,
                   c_has_sclr     => 0,
                   c_sync_enable  => c_no_override,
                   c_enable_rlocs => 0)
      PORT MAP (d    => din,
                clk  => clk,
                ce   => ce_int,
                q    => dout);
   
    END GENERATE; -- eq1
    
    ----------------------------------------------------------------------------
    gt1 : IF clk_delay > 1 GENERATE
    
      --------------------------------------------------------------------------
      -- Use block memory (min delay = 2)
      bg : IF use_block_mem GENERATE
      
        bramd0 : bram_delay 
        GENERIC MAP (c_family=>c_family, c_xdevicefamily=>c_xdevicefamily,
                     c_elaboration_dir=>c_elaboration_dir,
                     bus_width=>bus_width, clk_delay=>clk_delay,
                     c_has_ce=>c_has_ce)
        PORT MAP (din=>din, clk=>clk, ce=>ce_int, dout=>dout);
      
      END GENERATE; -- bram_gen
      
      --------------------------------------------------------------------------
      -- Use LUT-based shift register technique
      srlg : IF NOT(use_block_mem) GENERATE
      
        ld0 : lut_delay 
        GENERIC MAP (instance_name   => instance_name,
                     c_xdevicefamily => c_xdevicefamily,
                     c_ainit_val     => power_on_reset_value,
                     c_reg_last_bit  => 1,
                     bus_width       => bus_width,
                     clk_delay       => clk_delay,
                     c_has_ce        => c_has_ce)
        PORT MAP (din   => din,
                  clk   => clk,
                  ce    => ce_int,
                  sinit => '0',
                  sset  => '0',
                  dout  => dout);
      
      END GENERATE; -- srlg

    END GENERATE; -- gt1
    
  END GENERATE; -- gt0
      
END synth;




--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gf_pkg.vhd,v 1.4 2011/06/16 12:54:05 billw Exp $
--
-- Description: Package for Galois Field arithmetic.
-- Declarations and functions in this package support 2 < symbol_width < 17.
--
-- Author: Dwayne Burns
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;


PACKAGE gf_pkg IS

--------------------------------------------------------------------------------
--
-- min/max's
-- Note this is duplicated in rs_encoder_v*_*_consts.vhd
--
--------------------------------------------------------------------------------
CONSTANT min_symbol_width : INTEGER := 3;
CONSTANT max_symbol_width : INTEGER := 12;
CONSTANT max_symbol_width_minus_1 : INTEGER := max_symbol_width - 1;

CONSTANT min_k : INTEGER := 1;
CONSTANT min_r : INTEGER := 2;
CONSTANT min_n : INTEGER := min_k + min_r;
CONSTANT max_n : INTEGER := (2**max_symbol_width) - 1;
CONSTANT max_k : INTEGER := max_n - min_r;
CONSTANT max_r : INTEGER := max_n - min_k;



--------------------------------------------------------------------------------
--
-- SUBTYPES & TYPES
--
--------------------------------------------------------------------------------
SUBTYPE r_type              IS INTEGER RANGE min_r TO max_r;
SUBTYPE symbol_width_type   IS INTEGER RANGE min_symbol_width TO max_symbol_width;
SUBTYPE k_type              IS INTEGER RANGE min_k TO max_k;
SUBTYPE n_type              IS INTEGER RANGE min_n TO max_n;
SUBTYPE h_type              IS INTEGER;

TYPE array_of_polynomials   IS ARRAY(0 TO max_symbol_width) OF INTEGER;
SUBTYPE max_poly_type       IS STD_LOGIC_VECTOR(max_symbol_width_minus_1 DOWNTO 0);
SUBTYPE is_mac_type         IS BOOLEAN;

--------------------------------------------------------------------------------
--
-- coefficients for CCSDS
--
--------------------------------------------------------------------------------
--max number of bits is 12
TYPE basis_convert_array IS ARRAY (0 TO max_symbol_width_minus_1) OF INTEGER;

--used to convert between normal and dual basis
CONSTANT ccsds_basis_conv: basis_convert_array := (141, 239, 236, 134, 
                                                   250, 153, 175, 123,
                                                   0, 0, 0, 0);
-- used to convert between dual and normal basis
CONSTANT ccsds_basis_conv_inv: basis_convert_array := (197, 66, 46, 253, 
                                                       240, 121, 172, 204,
                                                       0, 0, 0, 0);




--------------------------------------------------------------------------------
--
-- coefficients for ATSC standard
--
--------------------------------------------------------------------------------
CONSTANT atsc_k             : k_type            := 187;
CONSTANT atsc_n             : n_type            := 207;
CONSTANT atsc_gen_start     : INTEGER           := 0;
CONSTANT atsc_h             : INTEGER           := 1;
CONSTANT atsc_poly          : INTEGER           := 0;
CONSTANT atsc_symbol_width  : symbol_width_type := 8;

--------------------------------------------------------------------------------
--
-- coefficients for DVB standard
--
--------------------------------------------------------------------------------
CONSTANT dvb_k              : k_type            := 188;
CONSTANT dvb_n              : n_type            := 204;
CONSTANT dvb_gen_start      : INTEGER           := 0;
CONSTANT dvb_h              : h_type            := 1;
CONSTANT dvb_poly           : INTEGER           := 0;
CONSTANT dvb_symbol_width   : symbol_width_type := 8;


--------------------------------------------------------------------------------
--
-- constants to include mac support in gfmul
--
--------------------------------------------------------------------------------
CONSTANT is_mac_yes         : is_mac_type       := TRUE;
CONSTANT is_mac_no          : is_mac_type       := FALSE;

--------------------------------------------------------------------------------
--
-- optimization constants
--
--------------------------------------------------------------------------------
CONSTANT area           : INTEGER       := 1;
CONSTANT speed          : INTEGER       := 2;

--------------------------------------------------------------------------------
--
-- check symbol generator polynomial types
--
--------------------------------------------------------------------------------
CONSTANT c_fixed_gen_poly_type    : INTEGER := 0;
CONSTANT c_variable_gen_poly_type : INTEGER := 1;
CONSTANT c_hybrid_gen_poly_type   : INTEGER := 2;

CONSTANT gen_poly_type_default    : INTEGER := c_fixed_gen_poly_type;

--------------------------------------------------------------------------------
--
-- defaults
--
--------------------------------------------------------------------------------
CONSTANT gen_start_default      : INTEGER           := dvb_gen_start;
CONSTANT n_default              : n_type            := dvb_n;
CONSTANT k_default              : k_type            := dvb_k;
CONSTANT h_default              : h_type            := dvb_h;
CONSTANT poly_default           : INTEGER           := dvb_poly;
CONSTANT optimization_default   : INTEGER           := speed;
CONSTANT latency_default        : INTEGER           := 2;
CONSTANT symbol_width_default   : symbol_width_type := dvb_symbol_width;
CONSTANT is_mac_default         : is_mac_type       := is_mac_no;

--------------------------------------------------------------------------------
--
-- polynomials are entered as decimal numbers. The bits of the binary equivalent
-- correspond to the polynomial coefficients. e.g. 285 => x^8+x^4+x^3+x^2+1
-- For correct operation of the code it is not necessary to specify the MSB, so
-- 29 could be used instead of 285.
--
--------------------------------------------------------------------------------
CONSTANT default_polynomial : array_of_polynomials :=
                            ( 0=>     0,
                              1=>     0,
                              2=>     7,    -- "00000000000000111"
                              3=>    11,    -- "00000000000001011"
                              4=>    19,    -- "00000000000010011"
                              5=>    37,    -- "00000000000100101"
                              6=>    67,    -- "00000000001000011"
                              7=>   137,    -- "00000000010001001"
                              8=>   285,    -- "00000000100011101"
                              9=>   529,    -- "00000001000010001"
                             10=>  1033,    -- "00000010000001001"
                             11=>  2053,    -- "00000100000000101"
                             12=>  4179);   -- "00001000001010011"
--                             13=>  8219,    -- "00010000000011011"
--                             14=> 17475,    -- "00100010001000011"
--                             15=> 32771,    -- "01000000000000011"
--                             16=> 69643);   -- "10001000000001011"
                              
TYPE natural_array_type IS ARRAY(NATURAL RANGE <>) OF NATURAL;
TYPE integer_array_type IS ARRAY(NATURAL RANGE <>) OF INTEGER;


-- max_symbol_matrix_type is used in gfcx_calc_cterms function.
-- xcc doesn't support type declarations within functions so a
-- fixed size matrix array is declared here
SUBTYPE max_symbol_type IS STD_LOGIC_VECTOR(max_symbol_width - 1 DOWNTO 0);
TYPE max_symbol_matrix_type IS ARRAY(0 TO max_symbol_width - 1) OF max_symbol_type;

CONSTANT max_num_qterm_suboutputs : INTEGER := 4; -- supports symbol_width <= 16
CONSTANT max_num_qterms : INTEGER := 2*max_symbol_width - 1;
CONSTANT max_isig_index : INTEGER := max_num_qterm_suboutputs*max_num_qterms+3*max_symbol_width; -- over-estimate !

TYPE abterm_index_array_type    IS ARRAY(0 TO max_symbol_width - 1) OF INTEGER;
TYPE suboutput_index_array_type IS ARRAY(0 TO max_num_qterm_suboutputs - 1) OF INTEGER;
-- there are two different sizes of sterm_index_array_type, as the gfcx record only needs
-- to hold up to max_symbol_width elements in the sterm index array, while the gfx record 
-- needs to be able to hold up to 4*max_symbol_width
TYPE gfcx_sterm_index_array_type IS ARRAY(0 TO max_symbol_width - 1) OF INTEGER;
TYPE gfx_sterm_index_array_type IS ARRAY(0 TO max_isig_index - 1) OF INTEGER;

TYPE qterm_record_type IS RECORD
    num_pterms              : INTEGER;
    a                       : abterm_index_array_type;
    b                       : abterm_index_array_type;
    num_suboutputs          : INTEGER;
    suboutput               : suboutput_index_array_type;
    times_used              : INTEGER;
END RECORD;

TYPE qterm_array_type IS ARRAY(0 TO max_num_qterms - 1) OF qterm_record_type;

TYPE gfx_cterm_record_type IS RECORD
    num_sterms              : INTEGER;
    s                       : gfx_sterm_index_array_type;
END RECORD;

TYPE sterm_index_array_type IS ARRAY(0 TO max_symbol_width - 1) OF INTEGER;
TYPE so_index_array_type IS ARRAY(0 TO 1) OF INTEGER;

TYPE gfcx_cterm_record_type IS RECORD
  num_sterms : INTEGER;
  s          : gfcx_sterm_index_array_type;
  num_sos    : INTEGER; -- added for encoder support
  so         : so_index_array_type; -- added for encoder support
END RECORD;

TYPE gfx_cterm_array_type IS ARRAY(0 TO max_symbol_width - 1) OF gfx_cterm_record_type;
TYPE gfcx_cterm_array_type IS ARRAY(0 TO max_symbol_width - 1) OF gfcx_cterm_record_type;

TYPE gfx_record_type IS RECORD
    symbol_width      : symbol_width_type;
    polynomial        : INTEGER;
    is_mac            : BOOLEAN;
    pack_cterms       : BOOLEAN;
    qterm             : qterm_array_type;
    cterm             : gfx_cterm_array_type;
END RECORD; -- gfx_record_type

TYPE gfcx_record_type IS RECORD
    symbol_width         : symbol_width_type;
    polynomial           : INTEGER;
    constant_coefficient : INTEGER;
    cterm                : gfcx_cterm_array_type;
END RECORD; -- gfcx_record_type

TYPE gfcx_array_type IS ARRAY(NATURAL RANGE <>) OF gfcx_record_type;


--------------------------------------------------------------------------------
--
-- FUNCTION prototypes
--
--------------------------------------------------------------------------------
--
-- General utility function prototypes
--
FUNCTION integer_xor(a, b, num_bits : INTEGER)
  RETURN INTEGER;
  
FUNCTION x_rat( value : STD_LOGIC )
  RETURN STD_LOGIC;

FUNCTION x_sll( in_val: STD_LOGIC_VECTOR; num_bits_left: INTEGER) 
  RETURN STD_LOGIC_VECTOR;

FUNCTION x_sll1( in_val       : STD_LOGIC_VECTOR;
                 shift_in_val : STD_LOGIC) 
 RETURN STD_LOGIC_VECTOR;

FUNCTION x_to_string(in_val : INTEGER) 
  RETURN STRING;

FUNCTION natural_xor(a, b, num_bits : NATURAL)
  RETURN NATURAL;

FUNCTION integer_array_to_bit_vector(length             : IN INTEGER;
                                     integer_array_length : IN INTEGER;
                                     integer_array      : IN integer_array_type)
  RETURN BIT_VECTOR;
--
-- Galois field function prototypes
--
FUNCTION gf_calc_elements(sw : symbol_width_type; 
                          polynomial : INTEGER)
  RETURN integer_array_type;

FUNCTION gf_calc_indices(sw : symbol_width_type; 
                         alpha_to : integer_array_type)
  RETURN integer_array_type;

FUNCTION gf_check_primitivity(sw : symbol_width_type; 
                              index_of : integer_array_type)
  RETURN BOOLEAN;

FUNCTION gf_calc_inverses(sw       : symbol_width_type;
                          alpha_to : integer_array_type;
                          index_of : integer_array_type)
  RETURN integer_array_type;
  
  
--
-- Galois field general multiplier function prototypes
--
FUNCTION gfx_calc_qterms(initial_gfx : gfx_record_type;
                         sw          : INTEGER)
  RETURN gfx_record_type;

FUNCTION gfx_calc_cterms(alpha_to_short : integer_array_type;
                         initial_gfx    : gfx_record_type;
                         sw             : INTEGER)
  RETURN gfx_record_type;

FUNCTION gfx_calc_record( symbol_width   : symbol_width_type;
                          polynomial     : INTEGER;
                          is_mac         : BOOLEAN;
                          alpha_to_short : integer_array_type)
  RETURN gfx_record_type;
  
  
  
--
-- Galois field constant coefficient multiplier function prototypes
--
FUNCTION gfcx_calc_cterms(alpha_to_short : integer_array_type;
                          initial_gfcx   : gfcx_record_type;
                          sw             : INTEGER)
  RETURN gfcx_record_type;

FUNCTION gfcx_calc_record( symbol_width         : symbol_width_type;
                           polynomial           : INTEGER;
                           alpha_to_short       : integer_array_type;
                           constant_coefficient : INTEGER)
  RETURN gfcx_record_type;

  
  
  
--------------------------------------------------------------------------------
--
-- COMPONENTS
--
--------------------------------------------------------------------------------

COMPONENT xsop4_stage
  GENERIC( 
    width          : INTEGER RANGE 1 TO 4 := 1;
    invout         : BOOLEAN              := FALSE;
    q_mode         : mem_q_type           := no_reg);
--    num_lut_inputs : INTEGER);
  PORT(
    aa    : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    bb    : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    c     : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce    : IN  STD_LOGIC := '1';
    reset : IN  STD_LOGIC := '0';
    o     : OUT STD_LOGIC;
    o_reg : OUT STD_LOGIC);
END COMPONENT; -- xsop4_stage

COMPONENT gate_xsop
  GENERIC( 
    width    : INTEGER RANGE 1 TO 32 := 1;
    invout   : BOOLEAN  := FALSE;
    q_mode   : mem_q_type;
    c_family : STRING);
  PORT(
    aa      : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    bb      : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    c       : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce      : IN  STD_LOGIC := '1';
    reset   : IN  STD_LOGIC := '0';
    o       : OUT STD_LOGIC_VECTOR((width+3)/4 - 1 DOWNTO 0);
    o_reg   : OUT STD_LOGIC_VECTOR((width+3)/4 - 1 DOWNTO 0));
END COMPONENT; -- gate_xsop

COMPONENT gfmac_mul
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER;
    gfx               : gfx_record_type;
    q_mode            : mem_q_type;
    extra_pipeline    : INTEGER; -- 1 for reg in middle of mult
    c_enable_rlocs    : INTEGER);
  PORT (
    reset       : IN  STD_LOGIC := '0'; -- register pins are optional
    enable_pipe : IN  STD_LOGIC := '1'; -- CE for pipeline register
    enable      : IN  STD_LOGIC := '1'; -- CE for output register
    clk         : IN  STD_LOGIC := '0';
    aa          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    bb          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    ss          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0) := (OTHERS => '0'); -- optional
    cc          : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    cc_reg      : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0));
END COMPONENT; -- gfmac_mul

COMPONENT gfmul
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER := 1;
    gfx               : gfx_record_type;
    q_mode            : mem_q_type := no_reg;
    extra_pipeline    : INTEGER := 0); -- 1 for reg in middle of mult
  PORT (
    reset       : IN  STD_LOGIC := '0'; -- register pins are optional
    enable_pipe : IN  STD_LOGIC := '1'; -- CE for pipeline register
    enable      : IN  STD_LOGIC := '1'; -- CE for output register
    clk         : IN  STD_LOGIC := '0';
    aa          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    bb          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    cc          : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    cc_reg      : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0));
END COMPONENT; -- gfmul

COMPONENT gfmul40
  GENERIC (
    q_mode   : mem_q_type := no_reg;
    c_family : STRING);
  PORT (
    reset  : IN  STD_LOGIC := '0'; -- register pins are optional
    enable : IN  STD_LOGIC := '1';
    clk    : IN  STD_LOGIC := '0';
    aa     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    bb     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    cc     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    cc_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT; -- gfmul40

COMPONENT gfmac
  GENERIC (
    c_family           : STRING;
    c_xdevicefamily    : STRING;
    c_elaboration_dir  : STRING;
    c_num_channels     : INTEGER;
    gfx                : gfx_record_type;
    extra_pipeline     : INTEGER := 0);
  PORT (
    reset   : IN  STD_LOGIC;
    enable  : IN  STD_LOGIC; -- enable for oo_reg register
    enable2 : IN  STD_LOGIC; -- enable for cc_reg register
    clk     : IN  STD_LOGIC;
    mac_sr  : IN  STD_LOGIC;
    aa      : IN  STD_LOGIC_VECTOR((gfx.symbol_width - 1) DOWNTO 0);
    bb      : IN  STD_LOGIC_VECTOR((gfx.symbol_width - 1) DOWNTO 0);
    cc      : OUT STD_LOGIC_VECTOR((gfx.symbol_width - 1) DOWNTO 0);
    cc_reg  : OUT STD_LOGIC_VECTOR((gfx.symbol_width - 1) DOWNTO 0);
    oo_reg  : OUT STD_LOGIC_VECTOR((gfx.symbol_width - 1) DOWNTO 0));
END COMPONENT; -- gfmac

COMPONENT gfcmul
  GENERIC (
    gfcx            : gfcx_record_type;
    q_mode          : mem_q_type := no_reg);
  PORT (
    reset  : IN  STD_LOGIC := '0'; -- register pins are optional
    enable : IN  STD_LOGIC := '1';
    clk    : IN  STD_LOGIC := '0';
    bb     : IN  STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0);
    cc     : OUT STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0);
    cc_reg : OUT STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0));
END COMPONENT; -- gfcmul

COMPONENT gfinvrom
  GENERIC (
    width             : INTEGER := 4;
    inverse_of        : integer_array_type;
    memstyle          : mem_style_type    := dist_mem;
    q_mode            : mem_q_type        := def_mem_q_type;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    c_xdevicefamily   : STRING;
    c_family          : STRING);
  PORT (
    enable : IN STD_LOGIC := '1';
    clk    : IN STD_LOGIC := '0';
    aa     : IN  STD_LOGIC_VECTOR((width - 1) DOWNTO 0);
    ii     : OUT STD_LOGIC_VECTOR((width - 1) DOWNTO 0);
    ii_reg : OUT STD_LOGIC_VECTOR((width - 1) DOWNTO 0));
END COMPONENT; -- gfinvrom

component gf_dual_basis_rom
  generic (
    C_WIDTH           : integer;
    C_HAS_DOUT_B      : integer := 0;
    C_HAS_ENA         : integer;
    C_HAS_ENB         : integer;
    CONV_DATA_DB2     : basis_convert_array; -- Dual-basis normal conversion
    CONV_DATA_2DB     : basis_convert_array; -- Normal to dual-basis conversion
    MIF_FILE_NAME     : string;
    C_ELABORATION_DIR : string;
    C_XDEVICEFAMILY   : string;
    C_FAMILY          : string
   );
  port (
    ena    : in  std_logic;
    enb    : in  std_logic;
    clk    : in  std_logic;
    din_a  : in  std_logic_vector(C_WIDTH-1 downto 0);
    din_b  : in  std_logic_vector(C_WIDTH-1 downto 0);
    dout_a : out std_logic_vector(C_WIDTH-1 downto 0);
    dout_b : out std_logic_vector(C_WIDTH-1 downto 0)
   );
end component;  --gf_dual_basis_rom

COMPONENT gf_chien_const_rom
  GENERIC (
    symbol_width      : INTEGER;
    alpha_to          : integer_array_type;
    c_has_n_in        : INTEGER;
    h_param           : INTEGER;
    c_n               : INTEGER;
    num_coeffs        : INTEGER;
    gen_start         : INTEGER;
    c_has_ce          : INTEGER;
    memstyle          : mem_style_type;
    c_addr_width      : INTEGER;
    c_xdevicefamily   : STRING;
    c_family          : STRING;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING );
  PORT (
    ce     : IN  STD_LOGIC;
    clk    : IN  STD_LOGIC;
    addra  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    addrb  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    dout_a : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    dout_b : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0) );
END COMPONENT; -- gf_chien_const_rom

COMPONENT gf_erase_const_rom
  GENERIC (
    symbol_width      : INTEGER;
    alpha_to          : integer_array_type;
    h_param           : INTEGER;
    c_has_ce          : INTEGER;
    memstyle          : mem_style_type;
    c_addr_width      : INTEGER;
    c_xdevicefamily   : STRING;
    c_family          : STRING;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING );
  PORT (
    ce     : IN  STD_LOGIC;
    clk    : IN  STD_LOGIC;
    addra  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    addrb  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    dout_a : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    dout_b : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0) );
END COMPONENT; -- gf_erase_const_rom

COMPONENT cfinv8 -- specifically for symbol_width = 8
  GENERIC (
    polynomial        : INTEGER := poly_default;
    latency           : INTEGER := latency_default;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    c_xdevicefamily   : STRING;
    c_family          : STRING);
  PORT (
    enable : IN  STD_LOGIC := '1';
    clk    : IN  STD_LOGIC := '0';
    aa     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    ii     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT; -- cfinv8

COMPONENT gfinv
  GENERIC (
    symbol_width      : symbol_width_type := symbol_width_default;
    polynomial        : INTEGER           := poly_default;
    memstyle          : mem_style_type    := dist_mem;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    c_xdevicefamily   : STRING;
    c_family          : STRING);
  PORT (
    enable  : IN STD_LOGIC;
    clk     : IN STD_LOGIC;
    aa      : IN  STD_LOGIC_VECTOR((symbol_width - 1) DOWNTO 0);
    ii      : OUT STD_LOGIC_VECTOR((symbol_width - 1) DOWNTO 0));
END COMPONENT; -- gfinv

COMPONENT gf_var_mult_const_rom
  GENERIC (
    c_addr_width      : INTEGER;
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_has_ce          : INTEGER;
    c_memstyle        : INTEGER;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    gen_start         : INTEGER;
    h                 : INTEGER;
    iteration         : INTEGER;
    nmk               : INTEGER;
    polynomial        : INTEGER;
    symbol_width      : INTEGER);
  PORT (
    ce        : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    addr_in   : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    coeff_out : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0) );
END COMPONENT; -- gf_var_mult_const_rom;

--------------------------------------------------------------------------------
END gf_pkg;
--------------------------------------------------------------------------------



LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;


PACKAGE BODY gf_pkg IS

--------------------------------------------------------------------------------
--
-- Faster version (for leonardo) of ul_util rat() using IF statements 
-- rather than CASE
--
--------------------------------------------------------------------------------
FUNCTION x_rat( value : std_logic )
  RETURN std_logic IS

BEGIN
--  CASE value IS
--    WHEN '0' | '1' => RETURN value;
--    WHEN 'H' => RETURN '1';
--    WHEN 'L' => RETURN '0';
--    WHEN OTHERS => RETURN 'X';
--  END CASE;
  IF (value = '0' OR value = 'L') THEN
    RETURN '0';
  ELSIF (value = '1' OR value = 'H') THEN
    RETURN '1';
  ELSE
    RETURN 'X';
  END IF;

END x_rat;



--------------------------------------------------------------------------------
--
-- Perform Shift Left Logical on STD_LOGIC_VECTOR
--
--------------------------------------------------------------------------------
FUNCTION x_sll( in_val: STD_LOGIC_VECTOR;
                num_bits_left: INTEGER) 
  RETURN STD_LOGIC_VECTOR IS

  VARIABLE result: STD_LOGIC_VECTOR(in_val'RANGE);
  VARIABLE zeroes: STD_LOGIC_VECTOR(num_bits_left - 1 DOWNTO 0) := (OTHERS => '0');    
BEGIN
  result := in_val(in_val'HIGH-num_bits_left DOWNTO 0) & zeroes;
  RETURN result;
END x_sll;



--------------------------------------------------------------------------------
--
-- Perform single bit Shift Left Logical on STD_LOGIC_VECTOR. Shift in
-- "shift_in_val".
--
-------------------------------------------------------------------------------
FUNCTION x_sll1( in_val       : STD_LOGIC_VECTOR;
                 shift_in_val : STD_LOGIC) 
  RETURN STD_LOGIC_VECTOR IS

  VARIABLE result: STD_LOGIC_VECTOR(in_val'RANGE);
  VARIABLE shift_in_vec : STD_LOGIC_VECTOR(0 DOWNTO 0); -- Hack for XCC bug
BEGIN
  shift_in_vec(0) := shift_in_val;
  result := in_val(in_val'HIGH-1 DOWNTO 0) & shift_in_vec;
  RETURN result;
END x_sll1;


--------------------------------------------------------------------------------
--
-- convert positive INTEGER to STRING
--
--------------------------------------------------------------------------------
FUNCTION x_to_string(in_val : INTEGER) RETURN STRING IS

VARIABLE digit          : INTEGER;
VARIABLE value          : INTEGER := in_val;
VARIABLE length         : INTEGER := 0;
VARIABLE posn           : INTEGER;
CONSTANT digit_string   : STRING(1 TO 10) := "0123456789";
VARIABLE result         : STRING(1 TO 10); -- enough to hold any INTEGER

BEGIN
  WHILE (10**length <= value) LOOP
    length := length + 1;
  END LOOP;
  IF (length > 0) THEN
    posn := length;
    WHILE (value /= 0) LOOP
      digit := value MOD 10;
      result(posn) := digit_string(digit + 1);
      value := value/10;
      posn := posn - 1;
    END LOOP;
  ELSE 
    RETURN "0";
  END IF;
  RETURN result(1 TO length);
END x_to_string;
        
--------------------------------------------------------------------------------
--
-- calculate xor of two natural numbers without
-- converting to STD_LOGIC_VECTOR's
--
--------------------------------------------------------------------------------
FUNCTION natural_xor(a, b, num_bits : NATURAL)
  RETURN NATURAL IS
  VARIABLE a_temp     : NATURAL := a;
  VARIABLE b_temp     : NATURAL := b;
  VARIABLE a_bit      : NATURAL := 0;
  VARIABLE b_bit      : NATURAL := 0;
  VARIABLE bit_weight : NATURAL := 1;
  VARIABLE result_bit : NATURAL := 0;
  VARIABLE result     : NATURAL := 0;
BEGIN
  bit_weight := 1;
  FOR bi IN 0 TO (num_bits - 1) LOOP
    a_bit := a_temp REM 2;
    b_bit := b_temp REM 2;
    result_bit := a_bit + b_bit;
    IF (result_bit = 1) THEN -- can only be 0, 1 or 2
      result := result + bit_weight;
    END IF;
    -- get ready for next bit
    a_temp := a_temp/2;
    b_temp := b_temp/2;
    bit_weight := bit_weight*2;
  END LOOP; 
  RETURN result;
END natural_xor;

--------------------------------------------------------------------------------
--
-- calculate xor of two integer numbers without
-- converting to STD_LOGIC_VECTOR's
--
--------------------------------------------------------------------------------
FUNCTION integer_xor(a, b, num_bits : INTEGER)
  RETURN INTEGER IS
  VARIABLE a_temp     : INTEGER := a;
  VARIABLE b_temp     : INTEGER := b;
  VARIABLE a_bit      : INTEGER := 0;
  VARIABLE b_bit      : INTEGER := 0;
  VARIABLE bit_weight : INTEGER := 1;
  VARIABLE result_bit : INTEGER := 0;
  VARIABLE result     : INTEGER := 0;
BEGIN
  bit_weight := 1;
  FOR bi IN 0 TO (num_bits - 1) LOOP
    a_bit := a_temp REM 2;
    b_bit := b_temp REM 2;
    result_bit := a_bit + b_bit;
    IF (result_bit = 1) THEN -- can only be 0, 1 or 2
      result := result + bit_weight;
    END IF;
    -- get ready for next bit
    a_temp := a_temp/2;
    b_temp := b_temp/2;
    bit_weight := bit_weight*2;
  END LOOP; 
  RETURN result;
END integer_xor;

--------------------------------------------------------------------------------
--
-- Convert INTEGER ARRAY to BIT_VECTOR
--
--------------------------------------------------------------------------------
FUNCTION integer_array_to_bit_vector(length: IN INTEGER;
                                     integer_array_length: IN INTEGER;
                                     integer_array : IN integer_array_type)
  RETURN BIT_VECTOR IS

  CONSTANT num_bits : INTEGER := integer_array_length*length;
  VARIABLE value : BIT_VECTOR(length - 1 DOWNTO 0) := (OTHERS => '0');
  VARIABLE result : BIT_VECTOR(num_bits - 1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  FOR ai IN 0 TO (integer_array_length - 1) LOOP -- ai = address index
    value := integer_to_bit_vector(integer_array(ai), length);
    FOR bi IN (length - 1) DOWNTO 0 LOOP -- bi = bit index
      result(ai*length + bi) := value(bi); 
    END LOOP; -- bi
  END LOOP; -- ai
  RETURN result;
END integer_array_to_bit_vector;



--------------------------------------------------------------------------------
--
-- calculate Galois field record elements
--
--------------------------------------------------------------------------------
FUNCTION gf_calc_elements(sw : symbol_width_type; 
                          polynomial : INTEGER)
  RETURN integer_array_type IS
  CONSTANT swm1       : INTEGER := sw - 1;
  CONSTANT gfas       : INTEGER := 2**sw;
  CONSTANT gfasm1     : INTEGER := gfas - 1;
  CONSTANT gfasm2     : INTEGER := gfas - 2;
  VARIABLE alpha_to   : integer_array_type(0 TO gfasm2);
  VARIABLE p          : INTEGER := 0;
  VARIABLE mask       : INTEGER := 0;
  VARIABLE temp       : INTEGER := 0;
  VARIABLE jm1        : INTEGER := 0;
BEGIN
  IF polynomial = 0 THEN
    
    ASSERT default_polynomial(sw) /= 0
      REPORT "Error: No polynomial supplied and no default available for specified symbol width."
      SEVERITY FAILURE;
      
    p := default_polynomial(sw);
  ELSE
    p := polynomial;
  END IF;
  
  p := p REM gfas; -- remove most signicant bit if p > gfas
  
  
  --
  -- Create the Galois field elements alpha_to(0 TO swm1)
  --
  mask := 1;
  FOR i IN 0 TO swm1 LOOP
    alpha_to(i) := mask;
    mask := mask*2;
  END LOOP;
  mask := mask/2; -- reduce mask 
  alpha_to(sw) := p;
  --
  -- create the remaining Galois field elements
  --  
  FOR j IN (sw + 1) TO gfasm2 LOOP
    jm1 := j - 1;
    IF (alpha_to(jm1) >= mask) THEN
      temp := 2*(alpha_to(jm1) - mask);
      alpha_to(j) := natural_xor(p, temp, sw);
    ELSE 
      alpha_to(j) := alpha_to(jm1)*2;
    END IF;  
  END LOOP; -- j
  RETURN alpha_to;
END gf_calc_elements;

--------------------------------------------------------------------------------
--
-- create Galois field index array
--
--------------------------------------------------------------------------------
FUNCTION gf_calc_indices(sw       : symbol_width_type; 
                         alpha_to : integer_array_type)
  RETURN integer_array_type IS
  CONSTANT swm1       : INTEGER := sw - 1;
  CONSTANT gfas       : INTEGER := 2**sw;
  CONSTANT gfasm1     : INTEGER := gfas - 1;
  CONSTANT gfasm2     : INTEGER := gfas - 2;
  VARIABLE index_of   : integer_array_type(0 TO gfasm1);
BEGIN
  -- initialise index_of() array
  -- index_of(0) will have biggest possible negative integer to represent -ve infinity
  FOR i IN 0 TO gfasm1 LOOP
    index_of(i) := INTEGER'LOW;
  END LOOP;
  -- find index for each Galois field element
  FOR i IN 0 TO gfasm2 LOOP
    index_of(alpha_to(i)) := i;        
  END LOOP;
  RETURN index_of;
END gf_calc_indices;

--------------------------------------------------------------------------------
--
-- simple test function to check that field polynomial is primitive:
-- if there are zeroes in index_of array, 
-- not all the Galois field elements are unique,
-- therefore the field polynomial isn't primitive 
-- 
--------------------------------------------------------------------------------
FUNCTION gf_check_primitivity(sw       : symbol_width_type; 
                              index_of : integer_array_type)
  RETURN BOOLEAN IS
  CONSTANT swm1         : INTEGER := sw - 1;
  CONSTANT gfas         : INTEGER := 2**sw;
  CONSTANT gfasm1       : INTEGER := gfas - 1;
  CONSTANT gfasm2       : INTEGER := gfas - 2;
  VARIABLE is_primitive : BOOLEAN := TRUE;
BEGIN
  -- don't check index_of(0) as it has been set to "-ve infinity"
  -- don't check index_of(1) as it is always zero
  FOR i IN 2 TO gfasm1 LOOP
    IF index_of(i) = 0 THEN
      is_primitive := FALSE;
      EXIT;
    END IF;
  END LOOP; -- i
  
  ASSERT is_primitive = TRUE
    REPORT "Error: Specified polynomial is not primitive for specified symbol width!"
    SEVERITY FAILURE;
    
  RETURN is_primitive;
  
END gf_check_primitivity;

--------------------------------------------------------------------------------
-- 
-- function to calculate Galois field element inverses
-- 
--------------------------------------------------------------------------------
FUNCTION gf_calc_inverses(sw : symbol_width_type;
                          alpha_to : integer_array_type;
                          index_of : integer_array_type)
  RETURN integer_array_type IS
  CONSTANT swm1       : INTEGER := sw - 1;
  CONSTANT gfas       : INTEGER := 2**sw;
  CONSTANT gfasm1     : INTEGER := gfas - 1;
  CONSTANT gfasm2     : INTEGER := gfas - 2;
  VARIABLE inverse_of : integer_array_type(0 TO gfasm1);
  VARIABLE inverse_index : INTEGER;
BEGIN
  inverse_of(0) := 0;
  FOR gfe IN 1 TO gfasm1 LOOP
    inverse_index := (gfasm1 - index_of(gfe)) REM gfasm1;
    inverse_of(gfe) := alpha_to(inverse_index);
  END LOOP; -- gfe
  RETURN inverse_of;
END gf_calc_inverses;
  
  
  
--------------------------------------------------------------------------------
--
-- Function to create the xor-sum-of-product (qterm) equations for the 
-- multiplier.
--
-- For example, with symbol_width = 4, the (2*symbol_width - 1) qterm's are:
--
--                      A3   A2   A1   A0          
--                   x  B3   B2   B1   B0        qterm(0) = A0B0     
--     -----------------------------------       qterm(1) = A0B1 + A1B0     
--                     A3B0 A2B0 A1B0 A0B0  or:  qterm(2) = A0B2 + A1B1 + A2B0     
--                A3B1 A2B1 A1B1 A0B1            qterm(3) = A0B3 + A1B2 + A2B1 + A3B0     
--           A3B2 A2B2 A1B2 A0B2                 qterm(4) = A1B3 + A2B2 + A3B1     
--      A3B3 A2B3 A1B3 A0B3                      qterm(5) = A2B3 + A3B2 
--     -----------------------------------       qterm(6) = A3B3
-- qterm  6    5    4    3    2    1    0
--
--------------------------------------------------------------------------------
FUNCTION gfx_calc_qterms(initial_gfx : gfx_record_type;
                         sw          : INTEGER)
  RETURN gfx_record_type IS
  VARIABLE gfx     : gfx_record_type := initial_gfx;
  CONSTANT swm1    : INTEGER := sw - 1;
  CONSTANT swx2m2  : INTEGER := sw*2 - 2;
  VARIABLE loffset : INTEGER := sw*3; -- account for A, B, & S input buses
BEGIN

  -- 
  -- First create top half of qterm triangle
  --  
  FOR qi IN 0 TO swm1 LOOP -- lqterm index 
  
    FOR pi IN 0 TO qi LOOP -- inner pterm index for AxBy product terms
      gfx.qterm(qi).a(pi) := pi;
      gfx.qterm(qi).b(pi) := qi - pi;
      --gfx.qterm(qi).num_pterms := gfx.qterm(qi).num_pterms + 1;
    END LOOP; -- pi
    
    gfx.qterm(qi).num_pterms := qi + 1;
    
  END LOOP; -- qi
   
   
  -- 
  -- Now create bottom half of qterm triangle
  --  
  FOR qi IN sw TO swx2m2 LOOP -- lqterm index  
  
    FOR pi IN 0 TO (swx2m2 - qi) LOOP -- inner pterm index
      gfx.qterm(qi).a(pi) := qi - swm1 + pi;
      gfx.qterm(qi).b(pi) := swm1 - pi;
    END LOOP; -- pi
    
    gfx.qterm(qi).num_pterms := swx2m2 + 1 - qi;
    
  END LOOP; -- qi
  
  --
  -- Calculate num_suboutputs and suboutput indices for each qterm
  -- this assumes that blocks of eight input signals will be concatenated using
  -- two luts and an XORCY -- explain better
  --
  FOR qi IN 0 TO swx2m2 LOOP -- lqterm index
  
    gfx.qterm(qi).num_suboutputs := (gfx.qterm(qi).num_pterms+3)/4;
    
    FOR soi IN 0 TO (gfx.qterm(qi).num_suboutputs - 1) LOOP 
      gfx.qterm(qi).suboutput(soi) := loffset;
      loffset := loffset + 1;
    END LOOP; -- soi
    
  END LOOP; -- qi  
  
  RETURN gfx;
  
END gfx_calc_qterms;



--------------------------------------------------------------------------------
--
-- Function to calculate cterm equations
--
--------------------------------------------------------------------------------
FUNCTION gfx_calc_cterms(alpha_to_short : integer_array_type;
                         initial_gfx    : gfx_record_type;
                         sw             : INTEGER)
  RETURN gfx_record_type IS
  VARIABLE gfx             : gfx_record_type := initial_gfx;
  VARIABLE si              : INTEGER;
  VARIABLE alpha_to_qi_slv : STD_LOGIC_VECTOR(sw-1 DOWNTO 0);
  
BEGIN

    
  FOR ci IN 0 TO (sw-1) LOOP -- cterm index
    si := 0;
    
    IF (gfx.is_mac = TRUE) THEN -- add accumulator input signal index
      gfx.cterm(ci).s(si) := 2*sw + ci;
      si := si + 1;
    END IF; -- is_mac
    
    --ASSERT FALSE
    --  REPORT "gfx_calc_cterms: gfx.qterm(" &
    --         integer'image(ci) & ") = " &
    --         integer'image(gfx.qterm(ci).num_pterms) & new_line
    --  SEVERITY NOTE;
    
      
    --
    -- Add suboutput signals for qterm(ci)
    --
    FOR soi IN 0 TO (gfx.qterm(ci).num_suboutputs - 1) LOOP
      gfx.cterm(ci).s(si) := gfx.qterm(ci).suboutput(soi);
      si := si + 1;
    END LOOP; -- soi
    
    -- The first sw qterms are always used once
    gfx.qterm(ci).times_used := 1;
    
    --
    -- Add relevant suboutput signals for qterm(qi)'s
    --
    FOR qi IN sw TO (2*sw - 2) LOOP
      alpha_to_qi_slv := natural_to_std_logic_vector(alpha_to_short(qi),sw);
      
      IF (alpha_to_qi_slv(ci) = '1') THEN
        --
        -- add qterm(qi) suboutput signals
        --
        FOR soi IN 0 TO (gfx.qterm(qi).num_suboutputs - 1) LOOP
          gfx.cterm(ci).s(si) := gfx.qterm(qi).suboutput(soi);
          si := si + 1;
        END LOOP; -- soi      
        gfx.qterm(qi).times_used := gfx.qterm(qi).times_used + 1;
        
      END IF; -- alpha_to
    END LOOP; -- qi
    
    gfx.cterm(ci).num_sterms := si;
  END LOOP; -- ci
   
  RETURN gfx;
  
END gfx_calc_cterms;



--------------------------------------------------------------------------------
--
-- function to calculate Galois field general multiplier record details
--
--------------------------------------------------------------------------------
FUNCTION gfx_calc_record( symbol_width   : symbol_width_type;
                          polynomial     : INTEGER;
                          is_mac         : BOOLEAN;
                          alpha_to_short : integer_array_type)
  RETURN gfx_record_type IS
  VARIABLE gfx : gfx_record_type;
BEGIN
  -- Copy parameters into record
  gfx.symbol_width := symbol_width;
  gfx.polynomial := polynomial;
  gfx.pack_cterms := TRUE;
  gfx.is_mac := is_mac;
  
  -- Now start doing calculations
  gfx := gfx_calc_qterms(gfx, symbol_width);
  gfx := gfx_calc_cterms(alpha_to_short, gfx, symbol_width);
  
  RETURN gfx;
END gfx_calc_record;



--------------------------------------------------------------------------------
--
-- calculate constant coefficient multiplier 
-- xor-sum-of-products logic equations and associated details
--
--------------------------------------------------------------------------------
FUNCTION gfcx_calc_cterms(alpha_to_short : integer_array_type;
                          initial_gfcx   : gfcx_record_type;
                          sw             : INTEGER)
  RETURN gfcx_record_type IS
  VARIABLE gfcx           : gfcx_record_type := initial_gfcx;
  CONSTANT swm1           : INTEGER := sw - 1;
  VARIABLE subs           : max_symbol_type;
  VARIABLE constant_input : max_symbol_type;
  VARIABLE useb           : max_symbol_matrix_type;
  VARIABLE sumi           : INTEGER;
  VARIABLE num_sterms     : INTEGER;
BEGIN

  constant_input := natural_to_std_logic_vector(gfcx.constant_coefficient, max_symbol_width);
  
  --
  -- Initialise the useb symbol matrix
  --
  FOR i IN 0 TO swm1 LOOP
    useb(i) := (OTHERS => '0');
  END LOOP;
  
  --  
  -- Main calculation loop
  --
  FOR bi IN 0 TO swm1 LOOP
    FOR ai IN 0 TO swm1 LOOP
      sumi := ai + bi;
      IF (sumi > swm1) THEN
        -- reduce polynomial degree by substitution:
        subs := natural_to_std_logic_vector(alpha_to_short(sumi), max_symbol_width);
        -- add product terms of substituted polynomial:
        FOR si IN 0 TO swm1 LOOP
          IF (subs(si) = '1') THEN
            -- only add bterm if aterm bit is set
            IF(constant_input(ai) = '1') THEN
              -- if this is the second time bi is used
              -- then don't use it !
              useb(si)(bi) := NOT useb(si)(bi);  
            END IF;
          END IF;
        END LOOP; -- si       
      ELSE
        IF (constant_input(ai) = '1') THEN
          useb(sumi)(bi) := NOT useb(sumi)(bi);  
        END IF;
      END IF; -- sumi                                            
    END LOOP; -- ai
  END LOOP; -- bi
  
  --
  -- Tidy and build up sterm equations
  --
  FOR ci IN 0 TO swm1 LOOP
    num_sterms := 0;
    FOR bi IN 0 TO swm1 LOOP
      IF (useb(ci)(bi) = '1') THEN
        gfcx.cterm(ci).s(num_sterms) := bi;
        num_sterms := num_sterms + 1;
      END IF;
    END LOOP; -- bi
    gfcx.cterm(ci).num_sterms := num_sterms;
  END LOOP; -- ci
  
  RETURN gfcx;
  
END gfcx_calc_cterms;


--------------------------------------------------------------------------------
--
-- Function to calculate Galois field constant coefficient
-- multiplier record details
--
--------------------------------------------------------------------------------
FUNCTION gfcx_calc_record( symbol_width         : symbol_width_type;
                           polynomial           : INTEGER;
                           alpha_to_short       : integer_array_type;
                           constant_coefficient : INTEGER)
  RETURN gfcx_record_type IS
  VARIABLE gfcx : gfcx_record_type;
BEGIN
  -- Copy parameters into record
  gfcx.symbol_width := symbol_width;
  gfcx.polynomial := polynomial;
  gfcx.constant_coefficient := constant_coefficient;

  -- Now start doing calculations
  gfcx := gfcx_calc_cterms(alpha_to_short, gfcx, symbol_width);
  
  RETURN gfcx;
END gfcx_calc_record;

END gf_pkg;







--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- Description: Building block XOR-Sum-of-Product gate for pterms <= 4
--
-- Author: Dwayne Burns
--
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/xsopgate.vhd,v 1.2 2011/04/19 11:53:02 billw Exp $
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.fdce;
USE unisim.vcomponents.xorcy;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY xsop4_stage IS
  GENERIC( 
    width          : INTEGER RANGE 1 TO 4 := 1;
    invout         : BOOLEAN              := FALSE;
    q_mode         : mem_q_type           := no_reg);
--    num_lut_inputs : INTEGER);
  PORT(
    aa    : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    bb    : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    c     : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce    : IN  STD_LOGIC := '1';
    reset : IN  STD_LOGIC := '0';
    o     : OUT STD_LOGIC;
    o_reg : OUT STD_LOGIC );
END xsop4_stage;

ARCHITECTURE synth OF xsop4_stage IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  
SIGNAL xsop_out : STD_LOGIC := '0';

-- No longer required as 4-input LUT families are not supported anymore
-- -- Use pkg_baseblox function to determine how many inputs a LUT has
-- CONSTANT keep_lut4 : STRING := select_string("true", "false", num_lut_inputs > 4);
-- --                 select_string("true", "false", derived("virtex5", c_family));
-- 
-- ATTRIBUTE keep OF xsop_out : SIGNAL IS keep_lut4;

-- Architecture Body
--
BEGIN
   
  ----------------------------------------------------------------------------
  w1 : IF width = 1 GENERATE
  
    xsop_out <= aa(0) AND bb(0);
    
  END GENERATE; -- w1
      
      
  ----------------------------------------------------------------------------
  w2 : IF width = 2 GENERATE
    
    xog1 : IF invout GENERATE
      xsop_out <= NOT((aa(0) AND bb(0)) XOR (aa(1) AND bb(1)));
    END GENERATE; -- xog1
    
    xog2 : IF NOT(invout) GENERATE
      xsop_out <= (aa(0) AND bb(0)) XOR (aa(1) AND bb(1));
    END GENERATE; -- xog2
    
  END GENERATE; -- w2

  
  ----------------------------------------------------------------------------
  w3 : IF width = 3 GENERATE
    SIGNAL xsop_tmp1 : STD_LOGIC := '0';
    SIGNAL xsop_tmp2 : STD_LOGIC := '0';
--     ATTRIBUTE keep OF xsop_tmp1 : SIGNAL IS keep_lut4;
--     ATTRIBUTE keep OF xsop_tmp2 : SIGNAL IS keep_lut4;
  BEGIN
  
    xog1 : IF invout GENERATE
      xsop_tmp1 <= NOT((aa(0) AND bb(0)) XOR (aa(1) AND bb(1)));
    END GENERATE; -- xog1
    
    xog2 : IF NOT(invout) GENERATE
      xsop_tmp1 <= (aa(0) AND bb(0)) XOR (aa(1) AND bb(1));
    END GENERATE; -- xog2
    
    
    xsop_tmp2 <= (aa(2) AND bb(2));
    
-- 4 i/p LUTS no longer supported    
--     xg1 : IF num_lut_inputs > 4 GENERATE
      xsop_out <= xsop_tmp1 XOR xsop_tmp2;
--     END GENERATE; -- xg1
--     
--     xg2 : IF num_lut_inputs <= 4 GENERATE
--       xcy : xorcy
--       PORT MAP( li => xsop_tmp1, ci => xsop_tmp2, o => xsop_out );
--     END GENERATE; -- xg2
  
  END GENERATE; -- w3

  
  ----------------------------------------------------------------------------
  w4 : IF width = 4 GENERATE
    SIGNAL xsop_tmp1 : STD_LOGIC := '0';
    SIGNAL xsop_tmp2 : STD_LOGIC := '0';
--     ATTRIBUTE keep OF xsop_tmp1 : SIGNAL IS keep_lut4;
--     ATTRIBUTE keep OF xsop_tmp2 : SIGNAL IS keep_lut4;
  BEGIN

    xog1 : IF invout GENERATE
      xsop_tmp1 <= NOT((aa(0) AND bb(0)) XOR (aa(1) AND bb(1)));
    END GENERATE; -- xog1
    
    xog2 : IF NOT(invout) GENERATE
      xsop_tmp1 <= (aa(0) AND bb(0)) XOR (aa(1) AND bb(1));
    END GENERATE; -- xog2
    
    
    xsop_tmp2 <= (aa(2) AND bb(2)) XOR (aa(3) AND bb(3));
    
    
-- 4 i/p LUTS no longer supported    
--     xg1 : IF num_lut_inputs > 4 GENERATE
      xsop_out <= xsop_tmp1 XOR xsop_tmp2;
--     END GENERATE; -- xg1
--     
--     xg2 : IF num_lut_inputs <= 4 GENERATE
--       xcy : xorcy
--       PORT MAP( li => xsop_tmp1, ci => xsop_tmp2, o => xsop_out );
--     END GENERATE; -- xg2
  
  END GENERATE; -- w4
    
    
    
  ----------------------------------------------------------------------------
  -- Optional registered output
  nr : IF q_mode = no_reg GENERATE
  BEGIN
    o     <= xsop_out;
    o_reg <= xsop_out;
  END GENERATE; -- no_reg

  ranr : IF q_mode = reg_and_no_reg GENERATE
  
    ff0 : fdce
    PORT MAP(d=>xsop_out, ce=>ce, c=>c, clr=>reset, q=>o_reg);
    
    o <= xsop_out;
      
  END GENERATE; -- reg_and_no_reg
            
            
            
  r : IF q_mode = reg GENERATE
    SIGNAL reg_out : STD_LOGIC := '0';
  BEGIN
    ff0 : fdce
    PORT MAP(d=>xsop_out, ce=>ce, c=>c, clr=>reset, q=>reg_out);
      
    o     <= reg_out;
    o_reg <= reg_out;
  END GENERATE; -- reg
  
END synth; -- xsop4_stage



--------------------------------------------------------------------------------
--
-- Description: XOR-Sum-of-Product gate for Galois field multiplier
-- Note that this component can have several suboutputs - anything
-- that instantiates it must support these suboutputs
--
-- Author: Dwayne Burns
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;



ENTITY gate_xsop IS
  GENERIC( 
    width    : INTEGER RANGE 1 TO 32 := 1;
    invout   : BOOLEAN               := FALSE;
    q_mode   : mem_q_type;
    c_family : STRING);
  PORT(
    aa      : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    bb      : IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    c       : IN  STD_LOGIC := '0'; -- Register pins are optional
    ce      : IN  STD_LOGIC := '1';
    reset   : IN  STD_LOGIC := '0';
    o       : OUT STD_LOGIC_VECTOR((width + 3)/4 - 1 DOWNTO 0);
    o_reg   : OUT STD_LOGIC_VECTOR((width + 3)/4 - 1 DOWNTO 0));
END gate_xsop;

ARCHITECTURE synth OF gate_xsop IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


-- 4 i/p LUTS no longer supported    
-- -- The "keep" attribute is used in some places to force XST to route a
-- -- critical path signal to the 2nd of 2 LUTs in a chain. This may lead to
-- -- unneccessary additional LUTs in 6-LUT architectures so turn this off for
-- -- these.
-- CONSTANT num_lut_inputs : INTEGER := fn_get_lut_size(fn_check_family(c_family));

CONSTANT num_suboutputs : INTEGER := (width + 3)/4;

BEGIN


  xsop : FOR xsopi IN 0 TO (num_suboutputs - 1) GENERATE
    CONSTANT ptltp : INTEGER := width - xsopi*4; -- pterms left to process
  BEGIN

    -- If there are more than 3 pterms to process, then
    -- generate a full xsop4_stage
    gt3 : IF ptltp > 3 GENERATE
      SIGNAL int_aa : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
      SIGNAL int_bb : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
    BEGIN
      -- connect appropriate input signal slices to xsop4_stage inputs
      int_inps: FOR si IN 0 TO 3 GENERATE
      BEGIN
        int_aa(si) <= aa(xsopi*4 + si);
        int_bb(si) <= bb(xsopi*4 + si);
      END GENERATE; -- int_inps
      
      xsop_stage : xsop4_stage
      GENERIC MAP (
        width          => 4,
        invout         => invout,
        q_mode         => q_mode)
--        num_lut_inputs => num_lut_inputs)
      PORT MAP (
        aa    => int_aa,
        bb    => int_bb,
        c     => c,
        ce    => ce,
        reset => reset,
        o     => o(xsopi),
        o_reg => o_reg(xsopi));
    END GENERATE; -- ptltp_gt3
    
    -- If there are less than 4 pterms, build up input buses for a
    -- reduced-size xsop4_stage
    lt4 : IF ptltp < 4 GENERATE
      CONSTANT ptltpm1 : INTEGER := ptltp - 1;
      SIGNAL int_aa : STD_LOGIC_VECTOR(ptltpm1 DOWNTO 0) := (others => '0');
      SIGNAL int_bb : STD_LOGIC_VECTOR(ptltpm1 DOWNTO 0) := (others => '0');
    BEGIN
      -- connect appropriate input signal slices to xsop4_stage inputs
      int_inps: FOR si IN 0 TO ptltpm1 GENERATE
      BEGIN
        int_aa(si) <= aa(xsopi*4 + si);
        int_bb(si) <= bb(xsopi*4 + si);
      END GENERATE; -- int_inp
      
      xsop_stage : xsop4_stage
      GENERIC MAP (
        width          => ptltp,
        invout         => invout,
        q_mode         => q_mode)
--        num_lut_inputs => num_lut_inputs)
      PORT MAP (
        aa    => int_aa,
        bb    => int_bb,
        c     => c,
        ce    => ce,
        reset => reset,
        o     => o(xsopi),
        o_reg => o_reg(xsopi));
    END GENERATE; -- ptltp_lt4
    
  END GENERATE; -- xsop

END synth; -- gate_xsop



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfcmul.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--  Description: Galois field constant coefficient multiplier
--
--  Author: Dwayne Burns
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;



LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gfcmul IS
  GENERIC (
    gfcx            : gfcx_record_type;
    q_mode          : mem_q_type := no_reg
  );
  PORT (
    reset  : IN  STD_LOGIC := '0'; -- register pins are optional
    enable : IN  STD_LOGIC := '1';
    clk    : IN  STD_LOGIC := '0';
    bb     : IN  STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0);
    cc     : OUT STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0);
    cc_reg : OUT STD_LOGIC_VECTOR(gfcx.symbol_width - 1 DOWNTO 0)
  );
END gfcmul;

ARCHITECTURE synth OF gfcmul IS    

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

BEGIN

  -- Generate each bit of the multiplier
  c:
  FOR ci IN 0 TO (gfcx.symbol_width - 1) GENERATE
    CONSTANT int_inp_msb : INTEGER := gfcx.cterm(ci).num_sterms - 1;
  BEGIN
  
    -- handle zero width xor special case
    z: IF int_inp_msb < 0 GENERATE
      SIGNAL int_inp : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
    BEGIN
    
      x1 : gate_xor
      GENERIC MAP (width  => 1,
                   invout => FALSE,
                   q_mode => q_mode)
      PORT MAP ( inp => int_inp,
                 c => clk,
                 ce => enable,
                 reset => reset,
                 o => cc(ci),
                 o_reg => cc_reg(ci) );
                 
    END GENERATE; -- zero_gen
		
        
    gtz: IF int_inp_msb > -1 GENERATE		 
      SIGNAL int_inp : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0):= (others => '0');
    BEGIN
    
      -- connect appropriate sterms to bus that will be passed to gate_xor
      iig: FOR si IN 0 TO int_inp_msb GENERATE
        int_inp(si) <= bb(gfcx.cterm(ci).s(si));
      END GENERATE; -- int_inp_gen
      
      x2 : gate_xor
      GENERIC MAP (width => int_inp_msb + 1,
                   invout => FALSE,
                   q_mode => q_mode)
      PORT MAP ( inp => int_inp,
                 c => clk,
                 ce => enable,
                 reset => reset,
                 o => cc(ci),
                 o_reg => cc_reg(ci) );
                 
    END GENERATE; -- gfz_gen
    
  END GENERATE; -- cterm_gen
  
END synth; -- gfcmul



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfmul.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--  Description: Galois field general multiplier and optional GF adder support
--  Note if c_num_channels > 1 cc and cc_reg will be identical.
--
--  Author: Dwayne Burns, Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;



LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gfmul IS
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER := 1;
    gfx               : gfx_record_type;
    q_mode            : mem_q_type := no_reg;
    extra_pipeline    : INTEGER := 0 -- 1 for reg in middle of mult
  );
  PORT (
    reset       : IN  STD_LOGIC := '0'; -- register pins are optional
    enable_pipe : IN  STD_LOGIC := '1'; -- CE for pipeline & multi-channel regs
    enable      : IN  STD_LOGIC := '1'; -- CE for output register
    clk         : IN  STD_LOGIC := '0';
    aa          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    bb          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    cc          : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    cc_reg      : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0)
  );
  
END gfmul;

ARCHITECTURE synth OF gfmul IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";



CONSTANT multi_channel     : BOOLEAN := (c_num_channels > 1);
CONSTANT extra_pipe_int    : INTEGER :=
                              bool_to_int(extra_pipeline/=0 OR multi_channel);
  
CONSTANT sw   : INTEGER := gfx.symbol_width;
CONSTANT swm1 : INTEGER := sw - 1;

-- Only register outputs of xsop if extra_pipeline=1
CONSTANT xsop_q_mode : INTEGER := select_val(no_reg, reg, extra_pipe_int);
  

-- Determine whether to register xor output
FUNCTION get_xor_q_mode RETURN INTEGER IS
BEGIN
  IF multi_channel THEN
    IF c_num_channels = 2 THEN
      RETURN no_reg;
    ELSE
      RETURN reg; -- more than 2 channels
    END IF;
  ELSE
    RETURN q_mode;
  END IF; -- multi_channel

END get_xor_q_mode;


-- xor output register takes care of 1 of the channel output delay stages
CONSTANT xor_q_mode : INTEGER := get_xor_q_mode;


SIGNAL isig       : STD_LOGIC_VECTOR(max_isig_index DOWNTO 0) := (others => '0');
SIGNAL cc_tmp     : STD_LOGIC_VECTOR(swm1 DOWNTO 0) := (others => '0');
SIGNAL cc_tmp_reg : STD_LOGIC_VECTOR(swm1 DOWNTO 0) := (others => '0');
SIGNAL ss         : STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0) := (others => '0');

--
-- Architecture Body
--
BEGIN
  
  -- ss is a legacy signal from the gfmac_mul
  ss(swm1 DOWNTO 0) <= (OTHERS=>'0');
  
  --
  -- copy input buses onto internal signal bus so that appropriate lut
  -- input/output signals can be selected using single indices
  --
  isig((3*sw - 1) DOWNTO 2*sw) <= ss;
  isig((2*sw - 1) DOWNTO sw) <= bb;
  isig(swm1 DOWNTO 0) <= aa;
  
  --
  -- generate multiplier qterms (ie A0B0, A0B1 xor A1B0, etc)
  --
  q:
  FOR qi IN 0 TO (2*sw - 2) GENERATE
    
    CONSTANT int_inp_msb : INTEGER := gfx.qterm(qi).num_pterms - 1;
    CONSTANT int_qq_msb  : INTEGER := (gfx.qterm(qi).num_pterms + 3)/4 - 1;
    
    SIGNAL int_aa  : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0) := (others => '0');
    SIGNAL int_bb  : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0) := (others => '0');
    SIGNAL int_qq  : STD_LOGIC_VECTOR(int_qq_msb DOWNTO 0) := (others => '0');
    SIGNAL int_qqr : STD_LOGIC_VECTOR(int_qq_msb DOWNTO 0) := (others => '0');
  BEGIN
    -- connect appropriate sterms to bus that will be passed to gate_xsop
    intic: 
    FOR si IN 0 TO int_inp_msb GENERATE
      int_aa(si) <= isig(gfx.qterm(qi).a(si));
      int_bb(si) <= isig(gfx.qterm(qi).b(si) + sw); -- add sw offset
    END GENERATE; -- int_inps
    
    xsop : gate_xsop
    GENERIC MAP (
      width    => int_inp_msb + 1,
      invout   => FALSE,
      q_mode   => xsop_q_mode,
      c_family => c_family)
    PORT MAP ( 
      aa    => int_aa,
      bb    => int_bb,
      c     => clk,
      ce    => enable_pipe,
      reset => reset,
      o     => int_qq,
      o_reg => int_qqr);
      
    ig1: IF extra_pipe_int = 0 GENERATE
      -- connect non-registered outputs to isig bus
      ig2: 
      FOR qtsoi IN 0 TO (gfx.qterm(qi).num_suboutputs - 1) GENERATE
        isig(gfx.qterm(qi).suboutput(qtsoi)) <= int_qq(qtsoi);
      END GENERATE; -- ig2
    END GENERATE; -- ig1
    
    ig3: IF extra_pipe_int /= 0 GENERATE
      -- connect registered outputs to isig bus
      ig4: 
      FOR qtsoi IN 0 TO (gfx.qterm(qi).num_suboutputs - 1) GENERATE
        isig(gfx.qterm(qi).suboutput(qtsoi)) <= int_qqr(qtsoi);
      END GENERATE; -- ig4
    END GENERATE; -- ig3
    
  END GENERATE; -- q
  
  
  --
  -- Generate multiplier cterms
  --
  c:
  FOR ci IN 0 TO swm1 GENERATE
    CONSTANT int_inp_msb : INTEGER := gfx.cterm(ci).num_sterms - 1;
    SIGNAL int_inp : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0) := (others => '0');
  BEGIN		
    -- connect appropriate sterms from isig bus to bus that will be 
    -- passed to gate_xor
    intic: 
    FOR si IN 0 TO int_inp_msb GENERATE
    BEGIN
      int_inp(si) <= isig(gfx.cterm(ci).s(si));
    END GENERATE; -- int_inp
    
    x : gate_xor
    GENERIC MAP (
      width       => int_inp_msb + 1,
      invout      => FALSE,
      q_mode      => xor_q_mode)
    PORT MAP ( 
      inp   => int_inp,
      c     => clk,
      ce    => enable,
      reset => reset,
      o     => cc_tmp(ci),
      o_reg => cc_tmp_reg(ci));
  
  
    
  END GENERATE; -- c
  
  mcg1: IF NOT(multi_channel) GENERATE
    cc     <= cc_tmp;
    cc_reg <= cc_tmp_reg;
  END GENERATE; -- mcg1
    
  -- Total delay on cc must equal c_num_channels-1
  -- 1st delay is extra_pipeline register
  -- 2nd delay is cc_reg register
  -- Extra delay beyond that is in big_delay ccd
  mcg2: IF multi_channel GENERATE
    SIGNAL cc_del : STD_LOGIC_VECTOR(swm1 DOWNTO 0) := (others => '0');
  BEGIN
    -- Total delay = 1 => only extra_pipeline reg is reqd
    mcg2a: IF c_num_channels = 2 GENERATE
      cc_del <= cc_tmp;
    END GENERATE; -- mcg2a
    
    -- Total delay = 2 => extra_pipline reg + cc_tmp_reg
    mcg2b: IF c_num_channels = 3 GENERATE
      cc_del <= cc_tmp_reg;
    END GENERATE; -- mcg2b
    
    
    mcg2c: IF c_num_channels > 3 GENERATE
    
      -- Instantiate shift register to hold cc value for each channel.
      -- If there is only 1 channel then cc is not registered.
      ccd : big_delay
      GENERIC MAP (
        c_family          => c_family,
        c_xdevicefamily   => c_xdevicefamily,
        c_elaboration_dir => c_elaboration_dir,
        bus_width         => sw,
        clk_delay         => c_num_channels-3,
        memstyle          => dist_mem,
        c_has_ce          => 1 )
      PORT MAP (
        din  => cc_tmp_reg,
        clk  => clk,
        ce   => enable_pipe,
        dout => cc_del );
    END GENERATE; -- mcg2c
     
    -- cc and cc_reg identical, which may not be correct for all applications
    cc_reg <= cc_del;
    cc     <= cc_del;
  END GENERATE; -- mcg2
    
  
END synth; -- gfmul





--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfmac_mul.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
--  Description: Galois field general multiplier and optional GF adder support
--  Note if c_num_channels > 1 the extra registering is applied to the cc
--  output. cc_reg is treated as a special case for the BMA disc signal.
--  This multiplier is specially designed for use in the BMA gfmac. Use gfmul
--  for standard multiplier applications.
--
--  Author: Bill Wilkie
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gfmac_mul IS
  GENERIC (
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_elaboration_dir : STRING;
    c_num_channels    : INTEGER;
    gfx               : gfx_record_type;
    q_mode            : mem_q_type;
    extra_pipeline    : INTEGER; -- 1 for reg in middle of mult
    c_enable_rlocs    : INTEGER
  );
  PORT (
    reset       : IN  STD_LOGIC := '0'; -- register pins are optional
    enable_pipe : IN  STD_LOGIC := '1'; -- CE for pipeline & multi-channel regs
    enable      : IN  STD_LOGIC := '1'; -- CE for output register
    clk         : IN  STD_LOGIC := '0';
    aa          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    bb          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    ss          : IN  STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0) := (OTHERS => '0'); -- optional
    cc          : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0);
    cc_reg      : OUT STD_LOGIC_VECTOR(gfx.symbol_width - 1 DOWNTO 0)
  );
END gfmac_mul;

ARCHITECTURE synth OF gfmac_mul IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  CONSTANT multi_channel  : BOOLEAN := (c_num_channels > 1);
  CONSTANT extra_pipe_int : INTEGER := bool_to_int(extra_pipeline/=0);
    
  CONSTANT sw   : INTEGER := gfx.symbol_width;
  CONSTANT swm1 : INTEGER := sw - 1;
  
  -- Only register outputs of xsop if extra_pipeline=1
  CONSTANT xsop_q_mode : INTEGER := select_val(no_reg, reg, extra_pipe_int);
    
  -- xor output registering handled external to xor in multi-channel case
  CONSTANT xor_q_mode : INTEGER := select_val_b(q_mode, no_reg, multi_channel);
  
  SIGNAL isig       : STD_LOGIC_VECTOR(max_isig_index DOWNTO 0):= (others => '0');
  SIGNAL cc_tmp     : STD_LOGIC_VECTOR(swm1 DOWNTO 0):= (others => '0');
  SIGNAL cc_tmp_reg : STD_LOGIC_VECTOR(swm1 DOWNTO 0):= (others => '0');
  
--
-- Architecture Body
--
BEGIN
  --
  -- copy input buses onto internal signal bus so that appropriate lut
  -- input/output signals can be selected using single indices
  --
  isig((3*sw - 1) DOWNTO 2*sw) <= ss;
  isig((2*sw - 1) DOWNTO sw) <= bb;
  isig(swm1 DOWNTO 0) <= aa;
  
  --
  -- Generate multiplier qterms (ie A0B0, A0B1 xor A1B0, etc)
  --
  q:
  FOR qi IN 0 TO (2*sw - 2) GENERATE
    
    CONSTANT int_inp_msb : INTEGER := gfx.qterm(qi).num_pterms - 1;
    CONSTANT int_qq_msb  : INTEGER := (gfx.qterm(qi).num_pterms + 3)/4 - 1;
    
    SIGNAL int_aa  : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0):= (others => '0');
    SIGNAL int_bb  : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0):= (others => '0');
    SIGNAL int_qq  : STD_LOGIC_VECTOR(int_qq_msb DOWNTO 0):= (others => '0');
    SIGNAL int_qqr : STD_LOGIC_VECTOR(int_qq_msb DOWNTO 0):= (others => '0');
  BEGIN
    -- connect appropriate sterms to bus that will be passed to gate_xsop
    intic: 
    FOR si IN 0 TO int_inp_msb GENERATE
      int_aa(si) <= isig(gfx.qterm(qi).a(si));
      int_bb(si) <= isig(gfx.qterm(qi).b(si) + sw); -- add sw offset
    END GENERATE; -- int_inps
    
    xsop : gate_xsop
    GENERIC MAP (
      width    => int_inp_msb + 1,
      invout   => FALSE,
      q_mode   => xsop_q_mode,
      c_family => c_family)
    PORT MAP ( 
      aa    => int_aa,
      bb    => int_bb,
      c     => clk,
      ce    => enable_pipe,
      reset => reset,
      o     => int_qq,
      o_reg => int_qqr);
      
      
    ig2: FOR qtsoi IN 0 TO (gfx.qterm(qi).num_suboutputs - 1) GENERATE
      
      SIGNAL int_qq_vec : STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
      SIGNAL int_qq_del : STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
    BEGIN
    
      ig1: IF extra_pipe_int = 0 GENERATE
        -- connect non-registered outputs to isig bus
        int_qq_vec(0) <= int_qq(qtsoi);
      END GENERATE; -- ig1
      
    
      ig3: IF extra_pipe_int /= 0 GENERATE
        -- connect registered outputs to isig bus
        int_qq_vec(0) <= int_qqr(qtsoi);
      END GENERATE; -- ig3
        
        
      -- Shift reg to hold mult outputs. Need c_num_channels-1 as delay
      -- on mult out is normally 0 for a single channel.
      -- The extra_pipeline register is a separate thing from the multi-channel
      -- registers. It is compensated for by other logic in the BMA unit.
      qqrd : big_delay
      GENERIC MAP (
        c_family          => c_family,
        c_xdevicefamily   => c_xdevicefamily,
        instance_name     => "gfmac_mul_qqrd",
        c_elaboration_dir => c_elaboration_dir,
        bus_width         => 1,
        clk_delay         => c_num_channels-1,
        memstyle          => dist_mem,
        c_has_ce          => 1)
      PORT MAP (
        din  => int_qq_vec,
        clk  => clk,
        ce   => enable_pipe,
        dout => int_qq_del );
      
      isig(gfx.qterm(qi).suboutput(qtsoi)) <= int_qq_del(0);
        
    END GENERATE; -- ig2
    
  END GENERATE; -- q
  
  
  --
  -- Generate multiplier cterms
  --
  c:
  FOR ci IN 0 TO swm1 GENERATE
    CONSTANT int_inp_msb : INTEGER := gfx.cterm(ci).num_sterms - 1;
    SIGNAL int_inp : STD_LOGIC_VECTOR(int_inp_msb DOWNTO 0):= (others => '0');
  BEGIN		
    -- connect appropriate sterms from isig bus to bus that will be 
    -- passed to gate_xor
    intic: 
    FOR si IN 0 TO int_inp_msb GENERATE
    BEGIN
      int_inp(si) <= isig(gfx.cterm(ci).s(si));
    END GENERATE; -- int_inp
    
    x : gate_xor
    GENERIC MAP (
      width       => int_inp_msb + 1,
      invout      => FALSE,
      q_mode      => xor_q_mode)
    PORT MAP ( 
      inp   => int_inp,
      c     => clk,
      ce    => enable,
      reset => reset,
      o     => cc_tmp(ci),
      o_reg => cc_tmp_reg(ci));
  
    cc(ci) <= cc_tmp(ci);
  
  
    mcg1: IF NOT(multi_channel) OR q_mode = no_reg GENERATE
      cc_reg(ci) <= cc_tmp_reg(ci);
    END GENERATE; -- mcg1
    
    -- Instantiate register structure to hold multiple cc_reg values. These
    -- values rotate around as long as enable_pipe is high. New values are
    -- shifted in when enable is high (as well as enable_pipe).
    mcg2: IF multi_channel AND q_mode /= no_reg GENERATE
      
      SIGNAL cc_mux_din : STD_LOGIC := '0';
      SIGNAL cc_mux_del : STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
      SIGNAL cc_mux_o   : STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
    BEGIN
    
      -- 2:1 mux to allow a new cc_tmp value to pass in to shift reg
      cc_mux_din <= cc_tmp(ci) WHEN enable = '1' ELSE cc_mux_del(0);
      
      cm : rs_reg_bit
      GENERIC MAP (c_has_ce=>1, c_has_aclr=>1)
      PORT MAP (d=>cc_mux_din, aclr=>reset, clk=>clk, ce=>enable_pipe,
                q=>cc_mux_o(0));
                    
    
      -- SRL16 to hold cc_reg values for each channel. This is required for the
      -- BMA disc signal. 1 stage of delay taken up in cm reg above.
      ccmd : big_delay
      GENERIC MAP (
        c_family          => c_family, 
        c_xdevicefamily   => c_xdevicefamily,
        instance_name     => "gfmac_mul_ccmd",
        c_elaboration_dir => c_elaboration_dir,
        bus_width         => 1,
        clk_delay         => c_num_channels-1,
        memstyle          => dist_mem,
        c_has_ce          => 1)
      PORT MAP (
        din  => cc_mux_o,
        clk  => clk,
        ce   => enable_pipe,
        dout => cc_mux_del );
    
      cc_reg(ci) <= cc_mux_del(0);
    
    END GENERATE; -- mcg2
    
  END GENERATE; -- c
  
  
END synth;





--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfmac.vhd,v 1.2 2011/04/05 13:20:35 billw Exp $
--
-- Description: Galois Field MAC
--
-- Author: Dwayne Burns
--
-- Accumulate aa * bb
--
-- cc_reg  : output = accumulation of aa * bb
-- cc      : unregistered output
-- oo_reg  : output used in multi-channel case
-- enable  : clock enable for oo_reg output register
-- mac_sr  : Synchronously resets the oo_reg output register. This does not override <enable>
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.gf_pkg.all;


entity gfmac is
  generic (
    C_FAMILY           : string;
    C_XDEVICEFAMILY    : string;
    C_ELABORATION_DIR  : string;
    C_NUM_CHANNELS     : integer;
    GFX                : gfx_record_type; -- GFX.is_mac must be set to true
    EXTRA_PIPELINE     : integer := 0 -- 1 for reg in middle of mult
  );
  port (
    reset   : in  std_logic;
    enable  : in  std_logic;
    enable2 : in  std_logic;
    clk     : in  std_logic;
    mac_sr  : in  std_logic;
    aa      : in  std_logic_vector((GFX.symbol_width - 1) downto 0);
    bb      : in  std_logic_vector((GFX.symbol_width - 1) downto 0);
    cc      : out std_logic_vector((GFX.symbol_width - 1) downto 0);
    cc_reg  : out std_logic_vector((GFX.symbol_width - 1) downto 0);
    oo_reg  : out std_logic_vector((GFX.symbol_width - 1) downto 0));

end gfmac;

--------------------------------------------------------------------------------
architecture synth of gfmac is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

--------------------------------------------------------------------------------

constant sw   : integer := GFX.symbol_width;
constant swm1 : integer := sw - 1;

signal cc_int     : std_logic_vector(swm1 downto 0) := (others => '0');
signal ss_int     : std_logic_vector(swm1 downto 0) := (others => '0');
signal oo_reg_int : std_logic_vector(swm1 downto 0) := (others => '0');
signal oo_reg_tmp : std_logic_vector(swm1 downto 0) := (others => '0');

begin  
  
  ic: -- internal connections
  for bi in 0 to swm1 generate
    -- connect cc_int to cc output port
    cc(bi) <= cc_int(bi);
    -- oo_reg_int to ss_int internal port and oo_reg output port
    ss_int(bi) <= oo_reg_int(bi);
    oo_reg(bi) <= oo_reg_int(bi);
  end generate; -- ic
  
  --
  -- Instantiate Galois field multiplier with optional adder (GFX.is_mac = TRUE)
  --
  xa: gfmac_mul
  generic map (
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    c_elaboration_dir => C_ELABORATION_DIR,
    c_num_channels    => C_NUM_CHANNELS,
    gfx               => GFX,
    q_mode            => REG_AND_NO_REG,
    extra_pipeline    => EXTRA_PIPELINE,
    c_enable_rlocs    => 0) -- no longer used
  port map (
    reset       => reset,
    enable_pipe => enable,
    enable      => enable2,
    clk         => clk,		
    aa          => aa,
    bb          => bb,
    ss          => ss_int,
    cc          => cc_int,
    cc_reg      => cc_reg);  
    
    
  --
  -- Instantiate output registers with synchronous reset LUTs
  -- Must set c_sync_enable to c_no_override as reg is not cleared by global sclr
  lr : rs_reg
  generic map (c_width=>sw, c_has_ce=>1, c_has_sclr=>1, c_has_aclr=>1, c_sync_enable=>c_no_override)
  port map (d=>cc_int, aclr=>reset, sclr=>mac_sr, clk=>clk, ce=>enable, q=>oo_reg_tmp);
  
  
  
  -- Shift reg to store oo_reg value for each channel
  ood : big_delay
  generic map (
    c_family          => C_FAMILY,
    c_xdevicefamily   => C_XDEVICEFAMILY,
    instance_name     => "gfmac_ood",
    c_elaboration_dir => C_ELABORATION_DIR,
    bus_width         => SW,
    clk_delay         => C_NUM_CHANNELS-1, -- oo_reg accounts for 1 channel reg
    memstyle          => dist_mem,
    c_has_ce          => 1)
  port map (
    din  => oo_reg_tmp,
    clk  => clk,
    ce   => enable,
    dout => oo_reg_int );
  
  
end synth;



--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfmul40.vhd,v 1.2 2011/04/19 11:53:02 billw Exp $
--
-- Description: Galois field multiplier for symbol_width=4 and polynomial=0
--
-- Author : Dwayne Burns
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY unisim;
USE unisim.vcomponents.xorcy;

library axi_utils_v2_0_3;
use axi_utils_v2_0_3.global_util_pkg.all;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;



ENTITY gfmul40 IS
  GENERIC (
    q_mode   : mem_q_type := no_reg;
    c_family : STRING
  );
  PORT (
    reset  : IN  STD_LOGIC := '0'; -- register pins are optional
    enable : IN  STD_LOGIC := '1';
    clk    : IN  STD_LOGIC := '0';
    aa     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    bb     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    cc     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    cc_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END gfmul40;

--------------------------------------------------------------------------------
ARCHITECTURE synth OF gfmul40 IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";



-- 4 i/p LUTS no longer supported    
-- -- The "keep" attribute is used in some places to force XST to route a
-- -- critical path signal to the 2nd of 2 LUTs in a chain. This may lead to
-- -- unneccessary additional LUTs in 6-LUT architectures so turn this off for
-- -- these.
-- CONSTANT num_lut_inputs : INTEGER := fn_get_lut_size(fn_check_family(c_family));
-- 
-- -- Use pkg_baseblox function to determine how many inputs a LUT has
-- CONSTANT keep_lut4 : STRING :=
--                              select_string("true", "false", num_lut_inputs > 4);
-- --                 select_string("true", "false", derived("virtex5", c_family));
    

-- -- internal signal bus to interconnect luts
SIGNAL isig0 : STD_LOGIC := '0';
SIGNAL isig1 : STD_LOGIC := '0';
SIGNAL isig2 : STD_LOGIC := '0';
SIGNAL isig3 : STD_LOGIC := '0';
SIGNAL isig4 : STD_LOGIC := '0';
SIGNAL isig5 : STD_LOGIC := '0';
SIGNAL isig6 : STD_LOGIC := '0';
SIGNAL isig7 : STD_LOGIC := '0';
SIGNAL cc_int : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');

-- ATTRIBUTE keep OF isig0 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig1 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig2 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig3 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig4 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig5 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig6 : SIGNAL IS keep_lut4;
-- ATTRIBUTE keep OF isig7 : SIGNAL IS keep_lut4;

BEGIN

  -- Have to split up manually like this because XST is doing an inefficient
  -- mapping of equations to LUTs
  isig0 <= (aa(0) AND bb(0)) XOR (aa(1) AND bb(3));
  isig1 <= (aa(2) AND bb(2)) XOR (aa(3) AND bb(1));
  isig2 <= (aa(0) AND bb(1)) XOR (aa(3) AND bb(1)) XOR (aa(3) AND bb(2));
  isig3 <= (aa(1) AND bb(3)) XOR (aa(2) AND bb(2)) XOR (aa(2) AND bb(3));
  isig4 <= (aa(2) AND bb(0)) XOR (aa(2) AND bb(3));
  isig5 <= (aa(0) AND bb(2)) XOR (aa(3) AND bb(2)) XOR (aa(3) AND bb(3));
  isig6 <= (aa(0) AND bb(3)) XOR (aa(3) AND bb(0)) XOR (aa(3) AND bb(3));
  isig7 <= (aa(1) AND bb(2)) XOR (aa(2) AND bb(1));
  
  
  
  -- logic for cterm(0)
--   xg1 : IF num_lut_inputs > 4 GENERATE
-- 4 i/p LUTS no longer supported    
    cc_int(0) <= isig0 XOR isig1;
--   END GENERATE; -- xg1
--   
--   xg2 : IF num_lut_inputs <= 4 GENERATE
--     xcy : xorcy
--     PORT MAP( li => isig0, ci => isig1, o  => cc_int(0) );
--   END GENERATE; -- xg2
  
  
               
  -- logic for cterm(1)
  cc_int(1) <= isig2 XOR isig3 XOR (aa(1) AND bb(0));
      
      
      
      
  -- logic for cterm(2)
  cc_int(2) <= isig4 XOR isig5 XOR (aa(1) AND bb(1));
      
      
      
      
  -- logic for cterm(3)
-- 4 i/p LUTS no longer supported    
--  xg3 : IF num_lut_inputs > 4 GENERATE
    cc_int(3) <= isig6 XOR isig7;
--   END GENERATE; -- xg3
--   
--   xg4 : IF num_lut_inputs <= 4 GENERATE
--     xcy : xorcy
--     PORT MAP( li => isig6, ci => isig7, o  => cc_int(3) );
--   END GENERATE; -- xg4
  
  
  
  
  ------------------------------------------------------------------------------
  -- Optional registered output
  nr : IF q_mode = no_reg GENERATE
  BEGIN
    cc     <= cc_int;
    cc_reg <= cc_int;
  END GENERATE; -- no_reg
  
  ranr : IF q_mode = reg_and_no_reg GENERATE
      
    ff : rs_reg
    GENERIC MAP (c_width=>4, c_has_ce=>1, c_has_aclr=>1)
    PORT MAP (d=>cc_int, clk=>clk, ce=>enable, aclr=>reset, q=>cc_reg);
           
    cc <= cc_int;
  END GENERATE; -- reg_and_no_reg                
  
  r : IF q_mode = reg GENERATE
    SIGNAL reg_out : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
  BEGIN
  
    ff : rs_reg
    GENERIC MAP (c_width=>4, c_has_ce=>1, c_has_aclr=>1)
    PORT MAP (d=>cc_int, clk=>clk, ce=>enable, aclr=>reset, q=>reg_out);
           
    cc     <= reg_out;
    cc_reg <= reg_out;
  END GENERATE; -- r
  
      
END synth;





-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfinvrom.vhd,v 1.2 2011/06/02 10:55:44 billw Exp $
--
-- Description: Galois field inverter using ROM lookup table.
--
-- Author: Dwayne Burns
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.mem_init_file_pack.all;
use rs_toolbox_v9_0_3.gf_pkg.all;


entity gfinvrom is
  generic (
    width             : integer           := 4;
    inverse_of        : integer_array_type;
    memstyle          : mem_style_type    := dist_mem;
    q_mode            : mem_q_type        := def_mem_q_type;
    c_mem_init_prefix : string;
    c_elaboration_dir : string;
    c_xdevicefamily   : string;
    c_family          : string );
  port (
    enable : in  std_logic;
    clk    : in  std_logic;
    aa     : in  std_logic_vector((width - 1) downto 0);
    ii     : out std_logic_vector((width - 1) downto 0);
    ii_reg : out std_logic_vector((width - 1) downto 0));
end gfinvrom;

architecture synth of gfinvrom is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


constant sw               : integer := width; 
constant gfas             : integer := 2**sw;
constant initial_num_bits : integer := gfas*sw;

constant initial_contents : bit_vector(initial_num_bits - 1 downto 0) :=
                              integer_array_to_bit_vector(sw, gfas, inverse_of);

constant min_depth : integer := 16;
constant final_num_bits : integer := range_check(initial_num_bits, min_depth*sw, integer'high);

--------------------------------------------------------------------------------
--
-- This function pads out the contents bit_vector if sw = 3
--
--------------------------------------------------------------------------------
function pad_contents_for_sw3(
  width : integer;
  initial_num_bits : integer; 
  final_num_bits : integer; 
  initial_contents : bit_vector)
  return bit_vector is
  variable final_contents : bit_vector(final_num_bits - 1 downto 0) := (others => '0');
begin
  if width = 3 then
    for bi in 0 to (initial_num_bits - 1) loop
      final_contents(bi) := initial_contents(bi);
      final_contents(initial_num_bits + bi) := initial_contents(bi);
    end loop; -- bi
	  return final_contents;
  else -- width > 3
    return initial_contents;
  end if;  
end function; -- pad_contents

constant final_contents : bit_vector(final_num_bits - 1 downto 0) :=
   pad_contents_for_sw3(sw, initial_num_bits, final_num_bits, initial_contents);

-- Fix to sort out bug with qualified_by_project_dir ATTRIBUTE
-- read and write file cannot have the same name hence use this trick.
constant filename   : string := concatenate_strings(c_mem_init_prefix, "gfinvrom.mif");
constant q_filename : string := filename;
attribute qualified_by_project_dir of q_filename : constant is true;


constant final_depth : integer := range_check(gfas, min_depth, integer'high);

signal q         : std_logic_vector((sw - 1) downto 0) := (others => '0');
signal q_reg     : std_logic_vector((sw - 1) downto 0) := (others => '0');
signal zero_data : std_logic_vector((sw - 1) downto 0) := (others => '0');

begin

  dum:if true generate
    constant file_written : boolean :=
         write_meminit_file(q_filename, c_elaboration_dir, final_depth, sw, final_contents);
  begin   
  
    zero_data <= (others=>'0');
  
    --
    -- Instantiate inverter rom
    --
--    mif: -- file written
--    if (file_written=true) generate
--    begin
      rom0 : syncmem
      generic map(
        width             => sw,
        reqd_depth        => gfas,
        memstyle          => memstyle,
        c_has_ce          => 1,
        c_has_we          => 0,
        init_file         => filename,
        q_mode            => q_mode,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family)
      port map(
        a      => aa,
        d      => zero_data,
        we     => '0',
        c      => clk,
        ce     => enable,
        q      => q,
        q_reg  => q_reg);
--    end generate; -- mif

    no_mif: -- no file written
--    if (file_written = false) generate
      assert file_written
      report "Error: Couldn't write gfinvrom.mif"
      severity failure;
--    end generate; -- no_mif
  
  end generate;

  
  -- Connect outputs
  -- Add a pipeline register for width = 8 so that latency
  -- matches latency=2 for the cfinv8
  -- This is a bit hacky ! 
  rg : if (width = 8) generate
    sma : rs_reg
    generic map (c_width=>width, c_has_ce=>1)
    port map (d=>q_reg, clk=>clk, ce=>enable, q=>ii_reg);
  
    ii <= q_reg; -- delay "non-registered" output by one as well
    
  end generate; -- rg
    
  nrg : if (width /= 8) generate
    ii <= q;
    ii_reg <= q_reg;
  end generate; -- nrg
  
  
end synth;




--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
--------------------------------------------------------------------------------
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/cfinv8.vhd,v 1.2 2011/06/16 12:54:05 billw Exp $
--
-- Description: Composite field inverter specifically for symbol_width = 8
--
-- Author: Dwayne Burns
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--
-- It is based on the architecture described on pages 101-102 of
-- "Efficient VSLI architectures for bit parallel computation in Galois Fields" 
-- by Christof Paar, ISBN 3-18-332810-0.
--
-- The circuit implements an optimized tower inverter, where
-- the inverse, B, of an element A = a1*x + a0, is
--
--    B(x) = b1*x + b0
--
--              a1*x + (a1 + a0)
--         = ----------------------
--           a0*(a1 + a0) + a1^2*p0
--
-- where all operations are performed in the ground field GF(2^4).
-- The operations required are one inversion, three general multiplications,
-- two additions, one constant coefficient multiplication by p0, and one squaring.
-- By choosing p0 = w^14, the a1^2*p0 divisor term and its addition to the other 
-- divisor term, can be optimized and mapped into just four fmaps.
--
-- The composite field inverter is wrapped by galois to composite (and vice 
-- versa) field translation mappers. These mappers are implemented 
-- using constant coefficient multipliers for which the transform matrices 
-- have been pre-calculated.
--
-- The latency generic selects how many pipeline stages should be inserted.
-- latency = 1, inserts registers on output of cf2gf mapper.
-- latency = 2, inserts registers before 4-bit inverter, and after 
--              a1, and (a1 + a0).
-- latency = 3, inserts registers on output of gf2cf mapper.
-- latency = 4, inserts registers on output of two 4-bit multipliers.
--
-- Note that for example, latency = 3, the registers detailed for latency = 1,
-- and latency = 2 are also inserted.
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;

ENTITY cfinv8 IS
  GENERIC (
    polynomial        : INTEGER := poly_default;
    latency           : INTEGER := latency_default;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    c_xdevicefamily   : STRING;
    c_family          : STRING);
  PORT (
    enable : IN  STD_LOGIC := '1';
    clk    : IN  STD_LOGIC := '0';
    aa     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    ii     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END cfinv8;

ARCHITECTURE synth OF cfinv8 IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


--------------------------------------------------------------------------------
--
-- CONSTANT, SUBTYPE and TYPE declarations
--
--------------------------------------------------------------------------------

  CONSTANT sw    : INTEGER := 8; -- fixed, do not change !
  CONSTANT swm1  : INTEGER := sw - 1;
  CONSTANT msw   : INTEGER := 4; -- fixed, do not change !
  CONSTANT mswm1 : INTEGER := msw - 1;

  CONSTANT polynomial_remed : INTEGER := polynomial REM 2**sw;
--
-- create GF(2^4) record 
-- must pass polynomial = 0 as w^14 is used for its low complexity in
-- the constant coefficient multiplier
--
  CONSTANT gfas : INTEGER := 2**msw;
  CONSTANT gfasm1 : INTEGER := gfas - 1;
  CONSTANT gfasm2 : INTEGER := gfas - 2;
  -- GF(2^sw) element array
  CONSTANT alpha_to : integer_array_type(0 TO gfasm2) := gf_calc_elements(msw, 19);
  -- GF(2^sw) index array
  CONSTANT index_of : integer_array_type(0 TO gfasm1) := gf_calc_indices(msw, alpha_to);
  -- check primitivity
  CONSTANT is_primitive : BOOLEAN := gf_check_primitivity(msw, index_of);
  -- GF(2^sw) inverse array
  CONSTANT inverse_of : integer_array_type(0 TO gfasm1) := gf_calc_inverses(msw, alpha_to, index_of);
  -- finished creating Galois field arrays

--------------------------------------------------------------------------------
-- 
-- Matrix type declarations
-- 
--------------------------------------------------------------------------------
TYPE sw_integer_array_type IS ARRAY(0 TO swm1) OF INTEGER;

TYPE integer_matrix_type IS ARRAY(NATURAL RANGE <>) OF sw_integer_array_type;

--------------------------------------------------------------------------------
--
-- Function to set the mapping matrix between binary and composite
-- field representations. 
--
--------------------------------------------------------------------------------
IMPURE FUNCTION gfcf_calc_T_matrix(dummy : INTEGER)
  RETURN integer_matrix_type IS
  VARIABLE T_matrix       : integer_matrix_type(0 TO swm1);
BEGIN
  IF (sw = 8) THEN
    IF (polynomial_remed = 0 OR polynomial_remed = 29) THEN
      T_matrix(0) := (0 => 1, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 43) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
    ELSIF (polynomial_remed = 45) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(3) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 77) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(3) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 95) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 99) THEN
      T_matrix(0) := (0 => 1, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 101) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
    ELSIF (polynomial_remed = 105) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 113) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 135) THEN
      T_matrix(0) := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
    ELSIF (polynomial_remed = 141) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
    ELSIF (polynomial_remed = 169) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 195) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 207) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 231) THEN
      T_matrix(0) := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      T_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
    ELSIF (polynomial_remed = 245) THEN
      T_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      T_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      T_matrix(4) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      T_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      T_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      T_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
    ELSE
      ASSERT FALSE
      REPORT "Field polynomial isn't primitive - no T_matrix available !"
      SEVERITY FAILURE;
    END IF; -- polynomial_remed
  END IF; -- sw
  RETURN T_matrix;
END gfcf_calc_T_matrix;

--------------------------------------------------------------------------------
--
-- Function to set the mapping matrix for mapping between composite and binary 
-- field representations. 
--
--------------------------------------------------------------------------------
IMPURE FUNCTION gfcf_calc_I_matrix(T_matrix : integer_matrix_type)
  RETURN integer_matrix_type IS
  VARIABLE I_matrix       : integer_matrix_type(0 TO swm1);
BEGIN
  IF (sw = 8) THEN
    IF (polynomial_remed = 0 OR polynomial_remed = 29) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 43) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 45) THEN
      I_matrix(0) := (0 => 1, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 77) THEN
      I_matrix(0) := (0 => 1, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 95) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 99) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 101) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 105) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 113) THEN
      I_matrix(0) := (0 => 1, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 135) THEN
      I_matrix(0) := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 141) THEN
      I_matrix(0) := (0 => 1, 1 => 1, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
    ELSIF (polynomial_remed = 169) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 0, 5 => 1, 6 => 0, 7 => 0);
    ELSIF (polynomial_remed = 195) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 207) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 1, 6 => 1, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
      I_matrix(6) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 1, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 231) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 0, 5 => 0, 6 => 1, 7 => 1);
      I_matrix(4) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 0);
      I_matrix(7) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
    ELSIF (polynomial_remed = 245) THEN
      I_matrix(0) := (0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(1) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(2) := (0 => 0, 1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(3) := (0 => 0, 1 => 1, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 1, 7 => 0);
      I_matrix(4) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(5) := (0 => 0, 1 => 0, 2 => 0, 3 => 1, 4 => 1, 5 => 0, 6 => 0, 7 => 1);
      I_matrix(6) := (0 => 0, 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 1, 6 => 0, 7 => 1);
      I_matrix(7) := (0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 1, 6 => 0, 7 => 0);
    ELSE
      ASSERT FALSE
      REPORT "Field polynomial isn't primitive - no I_matrix available !"
      SEVERITY FAILURE;
    END IF; -- polynomial_remed
  END IF; -- sw
  RETURN I_matrix;
END gfcf_calc_I_matrix;

--------------------------------------------------------------------------------
--
-- calculate constant coefficient multiplier 
-- xor-sum-of-products logic equations and associated details
--
--------------------------------------------------------------------------------
FUNCTION gfcf_calc_cterms(initial_gfcf : gfcx_record_type;
                          matrix       : integer_matrix_type)
  RETURN gfcx_record_type IS
  VARIABLE gfcf           : gfcx_record_type := initial_gfcf;
  VARIABLE num_sterms     : INTEGER;
BEGIN
  --
  -- build up sterm equations
  --
  FOR ci IN 0 TO (gfcf.symbol_width - 1) LOOP
    num_sterms := 0;
    FOR bi IN 0 TO (gfcf.symbol_width - 1) LOOP
      IF (matrix(ci)(bi) = 1) THEN
        gfcf.cterm(ci).s(num_sterms) := bi;
        num_sterms := num_sterms + 1;
      END IF;
    END LOOP; -- bi
    gfcf.cterm(ci).num_sterms := num_sterms;
  END LOOP; -- ci  
  RETURN gfcf;
END gfcf_calc_cterms;

--------------------------------------------------------------------------------
--
-- function to calculate record details for field translator
-- which can be implemented by a constant coefficient multiplier
--
--------------------------------------------------------------------------------
IMPURE FUNCTION gfcf_calc_record(matrix : integer_matrix_type)
  RETURN gfcx_record_type IS
  VARIABLE gfcf : gfcx_record_type;
BEGIN
  -- copy parameters into record
  gfcf.symbol_width := sw;
  gfcf.polynomial := polynomial_remed;
  gfcf.constant_coefficient := 0;
  -- now start doing calculations
  gfcf := gfcf_calc_cterms(gfcf, matrix);
  RETURN gfcf;
END gfcf_calc_record;

  -- calculate the gf2cf and cf2gf translation matrices
  CONSTANT T_matrix : integer_matrix_type := gfcf_calc_T_matrix(0);
  CONSTANT I_matrix : integer_matrix_type := gfcf_calc_I_matrix(T_matrix);
  -- calculate the gf2cf and cf2gf multiplier records
  CONSTANT gf2cf    : gfcx_record_type := gfcf_calc_record(T_matrix);
  CONSTANT cf2gf    : gfcx_record_type := gfcf_calc_record(I_matrix);
  --
  -- Declare intermediate signals
  --
  SIGNAL bb         : STD_LOGIC_VECTOR(swm1 DOWNTO 0) := (others => '0');
  SIGNAL cc         : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL dd         : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL ff         : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL ff_tmp     : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL gg         : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL hh         : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL jj         : STD_LOGIC_VECTOR(mswm1 DOWNTO 0) := (others => '0');
  SIGNAL kk         : STD_LOGIC_VECTOR(swm1 DOWNTO 0) := (others => '0');
   
  SIGNAL mti_hack : STD_LOGIC := '0';

BEGIN
  --
  -- Instantiate galois field to composite field translator
  -- which is equivalent to a galois field constant coefficient multiplier
  -- with the record specifically prepared to perform the gf2cf translation
  --
  gftocf: gfcmul
  GENERIC MAP (
    gfcx           => gf2cf,
    q_mode         => eval(latency > 2))
  PORT MAP (
    reset  => '0',
    enable => enable,
    clk    => clk,
    bb     => aa,
    cc_reg(bb'range) => bb); -- cc_reg is connected to cc if q_mode = 0
    
  --
  -- Instantiate the first Galois field multiplier
  --
  gfx1: gfmul40
  GENERIC MAP (
    q_mode    => no_reg, -- don't register outputs
    c_family  => c_family)
  PORT MAP (
    aa => bb(mswm1 DOWNTO 0),
    bb => cc,
    cc => dd,
    cc_reg => OPEN);
    
    
  --
  -- Create galois field adder to add bb nibbles
  --
  add1: FOR ci IN 0 TO mswm1 GENERATE
    cc(ci) <= bb(ci) XOR bb(ci + msw);
  END GENERATE; -- add1
  
  
  -- Create the specially combined galois field 
  -- squarer, constant coefficient multiplier and adder
  ff_tmp(0) <= bb(msw) XOR dd(0);
  ff_tmp(1) <= bb(msw+1) XOR bb(msw+3) XOR dd(1);
  ff_tmp(2) <= bb(msw+3) XOR dd(2);
  ff_tmp(3) <= bb(msw) XOR bb(msw+2) XOR dd(3);
  
  
  -- Add pipelining registers if required
  
  ccg1 : IF latency <= 1 GENERATE
    gg <= cc;
    ff <= ff_tmp;
  END GENERATE; -- ccg1
    
  -- For latency > 1, both non-registered (gfx1) and registered (gfx3) 
  -- outputs are required.
  ccg2 : IF latency > 1 GENERATE
  
    gfa : rs_reg
    GENERIC MAP (c_width=>msw, c_has_ce=>1)
    PORT MAP (d=>cc, clk=>clk, ce=>enable, q=>gg);
    
    sma : rs_reg
    GENERIC MAP (c_width=>msw, c_has_ce=>1)
    PORT MAP (d=>ff_tmp, clk=>clk, ce=>enable, q=>ff);
  
  END GENERATE; -- ccg2
    
    
    
    
  --
  -- If latency < 2,  instantiate 4-bit Galois field inverter and short 
  -- upper nibble of bb bus to hh bus
  --
  llt2: IF (latency < 2) GENERATE
  
    --
    -- Instantiate the msw inverter rom
    --
    gfi4: gfinvrom
    GENERIC MAP(
      width             => msw,
      inverse_of        => inverse_of,
      memstyle          => dist_mem,
      q_mode            => no_reg,
      c_mem_init_prefix => c_mem_init_prefix,
      c_elaboration_dir => c_elaboration_dir,
      c_xdevicefamily   => c_xdevicefamily,
      c_family          => c_family)
    PORT MAP(
      aa           => ff,
      ii           => jj,
      ii_reg       => OPEN);
      
    connect:
    FOR ci IN 0 TO mswm1 GENERATE
    BEGIN
      hh(ci) <= bb(msw + ci);
    END GENERATE;
    
  END GENERATE; -- llt2
  
  
  --
  -- Instantiate pipeline registers for upper nibble of bb bus if latency > 1
  --
  lgt1: IF (latency > 1) GENERATE
  
    --
    -- Instantiate the msw inverter rom
    --
    gfi5: gfinvrom
    GENERIC MAP(
      width             => msw,
      inverse_of        => inverse_of,
      memstyle          => dist_mem,
      q_mode            => no_reg, -- must be no_reg for overlap container
      c_mem_init_prefix => c_mem_init_prefix,
      c_elaboration_dir => c_elaboration_dir,
      c_xdevicefamily   => c_xdevicefamily,
      c_family          => c_family) 
    PORT MAP(
      aa     => ff,
      ii     => jj,
      ii_reg => OPEN);
      
      
    sma : rs_reg
    GENERIC MAP (c_width=>msw, c_has_ce=>1)
    PORT MAP (d=>bb(mswm1+msw DOWNTO msw), clk=>clk, ce=>enable, q=>hh(mswm1 DOWNTO 0));
  
  END GENERATE; -- lgt1
  
  
  --
  -- Instantiate the final two galois field multipliers
  --
  gfx2: gfmul40
  GENERIC MAP (
    q_mode    => eval(latency > 3),
    c_family  => c_family)
  PORT MAP (
    reset  => '0',
    enable => enable,
    clk    => clk,
    aa     => hh,
    bb     => jj,
    cc     => OPEN,
    cc_reg => kk(swm1 DOWNTO msw));
    
    
  gfx3: gfmul40
  GENERIC MAP (
    q_mode   => eval(latency > 3),
    c_family => c_family)
  PORT MAP (
    reset  => '0',
    enable => enable,
    clk    => clk,
    aa     => gg,
    bb     => jj,
    cc     => OPEN,
    cc_reg => kk(mswm1 DOWNTO 0));
    
    
  --
  -- Instantiate synchronous composite field to galois field translator
  -- which is equivalent to a galois field constant coefficient multiplier
  -- with the record specifically prepared to perform the cf2gf translation
  --
  cftogf: gfcmul
  GENERIC MAP (
    gfcx   => cf2gf,
    q_mode => eval(latency > 0) )
  PORT MAP (
    reset  => '0',
    enable => enable,
    clk    => clk,
    bb     => kk,
    cc     => OPEN,
    cc_reg => ii);

--  -- lets me see variables in modelsim, seems this has to be at end of architecture
--  eereg: PROCESS (clk)
--  BEGIN
--    IF clk = '1' AND clk'EVENT THEN
--      mti_hack <= enable;
--    END IF;
--  END PROCESS;

END synth;








--------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gfinv.vhd,v 1.1 2011/03/26 20:06:41 billw Exp $
--
-- Galois Field inverter
--
-- Author : Dwayne Burns
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


LIBRARY unisim;
USE unisim.vcomponents.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gfinv IS
  GENERIC (
    symbol_width      : symbol_width_type := symbol_width_default;
    polynomial        : INTEGER           := poly_default;
    memstyle          : mem_style_type    := dist_mem;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    c_xdevicefamily   : STRING;
    c_family          : STRING);
  PORT (
    enable  : IN STD_LOGIC;
    clk     : IN STD_LOGIC;
    aa      : IN  STD_LOGIC_VECTOR((symbol_width - 1) DOWNTO 0);
    ii      : OUT STD_LOGIC_VECTOR((symbol_width - 1) DOWNTO 0)
  );
END gfinv;

ARCHITECTURE synth OF gfinv IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  -- this is how you create Galois field arrays
  CONSTANT gfas   : INTEGER := 2**symbol_width;
  CONSTANT gfasm1 : INTEGER := gfas - 1;
  CONSTANT gfasm2 : INTEGER := gfas - 2;
  
  -- GF(2^sw) element array
  CONSTANT alpha_to : integer_array_type(0 TO gfasm2) :=
                                     gf_calc_elements(symbol_width, polynomial);
  -- GF(2^sw) index array
  CONSTANT index_of : integer_array_type(0 TO gfasm1) :=
                                        gf_calc_indices(symbol_width, alpha_to);
  -- check primitivity
  CONSTANT is_primitive : BOOLEAN :=
                                   gf_check_primitivity(symbol_width, index_of);
  -- GF(2^sw) inverse array
  CONSTANT inverse_of : integer_array_type(0 TO gfasm1) :=
                             gf_calc_inverses(symbol_width, alpha_to, index_of);
  -- finished creating Galois field arrays
BEGIN

  ------------------------------------------------------------------------------
  -- Block Mem
  --
  bm: IF (memstyle = block_mem) GENERATE
  BEGIN
  
    -- override user's preference for block ram as inverter for
    -- sw=3 only requires 1.5 virtex slices
    -- sw=4  "      "     2   virtex slices
    swlt5: IF (symbol_width < 5) GENERATE
    BEGIN
      gfi: gfinvrom
      GENERIC MAP(
        width             => symbol_width,
        inverse_of        => inverse_of,
        memstyle          => dist_mem,
        q_mode            => reg,
        c_mem_init_prefix => c_mem_init_prefix,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family )
      PORT MAP(
        enable       => enable,
        clk          => clk,
        aa           => aa,
        ii           => OPEN,
        ii_reg       => ii); 
    END GENERATE; -- swlt5
    
    swgte5: IF (symbol_width >= 5) GENERATE
    BEGIN
      gfi: gfinvrom
      GENERIC MAP(
        width             => symbol_width,
        inverse_of        => inverse_of,
        memstyle          => memstyle,
        q_mode            => reg,
        c_mem_init_prefix => c_mem_init_prefix,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family)
      PORT MAP(
        enable       => enable,
        clk          => clk,
        aa           => aa,
        ii           => OPEN,
        ii_reg       => ii); 
    END GENERATE; -- swgte5
    
  END GENERATE; -- bm
  
  
  
  ------------------------------------------------------------------------------
  -- Dist Mem
  --
  dm: IF (memstyle = dist_mem) GENERATE
  BEGIN
  
    swlt8: IF (symbol_width /= 8) GENERATE
    BEGIN
      gfi: gfinvrom
      GENERIC MAP(
        width             => symbol_width,
        inverse_of        => inverse_of,
        memstyle          => memstyle,
        q_mode            => reg,
        c_mem_init_prefix => c_mem_init_prefix,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family)
      PORT MAP(
        enable       => enable,
        clk          => clk,
        aa           => aa,
        ii           => OPEN,
        ii_reg       => ii); 
    END GENERATE; -- swlt8
    
    sw8: IF (symbol_width = 8) GENERATE
    BEGIN
      cfi: cfinv8
      GENERIC MAP(
        polynomial        => polynomial,
        latency           => 2,
        c_mem_init_prefix => c_mem_init_prefix,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family)
      PORT MAP(
        enable          => enable,
        clk             => clk,
        aa              => aa,
        ii              => ii);
    END GENERATE; -- sw8
  END GENERATE; -- dm
  
  
  
  ------------------------------------------------------------------------------
  -- Auto Mem
  --
  auto: IF (memstyle = auto_mem) GENERATE
  BEGIN
  
    swlt7: IF (symbol_width < 7) GENERATE
    BEGIN
      gfi: gfinvrom
      GENERIC MAP(
        width             => symbol_width,
        inverse_of        => inverse_of,
        memstyle          => dist_mem,
        q_mode            => reg,
        c_mem_init_prefix => c_mem_init_prefix,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family)
      PORT MAP(
        enable       => enable,
        clk          => clk,
        aa           => aa,
        ii           => OPEN,
        ii_reg       => ii); 
    END GENERATE; -- swlt8
    
    swgte7: IF (symbol_width >= 7) GENERATE
    BEGIN
      gfi: gfinvrom
      GENERIC MAP(
        width             => symbol_width,
        inverse_of        => inverse_of,
        memstyle          => block_mem,
        q_mode            => reg,
        c_mem_init_prefix => c_mem_init_prefix,
        c_elaboration_dir => c_elaboration_dir,
        c_xdevicefamily   => c_xdevicefamily,
        c_family          => c_family)
      PORT MAP(
        enable       => enable,
        clk          => clk,
        aa           => aa,
        ii           => OPEN,
        ii_reg       => ii); 
    END GENERATE; -- swgte7
  END GENERATE; -- auto
  
END synth;







-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gf_dual_basis_rom.vhd,v 1.2 2011/06/02 10:55:44 billw Exp $
--
-- Author: David Lawrie, Bill Wilkie
--
-- Description: 
-- This file is used to create a look up table for conversion between the
-- different representations in dual_basis encoder/decoders. 
-- Specifically required for CCSDS.
-- If C_HAS_DOUT_B then the dual-basis -> normal values are stored in the lower
-- half of the memory (accessed by port A) and the
-- normal -> dual-basis values are stored in the upper half of the memory
-- (accessed by port B).
--
-- If a single-port ROM is required then just pass the same array into
-- conv_array_db2 and conv_array_2db. It doesn't matter whether this is an
-- array to convert from or to dual-basis.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


library unisim;
use unisim.vcomponents.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library rs_toolbox_v9_0_3;
use rs_toolbox_v9_0_3.ul_utils.all;
use rs_toolbox_v9_0_3.util_xcc.all;
use rs_toolbox_v9_0_3.toolbox_comps.all;
use rs_toolbox_v9_0_3.mem_utils.all;
use rs_toolbox_v9_0_3.mem_init_file_pack.all;
use rs_toolbox_v9_0_3.gf_pkg.all;


entity gf_dual_basis_rom is
  generic (
    C_WIDTH           : integer;
    C_HAS_DOUT_B      : integer := 0;
    C_HAS_ENA         : integer;
    C_HAS_ENB         : integer;
    CONV_DATA_DB2     : basis_convert_array; -- Dual-basis normal conversion
    CONV_DATA_2DB     : basis_convert_array; -- Normal to dual-basis conversion
    MIF_FILE_NAME     : string;
    C_ELABORATION_DIR : string;
    C_XDEVICEFAMILY   : string;
    C_FAMILY          : string
   );
  port (
    ena    : in  std_logic;
    enb    : in  std_logic;
    clk    : in  std_logic;
    din_a  : in  std_logic_vector(C_WIDTH-1 downto 0);
    din_b  : in  std_logic_vector(C_WIDTH-1 downto 0);
    dout_a : out std_logic_vector(C_WIDTH-1 downto 0);
    dout_b : out std_logic_vector(C_WIDTH-1 downto 0)
   );
end gf_dual_basis_rom;

architecture synth of gf_dual_basis_rom is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


constant sw      : integer := C_WIDTH; 
constant gf_size : integer := 2**sw;
constant depth   : integer := select_val(gf_size, 2 * gf_size, C_HAS_DOUT_B);
constant initial_num_bits : integer := depth * sw;


-- to store a bit version of the "conv_data" arrays
subtype lookup_element is bit_vector(sw-1 downto 0);
type conv_bit_array is array(0 to sw-1) of lookup_element;
type lookup is array (0 to gf_size-1) of lookup_element;

constant q_mif_file_name : string := MIF_FILE_NAME;
attribute qualified_by_project_dir of q_mif_file_name : constant is true;


constant min_depth : integer := 16;
constant final_num_bits : integer := range_check(initial_num_bits, min_depth*sw, integer'high);

--------------------------------------------------------------------------------
-- Useful function when needing to check actual values
--
function debug_a return boolean is
begin
            
  assert false
    report new_line &
      "depth = " & integer'image(depth) & new_line &
      "width = " & integer'image(sw) & new_line &
      "initial num bits = " & integer'image(initial_num_bits) & new_line &
      "final num bits = " & integer'image(final_num_bits) & new_line &
      "conv bit array has depth = " & integer'image(sw) & new_line &
      "conv bit array has symbol width = " & integer'image(sw) & new_line &
      "lookup has depth = " & integer'image(depth) & new_line &
      "lookup has width = " & integer'image(sw) & new_line 
    severity note;
       
return true;
        
end debug_a;

--constant debug1 : boolean := debug_a;



--------------------------------------------------------------------------------
-- This function creates an array of bit vectors from the conversion data
--
function create_initial_bit_array (
  width      : integer;
  data_array : basis_convert_array) return conv_bit_array is

  variable result : conv_bit_array;
begin

  for i in 0 to width-1 loop
    result(i) := integer_to_bit_vector(data_array(i), width); 
  end loop;        
  
--  assert false
--    report "Created Initial bit vector array" & new_line SEVERITY NOTE;
  
  return result;

end create_initial_bit_array;


constant bit_data_array_db2 : conv_bit_array :=create_initial_bit_array(sw,CONV_DATA_DB2);

constant bit_data_array_2db : conv_bit_array :=create_initial_bit_array(sw,CONV_DATA_2DB);

                                   
                                   
--------------------------------------------------------------------------------
-- This function creates the dual basis conversion lookup table
--
function create_basis_lookup(width      : integer;
                             gf_size    : integer;
                             data_array : conv_bit_array) return lookup is

  constant zero_val       : lookup_element := (others => '0');
  variable basis_contents : lookup;
  variable one_val        : bit_vector(width-1 downto 0);
  variable and_val        : bit_vector(width-1 downto 0);
  variable count          : bit_vector(width-1 downto 0);
  variable comp_val       : bit_vector(width-1 downto 0);
begin

  one_val := (others => '0');
  one_val(0) := '1';
  
  for i in 0 to (gf_size-1) loop
  
    count := integer_to_bit_vector(i, width); 
    basis_contents(i) := zero_val;
  
    for j in 0 to width-1 loop    
    
      and_val := one_val sll j; -- = 2**j
          
      for k in 0 to width-1 loop 
      
        comp_val := one_val sll k; -- = 2**k
        
        if (count(k)='1') and (comp_val(k)='1') then
        
          basis_contents(i) := basis_contents(i) xor (data_array(width-1-k) and and_val);

        end if;
        
      end loop; -- k      
    end loop; -- j
  end loop; -- i
     
  --assert false
  --  report "Created Basis Lookup" & new_line
  --  severity note;

  return basis_contents;

end create_basis_lookup;


constant basis_lookup_db2 : lookup := create_basis_lookup(sw, gf_size, bit_data_array_db2);

-- Only actually required if C_HAS_DOUT_B
constant basis_lookup_2db : lookup := create_basis_lookup(sw, gf_size, bit_data_array_2db);

                           
                           
                           
--------------------------------------------------------------------------------
-- Convert BIT_VECTOR ARRAY to BIT_VECTOR
--
function bit_vector_array_to_bit_vector(
  width                   : integer;
  depth                   : integer;
  bit_vector_array_length : integer;
  bit_vector_array_db2    : lookup;
  bit_vector_array_2db    : lookup) return bit_vector is

  constant num_bits : integer := depth * width;
  variable result : bit_vector(num_bits - 1 downto 0) := (others => '0');
  variable value  : bit_vector(width - 1 downto 0) := (others => '0');

begin
  -- Create bits for Dual-Basis to normal half of ROM
  for ai in 0 to (bit_vector_array_length - 1) loop -- ai = address index
    value := bit_vector_array_db2(ai);
    
    for bi in (width - 1) downto 0 loop -- bi = bit index
      result(ai*width + bi) := value(bi); 
    end loop; -- bi
  end loop; -- ai

  
  -- Create bits for normal to Dual-Basis half of ROM
  if C_HAS_DOUT_B /= 0 then
    
    for ai in 0 to (bit_vector_array_length - 1) loop -- ai = address index
      value := bit_vector_array_2db(ai);
      
      for bi in (width - 1) downto 0 loop -- bi = bit index
        result((bit_vector_array_length + ai)*width + bi) := value(bi); 
      end loop; -- bi
    end loop; -- ai
    
  end if; -- C_HAS_DOUT_B

--  assert false
--       report "Created bit vector array" & new_line SEVERITY NOTE;

  return result;
  
end bit_vector_array_to_bit_vector;


constant initial_contents : bit_vector(initial_num_bits-1 downto 0):=
                               bit_vector_array_to_bit_vector(sw,
                                                              depth,
                                                              gf_size,
                                                              basis_lookup_db2,
                                                              basis_lookup_2db);


                                                              
--------------------------------------------------------------------------------
-- This function pads out the contents bit_vector if sw = 3.
--
function pad_contents_for_sw3( width            : integer;
                               initial_num_bits : integer; 
                               final_num_bits   : integer; 
                               initial_contents : bit_vector) return bit_vector is
  variable final_contents : bit_vector(final_num_bits - 1 downto 0) := (others => '0');
begin
  if width = 3 then
    for bi in 0 to (initial_num_bits - 1) loop
      final_contents(bi) := initial_contents(bi);
      final_contents(initial_num_bits + bi) := initial_contents(bi);
    end loop; -- bi
    return final_contents;
  else -- width > 3
    return initial_contents;
  end if;  
end function; -- pad_contents

constant final_contents : bit_vector(final_num_bits - 1 downto 0) :=
   pad_contents_for_sw3(sw, initial_num_bits, final_num_bits, initial_contents);

constant final_depth : integer := range_check(depth, min_depth, integer'high);

signal zero_data : std_logic_vector(sw-1 downto 0) := (others => '0');


-------------------------------------------------------------------------------- 
-- Main Code
--------------------------------------------------------------------------------
begin
  zero_data <= (others=>'0');
  
  --
  -- Instantiate ROM
  --
  dbmif: -- file written
  if true generate
    constant file_written : boolean :=
           write_meminit_file(q_mif_file_name, c_elaboration_dir, final_depth, sw, final_contents);
           
    constant addr_width : integer := select_val(sw, sw+1, C_HAS_DOUT_B);
    
    signal addra : std_logic_vector(addr_width-1 downto 0) := (others => '0');
    signal addrb : std_logic_vector(addr_width-1 downto 0) := (others => '0');
    
  begin
  
    dbok: if (file_written = true) generate
    begin
    
      ag1 : for i in 0 to sw-1 generate
      begin
        addra(i) <= din_a(i);
        addrb(i) <= din_b(i);
      end generate; -- ag1
      
      ag2 : if C_HAS_DOUT_B /= 0 generate
      begin
        addra(sw) <= '0'; -- Store A values in lower half of ROM
        addrb(sw) <= '1'; -- Store B values in upper half of ROM
      end generate; -- ag2
      
        
      -- Always use block memory for CCSDS as symbol width will be 8 bits
      rom0 : rs_block_mem
      generic map(
        C_FAMILY           => C_FAMILY,
        C_XDEVICEFAMILY    => C_XDEVICEFAMILY,
        C_ELABORATION_DIR  => C_ELABORATION_DIR,
        C_ADDR_WIDTH       => addr_width,
        C_DEPTH            => final_depth,
        C_HAS_DOUTA        => 1,
        C_HAS_DOUTB        => C_HAS_DOUT_B,
        C_MEM_INIT_FILE    => MIF_FILE_NAME,
        C_LOAD_INIT_FILE   => 1,
        C_MEM_TYPE         => c_rom,
        C_WIDTH            => sw)
      port map(
        addra => addra,
        addrb => addrb,
        dina  => zero_data,
        dinb  => zero_data,
        ena   => ena,
        enb   => enb,
        clk   => clk,
        douta => dout_a,
        doutb => dout_b);
                      
    end generate; -- dbok
    

    dbbad: if (file_written = false) generate       
    begin
      assert file_written
        report "ERROR: couldn't write " & MIF_FILE_NAME
        severity failure;
    end generate; -- dbbad
  
  end generate; -- dbmif

END synth;



-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gf_erase_const_rom.vhd,v 1.2 2011/06/02 10:55:44 billw Exp $
--
-- Description: ROM containing all the constant values required
-- by the Erasure Search unit if N is run-time variable.
--
-- This ROM provides alpha^(h * (n-1)), for all possible N values.
--
-- N forms the ROM address input.
--
-- Author: Bill Wilkie
--
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;


LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.mem_init_file_pack.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gf_erase_const_rom IS
  GENERIC (
    symbol_width      : INTEGER;
    alpha_to          : integer_array_type;
    h_param           : INTEGER;
    c_has_ce          : INTEGER;
    memstyle          : mem_style_type;
    c_addr_width      : INTEGER;
    c_xdevicefamily   : STRING;
    c_family          : STRING;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING );
  PORT (
    ce     : IN  STD_LOGIC;
    clk    : IN  STD_LOGIC;
    addra  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    addrb  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    dout_a : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    dout_b : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0) );
END gf_erase_const_rom;

ARCHITECTURE synth OF gf_erase_const_rom IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


--------------------------------------------------------------------------------
-- Function to calculate ROM contents
-- i.e. alpha^(h(n-1))
-- 
FUNCTION calc_erase_const_values(
  sw         : INTEGER;
  alpha_to   : integer_array_type;
  h          : INTEGER) RETURN BIT_VECTOR IS
                                                            
  CONSTANT swm1   : INTEGER := sw - 1;
  CONSTANT gfas   : INTEGER := 2**sw;
  CONSTANT gf_max : INTEGER := gfas - 1;
  
  VARIABLE int_value  : INTEGER;
  VARIABLE log_value  : INTEGER;
  VARIABLE bv_value   : BIT_VECTOR(swm1 DOWNTO 0);
  VARIABLE result     : BIT_VECTOR(sw*gfas -1 DOWNTO 0);
  VARIABLE result_bit : INTEGER;
BEGIN

  result_bit := 0;
  
  ------------------------------------------------------------------------------
  -- Each block contains the possible values of alpha^(h(n-1)) ; one value
  -- for each possible n value.
  FOR n IN 0 TO gf_max LOOP
    
    log_value := ((n - 1) * h) REM gf_max;
      
    IF (log_value < 0) THEN
      log_value := gf_max + log_value;
    END IF; -- log_value

    int_value := alpha_to(log_value);
    bv_value  := integer_to_bit_vector(int_value, sw);
    
    FOR bi IN 0 TO swm1 LOOP -- bi = bit index
      result(result_bit) := bv_value(bi); 
      result_bit := result_bit + 1;
    END LOOP; -- bi
      
    --ASSERT FALSE
    --  REPORT  new_line &
    --          "n=" & x_to_string(n) &
    --          ", alpha_to(" & x_to_string(log_value) & ")=" &
    --          x_to_string(int_value)
    --  SEVERITY NOTE;
        
  END LOOP; -- n
      
  RETURN result;

END calc_erase_const_values;
  
  
--------------------------------------------------------------------------------
CONSTANT sw    : INTEGER := symbol_width; 
CONSTANT gfas  : INTEGER := 2**sw;


CONSTANT initial_depth    : INTEGER := gfas;
CONSTANT initial_num_bits : INTEGER := initial_depth * sw;



CONSTANT initial_contents : BIT_VECTOR(initial_num_bits - 1 DOWNTO 0) :=
                            calc_erase_const_values(sw,
                                                    alpha_to,
                                                    h_param);

                            
-- Ensure memory depth is legal
CONSTANT final_depth : INTEGER := calc_depth(initial_depth, memstyle);

CONSTANT final_num_bits : INTEGER := final_depth * sw;


--------------------------------------------------------------------------------
-- This function pads out the contents bit_vector. Only possibly necessary if
-- sw=3.
-- Assumes final_num_bits is 2 * initial_num_bits - which works for sw = 3
--
FUNCTION pad_contents(
  initial_num_bits : INTEGER; 
  final_num_bits   : INTEGER; 
  initial_contents : BIT_VECTOR) RETURN BIT_VECTOR IS
  
  VARIABLE final_contents : BIT_VECTOR(final_num_bits-1 DOWNTO 0) :=
                                                                (OTHERS => '0');
BEGIN
  IF final_num_bits > initial_num_bits THEN
  
    FOR bi IN 0 TO (initial_num_bits - 1) LOOP
      final_contents(bi) := initial_contents(bi);
      
      -- Replicate initial_contents in upper half of memory
      final_contents(initial_num_bits + bi) := initial_contents(bi);
    END LOOP; -- bi
    
    RETURN final_contents;
  ELSE
  
    RETURN initial_contents;
  END IF; -- final_num_bits
  
END FUNCTION; -- pad_contents



--------------------------------------------------------------------------------
CONSTANT final_contents : BIT_VECTOR(final_num_bits-1 DOWNTO 0) :=
               pad_contents(initial_num_bits, final_num_bits, initial_contents);


-- Fix to sort out bug with qualified_by_project_dir ATTRIBUTE
CONSTANT filename : STRING :=
                        concatenate_strings(c_mem_init_prefix, "gf_er_rom.mif");
CONSTANT q_filename : STRING := filename;

ATTRIBUTE qualified_by_project_dir OF q_filename : CONSTANT IS TRUE;


BEGIN

  dum: BLOCK
    CONSTANT file_written : BOOLEAN :=
                write_meminit_file(q_filename, c_elaboration_dir,
                                   final_depth, sw, final_contents);
                
    SIGNAL zero_data : STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0):= (others => '0');

  BEGIN   
    zero_data <= (OTHERS=>'0');
  
    --
    -- Instantiate the ROM
    --
    mif: -- file written
    IF (file_written=TRUE) GENERATE
      CONSTANT mem_type : INTEGER := c_rom; -- c_dp_ram
      
    BEGIN
      rom0 : rs_mem
      GENERIC MAP(
        c_family          => c_family,
        c_xdevicefamily   => c_xdevicefamily,
        c_elaboration_dir => c_elaboration_dir,
        c_memstyle        => memstyle,
        c_addr_width      => c_addr_width,
        c_depth           => final_depth,
        c_width           => sw,
        c_has_dout_a      => 1,
        c_has_dout_b      => 0,
        c_has_en          => c_has_ce,
        c_has_we          => 0,
        c_mem_init_file   => filename,
        c_mem_type        => mem_type,
        c_read_mif        => 1)
      PORT MAP(
        addra  => addra,
        addrb  => addrb,
        d      => zero_data,
        clk    => clk,
        en     => ce,
        we     => '0',
        dout_a => dout_a,
        dout_b => dout_b);
    END GENERATE; -- mif

    no_mif: -- no file written
    IF (file_written = FALSE) GENERATE
      ASSERT file_written
       REPORT "Error: Couldn't write gf_er_rom.mif"
        SEVERITY FAILURE;
    END GENERATE; -- no_mif
  
  END BLOCK; -- dum

  
END synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gf_var_mult_const_rom.vhd,v 1.2 2011/06/02 10:55:44 billw Exp $
--
-- Description: ROMs containing all the rs_generator polynomial values required
--
-- Author: Jeffrey Graham
--
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_bit.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.mem_init_file_pack.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gf_var_mult_const_rom IS
  GENERIC (
    c_addr_width      : INTEGER;
    c_family          : STRING;
    c_xdevicefamily   : STRING;
    c_has_ce          : INTEGER;
    c_memstyle        : INTEGER;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING;
    gen_start         : INTEGER;
    h                 : INTEGER;
    iteration         : INTEGER;
    nmk               : INTEGER;
    polynomial        : INTEGER;
    symbol_width      : INTEGER);
  PORT (
    ce        : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    addr_in   : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    coeff_out : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0) );
END ENTITY; -- gf_var_mult_const_rom;

ARCHITECTURE synth OF gf_var_mult_const_rom IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  CONSTANT debug    : BOOLEAN := FALSE; -- Print debug messages
  
  CONSTANT sw       : INTEGER := symbol_width;
  CONSTANT swm1     : INTEGER := sw - 1;
  CONSTANT gfas     : INTEGER := 2**sw;
  CONSTANT gfasm1   : INTEGER := gfas - 1;
  CONSTANT gfasm2   : INTEGER := gfas - 2;
  CONSTANT gf_max   : INTEGER := gfas - 1;
  CONSTANT nmkm1    : INTEGER := nmk - 1;
  CONSTANT spw      : INTEGER := (nmk + 1)/2;
  
  TYPE gc_array_type IS ARRAY(0 TO nmkm1) OF INTEGER;

  CONSTANT alpha_to : integer_array_type(0 TO gfasm2) :=
                                      gf_calc_elements(symbol_width,polynomial);
                                      
  CONSTANT index_of : integer_array_type(0 TO gfasm1) :=
                                         gf_calc_indices(symbol_width,alpha_to);
  
  ------------------------------------------------------------------------------
  -- ROM dimensions
  
  CONSTANT nmk_addr_width : INTEGER := bitsneededtorepresent(nmk);
  CONSTANT nmk_dist_depth : INTEGER := 2**(nmk_addr_width);
  CONSTANT nmk_block_depth : INTEGER := 2**((2*nmk_addr_width)+1);
  
  CONSTANT nmk_depth : INTEGER :=
                          select_val(nmk_dist_depth,nmk_block_depth,c_memstyle);
                          
  CONSTANT depth :INTEGER := calc_depth(nmk_depth, c_memstyle);

  -- Signals purely for debugging
  SIGNAL CONSTANT_nmk_addr_width  : INTEGER := nmk_addr_width;
  SIGNAL CONSTANT_nmk_dist_depth  : INTEGER := nmk_dist_depth;
  SIGNAL CONSTANT_nmk_block_depth : INTEGER := nmk_block_depth;
  SIGNAL CONSTANT_nmk_depth       : INTEGER := nmk_depth;
  SIGNAL CONSTANT_depth           : INTEGER := depth;

  TYPE gc_array_of_array_type IS ARRAY(0 TO nmk) OF gc_array_type;


  
  ------------------------------------------------------------------------------
  --
  -- Calculate generator polynomial product indices:
  --
  -- (X + @**(i*h)), where i = gen_start, ..., gen_start + (n-k-1)
  --
  -- Function works for any value of gen_start and h
  --
  ------------------------------------------------------------------------------
  FUNCTION calc_gcs(nmk_v : INTEGER)

    RETURN gc_array_type IS

    VARIABLE gc          : gc_array_type := (OTHERS=>1); -- generator coefficients
    VARIABLE inner_index : INTEGER; -- temporary variable
    VARIABLE index       : INTEGER; -- temporary variable
    VARIABLE lalpha_to   : INTEGER;
    
  BEGIN
    -- G(x) = (X + @**(gen_start*h)) initially
    gc(0) := alpha_to((gen_start*h) REM gfasm1);
    
--    FOR i IN 1 TO nmk_v-1 LOOP
--      gc(i) := 1;
--    END LOOP;
    
    FOR i IN 2 TO nmk_v LOOP
    
      -- Multiply (gg(0) + gg(1)*x + ... + gg(i)*x**i) by (@**(g+(i-1)*h) + x),
      FOR j IN (i - 1) DOWNTO 1 LOOP
        inner_index  := gc(j);
        IF inner_index /= 0 THEN
          index := (index_of(inner_index)+(gen_start+i-1)*h) REM gfasm1;
          --(0) REM gfasm1;
          lalpha_to := alpha_to(index);
          gc(j) := integer_xor(gc(j-1), lalpha_to, sw);
        ELSE
          gc(j) := gc(j-1);
        END IF;
      END LOOP; -- j
      
      -- generator(0) can never be zero
      inner_index  := gc(0);
      index        := (index_of(inner_index)+(gen_start+i-1)*h) REM gfasm1;
      gc(0)        := alpha_to(index);
      
    END LOOP; --i
    
    RETURN gc;
  END calc_gcs;

  
  
  ------------------------------------------------------------------------------
  -- Create BIT_VECTOR of ROM contents
  --
  FUNCTION calc_var_mult_roms_content RETURN BIT_VECTOR IS

    VARIABLE coeff_array_i          : gc_array_type;

    VARIABLE dist_rom_i_j_bv     : BIT_VECTOR(sw-1 DOWNTO 0);
    VARIABLE dist_rom_bv         : BIT_VECTOR(nmk*depth*sw-1 DOWNTO 0) := (OTHERS=>'0');
    VARIABLE dist_rom_local_bv   : BIT_VECTOR(depth*sw-1 DOWNTO 0);
    CONSTANT dist_col_size       : INTEGER := (depth*sw);

    VARIABLE blk_rom_i_j_bv      : BIT_VECTOR(sw-1 DOWNTO 0);
    VARIABLE blk_rom_bv          : BIT_VECTOR(depth*sw-1 DOWNTO 0) := (OTHERS=>'0');
    CONSTANT blk_col_size        : INTEGER := ((2**nmk_addr_width))*sw*2;

    VARIABLE j_int               : INTEGER := 0;
    VARIABLE j_loc               : INTEGER := 0;
    CONSTANT nmkm2nmko2          : INTEGER := nmk - (2*(nmk/2));
    VARIABLE rom_offset          : INTEGER;

    -- Constants to avoid arithmetic expression evaluation in loops.
    -- This can speed up XST.
    CONSTANT upper_j                : INTEGER := 3*nmk - 2*spw -2;
    CONSTANT nmk_plus_1             : INTEGER := nmk + 1;
    CONSTANT nmk_plus_1_times_sw_m1 : INTEGER := (nmk_plus_1 * sw) - 1;
    CONSTANT nmk_times_sw           : INTEGER := nmk * sw;
    
  BEGIN

    ASSERT NOT(debug)
      REPORT "In gf_var_mult_const_rom calc_var_mult_roms_content function" & new_line &
             "   nmk = " & INTEGER'IMAGE(nmk) & new_line &
             "   depth = " & INTEGER'IMAGE(depth) & new_line &
             "   c_memstyle = " & INTEGER'IMAGE(c_memstyle) & new_line
      SEVERITY NOTE;
      
      
    IF c_memstyle = 0 THEN -- dist mem
      --FOR i IN nmk*depth*sw-1 DOWNTO 0 LOOP
      --  dist_rom_bv(i) := '0';
      --END LOOP;
      
      FOR i IN nmk DOWNTO 1 LOOP
        coeff_array_i := calc_gcs(i);
        FOR j IN nmk-1 DOWNTO 0 LOOP
          -- shift by nmk-I coefficients so msb parameter ends up in pos nmk-1.
          --dist_rom_i_j_bv := integer_to_bit_vector(coeff_array_i(j), sw);
          dist_rom_i_j_bv := BIT_VECTOR(TO_UNSIGNED(coeff_array_i(j), sw));
          j_int := j + nmk - I;
          IF j_int < nmk THEN
            dist_rom_bv( ((I+1)*sw)+(j_int*dist_col_size)-1 DOWNTO
                         ((I)*sw)+(j_int*dist_col_size) ) := dist_rom_i_j_bv; 
          END IF;
        END LOOP;
      END LOOP;
      
      dist_rom_local_bv := dist_rom_bv( (iteration+1)*depth*sw-1 DOWNTO
                                        (iteration)*depth*sw);
      
      RETURN dist_rom_local_bv;
      
    ELSE -- block_mem

      --FOR I IN depth*sw-1 DOWNTO 0 LOOP
      --  blk_rom_bv(I) := '0';
      --END LOOP;

      -- if nmk is even
      IF nmkm2nmko2 = 0 THEN

        FOR i IN nmk DOWNTO 1 LOOP
          coeff_array_i := calc_gcs(i);
          -- the top pw*2-2 rom values should be 
          -- (nmk,nmk,nmk-1,nmk-1,....,nmk-pw+1,nmk-pw+1).
          -- the nmkth rom value should be the (nmk - pw) polynomial term.
          -- the remaining rom values should be (nmk-pw-I) polynomial term.
          
         rom_offset := i * blk_col_size;

          FOR j IN 2*nmk DOWNTO 0 LOOP

            IF j > upper_j THEN
              j_int := -1;
            ELSIF j > nmk  THEN
              j_int := (j - upper_j)/2 + i-1;
            ELSE
              j_int := (i - spw) - (nmk-j);
            END IF;

            -- j_int is used to select a particular generator coefficient from
            -- coeff_array_i
            -- If j_int <0 blk_rom_bv values will be left at initial 0
            IF j_int >=0 THEN
              blk_rom_bv( ((j+1)*sw)+rom_offset-1 DOWNTO (j*sw)+rom_offset ) :=
                              BIT_VECTOR(TO_UNSIGNED(coeff_array_i(j_int), sw));
            --  blk_rom_i_j_bv := integer_to_bit_vector(coeff_array_i(j_int), sw);
            --ELSE
            --  blk_rom_i_j_bv := (OTHERS=>'0');
            END IF;


          END LOOP; -- j
          
          IF (i=spw) THEN
            blk_rom_i_j_bv :=
              blk_rom_bv( nmk_plus_1_times_sw_m1+rom_offset DOWNTO
                          nmk_times_sw+rom_offset );
              
            FOR j IN nmk DOWNTO 0 LOOP
              blk_rom_bv( ((j+1)*sw)+rom_offset-1 DOWNTO (j*sw)+rom_offset ) :=
                                                                 blk_rom_i_j_bv;
            END LOOP; -- j
            
          END IF; -- i=spw
        
        END LOOP; -- i

      -- if nmk is odd
      ELSE -- IF nmkm2nmko2 = 0  

        FOR i IN nmk DOWNTO 1 LOOP
        
          -- Get array of nmk generator coefficients for this i value
          coeff_array_i := calc_gcs(i); -- returns array of nmk integers
          
          --FOR coeff IN 0 TO nmkm1 LOOP
          --  ASSERT FALSE
          --    REPORT "i=" & INTEGER'IMAGE(i) & ": coeff_array_i(" &
          --           INTEGER'IMAGE(coeff) & ")=" &
          --           INTEGER'IMAGE(coeff_array_i(coeff))
          --    SEVERITY NOTE;
          --END LOOP; -- coeff
          
          rom_offset := i * blk_col_size;
          
          -- the top pw*2-2 rom values should be 
          -- (nmk,nmk,nmk-1,nmk-1,....,nmk-pw+1,nmk-pw+1).
          -- the nmkth rom value should be the (nmk - pw) polynomial term.
          -- the remaining rom values should be (nmk-pw-I) polynomial term.
          FOR j IN 2*nmk DOWNTO 0 LOOP

            IF j > (3*nmk - 2*spw) THEN
              j_int := -1;
            ELSIF j > nmk  THEN
              j_int := (j - 3*nmk + 2*spw)/2 + i-1;
            ELSE
              j_int := (i - spw) - (nmk-j);
            END IF;

            -- j_int is used to select a particular generator coefficient from
            -- coeff_array_i
            -- If j_int <0 blk_rom_bv values will be left at initial 0
            IF j_int >=0 THEN
            --  blk_rom_i_j_bv := integer_to_bit_vector(coeff_array_i(j_int), sw);
              blk_rom_bv( ((j+1)*sw)+rom_offset-1 DOWNTO (j*sw)+rom_offset) :=
                              BIT_VECTOR(TO_UNSIGNED(coeff_array_i(j_int), sw));
                              --  integer_to_bit_vector(coeff_array_i(j_int), sw);
            --ELSE
            --  blk_rom_i_j_bv := integer_to_bit_vector(0, sw);
            END IF;

            --blk_rom_bv( ((j+1)*sw)+rom_offset-1 DOWNTO (j*sw)+rom_offset) := blk_rom_i_j_bv; 

          END LOOP; -- j

          IF (i=spw) THEN
            blk_rom_i_j_bv :=
              blk_rom_bv( nmk_plus_1_times_sw_m1+rom_offset DOWNTO 
                          nmk_times_sw+rom_offset ); 
                          
            FOR j IN nmk DOWNTO 0 LOOP
              blk_rom_bv( ((j+1)*sw)+rom_offset-1 DOWNTO (j*sw)+rom_offset ) :=
                                                                 blk_rom_i_j_bv;
            END LOOP; -- j
            
          END IF; -- i=spw
        
        END LOOP; -- i
        
      END IF; -- nmk even/odd
      
      RETURN blk_rom_bv;
      
    END IF; -- block_mem


  END FUNCTION calc_var_mult_roms_content;

  -- Fix to sort out bug with qualified_by_project_dir ATTRIBUTE
  CONSTANT filename : STRING := concatenate_strings(
                  concatenate_strings(c_mem_init_prefix, "gf_vmult_coeff_rom_"),
                  concatenate_strings(x_to_string(iteration), ".mif")   );
  CONSTANT q_filename : STRING := filename;
 
  ATTRIBUTE qualified_by_project_dir OF q_filename : CONSTANT IS TRUE;
   
--  CONSTANT rom_content_local : BIT_VECTOR(depth*symbol_width-1 DOWNTO 0) :=
--                                                     calc_var_mult_roms_content;

BEGIN

 dum: BLOCK
    CONSTANT file_written : BOOLEAN :=
                     write_meminit_file(q_filename, c_elaboration_dir,
                                        depth, symbol_width, calc_var_mult_roms_content);
--                                        depth, symbol_width, rom_content_local);
                
    SIGNAL zero_data : STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0):= (others => '0');
    SIGNAL zero_addr : STD_LOGIC_VECTOR(c_addr_width-1 DOWNTO 0):= (others => '0');

 BEGIN   

    gen_zero_data: FOR I IN symbol_width-1 DOWNTO 0 GENERATE
      zero_data(i) <= '0';
    END GENERATE;

    gen_zero_addr: FOR I IN c_addr_width-1 DOWNTO 0 GENERATE
      zero_addr(i) <= '0';
    END GENERATE;

    --
    -- Instantiate the ROM
    --
    mif: -- file written
    IF (file_written=TRUE) GENERATE
      CONSTANT mem_type : INTEGER := c_rom; -- c_dp_ram
      
    BEGIN
      rom0 : rs_mem
      GENERIC MAP(
        c_family          => c_family,
        c_xdevicefamily   => c_xdevicefamily,
        c_elaboration_dir => c_elaboration_dir,
        c_memstyle        => c_memstyle,
        c_addr_width      => c_addr_width,
        c_depth           => depth,
        c_width           => symbol_width,
        c_has_dout_a      => 1,
        c_has_dout_b      => 0,
        c_has_en          => c_has_ce,
        c_has_we          => 0,
        c_mem_init_file   => filename,
        c_mem_type        => c_rom,
        c_read_mif        => 1)
      PORT MAP(
        addra  => addr_in,
        addrb  => zero_addr,
        d      => zero_data,
        clk    => clk,
        en     => ce,
        we     => '0',
        dout_a => coeff_out,
        dout_b => OPEN);
    END GENERATE; -- mif

    no_mif: -- no file written
    IF (file_written = FALSE) GENERATE
      ASSERT file_written
        REPORT "Error: Couldn't write " & filename
        SEVERITY FAILURE;
    END GENERATE; -- no_mif

 END BLOCK; -- dum

  
END synth;




-------------------------------------------------------------------------------
--  (c) Copyright 2002-2010 Xilinx, Inc. All rights reserved.
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
-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/rs_toolbox_v9_0_3/hdl/gf_chien_const_rom.vhd,v 1.2 2011/06/02 10:55:44 billw Exp $
--
-- Description: ROM containing all the constant values required
-- by the Chien Search unit if N is run-time variable.
--
-- This ROM provides different constants for the Chien Search coefficient
-- scaling depending on gen_start.
--
-- Locator polynomial coefficient i has to be scaled by:
--  alpha^(h * (i - gen_start) * A)
--
-- Evaluator polynomial coefficient i has to be scaled by:
--  alpha^(h * i * A)
--
-- where A = gf_max - N
--
-- N forms the LSB's of the ROM address input. The msbs are driven by a counter
-- that cycles through all the required coefficients.
--
-- The ROM is dual-port for the general case where gen_start > 1. It is
-- single-port for the special cases gen_start=0 and gen_start=1.
--
-- Author: Bill Wilkie
--
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY rs_toolbox_v9_0_3;
USE rs_toolbox_v9_0_3.ul_utils.ALL;
USE rs_toolbox_v9_0_3.util_xcc.ALL;
USE rs_toolbox_v9_0_3.toolbox_comps.ALL;
USE rs_toolbox_v9_0_3.mem_utils.ALL;
USE rs_toolbox_v9_0_3.mem_init_file_pack.ALL;
USE rs_toolbox_v9_0_3.gf_pkg.ALL;


ENTITY gf_chien_const_rom IS
  GENERIC (
    symbol_width      : INTEGER;
    alpha_to          : integer_array_type;
    c_has_n_in        : INTEGER;
    h_param           : INTEGER;
    c_n               : INTEGER;
    num_coeffs        : INTEGER;
    gen_start         : INTEGER;
    c_has_ce          : INTEGER;
    memstyle          : mem_style_type;
    c_addr_width      : INTEGER;
    c_xdevicefamily   : STRING;
    c_family          : STRING;
    c_mem_init_prefix : STRING;
    c_elaboration_dir : STRING );
  PORT (
    ce     : IN  STD_LOGIC;
    clk    : IN  STD_LOGIC;
    addra  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    addrb  : IN  STD_LOGIC_VECTOR(c_addr_width - 1 DOWNTO 0);
    dout_a : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0);
    dout_b : OUT STD_LOGIC_VECTOR(symbol_width - 1 DOWNTO 0) );
END gf_chien_const_rom;

ARCHITECTURE synth OF gf_chien_const_rom IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


-- The ROM is divided into sub-blocks, each of depth equal to the number
-- of possible N values (=1 if c_has_n_in=0).
-- Determine number of distinct alpha power values that must be stored for
-- each possible N value. If gen_start>1 then we need to store alpha(Ah)
-- as well as the first scaling value, so we must always have at least two
-- sub-blocks in this case.
CONSTANT num_sub_blocks : INTEGER :=
                      select_val_b(num_coeffs, 2, num_coeffs<2 AND gen_start>1);

--------------------------------------------------------------------------------
-- Function to calculate ROM contents
-- 
-- num_coeffs = t if no erasure handling, = r if erasure handling
--
FUNCTION calc_chien_const_values(
  sw             : INTEGER;
  alpha_to       : integer_array_type;
  c_has_n_in     : INTEGER;
  c_h            : INTEGER;
  c_n            : INTEGER;
  num_sub_blocks : INTEGER;
  depth          : INTEGER;
  gen_start      : INTEGER) RETURN BIT_VECTOR IS
  
  -- Workaround for CR698792 - Vivado synthesis memory blow up
  ATTRIBUTE calc_chien_const_values : STRING;
  ATTRIBUTE calc_chien_const_values OF sw : CONSTANT IS "yes";
  
                                                            
  CONSTANT swm1   : INTEGER := sw - 1;
  CONSTANT gfas   : INTEGER := 2**sw;
  CONSTANT gf_max : INTEGER := gfas - 1;
  CONSTANT h_rem : INTEGER := c_h REM gf_max;
  
  VARIABLE imgs       : INTEGER;
  VARIABLE int_value  : INTEGER;
  VARIABLE log_value  : INTEGER;
  VARIABLE bv_value   : BIT_VECTOR(swm1 DOWNTO 0);
  VARIABLE result     : BIT_VECTOR(depth-1 DOWNTO 0);
  VARIABLE result_bit : INTEGER;
BEGIN

  result_bit := 0;
  
  ------------------------------------------------------------------------------
  IF gen_start = 0 THEN
  
    -- ROM contains num_coeff blocks of gfas values. Each block contains
    -- the gfas possible values of alpha^(Ahi) ; one value for each possible
    -- n value. i is the coefficient number. The values corresponding to
    -- i = 0 are not stored as they are all alpha^0 = 1. This value is
    -- generated by a mux outside the ROM.
    -- For the gen_start = 0 case the evaluator scalers are identical to the
    -- locator scalers delayed by 1 cycle.
    FOR i IN 1 TO num_sub_blocks LOOP
    
      --ASSERT FALSE
      --  REPORT  new_line &
      --          "gf_chien_const_rom values for coefficient number " &
      --          x_to_string(i) & new_line
      --  SEVERITY NOTE;
        
      IF c_has_n_in = 0 THEN
        -- Only need one value for each coefficient
        log_value := (i * (gf_max - c_n) * h_rem) REM gf_max;
        int_value := alpha_to(log_value);
        bv_value  := integer_to_bit_vector(int_value, sw);
    
        FOR bi IN 0 TO swm1 LOOP -- bi = bit index
          result(result_bit) := bv_value(bi); 
          result_bit := result_bit + 1;
        END LOOP; -- bi
        
      ELSE
        -- Calculate ROM contents for each possible n value
        FOR n IN 0 TO gf_max LOOP
          log_value := (i * (gf_max - n) * h_rem) REM gf_max;
          int_value := alpha_to(log_value);
          bv_value  := integer_to_bit_vector(int_value, sw);
    
          FOR bi IN 0 TO swm1 LOOP -- bi = bit index
            result(result_bit) := bv_value(bi); 
            result_bit := result_bit + 1;
          END LOOP; -- bi
      
          --ASSERT FALSE
          --  REPORT  new_line &
          --          "n=" & x_to_string(n) &
          --          ", alpha_to(" & x_to_string(log_value) & ")=" &
          --          x_to_string(int_value)
          --  SEVERITY NOTE;
        
        END LOOP; -- n
        
      END IF; -- c_has_n_in
      
    END LOOP; -- i
      
  END IF; -- gen_start = 0
  
  
  ------------------------------------------------------------------------------
  IF gen_start /= 0 THEN
  
    -- ROM contains num_coeff blocks of gfas values. The first block contains
    -- the gfas possible values of alpha^(Ah(0-gen_start)) ; one value for each
    -- possible n value. The remaining blocks hold the evaluator scalers.
    -- The values corresponding to i = 1 are not stored as they are all
    -- alpha^0 = 1. This value is generated by a mux outside the ROM.
    -- For the gen_start = 1 case the evaluator scalers and locator scalers
    -- are indentical except for the first one.
    FOR i IN 0 TO num_sub_blocks-1 LOOP
    
      --ASSERT FALSE
      --  REPORT  new_line &
      --          "gf_chien_const_rom values for coefficient number " &
      --          x_to_string(i) & new_line
      --  SEVERITY NOTE;
    
      -- First block holds alpha^(Ah(-gen_start))
      IF i = 0 THEN
        imgs := 0 - gen_start;
      ELSE
        -- Apart from i = 0, store the values required to scale the evaluator
        -- polynomial.
        imgs := i;
      END IF; -- i = 0
      
      IF c_has_n_in = 0 THEN
        -- Only need one value for each coefficient
        log_value := (imgs * (gf_max - c_n) * h_rem) REM gf_max;
        
        IF (log_value < 0) THEN
          log_value := gf_max + log_value;
        END IF; -- log_value

        int_value := alpha_to(log_value);
        bv_value  := integer_to_bit_vector(int_value, sw);
    
        FOR bi IN 0 TO swm1 LOOP -- bi = bit index
          result(result_bit) := bv_value(bi); 
          result_bit := result_bit + 1;
        END LOOP; -- bi
        
      ELSE
        -- Calculate ROM contents for each possible n value
        FOR n IN 0 TO gf_max LOOP
          log_value := (imgs * (gf_max - n) * h_rem) REM gf_max;
        
          IF (log_value < 0) THEN
            log_value := gf_max + log_value;
          END IF; -- log_value

          int_value := alpha_to(log_value);
          bv_value  := integer_to_bit_vector(int_value, sw);
    
          FOR bi IN 0 TO swm1 LOOP -- bi = bit index
            result(result_bit) := bv_value(bi); 
            result_bit := result_bit + 1;
          END LOOP; -- bi
        
--           ASSERT FALSE
--             REPORT  new_line &
--                     "n=" & x_to_string(n) &
--                     ", alpha_to(" & x_to_string(log_value) & ")=" &
--                     x_to_string(int_value)
--             SEVERITY NOTE;
        
        END LOOP; -- n
      
      END IF; -- c_has_n_in
      
    END LOOP; -- i
  
  END IF; -- gen_start /= 0
      
      
  -- If gen_start > 1 then alpha^(Ah(-gen_start)) is output on the B port
  -- for the first cycle. This is the initial locator scaler. alpha^(Ah) is
  -- continuously output on the A port. This is used to compute subsequent
  -- locator coefficient scalers.
  -- After the initial locator scaler has been output on the B port, it is
  -- followed by the evaluator scalers (except for alpha^0).
      
  RETURN result;

END calc_chien_const_values;
  
  
--------------------------------------------------------------------------------
CONSTANT sw   : INTEGER := symbol_width; 
CONSTANT gfas : INTEGER := 2**sw;


CONSTANT initial_depth : INTEGER :=
                  select_val(num_sub_blocks, gfas * num_sub_blocks, c_has_n_in);
                        
CONSTANT initial_num_bits : INTEGER := initial_depth * sw;



CONSTANT initial_contents : BIT_VECTOR(initial_num_bits - 1 DOWNTO 0) :=
                            calc_chien_const_values(sw,
                                                    alpha_to,
                                                    c_has_n_in,
                                                    h_param,
                                                    c_n,
                                                    num_sub_blocks,
                                                    initial_num_bits,
                                                    gen_start);

                            
-- Ensure memory depth is legal
CONSTANT final_depth : INTEGER := calc_depth(initial_depth, memstyle);

CONSTANT final_num_bits : INTEGER := final_depth * sw;


--------------------------------------------------------------------------------
-- This function pads out the contents bit_vector with zeroes.
--
FUNCTION pad_contents(
  initial_num_bits : INTEGER; 
  final_num_bits   : INTEGER; 
  initial_contents : BIT_VECTOR) RETURN BIT_VECTOR IS
  
  VARIABLE final_contents : BIT_VECTOR(final_num_bits-1 DOWNTO 0) :=
                                                                (OTHERS => '0');
BEGIN
  IF final_num_bits > initial_num_bits THEN
  
    FOR bi IN 0 TO (initial_num_bits - 1) LOOP
      final_contents(bi) := initial_contents(bi);
    END LOOP; -- bi
    
    -- Pad with zeroes
    FOR bi IN initial_num_bits TO (final_num_bits - 1) LOOP
      final_contents(bi) := '0';
    END LOOP; -- bi
    
    RETURN final_contents;
  ELSE
  
    RETURN initial_contents;
  END IF; -- final_num_bits
  
END FUNCTION; -- pad_contents



--------------------------------------------------------------------------------
CONSTANT final_contents : BIT_VECTOR(final_num_bits-1 DOWNTO 0) :=
               pad_contents(initial_num_bits, final_num_bits, initial_contents);


-- Fix to sort out bug with qualified_by_project_dir ATTRIBUTE
CONSTANT filename : STRING :=
                        concatenate_strings(c_mem_init_prefix, "gf_ch_rom.mif");
CONSTANT q_filename : STRING := filename;

ATTRIBUTE qualified_by_project_dir OF q_filename : CONSTANT IS TRUE;


BEGIN

  dum: BLOCK
    CONSTANT file_written : BOOLEAN :=
                write_meminit_file(q_filename, c_elaboration_dir,
                                   final_depth, sw, final_contents);
                
    SIGNAL zero_data : STD_LOGIC_VECTOR(symbol_width-1 DOWNTO 0):= (others => '0');

  BEGIN   
    zero_data <= (OTHERS=>'0');
  
    --
    -- Instantiate the ROM
    --
    mif: -- file written
    IF (file_written=TRUE) GENERATE
      CONSTANT mem_type : INTEGER :=
                                 select_val_b(c_rom, c_dp_ram, (gen_start > 1));
    BEGIN
      rom0 : rs_mem
      GENERIC MAP(
        c_family          => c_family,
        c_xdevicefamily   => c_xdevicefamily,
        c_elaboration_dir => c_elaboration_dir,
        c_memstyle        => memstyle,
        c_addr_width      => c_addr_width,
        c_depth           => final_depth,
        c_width           => sw,
        c_has_dout_a      => 1,
        c_has_dout_b      => bool_to_int(gen_start > 1),
        c_has_en          => c_has_ce,
        c_has_we          => 0,
        c_mem_init_file   => filename,
        c_mem_type        => mem_type,
        c_read_mif        => 1)
      PORT MAP(
        addra  => addra,
        addrb  => addrb,
        d      => zero_data,
        clk    => clk,
        en     => ce,
        we     => '0',
        dout_a => dout_a,
        dout_b => dout_b);
    END GENERATE; -- mif

    no_mif: -- no file written
    IF (file_written = FALSE) GENERATE
      ASSERT file_written
       REPORT "Error: Couldn't write gf_chien_const_rom.mif"
        SEVERITY FAILURE;
    END GENERATE; -- no_mif
  
  END BLOCK; -- dum

  
END synth;





