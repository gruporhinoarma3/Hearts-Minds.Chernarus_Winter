// script: rhino_radio_gui
// task: allow player with radio backpack to open a GUI for calling supports and managing supports
// author: |R|kiron
// date: 2020-12-24

// __________________________________________________________________________________________
//
// description.ext
/*
#include "rhino_radio\rhino_radio_defines.hpp"
#include "rhino_radio\rhino_radio_gui.hpp"
*/

// __________________________________________________________________________________________
//
// PARAMS and CLOSE GUI IF FAR FROM RADIO HOLDER
params[ "_radioholder" ];

[ _radioholder ] execVM "rhino_radio\rhino_radio_gui_close.sqf";

// __________________________________________________________________________________________
//
// GUI DATA CONSTANTS

rhino_radio_gui_active_list_control = 1500;	// handle of the active list

// __________________________________________________________________________________________
//
// GUI CREATION

createDialog "rhino_radio_gui";
waitUntil { !isNull (findDisplay 9999); };


// __________________________________________________________________________________________
//
// MAP CREATION

_map = findDisplay 9999 ctrlCreate ["RscMapControl", -1];
_map ctrlSetPosition [ -0.7, 0, 0.68, 1 ];
_map ctrlCommit 0;


// __________________________________________________________________________________________
//
// BUTTONS ACTIONS

// up and down

buttonSetAction [1600, "_controlID = rhino_radio_gui_active_list_control; lbSetCurSel [ _controlID, ( (lbCurSel _controlID) - 1) max 0  ];" ];
buttonSetAction [1601, "_controlID = rhino_radio_gui_active_list_control; lbSetCurSel [ _controlID, ( (lbCurSel _controlID) + 1) min ( (lbSize _controlID) - 1 )  ];" ];

// cancel and enter

rhino_radio_gui_fn_cancel = {
    lbClear rhino_radio_gui_active_list_control;														// clear the list graphics
    rhino_radio_gui_active_list_control = rhino_radio_gui_active_list_control - 1;	// set the previous list as active list
    };

rr_gui_asset_list =[];
rr_gui_selected_support = [];
rr_gui_selected_assetID = [];

rhino_radio_gui_fn_enter = {
	
	rr_coord_gui = [ parseNumber ctrlText 1400, parseNumber ctrlText 1401 ];		// get gui coords
	
	if ( lbCurSel( rhino_radio_gui_active_list_control ) < 0) exitWith {};					// no selection, do nothing
	
	if (rhino_radio_gui_active_list_control == 1503) exitWith {								// if active list is the last list call the support (no more selections to do)
		ctrlSetText [1206, "#(argb,8,8,3)color(0,1,0,1)"];										// change color to green
		[] execVM "rhino_radio\rhino_radio_gui_callsupport.sqf";								// call function to call the support
		sleep 1;																										// let the user see the color
		closeDialog 0;																								// close the GUI
		};
	
	rhino_radio_gui_active_list_control = rhino_radio_gui_active_list_control + 1;	// the active list is now the next list
	lbClear rhino_radio_gui_active_list_control;														// clear active list

	// depending on the previous selections create the new active list
	
	if (rhino_radio_gui_active_list_control == 1501) then {
		rr_gui_selected_support = lbText [ 1500, lbCurSel ( 1500 )];
		if ( rr_gui_selected_support == "Update" )																												// if "Update" or else
		then {	rr_gui_asset_list = rhino_radio_assets select {		(((_x#rrg_index_type) find "Artillery")==-1)
																							&& ((_x#rrg_index_state)==rrg_state_busy) }; }				// select assets that are not artillery and that are not available
		else {	rr_gui_asset_list = rhino_radio_assets select {		(((_x#rrg_index_type) find rr_gui_selected_support)>-1)
																							&& ((_x#rrg_index_state)==rrg_state_available) }; };			// select assets that match support and that are available
		{ lbAdd [ rhino_radio_gui_active_list_control, _x#rrg_index_callsign ]; } forEach rr_gui_asset_list;								// update list with callsign from rhino_radio_assets elements list
		/*
		{	_x = _x#rrg_index_class
			if (!((typeName _x)=="STRING")) then {_x = typeOf _x};
			lbAdd [ rhino_radio_gui_active_list_control, getText (configFile >> "CfgVehicles" >> _x >> "displayName") ];		// update list with class from rhino_radio_assets elements list
		} forEach rr_gui_asset_list;
		*/
		};
		
    if (rhino_radio_gui_active_list_control == 1502) then {
		rr_gui_selected_assetID = ( rr_gui_asset_list # lbCurSel( rhino_radio_gui_active_list_control - 1 ) )#rrg_index_index;
		if ( rr_gui_selected_support == "Transport"		) then {	{ lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach ( rhino_radio_transport_request ); };
		if ( rr_gui_selected_support == "Supplies"			) then {	{	if ( rhino_radio_gui_supply_heli#2#_forEachIndex <= ((rhino_radio_assets#rr_gui_selected_assetID)#rrg_index_load) )
																									then { lbAdd [ rhino_radio_gui_active_list_control, _x ]; };
																								} forEach (rhino_radio_gui_supply_heli #0); };
		if ( rr_gui_selected_support == "Supply drop"	) then {	{ lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach ( rhino_radio_gui_supply_para select 0 ); };
		if ( rr_gui_selected_support == "Artillery"			) then {	{ lbAdd [ rhino_radio_gui_active_list_control, (_x splitString "/")#0 ];
																								} forEach magazinesDetail( ( rhino_radio_assets # rr_gui_selected_assetID )# rrg_index_class ); };
		if ( rr_gui_selected_support == "CAS"				) then { { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach rhino_radio_cas_type; };
		if ( rr_gui_selected_support == "Update"			) then { { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach rrg_update; };
		if ( rr_gui_selected_support == "UAV recon"		) then { { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach ["Hover","Loiter"]; };
		};
		
	if (rhino_radio_gui_active_list_control == 1503) then {
		if ( rr_gui_selected_support == "Transport"		) then { { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach ( rhino_radio_flyheight ); };
		if ( rr_gui_selected_support == "Supplies"			) then {_type = (rhino_radio_gui_supply_heli#0) find ( lbText[ 1502, lbCurSel ( 1502 ) ] );
																							_load = (rhino_radio_gui_supply_heli#2)#_type;
																							_heliload = (rhino_radio_assets#rr_gui_selected_assetID)#rrg_index_load;
																							_nload = floor(_heliload/_load);
																							 for "_i" from 1 to _nload do { lbAdd [ rhino_radio_gui_active_list_control, str(_i) ]; }; };
		if ( rr_gui_selected_support == "Supply drop"	) then { lbAdd [ rhino_radio_gui_active_list_control, "1"]; };
		if ( rr_gui_selected_support == "Artillery"			) then { _piece = ( rhino_radio_assets # rr_gui_selected_assetID )# rrg_index_class;
																							if (((( magazinesAmmo _piece ) select lbCurSel( 1502 ) ) select 1)<1) exitWith { lbAdd [ rhino_radio_gui_active_list_control, "0" ]; };
																							for [{_i = 1}, {_i <= ((( magazinesAmmo _piece ) select lbCurSel( 1502 ) ) select 1)}, {_i = _i + 1}] do {
																								lbAdd [ rhino_radio_gui_active_list_control, str _i ]; }; };
		if ( rr_gui_selected_support == "CAS"				) then { lbAdd [ rhino_radio_gui_active_list_control, "1"]; };
		if ( rr_gui_selected_support == "Update"			) then { lbAdd [ rhino_radio_gui_active_list_control, "1"]; };
		if ( rr_gui_selected_support == "UAV recon"		) then { { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach ["1","2","5","10","15","20","25"]; };
		};
	lbSetCurSel [ rhino_radio_gui_active_list_control, 0]; // set default selected value as the list first value 
	
	};

buttonSetAction [1602, "if (rhino_radio_gui_active_list_control > 1500) then { [] spawn rhino_radio_gui_fn_cancel };" ];
buttonSetAction [1603, "if (rhino_radio_gui_active_list_control < 1504) then { [] spawn rhino_radio_gui_fn_enter };" ];


// 0,1,2 ... 9

rhino_radio_gui_fn_number = {
    params["_number"];
    _xcoord = ctrlText 1400;
    _ycoord = ctrlText 1401;
    if ( count _xcoord < 5 ) exitWith { ctrlSetText [ 1400, (_xcoord + _number) ] };
    if ( count _ycoord < 5 ) exitWith { ctrlSetText [ 1401, (_ycoord + _number) ] };
    };

buttonSetAction [1604, "[ '0' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1605, "[ '1' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1606, "[ '2' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1607, "[ '3' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1608, "[ '4' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1609, "[ '5' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1610, "[ '6' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1611, "[ '7' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1612, "[ '8' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1613, "[ '9' ] spawn rhino_radio_gui_fn_number;" ];

// delete
//buttonSetAction [1614, "closeDialog 0;  execVM 'rhino_radio\rhino_radio_gui.sqf';"];
rhino_radio_gui_fn_delete = {
    params["_number"];
    _xcoord = ctrlText 1400;
    _ycoord = ctrlText 1401;
    if ( count _ycoord > 0 ) exitWith { ctrlSetText [ 1401, ( _ycoord select [0, (count _ycoord)-1 ] ) ] };
    if ( count _xcoord > 0 ) exitWith { ctrlSetText [ 1400, ( _xcoord select [0, (count _xcoord)-1 ] ) ] };
    };
buttonSetAction [1614, "[] spawn rhino_radio_gui_fn_delete;" ];

// __________________________________________________________________________________________
//
// GUI INITIALIZATION

// lists
_displaycontrol = ( findDisplay 9999 ) displayCtrl 1500;
{ _displaycontrol lbAdd _x; } forEach rhino_radio_gui_list_supports;
lbSetCurSel [ 1500, 0] ;

_displaycontrol = ( findDisplay 9999 ) displayCtrl 1501;
{ _displaycontrol lbAdd _x; } forEach [ "" ];
lbSetCurSel [ 1501, 0] ;

_displaycontrol = ( findDisplay 9999 ) displayCtrl 1502;
{ _displaycontrol lbAdd _x; } forEach [ "" ];
lbSetCurSel [ 1502, 0] ;

_displaycontrol = ( findDisplay 9999 ) displayCtrl 1503;
{ _displaycontrol lbAdd _x; } forEach [ "" ];
lbSetCurSel [ 1503, 0] ;

// edits
_xcoord = str( rr_coord_gui#0 );
_ycoord = str( rr_coord_gui#1 );

while {count _xcoord < 5} do { _xcoord = "0" + _xcoord };
while {count _ycoord < 5} do { _ycoord = "0" + _ycoord };

_displaycontrol = ( findDisplay 9999 ) displayCtrl 1400;
_displaycontrol ctrlSetText _xcoord;

_displaycontrol = ( findDisplay 9999 ) displayCtrl 1401;
_displaycontrol ctrlSetText _ycoord;

/* NOTES
        lbSetData [idc, index, data];
*/