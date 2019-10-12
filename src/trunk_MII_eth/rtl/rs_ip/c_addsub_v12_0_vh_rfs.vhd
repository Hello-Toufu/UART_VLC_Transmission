-- $RCSfile: c_addsub_v12_0_10_comp.vhd,v $ $Revision: 1.5 $ $Date: 2010/03/19 10:44:17 $
-------------------------------------------------------------------------------
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
library ieee;
use ieee.std_logic_1164.all;


package c_addsub_v12_0_10_comp is

-- core_if on component c_addsub_v12_0_10
  component c_addsub_v12_0_10
    GENERIC (
      C_VERBOSITY           : integer := 0;
      C_XDEVICEFAMILY       : string  := "no_family";
      C_IMPLEMENTATION      : integer := 0;
      C_A_WIDTH             : integer := 15;
      C_B_WIDTH             : integer := 15;
      C_OUT_WIDTH           : integer := 16;
      C_CE_OVERRIDES_SCLR   : integer := 0;            -- replaces c_sync_enable
      C_A_TYPE              : integer := 0;
      C_B_TYPE              : integer := 0;
      C_LATENCY             : integer := 1;
      C_ADD_MODE            : integer := 0;
      C_B_CONSTANT          : integer := 0;
      C_B_VALUE             : string  := "";
      C_AINIT_VAL           : string  := "";
      C_SINIT_VAL           : string  := "";
      C_CE_OVERRIDES_BYPASS : integer := 0;            -- replaces c_bypass_enable
      C_BYPASS_LOW          : integer := 0;
      C_SCLR_OVERRIDES_SSET : integer := 0;            -- replaces c_sync_priority
      C_HAS_C_IN            : integer := 0;
      C_HAS_C_OUT           : integer := 0;            -- may be registered in step with c_latency
      C_BORROW_LOW          : integer := 1;            -- only applies to implementation = 1
 --     C_HAS_OVFL            : integer := 0;            -- may be registered in step with c_latency
      C_HAS_CE              : integer := 0;
      C_HAS_BYPASS          : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0
      );
    PORT (
      A      : in  std_logic_vector(C_A_WIDTH-1 downto 0)     := (others => '0');
      B      : in  std_logic_vector(C_B_WIDTH-1 downto 0)     := (others => '0');
      CLK    : in  std_logic                                  := '0';
      ADD    : in  std_logic                                  := '0';
      C_IN   : in  std_logic                                  := '0';
      CE     : in  std_logic                                  := '1';
      BYPASS : in  std_logic                                  := '0';
      SCLR   : in  std_logic                                  := '0';
      SSET   : in  std_logic                                  := '0';
      SINIT  : in  std_logic                                  := '0';
--      OVFL   : out std_logic                                  := '0';
      C_OUT  : out std_logic                                  := '0';
      S      : out std_logic_vector(C_OUT_WIDTH - 1 downto 0) := (others => '0')
      );
    --core_if off
  end component;


end c_addsub_v12_0_10_comp;


-- $RCSfile: c_addsub_v12_0_10_viv_comp.vhd,v $ $Revision: 1.5 $ $Date: 2010/03/19 10:44:17 $
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package c_addsub_v12_0_10_viv_comp is

----------------------------------------------------------
-- Insert component declaration of top level xst file here
----------------------------------------------------------
  --core_if on component c_addsub_v12_0_10_viv
  component c_addsub_v12_0_10_viv
    GENERIC (
      C_VERBOSITY           : integer := 0;
      C_XDEVICEFAMILY       : string  := "no_family";
      C_IMPLEMENTATION      : integer := 0;
      C_A_WIDTH             : integer := 15;
      C_B_WIDTH             : integer := 15;
      C_OUT_WIDTH           : integer := 16;
      C_CE_OVERRIDES_SCLR   : integer := 0;            -- replaces c_sync_enable
      C_A_TYPE              : integer := 0;
      C_B_TYPE              : integer := 0;
      C_LATENCY             : integer := 1;
      C_ADD_MODE            : integer := 0;
      C_B_CONSTANT          : integer := 0;
      C_B_VALUE             : string  := "";
      C_AINIT_VAL           : string  := "";
      C_SINIT_VAL           : string  := "";
      C_CE_OVERRIDES_BYPASS : integer := 0;            -- replaces c_bypass_enable
      C_BYPASS_LOW          : integer := 0;
      C_SCLR_OVERRIDES_SSET : integer := 0;            -- replaces c_sync_priority
      C_HAS_C_IN            : integer := 0;
      C_HAS_C_OUT           : integer := 0;            -- may be registered in step with c_latency
      C_BORROW_LOW          : integer := 1;            -- only applies to implementation = 1
--      C_HAS_OVFL            : integer := 0;            -- may be registered in step with c_latency
      C_HAS_CE              : integer := 0;
      C_HAS_BYPASS          : integer := 0;
      C_HAS_SCLR            : integer := 0;
      C_HAS_SSET            : integer := 0;
      C_HAS_SINIT           : integer := 0
      );
    PORT (
      A      : in  std_logic_vector(C_A_WIDTH-1 downto 0)     := (others => '0');
      B      : in  std_logic_vector(C_B_WIDTH-1 downto 0)     := (others => '0');
      CLK    : in  std_logic                                  := '0';
      ADD    : in  std_logic                                  := '0';
      C_IN   : in  std_logic                                  := '0';
      CE     : in  std_logic                                  := '1';
      BYPASS : in  std_logic                                  := '0';
      SCLR   : in  std_logic                                  := '0';
      SSET   : in  std_logic                                  := '0';
      SINIT  : in  std_logic                                  := '0';
--      OVFL   : out std_logic                                  := '0';
      C_OUT  : out std_logic                                  := '0';
      S      : out std_logic_vector(C_OUT_WIDTH - 1 downto 0) := (others => '0')
      );
    --core_if off
  end component;

end c_addsub_v12_0_10_viv_comp;



---------------------------------------------------------------------------
-- $Id: c_addsub_v12_0_10_pkg.vhd,v 1.5 2010/03/19 10:44:16 julian Exp $
---------------------------------------------------------------------------
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
--
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;


package c_addsub_v12_0_10_pkg is


  constant c_addsub_v12_0_10_max_pipe_stages : integer := 258;
  type t_addsub_v12_0_pipe is array (0 to c_addsub_v12_0_10_max_pipe_stages) of integer;
  type t_c_addsub_v12_0_10_latency is record
    used : integer;
    pipe : t_addsub_v12_0_pipe;
  end record;


  constant ci_vx4_cc_limit     : integer := 12;
  constant ci_vx5_cc_limit     : integer := 20;
  constant ci_sp3adsp_cc_limit : integer := 8;
  constant ci_other_cc_limit   : integer := 10;

  function fn_c_addsub_v12_0_10_latency(
    C_VERBOSITY           : integer;
    C_XDEVICEFAMILY       : string;
    C_IMPLEMENTATION      : integer;
    C_A_WIDTH             : integer;
    C_B_WIDTH             : integer;
    C_OUT_WIDTH           : integer;
    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
    C_B_TYPE              : integer;
    C_LATENCY             : integer;
    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
    C_B_CONSTANT          : integer;
    C_B_VALUE             : string;
    C_AINIT_VAL           : string;
    C_SINIT_VAL           : string;
    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer;
    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer;
    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
--    c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
    C_HAS_CE              : integer;
    C_HAS_BYPASS          : integer;
    C_HAS_SCLR            : integer;
    C_HAS_SSET            : integer;
    C_HAS_SINIT           : integer
    ) return t_c_addsub_v12_0_10_latency;

  type t_c_addsub_v12_0_10_resources is record
    dsp48    : integer;
    bram18k  : integer;
    luts     : integer;
    ffs      : integer;
  end record;

  function fn_c_addsub_v12_0_10_resources(
    C_VERBOSITY           : integer;
    C_XDEVICEFAMILY       : string;
    C_IMPLEMENTATION      : integer;
    C_A_WIDTH             : integer;
    C_B_WIDTH             : integer;
    C_OUT_WIDTH           : integer;
    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
    C_B_TYPE              : integer;
    C_LATENCY             : integer;
    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
    C_B_CONSTANT          : integer;
    C_B_VALUE             : string;
    C_AINIT_VAL           : string;
    C_SINIT_VAL           : string;
    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer;
    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer;
    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
--     c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
    C_HAS_CE              : integer;
    C_HAS_BYPASS          : integer;
    C_HAS_SCLR            : integer;
    C_HAS_SSET            : integer;
    C_HAS_SINIT           : integer
    ) return t_c_addsub_v12_0_10_resources;

  function fn_c_addsub_v12_0_10_check_generics(
    C_VERBOSITY           : integer;
    C_XDEVICEFAMILY       : string;
    C_IMPLEMENTATION      : integer;
    C_A_WIDTH             : integer;
    C_B_WIDTH             : integer;
    C_OUT_WIDTH           : integer;
    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
    C_B_TYPE              : integer;
    C_LATENCY             : integer;
    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
    C_B_CONSTANT          : integer;
    C_B_VALUE             : string;
    C_AINIT_VAL           : string;
    C_SINIT_VAL           : string;
    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer;
  C_BORROW_LOW          : integer;
    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer;
    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
    --c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
    C_HAS_CE              : integer;
    C_HAS_BYPASS          : integer;
    C_HAS_SCLR            : integer;
    C_HAS_SSET            : integer;
    C_HAS_SINIT           : integer
    ) return integer;


  function fn_borrow_ports(
    has_port : integer;
    add_mode : integer;
    a_type : integer;
  b_type  : integer
    ) return integer;

  function fn_carry_ports(
    has_port : integer;
    add_mode : integer;
    a_type : integer;
  b_type  : integer
    ) return integer;

  function fn_add_port(
    add_mode : integer
    ) return integer;

  function fn_max(
    p_left  :integer;
  p_right : integer
    ) return integer;

  function fn_get_natural_width(
  c_a_type  : integer;
  c_b_type  : integer;
  c_add_mode  : integer;
  c_a_width  : integer;
  c_b_width: integer
  ) return integer;

--add components for legacy code from v9.1 baseblocks to c_addsub_v12_0_10_pkg_legacy
--which contains other functions for addsub that are needed for fabric implementation
--but keep top level c_addsub_v12_0_10_legacy here => .no move that too


--    component c_addsub_v12_0_10_legacy
--      generic (
--      c_family              : STRING ;
--      c_a_width             : INTEGER;
--      c_b_width             : INTEGER;
--      c_out_width           : INTEGER;
--      c_low_bit             : INTEGER;
--  -- c_high_bit should not be used anymore; the only uses here are in the interface (declaring
--  -- port sizes) and in the check_generics function (ensuring c_high_bit + 1 = c_out_width)
--      c_high_bit            : INTEGER;
--      c_add_mode            : INTEGER;
--      c_a_type              : INTEGER;
--      c_b_type              : INTEGER;
--      c_b_constant          : INTEGER;
--      c_b_value             : STRING ;
--      c_ainit_val           : STRING ;
--      c_sinit_val           : STRING ;
--      c_bypass_enable       : INTEGER;
--      c_bypass_low          : INTEGER;
--      c_sync_enable         : INTEGER;
--      c_sync_priority       : INTEGER;
--      c_pipe_stages         : INTEGER;
--      c_latency             : INTEGER;
--      c_has_s               : INTEGER;
--      c_has_q               : INTEGER;
--      c_has_c_in            : INTEGER;
--      c_has_c_out           : INTEGER;
--      c_has_q_c_out         : INTEGER;
--      c_has_b_in            : INTEGER;
--      c_has_b_out           : INTEGER;
--      c_has_q_b_out         : INTEGER;
--      c_has_ovfl            : INTEGER;
--      c_has_q_ovfl          : INTEGER;
--      c_has_ce              : INTEGER;
--      c_has_add             : INTEGER;
--      c_has_bypass          : INTEGER;
--      c_has_a_signed        : INTEGER;
--      c_has_b_signed        : INTEGER;
--      c_has_aclr            : INTEGER;
--      c_has_aset            : INTEGER;
--      c_has_ainit           : INTEGER;
--      c_has_sclr            : INTEGER;
--      c_has_sset            : INTEGER;
--      c_has_sinit           : INTEGER;
--      c_enable_rlocs        : INTEGER;
--      c_has_bypass_with_cin : INTEGER
--      );

--    PORT (
--      a        : IN  STD_LOGIC_VECTOR(c_a_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
--      b        : IN  STD_LOGIC_VECTOR(c_b_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
--      clk      : IN  STD_LOGIC                              := '0';  -- clock
--      add      : IN  STD_LOGIC                              := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
--      c_in     : IN  STD_LOGIC                              := '0';  -- carry in
--      b_in     : IN  STD_LOGIC                              := '1';  -- borrow in
--      ce       : IN  STD_LOGIC                              := '1';  -- clock enable
--      bypass   : IN  STD_LOGIC                              := '0';  -- sync load of b into reg
--      aclr     : IN  STD_LOGIC                              := '0';  -- asynch init.
--      aset     : IN  STD_LOGIC                              := '0';  -- asynch set.
--      ainit    : IN  STD_LOGIC                              := '0';  -- asynch init.
--      sclr     : IN  STD_LOGIC                              := '0';  -- synch init.
--      sset     : IN  STD_LOGIC                              := '0';  -- synch set.
--      sinit    : IN  STD_LOGIC                              := '0';  -- synch init.
--      a_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
--      b_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
--      ovfl     : OUT STD_LOGIC;
--      c_out    : OUT STD_LOGIC;
--      b_out    : OUT STD_LOGIC;           -- borrow out
--      q_ovfl   : OUT STD_LOGIC;
--      q_c_out  : OUT STD_LOGIC;
--      q_b_out  : OUT STD_LOGIC;
--      s        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0);  -- asynch output value
--      q        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0)  -- synch output value
--      );
--     end component;


--  --Fabric shares the same i/f as base and lut with one exception: operand widths
--   --the reason for this is that the rtl + operator does not give bit growth, so
--   --creating a carry out from rtl requires input growth. To allow the old code
--   --to remain static, a_internal and b_internal are one bit bigger, except when
--   --passed to base.
--   component c_addsub_v12_0_10_fabric_legacy
--     generic (
--       c_family        : string  := "virtex2";
--       c_width         : integer := 8;
--       c_add_mode      : integer := 0;
--       c_b_constant    : integer := 0;
--       ci_b_value      : std_logic_vector;
--       c_ainit_val     : string  := "0";
--       c_sinit_val     : string  := "0";
--       c_bypass_enable : integer := c_no_override;
--       c_bypass_low    : integer := 0;
--       c_sync_enable   : integer := c_override;
--       c_sync_priority : integer := c_clear;
--       c_has_s         : integer := 0;
--       c_has_q         : integer := 1;
--       c_has_c_in      : integer := 0;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
--       c_has_c_out     : integer := 0;
--       c_has_q_c_out   : integer := 0;
--       c_has_ovfl      : integer := 0;
--       c_has_q_ovfl    : integer := 0;
--       c_has_ce        : integer := 0;
--       c_has_bypass    : integer := 0;
--       c_has_aclr      : integer := 0;
--       c_has_aset      : integer := 0;
--       c_has_ainit     : integer := 0;
--       c_has_sclr      : integer := 0;
--       c_has_sset      : integer := 0;
--       c_has_sinit     : integer := 0
--       );
--     port (
--       a       : in  std_logic_vector(c_width-1 downto 0);   -- input value
--       b       : in  std_logic_vector(c_width-1 downto 0);   -- input value
--       clk     : in  std_logic := '0';  -- clock
--       add     : in  std_logic := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
--       c_in    : in  std_logic := '0';  -- carry in
--       ce      : in  std_logic := '1';  -- clock enable
--       bypass  : in  std_logic := '0';  -- sync load of b into reg
--       aclr    : in  std_logic := '0';  -- asynch init.
--       aset    : in  std_logic := '0';  -- asynch set.
--       ainit   : in  std_logic := '0';  -- asynch init.
--       sclr    : in  std_logic := '0';  -- synch init.
--       sset    : in  std_logic := '0';  -- synch set.
--       sinit   : in  std_logic := '0';  -- synch init.
--       ovfl    : out std_logic;
--       c_out   : out std_logic;
--       q_ovfl  : out std_logic;
--       q_c_out : out std_logic;
--       s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
--       q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
--       );
--   end component;


--   component c_addsub_v12_0_10_base_legacy
--     generic (
--       c_width         : integer;
--       c_add_mode      : integer;
--       c_b_constant    : integer;
--       ci_b_value      : std_logic_vector;
--       c_ainit_val     : string  := "";
--       c_sinit_val     : string  := "";
--       c_bypass_enable : integer := c_no_override;
--       c_bypass_low    : integer;
--       c_sync_enable   : integer := c_override;
--       c_sync_priority : integer := c_clear;
--       c_has_s         : integer := 0;
--       c_has_q         : integer := 1;
--       c_has_c_in      : integer := 0;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
--       c_has_c_out     : integer := 0;
--       c_has_q_c_out   : integer := 0;
--       c_has_ovfl      : integer := 0;
--       c_has_q_ovfl    : integer := 0;
--       c_has_ce        : integer := 0;
--       c_has_bypass    : integer := 0;
--       c_has_aclr      : integer := 0;
--       c_has_aset      : integer := 0;
--       c_has_ainit     : integer := 0;
--       c_has_sclr      : integer := 0;
--       c_has_sset      : integer := 0;
--       c_has_sinit     : integer := 0
--       );
--     port (
--       a       : in  std_logic_vector(c_width-1 downto 0);   -- input value
--       b       : in  std_logic_vector(c_width-1 downto 0);   -- input value
--       clk     : in  std_logic := '0';  -- clock
--       add     : in  std_logic := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
--       c_in    : in  std_logic := '0';  -- carry in
--       ce      : in  std_logic := '1';  -- clock enable
--       bypass  : in  std_logic := '0';  -- sync load of b into reg
--       aclr    : in  std_logic := '0';  -- asynch init.
--       aset    : in  std_logic := '0';  -- asynch set.
--       ainit   : in  std_logic := '0';  -- asynch init.
--       sclr    : in  std_logic := '0';  -- synch init.
--       sset    : in  std_logic := '0';  -- synch set.
--       sinit   : in  std_logic := '0';  -- synch init.
--       ovfl    : out std_logic;
--       c_out   : out std_logic;
--       q_ovfl  : out std_logic;
--       q_c_out : out std_logic;
--       s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
--       q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
--       );
--   end component;



--   component c_addsub_v12_0_10_lut6_legacy
--     generic (
--       c_width         : integer := 8;
--       c_add_mode      : integer := 0;
--       c_b_constant    : integer := 0;
--       ci_b_value      : std_logic_vector;
--       c_ainit_val     : string  := "0";
--       c_sinit_val     : string  := "0";
--       c_bypass_enable : integer := c_no_override;
--       c_bypass_low    : integer := 0;
--       c_sync_enable   : integer := c_override;
--       c_sync_priority : integer := c_clear;
--       c_has_s         : integer := 0;
--       c_has_q         : integer := 1;
--       c_has_c_in      : integer := 0;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
--       c_has_c_out     : integer := 0;
--       c_has_q_c_out   : integer := 0;
--       c_has_ovfl      : integer := 0;
--       c_has_q_ovfl    : integer := 0;
--       c_has_ce        : integer := 0;
--       c_has_bypass    : integer := 0;
--       c_has_aclr      : integer := 0;
--       c_has_aset      : integer := 0;
--       c_has_ainit     : integer := 0;
--       c_has_sclr      : integer := 0;
--       c_has_sset      : integer := 0;
--       c_has_sinit     : integer := 0
--       );
--     port (
--       a       : in  std_logic_vector(c_width-1 downto 0);   -- input value
--       b       : in  std_logic_vector(c_width-1 downto 0);   -- input value
--       clk     : in  std_logic := '0';  -- clock
--       add     : in  std_logic := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
--       c_in    : in  std_logic := '0';  -- carry in
--       ce      : in  std_logic := '1';  -- clock enable
--       bypass  : in  std_logic := '0';  -- sync load of b into reg
--       aclr    : in  std_logic := '0';  -- asynch init.
--       aset    : in  std_logic := '0';  -- asynch set.
--       ainit   : in  std_logic := '0';  -- asynch init.
--       sclr    : in  std_logic := '0';  -- synch init.
--       sset    : in  std_logic := '0';  -- synch set.
--       sinit   : in  std_logic := '0';  -- synch init.
--       ovfl    : out std_logic;
--       c_out   : out std_logic;
--       q_ovfl  : out std_logic;
--       q_c_out : out std_logic;
--       s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
--       q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
--       );
--   end component;

end package c_addsub_v12_0_10_pkg;

package body c_addsub_v12_0_10_pkg is

  function fn_c_addsub_v12_0_10_latency(
   C_VERBOSITY           : integer;
    C_XDEVICEFAMILY       : string;
    C_IMPLEMENTATION      : integer;
    C_A_WIDTH             : integer;
    C_B_WIDTH             : integer;
    C_OUT_WIDTH           : integer;
    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
    C_B_TYPE              : integer;
    C_LATENCY             : integer;
    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
    C_B_CONSTANT          : integer;
    C_B_VALUE             : string;
    C_AINIT_VAL           : string;
    C_SINIT_VAL           : string;
    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer;
    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer;
    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
    -- c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
    C_HAS_CE              : integer;
    C_HAS_BYPASS          : integer;
    C_HAS_SCLR            : integer;
    C_HAS_SSET            : integer;
    C_HAS_SINIT           : integer
    ) return t_c_addsub_v12_0_10_latency is

    variable ret_val : t_c_addsub_v12_0_10_latency;
    variable v_latency_left : integer;
    variable v_lat_req : integer;
  begin

    v_latency_left := c_latency;
    ret_val.used := 0;
      for i in 0 to c_addsub_v12_0_10_max_pipe_stages loop
        ret_val.pipe(i) := 0;
      end loop;  -- i
    if c_implementation = 0 then
      --fabric
      if c_latency = -1 then
        if supports_dsp48(c_xdevicefamily)>0 then
          v_lat_req := (c_out_width-1)/ci_vx4_cc_limit + 1;
        elsif supports_dsp48e(c_xdevicefamily)>0 then
          v_lat_req := (c_out_width-1)/ci_vx5_cc_limit + 1;
        elsif supports_dsp48a(c_xdevicefamily)>0 then
          v_lat_req := (c_out_width-1)/ci_sp3adsp_cc_limit + 1;
        else
          v_lat_req := (c_out_width-1)/ci_other_cc_limit + 1;
        end if;
      else
        v_lat_req := c_latency;
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
      if v_latency_left > 0  then
        assert false
          report "ERROR: c_addsub_v12_0_10: Excessive latency for DSP48-based case."
          severity error;
      end if;

    end if;
    return ret_val;
  end function fn_c_addsub_v12_0_10_latency;

  --Add when have xbip_addsub_v3_0_3_latency....
--  function fn_c_addsub_v12_0_10_latency(
--    C_VERBOSITY           : integer;
--    C_XDEVICEFAMILY       : string;
--    C_IMPLEMENTATION      : integer;
--    C_A_WIDTH             : integer;
--    C_B_WIDTH             : integer;
--    C_OUT_WIDTH           : integer;
--    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
--    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
--    C_B_TYPE              : integer;
--    C_LATENCY             : integer;
--    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
--    C_B_CONSTANT          : integer;
--    C_B_VALUE             : string;
--    C_AINIT_VAL           : string;
--    C_SINIT_VAL           : string;
--    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
--    C_BYPASS_LOW          : integer;
--    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
--    C_HAS_C_IN            : integer;
--    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
--     c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
--    C_HAS_CE              : integer;
--    C_HAS_BYPASS          : integer;
--    C_HAS_SCLR            : integer;
--    C_HAS_SSET            : integer;
--    C_HAS_SINIT           : integer
--    ) return t_c_addsub_v12_0_10_latency is
--    variable ret_val : t_c_addsub_v12_0_10_latency;
--    variable xbip_addsub_lat : t_xbip_addsub_v3_0_3_latency;  --not added to xbip at this time
--  begin
--    if C_LATENCY = -1 then
--      xbip_addsub_lat := fn_xbip_addsub_v3_0_3_latency(
--        p_xdevicefamily  => C_XDEVICEFAMILY,
--        p_implementation => C_IMPLEMENTATION,
--        p_verbosity => C_VERBOSITY,
--        p_latency => C_LATENCY,
--        p_bypass_low => C_BYPASS_LOW,
--    p_a_width => C_A_WIDTH,
--    p_b_width => C_B_WIDTH,
--        p_out_width => C_OUT_WIDTH,
--        p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR,
--        p_A_type => C_A_TYPE,
--    p_B_type => C_B_TYPE
--       );
--      ret_val.used := xbip_accum_lat.used;
--    else
--      ret_val.used := c_latency;
--    end if;
--    return ret_val;
--  end fn_c_addsub_v12_0_10_latency;

--Add when include xbip_addsub_v3_0_3_resources...
--    function fn_c_addsub_v12_0_10_resources(
--    C_VERBOSITY           : integer;
--    C_XDEVICEFAMILY       : string;
--    C_IMPLEMENTATION      : integer;
--    C_A_WIDTH             : integer;
--    C_B_WIDTH             : integer;
--    C_OUT_WIDTH           : integer;
--    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
--    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
--    C_B_TYPE              : integer;
--    C_LATENCY             : integer;
--    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
--    C_B_CONSTANT          : integer;
--    C_B_VALUE             : string;
--    C_AINIT_VAL           : string;
--    C_SINIT_VAL           : string;
--    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
--    C_BYPASS_LOW          : integer;
--    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
--    C_HAS_C_IN            : integer;
--    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
--     c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
--    C_HAS_CE              : integer;
--    C_HAS_BYPASS          : integer;
--    C_HAS_SCLR            : integer;
--    C_HAS_SSET            : integer;
--    C_HAS_SINIT           : integer
--    ) return t_c_addsub_v12_0_10_resources is
--    variable ret_val : t_c_addsub_v12_0_10_resources;
--    variable xbip_addsub_res : t_xbip_addsub_v3_0_3_resources;
--  begin
--    if C_IMPLEMENTATION = 1 then
--      xbip_addsub_res := fn_xbip_addsub_v3_0_3_get_resources(
--        p_xdevicefamily  => C_XDEVICEFAMILY,
--        p_implementation => C_IMPLEMENTATION,
--        p_verbosity => C_VERBOSITY,
--        p_latency => C_LATENCY,
--        p_bypass_low => C_BYPASS_LOW,
--    p_a_width => C_A_WIDTH,
--    p_b_width => C_B_WIDTH,
--        p_out_width => C_OUT_WIDTH,
--        p_ce_overrides_sclr => C_CE_OVERRIDES_SCLR,
--        p_A_type => C_A_TYPE,
--    p_B_type => C_B_TYPE
--        );
--      ret_val.dsp48 := xbip_accum_res.dsp48;
--      ret_val.bram18k := xbip_accum_res.bram18k;
--      ret_val.luts := xbip_accum_res.luts;
--      ret_val.ffs := xbip_accum_res.ffs;
--    else
--      ret_val.dsp48 := 0;
--      ret_val.bram18k := 0;
--      ret_val.luts := C_OUT_WIDTH;
--      ret_val.ffs := C_OUT_WIDTH;
--    end if;
--    return ret_val;
--  end fn_c_addsub_v12_0_10_resources;

  function fn_c_addsub_v12_0_10_resources(
    C_VERBOSITY           : integer;
    C_XDEVICEFAMILY       : string;
    C_IMPLEMENTATION      : integer;
    C_A_WIDTH             : integer;
    C_B_WIDTH             : integer;
    C_OUT_WIDTH           : integer;
    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
    C_B_TYPE              : integer;
    C_LATENCY             : integer;
    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
    C_B_CONSTANT          : integer;
    C_B_VALUE             : string;
    C_AINIT_VAL           : string;
    C_SINIT_VAL           : string;
    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer;
    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer;
    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
     --c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
    C_HAS_CE              : integer;
    C_HAS_BYPASS          : integer;
    C_HAS_SCLR            : integer;
    C_HAS_SSET            : integer;
    C_HAS_SINIT           : integer
    ) return t_c_addsub_v12_0_10_resources is
    variable ret_val : t_c_addsub_v12_0_10_resources;
    variable v_addsub_pipe : t_c_addsub_v12_0_10_latency;
    variable v_latency : integer;
  begin
    v_addsub_pipe := fn_c_addsub_v12_0_10_latency(
      c_verbosity           => c_verbosity,
      c_xdevicefamily       => c_xdevicefamily,
      c_implementation      => c_implementation,
      c_a_width             => c_a_width,
      c_b_width             => c_b_width,
      c_out_width           => c_out_width,
      c_ce_overrides_sclr   => c_ce_overrides_sclr,
      c_a_type              => c_a_type,
      c_b_type              => c_b_type,
      c_latency             => c_latency,
      c_add_mode            => c_add_mode,
      c_b_constant          => c_b_constant,
      c_b_value             => c_b_value,
      c_ainit_val           => c_ainit_val,
      c_sinit_val           => c_sinit_val,
      c_ce_overrides_bypass => c_ce_overrides_bypass,
      c_bypass_low          => c_bypass_low,
      c_sclr_overrides_sset => c_sclr_overrides_sset,
      c_has_c_in            => c_has_c_in,
      c_has_c_out           => c_has_c_out,
      c_has_ce              => c_has_ce,
      c_has_bypass          => c_has_bypass,
      c_has_sclr            => c_has_sclr,
      c_has_sset            => c_has_sset,
      c_has_sinit           => c_has_sinit
      );
    v_latency := v_addsub_pipe.used;

    if c_implementation = 0 then
      --legacy - very rough estimates!
      ret_val.dsp48   := 0;
      ret_val.bram18k := 0;
      ret_val.luts    := c_out_width * (v_latency+1 ) / 2;  --diagonal structure
      ret_val.ffs     := c_out_width * v_latency;
    else
      ret_val.dsp48   := 1;
      ret_val.bram18k := 0;
      ret_val.luts    := 0;
      ret_val.ffs     := 0;
    end if;
    return ret_val;
  end function fn_c_addsub_v12_0_10_resources;

    function fn_c_addsub_v12_0_10_check_generics(
    C_VERBOSITY           : integer;
    C_XDEVICEFAMILY       : string;
    C_IMPLEMENTATION      : integer;
    C_A_WIDTH             : integer;
    C_B_WIDTH             : integer;
    C_OUT_WIDTH           : integer;
    C_CE_OVERRIDES_SCLR   : integer;  -- replaces c_sync_enable
    C_A_TYPE              : integer;  -- 0=signed, 1=unsigned;
    C_B_TYPE              : integer;
    C_LATENCY             : integer;
    C_ADD_MODE            : integer;  -- 0=add, 1=sub, 2=addsub;
    C_B_CONSTANT          : integer;
    C_B_VALUE             : string;
    C_AINIT_VAL           : string;
    C_SINIT_VAL           : string;
    C_CE_OVERRIDES_BYPASS : integer;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer;
  C_BORROW_LOW          : integer;
    C_SCLR_OVERRIDES_SSET : integer;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer;
    C_HAS_C_OUT           : integer;  -- may be registered in step with c_latency
     --c_has_ovfl            : integer := 0;            -- may be registered in step with c_latency
    C_HAS_CE              : integer;
    C_HAS_BYPASS          : integer;
    C_HAS_SCLR            : integer;
    C_HAS_SSET            : integer;
    C_HAS_SINIT           : integer
    ) return integer is


    constant error_string :  string := "ERROR: c_addsub_v12_0_10: ";
    constant warn_string :  string := "WARNING: c_addsub_v12_0_10: ";
    variable natural_width : integer := fn_get_natural_width(c_a_type, c_b_type, c_add_mode, c_a_width, c_b_width);
  begin

    if C_VERBOSITY /= 0 and C_VERBOSITY /= 1 and C_VERBOSITY /= 2 then
      report warn_string & "C_VERBOSITY valid range is 0 to 2.  Setting to 2.  Current value is " & integer'image(C_VERBOSITY) severity warning;
    end if;

    assert C_IMPLEMENTATION = 0 or C_IMPLEMENTATION = 1
      report error_string & "C_IMPLEMENTATION valid range is 0 to 1.  Current value is " & integer'image(C_IMPLEMENTATION) severity error;

    assert C_XDEVICEFAMILY /= "NO_FAMILY"
      report error_string & "C_XDEVICEFAMILY has not been correctly set (perhaps by CORE Generator)" severity error;

    assert C_A_TYPE = 0 or C_A_TYPE = 1
      report error_string & "C_A_TYPE valid range is 0 to 1.  Current value is " & integer'image(C_A_TYPE) severity error;

    assert C_B_TYPE = 0 or C_B_TYPE = 1
      report error_string & "C_B_TYPE valid range is 0 to 1.  Current value is " & integer'image(C_B_TYPE) severity error;

    assert C_CE_OVERRIDES_SCLR = 0 or C_CE_OVERRIDES_SCLR = 1
      report error_string & "C_CE_OVERRIDES_SCLR valid range is 0 to 1.  Current value is " & integer'image(C_CE_OVERRIDES_SCLR) severity error;

    assert C_ADD_MODE = 0 or C_ADD_MODE = 1 or C_ADD_MODE = 2
      report error_string & "C_ADD_MODE valid range is 0 to 2.  Current value is " & integer'image(C_ADD_MODE) severity error;

    assert C_HAS_C_IN = 0 or C_HAS_C_IN = 1
      report error_string & "C_HAS_C_IN valid range is 0 to 1.  Current value is " & integer'image(C_HAS_C_IN) severity error;

    assert C_BORROW_LOW = 0 or C_BORROW_LOW = 1
      report error_string & "C_BORROW_LOW valid range is 0 to 1.  Current value is " & integer'image(C_BORROW_LOW) severity error;

    if C_A_TYPE=0 and C_B_TYPE=0 then
      assert C_HAS_C_OUT = 0
        report error_string & "Carry Out (Borrow Out) is only available for unsigned data.  Current value is " & integer'image(C_HAS_C_OUT) severity error;
    end if;

    assert C_HAS_CE = 0 or C_HAS_CE = 1
      report error_string & "C_HAS_CE valid range is 0 to 1.  Current value is " & integer'image(C_HAS_CE) severity error;

    assert C_HAS_BYPASS = 0 or C_HAS_BYPASS = 1
      report error_string & "C_HAS_BYPASS valid range is 0 to 1.  Current value is " & integer'image(C_HAS_BYPASS) severity error;

    assert C_HAS_SCLR = 0 or C_HAS_SCLR = 1
      report error_string & "C_HAS_SCLR valid range is 0 to 1.  Current value is " & integer'image(C_HAS_SCLR) severity error;

    ASSERT c_a_width >= 2 OR (c_a_type = 1)
      REPORT "ERROR - addsub: c_a_width must be at least 2 bits if it is to be a signed type"
      SEVERITY FAILURE;
    ASSERT c_b_width >= 2 OR (c_b_type = 1)
      REPORT "ERROR - addsub: c_b_width must be at least 2 bits if it is to be a signed type"
      SEVERITY FAILURE;
    ASSERT c_out_width <= natural_width
      REPORT "ERROR - addsub: c_out_width too large (or too small)- see data sheet for allowable values"
      SEVERITY FAILURE;
      --should be equal to for the correct output but sysgen wants bc for input width = output width so returning ERROR trap to the way it was
    ASSERT (c_out_width = natural_width) or (c_out_width = natural_width-1)
      REPORT "WARNING - addsub: c_out_width may be larger than necessary or too small to accommodate bit growth - see data sheet for allowable values (System generator pads inputs to allow smaller c_out_widths than would otherwise be acceptable)"
      SEVERITY WARNING;
    
    if C_IMPLEMENTATION = 0 then
      assert C_A_WIDTH > 0 AND C_A_WIDTH <= 256
        report error_string & "Invalid value for C_A_WIDTH; must be in the range 1..256.  Current value is " & integer'image(C_A_WIDTH) severity error;
    assert C_B_WIDTH > 0 AND C_B_WIDTH <= 256
        report error_string & "Invalid value for C_B_WIDTH; must be in the range 1..256.  Current value is " & integer'image(C_B_WIDTH) severity error;
      assert C_OUT_WIDTH >= C_A_WIDTH and C_OUT_WIDTH >= C_B_WIDTH  AND C_OUT_WIDTH <= 258
        report error_string & "Invalid value for C_OUT_WIDTH; must be in the range: larger of (C_A_WIDTH, C_B_WIDTH)..258.  Current value is " & integer'image(C_OUT_WIDTH) severity error;
 --      Check LATENCY CHECKS
      assert C_LATENCY > -2 AND C_LATENCY <= C_OUT_WIDTH
        report error_string & "C_LATENCY valid values between -1 and output width for the fabric implementation.  Current value is " & integer'image(C_LATENCY) severity error;
      assert C_BORROW_LOW = 1
    report error_string & "C_BORROW_LOW must be 1 for fabric  Current value is " & integer'image(C_BORROW_LOW) severity error;

      assert C_B_CONSTANT = 0 or C_B_CONSTANT = 1
        report error_string & "C_B_CONSTANT valid range is 0 to 1.  Current value is " & integer'image(C_B_CONSTANT) severity error;
    --add check for C_B_VALUE
--    assert C_B_VALUE
--       report error_string & "C_B_VALUE must be equal to C_B_WIDTH.  Current value is " & integer'image(C_B_VALUE) severity error;
      assert C_BYPASS_LOW = 0 or C_BYPASS_LOW = 1
        report error_string & "C_BYPASS_LOW valid range is 0 to 1.  Current value is " & integer'image(C_BYPASS_LOW) severity error;
      assert C_CE_OVERRIDES_BYPASS = 0 or C_CE_OVERRIDES_BYPASS = 1
        report error_string & "C_CE_OVERRIDES_BYPASS valid range is 0 to 1.  Current value is " & integer'image(C_CE_OVERRIDES_BYPASS) severity error;
    assert C_SCLR_OVERRIDES_SSET = 0 or C_SCLR_OVERRIDES_SSET = 1
        report error_string & "C_SCLR_OVERRIDES_SSET valid range is 0 to 1.  Current value is " & integer'image(C_SCLR_OVERRIDES_SSET) severity error;
      assert C_HAS_SSET = 0 or C_HAS_SSET = 1
        report error_string & "C_HAS_SSET valid range is 0 to 1.  Current value is " & integer'image(C_HAS_SSET) severity error;
      assert C_HAS_SINIT = 0 or C_HAS_SINIT = 1
        report error_string & "C_HAS_SINIT valid range is 0 to 1.  Current value is " & integer'image(C_HAS_SINIT) severity error;

    IF c_has_c_out = 1  THEN
      ASSERT c_a_type = 1 AND c_b_type = 1
    REPORT "ERROR - addsub: Carry out is only permitted when both inputs are unsigned"
        SEVERITY FAILURE;
    END IF;

   IF c_out_width >= fn_get_natural_width(c_a_type, c_b_type, c_add_mode, c_a_width, c_b_width) THEN -- output has enough bits to cope with all cases
--      ASSERT p_has_ovfl = 0 AND p_has_q_ovfl = 0
--       REPORT "ERROR - addsub: The core has sufficient bit-growth to render overflow redundant"
--        SEVERITY FAILURE;
--      ASSERT p_has_c_out = 0 AND p_has_q_c_out = 0
--        REPORT "ERROR - addsub: The core has sufficient bit-growth to render carry-out redundant"
--        SEVERITY FAILURE;
--      ASSERT p_has_b_out = 0 AND p_has_q_b_out = 0
      ASSERT c_has_c_out = 0
        REPORT "ERROR - addsub: The core has sufficient bit-growth to render borrow-out redundant"
        SEVERITY FAILURE;
    END IF;

    -- Warning for nonintuitive behaviour
    --
    -- it's not clear what the Right Thing to do is with c_b_value
    -- when it's narrower than c_b_width; but I go on the basis
    -- that "1" probably means one and not minus one, and therefore
    -- zero-extend and not sign-extend.

  --take out until figure out how to add a binary number of certain width to tpr
--    IF c_b_constant = 1 THEN
-- --     IF c_b_type = 0 THEN
--        ASSERT (c_b_value'LENGTH = c_b_width)
--          REPORT "ERROR - addsub: c_b_value is not equal to c_b_width"
--          SEVERITY FAILURE;
----      END IF;
--    END IF;

    -- FIXME pipelining-specific generics need to be considered

      IF c_has_sset = 1 OR c_has_sinit = 1 THEN
        ASSERT FALSE
          REPORT "WARNING - addsub: In the interests of efficiency, sset and sinit are ignored for pipelined modules"
          SEVERITY WARNING;
      END IF;

    else
      if not(supports_dsp48(C_XDEVICEFAMILY)>0 or supports_dsp48e(C_XDEVICEFAMILY)>0 or supports_dsp48a(C_XDEVICEFAMILY)>0) then
        assert false
          report error_string & "Invalid value for C_XDEVICEDFAMILY; must be VIRTEX4, VIRTEX5, VIRTEX6, SPARTAN3ADSP, or  SPARTAN6 for DSP48 implementation.  Current value is " & C_XDEVICEFAMILY severity error;
      end if;
      assert C_A_WIDTH > 0 AND C_A_WIDTH <= 48-C_A_TYPE -- Allow bit growth for correct answer in unsigned case.  The A input feeds into the C input of the DSP48 usecase so the width will always be 48
        report error_string & "Invalid value for C_A_WIDTH; must be in the range 1.." & integer'image(48-C_A_TYPE) & ".  Current value is " & integer'image(C_A_WIDTH) severity error;

      assert C_B_WIDTH > 0 AND C_B_WIDTH <= (fn_dsp48_concat_width(C_XDEVICEFAMILY)-C_B_TYPE)  --The B input feeds the concatenated A:B input of the DSP48 usecase
        report error_string & "Invalid value for C_B_WIDTH; must be in the range 1.." & integer'image(fn_dsp48_concat_width(C_XDEVICEFAMILY)-C_B_TYPE) & ".  Current value is " & integer'image(C_B_WIDTH) severity error;

      IF c_a_type = 1 AND c_b_type = 1 THEN
        assert (C_OUT_WIDTH >= C_A_WIDTH AND C_OUT_WIDTH >= C_B_WIDTH AND C_OUT_WIDTH <= 48)
          report error_string & "Invalid value for C_OUT_WIDTH; must be in the  range: larger of (C_A_WIDTH, C_B_WIDTH)..48 with unsigned inputs to fit into a single dsp48.  Current value is " & integer'image(C_OUT_WIDTH) severity error;
      else
        assert (C_OUT_WIDTH >= C_A_WIDTH AND C_OUT_WIDTH >= C_B_WIDTH AND C_OUT_WIDTH <= 48)
          report error_string & "Invalid value for C_OUT_WIDTH; must be in the  range: larger of (C_A_WIDTH, C_B_WIDTH)..48.  Current value is " & integer'image(C_OUT_WIDTH) severity error;
      END IF;

      assert C_LATENCY = 0 or C_LATENCY = 1 or C_LATENCY = -1 or C_LATENCY = 2
        report error_string & "C_LATENCY valid values of -1, 0, 1 and 2 for the DSP48 implementation.  Current value is " & integer'image(C_LATENCY) severity error;

      if C_VERBOSITY = 1 then
        assert C_BYPASS_LOW = 0
          report warn_string & "C_BYPASS_LOW is not supported in the DSP48 implementation; it will be set to 0 (active High bypass).  Current value is " & integer'image(C_BYPASS_LOW) severity warning;
        assert C_HAS_SSET = 0
          report warn_string & "C_HAS_SSET is not supported in the DSP48 implementation; it will be set to 0 (no SSET port).  Current value is " & integer'image(C_HAS_SSET) severity warning;
        assert C_HAS_SINIT = 0
          report warn_string & "C_HAS_SINIT is not supported in the DSP48 implementation; it will be set to 0 (no SINIT port).  Current value is " & integer'image(C_HAS_SINIT) severity warning;
      assert C_BORROW_LOW = 1 and C_IMPLEMENTATION = 1 and C_ADD_MODE /= 0
      report warn_string & "Extra logic will be added to invert the sense of the carryin signal when subtracting in DSP48.  Current value is " & integer'image(C_BORROW_LOW) severity warning;

      end if;
    end if;
    return 0;
  end function fn_c_addsub_v12_0_10_check_generics;

  function fn_borrow_ports(
    has_port : integer;
    add_mode : integer;
    a_type: integer;
    b_type : integer
  ) return integer is
  begin
    if add_mode=1 and a_type=1 and b_type=1 then
      return has_port;
    else
      return 0;
    end if;
  end fn_borrow_ports;

  function fn_carry_ports(
    has_port : integer;
    add_mode : integer;
    a_type : integer;
    b_type : integer
  ) return integer is
  begin
    if add_mode=1 or a_type=0 or b_type=0 then
      return 0;
    else
      return has_port;
    end if;
  end fn_carry_ports;

  function fn_add_port(
    add_mode : integer
    ) return integer is
  begin
    if add_mode=2 then
      return 1;
    else
      return 0;
    end if;
  end fn_add_port;

    -- purpose: used in natural output width calculation below
  function fn_max(
  p_left : integer;
  p_right : integer
  ) return integer is
  begin
    if p_left > p_right then
      return p_left;
    else
      return p_right;
    end if;
  end fn_max;

  -- purpose: calculates the natural output width which is just the right
  -- size to be able to cope with all possible inputs.
  -- Usually this is max(c_a_width,c_b_width) + 1 but a few cases will produce
  -- 2 bits of growth
  function fn_get_natural_width(
  c_a_type : integer;
  c_b_type : integer;
  c_add_mode : integer;
  c_a_width : integer;
  c_b_width : integer
  ) return integer is
    variable ret_val : integer;
  begin
    -- the valid output widths are somewhat confusing...
    -- for signed +/- signed, 1 bit natural growth regardless of c_add_mode
    -- for unsigned +/- unsigned, 1 bit growth except for adder/subtractors, which produce 2 extra bits.
    -- for unsigned +/- signed or signed +/- unsigned, things get messier.
    -- if the unsigned input is wider-than-or-equal-to the signed input, there are 2 extra bits
    --   eg: 8-bit signed + 8-bit unsigned = (-128..127) + (0..255) = (-128..382) which needs 10 bits to represent fully.
    -- if the signed input is wider than the unsigned input, there is 1 bit growth.
    -- note that for mixed signed/unsigned, c_add_mode has no effect on the growth.
    if (c_a_type = 1 and c_b_type = 1) then
      -- both inputs unsigned  Fabric follows a Q + 1 growth when add_mode =2
      if (c_add_mode =2) then
        ret_val := fn_max(c_a_width,c_b_width) + 1;  --was 2..but no reason?
      else -- pure adder or subtractor
        ret_val := fn_max(c_a_width,c_b_width) + 1;
      end if;
    elsif (c_a_type = 0 and c_b_type = 0) then
      -- both inputs signed
      ret_val := fn_max(c_a_width,c_b_width) + 1;
    else -- mix of signed & unsigned
      if (c_a_type = 1 and c_a_width >= c_b_width) or
         (c_b_type = 1 and c_b_width >= c_a_width) then
        -- unsigned input is wider or equal
        ret_val := fn_max(c_a_width, c_b_width) + 2;
      else
        -- signed input is wider
        ret_val := fn_max(c_a_width, c_b_width) + 1;
      end if;
    end if;
    return ret_val;
  end fn_get_natural_width;

end package body c_addsub_v12_0_10_pkg;


-- $Header
--
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
--
---------------------------------------------------------------
-- pkg_addsub_v9_1
---------------------------------------------------------------
-- Raison d'etre: to sook up all the itty bitty functions and component declarations
-- used by the XST synth entities of the addsub. Not for use by the XCC wrapper.

library ieee;
use ieee.std_logic_1164.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

--library baseblox_utils_v9_1;
--use baseblox_utils_v9_1.prims_constants_v9_1.all;
--use baseblox_utils_v9_1.prims_utils_v9_1.all;
--use baseblox_utils_v9_1.pkg_baseblox_v9_1.all;

package c_addsub_v12_0_10_pkg_legacy is


   component c_addsub_v12_0_10_legacy
     generic (
    c_family              : STRING  := "";
    c_a_width             : INTEGER := 16;
    c_b_width             : INTEGER := 16;
    c_out_width           : INTEGER := 16;
    c_low_bit             : INTEGER := 0;
    c_high_bit            : INTEGER := 15;
    c_add_mode            : INTEGER := c_add;
    c_a_type              : INTEGER := c_unsigned;
    c_b_type              : INTEGER := c_unsigned;
    c_b_constant          : INTEGER := 0;
    c_b_value             : STRING  := "";
    c_ainit_val           : STRING  := "";
    c_sinit_val           : STRING  := "";
    c_bypass_enable       : INTEGER := c_override;
    c_bypass_low          : INTEGER := 0;
    c_sync_enable         : INTEGER := c_override;
    c_sync_priority       : INTEGER := c_clear;
    c_pipe_stages         : INTEGER := 1;
    c_latency             : INTEGER := 1;
    c_has_s               : INTEGER := 0;
    c_has_q               : INTEGER := 1;
    c_has_c_in            : INTEGER := 1;
    c_has_c_out           : INTEGER := 0;
    c_has_q_c_out         : INTEGER := 0;
    c_has_b_in            : INTEGER := 1;
    c_has_b_out           : INTEGER := 0;
    c_has_q_b_out         : INTEGER := 0;
    c_has_ovfl            : INTEGER := 0;
    c_has_q_ovfl          : INTEGER := 0;
    c_has_ce              : INTEGER := 0;
    c_has_add             : INTEGER := 0;
    c_has_bypass          : INTEGER := 0;
    c_has_a_signed        : INTEGER := 0;
    c_has_b_signed        : INTEGER := 0;
    c_has_aclr            : INTEGER := 0;
    c_has_aset            : INTEGER := 0;
    c_has_ainit           : INTEGER := 0;
    c_has_sclr            : INTEGER := 0;
    c_has_sset            : INTEGER := 0;
    c_has_sinit           : INTEGER := 0;
    c_enable_rlocs        : INTEGER := 1;
    c_has_bypass_with_cin : INTEGER := 0
     );

   PORT (
     a        : IN  STD_LOGIC_VECTOR(c_a_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
     b        : IN  STD_LOGIC_VECTOR(c_b_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
     clk      : IN  STD_LOGIC                              := '0';  -- clock
     add      : IN  STD_LOGIC                              := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
     c_in     : IN  STD_LOGIC                              := '0';  -- carry in
     b_in     : IN  STD_LOGIC                              := '1';  -- borrow in
     ce       : IN  STD_LOGIC                              := '1';  -- clock enable
     bypass   : IN  STD_LOGIC                              := '0';  -- sync load of b into reg
     aclr     : IN  STD_LOGIC                              := '0';  -- asynch init.
     aset     : IN  STD_LOGIC                              := '0';  -- asynch set.
     ainit    : IN  STD_LOGIC                              := '0';  -- asynch init.
     sclr     : IN  STD_LOGIC                              := '0';  -- synch init.
     sset     : IN  STD_LOGIC                              := '0';  -- synch set.
     sinit    : IN  STD_LOGIC                              := '0';  -- synch init.
     a_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
     b_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
     ovfl     : OUT STD_LOGIC;
     c_out    : OUT STD_LOGIC;
     b_out    : OUT STD_LOGIC;           -- borrow out
     q_ovfl   : OUT STD_LOGIC;
     q_c_out  : OUT STD_LOGIC;
     q_b_out  : OUT STD_LOGIC;
     s        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0);  -- asynch output value
     q        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0)  -- synch output value
     );
    end component;

   component c_addsub_v12_0_10_legacy_behv
     generic (
    c_family              : STRING  := "";
    c_a_width             : INTEGER := 16;
    c_b_width             : INTEGER := 16;
    c_out_width           : INTEGER := 16;
    c_low_bit             : INTEGER := 0;
    c_high_bit            : INTEGER := 15;
    c_add_mode            : INTEGER := c_add;
    c_a_type              : INTEGER := c_unsigned;
    c_b_type              : INTEGER := c_unsigned;
    c_b_constant          : INTEGER := 0;
    c_b_value             : STRING  := "";
    c_ainit_val           : STRING  := "";
    c_sinit_val           : STRING  := "";
    c_bypass_enable       : INTEGER := c_override;
    c_bypass_low          : INTEGER := 0;
    c_sync_enable         : INTEGER := c_override;
    c_sync_priority       : INTEGER := c_clear;
    c_pipe_stages         : INTEGER := 1;
    c_latency             : INTEGER := 1;
    c_has_s               : INTEGER := 0;
    c_has_q               : INTEGER := 1;
    c_has_c_in            : INTEGER := 1;
    c_has_c_out           : INTEGER := 0;
    c_has_q_c_out         : INTEGER := 0;
    c_has_b_in            : INTEGER := 1;
    c_has_b_out           : INTEGER := 0;
    c_has_q_b_out         : INTEGER := 0;
    c_has_ovfl            : INTEGER := 0;
    c_has_q_ovfl          : INTEGER := 0;
    c_has_ce              : INTEGER := 0;
    c_has_add             : INTEGER := 0;
    c_has_bypass          : INTEGER := 0;
    c_has_a_signed        : INTEGER := 0;
    c_has_b_signed        : INTEGER := 0;
    c_has_aclr            : INTEGER := 0;
    c_has_aset            : INTEGER := 0;
    c_has_ainit           : INTEGER := 0;
    c_has_sclr            : INTEGER := 0;
    c_has_sset            : INTEGER := 0;
    c_has_sinit           : INTEGER := 0;
    c_enable_rlocs        : INTEGER := 1;
    c_has_bypass_with_cin : INTEGER := 0
     );

   PORT (
     a        : IN  STD_LOGIC_VECTOR(c_a_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
     b        : IN  STD_LOGIC_VECTOR(c_b_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
     clk      : IN  STD_LOGIC                              := '0';  -- clock
     add      : IN  STD_LOGIC                              := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
     c_in     : IN  STD_LOGIC                              := '0';  -- carry in
     b_in     : IN  STD_LOGIC                              := '1';  -- borrow in
     ce       : IN  STD_LOGIC                              := '1';  -- clock enable
     bypass   : IN  STD_LOGIC                              := '0';  -- sync load of b into reg
     aclr     : IN  STD_LOGIC                              := '0';  -- asynch init.
     aset     : IN  STD_LOGIC                              := '0';  -- asynch set.
     ainit    : IN  STD_LOGIC                              := '0';  -- asynch init.
     sclr     : IN  STD_LOGIC                              := '0';  -- synch init.
     sset     : IN  STD_LOGIC                              := '0';  -- synch set.
     sinit    : IN  STD_LOGIC                              := '0';  -- synch init.
     a_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
     b_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
     ovfl     : OUT STD_LOGIC;
     c_out    : OUT STD_LOGIC;
     b_out    : OUT STD_LOGIC;           -- borrow out
     q_ovfl   : OUT STD_LOGIC;
     q_c_out  : OUT STD_LOGIC;
     q_b_out  : OUT STD_LOGIC;
     s        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0);  -- asynch output value
     q        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0)  -- synch output value
     );
    end component;

  component c_addsub_v12_0_10_base_legacy is
    generic (
      c_width         : integer;
      c_add_mode      : integer;
      c_b_constant    : integer;
      ci_b_value      : std_logic_vector;
      c_ainit_val     : string  := "";
      c_sinit_val     : string  := "";
      c_bypass_enable : integer := c_no_override;
      c_bypass_low    : integer;
      c_sync_enable   : integer := c_override;
      c_sync_priority : integer := c_clear;
      c_has_s         : integer := 0;
      c_has_q         : integer := 1;
      c_has_c_in      : integer := 0;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
      c_has_c_out     : integer := 0;
      c_has_q_c_out   : integer := 0;
      c_has_ovfl      : integer := 0;
      c_has_q_ovfl    : integer := 0;
      c_has_ce        : integer := 0;
      c_has_bypass    : integer := 0;
      c_has_aclr      : integer := 0;
      c_has_aset      : integer := 0;
      c_has_ainit     : integer := 0;
      c_has_sclr      : integer := 0;
      c_has_sset      : integer := 0;
      c_has_sinit     : integer := 0
      );
    port (
      a       : in  std_logic_vector(c_width-1 downto 0);   -- input value
      b       : in  std_logic_vector(c_width-1 downto 0);   -- input value
      clk     : in  std_logic := '0';  -- clock
      add     : in  std_logic := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
      c_in    : in  std_logic := '0';  -- carry in
      ce      : in  std_logic := '1';  -- clock enable
      bypass  : in  std_logic := '0';  -- sync load of b into reg
      aclr    : in  std_logic := '0';  -- asynch init.
      aset    : in  std_logic := '0';  -- asynch set.
      ainit   : in  std_logic := '0';  -- asynch init.
      sclr    : in  std_logic := '0';  -- synch init.
      sset    : in  std_logic := '0';  -- synch set.
      sinit   : in  std_logic := '0';  -- synch init.
      ovfl    : out std_logic;
      c_out   : out std_logic;
      q_ovfl  : out std_logic;
      q_c_out : out std_logic;
      s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
      q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
      );
  end component c_addsub_v12_0_10_base_legacy;


  --Fabric shares the same i/f as base and lut with one exception: operand widths
  --the reason for this is that the rtl + operator does not give bit growth, so
  --creating a carry out from rtl requires input growth. To allow the old code
  --to remain static, a_internal and b_internal are one bit bigger, except when
  --passed to base.
  component c_addsub_v12_0_10_fabric_legacy is
    generic (
      c_family        : string  := "virtex2";
      c_width         : integer := 8;
      c_add_mode      : integer := 0;
      c_b_constant    : integer := 0;
      ci_b_value      : std_logic_vector;
      c_ainit_val     : string  := "0";
      c_sinit_val     : string  := "0";
      c_bypass_enable : integer := c_no_override;
      c_bypass_low    : integer := 0;
      c_sync_enable   : integer := c_override;
      c_sync_priority : integer := c_clear;
      c_has_s         : integer := 0;
      c_has_q         : integer := 1;
      c_has_c_in      : integer := 0;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
      c_has_c_out     : integer := 0;
      c_has_q_c_out   : integer := 0;
      c_has_ovfl      : integer := 0;
      c_has_q_ovfl    : integer := 0;
      c_has_ce        : integer := 0;
      c_has_bypass    : integer := 0;
      c_has_aclr      : integer := 0;
      c_has_aset      : integer := 0;
      c_has_ainit     : integer := 0;
      c_has_sclr      : integer := 0;
      c_has_sset      : integer := 0;
      c_has_sinit     : integer := 0
      );
    port (
      a       : in  std_logic_vector(c_width-1 downto 0);   -- input value
      b       : in  std_logic_vector(c_width-1 downto 0);   -- input value
      clk     : in  std_logic := '0';  -- clock
      add     : in  std_logic := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
      c_in    : in  std_logic := '0';  -- carry in
      ce      : in  std_logic := '1';  -- clock enable
      bypass  : in  std_logic := '0';  -- sync load of b into reg
      aclr    : in  std_logic := '0';  -- asynch init.
      aset    : in  std_logic := '0';  -- asynch set.
      ainit   : in  std_logic := '0';  -- asynch init.
      sclr    : in  std_logic := '0';  -- synch init.
      sset    : in  std_logic := '0';  -- synch set.
      sinit   : in  std_logic := '0';  -- synch init.
      ovfl    : out std_logic;
      c_out   : out std_logic;
      q_ovfl  : out std_logic;
      q_c_out : out std_logic;
      s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
      q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
      );
  end component c_addsub_v12_0_10_fabric_legacy;

  component c_addsub_v12_0_10_lut6_legacy is
    generic (
      c_width         : integer := 8;
      c_add_mode      : integer := 0;
      c_b_constant    : integer := 0;
      ci_b_value      : std_logic_vector;
      c_ainit_val     : string  := "0";
      c_sinit_val     : string  := "0";
      c_bypass_enable : integer := c_no_override;
      c_bypass_low    : integer := 0;
      c_sync_enable   : integer := c_override;
      c_sync_priority : integer := c_clear;
      c_has_s         : integer := 0;
      c_has_q         : integer := 1;
      c_has_c_in      : integer := 0;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
      c_has_c_out     : integer := 0;
      c_has_q_c_out   : integer := 0;
      c_has_ovfl      : integer := 0;
      c_has_q_ovfl    : integer := 0;
      c_has_ce        : integer := 0;
      c_has_bypass    : integer := 0;
      c_has_aclr      : integer := 0;
      c_has_aset      : integer := 0;
      c_has_ainit     : integer := 0;
      c_has_sclr      : integer := 0;
      c_has_sset      : integer := 0;
      c_has_sinit     : integer := 0
      );
    port (
      a       : in  std_logic_vector(c_width-1 downto 0);   -- input value
      b       : in  std_logic_vector(c_width-1 downto 0);   -- input value
      clk     : in  std_logic := '0';  -- clock
      add     : in  std_logic := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
      c_in    : in  std_logic := '0';  -- carry in
      ce      : in  std_logic := '1';  -- clock enable
      bypass  : in  std_logic := '0';  -- sync load of b into reg
      aclr    : in  std_logic := '0';  -- asynch init.
      aset    : in  std_logic := '0';  -- asynch set.
      ainit   : in  std_logic := '0';  -- asynch init.
      sclr    : in  std_logic := '0';  -- synch init.
      sset    : in  std_logic := '0';  -- synch set.
      sinit   : in  std_logic := '0';  -- synch init.
      ovfl    : out std_logic;
      c_out   : out std_logic;
      q_ovfl  : out std_logic;
      q_c_out : out std_logic;
      s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
      q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
      );
  end component c_addsub_v12_0_10_lut6_legacy;

  function fn_low_bit (
    p_slice     : integer;
    p_latency   : integer;
    p_out_width : integer
    )
    return integer;

  function fn_high_bit (
    p_slice     : integer;
    p_latency   : integer;
    p_out_width : integer
    )
    return integer;

  function fn_slice_width (
    p_slice     : integer;
    p_latency   : integer;
    p_out_width : integer
    )
    return integer;

  function fn_zero_vector (
    p_width : integer
    )
    return std_logic_vector;

  function fn_max (
    p_left, p_right : integer
    )
    return integer;

  function fn_get_natural_width(
    p_enum_c_a_type   : T_NUMBER_FORMAT;
    p_enum_c_b_type   : T_NUMBER_FORMAT;
    p_enum_c_add_mode : T_ADD_MODE;
    p_a_width         : integer;
    p_b_width         : integer
    )
    return integer;

  function fn_check_generics(
    p_a_width              : integer;
    p_b_width              : integer;
    p_out_width            : integer;
    p_low_bit              : integer;
      -- c_high_bit should not be used anymore; the only uses here are in the interface (declaring
      -- port sizes) and in the check_generics function (ensuring c_high_bit + 1 = c_out_width)
    p_high_bit             : integer;
    p_enum_c_add_mode      : T_ADD_MODE;
    p_enum_c_a_type        : T_NUMBER_FORMAT;
    p_enum_c_b_type        : T_NUMBER_FORMAT;
    p_b_constant           : integer;
    p_b_value              : string ;
    p_ainit_val            : string ;
    p_sinit_val            : string ;
    p_enum_c_bypass_enable : T_BYPASS_ENABLE;
    p_bypass_low           : integer;
    p_enum_c_sync_enable   : T_SYNC_ENABLE;
    p_enum_c_sync_priority : T_REG_PRIORITY;
    p_pipe_stages          : integer;
    p_latency              : integer;
    p_has_s                : integer;
    p_has_q                : integer;
    p_has_c_in             : integer;
    p_has_c_out            : integer;
    p_has_q_c_out          : integer;
    p_has_b_in             : integer;
    p_has_b_out            : integer;
    p_has_q_b_out          : integer;
    p_has_ovfl             : integer;
    p_has_q_ovfl           : integer;
    p_has_ce               : integer;
    p_has_add              : integer;
    p_has_bypass           : integer;
    p_has_a_signed         : integer;
    p_has_b_signed         : integer;
    p_has_aclr             : integer;
    p_has_aset             : integer;
    p_has_ainit            : integer;
    p_has_sclr             : integer;
    p_has_sset             : integer;
    p_has_sinit            : integer;
    p_enable_rlocs         : integer;
    p_has_bypass_with_cin  : integer
    )
    return integer;

  type T_CC_CONTROL is (
    CC_NONE,
    CC_BYPASS,
    CC_SCLR,
    CC_SSET,
    CC_SINIT,
    CC_BYPASS_SCLR,
    CC_BYPASS_SSET,
    CC_BYPASS_SINIT,
    CC_SCLR_SSET,
    CC_BYPASS_SCLR_SSET
    );
  function fn_cc_controller(
    p_has_lut6   : integer;
    p_has_bypass : integer;
    p_has_sclr   : integer;
    p_has_sset   : integer;
    p_has_sinit  : integer
    )
    return T_CC_CONTROL;

  function check_base_generics(
    p_width    : integer;
    p_has_ovfl : integer
    )
    return integer;

end c_addsub_v12_0_10_pkg_legacy;

package body c_addsub_v12_0_10_pkg_legacy is

  -- Purpose: ensure that the generics supplied do not demand a nonsensical or unsupported case
  FUNCTION fn_check_generics (
    p_a_width              : integer;
    p_b_width              : integer;
    p_out_width            : integer;
    p_low_bit              : integer;
      -- c_high_bit should not be used anymore; the only uses here are in the interface (declaring
      -- port sizes) and in the check_generics function (ensuring c_high_bit + 1 = c_out_width)
    p_high_bit             : integer;
    p_enum_c_add_mode      : T_ADD_MODE;
    p_enum_c_a_type        : T_NUMBER_FORMAT;
    p_enum_c_b_type        : T_NUMBER_FORMAT;
    p_b_constant           : integer;
    p_b_value              : string ;
    p_ainit_val            : string ;
    p_sinit_val            : string ;
    p_enum_c_bypass_enable : T_BYPASS_ENABLE;
    p_bypass_low           : integer;
    p_enum_c_sync_enable   : T_SYNC_ENABLE;
    p_enum_c_sync_priority : T_REG_PRIORITY;
    p_pipe_stages          : integer;
    p_latency              : integer;
    p_has_s                : integer;
    p_has_q                : integer;
    p_has_c_in             : integer;
    p_has_c_out            : integer;
    p_has_q_c_out          : integer;
    p_has_b_in             : integer;
    p_has_b_out            : integer;
    p_has_q_b_out          : integer;
    p_has_ovfl             : integer;
    p_has_q_ovfl           : integer;
    p_has_ce               : integer;
    p_has_add              : integer;
    p_has_bypass           : integer;
    p_has_a_signed         : integer;
    p_has_b_signed         : integer;
    p_has_aclr             : integer;
    p_has_aset             : integer;
    p_has_ainit            : integer;
    p_has_sclr             : integer;
    p_has_sset             : integer;
    p_has_sinit            : integer;
    p_enable_rlocs         : integer;
    p_has_bypass_with_cin  : integer
    )
    RETURN INTEGER IS
  BEGIN
    -- simple checks
    ASSERT p_a_width >= 1 AND p_a_width <= 258
      REPORT "ERROR - addsub: c_a_width must be in the range 1..258"
      SEVERITY FAILURE;
    ASSERT p_b_width >= 1 AND p_b_width <= 258
      REPORT "ERROR - addsub: c_b_width must be in the range 1..258"
      SEVERITY FAILURE;
    -- signed types need at least 2 bits
    ASSERT p_a_width >= 2 OR (p_enum_c_a_type /= NUM_SIGNED AND p_enum_c_a_type /= NUM_PIN)
      REPORT "ERROR - addsub: c_a_width must be at least 2 bits if it is to be a signed type"
      SEVERITY FAILURE;
    ASSERT p_b_width >= 2 OR (p_enum_c_b_type /= NUM_SIGNED AND p_enum_c_b_type /= NUM_PIN)
      REPORT "ERROR - addsub: c_b_width must be at least 2 bits if it is to be a signed type"
      SEVERITY FAILURE;
    ASSERT p_high_bit = p_out_width - 1
      REPORT "ERROR - addsub: c_high_bit must equal c_out_width - 1, but has been deprecated anyway"
      severity WARNING;
    ASSERT p_low_bit = 0
      REPORT "ERROR - addsub: c_low_bit must equal zero, but has been deprecated anyway"
      SEVERITY WARNING;
    ASSERT p_b_constant = 0 OR p_b_constant = 1
      REPORT "ERROR - addsub: Invalid value in generic c_b_constant (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_bypass_low = 0 OR p_bypass_low = 1
      REPORT "ERROR - addsub: Invalid value in generic c_bypass_low (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_pipe_stages = 0 OR p_pipe_stages = 1
      REPORT "WARNING - addsub: c_pipe_stages generic is no longer supported; it will be ignored. If you want pipelining, use the c_latency generic"
      SEVERITY WARNING;
    ASSERT p_has_s = 0 OR p_has_s = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_s (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_q = 0 OR p_has_q = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_q (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_c_in = 0 OR p_has_c_in = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_c_in (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_c_out = 0 OR p_has_c_out = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_c_out (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_q_c_out = 0 OR p_has_q_c_out = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_q_c_out (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_b_in = 0 OR p_has_b_in = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_b_in (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_b_out = 0 OR p_has_b_out = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_b_out (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_q_b_out = 0 OR p_has_q_b_out = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_q_b_out (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_ovfl = 0 OR p_has_ovfl = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_ovfl (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_q_ovfl = 0 OR p_has_q_ovfl = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_q_ovfl (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_ce = 0 OR p_has_ce = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_ce (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_add = 0 OR p_has_add = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_add (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_bypass = 0 OR p_has_bypass = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_bypass (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_a_signed = 0
      REPORT "ERROR - addsub: c_has_a_signed deprecated as of baseblox_v8_0"
      SEVERITY FAILURE;
    ASSERT p_has_b_signed = 0
      REPORT "ERROR - addsub: c_has_b_signed deprecated as of baseblox_v8_0"
      SEVERITY FAILURE;
    ASSERT p_has_aclr = 0 OR p_has_aclr = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_aclr (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_aset = 0 OR p_has_aset = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_aset (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_ainit = 0 OR p_has_ainit = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_ainit (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_sclr = 0 OR p_has_sclr = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_sclr (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_sset = 0 OR p_has_sset = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_sset (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_sinit = 0 OR p_has_sinit = 1
      REPORT "ERROR - addsub: Invalid value in generic c_has_sinit (must be 0 or 1)"
      SEVERITY FAILURE;
    ASSERT p_has_bypass_with_cin = 0
      REPORT "ERROR - addsub: c_has_bypass_with_cin deprecated as of baseblox_v8_0"
      SEVERITY WARNING;
    ASSERT p_enable_rlocs = 0
      REPORT "WARNING - addsub: Relative location constraints (c_has_rlocs) no longer supported as of baseblox_v8_0"
      SEVERITY WARNING;

    -- More complex checks
    ASSERT p_has_s = 1 OR p_has_q = 1
      REPORT "WARNING - addsub: No output port (S or Q) requested"
      SEVERITY WARNING;

    -- c_has_add and c_add_mode redundancy..
    ASSERT NOT (p_enum_c_add_mode = MODE_ADDSUB AND p_has_add = 0)
      REPORT "ERROR - addsub: Adder/subtractors require an ADD pin - set c_has_add to 1"
      SEVERITY FAILURE;
    ASSERT NOT (p_enum_c_add_mode /= MODE_ADDSUB AND p_has_add = 1)
      REPORT "ERROR - addsub: ADD pin is needed only for adder/subtractors"
      SEVERITY FAILURE;

    IF p_enum_c_add_mode = MODE_ADD OR p_enum_c_add_mode = MODE_ADDSUB THEN
      ASSERT p_has_b_in = 0 AND p_has_b_out = 0 AND p_has_q_b_out = 0
        REPORT "ERROR - addsub: Borrow in/out not available for adders or adder/subtractors (use c_in and c_out instead)"
        SEVERITY FAILURE;
    ELSE -- enum_c_add_mode = MODE_SUB
      ASSERT p_has_c_in = 0 AND p_has_c_out = 0 AND p_has_q_c_out = 0
        REPORT "ERROR - addsub: Carry in/out not available for subtractors (use b_in and b_out instead)"
        SEVERITY FAILURE;
    END IF;

    ASSERT p_out_width >= fn_max(p_a_width,p_b_width)
      REPORT "ERROR - addsub: A or B is wider than the output"
      SEVERITY ERROR;

    ASSERT p_out_width <= fn_get_natural_width(p_enum_c_a_type, p_enum_c_b_type, p_enum_c_add_mode, p_a_width, p_b_width)
      REPORT "ERROR - addsub: c_out_width too large - see data sheet for allowable values"
      SEVERITY FAILURE;

    IF p_has_ovfl = 1 OR p_has_q_ovfl = 1 THEN
      ASSERT p_enum_c_a_type = NUM_SIGNED AND p_enum_c_b_type = NUM_SIGNED
        REPORT "ERROR - addsub: Overflow is only permitted when both inputs are signed"
        SEVERITY FAILURE;
    END IF;

    IF p_has_c_out = 1 OR p_has_b_out = 1 OR p_has_q_c_out = 1 OR p_has_q_b_out = 1 THEN
      ASSERT p_enum_c_a_type = NUM_UNSIGNED AND p_enum_c_b_type = NUM_UNSIGNED
        REPORT "ERROR - addsub: Carry/borrow out are only permitted when both inputs are unsigned"
        SEVERITY FAILURE;
    END IF;

    IF p_out_width >= fn_get_natural_width(p_enum_c_a_type, p_enum_c_b_type, p_enum_c_add_mode, p_a_width, p_b_width) THEN -- output has enough bits to cope with all cases
      ASSERT p_has_ovfl = 0 AND p_has_q_ovfl = 0
        REPORT "ERROR - addsub: The core has sufficient bit-growth to render overflow redundant"
        SEVERITY FAILURE;
      ASSERT p_has_c_out = 0 AND p_has_q_c_out = 0
        REPORT "ERROR - addsub: The core has sufficient bit-growth to render carry-out redundant"
        SEVERITY FAILURE;
      ASSERT p_has_b_out = 0 AND p_has_q_b_out = 0
        REPORT "ERROR - addsub: The core has sufficient bit-growth to render borrow-out redundant"
        SEVERITY FAILURE;
    END IF;

    -- Warning for nonintuitive behaviour
    --
    -- it's not clear what the Right Thing to do is with c_b_value
    -- when it's narrower than c_b_width; but I go on the basis
    -- that "1" probably means one and not minus one, and therefore
    -- zero-extend and not sign-extend.
    IF p_b_constant = 1 THEN
      IF p_enum_c_b_type = NUM_SIGNED THEN
        ASSERT NOT (p_b_value'LENGTH < p_b_width)
          REPORT "WARNING - addsub: c_b_value is narrower than c_b_width, will pad with zeroes. If a negative number is required, it must be the same width as c_b_width"
          SEVERITY WARNING;
      END IF;
    END IF;

    -- Async and sync controls together will create extra logic
    ASSERT (p_has_ainit = 0 AND p_has_aset = 0 AND p_has_aclr = 0) OR
           (p_has_sinit = 0 AND p_has_sset = 0 AND p_has_sclr = 0)
      REPORT "WARNING - addsub: Including both asynchronous (aclr, aset or ainit)"
           & "and synchronous controls (sclr, sset or sinit) will add extra logic and impact performance"
      SEVERITY WARNING;

    -- FIXME pipelining-specific generics need to be considered
    IF p_latency > 1 THEN -- Pipelined module
      ASSERT p_has_s = 0 AND p_has_c_out = 0 AND p_has_b_out = 0 AND p_has_ovfl = 0
        REPORT "ERROR - addsub: Cannot have pipelining and asynchronous outputs (s, c_out, b_out, ovfl); use the synchronous versions (q, q_c_out, q_b_out, q_ovfl) instead"
        SEVERITY FAILURE;

      IF p_has_ce = 1 AND p_has_bypass = 1 THEN
        ASSERT p_enum_c_bypass_enable = CE_OVERRIDES_BYPASS
          REPORT "ERROR - addsub: BYPASS over CE does not make sense in a pipelined module"
          SEVERITY FAILURE;
      END IF;

      IF p_has_aclr = 1 OR p_has_aset = 1 OR p_has_ainit = 1 THEN
        ASSERT FALSE
          REPORT "WARNING - addsub: In the interests of speed, aclr/aset/ainit are ignored for pipelined modules"
          SEVERITY WARNING;
      END IF;

      IF p_has_sset = 1 OR p_has_sinit = 1 THEN
        ASSERT FALSE
          REPORT "WARNING - addsub: In the interests of efficiency, sset and sinit are ignored for pipelined modules"
          SEVERITY WARNING;
      END IF;
    END IF;
    RETURN 0;
  END fn_check_generics;


  -- Purpose: ensure that the generics supplied do not demand a nonsensical or unsupported case
  function check_base_generics(
    p_width    : integer;
    p_has_ovfl : integer
    )
    return integer is
  begin
    -- simple checks
    assert p_width >= 1 and p_width <= 258
      report "error - addsub: c_width must be in the range 1..258"
      severity failure;

    assert p_width >= 2 or p_has_ovfl = 0
      report "error - addsub: internal error; c_addsub_v9_1_base cannot produce an overflow with c_width < 2"
      severity failure;
    return 0;
  end check_base_generics;


  function fn_max (
    p_left, p_right : integer
    )
    return integer is
  begin
    if p_left > p_right then
      return p_left;
    else
      return p_right;
    end if;
  end fn_max;

  -- purpose: calculates the natural output width which is just the right
  -- size to be able to cope with all possible inputs.
  -- Usually this is max(c_a_width,c_b_width) + 1 but a few cases will produce
  -- 2 bits of growth
  function fn_get_natural_width(
    p_enum_c_a_type   : T_NUMBER_FORMAT;
    p_enum_c_b_type   : T_NUMBER_FORMAT;
    p_enum_c_add_mode : T_ADD_MODE;
    p_a_width         : integer;
    p_b_width         : integer
    )
    return integer is
    variable ret_val : integer;
  begin
    -- no check for num_pin, or for c_has_a_signed
    -- this module no longer supports these generics

    -- the valid output widths are somewhat confusing...
    -- for signed +/- signed, 1 bit natural growth regardless of c_add_mode
    -- for unsigned +/- unsigned, 1 bit growth except for adder/subtractors, which produce 2 extra bits.
    -- for unsigned +/- signed or signed +/- unsigned, things get messier.
    -- if the unsigned input is wider-than-or-equal-to the signed input, there are 2 extra bits
    --   eg: 8-bit signed + 8-bit unsigned = (-128..127) + (0..255) = (-128..382) which needs 10 bits to represent fully.
    -- if the signed input is wider than the unsigned input, there is 1 bit growth.
    -- note that for mixed signed/unsigned, c_add_mode has no effect on the growth.
    if (p_enum_c_a_type = NUM_UNSIGNED and p_enum_c_b_type = NUM_UNSIGNED) then
      -- both inputs unsigned
      if (p_enum_c_add_mode = MODE_ADDSUB) then
        ret_val := fn_max(p_a_width,p_b_width) + 2;
      else -- pure adder or subtractor
        ret_val := fn_max(p_a_width,p_b_width) + 1;
      end if;
    elsif (p_enum_c_a_type = NUM_SIGNED and p_enum_c_b_type = NUM_SIGNED) then
      -- both inputs signed
      ret_val := fn_max(p_a_width,p_b_width) + 1;
    else -- mix of signed & unsigned
      if (p_enum_c_a_type = NUM_UNSIGNED and p_a_width >= p_b_width) or
         (p_enum_c_b_type = NUM_UNSIGNED and p_b_width >= p_a_width) then
        -- unsigned input is wider or equal
        ret_val := fn_max(p_a_width, p_b_width) + 2;
      else
        -- signed input is wider
        ret_val := fn_max(p_a_width, p_b_width) + 1;
      end if;
    end if;
    return ret_val;
  end fn_get_natural_width;

  function fn_low_bit (
    p_slice     : integer;
    p_latency   : integer;
    p_out_width : integer
    )
    return integer is
  begin
    assert p_slice >= 1 and p_slice <= p_latency
      report "ERROR - addsub: Internal error; invalid value passed to fn_low_bit"
      severity failure;
    return (p_out_width * (p_slice-1)) / p_latency;
  end fn_low_bit;

  function fn_high_bit (
    p_slice     : integer;
    p_latency   : integer;
    p_out_width : integer
    )
    return integer is
  begin
    assert p_slice >= 1 and p_slice <= p_latency
      report "ERROR - addsub: Internal error; invalid value passed to fn_high_bit"
      severity failure;
    return ((p_out_width * p_slice) / p_latency) - 1;
  end fn_high_bit;

  function fn_slice_width (
    p_slice     : integer;
    p_latency   : integer;
    p_out_width : integer
    )
    return integer is
  begin
    return fn_high_bit(p_slice, p_latency, p_out_width) - fn_low_bit(p_slice, p_latency, p_out_width) + 1;
  end fn_slice_width;

  function fn_zero_vector (
    p_width : integer
    )
    return std_logic_vector is
    constant ret_val : std_logic_vector(p_width - 1 downto 0) := (others => '0');
  begin
    return ret_val;
  end fn_zero_vector;

  function fn_cc_controller(
    p_has_lut6   : integer;
    p_has_bypass : integer;
    p_has_sclr   : integer;
    p_has_sset   : integer;
    p_has_sinit  : integer
    )
    return T_CC_CONTROL is
  begin
    if p_has_bypass = 1 and p_has_sclr = 0 and p_has_sset = 0 and p_has_sinit = 0 then
      return CC_BYPASS;
    elsif p_has_bypass = 0 and p_has_sclr = 1 and p_has_sset = 0 and p_has_sinit = 0 then
      return CC_SCLR;
    elsif p_has_bypass = 0 and p_has_sclr = 0 and p_has_sset = 1 and p_has_sinit = 0 then
      return CC_SSET;
    elsif p_has_bypass = 0 and p_has_sclr = 0 and p_has_sset = 0 and p_has_sinit = 1 then
      return CC_SINIT;
    elsif p_has_bypass = 1 and p_has_sclr = 1 and p_has_sset = 0 and p_has_sinit = 0 then
      return CC_BYPASS_SCLR;
    elsif p_has_bypass = 1 and p_has_sclr = 0 and p_has_sset = 1 and p_has_sinit = 0 then
      return CC_BYPASS_SSET;
    elsif p_has_bypass = 1 and p_has_sclr = 0 and p_has_sset = 0 and p_has_sinit = 1 then
      return CC_BYPASS_SINIT;
    elsif p_has_bypass = 0 and p_has_sclr = 1 and p_has_sset = 1 and p_has_sinit = 0 then
      return CC_SCLR_SSET;
    elsif p_has_bypass = 1 and p_has_sclr = 1 and p_has_sset = 1 and p_has_sinit = 0 and p_has_lut6 = 1 then
      return CC_BYPASS_SCLR_SSET;
    else
      return CC_NONE;
    end if;
  end fn_cc_controller;


end c_addsub_v12_0_10_pkg_legacy;


-- $Id: c_addsub_v12_0_10_lut6_legacy.vhd,v 1.5 2010/03/19 10:44:16 julian Exp $
-------------------------------------------------------------------------------
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

-- Filename - c_addsub_v9_1_base.vhd
-- Author - Xilinx
-- Creation - 18 Aug 2004
--
-- Description:
-- sub-module of c_addsub_v9_1_viv.vhd
-- this does the work of creating an addsub

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

--LIBRARY c_addsub_v9_1;
--USE c_addsub_v9_1.c_addsub_v9_1_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_addsub_v12_0_10;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg.ALL;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg_legacy.ALL;

--LIBRARY baseblox_utils_v9_1;
--USE baseblox_utils_v9_1.prims_constants_v9_1.ALL;
--USE baseblox_utils_v9_1.prims_utils_v9_1.ALL;
--USE baseblox_utils_v9_1.pkg_baseblox_v9_1.ALL;

--LIBRARY c_reg_fd_v9_1;
--USE c_reg_fd_v9_1.c_reg_fd_v9_1_viv_comp.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

--library c_addsub_v9_1;
--use c_addsub_v9_1.pkg_addsub_v9_1.all;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_addsub_v12_0_10_lut6_legacy IS
  GENERIC (
    c_width               : INTEGER;
    c_add_mode            : INTEGER;
    c_b_constant          : INTEGER;
    ci_b_value            : STD_LOGIC_VECTOR;
    c_ainit_val           : STRING;
    c_sinit_val           : STRING;
    c_bypass_enable       : INTEGER;
    c_bypass_low          : INTEGER;
    c_sync_enable         : INTEGER;
    c_sync_priority       : INTEGER;
    c_has_s               : INTEGER;
    c_has_q               : INTEGER;
    c_has_c_in            : INTEGER; -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
    c_has_c_out           : INTEGER;
    c_has_q_c_out         : INTEGER;
    c_has_ovfl            : INTEGER;
    c_has_q_ovfl          : INTEGER;
    c_has_ce              : INTEGER;
    c_has_bypass          : INTEGER;
    c_has_aclr            : INTEGER;
    c_has_aset            : INTEGER;
    c_has_ainit           : INTEGER;
    c_has_sclr            : INTEGER;
    c_has_sset            : INTEGER;
    c_has_sinit           : INTEGER
    );

  PORT (
    a        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
    b        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
    clk      : IN  STD_LOGIC                              := '0';  -- clock
    add      : IN  STD_LOGIC                              := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
    c_in     : IN  STD_LOGIC                              := '0';  -- carry in
    ce       : IN  STD_LOGIC                              := '1';  -- clock enable
    bypass   : IN  STD_LOGIC                              := '0';  -- sync load of b into reg
    aclr     : IN  STD_LOGIC                              := '0';  -- asynch init.
    aset     : IN  STD_LOGIC                              := '0';  -- asynch set.
    ainit    : IN  STD_LOGIC                              := '0';  -- asynch init.
    sclr     : IN  STD_LOGIC                              := '0';  -- synch init.
    sset     : IN  STD_LOGIC                              := '0';  -- synch set.
    sinit    : IN  STD_LOGIC                              := '0';  -- synch init.
    ovfl     : OUT STD_LOGIC;
    c_out    : OUT STD_LOGIC;
    q_ovfl   : OUT STD_LOGIC;
    q_c_out  : OUT STD_LOGIC;
    s        : OUT STD_LOGIC_VECTOR(c_width - 1 DOWNTO 0);  -- asynch output value
    q        : OUT STD_LOGIC_VECTOR(c_width - 1 DOWNTO 0)  -- synch output value
    );
END c_addsub_v12_0_10_lut6_legacy;

ARCHITECTURE rtl OF c_addsub_v12_0_10_lut6_legacy IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  -- Types inherited from pkg_baseblox:
  -- TYPE T_SYNC_ENABLE
  -- TYPE T_BYPASS_ENABLE
  -- TYPE T_REG_PRIORITY
  -- TYPE T_ADD_MODE
  -- TYPE T_NUMBER_FORMAT
  --
  -- carry chain controller

  -- This function collects various special cases together where logic can be absorbed into the
  -- carry-chain. It is used by need_sync_model.
  -- Note that to avoid a 5-input function, only 2 inputs may be absorbed (to go alongside A and B).
  -- So the conspicuously missing CC_BYPASS_SCLR_SSET is not possible.
  CONSTANT cc_controller : T_CC_CONTROL := fn_cc_controller(
    1,                               --rainier
    c_has_bypass,
    c_has_sclr,
    c_has_sset,
    c_has_sinit
    );

  -- Clean versions of generics:
  CONSTANT enum_c_add_mode      : T_ADD_MODE     := fn_select_add_mode (c_add_mode);
  CONSTANT enum_c_bypass_enable : T_BYPASS_ENABLE:= fn_select_bypass_enable(c_bypass_enable);
  CONSTANT enum_c_sync_enable   : T_SYNC_ENABLE  := fn_select_sync_enable(c_sync_enable);
  CONSTANT enum_c_sync_priority : T_REG_PRIORITY := fn_select_sync_priority(c_sync_priority);

  CONSTANT ci_ainit_val : STD_LOGIC_VECTOR(q'RANGE) := str_to_bound_slv_0(c_ainit_val, q'LENGTH);
  CONSTANT ci_sinit_val : STD_LOGIC_VECTOR(q'RANGE) := str_to_bound_slv_0(c_sinit_val, q'LENGTH);

  -- Purpose: ensure that the generics supplied do not demand a nonsensical or unsupported case
  function check_base_generics(
    p_width    : integer;
    p_has_ovfl : integer
    )
    return integer is
  begin
    -- simple checks
    assert p_width >= 1 and p_width <= 258
      report "error - addsub: c_width must be in the range 1..258"
      severity failure;

    assert p_width >= 2 or p_has_ovfl = 0
      report "error - addsub: internal error; c_addsub_v12_0_10_base cannot produce an overflow with c_width < 2"
      severity failure;
    return 0;
  end check_base_generics;

  -- The following line should make sure that check_generics
  -- is called on instantiation
  CONSTANT check_gens : INTEGER := check_base_generics(c_width, c_has_ovfl);

  -- Design notes:
  --
  -- The need_sync_model function controls some GENERATE statements later on.
  -- The synchronous model incorporates the sclr, sset and sinit controls into
  -- the carry-chain logic. To clarify: a simple implementation of a registered
  -- adder with aclr and sclr signals would calculate a + b in one layer of logic,
  -- then have another layer of logic to multiplex (a+b) with zero depending on sclr;
  -- because aclr is using the primitive's clear port so sclr must be implemented
  -- in luts.
  --
  -- The synchronous model is still 2 layers of logic, because sclr must
  -- be converted to active-low first before calculating (a+b) when sclr = '1' else "0"
  -- in one fell swoop. The advantage is a significant space saving:
  -- simple: 2 layers each c_width wide for a total of (2*c_width) luts
  -- sync: 1 layer c_width wide, plus 1 to invert sclr gives (c_width + 1) luts.
  --
  -- However, it is only sometimes wise to do this because while it sometimes
  -- reduces logic usage, it also sometimes doesn't and it is difficult to see
  -- what it is doing.
  --
  -- As a result, if the sync model is used, then instantiated registers will
  -- not need sclr/sset/sinit controls because they have already been processed
  -- in the generation of the sum_sync signal (and also the ce_reg signal
  -- if enum_c_sync_enable = SYNC_OVERRIDES_CE)

  -- The simple model does not perform this absorbtion. The most obvious case where
  -- it is used is when there are asynchronous outputs (one of S, C_OUT, B_OUT or OVFL).

  -- determines whether the synchronous controls (sclr, sset, sinit) should
  -- be absorbed into the carry chain LUTs
  FUNCTION fn_need_sync_model RETURN BOOLEAN IS
  BEGIN
    IF c_has_aclr = 0 AND c_has_aset = 0 AND c_has_ainit = 0 THEN
      -- If there are no async controls, the primitive's set/clear ports
      -- can be used, so no need to do absorbtion
      RETURN FALSE;
    END IF;
    IF c_has_s = 1 OR c_has_c_out = 1 OR c_has_ovfl = 1 THEN
      -- absorbing sync controls would destroy asynchronous outputs
      RETURN FALSE;
    END IF;
    IF c_has_q_c_out = 1 and enum_c_add_mode = MODE_SUB THEN
      -- sclr and sset need to be inverted for this case, so crossing carry
      -- chain wont work
      RETURN FALSE;
    END IF;
    IF c_has_sset = 1 AND (c_has_q_c_out = 1 OR c_has_q_ovfl = 1) THEN
      -- sset is defined to set these registers high; this is incompatible with
      -- the absorbtion technique, which forces the carry chain (and therefore the
      -- inputs to these registers) low.
      RETURN FALSE;
    END IF;
    CASE cc_controller IS
      WHEN CC_NONE | CC_BYPASS => RETURN FALSE; -- No sync controls to be absorbed!
      WHEN CC_SCLR | CC_SSET | CC_SINIT => RETURN TRUE;
      WHEN CC_BYPASS_SCLR | CC_BYPASS_SSET | CC_BYPASS_SINIT =>
        -- carry-chain LUTs have 4 inputs already (a, b, bypass, and one of sclr/set/init)
        -- an ADD input as well will make a 5-input function. So far so good in
        -- rainier, but if bypass overrides ce and ce overrides sync, ce gets
        -- in on the act thus the space savings will be
        -- lost.
        IF (enum_c_add_mode = MODE_ADDSUB) and c_has_ce = 1 AND enum_c_sync_enable = CE_OVERRIDES_SYNC AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE THEN
          RETURN FALSE;
        END IF;
        RETURN TRUE;
      WHEN CC_SCLR_SSET =>
        -- Again, an ADD input will create a 5-input function, but this is ok.
--        IF enum_c_add_mode = MODE_ADDSUB THEN
--          RETURN FALSE;
--        END IF;
        RETURN TRUE;
      WHEN CC_BYPASS_SCLR_SSET =>
        IF enum_c_add_mode = MODE_ADDSUB THEN
          RETURN FALSE;
        END IF;
    END CASE;

    RETURN FALSE;
  END fn_need_sync_model;

  -- determines whether a simple adder carry chain (with no absorbtion of
  -- the sclr, sset, sinit controls) is required.
  FUNCTION fn_need_simple_model RETURN BOOLEAN IS
  BEGIN
    RETURN NOT fn_need_sync_model;
  END fn_need_simple_model;

  CONSTANT need_sync_model : BOOLEAN := fn_need_sync_model;
  CONSTANT need_simple_model : BOOLEAN := fn_need_simple_model;


  -- Within the simple model (the sync model does things its own way), there
  -- are three possible implementations of an addsub with BYPASS:
  -- 1) the simple one (works in some cases)
  -- 2) the loadable counter special case
  -- 3) the less simple one (works in all cases)
  -- these are described in more detail in the i_simple_model: -> i_bypass: IF GENERATE section below.

  -- use_simple_bypass is mutually exclusive with use_counter_bypass
  -- because use_simple_bypass requires variable b and
  -- use_counter_bypass requires constant b
  FUNCTION fn_use_simple_bypass RETURN BOOLEAN IS
  BEGIN
    IF enum_c_add_mode = MODE_ADD AND c_b_constant = 0 THEN
      RETURN TRUE;
    END IF;
    RETURN FALSE;
  END fn_use_simple_bypass;

  CONSTANT use_simple_bypass : BOOLEAN := fn_use_simple_bypass;

  FUNCTION fn_use_counter_bypass RETURN BOOLEAN IS
  BEGIN
    IF c_b_constant = 1
            AND (enum_c_add_mode = MODE_ADD OR enum_c_add_mode = MODE_SUB)
            AND c_has_c_in = 0 AND c_has_c_out = 0 AND c_has_q_c_out = 0
            AND c_has_bypass = 1 AND c_bypass_low = 0 THEN
      ASSERT use_simple_bypass = FALSE -- sanity check; can't happen
        REPORT "ERROR - addsub: Internal error; use_simple_bypass and use_counter_bypass?"
        SEVERITY FAILURE;
      RETURN TRUE;
    END IF;
    RETURN FALSE;
  END fn_use_counter_bypass;

  CONSTANT use_counter_bypass : BOOLEAN := fn_use_counter_bypass;

  -- purpose: calculates whether we need to generate the last carry-out
  -- (ie whether we need the top MUXCY or MULT_AND to generate carry(c_width - 1))
  -- (XST gets confused if it is generated and never used, and wastes an extra LUT)
  FUNCTION need_carry_out RETURN BOOLEAN IS
  BEGIN
    IF   c_has_c_out = 1 OR c_has_q_c_out = 1
      OR c_has_ovfl  = 1 OR c_has_q_ovfl  = 1 THEN
        RETURN TRUE;
    END IF;
    RETURN FALSE;
  END need_carry_out;

  SIGNAL a_for_sum : STD_LOGIC_VECTOR (a'RANGE); -- for symmetry with b_for_sum (always equals a)
  SIGNAL b_for_sum : STD_LOGIC_VECTOR (b'RANGE); -- equiv to port b for nonconstant b; otherwise equiv to ci_b_value
  SIGNAL b_or_not_b : STD_LOGIC_VECTOR(b'RANGE); -- for subtraction

  -- outputs from the two addsub models
  -- although the simple and sync models are mutually exclusive, it's easier for them
  -- to use separate signals rather than use a general sum and carry signal for both.
  SIGNAL sum_simple : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
  SIGNAL carry_simple : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
  SIGNAL sum_sync   : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
  SIGNAL carry_sync   : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);

  SIGNAL c_in_i : STD_LOGIC;
  SIGNAL add_i : STD_LOGIC;

  -- the ce_i, sclr_i, etc signals are simply wired to the equivalent input port
  -- (if the generics say it is present) or tied to a constant value ('1' for CE,
  -- '0' for sclr/set/init). They are used to generate *_reg

  SIGNAL ce_i      : STD_LOGIC;
  SIGNAL sclr_i    : STD_LOGIC;
  SIGNAL sset_i    : STD_LOGIC;
  SIGNAL sinit_i   : STD_LOGIC;

  -- the ce_reg, sclr_reg etc controls are the signals which are provided to the
  -- reg_fd components which generate q, q_c_out, q_b_out and q_ovfl.

  SIGNAL ce_reg      : STD_LOGIC;
  SIGNAL sclr_reg    : STD_LOGIC;
  SIGNAL sset_reg    : STD_LOGIC;
  SIGNAL sinit_reg   : STD_LOGIC;

BEGIN
  --------------------- PREPARATION SECTION ------------------------
  --
  -- Converts external ports to internal signals and vice versa
  -- and generally deals with optional stuff.

  ----------------------------------
  -- connect inputs to internals
  ----------------------------------

  -- Generate a_for_sum
  a_for_sum <= a;

  -- Generate b_for_sum
  i_b_constant: IF c_b_constant = 1 GENERATE
    b_for_sum <= ci_b_value;
  END GENERATE i_b_constant;
  i_b_variable: IF c_b_constant = 0 GENERATE
    b_for_sum <= b;
  END GENERATE i_b_variable;

  -- b_or_not_b (along with c_in_i) handles the work done by subtractors and addsubs
  -- since (a - b) is equivalent to (a + (NOT b) + '1')
  b_or_not_b <= b_for_sum WHEN add_i = '1' ELSE NOT b_for_sum;

  -- Generate add_i
  i_add_adder: IF enum_c_add_mode = MODE_ADD GENERATE
    add_i <= '1';
  END GENERATE;
  i_add_subtracter: IF enum_c_add_mode = MODE_SUB GENERATE
    add_i <= '0';
  END GENERATE;
  i_add_addsub: IF enum_c_add_mode = MODE_ADDSUB GENERATE
    add_i <= add;
  END GENERATE;

  -- Generate c_in_i
  i_c_in_present: IF c_has_c_in = 1 GENERATE
    c_in_i <= c_in;
  END GENERATE i_c_in_present;
  i_c_in_implicit: IF c_has_c_in = 0 GENERATE
    c_in_i <= NOT add_i;
  END GENERATE i_c_in_implicit;

  -- generate ce_i, sclr_i, sset_i, sinit_i
  i_ce: IF c_has_ce = 1 GENERATE
    ce_i <= ce;
  END GENERATE i_ce;
  i_no_ce: IF c_has_ce = 0 GENERATE
    ce_i <= '1';
  END GENERATE i_no_ce;

  i_sclr: IF c_has_sclr = 1 GENERATE
    sclr_i <= sclr;
  END GENERATE i_sclr;
  i_no_sclr: IF c_has_sclr = 0 GENERATE
    sclr_i <= '0';
  END GENERATE i_no_sclr;

  i_sset: IF c_has_sset = 1 GENERATE
    sset_i <= sset;
  END GENERATE i_sset;
  i_no_sset: IF c_has_sset = 0 GENERATE
    sset_i <= '0';
  END GENERATE i_no_sset;

  i_sinit: IF c_has_sinit = 1 GENERATE
    sinit_i <= sinit;
  END GENERATE i_sinit;
  i_no_sinit: IF c_has_sinit = 0 GENERATE
    sinit_i <= '0';
  END GENERATE i_no_sinit;

  -- This section generates the ce_reg, sclr_reg, sset_reg and sinit_reg
  -- controls. In the simplest case, the only purpose is to ensure BYPASS
  -- overrides CE if enum_c_bypass_enable = BYPASS_OVERRIDES_CE; the rest
  -- of the work is done by the reg_fd baseblock.
  --
  -- There is, however, a little extra work when the sync controls are to be
  -- absorbed in the sync_model. Then they are handled entirely by the addsub,
  -- and enum_c_sync_enable must be dealt with here.
  --
  -- There is one special case (below) where the assumption made here,
  -- that synchronous controls always take priority over bypass, does not hold.
  i_reg_controls: IF NOT((c_has_sclr = 1 OR c_has_sset = 1 OR c_has_sinit = 1)
                    AND enum_c_sync_enable = CE_OVERRIDES_SYNC
                    AND c_has_bypass = 1
                    AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE
                    AND c_has_ce = 1) GENERATE
    sclr_reg <= sclr_i;
    sset_reg <= sset_i;
    sinit_reg <= sinit_i;
    i_ce_with_bypass: IF c_has_bypass = 1 AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE GENERATE
      -- if bypass is to override ce, it must force ce_reg high.
      i_ce_with_sync: IF need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE GENERATE
        -- because we are using the sync model we have to handle overriding of CE ourselves
        -- rather than leave the reg_fd block to do it
        i_bypass_high: IF c_bypass_low = 0 GENERATE
          ce_reg <= ce_i OR bypass OR sclr_i OR sset_i OR sinit_i;
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          ce_reg <= ce_i OR NOT bypass OR sclr_i OR sset_i OR sinit_i;
        END GENERATE i_bypass_low;
      END GENERATE i_ce_with_sync;
      i_ce_without_sync: IF NOT(need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE) GENERATE
        i_bypass_high: IF c_bypass_low = 0 GENERATE
          ce_reg <= ce_i OR bypass;
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          ce_reg <= ce_i OR NOT bypass;
        END GENERATE i_bypass_low;
      END GENERATE i_ce_without_sync;
    END GENERATE i_ce_with_bypass;
    i_ce_without_bypass: IF NOT(c_has_bypass = 1 AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE) GENERATE
      -- bypass may still be present; but it doesn't override ce.
      i_ce_with_sync: IF need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE GENERATE
        ce_reg <= ce_i OR sclr_i OR sset_i OR sinit_i;
      END GENERATE i_ce_with_sync;
      i_ce_without_sync: IF NOT(need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE) GENERATE
        ce_reg <= ce_i;
      END GENERATE i_ce_without_sync;
    END GENERATE i_ce_without_bypass;
  END GENERATE i_reg_controls;

  i_reg_controls_special: IF (c_has_sclr = 1 OR c_has_sset = 1 OR c_has_sinit = 1)
                              AND enum_c_sync_enable = CE_OVERRIDES_SYNC
                              AND c_has_bypass = 1
                              AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE
                              AND c_has_ce = 1 GENERATE
    -- As stated above, this is the special case where sync controls do not always
    -- override bypass. If CE is low, the sync controls should have no effect, but
    -- bypass should. if this circuit were implemented naively then bypass would
    -- simply drive ce_reg high; but then the synchronous controls would "steal"
    -- the control from them since they see a high CE.
    --
    -- This means sclr_reg and co need to be gated with ce_i.

    sclr_reg <= sclr_i AND ce_i;
    sset_reg <= sset_i AND ce_i;
    sinit_reg <= sinit_i AND ce_i;
    i_bypass_high: IF c_bypass_low = 0 GENERATE
      ce_reg <= ce_i OR bypass;
    END GENERATE i_bypass_high;
    i_bypass_low: IF c_bypass_low = 1 GENERATE
      ce_reg <= ce_i OR NOT bypass;
    END GENERATE i_bypass_low;
  END GENERATE i_reg_controls_special;

  -----------------------------------
  -- connect internals to outputs
  -----------------------------------

  -- carry-out generation
  no_c_out: if c_has_c_out = 0 generate
    c_out <= '0';
  end generate no_c_out;
  no_q_c_out: if c_has_q_c_out = 0 generate
    q_c_out <= '0';
  end generate no_q_c_out;

  i_c_out: IF c_has_c_out = 1 GENERATE
    c_out <= carry_simple(c_width - 1); -- carry out from top bit
  END GENERATE i_c_out;

  i_q_c_out: IF c_has_q_c_out = 1 GENERATE
    -- generate a register to store q_c_out

    i_simple: IF NOT need_sync_model GENERATE
      sub_q_cout : IF c_add_mode = 1 GENERATE
        signal claused_aset : std_logic := '0';
      begin
        claused_aset <= aset when aclr = '0' else '0';
        --on reset, q_c_out should go to 1 for subtractor
        q_c_outreg : c_reg_fd_v12_0_3_viv
          GENERIC MAP (
            c_width         => 1,
            c_ainit_val     => "1",     -- init gets treated as set here to mimic sclr. Yes, I'm confused too.
            c_sinit_val     => "1",
            c_sync_priority => 1-c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
--            c_has_aclr      => c_has_aclr,
--            c_has_aset      => c_has_aset,
            c_has_aclr      => c_has_aset,  --deliberate crosswiring
            c_has_aset      => c_has_aclr,
            c_has_ainit     => c_has_ainit,
            c_has_sset      => c_has_sclr,  --deliberate crosswiring
            c_has_sclr      => c_has_sset,
            c_has_sinit     => c_has_sinit,
            c_enable_rlocs  => 0
            )
          PORT MAP (
            clk   => clk,
            ce    => ce_reg,
            ainit => ainit,
--            aclr  => aclr,
--            aset  => aset,
            aclr  => claused_aset,
            aset  => aclr,
            sinit => sinit_reg,
            sset  => sclr_reg,          --deliberate crosswiring
            sclr  => sset_reg,
            d(0)  => carry_simple(c_width-1),
            q(0)  => q_c_out
            );
      END GENERATE sub_q_cout;
      add_q_cout: IF c_add_mode /= 1 GENERATE
        q_c_outreg : c_reg_fd_v12_0_3_viv
          GENERIC MAP (
            c_width         => 1,
            c_ainit_val     => "0",     -- init gets treated as clear
            c_sinit_val     => "0",
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_ainit     => c_has_ainit,
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_sinit     => c_has_sinit,
            c_enable_rlocs  => 0
            )
          PORT MAP (
            clk   => clk,
            ce    => ce_reg,
            ainit => ainit,
            aclr  => aclr,
            aset  => aset,
            sinit => sinit_reg,
            sclr  => sclr_reg,
            sset  => sset_reg,
            d(0)  => carry_simple(c_width-1),
            q(0)  => q_c_out
            );
      END GENERATE add_q_cout;
    END GENERATE i_simple;

    i_sync: IF need_sync_model GENERATE
      q_c_outreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,
          c_ainit_val     => "0", -- init gets treated as clear
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => 0, -- sync controls have been absorbed
          c_has_sset      => 0,
          c_has_sinit     => 0,
          c_enable_rlocs  => 0
          )
        PORT MAP (
          clk    => clk,
          ce     => ce_reg,
          ainit  => ainit,
          aclr   => aclr,
          aset   => aset,
          d(0)   => carry_sync(c_width-1),
          q(0)   => q_c_out
          );
    END GENERATE i_sync;
  END GENERATE i_q_c_out;

  -- overflow generation

  -- the previous implementation used an XORCY to calculate overflow.
  -- Using a LUT is generally faster; so this is what is done here.
  -- The only family tested to have the XORCY method be faster was
  -- Spartan-II, and it was a difference of 4 MHz. With more modern
  -- architectures, the LUT was markedly better.
  -- The maplog generally looks ever so slightly worse this way, because
  -- an extra LUT is used; however, if you use an XORCY then you can't
  -- use the LUT in the same half-slice for anything else - both designs
  -- use the same amount of resource.

  no_i_ovfl: if c_has_ovfl = 0 generate
    ovfl <= '0';
  end generate no_i_ovfl;
  no_i_q_ovfl: if c_has_q_ovfl = 0 generate
    q_ovfl <= '0';
  end generate no_i_q_ovfl;

  i_ovfl: IF c_has_ovfl = 1 GENERATE
    ovfl <= carry_simple(c_width - 1) XOR carry_simple(c_width - 2);
    --ovfl <= ovfl_i;
  END GENERATE i_ovfl;
  i_q_ovfl: IF c_has_q_ovfl = 1 GENERATE
    -- generate a register to store q_ovfl

    i_simple: IF NOT(need_sync_model) GENERATE
      SIGNAL d_ovfl : STD_LOGIC;
    BEGIN
      d_ovfl <= carry_simple(c_width - 1) XOR carry_simple(c_width - 2);
      q_ovflreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,
          c_ainit_val     => "0", -- init gets treated as clear
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => c_has_sinit,
          c_enable_rlocs  => 0
          )
        PORT MAP (
          clk    => clk,
          ce     => ce_reg,
          ainit  => ainit,
          aclr   => aclr,
          aset   => aset,
          sinit  => sinit_reg,
          sclr   => sclr_reg,
          sset   => sset_reg,
          d(0)   => d_ovfl,
          q(0)   => q_ovfl
          );
    END GENERATE i_simple;

    i_sync: IF need_sync_model GENERATE
      SIGNAL d_ovfl : STD_LOGIC;
    BEGIN
      d_ovfl <= carry_sync(c_width - 1) XOR carry_sync(c_width - 2);
      q_ovflreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,
          c_ainit_val     => "0", -- init gets treated as clear
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => 0, -- sync controls have been absorbed
          c_has_sset      => 0,
          c_has_sinit     => 0,
          c_enable_rlocs  => 0
          )
        PORT MAP (
          clk    => clk,
          ce     => ce_reg,
          ainit  => ainit,
          aclr   => aclr,
          aset   => aset,
          d(0)   => d_ovfl,
          q(0)   => q_ovfl
          );
    END GENERATE i_sync;
  END GENERATE i_q_ovfl;

  -- main output generation (S and Q)

  i_no_s: if c_has_s = 0 generate
    s <= (others => '0');-- avoids Questa warning 8684
  end generate i_no_s;
  i_no_q: if c_has_q = 0 generate
    q <= (others => '0');-- avoids Questa warning 8684
  end generate i_no_q;

  i_s: IF c_has_s = 1 GENERATE
    s <= sum_simple;
  END GENERATE i_s;

  i_q: IF c_has_q = 1 GENERATE

    i_simple: IF NOT(need_sync_model) GENERATE
      qreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => q'LENGTH,
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
          c_enable_rlocs  => 0
        )
        PORT MAP (
          clk   => clk,
          ce    => ce_reg,
          ainit => ainit,
          aclr  => aclr,
          aset  => aset,
          sinit => sinit_reg,
          sclr  => sclr_reg,
          sset  => sset_reg,
          d     => sum_simple(c_width-1 DOWNTO 0),
          q     => q
        );
    END GENERATE i_simple;

    i_sync: IF need_sync_model GENERATE
      qreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => q'LENGTH,
          c_ainit_val     => c_ainit_val,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => 0, -- sync controls have been absorbed
          c_has_sset      => 0,
          c_has_sinit     => 0,
          c_enable_rlocs  => 0
        )
        PORT MAP (
          clk   => clk,
          ce    => ce_reg,
          ainit => ainit,
          aclr  => aclr,
          aset  => aset,
          d     => sum_sync,
          q     => q
        );
    END GENERATE i_sync;
  END GENERATE i_q;

  ------------------ END OF PREPARATION SECTION --------------------

  ------------------------- MAIN SECTION ---------------------------

  -- generate sum

  -- This section is a bit difficult to read; this is because the
  -- carry-chain has been instantiated, while the function which feeds
  -- it is described in RTL. This means that neither bit gives you
  -- the full picture...

  -- halfsum is the work done by the LUTs which feed the carry chain.
  -- so it's slightly more than a "real" halfsum - it handles BYPASS
  -- and (especially in the sync model) other, more esoteric things.

  -- di is a vector holding all the signals which will go into the di
  -- port of the MUXCYs. Usually it will just be a_for_sum but sometimes
  -- a MULT_AND will be used (esp. with bypass), and when B is constant,
  -- this will be exploited so that any logic generating A can be absorbed
  -- into the halfsum LUT.

  -- There are two models here: simple_model and sync_model.
  -- Note that when there are sclr/sset/sinit inputs which
  -- cannot use the primitive's ports (because the user has requested
  -- aclr/aset/ainit which are using them instead) the synchronous
  -- controls have to be implemented by modifying the value of sum.
  --
  -- The sync_model is used when it is possible to do this in the
  -- same LUTs which perform the addition operation; however, because
  -- the sync controls must be converted to active-low first, there
  -- are still just as many layers of logic. It is therefore purely
  -- a slice-saving measure.
  --
  -- The simple_model is used whenever the sync_model isn't worth it
  -- (eg when asynchronous outputs are required which should be unsullied
  -- by the sclr/sset/sinit controls, or when the sync_model cannot actually
  -- save any slices due to the particular circumstances.)
  -- The simple_model is simple only relative to the sync_model; sum_simple is the result of
  -- the addition or subtraction, or it is B when BYPASS is present and active,
  -- whereas sum_sync takes sclr/sset/sinit into account as well.

  i_simple_model: IF need_simple_model GENERATE
    SIGNAL halfsum : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
    SIGNAL di    : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0); -- vector of DI input values for the MUXCYs.
                                                                -- (see a diagram of a slice for a better explanation)
    SIGNAL c_in_gated : STD_LOGIC; -- some models want to muck about with the carry-in signal
                                   -- (specifically, in i_bypass_counter where it is tied to '1'
                                   -- and in the other bypass models where it is disabled when bypass is active)
                                   -- mostly, though, c_in_gated is just c_in_i.

  BEGIN

    -- bypass invokes some slightly more complex models
    i_bypass: IF c_has_bypass = 1 GENERATE
      i_bypass_simple: IF use_simple_bypass GENERATE
        -- Simple bypass model:
        -- this works because b_for_sum = port b
        -- and because b is passed directly to the add function
        -- (because the addsub is in adder-only mode)
        -- The equation is written:
        -- sum <= a + b WHEN bypass = '0' ELSE "0" + b;
        -- and B is used for the di input to the MUXCYs

        -- Generate c_in_gated
        -- Disable carry-in when bypass is active
        i_c_in_gated_bypass_high: IF c_bypass_low = 0 GENERATE
          c_in_gated <= c_in_i AND NOT bypass;
        END GENERATE i_c_in_gated_bypass_high;
        i_c_in_gated_bypass_low: IF c_bypass_low = 1 GENERATE
          c_in_gated <= c_in_i AND bypass;
        END GENERATE i_c_in_gated_bypass_low;

        -- Generate halfsum

        i_bypass_high: IF c_bypass_low = 0 GENERATE
          halfsum <= a_for_sum XOR b_for_sum WHEN bypass = '0' ELSE b;
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          halfsum <= a_for_sum XOR b_for_sum WHEN bypass = '1' ELSE b;
        END GENERATE i_bypass_low;

        -- Generate di

        di <= b_for_sum;

      END GENERATE i_bypass_simple;



      i_bypass_counter: IF use_counter_bypass
                    AND NOT use_simple_bypass GENERATE -- this extra check is for safety; it's (hopefully!) unnecessary
        SIGNAL bypassvector: STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      BEGIN
        -- loadable counter special case
        -- this works because the addsub is set to add a constant
        -- note that an adder can be written as
        --    sum <= a + b + c_in
        -- where a and b are vectors and c_in is 1 single bit.
        --
        -- this means the equation can be rewritten:
        --
        -- if bypass = '0'
        --    sum <= a + ((const-1) OR bypassvector) + 1; -- equiv to (a + const-1 + 1) since bypass = 0
        -- else
        --    sum <= b + ((const-1) OR bypassvector) + 1; -- equiv to (b + (-1) + 1) since bypass = 1;
        -- end if
        --
        -- where bypassvector is a STD_LOGIC_VECTOR with every value equal to BYPASS
        --
        -- so ((const-1) OR bypassvector) is used for di because this operation can be optimised
        -- at compile-time to a vector such that each element is constant '1' or bypass.
        -- This is provided that bypass is active-high. (this is checked in use_counter_bypass)

        -- the use of the carry-in prevents a user carry-in signal. (c_has_c_in = 0)
        -- this will generate a spurious carry-out signal when bypass is high; so carry-out is banned.
        -- it does not affect overflow, however.
        --
        -- the same trick works for subtractors by transforming the number to be subtracted into
        -- the equivalent number to be added. So if b_for_sum = (- constant) we get (constant - 1)
        -- from the expression (NOT b_for_sum).

        i_adder: IF enum_c_add_mode = MODE_ADD GENERATE
          CONSTANT ci_b_minus_one : STD_LOGIC_VECTOR := STD_LOGIC_VECTOR(UNSIGNED(ci_b_value) - "1");
        BEGIN
          -- Generate c_in_gated

          c_in_gated <= '1';

          -- Generate halfsum

          -- halfsum <= a + (const - 1) when bypass = '0' ELSE b + (-1);
          bypassvector <= (OTHERS => bypass);
          halfsum <= a_for_sum XOR ci_b_minus_one WHEN bypass = '0' ELSE b XOR bypassvector;

          -- Generate di

          di <= ci_b_minus_one OR bypassvector;

        END GENERATE i_adder;


        i_subtractor: IF enum_c_add_mode = MODE_SUB GENERATE
          -- Generate c_in_gated

          c_in_gated <= '1';

          -- Generate halfsum

          -- halfsum <= a + 0 when bypass = '0' ELSE b - 1;
          bypassvector <= (OTHERS => bypass);
          halfsum <= a_for_sum XOR (NOT b_for_sum) WHEN bypass = '0' ELSE b XOR bypassvector;

          -- Generate di

          di <= (NOT b_for_sum) OR bypassvector;

        END GENERATE i_subtractor;

      END GENERATE i_bypass_counter;



      i_bypass_other: IF NOT use_simple_bypass AND NOT use_counter_bypass GENERATE
        SIGNAL carry_chain_active : STD_LOGIC := '1'; -- when '0', the whole carry chain is forced low through the use of MULT_ANDs.
      BEGIN
        -- general model which mops up anything which isn't a special case.
        -- uses a similar idea to the sync models below; bypass is (if necessary)
        -- converted to active-low and this becomes the carry_chain_active signal.
        --
        -- the carry_chain_active signal then masks the di signals using AND gates
        -- (Either dedicated MULT_ANDs, or calculated at compile time for constant B),
        -- and the carry-in is gated with bypass. This means the carry-chain is
        -- set to all zeroes when bypass is active, and so the output of the LUTs
        -- is the output of the whole system. The LUTs then just output B, the bypass value.
        --
        -- first need to generate the carry_chain_active signal
        -- (here equivalent to active-low bypass)
        -- see i_sync_model comments for why a LUT is being instantiated rather than inferred
        i_bypass_high: IF c_bypass_low = 0 GENERATE
          carry_chain_active <= not bypass;  --rainier
--          cc_activelut: LUT1
--            GENERIC MAP (
--              INIT => b"01" -- inverter
--            )
--            PORT MAP (
--              I0 => bypass,
--              O  => carry_chain_active
--            );

          -- Generate c_in_gated
          c_in_gated <= c_in_i AND NOT bypass; -- disable carry-in when bypass is active
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          carry_chain_active <= bypass;
          -- Generate c_in_gated
          c_in_gated <= c_in_i AND bypass; -- disable carry-in when bypass is active
        END GENERATE i_bypass_low;


        -- Generate halfsum

        halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE b;

        -- Generate di
        i_di_b_constant: IF c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB GENERATE
          -- Constant B (and not adder/subtractor)
          -- Another special case!
          -- What is achieved here is the ability to absorb any logic on the A path
          -- by using b_or_not_b instead of a_for_sum for the di vector.
          -- This will not be any faster in characterization, since there is no logic to absorb!
          -- (for adder/subtractors, b_or_not_b is no longer a constant, and using it
          -- for di would generate an extra layer of logic; hence a_for_sum is used instead.)

          digen: FOR i IN 0 TO c_width - 1 GENERATE
            di(i) <= b_or_not_b(i) AND carry_chain_active; -- Carry chain set to '0' when carry_chain_active = '0'
          END GENERATE digen;
        END GENERATE i_di_b_constant;
        i_di_b_variable: IF NOT(c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB) GENERATE
          -- variable B
          -- use MULT_ANDs to generate di
          -- All but top bit
          i_gt_1 : if c_width > 1 generate
            multandgen : for i in 0 to c_width - 2 generate
              di(i) <= a_for_sum(i) and carry_chain_active;  --rainier
            end generate multandgen;
          end generate i_gt_1;

          -- top bit (not always needed)
          multandtop: IF need_carry_out GENERATE
            di(c_width-1) <= a_for_sum(c_width - 1) and carry_chain_active;
          END GENERATE multandtop;
        END GENERATE i_di_b_variable;

      END GENERATE i_bypass_other;

    END GENERATE i_bypass;


    i_no_bypass: IF c_has_bypass = 0 GENERATE
      -- Generate c_in_gated

      c_in_gated <= c_in_i;

      -- Generate halfsum

      halfsum <= a_for_sum XOR b_or_not_b;

      -- Generate di
      i_di_b_constant: IF c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB GENERATE
        -- Constant B (and not adder/subtractor)
        -- Yet another special case!
        -- What is achieved here is the ability to absorb any logic on the A path
        -- by using b_or_not_b instead of a_for_sum for the di vector.
        -- This will not be any faster in characterization, since there is no logic to absorb!
        -- (for adder/subtractors, b_or_not_b is no longer a constant, and using it
        -- for di would generate an extra layer of logic; hence a_for_sum is used instead.)

        di <= b_or_not_b;
      END GENERATE i_di_b_constant;
      i_di_b_variable: IF NOT(c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB) GENERATE
        -- variable B
        di <= a_for_sum;
      END GENERATE i_di_b_variable;
    END GENERATE i_no_bypass;

    -- LSB of carry-chain
    -- special case because of the carry-in

    carrymux0: MUXCY
      PORT MAP(
        di => di(0),
        ci => c_in_gated,
        s  => halfsum(0),
        o  => carry_simple(0)
      );

    carryxor0: XORCY
      PORT MAP(
        li => halfsum(0),
        ci => c_in_gated,
        o  => sum_simple(0)
      );

    i_gt_1 : if c_width > 1 generate
      -- MSB of carry-chain
      -- special case because of the carry-out

      -- always need the XORCY
      carryxortop : XORCY
        port map(
          li => halfsum(c_width - 1),
          ci => carry_simple(c_width - 2),
          o  => sum_simple(c_width - 1)
          );

      -- only need the MUXCY if we're using the carry-out
      muxtop : if need_carry_out generate
        carrymuxtop : MUXCY
          port map(
            di => di(c_width - 1),
            ci => carry_simple(c_width - 2),
            s  => halfsum(c_width - 1),
            o  => carry_simple(c_width - 1)
            );

      end generate muxtop;

      -- rest of carry-chain
      carrychaingen : for i in 1 to c_width - 2 generate

        carrymux : MUXCY
          port map(
            di => di(i),
            ci => carry_simple(i-1),
            s  => halfsum(i),
            o  => carry_simple(i)
            );

        carryxor : XORCY
          port map(
            li => halfsum(i),
            ci => carry_simple(i-1),
            o  => sum_simple(i)
            );
      end generate carrychaingen;
    end generate i_gt_1;
  END GENERATE i_simple_model;









  -------------------- SYNC MODEL STARTS HERE ----------------------

  -- synchronous model
  --
  -- This is used where one or more of SCLR, SSET and SINIT can be absorbed
  -- into the carry-chain LUTs. They are first converted to active-low to
  -- create the carry_chain_active signal, then this is used with the dedicated
  -- MULT_AND gates to set the carry-chain to all zeroes so that the LUT can
  -- simply output the raw result required.
  --
  -- The LUTs which generate carry_chain_active are instantiated rather than
  -- inferred. This is because if they are inferred then XST tries to optimise
  -- them away and use the raw (active-high) sclr/set/init signal for the LUT
  -- instead. It doesn't realise that it gets carry_chain_active as a signal to
  -- LUT anyway (because it is also going to the MULT_AND) so the LUT ends up
  -- with two redundant signals. In some cases this redundancy can push it up
  -- to a 5-input function, resulting in an extra LUT per bit which is completely
  -- unnecessary. Instantiating the LUTs stops XST trying to be too clever for
  -- its own good.
  i_sync_model: IF need_sync_model GENERATE
    SIGNAL carry_chain_active : STD_LOGIC;
      -- halfsum is something of a misnomer; it includes the effects of sync controls or bypass
      -- but is otherwise the traditional A xor B.
    SIGNAL halfsum : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
    SIGNAL di    : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0); -- vector of DI input values for the MUXCYs.
    SIGNAL c_in_gated : STD_LOGIC; -- allows carry_chain_active to disable the carry-chain
  BEGIN
    -- sanity checks
    ASSERT c_has_sclr = 1 OR c_has_sset = 1 OR c_has_sinit = 1
      REPORT "ERROR - addsub: Internal error; tried to absorb signals which don't exist"
      SEVERITY FAILURE;
    ASSERT cc_controller /= CC_NONE AND cc_controller /= CC_BYPASS -- should have been caught by need_sync_model
      REPORT "ERROR - addsub: Internal error; invalid value returned by cc_controller"
      SEVERITY FAILURE;

    i_sclr: IF cc_controller = CC_SCLR GENERATE
      -- generate carry_chain_active
      carry_chain_active <= not sclr;

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sclr);

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE (OTHERS => '0');

    END GENERATE i_sclr;

    i_sset: IF cc_controller = CC_SSET GENERATE
      -- generate carry_chain_active
      carry_chain_active <= not sset;

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sset);

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE (OTHERS => '1');

    END GENERATE i_sset;

    i_sinit: IF cc_controller = CC_SINIT GENERATE
      -- generate carry_chain_active
      carry_chain_active <= not sinit;

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sinit);

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE ci_sinit_val;

    END GENERATE i_sinit;

    -- sclr + sset to be absorbed
    -- the following must be true:
    -- the module is not in adder/subtractor mode
    -- the module has no BYPASS signal
    -- When absorbing both sclr and sset, an extra signal is needed to distinguish between them.
    i_sclr_sset: IF cc_controller = CC_SCLR_SSET GENERATE
      SIGNAL set_or_clear : STD_LOGIC; -- High = sset, low = sclr
      CONSTANT E_SET   : STD_LOGIC := '1'; -- set_or_clear must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_CLEAR : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      carry_chain_active <= NOT(sclr or sset);

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sclr) AND (NOT sset);

      i_clear_over_set: IF enum_c_sync_priority = RESET_OVERRIDES_SET GENERATE
        set_or_clear <= E_CLEAR WHEN sclr = '1' ELSE E_SET;
      END GENERATE i_clear_over_set;
      i_set_over_clear: IF enum_c_sync_priority = SET_OVERRIDES_RESET GENERATE
        set_or_clear <= E_SET WHEN sset = '1' ELSE E_CLEAR;
      END GENERATE i_set_over_clear;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '0') WHEN set_or_clear = E_CLEAR
                     ELSE (OTHERS => '1');

    END GENERATE i_sclr_sset;

    -- bypass + sclr to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sclr, an extra signal is needed to distinguish between them.
    i_bypass_sclr: IF cc_controller = CC_BYPASS_SCLR GENERATE
      SIGNAL bypass_or_clear : STD_LOGIC; -- High = bypass, low = sclr
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_clear must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_CLEAR  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        carry_chain_active <= NOT(bypass or sclr);
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND (NOT sclr);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        carry_chain_active <= bypass and not sclr;
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND bypass AND (NOT sclr);
      END GENERATE i_bypass_low;

      -- Implicitly assumes that SCLR _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_clear <= E_CLEAR WHEN sclr = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '0') WHEN bypass_or_clear = E_CLEAR
                     ELSE b;

    END GENERATE i_bypass_sclr;

    -- bypass + sset to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sset, an extra signal is needed to distinguish between them.
    i_bypass_sset: IF cc_controller = CC_BYPASS_SSET GENERATE
      SIGNAL bypass_or_set : STD_LOGIC; -- High = bypass, low = sset
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_set must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_SET  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        carry_chain_active <= not(bypass or sset);
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND (NOT sset);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        carry_chain_active <= bypass AND NOT sset;
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND bypass AND (NOT sset);
      END GENERATE i_bypass_low;

      -- Implicitly assumes that SSET _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_set <= E_SET WHEN sset = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '1') WHEN bypass_or_set = E_SET
                     ELSE b;

    END GENERATE i_bypass_sset;

    -- bypass + sinit to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sinit, an extra signal is needed to distinguish between them.
    i_bypass_sinit: IF cc_controller = CC_BYPASS_SINIT GENERATE
      SIGNAL bypass_or_init : STD_LOGIC; -- High = bypass, low = sinit
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_init must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_INIT  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        carry_chain_active <= not(bypass or sinit);
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND (NOT sinit);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        carry_chain_active <= bypass AND NOT sinit;
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND bypass AND (NOT sinit);
      END GENERATE i_bypass_low;

      -- Implicitly assumes that sinit _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_init <= E_INIT WHEN sinit = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE ci_sinit_val WHEN bypass_or_init = E_INIT
                     ELSE b;

    END GENERATE i_bypass_sinit;


    -- bypass + sset to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sset, an extra signal is needed to distinguish between them.
    i_bypass_sclr_sset: IF cc_controller = CC_BYPASS_SCLR_SSET GENERATE
      SIGNAL bypass_or_sync : STD_LOGIC; -- High = bypass, low = sset
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_set must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_SET  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        carry_chain_active <= not(bypass or sclr or sset);
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND NOT(sclr) and (NOT sset);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        carry_chain_active <= bypass and not (sclr or sset);
        -- generate c_in_gated
        c_in_gated <= c_in_i and bypass and (not sclr) and (not sset);
      end generate i_bypass_low;

      -- Implicitly assumes that SSET _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_sync <= E_SET WHEN sset = '1' or sclr = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '1') WHEN bypass_or_sync = E_SET
                     ELSE b;

    END GENERATE i_bypass_sclr_sset;


    -- code common to all sync models

    -- Generate c_in_gated
    -- the following equation is what the previous sections
    -- should have generated. Alas, while the following assignment
    -- is nice and simple, it results in an unnecessary 2 logic layers
    -- since carry_chain_active is generated by instantiating LUTs.
    -- c_in_gated <= c_in_i AND carry_chain_active;
    --
    -- This comment is left in to aid understanding; but the generation of
    -- c_in_gated has moved to the individual sections above.

    -- LSB of carry chain
    di(0) <= a_for_sum(0) and carry_chain_active;
--    carrymultand: MULT_AND
--      PORT MAP (
--        I0 => a_for_sum(0),
--        I1 => carry_chain_active,
--        LO => di(0)
--      );

    carrymux0: MUXCY
      PORT MAP(
        di => di(0),
        ci => c_in_gated,
        s  => halfsum(0),
        o  => carry_sync(0)
      );

    carryxor0: XORCY
      PORT MAP(
        li => halfsum(0),
        ci => c_in_gated,
        o  => sum_sync(0)
      );

    i_gt_1 : if c_width > 1 generate
      -- MSB of carry-chain
      -- special case because of the carry-out

      -- always need the XORCY
      carryxortop : XORCY
        port map(
          li => halfsum(c_width - 1),
          ci => carry_sync(c_width - 2),
          o  => sum_sync(c_width - 1)
          );

      -- only need the MULT_AND and MUXCY if we're using the carry-out
      carrytop : if need_carry_out generate
        di(c_width - 1) <= a_for_sum(c_width - 1) and carry_chain_active;

        carrymuxtop : MUXCY
          port map(
            di => di(c_width - 1),
            ci => carry_sync(c_width - 2),
            s  => halfsum(c_width - 1),
            o  => carry_sync(c_width - 1)
            );

      end generate carrytop;
    end generate i_gt_1;

    -- rest of carry-chain
    i_gt_2 : if c_width > 2 generate
      carrychaingen : for i in 1 to c_width - 2 generate

        di(i) <= a_for_sum(i) and carry_chain_active;

        carrymux : MUXCY
          port map(
            di => di(i),
            ci => carry_sync(i-1),
            s  => halfsum(i),
            o  => carry_sync(i)
            );

        carryxor : XORCY
          port map(
            li => halfsum(i),
            ci => carry_sync(i-1),
            o  => sum_sync(i)
            );
      end generate carrychaingen;
    end generate i_gt_2;
  end generate i_sync_model;

  ---------------------- END OF MAIN SECTION -----------------------

END rtl;



-- $Id: c_addsub_v12_0_10_base_legacy.vhd,v 1.5 2010/03/19 10:44:16 julian Exp $
-------------------------------------------------------------------------------
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

-- Filename - c_addsub_v9_1_base.vhd
-- Author - Xilinx
-- Creation - 18 Aug 2004
--
-- Description:
-- sub-module of c_addsub_v9_1_viv.vhd
-- this does the work of creating an addsub

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;


--LIBRARY c_addsub_v9_1;
--USE c_addsub_v9_1.c_addsub_v9_1_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_addsub_v12_0_10;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg.ALL;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg_legacy.ALL;

--LIBRARY baseblox_utils_v9_1;
--USE baseblox_utils_v9_1.prims_constants_v9_1.ALL;
--USE baseblox_utils_v9_1.prims_utils_v9_1.ALL;
--USE baseblox_utils_v9_1.pkg_baseblox_v9_1.ALL;

--LIBRARY c_reg_fd_v9_1;
--USE c_reg_fd_v9_1.c_reg_fd_v9_1_viv_comp.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;


LIBRARY unisim;
USE unisim.vcomponents.ALL;



ENTITY c_addsub_v12_0_10_base_legacy IS
  GENERIC (
    c_width               : INTEGER;
    c_add_mode            : INTEGER;
    c_b_constant          : INTEGER;
    ci_b_value            : STD_LOGIC_VECTOR;
    c_ainit_val           : STRING;
    c_sinit_val           : STRING;
    c_bypass_enable       : INTEGER;
    c_bypass_low          : INTEGER;
    c_sync_enable         : INTEGER;
    c_sync_priority       : INTEGER;
    c_has_s               : INTEGER;
    c_has_q               : INTEGER;
    c_has_c_in            : INTEGER; -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
    c_has_c_out           : INTEGER;
    c_has_q_c_out         : INTEGER;
    c_has_ovfl            : INTEGER;
    c_has_q_ovfl          : INTEGER;
    c_has_ce              : INTEGER;
    c_has_bypass          : INTEGER;
    c_has_aclr            : INTEGER;
    c_has_aset            : INTEGER;
    c_has_ainit           : INTEGER;
    c_has_sclr            : INTEGER;
    c_has_sset            : INTEGER;
    c_has_sinit           : INTEGER
    );

  PORT (
    a        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
    b        : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
    clk      : IN  STD_LOGIC                              := '0';  -- clock
    add      : IN  STD_LOGIC                              := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
    c_in     : IN  STD_LOGIC                              := '0';  -- carry in
    ce       : IN  STD_LOGIC                              := '1';  -- clock enable
    bypass   : IN  STD_LOGIC                              := '0';  -- sync load of b into reg
    aclr     : IN  STD_LOGIC                              := '0';  -- asynch init.
    aset     : IN  STD_LOGIC                              := '0';  -- asynch set.
    ainit    : IN  STD_LOGIC                              := '0';  -- asynch init.
    sclr     : IN  STD_LOGIC                              := '0';  -- synch init.
    sset     : IN  STD_LOGIC                              := '0';  -- synch set.
    sinit    : IN  STD_LOGIC                              := '0';  -- synch init.
    ovfl     : OUT STD_LOGIC := '0';
    c_out    : OUT STD_LOGIC := '0';
    q_ovfl   : OUT STD_LOGIC := '0';
    q_c_out  : OUT STD_LOGIC := '0';
    s        : OUT STD_LOGIC_VECTOR(c_width - 1 DOWNTO 0) := (others =>'0');  -- asynch output value
    q        : OUT STD_LOGIC_VECTOR(c_width - 1 DOWNTO 0) := (others =>'0')  -- synch output value
    );
END c_addsub_v12_0_10_base_legacy;

ARCHITECTURE rtl OF c_addsub_v12_0_10_base_legacy IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  -- Types inherited from pkg_baseblox:
  -- TYPE T_SYNC_ENABLE
  -- TYPE T_BYPASS_ENABLE
  -- TYPE T_REG_PRIORITY
  -- TYPE T_ADD_MODE
  -- TYPE T_NUMBER_FORMAT
  --
  -- carry chain controller

  -- This function collects various special cases together where logic can be absorbed into the
  -- carry-chain. It is used by need_sync_model.
  -- Note that to avoid a 5-input function, only 2 inputs may be absorbed (to go alongside A and B).
  -- So the conspicuously missing CC_BYPASS_SCLR_SSET is not possible.
  CONSTANT cc_controller : T_CC_CONTROL := fn_cc_controller(
    0,                                  --does not have LUT6
    c_has_bypass,
    c_has_sclr,
    c_has_sset,
    c_has_sinit
    );

  -- Clean versions of generics:
  CONSTANT enum_c_add_mode      : T_ADD_MODE     := fn_select_add_mode (c_add_mode);
  CONSTANT enum_c_bypass_enable : T_BYPASS_ENABLE:= fn_select_bypass_enable(c_bypass_enable);
  CONSTANT enum_c_sync_enable   : T_SYNC_ENABLE  := fn_select_sync_enable(c_sync_enable);
  CONSTANT enum_c_sync_priority : T_REG_PRIORITY := fn_select_sync_priority(c_sync_priority);

  CONSTANT ci_ainit_val : STD_LOGIC_VECTOR(q'RANGE) := str_to_bound_slv_0(c_ainit_val, c_width);
  CONSTANT ci_sinit_val : STD_LOGIC_VECTOR(q'RANGE) := str_to_bound_slv_0(c_sinit_val, q'LENGTH);
  signal diag_ainit_val :STD_LOGIC_VECTOR(c_width-1 downto 0) := ci_ainit_val ;

  -- Purpose: ensure that the generics supplied do not demand a nonsensical or unsupported case
  function check_base_generics(
    p_width    : integer;
    p_has_ovfl : integer
    )
    return integer is
  begin
    -- simple checks
    assert p_width >= 1 and p_width <= 258
      report "error - addsub: c_width must be in the range 1..258"
      severity failure;

    assert p_width >= 2 or p_has_ovfl = 0
      report "error - addsub: internal error; c_addsub_v12_0_10_base cannot produce an overflow with c_width < 2"
      severity failure;
    return 0;
  end check_base_generics;

  -- The following line should make sure that check_generics
  -- is called on instantiation
  CONSTANT check_gens : INTEGER := check_base_generics(c_width, c_has_ovfl);

  -- Design notes:
  --
  -- The need_sync_model function controls some GENERATE statements later on.
  -- The synchronous model incorporates the sclr, sset and sinit controls into
  -- the carry-chain logic. To clarify: a simple implementation of a registered
  -- adder with aclr and sclr signals would calculate a + b in one layer of logic,
  -- then have another layer of logic to multiplex (a+b) with zero depending on sclr;
  -- because aclr is using the primitive's clear port so sclr must be implemented
  -- in luts.
  --
  -- The synchronous model is still 2 layers of logic, because sclr must
  -- be converted to active-low first before calculating (a+b) when sclr = '1' else "0"
  -- in one fell swoop. The advantage is a significant space saving:
  -- simple: 2 layers each c_width wide for a total of (2*c_width) luts
  -- sync: 1 layer c_width wide, plus 1 to invert sclr gives (c_width + 1) luts.
  --
  -- However, it is only sometimes wise to do this because while it sometimes
  -- reduces logic usage, it also sometimes doesn't and it is difficult to see
  -- what it is doing.
  --
  -- As a result, if the sync model is used, then instantiated registers will
  -- not need sclr/sset/sinit controls because they have already been processed
  -- in the generation of the sum_sync signal (and also the ce_reg signal
  -- if enum_c_sync_enable = SYNC_OVERRIDES_CE)

  -- The simple model does not perform this absorbtion. The most obvious case where
  -- it is used is when there are asynchronous outputs (one of S, C_OUT, B_OUT or OVFL).

  -- determines whether the synchronous controls (sclr, sset, sinit) should
  -- be absorbed into the carry chain LUTs
  FUNCTION fn_need_sync_model RETURN BOOLEAN IS
  BEGIN
    IF c_has_aclr = 0 AND c_has_aset = 0 AND c_has_ainit = 0 THEN
      -- If there are no async controls, the primitive's set/clear ports
      -- can be used, so no need to do absorbtion
      RETURN FALSE;
    END IF;
    IF c_has_s = 1 OR c_has_c_out = 1 OR c_has_ovfl = 1 THEN
      -- absorbing sync controls would destroy asynchronous outputs
      RETURN FALSE;
    END IF;
    IF c_has_q_c_out = 1 and enum_c_add_mode = MODE_SUB THEN
      -- sclr and sset need to be inverted for this case, so crossing carry
      -- chain wont work
      RETURN FALSE;
    END IF;
    IF c_has_sset = 1 AND (c_has_q_c_out = 1 OR c_has_q_ovfl = 1) THEN
      -- sset is defined to set these registers high; this is incompatible with
      -- the absorbtion technique, which forces the carry chain (and therefore the
      -- inputs to these registers) low.
      RETURN FALSE;
    END IF;
    CASE cc_controller IS
      WHEN CC_NONE | CC_BYPASS => RETURN FALSE; -- No sync controls to be absorbed!
      WHEN CC_SCLR | CC_SSET | CC_SINIT => RETURN TRUE;
      WHEN CC_BYPASS_SCLR | CC_BYPASS_SSET | CC_BYPASS_SINIT =>
        -- carry-chain LUTs have 4 inputs already (a, b, bypass, and one of sclr/set/init)
        -- an ADD input as well will make a 5-input function and thus the space savings will be
        -- lost.
        IF enum_c_add_mode = MODE_ADDSUB THEN
          RETURN FALSE;
        END IF;
        -- if bypass is to override CE but sclr/sset/sinit not, CE is required as an input
        -- to the LUT (see i_reg_controls_special IF GENERATE section for more on this issue).
        -- Again it becomes a 5-input function and is no longer worthwhile.
        IF c_has_ce = 1 AND enum_c_sync_enable = CE_OVERRIDES_SYNC AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE THEN
          RETURN FALSE;
        END IF;
        RETURN TRUE;
      WHEN CC_SCLR_SSET =>
        -- Again, an ADD input will create a 5-input function
        IF enum_c_add_mode = MODE_ADDSUB THEN
          RETURN FALSE;
        END IF;
        RETURN TRUE;
      when CC_BYPASS_SCLR_SSET =>       --too many to be absorbed in LUT4
        return FALSE;
    END CASE;
    RETURN FALSE;
  END fn_need_sync_model;

  -- determines whether a simple adder carry chain (with no absorbtion of
  -- the sclr, sset, sinit controls) is required.
  FUNCTION fn_need_simple_model RETURN BOOLEAN IS
  BEGIN
    RETURN NOT fn_need_sync_model;
  END fn_need_simple_model;

  CONSTANT need_sync_model : BOOLEAN := fn_need_sync_model;
  CONSTANT need_simple_model : BOOLEAN := fn_need_simple_model;


  -- Within the simple model (the sync model does things its own way), there
  -- are three possible implementations of an addsub with BYPASS:
  -- 1) the simple one (works in some cases)
  -- 2) the loadable counter special case
  -- 3) the less simple one (works in all cases)
  -- these are described in more detail in the i_simple_model: -> i_bypass: IF GENERATE section below.

  -- use_simple_bypass is mutually exclusive with use_counter_bypass
  -- because use_simple_bypass requires variable b and
  -- use_counter_bypass requires constant b
  FUNCTION fn_use_simple_bypass RETURN BOOLEAN IS
  BEGIN
    IF enum_c_add_mode = MODE_ADD AND c_b_constant = 0 THEN
      RETURN TRUE;
    END IF;
    RETURN FALSE;
  END fn_use_simple_bypass;

  CONSTANT use_simple_bypass : BOOLEAN := fn_use_simple_bypass;

  FUNCTION fn_use_counter_bypass RETURN BOOLEAN IS
  BEGIN
    IF c_b_constant = 1
            AND (enum_c_add_mode = MODE_ADD OR enum_c_add_mode = MODE_SUB)
            AND c_has_c_in = 0 AND c_has_c_out = 0 AND c_has_q_c_out = 0
            AND c_has_bypass = 1 AND c_bypass_low = 0 THEN
      ASSERT use_simple_bypass = FALSE -- sanity check; can't happen
        REPORT "ERROR - addsub: Internal error; use_simple_bypass and use_counter_bypass?"
        SEVERITY FAILURE;
      RETURN TRUE;
    END IF;
    RETURN FALSE;
  END fn_use_counter_bypass;

  CONSTANT use_counter_bypass : BOOLEAN := fn_use_counter_bypass;

  -- purpose: calculates whether we need to generate the last carry-out
  -- (ie whether we need the top MUXCY or MULT_AND to generate carry(c_width - 1))
  -- (XST gets confused if it is generated and never used, and wastes an extra LUT)
  FUNCTION fn_need_carry_out RETURN BOOLEAN IS
  BEGIN
    IF   c_has_c_out = 1 OR c_has_q_c_out = 1
      OR c_has_ovfl  = 1 OR c_has_q_ovfl  = 1 THEN
        RETURN TRUE;
    END IF;
    RETURN FALSE;
  END fn_need_carry_out;
  constant need_carry_out : boolean := fn_need_carry_out;

  SIGNAL a_for_sum : STD_LOGIC_VECTOR (a'RANGE); -- for symmetry with b_for_sum (always equals a)
  SIGNAL b_for_sum : STD_LOGIC_VECTOR (b'RANGE); -- equiv to port b for nonconstant b; otherwise equiv to ci_b_value
  SIGNAL b_or_not_b : STD_LOGIC_VECTOR(b'RANGE); -- for subtraction

  -- outputs from the two addsub models
  -- although the simple and sync models are mutually exclusive, it's easier for them
  -- to use separate signals rather than use a general sum and carry signal for both.
  SIGNAL sum_simple : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
  SIGNAL carry_simple : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
  SIGNAL sum_sync   : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
  SIGNAL carry_sync   : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);

  SIGNAL c_in_i : STD_LOGIC := '0';
  SIGNAL add_i : STD_LOGIC := '0';

  -- the ce_i, sclr_i, etc signals are simply wired to the equivalent input port
  -- (if the generics say it is present) or tied to a constant value ('1' for CE,
  -- '0' for sclr/set/init). They are used to generate *_reg

  SIGNAL ce_i      : STD_LOGIC := '1';
  SIGNAL sclr_i    : STD_LOGIC := '0';
  SIGNAL sset_i    : STD_LOGIC := '0';
  SIGNAL sinit_i   : STD_LOGIC := '0';

  -- the ce_reg, sclr_reg etc controls are the signals which are provided to the
  -- reg_fd components which generate q, q_c_out, q_b_out and q_ovfl.

  SIGNAL ce_reg      : STD_LOGIC := '1';
  SIGNAL sclr_reg    : STD_LOGIC := '0';
  SIGNAL sset_reg    : STD_LOGIC := '0';
  SIGNAL sinit_reg   : STD_LOGIC := '0';

BEGIN
  ---------------------------------
  --Warnings suppression
  ---------------------------------
  i_no_c_has_ovfl: if (c_has_ovfl = 0) generate
    ovfl <= '0';
  end generate i_no_c_has_ovfl;
  i_no_c_has_q_ovfl: if (c_has_q_ovfl = 0) generate
    q_ovfl <= '0';
  end generate i_no_c_has_q_ovfl;
  i_no_c_has_c_out: if (c_has_c_out = 0) generate
    c_out <= '0';
  end generate i_no_c_has_c_out;
  i_no_c_has_q_c_out: if (c_has_q_c_out = 0) generate
    q_c_out <= '0';
  end generate i_no_c_has_q_c_out;
  i_no_c_has_s: if (c_has_s = 0) generate
    s <= (others => '0');
  end generate i_no_c_has_s;
  i_no_c_has_q: if (c_has_q = 0) generate
    q <= (others => '0');
  end generate i_no_c_has_q;
  
  
  --------------------- PREPARATION SECTION ------------------------
  --
  -- Converts external ports to internal signals and vice versa
  -- and generally deals with optional stuff.

  ----------------------------------
  -- connect inputs to internals
  ----------------------------------

  -- Generate a_for_sum
  a_for_sum <= a;

  -- Generate b_for_sum
  i_b_constant: IF c_b_constant = 1 GENERATE
    b_for_sum <= ci_b_value;
  END GENERATE i_b_constant;
  i_b_variable: IF c_b_constant = 0 GENERATE
    b_for_sum <= b;
  END GENERATE i_b_variable;

  -- b_or_not_b (along with c_in_i) handles the work done by subtractors and addsubs
  -- since (a - b) is equivalent to (a + (NOT b) + '1')
  b_or_not_b <= b_for_sum WHEN add_i = '1' ELSE NOT b_for_sum;

  -- Generate add_i
  i_add_adder: IF enum_c_add_mode = MODE_ADD GENERATE
    add_i <= '1';
  END GENERATE;
  i_add_subtracter: IF enum_c_add_mode = MODE_SUB GENERATE
    add_i <= '0';
  END GENERATE;
  i_add_addsub: IF enum_c_add_mode = MODE_ADDSUB GENERATE
    add_i <= add;
  END GENERATE;

  -- Generate c_in_i
  i_c_in_present: IF c_has_c_in = 1 GENERATE
    c_in_i <= c_in;
  END GENERATE i_c_in_present;
  i_c_in_implicit: IF c_has_c_in = 0 GENERATE
    c_in_i <= NOT add_i;
  END GENERATE i_c_in_implicit;

  -- generate ce_i, sclr_i, sset_i, sinit_i
  i_ce: IF c_has_ce = 1 GENERATE
    ce_i <= ce;
  END GENERATE i_ce;
  i_no_ce: IF c_has_ce = 0 GENERATE
    ce_i <= '1';
  END GENERATE i_no_ce;

  i_sclr: IF c_has_sclr = 1 GENERATE
    sclr_i <= sclr;
  END GENERATE i_sclr;
  i_no_sclr: IF c_has_sclr = 0 GENERATE
    sclr_i <= '0';
  END GENERATE i_no_sclr;

  i_sset: IF c_has_sset = 1 GENERATE
    sset_i <= sset;
  END GENERATE i_sset;
  i_no_sset: IF c_has_sset = 0 GENERATE
    sset_i <= '0';
  END GENERATE i_no_sset;

  i_sinit: IF c_has_sinit = 1 GENERATE
    sinit_i <= sinit;
  END GENERATE i_sinit;
  i_no_sinit: IF c_has_sinit = 0 GENERATE
    sinit_i <= '0';
  END GENERATE i_no_sinit;

  -- This section generates the ce_reg, sclr_reg, sset_reg and sinit_reg
  -- controls. In the simplest case, the only purpose is to ensure BYPASS
  -- overrides CE if enum_c_bypass_enable = BYPASS_OVERRIDES_CE; the rest
  -- of the work is done by the reg_fd baseblock.
  --
  -- There is, however, a little extra work when the sync controls are to be
  -- absorbed in the sync_model. Then they are handled entirely by the addsub,
  -- and enum_c_sync_enable must be dealt with here.
  --
  -- There is one special case (below) where the assumption made here,
  -- that synchronous controls always take priority over bypass, does not hold.
  i_reg_controls: IF NOT((c_has_sclr = 1 OR c_has_sset = 1 OR c_has_sinit = 1)
                    AND enum_c_sync_enable = CE_OVERRIDES_SYNC
                    AND c_has_bypass = 1
                    AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE
                    AND c_has_ce = 1) GENERATE
    sclr_reg <= sclr_i;
    sset_reg <= sset_i;
    sinit_reg <= sinit_i;
    i_ce_with_bypass: IF c_has_bypass = 1 AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE GENERATE
      -- if bypass is to override ce, it must force ce_reg high.
      i_ce_with_sync: IF need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE GENERATE
        -- because we are using the sync model we have to handle overriding of CE ourselves
        -- rather than leave the reg_fd block to do it
        i_bypass_high: IF c_bypass_low = 0 GENERATE
          ce_reg <= ce_i OR bypass OR sclr_i OR sset_i OR sinit_i;
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          ce_reg <= ce_i OR NOT bypass OR sclr_i OR sset_i OR sinit_i;
        END GENERATE i_bypass_low;
      END GENERATE i_ce_with_sync;
      i_ce_without_sync: IF NOT(need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE) GENERATE
        i_bypass_high: IF c_bypass_low = 0 GENERATE
          ce_reg <= ce_i OR bypass;
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          ce_reg <= ce_i OR NOT bypass;
        END GENERATE i_bypass_low;
      END GENERATE i_ce_without_sync;
    END GENERATE i_ce_with_bypass;
    i_ce_without_bypass: IF NOT(c_has_bypass = 1 AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE) GENERATE
      -- bypass may still be present; but it doesn't override ce.
      i_ce_with_sync: IF need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE GENERATE
        ce_reg <= ce_i OR sclr_i OR sset_i OR sinit_i;
      END GENERATE i_ce_with_sync;
      i_ce_without_sync: IF NOT(need_sync_model AND enum_c_sync_enable = SYNC_OVERRIDES_CE) GENERATE
        ce_reg <= ce_i;
      END GENERATE i_ce_without_sync;
    END GENERATE i_ce_without_bypass;
  END GENERATE i_reg_controls;

  i_reg_controls_special: IF (c_has_sclr = 1 OR c_has_sset = 1 OR c_has_sinit = 1)
                              AND enum_c_sync_enable = CE_OVERRIDES_SYNC
                              AND c_has_bypass = 1
                              AND enum_c_bypass_enable = BYPASS_OVERRIDES_CE
                              AND c_has_ce = 1 GENERATE
    -- As stated above, this is the special case where sync controls do not always
    -- override bypass. If CE is low, the sync controls should have no effect, but
    -- bypass should. if this circuit were implemented naively then bypass would
    -- simply drive ce_reg high; but then the synchronous controls would "steal"
    -- the control from them since they see a high CE.
    --
    -- This means sclr_reg and co need to be gated with ce_i.

    sclr_reg <= sclr_i AND ce_i;
    sset_reg <= sset_i AND ce_i;
    sinit_reg <= sinit_i AND ce_i;
    i_bypass_high: IF c_bypass_low = 0 GENERATE
      ce_reg <= ce_i OR bypass;
    END GENERATE i_bypass_high;
    i_bypass_low: IF c_bypass_low = 1 GENERATE
      ce_reg <= ce_i OR NOT bypass;
    END GENERATE i_bypass_low;
  END GENERATE i_reg_controls_special;

  -----------------------------------
  -- connect internals to outputs
  -----------------------------------

  -- carry-out generation

  i_c_out: IF c_has_c_out = 1 GENERATE
    c_out <= carry_simple(c_width - 1); -- carry out from top bit
  END GENERATE i_c_out;

  i_q_c_out: IF c_has_q_c_out = 1 GENERATE
    -- generate a register to store q_c_out

    i_simple: IF NOT need_sync_model GENERATE
      sub_q_cout : IF c_add_mode = 1 GENERATE
        signal claused_aset : std_logic := '0';
      begin
        claused_aset <= aset when aclr = '0' else '0';
        --on reset, q_c_out should go to 1 for subtractor
        q_c_outreg : c_reg_fd_v12_0_3_viv
          GENERIC MAP (
            c_width         => 1,
            c_ainit_val     => "1",     -- init gets treated as set here to mimic sclr. Yes, I'm confused too.
            c_sinit_val     => "1",
            c_sync_priority => 1-c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
--            c_has_aclr      => c_has_aclr,
--            c_has_aset      => c_has_aset,
            c_has_aclr      => c_has_aset,  --deliberate crosswiring
            c_has_aset      => c_has_aclr,
            c_has_ainit     => c_has_ainit,
            c_has_sset      => c_has_sclr,  --deliberate crosswiring
            c_has_sclr      => c_has_sset,
            c_has_sinit     => c_has_sinit,
            c_enable_rlocs  => 0
            )
          PORT MAP (
            clk   => clk,
            ce    => ce_reg,
            ainit => ainit,
--            aclr  => aclr,
--            aset  => aset,
            aclr  => claused_aset,
            aset  => aclr,
            sinit => sinit_reg,
            sset  => sclr_reg,          --deliberate crosswiring
            sclr  => sset_reg,
            d(0)  => carry_simple(c_width-1),
            q(0)  => q_c_out
            );
      END GENERATE sub_q_cout;
      add_q_cout: IF c_add_mode /= 1 GENERATE
        q_c_outreg : c_reg_fd_v12_0_3_viv
          GENERIC MAP (
            c_width         => 1,
            c_ainit_val     => "0",     -- init gets treated as clear
            c_sinit_val     => "0",
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_ainit     => c_has_ainit,
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_sinit     => c_has_sinit,
            c_enable_rlocs  => 0
            )
          PORT MAP (
            clk   => clk,
            ce    => ce_reg,
            ainit => ainit,
            aclr  => aclr,
            aset  => aset,
            sinit => sinit_reg,
            sclr  => sclr_reg,
            sset  => sset_reg,
            d(0)  => carry_simple(c_width-1),
            q(0)  => q_c_out
            );
      END GENERATE add_q_cout;
    END GENERATE i_simple;

    i_sync: IF need_sync_model GENERATE
      q_c_outreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,
          c_ainit_val     => "0", -- init gets treated as clear
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => 0, -- sync controls have been absorbed
          c_has_sset      => 0,
          c_has_sinit     => 0,
          c_enable_rlocs  => 0
          )
        PORT MAP (
          clk    => clk,
          ce     => ce_reg,
          ainit  => ainit,
          aclr   => aclr,
          aset   => aset,
          d(0)   => carry_sync(c_width-1),
          q(0)   => q_c_out
          );
    END GENERATE i_sync;
  END GENERATE i_q_c_out;

  -- overflow generation

  -- the previous implementation used an XORCY to calculate overflow.
  -- Using a LUT is generally faster; so this is what is done here.
  -- The only family tested to have the XORCY method be faster was
  -- Spartan-II, and it was a difference of 4 MHz. With more modern
  -- architectures, the LUT was markedly better.
  -- The maplog generally looks ever so slightly worse this way, because
  -- an extra LUT is used; however, if you use an XORCY then you can't
  -- use the LUT in the same half-slice for anything else - both designs
  -- use the same amount of resource.
  i_ovfl: IF c_has_ovfl = 1 GENERATE
    ovfl <= carry_simple(c_width - 1) XOR carry_simple(c_width - 2);
    --ovfl <= ovfl_i;
  END GENERATE i_ovfl;
  i_q_ovfl: IF c_has_q_ovfl = 1 GENERATE
    -- generate a register to store q_ovfl

    i_simple: IF NOT(need_sync_model) GENERATE
      SIGNAL d_ovfl : STD_LOGIC;
    BEGIN
      d_ovfl <= carry_simple(c_width - 1) XOR carry_simple(c_width - 2);
      q_ovflreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,
          c_ainit_val     => "0", -- init gets treated as clear
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => c_has_sinit,
          c_enable_rlocs  => 0
          )
        PORT MAP (
          clk    => clk,
          ce     => ce_reg,
          ainit  => ainit,
          aclr   => aclr,
          aset   => aset,
          sinit  => sinit_reg,
          sclr   => sclr_reg,
          sset   => sset_reg,
          d(0)   => d_ovfl,
          q(0)   => q_ovfl
          );
    END GENERATE i_simple;

    i_sync: IF need_sync_model GENERATE
      SIGNAL d_ovfl : STD_LOGIC;
    BEGIN
      d_ovfl <= carry_sync(c_width - 1) XOR carry_sync(c_width - 2);
      q_ovflreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,
          c_ainit_val     => "0", -- init gets treated as clear
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => 0, -- sync controls have been absorbed
          c_has_sset      => 0,
          c_has_sinit     => 0,
          c_enable_rlocs  => 0
          )
        PORT MAP (
          clk    => clk,
          ce     => ce_reg,
          ainit  => ainit,
          aclr   => aclr,
          aset   => aset,
          d(0)   => d_ovfl,
          q(0)   => q_ovfl
          );
    END GENERATE i_sync;
  END GENERATE i_q_ovfl;

  -- main output generation (S and Q)

  i_s: IF c_has_s = 1 GENERATE
    s <= sum_simple;
  END GENERATE i_s;

  i_q: IF c_has_q = 1 GENERATE
    i_simple: IF NOT(need_sync_model) GENERATE
      qreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => q'LENGTH,
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
          c_enable_rlocs  => 0
        )
        PORT MAP (
          clk   => clk,
          ce    => ce_reg,
          ainit => ainit,
          aclr  => aclr,
          aset  => aset,
          sinit => sinit_reg,
          sclr  => sclr_reg,
          sset  => sset_reg,
          d     => sum_simple(c_width-1 DOWNTO 0),
          q     => q
        );
    END GENERATE i_simple;

    i_sync: IF need_sync_model GENERATE
      qreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => q'LENGTH,
          c_ainit_val     => c_ainit_val,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => c_has_ainit,
          c_has_sclr      => 0, -- sync controls have been absorbed
          c_has_sset      => 0,
          c_has_sinit     => 0,
          c_enable_rlocs  => 0
        )
        PORT MAP (
          clk   => clk,
          ce    => ce_reg,
          ainit => ainit,
          aclr  => aclr,
          aset  => aset,
          d     => sum_sync,
          q     => q
        );
    END GENERATE i_sync;
  END GENERATE i_q;

  ------------------ END OF PREPARATION SECTION --------------------

  ------------------------- MAIN SECTION ---------------------------

  -- generate sum

  -- This section is a bit difficult to read; this is because the
  -- carry-chain has been instantiated, while the function which feeds
  -- it is described in RTL. This means that neither bit gives you
  -- the full picture...

  -- halfsum is the work done by the LUTs which feed the carry chain.
  -- so it's slightly more than a "real" halfsum - it handles BYPASS
  -- and (especially in the sync model) other, more esoteric things.

  -- di is a vector holding all the signals which will go into the di
  -- port of the MUXCYs. Usually it will just be a_for_sum but sometimes
  -- a MULT_AND will be used (esp. with bypass), and when B is constant,
  -- this will be exploited so that any logic generating A can be absorbed
  -- into the halfsum LUT.

  -- There are two models here: simple_model and sync_model.
  -- Note that when there are sclr/sset/sinit inputs which
  -- cannot use the primitive's ports (because the user has requested
  -- aclr/aset/ainit which are using them instead) the synchronous
  -- controls have to be implemented by modifying the value of sum.
  --
  -- The sync_model is used when it is possible to do this in the
  -- same LUTs which perform the addition operation; however, because
  -- the sync controls must be converted to active-low first, there
  -- are still just as many layers of logic. It is therefore purely
  -- a slice-saving measure.
  --
  -- The simple_model is used whenever the sync_model isn't worth it
  -- (eg when asynchronous outputs are required which should be unsullied
  -- by the sclr/sset/sinit controls, or when the sync_model cannot actually
  -- save any slices due to the particular circumstances.)
  -- The simple_model is simple only relative to the sync_model; sum_simple is the result of
  -- the addition or subtraction, or it is B when BYPASS is present and active,
  -- whereas sum_sync takes sclr/sset/sinit into account as well.

  i_simple_model: IF need_simple_model GENERATE
    SIGNAL halfsum : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
    SIGNAL di    : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0); -- vector of DI input values for the MUXCYs.
                                                                -- (see a diagram of a slice for a better explanation)
    SIGNAL c_in_gated : STD_LOGIC; -- some models want to muck about with the carry-in signal
                                   -- (specifically, in i_bypass_counter where it is tied to '1'
                                   -- and in the other bypass models where it is disabled when bypass is active)
                                   -- mostly, though, c_in_gated is just c_in_i.

  BEGIN

    -- bypass invokes some slightly more complex models
    i_bypass: IF c_has_bypass = 1 GENERATE
      i_bypass_simple: IF use_simple_bypass GENERATE
        -- Simple bypass model:
        -- this works because b_for_sum = port b
        -- and because b is passed directly to the add function
        -- (because the addsub is in adder-only mode)
        -- The equation is written:
        -- sum <= a + b WHEN bypass = '0' ELSE "0" + b;
        -- and B is used for the di input to the MUXCYs

        -- Generate c_in_gated
        -- Disable carry-in when bypass is active
        i_c_in_gated_bypass_high: IF c_bypass_low = 0 GENERATE
          c_in_gated <= c_in_i AND NOT bypass;
        END GENERATE i_c_in_gated_bypass_high;
        i_c_in_gated_bypass_low: IF c_bypass_low = 1 GENERATE
          c_in_gated <= c_in_i AND bypass;
        END GENERATE i_c_in_gated_bypass_low;

        -- Generate halfsum

        i_bypass_high: IF c_bypass_low = 0 GENERATE
          halfsum <= a_for_sum XOR b_for_sum WHEN bypass = '0' ELSE b;
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          halfsum <= a_for_sum XOR b_for_sum WHEN bypass = '1' ELSE b;
        END GENERATE i_bypass_low;

        -- Generate di

        di <= b_for_sum;

      END GENERATE i_bypass_simple;



      i_bypass_counter: IF use_counter_bypass
                    AND NOT use_simple_bypass GENERATE -- this extra check is for safety; it's (hopefully!) unnecessary
        SIGNAL bypassvector: STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      BEGIN
        -- loadable counter special case
        -- this works because the addsub is set to add a constant
        -- note that an adder can be written as
        --    sum <= a + b + c_in
        -- where a and b are vectors and c_in is 1 single bit.
        --
        -- this means the equation can be rewritten:
        --
        -- if bypass = '0'
        --    sum <= a + ((const-1) OR bypassvector) + 1; -- equiv to (a + const-1 + 1) since bypass = 0
        -- else
        --    sum <= b + ((const-1) OR bypassvector) + 1; -- equiv to (b + (-1) + 1) since bypass = 1;
        -- end if
        --
        -- where bypassvector is a STD_LOGIC_VECTOR with every value equal to BYPASS
        --
        -- so ((const-1) OR bypassvector) is used for di because this operation can be optimised
        -- at compile-time to a vector such that each element is constant '1' or bypass.
        -- This is provided that bypass is active-high. (this is checked in use_counter_bypass)

        -- the use of the carry-in prevents a user carry-in signal. (c_has_c_in = 0)
        -- this will generate a spurious carry-out signal when bypass is high; so carry-out is banned.
        -- it does not affect overflow, however.
        --
        -- the same trick works for subtractors by transforming the number to be subtracted into
        -- the equivalent number to be added. So if b_for_sum = (- constant) we get (constant - 1)
        -- from the expression (NOT b_for_sum).

        i_adder: IF enum_c_add_mode = MODE_ADD GENERATE
          CONSTANT ci_b_minus_one : STD_LOGIC_VECTOR := STD_LOGIC_VECTOR(UNSIGNED(ci_b_value) - "1");
        BEGIN
          -- Generate c_in_gated

          c_in_gated <= '1';

          -- Generate halfsum

          -- halfsum <= a + (const - 1) when bypass = '0' ELSE b + (-1);
          bypassvector <= (OTHERS => bypass);
          halfsum <= a_for_sum XOR ci_b_minus_one WHEN bypass = '0' ELSE b XOR bypassvector;

          -- Generate di

          di <= ci_b_minus_one OR bypassvector;

        END GENERATE i_adder;


        i_subtractor: IF enum_c_add_mode = MODE_SUB GENERATE
          -- Generate c_in_gated

          c_in_gated <= '1';

          -- Generate halfsum

          -- halfsum <= a + 0 when bypass = '0' ELSE b - 1;
          bypassvector <= (OTHERS => bypass);
          halfsum <= a_for_sum XOR (NOT b_for_sum) WHEN bypass = '0' ELSE b XOR bypassvector;

          -- Generate di

          di <= (NOT b_for_sum) OR bypassvector;

        END GENERATE i_subtractor;

      END GENERATE i_bypass_counter;



      i_bypass_other: IF NOT use_simple_bypass AND NOT use_counter_bypass GENERATE
        SIGNAL carry_chain_active : STD_LOGIC := '1'; -- when '0', the whole carry chain is forced low through the use of MULT_ANDs.
      BEGIN
        -- general model which mops up anything which isn't a special case.
        -- uses a similar idea to the sync models below; bypass is (if necessary)
        -- converted to active-low and this becomes the carry_chain_active signal.
        --
        -- the carry_chain_active signal then masks the di signals using AND gates
        -- (Either dedicated MULT_ANDs, or calculated at compile time for constant B),
        -- and the carry-in is gated with bypass. This means the carry-chain is
        -- set to all zeroes when bypass is active, and so the output of the LUTs
        -- is the output of the whole system. The LUTs then just output B, the bypass value.
        --
        -- first need to generate the carry_chain_active signal
        -- (here equivalent to active-low bypass)
        -- see i_sync_model comments for why a LUT is being instantiated rather than inferred
        i_bypass_high: IF c_bypass_low = 0 GENERATE
          cc_activelut: LUT1
            GENERIC MAP (
              INIT => b"01" -- inverter
            )
            PORT MAP (
              I0 => bypass,
              O  => carry_chain_active
            );

          -- Generate c_in_gated
          c_in_gated <= c_in_i AND NOT bypass; -- disable carry-in when bypass is active
        END GENERATE i_bypass_high;
        i_bypass_low: IF c_bypass_low = 1 GENERATE
          carry_chain_active <= bypass;
          -- Generate c_in_gated
          c_in_gated <= c_in_i AND bypass; -- disable carry-in when bypass is active
        END GENERATE i_bypass_low;


        -- Generate halfsum

        halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE b;

        -- Generate di
        i_di_b_constant: IF c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB GENERATE
          -- Constant B (and not adder/subtractor)
          -- Another special case!
          -- What is achieved here is the ability to absorb any logic on the A path
          -- by using b_or_not_b instead of a_for_sum for the di vector.
          -- This will not be any faster in characterization, since there is no logic to absorb!
          -- (for adder/subtractors, b_or_not_b is no longer a constant, and using it
          -- for di would generate an extra layer of logic; hence a_for_sum is used instead.)

          digen: FOR i IN 0 TO c_width - 1 GENERATE
            di(i) <= b_or_not_b(i) AND carry_chain_active; -- Carry chain set to '0' when carry_chain_active = '0'
          END GENERATE digen;
        END GENERATE i_di_b_constant;
        i_di_b_variable: IF NOT(c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB) GENERATE
          -- variable B
          -- use MULT_ANDs to generate di
          -- All but top bit
          i_gt_1 : if c_width > 1 generate
            multandgen : for i in 0 to c_width - 2 generate
              carrymultand : MULT_AND
                port map (
                  I0 => a_for_sum(i),
                  I1 => carry_chain_active,
                  LO => di(i)
                  );
            end generate multandgen;
          end generate i_gt_1;

          -- top bit (not always needed)
          multandtop: IF need_carry_out GENERATE
            carrymultand: MULT_AND
              PORT MAP (
                I0 => a_for_sum(c_width - 1),
                I1 => carry_chain_active,
                LO => di(c_width - 1)
              );
          END GENERATE multandtop;
        END GENERATE i_di_b_variable;

      END GENERATE i_bypass_other;

    END GENERATE i_bypass;


    i_no_bypass: IF c_has_bypass = 0 GENERATE
      -- Generate c_in_gated

      c_in_gated <= c_in_i;

      -- Generate halfsum

      halfsum <= a_for_sum XOR b_or_not_b;

      -- Generate di
      i_di_b_constant: IF c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB GENERATE
        -- Constant B (and not adder/subtractor)
        -- Yet another special case!
        -- What is achieved here is the ability to absorb any logic on the A path
        -- by using b_or_not_b instead of a_for_sum for the di vector.
        -- This will not be any faster in characterization, since there is no logic to absorb!
        -- (for adder/subtractors, b_or_not_b is no longer a constant, and using it
        -- for di would generate an extra layer of logic; hence a_for_sum is used instead.)

        di <= b_or_not_b;
      END GENERATE i_di_b_constant;
      i_di_b_variable: IF NOT(c_b_constant = 1 AND enum_c_add_mode /= MODE_ADDSUB) GENERATE
        -- variable B
        di <= a_for_sum;
      END GENERATE i_di_b_variable;
    END GENERATE i_no_bypass;

    -- LSB of carry-chain
    -- special case because of the carry-in
    i_need_mux: if (c_width >1) or ((c_width= 1) and need_carry_out) generate
      carrymux0: MUXCY
        PORT MAP(
          di => di(0),
          ci => c_in_gated,
          s  => halfsum(0),
          o  => carry_simple(0)
          );
    end generate i_need_mux;

    carryxor0: XORCY
      PORT MAP(
        li => halfsum(0),
        ci => c_in_gated,
        o  => sum_simple(0)
      );

    i_gt_1 : if c_width > 1 generate
      -- MSB of carry-chain
      -- special case because of the carry-out

      -- always need the XORCY
      carryxortop : XORCY
        port map(
          li => halfsum(c_width - 1),
          ci => carry_simple(c_width - 2),
          o  => sum_simple(c_width - 1)
          );

      -- only need the MUXCY if we're using the carry-out
      muxtop : if need_carry_out generate
        carrymuxtop : MUXCY
          port map(
            di => di(c_width - 1),
            ci => carry_simple(c_width - 2),
            s  => halfsum(c_width - 1),
            o  => carry_simple(c_width - 1)
            );

      end generate muxtop;

      -- rest of carry-chain
      carrychaingen : for i in 1 to c_width - 2 generate

        carrymux : MUXCY
          port map(
            di => di(i),
            ci => carry_simple(i-1),
            s  => halfsum(i),
            o  => carry_simple(i)
            );

        carryxor : XORCY
          port map(
            li => halfsum(i),
            ci => carry_simple(i-1),
            o  => sum_simple(i)
            );
      end generate carrychaingen;

    end generate i_gt_1;
  END GENERATE i_simple_model;









  -------------------- SYNC MODEL STARTS HERE ----------------------

  -- synchronous model
  --
  -- This is used where one or more of SCLR, SSET and SINIT can be absorbed
  -- into the carry-chain LUTs. They are first converted to active-low to
  -- create the carry_chain_active signal, then this is used with the dedicated
  -- MULT_AND gates to set the carry-chain to all zeroes so that the LUT can
  -- simply output the raw result required.
  --
  -- The LUTs which generate carry_chain_active are instantiated rather than
  -- inferred. This is because if they are inferred then XST tries to optimise
  -- them away and use the raw (active-high) sclr/set/init signal for the LUT
  -- instead. It doesn't realise that it gets carry_chain_active as a signal to
  -- LUT anyway (because it is also going to the MULT_AND) so the LUT ends up
  -- with two redundant signals. In some cases this redundancy can push it up
  -- to a 5-input function, resulting in an extra LUT per bit which is completely
  -- unnecessary. Instantiating the LUTs stops XST trying to be too clever for
  -- its own good.
  i_sync_model: IF need_sync_model GENERATE
    SIGNAL carry_chain_active : STD_LOGIC;
      -- halfsum is something of a misnomer; it includes the effects of sync controls or bypass
      -- but is otherwise the traditional A xor B.
    SIGNAL halfsum : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0);
    SIGNAL di    : STD_LOGIC_VECTOR (c_width - 1 DOWNTO 0); -- vector of DI input values for the MUXCYs.
    SIGNAL c_in_gated : STD_LOGIC; -- allows carry_chain_active to disable the carry-chain
  BEGIN
    -- sanity checks
    ASSERT c_has_sclr = 1 OR c_has_sset = 1 OR c_has_sinit = 1
      REPORT "ERROR - addsub: Internal error; tried to absorb signals which don't exist"
      SEVERITY FAILURE;
    ASSERT cc_controller /= CC_NONE AND cc_controller /= CC_BYPASS -- should have been caught by need_sync_model
      REPORT "ERROR - addsub: Internal error; invalid value returned by cc_controller"
      SEVERITY FAILURE;

    i_sclr: IF cc_controller = CC_SCLR GENERATE
      -- generate carry_chain_active
      cc_activelut: LUT1
        GENERIC MAP (
          INIT => b"01" -- inverter
        )
        PORT MAP (
          I0 => sclr,
          O  => carry_chain_active
        );

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sclr);

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE (OTHERS => '0');

    END GENERATE i_sclr;

    i_sset: IF cc_controller = CC_SSET GENERATE
      -- generate carry_chain_active
      cc_activelut: LUT1
        GENERIC MAP (
          INIT => b"01" -- inverter
        )
        PORT MAP (
          I0 => sset,
          O  => carry_chain_active
        );

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sset);

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE (OTHERS => '1');

    END GENERATE i_sset;

    i_sinit: IF cc_controller = CC_SINIT GENERATE
      -- generate carry_chain_active
      cc_activelut: LUT1
        GENERIC MAP (
          INIT => b"01" -- inverter
        )
        PORT MAP (
          I0 => sinit,
          O  => carry_chain_active
        );

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sinit);

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1' ELSE ci_sinit_val;

    END GENERATE i_sinit;

    -- sclr + sset to be absorbed
    -- the following must be true:
    -- the module is not in adder/subtractor mode
    -- the module has no BYPASS signal
    -- When absorbing both sclr and sset, an extra signal is needed to distinguish between them.
    i_sclr_sset: IF cc_controller = CC_SCLR_SSET GENERATE
      SIGNAL set_or_clear : STD_LOGIC; -- High = sset, low = sclr
      CONSTANT E_SET   : STD_LOGIC := '1'; -- set_or_clear must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_CLEAR : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      cc_activelut: LUT2
        GENERIC MAP (
          INIT => b"0001" -- nor gate
        )
        PORT MAP (
          I0 => sset,
          I1 => sclr,
          O  => carry_chain_active
        );

      -- Generate c_in_gated
      c_in_gated <= c_in_i AND (NOT sclr) AND (NOT sset);

      i_clear_over_set: IF enum_c_sync_priority = RESET_OVERRIDES_SET GENERATE
        set_or_clear <= E_CLEAR WHEN sclr = '1' ELSE E_SET;
      END GENERATE i_clear_over_set;
      i_set_over_clear: IF enum_c_sync_priority = SET_OVERRIDES_RESET GENERATE
        set_or_clear <= E_SET WHEN sset = '1' ELSE E_CLEAR;
      END GENERATE i_set_over_clear;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '0') WHEN set_or_clear = E_CLEAR
                     ELSE (OTHERS => '1');

    END GENERATE i_sclr_sset;

    -- bypass + sclr to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sclr, an extra signal is needed to distinguish between them.
    i_bypass_sclr: IF cc_controller = CC_BYPASS_SCLR GENERATE
      SIGNAL bypass_or_clear : STD_LOGIC; -- High = bypass, low = sclr
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_clear must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_CLEAR  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        cc_activelut: LUT2
          GENERIC MAP (
            INIT => b"0001" -- carry_chain_active <= (NOT bypass) AND (NOT sclr)
          )
          PORT MAP (
            I0 => bypass,
            I1 => sclr,
            O  => carry_chain_active
          );
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND (NOT sclr);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        cc_activelut: LUT2
          GENERIC MAP (
            INIT => b"0010" -- carry_chain_active <= bypass AND NOT sclr
          )
          PORT MAP (
            I0 => bypass,
            I1 => sclr,
            O  => carry_chain_active
          );
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND bypass AND (NOT sclr);
      END GENERATE i_bypass_low;

      -- Implicitly assumes that SCLR _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_clear <= E_CLEAR WHEN sclr = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '0') WHEN bypass_or_clear = E_CLEAR
                     ELSE b;

    END GENERATE i_bypass_sclr;

    -- bypass + sset to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sset, an extra signal is needed to distinguish between them.
    i_bypass_sset: IF cc_controller = CC_BYPASS_SSET GENERATE
      SIGNAL bypass_or_set : STD_LOGIC; -- High = bypass, low = sset
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_set must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_SET  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        cc_activelut: LUT2
          GENERIC MAP (
            INIT => b"0001" -- carry_chain_active <= (NOT bypass) AND (NOT sset)
          )
          PORT MAP (
            I0 => bypass,
            I1 => sset,
            O  => carry_chain_active
          );
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND (NOT sset);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        cc_activelut: LUT2
          GENERIC MAP (
            INIT => b"0010" -- carry_chain_active <= bypass AND NOT sset
          )
          PORT MAP (
            I0 => bypass,
            I1 => sset,
            O  => carry_chain_active
          );
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND bypass AND (NOT sset);
      END GENERATE i_bypass_low;

      -- Implicitly assumes that SSET _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_set <= E_SET WHEN sset = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE (OTHERS => '1') WHEN bypass_or_set = E_SET
                     ELSE b;

    END GENERATE i_bypass_sset;

    -- bypass + sinit to be absorbed
    -- the module must not be in adder/subtractor mode
    -- When absorbing both bypass and sinit, an extra signal is needed to distinguish between them.
    i_bypass_sinit: IF cc_controller = CC_BYPASS_SINIT GENERATE
      SIGNAL bypass_or_init : STD_LOGIC; -- High = bypass, low = sinit
      CONSTANT E_BYPASS : STD_LOGIC := '1'; -- bypass_or_init must still be a STD_LOGIC, but treat it like an enumeration
      CONSTANT E_INIT  : STD_LOGIC := '0';
    BEGIN
      -- generate carry_chain_active
      i_bypass_high: IF c_bypass_low = 0 GENERATE
        cc_activelut: LUT2
          GENERIC MAP (
            INIT => b"0001" -- carry_chain_active <= (NOT bypass) AND (NOT sinit)
          )
          PORT MAP (
            I0 => bypass,
            I1 => sinit,
            O  => carry_chain_active
          );
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND (NOT bypass) AND (NOT sinit);
      END GENERATE i_bypass_high;

      i_bypass_low: IF c_bypass_low = 1 GENERATE
        cc_activelut: LUT2
          GENERIC MAP (
            INIT => b"0010" -- carry_chain_active <= bypass AND NOT sinit
          )
          PORT MAP (
            I0 => bypass,
            I1 => sinit,
            O  => carry_chain_active
          );
        -- Generate c_in_gated
        c_in_gated <= c_in_i AND bypass AND (NOT sinit);
      END GENERATE i_bypass_low;

      -- Implicitly assumes that sinit _always_ overrides BYPASS
      -- this is okay; it was checked in need_sync_model
      bypass_or_init <= E_INIT WHEN sinit = '1' ELSE E_BYPASS;

      -- generate halfsum
      halfsum <= a_for_sum XOR b_or_not_b WHEN carry_chain_active = '1'
                     ELSE ci_sinit_val WHEN bypass_or_init = E_INIT
                     ELSE b;

    END GENERATE i_bypass_sinit;


    -- code common to all sync models

    -- Generate c_in_gated
    -- the following equation is what the previous sections
    -- should have generated. Alas, while the following assignment
    -- is nice and simple, it results in an unnecessary 2 logic layers
    -- since carry_chain_active is generated by instantiating LUTs.
    -- c_in_gated <= c_in_i AND carry_chain_active;
    --
    -- This comment is left in to aid understanding; but the generation of
    -- c_in_gated has moved to the individual sections above.

    -- LSB of carry chain
    carrymultand: MULT_AND
      PORT MAP (
        I0 => a_for_sum(0),
        I1 => carry_chain_active,
        LO => di(0)
      );

    carrymux0: MUXCY
      PORT MAP(
        di => di(0),
        ci => c_in_gated,
        s  => halfsum(0),
        o  => carry_sync(0)
      );

    carryxor0: XORCY
      PORT MAP(
        li => halfsum(0),
        ci => c_in_gated,
        o  => sum_sync(0)
      );

    i_gt_1 : if c_width > 1 generate
    -- MSB of carry-chain
    -- special case because of the carry-out

    -- always need the XORCY
      carryxortop : XORCY
        port map(
          li => halfsum(c_width - 1),
          ci => carry_sync(c_width - 2),
          o  => sum_sync(c_width - 1)
          );

      -- only need the MULT_AND and MUXCY if we're using the carry-out
      carrytop : if need_carry_out generate
        carrymultandtop : MULT_AND
          port map (
            I0 => a_for_sum(c_width - 1),
            I1 => carry_chain_active,
            LO => di(c_width - 1)
            );

        carrymuxtop : MUXCY
          port map(
            di => di(c_width - 1),
            ci => carry_sync(c_width - 2),
            s  => halfsum(c_width - 1),
            o  => carry_sync(c_width - 1)
            );

      end generate carrytop;

    end generate i_gt_1;

    -- rest of carry-chain
    i_gt_2 : if c_width > 2 generate
      carrychaingen : for i in 1 to c_width - 2 generate

        carrymultand : MULT_AND
          port map (
            I0 => a_for_sum(i),
            I1 => carry_chain_active,
            LO => di(i)
            );

        carrymux : MUXCY
          port map(
            di => di(i),
            ci => carry_sync(i-1),
            s  => halfsum(i),
            o  => carry_sync(i)
            );

        carryxor : XORCY
          port map(
            li => halfsum(i),
            ci => carry_sync(i-1),
            o  => sum_sync(i)
            );
      end generate carrychaingen;

    end generate i_gt_2;
  END GENERATE i_sync_model;

  ---------------------- END OF MAIN SECTION -----------------------

END rtl;



-- $Id: c_addsub_v12_0_10_fabric_legacy.vhd,v 1.5 2010/03/19 10:44:16 julian Exp $
-------------------------------------------------------------------------------
-- $Header
--
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
--
---------------------------------------------------------------
-- Synthesizable model
---------------------------------------------------------------
-- Raison d'etre
--

--library ieee;
--use ieee.std_logic_1164.all;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

--LIBRARY c_addsub_v9_1;
--USE c_addsub_v9_1.c_addsub_v9_1_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_addsub_v12_0_10;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg.ALL;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg_legacy.ALL;

--LIBRARY baseblox_utils_v9_1;
--USE baseblox_utils_v9_1.prims_constants_v9_1.ALL;
--USE baseblox_utils_v9_1.prims_utils_v9_1.ALL;
--USE baseblox_utils_v9_1.pkg_baseblox_v9_1.ALL;

--LIBRARY c_reg_fd_v9_1;
--USE c_reg_fd_v9_1.c_reg_fd_v9_1_viv_comp.ALL;

--LIBRARY c_reg_fd_v12_0_3;
--USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

--library c_addsub_v12_0_10;
--use c_addsub_v12_0_10.c_addsub_v12_0_10_pkg.all;

--LIBRARY unisim;
--USE unisim.vcomponents.ALL;

-- use derived() from baseblox_utils now - iputils deprecated
--LIBRARY baseblox_utils_v9_1;
--USE baseblox_utils_v9_1.prims_utils_v9_1.ALL;

--library c_addsub_v12_0_10;
--use c_addsub_v12_0_10.pkg_addsub_v9_1.all;

entity c_addsub_v12_0_10_fabric_legacy is
  generic(
    c_family        : string;
    c_width         : integer;
    c_add_mode      : integer;
    c_b_constant    : integer;
    ci_b_value      : std_logic_vector;
    c_ainit_val     : string;
    c_sinit_val     : string;
    c_bypass_enable : integer;
    c_bypass_low    : integer;
    c_sync_enable   : integer;
    c_sync_priority : integer;
    c_has_s         : integer;
    c_has_q         : integer;
    c_has_c_in      : integer;  -- borrow in and borrow out is handled through c_in and c_out ports to make life easier
    c_has_c_out     : integer;
    c_has_q_c_out   : integer;
    c_has_ovfl      : integer;
    c_has_q_ovfl    : integer;
    c_has_ce        : integer;
    c_has_bypass    : integer;
    c_has_aclr      : integer;
    c_has_aset      : integer;
    c_has_ainit     : integer;
    c_has_sclr      : integer;
    c_has_sset      : integer;
    c_has_sinit     : integer
    );
  port (
    a       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- input value
    b       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');  -- input value
    clk     : in  std_logic                            := '0';  -- clock
    add     : in  std_logic                            := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
    c_in    : in  std_logic                            := '0';  -- carry in
    ce      : in  std_logic                            := '1';  -- clock enable
    bypass  : in  std_logic                            := '0';  -- sync load of b into reg
    aclr    : in  std_logic                            := '0';  -- asynch init.
    aset    : in  std_logic                            := '0';  -- asynch set.
    ainit   : in  std_logic                            := '0';  -- asynch init.
    sclr    : in  std_logic                            := '0';  -- synch init.
    sset    : in  std_logic                            := '0';  -- synch set.
    sinit   : in  std_logic                            := '0';  -- synch init.
    ovfl    : out std_logic;
    c_out   : out std_logic;
    q_ovfl  : out std_logic;
    q_c_out : out std_logic;
    s       : out std_logic_vector(c_width - 1 downto 0);  -- asynch output value
    q       : out std_logic_vector(c_width - 1 downto 0)  -- synch output value
    );
end c_addsub_v12_0_10_fabric_legacy;

architecture synth of c_addsub_v12_0_10_fabric_legacy is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  constant ci_has_lut6 : boolean := true;  -- always true for 7 Series and later
  constant ci_has_lut4 : boolean := not ci_has_lut6;

  signal ovfl_lut4    : std_logic;
  signal c_out_lut4   : std_logic;
  signal q_ovfl_lut4  : std_logic;
  signal q_c_out_lut4 : std_logic;
  signal s_lut4       : std_logic_vector(c_width - 1 downto 0);  -- asynch output value
  signal q_lut4       : std_logic_vector(c_width - 1 downto 0);  -- synch output value

begin
  i_lut6: if ci_has_lut6 generate
    i_lut6_addsub: c_addsub_v12_0_10_lut6_legacy
      GENERIC MAP (
        c_width         => c_width,
        c_add_mode      => c_add_mode,
        c_b_constant    => c_b_constant,
        ci_b_value      => ci_b_value,
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => c_sinit_val,
        c_bypass_enable => c_bypass_enable,
        c_bypass_low    => c_bypass_low,
        c_sync_enable   => c_sync_enable,
        c_sync_priority => c_sync_priority,
        c_has_s         => c_has_s,
        c_has_q         => c_has_q,
        c_has_c_in      => c_has_c_in,      --BOOLEAN'POS(c_has_c_in = 1 OR c_has_b_in = 1),
        c_has_c_out     => c_has_c_out,     --BOOLEAN'POS(c_has_c_out = 1 OR c_has_b_out = 1),
        c_has_q_c_out   => c_has_q_c_out,   --BOOLEAN'POS(c_has_q_c_out = 1 OR c_has_q_b_out = 1),
        c_has_ovfl      => c_has_ovfl,
        c_has_q_ovfl    => c_has_q_ovfl,
        c_has_ce        => c_has_ce,
        c_has_bypass    => c_has_bypass,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => c_has_ainit,
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => c_has_sinit
      )
      PORT MAP (
        a        => a,
        b        => b,
        clk      => clk,
        add      => add,
        c_in     => c_in,
        ce       => ce,
        bypass   => bypass,
        aclr     => aclr,
        aset     => aset,
        ainit    => ainit,
        sclr     => sclr,
        sset     => sset,
        sinit    => sinit,
        ovfl     => ovfl,
        c_out    => c_out,
        q_ovfl   => q_ovfl,
        q_c_out  => q_c_out,
        s        => s,
        q        => q
      );
  end generate i_lut6;

  i_lut4: if ci_has_lut4 generate
    i_lut4_addsub: c_addsub_v12_0_10_base_legacy
      GENERIC MAP (
        c_width         => c_width,
        c_add_mode      => c_add_mode,
        c_b_constant    => c_b_constant,
        ci_b_value      => ci_b_value,
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => c_sinit_val,
        c_bypass_enable => c_bypass_enable,
        c_bypass_low    => c_bypass_low,
        c_sync_enable   => c_sync_enable,
        c_sync_priority => c_sync_priority,
        c_has_s         => c_has_s,
        c_has_q         => c_has_q,
        c_has_c_in      => c_has_c_in,      --BOOLEAN'POS(c_has_c_in = 1 OR c_has_b_in = 1),
        c_has_c_out     => c_has_c_out,     --BOOLEAN'POS(c_has_c_out = 1 OR c_has_b_out = 1),
        c_has_q_c_out   => c_has_q_c_out,   --BOOLEAN'POS(c_has_q_c_out = 1 OR c_has_q_b_out = 1),
        c_has_ovfl      => c_has_ovfl,
        c_has_q_ovfl    => c_has_q_ovfl,
        c_has_ce        => c_has_ce,
        c_has_bypass    => c_has_bypass,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => c_has_ainit,
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => c_has_sinit
      )
      PORT MAP (
        a        => a(c_width-1 downto 0),
        b        => b(c_width-1 downto 0),
        clk      => clk,
        add      => add,
        c_in     => c_in,
        ce       => ce,
        bypass   => bypass,
        aclr     => aclr,
        aset     => aset,
        ainit    => ainit,
        sclr     => sclr,
        sset     => sset,
        sinit    => sinit,
        ovfl     => ovfl,
        c_out    => c_out,
        q_ovfl   => q_ovfl,
        q_c_out  => q_c_out,
        s        => s,
        q        => q
      );

  end generate i_lut4;

end synth;



-- $Id: c_addsub_v12_0_10_legacy.vhd,v 1.5 2010/03/19 10:44:16 julian Exp $
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

-- Filename - c_addsub_v9_1_viv.vhd
-- Author - Xilinx
-- Creation - 18 Aug 2004
--
-- Description:
-- (A)Synchronous Adder/Subtractor module, part of the baseblox_v8_0 suite
-- Features:
-- * Input widths up to 256 bits
-- * Output width up to 258 bits
-- * Generates adders, subtractors and adder/subtractors
-- * Optional constant B (used for counters)
-- * Optional bypass (load) functionality
-- * Optional carry-in and asynchronous or synchronous carry-out (for adder and adder/subtractor modules)
-- * Optional borrow-in and asynchronous or synchronous borrow-out (for subtractor modules)
-- * Optional overflow output (signed modules only)
-- * All the usual register options (ce, synchronous clear, set or initialise, async clear, set or initialise,
--   configurable sclr/sset priority, configurable s{clr,set,init}/ce priority)

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

--LIBRARY c_addsub_v9_1;
--USE c_addsub_v9_1.c_addsub_v9_1_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_addsub_v12_0_10;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg.ALL;
USE c_addsub_v12_0_10.c_addsub_v12_0_10_pkg_legacy.ALL;


-- (A)Synchronous Adder/Subtractor
--

ENTITY c_addsub_v12_0_10_legacy IS
  GENERIC (
    c_family              : STRING := "virtex7";
    c_a_width             : INTEGER;
    c_b_width             : INTEGER;
    c_out_width           : INTEGER;
    c_low_bit             : INTEGER;
-- c_high_bit should not be used anymore; the only uses here are in the interface (declaring
-- port sizes) and in the check_generics function (ensuring c_high_bit + 1 = c_out_width)
    c_high_bit            : INTEGER;
    c_add_mode            : INTEGER;
    c_a_type              : INTEGER;
    c_b_type              : INTEGER;
    c_b_constant          : INTEGER;
    c_b_value             : STRING ;
    c_ainit_val           : STRING ;
    c_sinit_val           : STRING ;
    c_bypass_enable       : INTEGER;
    c_bypass_low          : INTEGER;
    c_sync_enable         : INTEGER;
    c_sync_priority       : INTEGER;
    c_pipe_stages         : INTEGER;
    c_latency             : INTEGER;
    c_has_s               : INTEGER;
    c_has_q               : INTEGER;
    c_has_c_in            : INTEGER;
    c_has_c_out           : INTEGER;
    c_has_q_c_out         : INTEGER;
    c_has_b_in            : INTEGER;
    c_has_b_out           : INTEGER;
    c_has_q_b_out         : INTEGER;
    c_has_ovfl            : INTEGER;
    c_has_q_ovfl          : INTEGER;
    c_has_ce              : INTEGER;
    c_has_add             : INTEGER;
    c_has_bypass          : INTEGER;
    c_has_a_signed        : INTEGER;
    c_has_b_signed        : INTEGER;
    c_has_aclr            : INTEGER;
    c_has_aset            : INTEGER;
    c_has_ainit           : INTEGER;
    c_has_sclr            : INTEGER;
    c_has_sset            : INTEGER;
    c_has_sinit           : INTEGER;
    c_enable_rlocs        : INTEGER;
    c_has_bypass_with_cin : INTEGER
    );

  PORT (
    a        : IN  STD_LOGIC_VECTOR(c_a_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
    b        : IN  STD_LOGIC_VECTOR(c_b_width-1 DOWNTO 0) := (OTHERS => '0');  -- input value
    clk      : IN  STD_LOGIC                              := '0';  -- clock
    add      : IN  STD_LOGIC                              := '1';  -- valid when addsub mode selected. 1 = add, 0 = subtract
    c_in     : IN  STD_LOGIC                              := '0';  -- carry in
    b_in     : IN  STD_LOGIC                              := '1';  -- borrow in
    ce       : IN  STD_LOGIC                              := '1';  -- clock enable
    bypass   : IN  STD_LOGIC                              := '0';  -- sync load of b into reg
    aclr     : IN  STD_LOGIC                              := '0';  -- asynch init.
    aset     : IN  STD_LOGIC                              := '0';  -- asynch set.
    ainit    : IN  STD_LOGIC                              := '0';  -- asynch init.
    sclr     : IN  STD_LOGIC                              := '0';  -- synch init.
    sset     : IN  STD_LOGIC                              := '0';  -- synch set.
    sinit    : IN  STD_LOGIC                              := '0';  -- synch init.
    a_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
    b_signed : IN  STD_LOGIC                              := '0';  -- '0' = unsigned, '1' = signed.
    ovfl     : OUT STD_LOGIC := '0';
    c_out    : OUT STD_LOGIC := '0';
    b_out    : OUT STD_LOGIC := '0';           -- borrow out
    q_ovfl   : OUT STD_LOGIC := '0';
    q_c_out  : OUT STD_LOGIC := '0';
    q_b_out  : OUT STD_LOGIC := '0';
    s        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0) := (others => '0');  -- asynch output value
    q        : OUT STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0) := (others => '0')  -- synch output value
    );
END c_addsub_v12_0_10_legacy;

ARCHITECTURE synth OF c_addsub_v12_0_10_legacy IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  -- Types inherited from pkg_baseblox:
  -- TYPE T_SYNC_ENABLE
  -- TYPE T_REG_PRIORITY
  -- TYPE T_ADD_MODE
  -- TYPE T_BYPASS_ENABLE
  --

  -- Clean versions of generics:
  CONSTANT enum_c_add_mode      : T_ADD_MODE      := fn_select_add_mode (c_add_mode);
  CONSTANT enum_c_bypass_enable : T_BYPASS_ENABLE := fn_select_bypass_enable(c_bypass_enable);
  CONSTANT enum_c_sync_enable   : T_SYNC_ENABLE   := fn_select_sync_enable(c_sync_enable);
  CONSTANT enum_c_sync_priority : T_REG_PRIORITY  := fn_select_sync_priority(c_sync_priority);
  CONSTANT enum_c_a_type        : T_NUMBER_FORMAT := fn_select_number_format(c_a_type);
  CONSTANT enum_c_b_type        : T_NUMBER_FORMAT := fn_select_number_format(c_b_type);

  CONSTANT ci_ainit_val : STD_LOGIC_VECTOR(q'RANGE) := str_to_bound_slv_0(c_ainit_val, q'LENGTH);
  CONSTANT ci_sinit_val : STD_LOGIC_VECTOR(q'RANGE) := str_to_bound_slv_0(c_sinit_val, q'LENGTH);
  CONSTANT ci_b_value_w : STD_LOGIC_VECTOR(c_b_width-1 DOWNTO 0) := str_to_bound_slv_0(C_B_VALUE, C_B_WIDTH);

  -- Returns ci_b_value_w that is extended (sign extended for signed, zero-padded for unsigne) to c_out_width.
  function fn_ext_ci_b_value(
     c_type : integer;
     c_inwidth : integer;
     c_b_val : std_logic_vector;
     c_outwidth : integer)
     return std_logic_vector is --(c_outwidth-1 downto 0) is
     variable ret_val : std_logic_vector(c_outwidth-1 downto 0);
  begin
     if(c_outwidth = c_inwidth) then
        ret_val := c_b_val;
     else
        ret_val(c_inwidth-1 downto 0) := c_b_val;
  if(c_type = 0) then
     ret_val(c_outwidth-1 downto c_inwidth) := (others => c_b_val(c_inwidth-1));
        else
     ret_val(c_outwidth-1 downto c_inwidth) := (others => '0');
        end if;
     end if;
     return ret_val;
  end function fn_ext_ci_b_value;


  CONSTANT ci_b_value   : STD_LOGIC_VECTOR(c_out_width-1 DOWNTO 0) := fn_ext_ci_b_value(
                                                                         c_type     => c_b_type,
                                                                         c_inwidth  => c_b_width,
                                                                         c_b_val    => ci_b_value_w,
                   c_outwidth => c_out_width);



  signal wayne :std_logic_vector(c_out_width-1 downto 0) := ci_b_value;
  -- The following line calls fn_check_generics on instantiation (or
  -- simulation time)
  CONSTANT check_gens : INTEGER := fn_check_generics(
    c_a_width            ,
    c_b_width            ,
    c_out_width          ,
    c_low_bit            ,
    c_high_bit           ,
    enum_c_add_mode      ,
    enum_c_a_type        ,
    enum_c_b_type        ,
    c_b_constant         ,
    c_b_value            ,
    c_ainit_val          ,
    c_sinit_val          ,
    enum_c_bypass_enable ,
    c_bypass_low         ,
    enum_c_sync_enable   ,
    enum_c_sync_priority ,
    c_pipe_stages        ,
    c_latency            ,
    c_has_s              ,
    c_has_q              ,
    c_has_c_in           ,
    c_has_c_out          ,
    c_has_q_c_out        ,
    c_has_b_in           ,
    c_has_b_out          ,
    c_has_q_b_out        ,
    c_has_ovfl           ,
    c_has_q_ovfl         ,
    c_has_ce             ,
    c_has_add            ,
    c_has_bypass         ,
    c_has_a_signed       ,
    c_has_b_signed       ,
    c_has_aclr           ,
    c_has_aset           ,
    c_has_ainit          ,
    c_has_sclr           ,
    c_has_sset           ,
    c_has_sinit          ,
    c_enable_rlocs       ,
    c_has_bypass_with_cin
    );


  -- Pipelining functionality:
  -- low_bit() and fn_high_bit()
  --
  -- Because the pipelining strategy creates a square matrix of registers
  -- of length c_latency in each direction, a function is needed to divide
  -- the inputs and output into slices.
  --
  -- these functions are intended to be used as a pair
  -- in the style (fn_high_bit(3) DOWNTO low_bit(3))
  -- to get the range for the third slice.
  -- Valid range for the argument: 1..c_latency
  --
  -- Currently it simply divides the vector as evenly as it can; it
  -- may not be most efficient to do this way.


  SIGNAL a_internal : STD_LOGIC_VECTOR (c_out_width-1 DOWNTO 0);
  SIGNAL b_internal : STD_LOGIC_VECTOR (c_out_width-1 DOWNTO 0); -- still needed for constant b; it's the bypass value

  SIGNAL c_in_i     : STD_LOGIC := '0';
  SIGNAL c_out_i    : STD_LOGIC := '0';
  SIGNAL q_c_out_i  : STD_LOGIC := '0';

  ---------------- PIPELINING SIGNALS --------------------------
  -- pipelining forms a square grid of registers. This datatype is the std_logic_vector associated
  -- with one of these registers.
  SUBTYPE T_PIPEREG IS STD_LOGIC_VECTOR(c_out_width - 1 DOWNTO 0);

  TYPE T_PIPEARRAY IS ARRAY (1 TO c_latency) OF T_PIPEREG;
  TYPE T_CARRYARRAY IS ARRAY (1 TO c_latency,1 TO c_latency) OF STD_LOGIC;

  -- piperegs stores the partially completed sums at each pipeline stage
  SIGNAL piperegs : T_PIPEARRAY;
  -- pipecarry stores the carry-outs from the first stage adders until they are used
  SIGNAL pipecarry : T_CARRYARRAY;
  -- diagonal_c_out stores the carry-outs from the diagonal adders
  SIGNAL diagonal_c_out       : STD_LOGIC_VECTOR (1 TO c_latency);
  -- overall_c_out(i) determines whether slice(i) produced a carry-out
  SIGNAL overall_c_out        : STD_LOGIC_VECTOR (1 TO c_latency);

  -- Signals to calculate & store overflow
  SIGNAL pipeovfl             : STD_LOGIC_VECTOR (1 TO c_latency);
  -- firststageadder_q_ovfl and diagonaladder_ovfl are wired to the overflow ports
  -- of all the adders; but only the topmost of each is used. It's basically
  -- syntax faff; all except the MSB exist only to be thrown away.
  SIGNAL firststageadder_q_ovfl : STD_LOGIC_VECTOR (1 TO c_latency);
  SIGNAL diagonaladder_ovfl     : STD_LOGIC_VECTOR (1 TO c_latency);
  SIGNAL final_ovfl             : STD_LOGIC;

  -- Pipelined control signals
  SIGNAL add_for_stage          : STD_LOGIC_VECTOR (1 TO c_latency);
  SIGNAL bypass_for_stage       : STD_LOGIC_VECTOR (1 TO c_latency);

  signal async_out  : std_logic_vector(c_out_width-1 downto 0);


BEGIN
  ------------------------------------
  -- Warnings suppression
  ------------------------------------
  i_no_c_has_ovfl: if (c_has_ovfl = 0) generate
    ovfl <= '0';
  end generate i_no_c_has_ovfl;
  i_no_c_has_q_ovfl: if (c_has_q_ovfl = 0) generate
    q_ovfl <= '0';
  end generate i_no_c_has_q_ovfl;
  i_no_c_has_c_out: if (c_has_c_out = 0) generate
    c_out <= '0';
  end generate i_no_c_has_c_out;
  i_no_c_has_q_c_out: if (c_has_q_c_out = 0) generate
    q_c_out <= '0';
  end generate i_no_c_has_q_c_out;
  i_no_c_has_s: if ((c_has_s = 0) and (c_latency > 1)) generate
    s <= (others => '0');
  end generate i_no_c_has_s;
  i_no_c_has_q: if ((c_has_q = 0) and (c_latency > 1)) generate
    q <= (others => '0');
  end generate i_no_c_has_q;


  --------------------- PREPARATION SECTION ------------------------
  --
  -- Converts external ports to internal signals and vice versa
  -- and generally deals with optional stuff.

  ----------------------------------
  -- connect inputs to internals
  ----------------------------------

  -- To simplify c_addsub_v12_0_10_fabric, extend A and B to be the same width as the output.
  --
  -- BUGFIX: andreww October 2009
  -- Changed to using sign/zero-extension functions instead of manual extending
  -- The manual extension code causes Modelsim 6.5 vopt to crash during elaboration
  --
  -- Generate a_internal
  i_a_signed: IF enum_c_a_type = NUM_SIGNED GENERATE
--    a_internal(c_a_width-1 DOWNTO 0) <= a;
--    i_a_sign_extend: IF c_a_width < c_out_width GENERATE
--      a_internal(c_out_width-1 DOWNTO c_a_width) <= (OTHERS => a(c_a_width-1)); -- sign extend
--    END GENERATE i_a_sign_extend;
    a_internal <= std_logic_vector(resize(signed(a),C_OUT_WIDTH));
  END GENERATE i_a_signed;
  i_a_unsigned: IF enum_c_a_type = NUM_UNSIGNED GENERATE
--    a_internal(c_a_width - 1 DOWNTO 0) <= a;
--    i_a_zero_extend: IF c_a_width < c_out_width GENERATE
--      a_internal(c_out_width-1 DOWNTO c_a_width) <= (OTHERS => '0'); -- zero extend
--    END GENERATE i_a_zero_extend;
    a_internal <= std_logic_vector(resize(unsigned(a),C_OUT_WIDTH));
  END GENERATE i_a_unsigned;
  -- No check for NUM_PIN; would be easy enough, but needs more logic and is deprecated
  -- setting enum_c_a_type to NUM_PIN will cause check_generics to throw out an error.

  -- Generate b_internal
  i_b_signed: IF enum_c_b_type = NUM_SIGNED GENERATE
--    b_internal(c_b_width - 1 DOWNTO 0) <= b;
--    i_b_sign_extend: IF c_b_width < c_out_width GENERATE
--      b_internal(c_out_width-1 DOWNTO c_b_width) <= (OTHERS => b(c_b_width-1)); -- sign extend
--    END GENERATE i_b_sign_extend;
    b_internal <= std_logic_vector(resize(signed(b),C_OUT_WIDTH));
  END GENERATE i_b_signed;
  i_b_unsigned: IF enum_c_b_type = NUM_UNSIGNED GENERATE
--    b_internal(c_b_width - 1 DOWNTO 0) <= b;
--    i_b_zero_extend: IF c_b_width < c_out_width GENERATE
--      b_internal(c_out_width-1 DOWNTO c_b_width) <= (OTHERS => '0'); -- zero extend
--    END GENERATE i_b_zero_extend;
    b_internal <= std_logic_vector(resize(unsigned(b),C_OUT_WIDTH));
  END GENERATE i_b_unsigned;
  -- No check for NUM_PIN (as with a_internal)

  -- Generate c_in_i
  i_c_in_i_use_c_in: IF c_has_c_in = 1 AND (enum_c_add_mode = MODE_ADD OR enum_c_add_mode = MODE_ADDSUB) GENERATE
    c_in_i <= c_in;
  END GENERATE i_c_in_i_use_c_in;
  i_c_in_i_use_b_in: IF c_has_b_in = 1 AND enum_c_add_mode = MODE_SUB GENERATE
    c_in_i <= b_in;
  END GENERATE i_c_in_i_use_b_in;

  ----------------------------------
  -- connect internals to outputs
  ----------------------------------

  i_no_cout: if c_has_c_out = 0 generate
    c_out <= '0';
  end generate i_no_cout;
  i_no_q_cout: if c_has_q_c_out = 0 generate
    q_c_out <= '0';
  end generate i_no_q_cout;
  i_no_bout: if c_has_b_out = 0 generate
    b_out <= '0';
  end generate i_no_bout;
  i_no_q_bout: if c_has_q_b_out = 0 generate
    q_b_out <= '0';
  end generate i_no_q_bout;

  -- Interpret c_out_i
  i_c_out_i_to_c_out: IF c_has_c_out = 1 AND (enum_c_add_mode = MODE_ADD OR enum_c_add_mode = MODE_ADDSUB) GENERATE
    c_out <= c_out_i;
    q_c_out <= '0';
    b_out <= '0';
    q_b_out <= '0';
  END GENERATE i_c_out_i_to_c_out;
  i_c_out_i_to_b_out: IF c_has_b_out = 1 AND enum_c_add_mode = MODE_SUB GENERATE
    c_out <= '0';
    q_c_out <= '0';
    b_out <= c_out_i;
    q_b_out <= '0';
  END GENERATE i_c_out_i_to_b_out;

  -- Interpret q_c_out_i
  i_q_c_out_i_to_q_c_out: IF c_has_q_c_out = 1 AND (enum_c_add_mode = MODE_ADD OR enum_c_add_mode = MODE_ADDSUB) GENERATE
    c_out <= '0';
    q_c_out <= q_c_out_i;
    b_out <= '0';
    q_b_out <= '0';
  END GENERATE i_q_c_out_i_to_q_c_out;
  i_q_c_out_i_to_q_b_out: IF c_has_q_b_out = 1 AND enum_c_add_mode = MODE_SUB GENERATE
    c_out <= '0';
    q_c_out <= '0';
    b_out <= '0';
    q_b_out <= q_c_out_i;
  END GENERATE i_q_c_out_i_to_q_b_out;

  --
  ------------------- END OF PREPARATION SECTION --------------------------
  --

  no_pipelining: IF c_latency <= 1 GENERATE
    the_addsub: c_addsub_v12_0_10_fabric_legacy
      GENERIC MAP (
        c_family              => c_family,
        c_width               => c_out_width,
        c_add_mode            => c_add_mode,
        c_b_constant          => c_b_constant,
        ci_b_value            => ci_b_value,
        c_ainit_val           => c_ainit_val,
        c_sinit_val           => c_sinit_val,
        c_bypass_enable       => c_bypass_enable,
        c_bypass_low          => c_bypass_low,
        c_sync_enable         => c_sync_enable,
        c_sync_priority       => c_sync_priority,
        c_has_s               => c_has_s,
        c_has_q               => c_has_q,
        c_has_c_in            => BOOLEAN'POS(c_has_c_in = 1 OR c_has_b_in = 1),
        c_has_c_out           => BOOLEAN'POS(c_has_c_out = 1 OR c_has_b_out = 1),
        c_has_q_c_out         => BOOLEAN'POS(c_has_q_c_out = 1 OR c_has_q_b_out = 1),
        c_has_ovfl            => c_has_ovfl,
        c_has_q_ovfl          => c_has_q_ovfl,
        c_has_ce              => c_has_ce,
        c_has_bypass          => c_has_bypass,
        c_has_aclr            => c_has_aclr,
        c_has_aset            => c_has_aset,
        c_has_ainit           => c_has_ainit,
        c_has_sclr            => c_has_sclr,
        c_has_sset            => c_has_sset,
        c_has_sinit           => c_has_sinit
      )
      PORT MAP (
        a        => a_internal,
        b        => b_internal,
        clk      => clk,
        add      => add,
        c_in     => c_in_i,
        ce       => ce,
        bypass   => bypass,
        aclr     => aclr,
        aset     => aset,
        ainit    => ainit,
        sclr     => sclr,
        sset     => sset,
        sinit    => sinit,
        ovfl     => OPEN,               --rrs changed from ovfl to OPEN
        c_out    => c_out_i,
        q_ovfl   => OPEN,             --rrs changed from q_ovfl to OPEN
        q_c_out  => q_c_out_i,
        s        => s,
        q        => q
      );
    ovfl <= '0';
    q_ovfl <= '0';
  END GENERATE no_pipelining;

  -- See ../spec/c_addsub_v12_0_10.doc for a diagram explaining the pipelining technique used here.
  --
  -- Note that aclr/aset/ainit are all ignored, since if one is present it is probably a global reset and
  -- intended to reset state-machines rather than data-paths.
  --
  -- sclr/sset/sinit are passed to the whole pipeline.

  pipelining: IF c_latency > 1 GENERATE
    -- First set up the control signals to be pipelined
    i_addsub: IF enum_c_add_mode = MODE_ADDSUB GENERATE
      -- need to pipeline the ADD signal
      add_for_stage(1) <= add; -- First stage uses the raw input
      stages: FOR stage IN 2 TO c_latency GENERATE
        -- Note that on SCLR, the ADD pipeline is set to all '1's
        -- so that the pipeline will simply add 0 to 0 and output all '0's
        -- If it were set to all '0's, the function would be 0 - 0 - 1
        -- because of the active-low borrow-in; and the output would be all '1's
        addpipereg: c_reg_fd_v12_0_3_viv
          GENERIC MAP (
            c_width         => 1,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_sset      => c_has_sclr -- note reversal of sense here
          )
          PORT MAP (
            clk  => clk,
            ce   => ce,
            sset => sclr,
            d(0) => add_for_stage(stage - 1),
            q(0) => add_for_stage(stage)
          );
      END GENERATE stages;
    END GENERATE i_addsub;

    i_bypass: IF c_has_bypass = 1 GENERATE
      -- need to pipeline the BYPASS signal
      bypass_for_stage(1) <= bypass; -- First stage uses the raw input
      stages: FOR stage IN 2 TO c_latency GENERATE
        -- It doesn't matter what the BYPASS pipeline is set to on reset;
        -- even if BYPASS is active low
        -- Therefore don't bother
        bypasspipereg: c_reg_fd_v12_0_3_viv
          GENERIC MAP (
            c_width    => 1,
            c_has_ce   => c_has_ce,
            c_sync_enable => c_sync_enable,
            c_has_sclr => c_has_sclr    --CR203669
            )
          PORT MAP (
            clk  => clk,
            ce   => ce,
            sclr => sclr,               --CR203669
            d(0) => bypass_for_stage(stage - 1),
            q(0) => bypass_for_stage(stage)
          );
      END GENERATE stages;
    END GENERATE i_bypass;

    ---------- Generate Main Addsub Pipeline --------------------

    -- Iterate through the pipeline stages
    stages: FOR stage IN 1 TO c_latency GENERATE
      -- Iterate through the different slices of the output vector
      -- (least significant to most significant)
      slices: FOR slice IN 1 TO c_latency GENERATE
        -- first stage: an adder for each slice simply to
        -- halve the number of signals.
        first: IF stage = 1 GENERATE
          first_stage_adder: c_addsub_v12_0_10_fabric_legacy
            GENERIC MAP (
              c_family              => c_family,
              c_width               => fn_slice_width(slice, c_latency, c_out_width),
              c_add_mode            => c_add_mode,
              c_b_constant          => c_b_constant,
              ci_b_value            => ci_b_value(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
              c_bypass_enable       => c_bypass_enable,
              c_bypass_low          => c_bypass_low,
              c_sync_enable         => c_sync_enable,
              c_sync_priority       => c_sync_priority,
              c_has_s               => 0,
              c_has_q               => 1,
              c_has_c_in            => BOOLEAN'POS(slice = 1 AND (c_has_c_in = 1 OR c_has_b_in = 1)), -- carry-in is fed into lowermost slice adder
              c_has_c_out           => 0,
              -- all adders except top need carry-out to pass up the chain;
              -- the top only needs carry-out if a carry-out output is requested.
              c_has_q_c_out         => BOOLEAN'POS(slice /= c_latency OR c_has_q_c_out = 1 OR c_has_q_b_out = 1),
              c_has_ovfl            => 0,
              c_has_q_ovfl          => BOOLEAN'POS(slice = c_latency AND c_has_q_ovfl = 1),
              c_has_ce              => c_has_ce,
              c_has_bypass          => c_has_bypass,
              c_has_sclr            => c_has_sclr
            )
            PORT MAP (
              clk      => clk,
              a        => a_internal(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
              b        => b_internal(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
              add      => add_for_stage(1),
              bypass   => bypass_for_stage(1),
              c_in     => c_in_i,
              ce       => ce,
              sclr     => sclr,
              ovfl     => OPEN,         --rrs changed from ovfl to OPEN
              q_ovfl   => OPEN,  --rrs changed from firststageadder_q_ovfl(slice) to OPEN
              q_c_out  => pipecarry(1,slice),
              q        => piperegs(1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width))
            );
        END GENERATE first;
        middlestages: IF stage /= 1 and stage /= c_latency GENERATE
          abovediagonal: IF stage < slice GENERATE
            piperegister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => fn_slice_width(slice, c_latency, c_out_width),
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sclr    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d    => piperegs(stage - 1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
                q    => piperegs(stage    )(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width))
              );
            carryregister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => 1,
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sclr    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d(0) => pipecarry(stage - 1, slice),
                q(0) => pipecarry(stage    , slice)
              );
          END GENERATE abovediagonal;
          diagonal: IF stage = slice GENERATE
            -- Adders go here to mop up the rest of the mess..
            diagonal_adder: c_addsub_v12_0_10_fabric_legacy
            GENERIC MAP (
              c_family              => c_family,
              c_width               => fn_slice_width(slice, c_latency, c_out_width),
              c_add_mode            => c_add_mode,
              c_b_constant          => 1,
              ci_b_value            => fn_zero_vector(fn_slice_width(slice, c_latency, c_out_width)),
              c_bypass_enable       => c_bypass_enable,
              c_bypass_low          => c_bypass_low,
              c_sync_enable         => c_sync_enable,
              c_sync_priority       => c_sync_priority,
              c_has_s               => 0,
              c_has_q               => 1,
              c_has_c_in            => 1,
              c_has_c_out           => 1,
              c_has_q_c_out         => 0,
              c_has_ovfl            => BOOLEAN'POS(slice = c_latency AND c_has_q_ovfl = 1),
              c_has_q_ovfl          => 0,
              c_has_ce              => c_has_ce,
              c_has_bypass          => c_has_bypass,
              c_has_sclr            => c_has_sclr
            )
            PORT MAP (
              clk      => clk,
              a        => piperegs(stage-1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
              b        => piperegs(stage-1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)), -- bypass value
              add      => add_for_stage(stage),
              bypass   => bypass_for_stage(stage),
              c_in     => pipecarry(stage-1,slice-1),
              ce       => ce,
              sclr     => sclr,
              ovfl     => OPEN,         --rrs changed from diagonaladder_ovfl(slice) to OPEN
              c_out    => diagonal_c_out(slice),
              q        => piperegs(stage)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width))
            );
            -- FIXME investigate possibility of using XORCY here
            -- since OR and XOR will both work for this (pipecarry(stage-1,slice)
            -- and diagonal_c_out cannot both be 1)
            -- Note that the XORCY trick will only work for adders since the function is different for
            -- subtractors and addsubs.
            i_c_out_gen_adder: IF enum_c_add_mode = MODE_ADD GENERATE
              -- If either the first-stage adder or the diagonal adder for this slice
              -- produced a carry-out, then a carry-out is produced overall.
              overall_c_out(slice) <= pipecarry(stage-1,slice) OR diagonal_c_out(slice);
            END GENERATE i_c_out_gen_adder;
            i_c_out_gen_subtractor: IF enum_c_add_mode = MODE_SUB GENERATE
              -- Same logic here; except that a borrow-out is active-low, so an AND
              -- gate is used instead of an OR gate.
              overall_c_out(slice) <= pipecarry(stage-1,slice) AND diagonal_c_out(slice);
            END GENERATE i_c_out_gen_subtractor;
            i_c_out_gen_addsub: IF enum_c_add_mode = MODE_ADDSUB GENERATE
              -- select which function depending on the current pipe stage ADD signal
              overall_c_out(slice) <= pipecarry(stage-1,slice) OR diagonal_c_out(slice) WHEN add_for_stage(stage) = '1'
                                 ELSE pipecarry(stage-1,slice) AND diagonal_c_out(slice);
            END GENERATE i_c_out_gen_addsub;

            i_add: if enum_c_add_mode = MODE_ADD or enum_c_add_mode = MODE_ADDSUB generate
            addcarryregister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => 1,
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sclr    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d(0) => overall_c_out(slice),
                q(0) => pipecarry(stage, slice)
              );

            end generate i_add;
            i_sub: if enum_c_add_mode = MODE_SUB generate
            subcarryregister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => 1,
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sset    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d(0) => overall_c_out(slice),
                q(0) => pipecarry(stage, slice)
              );

            end generate i_sub;
          END GENERATE diagonal;
          belowdiagonal: IF stage > slice GENERATE
            piperegister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => fn_slice_width(slice, c_latency, c_out_width),
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sclr    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d    => piperegs(stage - 1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
                q    => piperegs(stage    )(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width))
              );
          END GENERATE belowdiagonal;
        END GENERATE middlestages;

        laststage: IF stage = c_latency GENERATE

          --abovediagonal is not possible.

          diagonal: IF stage = slice GENERATE
            -- Adders go here to mop up the rest of the mess..
            diagonal_adder: c_addsub_v12_0_10_fabric_legacy
            GENERIC MAP (
              c_family              => c_family,
              c_width               => fn_slice_width(slice, c_latency, c_out_width),
              c_add_mode            => c_add_mode,
              c_b_constant          => 1,
              ci_b_value            => fn_zero_vector(fn_slice_width(slice, c_latency, c_out_width)),
              c_bypass_enable       => c_bypass_enable,
              c_bypass_low          => c_bypass_low,
              c_sync_enable         => c_sync_enable,
              c_sync_priority       => c_sync_priority,
              c_has_s               => c_has_s,
              c_has_q               => c_has_q,
              c_has_c_in            => 1,
              c_has_c_out           => 1,
              c_has_q_c_out         => 0,
              c_has_ovfl            => BOOLEAN'POS(slice = c_latency AND c_has_q_ovfl = 1),
              c_has_q_ovfl          => 0,
              c_has_ce              => c_has_ce,
              c_has_bypass          => c_has_bypass,
              c_has_sclr            => c_has_sclr
            )
            PORT MAP (
              clk      => clk,
              a        => piperegs(stage-1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
              b        => piperegs(stage-1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)), -- bypass value
              add      => add_for_stage(stage),
              bypass   => bypass_for_stage(stage),
              c_in     => pipecarry(stage-1,slice-1),
              ce       => ce,
              sclr     => sclr,
--              ovfl     => diagonaladder_ovfl(slice),
              ovfl     => OPEN,         --rrs changed from diagonaladder_ovfl(slice) to OPEN
              c_out    => diagonal_c_out(slice),
              s        => async_out(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
              q        => piperegs(stage)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width))
            );
            -- FIXME investigate possibility of using XORCY here
            -- since OR and XOR will both work for this (pipecarry(stage-1,slice)
            -- and diagonal_c_out cannot both be 1)
            -- Note that the XORCY trick will only work for adders since the function is different for
            -- subtractors and addsubs.
            i_c_out_gen_adder: IF enum_c_add_mode = MODE_ADD GENERATE
              -- If either the first-stage adder or the diagonal adder for this slice
              -- produced a carry-out, then a carry-out is produced overall.
              overall_c_out(slice) <= pipecarry(stage-1,slice) OR diagonal_c_out(slice);
            END GENERATE i_c_out_gen_adder;
            i_c_out_gen_subtractor: IF enum_c_add_mode = MODE_SUB GENERATE
              -- Same logic here; except that a borrow-out is active-low, so an AND
              -- gate is used instead of an OR gate.
              overall_c_out(slice) <= pipecarry(stage-1,slice) AND diagonal_c_out(slice);
            END GENERATE i_c_out_gen_subtractor;
            i_c_out_gen_addsub: IF enum_c_add_mode = MODE_ADDSUB GENERATE
              -- select which function depending on the current pipe stage ADD signal
              overall_c_out(slice) <= pipecarry(stage-1,slice) OR diagonal_c_out(slice) WHEN add_for_stage(stage) = '1'
                                 ELSE pipecarry(stage-1,slice) AND diagonal_c_out(slice);
            END GENERATE i_c_out_gen_addsub;

            carryregister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => 1,
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sclr    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d(0) => overall_c_out(slice),
                q(0) => pipecarry(stage, slice)
              );
          END GENERATE diagonal;
          belowdiagonal: IF stage > slice GENERATE
            async_out(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)) <=
              piperegs(stage - 1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width));
            piperegister: c_reg_fd_v12_0_3_viv
              GENERIC MAP (
                c_width       => fn_slice_width(slice, c_latency, c_out_width),
                c_sync_enable => c_sync_enable,
                c_has_ce      => c_has_ce,
                c_has_sclr    => c_has_sclr
              )
              PORT MAP (
                clk  => clk,
                ce   => ce,
                sclr => sclr,
                d    => piperegs(stage - 1)(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width)),
                q    => piperegs(stage    )(fn_high_bit(slice, c_latency, c_out_width) DOWNTO fn_low_bit(slice, c_latency, c_out_width))
              );
          END GENERATE belowdiagonal;
        END GENERATE laststage;

      END GENERATE slices;
    END GENERATE stages;

    i_q_ovfl: IF c_has_q_ovfl = 1 GENERATE
      -- The whole module has overflowed if exactly one of the following has happened:
      -- 1) The topmost first-stage adder overflows, or
      -- 2) The topmost diagonal adder overflows.
      -- if both have overflowed, the effects cancel each
      -- other out (the partial answer from the first stage went over the edge, but
      -- the diagonal adder pulled it back)

      -- Generate a pipeline to store the q_ovfl output of the first-stage adder
      -- until it reaches the last-stage diagonal adder
      pipeovfl(1) <= firststageadder_q_ovfl(c_latency);
      midovflpipe: IF c_latency > 2 GENERATE
        ovflpipegen: FOR stage IN 2 TO c_latency - 1 GENERATE
          -- first stage has already been created by the first stage adder
          -- last stage is special and is dealt with below
          -- this loop does the rest (if there is any "rest").
          ovflpipereg: c_reg_fd_v12_0_3_viv
            GENERIC MAP (
              c_width       => 1,
              c_sync_enable => c_sync_enable,
              c_has_ce      => c_has_ce,
              c_has_sclr    => c_has_sclr
            )
            PORT MAP (
              clk  => clk,
              ce   => ce,
              sclr => sclr,
              d(0) => pipeovfl(stage - 1),
              q(0) => pipeovfl(stage)
            );
        END GENERATE ovflpipegen;
      END GENERATE midovflpipe;

      -- Final stage
      -- Just XOR the two signals together
      final_ovfl <= diagonaladder_ovfl(c_latency) XOR pipeovfl(c_latency-1);
      ovflfinalreg: c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width       => 1,
          c_sync_enable => c_sync_enable,
          c_has_ce      => c_has_ce,
          c_has_sclr    => c_has_sclr
        )
        PORT MAP (
          clk  => clk,
          ce   => ce,
          sclr => sclr,
          d(0) => final_ovfl,
          q(0) => q_ovfl -- and the signal leaves the module
        );
    END GENERATE i_q_ovfl;

    i_q_c_out_i: IF c_has_q_c_out = 1 OR c_has_q_b_out = 1 GENERATE
      q_c_out_i <= pipecarry(c_latency,c_latency);
      c_out_i <= '0';
    END GENERATE i_q_c_out_i;
    i_q: if c_has_q /= 0 generate
      q <= piperegs(c_latency);
    end generate i_q;
    i_s: if c_has_s /= 0 generate
      s <= async_out;
    end generate i_s;
  END GENERATE pipelining;
END synth;



-- $Id: c_addsub_v12_0_10_viv.vhd,v 1.5 2010/03/19 10:44:17 julian Exp $
-------------------------------------------------------------------------------
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
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

library xbip_pipe_v3_0_3;
use xbip_pipe_v3_0_3.xbip_pipe_v3_0_3_viv_comp.all;

--library xbip_counter_v1_0;
--use xbip_counter_v1_0.xbip_counter_v1_0_pkg.all;
--use xbip_counter_v1_0.xbip_counter_v1_0_hdl_comps.all;


library xbip_addsub_v3_0_3;
use xbip_addsub_v3_0_3.xbip_addsub_v3_0_3_viv_comp.all;

library c_addsub_v12_0_10;
use c_addsub_v12_0_10.c_addsub_v12_0_10_pkg.all;
use c_addsub_v12_0_10.c_addsub_v12_0_10_pkg_legacy.all;


--core_if on entity c_addsub_v12_0_10_viv
entity c_addsub_v12_0_10_viv is
  generic (
    C_VERBOSITY           : integer := 0;
    C_XDEVICEFAMILY       : string  := "no_family";
    C_IMPLEMENTATION      : integer := 0;
    C_A_WIDTH             : integer := 15;
    C_B_WIDTH             : integer := 15;
    C_OUT_WIDTH           : integer := 16;
    C_CE_OVERRIDES_SCLR   : integer := 0;  -- replaces c_sync_enable
    C_A_TYPE              : integer := 0;
    C_B_TYPE              : integer := 0;
    C_LATENCY             : integer := 1;
    C_ADD_MODE            : integer := 0;
    C_B_CONSTANT          : integer := 0;
    C_B_VALUE             : string  := "0";
    C_AINIT_VAL           : string  := "0";
    C_SINIT_VAL           : string  := "0";
    C_CE_OVERRIDES_BYPASS : integer := 0;  -- replaces c_bypass_enable
    C_BYPASS_LOW          : integer := 0;
    C_SCLR_OVERRIDES_SSET : integer := 1;  -- replaces c_sync_priority
    C_HAS_C_IN            : integer := 0;
    C_HAS_C_OUT           : integer := 0;  -- may be registered in step with c_latency
    C_BORROW_LOW          : integer := 1;
    C_HAS_CE              : integer := 0;
    C_HAS_BYPASS          : integer := 0;
    C_HAS_SCLR            : integer := 0;
    C_HAS_SSET            : integer := 0;
    C_HAS_SINIT           : integer := 0
    );
  port (
    A      : in  std_logic_vector(C_A_WIDTH-1 downto 0)     := (others => '0');
    B      : in  std_logic_vector(C_B_WIDTH-1 downto 0)     := (others => '0');
    CLK    : in  std_logic                                  := '0';
    ADD    : in  std_logic                                  := '1';
    C_IN   : in  std_logic                                  := '0';
    CE     : in  std_logic                                  := '1';
    BYPASS : in  std_logic                                  := '0';
    SCLR   : in  std_logic                                  := '0';
    SSET   : in  std_logic                                  := '0';
    SINIT  : in  std_logic                                  := '0';
    C_OUT  : out std_logic                                  := '0';
    S      : out std_logic_vector(C_OUT_WIDTH - 1 downto 0) := (others => '0')
    );
--core_if off

  attribute secure_bitstream                         : string;
  attribute secure_bitstream of c_addsub_v12_0_10_viv   : entity is "off";
  attribute secure_config                            : string;
  attribute secure_config of c_addsub_v12_0_10_viv      : entity is "protect";
  attribute secure_netlist                           : string;
  attribute secure_netlist of c_addsub_v12_0_10_viv     : entity is "encrypt";
  attribute secure_extras                            : string;
  attribute secure_extras of c_addsub_v12_0_10_viv      : entity is "A";
  attribute secure_net_editing                       : string;
  attribute secure_net_editing of c_addsub_v12_0_10_viv : entity is "off";

end c_addsub_v12_0_10_viv;

architecture synth of c_addsub_v12_0_10_viv is

  attribute DowngradeIPIdentifiedWarnings          : string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  constant check_gens : integer := fn_c_addsub_v12_0_10_check_generics(
    C_XDEVICEFAMILY       => C_XDEVICEFAMILY,
    C_IMPLEMENTATION      => C_IMPLEMENTATION,
    C_VERBOSITY           => C_VERBOSITY,
    C_A_WIDTH             => C_A_WIDTH,
    C_B_WIDTH             => C_B_WIDTH,
    C_OUT_WIDTH           => C_OUT_WIDTH,
    C_A_TYPE              => C_A_TYPE,
    C_B_TYPE              => C_B_TYPE,
    C_CE_OVERRIDES_SCLR   => C_CE_OVERRIDES_SCLR,
    C_ADD_MODE            => C_ADD_MODE,
    C_HAS_C_IN            => C_HAS_C_IN,
    C_HAS_C_OUT           => C_HAS_C_OUT,
    C_BORROW_LOW          => C_BORROW_LOW,
    C_HAS_CE              => C_HAS_CE,
    C_HAS_BYPASS          => C_HAS_BYPASS,
    C_HAS_SCLR            => C_HAS_SCLR,
    C_LATENCY             => C_LATENCY,
    C_B_CONSTANT          => C_B_CONSTANT,
    C_BYPASS_LOW          => C_BYPASS_LOW,
    C_CE_OVERRIDES_BYPASS => C_CE_OVERRIDES_BYPASS,
    C_SCLR_OVERRIDES_SSET => C_SCLR_OVERRIDES_SSET,
    C_HAS_SSET            => C_HAS_SSET,
    C_HAS_SINIT           => C_HAS_SINIT,
    C_AINIT_VAL           => C_AINIT_VAL,
    C_SINIT_VAL           => C_SINIT_VAL,
    C_B_VALUE             => C_B_VALUE
    );

--used in-line "fn" instead of package functions
-- constant p_has_b_in : integer := fn_borrow_ports(c_has_c_in,c_add_mode,1,1);
-- constant p_has_b_out : integer := fn_borrow_ports(c_has_c_out,c_add_mode,c_a_type,c_b_type);
-- constant p_has_c_in : integer := fn_carry_ports(c_has_c_in,c_add_mode,1,1);
-- constant p_has_c_out : integer := fn_carry_ports(c_has_c_out,c_add_mode,c_a_type,c_b_type);
-- constant p_has_add : integer := fn_add_port(c_add_mode);
-- constant p_bip_has_c_out : integer := fn_carry_ports(c_has_c_out,0,c_a_type,c_b_type);

  constant ci_latency : t_c_addsub_v12_0_10_latency := fn_c_addsub_v12_0_10_latency(
    c_verbosity           => c_verbosity,
    c_xdevicefamily       => c_xdevicefamily,
    c_implementation      => c_implementation,
    c_a_width             => c_a_width,
    c_b_width             => c_b_width,
    c_out_width           => c_out_width,
    c_ce_overrides_sclr   => c_ce_overrides_sclr,
    c_a_type              => c_a_type,
    c_b_type              => c_b_type,
    c_latency             => c_latency,
    c_add_mode            => c_add_mode,
    c_b_constant          => c_b_constant,
    c_b_value             => c_b_value,
    c_ainit_val           => c_ainit_val,
    c_sinit_val           => c_sinit_val,
    c_ce_overrides_bypass => c_ce_overrides_bypass,
    c_bypass_low          => c_bypass_low,
    c_sclr_overrides_sset => c_sclr_overrides_sset,
    c_has_c_in            => c_has_c_in,
    c_has_c_out           => c_has_c_out,
    c_has_ce              => c_has_ce,
    c_has_bypass          => c_has_bypass,
    c_has_sclr            => c_has_sclr,
    c_has_sset            => c_has_sset,
    c_has_sinit           => c_has_sinit
    );
  signal diag_latency : t_c_addsub_v12_0_10_latency := ci_latency;
-- constant c_addsub_latency : integer := c_addsub_latency_rec.used;

  constant ci_resources : t_c_addsub_v12_0_10_resources := fn_c_addsub_v12_0_10_resources(
    c_verbosity           => c_verbosity,
    c_xdevicefamily       => c_xdevicefamily,
    c_implementation      => c_implementation,
    c_a_width             => c_a_width,
    c_b_width             => c_b_width,
    c_out_width           => c_out_width,
    c_ce_overrides_sclr   => c_ce_overrides_sclr,
    c_a_type              => c_a_type,
    c_b_type              => c_b_type,
    c_latency             => c_latency,
    c_add_mode            => c_add_mode,
    c_b_constant          => c_b_constant,
    c_b_value             => c_b_value,
    c_ainit_val           => c_ainit_val,
    c_sinit_val           => c_sinit_val,
    c_ce_overrides_bypass => c_ce_overrides_bypass,
    c_bypass_low          => c_bypass_low,
    c_sclr_overrides_sset => c_sclr_overrides_sset,
    c_has_c_in            => c_has_c_in,
    c_has_c_out           => c_has_c_out,
    c_has_ce              => c_has_ce,
    c_has_bypass          => c_has_bypass,
    c_has_sclr            => c_has_sclr,
    c_has_sset            => c_has_sset,
    c_has_sinit           => c_has_sinit
    );
  signal diag_resources : t_c_addsub_v12_0_10_resources := ci_resources;


begin

  i_baseblox : if C_IMPLEMENTATION = 0 generate

    signal i_c_out        : std_logic                                := '0';
    signal i_b_out        : std_logic                                := '0';
    signal i_ovfl         : std_logic                                := '0';
    signal qi_ovfl        : std_logic                                := '0';
    signal qi_c_out       : std_logic                                := '0';
    signal qi_b_out       : std_logic                                := '0';
    signal i_s            : std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0');
    signal i_q            : std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0');
    signal i_b_in, i_c_in : std_logic                                := '0';




  begin
    i_baseblox_addsub : c_addsub_v12_0_10_legacy
      generic map(
        C_FAMILY              => c_xdevicefamily_to_c_family(C_XDEVICEFAMILY),  -- from bip_utils_pkg
        C_A_WIDTH             => C_A_WIDTH,
        C_B_WIDTH             => C_B_WIDTH,
        C_OUT_WIDTH           => C_OUT_WIDTH,
        C_LOW_BIT             => 0,
        C_HIGH_BIT            => C_OUT_WIDTH-1,
        C_ADD_MODE            => C_ADD_MODE,
        C_A_TYPE              => C_A_TYPE,
        C_B_TYPE              => C_B_TYPE,
        C_B_CONSTANT          => C_B_CONSTANT,
        C_B_VALUE             => C_B_VALUE,
        C_AINIT_VAL           => C_AINIT_VAL,
        C_SINIT_VAL           => C_SINIT_VAL,
        C_BYPASS_ENABLE       => C_CE_OVERRIDES_BYPASS,
        C_BYPASS_LOW          => C_BYPASS_LOW,
        C_SYNC_ENABLE         => C_CE_OVERRIDES_SCLR,
        C_SYNC_PRIORITY       => C_SCLR_OVERRIDES_SSET,
        C_PIPE_STAGES         => 0,     -- deprecated
        C_LATENCY             => ci_latency.used,
        C_HAS_S               => boolean'pos(C_LATENCY = 0),
        C_HAS_Q               => boolean'pos(C_LATENCY /= 0),
        C_HAS_C_IN            => boolean'pos(C_HAS_C_IN = 1 and C_ADD_MODE /= 1),
        C_HAS_C_OUT           => boolean'pos(C_LATENCY = 0 and C_ADD_MODE /= 1 and C_HAS_C_OUT = 1),
        C_HAS_Q_C_OUT         => boolean'pos(C_LATENCY /= 0 and C_ADD_MODE /= 1 and C_HAS_C_OUT = 1),
        C_HAS_B_IN            => boolean'pos(C_HAS_C_IN = 1 and C_ADD_MODE = 1),
        C_HAS_B_OUT           => boolean'pos(C_LATENCY = 0 and C_ADD_MODE = 1 and C_HAS_C_OUT = 1),
        C_HAS_Q_B_OUT         => boolean'pos(C_LATENCY /= 0 and C_ADD_MODE = 1 and C_HAS_C_OUT = 1),
        C_HAS_OVFL            => 0,     -- deprecated
        C_HAS_Q_OVFL          => 0,     -- deprecated
        C_HAS_CE              => C_HAS_CE,
        C_HAS_ADD             => boolean'pos(C_ADD_MODE = 2),
        C_HAS_BYPASS          => C_HAS_BYPASS,
        C_HAS_A_SIGNED        => 0,     -- deprecated
        C_HAS_B_SIGNED        => 0,     -- deprecated
        C_HAS_ACLR            => 0,     -- deprecated
        C_HAS_ASET            => 0,     -- deprecated
        C_HAS_AINIT           => 0,     -- deprecated
        C_HAS_SCLR            => C_HAS_SCLR,
        C_HAS_SSET            => C_HAS_SSET,
        C_HAS_SINIT           => C_HAS_SINIT,
        C_ENABLE_RLOCS        => 0,     -- deprecated
        C_HAS_BYPASS_WITH_CIN => 0      -- deprecated
        )
      port map(
        A        => A,
        B        => B,
        CLK      => CLK,
        ADD      => ADD,
        C_IN     => i_c_in,
        B_IN     => i_b_in,
        CE       => CE,
        BYPASS   => BYPASS,
        ACLR     => '0',
        ASET     => '0',
        AINIT    => '0',
        SCLR     => SCLR,
        SSET     => SSET,
        SINIT    => SINIT,
        A_SIGNED => '0',
        B_SIGNED => '0',
        OVFL     => open,
        C_OUT    => i_c_out,
        B_OUT    => i_b_out,
        Q_OVFL   => open,
        Q_C_OUT  => qi_c_out,
        Q_B_OUT  => qi_b_out,
        S        => i_s,
        Q        => i_q
        );

    map_registered_outputs : if C_LATENCY /= 0 generate
      S <= i_q;
      map_b_out : if C_ADD_MODE = 1 generate
        C_OUT <= qi_b_out;
      end generate map_b_out;
      map_c_out : if C_ADD_MODE /= 1 generate
        C_OUT <= qi_c_out;
      end generate map_c_out;
    end generate map_registered_outputs;
    map_unregistered_outputs : if C_LATENCY = 0 generate
      S <= i_s;
      map_b_out : if C_ADD_MODE = 1 generate
        C_OUT <= i_b_out;
      end generate map_b_out;
      map_c_out : if C_ADD_MODE /= 1 generate
        C_OUT <= i_c_out;
      end generate map_c_out;
    end generate map_unregistered_outputs;

    has_c_in : if (C_HAS_C_IN = 1 and C_ADD_MODE /= 1) generate
      i_c_in <= C_IN;
    end generate has_c_in;
    has_b_in : if (C_HAS_C_IN = 1 and C_ADD_MODE = 1) generate
      i_b_in <= C_IN;
    end generate has_b_in;


  end generate i_baseblox;

  xbip_addsub : if C_IMPLEMENTATION = 1 generate
--Individual typing was added for a and b inputs at top level in order to accommodate fabric;
--xbip implementation was designed to handle a single type for all inputs;
--Need to resize inputs individually according to type.

    constant ci_b_value  : std_logic_vector(c_b_width-1 downto 0)    := str_to_slv_0(C_B_VALUE, C_B_WIDTH);
    signal a_internal    : std_logic_vector (c_a_width-1 downto 0)   := (others => '0');
    signal b_internal    : std_logic_vector (c_b_width-1 downto 0)   := (others => '0');
    signal a_internal_ze : std_logic_vector (c_a_width downto 0)     := (others => '0');
    signal b_internal_ze : std_logic_vector (c_b_width downto 0)     := (others => '0');
    signal b_for_sum     : std_logic_vector (c_b_width-1 downto 0)   := (others => '0');
    signal i_out         : std_logic_vector (c_out_width-1 downto 0) := (others => '0');
    signal i_CE          : std_logic                                 := '1';
    signal i_SCLR        : std_logic                                 := '0';
    signal i_BYPASS      : std_logic                                 := '0';
    signal i_ADDF        : std_logic                                 := '0';  --this is i_ADD_false and a zero equates to an add in the usecase
    signal i_C_IN        : std_logic                                 := '0';
    signal i_C_OUT       : std_logic                                 := '0';
    signal i_CLK         : std_logic                                 := '0';

  begin

    -- Generate appropriate b input
    i_b_constant : if c_b_constant = 1 generate
      b_for_sum(c_b_width-1 downto 0) <= ci_b_value(c_b_width-1 downto 0);
    end generate i_b_constant;
    i_b_variable : if c_b_constant = 0 generate
      b_for_sum <= b;
    end generate i_b_variable;


    -- Generate a and b internal with no zero-extensions on inputs
    i_a_b_nogrowth : if ((c_a_type = 0 and c_b_type = 0) or (c_a_type = 1 and c_b_type = 1)) generate

      signal i_out1    : std_logic_vector (c_out_width-1+c_a_type downto 0) := (others => '0');
      signal add_delay : std_logic                                          := '0';
    begin
      a_internal(c_a_width-1 downto 0) <= A;
      b_internal(c_b_width-1 downto 0) <= b_for_sum;

      unsigned_max_width : if C_A_TYPE = 1 and C_B_TYPE = 1 and C_OUT_WIDTH = 48 generate
        -- Workaround for CR878268.  Carryout is not possible
        i_xbip_addsub : xbip_addsub_v3_0_3_viv
          generic map (
            C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
            C_LATENCY           => ci_latency.used,
            C_A_WIDTH           => C_A_WIDTH,
            C_B_WIDTH           => C_B_WIDTH,
            C_OUT_WIDTH         => C_OUT_WIDTH,
            C_BYPASS_LOW        => C_BYPASS_LOW,
            C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
            C_VERBOSITY         => C_VERBOSITY,
            C_MODEL_TYPE        => 0,
            C_DATA_TYPE         => c_a_type  --since a and b are the same type, use c_a_type
            )
          port map (
            CLK    => i_CLK,
            CE     => i_CE,
            SCLR   => i_SCLR,
            ADDF   => i_ADDF,
            BYPASS => i_BYPASS,
            C_IN   => i_C_IN,
            A      => a_internal,       --this is "C" in xbip.
            B      => b_internal,       --this is "A:B..:D" in xbip.
            Q      => i_out1(C_OUT_WIDTH-1 downto 0)
            );
      end generate unsigned_max_width;
      not_unsigned_max_width : if not(C_A_TYPE = 1 and C_B_TYPE = 1 and C_OUT_WIDTH = 48) generate
        i_xbip_addsub : xbip_addsub_v3_0_3_viv
          generic map (
            C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
            C_LATENCY           => ci_latency.used,
            C_A_WIDTH           => C_A_WIDTH,
            C_B_WIDTH           => C_B_WIDTH,
            C_OUT_WIDTH         => C_OUT_WIDTH+C_A_TYPE,  --necessary for C_OUT generation from bit stream
            C_BYPASS_LOW        => C_BYPASS_LOW,
            C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
            C_VERBOSITY         => C_VERBOSITY,
            C_MODEL_TYPE        => 0,
            C_DATA_TYPE         => c_a_type  --since a and b are the same type, use c_a_type
            )
          port map (
            CLK    => i_CLK,
            CE     => i_CE,
            SCLR   => i_SCLR,
            ADDF   => i_ADDF,
            BYPASS => i_BYPASS,
            C_IN   => i_C_IN,
            A      => a_internal,       --this is "C" in xbip.
            B      => b_internal,       --this is "A:B..:D" in xbip.
            Q      => i_out1
            );
      end generate not_unsigned_max_width;

-- S <= i_out;
--ADDED C_BORROW_LOW GENERIC TO ALLOW BORROW IN AND OUT SENSE TO AGREE WITH FABRIC OR BE OPTIMAL


      S <= i_out1(C_OUT_WIDTH-1 downto 0);

      --set carry_out equal to the MSB from the sum in dsp48
      has_c_out : if C_HAS_C_OUT = 1 and C_A_TYPE = 1 generate
        add_mode : if c_add_mode = 0 generate
          C_OUT <= i_out1(C_OUT_WIDTH+C_A_TYPE-1);    -- carry out from top bit
        end generate add_mode;
        sub_mode : if c_add_mode = 1 generate
          borrow_low : if c_borrow_low = 1 generate
            C_OUT <= not(i_out1(C_OUT_WIDTH+C_A_TYPE-1));  -- carry out from top bit
          end generate borrow_low;
          borrow_high : if c_borrow_low = 0 generate
            C_OUT <= i_out1(C_OUT_WIDTH+C_A_TYPE-1);  -- carry out from top bit
          end generate borrow_high;
        end generate sub_mode;
        addsub_mode : if c_add_mode = 2 generate
          borrow_low : if c_borrow_low = 1 generate
            equal_output : if (C_OUT_WIDTH = C_A_WIDTH) and (C_OUT_WIDTH = C_B_WIDTH) generate
              C_OUT <= i_out1(C_OUT_WIDTH+C_A_TYPE-1) when add_delay = '1' else not(i_out1(C_OUT_WIDTH+C_A_TYPE-1));  -- carry out from top bit
            end generate equal_output;
            non_equal_output : if (C_OUT_WIDTH > C_A_WIDTH) or (C_OUT_WIDTH > C_B_WIDTH) generate
              C_OUT <= i_out1(C_OUT_WIDTH-1) when add_delay = '1' else not(i_out1(C_OUT_WIDTH-1));  -- carry out from MSB of S
            end generate non_equal_output;
          end generate borrow_low;
          borrow_high : if c_borrow_low = 0 generate
            C_OUT <= i_out1(C_OUT_WIDTH+C_A_TYPE-1);  -- carry out from top bit
          end generate borrow_high;
        end generate addsub_mode;
      end generate has_c_out;

      has_no_c_out : if C_HAS_C_OUT = 0 generate
        C_OUT <= '0';
      end generate has_no_c_out;

      i_add_pipe : xbip_pipe_v3_0_3_viv
        generic map(
          C_LATENCY  => ci_latency.used,
          C_HAS_CE   => 1,
          C_HAS_SSET => 1,
          C_WIDTH    => 1
          )
        port map(
          CLK  => i_CLK,
          CE   => i_CE,
          SSET => i_SCLR,
          D(0) => add,
          Q(0) => add_delay
          );


    end generate i_a_b_nogrowth;


    i_a_extend : if (c_a_type = 1 and c_b_type = 0) generate
      b_internal(c_b_width-1 downto 0)    <= b_for_sum;
      a_internal_ze(c_a_width-1 downto 0) <= a;
      a_internal_ze(c_a_width)            <= '0';  -- zero extend unsigned a by 1 bit

      i_xbip_addsub : xbip_addsub_v3_0_3_viv
        generic map (
          C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
          C_LATENCY           => ci_latency.used,
          C_A_WIDTH           => C_A_WIDTH+1,  --extend unsigned a input by 1 bit and make it signed
          C_B_WIDTH           => C_B_WIDTH,
          C_OUT_WIDTH         => C_OUT_WIDTH,  --we need to constrain c_out_width (in pkg.vhd and tcl file) such that rollovers will not occur  (since we cannot extend c_out_width beyond what user specifies; c_out_width)
          C_BYPASS_LOW        => C_BYPASS_LOW,
          C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
          C_VERBOSITY         => C_VERBOSITY,
          C_MODEL_TYPE        => 0,
          C_DATA_TYPE         => 0  --extend unsigned a input by 1 bit and make it signed so c_data_type is signed
          )
        port map (
          CLK    => i_CLK,
          CE     => i_CE,
          SCLR   => i_SCLR,
          ADDF   => i_ADDF,
          BYPASS => i_BYPASS,
          C_IN   => i_C_IN,
          A      => a_internal_ze,
          B      => b_internal,
          Q      => i_out
          );

      S     <= i_out;
      C_OUT <= '0';


    end generate i_a_extend;


    i_b_extend : if (c_a_type = 0 and c_b_type = 1) generate
      a_internal(c_a_width-1 downto 0)    <= a;
      b_internal_ze(c_b_width-1 downto 0) <= b_for_sum;
      b_internal_ze(c_b_width)            <= '0';  -- zero extend unsigned b by 1 bit


      i_xbip_addsub : xbip_addsub_v3_0_3_viv
        generic map (
          C_XDEVICEFAMILY     => C_XDEVICEFAMILY,
          C_LATENCY           => ci_latency.used,
          C_A_WIDTH           => C_A_WIDTH,
          C_B_WIDTH           => C_B_WIDTH+1,
          C_OUT_WIDTH         => C_OUT_WIDTH,  --take care of c_out_width constraints in pkg.vhd and tcl so rollover does not occur
          C_BYPASS_LOW        => C_BYPASS_LOW,
          C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
          C_VERBOSITY         => C_VERBOSITY,
          C_MODEL_TYPE        => 0,
          C_DATA_TYPE         => 0  --extend unsigned b input by 1 bit and make it signed so c_data_type is signed
          )
        port map (
          CLK    => i_CLK,
          CE     => i_CE,
          SCLR   => i_SCLR,
          ADDF   => i_ADDF,
          BYPASS => i_BYPASS,
          C_IN   => i_C_IN,
          A      => a_internal,
          B      => b_internal_ze,
          Q      => i_out
          );

      S     <= i_out;
      C_OUT <= '0';

    end generate i_b_extend;



    --invert sense of add signal from fabric sense for dsp48 implementation
    mode_adder : if C_ADD_MODE = 0 generate
      i_ADDF <= '0';  --generic add_mode 0 is an add. port nomenclature is add = 1; (opposite of generic sense... just to make things confusing) So to get an add operation, the add port needs to be set to "1" in fabric but since the sense of this signal is switched around in the xbip_dsp48_addsub we need to set the addf port to "0" for an add.
    end generate mode_adder;
    mode_subtractor : if C_ADD_MODE = 1 generate
      i_ADDF <= '1';
    end generate mode_subtractor;
    mode_addsub : if C_ADD_MODE = 2 generate
      i_ADDF <= not(ADD);  --adds the inversion on the port sense to get from high add in c_addsub to low add in xbip_dsp48_addsub
    end generate mode_addsub;

    --add c_borrow_low generic to change the sense of cin and cout signal from fabric sense for dsp48 implementation
    mode_borrow_active_low : if ((C_BORROW_LOW = 1) and (C_ADD_MODE = 1) and (C_HAS_C_IN = 1)) generate
      i_C_IN <= not(C_IN);  --generic makes sense of borrow_in the same as fabric when subtracting
    end generate mode_borrow_active_low;

    mode_borrow_active_high : if ((C_BORROW_LOW = 0) and (C_ADD_MODE = 1) and (C_HAS_C_IN = 1)) or (C_HAS_C_IN = 1 and C_ADD_MODE = 0) generate
      i_C_IN <= (C_IN);
    end generate mode_borrow_active_high;

    mode_borrow_active_low_addsub : if C_HAS_C_IN = 1 and C_ADD_MODE = 2 and C_BORROW_LOW = 1 generate
      i_C_IN <= C_IN when ADD = '1' else not(C_IN);
    end generate mode_borrow_active_low_addsub;

    mode_borrow_active_high_addsub : if C_HAS_C_IN = 1 and C_ADD_MODE = 2 and C_BORROW_LOW = 0 generate
      i_C_IN <= C_IN;
    end generate mode_borrow_active_high_addsub;

    has_no_c_in : if C_HAS_C_IN = 0 generate
      i_C_IN <= '0';
    end generate has_no_c_in;


    has_ce : if C_HAS_CE = 1 generate
      i_CE <= CE;
    end generate has_ce;
    has_no_ce : if C_HAS_CE = 0 generate
      i_CE <= '1';
    end generate has_no_ce;

    has_clk : if C_LATENCY /= 0 generate
      i_CLK <= CLK;
    end generate has_clk;
    has_no_clk : if C_LATENCY = 0 generate
      i_CLK <= '0';
    end generate has_no_clk;

    has_sclr : if C_HAS_SCLR = 1 generate
      i_SCLR <= SCLR;
    end generate has_sclr;
    has_no_sclr : if C_HAS_SCLR = 0 generate
      i_SCLR <= '0';
    end generate has_no_sclr;

    has_bypass_normal : if (C_HAS_BYPASS = 1) and (C_BYPASS_LOW = 0) generate
      i_BYPASS <= BYPASS;
    end generate has_bypass_normal;

    has_bypass_low : if (C_HAS_BYPASS = 1) and (C_BYPASS_LOW = 1) generate
      i_BYPASS <= not(BYPASS);
    end generate has_bypass_low;

    has_no_bypass : if C_HAS_BYPASS = 0 generate
      i_BYPASS <= '0';
    end generate has_no_bypass;


  end generate xbip_addsub;

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

library c_addsub_v12_0_10;
use c_addsub_v12_0_10.c_addsub_v12_0_10_viv_comp.all;

entity c_addsub_v12_0_10 is
  generic (
    C_VERBOSITY           :     integer                                    := 0;
    C_XDEVICEFAMILY       :     string                                     := "no_family";
    C_IMPLEMENTATION      :     integer                                    := 0;
    C_A_WIDTH             :     integer                                    := 15;
    C_B_WIDTH             :     integer                                    := 15;
    C_OUT_WIDTH           :     integer                                    := 16;
    C_CE_OVERRIDES_SCLR   :     integer                                    := 0;  -- replaces c_sync_enable
    C_A_TYPE              :     integer                                    := 0;
    C_B_TYPE              :     integer                                    := 0;
    C_LATENCY             :     integer                                    := 1;
    C_ADD_MODE            :     integer                                    := 0;
    C_B_CONSTANT          :     integer                                    := 0;
    C_B_VALUE             :     string                                     := "0";
    C_AINIT_VAL           :     string                                     := "0";
    C_SINIT_VAL           :     string                                     := "0";
    C_CE_OVERRIDES_BYPASS :     integer                                    := 0;  -- replaces c_bypass_enable
    C_BYPASS_LOW          :     integer                                    := 0;
    C_SCLR_OVERRIDES_SSET :     integer                                    := 1;  -- replaces c_sync_priority
    C_HAS_C_IN            :     integer                                    := 0;
    C_HAS_C_OUT           :     integer                                    := 0;  -- may be registered in step with c_latency
    C_BORROW_LOW          :     integer                                    := 1;
    C_HAS_CE              :     integer                                    := 0;
    C_HAS_BYPASS          :     integer                                    := 0;
    C_HAS_SCLR            :     integer                                    := 0;
    C_HAS_SSET            :     integer                                    := 0;
    C_HAS_SINIT           :     integer                                    := 0
    );
  port (
    A                     : in  std_logic_vector(C_A_WIDTH-1 downto 0)     := (others => '0');
    B                     : in  std_logic_vector(C_B_WIDTH-1 downto 0)     := (others => '0');
    CLK                   : in  std_logic                                  := '0';
    ADD                   : in  std_logic                                  := '1';
    C_IN                  : in  std_logic                                  := '0';
    CE                    : in  std_logic                                  := '1';
    BYPASS                : in  std_logic                                  := '0';
    SCLR                  : in  std_logic                                  := '0';
    SSET                  : in  std_logic                                  := '0';
    SINIT                 : in  std_logic                                  := '0';
    C_OUT                 : out std_logic                                  := '0';
    S                     : out std_logic_vector(C_OUT_WIDTH - 1 downto 0) := (others => '0')
    );
--core_if off

end entity c_addsub_v12_0_10;

architecture xilinx of c_addsub_v12_0_10 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  xst_addsub : c_addsub_v12_0_10_viv
  generic map (
    C_VERBOSITY => C_VERBOSITY,
    C_XDEVICEFAMILY => C_XDEVICEFAMILY,
    C_IMPLEMENTATION => C_IMPLEMENTATION,
    C_A_WIDTH => C_A_WIDTH,
    C_B_WIDTH => C_B_WIDTH,
    C_OUT_WIDTH => C_OUT_WIDTH,
    C_CE_OVERRIDES_SCLR => C_CE_OVERRIDES_SCLR,
    C_A_TYPE => C_A_TYPE,
    C_B_TYPE => C_B_TYPE,
    C_LATENCY => C_LATENCY,
    C_ADD_MODE => C_ADD_MODE,
    C_B_CONSTANT => C_B_CONSTANT,
    C_B_VALUE => C_B_VALUE,
    C_AINIT_VAL => C_AINIT_VAL,
    C_SINIT_VAL => C_SINIT_VAL,
    C_CE_OVERRIDES_BYPASS => C_CE_OVERRIDES_BYPASS,
    C_BYPASS_LOW => C_BYPASS_LOW,
    C_SCLR_OVERRIDES_SSET => C_SCLR_OVERRIDES_SSET,
    C_HAS_C_IN => C_HAS_C_IN,
    C_HAS_C_OUT => C_HAS_C_OUT,
    C_BORROW_LOW => C_BORROW_LOW,
    C_HAS_CE => C_HAS_CE,
    C_HAS_BYPASS => C_HAS_BYPASS,
    C_HAS_SCLR => C_HAS_SCLR,
    C_HAS_SSET => C_HAS_SSET,
    C_HAS_SINIT => C_HAS_SINIT
  )
  port map (
    A => A,
    B => B,
    CLK => CLK,
    ADD => ADD,
    C_IN => C_IN,
    CE => CE,
    BYPASS => BYPASS,
    SCLR => SCLR,
    SSET => SSET,
    SINIT => SINIT,
    C_OUT => C_OUT,
    S => S
  );
  
end architecture xilinx;




