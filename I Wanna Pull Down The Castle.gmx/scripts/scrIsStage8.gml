/// scrIsStage8()
switch room
{
    case rStage8_0:
    case rStage8_1:
    case rStage8_2:
    case rStage8_3:
    case rStage8_4:
    case rStage8_5:
    case rStage8_6:
    case rStage8_7:
    case rStage8_boss:
    case rStage8_item:
    case rStage8_transport:
        return true;
    default:
        return false;
}
