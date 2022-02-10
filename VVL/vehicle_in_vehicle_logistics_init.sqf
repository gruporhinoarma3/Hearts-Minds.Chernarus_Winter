//script: vehicle_in_vehicle_logistics_init
//author: |R|kiron
//date: 2019-01-01
// add ACE actions, to load and unload using the BI ViV system, to the classnames in the given list

params [ "_vehicle_loadable" ];

_icon = "\a3\ui_f\data\IGUI\Cfg\simpletasks\types\container_ca.paa";

_condition1 = {  isNull (isVehicleCargo _target) };
_condition2 = {!(isNull (isVehicleCargo _target))};

_insertChildren = {
    params ["_target", "_player", "_params"];
	
    // Add children to this action
    private _actions = [];
	
    {   private _childStatement = { (_this select 2) setVehicleCargo _target; };
        private _action = [ format["Load in vehicle:%1",_x],
		                    getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
							"",
							_childStatement,
							{true},
							{},
							_x
						] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
		
    } forEach ( nearestObjects [ _target , [], 20] select { (_x canVehicleCargo _target) select 0 } );//_vehiclecanload
    
	_actions
};

_statement2 = { objNull setVehicleCargo this };

_action1 = [ "VVL_Load"		, vvl_str_load	, _icon,  {hint "";}	, _condition1, _insertChildren	] call ace_interact_menu_fnc_createAction;
_action2 = [ "VVL_UnLoad"	, vvl_str_unload, _icon, _statement2, _condition2							] call ace_interact_menu_fnc_createAction;

{
  [ _x, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToClass;
  [ _x, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToClass;
  
} foreach ( _vehicle_loadable );