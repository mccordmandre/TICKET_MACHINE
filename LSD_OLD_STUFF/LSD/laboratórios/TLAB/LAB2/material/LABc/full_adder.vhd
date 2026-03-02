library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port(
        A, B, Cin : in std_logic;
        S, Cout : out std_logic 
    );
end entity;

architecture behavioral of full_adder is
begin
    -- Calculating the sum bit
    S <= A xor B xor Cin;

    -- Carry-out (Cout) é gerado se 2 dos 3 inputs forem 1
    Cout <= (A and B) or (B and Cin) or (A and Cin); 
end architecture;
