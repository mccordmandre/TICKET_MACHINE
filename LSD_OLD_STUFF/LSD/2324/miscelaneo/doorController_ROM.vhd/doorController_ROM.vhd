library ieee;
use ieee.std_logic_1164.all;

entity doorController_ROM is
	port(
		address : in std_logic_vector(4 downto 0);
		data : out std_logic_vector(3 downto 0)
	);
end doorController_ROM;

architecture logicFunction of doorController_ROM is

begin

	data <= "0000" when address = "00000" else	// Addr: 0, Data: 0
		"0000" when address = "00001" else	// Addr: 1, Data: 0
		"0000" when address = "00010" else	// Addr: 2, Data: 0
		"0000" when address = "00011" else	// Addr: 3, Data: 0
		"0100" when address = "00100" else	// Addr: 4, Data: 4
		"0100" when address = "00101" else	// Addr: 5, Data: 4
		"0100" when address = "00110" else	// Addr: 6, Data: 4
		"0100" when address = "00111" else	// Addr: 7, Data: 4

		"0110" when address = "01000" else	// Addr: 8, Data: 6
		"0110" when address = "01001" else	// Addr: 9, Data: 6
		"1000" when address = "01010" else	// Addr: A, Data: 8
		"1000" when address = "01011" else	// Addr: B, Data: 8
		"0110" when address = "01100" else	// Addr: C, Data: 6
		"0110" when address = "01101" else	// Addr: D, Data: 6
		"1000" when address = "01110" else	// Addr: E, Data: 8
		"1000" when address = "01111" else	// Addr: F, Data: 8

		"1100" when address = "10000" else	// Addr: 10, Data: C
		"1100" when address = "10001" else	// Addr: 11, Data: C
		"1100" when address = "10010" else	// Addr: 12, Data: C
		"1100" when address = "10011" else	// Addr: 13, Data: C
		"1000" when address = "10100" else	// Addr: 14, Data: 8
		"1000" when address = "10101" else	// Addr: 15, Data: 8
		"1000" when address = "10110" else	// Addr: 16, Data: 8
		"1000" when address = "10111" else	// Addr: 17, Data: 8

		"1111" when address = "11000" else	// Addr: 18, Data: F
		"0001" when address = "11001" else	// Addr: 19, Data: 1
		"1111" when address = "11010" else	// Addr: 1A, Data: F
		"0001" when address = "11011" else	// Addr: 1B, Data: 1
		"0101" when address = "11100" else	// Addr: 1C, Data: 5
		"0101" when address = "11101" else	// Addr: 1D, Data: 5
		"0101" when address = "11110" else	// Addr: 1E, Data: 5
		"0101";					// Addr: 1F, Data: 5

end logicFunction;