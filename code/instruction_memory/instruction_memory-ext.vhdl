library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_memory_entity is
	port(
	  address : in unsigned(7 downto 0);
	  instruction : out unsigned(15 downto 0)
	);
end instruction_memory_entity;