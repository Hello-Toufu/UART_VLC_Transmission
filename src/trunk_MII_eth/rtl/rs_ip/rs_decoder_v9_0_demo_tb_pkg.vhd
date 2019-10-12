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
-- Reed-Solomon Decoder demo testbench package
-- Contains functions to RS-encode data, to provide input data to the RS Decoder
-- Available through XilinxCoreLib in obfuscated form
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package rs_decoder_v9_0_12_demo_tb_pkg is

  -- Constants for c_spec generic values
  constant CCSDS_SPEC   : integer := 1;

  -- Constants for c_symbol_width generic limits
  constant MIN_SYMBOL_WIDTH : integer := 2;
  constant MAX_SYMBOL_WIDTH : integer := 12;

  -- Unconstrained array type for passing codeblock data in and out of functions
  subtype t_symbol_max is std_logic_vector(MAX_SYMBOL_WIDTH-1 downto 0);
  type t_codeblock is array (integer range <>) of t_symbol_max;

  -- Other types for passing arrays in and out of functions
  type t_integer_array is array (integer range <>) of integer;

  -- CCSDS dual basis types and constants
  constant CCSDS_SYMBOL_WIDTH : integer := 8;  -- CCSDS only supported with this specific symbol width
  type t_basis_convert_array is array (0 to CCSDS_SYMBOL_WIDTH-1) of std_logic_vector(CCSDS_SYMBOL_WIDTH-1 downto 0);
  constant CCSDS_BASIS_CONV: t_basis_convert_array     := ("10001101",  -- 141  -  normal to dual
                                                           "11101111",  -- 239
                                                           "11101100",  -- 236
                                                           "10000110",  -- 134
                                                           "11111010",  -- 250
                                                           "10011001",  -- 153
                                                           "10101111",  -- 175
                                                           "01111011"); -- 123
  constant CCSDS_BASIS_CONV_INV: t_basis_convert_array := ("11000101",  -- 197  -  dual to normal
                                                           "01000010",  --  66
                                                           "00101110",  --  46
                                                           "11111101",  -- 253
                                                           "11110000",  -- 240
                                                           "01111001",  -- 121
                                                           "10101100",  -- 172
                                                           "11001100"); -- 204

  -- Default polynomials for each value of c_symbol_width
  type t_polynomials_array is array(MIN_SYMBOL_WIDTH to MAX_SYMBOL_WIDTH) of integer;
  constant DEFAULT_POLYNOMIAL : t_polynomials_array := ( 2  => 7,      -- "00000000000000111"
                                                         3  => 11,     -- "00000000000001011"
                                                         4  => 19,     -- "00000000000010011"
                                                         5  => 37,     -- "00000000000100101"
                                                         6  => 67,     -- "00000000001000011"
                                                         7  => 137,    -- "00000000010001001"
                                                         8  => 285,    -- "00000000100011101"
                                                         9  => 529,    -- "00000001000010001"
                                                         10 => 1033,   -- "00000010000001001"
                                                         11 => 2053,   -- "00000100000000101"
                                                         12 => 4179);  -- "00001000001010011"

  -- Mimic C / Verilog conditional operator ? : for integer arguments
  function cond (
    condition : boolean;
    iftrue    : integer;
    iffalse   : integer
    ) return integer;

  -- Get polynomial from generic or list of defaults
  function get_polynomial(poly, symbol_width : integer)
    return integer;

  -- calculate Galois Field record elements
  function gf_calc_elements(polynomial, symbol_width : integer)
    return t_integer_array;

  -- create Galois Field Index array for use in GF multiplication
  function gf_calc_indices(symbol_width : integer; alpha_to : t_integer_array)
    return t_integer_array;

  -- Calculate generator polynomial product indices
  function calc_gcs(nmk_v, gen_start, h, symbol_width : integer; alpha_to, index_of : t_integer_array)
    return t_integer_array;

  -- Behavioural Galois Field multiplier using lookup table method
  function gfmul(aa, bb, symbol_width : integer; alpha_to, index_of : t_integer_array)
    return std_logic_vector;

  -- Dual basis conversion for CCSDS spec
  function calc_db_symbol(symbol : std_logic_vector; basis_conv : t_basis_convert_array)
    return std_logic_vector;

  -- Convert a symbol from normal to dual basis for CCSDS spec
  function normal_to_db(symbol : std_logic_vector)
    return std_logic_vector;

  -- Convert a symbol from dual basis to normal for CCSDS spec
  function db_to_normal(symbol : std_logic_vector)
    return std_logic_vector;

  -- RS encode a codeblock
  function rs_encode (
    -- Input data codeblock
    data_in        : t_codeblock;
    -- RS encoder top level generics
    c_gen_start    : integer;  -- start index for generator polynomial
    c_h            : integer;  -- scaling factor for generator polynomial root index
    c_k            : integer;  -- number of data symbols in the code block
    c_n            : integer;  -- total number of symbols in the code block
    c_polynomial   : integer;
    c_spec         : integer;
    c_symbol_width : integer;
    -- Variable codeblock parameters
    n_in           : integer := -1;  -- number of data symbols, do not set if c_has_n_in = 0 and c_has_r_in = 0
    r_in           : integer := -1   -- number of check symbols, do not set if c_has_r_in = 0
    ) return t_codeblock;  -- output data codeblock


end package rs_decoder_v9_0_12_demo_tb_pkg;


package body rs_decoder_v9_0_12_demo_tb_pkg is

  -- Mimic C / Verilog conditional operator ? : for integer arguments
  function cond (
    condition : boolean;
    iftrue    : integer;
    iffalse   : integer
    ) return integer is
  begin
    if condition then
      return iftrue;
    else
      return iffalse;
    end if;
  end function cond;

  -- Get polynomial from generic or list of defaults
  function get_polynomial(poly, symbol_width : integer)
    return integer is
    variable poly_nat : integer := 0;
  begin
    if poly = 0 then
      poly_nat := DEFAULT_POLYNOMIAL(symbol_width);
    else
      poly_nat := poly;
    end if;

    assert poly_nat /= 0
      report "ERROR: rs_decoder_v9_0_12_demo_tb_pkg.get_polynomial: No polynomial supplied and no default available for specified symbol width."
      severity failure;

    return poly_nat;
  end get_polynomial;

  -- calculate Galois Field record elements
  function gf_calc_elements(polynomial, symbol_width : integer)
    return t_integer_array is
    constant GFAS   : integer := 2**symbol_width;
    subtype t_alpha_to_array is t_integer_array(0 to GFAS-2);
    variable alpha_to   : t_alpha_to_array := (others => 0);
    variable field_poly : integer := 0;
    variable mask       : integer := 0;
    variable temp       : integer := 0;
  begin
    field_poly := get_polynomial(polynomial, symbol_width);

    -- create the Galois Field elements alpha_to(0 TO symbol_width - 1)
    mask := 1;
    for i in 0 to symbol_width-1 loop
      alpha_to(i) := mask;
      mask := mask*2;
    end loop;
    -- if field_poly > 2**sw, remove msbs
    alpha_to(symbol_width) := field_poly rem GFAS;
    mask := mask/2; -- reduce mask

    -- create the remaining Galois Field elements
    for j in (symbol_width + 1) to GFAS-2 loop
      if (alpha_to(j - 1) >= mask) then
        temp := 2*(alpha_to(j - 1) - mask);
        alpha_to(j) := to_integer(to_unsigned(field_poly mod GFAS, symbol_width) xor to_unsigned(temp, symbol_width));
      else
        alpha_to(j) := alpha_to(j - 1)*2;
      end if;
    end loop; -- j
    return alpha_to;
  end gf_calc_elements;

  -- create Galois Field Index array for use in GF multiplication
  function gf_calc_indices(symbol_width : integer; alpha_to : t_integer_array)
    return t_integer_array is
    constant GFAS : integer := 2**symbol_width;
    subtype t_index_of_array is t_integer_array(0 to GFAS-1);
    variable index_of : t_index_of_array := (others => 0);
  begin
    -- index_of(0) shouldn't get used in GF multiplication using lookup tables as it
    -- is negative infinity - in this model it will be set it to 0, so gfmul_bhv()
    -- function must handle index_of(0) as a special case
    -- initialise index_of() array
    for i in 0 to GFAS-1 loop
      index_of(i) := 0;
    end loop;
    -- find index for each Galois Field element
    for i in 0 to GFAS-2 loop
      index_of(alpha_to(i)) := i;
    end loop;
    return index_of;
  end gf_calc_indices;

  -- Calculate generator polynomial product indices:
  -- (X + @**(i*h)), where i = gen_start, ..., gen_start + (n-k-1)
  -- Function works for any value of gen_start and h
  function calc_gcs(nmk_v, gen_start, h, symbol_width : integer; alpha_to, index_of : t_integer_array)
    return t_integer_array is
    constant GFASM1 : integer := 2**symbol_width - 1;
    subtype t_gc_array is t_integer_array(0 to nmk_v-1);
    variable gc          : t_gc_array := (others => 0); -- generator coefficients
    variable inner_index : integer := 0; -- temporary variable
    variable index       : integer := 0; -- temporary variable
    variable lalpha_to   : integer := 0;
  begin
    -- G(x) = (X + @**(gen_start*h)) initially
    gc(0) := alpha_to((gen_start*h) rem GFASM1);

    for i in 1 to nmk_v-1 loop
      gc(i) := 1;
    end loop;

    for i in 2 to nmk_v loop
      -- Multiply (gg(0) + gg(1)*x + ... + gg(i)*x**i) by (@**(g+(i-1)*h) + x),
      for j in (i - 1) downto 1 loop
        inner_index  := gc(j);
        if inner_index /= 0 then
          index := (index_of(inner_index)+(gen_start+i-1)*h) rem GFASM1;
          lalpha_to := alpha_to(index);
          gc(j) := to_integer(to_unsigned(gc(j-1), symbol_width) xor to_unsigned(lalpha_to, symbol_width));
        else
          gc(j) := gc(j-1);
        end if;
      end loop; -- j
      -- generator(0) can never be zero
      inner_index  := gc(0);
      index        := (index_of(inner_index)+(gen_start+i-1)*h) rem GFASM1;
      gc(0)        := alpha_to(index);
    end loop; --i
    return gc;
  end calc_gcs;

  -- Behavioural Galois Field multiplier using lookup table method
  -- Note that inputs are integers while output is a std_logic_vector
  function gfmul(aa, bb, symbol_width : integer; alpha_to, index_of : t_integer_array)
    return std_logic_vector is
    constant GFASM1   : integer := 2**symbol_width - 1;
    variable cc_index : integer := 0;
    variable cc       : std_logic_vector(symbol_width-1 downto 0) := (others => '0');
  begin
    -- special case if either of the inputs is zero, return zero (default value of cc)
    if not (aa = 0 or bb = 0) then
      -- add the indexes of the two input coefficients modulo GFASM1
      cc_index := (index_of(aa) + index_of(bb)) rem GFASM1;
      -- convert product index to polynomial representation
      cc := std_logic_vector(to_unsigned(alpha_to(cc_index), symbol_width));
    end if;
    return cc;
  end gfmul;

  -- Dual basis conversion for CCSDS spec
  -- Width of input symbol must be CCSDS_SYMBOL_WIDTH: this is checked in wrapper functions normal_to_db & db_to_normal
  function calc_db_symbol(symbol : std_logic_vector; basis_conv : t_basis_convert_array)
    return std_logic_vector is
    variable result : std_logic_vector(CCSDS_SYMBOL_WIDTH-1 downto 0) := (others => '0');
  begin

    -- Convert the single symbol passed in
    for j in 0 to CCSDS_SYMBOL_WIDTH-1 loop
      for k in 0 to CCSDS_SYMBOL_WIDTH-1 loop
        if symbol(k) = '1' then
          result(j) := result(j) xor basis_conv(CCSDS_SYMBOL_WIDTH-1-k)(j);
        end if;
      end loop;
    end loop;

    return result;
  end calc_db_symbol;

  -- Convert a symbol from normal to dual basis for CCSDS spec
  function normal_to_db(symbol : std_logic_vector)
    return std_logic_vector is
    variable result : std_logic_vector(CCSDS_SYMBOL_WIDTH-1 downto 0);
  begin

    -- Check the input symbol has the correct number of bits
    assert symbol'length = CCSDS_SYMBOL_WIDTH
      report "ERROR: rs_decoder_v9_0_12_demo_tb_pkg.normal_to_db: input symbol has width " & integer'image(symbol'length) & " but the only supported symbol width for CCSDS is " & integer'image(CCSDS_SYMBOL_WIDTH)
      severity failure;

    -- Convert to dual basis using conversion function
    result := calc_db_symbol(symbol, CCSDS_BASIS_CONV);
    return result;

  end normal_to_db;

  -- Convert a symbol from dual basis to normal for CCSDS spec
  function db_to_normal(symbol : std_logic_vector)
    return std_logic_vector is
    variable result : std_logic_vector(CCSDS_SYMBOL_WIDTH-1 downto 0);
  begin

    -- Check the input symbol has the correct number of bits
    assert symbol'length = CCSDS_SYMBOL_WIDTH
      report "ERROR: rs_decoder_v9_0_12_demo_tb_pkg.db_to_normal: input symbol has width " & integer'image(symbol'length) & " but the only supported symbol width for CCSDS is " & integer'image(CCSDS_SYMBOL_WIDTH)
      severity failure;

    -- Convert to normal using conversion function
    result := calc_db_symbol(symbol, CCSDS_BASIS_CONV_INV);
    return result;

  end db_to_normal;

  -- RS encode a codeblock
  function rs_encode (
    -- Input data codeblock
    data_in        : t_codeblock;
    -- RS encoder top level generics
    c_gen_start    : integer;  -- start index for generator polynomial
    c_h            : integer;  -- scaling factor for generator polynomial root index
    c_k            : integer;  -- number of data symbols in the code block
    c_n            : integer;  -- total number of symbols in the code block
    c_polynomial   : integer;
    c_spec         : integer;
    c_symbol_width : integer;
    -- Variable codeblock parameters
    n_in           : integer := -1;  -- number of data symbols, do not set if c_has_n_in = 0 and c_has_r_in = 0
    r_in           : integer := -1   -- number of check symbols, do not set if c_has_r_in = 0
    ) return t_codeblock is  -- output data codeblock

    -- Constants for n, k, and r
    constant NMK       : integer := c_n - c_k;
    constant NMKM1     : integer := NMK - 1;
    constant N_INT     : integer := cond(n_in = -1, c_n, n_in);
    constant K_INT     : integer := cond(n_in = -1, c_k, cond(r_in = -1, n_in - NMK, n_in - r_in));
    constant R_VAR     : integer := cond(n_in = -1, NMK, cond(r_in = -1, NMK, r_in));
    constant R_VARM1   : integer := R_VAR - 1;

    -- Subtypes and variables for data codeblocks
    subtype t_symbol is std_logic_vector(c_symbol_width-1 downto 0);
    type t_codeblock_in  is array (0 to K_INT-1) of t_symbol;
    type t_codeblock_out is array (0 to N_INT-1) of t_symbol;
    variable data_in_int  : t_codeblock_in;   -- input data in internal format
    variable data_out_int : t_codeblock_out;  -- output data in internal format
    subtype t_codeblock_return is t_codeblock (0 to N_INT-1);  -- for return value, uses t_symbol_max
    variable data_out : t_codeblock_return := (others => (others => '0'));  -- return value

    -- Constants and types for encoding
    constant GFAS   : integer := 2**c_symbol_width;  -- GFAS = galois field array size
    constant GFASM1 : integer := GFAS - 1;
    constant GFASM2 : integer := GFAS - 2;
    constant GFASM3 : integer := GFAS - 3;
    subtype t_alpha_to_array is t_integer_array(0 to GFASM2);
    subtype t_index_of_array is t_integer_array(0 to GFASM1);
    subtype t_gc_array is t_integer_array(0 to R_VARM1);
    type t_parity_buffer_array is array(0 to R_VARM1) of t_symbol; -- was NMKM1 not R_VARM1 CR797902
    constant ALPHA_TO : t_alpha_to_array := gf_calc_elements(c_polynomial, c_symbol_width);
    constant INDEX_OF : t_index_of_array := gf_calc_indices(c_symbol_width, ALPHA_TO);
    constant GC : t_gc_array := calc_gcs(R_VAR, c_gen_start, c_h, c_symbol_width, ALPHA_TO, INDEX_OF);

    -- Variables for encoding
    variable first_symbol : boolean;  -- true when processing first symbol
    variable input_symbol : boolean;  -- true when processing an input data symbol  } mutually
    variable check_symbol : boolean;  -- true when generating a check symbol        } exclusive
    variable parity_buffer_variable : t_parity_buffer_array := (others => (others => '0'));
    variable feedback     : t_symbol := (others => '0');
    variable product      : t_symbol := (others => '0');

  begin

    -- Check the input data array has the correct range (0 to K_INT-1)
    assert data_in'ascending
      report "ERROR: rs_decoder_v9_0_12_demo_tb_pkg.rs_encode: input array data_in has wrong index range direction 'downto', must be 'to'"
      severity failure;
    assert data_in'left = 0 and data_in'right = K_INT-1
      report "ERROR: rs_decoder_v9_0_12_demo_tb_pkg.rs_encode: input array data_in has wrong range (" & integer'image(data_in'left) & " to " & integer'image(data_in'right) & "), must be (0 to " & integer'image(K_INT-1) & ") to match other input arguments"
      severity failure;

    -- Convert input data to correct std_logic_vector width (must be maximum width at port due to VHDL type rules)
    for i in 0 to K_INT-1 loop
      data_in_int(i) := data_in(i)(c_symbol_width-1 downto 0);
    end loop;

    -- For CCSDS spec only, perform dual basis conversion on input data
    if c_spec = CCSDS_SPEC then
      for i in 0 to K_INT-1 loop
        data_in_int(i) := db_to_normal(data_in_int(i));
      end loop;
    end if;

    -- Process K_INT input data symbols to generate N_INT output data symbols
    for symbol_count in 0 to N_INT-1 loop

      -- Some flags indicating progress through the processing loop
      first_symbol := symbol_count = 0;
      input_symbol := symbol_count < K_INT;
      check_symbol := not input_symbol;

      -- Generate output data
      if input_symbol then
        data_out_int(symbol_count) := data_in_int(symbol_count);  -- same as input data
      else
        data_out_int(symbol_count) := parity_buffer_variable(R_VARM1);  -- end of parity buffer before updating it
      end if;

      -- Calculate the feedback for the generator polynomial
      if check_symbol then
        feedback := (others => '0');
      elsif first_symbol then
        feedback := data_in_int(symbol_count); -- no parity buffer for start sample
      else
        feedback := data_in_int(symbol_count) xor parity_buffer_variable(R_VARM1);
      end if;

      -- Update the parity buffer, which stores the terms in the generator polynomial
      -- For each coefficient in the generator polynomial multiply by the feedback
      -- and add to the current polynomial array (parity buffer).
      for i in R_VARM1 downto 0 loop
        -- galois field mult (rs_field_polynomial_parameter * feedback )
        product := gfmul(GC(i), to_integer(unsigned(feedback)), c_symbol_width, ALPHA_TO, INDEX_OF);
        -- galois field adder (current gf_mult output, generator poly eval array)
        if first_symbol or i = 0 then
          parity_buffer_variable(i) := product; -- no feedback for first sample or first stage
        else
          parity_buffer_variable(i) := parity_buffer_variable(i-1) xor product;
        end if;
      end loop;

    end loop;

    -- For CCSDS spec only, perform dual basis conversion on output data
    if c_spec = CCSDS_SPEC then
      for i in 0 to N_INT-1 loop
        data_out_int(i) := normal_to_db(data_out_int(i));
      end loop;
    end if;

    -- Convert output data to maximum std_logic_vector width (must be maximum width at port due to VHDL type rules)
    for i in 0 to N_INT-1 loop
      data_out(i)(c_symbol_width-1 downto 0) := data_out_int(i);
    end loop;

    return data_out;
  end function rs_encode;

end package body rs_decoder_v9_0_12_demo_tb_pkg;

