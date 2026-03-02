library ieee;
use ieee.std_logic_1164.all;

entity flags is
    port(
        A3, B3: in std_logic;
        iCBo: in std_logic;
        R3: in std_logic;
        OV: out std_logic;
        oCBo: out std_logic
    );
end entity;

architecture behavioral of flags is


begin
    -- Se A3 e B3 forem 0
    OV <= (A3 xor B3) xor (A3 xor R3);

    -- Pass through the carry/borrow out flag
    oCBo <= iCBo;
end architecture;