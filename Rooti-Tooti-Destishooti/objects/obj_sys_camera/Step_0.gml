/// @description Insert description here
// You can write your code in this editor
var cam_w = camera_get_view_width(view_camera[0])
var cam_h = camera_get_view_height(view_camera[0])


switch(state) {
	default:
	case CAMERA_STATE.FOLLOW_PLAYER:
		
		target_offset_x = 0
		target_offset_y = 0
		var tx = obj_player.x + target_offset_x
		var ty = obj_player.y + target_offset_y
		
		with(obj_camera_area_base) {
			var cam = {
				x1: x,
				y1: y,
				x2: x + sprite_width,
				y2: y + sprite_height,
				w: sprite_width,
				h: sprite_height,
			}
			
			if (obj_player.x > cam.x1 and obj_player.x < cam.x2 
			    and obj_player.y > cam.y1 and obj_player.y < cam.y2  ) {
			
				if (tx > cam.x2 - cam_w/2) tx = cam.x2 - cam_w/2
				if (tx < cam.x1 + cam_w/2) tx = cam.x1 + cam_w/2
				if (ty > cam.y2 - cam_h/2) ty = cam.y2 - cam_h/2
				if (ty < cam.y1 + cam_h/2) ty = cam.y1 + cam_h/2
			}
		}
		
		var dist = point_distance(x,y,tx,ty)
		var spd = max(min(dist, pan_speed_min), dist * pan_speed_pec)
		move_towards_point(tx,ty,spd)
		break;
}