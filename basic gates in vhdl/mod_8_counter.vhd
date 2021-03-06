library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end tb;

architecture a of tb is
  constant CLK_PERIOD : time      := 100 ns;
  signal J            : std_logic := '0';
  signal K            : std_logic := '0';
  signal Clk          : std_logic := '0';
  signal Q            : std_logic;
  signal Qbar         : std_logic;
begin
  Clk <= not Clk after CLK_PERIOD / 2;

  uut : entity work.JKFlipFlopGate
    port map(
      J    => J,
      K    => K,
      Clk  => Clk,
      Q    => Q,
      Qbar => Qbar
    );

  process
  begin
    wait for CLK_PERIOD;
    J <= '1';
    wait for CLK_PERIOD;
    J <= '0';
    wait for CLK_PERIOD;
    k <= '1';
    wait for CLK_PERIOD;
    K <= '0';
    wait for CLK_PERIOD;
    J <= '1';
    k <= '1';
    wait for CLK_PERIOD;
    J <= '0';
    k <= '0';
    wait;
  end process;

end a;