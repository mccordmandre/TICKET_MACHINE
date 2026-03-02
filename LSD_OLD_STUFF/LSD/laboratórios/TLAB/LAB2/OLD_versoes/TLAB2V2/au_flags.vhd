library ieee;
use ieee.std_logic_1164.all;

entity au_flags is
    port(
        A3, B3: in std_logic;
        iCBo: in std_logic;
        R3: in std_logic;
        OV: out std_logic;
        oCBo: out std_logic
    );
end entity;

architecture behavioral of au_flags is

begin
    -- two negative numbers added and result is positive
    -- two positive numbers subtracted and result is negative
    -- if A3 and B3 are both 1, but R3 is 0, there is an overflow
    -- if A3 and B3 are both 0, but R3 is 1, there is an overflow
    OV <= (A3 and B3 and (not R3)) or ((not A3) and (not B3) and R3);

    -- Pass through the carry/borrow out flag
    oCBo <= iCBo;
end architecture;