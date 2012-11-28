architecture sign_ext_arch of sign_ext_entity is

begin
  process(data_in)
    begin
    if (data_in(7) = '1') then
      data_out <= "11111111" & data_in;
    else
      data_out <= "00000000" & data_in;
    end if;
  end process;
end sign_ext_arch;