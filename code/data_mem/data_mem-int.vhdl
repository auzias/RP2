architecture data_mem_arch of data_mem_entity is

type MyTabOfVec is array (0 to N-1) of signed(15 downto 0);
signal tab : MyTabOfVec;

begin
  process(op, write, add) begin
    --Lecture si write niveau bas :
    if (write = '0') then
    s <= tab(to_integer(add));
    end if;
    --Ecriture si write niveau haut :
    if (write = '1') then
    tab(to_integer(add)) <= op;
    end if;
  end process;
end data_mem_arch;