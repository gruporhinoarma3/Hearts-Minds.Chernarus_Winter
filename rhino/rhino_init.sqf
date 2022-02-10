// BIS ARSENAL
["Preload"] call BIS_fnc_arsenal;

// task force radio
tf_no_auto_long_range_radio = true;
tf_same_lr_frequencies_for_side = true;
publicVariable "tf_same_lr_frequencies_for_side";

// RHINO
_null = execVM "rhino\rhino_arsenal_save.sqf";
_null = execVM "rhino\rhino_briefing.sqf";
_null = execVM "rhino\rhino_hospital2.sqf";
_null = execVM "rhino\rhino_lanzar_mochilas.sqf";
_null = execVM "rhino\rhino_compas.sqf";
_null = execVM "rhino\rhino_carrierTP.sqf";

_null = execVM "rhino\rhino_teamspeak.sqf";
_null = execVM "rhino\rhino_slot.sqf";

//_null = execVM "rhino\rhino_veh_acceso.sqf";
//_null = execVM "rhino\rhino_veh_despliegue.sqf";
/*
if (isServer) then {
_null = execVM "rhino\rhino_noches_cortas.sqf";
};
*/