architecture full_adder_arch of full_adder_entity is

component adder is
	port(	a, b, Cin : in  std_logic;
		S, Cy : out std_logic);
end component;

signal carries : unsigned(15 downto 0);

begin
  init_for:adder port map(a_16(0),b_16(0),Cin_16,s_16(0),carries(0));
  gen_for:for i in 1 to 15 generate
--     gen_if1 : if i = 0 generate
--       inst: adder port map(a(0),b(0),Cin,s(0),carries(0));
--     end generate gen_if1;
--     gen_if2 : if i > 0 generate
      inst: adder port map(a_16(i),b_16(i),carries(i-1),s_16(i),carries(i));
--     end generate gen_if2;
  end generate gen_for;
  Cout_16 <= carries(15);

end full_adder_arch;