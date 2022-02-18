/// @description DEMO: Draw player and info

// Draw demo info
draw_text(25, 25, "Use the WSAD keys to move and SPACE to fire. Press R to restart the demo.");

// Draw player
draw_arrow(x, y, x + rot_dist_x(16), y + rot_dist_y(16), 16);
