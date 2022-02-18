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

draw_sprite_ext(spr_player_shadow, 0, x, y, image_xscale * facing, image_yscale, 0, c_white, 0.6)
draw_sprite_ext(gun.sprite, image_index, x+3*facing, y-2, image_xscale * facing, image_yscale, 
    (reload_cooldown > 0) ? facing * 30 : 0, c_white, 1)
draw_sprite_ext(_base, image_index, x, y, image_xscale * facing, image_yscale, 0, c_white, 1)
draw_sprite_ext(_hair, image_index, x, y, image_xscale * facing, image_yscale, 0, c_white, 1)
draw_sprite_ext(_hand, image_index, x, y, image_xscale * facing, image_yscale, 0, c_white, 1)	