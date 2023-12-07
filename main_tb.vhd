library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity main_tb is
    end main_tb;



architecture main_tb_arch of main_tb is
    component main is
        port (
            clock, reset,enable,seletor : in std_logic;
            matriz00,matriz01,matriz02 : in std_logic_vector(7 downto 0);
            matriz10,matriz11,matriz12 : in std_logic_vector(7 downto 0);
            matriz20,matriz21,matriz22 : in std_logic_vector(7 downto 0);
            final : out std_logic_vector(7 downto 0)
        );
        end component;




signal clock : std_logic := '0';
signal reset : std_logic := '0';
signal enable : std_logic := '0';
signal seletor : std_logic:= '0';

signal matriz00 : std_logic_vector(7 downto 0) := "00000010";--2
signal matriz01 : std_logic_vector(7 downto 0) := "00000100";--4
signal matriz02 : std_logic_vector(7 downto 0) := "00000110";--6

signal matriz10 : std_logic_vector(7 downto 0) := "00001000";--8
signal matriz11 : std_logic_vector(7 downto 0) := "00001010";--10
signal matriz12 : std_logic_vector(7 downto 0) := "00001100";--12

signal matriz20 : std_logic_vector(7 downto 0):= "00001000" ;--8
signal matriz21 : std_logic_vector(7 downto 0):= "00001010" ;--10
signal matriz22 : std_logic_vector(7 downto 0):= "00001100" ;--12

signal final: std_logic_vector(7 downto 0) := (others => '0');


begin

inst_top:main port map(
    clock => clock,
    reset => reset,
    enable => enable,
    seletor => seletor,
    matriz00 => matriz00,
    matriz01 => matriz01,
    matriz02 => matriz02,
    matriz10 => matriz10,
    matriz11 => matriz11,
    matriz12 => matriz12,
    matriz20 => matriz20,
    matriz21 => matriz21,
    matriz22 => matriz22,
    final => final
    );
    clock<= not clock after 10 ns;
   --valores inicias
   
   stimulus: process
   begin
       reset <= '1';
       enable <= '0';
       seletor <= '0';
       wait for 10 ns;

       reset <= '0';
       enable <= '1';
       wait for 100 ns;

       seletor <= '1';
       wait for 100 ns;

       seletor <= '0';
       wait;
   end process stimulus;
end main_tb_arch;

