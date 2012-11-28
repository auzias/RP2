architecture registers_arch of registers_entity is

type MyTabOfVec is array (0 to 15) of signed(15 downto 0);
signal tab : MyTabOfVec;

begin
  process(clock) begin
    --lectures synchrone sur front montant :
    if (clock'event and clock = '1') then
      op2 <= tab(to_integer(N2));
      op3 <= tab(to_integer(N3));
    end if;

    --Ecriture synchrone sur front descendant :
    if (clock'event and clock = '0' and write = '1') then
    tab(to_integer(N1)) <= op1;
    end if;
  end process;
end registers_arch;