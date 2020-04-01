if(argument0)r=argument0
else r=room;
switch r
{
    case rIrStage1:
    case rIrEnd:
    case rN1:
    case rN2:
    case rN3:
    case rN4:
    case rN5:
    case rQ1:
        return true;
    default:
        return false;
}
