----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:35:32 05/08/2023 
-- Design Name: 
-- Module Name:    StateMachine - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity StateMachine is
	Port  (clk, reset: in  std_logic;
			 ps2d, ps2c: in  std_logic;
			 botao : in std_logic;
			 SW: in std_logic;
			 LCD_DB1: out std_logic_vector (7 downto 0));
			 
			 ---resultadoSoma: out std_logic_vector (15 downto 0);
			 ---resultadoMult: out std_logic_vector (31 downto 0));
end StateMachine;

architecture Behavioral of StateMachine is

component kb_code is
   generic(W_SIZE: integer:=1);  -- 2^W_SIZE words in FIFO
   port (
      clk, reset: in  std_logic;
      ps2d, ps2c: in  std_logic;
      rd_key_code: in std_logic;
      number_code: out std_logic_vector(7 downto 0);
      kb_buf_empty: out std_logic
   );
end component;

component lcd is
    Port ( 	NUMERO: in std_logic_vector(3 downto 0);
				BOTAO: in std_logic;
				clk:in std_logic;				--GCLK2
				--ADR1:out std_logic;				--ADR(1)
				--ADR2:out std_logic;				--ADR(2)
				--CS:out std_logic;				--CSC
				rst:in std_logic;				--BTN
				--rdone: out std_logic);			--WriteDone output to work with DI05 test
				LED: out std_logic;
				LCD_DB: out std_logic_vector(7 downto 0);		--DB( 7 through 0)
				RS:out std_logic;  				--WE
				RW:out std_logic;				--ADR(0)
				OE:out std_logic;	
				flagW: out std_logic  );		--OE

end component;

type estado is (E0, E1, E2, E3, E4, E5, E6, E7);

signal estadoAtual: estado := E0;
--signal alg1, alg2, alg3, alg4, LCD_DB: std_logic_vector(7 downto 0);
signal display_code: std_logic_vector (3 downto 0) ;
signal key_code: std_logic_vector (7 downto 0);
signal rd_key_code: std_logic := '1';
signal kb_buf_empty: std_logic;
signal RS, RW, OE, LED: std_logic;
signal num: std_logic_vector (3 downto 0);
signal rtest: std_logic;
signal flagW: std_logic;
--signal LCD_DB: std_logic_vector (7 downto 0);

begin
	
--	algarismo2: kb_code port map (clk, reset, ps2d, ps2c, rd_key_code, alg2, kb_buf_empty);
--	digitar2: lcd port map (alg2 (3 downto 0), BOTAO, LED, LCD_DB, RS, RW, CLK, OE, rst);
--	
--	algarismo3: kb_code port map (clk, reset, ps2d, ps2c, rd_key_code, alg3, kb_buf_empty);
--	digitar3: lcd port map (alg3 (3 downto 0), BOTAO, LED, LCD_DB, RS, RW, CLK, OE, rst);
--	
--	algarismo4: kb_code port map (clk, reset, ps2d, ps2c, rd_key_code, alg4, kb_buf_empty);
--	digitar4: lcd port map (alg4 (3 downto 0), BOTAO, LED, LCD_DB, RS, RW, CLK, OE, rst);
	
	--rd_key_code <= not kb_buf_empty;

	teclado: kb_code port map (clk, reset, ps2d, ps2c, rd_key_code, key_code, kb_buf_empty);
	
	--display_code <= key_code (3 downto 0);

	--display: lcd port map (display_code, botao, clk, reset, LED, LCD_DB1, RS, RW, OE);

	
	process (clk, rtest, estadoAtual, rd_key_code, key_code, display_code)
		
		begin

			if (rising_edge(clk)) then
				
				case estadoAtual is
				
					when E0 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E4;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E1;
							end if;
						end if;
						
					when E1 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E4;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E2;
							end if;
						end if;
						
					when E2 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E4;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E3;
							end if;
						end if;
				
					when E3 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E4;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E4;
							end if;
						end if;
				
					when E4 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E0;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E5;
							end if;
						end if;
				
				
					when E5 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E0;
							else
							-display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E6;
							end if;
						end if;
				
					when E6 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E0;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E7;
							end if;
						end if;
				
					when E7 =>
						if (kb_buf_empty = '1') then
							rd_key_code <= '0';
							rtest <= '0';
						else
							rd_key_code <= '1';
							if (key_code = "00001101") then
								estadoAtual <= E0;
							else
								display_code <= key_code (3 downto 0);
								rtest <= '1';
								estadoAtual <= E0;
							end if;
						end if;
				
				end case;
			end if;
		end process;	
	
--    Port ( 	NUMERO: in std_logic_vector(3 downto 0);
--				BOTAO: in std_logic;
--				clk:in std_logic;				--GCLK2
--				--ADR1:out std_logic;				--ADR(1)
--				--ADR2:out std_logic;				--ADR(2)
--				--CS:out std_logic;				--CSC
--				rst:in std_logic				--BTN
--				--rdone: out std_logic);			--WriteDone output to work with DI05 test
--				LED: out std_logic;
--				LCD_DB: out std_logic_vector(7 downto 0);		--DB( 7 through 0)
--				RS:out std_logic;  				--WE
--				RW:out std_logic;				--ADR(0)
--				OE:out std_logic		);		--OE
	
--	process (estadoAtual, SW, E0, E1, E2, E3, E4)
--	begin
--
--	if (estadoAtual = E0) then
--		
--			
--		
--		if (alg1(3 downto 0) = "1101") then
--			estadoAtual <= E4;
--		else
--			estadoAtual <= E1;
--			
--		end if;
--		
--	elsif (estadoAtual = E1) then
--		
--		if (alg2(3 downto 0) = "1101") then
--			estadoAtual <= E4;
--		else
--			estadoAtual <= E2;
--			
--		end if;
--		
--	elsif (estadoAtual = E2) then
--		
--		if (alg3(3 downto 0) = "1101") then
--			estadoAtual <= E4;
--		else
--			estadoAtual <= E3;
--			
--		end if;	
--		
--	elsif (estadoAtual = E3) then
--		
--		
--		if (alg1(3 downto 0) = "1101") then
--			estadoAtual <= E4;
--		--else
--			--estadoAtual <= E4;
--		end if;
--	
--	end if;
--	end process;
	
end Behavioral;

