library ieee;
use ieee.std_logic_1164.all;

entity reg_out is
    port(
        reg_out_in : in std_logic_vector(7 downto 0);
        reg_out_out: out std_logic_vector(7 downto 0);
        clk, rst, reg_out_we: in std_logic);
end reg_out;

architecture beh_reg_out of reg_out is
begin

    process(clk,reg_out_we,rst)
    begin
        if rst = '1' then
            reg_out_out <= (others => '0');
        elsif (clk'event and clk='1') then
            if (reg_out_we = '1') then
                reg_out_out <= reg_out_in;
            end if;
        end if;
    end process;
end beh_reg_out;
