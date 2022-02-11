// script: rhino_radio_fn_getposmap.sqf
// author: |R|Kiron
// date: 2020-11-01
//
// returns the position of a user map click
//
// rhino_radio_fn_getposmap = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap.sqf";
// _position = call rhino_radio_fn_getposmap;
// 
// _position = call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_getposmap.sqf";


openMap true;																																						// open map
onMapSingleClick { _marker = createMarker ["rhino_radio_user_map_click", _pos]; onMapSingleClick ""; true };	// create local marker on map clic
waitUntil { getMarkerColor "rhino_radio_user_map_click" != "" };																			// wait for local marker creation
_posmapclick = getMarkerPos "rhino_radio_user_map_click";																				// get positon of marker
"rhino_radio_user_map_click" setMarkerShape "ICON";																							// make marker visible for player
"rhino_radio_user_map_click" setMarkerType "hd_objective";
"rhino_radio_user_map_click" setMarkerColor "ColorBlack";
sleep 1;
openMap false;
deleteMarker  "rhino_radio_user_map_click";																										// delete marker
_posmapclick																																						// return position



/* alternative method
rhino_radio_mapPosition = [0,0,0];																											// create global variables (only way to comunicate with onMapSingleClick as it has not return variables, other than creating a marker)
rhino_radio_exit = false;
onMapSingleClick "rhino_radio_mapPosition = _pos; onMapSingleClick """"; rhino_radio_exit = true; true";	// get position of click in map and confirmation variable
//while {!rhino_radio_exit} do {sleep 1;};																									// wait for the user click on map
waitUntil { rhino_radio_exit };
_requested_pos = rhino_radio_mapPosition;																								// store position in private variable to return
rhino_radio_mapPosition = nil;																													//clear global variables
rhino_radio_exit = nil;
_requested_pos																																		// return value
*/