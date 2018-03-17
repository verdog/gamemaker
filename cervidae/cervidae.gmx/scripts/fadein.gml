/// fadein(speed)
// fades screen to transparent

var arg = argument0;

// check if black/possible
if (!instance_exists(obj_fade)){
    instance_create(0,0,obj_fade);
}

with (obj_fade){
    a = 1;
    fade = -1;
    if (arg > 0){
        multi = arg;
    }
}
