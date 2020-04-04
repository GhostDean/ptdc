/// scrBasicEnemyMovement(moveSpeed)
if scrCheckPlayerExists()
{
    if round(x) != round(objPlayer)
    {
        var _delta = objPlayer.x - x;
        var _val = min(abs(_delta), argument0) * sign(_delta);
        if instance_exists(mask)
        {
            mask.hspeed = _val;
        }
        else
        {
            hspeed = _val;
        }
    }
}
