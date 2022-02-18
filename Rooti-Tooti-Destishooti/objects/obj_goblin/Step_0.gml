/// @description Insert description here
// You can write your code in this editor


var action = [-1]
if (ds_queue_size(action_queue)){
	action = ds_queue_head(action_queue)	
}
switch(action[0]) {		
	case(GOBLIN_ACTION_STATE.MOVE_TO_POINT):
		animation_state = GOBLIN_ANIMATION_STATE.RUNNING
		
		var tx = action[1]
		var ty = action[2]
		if (point_distance(x,y,tx,ty) < 3) {
			x = tx
			y = ty
			ds_queue_dequeue(action_queue)
			action_init = true
		} else {
			x += -sign(x - tx) * min(x_speed, abs(x - tx))
			y += -sign(y - ty) * min(y_speed, abs(y - ty))
			if (x-tx != 0) facing = -sign(x - tx)
		}
		break;
		
	case(GOBLIN_ACTION_STATE.IDLE):	
		animation_state = GOBLIN_ANIMATION_STATE.IDLE
		
		if (action_init) {
			idle_cooldown = action[1]+1
			action_init = false
		}
		
		idle_cooldown -=1
		if (idle_cooldown <= 0) {
			ds_queue_dequeue(action_queue)
			action_init = true
		}
		
		break;
	default:
		animation_state = GOBLIN_ANIMATION_STATE.IDLE
		break;
}

image_xscale = facing