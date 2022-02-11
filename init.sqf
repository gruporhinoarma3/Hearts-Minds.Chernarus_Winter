
[compile preprocessFileLineNumbers "core\init.sqf"] call CBA_fnc_directCall;

// RHINO
execVM "rhino\rhino_init.sqf";
execVM "rhino_radio\rhino_radio.sqf";
execVM "rhino_halo\rhino_halo.sqf";
execVM "VVL\vehicle_in_vehicle_logistics.sqf";

// TFR
tf_west_radio_code = "_bluefor";
tf_east_radio_code = "_bluefor";//_opfor
tf_guer_radio_code = "_bluefor";//_independent

// needed for the FOBS
_fnc_makeCarrayble = { 
    params ["_object"]; 
    diag_log text format ["Making %1 [%2] Carryable", _object, typeOf _object]; 
    [_object, true, [0,0.5,1], 0] call ace_dragging_fnc_setCarryable; 
};
[ "Land_TripodScreen_01_dual_v1_black_F", "init", _fnc_makeCarrayble, true, [], true] call CBA_fnc_addClassEventHandler;

//
_id = ["ace_cookoff_cookOff",{
	_noplayer = true;
	{
		if (isPlayer _x) then {_r = true;};
	}forEach (crew _vehicle);

	if _noplayer then {
		_vehicle spawn {
			sleep 35;
			if (local _this) then {
				_this setFuel 1;
				_this setVehicleAmmo 0;
				_this setDamage 1;
			};
		};
	};
}] call CBA_fnc_addEventHandler;