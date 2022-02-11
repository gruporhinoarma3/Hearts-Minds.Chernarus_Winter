//script: rhino_radio_str
//author: |R|kiron
//date: 2021-01-28
// custom system similar to BIS stringtable.xml

rr_str_radiomsg = "<t color='#00FFFF'>Radio: </t>";

rr_list_languagues = ["English","Spanish"];
rr_str_index = rr_list_languagues find language;
if ( rr_str_index < 0 ) then { rr_str_index = 0; };

//
rr_str_rhinoradio = ["|R|adio","|R|adio"]#rr_str_index;

// rhino_radio_actions_heli_transport.sqf
rr_str_landatlocation = ["Land at map location","Aterriza en posición de mapa"]#rr_str_index;
rr_str_landatlocationengineoff = ["Land at map location and turn engine off","Aterriza en posición de mapa y apaga motores"]#rr_str_index;
rr_str_hoveratlocation = ["Hover at map location","Ve a posición de mapa y manten altura"]#rr_str_index;
rr_str_setaltitude = ["Set altitude", "Fijar altitud"]#rr_str_index;

// rhino_radio_params.sqf
rr_str_landatcoords = ["Land","Aterriza"]#rr_str_index;
rr_str_engineoffatcoords = ["Land, engine off","Aterriza, motor off"]#rr_str_index;
rr_str_hoveratcoords = ["Hover", "Sobrevuela"]#rr_str_index;

//rhino_radio_actions_heli_BIS
rr_str_dismiss = [ "<t color='#FF0000'>Dismiss</t>", "<t color='#FF0000'>¡Retírate!</t>" ]#rr_str_index;
rr_str_land = [ "<t color='#00DDDD'>Land</t>", "<t color='#00DDDD'>¡Aterriza!</t>" ]#rr_str_index;
rr_str_rtb = [ "<t color='#FF00FF'>Return To Base</t>", "<t color='#FF00FF'>Regresa a base</t>" ]#rr_str_index;

// external radio
rr_str_accesradio = [ "Access |R|adio", "Acceder a la |R|adio" ]#rr_str_index;
rr_str_useradio = [ "Use |R|adio", "Usar |R|adio" ]#rr_str_index;

// rhino_radio_artillery.sqf
rr_str_noammo = [ "Request canceled: No ammo.", "Petición denegada: Sin municion." ]#rr_str_index;
rr_str_baddata = [ "Request canceled: Bad data.", "Petición denegada: Datos erroneos." ]#rr_str_index;
rr_str_outofrange = [ "Request canceled: Out of range.", "Petición denegada: Fuera de alcance." ]#rr_str_index;
rr_str_eta = [ "Artillery ETA is ", "Tiempo estimado para impacto de artilleria: " ]#rr_str_index;
rr_str_roundscomplete = [ "Artillery rounds complete.", "Disparos de artillería completados." ]#rr_str_index;

//rhino_radio_gui_callsupport.sqf
rr_str_cancel1 = ["Request already canceled","Petición ya anulada"]#rr_str_index;
rr_str_position_cancel = ["Artillery or VLS can not change its position","Artillería y VLS no pueden desplazarse"]#rr_str_index;
rr_str_assetnotdeployed = ["Asset not deloyed","Unidad no desplegada"]#rr_str_index;

// not used
rr_str_cancel = ["Cancel","Cancelar"]#rr_str_index;
