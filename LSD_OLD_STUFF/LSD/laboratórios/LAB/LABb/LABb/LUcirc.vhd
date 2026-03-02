library ieee;
use ieee.std_logic_1164.all;


entity LUcirc
	port (
		X, Y : in std_logic_vector(3 downto 0);
		OP : in std_logic;
		R : out std_logic_vector(3 downto 0)
	);
end LUcirc;



architecture structural of LUcirc is
    
    component NAND4S
        port (
            A, B : in std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0)
        );
    end component;

    component LSL4
        port (
            A, B : in  std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0)
        );
    end component;

    component MUX4 is
        port (
            A, B : in  std_logic_vector(3 downto 0);
            
            -- Selector de 1 bit
            S : in std_logic;
        
            Y : out std_logic_vector(3 downto 0)
        );
      end component;

    signal signalNAND4S, signalLSL4 : std_logic_vector (3 downto 0);


begin

    NAND4SUnit : NAND4S port map (
        A => X,
        B => Y,
        R => signalNAND4S
    );

    LSL4Unit : LSL4 port map (
        A => X,
        B => Y,
        R => signalLSL4
    );

    MUX4Unit : MUX4 port map (
        A => signalNAND4S,
        B => signalLSL4,
        S => OP,
        Y => R
    );

end structural;