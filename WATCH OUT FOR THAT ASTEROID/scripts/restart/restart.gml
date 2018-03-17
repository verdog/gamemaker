/// spawn rocks
for (var i = 1; i <= global.level; i++)
{
	instance_create_depth(0,0,-10, ob_asteroid_lg);
	instance_create_depth(0,0,-10, ob_asteroid_lg);
	instance_create_depth(0,0,-10, ob_asteroid_md);
	instance_create_depth(0,0,-10, ob_asteroid_sm);
}