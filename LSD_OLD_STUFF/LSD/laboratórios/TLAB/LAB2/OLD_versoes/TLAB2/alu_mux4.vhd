library ieee;
use ieee.std_logic_1164.all;

entity alu_mux4 is
  port (
    A, B : in  std_logic_vector(3 downto 0);
    
    -- Selector de 1 bit
    S : in std_logic;

    Y : out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavioral of alu_mux4 is

begin

  Y <= A when S = '0' else B;

end architecture;

