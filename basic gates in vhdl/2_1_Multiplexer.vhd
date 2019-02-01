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


------- NOT gate -----------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY notgate IS PORT(
    i: IN STD_LOGIC;
    o: OUT STD_LOGIC);
END ENTITY notgate;
ARCHITECTURE Dataflow OF notgate IS
BEGIN
   o <= NOT i;
END Dataflow;


---------2 -input AND gate --------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY and2gate IS PORT(
    i1, i2: IN STD_LOGIC;
    o: OUT STD_LOGIC);
ARCHITECTURE Dataflow OF and2gate IS
BEGIN
   o <= i1 AND i2;
END Dataflow;

------ 3-input AND gate -----------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY and3gate is PORT(
    i1, i2, i3: IN STD_LOGIC;
    o: OUT STD_LOGIC);
END ENTITY and3gate;

ARCHITECTURE Dataflow OF and3gate IS
BEGIN
    o <= ( i1 AND i2 AND i3);
END Dataflow;

-------- 2 -input OR gate ------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY or2gate IS PORT(
    i1, i2: IN STD_LOGIC;
    o: OUT STD_LOGIC);
END or2gate;
ARCHITECTURE Dataflow OF or2gate IS
BEGIN
    o <= i1 OR i2;
END Dataflow;


------------ 3-input OR gate -------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY or3gate IS PORT(
    i1, i2, i3: IN STD_LOGIC;
    o: OUT STD_LOGIC);
END or3gate;
ARCHITECTURE Dataflow OF or3gate IS
BEGIN
    o <= i1 OR i2 OR i3;
END Dataflow;


------------4 -input OR gate --------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY or4gate IS PORT(
   i1, i2, i3, i4: IN STD_LOGIC;
   o: OUT STD_LOGIC);
END or4gate;
ARCHITECTURE Dataflow OF or4gate IS
BEGIN
   o <= i1 OR i2 OR i3 OR i4;
END Dataflow;

-----------2 - input XOR gate --------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY xor2gate IS PORT(
    i1, i2: IN STD_LOGIC;
    o: OUT STD_LOGIC);
END xor2gate;
ARCHITECTURE Dataflow OF xor2gate IS
BEGIN
    o < i1 XOR i2;
END Dataflow;

------------- bcd entity --------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bcd IS PORT(
    i0, i1, i2, i3: IN STD_LOGIC;
    a, b, c,d,e,f,g: OUT STD_LOGIC);
END bcd;

ARCHITECTURE Structural OF bcd IS
    COMPONENT notgate PORT(
       i: IN STD_LOGIC;
       o: OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT and2gate PORT(
       i1, i2: IN STD_LOGIC;
       o: OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT and3gate PORT(
       i1, i2,i3: IN STD_LOGIC;
       o: OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT or3gate PORT(
       i1, i2, i3: IN STD_LOGIC;
       o: OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT or4gate PORT(
       i1, i2, i3, i4: IN STD_LOGIC;
       o: OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT xor2gate PORT(
       i1, i2: IN STD_LOGIC;
       o: OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT xnor2gate PORT(
        i1, i2: IN STD_LOGIC;
        o: OUT STD_LOGIC);
    END COMPONENT;
    
    SIGNAL ip0, ip1, ip2, a1, b1, d1, d2, d3, d4, e1, e2,f1,f2,f3,g1,g2: STD_LOGIC;
BEGIN
    UO: notgate PORT MAP(io, ip0);
    U1: notgate PORT MAP(i1, ip1);
    U2: notgate PORT MAP(i2, ip2);
    U3: xnor2gate PORT MAP(i2, i0, a1);
    U4: or3gate PORT MAP(i3, i1, a1,a);
    U5: xnor2gate PORT MAP(i1, i0, b1);
    U6: or2gate PORT MAP(ip2, b1,b);
    U7: or3gate PORT MAP(i2, ip1, i0,c);
    U8: and2gate PORT MAP(i1, ip0, d1);
    U9: and2gate PORT MAP(ip2, ip0, d2);
    U10: and2gate PORT MAP(ip2, i1, d3);
    U11: and3gate PORT MAP(i2, ip1, i0, d4);
    U12: or4gate PORT MAP(d1,d2,d3,d4,d);
    U13: and2gate PORT MAP(i1, ip0, e1);
    U14: and2gate PORT MAP(ip2, ip0, e2);
    U15: or2gate PORT MAP(e1, e2, e);
    U16: and2gate PORT MAP(i2, ip1, f1);
    U17: and2gate PORT MAP(i2, ip0, f2);
    U18: and2gate PORT MAP(ip1, ip0, f3);
    U19: or4gate PORT MAP(i3, f1,f2, f3, f);
    U20: xor2gate PORT MAP(i2, i1, g1);
    U21: and2gate PORT MAP(i1, ip0, g2);
    U22: or3gate PORT MAP(i3, g1, g2, g);
END Structural;