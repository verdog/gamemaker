///room_import_random_name
// returns a random level name from the random folder

var idx = irandom(ds_list_size(flist) - 1);

return "random_levels\" + flist[| idx];
