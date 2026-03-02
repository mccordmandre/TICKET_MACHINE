library ieee;
use ieee.std_logic_1164.all;

entity MUX_Alu is
  port (
    A, B : in  std_logic_vector(3 downto 0);
    
    -- Selector de 1 bit
    OPc : in std_logic;

    Y : out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavioral of MUX_Alu is

begin

  Y <= A when OPc = '0' else B;

end architecture;
