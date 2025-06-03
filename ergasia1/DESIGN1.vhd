LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY SCHEMATIC5 IS PORT (
	X : OUT std_logic;
	A : IN std_logic;
	B : IN std_logic
); END SCHEMATIC5;



ARCHITECTURE STRUCTURE OF SCHEMATIC5 IS

-- COMPONENTS

COMPONENT \74ALS08\
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

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL GND : std_logic;
SIGNAL VCC : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U5 : \74ALS08\	PORT MAP(
	I0_A => A, 
	I1_A => B, 
	O_A => X, 
	VCC => VCC, 
	GND => GND
);
END STRUCTURE;

