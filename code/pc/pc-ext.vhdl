library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_entity is
	port (
	      input:  IN   unsigned(7 downto 0);
	      output: OUT  unsigned(7 downto 0);
	      load:   IN   std_logic;
	      stall:  IN   std_logic;
	      reset:  IN   std_logic;
	      clock:  IN   std_logic
	);
end pc_entity;