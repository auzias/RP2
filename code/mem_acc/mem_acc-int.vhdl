architecture mem_acc_arch of mem_acc_entity is

component mux is
  port (
      sel:    IN  unsigned( 1 downto 0);
      input0: IN    signed(15 downto 0);
      input1: IN    signed(15 downto 0);
      input2: IN    signed(15 downto 0);
      input3: IN    signed(15 downto 0);
      output: OUT   signed(15 downto 0)
  );
end component;

component reg is
  generic (N : integer := 5); --default value is 16
  port (
      clock:  IN  std_logic;
      reset:  IN  std_logic;
      input:  IN  signed(N-1 downto 0);
      output: OUT signed(N-1 downto 0)
  );
end component;

component data_mem is
  generic (N : integer := 16); 		  --default value is 16
  port (
    op :  IN signed(15 downto 0);	  --entree
    add : IN  unsigned(7 downto 0); 	  -- addresse
    write : IN  std_logic;		  --write = '0' := lecture.
    s   : OUT signed(15 downto 0)	  --faut bien une sortie !
  );
end component;

--signaux :
signal input_reg   : unsigned( 4 downto 0);
signal output_reg  : unsigned( 4 downto 0);
signal sel_mux     : unsigned( 1 downto 0);
signal out_mux     :   signed(15 downto 0);
signal out_data_mem:   signed(15 downto 0);


begin
  --entrées reg retardateur :
  input_reg <=  ird & iwrRegFile;
  --sorties reg retardateur :
  ord <= output_reg(4 downto 1);
  owrRegFile <= output_reg(0 downto 0);
  --composition du signal de commande du mux :
  sel_mux <= "0" & iselMuxMem;

  --registre retardateur :
  rgRt : entity work.register_entity(register_arch)
	generic map (N=>5)
	port map(clock, reset, input_reg, output_reg);
  --mux :
  mulx : entity work.mux_entity(mux_arch)
	port map(sel_mux, out_data_mem, data, data, data, out_mux);

  --data mem :
  dat : entity work.data_mem_entity(data_mem_arch)
	generic map (N=>16)
	port map(data, address, iwrMem, out_data_mem);

  --registre de la sortie du mux (et du mem_acc) :
  rgMx : entity work.register_signed_entity(register_signed_arch)
	generic map (N=>16)
	port map(clock, reset, out_mux, dataWriteBack);
end mem_acc_arch;