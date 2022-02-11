//script: rhino_radio_uavrecon.sqf
//author: |R|kiron
//date: 2021-03-24

params[ "_aircraft_class", ["_asset_index",-1], ["_requested_pos",false], ["_type",0], ["_flightaltitude",5] ];	// input parameters

if (typeName _requested_pos == "BOOL") then {																								// if no _requested_pos given ask the user to click one
    _return = [] call rhino_radio_fn_supportpos;																									// select coords with map click
    _requested_pos = _return select 0;
    _ok = _return select 1;
    if ( !_ok ) exitWith { hint "Petición cancelada" };
};

//player sideRadio rhino_radio_sound_transport_confirm;																						// confirmation sound

_waypointtype = ["MOVE","LOITER"]#_type;
_flightaltitude = _flightaltitude*100;

_server_params = [ _aircraft_class, _requested_pos, _waypointtype, _flightaltitude, _asset_index ];
_server_code = {

	params[ "_aircraft_class", "_requested_pos", "_waypointtype", "_flightaltitude", "_asset_index" ]; 

	_aircraft = createVehicle [ _aircraft_class, (getPosATL rhino_radio_base) vectorAdd [0,0,500], [], 0, "FLY"	];	// create aircraft
	_aircraft setDir getDir rhino_radio_base;
	createVehicleCrew _aircraft;
	_aircraft setVelocityModelSpace [0, 100, 0];
	_crew = crew _aircraft;
	_unit = group (_crew select 0);
	_aircraft flyInHeight _flightaltitude;																													// set flight altitude
	_wp0 = _unit addWaypoint [ _requested_pos , 0];																						// create waypoint to requested pos
	_wp0 setWaypointType _waypointtype;
	if (_waypointtype == "LOITER") then {	_wp0 setWaypointLoiterType "CIRCLE";
																_wp0 setWaypointLoiterRadius _flightaltitude;
																_wp0 setWaypointLoiterAltitude _flightaltitude; };
	_unit setBehaviour "CARELESS";																													// no shooting

	if ( _asset_index < 0 ) exitWith {};
	[ _asset_index, rrg_index_handle, _aircraft ] call rhino_radio_fn_asset_list_update;										// add aircraft handle to list of assets

	sleep (( rhino_radio_assets # _asset_index )#rrg_index_time);																		// let the uav operate for a given time

	_asset_state = ( rhino_radio_assets # _asset_index )#rrg_index_state;
	if ( _asset_state == rrg_state_busy ) then {																									// cancel request if has not been previously cancelled
		[ [ _asset ], "rhino_radio\rhino_radio_gui_cancel_request.sqf" ] remoteExec ["execVM", 2];
		};
		
	};
_server_func = "bis_fnc_spawn";	// bis_fnc_call bis_fnc_spawn
[ _server_params, _server_code ] remoteExec [ _server_func, 2 ];																	// server only, in case the player disconects