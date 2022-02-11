// script: rhino_radio_fn_create_aircraft.sqf
// author: |R|Kiron
// date: 2020-11-01
//
// rhino_radio_fn_create_aircraft
// creates aircraft, with waypoints and mouse wheel actions
 

params[ "_aircraft_class", "_requested_pos", "_waypoint_statement", "_player_actions", "_action_params", "_flightaltitude" ];
	
// create unit
_aircraft = "";
if ( _aircraft_class isKindOf "plane" )
then { _aircraft = createVehicle [ _aircraft_class, (getPosATL rhino_radio_base) vectorAdd [0,0,500]	, [], 0, "FLY"		]; }
else { _aircraft = createVehicle [ _aircraft_class, getPosATL rhino_radio_base									, [], 0, "NONE"	]; };
_aircraft setDir getDir rhino_radio_base;
createVehicleCrew _aircraft;
if ( _aircraft_class isKindOf "plane" ) then { _aircraft setVelocityModelSpace [0, 150, 0]; };
_crew = crew _aircraft;
_unit = group (_crew select 0);

// create waypoint to requested pos
{	_wp0 = _unit addWaypoint [ _x , _forEachIndex];
	_wp0 setWaypointType "move";
	_wp0 setWaypointCompletionRadius 50;
	_wp0 setWaypointStatements [ "true", _waypoint_statement # _forEachIndex ];
} forEach _requested_pos;

// altitude
_aircraft flyInHeight parseNumber _flightaltitude;

// aircraft actions for all players
{ [ [ _aircraft, _action_params#_forEachIndex  ] , _x ] remoteExec ["BIS_fnc_execVM", 0]; }  forEach _player_actions;

_aircraft