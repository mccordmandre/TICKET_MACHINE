library ieee;

use ieee.std_logic_1164.all;

entity Register1 is
  port(
   
	--Input port
	
	  A: in std_logic_vector(5 downto 0);
	  Clk, Reset, EnXi: in std_logic;
	 
     
	--Output port
	
     Q: out std_logic_vector(5 downto 0));
	  
  
  end Register1;
  
  architecture structural of Register1 is
component FFD is
 port(
   
	--Input Port
    
	 CLK, RESET, SET, D, EN : in std_logic;
		
	 --Output Port
	 
     Q : out std_logic);

end component;


begin

U1 : FFD port map ( CLK => Clk, EN => EnXi, RESET => Reset, SET => '0', D => A(0), Q => Q(0));
U2 : FFD port map ( CLK => Clk, EN => EnXi, RESET => Reset, SET => '0', D => A(1), Q => Q(1));
U3 : FFD port map ( CLK => Clk, EN => EnXi, RESET => Reset, SET => '0', D => A(2), Q => Q(2));
U4 : FFD port map ( CLK => Clk, EN => EnXi, RESET => Reset, SET => '0', D => A(3), Q => Q(3));
U5 : FFD port map ( CLK => Clk, EN => EnXi, RESET => Reset, SET => '0', D => A(4), Q => Q(4));
U6 : FFD port map ( CLK => Clk, EN => EnXi, RESET => Reset, SET => '0', D => A(5), Q => Q(5));




end structural;
