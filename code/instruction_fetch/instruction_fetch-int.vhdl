architecture instruction_fetch_arch of instruction_fetch_entity is

component program_counter is
  port (
    input_pc:  IN   unsigned(7 downto 0);
    output_pc: OUT  unsigned(7 downto 0);
    load_pc:   IN   std_logic;
    stall_pc:  IN   std_logic;
    reset_pc:  IN   std_logic;
    clock_pc:  IN   std_logic
  );
end component;

component instruction_memory is
  port (
    address_inst_mem : 	   IN  unsigned(7 downto 0);
    instruction_inst_mem : OUT unsigned(15 downto 0)
  );
end component;

component register_component is
  generic (N : integer := 16); --default value is 16
  port (
    clock_reg :  IN  std_logic;
    reset_reg :  IN  std_logic;
    input_reg :  IN  unsigned(N-1 downto 0);
    output_reg : OUT unsigned(N-1 downto 0)
  );
end component;

signal out_pc : unsigned(7 downto 0) := "00000000";
signal out_instr_mem : unsigned(15 downto 0) := "0000000000000000";



begin
  pc : entity work.pc_entity(pc_arch)
	port map(input, out_pc, load, stall, reset, clock);
  im : entity work.instruction_memory_entity(instruction_memory_arch)
	port map(out_pc, out_instr_mem);
  reg: entity work.register_entity(register_arch)
	generic map (N=>16)
	port map(clock, reset, out_instr_mem, output);


end instruction_fetch_arch;