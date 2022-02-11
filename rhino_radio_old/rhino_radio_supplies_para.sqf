//script: rhino_radio_supplies_para.sqf
//author: |R|kiron
//date: 2020-11-07

params[ "_aircraft_class", ["_asset_index",-1], ["_requested_pos",false], "_supplybox" ];			// parameters

if (typeName _requested_pos == "BOOL") then {																		// if no _requested_pos given
    _return = call rhino_radio_fn_supportpos;																				// select coords
    _requested_pos = _return select 0;
    _ok = _return select 1;
    if ( !_ok ) exitWith { hint "Petición cancelada" };
};

player sideRadio rhino_radio_sound_supply_confirm;																	// confirmation sound

																																				// server create aircraft
_requested_pos = [ _requested_pos, getPos rhino_radio_base, rr_coord_cancel ];
_waypoint_statement = [	"if (isServer) then { [vehicle this, " + format["%1",_supplybox] + "] execVM 'rhino_radio\rhino_radio_supplies_para_drop.sqf'; };
										_index = [];
										{ if !(isnull(_x#rrg_index_handle)) exitWith { if ((vehicle this)==(_x#rrg_index_handle)) exitWith {_index = _x#rrg_index_index};};} forEach rhino_radio_assets;
										[ _index, rrg_index_state, rrg_state_cancel ] call rhino_radio_fn_asset_list_update;",
										"",
										"_veh = vehicle this; {_veh deleteVehicleCrew _x} forEach crew _veh; deleteVehicle _veh;" ];
_player_actions = [];
_action_params = [];
_check_deserted = false;
_flightaltitude = "100";
_server_params = [ _aircraft_class, _requested_pos, _waypoint_statement, _player_actions, _action_params, _flightaltitude, _check_deserted, _asset_index ];
_server_code = {
	params[ "_aircraft_class", "_requested_pos", "_waypoint_statement", "_player_actions", "_action_params", "_flightaltitude", "_check_deserted", "_asset_index" ]; 

	_aircraft = [ _aircraft_class, _requested_pos, _waypoint_statement, _player_actions, _action_params, _flightaltitude ]
					 call rhino_radio_fn_create_aircraft;																												// create vehicle with crew
	_crew = crew _aircraft;
	_unit = group (_crew select 0);

	if ( _asset_index < 0 ) exitWith {};
	[ _asset_index, rrg_index_handle, _aircraft ] call rhino_radio_fn_asset_list_update;														// add aircraft handle to list of assets

    if ( _check_deserted ) then { _handle_check_deserted = [_aircraft] spawn rhino_radio_fn_check_deserted;					// wait until aircraft is deserted or crew dead
												waitUntil { scriptDone _handle_check_deserted }; };
	
	_asset_time = (rhino_radio_assets#_asset_index)#rrg_index_time;																				// let aircraft operate for the availability time
	sleep _asset_time;
	_aircraft_unit setBehaviour "CARELESS";
	
	_asset_state = ( rhino_radio_assets # _asset_index )#rrg_index_state;
	if ( _asset_state == rrg_state_busy ) then { [ _asset ] spawn rhino_radio_gui_cancel_request; };								// cancel request if has not been previously cancel
	};
_server_func = "bis_fnc_spawn";// bis_fnc_call bis_fnc_spawn
[ _server_params, _server_code ] remoteExec [ _server_func, 2 ];																					// server only, in case the player disconects