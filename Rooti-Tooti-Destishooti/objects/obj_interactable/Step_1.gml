/// @description Insert description here
// You can write your code in this editor
if (interact_counter > 0) {
	if (interact_counter == prev_interact_counter) {
		interact_reset_counter += 1
		if (interact_reset_counter >= interact_reset_counter_max) {
			interact_reset_counter = 0
			interact_counter = 0
		}
	} else {
		prev_interact_counter = interact_counter
	}
}

if (interact_cooldown > 0) interact_cooldown -= 1

if (interact_counter >= interact_counter_max) {
	interact_counter = 0
	interact_cooldown = interact_cooldown_max
	script_execute(interact_script_execute, interact_script_execute_params)	
}