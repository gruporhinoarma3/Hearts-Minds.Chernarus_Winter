// script: rhino_radio_gui_cancel_request
// task: get the user selected GUI data and call the function to call the support
// author: |R|kiron
// date: 2020-11-07

params[ "_asset" ];

_asset_type		= _asset#rrg_index_type;																										// get asset data
_asset_time		= _asset#rrg_index_time;
_asset_index	= _asset#rrg_index_index;
_asset_state	= _asset#rrg_index_state;
_asset_veh		= _asset#rrg_index_handle;

if (_asset_state == rrg_state_cancel) exitWith {hint parseText( rr_str_radiomsg + "Request already cancel");};// safety check (no message in dedicated)
[ _asset_index, rrg_index_state, rrg_state_cancel ] call rhino_radio_fn_asset_list_update;									// update asset state

if (alive _asset_veh) then {
	_vehicle_crew = crew _asset_veh;																												// get crew handle for waypoint modification
	_vehicle_unit = group ( _vehicle_crew select 0 );																							// get group handle for waypoint modification
	for "_i" from count waypoints _vehicle_unit - 1 to 0 step -1 do { deleteWaypoint [ _vehicle_unit , _i ]; };		// delete all unit waypoimts
	_statement = "_crew = crew vehicle this; deleteVehicle vehicle this; { deleteVehicle _x; } forEach _crew;";	// waypoint statement
	_wp0 = _vehicle_unit addWaypoint [ rr_coord_cancel , 1];																			// add cancel waypoint
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointStatements ["true", _statement ];
	_asset_veh flyInHeight 100;
	_vehicle_unit setBehaviour "CARELESS";																										// behaviour so it will go to the waypoint ignoring enemies
	};

sleep _asset_time;																																			// wait asset availability time
[ _asset_index, rrg_index_state, rrg_state_available ] call rhino_radio_fn_asset_list_update;								// set asset to available

_vehicle_crew = crew _asset_veh;
{ if (alive _x) then { _asset_veh deleteVehicleCrew _x; }; } forEach _vehicle_crew;											// clean garbage if not already deleted, gives error, to correct
deleteVehicle _asset_veh;