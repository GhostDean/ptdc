//kills the player

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (global.gameStarted) //normal death
    {
        global.deathSound = audio_play_sound(sndDeath,0,false);
        
        if (!global.muteMusic)  //play death music
        {
            if (global.deathMusicMode == 1) //instantly pause the current music
            {
                audio_pause_sound(global.currentMusic);
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
            else if (global.deathMusicMode == 2)    //fade out the current music
            {                
                with (objWorld)
                    event_user(0);  //fades out and stops the current music
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
        }
        
        var o=instance_create(objPlayer.x,objPlayer.y,objSlLPef);
        o.sprite_index=objPlayer.sprite_index;
        o.image_single=objPlayer.image_index;
        o.image_xscale=objPlayer.xScale;
        o.image_blend=objPlayer.image_blend;
        o.image_alpha=1;o.sd=0;o.depth=-10;
        
        o=instance_create(objPlayer.x,objPlayer.y,objSlLPef);
        o.sprite_index=objPlayer.sprite_index;
        o.image_single=objPlayer.image_index;
        o.image_xscale=objPlayer.xScale;
        o.image_blend=c_dkgray;
        o.image_alpha=0;o.sd=-0.1;o.depth=-11;
        
        with(objPlayer)
            instance_destroy();
        
        instance_create(0,0,objGameOver);
        
        global.death += 1; //increment deaths
            
        scrSaveGame(false); //save death/time
    }
    else    //death in the difficulty select room, restart the room
    {
        with(objPlayer)
            instance_destroy();
            
        room_restart();
    }
}
