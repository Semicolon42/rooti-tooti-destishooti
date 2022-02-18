/// @description DEMO: Restart demo

// Destroy enemy and bullet objects
with (obj_trig_enemy) {
   instance_destroy();
}
with (obj_trig_bullet) {
   instance_destroy();
}

// Reset player object
direction = 0;
event_perform(ev_create, 0);
