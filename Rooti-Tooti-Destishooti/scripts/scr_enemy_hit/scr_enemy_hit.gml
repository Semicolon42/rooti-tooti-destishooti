// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_hit(xx, yy, bullet, enemy, gun_id, bullet_direction) {
	var g_info = get_gun_info(gun_id)
	scr_spawn_effect(xx, yy, g_info.bullet_hit_anim).image_angle = random(360)
	enemy.hit_flash_cooldown = enemy.hit_flash_cooldown_max
	audio_play_sound(snd_enemy_hit,0,false)
	
	enemy.HP -= bullet.bullet_damage
	if (enemy.HP <= 0) {
		var death_anim = instance_create_layer(enemy.x,enemy.y,"instances",obj_enemy_death)
		death_anim.sprite_index = enemy.sprite_index
		death_anim.image_index = enemy.image_index
		death_anim.image_xscale = enemy.image_xscale
		death_anim.image_yscale = enemy.image_yscale
		instance_destroy(enemy)	
		
	}
}