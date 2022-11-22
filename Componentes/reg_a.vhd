library ieee;
use ieee.std_logic_1164.all;

entity reg_a is
    port(
        reg_a_in : in std_logic_vector(7 downto 0);
        reg_a_out: out std_logic_vector(7 downto 0);
        clk, rst, reg_a_we: in std_logic);
end reg_a;

architecture beh_reg_a of reg_a is
begin

    process(clk,reg_a_we,rst)
    begin
        if rst = '1' then
            reg_a_out <= (others => '0');
        elsif (clk'event and clk='1') then
            if (reg_a_we = '1') then
                reg_a_out <= reg_a_in;
            end if;
        end if;
    end process;
end beh_reg_a;
