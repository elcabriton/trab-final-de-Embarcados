library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;



entity acel_topo is
    port(
       clk: in std_logic;
        reset: in std_logic;
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
end entity acel_topo;

architecture rtl of acel_topo is 

component fsm is 
    port(
        clk: in std_logic;
        reset: in std_logic;
        GO: in std_logic
    );
end component;


component conv_PO is
    port(
        clk: in std_logic;
        reset: in std_logic;
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
end component;

    begin
    conv_PO_inst : conv_PO
    port map(
        clk=>clk,
        reset=>reset,
        GO=>GO,
        m00=>m00,
        m01=>m01,
        m02=>m02,
        m10=>m10,
        m11=>m11,
        m12=>m12,
        m20=>m20,
        m21=>m21,
        m22=>m22
    );

    fsm_inst : fsm 
    port map(
        clk=>clk,
        reset=>reset,
        GO=>GO
    );

end architecture rtl;
