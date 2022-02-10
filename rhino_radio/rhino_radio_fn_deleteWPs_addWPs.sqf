// script: rhino_radio_fn_deleteWPs_addWPs.sqf
// author: |R|Kiron
// date: 2021-04-01
//
// deletes all waypoints of a unit, then adds one or more waypoints of a given type at a given position with given statement
//
// EXAMPLE:
// rhino_radio_fn_deleteWPs_addWPs = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_deleteWPs_addWPs.sqf";
// _group = group((crew(vehicle player))#0);
// _pos = [[0,0,0]];
// _type = ["Move"];
// _WPstatement = [ "vehicle this land ""GET OUT"";" ];
// [ [_group, _pos, _type, _WPstatement], "rhino_radio_fn_deleteWPs_addWPs" ] remoteExec ["call",2];


params[ "_group", "_pos", "_type", "_WPstatement" ];

for "_i" from count waypoints _group - 1 to 0 step -1 do { deleteWaypoint [ _group , _i ];  };	// delete group waypoints

{
	_wp0 = _group addWaypoint[ _x , 0];																					// for each given position, create waypoint with given options
	_wp0 setWaypointType _type#_forEachIndex;
	_wp0 setWaypointCompletionRadius 0;
	_wp0 setWaypointStatements ["true", _WPstatement#_forEachIndex ];
	
} forEach _pos;