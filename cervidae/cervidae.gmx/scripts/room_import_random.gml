///room_import_random

var flist = ds_list_create();
var file;

file = file_find_first(working_directory + "\random\*.txt", "");

while (file != "")
{
    ds_list_add(flist, file);
    file = file_find_next();
}

var idx = irandom(ds_list_size(flist) - 1);

fname = "\random\" + flist[| idx];
room_import();
