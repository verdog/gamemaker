///eraseBlocksInLine(real prevx, real prevy, real dx, real dy);

var pxx = argument0;
var pyy = argument1;
var dxx = argument2;
var dyy = argument3;

for (var i = 0; i <= prec; i++) { // DISGUSTING
    x = T*((pxx + i/prec * dxx) div T);
    y = T*((pyy + i/prec * dyy) div T);
    if (place_meeting(x,y,all))
    {
        for (var j=0; j<global.REDIT_objects; j++)
        {
            with (instance_place(x,y,global.REDIT_tray[j])) instance_destroy();
        }
    }
}
