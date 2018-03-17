/// screenShake( real len, real intensity)
// shakes the camera object

var len = argument0;
var intensity = argument1;

// exit if no camera
if (!instance_exists(obj_camera)){
    exit;
}

obj_camera.alarm[2] = len;
obj_camera.screenShakeIntensity = intensity;
obj_camera.screenShakeDecay = (intensity-1)/(len);
