enum PLAYER_STATE {
	WALKING,
	INTERACTING,
	CONSOLE,
	JUMPING,
	ROLLING,
}
enum WALKING_STATE {
	WALKING,
	JUMPING,
	ROLLING,
}
enum PLAYER_ANNIMATION_STATE {
	IDLE,
	WALKING,
	RUNNING,
	INTERACTING,
	CONSOLE,
	JUMPING,
	ROLLING,
}
walking_state = WALKING_STATE.WALKING
state = PLAYER_STATE.WALKING
annimation_state = PLAYER_ANNIMATION_STATE.IDLE
facing = 1
jump_time = 0
jump_time_max = 40
roll_time = 0
roll_time_max = 20
roll_cooldown = 20
roll_speed_x = 0; roll_speed_x_max = 2
roll_speed_y = 0; roll_speed_y_max = 2
run_speed_x = 2; run_speed_y = 1.5
walk_speed_x = 1; walk_speed_y = 0.75

init_gun_info()
gun = get_gun_info(0)
shoot_cooldown = 0
ammo = gun.clip_size
reload_cooldown = 0