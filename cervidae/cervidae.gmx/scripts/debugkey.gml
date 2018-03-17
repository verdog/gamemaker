/// debugkey(string key)
// Displays messages in the console when key is pressed

var key = keyboard_check(ord(argument0));
var n = 3; // Number of conditions to check

strings = ds_list_create();

strings[| 0] = "onground(x,y): " + string(onground(x,y));
strings[| 1] = "onground_prev: " + string(onground_prev);

if (key)
{
    // X
    if (argument0 == "X")
    {
        show_debug_message("--" + string(global.time) + "--" + argument0 + " DEBUG SAYS:--");
        for (var i = 0; i < ds_list_size(strings); i++)
        {
            show_debug_message(strings[| i]);
        }
        show_debug_message("_____");
    }
}

ds_list_destroy(strings);
