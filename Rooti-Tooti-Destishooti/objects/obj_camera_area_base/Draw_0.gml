/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var cam = {
	x1: x,
	y1: y,
	x2: x + sprite_width,
	y2: y + sprite_height,
	w: sprite_width,
	h: sprite_height,
}
draw_rectangle(cam.x1, cam.y1, cam.x2, cam.y2, true)

var cam_w = camera_get_view_width(view_camera[0]) / 2
var cam_h = camera_get_view_height(view_camera[0]) / 2
draw_rectangle(cam.x1 + cam_w, cam.y1 + cam_h, cam.x2 - cam_w, cam.y2 - cam_h, true)