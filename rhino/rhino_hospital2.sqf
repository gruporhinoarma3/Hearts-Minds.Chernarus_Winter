//script: rhino_hospital2
//author: |R|Kiron
//date: 2020-03-01

rhino_npc_medic addAction ["<t color='#FF0000'>Atención sanitaria</t>", {

    {
        [ rhino_npc_medic , _x ] call ace_medical_treatment_fnc_fullHeal;
        
        hint "Tras meses de atenciones hospitalarias y dolorosas sesiones de rehabilitación finalmente vuelves a estar en activo";
        
    } foreach nearestObjects [ rhino_npc_medic , ["Man"], 4]; // for each paciente

},[], 1.5,  true, true, "",
"true", // _target, _this, _originalTarget
4,
false,"",""];