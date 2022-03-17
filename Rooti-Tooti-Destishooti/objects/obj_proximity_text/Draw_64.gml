/// @description Insert description here
// You can write your code in this editor
if (fade_text > 0) {
	var c = view_camera[0]
	var posx = (x - camera_get_view_x(c)) * view_get_wport(c) / camera_get_view_width(c);
	var posy = (y - camera_get_view_y(c)) * view_get_hport(c) / camera_get_view_height(c);
	draw_set_alpha(fade_text/fade_text_max)
	draw_text(posx, posy, text)	
	draw_set_alpha(1)
}