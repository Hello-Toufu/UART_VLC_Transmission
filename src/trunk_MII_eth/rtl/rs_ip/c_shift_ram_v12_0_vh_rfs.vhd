-- $RCSfile: c_shift_ram_v12_0_10_viv_comp.vhd,v $ $Revision: 1.6 $ $Date: 2010/09/08 11:23:25 $
--
--  (c) Copyright 1995-2009 Xilinx, Inc. All rights reserved.
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

package c_shift_ram_v12_0_10_viv_comp is

----------------------------------------------------------
-- Insert component declaration of top level xst file here
----------------------------------------------------------
  --core_if on component c_shift_ram_v12_0_10_viv
  component c_shift_ram_v12_0_10_viv
    generic (
      C_XDEVICEFAMILY      : string  := "no_family"; 
      C_VERBOSITY          : integer := 0;  --0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_WIDTH              : integer := 16;  -- default is 16
      C_DEPTH              : integer := 16;  -- srl16 depth (default = 16 = 1x srl16) 
      C_ADDR_WIDTH         : integer := 4;  -- dependent on c_width value specified
      C_SHIFT_TYPE         : integer := 0; --  -- 0=fixed, 1=lossless
      C_OPT_GOAL           : integer := 0;  -- 0=area, 1=speed
      C_AINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output
      C_SINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output    
      C_DEFAULT_DATA       : string  := "0000000000000000";  -- no init details, use this val
      C_HAS_A              : integer := 0;  -- address bus only exists for var length
      C_HAS_CE             : integer := 0;
      C_REG_LAST_BIT       : integer := 0;  -- register last output bit (with ff)
      C_SYNC_PRIORITY      : integer := 1;  -- applies only to registered output
      C_SYNC_ENABLE        : integer := 0;  -- applies only to registered output
      C_HAS_SCLR           : integer := 0;  -- applies only to registered output
      C_HAS_SSET           : integer := 0;  -- applies only to registered output
      C_HAS_SINIT          : integer := 0;  -- applies only to registered output
      C_MEM_INIT_FILE      : string  := "init.mif";
      C_ELABORATION_DIR    : string  := "./";
      C_READ_MIF           : integer := 0;
      C_PARSER_TYPE        : integer := 0   -- 0:Verific, 1:Classic Parser
      );
    port (
      A     : in  std_logic_vector(c_addr_width-1 downto 0) := (others => '0');
      D     : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      CLK   : in  std_logic := '0';
      CE    : in  std_logic := '1';
      SCLR  : in  std_logic := '0';
      SSET  : in  std_logic := '0';
      SINIT : in  std_logic := '0';
      Q     : out std_logic_vector(c_width-1 downto 0) := (others => '0')
      );
    --core_if off
  END COMPONENT;


end c_shift_ram_v12_0_10_viv_comp;



-- $RCSfile: c_shift_ram_v12_0_10_comp.vhd,v $ $Revision: 1.6 $ $Date: 2010/09/08 11:23:24 $
--
--  (c) Copyright 1995-2009 Xilinx, Inc. All rights reserved.
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

library IEEE;
use IEEE.std_logic_1164.all;


package c_shift_ram_v12_0_10_comp is

  --core_if on component c_shift_ram_v12_0_10
  component c_shift_ram_v12_0_10
    generic (
      C_XDEVICEFAMILY      : string  := "no_family"; 
      C_VERBOSITY          : integer := 0;  --0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_WIDTH              : integer := 16;  -- default is 16
      C_DEPTH              : integer := 16;  -- srl16 depth (default = 16 = 1x srl16) 
      C_ADDR_WIDTH         : integer := 4;  -- dependent on c_width value specified
      C_SHIFT_TYPE         : integer := 0; --  -- 0=fixed, 1=lossless
      C_OPT_GOAL           : integer := 0;  -- 0=area, 1=speed
      C_AINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output
      C_SINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output    
      C_DEFAULT_DATA       : string  := "0000000000000000";  -- no init details, use this val
      C_HAS_A              : integer := 0;  -- address bus only exists for var length
      C_HAS_CE             : integer := 0;
      C_REG_LAST_BIT       : integer := 0;  -- register last output bit (with ff)
      C_SYNC_PRIORITY      : integer := 1;  -- applies only to registered output
      C_SYNC_ENABLE        : integer := 0;  -- applies only to registered output
      C_HAS_SCLR           : integer := 0;  -- applies only to registered output
      C_HAS_SSET           : integer := 0;  -- applies only to registered output
      C_HAS_SINIT          : integer := 0;  -- applies only to registered output
      C_MEM_INIT_FILE      : string  := "init.mif";
      C_ELABORATION_DIR    : string  := "./";
      C_READ_MIF           : integer := 0;
      C_PARSER_TYPE        : integer := 0   -- 0:Verific, 1:Classic Parser
      );
    port (
      A     : in  std_logic_vector(c_addr_width-1 downto 0) := (others => '0');
      D     : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      CLK   : in  std_logic := '0';
      CE    : in  std_logic := '1';
      SCLR  : in  std_logic := '0';
      SSET  : in  std_logic := '0';
      SINIT : in  std_logic := '0';
      Q     : out std_logic_vector(c_width-1 downto 0) := (others => '0')
      );
    --core_if off
  END COMPONENT;


END c_shift_ram_v12_0_10_comp;


-- $Id: prim_wrappers_v12_0_legacy.vhd,v 1.5 2010/03/19 10:50:51 julian Exp $
--------------------------------------------------------------------------------
--  (c) Copyright 1995-2005, 2009 Xilinx, Inc. All rights reserved.
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
-- Abstraction of primitives for Shift RAM to reduce code size,
-- handle conversions to bitvectors and equalise address interfaces
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- wrapper for an FDE
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity flop is
  generic (
    finit :     std_logic_vector(0 downto 0) := (others => '0'));
  port (
    d     : in  std_logic;
    clk   : in  std_logic;
    ce    : in  std_logic;
    q     : out std_logic);
end entity flop;

architecture xilinx of flop is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

  signal q_i : std_logic := finit(0);
begin  -- ARCHITECTURE xilinx
  process (clk) is
  begin
    if rising_edge(clk) then
      if ce = '1' then
        q_i <= d;
      end if;
    end if;
  end process;
  q         <= q_i;
end architecture xilinx;

-------------------------------------------------------------------------------
-- wrapper for an SRLCxE primitive to allow more compact code
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

entity sr is
  generic (
    addr_width :     integer;
    use_carry  :     integer;
    srinit     :     std_logic_vector);
  port (
    d          : in  std_logic;
    clk        : in  std_logic;
    a          : in  std_logic_vector(addr_width-1 downto 0) := (others => '1');
    ce         : in  std_logic                               := '1';
    q          : out std_logic;
    qcarry     : out std_logic);
end entity sr;

architecture xilinx of sr is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin  -- ARCHITECTURE xilinx
  nocarry    : if use_carry = 0 and addr_width = 4 generate
    shreg    : SRL16E
      generic map (
        INIT => to_bitvector(srinit))
      port map (
        D    => d,
        CLK  => clk,
        A0   => a(0),
        A1   => a(1),
        A2   => a(2),
        A3   => a(3),
        CE   => ce,
        Q    => q);
  end generate nocarry;
  usecarry16 : if use_carry = 1 and addr_width = 4 generate
    shreg    : SRLC16E
      generic map (
        INIT => to_bitvector(srinit))
      port map (
        D    => d,
        CLK  => clk,
        A0   => a(0),
        A1   => a(1),
        A2   => a(2),
        A3   => a(3),
        CE   => ce,
        Q    => q,
        Q15  => qcarry);
  end generate usecarry16;
  usecarry32 : if addr_width = 5 generate
    shreg    : SRLC32E
      generic map (
        INIT => to_bitvector(srinit))
      port map (
        D    => d,
        CLK  => clk,
        A    => a,
        CE   => ce,
        Q    => q,
        Q31  => qcarry);
  end generate usecarry32;

end architecture xilinx;

library ieee;
use ieee.std_logic_1164.all;

entity srl_clb is
  generic (
    pipe_ff_pos :     integer;
    clbinit     :     std_logic_vector);
  port (
    d           : in  std_logic;
    clk         : in  std_logic;
    ce          : in  std_logic;
    q           : out std_logic);
end entity srl_clb;

architecture xilinx of srl_clb is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

  signal                         srl_sig : std_logic_vector(0 to pipe_ff_pos) := clbinit;
  signal                         q_i     : std_logic                          := '0';
  -- Use a Keep on the intermediate output signal to
  -- stop XST pulling the output FF into another delay line
  attribute keep                         : string;
  attribute keep of q_i                  : signal is "true";
begin  -- ARCHITECTURE xilinx
  process (clk) is
  begin
    if rising_edge(clk) THEN
      IF ce = '1' THEN
        srl_sig <= d & srl_sig(0 TO pipe_ff_pos-1);
      END IF;
    END IF;
  END PROCESS;
  q_i           <= srl_sig(pipe_ff_pos);
  q             <= q_i;
END ARCHITECTURE xilinx;



-- $Id: c_shift_ram_v12_0_10_pkg.vhd,v 1.5 2010/03/19 10:50:51 julian Exp $
--
--  (c) Copyright 2007, 2009 Xilinx, Inc. All rights reserved.
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
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

package c_shift_ram_v12_0_10_pkg is


  -----------------------------------------------------------------------------
  -- Independent Types (not based on generics or generic-derived constants)
  -----------------------------------------------------------------------------

  -- Enumerated type to describe which type of primitive we are trying to initialise
  type T_PRIM is (SRL16, SRL32, REG);


  -----------------------------------------------------------------------------
  -- Function declarations
  -----------------------------------------------------------------------------

  function fn_c_shift_ram_v12_0_10_check_generics(c_verbosity, c_width, c_depth, c_has_a, c_addr_width, c_opt_goal, c_shift_type, c_reg_last_bit, c_generate_mif                 : integer;
                                               c_has_ainit, c_has_aclr, c_has_aset, c_has_sinit, c_has_sclr, c_has_sset, c_has_ce, c_sync_priority, c_sync_enable, c_read_mif : integer;
                                               srl_depth                                                                                                                      : integer;
                                               c_default_data, c_family                                                                                                       : string) return integer;
  function fn_count_rams(c_depth, c_reg_last_bit, c_shift_type, srl_depth                                                     : integer) return integer;
  function fn_gen_last_reg_addr(c_depth, c_reg_last_bit, srl_depth, srl_addr_width                                            : integer) return std_logic_vector;
  function fn_get_real_depth(addr_width, depth, shift_type, reg_last_bit, srl_depth                                           : integer) return integer;
  function fn_get_fixed_depth(depth, c_reg_last_bit, c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit : integer) return integer;
  function fn_check_reg_ctrls(c_has_sclr, c_has_sset, c_has_sinit, c_has_aclr, c_has_aset, c_has_ainit, c_reg_last_bit        : integer) return integer;
  function fn_get_srl_depth (family                                                                                           : string; depth : integer) return integer;
  function fn_get_srl_addr_width(family                                                                                       : string; depth : integer) return integer;
  function get_chain_depth(depth, srl_depth                                                                                   : integer) return integer;
  function fn_get_depth_from_mode(inferred_sr_depth, real_depth, shift_type                                                   : integer) return integer;
  function fn_get_srl_prim(family                                                                                             : string; depth : integer) return T_PRIM;
  function check_mixed_reg_ctrls(c_has_aclr, c_has_aset, c_has_sclr, c_has_sset, c_has_ainit, c_has_sinit, c_reg_last_bit     : integer) return boolean;
  function use_keep (shift_type, opt_goal                                                                                     : integer; mixed_reg_ctrls : boolean) return string;
  function fn_get_pipe_ff_pos(fam                                                                                             : string) return integer;
  function fn_get_addr (family                                                                                                : string; ctrls_used : integer; last_srl_addr : std_logic_vector; last_srl_addr_minus_one : std_logic_vector; srl_addr_width : integer) return std_logic_vector;
  function get_addr_space(depth                                                                                               : integer) return integer;
  function use_output_register (reg_last_bit, shift_type, opt_goal, depth, ff_controls_used, srl_depth                        : integer) return boolean;

end package c_shift_ram_v12_0_10_pkg;

-------------------------------------------------------------------------------

package body c_shift_ram_v12_0_10_pkg is


  -- purpose: verifies that the supplied generics are legal for the core
  function fn_c_shift_ram_v12_0_10_check_generics(c_verbosity, c_width, c_depth, c_has_a, c_addr_width, c_opt_goal, c_shift_type, c_reg_last_bit, c_generate_mif                 : integer;
                                               c_has_ainit, c_has_aclr, c_has_aset, c_has_sinit, c_has_sclr, c_has_sset, c_has_ce, c_sync_priority, c_sync_enable, c_read_mif : integer;
                                               srl_depth                                                                                                                      : integer;
                                               c_default_data, c_family                                                                                                       : string)
    return integer is

    constant error_string : string := "ERROR: c_shift_ram_v12_0_10_legacy : ";
    constant warn_string  : string := "WARNING: c_shift_ram_v12_0_10_legacy : ";
    constant note_string  : string := "NOTE: c_shift_ram_v12_0_10_legacy : ";

  begin

    -- No need to check family support; XCD limits what families can be used
    --WLM ASSERT c_family = "spartan3" OR c_family = "virtex4" OR c_family = "virtex5" OR c_family = "spartan6" or c_family = "virtex6"
    --WLM REPORT "ERROR: c_shift_ram_v12_0_10_legacy: Valid c_family values are (case-sensitive): spartan3, spartan6, virtex4, virtex5, virtex6"
    --WLM SEVERITY error;

    -- Ensure generic values are sensible
    assert c_shift_type = 0 or c_shift_type = 1
      report error_string & "Invalid c_shift_type value found - must be c_fixed(0), c_variable_lossless(1)"
      severity failure;
    assert c_opt_goal = c_area or c_opt_goal = c_speed report error_string & "Invalid c_opt_goal value found - must be 0 or 1" severity failure;
    assert c_has_a = 0 or c_has_a = 1 report error_string & "Invalid c_has_a value found - must be 0 or 1" severity failure;
    assert c_has_ce = 0 or c_has_ce = 1 report error_string & "Invalid c_has_ce value found - must be 0 or 1" severity failure;
    assert c_reg_last_bit = 0 or c_reg_last_bit = 1 report error_string & "Invalid c_reg_last_bit value found - must be 0 or 1" severity failure;
    assert c_sync_priority = 0 or c_sync_priority = 1 report error_string & "Invalid c_sync_priority value found - must be 0 or 1" severity failure;
    assert c_sync_enable = 0 or c_sync_enable = 1 report error_string & "Invalid c_sync_enable value found - must be 0 or 1" severity failure;
    assert c_has_aclr = 0 or c_has_aclr = 1 report error_string & "Invalid c_has_aclr value found - must be 0 or 1" severity failure;
    assert c_has_aset = 0 or c_has_aset = 1 report error_string & "Invalid c_has_aset value found - must be 0 or 1" severity failure;
    assert c_has_ainit = 0 or c_has_ainit = 1 report error_string & "Invalid c_has_ainit value found - must be 0 or 1" severity failure;
    assert c_has_sclr = 0 or c_has_sclr = 1 report error_string & "Invalid c_has_sclr value found - must be 0 or 1" severity failure;
    assert c_has_sset = 0 or c_has_sset = 1 report error_string & "Invalid c_has_sset value found - must be 0 or 1" severity failure;
    assert c_has_sinit = 0 or c_has_sinit = 1 report error_string & "Invalid c_has_sinit value found - must be 0 or 1" severity failure;
    assert c_read_mif = 0 or c_read_mif = 1 report error_string & "Invalid c_read_mif value found - must be 0 or 1" severity failure;
    assert c_generate_mif = 0 report warn_string & "Writing of .mif files is not supported in this core version" severity warning;

    assert c_width > 0 and c_width < 257 report error_string & "Invalid width value - the valid range is 1 to 256 inclusive" severity failure;

    if c_reg_last_bit = 0 then
      if c_verbosity > 0 then
        assert c_has_ainit = 0 and c_has_aclr = 0 and c_has_aset = 0 report warn_string & "Asynchronous controls not available without registered output" severity warning;
        assert c_has_sinit = 0 and c_has_sclr = 0 and c_has_sset = 0 report warn_string & "Synchronous controls not available without registered output" severity warning;
      end if;
    else                                -- c_reg_last_bit /= 0
      assert c_has_ainit = 0 or (c_has_aclr = 0 and c_has_aset = 0)
        report error_string & "ASET and/or ACLR cannot exist in conjunction with AINIT"
        severity failure;
      assert c_has_sinit = 0 or (c_has_sclr = 0 and c_has_sset = 0)
        report error_string & "SSET and/or SCLR cannot exist in conjunction with SINIT"
        severity failure;
    end if;

    if c_verbosity > 0 then
      assert not((c_has_ainit /= 0 or c_has_aclr /= 0 or c_has_aset /= 0) and (c_has_sinit /= 0 or c_has_sclr /= 0 or c_has_sset /= 0) and c_reg_last_bit /= 0)
        report warn_string & "Including both asynchronous (aclr, aset or ainit) AND synchronous controls " &
        "(sclr, sset or sinit) will add a layer of logic and impact performance"
        severity warning;
    end if;

    if c_verbosity > 1 then
      assert not(c_opt_goal = c_speed and not(c_shift_type = c_fixed)) report note_string & "Optimising for speed" severity note;
      assert not(c_opt_goal = c_speed and (c_has_aclr /= 0 or c_has_aset /= 0 or c_has_ainit /= 0 or c_has_sclr /= 0 or c_has_sset /= 0 or c_has_sinit /= 0) and c_reg_last_bit /= 0 and c_shift_type = c_variable_lossless)
        report note_string & "Register controls will only be implemented on the output register and not on pipeline registers" severity note;
      assert not(c_opt_goal = c_speed and c_has_ce /= 0 and c_shift_type = c_variable_lossless) report note_string & "CE controls will be implemented on all pipeline registers in addition to the output register, if selected" severity note;

      assert not(c_opt_goal = c_area and not(c_shift_type = c_fixed)) report note_string & "Optimising for area" severity note;
    end if;

    if c_shift_type = c_fixed then
      if c_verbosity > 0 then
        assert c_has_a = 0 report warn_string & "Address bus not required for fixed-length shift register" severity warning;
      end if;
      if c_depth /= 0 and not(c_depth = 1 and c_reg_last_bit = 1) then
        if c_reg_last_bit /= 0 then
          assert c_depth > 1 and c_depth < 1090 report error_string & "Invalid RAM depth value for registered output - the valid range is 2 to 1089 inclusive" severity failure;
        else
          assert c_depth > 0 and c_depth < 1089 report error_string & "Invalid RAM depth value - the valid range is 1 to 1088 inclusive" severity failure;
        end if;
      end if;
    end if;

    if c_shift_type = c_variable_lossless then
      assert c_has_a /= 0 report error_string & "Variable-length register must have an address bus input" severity failure;

      assert c_addr_width > 0 report error_string & "c_addr_width must be at least 1 bit wide" severity failure;

      -- V9.1 UPDATE
      -- Just use warnings rather than errors for these depths - this provides backwards-compatability for users who previously just set the address width
      -- to be 4 for all depths <= 16
      if c_depth <= 2 then
        if c_verbosity > 0 then
          assert c_addr_width = 1 report warn_string & "Address bus should be 1 for this memory depth - only bits (0 downto 0) will be used" severity warning;
        end if;
      elsif c_depth > 2 and c_depth <= 4 then
        if c_verbosity > 0 then
          assert c_addr_width = 2 report warn_string & "Address bus should be 2 for this memory depth - only bits (1 downto 0) will be used" severity warning;
        end if;
      elsif c_depth > 4 and c_depth <= 8 then
        if c_verbosity > 0 then
          assert c_addr_width = 3 report warn_string & "Address bus should be 3 for this memory depth - only bits (2 downto 0) will be used" severity warning;
        end if;
      elsif c_depth > 8 and c_depth <= 16 then
        if c_verbosity > 0 then
          assert c_addr_width = 4 report warn_string & "Address bus should be 4 for this memory depth - only bits (3 downto 0) will be used" severity warning;
        end if;
      elsif c_depth > 16 and c_depth <= 32 then
        assert c_addr_width = 5 report error_string & "Address bus width should be 5 for this memory depth" severity failure;
      elsif c_depth > 32 and c_depth <= 64 then
        assert c_addr_width = 6 report error_string & "Address bus width should be 6 for this memory depth" severity failure;
      elsif c_depth > 64 and c_depth <= 128 then
        assert c_addr_width = 7 report error_string & "Address bus width should be 7 for this memory depth" severity failure;
      elsif c_depth > 128 and c_depth <= 256 then
        assert c_addr_width = 8 report error_string & "Address bus width should be 8 for this memory depth" severity failure;
      elsif c_depth > 256 and c_depth <= 512 then
        assert c_addr_width = 9 report error_string & "Address bus width should be 9 for this memory depth" severity failure;
      elsif c_depth > 512 and c_depth <= 1024 then
        assert c_addr_width = 10 report error_string & "Address bus width should be 10 for this memory depth" severity failure;
      end if;

      case c_reg_last_bit is
        when 0 =>
          if c_shift_type = c_variable_lossless then
            case c_opt_goal is
              when 0 => assert c_depth > 0 and c_depth < 1025
                               report error_string & "Invalid depth value for variable-length RAM - minimum is 1, maximum is 1024" severity failure;  -- area, no reg
              when 1 => assert c_depth > 0 and c_depth < 1025
                               report error_string & "Invalid depth value for variable-length RAM - minimum is 1, maximum is 1024" severity failure;  -- speed, no reg
                             if c_verbosity > 1 then
                               if c_depth > srl_depth and c_depth < (8*srl_depth)+1 then
                                 assert false
                                   report note_string & "The minimum shift register delay will be 2 cycles with no registered output" severity note;
                               end if;
                               if c_depth > 8*srl_depth and c_depth < 1027 then
                                 assert false
                                   report note_string & "Implementing pipelining inside the multiplexer - the minimum shift register delay will be 3 cycles" severity note;
                               end if;
                             end if;
              when others => null;

            end case;
          end if;
        when 1 =>
          if c_shift_type = c_variable_lossless then
            case c_opt_goal is
              when 0 => assert c_depth > 1 and c_depth < 1026
                               report error_string & "Invalid depth value for variable-length RAM - minimum delay selectable is 2, maximum is 1025 due to output register" severity failure;  -- area, reg
              when 1 => assert c_depth > 1 and c_depth < 1026
                               report error_string & "Invalid depth value for variable-length RAM - minimum delay selectable is 2, maximum is 1025 due to output register" severity failure;  -- speed, reg
                             if c_verbosity > 1 then
                               if c_depth > srl_depth and c_depth < (8*srl_depth)+1 then
                                 assert false
                                   report note_string & "The minimum shift register delay will be 3 cycles with a registered output" severity note;
                               end if;
                               if c_depth > (8*srl_depth) and c_depth < 1026 then
                                 assert false
                                   report note_string & "Implementing pipelining inside the multiplexer - the minimum shift register delay will be 4 cycles with a registered output" severity note;
                               end if;
                             end if;
              when others => null;
            end case;
          end if;
        when others => null;
      end case;
    end if;
    if c_verbosity > 1 then
      report note_string & "completed check generics" severity note;
    end if;
    return 0;
  end fn_c_shift_ram_v12_0_10_check_generics;


  function fn_count_rams(c_depth, c_reg_last_bit, c_shift_type, srl_depth : integer) return integer is
    variable temp_depth : integer := c_depth;
    variable count_rams : integer := 0;
  begin
    if c_shift_type /= 0 then
      -- The value returned by the function is the total number of SRL16s or SRL32s used in the lossless shift RAM
      while temp_depth > srl_depth-1 loop
        temp_depth := temp_depth - srl_depth;
        count_rams := count_rams + 1;
      end loop;
      if temp_depth > 0 then
        return count_rams + 1;
      else
        return count_rams;
      end if;
    else
      return count_rams;
    end if;
  end function fn_count_rams;

                                        -- purpose: Calculates the address vector for the final RAM in the chain
  function fn_gen_last_reg_addr(c_depth, c_reg_last_bit, srl_depth, srl_addr_width : integer) return std_logic_vector is
    variable temp_depth : integer := c_depth;
  begin
    if temp_depth = 0 or temp_depth = 1 then
      return std_logic_vector(To_unsigned(0, srl_addr_width));
    elsif temp_depth < (srl_depth+1) then
      if c_reg_last_bit = 0 then
        return std_logic_vector(To_unsigned(temp_depth - 1, srl_addr_width));
      else
        return std_logic_vector(To_unsigned(temp_depth - 2, srl_addr_width));
      end if;
    else
      while temp_depth > srl_depth loop
        temp_depth := temp_depth - (srl_depth+1);
      end loop;
      if temp_depth > 0 then
        if c_reg_last_bit = 0 then
          return std_logic_vector(To_unsigned(temp_depth - 1, srl_addr_width));
        else
          if temp_depth = 1 then
                                        -- case where we can use a double output register
            return std_logic_vector(To_unsigned(srl_depth-1, srl_addr_width));
          else
            return std_logic_vector(To_unsigned(temp_depth - 2, srl_addr_width));
          end if;
        end if;
      else
        return std_logic_vector(To_unsigned(srl_depth-1, srl_addr_width));
      end if;
    end if;
  end function fn_gen_last_reg_addr;

  -- purpose: Calculates the implementation depth of the shift RAM for the
  -- various modes (i.e. the number of delays stages in the hardware generated)
  function fn_get_real_depth(addr_width, depth, shift_type, reg_last_bit, srl_depth : integer) return integer is
  begin
    case shift_type is
      when 0 =>
        if depth = 0 or depth = 1 then
          return srl_depth+1;           -- fix to stop negative range
        elsif depth mod srl_depth /= 0 then
          return ((depth/srl_depth)*srl_depth) + srl_depth;
        else                            -- depth mod srl_depth = 0
          return depth;
        end if;
      when 1 | 2 =>
        return get_max(16, 2**addr_width);
--        if depth mod srl_depth /= 0 then
--          return ((depth/srl_depth)*srl_depth)+srl_depth;
--        else
--          if depth <= 16 then
--            -- Implement SRL16 (allows dual-LUT5 packing)
--            return 16;
--          else
--            -- No change from a full SRL32
--            return ((depth/srl_depth)*srl_depth)+srl_depth;
--          end if;
-- --          return depth;
--        end if;
      when others =>
        return depth;                   -- never reached
    end case;
  end function fn_get_real_depth;

  -- purpose: If the fixed-length shift RAM is to be optimised for area, we use
  -- inferred RTL - if register controls other than CE are present, we need to
  -- use another FF and reduce the length of the shift reg XST infers by 1 cycle
  function fn_get_fixed_depth(depth, c_reg_last_bit,
                              c_has_aclr, c_has_aset, c_has_ainit,
                              c_has_sclr, c_has_sset, c_has_sinit : integer) return integer is
  begin
    if depth > 1 then
      if c_reg_last_bit /= 0 then
        if c_has_aclr = 0 and c_has_aset = 0 and c_has_ainit = 0 and c_has_sclr = 0 and c_has_sset = 0 and c_has_sinit = 0 then
          return depth;
        else
          return depth-1;
        end if;
      else                              -- no o/p FF, so just return depth
        return depth;
      end if;
    else
      return depth;  -- changed from '16' to 'depth' to try and fix CR419959
    end if;
  end function fn_get_fixed_depth;

                                        -- purpose: returns false if no controls are used on o/p FFs, true if they are
  function fn_check_reg_ctrls(c_has_sclr, c_has_sset, c_has_sinit, c_has_aclr, c_has_aset, c_has_ainit, c_reg_last_bit : integer) return integer is
    variable ret : integer := 0;
  begin
    if c_reg_last_bit /= 0 and c_has_sclr /= 0 then
      ret := ret+1;
    elsif c_reg_last_bit /= 0 and c_has_sset /= 0 then
      ret := ret+1;
    elsif c_reg_last_bit /= 0 and c_has_sinit /= 0 then
      ret := ret+1;
    elsif c_reg_last_bit /= 0 and c_has_aclr /= 0 then
      ret := ret+1;
    elsif c_reg_last_bit /= 0 and c_has_aset /= 0 then
      ret := ret+1;
    elsif c_reg_last_bit /= 0 and c_has_ainit /= 0 then
      ret := ret+1;
    end if;
    return ret;
  end function fn_check_reg_ctrls;


  function fn_get_srl_depth (family : string; depth : integer) return integer is
  begin
    if supports_SRLC32E(family) = 1 and depth > 16 then
      return 32;
    else
      return 16;
    end if;
  end function fn_get_srl_depth;

  function fn_get_srl_addr_width(family : string; depth : integer) return integer is
  begin
    if supports_SRLC32E(family) = 1 and depth > 16 then
      return 5;
    else
      return 4;
    end if;
  end function fn_get_srl_addr_width;

  function get_chain_depth(depth, srl_depth : integer) return integer is
  begin
    if depth > srl_depth then
      return depth-srl_depth;
    else
      return depth;
    end if;
  end function get_chain_depth;

  function fn_get_depth_from_mode(inferred_sr_depth, real_depth, shift_type : integer) return integer is
  begin
    if shift_type = 0 then
      return inferred_sr_depth;
    else
      return real_depth;
    end if;
  end function fn_get_depth_from_mode;

                                        -- Determines which primitive we have to use, based on the device family we're synthesising for
  function fn_get_srl_prim(family : string; depth : integer) return T_PRIM is
  begin
    if supports_SRLC32E(family) = 1 and depth > 16 then
      return SRL32;
    else
      return SRL16;
    end if;
  end function fn_get_srl_prim;

                                        -- function to determine if we are using a mix of sync and async register controls
                                        -- returns TRUE if last bit is registered and there are sync AND async register
                                        -- controls present, otherwise returns FALSE
                                        -- note that sinit is mutually-exclusive with sclr and sset and will be
                                        -- trapped by fn_c_shift_ram_v12_0_10_check_generics; it's the same for ainit and aclr etc.
  function check_mixed_reg_ctrls(c_has_aclr, c_has_aset, c_has_sclr, c_has_sset, c_has_ainit, c_has_sinit, c_reg_last_bit : integer) return boolean is
    variable sync  : integer := 0;
    variable async : integer := 0;
  begin
    if c_reg_last_bit /= 0 and c_has_sclr /= 0 then
      sync := sync + 1;
    end if;
    if c_reg_last_bit /= 0 and c_has_sset /= 0 then
      sync := sync + 1;
    end if;
    if c_reg_last_bit /= 0 and c_has_sinit /= 0 then
      sync := sync + 1;
    end if;
    if c_reg_last_bit /= 0 and c_has_aclr /= 0 then
      async := async + 1;
    end if;
    if c_reg_last_bit /= 0 and c_has_aset /= 0 then
      async := async + 1;
    end if;
    if c_reg_last_bit /= 0 and c_has_ainit /= 0 then
      async := async + 1;
    end if;
    if async > 0 and sync > 0 then
      return true;
    else
      return false;
    end if;
  end function check_mixed_reg_ctrls;

                                        -- Determines what the address for the final SRL should be based on if
                                        -- controls are used on the output flipflop
  function fn_get_addr (family                  : string;
                        ctrls_used              : integer;
                        last_srl_addr           : std_logic_vector;
                        last_srl_addr_minus_one : std_logic_vector;
                        srl_addr_width          : integer) return std_logic_vector is
  begin
    if ctrls_used > 0 then
      if ctrls_used = 1 and supports_SRLC32E(family) = 1 then
                                        -- we can put a single register control on the output FF and pack
                                        -- it into the same slice as the SRLC32E
        return last_srl_addr;
      else
        return last_srl_addr_minus_one;
      end if;
    else
      return last_srl_addr;
    end if;
  end function fn_get_addr;

                                        -- Selects whether or not to apply KEEP attribute should be applied based on
                                        -- shift type, opt goal and presence of mixed register controls
  function use_keep (shift_type, opt_goal : integer; mixed_reg_ctrls : boolean) return string is
  begin
    if shift_type = 1 and opt_goal = 0 and mixed_reg_ctrls then
                                        -- only choose to force the mux structure to be kept iff there are multiple
                                        -- types of control on the output register, otherwise let XST do all the optimisation
      return "true";
    else
      return "false";
    end if;
  end function use_keep;

  -- purpose: works out, based on the target family, at which point a FF should be inserted to speed up the circuit
  -- This is based on how deep we can build a shift register in a CLB using the
    -- dedicated fast connections (MC15/MC31)
  function fn_get_pipe_ff_pos(fam : string) return integer is
  begin
    if supports_dsp48e2(fam) = 1 then
      return 256;
    elsif supports_dsp48e1(fam) = 1 then
      -- There are 4x SRLC32Es per slice - no inter-slice connection in a CLB
      return 128;
    else
      -- Legacy devices
      -- Only SLICEMs have SRLs.  2x SLICEM, 2x SLICEL per CLB
      return 64;
    end if;
  end function fn_get_pipe_ff_pos;

  -- purpose: works out what the complete address space that can be addressed
  -- by the specified c_addr_width generic value IS
  -- e.g. if the depth specified is 192 and c_addr_width = 8, then
  -- get_addr_space() returns 256 (2**8)
  function get_addr_space(depth : integer) return integer is
    variable rnd_up_depth : integer := 0;
    variable i            : integer := 0;
  begin
    while rnd_up_depth < depth loop
      rnd_up_depth := 2**i;
      i            := i+1;
    end loop;
    return rnd_up_depth;
  end function get_addr_space;

  -- purpose: Works out if we need to use the c_reg_fd output register or not
  function use_output_register (reg_last_bit, shift_type, opt_goal, depth, ff_controls_used, srl_depth : integer) return boolean is
    variable use_reg : boolean := false;
  begin
    if reg_last_bit /= 0 then
      case shift_type is
        when C_FIXED =>
          if depth > 1 and ff_controls_used /= 0 then
            use_reg := true;
          end if;
          if depth <= 1 then
            use_reg := true;
          end if;
        when C_VARIABLE_LOSSLESS =>
          if opt_goal = C_AREA or (opt_goal = C_SPEED and depth <= srl_depth) then
            use_reg := true;
          end if;
        when C_VARIABLE_LOSSY =>
          use_reg := true;
        when others => null;
      end case;
    end if;
    return use_reg;
  end function use_output_register;

end package body c_shift_ram_v12_0_10_pkg;


-- $Id: c_shift_ram_speedmux.vhd,v 1.5 2010/03/19 10:50:51 julian Exp $
--------------------------------------------------------------------------------
--  (c) Copyright 1995-2006, 2009 Xilinx, Inc. All rights reserved.
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 9.0
--  \   \        Filename: c_shift_ram_speedmux.vhd
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- Pipelined output mux component for the shift RAM BaseBlock
--
-- Pipelines after the SRL16s and, if the shift RAM depth is greater than 128
-- bits, internally to the bit multiplexer core.  These pipeline registers
-- can't take any sync or async controls as they just add to the shift RAM
-- length and the read latency of the output.  Only the output register gets to
-- implement sync and async controls.  All registers can take a clock enable.
-- The pipelining speeds up the core dramatically - 20% for V2 and 55% for V4!
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library c_reg_fd_v12_0_3;
use c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.all;

library c_mux_bit_v12_0_3;
use c_mux_bit_v12_0_3.c_mux_bit_v12_0_3_viv_comp.all;

entity c_shift_ram_speedmux is
  generic (
    c_xdevicefamily :     string;
    c_width         :     integer;
    c_sel_width     :     integer;
    c_ainit_val     :     string;       -- will be a single bit
    c_sinit_val     :     string;       -- will be a single bit
    c_sync_priority :     integer;
    c_sync_enable   :     integer;
    c_has_ce        :     integer;
    c_has_aclr      :     integer;
    c_has_aset      :     integer;
    c_has_ainit     :     integer;
    c_has_sclr      :     integer;
    c_has_sset      :     integer;
    c_has_sinit     :     integer;
    c_reg_last_bit  :     integer);
  port (
    d               : in  std_logic_vector(c_width-1 downto 0);  -- will be the # SRLC16 outputs
    sel             : in  std_logic_vector(c_sel_width-1 downto 0);
    clk             : in  std_logic;
    ce              : in  std_logic;
    aclr            : in  std_logic;
    aset            : in  std_logic;
    ainit           : in  std_logic;
    sclr            : in  std_logic;
    sset            : in  std_logic;
    sinit           : in  std_logic;
    q               : out std_logic);
end entity c_shift_ram_speedmux;

architecture struct of c_shift_ram_speedmux is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";



  -- purpose: Determines the latency of the bit mux depending on the requirements for registered outputs and the input width
  function fn_calc_bitmux_latency(c_width       : integer) return integer is
  begin  -- FUNCTION fn_calc_bitmux_latency
    case c_width is
      when 2 to 8  => return 0;
      when 9 to 64 => return 1;         -- bit mux internal pipelining used!
      when others  => assert false report "ERROR : Invalid c_width value detected in fn_calc_bitmux_latency" severity failure;
                      return 0;         -- return a default value to keep the compiler happy
    end case;
  end function fn_calc_bitmux_latency;

  -- These will be the same in all cases - left as two separate 
  constant bitmux_latency : integer := fn_calc_bitmux_latency(c_width);

  -- Output of the dataflow pipeline registers
  signal data_pipe_out : std_logic_vector(c_width-1 downto 0) := (others => '0');

  -- Output from the bit multiplexer
  signal mb_out : std_logic := '0';

  -- output from the speedmux subcore
  signal speedmux_out : std_logic := '0';

  -- only get a single bit in as the init value, so pad it out for the whole REGISTER
  -- the BaseBlock will pad it out with zeros otherwise, leading to synthesis mismatches!
  -- andreww 21st Feb 2006
  constant padded_ainit_val : string(1 to c_width) := (others => c_ainit_val(1));
  constant padded_sinit_val : string(1 to c_width) := (others => c_sinit_val(1));

begin  -- ARCHITECTURE struct

  -- Don't allow any register controls on the pipeline registers as the SR
  -- slice input will be stolen by the WE SRL16 input

  -- note that we work out what the init value for the output register will be
  -- and then apply this to the pipeline registers as well.  This provides consistency
  -- in the way that the core is initialised - it is then coded more like delay
  -- line followed by pipeline stage as opposed to the weird mix of init values
  -- that it had in V8.0!

  -- pipeline after the SRLs to speed up the core dramatically
  -- make sure to use the padded-out ainit and sinit values
  pipe_regs : c_reg_fd_v12_0_3_viv
    generic map(
      c_width         => c_width,
      c_ainit_val     => slv_to_str(fn_get_por_value(c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit, str_to_slv(padded_ainit_val), str_to_slv(padded_sinit_val), c_width)),  --padded_ainit_val,
      c_sinit_val     => padded_sinit_val,
      c_sync_priority => c_sync_priority,
      c_sync_enable   => c_sync_enable,
      c_has_ce        => c_has_ce,
      c_has_aclr      => 0,
      c_has_aset      => 0,
      c_has_ainit     => 0,
      c_has_sclr      => 0,
      c_has_sset      => 0,
      c_has_sinit     => 0,
      c_enable_rlocs  => 0)
    port map(
      clk             => clk,
      ce              => ce,
      ainit           => '0',
      aclr            => '0',
      aset            => '0',
      sinit           => '0',
      sclr            => '0',
      sset            => '0',
      d               => d,
      q               => data_pipe_out);

  -- Use the bit mux core, but never allow a registered output - leave this to the register Baseblock
  -- make sure to use the padded-out ainit and sinit values
  bit_mux : c_mux_bit_v12_0_3_viv
    generic map(
      c_family        => c_xdevicefamily,
      c_inputs        => c_width,
      c_sel_width     => c_sel_width,
      c_pipe_stages   => bitmux_latency,  -- the pipe_stages and latency will either be other 0 or both 1
      c_latency       => bitmux_latency,
      c_height        => 0,
      c_ainit_val     => slv_to_str(fn_get_por_value(c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit, str_to_slv(padded_ainit_val), str_to_slv(padded_sinit_val), c_width)),  --padded_ainit_val,
      c_sinit_val     => padded_sinit_val,
      c_sync_priority => c_sync_priority,
      c_sync_enable   => c_sync_enable,
      c_has_o         => 1,             -- always use the async output
      c_has_q         => 0,
      c_has_ce        => c_has_ce,      -- allow a CE for any pipeline regs
      c_has_aclr      => 0,
      c_has_aset      => 0,
      c_has_ainit     => 0,
      c_has_sclr      => 0,
      c_has_sset      => 0,
      c_has_sinit     => 0,
      c_enable_rlocs  => 0)
    port map(
      m               => data_pipe_out,
      s               => sel,
      clk             => clk,
      ce              => ce,
      aset            => '0',
      aclr            => '0',
      ainit           => '0',
      sset            => '0',
      sclr            => '0',
      sinit           => '0',
      o               => mb_out);

  speedmux_out <= mb_out;

  gen_async_output : if c_reg_last_bit = 0 generate
    -- take the output directly from the bit mux
    q <= speedmux_out;
  end generate gen_async_output;

  gen_reg_output : if c_reg_last_bit /= 0 generate
    -- take the output from the reg_fd core
    -- Use the register BaseBlock to implement the output register since if
    -- the mux bit tries to implement an internal pipeline stage it will try to put
    -- similar controls to the output register onto the pipeline registers, which
    -- is not desirable in this case
    output_reg   : c_reg_fd_v12_0_3_viv
      generic map(
        c_width         => 1,           -- output register
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
        c_has_sinit     => c_has_sinit,
        c_enable_rlocs  => 0)
      PORT MAP(
        clk             => clk,
        ce              => ce,
        ainit           => ainit,
        aclr            => aclr,
        aset            => aset,
        sinit           => sinit,
        sclr            => sclr,
        sset            => sset,
        d(0)            => speedmux_out,
        q(0)            => q);
  END GENERATE gen_reg_output;

END ARCHITECTURE struct;



-- $Id: c_shift_ram_v12_0_10_legacy.vhd,v 1.6 2010/09/08 11:23:24 andreww Exp $
--------------------------------------------------------------------------------
--  (c) Copyright 1995-2006, 2009 Xilinx, Inc. All rights reserved.
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 9.0
--  \   \        Filename: c_shift_ram_v12_0_10_legacy.vhd
--  /   /
-- /___/   /\
-- \   \  /  \
--  \___\/\___\
--
-- ******************* Core Functionality ************************************
--
-- This file implements an RAM-based shift register with the following features:
--
-- The input width can be any value from 1 to 256 bits
--
-- The depth can be any value from 1 to 1024 bits (mode-dependent - it is
-- sometimes restricted to 2 or 3 as the minimum depth.  See the assertions in
-- check_generics for details)
--
-- Three shift register modes are available:
--
-- # Fixed-length mode - The length of the shift register is defined at compile
-- time and is not variable during circuit operation.  Large shift registers
-- can therefore be constructed efficiently with the SRLs.
--
-- # Variable-length lossless mode - The length of the shift register can be
-- varied at run time by varying the value applied to the address bus.  When
-- changing the address, no data is lost from within the registers as the data
-- flow is not destabilised.  Depending on the overall design requirements, the
-- core can be optimised for area or speed (default is area).  This mode is
-- useful for storing filter coefficients.
--
-- Memory initialisation via .mif files is enabled in this version, but writing
-- mif files is no longer supported.
--
-- The final output bit can be registered, with all synchronous and
-- asynchronous controls possible on this register.  Intermediate registers
-- will only have at most a CE control.

-- ******************* Design Notes ************************************
--
-- The fixed length mode uses a flipflop whenever the shift register chain
-- crosses a CLB boundary - at this point, the cascade routing (if it exists)
-- can no longer be used, so we need the good clock-to-output of a FF to keep
-- the speed of the chain up. The final bit in the chain will always be registered
-- (part of the XST macro), so if register controls are required, there will be
-- 2 flipflops on the output of the SRL chain.
--
-- The variable-length lossless mode uses SRLC* primitives to allow use of the
-- Q15 port. Virtex and Spartan2 architectures must use double the number of SRL16s as
-- one is required to have a variable address bus while a fixed SRL16 keeps the
-- designs or where the shift RAM is in the critical path. The area-optimised
-- core is written as RTL as XST can synthesise the MUXF trees required.
--
-- Mif file reading is supported in this version. The file read
-- works in XST and in ModelSim. The only restriction is that XST seems to
-- require the line lengths to be the same as the c_width parameter, otherwise
-- there is a read failure - this couldn't be worked around. This is not a
-- problem in ModelSim.
--
-- The c_default_data specifies the contents of the memory locations which are
-- either not specified by the mif file when c_read_mif = 1 or when c_read_mif
-- = 0. The string should have as many bits as c_width: otherwise unspecified
-- locations will be filled with zeros.
--
-- c_ainit_val specifies the init value of the output FF if c_reg_last_bit is
-- selected.
--
--------------------------------------------------------------------------------
-- Changes in V9
--
-- Abstraction of primitives - now declared in prim_wrappers.vhd - reduces code
-- size, standardises instantiation templates as much as possible (SRL16 vs SRLC32E)
-- Also perform bitvector conversion in the wrappers now for init purposes. FDE
-- described in RTL - less code than invoking reg_fd BaseBlock, less hierarchy too.
--
-- Move towards RTL description of shift RAMs - ultimate goal is to use RTL exclusively
--
-- Fixed mode
-- - No longer differentiate between speed and area optimisation. Use cascade
-- - outputs as far as possible (if they exist) and then put a FF on the last SRL
-- - when we leave a CLB to go to another CLB and continue the shift register.
-- - This is family-dependent. XST automatically puts a FF as the final bit.
-- - If we need to use register controls on the last bit, reduce the length by
-- - 1 cycle and use our own register with the controls on it.
--
--
-- Variable lossless mode
-- - Area option now handled by RTL - Iron XST synthesises correctly and deals with initialisation
-- - Speed option still structural code to use pipelined mux bit BaseBlock.
-- - The cut-off point where an extra pipeline stage is inserted in the mux is
-- - different for Virtex5
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library c_shift_ram_v12_0_10;
use c_shift_ram_v12_0_10.c_shift_ram_v12_0_10_pkg.all;  -- functions and comp statements

library c_mux_bit_v12_0_3;
use c_mux_bit_v12_0_3.c_mux_bit_v12_0_3_viv_comp.all;

library c_reg_fd_v12_0_3;
use c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.all;

entity c_shift_ram_v12_0_10_legacy is
  generic (
    c_xdevicefamily      : string  := "virtex2";
    c_verbosity          : integer := 0;
    c_width              : integer := 16;  -- Default is 16
    c_depth              : integer := 16;  -- SRL16 depth (default = 16 = 1x SRL16)
    c_addr_width         : integer := 4;  -- Dependent on c_width value specified
    c_shift_type         : integer := 0;  -- 0=fixed, 1=lossless
    c_opt_goal           : integer := 0;  -- 0=area, 1=speed
    c_ainit_val          : string  := "0000000000000000";  -- Applies only to registered output
    c_sinit_val          : string  := "0000000000000000";  -- Applies only to registered output
    c_default_data       : string  := "0000000000000000";  -- No init details, use this val
    c_default_data_radix : integer := 1;  -- Ignored - deprecated - binary only
    c_has_a              : integer := 0;  -- Address bus only exists for var length
    c_has_ce             : integer := 0;
    c_reg_last_bit       : integer := 1;  -- Register last output bit (with FF)
    c_sync_priority      : integer := 1;  -- Applies only to registered output
    c_sync_enable        : integer := 0;  -- Applies only to registered output
    c_has_aclr           : integer := 0;  -- Applies only to registered output
    c_has_aset           : integer := 0;  -- Applies only to registered output
    c_has_ainit          : integer := 0;  -- Applies only to registered output
    c_has_sclr           : integer := 0;  -- Applies only to registered output
    c_has_sset           : integer := 0;  -- Applies only to registered output
    c_has_sinit          : integer := 0;  -- Applies only to registered output
    c_mem_init_file      : string  := "init.mif";
    c_elaboration_dir    : string  := "./";
    c_mem_init_radix     : integer := 1;  -- for backwards compatibility
    c_generate_mif       : integer := 0;  -- Unused by the behavioural model
    c_read_mif           : integer := 0;  -- Redundant in VHDL core
    c_enable_rlocs       : integer := 0;  -- Not used with VHDL core
    c_parser_type        : integer := 0   -- 0:Verific, 1:Classic
    );
  port (
    a     : in  std_logic_vector(c_addr_width-1 downto 0) := (others => '0');
    d     : in  std_logic_vector(c_width-1 downto 0)      := (others => '0');
    clk   : in  std_logic                                 := '0';
    ce    : in  std_logic                                 := '1';
    aclr  : in  std_logic                                 := '0';
    aset  : in  std_logic                                 := '0';
    ainit : in  std_logic                                 := '0';
    sclr  : in  std_logic                                 := '0';
    sset  : in  std_logic                                 := '0';
    sinit : in  std_logic                                 := '0';
    q     : out std_logic_vector(c_width-1 downto 0)
    );

  -- Force the hierarchy to be kept when searching for shift register chains
  -- in the HDL - without this, XST will fail to find the CLB-sized blocks
  -- making up the fixed-length shift register
  -- Set to "soft" so attribute not passed to MAP, can affect variable-length
  -- packing otherwise.
  attribute KEEP_HIERARCHY                             : string;
  attribute KEEP_HIERARCHY of c_shift_ram_v12_0_10_legacy : entity is "soft";

  -- Force XST to always create the smallest design which will be using SRLs in
  -- most cases
  attribute OPT_MODE                             : string;
  attribute OPT_MODE of c_shift_ram_v12_0_10_legacy : entity is "AREA";


  -- Force XST to always use the clock-enable, if it is present, and not
  -- optimise it away when it performs timing-driven synthesis
  attribute USE_CLOCK_ENABLE                             : string;
  attribute USE_CLOCK_ENABLE of c_shift_ram_v12_0_10_legacy : entity is "YES";

  -- Don't let XST 'optimise' the MUXF5s etc. into LUTs!
  attribute OPTIMIZE_PRIMITIVES                             : string;
  attribute OPTIMIZE_PRIMITIVES of c_shift_ram_v12_0_10_legacy : entity is "NO";

  -- Ensure that XST always extracts SRL*-based shift registers from the RTL
  attribute SHREG_EXTRACT                             : string;
  attribute SHREG_EXTRACT of c_shift_ram_v12_0_10_legacy : entity is "YES";

end entity c_shift_ram_v12_0_10_legacy;

architecture struct of c_shift_ram_v12_0_10_legacy is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";


------------------------------------------------------------------------------
-- functions, types, signals and constants for all shift RAM modes
------------------------------------------------------------------------------

  constant debug : boolean := false;

  constant device_family : string := c_xdevicefamily;

  -- Remap the shift type if a deprecated option is chosen
  constant ci_shift_type : integer := c_shift_type;

  -- work out the primitive depth and the primitive address width based on the family
  constant srl_depth      : integer := fn_get_srl_depth(device_family, c_depth);
  constant srl_addr_width : integer := fn_get_srl_addr_width(device_family, c_depth);

  -- Test for valid generics and check the device family first of all
  constant check_gens : integer := fn_c_shift_ram_v12_0_10_check_generics(c_verbosity, c_width, c_depth, c_has_a, c_addr_width, c_opt_goal, c_shift_type, c_reg_last_bit, c_generate_mif,
                                                                       c_has_ainit, c_has_aclr, c_has_aset, c_has_sinit, c_has_sclr, c_has_sset, c_has_ce, c_sync_priority, c_sync_enable, c_read_mif,
                                                                       srl_depth,
                                                                       c_default_data, c_xdevicefamily);

  -- create constants for fixed addresses
  constant allones : std_logic_vector(srl_addr_width-1 downto 0) := (others => '1');

  -- Don't-care address for SRLC*E primitives in lossless mode - address ports
  -- will be left unwired, reducing routing congestion and VCC generators
  constant dontcare : std_logic_vector(srl_addr_width-1 downto 0) := (others => '-');

  -- Use utility function str_to_bound_slv_0 to convert the init values to std_logic_vectors
  constant ainit_val : std_logic_vector(c_width-1 downto 0) := str_to_bound_slv_0(c_ainit_val, c_width);
  constant sinit_val : std_logic_vector(c_width-1 downto 0) := str_to_bound_slv_0(c_sinit_val, c_width);

  constant number_of_rams : integer range 0 to 64 := fn_count_rams(c_depth, c_reg_last_bit, ci_shift_type, srl_depth);
  constant real_depth     : integer               := fn_get_real_depth(c_addr_width, c_depth, ci_shift_type, c_reg_last_bit, srl_depth);

  -- Internal CE signal to allow circuits with and without CE to be coded the same
  signal ce_i : std_logic;

  -- Signal to connect shift RAM output to the reg_fd core
  signal output_net : std_logic_vector(c_width-1 downto 0);

  -- The depth of the delay line that's to be inferred.  If register controls
  -- are present on the output FF, we have to subtract 1 from the inferred delay
  -- so that we can use a reg_fd with register controls
  constant inferred_sr_depth : integer := fn_get_fixed_depth(c_depth, c_reg_last_bit, c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit);

  constant mode_depth : integer := fn_get_depth_from_mode(inferred_sr_depth, real_depth, ci_shift_type);

  -- type to describe the inferred shift register
  type T_SRL_ARRAY is array (0 to mode_depth-1) of std_logic_vector(c_width-1 downto 0);

-------------------------------------------------------------------------------
-- Memory initialisation functions
-------------------------------------------------------------------------------

  type T_MEM_INIT_ARRAY is array (0 to c_width-1, 0 to mode_depth-1) of std_logic;

  -- purpose: converts the default data string into a SLV to use in init_array()
  function get_default_data (def_data : string; width : integer) return std_logic_vector is
    variable dd      : string(1 to width);
    variable ret_slv : std_logic_vector(width-1 downto 0) := (others => '0');
  begin  -- FUNCTION get_default_data
    if def_data'length > width then
      dd(1 to width) := def_data(1 to width);
    else
      dd(1 to def_data'length) := def_data;
    end if;

    for i in 1 to width loop
      case dd(i) is
        when '0' =>
          ret_slv(width-i) := '0';
        when '1' =>
          ret_slv(width-i) := '1';
        when others =>
          assert false
            report "WARNING : c_shift_ram_v12_0_10_legacy : Filling unspecified c_default_data locations with zeros up to MSB"
            severity warning;
          ret_slv(width-i) := '0';
      end case;
    end loop;  -- i

    return ret_slv;
  end function get_default_data;

  -- purpose: initialise the memory array with the default data information
  function init_array(width, depth : integer; def_data : string) return T_MEM_INIT_ARRAY is
    variable filled_array : T_MEM_INIT_ARRAY;
    constant default_data : std_logic_vector(width-1 downto 0) := get_default_data(def_data, width);
  begin  -- FUNCTION init_array

    assert not(debug) report "init_array width is " & integer'image(width) severity note;
    assert not(debug) report "init_array depth is " & integer'image(depth) severity note;

    for i in 0 to width-1 loop
      for j in 0 to depth-1 loop
        filled_array(i, j) := default_data(width-1-i);  -- coded this way to ensure left-most bit in default data string is the MSB (top bit) of the shift RAM
      end loop;  -- j
    end loop;  -- i

    assert not(debug) report "completed init_array routine" severity note;
    return filled_array;
  end function init_array;


  -- purpose: read MIF data from the MIF file and write it into the memory array
  -- NOTE: parser_type is obsolete and can be removed the next time the code is modified.
  --
  impure function read_mif_data(read_mif, parser_type, width, mode_depth, c_depth : integer; filename, elaboration_dir : string; default_data : string) return T_MEM_INIT_ARRAY is

    file initfile        : text;
    variable initline    : line;
    variable bits_good   : boolean          := true;
    variable ret_vec     : T_MEM_INIT_ARRAY := init_array(width, mode_depth, default_data);
    variable bitchar     : character;
    variable bitline     : string (1 to width);
    variable mif_status  : file_open_status;
    constant pathandfile : string           := elaboration_dir & filename;
  begin  -- FUNCTION read_data

    if read_mif /= 0 then  -- if we don't want to use a mif file, don't try and read one

      assert false report "NOTE : c_shift_ram_v12_0_10_legacy : Reading mif file..." severity note;

      -- report "DEBUG:::::: read_mif: MARKER about to read file" severity note;

      FILE_OPEN(mif_status, initfile, pathandfile, read_mode);  -- access file only when c_read_mif = 1

      if mif_status /= open_ok then
        assert false
          report "ERROR : c_shift_ram_v12_0_10_legacy : Couldn't open memory initialization file"
          severity failure;
      end if;

      for lines in 0 to mode_depth-1 loop
        if not(endfile(initfile)) then
          --report "DEBUG:::::: read_mif: reading line " & integer'image(lines) severity note;

          readline(initfile, initline);

          for i in 0 to width-1 loop
            read(initline, bitchar, bits_good);
            if ((bits_good = false) or ((bitchar /= ' ') and (bitchar /= CR) and (bitchar /= HT) and (bitchar /= LF) and (bitchar /= '0') and (bitchar /= '1') and (bitchar /= 'X') and (bitchar /= 'Z'))) then
              assert false
                report "WARNING   : c_shift_ram_v12_0_10_legacy : Unknown or illegal character encountered while reading MIF on line " & integer'image(lines+1) & " - finishing file read" & CR &
                "This could be due to an undersized MIF file"
                severity warning;
              exit;                     -- abort the file read
            end if;
            case bitchar is
              when '0' => ret_vec(i, lines) := '0';
              when '1' => ret_vec(i, lines) := '1';
              when others =>
                assert false
                  report "WARNING : c_shift_ram_v12_0_10_legacy : STD_LOGIC type other than '0' or '1' detected on LINE " & integer'image(lines+1) & " position " & integer'image(i) & " - writing '0' to this memory location"
                  severity warning;
                ret_vec(i, lines) := '0';
            end case;
          end loop;  -- i
        else
          --report "DEBUG:::::: read_mif: end of file at line "  & integer'image(lines) severity note;
          exit;                         -- No more lines.  Exit
        end if;
      end loop;  -- lines

      -- report "DEBUG:::::: read_mif: MARKER finished reading file" severity note;

      FILE_CLOSE(initfile);             -- explicitly close the file
      assert false report "NOTE : c_shift_ram_v12_0_10_legacy : File read complete" severity note;

    end if;  -- read_mif /= 0

    -- We return the array in all cases - if the mif file has been read, the
    -- array will have the user data in it - if not, it will contain the default
    -- data vector to initialise the SRL16s and the registers
    return ret_vec;

  end function read_mif_data;

  -- NOTE: Remove on next code upgrade.  Keeping just now for reference in case new code has issues
  --
-- ORIGINAL CODE  impure function read_mif_data(read_mif, parser_type, width, mode_depth, c_depth : integer; filename, elaboration_dir : string; default_data : string) return T_MEM_INIT_ARRAY is
-- ORIGINAL CODE
-- ORIGINAL CODE    file initfile        : text;
-- ORIGINAL CODE    variable initline    : line;
-- ORIGINAL CODE    variable bits_good   : boolean          := true;
-- ORIGINAL CODE    variable ret_vec     : T_MEM_INIT_ARRAY := init_array(width, mode_depth, default_data);
-- ORIGINAL CODE    variable bitchar     : character;
-- ORIGINAL CODE    variable bitline     : string (1 to width);
-- ORIGINAL CODE    variable mif_status  : file_open_status;
-- ORIGINAL CODE    constant pathandfile : string           := elaboration_dir & filename;
-- ORIGINAL CODE  begin  -- FUNCTION read_data
-- ORIGINAL CODE
-- ORIGINAL CODE    report "DEBUG:::::: read_mif called: parser_type = " & integer'image(parser_type) severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE
-- ORIGINAL CODE    if read_mif /= 0 then               -- if we don't want to use a mif file, don't try and read one
-- ORIGINAL CODE
-- ORIGINAL CODE      assert false report "NOTE : c_shift_ram_v12_0_10_legacy : Reading mif file..." severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE      --report "DEBUG:::::: read_mif: parser_type = " & integer'image(arser_type) severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE
-- ORIGINAL CODE      FILE_OPEN(mif_status, initfile, pathandfile, read_mode);  -- access file only when c_read_mif = 1
-- ORIGINAL CODE
-- ORIGINAL CODE      if mif_status /= open_ok then
-- ORIGINAL CODE        assert false
-- ORIGINAL CODE          report "ERROR : c_shift_ram_v12_0_10_legacy : Couldn't open memory initialization file"
-- ORIGINAL CODE          severity failure;
-- ORIGINAL CODE      end if;
-- ORIGINAL CODE
-- ORIGINAL CODE      -- FOR lines IN 0 TO c_depth-1 LOOP
-- ORIGINAL CODE      for lines in 0 to mode_depth-1 loop
-- ORIGINAL CODE        if not(endfile(initfile)) then
-- ORIGINAL CODE          --report "DEBUG:::::: read_mif: reading line (1) " & integer'image(lines) severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE          readline(initfile, initline);
-- ORIGINAL CODE          --report "DEBUG:::::: read_mif: reading line (2)" & integer'image(lines) severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE          if (parser_type = 1) then -- 1 --> Not a verific parser
-- ORIGINAL CODE            -- This line is needed only if the parser is not a verific parser
-- ORIGINAL CODE            --report "DEBUG:::::: read_mif: Exit parser_type = 1 " severity note;
-- ORIGINAL CODE            exit when endfile(initfile);
-- ORIGINAL CODE          end if;
-- ORIGINAL CODE          readline(initfile, initline);
-- ORIGINAL CODE          --report "DEBUG:::::: read_mif: reading line (3)" & integer'image(lines) severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE          for i in 0 to width-1 loop
-- ORIGINAL CODE            read(initline, bitchar, bits_good);
-- ORIGINAL CODE            if ((bits_good = false) or ((bitchar /= ' ') and (bitchar /= CR) and (bitchar /= HT) and (bitchar /= LF) and (bitchar /= '0') and (bitchar /= '1') and (bitchar /= 'X') and (bitchar /= 'Z'))) then
-- ORIGINAL CODE              assert false
-- ORIGINAL CODE                report "WARNING   : c_shift_ram_v12_0_10_legacy : Unknown or illegal character encountered while reading MIF on line " & integer'image(lines+1) & " - finishing file read" & CR &
-- ORIGINAL CODE                "This could be due to an undersized MIF file"
-- ORIGINAL CODE                severity warning;
-- ORIGINAL CODE              exit;                     -- abort the file read
-- ORIGINAL CODE            end if;
-- ORIGINAL CODE            case bitchar is
-- ORIGINAL CODE              when '0'    => ret_vec(i, lines) := '0';
-- ORIGINAL CODE              when '1'    => ret_vec(i, lines) := '1';
-- ORIGINAL CODE              when others =>
-- ORIGINAL CODE                assert false
-- ORIGINAL CODE                  report "WARNING : c_shift_ram_v12_0_10_legacy : STD_LOGIC type other than '0' or '1' detected on LINE " & integer'image(lines+1) & " position " & integer'image(i) & " - writing '0' to this memory location"
-- ORIGINAL CODE                  severity warning;
-- ORIGINAL CODE                ret_vec(i, lines)              := '0';
-- ORIGINAL CODE            end case;
-- ORIGINAL CODE          end loop;  -- i
-- ORIGINAL CODE
-- ORIGINAL CODE        end if;
-- ORIGINAL CODE      end loop;  -- lines
-- ORIGINAL CODE
-- ORIGINAL CODE      FILE_CLOSE(initfile);             -- explicitly close the file
-- ORIGINAL CODE      assert false report "NOTE : c_shift_ram_v12_0_10_legacy : File read complete" severity note;
-- ORIGINAL CODE
-- ORIGINAL CODE    end if;  -- read_mif /= 0
-- ORIGINAL CODE
-- ORIGINAL CODE    -- We return the array in all cases - if the mif file has been read, the
-- ORIGINAL CODE    -- array will have the user data in it - if not, it will contain the default
-- ORIGINAL CODE    -- data vector to initialise the SRL16s and the registers
-- ORIGINAL CODE    return ret_vec;
-- ORIGINAL CODE
-- ORIGINAL CODE  end function read_mif_data;



  -- Array filled with the contents of the MIF
  -- we use the real_depth to populate the whole SRL16 and register array and c_depth to read in the MIF


  constant mem_array : T_MEM_INIT_ARRAY := read_mif_data(c_read_mif, c_parser_type, c_width, mode_depth, c_depth, c_mem_init_file, c_elaboration_dir, c_default_data);

  -----------------------------------------------------------------------------
  -- get_init function gets the init data from the array derived from the mif file
  -- (or all zeros array if mif file not used).
  -----------------------------------------------------------------------------
  function get_init(mem_array : T_MEM_INIT_ARRAY; width, depth : integer; prim : T_PRIM; shift_type : integer) return std_logic_vector is
    variable slv_1  : std_logic_vector(0 downto 0);
    variable slv_16 : std_logic_vector(15 downto 0);
    variable slv_32 : std_logic_vector(31 downto 0);
  begin  -- PROCEDURE get_init
    case shift_type is
      when 0 =>
        if prim = SRL16 then            -- SRL16(C)E
          for i in 0 to 15 loop
            slv_16(i) := mem_array(width, i+(depth*16)+depth);  -- account for register offset
          end loop;  -- i
          return slv_16;
        elsif prim = SRL32 then
          for i in 0 to 31 loop
            slv_32(i) := mem_array(width, i+(depth*32)+depth);  -- account for register offset
          end loop;  -- i
          return slv_32;
        else -- prim = REG t          -- Register (FDE)
          slv_1(0) := mem_array(width, 16+(depth*16)+depth);
          return slv_1;
        end if;
      when 1 | 2 =>
        if prim = SRL16 then
          for i in 0 to 15 loop
            slv_16(i) := mem_array(width, i+(depth*16));
          end loop;  -- i
          return slv_16;
        elsif prim = SRL32 then
          for i in 0 to 31 loop
            slv_32(i) := mem_array(width, i+(depth*32));
          end loop;  -- i
          return slv_32;
        end if;
      when others =>
        assert false report "ERROR : c_shift_ram_v12_0_10_legacy : Illegal value for ci_shift_type caught in get_init" severity failure;
    end case;
    --CR774508 guaranteeing return value
    return slv_1;          -- return a default to keep compiler happy
  end function get_init;

-------------------------------------------------------------------------------

  -- purpose: converts MIF file and init data from T_MEM_INIT_ARRAY to T_SRL_ARRAY format
  function fn_T_MEM_INIT_ARRAY_to_T_SRL_ARRAY(mem_array : T_MEM_INIT_ARRAY; sr_depth : integer; width : integer) return T_SRL_ARRAY is
    constant depth     : integer := sr_depth;
    variable ret_array : T_SRL_ARRAY;
    variable slv       : std_logic_vector(width-1 downto 0);
  begin  -- FUNCTION fn_T_MEM_INIT_ARRAY_to_T_SRL_ARRAY
    for i in 0 to depth-1 loop
      for j in 0 to width-1 loop
        slv(j) := mem_array(width-1-j, i);
      end loop;  -- j
      ret_array(i) := slv;
    end loop;  -- i
    return ret_array;
  end function fn_T_MEM_INIT_ARRAY_to_T_SRL_ARRAY;

  -- purpose: takes an arbitrary 1-bit wide, n-bit deep slice out of a T_SRL_ARRAY and returns it as a SLV
  function fn_T_SRL_ARRAY_to_SLV(srl_array : T_SRL_ARRAY; width, start, finish : integer) return std_logic_vector is
    variable ret : std_logic_vector(start to finish) := (others => 'X');
  begin  -- FUNCTION fn_T_SRL_ARRAY_to_SLV
    for i in start to finish loop
      ret(i) := srl_array(i)(width);
    end loop;  -- i
    return ret;
  end function fn_T_SRL_ARRAY_to_SLV;

  -- purpose: If we are generating a fixed-length, inferred shift register, XST always puts a register on the output
  -- This register has to take the AINIT value if there are no controls present
  -- on the register - if there are controls, the AINIT (or whatever INIT
  -- value) is handled by the reg_fd core
  -- So here we make the last element of the array the AINIT value iff no
  -- register controls are present, otherwise just return the array
  function fn_adjust_mem_array(mem_array : T_MEM_INIT_ARRAY; c_width, ff_ctrls_used, depth, shift_type : integer; ainit_val : std_logic_vector) return T_SRL_ARRAY is
    variable ret_array : T_SRL_ARRAY := fn_T_MEM_INIT_ARRAY_to_T_SRL_ARRAY(mem_array, depth, c_width);
  begin  -- FUNCTION fn_adjust_mem_array
    if ff_ctrls_used = 0 and shift_type = 0 then
      ret_array := ret_array(0 to inferred_sr_depth-2) & ainit_val;
    end if;
    return ret_array;
  end function fn_adjust_mem_array;

  constant ff_ctrls_used : integer := fn_check_reg_ctrls(c_has_sclr, c_has_sset, c_has_sinit, c_has_aclr, c_has_aset, c_has_ainit, c_reg_last_bit);

  constant rtl_mem_array : T_SRL_ARRAY := fn_adjust_mem_array(mem_array, c_width, ff_ctrls_used, mode_depth, ci_shift_type, ainit_val);

  attribute keep : string;

  -- Constant to indicate how deep an SRL chain using the cascade routing
  -- can be in a specific family - after this depth, we need to add in a flipflop
  -- to keep speed up
  constant pipe_ff_pos : integer := fn_get_pipe_ff_pos(device_family);

  function get_ai_width (addr_width, depth : integer; family : string) return integer is
  begin
    if depth <= 16 then
      return 4;
    else
      return addr_width;
    end if;
  end function get_ai_width;

  constant ai_width : integer                               := get_ai_width(c_addr_width, c_depth, device_family);
  signal ai         : std_logic_vector(ai_width-1 downto 0) := (others => '0');

begin  -- ARCHITECTURE struct


  dbg : if debug generate
    signal mem_array_sig     : T_MEM_INIT_ARRAY := mem_array;
    signal rtl_mem_array_sig : T_SRL_ARRAY      := rtl_mem_array;
  begin
    assert not(debug) report "implementation depth (sum of SRL16 and register delays) is " & integer'image(mode_depth) severity note;
    assert not(debug) report "ff_ctrls_used is " & integer'image(ff_ctrls_used) severity note;
  end generate dbg;


  -- Internal CE generation to allow the use of a clock-enabled primitive even if CE is not requested
  has_ce : if c_has_ce /= 0 generate
    ce_i <= ce;
  end generate has_ce;
  has_no_ce : if c_has_ce = 0 generate
    ce_i <= '1';
  end generate has_no_ce;

-------------------------------------------------------------------------------
-- Common output register structural code - used in each case that the c_reg_last_bit generic is set
------------------------------------------------------------------------------

  -- Use the reg FD BaseBlock and pass all the shift RAM generic options that are valid for it to the reg FD
--  gen_output_regs : IF c_reg_last_bit /= 0 AND
--                      NOT((ci_shift_type = C_VARIABLE_LOSSLESS) AND (c_opt_goal = C_SPEED))
--                      AND (NOT(ci_shift_type = c_fixed AND c_reg_last_bit /= 0) OR ff_ctrls_used /= 0) GENERATE
  -- In the second case, the speedmux implements the output register as there are further optimisation possibilities depending on the synchronous controls chosen

-- gen_output_regs : IF c_reg_last_bit /= 0 AND (ci_shift_type = C_VARIABLE_LOSSY OR (ci_shift_type = C_VARIABLE_LOSSLESS AND (c_opt_goal = C_AREA OR (c_opt_goal = C_SPEED AND mode_depth <= srl_depth))) OR ((ci_shift_type = C_FIXED AND mode_depth > 1 AND ff_ctrls_used /= 0) OR (ci_shift_type = C_FIXED AND mode_depth <= 1))) GENERATE
  gen_output_regs : if use_output_register(c_reg_last_bit, ci_shift_type, c_opt_goal, mode_depth, ff_ctrls_used, srl_depth) generate
    output_regs : c_reg_fd_v12_0_3_viv
      generic map(
        c_width         => c_width,
        c_ainit_val     => padded_slv_to_str(ainit_val(c_width-1 downto 0), c_width),
        c_sinit_val     => padded_slv_to_str(sinit_val(c_width-1 downto 0), c_width),
        c_sync_priority => c_sync_priority,
        c_sync_enable   => c_sync_enable,
        c_has_ce        => c_has_ce,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => c_has_ainit,
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => c_has_sinit,
        c_enable_rlocs  => 0)
      port map(
        clk   => clk,
        ce    => ce,
        ainit => ainit,
        aclr  => aclr,
        aset  => aset,
        sinit => sinit,
        sclr  => sclr,
        sset  => sset,
        d     => output_net,
        q     => q);
  end generate gen_output_regs;

-------------------------------------------------------------------------------
-- Assignment of the output net to the output port for the case(s) where no
-- output register is used or the register is integrated into a mux
-------------------------------------------------------------------------------
-- gen_non_reg_output : IF c_reg_last_bit = 0
-- OR ((ci_shift_type = c_variable_lossless) AND (c_opt_goal = c_speed))
-- OR ((ci_shift_type = c_fixed AND c_reg_last_bit /= 0) AND NOT(ff_ctrls_used /= 0)) GENERATE
-- gen_non_reg_output : IF NOT(c_reg_last_bit /= 0 AND (ci_shift_type = C_VARIABLE_LOSSY OR (ci_shift_type = C_VARIABLE_LOSSLESS AND (c_opt_goal = C_AREA OR (c_opt_goal = C_SPEED AND mode_depth <= srl_depth))) OR ((ci_shift_type = C_FIXED AND mode_depth > 1 AND ff_ctrls_used /= 0) OR (ci_shift_type = C_FIXED AND mode_depth <= 1)))) GENERATE
  gen_non_reg_output : if not(use_output_register(c_reg_last_bit, ci_shift_type, c_opt_goal, mode_depth, ff_ctrls_used, srl_depth)) generate
    q <= output_net;
  end generate gen_non_reg_output;

-------------------------------------------------------------------------------
-- Fixed-mode RAM code section
-------------------------------------------------------------------------------

  fixed_i_depth_eq_0_or_1reg : if (c_depth = 0 and ci_shift_type = c_fixed) or (c_depth = 1 and ci_shift_type = c_fixed and c_reg_last_bit /= 0) generate
    -- this case is slightly different - if you require a depth=0 and choose c_reg_last_bit, the true depth will be 1...in all other cases the final reg is accounted for in the depth
    output_net <= d;                    -- a route-thru to optional o/p reg
  end generate fixed_i_depth_eq_0_or_1reg;

  fixed_i_depth_eq_1_noreg : if c_depth = 1 and ci_shift_type = c_fixed and c_reg_last_bit = 0 generate
    gen_width : for width in 0 to c_width-1 generate
-- CONSTANT reg_init : STD_LOGIC_VECTOR(0 DOWNTO 0) := get_init(mem_array, c_width-1-width, 0, REG, ci_shift_type);
      -- need to use a different syntax here to avoid arry out-of-range errors when the depth is 1
      constant reg_init_sl : std_logic                    := mem_array(c_width-1-width, 0);
      constant reg_init    : std_logic_vector(0 downto 0) := (others => reg_init_sl);
    begin
      r : entity c_shift_ram_v12_0_10.flop(xilinx)
        generic map (
          finit => reg_init)
        port map (
          d   => d(width),
          clk => clk,
          ce  => ce_i,
          q   => output_net(width));
    end generate gen_width;
  end generate fixed_i_depth_eq_1_noreg;

  f0 : if ci_shift_type = c_fixed and ((c_depth < srl_depth+1 and c_depth /= 0 and c_depth /= 1) or (c_depth = srl_depth+1)) generate
    signal srl_sig : T_SRL_ARRAY := rtl_mem_array(0 to inferred_sr_depth-1);
  begin
    process (clk) is
    begin
      if rising_edge(clk) then
        if ce_i = '1' then
          srl_sig <= d & srl_sig(0 to inferred_sr_depth-2);
        end if;
      end if;
    end process;
    output_net <= srl_sig(inferred_sr_depth-1);
  end generate f0;

  f1 : if ci_shift_type = c_fixed and c_depth > (srl_depth+1) generate
    -- Number of 'full' CLBs we need to build the delay line
    constant CLBs : integer := (inferred_sr_depth/(pipe_ff_pos+1));
  begin

    only_clb : if CLBs = 0 generate
      signal srl_sig                     : T_SRL_ARRAY := rtl_mem_array(0 to inferred_sr_depth-1);
      attribute shreg_Extract            : string;
      attribute shreg_Extract of srl_sig : signal is "yes";
    begin
      -- shift register fully contained within a single fast connection chain
      process (clk) is
      begin
        if rising_edge(clk) then
          if ce_i = '1' then
            srl_sig <= d & srl_sig(0 to inferred_sr_depth-2);
          end if;
        end if;
      end process;
      output_net <= srl_sig(inferred_sr_depth-1);
    end generate only_clb;

    many_clbs : if CLBs > 0 generate
      -- signal to connect up the individual CLB blocks
      type T_LINK is array (0 to CLBs) of std_logic_vector(c_width-1 downto 0);
      signal link            : T_LINK;
      attribute keep         : string;
      attribute keep of link : signal is "true";
    begin

      -- the first CLB in the chain
      gen_width : for w in 0 to c_width-1 generate
        signal srl_sig : std_logic_vector(0 to pipe_ff_pos) := fn_T_SRL_ARRAY_to_SLV(rtl_mem_array, w, 0, pipe_ff_pos);  --clbinit;
        signal q_i     : std_logic                          := '0';
-- ATTRIBUTE shreg_Extract : STRING;
-- ATTRIBUTE shreg_Extract OF srl_sig : SIGNAL IS "yes";
        -- Use a Keep on the intermediate output signal to
        -- stop XST pulling the output FF into another delay line
--          ATTRIBUTE keep        : STRING;
--          ATTRIBUTE keep OF q_i : SIGNAL IS "true";
      begin  -- ARCHITECTURE xilinx
        process (clk) is
        begin
          if rising_edge(clk) then
            if ce_i = '1' then
              srl_sig <= d(w) & srl_sig(0 to pipe_ff_pos-1);
            end if;
          end if;
        end process;
        q_i        <= srl_sig(pipe_ff_pos);
        link(0)(w) <= q_i;
-- clb0 : srl_clb
-- GENERIC MAP (
-- clbinit => fn_T_SRL_ARRAY_to_SLV(rtl_mem_array, w, 0, pipe_ff_pos),
-- pipe_ff_pos => pipe_ff_pos)
-- PORT MAP (
-- d => d(w),
-- ce => ce_i,
-- clk => clk,
-- q => link(0)(w));
      end generate gen_width;

      gen_clb_shreg : for i in 1 to CLBs-1 generate
        -- a single shift register section contained within a single fast connection chain
        gen_width : for w in 0 to c_width-1 generate
          signal srl_sig : std_logic_vector(0 to pipe_ff_pos) := fn_T_SRL_ARRAY_to_SLV(rtl_mem_array, w, (i*pipe_ff_pos)+i, pipe_ff_pos+(i*pipe_ff_pos)+i);  --clbinit;
          signal q_i     : std_logic                          := '0';
-- ATTRIBUTE shreg_Extract : STRING;
-- ATTRIBUTE shreg_Extract OF srl_sig : SIGNAL IS "yes";
          -- Use a Keep on the intermediate output signal to
          -- stop XST pulling the output FF into another delay line
--          ATTRIBUTE keep        : STRING;
--          ATTRIBUTE keep OF q_i : SIGNAL IS "true";
        begin  -- ARCHITECTURE xilinx
          process (clk) is
          begin
            if rising_edge(clk) then
              if ce_i = '1' then
                srl_sig <= link(i-1)(w) & srl_sig(0 to pipe_ff_pos-1);
              end if;
            end if;
          end process;
          q_i        <= srl_sig(pipe_ff_pos);
          link(i)(w) <= q_i;
-- clbx : srl_clb
-- GENERIC MAP (
-- clbinit => fn_T_SRL_ARRAY_to_SLV(rtl_mem_array, w, (i*pipe_ff_pos)+i, pipe_ff_pos+(i*pipe_ff_pos)+i),
-- pipe_ff_pos => pipe_ff_pos)
-- PORT MAP (
-- d => link(i-1)(w),
-- ce => ce_i,
-- clk => clk,
-- q => link(i)(w));
        end generate gen_width;
      end generate gen_clb_shreg;

      -- the final CLB in the chain or a direct route to the output net
      last_clb : if ((inferred_sr_depth mod (pipe_ff_pos+1)) /= 0) generate
        gen_width : for w in 0 to c_width-1 generate
          constant this_depth : integer                           := (inferred_sr_depth-1-((CLBs*pipe_ff_pos)+CLBs));
          signal srl_sig      : std_logic_vector(0 to this_depth) := fn_T_SRL_ARRAY_to_SLV(rtl_mem_array, w, (CLBs*pipe_ff_pos)+(CLBs), inferred_sr_depth-1);  --clbinit;
          signal q_i          : std_logic                         := '0';
-- ATTRIBUTE shreg_Extract : STRING;
-- ATTRIBUTE shreg_Extract OF srl_sig : SIGNAL IS "yes";
          -- Use a Keep on the intermediate output signal to
          -- stop XST pulling the output FF into another delay line
--          ATTRIBUTE keep        : STRING;
--          ATTRIBUTE keep OF q_i : SIGNAL IS "true";
        begin  -- ARCHITECTURE xilinx
          process (clk) is
          begin
            if rising_edge(clk) then
              if ce_i = '1' then
                srl_sig <= link(CLBs-1)(w) & srl_sig(0 to this_depth-1);
              end if;
            end if;
          end process;
          q_i           <= srl_sig(this_depth);
          output_net(w) <= q_i;
-- clbn : srl_clb
-- GENERIC MAP (
-- clbinit => fn_T_SRL_ARRAY_to_SLV(rtl_mem_array, w, (CLBs*pipe_ff_pos)+(CLBs), inferred_sr_depth-1),
-- pipe_ff_pos => (inferred_sr_depth-1-((CLBs*pipe_ff_pos)+CLBs)))
-- PORT MAP (
-- d => link(CLBs-1)(w),
-- ce => ce_i,
-- clk => clk,
-- q => output_net(w));
        end generate gen_width;
      end generate last_clb;
      last_ff : if ((inferred_sr_depth mod (pipe_ff_pos+1)) = 0) generate
        output_net <= link(CLBs-1);
      end generate last_ff;

    end generate many_clbs;

  end generate f1;

-------------------------------------------------------------------------------
-- Variable-length lossless code section
-----------------------------------------------------------------------------
-- Creates a variable-length shift register, the length being adjustable by use
-- of the address bus. This only allows the use of a register on the final
-- output bit and not within the chain as registers cannot be addressed.
-- In the Spartan3, Virtex2 and Virtex4 families, we can use the SRLC16(E)
-- primitives which have a dual-port output and allow a shift register that
-- uses the same SRL16 resources as the equivalent lossy variable-length shift register.
-- The Spartan2 and Virtex devices don't have this primitive, so we must use
-- the basic SRL16(E) primitive and use 2x as many - one in each pair to
-- maintain the data flow, the other to offer the variable-length capability.
-- When speed optimisation is selected, the speedmux component will be used to
-- do the pipelining and muxing.
-- When area optimisation is selected, the areamux component will be used to
-- create a compact shift RAM with the MUXF5,F6,F7 and bit multiplexer
-----------------------------------------------------------------------------

  var_length_adjust_addr : if ci_shift_type = C_VARIABLE_LOSSLESS generate
    is_v5 : if supports_SRLC32E(device_family) = 1 and c_depth > 16 generate
      -- Base on SRL32 primitive
      depth_lteq_2 : if c_depth <= 2 generate
        ai <= "0000" & a(0 downto 0);
      end generate depth_lteq_2;
      depth_lteq_4 : if c_depth > 2 and c_depth <= 4 generate
        ai <= "000" & a(1 downto 0);
      end generate depth_lteq_4;
      depth_lteq_8 : if c_depth > 4 and c_depth <= 8 generate
        ai <= "00" & a(2 downto 0);
      end generate depth_lteq_8;
      depth_lteq_16 : if c_depth > 8 and c_depth <= 16 generate
        ai <= "0" & a(3 downto 0);
      end generate depth_lteq_16;
      other_depths : if c_depth > 16 generate
        ai <= a;
      end generate other_depths;
    end generate is_v5;
    is_not_b5 : if not(supports_SRLC32E(device_family) = 1 and c_depth > 16) generate
      -- base on SRL16 primitive
      depth_lteq_2 : if c_depth <= 2 generate
        ai <= "000" & a(0 downto 0);
      end generate depth_lteq_2;
      depth_lteq_4 : if c_depth > 2 and c_depth <= 4 generate
        ai <= "00" & a(1 downto 0);
      end generate depth_lteq_4;
      depth_lteq_8 : if c_depth > 4 and c_depth <= 8 generate
        ai <= "0" & a(2 downto 0);
      end generate depth_lteq_8;
      other_depths : if c_depth > 8 generate
        ai <= a;
      end generate other_depths;
    end generate is_not_b5;
  end generate var_length_adjust_addr;


  lls_area : if ci_shift_type = c_variable_lossless and c_has_a /= 0 and c_opt_goal = c_area generate
    depth_lteq_1srl : if c_depth <= srl_depth generate
      constant srl_prim : T_PRIM := fn_get_srl_prim(device_family, c_depth);
    begin
      gen_srl : for width in 0 to c_width-1 generate
        constant init : std_logic_vector(srl_depth-1 downto 0) := get_init(mem_array, c_width-1-width, 0, srl_prim, ci_shift_type);
      begin
        i_lls_only : entity c_shift_ram_v12_0_10.sr(xilinx)
          generic map (
            addr_width => srl_addr_width,
            use_carry  => 0,
            srinit     => init)
          port map (
            d      => d(width),
            clk    => clk,
            a      => ai(srl_addr_width-1 downto 0),
            ce     => ce_i,
            q      => output_net(width),
            qcarry => open);
      end generate gen_srl;
    end generate depth_lteq_1srl;
    depth_gt_1_srl : if c_depth > srl_depth generate
      -- infer the shift register
      signal srl_sig : T_SRL_ARRAY := rtl_mem_array;
    begin
      process (clk) is
      begin
        if rising_edge(clk) then
          if (ce_i = '1') then
            srl_sig <= d & srl_sig(0 to mode_depth-2);
          end if;
        end if;
      end process;
      -- pick off the bits we need, pass mux output to output register
      output_net <= srl_sig(to_integer(unsigned(ai)));
    end generate depth_gt_1_srl;
  end generate lls_area;

  lls_speed : if ci_shift_type = c_variable_lossless and c_has_a /= 0 and c_opt_goal = c_speed generate
    type T_MUX_INTERFACE is array (0 to c_width-1) of std_logic_vector(0 to number_of_rams-1);
    signal mux_in_bus : T_MUX_INTERFACE;
    type T_INST_LOSSLESS_CONNECT is array (0 to c_width-1, 0 to (number_of_rams-1)) of std_logic;
    signal srl_net    : T_INST_LOSSLESS_CONNECT;  -- connects the SRL16s maintaining the data flow together
    signal mux_in     : T_INST_LOSSLESS_CONNECT;  -- taps off the SRL16 outputs and feeds them to the mux on the output
    constant srl_prim : T_PRIM := fn_get_srl_prim(device_family, c_depth);
  begin
    s3_v2_v4_v5_lls : if supports_SRLC32E(device_family) = 1 or supports_SRLC16E(device_family) = 1 generate
      -- use the built-in carry routing for the SRLs
      gen_width : for width in 0 to c_width-1 generate
        gen_depth : for depth in 0 to number_of_rams - 1 generate
          constant init : std_logic_vector(srl_depth-1 downto 0) := get_init(mem_array, c_width-1-width, depth, srl_prim, ci_shift_type);
        begin

          gen_only : if depth = 0 and (number_of_rams - 1) = 0 generate
            i_lls_only : entity c_shift_ram_v12_0_10.sr(xilinx)
              generic map (
                addr_width => srl_addr_width,
                use_carry  => 0,
                srinit     => init)
              port map (
                d      => d(width),
                clk    => clk,
                a      => ai(srl_addr_width-1 downto 0),
                ce     => ce_i,
                q      => mux_in(width, depth),
                qcarry => open);
          end generate gen_only;

          gen_first : if depth = 0 and (number_of_rams - 1) /= 0 generate
            i_lls_first_c : entity c_shift_ram_v12_0_10.sr(xilinx)
              generic map (
                addr_width => srl_addr_width,
                use_carry  => 1,
                srinit     => init)
              port map (
                d      => d(width),
                clk    => clk,
                a      => ai(srl_addr_width-1 downto 0),
                ce     => ce_i,
                q      => mux_in(width, depth),
                qcarry => srl_net(width, depth));
          end generate gen_first;
          gen_middle : if depth /= 0 and depth /= (number_of_rams - 1) generate
            i_lls_mid_c : entity c_shift_ram_v12_0_10.sr(xilinx)
              generic map (
                addr_width => srl_addr_width,
                use_carry  => 1,
                srinit     => init)
              port map (
                d      => srl_net(width, depth - 1),
                clk    => clk,
                a      => ai(srl_addr_width-1 downto 0),
                ce     => ce_i,
                q      => mux_in(width, depth),
                qcarry => srl_net(width, depth));
          end generate gen_middle;
          gen_final : if depth = (number_of_rams - 1) and depth /= 0 generate
            i_lls_last_c : entity c_shift_ram_v12_0_10.sr(xilinx)
              generic map (
                addr_width => srl_addr_width,
                use_carry  => 0,
                srinit     => init)
              port map (
                d      => srl_net(width, depth - 1),
                clk    => clk,
                a      => ai(srl_addr_width-1 downto 0),
                ce     => ce_i,
                q      => mux_in(width, depth),
                qcarry => open);
          end generate gen_final;
        end generate gen_depth;
      end generate gen_width;

    end generate s3_v2_v4_v5_lls;


    i_no_mux : if c_depth < (srl_depth+1) generate
      -- Don't need a mux on the output
      i_non_muxed_outputs : for width in 0 to c_width-1 generate
        output_net(width) <= mux_in(width, 0);
      end generate i_non_muxed_outputs;
    end generate i_no_mux;

    gen_mux : if c_depth >= (srl_depth+1) generate
      -- assign default value to all zeros as it's used in the RTL register
      -- and we need the POR value to be zero since these registers are not in the datapath
      signal sel_pipe_out : std_logic_vector(c_addr_width-1 downto srl_addr_width) := (others => '0');
    begin

      -- Use the register BaseBlock to pipeline the multiplexer select lines
      -- Do this here to allow resource-sharing of the registers and save XST
      -- work in optimising the circuit
      process (clk) is
      begin
        if rising_edge(clk) then
          if ce_i = '1' then
            sel_pipe_out <= ai(c_addr_width-1 downto srl_addr_width);
          end if;
        end if;
      end process;

      gen_speedmux : for width in 0 to c_width-1 generate
        speedmux : entity c_shift_ram_v12_0_10.c_shift_ram_speedmux(struct)
          generic map(
            c_xdevicefamily => device_family,
            c_width         => number_of_rams,
            c_sel_width     => c_addr_width-srl_addr_width,
            c_ainit_val     => sl_to_str(ainit_val(width)),
            c_sinit_val     => sl_to_str(sinit_val(width)),
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_ainit     => c_has_ainit,
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_sinit     => c_has_sinit,
            c_reg_last_bit  => c_reg_last_bit)
          port map(
            d     => mux_in_bus(width),
            sel   => sel_pipe_out,
            clk   => clk,
            ce    => ce,
            aset  => aset,
            aclr  => aclr,
            ainit => ainit,
            sset  => sset,
            sclr  => sclr,
            sinit => sinit,
            q     => output_net(width));
      end generate gen_speedmux;

    end generate gen_mux;

    gen_mux_in : process (mux_in) is
      variable temp_mux_in : std_logic_vector(number_of_rams-1 downto 0);
    begin  -- PROCESS gen_mux_in
      for width in 0 to c_width-1 loop
        for depth in 0 to number_of_rams-1 loop
          temp_mux_in(depth) := mux_in(width, depth);
        end loop;  -- depth
        mux_in_bus(width) <= temp_mux_in;
      end loop;  -- width
    end process gen_mux_in;

  end generate lls_speed;


end struct;




-- $Id: c_shift_ram_v12_0_10_viv.vhd,v 1.6 2010/09/08 11:23:24 andreww Exp $
--
--  (c) Copyright 1995-2009 Xilinx, Inc. All rights reserved.
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

library c_shift_ram_v12_0_10;
use c_shift_ram_v12_0_10.c_shift_ram_v12_0_10_pkg.all;

--core_if on entity c_shift_ram_v12_0_10_viv
  entity c_shift_ram_v12_0_10_viv is
    generic (
      C_XDEVICEFAMILY      : string  := "no_family";
      C_VERBOSITY          : integer := 0;  --0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_WIDTH              : integer := 16;  -- default is 16
      C_DEPTH              : integer := 16;  -- srl16 depth (default = 16 = 1x srl16)
      C_ADDR_WIDTH         : integer := 4;  -- dependent on c_width value specified
      C_SHIFT_TYPE         : integer := 0; --  -- 0=fixed, 1=lossless
      C_OPT_GOAL           : integer := 0;  -- 0=area, 1=speed
      C_AINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output
      C_SINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output
      C_DEFAULT_DATA       : string  := "0000000000000000";  -- no init details, use this val
      C_HAS_A              : integer := 0;  -- address bus only exists for var length
      C_HAS_CE             : integer := 0;
      C_REG_LAST_BIT       : integer := 0;  -- register last output bit (with ff)
      C_SYNC_PRIORITY      : integer := 1;  -- applies only to registered output
      C_SYNC_ENABLE        : integer := 0;  -- applies only to registered output
      C_HAS_SCLR           : integer := 0;  -- applies only to registered output
      C_HAS_SSET           : integer := 0;  -- applies only to registered output
      C_HAS_SINIT          : integer := 0;  -- applies only to registered output
      C_MEM_INIT_FILE      : string  := "init.mif";
      C_ELABORATION_DIR    : string  := "./";
      C_READ_MIF           : integer := 0;
      C_PARSER_TYPE        : integer := 0   -- 0:Verific, 1:Classic Parser
      );
    port (
      A     : in  std_logic_vector(c_addr_width-1 downto 0) := (others => '0');
      D     : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      CLK   : in  std_logic := '0';
      CE    : in  std_logic := '1';
      SCLR  : in  std_logic := '0';
      SSET  : in  std_logic := '0';
      SINIT : in  std_logic := '0';
      Q     : out std_logic_vector(c_width-1 downto 0) := (others => '0')
      );
--core_if off

  attribute secure_bitstream                            : string;
  attribute secure_bitstream of c_shift_ram_v12_0_10_viv   : entity is "off";
  attribute secure_config                               : string;
  attribute secure_config of c_shift_ram_v12_0_10_viv      : entity is "protect";
  attribute secure_netlist                              : string;
  attribute secure_netlist of c_shift_ram_v12_0_10_viv     : entity is "encrypt";
  attribute secure_extras                               : string;
  attribute secure_extras of c_shift_ram_v12_0_10_viv      : entity is "A";
  attribute secure_net_editing                          : string;
  attribute secure_net_editing of c_shift_ram_v12_0_10_viv : entity is "off";

end c_shift_ram_v12_0_10_viv;

architecture synth of c_shift_ram_v12_0_10_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Generic checking is done inside the legacy core.  No need to do it here.

begin
  i_bb_inst : entity c_shift_ram_v12_0_10.c_shift_ram_v12_0_10_legacy(struct)
    generic map(
      C_XDEVICEFAMILY      => C_XDEVICEFAMILY,
      C_VERBOSITY          => C_VERBOSITY,
      C_WIDTH              => C_WIDTH,
      C_DEPTH              => C_DEPTH,
      C_ADDR_WIDTH         => C_ADDR_WIDTH,
      C_SHIFT_TYPE         => C_SHIFT_TYPE,
      C_OPT_GOAL           => C_OPT_GOAL,
      C_AINIT_VAL          => C_AINIT_VAL,
      C_SINIT_VAL          => C_SINIT_VAL,
      C_DEFAULT_DATA       => C_DEFAULT_DATA,
      C_DEFAULT_DATA_RADIX => 1,
      C_HAS_A              => C_HAS_A,
      C_HAS_CE             => C_HAS_CE,
      C_REG_LAST_BIT       => C_REG_LAST_BIT,
      C_SYNC_PRIORITY      => C_SYNC_PRIORITY,
      C_SYNC_ENABLE        => C_SYNC_ENABLE,
      C_HAS_SCLR           => C_HAS_SCLR,
      C_HAS_SSET           => C_HAS_SSET,
      C_HAS_SINIT          => C_HAS_SINIT,
      C_MEM_INIT_FILE      => C_MEM_INIT_FILE,
      C_ELABORATION_DIR    => C_ELABORATION_DIR,
      C_MEM_INIT_RADIX     => 1,
      C_GENERATE_MIF       => 0,
      C_READ_MIF           => C_READ_MIF,
      C_PARSER_TYPE        => C_PARSER_TYPE
      )
    port map(
      A                    => A,
      D                    => D,
      CLK                  => CLK,
      CE                   => CE,
      SCLR                 => SCLR,
      SSET                 => SSET,
      SINIT                => SINIT,
      Q                    => Q
      );

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

library c_shift_ram_v12_0_10;
use c_shift_ram_v12_0_10.c_shift_ram_v12_0_10_viv_comp.all;

entity c_shift_ram_v12_0_10 is
  generic (
      C_XDEVICEFAMILY      : string  := "no_family"; 
      C_VERBOSITY          : integer := 0;  --0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_WIDTH              : integer := 16;  -- default is 16
      C_DEPTH              : integer := 16;  -- srl16 depth (default = 16 = 1x srl16) 
      C_ADDR_WIDTH         : integer := 4;  -- dependent on c_width value specified
      C_SHIFT_TYPE         : integer := 0; --  -- 0=fixed, 1=lossless
      C_OPT_GOAL           : integer := 0;  -- 0=area, 1=speed
      C_AINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output
      C_SINIT_VAL          : string  := "0000000000000000";  -- applies only to registered output    
      C_DEFAULT_DATA       : string  := "0000000000000000";  -- no init details, use this val
      C_HAS_A              : integer := 0;  -- address bus only exists for var length
      C_HAS_CE             : integer := 0;
      C_REG_LAST_BIT       : integer := 1;  -- register last output bit (with ff)
      C_SYNC_PRIORITY      : integer := 1;  -- applies only to registered output
      C_SYNC_ENABLE        : integer := 0;  -- applies only to registered output
      C_HAS_SCLR           : integer := 0;  -- applies only to registered output
      C_HAS_SSET           : integer := 0;  -- applies only to registered output
      C_HAS_SINIT          : integer := 0;  -- applies only to registered output
      C_MEM_INIT_FILE      : string  := "no_coe_file_loaded";
      C_ELABORATION_DIR    : string  := "./";
      C_READ_MIF           : integer := 0;
      C_PARSER_TYPE        : integer := 0   -- 0:Verific, 1:Classic Parser
      );
  port (
      A     : in  std_logic_vector(c_addr_width-1 downto 0) := (others => '0');
      D     : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      CLK   : in  std_logic := '0';
      CE    : in  std_logic := '1';
      SCLR  : in  std_logic := '0';
      SSET  : in  std_logic := '0';
      SINIT : in  std_logic := '0';
      Q     : out std_logic_vector(c_width-1 downto 0) := (others => '0')
      );
--core_if off

end entity c_shift_ram_v12_0_10;

architecture xilinx of c_shift_ram_v12_0_10 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";


  -- OBSOLETE: Can be removed
  function find_parser_type (
    family : string
  )
  return integer is
  begin
    return 0;  -- Only Vivado supported now.

  end find_parser_type;
  
  constant retargeted_fam : string := c_xdevicefamily_to_c_family (c_xdevicefamily );
begin
  i_synth : c_shift_ram_v12_0_10_viv
  generic map (
    C_XDEVICEFAMILY => C_XDEVICEFAMILY,
    C_VERBOSITY => C_VERBOSITY,
    C_WIDTH => C_WIDTH,
    C_DEPTH => C_DEPTH,
    C_ADDR_WIDTH => C_ADDR_WIDTH,
    C_SHIFT_TYPE => C_SHIFT_TYPE,
    C_OPT_GOAL => C_OPT_GOAL,
    C_AINIT_VAL => C_AINIT_VAL,
    C_SINIT_VAL => C_SINIT_VAL,
    C_DEFAULT_DATA => C_DEFAULT_DATA,
    C_HAS_A => C_HAS_A,
    C_HAS_CE => C_HAS_CE,
    C_REG_LAST_BIT => C_REG_LAST_BIT,
    C_SYNC_PRIORITY => C_SYNC_PRIORITY,
    C_SYNC_ENABLE => C_SYNC_ENABLE,
    C_HAS_SCLR => C_HAS_SCLR,
    C_HAS_SSET => C_HAS_SSET,
    C_HAS_SINIT => C_HAS_SINIT,
    C_MEM_INIT_FILE => C_MEM_INIT_FILE,
    C_ELABORATION_DIR => C_ELABORATION_DIR,
    C_READ_MIF => C_READ_MIF,
    C_PARSER_TYPE => find_parser_type (retargeted_fam )
  )
  port map (
    A => A,
    D => D,
    CLK => CLK,
    CE => CE,
    SCLR => SCLR,
    SSET => SSET,
    SINIT => SINIT,
    Q => Q
  );
  
end architecture xilinx;




