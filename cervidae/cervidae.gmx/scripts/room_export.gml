///room_export

var fileId;
fileId = file_text_open_write(working_directory + fname);

if (fileId = -1)
{
    show_message("error: room not found");
    exit;
}

var grid = global.room_grid;
var gwid = ds_grid_width(grid);
var ghei = ds_grid_height(grid);

// First quad
// 0 X
// 0 0

for (var j=0; j<ghei/2; j++)
{
    for (var i=gwid/2; i<gwid; i++)
    {
        file_text_write_real(fileId, grid[# i, j]);
    }
    
    file_text_writeln(fileId);
}

file_text_writeln(fileId);

// Q 2

for (var j=0; j<ghei/2; j++)
{
    for (var i=0; i<gwid/2; i++)
    {
        file_text_write_real(fileId, grid[# i, j]);
    }
    
    file_text_writeln(fileId);
}

file_text_writeln(fileId);

// Q 3

for (var j=ghei/2; j<ghei; j++)
{
    for (var i=0; i<gwid/2; i++)
    {
        file_text_write_real(fileId, grid[# i, j]);
    }
    
    file_text_writeln(fileId);
}

file_text_writeln(fileId);

// Q 4

for (var j=ghei/2; j<ghei; j++)
{
    for (var i=gwid/2; i<gwid; i++)
    {
        file_text_write_real(fileId, grid[# i, j]);
    }
    
    file_text_writeln(fileId);
}

file_text_writeln(fileId);

file_text_close(fileId);

show_debug_message(fname + " succesfully exported");
