architecture data_mem_tb of test_bench_data_mem is

signal sop :    signed(15 downto 0);
signal sadd :   unsigned(7 downto 0); 	  -- addresse
signal swrite : std_logic;			  --write = '0' := lecture.
signal ss   :   signed(15 downto 0); --faut bien une sortie !

begin
  dut : entity work.data_mem_entity(data_mem_arch) 
  port map(sop, sadd, swrite, ss);
    process
      begin
	swrite <= '0';
	wait for 50 ns;	--initialisation :
	sop <= "0101010101010101";
	--test en écriture du registre 1 :
	sadd <= "00000001";
	swrite <= '1';
	wait for 50 ns;
	--lecture du registre 1 :
	swrite <= '0';
	wait for 50 ns;
	assert ss <= "0101010100010101";
	wait;
    end process;
end data_mem_tb;