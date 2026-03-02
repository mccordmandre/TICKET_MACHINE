//LABc.vhd


library IEEE;
use IEEE.std_logic_1164.all;

entity LABc is -- Aritmetic Unit 

	port(
	A, B: in std_logic_vector(3 downto 0);
	CBi: in std_logic; --Carry/Borrow IN
	OPau: in std_logic;
	R: out std_logic_vector(3 downto 0);
	CBo, OV: out std_logic --Carry/Borrow OUT , Overload
	);

end LABc;

architecture structural of LABc is
	
	component UA is	--UA = Unidade Aritmética
		port(
			A, B: in std_logic_vector(3 downto 0);
			CBi: in std_logic;
			OPau: in std_logic;
			R: out std_logic_vector(3 downto 0);
			CBo, OV: out std_logic
		);
	end component;
	
	signal signalCBi_to_C0: std_logic;
	signal signalOPau: std_logic;
	signal signalA3_to_Flag: std_logic;
	signal signalB3_to_Flag: std_logic;	--Depois do XOR

begin
	
	
end structural;

