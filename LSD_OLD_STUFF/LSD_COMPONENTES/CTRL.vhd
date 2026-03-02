LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CTRL IS
PORT(	MSTCLK : in std_logic;
		RESET : in STD_LOGIC;
		STEP : in std_logic;
		START : IN STD_LOGIC;
		Clkout : OUT STD_LOGIC;
		Rst : out std_logic;
		M : out std_logic;
		Sum : out std_logic
		);
END CTRL;

ARCHITECTURE logicFunction OF CTRL IS
	signal CS    : std_logic_vector(1 downto 0);
	signal NS    : std_logic_vector(1 downto 0);
	signal clk   : std_logic;
	signal rstout: std_logic;
	

	component ClkDIV
		port ( 
			clk_in: in std_logic;
			clk_out: out std_logic
			);
	  end component;
	  
	  component STATES
		 port (
			  Q : in std_logic_vector(1 downto 0);
			  start : in std_logic;
			  step : in std_logic;
			  D : out std_logic_vector(1 downto 0);
			  M,rst, sum : out std_logic
		 );
		end component;
		
		component FFD 
		PORT(	
			CLK : in std_logic;
			RESET : in STD_LOGIC;
			SET : in std_logic;
			D : IN STD_LOGIC;
			EN : IN STD_LOGIC;
			Q : out std_logic
		);
		end component;

BEGIN
	
	 U1 : ClkDIV port map(
		clk_in => MSTCLK,
		clk_out => clk
	 );
	 
	 Clkout <= clk;
	 
	 U2: STATES port map(
		Q => CS,
		start => START,
		step => STEP,
		D => NS,
		M => M,
		rst => rstout,
		sum => Sum
		
	 );
	 
	 rst <= rstout or RESET;
	
	
	 FF_NS_0: FFD port map (
			CLK => clk,
			RESET => RESET,
			SET => '0',
			D  => NS(0),
			EN => '1',
			Q => CS(0)
		);
		
		FF_NS_1: FFD port map (
			CLK => clk,
			RESET => RESET,
			SET => '0',
			D  => NS(1),
			EN => '1',
			Q => CS(1)
		);
	


END LogicFunction;