-- $Header: /devl/xcs/repo/env/Databases/ip/src2/L/xbip_counter_v3_0_3/simulation/xbip_counter_v3_0_3_viv_comp.vhd,v 1.3 2009/09/08 16:46:30 akennedy Exp $
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

package xbip_counter_v3_0_3_viv_comp is

----------------------------------------------------------
-- Insert component declaration of top level xst file here
----------------------------------------------------------
  --core_if on component xbip_counter_v3_0_3_viv
  component xbip_counter_v3_0_3_viv
    GENERIC (
      C_XDEVICEFAMILY     : string  := "virtex2";
      C_VERBOSITY         : integer := 0;
      C_USE_DSP48         : integer := 0;
      C_HAS_CE            : integer := 0;
      C_HAS_SCLR          : integer := 0;
      C_LATENCY           : integer := 1;
      C_FB_LATENCY        : integer := 1;
      C_WIDTH             : integer := 16;
      C_RESTRICT_COUNT    : integer := 0;
      C_COUNT_TO          : string  := "0";
      C_COUNT_BY          : string  := "0";
      C_COUNT_MODE        : integer := 0;          -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE     : string  := "0";
      C_CE_OVERRIDES_SCLR : integer := 0;          -- 0=override;
      C_HAS_THRESH0       : integer := 0;
      C_HAS_LOAD          : integer := 0;
      C_LOAD_LOW          : integer := 0
      );
    PORT (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
  --core_if off
  END COMPONENT;


end xbip_counter_v3_0_3_viv_comp;



-- $Header
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

--LIBRARY xbip_utils_v3_0_7;
--USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

PACKAGE xbip_counter_v3_0_3_comp IS

  --core_if on component xbip_counter_v3_0_3
  component xbip_counter_v3_0_3
    GENERIC (
      C_XDEVICEFAMILY     : string  := "virtex2";
      C_VERBOSITY         : integer := 0;
      C_USE_DSP48         : integer := 0;
      C_HAS_CE            : integer := 0;
      C_HAS_SCLR          : integer := 0;
      C_LATENCY           : integer := 1;
      C_FB_LATENCY        : integer := 1;
      C_WIDTH             : integer := 16;
      C_RESTRICT_COUNT    : integer := 0;
      C_COUNT_TO          : string  := "0";
      C_COUNT_BY          : string  := "0";
      C_COUNT_MODE        : integer := 0;          -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE     : string  := "0";
      C_CE_OVERRIDES_SCLR : integer := 0;          -- 0=override;
      C_HAS_THRESH0       : integer := 0;
      C_HAS_LOAD          : integer := 0;
      C_LOAD_LOW          : integer := 0
      );
    PORT (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
  --core_if off
  END COMPONENT;


END xbip_counter_v3_0_3_comp;


-- $Id: xbip_counter_v3_0_3_pkg.vhd,v 1.3 2009/09/08 16:46:30 akennedy Exp $
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


-------------------------------------------------------------------------------
-- Naming conventions
-- C_  = generic constant
-- ci_ = internal constant (derived from generics, or just an implementation constant)
-- p_  = function parameter (ensures that the value passed is used rather than
-- some global variable)
-- v_  = variable
-- fn_ = function prefix.
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

package xbip_counter_v3_0_3_pkg is

  type t_xbip_counter_v3_0_3_fb_latency is record
    used        : integer;
    gate_pipes  : integer;
    gate_op     : integer;
    gate_excess : integer;
  end record;

  type t_xbip_counter_v3_0_3_thresh_latency is record
    gate_pipes  : integer;
    gate_op     : integer;
  end record;

  constant c_bip_counter_v3_0_max_pipe_stages : integer := 32;
  type t_xbip_counter_v3_0_3_pipe is array (0 to c_bip_counter_v3_0_max_pipe_stages) of integer;
  
  type t_xbip_counter_v3_0_3_latency is record
    used : integer;
    pipe : t_xbip_counter_v3_0_3_pipe;
  end record;

  type t_xbip_counter_v3_0_3_resources is record
    dsp48    : integer;
    bram18k  : integer;
    luts     : integer;
    ffs      : integer;
  end record;
  
  function fn_xbip_counter_v3_0_3_check_generics(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return integer;

  function fn_xbip_counter_v3_0_3_get_resources(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_resources;
  
  function fn_xbip_counter_v3_0_3_latency(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_latency;
  
  function fn_xbip_counter_v3_0_3_get_fb_latency (
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_fb_latency;

  function fn_xbip_counter_v3_0_3_get_thresh_latency (
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_thresh_latency;

  constant ci_vx4_cc_limit     : integer := 12;
  constant ci_vx5_cc_limit     : integer := 20;
  constant ci_sp3adsp_cc_limit : integer := 8;
  constant ci_other_cc_limit   : integer := 10;
  
end package xbip_counter_v3_0_3_pkg;

package body xbip_counter_v3_0_3_pkg is

  function fn_xbip_counter_v3_0_3_check_generics(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return integer is
  begin
    --simple range checks first
    if p_use_dsp48 <0 or p_use_dsp48 > 1 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_USE_DSP48 must be 0 or 1."
        severity error;
    end if;
    if p_restrict_count <0 or p_restrict_count > 1 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_RESTRICT_COUNT must be 0 or 1."
        severity error;
    end if;
    if p_has_thresh0 <0 or p_has_thresh0 > 1 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_HAS_THRESH0 must be 0 or 1."
        severity error;
    end if;
    if p_has_load <0 or p_has_load > 1 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_HAS_LOAD must be 0 or 1."
        severity error;
    end if;
    if p_load_low <0 or p_load_low > 1 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_LOAD_LOW must be 0 or 1."
        severity error;
    end if;
    if p_ce_overrides_sclr <0 or p_ce_overrides_sclr > 1 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_CE_OVERRIDES_SCLR must be 0 or 1."
        severity error;
    end if;
    if p_latency < -1 or p_latency = 0 or p_latency > 32 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_LATENCY must be -1 or in the range 1 to 32"
        severity error;
    end if;
    if p_fb_latency < -1 or p_fb_latency > 4 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_FB_LATENCY must be -1 or in the range 0 to 4"
        severity error;
    end if;
    if p_width < 1 or p_width > 256 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_WIDTH must be in the range 1 to 256"
        severity error;
    end if;
    if p_count_mode < 0 or p_count_mode > 2 then
      assert false
        report "ERROR: xbip_counter_v3_0_3: C_COUNT_MODE must be 0 (add), 1(sub) or 2(add/sub)"
        severity error;
    end if;

    --combination checks
    if p_count_mode = 2 and p_has_thresh0 = 1 then
      assert false
        report "ERROR: Threshold detection is not allowed for up/down counters due to the latency."
        severity error;
    end if;

    if p_count_mode = 2 and p_restrict_count = 1 then
      assert false
        report "ERROR: Restricted counting is not allowed for up/down counters due to the latency in the terminal count detection."
        severity error;
    end if;

    --WARNINGS
    if p_verbosity > 0 then
      if (p_load_low = 0 and p_use_dsp48 = 0) or (p_load_low = 1 and p_use_dsp48 = 1 and supports_dsp48a(p_xdevicefamily)>0) then
        assert false
          report "WARNING: xbip_counter_v3_0_3: C_LOAD_LOAD and C_USE_DSP48 values are non-optimal."
          severity warning;
      end if;
    end if;
    return 0;
  end fn_xbip_counter_v3_0_3_check_generics;
  
  function fn_xbip_counter_v3_0_3_get_resources(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_resources is
    variable ret_val : t_xbip_counter_v3_0_3_resources;
    variable v_lat : integer;
    variable v_fb_lat_array : t_xbip_counter_v3_0_3_fb_latency;
    variable v_fb_lat : integer;
    variable v_lut_size : integer;
    variable v_fam : T_DEVICE_FAMILY := fn_check_family(p_xdevicefamily);
    constant ci_num_segs_array : t_xbip_counter_v3_0_3_latency := fn_xbip_counter_v3_0_3_latency(
      p_xdevicefamily     => p_xdevicefamily,
      p_verbosity         => p_verbosity,
      p_use_dsp48         => p_use_dsp48,
      p_latency           => p_latency,
      p_fb_latency        => p_fb_latency,
      p_width             => p_width,
      p_restrict_count    => p_restrict_count,
      p_count_to          => p_count_to,
      p_count_by          => p_count_by,
      p_count_mode        => p_count_mode,
      p_thresh0_value     => p_thresh0_value,
      p_ce_overrides_sclr => p_ce_overrides_sclr,
      p_has_thresh0       => p_has_thresh0,
      p_has_load          => p_has_load,
      p_load_low          => p_load_low
      );
    constant ci_num_segs : integer := ci_num_segs_array.used;
    variable ci_seg_width : integer := 0;
    variable temp : integer := 0;
  begin
    temp := p_width -1;
    ci_seg_width := temp/ci_num_segs +1;
    ret_val.dsp48 := 0;
    ret_val.bram18k := 0;
    ret_val.luts := 0;
    ret_val.ffs := 0;

    v_lat := ci_num_segs;               -- it's a diagonal structure.

    v_fb_lat_array := fn_xbip_counter_v3_0_3_get_fb_latency(
      p_xdevicefamily     => p_xdevicefamily,
      p_verbosity         => p_verbosity,
      p_use_dsp48         => p_use_dsp48,
      p_latency           => v_lat,
      p_fb_latency        => p_fb_latency,
      p_width             => p_width,
      p_restrict_count    => p_restrict_count,
      p_count_to          => p_count_to,
      p_count_by          => p_count_by,
      p_count_mode        => p_count_mode,
      p_thresh0_value     => p_thresh0_value,
      p_ce_overrides_sclr => p_ce_overrides_sclr,
      p_has_thresh0       => p_has_thresh0,
      p_has_load          => p_has_load,
      p_load_low          => p_load_low
      );
    v_fb_lat := v_fb_lat_array.used;

    if p_use_dsp48 = 1 then
      ret_val.dsp48 := 1;               --simple for now!

      --count ffs required to preregister D path
      if v_lat = 3 and supports_dsp48a(p_xdevicefamily)>0 and p_width > 36 then
        ret_val.ffs := ret_val.ffs + p_width -36;
      end if;
      --ignore logic for extension of opmode. It's only one or two lut/ffs.
    else
      --logic in pipelined fabric count.
      --each stage has carry in and carryout except the first and last
      
      --second implementation:
--      ret_val.luts := (p_width + v_lat*2 - 2);
--      ret_val.ffs  := p_width * v_lat + (v_lat*2 -2) ;       -- so far.

      ret_val.luts := (p_width + v_lat*2 - 2);  --luts in counters
      ret_val.ffs  := (p_width + v_lat - 1);    --each segment counter is a bit
--wider to accommodate cout, apart from the last stage.

      --Q pipe
      if ci_num_segs > 1 then
        ret_val.ffs  := ret_val.ffs + (ci_num_segs-1)*ci_seg_width;
      end if;
      if ci_num_segs > 2 then
        ret_val.luts := ret_val.luts + (ci_num_segs-2)*ci_seg_width;  --SRLs
      end if;

      --load value pipe
      if p_has_load = 1 then
        if ci_num_segs > 1 then
          ret_val.ffs  := ret_val.ffs + p_width - ci_seg_width;
        end if;
        if ci_num_segs > 2 then
          ret_val.luts := ret_val.luts + p_width-2*ci_seg_width;  --SRLs
        end if;

        --load pipe
        ret_val.ffs := ret_val.ffs + v_lat-1;
      end if;

      --up pipe
      if p_count_mode = 2 then
        ret_val.ffs := ret_val.ffs + v_lat-1;
      end if;
      --tc pipe
      if p_restrict_count = 1 then
        ret_val.ffs := ret_val.ffs + v_lat-1;
      end if;
    end if;

    v_lut_size := fn_get_lut_size(v_fam);

    ---------------------------------------------------------------------------
    -- Terminal count logic. This is a simplification based on
    -- the idea that the gate bit is implemented using gates only. With less than
    -- optimal latency it can use the carry chain too.
    ---------------------------------------------------------------------------
    if p_restrict_count = 1 then
      if p_width <= v_lut_size then
        ret_val.luts := ret_val.luts + 1;  
        if v_fb_lat = 1 then
          ret_val.ffs := ret_val.ffs + 1;
        end if;
      elsif p_width <= v_lut_size*v_lut_size then
        ret_val.luts := ret_val.luts + 1;  
        ret_val.luts := ret_val.luts + (p_width-1)/v_lut_size + 1;
        if v_fb_lat > 1 then
          ret_val.ffs := ret_val.ffs + 1 + ((p_width-1)/v_lut_size + 1);
        end if;
      elsif p_width <= v_lut_size*v_lut_size*v_lut_size then
        ret_val.luts := ret_val.luts + 1; 
        ret_val.luts := ret_val.luts + ((p_width-1)/v_lut_size)/v_lut_size + 1;
        ret_val.luts := ret_val.luts + (p_width-1)/v_lut_size + 1;
        if v_fb_lat > 2 then
          ret_val.ffs := ret_val.ffs + 1 + (((p_width-1)/v_lut_size)/v_lut_size + 1) + ((p_width-1)/v_lut_size + 1);
        end if;
      else
        ret_val.luts := ret_val.luts + 1;  
        ret_val.luts := ret_val.luts + (((p_width-1)/v_lut_size)/v_lut_size)/v_lut_size + 1;
        ret_val.luts := ret_val.luts + ((p_width-1)/v_lut_size)/v_lut_size + 1;
        ret_val.luts := ret_val.luts + (p_width-1)/v_lut_size + 1;
        if v_fb_lat > 2 then
          ret_val.ffs := ret_val.ffs + 1 +
                         ((((p_width-1)/v_lut_size)/v_lut_size)/v_lut_size + 1) +
                         (((p_width-1)/v_lut_size)/v_lut_size + 1) +
                         ((p_width-1)/v_lut_size + 1);
        end if;
      end if;
    end if;

    ---------------------------------------------------------------------------
    -- Threshold logic (uses gate bit too). This is a simplification based on
    -- the idea that the gate bit is implemented using gates only. With less than
    -- optimal latency it can use the carry chain too.
    ---------------------------------------------------------------------------
    if p_has_thresh0 = 1 then
      if p_width <= v_lut_size then
        ret_val.luts := ret_val.luts + 1;  
        if v_fb_lat = 1 then
          ret_val.ffs := ret_val.ffs + 1;
        end if;
      elsif p_width <= v_lut_size*v_lut_size then
        ret_val.luts := ret_val.luts + 1;  
        ret_val.luts := ret_val.luts + (p_width-1)/v_lut_size + 1;
        if v_fb_lat > 1 then
          ret_val.ffs := ret_val.ffs + 1 + ((p_width-1)/v_lut_size + 1);
        end if;
      elsif p_width <= v_lut_size*v_lut_size*v_lut_size then
        ret_val.luts := ret_val.luts + 1;  
        ret_val.luts := ret_val.luts + ((p_width-1)/v_lut_size)/v_lut_size + 1;
        ret_val.luts := ret_val.luts + (p_width-1)/v_lut_size + 1;
        if v_fb_lat > 2 then
          ret_val.ffs := ret_val.ffs + 1 + (((p_width-1)/v_lut_size)/v_lut_size + 1) + ((p_width-1)/v_lut_size + 1);
        end if;
      else
        ret_val.luts := ret_val.luts + 1;  
        ret_val.luts := ret_val.luts + (((p_width-1)/v_lut_size)/v_lut_size)/v_lut_size + 1;
        ret_val.luts := ret_val.luts + ((p_width-1)/v_lut_size)/v_lut_size + 1;
        ret_val.luts := ret_val.luts + (p_width-1)/v_lut_size + 1;
        if v_fb_lat > 2 then
          ret_val.ffs := ret_val.ffs + 1 +
                         ((((p_width-1)/v_lut_size)/v_lut_size)/v_lut_size + 1) +
                         (((p_width-1)/v_lut_size)/v_lut_size + 1) +
                         ((p_width-1)/v_lut_size + 1);
        end if;
      end if;
    end if;

    if p_verbosity >= 2 then
      assert false
        report "Note: xbip_counter_v3_0_3 DSP48 count = "&integer'image(ret_val.DSP48)
        severity note;
      assert false
        report "Note: xbip_counter_v3_0_3 BRAM18K count = "&integer'image(ret_val.bram18k)
        severity note;
      assert false
        report "Note: xbip_counter_v3_0_3 LUT count = "&integer'image(ret_val.luts)
        severity note;
      assert false
        report "Note: xbip_counter_v3_0_3 FF count = "&integer'image(ret_val.ffs)
        severity note;
    end if;
 
    return ret_val;
  end function fn_xbip_counter_v3_0_3_get_resources;
  
  function fn_xbip_counter_v3_0_3_latency(
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_latency is
    variable v_latency_left  : integer;
    variable ret_val : t_xbip_counter_v3_0_3_latency;
    variable v_lat_req : integer;
  begin
    v_latency_left := p_latency;
    ret_val.used := 0;
      for i in 0 to c_bip_counter_v3_0_max_pipe_stages loop
        ret_val.pipe(i) := 0;
      end loop;  -- i
    if p_use_dsp48 = 0 then
      --fabric
      if p_latency = -1 then
        if has_dsp48(p_xdevicefamily) then
          v_lat_req := (p_width-1)/ci_vx4_cc_limit + 1;
        elsif supports_dsp48e(p_xdevicefamily)>0 then
          v_lat_req := (p_width-1)/ci_vx5_cc_limit + 1;
        elsif supports_dsp48a(p_xdevicefamily)>0 then
          v_lat_req := (p_width-1)/ci_sp3adsp_cc_limit + 1;
        else
          v_lat_req := (p_width-1)/ci_other_cc_limit + 1;
        end if;
      else
        v_lat_req := p_latency;
      end if;
      ret_val.used := v_lat_req;
      for k in 1 to v_lat_req loop
        ret_val.pipe(k) := 1;
      end loop;  -- k
    else
      --dsp48
      if v_latency_left /= 0 then
        ret_val.pipe(4) := 1;
        v_latency_left := v_latency_left -1;
        ret_val.used := ret_val.used + 1;
      end if;
      if v_latency_left /= 0 then
        ret_val.pipe(3) := 1;
        v_latency_left := v_latency_left -1;
        ret_val.used := ret_val.used + 1;
      end if;
      if p_restrict_count = 1 and p_has_load = 1 then
        if v_latency_left /= 0 then
          ret_val.pipe(2) := 1;
          v_latency_left := v_latency_left -1;
          ret_val.used := ret_val.used + 1;
        end if;
      end if;
      if v_latency_left > 0  then
        assert false
          report "ERROR: xbip_counter_v3_0_3: Excessive latency for DSP48-based case."
          severity error;
      end if;
      
    end if;
    return ret_val;
  end function fn_xbip_counter_v3_0_3_latency;

  
  function fn_xbip_counter_v3_0_3_get_fb_latency (
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_fb_latency is
    variable ret_val : t_xbip_counter_v3_0_3_fb_latency;
    variable v_countto_val : std_logic_vector(1 to p_width) := (others => '0');
    variable v_countby_val : std_logic_vector(1 to p_width) := (others => '0');
    variable v_detect_val  : std_logic_vector(1 to p_width) := (others => '0');
    variable v_req_lat     : integer := 0;
    variable v_loop_count  : integer := 0;
    variable v_det_width : integer := 0;
    constant ci_latency_alloc : t_xbip_counter_v3_0_3_latency := fn_xbip_counter_v3_0_3_latency(
      p_xdevicefamily     => p_xdevicefamily,
      p_verbosity         => p_verbosity ,
      p_use_dsp48         => p_use_dsp48, 
      p_latency           => p_latency,
      p_fb_latency        => p_fb_latency,
      p_width             => p_width,
      p_restrict_count    => p_restrict_count,
      p_count_to          => p_count_to ,
      p_count_by          => p_count_by ,
      p_count_mode        => p_count_mode ,
      p_thresh0_value     => p_thresh0_value,
      p_ce_overrides_sclr => p_ce_overrides_sclr, 
      p_has_thresh0       => p_has_thresh0,
      p_has_load          => p_has_load,
      p_load_low          => p_load_low
      );
    variable stages_req : integer;
    variable v_latency_left : integer;
  begin
    ret_val.used        := 0;
    ret_val.gate_pipes  := 0;
    ret_val.gate_op     := 0;
    ret_val.gate_excess := 0;

    if p_restrict_count = 0 then
      return ret_val;
    end if;
    
    if has_lut4(p_xdevicefamily) then
      if p_width <= 4 then
        stages_req := 0;
      elsif p_width <= 16 then
        stages_req := 1;
      elsif p_width <= 64 then
        stages_req := 2;
      else
        stages_req := 3;
      end if;
    end if;
    if has_lut6(p_xdevicefamily) then
      if p_width <= 6 then
        stages_req := 0;
      elsif p_width <= 36 then
        stages_req := 1;
      elsif p_width <= 216 then
        stages_req := 2;
      else
        stages_req := 3;
      end if;
    end if;

    v_latency_left := p_fb_latency;
    if v_latency_left /= 0 then
      v_latency_left  := v_latency_left -1;
      ret_val.gate_op := 1;
      ret_val.used    := ret_val.used + 1;
    end if;
    for i in 1 to 4 loop                -- >max number of gate pipestages
      if v_latency_left /= 0 and ret_val.gate_pipes < stages_req then
        v_latency_left     := v_latency_left -1;
        ret_val.gate_pipes := ret_val.gate_pipes + 1;
        ret_val.used       := ret_val.used + 1;
      end if;
    end loop;  -- i
    if v_latency_left > 0 then
      ret_val.used        := ret_val.used + v_latency_left;
      ret_val.gate_excess := v_latency_left;
      v_latency_left      := 0;
    end if;

    return ret_val;
  end fn_xbip_counter_v3_0_3_get_fb_latency;

  function fn_xbip_counter_v3_0_3_get_thresh_latency (
    p_xdevicefamily     : string;
    p_verbosity         : integer;
    p_use_dsp48         : integer;
    p_latency           : integer;
    p_fb_latency        : integer;
    p_width             : integer;
    p_restrict_count    : integer;
    p_count_to          : string;
    p_count_by          : string;
    p_count_mode        : integer;      -- 0=up, 1=down, 2=updown
    p_thresh0_value     : string;
    p_ce_overrides_sclr : integer;      -- 0=override;
    p_has_thresh0       : integer;
    p_has_load          : integer;
    p_load_low          : integer
    )
    return t_xbip_counter_v3_0_3_thresh_latency is
    variable ret_val : t_xbip_counter_v3_0_3_thresh_latency;
    constant ci_latency_fb_alloc : t_xbip_counter_v3_0_3_fb_latency := fn_xbip_counter_v3_0_3_get_fb_latency(
      p_xdevicefamily     => p_xdevicefamily,
      p_verbosity         => p_verbosity ,
      p_use_dsp48         => p_use_dsp48, 
      p_latency           => p_latency,
      p_fb_latency        => p_fb_latency,
      p_width             => p_width,
      p_restrict_count    => p_restrict_count,
      p_count_to          => p_count_to ,
      p_count_by          => p_count_by ,
      p_count_mode        => p_count_mode ,
      p_thresh0_value     => p_thresh0_value,
      p_ce_overrides_sclr => p_ce_overrides_sclr, 
      p_has_thresh0       => p_has_thresh0,
      p_has_load          => p_has_load,
      p_load_low          => p_load_low
      );
    variable det_value      : std_logic_vector(p_width-1 downto 0) := (others => '0');
    variable det_value_zero : std_logic_vector(p_width-1 downto 0) := (others => '0');
    variable v_thresh_slv   : std_logic_vector(p_width-1 downto 0) := str_to_bound_slv_0(p_thresh0_value, p_width);
    variable v_count_by_slv : std_logic_vector(p_width-1 downto 0) := str_to_bound_slv_0(p_count_by, p_width);
  begin
    ret_val.gate_pipes := ci_latency_fb_alloc.gate_pipes;
    ret_val.gate_op    := ci_latency_fb_alloc.gate_op;
--    ret_val.gate_pipes  := 0;
--    ret_val.gate_op     := 1;
--
--    if has_lut4(p_xdevicefamily) then
--      if p_width <= 4 then
--        stages_req := 0;
--      elsif p_width <= 16 then
--        stages_req := 1;
--      elsif p_width <= 64 then
--        stages_req := 2;
--      else
--        stages_req := 3;
--      end if;
--    end if;
--    if has_lut6(p_xdevicefamily) then
--      if p_width <= 6 then
--        stages_req := 0;
--      elsif p_width <= 36 then
--        stages_req := 1;
--      elsif p_width <= 216 then
--        stages_req := 2;
--      else
--        stages_req := 3;
--      end if;
--    end if;
--
--    ret_val.gate_pipes := stages_req;

    --Now check that value versus terminal count etc
    det_value := v_thresh_slv;
    for i in 1 to ret_val.gate_pipes + ret_val.gate_op loop
      if p_count_mode = 0 then        --up
        det_value := det_value - v_count_by_slv;
      else
        det_value := det_value + v_count_by_slv;
      end if;
    end loop;  -- i
    --if det_value has opposite sign to count_by, it will never trigger
    if (det_value(det_value'LEFT) = v_count_by_slv(v_count_by_slv'LEFT)) or (det_value /= det_value_zero) then        --up
      null;                           --no problem.
    else
      if p_verbosity > 0 then
        assert false
          report "WARNING: xbip_counter_v3_0_3: Threshold detection pipelining results in a value which will never occur."
          severity warning;
      end if;
    end if;
    
    return ret_val;
  end fn_xbip_counter_v3_0_3_get_thresh_latency;

  
end package body xbip_counter_v3_0_3_pkg;



-- $Id: xbip_counter_v3_0_3_hdl_comps.vhd,v 1.3 2009/09/08 16:46:30 akennedy Exp $
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

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_pkg.all;

package xbip_counter_v3_0_3_hdl_comps is
  component dsp48_counter
    generic (
      C_XDEVICEFAMILY  : string  := "virtex2";
      C_VERBOSITY      : integer := 0;
      C_HAS_CE         : integer := 0;
      C_HAS_SCLR       : integer := 0;
      CI_PIPE_ALL      : t_xbip_counter_v3_0_3_latency;
      C_WIDTH          : integer := 16;
      C_RESTRICT_COUNT : integer := 0;
      C_COUNT_BY       : string  := "0";
      C_COUNT_MODE     : integer := 0;  -- 0=up, 1=down, 2=updown
      C_HAS_LOAD       : integer := 0
      );
    port (
      CLK  : in  std_logic                            := '0';  -- optional clock
      CE   : in  std_logic                            := '1';  -- optional clock enable
      SCLR : in  std_logic                            := '0';  -- synch init.
      N_TC : in  std_logic                            := '0';
      UP   : in  std_logic                            := '1';  -- controls direction of count - '1' = up.
      LOAD : in  std_logic                            := '0';  -- optional synch load trigger
      L    : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      Q    : out std_logic_vector(C_WIDTH-1 downto 0)          -- output value
      );
  end component dsp48_counter;

  component fabric_counter
    generic (
      C_XDEVICEFAMILY  : string  := "virtex2";
      C_VERBOSITY      : integer := 0;
      C_HAS_CE         : integer := 0;
      C_HAS_SCLR       : integer := 0;
      CI_PIPE_ALL      : t_xbip_counter_v3_0_3_latency;
      C_WIDTH          : integer := 16;
      C_RESTRICT_COUNT : integer := 0;
      C_COUNT_BY       : string  := "0";
      C_COUNT_MODE     : integer := 0;  -- 0=up, 1=down, 2=updown
      C_HAS_LOAD       : integer := 0
      );
    port (
      CLK    : in  std_logic                            := '0';  -- optional clock
      CE     : in  std_logic                            := '1';  -- optional clock enable
      SCLR   : in  std_logic                            := '0';  -- synch init.
      N_TC   : in  std_logic                            := '0';
      UP     : in  std_logic                            := '1';  -- controls direction of count - '1' = up.
      N_LOAD : in  std_logic                            := '0';  -- optional synch load trigger
      L      : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      Q      : out std_logic_vector(C_WIDTH-1 downto 0)          -- output value
      );
  end component fabric_counter;

end package xbip_counter_v3_0_3_hdl_comps;

package body xbip_counter_v3_0_3_hdl_comps is
      
end package body xbip_counter_v3_0_3_hdl_comps;



-- $Id: dsp48_counter.vhd,v 1.3 2009/09/08 16:46:30 akennedy Exp $
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
--This file contains the DSP48 implementation of the counter solution.
--At present only single DSP48 solutions are supported.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_dsp48_wrapper_v3_0_4;
use xbip_dsp48_wrapper_v3_0_4.xbip_dsp48_wrapper_v3_0_4_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_pkg.all;

entity dsp48_counter is
  generic (
    C_XDEVICEFAMILY     : string  := "virtex2";
    C_VERBOSITY         : integer := 0;
    C_HAS_CE            : integer := 0;
    C_HAS_SCLR          : integer := 0;
    CI_PIPE_ALL         : t_xbip_counter_v3_0_3_latency;
    C_WIDTH             : integer := 16;
    C_RESTRICT_COUNT    : integer := 0;
    C_COUNT_BY          : string  := "0";
    C_COUNT_MODE        : integer := 0;          -- 0=up, 1=down, 2=updown
    C_HAS_LOAD          : integer := 0
    );
  port (
    CLK     : in  std_logic                            := '0';              -- optional clock
    CE      : in  std_logic                            := '1';              -- optional clock enable
    SCLR    : in  std_logic                            := '0';              -- synch init.
    N_TC    : in  std_logic                            := '0';
    UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
    LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
    L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
    Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
    );
end dsp48_counter;
architecture synth of dsp48_counter is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  --For the counter to reach terminal count, then return to zero, the implication
  --is that terminal count is detected and some reset applied to the accumulator
  --all in one cycle. That is possible, but would kill speed. Realistically,
  --there is the latency of terminal count detection, then the opmode register
  --which means the terminal count must be anticipated by the latency of the
  --detection and reset circuit. This is fine, but it means there is a lower limit
  --to the 'period' of the counter, in terms of unique numbers output. This lower
  --limit would be 2 or 3, which seems no great constraint.

  --For full speed, the terminal count reset must go via the opmode register.
  --This means the C reg will be present, unless the acc is not used, but a
  --wrapper case used instead. If the C reg is present, the recovery from reset
  --behaviour is one cycle longer than baseblox.

  constant ci_pipe : t_xbip_counter_v3_0_3_pipe := ci_pipe_all.pipe;

  signal count_by_slv : std_logic_vector(ci_dsp48e1_c_width-1 downto 0) :=
    str_to_bound_slv_0(C_COUNT_BY,ci_dsp48e1_c_width);
--  signal l_i    : std_logic_vector(fn_dsp48_concat_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
  signal l_d : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');

begin

  i_del_l : xbip_pipe_v3_0_3_viv
    generic map(
      C_LATENCY  => ci_pipe(2),
      C_HAS_CE   => 1,
      C_HAS_SCLR => C_HAS_SCLR,
      C_WIDTH    => C_WIDTH
      )
    port map(
      CLK   => CLK,
      CE    => ce,
      SCLR  => sclr,
      D     => L,
      Q     => l_d
      );

  i_vx7: if supports_dsp48e1(C_XDEVICEFAMILY)>0 generate
    signal subtract_d : std_logic := '0';
    signal add_d      : std_logic := '0';
    signal zmux       : std_logic_vector(2 downto 0) := (others => '0');
    signal ymux       : std_logic_vector(1 downto 0) := (others => '0');
    signal xmux       : std_logic_vector(1 downto 0) := (others => '0');
    signal opmode     : std_logic_vector(6 downto 0) := (others => '0');
    signal opmode_d   : std_logic_vector(6 downto 0) := (others => '0');
    signal alumode    : std_logic_vector(3 downto 0) := (others => '0');
    signal aport      : std_logic_vector(fn_dsp48_a_width(C_XDEVICEFAMILY)-1 downto 0) := (others => '0');
    signal bport      : std_logic_vector(ci_dsp48e1_b_width-1 downto 0) := (others => '0');
    signal cport      : std_logic_vector(ci_dsp48e1_c_width-1 downto 0) := (others => '0');
    signal pport      : std_logic_vector(ci_dsp48e1_p_width-1 downto 0) := (others => '0');
  begin
    i_up_only: if C_COUNT_MODE = 0 generate
    begin
      subtract_d <= '0';
    end generate i_up_only;
    i_down_only: if C_COUNT_MODE = 1 generate
    begin
      subtract_d <= '1';
    end generate i_down_only;
    i_up_down: if C_COUNT_MODE = 2 generate
    begin
      i_del : xbip_pipe_v3_0_3_viv
        generic map(
          C_LATENCY  => ci_pipe(2),
          C_HAS_CE   => 1,
          C_HAS_SCLR => C_HAS_SCLR,
          C_WIDTH    => 1
          )
        port map(
          CLK   => CLK,
          CE    => ce,
          SCLR  => sclr,
          D(0)  => UP,
          Q(0)  => add_d
          );
      subtract_d <= not add_d;
    end generate i_up_down;

    i_no_restrict: if C_RESTRICT_COUNT = 0 generate
    begin
      xmux <= "00" when load = '1' else  --add 0
              "11";                      --add AB (count by)
      ymux <= "00";
      zmux <= "011" when load = '1' else --add C (Load val)
              "010";                     --add P (feedback)

    end generate i_no_restrict;
    i_restrict: if C_RESTRICT_COUNT = 1 generate
    begin
      xmux <= "00" when load = '1' else  --add 0
              "00" when N_TC = '0' else  --add 0
              "11";                      --add AB
      ymux <= "00";
      zmux <= "011" when load = '1' else --add C (load val)
              "000" when N_TC = '0' else --add 0
              "010";                     --add P (feedback)
    end generate i_restrict;
    opmode <= zmux & ymux & xmux;
    i_del_opmode : xbip_pipe_v3_0_3_viv
      generic map(
        C_LATENCY  => ci_pipe(2),
        C_HAS_CE   => 1,
        C_HAS_SCLR => C_HAS_SCLR,
        C_WIDTH    => 7
        )
      port map(
        CLK   => CLK,
        CE    => ce,
        SCLR  => sclr,
        D     => opmode,
        Q     => opmode_d
        );

    cport <= std_logic_vector(resize(unsigned(l_d),ci_dsp48e1_c_width));
    aport <= count_by_slv(fn_dsp48_a_width(C_XDEVICEFAMILY)+ci_dsp48e1_b_width-1 downto ci_dsp48e1_b_width);
    bport <= count_by_slv(ci_dsp48e1_b_width-1 downto 0);
    alumode <= "0011" when subtract_d = '1' else "0000";
    i_dsp48e_wrap : xbip_dsp48e1_wrapper_v3_0
      generic map(
        OPMODEREG     => ci_pipe(3),
        ALUMODEREG    => ci_pipe(3),
        CARRYINSELREG => ci_pipe(3),
        PREG          => ci_pipe(4),
        AREG          => ci_pipe(2) + ci_pipe(3),
        BREG          => ci_pipe(2) + ci_pipe(3),
        ACASCREG      => -1,
        BCASCREG      => -1,
        CREG          => ci_pipe(3)
        )
      port map(
        CLK     => CLK,
        CE      => ce,
        SCLR    => sclr,
        OPMODE  => opmode_d,
        ALUMODE => alumode,
        A       => aport,
        B       => bport,
        C       => cport,
        P       => pport
        );
    Q <= pport(C_WIDTH-1 downto 0);
  end generate i_vx7;

end synth;



-- $Id: fabric_counter.vhd,v 1.3 2009/09/08 16:46:30 akennedy Exp $
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
--This file contains the synthesizable code for fabric implementation
--with non-trivial latency.
--Only SCLR is supported, so the fabric implementation behaves
--identically to the DSP48 model giving implementation abstraction.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_pkg.all;

entity fabric_counter is
  generic (
    C_XDEVICEFAMILY     : string  := "virtex2";
    C_VERBOSITY         : integer := 0;
    C_HAS_CE            : integer := 0;
    C_HAS_SCLR          : integer := 0;
    CI_PIPE_ALL         : t_xbip_counter_v3_0_3_latency;
    C_WIDTH             : integer := 16;
    C_RESTRICT_COUNT    : integer := 0;
    C_COUNT_BY          : string  := "0";
    C_COUNT_MODE        : integer := 0;          -- 0=up, 1=down, 2=updown
    C_HAS_LOAD          : integer := 0
    );
  port (
    CLK     : in  std_logic                            := '0';              -- optional clock
    CE      : in  std_logic                            := '1';              -- optional clock enable
    SCLR    : in  std_logic                            := '0';              -- synch init.
    N_TC    : in  std_logic                            := '1';
    UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
    N_LOAD  : in  std_logic                            := '0';              -- optional synch load trigger
    L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
    Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
    );
end fabric_counter;
architecture synth of fabric_counter is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant ci_pipe : t_xbip_counter_v3_0_3_pipe := CI_PIPE_ALL.pipe;  --array of register placements
  constant ci_num_segs  : integer := ci_pipe_all.used;  --latency used

  signal diag_num_segs : integer := ci_num_segs;  --number of splices of carry chain

  constant ci_seg_width : integer := (C_WIDTH-1)/ci_num_segs +1; 

  type t_seg is array (1 to ci_num_segs) of std_logic_vector(ci_seg_width-1 downto 0);

  constant ci_count_by_slv : std_logic_vector(C_WIDTH-1 downto 0) := str_to_bound_slv_0(C_COUNT_BY,C_WIDTH);
  signal diag_count_by_slv : std_logic_vector(C_WIDTH-1 downto 0) := ci_count_by_slv;
  signal l_i          : t_seg   := (others => (others => '0'));  --load value in segment array form
  signal q_i          : t_seg   := (others => (others => '0'));  --final output value in segment array form.
  signal count_by_slv : t_seg   := (others => (others => '0'));  --count by value in segment array form.
  signal carry_in  : std_logic_vector(ci_num_segs+1 downto 1) := (others => '0');
  signal up_d      : std_logic_vector(ci_num_segs downto 1) := (others => '0');
  signal n_tc_d    : std_logic_vector(ci_num_segs downto 1) := (others => '1');  -- active low terminal count control (piped array).
--  signal n_load_d  : std_logic_vector(ci_num_segs downto 1) := (others => '1');  -- active low load control (piped) array.
  signal n_load_d  : std_logic_vector(ci_num_segs downto 1) := (others => '0');  -- active low load control (piped) array.
  
begin
  -------------------------------------------------------------------------------
  -- Precondition inputs
  -------------------------------------------------------------------------------
  --Up/down and the sense of the initial carryin (borrow, remember)
  i_up_del: if C_COUNT_MODE = 0 generate
  begin
    up_d <= (others => '1');
  end generate i_up_del;
  i_down_del: if C_COUNT_MODE = 1 generate
  begin
    up_d <= (others => '0');
  end generate i_down_del;
  i_updown_del: if C_COUNT_MODE = 2 generate
  begin
    up_d(1) <= UP;
    i_piped : if ci_num_segs > 1 generate
      i_up_pipe : xbip_pipe_v3_0_3_viv
        generic map(
          C_LATENCY  => 1,
          C_HAS_CE   => 1,
          C_HAS_SSET => C_HAS_SCLR,
          C_WIDTH    => ci_num_segs-1
          )
        port map(
          CLK  => CLK,
          CE   => CE,
          SSET => SCLR,
          D    => up_d(ci_num_segs-1 downto 1), 
          Q    => up_d(ci_num_segs downto 2)
          );
    end generate i_piped;
  end generate i_updown_del;

  -----------------------------------------------------------------------------
  -- Active low terminal count value has to be piped to reach each segment at
  -- the right time. Note the use of SSET.
  -----------------------------------------------------------------------------
  i_n_tc_del : if C_RESTRICT_COUNT = 1 generate
  begin
    n_tc_d(1) <= N_TC;
    i_piped : if ci_num_segs > 1 generate
    begin
      i_n_tc_pipe : xbip_pipe_v3_0_3_viv
        generic map(
          C_LATENCY  => 1,
          C_HAS_CE   => 1,
          C_HAS_SCLR => C_HAS_SCLR,
          C_WIDTH    => ci_num_segs-1
          )
        port map(
          CLK  => CLK,
          CE   => CE,
          SCLR => SCLR,
          D    => n_tc_d(ci_num_segs-1 downto 1),
          Q    => n_tc_d(ci_num_segs downto 2)
          );
    end generate i_piped;
  end generate i_n_tc_del;

  -----------------------------------------------------------------------------
  -- active low load control has to be piped to reach each segment at the right
  -- time. Note the use of SSET.
  -----------------------------------------------------------------------------
  n_load_d(1) <= N_LOAD;
  i_piped : if ci_num_segs > 1 generate
  begin
    i_load_pipe : xbip_pipe_v3_0_3_viv
      generic map(
        C_LATENCY  => 1,
        C_HAS_CE   => 1,
--          C_HAS_SSET => C_HAS_SCLR,
        C_HAS_SCLR => C_HAS_SCLR,
        C_WIDTH    => ci_num_segs-1
        )
      port map(
        CLK  => CLK,
        CE   => CE,
--          SSET => SCLR,
        SCLR => SCLR,
        D    => n_load_d(ci_num_segs-1 downto 1),
        Q    => n_load_d(ci_num_segs downto 2)
        );
  end generate i_piped;
  
  i_load_del : if C_HAS_LOAD = 1 generate
  begin
    i_seg: for seg in 1 to ci_num_segs generate
    begin
      top_seg: if seg = ci_num_segs generate
      begin
        l_i(seg)(C_WIDTH-(ci_num_segs-1)*ci_seg_width-1 downto 0) <= L(C_WIDTH-1 downto (ci_num_segs-1)*ci_seg_width);
      end generate top_seg;
      i_not_top: if seg /= ci_num_segs generate
      begin
        l_i(seg) <= L(seg*ci_seg_width-1 downto (seg-1)*ci_seg_width);
      end generate i_not_top;
    end generate i_seg;
  end generate i_load_del;

  -----------------------------------------------------------------------------
  -- Count by value is loaded into the segment array.
  -----------------------------------------------------------------------------
  i_cb_slv: for seg in 1 to ci_num_segs generate
  begin
    top_seg: if seg = ci_num_segs generate
    begin
      count_by_slv(seg)(C_WIDTH-(ci_num_segs-1)*ci_seg_width-1 downto 0) <= ci_count_by_slv(C_WIDTH-1 downto (ci_num_segs-1)*ci_seg_width);
    end generate top_seg;
    i_not_top: if seg /= ci_num_segs generate
    begin
      count_by_slv(seg) <= ci_count_by_slv(seg*ci_seg_width-1 downto (seg-1)*ci_seg_width);
    end generate i_not_top;
  end generate i_cb_slv;

  -----------------------------------------------------------------------------
  -- End of input preconditioning. Now the fun begins.
  -----------------------------------------------------------------------------
  
  -----------------------------------------------------------------------------
  -- Third implementation! For loop of segments, with the pipe in and out
  -- included. This should help the inference of SRLs.
  -----------------------------------------------------------------------------

  i_seg: for seg in 1 to ci_num_segs generate
    signal l_seg    : std_logic_vector(ci_seg_width-1 downto 0) := (others => '0');
    signal sum_seg  : std_logic_vector(ci_seg_width+2-1 downto 0) := (others => '0');
    signal qsum_seg : std_logic_vector(ci_seg_width+2-1 downto 0) := (others => '0');
  begin

    --pre-registering. Delay the segment of the load value according to the
    --number of the segment (MS segments require greater delay)
    i_l_value_pipe: if C_HAS_LOAD = 1 generate
    begin
      i_l_pipe : xbip_pipe_v3_0_3_viv
        generic map(
          C_LATENCY  => seg-1,
          C_HAS_CE   => 1,
          C_HAS_SCLR => C_HAS_SCLR,
          C_WIDTH    => ci_seg_width,
          C_FAST_IP  => 0
          )
        port map(
          CLK  => CLK,
          CE   => CE,
          SCLR => SCLR,
          D    => l_i(seg),
          Q    => l_seg
          );
    end generate i_l_value_pipe;

    ---------------------------------------------------------------------------
    -- The actual count! Well, a splice of it at any rate.
    -- Each splice of the counter is wider by 2 bits than you would expect.
    -- The first bit is for carry-in - this comes via a LUT because of the
    -- load/tc clausing. The second extra bit is bit growth for the carryout.
    -- The implemented result is extremely sensitive to RTL phrasing, a bit
    -- like going to a foreign country and complimenting someone's wife.
    -- The desired result is a single layer of logic, not a duel at dawn.
    ---------------------------------------------------------------------------
    i_no_tc: if C_RESTRICT_COUNT = 0 generate
      signal op1 : std_logic_vector(ci_seg_width+2-1 downto 0) := (others => '0');
      signal op2 : std_logic_vector(ci_seg_width+2-1 downto 0) := (others => '0');
    begin
      --phrase muxes before adds, or you get 2 layers of logic.
      --each addsub is extended by a bit to accommodate carryout and
      --pre-extended by a bit to allow carryin to come via a claused LUT.
      op1 <= ('0'&l_seg&'0') when n_load_d(seg) = '0' else
             ('0'&qsum_seg(ci_seg_width downto 1)&up_d(seg));
      op2 <= (others => '0') when n_load_d(seg) = '0' else
             ('0'&count_by_slv(seg)&carry_in(seg));
      sum_seg <= op1 + op2 when up_d(seg) = '1' else
              op1 - op2;
      
    end generate i_no_tc;
    i_has_tc: if C_RESTRICT_COUNT = 1 generate
      signal op1 : std_logic_vector(ci_seg_width+2-1 downto 0) := (others => '0');
      signal op2 : std_logic_vector(ci_seg_width+2-1 downto 0) := (others => '0');
    begin 
      op1  <= ('0'&l_seg&'0') when n_load_d(seg) = '0' else
              (others => '0') when n_tc_d(seg) = '0' else
              ('0'&qsum_seg(ci_seg_width downto 1)&up_d(seg));
      op2  <= (others => '0') when n_load_d(seg) = '0' else
              (others => '0') when n_tc_d(seg) = '0' else
              ('0'&count_by_slv(seg)&carry_in(seg));
      i_up: if C_COUNT_MODE = 0 generate
      begin
        sum_seg <= op1 + op2;
      end generate i_up;
      i_down: if C_COUNT_MODE = 1 generate
      begin
        sum_seg <= op1 - op2;
      end generate i_down;
    end generate i_has_tc;
    
    --Register the result of the counter splice, so that it can be used in
    --feedback (it is a counter after all).
    i_sum_reg : xbip_pipe_v3_0_3_viv
      generic map(
        C_LATENCY  => 1,
        C_HAS_CE   => 1,
        C_HAS_SCLR => C_HAS_SCLR,
        C_WIDTH    => ci_seg_width+1
        )
      port map(
        CLK  => CLK,
        CE   => CE,
        SCLR => SCLR,
        D    => sum_seg(ci_seg_width+1 downto 1),
        Q    => qsum_seg(ci_seg_width+1 downto 1)
        );
    carry_in(seg+1) <= qsum_seg(ci_seg_width+1);

    ---------------------------------------------------------------------------
    -- Delay the output according to which splice/segment this is. Lower
    -- splices require more delay
    ---------------------------------------------------------------------------
    i_sum_pipe : xbip_pipe_v3_0_3_viv
      generic map(
        C_LATENCY  => ci_num_segs-seg,
        C_HAS_CE   => 1,
        C_HAS_SCLR => C_HAS_SCLR,
        C_WIDTH    => ci_seg_width,
        C_FAST_IP  => 0
        )
      port map(
        CLK  => CLK,
        CE   => CE,
        SCLR => SCLR,
        D    => qsum_seg(ci_seg_width downto 1),
        Q    => q_i(seg)
        );
  end generate i_seg;

  --The output will not, in general, be a nice multiple of the splice width, so
  --the top segment may differ in width, hence the if clause.
  i_out_stage: for seg in 1 to ci_num_segs generate
  begin
    i_top: if seg = ci_num_segs generate
    begin
      Q(C_WIDTH-1 downto (ci_num_segs-1)*ci_seg_width) <= q_i(seg)(C_WIDTH-(ci_num_segs-1)*ci_seg_width-1 downto 0);
    end generate i_top;
    i_not_top: if seg /= ci_num_segs generate
    begin
      Q(seg*ci_seg_width-1 downto (seg-1)*ci_seg_width) <= q_i(seg);
    end generate i_not_top;
  end generate i_out_stage;

  --That's All Folks.

end synth;



-- $Id: xbip_counter_v3_0_3_viv.vhd,v 1.3 2009/09/08 16:46:30 akennedy Exp $
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
--This file is the top level, of the new, pipelined implementation
--of the counter solution. It is simply an if..then..else
--branch point to the two implementation types: fabric and DSP48.
--The choice is made on the basis of C_USE_DSP48. At the higher level
--c_counter_binary_v10_0, this is analogous to C_IMPLEMENTATION.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

library c_gate_bit_v12_0_3;
use c_gate_bit_v12_0_3.c_gate_bit_v12_0_3_viv_comp.all;

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_pkg.all;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_hdl_comps.all;

--core_if on entity xbip_counter_v3_0_3_viv
  entity xbip_counter_v3_0_3_viv is
    GENERIC (
      C_XDEVICEFAMILY     : string  := "virtex2";
      C_VERBOSITY         : integer := 0;
      C_USE_DSP48         : integer := 0;
      C_HAS_CE            : integer := 0;
      C_HAS_SCLR          : integer := 0;
      C_LATENCY           : integer := 1;
      C_FB_LATENCY        : integer := 1;
      C_WIDTH             : integer := 16;
      C_RESTRICT_COUNT    : integer := 0;
      C_COUNT_TO          : string  := "0";
      C_COUNT_BY          : string  := "0";
      C_COUNT_MODE        : integer := 0;          -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE     : string  := "0";
      C_CE_OVERRIDES_SCLR : integer := 0;          -- 0=override;
      C_HAS_THRESH0       : integer := 0;
      C_HAS_LOAD          : integer := 0;
      C_LOAD_LOW          : integer := 0
      );
    PORT (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
--core_if off
end xbip_counter_v3_0_3_viv;



architecture synth of xbip_counter_v3_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant check_generics : integer := fn_xbip_counter_v3_0_3_check_generics(
    p_xdevicefamily     => C_XDEVICEFAMILY,
    p_verbosity         => C_VERBOSITY ,
    p_use_dsp48         => C_USE_DSP48, 
    p_latency           => C_LATENCY,
    p_fb_latency        => C_FB_LATENCY,
    p_width             => C_WIDTH,
    p_restrict_count    => C_RESTRICT_COUNT,
    p_count_to          => C_COUNT_TO ,
    p_count_by          => C_COUNT_BY ,
    p_count_mode        => C_COUNT_MODE ,
    p_thresh0_value     => C_THRESH0_VALUE,
    p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR, 
    p_has_thresh0       => C_HAS_THRESH0,
    p_has_load          => C_HAS_LOAD,
    p_load_low          => C_LOAD_LOW
    );
  constant ci_pipe_all : t_xbip_counter_v3_0_3_latency := fn_xbip_counter_v3_0_3_latency(
    p_xdevicefamily     => C_XDEVICEFAMILY,
    p_verbosity         => C_VERBOSITY ,
    p_use_dsp48         => C_USE_DSP48, 
    p_latency           => C_LATENCY,
    p_fb_latency        => C_FB_LATENCY,
    p_width             => C_WIDTH,
    p_restrict_count    => C_RESTRICT_COUNT,
    p_count_to          => C_COUNT_TO ,
    p_count_by          => C_COUNT_BY ,
    p_count_mode        => C_COUNT_MODE ,
    p_thresh0_value     => C_THRESH0_VALUE,
    p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR, 
    p_has_thresh0       => C_HAS_THRESH0,
    p_has_load          => C_HAS_LOAD,
    p_load_low          => C_LOAD_LOW
    );
  constant ci_pipe : t_xbip_counter_v3_0_3_pipe := ci_pipe_all.pipe;
  signal diag_pipe : t_xbip_counter_v3_0_3_latency := ci_pipe_all;

  constant ci_resources : t_xbip_counter_v3_0_3_resources := fn_xbip_counter_v3_0_3_get_resources(
    p_xdevicefamily     => C_XDEVICEFAMILY,
    p_verbosity         => C_VERBOSITY ,
    p_use_dsp48         => C_USE_DSP48, 
    p_latency           => C_LATENCY,
    p_fb_latency        => C_FB_LATENCY,
    p_width             => C_WIDTH,
    p_restrict_count    => C_RESTRICT_COUNT,
    p_count_to          => C_COUNT_TO ,
    p_count_by          => C_COUNT_BY ,
    p_count_mode        => C_COUNT_MODE ,
    p_thresh0_value     => C_THRESH0_VALUE,
    p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR, 
    p_has_thresh0       => C_HAS_THRESH0,
    p_has_load          => C_HAS_LOAD,
    p_load_low          => C_LOAD_LOW
    );
  constant ci_family : string := c_xdevicefamily_to_c_family(C_XDEVICEFAMILY);
  constant ci_count_by    : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_count_by, c_width);
  constant ci_count_to    : std_logic_vector(c_width - 1 downto 0) := str_to_bound_slv_0(c_count_to, c_width);

  signal diag_resources : t_xbip_counter_v3_0_3_resources := ci_resources;
  
  signal count_by_slv : std_logic_vector(ci_dsp48e1_c_width-1 downto 0) :=
    str_to_bound_slv_0(C_COUNT_BY,ci_dsp48e1_c_width);
  signal n_tc     : std_logic := '1';
  signal load_i   : std_logic := '0';
  signal n_load_i : std_logic := '1';   --Active low!!!
  signal q_i      : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
  signal ce_i     : std_logic := '1';
  signal sclr_i   : std_logic := '0';
begin

  i_ce : if C_HAS_CE = 1 generate
  begin
    ce_i <= CE;
  end generate i_ce;
  i_sclr : if C_HAS_SCLR = 1 generate
  begin
    i_ce_overrides_sclr : if C_CE_OVERRIDES_SCLR = 1 generate
    begin
      sclr_i <= SCLR when ce_i = '1' else '0';
    end generate i_ce_overrides_sclr;
    i_SCLR_overrides_CE : if C_CE_OVERRIDES_SCLR = 0 generate
    begin
      sclr_i <= sclr;
    end generate i_SCLR_overrides_CE;
  end generate i_sclr;
   
 

  -----------------------------------------------------------------------------
  -- Condition inputs
  -----------------------------------------------------------------------------
  i_has_load: if C_HAS_LOAD = 1 generate
  begin
    i_hi_load: if C_LOAD_LOW = 0 generate
    begin
      load_i <= LOAD;
      n_load_i <= not LOAD;
    end generate i_hi_load;
    i_low_load: if C_LOAD_LOW = 1 generate
    begin
      load_i <= not LOAD;
      n_load_i <= LOAD;
    end generate i_low_load;
  end generate i_has_load;
  i_no_load: if C_HAS_LOAD = 0 generate
  begin
    load_i <= '0';
    n_load_i <= '1';
  end generate i_no_load;

  i_fabric : if C_USE_DSP48 = 0 generate
  begin
    i_fab : fabric_counter
      generic map(
        C_XDEVICEFAMILY  => C_XDEVICEFAMILY,
        C_VERBOSITY      => C_VERBOSITY,
        C_HAS_CE         => C_HAS_CE,
        C_HAS_SCLR       => C_HAS_SCLR,
        CI_PIPE_ALL      => ci_pipe_all,
        C_WIDTH          => C_WIDTH,
        C_RESTRICT_COUNT => C_RESTRICT_COUNT,
        C_COUNT_BY       => C_COUNT_BY,
        C_COUNT_MODE     => C_COUNT_MODE,
        C_HAS_LOAD       => C_HAS_LOAD
        )
      port map(
        CLK    => CLK,
        CE     => ce_i,
        SCLR   => sclr_i,
        N_TC   => n_tc,
        UP     => UP,
        N_LOAD => n_load_i,
        L      => L,
        Q      => q_i
        );
  end generate i_fabric;
  
  i_dsp48 : if C_USE_DSP48 = 1 generate
  begin
    i_dsp : dsp48_counter
      generic map(
        C_XDEVICEFAMILY  => C_XDEVICEFAMILY,
        C_VERBOSITY      => C_VERBOSITY,
        C_HAS_CE         => C_HAS_CE,
        C_HAS_SCLR       => C_HAS_SCLR,
        CI_PIPE_ALL      => ci_pipe_all,
        C_WIDTH          => C_WIDTH,
        C_RESTRICT_COUNT => C_RESTRICT_COUNT,
        C_COUNT_BY       => C_COUNT_BY,
        C_COUNT_MODE     => C_COUNT_MODE,
        C_HAS_LOAD       => C_HAS_LOAD
        )
      port map(
        CLK  => CLK,
        CE   => ce_i,
        SCLR => sclr_i,
        N_TC => n_tc,
        UP   => UP,
        LOAD => load_i,
        L    => L,
        Q    => q_i
        );
  end generate i_dsp48;


  -----------------------------------------------------------------------------
  -- Terminal count detection
  -----------------------------------------------------------------------------
  i_terminal_detect : if C_RESTRICT_COUNT = 1 generate

    ---------------------------------------------------------------------------
    -- Code lifted from counter baseblock
    ---------------------------------------------------------------------------
    
    type t_match_array is array (0 to c_width-1) of integer;
    type t_compare_rec is record        -- comparison data
      comp_width : integer;
      comp_bits  : t_match_array;
      comp_vect  : std_logic_vector(c_width-1 downto 0);
    end record;
    type t_count_mode is (count_up, count_down, count_updown);
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
    constant enum_c_count_mode    : t_count_mode   := fn_select_count_mode (c_count_mode);


    ---------------------------------------------------------------------------
    -- code commented out because the optimal detect gives aliases which would
    --trigger before the counter was reset, hence giving multiple resets.
    --However, all is not lost, it may be possible to add anti-aliasing, in
    --which case this code would be the basis of an advanced terminal count detect.
    ---------------------------------------------------------------------------
    
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
--    function fn_optimal_match (
--      p_has_match       : integer;
--      p_width           : integer;
--      p_enum_count_mode : t_count_mode;
--      pi_count_to       : std_logic_vector(c_width-1 downto 0);
--      pi_count_by       : std_logic_vector(c_width-1 downto 0))
--      return t_compare_rec is
--      variable ret_val     : t_compare_rec;
--      variable match_bit   : std_logic := '1';
--      variable term_diff   : std_logic_vector(c_width-1 downto 0);
--      variable fred        : std_logic_vector(c_width-1 downto 0);  --can't think of a
--      --good name for this var. It identified the MS bit where penultimate and
--      --term_count differ over a match bit - hence delineating the match vector.
--      variable penultimate : std_logic_vector(c_width-1 downto 0);
--      variable i           : integer range 0 to 258;
--      variable token_1     : boolean   := false;  --see notes above
--    begin  -- fn_optimal_match
--      if p_has_match = 1 then           --only relevant to restricted counters.
--        if p_enum_count_mode = count_up then
--          penultimate := pi_count_to - pi_count_by;
--          term_diff   := (pi_count_to xor penultimate);
--          match_bit   := '1';
--          fred        := term_diff and pi_count_to;
--        else
--          penultimate := pi_count_to + pi_count_by;
--          term_diff   := (pi_count_to xor penultimate);
--          match_bit   := '0';
--          fred        := term_diff and not(pi_count_to);
--        end if;
--
--        --This is essentially a repeat-until loop
--        i                  := p_width;
--        ret_val.comp_width := 0;
----      fred_string := std_logic_vector_2_string(fred); --diagnostic
----      assert false report fred_string severity note; --diagnostic
--        while i > 0 loop
--          i := i-1;
----        assert false report INTEGER'IMAGE(i) severity note;  --diagnostic
--          if pi_count_to(i) = not(match_bit) then
--            if p_enum_count_mode = count_down and token_1 = false then
--              ret_val.comp_bits(ret_val.comp_width) := i;
--              ret_val.comp_vect(ret_val.comp_width) := '1';
--              ret_val.comp_width                    := ret_val.comp_width + 1;
--              token_1                               := true;
--            end if;
--            next;
--          else
--            ret_val.comp_bits(ret_val.comp_width) := i;
--            ret_val.comp_vect(ret_val.comp_width) := match_bit;
--            ret_val.comp_width                    := ret_val.comp_width + 1;
--            exit when fred(i) = '1' and (p_enum_count_mode = count_up or token_1);  --
--            --make sure down_counter match has at least a single '1' before exiting.
--          end if;
--        end loop;
--      else
--        ret_val.comp_vect(0) := '1';
--        ret_val.comp_bits(0) := 0;
--        ret_val.comp_width   := 0;
--      end if;
--      return ret_val;
--    end fn_optimal_match;

    function fn_get_det_val (
      p_count_by   : std_logic_vector(c_width-1 downto 0);
      p_count_to   : std_logic_vector(c_width-1 downto 0);
      p_count_mode : integer;
      p_latency    : integer;
      p_fb_latency : integer)
      return std_logic_vector is
      variable ret_val : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
      variable v_latency : integer;
    begin  -- fn_get_det_val
      v_latency := p_fb_latency + p_latency;
      ret_val := p_count_to;
      for i in 1 to v_latency-1 loop
        if p_count_mode = 0 then
          ret_val := ret_val - p_count_by;
        else
          ret_val := ret_val + p_count_by;
        end if;
      end loop;  -- i
      return ret_val;
    end fn_get_det_val;
    
    constant ci_fb_latency : t_xbip_counter_v3_0_3_fb_latency := fn_xbip_counter_v3_0_3_get_fb_latency(
      p_width             => C_WIDTH,
      p_xdevicefamily     => C_XDEVICEFAMILY,
      p_fb_latency        => C_FB_LATENCY,
      p_verbosity         => C_VERBOSITY,
      p_use_dsp48         => C_USE_DSP48,
      p_latency           => C_LATENCY,
      p_restrict_count    => C_RESTRICT_COUNT,
      p_count_to          => C_COUNT_TO,
      p_count_by          => C_COUNT_BY,
      p_count_mode        => C_COUNT_MODE,
      p_thresh0_value     => C_THRESH0_VALUE,
      p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR,
      p_has_thresh0       => C_HAS_THRESH0,
      p_has_load          => C_HAS_LOAD,
      p_load_low          => C_LOAD_LOW 
      );
    signal diag_fb_latency : t_xbip_counter_v3_0_3_fb_latency := ci_fb_latency;
    constant ci_det_val : std_logic_vector(c_width-1 downto 0) := fn_get_det_val(
      p_count_by   => ci_count_by,
      p_count_to   => ci_count_to,
      p_count_mode => c_count_mode,
      p_latency    => ci_pipe_all.used,
      p_fb_latency => ci_fb_latency.used
      );
    signal diag_det_val : std_logic_vector(c_width-1 downto 0) := ci_det_val;
    constant ci_str_det_val_int : std_logic_vector(c_width-1 downto 0) := NOT( ci_det_val);
    constant ci_str_det_val : string := slv_to_str(ci_str_det_val_int);   
--    verific errors out with "initial value for constant is not constant" on
--    code below
--    constant ci_str_det_val : string := slv_to_str(NOT(ci_det_val));
    
--    constant c_compare_rec : t_compare_rec := fn_optimal_match(
--      p_has_match       => c_restrict_count,
--      p_width           => c_width,
--      p_enum_count_mode => enum_c_count_mode,
--      pi_count_to       => ci_det_val,
--      pi_count_by       => ci_count_by
--      );
--    signal diag_compare_rec : t_compare_rec := c_compare_rec;  -- diagnostic
    signal tc_match_bits : std_logic_vector(c_width-1 downto 0);
    signal n_tco : std_logic := '0';    --NOT Terminal count combinatorial out
    signal n_tcq : std_logic := '0';    --NOT Terminal count registered out
    signal gate_op : std_logic := '0';
  begin

    --Terminal count is active low to suit DSP48 opmodes and the carry-chain
    --logic. Hence the detection string has all it's 0's inverted and an NAND applied.
    --Only when the detection value is input will the NAND give a 0 out.
    i_gate : c_gate_bit_v12_0_3_viv
      generic map (
        c_gate_type      => 1,          --NAND
        c_inputs         => c_width,
        c_input_inv_mask => ci_str_det_val,
        c_pipe_stages    => ci_fb_latency.gate_pipes,
        c_ainit_val      => "0",
        c_sinit_val      => "0",
        c_sync_priority  => 1,
        c_sync_enable    => C_CE_OVERRIDES_SCLR,
        c_has_o          => 1-ci_fb_latency.gate_op,
        c_has_q          => ci_fb_latency.gate_op,
        c_has_ce         => c_has_ce,
        c_has_sset       => c_has_sclr * ci_fb_latency.gate_op,  --i.e. disable if async
        c_family         => ci_family
        )
      port map (
        i    => q_i,
        clk  => clk,
        ce   => ce_i,
        sset => sclr_i,
        o    => n_tco,
        q    => n_tcq
        );

    i_gate_op_mux1 : if C_FB_LATENCY = 0 generate
    begin
      gate_op <= n_tco;
    end generate i_gate_op_mux1;
    i_gate_op_mux2 : if C_FB_LATENCY /= 0 generate
    begin
      gate_op <= n_tcq;
    end generate i_gate_op_mux2;
    i_del_fb : xbip_pipe_v3_0_3_viv
      generic map(
        C_LATENCY  => ci_fb_latency.gate_excess,
        C_HAS_CE   => 1,
        C_HAS_SSET => C_HAS_SCLR,
        C_WIDTH    => 1
        )
      port map(
        CLK  => CLK,
        CE   => ce_i,
        SSET => sclr_i,
        D(0) => gate_op,
        Q(0) => n_tc
        );
  end generate i_terminal_detect;

  i_thresh_detect : if C_HAS_THRESH0 = 1 generate
    constant ci_thresh_latency : t_xbip_counter_v3_0_3_thresh_latency := fn_xbip_counter_v3_0_3_get_thresh_latency(
      p_width             => C_WIDTH,
      p_xdevicefamily     => C_XDEVICEFAMILY,
      p_fb_latency        => C_FB_LATENCY,
      p_verbosity         => C_VERBOSITY,
      p_use_dsp48         => C_USE_DSP48,
      p_latency           => C_LATENCY,
      p_restrict_count    => C_RESTRICT_COUNT,
      p_count_to          => C_COUNT_TO,
      p_count_by          => C_COUNT_BY,
      p_count_mode        => C_COUNT_MODE,
      p_thresh0_value     => C_THRESH0_VALUE,
      p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR,
      p_has_thresh0       => C_HAS_THRESH0,
      p_has_load          => C_HAS_LOAD,
      p_load_low          => C_LOAD_LOW 
      );
    constant ci_thresh0_val    : std_logic_vector(c_width-1 downto 0) := str_to_bound_slv_0(C_THRESH0_VALUE, c_width);
    signal diag_thresh0_val : std_logic_vector(c_width-1 downto 0)  := ci_thresh0_val;
    function fn_get_thresh_val (
      p_count_by       : std_logic_vector(c_width-1 downto 0);
      p_thresh0_val    : std_logic_vector(c_width-1 downto 0);
      p_count_mode     : integer;
      p_thresh_latency : integer)
      return std_logic_vector is
      variable ret_val : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
    begin  -- fn_get_det_val
      ret_val := p_thresh0_val;
      for i in 1 to p_thresh_latency loop
        if p_count_mode = 0 then
          ret_val := ret_val - p_count_by;
        else
          ret_val := ret_val + p_count_by;
        end if;
      end loop;  -- i
      return ret_val;
    end fn_get_thresh_val;
    
    constant ci_thresh_det_val : std_logic_vector(c_width-1 downto 0) := fn_get_thresh_val(
      p_count_by       => ci_count_by,
      p_thresh0_val    => ci_thresh0_val,
      p_count_mode     => c_count_mode,
      p_thresh_latency => ci_thresh_latency.gate_op + ci_thresh_latency.gate_pipes
      );
    signal diag_thresh_det_val : std_logic_vector(c_width-1 downto 0) := ci_thresh_det_val;
    constant ci_str_thresh_val : string := slv_to_str(ci_thresh_det_val);
    signal thresh_o : std_logic := '0';
    signal thresh_q : std_logic := '0';
  begin
    i_norm: if C_WIDTH > 1 generate
      i_gate : c_gate_bit_v12_0_3_viv
        generic map (
          c_gate_type      => 3,        --NOR
          c_inputs         => c_width,
          c_input_inv_mask => ci_str_thresh_val,
          c_pipe_stages    => ci_thresh_latency.gate_pipes,
          c_ainit_val      => "0",
          c_sinit_val      => "0",
          c_sync_priority  => 1,
          c_sync_enable    => C_CE_OVERRIDES_SCLR,
          c_has_o          => 1-ci_thresh_latency.gate_op,
          c_has_q          => ci_thresh_latency.gate_op,
          c_has_ce         => c_has_ce,
          c_has_sclr       => c_has_sclr * ci_thresh_latency.gate_op,
          c_family         => ci_family
          )
        port map (
          i    => q_i,
          clk  => clk,
          ce   => ce_i,
          sclr => sclr,
          o    => thresh_o,
          q    => thresh_q
          );
      i_thresh_op_mux1 : if ci_thresh_latency.gate_op = 0 generate
      begin
        THRESH0 <= thresh_o;
      end generate i_thresh_op_mux1;
      i_thresh_op_mux2 : if ci_thresh_latency.gate_op /= 0 generate
      begin
        THRESH0 <= thresh_q;
      end generate i_thresh_op_mux2;
    end generate i_norm;

    i_tiny: if C_WIDTH = 1 generate
    begin
      thresh_o <= '1' when q_i = ci_thresh_det_val else '0';
      i_thresh_pipe : xbip_pipe_v3_0_3_viv
      generic map(
        C_LATENCY  => ci_thresh_latency.gate_pipes+ci_thresh_latency.gate_op,
        C_HAS_CE   => 1,
        C_HAS_SSET => C_HAS_SCLR,
        C_WIDTH    => 1
        )
      port map(
        CLK  => CLK,
        CE   => ce_i,
        SSET => sclr_i,
        D(0) => thresh_o,
        Q(0) => thresh_q
        );
      THRESH0 <= thresh_q;
      
    end generate i_tiny;
  end generate i_thresh_detect;
  
  Q <= q_i;
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

library xbip_counter_v3_0_3;
use xbip_counter_v3_0_3.xbip_counter_v3_0_3_viv_comp.all;

entity xbip_counter_v3_0_3 is
  generic (
      C_XDEVICEFAMILY     : string  := "virtex2";
      C_VERBOSITY         : integer := 0;
      C_USE_DSP48         : integer := 0;
      C_HAS_CE            : integer := 0;
      C_HAS_SCLR          : integer := 0;
      C_LATENCY           : integer := 1;
      C_FB_LATENCY        : integer := 1;
      C_WIDTH             : integer := 16;
      C_RESTRICT_COUNT    : integer := 0;
      C_COUNT_TO          : string  := "0";
      C_COUNT_BY          : string  := "0";
      C_COUNT_MODE        : integer := 0;          -- 0=up, 1=down, 2=updown
      C_THRESH0_VALUE     : string  := "0";
      C_CE_OVERRIDES_SCLR : integer := 0;          -- 0=override;
      C_HAS_THRESH0       : integer := 0;
      C_HAS_LOAD          : integer := 0;
      C_LOAD_LOW          : integer := 0
      );
  port (
      CLK     : in  std_logic                            := '0';              -- optional clock
      CE      : in  std_logic                            := '1';              -- optional clock enable
      SCLR    : in  std_logic                            := '0';              -- synch init.
      UP      : in  std_logic                            := '1';              -- controls direction of count - '1' = up.
      LOAD    : in  std_logic                            := '0';              -- optional synch load trigger
      L       : in  std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');  -- optional synch load value
      THRESH0 : out std_logic                            := '1';
      Q       : out std_logic_vector(C_WIDTH-1 downto 0)                      -- output value
      );
--core_if off
end entity xbip_counter_v3_0_3;

architecture xilinx of xbip_counter_v3_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  i_synth : xbip_counter_v3_0_3_viv
  generic map (
    C_XDEVICEFAMILY => C_XDEVICEFAMILY,
    C_VERBOSITY => C_VERBOSITY,
    C_USE_DSP48 => C_USE_DSP48,
    C_HAS_CE => C_HAS_CE,
    C_HAS_SCLR => C_HAS_SCLR,
    C_LATENCY => C_LATENCY,
    C_FB_LATENCY => C_FB_LATENCY,
    C_WIDTH => C_WIDTH,
    C_RESTRICT_COUNT => C_RESTRICT_COUNT,
    C_COUNT_TO => C_COUNT_TO,
    C_COUNT_BY => C_COUNT_BY,
    C_COUNT_MODE => C_COUNT_MODE,
    C_THRESH0_VALUE => C_THRESH0_VALUE,
    C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
    C_HAS_THRESH0 => C_HAS_THRESH0,
    C_HAS_LOAD => C_HAS_LOAD,
    C_LOAD_LOW => C_LOAD_LOW
  )
  port map (
    CLK => CLK,
    CE => CE,
    SCLR => SCLR,
    UP => UP,
    LOAD => LOAD,
    L => L,
    THRESH0 => THRESH0,
    Q => Q
  );
  
end architecture xilinx;




