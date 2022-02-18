/// @description DEMO: Cycle mode backward

ease -= 1;

// Wrap ease modes
if (ease < 0) {
   ease = count;
}

// Regenerate curve surface
if (surface_exists(surf)) {
   surface_free(surf);
   surf = -1;
}