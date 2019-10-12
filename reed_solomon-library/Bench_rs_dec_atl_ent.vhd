-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  testbench is for simulation on the standard
--                 atlantic RS decoder.
--
-- Copyright 2008 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


Entity bench_rs_dec_atl is
	Generic (	check : NATURAL := 6;
		m : NATURAL := 4;
		irrpol : NATURAL := 19; 
		genstart : NATURAL := 0;
		rootspace : NATURAL := 1;
		Erasures : STRING := "false";
		Varcheck : STRING := "false";
		rserr_connect	: STRING := "true";
		err_bit_connect	: STRING := "full_count";
		wide : NATURAL := 3;
		bitwide : NATURAL := 4;
		channel_bypass : BOOLEAN := FALSE;
		seed : NATURAL;
		clock_period : TIME := 30 ns;
		clock_offset : TIME := 2 ns;
		INPUT_FILE   : STRING := "rs_encoded_data.txt";
		BLOCKS_FILE  : STRING := "block_period_stim.txt";
		OUTPUT_FILE  : STRING := "decoded.txt";
		FSUM_IN_FILE: STRING := "summary_input.txt";
		FSUM_OUT_FILE: STRING := "summary_output.txt";
		test_for     : STRING := "BER"
		);
	Port (
		reset  : out Std_Logic;
		clk : out Std_Logic;
		sink_ena		: out Std_Logic; 
		sink_val        : in  Std_Logic; 
		sink_sop        : in  Std_Logic; 
		sink_eop        : in  Std_Logic;
		decoder_2_bench : in Std_Logic_Vector(m downto 1);
		rserr           : in Std_Logic_Vector(m downto 1);
		num_err_sym  : in Std_Logic_Vector(wide downto 1);
		num_err_bit  : in Std_Logic_Vector(bitwide downto 1);
		num_err_bit0 : in Std_Logic_Vector(bitwide downto 1);
		num_err_bit1 : in Std_Logic_Vector(bitwide downto 1);
		decfail     : in std_logic;
		
		bench_2_decoder: out		std_logic_vector (m downto 1);
		bench_2_dec_erasures : out std_logic;
		numcheck	 : out    Std_Logic_Vector(wide downto 1);
		numn       : out    Std_Logic_Vector(m downto 1);
		
		source_ena : in Std_Logic; 
		source_val : out Std_Logic; 
		source_sop : out Std_Logic; 
		source_eop : out Std_Logic;
		bypass : out Std_Logic);
		
end entity bench_rs_dec_atl;	


