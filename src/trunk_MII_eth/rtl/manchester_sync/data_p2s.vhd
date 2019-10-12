----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:54:33 11/28/2013 
-- Design Name: 
-- Module Name:    data_p2s - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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

entity data_p2s is
	port	(
		clk			:	in std_logic;
		reset		   :	in std_logic;
		data_in		:	in std_logic_vector(15 downto 0);
		data_en		:	in std_logic;
--		data_sop		:	in std_logic;
--		data_eop		:	in std_logic;
		
		serial_data_out	:	out std_logic;
		serial_en_out		:	out std_logic;
		serial_sop_out		:	out std_logic;
		serial_eop_out		:	out std_logic
	);
end data_p2s;

--##################################################################################
architecture Behavioral of data_p2s is
	------------------------------------------------------------------------------
	-- 1. Signals Declaration
	------------------------------------------------------------------------------
	signal count_p2s		:	std_logic_vector(3 downto 0);

	signal parallel_data_temp	:	std_logic_vector(15 downto 0);
	signal parallel_data_temp1	:	std_logic_vector(15 downto 0);
	signal parallel_en_temp		:	std_logic;
	signal parallel_en_temp1	:	std_logic;
	signal serial_data_temp		:	std_logic;
	signal serial_en_temp		:	std_logic;
	signal serial_sop_temp		:	std_logic;
	signal serial_sop_temp1		:	std_logic;
	signal serial_eop_temp		:	std_logic;	
	signal serial_eop_temp1		:	std_logic;	

--##################################################################################
begin
	------------------------------------------------------------------------------
	-- p2s:
	------------------------------------------------------------------------------
	
	process(clk, reset)
	begin
		if(reset='1') then
			parallel_data_temp<=(others=>'0');
			parallel_data_temp1<=(others=>'0');
			parallel_en_temp<='0';
			parallel_en_temp1<='0';
		elsif(rising_edge(clk)) then
			parallel_data_temp<=data_in;			----delay one clock
			parallel_data_temp1<=parallel_data_temp;	----delay one clock
			parallel_en_temp<=data_en;				----delay one clock
			parallel_en_temp1<=parallel_en_temp;	----delay one clock
		end if;
	end process;
	
	-- counter: 10 
	process(clk, reset)
	begin
		if(reset='1') then
			count_p2s<="1111";
		elsif(rising_edge(clk)) then
			if((parallel_en_temp='1' and parallel_en_temp1='0') or count_p2s=15) then   -- when data start or 0~9
				count_p2s<="0000";
			elsif(parallel_en_temp1='1' and count_p2s<15)	then
				count_p2s<=count_p2s+'1';	----P2S counter
			end if;
		end if;
	end process;

	-- serial_data and serial_en
	process(clk, reset)
	begin
		if(reset='1') then
			serial_data_temp<='0';
			serial_en_temp<='0';
		elsif(rising_edge(clk)) then
			if(parallel_en_temp1='1') then
				serial_data_temp<=parallel_data_temp1(conv_integer(count_p2s));
				serial_en_temp<=parallel_en_temp1;
			else
				serial_data_temp<=not serial_data_temp;
				serial_en_temp<='0';
			end if;
		end if;
	end process;

	-- serial_sop and serial_eop
	process(clk, reset)
	begin
		if(reset='1') then
			serial_sop_temp<='0';
			serial_sop_temp1<='0';
			serial_eop_temp<='0';
		elsif(rising_edge(clk)) then
			serial_sop_temp1<=serial_sop_temp;  ----delay one clock
			serial_eop_temp1<=serial_eop_temp;	----delay one clock
			if(parallel_en_temp='1' and parallel_en_temp1='0') then	-- detect the rising_edge of parallel_en
				serial_sop_temp<='1';
				serial_eop_temp<='0';
			elsif(parallel_en_temp='0' and parallel_en_temp1='1') then--detect the falling_edge of parallel_en
				serial_sop_temp<='0';
				serial_eop_temp<='1';
			else
				serial_sop_temp<='0';
				serial_eop_temp<='0';
			end if;
		end if;
	end process;

	-- output serial data
	process(clk)
	begin
		if(rising_edge(clk)) then
			serial_data_out<=serial_data_temp;
			serial_en_out<=serial_en_temp;
			serial_sop_out<=serial_sop_temp1;
			serial_eop_out<=serial_eop_temp1;
		end if;
	end process;

end Behavioral;

