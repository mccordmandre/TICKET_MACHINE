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

    component alu_lucirc is
        port(
            X, Y: in std_logic_vector(3 downto 0);
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

    component alu_mux4 is
        port(
            A, B: in std_logic_vector(3 downto 0);
            S: in std_logic;
            Y: out std_logic_vector(3 downto 0)
        );
    end component;

    -- Signal Declarations

    -- Outputs from alu_decoder
    signal OPA_signal, OPB_signal, OPC_signal, OPD_signal, OPE_signal, OPF_signal: std_logic;

    -- Intermediate signals
    signal Yor0: std_logic_vector(3 downto 0);          -- Modified B input for 'au'
    signal R_au: std_logic_vector(3 downto 0);          -- Result from 'au'
    signal R_lucirc: std_logic_vector(3 downto 0);      -- Result from 'alu_lucirc'
    signal OV_signal, CBo_signal: std_logic;            -- Overflow and Carry/Borrow signals from 'au'
    signal CY_signal: std_logic;                        -- Carry out from 'alu_lucirc'
	 signal Y_mux4_signal: std_logic_vector(3 downto 0);  -- Result from "alu_mux4"
    
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

    -- Handle Yor0 signal
    -- 'Yor0' connects between 'Y' and 'au's B input, controlled by 'OPA_signal'
    Yor0 <= Y when OPA_signal = '1' else (others => '0');

    -- Instantiate au
    au_inst: au port map(
        A => X,
        B => Yor0,
        CBi => CBi,
        OPau => OPB_signal,
        R => R_au,
        OV => OV_signal,
        CBo => CBo_signal
    );

    -- Instantiate alu_lucirc
    alu_lucirc_inst: alu_lucirc port map(
        X => X,
        Y => Y,
        S0 => OPD_signal,
        S1 => OPE_signal,
        R => R_lucirc,
        CY => CY_signal
    );

    -- Instantiate alu_mux4
    alu_mux4_inst: alu_mux4 port map(
        A => R_au,
        B => R_lucirc,
        S => OPC_signal,
        Y => Y_mux4_signal    -- Output connected to top-level R
    );

    -- Instantiate alu_flags
    alu_flags_inst: alu_flags port map(
        iOV => OV_signal,
        iCB => CBo_signal,
        OP => OPF_signal,
        CY => CY_signal,
        R => Y_mux4_signal,              -- From the output of 'alu_mux4'
        oBE => BE,
        oGE => GE,
        P => P,
        Z => Z,
        oOV => OV,
        oCB => CBo
    );

	 R <= Y_mux4_signal;
	 
end architecture;
