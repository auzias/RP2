library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_acc_entity is
  port (
    ird : IN  unsigned(3 downto 0);
    ord : OUT unsigned(3 downto 0);
    iwrRegFile : IN  unsigned(0 downto 0);
    owrRegFile : OUT unsigned(0 downto 0);
    iselMuxMem : IN  unsigned(0 downto 0);
    iwrMem : IN  std_logic;

    address : IN unsigned(7 downto 0);
    data :    IN signed(15 downto 0);
    dataWriteBack : OUT signed(15 downto 0);

    clock : IN std_logic;
    reset : IN std_logic
  );
end mem_acc_entity;