-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_pipe_v3_0_3/simulation/xbip_pipe_v3_0_3_viv_comp.vhd,v 1.3 2009/09/08 16:46:37 akennedy Exp $
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
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package xbip_pipe_v3_0_3_viv_comp is

  component xbip_pipe_v3_0_3_viv is
    generic (
      C_LATENCY             : integer := 0;
      C_HAS_CE              : integer := 0;
      C_CE_OVERRIDES_SYNC   : integer := 0;
      C_SSET_OVERRIDES_SCLR : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0;
      C_SINIT_VAL           : string  := "0";
      C_AINIT_VAL           : string  := "0";
      C_WIDTH               : integer := 1;
      C_FAST_IP             : integer := 1
      );
    port (
      CLK   : in  std_logic                            := '0';
      CE    : in  std_logic                            := '0';
      SCLR  : in  std_logic                            := '0';
      SSET  : in  std_logic                            := '0';
      SINIT : in  std_logic                            := '0';
      D     : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
      Q     : out std_logic_vector(C_WIDTH-1 downto 0) := (others => '0')
      );
  end component xbip_pipe_v3_0_3_viv;

end package xbip_pipe_v3_0_3_viv_comp;


-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_pipe_v2_0/simulation/xbip_pipe_v2_0_comp.vhd,v 1.3 2009/09/08 16:46:37 akennedy Exp $
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

library ieee;
use ieee.std_logic_1164.all;

package xbip_pipe_v3_0_3_comp is

  component xbip_pipe_v3_0_3 is
    generic (
      C_LATENCY             : integer := 0;
      C_HAS_CE              : integer := 0;
      C_CE_OVERRIDES_SYNC   : integer := 0;
      C_SSET_OVERRIDES_SCLR : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0;
      C_SINIT_VAL           : string  := "0";
      C_AINIT_VAL           : string  := "0";
      C_WIDTH               : integer := 1;
      C_FAST_IP             : integer := 1
      );
    port (
      CLK   : in  std_logic                            := '0';
      CE    : in  std_logic                            := '0';
      SCLR  : in  std_logic                            := '0';
      SSET  : in  std_logic                            := '0';
      SINIT : in  std_logic                            := '0';
      D     : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
      Q     : out std_logic_vector(C_WIDTH-1 downto 0) := (others => '0')
      );
  end component xbip_pipe_v3_0_3;
  
end package xbip_pipe_v3_0_3_comp;






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

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

entity xbip_pipe_v3_0_3_viv is
  GENERIC (
    C_LATENCY             : integer:= 0;
    C_HAS_CE              : integer:= 0;
    C_CE_OVERRIDES_SYNC   : integer:= 0;
    C_SSET_OVERRIDES_SCLR : integer:= 0;
    C_HAS_SCLR            : integer:= 0;
    C_HAS_SSET            : integer:= 0;
    C_HAS_SINIT           : integer:= 0;
    C_SINIT_VAL           : string := "0";
    C_AINIT_VAL           : string := "0";
    C_WIDTH               : integer:= 1;
    C_FAST_IP             : integer:= 1
    );
  PORT (
    CLK   : in  std_logic := '0';
    CE    : in  std_logic := '0';
    SCLR  : in  std_logic := '0';
    SSET  : in  std_logic := '0';
    SINIT : in  std_logic := '0';
    D     : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
    Q     : out std_logic_vector(C_WIDTH-1 downto 0) := (others => '0')
    );
end xbip_pipe_v3_0_3_viv;

architecture synth of xbip_pipe_v3_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  CONSTANT ainit_val : STD_LOGIC_VECTOR(c_width DOWNTO 1) := str_to_bound_slv_0(c_ainit_val, c_width);
  CONSTANT sinit_val : STD_LOGIC_VECTOR(c_width DOWNTO 1) := str_to_bound_slv_0(c_sinit_val, c_width);
  function fn_get_por (
    p_ainit_val : STD_LOGIC_VECTOR(c_width DOWNTO 1);
    p_has_sclr  : integer;
    p_has_sset  : integer;
    p_has_sinit : integer;
    p_sinit_val : STD_LOGIC_VECTOR(c_width DOWNTO 1)
    )
    return std_logic_vector is
      variable ret_val : std_logic_vector(C_WIDTH-1 downto 0);
      variable v_zeroes : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
      variable v_ones : std_logic_vector(C_WIDTH-1 downto 0) := (others => '1');
  begin  -- fn_get_por
    ret_val := p_ainit_val;
    if p_has_sclr = 1 then
      ret_val := v_zeroes;
    elsif p_has_sset = 1 then
      ret_val := v_ones;
    elsif p_has_sinit = 1 then
      ret_val := p_sinit_val;
    end if;
    return ret_val;
  end fn_get_por;
  constant c_por : std_logic_vector(C_WIDTH-1 downto 0) := fn_get_por(ainit_val, C_HAS_SCLR,C_HAS_SSET, C_HAS_SINIT, sinit_val);

begin
  --there are only three numbers in the universe: 0, 1 and many.
  --0 gets a simple wirethrough
  --1 gets a single register
  --2 gets a for-next loop of registers.

  opt_no_reg: if C_LATENCY = 0 generate
    Q <= D;
  end generate opt_no_reg;

  opt_has_pipe: if C_LATENCY > 0  generate
    signal ce_i    : std_logic := '0';
    signal sclr_i  : std_logic := '0';
    signal sset_i  : std_logic := '0';
    signal sinit_i : std_logic := '0';

    type t_pipe is array (0 to C_LATENCY)  of std_logic_vector(C_WIDTH-1 downto 0);
    function fn_pipe_clean (
      p_por : std_logic_vector(C_WIDTH-1 downto 0)
      )
      return t_pipe is
      variable ret_val : t_pipe;
    begin  -- fn_pipe_clean
      for i in 0 to C_LATENCY loop
        ret_val(i) := p_por;
      end loop;
      return ret_val;
    end fn_pipe_clean;
    constant c_pipe_init : t_pipe := fn_pipe_clean(c_por);
    signal pipe  : t_pipe := c_pipe_init;

    signal first_q : std_logic_vector(C_WIDTH-1 downto 0) := c_por;  -- the first reg stage also gets the PowerOnReset

    -- purpose: set attribute for fast ip (keep register)
    function fn_fast_ip_attr (
      p_fast_ip : integer)
      return string is
    begin  -- fn_fast_ip_attr
      if p_fast_ip = 1 then
        return "true";
      end if;
      return "false";
    end fn_fast_ip_attr;
    attribute keep : string;
    attribute keep of first_q : signal is fn_fast_ip_attr(C_FAST_IP);
  begin

    i_ce: if C_HAS_CE = 1 generate
      ce_i <= ce;
    end generate i_ce;
    i_no_ce: if C_HAS_CE = 0 generate
      ce_i <= '1';
    end generate i_no_ce;
    i_sync_over_ce: if C_CE_OVERRIDES_SYNC = 0 generate
      i_sclr_overrides_sset: if C_SSET_OVERRIDES_SCLR = 0 generate
        sclr_i <= sclr;
      end generate i_sclr_overrides_sset;
      i_sset_overrides_sclr: if C_SSET_OVERRIDES_SCLR = 1 generate
        sclr_i <= sclr when sset = '0' else '0';
      end generate i_sset_overrides_sclr;
      sset_i <= sset;                   -- sset always has lower priority than sclr on the FD primitive
      sinit_i <= sinit;
    end generate i_sync_over_ce;
    i_ce_over_sync: if C_CE_OVERRIDES_SYNC = 1 generate
      i_sclr_overrides_sset: if C_SSET_OVERRIDES_SCLR = 0 generate
        sclr_i <= sclr when ce_i = '1' else '0';
      end generate i_sclr_overrides_sset;
      i_sset_overrides_sclr: if C_SSET_OVERRIDES_SCLR = 1 generate
        sclr_i <= sclr when ce_i = '1' and sset = '0' else '0';
      end generate i_sset_overrides_sclr;
      sset_i <= sset when ce_i = '1' else '0';  -- sset always has lower priority than sclr on the FD primitive
      sinit_i <= sinit when ce_i = '1' else '0';
    end generate i_ce_over_sync;


    -------------------------------------------------------------------------------
    -- IMPORTANT - C_SYNC_ENABLE NOT HANDLED. IT IS REQUIRED THAT A HIGHER LEVEL PASS
                  --APPROPRIATELY MODIFIED CE AND SCLR
    -------------------------------------------------------------------------------
    i_first_reg: process(clk)
    begin
      -- PROCESS reg
      IF rising_edge(clk) THEN
        IF C_HAS_SCLR = 1 and sclr_i = '1' THEN
          first_q <= (OTHERS => '0');
        ELSIF C_HAS_SSET = 1 and sset_i = '1' THEN
          first_q <= (OTHERS => '1');
        ELSIF C_HAS_SINIT = 1 and sinit_i = '1' THEN
          first_q <= sinit_val;
        ELSIF ce_i = '1' THEN
          first_q <= d;
        END IF;
      END IF;
    END PROCESS i_first_reg;

    pipe(1) <= first_q;

    i_pipe : for stage in 2 to C_LATENCY generate
      reg : process(clk)
      BEGIN  -- PROCESS reg
        IF rising_edge(clk) THEN
          IF C_HAS_SCLR = 1 and sclr_i = '1' THEN
            pipe(stage) <= (OTHERS => '0');
          ELSIF C_HAS_SSET = 1 and sset_i = '1' THEN
            pipe(stage) <= (OTHERS => '1');
          ELSIF C_HAS_SINIT = 1 and sinit_i = '1' THEN
            pipe(stage) <= sinit_val;
          ELSIF ce_i = '1' THEN
            pipe(stage) <= pipe(stage-1);
          END IF;
        END IF;
      END PROCESS reg;
    end generate i_pipe;

    q <= pipe(C_LATENCY);

  end generate opt_has_pipe;

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

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.all;

entity xbip_pipe_v3_0_3 is
  generic (
    C_LATENCY             : integer:= 0;
    C_HAS_CE              : integer:= 0;
    C_CE_OVERRIDES_SYNC   : integer:= 0;
    C_SSET_OVERRIDES_SCLR : integer:= 0;
    C_HAS_SCLR            : integer:= 0;
    C_HAS_SSET            : integer:= 0;
    C_HAS_SINIT           : integer:= 0;
    C_SINIT_VAL           : string := "0";
    C_AINIT_VAL           : string := "0";
    C_WIDTH               : integer:= 1;
    C_FAST_IP             : integer:= 1
    );
  port (
    CLK   : in  std_logic := '0';
    CE    : in  std_logic := '0';
    SCLR  : in  std_logic := '0';
    SSET  : in  std_logic := '0';
    SINIT : in  std_logic := '0';
    D     : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
    Q     : out std_logic_vector(C_WIDTH-1 downto 0) := (others => '0')
    );
end entity xbip_pipe_v3_0_3;

architecture xilinx of xbip_pipe_v3_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  i_pipe : entity xbip_pipe_v3_0_3_viv
  generic map (
    C_LATENCY => C_LATENCY,
    C_HAS_CE => C_HAS_CE,
    C_CE_OVERRIDES_SYNC => C_CE_OVERRIDES_SYNC,
    C_SSET_OVERRIDES_SCLR => C_SSET_OVERRIDES_SCLR,
    C_HAS_SCLR => C_HAS_SCLR,
    C_HAS_SSET => C_HAS_SSET,
    C_HAS_SINIT => C_HAS_SINIT,
    C_SINIT_VAL => C_SINIT_VAL,
    C_AINIT_VAL => C_AINIT_VAL,
    C_WIDTH => C_WIDTH,
    C_FAST_IP => C_FAST_IP
  )
  port map (
    CLK => CLK,
    CE => CE,
    SCLR => SCLR,
    SSET => SSET,
    SINIT => SINIT,
    D => D,
    Q => Q
  );
  
end architecture xilinx;




