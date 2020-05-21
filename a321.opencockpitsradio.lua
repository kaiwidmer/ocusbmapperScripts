--[[
*****************************************************************************************
* 	Author Name			:	Widmer Kai
*
*   Revisions:
*   -- DATE --	--- REV NO ---		--- DESCRIPTION ---
*   
*
*
*
*
*****************************************************************************************
--]]



--*************************************************************************************--
--** 					              XLUA GLOBALS              				     **--
--*************************************************************************************--

local execute_switch = 1

--*************************************************************************************--
--** 				              FIND CUSTOM DATAREFS             			    	 **--
--*************************************************************************************--

-- ocusbmapper

arm_adf_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/adf")
arm_bfo_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/bfo")
arm_ils_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/vor")
arm_vor_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/ils")
arm_nav_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/nav")
arm_vhf2_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/vhf2")
arm_vhf1_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/vhf1")
arm_small_button = find_dataref("pikitanga/ocusbmapper/arm/input/encoder/small")
arm_large_button = find_dataref("pikitanga/ocusbmapper/arm/input/encoder/large")
arm_power_button = find_dataref("pikitanga/ocusbmapper/arm/input/switch")
arm_switch_frq_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/tfr")
arm_bfo_button = find_dataref("pikitanga/ocusbmapper/arm/input/button/bfo")

arm_led_adf = find_dataref("pikitanga/ocusbmapper/arm/output/led/adf")
arm_led_bfo = find_dataref("pikitanga/ocusbmapper/arm/output/led/bfo")
arm_led_vor = find_dataref("pikitanga/ocusbmapper/arm/output/led/ils")
arm_led_nav = find_dataref("pikitanga/ocusbmapper/arm/output/led/nav")
arm_led_sel = find_dataref("pikitanga/ocusbmapper/arm/output/led/sel")
arm_led_vhf1 = find_dataref("pikitanga/ocusbmapper/arm/output/led/vhf1")
arm_led_vhf2 = find_dataref("pikitanga/ocusbmapper/arm/output/led/vhf2")
arm_led_ils = find_dataref("pikitanga/ocusbmapper/arm/output/led/vor")

arm_frq_active_display = find_dataref("pikitanga/ocusbmapper/arm0/output/dspl/active")
arm_frq_stby_display = find_dataref("pikitanga/ocusbmapper/arm0/output/dspl/standby")
arm_display_brightness = find_dataref("pikitanga/ocusbmapper/arm/output/dspl/brightness")
arm_display_decimal = find_dataref("pikitanga/ocusbmapper/arm/output/dspl/decimal")

-- aircraft
a321_frq_dwn_lrg_cmd = find_command("AirbusFBW/RMP1FreqDownLrg")
a321_frq_up_lrg_cmd = find_command("AirbusFBW/RMP1FreqUpLrg")
a321_frq_dwn_sml_cmd = find_command("AirbusFBW/RMP1FreqDownSml")
a321_frq_up_sml_cmd = find_command("AirbusFBW/RMP1FreqUpSml")
a321_swp_frq_cmd = find_command("AirbusFBW/RMPSwapCapt")

a321_vhf1_cmd = find_command("AirbusFBW/VHF1Capt")
a321_vhf2_cmd = find_command("AirbusFBW/VHF2Capt")

a321_pwr_1 = find_dataref("AirbusFBW/RMP1Switch")
a321_pwr_2 = find_dataref("AirbusFBW/RMP2Switch")
a321_pwr_3 = find_dataref("AirbusFBW/RMP3Switch")

a321_sby_frq = find_dataref("sim/cockpit2/radios/actuators/com1_standby_frequency_hz_833")
a321_act_frq_1 = find_dataref("sim/cockpit2/radios/actuators/com1_frequency_hz_833")
a321_act_frq_2 = find_dataref("sim/cockpit2/radios/actuators/com2_frequency_hz_833")
a321_act_frq_type = find_dataref("AirbusFBW/RMP1SelFunc")


--*************************************************************************************--
--** 				                 SYSTEM FUNCTIONS           	    			 **--
--*************************************************************************************--

function processArmInput()

	if arm_power_button[0] ~= 1 then
		if arm_display_decimal[0] == 0 then
			return
		end
		for i = 0,6,1 do
		  arm_frq_active_display[i] = 10
		  arm_frq_stby_display[i] = 10
		end
		arm_display_decimal[0] = 0
		arm_led_adf[0] = 0
		arm_led_bfo[0] = 0
		arm_led_vor[0] = 0
		arm_led_nav[0] = 0
		arm_led_sel[0] = 0
		arm_led_vhf1[0] = 0
		arm_led_vhf2[0] = 0
		arm_led_ils[0] = 0
		a321_pwr_1 = 0
		a321_pwr_2 = 0
		a321_pwr_3 = 0
		return
	else 
		arm_display_decimal[0] = 10
		a321_pwr_1 = 1
		a321_pwr_2 = 1
		a321_pwr_3 = 1
	end
	

	if arm_small_button[0] == 1 then
		a321_frq_up_sml_cmd:once()
	elseif arm_small_button[0] == -1 then
		a321_frq_dwn_sml_cmd:once()
	elseif arm_large_button[0] == 1 then
		a321_frq_up_lrg_cmd:once()
	elseif arm_large_button[0] == -1 then 
		a321_frq_dwn_lrg_cmd:once()
	elseif arm_switch_frq_button[0] == 1 then
		if execute_switch == 1 then
			a321_swp_frq_cmd:once()
			execute_switch = 0
		end
	elseif arm_vhf1_button[0] == 1 then
		if execute_switch == 1 then
			a321_vhf1_cmd:once()
			execute_switch = 0
		end
	elseif arm_vhf2_button[0] == 1 then
		if execute_switch == 1 then
			a321_vhf2_cmd:once()
			execute_switch = 0
		end
	else
		execute_switch = 1
	end

	set_acutal_state()
end

function set_acutal_state()
	set_frq_array(a321_sby_frq, arm_frq_stby_display)
	if a321_act_frq_type == 0 then
		set_frq_array(a321_act_frq_1, arm_frq_active_display)
		arm_led_vhf1[0] = 1
		arm_led_vhf2[0] = 0
	else
		set_frq_array(a321_act_frq_2, arm_frq_active_display)
		arm_led_vhf1[0] = 0
		arm_led_vhf2[0] = 1
	end
end

function set_frq_array(frq_number, frq_array)
	frq_array[5] = math.floor(frq_number / 100000)
	frq_array[4] = math.floor(frq_number % 100000 / 10000)
	frq_array[3] = math.floor(frq_number % 10000 / 1000)
	frq_array[2] = math.floor(frq_number % 1000 / 100)
	frq_array[1] = math.floor(frq_number % 100 / 10)
	frq_array[0] = math.floor(frq_number % 10)
end

--*************************************************************************************--
--** 				               XLUA EVENT CALLBACKS       	        			 **--
--*************************************************************************************--

--function aircraft_load() end

--function aircraft_unload() end

--function flight_start()

--end

--function flight_crash() end

function before_physics()
	processArmInput()
end

--function after_physics()

--end

--function after_replay() end




--*************************************************************************************--
--** 				               SUB-MODULE PROCESSING       	        			 **--
--*************************************************************************************--

-- dofile("")