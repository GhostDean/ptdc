///killPlayer();
//
//  make the player dead
//
//
if(global.debugNoDeath)exit;
{
    //when player isn't selecting difficulty
        //create death effects
        //instance_create(0,0,objDeathSound);
        
        global.deathSound = audio_play_sound(sndIrDeath,0,false);
        
        if (!global.muteMusic)  //play death music
        {
            if (global.deathMusicMode == 1) //instantly pause the current music
            {
                audio_pause_sound(global.currentMusic);

            }
            else if (global.deathMusicMode == 2)    //fade out the current music
            {                
                with (objWorld)
                    event_user(0);  //fades out and stops the current music
                
            }
        }
        
        instance_create(playerIr.x,0 + view_yview[0],objIrBlood1);
        instance_create(playerIr.x,0 + view_yview[0],objIrBlood2);
        instance_create(playerIr.x,0 + view_yview[0],objIrBlood3);
        a = instance_create(playerIr.x,min(playerIr.y,0 + view_yview[0]),objIrBlood4);
        //destroy the player and load game
        if(instance_exists(playerIr)){
            a.image_xscale = playerIr.image_xscale;
            with(playerIr){
              instance_destroy();
            }
        }
        global.death += 1;
        scrSaveGame(0);
}
