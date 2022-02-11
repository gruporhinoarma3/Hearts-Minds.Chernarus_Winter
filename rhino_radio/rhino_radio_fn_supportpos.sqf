// script: rhino_radio_selecting_map_pos.sqf
// author: |R|Kiron
// date: 2020-11-01, 2021-09-15
//
// changes state to requesting (allowing for the cancel support action), calls function for selecting support coords and returns selected coords and boolean cancel variable.
//
// rhino_radio_fn_supportpos = compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_supportpos.sqf";
// _return = call rhino_radio_fn_supportpos;
// 
// _requested_pos = call compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_supportpos.sqf";


rhino_radio_selecting_map_pos = true;           // do request

_requested_pos = call rhino_radio_fn_getposmap; // get requested position

_ok = false;
if ( rhino_radio_selecting_map_pos ) then       // cancel request in case of user cancel
{
    _ok = true;
};

rhino_radio_selecting_map_pos = false;          // end request

_return = [ _requested_pos, _ok ];              // return
_return