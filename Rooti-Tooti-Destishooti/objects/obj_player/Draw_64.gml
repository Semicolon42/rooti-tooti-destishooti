/// @description debug draw
// You can write your code in this editor

draw_text(0,0,"ammo: "+string(ammo[gun_equipped])+"/"+string(gun.clip_size))
draw_text(0,10,"reload: "+string(reload_cooldown))
draw_text(0,20,"animation: "+string(animation_state))
draw_text(0,30,"jump_time: "+string(jump_time))