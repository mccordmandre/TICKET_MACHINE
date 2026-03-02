library ieee;
use ieee.std_logic_1164.all;

entity adder_subtractor is
    port(
        A, B: in std_logic_vector(3 downto 0);
        CBi: in std_logic; -- Carry/Borrow in
        OPau: in std_logic; -- '0' somar, '1' subtrair
		B3: out std_logic;
        R: out std_logic_vector(3 downto 0);
        CBo: out std_logic -- Carry/Borrow out
    );
end entity;

architecture structural of adder_subtractor is

    component adder is
        port(
            A, B: in std_logic_vector(3 downto 0);
            C0: in std_logic;
            C4: out std_logic;
            S: out std_logic_vector(3 downto 0)
        );
    end component;

    signal B_modified: std_logic_vector(3 downto 0);
    signal OPau_vector: std_logic_vector(3 downto 0);
    signal C4_signal: std_logic;

begin

    -- Create a vector where all bits are OPau
    OPau_vector <= (others => OPau);

    -- Modify B based on the operation (addition or subtraction)
    B_modified <= B xor OPau_vector;

    -- Instantiate the adder component
    adder_unit: adder port map (
        A => A,
        B => B_modified,
        C0 => CBi xor OPau,
        S => R,
        C4 => C4_signal
    );

    -- Compute the final Carry/Borrow out
    CBo <= C4_signal xor OPau;
	B3 <= B_modified(3);

end architecture;