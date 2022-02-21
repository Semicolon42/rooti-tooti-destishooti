/// @description Insert description here
// You can write your code in this editor
event_inherited()

float += 1
var y_offset = 5
var float_amplitude = 5
var float_offset = sin(degtorad(float)) * float_amplitude
draw_sprite(gun_sprite, 0, x, y - y_offset + float_offset)