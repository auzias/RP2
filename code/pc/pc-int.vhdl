architecture pc_arch of pc_entity is

--==============================--
--   Qu'en est-il des délais ?  --
--  Ne faudrait-il pas mettre ? --
--  Si addr=0xFF + incrémente ? --
--==============================--

begin

  process(clock)
  --variable ou on stocke l'adresse :
  variable addr : unsigned(7 downto 0) := to_unsigned(0,output'LENGTH);
  begin
      -- /reset asynchrone :
      if (reset = '0') then
	addr := to_unsigned(0,addr'LENGTH);
      end if;

      --Actions synchrones :
      if (clock'event and clock = '1') then
	-- /load synchrone :
	if (load = '0') then
	  addr := input;
	end if;
	if (stall = '0') then
	end if;
	-- ni load, ni stall demandé, on incrémente
	if (load = '1' and stall = '1') then
	addr := addr + 1;
	end if;
      end if;

      --Ecriture de l'adresse sur frond descendant :
      if (clock'event and clock = '0') then
	output <= addr;
      end if;
  end process;
end pc_arch;