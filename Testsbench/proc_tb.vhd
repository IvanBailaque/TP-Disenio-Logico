library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity proc_tb is
end proc_tb;

architecture test of proc_tb is

component Proc
    port( clk, rst      : in  std_logic;
          input_proc    : in  std_logic_vector(7 downto 0);
          output_proc   : out  std_logic_vector(7 downto 0));
end component;

signal clk, rst : std_logic;
signal input_proc, output_proc : std_logic_vector(7 downto 0);
constant delay : time := 10 ns;
begin
    uut : Proc
        port map( clk => clk, rst => rst, input_proc => input_proc, output_proc => output_proc);

    tb : process
    begin
        input_proc <= "00001100"; -- Determinamos una entrada arbitraria
        rst <= '1';               -- Reset asincronico
        clk <= '0';
        wait for delay;
    
        rst <= '0';
        clk <= '0';
        wait for delay;
        
        clk <= '1'; -- Flanco 0
        wait for delay;
        
        clk <= '0';
        wait for delay;
        
        clk <= '1'; -- Flanco 1
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i0" severity error;
        
        clk <= '1'; -- Flanco 2
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i1" severity error;
        
        clk <= '1'; -- Flanco 3
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i2" severity error;
        
        clk <= '1'; -- Flanco 4
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i3" severity error;
        
        clk <= '1'; -- Flanco 5
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i4" severity error;
        
        clk <= '1'; -- Flanco 6
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i5" severity error;

        clk <= '1'; -- Flanco 7
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i6" severity error;
        
        clk <= '1'; -- Flanco 8
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00001100" report "Error en ouput de i7" severity error;
        
        
        clk <= '1'; -- Flanco 9
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00011000" report "Error en ouput de i8" severity error;
        
        clk <= '1'; -- Flanco 10
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00001100" report "Error en ouput de i9" severity error;
        
        clk <= '1'; -- Flanco 11
        wait for delay;
        
        clk <= '0';
        wait for delay;
        assert output_proc = "00011100" report "Error en ouput de i10" severity error;
        
        clk <= '1'; -- Flanco 12
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i11" severity error;
        
        clk <= '0';
        wait for delay;
        
        clk <= '1'; -- Flanco 13
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i12" severity error;
        
        clk <= '0';
        wait for delay;

        clk <= '1'; -- Flanco 14
        wait for delay;
        assert output_proc = "00000000" report "Error en ouput de i13" severity error;
        
        clk <= '0';
        wait for delay;

        clk <= '1'; -- Flanco 15
        wait for delay;
        assert output_proc = "00011000" report "Error en ouput de i14" severity error;

        report "TestBench finalizado";
        wait;

  	end process;
end test;