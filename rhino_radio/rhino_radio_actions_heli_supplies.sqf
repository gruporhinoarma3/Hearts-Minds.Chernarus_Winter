//script: rhino_radio_supplies_heli_actions
//author: |R|kiron
//date: 2021-01-25


// parameters
params[ "_heli" , "_action_params" ];
_supplies = _action_params#0;
_unloaddir = _action_params#1;

// supplies
_heli setVariable ["rhino_radio_supplies_loaded",true,true];

// unload supplies action
_rhino_radio_action_heli_supplies_unload = 
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    _supplyboxes = _arguments select 0;
    _unloaddirection = _arguments select 1;
    _heli = _target;
    _pos = getPos _heli;
    _dir = getDir _heli;
    _dirvec = vectorDir _heli;
    _n = -8;
    if (!(_unloaddirection =="rear")) then
    {
        _n = -1;
        _y = (( _heli vectorWorldToModel ( (getPos _caller) vectorAdd ((getPos _heli) vectorMultiply (-1)) ) ) select 0);
        if (_y<=0) then
        { _dirvec = _heli vectorModelToWorld [1,0,0]; }
        else
        { _dirvec = _heli vectorModelToWorld [-1,0,0]; };
    };
    {
        _n = _n -2;
        _type = "";
        // what data is provided to generate the supplies? classname, filename or varname
        if ( typeName _x == "STRING" ) then
        {
            if ( _x find "." < 0 )	then
            { _type = "veh"; }
            else
            { _type = "sqf"; }
        }
        else
        {
            _type = "var";
        };
        // create a vehicle of classname "_x"
        if ( _type == "veh" ) then 
        {
            _supplybox = createVehicle [_x, [0,0,100], [], 0, "NONE"];
            _supplybox setDir _dir;
            _n = _n -2;
            _supplybox setPos ( _pos vectorAdd ( _dirvec vectorMultiply _n));
            _n = _n -2;
            clearMagazineCargoGlobal _supplybox;
            clearWeaponCargoGlobal _supplybox;
            clearItemCargoGlobal _supplybox;
            clearBackpackCargoGlobal _supplybox;
        };
        // execute the sqf file "_x" to fill with things the newly created "B_supplyCrate_F";
        if ( _type == "sqf" ) then
        {
            _supplybox = createVehicle ["B_supplyCrate_F", [0,0,100], [], 0, "NONE"];   
            _supplybox setDir _dir;
            _supplybox setPos ( _pos vectorAdd ( _dirvec vectorMultiply _n));
            _supplybox execVM _x;
        };
        // copy the contents of object "_x" into the newly created object which is has the same classname;
        if ( _type == "var" ) then
        {
            _supplybox = createVehicle [ typeOf _x, [0,0,100], [], 0, "NONE"];
            _supplybox setDir _dir;
            _supplybox setPos ( _pos vectorAdd ( _dirvec vectorMultiply _n));
            [ _supplybox, _x ] execVM "rhino_radio\rhino_radio_supplies_heli_box.sqf";
        };
    } forEach _supplyboxes;
    _target setVariable ["rhino_radio_supplies_loaded",false,true];
    _caller playActionNow "GestureFollow";
};

// contition to see the action
_condition = "( (getPosATL _target) select 2 < 1 ) && ( _target getVariable['rhino_radio_supplies_loaded',false] )";

// create action unload supplies
_heli addAction  ["<t color='#0000AA'>Descargar suministros</t>",
    _rhino_radio_action_heli_supplies_unload,
    [ _supplies, _unloaddir ],
    1.5,true,true,"",
    _condition, // _target, _this, _originalTarget
    10,false,"","" ];