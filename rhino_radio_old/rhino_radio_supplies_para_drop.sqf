params[ "_aircraft" , "_supplybox" ];

{
    _dir = vectorDir _aircraft;
    
    _type = "";
    if ( typeName _x == "STRING" ) then { if ( _x find "." < 0 ) then { _type = "veh"; }
                                                                                          else { _type = "sqf"; } }
                                                   else { _type = "var"; };
    
    if ( _type == "sqf" ) then {																																						// drop box
    
        _cargo = createVehicle [ "B_supplyCrate_F", ((getPosATL _aircraft) vectorAdd (_dir vectorMultiply -20) ), [], 0, 'FLY'];
        _cargo setVelocity ((velocity _aircraft) vectorAdd (_dir vectorMultiply -50));
        sleep 0.5;
        [objnull, _cargo] call BIS_fnc_curatorobjectedited;
        
        _smoke = "SmokeShellPurple" createVehicle position _cargo;
        _smoke attachTo [ _cargo ];
        _cargo execVM _x;
    };
    
    if ( _type == "veh" ) then {																																						// drop vehicle
    
        _cargo = createVehicle [ _x, ((getPosATL _aircraft) vectorAdd (_dir vectorMultiply -20) ), [], 0, 'FLY'];
        _cargo setVelocity ((velocity _aircraft) vectorAdd (_dir vectorMultiply -50));
        sleep 0.5;
        [objnull, _cargo] call BIS_fnc_curatorobjectedited;
            
        clearMagazineCargoGlobal _cargo;
        clearWeaponCargoGlobal _cargo;
        clearItemCargoGlobal _cargo;
        clearBackpackCargoGlobal _cargo;
    };
    
    if ( _type == "var" ) then {																																						// drop base box
    
        _cargo = createVehicle [ "B_supplyCrate_F", ((getPosATL _aircraft) vectorAdd (_dir vectorMultiply -20) ), [], 0, 'FLY'];
        _cargo setVelocity ((velocity _aircraft) vectorAdd (_dir vectorMultiply -50));
        sleep 0.5;
        [objnull, _cargo] call BIS_fnc_curatorobjectedited;
            
        [ _cargo, _x ] execVM "rhino_radio\rhino_radio_supplies_heli_box.sqf";
    };
    
    sleep 0.5;
    
} forEach _supplybox;