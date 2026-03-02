LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CTRL IS
PORT(	MSTCLK : in std_logic;
		RESET : in STD_LOGIC;
		STEP : in std_logic;
		START : IN STD_LOGIC;
		Clkout : OUT STD_LOGIC;
		Rst : out std_logic;
		Disp : out std_logic
		);
END CTRL;

ARCHITECTURE logicFunction OF CTRL IS

	component ClkDIV
		port ( 
			clk_in: in std_logic;
			clk_out: out std_logic
			);
	  end component;

BEGIN
	
	 U1 : ClkDIV port map(
		clk_in => MSTCLK,
		clk_out => Clkout
	 );
	
	Rst <= RESET OR NOT(START);
	Disp <= NOT(STEP);


END LogicFunction;