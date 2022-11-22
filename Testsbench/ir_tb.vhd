library ieee;
use ieee.std_logic_1164.all;

entity ir_tb is
end ir_tb;

architecture test of ir_tb is

    component ir
        port(
            ir_in : in std_logic_vector(15 downto 0);
            clk,ir_we,rst : in std_logic;
            ir_out : out std_logic_vector(15 downto 0));
    end component;

    signal ir_in, ir_out : std_logic_vector(15 downto 0);
    signal clk, ir_we, rst : std_logic;

    constant delay: time:= 10 ns;

begin

    uut: ir port map(
        ir_in => ir_in, clk=>clk, ir_we=> ir_we, rst=>rst, ir_out=>ir_out);

    process
    begin
        -- Con una señal de clk y la we habilidata, pasamos el dato in a la salida
        rst <= '0';
        clk <= '1';
        ir_we <= '1';
        ir_in <= "1010101010101010";
        wait for delay;
        assert ir_out = ir_in report "Error al escribir el dato" severity error;

        clk <= '0';
        wait for delay;

        -- Con otra señal de clock, pero la we NO habilidata, la salida mantiene el dato, a pesar de tener uno nuevo de entrada
        clk <= '1';
        ir_we <= '0';
        ir_in <= "1111111111111111";
        wait for delay;
        assert ir_out = "1010101010101010" report "Error al mantener el dato" severity error;

        clk <= '0';
        wait for delay;

        -- Con una señal de clk y la we habilidata, pasamos el dato in a la salida
        clk <= '1';
        ir_we <= '1';
        wait for delay;
        assert ir_out = ir_in report "Error al escribir el dato" severity error;

        -- Funcionalidad del reset asincronico, coloca la salida en 0 a pesar de no haber una señal de clock
        rst <= '1';
        clk <= '0';
        ir_we <= '0';
        wait for delay;
        assert ir_out = "0000000000000000" report "Error al realizar rst el dato" severity error;
        
        report "TestBench finalizado";
        wait;

    end process;
end test;