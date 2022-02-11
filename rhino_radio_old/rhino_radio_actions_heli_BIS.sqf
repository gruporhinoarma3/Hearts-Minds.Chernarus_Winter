//script: rhino_radio_actions_heli_BIS
//author: |R|kiron
//date: 2021-01-29


// parameters
params[ "_heli", "_asset" ];

// create action Dismiss
_heli addAction  [rr_str_dismiss#rr_str_index,{
	params ["_target", "_caller", "_actionId", "_arguments"];
	_asset = _arguments#0;
	_asset_index = _asset#rrg_index_index;
	_asset = rhino_radio_assets#_asset_index;
	_asset_state = _asset#rrg_index_state;
	if ( _asset_state == rrg_state_busy ) then {
		[ [ _asset ], "rhino_radio\rhino_radio_gui_cancel_request.sqf" ] remoteExec ["execVM", 2]; };		// cancel request if has not been previously cancel
	[west,"HQ"] sideRadio "mp_groundsupport_15_disembarked_BHQ_0";												// confirmation sound
	_caller playActionNow "GestureGo";
	},
	_asset,																				// params
	1.5,true,true,"",
	"(count ( allPlayers select {_x in (crew _target) } )) < 1", // _target, _this, _originalTarget
	50,false,"","" ];


// create action Land
_heli addAction  [rr_str_land#rr_str_index,{
	params ["_target", "_caller", "_actionId", "_arguments"];
	_group = group ((crew (_this select 0)) select 0);
	for "_i" from count waypoints _group - 1 to 0 step -1 do { deleteWaypoint [ _group , _i ]; };
	_wp0 = _group addWaypoint[ getPos (_this select 0) , 0];
	_wp0 setWaypointType "move";
	_wp0 setWaypointStatements ["true", "vehicle this land ""GET OUT"";"];
	_group setBehaviour "CARELESS";
	_caller playActionNow "GestureCeaseFire";
	},
	[],1.5,true,true,"",
	"true", // _target, _this, _originalTarget
	100,false,"","" ];


// create action Return To Base
_heli addAction  [rr_str_rtb#rr_str_index,{
	params ["_target", "_caller", "_actionId", "_arguments"];
	_group = group ((crew (_this select 0)) select 0);
	for "_i" from count waypoints _group - 1 to 0 step -1 do { deleteWaypoint [ _group , _i ]; };	// delete previous waypoints
	_wp0 = group ((crew (_this select 0)) select 0) addWaypoint[ getPos rhino_radio_base , 0];		// create waypoint
	_wp0 setWaypointType "move"; 
	_wp0 setWaypointCompletionRadius 50;
	_wp0 setWaypointStatements ["true", "vehicle this land ""GET OUT"";"];
	_group setBehaviour "CARELESS";
	[west,"HQ"] sideRadio "mp_groundsupport_10_boardingended_BHQ_0";	// confirmation sound
	_caller playActionNow "GestureGo";
	},
	[],1.5,true,true,"",
	"(count ( allPlayers select {_x in (crew _target) } )) > 0", // _target, _this, _originalTarget
	50,false,"","" ];