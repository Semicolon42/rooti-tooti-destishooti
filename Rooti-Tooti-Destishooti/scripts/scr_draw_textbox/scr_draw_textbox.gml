// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_textbox(x, y, text, padding = 10, line_seperation = 3, color = c_white, alpha = 1){
	// Get the current font to switch back to later
	var orig_font = draw_get_font()
	draw_set_font(fnt_text_box)
	
	// get the length of the text array
	var text_array_length = array_length(text)
	
	// Setup the textbox boundaries
	var max_text_width = 0
	var max_text_height = 0
	for (var i = 0; i < text_array_length; i += 1) {
		max_text_width = max(max_text_width, string_width(text[i]))
		max_text_height = max(max_text_height, string_height(text[i]))
	}
	var textbox_width = max_text_width + 2 * padding
	var textbox_height = max_text_height * text_array_length + line_seperation * (text_array_length - 1) + 2 * padding 
	
	// Draw the textbox background
	var box_x1 = x - textbox_width / 2
	var box_y1 = y - textbox_height / 2
	draw_sprite_stretched_ext(spr_textbox_background, 0, box_x1, box_y1, textbox_width, textbox_height, color, alpha)
	
	// Draw the text
	var text_x = box_x1 + padding
	var text_y = box_y1 + padding
	for (var i = 0; i < text_array_length; i += 1) {
		draw_text_color(text_x, text_y + i * (max_text_height + line_seperation), text[i], color, color, color, color, alpha)
	}
	
	// Return the original font
	draw_set_font(orig_font)
	
	// DEBUG information 
	if (debug_mode) {
		var temp = 50, inc=20, t = 0
		draw_text(0, temp + inc * t++, "max_text_width: " + string(max_text_width))
		draw_text(0, temp + inc * t++, "max_text_height: " + string(max_text_height))
		draw_text(0, temp + inc * t++, "line_seperation: " + string(line_seperation))
		draw_text(0, temp + inc * t++, "textbox_width: " + string(textbox_width))
		draw_text(0, temp + inc * t++, "textbox_height: " + string(textbox_height))
		draw_text(0, temp + inc * t++, "x: " + string(x))
		draw_text(0, temp + inc * t++, "y: " + string(y))
		draw_text(0, temp + inc * t++, "box_x1: " + string(box_x1))
		draw_text(0, temp + inc * t++, "box_y1: " + string(box_y1))
		draw_text(0, temp + inc * t++, "box_x2: " + string(box_x2))
		draw_text(0, temp + inc * t++, "box_y2: " + string(box_y2))
		draw_text(0, temp + inc * t++, "text_x: " + string(text_x))
		draw_text(0, temp + inc * t++, "text_y: " + string(text_y))
		draw_text(0, temp + inc * t++, "mouse_x: " + string(mouse_x))
		draw_text(0, temp + inc * t++, "mouse_y: " + string(mouse_y))
	}
}