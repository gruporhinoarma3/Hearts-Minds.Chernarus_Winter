// script: rhino_radio_artillery.sqf
// author: |R|Kiron
// date: 2020-11-07

params ["_unit", ["_asset_index",-1], ["_requested_pos",false], ["_ammo_type",""], ["_ammo_count",1]  ];    //params

_array_mags = magazinesAmmo _unit;                                                                          // check ammo
_ammo_left = 0;
{ if ((_x select 0) == _ammo_type) exitWith { _ammo_left = _x select 1 };
} forEach _array_mags;
if ( _ammo_left < _ammo_count ) exitWith { hint parseText ( rr_str_radiomsg + rr_str_noammo) };

_ok = true;
if (typeName _requested_pos == "BOOL") then                                                                 // if no _requested_pos given
{
    _return = call rhino_radio_fn_supportpos;                                                               // select coords with map click
    _requested_pos = _return #0;
    _ok = _return #1;
};
if ( !_ok ) exitWith { hint parseText ( rr_str_radiomsg + rr_str_baddata) };                                // if no click, cancel and let the user know

//enableEngineArtillery true;

if (!( _requested_pos inRangeOfArtillery [[_unit], _ammo_type] ) ) exitWith                                 // range verification
{
    hint parseText (rr_str_radiomsg + rr_str_outofrange);                                                   //  if out of range, let the user know
    if ( _asset_index > -1 ) then
    {
        [ _asset_index, rrg_index_state, rrg_state_available ] call rhino_radio_fn_asset_list_update;       // and set asset to available
    };
};

player sideRadio "mp_groundsupport_45_artillery_BHQ_0";                                                     // sound confirmation

_eta = _unit getArtilleryETA [_requested_pos, _ammo_type] ;                                                 // eta confirmation
hint parseText ( rr_str_radiomsg + rr_str_eta + (str round(_eta)) + " s.");                                 // let the user know

[ _unit, [_requested_pos, _ammo_type, _ammo_count] ] remoteExec [ "commandArtilleryFire", _unit ];          // command artillery fire

//enableEngineArtillery false;

if ( _asset_index > -1 ) then                                                                               // artillery unit ready to fire again after some time
{
    _asset_time = ( rhino_radio_assets # _asset_index ) # rrg_index_time;                                   // get asset "availability time"
    sleep (_asset_time*( _ammo_count )+10);                                                                 // wait the "availability time" times de "number of rounds"+10 (artillery aiming time)
    [ _asset_index, rrg_index_state, rrg_state_available ] call rhino_radio_fn_asset_list_update;           // set asset to available
}
else { sleep 300; };                                                                                        // if no _asset_index, simply wait 5 min

hint parseText ( rr_str_radiomsg + rr_str_roundscomplete)                                                   // let the user know