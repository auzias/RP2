architecture register_tb of test_bench_register is
-- déclare le composant à utiliser
component register_tester is
	generic (N : integer := 16); --default value is 16
	port (
	      clock:  IN  std_logic;
	      reset:  IN  std_logic;
	      input:  IN  unsigned(N-1 downto 0);
	      output: OUT unsigned(N-1 downto 0)
	);
end component;


signal clk    : std_logic;
signal rst    : std_logic;
signal input1 : unsigned(7 downto 0) := "00000000";
signal output1: unsigned(7 downto 0) := "00000000";


-- instanciation de composants
for dut : register_tester use entity
    work.register_entity(register_arch)
    generic map (N=>8)
    port map(clk, rst,input1,output1);

begin
    dut : register_tester
    generic map (N=>8)
    port map(clk, rst,input1,output1);
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
	rst <= '0'; --RAZ de suite
	wait for 75 ns;
	assert output1 = to_unsigned(0,output1'LENGTH);
	rst <= '1'; --autorise la lecture
	input1 <= "00000001";--écrit
	wait for 110 ns;--assigne
	assert output1 = input1;--vérifie
	rst <= '0';--RAZ
	wait for 10 ns;--affecte
	assert output1 = to_unsigned(0,output1'LENGTH);--vérifie
	rst <= '1'; --autorise la lecture
	input1 <= "00000010";--écrit
	wait for 110 ns;--assigne
	assert output1 = input1;--vérifie
    wait;
    end process;
end register_tb;