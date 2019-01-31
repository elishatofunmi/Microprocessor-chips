LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY NOR3gate IS PORT(
    x: IN STD_LOGIC;
    y: IN STD_LOGIC;
    z: IN STD_LOGIC;
    f: OUT STD_LOGIC);
END NOR3gate;

ARCHITECTURE Dataflow OF NOR3gate IS
    SIGNAL xory, xoryorz: STD_LOGIC;
BEGIN
   xory <= x OR y;  -- three concurrent signal assignments
   xoryorz <= xory OR z;
   f <= NOT xoryorz;
END Dataflow;

