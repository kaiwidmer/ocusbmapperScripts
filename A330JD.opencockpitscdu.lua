--[[
*****************************************************************************************
* Program Script Name	:	A330JD.opencockpitscdu
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

a330jd_l1 = find_dataref("jd/mcdu/click_l1")
a330jd_l2 = find_dataref("jd/mcdu/click_l2")
a330jd_l3 = find_dataref("jd/mcdu/click_l3")
a330jd_l4 = find_dataref("jd/mcdu/click_l4")
a330jd_l5 = find_dataref("jd/mcdu/click_l5")
a330jd_l6 = find_dataref("jd/mcdu/click_l6")
a330jd_r1 = find_dataref("jd/mcdu/click_r1")
a330jd_r2 = find_dataref("jd/mcdu/click_r2")
a330jd_r3 = find_dataref("jd/mcdu/click_r3")
a330jd_r4 = find_dataref("jd/mcdu/click_r4")
a330jd_r5 = find_dataref("jd/mcdu/click_r5")
a330jd_r6 = find_dataref("jd/mcdu/click_r6")

a330jd_dir = find_dataref("jd/mcdu/click_dir")
a330jd_prog = find_dataref("jd/mcdu/click_prog")
a330jd_perf = find_dataref("jd/mcdu/click_perf")
a330jd_init = find_dataref("jd/mcdu/click_int")
a330jd_data = find_dataref("jd/mcdu/click_data")

a330jd_fpln = find_dataref("jd/mcdu/click_fpln")
a330jd_radnav = find_dataref("jd/mcdu/click_radnav")
a330jd_fuel = find_dataref("jd/mcdu/click_fuel")
a330jd_sec = find_dataref("jd/mcdu/click_sec")
a330jd_atc = find_dataref("jd/mcdu/click_atc")
a330jd_mcdumenu = find_dataref("jd/mcdu/click_mcdumenu")
a330jd_airp = find_dataref("jd/mcdu/click_airp")

a330jd_left = find_dataref("jd/mcdu/click_left")
a330jd_right = find_dataref("jd/mcdu/click_right")
a330jd_up = find_dataref("jd/mcdu/click_up")
a330jd_dn = find_dataref("jd/mcdu/click_dn")

a330jd_1 = find_dataref("jd/mcdu/click_1")
a330jd_2 = find_dataref("jd/mcdu/click_2")
a330jd_3 = find_dataref("jd/mcdu/click_3")
a330jd_4 = find_dataref("jd/mcdu/click_4")
a330jd_5 = find_dataref("jd/mcdu/click_5")
a330jd_6 = find_dataref("jd/mcdu/click_6")
a330jd_7 = find_dataref("jd/mcdu/click_7")
a330jd_8 = find_dataref("jd/mcdu/click_8")
a330jd_9 = find_dataref("jd/mcdu/click_9")
a330jd_dot = find_dataref("jd/mcdu/click_dot")
a330jd_0 = find_dataref("jd/mcdu/click_0")
a330jd_plusmin = find_dataref("jd/mcdu/click_plusmin")

a330jd_a = find_dataref("jd/mcdu/click_a")
a330jd_b = find_dataref("jd/mcdu/click_b")
a330jd_c = find_dataref("jd/mcdu/click_c")
a330jd_d = find_dataref("jd/mcdu/click_d")
a330jd_e = find_dataref("jd/mcdu/click_e")
a330jd_f = find_dataref("jd/mcdu/click_f")
a330jd_g = find_dataref("jd/mcdu/click_g")
a330jd_h = find_dataref("jd/mcdu/click_h")
a330jd_i = find_dataref("jd/mcdu/click_i")
a330jd_j = find_dataref("jd/mcdu/click_j")
a330jd_k = find_dataref("jd/mcdu/click_k")
a330jd_l = find_dataref("jd/mcdu/click_l")
a330jd_m = find_dataref("jd/mcdu/click_m")
a330jd_n = find_dataref("jd/mcdu/click_n")
a330jd_o = find_dataref("jd/mcdu/click_o")
a330jd_p = find_dataref("jd/mcdu/click_p")
a330jd_q = find_dataref("jd/mcdu/click_q")
a330jd_r = find_dataref("jd/mcdu/click_r")
a330jd_s = find_dataref("jd/mcdu/click_s")
a330jd_t = find_dataref("jd/mcdu/click_t")
a330jd_u = find_dataref("jd/mcdu/click_u")
a330jd_v = find_dataref("jd/mcdu/click_v")
a330jd_w = find_dataref("jd/mcdu/click_w")
a330jd_x = find_dataref("jd/mcdu/click_x")
a330jd_y = find_dataref("jd/mcdu/click_y")
a330jd_z = find_dataref("jd/mcdu/click_z")
a330jd_slash = find_dataref("jd/mcdu/click_slash")
a330jd_sp = find_dataref("jd/mcdu/click_sp")
a330jd_ovfy = find_dataref("jd/mcdu/click_ovfy")
a330jd_clr = find_dataref("jd/mcdu/click_clr")

--*************************************************************************************--
--** 				                 SYSTEM FUNCTIONS           	    			 **--
--*************************************************************************************--

function cdu_buttons()

	if cduDR_button[0] ~= 0 then
		
		-- lk1

		if cduDR_button[0] == 56 then
			a330jd_l1 = 1
		end

		-- lk2

		if cduDR_button[0] == 64 then
			a330jd_l2 = 1
		end

		-- lk3

		if cduDR_button[0] == 72 then
			a330jd_l3 = 1
		end
		
		-- lk4

		if cduDR_button[0] == 80 then
			a330jd_l4 = 1
		end
		
		-- lk5

		if cduDR_button[0] == 88 then
			a330jd_l5 = 1
		end
		
		-- lk6

		if cduDR_button[0] == 87 then
			a330jd_l6 = 1
		end
		
		-- rk1

		if cduDR_button[0] == 86 then
			a330jd_r1 = 1
		end
		
		-- rk2

		if cduDR_button[0] == 85 then
			a330jd_r2 = 1
		end
		
		-- rk3

		if cduDR_button[0] == 84 then
			a330jd_r3 = 1
		end
		
		-- rk4

		if cduDR_button[0] == 83 then
			a330jd_r4 = 1
		end
		
		-- rk5

		if cduDR_button[0] == 74 then
			a330jd_r5 = 1
		end

		-- rk6

		if cduDR_button[0] == 82 then
			a330jd_r6 = 1
		end

		-- dir

		if cduDR_button[0] == 79 then
			a330jd_dir = 1
		end

		-- prog

		if cduDR_button[0] == 78 then
			a330jd_prog = 1
		end

		-- perf

		if cduDR_button[0] == 77 then
			a330jd_perf = 1
		end

		-- init

		if cduDR_button[0] == 76 then
			a330jd_init = 1
		end

		-- data

		if cduDR_button[0] == 75 then
			a330jd_data = 1
		end

		-- fpln

		if cduDR_button[0] == 71 then
			a330jd_fpln = 1
		end

		-- radnav

		if cduDR_button[0] == 70 then
			a330jd_radnav = 1
		end

		-- fuel

		if cduDR_button[0] == 69 then
			a330jd_fuel = 1
		end

		-- sec

		if cduDR_button[0] == 68 then
			a330jd_sec = 1
		end

		-- atc

		if cduDR_button[0] == 67 then
			a330jd_atc = 1
		end

		-- mcdu menu

		if cduDR_button[0] == 66 then
			a330jd_mcdumenu = 1
		end

		-- airp

		if cduDR_button[0] == 65 then
			a330jd_airp = 1
		end

		-- left

		if cduDR_button[0] == 63 then
			a330jd_left = 1
		end

		-- right

		if cduDR_button[0] == 55 then
			a330jd_right = 1
		end

		-- up

		if cduDR_button[0] == 62 then
			a330jd_up = 1
		end

		-- left

		if cduDR_button[0] == 54 then
			a330jd_dn = 1
		end

		-- 7

		if cduDR_button[0] == 16 then
			a330jd_7 = 1
		end

		-- 8

		if cduDR_button[0] == 15 then
			a330jd_8 = 1
		end

		-- 9

		if cduDR_button[0] == 14 then
			a330jd_9 = 1
		end

		-- dot

		if cduDR_button[0] == 8 then
			a330jd_dot = 1
		end

		-- 0

		if cduDR_button[0] == 7 then
			a330jd_0 = 1
		end

		-- plus minus

		if cduDR_button[0] == 6 then
			a330jd_plusmin = 1
		end

		-- 4

		if cduDR_button[0] == 24 then
			a330jd_4 = 1
		end

		-- 5

		if cduDR_button[0] == 23 then
			a330jd_5 = 1
		end

		-- 6

		if cduDR_button[0] == 22 then
			a330jd_6 = 1
		end

		-- 1

		if cduDR_button[0] == 32 then
			a330jd_1 = 1
		end

		-- 2

		if cduDR_button[0] == 31 then
			a330jd_2 = 1
		end

		-- 3

		if cduDR_button[0] == 30 then
			a330jd_3 = 1
		end
	
		-- Z

		if cduDR_button[0] == 5 then
			a330jd_z = 1
		end
	
		-- Y

		if cduDR_button[0] == 9 then
			a330jd_y = 1
		end
		
		-- X

		if cduDR_button[0] == 10 then
			a330jd_x = 1
		end
		
		-- W

		if cduDR_button[0] == 11 then
			a330jd_w = 1
		end
		
		-- V

		if cduDR_button[0] == 12 then
			a330jd_v = 1
		end
		
		-- U

		if cduDR_button[0] == 13 then
			a330jd_u = 1
		end
		
		-- T

		if cduDR_button[0] == 17 then
			a330jd_t = 1
		end
		
		-- S

		if cduDR_button[0] == 18 then
			a330jd_s = 1
		end
		
		-- R

		if cduDR_button[0] == 19 then
			a330jd_r = 1
		end
		
		-- Q

		if cduDR_button[0] == 20 then
			a330jd_q = 1
		end
		
		-- P

		if cduDR_button[0] == 21 then
			a330jd_p = 1
		end
		
		-- O

		if cduDR_button[0] == 25 then
			a330jd_o = 1
		end
		
		-- N

		if cduDR_button[0] == 26 then
			a330jd_n = 1
		end
		
		-- M

		if cduDR_button[0] == 27 then
			a330jd_m = 1
		end
		
		-- L

		if cduDR_button[0] == 28 then
			a330jd_l = 1
		end
		
		-- K

		if cduDR_button[0] == 29 then
			a330jd_k = 1
		end
		
		-- J

		if cduDR_button[0] == 49 then
			a330jd_j = 1
		end
		
		-- I

		if cduDR_button[0] == 50 then
			a330jd_i = 1
		end
		
		-- H

		if cduDR_button[0] == 51 then
			a330jd_h = 1
		end
		
		-- G

		if cduDR_button[0] == 52 then
			a330jd_g = 1
		end
		
		-- F

		if cduDR_button[0] == 53 then
			a330jd_f = 1
		end
		
		-- E

		if cduDR_button[0] == 57 then
			a330jd_e = 1
		end
		
		-- D

		if cduDR_button[0] == 58 then
			a330jd_d = 1
		end
		
		-- C

		if cduDR_button[0] == 59 then
			a330jd_c = 1
		end
		
		-- B

		if cduDR_button[0] == 60 then
			a330jd_b = 1
		end
		
		-- A

		if cduDR_button[0] == 61 then
			a330jd_a = 1
		end
		
		-- slash

		if cduDR_button[0] == 4 then
			a330jd_slash = 1
		end
		
		-- sp

		if cduDR_button[0] == 3 then
			a330jd_sp = 1
		end
		
		-- ovfy

		if cduDR_button[0] == 2 then
			a330jd_ovfy = 1
		end
		
		-- clr

		if cduDR_button[0] == 1 then
			a330jd_clr = 1
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