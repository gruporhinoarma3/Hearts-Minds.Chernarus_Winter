// script: rhino_radio_fn_aircraft_cancel
// task: if alive, send the aircraft to cancel position and delete it, wait the asset time and set available again
// author: |R|kiron
// date: 2020-11-07, 2021-09-15

params[ "_asset_index" ];

if (!isServer) exitWith {};

_asset = rhino_radio_assets#_asset_index;
_asset_type  = _asset#rrg_index_type;                                                                           // get asset data
_asset_time  = _asset#rrg_index_time;
_asset_state = _asset#rrg_index_state;
_asset_veh   = _asset#rrg_index_handle;

if (_asset_state == rrg_state_cancel) exitWith
{
    hint parseText( rr_str_radiomsg + rr_str_cancel1);                                                          // safety check (no message in dedicated)
};
[ _asset_index, rrg_index_state, rrg_state_cancel ] call rhino_radio_fn_asset_list_update;                      // update asset state

if (alive _asset_veh) then
{
    _vehicle_crew = crew _asset_veh;                                                                            // get crew handle for waypoint modification
    _vehicle_unit = group ( _vehicle_crew #0 );                                                                 // get group handle for waypoint modification
    _statement = "_crew = crew vehicle this; deleteVehicle vehicle this; { deleteVehicle _x } forEach _crew;";  // waypoint statement, delete all
    _waypoint_data = [ [ rr_coord_cancel, 50, "MOVE", _statement] ];
    [ _vehicle_unit, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;                                     // delete all unit waypoimts and add cancel waypoint
    _asset_veh flyInHeight 100;
    _vehicle_unit setBehaviour "CARELESS";                                                                      // behaviour so it will go to the waypoint ignoring enemies
    _asset_veh doMove rr_coord_cancel;                                                                          // force movement
    //while { _asset_veh distance rr_coord_cancel > 200 } do { sleep 1; };
    //_crew = crew vehicle this;
    //deleteVehicle vehicle this;
    //{ deleteVehicle _x; } forEach _crew;
};

sleep _asset_time;                                                                                              // wait asset availability time
[ _asset_index, rrg_index_state, rrg_state_available ] call rhino_radio_fn_asset_list_update;                   // set asset to available

// clean garbage if not already deleted, gives ERROR, to correct
{
    if (alive _x) then
    {
        _asset_veh deleteVehicleCrew _x;
    };
} forEach crew _asset_veh;
deleteVehicle _asset_veh;