LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SUMORX2 IS
    PORT (
        X2 : IN STD_LOGIC_VECTOR(7 downto 0);
		  ClkDiv : IN STD_LOGIC;
		  Disp : IN STD_LOGIC;
		  Rst  : IN STD_LOGIC;
		  CY   : OUT STD_LOGIC;
		  F : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END SUMORX2;

ARCHITECTURE logicFunction OF SUMORX2 IS

	signal reg    : std_logic_vector(7 downto 0);
	signal cyout      : std_logic;
	signal sum      : std_logic_vector(7 downto 0);

	component ADDER8
		 PORT (
         A    : in  std_logic_vector(7 downto 0);
        B    : in  std_logic_vector(7 downto 0);
		  C0   : in std_logic;
        C4   : out std_logic;
		  S    : out  std_logic_vector(7 downto 0)
		);
	 end component;
	
	component MUX8
		 PORT (
        A : IN STD_LOGIC_VECTOR(7 downto 0);
        B : IN STD_LOGIC_VECTOR(7 downto 0);
		  S : IN STD_LOGIC;
		  F : OUT STD_LOGIC_VECTOR(7 downto 0)
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
	
	 
	 U1 : ADDER8 port map (
        A   => x2,
        B   => reg,
        C0 => '0',          
        S   => sum,
        C4  => cyout
    );
	 
	 FF_7: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(7),
			EN => disp,
			Q => reg(7)
		);
		
	FF_6: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(6),
			EN => disp,
			Q => reg(6)
		);
	FF_5: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(5),
			EN => disp,
			Q => reg(5)
		);
	FF_4: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(4),
			EN => disp,
			Q => reg(4)
		);
	FF_3: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(3),
			EN => disp,
			Q => reg(3)
		);
	FF_2: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(2),
			EN => disp,
			Q => reg(2)
		);
	FF_1: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(1),
			EN => disp,
			Q => reg(1)
		);
	FF_0: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => sum(0),
			EN => disp,
			Q => reg(0)
		);
		
	FF_CY: FFD port map (
			CLK => ClkDiv,
			RESET => RST,
			SET => '0',
			D  => cyout,
			EN => cyout,
			Q => CY
		);
	 
	 
	 U3 : MUX8 port map (
        A   => reg,
        B   => x2,         
        S   => disp,
        F  => F
    );

		  
end logicFunction;