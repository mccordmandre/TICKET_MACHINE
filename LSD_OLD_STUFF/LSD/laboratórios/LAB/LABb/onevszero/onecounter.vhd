library ieee;
  use ieee.std_logic_1164.all;

entity oneCounter is
  port (
    a : in  std_logic_vector(2 downto 0);
    s : out std_logic_vector(1 downto 0)
  );
end entity;

architecture behavioral of oneCounter is
begin

  s(0) <= a(2) xor a(1) xor a(0);
  s(1) <= (a(2) and a(1)) or (a(1) and a(0)) or (a(2) and a(0));

end architecture;
