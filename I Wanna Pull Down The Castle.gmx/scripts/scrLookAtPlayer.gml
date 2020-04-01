/// scrLookAtPlayer()
if !instance_exists(objPlayer) return -1;
else return point_direction(x, y, objPlayer.x, objPlayer.y);
