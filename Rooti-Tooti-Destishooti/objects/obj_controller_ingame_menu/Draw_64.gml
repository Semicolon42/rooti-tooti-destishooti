/// @description Insert description here
// You can write your code in this editor
if(is_open) {
	var w = 200
	var h = 200
	var pad = 5
	draw_set_color(c_black)
	draw_rectangle(x-pad,y-pad,x+w+pad,y+h+pad,false)
	draw_set_color(c_white)
	for (var i = 0; i < array_length(current_menu); i += 1) {
		var text = current_menu[i].option_text
		if(menu_cursor == i) text = "> " + text else text = "  " + text
		if(current_menu[i].option_type == INGAME_MENU.SLIDER_CONTROL) text = text + " " + string(current_menu[i].option_argument.get_value())
		draw_text(x,y+i*15,text)
	}
}