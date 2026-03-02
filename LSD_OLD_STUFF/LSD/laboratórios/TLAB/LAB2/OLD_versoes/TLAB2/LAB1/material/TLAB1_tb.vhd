  LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity PZ10_tb is
end PZ10_tb;

architecture teste of PZ10_tb is
component PZ10
  port(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9 : in STD_LOGIC;
	   P, Z : out STD_LOGIC
  );
end component;

signal I0, I1, I2, I3, I4, I5, I6, I7, I8, I9 : STD_LOGIC;
signal P, Z : STD_LOGIC;

begin

U0 : PZ10 port map (I0 => I0, I1 => I1, I2 => I2, I3 => I3, I4 => I4, I5 => I5, I6 => I6, I7 => I7, I8 => I9 =>
		     P => P, Z => Z);

process
begin
 I0 <= '1';
 I1 <= '0';
 I2 <= '1';
 I3 <= '0';
 I4 <= '1';
 I5 <= '0';
 I6 <= '0';
 I7 <= '0';
 I8 <= '1';
 I9 <= '1';
 wait for 10 ns;

 I0 <= '1';
 I1 <= '0';
 I2 <= '1';
 I3 <= '0';
 I4 <= '0';
 I5 <= '0';
 I6 <= '1';
 I7 <= '0';
 I8 <= '1';
 I9 <= '0';
 wait for 10 ns;

 I0 <= '1';
 I1 <= '1';
 I2 <= '1';
 I3 <= '1';
 I4 <= '1';
 I5 <= '1';
 I6 <= '1';
 I7 <= '1';
 I8 <= '1';
 I9 <= '1';
 wait for 10 ns;

 I0 <= '0';
 I1 <= '0';
 I2 <= '0';
 I3 <= '0';
 I4 <= '0';
 I5 <= '0';
 I6 <= '0';
 I7 <= '0';
 I8 <= '0';
 I9 <= '0';
 wait for 10 ns;


wait;

end process;

end teste;
