///polygonShoot(i,n,obj,spd,size,dir,spr);
var count,ii,lper,lnum,innum,lx,ly,ex,ey,r,tot,size,a,dir,spd,hspd,vspd,xx,yy;
  size=argument4;
  tot=argument1;
  r=argument3;
  i=argument0;
  ii=i;
for(count=0;count<tot;count+=1){
  lper=tot/ii
  lnum=count div lper
  innum=count mod lper
  innum/=lper
  lx=r*sin(lnum/ii*2*pi)
  ly=r*cos(lnum/ii*2*pi)
  ex=r*sin((lnum+1)/ii*2*pi)
  ey=r*cos((lnum+1)/ii*2*pi)
  hspd=(lx*innum)+(ex*(1-innum))
  vspd=(ly*innum)+(ey*(1-innum))
  if(hspd>0)dir=radtodeg(arctan(-vspd/hspd))+argument5;
  if(hspd<0)dir=radtodeg(arctan(-vspd/hspd))+180+argument5;
  if(hspd=0)dir=-90*sign(vspd)+argument5;
  spd=sqrt(sqr(hspd)+sqr(vspd));
  xx=x+size*spd*cos(degtorad(dir));
  yy=y-size*spd*sin(degtorad(dir));
  a=instance_create(xx,yy,argument2)
  a.speed=spd;a.direction=dir;
  if(argument6)a.sprite_index=argument6;
}
