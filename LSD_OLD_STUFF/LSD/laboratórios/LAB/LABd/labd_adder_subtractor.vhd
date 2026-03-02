library ieee;
use ieee.std_logic_1164.all;

entity au_adder_subtractor is
    port(
        A, B: in std_logic_vector(3 downto 0);
        CBi: in std_logic; -- Carry/Borrow in
        OPau: in std_logic; -- '0' somar, '1' subtrair
        
		B3: out std_logic;
        R: out std_logic_vector(3 downto 0);
        CBo: out std_logic -- Carry/Borrow out
    );
end entity;

architecture structural of au_adder_subtractor is

    component au_adder is
        port(
            A, B: in std_logic_vector(3 downto 0);
            C0: in std_logic;
            C4: out std_logic;
            S: out std_logic_vector(3 downto 0)
        );
    end component;

    signal B_modified: std_logic_vector(3 downto 0);
    signal C4_signal: std_logic;
	signal C0_signal: std_logic;

begin


    -- Modify B based on the operation (addition or subtraction)
    B_modified(0) <= B(0) xor OPau;
    B_modified(1) <= B(1) xor OPau;
    B_modified(2) <= B(2) xor OPau;
    B_modified(3) <= B(3) xor OPau; 


	 
	C0_signal <= CBi xor OPau;

    -- Instantiate the adder component
    au_adder_unit: au_adder port map (
        A => A,
        B => B_modified,
        C0 => c0_signal,
        S => R,
        C4 => C4_signal
    );

    -- Compute the final Carry/Borrow out
    CBo <= C4_signal xor OPau;
	B3 <= B_modified(3);

end architecture;