/// @description Insert description here
// You can write your code in this editor
var ww = window_get_width() //view_wport[0]
var wh = window_get_height() //view_hport[0]
var w = ww / 10
var h = wh / 10
var y_offset = wh * 1 / 5

var cx = ww / 2 
var cy = wh / 2 

var xx = cx - w/2
var yy = cy - y_offset - h/2
var xx_max = cx + w/2
var yy_max = cy - y_offset + h/2
var xx_interact = cx - w/2 + w * (interact_counter / interact_counter_max)

if (interact_counter > 0) {
	draw_set_color(c_dkgrey)
	draw_rectangle(xx-1, yy-1, xx_max+1, yy_max+1, false)
	draw_set_color(c_aqua)
	draw_rectangle(xx, yy, xx_interact, yy_max, false)
	draw_set_color(c_white)
}
if (instance_place(x,y,obj_player)) {
	draw_sprite_stretched(spr_ctrl_keyboard_dark_c, 0, cx - ww/12/2, cy - y_offset - ww/12/2, ww/12 , ww/12)
}