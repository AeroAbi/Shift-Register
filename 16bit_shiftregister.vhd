library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 16bit_shift_register is
    Port  (clk        : in std_logic;
           S_in        : in std_logic;
           load        : in std_logic;
           E        : in std_logic_ vector(15 downto 0); -- vector for 16bits (MSB on the left)
           S_out    : out std_logic;  -- LSB on the left
end 16bit_shift_register;

architecture behavioral of 16bit_shift_register is

component 8bit_shift_register is
    Port  (clk        : in std_logic;
           S_in        : in std_logic;
           load        : in std_logic;
           E        : in std_logic_ vector(7 downto 0); -- vector for 8bits (MSB on the left)
           S_out    : out std_logic;  -- LSB on the left
end component;

signal S_int        : std_logic;
signal MEM            : std_logic_vector(15 downto 0); -- define internal signal to store E

begin

LSB_Shift: 8bit_shift_register

Port map  (clk        => clk,
           S_in        => S_in,
           load        => load,
           E        => E(7 downto 0), -- vector for 8bits (MSB on the left)
           S_out    => S_in);  -- LSB on the left
          
          
MSB_Shift: 8bit_shift_register

Port map  (clk        => clk,
           S_in        => S_in,
           load        => load,
           E        => E(15 downto 0), -- vector for 16bits (MSB on the left)
           S_out    => S_out);  -- LSB on the left

    
    S_out = MEM(7);
         
end behavioral;