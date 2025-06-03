LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY fa_sch IS PORT (
	i1 : IN std_logic;
	i2 : IN std_logic;
	i3 : IN std_logic;
	s2 : OUT std_logic;
	c2 : OUT std_logic
); END fa_sch;



ARCHITECTURE STRUCTURE OF fa_sch IS

-- COMPONENTS

COMPONENT \74AS86\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT \74AS00\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT \74AS10\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	I2_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	I2_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	I2_C : IN std_logic;
	O_C : OUT std_logic
	); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL N00159 : std_logic;
SIGNAL N00078 : std_logic;
SIGNAL N00172 : std_logic;
SIGNAL N00134 : std_logic;
SIGNAL VCC : std_logic;
SIGNAL GND : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U2 : \74AS86\	PORT MAP(
	I0_A => I1, 
	I1_A => I2, 
	O_A => N00078, 
	VCC => VCC, 
	GND => GND, 
	I0_B => N00078, 
	I1_B => I3, 
	O_B => S2
);
U3 : \74AS00\	PORT MAP(
	I0_A => I1, 
	I1_A => I2, 
	O_A => N00134, 
	VCC => VCC, 
	GND => GND, 
	I0_B => I1, 
	I1_B => I3, 
	O_B => N00159, 
	I0_C => I3, 
	I1_C => I2, 
	O_C => N00172
);
U4 : \74AS10\	PORT MAP(
	I0_A => N00134, 
	I1_A => N00159, 
	I2_A => N00172, 
	O_A => C2, 
	VCC => VCC, 
	GND => GND
);
END STRUCTURE;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY SCHEMATIC1 IS PORT (
	b1 : IN std_logic;
	\01\ : OUT std_logic;
	a1 : IN std_logic;
	b2 : IN std_logic;
	\02\ : OUT std_logic;
	a2 : IN std_logic;
	\03\ : OUT std_logic;
	\04\ : OUT std_logic;
	zero : IN std_logic
); END SCHEMATIC1;



ARCHITECTURE STRUCTURE OF SCHEMATIC1 IS

-- COMPONENTS

COMPONENT \74AS08\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT fa_sch	 PORT (
	i1 : IN std_logic;
	i2 : IN std_logic;
	i3 : IN std_logic;
	s2 : OUT std_logic;
	c2 : OUT std_logic
); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL VCC : std_logic;
SIGNAL GND : std_logic;
SIGNAL N00324 : std_logic;
SIGNAL N00335 : std_logic;
SIGNAL N00476 : std_logic;
SIGNAL N00314 : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U1 : \74AS08\	PORT MAP(
	I0_A => B2, 
	I1_A => A2, 
	O_A => N00314, 
	VCC => VCC, 
	GND => GND, 
	I0_B => A1, 
	I1_B => B2, 
	O_B => N00324, 
	I0_C => B1, 
	I1_C => A2, 
	O_C => N00335, 
	I0_D => A1, 
	I1_D => B1, 
	O_D => \01\
);
FA0 : fa_sch	PORT MAP(
	i1 => N00324, 
	i2 => N00335, 
	i3 => ZERO, 
	s2 => \02\, 
	c2 => N00476
);
FA1 : fa_sch	PORT MAP(
	i1 => ZERO, 
	i2 => N00314, 
	i3 => N00476, 
	s2 => \03\, 
	c2 => \04\
);
END STRUCTURE;

