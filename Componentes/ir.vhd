library ieee;
use ieee.std_logic_1164.all;

entity ir is
    port(
        ir_in : in std_logic_vector(15 downto 0);
        clk,ir_we,rst : in std_logic;
        ir_out : out std_logic_vector(15 downto 0));
end ir;

architecture beh_ir of ir is
begin

    process(clk,ir_we,rst)
    begin
        if rst = '1' then
            ir_out <= (others => '0');
        elsif (clk'event and clk='1') then
            if (ir_we = '1') then
                ir_out <= ir_in;
            end if;
        end if;
    end process;
end beh_ir;
