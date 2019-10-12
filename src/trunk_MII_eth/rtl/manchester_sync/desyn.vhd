LIBRARY ieee;                             
USE ieee.std_logic_1164.all;              
use ieee.std_logic_arith.all;             
use ieee.std_logic_signed.all;

ENTITY desyn IS
	GENERIC (FRAME_LEN : INTEGER := 5120);
	PORT	(
		clk				: 	in	STD_LOGIC;
		reset		   	: 	in STD_LOGIC;
		data_in			:	in std_logic;
		
		data_out			:	out std_logic;
		sop_out			:	out std_logic;
		eop_out			:	out std_logic;
		en_out			:	out std_logic;
		MF_corr_value_out	:	out std_logic_vector(15 downto 0);
		count_temp_out		:	out std_logic_vector(15 downto 0);
		packet_num_out		:	out std_logic_vector(15 downto 0);
		data_in_delay_out	:	out std_logic;
		clk_div8_out	: 	out	STD_LOGIC;
		syn_header_error_out	: 	out	STD_LOGIC;
		i_threshold		:	in std_logic_vector(15 downto 0)
	);
END desyn;

--##################################################################################
ARCHITECTURE Behavioral OF desyn IS
	------------------------------------------------------------------------------
	-- 1. Component declaration for shift_register(depth:72*8. to remove the syn_header)
	------------------------------------------------------------------------------
--	COMPONENT shift_reg
--	PORT (
--		shiftin 		: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--		clock 	: IN STD_LOGIC;
--		shiftout 		: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
--	);
--	END COMPONENT;

	------------------------------------------------------------------------------
	-- 2. Component declaration for matching_filter
	------------------------------------------------------------------------------
	COMPONENT fir
	PORT (
    rst_n : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    filter_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    filter_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
	END COMPONENT;

	------------------------------------------------------------------------------
	-- n. Signals Declaration
	------------------------------------------------------------------------------
	----Input signals
	signal data_delay_in 	:	std_logic;
	signal data_delay_out	:	std_logic;		
	signal data_delay_vector:	std_logic_vector(16 downto 0);		
	signal signed_data_in	:	std_logic_vector(1 downto 0);
	----Matching_filter signals
	signal MF_corr_value		:	STD_LOGIC_VECTOR(15 DOWNTO 0);
	----Counter signals
	signal count_temp			:	std_logic_vector(15 downto 0);
	signal packet_num			:	std_logic_vector(15 downto 0);
	----Max_shift_register signals
	TYPE max_shiftreg_type   IS ARRAY (0 TO  12)  OF STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal max_shiftreg	:	max_shiftreg_type;
	
	signal data_in_d1		:	std_logic;
	signal data_in_d2		:	std_logic;
	signal data_in_d3		:	std_logic;
	
	signal syn_header_found_p		:	std_logic;
	signal syn_header_found_n		:	std_logic;
	signal syn_header_error			:	std_logic;
	signal syn_header_flag_p_n		:	std_logic;
	
	signal sop			:	std_logic;
	signal eop			:	std_logic;
	signal en			:	std_logic;
	signal data			:	std_logic;
	signal clk_div8			:	std_logic;
	signal count_s2p		:	std_logic_vector(3 downto 0);
	
	--constant FRAME_LEN	:	integer := 5120;
--##################################################################################
begin
	------------------------------------------------------------------------------
	-- 0. Data_in delay
	------------------------------------------------------------------------------
	process(clk,reset)
	begin
		if(reset='1') then
			data_in_d1	<= '0';
			data_in_d2	<= '0';
			data_in_d3	<= '0';
		elsif(rising_edge(clk)) then
			data_in_d1	<=	data_in;
			data_in_d2	<=	data_in_d1;
			data_in_d3	<=	data_in_d2;
		end if;
	end process;
	------------------------------------------------------------------------------
	-- 1. Data_in go through shift register
	------------------------------------------------------------------------------

	process(clk,reset)
	begin
		if(reset='1')	then
			data_delay_vector <=(others=>'0');
		elsif(rising_edge(clk)) then
			data_delay_vector(0) <= data_delay_in;
			data_delay_vector(16 downto 1) <= data_delay_vector(15 downto 0);
		end if;
	end process;

	data_delay_in<=data_in_d3;
--	shift_reg_inst : delay1 #(1)
--	PORT MAP (
--		i_data 		=> data_delay_in,
--		i_clk	=> clk,
--		o_data_d1 		=> data_delay_out
--	);
	data_delay_out		<=data_delay_vector(16);
	data_in_delay_out	<=data_delay_vector(16);
	------------------------------------------------------------------------------
	-- 2. Signed data maping: 0-->01; 1-->11
	------------------------------------------------------------------------------
	process(clk,reset)
	begin
		if(reset='1') then
			signed_data_in<="00";
		elsif(rising_edge(clk)) then
			if(data_in_d3='1') then
				signed_data_in<="01";
			else
				signed_data_in<="11";
			end if;
		end if;
	end process;

	------------------------------------------------------------------------------
	-- 3. Instantiate matching_filer  
	------------------------------------------------------------------------------
	matching_filter_inst : fir
	PORT MAP (
		rst_n => not reset,
        clk						=> clk,
		filter_in		=> signed_data_in,
		filter_out		=> MF_corr_value
	);
	-- Output MF_corr_value
	-- process(clk,reset)
	-- begin
		-- if(reset='1')	then
			-- MF_corr_value_out<=(others=>'0');
		-- elsif(rising_edge(clk)) then
			-- MF_corr_value_out <= MF_corr_value;
		-- end if;
	-- end process;
	MF_corr_value_out <= MF_corr_value;  --  72 + (IP latency) 86 +1 (first data is in)
	------------------------------------------------------------------------------
	-- 4. syn_header capture
	------------------------------------------------------------------------------
	---- MF_corr_value shift_reg
	max_add_shiftreg: FOR i IN 0 TO 11 GENERATE       -- match data shiftreg
	process(clk,reset)
		begin
			if(reset='1')	then
                max_shiftreg(i+1)<=(others=>'0');
            elsif(rising_edge(clk)) then
				max_shiftreg(i+1) <= max_shiftreg(i);
			end if;		
		end process;
	end generate max_add_shiftreg;
	
	process(clk,reset)
	begin
		if(reset='1')	then
			max_shiftreg(0)<=(others=>'0');
		elsif(rising_edge(clk)) then
			max_shiftreg(0) <= MF_corr_value;
		end if;
	end process;
	
	---- Search for max value, positive
	process(clk,reset)
	begin
		if(reset='1')	then
			syn_header_found_p	<='0';
		elsif(rising_edge(clk)) then
			if( (max_shiftreg(6)>max_shiftreg(2)) and
				(max_shiftreg(6)>max_shiftreg(3)) and (max_shiftreg(6)>max_shiftreg(4)) and (max_shiftreg(6)>=max_shiftreg(5)) AND
				(max_shiftreg(6)>=max_shiftreg(7)) and (max_shiftreg(6)>max_shiftreg(8)) and (max_shiftreg(6)>max_shiftreg(9)) AND
				(max_shiftreg(6)>max_shiftreg(10)) and
				(max_shiftreg(6)> i_threshold)) then  -- threshold: 
				syn_header_found_p	<='1';
			else  
				syn_header_found_p	<='0';
			end if;		
		end if;
	end process;	
	---- Search for max value, negtive
	process(clk,reset)
	begin
		if(reset='1')	then
			syn_header_found_n	<='0';
		elsif(rising_edge(clk)) then
			if( (max_shiftreg(6)<max_shiftreg(2)) and
				(max_shiftreg(6)<max_shiftreg(3)) and (max_shiftreg(6)<max_shiftreg(4)) and (max_shiftreg(6)<=max_shiftreg(5)) AND
				(max_shiftreg(6)<=max_shiftreg(7)) and (max_shiftreg(6)<max_shiftreg(8)) and (max_shiftreg(6)<max_shiftreg(9)) AND
				(max_shiftreg(6)<max_shiftreg(10)) and
				( not(max_shiftreg(6))> i_threshold )) then  -- threshold: 
				syn_header_found_n	<='1';
			else  
				syn_header_found_n	<='0';
			end if;		
		end if;
	end process;	
	---- Search for max value, error
	process(clk,reset)
	begin
		if(reset='1')	then
			syn_header_error	<='0';
		elsif(rising_edge(clk)) then
			if( (max_shiftreg(6)>max_shiftreg(2)) and
				(max_shiftreg(6)>max_shiftreg(3)) and (max_shiftreg(6)>max_shiftreg(4)) and (max_shiftreg(6)>max_shiftreg(5)) AND
				(max_shiftreg(6)>max_shiftreg(7)) and (max_shiftreg(6)>max_shiftreg(8)) and (max_shiftreg(6)>max_shiftreg(9)) AND
				(max_shiftreg(6)>max_shiftreg(10)) and
				(max_shiftreg(6)> 400 and max_shiftreg(6)< 450)) then  -- threshold:
				
				syn_header_error	<='1';
			else  
				syn_header_error	<='0';
			end if;		
		end if;
	end process;	
	syn_header_error_out <= syn_header_error;
	---- find the syn and reset the counter
	process(reset,clk)
	begin
		if(reset='1') then
			count_temp	<=	"0111111111111111";  --65535
			packet_num	<=	(others=>'0');
		elsif(rising_edge(clk)) then
			-- if data field of the frame has same value with syn_header, count will not reset to zero
			if( (syn_header_found_p = '1' or syn_header_found_n = '1') and count_temp >= FRAME_LEN ) then  
				count_temp<=(others=>'0');         --  datadelay ~= 72 (header length) + 86 (IP latency) + 1 (first data is in) + 7 (max_shiftreg delay)
				if packet_num < "0111111111111111" then
					packet_num <= packet_num + '1';
				end if;
			elsif(count_temp<"0111111111111111") then  --65535
				count_temp<=count_temp+'1';
			end if;
		end if;
	end process;

	---- syn_header_flag_p_n == 0 means positive, ==1 means negtive
	process(reset,clk)
	begin
		if(reset='1') then
			syn_header_flag_p_n	<='0';
		elsif(rising_edge(clk)) then
			if( syn_header_found_p = '1'  ) then 
				syn_header_flag_p_n	<='0';
			elsif(syn_header_found_n = '1') then  
				syn_header_flag_p_n	<='1';
			end if;
		end if;
	end process;
	
	count_temp_out <= count_temp;		
	packet_num_out <= packet_num;
	---- Generate	sop/eop/en signals --208 *8 * 2 * 8 = 26624   40 *8 * 2 * 8 = 5120
	process(reset,clk)
	begin
		if(reset='1') then
			sop		<='0';
			eop		<='0';
			en		<='0';
			data	<= '0';
		elsif(rising_edge(clk)) then
			if(conv_integer(count_temp)>=0 		and conv_integer(count_temp)<=7) then
				sop<='1';
			else
				sop<='0';
			end if;
			if(conv_integer(count_temp)>=(FRAME_LEN-8) 	and conv_integer(count_temp)<FRAME_LEN) then
				eop<='1';
			else
				eop<='0';
			end if;
			if(conv_integer(count_temp)>=0 		and conv_integer(count_temp)<FRAME_LEN) then
				en<='1';
				if (syn_header_flag_p_n = '1') then
					data <= not data_delay_out;
				else
					data <= data_delay_out;
				end if;
			else
				data <= '0';
				en<='0';
			end if;
		end if;
	end process;
	
	------------------------------------------------------------------------------
	-- divide the clk to 8
	------------------------------------------------------------------------------
	clk_div8_out <= clk_div8;
	-- count: 10
	process(clk, reset)
	begin
		if(reset='1') then
			count_s2p<="0111";   --4096 20190929 clk out should not wait for data in
		elsif(rising_edge(clk)) then
			if(syn_header_found_p = '1' or syn_header_found_n = '1' or count_s2p>=7) then
				count_s2p<=(others=>'0');
			elsif count_s2p<7 then
				count_s2p<=count_s2p+'1';
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if(reset='1') then
                clk_div8<='0';
        elsif(rising_edge(clk)) then
		  
			if(count_s2p>=3 and count_s2p<=6) then  -- 
				clk_div8<='1';
			else
				clk_div8<='0';
			end if;
		end if;
	end process;	
	
	process(clk_div8)
	begin
		if(reset='1') then
			sop_out		<='0';
			eop_out		<='0';
			en_out		<='0';
			data_out	<='0';
        elsif(rising_edge(clk_div8)) then
			sop_out	<=	sop	    ;
			eop_out	<=	eop	    ;
			en_out	<=	en	    ;
			data_out<=	data;
		end if;
	end process;		
end Behavioral;
