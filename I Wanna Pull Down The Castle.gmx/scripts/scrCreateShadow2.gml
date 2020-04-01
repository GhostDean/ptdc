/*
argument0 is image_speed
    0 is static, -1 is keep speed, others is specified speed
argument1 is exist time
*/
a = instance_create(x,y,objBossShadow);
a.sprite_index = sprite_index;
a.image_index = image_index;
a.depth = depth + 1;
switch(argument0){
    case 0: a.image_speed = 0;break;
    case -1:a.image_speed = image_speed;break;
    default:a.image_speed = argument1;break;
}
a.image_xscale = image_xscale;
a.image_yscale = image_yscale;
a.image_angle = image_angle;
if(argument1 != 0)a.exist_time = argument1;

return(a);
