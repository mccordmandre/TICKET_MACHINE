library ieee;
use ieee.std_logic_1164.all;

entity LabD is
    Port (
		  data_in    : in std_logic_vector(3 downto 0);
        PL         : in std_logic;
        CE         : in std_logic;        
        CLK        : in std_logic;
		  RST        : in std_logic;  	  
		  Clear      : in std_logic;   		  
		  TC         : out std_logic;
		  V          : out std_logic_vector(3 downto 0);
		  H          : out std_logic_vector(7 downto 0)
    );
end LabD;


architecture Behavioral of LabD is
    
    signal CLKDIV_signal    : std_logic;
	 signal Q_signal    : std_logic_vector(3 downto 0);
    
	 
	 component COUNTER
		port (
		  data_in    : in std_logic_vector(3 downto 0);
        PL         : in std_logic;
		  RST        : in std_logic;
        CE         : in std_logic;        
        ClkDiv     : in std_logic;                   
		  Q          : out std_logic_vector (3 downto 0)
		  );
	 end component;
	 
	 component ClkDIV
		port ( 
			clk_in: in std_logic;
			clk_out: out std_logic
			);
	  end component;
	  
	  component decoderHex
		PORT (	
			A: in std_logic_vector(3 downto 0);		
			clear : in std_logic;
			HEX0 : out std_logic_vector(7 downto 0)
			);	
		end component;
		
		component equalsZero
			port (
				A : IN STD_LOGIC_VECTOR(3 downto 0);
				Z : OUT STD_LOGIC
				);
		end component;


begin 
		
		
	 U1 : clkDiv port map(
		clk_in => CLK,
		clk_out => CLKDIV_signal
	 );
	
    U2 : COUNTER port map (
        data_in    => data_in,
		  RST        => RST,
        PL         => PL,
        CE         => CE,      
        ClkDiv     => CLKDIV_signal,                   
		  Q          => Q_signal
    );
	 
	 U3: equalsZero port map (
			A => Q_signal,
			Z => TC
	 );
	 
	 U4: decoderHex port map (
		A => Q_signal,	
		clear => Clear,
		HEX0 => H
	 );
	 
	 V <= Q_signal;

end Behavioral;
