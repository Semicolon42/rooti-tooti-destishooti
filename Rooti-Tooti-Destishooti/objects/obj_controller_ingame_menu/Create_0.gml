/// @description Insert description here
// You can write your code in this editor


enum INGAME_MENU {
	SUBMENU,
	SLIDER_CONTROL,
	FUNCTION
}

fn_main_menu = function() {
	room_goto(rm_main_menu)
}

fn_get_music_volume = function(value) {
	return global.options_music_volume
}
fn_set_music_volume = function(value) {
	global.options_music_volume = value
}

fn_unpause = function() {
	global.pause = false
	is_open = false
	obj_player.state = PLAYER_STATE.WALKING
}

options = [
	{
		option_text: "Resume", 
		option_type: INGAME_MENU.FUNCTION, 
		option_argument: fn_unpause,
	},
	{
		option_text: "Music Volume", 
		option_type: INGAME_MENU.SLIDER_CONTROL, 
		option_argument: {
			get_value: fn_get_music_volume,
			set_value: fn_set_music_volume,
			minValue: 0,
			maxValue: 1,
			increment: 0.1,
		}
	},
	{
		option_text: "Exit To Main Menu", 
		option_type: INGAME_MENU.FUNCTION, 
		option_argument: fn_main_menu
	}
]
current_menu = options

is_open = false
menu_cursor = 0