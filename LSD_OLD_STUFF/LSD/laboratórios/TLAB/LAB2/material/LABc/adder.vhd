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
























LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity adder is
    port(
        A, B: in std_logic_vector(3 downto 0);
        C0: in std_logic;
        C4: out std_logic;
        S: in std_logic_vector(3 downto 0);
    );
end entity;

architecture behavioral of adder is

    signal C1, C2, C3: std_logic;

    begin
        S(0) <= A(0) xor B(0) xor C0;
        C1 <= (A(0) and B(0)) or (A(0) and C0) or (B(0) and C0);

        S(1) <= A(1) xor B(1) xor C1;
        C2 <= (A(1) and B(1)) or (A(1) and C1) or (B(1) and C1);

        S(2) <= A(2) xor B(2) xor C2;
        C3 <= (A(2) and B(2)) or (A(2) and C2) or (B(2) and C2);

        S(3) <= A(3) xor B(3) xor C3;
        C4 <= (A(3) and B(3)) or (A(3) and C3) or (B(3) and C3);
    
end architecture;