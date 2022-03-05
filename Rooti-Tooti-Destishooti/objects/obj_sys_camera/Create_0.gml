/// @description Insert description here
// You can write your code in this editor
enum CAMERA_STATE {
	FOLLOW_PLAYER,
	FOLLOW_OBJECT,
	LOCK_ROOM,
}

state = CAMERA_STATE.FOLLOW_PLAYER
target_object = noone
target_offset_x = 0
target_offset_y = 0
target_point_x = 0
target_point_y = 0


pan_speed_min = 1
pan_speed_pec = .2