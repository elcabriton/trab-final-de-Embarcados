library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity conv_PO is
   
    port (
        clk       : in std_logic;
        reset     : in std_logic;
        GO      : in std_logic;
        m00       : in std_logic_vector(7 downto 0);
        m01       : in std_logic_vector(7 downto 0);
        m02       : in std_logic_vector(7 downto 0);
        m10       : in std_logic_vector(7 downto 0);
        m11       : in std_logic_vector(7 downto 0);
        m12       : in std_logic_vector(7 downto 0);
        m20       : in std_logic_vector(7 downto 0);
        m21       : in std_logic_vector(7 downto 0);
        m22       : in std_logic_vector(7 downto 0);
        dadoPrt   : out std_logic;
        result    : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of conv_PO is
    signal somador1 : std_logic_vector(7 downto 0);
    signal somador2 : std_logic_vector(7 downto 0);
    signal somador3 : std_logic_vector(7 downto 0);
    signal somador4 : std_logic_vector(7 downto 0);

    signal mult1 : std_logic_vector(7 downto 0);
    signal mult2 : std_logic_vector(7 downto 0);

begin
    process(clk, reset)
    begin
        if (reset = '1') then
            result <= (others => '0');
            dadoPrt <= '0';
        elsif rising_edge(clk) then
            if GO = '1' then
                mult1 <= m01 * "00000010";
                mult2 <= m21 * "00000010";--ver essaa linha

                somador1 <= m02+ not m20;
                somador2 <= m00+ mult1;
                somador3 <= somador1+ mult2+ not m22;
                somador4 <= somador2+ somador3;
                result <= somador4;
                dadoPrt <= '1';
            end if;
        end if;
    end process;



end architecture rtl;