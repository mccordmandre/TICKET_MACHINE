library ieee;
  use ieee.std_logic_1164.all;

entity decisionLogic is
  port (
    x : in  std_logic_vector(1 downto 0);
    y : in  std_logic_vector(1 downto 0);
    D : out std_logic_vector(1 downto 0)
  );
end decisionLogic;

architecture behavioral of decisionLogic is

  signal ny1nx1, ny0nx0 : std_logic;

begin
  ny1nx1 <= not y(1) and not x(1);
  ny0nx0 <= not y(0) and not x(0);

  D(0) <= ny1nx1 or (y(1) and x(1)) or (y(0) and x(0)) or ny0nx0;
  D(1) <= ny1nx1 or (not y(1) and ny0nx0) or (ny0nx0 and not x(1));
end behavioral;