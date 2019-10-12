-- $RCSfile: c_gate_bit_v12_0_3_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 15:11:21 $
--------------------------------------------------------------------------------

-- (c) Copyright 1995-2005 Xilinx, Inc. All rights reserved.
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
--
-- Filename - c_gate_bit_v12_0_3_comp.vhd
-- Author - Xilinx
-- Creation - 3 Mar 1999
--
-- Description - This file contains the component declaration for
-- the c_gate_bit_v12_0_3 core

library IEEE;
use IEEE.std_logic_1164.all;

package c_gate_bit_v12_0_3_comp is


----- Component c_gate_bit_v12_0_3        -----
-- Short Description
--
-- (A)Synchronous Wide Gate
--

  component c_gate_bit_v12_0_3
    generic(
      C_GATE_TYPE      : integer := 0;  --c_and;
      C_INPUTS         : integer := 2;
      C_INPUT_INV_MASK : string  := "0";
      C_PIPE_STAGES    : integer := 0;
      C_AINIT_VAL      : string  := "0";
      C_SINIT_VAL      : string  := "0";
      C_SYNC_PRIORITY  : integer := 1;  --c_clear;
      C_SYNC_ENABLE    : integer := 0;  --c_override;
      C_HAS_O          : integer := 0;
      C_HAS_Q          : integer := 1;
      C_HAS_CE         : integer := 0;
      C_HAS_ACLR       : integer := 0;
      C_HAS_ASET       : integer := 0;
      C_HAS_AINIT      : integer := 0;
      C_HAS_SCLR       : integer := 0;
      C_HAS_SSET       : integer := 0;
      C_HAS_SINIT      : integer := 0;
      C_FAMILY         : string  := "no_family";
      C_ENABLE_RLOCS   : integer := 0
      );
    port (
      I     : in  std_logic_vector(c_inputs-1 downto 0) := (others => '0');  -- input vector
      CLK   : in  std_logic                             := '0';              -- clock
      CE    : in  std_logic                             := '1';              -- clock enable
      ACLR  : in  std_logic                             := '0';              -- asynch clr.
      ASET  : in  std_logic                             := '0';              -- asynch set.
      AINIT : in  std_logic                             := '0';              -- asynch init.
      SCLR  : in  std_logic                             := '0';              -- synch clr.
      SSET  : in  std_logic                             := '0';              -- synch set.
      SINIT : in  std_logic                             := '0';              -- synch init.
      T     : in  std_logic                             := '0';              -- tri-state input for buft
      EN    : in  std_logic                             := '0';              -- enable input for bufe
      O     : out std_logic                             := '0';              -- asynch output
      Q     : out std_logic                             := '0'               -- registered output value
      );
  end component;

end c_gate_bit_v12_0_3_comp;


-- $RCSfile: c_gate_bit_v12_0_3_viv_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 15:11:21 $
--  (c) Copyright 1995-2005 Xilinx, Inc. All rights reserved.
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


library IEEE;
use IEEE.std_logic_1164.all;

package c_gate_bit_v12_0_3_viv_comp is

----------------------------------------------------------
-- Insert component declaration of top level xst file here
----------------------------------------------------------
  component c_gate_bit_v12_0_3_viv
    generic(
      C_GATE_TYPE      : integer := 0;  --c_and;
      C_INPUTS         : integer := 2;
      C_INPUT_INV_MASK : string  := "0";
      C_PIPE_STAGES    : integer := 0;
      C_AINIT_VAL      : string  := "0";
      C_SINIT_VAL      : string  := "0";
      C_SYNC_PRIORITY  : integer := 1;  --c_clear;
      C_SYNC_ENABLE    : integer := 0;  --c_override;
      C_HAS_O          : integer := 0;
      C_HAS_Q          : integer := 1;
      C_HAS_CE         : integer := 0;
      C_HAS_ACLR       : integer := 0;
      C_HAS_ASET       : integer := 0;
      C_HAS_AINIT      : integer := 0;
      C_HAS_SCLR       : integer := 0;
      C_HAS_SSET       : integer := 0;
      C_HAS_SINIT      : integer := 0;
      C_FAMILY         : string  := "no_family";
      C_ENABLE_RLOCS   : integer := 0
      );

    port (
      I     : in  std_logic_vector(c_inputs-1 downto 0) := (others => '0');  -- input vector
      CLK   : in  std_logic                             := '0';              -- clock
      CE    : in  std_logic                             := '1';              -- clock enable
      ACLR  : in  std_logic                             := '0';              -- asynch clr.
      ASET  : in  std_logic                             := '0';              -- asynch set.
      AINIT : in  std_logic                             := '0';              -- asynch init.
      SCLR  : in  std_logic                             := '0';              -- synch clr.
      SSET  : in  std_logic                             := '0';              -- synch set.
      SINIT : in  std_logic                             := '0';              -- synch init.
      T     : in  std_logic                             := '0';              -- tri-state input for buft
      EN    : in  std_logic                             := '0';              -- enable input for bufe
      O     : out std_logic                             := '0';              -- asynch output
      Q     : out std_logic                             := '0'               -- registered output value
      );

  end component;


end c_gate_bit_v12_0_3_viv_comp;


-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/c_gate_bit_v12_0_3/hdl/pkg_gate_bit_v12_0.vhd,v 1.3 2009/09/08 15:11:21 akennedy Exp $

--  (c) Copyright 1995-2005 Xilinx, Inc. All rights reserved.
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
---------------------------------------------------------------
--
-- package for constants, functions and utils specific to the gate_bit baseblock
--
---------------------------------------------------------------

LIBRARY std, ieee;
USE std.standard.ALL;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

PACKAGE pkg_gate_bit_v12_0 IS

  CONSTANT max_width : INTEGER := 256;  -- for the baseblock.
  CONSTANT max_tiers : INTEGER := 4;    -- maximum possible number of tiers of logic
  CONSTANT max_tiles : INTEGER := 256;   -- maximum possible number of tiles per tier

  TYPE T_GATE_FUNC IS (T_AND,
                       T_NAND,
                       T_OR,
                       T_NOR,
                       T_XOR,
                       T_XNOR);

  TYPE T_GATE_IMPL IS (T_LUT,          -- use only LUTS
                       T_CARRY,        -- use LUTS and carry chain primitives
                       T_DIRECT_CONN); -- just wire input to output

  TYPE T_GATE_TIER_WIDTH IS ARRAY (0 TO max_tiers) OF INTEGER;
  TYPE T_GATE_TIER_FUNC  IS ARRAY (0 TO max_tiers) OF T_GATE_FUNC;
  TYPE T_GATE_TIER_IMPL  IS ARRAY (0 TO max_tiers) OF T_GATE_IMPL;
  TYPE T_GATE_TIER_REG   IS ARRAY (0 TO max_tiers) OF boolean;
  TYPE T_GATE_TIER_SPEC IS RECORD
                        no_tiers : integer;
                        tier_ip_width : T_GATE_TIER_WIDTH;
                        tier_funcs    : T_GATE_TIER_FUNC;
                        tier_impl     : T_GATE_TIER_IMPL;
                        tier_reg      : T_GATE_TIER_REG;
                      END RECORD;

  TYPE T_GATE_TILE_WIDTH IS ARRAY (0 TO max_tiles-1) OF INTEGER;
  TYPE T_GATE_TILE_INDEX_IN IS ARRAY (0 TO max_tiles-1) OF INTEGER;
  TYPE T_GATE_TILE_INDEX_OUT IS ARRAY (0 TO max_tiles-1) OF INTEGER;
  TYPE T_GATE_TILE_IMPL IS ARRAY (0 TO max_tiles-1) OF T_GATE_IMPL;
  TYPE T_CON_TIER IS ARRAY(1 TO max_tiers+1) OF std_logic_vector(max_width -1 DOWNTO 0);

  TYPE T_GATE_TILE_SPEC IS RECORD
                        num_tiles      : integer;
                        tile_ip_width  : T_GATE_TILE_WIDTH;
                        tile_index_in  : T_GATE_TILE_INDEX_IN;
                        tile_index_out : T_GATE_TILE_INDEX_OUT;
                        tile_impl      : T_GATE_TILE_IMPL;
                      END RECORD;

  TYPE T_REG_CTRLS IS RECORD
                        has_aclr : integer;
                        has_aset : integer;
                        has_ainit: integer;
                        has_sclr : integer;
                        has_sset : integer;
                        has_sinit: integer;
                        ainit_val : STRING(1 TO 1);
                        sinit_val : STRING(1 TO 1);
                        sync_priority : integer;
                      END RECORD;

  FUNCTION fn_min(a,b : integer) RETURN integer;

  FUNCTION fn_select_gate_func(in_func : INTEGER) RETURN T_GATE_FUNC;

  FUNCTION fn_pipe_has_async (has_sclr : integer;
                              has_sset : integer;
                              has_sinit : integer
                              ) RETURN boolean;

  FUNCTION fn_inverting_func (gate_func : T_GATE_FUNC) RETURN boolean;

  FUNCTION fn_pipe_ctrls(p_has_aclr, p_has_aset, p_has_ainit : INTEGER;
                         p_has_sclr, p_has_sset, p_has_sinit : INTEGER;
                         p_sync_priority                     : INTEGER;
                         p_gate_func                         : T_GATE_FUNC;
                         p_ainit_val, p_sinit_val            : STRING
                         ) RETURN T_REG_CTRLS;

  FUNCTION fn_xor_pipe_ctrls(p_has_aclr, p_has_aset, p_has_ainit : INTEGER;
                         p_has_sclr, p_has_sset, p_has_sinit : INTEGER;
                         p_sync_priority                     : INTEGER;
                         p_gate_func                         : T_GATE_FUNC;
                         p_ainit_val, p_sinit_val            : STRING
                         ) RETURN T_REG_CTRLS;

  FUNCTION fn_opt_gate_tier_spec(family          : T_DEVICE_FAMILY;
                                 width           : INTEGER;
                                 func            : T_GATE_FUNC;
                                 pipe_stages     : INTEGER;
                                 sync_controls   : INTEGER
                                 ) RETURN T_GATE_TIER_SPEC;

  FUNCTION fn_opt_gate_tile_spec (width_in  : integer;
                                  width_out : integer;
                                  impl      : T_GATE_IMPL;
                                  func      : T_GATE_FUNC;
                                  family    : T_DEVICE_FAMILY
                                  ) RETURN T_GATE_TILE_SPEC;
  FUNCTION fn_stretch_string (
    p_char : STRING;
    p_len  : INTEGER)
    RETURN STRING;


  COMPONENT c_gate_bit_tier IS
    GENERIC(
      c_width_in  : INTEGER     := 8;
      c_width_out : INTEGER     := 1;
      ci_func     : T_GATE_FUNC := T_XOR;
      ci_impl     : T_GATE_IMPL := T_CARRY;
      ci_family   : T_DEVICE_FAMILY := VIRTEX7
      );
    PORT (
      i : IN  STD_LOGIC_VECTOR(c_width_in-1 DOWNTO 0);
      o : OUT STD_LOGIC_VECTOR(c_width_out-1 DOWNTO 0)
      );
  END COMPONENT;

  COMPONENT c_gate_bit_tile IS
    GENERIC(
      c_width_in  : INTEGER     := 8;
      ci_func     : T_GATE_FUNC := T_XOR;
      ci_impl     : T_GATE_IMPL := T_CARRY;
      ci_family   : T_DEVICE_FAMILY := VIRTEX7
      );
    PORT (
      i : IN  STD_LOGIC_VECTOR(c_width_in-1 DOWNTO 0);
      o : OUT STD_LOGIC
      );
  END COMPONENT;

  COMPONENT c_gate_bit_xor_mux IS
    PORT (
      ci : IN STD_LOGIC;
      di : IN STD_LOGIC;
      s  : IN STD_LOGIC;
      o  : OUT STD_LOGIC
      );
  END COMPONENT;

END pkg_gate_bit_v12_0;

PACKAGE BODY pkg_gate_bit_v12_0 IS

  FUNCTION fn_min(a,b: INTEGER) RETURN INTEGER is
  BEGIN
    IF a < b THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END;

  FUNCTION fn_pipe_has_async ( has_sclr : integer;
                               has_sset : integer;
                               has_sinit : integer
                               ) RETURN boolean is
  BEGIN
    IF has_sclr /=0 OR has_sset /=0 OR has_sinit /=0 then
      RETURN false;
    ELSE
      RETURN true;
    END if;
  END ;

  FUNCTION fn_inverting_func (gate_func : T_GATE_FUNC) RETURN boolean is
  BEGIN
    IF (gate_func = T_NAND) OR (gate_func = T_NOR) OR (gate_func = T_XNOR) THEN
      RETURN true;
    else
      RETURN false;
    END IF;
  END fn_inverting_func;


  -- purpose: converts legacy integer to enumerated type
  FUNCTION fn_select_gate_func(in_func : INTEGER) RETURN T_GATE_FUNC IS
  BEGIN  -- fn_select_gate_type(
    CASE in_func IS
      WHEN 0 =>
        RETURN T_AND;
      WHEN 1 =>
        RETURN T_NAND;
      WHEN 2 =>
        RETURN T_OR;
      WHEN 3 =>
        RETURN T_NOR;
      WHEN 4 =>
        RETURN T_XOR;
      WHEN 5 =>
        RETURN T_XNOR;
      WHEN 6 =>
        ASSERT FALSE REPORT "Inverter gates are not supported by bit_gate" SEVERITY FAILURE;
      WHEN 7 =>
        ASSERT FALSE REPORT "Buffer gates are not supported by bit_gate" SEVERITY FAILURE;
      WHEN OTHERS =>
        ASSERT FALSE REPORT "Unknown gate type" SEVERITY FAILURE;
    END CASE;
    RETURN T_AND;  --impossible to reach this, but it removes a warning in sim.
  END fn_select_gate_func;

  --The convention for pipeline registers is that they are not allowed to be
  --configured such that they have extra logic to implement register controls in
  --series with the data input. The circumstances which lead to this are when
  --there are both asynchronous and synchronous controls. To prevent the
  --additional logic, this case is trapped and async controls are prevented from
  --reaching the pipeline registers.
  --However, the story doesn't stop there. For inverting functions (NAND, NOR,
  --XNOR) only the last tier of logic has the inversion. This means that a reset
  --on the output register is logically equivalent to a set on the pipeline
  --registers, hence the presence of an inverting function is trapped and used to
  --reverse the polarity of set/reset for the pipeline registers (including
  --sync_priority)
  --The p_prefix is convention for parameter
  FUNCTION fn_pipe_ctrls(p_has_aclr, p_has_aset, p_has_ainit : INTEGER;
                         p_has_sclr, p_has_sset, p_has_sinit : INTEGER;
                         p_sync_priority                     : INTEGER;
                         p_gate_func                         : T_GATE_FUNC;
                         p_ainit_val, p_sinit_val            : STRING
                         ) RETURN T_REG_CTRLS IS
    VARIABLE ret_val : T_REG_CTRLS;
  BEGIN
    ret_val.has_aclr  := 0;
    ret_val.has_aset  := 0;
    ret_val.has_ainit := 0;
    ret_val.has_sclr  := 0;
    ret_val.has_sset  := 0;
    ret_val.has_sinit := 0;
    ret_val.ainit_val := p_ainit_val;
    ret_val.sinit_val := p_sinit_val;
    --consider ainit_val and sinit_val for Power-on conditions
    if fn_inverting_func(p_gate_func) THEN
      if p_ainit_val = "0" then
        ret_val.ainit_val := "1";
      else
        ret_val.ainit_val := "0";
      END if;
      if p_sinit_val = "0" then
        ret_val.sinit_val := "1";
      else
        ret_val.sinit_val := "0";
      END if;
    END if;
    IF fn_pipe_has_async(p_has_sclr, p_has_sset, p_has_sinit) THEN
      IF fn_inverting_func(p_gate_func) THEN
        IF p_has_aclr /= 0 OR (p_has_ainit /= 0 AND p_ainit_val = "0") THEN
          ret_val.has_aset := 1;
        END IF;
        IF p_has_aset /= 0 OR (p_has_ainit /= 0 AND p_ainit_val = "1") THEN
          ret_val.has_aclr := 1;
        END IF;
      ELSE
        IF p_has_aclr /= 0 OR (p_has_ainit /= 0 AND p_ainit_val = "0") THEN
          ret_val.has_aclr := 1;
        END IF;
        IF p_has_aset /= 0 OR (p_has_ainit /= 0 AND p_ainit_val = "1") THEN
          ret_val.has_aset := 1;
        END IF;
      END IF;
    ELSE
      --when sync controls are present, async controls are barred.
      ret_val.has_aclr := 0;
      ret_val.has_aset := 0;
    END IF;
    IF fn_inverting_func(p_gate_func) THEN
      ret_val.sync_priority := 1- p_sync_priority;
      IF p_has_sclr /= 0 OR (p_has_sinit /= 0 AND p_sinit_val = "0") THEN
        ret_val.has_sset := 1;
      END IF;
      IF p_has_sset /= 0 OR (p_has_sinit /= 0 AND p_sinit_val = "1") THEN
        ret_val.has_sclr := 1;
      END IF;
    ELSE
      ret_val.sync_priority := p_sync_priority;
      IF p_has_sclr /= 0 OR (p_has_sinit /= 0 AND p_sinit_val = "0") THEN
        ret_val.has_sclr := 1;
      END IF;
      IF p_has_sset /= 0 OR (p_has_sinit /= 0 AND p_sinit_val = "1") THEN
        ret_val.has_sset := 1;
      END IF;
    END IF;
    RETURN ret_val;
  END fn_pipe_ctrls;

  FUNCTION fn_xor_pipe_ctrls(p_has_aclr, p_has_aset, p_has_ainit : INTEGER;
                         p_has_sclr, p_has_sset, p_has_sinit : INTEGER;
                         p_sync_priority                     : INTEGER;
                         p_gate_func                         : T_GATE_FUNC;
                         p_ainit_val, p_sinit_val            : STRING
                         ) RETURN T_REG_CTRLS IS
    VARIABLE ret_val : T_REG_CTRLS;
  BEGIN
    ret_val.sync_priority := 0;
    ret_val.has_aset  := 0;
    ret_val.has_ainit := 0;
    ret_val.has_sset  := 0;
    ret_val.has_sinit := 0;

    ret_val.has_aclr := 0;              --unless
    IF fn_pipe_has_async(p_has_sclr, p_has_sset, p_has_sinit) THEN
      if p_has_aclr /= 0 OR p_has_aset /= 0 OR p_has_ainit /= 0 THEN
        ret_val.has_aclr := 1;
      END IF;
    END IF;

    ret_val.has_sclr := 0;              --unless...
    if p_has_sclr /= 0 OR p_has_sset /= 0 OR p_has_sinit /= 0 THEN
      ret_val.has_sclr := 1;
    END IF;
    RETURN ret_val;
  END;

  --Take a deep breath. This function is complicated.
  --This function determines the optimal structure of the gate tiers of logic
  --from the generics provided (family, input bit width, function to implement,
  --pipeline stages, number of synchronous controls.
  --
  --When pipelining is required, speed is the essence, so LUTs are preferred.
  --When there is no pipelining, area is optimised.
  --
  --If an output register is used, any spare inputs to sync logic LUT
  --are hijacked as the first layer of logic.
  --
  --For pipelining, if LUTs alone give the capacity required (fan-in tree)
  --the number of tiers of pipelining required is adequate, then that's the architecture.
  --Failing that, layers from layer 2 (in the presence of series sync logic) or
  --layer 1(with no such logic) are made into carry16 (an intermediate
  --implementation of carry chain logic) and the capacity of the structure calced.
  --Each later is so converted and the capacity calced. If further capacity is
  --required, layers are converted to full carry (up to 64 i/p).
  --However, once the capacity has been achieved
  FUNCTION fn_opt_gate_tier_spec(
    family        : T_DEVICE_FAMILY;
    width         : INTEGER;
    func          : T_GATE_FUNC;
    pipe_stages   : INTEGER;
    sync_controls : INTEGER
    )
    RETURN T_GATE_TIER_SPEC IS
    CONSTANT i_per_lut : INTEGER := fn_get_lut_size(family);
    --seed is the number of inputs the final logic level can handle. This determines
    --the width of subsequent levels.
    VARIABLE seed      : INTEGER;
    VARIABLE ret_val   : T_GATE_TIER_SPEC;
    VARIABLE rect_func : T_GATE_FUNC;  --'rectified' function NAND,AND -> AND, etc.
  BEGIN
    CASE func IS
      WHEN T_AND | T_NAND => rect_func := T_AND;
      WHEN T_OR | T_NOR   => rect_func := T_OR;
      WHEN T_XOR | T_XNOR => rect_func := T_XOR;
      WHEN OTHERS         => NULL;
    END CASE;
    ret_val.tier_funcs(1) := func;
    ret_val.tier_funcs(2) := rect_func;
    ret_val.tier_funcs(3) := rect_func;
    ret_val.tier_funcs(4) := rect_func;

    --as default, set pipeline regs off.
--    ret_val.tier_reg(0) := false;
    ret_val.tier_reg(1) := FALSE;  --this tier has the output reg, not pipereg
    ret_val.tier_reg(2) := FALSE;
    ret_val.tier_reg(3) := FALSE;
    ret_val.tier_reg(4) := FALSE;

    ret_val.tier_ip_width(0) := 1;
    ret_val.tier_ip_width(1) := 1;
    ret_val.tier_ip_width(2) := 1;
    ret_val.tier_ip_width(3) := 1;
    ret_val.tier_ip_width(4) := 1;

    --as default, set no_tiers to daft value. Finding this in the return value
    --will show that the case wasn't found.
    ret_val.no_tiers := 0;

    seed := i_per_lut - sync_controls;

    CASE pipe_stages IS
      WHEN 0 =>                         --pipe_stages = 0
        CASE sync_controls IS
          WHEN 0 =>                     --sync_controls = 0
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 0, sync = 0, func = XORish
                --This used to use the carry logic, but it's too slow.
                IF (width <= i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := width;
                  ret_val.no_tiers         := 1;
                  RETURN ret_val;
                ELSIF (width <= 2 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := width;
                  ret_val.no_tiers         := 1;
                  RETURN ret_val;
                ELSIF (width <= i_per_lut * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := i_per_lut;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF (width <= i_per_lut *2 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := i_per_lut;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF (width <= 2 * i_per_lut * 2 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := 2 * i_per_lut;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF (width <= i_per_lut * i_per_lut * 2* i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := i_per_lut;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := i_per_lut * i_per_lut;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF (width <= i_per_lut * 2* i_per_lut * 2 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := i_per_lut;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := i_per_lut * 2 * i_per_lut;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSE
                  --width must be >256
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 0, sync = 0, func = ANDish
                IF (width <= i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := width;
                  ret_val.no_tiers         := 1;
                  RETURN ret_val;
                ELSIF (width <= 16 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := width;
                  ret_val.no_tiers         := 1;
                  RETURN ret_val;
                ELSIF (width <= 64 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := i_per_lut;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSE
                  --width must be >256
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;  --func
          WHEN 1 | 2 =>
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 0, sync >= 1, func = XORish
                IF (width <= seed) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := width;
                  ret_val.no_tiers         := 1;
                  RETURN ret_val;
                ELSIF (width <= seed * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF (width <= seed * 2* i_per_lut ) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF (width <= seed * i_per_lut * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF (width <= seed * i_per_lut * 2*i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF (width <= seed * 2*i_per_lut * 2*i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * 2* i_per_lut;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF (width <= seed * i_per_lut * i_per_lut * 2* i_per_lut ) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed *i_per_lut;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := seed*i_per_lut*i_per_lut;
                  ret_val.tier_impl(4)     := T_CARRY;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width must be >256
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 0, sync >= 1, func = ANDish
                IF (width <= seed) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := width;
                  ret_val.no_tiers         := 1;
                  RETURN ret_val;
                ELSIF (width <= seed * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF (width <= seed * 128 * i_per_lut) THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSE
                  --width must be >256
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;  --func
          WHEN OTHERS =>
            ASSERT FALSE
              REPORT "Impossible number of sync controls found in fn_opt_gate_tier_spec"
              SEVERITY FAILURE;
        END CASE;  --sync_controls

        -------------------------------------------------------------------------
          -- optimise for speed if there is pipelining
          -------------------------------------------------------------------------
          WHEN 1 =>                     --pipeline_stage
        CASE sync_controls IS
          WHEN 0 =>
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 1, sync = 0, func = XORish
                ASSERT width >= i_per_lut
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * 2 * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := i_per_lut * 2;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * 2 * i_per_lut *2 THEN
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := i_per_lut * 2;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * i_per_lut *2 * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * i_per_lut *2 * i_per_lut * 2 THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 1, sync = 0, func = ANDish
                ASSERT width >= i_per_lut
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := i_per_lut;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * i_per_lut *4 THEN
                  --min 64
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := i_per_lut *2;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= i_per_lut * i_per_lut *4 *4 THEN
                  --min 64
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := i_per_lut *2*2;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;
          WHEN 1 | 2 =>
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 1, sync >= 1, func = XORish
                ASSERT width >= seed
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= seed * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut THEN
                  --min 32
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut * 2 THEN
                  --min 64
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut * 2 THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut * i_per_lut THEN
                  --min 256
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := seed * i_per_lut * 2 * i_per_lut;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 1, sync >= 1, func = ANDish
                ASSERT width >= seed
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= seed * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 4 THEN
                  --min 32
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := width;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.no_tiers         := 2;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut THEN
                  --min 32
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut * 4 THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut * 4 THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;  --func
          WHEN OTHERS =>
            NULL;
        END CASE;  --sync controls
      WHEN 2 =>                         --pipeline_stage
        CASE sync_controls IS
          WHEN 0 =>
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 2, sync = 0, func = XORish
                ASSERT width >= seed * i_per_lut
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= seed * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed * i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut THEN
                  --min 64
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut * i_per_lut THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := seed * i_per_lut * i_per_lut;
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut * 2 * i_per_lut THEN
                  --min 256
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := seed * i_per_lut * i_per_lut * 2;
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 2, sync = 0, func = ANDish
                ASSERT width >= seed * i_per_lut
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= seed * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed * i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * 2 * i_per_lut * i_per_lut THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := seed * 2;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * 2 * i_per_lut;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * 2 * i_per_lut * 2 * i_per_lut THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_CARRY;
                  ret_val.tier_ip_width(1) := seed * 2;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * 2 * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;
          WHEN 1 | 2 =>
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 2, sync >= 1, func = XORish
                ASSERT width >= seed * i_per_lut
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= seed * i_per_lut * i_per_lut THEN
                  --min 32
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed * i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2* i_per_lut THEN
                  --min 64
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2* i_per_lut * 2 THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * i_per_lut * 2 * i_per_lut THEN
                  --min 128
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := seed * i_per_lut;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := seed * i_per_lut * i_per_lut * 2;
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 2, sync >= 1, func = ANDish
                ASSERT width >= seed * i_per_lut
                  REPORT "Input width does not require this level of pipelining"
                  SEVERITY WARNING;
                IF width <= seed * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed * i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut * 2 THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 4 * i_per_lut * 2 THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed * i_per_lut * 4;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_CARRY;
                  ret_val.tier_ip_width(3) := width;
                  ret_val.no_tiers         := 3;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;  --func
          WHEN OTHERS =>
            NULL;
        END CASE;  --sync controls
      WHEN 3 =>                         --pipeline stages
        ASSERT width >= seed * i_per_lut * i_per_lut
          REPORT "Input width does not require this level of pipelining"
          SEVERITY WARNING;
        CASE sync_controls IS
          WHEN 0 =>                     --sync_controls = 0
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 3, sync = 0, func = XORish
                IF width <= seed * i_per_lut * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed* i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := fn_min(seed * i_per_lut * i_per_lut, width);
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 3, sync = 0, func = ANDish
                IF width <= seed * i_per_lut * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed* i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := fn_min(seed * i_per_lut * i_per_lut, width);
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;  --func
          WHEN 1 | 2 =>                 --sync_controls = 1,2
            CASE func IS
              WHEN T_XOR | T_XNOR =>
                --pipe = 3, sync >= 1, func = XORish
                IF width <= seed * i_per_lut * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed* i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := fn_min(seed * i_per_lut * i_per_lut, width);
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed* i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := seed * i_per_lut * 2 * i_per_lut;
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;


              WHEN T_AND | T_NAND | T_OR | T_NOR =>
                --pipe = 3, sync >= 1, func = ANDish
                IF width <= seed * i_per_lut * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := fn_min(seed, width);
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_LUT;
                  ret_val.tier_ip_width(2) := fn_min(seed* i_per_lut, width);
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := fn_min(seed * i_per_lut * i_per_lut, width);
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSIF width <= seed * i_per_lut * 2 * i_per_lut * i_per_lut THEN
                  ret_val.tier_impl(1)     := T_LUT;
                  ret_val.tier_ip_width(1) := seed;
                  ret_val.tier_reg(2)      := TRUE;
                  ret_val.tier_impl(2)     := T_CARRY;
                  ret_val.tier_ip_width(2) := seed* i_per_lut * 2;
                  ret_val.tier_reg(3)      := TRUE;
                  ret_val.tier_impl(3)     := T_LUT;
                  ret_val.tier_ip_width(3) := seed * i_per_lut * 2 * i_per_lut;
                  ret_val.tier_reg(4)      := TRUE;
                  ret_val.tier_impl(4)     := T_LUT;
                  ret_val.tier_ip_width(4) := width;
                  ret_val.no_tiers         := 4;
                  RETURN ret_val;
                ELSE
                  --width too big
                  ASSERT FALSE
                    REPORT "impossible width detected in fn_opt_gate_tier_spec"
                    SEVERITY FAILURE;
                END IF;
              WHEN OTHERS =>
                ASSERT FALSE
                  REPORT "unknown function type encountered in fn_opt_gate_tier_spec"
                  SEVERITY FAILURE;
            END CASE;  --func
          WHEN OTHERS =>
            ASSERT FALSE
              REPORT "Impossible number of sync controls found in fn_opt_gate_tier_spec"
              SEVERITY FAILURE;
        END CASE;
      WHEN OTHERS =>
        ASSERT FALSE
          REPORT "Three levels of pipelining is sufficient for a LUT only tree 256 bits wide"
          SEVERITY FAILURE;
        NULL;
    END CASE;  --pipeline stages

    RETURN ret_val;
  END FUNCTION fn_opt_gate_tier_spec;

    -- purpose: decomposes tier into tiles spread for max speed with optimal resource use
  FUNCTION fn_opt_gate_tile_spec (width_in  : integer;
                                  width_out : integer;
                                  impl      : T_GATE_IMPL;
                                  func      : T_GATE_FUNC;
                                  family    : T_DEVICE_FAMILY
                                  ) RETURN T_GATE_TILE_SPEC IS

    CONSTANT i_per_lut : INTEGER := fn_get_lut_size(family);
    CONSTANT XOR_tile_size : INTEGER := 2 * i_per_lut;
    VARIABLE ret_val         : T_GATE_TILE_SPEC;
    VARIABLE AND_tile_size   : INTEGER;
    VARIABLE tile_size       : INTEGER;
    VARIABLE index_in        : INTEGER := 0;
    VARIABLE index_out       : INTEGER := 0;

  BEGIN
    --The tile size calculation is quite different for the XOR case (fixed size
    --carry chain tiles and the AND,OR cases where the tile size is dynamic)
    ret_val.num_tiles := 0;               -- a nonsense default

    --some defensive programming first
    ASSERT width_in >= width_out
      REPORT "c_gate_bit: impossible tier spec given to fn_opt_gate_tile_spec"
      SEVERITY failure;

    --Now for the guts
    CASE func IS
      WHEN T_AND | T_NAND | T_OR | T_NOR =>
        --the equation below tries to accommodate the fan in (width_in - width_out)/width_out
        --to the optimal size of carry chain tiles. In this case optimal means
        --rounding UP to the next fully utilised LUT, since this leaves a small runt,
        --whereas if the remainders were allowed to accumulate, the runt could be
        --bigger than the result given by rounding up, hence slower.
        --So, first the amount to fan in factor is calculated, then rounded up
        --to the nearest full LUT. Complications include the fact that 'nice
        --round numbers' give the wrong answer (64/8 = 8 (then add 1 to round up...oops))
        --since I dont need to round up when there's no remainder.
        AND_tile_size := ((((((width_in-1)-width_out)/width_out) +1)/i_per_lut) +1)*i_per_lut;
        tile_size := AND_tile_size;

      WHEN T_XOR | T_XNOR =>
        tile_size := XOR_tile_size;
      WHEN OTHERS =>
        ASSERT false
          REPORT "c_gate_bit: Invalid function type detected in fn_opt_gate_tile_spec"
          SEVERITY error;
    END case;

    --first, use carry chain tiles to mop up the bulk of the fan-in if allowed.
    if impl = T_CARRY then
      WHILE (width_in- index_in) - (width_out-index_out) >= tile_size-1  LOOP
        ret_val.tile_ip_width(ret_val.num_tiles) := tile_size;
        ret_val.tile_impl(ret_val.num_tiles)     := T_CARRY;
        ret_val.tile_index_in(ret_val.num_tiles) := index_in;
        ret_val.tile_index_out(ret_val.num_tiles):= index_out;
        ret_val.num_tiles                        := ret_val.num_tiles +1;
        index_in                                 := index_in + tile_size;
        index_out                                := index_out + 1;
      END LOOP;
      if (width_in- index_in) - (width_out-index_out) > 1 then
        ret_val.tile_ip_width(ret_val.num_tiles) := (width_in- index_in)-(width_out-index_out) +1;
        ret_val.tile_impl(ret_val.num_tiles)     := T_CARRY;
        ret_val.tile_index_in(ret_val.num_tiles) := index_in;
        ret_val.tile_index_out(ret_val.num_tiles):= index_out;
        ret_val.num_tiles                        := ret_val.num_tiles +1;
        index_in                                 := index_in + (width_in- index_in)-(width_out-index_out)+1;
        index_out                                := index_out + 1;
      END if;
    END if;

    --second, loop to mop up the remaining fan-in with fully utilised LUTs
    WHILE (width_in - index_in) - (width_out - index_out) >= i_per_lut -1 LOOP
      ret_val.tile_ip_width(ret_val.num_tiles) := i_per_lut;
      ret_val.tile_impl(ret_val.num_tiles)     := T_LUT;
      ret_val.tile_index_in(ret_val.num_tiles) := index_in;
      ret_val.tile_index_out(ret_val.num_tiles):= index_out;
      ret_val.num_tiles                        := ret_val.num_tiles +1;
      index_in                                 := index_in + i_per_lut;
      index_out                                := index_out + 1;
    END LOOP;

    --third, try to mop up the remaining fan in with the best utilised LUT possible
    FOR i IN i_per_lut -1 DOWNTO 2 LOOP
      WHILE (width_in - index_in) - (width_out - index_out) >= i -1 LOOP
        ret_val.tile_ip_width(ret_val.num_tiles) := i;
        ret_val.tile_impl(ret_val.num_tiles)     := T_LUT;
        ret_val.tile_index_in(ret_val.num_tiles) := index_in;
        ret_val.tile_index_out(ret_val.num_tiles):= index_out;
        ret_val.num_tiles                        := ret_val.num_tiles +1;
        index_in                                 := index_in + i;
        index_out                                := index_out + 1;
      END LOOP;
    END LOOP;

    --what's left should be just a direct connection
    ASSERT (width_in - index_in) = (width_out - index_out)
      REPORT "c_gate_bit: algorithm failure in fn_opt_gate_tile_spec - runt direct conns dont match"
      SEVERITY error;

    for i IN index_in TO width_in - 1 loop
      ret_val.tile_ip_width(ret_val.num_tiles) := 1;
      ret_val.tile_impl(ret_val.num_tiles)     := T_DIRECT_CONN;
      ret_val.tile_index_in(ret_val.num_tiles) := i;
      ret_val.tile_index_out(ret_val.num_tiles):= index_out;
      ret_val.num_tiles                        := ret_val.num_tiles +1;
      index_out                                := index_out + 1;
    END loop;
    ASSERT ret_val.num_tiles > 0
      REPORT "num tiles = "& INTEGER'IMAGE(ret_val.num_tiles)
      SEVERITY FAILURE;
--    ASSERT false REPORT "no tiles" & INTEGER'IMAGE(ret_val.num_tiles) SEVERITY NOTE;
    RETURN ret_val;
  END fn_opt_gate_tile_spec;

  FUNCTION fn_stretch_string(
    p_char : STRING;
    p_len  : INTEGER)
    RETURN STRING IS
    VARIABLE ret_val  : STRING(1 TO p_len);
  BEGIN
    for i IN 1 TO p_len loop
      ret_val(i) := p_char(1);
    END loop;
    RETURN ret_val;
  END fn_stretch_string;

END pkg_gate_bit_v12_0;


-- $Header: 
--  (c) Copyright 1995-2005 Xilinx, Inc. All rights reserved.
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
---------------------------------------------------------------
-- Author: Gordon Old
--
-- c_gate_bit_v8_tile.vhd
-- 
-- This entity implements a single tile of what may be a multi-tiled tier as part
-- of a multi-tiered wide input gate
-- The input width (bits), function(AND, OR, etc) and implementation style
-- (LUTs only or using the carry-chain primitives) determine the 
-- This entity becomes the building block for the higher level entity which determines
-- the width of each tier and it's implementation style appropriate to the situation.
---------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;  --for poor man's enumerated types

LIBRARY c_gate_bit_v12_0_3;
USE c_gate_bit_v12_0_3.pkg_gate_bit_v12_0.ALL;

ENTITY c_gate_bit_tile IS
  GENERIC(
    c_width_in  : INTEGER;
    ci_func     : T_GATE_FUNC;
    ci_impl     : T_GATE_IMPL;
    ci_family   : T_DEVICE_FAMILY
    );
  PORT (
    i : IN  STD_LOGIC_VECTOR(c_width_in-1 DOWNTO 0);
    o : OUT STD_LOGIC  
    );
END c_gate_bit_tile;

ARCHITECTURE synth OF c_gate_bit_tile IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  -- purpose: sets const input for carry chain MUXCYs
  FUNCTION fn_carry_const (
    CONSTANT func : T_GATE_FUNC)
    RETURN STD_LOGIC IS
  BEGIN  -- fn_carry_const
    CASE func IS
      WHEN T_AND  | T_NOR  => RETURN '0';
      WHEN T_NAND | T_OR   => RETURN '1';
      WHEN T_XOR  | T_XNOR => RETURN '0';
      WHEN OTHERS =>
        ASSERT false
          REPORT "c_gate_bit_tile fn_carry_const: found invalid c_gate_func"
          SEVERITY error;
        RETURN '0';
    END CASE;
  END fn_carry_const;

  FUNCTION fn_use_muxcy_chain (
    CONSTANT impl : T_GATE_IMPL;
    CONSTANT func : T_GATE_FUNC)
    RETURN boolean IS
  BEGIN  -- fn_use_muxcy_chain
    if impl = T_CARRY then
      CASE func IS
        WHEN T_AND  | T_NOR | T_NAND | T_OR =>
          RETURN true;
        WHEN T_XOR | T_XNOR =>
          RETURN false;
        WHEN OTHERS =>
          ASSERT false REPORT "Invalid function type passed to fn_use_muxcy_chain" SEVERITY FAILURE;
          RETURN false;
      END CASE;
    ELSE
      RETURN false;
    END if;
  END fn_use_muxcy_chain;

  FUNCTION fn_use_xor_chain (
    CONSTANT impl : T_GATE_IMPL;
    CONSTANT func : T_GATE_FUNC)
    RETURN boolean IS
  BEGIN  -- fn_use_xor_chain
    if impl = T_CARRY then
      CASE func IS
        WHEN T_AND  | T_NOR | T_NAND | T_OR =>
          RETURN false;
        WHEN T_XOR | T_XNOR =>
          RETURN true;
        WHEN OTHERS =>
          ASSERT false REPORT "Invalid function type passed to fn_use_xor_chain" SEVERITY FAILURE;
          RETURN false;
      END CASE;
    ELSE
      RETURN false;
    END if;
  END fn_use_xor_chain;

  CONSTANT i_per_lut : INTEGER := fn_get_lut_size(ci_family);
  CONSTANT carry_const_ip : STD_LOGIC := fn_carry_const(ci_func);
  CONSTANT num_lut_reqd : integer := (c_width_in-1)/i_per_lut +1;

  SIGNAL lut_o, xor_carry, async_o : STD_LOGIC_VECTOR(c_width_in -1 DOWNTO 0) := (others => '0');
  SIGNAL lut_inv_o : std_logic_vector(c_width_in-1 DOWNTO 0);

BEGIN
  -----------------------------------------------------------------------------
  -- Carry Tile
  -----------------------------------------------------------------------------
  opt_carry_tile: IF ci_impl = T_CARRY GENERATE
    
    --Cater for the fully utilised LUTs in the carry chain first
    lutloop : FOR lut_num IN 0 TO num_lut_reqd-2 GENERATE
      --process sensitive to inputs on this LUT alone.
      PROCESS(i((lut_num+1) * i_per_lut -1 DOWNTO lut_num * i_per_lut))
        VARIABLE temp : std_logic;
      BEGIN
        temp := i(lut_num * i_per_lut);
        i_in_lut : FOR lut_ip_num IN 1 TO i_per_lut -1 LOOP
          CASE ci_func IS
            WHEN T_AND | T_NAND =>
              temp := temp AND i(lut_num * i_per_lut + lut_ip_num);
            WHEN T_OR | T_NOR =>
              temp := temp OR i(lut_num * i_per_lut + lut_ip_num);
            WHEN T_XOR | T_XNOR =>
              temp := temp XOR i(lut_num * i_per_lut + lut_ip_num);
            WHEN OTHERS => NULL;
          END CASE;
        END LOOP i_in_lut;

        --carry chain logic is a bit wierd. OR and NOR require inversion.
        CASE ci_func IS
          WHEN T_OR | T_NOR =>
            lut_o(lut_num) <= NOT temp;  --mux logic required NOR for OR,NOR
          WHEN T_AND | T_NAND | T_XOR | T_XNOR =>
            lut_o(lut_num) <= temp;
          WHEN OTHERS => NULL;
        END CASE;
      END PROCESS;
    END GENERATE lutloop;

    --The final 'runt' LUT
    process(i(c_width_in-1 DOWNTO (num_lut_reqd-1) * i_per_lut))
      VARIABLE temp : std_logic;
    begin
      temp := i((num_lut_reqd-1) * i_per_lut);
      FOR ip IN (num_lut_reqd-1) * i_per_lut +1 TO c_width_in -1 LOOP
        CASE ci_func IS
          WHEN T_AND | T_NAND =>
            temp := temp AND i(ip);
          WHEN T_OR | T_NOR =>
            temp := temp OR i(ip);
          WHEN T_XOR | T_XNOR =>
            temp := temp XOR i(ip);
          WHEN OTHERS => NULL;
        END CASE;          
      END LOOP;  -- i
      
      --carry chain logic is a bit wierd. OR and NOR require inversion in the LUTs.
      CASE ci_func IS
        WHEN T_OR | T_NOR =>
          lut_o(num_lut_reqd-1) <= NOT temp;  --mux logic required NOR for OR,NOR
        WHEN T_AND | T_NAND | T_XOR | T_XNOR =>
          lut_o(num_lut_reqd-1) <= temp;
        WHEN OTHERS => NULL;
      END CASE;
    END process;


    ---------------------------------------------------------------------------
    -- The carry chain primitives
    ---------------------------------------------------------------------------
    and_or: IF fn_use_muxcy_chain(ci_impl,ci_func) GENERATE
      --async_o is hijacked for the carry chain. The bottom bit has to be set.
      async_o(num_lut_reqd) <= NOT carry_const_ip;  
      carry_muxs: FOR nmux IN 0 TO num_lut_reqd -1 GENERATE
        i_mux : MUXCY
          port map(
            o  => async_o(nmux),
            ci => async_o(nmux+1),
            di => carry_const_ip,
            s  => lut_o(nmux)
            );
      END GENERATE carry_muxs;
    END GENERATE and_or;

    ---------------------------------------------------------------------------
    -- In the case of XOR, the carry logic is fixed length because the XOR
    -- primitive has only 2 inputs. Hence the use of literals
    xor_xnor: IF fn_use_xor_chain(ci_impl, ci_func) GENERATE
    begin
      xor_no_inv: IF ci_func = T_XOR GENERATE
      begin
        i_xor : XORCY
          port map(
            o  => async_o(0),
            ci => xor_carry(0),
            li => lut_o(0)
            );
      END GENERATE xor_no_inv;
      xor_inv: IF ci_func = T_XNOR GENERATE
        lut_inv_o(0) <= NOT lut_o(0);
        i_xor : XORCY
          port map(
            o  => async_o(0),
            ci => xor_carry(0),
            li => lut_inv_o(0)
            );
      END GENERATE xor_inv;

      i_mux : MUXCY_L
        port map(
          ci => '1',
          di => '0',
          s  => lut_o(1),
          lo => xor_carry(0)
          );

    END GENERATE xor_xnor;

    --carry chain logic spits out it's answer at the top.
    o <= async_o(0);
  END GENERATE opt_carry_tile;

  -----------------------------------------------------------------------------
  -- LUT Tile
  -----------------------------------------------------------------------------
  opt_lut_tile: IF ci_impl = T_LUT GENERATE
    i_lut: PROCESS (i)
      VARIABLE temp : std_logic;
    begin
      temp := i(0);
      FOR ip IN 1 TO c_width_in -1 LOOP
        CASE ci_func IS
          WHEN T_AND |T_NAND =>
            temp := temp AND i(ip);
          WHEN T_OR |T_NOR =>
            temp := temp OR i(ip);
          WHEN T_XOR |T_XNOR =>
            temp := temp XOR i(ip);
          WHEN OTHERS => NULL;
        END CASE;
      END LOOP;  -- ip
      CASE ci_func IS
        WHEN T_AND | T_OR | T_XOR =>
          o <= temp;
        WHEN T_NAND | T_NOR | T_XNOR =>
          o <= NOT temp;
        WHEN OTHERS => NULL;
      END CASE;
    END process;
  END GENERATE opt_lut_tile;

  -----------------------------------------------------------------------------
  -- Direct connection 'tile'
  -----------------------------------------------------------------------------
  opt_direct_conn: IF ci_impl = T_DIRECT_CONN GENERATE
    o <= i(0);    --did I really come into this component just for this???
  END GENERATE opt_direct_conn;
  
END synth;



-- $Header: 

--  (c) Copyright 1995-2005 Xilinx, Inc. All rights reserved.
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
---------------------------------------------------------------
-- Author: Gordon Old
--
-- c_gate_bit_v8_tier.vhd
-- 
-- This entity implements a single tier of what may be a multi-tiered wide
-- input gate
-- The input width (bits), function(AND, OR, etc) and implementation style
-- (LUTs only or using the carry-chain primitives)
-- This entity becomes the building block for the higher level entity which determines
-- the width of each tier and it's implementation style appropriate to the situation.
---------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;  --for poor man's enumerated types

LIBRARY c_gate_bit_v12_0_3;
USE c_gate_bit_v12_0_3.pkg_gate_bit_v12_0.ALL;

ENTITY c_gate_bit_tier IS
  GENERIC(
    c_width_in  : INTEGER;
    c_width_out : INTEGER;
    ci_func     : T_GATE_FUNC;
    ci_impl     : T_GATE_IMPL;
    ci_family   : T_DEVICE_FAMILY
    );
  PORT (
    i : IN  STD_LOGIC_VECTOR(c_width_in-1 DOWNTO 0);
    o : OUT STD_LOGIC_VECTOR(c_width_out-1 DOWNTO 0)
    );
END c_gate_bit_tier;

ARCHITECTURE synth OF c_gate_bit_tier IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT tile_spec : T_GATE_TILE_SPEC := fn_opt_gate_tile_spec(c_width_in,
                                                                 c_width_out,
                                                                 ci_impl,
                                                                 ci_func,
                                                                 ci_family
                                                                 );
BEGIN
  loop_tiles: FOR tile IN 0 TO tile_spec.num_tiles-1 GENERATE
    i_tile: c_gate_bit_tile
      GENERIC MAP (
        c_width_in => tile_spec.tile_ip_width(tile),
        ci_func    => ci_func,
        ci_impl    => tile_spec.tile_impl(tile),
        ci_family  => ci_family
        )
      PORT MAP (
        i => i(tile_spec.tile_index_in(tile) + tile_spec.tile_ip_width(tile) -1
               DOWNTO tile_spec.tile_index_in(tile)),
        o => o(tile)
        );
  END GENERATE loop_tiles;
END ARCHITECTURE synth;




-- (c) Copyright 1995-2005 Xilinx, Inc. All rights reserved.
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
---------------------------------------------------------------
-- Author: Gordon Old
--
-- c_gate_bit_v12_0_3.vhd
--
-- This entity implements a simple binary operator function on an n-bit wide input bus.
-- selectable register or unregistered outputs
-- width from 2 to 256 bits
-- optional ACLR, ASET, ACLR and ASET, AINIT
-- optional SCLR, SSET, SCLR and SSET, SINIT
-- optional CE
-- optional C_SYNC_ENABLE and C_SYNC_PRIORITY
--
-- Design Notes:
-- This implementation takes advantage of the carry chain logic to create very
-- fast wide gates with a minimum of LUTs used.
-- The carry chain MUXs aid the implementation of AND, NAND, OR and NOR.
-- The carry chain XORs aid the implementation of XOR and XNOR.
-- Tristate controls are still on the interface for compatibility, but are not
-- used.
--
-- Code implementation notes
-- Simple RTL experiments showed that the XST flow can still revert to using a sea of
-- LUTs to implement wide gates. Other experiments showed that it is not a
-- simple choice between carry-chain logic and LUT-only implementations because
-- the carry chain can become so long that it is faster to break the structure
-- into two tiers, with several smaller carry chains feeding a LUT.
-- There were also cases where XST (or the result of downstream tools) did not use
-- the minimal number of LUTs.
--
-- For this baseblock, the code is broken into 4 files:
-- pkg_gate_bit_v12_0.vhd
-- c_gate_bit_v12_0_3_viv.vhd
-- c_gate_bit_tier.vhd
-- c_gate_bit_tile.vhd
--
-- The package contains the functions which calculates the number and form of
-- tiers given the input width, logic function, pipelining etc. This
-- specification for the tiers is expressed in the return value T_GATE_TIER_SPEC
-- In other words, the gate is first broken into a cascade of logic tiers with
-- optional pipeline registers.
-- Having broken the gate into a cascade of tiers, each tier is then broken
-- into a set of tiles. The function which takes the spec of a tier and breaks
-- this into a set of tiles returns a value of type T_GATE_TILE_SPEC
-- Note that this tiling is not a simple division since it is still better to
-- have LUTs fully utilised. Hence the number of LUTs required is calculated,
-- then these LUTs broken in to the required number of tiles.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

library unisim;
use unisim.vcomponents.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;  --for poor man's enumerated types

library c_reg_fd_v12_0_3;
use c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.all;

library c_gate_bit_v12_0_3;
use c_gate_bit_v12_0_3.pkg_gate_bit_v12_0.all;

entity c_gate_bit_v12_0_3_viv is
  generic(
    C_GATE_TYPE      : integer := 0;    --c_and;
    C_INPUTS         : integer := 2;
    C_INPUT_INV_MASK : string  := "0";
    C_PIPE_STAGES    : integer := 0;
    C_AINIT_VAL      : string  := "0";
    C_SINIT_VAL      : string  := "0";
    C_SYNC_PRIORITY  : integer := 1;    --c_clear;
    C_SYNC_ENABLE    : integer := 0;    --c_override;
    C_HAS_O          : integer := 0;
    C_HAS_Q          : integer := 1;
    C_HAS_CE         : integer := 0;
    C_HAS_ACLR       : integer := 0;
    C_HAS_ASET       : integer := 0;
    C_HAS_AINIT      : integer := 0;
    C_HAS_SCLR       : integer := 0;
    C_HAS_SSET       : integer := 0;
    C_HAS_SINIT      : integer := 0;
    C_FAMILY         : string  := "no_family";
    C_ENABLE_RLOCS   : integer := 0
    );

  port (
    I     : in  std_logic_vector(c_inputs-1 downto 0) := (others => '0');  -- input vector
    CLK   : in  std_logic                             := '0';              -- clock
    CE    : in  std_logic                             := '1';              -- clock enable
    ACLR  : in  std_logic                             := '0';              -- asynch clr.
    ASET  : in  std_logic                             := '0';              -- asynch set.
    AINIT : in  std_logic                             := '0';              -- asynch init.
    SCLR  : in  std_logic                             := '0';              -- synch clr.
    SSET  : in  std_logic                             := '0';              -- synch set.
    SINIT : in  std_logic                             := '0';              -- synch init.
    T     : in  std_logic                             := '0';              -- tri-state input for buft
    EN    : in  std_logic                             := '0';              -- enable input for bufe
    O     : out std_logic                             := '0';              -- asynch output
    Q     : out std_logic                             := '0'               -- registered output value
    );
end entity c_gate_bit_v12_0_3_viv;

architecture synth of c_gate_bit_v12_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  function fn_check_generics (
    width                         : integer;
    gate_type                     : integer;
    pipe_levs                     : integer;
    input_inv_mask                : string;
    ainit_val, sinit_val          : string;
    has_aclr, has_aset, has_ainit : integer;
    has_sclr, has_sset, has_sinit : integer;
    has_q, has_o                  : integer;
    rlocs                         : integer;
    sync_priority                 : integer;
    sync_enable                   : integer )
    return integer is
  begin
    assert has_aclr = 0 or has_aclr = 1 report "c_has_aclr must be 0 or 1" severity failure;
    assert has_aset = 0 or has_aset = 1 report "c_has_aset must be 0 or 1" severity failure;
    assert has_ainit = 0 or has_ainit = 1 report "c_has_ainit must be 0 or 1" severity failure;
    assert has_sclr = 0 or has_sclr = 1 report "c_has_sclr must be 0 or 1" severity failure;
    assert has_sset = 0 or has_sset = 1 report "c_has_sset must be 0 or 1" severity failure;
    assert has_sinit = 0 or has_sinit = 1 report "c_has_sinit must be 0 or 1" severity failure;
    assert has_o = 0 or has_o = 1 report "c_has_o must be 0 or 1" severity failure;
    assert has_q = 0 or has_q = 1 report "c_has_q must be 0 or 1" severity failure;
    assert has_o = 1 or has_q = 1 report "Module must have c_has_o = 1 or c_has_q = 1" severity failure;
    assert gate_type >= 0 and gate_type <= 6 report "gate type value out of range 0 to 6" severity failure;
    assert pipe_levs >= 0 and pipe_levs <= 3 report "gate type value out of range 0 to 6" severity failure;
    assert rlocs = 0
      report "Location constraints are not supported"
      severity warning;
    assert not(width < 2 or width > max_width)
      report "Width must be in the range 2 to 256"
      severity failure;
    assert has_ainit = 0 or (has_aclr = 0 and has_aset = 0)
      report "ainit is mutually exclusive with aclr or aset"
      severity failure;
    assert has_sinit = 0 or (has_sclr = 0 and has_sset = 0)
      report "sinit is mutually exclusive with sclr or sset"
      severity failure;
    assert not((has_aclr /= 0 or has_aset /= 0 or has_ainit /= 0) and (has_sclr /= 0 or has_sset /= 0 or has_sinit /= 0))
      report "Bit_gate            : Including both asynchronous (aclr, aset or ainit) and synchronous (sclr, sset, sinit) controls will add a layer of logic and impact performance"
      severity warning;
    assert has_ainit = 0 or (has_ainit = 1 and ainit_val'length = width)
      report "ainit_val will be padded with 0's or truncated to match c_inputs"
      severity warning;
    assert has_sinit = 0 or (has_sinit = 1 and sinit_val'length = width)
      report "sinit_val will be padded with 0's or truncated to match c_inputs"
      severity warning;
    assert not ((has_q = 0 and c_pipe_stages = 0) and (has_aset /= 0 or has_aclr /= 0 or has_ainit /= 0))
      report "Asynchronous controls only apply to registered outputs"
      severity failure;
    assert not ((has_q = 0 and c_pipe_stages = 0) and (has_sset /= 0 or has_sclr /= 0 or has_sinit /= 0))
      report "Synchronous controls only apply to registered outputs"
      severity failure;

    return 0;
  end fn_check_generics;



  constant check_gen : integer := fn_check_generics(
    c_inputs, c_gate_type, c_pipe_stages,
    c_input_inv_mask, c_ainit_val, c_sinit_val,
    c_has_aclr, c_has_aset, c_has_ainit,
    c_has_sclr, c_has_sset, c_has_sinit,
    c_has_q, c_has_o,
    c_enable_rlocs, c_sync_priority, c_sync_enable);

  constant input_mask    : std_logic_vector(c_inputs downto 1) := str_to_bound_slv_0(c_input_inv_mask, c_inputs);
  constant ci_gate_func  : T_GATE_FUNC                         := fn_select_gate_func(c_gate_type);
  constant ci_family     : T_DEVICE_FAMILY                     := fn_check_family(c_family);
  constant sync_controls : integer                             := fn_syncs_in_d_lut(c_has_sclr, c_has_sset, c_has_sinit,
                                                                                    c_has_aclr, c_has_aset, c_has_ainit);
  constant my_arch       : T_GATE_TIER_SPEC                    := fn_opt_gate_tier_spec(ci_family,
                                                                                        c_inputs,
                                                                                        ci_gate_func,
                                                                                        c_pipe_stages,
                                                                                        sync_controls);
  signal   diag_my_arch  : T_GATE_TIER_SPEC                    := my_arch;

  constant pipe_ctrls          : T_REG_CTRLS := fn_pipe_ctrls(c_has_aclr, c_has_aset, c_has_ainit,
                                                              c_has_sclr, c_has_sset, c_has_sinit,
                                                              c_sync_priority,
                                                              ci_gate_func,
                                                              c_ainit_val, c_sinit_val
                                                              );
  signal   diag_pipe_ctrls     : T_REG_CTRLS := pipe_ctrls;
  constant xor_pipe_ctrls      : T_REG_CTRLS := fn_xor_pipe_ctrls(c_has_aclr, c_has_aset, c_has_ainit,
                                                                  c_has_sclr, c_has_sset, c_has_sinit,
                                                                  c_sync_priority,
                                                                  ci_gate_func,
                                                                  c_ainit_val, c_sinit_val
                                                                  );
  signal   diag_xor_pipe_ctrls : T_REG_CTRLS := xor_pipe_ctrls;

  signal pipe_aclr     : std_logic;
  signal pipe_aset     : std_logic;
  signal pipe_sclr     : std_logic;
  signal pipe_sset     : std_logic;
  signal aclr_i        : std_logic;
  signal aset_i        : std_logic;
  signal ainit_i       : std_logic;
  signal sclr_i        : std_logic;
  signal sset_i        : std_logic;
  signal sinit_i       : std_logic;
  signal xor_pipe_aclr : std_logic;
  signal xor_pipe_sclr : std_logic;

  signal ip : std_logic_vector(c_inputs - 1 downto 0);

  signal con_tiers   : T_CON_TIER;
  signal a_con_tiers : T_CON_TIER;

begin

  ---------------------------------------------------------------------------
  -- optional inputs
  ---------------------------------------------------------------------------
  i_aclr    : if c_has_aclr /=0 generate
    aclr_i <= aclr;
  end generate i_aclr;
  i_no_aclr : if c_has_aclr = 0 generate
    aclr_i <= '0';
  end generate i_no_aclr;

  i_aset    : if c_has_aset /=0 generate
    aset_i <= aset;
  end generate i_aset;
  i_no_aset : if c_has_aset = 0 generate
    aset_i <= '0';
  end generate i_no_aset;

  i_ainit    : if c_has_ainit /=0 generate
    ainit_i <= ainit;
  end generate i_ainit;
  i_no_ainit : if c_has_ainit = 0 generate
    ainit_i <= '0';
  end generate i_no_ainit;

  i_sclr    : if c_has_sclr /=0 generate
    sclr_i <= sclr;
  end generate i_sclr;
  i_no_sclr : if c_has_sclr = 0 generate
    sclr_i <= '0';
  end generate i_no_sclr;

  i_sset    : if c_has_sset /=0 generate
    sset_i <= sset;
  end generate i_sset;
  i_no_sset : if c_has_sset = 0 generate
    sset_i <= '0';
  end generate i_no_sset;

  i_sinit    : if c_has_sinit /=0 generate
    sinit_i <= sinit;
  end generate i_sinit;
  i_no_sinit : if c_has_sinit = 0 generate
    sinit_i <= '0';
  end generate i_no_sinit;

  ---------------------------------------------------------------------------
  -- input inversion mask
  ---------------------------------------------------------------------------
  ip                                                   <= input_mask xor i;
  con_tiers(my_arch.no_tiers+1)(c_inputs - 1 downto 0) <= ip;

  ---------------------------------------------------------------------------
  -- Create pipeline register controls
  -- In the presence of sync controls, the pipe regs get no async controls
  -- For an inverting function (NAND, NOR, XNOR), all the clr, set controls
  -- are inverted. This is because the last tier of logic will invert the state.
  ---------------------------------------------------------------------------
  inv_pipe_ctrl   : if fn_inverting_func(ci_gate_func) generate
    opt_clr_set   : if c_has_sclr /= 0 or c_has_sset /= 0 generate
      pipe_sclr   <= sset_i;
      pipe_sset   <= sclr_i;
    end generate;
    opt_init      : if c_has_sinit /= 0 generate
      pipe_sclr   <= sinit_i;
      pipe_sset   <= sinit_i;
    end generate opt_init;
    opt_async     : if fn_pipe_has_async(c_has_sclr, c_has_sset, c_has_sinit) generate
      opt_clr_set : if c_has_aclr /= 0 or c_has_aset /= 0 generate
        pipe_aclr <= aset_i;
        pipe_aset <= aclr_i;
      end generate opt_clr_set;
      opt_init    : if c_has_ainit /= 0 generate
        pipe_aclr <= ainit_i;
        pipe_aset <= ainit_i;
      end generate opt_init;
    end generate opt_async;
    opt_no_async  : if not fn_pipe_has_async(c_has_sclr, c_has_sset, c_has_sinit) generate
      pipe_aclr   <= '-';
      pipe_aset   <= '-';
    end generate opt_no_async;
  end generate inv_pipe_ctrl;

  norm_pipe_ctrl  : if not fn_inverting_func(ci_gate_func) generate
    opt_clr_set   : if c_has_sclr /= 0 or c_has_sset /= 0 generate
      pipe_sclr   <= sclr_i;
      pipe_sset   <= sset_i;
    end generate;
    opt_init      : if c_has_sinit /= 0 generate
      pipe_sclr   <= sinit_i;
      pipe_sset   <= sinit_i;
    end generate opt_init;
    opt_async     : if fn_pipe_has_async(c_has_sclr, c_has_sset, c_has_sinit) generate
      opt_clr_set : if c_has_aclr /= 0 or c_has_aset /= 0 generate
        pipe_aclr <= aclr_i;
        pipe_aset <= aset_i;
      end generate opt_clr_set;
      opt_init    : if c_has_ainit /= 0 generate
        pipe_aclr <= ainit_i;
        pipe_aset <= ainit_i;
      end generate opt_init;
    end generate opt_async;
    opt_no_async  : if not fn_pipe_has_async(c_has_sclr, c_has_sset, c_has_sinit) generate
      pipe_aclr   <= '-';
      pipe_aset   <= '-';
    end generate opt_no_async;
  end generate norm_pipe_ctrl;

  ---------------------------------------------------------------------------
  -- generate the tiers of logic and any pipeline registers.
  ---------------------------------------------------------------------------
  xor_pipe_sclr <= sclr_i or sset_i or sinit_i;
  xor_pipe_aclr <= aclr_i or aset_i or ainit_i;

  tier_gen : for tier_loop in 1 to my_arch.no_tiers generate

    i_tier : c_gate_bit_tier
      generic map(
        c_width_in  => my_arch.tier_ip_width(tier_loop),
        c_width_out => my_arch.tier_ip_width(tier_loop-1),
        ci_func     => my_arch.tier_funcs(tier_loop),
        ci_impl     => my_arch.tier_impl(tier_loop),
        ci_family   => ci_family
        )
      port map(
        i           => con_tiers(tier_loop+1)(my_arch.tier_ip_width(tier_loop)-1 downto 0),
        o           => a_con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 0)
        );

    -------------------------------------------------------------------------
    -- pipeline register. Curious reset behaviour is explained in pipeline
    -- register controls.
    -------------------------------------------------------------------------
    opt_reg              : if my_arch.tier_reg(tier_loop) = true generate
      opt_norm_func      : if ci_gate_func = T_AND or ci_gate_func = T_NAND or
                             ci_gate_func = T_OR or ci_gate_func = T_NOR generate
        i_tier_reg       : c_reg_fd_v12_0_3_viv
          generic map(
            c_width         => my_arch.tier_ip_width(tier_loop-1),
            c_ainit_val     => fn_stretch_string(pipe_ctrls.ainit_val, my_arch.tier_ip_width(tier_loop-1)),
            c_sinit_val     => fn_stretch_string(pipe_ctrls.sinit_val, my_arch.tier_ip_width(tier_loop-1)),
            c_sync_priority => pipe_ctrls.sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => pipe_ctrls.has_aclr,
            c_has_aset      => pipe_ctrls.has_aset,
            c_has_ainit     => 0,
            c_has_sclr      => pipe_ctrls.has_sclr,
            c_has_sset      => pipe_ctrls.has_sset,
            c_has_sinit     => 0,
            c_enable_rlocs  => 0
            )
          port map(
            d               => a_con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 0),
            clk             => clk,
            ce              => ce,
            aclr            => pipe_aclr,
            aset            => pipe_aset,
            ainit           => '0',
            sclr            => pipe_sclr,
            sset            => pipe_sset,
            sinit           => '0',
            q               => con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 0)
            );
      end generate opt_norm_func;
      opt_xor_func       : if ci_gate_func = T_XOR or ci_gate_func = T_XNOR generate
        i_first_tier_reg : c_reg_fd_v12_0_3_viv
          generic map(
            c_width         => 1,
            c_ainit_val     => pipe_ctrls.ainit_val,
            c_sinit_val     => pipe_ctrls.sinit_val,
            c_sync_priority => pipe_ctrls.sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => pipe_ctrls.has_aclr,
            c_has_aset      => pipe_ctrls.has_aset,
            c_has_ainit     => 0,
            c_has_sclr      => pipe_ctrls.has_sclr,
            c_has_sset      => pipe_ctrls.has_sset,
            c_has_sinit     => 0,
            c_enable_rlocs  => 0
            )
          port map(
            d(0)            => a_con_tiers(tier_loop)(0),
            clk             => clk,
            ce              => ce,
            aclr            => pipe_aclr,
            aset            => pipe_aset,
            ainit           => '0',
            sclr            => pipe_sclr,
            sset            => pipe_sset,
            sinit           => '0',
            q(0)            => con_tiers(tier_loop)(0)
            );

--CR 493983 moved these lines out of for-generate loop. Was giving error message that xor_pipe_(s,a)clr were being driven with multiple dirvers
-- moved up above for-generate
-- xor_pipe_sclr <= sclr_i OR sset_i OR sinit_i;
-- xor_pipe_aclr <= aclr_i OR aset_i OR ainit_i;

        i_other_tier_reg : c_reg_fd_v12_0_3_viv
          generic map(
            c_width         => my_arch.tier_ip_width(tier_loop-1)-1,
            c_ainit_val     => "0",
            c_sinit_val     => "0",
            c_sync_priority => pipe_ctrls.sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => xor_pipe_ctrls.has_aclr,
            c_has_aset      => 0,
            c_has_ainit     => 0,
            c_has_sclr      => xor_pipe_ctrls.has_sclr,
            c_has_sset      => 0,
            c_has_sinit     => 0,
            c_enable_rlocs  => 0
            )
          port map(
            d               => a_con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 1),
            clk             => clk,
            ce              => ce,
            aclr            => xor_pipe_aclr,
            aset            => '0',
            ainit           => '0',
            sclr            => xor_pipe_sclr,
            sset            => '0',
            sinit           => '0',
            q               => con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 1)
            );

      end generate opt_xor_func;
    end generate opt_reg;

    -------------------------------------------------------------------------
    --If no pipe register, connect the tiers directly async bus(d) to the sync bus(q).
    --Except the final tier, (which has the output register)
    opt_no_reg : if my_arch.tier_reg(tier_loop) = false and tier_loop /= 1 generate
      --It would be sufficient to connect con_tiers to acon_tiers, but due to
      --the fact that these are square arrays for a pyramid structure, a lot aren't
      --used, causing a heap of warnings in synth. Constraining the other dimension
      --makes for verbose synth code, but neater synth transcript.
      con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 0) <=
        a_con_tiers(tier_loop)(my_arch.tier_ip_width(tier_loop-1)-1 downto 0);
    end generate opt_no_reg;

  end generate tier_gen;


  --The final output register is different from the others in that it allows
  --all possibilities of sync and async controls.
  opt_final_reg : if c_has_q /= 0 generate
    i_final_reg : c_reg_fd_v12_0_3_viv
      generic map(
        c_width         => 1,
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
        c_has_sinit     => c_has_sinit
        )
      port map(
        clk             => clk,
        ce              => ce,
        ainit           => ainit_i,
        aclr            => aclr_i,
        aset            => aset_i,
        sinit           => sinit_i,
        sclr            => sclr_i,
        sset            => sset_i,
        d(0)            => a_con_tiers(1)(0),
        q(0)            => con_tiers(1)(0)
        );
  end generate opt_final_reg;

  -------------------------------------------------------------------------
  -- connect/rename inputs and outputs to tier arrays
  -------------------------------------------------------------------------
  opt_q : if c_has_q /= 0 generate
    q <= con_tiers(1)(0);
  end generate opt_q;

  opt_o : if c_has_o /= 0 generate
    o <= a_con_tiers(1)(0);
  end generate opt_o;


end synth;



-- (c) Copyright 1995 - 2013 Xilinx, Inc. All rights reserved.
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

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library ieee;
use ieee.std_logic_1164.all;

library c_gate_bit_v12_0_3;
use c_gate_bit_v12_0_3.c_gate_bit_v12_0_3_viv_comp.all;

entity c_gate_bit_v12_0_3 is
  generic (
    C_GATE_TYPE      : integer := 0;    --c_and;
    C_INPUTS         : integer := 2;
    C_INPUT_INV_MASK : string  := "0";
    C_PIPE_STAGES    : integer := 0;
    C_AINIT_VAL      : string  := "0";
    C_SINIT_VAL      : string  := "0";
    C_SYNC_PRIORITY  : integer := 1;    --c_clear;
    C_SYNC_ENABLE    : integer := 0;    --c_override;
    C_HAS_O          : integer := 0;
    C_HAS_Q          : integer := 1;
    C_HAS_CE         : integer := 0;
    C_HAS_ACLR       : integer := 0;
    C_HAS_ASET       : integer := 0;
    C_HAS_AINIT      : integer := 0;
    C_HAS_SCLR       : integer := 0;
    C_HAS_SSET       : integer := 0;
    C_HAS_SINIT      : integer := 0;
    C_FAMILY         : string  := "no_family";
    C_ENABLE_RLOCS   : integer := 0
    );

  port (
    I     : in  std_logic_vector(c_inputs-1 downto 0) := (others => '0');  -- input vector
    CLK   : in  std_logic                             := '0';              -- clock
    CE    : in  std_logic                             := '1';              -- clock enable
    ACLR  : in  std_logic                             := '0';              -- asynch clr.
    ASET  : in  std_logic                             := '0';              -- asynch set.
    AINIT : in  std_logic                             := '0';              -- asynch init.
    SCLR  : in  std_logic                             := '0';              -- synch clr.
    SSET  : in  std_logic                             := '0';              -- synch set.
    SINIT : in  std_logic                             := '0';              -- synch init.
    T     : in  std_logic                             := '0';              -- tri-state input for buft
    EN    : in  std_logic                             := '0';              -- enable input for bufe
    O     : out std_logic                             := '0';              -- asynch output
    Q     : out std_logic                             := '0'               -- registered output value
    );
end entity c_gate_bit_v12_0_3;

architecture xilinx of c_gate_bit_v12_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  xstgatebitinst : c_gate_bit_v12_0_3_viv
    generic map (
      C_GATE_TYPE      => C_GATE_TYPE,
      C_INPUTS         => C_INPUTS,
      C_INPUT_INV_MASK => C_INPUT_INV_MASK,
      C_PIPE_STAGES    => C_PIPE_STAGES,
      C_AINIT_VAL      => C_AINIT_VAL,
      C_SINIT_VAL      => C_SINIT_VAL,
      C_SYNC_PRIORITY  => C_SYNC_PRIORITY,
      C_SYNC_ENABLE    => C_SYNC_ENABLE,
      C_HAS_O          => C_HAS_O,
      C_HAS_Q          => C_HAS_Q,
      C_HAS_CE         => C_HAS_CE,
      C_HAS_ACLR       => C_HAS_ACLR,
      C_HAS_ASET       => C_HAS_ASET,
      C_HAS_AINIT      => C_HAS_AINIT,
      C_HAS_SCLR       => C_HAS_SCLR,
      C_HAS_SSET       => C_HAS_SSET,
      C_HAS_SINIT      => C_HAS_SINIT,
      C_FAMILY         => C_FAMILY,
      C_ENABLE_RLOCS   => C_ENABLE_RLOCS
      )
    port map (
      I                => I,
      CLK              => CLK,
      CE               => CE,
      ACLR             => ACLR,
      ASET             => ASET,
      AINIT            => AINIT,
      SCLR             => SCLR,
      SSET             => SSET,
      SINIT            => SINIT,
      O                => O,
      Q                => Q,
      T => T,
      EN => EN
      );

end architecture xilinx;




