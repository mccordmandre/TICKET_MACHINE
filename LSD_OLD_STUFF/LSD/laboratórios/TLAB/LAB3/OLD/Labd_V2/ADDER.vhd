-- Componente PZ10
library ieee;
use ieee.std_logic_1164.all;

entity ADDER is
    Port (
		  A    : in  std_logic_vector(3 downto 0);
        B    : in  std_logic_vector(3 downto 0);
		  C0   : in std_logic;
        C4   : out std_logic;
		  S    : out  std_logic_vector(3 downto 0)
    );
end ADDER;

architecture Behavioral of ADDER is
    -- Sinal intermediário para armazenar o carry entre os Full Adders
    signal CB   : std_logic_vector(4 downto 0);
	 
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

    -- Carry-out final
    C4  <= CB(4);
end Behavioral;