/// @description Insert description here
// You can write your code in this editor
if (!show_credits) {
	var i
	for (i = 0; i < 2; i++) {	
		var xx = x
		var yy = y+i*30
		if (i == menu_index) then draw_arrow(xx, yy+10, xx + 10, yy+10, 10)
		draw_text(xx + 20, yy, menu_items[i])	
	}
} else {
	var xx = x
	var yy = y
	var h = 10
	for (i = 0; i < array_length(credits_items); i++) {	
		var xx = x
		var yy = y + i * h
		draw_text_transformed(xx, yy, credits_items[i], .5, .5, 0)	
	}
}