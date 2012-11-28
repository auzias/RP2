architecture registers_tb of test_bench_registers is

signal sN1 : unsigned(3 downto 0) := "0000"; -- addresses
signal sN2 : unsigned(3 downto 0):= "0000"; -- d'écriture
signal sN3 : unsigned(3 downto 0):= "0000"; -- et lecture

signal sop  : signed(15 downto 0);
signal sop1 : signed(15 downto 0);
signal sop2 : signed(15 downto 0);

signal clk :    std_logic;
signal swrite : std_logic;

begin
  dut : entity work.registers_entity(registers_arch) 
  port map(sN1, sN2, sN3, sop, sop1, sop2, clk, swrite);
    process
      begin
	--initialisation :
	sop <= "0101010101010101";
	clk <= '1';
	--test en écriture du registre 1 :
	sN1 <= "0001";
	swrite <= '1';
	wait for 50 ns;
	clk <= '0'; -- front descendant : écriture
	wait for 50 ns;
	--lecture du registre 1 :
	sN2 <= "0001";
	clk <= '1';
	wait for 50 ns;
	assert sop1 <= "0101010101010101" severity error;
	wait;
    end process;
end registers_tb;