LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY d_ff_schematic IS PORT (
	D : IN std_logic;
	CP : IN std_logic;
	Q : OUT std_logic;
	\Q'\ : OUT std_logic
); END d_ff_schematic;



ARCHITECTURE STRUCTURE OF d_ff_schematic IS

-- COMPONENTS

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
SIGNAL N00176 : std_logic;
SIGNAL N00137 : std_logic;
SIGNAL N00218 : std_logic;
SIGNAL N00126 : std_logic;
SIGNAL N00485 : std_logic;
SIGNAL N00592 : std_logic;
SIGNAL GND : std_logic;
SIGNAL VCC : std_logic;
SIGNAL N00093 : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
\Q'\<=N00137;
Q<=N00176;
U1 : \74AS00\	PORT MAP(
	I0_A => N00485, 
	I1_A => N00126, 
	O_A => N00093, 
	VCC => VCC, 
	GND => GND, 
	I0_B => N00093, 
	I1_B => CP, 
	O_B => N00126, 
	I0_C => N00126, 
	I1_C => N00137, 
	O_C => N00176, 
	I0_D => N00176, 
	I1_D => N00218, 
	O_D => N00137
);
U2 : \74AS10\	PORT MAP(
	I0_A => N00126, 
	I1_A => CP, 
	I2_A => N00485, 
	O_A => N00218, 
	VCC => VCC, 
	GND => GND
);
U3 : \74AS00\	PORT MAP(
	I0_A => N00592, 
	I1_A => D, 
	O_A => N00485, 
	VCC => VCC, 
	GND => GND
);
END STRUCTURE;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY SCHEMATIC1 IS PORT (
	D : IN std_logic;
	\Q'\ : OUT std_logic;
	Q : OUT std_logic;
	CP : IN std_logic
); END SCHEMATIC1;



ARCHITECTURE STRUCTURE OF SCHEMATIC1 IS

-- COMPONENTS

COMPONENT d_ff_schematic	 PORT (
	D : IN std_logic;
	CP : IN std_logic;
	Q : OUT std_logic;
	\Q'\ : OUT std_logic
); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U4 : d_ff_schematic	PORT MAP(
	D => D, 
	CP => CP, 
	Q => Q, 
	\Q'\ => \Q'\
);
END STRUCTURE;

