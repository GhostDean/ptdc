wx = x;
wy = y;
wxpre = xprevious;
wypre = yprevious;
wSpeed = vspeed;
gravity = yflag*grav;
y = wy;
if(place_free(x,y) == false){
  y = yprevious;
  move_contact_solid(point_direction(x,y,x,wy),-1);
}
vspeed = wSpeed;
