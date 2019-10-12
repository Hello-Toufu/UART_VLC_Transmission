-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Copyright 2008 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

Entity testbench is
--START MEGAWIZARD INSERT CONSTANTS
Constant check		 : NATURAL :=  5;
Constant m				 : NATURAL :=  6;
Constant irrpol	   : NATURAL := 91;
Constant genstart  : NATURAL :=  0;
Constant rootspace : NATURAL :=  1;
Constant Varcheck  : STRING := "false";
Constant wide		   : NATURAL := 3;
Constant test_for     : STRING := "BER"
Constant INPUT_FILE   : STRING := "rs_encoded_data.txt";
Constant BLOCKS_FILE  : STRING := "block_period_stim.txt";
Constant FSUM_OUT_FILE : STRING := "summary_output.txt";
--END MEGAWIZARD INSERT CONSTANTS
Constant OUTPUT_FILE  : STRING := "rs_enc_core_data.txt";
Constant clock_period : TIME := 30 ns;
Constant clock_offset : TIME := 2 ns;
end entity testbench;	


library rs_work;

Architecture connect of testbench is


--START MEGAWIZARD INSERT INSTANCE
component enc_component
--END MEGAWIZARD INSERT INSTANCE
	Port (
		clk : in Std_Logic;
		reset : in Std_Logic;
		rsin : in Std_Logic_Vector(m downto 1);  
		
		sink_ena 				: out Std_Logic; 
		sink_val        : in  Std_Logic; 
		sink_sop        : in  Std_Logic; 
		sink_eop        : in  Std_Logic;
		
		rsout : out Std_Logic_Vector(m downto 1); 
		--START MEGAWIZARD INSERT PORTS
		-- numcheck : in Std_Logic_Vector(wide downto 1);
		--END MEGAWIZARD INSERT PORTS

		source_ena : in Std_Logic; 
		source_val : out Std_Logic; 
		source_sop : out Std_Logic; 
		source_eop : out Std_Logic);
END COMPONENT;



COMPONENT Bench_rs_enc_atl is
	Generic (	check : NATURAL := 6;
		m : NATURAL := 4;
		irrpol : NATURAL := 19; 
		genstart : NATURAL := 0;
		rootspace : NATURAL := 1;
		Varcheck : STRING := "false";
		wide : NATURAL;
		seed : NATURAL;
		clock_period : TIME := 30 ns;
		clock_offset : TIME := 2 ns;
		INPUT_FILE   : STRING := "rs_encoded_data.txt";
		BLOCKS_FILE  : STRING := "block_period_stim.txt";
		OUTPUT_FILE  : STRING := "rs_enc_core_data.txt";
		FSUM_OUT_FILE : STRING := "summary_output.txt";
		test_for     : STRING := "BER"
		);
	Port (
		reset  : out Std_Logic;
		clk : out Std_Logic;
		sink_ena 				: out Std_Logic; 
		sink_val        : in  Std_Logic; 
		sink_sop        : in  Std_Logic; 
		sink_eop        : in  Std_Logic;
		encoder_2_bench : in Std_Logic_Vector(m downto 1);
		
		Bench_2_encoder: out		std_logic_vector (m downto 1);
		numcheck	 : out    Std_Logic_Vector(wide downto 1);
		
		source_ena : in  Std_Logic; 
		source_val : out Std_Logic; 
		source_sop : out Std_Logic; 
		source_eop : out Std_Logic);
END COMPONENT;


Constant seed : natural := 1;

signal clk, reset : Std_Logic;

Signal Bench_2_encoder : std_logic_vector (m downto 1);
Signal encoder_2_bench : Std_Logic_Vector(m downto 1);
Signal numcheck        : Std_Logic_Vector(wide downto 1);

Signal ena_rs_ben, val_ben_rs, sop_ben_rs, eop_ben_rs : Std_Logic;
signal ena_ben_rs, val_rs_ben, sop_rs_ben, eop_rs_ben : Std_Logic;


begin

--START MEGAWIZARD INSERT WRAPPER
wrapper_inst : entity rs_work.dec_component
--END MEGAWIZARD INSERT WRAPPER
	Port map (
		clk => clk, reset => reset, 

		sink_ena => ena_rs_ben,
		sink_val => val_ben_rs, 
		sink_sop => sop_ben_rs, 
		sink_eop => eop_ben_rs, 

		source_ena => ena_ben_rs,
		source_val => val_rs_ben,
		source_sop => sop_rs_ben,
		source_eop => eop_rs_ben,

		--START MEGAWIZARD INSERT MAP
		--numcheck => numcheck,
		--END MEGAWIZARD INSERT MAP
		rsin => bench_2_encoder,
		rsout => encoder_2_bench
 		);


test_controller : entity rs_work.Bench_rs_enc_atl(Bench)
	Generic map (
		check => check,	m => m,	irrpol => irrpol, 
		genstart => genstart,	rootspace => rootspace,
		Varcheck => Varcheck,
		wide => wide, 
		seed => seed, 
		clock_period => clock_period,
		clock_offset => clock_offset,
		INPUT_FILE => INPUT_FILE,
		BLOCKS_FILE => BLOCKS_FILE,
		OUTPUT_FILE => OUTPUT_FILE,
		FSUM_OUT_FILE => FSUM_OUT_FILE,
		test_for => test_for		)
	Port map (
		clk => clk, reset => reset,

		source_ena => ena_rs_ben,
		source_val => val_ben_rs,
		source_sop => sop_ben_rs,
		source_eop => eop_ben_rs,

		sink_ena => ena_ben_rs,
		sink_val => val_rs_ben,
		sink_sop => sop_rs_ben,
		sink_eop => eop_rs_ben,
---
		encoder_2_bench => encoder_2_bench,
		--------
		bench_2_encoder => bench_2_encoder,
		numcheck => numcheck
		);

end architecture connect;	


configuration Cfg_testbench of testbench is
  for connect
  end for;
end Cfg_testbench;

