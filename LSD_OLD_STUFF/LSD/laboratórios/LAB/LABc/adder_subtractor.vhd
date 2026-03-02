library IEEE;
use IEEE.std_logic_1164.all;

entity adderSubtractor is -- Aritmetic Unit 

	port(
	A, B: in std_logic_vector(3 downto 0);
	CBi: in std_logic_vector; --Carry/Borrow IN
	Op: in std_logic;
	R: out std_logic_vector(3 downto 0)
	);

end adderSubtractor;


architecture structural of adderSubtractor is

begin

	R(3) <= A(3) xor (B(3) xor CBi(3)) xor CBi(3);
	R(2) <= A(2) xor (B(2) xor CBi(2)) xor CBi(2);
	R(1) <= A(1) xor (B(1) xor CBi(1)) xor CBi(1);
	R(0) <= A(0) xor (B(0) xor CBi(0)) xor CBi(0);

end structural;