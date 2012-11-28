architecture mux_tb of test_bench_mux is
-- déclare le composant à utiliser
component mux_tester is
	port (
	      sel:    IN  unsigned( 1 downto 0);
	      input0: IN  signed(15 downto 0);
	      input1: IN  signed(15 downto 0);
	      input2: IN  signed(15 downto 0);
	      input3: IN  signed(15 downto 0);
	      output: OUT signed(15 downto 0)
	      );
end component;

signal inputsA : signed(15 downto 0) := "0000000000000001";
signal inputsB : signed(15 downto 0) := "0000000000000010";
signal inputsC : signed(15 downto 0) := "0000000000000011";
signal inputsD : signed(15 downto 0) := "0000000000000100";
signal outputs : signed(15 downto 0) := "0000000000000000";
signal addr    : unsigned( 1 downto 0) := "00";

    -- instanciation de composants
    for dut : mux_tester use entity
	    work.mux_entity(mux_arch)
	    port map(addr, inputsA,inputsB,inputsC,inputsD,outputs);
begin
    dut : mux_tester
    port map(addr, inputsA,inputsB,inputsC,inputsD,outputs);
    -- processus de test
    process
      begin
	for i in 0 to 3 loop -- for sequentiel (process)
	  addr <= to_unsigned(i,addr'LENGTH);
	  wait for 50 ns;
	end loop;
      wait;
    end process;
end mux_tb;