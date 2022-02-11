//script: rhino_hospital_3
//author: |R|Kiron
//date: 2021-09-15

rhino_hospital_distancia  = 4; // metros
rhino_hospital_varnames   = [ rhino_npc_medic ];
rhino_hospital_classnames = [ "Land_Stretcher_01_F" ];
rhino_hospital_texto_menu = "<t color='#FF0000'>Atención sanitaria</t>";
rhino_hospital_texto_hint = [
    composeText ["Soldado, vigile esas heridas.", lineBreak, "Puede volver al frente."],
    composeText ["Debe ser prudente, le ha faltado poco...", lineBreak, "No siempre va a tener tanta suerte."],
    composeText ["Pudimos salvarle, pero de milagro.", lineBreak, "Váyase y que no vuelva a verle por aqui."],
    composeText ["No hace falta que me de las gracias,", lineBreak, "es mi trabajo", lineBreak, "Y de todas maneras nadie lo hace."],
    composeText ["Punto aquí, punto allá", lineBreak, "sutúrale, sutúrale", lineBreak, "una esquirla de metal", lineBreak, "extráela, extráela", lineBreak, "Vía aquí, vía allá", lineBreak, "inyéctale, inyéctale..."],
    composeText ["Está usted en plena forma.", lineBreak, "Contacte con el oficial al mando para recibir instrucciones."],
    composeText ["Tras cirugía y meses de rehabilitación", lineBreak, "vuelves a ser apto para el servicio."]
    ];

rhino_hospital_accion = 
{
    params ["_target", "_caller", "_actionId", "_arguments"];

    _medic = _target;
    _patients = nearestObjects [ _medic , ["Man"], rhino_hospital_distancia];
    _text = selectRandom rhino_hospital_texto_hint;
    {
        [ _medic , _x ] call ace_medical_treatment_fnc_fullHeal;
        _na = _text remoteExec ["hint", _x];
    }
    foreach _patients;
};

rhino_hospital_addaccion =
{
    params [ "_object" ];

    _object addAction [
        rhino_hospital_texto_menu,
        rhino_hospital_accion,
        [], 1.5,  true, true, "", "true",
        rhino_hospital_distancia,
        false, "", ""
        ];
};

{ [ _x ] spawn rhino_hospital_addaccion;
}
forEach rhino_hospital_varnames;

{ [ _x, "init", rhino_hospital_addaccion, true, [], true] call CBA_fnc_addClassEventHandler;
}
forEach rhino_hospital_classnames;