/// room_get_available(ds_list)
// fills a list with available file names

var flist = argument0;
var file;

file = file_find_first(working_directory + "random_levels\*.slvl", "");

while (file != "")
{
    ds_list_add(flist, file);
    file = file_find_next();
}

return flist;
