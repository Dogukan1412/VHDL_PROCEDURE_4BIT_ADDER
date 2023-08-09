
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity toplayici is
    Port ( 
           i_elde : in STD_LOGIC;
           i_giris1 : in STD_LOGIC_VECTOR (3 downto 0);
           i_giris2 : in STD_LOGIC_VECTOR (3 downto 0);
           o_elde : out STD_LOGIC;
           o_toplam : out STD_LOGIC_VECTOR (3 downto 0)
          );
end toplayici;

architecture Behavioral of toplayici is

procedure toplayici_4bit(
    i_elde : in STD_LOGIC;
    i_giris1 : in STD_LOGIC_VECTOR (3 downto 0);
    i_giri2 : in STD_LOGIC_VECTOR (3 downto 0);
    o_elde : out STD_LOGIC;
    o_toplam : out STD_LOGIC_VECTOR (3 downto 0)) is 
    
    variable v_elde : std_logic_vector(4 downto 0);
    begin
        v_elde(0) := i_elde;
        for_loop : for k in 0 to 3 loop
        o_toplam(k) := i_giris1(k) xor i_giris2(k) xor v_elde(k);
        v_elde(k+1) := (i_giris1(k) and i_giris2(k)) or (i_giris1(k) and v_elde(k)) or (i_giris2(k) and v_elde(k));
        end loop;
    o_elde := v_elde(4);
end toplayici_4bit;

begin
    process(i_elde, i_giris1, i_giris2)
        variable v_o_toplam : std_logic_vector(3 downto 0);
        variable v_o_elde : std_logic;
    begin
        toplayici_4bit(i_elde, i_giris1, i_giris2, v_o_elde, v_o_toplam);
        o_elde <= v_o_elde;
        o_toplam <= v_o_toplam;
    end process;
end Behavioral;
