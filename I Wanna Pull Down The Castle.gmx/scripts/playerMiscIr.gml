//player die
if(place_meeting(x,y,objPlayerKiller)){
    killPlayerIr();
}
//debug mode functions (F6)
/*if(debug_mode){
    //mouse warp (left buttom)
    if(mouse_check_button(mb_left)){
        playerIr.x = mouse_x;
        playerIr.y = mouse_y;
    }
    //"S" save
    if(scrButtonCheckPressed(ord('S'))){
        scrSaveGame(1);
    }
    //god mode
    if(scrButtonCheckPressed(ord('G'))){
        //switch between god mode and non god mode
        global.god_mode = !global.god_mode;
        if(global.god_mode){
            show_message("god mode on!");
        }
        else{
            show_message("god mode off!");
        }
    }
}
