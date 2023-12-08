library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fsm is
   
    port (
        clk       : in std_logic;
        reset     : in std_logic;
        GO      : in std_logic
        
        
        
    );
end entity;

architecture rtl of fsm is 

type states is (init, operating);--estados
--control states
signal state : states;
signal next_state : states:= init;

begin 
--state machine
process(clk, reset)
begin 
    if reset ='1' then 
    state<= init;
    elsif rising_edge(clk) then
        state<= next_state;
    end if;
end process;


--state transitions
process(clk)
begin case state is 
        when init =>
        if reset= '1' then
            next_state<= init;
        elsif reset= '0' and GO = '1' then
            next_state<= operating;
            
        end if;
            when operating=>
            if Go = '1' then 
            next_state<= operating;
            end if ;
        end case;


end process;

end architecture rtl;
