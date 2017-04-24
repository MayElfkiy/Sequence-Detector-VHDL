--Overlapping Sequence detector for 1001 and 1111


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fsm is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           seq : in STD_LOGIC;
           det_vld : out STD_LOGIC);
end fsm;

architecture Behavioral of fsm is

type state_type is (A,B,C,D,G,F);  --Defines the type for states in the state machine
signal state : state_type := A;

begin
process(clk) 
begin
   if( reset = '1' ) then     --resets state and output signal when reset is asserted.
        det_vld <= '0';
        state <= A; 
    elsif ( rising_edge(clk) ) then   --calculates the next state based on current state and input bit.
        case state is
            when A =>   --when the current state is A.
                det_vld <= '0';
                if ( seq = '0' ) then
                    state <= A;
                else    
                    state <= B;
                end if; 
            when B =>   --when the current state is B.
                det_vld <= '0';
                if ( seq = '0' ) then
                    state <= G;
                else    
                    state <= C;
                end if; 
            when C =>  --when the current state is C.
                det_vld <= '0';
                if ( seq = '0' ) then
                    state <= F;
                else    
                    state <= D;
                    
                end if;
               
            when D =>     --when the current state is D.
                det_vld <= '0';
                if ( seq = '0' ) then
                    state <= C;
                else    
                    state <= D;
                    det_vld <= '1'; --means it found the sequence 1111
                    
                    
                end if;   
               
            when G =>   --when the current state is G.
                det_vld <= '0';
                if ( seq = '0' ) then
                    state <= F;
                    
                    
                else    
                    state <= B;
                end if;   
            when F =>   --when the current state is F.
                det_vld <= '0';
                if ( seq = '0' ) then
                    state <= F;
               
                else    
                    state <= B;
                    det_vld <= '1';  -- means that it found the sequence 1001
                      
                end if;     
            when others =>
                NULL;
        end case;
    end if;
end process;    
end Behavioral;
