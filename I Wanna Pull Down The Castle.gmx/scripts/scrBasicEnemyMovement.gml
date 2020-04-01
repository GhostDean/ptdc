/// scrBasicEnemyMovement(moveSpeed)
if scrCheckPlayerExists()
{
    if round(x) != round(objPlayer)
    {
        var _delta = objPlayer.x - x;
        hspeed = min(abs(_delta), argument0) * sign(_delta);
    }
}
