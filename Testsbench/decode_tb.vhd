library ieee;
use ieee.std_logic_1164.all;

entity decode_tb is
end decode_tb;

architecture test of decode_tb is

    component decode
        port(
            in_dec : in std_logic_vector(7 downto 0);
            alu_op : out std_logic_vector(2 downto 0);
            bus_sel: out std_logic_vector(1 downto 0);
            out_we, reg_we, reg_a_we : out std_logic);
    end component;

    signal in_dec : std_logic_vector(7 downto 0);
    signal alu_op : std_logic_vector(2 downto 0);
    signal bus_sel:  std_logic_vector(1 downto 0);
    signal out_we, reg_we, reg_a_we : std_logic;

    constant delay: time:= 10 ns;

begin 

    uut: decode port map (
        in_dec => in_dec, alu_op => alu_op ,bus_sel => bus_sel,out_we => out_we,reg_we => reg_we,reg_a_we => reg_a_we);

    process
    begin
        in_dec <= "00000001";
        wait for delay;
        assert bus_sel = "10" and alu_op = "000" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x01" severity error;

        in_dec <= "00000010";
        wait for delay;
        assert bus_sel = "00" and alu_op = "000" and reg_a_we = '0' and out_we = '1' and reg_we <= '0' report "Error en 0x02" severity error;

        in_dec <= "00000011";
        wait for delay;
        assert bus_sel = "00" and alu_op = "000" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x03" severity error;

        in_dec <= "00000100";
        wait for delay;
        assert bus_sel = "00" and alu_op = "000" and reg_a_we = '1' and out_we = '0' and reg_we <= '0' report "Error en 0x04" severity error;

        in_dec <= "00000101";
        wait for delay;
        assert bus_sel = "01" and alu_op = "000" and reg_a_we = '1' and out_we = '0' and reg_we <= '0' report "Error en 0x05" severity error;

        in_dec <= "00001010";
        wait for delay;
        assert bus_sel = "00" and alu_op = "010" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x10" severity error;

        in_dec <= "00001011";
        wait for delay;
        assert bus_sel = "00" and alu_op = "011" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x11" severity error;

        in_dec <= "00001100";
        wait for delay;
        assert bus_sel = "00" and alu_op = "100" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x12" severity error;

        in_dec <= "00001101";
        wait for delay;
        assert bus_sel = "00" and alu_op = "101" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x13" severity error;

        in_dec <= "00001110";
        wait for delay;
        assert bus_sel = "00" and alu_op = "110" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x14" severity error;
        in_dec <= "00010100";
        wait for delay;
        assert bus_sel = "00" and alu_op = "001" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x20" severity error;
        in_dec <= "00010101";
        wait for delay;
        assert bus_sel = "00" and alu_op = "111" and reg_a_we = '0' and out_we = '0' and reg_we <= '1' report "Error en 0x20" severity error;

        report "TestBench finalizado";
        wait;
    end process;
end test;