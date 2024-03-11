----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:57:31 05/07/2023 
-- Design Name: 
-- Module Name:    Soma2Alg - Behavioral 
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

entity Soma2Alg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin: in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end Soma2Alg;

architecture Behavioral of Soma2Alg is

signal aux: unsigned (4 downto 0) := "00000";
signal resultado: unsigned (3 downto 0) := "0000";

begin
	
	P1: process (A, B, Cin, aux, resultado)
	begin
		aux <= '0' & unsigned(A) + unsigned(B) + ("0000" & Cin);
		if (aux > 9) then
			-- se passar de 9, tem que somar 6 no resultado e o Cout vai pra 1.
			Cout <= '1';
			resultado <= resize((aux + "00110"), 4);
		else
			Cout <= '0';
			resultado <= aux(3 downto 0);
		end if;
		S <= std_logic_vector (resultado);
	end process;

end Behavioral;

