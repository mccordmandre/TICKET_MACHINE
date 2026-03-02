library ieee;
use ieee.std_logic_1164.all;

entity majority is
    port (
        b : in std_ulogic_vector(5 downto 0);
        M : out std_ulogic_vector(1 downto 0)
    );
end majority;

architecture structural of majority is
    
    component oneCounter
        port (
            a : in std_ulogic_vector(2 downto 0);
            S : out std_logic_vector(1 downto 0)
        );
    end component;

    component decisionLogic
        port (
            x : in std_logic_vector(1 downto 0);
            y : in std_logic_vector(1 downto 0);
            D : out std_ulogic_vector(1 downto 0)
        );
    end component;

    # sinal que sai dos oneCounts
    signal oneCountA, oneCountB : std_logic_vector (1 downto 0);



begin

    oneCountUnitA : oneCounter port map (
        a => b(2 downto 0),
        S => oneCountA
    );

    oneCountUnitB : oneCounter port map (
        a => b(5 downto 3),
        S => oneCountB
    );

    decisionUnit : decisionLogic port map (
        x => oneCountA,
        y => oneCountB,
        D => M
    );

end structural;