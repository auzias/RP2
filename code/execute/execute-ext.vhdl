library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity execute_entity is
  port (
    ird : IN  unsigned(3 downto 0);
    ord : OUT unsigned(3 downto 0);
    iwrRegFile : IN  unsigned(0 downto 0);
    owrRegFile : OUT unsigned(0 downto 0);
    iselMuxMem : IN  unsigned(0 downto 0);
    oselMuxMem : OUT unsigned(0 downto 0);
    iwrMem : IN  unsigned(0 downto 0);
    owrMem : OUT unsigned(0 downto 0);
    idataOutValid : IN  unsigned(0 downto 0);
    odataOutValid : OUT unsigned(0 downto 0);

    selMuxAlu : IN unsigned(1 downto 0);
    codeOp : IN unsigned(2 downto 0);
    op1 : IN signed(15 downto 0);
    op2 : IN signed(15 downto 0);
    immediateData : IN signed(15 downto 0);

    memAddress : OUT unsigned(7 downto 0);
    memData : OUT signed(15 downto 0);
    DataOut : OUT signed(15 downto 0);

    clock : IN std_logic;
    reset : IN std_logic
  );
end execute_entity;