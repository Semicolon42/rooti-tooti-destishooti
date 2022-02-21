/// @description Insert description here
// You can write your code in this editor
image_alpha = .5
draw_self()
image_alpha = 1


var w = 20
var h = 6
var y_offset = 20

var xx = x - w/2
var yy = y - y_offset - h/2
var xx_max = x + w/2
var yy_max = y - y_offset + h/2
var xx_interact = x - w/2 + w * (interact_counter / interact_counter_max)

if (interact_counter > 0) {
	draw_set_color(c_dkgrey)
	draw_rectangle(xx-1, yy-1, xx_max+1, yy_max+1, false)
	draw_set_color(c_aqua)
	draw_rectangle(xx, yy, xx_interact, yy_max, false)
	draw_set_color(c_white)
}