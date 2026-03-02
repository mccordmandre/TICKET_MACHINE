library ieee;
use ieee.std_logic_1164.all;

entity flags_PZ4 is
  port (
    I0, I1, I2, I3 : in  std_logic;
    P, Z : out std_logic
  );
end entity;

architecture behavioral of flags_PZ4 is


  
begin

  P <= I0 xor I1 xor I2 xor I3;

  Z <= not(I0 or I1 or I2 or I3);

end architecture;

