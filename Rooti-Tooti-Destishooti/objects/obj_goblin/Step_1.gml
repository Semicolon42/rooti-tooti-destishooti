/// @description Insert description here
// You can write your code in this editor
switch(state) {
	case GOBLIN_STATE.SLEEP:
		// do nothing
		break;
	case GOBLIN_STATE.IDLE:
		if (ds_queue_size(action_queue) <= 0) {
			var xx = idle_position[0] + random_range(-20, 20)
			var yy = idle_position[1] + random_range(-20, 20)
			ds_queue_enqueue(action_queue,[GOBLIN_ACTION_STATE.MOVE_TO_POINT,xx,yy])
			var t = random(3) * 50 + 50
			ds_queue_enqueue(action_queue,[GOBLIN_ACTION_STATE.IDLE,t])
		}
		break;
	case GOBLIN_STATE.AGGRO_PLAYER:
		break;
}
