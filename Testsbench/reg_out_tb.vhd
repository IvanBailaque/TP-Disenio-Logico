library ieee;
use ieee.std_logic_1164.all;

entity reg_out_tb is
end reg_out_tb;

architecture test of reg_out_tb is

    component reg_out
        port(
            reg_out_in : in std_logic_vector(7 downto 0);
            clk, reg_out_we,rst : in std_logic;
            reg_out_out : out std_logic_vector(7 downto 0));
    end component;

    signal reg_out_in, reg_out_out : std_logic_vector(7 downto 0);
    signal clk, reg_out_we, rst : std_logic;

    constant delay: time:= 10 ns;

begin

    uut: reg_out port map(
        reg_out_in => reg_out_in, clk=>clk, reg_out_we=> reg_out_we, rst=>rst, reg_out_out=> reg_out_out);

    process
    begin
        -- Con una señal de clk y la we habilidata, pasamos el dato in a la salida
        rst <= '0';
        clk <= '1';
        reg_out_we <= '1';
        reg_out_in <= "10010001";
        wait for delay;
        assert reg_out_out = reg_out_in report "Error al escribir el dato" severity error;

        clk <= '0';
        wait for delay;

        -- Con otra señal de clock, pero la we NO habilidata, la salida mantiene el dato, a pesar de tener uno nuevo de entrada
        clk <= '1';
        reg_out_we <= '0';
        reg_out_in <= "11111111";
        wait for delay;
        assert reg_out_out = "10010001" report "Error al mantener el dato" severity error;

        clk <= '0';
        wait for delay;

        -- Con una señal de clk y la we habilidata, pasamos el dato in a la salida
        clk <= '1';
        reg_out_we <= '1';
        wait for delay;
        assert reg_out_out = reg_out_in report "Error al escribir el dato" severity error;

        -- Funcionalidad del reset asincronico, coloca la salida en 0 a pesar de no haber una señal de clock
        rst <= '1';
        clk <= '0';
        reg_out_we <= '0';
        wait for delay;
        assert reg_out_out = "00000000" report "Error al realizar rst el dato" severity error;
        
        report "TestBench finalizado";
        wait;

    end process;
end test;