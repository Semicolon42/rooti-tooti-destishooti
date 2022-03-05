/// @description Insert description here
// You can write your code in this editor
switch(state) {
	default:
	case CAMERA_STATE.FOLLOW_PLAYER:
		target_offset_x = 0
		target_offset_y = 0
		var tx = obj_player.x + target_offset_x
		var ty = obj_player.y + target_offset_y
		var dist = point_distance(x,y,tx,ty)
		var spd = max(min(dist, pan_speed_min), dist * pan_speed_pec)
		move_towards_point(tx,ty,spd)
		break;
}