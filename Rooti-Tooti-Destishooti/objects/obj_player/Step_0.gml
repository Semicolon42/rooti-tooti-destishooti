var ctrl_up    = keyboard_check(vk_up)
var ctrl_left  = keyboard_check(vk_left)
var ctrl_right = keyboard_check(vk_right)
var ctrl_down  = keyboard_check(vk_down)
var ctrl_reload_switch_interact = keyboard_check(ord("C"))
var ctrl_reload_switch_interact_released = keyboard_check_released(ord("C"))
var ctrl_roll_pressed = keyboard_check_pressed(ord("X"))
var ctrl_shoot_pressed = keyboard_check_pressed(ord("Z"))
var ctrl_shoot = keyboard_check(ord("Z"))



if (state == PLAYER_STATE.WALKING) {
	if (shoot_cooldown > 0) {
		shoot_cooldown -= 1
	}
	if (reload_cooldown > 0) {
		reload_cooldown  -= 1
		if (reload_cooldown == 0) {
			ammo[gun_equipped] = gun.clip_size
		}
	}
	
	if (jump_time > 0) jump_time -= 1
	if (roll_time > 0) roll_time -= 1
	if (roll_time > roll_cooldown) {
		animation_state = PLAYER_ANNIMATION_STATE.ROLLING
		x += roll_speed_x
		y += roll_speed_y
	} else {
		if (ctrl_up) y -= walk_speed_y
		if (ctrl_down) y += walk_speed_y
		if (ctrl_right) x += walk_speed_x
		if (ctrl_left) x -= walk_speed_x
		if (ctrl_right && !ctrl_shoot) facing = 1
		if (ctrl_left && !ctrl_shoot) facing = -1
		if (roll_time <= 0 && ctrl_roll_pressed) {
			if (jump_time == 0) {
				jump_time = jump_time_max
				image_index = 0
				animation_state = PLAYER_ANNIMATION_STATE.JUMPING
			} else if (ctrl_up or ctrl_down or ctrl_right or ctrl_left) {
				image_index = 0
				animation_state = PLAYER_ANNIMATION_STATE.ROLLING
				roll_time = roll_time_max + roll_cooldown
				roll_speed_x = 0
				roll_speed_y = 0
				if (ctrl_left) roll_speed_x = -roll_speed_x_max 
				if (ctrl_right) roll_speed_x = roll_speed_x_max 
				if (ctrl_up) roll_speed_y = -roll_speed_y_max 
				if (ctrl_down) roll_speed_y = roll_speed_y_max 
			}
		}
		if (jump_time > 0) {
			animation_state = PLAYER_ANNIMATION_STATE.JUMPING
		} else if (ctrl_up or ctrl_down or ctrl_right or ctrl_left) {
			animation_state = PLAYER_ANNIMATION_STATE.WALKING
		} else {
			animation_state = PLAYER_ANNIMATION_STATE.IDLE
		}
		if (roll_time == 0 and ctrl_reload_switch_interact) {
			switch_pressed += 1		
			if (switch_pressed > switch_press_change_guns) {
				var interactable = instance_position(x,y,obj_interactable)
				if (interactable != noone and interactable.interact_cooldown <= 0) {
					interactable.interact_counter += 1	
				} else if (reload_cooldown <= 0 and ammo[gun_equipped] < gun.clip_size) {
					reload_cooldown = gun.reload_time	
					audio_play_sound(gun.sound_reload, 0, false)
				}
			}
		}
		if (roll_time == 0 and ctrl_reload_switch_interact_released) {
			if (switch_pressed < switch_press_change_guns) {
				gun_equipped = 1 - gun_equipped
				gun = guns_equipped[gun_equipped]
				reload_cooldown = 0
				shoot_cooldown = 10
			}
		}
		if(!ctrl_reload_switch_interact) {
			switch_pressed = 0
		}
		if (roll_time == 0 && ctrl_shoot) {
			if (shoot_cooldown <= 0 and ammo[gun_equipped] > 0) {
				ammo[gun_equipped] -= 1
				gun.fire(x, y, facing)
				shoot_cooldown = gun.shoot_cooldown
			}
			if (ammo[gun_equipped] <= 0 and reload_cooldown <= 0) {
				reload_cooldown = gun.reload_time	
				audio_play_sound(gun.sound_reload, 0, false)
			}	
		}
	}
}
depth = -y