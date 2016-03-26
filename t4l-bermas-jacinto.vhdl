library IEEE; use IEEE.std_logic_1164.all;


entity switches is

	port(in1,out1,in2,out2,in3,out3: in std_logic; z: out std_logic);

end entity;



architecture sw of switches is

begin

	z <= (in3 and out3) or (in3 and out2) or (in3 and out1) or (in2 and out3) or (in2 and out2) or (in2 and out1) or (in1 and out3) or (in1 and out2) or (in1 and out1);

end architecture;

