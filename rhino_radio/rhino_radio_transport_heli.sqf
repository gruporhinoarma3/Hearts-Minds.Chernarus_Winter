//script: rhino_radio_transport_heli
//author: |R|kiron
//date: 2020-11-01

params[ "_aircraft_classname", "_asset_index", ["_requested_pos",false], ["_type",0], ["_flightaltitude",100] ];

_ok = true;
if (typeName _requested_pos == "BOOL") then             // if no _requested_pos given ask the user to click one map pos
{
    _return = [] call rhino_radio_fn_supportpos;        // select coords with map click
    _requested_pos = _return #0;
    _ok = _return #1;
};
if ( !_ok ) exitWith { hint "Petición cancelada" };

// request aircraft params
_spawn_pos = rr_coord_ATL_base vectorAdd [0,0,0];
_spawn_dir = getDir rhino_radio_base;
_waypoint_statement = [ "vehicle this land ""GET OUT""; _group setBehaviour ""AWARE"";",
                        "vehicle this land ""LAND""; _group setBehaviour ""AWARE"";",
                        "_group setBehaviour ""AWARE"";" 
                      ]#_type;
_waypoint_data = [ [_requested_pos,50,"MOVE",_waypoint_statement] ];
_behaviour = "AWARE";
_player_actions = [ "rhino_radio\rhino_radio_actions_heli_BIS.sqf", "rhino_radio\rhino_radio_actions_heli_transport.sqf" ];
_action_params  = [ [rhino_radio_assets#_asset_index], [] ];
_wait_players = true;

_aircraft_request_params = [ _aircraft_classname, _spawn_pos, _spawn_dir,
                             _waypoint_data, _flightaltitude, _behaviour,
                             _player_actions, _action_params, _asset_index, _wait_players ];

// request aircraft, server execution, in case the player disconects
_aircraft_request_params remoteExec [ "rhino_radio_fn_aircraft_request", 2 ];

// confirmation sound
player sideRadio rhino_radio_sound_transport_confirm;