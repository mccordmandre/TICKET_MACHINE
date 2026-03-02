library ieee;
use ieee.std_logic_1164.all;

entity alu_decoder is
	port(
		OP0, OP1, OP2: in std_logic;
		OPA, OPB, OPC, OPD, OPE, OPF: out std_logic
	);
	
end entity;

architecture behavioral of alu_decoder is

begin
	-- Yor0			 		OP2 - |OPA| - OP0
	OPA <= OP1;

	-- OPau(+ ou -)			OP2 - OP1 - |OPB|
	OPB <= OP0;

	-- alu_mux - alu/lm		|OPC| - OP1 - OP0
	OPC <= OP2;

	-- lm_mux  				1 - |OP1| - |OP0|		
	OPD <= OP0;
	OPE <= OP1;

	-- Flag					0 - |-| - |-|
	OPF <= OP2;


end behavioral;