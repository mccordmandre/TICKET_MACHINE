library ieee;
use ieee.std_logic_1164.all;

entity lm_lsr is
  port (
    A , B : in  std_logic_vector(3 downto 0);
    R : out std_logic_vector(3 downto 0);
    CYA : out std_logic
  );
end entity;

architecture behavioral of lm_lsr is
begin

  -- Desloca a entrada A para a esquerda em 1 bit, adicionando um '0' na direita
  R <= '0' & A(3 downto 1); 
  CYA <= A(0);

end architecture;
