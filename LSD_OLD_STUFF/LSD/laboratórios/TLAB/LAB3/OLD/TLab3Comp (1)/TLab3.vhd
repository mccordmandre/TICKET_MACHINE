library ieee;
use ieee.std_logic_1164.all;

entity TLab3 is
    Port (
		  X          : in std_logic_vector(3 downto 0);
		  step         : in std_logic;
        start         : in std_logic;        
        CLK        : in std_logic;
		  RST        : in std_logic;  	   		  
		  CY         : out std_logic;
		  H          : out std_logic_vector(23 downto 0)
    );
end TLab3;


architecture Behavioral of TLab3 is
    
    signal CLKDIV_signal    : std_logic;
	 signal rstout    : std_logic;
	 signal Disp    : std_logic;
	 signal Q_signal    : std_logic_vector(7 downto 0);
    
	 
	 component CaminhoDeDados
		port (
		  A : IN STD_LOGIC_VECTOR(3 downto 0);
        Disp : IN STD_LOGIC;
		  rst : IN STD_LOGIC;
		  ClkDiv     : IN STD_LOGIC;  
		  F : OUT STD_LOGIC_VECTOR(7 downto 0);
		  CY: OUT STD_LOGIC
	  );
	 end component;
	 
	 component CTRL
		port ( 
			MSTCLK : in std_logic;
			RESET : in STD_LOGIC;
			STEP : in std_logic;
			START : IN STD_LOGIC;
			Clkout : OUT STD_LOGIC;
			Rst : out std_logic;
			Disp : out std_logic
			);
	  end component;
	  
	  component decoderHex
		PORT (	
			bin: in std_logic_vector(7 downto 0);		
			clear : in std_logic;
			HEX0 : out std_logic_vector(7 downto 0);
			HEX1 : out std_logic_vector(7 downto 0);
			HEX2 : out std_logic_vector(7 downto 0)
			);	
		end component;
		


begin 
		
		
	 U1 : CTRL port map(
		MSTCLK => CLK,
		RESET => RST,
		STEP => step,
		START => start,
		Clkout => CLKDIV_signal,
		Rst => rstout,
		Disp => Disp
	 );
	
    U2 : CaminhoDeDados port map (
         A          => X,
			Disp       => Disp,   
			rst        => rstout,	
         ClkDiv     => CLKDIV_signal,                
		   F          => Q_signal,
		   CY         => CY
    );
	 
	 U4: decoderHex port map (
		bin=> Q_signal,	
		clear => rstout,
		HEX0 => H(7 downto 0),
		HEX1 => H(15 downto 8),
		HEX2   => H(23 downto 16)
	 );
	 

end Behavioral;
