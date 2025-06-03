-- Testbench for 2-bit Carry-Save Multiplier
-- Created to verify the functionality of the multiplier

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_schematic1 is
end test_schematic1;

architecture testbench of test_schematic1 is

  -- Declaration of the component under test
  component schematic1
    port (
      b1   : in  std_logic;
      \01\ : out std_logic;
      a1   : in  std_logic;
      b2   : in  std_logic;
      \02\ : out std_logic;
      a2   : in  std_logic;
      \03\ : out std_logic;
      \04\ : out std_logic;
      zero : in  std_logic
    );
  end component;

  -- Signal declarations
  signal b1   : std_logic := '0';
  signal \01\ : std_logic;
  signal a1   : std_logic := '0';
  signal b2   : std_logic := '0';
  signal \02\ : std_logic;
  signal a2   : std_logic := '0';
  signal \03\ : std_logic;
  signal \04\ : std_logic;
  signal zero : std_logic := '0';

begin

  -- Instantiate the DUT (Device Under Test)
  dut: schematic1
    port map (
      b1   => b1,
      \01\ => \01\,
      a1   => a1,
      b2   => b2,
      \02\ => \02\,
      a2   => a2,
      \03\ => \03\,
      \04\ => \04\,
      zero => zero
    );

  -- Testbench process
  stimulus: process
  begin
    -- Test case 1: a = 00, b = 00
    a1 <= '0'; a2 <= '0'; b1 <= '0'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 1 Failed" severity error;

    -- Test case 2: a = 00, b = 01
    a1 <= '0'; a2 <= '0'; b1 <= '0'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 2 Failed" severity error;

    -- Test case 3: a = 00, b = 10
    a1 <= '0'; a2 <= '0'; b1 <= '1'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 3 Failed" severity error;

    -- Test case 4: a = 00, b = 11
    a1 <= '0'; a2 <= '0'; b1 <= '1'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '1')
      report "Test Case 4 Failed" severity error;

    -- Test case 5: a = 01, b = 00
    a1 <= '0'; a2 <= '1'; b1 <= '0'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 5 Failed" severity error;

    -- Test case 6: a = 01, b = 01
    a1 <= '0'; a2 <= '1'; b1 <= '0'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '1' and \03\ = '0' and \04\ = '1')
      report "Test Case 6 Failed" severity error;

    -- Test case 7: a = 01, b = 10
    a1 <= '0'; a2 <= '1'; b1 <= '1'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '1' and \04\ = '0')
      report "Test Case 7 Failed" severity error;

    -- Test case 8: a = 01, b = 11
    a1 <= '0'; a2 <= '1'; b1 <= '1'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '1' and \03\ = '1' and \04\ = '1')
      report "Test Case 8 Failed" severity error;

    -- Test case 9: a = 10, b = 00
    a1 <= '1'; a2 <= '0'; b1 <= '0'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 9 Failed" severity error;

    -- Test case 10: a = 10, b = 01
    a1 <= '1'; a2 <= '0'; b1 <= '0'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '1' and \04\ = '0')
      report "Test Case 10 Failed" severity error;

    -- Test case 11: a = 10, b = 10
    a1 <= '1'; a2 <= '0'; b1 <= '1'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '1' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 11 Failed" severity error;

    -- Test case 12: a = 10, b = 11
    a1 <= '1'; a2 <= '0'; b1 <= '1'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '1' and \02\ = '0' and \03\ = '1' and \04\ = '0')
      report "Test Case 12 Failed" severity error;

    -- Test case 13: a = 11, b = 00
    a1 <= '1'; a2 <= '1'; b1 <= '0'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '0' and \03\ = '0' and \04\ = '0')
      report "Test Case 13 Failed" severity error;

    -- Test case 14: a = 11, b = 01
    a1 <= '1'; a2 <= '1'; b1 <= '0'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '0' and \02\ = '1' and \03\ = '1' and \04\ = '1')
      report "Test Case 14 Failed" severity error;

    -- Test case 15: a = 11, b = 10
    a1 <= '1'; a2 <= '1'; b1 <= '1'; b2 <= '0'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '1' and \02\ = '1' and \03\ = '1' and \04\ = '0')
      report "Test Case 15 Failed" severity error;

    -- Test case 16: a = 11, b = 11
    a1 <= '1'; a2 <= '1'; b1 <= '1'; b2 <= '1'; zero <= '0';
    wait for 10 ns;
    assert (\01\ = '1' and \02\ = '1' and \03\ = '1' and \04\ = '1')
      report "Test Case 16 Failed" severity error;

    -- Finish simulation
    wait;
  end process;

end testbench;

