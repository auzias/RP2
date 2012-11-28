architecture pc_tb of test_bench_pc is
-- déclare le composant à utiliser
component pc_tester is
	port (
	      input:  IN   unsigned(7 downto 0);
	      output: OUT  unsigned(7 downto 0);
	      load:   IN   std_logic;
	      stall:  IN   std_logic;
	      reset:  IN   std_logic;
	      clock:  IN   std_logic
	);
end component;


signal clk    : std_logic;
signal rst    : std_logic;
signal input1 : unsigned(7 downto 0) := "00000000";
signal output1: unsigned(7 downto 0) := "00000000";
signal ld     : std_logic;
signal stll   : std_logic;


-- instanciation de composants
for dut : pc_tester use entity
    work.pc_entity(pc_arch)
    port map(input1, output1, ld, stll, rst, clk);

begin
    dut : pc_tester
    port map(input1, output1, ld, stll, rst, clk);
    --processus de simulation de l'horologe :
    process
      begin
	clk <= '0';
	wait for 50 ns;
	clk <= '1';
	wait for 50 ns;
    end process;

    -- processus de test
    process
      begin
	stll <= '1';
	ld <= '1';
	rst <= '0'; --RAZ de suite
	wait for 75 ns;
	assert output1 = to_unsigned(0,output1'LENGTH);
	rst <= '1'; --autorise la lecture
	input1 <= "00000001";--écrit une adresse
	wait for 110 ns;--assigne
	assert output1 = input1;--vérifie
	rst <= '0';--RAZ
	wait for 10 ns;--affecte
	assert output1 = to_unsigned(0,output1'LENGTH);--vérifie
	rst <= '1'; --autorise la lecture
	input1 <= "00000110";
	ld <= '0';--écrit
	wait for 110 ns;--assigne
	assert output1 = input1;--vérifie
	ld <= '1';--ld & stll = 1 : on incrémente
	wait for 400 ns;--vérifie
	assert output1 = "00000111";
	stll <= '0';
	wait for 400 ns;--vérifie
    wait;
    end process;
end pc_tb;