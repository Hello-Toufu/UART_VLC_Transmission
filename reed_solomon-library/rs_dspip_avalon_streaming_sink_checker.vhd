-- (C) 2001-2010 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
-- $RCSfile: rs_dspip_avalon_streaming_sink_checker.vhd $
-- $Source: /ip/rs/Units/Avalon_units/rs_dspip_avalon_streaming_sink_checker.vhd $
--
-- $Revision: #1 $
-- $Date: 2010/04/02 $
-- Check in by     : $Author: max $
-- Author   :  Fong Day Yann
--
-- Project      :  Avalon Sink Interface checker with ready_latency=1
--
-- Description : 
--
-- This interface is capable of performing checking Avalon sink interfaces as
-- described in the AAvalon Interface specification. No error vectors are generated. 
-- Checker only assert warnings on Avalon interface violation. This checker only works
-- for data packet length >= 2. List of error conditions asserted:
-- no_error	: no error
-- miss_sop	: missing sop
-- miss_eop	: missing eop
-- ue_valid	: unexpected valid high 
-- 
-- ALTERA Confidential and Proprietary
-- Copyright 2010 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library altera_mf;
use altera_mf.altera_mf_components.all;


--synthesis translation_off

entity rs_dspip_avalon_streaming_sink_checker is

  port(
    clk             : in  std_logic;
    reset_n         : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
		-- only a checker, no signal is generated to design side

    ----------------- ATLANTIC SIDE SIGNALS
    at_sink_ready   : in  std_logic	:= '0';
    at_sink_valid   : in  std_logic	:= '0';
    at_sink_sop     : in  std_logic := '0';
    at_sink_eop     : in  std_logic := '0'
    );

end rs_dspip_avalon_streaming_sink_checker;


architecture rtl of rs_dspip_avalon_streaming_sink_checker is

  type STATE_TYPE_t is (start, run, st_err); 
  type AV_ERROR_TYPE_t is (no_error, miss_sop, miss_eop, ue_valid);
 
  signal sink_state      	: STATE_TYPE_t;
  signal sink_next_state 	: STATE_TYPE_t;
 
	signal packet_error 		: AV_ERROR_TYPE_t; 
	signal packet_error_s		: AV_ERROR_TYPE_t;  -- synced version 
	
	signal i_ready_n_valid	: std_logic;
	signal ready_latency_1	: std_logic; 
																				
begin
   
  i_ready_n_valid <= ready_latency_1 and at_sink_valid;
 
  sink_comb_update : process (reset_n, sink_state, i_ready_n_valid, ready_latency_1,
  																at_sink_valid, at_sink_sop, at_sink_eop)

    begin  -- process sink_comb_update_2
    	if reset_n = '0' then
    		sink_next_state <= start;
    		packet_error <= no_error;
    	elsif sink_state /= st_err then
    		if ready_latency_1 = '0' and at_sink_valid = '1' then
    			sink_next_state  <= st_err;
	        packet_error <= ue_valid;
	      else     
		      case sink_state is
		        when start =>
		          if i_ready_n_valid = '1' and at_sink_sop = '1' then
		            sink_next_state  <= run;
		            packet_error <= no_error;
		          elsif i_ready_n_valid = '1' and at_sink_sop = '0' then
		            sink_next_state  <= st_err;
		            packet_error <= miss_sop;
		          else
		            sink_next_state  <= start;
		            packet_error <= no_error;
		          end if;
	          
		        when run =>
		          if i_ready_n_valid = '1' and at_sink_sop = '1' then
		            sink_next_state  <= st_err;
		            packet_error <= miss_eop;
		          elsif i_ready_n_valid = '1' and at_sink_eop = '1' then
		            sink_next_state  <= start;
		            packet_error <= no_error;
		          elsif i_ready_n_valid = '1' and at_sink_eop = '0' then
		              sink_next_state  <= run;
		              packet_error <= no_error;
	            else
	              sink_next_state  <= run;
	              packet_error <= no_error;
	            end if;

		        when others => null;

		      end case;
		 		end if;
	     end if;
    end process sink_comb_update;
    

  sink_input_update : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      sink_state <= start;
      packet_error_s <= no_error;
    elsif clk'event and clk = '1' then
      sink_state <= sink_next_state;
      packet_error_s <= packet_error;
    end if;
  end process sink_input_update;

-- to cater for read latency of 1
  read_latency_1 : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      ready_latency_1 <= '0';
    elsif clk'event and clk = '1' then
      ready_latency_1 <= at_sink_ready;
    end if;
  end process read_latency_1;
   
	checker: process (packet_error_s)
	begin
	
	  if packet_error_s = miss_sop then
		   ASSERT FALSE
		   REPORT "Reed Solomon : Avalon interface violotion - missing sink_sop. Please reset to resume correct operation of IP core";
		elsif packet_error_s = miss_eop then
		   ASSERT FALSE
		   REPORT "Reed Solomon : Avalon interface violotion - missing sink_eop. Please reset to resume correct operation of IP core";
		elsif packet_error_s = ue_valid then
		   ASSERT FALSE
		   REPORT "Reed Solomon : Avalon interface violotion - unexpected sink_valid. Please reset to resume correct operation of IP core";
		end if;
			
end process checker;

end rtl;

--synthesis translation_on
