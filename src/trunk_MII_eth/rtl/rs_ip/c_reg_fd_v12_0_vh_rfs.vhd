-- $RCSfile: c_reg_fd_v12_0_3_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 15:24:14 $
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
-- Filename - c_reg_fd_v12_0_3_comp.vhd
-- Author - Xilinx
-- Creation - 25 Feb 1999
--
-- Description - This file contains the component declaration for
-- the c_reg_fd_v12_0_3 core

library IEEE;
use IEEE.std_logic_1164.all;

package c_reg_fd_v12_0_3_comp is

  component c_reg_fd_v12_0_3
    generic (
      C_WIDTH         : integer := 16;
      C_AINIT_VAL     : string  := "0";
      C_SINIT_VAL     : string  := "0";
      C_SYNC_PRIORITY : integer := 1;   --c_clear;
      C_SYNC_ENABLE   : integer := 0;   --c_override;
      C_HAS_CE        : integer := 0;
      C_HAS_ACLR      : integer := 0;
      C_HAS_ASET      : integer := 0;
      C_HAS_AINIT     : integer := 0;
      C_HAS_SCLR      : integer := 0;
      C_HAS_SSET      : integer := 0;
      C_HAS_SINIT     : integer := 0;
      C_ENABLE_RLOCS  : integer := 0
      );

    port (
      D     : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
      CLK   : in  std_logic                            := '0';
      CE    : in  std_logic                            := '1';
      ACLR  : in  std_logic                            := '0';
      ASET  : in  std_logic                            := '0';
      AINIT : in  std_logic                            := '0';
      SCLR  : in  std_logic                            := '0';
      SSET  : in  std_logic                            := '0';
      SINIT : in  std_logic                            := '0';
      Q     : out std_logic_vector(C_WIDTH-1 downto 0) := (others => '0')
      );
  end component;

end c_reg_fd_v12_0_3_comp;


-- $RCSfile: c_reg_fd_v12_0_3_viv_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 15:24:14 $
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

library IEEE;
use IEEE.std_logic_1164.all;


package c_reg_fd_v12_0_3_viv_comp is

  component c_reg_fd_v12_0_3_viv
    generic (
      C_WIDTH         : integer := 16;
      C_AINIT_VAL     : string  := "0";
      C_SINIT_VAL     : string  := "0";
      C_SYNC_PRIORITY : integer := 1;
      C_SYNC_ENABLE   : integer := 0;
      C_HAS_CE        : integer := 0;
      C_HAS_ACLR      : integer := 0;
      C_HAS_ASET      : integer := 0;
      C_HAS_AINIT     : integer := 0;
      C_HAS_SCLR      : integer := 0;
      C_HAS_SSET      : integer := 0;
      C_HAS_SINIT     : integer := 0;
      C_ENABLE_RLOCS  : integer := 0
      );

    port (
      D     : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
      CLK   : in  std_logic                            := '0';
      CE    : in  std_logic                            := '1';
      ACLR  : in  std_logic                            := '0';
      ASET  : in  std_logic                            := '0';
      AINIT : in  std_logic                            := '0';
      SCLR  : in  std_logic                            := '0';
      SSET  : in  std_logic                            := '0';
      SINIT : in  std_logic                            := '0';
      Q     : out std_logic_vector(C_WIDTH-1 downto 0) := (others => '0')
      );
  end component;

end c_reg_fd_v12_0_3_viv_comp;


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
-- c_reg_fd_v12_0_3.vhd
-- top level
-- This entity implements a dtype flipflop register with the following
-- features:
-- width from 1 to 256 bits
-- optional ACLR, ASET, AINIT, AINIT_VAL, SCLR, SSET, SINIT, SINIT_VAL
-- optional CE
-- optional C_SYNC_ENABLE and C_SYNC_PRIORITY
-- All generics default to typical use.
--
-- Design Notes:
-- This component is split into the generation of CE, of SYNC controls,
-- of the D input and of the selection of the Register primitive.
-- This is because when C_SYNC_ENABLE = CE_OVERRIDES_SYNC, the SYNC
-- controls are modified, hence LUTS. Conversely, when SYNC_OVERRIDES_CE
-- the CE is modified, hence a LUT. Note that the LUTs to modify SYNC
-- controls or CE need only occur once, no matter how wide the register
-- bus.
-- However, the modification of D must be per register. D is modified
-- when both ASYNC and SYNC controls are present. The primitives only
-- allow one or the other, with ASYNC taking priority. In these cases,
-- SYNC controls must modify the D input. Of cource, CE gets in on the act
-- here too, and just to add further complication, C_SYNC_PRIORITY means
-- that the SYNC control sset can modify sclr. Note that the converse is
-- not required since the default behaviour of the register primitives
-- is that clr overrides set.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

entity c_reg_fd_v12_0_3_viv is
  generic (
    C_WIDTH         :     integer   := 1;
    C_AINIT_VAL     :     string    := "0";
    C_SINIT_VAL     :     string    := "0";
    C_SYNC_PRIORITY :     integer   := c_clear;
    C_SYNC_ENABLE   :     integer   := c_override;
    C_HAS_CE        :     integer   := 0;
    C_HAS_ACLR      :     integer   := 0;
    C_HAS_ASET      :     integer   := 0;
    C_HAS_AINIT     :     integer   := 0;
    C_HAS_SCLR      :     integer   := 0;
    C_HAS_SSET      :     integer   := 0;
    C_HAS_SINIT     :     integer   := 0;
    C_ENABLE_RLOCS  :     integer   := 0
    );
  port (
    CLK             : in  std_logic := '0';
    CE              : in  std_logic := '1';
    AINIT           : in  std_logic := '0';
    ACLR            : in  std_logic := '0';
    ASET            : in  std_logic := '0';
    SINIT           : in  std_logic := '0';
    SCLR            : in  std_logic := '0';
    SSET            : in  std_logic := '0';
    D               : in  std_logic_vector(C_WIDTH-1 downto 0);
    Q               : out std_logic_vector(C_WIDTH-1 downto 0)
    );
end c_reg_fd_v12_0_3_viv;

architecture structural of c_reg_fd_v12_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of structural : architecture is "yes";


  function check_generics (width                                                               : integer;
                           ainit_val, sinit_val                                                : string;
                           has_aclr, has_aset, has_ainit                                       : integer;
                           has_sclr, has_sset, has_sinit                                       : integer;
                           rlocs                                                               : integer;
                           reg_type                                                            : integer;
                           sync_priority                                                       : T_REG_PRIORITY;
                           sync_enable                                                         : T_SYNC_ENABLE)
    return integer is
  begin
    assert rlocs = 0 report "WARNING - reg                                                     : Location constraints are not supported" severity warning;
    assert reg_type = 1 report "ERROR - reg                                                    : Only fd type registers are currently supported" severity failure;
    assert not(width < 1 or width > 258) report "ERROR - reg                                   : Width must be in the range 1 to 256" severity failure;
    assert has_ainit = 0 or (has_aclr = 0 and has_aset = 0) report "ERROR - reg                : ainit is mutually exclusive with aclr or aset" severity failure;
    assert has_sinit = 0 or (has_sclr = 0 and has_sset = 0) report "ERROR - reg                : sinit is mutually exclusive with sclr or sset" severity failure;
    assert has_ainit = 0 or (has_ainit = 1 and ainit_val'length = width) report "WARNING - reg : ainit_val will be padded with 0's or truncated to match c_width" severity warning;
    assert has_sinit = 0 or (has_sinit = 1 and sinit_val'length = width) report "WARNING - reg : sinit_val will be padded with 0's or truncated to match c_width" severity warning;
    return 0;
  end check_generics;

  -- purpose: to create a compound constant to determine which primitive is required
  constant ci_sync_enable   : T_SYNC_ENABLE  := fn_select_sync_enable(c_sync_enable);      -- priority of CE over SCLR/SSET/SINIT
  constant ci_sync_priority : T_REG_PRIORITY := fn_select_sync_priority(c_sync_priority);  -- priority of CE over SCLR/SSET/SINIT
  constant check_gens       : integer        := check_generics(c_width, c_ainit_val, c_sinit_val,
                                                               c_has_aclr, c_has_aset, c_has_ainit,
                                                               c_has_sclr, c_has_sset, c_has_sinit,
                                                               c_enable_rlocs, c_reg_fd,
                                                               ci_sync_priority, ci_sync_enable
                                                               );

  constant ainit_val : std_logic_vector(c_width downto 1) := str_to_bound_slv_0(c_ainit_val, c_width);
  constant sinit_val : std_logic_vector(c_width downto 1) := str_to_bound_slv_0(c_sinit_val, c_width);

  signal sclr_i  : std_logic := '0';    -- optional
  signal sset_i  : std_logic := '0';    -- optional
  signal sinit_i : std_logic := '0';    -- optional
  signal ce_i    : std_logic := '1';    -- optional

  -- there are two possible macros to be targeted:
  -- 1) Asynchronous controls (ACLR, ASET or AINIT) are present.
  --    in this case, the synchronous controls (SCLR, SSET, SINIT) must be
  --    implemented in LUTs on the D-path; this way CE naturally overrides SCLR and co.
  -- 2) Asynchronous controls are not present.
  --    in this case, the synchronous controls should use the primitive's
  --    SET and RESET inputs; so SCLR and co naturally override CE.
  -- in order to implement reversal of these natural priorities, the signals
  -- must be gated before they reach the macro.

  -- signals for LUT-based sync controls
  signal sclr_lut  : std_logic := '0';
  signal sset_lut  : std_logic := '0';
  signal sinit_lut : std_logic := '0';
  signal ce_lut    : std_logic := '1';

  -- signals for primitive-based sync controls
  signal sclr_prim  : std_logic := '0';
  signal sset_prim  : std_logic := '0';
  signal sinit_prim : std_logic := '0';
  signal ce_prim    : std_logic := '1';

  signal output : std_logic_vector(c_width downto 1) := fn_get_por_value(c_has_aclr, c_has_aset, c_has_ainit, c_has_sclr, c_has_sset, c_has_sinit, ainit_val, sinit_val, c_width);

begin

  -------------------------------------------------------------------------
  -- CE Generation
  -------------------------------------------------------------------------
  i_ce   : if c_has_ce /= 0 generate
    ce_i <= ce;
  end generate i_ce;
  i_noce : if c_has_ce = 0 generate
    ce_i <= '1';
  end generate i_noce;

  -------------------------------------------------------------------------
  -- SYNC Ctrls
  -------------------------------------------------------------------------
  i_sinit   : if c_has_sinit /= 0 generate
    sinit_i <= sinit;
  end generate i_sinit;
  i_nosinit : if c_has_sinit = 0 generate
    sinit_i <= '0';
  end generate i_nosinit;

  i_sset   : if c_has_sset /= 0 generate
    sset_i <= sset;
  end generate i_sset;
  i_nosset : if c_has_sset = 0 generate
    sset_i <= '0';
  end generate i_nosset;

  -- reset naturally overrides set; must add a gate to counteract this
  -- if set is to override reset.
  i_sclr             : if c_has_sclr /= 0 generate
    i_set_over_reset : if ci_sync_priority = SET_OVERRIDES_RESET generate
      sclr_i <= sclr and not sset_i;    -- when sset is not present, sset_i = 0
    end generate i_set_over_reset;
    i_reset_over_set : if ci_sync_priority = RESET_OVERRIDES_SET generate
      sclr_i <= sclr;
    end generate i_reset_over_set;
  end generate i_sclr;
  i_nosclr           : if c_has_sclr = 0 generate
    sclr_i   <= '0';
  end generate i_nosclr;

  i_async_controls : if not(c_has_aclr = 0 and c_has_aset = 0 and c_has_ainit = 0) generate
    -- SCLR etc must be implemented in LUTs on the D-path.
    -- CE naturally overrides SCLR, SSET and SINIT
    sclr_lut  <= sclr_i;
    sset_lut  <= sset_i;
    sinit_lut <= sinit_i;
    i_ce_over_sync : if ci_sync_enable = CE_OVERRIDES_SYNC generate
      ce_lut  <= ce_i;
    end generate i_ce_over_sync;
    i_sync_over_ce : if ci_sync_enable = SYNC_OVERRIDES_CE generate
      -- so if the user requests "unnatural" priority (SYNC over CE)
      -- must modify the CE signal.
      ce_lut  <= ce_i or sclr_i or sset_i or sinit_i;
    end generate i_sync_over_ce;

    -------------------------------------------------------------------------------
    -- Register Macro with async controls
    -------------------------------------------------------------------------------
    reg : process (aclr, aset, ainit, clk)
    begin  -- PROCESS reg
      if c_has_aclr = 1 and aclr = '1' then
        output     <= (others => '0');
      elsif c_has_aset = 1 and aset = '1' then
        output     <= (others => '1');
      elsif c_has_ainit = 1 and ainit = '1' then
        output     <= ainit_val;
      elsif rising_edge(clk) then
        if ce_lut = '1' then
          if sclr_lut = '1' then
            output <= (others => '0');
          elsif sset_lut = '1' then
            output <= (others => '1');
          elsif sinit_lut = '1' then
            output <= sinit_val;
          else
            output <= d;
          end if;
        end if;
      end if;
    end process reg;

  end generate i_async_controls;

  i_no_async_controls : if c_has_aclr = 0 and c_has_aset = 0 and c_has_ainit = 0 generate
    -- SCLR etc can be implemented using primitive controls
    -- CE naturally overrides SCLR, SSET and SINIT
    ce_prim      <= ce_i;
    i_sync_over_ce    : if ci_sync_enable = SYNC_OVERRIDES_CE generate
      sclr_prim  <= sclr_i;
      sset_prim  <= sset_i;
      sinit_prim <= sinit_i;
    end generate i_sync_over_ce;
    i_ce_over_sync    : if ci_sync_enable = CE_OVERRIDES_SYNC generate
      -- so if the user requests "unnatural" priority (CE over SYNC),
      -- must modify the sync control signals
      sclr_prim  <= sclr_i and ce_i;
      sset_prim  <= sset_i and ce_i;
      sinit_prim <= sinit_i and ce_i;
    end generate i_ce_over_sync;

    -------------------------------------------------------------------------------
    -- Register Macro with no async controls
    -------------------------------------------------------------------------------
    reg : process (clk)
    begin  -- PROCESS reg
      if rising_edge(clk) then
        if sclr_prim = '1' then
          output <= (others => '0');
        elsif sset_prim = '1' then
          output <= (others => '1');
        elsif sinit_prim = '1' then
          output <= sinit_val;
        elsif ce_prim = '1' then
          output <= d;
        end if;
      end if;
    end process reg;

  end generate i_no_async_controls;

  q <= output;

end structural;



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

library c_reg_fd_v12_0_3;
use c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.all;

entity c_reg_fd_v12_0_3 is
  generic (
    C_WIDTH         :     integer   := 1;
    C_AINIT_VAL     :     string    := "0";
    C_SINIT_VAL     :     string    := "0";
    C_SYNC_PRIORITY :     integer   := 1;  -- c_clear;
    C_SYNC_ENABLE   :     integer   := 0;  -- c_override;
    C_HAS_CE        :     integer   := 0;
    C_HAS_ACLR      :     integer   := 0;
    C_HAS_ASET      :     integer   := 0;
    C_HAS_AINIT     :     integer   := 0;
    C_HAS_SCLR      :     integer   := 0;
    C_HAS_SSET      :     integer   := 0;
    C_HAS_SINIT     :     integer   := 0;
    C_ENABLE_RLOCS  :     integer   := 0
    );
  port (
    CLK             : in  std_logic := '0';
    CE              : in  std_logic := '1';
    AINIT           : in  std_logic := '0';
    ACLR            : in  std_logic := '0';
    ASET            : in  std_logic := '0';
    SINIT           : in  std_logic := '0';
    SCLR            : in  std_logic := '0';
    SSET            : in  std_logic := '0';
    D               : in  std_logic_vector(C_WIDTH-1 downto 0);
    Q               : out std_logic_vector(C_WIDTH-1 downto 0)
    );
end entity c_reg_fd_v12_0_3;

architecture xilinx of c_reg_fd_v12_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  fd : c_reg_fd_v12_0_3_viv
    generic map (
      C_WIDTH         => C_WIDTH,
      C_AINIT_VAL     => C_AINIT_VAL,
      C_SINIT_VAL     => C_SINIT_VAL,
      C_SYNC_PRIORITY => C_SYNC_PRIORITY,
      C_SYNC_ENABLE   => C_SYNC_ENABLE,
      C_HAS_CE        => C_HAS_CE,
      C_HAS_ACLR      => C_HAS_ACLR,
      C_HAS_ASET      => C_HAS_ASET,
      C_HAS_AINIT     => C_HAS_AINIT,
      C_HAS_SCLR      => C_HAS_SCLR,
      C_HAS_SSET      => C_HAS_SSET,
      C_HAS_SINIT     => C_HAS_SINIT
      )
    port map (
      CLK             => CLK,
      CE              => CE,
      AINIT           => AINIT,
      ACLR            => ACLR,
      ASET            => ASET,
      SINIT           => SINIT,
      SCLR            => SCLR,
      SSET            => SSET,
      D               => D,
      Q               => Q
      );

end architecture xilinx;




