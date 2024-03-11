----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:51 05/07/2023 
-- Design Name: 
-- Module Name:    Mult2Alg - Behavioral 
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

entity Mult2Alg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin: in STD_LOGIC;
           resultado : out std_logic_vector (7 downto 0);
			  Cout: out STD_LOGIC);
end Mult2Alg;

architecture Behavioral of Mult2Alg is

signal produto, aux: unsigned (7 downto 0):="00000000";
signal dezena, unidade: unsigned (7 downto 0) := "00000000";

begin
		
			produto <= unsigned(A)*unsigned(B);
			
			dezena <= produto/10;
			
			unidade <= produto mod 10;
			
			aux(7 downto 4) <= dezena (3 downto 0);
			aux(3 downto 0) <= unidade (3 downto 0);
			
			resultado <= std_logic_vector (aux);

end Behavioral;