library ieee;
use ieee.std_logic_1164.all;

entity A_S is
    Port (
        A    : in  std_logic_vector(3 downto 0);
        B    : in  std_logic_vector(3 downto 0);
        CBi  : in  std_logic;
		OPau : in std_logic;  
        R    : out std_logic_vector(3 downto 0);
        iCBo : out std_logic;  
        B3   : out std_logic  
    );
end A_S;

architecture Behavioral of A_S is
    signal Bxor : std_logic_vector(3 downto 0);
    signal C4   : std_logic;
    signal C0   : std_logic;
	 
	 component ADDER
		port (
		  A    : in  std_logic_vector(3 downto 0);
        B    : in  std_logic_vector(3 downto 0);
		  C0   : in std_logic;
        C4   : out std_logic;
		  S    : out  std_logic_vector(3 downto 0)
		  );
	 end component;

begin
	 Bxor(0) <= B(0) XOR OPau;
	 Bxor(1) <= B(1) XOR OPau;
	 Bxor(2) <= B(2) XOR OPau;
	 Bxor(3) <= B(3) XOR OPau;
	 
	 C0 <= CBi XOR OPau;
	 
	
    -- Instancia o somador de 4 bits
    U1 : ADDER port map (
        A   => A,
        B   => Bxor,
        C0 => C0,          
        S   => R,
        C4  => C4
    );

    -- Calcula o overflow como Cout XOR carry(2)
    iCBo <= C4 XOR OPau;
	 B3   <= Bxor(3);
end Behavioral;
