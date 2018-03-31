/// lineseg_getK(x1, y1, x2, y2, x3, y3, x4, y4)
/*
 * returns: K: the value to scale the first line ( first four arguments )
 * in such away that its endpoint will lie on the second line ( last four arguments )
 *
 * essentially, this checks if line 1 collides with line 2.
 * if line 1 collides with line 2, 0 <= K <= 1, since the line must be scaled down.
 * if K is negative, it means the seconds line is "behind" the first, that is, they don't collide at all.
 *
 * see: ncase.me/sight-and-light/
*/

// r stands for ray
var r_px = argument0;
var r_py = argument1;
var r_dx = argument2 - argument0;
var r_dy = argument3 - argument1;

// s stands for segment
var s_px = argument4;
var s_py = argument5;
var s_dx = argument6 - argument4;
var s_dy = argument7 - argument5;

// check if two lines' bounding boxes intersect
if (!bounding_box_intersect(argument0,argument1,
							argument2,argument3,
							argument4,argument5,
							argument6,argument7)) {
	return -1;
}

// check if two lines are parallel
// if they are, there is no intersection.

if ((s_dx*r_dy - s_dy*r_dx) == 0) {
	// if the determinant of two vectors is 0, it means the form a parallelagram
	// with area zero. thus, they are on the same line.
	return -1;
}

var T2 = (r_dx*(s_py-r_py) + r_dy*(r_px-s_px))/(s_dx*r_dy - s_dy*r_dx);
if (0 > T2 || T2 > 1) {
	// T2 represents the amount of scaling the second line would do to meet the first.
	// if 0 > T2 > 1, then the line would have to be scaled bigger than itself.
	// thus, there is no intersection.
	return -1;
}

if (r_dx != 0) {
	var T1 = (s_px+s_dx*T2-r_px)/r_dx;
} else {
	var T1 = (s_py+s_dy*T2-r_py)/r_dy;
}

if (0 > T1 || T1 > 1) {
	// this is the amount that the first line would have to scale to meet the second.
	// if it's less than 0, then the line would have to point in the oppisite direction. No collision.
	// if it's more than 1, then the line would have to scale longer than it started. No collision.
	return -1;
}

// all checks passed. return T1!
return T1;