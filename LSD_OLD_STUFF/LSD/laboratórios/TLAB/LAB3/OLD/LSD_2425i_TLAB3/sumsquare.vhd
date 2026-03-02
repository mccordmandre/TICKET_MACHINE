library ieee;
use ieee.std_logic_1164.ALL;

entity sumsquare is
    port (
        x : in std_logic_vector(3 downto 0);
        step : in std_logic;
        start : in std_logic;
        MRST : in std_logic;
        CLK : in std_logic;

        Cy : out std_logic;
        Dout : out std_logic_vector(7 downto 0);
    );
end sumsquare;

architecture Behavioral of sumsquare is
begin
    

end sumsquare;
