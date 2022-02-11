//script: rhino_radio_supplies_para.sqf
//author: |R|kiron
//date: 2020-11-07

params[ "_aircraft_classname", "_asset_index", ["_requested_pos",false], ["_type",0], ["_flightaltitude",100] ];

_ok = true;
if (typeName _requested_pos == "BOOL") then             // if no _requested_pos given ask the user to click one map pos
{
    _return = [] call rhino_radio_fn_supportpos;        // select coords with map click
    _requested_pos = _return #0;
    _ok = _return #1;
};
if ( !_ok ) exitWith { hint "Petición cancelada" };

// from type get the array of supplies to drop
_supplybox = ( rhino_radio_gui_supply_para #1 )#_type;

// request aircraft params
_spawn_pos = rr_coord_ATL_base vectorAdd [0,0,0];
_spawn_dir = getDir rhino_radio_base;
_waypoint1_statement =
"
    if (isServer) then
    {
        [vehicle this, " + format["%1",_supplybox] + "] execVM 'rhino_radio\rhino_radio_supplies_para_drop.sqf';
    };
    vehicle this doMove getPos rhino_radio_base;
";
_waypoint2_statement =
"
    vehicle this doMove rr_coord_cancel;
    ((vehicle this) getVariable 'rhino_radio_asset_index') spawn rhino_radio_fn_aircraft_cancel;
";
_waypoint_data = [  [_requested_pos         ,50,"MOVE",_waypoint1_statement],
                    [getPos rhino_radio_base,50,"MOVE",_waypoint2_statement] ];
_behaviour = "CARELESS";
_player_actions = [];
_action_params  = [];
_wait_players = false;

_aircraft_request_params = [ _aircraft_classname, _spawn_pos, _spawn_dir,
                             _waypoint_data, _flightaltitude, _behaviour,
                             _player_actions, _action_params, _asset_index, _wait_players ];

// request aircraft, server execution, in case the player disconects
_aircraft_request_params remoteExec [ "rhino_radio_fn_aircraft_request", 2 ];

// confirmation sound
player sideRadio rhino_radio_sound_supply_confirm;