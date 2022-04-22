/// @description Insert description here
// You can write your code in this editor
event_inherited()

function scr_interact_gun_pickup(player, params){
	player.set_current_gun(params[0])
	//with(obj_player) {
	//	guns_equipped[gun_equipped] = get_gun_info(params[0])
	//	gun = guns_equipped[gun_equipped]
	//	ammo[gun_equipped] = gun.clip_size
	//}
	if (array_length(params) >= 2) {
		if (params[1]) {
			instance_destroy()
		}
	}
}

float = 0
gun_sprite = get_gun_info(gun_index).sprite
interact_script_execute = scr_interact_gun_pickup
interact_script_execute_params = [gun_index, one_time_pickup]