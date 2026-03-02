library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity STATES is
    port (
        Q     : in std_logic_vector(1 downto 0); -- Estado atual da máquina
        start : in std_logic;                    -- Sinal de início
        step  : in std_logic;                    -- Sinal de passo
        D     : out std_logic_vector(1 downto 0);-- Próximo estado
        M     : out std_logic;                   -- Controle (M)
        rst   : out std_logic;                   -- Reset (Rst)
        sum   : out std_logic                    -- Sinal de soma (Sum)
    );
end STATES;

architecture Behavioral of STATES is
begin
    -- Define o sinal de soma: Ativo apenas em estados específicos (Q1=1, Q0=0) e com start ativo,
    -- enquanto step está desativado.
    sum <= Q(1) AND NOT(Q(0)) AND start AND NOT(step);

    -- Define o sinal de controle (M): Ativo em qualquer estado que não seja (Q1=1, Q0=0).
    M <= NOT(Q(1)) OR (Q(1) AND Q(0));

    -- Define o reset: Ativo apenas no estado inicial (Q1=0, Q0=0) com start ativo.
    rst <= NOT(Q(1)) AND NOT(Q(0)) AND start;

    -- Define o próximo estado (D1): Determinado pela lógica dos estados e sinais de entrada.
    D(1) <= (NOT(Q(1)) AND Q(0) AND start AND step) OR 
            (Q(1) AND start);

    -- Define o próximo estado (D0): Determinado pelo estado inicial e a presença de start.
    D(0) <= (NOT(Q(1)) AND NOT(Q(0)) AND start) OR 
            (start AND NOT(step));
end Behavioral;
