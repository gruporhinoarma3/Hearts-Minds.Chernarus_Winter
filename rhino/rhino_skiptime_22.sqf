{ hintSilent "";
} remoteExec ["bis_fnc_call", 0];

{ cutText [ "<t color='#FFFFFF' shadow='2' shadowColor='#ff0000' size='3'>Más tarde, tras la puesta de sol...</t>", "BLACK", -1, true, true];
} remoteExec ["bis_fnc_call", 0];

sleep 1;

[ ( 22 - daytime + 24 ) % 24 ] remoteExec ["skipTime",2];

sleep 1;

{ 0 cutFadeOut 1;
} remoteExec ["bis_fnc_call", 0];