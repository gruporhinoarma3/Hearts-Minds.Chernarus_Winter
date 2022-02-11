// script: rhino_radio_gui
// task: allow player with radio backpack to open a GUI for calling supports and managing supports
// author: |R|kiron
// date: 2020-12-24

// __________________________________________________________________________________________
//
// description.ext
/*
#include "rhino_radio\rhino_radio_gui_defines.hpp"
#include "rhino_radio\rhino_radio_gui.hpp"
*/


// PARAMS
params[ "_radioholder" ];


//CLOSE GUI IF FAR FROM RADIO HOLDER
[ _radioholder ] execVM "rhino_radio\rhino_radio_gui_close.sqf";


// GUI DATA CONSTANTS
rhino_radio_gui_active_list_control = 1500; // handle of the active list
rhino_radio_display_id = 9999;

// GUI CREATION
createDialog "rhino_radio_gui";
waitUntil { !isNull (findDisplay rhino_radio_display_id); };


// MAP CREATION
_map = findDisplay rhino_radio_display_id ctrlCreate ["RscMapControl", -1];
_map ctrlSetPosition [ -0.7, 0, 0.68, 1 ];
_map ctrlCommit 0;


// GLOBAL VARIABLES
rr_gui_asset_list = [];
rr_gui_selected_support = [];
rr_gui_selected_assetID = [];


// BUTTONS ACTIONS

// up and down
buttonSetAction [1600, "[] spawn rhino_radio_gui_fn_up" ];
buttonSetAction [1601, "[] spawn rhino_radio_gui_fn_down" ];

// cancel and enter
buttonSetAction [1602, "[] spawn rhino_radio_gui_fn_cancel;" ];
buttonSetAction [1603, "[] spawn rhino_radio_gui_fn_enter;" ];

// 0,1,2 ... 9
buttonSetAction [1604, "[ '0' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1605, "[ '1' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1606, "[ '2' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1607, "[ '3' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1608, "[ '4' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1609, "[ '5' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1610, "[ '6' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1611, "[ '7' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1612, "[ '8' ] spawn rhino_radio_gui_fn_number;" ];
buttonSetAction [1613, "[ '9' ] spawn rhino_radio_gui_fn_number;" ];

// delete
buttonSetAction [1614, "[] spawn rhino_radio_gui_fn_delete;" ];

// map
buttonSetAction [1621, "[] spawn rhino_radio_gui_fn_map;" ];


// GUI DATA INITIALIZATION

// lists
_displaycontrol = ( findDisplay rhino_radio_display_id ) displayCtrl 1500;
{ _displaycontrol lbAdd _x; } forEach rhino_radio_gui_list_supports;
lbSetCurSel [ 1500, 0] ;

_displaycontrol = ( findDisplay rhino_radio_display_id ) displayCtrl 1501;
{ _displaycontrol lbAdd _x; } forEach [ "" ];
lbSetCurSel [ 1501, 0] ;

_displaycontrol = ( findDisplay rhino_radio_display_id ) displayCtrl 1502;
{ _displaycontrol lbAdd _x; } forEach [ "" ];
lbSetCurSel [ 1502, 0] ;

_displaycontrol = ( findDisplay rhino_radio_display_id ) displayCtrl 1503;
{ _displaycontrol lbAdd _x; } forEach [ "" ];
lbSetCurSel [ 1503, 0] ;

// edits
_xcoord = str( rr_coord_gui#0 );
_ycoord = str( rr_coord_gui#1 );

while {count _xcoord < 5} do { _xcoord = "0" + _xcoord };
while {count _ycoord < 5} do { _ycoord = "0" + _ycoord };

_displaycontrol = ( findDisplay rhino_radio_display_id ) displayCtrl 1400;
_displaycontrol ctrlSetText _xcoord;

_displaycontrol = ( findDisplay rhino_radio_display_id ) displayCtrl 1401;
_displaycontrol ctrlSetText _ycoord;

/* NOTES
        lbSetData [idc, index, data];
*/