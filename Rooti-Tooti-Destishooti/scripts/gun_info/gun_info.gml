// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum DAMAGE_TYPE {
	NORMAL
}



/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

function scr_gunfire_magnum(_x, _y, _facing) {
	if (live_call(_x, _y, _facing)) return live_result;
	var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
	_bullet.direction = 90 - 90 * _facing + random(4)-2
	_bullet.speed = 6
	_bullet.bullet_life = 20
	_bullet.bullet_damage = 5
	_bullet.bullet_damage_type = DAMAGE_TYPE.NORMAL
	audio_play_sound(snd_pistol_shoot, 0, false)
}
function scr_guninfo_magnum() {
	if (live_call()) return live_result;
	return 	{
		sprite: spr_player_gun_pistol,
		sprite_shoot: noone,
		sprite_reload: noone,
		clip_size: 6,
		reload_amount: 6,
		reload_time: 45,
		shoot_cooldown: 30,
		switch_in_time: 10,
		fire: scr_gunfire_magnum,
		bullet_hit_anim: spr_bullet_hit,
		sound_reload: snd_pistol_reload,
	}
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
function scr_gunfire_shotgun_pump(_x, _y, _facing) {
	if (live_call(_x, _y, _facing)) return live_result;
	repeat(8) {
		var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
		_bullet.direction = 90 * (1 - _facing) + random(60)-30
		_bullet.speed = 6 + random_range(-2,2)
		_bullet.bullet_life = 20
		_bullet.bullet_damage = 1
		_bullet.bullet_damage_type = DAMAGE_TYPE.NORMAL
	}
	audio_play_sound(snd_pistol_shoot, 0, false)
}
function scr_guninfo_shotgun_pump() {
	if (live_call()) return live_result;
	return {
		sprite: spr_player_gun_pump_shotgun,
		sprite_shoot: noone,
		sprite_reload: noone,
		clip_size: 2,
		reload_amount: 1,
		reload_time: 66,
		shoot_cooldown: 25,
		switch_in_time: 10,
		fire: scr_gunfire_shotgun_pump,
		bullet_hit_anim: spr_bullet_hit,
		sound_reload: snd_pistol_reload,
	}
}


/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

function scr_gunfire_auto_pistol(_x, _y, _facing) {
	if (live_call(_x, _y, _facing)) return live_result;
	var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
	_bullet.direction = 90 - 90 * _facing + random(4)-2
	_bullet.speed = 6
	_bullet.bullet_life = 20
	_bullet.bullet_damage = 5
	_bullet.bullet_damage_type = DAMAGE_TYPE.NORMAL
	audio_play_sound(snd_pistol_shoot, 0, false)
}
function scr_guninfo_pistol_auto() {
	if (live_call()) return live_result;
	return {
		sprite: spr_semi_pistol_idle,
		sprite_shoot: spr_semi_pistol_fire,
		sprite_reload: noone,
		clip_size: 10,
		reload_amount: 10,
		reload_time: 42,
		shoot_cooldown: 17,
		switch_in_time: 10,
		fire: scr_gunfire_auto_pistol,
		bullet_hit_anim: spr_bullet_hit,
		sound_reload: snd_pistol_reload,
	}
}


/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

function scr_gunfire_shotgun_combat(_x, _y, _facing) {
	if (live_call(_x, _y, _facing)) return live_result;
	repeat(6) {
		var _bullet = instance_create_layer(_x + 3 * _facing, _y - 6, "player_bullet", obj_pistol_bullet)
		_bullet.direction = 90 - 90 * _facing + random(20)-10
		_bullet.speed = 6 + random_range(-2,2)
		_bullet.bullet_life = 20
		_bullet.bullet_damage = 1
		_bullet.bullet_damage_type = DAMAGE_TYPE.NORMAL
		audio_play_sound(snd_pistol_shoot, 0, false)
	}
}
function scr_guninfo_shotgun_combat() {
	if (live_call()) return live_result;
	return {
		sprite: spr_shotgun_idle,
		sprite_shoot: spr_shotgun_fire,
		sprite_reload: spr_shotgun_reload,
		clip_size: 2,
		reload_amount: 2,
		reload_time: 100,
		shoot_cooldown: 50,
		switch_in_time: 10,
		fire: scr_gunfire_shotgun_combat,
		bullet_hit_anim: spr_bullet_hit,
		sound_reload: snd_pistol_reload,
	}
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

function init_gun_info(){
	global.gun_info = [
		scr_guninfo_magnum,
		scr_guninfo_shotgun_pump,
		scr_guninfo_pistol_auto,
		scr_guninfo_shotgun_combat,
	]
}

function get_gun_info(index) {
	return global.gun_info[index]()
}