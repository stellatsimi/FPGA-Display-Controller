
library ieee;
use ieee.std_logic_1164.all;

entity test_schematic1 is
end test_schematic1;

architecture testbench of test_schematic1 is

  -- Declaration of the component under test
  component schematic1
    port (
      d   : in std_logic;
      \q'\ : out std_logic;
      q   : out std_logic;
      cp  : in std_logic
    );
  end component;

  -- Signals for testbench
  signal d   : std_logic := '0';
  signal \q'\ : std_logic;
  signal q   : std_logic;
  signal cp  : std_logic := '0';

  -- Clock generation process
  clk_process : process
  begin
    cp <= '0';
    wait for 50 ns;
    cp <= '1';
    wait for 50 ns;
  end process;

begin

  -- Instantiate the schematic1 component
  dut: schematic1
    port map (
      d   => d,
      \q'\ => \q'\,
      q   => q,
      cp  => cp
    );

  -- Stimulus process
  stimulus: process
  begin
    -- Apply initial conditions
    wait for 100 ns;

    -- Test case 1: Set d = '0'
    d <= '0';
    wait for 100 ns;

    -- Test case 2: Set d = '1'
    d <= '1';
    wait for 100 ns;

    -- Test case 3: Toggle d
    d <= '0';
    wait for 100 ns;
    d <= '1';
    wait for 100 ns;

    -- Test case 4: Toggle d again
    d <= '0';
    wait for 100 ns;
    d <= '1';
    wait for 100 ns;

    -- Finish simulation
    wait;
  end process;

end testbench;
