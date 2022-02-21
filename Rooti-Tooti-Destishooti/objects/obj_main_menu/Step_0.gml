/// @description Insert description here
// You can write your code in this editor

var ctrl_up = keyboard_check(vk_up)
var ctrl_down = keyboard_check(vk_down)
var ctrl_up_pressed = keyboard_check_pressed(vk_up)
var ctrl_down_pressed = keyboard_check_pressed(vk_down)
var ctrl_select_pressed = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_space)


if (show_credits) {
	if (credits_cooldown > 0) {
		credits_cooldown -= 1	
	} else {
		if(ctrl_up) { 
			credits_scroll -= credits_scroll_speed
		} else if(ctrl_down) { 
			credits_scroll += credits_scroll_speed
		} else if (keyboard_check_pressed(vk_anykey)) {
			credits_scroll = 0
			show_credits = false
			menu_index = 0
		}
	}
} else {
	
	if(ctrl_up_pressed) { 
		menu_index -= 1
		if menu_index < 0 then menu_index = menu_size
	}
	if(ctrl_down_pressed) { 
		menu_index += 1
		if menu_index >= menu_size then menu_index = 0
	}
	
	if (ctrl_select_pressed) {
		switch(menu_index) {
			case 0: // demo
				room_goto(rm_test_gamplay)
				break;
			case 1: // credits
				show_credits = true
				credits_cooldown = credits_cooldown_max
				credits_scroll = 0
				break;
		}
	}
}