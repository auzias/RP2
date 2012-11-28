architecture add_struct OF adder IS

component halfAdder is
	port(	a, b  : IN std_logic;
		S, Cy : OUt std_logic);
end component;

signal cy1, cy2, s1 : std_logic;

BEGIN
	ha1 : halfAdder PORT MAP(a, b, s1, Cy1);
	ha2 : halfAdder PORT MAP(s1, Cin, S, Cy2);
	Cy <= Cy1 or Cy2;
END add_struct;