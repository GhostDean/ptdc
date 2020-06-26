///scrLoadGame(loadfile)
///loads the game
///argument0 - sets whether or not to read the save file when loading the game

var loadFile = argument0;

//only load save data from the save file if the script is currently set to (we should only need to load these on first load because the game stores them afterwards)
if (loadFile)
{
    //load the save map
    var saveMap;
    
    if (global.extraSaveProtection) //use ds_map_secure function
    {
        saveMap = ds_map_secure_load("Data\save"+string(global.savenum));
    }
    else    //use text file
    {
        var f = file_text_open_read("Data\save"+string(global.savenum));
        
        saveMap = json_decode(base64_decode(file_text_read_string(f)));
        
        file_text_close(f);
    }
    
    var saveValid = true;   //keeps track of whether or not the save being loaded is valid
    
    if (saveMap != -1)  //check if the save map loaded correctly
    {
        global.death = ds_map_find_value(saveMap,"death");
        global.time = ds_map_find_value(saveMap,"time");
        global.timeMicro = ds_map_find_value(saveMap,"timeMicro");
        
        global.difficulty = ds_map_find_value(saveMap,"difficulty");
        global.saveRoom = ds_map_find_value(saveMap,"saveRoom");
        global.savePlayerX = ds_map_find_value(saveMap,"savePlayerX");
        global.savePlayerY = ds_map_find_value(saveMap,"savePlayerY");
        global.savePlayerZ = ds_map_find_value(saveMap,"savePlayerZ");
        global.saveGrav = ds_map_find_value(saveMap,"saveGrav");
        global.n = ds_map_find_value(saveMap,"saveFEZn");
        
        if (is_string(global.saveRoom))   //check if the saved room loaded properly
        {
            if (!room_exists(asset_get_index(global.saveRoom)))  //check if the room index in the save is valid
                saveValid = false;
        }
        else
        {
            saveValid = false;
        }
        
        for (var i = 0; i < global.secretItemTotal; i++)
        {
            global.saveSecretItem[i] = ds_map_find_value(saveMap,"saveSecretItem["+string(i)+"]");
        }
        
        for (var i = 0; i < global.bossItemTotal; i++)
        {
            global.saveBossItem[i] = ds_map_find_value(saveMap,"saveBossItem["+string(i)+"]");
        }
        
        global.saveGameClear = ds_map_find_value(saveMap,"saveGameClear");
        
        for(var j=0; j<40; j++)
        {
            for(var k=0; k<30; k++)
            {
                global.map[j, k] = saveMap[? "saveMapRoom[" + string(j) + "][" + string(k) + "]"];
            }
        }
        
        global.exploredMapChunks = saveMap[? 'exploredChunks'];
        
        global.bossMKidCutscene = saveMap[? 'bossMKidCutscene'];
        global.s7UnlockDoor = saveMap[? 's7UnlockDoor'];
        global.s4WaterCutscene = saveMap[? 's4WaterCutscene'];
        global.s5IMTutorial = saveMap[? 's5IceMirrorTutorial'];
        
        //load md5 string from the save map
        var mapMd5 = ds_map_find_value(saveMap,"mapMd5");
        
        //check if md5 is not a string in case the save was messed with or got corrupted
        if (!is_string(mapMd5))
            mapMd5 = "";   //make it a string for the md5 comparison
        
        //generate md5 string to compare with
        ds_map_delete(saveMap,"mapMd5");
        var genMd5 = md5_string_unicode(json_encode(saveMap)+global.md5StrAdd);
        
        if (mapMd5 != genMd5)   //check if md5 hash is invalid
            saveValid = false;
        
        //destroy the map
        ds_map_destroy(saveMap);
    }
    else
    {
        //save map didn't load correctly, set the save to invalid
        saveValid = false;
    }
    
    if (!saveValid) //check if the save is invalid
    {
        //save is invalid, restart the game
        
        show_message("Save invalid!");
        
        scrRestartGame();
        
        exit;
    }
}

//set game variables and set the player's position

with (objPlayer) //destroy player if it exists
    instance_destroy();
    
with (objSlplayer)
    instance_destroy();
    
with (playerIr)
    instance_destroy();
    
if(instance_exists(player))instance_destroy(player);

global.gameStarted = true;  //sets game in progress (enables saving, restarting, etc.)
global.noPause = false;     //disable no pause mode
global.autosave = false;    //disable autosaving since we're loading the game

global.grav = global.saveGrav;

for (var i = 0; i < global.secretItemTotal; i++)
{
    global.secretItem[i] = global.saveSecretItem[i];
}

for (var i = 0; i < global.bossItemTotal; i++)
{
    global.bossItem[i] = global.saveBossItem[i];
}

global.gameClear = global.saveGameClear;
if(isFEZroom(asset_get_index(global.saveRoom))){
    instance_create(global.savePlayerX,global.savePlayerY,player);
    player.persistent=true;
    player.z=global.savePlayerZ;
}else if(isS7room(asset_get_index(global.saveRoom))){
    instance_create(global.savePlayerX,global.savePlayerY,objSlplayer);
}else{
    instance_create(global.savePlayerX,global.savePlayerY,objPlayer);
}
room_goto(asset_get_index(global.saveRoom));
