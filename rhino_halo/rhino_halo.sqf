/*
execVM "rhino_halo\rhino_halo.sqf";

EDITOR:
rhino_halo_trigger: area de carga, attachto rhino_halo_vehicle
rhino_halo_vehicle: transporte de vehiculos, comprobar animateDoor
rhino_halo_pto_ini: obj, punto inicial
PortableHelipadLight_01_white_F, [this, rhino_halo_vehicle] call BIS_fnc_attachToRelative; y SimpleObject
PortableHelipadLight_01_white_F, [this, rhino_halo_vehicle] call BIS_fnc_attachToRelative; y SimpleObject
Reflector_Cone_01_narrow_white_F, [this, rhino_halo_vehicle] call BIS_fnc_attachToRelative;
*/

//variables
rhino_halo_distancia = 10000;
rhino_halo_fl = 3000;
rhino_halo_helmet = "H_CrewHelmetHeli_B";
rhino_halo_para = "B_Parachute";
rhino_halo_tiempo = 600;
rhino_halo_error = 500;
if (isServer) then {
	[rhino_halo_trigger, rhino_halo_vehicle] call BIS_fnc_attachToRelative;
    rhino_halo_vehicle animateDoor ["door_1_source",1];
};


//trigger on
rhino_fnc_halo_jumper_present = {
	_arr = [];
	{
		if (_x getVariable ["rhino_halo_jump_lead",false]) then {_arr pushBack 1;};
	}forEach allPlayers;
	if (count _arr == 0) then {player setVariable ["rhino_halo_jump_lead",true,true];};
};

//trigger off
rhino_fnc_halo_jumper_notpresent = {
	if !(player getVariable ["rhino_halo_jump_lead",false]) exitWith {};
	_jumpers = [];
	{
		if (_x inArea rhino_halo_trigger) then {_jumpers pushBack _x;};
	}forEach allPlayers;
	if (count _jumpers > 0) then {(_jumpers select 0) setVariable ["rhino_halo_jump_lead",true,true];};
	player setVariable ["rhino_halo_jump_lead",false,true];
};

//jump lead acction
rhino_fnc_halo_seleccionarZona = {
	openMap true;
	rhino_halo_posMarcada = false;
	[] onMapSingleClick {rhino_halo_pto = _pos;rhino_halo_posMarcada = true;onMapSingleClick "";};
	waitUntil {rhino_halo_posMarcada or !(visiblemap)};
	if !(rhino_halo_posMarcada) exitWith {hint "Vuelo cancelado"};
	openMap false;
	_jumpers = [];
	{
		if (_x inArea rhino_halo_trigger) then {_jumpers pushBack _x;};
	}forEach allPlayers;
	rhino_halo_vehicle animateDoor ["door_1_source",0];
	sleep 2;
	[rhino_halo_pto,_jumpers] remoteExec ["rhino_fnc_halo_vuelo", 2];
	//[] call rhino_fnc_halo_vuelo;
};

//crear vuelo en el server y abrir halo de nuevo
rhino_fnc_halo_vuelo = {
	_pto_mapa = _this select 0;
	_jumpers = _this select 1;
	_class = typeOf rhino_halo_vehicle;
	rhino_halo_finalWP = false;
	_pto = [[[_pto_mapa, rhino_halo_error]],[]] call BIS_fnc_randomPos;
	_pto_ini = getPos rhino_halo_pto_ini;
	_pto_ini = _pto_ini vectorAdd [0,0,rhino_halo_fl];
	_pto_fin = _pto getPos [rhino_halo_distancia,(_pto getDir rhino_halo_vehicle)+180];
	_vuelo = createVehicle [_class,[0,0,0],[],0,"FLY"];
	_vuelo setpos _pto_ini;
	_vuelo setVehicleReportRemoteTargets false;
	_vuelo setDir ((_pto getDir rhino_halo_vehicle)+180);
	_grp = createVehicleCrew _vuelo;
	//_vuelo flyInHeightASL [rhino_halo_fl, rhino_halo_fl, rhino_halo_fl];
	_vuelo flyInHeight rhino_halo_fl;
	_grp setBehaviour "CARELESS";
	_grp setSpeedMode "FULL";
	_wp1 = _grp addWaypoint [_pto,0];
	_grp setCurrentWaypoint _wp1;
	_wp2 = _grp addWaypoint [_pto_fin,0];
	_vuelo setVelocityModelSpace [0, 150, 0];
	//Luz blanca
	{
		_type = typeOf _x;
		//getPosASLW sobre el agua
		_rel_pos = rhino_halo_vehicle worldToModel (getPosATL _x);
		_rel_vec = [vectorDir _x, vectorUp _x];
		if (_type == "PortableHelipadLight_01_white_F") then {
			_obj = createSimpleObject [_type, [0,0,0]];
			_obj attachTo [_vuelo,_rel_pos];
			_obj setVectorDirAndUp _rel_vec;
			_obj enableSimulationGlobal false;
			_obj enableSimulationGlobal true;
		} else {
			_obj = createVehicle [_type, [0,0,0]];
			_obj attachTo [_vuelo,_rel_pos];
			_obj setVectorDirAndUp _rel_vec;
		};
	} forEach attachedObjects rhino_halo_vehicle;
	
	//borrar al final
	[_vuelo, _pto_fin] spawn {
		_v = _this select 0;
		_p = _this select 1;
		waitUntil {(_v distance2D _p < 100)};
		{_v deleteVehicleCrew _x} forEach crew _v;
		deleteVehicle _v;
	};
	
	//destruido
	_vuelo spawn {
		sleep 10;
		waitUntil{!isEngineOn _this};
		{detach _x;}forEach attachedObjects _this;
	};
	
	//fijar al pto de salto
	_dir = getDir _vuelo;
	[_vuelo, _pto, _dir] spawn {
		_v = _this select 0;
		_p = _this select 1;
		_dir = _this select 2;
		waitUntil {(_v distance2D _p < 200)};
		_veh = createVehicle ["Land_VR_Shape_01_cube_1m_F",[0,0,0],[],0,"CAN_COLLIDE"];
		//_veh enableSimulationGlobal false;
		_veh hideObjectGlobal true;
		//_veh setVectorDirAndUp [[0,1,0],[0,0,1]];
		_v attachTo [_veh];
		_v setDir _dir;
		
		{
			if ((typeOf _x == "PortableHelipadLight_01_red_F") or (typeOf _x == "Reflector_Cone_01_narrow_red_F")) then {deleteVehicle _x;};
		} forEach attachedObjects _v;
		{
			_type = typeOf _x;
			//getPosASLW sobre el agua
			_rel_pos = rhino_halo_vehicle worldToModel (getPosATL _x);
			_rel_vec = [vectorDir _x, vectorUp _x];
			if (_type == "PortableHelipadLight_01_white_F") then {
				_obj = createSimpleObject ["PortableHelipadLight_01_green_F", [0,0,0]];
				_obj attachTo [_v,_rel_pos];
				_obj setVectorDirAndUp _rel_vec;
				_obj enableSimulationGlobal false;
				_obj enableSimulationGlobal true;
			} else {
				_obj = createVehicle ["Reflector_Cone_01_narrow_green_F", [0,0,0]];
				_obj attachTo [_v,_rel_pos];
				_obj setVectorDirAndUp _rel_vec;
			};
		} forEach attachedObjects rhino_halo_vehicle;		
	};
	
	//abrir puerta
    [] spawn {sleep rhino_halo_tiempo; rhino_halo_vehicle animateDoor ["door_1_source",1];};

	
	//soltar cuando este vacio
	[_jumpers,_vuelo] spawn {
		_j = _this select 0;
		_v = _this select 1;
		waitUntil {!(isNull attachedTo _v)};
		{
			waitUntil {(_x distance _v) > 30};
		}forEach _j;
		_pad = attachedTo _v;
		detach _v;
		deleteVehicle _pad;
	};
	
	[_vuelo] remoteExec ["rhino_fnc_halo_prepararSalto",_jumpers];
	waitUntil {((damage _vuelo) > 0.5) or ((_vuelo distance2d _pto) < 2000)};
	{
		if ((typeOf _x == "PortableHelipadLight_01_white_F") or (typeOf _x == "Reflector_Cone_01_narrow_white_F")) then {deleteVehicle _x;};
	} forEach attachedObjects _vuelo;
	{
		_type = typeOf _x;
		//getPosASLW sobre el agua
		_rel_pos = rhino_halo_vehicle worldToModel (getPosATL _x);
		_rel_vec = [vectorDir _x, vectorUp _x];
		if (_type == "PortableHelipadLight_01_white_F") then {
			_obj = createSimpleObject ["PortableHelipadLight_01_red_F", [0,0,0]];
			_obj attachTo [_vuelo,_rel_pos];
			_obj setVectorDirAndUp _rel_vec;
			_obj enableSimulationGlobal false;
			_obj enableSimulationGlobal true;
		} else {
			_obj = createVehicle ["Reflector_Cone_01_narrow_red_F", [0,0,0]];
			_obj attachTo [_vuelo,_rel_pos];
			_obj setVectorDirAndUp _rel_vec;
		};
	} forEach attachedObjects rhino_halo_vehicle;
	sleep 3;
    // open created plane door for jump
	_vuelo animateDoor ["door_1_source",1];
};

rhino_fnc_halo_prepararSalto = {
	_veh = _this select 0;
	player setVariable ["rhino_halo_jump_lead",false,true];
	player allowDamage false;
	_loadout = getUnitLoadout player;
	_relpos = rhino_halo_vehicle worldToModel getPosATL player;
	player attachTo [_veh, _relpos];
	player setDir 180;
	_pack = unitBackpack player;
	_backpack_in_front = [] spawn {};
	if !(_pack isEqualTo objNull) then {
	_class = typeOf _pack;
	_backpack_in_front = [_class,_veh] spawn {
		private ["_class","_veh","_packHolder"];
		_class 	= _this select 0;
		_veh = _this select 1;
		waitUntil {!(isNull attachedTo _veh)};
		_packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
		_packHolder addBackpackCargo [_class, 1];
		_packHolder attachTo [player,[0.1,0.72,0],"pelvis"];
		_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];
		player setVariable ["frontpack",_packHolder];
		
		waitUntil {player distance _veh > 15};
		
		_packHolder attachTo [player,[0.1,0,-.72],"pelvis"];
		_packHolder setVectorDirAndUp [[0,1,0],[0,0,-1]];
		
		waitUntil {animationState player == "para_pilot"};
		
		_packHolder attachTo [vehicle player,[0.1,0.72,0],"pelvis"];
		_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];
		
		waitUntil {animationState player != "para_pilot"};
		
		_packHolder attachTo [player,[0.1,0,-.72],"pelvis"];
		_packHolder setVectorDirAndUp [[0,1,0],[0,0,-1]];
		
		sleep 2;
		if (isTouchingGround player) then {
			_packHolder attachTo [player,[0.1,0.72,0],"pelvis"];
			_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];
		};
		
		waitUntil {animationState player == "para_pilot"};
		
		_packHolder attachTo [vehicle player,[0.1,0.72,0],"pelvis"];
		_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];		
		
		waitUntil {animationState player != "para_pilot"};
		
		_packHolder attachTo [vehicle player,[0.1,0.72,0],"pelvis"];
		_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];
		
		};
	};
	removeBackpack player;
	player addBackpack rhino_halo_para;
	player addHeadgear rhino_halo_helmet;
	RedOn = player addAction["<t color='#B40404'>Chemlight Red On</t>", "rhino_halo\atm_chem_on.sqf",["Chemlight_red"],6,false,false,"","_target == ( player)"];
	BlueOn = player addAction["<t color='#68ccf6'>Chemlight Blue On</t>", "rhino_halo\atm_chem_on.sqf",["Chemlight_blue"],6,false,false,"","_target == ( player)"];
	YellowOn = player addAction["<t color='#fcf018'>Chemlight Yellow On</t>", "rhino_halo\atm_chem_on.sqf",["Chemlight_yellow"],6,false,false,"","_target == ( player)"];
	GreenOn = player addAction["<t color='#30fd07'>Chemlight Green On</t>", "rhino_halo\atm_chem_on.sqf",["Chemlight_green"],6,false,false,"","_target == ( player)"];
	IrOn = player addAction["<t color='#FF00CC'>Strobe IR On</t>", "rhino_halo\atm_chem_on.sqf",["NVG_TargetC"],6,false,false,"","_target == ( player)"];
	waitUntil {!(isNull attachedTo _veh)};
	sleep 3;
	player enableSimulation false;
	detach player;
	player enableSimulation true;
	player forceWalk true;
	player allowDamage true;
	_cancel_halo_anim = [] spawn {while {true} do {
		waitUntil {animationState player == "halofreefall_non"};
		player enableSimulation false;
		player switchMove "amovpercmstpslowwrfldnon";
		player enableSimulation true;
		player forceWalk true;
	};};
	
	waitUntil {player distance _veh > 15};
	terminate _cancel_halo_anim;
	waitUntil {headgear player != rhino_halo_helmet};
	//waitUntil {isTouchingGround player};
	sleep 1;
	terminate _backpack_in_front;
	player forceWalk false;
	player removeAction RedOn;
	player removeAction BlueOn;
	player removeAction YellowOn;
	player removeAction GreenOn;
	player removeaction Iron;
	
	deletevehicle (player getvariable ["frontpack",objNull]); player setvariable ["frontpack",nil,true];
	deletevehicle (player getvariable ["lgtarray",objNull]); player setvariable ["lgtarray",nil,true];
	
	player setUnitLoadout _loadout;
	
};


rhino_halo_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
rhino_halo_trigger setTriggerStatements [
	"this and (player in thisList)",
	"[] call rhino_fnc_halo_jumper_present",
	"[] call rhino_fnc_halo_jumper_notpresent"
];

rhino_halo_vehicle addAction
[
	"seleccionar punto de salto HALO",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[] call rhino_fnc_halo_seleccionarZona;
	},
	nil,
	1.5,
	true,
	true,
	"",
	"player getVariable ['rhino_halo_jump_lead',false]", // _target, _this, _originalTarget
	50,
	false,
	"",
	""
];