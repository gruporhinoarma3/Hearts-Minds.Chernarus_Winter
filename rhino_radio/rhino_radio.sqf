// script: rhino_radio
// task: allow player with radio backpack to call for supports and deploy antenna for greater inter player comms range.
// author: |R|kiron
// date: 2021-03-22

// ________________________________________
// EDITOR INSTRUCTIONS
/*
MUST: create an object (ex: "Land_ClutterCutter_small_F") at ground level with variable name: rhino_radio_base
OPTIONAL (for supplies): create 3 "B_supplyCrate_F" with variable name: rhino_radio_supplies_box_1, rhino_radio_supplies_box_2, rhino_radio_supplies_box_3
OPTIONAL (for "connected to antenna at base comms boost") create an object (ex: "OmniDirectionalAntenna_01_black_F") with variable name: rhino_radio_base_antena

// add to description.ext
#include "rhino_radio\rhino_radio_defines.hpp"
#include "rhino_radio\rhino_radio_gui.hpp"

// add to init.sqf
execVM "rhino_radio\rhino_radio.sqf";
*/

// ________________________________________
//           constants
rrg_index_class		= 0;
rrg_index_type		= 1;
rrg_index_callsign	= 2; // TODO
rrg_index_time		= 3;
rrg_index_load		= 4;
rrg_index_index	= 5;
rrg_index_state	= 6;
rrg_index_handle	= 7;

rrg_state_available 	= "available";	// assets states
rrg_state_busy 		= "busy";
rrg_state_cancel 		= "cancel";

// mapGridPos offset to getPos
sleep 10;// give time to ACE, somehow this gives problems: waituntil { !(isNil "ace_common_mapGridData") };
rr_xcoord_mod = ace_common_mapGridData#0;
rr_ycoord_mod = ace_common_mapGridData#1;

// ________________________________________
//           supports available to players :
rhino_radio_gui_list_supports = [ "Transport", "Supplies", "Supply drop", "UAV recon", "Artillery", "CAS", "Update" ];

// ________________________________________
//           parameters
call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_str.sqf";
call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_params.sqf";

// ________________________________________
//           global assets list
// if ( isNil "rhino_radio_assets" ) then	{ // if the variable has not been broadcasted, create it and broadcast

if ( isServer ) then {
	rhino_radio_assets = rhino_radio_assets_list;

	{	_x append [ _forEachIndex, "available", objNull ];
		rhino_radio_assets set[ _forEachIndex, _x ];
	} forEach rhino_radio_assets;

	publicVariable "rhino_radio_assets";
	};

// ________________________________________
//           functions

rhino_radio_fn_supportpos			= compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_supportpos.sqf";
rhino_radio_fn_getposmap			= compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap.sqf";
rhino_radio_fn_getposmap_cancel = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap_cancel.sqf";
rhino_radio_fn_create_aircraft		= compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_create_aircraft.sqf";
rhino_radio_fn_check_deserted		= compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_check_deserted.sqf";
rhino_radio_fn_asset_list_update	= compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_asset_list_update.sqf";
rhino_radio_fn_deleteWPs_addWPs = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_deleteWPs_addWPs.sqf";

// ________________________________________
//           player actions

// only players from here
if ( !hasInterface ) exitWith {};

// rhino radio parent action
_condition = { ( (backpack  player) in rhino_radio_backpacks ) or ( (typeOf vehicle player) in rhino_radio_vehicles ) };
_action = ["rhino_radio", "|R|adio", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\r_ca.paa", { [player] execVM "rhino_radio\rhino_radio_gui.sqf"; }, _condition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// rhino radio apoyo cancelar
rhino_radio_selecting_map_pos = false;
_condition = { rhino_radio_selecting_map_pos };
_action = ["rhino_radio_apoyocancel", "Cancelar orden", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\x_ca.paa", { [] spawn rhino_radio_fn_getposmap_cancel }, _condition ] call ace_interact_menu_fnc_createAction; // local, only the requester hears the radio and sees the actions
[player, 1, ["ACE_SelfActions", "rhino_radio"], _action] call ace_interact_menu_fnc_addActionToObject;

// rhino radio child action
execVM "rhino_radio\rhino_radio_tfr_antena.sqf";

// rhino radio base antena action
execVM "rhino_radio\rhino_radio_tfr_baseantena.sqf";

// rhino radio external radio actions
execVM "rhino_radio\rhino_radio_external_radio.sqf";

// ________________________________________
//           object actions
{
	_x addAction [	rr_str_useradio,
							{
								params ["_target", "_caller", "_actionId", "_arguments"];
								[_caller] execVM "rhino_radio\rhino_radio_gui.sqf";
							},
							nil, 1.5, true, true, "", 
							"True",
							3, false, "", "" ];
} forEach rhino_radio_objects;

// ________________________________________
//           class actions
{
	_id				= "rhino_radio_action";
	_text 			= "|R|adio";
	_icon 			= "\A3\ui_f\data\igui\cfg\simpleTasks\letters\r_ca.paa";
	_statement	= { [player] execVM "rhino_radio\rhino_radio_gui.sqf"; };
	_condition		= { true };
	_action = [ _id, _text, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
	[ _x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
} forEach rhino_radio_classes;