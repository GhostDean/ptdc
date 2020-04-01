/// scrGetNearestInstanceDistance(object_index)
var _dist = -1;
if instance_number(argument0) == 0 return 9999999999;
with argument0
{
    var __dist;
    __dist = point_distance(x,y,other.x,other.y);
    if _dist == -1 || __dist < _dist _dist = __dist;
}
return _dist;
