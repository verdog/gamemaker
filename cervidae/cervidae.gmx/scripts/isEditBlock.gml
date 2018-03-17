/// isEditBlock(instance)
// returns true if given instance is a block in the room editor

var inst = argument0;

for (var i=0; i<global.REDIT_objects; i++)
{
    if (inst.object_index == global.REDIT_tray[i]){
        return true;
    }
}

return false;
