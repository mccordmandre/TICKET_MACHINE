library ieee;
use ieee.std_logic_1164.all;

entity alu_flags is
  port (
    iOV, iCB, CY: in std_logic;
    OP: in std_logic;
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
	 
	 signal pz4_to_Z: std_logic;

begin

    -- Parity and Zero Computation Unit
    flags_PZ4_Unit : flags_PZ4 port map(
        I0 => R(0),
        I1 => R(1),
        I2 => R(2),
        I3 => R(3),
        P => P,
        Z => pz4_to_Z
    );
	 
    Z <= pz4_to_Z;

    -- Logic for oGE (Greater or Equal in signed arithmetic)
    oGE <= not(R(3) xor iOV);

    -- Logic for oBE (Below or Equal in unsigned arithmetic)
    oBE <= iCB or pz4_to_Z;

    -- Pass-through for Overflow 
    oOV <= iOV;

    -- Conditional Carry/Borrow Output (depende de OPF - OP2)
    oCB <= iCB when OP = '0' else CY;
	 
	 


end architecture;