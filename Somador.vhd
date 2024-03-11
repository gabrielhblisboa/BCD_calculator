----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:03:28 05/07/2023 
-- Design Name: 
-- Module Name:    Somador - Behavioral 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Somador is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           soma : out  STD_LOGIC_VECTOR (15 downto 0);
           Cout : out  STD_LOGIC);
end Somador;

architecture Behavioral of Somador is

component Soma2Alg is
	Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
          B : in  STD_LOGIC_VECTOR (3 downto 0);
			 Cin: in STD_LOGIC;
          S : out  STD_LOGIC_VECTOR (3 downto 0);
          Cout : out  STD_LOGIC);
end component;


signal c: std_logic_vector (2 downto 0);
signal vetor1, vetor2: std_logic_vector (15 downto 0);

begin
	
	somador1: Soma2Alg port map (A(3 downto 0), B(3 downto 0), '0', soma(3 downto 0), c(0));
	somador2: Soma2Alg port map (A(7 downto 4), B(7 downto 4), c(0), soma(7 downto 4), c(1));
	somador3: Soma2Alg port map (A(11 downto 8), B(11 downto 8), c(1), soma(11 downto 8), c(2));
	somador4: Soma2Alg port map (A(15 downto 12), B(15 downto 12), c(2), soma(15 downto 12), Cout);

end Behavioral;

