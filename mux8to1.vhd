LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mux8to1 is
port(
		i_inputs	:	in std_logic_vector(7 downto 0);	-- 8 inputs
		i_select	:	in std_logic_vector(2 downto 0);	-- 3 selection bits
		o_output	:	out std_logic);						-- 1 output
end mux8to1;


architecture muxrtl of mux8to1 is

signal ins	: std_logic_vector(7 downto 0);
signal sel		: std_logic_vector(2 downto 0);
signal ands		: std_logic_vector(7 downto 0);
signal orgate	: std_logic;

begin

ins	<= i_inputs;
sel	<= i_select;

ands(0) <= not(sel(2)) and	not(sel(1)) and	not(sel(0))		and ins(0);
ands(1) <= not(sel(2)) and	not(sel(1))	and	sel(0) 			and ins(1);
ands(2) <= not(sel(2)) and	sel(1) 		and	not(sel(0)) 	and ins(2);
ands(3) <= not(sel(2)) and	sel(1) 		and 	sel(0) 			and ins(3);
ands(4) <= sel(2) 	  and not(sel(1)) and 	not(sel(0)) 	and ins(4);
ands(5) <= sel(2) 	  and not(sel(1)) and 	sel(0) 			and ins(5);
ands(6) <= sel(2) 	  and	sel(1) 		and 	not(sel(0)) 	and ins(6);
ands(7) <= sel(2) 	  and	sel(1) 		and 	sel(0)		 	and ins(7);

orgate <= ands(0) or ands(1) or ands(2) or ands(3) or ands(4) or ands(5) or ands(6) or ands(7); 

end mux8to1;

