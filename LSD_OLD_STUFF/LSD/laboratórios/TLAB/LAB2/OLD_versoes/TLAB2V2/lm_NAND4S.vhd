library ieee;
use ieee.std_logic_1164.all;

entity lm_NAND4S is
  port (
    A, B : in std_logic_vector(3 downto 0);
    R : out std_logic_vector(3 downto 0)
  );
end entity;



architecture behavioral of lm_NAND4S is

begin

  R <= A nand B;

end architecture;
