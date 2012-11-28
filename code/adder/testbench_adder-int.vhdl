architecture adder_tb of test_bench_adder is
-- déclare le composant à utiliser
component adder_tester is
	port (	a, b, Cin: in std_logic;
		S, Cy	: out std_logic);
end component;

signal inputs : unsigned(2 downto 0) := "000";
signal outputs : unsigned(1 downto 0) := "00";


    -- instanciation de composants
    for dut : adder_tester use entity
	    work.adder(add_struct)
	    port map(inputs(0), inputs(1), inputs(2), outputs(0), outputs(1));
begin
    dut : adder_tester
    port map(inputs(0), inputs(1), inputs(2), outputs(0), outputs(1));
    -- processus de test
    process
    VARIABLE som : natural;
	    begin
		    for i in 0 to 7 loop -- for séquentiel (process)
			    inputs <= to_unsigned(i,inputs'LENGTH);
			    wait for 10 ns;

			    som := 0;
			    for j in inputs'range loop
			    if inputs(j) = '1' then som := som + 1; end if; --nombre de 1 en entrée donne la valeur en sortie
			    end loop;

			    assert outputs = to_unsigned(som,outputs'LENGTH);
		    end loop;
		    wait;
    end process;
end adder_tb;