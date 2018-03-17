/// tile_drop_auto(x,y)
// foreground

var xx = argument0;
var yy = argument1;
var sxx = argument0+4;
var syy = argument1+2;
var dd = global.depth_fg;
var sdd = global.depth_s;
var i = xx/T;
var j = yy/T;
var grid = global.room_grid;
var xlimit = ds_grid_width(global.room_grid)-1;
var ylimit = ds_grid_height(global.room_grid)-1;
var tileset = global.tileset;
var shadowt = global.shadowTileset;

// Shadow

if (grid[# i, j] >= 0) tile_add(shadowt,T,T,T,T,sxx,syy,sdd);

/********
* Brick *
*********/

if (grid[# i, j] == Cell.BRICK)
{
    return tile_add(tile_gen_brick,0,0,T,T,xx,yy,dd);
}

/*******
* Rock *
********/

if (grid[# i, j] == Cell.BLOCK)
{
    // top right
    if (i < xlimit && j > 0)
        if (grid[# i, j-1] < 0 && grid[# i+1, j] < 0)
        {   
            return tile_add(tileset,3*T,0,T,T,xx,yy,dd);
        }
    
    // top left
    if (i > 0 && j > 0)
        if (grid[# i, j-1] < 0 && grid[# i-1, j] < 0)
        {   
            return tile_add(tileset,0,0,T,T,xx,yy,dd);
        }
    
    // top flat
    if (j > 0)
        if (grid[# i, j-1] < 0)
        {   
            return tile_add(tileset,T+T*(i%2),0,T,T,xx,yy,dd);
        }
    
    // bottom left
    if (i > 0 && j < ylimit)
        if (grid[# i, j+1] < 0 && grid[# i-1, j] < 0)
        {   
            return tile_add(tileset,0,3*T,T,T,xx,yy,dd);
        }
    
    // bottom right
    if (i < xlimit && j < ylimit)
        if (grid[# i, j+1] < 0 && grid[# i+1, j] < 0)
        {   
            return tile_add(tileset,3*T,3*T,T,T,xx,yy,dd);
        }
    
    // bottom flat
    if (j < ylimit)
        if (grid[# i, j+1] < 0)
        {   
            return tile_add(tileset,T+T*(i%2),3*T,T,T,xx,yy,dd);
        }
    
    // right sides
    if (i < xlimit)
        if (grid[# i+1, j] < 0)
        {
            return tile_add(tileset,3*T,T+T*(j%2),T,T,xx,yy,dd);
        }
    
    // left sides
    if (i > 0)
        if (grid[# i-1, j] < 0)
        {
            return tile_add(tileset,0,T+T*(j%2),T,T,xx,yy,dd);
        }
    
    // plain rock
        return tile_add(tileset,T+T*((i)%2),T+T*((j)%2),T,T,xx,yy,dd);
}

/********
* Grass *
*********/

if (grid[# i, j] < 0 && grid[# i, j] != Cell.FULL)
{
    // 1x1 enclosed space
    // 1 1 1
    // 1 0 1
    // 1 1 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j+1] == Cell.BLOCK &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            // grass
            tile_add(tileset,7*T,0,T,T,xx,yy,dd);
            tile_add(tileset,4*T,3*T,T,T,xx,yy,dd);
            
            // shadows
            tile_add(shadowt,7*T,0,T,T,sxx,syy,sdd);
            return tile_add(shadowt,4*T,3*T,T,T,sxx,syy,sdd);
        }
        
    // 1x1 top dead end
    // 1 1 1
    // 1 0 1
    // 1 0 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j+1] < 0 &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            // grass
            tile_add(tileset,7*T,0,T,T,xx,yy,dd);
            tile_add(tileset,4*T,0,T,T,xx,yy,dd);
            
            // shadows
            tile_add(shadowt,7*T,0,T,T,sxx,syy,sdd);
            return tile_add(shadowt,4*T,0,T,T,sxx,syy,sdd);
        }
        
    // 1x1 bottom dead end
    // 1 0 1
    // 1 0 1
    // 1 1 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j+1] == Cell.BLOCK &&
            grid[# i, j-1] < 0)
        {
            tile_add(tileset,7*T,3*T,T,T,xx,yy,dd);
            tile_add(tileset,4*T,3*T,T,T,xx,yy,dd);
            
            tile_add(shadowt,7*T,3*T,T,T,sxx,syy,sdd);
            return tile_add(shadowt,4*T,3*T,T,T,sxx,syy,sdd);
        }
        
    // 1x1 right dead end
    // 1 1 1
    // 0 0 1
    // 1 1 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i-1, j] < 0 &&
            grid[# i, j+1] == Cell.BLOCK &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            tile_add(tileset,7*T,0,T,T,xx,yy,dd);
            tile_add(tileset,7*T,3*T,T,T,xx,yy,dd);
            
            tile_add(shadowt,7*T,0,T,T,sxx,syy,sdd);
            return tile_add(shadowt,7*T,3*T,T,T,sxx,syy,sdd);
        }
        
    // 1x1 left dead end
    // 1 1 1
    // 1 0 0
    // 1 1 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] < 0 &&
            grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j+1] == Cell.BLOCK &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            tile_add(tileset,4*T,0,T,T,xx,yy,dd);
            tile_add(tileset,4*T,3*T,T,T,xx,yy,dd);
            
            tile_add(shadowt,4*T,0,T,T,sxx,syy,sdd);
            return tile_add(shadowt,4*T,3*T,T,T,sxx,syy,sdd);
        }
    
    // horizontal tunnel
    // 1 1 1
    // 0 0 0
    // 1 1 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] < 0 &&
            grid[# i-1, j] < 0 &&
            grid[# i, j+1] == Cell.BLOCK &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            tile_add(tileset,6*T,T+T*(j%2),T,T,xx,yy,dd);
            
            return tile_add(shadowt,6*T,T+T*(j%2),T,T,sxx,syy,sdd);
        }
        
    // vertical tunnel
    // 1 0 1
    // 1 0 1
    // 1 0 1
    if (i < xlimit && i > 0 && j < ylimit && j > 0)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j+1] < 0 &&
            grid[# i, j-1] < 0)
        {
            tile_add(tileset,5*T,T+T*(j%2),T,T,xx,yy,dd);
            
            return tile_add(shadowt,5*T,T+T*(j%2),T,T,sxx,syy,sdd);
        }
        
    // inner top right corner
    // 1 1
    // 0 1
    if (i < xlimit && j > 0)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            tile_add(tileset,7*T,0,T,T,xx,yy,dd);
            
            return tile_add(shadowt,7*T,0,T,T,sxx,syy,sdd);
        }
        
    // inner top left corner
    if (i > 0 && j > 0)
        if (grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j-1] == Cell.BLOCK)
        {
            tile_add(tileset,4*T,0,T,T,xx,yy,dd);
            
            return tile_add(shadowt,4*T,0,T,T,sxx,syy,sdd);
        }
        
    // inner bottom right corner
    if (i < xlimit && j < ylimit)
        if (grid[# i+1, j] == Cell.BLOCK &&
            grid[# i, j+1] == Cell.BLOCK)
        {
            tile_add(tileset,7*T,3*T,T,T,xx,yy,dd);
            
            return tile_add(shadowt,7*T,3*T,T,T,sxx,syy,sdd);
        }
        
    // inner bottom left corner
    if (i > 0 && j < ylimit)
        if (grid[# i-1, j] == Cell.BLOCK &&
            grid[# i, j+1] == Cell.BLOCK)
        {
            tile_add(tileset,4*T,3*T,T,T,xx,yy,dd);
            
            return tile_add(shadowt,4*T,3*T,T,T,sxx,syy,sdd);
        }
        
    // right sides open
    if (i > 0)
        if (grid[# i-1, j] == Cell.BLOCK)
        {
            tile_add(tileset,7*T,T+T*(j%2),T,T,xx,yy,dd);
            
            return tile_add(shadowt,7*T,T+T*(j%2),T,T,sxx,syy,sdd);
        }
    
    // left sides open
    if (i < xlimit)
        if (grid[# i+1, j] == Cell.BLOCK)
        {
            tile_add(tileset,4*T,T+T*(j%2),T,T,xx,yy,dd);
            
            return tile_add(shadowt,4*T,T+T*(j%2),T,T,sxx,syy,sdd);
        }
    
    // ceiling open
    if (j > 0)
        if (grid[# i, j-1] == Cell.BLOCK)
        {
            tile_add(tileset,5*T+T*(i%2),3*T,T,T,xx,yy,dd);
            
            return tile_add(shadowt,5*T+T*(i%2),3*T,T,T,sxx,syy,sdd);
        }   
        
    // flat grass open
    if (j < ylimit)
        if (grid[# i, j+1] == Cell.BLOCK)
        {
            tile_add(tileset,5*T+T*(i%2),0,T,T,xx,yy,dd);
            
            return tile_add(shadowt,5*T+T*(i%2),0,T,T,sxx,syy,sdd);
        }   
}


