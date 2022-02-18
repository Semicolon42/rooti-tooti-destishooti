/// @description Insert description here
// You can write your code in this editor
spawn_cooldown -= 1
if (spawn_cooldown <= 0 and ds_list_size(spawned_list) < spawn_max) {
	var gob = instance_create_layer(x,y,"Instances",obj_goblin)
	gob.idle_position = [x+ random_range(-20,20), y + 30 + random_range(0,20)]
	ds_list_add(spawned_list, gob)
	spawn_cooldown = spawn_cooldown_max
}

for (var i = 0; i < ds_list_size(spawned_list); i += 1) {
	if (!instance_exists(ds_list_find_value(spawned_list,i))) {
		ds_list_delete(spawned_list, i)
		i -= 1
	}
}