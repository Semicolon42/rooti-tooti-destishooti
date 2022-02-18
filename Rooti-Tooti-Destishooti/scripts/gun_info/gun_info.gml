// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum DAMAGE_TYPE {
	NORMAL
}

function init_gun_info(){
	global.gun_info = [
		{
			sprite: spr_player_gun_pistol,
			clip_size: 10,
			reload_time: 30,
			shoot_cooldown: 10,
			fire: function(_x, _y, _facing) {
				var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
				_bullet.direction = 90 - 90 * _facing + random(4)-2
				_bullet.speed = 10
				_bullet.bullet_life = 20
				audio_play_sound(snd_pistol_shoot, 0, false)
			},
			bullet_hit_anim: spr_bullet_hit,
			bullet_damage: 1,
			bullet_damage_type: DAMAGE_TYPE.NORMAL,
			sound_reload: snd_pistol_reload,
		}
	]
}

function get_gun_info(index) {
	return global.gun_info[index]
}