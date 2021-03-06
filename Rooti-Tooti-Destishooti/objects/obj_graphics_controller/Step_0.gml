/// @description Insert description here
// You can write your code in this editor

// update the room camera to fit the monitor's resolution

if (true) {
	var resize = function(cw, ch, ww, wh) {
		//room_set_width(room, cw)
		//room_set_height(room, ch)
		camera_set_view_size(view_camera[0], cw, ch)
		view_wport[0] = ww;
		view_hport[0] = wh;
		surface_resize(application_surface, view_wport[0], view_hport[0]);
		window_set_size(ww, wh)
	}

	if (keyboard_check_pressed(ord("Q"))) {
		resize(320, 240, 640, 480)
	}
	if (keyboard_check_pressed(ord("W"))) {
		resize(320, 240, 640, 480)
	}
	if (keyboard_check_pressed(ord("E"))) {
		resize(320, 240, 1280, 960)
	}
	if (keyboard_check_pressed(ord("R"))) {
		resize(360, 240, 360, 240)
	}
	if (keyboard_check_pressed(ord("T"))) {
		resize(360, 240, 720, 480)
	}
	if (keyboard_check_pressed(ord("Y"))) {
		resize(360, 240, 1060, 720)
	}
}