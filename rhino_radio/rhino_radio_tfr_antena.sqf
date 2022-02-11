// script: rhino_radio_tfr_antena.sqf
// author: |R|Kiron
// date: 2020-11-07
//
// rhino radio TFAR desplegar antena y añadirle ACE action para incrementar el rango de comunicación

//if ( 0 == player getVariable ["tf_receivingDistanceMultiplicator",0] ) exitWith {};

rhino_radio_personal_antenna_actions =
{
    params["_antena"];

    _actionpath =  ["ACE_MainActions"];
    _icon1 = "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa";
    _statement1 =
    {
        params ["_target", "_player", "_params"];
        _player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
        _posATL = getPosATL _target;
        deleteVehicle _target;
        _box = createVehicle ["groundWeaponHolder", _posATL, [], 0, "CAN_COLLIDE"];
        _box addItemCargoGlobal ["ToolKit",1];
        _player setVariable ["tf_receivingDistanceMultiplicator", 1];
        _player setVariable ["tf_sendingDistanceMultiplicator", 1];
        hint 'Conexión radio-antena desactivada';
    };
    _condition1 = {True;};
    _action = ["rhino_radio_tfr_recoger", "Recoger antena", _icon1, _statement1, _condition1] call ace_interact_menu_fnc_createAction;
    [ _antena, 0, _actionpath, _action] call ace_interact_menu_fnc_addActionToObject;

    _actionpath = ["ACE_MainActions"];
    _icon1 = "\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa";
    _statement1 =
    {
        params ["_target", "_player", "_params"];
        _player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
        _player setVariable ["tf_receivingDistanceMultiplicator", rhino_radio_tf_receivingDistanceMultiplicator];
        _player setVariable ["tf_sendingDistanceMultiplicator", rhino_radio_tf_sendingDistanceMultiplicator];
        [   {
                (_this#0 distance _this#1) > rhino_radio_use_external_radio_distance;
            },
            {
                _this#0 setVariable ["tf_receivingDistanceMultiplicator", 1];
                _this#0 setVariable ["tf_sendingDistanceMultiplicator", 1];
                hint 'Conexión radio-antena desactivada';
            },
            [_player,_target]
        ] call CBA_fnc_waitUntilAndExecute;
    };
    _condition1 = { (backpack  _player) in rhino_radio_backpacks };
    _action = ["rhino_radio_tfr_conectar", "Conectar radio a antena", _icon1, _statement1, _condition1] call ace_interact_menu_fnc_createAction;
    [ _antena, 0, _actionpath, _action] call ace_interact_menu_fnc_addActionToObject;
};

_path = ["ACE_SelfActions", "rhino_radio"];

_id = "rhino_radio_tfr";
_text = "Desplegar antena";
_icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa";
_statement =
{ 
    params ["_target", "_player", "_params"];
    
    _player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    _classname = rhino_radio_antena_personal;
    _player removeItem "ToolKit";
    _posATL = getPosATL _player;
    _vector = vectorDir _player;
    _dir = getDir _player;
    _posATL = _posATL vectorAdd (_vector vectorMultiply 2);
    _antena = createVehicle[ _classname, _posATL, [], 0, "NONE" ];
    _antena setPosATL _posATL;
    _antena setDir _dir;
    _antena remoteExec ["rhino_radio_personal_antenna_actions",0,true];
    //[   [ [ _antena ], rhino_radio_personal_antenna_actions ], "BIS_fnc_call", true, false, false ] call BIS_fnc_MP; // all machines, old
};
_condition = { [ _player, "ToolKit" ] call BIS_fnc_hasItem; };

_action = [ _id, _text, _icon, _statement, _condition ] call ace_interact_menu_fnc_createAction;

[player, 1, _path, _action] call ace_interact_menu_fnc_addActionToObject;