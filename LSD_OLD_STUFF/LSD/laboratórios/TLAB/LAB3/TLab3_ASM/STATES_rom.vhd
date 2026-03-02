library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity STATES is
    port (
        Q     : in std_logic_vector(1 downto 0);
        start : in std_logic;
        step  : in std_logic;
        D     : out std_logic_vector(1 downto 0);
        M     : out std_logic;
        rst   : out std_logic;
        sum   : out std_logic
    );
end STATES;

architecture ROM of STATES is

    signal addr : std_logic_vector(3 downto 0);
    signal rom_out : std_logic_vector(4 downto 0);

begin

    -- Combina as entradas para formar o endereço (Q1 & Q0 & Start & Step).
    -- Q(1 downto 0): Estado atual, Start: Sinal de início, Step: Sinal de passo.
    addr <= Q & start & step;

    -- Lógica da ROM: Cada linha representa uma combinação de entradas com as saídas associadas.

    -- D=00: Apresenta a soma anterior
    rom_out <= "00010" WHEN addr = "0000" ELSE -- Q1=0, Q0=0, Start=0, Step=0
               "00010" WHEN addr = "0001" ELSE -- Q1=0, Q0=0, Start=0, Step=1

    -- D=01: Soma apagada, Step ainda inativo
               "01110" WHEN addr = "0010" ELSE -- Q1=0, Q0=0, Start=1, Step=0
               "01110" WHEN addr = "0011" ELSE -- Q1=0, Q0=0, Start=1, Step=1

    -- D=00: Apresenta a soma anterior
               "00010" WHEN addr = "0100" ELSE -- Q1=0, Q0=1, Start=0, Step=0
               "00010" WHEN addr = "0101" ELSE -- Q1=0, Q0=1, Start=0, Step=1

    -- D=10: Mostra o valor de X²
               "01000" WHEN addr = "0110" ELSE -- Q1=0, Q0=1, Start=1, Step=0
               "10000" WHEN addr = "0111" ELSE -- Q1=0, Q0=1, Start=1, Step=1

    -- D=00: Apresenta a soma anterior
               "00000" WHEN addr = "1000" ELSE -- Q1=1, Q0=0, Start=0, Step=0
               "00000" WHEN addr = "1001" ELSE -- Q1=1, Q0=0, Start=0, Step=1

    -- D=11: Mostra o valor da soma após X² ser somado ao registrador
               "11101" WHEN addr = "1010" ELSE -- Q1=1, Q0=0, Start=1, Step=0
               "10000" WHEN addr = "1011" ELSE -- Q1=1, Q0=0, Start=1, Step=1

    -- D=00: Apresenta a soma anterior
               "00010" WHEN addr = "1100" ELSE -- Q1=1, Q0=1, Start=0, Step=0
               "00010" WHEN addr = "1101" ELSE -- Q1=1, Q0=1, Start=0, Step=1

    -- D=11: Mostra o valor da soma após X² ser somado ao registrador
               "11110" WHEN addr = "1110" ELSE -- Q1=1, Q0=1, Start=1, Step=0

    -- D=10: Mostra o valor de X²
               "10010" WHEN addr = "1111" ELSE -- Q1=1, Q0=1, Start=1, Step=1

    -- Caso padrão para segurança (evita estados indefinidos).
               "00000"; 

    -- Mapeia as saídas da ROM para as saídas da entidade.
    -- D: Próximo estado, M: Controle, Rst: Reset, Sum: Sinal de soma.
    D <= rom_out(4 downto 3);
    M <= rom_out(2);
    rst <= rom_out(1);
    sum <= rom_out(0);

end ROM;
