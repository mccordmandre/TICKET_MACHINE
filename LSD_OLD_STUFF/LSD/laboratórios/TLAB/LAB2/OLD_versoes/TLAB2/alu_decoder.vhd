library ieee;
use ieee.std_logic_1164.all;

entity alu_decoder is
    port(
        OP0, OP1, OP2: in std_logic;
        OPA, OPB, OPC, OPD, OPE, OPF: out std_logic
    );
end entity;



architecture Behavioral of alu_decoder is
    begin
        -- Implementação das expressões lógicas
    
        -- OPA = not OP0 and OP1
        OPA <= (not OP0) and OP1;
    
        -- OPB = not OP0 and OP2
        OPB <= (not OP0) and OP2;
    
        -- OPC = OP0
        OPC <= OP0;
    
        -- OPD = OP0 and OP1
        OPD <= OP0 and OP1;
    
        -- OPE = OP0 and OP2
        OPE <= OP0 and OP2;
    
        -- OPF = OP0
        OPF <= OP0;
    end architecture Behavioral;
