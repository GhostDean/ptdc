///gets which song is supposed to be playing for the current room and plays it

var roomSong;

switch (room)                       //determines which song to play
{
    case rTitle:
        roomSong = musTitle;
        break;
    case rStage0_1:
    case rStage0_2:
    case rStage0_3:
    case rStage0_4:
        roomSong = musIntro;
        break;
    case rStage0_5:
    case rStage0_6:
    case rStage0_7:
    case rStage0_8:
    case rStage0_9:
    case rStage0_10:
    case rStage0_11:
    case rStage0_12:
    case rStage0_13:
    case rStage0_14:
    case rStage0_15:
    case rStage0_16:
    case rStage0_17:
    case rStage0_18:
    case rStage0_19:
    case rStage0_20:
    case rStageGallery:
    case rStage0_22:
    case rStage0_23:
        roomSong = musMiddle1;
        break;
    case rStage0_1_1:
    case rStage0_1_2:
    case rStage0_1_3:
    case rStage0_1_5:
    case rStage0_1_6:
    case rStage0_1_7:
    case rStage0_1_8:
    case rStage0_1_9:
    case rStage0_1_10:
    case rStage0_1_11:
    case rStage0_1_12:
    case rStage0_1_13:
    case rStage0_1_14:
    case rStage0_1_15:
    case rStage0_1_16:
    case rStage0_1_17:
    case rStage0_1_18:
    case rStage0_1_19:
    case rStage0_2_2:
    case rStage0_3_3:
    case rStage0_3_4:
    case rStage0_3_5:
    case rStage0_3_6:
    case rStage0_3_7:
    case rStage0_3_8:
        roomSong = musMiddle2;
        break;
    case rStage0_1_4:
    case rStage0_2_1:
    case rStage0_2_3:
    case rStage0_2_4:
    case rStage0_2_5:
    case rStage0_2_6:
    case rStage0_2_7:
    case rStage0_2_8:
    case rStage0_4_1:
    case rStage0_4_2:
    case rStage0_4_3:
    case rStageGallery2:
    case rStage0_4_5:
    // case rStage0_4_6:
    case rStage0_4_7:
    case rStage0_4_8:
    case rStage0_4_9:
    case rStage0_4_10:
    case rStage0_4_11:
    case rStage0_4_12:
    // case rStage0_4_13:
    // case rStage0_4_14:
        roomSong = musMiddle3;
        break;
    case rStage1_1_1:
    case rStage1_1_2:
    case rStage1_1_3:
    case rStage1_1_4:
    case rStage1_1_5:
    case rStage1_1_6:
    case rStage1_1_7:
    case rStage1_1_8:
    case rStage1_1_9:
    case rStage1_2_1:
    case rStage1_2_3:
    case rStage1_2_4:
    case rStage1_2_5:
    case rStage1_2_item:
        roomSong = musStage1;
        break;
    case rStage2_1_1:
    case rStage2_1_2:
    case rStage2_1_3:
    case rStage2_1_4:
    case rStage2_1_5:
    case rStage2_1_6:
    case rStage2_1_7:
    case rStage2_2_1:
    case rStage2_2_2:
    case rStage2_2_3:
    case rStage2_2_4:
    case rStage2_2_5:
    case rStage2_2_6:
    case rStage2_2_8:
    case rStage2_2_9:
    case rStage2_2_10:
    case rStage2_2_11:
        roomSong = musStage2;
        break;
    case rStage3_1_1:
    case rStage3_1_2:
    case rStage3_1_3:
    case rStage3_1_4:
    case rStage3_1_5:
    case rStage3_1_6:
    case rStage3_1_7:
    case rStage3_1_8:
    case rStage3_1_9:
    case rStage3_1_10:
    case rStage3_1_11:
    case rStage3_1_13:
    case rStage3_1_14:
    case rStage3_2_1:
    case rStage3_hidden:
    case rStage3_2_2:
    case rStage3_2_3:
    case rStage3_2_4:
    case rStage3_1_item:
    case rStage0_3_1:
    case rStage0_3_2:
        roomSong = musStage3;
        break;
    case rStage4_1_1:
    case rStage4_1_2:
    case rStage4_1_3:
    case rStage4_1_4:
    case rStage4_1_5:
    case rStage4_1_6:
    case rStage4_1_7:
    case rStage4_1_8:
    case rStage4_1_9:
    case rStage4_1_10:
    case rStage4_1_11:
    case rStage4_1_item:
        roomSong = musStage4;
        break;
    case rStage5_1_1:
    case rStage5_1_2:
    case rStage5_1_3:
    case rStage5_1_5:
    case rStage5_1_6:
    case rStage5_1_7:
    case rStage5_1_item:
    case rStage5_1_8:
    case rStage5_2_1:
    case rStage5_hidden:
    case rStage5_2_2:
    case rStage5_2_3:
    case rStage5_2_4:
    case rStage5_2_5:
    case rStage5_2_6:
    case rStage5_2_7:
    case rStage5_2_8:
    case rStage5_2_9:
    case rStage5_2_10:
    case rStage5_2_11:
    case rStage5_2_12:
    case rStage5_2_13:
    case rStage5_2_14:
    case rStage5_2_item:
    case rStage5_2_15:
    case rStage5_2_16:
    case rStage5_2_17:
        roomSong = musStage5;
        break;
    case rStage6_1:
    case rStage6_2:
    case rStage6_3:
    case rStage6_4:
    case rStage6_5:
    case rStage6_6:
    case rStage6_7:
    case rStage6_8:
    case rStage6_9:
    case rStage6_10:
    case rStage6_11:
    case rStage6_12:
    case rStage6_13:
    case rStage6_14:
    case rStage6_15:
    case rStage6_16:
    case rStage6_17:
    case rStage6_18:
    case rStage6_19:
    case rStage6_20:
    case rStage6_21:
    case rStage6_22:
    case rStage6_23:
    case rStage6_24:
    case rStage6_item:
        roomSong = musStage6;
        break;
    case rStage7_1:
    case rStage7_2:
    case rStage7_3:
    case rStage7_7:
    case rStage7_4:
    case rStage7_8:
    case rStage7_5:
    case rStage7_9:
    case rStage7_6:
    case rStage7_10:
    case rStage7_11:
        roomSong = musS7;
        break;
    case rStage8_0:
    case rStage8_1:
    case rStage8_2:
    case rStage8_3:
    case rStage8_4:
    case rStage8_5:
    case rStage8_6:
    case rStage8_7:
    case rStage8_item:
    case rStageDLC_SavePeach:
        roomSong = musStage8;
        break;
    case rVS01:
        roomSong = bgm1;
        break;
    case rVSc1:case rVSc2:case rVSc3:case rVSc4:case rVSc5:
        roomSong = bgm2;
        break;
    case rStage9_1:
    case rStage9_2:
    case rStage9_3:
    case rStage9_4:
    case rStage9_5:
    case rStage9_6:
    case rStage9_7:
    case rStage9_8:
    case rStage9_9:
    case rStage9_10:
    case rStage9_bonus:
        roomSong = musStage9;
        break;
    //case rStage01:
    default:                        //default option in case the room does not have a song set
        roomSong = -1;
        break;
}

if (roomSong != -2)
    scrPlayMusic(roomSong,true); //play the song for the current room
