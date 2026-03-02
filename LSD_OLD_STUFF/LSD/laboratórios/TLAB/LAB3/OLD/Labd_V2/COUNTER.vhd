library ieee;
use ieee.std_logic_1164.all;

entity COUNTER is
    Port (
		  data_in    : in std_logic_vector(3 downto 0);
        PL         : in std_logic;
		  RST        : in std_logic;
        CE         : in std_logic;        
        ClkDiv     : in std_logic;                   
		  Q          : out std_logic_vector(3 downto 0)
    );
end COUNTER;


architecture Behavioral of COUNTER is
    
    signal S    : std_logic_vector(3 downto 0);
	 signal SO    : std_logic_vector(3 downto 0);
	 signal QO    : std_logic_vector(3 downto 0);
    
	 
	 component A_S
		port (
		  A    : in  std_logic_vector(3 downto 0);
        B    : in  std_logic_vector(3 downto 0);
        CBi  : in  std_logic;
		  OPau : in std_logic;  
        R    : out std_logic_vector(3 downto 0);
        iCBo : out std_logic;  
        B3   : out std_logic  
		  );
	 end component;
	 
	 component MUX4
		PORT (
        A : IN STD_LOGIC_VECTOR(3 downto 0);
        B : IN STD_LOGIC_VECTOR(3 downto 0);
		  S : IN STD_LOGIC;
		  F : OUT STD_LOGIC_VECTOR(3 downto 0)
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

begin 

	
    U1 : A_S port map (
        A   => QO,
        B   => "0000",
        CBi => CE,          
        OPau   => '1',
        R  => S,
		  iCBo => open,
		  B3 => open
    );
	 
	 U2: MUX4 port map (
			A => data_in,
			B => S,
			S => PL,
			F => SO
	 );
	 
	 FF_3: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => SO(3),
			EN => '1',
			Q => QO(3)
		);
	 FF_2: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => SO(2),
			EN => '1',
			Q => QO(2)
		);
	 FF_1: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => SO(1),
			EN => '1',
			Q => QO(1)
		);
	 FF_0: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => SO(0),
			EN => '1',
			Q => QO(0)
		);
		
	 Q <= QO;

end Behavioral;
