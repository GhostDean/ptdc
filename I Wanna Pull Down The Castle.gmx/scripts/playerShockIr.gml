if(scrButtonCheckPressed(global.shootButton)){
    if(place_free(x,y+4) and !irfly){
        y1 = y;
    
        hspeed = 0;
        if(collision_line(x,y,x,room_height,objIrAnotherJump,false,true) or collision_line(x,y,x,room_height,objIrStar,false,true)){
            global.Ir_pmeetj = room_height;
            with(objIrAnotherJump){
                if(x > playerIr.x - 14 and x < playerIr.x + 14){
                    if(y > playerIr.y and y < global.Ir_pmeetj){
                        global.Ir_pmeetj = y;
                    }
                }
            }
            
            with(objIrStar){
                if(x > playerIr.x - 30 and x < playerIr.x + 30){
                    if(y > playerIr.y and y < global.Ir_pmeetj){
                        global.Ir_pmeetj = y;
                    }
                }
            }
            y = global.Ir_pmeetj - 8;
        }
        else{
            move_contact_solid(270,room_height);
        }
        vspeed = 0;
        sprite_index = sprPlayerIdle;
    
        y2 = y;
    
        with(objIrMissile){
            if((x < playerIr.x + 14) and (x > playerIr.x - 14) and (y > playerIr.y1) and (y < playerIr.y2)){
                instance_destroy();
            }
        }
        with(objIrMonster){
            if((x < playerIr.x + 26) and (x > playerIr.x - 26) and (y > playerIr.y1) and (y < playerIr.y2)){
                instance_destroy();
            }
        }
        
        instance_create(x,y,objIrShock1);
        instance_create(x,y,objIrShock2);
        instance_create(x,0,objIrShock3);
        audio_play_sound(sndIrShock,1,0);
    }
}
