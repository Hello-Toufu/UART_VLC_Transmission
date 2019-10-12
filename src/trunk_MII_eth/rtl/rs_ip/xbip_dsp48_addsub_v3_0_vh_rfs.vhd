-- $RCSfile: xbip_dsp48_addsub_v3_0_3_viv_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 16:46:31 $
--------------------------------------------------------------------------------
--  (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

package xbip_dsp48_addsub_v3_0_3_viv_comp is

  component xbip_dsp48_addsub_v3_0_3_viv is
    generic (
      C_VERBOSITY       : integer := 0;  -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE      : integer := 0;  -- 0 = synth, 1 = RTL
      C_XDEVICEFAMILY   : string  := "virtex4";
      C_LATENCY         : integer := -1;
      C_USE_CARRYCASCIN : integer := 0;
      C_USE_PCIN        : integer := 0;
      C_USE_ACIN        : integer := 0;
      C_USE_BCIN        : integer := 0
      );
    port (
      CLK          : in  std_logic                                                           := '1';
      CE           : in  std_logic                                                           := '1';
      SCLR         : in  std_logic                                                           := '0';
      SUBTRACT     : in  std_logic                                                           := '0';
      BYPASS       : in  std_logic                                                           := '0';
      CARRYIN      : in  std_logic                                                           := '0';
      CARRYCASCIN  : in  std_logic                                                           := '0';
      PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
      C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
      PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      CARRYOUT     : out std_logic                                                           := '0';
      CARRYCASCOUT : out std_logic                                                           := '0';
      P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
      );
  end component xbip_dsp48_addsub_v3_0_3_viv;

end xbip_dsp48_addsub_v3_0_3_viv_comp;


-- $RCSfile: xbip_dsp48_addsub_v3_0_3_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 16:46:31 $
--------------------------------------------------------------------------------
--  (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

package xbip_dsp48_addsub_v3_0_3_comp is

  component xbip_dsp48_addsub_v3_0_3 is
    generic (
      C_VERBOSITY       : integer := 0;  -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE      : integer := 0;  -- 0 = synth, 1 = RTL
      C_XDEVICEFAMILY   : string  := "virtex4";
      C_LATENCY         : integer := -1;
      C_USE_CARRYCASCIN : integer := 0;
      C_USE_PCIN        : integer := 0;
      C_USE_ACIN        : integer := 0;
      C_USE_BCIN        : integer := 0
      );
    port (
      CLK          : in  std_logic                                                           := '1';
      CE           : in  std_logic                                                           := '1';
      SCLR         : in  std_logic                                                           := '0';
      SUBTRACT     : in  std_logic                                                           := '0';
      BYPASS       : in  std_logic                                                           := '0';
      CARRYIN      : in  std_logic                                                           := '0';
      CARRYCASCIN  : in  std_logic                                                           := '0';
      PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
      C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
      PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      CARRYOUT     : out std_logic                                                           := '0';
      CARRYCASCOUT : out std_logic                                                           := '0';
      P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
      );
  end component xbip_dsp48_addsub_v3_0_3;



end xbip_dsp48_addsub_v3_0_3_comp;


-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_dsp48_addsub_v3_0_3/hdl/xbip_dsp48_addsub_v3_0_3_pkg.vhd,v 1.3 2009/09/08 16:46:31 akennedy Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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

-- $EDIT_WARNING

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.conv_std_logic_vector;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

-------------------------------------------------------------------------------
-- Designer note!!
-- This file is for the top level component declaration and any types and functions
-- which calling cores may require. Internal functions, types and component declarations
-- should be in the dsp48_addsub_hdl_pkg file.
-------------------------------------------------------------------------------

package xbip_dsp48_addsub_v3_0_3_pkg is

  -- purpose: sets DSP48 A MULT port in according to family
--  function fn_a_width (
--    p_xdevicefamily : string)
--    return integer;

  function fn_dsp48_addsub_check_generics (
    P_VERBOSITY       : integer := 0;  -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
    P_MODEL_TYPE      : integer := 0;   -- 0 = synth, 1 = RTL
    P_XDEVICEFAMILY   : string  := "virtex4";
    P_LATENCY         : integer := 1;
    P_USE_CARRYCASCIN : integer := 0;
    P_USE_PCIN        : integer := 0;
    P_USE_ACIN        : integer := 0;
    P_USE_BCIN        : integer := 0
    ) return integer;


  --core_if on component xbip_dsp48_addsub
  component xbip_dsp48_addsub
    generic (
      C_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
      C_XDEVICEFAMILY   : string  := "virtex4";
      C_LATENCY         : integer := -1;
      C_USE_CARRYCASCIN : integer := 0;
      C_USE_PCIN        : integer := 0;
      C_USE_ACIN        : integer := 0;
      C_USE_BCIN        : integer := 0
      );
    port (
      CLK          : in  std_logic                                                           := '1';
      CE           : in  std_logic                                                           := '1';
      SCLR         : in  std_logic                                                           := '0';
      SUBTRACT     : in  std_logic                                                           := '0';
      BYPASS       : in  std_logic                                                           := '0';
      CARRYIN      : in  std_logic                                                           := '0';
      CARRYCASCIN  : in  std_logic                                                           := '0';
      PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
      C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
      PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      CARRYOUT     : out std_logic                                                           := '0';
      CARRYCASCOUT : out std_logic                                                           := '0';
      P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
      );
  end component;
  --core_if off

  --core_if on component xbip_dsp48_addsub_synth
  component xbip_dsp48_addsub_synth
    generic (
      C_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
      C_XDEVICEFAMILY   : string  := "virtex4";
      C_LATENCY         : integer := -1;
      C_USE_CARRYCASCIN : integer := 0;
      C_USE_PCIN        : integer := 0;
      C_USE_ACIN        : integer := 0;
      C_USE_BCIN        : integer := 0
      );
    port (
      CLK          : in  std_logic                                                           := '1';
      CE           : in  std_logic                                                           := '1';
      SCLR         : in  std_logic                                                           := '0';
      SUBTRACT     : in  std_logic                                                           := '0';
      BYPASS       : in  std_logic                                                           := '0';
      CARRYIN      : in  std_logic                                                           := '0';
      CARRYCASCIN  : in  std_logic                                                           := '0';
      PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
      C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
      PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      CARRYOUT     : out std_logic                                                           := '0';
      CARRYCASCOUT : out std_logic                                                           := '0';
      P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
      );
  end component;
  --core_if off

  --core_if on component xbip_dsp48_addsub_rtl
  component xbip_dsp48_addsub_rtl
    generic (
      C_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
      C_XDEVICEFAMILY   : string  := "virtex4";
      C_LATENCY         : integer := -1;
      C_USE_CARRYCASCIN : integer := 0;
      C_USE_PCIN        : integer := 0;
      C_USE_ACIN        : integer := 0;
      C_USE_BCIN        : integer := 0
      );
    port (
      CLK          : in  std_logic                                                           := '1';
      CE           : in  std_logic                                                           := '1';
      SCLR         : in  std_logic                                                           := '0';
      SUBTRACT     : in  std_logic                                                           := '0';
      BYPASS       : in  std_logic                                                           := '0';
      CARRYIN      : in  std_logic                                                           := '0';
      CARRYCASCIN  : in  std_logic                                                           := '0';
      PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
      C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
      PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      CARRYOUT     : out std_logic                                                           := '0';
      CARRYCASCOUT : out std_logic                                                           := '0';
      P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
      );
  end component;
  --core_if off

  --core_if on component xbip_dsp48_addsub_behv
  component xbip_dsp48_addsub_behv
    generic (
      C_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
      C_XDEVICEFAMILY   : string  := "virtex4";
      C_LATENCY         : integer := -1;
      C_USE_CARRYCASCIN : integer := 0;
      C_USE_PCIN        : integer := 0;
      C_USE_ACIN        : integer := 0;
      C_USE_BCIN        : integer := 0
      );
    port (
      CLK          : in  std_logic                                                           := '1';
      CE           : in  std_logic                                                           := '1';
      SCLR         : in  std_logic                                                           := '0';
      SUBTRACT     : in  std_logic                                                           := '0';
      BYPASS       : in  std_logic                                                           := '0';
      CARRYIN      : in  std_logic                                                           := '0';
      CARRYCASCIN  : in  std_logic                                                           := '0';
      PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
      C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
      PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
      ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
      BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
      CARRYOUT     : out std_logic                                                           := '0';
      CARRYCASCOUT : out std_logic                                                           := '0';
      P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
      );
  end component;
  --core_if off

  constant ci_max_latency       : integer := 4;
  type t_dsp48_addsub_pipe is array (0 to ci_max_latency) of integer;
  type t_dsp48_addsub_latency is record
                                 used : integer;
                                 pipe : t_dsp48_addsub_pipe;
                               end record;

  constant ci_stage1 : integer := 1;
  constant ci_stage2 : integer := 2;
  constant ci_stage3 : integer := 3;
  constant ci_stage4 : integer := 4;

  function fn_dsp48_addsub_latency (
    P_LATENCY       : integer;
    P_XDEVICEFAMILY : string)
    return t_dsp48_addsub_latency;

end package xbip_dsp48_addsub_v3_0_3_pkg;

package body xbip_dsp48_addsub_v3_0_3_pkg is

  -- purpose: sets DSP48 A MULT port in according to family
--  function fn_a_width (
--    p_xdevicefamily : string)
--    return integer is
--  begin  -- fn_a_width
--    if has_dsp48(p_xdevicefamily) or has_dsp48a(p_xdevicefamily) then
--      return 18;
--    elsif has_dsp48e(p_xdevicefamily) then
--      return 25;
--    else
--      assert false
--        report "ERROR: unsupported family in xbip_dsp48_addsub"
--        severity error;
--    end if;
--    return 18;
--  end fn_a_width;
--
  function fn_dsp48_addsub_check_generics (
    P_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
    P_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
    P_XDEVICEFAMILY   : string  := "virtex4";
    P_LATENCY         : integer := 1;
    P_USE_CARRYCASCIN : integer := 0;
    P_USE_PCIN        : integer := 0;
    P_USE_ACIN        : integer := 0;
    P_USE_BCIN        : integer := 0
    ) return integer is
  begin
    assert P_USE_PCIN = 0 or P_USE_PCIN = 1
      report "ERROR: xbip_dsp48_addsub: C_USE_PCIN out of range"
      severity error;
    assert P_USE_ACIN = 0 or P_USE_ACIN = 1
      report "ERROR: xbip_dsp48_addsub: C_USE_ACIN out of range"
      severity error;
    assert P_USE_ACIN = 0 or supports_dsp48e(P_XDEVICEFAMILY)>0
      report "ERROR: xbip_dsp48_addsub: ACIN can only be used for Virtex 5"
      severity error;
    assert P_USE_BCIN = 0 or P_USE_BCIN = 1
      report "ERROR: xbip_dsp48_addsub: C_USE_BCIN out of range"
      severity error;
    assert P_USE_CARRYCASCIN = 0 or P_USE_CARRYCASCIN = 1
      report "ERROR: xbip_dsp48_addsub: C_USE_CARRYCASCIN out of range"
      severity error;
    assert P_USE_CARRYCASCIN = 0 or supports_dsp48a(P_XDEVICEFAMILY)>0 or supports_dsp48e(P_XDEVICEFAMILY)>0
      report "ERROR: xbip_dsp48_addsub: C_USE_CARRYCASCIN is unavailable for this family"
      severity error;
    assert (P_LATENCY >= -1 and P_LATENCY <= 2) or (P_LATENCY >= 16 and P_LATENCY <= 31)
      report "ERROR: xbip_dsp48_addsub: C_LATENCY out of range"
      severity ERROR;
    assert (P_USE_CARRYCASCIN + P_USE_PCIN) < 2
      report "ERROR: xbip_dsp48_addsub: C_USE_CARRYCASCIN and C_USE_PCIN are mutually-exclusive"
      severity error;
    return 0;
  end function fn_dsp48_addsub_check_generics;

  function fn_dsp48_addsub_latency (
    P_LATENCY       : integer;
    P_XDEVICEFAMILY : string)
    return t_dsp48_addsub_latency is
    variable ret_val : t_dsp48_addsub_latency;
    variable v_latency_left : integer;
    variable v_slv_latency : std_logic_vector(ci_max_latency+1 downto 1) := (others => '0');
  begin
    --initialise all latency stages to 0.
    for i in 0 to ci_max_latency loop
      ret_val.pipe(i) := 0;
    end loop;  -- i
    ret_val.used   := 0;
    v_latency_left := p_latency;

    if p_latency >= 2**ci_max_latency and p_latency < 2**(ci_max_latency+1) then
      --hand-placed latency 'allocation'

      v_slv_latency(ci_max_latency+1 downto 1) := conv_std_logic_vector(p_latency, ci_max_latency+1);

      assert (v_slv_latency(1) = '0') and (v_slv_latency(2) = '0')
        report "ERROR: xbip_dsp48_multadd does not currently support stage 1 or stage 2 registers."
        severity error;
      for i in 3 to ci_max_latency loop
        if v_slv_latency(i) = '1' then
          ret_val.pipe(i) := 1;
          ret_val.used    := ret_val.used + 1;
        end if;
      end loop;  -- i
    else
      --deal out latency according to generics and architecture for optimal speed
      --and resource
      if v_latency_left /= 0 then
        v_latency_left          := v_latency_left-1;
        ret_val.pipe(ci_stage4) := ret_val.pipe(ci_stage4) +1;
        ret_val.used            := ret_val.used +1;
      end if;

      --NOTE: stage 2 is not allocated in the ADDSUB

      if v_latency_left /= 0 then
        v_latency_left          := v_latency_left-1;
        ret_val.pipe(ci_stage3) := ret_val.pipe(ci_stage3) +1;
        ret_val.used            := ret_val.used +1;
      end if;

      --lump any excess latency on last stage.
      if v_latency_left > 0 then
        assert false
          report "ERROR: excess latency in xbip_dsp48_addsub."
          severity error;
      end if;
    end if;

    return ret_val;

  end function fn_dsp48_addsub_latency;

end package body xbip_dsp48_addsub_v3_0_3_pkg;


-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_dsp48_addsub_v3_0_3/hdl/xbip_dsp48_addsub_rtl.vhd,v 1.3 2009/09/08 16:46:31 akennedy Exp $
--
--  (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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
-- This is the Synthesizable RTL model (aka 'soft instantiation')
-- This model is intended to be synthesized using only RTL and sub-blocks which
-- ultimately use only RTL. The purpose is to test XST inference QoR, but also
-- allow delivery of RTL-only source code.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_dsp48_addsub_v3_0_3;
use xbip_dsp48_addsub_v3_0_3.xbip_dsp48_addsub_v3_0_3_pkg.all;

--core_if on entity xbip_dsp48_addsub_rtl
entity xbip_dsp48_addsub_rtl is
  generic (
    C_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
    C_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
    C_XDEVICEFAMILY   : string  := "virtex4";
    C_LATENCY         : integer := -1;
    C_USE_CARRYCASCIN : integer := 0;
    C_USE_PCIN        : integer := 0;
    C_USE_ACIN        : integer := 0;
    C_USE_BCIN        : integer := 0
    );
  port (
    CLK          : in  std_logic                                                           := '1';
    CE           : in  std_logic                                                           := '1';
    SCLR         : in  std_logic                                                           := '0';
    SUBTRACT     : in  std_logic                                                           := '0';
    BYPASS       : in  std_logic                                                           := '0';
    CARRYIN      : in  std_logic                                                           := '0';
    CARRYCASCIN  : in  std_logic                                                           := '0';
    PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
    ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
    BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
    ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
    C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
    PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
    ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
    BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
    CARRYOUT     : out std_logic                                                           := '0';
    CARRYCASCOUT : out std_logic                                                           := '0';
    P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
    );
end xbip_dsp48_addsub_rtl;
--core_if off




architecture synth of xbip_dsp48_addsub_rtl is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: devolved checking of generics
  function fn_local_check_generics (
    p_model_type : integer)
    return integer is
  begin  -- local_check_generics
    --C_MODEL_TYPE
    assert p_model_type = 1
      report "ERROR: xxbip_dsp48_addsub_rtl: RTL model has been called with C_MODEL_TYPE set to something other than RTL"
      severity ERROR;
    return 0;                           --keeps modelsim happy.
  end fn_local_check_generics;
  constant c_local_check_generics : integer := fn_local_check_generics(C_MODEL_TYPE);
  
  constant dsp48_addsub_latency : t_dsp48_addsub_latency := fn_dsp48_addsub_latency(
    P_LATENCY       => C_LATENCY,
    P_XDEVICEFAMILY => C_XDEVICEFAMILY
    );
  constant ci_pipe : t_dsp48_addsub_pipe := dsp48_addsub_latency.pipe;
  
  -- signals section

  --dont confuse A0reg and A1reg with the DSP48 registers. They are just
  --different delays of the A port. In fact they become A1reg and the M reg once
  --inferred.
  signal a_i         : std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
  signal b_i         : std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
  signal carryin_i   : std_logic                                                           := '0';
  signal a0reg       : std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
  signal b0reg       : std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
  signal carryinreg  : std_logic                                                           := '0';
  signal carryin_mux : std_logic                                                           := '0';
  signal subtractreg : std_logic                                                           := '0';
  signal bypassreg   : std_logic                                                           := '0';
  signal d0reg       : std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-fn_dsp48_a_width(C_XDEVICEFAMILY)-ci_dsp48e1_b_width-1 downto 0)      := (others => '0');
  signal dab_in      : std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
  signal dab_i       : std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
  signal x_i         : std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
  signal c_i         : std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
  signal z_i         : std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
  signal p_i         : std_logic_vector(ci_dsp48e1_p_width+1-1 downto 0)                     := (others => '0');
  signal preg        : std_logic_vector(ci_dsp48e1_p_width+1-1 downto 0)                     := (others => '0');
  signal carryout_i  : std_logic := '0';
  signal carryoutreg : std_logic := '0';
  
  -- Need to mimic the opmode register to get correct reset behavior
  constant add : std_logic := '1';
  signal opmode_i : std_logic := '0';
  
  attribute use_dsp48 : string;
  attribute use_dsp48 of p_i : signal is "yes";
begin
  --select A source
  i_a: if C_USE_ACIN = 0 generate
    a_i <= ABCONCAT(fn_dsp48_a_width(C_XDEVICEFAMILY)+ci_dsp48e1_b_width-1 downto ci_dsp48e1_b_width);
  end generate i_a;
  i_acin: if C_USE_ACIN = 1 generate
    a_i <= ACIN;
  end generate i_acin;

  --select B source
  i_b: if C_USE_BCIN = 0 generate
    b_i <= ABCONCAT(ci_dsp48e1_b_width-1 downto 0);
  end generate i_b;
  i_bcin: if C_USE_BCIN = 1 generate
    b_i <= BCIN;
  end generate i_bcin;

  --select carry source
  i_carryin: if C_USE_CARRYCASCIN = 0 generate
    carryin_i <= CARRYIN;
  end generate i_carryin;
  i_carrycascin: if C_USE_CARRYCASCIN = 1 generate
    carryin_i <= CARRYCASCIN;
  end generate i_carrycascin;
  
  
  i_stage1_reg: if ci_pipe(ci_stage3) = 1 generate
    process(CLK)
    begin
      if rising_edge(CLK) then
        if SCLR = '1' then
          a0reg <= (others => '0');
          b0reg <= (others => '0');
          d0reg <= (others => '0');
          subtractreg <= '0';
          bypassreg <= '0';
          c_i <= (others => '0');
          opmode_i <= '0';
        elsif CE = '1' then
          a0reg <= a_i;
          b0reg <= b_i;
          d0reg <= ABCONCAT(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto fn_dsp48_a_width(C_XDEVICEFAMILY)+ci_dsp48e1_b_width);
          subtractreg <= SUBTRACT;
          bypassreg <= BYPASS;
          c_i <= c;
          opmode_i <= add;
        end if;
      end if;
    end process;

    -- Handle carry-in separately.  If it's coming from a cascade, there's no register in the hardware
    --Bugfixnote: yes, sp3adsp does actually register here for carrycascin, but
    --this register is moved to the output. Yes, this means the model and the
    --primitive disagree, but the context is for cascaded dsp48s. When cascaded,
    --the right number of registers is present.
    has_carryinreg : if C_USE_CARRYCASCIN = 0 or (C_USE_CARRYCASCIN = 1 and has_dsp48a(C_XDEVICEFAMILY)) generate
      process (CLK) is
      begin
        if rising_edge(CLK) then
          if SCLR = '1' then
            carryinreg <= '0';
          elsif CE = '1' then
            carryinreg <= carryin_i;
          end if;
        end if;
      end process;
    end generate has_carryinreg;
    no_carryinreg : if C_USE_CARRYCASCIN = 1 and not(C_USE_CARRYCASCIN = 1 and supports_dsp48a(C_XDEVICEFAMILY)>0) generate
      carryinreg <= carryin_i;
    end generate no_carryinreg;
    
  end generate i_stage1_reg;
  
  i_stage1_noreg: if ci_pipe(ci_stage3) = 0 generate
    a0reg <= a_i;
    b0reg <= b_i;
    d0reg <= ABCONCAT(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto fn_dsp48_a_width(C_XDEVICEFAMILY)+ci_dsp48e1_b_width);
    carryinreg <= carryin_i;
    subtractreg <= SUBTRACT;
    c_i <= c;
    opmode_i <= add;
    bypassreg <= BYPASS;
  end generate i_stage1_noreg;
  
  --A cascade is vx5 only...
  i_acout: if supports_dsp48e(C_XDEVICEFAMILY)>0 generate
    ACOUT <= a0reg;
  end generate i_acout;

  --...but b cascade is fun for all the families.
  bcout <= b0reg;

  --NOTE: there is no second stage register
  
  concat_sp3 : if supports_dsp48a(C_XDEVICEFAMILY)>0 generate
    dab_in <= d0reg & a0reg & b0reg;
  end generate concat_sp3;
  concat_vx : if has_dsp48(C_XDEVICEFAMILY) or supports_dsp48e(C_XDEVICEFAMILY)>0 generate
    dab_in(fn_dsp48_a_width(C_XDEVICEFAMILY)+ci_dsp48e1_b_width-1 downto 0) <= a0reg & b0reg;
  end generate concat_vx;
  dab_i <= std_logic_vector(resize(signed(dab_in),ci_dsp48e1_p_width));

  -- When the opmode register is reset (opmode_i /= add), the Xmux is set to all-zeros  
  x_i <= dab_i when opmode_i = add else (others => '0');

  -- When the opmode register is reset (opmode_i /= add), the Zmux is set to all-zeros  
  i_usec: if C_USE_PCIN = 0 generate
    z_i <= c_i when bypassreg = '0' and opmode_i = add else (others => '0');
  end generate i_usec;
  i_usepcin: if C_USE_PCIN = 1 generate
    z_i <= PCIN when bypassreg = '0' and opmode_i = add else (others => '0');
  end generate i_usepcin;

  no_carrycascin_mux: if C_USE_CARRYCASCIN = 0 or not(supports_dsp48e(C_XDEVICEFAMILY)>0) generate
    carryin_mux <= carryinreg;
  end generate no_carrycascin_mux;  
  use_carrycascin_mux: if C_USE_CARRYCASCIN = 1 and supports_dsp48e(C_XDEVICEFAMILY)>0 generate
    -- DRC checks stipulate that CARRYINSELREG should be ganged with OPMODEREG
    -- We make this assumption here.  When using CARRYCASCIN, carryinsel will be
    -- reset on an SCLR to '000', which means that the fabric carryin value
    -- will be passed to the adder.  So also assume that this will be tied to '0'
    -- since it should be unused if we are already using carrycascin.
    carryin_mux <= carryinreg when opmode_i = add else '0';    
  end generate use_carrycascin_mux;
  
  --perform the operation
  p_i <= ('0'&z_i) + (('0'&x_i) + carryin_mux) when subtractreg = '0' else
         ('0'&z_i) - (('0'&x_i) + carryin_mux);
  
  carryout_i <= p_i(p_i'left) xor subtractreg;

  --PREG
  i_stage3_reg: if ci_pipe(ci_stage4) = 1 generate
    process(clk)
    begin
      if rising_edge(CLK) then
        if SCLR = '1' then
          preg <= (others => '0');
          carryoutreg <= '0';
        elsif CE = '1' then
          preg  <= p_i;
          carryoutreg <= carryout_i;
        end if;
      end if;
    end process;
  end generate i_stage3_reg;
  i_stage3_noreg: if ci_pipe(ci_stage4) = 0 generate
    preg <= p_i;
    carryoutreg <= carryout_i;
  end generate i_stage3_noreg;

  
  P     <= preg(ci_dsp48e1_p_width-1 downto 0);
  PCOUT <= preg(ci_dsp48e1_p_width-1 downto 0);

  --Only Vx5 has fabric carryout
  i_vx5_carryout: if supports_dsp48e(C_XDEVICEFAMILY)>0 generate
    CARRYCASCOUT <= preg(preg'LEFT);
    CARRYOUT     <= carryoutreg;
  end generate i_vx5_carryout;
  i_sp3adsp_carryout: if supports_dsp48a(C_XDEVICEFAMILY)>0 generate
    --Bugfix note: the register of the carrycasc for sp3adsp is actually on the
    --input which differs from this description, but since it only applies when
    --dsps are cascaded, the fact that this model doesn't match the primitive
    --isn't a problem. However, the code is kept separate in case it becomes one.
--    CARRYCASCOUT   <= preg(preg'LEFT);
--    CARRYCASCOUT <= p_i(p_i'LEFT);
    CARRYCASCOUT <= carryout_i;
  end generate i_sp3adsp_carryout;
end synth;



-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_dsp48_addsub_v3_0_3/hdl/xbip_dsp48_addsub_synth.vhd,v 1.3 2009/09/08 16:46:31 akennedy Exp $
--
--  (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_dsp48_wrapper_v3_0_4;
use xbip_dsp48_wrapper_v3_0_4.xbip_dsp48_wrapper_v3_0_4_pkg.all;

library xbip_dsp48_addsub_v3_0_3;
use xbip_dsp48_addsub_v3_0_3.xbip_dsp48_addsub_v3_0_3_pkg.all;

--core_if on entity xbip_dsp48_addsub_synth
entity xbip_dsp48_addsub_synth is
  generic (
    C_VERBOSITY       : integer := 0;          -- 0 = Errors 1 = +Warnings, 2 = +Notes and tips
    C_MODEL_TYPE      : integer := 0;          -- 0 = synth, 1 = RTL
    C_XDEVICEFAMILY   : string  := "virtex4";
    C_LATENCY         : integer := -1;
    C_USE_CARRYCASCIN : integer := 0;
    C_USE_PCIN        : integer := 0;
    C_USE_ACIN        : integer := 0;
    C_USE_BCIN        : integer := 0
    );
  port (
    CLK          : in  std_logic                                                           := '1';
    CE           : in  std_logic                                                           := '1';
    SCLR         : in  std_logic                                                           := '0';
    SUBTRACT     : in  std_logic                                                           := '0';
    BYPASS       : in  std_logic                                                           := '0';
    CARRYIN      : in  std_logic                                                           := '0';
    CARRYCASCIN  : in  std_logic                                                           := '0';
    PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
    ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
    BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
    ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
    C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
    PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
    ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
    BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
    CARRYOUT     : out std_logic                                                           := '0';
    CARRYCASCOUT : out std_logic                                                           := '0';
    P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
    );
end xbip_dsp48_addsub_synth;
--core_if off



architecture synth of xbip_dsp48_addsub_synth is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant dsp48_addsub_latency : t_dsp48_addsub_latency := fn_dsp48_addsub_latency(
    P_LATENCY       => C_LATENCY,
    P_XDEVICEFAMILY => C_XDEVICEFAMILY
    );
  constant ci_pipe : t_dsp48_addsub_pipe := dsp48_addsub_latency.pipe;
  signal diag_pipe : t_dsp48_addsub_pipe := ci_pipe;
begin

  opt_vx7 : if supports_dsp48e1(C_XDEVICEFAMILY)>0 generate
    signal opmode : std_logic_vector(6 downto 0) := (others => '0');
    signal a_i : std_logic_vector(ci_dsp48e1_a_width-1 downto 0) := (others => '0');
    signal alumode : std_logic_vector(3 downto 0) := (others => '0');
    signal carryinsel : std_logic_vector(2 downto 0) := (others => '0');
  begin
    i_use_pcin: if C_USE_PCIN = 1 generate
      opmode <= "0010011" when BYPASS = '0' else "0000011";
    end generate i_use_pcin;
    i_use_c: if C_USE_PCIN = 0 generate
      opmode <= "0110011" when BYPASS = '0' else "0000011";
    end generate i_use_c;
    i_carryin: if C_USE_CARRYCASCIN = 0 generate
      carryinsel <= "000";
    end generate i_carryin;
    i_carrycascin: if C_USE_CARRYCASCIN = 1 generate
      carryinsel <= "010";
    end generate i_carrycascin;

    alumode <= "00" & SUBTRACT & SUBTRACT;

    i_uniwrap : xbip_dsp48e1_wrapper_v3_0
      generic map(
        AREG           => ci_pipe(ci_stage3),
        BREG           => ci_pipe(ci_stage3),
        MREG           => 0,
        CREG           => ci_pipe(ci_stage3),
        DREG           => 0,
        ADREG          => 0,
        PREG           => ci_pipe(ci_stage4),
        ACASCREG       => -1,
        BCASCREG       => -1,
        CARRYINREG     => ci_pipe(ci_stage3),
        CARRYINSELREG  => ci_pipe(ci_stage3),--0,
        OPMODEREG      => ci_pipe(ci_stage3),
        ALUMODEREG     => ci_pipe(ci_stage3),  --for subtraction
        A_INPUT        => C_USE_ACIN,
        B_INPUT        => C_USE_BCIN,
        USE_MULT       => "NONE",
        USE_DPORT      => false,
        HAS_GLOBAL_CE  => true,
        HAS_GLOBAL_SCLR=> true
        )
      port map(
        CLK          => CLK,
        CE           => CE,
        SCLR         => SCLR,
        CARRYIN      => CARRYIN,
        PCIN         => PCIN,
        ACIN         => ACIN,
        BCIN         => BCIN,
        A            => ABCONCAT(ABCONCAT'LEFT downto ci_dsp48e1_b_width),
        B            => ABCONCAT(ci_dsp48e1_b_width-1 downto 0),
        C            => C,
        OPMODE       => opmode,
        ALUMODE      => alumode,
        MULTSIGNIN   => 'X', -- driving 'X' rather than '0' in here avoids an annoying unisim DRC warning in simulation
        MULTSIGNOUT  => open,
        CARRYOUT     => CARRYOUT,
        CARRYCASCIN  => CARRYCASCIN,
        CARRYCASCOUT => CARRYCASCOUT,
        CARRYINSEL   => carryinsel,
        ACOUT        => ACOUT,
        BCOUT        => BCOUT,
        PCOUT        => PCOUT,
        P            => P
        );
  end generate opt_vx7;

end synth;



-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_dsp48_addsub_v3_0_3/hdl/xbip_dsp48_addsub_v3_0_3_viv.vhd,v 1.3 2009/09/08 16:46:31 akennedy Exp $
--
--  (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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

library xbip_dsp48_addsub_v3_0_3;
use xbip_dsp48_addsub_v3_0_3.xbip_dsp48_addsub_v3_0_3_pkg.all;   

-------------------------------------------------------------------------------
-- Note: this entity declaration is used as the template of the core's interface
-- by the core_if_bip.pl script. Hence, if you have to alter the interface, alter
-- it here and then run core_if_bip.pl (ensure all files to be altered are writeable)
-------------------------------------------------------------------------------
entity xbip_dsp48_addsub_v3_0_3_viv is
  generic (
    --BaseIP modelling generics
    C_VERBOSITY     : integer := 0;  --0 = Errors 1 = +Warnings, 2 = +Notes and tips
    C_MODEL_TYPE    : integer := 0;     --0 = synth, 1 = RTL
    --BaseIP common generics
    C_XDEVICEFAMILY : string  := "virtex4";
    C_LATENCY       : integer := -1;
    --DSP special inputs
    C_USE_CARRYCASCIN : integer := 0;
    C_USE_PCIN      : integer := 0;
    C_USE_ACIN      : integer := 0;
    C_USE_BCIN      : integer := 0
    );
  port (
    CLK          : in  std_logic                                                           := '1';
    CE           : in  std_logic                                                           := '1';
    SCLR         : in  std_logic                                                           := '0';
    SUBTRACT     : in  std_logic                                                           := '0';
    BYPASS       : in  std_logic                                                           := '0';
    CARRYIN      : in  std_logic                                                           := '0';
    CARRYCASCIN  : in  std_logic                                                           := '0';
    PCIN         : in  std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
    ACIN         : in  std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
    BCIN         : in  std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
    ABCONCAT     : in  std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
    C            : in  std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
    PCOUT        : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
    ACOUT        : out std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0)      := (others => '0');
    BCOUT        : out std_logic_vector(ci_dsp48e1_b_width-1 downto 0)                       := (others => '0');
    CARRYOUT     : out std_logic                                                           := '0';
    CARRYCASCOUT : out std_logic                                                           := '0';
    P            : out std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0')
    );
end xbip_dsp48_addsub_v3_0_3_viv;



architecture synth of xbip_dsp48_addsub_v3_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant check_generics : integer := fn_dsp48_addsub_check_generics(
    P_VERBOSITY       => C_VERBOSITY,
    P_MODEL_TYPE      => C_MODEL_TYPE,
    --BaseIP common generics
    P_XDEVICEFAMILY   => C_XDEVICEFAMILY,
    P_LATENCY         => C_LATENCY,
    --DSP special inputs
    P_USE_CARRYCASCIN => C_USE_CARRYCASCIN,
    P_USE_PCIN        => C_USE_PCIN,
    P_USE_ACIN        => C_USE_ACIN,
    P_USE_BCIN        => C_USE_BCIN
    );
  

begin
  -------------------------------------------------------------------------------
  -- The models
  -- Synth model is a mix of inference, attributes and instantiation:- whatever
  -- it takes to get the desired implementation.
  -- The RTL model is 'piped RTL'.
  -------------------------------------------------------------------------------  
  i_synth_option : if C_MODEL_TYPE = 0 generate
    --core_if on instance i_synth_model xbip_dsp48_addsub_synth
    i_synth_model : xbip_dsp48_addsub_synth
      generic map (
        C_VERBOSITY       => C_VERBOSITY,
        C_MODEL_TYPE      => C_MODEL_TYPE,
        C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
        C_LATENCY         => C_LATENCY,
        C_USE_CARRYCASCIN => C_USE_CARRYCASCIN,
        C_USE_PCIN        => C_USE_PCIN,
        C_USE_ACIN        => C_USE_ACIN,
        C_USE_BCIN        => C_USE_BCIN
        )
      port map (
        CLK          => CLK,
        CE           => CE,
        SCLR         => SCLR,
        SUBTRACT     => SUBTRACT,
        BYPASS       => BYPASS,
        CARRYIN      => CARRYIN,
        CARRYCASCIN  => CARRYCASCIN,
        PCIN         => PCIN,
        ACIN         => ACIN,
        BCIN         => BCIN,
        ABCONCAT     => ABCONCAT,
        C            => C,
        PCOUT        => PCOUT,
        ACOUT        => ACOUT,
        BCOUT        => BCOUT,
        CARRYOUT     => CARRYOUT,
        CARRYCASCOUT => CARRYCASCOUT,
        P            => P
        );

  --core_if off
  end generate i_synth_option;
  
  i_rtl_option : if C_MODEL_TYPE = 1 generate
    --core_if on instance i_rtl_model xbip_dsp48_addsub_rtl
    i_rtl_model : xbip_dsp48_addsub_rtl
      generic map (
        C_VERBOSITY       => C_VERBOSITY,
        C_MODEL_TYPE      => C_MODEL_TYPE,
        C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
        C_LATENCY         => C_LATENCY,
        C_USE_CARRYCASCIN => C_USE_CARRYCASCIN,
        C_USE_PCIN        => C_USE_PCIN,
        C_USE_ACIN        => C_USE_ACIN,
        C_USE_BCIN        => C_USE_BCIN
        )
      port map (
        CLK          => CLK,
        CE           => CE,
        SCLR         => SCLR,
        SUBTRACT     => SUBTRACT,
        BYPASS       => BYPASS,
        CARRYIN      => CARRYIN,
        CARRYCASCIN  => CARRYCASCIN,
        PCIN         => PCIN,
        ACIN         => ACIN,
        BCIN         => BCIN,
        ABCONCAT     => ABCONCAT,
        C            => C,
        PCOUT        => PCOUT,
        ACOUT        => ACOUT,
        BCOUT        => BCOUT,
        CARRYOUT     => CARRYOUT,
        CARRYCASCOUT => CARRYCASCOUT,
        P            => P
        );

    --core_if off
  end generate i_rtl_option;

end synth;



-- (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
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

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_dsp48_addsub_v3_0_3;
use xbip_dsp48_addsub_v3_0_3.xbip_dsp48_addsub_v3_0_3_viv_comp.all;

entity xbip_dsp48_addsub_v3_0_3 is
  generic (
    --BaseIP modelling generics
    C_VERBOSITY       :     integer                       := 0;  --0 = Errors 1 = +Warnings, 2 = +Notes and tips
    C_MODEL_TYPE      :     integer                       := 0;  --0 = synth, 1 = RTL
    --BaseIP common generics
    C_XDEVICEFAMILY   :     string                        := "virtex7";
    C_LATENCY         :     integer                       := -1;
    --DSP special inputs
    C_USE_CARRYCASCIN :     integer                       := 0;
    C_USE_PCIN        :     integer                       := 0;
    C_USE_ACIN        :     integer                       := 0;
    C_USE_BCIN        :     integer                       := 0
    );
  port (
    CLK               : in  std_logic                     := '1';
    CE                : in  std_logic                     := '1';
    SCLR              : in  std_logic                     := '0';
    SUBTRACT          : in  std_logic                     := '0';
    BYPASS            : in  std_logic                     := '0';
    CARRYIN           : in  std_logic                     := '0';
    CARRYCASCIN       : in  std_logic                     := '0';
    PCIN              : in  std_logic_vector(47 downto 0) := (others => '0');
    ACIN              : in  std_logic_vector(29 downto 0) := (others => '0');
    BCIN              : in  std_logic_vector(17 downto 0) := (others => '0');
    ABCONCAT          : in  std_logic_vector(47 downto 0) := (others => '0');
    C                 : in  std_logic_vector(47 downto 0) := (others => '0');
    PCOUT             : out std_logic_vector(47 downto 0) := (others => '0');
    ACOUT             : out std_logic_vector(29 downto 0) := (others => '0');
    BCOUT             : out std_logic_vector(17 downto 0) := (others => '0');
    CARRYOUT          : out std_logic                     := '0';
    CARRYCASCOUT      : out std_logic                     := '0';
    P                 : out std_logic_vector(47 downto 0) := (others => '0')
    );
end entity xbip_dsp48_addsub_v3_0_3;

architecture xilinx of xbip_dsp48_addsub_v3_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  i_addsub : xbip_dsp48_addsub_v3_0_3_viv
    generic map (
      C_VERBOSITY       => C_VERBOSITY,
      C_MODEL_TYPE      => C_MODEL_TYPE,
      C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
      C_LATENCY         => C_LATENCY,
      C_USE_CARRYCASCIN => C_USE_CARRYCASCIN,
      C_USE_PCIN        => C_USE_PCIN,
      C_USE_ACIN        => C_USE_ACIN,
      C_USE_BCIN        => C_USE_BCIN
      )
    port map (
      CLK               => CLK,
      CE                => CE,
      SCLR              => SCLR,
      SUBTRACT          => SUBTRACT,
      BYPASS            => BYPASS,
      CARRYIN           => CARRYIN,
      CARRYCASCIN       => CARRYCASCIN,
      PCIN              => PCIN,
      ACIN              => ACIN,
      BCIN              => BCIN,
      ABCONCAT          => ABCONCAT,
      C                 => C,
      PCOUT             => PCOUT,
      ACOUT             => ACOUT,
      BCOUT             => BCOUT,
      CARRYOUT          => CARRYOUT,
      CARRYCASCOUT      => CARRYCASCOUT,
      P                 => P
  );

end architecture xilinx;




