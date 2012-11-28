architecture instruction_memory_arch of instruction_memory_entity is
  type instruction_list is array (0 to 31) of unsigned(15 downto 0);
begin
  process(address)
    VARIABLE instructions : instruction_list := (
    "0000000000001010",   --nop
    "0000000101011001",   --movi r5,#1
    "0000001000001001",   --movi r0,#2
    "0000010000011001",   --movi r1,#4
    "0000000000001010",   --nop
    "0000000000001010",   --nop
    "0101000000000001",   --sub r0,r0,r5
    "0001000100000011",   --st  r1,r1
    "0001010100010000",   --add r1,r5,r1
    "0001000000001011",   --out r1
    "0000000000001010",   --nop
    "0000111000000111",   --beq r0,14
    "0000000100110010",   --mul r3,r1,r0
    "0000010000000110",   --jmp 4
    "0000000000001010",   --nop
    "0000000100000110",   --jmp 1
    "0000000000001010",   --nop
    others => "0000000000001010"   --   nop
    );
  begin
    instruction <= instructions(to_integer(unsigned(address)));
  end process;
end instruction_memory_arch;