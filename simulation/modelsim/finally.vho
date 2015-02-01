-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "01/23/2015 22:21:35"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	finally IS
    PORT (
	G1 : IN std_logic;
	G2 : IN std_logic;
	B : IN std_logic;
	A : IN std_logic;
	Y0 : OUT std_logic;
	Y1 : OUT std_logic;
	Y2 : OUT std_logic;
	Y3 : OUT std_logic
	);
END finally;

ARCHITECTURE structure OF finally IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_G1 : std_logic;
SIGNAL ww_G2 : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_Y0 : std_logic;
SIGNAL ww_Y1 : std_logic;
SIGNAL ww_Y2 : std_logic;
SIGNAL ww_Y3 : std_logic;
SIGNAL \Y0~output_o\ : std_logic;
SIGNAL \Y1~output_o\ : std_logic;
SIGNAL \Y2~output_o\ : std_logic;
SIGNAL \Y3~output_o\ : std_logic;
SIGNAL \G1~input_o\ : std_logic;
SIGNAL \A~input_o\ : std_logic;
SIGNAL \B~input_o\ : std_logic;
SIGNAL \G2~input_o\ : std_logic;
SIGNAL \WideAnd0~0_combout\ : std_logic;
SIGNAL \WideAnd1~0_combout\ : std_logic;
SIGNAL \WideAnd2~0_combout\ : std_logic;
SIGNAL \WideAnd3~0_combout\ : std_logic;

BEGIN

ww_G1 <= G1;
ww_G2 <= G2;
ww_B <= B;
ww_A <= A;
Y0 <= ww_Y0;
Y1 <= ww_Y1;
Y2 <= ww_Y2;
Y3 <= ww_Y3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Y0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideAnd0~0_combout\,
	devoe => ww_devoe,
	o => \Y0~output_o\);

\Y1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideAnd1~0_combout\,
	devoe => ww_devoe,
	o => \Y1~output_o\);

\Y2~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideAnd2~0_combout\,
	devoe => ww_devoe,
	o => \Y2~output_o\);

\Y3~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideAnd3~0_combout\,
	devoe => ww_devoe,
	o => \Y3~output_o\);

\G1~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_G1,
	o => \G1~input_o\);

\A~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A,
	o => \A~input_o\);

\B~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B,
	o => \B~input_o\);

\G2~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_G2,
	o => \G2~input_o\);

\WideAnd0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideAnd0~0_combout\ = (\G1~input_o\ & (!\A~input_o\ & (!\B~input_o\ & !\G2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1~input_o\,
	datab => \A~input_o\,
	datac => \B~input_o\,
	datad => \G2~input_o\,
	combout => \WideAnd0~0_combout\);

\WideAnd1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideAnd1~0_combout\ = (\A~input_o\ & (\G1~input_o\ & (!\B~input_o\ & !\G2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~input_o\,
	datab => \G1~input_o\,
	datac => \B~input_o\,
	datad => \G2~input_o\,
	combout => \WideAnd1~0_combout\);

\WideAnd2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideAnd2~0_combout\ = (\B~input_o\ & (\G1~input_o\ & (!\A~input_o\ & !\G2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~input_o\,
	datab => \G1~input_o\,
	datac => \A~input_o\,
	datad => \G2~input_o\,
	combout => \WideAnd2~0_combout\);

\WideAnd3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideAnd3~0_combout\ = (\A~input_o\ & (\B~input_o\ & (\G1~input_o\ & !\G2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~input_o\,
	datab => \B~input_o\,
	datac => \G1~input_o\,
	datad => \G2~input_o\,
	combout => \WideAnd3~0_combout\);

ww_Y0 <= \Y0~output_o\;

ww_Y1 <= \Y1~output_o\;

ww_Y2 <= \Y2~output_o\;

ww_Y3 <= \Y3~output_o\;
END structure;


