/// @description DEMO: Draw ease curves

// Use demo curve asset, if enabled
if (ease == ease_curve) {
	var crv = crv_interp_demo;
} else {
	// Otherwise interpret as bezier
	var crv = 1;
}

// Draw background
draw_rectangle(padx, pady, padx + width, pady + height, true);
draw_rectangle((padx*3) + width, pady, (padx*3) + (width*2), pady + height, true);
draw_text((padx*1.66) + width, pady - 3, "-1.0-\n\n\n\n\n\n\n\n\n\n\n-0.5-\n\n\n\n\n\n\n\n\n\n\n-0.0-");

// Initialize curve surface, if cleared
if (!surface_exists(surf)) {
   surf = surface_create(room_width, room_height);
   amt = 0;
}

// Draw ease curves
if (amt < (1 + next)) {
	// Get previous interpolation point on curve
	var prev = max(0, amt - next);
   
    // Draw curve to surface
	surface_set_target(surf);
		if (amt == 0) {
			// Clear surface on first draw
			draw_clear_alpha(c_black, 0);
		}
   
		// Linear
		draw_line_color(padx + width*prev, pady + interp(height, 0, prev, ease_none), padx + width*amt, pady + interp(height, 0, amt, ease_none), c_gray, c_white);
		draw_circle_color(padx + width*amt, pady + interp(height, 0, amt, ease_none), radius, c_red, c_red, false);
   
		// Ease
		#macro bez 0, 0, 1
		draw_line_color((padx*3) + width + (width*prev), pady + interp(height, 0, prev, ease, crv, bez), (padx*3) + width + (width*amt), pady + interp(height, 0, amt, ease, crv, bez), c_gray, c_white);
		draw_circle_color((padx*3) + width + (width*amt), pady + interp(height, 0, amt, ease, crv, bez), radius, c_lime, c_lime, false);
		surface_reset_target();
	
	// Get next interpolation point on curve
	amt += next;
}

// Draw final surface
draw_surface(surf, 0, 0);

// Get current ease mode as a string
var ease_mode;
switch (ease) {
	case 1:  ease_mode = "ease_sin (in & out)"; break;
	case 2:  ease_mode = "ease_sin_in"; break;
	case 3:  ease_mode = "ease_sin_out"; break;
	case 4:  ease_mode = "ease_quad (in & out)"; break;
	case 5:  ease_mode = "ease_quad_in"; break;
	case 6:  ease_mode = "ease_quad_out"; break;
	case 7:  ease_mode = "ease_cubic (in & out)"; break;
	case 8:  ease_mode = "ease_cubic_in"; break;
	case 9:  ease_mode = "ease_cubic_out"; break;
	case 10: ease_mode = "ease_quart (in & out)"; break;
	case 11: ease_mode = "ease_quart_in"; break;
	case 12: ease_mode = "ease_quart_out"; break;
	case 13: ease_mode = "ease_quint (in & out)"; break;
	case 14: ease_mode = "ease_quint_in"; break;
	case 15: ease_mode = "ease_quint_out"; break;
	case 16: ease_mode = "ease_expo (in & out)"; break;
	case 17: ease_mode = "ease_expo_in"; break;
	case 18: ease_mode = "ease_expo_out"; break;
	case 19: ease_mode = "ease_circ (in & out)"; break;
	case 20: ease_mode = "ease_circ_in"; break;
	case 21: ease_mode = "ease_circ_out"; break;
	case 22: ease_mode = "ease_rubber (in & out)"; break;
	case 23: ease_mode = "ease_rubber_in"; break;
	case 24: ease_mode = "ease_rubber_out"; break;
	case 25: ease_mode = "ease_elastic (in & out)"; break;
	case 26: ease_mode = "ease_elastic_in"; break;
	case 27: ease_mode = "ease_elastic_out"; break;
	case 28: ease_mode = "ease_bounce (in & out)"; break;
	case 29: ease_mode = "ease_bounce_in"; break;
	case 30: ease_mode = "ease_bounce_out"; break;
	case 31: ease_mode = "ease_bezier (custom)"; break;
	case 32: ease_mode = "ease_curve (custom)"; break;
	default: ease_mode = "ease_none (linear)"; break;
}

// Draw current ease mode string
draw_text(25, 25, "Left click for next ease mode, or right click for previous.\n\nease_none | " + ease_mode);

// Draw example animations
var rect_linear_x = padx + ((padx + (width*2))*min(1, amt));
draw_rectangle_color(rect_linear_x, pady + height + 32, rect_linear_x + 64, pady + height + 48, c_red, c_red, c_red, c_red, false);

var rect_ease_x = padx + interp(0, padx + (width*2), min(1, amt), ease, crv, bez);
draw_rectangle_color(rect_ease_x, pady + height + 72, rect_ease_x + 64, pady + height + 88, c_lime, c_lime, c_lime, c_lime, false);
