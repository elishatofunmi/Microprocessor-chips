-- Not gate
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity notgate IS PORT(
i: IN STD_LOGIC;
o: OUT STD_LOGIC);
END notgate;

ARCHITECTURE Dataflow OF notgate IS
BEGIN
    o <= not(i);
END Dataflow;

-- 2-input AND gate ---------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY and2gate IS PORT(
   i1, i2: IN BIT;
   o: OUT BIT);
END and2gate;

ARCHITECTURE Dataflow OF and2gate IS
BEGIN
    o <= i1 AND i2;
END Dataflow;

------- 2-input OR gate ----
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY or2gate is PORT(
    i1, i2: IN STD_LOGIC;
    o: OUT STD_LOGIC);
END ENTITY or2gate;

ARCHITECTURE Dataflow of or2gate is
BEGIN
    o <= i1 or i2;
END Dataflow;

------ 2-to-1 multiplexer ----
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY multiplexer is port(
   d0,d1,s: IN STD_LOGIC;
   y: OUT STD_LOGIC);
END ENTITY multiplexer;

ARCHITECTURE Structural OF multiplexer IS
    COMPONENT notgate PORT(
    i: IN STD_LOGIC;
    o: OUT STD_LOGIC);
    END COMPONENT notgate;

    COMPONENT and2gate PORT(
    i1,i2: IN STD_LOGIC;
    o: OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT and3gate PORT(
    i1,i2,i3: IN STD_LOGIC;
    o: OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT or2gate PORT(
    i1, i2: IN STD_LOGIC;
    o: OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL sn, snd0, sd1: STD_LOGIC;

BEGIN
   U1: notgate PORT MAP(s,sn);
   U2: and2gate PORT MAP(d0,sn, snd0);
   U3: and2gate PORT MAP(d1, s, sd1);
   U4: or2gate PORT MAP(snd0, sd1, y);
end Structural;
