/// scrPlayerDistance()
// get the distance between this instance and existed player
if instance_exists(objPlayer)
    return point_distance(objPlayer.x,objPlayer.y,x,y);
else
    return 999999;
