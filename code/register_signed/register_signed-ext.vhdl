library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_signed_entity is
	generic (N : integer := 16); --default value is 16
	port (
	      clock:  IN  std_logic;
	      reset:  IN  std_logic;
	      input:  IN  signed(N-1 downto 0);
	      output: OUT signed(N-1 downto 0)
	);
end register_signed_entity;