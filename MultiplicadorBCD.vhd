----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:54:26 05/07/2023 
-- Design Name: 
-- Module Name:    MultiplicadorBCD - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiplicadorBCD is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
			  Cout: out STD_LOGIC );
end MultiplicadorBCD;

architecture Behavioral of MultiplicadorBCD is

component Mult2Alg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin: in STD_LOGIC;
           resultado : out std_logic_vector (7 downto 0);
			  Cout: out STD_LOGIC);
end component; 

component Somador is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           soma : out  STD_LOGIC_VECTOR (15 downto 0);
           Cout : out  STD_LOGIC);
end component;


component Soma2Alg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin: in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

signal fator11, fator21, fator12, fator22: std_logic_vector (7 downto 0);  

signal soma1, soma2: std_logic_vector (15 downto 0);

signal aux1, aux2: std_logic_vector (15 downto 0) := "0000000000000000";

signal c1, c2: std_logic;

begin

	mult11: Mult2Alg port map (A(3 downto 0), B(3 downto 0), '0', fator11, Cout);
	mult21: Mult2Alg port map (A(7 downto 4), B(3 downto 0), '0', fator21, Cout);
	--mult31: Mult2Alg port map (A(11 downto 8), B(3 downto 0), '0', fator31, Cout);
	--mult41: Mult2Alg port map (A(15 downto 12), B(3 downto 0), '0', fator41, Cout);
	
	aux1 (3 downto 0) <= fator11 (3 downto 0);
	
	s1: Soma2Alg port map (fator21 (3 downto 0), fator11 (7 downto 4), '0', aux1 (7 downto 4), c1);
	
	aux1 (11 downto 8) <= fator21 (7 downto 4);
	
	--primeiraSoma: Somador port map (fator11, shift_left(fator21, 1), soma1, c);
	--segundaSoma: Somador port map (soma1, shift_left(fator31, 2), soma2, c);
	--terceiraSoma: Somador port map (soma2, shift_left(fator41, 3), soma3, c);
	
	mult12: Mult2Alg port map (A(3 downto 0), B(7 downto 4), '0', fator12 (7 downto 0), Cout);
	mult22: Mult2Alg port map (A(7 downto 4), B(7 downto 4), '0', fator22 (7 downto 0), Cout);
	--mult32: Mult2Alg port map (A(11 downto 8), B(7 downto 4), '0', fator32, Cout);
	--mult42: Mult2Alg port map (A(15 downto 12), B(7 downto 4), '0', fator42, Cout);
	
	aux2 (7 downto 4) <= fator12 (3 downto 0);
	
	s2: Soma2Alg port map (fator22 (3 downto 0), fator12 (7 downto 4), '0', aux2 (11 downto 8), c2);
	
	aux2 (15 downto 12) <= fator22 (7 downto 4);
	
	--segundaSoma: Somador port map (shift_left(fator12, 1), shift_left(fator22, 2), soma2, c);
	
	somaFinal: Somador port map (aux1, aux2, S, Cout);
	
	
	
	--quintaSoma: Somador port map (soma3, shift_left(fator32, 3), soma4, c);
	--sextaSoma: Somador port map (soma4, shift_left(fator42, 4), soma5, c);

--	mult13: Mult2Alg port map (A(3 downto 0), B(11 downto 8), '0', fator13, Cout);
--	mult23: Mult2Alg port map (A(7 downto 4), B(11 downto 8), '0', fator23, Cout);
--	mult33: Mult2Alg port map (A(11 downto 8), B(11 downto 8), '0', fator33, Cout);
--	mult43: Mult2Alg port map (A(15 downto 12), B(11 downto 8), '0', fator43, Cout);
--	
--	setimaSoma: Somador port map (shift_left(fator13, 2), shift_left(fator23, 3), soma6, c);
--	oitavaSoma: Somador port map (soma6, shift_left(fator33, 4), soma7, c);
--	nonaSoma: Somador port map (soma7, shift_left(fator43, 5), soma8, c);
--	
--	mult14: Mult2Alg port map (A(3 downto 0), B(15 downto 12), '0', fator14, Cout);
--	mult24: Mult2Alg port map (A(7 downto 4), B(15 downto 12), '0', fator24, Cout);
--	mult34: Mult2Alg port map (A(11 downto 8), B(15 downto 12), '0', fator34, Cout);
--	mult44: Mult2Alg port map (A(15 downto 12), B(15 downto 12), '0', fator44, Cout);
--	
--	decimaSoma: Somador port map (shift_left(fator14, 3), shift_left(fator24, 4), soma9, c);
--	decimaPrimeiraSoma: Somador port map (soma9, shift_left(fator34, 5), soma10, c);
--	decimaSegundaSoma: Somador port map (soma10, shift_left(fator44, 6), soma11, c);

	

end Behavioral;

