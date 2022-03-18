/// @description Insert description here
// You can write your code in this editor
if (interact_cooldown <= 0 and instance_place(x,y,obj_player)) {
	var back_width = 55, back_height = 55
	var fore_width = 50, fore_height = 50
	var y_offset = 55
	var y_offset_wiggle = 3
	var anim_max = 50
	var anim_width_max = 80, anim_height_max = 80
	anim_counter += 1
	if (anim_counter > anim_max) anim_counter = 0
	
	var c = view_camera[0]
	var posx = (x - camera_get_view_x(c)) * view_wport[0] / camera_get_view_width(c);
	var posy = (y - camera_get_view_y(c)) * view_hport[0] / camera_get_view_height(c) - y_offset
	posy += y_offset_wiggle * sin(2 * pi * anim_counter / anim_max);
	
	
	if (interact_counter > 0) {
		draw_rectangle(posx - back_width/2, posy - back_height/2, posx - back_width/2 + back_width * (interact_counter / interact_counter_max), posy + back_height / 2, false)
	} else {
		//var aw = back_width + (anim_width_max - back_width)/2 * anim_counter / anim_max
		//var ah = back_height + (anim_height_max - back_height)/2 * anim_counter / anim_max
		draw_set_color(c_aqua)
		var aw = anim_width_max * anim_counter / anim_max
		var ah = anim_height_max * anim_counter / anim_max
		draw_rectangle(posx - aw/2, posy - ah/2, posx + aw/2, posy + ah/2, true)
		draw_set_color(c_white)
	}
	
	//draw_sprite_stretched(spr_ctrl_keyboard_dark_c, 0, cx - ww/12/2, cy - y_offset - ww/12/2, ww/12 , ww/12)
	draw_sprite_stretched(spr_ctrl_keyboard_dark_c, 0, posx - fore_width/2, posy - fore_height/2, fore_width , fore_height)
}