/// Place enemies

// kill enemies
with (obj_slime) instance_destroy();
with (obj_slime_pink) instance_destroy();

// spawn enemies
with (obj_spawn){
    var dice = irandom(100) - 1;
    
    if (dice >= 80){
        instance_create(x,y,obj_slime_pink);
    } 
    else{
        instance_create(x,y,obj_slime);
    }
}
