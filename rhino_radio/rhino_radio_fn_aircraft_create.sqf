// script: rhino_radio_fn_aircraft_create.sqf
// author: |R|Kiron
/*
date: 2020-11-01
task: creates aircraft, with waypoints and player actions

waypoint_data = [   [ _wp1_pos, _wp1_completion_radius, _wp1_type, _wp1_statement],
                    [ _wp2_pos, _wp2_completion_radius, _wp2_type, _wp2_statement]
                ];
*/

params[ "_aircraft_classname", "_spawn_pos", "_spawn_dir", "_waypoint_data", "_flightaltitude", "_behaviour","_player_actions", "_action_params" ];

// create object options if plane or not (helicopter)
_spawn_type = "NONE";
_spawn_vel = 0;
if ( _aircraft_classname isKindOf "plane" ) then
{
    _spawn_type = "FLY";
    _spawn_vel = 150;
};

// create object
_aircraft = createVehicle [ _aircraft_classname, _spawn_pos , [], 0, _spawn_type  ];
_aircraft setDir _spawn_dir;
_aircraft setVelocityModelSpace [0, _spawn_vel, 0];

// create crew
createVehicleCrew _aircraft;
_crew = crew _aircraft;
_unit = group (_crew select 0);

// create waypoint to requested pos
[ _unit, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;

// altitude
_aircraft flyInHeight _flightaltitude;

// behaviour
_unit setBehaviour _behaviour;

// add aircraft actions for all players
{ [ [ _aircraft, _action_params#_forEachIndex  ] , _x ] remoteExec ["BIS_fnc_execVM", 0];
} forEach _player_actions;

_aircraft