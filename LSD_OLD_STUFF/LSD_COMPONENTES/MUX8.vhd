LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX8 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 downto 0);
        B : IN STD_LOGIC_VECTOR(7 downto 0);
		  S : IN STD_LOGIC;
		  F : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END MUX8;

ARCHITECTURE logicFunction OF MUX8 IS
begin
	 
    F(0) <= (not S and A(0)) or (S and B(0));
    F(1) <= (not S and A(1)) or (S and B(1));
    F(2) <= (not S and A(2)) or (S and B(2));
    F(3) <= (not S and A(3)) or (S and B(3));
	 F(4) <= (not S and A(4)) or (S and B(4));
	 F(5) <= (not S and A(5)) or (S and B(5));
	 F(6) <= (not S and A(6)) or (S and B(6));
	 F(7) <= (not S and A(7)) or (S and B(7));
		  
end logicFunction;