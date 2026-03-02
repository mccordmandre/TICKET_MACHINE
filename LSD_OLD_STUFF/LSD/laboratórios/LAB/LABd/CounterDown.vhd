library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CounterDown is
    port (
        CLK     : in std_logic;
        PL      : in std_logic;
        CE      : in std_logic;
        dataIn  : in std_logic_vector(3 downto 0);
        Q       : out std_logic_vector(3 downto 0)
    );
end CounterDown;

architecture structural of CounterDown is
    signal count_reg : std_logic_vector(3 downto 0) := (others => '0');


    -- Componentes
    Component FFD IS
    PORT(	CLK : in std_logic;
            RESET : in STD_LOGIC;
            SET : in std_logic;
            D : IN STD_LOGIC;
            EN : IN STD_LOGIC;
            Q : out std_logic
            );
    END component;



begin

    FFD_unit1 : FFD
    port map (  
        CLK => CLK,
        RESET => PL,
        SET => CE,
        D => dataIn(3),
        EN => '1',
        Q => count_reg(3)
    );

    FFD_unit2 : FFD
    port map (  
        CLK => CLK,
        RESET => PL,
        SET => CE,
        D => dataIn(2),
        EN => '1',
        Q => count_reg(2)
    );
    

end Behavioral;
