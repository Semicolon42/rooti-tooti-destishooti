/// @description main draw
// You can write your code in this editor
var _base, _hair, _hand, _tool, scale

image_xscale = 1
image_yscale = 1

switch(animation_state) {
	case PLAYER_ANNIMATION_STATE.RUNNING:
		_base = spr_player_walking_base
		_hair = spr_player_walking_hair_01
		_hand = spr_player_walking_hand_empty
		_tool = noone
		break;
	case PLAYER_ANNIMATION_STATE.WALKING:
		_base = spr_player_walking_base
		_hair = spr_player_walking_hair_01
		_hand = spr_player_walking_hand_empty
		_tool = noone
		break;
	case PLAYER_ANNIMATION_STATE.JUMPING:
		image_index = sprite_get_number(spr_player_jump_base) * (1 - jump_time / jump_time_max)
		_base = spr_player_jumphigher_base
		_hair = spr_player_jumphigher_hair_01
		_hand = spr_player_jumphigher_hand_empty
		_tool = noone
		break;
	case PLAYER_ANNIMATION_STATE.ROLLING:
		image_index = sprite_get_number(spr_player_rolling_base) * (1 - (roll_time-roll_cooldown) / roll_time_max)
		_base = spr_player_rolling_base
		_hair = spr_player_rolling_hair_01
		_hand = spr_player_rolling_hand_empty
		_tool = noone
		break;
	case PLAYER_ANNIMATION_STATE.IDLE:
	default:
		_base = spr_player_idle_base
		_hair = spr_player_idle_hair_01
		_hand = spr_player_idle_hand_empty
		_tool = noone
		break;
}



// Firgure out what to draw for the fun
var gun_draw_sprite = gun.sprite
var gun_draw_x = x + 3 * facing
var gun_draw_y = y - 2
var gun_draw_angle = 0
if (shoot_cooldown > 0) {
	if (gun.sprite_shoot == noone) {
			
	} else {
		if (gun_image_index > sprite_get_number(gun.sprite_shoot)) {
			gun_draw_sprite = gun.sprite
		} else {
			gun_draw_sprite = gun.sprite_shoot
			gun_image_index += 1
		}
	}
} else if (reload_cooldown > 0) {	
	if (gun.sprite_reload == noone) {
		gun_draw_angle = 30 * facing
	} else {		
		gun_draw_sprite = gun.sprite_reload
		gun_image_index = floor(sprite_get_number(gun.sprite_reload) * (1 - reload_cooldown / gun.reload_time))
	}
}

draw_sprite_ext(spr_player_shadow, 0, x, y, image_xscale * facing, image_yscale, 0, c_white, 0.6)
draw_sprite_ext(gun_draw_sprite, gun_image_index, gun_draw_x, gun_draw_y, image_xscale * facing, image_yscale, gun_draw_angle, c_white, 1)
draw_sprite_ext(_base, image_index, x, y, image_xscale * facing, image_yscale, 0, c_white, 1)
draw_sprite_ext(_hair, image_index, x, y, image_xscale * facing, image_yscale, 0, c_white, 1)
draw_sprite_ext(_hand, image_index, x, y, image_xscale * facing, image_yscale, 0, c_white, 1)	