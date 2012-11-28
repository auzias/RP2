library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_ext_entity is
  port (
    data_in  : IN  signed( 7 downto 0);
    data_out : OUT signed(15 downto 0)
  );
end sign_ext_entity;