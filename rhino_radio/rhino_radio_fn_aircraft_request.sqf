/*
script: rhino_radio_fn_aircraft_request
author: |R|kiron
date: 2021-09-15
call example:
_aircraft_classname = "classname";
_spawn_pos = getPosATL _object;// [0,0,0]
_spawn_dir = getDir _object;   // 90
_requested_pos      = [0,0,0];
_wp_done_radius     = 50
_waypoint_type      = "MOVE";
_waypoint_statement = "vehicle this land ""GET OUT""; _group setBehaviour ""AWARE"";;
_waypoint_data = [ [_requested_pos,_wp_done_radius,_waypoint_type,_waypoint_statement] ];
_flightaltitude = 100;
_player_actions = [ "rhino_radio\rhino_radio_actions_heli_BIS.sqf", "rhino_radio\rhino_radio_actions_heli_transport.sqf" ];
_action_params  = [ [rhino_radio_assets#_asset_index]             , []                                                   ]
_asset_index = 1;
_wait_players = false;
_aircraft_request_params = [ "_aircraft_classname", "_spawn_pos", "_spawn_dir", "_waypoint_data", "_flightaltitude",
        "_player_actions", "_action_params", "_asset_index", "_wait_players" ]
_aircraft_request_params remoteExec [ "rhino_radio_fn_aircraft_request", 2 ];
*/
params[ "_aircraft_classname", "_spawn_pos", "_spawn_dir", "_waypoint_data", "_flightaltitude","_behaviour",
        "_player_actions", "_action_params", "_asset_index", "_wait_players" ]; 

if (!isServer) exitWith { hint "rhino_radio_fn_aircraft_request must be only executed by server. Execution stopped."; };

_aircraft_params = [    _aircraft_classname, _spawn_pos, _spawn_dir, _waypoint_data,
                        _flightaltitude, _behaviour, _player_actions, _action_params ];
_aircraft = _aircraft_params call rhino_radio_fn_aircraft_create;                       // create vehicle with crew

_aircraft setVariable ["rhino_radio_asset_index", _asset_index, true];                  // store rhino radio asset index into vehicle for everyone and JIP.

[ _asset_index, rrg_index_handle, _aircraft ] call rhino_radio_fn_asset_list_update;    // add aircraft handle to list of assets

if ( _wait_players ) then
{
    _handle_check_deserted = [_aircraft] spawn rhino_radio_fn_check_deserted;           // wait until aircraft is deserted or crew dead
    waitUntil { scriptDone _handle_check_deserted };
}
else
{
    _asset_time = (rhino_radio_assets#_asset_index)#rrg_index_time;                     // OR let aircraft operate for the availability time
    sleep _asset_time;
};

_asset_state = ( rhino_radio_assets # _asset_index )#rrg_index_state;
if ( _asset_state == rrg_state_busy ) then
{
    _asset_index spawn rhino_radio_fn_aircraft_cancel;                                   // cancel request if has not been previously canceled
};