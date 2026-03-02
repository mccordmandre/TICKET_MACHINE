library ieee;
use ieee.std_logic_1164.all;


entity alu_lm is
	port (
		A, B : in std_logic_vector(3 downto 0);
		S0, S1: in std_logic;
        
		R : out std_logic_vector(3 downto 0);
		CY: out std_logic
	);
end alu_lm;



architecture structural of alu_lm is

    component lm_lsr is
        port (
          A , B : in  std_logic_vector(3 downto 0);
          R : out std_logic_vector(3 downto 0);
        );
    end component;

    component lm_asr is
        port (
            A , B : in  std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0);
          );
    end component;

    component lm_lsl
    port (
        A, B : in  std_logic_vector(3 downto 0);
        R : out std_logic_vector(3 downto 0);
    );
    end component;
    
    component lm_nand
        port (
            A, B : in std_logic_vector(3 downto 0);
            R : out std_logic_vector(3 downto 0)
        );
    end component;



    component lm_mux is
            port (
              A, B, C, D : in  std_logic_vector(3 downto 0);

				  
				  
              -- Selector de 1 bit
              S0, S1: in std_logic;
              Y : out std_logic_vector(3 downto 0);
              Cy : out std_logic
            );
    end component;


      
      -- sinais entre logicas e MUX4
    signal  lm_lsr_to_mux_signal,
            lm_asr_to_mux_signal,
            lm_lsl_to_mux_signal,
            lm_nand_to_mux_signal : 
            std_logic_vector(3 downto 0);
            
    signal CYA, CYB, CYC : std_logic;

begin

    lm_lsrUnit : lm_lsr port map (
        A => A,
        B => B,

        R => lm_lsr_to_mux_signal
    );

    lm_asrUnit : lm_asr port map (
        A => A,
        B => B,
        R => lm_asr_to_mux_signal
    );

    lm_lslUnit : lm_lsl port map (
        A => A,
        B => B,
        R => lm_lsl_to_mux_signal
    );
    
    lm_nandUnit : lm_nand port map (
        A => A,
        B => B,
        R => lm_nand_to_mux_signal
    );

    lm_muxUnit : lm_mux port map (
        A => lm_lsr_to_mux_signal,
        B => lm_asr_to_mux_signal,
        C => lm_lsl_to_mux_signal,
        D => lm_nand_to_mux_signal,
        S0 => S0,
        S1 => S1,
        Y => R,
        Cy => Cy
    );

end structural;