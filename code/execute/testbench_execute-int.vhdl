architecture execute_tb of test_bench_execute is

signal sird : unsigned(3 downto 0) := "0000";
signal sord : unsigned(3 downto 0) := "0000";
signal siwrRegFile : unsigned(0 downto 0) := "0";
signal sowrRegFile : unsigned(0 downto 0) := "0";
signal siselMuxMem : unsigned(0 downto 0) := "0";
signal soselMuxMem : unsigned(0 downto 0) := "0";
signal siwrMem : unsigned(0 downto 0) := "0";
signal sowrMem : unsigned(0 downto 0) := "0";
signal sidataOutValid : unsigned(0 downto 0) := "0";
signal sodataOutValid : unsigned(0 downto 0) := "0";
signal sselMuxAlu : unsigned(1 downto 0) := "00";
signal scodeOp : unsigned(2 downto 0) := "000";
signal sop1 : signed(15 downto 0) := "0000000000000000";
signal sop2 : signed(15 downto 0) := "0000000000000000";
signal simmediateData : signed(15 downto 0) := "0000000000000000";

signal smemAddress : unsigned(7 downto 0) := "00000000";
signal smemData : signed(15 downto 0) := "0000000000000000";
signal sDataOut : signed(15 downto 0) := "0000000000000000";

signal sclock : std_logic := '0';
signal sreset : std_logic := '0';

begin
  dut : entity work.execute_entity(execute_arch) 
  port map(
    sird, sord, siwrRegFile, sowrRegFile, siselMuxMem, soselMuxMem, siwrMem,
    sowrMem, sidataOutValid, sodataOutValid, sselMuxAlu, scodeOp, sop1, sop2, simmediateData, smemAddress, smemData,
    sDataOut, sclock, sreset);

  -- processus de test
  process
    begin
      sreset <= '0'; --RAZ de suite
      
      --debut test registres
      sird <= "0101";
      siwrRegFile <= "0";
      siselMuxMem <= "0";
      siwrMem <= "0";
      sidataOutValid <= "0";
      --cycle d'horloge
      sclock <= '0';
      wait for 50 ns;
      sclock <= '1';
      wait for 50 ns;
      --cycle d'horloge
      assert sord <= "0101";
      assert sowrRegFile <= "0";
      assert soselMuxMem <= "0";
      assert sowrMem <= "0";
      assert sodataOutValid <= "0";
      --fin test registres

      --debut test alu + mux
      sop1 <= "0000001010101001";
      sop2 <= "0000000101010110";
      scodeOp <= "000"; --soustraction
      sselMuxAlu <= "00";
      --cycle d'horloge
      sclock <= '0';
      wait for 50 ns;
      sclock <= '1';
      wait for 50 ns;
      --cycle d'horloge
      --cycle d'horloge
      sclock <= '0';
      wait for 50 ns;
      sclock <= '1';
      wait for 50 ns;
      --cycle d'horloge
      assert sDataOut <= "0000001111111111";
      assert sDataOut <= smemData;
      --fin test alu + mux
  wait;
  end process;
end execute_tb;