/// @description DEMO: Perform enemy behaviors

// Check for collisions with other enemies
var inst = collision_circle(x, y, 16, obj_trig_enemy, true, true);

// Move to safe position if collision is detected
if (inst == noone) {
   point_x += (obj_trig_player.point_x - point_x)*0.01;
   point_y += (obj_trig_player.point_y - point_y)*0.01;
} else {
   point_x += (point_x - inst.point_x)*0.5;
   point_y += (point_y - inst.point_y)*0.5;
}

// Smoothly move enemy
x += (point_x - x)*0.25;
y += (point_y - y)*0.25;

// Check for collisions with bullets
var inst = collision_circle(x, y, 16, obj_trig_bullet, true, true);

// Destroy when hit by bullet
if (inst != noone) {
   effect_create_above(ef_flare, x, y, 2, c_white);
   instance_destroy(inst);
   instance_destroy();
}
