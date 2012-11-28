library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alu_entity is
  PORT (
    input1 : IN  signed  (15 downto 0);
    input2 : IN  signed  (15 downto 0);
    codeOp : IN  unsigned( 2 downto 0);
    output : OUT signed  (15 downto 0)
  );
end alu_entity;