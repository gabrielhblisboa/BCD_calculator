--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:13:51 05/07/2023
-- Design Name:   
-- Module Name:   /home/ise/UFRJ/2023-1/Sistemas Digitais/CalculadoraBCD/TesteMult2Alg.vhd
-- Project Name:  CalculadoraBCD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mult2Alg
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
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TesteMult2Alg IS
END TesteMult2Alg;
 
ARCHITECTURE behavior OF TesteMult2Alg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mult2Alg
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         B : IN  std_logic_vector(3 downto 0);
         resultado : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
 
   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal resultado : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	signal clock: std_logic;
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mult2Alg PORT MAP (
          A => A,
          Cin => Cin,
          B => B,
          resultado => resultado,
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
		
		
      
		--wait for 100 ns;
		
		A <= "0010";
		B <= "0100";

      wait for clock_period*10;

		A <= "0010";
		B <= "0110";
		
		-- report std_logic_vector aux;
		
      -- insert stimulus here 

      wait;
   end process;

END;
