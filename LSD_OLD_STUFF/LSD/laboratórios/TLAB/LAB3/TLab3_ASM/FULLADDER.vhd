library ieee;
use ieee.std_logic_1164.ALL;

entity FULLADDER is
    port (
        A   : in std_logic;
        B   : in std_logic;
        CBi : in std_logic;
        S   : out std_logic;
        CBo : out std_logic
    );
end FULLADDER;

architecture Behavioral of FULLADDER is
begin
    -- Operação de soma
    S  <= (A XOR B) XOR CBi;
    CBo <= (A AND B) OR (A AND CBi) OR (B AND CBi);
end Behavioral;
