if(shootinterval==0){
    if(isS7room(room)){
        (instance_create(x,y,objBullet)).hspeed=image_xscale*16;
        audio_play_sound(sndShoot,0,false);
    }else{
    switch(shootmode){
        case 0:
            (instance_create(x,y,objBullet)).hspeed=xScale*16;
            audio_play_sound(sndShoot,0,false);
        break;
        case 1:
            if(arrow[0]>0){
                var o=instance_create(x,y,objArrowR);
                o.hspeed=xScale*16;o.catch=true;
                o.image_xscale=xScale
                arrow[0]-=1
                audio_play_sound(sndShoot,0,false);
            }
            break;
        case 2:
            if(arrow[1]>0){
                var o=instance_create(x,y,objArrowG);
                o.hspeed=xScale*16;o.catch=true;
                o.image_xscale=xScale
                arrow[1]-=1
                audio_play_sound(sndShoot,0,false);
            }
            break;
        case 3:
            if(arrow[2]>0){
                var o=instance_create(x,y,objArrowB);
                o.hspeed=xScale*16;o.catch=true;
                o.image_xscale=xScale
                arrow[2]-=1
                audio_play_sound(sndShoot,0,false);
            }
            break;
    }
    }
    shootinterval=10
}
