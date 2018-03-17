/// door_2_exists(ds_grid)
// Checks for the presence of a second door in the level

grid = argument0;

for (var i=0; i<ds_grid_width(grid); i++)
{
    for (var j=0; j< ds_grid_height(grid); j++)
    {
        if (grid[# i, j] == Cell.DOOR2) return true;
    }
}

return false;
