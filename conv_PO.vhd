library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity conv_PO is
   
    port (
        clk       : in std_logic;
        reset     : in std_logic;
        GO        : in std_logic;
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
    signal final : std_logic_vector(7 downto 0) := (others => '0');
    signal mult1 : std_logic_vector(15 downto 0) := (others => '0');
    signal mult2 : std_logic_vector(15 downto 0) := (others => '0');
    
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            result <= (others => '0');
            dadoPrt <= '0';
        elsif rising_edge(clk) then
            if GO = '1' then             
                result <= final;
                dadoPrt <= '1';
            end if;
        end if;
    end process;
    mult1 <= m01 * "00000010";
    mult2 <= ((not m21) + "00000001") * "00000010";
    final <= m00 + mult1(7 downto 0) + m02 + ((not m20) + "00000001") + mult2(7 downto 0) + ((not m22) + "00000001");



end architecture rtl;