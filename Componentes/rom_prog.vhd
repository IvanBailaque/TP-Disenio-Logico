library ieee;
use ieee.std_logic_1164.all;

entity rom_prog is
    port(
        dir: in std_logic_vector(6 downto 0);
        data: out std_logic_vector(15 downto 0));

end rom_prog;

architecture beh_rom_prog of rom_prog is

begin

    data <= "0000000100110000" when dir = "0000000" else
            "0000010000000011" when dir = "0000001" else
            "0000101001000011" when dir = "0000010" else
            "0000101101010100" when dir = "0000011" else
            "0000110101100100" when dir = "0000100" else
            "0000110001110000" when dir = "0000101" else
            "0000001111100100" when dir = "0000110" else
            "0000001000000011" when dir = "0000111" else
            "0000001000000100" when dir = "0001000" else
            "0000001000000101" when dir = "0001001" else
            "0000001000000110" when dir = "0001010" else
            "0000001000000111" when dir = "0001011" else
            "0000001000001000" when dir = "0001100" else
            "0000001000001101" when dir = "0001101" else
            "0000001000001110" when dir = "0001110" else
            "XXXXXXXXXXXXXXXX"

end beh_rom_prog;