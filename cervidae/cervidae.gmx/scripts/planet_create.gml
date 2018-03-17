/// planet_create()
// Generates a planet of rooms

var idx;

// Array to store rooms

global.room_list = ds_list_create();

// Arrays to store door destinations

global.door_1_list = ds_list_create();
global.door_2_list = ds_list_create();

// Array to store level properties
// room_properties[# room number, property]
// property 0: Door switch. determines if door 1 and 2 swap positions.
// property 1: True if door 2 exists.
global.room_properties = ds_grid_create(size+1, 2);
ds_grid_set_region(global.room_properties,0,0,ds_grid_width(global.room_properties)-1,ds_grid_height(global.room_properties)-1,false);

// Init door lists

for (var i=0; i<size; i++)
{
    global.door_1_list[| i] = -1;
    global.door_2_list[| i] = -1;
}

///////////////////////////
// create starting room  //
///////////////////////////

ds_list_add(global.room_list,room_import_return("special_levels\start.splvl"));

avaiNameList = ds_list_create();
room_get_available(avaiNameList);

// check if there is actually enought rooms to not reuse anything
if (size > ds_list_size(avaiNameList)) {
    can_reuse = true;
    show_debug_message("can_reuse = true because of lack of rooms to choose.");
}

// Fill room list
// Determine random properties

for (var i=0; i<=size; i++)
{
    idx = irandom(ds_list_size(avaiNameList)-1);
    
    fname = avaiNameList[| idx];
    show_debug_message("set to " + fname);
    
    if (!can_reuse)
    {
        // delete name from avail list
        ds_list_delete(avaiNameList, idx);
    }
        
    // Add to level list
    ds_list_add(global.room_list, room_import_return("random_levels\" + fname));
    
    /// Determine random level properties
    
    // door 2 exists
    if (irandom(8) == 1) {
        global.room_properties[# i, 1] = true;
    }
    // door swap
    if (irandom(1) == 1){
        global.room_properties[# i, 0] = true;
    }
}

// Delete namelist

ds_list_destroy(avaiNameList);

// Edge matrix

// [a, b]: a has a door leading to b
global.mat_edge = ds_grid_create(size, size);
ds_grid_set_region(global.mat_edge,0,0,size,size,0); // Nothing is connected

/************************************************************************************
* At this point, we have a list of randomly chosen rooms, but they aren't connected *
*************************************************************************************/

for (i=0; i<size; i++) // For each room...
{
    // Check what doors we have to work with

    d1e = door_1_exists(global.room_list[| i]);
    d2e = door_2_exists(global.room_list[| i]);
    
    // If no doors, don't bother with anything
    
    if (!d1e && !d2e) continue;
    
    // If door1 exists:
    if (d1e)
    {
        // door 1 leads to another room that isn't itself 
        // or starting room
        idx = i+1;
        while (idx == i || idx <= 0 || idx > size)
        {
            idx = irandom(size);
        }
        global.door_1_list[| i] = idx;
    }
    
    // If door2 exists:
    if (d2e)
    {
        // door 2 leads to another room that isn't itself 
        // or starting room
        // or door 1's destination
        
        idx = irandom(size);
        while (idx == i || idx == global.door_1_list[| i] || idx <= 0 || idx > size)
        {
            idx = irandom(size);
        }
        global.door_2_list[| i] = idx;
    }
}

///////////////////
// room [size] //
//////////////////

// Check what doors we have to work with

d1e = door_1_exists(global.room_list[| size]);
d2e = door_2_exists(global.room_list[| size]);

// If door1 exists:
if (d1e)
{
    // door 1 leads to another room that isn't itself 
    // or starting room
    idx = irandom(size);
    while (idx == i || idx == 0)
    {
        idx = irandom(size);
    }
    global.door_1_list[| i] = idx;
}

// If door2 exists:
if (d2e)
{
    // door 2 leads to another room that isn't itself 
    // or starting room
    // or door 1's destination
    
    idx = irandom(size);
    while (idx == i || idx == global.door_1_list[| i] || idx == 0)
    {
        idx = irandom(size);
    }
    global.door_2_list[| i] = idx;
}

// room [size] always leads to 0
global.door_1_list[| size] = 0;


