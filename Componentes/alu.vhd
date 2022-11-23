library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity alu is

    port(
        a,b: in std_logic_vector(7 downto 0);
        sel: in std_logic_vector(2 downto 0);
        s: out std_logic_vector(7 downto 0));

end alu;

architecture beh_alu of alu is
begin

    with sel select
        s <= a          when "000",
             a sll 1    when "001",
             a + b      when "010",
             a - b      when "011",
             a and b    when "100",
             a or b     when "101",
             a xor b    when "110",
             a srl 1    when "111",
             "XXXXXXXX" when others;

end beh_alu;