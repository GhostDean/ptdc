//argument0 - x for points
//argument1 - y for points
//argument2 - smooth
//argument3 - path spd

var _p;

_p = path_add();
for(i=0; i<array_length_1d(argument0); i++) {
    path_add_point(_p, argument0[i], argument1[i], argument3);
}
path_set_kind(_p, argument2);
return _p;
