library ieee;
use ieee.std_logic_1164.all;


entity DecodeOp is
  port(
  --Input port
  
    OP0, OP1, OP2 : in  std_logic;
  
  --Output port 
  
	 OPA, OPB, OPC, OPD, OPE, OPF : out std_logic);  

	 
  end  DecodeOp;
 
architecture structural of DecodeOP is
  
  begin
  OPA <= not OP1;
  OPB <= OP0;  
  OPC <= OP2; 
  OPD <= OP0;  
  OPE <= OP1;  
  OPF <= OP2;

end architecture;