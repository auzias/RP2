library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_entity is
	port (
	      sel:    IN  unsigned( 1 downto 0);
	      input0: IN    signed(15 downto 0);
	      input1: IN    signed(15 downto 0);
	      input2: IN    signed(15 downto 0);
	      input3: IN    signed(15 downto 0);
	      output: OUT   signed(15 downto 0)
	);
end mux_entity;