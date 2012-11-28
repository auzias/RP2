architecture register_arch of register_entity is

begin
  process(clock) begin
      -- /reset asynchrone :
      if (reset = '0') then
	output <= to_unsigned(0,output'LENGTH);
      end if;
      --lecture synchrone :
      if (clock'event and clock = '1') then
	output <= input;
      end if;
  end process;
end register_arch;