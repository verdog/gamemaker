/// bounding_box_intersect(x1, y1, x2, y2, x3, y3, x4, y4)

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var x3 = argument4;
var y3 = argument5;
var x4 = argument6;
var y4 = argument7;

if (x1 > x2) {
	var temp = x2;
	x2 = x1;
	x1 = temp;
}

if (y1 > y2) {
	var temp = y2;
	y2 = y1;
	y1 = temp;
}

if (x3 > x4) {
	var temp = x4;
	x4 = x3;
	x3 = temp;
}

if (y3 > y4) {
	var temp = y4;
	y4 = y3;
	y3 = temp;
}

if (x1 > x4) return false;
if (x2 < x3) return false;
if (y1 > y4) return false;
if (y2 < y3) return false;
return true;