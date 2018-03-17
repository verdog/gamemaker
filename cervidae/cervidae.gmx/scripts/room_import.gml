///room_import

var fileId;
fileId = file_text_open_read(working_directory + fname);

if (fileId = -1)
{
    show_message("error: room not found");
    exit;
}

var grid = ds_grid_create(ds_grid_width(global.room_grid), ds_grid_height(global.room_grid));
var gwid = ds_grid_width(grid);
var ghei = ds_grid_height(grid);

// First quad

for (var j=0; j<ghei/2; j++)
{
    for (var i=gwid/2; i<gwid; i++)
    {
        grid[# i, j] = file_text_read_real(fileId);
    }
}

// q 2

for (var j=0; j<ghei/2; j++)
{
    for (var i=0; i<gwid/2; i++)
    {
        grid[# i, j] = file_text_read_real(fileId);
    }
}

// q 3

for (var j=ghei/2; j<ghei; j++)
{
    for (var i=0; i<gwid/2; i++)
    {
        grid[# i, j] = file_text_read_real(fileId);
    }
}

// q 4

for (var j=ghei/2; j<ghei; j++)
{
    for (var i=gwid/2; i<gwid; i++)
    {
        grid[# i, j] = file_text_read_real(fileId);
    }
}

global.room_grid = grid;
place_objects();
tile_all_auto();
place_player();

file_text_close(fileId);

show_debug_message(fname + " succesfully imported");
