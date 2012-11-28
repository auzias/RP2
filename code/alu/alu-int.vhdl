architecture alu_arch of alu_entity is 

--==============================--
--     Rq : aucun flag levé !   --
--  Multiplication ou addition  --
-- avec overflow : on donne les --
--       16 LSB seulement       --
--==============================--

begin
  process(input1, input2, codeOp)
    begin
      case codeOp is
	--Addition :
	when "000"  => output <= to_signed(to_integer(input1)+to_integer(input2), output'LENGTH);
	-- Soustraction :
	when "001"  => output <= to_signed(to_integer(input1)-to_integer(input2), output'LENGTH);
	-- Not : (complément à deux)
	when "010"  => output <= not(input1);
	-- Multiplication :
	when others => output <= to_signed(to_integer(input1)*to_integer(input2), output'LENGTH);
      end case;
  end process;
end alu_arch;