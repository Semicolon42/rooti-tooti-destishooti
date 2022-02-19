/// @description Insert description here
// You can write your code in this editor
ctrl_return_main_menu = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace)
if (ctrl_return_main_menu) {
	room_goto(rm_main_menu)	
}