--TestBench for Sequence Detector
--input W=010111100110011111

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tbmain is
    
end tbmain;

architecture Behavioral of tbmain is
signal clk,reset,seq,det_vld : std_logic := '0';
   constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.fsm PORT MAP (
          clk => clk,
          reset => reset,
          seq => seq,
          det_vld => det_vld
        );

   -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;

   -- Stimulus process : Apply the bits in the sequence one by one.
   stim_proc: process
   begin        
        seq <= '0';             --0
      wait for clk_period;
        seq <= '1';             --01
      wait for clk_period;
        seq <= '0';             --010
      wait for clk_period;
        seq <= '1';             --0101
      wait for clk_period;
        seq <= '1';             --01011
      wait for clk_period;
        seq <= '1';             --010111
      wait for clk_period;
        seq <= '1';             --0101111
      wait for clk_period;
        seq <= '0';             --01011110
      wait for clk_period;
        seq <= '0';             --010111100
      wait for clk_period;
        seq <= '1';             --0101111001
      wait for clk_period;
       seq <=  '1';              --01011110011
      wait for clk_period;
        seq <= '0';             --010111100110
      wait for clk_period;
        seq <= '0';             --0101111001100
       wait for clk_period;
        seq <= '1';             --01011110011001
       wait for clk_period;
         seq <= '1';            --010111100110011
       wait for clk_period;
          seq <= '1';           --0101111001100111
       wait for clk_period;
         seq <= '1';            --01011110011001111
       wait for clk_period;
         seq <= '1';
                    
      wait;         
   end process;



end Behavioral;
