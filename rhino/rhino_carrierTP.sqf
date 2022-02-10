rhino_npc_carrier_1 addAction ["<t color='#FF0000'>Transladarse al FOB</t>", {
	player setPosASL ( getPosASL rhino_npc_carrier_2 vectorAdd [0,1,0] )
},[], 1.5,  true, true, "",
"true", // _target, _this, _originalTarget
4,
false,"",""];

rhino_npc_carrier_2 addAction ["<t color='#FF0000'>Transladarse al portaviones</t>", {
	player setPosASL ( getPosASL rhino_npc_carrier_1 vectorAdd [0,1,0] )
},[], 1.5,  true, true, "",
"true", // _target, _this, _originalTarget
4,
false,"",""];