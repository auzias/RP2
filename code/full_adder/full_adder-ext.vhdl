library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity full_adder_entity is
	port (
	      a_16: in  unsigned(15 downto 0);
	      b_16: in  unsigned(15 downto 0);
	      S_16: out unsigned(15 downto 0);
	      Cout_16: out std_logic;
	      Cin_16:  in std_logic);
end full_adder_entity;