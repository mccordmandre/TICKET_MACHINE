library ieee;
use ieee.std_logic_1164.all;

entity NAND4S is
  port (
    A, B : in std_logic_vector(3 downto 0);
    R : out std_logic_vector(3 downto 0)
  );
end entity;



architecture behavioral of NAND4S is

begin

  R <= not (A and B);
  -- R(0) <= not (A(0) and B(0));
  -- R(1) <= not (A(1) and B(1));
  -- R(2) <= not (A(2) and B(2));
  -- R(3) <= not (A(3) and B(3));
end architecture;
