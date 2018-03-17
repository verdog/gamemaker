/// tile_drop_auto_bg(x,y)
// background

var xx = argument0;
var yy = argument1;
var dd = global.depth_bg;
var i = xx/T;
var j = yy/T;
var grid = global.room_grid;
var xlimit = ds_grid_width(global.room_grid)-1;
var ylimit = ds_grid_height(global.room_grid)-1;
var tileset = global.tileset;

/**********
* Bg rock *
***********/

if (grid[# i, j] == Cell.BGBLOCK || grid[# i,j] == Cell.DOOR1 
||  grid[# i,j] == Cell.DOOR2 || grid[# i,j] == Cell.DOORP || grid[# i,j] == Cell.SPAWN)
{
    // top right
    if (i < xlimit && j > 0)
        if (grid[# i, j-1] == Cell.AIR && grid[# i+1, j] == Cell.AIR)
        {   
            return tile_add(tileset,7*T,4*T,T,T,xx,yy,dd);
        }
    
    // top left
    if (i > 0 && j > 0)
        if (grid[# i, j-1] == Cell.AIR && grid[# i-1, j] == Cell.AIR)
        {   
            return tile_add(tileset,4*T,4*T,T,T,xx,yy,dd);
        }
    
    // top flat
    if (j > 0)
        if (grid[# i, j-1] == Cell.AIR)
        {   
            return tile_add(tileset,5*T+T*(i%2),4*T,T,T,xx,yy,dd);
        }
    
    // bottom left
    if (i > 0 && j < ylimit)
        if (grid[# i, j+1] == Cell.AIR && grid[# i-1, j] == Cell.AIR)
        {   
            return tile_add(tileset,4*T,7*T,T,T,xx,yy,dd);
        }
    
    // bottom right
    if (i < xlimit && j < ylimit)
        if (grid[# i, j+1] == Cell.AIR && grid[# i+1, j] == Cell.AIR)
        {   
            return tile_add(tileset,7*T,7*T,T,T,xx,yy,dd);
        }
    
    // bottom flat
    if (j < ylimit)
        if (grid[# i, j+1] == Cell.AIR)
        {   
            return tile_add(tileset,5*T+T*(i%2),7*T,T,T,xx,yy,dd);
        }
    
    // right sides
    if (i < xlimit)
        if (grid[# i+1, j] == Cell.AIR)
        {
            return tile_add(tileset,7*T,5*T+T*(j%2),T,T,xx,yy,dd);
        }
    
    // left sides
    if (i > 0)
        if (grid[# i-1, j] == Cell.AIR)
        {
            return tile_add(tileset,4*T,5*T+T*(j%2),T,T,xx,yy,dd);
        }
    
    // plain rock
        return tile_add(tileset,5*T+T*((i)%2),5*T+T*((j)%2),T,T,xx,yy,dd);
}


