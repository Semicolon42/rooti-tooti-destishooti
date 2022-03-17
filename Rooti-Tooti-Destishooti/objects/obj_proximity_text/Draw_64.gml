/// @description Insert description here
// You can write your code in this editor
if (fade_text > 0) {
	var c = view_camera[0]
	var posx = (x - camera_get_view_x(c)) * view_wport[0] / camera_get_view_width(c);
	var posy = (y - camera_get_view_y(c)) * view_hport[0] / camera_get_view_height(c);
	draw_text(posx, posy, text)	
}