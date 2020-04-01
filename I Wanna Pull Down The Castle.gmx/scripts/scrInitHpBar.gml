/// scrInitHpBar(bossinst, bossid, bossname)
// bossinst: Boss的实例
// bossid: Boss的ID
// bossname: Boss的名字
if !instance_exists(obj_bossHpBar)
{
    with instance_create(0, 0, obj_bossHpBar)
    {
        bossInst = argument0;
        bossId = argument1;
        bossName = argument2;
    }
}
