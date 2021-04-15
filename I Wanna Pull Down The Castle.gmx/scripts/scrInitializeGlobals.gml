///initializes all global variables needed for the game

scrSetGlobalOptions();       //initialize global game options

global.savenum = 1;
global.difficulty = 0;  //0 = medium, 1 = hard, 2 = very hard, 3 = impossible
global.death = 0;
global.time = 0;
global.timeMicro = 0;
global.saveRoom = "";
global.savePlayerX = 0;
global.savePlayerY = 0;
global.grav = 1;
global.saveGrav = 1;
global.frozen=0;
global.frozen2=0;
//FEZ
global.n=0;
global.nnext=0;
global.hue=0;
global.vsbk=0;
global.restart=true;

for (var i = global.secretItemTotal-1; i >= 0; i--)
{
    global.secretItem[i] = false;
    global.saveSecretItem[i] = false;
}

for (var i = global.bossItemTotal-1; i >= 0; i--)
{
    global.bossItem[i] = false;
    global.saveBossItem[i] = false;
}

global.gameClear = false;
global.saveGameClear = false;

for (var i = 99; i >= 0; i--)
{
    global.trigger[i] = false;
}

for (var i = 39; i >= 0; i--)
{
    for (var j = 29; j >= 0; j--)
    {
        global.map[i,j] = false;
    }
}

global.gameStarted = false;     //determines whether the game is in progress (enables saving, restarting, etc.)
global.noPause = false;         //sets whether or not to allow pausing (useful for bosses to prevent desync)
global.autosave = false;        //keeps track of whether or not to autosave the next time the player is created
global.noDeath = false;         //keeps track of whether to give the player god mode
global.infJump = false;         //keeps track of whether to give the player infinite jump

global.gamePaused = false;      //keeps track of whether the game is paused or not
global.pauseSurf = -1;       //stores the screen surface when the game is paused
global.pauseDelay = 0;      //sets pause delay so that the player can't quickly pause buffer

global.currentMusicID = -1;  //keeps track of what song the current music is
global.currentMusic = -1;    //keeps track of current main music instance
global.deathSound = -1;     //keeps track of death sound when the player dies
global.gameOverMusic = -1;   //keeps track of game over music instance
global.musicFading = false;     //keeps track of whether the music is being currently faded out
global.currentGain = 0;     //keeps track of current track gain when a song is being faded out

global.menuSelectPrev[0] = 0;     //keeps track of the previously selected option when navigating away from the difficulty menu
global.menuSelectPrev[1] = 0;     //keeps track of the previously selected option when navigating away from the options menu

//get the default window size
global.windowWidth = surface_get_width(application_surface);
global.windowHeight = surface_get_height(application_surface);

//keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface));  //set the correct gui size for the Draw GUI event

global.controllerMode = false;  //keeps track of whether to use keyboard or controller
global.controllerDelay = -1;    //handles delay between switching between keyboard/controller so that the player can't use both at the same time

// Umbrella
// boss cutscene record
global.bossMKidCutscene = false;
// portal snapshot
global.snapshotLoaded = false;
for (var i = 0; i < global.snapshotNum; i++)
{
    global.portalSnapshot[i] = -1;
}
// map system surface
global.surfMap = -1;
global.exploredMapChunks = 0;
// Cutscene
global.s7UnlockDoor = false;
global.s4WaterCutscene = false;
global.s5IMTutorial = false;

// sp stage global var
global.frees1Num = 8;
global.frees2Num = 8;
global.frees3Num = 8;
for (var i = 1; i <= global.frees1Num; i++)
{
    global.frees1[i] = 0;
    global.saveFrees1[i] = 0;
}
for (var i = 1; i <= global.frees2Num; i++)
{
    global.frees2[i] = 0;
    global.saveFrees2[i] = 0;
}
for (var i = 1; i <= global.frees3Num; i++)
{
    global.frees3[i] = 0;
    global.saveFrees3[i] = 0;
}
/*
// origin gm8 sp stage global
global.frees1[5]; //five color
global.frees1[6]; //area1boss
global.frees1[7]; //white block
global.frees1[8]; //hot clothes
global.frees2[1]; //normalbomb
global.frees2[2]; //area2boss
global.frees2[3]; //waterdeep
global.frees2[4]; //watercol
global.frees2[5]; //jumpjumpjump
global.frees2[6]; //timepause in area 5(0 is move)
global.frees2[7]; //purple door
global.frees2[8]; //global.daodannum2
global.frees3[1]; //supermario P=1,2,3,4
global.frees3[2]; //supermario ?=1,2,3,4
*/

randomize();    //make sure the game starts with a random seed for RNG
