library ieee;
use ieee.std_logic_1164.all;

entity Flag_Alu is
  port (
	iOV, iCB, OP, CY: in std_logic;
    R: in  std_logic_vector(3 downto 0);
	BE, oGE : out std_logic; --BE = Below or Equal; GE= Greater or Equal
    P, Z : out std_logic;
	oOV, oCB : out std_logic
  );
end entity;

architecture structural of Flag_Alu is

	component PZ4 is
		port(
			R: in std_logic_vector(3 downto 0);
			P, Z: out std_logic
		);
	end component;

begin

	PZ4_Unit : PZ4 port map(
		R(3) => R(3),
		R(2) => R(2),
		R(1) => R(1),
		R(0) => R(0),
		P => P,
		Z => Z
	);

end structural;