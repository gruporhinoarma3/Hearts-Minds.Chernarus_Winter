// execVM "rhino_radio\rhino_radio_vls.sqf";
// [ l1, [0,0,0] ] spawn rhino_radio_fn_vls_map_position;
// [ l1          ] spawn rhino_radio_fn_vls_laser_position;
// [ l1          ] spawn rhino_radio_fn_vls_laser_target;

rhino_radio_fn_vls_fire = 
{
    params ["_launcher","_t1"];
    west reportRemoteTarget [ _t1, 600 ]; 
    _t1 confirmSensorTarget [ west, true ]; 
    _launcher fireAtTarget [ _t1, currentWeapon _launcher ];
};

rhino_radio_fn_vls_map_position =
{
    params [ "_launcher", "_map_pos" ];
    _t1 = createVehicle [ "Land_ClutterCutter_small_F", _map_pos, [], 0, "CAN_COLLIDE" ];//"Land_ClutterCutter_small_F", "Land_HelipadEmpty_F"
    [ _launcher, _t1 ] remoteExec ["rhino_radio_fn_vls_fire",2];
    sleep 600;
    deleteVehicle _t1;
};

rhino_radio_fn_vls_laser_position =
{
    params [ "_launcher" ];
    _t1 = createVehicle [ "Land_ClutterCutter_small_F", getPosATL laserTarget player, [], 0, "CAN_COLLIDE" ];
    [ _launcher, _t1 ] remoteExec ["rhino_radio_fn_vls_fire",2];
    sleep 600;
    deleteVehicle _t1;
};

rhino_radio_fn_vls_laser_target =
{
    params [ "_launcher" ];
    _t1 = laserTarget player;
    [ _launcher, _t1 ] remoteExec ["rhino_radio_fn_vls_fire",2];
};

rhino_radio_fn_vls_type =
{
    params[ "_launcher", "_asset_index", "_mappos", "_type", "_amount" ];
    switch ( _type ) do
    {
        case 0: { [ _launcher, _mappos ] spawn rhino_radio_fn_vls_map_position; };
        case 1: { [ _launcher          ] spawn rhino_radio_fn_vls_laser_position; };
        case 2: { [ _launcher          ] spawn rhino_radio_fn_vls_laser_target; };
        default { };
    };
    sleep (_amount * 3);
    [ _asset_index, rrg_index_state, rrg_state_available ] call rhino_radio_fn_asset_list_update; // set asset to available and update rhino_radio_assets variable
};
