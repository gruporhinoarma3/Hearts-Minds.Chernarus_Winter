//script: rhino_radio_CAS
//author: |R|kiron
//date: 2020-11-07, 2021-09-15

params[ "_aircraft_classname", ["_asset_index",-1], ["_requested_pos",false], ["_waypoint_type",0], ["_flightaltitude",100] ];               // parameters

// if no _requested_pos given ask the user to click one map pos
_ok = true;
if (typeName _requested_pos == "BOOL") then
{
    _return = [] call rhino_radio_fn_supportpos;
    _requested_pos = _return #0;
    _ok = _return #1;
};
if ( !_ok ) exitWith { hint "Petición cancelada" };

// prepare params for aircraft request
_spawn_pos = rr_coord_ATL_base vectorAdd [0,0,0];
_spawn_dir = getDir rhino_radio_base;
_waypoint_type = ["SAD"]#_waypoint_type;
_waypoint1_data = [ _requested_pos, 50, _waypoint_type, "" ];
_waypoint2_data = [ rr_coord_ATL_base, 50, "MOVE", "((vehicle this) getVariable 'rhino_radio_asset_index') spawn rhino_radio_fn_aircraft_cancel;"];
_waypoint_data = [ _waypoint1_data, _waypoint2_data ];
_behaviour = "COMBAT";
_player_actions = [];
_action_params = [];
_wait_players = false;

_aircraft_request_params = [ _aircraft_classname, _spawn_pos, _spawn_dir, _waypoint_data, _flightaltitude, _behaviour,
                             _player_actions, _action_params, _asset_index, _wait_players ];

// request aircraft, server execution, in case the player disconects
_aircraft_request_params remoteExec [ "rhino_radio_fn_aircraft_request", 2 ];

// confirmation sound
player sideRadio rhino_radio_sound_cas_confirm;