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
local bfo_pressed = 0

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
jdA330_com1_frq = find_dataref("sim/cockpit2/radios/actuators/com1_frequency_hz_833")
jdA330_com1_stby_frq = find_dataref("sim/cockpit2/radios/actuators/com1_standby_frequency_hz_833")

jdA330_com2_frq = find_dataref("sim/cockpit2/radios/actuators/com2_frequency_hz_833")
jdA330_com2_stby_frq = find_dataref("sim/cockpit2/radios/actuators/com2_standby_frequency_hz_833")

jdA330_com_mode = find_dataref("sim/custom/xap/radio/rmp_mode_drf")

jdA330_com_on = find_dataref("sim/custom/xap/radio/on")

jdA330_audio_bar_mech = find_dataref("sim/custom/xap/acp/tran_key/int")
jdA330_audio_bar_cabine = find_dataref("sim/custom/xap/acp/tran_key/cab")
jdA330_audio_bar = find_dataref("sim/custom/xap/acp/tran_key/now")


--*************************************************************************************--
--** 				                 SYSTEM FUNCTIONS           	    			 **--
--*************************************************************************************--

function processArmInput()
	if jdA330_audio_bar_mech ~= 0 or jdA330_audio_bar_cabine ~= 0 then
		arm_led_sel[0] = 1
	else
		arm_led_sel[0] = 0
	end
	
	if arm_bfo_button[0] == 1 and bfo_pressed == 0 then
		bfo_pressed = 1
		if jdA330_audio_bar == 0 then
			jdA330_audio_bar = 6
		elseif jdA330_audio_bar == 6 then
			jdA330_audio_bar = 5
		else 
			jdA330_audio_bar = 0
		end
	elseif arm_bfo_button[0] == 0 and bfo_pressed == 1 then
		bfo_pressed = 0
	end

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
		jdA330_com_on = 0
		return
	elseif arm_display_decimal[0] == 0 then
		change_to_vhf1()
		jdA330_com_on = 1
		arm_display_decimal[0] = 10
	end
	

	if arm_small_button[0] == 1 then
		plusSmallFreq()
	elseif arm_small_button[0] == -1 then
		minusSmallFreq()
	elseif arm_large_button[0] == 1 then
		plusBigFreq()
	elseif arm_large_button[0] == -1 then 
		minusBigFreq()
	elseif arm_switch_frq_button[0] == 1 then
		if execute_switch == 1 then
			switch_displayed_frq()
			execute_switch = 0
		end
	elseif arm_vhf1_button[0] == 1 then
		if execute_switch == 1 then
			change_to_vhf1()
			execute_switch = 0
		end
		return
	elseif arm_vhf2_button[0] == 1 then
		if execute_switch == 1 then
			change_to_vhf2()
			execute_switch = 0
		end
		return
	else
		execute_switch = 1
		return
	end
	
	if jdA330_com_mode == 1 then
		jdA330_com1_stby_frq = tonumber(get_frq_number(arm_frq_stby_display))
		jdA330_com1_frq = tonumber(get_frq_number(arm_frq_active_display))
	elseif jdA330_com_mode == 2 then
		jdA330_com2_stby_frq = tonumber(get_frq_number(arm_frq_stby_display))
		jdA330_com2_frq = tonumber(get_frq_number(arm_frq_active_display))
	end
end

function change_to_vhf1()
	set_frq_array(jdA330_com1_frq, arm_frq_active_display)
	set_frq_array(jdA330_com1_stby_frq, arm_frq_stby_display)
	jdA330_com_mode = 1
	arm_led_vhf1[0] = 1
	arm_led_vhf2[0] = 0
end

function change_to_vhf2()
	set_frq_array(jdA330_com2_frq, arm_frq_active_display)
	set_frq_array(jdA330_com2_stby_frq, arm_frq_stby_display)
	jdA330_com_mode = 2
	arm_led_vhf1[0] = 0
	arm_led_vhf2[0] = 1
end

function set_frq_array(frq_number, frq_array)
	frq_array[5] = math.floor(frq_number / 100000)
	frq_array[4] = math.floor(frq_number % 100000 / 10000)
	frq_array[3] = math.floor(frq_number % 10000 / 1000)
	frq_array[2] = math.floor(frq_number % 1000 / 100)
	frq_array[1] = math.floor(frq_number % 100 / 10)
	frq_array[0] = math.floor(frq_number % 10)
end

function get_frq_number(displayed_frq)
	frq = ""
	for i = 5,0,-1 do
		frq = frq .. displayed_frq[i]
	end
	return frq
end

function switch_displayed_frq()
	new_stby_frq = {}
	for i = 0,6,1 do
		new_stby_frq[i] = arm_frq_active_display[i]
	end
	for i = 0,6,1 do
		arm_frq_active_display[i] = arm_frq_stby_display[i]
	end
	for i = 0,6,1 do
		arm_frq_stby_display[i] = new_stby_frq[i]
	end
end


function plusSmallFreq()
	if arm_frq_stby_display[0] == 5 then
		arm_frq_stby_display[0] = 0
	else
		arm_frq_stby_display[0] = arm_frq_stby_display[0] + 5
		return
	end
	
	if arm_frq_stby_display[1] == 9 then
		arm_frq_stby_display[1] = 0
	else
		arm_frq_stby_display[1] = arm_frq_stby_display[1] + 1
		return
	end
	
	if arm_frq_stby_display[2] == 9 then
		arm_frq_stby_display[2] = 0
	else
		arm_frq_stby_display[2] = arm_frq_stby_display[2] + 1
		return
	end
end

function minusSmallFreq() 
	if arm_frq_stby_display[0] == 0 then
		arm_frq_stby_display[0] = 5
	else
		arm_frq_stby_display[0] = arm_frq_stby_display[0] - 5
		return
	end
	
	if arm_frq_stby_display[1] == 0 then
		arm_frq_stby_display[1] = 9
	else
		arm_frq_stby_display[1] = arm_frq_stby_display[1] - 1
		return
	end
	
	if arm_frq_stby_display[2] == 0 then
		arm_frq_stby_display[2] = 9
	else
		arm_frq_stby_display[2] = arm_frq_stby_display[2] - 1
		return
	end
end

function plusBigFreq()
	if arm_frq_stby_display[4] == 3 then
		if arm_frq_stby_display[3] == 7 then
			return
		else 
			arm_frq_stby_display[3] = arm_frq_stby_display[3] + 1
			return
		end
	elseif arm_frq_stby_display[3] == 9 then
		arm_frq_stby_display[3] = 0
	else
		arm_frq_stby_display[3] = arm_frq_stby_display[3] + 1
		return
	end
	
	if arm_frq_stby_display[4] ~= 3 then
		arm_frq_stby_display[4] = arm_frq_stby_display[4] + 1
	end
end

function minusBigFreq()
	if arm_frq_stby_display[4] == 1 then
		if arm_frq_stby_display[3] == 8 then
			return
		else 
			arm_frq_stby_display[3] = arm_frq_stby_display[3] - 1
			return
		end
	elseif arm_frq_stby_display[3] == 0 then
		arm_frq_stby_display[3] = 9
	else
		arm_frq_stby_display[3] = arm_frq_stby_display[3] - 1
		return
	end
	
	if arm_frq_stby_display[4] ~= 1 then
		arm_frq_stby_display[4] = arm_frq_stby_display[4] - 1
	end
end

--*************************************************************************************--
--** 				               XLUA EVENT CALLBACKS       	        			 **--
--*************************************************************************************--

function aircraft_load()
	change_to_vhf1()
end

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