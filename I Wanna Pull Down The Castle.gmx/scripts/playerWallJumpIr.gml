//wall jump left
if distance_to_object(objWalljumpL) < 2 && place_free(x,y+yflag) {
    if(vspeed > 0){
        vspeed = 1;
    }
    sprite_index=sprIrPlayerSliding;
    image_xscale=1;
    image_speed=0.5;
    if (scrButtonCheckPressed(global.jumpButton)){
        sprite_index=sprIrPlayerJump;
        vspeed = -yflag*9;
        
        switch(irandom(5)){
            case 0:audio_play_sound(sndIrWall1,1,0);break;
            case 1:audio_play_sound(sndIrWall2,1,0);break;
            case 2:audio_play_sound(sndIrWall3,1,0);break;
            case 3:audio_play_sound(sndIrWall4,1,0);break;
            case 4:audio_play_sound(sndIrWall5,1,0);break;
            case 5:audio_play_sound(sndIrWall6,1,0);break;
        }
    }
}
//wall jump right
if distance_to_object(objWalljumpR) = 1 && place_free(x,y+yflag) {
    if(vspeed > 0){
        vspeed = 1;
    }
    sprite_index=sprIrPlayerSliding;
    image_xscale=-1;
    image_speed=0.5;
    if (scrButtonCheckPressed(global.jumpButton)){
        sprite_index=sprIrPlayerJump;
        vspeed = -yflag*9;
        
        switch(irandom(5)){
            case 0:audio_play_sound(sndIrWall1,1,0);break;
            case 1:audio_play_sound(sndIrWall2,1,0);break;
            case 2:audio_play_sound(sndIrWall3,1,0);break;
            case 3:audio_play_sound(sndIrWall4,1,0);break;
            case 4:audio_play_sound(sndIrWall5,1,0);break;
            case 5:audio_play_sound(sndIrWall6,1,0);break;
        }
    }
}
