LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity alu8bit is
port(
		i_op1, i_op2	: in std_logic_vector(7 downto 0);
		i_aluOp			: in std_logic_vector(2 downto 0);
		o_aluOut			: out std_logic_vector(7 downto 0));
end alu8bit;


architecture alu8b_rtl of alu8bit is

component CLA_top2 is
port(
	A, B	: in std_logic_vector(9 downto 0);
	OP		: in std_logic;
--	Cin: in std_logic;
	S		: out std_logic_vector(9 downto 0);
	Cout	: out std_logic);
end component;

component mux8to1_8bit is
port(
		i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7 : in std_logic_vector(7 downto 0);	-- 8 inputs, 8 bits
		i_select	:	in std_logic_vector(3 downto 0);											-- 1 selection bit
		o_output	:	out std_logic_vector(7 downto 0));	
end component;


signal zeros : std_logic_vector(7 downto 0) := "00000000";
signal op1, op2, andout, orout, addout, subout, soltout : std_logic_vector(7 downto 0);


begin

--Operators
op1 <= i_op1;
op2 <= i_op2;

--Operations
andout	<= op1 and op2;
orout 	<= op1 or op2;
adder:CLA_top2 port map(op1, op2, '0', S(7 downto 0) => addout);
suber:CLA_top2 port map(op1, op2, '1', S(7 downto 0) => subout);
soltout <= (others => subout(7));	--extend the sign-bit of the difference.

--MUX /output driver
mux:mux8to1_8bit port map(andout, orout, addout, zeros, zeros, zeros, subout, soltout, i_aluOp, o_aluOut);


end alu8b_rtl;