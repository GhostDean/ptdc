//argument0 - x for points
//argument1 - y for points
//argument2 - smooth
//argument3 - path spd

var _p, _isSmooth;
_p = path_add();
for(i=0; i<array_length_1d(argument0); i++) {
    path_add_point(_p, argument0[i], argument1[i], argument3);
}
_isSmooth = argument2; 
path_set_kind(_p, 0); //smooth path start point is weird, use non-smooth instead
return _p;
