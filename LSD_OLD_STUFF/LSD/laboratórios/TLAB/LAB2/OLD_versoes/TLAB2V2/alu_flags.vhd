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
    component flags_PZ4 is
        port(
            I0, I1, I2, I3: in std_logic;
            P, Z: out std_logic
        );
    end component;

begin
    -- Parity and Zero Computation Unit
    flags_PZ4_Unit : flags_PZ4 port map(
        I0 => R(0),
        I1 => R(1),
        I2 => R(2),
        I3 => R(3),
        P => P,
        Z => Z
    );

    -- Pass-through for Overflow 
    oOV <= iOV;

    -- Conditional Carry/Borrow Output
    oCB <= iCB when OP = '0' else CY;

	-- Logic for oBE and oGE
	oGE <= not(R(3) xor OV);



	oBE <= iCB when OP = '0' else CY;

end architecture;
