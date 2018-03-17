///room_import_random
// returns a room grid structure

var flist = ds_list_create();
var file;

file = file_find_first(working_directory + "random_levels\*.slvl", "");

while (file != "")
{
    ds_list_add(flist, file);
    file = file_find_next();
}

var idx = irandom(ds_list_size(flist) - 1);

return room_import_return("random_levels\" + flist[| idx]);
