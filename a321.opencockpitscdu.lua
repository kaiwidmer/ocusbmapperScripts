--[[
*****************************************************************************************
* Program Script Name	:	a321.opencockpitscdu
*
* Author Name			:	Widmer 1.0.0
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


--*************************************************************************************--
--** 				              FIND CUSTOM DATAREFS             			    	 **--
--*************************************************************************************--

-- buttons

cduDR_button = find_dataref("pikitanga/ocusbmapper/cdu/input/button")

cduDR_ledfm1 = find_dataref("pikitanga/ocusbmapper/cdu/output/led/fail")

a321_l1 = find_command("AirbusFBW/MCDU1LSK1L")
a321_l2 = find_command("AirbusFBW/MCDU1LSK2L")
a321_l3 = find_command("AirbusFBW/MCDU1LSK3L")
a321_l4 = find_command("AirbusFBW/MCDU1LSK4L")
a321_l5 = find_command("AirbusFBW/MCDU1LSK5L")
a321_l6 = find_command("AirbusFBW/MCDU1LSK6L")
a321_r1 = find_command("AirbusFBW/MCDU1LSK1R")
a321_r2 = find_command("AirbusFBW/MCDU1LSK2R")
a321_r3 = find_command("AirbusFBW/MCDU1LSK3R")
a321_r4 = find_command("AirbusFBW/MCDU1LSK4R")
a321_r5 = find_command("AirbusFBW/MCDU1LSK5R")
a321_r6 = find_command("AirbusFBW/MCDU1LSK6R")

a321_dir = find_command("AirbusFBW/MCDU1DirTo")
a321_prog = find_command("AirbusFBW/MCDU1Prog")
a321_perf = find_command("AirbusFBW/MCDU1Perf")
a321_init = find_command("AirbusFBW/MCDU1Init")
a321_data = find_command("AirbusFBW/MCDU1Data")

a321_fpln = find_command("AirbusFBW/MCDU1Fpln")
a321_radnav = find_command("AirbusFBW/MCDU1RadNav")
a321_fuel = find_command("AirbusFBW/MCDU1FuelPred")
a321_sec = find_command("AirbusFBW/MCDU1SecFpln")
a321_atc = find_command("AirbusFBW/MCDU1ATC")
a321_mcdumenu = find_command("AirbusFBW/MCDU1Menu")
a321_airp = find_command("AirbusFBW/MCDU1Airport")

a321_left = find_command("AirbusFBW/MCDU1SlewLeft")
a321_right = find_command("AirbusFBW/MCDU1SlewRight")
a321_up = find_command("AirbusFBW/MCDU1SlewUp")
a321_dn = find_command("AirbusFBW/MCDU1SlewDown")

a321_1 = find_command("AirbusFBW/MCDU1Key1")
a321_2 = find_command("AirbusFBW/MCDU1Key2")
a321_3 = find_command("AirbusFBW/MCDU1Key3")
a321_4 = find_command("AirbusFBW/MCDU1Key4")
a321_5 = find_command("AirbusFBW/MCDU1Key5")
a321_6 = find_command("AirbusFBW/MCDU1Key6")
a321_7 = find_command("AirbusFBW/MCDU1Key7")
a321_8 = find_command("AirbusFBW/MCDU1Key8")
a321_9 = find_command("AirbusFBW/MCDU1Key9")
a321_dot = find_command("AirbusFBW/MCDU1KeyDecimal")
a321_0 = find_command("AirbusFBW/MCDU1Key0")
a321_plusmin = find_command("AirbusFBW/MCDU1KeyPM")

a321_a = find_command("AirbusFBW/MCDU1KeyA")
a321_b = find_command("AirbusFBW/MCDU1KeyB")
a321_c = find_command("AirbusFBW/MCDU1KeyC")
a321_d = find_command("AirbusFBW/MCDU1KeyD")
a321_e = find_command("AirbusFBW/MCDU1KeyE")
a321_f = find_command("AirbusFBW/MCDU1KeyF")
a321_g = find_command("AirbusFBW/MCDU1KeyG")
a321_h = find_command("AirbusFBW/MCDU1KeyH")
a321_i = find_command("AirbusFBW/MCDU1KeyI")
a321_j = find_command("AirbusFBW/MCDU1KeyJ")
a321_k = find_command("AirbusFBW/MCDU1KeyK")
a321_l = find_command("AirbusFBW/MCDU1KeyL")
a321_m = find_command("AirbusFBW/MCDU1KeyM")
a321_n = find_command("AirbusFBW/MCDU1KeyN")
a321_o = find_command("AirbusFBW/MCDU1KeyO")
a321_p = find_command("AirbusFBW/MCDU1KeyP")
a321_q = find_command("AirbusFBW/MCDU1KeyQ")
a321_r = find_command("AirbusFBW/MCDU1KeyR")
a321_s = find_command("AirbusFBW/MCDU1KeyS")
a321_t = find_command("AirbusFBW/MCDU1KeyT")
a321_u = find_command("AirbusFBW/MCDU1KeyU")
a321_v = find_command("AirbusFBW/MCDU1KeyV")
a321_w = find_command("AirbusFBW/MCDU1KeyW")
a321_x = find_command("AirbusFBW/MCDU1KeyX")
a321_y = find_command("AirbusFBW/MCDU1KeyY")
a321_z = find_command("AirbusFBW/MCDU1KeyZ")
a321_slash = find_command("AirbusFBW/MCDU1KeySlash")
a321_sp = find_command("AirbusFBW/MCDU1KeySpace")
a321_ovfy = find_command("AirbusFBW/MCDU1KeyOverfly")
a321_clr = find_command("AirbusFBW/MCDU1KeyClear")

--*************************************************************************************--
--** 				                 SYSTEM FUNCTIONS           	    			 **--
--*************************************************************************************--

function cdu_buttons()

	if cduDR_button[0] ~= 0 then
		
		-- lk1

		if cduDR_button[0] == 56 then
			a321_l1:once()
		end

		-- lk2

		if cduDR_button[0] == 64 then
			a321_l2:once()
		end

		-- lk3

		if cduDR_button[0] == 72 then
			a321_l3:once()
		end
		
		-- lk4

		if cduDR_button[0] == 80 then
			a321_l4:once()
		end
		
		-- lk5

		if cduDR_button[0] == 88 then
			a321_l5:once()
		end
		
		-- lk6

		if cduDR_button[0] == 87 then
			a321_l6:once()
		end
		
		-- rk1

		if cduDR_button[0] == 86 then
			a321_r1:once()
		end
		
		-- rk2

		if cduDR_button[0] == 85 then
			a321_r2:once()
		end
		
		-- rk3

		if cduDR_button[0] == 84 then
			a321_r3:once()
		end
		
		-- rk4

		if cduDR_button[0] == 83 then
			a321_r4:once()
		end
		
		-- rk5

		if cduDR_button[0] == 74 then
			a321_r5:once()
		end

		-- rk6

		if cduDR_button[0] == 82 then
			a321_r6:once()
		end

		-- dir

		if cduDR_button[0] == 79 then
			a321_dir:once()
		end

		-- prog

		if cduDR_button[0] == 78 then
			a321_prog:once()
		end

		-- perf

		if cduDR_button[0] == 77 then
			a321_perf:once()
		end

		-- init

		if cduDR_button[0] == 76 then
			a321_init:once()
		end

		-- data

		if cduDR_button[0] == 75 then
			a321_data:once()
		end

		-- fpln

		if cduDR_button[0] == 71 then
			a321_fpln:once()
		end

		-- radnav

		if cduDR_button[0] == 70 then
			a321_radnav:once()
		end

		-- fuel

		if cduDR_button[0] == 69 then
			a321_fuel:once()
		end

		-- sec

		if cduDR_button[0] == 68 then
			a321_sec:once()
		end

		-- atc

		if cduDR_button[0] == 67 then
			a321_atc:once()
		end

		-- mcdu menu

		if cduDR_button[0] == 66 then
			a321_mcdumenu:once()
		end

		-- airp

		if cduDR_button[0] == 65 then
			a321_airp:once()
		end

		-- left

		if cduDR_button[0] == 63 then
			a321_left:once()
		end

		-- right

		if cduDR_button[0] == 55 then
			a321_right:once()
		end

		-- up

		if cduDR_button[0] == 62 then
			a321_up:once()
		end

		-- left

		if cduDR_button[0] == 54 then
			a321_dn:once()
		end

		-- 7

		if cduDR_button[0] == 16 then
			a321_7:once()
		end

		-- 8

		if cduDR_button[0] == 15 then
			a321_8:once()
		end

		-- 9

		if cduDR_button[0] == 14 then
			a321_9:once()
		end

		-- dot

		if cduDR_button[0] == 8 then
			a321_dot:once()
		end

		-- 0

		if cduDR_button[0] == 7 then
			a321_0:once()
		end

		-- plus minus

		if cduDR_button[0] == 6 then
			a321_plusmin:once()
		end

		-- 4

		if cduDR_button[0] == 24 then
			a321_4:once()
		end

		-- 5

		if cduDR_button[0] == 23 then
			a321_5:once()
		end

		-- 6

		if cduDR_button[0] == 22 then
			a321_6:once()
		end

		-- 1

		if cduDR_button[0] == 32 then
			a321_1:once()
		end

		-- 2

		if cduDR_button[0] == 31 then
			a321_2:once()
		end

		-- 3

		if cduDR_button[0] == 30 then
			a321_3:once()
		end
	
		-- Z

		if cduDR_button[0] == 5 then
			a321_z:once()
		end
	
		-- Y

		if cduDR_button[0] == 9 then
			a321_y:once()
		end
		
		-- X

		if cduDR_button[0] == 10 then
			a321_x:once()
		end
		
		-- W

		if cduDR_button[0] == 11 then
			a321_w:once()
		end
		
		-- V

		if cduDR_button[0] == 12 then
			a321_v:once()
		end
		
		-- U

		if cduDR_button[0] == 13 then
			a321_u:once()
		end
		
		-- T

		if cduDR_button[0] == 17 then
			a321_t:once()
		end
		
		-- S

		if cduDR_button[0] == 18 then
			a321_s:once()
		end
		
		-- R

		if cduDR_button[0] == 19 then
			a321_r:once()
		end
		
		-- Q

		if cduDR_button[0] == 20 then
			a321_q:once()
		end
		
		-- P

		if cduDR_button[0] == 21 then
			a321_p:once()
		end
		
		-- O

		if cduDR_button[0] == 25 then
			a321_o:once()
		end
		
		-- N

		if cduDR_button[0] == 26 then
			a321_n:once()
		end
		
		-- M

		if cduDR_button[0] == 27 then
			a321_m:once()
		end
		
		-- L

		if cduDR_button[0] == 28 then
			a321_l:once()
		end
		
		-- K

		if cduDR_button[0] == 29 then
			a321_k:once()
		end
		
		-- J

		if cduDR_button[0] == 49 then
			a321_j:once()
		end
		
		-- I

		if cduDR_button[0] == 50 then
			a321_i:once()
		end
		
		-- H

		if cduDR_button[0] == 51 then
			a321_h:once()
		end
		
		-- G

		if cduDR_button[0] == 52 then
			a321_g:once()
		end
		
		-- F

		if cduDR_button[0] == 53 then
			a321_f:once()
		end
		
		-- E

		if cduDR_button[0] == 57 then
			a321_e:once()
		end
		
		-- D

		if cduDR_button[0] == 58 then
			a321_d:once()
		end
		
		-- C

		if cduDR_button[0] == 59 then
			a321_c:once()
		end
		
		-- B

		if cduDR_button[0] == 60 then
			a321_b:once()
		end
		
		-- A

		if cduDR_button[0] == 61 then
			a321_a:once()
		end
		
		-- slash

		if cduDR_button[0] == 4 then
			a321_slash:once()
		end
		
		-- sp

		if cduDR_button[0] == 3 then
			a321_sp:once()
		end
		
		-- ovfy

		if cduDR_button[0] == 2 then
			a321_ovfy:once()
		end
		
		-- clr

		if cduDR_button[0] == 1 then
			a321_clr:once()
		end
	end

	cduDR_ledfm1[0] = 1

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
	cdu_buttons()
end

--function after_physics()

--end

--function after_replay() end




--*************************************************************************************--
--** 				               SUB-MODULE PROCESSING       	        			 **--
--*************************************************************************************--

-- dofile("")