if (!hasInterface) exitWith {};

player addEventHandler ["GetInMan",
{	
    params ["_unit", "_role", "_vehicle", "_turret"];

    _whitelist = [];

    if ( name _unit find "|R|" != -1 ) exitWith {};
    if ( name _unit find "|r|" != -1 ) exitWith {};
    if ( !(_vehicle isKindOf "Air") ) exitWith {};
    if ( _vehicle isKindOf "Steerable_Parachute_F" ) exitWith {};
    if ( (!(_role == "driver")) && (!(_turret == [0] )) ) exitWith { };
    if ( (roleDescription _unit == "Piloto") and ( typeOf _vehicle == "ffaa_famet_ch47_mg") ) exitWith {};
    
    _ok = false;
    { if ( name _unit == _x ) exitWith { _ok = true; }; } forEach _whitelist;
    if ( ok ) exitWith {};
    
    _unit action ["getOut", _vehicle];
    
    hint "Puesto reservado para pilotos y/o miembros del Grupo Rhino. Visita <www.gruporhino.es> para más información.";
    
}];