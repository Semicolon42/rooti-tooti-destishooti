/// @description Insert description here
// You can write your code in this editor
var ctrl_menu_button_pressed = keyboard_check_pressed(vk_escape)

if (!is_open) {
	if (ctrl_menu_button_pressed) {
		is_open = true
		obj_player.state = PLAYER_STATE.MENU
	}
} else {
	var ctrl_up_pressed = keyboard_check_pressed(vk_up)
	var ctrl_down_pressed = keyboard_check_pressed(vk_down)
	var ctrl_left = keyboard_check(vk_left)
	var ctrl_right = keyboard_check(vk_right)
	var ctrl_option_selected = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("Z"))
	
	if (!ctrl_left and !ctrl_right) slide_lag = 0 
	if (ctrl_menu_button_pressed) {
		fn_unpause()
	} else if (ctrl_up_pressed) {
		menu_cursor = max(0, menu_cursor-1)
	} else if (ctrl_down_pressed) {
		menu_cursor = min(array_length(current_menu)-1, menu_cursor+1)
	} else if (ctrl_right) {
		if (slide_lag > 0) slide_lag -= 1
		if (slide_lag <= 0 and current_menu[menu_cursor].option_type == INGAME_MENU.SLIDER_CONTROL) {
			var slider_stats = current_menu[menu_cursor].option_argument
			slider_stats.set_value( min(slider_stats.maxValue, slider_stats.get_value() + slider_stats.increment) )
			slide_lag = slide_lag_max
		}
	} else if (ctrl_left) {
		if (slide_lag > 0) slide_lag -= 1
		if (slide_lag <= 0 and current_menu[menu_cursor].option_type == INGAME_MENU.SLIDER_CONTROL) {
			var slider_stats = current_menu[menu_cursor].option_argument
			slider_stats.set_value( max(slider_stats.minValue, slider_stats.get_value() - slider_stats.increment) )
			slide_lag = slide_lag_max
		}
	} else if (ctrl_option_selected) {
		if (current_menu[menu_cursor].option_type == INGAME_MENU.FUNCTION) {
			current_menu[menu_cursor].option_argument()
		}
	} 
}