//script: rhino_radio_transport_heli_actions
//author: |R|kiron
//date: 2021-04-01

// parameters
params[ "_heli" ];

// rhino heli orders base
_action = ["rhino_radio_veh",rr_str_rhinoradio,"",{""},{true},{},[], [0,0,0], 50,[false,true,false,false,false]] call ace_interact_menu_fnc_createAction;
[_heli, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// rhino heli action move to
rhinoradio_heli_action_move =
{
    params[ "_heli","_waypoint_statement" ];
    
    _return = [] call rhino_radio_fn_supportpos;                                // select request position
    _requested_pos  = _return select 0;
    _ok             = _return select 1;
    if ( !_ok ) exitWith { hint "Orden anulada" };
    _group = group ((crew _heli)#0);
    _waypoint_data = [ [ _requested_pos, 50, "MOVE", _waypoint_statement ] ];
    [ _group, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;            // delete, create waypoints
    _group setBehaviour "CARELESS";                                             // follow orders blindly
    [west,"HQ"] sideRadio "mp_groundsupport_10_boardingended_BHQ_0";            // confirmation sound
};

_waypoint_statement =  "vehicle this land ""GET OUT"";_group setBehaviour ""AWARE"";";
_id = "rrv_landengineon";
_text = rr_str_landatlocation;
_statement = { _null = [ _this#0, _this#2#0 ] spawn rhinoradio_heli_action_move; };
_action = [ _id, _text, "", _statement, {true}, {}, [ _waypoint_statement ], [0,0,0], 50, [false,true,false,false,false] ] call ace_interact_menu_fnc_createAction;
[ _heli, 1, ["ACE_SelfActions","rhino_radio_veh"], _action] call ace_interact_menu_fnc_addActionToObject;

_waypoint_statement = "vehicle this land ""LAND"";_group setBehaviour ""AWARE"";";
_id = "rrv_landengineoff";
_text = rr_str_landatlocationengineoff;
_statement = { _null = [ _this#0, _this#2#0 ] spawn rhinoradio_heli_action_move; };
_action = [ _id, _text, "", _statement, {true}, {}, [ _waypoint_statement ], [0,0,0], 50, [false,true,false,false,false] ] call ace_interact_menu_fnc_createAction;
[ _heli, 1, ["ACE_SelfActions","rhino_radio_veh"], _action] call ace_interact_menu_fnc_addActionToObject;

_waypoint_statement =  "_group setBehaviour ""AWARE"";";
_id = "rrv_hover";
_text = rr_str_hoveratlocation;
_statement = { _null = [ _this#0, _this#2#0 ] spawn rhinoradio_heli_action_move; };
_action = [ _id, _text, "", _statement, {true}, {}, [ _waypoint_statement ], [0,0,0], 50, [false,true,false,false,false] ] call ace_interact_menu_fnc_createAction;
[ _heli, 1, ["ACE_SelfActions","rhino_radio_veh"], _action] call ace_interact_menu_fnc_addActionToObject;

// rhino heli set altitude
_action = ["rhino_radio_veh_altitude",rr_str_setaltitude,"",{""},{true},{},[], [0,0,0], 50,[false,true,false,false,false]] call ace_interact_menu_fnc_createAction;
[_heli, 1, ["ACE_SelfActions","rhino_radio_veh"], _action] call ace_interact_menu_fnc_addActionToObject;

rhinoradio_heli_action_altitude =
{
    params["_heli","_height"];
    _group = group ((crew _heli)#0);
    if ( (waypointStatements[ _group, currentWaypoint(_group) ] #0) =="" ) then     // if no waypoint heli will not change altitude, so add one.
    {
        _pos = [ (getPos _heli)#0, (getPos _heli)#1, _height];
        _waypoint_data = [ [ _pos, 0, "MOVE", "" ] ];
        [ _group, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;            // delete, create waypoints
        _group setBehaviour "CARELESS";
    };
    _heli flyInHeight _height;
};

{
    _id = ["rhino_radio_veh_altitude",str(_x)] joinString "_";
    _text = str(_x);
    _statement =
    {
        [ _this#0, _this#2#0 ] remoteExec ["rhinoradio_heli_action_altitude",2];
        [west,"HQ"] sideRadio "mp_groundsupport_10_boardingended_BHQ_0";            // confirmation sound
    };
    _action = [ _id, _text, "", _statement, {true}, {}, [_x], [0,0,0], 50, [false,true,false,false,false] ] call ace_interact_menu_fnc_createAction;
    [ _heli, 1, ["ACE_SelfActions","rhino_radio_veh","rhino_radio_veh_altitude"], _action] call ace_interact_menu_fnc_addActionToObject;
    
} foreach rhinoradio_altitude;