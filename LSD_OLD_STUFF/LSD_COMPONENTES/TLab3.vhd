library ieee;
use ieee.std_logic_1164.all;

entity TLAB3 is
    port (
        MCLK   : in std_logic;
        Rst    : in std_logic;
        Step   : in std_logic;
        Start  : in std_logic;
        X      : in std_logic_vector(3 downto 0);
        Cy     : out std_logic;
        -- sum : out std_logic_vector(7 downto 0); -- ???
        HEX0, HEX1, HEX2 : out std_logic_vector(7 downto 0)
    );
end TLAB3;

architecture Behavioral of TLAB3 is

    -- Sinais
    signal CLKDIV_signal : std_logic;
    signal rstout        : std_logic;
    signal Disp_signal   : std_logic;
    signal Q_signal      : std_logic_vector(7 downto 0);
    signal sum_signal    : std_logic;

    -- Componentes
    component CaminhoDeDados
        port (
            A      : in std_logic_vector(3 downto 0);
            M      : in std_logic;
            Sum    : in std_logic;
            rst    : in std_logic;
            ClkDiv : in std_logic;
            F      : out std_logic_vector(7 downto 0);
            CY     : out std_logic
        );
    end component;

    component CTRL
        port (
            MSTCLK : in std_logic;
            RESET  : in std_logic;
            STEP   : in std_logic;
            START  : in std_logic;
            Clkout : out std_logic;
            Rst    : out std_logic;
            M      : out std_logic;
            Sum    : out std_logic
        );
    end component;

    component decoderHex
        port (
            bin   : in std_logic_vector(7 downto 0);
            clear : in std_logic;
            HEX0  : out std_logic_vector(7 downto 0);
            HEX1  : out std_logic_vector(7 downto 0);
            HEX2  : out std_logic_vector(7 downto 0)
        );
    end component;

begin

    -- Instância do componente CTRL
    U1 : CTRL
        port map (
            MSTCLK => MCLK,
            RESET  => Rst,
            STEP   => Step,
            START  => Start,
            Clkout => CLKDIV_signal,
            Rst    => rstout,
            M      => Disp_signal,
            Sum    => sum_signal
        );

    -- Instância do componente CaminhoDeDados
    U2 : CaminhoDeDados
        port map (
            A      => X,
            M      => Disp_signal,
            Sum    => sum_signal,
            rst    => rstout,
            ClkDiv => CLKDIV_signal,
            F      => Q_signal,
            CY     => Cy
        );

    -- Instância do componente decoderHex
    U4 : decoderHex
        port map (
            bin    => Q_signal,
            clear  => rstout,
            HEX0   => HEX0,
            HEX1   => HEX1,
            HEX2   => HEX2
        );

end Behavioral;
