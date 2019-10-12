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
Constant keysize	 : STRING  := "half";
Constant Erasures  : STRING := "false";
Constant Varcheck  : STRING := "false";
Constant wide		   : NATURAL := 3;
Constant bitwide   : NATURAL := 5;
Constant inv_file	 : STRING := "inv_6_91.hex";
Constant first_alpha_file	 : STRING := "alpha_6_91_0.hex";
Constant rserr_connect : STRING  := "true";
Constant err_bit_connect : STRING  := "split_count";
Constant test_for     : STRING := "BER"
Constant INPUT_FILE   : STRING := "rs_encoded_data.txt";
Constant BLOCKS_FILE  : STRING := "block_period_stim.txt";
Constant FSUM_IN_FILE : STRING := "summary_input.txt";
Constant FSUM_OUT_FILE : STRING := "summary_output.txt";
--END MEGAWIZARD INSERT CONSTANTS
Constant OUTPUT_FILE  : STRING := "decoded.txt";
Constant clock_period : TIME := 30 ns;
Constant clock_offset : TIME := 2 ns;
Constant channel_bypass : BOOLEAN := FALSE;

end entity testbench;	


library rs_work;

Architecture connect of testbench is


--START MEGAWIZARD INSERT INSTANCE
component dec_component
--END MEGAWIZARD INSERT INSTANCE
	Port (
		clk : in Std_Logic;
		reset : in Std_Logic;
		bypass : in Std_Logic;
		rsin : in Std_Logic_Vector(m downto 1);  
		
		sink_ena : out Std_Logic; 
		sink_val        : in  Std_Logic; 
		sink_sop        : in  Std_Logic; 
		sink_eop        : in  Std_Logic;
		
		rsout : out Std_Logic_Vector(m downto 1);
		num_err_sym : out Std_Logic_Vector(wide downto 1);
		--START MEGAWIZARD INSERT PORTS
		--eras_sym     : in std_logic;
		num_err_bit  : out Std_Logic_Vector(bitwide downto 1);
		num_err_bit0 : out Std_Logic_Vector(bitwide downto 1);
		num_err_bit1 : out Std_Logic_Vector(bitwide downto 1);
		-- numcheck : in Std_Logic_Vector(wide downto 1);
		-- numn     : in Std_Logic_Vector(m downto 1);
		-- rserr : out Std_Logic_Vector(m downto 1);
		--END MEGAWIZARD INSERT PORTS

		decfail : out Std_Logic;
		source_ena : in Std_Logic; 
		source_val : out Std_Logic; 
		source_sop : out Std_Logic; 
		source_eop : out Std_Logic);
END COMPONENT;



COMPONENT Bench_rs_dec_atl is
	Generic (	check : NATURAL := 6;
		m : NATURAL := 4;
		irrpol : NATURAL := 19; 
		genstart : NATURAL := 0;
		rootspace : NATURAL := 1;
		Erasures : STRING := "false";
		Varcheck : STRING := "false";
		rserr_connect	: STRING := "true";
		err_bit_connect	: STRING := "full_count";
		wide : NATURAL;
		bitwide : NATURAL;
		channel_bypass : BOOLEAN := FALSE;
		seed : NATURAL;
		clock_period : TIME := 30 ns;
		clock_offset : TIME := 2 ns;
		INPUT_FILE   : STRING := "rs_encoded_data.txt";
		BLOCKS_FILE  : STRING := "block_period_stim.txt";
		OUTPUT_FILE  : STRING := "decoded.txt";
		FSUM_IN_FILE : STRING := "summary_input.txt";
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
		decoder_2_bench : in Std_Logic_Vector(m downto 1);
		rserr           : in std_logic_vector(m downto 1);
		num_err_sym  : in Std_Logic_Vector(wide downto 1);
		num_err_bit  : in Std_Logic_Vector(bitwide downto 1);
		num_err_bit0 : in Std_Logic_Vector(bitwide downto 1);
		num_err_bit1 : in Std_Logic_Vector(bitwide downto 1);
		decfail     : in std_logic;
		
		Bench_2_decoder: out		std_logic_vector (m downto 1);
		Bench_2_dec_erasures : out std_logic;
		numcheck	 : out    Std_Logic_Vector(wide downto 1);
		numn    	 : out    Std_Logic_Vector(m downto 1);
		
		source_ena : in Std_Logic; 
		source_val : out Std_Logic; 
		source_sop : out Std_Logic; 
		source_eop : out Std_Logic;
		bypass : out Std_Logic);
END COMPONENT;


Constant seed : natural := 1;

signal clk, reset : Std_Logic;

Signal Bench_2_decoder : std_logic_vector (m downto 1);
Signal decoder_2_bench, rserr, numn : Std_Logic_Vector(m downto 1);
Signal num_err_sym, numcheck : Std_Logic_Vector(wide downto 1);
Signal num_err_bit, num_err_bit0, num_err_bit1 : Std_Logic_Vector(bitwide downto 1);
Signal decfail, eras_sym, bypass : std_logic;

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

		------
		bypass => bypass,
		rsin => bench_2_decoder,
		rsout => decoder_2_bench,
		num_err_sym => num_err_sym,
		--START MEGAWIZARD INSERT MAP
		--num_err_bit => num_err_bit,
		num_err_bit0 => num_err_bit0,
		num_err_bit1 => num_err_bit1,
		numcheck => numcheck,
		numn => numn,
		rserr => rserr,
		eras_sym => eras_sym,
		--END MEGAWIZARD INSERT MAP
		decfail => decfail
 		);

test_controller : entity rs_work.Bench_rs_dec_atl(Bench)
	Generic map (
		check => check,	m => m,	irrpol => irrpol, 
		genstart => genstart,	rootspace => rootspace,
		Erasures => Erasures,	Varcheck => Varcheck,
		rserr_connect => rserr_connect,
		err_bit_connect => err_bit_connect,
		wide => wide, bitwide => bitwide,
		seed => seed, channel_bypass => channel_bypass,
		clock_period => clock_period,
		clock_offset => clock_offset,
		INPUT_FILE => INPUT_FILE,
		BLOCKS_FILE => BLOCKS_FILE,
		OUTPUT_FILE => OUTPUT_FILE,
		FSUM_IN_FILE => FSUM_IN_FILE,
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
		decoder_2_bench => decoder_2_bench,
		num_err_sym => num_err_sym,
		num_err_bit0 => num_err_bit0,
		num_err_bit1 => num_err_bit1,
		num_err_bit => num_err_bit,
		rserr => rserr,
		decfail => decfail,
		Bench_2_dec_erasures => eras_sym,
		bypass => bypass,
		numcheck => numcheck,
		numn => numn,
				
		--------
		bench_2_decoder => bench_2_decoder
		);
	
end architecture connect;	


configuration cfg_testbench of testbench is
  for connect
  end for;
end cfg_testbench;

