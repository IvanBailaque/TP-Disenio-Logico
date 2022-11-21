library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;

architecture test of alu_tb is

    component alu
        port(
            a,b: in std_logic_vector(7 downto 0);
            sel: in std_logic_vector(2 downto 0);
            s: out std_logic_vector(7 downto 0));
    end component;

    signal a,b: std_logic_vector(7 downto 0);
    signal sel: std_logic_vector(2 downto 0);

    signal s: std_logic_vector(7 downto 0);

    constant delay: time:= 10 ns;

begin

    UUT: alu port map (
        a => a, b => b, sel => sel, s => s);
    
    process
    begin
        sel <= "000";
        a   <= "00000111";
        b   <= "00000011";
        wait for delay;
        assert s=a report "Error en 000" severity error;

        sel  <= "001";
        wait for delay;
        assert s="00001110" report "Error en 001" severity error;

        sel <= "010";
        wait for delay;
        assert s ="00001010" report "Error en 010" severity error;

        sel <= "011";
        wait for delay;
        assert s ="00000100" report "Error en 011" severity error;

        sel <= "100";
        wait for delay;
        assert s ="00000011" report "Error en 100" severity error;

        sel <= "101";
        wait for delay;
        assert s ="00000111" report "Error en 101" severity error;

        sel <= "110";
        wait for delay;
        assert s ="00000100" report "Error en 110" severity error;

        sel <= "111";
        wait for delay;
        assert s ="00000011" report "Error en 111" severity error;

        report "TestBench finalizado";
        wait;

    end process;
end test;