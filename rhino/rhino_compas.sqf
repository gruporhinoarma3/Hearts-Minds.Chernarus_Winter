rhino_compas = true;

_code = {[] spawn {

	rhino_compas = false;
	
	compas_pto1 = [0,0,0];
	compas_pto2 = [0,0,0];
	
	compas_click = false;
	[] onMapSingleClick {compas_pto1 = _pos; compas_click = true; onMapSingleClick "";};
	waitUntil {!visibleMap or compas_click};
	if (!compas_click) exitWith { onMapSingleClick ""; rhino_compas = true; };
	
	compas_click = false;
	[] onMapSingleClick {compas_pto2 = _pos; compas_click = true; onMapSingleClick "";};
	waitUntil {!visibleMap or compas_click};
	if (!compas_click) exitWith { onMapSingleClick ""; rhino_compas = true; };
	
	_r = compas_pto1 distance2D compas_pto2;
	_angle = 10;
	_current = 0;
	_sideB = _r*0.01;
	_sideA = _r * (sin (_angle/2));
	_colors = ["colorBlack","colorRed","colorYellow","colorGreen","colorBlue","colorWhite","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian","colorUNKNOWN"];
	_color = _colors select lbCurSel (findDisplay 12 displayCtrl 1090) ;
	  
	while {_current < 360} do {
		_pos = compas_pto1 getPos [_r,_current];
		_name = "_USER_DEFINED "+ (str _pos);
		_mrk = createMarkerLocal [_name, _pos];
		_mrk setMarkerShapeLocal "RECTANGLE";
		_mrk setMarkerColorLocal _color;
		_mrk setMarkerBrushLocal "SolidFull";
		_mrk setMarkerSizeLocal [_sideA, _sideB];
		_mrk setMarkerDirLocal _current;
		_mrk setMarkerAlpha 0.5;
		_current = _current + _angle;
	};
	
	rhino_compas = true;
};};

_condition = {rhino_compas};

_action = [ "usarCompas", "Utilizar compas", "", _code,_condition] call ace_interact_menu_fnc_createAction;

[ player, 1, ["ACE_SelfActions","ACE_MapTools"], _action ] call ace_interact_menu_fnc_addActionToObject;