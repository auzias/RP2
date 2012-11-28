architecture alu_tb of test_bench_alu is
-- déclare le composant à utiliser
component alu_tester is
  PORT (
    input1 : IN  signed  (15 downto 0);
    input2 : IN  signed  (15 downto 0);
    codeOp : IN  unsigned( 2 downto 0);
    output : OUT signed  (15 downto 0)
  );
end component;

signal a : signed  (15 downto 0) := "0000000000000000";
signal b : signed  (15 downto 0) := "0000000000000000";
signal c : unsigned( 2 downto 0) :="000";
signal o : signed(15 downto 0) := "0000000000000000";

-- instanciation de composants
for dut : alu_tester use entity
      work.alu_entity(alu_arch)
      port map(a, b, c, o);

begin
  dut : alu_tester
	port map(a, b, c, o);

  process
    begin
      a <= "0000000000000111";
      b <= "0000000000000101";
      c <= "000"; -- test l'addition
      wait for 10 ns;
      assert (o = "0000000000001100");
      c <= "001"; -- test la soustraction :
      wait for 10 ns;
      assert (o = "0000000000000010");
      c <= "010"; -- test du not :
      wait for 10 ns;
      assert (o = "1111111111111000");
      c <= "110"; -- test de la multiplication :
      wait for 10 ns;
      assert (o = "0000000000100011");
      wait;
  end process;
end alu_tb;