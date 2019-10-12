-- $RCSfile: c_compare_v12_0_3_viv_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 15:11:19 $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_v12_0_3_viv_comp.vhd
--  /   /
-- /___/   /\
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
--
-- Description - This file contains the component declaration for
--                               the c_compare_v12_0_3 core

library IEEE;
use IEEE.std_logic_1164.all;

package c_compare_v12_0_3_viv_comp is

----- Component c_compare_v12_0_3         -----
-- Short Description
--
-- (A)Synchronous Comparator
--

  --core_if on component xst
  component c_compare_v12_0_3_viv
    generic (
      C_FAMILY                    : string  := "virtex2";
      C_WIDTH                     : integer := 16;
      C_AINIT_VAL                 : string  := "0";
      C_DATA_TYPE                 : integer := 0;
      C_B_CONSTANT                : integer := 0;
      C_B_VALUE                   : string  := "0000000000000000";
      C_SYNC_ENABLE               : integer := 0;
      C_SYNC_PRIORITY             : integer := 1;
      C_PIPE_STAGES               : integer := 0;
      C_HAS_A_EQ_B                : integer := 1;
      C_HAS_A_NE_B                : integer := 0;
      C_HAS_A_LT_B                : integer := 0;
      C_HAS_A_GT_B                : integer := 0;
      C_HAS_A_LE_B                : integer := 0;
      C_HAS_A_GE_B                : integer := 0;
      C_HAS_QA_EQ_B               : integer := 0;
      C_HAS_QA_NE_B               : integer := 0;
      C_HAS_QA_LT_B               : integer := 0;
      C_HAS_QA_GT_B               : integer := 0;
      C_HAS_QA_LE_B               : integer := 0;
      C_HAS_QA_GE_B               : integer := 0;
      C_HAS_CE                    : integer := 0;
      C_HAS_ACLR                  : integer := 0;
      C_HAS_ASET                  : integer := 0;
      C_HAS_SCLR                  : integer := 0;
      C_HAS_SSET                  : integer := 0;
      C_ENABLE_RLOCS              : integer := 0;
      C_CARRY_CHAIN_EQ_NE         : integer := 0;
      C_INFERED_RTL_CONST_COMPARE : integer := 0;
      C_DENSE_LUT_PACKING         : integer := 0
      );

    port (
      A       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      B       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      CLK     : in  std_logic                            := '0';
      CE      : in  std_logic                            := '1';
      ACLR    : in  std_logic                            := '0';
      ASET    : in  std_logic                            := '0';
      SCLR    : in  std_logic                            := '0';
      SSET    : in  std_logic                            := '0';
      A_EQ_B  : out std_logic;
      A_NE_B  : out std_logic;
      A_LT_B  : out std_logic;
      A_GT_B  : out std_logic;
      A_LE_B  : out std_logic;
      A_GE_B  : out std_logic;
      QA_EQ_B : out std_logic;
      QA_NE_B : out std_logic;
      QA_LT_B : out std_logic;
      QA_GT_B : out std_logic;
      QA_LE_B : out std_logic;
      QA_GE_B : out std_logic
      );
  end component;

end c_compare_v12_0_3_viv_comp;


-- $RCSfile: c_compare_v12_0_3_comp.vhd,v $ $Revision: 1.3 $ $Date: 2009/09/08 15:11:18 $
--------------------------------------------------------------------------------
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
--
-- Description - This file contains the component declaration for
--                               the c_compare_v12_0_3 core

library IEEE;
use IEEE.std_logic_1164.all;

--LIBRARY XilinxCoreLib;
--USE XilinxCoreLib.xbip_utils_v3_0_7_pkg.ALL;

package c_compare_v12_0_3_comp is


----- Component c_compare_v12_0_3         -----
-- Short Description
--
-- (A)Synchronous Comparator
--

  --core_if on component no_coregen_specials
  component c_compare_v12_0_3
    generic (
      C_FAMILY                    : string  := "virtex2";
      C_WIDTH                     : integer := 16;
      C_AINIT_VAL                 : string  := "0";
      C_DATA_TYPE                 : integer := 0;
      C_B_CONSTANT                : integer := 0;
      C_B_VALUE                   : string  := "0000000000000000";
      C_SYNC_ENABLE               : integer := 0;
      C_SYNC_PRIORITY             : integer := 1;
      C_PIPE_STAGES               : integer := 0;
      C_HAS_A_EQ_B                : integer := 1;
      C_HAS_A_NE_B                : integer := 0;
      C_HAS_A_LT_B                : integer := 0;
      C_HAS_A_GT_B                : integer := 0;
      C_HAS_A_LE_B                : integer := 0;
      C_HAS_A_GE_B                : integer := 0;
      C_HAS_QA_EQ_B               : integer := 0;
      C_HAS_QA_NE_B               : integer := 0;
      C_HAS_QA_LT_B               : integer := 0;
      C_HAS_QA_GT_B               : integer := 0;
      C_HAS_QA_LE_B               : integer := 0;
      C_HAS_QA_GE_B               : integer := 0;
      C_HAS_CE                    : integer := 0;
      C_HAS_ACLR                  : integer := 0;
      C_HAS_ASET                  : integer := 0;
      C_HAS_SCLR                  : integer := 0;
      C_HAS_SSET                  : integer := 0;
      C_ENABLE_RLOCS              : integer := 0;
      C_CARRY_CHAIN_EQ_NE         : integer := 0;
      C_INFERED_RTL_CONST_COMPARE : integer := 0;
      C_DENSE_LUT_PACKING         : integer := 0
      );

    port (
      A       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      B       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
      CLK     : in  std_logic                            := '0';
      CE      : in  std_logic                            := '1';
      ACLR    : in  std_logic                            := '0';
      ASET    : in  std_logic                            := '0';
      SCLR    : in  std_logic                            := '0';
      SSET    : in  std_logic                            := '0';
      A_EQ_B  : out std_logic;
      A_NE_B  : out std_logic;
      A_LT_B  : out std_logic;
      A_GT_B  : out std_logic;
      A_LE_B  : out std_logic;
      A_GE_B  : out std_logic;
      QA_EQ_B : out std_logic;
      QA_NE_B : out std_logic;
      QA_LT_B : out std_logic;
      QA_GT_B : out std_logic;
      QA_LE_B : out std_logic;
      QA_GE_B : out std_logic
      );
    --core_if off
  end component;



END c_compare_v12_0_3_comp;


-- $Id: pkg_compare_v12_0.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
--  (c) Copyright 2004-2005 Xilinx, Inc. All rights reserved.
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
-- \   \   \/    Version: 8.0
--  \   \        Filename: pkg_compare_v12_0.vhd
--  /   /
-- /___/   /\
-- \   \  /  \
--  \___\/\___\
--
--
--
-- Contains component declarations used by the top-level c_compare_v12_0_3_viv core
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

PACKAGE pkg_compare_v12_0 IS

  COMPONENT c_compare_eq_ne IS
    GENERIC (
      c_family        : STRING  := "virtex2";
      c_lut_size      : INTEGER := 4;  -- Allow differentiation between devices
      c_operation     : INTEGER := 0;   -- 0 => A = B, 1 => A /= B
      c_width         : INTEGER := 16;  -- Width of the input data
      c_b_constant    : INTEGER := 0;   -- 0 => B variable, 1 => B CONSTANT
      c_ainit_val     : STRING  := "0";  -- Power-on reset value for any registers
      c_sync_priority : INTEGER := 1;
      c_sync_enable   : INTEGER := 0;
      c_has_ce        : INTEGER := 0;
      c_has_aclr      : INTEGER := 0;
      c_has_aset      : INTEGER := 0;
      c_has_sclr      : INTEGER := 0;
      c_has_sset      : INTEGER := 0;
      c_has_o         : INTEGER := 1;
      c_has_q         : INTEGER := 0;
      c_carry_chain_eq_ne : INTEGER := 0);
    PORT (
      a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      clk  : IN  STD_LOGIC;
      ce   : IN  STD_LOGIC;
      aclr : IN  STD_LOGIC;
      aset : IN  STD_LOGIC;
      sclr : IN  STD_LOGIC;
      sset : IN  STD_LOGIC;
      o    : OUT STD_LOGIC;
      q    : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT c_compare_lt_ge_gt_le IS
    GENERIC (
      c_data_type     : INTEGER := 0;   -- 0 => signed, 1 => unsigned
      c_operation     : INTEGER := 0;  -- 0 => A < B, 1 => A >= B, 2 => A > B, 3 => A <= B
      c_width         : INTEGER := 16);  -- Width of the input data
    PORT (
      a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      o    : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT c_compare_carry_structure IS
    GENERIC (
      c_data_type     : INTEGER := 0;   -- 0 => signed, 1 => unsigned
      c_lut_size      : INTEGER := 4;  -- Allow differentiation between devices
      c_bits_per_lut  : integer := 1;
      c_operation     : INTEGER := 0;  -- 0 => A < B, 1 => A >= B, 2 => A > B, 3 => A <= B
      c_b_constant    : INTEGER := 0;
      c_b_value       : STRING  := "0000";
      c_width         : INTEGER := 16;  -- Width of the input data
      c_ainit_val     : STRING  := "0";  -- Power-on reset value for any registers
      c_sync_priority : INTEGER := 1;
      c_sync_enable   : INTEGER := 0;
      c_has_ce        : INTEGER := 0;
      c_has_aclr      : INTEGER := 0;
      c_has_aset      : INTEGER := 0;
      c_has_sclr      : INTEGER := 0;
      c_has_sset      : INTEGER := 0;
      c_has_o         : INTEGER := 1;
      c_has_q         : INTEGER :=0);
    PORT (
      a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      clk  : IN  STD_LOGIC;
      ce   : IN  STD_LOGIC;
      aclr : IN  STD_LOGIC;
      aset : IN  STD_LOGIC;
      sclr : IN  STD_LOGIC;
      sset : IN  STD_LOGIC;
      o    : OUT STD_LOGIC;
      q    : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT c_compare_pipeline_equality IS
    GENERIC (
      c_family        : STRING  := "virtex2";
      c_data_type     : INTEGER := 0;   -- 0 => signed, 1 => unsigned
      c_lut_size      : INTEGER := 4;  -- Allow differentiation between devices
      c_operation     : INTEGER := 0;  -- 0 => A < B, 1 => A >= B, 2 => A > B, 3 => A <= B
      c_width         : INTEGER := 16;  -- Width of the input data
      c_b_constant    : INTEGER := 0;   -- 0 => B variable, 1 => B CONSTANT
      c_ainit_val     : STRING  := "0";  -- Power-on reset value for any registers
      c_sync_priority : INTEGER := 1;
      c_sync_enable   : INTEGER := 0;
      c_pipe_stages   : INTEGER;
      c_has_ce        : INTEGER := 0;
      c_has_aclr      : INTEGER := 0;
      c_has_aset      : INTEGER := 0;
      c_has_sclr      : INTEGER := 0;
      c_has_sset      : INTEGER := 0;
      c_has_o         : INTEGER := 1;
      c_has_q         : INTEGER := 0);
    PORT (
      a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      clk  : IN  STD_LOGIC;
      ce   : IN  STD_LOGIC;
      aclr : IN  STD_LOGIC;
      aset : IN  STD_LOGIC;
      sclr : IN  STD_LOGIC;
      sset : IN  STD_LOGIC;
      o    : OUT STD_LOGIC;
      q    : OUT STD_LOGIC);
  END COMPONENT;


  COMPONENT c_compare_pipeline_structure IS
    GENERIC (
      c_family        : STRING  := "virtex2";
      c_data_type     : INTEGER := 0;   -- 0 => signed, 1 => unsigned
      c_bits_per_lut  : INTEGER := 2;
      c_lut_size      : INTEGER := 4;  -- Allow differentiation between devices
      c_operation     : INTEGER := 0;  -- 0 => A < B, 1 => A >= B, 2 => A > B, 3 => A <= B
      c_width         : INTEGER := 16;  -- Width of the input data
      c_b_constant    : INTEGER := 0;   -- 0 => B variable, 1 => B CONSTANT
      c_b_value       : STRING  := "0000";
      c_ainit_val     : STRING  := "0";  -- Power-on reset value for any registers
      c_sync_priority : INTEGER := 1;
      c_sync_enable   : INTEGER := 0;
      c_pipe_stages   : INTEGER;
      c_has_ce        : INTEGER := 0;
      c_has_aclr      : INTEGER := 0;
      c_has_aset      : INTEGER := 0;
      c_has_sclr      : INTEGER := 0;
      c_has_sset      : INTEGER := 0;
      c_has_o         : INTEGER := 1;
      c_has_q         : INTEGER := 0);
    PORT (
      a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
      clk  : IN  STD_LOGIC;
      ce   : IN  STD_LOGIC;
      aclr : IN  STD_LOGIC;
      aset : IN  STD_LOGIC;
      sclr : IN  STD_LOGIC;
      sset : IN  STD_LOGIC;
      o    : OUT STD_LOGIC;
      q    : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT c_compare_pipeline_carry IS
    GENERIC (
      c_width      : INTEGER;
      c_b_constant : INTEGER;
      c_ainit_val  : STRING;
      c_sync_priority : INTEGER;
      c_sync_enable   : INTEGER;
      c_has_ce        : INTEGER;
      c_has_aclr      : INTEGER;
      c_has_aset      : INTEGER;
      c_has_sclr      : INTEGER;
      c_has_sset      : INTEGER;
      number_compare_blocks :INTEGER;
      c_lut_size  : INTEGER;
      no_pipe_stages    : INTEGER);
    PORT (
      np_cp    : IN  STD_LOGIC_VECTOR(number_compare_blocks -1 DOWNTO 0);
      np_eq    : IN  STD_LOGIC_VECTOR(number_compare_blocks -1 DOWNTO 0) := (OTHERS => '0');
      clk  : IN  STD_LOGIC;
      ce   : IN  STD_LOGIC;
      aclr : IN  STD_LOGIC;
      aset : IN  STD_LOGIC;
      sclr : IN  STD_LOGIC;
      sset : IN  STD_LOGIC;
      result_op    : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT c_compare_v12_0_3_rtl IS
    GENERIC (
      c_family        : STRING  := "virtex2";
      c_width         : INTEGER := 16;    -- input data width
      c_ainit_val     : STRING  := "0";   -- power-on value for output register
      c_data_type     : INTEGER := c_signed;  -- 0=c_signed or 1=c_unsigned
      c_b_constant    : INTEGER := 0;  -- specify if B is a constant to compare to
      c_b_value       : STRING  := "0000000000000000";  -- specify the constant B port value
      c_sync_enable   : INTEGER := 0;  -- 0=SYNC_OVERRIDES_CE, 1=CE_OVERRIDES_SYNC
      c_sync_priority : INTEGER := 1;  -- 0=SET_OVERRIDES_RESET, 1=RESET_OVERRIDES_SET
      c_pipe_stages   : INTEGER := 0;  -- valid values depend on operation and width
      c_has_a_eq_b    : INTEGER := 1;     -- async output generics a = b
      c_has_a_ne_b    : INTEGER := 0;     -- a /= b
      c_has_a_lt_b    : INTEGER := 0;     -- a < b
      c_has_a_gt_b    : INTEGER := 0;     -- a > b
      c_has_a_le_b    : INTEGER := 0;     -- a <= b
      c_has_a_ge_b    : INTEGER := 0;     -- a >= b
      c_has_qa_eq_b   : INTEGER := 0;     -- registered output generics a = b
      c_has_qa_ne_b   : INTEGER := 0;     -- a /= b
      c_has_qa_lt_b   : INTEGER := 0;     -- a < b
      c_has_qa_gt_b   : INTEGER := 0;     -- a > b
      c_has_qa_le_b   : INTEGER := 0;     -- a <= b
      c_has_qa_ge_b   : INTEGER := 0;     -- a >= b
      c_has_ce        : INTEGER := 0;     -- register controls
      c_has_aclr      : INTEGER := 0;
      c_has_aset      : INTEGER := 0;
      c_has_sclr      : INTEGER := 0;
      c_has_sset      : INTEGER := 0;
      c_enable_rlocs  : INTEGER := 0);
    PORT (
      a       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);  -- input value
      b       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);  -- input value
      clk     : IN  STD_LOGIC;            -- clock
      ce      : IN  STD_LOGIC;            -- clock enable
      aclr    : IN  STD_LOGIC;            -- async init.
      aset    : IN  STD_LOGIC;            -- async set
      sclr    : IN  STD_LOGIC;            -- sync init.
      sset    : IN  STD_LOGIC;            -- sync set
      a_eq_b  : OUT STD_LOGIC;            -- a = b output
      a_ne_b  : OUT STD_LOGIC;            -- a /= b output
      a_lt_b  : OUT STD_LOGIC;            -- a < b output
      a_gt_b  : OUT STD_LOGIC;            -- a > b output
      a_le_b  : OUT STD_LOGIC;            -- a <= b output
      a_ge_b  : OUT STD_LOGIC;            -- a >= b output
      qa_eq_b : OUT STD_LOGIC;            -- registered a = b output
      qa_ne_b : OUT STD_LOGIC;            -- registered a /= b output
      qa_lt_b : OUT STD_LOGIC;            -- registered a < b output
      qa_gt_b : OUT STD_LOGIC;            -- registered a > b output
      qa_le_b : OUT STD_LOGIC;            -- registered a <= b output
      qa_ge_b : OUT STD_LOGIC);
  END COMPONENT c_compare_v12_0_3_rtl;

  FUNCTION check_generics(c_width         : INTEGER;
                          c_ainit_val     : STRING;
                          c_data_type     : INTEGER;
                          c_b_constant    : INTEGER;
                          c_b_value       : STRING;
                          c_sync_enable   : INTEGER;
                          c_sync_priority : INTEGER;
                          c_pipe_stages   : INTEGER;
                          c_has_a_eq_b    : INTEGER;
                          c_has_a_ne_b    : INTEGER;
                          c_has_a_lt_b    : INTEGER;
                          c_has_a_gt_b    : INTEGER;
                          c_has_a_le_b    : INTEGER;
                          c_has_a_ge_b    : INTEGER;
                          c_has_qa_eq_b   : INTEGER;
                          c_has_qa_ne_b   : INTEGER;
                          c_has_qa_lt_b   : INTEGER;
                          c_has_qa_gt_b   : INTEGER;
                          c_has_qa_le_b   : INTEGER;
                          c_has_qa_ge_b   : INTEGER;
                          c_has_ce        : INTEGER;
                          c_has_aclr      : INTEGER;
                          c_has_aset      : INTEGER;
                          c_has_sclr      : INTEGER;
                          c_has_sset      : INTEGER;
                          c_enable_rlocs  : INTEGER;
                          lut_size : INTEGER) RETURN INTEGER;

  FUNCTION fn_pad_c_b_value (width                                                            : INTEGER; b_value : STRING) RETURN STRING;
  FUNCTION fn_maximise_width (c_width, lut_size, c_b_constant                                 : INTEGER) RETURN INTEGER;
  FUNCTION fn_calc_subblock_size (width, lut_size, pipe_stages,const_comp                     : INTEGER) RETURN INTEGER;
  FUNCTION fn_tree_logic_layers (no_comparator, no_bits                                       : INTEGER) RETURN INTEGER;
--  FUNCTION fn_pipe_flop_layout (logic_levels, pipe_depth                                      : INTEGER) RETURN STD_LOGIC_VECTOR;
  FUNCTION fn_part_block_needed (part_blox_bits                                               : INTEGER) RETURN INTEGER;
  FUNCTION fn_lt_or_gt (c_operation                                                           : INTEGER) RETURN INTEGER;
  FUNCTION fn_lt_ge_gt_le (has_qlt, has_lt, has_qgt, has_gt, has_qle, has_le, has_qge, has_ge : INTEGER) RETURN INTEGER;
  FUNCTION fn_eq_or_ne (has_qeq, has_eq, has_qne, has_ne                                      : INTEGER) RETURN INTEGER;
  FUNCTION fn_allow_async_ctrl (has_sclr, has_sset, has_async_ctrl                            : INTEGER) RETURN INTEGER;
  FUNCTION fn_and_or_or (has_eq, has_qeq, has_ne, has_qne                                     : INTEGER) RETURN INTEGER;
  FUNCTION fn_use_gate_bit_reg_ctrls (ctrl, pipe_stages, has_q                                : INTEGER) RETURN INTEGER;
  FUNCTION fn_generate_bcps (bits_per_lut, lut_no : INTEGER; b_const_pad_str: STRING) RETURN STRING;
  function fn_bits_per_lut_eq(c_b_constant, lut_size : integer) return integer;
  function fn_bits_per_lut_comp(c_b_constant, lut_size,  c_dense_lut_packing :integer) return integer;
  FUNCTION fn_number_luts(c_width, lut_size, bits_per_lut : INTEGER) RETURN INTEGER;


END PACKAGE pkg_compare_v12_0;

PACKAGE BODY pkg_compare_v12_0 IS

-- purpose: verifies correct combinations of generics
  FUNCTION check_generics(c_width         : INTEGER;
                          c_ainit_val     : STRING;
                          c_data_type     : INTEGER;
                          c_b_constant    : INTEGER;
                          c_b_value       : STRING;
                          c_sync_enable   : INTEGER;
                          c_sync_priority : INTEGER;
                          c_pipe_stages   : INTEGER;
                          c_has_a_eq_b    : INTEGER;
                          c_has_a_ne_b    : INTEGER;
                          c_has_a_lt_b    : INTEGER;
                          c_has_a_gt_b    : INTEGER;
                          c_has_a_le_b    : INTEGER;
                          c_has_a_ge_b    : INTEGER;
                          c_has_qa_eq_b   : INTEGER;
                          c_has_qa_ne_b   : INTEGER;
                          c_has_qa_lt_b   : INTEGER;
                          c_has_qa_gt_b   : INTEGER;
                          c_has_qa_le_b   : INTEGER;
                          c_has_qa_ge_b   : INTEGER;
                          c_has_ce        : INTEGER;
                          c_has_aclr      : INTEGER;
                          c_has_aset      : INTEGER;
                          c_has_sclr      : INTEGER;
                          c_has_sset      : INTEGER;
                          c_enable_rlocs  : INTEGER;
                          lut_size : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION check_generics

    IF c_data_type = c_unsigned THEN
      ASSERT c_width > 0 AND c_width < 257
        REPORT "ERROR: c_compare_v12_0_3_viv: Input width must be in the range 1 to 256 for UNSIGNED data"
        SEVERITY failure;
    ELSIF c_data_type = c_signed THEN
      ASSERT c_width > 1 AND c_width < 257
        REPORT "ERROR: c_compare_v12_0_3_viv: Input width must be in the range 2 to 256 for SIGNED data"
        SEVERITY failure;
    END IF;

    ASSERT c_data_type = 0 OR c_data_type = c_unsigned
      REPORT "ERROR: c_compare_v12_0_3_viv: Invalid data type specified - possible values are 0 (signed) or 1 (unsigned)"
      SEVERITY failure;

    IF c_b_constant /= 0 THEN
      ASSERT c_b_value'length /= 0
        REPORT "WARNING: c_compare_v12_0_3_viv: Constant B port value undefined - defaulting to all zeros"
        SEVERITY warning;
      IF c_width > c_b_value'length THEN
        ASSERT false
          REPORT "WARNING: c_compare_v12_0_3_viv: Constant B value (c_b_value) is shorter than " & INTEGER'image(c_width) & " bits - it will be zero-extended up to the MSB"
          SEVERITY warning;
      ELSIF c_width < c_b_value'length THEN
        ASSERT false
          REPORT "WARNING: c_compare_v12_0_3_viv: Constant B value (c_b_value) is longer than " & INTEGER'image(c_width) & " bits - it will be truncated at the MSB (left-hand side) end"
          SEVERITY warning;
      END IF;
    END IF;

    ASSERT c_sync_enable = 0 OR c_sync_enable = 1
      REPORT "ERROR: c_compare_v12_0_3_viv: Invalid value for c_sync_enable - possible values are 0 (SYNC_OVERRIDES_CE) or 1 (CE_OVERRIDES_SYNC)"
      SEVERITY failure;

    ASSERT c_sync_priority = 0 OR c_sync_priority = 1
      REPORT "ERROR: c_compare_v12_0_3_viv: Invalid value for c_sync_enable - possible values are 0 (SET_OVERRIDES_RESET) or 1 (RESET_OVERRIDES_SET)"
      SEVERITY failure;

    IF c_has_qa_eq_b = 0 AND c_has_qa_ne_b = 0 AND c_has_qa_lt_b = 0 AND c_has_qa_gt_b = 0 AND c_has_qa_le_b = 0 AND c_has_qa_ge_b = 0 THEN
      IF c_has_a_eq_b = 0 AND c_has_a_ne_b = 0 AND c_has_a_lt_b = 0 AND c_has_a_gt_b = 0 AND c_has_a_le_b = 0 AND c_has_a_ge_b = 0 THEN
        ASSERT false REPORT "ERROR: c_compare_v12_0_3_viv: At least one output must be selected for the comparator!" SEVERITY failure;
      END IF;
      ASSERT c_has_aclr = 0 AND c_has_aset = 0 AND c_has_sclr = 0 AND c_has_sset = 0 AND c_has_ce = 0 AND (NOT(c_pipe_stages > 0))
        REPORT "WARNING: c_compare_v12_0_3_viv: No synchronous output has been selected - CE, async controls or sync controls will not be implemented"
        SEVERITY warning;
    END IF;

    ASSERT c_pipe_stages < 6
      REPORT "ERROR: c_compare_v12_0_3_viv: c_pipe_stages generic is invalid - the valid range is 0 to 5, depending on core input width and function"
      SEVERITY failure;

    IF c_pipe_stages > 0 THEN
      -- allow users to generate sync AND async outputs even if the core is pipelined - just tap the 'async' output off from before the output REGISTER

      -- equality comparisons
      IF c_has_a_eq_b /= 0 OR c_has_qa_eq_b /= 0 OR c_has_a_ne_b /= 0 OR c_has_qa_ne_b /= 0 THEN
        IF c_b_constant = 0 THEN
          CASE lut_size IS
            WHEN 4 =>
              CASE c_pipe_stages IS
                WHEN 1      => ASSERT c_width > 2 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 2 for 1 pipeline stage" SEVERITY failure;
                WHEN 2      => ASSERT c_width > 8 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 8 for 2 pipeline stages" SEVERITY failure;
                WHEN 3      => ASSERT c_width > 32 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 32 for 3 pipeline stages" SEVERITY failure;
                WHEN 4      => ASSERT c_width > 128 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 128 for 4 pipeline stages" SEVERITY failure;
                WHEN OTHERS => ASSERT false
                                 REPORT "ERROR: c_compare_v12_0_3_viv: Invalid c_width value entered - c_pipe_stages should be in the range 0 to 4 for variable equality comparison"
                                 SEVERITY failure;
              END CASE;
              WHEN 6 =>
                CASE c_pipe_stages IS
                  WHEN 1      => ASSERT c_width > 3 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 3 for 1 pipeline stage" SEVERITY failure;
                  WHEN 2      => ASSERT c_width > 18 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 18 for 2 pipeline stages" SEVERITY failure;
                  WHEN 3      => ASSERT c_width > 108 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 108 for 3 pipeline stages" SEVERITY failure;
                  WHEN OTHERS => ASSERT false
                                   REPORT "ERROR: c_compare_v12_0_3_viv: Invalid c_width value entered - c_pipe_stages should be in the range 0 to 3 for variable equality comparison"
                                   SEVERITY failure;
                END CASE;
            WHEN OTHERS => ASSERT false REPORT "ERROR: c_compare_v12_0_3_viv: Invalid lut_size detected in check_generics in c_compare_v12_0_3_viv" SEVERITY failure;
          END CASE;
        ELSIF c_b_constant /= 0 THEN
          CASE lut_size IS
            WHEN 4 =>
              CASE c_pipe_stages IS
                WHEN 1      => ASSERT c_width > 4 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 4 for 1 pipeline stage" SEVERITY failure;
                WHEN 2      => ASSERT c_width > 16 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 16 for 2 pipeline stages" SEVERITY failure;
                WHEN 3      => ASSERT c_width > 64 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 64 for 3 pipeline stages" SEVERITY failure;
                WHEN OTHERS => ASSERT false
                                 REPORT "ERROR: c_compare_v12_0_3_viv: Invalid c_width value entered - c_pipe_stages should be in the range 0 to 3 for constant equality comparison"
                                 SEVERITY failure;
              END CASE;
              WHEN 6 =>
                CASE c_pipe_stages IS
                  WHEN 1      => ASSERT c_width > 6 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 6 for 1 pipeline stage" SEVERITY failure;
                  WHEN 2      => ASSERT c_width > 36 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 36 for 2 pipeline stages" SEVERITY failure;
                  WHEN 3      => ASSERT c_width > 216 REPORT "ERROR: c_compare_v12_0_3_viv: c_width must be > 216 for 3 pipeline stages" SEVERITY failure;
                  WHEN OTHERS => ASSERT false
                                   REPORT "ERROR: c_compare_v12_0_3_viv: Invalid c_width value entered - c_pipe_stages should be in the range 0 to 3 for constant equality comparison"
                                   SEVERITY failure;
                END CASE;
            WHEN OTHERS => ASSERT false REPORT "ERROR: c_compare_v12_0_3_viv: Invalid lut_size detected in check_generics in c_compare_v12_0_3_viv" SEVERITY failure;
          END CASE;
        END IF;
      END IF;

      -- Inequality comparisons
      IF c_has_a_lt_b /= 0 OR c_has_qa_lt_b /= 0 OR c_has_a_gt_b /= 0 OR c_has_qa_gt_b /= 0
        OR c_has_a_le_b /= 0 OR c_has_qa_le_b /= 0 OR c_has_a_ge_b /= 0 OR c_has_qa_ge_b /= 0 THEN
        -- Difference is only in the first stage LUTs, not in the core structure,
        -- so only allow max. 1 level of pipelining independent of variable or constant compares
        CASE c_pipe_stages IS
          WHEN 0      => ASSERT false REPORT "NOTE: c_compare_v12_0_3_viv: No pipelining has been implemented" SEVERITY note;  -- this should not be executed
          WHEN OTHERS      => ASSERT false REPORT "NOTE: c_compare_v12_0_3_viv: One level of pipelining implemented" SEVERITY note;
--          WHEN OTHERS => ASSERT false REPORT "ERROR: c_compare_v12_0_3_viv: Maximum of one pipeline stage supported for inequality comparisons" SEVERITY failure;
        END CASE;
      END IF;

    END IF;  -- c_pipe_stages /= 0

    ASSERT c_enable_rlocs = 0
      REPORT "WARNING: c_compare_v12_0_3_viv: RLOCs are not supported in this core version"
      SEVERITY warning;

    ASSERT ((c_has_a_eq_b /= 0 OR c_has_qa_eq_b /= 0)
            XOR (c_has_a_ne_b /= 0 OR c_has_qa_ne_b /= 0)
            XOR (c_has_a_lt_b /= 0 OR c_has_qa_lt_b /= 0)
            XOR (c_has_a_gt_b /= 0 OR c_has_qa_gt_b /= 0)
            XOR (c_has_a_ge_b /= 0 OR c_has_qa_ge_b /= 0)
            XOR (c_has_a_le_b /= 0 OR c_has_qa_le_b /= 0))
      REPORT "ERROR: c_compare_v12_0_3_viv: Only one comparison (with registered and/or non-registered outputs) can be performed per instantiated core"
      SEVERITY failure;

    IF (c_has_aclr /= 0 OR c_has_aset /= 0) AND (c_has_sclr /= 0 OR c_has_sset /= 0) AND c_pipe_stages > 0 THEN
      ASSERT false
        REPORT "WARNING: c_compare_v12_0_3_viv: Including both asynchronous (ACLR, ASET) AND synchronous controls " &
        "(SCLR, SSET) will add a layer of logic and impact performance"
        SEVERITY warning;
    END IF;

    IF (c_ainit_val'length = 0
        AND (c_has_qa_eq_b /= 0
             OR c_has_qa_ne_b /= 0
             OR c_has_qa_lt_b /= 0
             OR c_has_qa_gt_b /= 0
             OR c_has_qa_le_b /= 0
             OR c_has_qa_ge_b /= 0)) THEN
      ASSERT false
        REPORT "WARNING: c_compare_v12_0_3_viv: No output register power-on value specified in c_ainit_val - defaulting to '0'"
        SEVERITY warning;
    END IF;

    RETURN 0;
  END FUNCTION check_generics;

-------------------------------------------------------------------------------
-- Utility functions
-------------------------------------------------------------------------------

  -- purpose: Pads out the c_b_value string if it is not the same length as
  -- c_width or truncates it if it is too long
  FUNCTION fn_pad_c_b_value(width : INTEGER; b_value : STRING) RETURN STRING IS
    VARIABLE ret_str : STRING(1 TO width);
  BEGIN  -- FUNCTION fn_pad_c_b_value
    IF b_value'length /= width THEN
      IF b_value'length > width THEN
        ret_str := b_value(b_value'right-width+1 TO b_value'right);  -- truncate at the MSB end (left-hand side)
      ELSE                                                    -- b_value'length > width
        ret_str(width-b_value'length+1 TO width) := b_value;
        ret_str(1 TO width-b_value'length)       := (OTHERS => '0');  -- pad the bits up to the MSB with zeros
      END IF;
--      ASSERT false REPORT "c_compare_v12_0_3_viv - c_b_value string has been padded to " & ret_str SEVERITY warning;
      RETURN ret_str;
    ELSE
      RETURN b_value;
    END IF;
  END FUNCTION fn_pad_c_b_value;

  -- purpose: Rounds up the width to the nearest multiple of the number of required input stages for the pipelined cores
  FUNCTION fn_maximise_width(c_width, lut_size, c_b_constant : INTEGER) RETURN INTEGER IS
    CONSTANT bits_per_lut : INTEGER := lut_size/(2-c_b_constant);
  BEGIN  -- FUNCTION fn_maximise_width
    IF c_width MOD bits_per_lut = 0 THEN
      RETURN c_width;
    ELSE
      RETURN (((c_width/bits_per_lut)+1)*bits_per_lut);
    END IF;
  END FUNCTION fn_maximise_width;

  -- purpose: Determines the optimal sub-block size for the pipelined < > <= >= comparisons depending on the input width
  FUNCTION fn_calc_subblock_size(width, lut_size, pipe_stages,const_comp : INTEGER) RETURN INTEGER IS
    variable tmp : INTEGER := 0;
    variable minimum : INTEGER := 0;
  BEGIN  -- FUNCTION fn_calc_subblock_size
    -- pass in the LUT size
    IF pipe_stages  = 1 THEN
      CASE lut_size IS
        WHEN 4 =>
          CASE width IS
            WHEN 1 TO 8     => RETURN 2;
            WHEN 9 TO 32    => RETURN 4;
            WHEN 33 TO 48   => RETURN 6;  -- should give slightly better result than blocksize 8
            WHEN 49 TO 128  => RETURN 8;
            WHEN 129 TO 256 => RETURN 16;
            WHEN OTHERS     => ASSERT false
                                 REPORT "ERROR: Invalid width detected in fn_calc_subblock_size in c_compare_v12_0_3_viv"
                                 SEVERITY failure;
                               RETURN 2;  -- default return to stop ModelSim complaining
          END CASE;
        WHEN 6 => --may change for v5
          CASE width IS
            WHEN 1 TO 8     => RETURN 2;
            WHEN 9 TO 32    => RETURN 4;
            WHEN 33 TO 48   => RETURN 6;  -- should give slightly better result than blocksize 8
            WHEN 49 TO 128  => RETURN 8;
            WHEN 129 TO 256 => RETURN 16;
            WHEN OTHERS     => ASSERT false
                                 REPORT "ERROR: Invalid width detected in fn_calc_subblock_size in c_compare_v12_0_3_viv"
                                 SEVERITY failure;
                               RETURN 2;  -- default return to stop ModelSim complaining
          END CASE;
        WHEN OTHERS => ASSERT false
                         REPORT "ERROR: Invalid lut_size detected in fn_calc_subblock_size in c_compare_v12_0_3_viv"
                         SEVERITY failure;
                       RETURN 2;  -- default return to stop ModelSim complaining
      END CASE;
    ELSE
      tmp := width/((lut_size/2)**(pipe_stages - 1)) + 1;
      minimum :=  (lut_size/2)*(1+const_comp);

      if tmp < minimum then
        return minimum;
      else
        return tmp;
      end if;
    END IF;
  END FUNCTION fn_calc_subblock_size;

  -- purpose: determines the number of layers of logic required in non-carry chain compare
  FUNCTION fn_tree_logic_layers(no_comparator, no_bits: INTEGER) RETURN INTEGER IS
    BEGIN --FUNCTION fn_tree_logic_layers
      if no_bits = 3 then
        CASE no_comparator IS
          WHEN 1 TO 3  => RETURN 1;
          WHEN 4 TO 9  => RETURN 2;
          WHEN 10 TO 27  => RETURN 3;
          WHEN 28 TO 81  => RETURN 4;
          WHEN 82 TO 243  => RETURN 5;
          WHEN OTHERS => ASSERT false
                           REPORT "ERROR comparator width exceeds maximum possible"
                           SEVERITY failure;
                         RETURN 6; -- default return to stop ModelSim complaining
        END CASE;
      else
        CASE no_comparator IS
          WHEN 1 TO 2  => RETURN 1;
          WHEN 3 TO 4  => RETURN 2;
          WHEN 5 TO 8  => RETURN 3;
          WHEN 9 TO 16  => RETURN 4;
          WHEN 17 TO 32  => RETURN 5;
          WHEN OTHERS => ASSERT false
                           REPORT "ERROR comparator width exceeds maximum possible"
                           SEVERITY failure;
                         RETURN 6; -- default return to stop ModelSim complaining
        END CASE;
      end if;
    END FUNCTION fn_tree_logic_layers;

--  --determine pattern of flops for a given logic levels and pipe length.
--  FUNCTION fn_pipe_flop_layout(logic_levels, pipe_depth : INTEGER) RETURN STD_LOGIC_VECTOR IS
--    BEGIN --FUNCTION fn_tree_logic_layers
--      --the pipe depth is 1 less than requested, because always flop eq and lt block
--      --ops. logic depth is less for the same reason
--      CASE logic_levels IS
--        WHEN 1          =>
--          CASE pipe_depth IS
--            WHEN 0      => RETURN '0'&'0'&'0'&'0'&'0';
--            WHEN 1      => RETURN '0'&'0'&'0'&'0'&'1';
--            WHEN OTHERS => ASSERT false
--                             REPORT "ERROR more pipe stages requsted than logic stages"
--                             SEVERITY failure;
--                           RETURN '0'&'0'&'0'&'0'&'0'; -- default return to stop ModelSim complaining
--          END CASE;
--        WHEN 2          =>
--          CASE pipe_depth IS
--            WHEN 0      => RETURN '0'&'0'&'0'&'0'&'0';
--            WHEN 1      => RETURN '0'&'0'&'0'&'1'&'0';
--            WHEN 2      => RETURN '0'&'0'&'0'&'1'&'1';
--            WHEN OTHERS => ASSERT false
--                             REPORT "ERROR more pipe stages requsted than logic stages"
--                             SEVERITY failure;
--                           RETURN '0'&'0'&'0'&'0'&'0'; -- default return to stop ModelSim complaining
--          END CASE;
--        WHEN 3          =>
--          CASE pipe_depth IS
--            WHEN 0      => RETURN '0'&'0'&'0'&'0'&'0';
--            WHEN 1      => RETURN '0'&'0'&'0'&'1'&'0';
--            WHEN 2      => RETURN '0'&'0'&'1'&'0'&'1';
--            WHEN 3      => RETURN '0'&'0'&'1'&'1'&'1';
--            WHEN OTHERS => ASSERT false
--                             REPORT "ERROR more pipe stages requsted than logic stages"
--                             SEVERITY failure;
--                           RETURN '0'&'0'&'0'&'0'&'0'; -- default return to stop ModelSim complaining
--          END CASE;
--        WHEN 4          =>
--          CASE pipe_depth is
--            WHEN 0      => RETURN '0'&'0'&'0'&'0'&'0';
--            WHEN 1      => RETURN '0'&'0'&'1'&'0'&'0';
--            WHEN 2      => RETURN '0'&'1'&'0'&'1'&'0';
--            WHEN 3      => RETURN '0'&'1'&'0'&'1'&'1';
--            WHEN 4      => RETURN '0'&'1'&'1'&'1'&'1';
--            WHEN OTHERS => ASSERT false
--                             REPORT "ERROR more pipe stages requsted than logic stages"
--                             SEVERITY failure;
--                           RETURN '0'&'0'&'0'&'0'&'0'; -- default return to stop ModelSim complaining
--          END CASE;
--        WHEN 5          =>
--          CASE pipe_depth is
--            WHEN 0      => RETURN '0'&'0'&'0'&'0'&'0';
--            WHEN 1      => RETURN '0'&'0'&'1'&'0'&'0';
--            WHEN 2      => RETURN '0'&'1'&'0'&'1'&'0';
--            WHEN 3      => RETURN '0'&'1'&'1'&'0'&'1';
--            WHEN 4      => RETURN '1'&'1'&'0'&'1'&'1';
--            WHEN 5      => RETURN '1'&'1'&'1'&'1'&'1';
--            WHEN OTHERS => ASSERT false
--                             REPORT "ERROR more pipe stages requsted than logic stages"
--                             SEVERITY failure;
--                           RETURN '0'&'0'&'0'&'0'&'0'; -- default return to stop ModelSim complaining
--          END CASE;
--        WHEN OTHERS => ASSERT false
--                         REPORT "ERROR too many logic stages"
--                         SEVERITY failure;
--                       RETURN '0'&'0'&'0'&'0'&'0'; -- default return to stop ModelSim complaining
--      END CASE;
--    END FUNCTION fn_pipe_flop_layout;

  -- purpose: determines if a non-full block is needed and returns 1 if required
  -- to allow generation of the correct length of carry chain
  FUNCTION fn_part_block_needed(part_blox_bits : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_part_block_needed
    IF part_blox_bits = 0 THEN
      RETURN 0;
    ELSE
      RETURN 1;
    END IF;
  END FUNCTION fn_part_block_needed;

  -- purpose: Determines if the < or > operation is required for the pipelined < > <= >= compares
  FUNCTION fn_lt_or_gt(c_operation : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_lt_or_gt
    IF c_operation = 1 or c_operation = 2 THEN
      RETURN 2;                         -- use a < block
    ELSE
      RETURN 0;                         -- return a default
    END IF;
  END FUNCTION fn_lt_or_gt;

  -- purpose: Determines the integer value for the comparison at the foot of the pipelined inequality compare chain
  FUNCTION fn_lt_ge_gt_le(has_qlt, has_lt, has_qgt, has_gt, has_qle, has_le, has_qge, has_ge : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_lt_ge_gt_le
    IF has_qlt /= 0 OR has_lt /= 0 THEN
      RETURN 0;
    ELSIF has_qge /= 0 OR has_ge /= 0 THEN
      RETURN 1;
    ELSIF has_qgt /= 0 OR has_gt /= 0 THEN
      RETURN 2;
    ELSIF has_qle /= 0 OR has_le /= 0 THEN
      RETURN 3;
    ELSE
      RETURN 0;                         -- default <
    END IF;
  END FUNCTION fn_lt_ge_gt_le;

  -- purpose: Determines if the = or /= operation is required for the pipelined = /= compares
  FUNCTION fn_eq_or_ne(has_qeq, has_eq, has_qne, has_ne : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_eq_or_ne
    IF has_qeq /= 0 OR has_eq /= 0 THEN
      RETURN 0;                         -- use =
    ELSIF has_qne /= 0 OR has_ne /= 0 THEN
      RETURN 1;                         -- use /=
    ELSE
      RETURN 0;                         -- return a default
    END IF;
  END FUNCTION fn_eq_or_ne;

  -- purpose: Decide if async ctrls are allowed on the pipeline registers to
  -- avoid having multiple instantiations of components for the pipelined cases
  FUNCTION fn_allow_async_ctrl(has_sclr, has_sset, has_async_ctrl : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_allow_aclr
    IF has_sclr /= 0 OR has_sset /= 0 THEN
      RETURN 0;
    ELSE
      IF has_async_ctrl /= 0 THEN
        RETURN 1;
      ELSE
        RETURN 0;
      END IF;
    END IF;
  END FUNCTION fn_allow_async_ctrl;

-- purpose: Use gate_bit as an AND or an OR gate
  FUNCTION fn_and_or_or(has_eq, has_qeq, has_ne, has_qne : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_and_or_or
    IF has_eq /= 0 OR has_qeq /= 0 THEN
      RETURN 0;                         -- AND gate
    ELSIF has_ne /= 0 OR has_qne /= 0 THEN
      RETURN 2;                         -- OR gate
    ELSE
      RETURN 0;                         -- default value - never used
    END IF;
  END FUNCTION fn_and_or_or;

  -- purpose: Allows use of gate_bit register controls depending on the number of pipeline stages implemented within the gate_bit core
  FUNCTION fn_use_gate_bit_reg_ctrls(ctrl, pipe_stages, has_q : INTEGER) RETURN INTEGER IS
  BEGIN  -- FUNCTION fn_use_gate_bit_reg_ctrls
    IF pipe_stages > 1  OR has_q = 1 THEN
      RETURN ctrl;
    ELSE
      RETURN 0;
    END IF;
  END FUNCTION fn_use_gate_bit_reg_ctrls;

--  -- purpose: A different length of string is required for the =, /= implementations compared to the < etc.
--  -- so we decide on the implementation here and then pad the string to the correct width
--  FUNCTION fn_pad_str_to_imp_size(c_has_a_eq_b, c_has_qa_eq_b, c_has_a_ne_b, c_has_qa_ne_b : INTEGER;
--                                  max_width, c_width, c_b_constant : INTEGER; c_b_value : STRING) RETURN STRING IS
--  BEGIN  -- FUNCTION fn_pad_str_to_imp_size
--    IF (c_has_a_eq_b /= 0 OR c_has_qa_eq_b /= 0 OR c_has_a_ne_b /= 0 OR c_has_qa_ne_b /= 0) and c_b_constant /= 1 THEN
--      if max_width > c_width and c_b_value'length > c_width then
----      IF max_width > c_width THEN
--        RETURN fn_pad_c_b_value(max_width, c_b_value(c_b_value'right-c_width+1 TO c_b_value'right));-- truncate the constant to c_width and pad with 0's,otherwise longer than c_width constants fail
--      ELSE
--        RETURN fn_pad_c_b_value(c_width, c_b_value);
--      END IF;
--    ELSE                                -- the operation must be <, <=, > or >=
--      RETURN fn_pad_c_b_value(c_width, c_b_value);
--    END IF;
--  END FUNCTION fn_pad_str_to_imp_size;

  FUNCTION fn_generate_bcps(bits_per_lut, lut_no : INTEGER; b_const_pad_str: STRING) RETURN STRING IS
  BEGIN --FUNCTION fn_generate_bcps
    if (bits_per_lut*(lut_no+1)) < b_const_pad_str'length then
      return b_const_pad_str((bits_per_lut*lut_no + 1) TO (bits_per_lut*(lut_no+1)));
    else
      return "----";
    end if;
  END FUNCTION fn_generate_bcps;

  --calculate number of luts required for the implementation
  --for purposes of comaprator the number of luts refers to the number of lt,gt units and equality units, not the totla
  --lut count..
  function fn_bits_per_lut_eq(c_b_constant, lut_size : integer) return integer is
  begin --function fn_bits_per_lut_eq
    --no carry chain considerations for Eq or ne.
    if c_b_constant = 0 and lut_size = 4 then
      return 2;
    elsif c_b_constant = 0 and lut_size = 6 then
      return 3;
    elsif c_b_constant = 1 and lut_size = 4 then
      return 4;
    else
      return 6;
    end if;
  end fn_bits_per_lut_eq;

  function fn_bits_per_lut_comp(c_b_constant, lut_size,  c_dense_lut_packing :integer) return integer is
  begin --function fn_bits_per_lut_comp
    if (c_b_constant = 0 and lut_size = 4 and c_dense_lut_packing = 0) then
      return 1;
    elsif (c_b_constant = 0 and ((lut_size = 4 and c_dense_lut_packing /= 0) or (lut_size = 6 and c_dense_lut_packing = 0))) then
      return 2;
    elsif c_b_constant = 0 and lut_size = 6 and c_dense_lut_packing /= 0 then
      return 3;
    elsif c_b_constant /= 0 and lut_size = 4 then --constant compare - virtex4(may use RT LUT?)
      return 4;
    elsif c_b_constant /= 0 and lut_size = 6 and c_dense_lut_packing = 0 then
      return 5;
    else
      --constant compare, lut6, no carry chain(or seperate cc) - 6 bits per lut.
      return 6;
    end if;
  end fn_bits_per_lut_comp;

  FUNCTION fn_number_luts(c_width, lut_size, bits_per_lut : INTEGER) RETURN INTEGER IS
    variable partial_lut :INTEGER;
    variable tmp_width : integer;--needed to factor in the odd bottom lengths
  BEGIN  -- FUNCTION fn_number_luts
    if (( bits_per_lut = 2 and lut_size = 6) or bits_per_lut = 5) and c_width /= 1 then
      tmp_width := c_width - 1;
    else
      tmp_width := c_width;
    end if;

    if ((tmp_width)mod bits_per_lut) = 0 then
      partial_lut := 0;
    else
      partial_lut := 1;
    end if;

    --can return 0, but only at "LUT_ONLY" lengths, so don't care
    return (tmp_width/bits_per_lut) + partial_lut;
  END FUNCTION fn_number_luts;

END PACKAGE BODY pkg_compare_v12_0;


-- $Id: c_compare_eq_ne.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_eq_ne.vhd 
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- ******************* Core Functionality ************************************
--
-- * Sub-core for c_compare_v12_0_3_viv
-- * Performs equal-to and not-equal-to comparisons
-- * Uses carry-chain when LUTs are too slow
-- * Can be instantiated to build up pipelined cores
--
-- ******************* Design Notes ************************************
--
-- The code is written such that it infers the correct LUT sizes to drive the
-- carry chain depending on the target family and if the comparison is to be to
-- a constant or to a variable.  Smaller comparisons use LUTs exclusively in
-- order to improve speed with a small increase in resources.
-- By breaking it down, the form of the AND operation on the output can be decided
-- at a later stage and the = and /= operators can be used for inferring each LUT
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

-- Used on the output of the pipelined = /= compares
LIBRARY c_gate_bit_v12_0_3;
USE c_gate_bit_v12_0_3.c_gate_bit_v12_0_3_viv_comp.ALL;

-- Allow primitive instantiation
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_compare_eq_ne IS
  GENERIC (
    c_family        : STRING;
    c_lut_size      : INTEGER;  -- Allow differentiation between devices
    c_operation     : INTEGER;          -- 0 => A = B, 1 => A /= B
    c_width         : INTEGER;          -- Width of the input data
    c_b_constant    : INTEGER;          -- 0 => B variable, 1 => B CONSTANT
    c_ainit_val     : STRING;   -- Power-on reset value for any registers
    c_sync_priority : INTEGER;
    c_sync_enable   : INTEGER;
    c_has_ce        : INTEGER;
    c_has_aclr      : INTEGER;
    c_has_aset      : INTEGER;
    c_has_sclr      : INTEGER;
    c_has_sset      : INTEGER;
    c_has_o         : INTEGER;
    c_has_q         : INTEGER;
    c_carry_chain_eq_ne : INTEGER);
  PORT (
    a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    clk  : IN  STD_LOGIC;
    ce   : IN  STD_LOGIC;
    aclr : IN  STD_LOGIC;
    aset : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    sset : IN  STD_LOGIC;
    o    : OUT STD_LOGIC;
    q    : OUT STD_LOGIC);

END ENTITY c_compare_eq_ne;

ARCHITECTURE struct OF c_compare_eq_ne IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";


  TYPE T_OPERATION IS (EQUAL, NOT_EQUAL);

-- purpose: Converts c_operation to more readable enum type
  FUNCTION fn_get_operation(c_operation : INTEGER) RETURN T_OPERATION IS
  BEGIN  -- FUNCTION fn_get_operation
    CASE c_operation IS
      WHEN 0      => RETURN EQUAL;
      WHEN 1      => RETURN NOT_EQUAL;
      WHEN OTHERS => ASSERT false REPORT "ERROR: Invalid c_operation value caught in c_compare_eq_ne" SEVERITY failure;
                     RETURN EQUAL;  -- Return a default to keep compiler happy
    END CASE;
  END FUNCTION fn_get_operation;

  CONSTANT operation : T_OPERATION := fn_get_operation(c_operation);

  CONSTANT lut_size : INTEGER := c_lut_size;

  -- Internal signal that can take the B port value or take the B constant
  -- value when it is assigned to be a constant
  SIGNAL b_i : STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);

  -- Stores the result of the comparison before being assigned to the output
  -- ports required - SLV to be compatible with reg_fd_v8_0 BaseBlock ports
  SIGNAL result : STD_LOGIC;

  -- purpose: rounds the width value up to the nearest factor of 4
  --CR7745078 rephrased to guarantee parser always sees a return value
  FUNCTION fn_round_to_nearest_lut(c_width, lut_size, c_b_constant : INTEGER) RETURN INTEGER IS
    VARIABLE width_i : INTEGER := c_width;
  BEGIN  -- FUNCTION fn_round_to_nearest_lut
    IF width_i MOD lut_size = 0 THEN
      IF c_b_constant = 0 THEN
        RETURN 2*(width_i/lut_size);  -- use 2x as many LUTs for variable equality compares
      end if;
      RETURN width_i/lut_size;
    ELSE
      WHILE width_i MOD lut_size /= 0 LOOP
        width_i := width_i + 1;
      END LOOP;
      IF c_b_constant = 0 THEN
        RETURN 2*(width_i/lut_size);  -- use 2x as many LUTs for variable equality compares
      end if;
      RETURN width_i/lut_size;
    END IF;
  END FUNCTION fn_round_to_nearest_lut;

  CONSTANT full_lut_width : INTEGER := fn_round_to_nearest_lut(c_width, lut_size, c_b_constant);

  -- purpose: Rounds up the width to the nearest multiple of the number of required input stages for the pipelined cores
  FUNCTION fn_maximise_width(c_width, lut_size : INTEGER) RETURN INTEGER IS
    VARIABLE width_i : INTEGER := c_width;
  BEGIN  -- FUNCTION fn_maximise_width
    IF width_i MOD lut_size = 0 THEN
      RETURN width_i;
    ELSE
      WHILE width_i MOD lut_size /= 0 LOOP
        width_i := width_i + 1;
      END LOOP;
      RETURN width_i;
    END IF;
  END FUNCTION fn_maximise_width;

  CONSTANT max_width : INTEGER := fn_maximise_width(c_width, lut_size);

  SIGNAL a_ext : STD_LOGIC_VECTOR(max_width-1 DOWNTO 0);
  SIGNAL b_ext : STD_LOGIC_VECTOR(max_width-1 DOWNTO 0);

  SIGNAL sel : STD_LOGIC_VECTOR(full_lut_width-1 DOWNTO 0);  -- removed 2*
  SIGNAL q_i : STD_LOGIC := '0';
  -- purpose: Determine which value to feed into carry chain CI input at foot of chain
  FUNCTION fn_cc_ci(operation : T_OPERATION)
    RETURN STD_LOGIC IS
  BEGIN  -- FUNCTION fn_cc_ci
    IF operation = EQUAL THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION fn_cc_ci;
  
BEGIN  -- ARCHITECTURE struct

  b_i <= b;

  -- Extend the 'a' vector to ensure that XST uses full LUTs
  a_ext(c_width-1 DOWNTO 0) <= a;
  xtd_a_vect : IF c_width MOD lut_size /= 0 GENERATE
    a_ext(max_width-1 DOWNTO c_width) <= (OTHERS => '0');
  END GENERATE xtd_a_vect;

  -- Extend 'b_i' vector to ensure XST uses full LUTs
  b_ext(c_width-1 DOWNTO 0) <= b_i;
  xtd_b_vect : IF c_width MOD lut_size /= 0 GENERATE
    b_ext(max_width-1 DOWNTO c_width) <= (OTHERS => '0');
  END GENERATE xtd_b_vect;

--------------------------------------------------------------------------------
-- Equality Comparator
--------------------------------------------------------------------------------

  -- Faster to use LUTs for constant and variable B-input equality tests up to
  -- 64-bit inputs after which the carry chain method is faster

  -- If the compare is <= one full LUT, don't require any extra circuitry;
  -- infer one LUT
  i_single_lut : IF (c_width <= lut_size AND c_b_constant /= 0) OR (c_width <= lut_size/2 AND c_b_constant = 0) GENERATE
    a_eq_b : IF operation = EQUAL GENERATE
      result <= '1' WHEN (a = b_i) ELSE '0';  -- will infer a single LUT            
    END GENERATE a_eq_b;
    a_ne_b : IF operation = NOT_EQUAL GENERATE
      result <= '1' WHEN (a /= b_i) ELSE '0';  -- will infer a single LUT            
    END GENERATE a_ne_b;
  END GENERATE i_single_lut;

  i_use_carry_plus_luts : IF (c_width > lut_size AND c_b_constant /= 0) OR (c_width > lut_size/2 AND c_b_constant = 0) GENERATE

    -- When the compare is larger than one full LUT, we generate partial
    -- results in the LUTs and then, depending on the compare width, use LUTs or
    -- the carry chain to do the AND operation on the partial results
    -- It can be between 20MHz and 50MHz faster to use the LUTs on the smaller
    -- compares in Virtex2 than using the carry chain

    gen_const : IF c_b_constant /= 0 GENERATE
      gen_eq_luts_const : FOR i IN 0 TO full_lut_width-1 GENERATE
        sel(i) <= '1' WHEN (a_ext(((lut_size-1)+(i*lut_size)) DOWNTO 0+(i*lut_size)) = b_ext(((lut_size-1)+(i*lut_size)) DOWNTO 0+(i*lut_size))) ELSE '0';
      END GENERATE gen_eq_luts_const;
    END GENERATE gen_const;

    gen_var : IF c_b_constant = 0 GENERATE
      gen_eq_luts_var : FOR i IN 0 TO full_lut_width-1 GENERATE  -- need 2x the LUTs used for constant compares
        CONSTANT half_lut_size : INTEGER := lut_size/2;
      BEGIN
        sel(i) <= '1' WHEN (a_ext(((half_lut_size-1)+(i*half_lut_size)) DOWNTO 0+(i*half_lut_size)) = b_ext(((half_lut_size-1)+(i*half_lut_size)) DOWNTO 0+(i*half_lut_size))) ELSE '0';
      END GENERATE gen_eq_luts_var;
    END GENERATE gen_var;

  -- and gate based combining of partial eq/neq
    lut_and : IF c_carry_chain_eq_ne = 0 GENERATE
      CONSTANT and_gate : INTEGER := 0;  -- force this to be an and gate
      SIGNAL temp_result : STD_LOGIC;
    BEGIN
      i_gate_bit : c_gate_bit_v12_0_3_viv
        GENERIC MAP(
          c_family         => c_family,
          c_gate_type      => and_gate,
          c_inputs         => full_lut_width,
          c_input_inv_mask => "0",
          c_pipe_stages    => 0,  -- first level of pipeline already in the eq_ne block as the o/p register
          c_ainit_val      => c_ainit_val,
          c_sinit_val      => "0",
          c_sync_priority  => c_sync_priority,
          c_sync_enable    => c_sync_enable,
          c_has_o          => 1,
          c_has_q          => 0,
          c_has_ce         => c_has_ce,
          c_has_aclr       => 0,
          c_has_aset       => 0,
          c_has_ainit      => 0,
          c_has_sclr       => 0,
          c_has_sset       => 0,
          c_has_sinit      => 0,
          c_enable_rlocs   => 0
          )
        PORT MAP(
          i     => sel,
          clk   => clk,
          ce    => ce,
          aclr  => aclr,
          aset  => aset,
          ainit => '0',
          sclr  => sclr,
          sset  => sset,
          sinit => '0',
          o     => temp_result,
          t     => '0',
          en    => '0'
          );        

      result <= NOT(temp_result) WHEN operation = NOT_EQUAL ELSE temp_result;
    END GENERATE lut_and;

--     i_widthupto31 : IF (lut_size = 4 AND ((c_width < 32 AND c_b_constant = 0) OR (c_width < 64 AND c_b_constant /= 0))) GENERATE
--       -- purpose: Implements a LUT-based AND gate for best speed performance to AND the outputs of the equality test
--       lut_and : PROCESS (sel) IS
--                                 VARIABLE temp_result : STD_LOGIC;
--         BEGIN  -- PROCESS lut_and
--         CASE full_lut_width IS
--           WHEN 1      => temp_result := sel(0);
--           WHEN 2      => temp_result := sel(0) AND sel(1);
--           WHEN 3      => temp_result := sel(0) AND sel(1) AND sel(2);
--           WHEN 4      => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3);
--           WHEN 5      => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4);
--           WHEN 6      => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5);
--           WHEN 7      => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6);
--           WHEN 8      => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7);
--           WHEN 9      => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8);
--           WHEN 10     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9);
--           WHEN 11     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9) AND sel(10);
--           WHEN 12     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9) AND sel(10) AND sel(11);
--           WHEN 13     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9) AND sel(10) AND sel(11) AND sel(12);
--           WHEN 14     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9) AND sel(10) AND sel(11) AND sel(12) AND sel(13);
--           WHEN 15     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9) AND sel(10) AND sel(11) AND sel(12) AND sel(13) AND sel(14);
--           WHEN 16     => temp_result := sel(0) AND sel(1) AND sel(2) AND sel(3) AND sel(4) AND sel(5) AND sel(6) AND sel(7) AND sel(8) AND sel(9) AND sel(10) AND sel(11) AND sel(12) AND sel(13) AND sel(14) AND sel(15);
--           WHEN OTHERS => ASSERT false REPORT "illegal value detected in i_widthupto31" SEVERITY failure;
--         END CASE;
--      CASE operation IS
--        WHEN EQUAL     => result <= temp_result;
--        WHEN NOT_EQUAL => result <= NOT(temp_result);
--        WHEN OTHERS    => ASSERT false REPORT "ERROR: Illegal operation detected in process in c_compare_eq_ne" SEVERITY failure;
--      END CASE;
-- END PROCESS lut_and;
--    END GENERATE i_widthupto31;

--    i_over31wide : IF NOT((lut_size = 4 AND ((c_width < 32 AND c_b_constant = 0) OR (c_width < 64 AND c_b_constant /= 0)))) GENERATE
    i_over31wide : IF c_carry_chain_eq_ne /= 0 GENERATE
      SIGNAL cc_ci : STD_LOGIC := fn_cc_ci(operation);
      SIGNAL cc_di : STD_LOGIC := NOT(fn_cc_ci(operation));
      SIGNAL carry : STD_LOGIC_VECTOR(2*full_lut_width-1 DOWNTO 0);
    BEGIN
      gen_muxcy : FOR i IN 0 TO full_lut_width-1 GENERATE
        gen_first : IF i = 0 GENERATE
          carry_mux : MUXCY
            PORT MAP (
              O  => carry(0),
              CI => cc_ci,
              DI => cc_di,
              S  => sel(0));              
        END GENERATE gen_first;
        gen_others : IF i /= 0 GENERATE
          carry_mux : MUXCY
            PORT MAP (
              O  => carry(i),
              CI => carry(i-1),
              DI => cc_di,
              S  => sel(i));              
        END GENERATE gen_others;
      END GENERATE gen_muxcy;

      i_async_output : IF c_has_q = 0 GENERATE
        result <= carry(full_lut_width-1);
      END GENERATE i_async_output;

      i_sync_output : IF c_has_q /= 0 AND c_has_o = 0 GENERATE
        result <= carry(full_lut_width-1);
      END GENERATE i_sync_output;

      i_sync_and_async_output : IF c_has_q /= 0 AND c_has_o /= 0 GENERATE
        
        i_mixed_reg_ctrls : IF ((c_has_aclr /= 0 OR c_has_aset /= 0) XOR (c_has_sclr /= 0 OR c_has_sset /= 0))
                              OR (c_has_aclr = 0 AND c_has_aset = 0 AND c_has_sclr = 0 AND c_has_sset = 0) GENERATE
          result <= carry(full_lut_width-1);
        END GENERATE i_mixed_reg_ctrls;

        i_same_or_no_reg_ctrls : IF NOT((c_has_aclr /= 0 OR c_has_aset /= 0) XOR (c_has_sclr /= 0 OR c_has_sset /= 0))
                                   AND NOT(c_has_aclr = 0 AND c_has_aset = 0 AND c_has_sclr = 0 AND c_has_sset = 0) GENERATE
          result_xor : XORCY
            PORT MAP (
              O  => result,
              CI => carry(full_lut_width-1),
              LI => '0');           
        END GENERATE i_same_or_no_reg_ctrls;
        
      END GENERATE i_sync_and_async_output;
      
    END GENERATE i_over31wide;
    
  END GENERATE i_use_carry_plus_luts;

  gen_async_output : IF c_has_o /= 0 GENERATE
    o <= result;
  END GENERATE gen_async_output;

  gen_output_reg : IF c_has_q /= 0 GENERATE
    output_reg : c_reg_fd_v12_0_3_viv
      GENERIC MAP(
        c_width         => 1,
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => "0",
        c_sync_priority => c_sync_priority,
        c_sync_enable   => c_sync_enable,
        c_has_ce        => c_has_ce,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => 0,
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => 0,
        c_enable_rlocs  => 0
        )
      PORT MAP(
        clk   => clk,
        ce    => ce,
        ainit => '0',
        aclr  => aclr,
        aset  => aset,
        sinit => '0',
        sclr  => sclr,
        sset  => sset,
        d(0)  => result,
        q(0)  => q_i
        );  
  END GENERATE gen_output_reg;

  o_tie : IF c_has_o = 0 GENERATE
  begin
    o <= result;
  end generate;  
  
  q_tie : IF c_has_q = 0 GENERATE
  begin
    q_i <= result;
  end generate;  


  q <= q_i;
  
END ARCHITECTURE struct;



-- $Id: c_compare_lt_ge_gt_le.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_lt_ge_gt_le.vhd 
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- ******************* Core Functionality ************************************
--
-- * Sub-core for c_compare_v12_0_3_viv
-- * Performs less-than, greater-than-equal-to, greater-than and
--   less-than-equal-to comparisons
-- * Registered and/or async. outputs
-- * Supports all Xilinx architectures.
-- * Very small compares implemented using a LUT only.  Larger compares
--   implemented using the carry chain
-- * Can be instantiated to build up pipelined compares
-- 
-- ******************* Design Notes ************************************
--
-- Uses the fact that < is the inverse of >= and > is the inverse of <= to use
-- the same structure for all comparisons
--
-- XST inference is pretty good for the constant comparisons, so we don't have
-- to worry about working out if there are redundant bits in the constant
-- string to compare to - using the signed and unsigned keywords allows XST to
-- synthesise the correct logic
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_compare_lt_ge_gt_le IS
  GENERIC (
    c_data_type     : INTEGER;          -- 0: signed, 1: unsigned
    c_operation     : INTEGER;  -- 0: A < B, 1: A >= B, 2: A > B, 3: A <= B
    c_width         : INTEGER          -- Width of the input data
    );
  PORT (
    a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');
    o    : OUT STD_LOGIC);

END ENTITY c_compare_lt_ge_gt_le;

ARCHITECTURE struct OF c_compare_lt_ge_gt_le IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";


  TYPE T_OPERATION IS (LESS_THAN, GREATER_THAN_EQUAL, GREATER_THAN, LESS_THAN_EQUAL);

  -- purpose: Converts c_operation to more readable enum type
  FUNCTION fn_get_operation(c_operation : INTEGER) RETURN T_OPERATION IS
  BEGIN  -- FUNCTION fn_get_operation
    CASE c_operation IS
      WHEN 0      => RETURN LESS_THAN;
      WHEN 1      => RETURN GREATER_THAN_EQUAL;
      WHEN 2      => RETURN GREATER_THAN;
      WHEN 3      => RETURN LESS_THAN_EQUAL;
      WHEN OTHERS => ASSERT false REPORT "ERROR: Invalid c_operation value caught in c_compare_lt_ge_gt_le" SEVERITY failure;
                     RETURN LESS_THAN;  -- Return a default to keep compiler happy
    END CASE;
  END FUNCTION fn_get_operation;

  CONSTANT operation : T_OPERATION := fn_get_operation(c_operation);


  -- Stores the result of the comparison before being assigned to the output
  -- ports required - SLV to be compatible with reg_fd_v8_0 BaseBlock ports
  SIGNAL result : STD_LOGIC;

  
BEGIN  -- ARCHITECTURE struct
  -------------------------------------------------------------------------------
  -- short comparisons
  -----------------------
  -- implements a basic RTL compar, called from up the heirarchy when basic compare is short enough to not warrant
  -- structural code, or from the structural block - sized appropriatley- , which may have come from the pipeline
  -- structuring block
    
  -- For 2-bit compares, use one LUT
  -- For larger compares, use LUTs and the carry chain
  -- The LUTs are set up as basic subtractor blocks with the MUXCYs
  -- < is the inverse of >= and > is the inverse of <=, so all operations can
  -- be implemented in a similar fashion apart from which signals are passed into
  -- the MUXCY and the value fed into the bottom of the carry chain
-------------------------------------------------------------------------------  

    a_lt_b : IF operation = LESS_THAN GENERATE
      i_signed : IF c_data_type = c_signed GENERATE
        result <= '1' WHEN (SIGNED(a(c_width-1 DOWNTO 0)) < SIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_signed;
      i_unsigned : IF c_data_type = c_unsigned GENERATE
        result <= '1' WHEN (UNSIGNED(a(c_width-1 DOWNTO 0)) < UNSIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_unsigned;
    END GENERATE a_lt_b;
    a_ge_b : IF operation = GREATER_THAN_EQUAL GENERATE
      i_signed : IF c_data_type = c_signed GENERATE
        result <= '1' WHEN (SIGNED(a(c_width-1 DOWNTO 0)) >= SIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_signed;
      i_unsigned : IF c_data_type = c_unsigned GENERATE
        result <= '1' WHEN (UNSIGNED(a(c_width-1 DOWNTO 0)) >= UNSIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_unsigned;
    END GENERATE a_ge_b;
    a_gt_b : IF operation = GREATER_THAN GENERATE
      i_signed : IF c_data_type = c_signed GENERATE
        result <= '1' WHEN (SIGNED(a(c_width-1 DOWNTO 0)) > SIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_signed;
      i_unsigned : IF c_data_type = c_unsigned GENERATE
        result <= '1' WHEN (UNSIGNED(a(c_width-1 DOWNTO 0)) > UNSIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_unsigned;
    END GENERATE a_gt_b;
    a_le_b : IF operation = LESS_THAN_EQUAL GENERATE
      i_signed : IF c_data_type = c_signed GENERATE
        result <= '1' WHEN (SIGNED(a(c_width-1 DOWNTO 0)) <= SIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_signed;
      i_unsigned : IF c_data_type = c_unsigned GENERATE
        result <= '1' WHEN (UNSIGNED(a(c_width-1 DOWNTO 0)) <= UNSIGNED(b(c_width-1 DOWNTO 0))) ELSE '0';
      END GENERATE i_unsigned;
    END GENERATE a_le_b;

    o <= result;
    
END ARCHITECTURE struct;



-- $Id: c_compare_carry_structure.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_carry_structure.vhd 
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- ******************* Core Functionality ************************************
--
-- * Sub-core for c_compare_v12_0_3_viv
-- * Performs less-than, greater-than-equal-to, greater-than and
--   less-than-equal-to comparisons
-- * Registered and/or async. outputs
-- * Supports all Xilinx architectures.
-- * Very small compares implemented using a LUT only.  Larger compares
--   implemented using the carry chain
-- * Can be instantiated to build up pipelined compares
-- 
-- ******************* Design Notes ************************************
--
-- Uses the fact that < is the inverse of >= and > is the inverse of <= to use
-- the same structure for all comparisons
--
-- XST inference is pretty good for the constant comparisons, so we don't have
-- to worry about working out if there are redundant bits in the constant
-- string to compare to - using the signed and unsigned keywords allows XST to
-- synthesise the correct logic
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.pkg_compare_v12_0.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_compare_carry_structure IS
  GENERIC (
    c_data_type     : INTEGER;          -- 0: signed, 1: unsigned
    c_lut_size      : INTEGER;  -- Allow differentiation between devices
    c_bits_per_lut  : INTEGER;
    c_operation     : INTEGER;  -- 0: A < B, 1: A >= B, 2: A > B, 3: A <= B
    c_b_constant    : INTEGER;
    c_b_value       : STRING;
    c_width         : INTEGER;          -- Width of the input data
    c_ainit_val     : STRING;   -- Power-on reset value for any registers
    c_sync_priority : INTEGER;
    c_sync_enable   : INTEGER;
    c_has_ce        : INTEGER;
    c_has_aclr      : INTEGER;
    c_has_aset      : INTEGER;
    c_has_sclr      : INTEGER;
    c_has_sset      : INTEGER;
    c_has_o         : INTEGER;
    c_has_q         : INTEGER);
  PORT (
    a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');
    clk  : IN  STD_LOGIC;
    ce   : IN  STD_LOGIC;
    aclr : IN  STD_LOGIC;
    aset : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    sset : IN  STD_LOGIC;
    o    : OUT STD_LOGIC;
    q    : OUT STD_LOGIC);

END ENTITY c_compare_carry_structure;

ARCHITECTURE struct OF c_compare_carry_structure IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";


  TYPE T_OPERATION IS (LESS_THAN, GREATER_THAN_EQUAL, GREATER_THAN, LESS_THAN_EQUAL);
  -- purpose: Converts c_operation to more readable enum type
  FUNCTION fn_get_operation(c_operation : INTEGER) RETURN T_OPERATION IS
  BEGIN  -- FUNCTION fn_get_operation
    CASE c_operation IS
      WHEN 0      => RETURN LESS_THAN;
      WHEN 1      => RETURN GREATER_THAN_EQUAL;
      WHEN 2      => RETURN GREATER_THAN;
      WHEN 3      => RETURN LESS_THAN_EQUAL;
      WHEN OTHERS => ASSERT false REPORT "ERROR: Invalid c_operation value caught in c_compare_carry_structure" SEVERITY failure;
                     RETURN LESS_THAN;  -- Return a default to keep compiler happy
    END CASE;
  END FUNCTION fn_get_operation;

  CONSTANT operation : T_OPERATION := fn_get_operation(c_operation);

--stolen from old _viv for constants - use to resuce code size....
--  CONSTANT np_part_block_needed : integer := fn_part_block_needed((c_width REM translated_lut_size));
--
--  TYPE T_NP_DATA_TYPE IS ARRAY (0 TO (c_width / translated_lut_size)) OF integer RANGE 0 TO 1;
--
--  FUNCTION fn_assign_np_datatypes(data_type : integer) RETURN T_NP_DATA_TYPE IS
--    VARIABLE ret                            : T_NP_DATA_TYPE := (OTHERS => 1);  -- all unsigned is default
--  BEGIN  -- FUNCTION fn_assign_datatypes
--    CASE data_type IS
--      WHEN c_signed                                                     =>
--        ret(0)                                               := c_signed;
--      WHEN c_unsigned                                                   =>
--        NULL;
--      WHEN OTHERS                                                       =>
--        ASSERT false
--          REPORT "ERROR                     : Unknown c_data_type detected in fn_assign_np_datatypes in c_compare_v12_0_3_viv"
--          SEVERITY failure;
--    END CASE;
--    RETURN ret;
--  END FUNCTION fn_assign_np_datatypes;
--
--  -- Allows the pipelined < > <= >= to implement signed comparisons with
--  -- partial results - first (MSB) value will be a 0 for signed, all others 1
--  -- Note this is a different length from T_DATA_TYPE
--  CONSTANT np_datatype : T_NP_DATA_TYPE := fn_assign_np_datatypes(c_data_type);

  
  

  -- Stores the result of the comparison before being assigned to the output
  -- ports required - SLV to be compatible with reg_fd_v8_0 BaseBlock ports
  SIGNAL result : STD_LOGIC;

  -- Indicate whether to use a > or < block for the pipelined < > <= >= compares
  CONSTANT lt_or_gt : integer := fn_lt_or_gt(c_operation);
  constant total_luts : integer := fn_number_luts(c_width, c_lut_size, c_bits_per_lut);
  
  signal part_compare_result :STD_LOGIC_VECTOR(total_luts-1 downto 0);
  SIGNAL carry : STD_LOGIC_VECTOR(total_luts-1 DOWNTO 0);
  SIGNAL sel   : STD_LOGIC_VECTOR(total_luts-1 DOWNTO 0);

  -- Enumerated type for implementation of the non-pipelined <, >, <=, >= compares
  TYPE T_IMP IS (LUTS_ONLY, CARRY_CHAIN);

  -- purpose: Works out from the generic data how the <, <=, >, >= non-pipelined comparator should be implemented
  FUNCTION fn_determine_imp(width : integer; lut_size : integer; b_constant : integer; operation:integer; const: string) RETURN T_IMP IS
    VARIABLE bit_pos              : integer := width;
    VARIABLE bits                 : integer := width;
  BEGIN  -- FUNCTION fn_determine_imp
    IF b_constant /= 0 THEN
      CASE width IS
        WHEN 1 TO 12 => RETURN LUTS_ONLY;
        WHEN OTHERS  =>

          CASE operation IS
            WHEN 0      =>                -- less-than
              FOR i IN width DOWNTO 1 LOOP  -- work from right to left
                IF const(i) = '1' THEN
                  bit_pos          := width-i;
                  EXIT;
                ELSE
                  NULL;                   -- do nothing
                END IF;
              END LOOP;  -- i
            WHEN 2      =>                -- greater-than
              FOR i IN width DOWNTO 1 LOOP  -- work from right to left
                IF const(i) = '0' THEN
                  bit_pos          := width-i;
                  EXIT;
                ELSE
                  NULL;                   -- do nothing
                END IF;
              END LOOP;  -- i
            WHEN OTHERS => bit_pos := 0;  -- compare all bits when we do <= or >=
          END CASE;

          IF b_constant /= 0 THEN
            bits := width - bit_pos;
            ASSERT false REPORT integer'image(bits) & " bits are required for this constant comparison" SEVERITY note;
          END IF;

          -- Work out, now we know how many redundant bits there are, what
          -- implementation to use for the best speed and area
          IF (width - bit_pos) <= 12 THEN
            ASSERT false REPORT "NOTE : c_compare_v12_0_3_viv : Creating LUT-only comparator" SEVERITY note;
            RETURN LUTS_ONLY;
          ELSE
            ASSERT false REPORT "NOTE : c_compare_v12_0_3_viv : Creating carry-chain-based comparator" SEVERITY note;
            RETURN CARRY_CHAIN;
          END IF;
      END CASE;
--      CR774508 - rephrased to guarantee return value
    ELSE
      if c_width <= lut_size/2 then
        ASSERT false REPORT "NOTE : c_compare_v12_0_3_carry_structure : Creating LUT-only non-constant comparator" SEVERITY note;
        RETURN LUTS_ONLY;
      ELSE
        ASSERT false REPORT "NOTE : c_compare_v12_0_3_carry_structure : Creating carry-chain-based non-constant comparator" SEVERITY note;
        RETURN CARRY_CHAIN;
      END IF;
    END IF;
  END FUNCTION fn_determine_imp;

  CONSTANT np_lt_ge_gt_le_imp : T_IMP := fn_determine_imp(c_width, c_lut_size, c_b_constant, c_operation, c_b_value);
  
BEGIN  -- ARCHITECTURE struct

        -------------------------------------------------------------------------------
        -- LUT-based, inference-based constant compare section 
        -------------------------------------------------------------------------------

        --use for constant compares, or non constant compares < 1 lut wide.
        --output unflopped, is flopped in this level if required.
        --
        --
        --c_compare_lt_ge_gt_le module is used here to
        --generatsmall compare, also used to creat bit parts in structural compares or larger sized modules in pipelined
        --compares
        --
        i_compare_rtl : IF (np_lt_ge_gt_le_imp = LUTS_ONLY) GENERATE
          const_lt_gt_le_ge : c_compare_lt_ge_gt_le
            GENERIC MAP(
            c_data_type     => c_data_type,
            c_operation     => c_operation,
            c_width         => c_width
            )
          PORT MAP(
            a               => a,
            b               => b,
            o               => carry(0));
        END GENERATE i_compare_rtl;

  
        i_compare_struct : IF (np_lt_ge_gt_le_imp = CARRY_CHAIN) GENERATE
          i_gen_single_bit_lut_compare: IF c_bits_per_lut = 1 GENERATE
            i_gen_luts_and_muxcys : FOR i IN 0 TO total_luts-1 GENERATE
      
              -- Infer a LUT to do the comparison
              sel(i) <= '1' WHEN NOT(a(c_width - 1 - i) XOR b(c_width - 1 - i)) = '1' ELSE '0';
      
      -- Instantiate the first MUXCY in the carry chain
      -- The inputs to the DI and CI inputs are different depending on the
      -- comparison to be made
      -- < and <= - feed b(i) into the DI input and '0' and '1' respectively into CI
      -- > and >= - feed a(i) into the DI input and '0' and '1' respectively into CI

      --total luts is the same as width in this case
      i_top_muxcy_sign : IF i = 0 AND c_data_type = c_signed GENERATE
        -- use the top MUXCY to do the sign bit checking
        i_gt_ge : IF operation = GREATER_THAN OR operation = GREATER_THAN_EQUAL GENERATE
          sign_muxcy : MUXCY
            PORT MAP(DI => b(c_width - 1 - i),
                     CI => carry(i+1),
                     S  => sel(i),
                     O  => carry(i));            
        END GENERATE i_gt_ge;
        i_lt_le : IF operation = LESS_THAN OR operation = LESS_THAN_EQUAL GENERATE
          sign_muxcy : MUXCY
            PORT MAP(DI => a(c_width - 1 - i),
                     CI => carry(i+1),
                     S  => sel(i),
                     O  => carry(i));            
        END GENERATE i_lt_le;
      END GENERATE i_top_muxcy_sign;
        
      i_other_muxcy : IF (i /= 0 AND i /= total_luts-1) OR (i = 0 AND c_data_type = c_unsigned) GENERATE
        i_gt_ge : IF operation = GREATER_THAN OR operation = GREATER_THAN_EQUAL GENERATE
          data_muxcy : MUXCY
            PORT MAP(DI => a(c_width - 1 - i),
                     CI => carry(i+1),
                     S  => sel(i),
                     O  => carry(i));             
        END GENERATE i_gt_ge;
        i_lt_le : IF operation = LESS_THAN OR operation = LESS_THAN_EQUAL GENERATE
          data_muxcy : MUXCY
            PORT MAP(DI => b(c_width - 1 - i),
                     CI => carry(i+1),
                     S  => sel(i),
                     O  => carry(i));          
        END GENERATE i_lt_le;
      END GENERATE i_other_muxcy;
      
      i_bottom_muxcy : IF i = total_luts - 1 GENERATE
        -- Generate the bottom MUXCY according to the compare operation
        i_lt : IF operation = LESS_THAN GENERATE
          bottom_muxcy_lt : MUXCY
            PORT MAP(DI => b(c_width - 1 - i),
                     CI => '0',
                     S  => sel(i),
                     O  => carry(i));            
        END GENERATE i_lt;
        i_ge : IF operation = GREATER_THAN_EQUAL GENERATE
          bottom_muxcy_ge : MUXCY
            PORT MAP(DI => a(c_width - 1 - i),
                     CI => '1',
                       S  => sel(i),
                       O  => carry(i));                          
        END GENERATE i_ge;
        i_le : IF operation = LESS_THAN_EQUAL GENERATE
          bottom_muxcy_le : MUXCY
            PORT MAP(DI => b(c_width - 1 - i),
                     CI => '1',
                     S  => sel(i),
                     O  => carry(i));                 
        END GENERATE i_le;
        i_gt : IF operation = GREATER_THAN GENERATE
          bottom_muxcy_gt : MUXCY
            PORT MAP(DI => a(c_width - 1 - i),
                     CI => '0',
                     S  => sel(i),
                     O  => carry(i));            
        END GENERATE i_gt;
      END GENERATE i_bottom_muxcy;
    END GENERATE i_gen_luts_and_muxcys;
  END GENERATE i_gen_single_bit_lut_compare;

  i_gen_multi_bit_lut_compare: IF c_bits_per_lut /= 1 GENERATE      
  BEGIN
    i_gen_luts_and_muxcys : FOR i IN 0 TO total_luts - 1 GENERATE
      constant ones : string := "111111";
      constant zeros : string := "000000";
      CONSTANT bcps   : string := fn_generate_bcps(c_bits_per_lut, i, c_b_value);
    BEGIN
      --sign is taken care of in the top compare generated
      -- carry in at bottom taken care of by <,>,<=,>= in bottom LUT.
      -- 
      --only difference between top and middle is that the middle are unsigned. top may be either
      i_top_lut: IF  i = 0 GENERATE
        sel(0) <= '1' when (a((c_width - 1) downto (c_width - c_bits_per_lut)) =
                            b((c_width - 1) downto (c_width - c_bits_per_lut))) else '0';
        
        lt_gt_le_ge : c_compare_lt_ge_gt_le            
          GENERIC MAP(
            c_data_type     => c_data_type, --need to add a c_signed at top of chain
            c_operation     => c_operation, --lt_or_gt, --intermediate stages use <=, since it make constant
                                            --optimisation better.  in the equals case the result is never looked at.
                                            -- intermediate stages either < or >.
            c_width         => c_bits_per_lut
            )
          PORT MAP(
            a               => a((c_width - 1) DOWNTO (c_width - c_bits_per_lut)),
            b               => b((c_width - 1) DOWNTO (c_width - c_bits_per_lut)),
            o               => part_compare_result(0));
        
        data_muxcy : MUXCY
          PORT MAP(DI => part_compare_result(i),
                   CI => carry(i+1),
                   S  => sel(i),
                   O  => carry(i));             
      end GENERATE i_top_lut;
      
      i_mid_luts: IF  i /= total_luts - 1 and i /= 0 GENERATE
        sel(i) <= '1' when (a((c_width - 1 - c_bits_per_lut*i) downto (c_width - c_bits_per_lut*(i+1))) =
                            b((c_width - 1 - c_bits_per_lut*i) downto (c_width - c_bits_per_lut*(i+1)))) else '0';
        
        i_constant_enhancement: if c_b_constant /= 0 generate
          i_all_ones: if bcps = ones(1 to c_bits_per_lut) GENERATE
            i_never_gt: if c_operation = 1 or c_operation = 2 GENERATE
              part_compare_result(i) <= '0';
            end GENERATE i_never_gt;          
            i_always_le: if c_operation = 0 or c_operation = 3 GENERATE
              part_compare_result(i) <= '1';
            end GENERATE i_always_le;
          end GENERATE i_all_ones;
        
          i_all_zeros: if bcps = zeros(1 to c_bits_per_lut) GENERATE
            i_always_ge: if c_operation = 1 or c_operation = 2 GENERATE
              part_compare_result(i) <= '1';
            end GENERATE i_always_ge;          
            i_never_lt: if c_operation = 0 or c_operation = 3 GENERATE
              part_compare_result(i) <= '0';
            end GENERATE i_never_lt;
          end GENERATE i_all_zeros;
        end generate i_constant_enhancement;

        
        i_normal_compare : if c_b_constant = 0 or (bcps /= zeros(1 to c_bits_per_lut) and bcps /= ones(1 to c_bits_per_lut)) GENERATE
          lt_gt_le_ge : c_compare_lt_ge_gt_le            
            GENERIC MAP(
              c_data_type     => c_unsigned, --need to add a c_signed at top of chain
              c_operation     => c_operation,--lt_or_gt, -- intermediate stages either < or >.
              c_width         => c_bits_per_lut
              )
            PORT MAP(
              a               => a((c_width - 1 - c_bits_per_lut*i) DOWNTO (c_width - c_bits_per_lut*(i+1))),
              b               => b((c_width - 1 - c_bits_per_lut*i) DOWNTO (c_width - c_bits_per_lut*(i+1))),
              o               => part_compare_result(i));
        end GENERATE i_normal_compare;
        
        data_muxcy : MUXCY
          PORT MAP(DI => part_compare_result(i),
                   CI => carry(i+1),
                   S  => sel(i),
                   O  => carry(i));             
      end GENERATE i_mid_luts;

      -- Infer bottom LUT
      -- not that using the subtraction of bits per lut from the length means that the extra +1 bit in some
      -- configurations is handled by the code without any extra chacking.
      i_bottom_lut: IF  i = total_luts - 1 GENERATE
        sel(i) <= '0';
        
        lt_gt_le_ge : c_compare_lt_ge_gt_le
          GENERIC MAP(
            c_data_type     => c_unsigned,
            c_operation     => c_operation, -- intermediate stages either < or >.
            c_width         => (c_width - c_bits_per_lut*i)
            )
          PORT MAP(
            a               => a((c_width - 1 - c_bits_per_lut*i) DOWNTO 0),
            b               => b((c_width - 1 - c_bits_per_lut*i) DOWNTO 0),
            o               => part_compare_result(i));
        
        data_muxcy : MUXCY
          PORT MAP(DI => part_compare_result(i),--'0',--sel(i) is 0 but trying to prevent route through
                   CI => '1',
                   S  => part_compare_result(i), --use the comparison result to select between "free" carry in values
                   O  => carry(i));             
      end GENERATE i_bottom_lut;
    END GENERATE i_gen_luts_and_muxcys;
  END GENERATE i_gen_multi_bit_lut_compare;
      end GENERATE i_compare_struct;

  --connect sync and asynch outputs
  i_async_output : IF c_has_q = 0 GENERATE
    result <= carry(0);
  END GENERATE i_async_output;
  
  i_sync_output : IF c_has_q /= 0 AND c_has_o = 0 GENERATE
    result <= carry(0);
  END GENERATE i_sync_output;
  
  i_sync_and_async_output : IF c_has_q /= 0 AND c_has_o /= 0 GENERATE
    i_mixed_reg_ctrls : IF (c_has_aclr /= 0 OR c_has_aset /= 0) AND (c_has_sclr /= 0 OR c_has_sset /= 0) GENERATE
      result <= carry(0);
    END GENERATE i_mixed_reg_ctrls;
    i_same_or_no_reg_ctrls : IF NOT((c_has_aclr /= 0 OR c_has_aset /= 0) AND (c_has_sclr /= 0 OR c_has_sset /= 0)) GENERATE
      result_xor : XORCY
        PORT MAP (
          O  => result,
          CI => carry(0),
          LI => '0');           
    END GENERATE i_same_or_no_reg_ctrls;
  END GENERATE i_sync_and_async_output;
  
  gen_async_output : IF c_has_o /= 0 GENERATE
    o <= result;
  END GENERATE gen_async_output;

  gen_output_reg : IF c_has_q /= 0 GENERATE
    output_reg : c_reg_fd_v12_0_3_viv
      GENERIC MAP(
        c_width         => 1,           -- bit mux o/p is only ever 1 bit wide
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => "0",
        c_sync_priority => c_sync_priority,
        c_sync_enable   => c_sync_enable,
        c_has_ce        => c_has_ce,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => 0,           -- No ainit since single o/p register
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => 0,           -- No sinit since single o/p register
        c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
        )
      PORT MAP(
        clk   => clk,
        ce    => ce,
        ainit => '0',
        aclr  => aclr,
        aset  => aset,
        sinit => '0',
        sclr  => sclr,
        sset  => sset,
        d(0)  => carry(0),
        q(0)  => q
        );  
  END GENERATE gen_output_reg;

END ARCHITECTURE struct;



-- $Id: c_compare_pipeline_carry.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_lt_ge_gt_le.vhd 
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- ******************* Core Functionality ************************************
--
-- * Sub-core for c_compare_v12_0_3_viv
-- * Performs less-than, greater-than-equal-to, greater-than and
--   less-than-equal-to comparisons
-- * Registered and/or async. outputs
-- * Supports all Xilinx architectures.
-- * Very small compares implemented using a LUT only.  Larger compares
--   implemented using the carry chain
-- * Can be instantiated to build up pipelined compares
-- 
-- ******************* Design Notes ************************************
--
-- Uses the fact that < is the inverse of >= and > is the inverse of <= to use
-- the same structure for all comparisons
--
-- XST inference is pretty good for the constant comparisons, so we don't have
-- to worry about working out if there are redundant bits in the constant
-- string to compare to - using the signed and unsigned keywords allows XST to
-- synthesise the correct logic
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.pkg_compare_v12_0.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_compare_pipeline_carry IS
  GENERIC (
    c_width      : INTEGER;
    c_b_constant : INTEGER;
    c_ainit_val  : STRING;
    c_sync_priority : INTEGER;
    c_sync_enable   : INTEGER;
    c_has_ce        : INTEGER;
    c_has_aclr      : INTEGER;
    c_has_aset      : INTEGER;
    c_has_sclr      : INTEGER;
    c_has_sset      : INTEGER;
    number_compare_blocks :INTEGER;
    c_lut_size  : INTEGER;
    no_pipe_stages    : INTEGER);
  PORT (
    np_cp    : IN  STD_LOGIC_VECTOR(number_compare_blocks -1 DOWNTO 0);
    np_eq    : IN  STD_LOGIC_VECTOR(number_compare_blocks -1 DOWNTO 0) := (OTHERS => '0');
    clk  : IN  STD_LOGIC;
    ce   : IN  STD_LOGIC;
    aclr : IN  STD_LOGIC;
    aset : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    sset : IN  STD_LOGIC;
    result_op    : OUT STD_LOGIC);
END ENTITY c_compare_pipeline_carry;

ARCHITECTURE struct OF c_compare_pipeline_carry IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";

  constant number_bits_per_stage        : INTEGER := c_lut_size/2;
  CONSTANT number_logic_layer           : INTEGER := fn_tree_logic_layers(number_compare_blocks,number_bits_per_stage);
  constant number_extra_flops           : INTEGER := no_pipe_stages - number_logic_layer;
  CONSTANT number_layer0_blocks         : INTEGER := number_compare_blocks/number_bits_per_stage + fn_part_block_needed(number_compare_blocks MOD number_bits_per_stage);
  CONSTANT number_layer1_blocks         : INTEGER := number_layer0_blocks/number_bits_per_stage + fn_part_block_needed(number_layer0_blocks MOD number_bits_per_stage);
  CONSTANT number_layer2_blocks         : INTEGER := number_layer1_blocks/number_bits_per_stage + fn_part_block_needed(number_layer1_blocks MOD number_bits_per_stage);
  CONSTANT number_layer3_blocks         : INTEGER := number_layer2_blocks/number_bits_per_stage + fn_part_block_needed(number_layer2_blocks MOD number_bits_per_stage);          
  CONSTANT number_layer4_blocks         : INTEGER := number_layer3_blocks/number_bits_per_stage + fn_part_block_needed(number_layer3_blocks MOD number_bits_per_stage);          
  CONSTANT all_zero : STD_LOGIC_VECTOR(1 DOWNTO 0) :=  '0' & '0'; 
  
  SIGNAL result :STD_LOGIC;

  SIGNAL layer0_result        : STD_LOGIC_VECTOR(number_layer0_blocks-1 DOWNTO 0);
  SIGNAL layer0_bulk_and      : STD_LOGIC_VECTOR(number_layer0_blocks-1 DOWNTO 0);
  SIGNAL layer0_result_q        : STD_LOGIC_VECTOR(number_layer0_blocks-1 DOWNTO 0);
  SIGNAL layer0_bulk_and_q      : STD_LOGIC_VECTOR(number_layer0_blocks-1 DOWNTO 0);
  
  SIGNAL layer1_result      : STD_LOGIC_VECTOR(number_layer1_blocks-1 DOWNTO 0);
  SIGNAL layer1_bulk_and    : STD_LOGIC_VECTOR(number_layer1_blocks-1 DOWNTO 0);
  SIGNAL layer1_result_q      : STD_LOGIC_VECTOR(number_layer1_blocks-1 DOWNTO 0);
  SIGNAL layer1_bulk_and_q    : STD_LOGIC_VECTOR(number_layer1_blocks-1 DOWNTO 0);
  
  SIGNAL layer2_result      : STD_LOGIC_VECTOR(number_layer2_blocks-1 DOWNTO 0);
  SIGNAL layer2_bulk_and    : STD_LOGIC_VECTOR(number_layer2_blocks-1 DOWNTO 0);
  SIGNAL layer2_result_q      : STD_LOGIC_VECTOR(number_layer2_blocks-1 DOWNTO 0);
  SIGNAL layer2_bulk_and_q    : STD_LOGIC_VECTOR(number_layer2_blocks-1 DOWNTO 0);
  
  SIGNAL layer3_result      : STD_LOGIC_VECTOR(number_layer3_blocks-1 DOWNTO 0);
  SIGNAL layer3_bulk_and    : STD_LOGIC_VECTOR(number_layer3_blocks-1 DOWNTO 0);
  SIGNAL layer3_result_q      : STD_LOGIC_VECTOR(number_layer3_blocks-1 DOWNTO 0);
  SIGNAL layer3_bulk_and_q    : STD_LOGIC_VECTOR(number_layer3_blocks-1 DOWNTO 0);

  SIGNAL layer4_result      : std_logic;
  SIGNAL layer4_result_q      : std_logic;

  signal output_flop_shift : STD_LOGIC_VECTOR(number_extra_flops downto 0);

BEGIN  -- ARCHITECTURE struct
  i_single_compare: IF number_compare_blocks = 1 GENERATE
    output_flop_shift(0) <= np_cp(0);
  END GENERATE i_single_compare;
  
  i_tree_layer0 : IF  number_compare_blocks /= 1 GENERATE
    SIGNAL np_eq_pad            : STD_LOGIC_VECTOR(number_layer0_blocks*number_bits_per_stage-1 DOWNTO 0);
    SIGNAL np_cp_pad            : STD_LOGIC_VECTOR(number_layer0_blocks*number_bits_per_stage-1 DOWNTO 0);
  BEGIN
    np_eq_pad <= all_zero(number_layer0_blocks*number_bits_per_stage - number_compare_blocks-1 DOWNTO 0) & '0' & np_eq(number_compare_blocks-2 DOWNTO 0);            -- np_eq is U at MSB, so force 0
    np_cp_pad <= all_zero(number_layer0_blocks*number_bits_per_stage - number_compare_blocks-1 DOWNTO 0) & np_cp;
              
    i_tree_layer0_branch: FOR j IN 0 TO number_layer0_blocks-1 GENERATE
      lut_6: if number_bits_per_stage = 3 generate
        layer0_result(j) <= np_cp_pad(3*j) WHEN np_eq_pad(3*j) = '0' ELSE
                            np_cp_pad(3*j+ 1) WHEN np_eq_pad(3*j + 1) = '0' ELSE
                            np_cp_pad(3*j+ 2) WHEN np_eq_pad(3*j + 2) = '0' ELSE '0';
      
        layer0_bulk_and(j) <= '1' WHEN (np_eq_pad(3*j) = '1' AND np_eq_pad(3*j + 1) = '1' AND np_eq_pad(3*j + 2) = '1') ELSE '0';
      end generate lut_6;

      lut_4: if number_bits_per_stage = 2 generate
        layer0_result(j) <= np_cp_pad(2*j) WHEN np_eq_pad(2*j) = '0' ELSE
                            np_cp_pad(2*j+ 1) WHEN np_eq_pad(2*j + 1) = '0' else '0';
      
        layer0_bulk_and(j) <= '1' WHEN (np_eq_pad(2*j) = '1' AND np_eq_pad(2*j + 1) = '1') ELSE '0';
      end generate lut_4;
    END GENERATE i_tree_layer0_branch;  
            
      gen_pipe_and_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer0_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_ainit     => 0,           -- No ainit since single o/p register
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_sinit     => 0,           -- No sinit since single o/p register
            c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
            )
          PORT MAP(
            clk   => clk,
            ce    => ce,
            ainit => '0',
            aclr  => aclr,
            aset  => aset,
            sinit => '0',
            sclr  => sclr,
            sset  => sset,
            d  => layer0_bulk_and,
            q  => layer0_bulk_and_q
            );              
      
        --generate result pipeline line flops at this layer(work out if reqd later)                      
        gen_pipe_result_reg : c_reg_fd_v12_0_3_viv
          GENERIC MAP(
            c_width         => number_layer0_blocks,           -- bit mux o/p is only ever 1 bit wide
            c_ainit_val     => c_ainit_val,
            c_sinit_val     => "0",
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_ainit     => 0,           -- No ainit since single o/p register
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_sinit     => 0,           -- No sinit since single o/p register
            c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
            )
          PORT MAP(
            clk   => clk,
            ce    => ce,
            ainit => '0',
            aclr  => aclr,
            aset  => aset,
            sinit => '0',
            sclr  => sclr,
            sset  => sset,
            d  => layer0_result,
            q  => layer0_result_q
            );
  END GENERATE i_tree_layer0; 
  
  i_tree_layer1: IF number_layer0_blocks /= 1 GENERATE 
    SIGNAL layer0_result_pad        : STD_LOGIC_VECTOR(number_layer1_blocks*number_bits_per_stage-1 DOWNTO 0);
    SIGNAL layer0_bulk_and_pad      : STD_LOGIC_VECTOR(number_layer1_blocks*number_bits_per_stage-1 DOWNTO 0);
  BEGIN
    layer0_result_pad      <=  all_zero(number_layer1_blocks*number_bits_per_stage - number_layer0_blocks-1 DOWNTO 0) & layer0_result_q;
    layer0_bulk_and_pad    <=  all_zero(number_layer1_blocks*number_bits_per_stage - number_layer0_blocks-1 DOWNTO 0) & layer0_bulk_and_q;

    i_tree_layer1_branch: FOR j IN 0 TO number_layer1_blocks-1 GENERATE
    BEGIN
      lut_6: if number_bits_per_stage = 3 generate
      layer1_result(j) <= layer0_result_pad(3*j) WHEN layer0_bulk_and_pad(3*j) = '0' ELSE
                          layer0_result_pad(3*j+ 1) WHEN layer0_bulk_and_pad(3*j + 1) = '0' ELSE
                          layer0_result_pad(3*j+ 2) WHEN layer0_bulk_and_pad(3*j + 2) = '0' ELSE '0';
        
      layer1_bulk_and(j) <= '1' WHEN (layer0_bulk_and_pad(3*j) = '1' AND layer0_bulk_and_pad(3*j + 1) = '1' AND layer0_bulk_and_pad(3*j + 2) = '1') ELSE '0';
      end generate lut_6;
      lut_4: if number_bits_per_stage = 2 generate
        layer1_result(j) <= layer0_result_pad(2*j) WHEN layer0_bulk_and_pad(2*j) = '0' ELSE
                          layer0_result_pad(2*j+ 1) WHEN layer0_bulk_and_pad(2*j + 1) = '0' else '0';
        
      layer1_bulk_and(j) <= '1' WHEN (layer0_bulk_and_pad(2*j) = '1' AND layer0_bulk_and_pad(2*j + 1) = '1') ELSE '0';
      end generate lut_4;
    END GENERATE i_tree_layer1_branch;
    
      gen_pipe_and_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer1_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d  => layer1_bulk_and,
          q  => layer1_bulk_and_q
          );              
      
      --generate result pipeline line flops at this layer(work out if reqd later)                      
      gen_pipe_result_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer1_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d  => layer1_result,
          q  => layer1_result_q
          );
  END GENERATE i_tree_layer1;
  
  i_tree_layer2: IF number_layer1_blocks /= 1 GENERATE
    SIGNAL layer1_result_pad        : STD_LOGIC_VECTOR(number_layer2_blocks*number_bits_per_stage-1 DOWNTO 0);
    SIGNAL layer1_bulk_and_pad      : STD_LOGIC_VECTOR(number_layer2_blocks*number_bits_per_stage-1 DOWNTO 0);
  BEGIN
    layer1_result_pad      <= all_zero(number_layer2_blocks*number_bits_per_stage - number_layer1_blocks - 1 DOWNTO 0) & layer1_result_q;
    layer1_bulk_and_pad    <= all_zero(number_layer2_blocks*number_bits_per_stage - number_layer1_blocks - 1 DOWNTO 0) & layer1_bulk_and_q;
    
    i_tree_layer2_branch: FOR j IN 0 TO number_layer2_blocks-1 GENERATE
    BEGIN 
      lut_6: if number_bits_per_stage = 3 generate
      layer2_result(j) <= layer1_result_pad(3*j) WHEN layer1_bulk_and_pad(3*j) = '0' ELSE
                          layer1_result_pad(3*j+ 1) WHEN layer1_bulk_and_pad(3*j + 1) = '0' ELSE
                          layer1_result_pad(3*j+ 2) WHEN layer1_bulk_and_pad(3*j + 2) = '0' ELSE '0';
                
      layer2_bulk_and(j) <= '1' WHEN (layer1_bulk_and_pad(3*j) = '1' AND layer1_bulk_and_pad(3*j + 1) = '1' AND layer1_bulk_and_pad(3*j + 2) = '1') ELSE '0';
      end generate lut_6;
      lut_4: if number_bits_per_stage = 2 generate
      layer2_result(j) <= layer1_result_pad(2*j) WHEN layer1_bulk_and_pad(2*j) = '0' ELSE
                          layer1_result_pad(2*j+ 1) WHEN layer1_bulk_and_pad(2*j + 1) = '0' ELSE '0';
                
      layer2_bulk_and(j) <= '1' WHEN (layer1_bulk_and_pad(2*j) = '1' AND layer1_bulk_and_pad(2*j + 1) = '1') ELSE '0';
      end generate lut_4;
    END GENERATE i_tree_layer2_branch;

      gen_pipe_and_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer2_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d  => layer2_bulk_and,
          q  => layer2_bulk_and_q
          );              
      
      --generate result pipeline line flops at this layer(work out if reqd later)                      
      gen_pipe_result_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer2_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d  => layer2_result,
          q  => layer2_result_q
          );
  END GENERATE i_tree_layer2;
  
  i_tree_layer3: IF number_layer2_blocks /= 1 GENERATE
    SIGNAL layer2_result_pad        : STD_LOGIC_VECTOR(number_layer3_blocks*number_bits_per_stage-1 DOWNTO 0);
    SIGNAL layer2_bulk_and_pad      : STD_LOGIC_VECTOR(number_layer3_blocks*number_bits_per_stage-1 DOWNTO 0);
  BEGIN
    layer2_result_pad      <= all_zero(number_layer3_blocks*number_bits_per_stage-number_layer2_blocks - 1 DOWNTO 0) & layer2_result_q;
    layer2_bulk_and_pad    <= all_zero(number_layer3_blocks*number_bits_per_stage-number_layer2_blocks - 1 DOWNTO 0) & layer2_bulk_and_q;

    i_tree_layer3_branch: FOR j IN 0 TO number_layer3_blocks-1 GENERATE
    BEGIN 
      lut_6: if number_bits_per_stage = 3 generate
      layer3_result(j) <= layer2_result_pad(3*j) WHEN layer2_bulk_and_pad(3*j) = '0' ELSE
                          layer2_result_pad(3*j+ 1) WHEN layer2_bulk_and_pad(3*j + 1) = '0' ELSE
                          layer2_result_pad(3*j+ 2) WHEN layer2_bulk_and_pad(3*j + 2) = '0' ELSE '0';
        
      layer3_bulk_and(j) <= '1' WHEN (layer2_bulk_and_pad(3*j) = '1' AND layer2_bulk_and_pad(3*j + 1) = '1' AND layer2_bulk_and_pad(3*j + 2) = '1') ELSE '0';
      end generate lut_6;
      lut_4: if number_bits_per_stage = 2 generate
      layer3_result(j) <= layer2_result_pad(2*j) WHEN layer2_bulk_and_pad(2*j) = '0' ELSE
                          layer2_result_pad(2*j+ 1) WHEN layer2_bulk_and_pad(2*j + 1) = '0' ELSE '0';
        
      layer3_bulk_and(j) <= '1' WHEN (layer2_bulk_and_pad(2*j) = '1' AND layer2_bulk_and_pad(2*j + 1) = '1') ELSE '0';
      end generate lut_4;
    END GENERATE i_tree_layer3_branch;

      gen_pipe_and_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer3_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d  => layer3_bulk_and,
          q  => layer3_bulk_and_q
          );              
      
      --generate result pipeline line flops at this layer(work out if reqd later)                      
      gen_pipe_result_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => number_layer3_blocks,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d  => layer3_result,
          q  => layer3_result_q
          );
  END GENERATE i_tree_layer3;
      
  -- only ever 1 block in top layer
  i_tree_layer4: IF number_layer3_blocks /= 1 GENERATE
    SIGNAL layer3_result_pad        : STD_LOGIC_VECTOR(number_bits_per_stage-1 DOWNTO 0);
    SIGNAL layer3_bulk_and_pad      : STD_LOGIC_VECTOR(number_bits_per_stage-1 DOWNTO 0);
  BEGIN
    layer3_result_pad      <= all_zero(number_bits_per_stage - number_layer3_blocks - 1 DOWNTO 0) & layer3_result_q;
    layer3_bulk_and_pad    <= all_zero(number_bits_per_stage - number_layer3_blocks - 1 DOWNTO 0) & layer3_bulk_and_q;
    
    lut_6: if number_bits_per_stage = 3 generate
      layer4_result <= layer3_result_pad(0) WHEN layer3_bulk_and_pad(0) = '0' ELSE
                       layer3_result_pad(1) WHEN layer3_bulk_and_pad(1) = '0' ELSE
                       layer3_result_pad(2) WHEN layer3_bulk_and_pad(2) = '0' ELSE '0';
    end generate lut_6;

    lut_4: if number_bits_per_stage = 2 generate
      layer4_result <= layer3_result_pad(0) WHEN layer3_bulk_and_pad(0) = '0' ELSE
                       layer3_result_pad(1) WHEN layer3_bulk_and_pad(1) = '0' ELSE '0';
    end generate lut_4;
    
    gen_pipe_result_reg : c_reg_fd_v12_0_3_viv
      GENERIC MAP(
        c_width         => 1,           -- bit mux o/p is only ever 1 bit wide
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => "0",
        c_sync_priority => c_sync_priority,
        c_sync_enable   => c_sync_enable,
        c_has_ce        => c_has_ce,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => 0,           -- No ainit since single o/p register
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => 0,           -- No sinit since single o/p register
        c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
        )
      PORT MAP(
        clk   => clk,
        ce    => ce,
        ainit => '0',
        aclr  => aclr,
        aset  => aset,
        sinit => '0',
        sclr  => sclr,
        sset  => sset,
        d(0)  => layer4_result,
        q(0)  => layer4_result_q
        );
  END GENERATE i_tree_layer4;

  i_result0: IF number_compare_blocks /= 1 and number_layer0_blocks = 1 GENERATE
    output_flop_shift(0) <= layer0_result_q(0);
  end generate i_result0;  
  i_result1: IF number_layer0_blocks /= 1 and number_layer1_blocks = 1 GENERATE
    output_flop_shift(0) <= layer1_result_q(0);
  end generate i_result1;
  i_result2: IF number_layer1_blocks /= 1 and number_layer2_blocks = 1 GENERATE
    output_flop_shift(0) <= layer2_result_q(0);
  end generate i_result2;
  i_result3: IF number_layer2_blocks /= 1 and number_layer3_blocks = 1 GENERATE
    output_flop_shift(0) <= layer3_result_q(0);
  end generate i_result3;
  i_result4: IF number_layer3_blocks /= 1 and number_layer4_blocks = 1 GENERATE
    output_flop_shift(0) <= layer4_result_q;
  end generate i_result4;

  i_gen_extra_flops:if number_extra_flops /= 0 GENERATE
  begin
    --replace with SRL?
    i_out_flops: for i in 0 to number_extra_flops-1 GENERATE
    begin
      gen_pipe_result_reg : c_reg_fd_v12_0_3_viv
        GENERIC MAP(
          c_width         => 1,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => c_has_aclr,
          c_has_aset      => c_has_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP(
          clk   => clk,
          ce    => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sinit => '0',
          sclr  => sclr,
          sset  => sset,
          d(0)  => output_flop_shift(i),
          q(0)  => output_flop_shift(i+1)
          );
    end GENERATE i_out_flops;
  end generate i_gen_extra_flops;

  result_op <= output_flop_shift(number_extra_flops);
  
END ARCHITECTURE struct;



-- $Id: c_compare_pipeline_equality.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_pipeline_equality.vhd 
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- ******************* Core Functionality ************************************
--
-- * Sub-core for c_compare_v12_0_3_viv
-- * Performs less-than, greater-than-equal-to, greater-than and
--   less-than-equal-to comparisons
-- * Registered and/or async. outputs
-- * Supports all Xilinx architectures.
-- * Very small compares implemented using a LUT only.  Larger compares
--   implemented using the carry chain
-- * Can be instantiated to build up pipelined compares
-- 
-- ******************* Design Notes ************************************
--
-- Uses the fact that < is the inverse of >= and > is the inverse of <= to use
-- the same structure for all comparisons
--
-- XST inference is pretty good for the constant comparisons, so we don't have
-- to worry about working out if there are redundant bits in the constant
-- string to compare to - using the signed and unsigned keywords allows XST to
-- synthesise the correct logic
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

-- Used on the output of the pipelined = /= compares
LIBRARY c_gate_bit_v12_0_3;
USE c_gate_bit_v12_0_3.c_gate_bit_v12_0_3_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.pkg_compare_v12_0.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_compare_pipeline_equality  IS
  GENERIC (
    c_family        : STRING  := "virtex2";    
    c_data_type     : INTEGER;          -- 0: signed, 1: unsigned
    c_lut_size      : INTEGER;  -- Allow differentiation between devices
    c_operation     : INTEGER;  -- 
    c_width         : INTEGER;          -- Width of the input data
    c_b_constant    : INTEGER;          -- 0: B variable, 1: B constant
    c_ainit_val     : STRING;   -- Power-on reset value for any registers
    c_sync_priority : INTEGER;
    c_sync_enable   : INTEGER;
    c_pipe_stages   : INTEGER;
    c_has_ce        : INTEGER;
    c_has_aclr      : INTEGER;
    c_has_aset      : INTEGER;
    c_has_sclr      : INTEGER;
    c_has_sset      : INTEGER;
    c_has_o         : INTEGER;
    c_has_q         : INTEGER);
  PORT (
    a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');
    clk  : IN  STD_LOGIC;
    ce   : IN  STD_LOGIC;
    aclr : IN  STD_LOGIC;
    aset : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    sset : IN  STD_LOGIC;
    o    : OUT STD_LOGIC;
    q    : OUT STD_LOGIC);

END ENTITY c_compare_pipeline_equality;

ARCHITECTURE struct OF c_compare_pipeline_equality IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";


  -------------------------------------------------------------------------------    
  -- Pipelined = /= code section
  -------------------------------------------------------------------------------    
  CONSTANT max_width : integer := fn_maximise_width(c_width, c_lut_size, c_b_constant);

  --for use in internal pipeline flops
  CONSTANT allow_aclr : integer := fn_allow_async_ctrl(c_has_sclr, c_has_sset, c_has_aclr);
  CONSTANT allow_aset : integer := fn_allow_async_ctrl(c_has_sclr, c_has_sset, c_has_aset);

  SIGNAL a_ext         : std_logic_vector(max_width-1 DOWNTO 0);
  SIGNAL b_i_ext       : std_logic_vector(max_width-1 DOWNTO 0);
  SIGNAL a_eq_ne_b_out : std_logic_vector((max_width/(c_lut_size/(2-c_b_constant)))-1 DOWNTO 0);

  SIGNAL async_out : std_logic;
  SIGNAL sync_out  : std_logic;
BEGIN

  -- extend the vector with zeros if it is not a full LUT's-worth
  
  a_ext(c_width-1 DOWNTO 0) <= a;
  
  xtd_a_vect : IF max_width - c_width > 0 GENERATE
    a_ext(max_width-1 DOWNTO c_width) <= (OTHERS => '0');
  END GENERATE xtd_a_vect;
  
  b_i_ext(c_width-1 DOWNTO 0) <= b;
  
  xtd_b_vect : IF max_width - c_width > 0 GENERATE
    b_i_ext(max_width-1 DOWNTO c_width) <= (OTHERS => '0');
  END GENERATE xtd_b_vect;
  
  i_a_eq_ne_b_subblox : FOR i IN 0 TO ((max_width/(c_lut_size/2))-((max_width/c_lut_size)*c_b_constant))-1 GENERATE

    -- For the = and /= pipelined cores, we use the c_b_constant generic to
    -- pass the correct widths to the sub-blox depending on the LUT size
    -- being targeted
    -- Use the equals block in for the = and /= and simply invert the
          -- output of the gate_bit subcore to do the operation (AND or OR)
    -- implement the first level of pipelining at the output of the
    -- equality blox - restrict the use of async controls as per the other BaseBlox        
    CONSTANT offset      : integer             := (c_lut_size/2 + (c_b_constant * c_lut_size/2));
        BEGIN
          i_a_eq_ne_b          : c_compare_eq_ne
            GENERIC MAP(
              c_family            => c_family,
              c_lut_size          => c_lut_size,
              c_operation         => c_operation,  -- A = B
              c_width             => offset,  -- constant compares need 1/2 the LUTs
              c_b_constant        => c_b_constant,
              c_ainit_val         => c_ainit_val,
              c_sync_priority     => c_sync_priority,
              c_sync_enable       => c_sync_enable,
              c_has_ce            => c_has_ce,
              c_has_aclr          => allow_aclr,  -- value selected in fn above
              c_has_aset          => allow_aset,
              c_has_sclr          => c_has_sclr,
              c_has_sset          => c_has_sset,
              c_has_o             => 0,
              c_has_q             => 1,  -- use only the sync output
              c_carry_chain_eq_ne => 0)
            PORT MAP(
              a                   => a_ext(max_width-1 - (i*offset) DOWNTO max_width - offset - (i*offset)),
              b                   => b_i_ext(max_width-1 - (i*offset) DOWNTO max_width - offset - (i*offset)),
              clk                 => clk,
              ce                  => ce,
              aclr                => aclr,
              aset                => aset,
              sclr                => sclr,
              sset                => sset,
              q                   => a_eq_ne_b_out(i));
        END GENERATE i_a_eq_ne_b_subblox;

        i_and_gate       : IF true GENERATE
        BEGIN
          i_gate_bit     : c_gate_bit_v12_0_3_viv
            GENERIC MAP(
              c_family         => c_family,
              c_gate_type      => 2*c_operation,  -- AND or OR gate
              c_inputs         => ((max_width/(c_lut_size/2))-((max_width/c_lut_size)*c_b_constant)),
              c_input_inv_mask => "0",
              c_pipe_stages    => c_pipe_stages-1,  -- first level of pipeline already in the eq_ne block as the o/p register
              c_ainit_val      => c_ainit_val,
              c_sinit_val      => "0",
              c_sync_priority  => c_sync_priority,
              c_sync_enable    => c_sync_enable,
              c_has_o          => c_has_o,
              c_has_q          => c_has_q,
              c_has_ce         => c_has_ce,
              c_has_aclr       => fn_use_gate_bit_reg_ctrls(c_has_aclr, c_pipe_stages, c_has_q),
              c_has_aset       => fn_use_gate_bit_reg_ctrls(c_has_aset, c_pipe_stages, c_has_q),
              c_has_ainit      => 0,
              c_has_sclr       => fn_use_gate_bit_reg_ctrls(c_has_sclr, c_pipe_stages, c_has_q),
              c_has_sset       => fn_use_gate_bit_reg_ctrls(c_has_sset, c_pipe_stages, c_has_q),
              c_has_sinit      => 0,
              c_enable_rlocs   => 0
              )
            PORT MAP(
              i                => a_eq_ne_b_out,
              clk              => clk,
              ce               => ce,
              aclr             => aclr,
              aset             => aset,
              ainit            => '0',
              sclr             => sclr,
              sset             => sset,
              sinit            => '0',
              o                => async_out,
              q                => sync_out,
              t                => '0',
              en               => '0'
              );
        END GENERATE i_and_gate;

        i_async  : IF c_has_o /= 0 GENERATE
          o  <= async_out;
        END GENERATE i_async;

        i_sync  : IF c_has_q /= 0 GENERATE
          q <= sync_out;
        END GENERATE i_sync;

      -------------------------------------------------------------------------------  
      -- End of Pipelined = /= code section
      -------------------------------------------------------------------------------
      
end struct;



-- $Id: c_compare_pipeline_structure.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
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
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_pipeline_structure.vhd 
--  /   /        
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--
-- ******************* Core Functionality ************************************
--
-- * Sub-core for c_compare_v12_0_3_viv
-- * Performs less-than, greater-than-equal-to, greater-than and
--   less-than-equal-to comparisons
-- * Registered and/or async. outputs
-- * Supports all Xilinx architectures.
-- * Very small compares implemented using a LUT only.  Larger compares
--   implemented using the carry chain
-- * Can be instantiated to build up pipelined compares
-- 
-- ******************* Design Notes ************************************
--
-- Uses the fact that < is the inverse of >= and > is the inverse of <= to use
-- the same structure for all comparisons
--
-- XST inference is pretty good for the constant comparisons, so we don't have
-- to worry about working out if there are redundant bits in the constant
-- string to compare to - using the signed and unsigned keywords allows XST to
-- synthesise the correct logic
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.pkg_compare_v12_0.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY c_compare_pipeline_structure IS
  GENERIC (
    c_family        : STRING  := "virtex2";    
    c_data_type     : INTEGER;          -- 0: signed, 1: unsigned
    c_lut_size      : INTEGER;  -- Allow differentiation between devices
    c_bits_per_lut  : INTEGER;
    c_operation     : INTEGER;  -- 0: A < B, 1: A >= B, 2: A > B, 3: A <= B
    c_width         : INTEGER;          -- Width of the input data
    c_b_constant    : INTEGER;          -- 0: B variable, 1: B constant
    c_b_value       : STRING;
    c_ainit_val     : STRING;   -- Power-on reset value for any registers
    c_sync_priority : INTEGER;
    c_sync_enable   : INTEGER;
    c_pipe_stages   : INTEGER;
    c_has_ce        : INTEGER;
    c_has_aclr      : INTEGER;
    c_has_aset      : INTEGER;
    c_has_sclr      : INTEGER;
    c_has_sset      : INTEGER;
    c_has_o         : INTEGER;
    c_has_q         : INTEGER
    );
  PORT (
    a    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);
    b    : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := (OTHERS => '0');
    clk  : IN  STD_LOGIC;
    ce   : IN  STD_LOGIC;
    aclr : IN  STD_LOGIC;
    aset : IN  STD_LOGIC;
    sclr : IN  STD_LOGIC;
    sset : IN  STD_LOGIC;
    o    : OUT STD_LOGIC;
    q    : OUT STD_LOGIC);

END ENTITY c_compare_pipeline_structure;

ARCHITECTURE struct OF c_compare_pipeline_structure IS

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of struct : architecture is "yes";


  -----------------------------------------------------------------------------
  -- Constants to indicate the size of the blocks for the pipelined inequality
  -- compares and the number of these blocks that can be completely filled in
  -- terms of inputs
  -----------------------------------------------------------------------------
  CONSTANT block_size : integer := fn_calc_subblock_size(c_width, c_lut_size, c_pipe_stages, c_b_constant);
  CONSTANT full_blox  : integer := c_width / block_size;  -- number of fully-filled blox for pipelined compares

  CONSTANT part_blox_bits : integer := c_width REM block_size;  -- number of bits to make up the final block for pipelined inequality compares
  CONSTANT part_block_needed : integer := fn_part_block_needed(part_blox_bits);


  CONSTANT part_carry_lut_needed : integer := full_blox REM 2;  -- offset number of inputs to the end carry lut

  CONSTANT full_bottom_lut : integer := (part_carry_lut_needed + part_block_needed) REM 2;  --mathematical XOR FOR integer type

  constant number_blocks : integer := full_blox + part_block_needed;
  CONSTANT pipe_carry_luts : integer := (number_blocks)/2;  -- number of Lut 6 required to form the carry chain
  
  TYPE T_DATA_TYPE IS ARRAY (0 TO full_blox) OF integer RANGE 0 TO 1;

  -- purpose: When we use a pipelined < etc and the data is signed,
  -- the first subblock must be a signed compare and the others unsigned,
  -- otherwise all the partial compares are unsigned
  FUNCTION fn_assign_datatypes(c_data_type : integer) RETURN T_DATA_TYPE IS
    VARIABLE ret                           : T_DATA_TYPE := (OTHERS => 1);
  BEGIN  -- FUNCTION fn_assign_datatypes
    CASE c_data_type IS
      WHEN c_signed                                                 =>
        ret(0)                                           := c_signed;
        RETURN ret;
      WHEN c_unsigned                                               =>
        RETURN ret;
      WHEN OTHERS                                                   =>
        ASSERT false
          REPORT "ERROR                    : Unknown c_data_type detected in fn_assign_datatypes in c_compare_v12_0_3_viv"
          SEVERITY failure;
        RETURN ret;
    END CASE;
  END FUNCTION fn_assign_datatypes;

  -- Allows the pipelined < > <= >= to implement signed comparisons with
  -- partial results - first (MSB) value will be a 0 for signed, all others 1
  CONSTANT datatype : T_DATA_TYPE := fn_assign_datatypes(c_data_type);

  -- Indicate whether to use a > or < block for the pipelined < > <= >= compares
  CONSTANT lt_or_gt : integer := fn_lt_or_gt(c_operation);

  CONSTANT allow_aclr : integer := fn_allow_async_ctrl(c_has_sclr, c_has_sset, c_has_aclr);
  CONSTANT allow_aset : integer := fn_allow_async_ctrl(c_has_sclr, c_has_sset, c_has_aset);

  -------------------------------------------------------------------------------    
  -- Pipelined <, >, <=, >= code section
  -------------------------------------------------------------------------------    

  SIGNAL cp             : std_logic_vector(number_blocks-1 DOWNTO 0);
  SIGNAL carry          : std_logic_vector(number_blocks-1 DOWNTO 0);
  SIGNAL eq             : std_logic_vector(number_blocks-1 DOWNTO 0);
  signal async_out          : std_logic;
  signal sync_out          : std_logic;

BEGIN
  i_lt_full_blox         : FOR i IN 0 TO number_blocks - 1 GENERATE
  BEGIN
    i_gen_normal_block : IF i /= number_blocks - 1 GENERATE
      constant constant_slice : STRING(1 to block_size) := c_b_value(1+(i*block_size) to ((i+1)*block_size));
    BEGIN
      i_a_lt_gt_b_pipe : c_compare_carry_structure
        GENERIC MAP(
          c_data_type          => datatype(i),
          c_lut_size           => c_lut_size,
          c_bits_per_lut       => c_bits_per_lut,
          c_operation          => lt_or_gt,  -- only use < or > operations
          c_b_constant         => c_b_constant,
          c_b_value            => constant_slice,
          c_width              => block_size,
          c_ainit_val          => c_ainit_val,
          c_sync_priority      => c_sync_priority,
          c_sync_enable        => c_sync_enable,
          c_has_ce             => c_has_ce,
          c_has_aclr           => allow_aclr,
          c_has_aset           => allow_aset,
          c_has_sclr           => c_has_sclr,
          c_has_sset           => c_has_sset,
          c_has_o              => 0,
          c_has_q              => 1)
        PORT MAP(
          a                    => a(a'high-(i*block_size) DOWNTO a'high+1-block_size-(i*block_size)),
          b                    => b(b'high-(i*block_size) DOWNTO b'high+1-block_size-(i*block_size)),
          clk                  => clk,
          ce                   => ce,
          aclr                 => aclr,
          aset                 => aset,
          sclr                 => sclr,
          sset                 => sset,
          q                    => cp(i));
      
      i_a_eq_b_pipe : c_compare_eq_ne
        GENERIC MAP(
          c_family            => c_family,
          c_lut_size          => c_lut_size,
          c_operation         => 0,  -- A = B
          c_width             => block_size,
          c_b_constant        => c_b_constant,
          c_ainit_val         => c_ainit_val,
          c_sync_priority     => c_sync_priority,
          c_sync_enable       => c_sync_enable,
          c_has_ce            => c_has_ce,
          c_has_aclr          => allow_aclr,
          c_has_aset          => allow_aset,
          c_has_sclr          => c_has_sclr,
          c_has_sset          => c_has_sset,
          c_has_o             => 0,
          c_has_q             => 1,  -- use only the sync output
          c_carry_chain_eq_ne => 1)
        PORT MAP(
          a                   => a(a'high-(i*block_size) DOWNTO a'high+1-block_size-(i*block_size)),
          b                   => b(b'high-(i*block_size) DOWNTO b'high+1-block_size-(i*block_size)),
          clk                 => clk,
          ce                  => ce,
          aclr                => aclr,
          aset                => aset,
          sclr                => sclr,
          sset                => sset,
          q                   => eq(i));

    END GENERATE i_gen_normal_block;

    i_check_part_blox       : IF i = number_blocks - 1 GENERATE
      constant constant_slice : STRING(1 to (c_width - i*block_size)) := c_b_value(1+(i*block_size) to c_width);
    BEGIN
      i_a_lt_gt_b_part_pipe : c_compare_carry_structure
        GENERIC MAP(
          c_data_type          => c_unsigned,
          c_lut_size           => c_lut_size,
          c_bits_per_lut       => c_bits_per_lut,
          c_operation          => c_operation,
          c_b_constant         => c_b_constant,
          c_b_value            => constant_slice, --c_b_value(1+(i*block_size) to c_width),          
          c_width              => (c_width - i*block_size),
          c_ainit_val          => c_ainit_val,
          c_sync_priority      => c_sync_priority,
          c_sync_enable        => c_sync_enable,
          c_has_ce             => c_has_ce,
          c_has_aclr           => allow_aclr,
          c_has_aset           => allow_aset,
          c_has_sclr           => c_has_sclr,
          c_has_sset           => c_has_sset,
          c_has_o              => 0,
          c_has_q              => 1)
        PORT MAP(
          a                    => a((c_width - i*block_size-1) DOWNTO 0),
          b                    => b((c_width - i*block_size-1) DOWNTO 0),
          clk                  => clk,
          ce                   => ce,
          aclr                 => aclr,
          aset                 => aset,
          sclr                 => sclr,
          sset                 => sset,
          q                    => cp(number_blocks - 1));  -- full_blox-1 + part_block_needed (= 1)
    END GENERATE i_check_part_blox;
  end generate i_lt_full_blox;
  
  i_carry_chain_reqd       : IF c_pipe_stages = 1 GENERATE
    i_gen_lut6_carry_chain : IF c_lut_size = 6 GENERATE
      -- the lut 6 05 and 06 outputs allows 2 blocks of the eqauality or gt_lt pipe logic to be combined in what was once just the route through
      -- for a pipe comparator.
      
      SIGNAL carry_priority_enc      : std_logic_vector(pipe_carry_luts-1 DOWNTO 0);
      SIGNAL sel_priority_enc        : std_logic_vector(pipe_carry_luts-1 DOWNTO 0);
    BEGIN
      i_gen_carry_chain : FOR i IN 0 TO pipe_carry_luts-1 GENERATE  --two blocks per lut
        i_other_muxcy   : IF i /= pipe_carry_luts - 1 GENERATE
          --normal muxcy or two inputs into the bottom lut
          sel_priority_enc(i) <= '1' WHEN (eq((2*i+1) downto 2*i) = "11") ELSE '0';
          
          carry_priority_enc(i) <= cp(2*i) WHEN eq(2*i) = '0' ELSE
                           cp(2*i + 1)  WHEN eq(2*i + 1) = '0' ELSE '0';

          carry_mux : MUXCY
                  PORT MAP (
                    o  => carry(i),
                    ci => carry(i+1),
                    di => carry_priority_enc(i),
                    s  => sel_priority_enc(i));
        end GENERATE i_other_muxcy;
        
        i_bottom_muxcy : if i = pipe_carry_luts - 1 GENERATE
          i_part_bottom_lut: if full_bottom_lut = 0 GENERATE
            sel_priority_enc(i) <= cp(2*i) WHEN eq(2*i) = '0' ELSE cp(2*i + 1);
          end GENERATE i_part_bottom_lut;

          i_full_bottom_lut: if full_bottom_lut /= 0 GENERATE
            --if odd number of blocks can squeeze three into last muxcy use 5 ip
            sel_priority_enc(i) <= cp(2*i) WHEN eq(2*i) = '0' ELSE
                      cp(2*i + 1) WHEN eq(2*i + 1) = '0' ELSE
                      cp(2*i + 2);
          END GENERATE i_full_bottom_lut;

          carry_mux : MUXCY
            PORT MAP (
              o  => carry(i),
              ci => '1',          --ranier can generate constatn ip to cin and din 
              di => '0',
              s  => sel_priority_enc(i));      --USE sel because faster op on o6 than o5
        END GENERATE i_bottom_muxcy;
      END GENERATE i_gen_carry_chain;
    END GENERATE i_gen_lut6_carry_chain;

    i_gen_lut4_carry_chain      : IF c_lut_size /= 6 GENERATE

      i_gen_carry_chain         : FOR i IN 0 TO number_blocks-1 GENERATE
        i_other_muxcy           : IF i /= number_blocks-1 GENERATE
          carry_mux             : MUXCY
            PORT MAP (
              o  => carry(i),
              ci => carry(i+1),
              di => cp(i),
              s  => eq(i));
        END GENERATE i_other_muxcy;
        i_bottom_muxcy           : IF i = number_blocks - 1 GENERATE
          -- first stage is different as we need to feed in a fixed value to CI
          -- don't need the equality test at the foot of the carry chain
          first_lt_gt_carry_mux : MUXCY
            PORT MAP (
              o  => carry(i),
              ci => '1',          -- never used - tie high to use a VCC rather than a LUT generating a '0' which increases slice count - maybe assign '-' for undriven??
              di => cp(i),
              s  => '0');
        END GENERATE i_bottom_muxcy;
      END GENERATE i_gen_carry_chain;
    END GENERATE i_gen_lut4_carry_chain;
  END GENERATE i_carry_chain_reqd;

  i_no_carry_mux                   : IF c_pipe_stages > 1 GENERATE
  BEGIN
    i_combine_results              : c_compare_pipeline_carry
      GENERIC MAP(
        c_width               => c_width,
        c_b_constant          => c_b_constant,
        c_ainit_val           => c_ainit_val,
        c_sync_priority       => c_sync_priority,
        c_sync_enable         => c_sync_enable,
        c_has_ce              => c_has_ce,
        c_has_aclr            => allow_aclr,
        c_has_aset            => allow_aset,
        c_has_sclr            => c_has_sclr,
        c_has_sset            => c_has_sset,
        number_compare_blocks => number_blocks,
        c_lut_size            => c_lut_size,
        no_pipe_stages        => c_pipe_stages-1)  -- first stage in compare blocks
      PORT MAP(
        np_cp                 => cp,
        np_eq                 => eq,
        clk                   => clk,
        ce                    => ce,
        aclr                  => aclr,
        aset                  => aset,
        sclr                  => sclr,
        sset                  => sset,
        result_op             => carry(0)
        );

  END GENERATE i_no_carry_mux;
  
  i_async_output : IF NOT((c_has_q /= 0) AND (c_has_o /= 0)) GENERATE
    async_out <= carry(0);--Correct????? has no q output>
  END GENERATE i_async_output;

  i_sync_and_async_output : IF (c_has_q /= 0) AND (c_has_o /= 0) GENERATE
    i_mixed_reg_ctrls     : IF (c_has_aclr /= 0 OR c_has_aset /= 0) AND (c_has_sclr /= 0 OR c_has_sset /= 0) GENERATE
      async_out <= carry(0);
    END GENERATE i_mixed_reg_ctrls;
    
    i_same_or_no_reg_ctrls : IF NOT((c_has_aclr /= 0 OR c_has_aset /= 0) AND (c_has_sclr /= 0 OR c_has_sset /= 0)) GENERATE
      result_xor           : XORCY
        PORT MAP (
          O  => async_out,
          CI => carry(0),
          LI => '0');
    END GENERATE i_same_or_no_reg_ctrls;
  END GENERATE i_sync_and_async_output;
  
  
  -- Assign the result to the correct output port
  async_output_b : IF c_has_o /= 0 GENERATE
    o <= async_out;
  END GENERATE async_output_b;
  
  -- Check if a registered output is to be used, and if so, use the reg_fd BaseBlock
  i_sync_output_b : IF c_has_q /= 0 GENERATE
    -- Allow all controls on the output register
    pipe_lt_gt_le_gt_output_reg : c_reg_fd_v12_0_3_viv
      GENERIC MAP(
        c_width         => 1,
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => "0",
        c_sync_priority => c_sync_priority,
        c_sync_enable   => c_sync_enable,
        c_has_ce        => c_has_ce,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => 0,
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => 0,
        c_enable_rlocs  => 0
        )
      PORT MAP(
        clk   => clk,
        ce    => ce,
        ainit => '0',
        aclr  => aclr,
        aset  => aset,
        sinit => '0',
        sclr  => sclr,
        sset  => sset,
        d(0)  => async_out,
        q(0)  => sync_out
        );
    
    q <= sync_out;
  END GENERATE i_sync_output_b;
  
END ARCHITECTURE struct;



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
-------------------------------------------------------------------------------
-- RTL comparator code to allow comparison of the new v8 BaseBlock code with
-- basic RTL (inferred) XST results.  Deals with signed and unsigned data for
-- the operations that are not basic equality tests.
--
-- Author: Andrew Whyte
-- Created: 04/11/2004
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xbip_utils_v3_0_7;
USE xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.ALL;

LIBRARY c_reg_fd_v12_0_3;
USE c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.ALL;

-- Component declarations for the sub-cores
LIBRARY c_compare_v12_0_3;
USE c_compare_v12_0_3.pkg_compare_v12_0.ALL;

ENTITY c_compare_v12_0_3_rtl IS
  GENERIC (
    c_family        : STRING  := "virtex2";
    c_width         : INTEGER := 16;    -- input data width
    c_ainit_val     : STRING  := "0";   -- power-on value for output register
    c_data_type     : INTEGER := c_signed;  -- 0=c_signed or 1=c_unsigned
    c_b_constant    : INTEGER := 0;  -- specify if B is a constant to compare to
    c_b_value       : STRING  := "0000000000000000";  -- specify the constant B port value
    c_sync_enable   : INTEGER := 0;  -- 0=SYNC_OVERRIDES_CE, 1=CE_OVERRIDES_SYNC
    c_sync_priority : INTEGER := 1;  -- 0=SET_OVERRIDES_RESET, 1=RESET_OVERRIDES_SET
    c_pipe_stages   : INTEGER := 0;  -- valid values depend on operation and width
    c_has_a_eq_b    : INTEGER := 1;     -- async output generics a = b
    c_has_a_ne_b    : INTEGER := 0;     -- a /= b
    c_has_a_lt_b    : INTEGER := 0;     -- a < b
    c_has_a_gt_b    : INTEGER := 0;     -- a > b
    c_has_a_le_b    : INTEGER := 0;     -- a <= b
    c_has_a_ge_b    : INTEGER := 0;     -- a >= b
    c_has_qa_eq_b   : INTEGER := 0;     -- registered output generics a = b
    c_has_qa_ne_b   : INTEGER := 0;     -- a /= b
    c_has_qa_lt_b   : INTEGER := 0;     -- a < b
    c_has_qa_gt_b   : INTEGER := 0;     -- a > b
    c_has_qa_le_b   : INTEGER := 0;     -- a <= b
    c_has_qa_ge_b   : INTEGER := 0;     -- a >= b
    c_has_ce        : INTEGER := 0;     -- register controls
    c_has_aclr      : INTEGER := 0;
    c_has_aset      : INTEGER := 0;
    c_has_sclr      : INTEGER := 0;
    c_has_sset      : INTEGER := 0;
    c_enable_rlocs  : INTEGER := 0;      -- redundant in the VHDL version
    c_carry_chain_eq_ne         : INTEGER := 0;
    c_infered_rtl_const_compare : INTEGER := 0
    ); 

  PORT (
    a       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);  -- input value
    b       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);  -- input value
    clk     : IN  STD_LOGIC;            -- clock
    ce      : IN  STD_LOGIC;            -- clock enable
    aclr    : IN  STD_LOGIC;            -- async init.
    aset    : IN  STD_LOGIC;            -- async set
    sclr    : IN  STD_LOGIC;            -- sync init.
    sset    : IN  STD_LOGIC;            -- sync set
    a_eq_b  : OUT STD_LOGIC;            -- a = b output
    a_ne_b  : OUT STD_LOGIC;            -- a /= b output
    a_lt_b  : OUT STD_LOGIC;            -- a < b output
    a_gt_b  : OUT STD_LOGIC;            -- a > b output
    a_le_b  : OUT STD_LOGIC;            -- a <= b output
    a_ge_b  : OUT STD_LOGIC;            -- a >= b output
    qa_eq_b : OUT STD_LOGIC;            -- registered a = b output
    qa_ne_b : OUT STD_LOGIC;            -- registered a /= b output
    qa_lt_b : OUT STD_LOGIC;            -- registered a < b output
    qa_gt_b : OUT STD_LOGIC;            -- registered a > b output
    qa_le_b : OUT STD_LOGIC;            -- registered a <= b output
    qa_ge_b : OUT STD_LOGIC             -- registered a >= b output
    );

END ENTITY c_compare_v12_0_3_rtl;
  
  
ARCHITECTURE rtl OF c_compare_v12_0_3_rtl IS

  -- Create a local enumerated representation of c_data_type
  CONSTANT number_format : T_NUMBER_FORMAT := fn_select_number_format(c_data_type);

  function fn_convert_b_value(c_b_value : string) return string is
    variable ret_str : string(1 to c_b_value'length);
  begin
    for i in 1 to c_b_value'length loop
      if (c_b_value'ascending) then
        --input is defiend as to
        ret_str(i) := c_b_value(i);
      else
        --input is def as downto
        ret_str(i) := c_b_value(c_b_value'high - i + 1);
      end if;
    end loop;
    return ret_str;
  end function fn_convert_b_value;

  constant c_b_value_to_defn : string := fn_convert_b_value(c_b_value);
  
  -- Store the constant B port value (if used) in a constant and pad it with
  -- zeros if necessary
  CONSTANT b_const : STD_LOGIC_VECTOR(c_width-1 DOWNTO 0) := str_to_bound_slv_0(c_b_value_to_defn, c_width);

  -- Internal signal that can take the B port value or take the B constant
  -- value when it is assigned to be a constant
  SIGNAL b_i : STD_LOGIC_VECTOR(c_width-1 DOWNTO 0);

  -- Stores the result of the comparison before being assigned to the output
  -- ports required - SLV to be compatible with reg_fd_v9_0 BaseBlock ports
  SIGNAL result : STD_LOGIC;
  SIGNAL result_op : STD_LOGIC;  

  -- Internal signal to be compatible with reg_fd_v9_0 BaseBlock ports
  -- Initialisation assigns power-on value for the register
  SIGNAL registered_result : STD_LOGIC;

  -- for pipelined modules
  CONSTANT allow_aclr : integer := fn_allow_async_ctrl(c_has_sclr, c_has_sset, c_has_aclr);
  CONSTANT allow_aset : integer := fn_allow_async_ctrl(c_has_sclr, c_has_sset, c_has_aset);

BEGIN  -- ARCHITECTURE rtl

  b_val_not_const : IF c_b_constant = 0 GENERATE
    b_i <= b;
  END GENERATE b_val_not_const;
  b_val_const : IF c_b_constant /= 0 GENERATE
    b_i <= b_const;
  END GENERATE b_val_const;

  -- A = B test
  gen_a_eq_b : IF c_has_a_eq_b /= 0 OR c_has_qa_eq_b /= 0 GENERATE
    result <= '1' WHEN (a = b_i) ELSE '0';
  END GENERATE gen_a_eq_b;
  
  -- A /= B test
  gen_a_ne_b : IF c_has_a_ne_b /= 0 OR c_has_qa_ne_b /= 0 GENERATE
    result <= '1' WHEN (a /= b_i) ELSE '0';
  END GENERATE gen_a_ne_b;
  
  -- A < B test
  gen_a_lt_b : IF c_has_a_lt_b /= 0 OR c_has_qa_lt_b /= 0 GENERATE
    
    gen_signed : IF number_format = NUM_SIGNED GENERATE
      result <= '1' WHEN ((SIGNED(a)) < (SIGNED(b_i))) ELSE '0';
    END GENERATE gen_signed;
    
    gen_unsigned : IF number_format = NUM_UNSIGNED GENERATE
      result <= '1' WHEN ((UNSIGNED(a)) < (UNSIGNED(b_i))) ELSE '0';
    END GENERATE gen_unsigned;
    
  END GENERATE gen_a_lt_b;
  
  -- A > B test
  gen_a_gt_b : IF c_has_a_gt_b /= 0 OR c_has_qa_gt_b /= 0 GENERATE
    
    gen_signed : IF number_format = NUM_SIGNED GENERATE
      result <= '1' WHEN ((SIGNED(a)) > (SIGNED(b_i))) ELSE '0';
    END GENERATE gen_signed;
    
    gen_unsigned : IF number_format = NUM_UNSIGNED GENERATE
      result <= '1' WHEN ((UNSIGNED(a)) > (UNSIGNED(b_i))) ELSE '0';
    END GENERATE gen_unsigned;
    
  END GENERATE gen_a_gt_b;
  
  -- A <= B test
  gen_a_le_b : IF c_has_a_le_b /= 0 OR c_has_qa_le_b /= 0 GENERATE
    
    gen_signed : IF number_format = NUM_SIGNED GENERATE
      result <= '1' WHEN ((SIGNED(a)) <= (SIGNED(b_i))) ELSE '0';
    END GENERATE gen_signed;
    
    gen_unsigned : IF number_format = NUM_UNSIGNED GENERATE
      result <= '1' WHEN ((UNSIGNED(a)) <= (UNSIGNED(b_i))) ELSE '0';
    END GENERATE gen_unsigned;
    
  END GENERATE gen_a_le_b;
  
  -- A >= B test
  gen_a_ge_b : IF c_has_a_ge_b /= 0 OR c_has_qa_ge_b /= 0 GENERATE
    
    gen_signed : IF number_format = NUM_SIGNED GENERATE
      result <= '1' WHEN ((SIGNED(a)) >= (SIGNED(b_i))) ELSE '0';
    END GENERATE gen_signed;
    
    gen_unsigned : IF number_format = NUM_UNSIGNED GENERATE
      result <= '1' WHEN ((UNSIGNED(a)) >= (UNSIGNED(b_i))) ELSE '0';
    END GENERATE gen_unsigned;
    
  END GENERATE gen_a_ge_b;
  

  gen_nonpipelined : IF c_pipe_stages = 0 GENERATE
    result_op <= result;
  END GENERATE gen_nonpipelined;

  gen_pipe_flops : IF c_pipe_stages /= 0 GENERATE
    SIGNAL compare_for_stage          : STD_LOGIC_VECTOR (0 TO c_pipe_stages);
  BEGIN
    stages: FOR stage IN 1 TO c_pipe_stages GENERATE
      compare_for_stage(0) <= result;
      comparepipereg : c_reg_fd_v12_0_3_viv
        GENERIC MAP (
          c_width         => 1,           -- bit mux o/p is only ever 1 bit wide
          c_ainit_val     => c_ainit_val,
          c_sinit_val     => "0",
          c_sync_priority => c_sync_priority,
          c_sync_enable   => c_sync_enable,
          c_has_ce        => c_has_ce,
          c_has_aclr      => allow_aclr,
          c_has_aset      => allow_aset,
          c_has_ainit     => 0,           -- No ainit since single o/p register
          c_has_sclr      => c_has_sclr,
          c_has_sset      => c_has_sset,
          c_has_sinit     => 0,           -- No sinit since single o/p register
          c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
          )
        PORT MAP (
          clk  => clk,
          ce   => ce,
          ainit => '0',
          aclr  => aclr,
          aset  => aset,
          sclr  => sclr,
          sinit => '0',
          sset  => sset,
          d(0) => compare_for_stage(stage - 1),
          q(0) => compare_for_stage(stage)
          );
    END GENERATE stages;
    result_op <= compare_for_stage(c_pipe_stages);
  END GENERATE gen_pipe_flops;
                   
  gen_op_a_eq_b : IF c_has_a_eq_b /= 0 GENERATE
    a_eq_b <= result_op;
    a_ne_b <= '-';
    a_lt_b <= '-';
    a_gt_b <= '-';
    a_le_b <= '-';
    a_ge_b <= '-';
  END GENERATE gen_op_a_eq_b;
  gen_op_a_ne_b : IF c_has_a_ne_b /= 0 GENERATE
    a_eq_b <= '-';
    a_ne_b <= result_op;
    a_lt_b <= '-';
    a_gt_b <= '-';
    a_le_b <= '-';
    a_ge_b <= '-';
  END GENERATE gen_op_a_ne_b;
  gen_op_a_lt_b : IF c_has_a_lt_b /= 0 GENERATE
    a_eq_b <= '-';
    a_ne_b <= '-';
    a_lt_b <= result_op;
    a_gt_b <= '-';
    a_le_b <= '-';
    a_ge_b <= '-';
  END GENERATE gen_op_a_lt_b;
  gen_op_a_gt_b : IF c_has_a_gt_b /= 0 GENERATE
    a_eq_b <= '-';
    a_ne_b <= '-';
    a_lt_b <= '-';
    a_gt_b <= result_op;
    a_le_b <= '-';
    a_ge_b <= '-';
  END GENERATE gen_op_a_gt_b;
  gen_op_a_le_b : IF c_has_a_le_b /= 0 GENERATE
    a_eq_b <= '-';
    a_ne_b <= '-';
    a_lt_b <= '-';
    a_gt_b <= '-';
    a_le_b <= result_op;
    a_ge_b <= '-';
  END GENERATE gen_op_a_le_b;
  gen_op_a_ge_b : IF c_has_a_ge_b /= 0 GENERATE
    a_eq_b <= '-';
    a_ne_b <= '-';
    a_lt_b <= '-';
    a_gt_b <= '-';
    a_le_b <= '-';
    a_ge_b <= result_op;
  END GENERATE gen_op_a_ge_b;  
  
  -- Generate output register if required
  gen_output_reg : IF c_has_qa_eq_b /= 0
                     OR c_has_qa_ne_b /= 0
                     OR c_has_qa_lt_b /= 0
                     OR c_has_qa_gt_b /= 0
                     OR c_has_qa_le_b /= 0
                     OR c_has_qa_ge_b /= 0 GENERATE
    output_reg : c_reg_fd_v12_0_3_viv
      GENERIC MAP(
        c_width         => 1,           -- bit mux o/p is only ever 1 bit wide
        c_ainit_val     => c_ainit_val,
        c_sinit_val     => "0",
        c_sync_priority => c_sync_priority,
        c_sync_enable   => c_sync_enable,
        c_has_ce        => c_has_ce,
        c_has_aclr      => c_has_aclr,
        c_has_aset      => c_has_aset,
        c_has_ainit     => 0,           -- No ainit since single o/p register
        c_has_sclr      => c_has_sclr,
        c_has_sset      => c_has_sset,
        c_has_sinit     => 0,           -- No sinit since single o/p register
        c_enable_rlocs  => 0            -- RLOCs are redundant for VHDL core
        )
      PORT MAP(
        clk   => clk,
        ce    => ce,
        ainit => '0',
        aclr  => aclr,
        aset  => aset,
        sinit => '0',
        sclr  => sclr,
        sset  => sset,
        d(0)  => result_op,
        q(0)  => registered_result
        );

    -- Assign registered output to port(s)
    gen_op_qa_eq_b : IF c_has_qa_eq_b /= 0 GENERATE
      qa_eq_b <= registered_result;
      qa_ne_b <= '-';
      qa_lt_b <= '-';
      qa_gt_b <= '-';
      qa_le_b <= '-';
      qa_ge_b <= '-';
    END GENERATE gen_op_qa_eq_b;
    gen_op_qa_ne_b : IF c_has_qa_ne_b /= 0 GENERATE
      qa_eq_b <= '-';
      qa_ne_b <= registered_result;
      qa_lt_b <= '-';
      qa_gt_b <= '-';
      qa_le_b <= '-';
      qa_ge_b <= '-';
    END GENERATE gen_op_qa_ne_b;
    gen_op_qa_lt_b : IF c_has_qa_lt_b /= 0 GENERATE
      qa_eq_b <= '-';
      qa_ne_b <= '-';
      qa_lt_b <= registered_result;
      qa_gt_b <= '-';
      qa_le_b <= '-';
      qa_ge_b <= '-';
    END GENERATE gen_op_qa_lt_b;
    gen_op_qa_gt_b : IF c_has_qa_gt_b /= 0 GENERATE
      qa_eq_b <= '-';
      qa_ne_b <= '-';
      qa_lt_b <= '-';
      qa_gt_b <= registered_result;
      qa_le_b <= '-';
      qa_ge_b <= '-';
    END GENERATE gen_op_qa_gt_b;
    gen_op_qa_le_b : IF c_has_qa_le_b /= 0 GENERATE
      qa_eq_b <= '-';
      qa_ne_b <= '-';
      qa_lt_b <= '-';
      qa_gt_b <= '-';
      qa_le_b <= registered_result;
      qa_ge_b <= '-';
    END GENERATE gen_op_qa_le_b;
    gen_op_qa_ge_b : IF c_has_qa_ge_b /= 0 GENERATE
      qa_eq_b <= '-';
      qa_ne_b <= '-';
      qa_lt_b <= '-';
      qa_gt_b <= '-';
      qa_le_b <= '-';
      qa_ge_b <= registered_result;
    END GENERATE gen_op_qa_ge_b;
    
  END GENERATE gen_output_reg;
  
END ARCHITECTURE rtl;


-- $Id: c_compare_v12_0_3_viv.vhd,v 1.3 2009/09/08 15:11:18 akennedy Exp $
--------------------------------------------------------------------------------
--  (c) Copyright 2004 Xilinx, Inc. All rights reserved.
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
-- \   \   \/    Version: 8.0
--  \   \        Filename: c_compare_v12_0_3_viv.vhd
--  /   /
-- /___/   /\
-- \   \  /  \
--  \___\/\___\
--
--
-- Author: andreww
--
-- ******************* Core Functionality ************************************
--
-- * Compares two data values
-- * Signed or unsigned operation
-- * =, /=, <, <=, >, >= comparisons available
-- * Optionally compare to a CONSTANT
-- * Pipelining options added (up to 4 levels for =, /=; up to 1 level for <,
--   <=, > >=)
-- * Output register takes all controls, pipeline registers only allow async
--   controls if no sync controls are present
--
-- ******************* Design Notes ************************************
--
-- The non-pipelined comparisons simply instantiate the sub-cores
-- c_compare_eq_ne or c_compare_lt_ge_gt_le and they create the required logic
--
-- The pipelined comparisons instantiate multiple instances of the above
-- components with the size determined by generic parameters.
--
-- For the pipelined = and /=, the gate_bit BaseBlock is used to AND or NAND
-- the result from the partial results (each using 1 LUT).  1 level of
-- pipelining will simply register the output from the partial results; higher
-- pipelining values will (if available) implement pipelining within the gate_bit
--
-- For the <, > etc., the partial results are formed by instantiating a < or >
-- block and a neighbouring = block to allow the = condition to be propagated
-- and the next most-significant < or > to be tested.  This results in a
-- structure of carry chains feeding a result carry chain with LUTs used for
-- the equality test (fastest).  The block sizes for the partial results have
-- been optimised for speed and the shortest path to the first pipeline
-- register for asynchronous inputs.
--
--------------------------------------------------------------------------------

--TO DO
--need to introduce the option of LUT_ONLY Implementation(possible in carry chain structure?

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Constants and utilities packages
library xbip_utils_v3_0_7;
use xbip_utils_v3_0_7.xbip_utils_v3_0_7_pkg.all;

-- Used to register the output of the < > <= >= compares
library c_reg_fd_v12_0_3;
use c_reg_fd_v12_0_3.c_reg_fd_v12_0_3_viv_comp.all;

-- Component declarations for the sub-cores
library c_compare_v12_0_3;
use c_compare_v12_0_3.pkg_compare_v12_0.all;

-- Allow primitive instantiation (for MUXCY)
library unisim;
use unisim.vcomponents.all;

--core_if on entity xst
entity c_compare_v12_0_3_viv is
  generic (
    C_FAMILY                    : string  := "virtex2";
    C_WIDTH                     : integer := 16;
    C_AINIT_VAL                 : string  := "0";
    C_DATA_TYPE                 : integer := 0;
    C_B_CONSTANT                : integer := 0;
    C_B_VALUE                   : string  := "0000000000000000";
    C_SYNC_ENABLE               : integer := 0;
    C_SYNC_PRIORITY             : integer := 1;
    C_PIPE_STAGES               : integer := 0;
    C_HAS_A_EQ_B                : integer := 1;
    C_HAS_A_NE_B                : integer := 0;
    C_HAS_A_LT_B                : integer := 0;
    C_HAS_A_GT_B                : integer := 0;
    C_HAS_A_LE_B                : integer := 0;
    C_HAS_A_GE_B                : integer := 0;
    C_HAS_QA_EQ_B               : integer := 0;
    C_HAS_QA_NE_B               : integer := 0;
    C_HAS_QA_LT_B               : integer := 0;
    C_HAS_QA_GT_B               : integer := 0;
    C_HAS_QA_LE_B               : integer := 0;
    C_HAS_QA_GE_B               : integer := 0;
    C_HAS_CE                    : integer := 0;
    C_HAS_ACLR                  : integer := 0;
    C_HAS_ASET                  : integer := 0;
    C_HAS_SCLR                  : integer := 0;
    C_HAS_SSET                  : integer := 0;
    C_ENABLE_RLOCS              : integer := 0;
    C_CARRY_CHAIN_EQ_NE         : integer := 0;
    C_INFERED_RTL_CONST_COMPARE : integer := 0;
    C_DENSE_LUT_PACKING         : integer := 0
    );

  port (
    A       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
    B       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
    CLK     : in  std_logic                            := '0';
    CE      : in  std_logic                            := '1';
    ACLR    : in  std_logic                            := '0';
    ASET    : in  std_logic                            := '0';
    SCLR    : in  std_logic                            := '0';
    SSET    : in  std_logic                            := '0';
    A_EQ_B  : out std_logic;
    A_NE_B  : out std_logic;
    A_LT_B  : out std_logic;
    A_GT_B  : out std_logic;
    A_LE_B  : out std_logic;
    A_GE_B  : out std_logic;
    QA_EQ_B : out std_logic;
    QA_NE_B : out std_logic;
    QA_LT_B : out std_logic;
    QA_GT_B : out std_logic;
    QA_LE_B : out std_logic;
    QA_GE_B : out std_logic
    );
  --core_if off

  attribute OPTIMIZE_PRIMITIVES                        : string;
  attribute OPTIMIZE_PRIMITIVES of c_compare_v12_0_3_viv : entity is "NO";

  function fn_use_sync(has_q : integer) return string is
  begin
    if has_q = 0 then
      return "auto";
    else
      return "no";
    end if;
  end function fn_use_sync;

  attribute USE_SYNC_SET                        : string;
  attribute USE_SYNC_SET of c_compare_v12_0_3_viv : entity is "NO";  -- fn_use_sync(c_has_q);

  attribute USE_SYNC_RESET                        : string;
  attribute USE_SYNC_RESET of c_compare_v12_0_3_viv : entity is "NO";  --fn_use_sync(c_has_q);

-- ATTRIBUTE USE_SYNC_SET : STRING;
-- ATTRIBUTE USE_SYNC_SET OF q : SIGNAL IS "no";  --fn_use_sync(c_has_q);

-- ATTRIBUTE USE_SYNC_RESET : STRING;
-- ATTRIBUTE USE_SYNC_RESET OF q : SIGNAL IS "no";  --fn_use_sync(c_has_q);

end entity c_compare_v12_0_3_viv;

architecture synth of c_compare_v12_0_3_viv is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- Determine the target architecture
  constant device_family : T_DEVICE_FAMILY := fn_check_family(c_family);

  constant lut_size : integer := fn_get_lut_size(device_family);

-------------------------------------------------------------------------------
-- types, constants and signals
-------------------------------------------------------------------------------

  -- Check that the specified generic combination is valid
  constant verify_generics : integer range 0 to 0 := check_generics(c_width, c_ainit_val, c_data_type, c_b_constant, c_b_value,
                                                                    c_sync_enable, c_sync_priority, c_pipe_stages, c_has_a_eq_b, c_has_a_ne_b, c_has_a_lt_b, c_has_a_gt_b,
                                                                    c_has_a_le_b, c_has_a_ge_b, c_has_qa_eq_b, c_has_qa_ne_b, c_has_qa_lt_b, c_has_qa_gt_b, c_has_qa_le_b,
                                                                    c_has_qa_ge_b, c_has_ce, c_has_aclr, c_has_aset, c_has_sclr, c_has_sset, c_enable_rlocs, lut_size);

  -- Create a local enumerated representation of c_data_type
  constant number_format : T_NUMBER_FORMAT := fn_select_number_format(c_data_type);

  function fn_convert_b_value(c_b_value : string) return string is
    variable ret_str                    : string(1 to c_b_value'length);
  begin
    for i in 1 to c_b_value'length loop
      if (c_b_value'ascending) then
        --input is defiend as to
        ret_str(i) := c_b_value(i);
      else
        --input is def as downto
        ret_str(i) := c_b_value(c_b_value'high - i + 1);
      end if;
    end loop;
    return ret_str;
  end function fn_convert_b_value;

  constant c_b_value_to_defn : string := fn_convert_b_value(c_b_value);

  constant b_const_pad_str : string := fn_pad_c_b_value(c_width, c_b_value_to_defn);

  constant b_const_vector : std_logic_vector(c_width-1 downto 0) := str_to_bound_slv_0(b_const_pad_str, c_width);

  constant c_has_q : integer := c_has_qa_ne_b + c_has_qa_eq_b + c_has_qa_le_b + c_has_qa_lt_b + c_has_qa_ge_b + c_has_qa_gt_b;
  constant c_has_o : integer := c_has_a_ne_b + c_has_a_eq_b + c_has_a_le_b + c_has_a_lt_b + c_has_a_ge_b + c_has_a_gt_b;
                                        --only ever 1 op so always 0 or 1



  constant lt_ge_gt_le : integer := fn_lt_ge_gt_le(c_has_qa_lt_b, c_has_a_lt_b,
                                                   c_has_qa_gt_b, c_has_a_gt_b,
                                                   c_has_qa_le_b, c_has_a_le_b,
                                                   c_has_qa_ge_b, c_has_a_ge_b);

  -- Indicate whether to use a = or /= block for the pipelined = /= compares
  constant eq_or_ne : integer := fn_eq_or_ne(c_has_qa_eq_b, c_has_a_eq_b, c_has_qa_ne_b, c_has_a_ne_b);


  -- Internal signal that can take the B port value or take the B constant
  -- value when it is assigned to be a constant
  signal b_i : std_logic_vector(c_width-1 downto 0);

  signal async_out : std_logic;
  signal sync_out  : std_logic;

  constant bits_per_lut : integer := fn_bits_per_lut_comp(c_b_constant, lut_size, c_dense_lut_packing);

begin  -- ARCHITECTURE synth

  gen_infered_logic : if c_infered_rtl_const_compare /=0 generate
    rtl_model_viv   : c_compare_v12_0_3_rtl
      generic map(c_family        => c_family,
                  c_width         => c_width,
                  c_ainit_val     => c_ainit_val,
                  c_data_type     => c_data_type,
                  c_b_constant    => c_b_constant,
                  c_b_value       => c_b_value,
                  c_sync_enable   => c_sync_enable,
                  c_sync_priority => c_sync_priority,
                  c_pipe_stages   => c_pipe_stages,
                  c_has_a_eq_b    => c_has_a_eq_b,
                  c_has_a_ne_b    => c_has_a_ne_b,
                  c_has_a_lt_b    => c_has_a_lt_b,
                  c_has_a_gt_b    => c_has_a_gt_b,
                  c_has_a_le_b    => c_has_a_le_b,
                  c_has_a_ge_b    => c_has_a_ge_b,
                  c_has_qa_eq_b   => c_has_qa_eq_b,
                  c_has_qa_ne_b   => c_has_qa_ne_b,
                  c_has_qa_lt_b   => c_has_qa_lt_b,
                  c_has_qa_gt_b   => c_has_qa_gt_b,
                  c_has_qa_le_b   => c_has_qa_le_b,
                  c_has_qa_ge_b   => c_has_qa_ge_b,
                  c_has_ce        => c_has_ce,
                  c_has_aclr      => c_has_aclr,
                  c_has_aset      => c_has_aset,
                  c_has_sclr      => c_has_sclr,
                  c_has_sset      => c_has_sset,
                  c_enable_rlocs  => c_enable_rlocs
                  )

      port map(a       => a,
               b       => b,
               clk     => clk,
               ce      => ce,
               aclr    => aclr,
               aset    => aset,
               sclr    => sclr,
               sset    => sset,
               a_eq_b  => a_eq_b,
               a_ne_b  => a_ne_b,
               a_lt_b  => a_lt_b,
               a_gt_b  => a_gt_b,
               a_le_b  => a_le_b,
               a_ge_b  => a_ge_b,
               qa_eq_b => qa_eq_b,
               qa_ne_b => qa_ne_b,
               qa_lt_b => qa_lt_b,
               qa_gt_b => qa_gt_b,
               qa_le_b => qa_le_b,
               qa_ge_b => qa_ge_b
               );
  end generate gen_infered_logic;


  gen_structure_logic : if c_infered_rtl_const_compare = 0 generate

    -------------------------------------------------------------------------------
    -- Internal signal assignment for the B data
    -------------------------------------------------------------------------------

    b_val_not_const : if c_b_constant = 0 generate
      b_i <= b;
    end generate b_val_not_const;
    b_val_const     : if c_b_constant /= 0 generate
      b_i <= b_const_vector;
    end generate b_val_const;

-------------------------------------------------------------------------------
-- Non-pipelined comparator code section
-------------------------------------------------------------------------------

    gen_nonpipelined : if c_pipe_stages = 0 generate

      -------------------------------------------------------------------------------
      -- A = B or A /= B (variable or constant)
      -------------------------------------------------------------------------------
      a_equal_notequal_b : if c_has_a_eq_b /= 0 or c_has_qa_eq_b /= 0 or c_has_a_ne_b /= 0 or c_has_qa_ne_b /= 0 generate
-- CONSTANT has_o : integer RANGE 0 TO 2 := c_has_a_eq_b + c_has_a_ne_b;             --since we compare to /= 0, we can pass a value larger than 1 to enable the PORT
--        CONSTANT has_q   : integer RANGE 0 TO 2 := c_has_qa_eq_b + c_has_qa_ne_b;  -- but we only allow 1 operation for the core, so will always only be 0 or 1
      begin
        i_a_eq_ne_b      : c_compare_eq_ne
          generic map(
            c_family            => c_family,
            c_lut_size          => lut_size,
            c_operation         => eq_or_ne,                                         -- determines operation
            c_width             => c_width,
            c_b_constant        => c_b_constant,
            c_ainit_val         => c_ainit_val,
            c_sync_priority     => c_sync_priority,
            c_sync_enable       => c_sync_enable,
            c_has_ce            => c_has_ce,
            c_has_aclr          => c_has_aclr,
            c_has_aset          => c_has_aset,
            c_has_sclr          => c_has_sclr,
            c_has_sset          => c_has_sset,
            c_has_o             => c_has_o,
            c_has_q             => c_has_q,
            c_carry_chain_eq_ne => c_carry_chain_eq_ne)
          port map(
            a                   => a,
            b                   => b_i,
            clk                 => clk,
            ce                  => ce,
            aclr                => aclr,
            aset                => aset,
            sclr                => sclr,
            sset                => sset,
            o                   => async_out,
            q                   => sync_out);
      end generate a_equal_notequal_b;

      -------------------------------------------------------------------------------
      -- A < B or A > B or A >= B or A <= B (variable or constant) - signed or unsigned
      -------------------------------------------------------------------------------
      a_lt_ge_gt_le_b          : if not(c_has_a_eq_b /= 0 or c_has_qa_eq_b /= 0 or c_has_a_ne_b /= 0 or c_has_qa_ne_b /= 0) generate  -- note the NOT!!!
        --use the carry-structure block to select between an iference LUT only implementation, and a carry-chain
        --structureal implementation. Constant compares are always LUT only, non-constant < 1LUT are implementation only
        --also.
        --note the carry structure is also used to implement pipelining
        i_gen_carry_chain_comp : c_compare_carry_structure
          generic map(
            c_data_type     => c_data_type,
            c_lut_size      => lut_size,
            c_bits_per_lut  => bits_per_lut,
            c_operation     => lt_ge_gt_le,                                                                                           -- select operation
            c_b_constant    => c_b_constant,
            c_b_value       => b_const_pad_str,
            c_width         => c_width,
            c_ainit_val     => c_ainit_val,
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_o         => c_has_o,
            c_has_q         => c_has_q)
          port map(
            a               => a,
            b               => b_i,
            clk             => clk,
            ce              => ce,
            aclr            => aclr,
            aset            => aset,
            sclr            => sclr,
            sset            => sset,
            q               => sync_out,
            o               => async_out);
      end generate a_lt_ge_gt_le_b;

    end generate gen_nonpipelined;

-------------------------------------------------------------------------------
-- Pipelined comparator code section
-------------------------------------------------------------------------------

    gen_pipelined        : if c_pipe_stages > 0 generate
      a_equal_notequal_b : if c_has_a_eq_b /= 0 or c_has_qa_eq_b /= 0 or c_has_a_ne_b /= 0 or c_has_qa_ne_b /= 0 generate
        i_a_eq_ne_b_pipe : c_compare_pipeline_equality
          generic map(
            c_data_type     => c_data_type,
            c_lut_size      => lut_size,
            c_operation     => eq_or_ne,  -- select operation
            c_width         => c_width,
            c_b_constant    => c_b_constant,
            c_ainit_val     => c_ainit_val,
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_pipe_stages   => c_pipe_stages,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_o         => c_has_o,
            c_has_q         => c_has_q)
          port map(
            a               => a,
            b               => b_i,
            clk             => clk,
            ce              => ce,
            aclr            => aclr,
            aset            => aset,
            sclr            => sclr,
            sset            => sset,
            q               => sync_out,
            o               => async_out);
      end generate a_equal_notequal_b;

      a_lt_ge_gt_le_b : if not(c_has_a_eq_b /= 0 or c_has_qa_eq_b /= 0 or c_has_a_ne_b /= 0 or c_has_qa_ne_b /= 0) generate  -- note the NOT!!!
        i_a_lt_gt_b   : c_compare_pipeline_structure
          generic map(
            c_data_type     => c_data_type,
            c_lut_size      => lut_size,
            c_operation     => lt_ge_gt_le,                                                                                  -- select operation
            c_bits_per_lut  => bits_per_lut,
            c_width         => c_width,
            c_b_constant    => c_b_constant,
            c_b_value       => b_const_pad_str,
            c_ainit_val     => c_ainit_val,
            c_sync_priority => c_sync_priority,
            c_sync_enable   => c_sync_enable,
            c_pipe_stages   => c_pipe_stages,
            c_has_ce        => c_has_ce,
            c_has_aclr      => c_has_aclr,
            c_has_aset      => c_has_aset,
            c_has_sclr      => c_has_sclr,
            c_has_sset      => c_has_sset,
            c_has_o         => c_has_o,
            c_has_q         => c_has_q
            )
          port map(
            a               => a,
            b               => b_i,
            clk             => clk,
            ce              => ce,
            aclr            => aclr,
            aset            => aset,
            sclr            => sclr,
            sset            => sset,
            q               => sync_out,
            o               => async_out);
      end generate a_lt_ge_gt_le_b;
    end generate gen_pipelined;
  end generate gen_structure_logic;

  -------------------------------------------------------------------------------
  -- Output assignment and registering section
  -------------------------------------------------------------------------------

  i_has_o_eq : if c_has_a_eq_b /= 0 generate
    a_eq_b  <= async_out;
  end generate i_has_o_eq;
  i_has_q_eq : if c_has_qa_eq_b /= 0 generate
    qa_eq_b <= sync_out;
  end generate i_has_q_eq;

  i_has_o_ne : if c_has_a_ne_b /= 0 generate
    a_ne_b  <= async_out;
  end generate i_has_o_ne;
  i_has_q_ne : if c_has_qa_ne_b /= 0 generate
    qa_ne_b <= sync_out;
  end generate i_has_q_ne;

  -- Assign the result to the correct output port
  i_a_lt_b : if c_has_a_lt_b /= 0 generate
    a_lt_b <= async_out;
  end generate i_a_lt_b;
  i_a_gt_b : if c_has_a_gt_b /= 0 generate
    a_gt_b <= async_out;
  end generate i_a_gt_b;
  i_a_le_b : if c_has_a_le_b /= 0 generate
    a_le_b <= async_out;
  end generate i_a_le_b;
  i_a_ge_b : if c_has_a_ge_b /= 0 generate
    a_ge_b <= async_out;
  end generate i_a_ge_b;

  i_qa_lt_b : if c_has_qa_lt_b /= 0 generate
    qa_lt_b <= sync_out;
  end generate i_qa_lt_b;
  i_qa_gt_b : if c_has_qa_gt_b /= 0 generate
    qa_gt_b <= sync_out;
  end generate i_qa_gt_b;
  i_qa_le_b : if c_has_qa_le_b /= 0 generate
    qa_le_b <= sync_out;
  end generate i_qa_le_b;
  i_qa_ge_b : if c_has_qa_ge_b /= 0 generate
    qa_ge_b <= sync_out;
  end generate i_qa_ge_b;



  -- added to reduce warnings

  i_has_o_eq0 : if c_has_a_eq_b = 0 generate
    a_eq_b  <= '0';
  end generate i_has_o_eq0;
  i_has_q_eq0 : if c_has_qa_eq_b = 0 generate
    qa_eq_b <= '0';
  end generate i_has_q_eq0;

  i_has_o_ne0 : if c_has_a_ne_b = 0 generate
    a_ne_b  <= '0';
  end generate i_has_o_ne0;
  i_has_q_ne0 : if c_has_qa_ne_b = 0 generate
    qa_ne_b <= '0';
  end generate i_has_q_ne0;

  -- Assign the result to the correct output port
  i_a_lt_b0 : if c_has_a_lt_b = 0 generate
    a_lt_b <= '0';
  end generate i_a_lt_b0;
  i_a_gt_b0 : if c_has_a_gt_b = 0 generate
    a_gt_b <= '0';
  end generate i_a_gt_b0;
  i_a_le_b0 : if c_has_a_le_b = 0 generate
    a_le_b <= '0';
  end generate i_a_le_b0;
  i_a_ge_b0 : if c_has_a_ge_b = 0 generate
    a_ge_b <= '0';
  end generate i_a_ge_b0;

  i_qa_lt_b0 : if c_has_qa_lt_b = 0 generate
    qa_lt_b <= '0';
  end generate i_qa_lt_b0;
  i_qa_gt_b0 : if c_has_qa_gt_b = 0 generate
    qa_gt_b <= '0';
  end generate i_qa_gt_b0;
  i_qa_le_b0 : if c_has_qa_le_b = 0 generate
    qa_le_b <= '0';
  end generate i_qa_le_b0;
  i_qa_ge_b0 : if c_has_qa_ge_b = 0 generate
    qa_ge_b <= '0';
  end generate i_qa_ge_b0;


end architecture synth;



-- (c) Copyright 2004 - 2013 Xilinx, Inc. All rights reserved.
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

library c_compare_v12_0_3;
use c_compare_v12_0_3.c_compare_v12_0_3_viv_comp.all;

entity c_compare_v12_0_3 is
  generic (
    C_FAMILY                    : string  := "virtex2";
    C_WIDTH                     : integer := 16;
    C_AINIT_VAL                 : string  := "0";
    C_DATA_TYPE                 : integer := 0;
    C_B_CONSTANT                : integer := 0;
    C_B_VALUE                   : string  := "0000000000000000";
    C_SYNC_ENABLE               : integer := 0;
    C_SYNC_PRIORITY             : integer := 1;
    C_PIPE_STAGES               : integer := 0;
    C_HAS_A_EQ_B                : integer := 1;
    C_HAS_A_NE_B                : integer := 0;
    C_HAS_A_LT_B                : integer := 0;
    C_HAS_A_GT_B                : integer := 0;
    C_HAS_A_LE_B                : integer := 0;
    C_HAS_A_GE_B                : integer := 0;
    C_HAS_QA_EQ_B               : integer := 0;
    C_HAS_QA_NE_B               : integer := 0;
    C_HAS_QA_LT_B               : integer := 0;
    C_HAS_QA_GT_B               : integer := 0;
    C_HAS_QA_LE_B               : integer := 0;
    C_HAS_QA_GE_B               : integer := 0;
    C_HAS_CE                    : integer := 0;
    C_HAS_ACLR                  : integer := 0;
    C_HAS_ASET                  : integer := 0;
    C_HAS_SCLR                  : integer := 0;
    C_HAS_SSET                  : integer := 0;
    C_ENABLE_RLOCS              : integer := 0;
    C_CARRY_CHAIN_EQ_NE         : integer := 0;
    C_INFERED_RTL_CONST_COMPARE : integer := 0;
    C_DENSE_LUT_PACKING         : integer := 0
    );

  port (
    A       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
    B       : in  std_logic_vector(c_width-1 downto 0) := (others => '0');
    CLK     : in  std_logic                            := '0';
    CE      : in  std_logic                            := '1';
    ACLR    : in  std_logic                            := '0';
    ASET    : in  std_logic                            := '0';
    SCLR    : in  std_logic                            := '0';
    SSET    : in  std_logic                            := '0';
    A_EQ_B  : out std_logic;
    A_NE_B  : out std_logic;
    A_LT_B  : out std_logic;
    A_GT_B  : out std_logic;
    A_LE_B  : out std_logic;
    A_GE_B  : out std_logic;
    QA_EQ_B : out std_logic;
    QA_NE_B : out std_logic;
    QA_LT_B : out std_logic;
    QA_GT_B : out std_logic;
    QA_LE_B : out std_logic;
    QA_GE_B : out std_logic
    );
  --core_if off

end entity c_compare_v12_0_3;

architecture xilinx of c_compare_v12_0_3 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of xilinx : architecture is "yes";

begin
  i_synth : c_compare_v12_0_3_viv
  generic map (
    C_FAMILY => C_FAMILY,
    C_WIDTH => C_WIDTH,
    C_AINIT_VAL => C_AINIT_VAL,
    C_DATA_TYPE => C_DATA_TYPE,
    C_B_CONSTANT => C_B_CONSTANT,
    C_B_VALUE => C_B_VALUE,
    C_SYNC_ENABLE => C_SYNC_ENABLE,
    C_SYNC_PRIORITY => C_SYNC_PRIORITY,
    C_PIPE_STAGES => C_PIPE_STAGES,
    C_HAS_A_EQ_B => C_HAS_A_EQ_B,
    C_HAS_A_NE_B => C_HAS_A_NE_B,
    C_HAS_A_LT_B => C_HAS_A_LT_B,
    C_HAS_A_GT_B => C_HAS_A_GT_B,
    C_HAS_A_LE_B => C_HAS_A_LE_B,
    C_HAS_A_GE_B => C_HAS_A_GE_B,
    C_HAS_QA_EQ_B => C_HAS_QA_EQ_B,
    C_HAS_QA_NE_B => C_HAS_QA_NE_B,
    C_HAS_QA_LT_B => C_HAS_QA_LT_B,
    C_HAS_QA_GT_B => C_HAS_QA_GT_B,
    C_HAS_QA_LE_B => C_HAS_QA_LE_B,
    C_HAS_QA_GE_B => C_HAS_QA_GE_B,
    C_HAS_CE => C_HAS_CE,
    C_HAS_ACLR => C_HAS_ACLR,
    C_HAS_ASET => C_HAS_ASET,
    C_HAS_SCLR => C_HAS_SCLR,
    C_HAS_SSET => C_HAS_SSET,
    C_ENABLE_RLOCS => C_ENABLE_RLOCS,
    C_CARRY_CHAIN_EQ_NE => C_CARRY_CHAIN_EQ_NE,
    C_INFERED_RTL_CONST_COMPARE => C_INFERED_RTL_CONST_COMPARE,
    C_DENSE_LUT_PACKING => C_DENSE_LUT_PACKING
  )
  port map (
    A => A,
    B => B,
    CLK => CLK,
    CE => CE,
    ACLR => ACLR,
    ASET => ASET,
    SCLR => SCLR,
    SSET => SSET,
    A_EQ_B => A_EQ_B,
    A_NE_B => A_NE_B,
    A_LT_B => A_LT_B,
    A_GT_B => A_GT_B,
    A_LE_B => A_LE_B,
    A_GE_B => A_GE_B,
    QA_EQ_B => QA_EQ_B,
    QA_NE_B => QA_NE_B,
    QA_LT_B => QA_LT_B,
    QA_GT_B => QA_GT_B,
    QA_LE_B => QA_LE_B,
    QA_GE_B => QA_GE_B
  );
  
end architecture xilinx;




