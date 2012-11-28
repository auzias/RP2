architecture full_adder_tb of test_bench_full_adder is
-- déclare le composant à utiliser
component full_adder_tester is
	port (
	      a_16: in  unsigned(15 downto 0);
	      b_16: in  unsigned(15 downto 0);
	      S_16: out unsigned(15 downto 0);
	      Cout_16: out std_logic;
	      Cin_16:  in std_logic);
end component;

signal inputsA : unsigned(15 downto 0) := "0000000000000000";
signal inputsB : unsigned(15 downto 0) := "0000000000000000";
signal outputs : unsigned(15 downto 0) := "0000000000000000";
signal Cout_test : std_logic := '0';
signal Cin_test  : std_logic := '0';


    -- instanciation de composants
    for dut : full_adder_tester use entity
	    work.full_adder_entity(full_adder_arch)
	    port map(inputsA,inputsB,outputs,Cout_test,Cin_test);
begin
    dut : full_adder_tester
    port map(inputsA,inputsB,outputs,Cout_test,Cin_test);
    -- processus de test
    process
    VARIABLE som : unsigned(16 downto 0);
	    begin
		    for i in 65530 to 65535 loop -- for sequentiel (process)
			    inputsA <= to_unsigned(i,inputsA'LENGTH);
			    wait for 50 ns;
			    for j in 65530 to 65535 loop
			      inputsB <= to_unsigned(j,inputsB'LENGTH);
			      som := ("0" & inputsA) + ("0" & inputsB) + ("0000000000000000" & Cin_test);
			      assert (Cout_test & outputs) = som severity error;
			      wait for 50 ns;
			    end loop;
		    end loop;
		    wait;
    end process;
end full_adder_tb;