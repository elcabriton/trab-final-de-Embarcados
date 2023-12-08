
library ieee;
use ieee.std_logic_1164.all;

entity top-level is
	generic
	(
		DATA_WIDTH_TT : natural := 9
	);

	port (
		clk     : in  std_logic;                   
		reset   : in  std_logic;                  
		-- led     : out std_logic_vector(3 downto 0);        
		-- button  : in std_logic_vector(3 downto 0)        
	);
end entity;

architecture rtl of top-level is

    component MyQsys is
        port (
            clk_clk        : in  std_logic;                                        -- clk
            reset_reset_n  : in  std_logic;                                        -- reset_n
            m00_export     : out std_logic_vector(7 downto 0);                    -- export
            result_export  : in  std_logic_vector(7 downto 0);                     -- export
            go_export      : out std_logic;                                       -- export
            dadoprt_export : in  std_logic;                                       -- export
            m01_export     : out std_logic_vector(7 downto 0);                    -- export
            m02_export     : out std_logic_vector(7 downto 0);                    -- export
            m10_export     : out std_logic_vector(7 downto 0);                    -- export
            m11_export     : out std_logic_vector(7 downto 0);                    -- export
            m12_export     : out std_logic_vector(7 downto 0);                    -- export
            m20_export     : out std_logic_vector(7 downto 0);                    -- export
            m21_export     : out std_logic_vector(7 downto 0);                    -- export
            m22_export     : out std_logic_vector(7 downto 0);                     -- export
        );
    end component MyQsys;

	component AcelTopo is
		generic
		(
			DATA_WIDTH_TOP : natural := 8
		);
		port 
		(
			clk      => in std_logic;
			reset    => in std_logic;
			GO       => in std_logic;
			dadoprt  => out std_logic;
			result   => out std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m00      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m01      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m02      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m10      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m11      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m12      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m20      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m21      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
			m22      => in  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0)
		);
	end component;

	signal clk_sg      :  std_logic;
	signal reset_sg    :  std_logic;
	signal GO_sg       :  std_logic;
	signal dadoprt_sg  :  std_logic;
	signal result_sg   :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m00_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m01_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m02_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m10_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m11_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m12_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m20_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m21_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);
	signal m22_sg      :  std_logic_vector((DATA_WIDTH_TOP - 1) downto 0);

begin
	
	SoC : component MyQsys
		port map (
			clk_clk        => clk_sig,        --     clk.clk
			reset_reset_n  => reset_sg,    --   reset.reset_n
			m00_export     => m00_sg,     --     m00.export
			answer_export  => m01_sg,      --  answer.export
			go_export      => m02_sg,      --      go.export
			dadoprt_export => m10_sg,      -- dadoprt.export
			m01_export     => m01_sg,     --     m01.export
			m02_export     => m02_sg,     --     m02.export
			m10_export     => m10_sg,     --     m10.export
			m11_export     => m11_sg,     --     m11.export
			m12_export     => m12_sg,     --     m12.export
			m20_export     => m20_sg,     --     m20.export
			m21_export     => m21_sg,     --     m21.export
			m22_export     => m22_sg      --     m22.export
		);
		
	Acel : component acel-topo
		port map (
			clk      => clk_sg,
			reset    => reset_sg,
			GO       => GO_sg,
			dadoprt  => dadoprt_sg,
			result   => result_sg,
			m00      => m00_sg,
			m01      => m01_sg,
			m02      => m02_sg,
			m10      => m10_sg,
			m11      => m11_sg,
			m12      => m12_sg,
			m20      => m20_sg,
			m21      => m21_sg,
			m22      => m22_sg
		);

end architecture;