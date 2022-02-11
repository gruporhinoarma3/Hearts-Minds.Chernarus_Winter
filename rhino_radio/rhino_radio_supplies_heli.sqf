//script: rhino_radio_supplies_heli
//author: |R|kiron
//date: 2020-12-24, 2021-09-15

params[ "_aircraft_classname", "_asset_index", ["_requested_pos",false], ["_type",0], ["_amount",1] ];

_ok = true;
if (typeName _requested_pos == "BOOL") then             // if no _requested_pos given ask the user to click one map pos
{
    _return = [] call rhino_radio_fn_supportpos;        // select coords with map click
    _requested_pos = _return #0;
    _ok = _return #1;
};
if ( !_ok ) exitWith { hint "Petición cancelada" };

// rhino_radio_actions_heli_supplies params
_unloadpos = "rear";                                                // If big   load, big   heli, rear ramp.
if (( rhino_radio_assets#_asset_index )#rrg_index_load <5) then     // If small load, small heli, lateral door.
{
    _unloadpos = "side";
};

_type = (rhino_radio_gui_supply_heli#0) find ( lbText[ 1502, _type ] );
_supplybox = ( rhino_radio_gui_supply_heli#1 )#_type;
if (_amount > 1) then
{
    for "_i" from 2 to _amount do
    {
        _supplybox = _supplybox+(( rhino_radio_gui_supply_heli#1 )#_type);
    };
};

// request aircraft params
_spawn_pos = rr_coord_ATL_base vectorAdd [0,0,0];
_spawn_dir = getDir rhino_radio_base;
_waypoint_data = [ [_requested_pos,50,"MOVE","vehicle this land 'LAND';"] ];
_flightaltitude = 100;
_behaviour = "AWARE";
_player_actions = [ "rhino_radio\rhino_radio_actions_heli_BIS.sqf",
                    "rhino_radio\rhino_radio_actions_heli_transport.sqf",
                    "rhino_radio\rhino_radio_actions_heli_supplies.sqf" ];
_action_params = [ [rhino_radio_assets#_asset_index],
                   [],
                   [_supplybox,_unloadpos] ];
_wait_players = true;

_aircraft_request_params = [ _aircraft_classname, _spawn_pos, _spawn_dir, _waypoint_data, _flightaltitude, _behaviour,
                             _player_actions, _action_params, _asset_index, _wait_players ];

// request aircraft, server execution, in case the player disconects
_aircraft_request_params remoteExec [ "rhino_radio_fn_aircraft_request", 2 ];

// confirmation sound
player sideRadio rhino_radio_sound_supply_confirm;