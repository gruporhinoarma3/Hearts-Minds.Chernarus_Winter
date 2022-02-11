if ( !isServer ) exitWith {};

_rhino_night_time_multiplier = ["rhino_p_accnighttime", 1] call BIS_fnc_getParamValue;

if ( _rhino_night_time_multiplier < 2) exitWith {}; 

while { true } do {

	if ( ((date select 3) > 18) or ((date select 3) < 6) ) then { if (timeMultiplier < 2) then { setTimeMultiplier _rhino_night_time_multiplier; }; }
                                                                             else { if (timeMultiplier > 1) then { setTimeMultiplier                            1; }; };
	sleep 1800;
};