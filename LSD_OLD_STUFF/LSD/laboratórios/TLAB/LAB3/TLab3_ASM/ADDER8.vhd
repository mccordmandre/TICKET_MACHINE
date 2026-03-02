library ieee;
use ieee.std_logic_1164.all;

entity ADDER8 is
    Port (
		  A    : in  std_logic_vector(7 downto 0);
        B    : in  std_logic_vector(7 downto 0);
		  C0   : in std_logic;
        C8   : out std_logic;
		  S    : out  std_logic_vector(7 downto 0)
    );
end ADDER8;

architecture Behavioral of ADDER8 is
    -- Sinal intermediário para armazenar o carry entre os Full Adders
    signal CB   : std_logic_vector(8 downto 0);
	 
	 component FULLADDER
		port (
		  A   : in std_logic;
        B   : in std_logic;
        CBi : in std_logic;
        S   : out std_logic;
        CBo : out std_logic
		 );
	 end component;


begin
	  
	 -- Inicialização do carry-in inicial 
	 CB(0) <= C0;

    -- Instância dos quatro Full Adders
    U1 : FULLADDER port map(
        A => A(0),
        B => B(0),
        CBi => CB(0),
        S => S(0),
        CBo => CB(1)
    );

    U2 : FULLADDER port map(
        A => A(1),
        B => B(1),
        CBi => CB(1),
        S => S(1),
        CBo => CB(2)
    );

    U3 : FULLADDER port map(
        A => A(2),
        B => B(2),
        CBi => CB(2),
        S => S(2),
        CBo => CB(3)
    );

    U4 : FULLADDER port map(
        A => A(3),
        B => B(3),
        CBi => CB(3),
        S => S(3),
        CBo => CB(4)
    );
	 
	 U5 : FULLADDER port map(
        A => A(4),
        B => B(4),
        CBi => CB(4),
        S => S(4),
        CBo => CB(5)
    );
	 
	 U6 : FULLADDER port map(
        A => A(5),
        B => B(5),
        CBi => CB(5),
        S => S(5),
        CBo => CB(6)
    );
	 
	 U7 : FULLADDER port map(
        A => A(6),
        B => B(6),
        CBi => CB(6),
        S => S(6),
        CBo => CB(7)
    );
	 
	 U8 : FULLADDER port map(
        A => A(7),
        B => B(7),
        CBi => CB(7),
        S => S(7),
        CBo => CB(8)
    );

    -- Carry-out final
    C8  <= CB(8);
end Behavioral;