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
    
	 signal Q_signal    : std_logic_vector(7 downto 0);
	    
	 
	 component SQRSUMUNIT
		PORT (
        X          : in std_logic_vector(3 downto 0);
		  step         : in std_logic;
        start         : in std_logic;        
        CLK        : in std_logic;
		  RST        : in std_logic;  	   		  
		  CY         : out std_logic;
		  F    : out std_logic_vector(7 downto 0)
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
		
		
	 U1 : SQRSUMUNIT port map(
		X    => X,
		step  => NOT(step),
		start => start,
		CLK   => CLK,
		RST   => RST,
		CY    => CY,
		F     => Q_signal
	 );
	 
	 U4: decoderHex port map (
		bin=> Q_signal,	
		clear => '0',
		HEX0 => H(7 downto 0),
		HEX1 => H(15 downto 8),
		HEX2   => H(23 downto 16)
	 );
	 

end Behavioral;
