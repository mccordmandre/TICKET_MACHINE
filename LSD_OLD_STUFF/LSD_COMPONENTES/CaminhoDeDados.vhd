LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CaminhoDeDados IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 downto 0);
        M : IN STD_LOGIC;
		  Sum : IN STD_LOGIC;
		  rst : IN STD_LOGIC;
		  ClkDiv     : IN STD_LOGIC;  
		  F : OUT STD_LOGIC_VECTOR(7 downto 0);
		  CY: OUT STD_LOGIC
	);
END CaminhoDeDados;


architecture Behavioral of CaminhoDeDados is

    signal X2   : std_logic_vector(7 downto 0);
	 
	 component calc_square
		port (
        x : in std_logic_vector(3 downto 0);
        x_squared : out std_logic_vector(7 downto 0)
		  );
	 end component;
	 
	 component SUMORX2
		port(
			X2 : IN STD_LOGIC_VECTOR(7 downto 0);
			ClkDiv : IN STD_LOGIC;
			Sum : IN STD_LOGIC;
			M : IN STD_LOGIC;
			Rst  : IN STD_LOGIC;
			CY   : OUT STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(7 downto 0)
		  );
	end component;


begin
	
    U1 : calc_square port map(
        x => A,
        x_squared => X2
    );
	 
	 U2: SUMORX2 port map(
			X2 => X2,
			Sum => Sum,
			ClkDiv => ClkDiv,
		   M => M,
		   Rst  => rst,
		   CY   => CY,
		   F => F
	 );
	 
	 
	 
END Behavioral;