if (isServer) then
{
    rhino_slot_str = [ "|r|", "|R|" ];
    publicVariable "rhino_slot_str";

    checkRino = addMissionEventHandler [
        "PlayerConnected",
        {
            params ["_id", "_uid", "_name", "_jip", "_owner"];
            
            _rhino_slot_check_member =
            {
                waitUntil { getClientStateNumber > 8 };
                
                if ( roleDescription player find "Reservado Rhino" == -1 ) exitWith { hint "SLOT de libre acceso"; };
                
                _ok = false;
                {
                    if ( (name player) find _x == 0 ) exitWith { _ok = true; };
                }
                forEach rhino_slot_str;
                
                if ( _ok ) exitWith { hint "SLOT reservado autorizado"; };
                
                ["rhino_end_slot_reservado", false, 3] call BIS_fnc_endMission;
            };
            
            [ [], _rhino_slot_check_member ] remoteExec ["spawn",_owner];
        }
    ];
};

/*
// to paste into "description.ext"

// RHINO SLOT
class CfgDebriefing
{  
	class rhino_end_slot_reservado
	{
		title = "SLOT RESERVADO PARA MIEMBROS";
		subtitle = "";
		description = "Los jugadores que no sean miembros del Grupo Rhino deben seleccionar un slot para invitados";
		pictureBackground = "";
		picture = "b_inf";
		pictureColor[] = { 0.0, 0.3, 0.6, 1 };
	};
};
*/