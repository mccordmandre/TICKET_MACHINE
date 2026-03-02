library ieee;
use ieee.std_logic_1164.all;

entity lm_mux is
  port (
    A, B, C, D : in  std_logic_vector(3 downto 0);
    -- Selector de 1 bit
    S0, S1: in std_logic;
    Y : out std_logic_vector(3 downto 0);
    Cy : out std_logic
  );
end entity;

architecture behavioral of lm_mux is

begin

  Y <= A(3 downto 0) when S0 = '0' and S1 = '0' else
       B(3 downto 0) when S0 = '0' and S1 = '1' else
       C(3 downto 0) when S0 = '1' and S1 = '0' else  
       D(3 downto 0) when S0 = '1' and S1 = '1';

  Cy <= A(3) when S0 = '0' and S1 = '0' else
        B(3) when S0 = '0' and S1 = '1' else
        C(3) when S0 = '1' and S1 = '0' else 
        D(3) when S0 = '1' and S1 = '1';
end architecture;