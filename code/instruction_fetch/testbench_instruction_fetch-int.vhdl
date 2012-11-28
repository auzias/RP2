architecture instruction_fetch_tb of test_bench_instruction_fetch is
-- déclare le composant à utiliser
component instruction_fetch_tester is
  port (
    clock:  IN  std_logic;
    reset:  IN  std_logic;
    load:   IN  std_logic;
    stall:  IN  std_logic;
    input:  IN  unsigned( 7 downto 0);
    output: OUT unsigned(15 downto 0)
  );
end component;

signal c : std_logic;
signal r : std_logic;
signal l : std_logic;
signal s : std_logic;
signal i : unsigned( 7 downto 0);
signal o : unsigned(15 downto 0);

-- instanciation de composants
for dut : instruction_fetch_tester use entity
      work.instruction_fetch_entity(instruction_fetch_arch)
      port map(c, r, l, s, i, o);

begin
dut : instruction_fetch_tester
      port map(c, r, l, s, i, o);

horloge : process
begin
	for i in 0 to 20 loop
	if c = '0'
	    then c <= '1';
	else
	    c <= '0';
	end if;
	wait for 50 ns;
    end loop;
	wait;
end process;

test : process
begin
i <= (others => '0');
  s <= '1';
  l <= '1';
  r <= '0';
  wait for 75 ns;
  r <= '1';
  l <= '1';
  assert (o = "0000000000001010");
  -- au front d'horloge suivant
  wait for 100 ns;
  assert (o = "0000000101011001");
  wait for 100 ns;
  s <= '1';
  r <= '1';
  wait for 100 ns;
  l <= '0';
  wait for 100 ns;
  s <= '0';
wait;
end process;

end instruction_fetch_tb;