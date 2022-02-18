/// @description Insert description here
// You can write your code in this editor

switch(animation_state) {
	case(GOBLIN_ANIMATION_STATE.RUNNING):
		sprite_index = spr_goblin_run
		break;
	case(GOBLIN_ANIMATION_STATE.MELEE_ATTACK):
		sprite_index = spr_goblin_attack
		break;
	case(GOBLIN_ANIMATION_STATE.IDLE):
	default:
		sprite_index = spr_goblin_idle
}

event_inherited()

// debug draw
if (false) {
	var st = "none"
	var ast = "none"
	var act = -1
	if (ds_queue_size(action_queue)) act = ds_queue_head(action_queue)[0]
	if (state == GOBLIN_STATE.IDLE) st = "IDLE"
	if (act == GOBLIN_ACTION_STATE.MOVE_TO_POINT) ast = "MV2PT"
	if (act == GOBLIN_ACTION_STATE.IDLE) ast = "IDLE"

	draw_text(x+20,y+10,st)
	draw_text(x+20,y+30,ast)
	draw_text(x+20,y+50,idle_cooldown)
}

// debug draw movement target
//draw_circle_color(target.x + target_x,target.y + target_y,2,c_red,c_red,false)