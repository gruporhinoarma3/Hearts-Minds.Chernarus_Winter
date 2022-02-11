// execVM "rhino\rhino_skiptime.sqf";
// _unit addAction [    _action_text, rhino_skiptime_remoteExec, [ _hour,  _text_during_cut ], 1.5, true, true, "", "True", 3, false, "", "" ];
// _unit addAction [ "skip sometime", rhino_skiptime_remoteExec, [     7, "some time later" ], 1.5, true, true, "", "True", 3, false, "", "" ];

_rhino_skiptime_action_vehicles =[
    rhino_retrasar_operacion_1
    ];

_rhino_skiptime_action_params = [
    ["Retrasar operación al amanecer",7,"Horas despues, tras amanecer..."],
    ["Retrasar operación al mediodia",13,"Horas despues, al mediodia..."],
    ["Retrasar operación al anochecer",22,"Horas despues, tras anochecer..."]
    ];

rhino_skiptime =
{
    params["_hour","_text"];
    hintSilent "";
    cutText [ "<t color='#FFFFFF' shadow='2' shadowColor='#ff0000' size='3'>"+_text+"</t>", "BLACK", -1, true, true];
    sleep 1;
    if (isServer) then { skipTime (( _hour - daytime + 24 ) % 24) };
    sleep 1;
    0 cutFadeOut 1;
};

rhino_skiptime_remoteExec =
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    _arguments params ["_hour","_text"];
    [_hour,_text] remoteExec [ "rhino_skiptime", 0];
};

{
    _vehicle = _x;
    {
        _x params ["_text_action","_skiptohour","_text_cutscene"];
        _vehicle addAction [
            _text_action,
            rhino_skiptime_remoteExec,
            [ _skiptohour, _text_cutscene ],
            1.5, true, true, "", "True", 3, false, "", ""
            ];
    }
    forEach _rhino_skiptime_action_params;
}
forEach _rhino_skiptime_action_vehicles;