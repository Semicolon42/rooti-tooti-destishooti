/// @description Insert description here
// You can write your code in this editor
event_inherited()

enum GOBLIN_STATE {
	SLEEP,
	IDLE,
	AGGRO_PLAYER,
}

enum GOBLIN_ACTION_STATE {
	IDLE,
	MOVE_TO_POINT,
	MOVE_TOWARDS_PLAYER,
	ATTACK_MELEE,
}

enum GOBLIN_ANIMATION_STATE {
	IDLE,
	RUNNING,
	MELEE_ATTACK,
}

state = GOBLIN_STATE.IDLE
action_queue = ds_queue_create()
action_init = true
animation_state = GOBLIN_ANIMATION_STATE.IDLE

action_giveup_timer = 0 

idle_position = [x,y]
idle_cooldown = 0
idle_cooldown_max = 90
idle_cooldown_preattack = 40

target_x = 0
target_y = 0
x_speed = 1.2
y_speed = 0.8

HP = 3