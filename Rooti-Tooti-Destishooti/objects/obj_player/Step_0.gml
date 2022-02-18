ctrl_up    = keyboard_check(vk_up)
ctrl_left  = keyboard_check(vk_left)
ctrl_right = keyboard_check(vk_right)
ctrl_down  = keyboard_check(vk_down)
ctrl_run   = keyboard_check(ord("C"))
ctrl_roll_pressed = keyboard_check_pressed(ord("X"))
ctrl_shoot_pressed = keyboard_check_pressed(ord("Z"))
ctrl_shoot = keyboard_check(ord("Z"))



if (state == PLAYER_STATE.WALKING) {
	if (shoot_cooldown > 0) {
		shoot_cooldown -= 1
	}
	if (reload_cooldown > 0) {
		reload_cooldown  -= 1
		if (reload_cooldown == 0) {
			ammo = gun.clip_size
		}
	}
	
	if (jump_time > 0) jump_time -= 1
	if (roll_time > 0) roll_time -= 1
	if (roll_time > roll_cooldown) {
		animation_state = PLAYER_ANNIMATION_STATE.ROLLING
		x += roll_speed_x
		y += roll_speed_y
	} else {
		if (ctrl_up) y -= ctrl_run ? run_speed_y : walk_speed_y
		if (ctrl_down) y += ctrl_run ? run_speed_y : walk_speed_y
		if (ctrl_right) x += ctrl_run ? run_speed_x : walk_speed_x
		if (ctrl_left) x -= ctrl_run ? run_speed_x : walk_speed_x
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
			if (ctrl_run)
				animation_state = PLAYER_ANNIMATION_STATE.RUNNING
			else
				animation_state = PLAYER_ANNIMATION_STATE.WALKING
		} else {
			animation_state = PLAYER_ANNIMATION_STATE.IDLE
		}
		
		if (roll_time == 0 && ctrl_shoot) {
			if (shoot_cooldown <= 0 and ammo > 0) {
				ammo -= 1
				gun.fire(x, y, facing)
				shoot_cooldown = gun.shoot_cooldown
			}
			if (ammo <= 0 and reload_cooldown <= 0) {
				reload_cooldown = gun.reload_time	
				audio_play_sound(gun.sound_reload, 0, false)
			}	
		}
	}
}
depth = -y