/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
event_inherited()

enum GHOUL_STATE {
	IDLE,
	MOVE_TOWARDS_PLAYER,
	RANGED_ATTACK,
}

enum GHOUL_ANIMATION_STATE {
	IDLE,
	RUNNING,
	RANGED_ATTACK,
}

state = GHOUL_STATE.IDLE
animation_state = GHOUL_ANIMATION_STATE.IDLE

idle_cooldown = 0
idle_cooldown_max = 90
idle_cooldown_preattack = 40

target_x = 0
target_y = 0
x_speed = 1.2
y_speed = 0.8