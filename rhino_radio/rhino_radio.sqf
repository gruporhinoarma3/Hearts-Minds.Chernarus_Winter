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
#include "rhino_radio\rhino_radio_gui_defines.hpp"
#include "rhino_radio\rhino_radio_gui.hpp"

// add to init.sqf
execVM "rhino_radio\rhino_radio.sqf";

// update "rhino_radio\rhino_radio_params.sqf" following mission vehicles and needs.
*/

// ________________________________________
//           constants
rrg_index_class		= 0; // handle for artillery
rrg_index_type		= 1;
rrg_index_callsign	= 2;
rrg_index_time		= 3;
rrg_index_load		= 4;
rrg_index_index		= 5;
rrg_index_state		= 6;
rrg_index_handle	= 7;

rrg_state_available = "available";	// assets states
rrg_state_busy      = "busy";
rrg_state_cancel    = "cancel";

rr_coord_ATL_base = getPosATL rhino_radio_base;

// mapGridPos offset to getPos
sleep 10;                                           // give ACE3 time to initialize its varaibles...
//waituntil { !(isNil "ace_common_mapGridData") };  // ...because somehow this gives problems
rr_xcoord_mod = ace_common_mapGridData#0;
rr_ycoord_mod = ace_common_mapGridData#1;

// ________________________________________
//           parameters
call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_str.sqf";
call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_params.sqf";

// ________________________________________
//           global assets list
// if ( isNil "rhino_radio_assets" ) then	{}; // if the variable has not been broadcasted, create it and broadcast

if ( isServer ) then
{
    call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_assets_init.sqf";
    call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_artillery_asset_add.sqf";
};

// ________________________________________
// compile functions

rhino_radio_fn_supportpos           = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_supportpos.sqf";
rhino_radio_fn_getposmap            = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap.sqf";
rhino_radio_fn_getposmap_cancel     = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap_cancel.sqf";
rhino_radio_fn_aircraft_request     = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_aircraft_request.sqf";
rhino_radio_fn_aircraft_create      = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_aircraft_create.sqf";
rhino_radio_fn_aircraft_cancel      = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_aircraft_cancel.sqf";
rhino_radio_fn_check_deserted       = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_check_deserted.sqf";
rhino_radio_fn_asset_list_update    = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_asset_list_update.sqf";
rhino_radio_fn_deleteWPs_addWPs     = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_deleteWPs_addWPs.sqf";
execVM "rhino_radio\rhino_radio_vls.sqf";

// compile GUI buttons functions
call compile preProcessFile "rhino_radio\rhino_radio_gui_button_functions.sqf";

// ________________________________________
//           player actions

// only players from here
if ( !hasInterface ) exitWith {};

// rhino radio parent action
_id         = "rhino_radio";
_text       = rr_str_rhinoradio;
_icon       = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\r_ca.paa";
_statement  = { [player] execVM "rhino_radio\rhino_radio_gui.sqf"; };
_condition  = { ( (backpack  player) in rhino_radio_backpacks ) or ( (typeOf vehicle player) in rhino_radio_vehicles ) };
_action = [ _id, _text, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// rhino radio child actions

// rhino radio apoyo cancelar
rhino_radio_selecting_map_pos = false;
_id         = "rhino_radio_apoyocancel";
_text       = "Cancelar orden";
_icon       = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\x_ca.paa";
_statement  = { [] spawn rhino_radio_fn_getposmap_cancel; };
_condition  = { rhino_radio_selecting_map_pos };
_action = [ _id, _text, _icon, _statement, _condition ] call ace_interact_menu_fnc_createAction; // local, only the requester hears the radio and sees the actions
[player, 1, ["ACE_SelfActions", "rhino_radio"], _action] call ace_interact_menu_fnc_addActionToObject;

// rhino radio deployable antenna
execVM "rhino_radio\rhino_radio_tfr_antena.sqf";

// rhino radio base antenna action
execVM "rhino_radio\rhino_radio_tfr_baseantena.sqf";

// rhino radio external radio actions
execVM "rhino_radio\rhino_radio_external_radio.sqf";

// ________________________________________
//           add rhino radio utility to classes through ACE action
{
	_id				= "rhino_radio_action";
	_text 			= rr_str_rhinoradio;
	_icon 			= "\A3\ui_f\data\igui\cfg\simpleTasks\letters\r_ca.paa";
	_statement	= { [player] execVM "rhino_radio\rhino_radio_gui.sqf"; };
	_condition		= { true };
	
	_action = [ _id, _text, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
	
	[ _x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
	
} forEach rhino_radio_classes;

// ________________________________________
//           add rhino radio utility to objects through BI action
{
    _x addAction [  rr_str_useradio,
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];
                        [ _caller ] execVM "rhino_radio\rhino_radio_gui.sqf";
                    },
                    nil, 1.5, true, true, "",
                    "True",
                    3, false, "", "" ];
                    
} forEach rhino_radio_objects;

// ________________________________________
// OTHER

_fnc_makeCarrayble = { 
    params ["_object"]; 
    diag_log text format ["Making %1 [%2] Carryable", _object, typeOf _object]; 
    [_object, true, [0,0.5,1], 0] call ace_dragging_fnc_setCarryable; 
};
[ "Land_MultiScreenComputer_01_black_F", "init", _fnc_makeCarrayble, true, [], true] call CBA_fnc_addClassEventHandler; 