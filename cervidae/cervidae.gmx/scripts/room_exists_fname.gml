/// room_exists_fname(fname)
// Checks whether a certain file has been added to the room list already

var name = argument0;

for (var i=0; i<ds_list_size(usedNameList); i++)
{
    if (name == usedNameList[| i]) return true;
}

return false;
