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

-- DATE "01/24/2015 11:33:30"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	my_first_fpga IS
    PORT (
	led : OUT std_logic_vector(3 DOWNTO 0);
	button : IN std_logic_vector(0 DOWNTO 0);
	osc_clk : IN std_logic
	);
END my_first_fpga;

-- Design Ports Information
-- led[3]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[2]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[1]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[0]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- osc_clk	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF my_first_fpga IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_led : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_button : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_osc_clk : std_logic;
SIGNAL \inst2|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst2|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \inst|counter_out[1]~26_combout\ : std_logic;
SIGNAL \inst|counter_out[3]~30_combout\ : std_logic;
SIGNAL \inst|counter_out[4]~32_combout\ : std_logic;
SIGNAL \inst|counter_out[9]~42_combout\ : std_logic;
SIGNAL \inst|counter_out[11]~46_combout\ : std_logic;
SIGNAL \inst|counter_out[13]~50_combout\ : std_logic;
SIGNAL \inst|counter_out[17]~58_combout\ : std_logic;
SIGNAL \inst|counter_out[19]~62_combout\ : std_logic;
SIGNAL \inst|counter_out[20]~64_combout\ : std_logic;
SIGNAL \osc_clk~input_o\ : std_logic;
SIGNAL \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \inst|counter_out[0]~78_combout\ : std_logic;
SIGNAL \inst|counter_out[1]~27\ : std_logic;
SIGNAL \inst|counter_out[2]~28_combout\ : std_logic;
SIGNAL \inst|counter_out[2]~29\ : std_logic;
SIGNAL \inst|counter_out[3]~31\ : std_logic;
SIGNAL \inst|counter_out[4]~33\ : std_logic;
SIGNAL \inst|counter_out[5]~34_combout\ : std_logic;
SIGNAL \inst|counter_out[5]~35\ : std_logic;
SIGNAL \inst|counter_out[6]~36_combout\ : std_logic;
SIGNAL \inst|counter_out[6]~37\ : std_logic;
SIGNAL \inst|counter_out[7]~38_combout\ : std_logic;
SIGNAL \inst|counter_out[7]~39\ : std_logic;
SIGNAL \inst|counter_out[8]~40_combout\ : std_logic;
SIGNAL \inst|counter_out[8]~41\ : std_logic;
SIGNAL \inst|counter_out[9]~43\ : std_logic;
SIGNAL \inst|counter_out[10]~44_combout\ : std_logic;
SIGNAL \inst|counter_out[10]~45\ : std_logic;
SIGNAL \inst|counter_out[11]~47\ : std_logic;
SIGNAL \inst|counter_out[12]~48_combout\ : std_logic;
SIGNAL \inst|counter_out[12]~49\ : std_logic;
SIGNAL \inst|counter_out[13]~51\ : std_logic;
SIGNAL \inst|counter_out[14]~52_combout\ : std_logic;
SIGNAL \inst|counter_out[14]~53\ : std_logic;
SIGNAL \inst|counter_out[15]~54_combout\ : std_logic;
SIGNAL \inst|counter_out[15]~55\ : std_logic;
SIGNAL \inst|counter_out[16]~56_combout\ : std_logic;
SIGNAL \inst|counter_out[16]~57\ : std_logic;
SIGNAL \inst|counter_out[17]~59\ : std_logic;
SIGNAL \inst|counter_out[18]~60_combout\ : std_logic;
SIGNAL \inst|counter_out[18]~61\ : std_logic;
SIGNAL \inst|counter_out[19]~63\ : std_logic;
SIGNAL \inst|counter_out[20]~65\ : std_logic;
SIGNAL \inst|counter_out[21]~66_combout\ : std_logic;
SIGNAL \inst|counter_out[21]~67\ : std_logic;
SIGNAL \inst|counter_out[22]~68_combout\ : std_logic;
SIGNAL \inst|counter_out[22]~69\ : std_logic;
SIGNAL \inst|counter_out[23]~70_combout\ : std_logic;
SIGNAL \inst|counter_out[23]~71\ : std_logic;
SIGNAL \inst|counter_out[24]~72_combout\ : std_logic;
SIGNAL \button[0]~input_o\ : std_logic;
SIGNAL \inst|counter_out[24]~73\ : std_logic;
SIGNAL \inst|counter_out[25]~75\ : std_logic;
SIGNAL \inst|counter_out[26]~76_combout\ : std_logic;
SIGNAL \inst3|LPM_MUX_component|auto_generated|result_node[3]~0_combout\ : std_logic;
SIGNAL \inst|counter_out[25]~74_combout\ : std_logic;
SIGNAL \inst3|LPM_MUX_component|auto_generated|result_node[2]~1_combout\ : std_logic;
SIGNAL \inst3|LPM_MUX_component|auto_generated|result_node[1]~2_combout\ : std_logic;
SIGNAL \inst3|LPM_MUX_component|auto_generated|result_node[0]~3_combout\ : std_logic;
SIGNAL \inst|counter_out\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst2|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);

BEGIN

led <= ww_led;
ww_button <= button;
ww_osc_clk <= osc_clk;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst2|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \osc_clk~input_o\);

\inst2|altpll_component|auto_generated|wire_pll1_clk\(0) <= \inst2|altpll_component|auto_generated|pll1_CLK_bus\(0);
\inst2|altpll_component|auto_generated|wire_pll1_clk\(1) <= \inst2|altpll_component|auto_generated|pll1_CLK_bus\(1);
\inst2|altpll_component|auto_generated|wire_pll1_clk\(2) <= \inst2|altpll_component|auto_generated|pll1_CLK_bus\(2);
\inst2|altpll_component|auto_generated|wire_pll1_clk\(3) <= \inst2|altpll_component|auto_generated|pll1_CLK_bus\(3);
\inst2|altpll_component|auto_generated|wire_pll1_clk\(4) <= \inst2|altpll_component|auto_generated|pll1_CLK_bus\(4);

\inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst2|altpll_component|auto_generated|wire_pll1_clk\(0));

-- Location: PLL_2
\inst2|altpll_component|auto_generated|pll1\ : cycloneiii_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 60,
	c0_initial => 1,
	c0_low => 60,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 10,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 5052,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \inst2|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \inst2|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \inst2|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \inst2|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: FF_X1_Y21_N13
\inst|counter_out[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[20]~64_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(20));

-- Location: FF_X1_Y21_N11
\inst|counter_out[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[19]~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(19));

-- Location: FF_X1_Y21_N7
\inst|counter_out[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[17]~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(17));

-- Location: FF_X1_Y22_N31
\inst|counter_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[13]~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(13));

-- Location: FF_X1_Y22_N27
\inst|counter_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[11]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(11));

-- Location: FF_X1_Y22_N23
\inst|counter_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[9]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(9));

-- Location: FF_X1_Y22_N13
\inst|counter_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[4]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(4));

-- Location: FF_X1_Y22_N11
\inst|counter_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[3]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(3));

-- Location: FF_X1_Y22_N7
\inst|counter_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[1]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(1));

-- Location: LCCOMB_X1_Y22_N6
\inst|counter_out[1]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[1]~26_combout\ = (\inst|counter_out\(1) & (\inst|counter_out\(0) $ (VCC))) # (!\inst|counter_out\(1) & (\inst|counter_out\(0) & VCC))
-- \inst|counter_out[1]~27\ = CARRY((\inst|counter_out\(1) & \inst|counter_out\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(1),
	datab => \inst|counter_out\(0),
	datad => VCC,
	combout => \inst|counter_out[1]~26_combout\,
	cout => \inst|counter_out[1]~27\);

-- Location: LCCOMB_X1_Y22_N10
\inst|counter_out[3]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[3]~30_combout\ = (\inst|counter_out\(3) & (\inst|counter_out[2]~29\ $ (GND))) # (!\inst|counter_out\(3) & (!\inst|counter_out[2]~29\ & VCC))
-- \inst|counter_out[3]~31\ = CARRY((\inst|counter_out\(3) & !\inst|counter_out[2]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(3),
	datad => VCC,
	cin => \inst|counter_out[2]~29\,
	combout => \inst|counter_out[3]~30_combout\,
	cout => \inst|counter_out[3]~31\);

-- Location: LCCOMB_X1_Y22_N12
\inst|counter_out[4]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[4]~32_combout\ = (\inst|counter_out\(4) & (!\inst|counter_out[3]~31\)) # (!\inst|counter_out\(4) & ((\inst|counter_out[3]~31\) # (GND)))
-- \inst|counter_out[4]~33\ = CARRY((!\inst|counter_out[3]~31\) # (!\inst|counter_out\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(4),
	datad => VCC,
	cin => \inst|counter_out[3]~31\,
	combout => \inst|counter_out[4]~32_combout\,
	cout => \inst|counter_out[4]~33\);

-- Location: LCCOMB_X1_Y22_N22
\inst|counter_out[9]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[9]~42_combout\ = (\inst|counter_out\(9) & (\inst|counter_out[8]~41\ $ (GND))) # (!\inst|counter_out\(9) & (!\inst|counter_out[8]~41\ & VCC))
-- \inst|counter_out[9]~43\ = CARRY((\inst|counter_out\(9) & !\inst|counter_out[8]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(9),
	datad => VCC,
	cin => \inst|counter_out[8]~41\,
	combout => \inst|counter_out[9]~42_combout\,
	cout => \inst|counter_out[9]~43\);

-- Location: LCCOMB_X1_Y22_N26
\inst|counter_out[11]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[11]~46_combout\ = (\inst|counter_out\(11) & (\inst|counter_out[10]~45\ $ (GND))) # (!\inst|counter_out\(11) & (!\inst|counter_out[10]~45\ & VCC))
-- \inst|counter_out[11]~47\ = CARRY((\inst|counter_out\(11) & !\inst|counter_out[10]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(11),
	datad => VCC,
	cin => \inst|counter_out[10]~45\,
	combout => \inst|counter_out[11]~46_combout\,
	cout => \inst|counter_out[11]~47\);

-- Location: LCCOMB_X1_Y22_N30
\inst|counter_out[13]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[13]~50_combout\ = (\inst|counter_out\(13) & (\inst|counter_out[12]~49\ $ (GND))) # (!\inst|counter_out\(13) & (!\inst|counter_out[12]~49\ & VCC))
-- \inst|counter_out[13]~51\ = CARRY((\inst|counter_out\(13) & !\inst|counter_out[12]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(13),
	datad => VCC,
	cin => \inst|counter_out[12]~49\,
	combout => \inst|counter_out[13]~50_combout\,
	cout => \inst|counter_out[13]~51\);

-- Location: LCCOMB_X1_Y21_N6
\inst|counter_out[17]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[17]~58_combout\ = (\inst|counter_out\(17) & (\inst|counter_out[16]~57\ $ (GND))) # (!\inst|counter_out\(17) & (!\inst|counter_out[16]~57\ & VCC))
-- \inst|counter_out[17]~59\ = CARRY((\inst|counter_out\(17) & !\inst|counter_out[16]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(17),
	datad => VCC,
	cin => \inst|counter_out[16]~57\,
	combout => \inst|counter_out[17]~58_combout\,
	cout => \inst|counter_out[17]~59\);

-- Location: LCCOMB_X1_Y21_N10
\inst|counter_out[19]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[19]~62_combout\ = (\inst|counter_out\(19) & (\inst|counter_out[18]~61\ $ (GND))) # (!\inst|counter_out\(19) & (!\inst|counter_out[18]~61\ & VCC))
-- \inst|counter_out[19]~63\ = CARRY((\inst|counter_out\(19) & !\inst|counter_out[18]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(19),
	datad => VCC,
	cin => \inst|counter_out[18]~61\,
	combout => \inst|counter_out[19]~62_combout\,
	cout => \inst|counter_out[19]~63\);

-- Location: LCCOMB_X1_Y21_N12
\inst|counter_out[20]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[20]~64_combout\ = (\inst|counter_out\(20) & (!\inst|counter_out[19]~63\)) # (!\inst|counter_out\(20) & ((\inst|counter_out[19]~63\) # (GND)))
-- \inst|counter_out[20]~65\ = CARRY((!\inst|counter_out[19]~63\) # (!\inst|counter_out\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(20),
	datad => VCC,
	cin => \inst|counter_out[19]~63\,
	combout => \inst|counter_out[20]~64_combout\,
	cout => \inst|counter_out[20]~65\);

-- Location: IOIBUF_X41_Y15_N1
\osc_clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_osc_clk,
	o => \osc_clk~input_o\);

-- Location: CLKCTRL_G8
\inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: IOOBUF_X0_Y21_N16
\led[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|LPM_MUX_component|auto_generated|result_node[3]~0_combout\,
	devoe => ww_devoe,
	o => ww_led(3));

-- Location: IOOBUF_X0_Y21_N23
\led[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|LPM_MUX_component|auto_generated|result_node[2]~1_combout\,
	devoe => ww_devoe,
	o => ww_led(2));

-- Location: IOOBUF_X0_Y20_N2
\led[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|LPM_MUX_component|auto_generated|result_node[1]~2_combout\,
	devoe => ww_devoe,
	o => ww_led(1));

-- Location: IOOBUF_X0_Y20_N9
\led[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|LPM_MUX_component|auto_generated|result_node[0]~3_combout\,
	devoe => ww_devoe,
	o => ww_led(0));

-- Location: LCCOMB_X1_Y22_N0
\inst|counter_out[0]~78\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[0]~78_combout\ = !\inst|counter_out\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|counter_out\(0),
	combout => \inst|counter_out[0]~78_combout\);

-- Location: FF_X1_Y22_N1
\inst|counter_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[0]~78_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(0));

-- Location: LCCOMB_X1_Y22_N8
\inst|counter_out[2]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[2]~28_combout\ = (\inst|counter_out\(2) & (!\inst|counter_out[1]~27\)) # (!\inst|counter_out\(2) & ((\inst|counter_out[1]~27\) # (GND)))
-- \inst|counter_out[2]~29\ = CARRY((!\inst|counter_out[1]~27\) # (!\inst|counter_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(2),
	datad => VCC,
	cin => \inst|counter_out[1]~27\,
	combout => \inst|counter_out[2]~28_combout\,
	cout => \inst|counter_out[2]~29\);

-- Location: FF_X1_Y22_N9
\inst|counter_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[2]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(2));

-- Location: LCCOMB_X1_Y22_N14
\inst|counter_out[5]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[5]~34_combout\ = (\inst|counter_out\(5) & (\inst|counter_out[4]~33\ $ (GND))) # (!\inst|counter_out\(5) & (!\inst|counter_out[4]~33\ & VCC))
-- \inst|counter_out[5]~35\ = CARRY((\inst|counter_out\(5) & !\inst|counter_out[4]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(5),
	datad => VCC,
	cin => \inst|counter_out[4]~33\,
	combout => \inst|counter_out[5]~34_combout\,
	cout => \inst|counter_out[5]~35\);

-- Location: FF_X1_Y22_N15
\inst|counter_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[5]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(5));

-- Location: LCCOMB_X1_Y22_N16
\inst|counter_out[6]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[6]~36_combout\ = (\inst|counter_out\(6) & (!\inst|counter_out[5]~35\)) # (!\inst|counter_out\(6) & ((\inst|counter_out[5]~35\) # (GND)))
-- \inst|counter_out[6]~37\ = CARRY((!\inst|counter_out[5]~35\) # (!\inst|counter_out\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(6),
	datad => VCC,
	cin => \inst|counter_out[5]~35\,
	combout => \inst|counter_out[6]~36_combout\,
	cout => \inst|counter_out[6]~37\);

-- Location: FF_X1_Y22_N17
\inst|counter_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[6]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(6));

-- Location: LCCOMB_X1_Y22_N18
\inst|counter_out[7]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[7]~38_combout\ = (\inst|counter_out\(7) & (\inst|counter_out[6]~37\ $ (GND))) # (!\inst|counter_out\(7) & (!\inst|counter_out[6]~37\ & VCC))
-- \inst|counter_out[7]~39\ = CARRY((\inst|counter_out\(7) & !\inst|counter_out[6]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(7),
	datad => VCC,
	cin => \inst|counter_out[6]~37\,
	combout => \inst|counter_out[7]~38_combout\,
	cout => \inst|counter_out[7]~39\);

-- Location: FF_X1_Y22_N19
\inst|counter_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[7]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(7));

-- Location: LCCOMB_X1_Y22_N20
\inst|counter_out[8]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[8]~40_combout\ = (\inst|counter_out\(8) & (!\inst|counter_out[7]~39\)) # (!\inst|counter_out\(8) & ((\inst|counter_out[7]~39\) # (GND)))
-- \inst|counter_out[8]~41\ = CARRY((!\inst|counter_out[7]~39\) # (!\inst|counter_out\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(8),
	datad => VCC,
	cin => \inst|counter_out[7]~39\,
	combout => \inst|counter_out[8]~40_combout\,
	cout => \inst|counter_out[8]~41\);

-- Location: FF_X1_Y22_N21
\inst|counter_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[8]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(8));

-- Location: LCCOMB_X1_Y22_N24
\inst|counter_out[10]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[10]~44_combout\ = (\inst|counter_out\(10) & (!\inst|counter_out[9]~43\)) # (!\inst|counter_out\(10) & ((\inst|counter_out[9]~43\) # (GND)))
-- \inst|counter_out[10]~45\ = CARRY((!\inst|counter_out[9]~43\) # (!\inst|counter_out\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(10),
	datad => VCC,
	cin => \inst|counter_out[9]~43\,
	combout => \inst|counter_out[10]~44_combout\,
	cout => \inst|counter_out[10]~45\);

-- Location: FF_X1_Y22_N25
\inst|counter_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[10]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(10));

-- Location: LCCOMB_X1_Y22_N28
\inst|counter_out[12]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[12]~48_combout\ = (\inst|counter_out\(12) & (!\inst|counter_out[11]~47\)) # (!\inst|counter_out\(12) & ((\inst|counter_out[11]~47\) # (GND)))
-- \inst|counter_out[12]~49\ = CARRY((!\inst|counter_out[11]~47\) # (!\inst|counter_out\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(12),
	datad => VCC,
	cin => \inst|counter_out[11]~47\,
	combout => \inst|counter_out[12]~48_combout\,
	cout => \inst|counter_out[12]~49\);

-- Location: FF_X1_Y22_N29
\inst|counter_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[12]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(12));

-- Location: LCCOMB_X1_Y21_N0
\inst|counter_out[14]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[14]~52_combout\ = (\inst|counter_out\(14) & (!\inst|counter_out[13]~51\)) # (!\inst|counter_out\(14) & ((\inst|counter_out[13]~51\) # (GND)))
-- \inst|counter_out[14]~53\ = CARRY((!\inst|counter_out[13]~51\) # (!\inst|counter_out\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(14),
	datad => VCC,
	cin => \inst|counter_out[13]~51\,
	combout => \inst|counter_out[14]~52_combout\,
	cout => \inst|counter_out[14]~53\);

-- Location: FF_X1_Y21_N1
\inst|counter_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[14]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(14));

-- Location: LCCOMB_X1_Y21_N2
\inst|counter_out[15]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[15]~54_combout\ = (\inst|counter_out\(15) & (\inst|counter_out[14]~53\ $ (GND))) # (!\inst|counter_out\(15) & (!\inst|counter_out[14]~53\ & VCC))
-- \inst|counter_out[15]~55\ = CARRY((\inst|counter_out\(15) & !\inst|counter_out[14]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(15),
	datad => VCC,
	cin => \inst|counter_out[14]~53\,
	combout => \inst|counter_out[15]~54_combout\,
	cout => \inst|counter_out[15]~55\);

-- Location: FF_X1_Y21_N3
\inst|counter_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[15]~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(15));

-- Location: LCCOMB_X1_Y21_N4
\inst|counter_out[16]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[16]~56_combout\ = (\inst|counter_out\(16) & (!\inst|counter_out[15]~55\)) # (!\inst|counter_out\(16) & ((\inst|counter_out[15]~55\) # (GND)))
-- \inst|counter_out[16]~57\ = CARRY((!\inst|counter_out[15]~55\) # (!\inst|counter_out\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(16),
	datad => VCC,
	cin => \inst|counter_out[15]~55\,
	combout => \inst|counter_out[16]~56_combout\,
	cout => \inst|counter_out[16]~57\);

-- Location: FF_X1_Y21_N5
\inst|counter_out[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[16]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(16));

-- Location: LCCOMB_X1_Y21_N8
\inst|counter_out[18]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[18]~60_combout\ = (\inst|counter_out\(18) & (!\inst|counter_out[17]~59\)) # (!\inst|counter_out\(18) & ((\inst|counter_out[17]~59\) # (GND)))
-- \inst|counter_out[18]~61\ = CARRY((!\inst|counter_out[17]~59\) # (!\inst|counter_out\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(18),
	datad => VCC,
	cin => \inst|counter_out[17]~59\,
	combout => \inst|counter_out[18]~60_combout\,
	cout => \inst|counter_out[18]~61\);

-- Location: FF_X1_Y21_N9
\inst|counter_out[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[18]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(18));

-- Location: LCCOMB_X1_Y21_N14
\inst|counter_out[21]~66\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[21]~66_combout\ = (\inst|counter_out\(21) & (\inst|counter_out[20]~65\ $ (GND))) # (!\inst|counter_out\(21) & (!\inst|counter_out[20]~65\ & VCC))
-- \inst|counter_out[21]~67\ = CARRY((\inst|counter_out\(21) & !\inst|counter_out[20]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(21),
	datad => VCC,
	cin => \inst|counter_out[20]~65\,
	combout => \inst|counter_out[21]~66_combout\,
	cout => \inst|counter_out[21]~67\);

-- Location: FF_X1_Y21_N15
\inst|counter_out[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[21]~66_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(21));

-- Location: LCCOMB_X1_Y21_N16
\inst|counter_out[22]~68\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[22]~68_combout\ = (\inst|counter_out\(22) & (!\inst|counter_out[21]~67\)) # (!\inst|counter_out\(22) & ((\inst|counter_out[21]~67\) # (GND)))
-- \inst|counter_out[22]~69\ = CARRY((!\inst|counter_out[21]~67\) # (!\inst|counter_out\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(22),
	datad => VCC,
	cin => \inst|counter_out[21]~67\,
	combout => \inst|counter_out[22]~68_combout\,
	cout => \inst|counter_out[22]~69\);

-- Location: FF_X1_Y21_N17
\inst|counter_out[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[22]~68_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(22));

-- Location: LCCOMB_X1_Y21_N18
\inst|counter_out[23]~70\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[23]~70_combout\ = (\inst|counter_out\(23) & (\inst|counter_out[22]~69\ $ (GND))) # (!\inst|counter_out\(23) & (!\inst|counter_out[22]~69\ & VCC))
-- \inst|counter_out[23]~71\ = CARRY((\inst|counter_out\(23) & !\inst|counter_out[22]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(23),
	datad => VCC,
	cin => \inst|counter_out[22]~69\,
	combout => \inst|counter_out[23]~70_combout\,
	cout => \inst|counter_out[23]~71\);

-- Location: FF_X1_Y21_N19
\inst|counter_out[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[23]~70_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(23));

-- Location: LCCOMB_X1_Y21_N20
\inst|counter_out[24]~72\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[24]~72_combout\ = (\inst|counter_out\(24) & (!\inst|counter_out[23]~71\)) # (!\inst|counter_out\(24) & ((\inst|counter_out[23]~71\) # (GND)))
-- \inst|counter_out[24]~73\ = CARRY((!\inst|counter_out[23]~71\) # (!\inst|counter_out\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(24),
	datad => VCC,
	cin => \inst|counter_out[23]~71\,
	combout => \inst|counter_out[24]~72_combout\,
	cout => \inst|counter_out[24]~73\);

-- Location: FF_X1_Y21_N21
\inst|counter_out[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[24]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(24));

-- Location: IOIBUF_X0_Y21_N8
\button[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(0),
	o => \button[0]~input_o\);

-- Location: LCCOMB_X1_Y21_N22
\inst|counter_out[25]~74\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[25]~74_combout\ = (\inst|counter_out\(25) & (\inst|counter_out[24]~73\ $ (GND))) # (!\inst|counter_out\(25) & (!\inst|counter_out[24]~73\ & VCC))
-- \inst|counter_out[25]~75\ = CARRY((\inst|counter_out\(25) & !\inst|counter_out[24]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|counter_out\(25),
	datad => VCC,
	cin => \inst|counter_out[24]~73\,
	combout => \inst|counter_out[25]~74_combout\,
	cout => \inst|counter_out[25]~75\);

-- Location: LCCOMB_X1_Y21_N24
\inst|counter_out[26]~76\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|counter_out[26]~76_combout\ = \inst|counter_out[25]~75\ $ (\inst|counter_out\(26))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|counter_out\(26),
	cin => \inst|counter_out[25]~75\,
	combout => \inst|counter_out[26]~76_combout\);

-- Location: FF_X1_Y21_N25
\inst|counter_out[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[26]~76_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(26));

-- Location: LCCOMB_X1_Y21_N26
\inst3|LPM_MUX_component|auto_generated|result_node[3]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst3|LPM_MUX_component|auto_generated|result_node[3]~0_combout\ = (\button[0]~input_o\ & ((\inst|counter_out\(26)))) # (!\button[0]~input_o\ & (\inst|counter_out\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(24),
	datac => \button[0]~input_o\,
	datad => \inst|counter_out\(26),
	combout => \inst3|LPM_MUX_component|auto_generated|result_node[3]~0_combout\);

-- Location: FF_X1_Y21_N23
\inst|counter_out[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|counter_out[25]~74_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(25));

-- Location: LCCOMB_X1_Y21_N28
\inst3|LPM_MUX_component|auto_generated|result_node[2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst3|LPM_MUX_component|auto_generated|result_node[2]~1_combout\ = (\button[0]~input_o\ & (\inst|counter_out\(25))) # (!\button[0]~input_o\ & ((\inst|counter_out\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \button[0]~input_o\,
	datac => \inst|counter_out\(25),
	datad => \inst|counter_out\(23),
	combout => \inst3|LPM_MUX_component|auto_generated|result_node[2]~1_combout\);

-- Location: LCCOMB_X1_Y21_N30
\inst3|LPM_MUX_component|auto_generated|result_node[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst3|LPM_MUX_component|auto_generated|result_node[1]~2_combout\ = (\button[0]~input_o\ & ((\inst|counter_out\(24)))) # (!\button[0]~input_o\ & (\inst|counter_out\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|counter_out\(22),
	datac => \button[0]~input_o\,
	datad => \inst|counter_out\(24),
	combout => \inst3|LPM_MUX_component|auto_generated|result_node[1]~2_combout\);

-- Location: LCCOMB_X1_Y23_N24
\inst3|LPM_MUX_component|auto_generated|result_node[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst3|LPM_MUX_component|auto_generated|result_node[0]~3_combout\ = (\button[0]~input_o\ & (\inst|counter_out\(23))) # (!\button[0]~input_o\ & ((\inst|counter_out\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \button[0]~input_o\,
	datac => \inst|counter_out\(23),
	datad => \inst|counter_out\(21),
	combout => \inst3|LPM_MUX_component|auto_generated|result_node[0]~3_combout\);
END structure;


