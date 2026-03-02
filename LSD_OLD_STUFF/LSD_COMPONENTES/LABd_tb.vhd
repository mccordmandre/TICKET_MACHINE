library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all; -- Para conversão entre std_logic_vector e integer

entity TLAB3_tb is
end entity;

architecture TLAB3_tb_arch of TLAB3_tb is

component TLAB3
    port
    (
        MCLK   : in std_logic;
        Rst    : in std_logic;
        Step   : in std_logic;
        Start  : in std_logic;
        X      : in std_logic_vector(3 downto 0);
        Cy     : out std_logic;
        sum    : out std_logic_vector(7 downto 0);
        HEX0, HEX1, HEX2 : out std_logic_vector(7 downto 0)
    );
end component;

-- UUT signals
signal RESET_TB, MCLK_TB : std_logic := '0';
signal Start_TB, Step_TB : std_logic;
signal X_TB : std_logic_vector(3 downto 0);
signal Cy_TB : std_logic;
signal sum_TB, HEX0, HEX1, HEX2 : std_logic_vector(7 downto 0);
-- signal DECIMAL_OUTPUT : integer range 0 to 999999; -- Sinal de saída para simulação em decimal

constant MCLK_PERIOD : time := 20 ns;
constant MCLK_HALF_PERIOD : time := MCLK_PERIOD / 2;
constant CLK_PERIOD : time := 20 ns;

begin

    -- Geração do clock principal
    MCLK_TB <= not MCLK_TB after MCLK_HALF_PERIOD;

    -- Instância da UUT
    UUT: TLAB3 port map(
        Rst        => RESET_TB,
        MCLK       => MCLK_TB, 
        X          => X_TB, 
        Step       => Step_TB, 
        Start      => Start_TB, 
        Cy         => Cy_TB, 
        sum        => sum_TB,
        HEX0       => HEX0,
        HEX1       => HEX1,
        HEX2       => HEX2
    );

    -- Conversão para valor decimal combinado diretamente para DECIMAL_OUTPUT
    process(HEX0, HEX1, HEX2)
    begin
        DECIMAL_OUTPUT <= to_integer(unsigned(HEX2 & HEX1 & HEX0));
    end process;

    stimulus: process 
    begin
        RESET_TB <= '1';    
        Start_TB <= '0';
        Step_TB <= '0';
        X_TB <= "0000";
        wait for CLK_PERIOD;

        RESET_TB <= '0';

        -- Display -> Soma = 0
        Start_TB <= '1';
        Step_TB <= '0';
        X_TB <= "0010"; 
        wait for CLK_PERIOD;

        -- Display -> X² = 4
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 4
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 9
        X_TB <= "0011";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 13
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 16
        X_TB <= "0100";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 29
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 25
        X_TB <= "0101";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 54
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 36
        X_TB <= "0110";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 90
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 49
        X_TB <= "0111";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 139
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 64
        X_TB <= "1000";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 203
        Step_TB <= '0';
        wait for CLK_PERIOD;

        -- Display -> X² = 81
        X_TB <= "1001";
        Step_TB <= '1';
        wait for CLK_PERIOD;

        -- Display -> Soma = 284. Excedeu 256, Carry gerado
        Step_TB <= '0';
        wait for CLK_PERIOD;

		-- Display -> Soma = 284
		START_TB <= '0';

		-- Display -> Soma = 0
		START_TB <= '1';


        wait;
    end process;

end architecture;
