﻿--local variables for API. Automatically generated by https://github.com/simpleavaster/gslua/blob/master/authors/sapphyrus/generate_api.lua 
local client_latency, client_log, client_draw_rectangle, client_draw_circle_outline, client_userid_to_entindex, client_draw_gradient, client_set_event_callback, client_screen_size, client_draw_indicator, client_eye_position = client.latency, client.log, client.draw_rectangle, client.draw_circle_outline, client.userid_to_entindex, client.draw_gradient, client.set_event_callback, client.screen_size, client.draw_indicator, client.eye_position 
local client_color_log, client_draw_circle, client_draw_text, client_visible, client_exec, client_delay_call, client_trace_line, client_world_to_screen = client.color_log, client.draw_circle, client.draw_text, client.visible, client.exec, client.delay_call, client.trace_line, client.world_to_screen 
local client_draw_hitboxes, client_get_cvar, client_draw_line, client_camera_angles, client_draw_debug_text, client_random_int, client_random_float = client.draw_hitboxes, client.get_cvar, client.draw_line, client.camera_angles, client.draw_debug_text, client.random_int, client.random_float 
local entity_get_local_player, entity_is_enemy, entity_get_player_name, entity_get_all, entity_set_prop, entity_get_player_weapon, entity_hitbox_position, entity_get_prop, entity_get_players, entity_get_classname = entity.get_local_player, entity.is_enemy, entity.get_player_name, entity.get_all, entity.set_prop, entity.get_player_weapon, entity.hitbox_position, entity.get_prop, entity.get_players, entity.get_classname 
local globals_realtime, globals_absoluteframetime, globals_tickcount, globals_curtime, globals_mapname, globals_tickinterval, globals_framecount, globals_frametime, globals_maxplayers = globals.realtime, globals.absoluteframetime, globals.tickcount, globals.curtime, globals.mapname, globals.tickinterval, globals.framecount, globals.frametime, globals.maxplayers 
local ui_new_slider, ui_new_combobox, ui_reference, ui_set_visible, ui_new_color_picker, ui_set_callback, ui_set, ui_new_checkbox, ui_new_hotkey, ui_new_button, ui_new_multiselect, ui_get = ui.new_slider, ui.new_combobox, ui.reference, ui.set_visible, ui.new_color_picker, ui.set_callback, ui.set, ui.new_checkbox, ui.new_hotkey, ui.new_button, ui.new_multiselect, ui.get 
local math_ceil, math_tan, math_log10, math_randomseed, math_cos, math_sinh, math_random, math_huge, math_pi, math_max, math_atan2, math_ldexp, math_floor, math_sqrt, math_deg, math_atan, math_fmod = math.ceil, math.tan, math.log10, math.randomseed, math.cos, math.sinh, math.random, math.huge, math.pi, math.max, math.atan2, math.ldexp, math.floor, math.sqrt, math.deg, math.atan, math.fmod 
local math_acos, math_pow, math_abs, math_min, math_sin, math_frexp, math_log, math_tanh, math_exp, math_modf, math_cosh, math_asin, math_rad = math.acos, math.pow, math.abs, math.min, math.sin, math.frexp, math.log, math.tanh, math.exp, math.modf, math.cosh, math.asin, math.rad 
local table_maxn, table_foreach, table_sort, table_remove, table_foreachi, table_move, table_getn, table_concat, table_insert = table.maxn, table.foreach, table.sort, table.remove, table.foreachi, table.move, table.getn, table.concat, table.insert 
local string_find, string_format, string_rep, string_gsub, string_len, string_gmatch, string_dump, string_match, string_reverse, string_byte, string_char, string_upper, string_lower, string_sub = string.find, string.format, string.rep, string.gsub, string.len, string.gmatch, string.dump, string.match, string.reverse, string.byte, string.char, string.upper, string.lower, string.sub 
--end of local variables 

--coded by dalawr (atleast ported)
-- credits:
--guy who released hsv_to_rgb 
--guy who posted rotaring swastika on uc

local combobox_reference = ui_new_combobox("VISUALS", "Other ESP", "Rotaring crosshair", "Off", "Cross", "Swastika")
local color_reference = ui_new_color_picker("VISUALS", "Other ESP", "Rotaring crosshair", 255, 255, 255, 255)
local speed_reference = ui_new_slider("VISUALS", "Other ESP", "Rotate speed", 1, 10, 5, true, nil)
local size_reference = ui_new_slider("VISUALS", "Other ESP", "Crosshair size", 1, 100, 70, true, nil)

local rotate_degree = 0;

local function hsv_to_rgb(h, s, v, a)
  local r, g, b

  local i = math_floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return r * 255, g * 255, b * 255, a * 255
end

local function DEG2RAD(a)
	return a * math.pi / 180
end 

local function RAD2DEG(a)
	return a * 180 / math.pi
end 

local function on_paint(ctx)

	local local_player = entity_get_local_player()
	local is_dead = entity_get_prop(local_player, "m_lifeState") ~= 0

	if ui_get(combobox_reference) == "Off" then
		return
	end

	if local_player == nil or is_dead then
		return
	end
	
	local r, g, b, alpha = 255, 255, 255, 255

	local r2, g2, b2, alpha2 = ui_get(color_reference)

	local screen_width, screen_height = client_screen_size()

	if alpha2 <= 0 then
		r, g, b = hsv_to_rgb(globals_tickcount() % 350 / 350, 1, 1, 255)
	else
		r, g, b, alpha = r2,g2,b2,alpha2
	end

	local size = ((screen_height / 2) / (101 - ui_get(size_reference)))

	if (rotate_degree > 90) then 
		rotate_degree = 0
	end

	for i=1,4 do

		local pos0 = math_atan(size / size);

		local pos1 = size * math_sin(DEG2RAD(rotate_degree + (i * 90)))
		local pos2 = size * math_cos(DEG2RAD(rotate_degree + (i * 90)))

		local pos3 = (size / math_cos(pos0)) * math_sin(DEG2RAD(rotate_degree + (i * 90) + RAD2DEG(pos0)))
		local pos4 = (size / math_cos(pos0)) * math_cos(DEG2RAD(rotate_degree + (i * 90) + RAD2DEG(pos0)))

		client_draw_line(ctx, screen_width / 2, screen_height / 2, screen_width / 2 + pos1, screen_height / 2 - pos2, r, g, b, alpha)

		if ui_get(combobox_reference) == "Swastika" then
			client_draw_line(ctx, screen_width / 2 + pos1, screen_height / 2 - pos2, screen_width / 2 + pos3, screen_height / 2 -pos4, r, g, b, alpha)
		end
	end

	rotate_degree = rotate_degree + (ui_get(speed_reference) / 10)
end

local function update_menu()

    if ui_get(combobox_reference) == "Off" then
        ui_set_visible(color_reference, false)
        ui_set_visible(speed_reference, false)
        ui_set_visible(size_reference, false)
    else
        ui_set_visible(color_reference, true)
        ui_set_visible(speed_reference, true)
        ui_set_visible(size_reference, true)
    end

end

ui_set_callback(combobox_reference, update_menu)
client_set_event_callback("paint", on_paint)