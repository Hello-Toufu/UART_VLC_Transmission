-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/xbip_dsp48_wrapper_v3_0_4/hdl/bip_dsp48_wrapper_v3_0_pkg.vhd,v 1.2 2010/10/07 16:41:40 andreww Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2008,2010 Xilinx, Inc. All rights reserved.
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

-------------------------------------------------------------------------------
-- Designer note!!
-- This file is for the top level component declaration and any types and functions
-- which calling cores may require. Internal functions, types and component declarations
-- should be in the dsp48_wrapper_hdl_pkg file.
-------------------------------------------------------------------------------

package xbip_dsp48_wrapper_v3_0_4_pkg is

  --core_if on component xbip_dsp48_wrapper
  component xbip_dsp48_wrapper_v3_0_4
    generic (
      AREG            : integer := 0;
      BREG            : integer := 0;
      MREG            : integer := 0;
      CREG            : integer := 0;
      PREG            : integer := 0;
      CARRYINREG      : integer := 0;
      CARRYINSELREG   : integer := 0;
      OPMODEREG       : integer := 0;
      SUBTRACTREG     : integer := 0;
      B_INPUT         : integer := 0;   -- 0 = direct, 1 = cascade
      USE_MULT : boolean := false;
      HAS_GLOBAL_CE : boolean := true;
      HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK       : in  std_logic                     := '1';
    CE        : in  std_logic                     := '1';
    SCLR      : in  std_logic                     := '0';
    PCIN      : in  std_logic_vector(47 downto 0) := (others => '0');
    BCIN      : in  std_logic_vector(17 downto 0) := (others => '0');
    A         : in  std_logic_vector(17 downto 0) := (others => '0');
    B         : in  std_logic_vector(17 downto 0) := (others => '0');
    C         : in  std_logic_vector(47 downto 0) := (others => '0');
    OPMODE    : in  std_logic_vector( 6 downto 0) := (others => '0');
    CARRYIN   : in  std_logic                     := '0';
    SUBTRACT  : in  std_logic                     := '0';
    CARRYINSEL: in  std_logic_vector( 1 downto 0) := (others => '0');
    BCOUT     : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT     : out std_logic_vector(47 downto 0) := (others => '0');
    P         : out std_logic_vector(47 downto 0) := (others => '0');

    CEA         : in std_logic := '1';
    CEB         : in std_logic := '1';
    CEC         : in std_logic := '1';
    CECARRYIN   : in std_logic := '1';
    CECINSUB    : in std_logic := '1';
    CECTRL      : in std_logic := '1';
    CEM         : in std_logic := '1';
    CEP         : in std_logic := '1';
    SCLRA       : in std_logic := '0';
    SCLRB       : in std_logic := '0';
    SCLRC       : in std_logic := '0';
    SCLRCARRYIN : in std_logic := '0';
    SCLRCTRL    : in std_logic := '0';
    SCLRM       : in std_logic := '0';
    SCLRP       : in std_logic := '0'
    );
    --core_if off
  end component xbip_dsp48_wrapper_v3_0_4;

  component xbip_dsp48e_wrapper_v3_0 is
    generic (
      --application-specific generics
      AREG           : integer := 0;
      BREG           : integer := 0;
      MREG           : integer := 0;
      CREG           : integer := 0;
      PREG           : integer := 0;
      ACASCREG       : integer := 0;
      BCASCREG       : integer := 0;
      CARRYINREG     : integer := 0;
      CARRYINSELREG  : integer := 0;
      MULTCARRYINREG : integer := 0;
      OPMODEREG      : integer := 0;
      ALUMODEREG     : integer := 0;
      A_INPUT        : integer := 0;    --0 = direct, 1 = cascade
      B_INPUT        : integer := 0;    --0 = direct, 1 = cascade
      USE_MULT       : boolean := false;
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK          : in  std_logic                     := '1';
    CE           : in  std_logic                     := '1';
    SCLR         : in  std_logic                     := '0';
    PCIN         : in  std_logic_vector(47 downto 0) := (others => '0');
    ACIN         : in  std_logic_vector(29 downto 0) := (others => '0');
    BCIN         : in  std_logic_vector(17 downto 0) := (others => '0');
    A            : in  std_logic_vector(29 downto 0) := (others => '0');
    B            : in  std_logic_vector(17 downto 0) := (others => '0');
    C            : in  std_logic_vector(47 downto 0) := (others => '0');
    OPMODE       : in  std_logic_vector(6 downto 0)  := (others => '0');
    ALUMODE      : in  std_logic_vector(3 downto 0)  := (others => '0');
    MULTSIGNIN   : in  std_logic                     := '0';
    MULTSIGNOUT  : out std_logic                     := '0';
    CARRYIN      : in  std_logic                     := '0';
    CARRYOUT     : out std_logic                     := '0';
    CARRYCASCIN  : in  std_logic                     := '0';
    CARRYCASCOUT : out std_logic                     := '0';
    CARRYINSEL   : in  std_logic_vector(2 downto 0)  := (others => '0');
    ACOUT        : out std_logic_vector(29 downto 0) := (others => '0');
    BCOUT        : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT        : out std_logic_vector(47 downto 0) := (others => '0');
    P            : out std_logic_vector(47 downto 0) := (others => '0');

    CEA1          : std_logic := '1';
    CEA2          : std_logic := '1';
    CEB1          : std_logic := '1';
    CEB2          : std_logic := '1';
    CEC           : std_logic := '1';
    CECARRYIN     : std_logic := '1';
    CECTRL        : std_logic := '1';
    CEALUMODE     : std_logic := '1';
    CEMULTCARRYIN : std_logic := '1';
    CEM           : std_logic := '1';
    CEP           : std_logic := '1';
    SCLRA         : std_logic := '0';
    SCLRB         : std_logic := '0';
    SCLRC         : std_logic := '0';
    SCLRALLCARRYIN: std_logic := '0';
    SCLRCTRL      : std_logic := '0';
    SCLRALUMODE   : std_logic := '0';
    SCLRM         : std_logic := '0';
    SCLRP         : std_logic := '0'
    );
  end component xbip_dsp48e_wrapper_v3_0;

  component xbip_dsp48a_wrapper_v3_0 is
    generic (
      --application-specific generics
      A0REG      : integer := 0;
      A1REG      : integer := 0;
      B0REG      : integer := 0;
      B1REG      : integer := 0;
      CREG       : integer := 0;
      DREG       : integer := 0;
      MREG       : integer := 0;
      PREG       : integer := 0;
      CARRYINREG : integer := 0;
      CARRYINSEL : integer := 0;        --0 = opmode5, 1 = cascaded CARRYIN
      OPMODEREG  : integer := 0;
      RSTTYPE    : integer := 0;         -- 0 = sync, 1 = async
      HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK        : in  std_logic                     := '1';
    CE         : in  std_logic                     := '1';
    SCLR       : in  std_logic                     := '0';
    PCIN       : in  std_logic_vector(47 downto 0) := (others => '0');
    A          : in  std_logic_vector(17 downto 0) := (others => '0');
    B          : in  std_logic_vector(17 downto 0) := (others => '0');
    C          : in  std_logic_vector(47 downto 0) := (others => '0');
    D          : in  std_logic_vector(17 downto 0) := (others => '0');
    OPMODE     : in  std_logic_vector(7 downto 0)  := (others => '0');
    CARRYIN    : in  std_logic                     := '0';
    CARRYOUT   : out std_logic                     := '0';
    BCOUT      : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT      : out std_logic_vector(47 downto 0) := (others => '0');
    P          : out std_logic_vector(47 downto 0) := (others => '0');

    CEA         : in std_logic := '1';
    CEB         : in std_logic := '1';
    CEC         : in std_logic := '1';
    CED         : in std_logic := '1';
    CECARRYIN   : in std_logic := '1';
    CEOPMODE    : in std_logic := '1';
    CEM         : in std_logic := '1';
    CEP         : in std_logic := '1';
    SCLRA       : in std_logic := '0';
    SCLRB       : in std_logic := '0';
    SCLRC       : in std_logic := '0';
    SCLRD       : in std_logic := '0';
    SCLRCARRYIN : in std_logic := '0';
    SCLROPMODE  : in std_logic := '0';
    SCLRM       : in std_logic := '0';
    SCLRP       : in std_logic := '0'
    );
  end component xbip_dsp48a_wrapper_v3_0;


  component xbip_dsp48e1_wrapper_v3_0 is
    generic (
      --application-specific generics
      AREG           : integer := 0;
      BREG           : integer := 0;
      MREG           : integer := 0;
      CREG           : integer := 0;
      DREG           : integer := 0;
      ADREG          : integer := 0;
      PREG           : integer := 0;
      ACASCREG       : integer := 0;
      BCASCREG       : integer := 0;
      CARRYINREG     : integer := 0;
      CARRYINSELREG  : integer := 0;
      INMODEREG      : integer := 0;
      OPMODEREG      : integer := 0;
      ALUMODEREG     : integer := 0;
      A_INPUT        : integer := 0;    --0 = direct, 1 = cascade
      B_INPUT        : integer := 0;    --0 = direct, 1 = cascade
      USE_MULT       : string  := "NONE"; --MULTIPLY, DYNAMIC or NONE
      USE_DPORT      : boolean := true;
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK          : in  std_logic                     := '1';
    CE           : in  std_logic                     := '1';
    SCLR         : in  std_logic                     := '0';
    PCIN         : in  std_logic_vector(47 downto 0) := (others => '0');
    ACIN         : in  std_logic_vector(29 downto 0) := (others => '0');
    BCIN         : in  std_logic_vector(17 downto 0) := (others => '0');
    A            : in  std_logic_vector(29 downto 0) := (others => '0');
    B            : in  std_logic_vector(17 downto 0) := (others => '0');
    C            : in  std_logic_vector(47 downto 0) := (others => '0');
    D            : in  std_logic_vector(24 downto 0) := (others => '0');
    OPMODE       : in  std_logic_vector(6 downto 0)  := (others => '0');
    ALUMODE      : in  std_logic_vector(3 downto 0)  := (others => '0');
    INMODE       : in  std_logic_vector(4 downto 0)  := (others => '0');
    MULTSIGNIN   : in  std_logic                     := '0';
    MULTSIGNOUT  : out std_logic                     := '0';
    CARRYIN      : in  std_logic                     := '0';
    CARRYOUT     : out std_logic                     := '0';
    CARRYCASCIN  : in  std_logic                     := '0';
    CARRYCASCOUT : out std_logic                     := '0';
    CARRYINSEL   : in  std_logic_vector(2 downto 0)  := (others => '0');
    ACOUT        : out std_logic_vector(29 downto 0) := (others => '0');
    BCOUT        : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT        : out std_logic_vector(47 downto 0) := (others => '0');
    P            : out std_logic_vector(47 downto 0) := (others => '0');

    CEA1          : std_logic := '1';
    CEA2          : std_logic := '1';
    CEB1          : std_logic := '1';
    CEB2          : std_logic := '1';
    CEAD          : std_logic := '1';
    CED           : std_logic := '1';
    CEC           : std_logic := '1';
    CECARRYIN     : std_logic := '1';
    CECTRL        : std_logic := '1';
    CEALUMODE     : std_logic := '1';
    CEINMODE      : std_logic := '1';
    CEM           : std_logic := '1';
    CEP           : std_logic := '1';
    SCLRA         : std_logic := '0';
    SCLRB         : std_logic := '0';
    SCLRC         : std_logic := '0';
    SCLRD         : std_logic := '0';
    SCLRALLCARRYIN: std_logic := '0';
    SCLRCTRL      : std_logic := '0';
    SCLRALUMODE   : std_logic := '0';
    SCLRINMODE    : std_logic := '0';
    SCLRM         : std_logic := '0';
    SCLRP         : std_logic := '0'
    );
  end component xbip_dsp48e1_wrapper_v3_0;

  component xbip_dsp48a1_wrapper_v3_0 is
    generic (
      --application-specific generics
      A0REG       : integer := 0;
      A1REG       : integer := 0;
      B0REG       : integer := 0;
      B1REG       : integer := 0;
      CREG        : integer := 0;
      DREG        : integer := 0;
      MREG        : integer := 0;
      PREG        : integer := 0;
      CARRYINREG  : integer := 0;
      CARRYOUTREG : integer := 0;
      CARRYINSEL  : integer := 0;        --0 = opmode5, 1 = cascaded CARRYIN
      OPMODEREG   : integer := 0;
      RSTTYPE     : integer := 0;         -- 0 = sync, 1 = async
      HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK        : in  std_logic                     := '1';
    CE         : in  std_logic                     := '1';
    SCLR       : in  std_logic                     := '0';
    PCIN       : in  std_logic_vector(47 downto 0) := (others => '0');
    A          : in  std_logic_vector(17 downto 0) := (others => '0');
    B          : in  std_logic_vector(17 downto 0) := (others => '0');
    C          : in  std_logic_vector(47 downto 0) := (others => '0');
    D          : in  std_logic_vector(17 downto 0) := (others => '0');
    OPMODE     : in  std_logic_vector(7 downto 0)  := (others => '0');
    CARRYIN    : in  std_logic                     := '0';
    CARRYOUT   : out std_logic                     := '0';
    CARRYOUTF  : out std_logic                     := '0';
    BCOUT      : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT      : out std_logic_vector(47 downto 0) := (others => '0');
    P          : out std_logic_vector(47 downto 0) := (others => '0');

    CEA         : in std_logic := '1';
    CEB         : in std_logic := '1';
    CEC         : in std_logic := '1';
    CED         : in std_logic := '1';
    CECARRYIN   : in std_logic := '1';
    CEOPMODE    : in std_logic := '1';
    CEM         : in std_logic := '1';
    CEP         : in std_logic := '1';
    SCLRA       : in std_logic := '0';
    SCLRB       : in std_logic := '0';
    SCLRC       : in std_logic := '0';
    SCLRD       : in std_logic := '0';
    SCLRCARRYIN : in std_logic := '0';
    SCLROPMODE  : in std_logic := '0';
    SCLRM       : in std_logic := '0';
    SCLRP       : in std_logic := '0'
    );
  end component xbip_dsp48a1_wrapper_v3_0;


end package xbip_dsp48_wrapper_v3_0_4_pkg;

package body xbip_dsp48_wrapper_v3_0_4_pkg is

end package body xbip_dsp48_wrapper_v3_0_4_pkg;


-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48a_wrapper_v3_0.vhd,v 1.2 2010/10/07 16:41:40 andreww Exp $
--
--  (c) Copyright 2008,2010 Xilinx, Inc. All rights reserved.
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

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Note: this entity declaration is used as the template of the core's interface
-- by the core_if_bip.pl script. Hence, if you have to alter the interface, alter
-- it here and then run core_if_bip.pl (ensure all files to be altered are writeable)
-------------------------------------------------------------------------------
entity xbip_dsp48a_wrapper_v3_0 is
  generic (
    --application-specific generics
    A0REG      : integer := 0;
    A1REG      : integer := 0;
    B0REG      : integer := 0;
    B1REG      : integer := 0;
    CREG       : integer := 0;
    DREG       : integer := 0;
    MREG       : integer := 0;
    PREG       : integer := 0;
    CARRYINREG : integer := 0;
    CARRYINSEL : integer := 0;          --0 = opmode5, 1 = cascaded CARRYIN
    OPMODEREG  : integer := 0;
    RSTTYPE    : integer := 0;           -- 0 = sync, 1 = async
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK        : in  std_logic                     := '1';
    CE         : in  std_logic                     := '1';
    SCLR       : in  std_logic                     := '0';
    PCIN       : in  std_logic_vector(47 downto 0) := (others => '0');
    A          : in  std_logic_vector(17 downto 0) := (others => '0');
    B          : in  std_logic_vector(17 downto 0) := (others => '0');
    C          : in  std_logic_vector(47 downto 0) := (others => '0');
    D          : in  std_logic_vector(17 downto 0) := (others => '0');
    OPMODE     : in  std_logic_vector(7 downto 0)  := (others => '0');
    CARRYIN    : in  std_logic                     := '0';
    CARRYOUT   : out std_logic                     := '0';
    BCOUT      : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT      : out std_logic_vector(47 downto 0) := (others => '0');
    P          : out std_logic_vector(47 downto 0) := (others => '0');

    CEA         : in std_logic := '1';
    CEB         : in std_logic := '1';
    CEC         : in std_logic := '1';
    CED         : in std_logic := '1';
    CECARRYIN   : in std_logic := '1';
    CEOPMODE    : in std_logic := '1';
    CEM         : in std_logic := '1';
    CEP         : in std_logic := '1';
    SCLRA       : in std_logic := '0';
    SCLRB       : in std_logic := '0';
    SCLRC       : in std_logic := '0';
    SCLRD       : in std_logic := '0';
    SCLRCARRYIN : in std_logic := '0';
    SCLROPMODE  : in std_logic := '0';
    SCLRM       : in std_logic := '0';
    SCLRP       : in std_logic := '0'
    );
end xbip_dsp48a_wrapper_v3_0;



architecture synth of xbip_dsp48a_wrapper_v3_0 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: validity checking on parameter values
  function fn_check_generics(
    --application-specific generics
    pA0REG      : integer := 0;
    pA1REG      : integer := 0;
    pB0REG      : integer := 0;
    pB1REG      : integer := 0;
    pMREG       : integer := 0;
    pCREG       : integer := 0;
    pDREG       : integer := 0;
    pPREG       : integer := 0;
    pCARRYINREG : integer := 0;
    pCARRYINSEL : integer := 0;
    pOPMODEREG  : integer := 0
    )
    return integer is

  begin  -- check_generics
    assert pA0REG = 0 or pA0REG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: A0REG out of range 0 to 1."
      severity error;
    assert pA1REG = 0 or pA1REG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: A1REG out of range 0 to 1."
      severity error;
    assert pB0REG = 0 or pB0REG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: B0REG out of range 0 to 1."
      severity error;
    assert pB1REG = 0 or pB1REG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: B1REG out of range 0 to 1."
      severity error;
    assert pCREG = 0 or pCREG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: CREG out of range 0 to 1."
      severity error;
    assert pDREG = 0 or pDREG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: DREG out of range 0 to 1."
      severity error;
    assert pMREG = 0 or pMREG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: MREG out of range 0 to 1."
      severity error;
    assert pPREG = 0 or pPREG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: PREG out of range 0 to 1."
      severity error;
    assert pCARRYINREG = 0 or pCARRYINREG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: CARRYINREG out of range 0 to 1."
      severity error;
    assert pCARRYINSEL = 0 or pCARRYINSEL = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: CARRYINSEL out of range 0 to 1."
      severity error;
    assert pOPMODEREG = 0 or pOPMODEREG = 1
      report "ERROR: xbip_dsp48a_wrapper_v3_0: OPMODEREG out of range 0 to 1."
      severity error;
    return 0;  --must return a value or modelsim complains.
  end fn_check_generics;
  constant check_generics : integer := fn_check_generics(
    pA0REG      => A0REG,
    pA1REG      => A1REG,
    pB0REG      => B0REG,
    pB1REG      => B1REG,
    pMREG       => MREG,
    pCREG       => CREG,
    pDREG       => DREG,
    pPREG       => PREG,
    pCARRYINREG => CARRYINREG,
    pCARRYINSEL => CARRYINSEL,
    pOPMODEREG  => OPMODEREG
    );

  function fn_resolve_carryinsel (
    p_carryinsel : integer)
    return string is
  begin  -- fn_resolve_carryinsel
    if p_carryinsel = 0 then
      return "OPMODE5";
    else
      return "CARRYIN";
    end if;
  end fn_resolve_carryinsel;
  constant ci_carryinsel : string := fn_resolve_carryinsel(p_carryinsel => CARRYINSEL);

  signal cea_i : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb_i : std_logic := '0';
  signal cec_i : std_logic := '0';
  signal ced_i : std_logic := '0';
  signal cem_i : std_logic := '0';
  signal cep_i : std_logic := '0';
  signal cecarryin_i : std_logic := '0';
  signal ceopmode_i : std_logic := '0';
  signal carryin_i : std_logic := '0';

  signal rsta_i : std_logic := '0';      -- defaults to 0 for power saving
  signal rstb_i : std_logic := '0';
  signal rstc_i : std_logic := '0';
  signal rstd_i : std_logic := '0';
  signal rstm_i : std_logic := '0';
  signal rstp_i : std_logic := '0';
  signal rstcarryin_i : std_logic := '0';
  signal rstopmode_i : std_logic := '0';


begin

  opt_a: if A0REG /=0 or A1REG /= 0 generate
    cea_i  <= CE when HAS_GLOBAL_CE else CEA;
    rsta_i <= SCLR when HAS_GLOBAL_SCLR else SCLRA;
  end generate opt_a;

  opt_b: if B0REG /=0 or B1REG /=0 generate
    ceb_i  <= CE when HAS_GLOBAL_CE else CEB;
    rstb_i <= SCLR when HAS_GLOBAL_SCLR else SCLRB;
  end generate opt_b;

  opt_c: if CREG /=0 generate
    cec_i  <= CE when HAS_GLOBAL_CE else CEC;
    rstc_i <= SCLR when HAS_GLOBAL_SCLR else SCLRC;
  end generate opt_c;

  opt_d: if DREG /=0 generate
    ced_i  <= CE when HAS_GLOBAL_CE else CED;
    rstd_i <= SCLR when HAS_GLOBAL_SCLR else SCLRD;
  end generate opt_d;

  opt_m: if MREG /=0 generate
    cem_i  <= CE when HAS_GLOBAL_CE else CEM;
    rstm_i <= SCLR when HAS_GLOBAL_SCLR else SCLRM;
  end generate opt_m;

  opt_p: if PREG /=0 generate
    cep_i  <= CE when HAS_GLOBAL_CE else CEP;
    rstp_i <= SCLR when HAS_GLOBAL_SCLR else SCLRP;
  end generate opt_p;

  opt_cin: if CARRYINREG /=0 generate
    cecarryin_i  <= CE when HAS_GLOBAL_CE else CECARRYIN;
    rstcarryin_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCARRYIN;
  end generate opt_cin;

  opt_opmode: if OPMODEREG /=0 generate
    ceopmode_i  <= CE when HAS_GLOBAL_CE else CEOPMODE;
    rstopmode_i <= SCLR when HAS_GLOBAL_SCLR else SCLROPMODE;
  end generate opt_opmode;

  opt_carryin: if CARRYINSEL /= 0 generate
    -- tie-off to avoid getting (in map):
    --WARNING:PhysDesignRules:1617 - DSP48A block
    --<instance name> has an active signal for the CARRYIN
    --pin but the attribute CARRYINSEL is not set to CARRYIN. The CARRYINSEL
    --attribute must be changed to CARRYIN or connect the CARRYIN pin to a ground source
    carryin_i <= CARRYIN;
  end generate opt_carryin;

  i_primitive : DSP48A
    generic map(
      A0REG      => A0REG,
      A1REG      => A1REG,
      B0REG      => B0REG,
      B1REG      => B1REG,
      CREG       => CREG,
      DREG       => DREG,
      MREG       => MREG,
      PREG       => PREG,
      CARRYINREG => CARRYINREG,
      CARRYINSEL => ci_carryinsel,
      OPMODEREG  => OPMODEREG
      )
    port map(
      P          => P,
      PCOUT      => PCOUT,
      A          => A,
      B          => B,
      BCOUT      => BCOUT,
      C          => C,
      D          => D,
      CARRYIN    => carryin_i,
      CARRYOUT   => CARRYOUT,
      CEA        => cea_i,
      CEB        => ceb_i,
      CEC        => cec_i,
      CED        => ced_i,
      CECARRYIN  => cecarryin_i,
      CEOPMODE   => ceopmode_i,
      CEM        => cem_i,
      CEP        => cep_i,
      CLK        => CLK,
      OPMODE     => OPMODE,
      PCIN       => PCIN,
      RSTA       => rsta_i,
      RSTB       => rstb_i,
      RSTC       => rstc_i,
      RSTD       => rstd_i,
      RSTCARRYIN => rstcarryin_i,
      RSTOPMODE  => rstopmode_i,
      RSTM       => rstm_i,
      RSTP       => rstp_i
      );

end synth;



-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48a1_wrapper_v3_0.vhd,v 1.2 2010/10/07 16:41:40 andreww Exp $
--
--  (c) Copyright 2008,2010 Xilinx, Inc. All rights reserved.
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

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Note: this entity declaration is used as the template of the core's interface
-- by the core_if_bip.pl script. Hence, if you have to alter the interface, alter
-- it here and then run core_if_bip.pl (ensure all files to be altered are writeable)
-------------------------------------------------------------------------------
entity xbip_dsp48a1_wrapper_v3_0 is
  generic (
    --application-specific generics
    A0REG      : integer := 0;
    A1REG      : integer := 0;
    B0REG      : integer := 0;
    B1REG      : integer := 0;
    CREG       : integer := 0;
    DREG       : integer := 0;
    MREG       : integer := 0;
    PREG       : integer := 0;
    CARRYINREG : integer := 0;
    CARRYINSEL : integer := 0;          --0 = opmode5, 1 = cascaded CARRYIN
    CARRYOUTREG: integer := 0;
    OPMODEREG  : integer := 0;
    RSTTYPE    : integer := 0;           -- 0 = sync, 1 = async;
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK        : in  std_logic                     := '1';
    CE         : in  std_logic                     := '1';
    SCLR       : in  std_logic                     := '0';
    PCIN       : in  std_logic_vector(47 downto 0) := (others => '0');
    A          : in  std_logic_vector(17 downto 0) := (others => '0');
    B          : in  std_logic_vector(17 downto 0) := (others => '0');
    C          : in  std_logic_vector(47 downto 0) := (others => '0');
    D          : in  std_logic_vector(17 downto 0) := (others => '0');
    OPMODE     : in  std_logic_vector(7 downto 0)  := (others => '0');
    CARRYIN    : in  std_logic                     := '0';
    CARRYOUT   : out std_logic                     := '0';
    CARRYOUTF  : out std_logic                     := '0';
    BCOUT      : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT      : out std_logic_vector(47 downto 0) := (others => '0');
    P          : out std_logic_vector(47 downto 0) := (others => '0');

    CEA         : in std_logic := '1';
    CEB         : in std_logic := '1';
    CEC         : in std_logic := '1';
    CED         : in std_logic := '1';
    CECARRYIN   : in std_logic := '1';
    CEOPMODE    : in std_logic := '1';
    CEM         : in std_logic := '1';
    CEP         : in std_logic := '1';
    SCLRA       : in std_logic := '0';
    SCLRB       : in std_logic := '0';
    SCLRC       : in std_logic := '0';
    SCLRD       : in std_logic := '0';
    SCLRCARRYIN : in std_logic := '0';
    SCLROPMODE  : in std_logic := '0';
    SCLRM       : in std_logic := '0';
    SCLRP       : in std_logic := '0'
    );
end xbip_dsp48a1_wrapper_v3_0;



architecture synth of xbip_dsp48a1_wrapper_v3_0 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: validity checking on parameter values
  function fn_check_generics(
    --application-specific generics
    pA0REG       : integer := 0;
    pA1REG       : integer := 0;
    pB0REG       : integer := 0;
    pB1REG       : integer := 0;
    pMREG        : integer := 0;
    pCREG        : integer := 0;
    pDREG        : integer := 0;
    pPREG        : integer := 0;
    pCARRYINREG  : integer := 0;
    pCARRYOUTREG : integer := 0;
    pCARRYINSEL  : integer := 0;
    pOPMODEREG   : integer := 0
    )
    return integer is

  begin  -- check_generics
    assert pA0REG = 0 or pA0REG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: A0REG out of range 0 to 1."
      severity error;
    assert pA1REG = 0 or pA1REG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: A1REG out of range 0 to 1."
      severity error;
    assert pB0REG = 0 or pB0REG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: B0REG out of range 0 to 1."
      severity error;
    assert pB1REG = 0 or pB1REG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: B1REG out of range 0 to 1."
      severity error;
    assert pCREG = 0 or pCREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: CREG out of range 0 to 1."
      severity error;
    assert pDREG = 0 or pDREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: DREG out of range 0 to 1."
      severity error;
    assert pMREG = 0 or pMREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: MREG out of range 0 to 1."
      severity error;
    assert pPREG = 0 or pPREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: PREG out of range 0 to 1."
      severity error;
    assert pCARRYINREG = 0 or pCARRYINREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: CARRYINREG out of range 0 to 1."
      severity error;
    assert pCARRYOUTREG = 0 or pCARRYOUTREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: CARRYOUTREG out of range 0 to 1."
      severity error;
    assert pCARRYINSEL = 0 or pCARRYINSEL = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: CARRYINSEL out of range 0 to 1."
      severity error;
    assert pOPMODEREG = 0 or pOPMODEREG = 1
      report "ERROR: xbip_dsp48a1_wrapper_v3_0: OPMODEREG out of range 0 to 1."
      severity error;
    return 0;  --must return a value or modelsim complains.
  end fn_check_generics;
  constant check_generics : integer := fn_check_generics(
    pA0REG       => A0REG,
    pA1REG       => A1REG,
    pB0REG       => B0REG,
    pB1REG       => B1REG,
    pMREG        => MREG,
    pCREG        => CREG,
    pDREG        => DREG,
    pPREG        => PREG,
    pCARRYINREG  => CARRYINREG,
    pCARRYOUTREG => CARRYOUTREG,
    pCARRYINSEL  => CARRYINSEL,
    pOPMODEREG   => OPMODEREG
    );

  function fn_resolve_carryinsel (
    p_carryinsel : integer)
    return string is
  begin  -- fn_resolve_carryinsel
    if p_carryinsel = 0 then
      return "OPMODE5";
    else
      return "CARRYIN";
    end if;
  end fn_resolve_carryinsel;
  constant ci_carryinsel : string := fn_resolve_carryinsel(p_carryinsel => CARRYINSEL);

  signal cea_i : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb_i : std_logic := '0';
  signal cec_i : std_logic := '0';
  signal ced_i : std_logic := '0';
  signal cem_i : std_logic := '0';
  signal cep_i : std_logic := '0';
  signal cecarryin_i : std_logic := '0';
  signal ceopmode_i : std_logic := '0';
  signal carryin_i : std_logic := '0';

  signal rsta_i : std_logic := '0';      -- defaults to 0 for power saving
  signal rstb_i : std_logic := '0';
  signal rstc_i : std_logic := '0';
  signal rstd_i : std_logic := '0';
  signal rstm_i : std_logic := '0';
  signal rstp_i : std_logic := '0';
  signal rstcarryin_i : std_logic := '0';
  signal rstopmode_i : std_logic := '0';


begin

  opt_a: if A0REG /=0 or A1REG /= 0 generate
    cea_i  <= CE when HAS_GLOBAL_CE else CEA;
    rsta_i <= SCLR when HAS_GLOBAL_SCLR else SCLRA;
  end generate opt_a;

  opt_b: if B0REG /=0 or B1REG /=0 generate
    ceb_i  <= CE when HAS_GLOBAL_CE else CEB;
    rstb_i <= SCLR when HAS_GLOBAL_SCLR else SCLRB;
  end generate opt_b;

  opt_c: if CREG /=0 generate
    cec_i  <= CE when HAS_GLOBAL_CE else CEC;
    rstc_i <= SCLR when HAS_GLOBAL_SCLR else SCLRC;
  end generate opt_c;

  opt_d: if DREG /=0 generate
    ced_i  <= CE when HAS_GLOBAL_CE else CED;
    rstd_i <= SCLR when HAS_GLOBAL_SCLR else SCLRD;
  end generate opt_d;

  opt_m: if MREG /=0 generate
    cem_i  <= CE when HAS_GLOBAL_CE else CEM;
    rstm_i <= SCLR when HAS_GLOBAL_SCLR else SCLRM;
  end generate opt_m;

  opt_p: if PREG /=0 or CARRYOUTREG /=0 generate
    cep_i  <= CE when HAS_GLOBAL_CE else CEP;
    rstp_i <= SCLR when HAS_GLOBAL_SCLR else SCLRP;
  end generate opt_p;

  opt_cin: if CARRYINREG /=0 or CARRYOUTREG /=0 generate
    -- The DSP48A1 primitive (unisim at least) uses the CECARRYIN for the CARRYOUTREG so need to connect CE and RST when
    -- CARRYOUTREG=1.
    cecarryin_i  <= CE when HAS_GLOBAL_CE else CECARRYIN;
    rstcarryin_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCARRYIN;
  end generate opt_cin;

  opt_opmode: if OPMODEREG /=0 generate
    ceopmode_i  <= CE when HAS_GLOBAL_CE else CEOPMODE;
    rstopmode_i <= SCLR when HAS_GLOBAL_SCLR else SCLROPMODE;
  end generate opt_opmode;

  opt_carryin: if CARRYINSEL /= 0 generate
    -- tie-off to avoid getting (in map):
    --WARNING:PhysDesignRules:1617 - DSP48A block
    --<instance name> has an active signal for the CARRYIN
    --pin but the attribute CARRYINSEL is not set to CARRYIN. The CARRYINSEL
    --attribute must be changed to CARRYIN or connect the CARRYIN pin to a ground source
    carryin_i <= CARRYIN;
  end generate opt_carryin;

  i_primitive : DSP48A1
    generic map(
      A0REG       => A0REG,
      A1REG       => A1REG,
      B0REG       => B0REG,
      B1REG       => B1REG,
      CREG        => CREG,
      DREG        => DREG,
      MREG        => MREG,
      PREG        => PREG,
      CARRYINREG  => CARRYINREG,
      CARRYOUTREG => CARRYOUTREG,
      CARRYINSEL  => ci_carryinsel,
      OPMODEREG   => OPMODEREG
      )
    port map(
      P          => P,
      PCOUT      => PCOUT,
      A          => A,
      B          => B,
      BCOUT      => BCOUT,
      C          => C,
      D          => D,
      CARRYIN    => carryin_i,
      CARRYOUT   => CARRYOUT,
      CARRYOUTF  => CARRYOUTF,
      CEA        => cea_i,
      CEB        => ceb_i,
      CEC        => cec_i,
      CED        => ced_i,
      CECARRYIN  => cecarryin_i,
      CEOPMODE   => ceopmode_i,
      CEM        => cem_i,
      CEP        => cep_i,
      CLK        => CLK,
      OPMODE     => OPMODE,
      PCIN       => PCIN,
      RSTA       => rsta_i,
      RSTB       => rstb_i,
      RSTC       => rstc_i,
      RSTD       => rstd_i,
      RSTCARRYIN => rstcarryin_i,
      RSTOPMODE  => rstopmode_i,
      RSTM       => rstm_i,
      RSTP       => rstp_i
      );

end synth;



-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48e_wrapper_v3_0.vhd,v 1.2 2010/10/07 16:41:40 andreww Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2008,2010 Xilinx, Inc. All rights reserved.
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

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Note: this entity declaration is used as the template of the core's interface
-- by the core_if_bip.pl script. Hence, if you have to alter the interface, alter
-- it here and then run core_if_bip.pl (ensure all files to be altered are writeable)
-------------------------------------------------------------------------------
entity xbip_dsp48e_wrapper_v3_0 is
  generic (
    --application-specific generics
    AREG           : integer := 0;
    BREG           : integer := 0;
    MREG           : integer := 0;
    CREG           : integer := 0;
    PREG           : integer := 0;
    ACASCREG       : integer := 0;
    BCASCREG       : integer := 0;
    CARRYINREG     : integer := 0;
    CARRYINSELREG  : integer := 0;
    MULTCARRYINREG : integer := 0;
    OPMODEREG      : integer := 0;
    ALUMODEREG     : integer := 0;
    A_INPUT        : integer := 0;      --0 = direct, 1 = cascade
    B_INPUT        : integer := 0;      --0 = direct, 1 = cascade
    USE_MULT       : boolean := false;
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK          : in  std_logic                     := '1';
    CE           : in  std_logic                     := '1';
    SCLR         : in  std_logic                     := '0';
    PCIN         : in  std_logic_vector(47 downto 0) := (others => '0');
    ACIN         : in  std_logic_vector(29 downto 0) := (others => '0');
    BCIN         : in  std_logic_vector(17 downto 0) := (others => '0');
    A            : in  std_logic_vector(29 downto 0) := (others => '0');
    B            : in  std_logic_vector(17 downto 0) := (others => '0');
    C            : in  std_logic_vector(47 downto 0) := (others => '0');
    OPMODE       : in  std_logic_vector(6 downto 0)  := (others => '0');
    ALUMODE      : in  std_logic_vector(3 downto 0)  := (others => '0');
    MULTSIGNIN   : in  std_logic                     := '0';
    MULTSIGNOUT  : out std_logic                     := '0';
    CARRYIN      : in  std_logic                     := '0';
    CARRYOUT     : out std_logic                     := '0';
    CARRYCASCIN  : in  std_logic                     := '0';
    CARRYCASCOUT : out std_logic                     := '0';
    CARRYINSEL   : in  std_logic_vector(2 downto 0)  := (others => '0');
    ACOUT        : out std_logic_vector(29 downto 0) := (others => '0');
    BCOUT        : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT        : out std_logic_vector(47 downto 0) := (others => '0');
    P            : out std_logic_vector(47 downto 0) := (others => '0');

    CEA1          : std_logic := '1';
    CEA2          : std_logic := '1';
    CEB1          : std_logic := '1';
    CEB2          : std_logic := '1';
    CEC           : std_logic := '1';
    CECARRYIN     : std_logic := '1';
    CECTRL        : std_logic := '1';
    CEALUMODE     : std_logic := '1';
    CEMULTCARRYIN : std_logic := '1';
    CEM           : std_logic := '1';
    CEP           : std_logic := '1';
    SCLRA         : std_logic := '0';
    SCLRB         : std_logic := '0';
    SCLRC         : std_logic := '0';
    SCLRALLCARRYIN: std_logic := '0';
    SCLRCTRL      : std_logic := '0';
    SCLRALUMODE   : std_logic := '0';
    SCLRM         : std_logic := '0';
    SCLRP         : std_logic := '0'
    );
end xbip_dsp48e_wrapper_v3_0;



architecture synth of xbip_dsp48e_wrapper_v3_0 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: validity checking on parameter values
  function fn_check_generics(
    --application-specific generics
    pAREG : integer := 0;
    pBREG : integer := 0;
    pMREG : integer := 0;
    pCREG : integer := 0;
    pPREG : integer := 0;
    pCARRYINREG : integer := 0;
    pMULTCARRYINREG : integer := 0;
    pCARRYINSELREG : integer := 0;
    pOPMODEREG : integer := 0;
    pA_INPUT : integer := 0;              --0 = direct, 1 = cascade
    pB_INPUT : integer := 0              --0 = direct, 1 = cascade
    )
    return integer is

  begin  -- check_generics
    assert pAREG= 0 or pAREG=1 or pAREG=2
      report "ERROR: xbip_dsp48e_wrapper_v3_0: AREG out of range 0 to 2."
      severity error;
    assert pBREG= 0 or pBREG=1 or pBREG=2
      report "ERROR: xbip_dsp48e_wrapper_v3_0: BREG out of range 0 to 2."
      severity error;
    assert pCREG= 0 or pCREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CREG out of range 0 to 1."
      severity error;
    assert pMREG= 0 or pMREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: MREG out of range 0 to 1."
      severity error;
    assert pPREG= 0 or pPREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: PREG out of range 0 to 1."
      severity error;
    assert pCARRYINREG= 0 or pCARRYINREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CARRYINREG out of range 0 to 1."
      severity error;
    assert pMULTCARRYINREG= 0 or pMULTCARRYINREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CARRYINREG out of range 0 to 1."
      severity error;
    assert pCARRYINSELREG= 0 or pCARRYINSELREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CARRYINSELREG out of range 0 to 1."
      severity error;
    assert pOPMODEREG= 0 or pOPMODEREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: OPMODEREG out of range 0 to 1."
      severity error;
    assert pA_INPUT= 0 or pA_INPUT=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: A_INPUT out of range 0 to 1."
      severity error;
    assert pB_INPUT= 0 or pB_INPUT=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: B_INPUT out of range 0 to 1."
      severity error;
    return 0;                           --must return a value or modelsim complains.
  end fn_check_generics;
  constant check_generics : integer := fn_check_generics(
    pAREG          => AREG         ,
    pBREG          => BREG         ,
    pMREG          => MREG         ,
    pCREG          => CREG         ,
    pPREG          => PREG         ,
    pCARRYINREG    => CARRYINREG   ,
    pCARRYINSELREG => CARRYINSELREG,
    pOPMODEREG     => OPMODEREG    ,
    pA_INPUT       => A_INPUT      ,
    pB_INPUT       => B_INPUT
    );

  function fn_resolve_casc_in(
    p_in : integer
    )
    return string is
  begin
    if p_in = 1 then
      return "CASCADE";
    else
      return "DIRECT";
    end if;
  end function fn_resolve_casc_in;
  constant ci_a_input : string := fn_resolve_casc_in(
    p_in => A_INPUT
    );
  constant ci_b_input : string := fn_resolve_casc_in(
    p_in => B_INPUT
    );

  function fn_resolve_legacy_mode (
    p_mreg : integer;
    p_use_mult : boolean
    )
    return string is
  begin  -- fn_resolve_legacy_mode
    if p_use_mult then
      if p_mreg = 0 then
        return "MULT";
      else
        return "MULT_S";
      end if;
    else
      return "NONE";
    end if;
  end fn_resolve_legacy_mode;
  constant ci_legacy_mode : string := fn_resolve_legacy_mode(
    p_mreg     => MREG,
    p_use_mult => USE_MULT
    );

  function fn_resolve_cascreg(
    p_CASCREG : integer;
    p_REG     : integer
    )
    return integer is
  begin
    if p_CASCREG = -1 then
      return p_REG;
    else
      return p_CASCREG;
    end if;
  end function fn_resolve_cascreg;
  constant acascreg_i : integer := fn_resolve_cascreg(
    p_CASCREG => ACASCREG,
    p_REG     => AREG
    );
  constant bcascreg_i : integer := fn_resolve_cascreg(
    p_CASCREG => BCASCREG,
    p_REG     => BREG
    );

  signal cea1_i          : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb1_i          : std_logic := '0';
  signal cea2_i          : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb2_i          : std_logic := '0';
  signal cec_i           : std_logic := '0';
  signal cem_i           : std_logic := '0';
  signal cep_i           : std_logic := '0';
  signal cealumode_i     : std_logic := '0';
  signal cecarryin_i     : std_logic := '0';
  signal cemultcarryin_i : std_logic := '0';
  signal cectrl_i        : std_logic := '0';
  signal cecinsub_i      : std_logic := '0';

  signal rsta_i       : std_logic := '0';      -- defaults to 0 for power saving
  signal rstb_i       : std_logic := '0';
  signal rstc_i       : std_logic := '0';
  signal rstm_i       : std_logic := '0';
  signal rstp_i       : std_logic := '0';
  signal rstalumode_i : std_logic := '0';
  signal rstallcarryin_i : std_logic := '0';
  signal rstctrl_i    : std_logic := '0';
  signal rstcinsub_i  : std_logic := '0';

  signal carryout_i : std_logic_vector(3 downto 0) := (others => '0');


begin

  opt_a: if AREG /=0 generate
    rsta_i <= SCLR when HAS_GLOBAL_SCLR else SCLRA;
    cea2_i  <= CE when HAS_GLOBAL_CE else CEA2;
    both_a: if AREG=2 generate
      cea1_i  <= CE when HAS_GLOBAL_CE else CEA1;
    end generate both_a;
  end generate opt_a;

  opt_b: if BREG /=0 generate
    rstb_i <= SCLR when HAS_GLOBAL_SCLR else SCLRB;
    ceb2_i  <= CE when HAS_GLOBAL_CE else CEB2;
    both_b: if BREG=2 generate
      ceb1_i  <= CE when HAS_GLOBAL_CE else CEB1;
    end generate both_b;
  end generate opt_b;

  opt_c: if CREG /=0 generate
    cec_i  <= CE when HAS_GLOBAL_CE else CEC;
    rstc_i <= SCLR when HAS_GLOBAL_SCLR else SCLRC;
  end generate opt_c;

  opt_m: if MREG /=0 generate
    cem_i  <= CE when HAS_GLOBAL_CE else CEM;
    rstm_i <= SCLR when HAS_GLOBAL_SCLR else SCLRM;
  end generate opt_m;

  opt_p: if PREG /=0 generate
    cep_i  <= CE when HAS_GLOBAL_CE else CEP;
    rstp_i <= SCLR when HAS_GLOBAL_SCLR else SCLRP;
  end generate opt_p;

  opt_cin: if CARRYINREG /=0 generate
    cecarryin_i  <= CE when HAS_GLOBAL_CE else CECARRYIN;
  end generate opt_cin;

  opt_mult: if MULTCARRYINREG /=0 generate
    cemultcarryin_i  <= CE when HAS_GLOBAL_CE else CEMULTCARRYIN;
  end generate opt_mult;

  opt_rstallcin: if MULTCARRYINREG /= 0 or CARRYINREG /= 0 generate
    rstallcarryin_i <= SCLR when HAS_GLOBAL_SCLR else SCLRALLCARRYIN;
  end generate opt_rstallcin;

  opt_ctrl: if CARRYINSELREG /=0 or OPMODEREG /=0 generate
    cectrl_i  <= CE when HAS_GLOBAL_CE else CECTRL;
    rstctrl_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCTRL;
  end generate opt_ctrl;

  opt_alumode: if ALUMODEREG /=0 generate
    cealumode_i  <= CE when HAS_GLOBAL_CE else CEALUMODE;
    rstalumode_i <= SCLR when HAS_GLOBAL_SCLR else SCLRALUMODE;
  end generate opt_alumode;


  i_primitive : DSP48E
    generic map(
      ACASCREG       => acascreg_i,
      BCASCREG       => bcascreg_i,
      A_INPUT        => ci_a_input,
      B_INPUT        => ci_b_input,
      USE_MULT       => ci_legacy_mode,
      AREG           => AREG         ,
      BREG           => BREG         ,
      MREG           => MREG         ,
      CREG           => CREG         ,
      PREG           => PREG         ,
      CARRYINREG     => CARRYINREG   ,
      CARRYINSELREG  => CARRYINSELREG,
      MULTCARRYINREG => MULTCARRYINREG,
      OPMODEREG      => OPMODEREG,
      ALUMODEREG     => ALUMODEREG,
      --the following generics are left until needed by a usecase
--      AUTORESET_PATTERN_DETECT
--      AUTORESET_PATTERN_DETECT_OPTINV
--      MASK
--      PATTERN
--      SEL_MASK
--      SEL_PATTERN
--      SEL_ROUNDING_MASK
--      USE_PATTERN_DETECT
      USE_SIMD      => "ONE48"
     )
    port map(
      ACIN         => ACIN,
      BCIN         => BCIN,
      ACOUT        => ACOUT,
      BCOUT        => BCOUT,
      PCIN         => PCIN,
      MULTSIGNIN   => MULTSIGNIN,
      MULTSIGNOUT  => MULTSIGNOUT,
      CARRYCASCIN  => CARRYCASCIN,
      CARRYCASCOUT => CARRYCASCOUT,
      CARRYOUT     => CARRYOUT_i,
      A            => A,
      B            => B,
      C            => C,
      CARRYIN      => CARRYIN,
      CARRYINSEL   => CARRYINSEL,
      CEA1         => cea1_i,
      CEA2         => cea2_i,
      CEB1         => ceb1_i,
      CEB2         => ceb2_i,
      CEC          => cec_i,
      CECARRYIN    => cecarryin_i,
      CECTRL       => cectrl_i,
      CEALUMODE    => cealumode_i,
      CEMULTCARRYIN => cemultcarryin_i,
      CEM          => cem_i,
      CEP          => cep_i,
      CLK          => CLK,
      OPMODE       => OPMODE,
      ALUMODE      => ALUMODE,
      RSTA         => rsta_i,
      RSTB         => rstb_i,
      RSTC         => rstc_i,
      RSTALLCARRYIN => rstallcarryin_i,
      RSTCTRL      => rstctrl_i,
      RSTALUMODE   => rstalumode_i,
      RSTM         => rstm_i,
      RSTP         => rstp_i,
      P            => P,
      PCOUT        => PCOUT

      --The following ports are left until a usecase requires them
      --PATTERNBDETECT
      --PATTERNDETECT
      --OVERFLOW
      --UNDERFLOW
      --CEMULTCARRYIN
      );
  CARRYOUT <= carryout_i(3);

end synth;



-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48e1_wrapper_v3_0.vhd,v 1.3 2010/12/10 21:17:05 andreww Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2008,2010 Xilinx, Inc. All rights reserved.
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

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Note: this entity declaration is used as the template of the core's interface
-- by the core_if_bip.pl script. Hence, if you have to alter the interface, alter
-- it here and then run core_if_bip.pl (ensure all files to be altered are writeable)
-------------------------------------------------------------------------------
entity xbip_dsp48e1_wrapper_v3_0 is
  generic (
    --application-specific generics
    AREG           : integer := 0;
    BREG           : integer := 0;
    MREG           : integer := 0;
    CREG           : integer := 0;
    DREG           : integer := 0;
    ADREG          : integer := 0;
    PREG           : integer := 0;
    ACASCREG       : integer := 0;
    BCASCREG       : integer := 0;
    CARRYINREG     : integer := 0;
    CARRYINSELREG  : integer := 0;
    INMODEREG      : integer := 0;
    OPMODEREG      : integer := 0;
    ALUMODEREG     : integer := 0;
    A_INPUT        : integer := 0;      --0 = direct, 1 = cascade
    B_INPUT        : integer := 0;      --0 = direct, 1 = cascade
    USE_MULT       : string  := "NONE"; --MULTIPLY, DYNAMIC or NONE
    USE_DPORT      : boolean := true;
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK          : in  std_logic                     := '1';
    CE           : in  std_logic                     := '1';
    SCLR         : in  std_logic                     := '0';
    PCIN         : in  std_logic_vector(47 downto 0) := (others => '0');
    ACIN         : in  std_logic_vector(29 downto 0) := (others => '0');
    BCIN         : in  std_logic_vector(17 downto 0) := (others => '0');
    A            : in  std_logic_vector(29 downto 0) := (others => '0');
    B            : in  std_logic_vector(17 downto 0) := (others => '0');
    C            : in  std_logic_vector(47 downto 0) := (others => '0');
    D            : in  std_logic_vector(24 downto 0) := (others => '0');
    OPMODE       : in  std_logic_vector(6 downto 0)  := (others => '0');
    ALUMODE      : in  std_logic_vector(3 downto 0)  := (others => '0');
    INMODE       : in  std_logic_vector(4 downto 0)  := (others => '0');
    MULTSIGNIN   : in  std_logic                     := '0';
    MULTSIGNOUT  : out std_logic                     := '0';
    CARRYIN      : in  std_logic                     := '0';
    CARRYOUT     : out std_logic                     := '0';
    CARRYCASCIN  : in  std_logic                     := '0';
    CARRYCASCOUT : out std_logic                     := '0';
    CARRYINSEL   : in  std_logic_vector(2 downto 0)  := (others => '0');
    ACOUT        : out std_logic_vector(29 downto 0) := (others => '0');
    BCOUT        : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT        : out std_logic_vector(47 downto 0) := (others => '0');
    P            : out std_logic_vector(47 downto 0) := (others => '0');

    CEA1          : std_logic := '1';
    CEA2          : std_logic := '1';
    CEB1          : std_logic := '1';
    CEB2          : std_logic := '1';
    CEAD          : std_logic := '1';
    CED           : std_logic := '1';
    CEC           : std_logic := '1';
    CECARRYIN     : std_logic := '1';
    CECTRL        : std_logic := '1';
    CEALUMODE     : std_logic := '1';
    CEINMODE      : std_logic := '1';
    CEM           : std_logic := '1';
    CEP           : std_logic := '1';
    SCLRA         : std_logic := '0';
    SCLRB         : std_logic := '0';
    SCLRC         : std_logic := '0';
    SCLRD         : std_logic := '0';
    SCLRALLCARRYIN: std_logic := '0';
    SCLRCTRL      : std_logic := '0';
    SCLRALUMODE   : std_logic := '0';
    SCLRINMODE    : std_logic := '0';
    SCLRM         : std_logic := '0';
    SCLRP         : std_logic := '0'
    );
end xbip_dsp48e1_wrapper_v3_0;



architecture synth of xbip_dsp48e1_wrapper_v3_0 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: validity checking on parameter values
  function fn_check_generics(
    --application-specific generics
    pAREG : integer := 0;
    pBREG : integer := 0;
    pMREG : integer := 0;
    pCREG : integer := 0;
    pDREG : integer := 0;
    pADREG : integer := 0;
    pPREG : integer := 0;
    pINMODEREG : integer := 0;
    pCARRYINREG : integer := 0;
    pCARRYINSELREG : integer := 0;
    pOPMODEREG : integer := 0;
    pA_INPUT : integer := 0;              --0 = direct, 1 = cascade
    pB_INPUT : integer := 0              --0 = direct, 1 = cascade
    )
    return integer is

  begin  -- check_generics
    assert pAREG= 0 or pAREG=1 or pAREG=2
      report "ERROR: xbip_dsp48e_wrapper_v3_0: AREG out of range 0 to 2."
      severity error;
    assert pBREG= 0 or pBREG=1 or pBREG=2
      report "ERROR: xbip_dsp48e_wrapper_v3_0: BREG out of range 0 to 2."
      severity error;
    assert pADREG= 0 or pADREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: ADREG out of range 0 to 1."
      severity error;
    assert pCREG= 0 or pCREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CREG out of range 0 to 1."
      severity error;
    assert pDREG= 0 or pDREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: DREG out of range 0 to 1."
      severity error;
    assert pMREG= 0 or pMREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: MREG out of range 0 to 1."
      severity error;
    assert pPREG= 0 or pPREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: PREG out of range 0 to 1."
      severity error;
    assert pCARRYINREG= 0 or pCARRYINREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CARRYINREG out of range 0 to 1."
      severity error;
    assert pINMODEREG= 0 or pINMODEREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: INMODEREG out of range 0 to 1."
      severity error;
    assert pCARRYINSELREG= 0 or pCARRYINSELREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: CARRYINSELREG out of range 0 to 1."
      severity error;
    assert pOPMODEREG= 0 or pOPMODEREG=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: OPMODEREG out of range 0 to 1."
      severity error;
    assert pA_INPUT= 0 or pA_INPUT=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: A_INPUT out of range 0 to 1."
      severity error;
    assert pB_INPUT= 0 or pB_INPUT=1
      report "ERROR: xbip_dsp48e_wrapper_v3_0: B_INPUT out of range 0 to 1."
      severity error;
    return 0;                           --must return a value or modelsim complains.
  end fn_check_generics;
  constant check_generics : integer := fn_check_generics(
    pAREG          => AREG         ,
    pBREG          => BREG         ,
    pMREG          => MREG         ,
    pCREG          => CREG         ,
    pDREG          => DREG         ,
    pADREG         => ADREG        ,
    pPREG          => PREG         ,
    pINMODEREG     => INMODEREG    ,
    pCARRYINREG    => CARRYINREG   ,
    pCARRYINSELREG => CARRYINSELREG,
    pOPMODEREG     => OPMODEREG    ,
    pA_INPUT       => A_INPUT      ,
    pB_INPUT       => B_INPUT
    );

  function fn_resolve_casc_in(
    p_in : integer
    )
    return string is
  begin
    if p_in = 1 then
      return "CASCADE";
    else
      return "DIRECT";
    end if;
  end function fn_resolve_casc_in;
  constant ci_a_input : string := fn_resolve_casc_in(
    p_in => A_INPUT
    );
  constant ci_b_input : string := fn_resolve_casc_in(
    p_in => B_INPUT
    );

  -- function fn_resolve_legacy_mode (
    -- p_mreg : integer;
    -- p_use_mult : boolean
    -- )
    -- return string is
  -- begin  -- fn_resolve_legacy_mode
    -- if p_use_mult then
      -- if p_mreg = 0 then
        -- return "MULT";
      -- else
        -- return "MULT_S";
      -- end if;
    -- else
      -- return "NONE";
    -- end if;
  -- end fn_resolve_legacy_mode;
  -- constant ci_legacy_mode : string := fn_resolve_legacy_mode(
    -- p_mreg     => MREG,
    -- p_use_mult => USE_MULT
    -- );

  function fn_resolve_cascreg(
    p_CASCREG : integer;
    p_REG     : integer
    )
    return integer is
  begin
    if p_CASCREG = -1 then
      return p_REG;
    else
      return p_CASCREG;
    end if;
  end function fn_resolve_cascreg;
  constant acascreg_i : integer := fn_resolve_cascreg(
    p_CASCREG => ACASCREG,
    p_REG     => AREG
    );
  constant bcascreg_i : integer := fn_resolve_cascreg(
    p_CASCREG => BCASCREG,
    p_REG     => BREG
    );

  signal cea1_i          : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb1_i          : std_logic := '0';
  signal cea2_i          : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb2_i          : std_logic := '0';
  signal cead_i          : std_logic := '0';
  signal cec_i           : std_logic := '0';
  signal ced_i           : std_logic := '0';
  signal cem_i           : std_logic := '0';
  signal cep_i           : std_logic := '0';
  signal cealumode_i     : std_logic := '0';
  signal ceinmode_i      : std_logic := '0';
  signal cecarryin_i     : std_logic := '0';
  signal cectrl_i        : std_logic := '0';
  -- signal cecinsub_i      : std_logic := '0';

  signal rsta_i       : std_logic := '0';      -- defaults to 0 for power saving
  signal rstb_i       : std_logic := '0';
  signal rstc_i       : std_logic := '0';
  signal rstd_i       : std_logic := '0';
  signal rstm_i       : std_logic := '0';
  signal rstp_i       : std_logic := '0';
  signal rstalumode_i : std_logic := '0';
  signal rstinmode_i  : std_logic := '0';
  signal rstallcarryin_i : std_logic := '0';
  signal rstctrl_i    : std_logic := '0';
  signal rstcinsub_i  : std_logic := '0';

  signal carryout_i : std_logic_vector(3 downto 0) := (others => '0');


begin

  opt_a: if AREG /=0 generate
    rsta_i <= SCLR when HAS_GLOBAL_SCLR else SCLRA;
    cea2_i  <= CE when HAS_GLOBAL_CE else CEA2;
    both_a: if AREG=2 generate
      cea1_i  <= CE when HAS_GLOBAL_CE else CEA1;
    end generate both_a;
  end generate opt_a;

  opt_b: if BREG /=0 generate
    rstb_i <= SCLR when HAS_GLOBAL_SCLR else SCLRB;
    ceb2_i  <= CE when HAS_GLOBAL_CE else CEB2;
    both_b: if BREG=2 generate
      ceb1_i  <= CE when HAS_GLOBAL_CE else CEB1;
    end generate both_b;
  end generate opt_b;

  opt_ad: if ADREG /=0 or DREG /=0 generate
    ced_i  <= CE  when HAS_GLOBAL_CE else CED;
    cead_i  <= CE  when HAS_GLOBAL_CE else CEAD;
    rstd_i <= SCLR when HAS_GLOBAL_SCLR else SCLRD;
  end generate opt_ad;

  opt_c: if CREG /=0 generate
    cec_i  <= CE  when HAS_GLOBAL_CE else CEC;
    rstc_i <= SCLR  when HAS_GLOBAL_SCLR else SCLRC;
  end generate opt_c;

  opt_m: if MREG /=0 generate
    cem_i  <= CE  when HAS_GLOBAL_CE else CEM;
    rstm_i <= SCLR when HAS_GLOBAL_SCLR else SCLRM;
  end generate opt_m;

  opt_p: if PREG /=0 generate
    cep_i  <= CE  when HAS_GLOBAL_CE else CEP;
    rstp_i <= SCLR when HAS_GLOBAL_SCLR else SCLRP;
  end generate opt_p;

  opt_cin: if CARRYINREG /=0 generate
    cecarryin_i  <= CE  when HAS_GLOBAL_CE else CECARRYIN;
  end generate opt_cin;

  opt_rstallcin: if CARRYINREG /= 0 or (MREG /= 0) generate
    -- Also enable when MREG present to allow reset of mult carry signal (MSB(a) xnor MSB(b))
    rstallcarryin_i <= SCLR when HAS_GLOBAL_SCLR else SCLRALLCARRYIN;
  end generate opt_rstallcin;

  opt_ctrl: if CARRYINSELREG /=0 or OPMODEREG /=0 generate
    cectrl_i  <= CE  when HAS_GLOBAL_CE else CECTRL;
    rstctrl_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCTRL;
  end generate opt_ctrl;

  opt_alumode: if ALUMODEREG /=0 generate
    cealumode_i  <= CE  when HAS_GLOBAL_CE else CEALUMODE;
    rstalumode_i <= SCLR when HAS_GLOBAL_SCLR else SCLRALUMODE;
  end generate opt_alumode;

  opt_inmode: if INMODEREG /=0 generate
    ceinmode_i  <= CE  when HAS_GLOBAL_CE else CEINMODE;
    rstinmode_i <= SCLR when HAS_GLOBAL_SCLR else SCLRINMODE;
  end generate opt_inmode;


  i_primitive : DSP48E1
    generic map(
      ACASCREG       => acascreg_i,
      BCASCREG       => bcascreg_i,
      A_INPUT        => ci_a_input,
      B_INPUT        => ci_b_input,
      USE_MULT       => USE_MULT,
      USE_DPORT      => USE_DPORT,
      AREG           => AREG         ,
      BREG           => BREG         ,
      DREG           => DREG         ,
      ADREG          => ADREG        ,
      MREG           => MREG         ,
      CREG           => CREG         ,
      PREG           => PREG         ,
      CARRYINREG     => CARRYINREG   ,
      CARRYINSELREG  => CARRYINSELREG,
      OPMODEREG      => OPMODEREG,
      ALUMODEREG     => ALUMODEREG,
      INMODEREG      => INMODEREG,
      --the following generics are left until needed by a usecase
--      AUTORESET_PATTERN_DETECT
--      AUTORESET_PATTERN_DETECT_OPTINV
--      MASK
--      PATTERN
--      SEL_MASK
--      SEL_PATTERN
--      SEL_ROUNDING_MASK
--      USE_PATTERN_DETECT
      USE_SIMD      => "ONE48"
     )
    port map(
      ACIN         => ACIN,
      BCIN         => BCIN,
      ACOUT        => ACOUT,
      BCOUT        => BCOUT,
      PCIN         => PCIN,
      MULTSIGNIN   => MULTSIGNIN,
      MULTSIGNOUT  => MULTSIGNOUT,
      CARRYCASCIN  => CARRYCASCIN,
      CARRYCASCOUT => CARRYCASCOUT,
      CARRYOUT     => CARRYOUT_i,
      A            => A,
      B            => B,
      C            => C,
      D            => D,
      CARRYIN      => CARRYIN,
      CARRYINSEL   => CARRYINSEL,
      CEA1         => cea1_i,
      CEA2         => cea2_i,
      CEB1         => ceb1_i,
      CEB2         => ceb2_i,
      CEAD         => cead_i,
      CED          => ced_i,
      CEC          => cec_i,
      CECARRYIN    => cecarryin_i,
      CECTRL       => cectrl_i,
      CEALUMODE    => cealumode_i,
      CEINMODE     => ceinmode_i,
      CEM          => cem_i,
      CEP          => cep_i,
      CLK          => CLK,
      OPMODE       => OPMODE,
      ALUMODE      => ALUMODE,
      INMODE       => INMODE,
      RSTA         => rsta_i,
      RSTB         => rstb_i,
      RSTC         => rstc_i,
      RSTD         => rstd_i,
      RSTALLCARRYIN => rstallcarryin_i,
      RSTCTRL      => rstctrl_i,
      RSTALUMODE   => rstalumode_i,
      RSTINMODE    => rstinmode_i,
      RSTM         => rstm_i,
      RSTP         => rstp_i,
      P            => P,
      PCOUT        => PCOUT

      --The following ports are left until a usecase requires them
      --PATTERNBDETECT
      --PATTERNDETECT
      --OVERFLOW
      --UNDERFLOW
      );
  CARRYOUT <= carryout_i(3);

end synth;



-------------------------------------------------------------------------------
--  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
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

library unisim;
use unisim.vcomponents.all;

entity xbip_dsp48e2_wrapper_v3_0 is
  generic (
    --application-specific generics
    AREG            : integer                       := 0;
    BREG            : integer                       := 0;
    MREG            : integer                       := 0;
    CREG            : integer                       := 0;
    DREG            : integer                       := 0;
    ADREG           : integer                       := 0;
    PREG            : integer                       := 0;
    ACASCREG        : integer                       := 0;
    BCASCREG        : integer                       := 0;
    CARRYINREG      : integer                       := 0;
    CARRYINSELREG   : integer                       := 0;
    INMODEREG       : integer                       := 0;
    OPMODEREG       : integer                       := 0;
    ALUMODEREG      : integer                       := 0;
    A_INPUT         : integer                       := 0;  --0 = direct, 1 = cascade
    B_INPUT         : integer                       := 0;  --0 = direct, 1 = cascade
    RND             : std_logic_vector(47 downto 0) := X"3FFFFFFFFFFF";
    USE_DPORT       : boolean                       := true;
    USE_MULT        : string                        := "NONE";  --MULTIPLY, DYNAMIC or NONE
    USE_WIDEXOR     : string                        := "FALSE";
    XORSIMD         : string                        := "XOR24_48_96";
    HAS_GLOBAL_CE   : boolean                       := true;
    HAS_GLOBAL_SCLR : boolean                       := true
    );
  port (
    CLK          : in  std_logic                     := '1';
    CE           : in  std_logic                     := '1';
    SCLR         : in  std_logic                     := '0';
    PCIN         : in  std_logic_vector(47 downto 0) := (others => '0');
    ACIN         : in  std_logic_vector(29 downto 0) := (others => '0');
    BCIN         : in  std_logic_vector(17 downto 0) := (others => '0');
    A            : in  std_logic_vector(29 downto 0) := (others => '0');
    B            : in  std_logic_vector(17 downto 0) := (others => '0');
    C            : in  std_logic_vector(47 downto 0) := (others => '0');
    D            : in  std_logic_vector(26 downto 0) := (others => '0');  --Wider than DSP48E1
    OPMODE       : in  std_logic_vector(8 downto 0)  := (others => '0');  --Wider than DSP48E1
    ALUMODE      : in  std_logic_vector(3 downto 0)  := (others => '0');
    INMODE       : in  std_logic_vector(4 downto 0)  := (others => '0');
    MULTSIGNIN   : in  std_logic                     := '0';
    MULTSIGNOUT  : out std_logic                     := '0';
    CARRYIN      : in  std_logic                     := '0';
    CARRYOUT     : out std_logic                     := '0';
    CARRYCASCIN  : in  std_logic                     := '0';
    CARRYCASCOUT : out std_logic                     := '0';
    CARRYINSEL   : in  std_logic_vector(2 downto 0)  := (others => '0');
    ACOUT        : out std_logic_vector(29 downto 0) := (others => '0');
    BCOUT        : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT        : out std_logic_vector(47 downto 0) := (others => '0');
    P            : out std_logic_vector(47 downto 0) := (others => '0');
    XOROUT       : out std_logic_vector(7 downto 0)  := (others => '0');

    CEA1           : std_logic := '1';
    CEA2           : std_logic := '1';
    CEB1           : std_logic := '1';
    CEB2           : std_logic := '1';
    CEAD           : std_logic := '1';
    CED            : std_logic := '1';
    CEC            : std_logic := '1';
    CECARRYIN      : std_logic := '1';
    CECTRL         : std_logic := '1';
    CEALUMODE      : std_logic := '1';
    CEINMODE       : std_logic := '1';
    CEM            : std_logic := '1';
    CEP            : std_logic := '1';
    SCLRA          : std_logic := '0';
    SCLRB          : std_logic := '0';
    SCLRC          : std_logic := '0';
    SCLRD          : std_logic := '0';
    SCLRALLCARRYIN : std_logic := '0';
    SCLRCTRL       : std_logic := '0';
    SCLRALUMODE    : std_logic := '0';
    SCLRINMODE     : std_logic := '0';
    SCLRM          : std_logic := '0';
    SCLRP          : std_logic := '0'
    );
end xbip_dsp48e2_wrapper_v3_0;



architecture synth of xbip_dsp48e2_wrapper_v3_0 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";

  -- purpose: validity checking on parameter values
  function fn_check_generics(
    --application-specific generics
    pAREG          : integer := 0;
    pBREG          : integer := 0;
    pMREG          : integer := 0;
    pCREG          : integer := 0;
    pDREG          : integer := 0;
    pADREG         : integer := 0;
    pPREG          : integer := 0;
    pINMODEREG     : integer := 0;
    pCARRYINREG    : integer := 0;
    pCARRYINSELREG : integer := 0;
    pOPMODEREG     : integer := 0;
    pA_INPUT       : integer := 0;      --0 = direct, 1 = cascade
    pB_INPUT       : integer := 0       --0 = direct, 1 = cascade
    )
    return integer is

  begin  -- check_generics
    assert pAREG = 0 or pAREG = 1 or pAREG = 2
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: AREG out of range 0 to 2."
      severity error;
    assert pBREG = 0 or pBREG = 1 or pBREG = 2
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: BREG out of range 0 to 2."
      severity error;
    assert pADREG = 0 or pADREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: ADREG out of range 0 to 1."
      severity error;
    assert pCREG = 0 or pCREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: CREG out of range 0 to 1."
      severity error;
    assert pDREG = 0 or pDREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: DREG out of range 0 to 1."
      severity error;
    assert pMREG = 0 or pMREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: MREG out of range 0 to 1."
      severity error;
    assert pPREG = 0 or pPREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: PREG out of range 0 to 1."
      severity error;
    assert pCARRYINREG = 0 or pCARRYINREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: CARRYINREG out of range 0 to 1."
      severity error;
    assert pINMODEREG = 0 or pINMODEREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: INMODEREG out of range 0 to 1."
      severity error;
    assert pCARRYINSELREG = 0 or pCARRYINSELREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: CARRYINSELREG out of range 0 to 1."
      severity error;
    assert pOPMODEREG = 0 or pOPMODEREG = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: OPMODEREG out of range 0 to 1."
      severity error;
    assert pA_INPUT = 0 or pA_INPUT = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: A_INPUT out of range 0 to 1."
      severity error;
    assert pB_INPUT = 0 or pB_INPUT = 1
      report "ERROR: xbip_dsp48e2_wrapper_v3_0: B_INPUT out of range 0 to 1."
      severity error;
    return 0;  --must return a value or modelsim complains.
  end fn_check_generics;
  constant check_generics : integer := fn_check_generics(
    pAREG          => AREG,
    pBREG          => BREG,
    pMREG          => MREG,
    pCREG          => CREG,
    pDREG          => DREG,
    pADREG         => ADREG,
    pPREG          => PREG,
    pINMODEREG     => INMODEREG,
    pCARRYINREG    => CARRYINREG,
    pCARRYINSELREG => CARRYINSELREG,
    pOPMODEREG     => OPMODEREG,
    pA_INPUT       => A_INPUT,
    pB_INPUT       => B_INPUT
    );

  function fn_resolve_casc_in(
    p_in : integer
    )
    return string is
  begin
    if p_in = 1 then
      return "CASCADE";
    else
      return "DIRECT";
    end if;
  end function fn_resolve_casc_in;
  constant ci_a_input : string := fn_resolve_casc_in(
    p_in => A_INPUT
    );
  constant ci_b_input : string := fn_resolve_casc_in(
    p_in => B_INPUT
    );

  function fn_resolve_cascreg(
    p_CASCREG : integer;
    p_REG     : integer
    )
    return integer is
  begin
    if p_CASCREG = -1 then
      return p_REG;
    else
      return p_CASCREG;
    end if;
  end function fn_resolve_cascreg;
  constant acascreg_i : integer := fn_resolve_cascreg(
    p_CASCREG => ACASCREG,
    p_REG     => AREG
    );
  constant bcascreg_i : integer := fn_resolve_cascreg(
    p_CASCREG => BCASCREG,
    p_REG     => BREG
    );

  function fn_resolve_use_dport (
    p_USE_DPORT : boolean)
    return string is
  begin
    if p_USE_DPORT then
      return "AD";
    else
      return "A";
    end if;
  end function fn_resolve_use_dport;
  constant ci_amultsel : string := fn_resolve_use_dport(USE_DPORT);

  signal cea1_i      : std_logic := '0';  -- defaults to 0 for power saving
  signal ceb1_i      : std_logic := '0';
  signal cea2_i      : std_logic := '0';  -- defaults to 0 for power saving
  signal ceb2_i      : std_logic := '0';
  signal cead_i      : std_logic := '0';
  signal cec_i       : std_logic := '0';
  signal ced_i       : std_logic := '0';
  signal cem_i       : std_logic := '0';
  signal cep_i       : std_logic := '0';
  signal cealumode_i : std_logic := '0';
  signal ceinmode_i  : std_logic := '0';
  signal cecarryin_i : std_logic := '0';
  signal cectrl_i    : std_logic := '0';

  signal rsta_i          : std_logic := '0';  -- defaults to 0 for power saving
  signal rstb_i          : std_logic := '0';
  signal rstc_i          : std_logic := '0';
  signal rstd_i          : std_logic := '0';
  signal rstm_i          : std_logic := '0';
  signal rstp_i          : std_logic := '0';
  signal rstalumode_i    : std_logic := '0';
  signal rstinmode_i     : std_logic := '0';
  signal rstallcarryin_i : std_logic := '0';
  signal rstctrl_i       : std_logic := '0';
  signal rstcinsub_i     : std_logic := '0';

  signal carryout_i : std_logic_vector(3 downto 0) := (others => '0');

begin

  opt_a : if AREG /= 0 generate
    rsta_i <= SCLR when HAS_GLOBAL_SCLR else SCLRA;
    cea2_i <= CE   when HAS_GLOBAL_CE   else CEA2;
    both_a : if AREG = 2 generate
      cea1_i <= CE when HAS_GLOBAL_CE else CEA1;
    end generate both_a;
  end generate opt_a;

  opt_b : if BREG /= 0 generate
    rstb_i <= SCLR when HAS_GLOBAL_SCLR else SCLRB;
    ceb2_i <= CE   when HAS_GLOBAL_CE   else CEB2;
    both_b : if BREG = 2 generate
      ceb1_i <= CE when HAS_GLOBAL_CE else CEB1;
    end generate both_b;
  end generate opt_b;

  opt_ad : if ADREG /= 0 or DREG /= 0 generate
    ced_i  <= CE   when HAS_GLOBAL_CE   else CED;
    cead_i <= CE   when HAS_GLOBAL_CE   else CEAD;
    rstd_i <= SCLR when HAS_GLOBAL_SCLR else SCLRD;
  end generate opt_ad;

  opt_c : if CREG /= 0 generate
    cec_i  <= CE   when HAS_GLOBAL_CE   else CEC;
    rstc_i <= SCLR when HAS_GLOBAL_SCLR else SCLRC;
  end generate opt_c;

  opt_m : if MREG /= 0 generate
    cem_i  <= CE   when HAS_GLOBAL_CE   else CEM;
    rstm_i <= SCLR when HAS_GLOBAL_SCLR else SCLRM;
  end generate opt_m;

  opt_p : if PREG /= 0 generate
    cep_i  <= CE   when HAS_GLOBAL_CE   else CEP;
    rstp_i <= SCLR when HAS_GLOBAL_SCLR else SCLRP;
  end generate opt_p;

  opt_cin : if CARRYINREG /= 0 generate
    cecarryin_i <= CE when HAS_GLOBAL_CE else CECARRYIN;
  end generate opt_cin;

  opt_rstallcin : if CARRYINREG /= 0 or (MREG /= 0) generate
    -- Also enable when MREG present to allow reset of mult carry signal (MSB(a) xnor MSB(b))
    rstallcarryin_i <= SCLR when HAS_GLOBAL_SCLR else SCLRALLCARRYIN;
  end generate opt_rstallcin;

  opt_ctrl : if CARRYINSELREG /= 0 or OPMODEREG /= 0 generate
    cectrl_i  <= CE   when HAS_GLOBAL_CE   else CECTRL;
    rstctrl_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCTRL;
  end generate opt_ctrl;

  opt_alumode : if ALUMODEREG /= 0 generate
    cealumode_i  <= CE   when HAS_GLOBAL_CE   else CEALUMODE;
    rstalumode_i <= SCLR when HAS_GLOBAL_SCLR else SCLRALUMODE;
  end generate opt_alumode;

  opt_inmode : if INMODEREG /= 0 generate
    ceinmode_i  <= CE   when HAS_GLOBAL_CE   else CEINMODE;
    rstinmode_i <= SCLR when HAS_GLOBAL_SCLR else SCLRINMODE;
  end generate opt_inmode;


  i_primitive : DSP48E2
    generic map(
      ACASCREG      => acascreg_i,
      ADREG         => ADREG,
      ALUMODEREG    => ALUMODEREG,
      AREG          => AREG,
      A_INPUT       => ci_a_input,
      BCASCREG      => bcascreg_i,
      BREG          => BREG,
      B_INPUT       => ci_b_input,
      CARRYINREG    => CARRYINREG,
      CARRYINSELREG => CARRYINSELREG,
      CREG          => CREG,
      DREG          => DREG,
      INMODEREG     => INMODEREG,
      MREG          => MREG,
      OPMODEREG     => OPMODEREG,
      PREG          => PREG,
      RND           => RND,
      USE_MULT      => USE_MULT,
      USE_SIMD      => "ONE48",
      USE_WIDEXOR   => USE_WIDEXOR,
      XORSIMD       => XORSIMD,
      AMULTSEL      => ci_amultsel
--      --the following generics are left until needed by a usecase
--    BMULTSEL   : string := "B";
--    PREADDINSEL : string := "A";
--    AUTORESET_PATDET : string := "NO_RESET";
--    AUTORESET_PRIORITY : string := "RESET";
--    MASK       : std_logic_vector (47 downto 0) := X"3FFFFFFFFFFF";
--    PATTERN    : std_logic_vector (47 downto 0) := X"000000000000";
--    SEL_MASK   : string := "MASK";
--    SEL_PATTERN : string := "PATTERN";
--    USE_PATTERN_DETECT : string := "NO_PATDET";
      )
    port map(
      ACIN          => ACIN,
      BCIN          => BCIN,
      ACOUT         => ACOUT,
      BCOUT         => BCOUT,
      PCIN          => PCIN,
      MULTSIGNIN    => MULTSIGNIN,
      MULTSIGNOUT   => MULTSIGNOUT,
      CARRYCASCIN   => CARRYCASCIN,
      CARRYCASCOUT  => CARRYCASCOUT,
      CARRYOUT      => CARRYOUT_i,
      A             => A,
      B             => B,
      C             => C,
      D             => D,
      CARRYIN       => CARRYIN,
      CARRYINSEL    => CARRYINSEL,
      CEA1          => cea1_i,
      CEA2          => cea2_i,
      CEB1          => ceb1_i,
      CEB2          => ceb2_i,
      CEAD          => cead_i,
      CED           => ced_i,
      CEC           => cec_i,
      CECARRYIN     => cecarryin_i,
      CECTRL        => cectrl_i,
      CEALUMODE     => cealumode_i,
      CEINMODE      => ceinmode_i,
      CEM           => cem_i,
      CEP           => cep_i,
      CLK           => CLK,
      OPMODE        => OPMODE,
      ALUMODE       => ALUMODE,
      INMODE        => INMODE,
      RSTA          => rsta_i,
      RSTB          => rstb_i,
      RSTC          => rstc_i,
      RSTD          => rstd_i,
      RSTALLCARRYIN => rstallcarryin_i,
      RSTCTRL       => rstctrl_i,
      RSTALUMODE    => rstalumode_i,
      RSTINMODE     => rstinmode_i,
      RSTM          => rstm_i,
      RSTP          => rstp_i,
      P             => P,
      PCOUT         => PCOUT,
      XOROUT        => XOROUT
      --The following ports are left until a usecase requires them
      --PATTERNBDETECT
      --PATTERNDETECT
      --OVERFLOW
      --UNDERFLOW
      );
  CARRYOUT <= carryout_i(3);

end synth;



-- $Header: /devl/xcs/repo/env/Databases/ip/src2/O/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_4.vhd,v 1.4 2010/12/24 13:38:12 andreww Exp $
-------------------------------------------------------------------------------
--  (c) Copyright 2008,2010 Xilinx, Inc. All rights reserved.
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

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Note: this entity declaration is used as the template of the core's interface
-- by the core_if_bip.pl script. Hence, if you have to alter the interface, alter
-- it here and then run core_if_bip.pl (ensure all files to be altered are writeable)
-------------------------------------------------------------------------------
entity xbip_dsp48_wrapper_v3_0_4 is
  generic (
    --application-specific generics
    AREG : integer := 0;
    BREG : integer := 0;
    MREG : integer := 0;
    CREG : integer := 0;
    PREG : integer := 0;
    CARRYINREG : integer := 0;
    CARRYINSELREG : integer := 0;
    OPMODEREG : integer := 0;
    SUBTRACTREG : integer := 0;
    B_INPUT : integer := 0;              --0 = direct, 1 = cascade
    USE_MULT : boolean := false;
    HAS_GLOBAL_CE : boolean := true;
    HAS_GLOBAL_SCLR : boolean := true
    );
  port (
    CLK       : in  std_logic                     := '1';
    CE        : in  std_logic                     := '1';
    SCLR      : in  std_logic                     := '0';
    PCIN      : in  std_logic_vector(47 downto 0) := (others => '0');
    BCIN      : in  std_logic_vector(17 downto 0) := (others => '0');
    A         : in  std_logic_vector(17 downto 0) := (others => '0');
    B         : in  std_logic_vector(17 downto 0) := (others => '0');
    C         : in  std_logic_vector(47 downto 0) := (others => '0');
    OPMODE    : in  std_logic_vector( 6 downto 0) := (others => '0');
    CARRYIN   : in  std_logic                     := '0';
    SUBTRACT  : in  std_logic                     := '0';
    CARRYINSEL: in  std_logic_vector( 1 downto 0) := (others => '0');
    BCOUT     : out std_logic_vector(17 downto 0) := (others => '0');
    PCOUT     : out std_logic_vector(47 downto 0) := (others => '0');
    P         : out std_logic_vector(47 downto 0) := (others => '0');

    CEA         : in std_logic := '1';
    CEB         : in std_logic := '1';
    CEC         : in std_logic := '1';
    CECARRYIN   : in std_logic := '1';
    CECINSUB    : in std_logic := '1';
    CECTRL      : in std_logic := '1';
    CEM         : in std_logic := '1';
    CEP         : in std_logic := '1';
    SCLRA       : in std_logic := '0';
    SCLRB       : in std_logic := '0';
    SCLRC       : in std_logic := '0';
    SCLRCARRYIN : in std_logic := '0';
    SCLRCTRL    : in std_logic := '0';
    SCLRM       : in std_logic := '0';
    SCLRP       : in std_logic := '0'
    );
end xbip_dsp48_wrapper_v3_0_4;



architecture synth of xbip_dsp48_wrapper_v3_0_4 is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of synth : architecture is "yes";


  -- purpose: validity checking on parameter values
  function fn_check_generics(
    --application-specific generics
    pAREG : integer := 0;
    pBREG : integer := 0;
    pMREG : integer := 0;
    pCREG : integer := 0;
    pPREG : integer := 0;
    pCARRYINREG : integer := 0;
    pCARRYINSELREG : integer := 0;
    pOPMODEREG : integer := 0;
    pSUBTRACTREG : integer := 0;
    pB_INPUT : integer := 0              --0 = direct, 1 = cascade
    )
    return integer is

  begin  -- check_generics
    assert pAREG= 0 or pAREG=1 or pAREG=2
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: AREG out of range 0 to 2."
      severity error;
    assert pBREG= 0 or pBREG=1 or pBREG=2
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: BREG out of range 0 to 2."
      severity error;
    assert pCREG= 0 or pCREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: CREG out of range 0 to 1."
      severity error;
    assert pMREG= 0 or pMREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: MREG out of range 0 to 1."
      severity error;
    assert pPREG= 0 or pPREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: PREG out of range 0 to 1."
      severity error;
    assert pCARRYINREG= 0 or pCARRYINREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: CARRYINREG out of range 0 to 1."
      severity error;
    assert pCARRYINSELREG= 0 or pCARRYINSELREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: CARRYINSELREG out of range 0 to 1."
      severity error;
    assert pOPMODEREG= 0 or pOPMODEREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: OPMODEREG out of range 0 to 1."
      severity error;
    assert pSUBTRACTREG= 0 or pSUBTRACTREG=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: SUBTRACTREG out of range 0 to 1."
      severity error;
    assert pB_INPUT= 0 or pB_INPUT=1
      report "ERROR: xbip_dsp48_wrapper_v3_0_4: B_INPUT out of range 0 to 1."
      severity error;
    return 0;                           --must return a value or modelsim complains.
  end fn_check_generics;
  constant check_generics : integer := fn_check_generics(
    pAREG          => AREG         ,
    pBREG          => BREG         ,
    pMREG          => MREG         ,
    pCREG          => CREG         ,
    pPREG          => PREG         ,
    pCARRYINREG    => CARRYINREG   ,
    pCARRYINSELREG => CARRYINSELREG,
    pOPMODEREG     => OPMODEREG    ,
    pSUBTRACTREG   => SUBTRACTREG  ,
    pB_INPUT       => B_INPUT
    );

  function fn_resolve_b_in(
    p_in : integer
    )
    return string is
  begin
    if p_in = 1 then
      return "CASCADE";
    else
      return "DIRECT";
    end if;
  end function fn_resolve_b_in;
  constant ci_b_input : string := fn_resolve_b_in(
    p_in => B_INPUT
    );

  function fn_resolve_legacy_mode (
    p_mreg : integer;
    p_use_mult : boolean
    )
    return string is
  begin  -- fn_resolve_legacy_mode
    if p_use_mult then
      if p_mreg = 0 then
        return "MULT18X18";
      else
        return "MULT18X18S";
      end if;
    else
      return "NONE";
    end if;
  end fn_resolve_legacy_mode;
  constant ci_legacy_mode : string := fn_resolve_legacy_mode(
    p_mreg     => MREG,
    p_use_mult => USE_MULT
    );

  signal cea_i : std_logic := '0';      -- defaults to 0 for power saving
  signal ceb_i : std_logic := '0';
  signal cec_i : std_logic := '0';
  signal cem_i : std_logic := '0';
  signal cep_i : std_logic := '0';
  signal cecarryin_i : std_logic := '0';
  signal cectrl_i : std_logic := '0';
  signal cecinsub_i : std_logic := '0';

  signal rsta_i : std_logic := '0';      -- defaults to 0 for power saving
  signal rstb_i : std_logic := '0';
  signal rstc_i : std_logic := '0';
  signal rstm_i : std_logic := '0';
  signal rstp_i : std_logic := '0';
  signal rstcarryin_i : std_logic := '0';
  signal rstctrl_i : std_logic := '0';
--not used  signal rstcinsub_i : std_logic := '0';


begin

  opt_a: if AREG /=0 generate
    cea_i  <= CE when HAS_GLOBAL_CE else CEA;
    rsta_i <= SCLR when HAS_GLOBAL_SCLR else SCLRA;
  end generate opt_a;

  opt_b: if BREG /=0 generate
    ceb_i  <= CE when HAS_GLOBAL_CE else CEB;
    rstb_i <= SCLR when HAS_GLOBAL_SCLR else SCLRB;
  end generate opt_b;

  opt_c: if CREG /=0 generate
    cec_i  <= CE when HAS_GLOBAL_CE else CEC;
    rstc_i <= SCLR when HAS_GLOBAL_SCLR else SCLRC;
  end generate opt_c;

  opt_m: if MREG /=0 generate
    cem_i  <= CE when HAS_GLOBAL_CE else CEM;
    rstm_i <= SCLR when HAS_GLOBAL_SCLR else SCLRM;
  end generate opt_m;

  opt_p: if PREG /=0 generate
    cep_i  <= CE when HAS_GLOBAL_CE else CEP;
    rstp_i <= SCLR when HAS_GLOBAL_SCLR else SCLRP;
  end generate opt_p;

  opt_cin: if CARRYINREG /=0 or MREG /= 0 generate
    -- Need to enable when MREG is present, as these signal enable/reset
    -- the registered rounded output of the multiplier too
    cecarryin_i  <= CE when HAS_GLOBAL_CE else CECARRYIN;
    rstcarryin_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCARRYIN;
  end generate opt_cin;

  opt_rstctrl: if CARRYINSELREG /=0 or OPMODEREG /=0 or SUBTRACTREG /=0 generate
    rstctrl_i <= SCLR when HAS_GLOBAL_SCLR else SCLRCTRL;
  end generate opt_rstctrl;

  opt_cectrl: if CARRYINSELREG /=0 or OPMODEREG /=0 generate
    cectrl_i  <= CE  when HAS_GLOBAL_CE else CECTRL;
  end generate opt_cectrl;

  opt_sub: if SUBTRACTREG /=0 or CARRYINREG /= 0 generate
    cecinsub_i  <= CE when HAS_GLOBAL_CE else CECINSUB;
  end generate opt_sub;


  i_primitive : DSP48
    generic map(
      AREG          => AREG         ,
      BREG          => BREG         ,
      MREG          => MREG         ,
      CREG          => CREG         ,
      PREG          => PREG         ,
      CARRYINREG    => CARRYINREG   ,
      CARRYINSELREG => CARRYINSELREG,
      LEGACY_MODE   => ci_legacy_mode,
      OPMODEREG     => OPMODEREG,
      SUBTRACTREG   => SUBTRACTREG,
      B_INPUT       => ci_b_input
      )
    port map(
      P          => P,
      PCOUT      => PCOUT,
      A          => A,
      B          => B,
      BCIN       => BCIN,
      BCOUT      => BCOUT,
      C          => C,
      CARRYIN    => CARRYIN,
      CARRYINSEL => CARRYINSEL,
      CEA        => cea_i,
      CEB        => ceb_I,
      CEC        => cec_I,
      CECARRYIN  => cecarryin_i,
      CECINSUB   => cecinsub_i,
      CECTRL     => cectrl_i,
      CEM        => cem_i,
      CEP        => cep_i,
      CLK        => CLK,
      OPMODE     => OPMODE,
      PCIN       => PCIN,
      RSTA       => rsta_i,
      RSTB       => rstb_i,
      RSTC       => rstc_i,
      RSTCARRYIN => rstcarryin_i,
      RSTCTRL    => rstctrl_i,
      RSTM       => rstm_i,
      RSTP       => rstp_i,
      SUBTRACT   => SUBTRACT
      );

end synth;




