LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY labA IS 
 PORT(A, B, C : IN STD_LOGIC;
 F : OUT STD_LOGIC);
END labA;


ARCHITECTURE logicFunction OF labA IS
BEGIN
F <= (A AND NOT C) OR (NOT A AND B);
END LogicFunction;