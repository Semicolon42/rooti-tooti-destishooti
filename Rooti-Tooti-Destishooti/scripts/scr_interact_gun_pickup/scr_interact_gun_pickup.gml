// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_interact_gun_pickup(params){
	with(obj_player) {
		guns_equipped[gun_equipped] = get_gun_info(params[0])
		gun = guns_equipped[gun_equipped]
		ammo[gun_equipped] = gun.clip_size
	}
	if (array_length(params) >= 2) {
		if (params[1]) {
			instance_destroy()
		}
	}
}