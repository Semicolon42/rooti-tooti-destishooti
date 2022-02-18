/// @description Insert description here
// You can write your code in this editor

// update the room camera to fit the monitor's resolution

if (false) {
	var resize = function(cw, ch, ww, wh) {
		room_set_width(room, cw)
		room_set_height(room, ch)
		camera_set_view_size(view_camera[0], cw, ch)
		room_set_viewport(room, 0, true, 0, 0, cw, ch)
		window_set_size(ww, wh)
	}

	if (keyboard_check_pressed(ord("Q"))) {
		resize(640, 480, 1280, 960)
	}
	if (keyboard_check_pressed(ord("W"))) {
		resize(640, 360, 1280, 720)
	}
	if (keyboard_check_pressed(ord("E"))) {
		resize(320, 180, 1920, 1080)
	}
	if (keyboard_check_pressed(ord("R"))) {
		resize(640, 480, 640, 480)
	}
	if (keyboard_check_pressed(ord("T"))) {
		resize(640, 480, 960, 740)
	}
}