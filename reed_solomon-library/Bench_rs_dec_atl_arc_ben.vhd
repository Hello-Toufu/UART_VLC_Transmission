-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
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
use ieee.std_logic_arith.all;
use ieee.math_real.all;
Use Std.TextIO.All;


Architecture bench of bench_rs_dec_atl is

Constant time_lapse_max : TIME := 1 ms;
Constant gf_m : NATURAL := 2**m-1;

type NATURAL_ARRAY is array(NATURAL RANGE <>) of NATURAL;
SubType codeword is NATURAL_ARRAY(gf_m downto 0);

Type six_codewords is ARRAY(0 to 5) of codeword;

signal keep_clk_running : BOOLEAN := TRUE;
signal expecting_sop : BOOLEAN := TRUE;
signal data_cw_pipe, err_cw_pipe : six_codewords;
signal decfail_cw_pipe : Std_Logic_Vector(0 to 5);
signal numerr_cw_pipe, size_cw_pipe, check_cw_pipe : NATURAL_ARRAY(0 to 5);
signal numerrbit0_cw_pipe, numerrbit1_cw_pipe, check_eras_diff_cw_pipe : NATURAL_ARRAY(0 to 5);
signal pos_ptr_data_sig : NATURAL; 
signal fail_detect, fail_correct, misleading_decfail : Std_Logic;
signal fail_bit_err, fail_rserr : std_logic;
signal count_fail_correct, count_fail_rserr : NATURAL;
signal error_mark_signal : Std_Logic_Vector(gf_m downto 0) := (others => '0');
signal eras_mark_signal  : Std_Logic_Vector(gf_m downto 0) := (others => '0');
signal reset_int, clk_int : Std_Logic := '1';
Signal dav_source_gen, decfail_q, val_source_q, data_val_shunt : Std_Logic;
Signal channel_2_source, file_2_channel : std_logic_vector (m downto 1);
Signal decoder_2_bench_q, rserr_q : std_logic_vector(m downto 1);


Type atl_buffer_fsm is (S0, out_idle, out_active, out_hold);

signal atl_buffer_state, atl_buffer_next_state : atl_buffer_fsm;

Signal time_lapse : TIME;

signal sop_source_pipe, eop_source_pipe : Std_Logic_Vector(4 downto 1);
Signal bench_2_decoder_shunt : Std_Logic_Vector(m downto 1);
Signal eras_sym_shunt  : Std_Logic;
signal sop_source_gen, eop_source_gen : Std_Logic;
Signal sop_source_shunt, eop_source_shunt : Std_Logic;
Signal allow_val_assert, allow_ena_assert : Std_Logic;
signal data_available : BOOLEAN := TRUE;
signal ena_sink_q, data_val_pipe : Std_Logic;
Signal sink_val_q, sink_sop_q, sink_eop_q : Std_Logic;
signal sink_eop_counter, source_eop_counter : NATURAL := 0;
Signal dav_source_int, ena_data_sourcing : Std_Logic;
signal eras_source, eras_2_channel, continuous_ena_ok, continuous_val_ok : std_logic;

file FSUM_IN:  TEXT open WRITE_MODE is FSUM_IN_FILE;
file FSUM_OUT: TEXT open WRITE_MODE is FSUM_OUT_FILE;


function "xor" (L, R: natural) return natural is
	variable tmp : UNSIGNED(11 downto 0);
	variable tmp_L, tmp_R : std_logic_vector(11 downto 0);
	variable result : natural;
begin
  tmp_L := CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => L, SIZE => 12), SIZE => 12);
	tmp_R := CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => R, SIZE => 12), SIZE => 12);
	tmp := UNSIGNED(tmp_L xor tmp_R);
	result := natural(CONV_INTEGER(tmp));
	return result;
end "xor";

-- L is symbol, R is error value
function bit_err_0(sym, err: natural) return natural is
	variable tmp_sym, tmp_err: UNSIGNED(11 downto 0);
	variable result : natural;
begin
	result:=0;
	tmp_sym := CONV_UNSIGNED(ARG => sym, SIZE => 12);
	tmp_err := CONV_UNSIGNED(ARG => err, SIZE => 12);
	for I in 0 to 11 loop
		if tmp_err(I)='1' and tmp_sym(I)='0' then
			result := result+1;
		end if;
	end loop;
	return result;
end bit_err_0;

-- L is symbol, R is error value
function bit_err_1(sym, err : natural) return natural is
	variable tmp_sym, tmp_err: UNSIGNED(11 downto 0);
	variable result : natural;
begin
	result:=0;
	tmp_sym := CONV_UNSIGNED(ARG => sym, SIZE => 12);
	tmp_err := CONV_UNSIGNED(ARG => err, SIZE => 12);
	for I in 0 to 11 loop
		if tmp_err(I)='1' and tmp_sym(I)='1' then
			result := result+1;
		end if;
	end loop;
	return result;
end bit_err_1;



procedure gen_error_info(
						variable src_eop_cnt, n, pos_ptr, num_errors, num_eras: in natural;
						variable error_mark, eras_mark: inout Std_Logic_Vector;
						constant m : natural;
						constant channel_bypass : boolean) is 
	variable min_val, temp_pos, n_era, n_err : natural; 
	variable seed1, seed2: positive := 1;
	variable coin : REAL;
	variable l: line;
	Constant str1: String(1 to 8) := " errors.";
	Constant str2: String(1 to 10) := " erasures.";
	Constant str4: String(1 to 25) := "Introducing error on pos ";
	Constant str3: String(1 to 33) := "Introducing error-erasure on pos ";
	Constant strC: String(1 to 37) := "Introducing NON-error-erasure on pos ";
	Constant str5: String(1 to  9) := "Sequence ";
begin
	assert (n <= error_mark'high)
	report "block length greater than gf_m"
	severity ERROR;

	error_mark(error_mark'range) := (others=>'0');
	eras_mark(eras_mark'range) := (others=>'0');

	Write(l, str5);
	Write(l, src_eop_cnt);
	WriteLine(FSUM_IN, l);
	Write(l, num_errors);
	Write(l, str1);
	WriteLine(FSUM_IN, l);
	if num_eras > 0 then
		Write(l, num_eras);
		Write(l, str2);
		WriteLine(FSUM_IN, l);
	end if;
	uniform(seed1, seed2, coin);
	temp_pos := natural(floor(coin * real(2*n/3)))+1; -- for burst distribution of errors
	n_era := num_eras;
	n_err := num_errors;
	for i in 1 to num_errors+num_eras loop
	-- at the begining and in the middle
	-- codeword goes from 1 to n
		if not channel_bypass then
			if pos_ptr=0 then
				if( i mod 2 = 0 ) then
					temp_pos := i/2;
				else
					temp_pos := (n/2+i/2);
				end if;
			elsif pos_ptr=1 then
				-- Errors at the end
				temp_pos := n-i;
			elsif pos_ptr=2 then
				-- Errors at the begining and at the end
				if( i mod 2 = 0 ) then
					temp_pos := i/2;
				else
					temp_pos := n-i/2;
				end if;
			elsif pos_ptr=3 then
				--  burst of errors
				if temp_pos=n then
					temp_pos := 1;
				else
					temp_pos := temp_pos+1;
				end if;
			elsif pos_ptr>=4 then
				-- dispersed errors
				while eras_mark(temp_pos)='1' or error_mark(temp_pos)='1'
							                              or eras_mark(temp_pos)='H' loop
					uniform(seed1, seed2, coin);
					temp_pos := natural(floor(coin * real(n/2)))+1;
				end loop;
			end if;
		end if;
		if not channel_bypass then
			if((n_err>0) and (n_era>0)) then
				uniform(seed1, seed2, coin);
				if (coin>0.5) then   -- introduce erasure
					uniform(seed1, seed2, coin); -- flip coin again
					if (coin > 0.5) then  -- introduce error-erasure
						eras_mark(temp_pos) := '1';
						Write(l, str3);
						Write(l, temp_pos);
						WriteLine(FSUM_IN, l);
					else
						eras_mark(temp_pos) := 'H';
						Write(l, strC);
						Write(l, temp_pos);
						WriteLine(FSUM_IN, l);
					end if;
					n_era := n_era-1;
				else  -- introduce error
					error_mark(temp_pos) := '1';
					n_err := n_err-1;
					Write(l, str4);
					Write(l, temp_pos);
					WriteLine(FSUM_IN, l);
				end if;
			elsif n_err=0 and (n_era>0) then
				uniform(seed1, seed2, coin); -- flip coin again
				if (coin>0.5) then  -- introduce error-erasure
					eras_mark(temp_pos) := '1';
					Write(l, str3);
					Write(l, temp_pos);
					WriteLine(FSUM_IN, l);
				else
					eras_mark(temp_pos) := 'H';
					Write(l, strC);
					Write(l, temp_pos);
					WriteLine(FSUM_IN, l);
				end if;
				n_era := n_era-1;
			elsif (n_err > 0) and (n_era=0) then
				error_mark(temp_pos) := '1';
				Write(l, str4);
				Write(l, temp_pos);
				WriteLine(FSUM_IN, l);
				n_err := n_err-1;
			end if;
			-----------
		end if;
	end loop;
end gen_error_info;



begin

clk <= clk_int;
reset <= reset_int;

	Osc: process
	begin

	while keep_clk_running loop
		clk_int <= '1';
		wait for clock_period/2;  -- half de clock period
		clk_int <= '0';
		wait for clock_period/2;
	end loop; 	
	wait;

	end process Osc;
		

stim_atlantic: process

	Constant str8: String(1 to 50) := "Parameters: check m irrpol genstart rootspace seed";

	FILE F: TEXT open READ_MODE is INPUT_FILE;
	FILE FBLK: TEXT open READ_MODE is BLOCKS_FILE;
	variable L, L_numcheck, L_bypass, L_size_of_block : Line;
	variable seed1, seed2: positive := 1;
	variable x: REAL;
	variable good_read, last_symbol : BOOLEAN;
	variable cursor, pos_ptr_data, number_of_blocks : NATURAL;
	variable file_2_channel_var : Std_Logic_Vector(m downto 1);
	variable symbol_in_block, block_size, numcheck_var, bypass_var : natural;
	variable symbol_val, wr_ptr_var, num_errors, num_eras : natural;
	variable delivered_val, error_val, min_val, source_eop_cnt_var : natural;
	variable tmp_biterr0, tmp_biterr1, accum_biterr0, accum_biterr1 : NATURAL;
	variable error_mark, eras_mark : Std_Logic_Vector(gf_m downto 0);
	variable eras_2_channel_var : std_logic;

begin

READLINE(FBLK, L_bypass);
READ(L_bypass, number_of_blocks, good_read);
READLINE(FBLK, L_bypass);
READLINE(FBLK, L_numcheck);
READLINE(FBLK, L_size_of_block);

Write(l, str8);
WriteLine(FSUM_IN, l);
Write(l, check);
write(l, ' ');
Write(l, m);
write(l, ' ');
Write(l, irrpol);
write(l, ' ');
Write(l, genstart);
write(l, ' ');
Write(l, rootspace);
write(l, ' ');
Write(l, seed);
Writeline(FSUM_IN, l);

READ(L_bypass, bypass_var, good_read);
if bypass_var=0 then
	bypass <= '0';
else
	bypass <= '1';
end if;
last_symbol := FALSE;
source_eop_cnt_var := 0;
reset_int <= '1';
dav_source_gen <= '0';
file_2_channel <= (others => '0');
eras_2_channel <= '0';
data_cw_pipe <= (others => (others => 0));
err_cw_pipe <= (others => (others => 0));
numerrbit0_cw_pipe <= (others => 0); 
numerrbit1_cw_pipe <= (others => 0);
check_eras_diff_cw_pipe <= (others => 0);
size_cw_pipe <= (others => 0);
check_cw_pipe <= (others => 0);
decfail_cw_pipe <= (others => '0');
numerr_cw_pipe <= (others => 0);
error_mark_signal <= (others => '0');
pos_ptr_data := 0;
pos_ptr_data_sig <= 0;
numcheck <= (others => '0');
numn     <= (others => '0');

sop_source_gen <= '0';
eop_source_gen <= '0';
symbol_in_block := 1;
wait for Clock_Period;
reset_int <= '0' after Clock_Offset;

dav_source_gen <= '1' after Clock_Offset;

main: while (not ENDFILE(F)) and keep_clk_running loop
	cursor := 0;
	READLINE(F, L);
	if symbol_in_block=1 then
		accum_biterr0 := 0;
		accum_biterr1 := 0;
		READ(L_size_of_block, block_size, good_read);
		if not good_read then
			exit;
		else
			wr_ptr_var := block_size;
			size_cw_pipe(pos_ptr_data) <= block_size;
		end if;
		READ(L_numcheck, numcheck_var, good_read);
		if not good_read then
			exit;
		else
			assert (numcheck_var <= check)
				report "Variable Check value is greater than parameter Check"
				severity ERROR;
			check_cw_pipe(pos_ptr_data) <= numcheck_var;
		end if;
		numcheck <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => numcheck_var, SIZE => wide), SIZE => wide);
		numn     <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => block_size  , SIZE => m   ), SIZE => m   );
		if (numcheck_var > block_size-3) and Erasures="false" then
			min_val := block_size-3;
		elsif Erasures="false" then
			min_val := numcheck_var;
		else
			min_val := 3*numcheck_var/5;
		end if;
		num_errors := 0;
		num_eras := 0;
		while ((num_errors=0 and num_eras=0 and not channel_bypass) or 
		       (num_errors+num_eras > (block_size/2)) or (num_errors+num_eras > numcheck_var)) loop 
			uniform(seed1, seed2, x);
			if not channel_bypass then
				num_errors := natural(floor(x* real(min_val))+1.0);
				if Erasures="true" then
					uniform(seed1, seed2, x);
					num_eras := natural(floor(x* real(min_val))+1.0);
				else
					num_eras := 0;
				end if;
			else
				num_errors := 0;
				num_eras := 0;
			end if;
		end loop;
		check_eras_diff_cw_pipe(pos_ptr_data) <= numcheck_var - num_eras;
		gen_error_info(source_eop_cnt_var, block_size, pos_ptr_data,
									 num_errors, num_eras, error_mark, eras_mark, m, channel_bypass);
		error_mark_signal <= error_mark after clock_offset;
		eras_mark_signal <= eras_mark after clock_offset;
		if(2*num_errors + num_eras <= numcheck_var) then
			decfail_cw_pipe(pos_ptr_data) <= '0' after clock_offset;
			numerr_cw_pipe(pos_ptr_data) <= num_errors+num_eras after clock_offset;
		else   -- decfail expected
			decfail_cw_pipe(pos_ptr_data) <= '1' after clock_offset;
			numerr_cw_pipe(pos_ptr_data) <= (check+1)/2 after clock_offset;
		end if;
		
	end if;
	nested_1: while (cursor < 20) and keep_clk_running loop

		if ena_data_sourcing='1' then
			READ(L, symbol_val, good_read);
			if error_mark(wr_ptr_var)='1' or eras_mark(wr_ptr_var)='1' then
   			-- introduzing error
				uniform(seed1, seed2, x);
				error_Val := natural(floor(x * real(gf_m/2)))+1;
				-- this error values are not galois field error values
				delivered_val := symbol_val xor error_val; --Galois addition
				tmp_biterr1 := bit_err_0(symbol_val, error_val); --bit error count 0 (error) -> 1 (correct)
				tmp_biterr0 := bit_err_1(symbol_val, error_val); --bit error count 1 (error) -> 0 (correct)
				err_cw_pipe(pos_ptr_data)(wr_ptr_var) <= error_val;
				if eras_mark(wr_ptr_var)='1' then
					-- introduzing error-erasure
					eras_2_channel_var := '1';
				else
					eras_2_channel_var := '0';
				end if;
			elsif eras_mark(wr_ptr_var)='H' then
   			-- introduzing NON-error-erasures
   			delivered_val := symbol_val;
				eras_2_channel_var := '1';
				err_cw_pipe(pos_ptr_data)(wr_ptr_var) <= 0;
				tmp_biterr0 := 0;
				tmp_biterr1 := 0;
			else
				delivered_val := symbol_val;
				eras_2_channel_var := '0';
				err_cw_pipe(pos_ptr_data)(wr_ptr_var) <= 0;
				tmp_biterr0 := 0;
				tmp_biterr1 := 0;
			end if;
			file_2_channel_var(m downto 1):= 
					CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => delivered_val, SIZE => m), SIZE => m);
			data_cw_pipe(pos_ptr_data)(wr_ptr_var) <= symbol_val;
			if wr_ptr_var > 0 then
				wr_ptr_var := wr_ptr_var-1;
			end if;
			accum_biterr0 := accum_biterr0+tmp_biterr0;
			accum_biterr1 := accum_biterr1+tmp_biterr1;
			file_2_channel(m downto 1) <= file_2_channel_var(m downto 1) after Clock_Offset;
			eras_2_channel <= eras_2_channel_var after clock_offset;
			file_2_channel_var := (others => '0');
			if symbol_in_block = 1 then
				sop_source_gen <= '1' after Clock_Offset;
				eop_source_gen <= '0' after Clock_Offset;
				wait for Clock_Period;
			elsif symbol_in_block = block_size then
				sop_source_gen <= '0' after Clock_Offset;
				eop_source_gen <= '1' after Clock_Offset;
				READ(L_bypass, bypass_var, good_read);
				if bypass_var=0 then
					bypass <= '0';
				else
					bypass <= '1';
				end if;
				wait for Clock_Period;
				if decfail_cw_pipe(pos_ptr_data)='1' then 
					numerrbit0_cw_pipe(pos_ptr_data) <= 0;
					numerrbit1_cw_pipe(pos_ptr_data) <= 0;
				else
					numerrbit0_cw_pipe(pos_ptr_data) <= accum_biterr0;
					numerrbit1_cw_pipe(pos_ptr_data) <= accum_biterr1;
				end if;
				pos_ptr_data := (pos_ptr_data + 1) mod 6;
				pos_ptr_data_sig <= pos_ptr_data; -- signal for tracking at simulation
				source_eop_counter <= source_eop_counter + 1;
				source_eop_cnt_var := source_eop_cnt_var + 1;
			else
				sop_source_gen <= '0' after Clock_Offset;
				eop_source_gen <= '0' after Clock_Offset;
				wait for Clock_Period;
			end if;
	  	cursor := cursor + 1;
	  	if symbol_in_block = block_size then
			  symbol_in_block := 1;
				cursor := 20;  -- that will provoke exit of nested_1 while loop
			else
				symbol_in_block := symbol_in_block + 1;
			end if;
			
			exit when good_read=FALSE;
		else
			wait for Clock_Period;
		end if;
	
	end loop nested_1;

end loop main;

if ena_data_sourcing/='1' and keep_clk_running then
	wait until ena_data_sourcing='1';
	wait for Clock_Period;
end if;
dav_source_gen <= '0' after Clock_Offset;
if ena_data_sourcing/='1' and keep_clk_running then
	wait until ena_data_sourcing='1';
else
	wait for Clock_Period;
end if;
if ena_data_sourcing/='1' and keep_clk_running then
	wait until ena_data_sourcing='1';
else
	wait for Clock_Period;
end if;

if keep_clk_running then
	if sink_eop_counter < source_eop_counter then
		wait until sink_eop_q='1';
	end if;
	wait for 2*Clock_Period;
end if;
data_available <= FALSE;
wait;

end process stim_atlantic;


channel: process(reset_int, clk_int, file_2_channel, eras_2_channel)  

	variable file_2_channel_var : Std_Logic_Vector(m downto 1) := (others => '0');
	variable eras_2_channel_var : std_logic;
	
begin
	if reset_int='1' then
		file_2_channel_var := (others => '0');
		eras_2_channel_var := '0';
		channel_2_source <= (others => '0');
		dav_source_int <= '0';
	else
		file_2_channel_var := file_2_channel;
		eras_2_channel_var := eras_2_channel;
	end if;
	
	if Rising_edge(clk_int) then
		if ena_data_sourcing='1' then
			dav_source_int <= dav_source_gen;
			channel_2_source <= file_2_channel_var after clock_offset;
			eras_source <= eras_2_channel_var after clock_offset;
		end if;
	end if;
			
end process channel;


monitor: Process

	Constant str1: String := "Data is decoded successfully.  All errors in input bitstream are detected and/or corrected.";
	Constant str6: String := "Failed to detect errors because difference between number of erasures and check symbols is small: ";
	Constant str10:String := "Unpredictable results. Decoder fails to detect and correct errors.";
	
	variable rd_ptr_var, cw_ptr_var, cw_ptr_var_one_less: natural;
	variable count_fail_correct_var, count_fail_rserr_var : NATURAL;
	variable l : line;
	variable err_count : integer; 
	
begin
	err_count := 0;
	rd_ptr_var := 0;
	cw_ptr_var := 0;
	expecting_sop <= TRUE;
	fail_detect <= '0';
	fail_correct <= '0';
	misleading_decfail <= '0';
	fail_rserr <= '0';
	fail_bit_err <= '0';
	count_fail_correct <= 0;
	count_fail_rserr <= 0;
	count_fail_correct_var := 0;
	count_fail_rserr_var := 0;
	
	wait until sink_val_q'event;
	
	reading: while keep_clk_running loop
		--sink_val_q, sink_sop_q, sink_eop_q
		if expecting_sop and sink_val_q='1' and sink_sop_q='0' then
			ASSERT FALSE
			REPORT "Error: Sink_sop not asserted when expected" severity Warning;
				
		elsif expecting_sop and sink_val_q='1' and sink_sop_q='1' then
			expecting_sop <= FALSE after Clock_Offset;
			rd_ptr_var := size_cw_pipe(cw_ptr_var);
		
			if decfail_cw_pipe(cw_ptr_var)=decfail_q then
				fail_detect <= '0';
				misleading_decfail <= '0';
				if decfail_q='0' then
					if numerr_cw_pipe(cw_ptr_var)=natural(conv_integer(arg => unsigned(num_err_sym))) and 
					 data_cw_pipe(cw_ptr_var)(rd_ptr_var)=natural(conv_integer(arg => unsigned(decoder_2_bench_q))) then
						fail_correct <= '0';
					else
						fail_correct <= '1';
						count_fail_correct_var := count_fail_correct_var + 1;
						count_fail_correct <= count_fail_correct_var;
					end if;
					
					if (rserr_connect="true") and err_cw_pipe(cw_ptr_var)(rd_ptr_var)=natural(conv_integer(arg => unsigned(rserr_q))) then
						fail_rserr <= '0';
					elsif rserr_connect="true" then
						fail_rserr <= '1';
						count_fail_rserr_var := count_fail_rserr_var + 1;
						count_fail_rserr <= count_fail_rserr_var;
					else
						fail_rserr <= '0';
					end if;
				else  -- decfail = 1
					fail_correct <= '0';
					fail_rserr <= '0';
					fail_bit_err <= '0';
				end if;
			else
				fail_correct <= '0';
				fail_rserr <= '0';
				fail_bit_err <= '0';
				if decfail_q='1' then
					fail_detect <= '0';
					misleading_decfail <= '1';
				else
					misleading_decfail <= '0';
					fail_detect <= '1';
				end if;
			end if;

			cw_ptr_var_one_less := (cw_ptr_var + 5) mod 6;
			
			if (err_bit_connect="full_count") and (decfail_cw_pipe(cw_ptr_var)=decfail_q or decfail_q='1') and
				 (numerrbit0_cw_pipe(cw_ptr_var) + numerrbit1_cw_pipe(cw_ptr_var))=natural(conv_integer(arg => unsigned(num_err_bit))) then
				fail_bit_err <= '0';
			elsif (err_bit_connect="full_count") and not (decfail_cw_pipe(cw_ptr_var)=decfail_q or decfail_q='1') then
				fail_bit_err <= '0';
			elsif (err_bit_connect="split_count") and fail_detect='0' and
				 numerrbit0_cw_pipe(cw_ptr_var_one_less)=natural(conv_integer(arg => unsigned(num_err_bit0))) and
				 numerrbit1_cw_pipe(cw_ptr_var_one_less)=natural(conv_integer(arg => unsigned(num_err_bit1))) then
				fail_bit_err <= '0';
			elsif (err_bit_connect="split_count") and fail_detect='1' then
				fail_bit_err <= '0';
			elsif (err_bit_connect="false") then
				fail_bit_err <= '0';
			else
				fail_bit_err <= '1';
			end if;
			rd_ptr_var := rd_ptr_var-1;
			
		elsif sink_val_q='1' and sink_eop_q='1' then
			expecting_sop <= TRUE after Clock_Offset;
			if decfail_q='0' and fail_detect='0' and data_cw_pipe(cw_ptr_var)(rd_ptr_var)=natural(conv_integer(arg => unsigned(decoder_2_bench_q))) then
				fail_correct <= '0';
			elsif decfail_q='0' and fail_detect='0' then
				fail_correct <= '1';
				count_fail_correct_var := count_fail_correct_var + 1;
				count_fail_correct <= count_fail_correct_var;
			end if;
			
			if decfail_q='0' and fail_detect='0' and (rserr_connect="true") and 
			   err_cw_pipe(cw_ptr_var)(rd_ptr_var)=natural(conv_integer(arg => unsigned(rserr_q))) then
				fail_rserr <= '0';
			elsif decfail_q='0' and fail_detect='0' and (rserr_connect="true") then
				fail_rserr <= '1';
				count_fail_rserr_var := count_fail_rserr_var + 1;
				count_fail_rserr <= count_fail_rserr_var;
			else 
			  fail_rserr <= '0';
			end if;
			
			if rd_ptr_var/=1 then
				ASSERT FALSE
				REPORT "Error: Sink_eop asserted NOT when expected" severity Warning;
			end if;
			
			if misleading_decfail='1' then
				err_count := err_count + 1;
			end if;
			
			if fail_detect='1' then
				if check_eras_diff_cw_pipe(cw_ptr_var) > 6 then
					err_count := err_count + 1;
				else
		  			write(l, str6);
					write(l, check_eras_diff_cw_pipe(cw_ptr_var));
		  			Writeline(FSUM_OUT, l);
				end if;
			end if;
			
			if fail_bit_err='1' then
				err_count := err_count + 1;
	  		end if;
			
			if count_fail_correct_var > 0 then
				err_count := err_count + 1;
	  			count_fail_correct_var := 0;
				count_fail_correct <= count_fail_correct_var;
			end if;
			
			if count_fail_rserr_var > 0 then
				err_count := err_count + 1;
	  			count_fail_rserr_var := 0;
				count_fail_rserr <= count_fail_rserr_var;
			end if;
			
			cw_ptr_var := (cw_ptr_var + 1) mod 6;
			
		elsif sink_val_q='1' and sink_eop_q='0' and rd_ptr_var=1 then
			ASSERT FALSE
			REPORT "Error: Sink_eop NOT asserted when expected" severity Warning;
			
		elsif sink_val_q='1' then
			if decfail='0' and fail_detect='0' and data_cw_pipe(cw_ptr_var)(rd_ptr_var)=natural(conv_integer(arg => unsigned(decoder_2_bench_q))) then
				fail_correct <= '0';
			elsif decfail='0' and fail_detect='0' then
				fail_correct <= '1';
				count_fail_correct_var := count_fail_correct_var + 1;
				count_fail_correct <= count_fail_correct_var;
			end if;
			rd_ptr_var := rd_ptr_var-1;
		end if;
		
		wait until rising_edge(clk_int) or not keep_clk_running;
		
	end loop;
	
	if err_count >= 1 then
		write(l, str10);
		Writeline(OUTPUT, l);
		write(l, str10);
		Writeline(FSUM_OUT, l);
	else
		write(l, str1);
		Writeline(OUTPUT, l);
		write(l, str1);
		Writeline(FSUM_OUT, l);
	end if;
	
	FILE_CLOSE(FSUM_OUT);
	FILE_CLOSE(FSUM_IN);
	wait;
	
end process monitor;


end_block_stim: Process 
begin

	while keep_clk_running loop
	  wait until Falling_edge(sink_eop_q);
		sink_eop_counter <= sink_eop_counter + 1;
	  wait for Clock_Period;
  end loop; 	
  wait;
end process end_block_stim;


monitor_toggling_activity: Process(clk_int, reset_int,  
								sink_val_q, sink_sop_q, sink_eop_q, data_available)
begin
	if reset_int='1' then
		time_lapse <= 0 ns;
	elsif sink_val_q'event or 
				sink_sop_q'event or sink_eop_q'event or data_available'event then
		time_lapse <= 0 ns;
	elsif rising_edge(clk_int) then
		time_lapse <= time_lapse + Clock_Period;
	end if;
end process monitor_toggling_activity;


clk_running_ctrl: Process(reset_int, source_eop_counter, 
												sink_eop_counter, data_available, time_lapse)
begin
	if reset_int='1' then
		keep_clk_running <= TRUE;
	elsif (source_eop_counter = sink_eop_counter) and not data_available then
		keep_clk_running <= FALSE after 3*clock_Period;
	elsif (time_lapse > time_lapse_max) then
		ASSERT FALSE
				REPORT "Reached time_lapse_max without activity, probable hang up" severity Error;
		keep_clk_running <= FALSE;
	end if;
end process clk_running_ctrl;

-- START ATLANTIC SOURCE CONTROL LOGIC 

clk_FSM_atl: Process (clk_int, reset_int)
	begin
		if reset_int='1' then
			atl_buffer_state <= out_idle;
		elsif Rising_edge(clk_int) then
			atl_buffer_state <= atl_buffer_next_state;
		end if;
end process clk_FSM_atl;


FSM_out : process(atl_buffer_state, dav_source_int, source_ena)
	variable atl_buffer_next_state_var : atl_buffer_fsm;
begin
  atl_buffer_next_state_var := atl_buffer_state;
  case atl_buffer_state is
	
	when S0 =>
		allow_val_assert <= '0';
		ena_data_sourcing <= '0';
		atl_buffer_next_state_var := out_idle;
	when out_idle =>
		allow_val_assert <= dav_source_int;
		ena_data_sourcing <= '1';
		if dav_source_int='1' and source_ena='1' then
			atl_buffer_next_state_var := out_active;
		elsif dav_source_int='1' and source_ena='0' then
			atl_buffer_next_state_var := out_hold;
		end if;
	when out_hold =>
		allow_val_assert <= '1';
		ena_data_sourcing <= '0';
		if dav_source_int='1' and source_ena='1' then 
			atl_buffer_next_state_var := out_active;
		elsif dav_source_int='0' and source_ena='1' then 
			atl_buffer_next_state_var := out_idle;
		end if;
	when out_active =>
		allow_val_assert <= dav_source_int;
		ena_data_sourcing <= '1';
		if source_ena='0' then
      atl_buffer_next_state_var := out_hold;
		elsif dav_source_int='0' then
      atl_buffer_next_state_var := out_idle;
    end if;
	-- coverage off
	when others => 
		allow_val_assert <= '0';
		ena_data_sourcing <= '0';
		atl_buffer_next_state_var := out_idle;
	-- coverage on
	end case;
	atl_buffer_next_state <= atl_buffer_next_state_var;
end process FSM_out;


-- latching atlantic ports for slave source to be connected to master sink
clk_atl_sink: Process (clk_int, reset_int)
	begin
		if reset_int='1' then
			ena_sink_q	 <= '0';
			val_source_q <= '0';
		elsif Rising_edge(clk_int) then
			ena_sink_q <= source_ena;
			val_source_q <= source_ena and allow_val_assert after Clock_Offset;
		end if;
end process clk_atl_sink;


clk_atl_data_sink: Process (clk_int, reset_int)

variable bench_2_decoder_d : Std_Logic_Vector(m downto 1);
variable eras_sym_d, data_val_d  : Std_Logic;
variable sop_source_d, eop_source_d : Std_Logic;

	begin
		if reset_int='1' then
			bench_2_decoder_shunt <= (others => '0');
			eras_sym_shunt	 <= '0';
			sop_source_pipe <= (others => '0');
			eop_source_pipe <= (others => '0');
			sop_source_shunt <= '0';
			eop_source_shunt <= '0';
			bench_2_decoder <= (others => '0');
			bench_2_dec_erasures <= '0';
			data_val_pipe <= '0';
			data_val_shunt <= '0';
		elsif Rising_edge(clk_int) then
			if ena_data_sourcing='1' then
				bench_2_decoder_d := channel_2_source;  
				eras_sym_d := eras_source;
				data_val_d := dav_source_int;
				sop_source_d := sop_source_pipe(3);
				eop_source_d := eop_source_pipe(3);
			else
				bench_2_decoder_d := bench_2_decoder_shunt; 
				eras_sym_d := eras_sym_shunt;
				data_val_d := data_val_shunt;
				sop_source_d := sop_source_shunt;
				eop_source_d := eop_source_shunt;
			end if;
			if ena_data_sourcing='1' then
				sop_source_pipe(3) <= sop_source_gen; 
				eop_source_pipe(3) <= eop_source_gen;
				bench_2_decoder_shunt <= channel_2_source;  
				eras_sym_shunt <= eras_source;
				data_val_shunt <= dav_source_int;
				sop_source_shunt <= sop_source_pipe(3);
				eop_source_shunt <= eop_source_pipe(3);
			end if;
			if source_ena='1' then
				bench_2_decoder <= bench_2_decoder_d after Clock_Offset;
				bench_2_dec_erasures <= eras_sym_d after Clock_Offset;
				data_val_pipe <= data_val_d;
				sop_source_pipe(4) <= sop_source_d  after Clock_Offset;
				eop_source_pipe(4) <= eop_source_d  after Clock_Offset;
			end if;
		end if;
end process clk_atl_data_sink;

source_val <= val_source_q and data_val_pipe;
source_sop <= sop_source_pipe(4);
source_eop <= eop_source_pipe(4);

-- END ATLANTIC SOURCE CONTROL LOGIC

clk_atl_source: Process (clk_int, reset_int)
	begin
		if reset_int='1' then
			sink_ena	 <= '0';
			sink_val_q <= '0';
			sink_sop_q <= '0';
			sink_eop_q <= '0';
			decoder_2_bench_q <= (others => '0');
			rserr_q <= (others => '0');
			decfail_q <= '0';
		elsif Rising_edge(clk_int) then
			sink_ena   <= allow_ena_assert after Clock_Offset;
			sink_val_q <= sink_val;
			sink_sop_q <= sink_sop;
			sink_eop_q <= sink_eop and sink_val;
			decoder_2_bench_q <= decoder_2_bench;
			rserr_q <= rserr;
			decfail_q <= decfail;
		end if;
end process clk_atl_source;


ena_source_process: process
begin
	allow_ena_assert <= '1';
	wait;
end process ena_source_process;

end architecture bench;	


