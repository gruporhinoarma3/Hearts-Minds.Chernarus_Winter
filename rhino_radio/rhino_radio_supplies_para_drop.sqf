params[ "_aircraft" , "_supplybox" ];

{
    _dir = vectorDir _aircraft;
    // type of data provided for drop
    _type = "";
    if ( typeName _x == "STRING" ) then
    {
        if ( _x find "." < 0 ) then
        { _type = "veh"; }
        else
        { _type = "sqf"; }
    }
    else { _type = "var"; };
    // drop box
    if ( _type == "sqf" ) then
    {
        _cargo = createVehicle [ "B_supplyCrate_F", ((getPosATL _aircraft) vectorAdd (_dir vectorMultiply -20) ), [], 0, 'FLY'];
        _cargo setVelocity ((velocity _aircraft) vectorAdd (_dir vectorMultiply -50));
        sleep 0.5;
        [objnull, _cargo] call BIS_fnc_curatorobjectedited;
        
        _smoke = "SmokeShellPurple" createVehicle position _cargo;
        _smoke attachTo [ _cargo ];
        _cargo execVM _x;
    };
    // drop vehicle
    if ( _type == "veh" ) then
    {
        _cargo = createVehicle [ _x, ((getPosATL _aircraft) vectorAdd (_dir vectorMultiply -20) ), [], 0, 'FLY'];
        _cargo setVelocity ((velocity _aircraft) vectorAdd (_dir vectorMultiply -50));
        sleep 0.5;
        [objnull, _cargo] call BIS_fnc_curatorobjectedited;
            
        clearMagazineCargoGlobal _cargo;
        clearWeaponCargoGlobal _cargo;
        clearItemCargoGlobal _cargo;
        clearBackpackCargoGlobal _cargo;
    };
    // drop base box
    if ( _type == "var" ) then
    {
        _cargo = createVehicle [ "B_supplyCrate_F", ((getPosATL _aircraft) vectorAdd (_dir vectorMultiply -20) ), [], 0, 'FLY'];
        _cargo setVelocity ((velocity _aircraft) vectorAdd (_dir vectorMultiply -50));
        sleep 0.5;
        [objnull, _cargo] call BIS_fnc_curatorobjectedited;
            
        [ _cargo, _x ] execVM "rhino_radio\rhino_radio_supplies_heli_box.sqf";
    };
    
    sleep 0.5;
    
} forEach _supplybox;