/// @description Insert description here
// You can write your code in this editor
switch(animation_state) {
	case(GHOUL_ANIMATION_STATE.RUNNING):
		sprite_index = spr_ghoul_walk
		break;
	case(GHOUL_ANIMATION_STATE.RANGED_ATTACK):
		sprite_index = spr_MAIN_MENU_CTRL
		break;
	case(GHOUL_ANIMATION_STATE.IDLE):
	default:
		sprite_index = spr_ghoul_idle
}

event_inherited()