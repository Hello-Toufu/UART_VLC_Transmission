----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:51 12/04/2013 
-- Design Name: 
-- Module Name:    add_synheader - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:
--		one frame = synheader(72bit) + 32 RS_block(32*255) = 8232 bit
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_synheader_p is
	PORT
	(
		clk			: 	IN	STD_LOGIC;
		reset		   : 	in STD_LOGIC;
		no_header_data_in		:	in  STD_LOGIC_VECTOR(15 DOWNTO 0);
		no_header_en_in			:	in std_logic;

		

		
		with_header_data_out		:	out STD_LOGIC_VECTOR(15 DOWNTO 0);
		with_header_en_out		:	out std_logic
	);
end add_synheader_p;

--##################################################################################
architecture Behavioral of add_synheader_p is

	signal data_in_delay1		:	std_logic_vector(15 downto 0);
	signal data_in_delay2		:	std_logic_vector(15 downto 0);
	signal data_in_delay3		:	std_logic_vector(15 downto 0);
	signal data_in_delay4		:	std_logic_vector(15 downto 0);
	signal data_in_delay5		:	std_logic_vector(15 downto 0);

	signal count_temp		:	std_logic_vector(2 downto 0);

	signal en_delay_out1		:	std_logic;
	signal en_delay_out2		:	std_logic;
	signal en_delay_out3		:	std_logic;
	signal en_delay_out4		:	std_logic;
	signal en_delay_out5		:	std_logic;
	signal en_delay_out6		:	std_logic;
	
	constant syn_header	:	std_logic_vector(63 downto 0) := "1001010101101010010110100110101010100110010101100101100110011010";

--##################################################################################
begin


	----Delay
	process(reset,clk)
	begin
		if(reset='1') then
			en_delay_out1<='0';
            en_delay_out2<='0';
            en_delay_out3<='0';
			en_delay_out4<='0';
            en_delay_out5<='0';
            en_delay_out6<='0';
		elsif(rising_edge(clk)) then
		    en_delay_out1<=no_header_en_in;
            en_delay_out2<=en_delay_out1;
            en_delay_out3<=en_delay_out2;
            
		    en_delay_out4<=en_delay_out3;
            en_delay_out5<=en_delay_out4;
            en_delay_out6<=en_delay_out5;
		end if;
	end process;
	----Delay
	process(reset,clk)
	begin
		if(reset='1') then
			data_in_delay1<=(others=>'0');
            data_in_delay2<=(others=>'0');
            data_in_delay3<=(others=>'0');
			data_in_delay4<=(others=>'0');
            data_in_delay5<=(others=>'0');
		elsif(rising_edge(clk)) then
		    data_in_delay1<=no_header_data_in;
            data_in_delay2<=data_in_delay1;
            data_in_delay3<=data_in_delay2;
            
		    data_in_delay4<=data_in_delay3;
            data_in_delay5<=data_in_delay4;
		end if;
	end process;
				 
	----Counter	: 
	process(clk,reset)
	begin
		if(reset='1') then
			count_temp<=(others=>'1');  --
		elsif(rising_edge(clk)) then
			if(no_header_en_in='1' and en_delay_out1='0') then
				count_temp<=(others=>'0');
			elsif(count_temp<=3) then  --
				count_temp<=count_temp+'1';
			end if;
		end if;
	end process;


	----generate output data 
	process(clk,reset)
	begin
		if(reset='1') then
			with_header_data_out<=(others=>'0');
			with_header_en_out<='0';
		elsif(rising_edge(clk)) then
			if(count_temp = 0 ) then  --0 to 71
				with_header_data_out<=syn_header(15 downto 0);	--output synheader
				with_header_en_out<='1';
			elsif(count_temp = 1 ) then  --0 to 71
				with_header_data_out<=syn_header(31 downto 16);	--output synheader
				with_header_en_out<='1';
			elsif(count_temp = 2 ) then  --0 to 71
				with_header_data_out<=syn_header(47 downto 32);	--output synheader
				with_header_en_out<='1';
			elsif(count_temp = 3 ) then  --0 to 71
				with_header_data_out<=syn_header(63 downto 48);	--output synheader
				with_header_en_out<='1';
			elsif(count_temp>=4 and en_delay_out5 = '1') then	--  
				with_header_data_out<=data_in_delay5;	--output data
				with_header_en_out<='1';
			elsif(  en_delay_out6= '1'  and en_delay_out5 = '0') then	--  000
                 with_header_data_out <= "1010001010100010";    --output end data
                 with_header_en_out <='1';                
			
			else	
					with_header_data_out<=(others=>'0');
					with_header_en_out<='0';

			end if;
		end if;
	end process;


end Behavioral;

