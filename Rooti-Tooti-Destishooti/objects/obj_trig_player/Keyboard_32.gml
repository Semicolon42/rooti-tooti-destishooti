/// @description DEMO: Fire weapon

// Fire bullet at the current facing direction
if (timer("fire")) {
	with (instance_create_layer(x, y, layer, obj_trig_bullet)) {
	   rot_prefetch(other.direction);
	}
	
	// Set a timer to prevent constant fire
	timer_set_time("fire", 0.25);
}