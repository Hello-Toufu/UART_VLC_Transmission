-- $RCSfile: c_counter_binary_v12_0_10_viv_comp.vhd,v $ $Revision: 1.5 $ $Date: 2010/03/19 10:46:30 $
--
--  (c) Copyright 1995-2008 Xilinx, Inc. All rights reserved.
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
-- Component statement for wrapper of behavioural model
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package c_counter_binary_v12_0_10_viv_comp is

----------------------------------------------------------
-- Insert component declaration of top level xst file here
----------------------------------------------------------
  --core_if on component c_counter_binary_v12_0_10_viv
  component c_counter_binary_v12_0_10_viv
    GENERIC (
      C_IMPLEMENTATION      : integer := 0;
      C_VERBOSITY           : integer := 0;
      C_XDEVICEFAMILY       : string  := "nofamily";  -- must be set
      C_WIDTH               : integer := 16;
      C_HAS_CE              : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_RESTRICT_COUNT      : integer := 0;
      C_COUNT_TO            : string  := "1";
      C_COUNT_BY            : string  := "1";
      C_COUNT_MODE          : integer := 0;           -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE       : string  := "1";
      C_CE_OVERRIDES_SYNC   : integer := 0;           -- 0=override;
      C_HAS_THRESH0         : integer := 0;
      C_HAS_LOAD            : integer := 0;
      C_LOAD_LOW            : integer := 0;
      C_LATENCY             : integer := 1;
      C_FB_LATENCY          : integer := 0;
      C_AINIT_VAL           : string  := "0";
      C_SINIT_VAL           : string  := "0";
      C_SCLR_OVERRIDES_SSET : integer := 1;           -- 0=set, 1=clear;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0
      );
    PORT (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      SSET    : in  std_logic                            := '0';              -- optional synch set to '1'
      SINIT   : in  std_logic                            := '0';              -- optional synch reset to init_val
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
  --core_if off
  END COMPONENT;


end c_counter_binary_v12_0_10_viv_comp;



-- $RCSfile: c_counter_binary_v12_0_10_comp.vhd,v $ $Revision: 1.5 $ $Date: 2010/03/19 10:46:29 $
-------------------------------------------------------------------------------
--
--  (c) Copyright 1995-2008 Xilinx, Inc. All rights reserved.
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
-- Component statement for behavioral model
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

PACKAGE c_counter_binary_v12_0_10_comp IS

  --core_if on component c_counter_binary_v12_0_10
  component c_counter_binary_v12_0_10
    GENERIC (
      C_IMPLEMENTATION      : integer := 0;
      C_VERBOSITY           : integer := 0;
      C_XDEVICEFAMILY       : string  := "nofamily";  -- must be set
      C_WIDTH               : integer := 16;
      C_HAS_CE              : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_RESTRICT_COUNT      : integer := 0;
      C_COUNT_TO            : string  := "1";
      C_COUNT_BY            : string  := "1";
      C_COUNT_MODE          : integer := 0;           -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE       : string  := "1";
      C_CE_OVERRIDES_SYNC   : integer := 0;           -- 0=override;
      C_HAS_THRESH0         : integer := 0;
      C_HAS_LOAD            : integer := 0;
      C_LOAD_LOW            : integer := 0;
      C_LATENCY             : integer := 1;
      C_FB_LATENCY          : integer := 0;
      C_AINIT_VAL           : string  := "0";
      C_SINIT_VAL           : string  := "0";
      C_SCLR_OVERRIDES_SSET : integer := 1;           -- 0=set, 1=clear;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0
      );
    PORT (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      SSET    : in  std_logic                            := '0';              -- optional synch set to '1'
      SINIT   : in  std_logic                            := '0';              -- optional synch reset to init_val
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
  --core_if off
  END COMPONENT;


END c_counter_binary_v12_0_10_comp;


-- $ID :$
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
-- This file is lifted from c_counter_binary_v9_1. It has been lifted
--so that bugfixes can be made (specifically load and ce interactions)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;             -- for UNSIGNED data type

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library c_addsub_v12_0_10;
use c_addsub_v12_0_10.c_addsub_v12_0_10_pkg_legacy.all;

entity c_counter_binary_v12_0_10_legacy is
  generic (
    c_family         : string;
    c_width          : integer;
    c_restrict_count : integer;
    c_count_to       : string ;
    c_count_by       : string ;
    c_count_mode     : integer;
    c_thresh0_value  : string ;
    c_thresh1_value  : string ;
    c_thresh_early   : integer;
    c_ainit_val      : string ;
    c_sinit_val      : string ;
    c_load_enable    : integer;
    c_sync_enable    : integer;
    c_sync_priority  : integer;
    c_pipe_stages    : integer;
    c_has_thresh0    : integer;
    c_has_q_thresh0  : integer;
    c_has_thresh1    : integer;
    c_has_q_thresh1  : integer;
    c_has_ce         : integer;
    c_has_up         : integer;
    c_has_iv         : integer;
    c_has_l          : integer;
    c_has_load       : integer;
    c_load_low       : integer;
    c_has_aclr       : integer;
    c_has_aset       : integer;
    c_has_ainit      : integer;
    c_has_sclr       : integer;
    c_has_sset       : integer;
    c_has_sinit      : integer;
    c_enable_rlocs   : integer
    );

  port (
    clk       : in  std_logic                            := '0';  -- Optional clock
    up        : in  std_logic                            := '1';  -- Controls direction of count - '1' = up.
    ce        : in  std_logic                            := '1';  -- Optional Clock enable
    load      : in  std_logic                            := '0';  -- Optional Synch load trigger
    l         : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- Optional Synch load value
    iv        : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- Optional Increment value
    aclr      : in  std_logic                            := '0';  -- Asynch init.
    aset      : in  std_logic                            := '0';  -- optional asynch set to '1'
    ainit     : in  std_logic                            := '0';  -- optional asynch reset to init_val
    sclr      : in  std_logic                            := '0';  -- Synch init.
    sset      : in  std_logic                            := '0';  -- optional synch set to '1'
    sinit     : in  std_logic                            := '0';  -- Optional synch reset to init_val
    thresh0   : out std_logic                            := '1';
    q_thresh0 : out std_logic                            := '1';
    thresh1   : out std_logic                            := '1';
    q_thresh1 : out std_logic                            := '1';
    q         : out std_logic_vector(c_width-1 downto 0)  -- Output value
    );
end c_counter_binary_v12_0_10_legacy;

architecture synth of c_counter_binary_v12_0_10_legacy is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  -- Types inherited from pkg_baseblox:
  -- TYPE T_SYNC_ENABLE        IS (SYNC_OVERRIDES_CE, CE_OVERRIDES_SYNC);
  -- TYPE T_REG_PRIORITY       IS (RESET_OVERRIDES_SET,SET_OVERRIDES_RESET);

  -- Local types:
  type t_count_mode is (count_up, count_down, count_updown);
  type t_load_enable is (ce_overrides_load, load_overrides_ce);

  constant max_width  : integer                                := 256;
  constant all0s      : std_logic_vector(c_width - 1 downto 0) := (others      => '0');
  constant all1s      : std_logic_vector(c_width - 1 downto 0) := (others      => '1');
  -- 2 ** c_width in a constant
  -- simply doing 2 ** c_width will cause overflow with c_width >=32!
--  constant maxplusone : unsigned(c_width downto 0)             := ('1', others => '0');
  CONSTANT lotsofzeros : STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');
  CONSTANT maxplusone  : UNSIGNED(c_width DOWNTO 0)           := UNSIGNED(STD_LOGIC_VECTOR("1" & lotsofzeros));

  function fn_select_count_mode (c_count_mode : integer) return t_count_mode is
    variable ret_val : t_count_mode;
  begin
    case c_count_mode is
      when c_up     => ret_val := count_up;
      when c_down   => ret_val := count_down;
      when c_updown => ret_val := count_updown;
      when others   => assert false report "ERROR - counter_binary: Invalid value found in c_count_mode"
                         severity failure;  -- can't happen
    end case;
    return ret_val;
  end;

                                                -- purpose: decide the appropriate mode of operation for the ADDSUB based on the counter's mode.
  function count_mode2add_mode (mode : t_count_mode) return integer is
    variable ret_val : integer;
  begin
    case mode is
      when count_up     => ret_val := c_add;
      when count_down   => ret_val := c_sub;
      when count_updown => ret_val := c_add_sub;
      when others       => assert false report "ERROR - counter_binary: invalid count mode in count_mode2add_mode"
                             severity failure;  -- can't happen
    end case;
    return ret_val;
  end;

  function fn_select_load_enable (c_load_enable : integer) return t_load_enable is
    variable ret_val : t_load_enable;
  begin
    case c_load_enable is
      when c_override    => ret_val := load_overrides_ce;
      when c_no_override => ret_val := ce_overrides_load;
      when others        => assert false report "ERROR - counter_binary: Invalid value found in c_load_enable"
                              severity failure;
    end case;
    return ret_val;
  end;

  function fn_integer_or (a,b : integer) return integer is
    variable ret_val : integer;
  begin
    if a=0 and b=0 then
    ret_val := 0;
  else
    ret_val := 1;
    end if;
    return ret_val;
  end;

  constant the_addsub_has_sclr : integer := fn_integer_or(c_has_sclr,c_restrict_count);

                                      -- Clean versions of generics:
  constant enum_c_count_mode    : t_count_mode   := fn_select_count_mode (c_count_mode);
  constant enum_c_load_enable   : t_load_enable  := fn_select_load_enable(c_load_enable);
  constant enum_c_sync_enable   : t_sync_enable  := fn_select_sync_enable(c_sync_enable);
  constant enum_c_sync_priority : t_reg_priority := fn_select_sync_priority(c_sync_priority);

                                      -- convert these generics to std_logic_vectors and pad with '0's
                                      -- nomenclature: ci = constant internal...
  constant ci_count_by    : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_count_by, c_width);
  constant ci_count_to    : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_count_to, c_width);
  signal diag_count_to : std_logic_vector(c_width - 1 downto 0) := ci_count_to;
  constant ci_ainit_val   : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_ainit_val, c_width);
  constant ci_sinit_val   : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_sinit_val, c_width);
  constant ci_thresh0_val : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_thresh0_value, c_width);
                                      -- Not needed; use of thresh1 is deprecated
                                      -- CONSTANT ci_thresh1_val : STD_LOGIC_VECTOR(c_width - 1 DOWNTO 0) := str_to_bound_slv_0(c_thresh1_val, c_width);

                                      -- Calculates the power-on-reset value for the counter.
                                      -- this value depends on the pins present (aclr,aset,ainit,sclr,sset,sinit).
                                      -- If none are present, defaults to c_ainit_val.
  function get_POR_value return std_logic_vector is
    variable ret_val : std_logic_vector(c_width - 1 downto 0);
  begin
    ret_val := ci_ainit_val;          -- default for no pins
    if c_has_aclr = 1 then
      ret_val := (others => '0');
    elsif c_has_aset = 1 then
      ret_val := (others => '1');
    elsif c_has_ainit = 1 then
      ret_val := ci_ainit_val;
    elsif c_has_sclr = 1 or c_restrict_count = 1 then
                                      -- the internal register will have an SCLR if the counter is restricted
      ret_val := (others => '0');
    elsif c_has_sset = 1 then
      ret_val := (others => '1');
    elsif c_has_sinit = 1 then
      ret_val := ci_sinit_val;
    end if;
    return ret_val;
  end;

  function fn_restrict_count_clause (
    p_restrict_count : integer;
    pi_count_to : std_logic_vector
    ) return integer is
  begin
    if p_restrict_count = 1 then
      if pi_count_to = all1s then
        return 0;
      end if;
    end if;
    return 0;
  end fn_restrict_count_clause;
  constant ci_restrict_count : integer := fn_restrict_count_clause(c_restrict_count,ci_count_to);

                                      -- Purpose: ensure that the generics supplied do not demand a nonsensical or unsupported case
                                      -- There are a _lot_ of nonsensical combinations!
  function check_generics return integer is
  begin
--    assert c_has_l = 0 or (c_has_sclr = 0 and c_has_sset = 0 and c_has_sinit = 0) report "Priorities of Sync controls and Load have changed since Version 7.0 for some generic combinations" severity warning;
    assert c_width <= max_width
                      report "ERROR - counter_binary: c_width value of "& int_to_str(c_width) &
                      " exceeds maximum width (max is " & int_to_str(max_width) & ")"
                      severity failure;
    assert c_restrict_count = 0 or c_restrict_count = 1
      report "ERROR - counter_binary: Invalid value for generic c_restrict_count (must be 0 or 1)"
      severity failure;

    assert c_thresh_early = 0 or c_thresh_early = 1
      report "ERROR - counter_binary: Invalid value for generic c_thresh_early (must be 0 or 1)"
      severity failure;
    assert c_has_thresh0 = 0 or c_has_thresh0 = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_thresh0 (must be 0 or 1)"
      severity failure;
    assert c_has_q_thresh0 = 0 or c_has_q_thresh0 = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_q_thresh0 (must be 0 or 1)"
      severity failure;
    assert c_has_thresh1 = 0
      report "ERROR - counter_binary: Threshold 1 output deprecated"
      severity failure;
    assert c_has_q_thresh1 = 0
      report "ERROR - counter_binary: Threshold 1 output deprecated"
      severity failure;

    assert c_has_ce = 0 or c_has_ce = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_ce (must be 0 or 1)"
      severity failure;
    assert c_has_iv = 0
      report "ERROR - counter_binary: Variable increment deprecated - try the accumulator baseblock"
      severity failure;
    assert c_has_load = 0 or c_has_load = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_load (must be 0 or 1)"
      severity failure;
    assert c_has_l = 0 or c_has_l = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_l (must be 0 or 1)"
      severity failure;
    assert c_load_low = 0
      report "ERROR - counter_binary: Active low load pin no longer implemented in version 8"
      severity failure;
    assert c_has_aclr = 0 or c_has_aclr = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_aclr (must be 0 or 1)"
      severity failure;
    assert c_has_aset = 0 or c_has_aset = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_aset (must be 0 or 1)"
      severity failure;
    assert c_has_ainit = 0 or c_has_ainit = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_ainit (must be 0 or 1)"
      severity failure;
    assert c_has_sclr = 0 or c_has_sclr = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_sclr (must be 0 or 1)"
      severity failure;
    assert c_has_sset = 0 or c_has_sset = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_sset (must be 0 or 1)"
      severity failure;
    assert c_has_sinit = 0 or c_has_sinit = 1
      report "ERROR - counter_binary: Invalid value for generic c_has_sinit (must be 0 or 1)"
      severity failure;

                                      -- The following ASSERTs regarding restricted counters may seem a little bizarre..
                                      -- Restricted count is implemented using an equality test. Because of that,
                                      -- a counter which counts in increments other than 1 may skip past the count limit
                                      -- and cause unexpected results.

                                      -- Using an equality test saves on logic but opens many trapdoors for the unwary!
                                      -- These generics hopefully will help users when they tread near one of these trapdoors.

                                      -- Not entirely sure what a restricted up/down counter would entail...
    assert c_restrict_count = 0 or enum_c_count_mode /= count_updown
      report "ERROR - counter_binary: Restricted Up/down counter not allowed"
      severity failure;

                                      -- Don't allow variable increment with restricted counter
    assert c_restrict_count = 0 or c_has_iv = 0
      report "ERROR - counter_binary: c_restrict_count is not well-behaved with c_has_iv."
      severity failure;

                                      -- Nonzero increment!
    assert c_has_iv /= 0 or ci_count_by /= all0s
      report "ERROR - counter_binary: c_count_by must be nonzero"
      severity failure;
                                      -- Nonzero limit!
    assert c_restrict_count = 0 or ci_count_to /= all0s
      report "ERROR - counter_binary: c_count_to must be nonzero"
      severity failure;

                                      -- Require upper limit to be an integer multiple of (constant) increment
    assert c_restrict_count = 0 or enum_c_count_mode /= count_up
      or unsigned(ci_count_to) mod unsigned(ci_count_by) = 0
      report "ERROR - counter_binary: c_count_to must be a multiple of c_count_by"
      severity failure;
                                      -- same thing for COUNT_DOWN counters
    assert c_restrict_count = 0 or enum_c_count_mode /= count_down
      or (maxplusone - unsigned(ci_count_to)) mod unsigned(ci_count_by) = 0
      report "ERROR - counter_binary: (2**c_width - c_count_to) must be a multiple of c_count_by"
      severity failure;

                                      -- Make sure power-on-values, a/sinit, a/set, value loading and suchlike don't mess with restricted counter.
                                      -- This means that any possible value that the counter can be set to
                                      -- must have the following properties:
                                      --  a) it must be a multiple of the c_count_by value
                                      --  b) it must be <= c_count_to.
                                      -- otherwise the counter could get into a position that it would miss the limit.
                                      -- as such, aset and sset are simply not allowed (except in the special case c_count_to = (OTHERS => '1')).
                                      -- ainit and sinit are allowed provided that ainit_val and sinit_val are well-behaved as described above

                                      -- ainit check for up counters


    assert c_restrict_count = 0 or c_has_ainit = 0 or enum_c_count_mode /= count_up
      or (unsigned(ci_ainit_val) mod unsigned(ci_count_by) = 0 and ci_ainit_val <= ci_count_to)
      report "ERROR - counter_binary: Given c_ainit_val may cause counter to skip past its c_count_to value; c_ainit_val must should be a multiple of c_count_by less than c_count_to"
      severity failure;

                                      -- ainit check for down counters
    assert c_restrict_count = 0 or c_has_ainit = 0 or enum_c_count_mode /= count_down or ci_ainit_val = all0s
      or ( (maxplusone - unsigned(ci_ainit_val)) mod unsigned(ci_count_by) = 0 and ci_ainit_val >= ci_count_to)
      report "ERROR - counter_binary: Given c_ainit_val may cause counter to skip past its c_count_to value; c_ainit_val must should be a multiple of c_count_by less than c_count_to"
      severity failure;

-------------------------------------------------------------------------------
-- Debug note: c_restrict_count uses the sclr. Hence, surely sinit and
-- c_restrict are mut exclusive. These original clauses allow through too many
-- impossible cases.
-------------------------------------------------------------------------------
                                      -- sinit check for up counters
--    assert c_restrict_count = 0 or c_has_sinit = 0 or enum_c_count_mode /= count_up
--      or (unsigned(ci_sinit_val) mod unsigned(ci_count_by) = 0 and ci_sinit_val <= ci_count_to)
--      report "ERROR - counter_binary: Given c_sinit_val may cause counter to skip past its c_count_to value; c_sinit_val must should be a multiple of c_count_by less than c_count_to"
--      severity failure;
--                                      -- sinit check for down counters
--    assert c_restrict_count = 0 or c_has_sinit = 0 or enum_c_count_mode /= count_down or ci_sinit_val = all0s
--      or ((maxplusone - unsigned(ci_sinit_val)) mod unsigned(ci_count_by) = 0 and ci_sinit_val >= ci_count_to)
--      report "ERROR - counter_binary: Given c_sinit_val may cause counter to skip past its c_count_to value; c_sinit_val must should be a multiple of c_count_by less than c_count_to"
--      severity failure;
      assert c_restrict_count = 0 or c_has_sinit = 0
        report "ERROR - counter_binary: c_restrict_count and sinit are mutually exclusive. They cannot be supported together"
        severity failure;

                                      -- Power-On-Reset value check for up counters
    assert c_restrict_count = 0 or enum_c_count_mode /= count_up
      or (unsigned(get_POR_value) mod unsigned(ci_count_by) = 0 and get_POR_value <= ci_count_to)
      report "ERROR - counter_binary: Power-on-value will cause counter to miss its c_count_to value"
      severity failure;
                                      -- POR check for down counters
    assert c_restrict_count = 0 or enum_c_count_mode /= count_down or get_POR_value = all0s
      or ((maxplusone - unsigned(get_POR_value)) mod unsigned(ci_count_by) = 0 and get_POR_value >= ci_count_to)
      report "ERROR - counter_binary: Power-on-value will cause counter to miss its c_count_to value"
      severity failure;


    assert ci_restrict_count = 0 or (ci_count_to /= all1s and ci_count_to /= all0s)
      report "ERROR - Invalid value for c_count_to - must be in range 1..(2**c_width - 2)"
      severity failure;
    assert c_restrict_count = 0 or (c_has_aset = 0 and c_has_sset = 0)
      report "ERROR - counter_binary: ASET and SSET are disallowed for restricted counters"
      severity failure;
                                      -- Value loading is not smart enough to detect "too-high" values being loaded.
    assert c_restrict_count = 0 or (c_has_load = 0 and c_has_l = 0)
      report "WARNING - counter_binary: The counter will not notice if a value is loaded beyond its c_count_to value"
      severity warning;
                                      -- Extra check to see if counter is more complicated than count-by-one - a count-by-2s up to 10
                                      -- counter will get really confused if 3 is loaded in. (3,5,7,9,11,13.. - misses 10, so doesn't reset)
    assert c_restrict_count = 0 or (c_has_load = 0 and c_has_l = 0) or (c_has_iv = 0 and unsigned(ci_count_by) = 1)
      report "WARNING - counter_binary: Value loading in a restricted counter may cause the counter to miss its limit"
      severity warning;

                                      -- Up pin should be present if and only if enum_c_count_mode = count_updown
    assert (c_has_up = 1) = (enum_c_count_mode = count_updown)
      report "ERROR - counter_binary: Up pin is required if and only if c_count_mode = c_updown"
      severity failure;

                                      -- Not allowed threshhold greater than count_to limit for up counters..
    assert c_restrict_count = 0 or enum_c_count_mode /= count_up or
      (c_has_thresh0 = 0 and c_has_q_thresh0 = 0) or ci_thresh0_val <= ci_count_to
      report "ERROR - counter_binary: c_thresh0_value exceeds c_count_to value and this is an up counter"
      severity failure;
                                      -- ..or threshhold less than count_to limit for down counters (unless 0)
    assert c_restrict_count = 0 or enum_c_count_mode /= count_down or
      (c_has_thresh0 = 0 and c_has_q_thresh0 = 0) or ci_thresh0_val = all0s or ci_thresh0_val >= ci_count_to
      report "ERROR - counter_binary: c_thresh0_value below c_count_to value and this is a down counter"
      severity failure;

                                      -- No point in having LOAD without L and vice versa...
    assert (c_has_load = 1) = (c_has_l = 1)
      report "ERROR - counter_binary: Need both LOAD and L or neither"
      severity failure;
    assert c_has_ainit = 0 or (c_has_aclr = 0 and c_has_aset = 0)
      report "ERROR - counter_binary: ainit is mutually exclusive with aclr or aset"
      severity failure;
    assert c_has_sinit = 0 or (c_has_sclr = 0 and c_has_sset = 0)
      report "ERROR - counter_binary: sinit is mutually exclusive with sclr or sset"
      severity failure;

                                      -- Async and sync controls together will create extra logic
    assert (c_has_ainit = 0 and c_has_aset = 0 and c_has_aclr = 0) or
      (c_has_sinit = 0 and c_has_sset = 0 and c_has_sclr = 0)
      report "WARNING - counter_binary: Including both asynchronous (aclr, aset or ainit) and synchronous controls (sclr, sset or sinit) will add a layer of logic and impact performance"
      severity warning;
    return 0;
  end check_generics;

                                      -- Purpose: to make the code look neater, since
                                      -- (value = ci_count_to) would return a BOOLEAN, not a STD_LOGIC
                                      -- future feature possibility: use the carry chain to perform these equality tests.
  function is_count_to (value : std_logic_vector(c_width-1 downto 0)) return std_logic is
  begin
    if value = ci_count_to then
      return '1';
    end if;
    return '0';
  end;

  function is_thresh0 (value : std_logic_vector(c_width-1 downto 0)) return std_logic is
  begin
    if value = ci_thresh0_val then
      return '1';
    end if;
    return '0';
  end;

  type t_match_array is array (0 to c_width-1) of integer;
  type t_compare_rec is record          -- comparison data
                        comp_width : integer;
                        comp_bits  : t_match_array;
                        comp_vect  : std_logic_vector(c_width-1 downto 0);
                      end record;
  --Explanation of function:
  --For an up counter, it is only necessary to match the '1's in the terminal
  --count, since that pattern of '1's must be unique to the terminal count.
  --Every previous number must be smaller, so at least one of the '1's will not
  --be there. The same is true for down-counters, but with '0's rather than '1's.
  --However, if the count_by is greater than 1, another trick is possible.
  --Here, We need only examine the '1's which are unique to the terminal count
  --as distinct from the penultimate count. This can cut the number of bits to
  --compare. The same again is true for down-counters but for '0's.
  --Caveat. If only it was that simple! For down counters, matching only the
  --'0's would give a false true on zero itself, so a single '1' must be included
  --to differentiate. I've called this the token_1.
  function fn_optimal_match (
    p_has_match       : integer;
    p_width           : integer;
    p_enum_count_mode : t_count_mode;
    pi_count_to       : std_logic_vector(c_width-1 downto 0);
    pi_count_by       : std_logic_vector(c_width-1 downto 0))
    return t_compare_rec is
    variable ret_val : t_compare_rec;
    variable match_bit : std_logic := '1';
    variable term_diff : std_logic_vector(c_width-1 downto 0);
    variable fred : std_logic_vector(c_width-1 downto 0);  --can't think of a
    --good name for this var. It identified the MS bit where penultimate and
    --term_count differ over a match bit - hence delineating the match vector.
    variable penultimate : std_logic_vector(c_width-1 downto 0);
    variable i : integer range 0 to 258;
    variable token_1 : boolean := false;  --see notes above
--    variable fred_string : string(1 to c_width); --diagnostic
  begin  -- fn_optimal_match
    if p_has_match = 1 then             --only relevant to restricted counters.
      if p_enum_count_mode = count_up then
        penultimate := pi_count_to - pi_count_by;
        term_diff   := (pi_count_to xor penultimate);
        match_bit   := '1';
        fred        := term_diff and pi_count_to;
      else
        penultimate := pi_count_to + pi_count_by;
        term_diff   := (pi_count_to xor penultimate);
        match_bit   := '0';
        fred        := term_diff and NOT(pi_count_to);
      end if;

      --This is essentially a repeat-until loop
      i := p_width;
      ret_val.comp_width := 0;
--      fred_string := std_logic_vector_2_string(fred); --diagnostic
--      assert false report fred_string severity note; --diagnostic
      while i>0 loop
        i := i-1;
--        assert false report INTEGER'IMAGE(i) severity note;  --diagnostic
        if pi_count_to(i) = NOT(match_bit) then
          if p_enum_count_mode = count_down and token_1 = false then
            ret_val.comp_bits(ret_val.comp_width) := i;
            ret_val.comp_vect(ret_val.comp_width) := '1';
            ret_val.comp_width := ret_val.comp_width + 1;
            token_1 := true;
          end if;
          next;
        else
          ret_val.comp_bits(ret_val.comp_width) := i;
          ret_val.comp_vect(ret_val.comp_width) := match_bit;
          ret_val.comp_width := ret_val.comp_width + 1;
          exit when fred(i) = '1' and (p_enum_count_mode = count_up or token_1);--
          --make sure down_counter match has at least a single '1' before exiting.
        end if;
      end loop;
    else
      ret_val.comp_vect(0) := '1';
      ret_val.comp_bits(0) := 0;
      ret_val.comp_width   := 0;
    end if;
    return ret_val;
  end fn_optimal_match;
  constant c_compare_rec : t_compare_rec := fn_optimal_match(
    c_restrict_count  ,
    c_width           ,
    enum_c_count_mode ,
    ci_count_to       ,
    ci_count_by
    );
  signal s_compare_rec : t_compare_rec := c_compare_rec;  -- diagnostic
--  constant c_thresh0_rec : t_compare_rec := fn_optimal_match(
--    c_has_thresh0     ,
--    c_width           ,
--    enum_c_count_mode ,
--    ci_thresh0_val    ,
--    ci_count_by
--    );
--  signal s_thresh0_rec : t_compare_rec := c_thresh0_rec;  -- diagnostic

                                      -- The following line should make sure that check_generics
                                      -- is called on instantiation
  constant check_gens : integer := check_generics;

                                      -- q_i is a signal which links directly to q (the output port) so that
                                      -- its value can be read in again by the adder/subtractor.
                                      --
                                      -- the initial value here works in simulation and _should_ work
                                      -- with XST.
  signal q_i : std_logic_vector ( c_width-1 downto 0) := get_POR_value;

                                      -- q_next is the (asynchronously calculated) next value of q_i which is
                                      -- fed into q_i on the rising edge of the clock.
  signal q_next : std_logic_vector ( c_width-1 downto 0) := (others => '0');

                                      -- nomenclature:
                                      -- foo_i is an internal signal which either links
                                      -- directly to an external port foo (input or output) or is constant
                                      -- at a default value, if the appropriate generic(s) state that
                                      -- it should not be present.
                                      --
                                      -- foo_reg is an internal signal which will be passed to the inferred q_i register.
                                      -- the important ones at the time of writing are ce_reg (which may be affected by
                                      -- ce and the load port) and sclr_reg (which may be affected by sclr and reaching
                                      -- the count_to limit). sset_reg and sinit_reg are identical to sset_i and sinit_i,
                                      -- but make the code clearer.
                                      --
                                      -- The bare skeleton of the central register process (counter : PROCESS) treats
                                      -- synchronous controls as able to override CE but load as not able to. This is
                                      -- to make the process line up nicely with the XST macro. As a result:
                                      -- if enum_c_sync_enable = ce_overrides_sync then sclr_i, sset_i and sinit_i will be gated with ce_i,
                                      -- to change the default behaviour so that sclr, sset and sinit are affected by ce.
                                      -- if enum_c_load_enable = load_overrides_ce then ce_reg will be ORed with load_i,
                                      -- to change the default behaviour so that load overrides ce.
                                      --
  signal ce_i      : std_logic := '1';
  signal ce_reg    : std_logic := '1';
  signal sclr_i    : std_logic := '0';
  signal sset_i    : std_logic := '0';
  signal sinit_i   : std_logic := '0';
                                      -- sxxx_reg are the signals which will be passed to the q_i register.
  signal sclr_reg  : std_logic := '0';
  signal sset_reg  : std_logic := '0';
  signal sinit_reg : std_logic := '0';

  signal clear_count : std_logic := '0';

  signal load_i    : std_logic := '0';
  signal load_cei  : std_logic := '0';
  signal l_i       : std_logic_vector(c_width-1 downto 0):= (others => '0');
  signal up_i      : std_logic := '1';

                                      -- thresh0_i links directly to thresh0 output if present, and is
                                      -- passed into the q_thresh0_i registered output if present. If
                                      -- neither are present, this signal does nothing.
  signal thresh0_i   : std_logic := '0';
  signal q_thresh0_i : std_logic := '0';

  signal count_to_reached     : std_logic := '0';  -- equals '1' when c_count_to reached
--  signal count_for_comparison : std_logic_vector(c_width-1 downto 0);
--  signal thresh0_match_bits   : std_logic_vector(c_width-1 downto 0);
  signal tc_match_bits        : std_logic_vector(c_width-1 downto 0) := (others => '0');
--terminal count

begin

                                      -- PREPARATION SECTION
                                      -- Tying various internal signals to external ports if required,
                                      -- and creating a few gates where necessary.

  i_ce : if c_has_ce = 1 generate
    ce_i <= ce;
  end generate i_ce;

                                      -- generate ce_reg signal
  i_ce_reg_load_enable : if c_has_load = 1 and enum_c_load_enable = load_overrides_ce generate
                                      -- since LOAD data (on port L) enters the register via the
                                      -- D port (by overriding the value of q_next), load must
                                      -- also override the clock enable
    ce_reg <= ce_i or load_i;
  end generate i_ce_reg_load_enable;
  i_ce_reg_no_load_enable : if c_has_load = 0 or enum_c_load_enable = ce_overrides_load generate
    ce_reg <= ce_i;
  end generate i_ce_reg_no_load_enable;

  i_no_restrict_count: if c_restrict_count = 0 generate
    count_to_reached <= '0';
  end generate i_no_restrict_count;
  i_restrict_count : if c_restrict_count = 1 generate
    i_optimal_match: if c_has_l = 0 generate
      i_match_bits: for i in 0 to c_compare_rec.comp_width-1 generate
        tc_match_bits(i) <= q_i(c_compare_rec.comp_bits(i));
      end generate i_match_bits;
                                      -- Calculates when we should reset because we have
                                      -- reached the count limit. Since this should be like
                                      -- any other count, it should give priority to sset, sinit, load and ce.
                                      -- (sclr is missing since count_to_reached will have the same effect
                                      -- as sclr anyway).
                                      -- also, sset is not really necessary since SSET and ci_restrict_count are
                                      -- not allowed by the generics.
      count_to_reached <= '0' when c_restrict_count = 1 and tc_match_bits(c_compare_rec.comp_width-1 downto 0) /= c_compare_rec.comp_vect(c_compare_rec.comp_width-1 downto 0)
                        else '0' when sset_i = '1' or sinit_i = '1' or load_i = '1' or ce_i = '0'
                        else '1';

    end generate i_optimal_match;
    i_whole_match: if c_has_l /= 0 generate
      count_to_reached <= '0' when q_i /= ci_count_to
                          else '1';
    end generate i_whole_match;
  end generate i_restrict_count;

  i_sync_over_ce : if enum_c_sync_enable = sync_overrides_ce generate
    i_sclr : if c_has_sclr = 1 generate
      sclr_i <= sclr;
    end generate i_sclr;

    i_sset : if c_has_sset = 1 generate
      sset_i <= sset;
    end generate i_sset;

    i_sinit : if c_has_sinit = 1 generate
      sinit_i <= sinit;
    end generate i_sinit;
  end generate i_sync_over_ce;

  i_ce_over_sync : if enum_c_sync_enable = ce_overrides_sync generate
    i_sclr : if c_has_sclr = 1 generate
      sclr_i <= sclr and ce_i;
    end generate i_sclr;

    i_sset : if c_has_sset = 1 generate
      sset_i <= sset and ce_i;
    end generate i_sset;

    i_sinit : if c_has_sinit = 1 generate
      sinit_i <= sinit and ce_i;
    end generate i_sinit;
  end generate i_ce_over_sync;

                                      -- sxxx_reg controls
                        -- later on in the counter process, sclr_reg is tested _before_ sset.
                        -- This is because that is the form the RTL macro must take if the
                        -- synthesis tool is to use the flipflop's builtin SET and RESET ports.
                        -- If the user specified that set overrides reset, sclr_reg must be
                        -- gated with sset.
  i_sclr_over_sset : if enum_c_sync_priority = reset_overrides_set generate
    sclr_reg <= sclr_i or count_to_reached;
  end generate i_sclr_over_sset;
  i_sset_over_sclr : if enum_c_sync_priority = set_overrides_reset generate
    sclr_reg <= (sclr_i or count_to_reached) and not sset_i;
  end generate i_sset_over_sclr;
  sset_reg  <= sset_i;  -- for symmetry; makes the code look nicer
  sinit_reg <= sinit_i;

  i_load : if c_has_load = 1 generate
    load_i <= load;
  end generate i_load;

  i_noce_load: if enum_c_load_enable = load_overrides_ce generate
    load_cei <= load_i;
  end generate i_noce_load;
  i_ce_load: if enum_c_load_enable = ce_overrides_load generate
    load_cei <= load_i and ce_i;
  end generate i_ce_load;

  i_l : if c_has_l = 1 generate
    l_i <= l;
  end generate i_l;

                                      -- control the up_i signal
  i_up : if enum_c_count_mode = count_up generate
    up_i <= '1';
  end generate i_up;

  i_down : if enum_c_count_mode = count_down generate
    up_i <= '0';
  end generate i_down;

  i_updown : if enum_c_count_mode = count_updown generate
    up_i <= up;
  end generate i_updown;

                                      -- Threshhold outputs
  i_thresh0int : if c_has_thresh0 = 1 or c_has_q_thresh0 = 1 generate
    i_thr_early : if c_thresh_early = 1 generate
                                      -- Threshhold early; check if the _next_ value will be the threshhold value
                                      -- so that the clocked value will be on time
      thresh0_i <= '1' when q_next = ci_thresh0_val else '0'; --is_thresh0(q_next);
    end generate i_thr_early;
    i_no_thr_early : if c_thresh_early = 0 generate
                                      -- Ordinary threshhold; check if the _current_ value is the threshhold value
      thresh0_i <= '1' when q_i = ci_thresh0_val else '0'; --is_thresh0(q_i);
    end generate i_no_thr_early;
  end generate i_thresh0int;

--  i_thresh0int : if c_has_thresh0 = 1 or c_has_q_thresh0 = 1 generate
--    i_thr_early : if c_thresh_early = 1 generate
--      count_for_comparison <= q_next;
--    end generate i_thr_early;
--    i_no_thr_early : if c_thresh_early = 0 generate
--      count_for_comparison <= q_i;
--    end generate i_no_thr_early;
--    i_match_bits: for i in 0 to c_thresh0_rec.comp_width-1 generate
--      thresh0_match_bits(i) <= count_for_comparison(c_thresh0_rec.comp_bits(i));
--    end generate i_match_bits;
--    thresh0_i <= '1' when thresh0_match_bits(c_thresh0_rec.comp_width-1 downto 0) = c_thresh0_rec.comp_vect(c_thresh0_rec.comp_width-1 downto 0)
--                 else '0';
--  end generate i_thresh0int;


  i_out_thresh0 : if c_has_thresh0 = 1 generate
    thresh0 <= thresh0_i;
  end generate i_out_thresh0;

  i_out_q_thresh0 : if c_has_q_thresh0 = 1 generate
    q_thresh0 <= q_thresh0_i;

                                 -- Infer a flipflop to provide a synchronous thresh0 output
                                 -- Any of ACLR, ASET, AINIT, SSET, SCLR, SINIT will reset this flipflop.
    threshhold_flipflop : process (aclr, aset, ainit, clk)
    begin
      if c_has_aclr = 1 and aclr = '1' then
        q_thresh0_i <= '0';
      elsif c_has_aset = 1 and aset = '1' then
        q_thresh0_i <= '0';
      elsif c_has_ainit = 1 and ainit = '1' then
        q_thresh0_i <= '0';
      elsif rising_edge(clk) then
        if sclr_i = '1' then
          q_thresh0_i <= '0';
        elsif sset_i = '1' then  -- no need to check C_SYNC_PRIORITY since both pins do the same thing
          q_thresh0_i <= '0';
        elsif sinit_i = '1' then
          q_thresh0_i <= '0';
        elsif ce_reg = '1' then
          q_thresh0_i <= thresh0_i;
        end if;
      end if;
    end process threshhold_flipflop;
  end generate i_out_q_thresh0;

  -- END OF PREPARATION SECTION

  -- MAIN SECTION
  --
  -- All the counting is done here. Also value loading via port L, sync and async controls.
  --
  -- The preparation section has sorted out all the ce_i, ce_reg, etc signals
  -- and we can act as if they are all present, since some will be constant
  -- and optimised away.

  -- calculate the next value of Q asynchronously
  -- it is necessary to calculate this here rather than in the
  -- counter PROCESS for support of c_thresh_early.
  -- note that this doesn't take note of async or sync controls
  -- (ACLR, ASET, AINIT, SCLR, SSET, SINIT)

  -- the addsub baseblock has a good optimisation which allows the BYPASS (ie LOAD)
  -- functionality to be implemented within the adder LUTs - ie with no extra cost in LUTs.
  -- This optimisation is not possible in RTL since it uses the MULT_AND primitive
  -- in a funny way. Hence we instantiate an addsub, rather than duplicate intricate
  -- structural code.

--  clear_count <= sclr_i or (count_to_reached and not load_cei);
  clear_count <= sclr_i or (count_to_reached and ce_i and not load_i);
  --use the baseblox -legacy file that contains only the fabric addsub instead
  --of the top level c_addsub_v12_0_10
  --
  the_addsub : c_addsub_v12_0_10_legacy
    generic map (
      c_family        => c_family,
      c_a_width       => c_width,
      c_b_width       => c_width,
      c_out_width     => c_width,
      c_low_bit       => 0,
      c_high_bit      => c_width-1,
      c_add_mode      => count_mode2add_mode(enum_c_count_mode),
      c_a_type        => c_unsigned,
      c_b_type        => c_unsigned,
      c_b_constant    => 1,
      c_b_value       => c_count_by,
      c_bypass_enable => c_no_override,
      c_bypass_low    => c_load_low,
      c_pipe_stages   => 1,
      c_has_s         => c_thresh_early,
      c_has_aclr      => c_has_aclr,
      c_has_aset      => c_has_aset,
      c_has_ainit     => c_has_ainit,
      c_has_sclr      => the_addsub_has_sclr,
      c_has_sset      => c_has_sset,
      c_has_sinit     => c_has_sinit,
      c_has_ce        => c_has_ce,
      c_sync_priority => c_sync_priority,
      c_sync_enable   => c_sync_enable,
      c_has_q         => 1,
      c_has_c_in      => 0,
      c_has_c_out     => 0,
      c_has_q_c_out   => 0,
      c_has_b_in      => 0,
      c_has_b_out     => 0,
      c_has_q_b_out   => 0,
      c_has_ovfl      => 0,
      c_has_q_ovfl    => 0,
      c_has_a_signed  => 0,
      c_has_b_signed  => 0,
      c_has_add       => c_has_up,
      c_has_bypass    => c_has_load,
      c_sinit_val     => c_sinit_val,  -- the ADDSUB gets confused if the null string is passed
--      c_ainit_val     => "0",
      c_ainit_val     => c_ainit_val,
      c_enable_rlocs  => 0
      -- also no ainit,aset,aclr,sinit etc etc.
      )
    port map (
      clk    => clk,
      a      => q_i,
      b      => l_i,                    -- load data enters through b port.
      s      => q_next,
      q      => q_i,
      bypass => load_i,
      add    => up_i,
      aclr   => aclr,
      aset   => aset,
      ainit  => ainit,
      sclr   => clear_count,
      sset   => sset_i,
      sinit  => sinit_i,
--      ce     => ce_i
      ce     => ce_reg
      );

  q <= q_i;                           -- tie output to internal register

                                      -- END OF MAIN SECTION

end synth;



-- $ID: $
--
--  (c) Copyright 2007 Xilinx, Inc. All rights reserved.
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

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_pkg.all;

package c_counter_binary_v12_0_10_pkg is

  constant c_counter_binary_v12_0_10_max_pipe_stages : integer := 32;
  type t_counter_binary_v12_0_pipe is array (0 to c_counter_binary_v12_0_10_max_pipe_stages) of integer;

  type t_c_counter_binary_v12_0_10_latency is record
    used : integer;
    pipe : t_counter_binary_v12_0_pipe;
  end record;

  type t_c_counter_binary_v12_0_10_resources is record
    dsp48    : integer;
    bram18k  : integer;
    luts     : integer;
    ffs      : integer;
  end record;

  type t_counter_binary_v12_0_field_limits is record
                                           min : integer;
                                           max : integer;
                                         end record;

  function fn_counter_binary_v12_0_get_width_limits (
    p_xdevicefamily  : string;
    p_implementation : integer
    )
    return t_counter_binary_v12_0_field_limits;

  function fn_counter_binary_v12_0_get_latency_limits (
    p_xdevicefamily  : string;
    p_implementation : integer;
    p_latency        : integer;
    p_fast_op        : integer;
    p_fast_ip        : integer
    )
    return t_counter_binary_v12_0_field_limits;

  function fn_counter_binary_v12_0_check_generics (
    p_implementation      : integer := 0;
    p_verbosity           : integer := 0;
    p_xdevicefamily       : string  := "virtex2";
    p_width               : integer := 16;
    p_has_ce              : integer := 0;
    p_has_sclr            : integer := 0;
    p_restrict_count      : integer := 0;
    p_count_to            : string  := "0";
    p_count_by            : string  := "0";
    p_count_mode          : integer := 0;  -- 0=up, 1=down, 2=updown
    p_thresh0_value       : string  := "0";
    p_ce_overrides_sync   : integer := 0;  -- 0=override;
    p_has_thresh0         : integer := 0;
    p_has_load            : integer := 0;
    p_load_low            : integer := 0;
    p_latency             : integer := 0;
    p_fb_latency          : integer := 0;
    p_ainit_val           : string  := "0";
    p_sinit_val           : string  := "0";
    p_sclr_overrides_sset : integer := 1;  -- 0=set, 1=clear;
    p_has_sset            : integer := 0;
    p_has_sinit           : integer := 0
    ) return integer;

  function fn_c_counter_binary_v12_0_10_latency(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_implementation    : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sync : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_c_counter_binary_v12_0_10_latency;

  function fn_c_counter_binary_v12_0_10_fb_latency (
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_implementation    : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sync : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_c_counter_binary_v12_0_10_latency;

  function fn_c_counter_binary_v12_0_10_resources(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_implementation    : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sync : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_c_counter_binary_v12_0_10_resources;

  function fn_c_counter_binary_v12_0_10_use_baseblox (
    p_implementation : integer;
    p_latency        : integer;
    p_fb_latency     : integer;
    p_width          : integer)
    return boolean;

  component c_counter_binary_v12_0_10_legacy
    generic (
      c_family         : string  := "no_family";
      c_width          : integer := 16;
      c_restrict_count : integer := 0;
      c_count_to       : string  := "0";
      c_count_by       : string  := "1";
      c_count_mode     : integer := 0;  --c_up;
      c_thresh0_value  : string  := "0";
      c_thresh1_value  : string  := "0";
      c_thresh_early   : integer := 0;
      c_ainit_val      : string  := "0";
      c_sinit_val      : string  := "0";
      c_load_enable    : integer := 0;  --c_override;
      c_sync_enable    : integer := 0;  --c_override;
      c_sync_priority  : integer := 1;  --c_clear;
      c_pipe_stages    : integer := 0;
      c_has_thresh0    : integer := 0;
      c_has_q_thresh0  : integer := 0;
      c_has_thresh1    : integer := 0;
      c_has_q_thresh1  : integer := 0;
      c_has_ce         : integer := 0;
      c_has_up         : integer := 0;
      c_has_iv         : integer := 0;
      c_has_l          : integer := 0;
      c_has_load       : integer := 0;
      c_load_low       : integer := 0;
      c_has_aclr       : integer := 0;
      c_has_aset       : integer := 0;
      c_has_ainit      : integer := 0;
      c_has_sclr       : integer := 0;
      c_has_sset       : integer := 0;
      c_has_sinit      : integer := 0;
      c_enable_rlocs   : integer := 0
      );
    port (
      clk       : in  std_logic                            := '0';  -- Optional clock
      up        : in  std_logic                            := '1';  -- Controls direction of count - '1' = up.
      ce        : in  std_logic                            := '1';  -- Optional Clock enable
      load      : in  std_logic                            := '0';  -- Optional Synch load trigger
      l         : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- Optional Synch load value
      iv        : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- Optional Increment value
      aclr      : in  std_logic                            := '0';  -- Asynch init.
      aset      : in  std_logic                            := '0';  -- optional asynch set to '1'
      ainit     : in  std_logic                            := '0';  -- optional asynch reset to init_val
      sclr      : in  std_logic                            := '0';  -- Synch init.
      sset      : in  std_logic                            := '0';  -- optional synch set to '1'
      sinit     : in  std_logic                            := '0';  -- Optional synch reset to init_val
      thresh0   : out std_logic                            := '1';
      q_thresh0 : out std_logic                            := '1';
      thresh1   : out std_logic                            := '1';
      q_thresh1 : out std_logic                            := '1';
      q         : out std_logic_vector(c_width-1 downto 0)  -- Output value
      );

  end component;

  component c_counter_binary_v12_0_10_legacy_behv
    generic (
      c_family         : string  := "no_family";
      c_width          : integer := 16;
      c_restrict_count : integer := 0;
      c_count_to       : string  := "0";
      c_count_by       : string  := "1";
      c_count_mode     : integer := 0;  --c_up;
      c_thresh0_value  : string  := "0";
      c_thresh1_value  : string  := "0";
      c_thresh_early   : integer := 0;
      c_ainit_val      : string  := "0";
      c_sinit_val      : string  := "0";
      c_load_enable    : integer := 0;  --c_override;
      c_sync_enable    : integer := 0;  --c_override;
      c_sync_priority  : integer := 1;  --c_clear;
      c_pipe_stages    : integer := 0;
      c_has_thresh0    : integer := 0;
      c_has_q_thresh0  : integer := 0;
      c_has_thresh1    : integer := 0;
      c_has_q_thresh1  : integer := 0;
      c_has_ce         : integer := 0;
      c_has_up         : integer := 0;
      c_has_iv         : integer := 0;
      c_has_l          : integer := 0;
      c_has_load       : integer := 0;
      c_load_low       : integer := 0;
      c_has_aclr       : integer := 0;
      c_has_aset       : integer := 0;
      c_has_ainit      : integer := 0;
      c_has_sclr       : integer := 0;
      c_has_sset       : integer := 0;
      c_has_sinit      : integer := 0;
      c_enable_rlocs   : integer := 0
      );
    port (
      clk       : in  std_logic                            := '0';  -- Optional clock
      up        : in  std_logic                            := '1';  -- Controls direction of count - '1' = up.
      ce        : in  std_logic                            := '1';  -- Optional Clock enable
      load      : in  std_logic                            := '0';  -- Optional Synch load trigger
      l         : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- Optional Synch load value
      iv        : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- Optional Increment value
      aclr      : in  std_logic                            := '0';  -- Asynch init.
      aset      : in  std_logic                            := '0';  -- optional asynch set to '1'
      ainit     : in  std_logic                            := '0';  -- optional asynch reset to init_val
      sclr      : in  std_logic                            := '0';  -- Synch init.
      sset      : in  std_logic                            := '0';  -- optional synch set to '1'
      sinit     : in  std_logic                            := '0';  -- Optional synch reset to init_val
      thresh0   : out std_logic                            := '1';
      q_thresh0 : out std_logic                            := '1';
      thresh1   : out std_logic                            := '1';
      q_thresh1 : out std_logic                            := '1';
      q         : out std_logic_vector(c_width-1 downto 0)  -- Output value
      );

  end component;


end package c_counter_binary_v12_0_10_pkg;

package body c_counter_binary_v12_0_10_pkg is

  function fn_counter_binary_v12_0_get_width_limits (
    p_xdevicefamily  : string;
    p_implementation : integer
    )
    return t_counter_binary_v12_0_field_limits is
    variable ret_val : t_counter_binary_v12_0_field_limits;
  begin
    if p_implementation = 0 then
      ret_val.max := 256;
      ret_val.min := 1;
    else
      if has_dsp48(p_xdevicefamily) then
        ret_val.max := 35;
        ret_val.min := 1;
      else
        ret_val.max := 48;
        ret_val.min := 1;
      end if;
    end if;
    return ret_val;
  end fn_counter_binary_v12_0_get_width_limits;

  function fn_counter_binary_v12_0_get_latency_limits (
    p_xdevicefamily  : string;
    p_implementation : integer;
    p_latency        : integer;
    p_fast_op        : integer;
    p_fast_ip        : integer
    )
    return t_counter_binary_v12_0_field_limits is
    variable ret_val : t_counter_binary_v12_0_field_limits;
  begin
    return ret_val;
  end fn_counter_binary_v12_0_get_latency_limits;

  function fn_counter_binary_v12_0_check_generics (
    p_implementation      : integer := 0;
    p_verbosity           : integer := 0;
    p_xdevicefamily       : string  := "virtex2";
    p_width               : integer := 16;
    p_has_ce              : integer := 0;
    p_has_sclr            : integer := 0;
    p_restrict_count      : integer := 0;
    p_count_to            : string  := "0";
    p_count_by            : string  := "0";
    p_count_mode          : integer := 0;  -- 0=up, 1=down, 2=updown
    p_thresh0_value       : string  := "0";
    p_ce_overrides_sync   : integer := 0;  -- 0=override;
    p_has_thresh0         : integer := 0;
    p_has_load            : integer := 0;
    p_load_low            : integer := 0;
    p_latency             : integer := 0;
    p_fb_latency          : integer := 0;
    p_ainit_val           : string  := "0";
    p_sinit_val           : string  := "0";
    p_sclr_overrides_sset : integer := 1;  -- 0=set, 1=clear;
    p_has_sset            : integer := 0;
    p_has_sinit           : integer := 0
    ) return integer is
  variable v_dsp48_check_gens    : integer := 0;
  variable v_baseblox_check_gens : integer := 0;
  variable v_depth_limits        : t_counter_binary_v12_0_field_limits;
  variable v_width_limits        : t_counter_binary_v12_0_field_limits;
  constant ci_family             : string := c_xdevicefamily_to_c_family(p_xdevicefamily);

  begin
    ---------------------------------------------------------------------------
    -- Common Checks
    ---------------------------------------------------------------------------
    --C_HAS_CE
    if p_has_ce < 0 or p_has_ce >1 then
      assert false
        report "ERROR: c_counter_binary_v12_0_10: C_HAS_CE must be 0 or 1"
        severity error;
      return 1;
    end if;

    --C_CE_OVERRIDES_SYNC
    if p_ce_overrides_sync < 0 or p_ce_overrides_sync >1 then
      assert false
        report "ERROR: c_counter_binary_v12_0_10: C_CE_OVERRIDES_SYNC must be 0 or 1"
        severity error;
      return 1;
    end if;

    --C_HAS_SCLR
    if p_has_sclr < 0 or p_has_sclr >1 then
      assert false
        report "ERROR: c_counter_binary_v12_0_10: C_HAS_SCLR must be 0 or 1"
        severity error;
      return 1;
    end if;

    --C_WIDTH
    v_width_limits := fn_counter_binary_v12_0_get_width_limits(
      p_xdevicefamily  => p_xdevicefamily,
      p_implementation => p_implementation
      );
    if p_width < v_width_limits.min or p_width > v_width_limits.max then
      assert false
        report "ERROR: c_counter_binary_v12_0_10: width out of limits. Width = "&integer'image(p_width)
        severity error;
      return 1;
    end if;

    ---------------------------------------------------------------------------
    -- DSP48 checks
    ---------------------------------------------------------------------------
    if p_implementation = 1 then

      --C_XDEVICEFAMILY
       if not(supports_dsp48(p_xdevicefamily)>0 or supports_DSP48e(p_xdevicefamily)>0 or supports_dsp48a(p_xdevicefamily)>0) then
         assert false
           report "ERROR: c_counter_binary_v12_0_10: Chosen family is not supported for C_IMPLEMENTATION = 1"
           severity error;
         return 1;
       end if;

    end if;

    if p_implementation = 1 or p_latency /= 1 or p_fb_latency /= 0 then

       --C_WIDTH
       --Checked by xbip_counter_v3_0_3

       --C_HAS_SSET
       if p_has_sset /= 0 then
         assert false
           report "ERROR: c_counter_binary_v12_0_10: C_HAS_SSET = 1 is not supported for C_IMPLEMENTATION = 1 or C_LATENCY /=0 or C_FB_LATENCY /= 0"
           severity error;
         return 1;
       end if;

       --C_HAS_SINIT
       if p_has_sinit /= 0 then
         assert false
           report "ERROR: c_counter_binary_v12_0_10: C_HAS_SINIT = 1 is not supported for C_IMPLEMENTATION = 1 or C_LATENCY /=0 or C_FB_LATENCY /= 0"
           severity error;
         return 1;
       end if;

    else
      --   Let v9.1 handle it's own problems. The GUI will be inherited, so should
      --   already have equivalent checks.
      null;
    end if;
    return 0;
  end function fn_counter_binary_v12_0_check_generics;


  function fn_c_counter_binary_v12_0_10_latency(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_implementation    : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sync : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_c_counter_binary_v12_0_10_latency is
    variable ret_val : t_c_counter_binary_v12_0_10_latency;
    variable xbip_counter_lat : t_xbip_counter_v3_0_3_latency;
  begin
    if p_latency = -1 then
      xbip_counter_lat := fn_xbip_counter_v3_0_3_latency(
        p_xdevicefamily     => p_xdevicefamily    ,
        p_verbosity         => p_verbosity        ,
        p_use_dsp48         => p_implementation   ,
        p_latency           => p_latency          ,
        p_fb_latency        => p_fb_latency       ,
        p_width             => p_width            ,
        p_restrict_count    => p_restrict_count   ,
        p_count_to          => p_count_to         ,
        p_count_by          => p_count_by         ,
        p_count_mode        => p_count_mode       ,
        p_thresh0_value     => p_thresh0_value    ,
        p_ce_overrides_sclr => p_ce_overrides_sync,
        p_has_thresh0       => p_has_thresh0      ,
        p_has_load          => p_has_load         ,
        p_load_low          => p_load_low
        );
      ret_val.used := xbip_counter_lat.used;
    else
      ret_val.used := p_latency;
    end if;
    return ret_val;

  end function fn_c_counter_binary_v12_0_10_latency;

  function fn_c_counter_binary_v12_0_10_fb_latency (
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_implementation    : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sync : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_c_counter_binary_v12_0_10_latency is
    variable ret_val : t_c_counter_binary_v12_0_10_latency;
    variable xbip_counter_fb_lat : t_xbip_counter_v3_0_3_fb_latency;
  begin
    if p_fb_latency = -1 then
      xbip_counter_fb_lat := fn_xbip_counter_v3_0_3_get_fb_latency(
        p_width             => p_width,
        p_xdevicefamily     => p_xdevicefamily,
        p_fb_latency        => p_fb_latency,
        p_verbosity         => p_verbosity,
        p_use_dsp48         => p_implementation,
        p_latency           => p_latency,
        p_restrict_count    => p_restrict_count,
        p_count_to          => p_count_to,
        p_count_by          => p_count_by,
        p_count_mode        => p_count_mode,
        p_thresh0_value     => p_thresh0_value,
        p_ce_overrides_sclr => p_ce_overrides_sync,
        p_has_thresh0       => p_has_thresh0,
        p_has_load          => p_has_load,
        p_load_low          => p_load_low
        );
      ret_val.used := xbip_counter_fb_lat.used;
    else
      ret_val.used := p_fb_latency;
    end if;
    return ret_val;

  end function fn_c_counter_binary_v12_0_10_fb_latency;

  function fn_c_counter_binary_v12_0_10_resources(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_implementation    : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sync : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_c_counter_binary_v12_0_10_resources is
    variable ret_val : t_c_counter_binary_v12_0_10_resources;
    variable xbip_counter_resources : t_xbip_counter_v3_0_3_resources;
  begin
    if p_implementation = 0 and p_latency = 1 and p_fb_latency = 0 then
      --legacy - very rough estimates!
      ret_val.dsp48   := 0;
      ret_val.bram18k := 0;
      ret_val.luts    := p_width + (p_width * (p_restrict_count + p_has_thresh0)/4);
      ret_val.ffs     := p_width + p_has_thresh0;
    else
      xbip_counter_resources := fn_xbip_counter_v3_0_3_get_resources(
        p_xdevicefamily     => p_xdevicefamily,
        p_verbosity         => p_verbosity,
        p_use_dsp48         => p_implementation,
        p_latency           => p_latency,
        p_fb_latency        => p_fb_latency,
        p_width             => p_width,
        p_restrict_count    => p_restrict_count,
        p_count_to          => p_count_to,
        p_count_by          => p_count_by,
        p_count_mode        => p_count_mode,
        p_thresh0_value     => p_thresh0_value,
        p_ce_overrides_sclr => p_ce_overrides_sync,
        p_has_thresh0       => p_has_thresh0,
        p_has_load          => p_has_load,
        p_load_low          => p_load_low
        );
      ret_val.dsp48   := xbip_counter_resources.dsp48;
      ret_val.bram18k := xbip_counter_resources.bram18k;
      ret_val.luts    := xbip_counter_resources.luts;
      ret_val.ffs     := xbip_counter_resources.ffs;
    end if;
    return ret_val;
  end function fn_c_counter_binary_v12_0_10_resources;

  function fn_c_counter_binary_v12_0_10_use_baseblox (
    p_implementation : integer;
    p_latency        : integer;
    p_fb_latency     : integer;
    p_width          : integer)
    return boolean is
  begin
    if (p_implementation = 0 and p_latency = 1 and p_fb_latency = 0 and p_width > 1) then
      return true;
    end if;
    return false;
  end function fn_c_counter_binary_v12_0_10_use_baseblox;



end package body c_counter_binary_v12_0_10_pkg;


-- $ID :$
--
--  (c) Copyright 1995-2008 Xilinx, Inc. All rights reserved.
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
-- Synthesizable model
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

--replaced by legacy counter entity
--library c_counter_binary_v9_1;
--use c_counter_binary_v9_1.c_counter_binary_v9_1_viv_comp.all;

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_viv_comp.all;

library c_counter_binary_v12_0_10;
use c_counter_binary_v12_0_10.c_counter_binary_v12_0_10_pkg.all;

--core_if on entity c_counter_binary_v12_0_10_viv
  entity c_counter_binary_v12_0_10_viv is
    GENERIC (
      C_IMPLEMENTATION      : integer := 0;
      C_VERBOSITY           : integer := 0;
      C_XDEVICEFAMILY       : string  := "nofamily";  -- must be set
      C_WIDTH               : integer := 16;
      C_HAS_CE              : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_RESTRICT_COUNT      : integer := 0;
      C_COUNT_TO            : string  := "1";
      C_COUNT_BY            : string  := "1";
      C_COUNT_MODE          : integer := 0;           -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE       : string  := "1";
      C_CE_OVERRIDES_SYNC   : integer := 0;           -- 0=override;
      C_HAS_THRESH0         : integer := 0;
      C_HAS_LOAD            : integer := 0;
      C_LOAD_LOW            : integer := 0;
      C_LATENCY             : integer := 1;
      C_FB_LATENCY          : integer := 0;
      C_AINIT_VAL           : string  := "0";
      C_SINIT_VAL           : string  := "0";
      C_SCLR_OVERRIDES_SSET : integer := 1;           -- 0=set, 1=clear;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0
      );
    PORT (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      SSET    : in  std_logic                            := '0';              -- optional synch set to '1'
      SINIT   : in  std_logic                            := '0';              -- optional synch reset to init_val
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
--core_if off

  attribute secure_bitstream                                 : string;
  attribute secure_bitstream of c_counter_binary_v12_0_10_viv   : entity is "off";
  attribute secure_config                                    : string;
  attribute secure_config of c_counter_binary_v12_0_10_viv      : entity is "protect";
  attribute secure_netlist                                   : string;
  attribute secure_netlist of c_counter_binary_v12_0_10_viv     : entity is "encrypt";
  attribute secure_extras : string;
  attribute secure_extras of c_counter_binary_v12_0_10_viv     : entity is "A";
  attribute secure_net_editing                               : string;
  attribute secure_net_editing of c_counter_binary_v12_0_10_viv : entity is "off";

end c_counter_binary_v12_0_10_viv;



architecture synth of c_counter_binary_v12_0_10_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: removed restrict count circuitry for case of width = 1
  function fn_resolve_restrict_count (
    p_restrict_count : integer;
    p_width          : integer)
    return integer is
  begin  -- fn_resolve_restrict_count
    if p_width = 1 then
      return 0;
    end if;
    return p_restrict_count;
  end fn_resolve_restrict_count;
  constant ci_restrict_count : integer := fn_resolve_restrict_count(
    p_restrict_count => C_RESTRICT_COUNT,
    p_width          => C_WIDTH
    );
  
  constant check_gens : integer := fn_counter_binary_v12_0_check_generics (
    p_implementation      => C_IMPLEMENTATION,
    p_verbosity           => C_VERBOSITY,
    p_xdevicefamily       => C_XDEVICEFAMILY,
    p_width               => C_WIDTH,
    p_has_ce              => C_HAS_CE,
    p_has_sclr            => C_HAS_SCLR,
    p_restrict_count      => ci_restrict_count,
    p_count_to            => C_COUNT_TO,
    p_count_by            => C_COUNT_BY,
    p_count_mode          => C_COUNT_MODE,
    p_thresh0_value       => C_THRESH0_VALUE,
    p_ce_overrides_sync   => C_CE_OVERRIDES_SYNC,
    p_has_thresh0         => C_HAS_THRESH0,
    p_has_load            => C_HAS_LOAD,
    p_load_low            => C_LOAD_LOW,
    p_latency             => C_LATENCY,
    p_fb_latency          => C_FB_LATENCY,
    p_ainit_val           => C_AINIT_VAL,
    p_sinit_val           => C_SINIT_VAL,
    p_sclr_overrides_sset => C_SCLR_OVERRIDES_SSET,
    p_has_sset            => C_HAS_SSET,
    p_has_sinit           => C_HAS_SINIT
    );

  constant ci_latency : t_c_counter_binary_v12_0_10_latency := fn_c_counter_binary_v12_0_10_latency(
    p_xdevicefamily     => c_xdevicefamily,
    p_verbosity         => c_verbosity,
    p_implementation    => c_implementation,
    p_latency           => c_latency,
    p_fb_latency        => c_fb_latency,
    p_width             => c_width,
    p_restrict_count    => ci_restrict_count,
    p_count_to          => c_count_to,
    p_count_by          => c_count_by,
    p_count_mode        => c_count_mode,
    p_thresh0_value     => c_thresh0_value,
    p_ce_overrides_sync => c_ce_overrides_sync,
    p_has_thresh0       => c_has_thresh0,
    p_has_load          => c_has_load,
    p_load_low          => c_load_low
    );
  signal diag_latency : t_c_counter_binary_v12_0_10_latency := ci_latency;
  
  constant ci_fb_latency : t_c_counter_binary_v12_0_10_latency := fn_c_counter_binary_v12_0_10_fb_latency (
    p_xdevicefamily     => c_xdevicefamily,
    p_verbosity         => c_verbosity,
    p_implementation    => c_implementation,
    p_latency           => c_latency,
    p_fb_latency        => c_fb_latency,
    p_width             => c_width,
    p_restrict_count    => ci_restrict_count,
    p_count_to          => c_count_to,
    p_count_by          => c_count_by,
    p_count_mode        => c_count_mode,
    p_thresh0_value     => c_thresh0_value,
    p_ce_overrides_sync => c_ce_overrides_sync,
    p_has_thresh0       => c_has_thresh0,
    p_has_load          => c_has_load,
    p_load_low          => c_load_low
    );
  signal diag_fb_latency : t_c_counter_binary_v12_0_10_latency := ci_fb_latency;

  constant ci_resources : t_c_counter_binary_v12_0_10_resources := fn_c_counter_binary_v12_0_10_resources(
    p_xdevicefamily     => c_xdevicefamily,
    p_verbosity         => c_verbosity,
    p_implementation    => c_implementation,
    p_latency           => c_latency,
    p_fb_latency        => c_fb_latency,
    p_width             => c_width,
    p_restrict_count    => ci_restrict_count,
    p_count_to          => c_count_to,
    p_count_by          => c_count_by,
    p_count_mode        => c_count_mode,
    p_thresh0_value     => c_thresh0_value,
    p_ce_overrides_sync => c_ce_overrides_sync,
    p_has_thresh0       => c_has_thresh0,
    p_has_load          => c_has_load,
    p_load_low          => c_load_low
    );
  signal diag_resources : t_c_counter_binary_v12_0_10_resources := ci_resources;

  function fn_mode_to_up (
    p_mode : integer)
    return integer is
  begin  -- fn_mode_to_up
    if p_mode = 0 or p_mode = 1 then
      return 0;
    end if;
    return 1;
  end fn_mode_to_up;
  constant ci_has_up : integer := fn_mode_to_up(C_COUNT_MODE);

  constant ci_use_baseblox : boolean := fn_c_counter_binary_v12_0_10_use_baseblox(
    p_implementation => c_implementation,
    p_latency        => c_latency,
    p_fb_latency     => c_fb_latency,
    p_width          => c_width
    );

begin
  i_baseblox : if ci_use_baseblox generate
    constant ci_family : string := c_xdevicefamily_to_c_family(C_XDEVICEFAMILY);
  begin
    i_baseblox_counter : c_counter_binary_v12_0_10_legacy
      generic map (
        C_FAMILY         => ci_family,
        C_WIDTH          => C_WIDTH,
        C_RESTRICT_COUNT => ci_restrict_count,
        C_COUNT_TO       => C_COUNT_TO,
        C_COUNT_BY       => C_COUNT_BY,
        C_COUNT_MODE     => C_COUNT_MODE,
        C_THRESH0_VALUE  => C_THRESH0_VALUE,
        C_THRESH1_VALUE  => "0",
        C_THRESH_EARLY   => 1,
        C_AINIT_VAL      => C_AINIT_VAL,
        C_SINIT_VAL      => C_SINIT_VAL,
        C_LOAD_ENABLE    => 1,          --subject to CE
        C_SYNC_ENABLE    => C_CE_OVERRIDES_SYNC,
        C_SYNC_PRIORITY  => C_SCLR_OVERRIDES_SSET,
        C_PIPE_STAGES    => 0,
        C_HAS_THRESH0    => 0,
        C_HAS_Q_THRESH0  => C_HAS_THRESH0,
        C_HAS_THRESH1    => 0,
        C_HAS_Q_THRESH1  => 0,
        C_HAS_CE         => C_HAS_CE,
        C_HAS_UP         => ci_has_up,
        C_HAS_IV         => 0,
        C_HAS_L          => C_HAS_LOAD,
        C_HAS_LOAD       => C_HAS_LOAD,
        C_LOAD_LOW       => C_LOAD_LOW,
        C_HAS_ACLR       => 0,
        C_HAS_ASET       => 0,
        C_HAS_AINIT      => 0,
        C_HAS_SCLR       => C_HAS_SCLR,
        C_HAS_SSET       => C_HAS_SSET,
        C_HAS_SINIT      => C_HAS_SINIT,
        C_ENABLE_RLOCS   => 0
        )
      port map(
        CLK       => CLK,
        UP        => UP,
        CE        => CE,
        LOAD      => LOAD,
        L         => L,
        ACLR      => '0',
        ASET      => '0',
        AINIT     => '0',
        SCLR      => SCLR,
        SSET      => SSET,
        SINIT     => SINIT,
        THRESH0   => open,
        Q_THRESH0 => THRESH0,
        THRESH1   => open,
        Q_THRESH1 => open,
        Q         => Q
        );

  end generate i_baseblox;
  
  i_baseip : if not(ci_use_baseblox) generate
    i_xbip_counter : xbip_counter_v3_0_3_viv
      generic map(
      C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
      C_VERBOSITY         => C_VERBOSITY,
      C_USE_DSP48         => C_IMPLEMENTATION,
      C_HAS_CE            => C_HAS_CE,
      C_HAS_SCLR          => C_HAS_SCLR,
      C_LATENCY           => C_LATENCY,
      C_FB_LATENCY        => C_FB_LATENCY,
      C_WIDTH             => C_WIDTH,
      C_RESTRICT_COUNT    => ci_restrict_count,
      C_COUNT_TO          => C_COUNT_TO,
      C_COUNT_BY          => C_COUNT_BY,
      C_COUNT_MODE        => C_COUNT_MODE,
      C_THRESH0_VALUE     => C_THRESH0_VALUE,
      C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SYNC,
      C_HAS_THRESH0       => C_HAS_THRESH0,
      C_HAS_LOAD          => C_HAS_LOAD,
      C_LOAD_LOW          => C_LOAD_LOW
      )
    port map (
      CLK     => CLK,
      CE      => CE,
      SCLR    => SCLR,
      UP      => UP,
      LOAD    => LOAD,
      L       => L,
      THRESH0 => THRESH0,
      Q       => Q
      );
       
  end generate i_baseip;
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

library ieee;
use ieee.std_logic_1164.all;

library c_counter_binary_v12_0_10;
use c_counter_binary_v12_0_10.c_counter_binary_v12_0_10_viv_comp.all;

entity c_counter_binary_v12_0_10 is
  generic (
      C_IMPLEMENTATION      : integer := 0;
      C_VERBOSITY           : integer := 0;
      C_XDEVICEFAMILY       : string  := "nofamily";  -- must be set
      C_WIDTH               : integer := 16;
      C_HAS_CE              : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_RESTRICT_COUNT      : integer := 0;
      C_COUNT_TO            : string  := "1";
      C_COUNT_BY            : string  := "1";
      C_COUNT_MODE          : integer := 0;           -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE       : string  := "1";
      C_CE_OVERRIDES_SYNC   : integer := 0;           -- 0=override;
      C_HAS_THRESH0         : integer := 0;
      C_HAS_LOAD            : integer := 0;
      C_LOAD_LOW            : integer := 0;
      C_LATENCY             : integer := 1;
      C_FB_LATENCY          : integer := 0;
      C_AINIT_VAL           : string  := "0";
      C_SINIT_VAL           : string  := "0";
      C_SCLR_OVERRIDES_SSET : integer := 1;           -- 0=set, 1=clear;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0
      );
  port (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      SSET    : in  std_logic                            := '0';              -- optional synch set to '1'
      SINIT   : in  std_logic                            := '0';              -- optional synch reset to init_val
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
--core_if off

end entity c_counter_binary_v12_0_10;

architecture xilinx of c_counter_binary_v12_0_10 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  i_synth : c_counter_binary_v12_0_10_viv
  generic map (
    C_IMPLEMENTATION => C_IMPLEMENTATION,
    C_VERBOSITY => C_VERBOSITY,
    C_XDEVICEFAMILY => C_XDEVICEFAMILY,
    C_WIDTH => C_WIDTH,
    C_HAS_CE => C_HAS_CE,
    C_HAS_SCLR => C_HAS_SCLR,
    C_RESTRICT_COUNT => C_RESTRICT_COUNT,
    C_COUNT_TO => C_COUNT_TO,
    C_COUNT_BY => C_COUNT_BY,
    C_COUNT_MODE => C_COUNT_MODE,
    C_THRESH0_VALUE => C_THRESH0_VALUE,
    C_CE_OVERRIDES_SYNC => C_CE_OVERRIDES_SYNC,
    C_HAS_THRESH0 => C_HAS_THRESH0,
    C_HAS_LOAD => C_HAS_LOAD,
    C_LOAD_LOW => C_LOAD_LOW,
    C_LATENCY => C_LATENCY,
    C_FB_LATENCY => C_FB_LATENCY,
    C_AINIT_VAL => C_AINIT_VAL,
    C_SINIT_VAL => C_SINIT_VAL,
    C_SCLR_OVERRIDES_SSET => C_SCLR_OVERRIDES_SSET,
    C_HAS_SSET => C_HAS_SSET,
    C_HAS_SINIT => C_HAS_SINIT
  )
  port map (
    CLK => CLK,
    CE => CE,
    SCLR => SCLR,
    SSET => SSET,
    SINIT => SINIT,
    UP => UP,
    LOAD => LOAD,
    L => L,
    THRESH0 => THRESH0,
    Q => Q
  );
  
end architecture xilinx;




