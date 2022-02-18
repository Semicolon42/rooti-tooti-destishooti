/// @description Insert description here
// You can write your code in this editor
//draw_self()

/// @description Insert description here
// You can write your code in this editor
draw_self()

if (hit_flash_cooldown > 0) {
	hit_flash_cooldown -= 1
	shader_set(shd_hit_shader)
	draw_sprite_ext(sprite_index, image_index * facing, x, y, image_xscale, image_yscale, image_angle, hit_flash_color, hit_flash_cooldown / hit_flash_cooldown_max)
	shader_reset()
}