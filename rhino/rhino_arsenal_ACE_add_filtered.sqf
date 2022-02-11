/*
author: |R|kiron
date: 2022-02-10
task: add EH to class so when spawned has an ACE arsenal with the items in the list

example:
_rhino_arsenal_classname = [ "B_supplyCrate_F" ];
_rhino_arsenal_list = [ "ACE_Cellphone","FirstAidKit" ];
_rhino_arsenal_remove = true;
[ _rhino_arsenal_classname, _rhino_arsenal_list, _rhino_arsenal_remove ] execVM "rhino_arsenal_ACE_add_filtered.sqf";
*/

params[ "_rhino_arsenal_classname", ["_rhino_arsenal_list",[]], ["_remove",false]];

rhino_ACE_arsenal_mode_remove = _remove;
rhino_ACE_arsenal_list = _rhino_arsenal_list;

_rhino_fnc_arsenal_ACE_add_filtered =
{
    params [ "_object" ];
    
    if (rhino_ACE_arsenal_mode_remove) then
    {
        [ _object, true ] call ace_arsenal_fnc_initBox;
        [ _object, rhino_ACE_arsenal_list ] call ace_arsenal_fnc_removeVirtualItems;
    } else {
        [ _object, rhino_ACE_arsenal_list ] call ace_arsenal_fnc_initBox;
    };
};

{
    [ _x, "init", _rhino_fnc_arsenal_ACE_add_filtered, true, [], true] call CBA_fnc_addClassEventHandler;
}
forEach _rhino_arsenal_classname;