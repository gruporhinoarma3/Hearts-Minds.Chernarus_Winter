//script: rhino_radio_supplies_heli_actions
//author: |R|kiron
//date: 2021-01-25


// parameters
params[ "_heli" , "_action_params" ];

_supplies = _action_params#0;
_unloaddir = _action_params#1;

// supplies
_heli setVariable ["rhino_radio_supplies_loaded",true,true];

// create action unload supplies
_heli addAction  ["<t color='#0000AA'>Descargar suministros</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _supplyboxes = _arguments select 0;
		_unloaddirection = _arguments select 1;
        _heli = _target;
        _pos = getPos _heli;
        _dir = getDir _heli;
		_dirvec = vectorDir _heli;
		_n = -8;
		if (!(_unloaddirection =="rear")) then {
			_n = -1;
			_y = (( _heli vectorWorldToModel ( (getPos _caller) vectorAdd ((getPos _heli) vectorMultiply (-1)) ) ) select 0);
			if (_y<=0) then { _dirvec = _heli vectorModelToWorld [1,0,0]; }
							else { _dirvec = _heli vectorModelToWorld [-1,0,0]; };
			};
        {	_n = _n -2;
			_type = "";
			if ( typeName _x == "STRING" ) then { if ( _x find "." < 0 )	then { _type = "veh"; }
																										else { _type = "sqf"; } }
															else { _type = "var"; };
            
            if ( _type == "veh" ) then { _supplybox = createVehicle [_x, [0,0,100], [], 0, "NONE"];							// create a vehicle of classname "_x"
                                                    _supplybox setDir _dir;
                                                    _n = _n -2;
                                                    _supplybox setPos ( _pos vectorAdd ( _dirvec vectorMultiply _n));
                                                    _n = _n -2;
                                                    clearMagazineCargoGlobal _supplybox;
                                                    clearWeaponCargoGlobal _supplybox;
                                                    clearItemCargoGlobal _supplybox;
                                                    clearBackpackCargoGlobal _supplybox; };
                                                    
            if ( _type == "sqf" ) then { _supplybox = createVehicle ["B_supplyCrate_F", [0,0,100], [], 0, "NONE"];		// execute the sqf file "_x" to fill with things the newly created "_supplybox";
                                                    _supplybox setDir _dir;
                                                    _supplybox setPos ( _pos vectorAdd ( _dirvec vectorMultiply _n));
                                                    _supplybox execVM _x; };
                                                    
            if ( _type == "var" ) then { _supplybox = createVehicle [ typeOf _x, [0,0,100], [], 0, "NONE"];		// copy the contents of crate "_x" into the newly created "_supplybox";
                                                    _supplybox setDir _dir;
                                                    _supplybox setPos ( _pos vectorAdd ( _dirvec vectorMultiply _n));
                                                    [ _supplybox, _x ] execVM "rhino_radio\rhino_radio_supplies_heli_box.sqf"; };
        } forEach _supplyboxes;
        _target setVariable ["rhino_radio_supplies_loaded",false,true];
		_caller playActionNow "GestureFollow";
    },
    [ _supplies, _unloaddir ],
    1.5,true,true,"",
    "( (getPosATL _target) select 2 < 1 ) && ( _target getVariable['rhino_radio_supplies_loaded',false] )", // _target, _this, _originalTarget
    10,false,"","" ];