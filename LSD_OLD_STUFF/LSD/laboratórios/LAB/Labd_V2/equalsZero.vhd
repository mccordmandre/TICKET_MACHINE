library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity equalsZero IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 downto 0);
        Z : OUT STD_LOGIC
	);
END equalsZero;

ARCHITECTURE logicFunction OF equalsZero IS
begin
	 
    Z <= NOT (A(0) or A(1) or A(2) or A(3));
		  
end logicFunction;