//script: rhino_radio_supplies_heli
//author: |R|kiron
//date: 2020-12-24

params[ "_aircraft_class", ["_asset_index",-1], ["_requested_pos",false], "_supplybox", ["_unloadpos","rear"] ];	// parameters

if (typeName _requested_pos == "BOOL") then {																// if no _requested_pos given
    _return = [] call rhino_radio_fn_supportpos;																	// select coords
    _requested_pos = _return select 0;
    _ok = _return select 1;
    if ( !_ok ) exitWith { hint "Petición cancelada" };
};

player sideRadio rhino_radio_sound_supply_confirm;															// confirmation sound

																																		// create aircraft
_requested_pos = [ _requested_pos ];
_waypoint_statement = [ "vehicle this land 'LAND';" ];
_player_actions = [ "rhino_radio\rhino_radio_actions_heli_BIS.sqf", "rhino_radio\rhino_radio_actions_heli_transport.sqf", "rhino_radio\rhino_radio_actions_heli_supplies.sqf" ];
_action_params = [ [rhino_radio_assets#_asset_index], [], [_supplybox,_unloadpos] ];
_check_deserted = true;
_flightaltitude = "100";
_server_params = [ _aircraft_class, _requested_pos, _waypoint_statement, _player_actions, _action_params, _flightaltitude, _check_deserted, _asset_index ];
_server_code = {
	params[ "_aircraft_class", "_requested_pos", "_waypoint_statement", "_player_actions", "_action_params", "_flightaltitude", "_check_deserted", "_asset_index" ]; 

	_aircraft = [ _aircraft_class, _requested_pos, _waypoint_statement, _player_actions, _action_params, _flightaltitude ]
					 call rhino_radio_fn_create_aircraft;																								// create vehicle with crew
	_crew = crew _aircraft;
	_unit = group (_crew select 0);

	if ( _asset_index < 0 ) exitWith {};
	[ _asset_index, rrg_index_handle, _aircraft ] call rhino_radio_fn_asset_list_update;										// add aircraft handle to list of assets

    if ( _check_deserted ) then { _handle_check_deserted = [_aircraft] spawn rhino_radio_fn_check_deserted;	// wait until aircraft is deserted or crew dead
												waitUntil { scriptDone _handle_check_deserted }; };
	
	_asset_state = ( rhino_radio_assets # _asset_index )#rrg_index_state;
	if ( _asset_state == rrg_state_busy ) then {																									// cancel request if has not been previously cancel
		[ [ _asset ], "rhino_radio\rhino_radio_gui_cancel_request.sqf" ] remoteExec ["execVM", 2]; };
	};
_server_func = "bis_fnc_spawn";// bis_fnc_call bis_fnc_spawn
[ _server_params, _server_code ] remoteExec [ _server_func, 2 ];																	// server only, in case the player disconects