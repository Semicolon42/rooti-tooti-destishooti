/// @description DEMO: Draw reflection lines

// Set text alignment for on-screen buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw left on-screen button
if (point_in_circle(mouse_x, mouse_y, rm_xorig - 384, rm_yorig, 64)) {
	if (mouse_check_button(mb_left)) {
		draw_set_color(c_black);
		event_perform(ev_keyboard, vk_left);
	} else {
		draw_set_color(c_white);
	}
} else {
	draw_set_color(c_ltgray);
}
draw_circle(rm_xorig - 384, rm_yorig, 64, true);
draw_text(rm_xorig - 384, rm_yorig, "Rot-");

// Draw right on-screen button
if (point_in_circle(mouse_x, mouse_y, rm_xorig + 384, rm_yorig, 64)) {
	if (mouse_check_button(mb_left)) {
		draw_set_color(c_black);
		event_perform(ev_keyboard, vk_right);
	} else {
		draw_set_color(c_white);
	}
} else {
	draw_set_color(c_ltgray);
}
draw_circle(rm_xorig + 384, rm_yorig, 64, true);
draw_text(rm_xorig + 384, rm_yorig, "Rot+");

// Reset text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw mirror line
draw_set_color(c_aqua);
draw_line(rm_xorig - rot_dist_x(128, rot), rm_yorig - rot_dist_y(128, rot), rm_xorig + rot_dist_x(128, rot), rm_yorig + rot_dist_y(128, rot));
draw_text(25, 25, "Mirror");

// Draw ray line
draw_set_color(c_lime);
draw_arrow(mouse_x, mouse_y, rm_xorig, rm_yorig, 16);
draw_text(25 + string_width("Mirror "), 25, "Ray");

// Calculate reflection and refraction
var dir = point_direction(mouse_x, mouse_y, rm_xorig, rm_yorig);
var reflect = angle_reflect(dir, rot);
var refract = angle_refract(dir, rot, 1, 3);
var dist = point_distance(mouse_x, mouse_y, rm_xorig, rm_yorig);

// Draw reflection line
draw_set_color(c_red);
draw_arrow(rm_xorig, rm_yorig, rm_xorig + rot_dist_x(dist, reflect), rm_yorig + rot_dist_y(dist, reflect), 16);
draw_text(25 + string_width("Mirror Ray "), 25, "Reflection");

// Draw refraction line
draw_set_color(c_yellow);
draw_arrow(rm_xorig, rm_yorig, rm_xorig + rot_dist_x(dist, refract), rm_yorig + rot_dist_y(dist, refract), 16);
draw_text(25 + string_width("Mirror Ray Reflection "), 25, "Refraction");

// Reset draw color
draw_set_color(c_white);