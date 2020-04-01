/// scrPlayerInRectangle(x,y,width,height)
var _x = argument0, _y = argument1, _width = argument2, _height = argument3;
if instance_exists(objPlayer)
{
    var _px = objPlayer.x, _py = objPlayer.y;
    if _width > 0 return (_px >= _x && _px <= _x + _width) && (_py >= _y && _py <= _y + _height);
    else return (_px >= _x + _width && _px <= _x) && (_py >= _y && _py <= _y + _height);
}
else
{
    return false;
}
