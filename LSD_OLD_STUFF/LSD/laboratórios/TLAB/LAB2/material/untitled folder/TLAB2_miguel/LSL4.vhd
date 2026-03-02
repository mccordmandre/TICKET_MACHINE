library ieee;
use ieee.std_logic_1164.all;

entity LSL4 is
  port (
    A , B : in  std_logic_vector(3 downto 0);
    R : out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavioral of LSL4 is
begin

  -- Desloca a entrada A para a esquerda em 1 bit, adicionando um '0' na direita
  R <= A(2 downto 0) & '0'; 

end architecture;
