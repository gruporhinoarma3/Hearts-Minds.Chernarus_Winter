// script: rhino_radio_gui_callsupport
// task: get the user selected GUI data and call the function to call the support
// author: |R|kiron
// date: 2020-12-24

_support = lbText[ 1500, lbCurSel ( 1500 ) ];																				// get the support type (get the selected value in the first list)
_asset = rhino_radio_assets # rr_gui_selected_assetID;																// get the selected asset
_type = lbCurSel ( 1502 );																											// get the type (get the selected index in the third list)
_amount = parseNumber( lbText [ 1503, lbCurSel ( 1503 ) ] );														// get the amount (get the selected value in the fourth list and transform it into a number)
_xcoord = parseNumber ctrlText 1400;																							// get request position
_ycoord = parseNumber ctrlText 1401;
_pos = [ _xcoord + rr_xcoord_mod, _ycoord + rr_ycoord_mod, 0 ];
rr_coord_gui = [ _xcoord, _ycoord ];

_asset_class		= _asset#rrg_index_class;																					// get asset data
_asset_type		= _asset#rrg_index_type;
_asset_state	= _asset#rrg_index_state;
_asset_index	= _asset#rrg_index_index;

if (_asset_state == rrg_state_cancel) exitWith {hint parseText( rr_str_radiomsg + "Request already canceled")};		// safety check

if ( _support == "Update" ) exitWith {																														// _____ case: Cancel request _____ //
	if (_type == 0) then {
		_group = group((crew( _asset#rrg_index_handle))#0);
		if (	( _asset_type find "Transport"	!= -1 )
			or ( _asset_type find "Supplies" 	!= -1 ) )
		then { [ [_group, [_pos], ["move"], ["vehicle this land ""GET OUT"";"] ], rhino_radio_fn_deleteWPs_addWPs ] remoteExec ["call",2]; };
		if ( _asset_type find "Supply drop"	!= -1 ) then { [[_group, 1],[ _pos, -1]] remoteExec ["setWaypointPosition",2]; };
		if ( _asset_type find "CAS"			!= -1 ) then { [[_group, 1],[ _pos, -1]] remoteExec ["setWaypointPosition",2]; };
		if ( _asset_type find "UAV recon"	!= -1 ) then { [[_group, 1],[ _pos, -1]] remoteExec ["setWaypointPosition",2]; };
		};
	if (_type == 1) then {
		[ [ _asset ], "rhino_radio\rhino_radio_gui_cancel_request.sqf" ] remoteExec ["execVM", 2];								// call cancel function
		if ( _asset_type find "Transport"	!= -1 ) exitWith { player sideRadio rhino_radio_sound_transport_cancel; };	// confirmation sound (no sound in dedicated)
		if ( _asset_type find "Supplies"		!= -1 ) exitWith { player sideRadio rhino_radio_sound_supply_cancel; };
		if ( _asset_type find "Supply drop"	!= -1 ) exitWith { player sideRadio rhino_radio_sound_supply_cancel; };
		if ( _asset_type find "CAS"			!= -1 ) exitWith { player sideRadio rhino_radio_sound_cas_cancel; };
		};
	};
																																					// _____ case: Request support _____ //
if (!(_asset_state == rrg_state_available))
exitWith { hint parseText( rr_str_radiomsg + "Asset not available") };											// check asset is available, in case another person has already requested it
[ _asset_index, rrg_index_state, rrg_state_busy ] call rhino_radio_fn_asset_list_update;				// set asset to non-available and update rhino_radio_assets variable

																																					// call the selected support with the selected asset and conditions at the selected position
if ( _support == "Transport"		) exitWith {	[ _asset_class, _asset_index, _pos, _type, _amount																] execVM "rhino_radio\rhino_radio_transport_heli.sqf"; };
if ( _support == "Supplies"		) exitWith {	_unloaddir = "rear";
																	if (( rhino_radio_assets # _asset_index )#rrg_index_load <4) then { _unloaddir = "side"; }; // If small load, small heli, lateral door. If big, rear ramp.
																	_type = (rhino_radio_gui_supply_heli#0) find ( lbText[ 1502, _type ] );
																	_supplies = ( rhino_radio_gui_supply_heli#1 )#_type;
																	if (_amount > 1)	then { for "_i" from 2 to _amount do { _supplies = _supplies+(( rhino_radio_gui_supply_heli#1 )#_type); }; };
																	[ _asset_class, _asset_index, _pos, _supplies, _unloaddir													] execVM "rhino_radio\rhino_radio_supplies_heli.sqf"; };
if ( _support == "Supply drop"	) exitWith {	[ _asset_class, _asset_index, _pos, ( rhino_radio_gui_supply_para select 1 )#_type				] execVM "rhino_radio\rhino_radio_supplies_para.sqf"; };
if ( _support == "Artillery"			) exitWith {	[ _asset_class, _asset_index, _pos, ((magazinesAmmo _asset_class)#_type)#0, _amount	] execVM "rhino_radio\rhino_radio_artillery.sqf"; };
if ( _support == "CAS"				) exitWith {	[ _asset_class, _asset_index, _pos, rhino_radio_cas_type#_type											] execVM "rhino_radio\rhino_radio_cas.sqf"; };
if ( _support == "UAV recon"	) exitWith {	[ _asset_class, _asset_index, _pos, _type, _amount																] execVM "rhino_radio\rhino_radio_uavrecon.sqf"; };