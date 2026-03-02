library IEEE;
use IEEE.std_logic_1164.all;

entity TLAB3_tb is
end entity;

architecture TLAB3_tb_arch of TLAB3_tb is

component TLAB3
	port
	(
		MCLK   : in std_logic;
		Rst    : in std_logic;
		Step   : in std_logic;
		Start  : in std_logic;
		X	   : in std_logic_vector(3 downto 0);
		Cy     : out std_logic;
		sum	   : out std_logic_vector(7 downto 0);
		HEX0, HEX1, HEX2 : out std_logic_vector(7 downto 0)
	);
end component;

-- UUT signals
signal RESET_TB, MCLK_TB : std_logic := '0';
signal Start_TB, Step_TB : std_logic;
signal X_TB : std_logic_vector(3 downto 0);
signal Cy_TB : std_logic;
signal sum_TB, HEX0, HEX1, HEX2 : std_logic_vector(7 downto 0);

constant MCLK_PERIOD : time := 20 ns;
constant MCLK_HALF_PERIOD : time := MCLK_PERIOD / 2;
constant CLK_PERIOD : time := 20 ns;

begin

	MCLK_TB <= not MCLK_TB after MCLK_HALF_PERIOD;
	
	UUT: TLAB3 port map(
			Rst		=> RESET_TB,
			MCLK 	=> MCLK_TB, 
			X 		=> X_TB, 
			Step 	=> Step_TB, 
			Start 	=> Start_TB, 
			Cy		=> Cy_TB, 
			sum	 	=> sum_TB,
			HEX0 	=> HEX0,
			HEX1 	=> HEX1,
			HEX2 	=> HEX2);
	
stimulus: process 
begin
	RESET_TB <= '1';	
	wait for CLK_PERIOD;
	RESET_TB <= '0';	
	Start_TB	<= '1';
	STEP_TB <= '0';
	X_TB <= "0010";
	wait for CLK_PERIOD*2;

    for i in 0 to 20 loop
	Step_TB	<= '1';
	wait for CLK_PERIOD*1;
	
	Step_TB <= '0';
	wait for CLK_PERIOD*1;

    end loop;

	wait;
				
end process;

end architecture;