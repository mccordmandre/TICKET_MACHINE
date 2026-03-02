LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 downto 0);
        B : IN STD_LOGIC_VECTOR(3 downto 0);
		  S : IN STD_LOGIC;
		  F : OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END MUX4;

ARCHITECTURE logicFunction OF MUX4 IS
begin
	 
    F(0) <= (not S and A(0)) or (S and B(0));
    F(1) <= (not S and A(1)) or (S and B(1));
    F(2) <= (not S and A(2)) or (S and B(2));
    F(3) <= (not S and A(3)) or (S and B(3));
		  
end logicFunction;