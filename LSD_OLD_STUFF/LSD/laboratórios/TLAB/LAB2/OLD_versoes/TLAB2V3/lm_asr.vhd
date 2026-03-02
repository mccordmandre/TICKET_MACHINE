library ieee;
use ieee.std_logic_1164.all;

entity lm_asr is
  port (
    A , B : in  std_logic_vector(3 downto 0);
    R : out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavioral of lm_asr is
begin

  -- Desloca a entrada A para a esquerda em 1 bit, adicionando um '0' na direita
  R <= A(3) & A(3 downto 1); 

end architecture;
