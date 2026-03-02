library ieee;
  use ieee.std_logic_1164.all;

entity LUcirc_tb is
end entity;

architecture behavioral of LUcirc_tb is

  component LUcirc
    port (
      X, Y : in  std_logic_vector(3 downto 0);
      OP   : in  std_logic;
      R    : out std_logic_vector(3 downto 0)
    );
  end component;

  signal X_TB, Y_TB, R_TB : std_logic_vector(3 downto 0);
  signal OP_TB            : std_logic;

begin

  UUT: LUcirc
    port map (
      X  => X_TB,
      Y  => Y_TB,
      OP => OP_TB,
      R  => R_TB
    );

  process
  begin
    X_TB <= "0110";
    Y_TB <= "1100";
    OP_TB <= '0';
    wait for 10 ns;

    OP_TB <= '1';
    wait for 10 ns;

    wait;
  end process;

end architecture;
