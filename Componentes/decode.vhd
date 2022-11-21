library ieee;
use ieee.std_logic_1164.all;

entity decode is

    port(
        in_dec: in std_logic_vector(7 downto 0);
        alu_op: out std_logic_vector(2 downto 0);
        bus_sel: out std_logic_vector(1 downto 0);
        out_we, reg_we, reg_a_we: out std_logic);

end decode;

architecture beh_decode of decode is

begin

    process(in_dec)
    begin
        case in_dec is
            when "00000001" =>
                bus_sel     <=  "10";
                alu_op      <=  "000";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00000010" =>
                bus_sel     <=  "00";
                alu_op      <=  "000";
                reg_a_we    <=  '0';
                out_we      <=  '1';
                reg_we      <=  '0';
            when "00000011" =>
                bus_sel     <=  "00";
                alu_op      <=  "000";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00000100" =>
                bus_sel     <=  "00";
                alu_op      <=  "000";
                reg_a_we    <=  '1';
                out_we      <=  '0';
                reg_we      <=  '0';
            when "00000101" =>
                bus_sel     <=  "01";
                alu_op      <=  "000";
                reg_a_we    <=  '1';
                out_we      <=  '0';
                reg_we      <=  '0';
            when "00001010" =>
                bus_sel     <=  "00";
                alu_op      <=  "010";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00001011" =>
                bus_sel     <=  "00";
                alu_op      <=  "011";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00001100" =>
                bus_sel     <=  "00";
                alu_op      <=  "100";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00001101" =>
                bus_sel     <=  "00";
                alu_op      <=  "101";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00001110" =>
                bus_sel     <=  "00";
                alu_op      <=  "110";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00010100" =>
                bus_sel     <=  "00";
                alu_op      <=  "001";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when "00010101" =>
                bus_sel     <=  "00";
                alu_op      <=  "111";
                reg_a_we    <=  '0';
                out_we      <=  '0';
                reg_we      <=  '1';
            when others     =>
                bus_sel     <=  "XX";
                alu_op      <=  "XXX";
                reg_a_we    <=  'X';
                out_we      <=  'X';
                reg_we      <=  'X';
        end case;
    end process;
end beh_decode;