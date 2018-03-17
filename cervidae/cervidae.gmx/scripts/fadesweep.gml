/// fadesweep(speed)
// fades screen to black then reverses to transparent

var arg = argument0;

// clear previous fade
if (instance_exists(obj_fade)){
    instance_destroy(obj_fade);
}

instance_create(0,0,obj_fade);

with (obj_fade){
    a = 0;
    fade = 1;
    if (arg > 0){
        multi = arg;
    }
    sweep = true;
}

global.black = false;
