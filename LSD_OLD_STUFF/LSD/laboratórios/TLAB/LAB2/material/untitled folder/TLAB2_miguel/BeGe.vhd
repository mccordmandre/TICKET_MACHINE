library ieee;
use ieee.std_logic_1164.all;

entity BeGe is
  port (
	 iOV, iCB, Z : in std_logic;
    R : in  std_logic_vector(3 downto 0);
	 BE, GE : out std_logic --BE = Below or Equal; GE= Greater or Equal
	 );
end entity;

architecture behavioral of BeGe is

begin

	--Natural Numbers
	BE <= iCB;
	
	--Integer Numbers
	GE <= (not(R(0)) and not(iOV) and not(Z)) or (R(0) and iOV);

end behavioral;