library ieee;
use ieee.std_logic_1164.all;

entity SQRSUMUNIT is
    Port (
		  X          : in std_logic_vector(3 downto 0);
		  step         : in std_logic;
        start         : in std_logic;        
        CLK        : in std_logic;
		  RST        : in std_logic;  	   		  
		  CY         : out std_logic;
		  F    : out std_logic_vector(7 downto 0)
    );
end SQRSUMUNIT;


architecture Behavioral of SQRSUMUNIT is
    
	 signal rstout    : std_logic;
	 signal Disp_signal    : std_logic;
	 signal sum_signal  : std_logic;
	 signal CLKDIV_signal: std_logic;
    
	 
	 component CaminhoDeDados
		PORT (
        A : IN STD_LOGIC_VECTOR(3 downto 0);
        M : IN STD_LOGIC;
		  Sum : IN STD_LOGIC;
		  rst : IN STD_LOGIC;
		  ClkDiv     : IN STD_LOGIC;  
		  F : OUT STD_LOGIC_VECTOR(7 downto 0);
		  CY: OUT STD_LOGIC
		);
	 end component;
	 
	 component CTRL
		PORT(	MSTCLK : in std_logic;
				RESET : in STD_LOGIC;
				STEP : in std_logic;
				START : IN STD_LOGIC;
				Clkout : OUT STD_LOGIC;
				Rst : out std_logic;
				M : out std_logic;
				Sum : out std_logic
		);
	  end component;		


begin 
		
		
	 U1 : CTRL port map(
		MSTCLK => CLK,
		RESET => RST,
		STEP => NOT(step),
		START => start,
		Clkout => CLKDIV_signal,
		Rst => rstout,
		M => Disp_signal,
		Sum => sum_signal
	 );
	
    U2 : CaminhoDeDados port map (
         A          => X,
			M          => Disp_signal, 
			Sum        => sum_signal,
			rst        => rstout,	
         ClkDiv     => CLK,                
		   F          => F,
		   CY         => CY
    );
	 
	 

end Behavioral;
