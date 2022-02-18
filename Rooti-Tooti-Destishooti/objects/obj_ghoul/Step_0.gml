/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
target = obj_player
var tx = obj_player.x + target_x
var ty = obj_player.y + target_y
switch(state) {
	case(GHOUL_STATE.IDLE):
		if (keyboard_check(vk_space))
			animation_state = GHOUL_ANIMATION_STATE.RUNNING
		else
			animation_state = GHOUL_ANIMATION_STATE.IDLE
		
		if (obj_player.x < x) {
			facing = -1
			image_xscale = -1
		} else {
			facing = 1
			image_xscale = 1
		}
		
		break;
}