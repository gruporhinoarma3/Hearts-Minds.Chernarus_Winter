// script: rhino_teamspeak.sqf
// task: warn players not connected to RHINO teamspeak server
// author: |R|Charlymachine
// date: 2020-03-19

if (isServer) exitWith {};

sleep 10;

hintSilent "";

_conectadoa = call TFAR_fnc_getTeamSpeakServerName;

if ( _conectadoa != 'Grupo Rhino ArmA' ) then {

_nombreJugador = name player;

cutText ["
<t color='#ffffff' shadow='2' shadowColor='#000000' size='3'> Hola "+_nombreJugador+":</t><br/><t color='#ffffff' shadow='2' shadowColor='#ff0000' size='3'>Hemos detectado que no estas conectado <br/>a nuestro TeamSpeak IP: 188.165.133.8</t><br/><t color='#ffffff' shadow='2' shadowColor='#ff0000' size='2'>https://www.gruporhinoarma.es</t>",
 "BLACK", -1, true, true];
 
_load = getUnitLoadOut player; // player loadout

removeAllWeapons player;

while { _conectadoa != 'Grupo Rhino ArmA'} do { _conectadoa = call TFAR_fnc_getTeamSpeakServerName; sleep 1; };

player setUnitLoadOut _load; // player set loadout

0 cutFadeOut 1;

};