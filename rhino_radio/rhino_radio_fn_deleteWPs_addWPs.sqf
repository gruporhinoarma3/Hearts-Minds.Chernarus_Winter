/*
script: rhino_radio_fn_deleteWPs_addWPs.sqf
author: |R|Kiron
date: 2021-04-01 , 2021-09-15
task: deletes all waypoints of a unit, then adds one or more waypoints of a given type at a given position with given statement

EXAMPLE:
rhino_radio_fn_deleteWPs_addWPs = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_deleteWPs_addWPs.sqf";
_group = group((crew(vehicle player))#0);
_wp_pos = [0,0,0];
_wp_done_radius = 50;
_wp_type = "Move";
_wp_statement = "vehicle this land ""GET OUT"";";
_waypoint_data = [ [ _wp_pos, _wp_done_radius, _wp_type, _wp_statement ] ];
[ _group, _waypoint_data ] remoteExec ["rhino_radio_fn_deleteWPs_addWPs",2];
[ _group, _waypoint_data ] call rhino_radio_fn_deleteWPs_addWPs;
*/

params[ "_group", "_waypoint_data" ];

// delete group waypoints
for "_i" from count waypoints _group - 1 to 0 step -1 do
{
    deleteWaypoint [ _group , _i ];
};

// for each given position, create waypoint with each given options
{
    _wp0 = _group addWaypoint[ _x#0 , 0];           //_wp_pos           = _waypoint_data#0
    _wp0 setWaypointCompletionRadius _x#1;          //_wp_done_radius   = _waypoint_data#1
    _wp0 setWaypointType _x#2;                      //_wp_type          = _waypoint_data#2
    _wp0 setWaypointStatements ["true", _x#3 ];     //_wp_statement     = _waypoint_data#3
/*
    if (x#2 == "LOITER") then                       // special waypoint configuration
    {
        _wp0 setWaypointLoiterType "CIRCLE";
        _wp0 setWaypointLoiterRadius x#4;           //_flightaltitude   = _waypoint_data#4
        _wp0 setWaypointLoiterAltitude x#4;
    };
*/
} forEach _waypoint_data;