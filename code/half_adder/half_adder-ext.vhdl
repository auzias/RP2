library ieee;
use ieee.std_logic_1164.all;

entity halfAdder IS
  port (
    A : IN std_logic;
    B : IN std_logic;
    S : OUT std_logic;
    Cy: OUT std_logic
  );
end halfAdder;