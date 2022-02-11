//script: rhino_radio_actions_heli_BIS
//author: |R|kiron
//date: 2021-01-29


// parameters
params[ "_heli", "_asset" ];

// create action Dismiss
_heli addAction  [rr_str_dismiss,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _asset = _arguments#0;
        _asset_index = _asset#rrg_index_index;
        _asset = rhino_radio_assets#_asset_index;
        _asset_state = _asset#rrg_index_state;
        if ( _asset_state == rrg_state_busy ) then
        {
            [ _asset_index ] remoteExec ["rhino_radio_fn_aircraft_cancel", 2];  // cancel request if has not been previously cancel
        };
        [west,"HQ"] sideRadio "mp_groundsupport_15_disembarked_BHQ_0";          // confirmation sound
        _caller playActionNow "GestureGo";
	},
    _asset,                                                                     // params
    1.5,true,true,"",
    "(count ( allPlayers select {_x in (crew _target) } )) < 1",                // _target, _this, _originalTarget
    50,false,"","" ];


// create action Land
_heli addAction  [rr_str_land,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _group = group ((crew (_this select 0)) select 0);
        _wp_pos = getPos (_this select 0);
        _wp_statement = "vehicle this land ""GET OUT"";";
        _waypoint_data = [ [ _wp_pos, 50, "MOVE", _wp_statement] ];
        [ _group, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;    // delete, create waypoints
        _group setBehaviour "CARELESS";
        _caller playActionNow "GestureCeaseFire";
    },
    [],1.5,true,true,"",
    "true", // _target, _this, _originalTarget
    100,false,"","" ];


// create action Return To Base
_heli addAction  [rr_str_rtb,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _group = group ((crew (_this select 0)) select 0);
        _wp_statement = "vehicle this land ""GET OUT"";";
        _waypoint_data = [[ getPos rhino_radio_base, 50, "MOVE", _wp_statement]];
        [ _group, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;    // delete, create waypoints
        _group setBehaviour "CARELESS";
        [west,"HQ"] sideRadio "mp_groundsupport_10_boardingended_BHQ_0";    // confirmation sound
        _caller playActionNow "GestureGo";
    },
    [],1.5,true,true,"",
    "(count ( allPlayers select {_x in (crew _target) } )) > 0",            // _target, _this, _originalTarget
    50,false,"","" ];