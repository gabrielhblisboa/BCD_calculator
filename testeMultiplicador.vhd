--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:03:31 05/09/2023
-- Design Name:   
-- Module Name:   /home/ise/UFRJ/2023-1/Sistemas Digitais/CalculadoraBCD/testeMultiplicador.vhd
-- Project Name:  CalculadoraBCD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MultiplicadorBCD
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testeMultiplicador IS
END testeMultiplicador;
 
ARCHITECTURE behavior OF testeMultiplicador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiplicadorBCD
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(15 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(15 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
	signal clock: std_logic;
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MultiplicadorBCD PORT MAP (
          A => A,
          B => B,
          S => S,
          Cout => Cout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      A <= "00010010";
		B <= "00000010";
		
		wait for clock_period*10;
		

      -- insert stimulus here 

      wait;
   end process;

END;
