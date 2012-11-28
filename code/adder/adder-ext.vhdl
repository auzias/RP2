library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
  port (a, b, Cin  : in std_logic;
	     S, Cy : out std_logic);
end adder;