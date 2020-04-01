/// scrFollowPlayerDirection()
if instance_exists(objPlayer)
{
    if floor(objPlayer.x) != floor(x) image_xscale = sign(objPlayer.x - x);
}
