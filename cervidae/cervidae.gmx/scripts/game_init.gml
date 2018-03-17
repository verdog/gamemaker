/// Game resolution

global.game_width = 32*T;
global.game_height = 18*T;
global.zoom = 3;
surface_resize(application_surface, global.game_width, global.game_height);
display_reset(0, true);

// Random

randomize();
