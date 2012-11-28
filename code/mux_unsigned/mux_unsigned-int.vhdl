architecture mux_unsigned_arch of mux_unsigned_entity is

begin
  output <= input0 when sel="00" else
	    input1 when sel="01" else
	    input2 when sel="10" else
	    input3;
end mux_unsigned_arch;