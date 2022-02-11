// script: rhino_radio_gui_callsupport
// task: get the user selected GUI data and call the function to call the support
// author: |R|kiron
// date: 2020-12-24

_support = lbText[ 1500, lbCurSel ( 1500 ) ];                   // get the support type (get the selected value in the first list)
_asset = rhino_radio_assets # rr_gui_selected_assetID;          // get the selected asset
_type = lbCurSel ( 1502 );                                      // get the type (get the selected index in the third list)
_amount = parseNumber( lbText [ 1503, lbCurSel ( 1503 ) ] );    // get the amount (get the selected value in the fourth list and transform it into a number)
_xcoord = parseNumber ctrlText 1400;                            // get request position X coord
_ycoord = parseNumber ctrlText 1401;                            // get request position Y coord
_pos = [ _xcoord + rr_xcoord_mod, _ycoord + rr_ycoord_mod, 0 ]; // get request position

_asset_class = _asset#rrg_index_class;                          // get asset data
_asset_type  = _asset#rrg_index_type;
_asset_state = _asset#rrg_index_state;
_asset_index = _asset#rrg_index_index;

if (_asset_state == rrg_state_cancel) exitWith {hint parseText( rr_str_radiomsg + rr_str_cancel1)};		// safety check

if ( _support == "Update" ) exitWith    // Cancel or modify request
{
    if (isNull(_asset#rrg_index_handle)) exitWith { hint rr_str_assetnotdeployed }; // if not varname, asset not created
    if (_type == 0) exitWith            // change support position
    {
        _group = group((crew( _asset#rrg_index_handle))#0);
        if (   ( _asset_type find "Transport"   != -1 )
            or ( _asset_type find "Supplies"    != -1 ) ) exitWith
        {
            [ _group, [_pos,50,"MOVE","vehicle this land ""GET OUT"";"] ] remoteExec ["rhino_radio_fn_deleteWPs_addWPs",2];
        };
        if ( _asset_type find "Supply drop" != -1 ) exitWith { [ [_group, 1], [ _pos, -1] ] remoteExec ["setWaypointPosition",2]; };
        if ( _asset_type find "CAS"         != -1 ) exitWith { [ [_group, 1], [ _pos, -1] ] remoteExec ["setWaypointPosition",2]; };
        if ( _asset_type find "UAV recon"   != -1 ) exitWith { [ [_group, 1], [ _pos, -1] ] remoteExec ["setWaypointPosition",2]; };
        hint rr_str_position_cancel;
    };
    if (_type == 1) exitWith            // RTB: cancel support
    {
        [ _asset_index ] remoteExec ["rhino_radio_fn_aircraft_cancel", 2];                                              // call cancel function
        if ( _asset_type find "Transport"   != -1 ) exitWith { player sideRadio rhino_radio_sound_transport_cancel; };  // confirmation sound (no sound in dedicated)
        if ( _asset_type find "Supplies"    != -1 ) exitWith { player sideRadio rhino_radio_sound_supply_cancel; };
        if ( _asset_type find "Supply drop" != -1 ) exitWith { player sideRadio rhino_radio_sound_supply_cancel; };
        if ( _asset_type find "CAS"         != -1 ) exitWith { player sideRadio rhino_radio_sound_cas_cancel; };
        hint rr_str_position_cancel;
    };
    if (_type == 2) exitWith            // support info
    {
        if ( !alive(_asset#rrg_index_handle) ) exitWith
        {
            hint parseText( rr_str_radiomsg + "Asset MIA." )
        };
        _str_asset = _asset#rrg_index_callsign;
        _pos = getPos( _asset#rrg_index_handle );
        _str = composeText [parseText( rr_str_radiomsg ), lineBreak,
                            'Alias: ' + _str_asset, lineBreak,
                            'Corrd X: ' + str(round(_pos#0)), lineBreak,
                            'Coord Y: ' + str(round(_pos#1)), lineBreak,
                            'Altura: ' + str(round(_pos#2)) ];
        hint _str; // hint position
    };
};

// Request support
if (!(_asset_state == rrg_state_available)) exitWith                                     // check asset is available, in case another person has already requested it
{
    hint parseText( rr_str_radiomsg + "Asset not available")
};
[ _asset_index, rrg_index_state, rrg_state_busy ] call rhino_radio_fn_asset_list_update; // set asset to non-available and update rhino_radio_assets variable

// call the selected support with the selected asset and conditions at the selected position
if ( _support == "Transport"              ) exitWith { [ _asset_class, _asset_index, _pos, _type, _amount                                  ] execVM "rhino_radio\rhino_radio_transport_heli.sqf"; };
if ( _support == "Supplies"               ) exitWith { [ _asset_class, _asset_index, _pos, _type, _amount                                  ] execVM "rhino_radio\rhino_radio_supplies_heli.sqf"; };
if ( _support == "Supply drop"            ) exitWith { [ _asset_class, _asset_index, _pos, _type, _amount                                  ] execVM "rhino_radio\rhino_radio_supplies_para.sqf"; };
if ( _support == rrg_supportID_artillery  ) exitWith { [ _asset_class, _asset_index, _pos, ((magazinesAmmo _asset_class)#_type)#0, _amount ] execVM "rhino_radio\rhino_radio_artillery.sqf"; };
if ( _support == "CAS"                    ) exitWith { [ _asset_class, _asset_index, _pos, _type, _amount                                  ] execVM "rhino_radio\rhino_radio_cas.sqf"; };
if ( _support == "UAV recon"              ) exitWith { [ _asset_class, _asset_index, _pos, _type, _amount                                  ] execVM "rhino_radio\rhino_radio_uavrecon.sqf"; };
if ( _support == rrg_supportID_cruisemisil) exitWith { [ _asset_class, _asset_index, _pos, _type, _amount                                  ] spawn rhino_radio_fn_vls_type; };
