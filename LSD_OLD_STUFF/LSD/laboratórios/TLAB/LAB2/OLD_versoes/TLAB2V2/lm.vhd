library ieee;
use ieee.std_logic_1164.all;

entity lm is
    port(
        A, B: in std_logic_vector(3 downto 0);
        CBi: in std_logic;
        OPau: in std_logic;
        
        R: out std_logic_vector(3 downto 0);
        OV: out std_logic;          -- Overflow flag
        CBo: out std_logic          -- Carry/Borrow out
    );
end entity;

architecture structural of lm is

    component au_adder_subtractor is
        port(
            A, B: in std_logic_vector(3 downto 0);
            CBi: in std_logic; -- Carry/Borrow in
            OPau: in std_logic; -- '0' somar, '1' subtrair
            B3: out std_logic;
            R: out std_logic_vector(3 downto 0);
            CBo: out std_logic -- Carry/Borrow out
        );
    end component;

    component au_flags is
        port(
            A3, B3: in std_logic;
            iCBo: in std_logic;
            R3: in std_logic;
            OV: out std_logic;
            oCBo: out std_logic
        );
    end component;

    -- Internal signals

    signal CBo_signal: std_logic;                  -- Internal Carry/Borrow out
    signal A3_signal, B3_signal, R3_signal: std_logic;            -- Most significant bits
    signal R_intermediate: std_logic_vector(3 downto 0);

begin


    -- Extract the most significant bits from ENTITY AU ports!!!!!
    A3_signal <= A(3);

    -- Instantiate the adder_subtractor component
    au_adder_subtractor_Unit: au_adder_subtractor
        port map(
            A => A,
            B => B,
            B3 => B3_signal,
            CBi => CBi,
            OPau => OPau,
            R => R_intermediate,
            CBo => CBo_signal
        );

    R3_signal <= R_intermediate(3);
    

    -- Instantiate the flags component
    au_flags_Unit: au_flags
        port map(
            A3 => A3_signal,
            B3 => B3_signal,
            R3 => R3_signal,
            iCBo => CBo_signal,
            OV => OV,
            oCBo => CBo
        );
    

    
    R <= R_intermediate;


end architecture;