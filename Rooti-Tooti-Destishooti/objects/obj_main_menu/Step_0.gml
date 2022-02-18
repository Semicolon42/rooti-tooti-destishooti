/// @description Insert description here
// You can write your code in this editor
var ctrl_up_pressed, ctrl_down_pressed, ctrl_select_pressed;

ctrl_up_pressed = keyboard_check_pressed(vk_up)
ctrl_down_pressed = keyboard_check_pressed(vk_down)
ctrl_select_pressed = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_space)

if(ctrl_up_pressed) { 
	menu_index -= 1
	if menu_index < 0 then menu_index = menu_size
}
if(ctrl_down_pressed) { 
	menu_index += 1
	if menu_index >= menu_size then menu_index = 0
}
if(ctrl_select_pressed) {
	switch(menu_index) {
		case 0: // demo
			room_goto(rm_test_gamplay)
			break;
	}
}