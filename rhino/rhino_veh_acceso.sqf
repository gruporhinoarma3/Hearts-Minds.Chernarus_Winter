rhino_vehicles_whitelist = [];

if (!hasInterface) exitWith {};

rhino_veh_acceso_scripthandle = scriptNull;
rhino_veh_acceso =
{
    params["_unit", "_role", "_vehicle", "_turret"];
    while {true} do
    {
        sleep 1;
        if (vehicle player == player) exitWith {};
        if (true) then
        {
            if ( name _unit find "|R|" != -1 ) exitWith {};
            if ( name _unit find "|r|" != -1 ) exitWith {};
            if ( name _unit in rhino_vehicles_whitelist ) exitWith {};
            if ( (!(_vehicle isKindOf "Air")) or (!(_vehicle isKindOf "Tank")) ) exitWith {};
            if ( _vehicle isKindOf "ParachuteBase" ) exitWith {};
            if ( _vehicle isKindOf "Parachute" ) exitWith {};
            if ( _vehicle isKindOf "Steerable_Parachute_F" ) exitWith {};
            if ( (_vehicle isKindOf "Air") && (!(_role == "driver")) && (!(_turret == [0] )) ) exitWith {};
            if ( (_vehicle isKindOf "Tank") && (!(_role == "driver")) ) exitWith {};
            if ( (_vehicle isKindOf "Wheeled_APC_F") && (!(_role == "driver")) ) exitWith {};
            
            _unit action ["getOut", _vehicle];
            
            hint "Puesto reservado para miembros del Grupo Rhino. Visita <www.gruporhino.es> para más información.";
        };
    };
};

player addEventHandler
[   "GetInMan",
    {
        params ["_unit", "_role", "_vehicle", "_turret"];
        rhino_veh_acceso_scripthandle = [_unit, _role, _vehicle, _turret] spawn rhino_veh_acceso;
    }
];