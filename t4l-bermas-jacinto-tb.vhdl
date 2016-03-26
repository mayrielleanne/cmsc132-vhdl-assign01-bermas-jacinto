library IEEE; use IEEE.std_logic_1164.all;

use IEEE.numeric_std.all;


entity tb_switches is

	constant MAX_COMB: integer := 64;

	constant DELAY: time := 10 ns;

end entity;


architecture tb of tb_switches is


	component switches is

   	  port(in1,out1,in2,out2,in3,out3: in std_logic; z: out std_logic);

	end component;

	signal i5,i4,i3,i2,i1,i0: std_logic;

	signal z: std_logic;
	
begin --architecture


	uut:
	component switches port map(i5,i4,i3,i2,i1,i0, z);

	main: process is


		variable temp: unsigned(5 downto 0);

		--variable expected_valid: std_logic;

		--variable expected_encoded: std_logic_vector(2 downto 0);

		expected_z: std_logic;
		variable error_count: integer := 0;


	begin --process

	
report "start simulation";


	for i in 0 to 63 loop

			temp := TO_UNSIGNED(i, 6);

			--assign each input a value from temp

			i5 <= temp(5);

			i4 <= temp(4);

			i3 <= temp(3);

			i2 <= temp(2);

			i1 <= temp(1);

			i0 <= temp(0);

		if (i=0) then
 
		expected_z := '0';


		else


		if(i = 1) then expected_z := '0';


		elsif (i = 2 ) then expected_z := '0';

		elsif (i = 4 ) then expected_z := '0';

		elsif (i = 5 ) then expected_z := '0';

		elsif (i = 8 ) then expected_z := '0';
		elsif (i = 10 ) then expected_z := '0';
		elsif (i = 16 ) then expected_z := '0';
		elsif (i = 17 ) then expected_z := '0';
		elsif (i = 20 ) then expected_z := '0';
		elsif (i = 21 ) then expected_z := '0';
		elsif (i = 32 ) then expected_z := '0';
		elsif (i = 34 ) then expected_z := '0';
		elsif (i = 40 ) then expected_z := '0';
		elsif (i = 42 ) then expected_z := '0';
		else expected_z := '1';

		end if;

	end if;

		wait for DELAY;
		assert((expected_z = z))
report "ERROR: Expected Z " & std_logic'image(expected_z)& " /= actual z " & 
 std_logic'image(z) &
 " at time " & time'image(now); 

	if  ((expected_z /= '1'))
 then error_count := error_count + 1;

	end if;

		end loop;

		wait for DELAY;

		assert (error_count = 0)

		report "ERROR: There were " & integer'image(error_count) & " errors!";

			if(error_count = 0)

				then report "Simulation completed with NO errors.";

			end if;

		wait;

	end process;

end architecture tb;

