architecture mem_acc_tb of test_bench_mem_acc is

signal sird : unsigned(3 downto 0) := "0000";
signal sord : unsigned(3 downto 0) := "0000";
signal siwrRegFile : unsigned(0 downto 0) := "0";
signal sowrRegFile : unsigned(0 downto 0) := "0";
signal siselMuxMem : unsigned(0 downto 0) := "0";
signal siwrMem : std_logic := '1';

signal saddress : unsigned(7 downto 0) := "00000000";
signal sdata :    signed(15 downto 0) := "0000001010101001";
signal sdataWriteBack : signed(15 downto 0) := "0000001010101001";

signal sclock : std_logic := '1';
signal sreset : std_logic := '1';

begin
  dut : entity work.mem_acc_entity(mem_acc_arch) 
  port map(sird, sord, siwrRegFile, sowrRegFile, siselMuxMem, siwrMem,
	   saddress, sdata, sdataWriteBack  ,sclock, sreset);

  -- processus de test
  process
    begin
    sreset <= '0';
    sird <= "0101";
    siwrRegFile <= "1";

    siwrMem <= '1';
    siselMuxMem <= "1";
    saddress <= "00000001";
    sdata <= "0000001010101001";

    --cycle d'horloge
    sclock <= '0';
    wait for 50 ns;
    sclock <= '1';
    wait for 50 ns;
    --cycle d'horloge

    assert sord <= "0101";
    assert sowrRegFile <= "1";
    assert sdataWriteBack <= "0000001010101001";
    siselMuxMem <= "0"; --lecture du registre
    siwrMem <= '0'; --mode lecture du data mem
    sdata <= "0001001010101101";

    --cycle d'horloge
    sclock <= '0';
    wait for 50 ns;
    sclock <= '1';
    wait for 50 ns;
    --cycle d'horloge

    assert sdataWriteBack <= "0001001010101101";
  wait;
  end process;
end mem_acc_tb;