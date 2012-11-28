architecture sign_ext_tb of test_bench_sign_ext is
-- déclare le composant à utiliser
component sign_ext_tester is
  PORT (
    data_in  : IN  signed( 7 downto 0);
    data_out : OUT signed(15 downto 0)
  );
end component;

signal i : signed( 7 downto 0);
signal o : signed(15 downto 0);

-- instanciation de composants
for dut : sign_ext_tester use entity
      work.sign_ext_entity(sign_ext_arch)
      port map(i, o);

begin
  dut : sign_ext_tester
	port map(i, o);
  process
    begin
      i <= "00000000";
      wait for 50 ns;
      assert (o = "0000000000000000"); 

      i <= "10000000";
      wait for 50 ns;
      assert (o = "1111111110000000"); 
      wait for 50 ns;

      i <= "01111111";
      wait for 50 ns;
      assert (o = "0000000001111111"); 
      wait for 50 ns;

      i <= "10101010";
      wait for 50 ns;
      assert (o = "1111111110101010"); 
      wait for 50 ns;

      wait;
  end process;
end sign_ext_tb;