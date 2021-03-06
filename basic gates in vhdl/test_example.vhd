-- File: my_sys.vhd
library ieee;
use ieee.std_logic_1164.all;
-- the ENTITY
entity circuit1 is
port(
    A, B, C : in std_logic;
    F       : out std_logic);
end circuit1;
-- the ARCHITECTURE
architecture circuit1_arc of circuit1 is
    signal sig_1: std_logic; -- signal defination
    variable var_1: integer; -- variable defination
begin
    F <= not (A and B and C); -- signal assignment
    sig_1 <= A; -- another signal assignment
    var_1 <= 34; -- variable assignment
end circuit1_arc;
