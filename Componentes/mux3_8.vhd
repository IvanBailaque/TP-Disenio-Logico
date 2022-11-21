library ieee;
use ieee.std_logic_1164.all;

entity mux3_8 is
    port(a, b, c : in std_logic_vector(7 downto 0);
        sel : in std_logic_vector(1 downto 0);
        mux_out : out std_logic_vector(7 downto 0));
end mux3_8;

architecture beh_mux3_8 of mux3_8 is

begin
    with sel select
        mux_out <= a when "00",
                   b when "01",
                   c when "10",
                   "XX" when others;
end beh_mux3_8;