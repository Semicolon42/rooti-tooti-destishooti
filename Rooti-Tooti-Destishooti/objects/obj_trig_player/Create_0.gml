/// @description DEMO: Initialize demo

// Get starting position
rot_prefetch(direction);
point_x = window_get_width()*0.5;
point_y = window_get_height()*0.5;
x = point_x;
y = point_y;

// Initialize weapon fire
fire_offset = 0;

// Create enemy objects
repeat(10) {
   instance_create_depth(random_range(0, window_get_width()), random_range(0, window_get_height()), depth, obj_trig_enemy);
}
