library ieee;
use ieee.std_logic_1164.all;

entity alu_flags is
  port (
    iOV, iCB, OP, CY: in std_logic;  -- control signals
    R: in std_logic_vector(3 downto 0);
    oBE, oGE: out std_logic;  -- Below or Equal/Greater or Equal
    P, Z: out std_logic;  -- Parity and Zero flags
    oOV, oCB: out std_logic  -- Output Overflow and Output Carry/Borrow flags
  );
end entity;

architecture structural of alu_flags is
    component PZ4 is
        port(
            I0, I1, I2, I3: in std_logic;
            P, Z: out std_logic
        );
    end component;

    -- Signal for Zero check, for BE and oGE logic
    signal zero_flag: std_logic;

begin
    -- Parity and Zero Computation Unit
    PZ4_Unit : PZ4 port map(
        I0 => R(0),
        I1 => R(1),
        I2 => R(2),
        I3 => R(3),
        P => P,
        Z => zero_flag
    );

    -- Pass-through for Overflow and Carry/Borrow
    oOV <= iOV;
    oCB <= iCB;

	-- Logic for oBE and oGE
	oGE <= (not oOV and not R(3)) or (oOV and R(3));
	oBE <= not oGE;

end architecture;
