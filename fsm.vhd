-- Libraries definitions for Fibonacci sequence
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

entity fsm is
	port(
		clock      : in   std_logic;
        reset      : in   std_logic;
		button     : in   std_logic;
        enable     : out  std_logic);
end fsm;


architecture behavior of fsm is

type state_name is (start, working); 	   -- nome dos estados
signal state, next_state : state_name;    -- defini��o dos sinais de estado
begin

process (clock, reset)
begin
	if (reset = '0') then
			state <= start;				-- estado inicial via reset
	elsif (clock = '1' and clock'event) then
			state <= next_state; 		-- registrador(es) para armazenamento do estado
	end if;
end process;


process (state, button)
begin
	case state is
		when start =>
		   if (button = '0') then
			next_state <= start;
		   else
			next_state <= working;
		   end if;

		when working =>
		   if (button = '0') then
			next_state <= working;
		   else
			next_state <= start;
		   end if;
	end case;
end process;


process (state)							
begin
	case state is						
		when start =>					   	
			enable <= '0';						
		when working =>					
			enable <= '1';					
	end case;						
end process;

end behavior;