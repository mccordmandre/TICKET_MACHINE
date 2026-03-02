library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL; -- Para usar funções de conversão

entity calc_square is
    port (
        x : in std_logic_vector(3 downto 0);
        x_squared : out std_logic_vector(7 downto 0)
    );
end calc_square;

architecture Behavioral of calc_square is
begin
    x_squared <= 
        "00000000" when x = "0000" else  -- 0^2
        "00000001" when x = "0001" else  -- 1^2
        "00000100" when x = "0010" else  -- 2^2
        "00001001" when x = "0011" else  -- 3^2
        "00010000" when x = "0100" else  -- 4^2
        "00010101" when x = "0101" else  -- 5^2
        "00110000" when x = "0110" else  -- 6^2
        "01001001" when x = "0111" else  -- 7^2
        "01000000" when x = "1000" else  -- 8^2
        "01111001" when x = "1001" else  -- 9^2
        "01000000" when x = "1010" else  -- 10^2
        "01100101" when x = "1011" else  -- 11^2
        "01110000" when x = "1100" else  -- 12^2
        "10001001" when x = "1101" else  -- 13^2
        "10010000" when x = "1110" else  -- 14^2
        "10100101" when x = "1111" else  -- 15^2
        (others => '0'); -- Valor padrão para segurança
end Behavioral;
