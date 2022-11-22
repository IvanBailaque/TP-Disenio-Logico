----------------------------------------------------------------------------------
-- Realizado por la catedra  Dise�o L�gico (UNTREF) en 2015
-- Tiene como objeto brindarle a los alumnos un template del procesador requerido
-- Profesores Mart�n V�zquez - Lucas Leiva
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Proc is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  std_logic_vector (7 downto 0));
end Proc;

architecture Beh_Proc of Proc is

-- ================
-- Declaraci�n de los componentes utilziados

component regs 
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           we : in  std_logic;
           rd : in  std_logic_vector (3 downto 0);
           rs : in  std_logic_vector (3 downto 0);
           din : in  std_logic_vector (7 downto 0);
           dout : out  std_logic_vector (7 downto 0));
end component;

component alu port ( sel: in  std_logic_vector(2 downto 0);
           a,b : in  std_logic_vector (7 downto 0);
           s : out  std_logic_vector (7 downto 0));
end component;

component rom_prog port (addr : in  std_logic_vector (6 downto 0);
						data_out : out  std_logic_vector (15 downto 0));
end component; 

component decode port (in_dec : in  std_logic_vector (7 downto 0);
			reg_we,out_we,reg_a_we  : out  std_logic;
			alu_op : out  std_logic_vector (2 downto 0);
			bus_sel : out  std_logic_vector (1 downto 0));
end component;

component ir port(
			ir_in : in std_logic_vector(15 downto 0);
			clk,ir_we,rst : in std_logic;
			ir_out : out std_logic_vector(15 downto 0));
end component;

component mux3_8 port(
			a, b, c : in std_logic_vector(7 downto 0);
        	sel : in std_logic_vector(1 downto 0);
        	mux_out : out std_logic_vector(7 downto 0));
end component;

component PC port(
			pc_out: out std_logic_vector(6 downto 0);
			clk, rst : in std_logic);
end component;

component reg_a port(
			reg_a_in : in std_logic_vector(7 downto 0);
			reg_a_out: out std_logic_vector(7 downto 0);
			clk, rst, reg_a_we: in std_logic);
end component;

component reg_out port(
        	reg_out_in : in std_logic_vector(7 downto 0);
        	reg_out_out: out std_logic_vector(7 downto 0);
        	clk, rst, reg_out_we: in std_logic);
end component;

-- declaracion de señales usadas

-- Banco de registros
signal we: std_logic; -- senal para escribir en el banco de registro 
signal rd, rs: std_logic_vector(3 downto 0);

signal out_pc : std_logic_vector(6 downto 0); -- salida del pc, entrada de rom_prog


-- signal ....

-- ================

begin

-- ================
-- Instaciacion de componentes utilziados

-- Banco de registros
eregs:  regs Port map (clk => clk, rst => rst, we => we, 
								rd => rd, rs => rs, 
								din =>, dout => ); -- hay que cpmpletar esta instanciaci�n
-- La ALU
eAlu: alu port map ();

-- La ROM de programa
eROM_Prog: rom_prog port map ();

-- El decodificador de la instrucci�n
eDecode: decode port map ();

-- ================


-- ================
-- Descripci�n de mux que funciona como "bus"
-- controlado por bus_sel

-- ================


-- ================
-- Descripci�n de los almacenamientos
-- Los almacenamientos que se deben decribir aca son: 
-- <reg_a> 8 bits
-- <reg_out> de 8 bits
-- <pc> de 8 bits
-- <ir> de 16 bits

	process (clk, rst)
	
	begin
	     if (rst='1') then 
		  
		  elsif (rising_edge(clk)) then
		  
		  end if;
		  
	end process;


end Beh_Proc;

