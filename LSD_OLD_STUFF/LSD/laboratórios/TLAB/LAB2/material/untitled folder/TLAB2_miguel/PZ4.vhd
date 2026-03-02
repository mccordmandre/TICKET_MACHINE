library ieee;
use ieee.std_logic_1164.all;

entity PZ4 is
  port (
    R : in  std_logic_vector(3 downto 0);
    P, Z : out std_logic
  );
end entity;

architecture behavioral of PZ4 is

begin

  P <= R(3) xor R(2) xor R(1) xor R(0);

  Z <= (R(3) or R(2)) nor (R(1) or R(0));

end architecture;

