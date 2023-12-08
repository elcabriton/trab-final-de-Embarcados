library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity testbench is
end entity;


architecture rtl of testbench is
    component asl_topo is
        port(
            clk: in std_logic;
            reset: in std_logic;
            GO: in std_logic;
            m00: in std_logic_vector(7 downto 0);
            m01: in std_logic_vector(7 downto 0);
            m02: in std_logic_vector(7 downto 0);
            m10: in std_logic_vector(7 downto 0);
            m11: in std_logic_vector(7 downto 0);
            m12: in std_logic_vector(7 downto 0);
            m20: in std_logic_vector(7 downto 0);
            m21: in std_logic_vector(7 downto 0);
            m22: in std_logic_vector(7 downto 0);
            dadoPrt : out std_logic;
            result  : out std_logic_vector(7 downto 0)
        );
    end component asl_topo;

    signal clk: std_logic:='0';
    signal reset: std_logic:='1';
    signal GO        :  std_logic:='0';
    signal m00       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m01       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m02       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m10       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m11       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m12       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m20       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m21       :  std_logic_vector(7 downto 0):= (others => '0');
    signal m22       :  std_logic_vector(7 downto 0):= (others => '0');
    signal dadoPrt   :  std_logic := '0';
    signal result    :  std_logic_vector(7 downto 0):= (others => '0');

begin 
uut: asl_topo port map(
    clk     => clk,
    reset   => reset,
    GO      => GO,
    m00     => m00,
    m01     => m01,
    m02     => m02,
    m10     => m10,
    m11     => m11,
    m12     => m12,
    m20     => m20,
    m21     => m21,
    m22     => m22,
    dadoPrt => dadoPrt,
    result  => result
);


clk <= not clk after 5 ns;
reset <= '0' after 10 ns;
m00 <= "00001111" after 30 ns;
m01 <= "00001010" after 30 ns;
m02 <= "00001010" after 30 ns;

m10 <= "00000111" after 30 ns;
m11 <= "00001001" after 30 ns;
m12 <= "00001011" after 30 ns;

m20 <= "00001010" after 30 ns;
m21 <= "00001010" after 30 ns;
m22 <= "00010111" after 30 ns;
GO <= '1'  after 40 ns;

end architecture;


