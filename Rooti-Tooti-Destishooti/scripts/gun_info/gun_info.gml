// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum DAMAGE_TYPE {
	NORMAL
}

function init_gun_info(){
	global.gun_info = [
		{
			sprite: spr_player_gun_pistol,
			sprite_shoot: noone,
			sprite_reload: noone,
			clip_size: 6,
			reload_time: 45,
			shoot_cooldown: 30,
			fire: function(_x, _y, _facing) {
				var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
				_bullet.direction = 90 - 90 * _facing + random(4)-2
				_bullet.speed = 10
				_bullet.bullet_life = 20
				_bullet.bullet_damage = 3
				audio_play_sound(snd_pistol_shoot, 0, false)
			},
			bullet_hit_anim: spr_bullet_hit,
			bullet_damage: 2,
			bullet_damage_type: DAMAGE_TYPE.NORMAL,
			sound_reload: snd_pistol_reload,
		},
		{
			sprite: spr_player_gun_pump_shotgun,
			sprite_shoot: noone,
			sprite_reload: noone,
			clip_size: 2,
			reload_time: 100,
			shoot_cooldown: 50,
			fire: function(_x, _y, _facing) {
				repeat(6) {
					var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
					_bullet.direction = 90 - 90 * _facing + random(20)-10
					_bullet.speed = 6 + random_range(-2,2)
					_bullet.bullet_life = 20
					audio_play_sound(snd_pistol_shoot, 0, false)
				}
			},
			bullet_hit_anim: spr_bullet_hit,
			bullet_damage: 1,
			bullet_damage_type: DAMAGE_TYPE.NORMAL,
			sound_reload: snd_pistol_reload,
		},
		{
			sprite: spr_semi_pistol_idle,
			sprite_shoot: spr_semi_pistol_fire,
			sprite_reload: noone,
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
		},
		{
			sprite: spr_shotgun_idle,
			sprite_shoot: spr_shotgun_fire,
			sprite_reload: spr_shotgun_reload,
			clip_size: 2,
			reload_time: 100,
			shoot_cooldown: 50,
			fire: function(_x, _y, _facing) {
				repeat(6) {
					var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
					_bullet.direction = 90 - 90 * _facing + random(20)-10
					_bullet.speed = 6 + random_range(-2,2)
					_bullet.bullet_life = 20
					audio_play_sound(snd_pistol_shoot, 0, false)
				}
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