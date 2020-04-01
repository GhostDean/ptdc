/// scrCreateShadow(shadow_type, shadow_blend)
if(room=rStage4_1_boss||room=rStage3_1_boss){
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

}else{

with instance_create(x, y, obj_shadow)
{
    type = argument0;
    sprite_index = other.sprite_index;
    image_speed = 0;
    image_index = other.image_index;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    image_angle = other.image_angle;
    image_blend = argument1;
    image_alpha = other.image_alpha;
    depth = other.depth + 1;
}
}
