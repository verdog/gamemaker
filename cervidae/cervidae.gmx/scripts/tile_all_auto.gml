///tile_all_auto
// this function automatically places tiles on the entire level

// Tile depths

global.depth_fg = -50;  // Foreground
global.depth_bg = 10;   // Background
global.depth_s = 5;   // Shadows

// Clear tiles

tile_layer_delete(global.depth_fg); // foreground
tile_layer_delete(global.depth_bg); // background
tile_layer_delete(global.depth_s); // shadows

// Place tiles

global.tileset = tile_cave;
global.shadowTileset = tile_cave_shadow;

for (i=0; i<ds_grid_width(global.room_grid); i++)
{
    for (j=0; j<ds_grid_height(global.room_grid); j++)
    {
        tile_drop_auto(i*T, j*T);
        tile_drop_auto_bg(i*T, j*T);
    }
}
