library ieee;
use ieee.std_logic_1164.all;

entity lm_nand is
  port (
    A, B : in std_logic_vector(3 downto 0);
    R : out std_logic_vector(4 downto 0)
  );
end entity;



architecture behavioral of lm_nand is

begin

  R <= '0' & (A nand B);

end architecture;
