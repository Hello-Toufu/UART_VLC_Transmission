-- $Id: xbip_addsub_v3_0_3_comp.vhd,v 1.3 2009/09/08 16:38:07 akennedy Exp $
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

-------------------------------------------------------------------------------
-- Component statement for behavioral model
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

PACKAGE xbip_addsub_v3_0_3_comp IS

  --core_if on component xbip_addsub_v3_0_3
  component xbip_addsub_v3_0_3
    GENERIC (
      C_XDEVICEFAMILY     : string  := "no_family";
      C_LATENCY           : integer := -1;
      C_A_WIDTH           : integer := 16;
      C_B_WIDTH           : integer := 16;
      C_OUT_WIDTH         : integer := 16;
      C_BYPASS_LOW        : integer := 0;
      C_CE_OVERRIDES_SCLR : integer := 0;
      C_VERBOSITY         : integer := 0;            -- 0 = Errors  1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE        : integer := 0;            -- 0 = synth,  1 = RTL
      C_DATA_TYPE         : integer := 0             -- 0 = signed, 1 = unsigned.
      );
    PORT (
      CLK    : in  std_logic                                := '1';
      CE     : in  std_logic                                := '1';
      SCLR   : in  std_logic                                := '0';
      ADDF   : in  std_logic                                := '0';
      BYPASS : in  std_logic                                := '0';
      C_IN   : in  std_logic                                := '0';
      A      : in  std_logic_vector(C_A_WIDTH-1 downto 0)   := (others => '0');
      B      : in  std_logic_vector(C_B_WIDTH-1 downto 0)   := (others => '0');
      Q      : out std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0')
      );
  --core_if off
  END COMPONENT;


END xbip_addsub_v3_0_3_comp;


-- $Id: 
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

-------------------------------------------------------------------------------
-- Component statement for wrapper of behavioural model
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package xbip_addsub_v3_0_3_viv_comp is

----------------------------------------------------------
-- Insert component declaration of top level xst file here
----------------------------------------------------------
  --core_if on component xbip_addsub_v3_0_3_viv
  component xbip_addsub_v3_0_3_viv
    GENERIC (
      C_XDEVICEFAMILY     : string  := "no_family";
      C_LATENCY           : integer := -1;
      C_A_WIDTH           : integer := 16;
      C_B_WIDTH           : integer := 16;
      C_OUT_WIDTH         : integer := 16;
      C_BYPASS_LOW        : integer := 0;	
      C_CE_OVERRIDES_SCLR : integer := 0;
      C_VERBOSITY         : integer := 0;            -- 0 = Errors  1 = +Warnings, 2 = +Notes and tips
      C_MODEL_TYPE        : integer := 0;            -- 0 = synth,  1 = RTL
      C_DATA_TYPE         : integer := 0             -- 0 = signed, 1 = unsigned.
      );
    PORT (
      CLK    : in  std_logic                                := '1';
      CE     : in  std_logic                                := '1';
      SCLR   : in  std_logic                                := '0';
      ADDF   : in  std_logic                                := '0';
      BYPASS : in  std_logic                                := '0';
      C_IN   : in  std_logic                                := '0';
      A      : in  std_logic_vector(C_A_WIDTH-1 downto 0)   := (others => '0');
      B      : in  std_logic_vector(C_B_WIDTH-1 downto 0)   := (others => '0');
      Q      : out std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0')
      );
  --core_if off
  END COMPONENT;


end xbip_addsub_v3_0_3_viv_comp;



-- $Id: xbip_addsub_v3_0_3_viv.vhd,v 1.3 2009/09/08 16:38:07 akennedy Exp $
----------------------------------------------------------------
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

library xbip_dsp48_addsub_v3_0_3;
use xbip_dsp48_addsub_v3_0_3.xbip_dsp48_addsub_v3_0_3_viv_comp.all;

--core_if on entity xbip_addsub_v3_0_3_viv
entity xbip_addsub_v3_0_3_viv is
  generic (
    C_XDEVICEFAMILY     :     string                                   := "no_family";
    C_LATENCY           :     integer                                  := -1;
    C_A_WIDTH           :     integer                                  := 16;
    C_B_WIDTH           :     integer                                  := 16;
    C_OUT_WIDTH         :     integer                                  := 16;
    C_BYPASS_LOW        :     integer                                  := 0;
    C_CE_OVERRIDES_SCLR :     integer                                  := 0;
    C_VERBOSITY         :     integer                                  := 0;  -- 0 = Errors  1 = +Warnings, 2 = +Notes and tips
    C_MODEL_TYPE        :     integer                                  := 0;  -- 0 = synth,  1 = RTL
    C_DATA_TYPE         :     integer                                  := 0   -- 0 = signed, 1 = unsigned.
    );
  port (
    CLK                 : in  std_logic                                := '1';
    CE                  : in  std_logic                                := '1';
    SCLR                : in  std_logic                                := '0';
    ADDF                : in  std_logic                                := '0';
    BYPASS              : in  std_logic                                := '0';
    C_IN                : in  std_logic                                := '0';
    A                   : in  std_logic_vector(C_A_WIDTH-1 downto 0)   := (others => '0');
    B                   : in  std_logic_vector(C_B_WIDTH-1 downto 0)   := (others => '0');
    Q                   : out std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0')
    );
--core_if off
end xbip_addsub_v3_0_3_viv;

architecture synth of xbip_addsub_v3_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  function check_generics(P_XDEVICEFAMILY : string;
                          P_LATENCY,
                          P_A_WIDTH,
                          P_B_WIDTH,
                          P_OUT_WIDTH,
                          P_BYPASS_LOW,
                          P_CE_OVERRIDES_SCLR,
                          P_VERBOSITY,
                          P_MODEL_TYPE,
                          P_DATA_TYPE     : integer) return boolean is
  begin  -- function check_generics
    if P_B_WIDTH > fn_dsp48_concat_width(P_XDEVICEFAMILY) then
      report "ERROR                       : xbip_addsub_v3_0_3 : C_B_WIDTH must be <= " & integer'image(fn_dsp48_concat_width(P_XDEVICEFAMILY)) severity error;
    end if;
    --bi goes to the ABCONCAT port in DSP48 and and ai goes to the C port (C port is 48 bits in all DSP48s)

-- if P_B_WIDTH > fn_dsp48_concat_width(P_XDEVICEFAMILY) then
-- report "ERROR: xbip_addsub_v3_0_3: C_B_WIDTH must be <= " & integer'image(fn_dsp48_concat_width(P_XDEVICEFAMILY)) severity error;
-- end if;

-- if P_A_WIDTH > 48 then
-- report "ERROR: xbip_addsub_v3_0_3: C_A_WIDTH must be <= "48 severity error;
-- end if;

    -- need more checks! - at least C_OUT_WIDTH, C_CE_OVERRIDES_SCLR,
    -- C_DATA_TYPE, C_LATENCY
    return true;
  end function check_generics;

-- constant verify_generics : boolean := check_generics(C_XDEVICEFAMILY, C_LATENCY, C_A_WIDTH, C_B_WIDTH, C_OUT_WIDTH, C_CE_OVERRIDES_SCLR, C_VERBOSITY, C_MODEL_TYPE, C_DATA_TYPE);

-- constant use_usecase : boolean := (C_A_WIDTH <= fn_dsp48_concat_width(C_XDEVICEFAMILY) and C_B_WIDTH <= fn_dsp48_concat_width(C_XDEVICEFAMILY));
  constant use_usecase : boolean := (C_B_WIDTH <= fn_dsp48_concat_width(C_XDEVICEFAMILY));
-- signal i_sclr : std_logic;

  signal bypass_f   : std_logic := '1';
  signal i_sclr     : std_logic := '0';
  signal subtract_i : std_logic := '0';
  signal i_c_in     : std_logic := '0';


begin

  bypass_active_high : if C_BYPASS_LOW = 0 generate
    bypass_f <= not(bypass);
  end generate bypass_active_high;
  bypass_active_low  : if C_BYPASS_LOW = 1 generate
    bypass_f <= bypass;
  end generate bypass_active_low;
  -- needed so that when you load during a subtraction you don't load in the negative of the b input.
  -- turn the DSP48 to an add during the load.
  subtract_i <= ADDF and bypass_f;      --only time a subtract happens is when ADDF = 1 and bypass_f = 1 (No bypass);  otherwise add
-- gate out carry in during bypass

  i_c_in <= C_IN and bypass_f;          --only time C_IN is when C_IN is 1 and No Bypass; otherwise no C_IN

  i_ce_overrides_sclr : if C_CE_OVERRIDES_SCLR = 1 generate
    i_sclr <= SCLR when CE = '1' else '0';
  end generate i_ce_overrides_sclr;
  i_SCLR_overrides_CE : if C_CE_OVERRIDES_SCLR = 0 generate
    i_sclr <= SCLR;
  end generate i_SCLR_overrides_CE;

--begin

  addsub_usecase : if use_usecase generate
    signal ai    : std_logic_vector(ci_dsp48e1_c_width-1 downto 0)                       := (others => '0');
    signal bi    : std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
    signal qi    : std_logic_vector(ci_dsp48e1_p_width-1 downto 0)                       := (others => '0');
  begin

    data_signed   : if C_DATA_TYPE = 0 generate
      ai <= std_logic_vector(resize(signed(A), ai'length));
      bi <= std_logic_vector(resize(signed(B), bi'length));
      Q  <= qi(c_out_width - 1 downto 0);
    end generate data_signed;
    data_unsigned : if C_DATA_TYPE = 1 generate
      ai <= std_logic_vector(resize(unsigned(A), ai'length));
      bi <= std_logic_vector(resize(unsigned(B), bi'length));
      Q  <= qi(c_out_width - 1 downto 0);
    end generate data_unsigned;

    i_addsub : xbip_dsp48_addsub_v3_0_3_viv
      generic map(
        C_VERBOSITY       => C_VERBOSITY,
        C_MODEL_TYPE      => C_MODEL_TYPE,
        C_XDEVICEFAMILY   => C_XDEVICEFAMILY,
        C_LATENCY         => C_LATENCY,
        C_USE_CARRYCASCIN => 0,
        C_USE_PCIN        => 0,
        C_USE_ACIN        => 0,
        C_USE_BCIN        => 0)
      port map(
        CLK               => CLK,
        CE                => CE,
        SCLR              => i_SCLR,
        SUBTRACT          => subtract_i,
        BYPASS            => BYPASS,
        CARRYIN           => i_c_in,
        CARRYCASCIN       => '0',
-- PCIN => PCIN,
-- ACIN => ACIN,
-- BCIN => BCIN,
        ABCONCAT          => bi,
        C                 => ai,
        PCOUT             => open,
        ACOUT             => open,
        BCOUT             => open,
        CARRYOUT          => open,
        CARRYCASCOUT      => open,
        P                 => qi);

  end generate addsub_usecase;
--RELOOK WHEN A AND B INPUTS SQUARED AROUND
  -- shouldn't need this, as check_generics would stop this from happening right now
--  use_abs_layer : if not(fits_in_one_dsp) generate
--    assert false
--  no_model : if not(use_usecase) generate
--    assert false report "ERROR: xbip_addsub_v3_0_3: no model in place" severity failure;
-- end generate no_model;

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

library xbip_addsub_v3_0_3;
use xbip_addsub_v3_0_3.xbip_addsub_v3_0_3_viv_comp.all;

entity xbip_addsub_v3_0_3 is
  generic (
    C_XDEVICEFAMILY     :     string                                   := "no_family";
    C_LATENCY           :     integer                                  := -1;
    C_A_WIDTH           :     integer                                  := 16;
    C_B_WIDTH           :     integer                                  := 16;
    C_OUT_WIDTH         :     integer                                  := 16;
    C_BYPASS_LOW        :     integer                                  := 0;
    C_CE_OVERRIDES_SCLR :     integer                                  := 0;
    C_VERBOSITY         :     integer                                  := 0;  -- 0 = Errors  1 = +Warnings, 2 = +Notes and tips
    C_MODEL_TYPE        :     integer                                  := 0;  -- 0 = synth,  1 = RTL
    C_DATA_TYPE         :     integer                                  := 0   -- 0 = signed, 1 = unsigned.
    );
  port (
    CLK                 : in  std_logic                                := '1';
    CE                  : in  std_logic                                := '1';
    SCLR                : in  std_logic                                := '0';
    ADDF                : in  std_logic                                := '0';
    BYPASS              : in  std_logic                                := '0';
    C_IN                : in  std_logic                                := '0';
    A                   : in  std_logic_vector(C_A_WIDTH-1 downto 0)   := (others => '0');
    B                   : in  std_logic_vector(C_B_WIDTH-1 downto 0)   := (others => '0');
    Q                   : out std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0')
    );
--core_if off
end entity xbip_addsub_v3_0_3;

architecture xilinx of xbip_addsub_v3_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  i_synth : xbip_addsub_v3_0_3_viv
  generic map (
    C_XDEVICEFAMILY => C_XDEVICEFAMILY,
    C_LATENCY => C_LATENCY,
    C_A_WIDTH => C_A_WIDTH,
    C_B_WIDTH => C_B_WIDTH,
    C_OUT_WIDTH => C_OUT_WIDTH,
    C_BYPASS_LOW => C_BYPASS_LOW,
    C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
    C_VERBOSITY => C_VERBOSITY,
    C_MODEL_TYPE => C_MODEL_TYPE,
    C_DATA_TYPE => C_DATA_TYPE
  )
  port map (
    CLK => CLK,
    CE => CE,
    SCLR => SCLR,
    ADDF => ADDF,
    BYPASS => BYPASS,
    C_IN => C_IN,
    A => A,
    B => B,
    Q => Q
  );
  
end architecture xilinx;




