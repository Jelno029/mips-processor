LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mux8to1_8bits is
port(
		i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7	:	in std_logic_vector(7 downto 0);	-- 8 inputs,8 bits each
		i_selbits	:	in std_logic_vector(2 downto 0);										-- 3 selection bits
		o_output	:	out std_logic_vector(7 downto 0));										-- 1 output of 8 bits
end mux8to1_8bits;


architecture mux8bitrtl of mux8to1_8bits is

entity mux8to1 is
port(
		i_inputs	:	in std_logic_vector(7 downto 0);	-- 8 inputs
		i_select	:	in std_logic_vector(2 downto 0);	-- 3 selection bits
		o_output	:	out std_logic);						-- 1 output
end mux8to1;