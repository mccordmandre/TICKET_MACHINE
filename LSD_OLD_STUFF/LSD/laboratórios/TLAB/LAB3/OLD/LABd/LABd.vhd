library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LABd is
    port(
        dataIn      : in std_logic_vector(3 downto 0);
        CLK         : in std_logic;
        PL          : in std_logic;
        CE          : in std_logic;
        clear       : in std_logic;
        CountValue  : out std_logic_vector(3 downto 0);
        SEG7        : out std_logic_vector(7 downto 0); -- dp g f e d c b a
        TC          : out std_logic
    );
end LABd;

architecture Structural of LABd is

    -- Componentes
    component CLKDIV
        generic(div: natural := 50000000);
        port (
            clk_in  : in std_logic;
            clk_out : out std_logic
        );
    end component;

    component CounterDown
        port (
            CLK     : in std_logic;
            PL      : in std_logic;
            CE      : in std_logic;
            dataIn  : in std_logic_vector(3 downto 0);
            Q       : out std_logic_vector(3 downto 0)
        );
    end component;

    component decoderHex
        port (
            A       : in std_logic_vector(3 downto 0);
            clear   : in std_logic;
            HEX0    : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Sinais internos
    signal CLK_1Hz : std_logic;
    signal count_value_signal : std_logic_vector(3 downto 0);

begin

    -- Instanciação do CLKDIV
    CLKDIV_inst : CLKDIV
        generic map (
            div => 50000000  -- Divide 50 MHz para obter 1 Hz
        )
        port map (
            clk_in  => CLK,
            clk_out => CLK_1Hz
        );

    -- Instanciação do CounterDown
    Counter_inst : CounterDown
        port map (
            CLK     => CLK_1Hz,
            PL      => PL,
            CE      => CE,
            dataIn  => dataIn,
            Q       => count_value_signal
        );

    -- Instanciação do decoderHex
    decoder_inst : decoderHex
        port map (
            A       => count_value_signal,
            clear   => clear,
            HEX0    => SEG7
        );

    -- Comparador ==0 para gerar TC
    TC <= '1' when count_value_signal = "0000" else '0';

    -- Conexão do valor do contador à saída CountValue
    CountValue <= count_value_signal;

end Structural;