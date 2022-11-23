----------------------------------------------------------------------------------
-- Realizado por la catedra  Diseño Logico (UNTREF) en 2015
-- Tiene como objeto brindarle a los alumnos un template del procesador requerido
-- Profesores Martin Vazquez - Lucas Leiva
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;

entity Proc is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           input_proc : in  STD_LOGIC_VECTOR (7 downto 0);
           output_proc : out  std_logic_vector (7 downto 0));
end Proc;

architecture Beh_Proc of Proc is

-- Declaracion de los componentes utilizados

component regs -- Banco de registros
    port ( clk	: in  std_logic;
           rst	: in  std_logic;
           we	: in  std_logic;
           rd	: in  std_logic_vector (3 downto 0);
           rs	: in  std_logic_vector (3 downto 0);
           din	: in  std_logic_vector (7 downto 0);
           dout	: out  std_logic_vector (7 downto 0));
end component;

component alu -- Unidad aritmetico logica
    port ( sel	: in  std_logic_vector(2 downto 0);
           a,b	: in  std_logic_vector (7 downto 0);
           s	: out  std_logic_vector (7 downto 0));
end component;

component rom_prog -- Memoria de intrucciones
    port ( addr		: in  std_logic_vector (6 downto 0);
           data_out	: out  std_logic_vector (15 downto 0));
end component;

component decode -- Unidad de decodificacion
    port ( in_dec	: in  std_logic_vector (7 downto 0);
           reg_we,out_we,reg_a_we : out std_logic;
           alu_op	: out  std_logic_vector (2 downto 0);
           bus_sel	: out  std_logic_vector (1 downto 0));
end component;

component ir -- Registro de instruccion
    port( ir_in		        : in std_logic_vector(15 downto 0);
          clk,ir_we, rst 	: in std_logic;
          ir_out 	        : out std_logic_vector(15 downto 0));
end component;

component mux3_8 -- Multiplexor 3_8
    port( a, b, c	: in std_logic_vector(7 downto 0);
          sel		: in std_logic_vector(1 downto 0);
          mux_out 	: out std_logic_vector(7 downto 0));
end component;

component PC -- Contador de programa
    port( pc_out	: out std_logic_vector(6 downto 0);
          clk, rst	: in std_logic);
end component;

component reg_a -- Registro acumulador
    port( reg_a_in	: in std_logic_vector(7 downto 0);
          reg_a_out	: out std_logic_vector(7 downto 0);
          clk, rst, reg_a_we: in std_logic);
end component;

component reg_out -- Registro de salida
    port( reg_out_in : in std_logic_vector(7 downto 0);
          reg_o_out: out std_logic_vector(7 downto 0);
          clk, rst, reg_out_we: in std_logic);
end component;

-- ========================================================================================

-- Declaracion de señales usadas

signal out_rom_prog: std_logic_vector(15 downto 0);	-- Salida de rom_prog, a su vez, entrada de IR
signal ir_out: std_logic_vector(15 downto 0);		-- Salida de IR, a su vez in[1] de Mux3_8, bits(7..4) rd, (3..0) rs
signal pc_out : std_logic_vector(6 downto 0);		-- salida de PC, entrada de rom_prog
signal in_decode : std_logic_vector (7 downto 0);	-- Entrada decode, (ir_out(15 .. 8))
signal out_we, reg_we, reg_a_we : std_logic;		-- Salidas de decode, habilitaciones de escritura de reg out, reg a y reg
signal alu_op: std_logic_vector(2 downto 0);		-- Salida de decode, selector de la ALU
signal bus_sel : std_logic_vector(1 downto 0);		-- Salida de decode, selector del Mux 3_8
signal rd, rs: std_logic_vector(3 downto 0);		-- Acceso posicional del reg, out_ir: bits(7..4) rd, (3..0) rs
signal a_mux, b_mux: std_logic_vector(7 downto 0);	-- Entradas Mux3_8: a= reg_out, b= ir_out(7..0)
signal mux_out : std_logic_vector (7 downto 0);		-- Salida del Mux3_8, entrada de operando A de la ALU, entrada de reg_a
signal alu_out : std_logic_vector (7 downto 0);		-- Salida de la ALU, entrada de reg, entrada de reg_out
signal reg_o_out : std_logic_vector (7 downto 0);	-- Salida de reg out del procesador
signal reg_a_out: std_logic_vector(7 downto 0);		-- Salida del registro a, entrada de operando B de la ALU
signal ir_we: std_logic;

-- ========================================================================================

begin

    in_decode <= ir_out(15 downto 8);	-- A la entrada el decode le asignamos los 8 bits mas significativos de ir_out
    b_mux <= ir_out(7 downto 0);		-- A la entrada b del mux le asignamos los 8 bits menos significativos de ir_out
    rd <= ir_out(7 downto 4);			-- A la rd le asignamos los 4 bits (7..4) de ir_out
    rs <= ir_out(3 downto 0);			-- A la rd le asignamos los 4 bits (3..0) de ir_out
    ir_we <= '1';

-- ========================================================================================

-- Instaciacion de componentes utilziados

-- Contador de programa
e_PC : PC port map(pc_out => pc_out, clk => clk, rst => rst);

-- Memoria de instrucciones
e_rom_prog: rom_prog port map (addr => pc_out, data_out => out_rom_prog);

-- Registro de instruccion
e_ir: ir port map(ir_in =>out_rom_prog, clk => clk, ir_we => ir_we, rst => rst, ir_out =>ir_out);

-- Unidad de decodificacion
e_decode: decode port map (in_dec=> in_decode ,alu_op =>alu_op, bus_sel=> bus_sel,out_we =>out_we, reg_we =>reg_we, reg_a_we =>reg_a_we);

-- Multiplexor de 3 entradas de 8 bits
e_mux3_8 : mux3_8 port map(a =>a_mux, b=>b_mux, c=> input_proc,  sel=>bus_sel, mux_out=>mux_out);

-- Unidad aritmetico logica
e_alu: alu port map (
	sel =>alu_op , a=>mux_out, b=> reg_a_out, s=>alu_out);

-- Banco de registros
e_regs:  regs port map (clk => clk, rst => rst, we => reg_we, rd => rd, rs => rs, din => alu_out, dout => a_mux);

-- Registro acumulador
e_reg_a : reg_a port map(reg_a_in =>mux_out, reg_a_out =>reg_a_out, clk=> clk, rst => rst, reg_a_we =>reg_a_we);

-- Registro de salida
e_reg_out : reg_out port map(reg_out_in => alu_out, reg_o_out => output_proc, clk => clk, rst => rst, reg_out_we=> out_we);

	process (clk, rst)
	
	begin
	     if (rst='1') then
		  
		  elsif (rising_edge(clk)) then
		  
		  end if;
		  
	end process;

end Beh_Proc;

