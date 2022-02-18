/// @description Insert description here
// You can write your code in this editor
var i
for (i = 0; i < 2; i++) {	
	var xx = x
	var yy = y+i*30
	if (i == menu_index) then draw_arrow(x - 20, yy+10, xx - 10, yy+10, 10)
	draw_text(xx, yy, menu_items[i])	
}