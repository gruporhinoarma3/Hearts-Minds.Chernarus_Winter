// script: rhino_radio_fn_getposmap_cancel.sqf
// author: |R|Kiron
// date: 2020-11-01
//
// cancels user map click
//
// rhino_radio_fn_getposmap_cancel = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap_cancel.sqf";
// [] spawn rhino_radio_fn_getposmap;
// 
// [] spawn compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap.sqf";
// 
// execVM "rhino_radio\rhino_radio_fn_getposmap.sqf";


onMapSingleClick "";                                                // cancel mapclic actions
rhino_radio_selecting_map_pos = false;                              // cancel request
_marker = createMarker ["rhino_radio_user_map_click", [0,0,0] ];    // exit the loop in getposmap
sleep 2;
deleteMarker  "rhino_radio_user_map_click";                         //clean