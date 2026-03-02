library ieee;
use ieee.std_logic_1164.all;


entity alu_LUcirc is
	port (
		A, B : in std_logic_vector(3 downto 0);
		S0, S1: in std_logic;
		R : out std_logic_vector(3 downto 0);
		CY: out std_logic
	);
end alu_LUcirc;



architecture structural of alu_LUcirc is
    
    component lm_NAND4S
        port (
            A, B : in std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0)
        );
    end component;

    component lm_LSL4
        port (
            A, B : in  std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0)
        );
    end component;


    component lm_lsr is
        port (
          A , B : in  std_logic_vector(3 downto 0);
          R : out std_logic_vector(3 downto 0)
        );
    end component;

    component lm_asr is
        port (
            A , B : in  std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0)
          );
    end component;

    component lm_MUX4 is
            port (
              A, B, C, D : in  std_logic_vector(3 downto 0);
              -- Selector de 1 bit
              S : in std_logic_vector (1 downto 0);
              Y : out std_logic_vector(3 downto 0);
              Cy : out std_logic
            );
      end component;

      -- sinais entre logicas e MUX4
    signal lm_NAND4S_lm_MUX4_signal, lm_LSL4_lm_MUX4_signal, lm_lsr_lm_MUX4_signal, lm_asr_lm_MUX4_signal : std_logic_vector(3 downto 0);




begin

    lm_lsrUnit : lm_lsr port map (
        A => A,
        B => B,
        R => lm_lsr_lm_MUX4_signal
    );

    lm_asrUnit : lm_asr port map (
        A => A,
        B => B,
        R => lm_asr_lm_MUX4_signal
    );

    lm_LSL4Unit : lm_LSL4 port map (
        A => A,
        B => B,
        R => lm_LSL4_lm_MUX4_signal
    );
    
    lm_NAND4Unit : lm_NAND4S port map (
        A => A,
        B => B,
        R => lm_NAND4S_lm_MUX4_signal
    );

    lm_MUX4Unit : lm_MUX4 port map (
        A => lm_lsr_lm_MUX4_signal,
        B => lm_asr_lm_MUX4_signal,
        C => lm_LSL4_lm_MUX4_signal,
        D => lm_NAND4S_lm_MUX4_signal,
        S(0) => S(0),
        S(1) => S(1),
        Y => R,
        Cy => Cy
    );

end structural;