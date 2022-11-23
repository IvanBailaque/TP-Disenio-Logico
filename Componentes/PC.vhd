library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity PC is
    port(
        pc_out: out std_logic_vector(6 downto 0);
        clk, rst : in std_logic);
end PC;

architecture beh_pc of PC is 
signal count: std_logic_vector(6 downto 0); 

begin

    pcount: process (clk, rst)
    begin
        if rst='1' then
            count <= "0000000";
        elsif (clk'event and clk='1') then
            count <= count + "0000001";
        end if;
   end process;

    pc_out <= count;

end beh_pc;