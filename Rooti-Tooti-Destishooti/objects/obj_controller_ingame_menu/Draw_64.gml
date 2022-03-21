/// @description Insert description here
// You can write your code in this editor
if(is_open) {
	var w = 350
	var h = 125
	var pad = 10
	var line_seperation = 22
	draw_set_color(c_black)
	draw_sprite_stretched(spr_textbox_background, 0, x-pad,y-pad,w+pad,h+pad)
	draw_set_color(c_white)
	var orig_font = draw_get_font()
	draw_set_font(fnt_text_box)
	
	for (var i = 0; i < array_length(current_menu); i += 1) {
		var text = current_menu[i].option_text
		if(menu_cursor == i) text = "> " + text else text = "  " + text
		if(current_menu[i].option_type == INGAME_MENU.SLIDER_CONTROL) {
			var percent = round(current_menu[i].option_argument.get_value() / current_menu[i].option_argument.maxValue * 100)
			text = text + " " + string( percent ) + "%"
		}
		draw_text(x,y+i*line_seperation,text)
	}
	
	draw_set_font(orig_font)
}