//script: rhino_radio_uavrecon.sqf
//author: |R|kiron
//date: 2021-03-24, 2021-09-15

params[ "_aircraft_classname", "_asset_index", ["_requested_pos",false], ["_waypoint_type",1], ["_flightaltitude",5] ]; // input parameters

_ok = true;
if (typeName _requested_pos == "BOOL") then                     // if no _requested_pos given ask the user to click one map pos
{
    _return = [] call rhino_radio_fn_supportpos;                // select coords with map click
    _requested_pos = _return #0;
    _ok = _return #1;
};
if ( !_ok ) exitWith { hint "Petición cancelada" };

_spawn_pos = (getPosATL rhino_radio_base) vectorAdd [0,0,500];
_spawn_dir = getDir rhino_radio_base;
_waypointtype = ["MOVE","LOITER"]#_waypoint_type;
_flightaltitude = _flightaltitude*100;

_server_params = [ _aircraft_classname, _asset_index, _spawn_pos, _spawn_dir, _requested_pos, _waypointtype, _flightaltitude ];
_server_code =
{
    params[ "_aircraft_classname", "_asset_index", "_spawn_pos", "_spawn_dir", "_requested_pos", "_waypointtype", "_flightaltitude" ]; 

    _aircraft = createVehicle [ _aircraft_classname, _spawn_pos, [], 0, "FLY" ];            // create aircraft
    _aircraft setDir _spawn_dir;
    createVehicleCrew _aircraft;
    _aircraft setVelocityModelSpace [0, 100, 0];
    _aircraft_crew = crew _aircraft;
    _aircraft_unit = group (_aircraft_crew select 0);
    
    _aircraft flyInHeight 100;                                                              // set ATL flight altitude
    _aircraft flyInHeightASL [_flightaltitude, _flightaltitude, _flightaltitude];           // set ASL flight altitude, the highest at any time is chosen
    
    _wp0 = _aircraft_unit addWaypoint [ _requested_pos , 0];                                // create waypoint to requested pos
    _wp0 setWaypointType _waypointtype;
    
    if (_waypointtype == "LOITER") then                                                     // special waypoint configuration
    {
        _wp0 setWaypointLoiterType "CIRCLE";
        _wp0 setWaypointLoiterRadius _flightaltitude;
        _wp0 setWaypointLoiterAltitude _flightaltitude;
    };
    _aircraft_unit setBehaviour "CARELESS";                                                 // no shooting

    [ _asset_index, rrg_index_handle, _aircraft ] call rhino_radio_fn_asset_list_update;    // add aircraft handle to list of assets

    //sleep ( ( rhino_radio_assets # _asset_index )#rrg_index_time );                         // let the uav operate for a given time
    sleep 7200; //2h
    
    _asset_state = ( rhino_radio_assets # _asset_index )#rrg_index_state;
    if ( _asset_state == rrg_state_busy ) then                                              // cancel request if has not been previously cancelled
    {
        [ _asset_index ] remoteExec ["rhino_radio_fn_aircraft_cancel", 2];                  // cancel request if has not been previously cancel
    };
};
[ _server_params, _server_code ] remoteExec [ "bis_fnc_spawn", 2 ]; // server only, in case the player disconects // bis_fnc_call, bis_fnc_spawn

player sideRadio rhino_radio_sound_cas_confirm;                     // confirmation sound