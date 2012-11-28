library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_fetch_entity is
  port(
    clock:  IN  std_logic;
    reset:  IN  std_logic;
    load:   IN  std_logic;
    stall:  IN  std_logic;
    input:  IN  unsigned( 7 downto 0);
    output: OUT unsigned(15 downto 0)
  );
end instruction_fetch_entity;