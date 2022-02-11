_helis = [
"B_Heli_Light_01_F","B_Heli_Light_01_dynamicLoadout_F","B_Heli_Transport_01_F","B_Heli_Transport_03_F",
"RHS_UH60M","RHS_UH60M_d",
"RHS_MELB_MH6M","RHS_MELB_AH6M",
"RHS_UH1Y","RHS_UH60M_ESSS_d" ];


_codigo = {
    _mochilas_cargo = _target getVariable ["rhino_mochilas_cabina",[]];
    if (count _mochilas_cargo == 2) exitWith {hint "No hay sitio en la cabina";};
    _class = typeOf (unitBackpack player);
    _items = backpackItems player;
    _mochila = [_class,_items];
    _mochilas_cargo pushBack _mochila;
    _target setVariable ["rhino_mochilas_cabina", _mochilas_cargo, true];
    removeBackpack player;
    };
_condicion = {
    ((backpack player) != "") && !(player in _target)
    };
_accion = ["add_mochila_cabina","Meter la mochila en cabina","",_codigo,_condicion] call ace_interact_menu_fnc_createAction;

{ [_x,0,["ACE_MainActions"],_accion]call ace_interact_menu_fnc_addActionToClass;
} forEach _helis;


_codigo = {
    _mochilas_cargo = _target getVariable "rhino_mochilas_cabina";
    _n = (count _mochilas_cargo) - 1;
    _sacar = _mochilas_cargo deleteAt _n;
    _class = _sacar select 0;
    _items = _sacar select 1;
    _target setVariable ["rhino_mochilas_cabina", _mochilas_cargo, true];
    _holder = createVehicle ["WeaponHolderSimulated", (getPosATL player), [], 0, "can_collide"];
    _holder addBackpackCargoGlobal [_class, 1];
    _mochila = firstBackpack _holder;
    {_mochila addItemCargoGlobal [_x, 1]} forEach _items;
    };
_condicion = {
    _mochilas_cargo = _target getVariable ["rhino_mochilas_cabina",[]];
    if (count _mochilas_cargo == 0) exitWith {false};
    true
    };
_accion = ["tirar_mochila_cabina","sacar mochila de la cabina","",_codigo,_condicion] call ace_interact_menu_fnc_createAction;

{ [_x,0,["ACE_MainActions"],_accion] call ace_interact_menu_fnc_addActionToClass;
} forEach _helis;


_codigo = {
    _mochilas_cargo = _target getVariable "rhino_mochilas_cabina";
    _n = (count _mochilas_cargo) - 1;
    _sacar = _mochilas_cargo deleteAt _n;
    _class = _sacar select 0;
    _items = _sacar select 1;
    _target setVariable ["rhino_mochilas_cabina", _mochilas_cargo, true];
    _pos_player = _target worldToModel getPosATL player;
    _pos_mod = _pos_player vectorAdd [-2,0,0];
    _pos = _target modelToWorld _pos_mod;
    _holder = createVehicle ["WeaponHolderSimulated", _pos, [], 0, "can_collide"];
    _holder addBackpackCargoGlobal [_class, 1];
    _mochila = firstBackpack _holder;
    {_mochila addItemCargoGlobal [_x, 1]} forEach _items;
    };
_condicion = {
    _mochilas_cargo = (vehicle player) getVariable ["rhino_mochilas_cabina",[]];
    if (count _mochilas_cargo == 0) exitWith {false};
    true
    };
_accion = ["tirar_mochila_dentro_cabina","sacar mochila de la cabina","",_codigo,_condicion] call ace_interact_menu_fnc_createAction;

{ [_x,1,["ACE_SelfActions"],_accion] call ace_interact_menu_fnc_addActionToClass;
} forEach _helis;