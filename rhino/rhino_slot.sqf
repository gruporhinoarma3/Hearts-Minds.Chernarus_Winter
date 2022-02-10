if (isServer) then {

	checkRino = addMissionEventHandler ["PlayerConnected", {

		params ["_id", "_uid", "_name", "_jip", "_owner"];

		[[],{
			waitUntil {getClientStateNumber > 8};
            
			if (roleDescription player find "Reservado" == -1) exitWith {hint "SLOT de libre acceso";};
            
			_nm = name player;
			if (_nm find "|r|" == 0 || _nm find "|R|" == 0) exitWith {hint "SLOT reservado Rhino";};
            
			["End5", false, 3] call BIS_fnc_endMission;
            
		}] remoteExec ["spawn",_owner];
        
	}];
    
};