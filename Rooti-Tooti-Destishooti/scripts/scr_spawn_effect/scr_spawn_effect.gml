// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawn_effect(xx, yy, anim_sprite_id){
	var _effect = instance_create_layer(xx, yy, "effects", obj_effect)
	_effect.sprite_index = anim_sprite_id
	return _effect
}