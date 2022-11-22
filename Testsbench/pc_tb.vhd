library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC_tb is
end PC_tb;
architecture a_PC_tb of PC_tb is

    component PC
        port(
            pc_out : out std_logic_vector(6 downto 0);
            clk, rst : in std_logic);
    end component;

    signal pc_out : std_logic_vector(6 downto 0);
    signal clk, rst : std_logic;

    constant delay : time := 10 ns;

begin

    UUT : PC port map(
        clk=>clk, rst=>rst, pc_out=>pc_out);

    process
    begin

        rst <= '1';
        clk <= '0';
        wait for delay;

        rst <= '0';
        wait for delay;

        clk <= '1';
        assert pc_out="0000000" report "Error en 0" severity error;
        wait for delay;
        assert pc_out="0000001" report "Error en 1" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0000010" report "Error en 2" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0000011" report "Error en 3" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0000100" report "Error en 4" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0000101" report "Error en 5" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0000110" report "Error en 6" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0000111" report "Error en 7" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001000" report "Error en 8" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001001" report "Error en 9" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001010" report "Error en 10" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001011" report "Error en 11" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001100" report "Error en 12" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001101" report "Error en 13" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001110" report "Error en 14" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0001111" report "Error en 15" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0010000" report "Error en 16" severity error;

        clk <= '0';
        wait for delay;

        clk <= '1';
        wait for delay;
        assert pc_out="0010001" report "Error en 17" severity error;
        clk <= '0';

        report "TestBench finalizado";
        wait;

    end process;
end a_PC_tb;