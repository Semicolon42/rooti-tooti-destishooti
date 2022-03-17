/// @description Insert description here
// You can write your code in this editor
if (instance_place(x,y,obj_player) and fade_text < fade_text_max) {
	fade_text += 1	
} else if (fade_text > 0) {
	fade_text -= 1	
}
	