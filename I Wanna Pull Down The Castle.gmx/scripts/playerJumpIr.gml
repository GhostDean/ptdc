if(scrButtonCheckPressed(global.jumpButton) && !keyboard_check_pressed(ord('P')) && !irfly){
    //check whether we can first jump
    isFirstJump = place_meeting(x,y+yflag,block) || onPlatform ||(place_meeting(x,y+yflag,obj_wall));
    //first jump
    if(isFirstJump){
        if((distance_to_object(objWalljumpR) > 1 && distance_to_object(objWalljumpL) > 1)){
            audio_play_sound(sndIrJump,1,0);
        }
        vspeed = -yflag*jump[1];
        //playerVJump
        //go to second jump
        curJumps = 2;
    }
    //second jump, (third jump...)
    else{
        if(curJumps == 1 && !isFirstJump){
            curJumps += 1;
        }
        if((curJumps<=maxJumps)){
            //if fall down and jump, make it a second jump
            if((distance_to_object(objWalljumpR) > 1 && distance_to_object(objWalljumpL) > 1)){
                audio_play_sound(sndIrJump,1,0);
            }
            vspeed = -yflag*jump[curJumps];
            //playerVJump
            //next jump
            curJumps += 1;
            sprite_index = sprIrPlayerJump;
        }
        //infinite jump
        else if(infJump || place_meeting(x,y+yflag,objWater)){
            if((distance_to_object(objWalljumpR) > 1 && distance_to_object(objWalljumpL) > 1)){
                audio_play_sound(sndIrJump,1,0);
            }
            //this will set the jumping speed to the last jump
            vspeed = -yflag*jump[maxJumps];
            //playerVJump
            curJumps = maxJumps+1;
        }
    }   
}

if(irfly == 1){
    if(scrButtonCheck(global.jumpButton)){
        if(vspeed * yflag > 0){
            vspeed -= 3;
        }
        else{
            vspeed = -5 * yflag;
        }
    }
}
