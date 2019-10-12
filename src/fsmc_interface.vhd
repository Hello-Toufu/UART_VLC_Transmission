----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/01/20 15:05:14
-- Design Name: 
-- Module Name: rs_encode - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsmc_interface is
	GENERIC (FSMC_FRAME_LEN_8bit : INTEGER := 1024);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rd_count  :  in STD_LOGIC_VECTOR(12 DOWNTO 0);
           rd_data   :  in STD_LOGIC_VECTOR(7 DOWNTO 0);
--           rd_empty     : in STD_LOGIC;
           rd_en_out     : out STD_LOGIC;
           rdfull     : in STD_LOGIC;
		   
		   
		   
		   fsmc_rd      : in  STD_LOGIC;
		   fsmc_ready    : out STD_LOGIC;
           fsmc_data     : out STD_LOGIC_VECTOR(7 DOWNTO 0);
			  
			  LED_head_wrong : out STD_LOGIC;   --- 20171227 15:39 
			  LED_head_wrong2 : out STD_LOGIC   --- 20171228 11:00 
			  
			  
--           total_count_out     : out STD_LOGIC_VECTOR(20 DOWNTO 0)
           );
end fsmc_interface;

architecture Behavioral of fsmc_interface is


	signal   LED_head_wrong_temp : STD_LOGIC;
	signal	rd_en     	:	STD_LOGIC;
	signal	rd_en_delay	:	STD_LOGIC;
	signal   first_syn   :  STD_LOGIC;
	
	signal	fsmc_rd_delay	:	STD_LOGIC;
	signal	fsmc_rd_temp1	:	STD_LOGIC;
	signal	fsmc_rd_temp2	:	STD_LOGIC;
	signal state  :	std_logic_vector(1 downto 0):= "00";
	signal fsmc_rd_count  :	std_logic_vector(15 downto 0);
--	signal total_count  :	std_logic_vector(20 downto 0);
      
begin
	rd_en_out <= rd_en;
	fsmc_data <=  rd_data;
	LED_head_wrong <= LED_head_wrong_temp;
--	total_count_out <= total_count;
	----delay
	process(clk)
    begin
        if(reset='1') then
            fsmc_rd_delay <= '0';
				fsmc_rd_temp1 <=  '0';
				fsmc_rd_temp2 <=  '0';
        elsif(rising_edge(clk)) then
			fsmc_rd_temp1 <= fsmc_rd;
			fsmc_rd_temp2 <= fsmc_rd_temp1;
			fsmc_rd_delay <= fsmc_rd_temp2;

        end if;
    end process;
    
	STATE_CODE: process (clk)
	begin
		if(reset='1') then
			   state <= (others=>'0');
			   fsmc_ready <= '0';
				rd_en <= '0';
		elsif(rising_edge(clk)) then
			case (state) is
						
				when "00" =>  -- 
					if (  rd_count >= FSMC_FRAME_LEN_8bit or rdfull = '1') then   
						state <= "01";
						fsmc_ready <= '1';
						rd_en <= '1';
					else
						state <= "00";
						rd_en <= '0';
					end if;
					
				when "01" =>  -- 
					if (  fsmc_rd_delay = '0' and fsmc_rd_temp2 = '1') then   -- rise edge
						state <= "10";
						fsmc_ready <= '0';
						rd_en <= '1';
					else
						state <= "01";
						rd_en <= '0';
					end if;
					
				when "10" =>  -- 
					if ( fsmc_rd_count >= FSMC_FRAME_LEN_8bit ) then   
						state <= "00";
						rd_en <= '0';
					elsif ( fsmc_rd_count < FSMC_FRAME_LEN_8bit-1  and fsmc_rd_delay = '0' and fsmc_rd_temp2 = '1') then   
					
						rd_en <= '1';
						state <= "10";
					else
						rd_en <= '0';
						state <= "10";
					end if;

				when others =>
					state <= "00";
			end case;
		end if;
	end process;    
    
--	process (clk)
--	begin
--		if(reset='1') then
--			rd_en <= '0';
--		elsif(rising_edge(clk)) then
--			if ( fsmc_rd_delay = '1' and fsmc_rd_temp2 = '0') then
--				rd_en <= '1';
--			else
--				rd_en <= '0';
--			end if;
--			
--		
--		end if;
--	end process;						


	process (clk)
	begin
		if(reset='1') then
			fsmc_rd_count <= (others=>'0');
--			total_count <= (others=>'0');
		elsif(rising_edge(clk)) then

			
			if ( fsmc_rd_delay = '0' and fsmc_rd_temp2 = '1') then
				fsmc_rd_count <= fsmc_rd_count + '1';
--				total_count <= total_count + '1';
			elsif ( fsmc_rd_count >= FSMC_FRAME_LEN_8bit  or state = "00") then
				fsmc_rd_count <= (others=>'0');				
			end if;			
		end if;
	end process;


	-- rd_en_delay  20171227 15:05
	process (clk)
	begin
		if(reset='1') then
			rd_en_delay <= '0';
		elsif(rising_edge(clk)) then
			rd_en_delay <= rd_en;
		end if;
	end process;	
	
   --(fsmc_rd_delay = '1' and fsmc_rd_count = 0 and rd_data /= x"37DE") or
   --to show the first data is 20171227 15:39 
	process (clk)
	begin
		if(reset='1') then
			first_syn <= '0';
		elsif(rising_edge(clk)) then
			if (  (rd_en = '0' and rd_en_delay = '1' and fsmc_rd_count = 0 and rd_data = x"37DE" )  ) then
				first_syn <= '1';

			end if;
		end if;
	end process;
	--(rd_en = '0' and rd_en_delay = '1' and fsmc_rd_count = 0 and (rd_data /= x"37DE" and  first_syn = '1')) or
	process (clk)
	begin
		if(reset='1') then
			LED_head_wrong_temp <= '0';
		elsif(rising_edge(clk)) then
			if (    (rd_en = '0' and rd_en_delay = '1' and fsmc_rd_count = 1 and (rd_data /= x"FF00"  and  first_syn = '1'))  ) then
				LED_head_wrong_temp <= '1';

			end if;
		end if;
	end process;
	-- or (rd_en = '0' and rd_en_delay = '1' and fsmc_rd_count = 1 and (rd_data /= x"FF00"  and  first_syn = '1') and LED_head_wrong_temp = '1')
	process (clk)
	begin
		if(reset='1') then
			LED_head_wrong2 <= '0';
		elsif(rising_edge(clk)) then
			if (  (rd_en = '0' and rd_en_delay = '1' and fsmc_rd_count = 0 and (rd_data /= x"37DE" and  first_syn = '1') and LED_head_wrong_temp = '1')  ) then
				LED_head_wrong2 <= '1';

			end if;
		end if;
	end process;	
	
end Behavioral;
