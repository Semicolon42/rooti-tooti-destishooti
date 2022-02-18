/// @description DEMO: Cycle mode forward

ease += 1;

// Wrap ease modes
if (ease > count) {
   ease = 0;
}

// Regenerate curve surface
if (surface_exists(surf)) {
   surface_free(surf);
   surf = -1;
}
