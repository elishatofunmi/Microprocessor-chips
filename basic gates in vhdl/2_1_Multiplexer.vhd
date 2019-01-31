LIBRARY ieee;
Use ieee.std_logic_1164.ALL;

ENTITY multiplexer is PORT(
d0, d1: IN STD_LOGIC;
y: OUT STD_LOGIC);
END multiplexer;

Architecture Behavioral of multiplexer is
BEGIN
    PROCESS(d0, d1)
    BEGIN
       y <= d0 or d1;
    END PROCESS;
END Behavioral;
