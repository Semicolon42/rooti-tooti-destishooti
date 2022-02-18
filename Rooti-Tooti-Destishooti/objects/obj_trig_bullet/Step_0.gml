/// @description DEMO: Move bullet

// Destroy if outside window boundaries
if (x < 0) or (x > window_get_width()) 
or (y < 0) or (y > window_get_height()) {
   instance_destroy();
}

// Move bullet in direction set by player object
x += rot_dist_x(10);
y += rot_dist_y(10);