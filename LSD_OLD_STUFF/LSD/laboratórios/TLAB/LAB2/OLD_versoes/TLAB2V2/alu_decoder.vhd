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

	-- OPA: OP0 = 0, OP1 = 1 (OP2 is don't care)
	OPA <= (not(OP0) and OP1 and not(OP2)) OR ( not(OP0) and OP1 and OP2);
	-- OPB: OP0 = 0, OP2 = 1 (Corrected to match typical logic conditions)
	OPB <= (not(OP0) and not(OP1) and OP2) OR ( not(OP2) and OP1 and OP2);
	-- OPC: Mirrors OP0
	OPC <= OP0;
	-- OPD: OP0 = 1, OP1 = 0 (OP2 is don't care)
	OPD <= (OP0 and not(OP1) and not(OP2)) OR ( OP0 and not(OP1) and OP2);
	-- OPE: OP0 = 1, OP2 = 1 (OP1 is don't care)
	OPE <= (OP0 and not(OP1) and OP2) OR ( OP0 and OP1 and not(OP2));
	-- OPF: Mirrors OP0
	OPF <= OP0;
	
end behavioral;




/*
architecture behavioral of decoder is
	begin
		process(OP0, OP1, OP2)
		begin
			-- Initialize all outputs to '0' at the start of each process invocation
			OPA <= '0';
			OPB <= '0';
			OPC <= '0';
			OPD <= '0';
			OPE <= '0';
			OPF <= '0';
	
			-- Use a case statement to handle each possible input combination
			case (OP0 & OP1 & OP2) is
				when "000" =>
					OPA <= '0';
					OPB <= '0';
					OPC <= '0'; -- Example, no explicit requirement from description
				when "001" =>
					OPA <= '0';
					OPB <= '1';
				when "010" =>
					OPA <= '1';
					OPB <= '0';
				when "011" =>
					OPA <= '1';
					OPB <= '1';
				when "100" =>
					OPC <= '1';
					OPD <= '0';
					OPE <= '0';
					OPF <= '1';
				when "101" =>
					OPC <= '1';
					OPD <= '0';
					OPE <= '1';
					OPF <= '1';
				when "110" =>
					OPC <= '1';
					OPD <= '1';
					OPE <= '0';
					OPF <= '1';
				when "111" =>
					OPC <= '1';
					OPD <= '1';
					OPE <= '1';
					OPF <= '1';
				when others =>
					-- Handle unexpected cases
					null;
			end case;
		end process;
	end architecture;

	*/