if (ArrowNum > 0)
{
    instance_create(x,y,objQS2Arrow);
    audio_play_sound(sndShoot,0,false);
    ArrowNum -= 1;
}
