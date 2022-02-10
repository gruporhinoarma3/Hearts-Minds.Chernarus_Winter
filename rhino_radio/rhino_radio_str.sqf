//script: rhino_radio_str
//author: |R|kiron
//date: 2021-01-28
// custom system similar to BIS stringtable.xml

rr_str_radiomsg = "<t color='#00FFFF'>Radio: </t>";

rr_list_languagues = ["English","Spanish"];
rr_str_index = rr_list_languagues find language;
if ( rr_str_index < 0 ) then { rr_str_index = 0; };

// rhino_radio_actions_heli_transport.sqf
rr_str_rhinoradio = ["|R|adio","|R|adio"];
rr_str_landatlocation = ["Land at map location","Aterriza en posición de mapa"];
rr_str_landatlocationengineoff = ["Land at map location and turn engine off","Aterriza en posición de mapa y apaga motores"];
rr_str_hoveratlocation = ["Hover at map location","Ve a posición de mapa y manten altura"];
rr_str_setaltitude = ["Set altitude", "Fijar altitud"];
rr_str_landatcoords = ["Land","Aterriza"];
rr_str_coordsengineoff = ["Land, engine off","Aterriza, motor off"];
rr_str_hoveratcoords = ["Hover", "Sobrevuela"];
rr_str_cancel = ["Cancel","Cancelar"];

//rhino_radio_actions_heli_BIS
rr_str_dismiss = [ "<t color='#FF0000'>Dismiss</t>", "<t color='#FF0000'>¡Retírate!</t>" ];
rr_str_land = [ "<t color='#00DDDD'>Land</t>", "<t color='#00DDDD'>¡Aterriza!</t>" ];
rr_str_rtb = [ "<t color='#FF00FF'>Return To Base</t>", "<t color='#FF00FF'>Regresa a base</t>" ];

// external radio
rr_str_accesradio = [ "Access |R|adio", "Acceder a la |R|adio" ]#rr_str_index;
rr_str_useradio = [ "Use |R|adio", "Usar |R|adio" ]#rr_str_index;