library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registers_entity is
  port (
    N1 : IN unsigned(3 downto 0); -- addresses
    N2 : IN unsigned(3 downto 0); -- d'écriture
    N3 : IN unsigned(3 downto 0); -- et lecture

    op1  : IN  signed(15 downto 0);
    op2 : OUT signed(15 downto 0);
    op3 : OUT signed(15 downto 0);

    clock : IN std_logic;
    write : IN std_logic
  );
end registers_entity;