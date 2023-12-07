library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity main is
    port(
matriz00: in std_logic_vector(7 downto 0); 
matriz01: in std_logic_vector(7 downto 0);
matriz02: in std_logic_vector(7 downto 0);
matriz10: in std_logic_vector(7 downto 0);
matriz11: in std_logic_vector(7 downto 0);
matriz12: in std_logic_vector(7 downto 0);
matriz20: in std_logic_vector(7 downto 0);
matriz21: in std_logic_vector(7 downto 0);
matriz22: in std_logic_vector(7 downto 0);
final: out std_logic_vector(7 downto 0);
clock:in std_logic;
reset:in std_logic;
enable:in std_logic;
seletor:in  std_logic
);
end main;

architecture rtl of main is 
signal somador1 : std_logic_vector(7 downto 0);
signal somador2 : std_logic_vector(7 downto 0);
signal somador3 : std_logic_vector(7 downto 0);
signal somador4 : std_logic_vector(7 downto 0);
signal somador5 : std_logic_vector(7 downto 0);

signal mux1 : std_logic_vector(7 downto 0);
signal mux2 : std_logic_vector(7 downto 0);
signal mux3 : std_logic_vector(7 downto 0);
signal mux4 : std_logic_vector(7 downto 0);
signal mux5 : std_logic_vector(7 downto 0);

signal regfinal : std_logic_vector(7 downto 0);
signal regfinal2 : std_logic_vector(7 downto 0);
signal shiftt : std_logic_vector(7 downto 0);

signal maisum : STD_LOGIC:='1';



begin 
process(clock)
begin
if (reset='1') then
    regfinal<= "00000000";
else
    regfinal<= somador3;
    regfinal2<= somador5;
    final<= regfinal2;
end if;
end process;



mux1<= matriz00 when seletor='0' else
        matriz20 when seletor='1';

mux2<=matriz02 when seletor='0' else
    matriz22 when seletor='1';
mux3<=matriz01 when seletor='0' else
    matriz21 when seletor='1';
mux4<= somador1 when seletor='0'else
somador3 when seletor='1';
mux5<=shiftt when seletor='0' else
    somador2 when seletor='1';


  somador1<= mux1 + mux2;
  somador2<= not shiftt + maisum;
  somador3<= not somador1+maisum;
  somador4<= mux4+mux5;
  somador5<= regfinal+somador4;

shiftt <= mux3(6 downto 0) & '0'; -- Assuming 7 downto 0 vector size


end rtl;
