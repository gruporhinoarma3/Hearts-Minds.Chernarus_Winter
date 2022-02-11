// task: warn players with an unauthorized name
// date: 2022-02-02

// profileNamespace setVariable ["rhino_member_list", rhino_member_list];
if (isServer) exitWith
{
    rhino_member_list = profileNamespace getVariable ["rhino_member_list", [] ];
    publicVariable "rhino_member_list";
};

waitUntil { not isNil "rhino_member_list"};
if ( !('|R|' in name player) ) exitWith {};
if ( (getPlayerUID player) in rhino_member_list ) exitWith {}; // check if valid name

hintSilent "";
cutText ["
<t color='#ffffff' shadow='2' shadowColor='#000000' size='3'>Tu nombre de jugador es</t><br/>
<t color='#ff0000' shadow='2' shadowColor='#000000' size='3'>"+name player+"</t><br/>
<br/><br/>
<t color='#ffffff' shadow='2' shadowColor='#000000' size='3'>Solamente los </t>
<t color='#aaffaa' shadow='2' shadowColor='#000000' size='3'>miembros activos</t>
<t color='#ffffff' shadow='2' shadowColor='#000000' size='3'> del grupo rhino</t><br/>
<t color='#ffffff' shadow='2' shadowColor='#000000' size='3'>pueden portar en su nombre de jugador</t><br/>
<t color='#ffffff' shadow='2' shadowColor='#000000' size='3'>el identificativo</t><br/>
<t color='#ff0000' shadow='2' shadowColor='#000000' size='3'>|R|</t><br/>
<br/><br/>
<t color='#ffffff' shadow='2' shadowColor='#000000' size='2'>Puedes consultar la lista de miembros activos en:</t><br/>
<t color='#9999ff' shadow='2' shadowColor='#000000' size='2'>https://www.gruporhinoarma.es</t><br/>
", "BLACK", -1, true, true];    // display blackout message

_load = getUnitLoadOut player;  // player get loadout
removeAllWeapons player;        // remove player weapons

while { true } do
{
    if ( !('|R|' in name player) ) exitWith {};
    rhino_member_list = profileNamespace getVariable ["rhino_member_list", [] ];
    if ( (getPlayerUID player) in rhino_member_list ) exitWith {};
    sleep 1;
};                              // recheck if valid name

player setUnitLoadOut _load;    // player set loadout
0 cutFadeOut 1;                 // remove blackout animation