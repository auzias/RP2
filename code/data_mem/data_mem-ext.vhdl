library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.pcg.all;

entity data_mem_entity is
  generic (N : integer := 16); 		  --default value is 16
  port (
    op :  IN signed(15 downto 0);	  --entree
    add : IN  unsigned(7 downto 0); 	  -- addresse
    write : IN  std_logic;			  --write = '0' := lecture.
    s   : OUT signed(15 downto 0)	  --faut bien une sortie !
  );
end data_mem_entity;