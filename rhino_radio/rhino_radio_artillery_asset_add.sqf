// script: rhino_radio_artillery_asset_add
// task1:	add event handler to server
// 			with global variable with classnames, when a vehicle is created it is added to the list.
// task2:	search at the start for the classnames and add "editor placed" and "init added" vehicles
// author: |R|kiron
// date: 2021-09-14

rhino_radio_artillery_asset_add =
{
    params [ "_objectID" ];

     // check no double input
    _rhino_radio_already_an_asset = false;
    {
        if (!( (typeName (_x#0)) == "STRING" )) then
        {
            if ( _x#0 == _objectID ) then
            {
                _rhino_radio_already_an_asset = true;
            };
        };
        if ( _rhino_radio_already_an_asset ) exitWith {};
    } forEach rhino_radio_assets;
    if ( _rhino_radio_already_an_asset ) exitWith {};
    
    // add it to the list
    if (isServer) then
    {
        _supports       = [ rrg_supportID_artillery ];
        _GUItext        = getText (configFile >> "CfgVehicles" >> typeOf _objectID >> "displayName");
        _reload_time    = 6; // seconds
        _cargo_capacity = 0;
        _index          = count rhino_radio_assets;
        _createdobjID   = objNull;
        
        rhino_radio_assets pushBack [ _objectID, _supports, _GUItext, _reload_time, _cargo_capacity, _index, rrg_state_available, _createdobjID ];
        
        publicVariable "rhino_radio_assets";
    };
};

// MISSION ONGOING EventHandler
{ [ _x, "init", rhino_radio_artillery_asset_add, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach rhino_radio_artillery_assets_classnames;

// MISSION START nearObjects
if (isServer) then
{
    {
        _classname = _x;
        _mapcenterpos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
        _objects = _mapcenterpos nearObjects [ _classname, 20000 ];
        
        { [ _x ] call rhino_radio_artillery_asset_add;
        } forEach _objects;

    } forEach rhino_radio_artillery_assets_classnames;
};