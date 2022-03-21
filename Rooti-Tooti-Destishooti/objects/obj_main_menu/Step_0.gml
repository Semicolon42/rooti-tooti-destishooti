/// @description Insert description here
// You can write your code in this editor

var ctrl_up = keyboard_check(vk_up)
var ctrl_down = keyboard_check(vk_down)
var ctrl_left = keyboard_check(vk_left)
var ctrl_right = keyboard_check(vk_right)
var ctrl_up_pressed = keyboard_check_pressed(vk_up)
var ctrl_down_pressed = keyboard_check_pressed(vk_down)
var ctrl_select_pressed = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_space)


if (show_credits) {
	if (credits_cooldown > 0) {
		credits_cooldown -= 1	
	} else {
		if (ctrl_up) credits_scroll_y -= credits_scroll_speed
		if (ctrl_down) credits_scroll_y += credits_scroll_speed
		if (ctrl_left) credits_scroll_x -= credits_scroll_speed
		if (ctrl_right) credits_scroll_x += credits_scroll_speed
		if (keyboard_check_pressed(vk_anykey) and not (ctrl_up || ctrl_down || ctrl_left || ctrl_right)) {
			credits_scroll_x = 0
			credits_scroll_y = 0
			show_credits = false
			menu_index = 0
		}
	}
} else {
	
	if(ctrl_up_pressed) { 
		menu_index -= 1
		if menu_index < 0 then menu_index = menu_size - 1
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
				credits_scroll_x = 0
				credits_scroll_y = 0
				break;
		}
	}
}