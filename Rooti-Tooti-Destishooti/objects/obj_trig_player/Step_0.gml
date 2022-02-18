/// @description DEMO: Move player

// Prefetch sine and cosine
rot_prefetch(direction);

// Smoothly move player
x += (point_x - x)*0.25;
y += (point_y - y)*0.25;

// Wrap player to window view
if (x < 0) {
   point_x += window_get_width() - 8;
   x = point_x;
}
if (x > window_get_width()) {
   point_x -= window_get_width() - 8;
   x = point_x;
}
if (y < 0) {
   point_y += window_get_height() - 8;
   y = point_y;
}
if (y > window_get_height()) {
   point_y -= window_get_height() - 8;
   y = point_y;
}
