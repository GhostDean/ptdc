var L,R,h;

image_yscale = yflag;
if(global.reverse == 0){
    yflag = 1;
    L = scrButtonCheck(global.leftButton);
    R = scrButtonCheck(global.rightButton);
}
else{
    yflag = -1;
    R = scrButtonCheck(global.leftButton);
    L = scrButtonCheck(global.rightButton);
}

//right overrides left
h = R;
if(h == 0){
    h = -L;
}
if(global.frozen == true){
    h = 0;
}
//if we're going to run
if(h != 0 ){
    if((distance_to_object(objWalljumpR) > 1 && distance_to_object(objWalljumpL) > 1) || !place_free(x,y+yflag)){
        image_xscale = h;
    }
    
        if(place_meeting(x,y+yflag*4,objIrSlipBlock)){
            Ir_meetice = true;
            if((h = 1 and hspeed < maxHspeed) or (h = -1 and hspeed > -maxHspeed)){
                hspeed += 0.2 * h;
            }
        }
        else{
            if(abs(hspeed) > maxSpeed){
                if(h != sign(hspeed) or !Ir_meetice){
                    hspeed -= sign(hspeed) * 0.2;
                    Ir_meeting = false;   
                }
            }
            else{
                hspeed = maxSpeed*h;
            }
        }
        //running sprites
        sprite_index = sprIrPlayerRunning;
        image_speed = 0.5;
}
else{
    if(abs(hspeed) > maxSpeed){
        if(h != sign(hspeed) or !Ir_meetice){
            hspeed -= sign(hspeed) * 0.3;
            Ir_meeting = false;   
        }
    }
    else{
        hspeed = 0;
    }
    //idling sprite
    sprite_index = sprIrPlayerIdle;
    image_speed = 0.2;
}

//jumping sprites
if (onPlatform == false){
    if(global.reverse == 0){
        if(vspeed < -0.05){
            sprite_index = sprIrPlayerJump;
        }
        if(vspeed > 0.05 && !place_meeting(x,y+2,obj_wall)){
            sprite_index = sprIrPlayerFall;
        }
    }
    else{
        if(vspeed < -0.05 && !place_meeting(x,y-2,obj_wall)){
            sprite_index = sprIrPlayerFall;
        }
        if(vspeed > 0.05){
            sprite_index = sprIrPlayerJump;
        }
    }
}
else{
    if(place_meeting(x,y+yflag*4,platform) == false){
        onPlatform = 0;
    }
}

//vertical speed limitations 
if(vspeed*yflag > maxVspeed){
  vspeed = sign(vspeed)*maxVspeed;
}
//shooting and jumping
if(global.frozen == false){
    playerJumpIr();
    if(scrButtonCheckReleased(global.jumpButton) && yflag*vspeed < 0){
        vspeed *= 0.45;
    }
}
