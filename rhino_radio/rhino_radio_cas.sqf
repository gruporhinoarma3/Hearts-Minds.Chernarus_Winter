//script: rhino_radio_CAS
//author: |R|kiron
//date: 2020-11-07

params[ "_aircraft_classname", ["_asset_index",-1], ["_requested_pos",false], ["_waypoint_type","SAD"] ];			// parameters

if (typeName _requested_pos == "BOOL") then {																									// if no _requested_pos given
    _return = [] call rhino_radio_fn_supportpos;																										// select coords
    _requested_pos = _return select 0;
    _ok = _return select 1;
    if ( !_ok ) exitWith { hint "Petición cancelada" };
};

_aircraft = createVehicle [ _aircraft_classname, (getPosATL rhino_radio_base) vectorAdd [0,0,500], [], 0, "FLY"];	// create aircraft unit
createVehicleCrew _aircraft;
_aircraft_crew = crew _aircraft;
_aircraft_unit = group (_aircraft_crew select 0);

_wp0 = _aircraft_unit addWaypoint [ _requested_pos , 0];																					// create waypoint to requested pos
_wp0 setWaypointType _waypoint_type;

_wp0 = _aircraft_unit addWaypoint [ getPosATL rhino_radio_base , 1];																	// create waypoint out
_wp0 setWaypointType "MOVE";
_wp0 setWaypointStatements ["true", "deleteVehicle vehicle this; deleteVehicle this;"];

player sideRadio rhino_radio_sound_cas_confirm;																									// confirmation sound

if ( _asset_index < 0 ) exitWith {};
[ _asset_index, rrg_index_handle, _aircraft ] call rhino_radio_fn_asset_list_update;												// add aircraft handle to list of assets

_asset_time = (rhino_radio_assets # _asset_index) # rrg_index_time;																	// let aircraft operate for the availability time
sleep _asset_time;
_aircraft_unit setBehaviour "CARELESS";

_asset_state = (rhino_radio_assets # _asset_index) # rrg_index_state;																// cancel request if has not been previously cancel
if ( _asset_state == rrg_state_busy ) then { 
	[ [ _asset ], "rhino_radio\rhino_radio_gui_cancel_request.sqf" ] remoteExec ["execVM", 2]; };