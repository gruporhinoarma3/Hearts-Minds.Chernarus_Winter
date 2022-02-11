// script: rhino_veh_despliegue.sqf
// task: teleport players from laptop to vehicle
// author: |R|Kiron
// date: 2020-03-01


laptop_despliegue addAction["<t color='#7FFF00'>Desplegar en vehículo médico</t>", {

    _veh = ( nearestObjects [[0,0,0], [ "B_T_Truck_01_medical_F" ], 20000] ) select 0; 

    // if (!(0 < _veh animationSourcePhase "deploy_tent" )) exitWith {hint "Vehículo médico no desplegado"};

    (_this select 1) setPosAtl ( (getposAtl _veh ) vectorAdd ((vectorDir _veh) vectorMultiply ( -7 ) ) );

    }, 
    [],1.5,true,true,"","true",
    4, 
    false,"",""];