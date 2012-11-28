architecture execute_arch of execute_entity is

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

component alu is
  port (
    input1 : IN  signed  (15 downto 0);
    input2 : IN  signed  (15 downto 0);
    codeOp : IN  unsigned( 2 downto 0);
    output : OUT signed  (15 downto 0)
  );
end component;

component reg is
  generic (N : integer := 16); --default value is 16
  port (
      clock:  IN  std_logic;
      reset:  IN  std_logic;
      input:  IN  signed(N-1 downto 0);
      output: OUT signed(N-1 downto 0)
  );
end component;

--signaux :
signal out_alu : signed(15 downto 0);
signal out_mux : signed(15 downto 0);
signal output_reg : unsigned(7 downto 0);
signal input_reg : unsigned(7 downto 0);



begin
  input_reg <=  ird & iwrRegFile & iselMuxMem & iwrMem & idataOutValid;
  ord <= output_reg(7 downto 4);
  owrRegFile <= output_reg(3 downto 3);
  oselMuxMem <= output_reg(2 downto 2);
  owrMem <= output_reg(1 downto 1);
  odataOutValid <= output_reg(0 downto 0);

  mulx : entity work.mux_entity(mux_arch)
	port map(selMuxAlu, out_alu, op2, immediateData, immediateData, out_mux);
  alue : entity work.alu_entity(alu_arch)
	port map(op1, op2, codeOp, out_alu);
  rgstr: entity work.register_entity(register_arch)
	generic map (N=>8)
	port map(clock, reset, input_reg, output_reg);
  rgDataOut : entity work.register_signed_entity(register_signed_arch)
	generic map (N=>16)
	port map(clock, reset, out_mux, DataOut);
  rgMemData : entity work.register_signed_entity(register_signed_arch)
	generic map (N=>16)
	port map(clock, reset, out_mux, memData);
  memAddress <= unsigned(op1(7 downto 0));
--metavalue détected : à une ligne où y'a un 'U' = '1' par exemple.

end execute_arch;