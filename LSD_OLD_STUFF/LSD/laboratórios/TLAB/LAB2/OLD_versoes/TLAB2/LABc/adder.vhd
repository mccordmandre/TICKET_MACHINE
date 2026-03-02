library ieee;
use ieee.std_logic_1164.all;

entity adder is
    port(
        A, B: in std_logic_vector(3 downto 0);
        C0: in std_logic;
        C4: out std_logic;
        S: out std_logic_vector(3 downto 0);
    );
end entity;

architecture structural of adder is

    component full_adder is
        port(
            A, B, Cin: in std_logic;
            S, Cout: out std_logic
        );
    end component;

    signal C1, C2, C3 : std_logic;


begin

    full_adder_unit_0 : full_adder port map (
            A => A(0),
            B => B(0),
            Cin => C0,
            S => S(0),
            Cout => C1
        );

    full_adder_unit_1 : full_adder port map (
            A => A(1),
            B => B(1),
            Cin => C1,
            S => S(1),
            Cout => C2
        );

    full_adder_unit_2 : full_adder port map (
            A => A(2),
            B => B(2),
            Cin => C2,
            S => S(2),
            Cout => C3
        );

    full_adder_unit_3 : full_adder port map (
            A => A(3),
            B => B(3),
            Cin => C3,
            S => S(3),
            Cout => C4
        );
end architecture;
