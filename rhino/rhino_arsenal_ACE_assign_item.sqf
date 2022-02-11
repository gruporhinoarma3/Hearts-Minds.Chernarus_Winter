/*
script: rhino_arsenal ACE_assign_item
author: |R|kiron
date: 2021-09-15
task: when closing ACE arsenal, if player do not have assigned the specified item it will get added
*/

params[ "_item_classname", "_text"];

rhino_assign_item = 
{
    _item_classname = _thisArgs#0;
    _text           = _thisArgs#1;
    
    _not_item = true;
    {
        if ( _x find _item_classname == 0) exitWith { _not_item = false };
    }
    forEach assignedItems player;
    
    if ( _not_item ) then
    {
        player linkItem _item_classname;
        hint (_item_classname + " " + _text );
    };
};

[   "ace_arsenal_displayClosed",
    rhino_assign_item,
    [ _item_classname, _text ]
] call CBA_fnc_addEventHandlerArgs;