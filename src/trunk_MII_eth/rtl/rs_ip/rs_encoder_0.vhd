-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
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
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:rs_encoder:9.0
-- IP Revision: 11

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY rs_encoder_v9_0_11;
USE rs_encoder_v9_0_11.rs_encoder_v9_0_11;

ENTITY rs_encoder_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_input_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_input_tvalid : IN STD_LOGIC;
    s_axis_input_tready : OUT STD_LOGIC;
    s_axis_input_tlast : IN STD_LOGIC;
    m_axis_output_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_output_tvalid : OUT STD_LOGIC;
    m_axis_output_tlast : OUT STD_LOGIC;
    event_s_input_tlast_missing : OUT STD_LOGIC;
    event_s_input_tlast_unexpected : OUT STD_LOGIC
  );
END rs_encoder_0;

ARCHITECTURE rs_encoder_0_arch OF rs_encoder_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF rs_encoder_0_arch: ARCHITECTURE IS "yes";
  COMPONENT rs_encoder_v9_0_11 IS
    GENERIC (
      C_HAS_ACLKEN : INTEGER;
      C_HAS_ARESETN : INTEGER;
      C_HAS_S_AXIS_CTRL : INTEGER;
      C_HAS_S_AXIS_INPUT_TUSER : INTEGER;
      C_HAS_M_AXIS_OUTPUT_TUSER : INTEGER;
      C_HAS_M_AXIS_OUTPUT_TREADY : INTEGER;
      C_S_AXIS_INPUT_TDATA_WIDTH : INTEGER;
      C_S_AXIS_INPUT_TUSER_WIDTH : INTEGER;
      C_S_AXIS_CTRL_TDATA_WIDTH : INTEGER;
      C_M_AXIS_OUTPUT_TDATA_WIDTH : INTEGER;
      C_M_AXIS_OUTPUT_TUSER_WIDTH : INTEGER;
      C_HAS_INFO : INTEGER;
      C_HAS_N_IN : INTEGER;
      C_HAS_R_IN : INTEGER;
      C_GEN_START : INTEGER;
      C_H : INTEGER;
      C_K : INTEGER;
      C_N : INTEGER;
      C_POLYNOMIAL : INTEGER;
      C_SPEC : INTEGER;
      C_SYMBOL_WIDTH : INTEGER;
      C_GEN_POLY_TYPE : INTEGER;
      C_NUM_CHANNELS : INTEGER;
      C_MEMSTYLE : INTEGER;
      C_OPTIMIZATION : INTEGER;
      C_MEM_INIT_PREFIX : STRING;
      C_ELABORATION_DIR : STRING;
      C_XDEVICEFAMILY : STRING;
      C_FAMILY : STRING
    );
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_input_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axis_input_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axis_input_tvalid : IN STD_LOGIC;
      s_axis_input_tready : OUT STD_LOGIC;
      s_axis_input_tlast : IN STD_LOGIC;
      s_axis_ctrl_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axis_ctrl_tvalid : IN STD_LOGIC;
      s_axis_ctrl_tready : OUT STD_LOGIC;
      m_axis_output_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axis_output_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axis_output_tvalid : OUT STD_LOGIC;
      m_axis_output_tready : IN STD_LOGIC;
      m_axis_output_tlast : OUT STD_LOGIC;
      event_s_input_tlast_missing : OUT STD_LOGIC;
      event_s_input_tlast_unexpected : OUT STD_LOGIC;
      event_s_ctrl_tdata_invalid : OUT STD_LOGIC
    );
  END COMPONENT rs_encoder_v9_0_11;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF rs_encoder_0_arch: ARCHITECTURE IS "rs_encoder_v9_0_11,Vivado 2016.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF rs_encoder_0_arch : ARCHITECTURE IS "rs_encoder_0,rs_encoder_v9_0_11,{rs_encoder=bought}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF rs_encoder_0_arch: ARCHITECTURE IS "rs_encoder_0,rs_encoder_v9_0_11,{x_ipProduct=Vivado 2016.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=rs_encoder,x_ipVersion=9.0,x_ipCoreRevision=11,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,x_ipLicense=rs_encoder@2013.03(bought),C_HAS_ACLKEN=0,C_HAS_ARESETN=1,C_HAS_S_AXIS_CTRL=0,C_HAS_S_AXIS_INPUT_TUSER=0,C_HAS_M_AXIS_OUTPUT_TUSER=0,C_HAS_M_AXIS_OUTPUT_TREADY=0,C_S_AXIS_INPUT_TDATA_WIDTH=8,C_S_AXIS_INPUT_TUSER_WIDTH=1,C_S_AXIS_CTRL_TDATA_WIDTH=8,C_M_AXIS_OUTPUT_TDATA_WIDTH=8,C_M_AXIS_OUTPUT" & 
"_TUSER_WIDTH=1,C_HAS_INFO=0,C_HAS_N_IN=0,C_HAS_R_IN=0,C_GEN_START=120,C_H=1,C_K=192,C_N=208,C_POLYNOMIAL=391,C_SPEC=0,C_SYMBOL_WIDTH=8,C_GEN_POLY_TYPE=0,C_NUM_CHANNELS=1,C_MEMSTYLE=2,C_OPTIMIZATION=2,C_MEM_INIT_PREFIX=rs_encoder_0,C_ELABORATION_DIR=./,C_XDEVICEFAMILY=kintex7,C_FAMILY=kintex7}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 aclk_intf CLK";
  ATTRIBUTE X_INTERFACE_INFO OF aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 aresetn_intf RST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_input_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_INPUT TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_input_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_INPUT TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_input_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_INPUT TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_input_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_INPUT TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_output_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_OUTPUT TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_output_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_OUTPUT TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_output_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_OUTPUT TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF event_s_input_tlast_missing: SIGNAL IS "xilinx.com:signal:interrupt:1.0 event_s_input_tlast_missing_intf INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF event_s_input_tlast_unexpected: SIGNAL IS "xilinx.com:signal:interrupt:1.0 event_s_input_tlast_unexpected_intf INTERRUPT";
BEGIN
  U0 : rs_encoder_v9_0_11
    GENERIC MAP (
      C_HAS_ACLKEN => 0,
      C_HAS_ARESETN => 1,
      C_HAS_S_AXIS_CTRL => 0,
      C_HAS_S_AXIS_INPUT_TUSER => 0,
      C_HAS_M_AXIS_OUTPUT_TUSER => 0,
      C_HAS_M_AXIS_OUTPUT_TREADY => 0,
      C_S_AXIS_INPUT_TDATA_WIDTH => 8,
      C_S_AXIS_INPUT_TUSER_WIDTH => 1,
      C_S_AXIS_CTRL_TDATA_WIDTH => 8,
      C_M_AXIS_OUTPUT_TDATA_WIDTH => 8,
      C_M_AXIS_OUTPUT_TUSER_WIDTH => 1,
      C_HAS_INFO => 0,
      C_HAS_N_IN => 0,
      C_HAS_R_IN => 0,
      C_GEN_START => 120,
      C_H => 1,
      C_K => 192,
      C_N => 208,
      C_POLYNOMIAL => 391,
      C_SPEC => 0,
      C_SYMBOL_WIDTH => 8,
      C_GEN_POLY_TYPE => 0,
      C_NUM_CHANNELS => 1,
      C_MEMSTYLE => 2,
      C_OPTIMIZATION => 2,
      C_MEM_INIT_PREFIX => "rs_encoder_0",
      C_ELABORATION_DIR => "./",
      C_XDEVICEFAMILY => "kintex7",
      C_FAMILY => "kintex7"
    )
    PORT MAP (
      aclk => aclk,
      aclken => '1',
      aresetn => aresetn,
      s_axis_input_tdata => s_axis_input_tdata,
      s_axis_input_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_input_tvalid => s_axis_input_tvalid,
      s_axis_input_tready => s_axis_input_tready,
      s_axis_input_tlast => s_axis_input_tlast,
      s_axis_ctrl_tdata => STD_LOGIC_VECTOR(TO_UNSIGNED(1, 8)),
      s_axis_ctrl_tvalid => '0',
      m_axis_output_tdata => m_axis_output_tdata,
      m_axis_output_tvalid => m_axis_output_tvalid,
      m_axis_output_tready => '1',
      m_axis_output_tlast => m_axis_output_tlast,
      event_s_input_tlast_missing => event_s_input_tlast_missing,
      event_s_input_tlast_unexpected => event_s_input_tlast_unexpected
    );
END rs_encoder_0_arch;
