///scrSaveGame(saveposition)
///saves the game
///argument0 - sets whether the game should save the player's current location or just save the deaths/time

var savePosition = argument[0];

//save the player's current location variables if the script is currently set to (we don't want to save the player's location if we're just updating death/time)
if (savePosition)
{    
    global.saveRoom = room_get_name(room);
    global.saveGrav = global.grav;
    global.savePlayerZ = 0;
    if(isFEZroom(room)){
        global.savePlayerX = argument[1];
        global.savePlayerY = argument[2];
        global.savePlayerZ = argument[3];
    }else if(isS7room(room)){
        global.savePlayerX = objSlplayer.x;    
        global.savePlayerY = objSlplayer.y;
    }else if(IsIrRoom(0)){
        global.savePlayerX = playerIr.x;    
        global.savePlayerY = playerIr.y;
    }else{
    global.savePlayerX = objPlayer.x;    
    global.savePlayerY = objPlayer.y;
    
    //check if player is saving inside of a wall or in the ceiling when the player's position is floored to prevent save locking
    with (objPlayer)
    {
        if (!place_free(floor(global.savePlayerX),global.savePlayerY))
        {
            global.savePlayerX += 1;
        }
        
        if (!place_free(global.savePlayerX,floor(global.savePlayerY)))
        {
            global.savePlayerY += 1;
        }
        
        if (!place_free(floor(global.savePlayerX),floor(global.savePlayerY)))
        {
            global.savePlayerX += 1;
            global.savePlayerY += 1;
        }
    }
    }
    
    //floor player position to match standard engine behavior
    global.savePlayerX = floor(global.savePlayerX);
    global.savePlayerY = floor(global.savePlayerY);
    global.saveGameClear = global.gameClear;
}
for (var i = 0; i < global.secretItemTotal; i++)
{
    global.saveSecretItem[i] = global.secretItem[i];
}
    
for (var i = 0; i < global.bossItemTotal; i++)
{
    global.saveBossItem[i] = global.bossItem[i];
}

//create a map for save data
var saveMap = ds_map_create();

ds_map_add(saveMap,"death",global.death);
ds_map_add(saveMap,"time",global.time);
ds_map_add(saveMap,"timeMicro",global.timeMicro);

ds_map_add(saveMap,"difficulty",global.difficulty);
ds_map_add(saveMap,"saveRoom",global.saveRoom);
ds_map_add(saveMap,"savePlayerX",global.savePlayerX);
ds_map_add(saveMap,"savePlayerY",global.savePlayerY);
ds_map_add(saveMap,"savePlayerZ",global.savePlayerZ);
ds_map_add(saveMap,"saveGrav",global.saveGrav);
ds_map_add(saveMap,"saveFEZn",global.n);

for (var i = 0; i < global.secretItemTotal; i++)
{
    ds_map_add(saveMap,"saveSecretItem["+string(i)+"]",global.saveSecretItem[i]);
}

for (var i = 0; i < global.bossItemTotal; i++)
{
    ds_map_add(saveMap,"saveBossItem["+string(i)+"]",global.saveBossItem[i]);
}

ds_map_add(saveMap,"saveGameClear",global.saveGameClear);

for(var j=0; j<40; j++)
{
    for(var k=0; k<30; k++)
    {
        ds_map_add(saveMap,"saveMapRoom["+string(j)+"]["+string(k)+"]",global.map[j,k]);
    }
}

saveMap[? 'exploredChunks'] = global.exploredMapChunks;
saveMap[? 'bossMKidCutscene'] = global.bossMKidCutscene;
saveMap[? 's7UnlockDoor'] = global.s7UnlockDoor;
saveMap[? 's4WaterCutscene'] = global.s4WaterCutscene;
saveMap[? 's5IceMirrorTutorial'] = global.s5IMTutorial;

//add md5 hash to verify saves and make them harder to hack
ds_map_add(saveMap,"mapMd5",md5_string_unicode(json_encode(saveMap)+global.md5StrAdd));

//save the map to a file
if (global.extraSaveProtection) //use ds_map_secure function
{
    ds_map_secure_save(saveMap,"Data\save"+string(global.savenum));
}
else    //use text file
{
    //open the save file
    var f = file_text_open_write("Data\save"+string(global.savenum));
    
    //write map to the save file with base64 encoding
    file_text_write_string(f,base64_encode(json_encode(saveMap)));
    
    file_text_close(f);
}

//destroy the map
ds_map_destroy(saveMap);

// add sp stage file
for (var i = 1; i <= global.frees1Num; i++)
{
    global.saveFrees1[i] = global.frees1[i];
}
for (var i = 1; i <= global.frees2Num; i++)
{
    global.saveFrees1[i] = global.frees1[i];
}
for (var i = 1; i <= global.frees3Num; i++)
{
    global.saveFrees1[i] = global.frees1[i];
}

