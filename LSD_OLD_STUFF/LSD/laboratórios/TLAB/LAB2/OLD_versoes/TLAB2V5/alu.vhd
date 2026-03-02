library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity alu is
    port(	
        X, Y: in std_logic_vector(3 downto 0);
        OP: in std_logic_vector(2 downto 0);
        CBi: in std_logic;

        R: out std_logic_vector(3 downto 0);

        CBo: out std_logic;
        OV: out std_logic;
        Z: out std_logic;
        P: out std_logic;
        GE: out std_logic;
        BE: out std_logic
    );
end entity;

architecture structural of alu is

    -- Component Declarations

    component au is
        port(
            A, B: in std_logic_vector(3 downto 0);
            CBi: in std_logic;
            OPau: in std_logic;

            R: out std_logic_vector(3 downto 0);
            OV: out std_logic;          -- Overflow flag
            CBo: out std_logic          -- Carry/Borrow out
        );
    end component;

    component alu_lm is
        port(
            A, B: in std_logic_vector(3 downto 0);
            S0, S1: in std_logic;

            R: out std_logic_vector(3 downto 0);
            CY: out std_logic
        );
    end component;

    component alu_flags is	
        port(
            iOV, iCB, OP, CY: in std_logic;  -- Control signals
            R: in std_logic_vector(3 downto 0);

            oBE, oGE: out std_logic;  -- Below or Equal/Greater or Equal
            P, Z: out std_logic;      -- Parity and Zero flags
            oOV, oCB: out std_logic   -- Output Overflow and Carry/Borrow flags
        );
    end component;

    component alu_decoder is
        port(
            OP0, OP1, OP2: in std_logic;
            
            OPA, OPB, OPC, OPD, OPE, OPF: out std_logic
        );
    end component;

    component alu_mux is
        port(
            A, B: in std_logic_vector(3 downto 0);
            S: in std_logic;
            Y: out std_logic_vector(3 downto 0)
        );
    end component;



    -- au signals
    signal Yor0_to_au_signal: std_logic_vector(3 downto 0);          -- Modified B input for 'au'
    signal au_R_to_mux_signal: std_logic_vector(3 downto 0);          -- Result from 'au'
    signal au_OV_to_flags_signal, au_CBo_to_flags_signal: std_logic;   -- Overflow and Carry/Borrow signals from 'au'

    -- lm signals
    signal lm_R_to_mux: std_logic_vector(3 downto 0);          -- Result from 'alu_lm'
    signal lm_CY_to_flags_signal: std_logic;                        -- Carry out from 'alu_lm'

    -- mux signals
    signal mux_Y: std_logic_vector(3 downto 0);          -- Result from 'alu_lm'

    -- Decoder signals
    signal OPA_signal, OPB_signal, OPC_signal, OPD_signal, OPE_signal, OPF_signal: std_logic;



begin

    -- Instantiate alu_decoder
    alu_decoder_inst: alu_decoder port map(
        OP0 => OP(0),
        OP1 => OP(1),
        OP2 => OP(2),
        OPA => OPA_signal,
        OPB => OPB_signal,
        OPC => OPC_signal,
        OPD => OPD_signal,
        OPE => OPE_signal,
        OPF => OPF_signal
    );


    -- Yor0
    Yor0_to_au_signal <= Y when OPA_signal = '1' else "0000";

    -- Instantiate au
    au_inst: au port map(
        A => X,
        B => Yor0_to_au_signal,
        CBi => CBi,
        OPau => OPB_signal,

        R => au_R_to_mux_signal,
        OV => au_OV_to_flags_signal,
        CBo => au_CBo_to_flags_signal
    );

    -- Instantiate alu_lm
    alu_lm_Unit: alu_lm port map(
        A => X,
        B => Y,
        S0 => OPD_signal,
        S1 => OPE_signal,

        R => lm_R_to_mux,
        CY => lm_CY_to_flags_signal
    );

    -- Instantiate alu_mux
    alu_mux_inst: alu_mux port map(
        A => au_R_to_mux_signal,
        B => lm_R_to_mux,
        S => OPC_signal,

        Y => mux_Y    -- Output connected to top-level R
    );

    -- Instantiate alu_flags
    alu_flags_inst: alu_flags port map(
        iOV => au_OV_to_flags_signal,
        iCB => au_CBo_to_flags_signal,
        OP => OPF_signal,
        CY => lm_CY_to_flags_signal,
        R => mux_Y,

        oBE => BE,
        oGE => GE,
        P => P,
        Z => Z,
        oOV => OV,
        oCB => CBo
    );

	 R <= mux_Y;
	 
end architecture;
