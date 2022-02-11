// script: rhino_radio_fn_asset_list_update
// task: server update the asset list
// author: |R|kiron
// date: 2021-03-19
// example:
// rhino_radio_fn_asset_list_update	= compile preprocessFileLineNumbers "rhino_radio\rhino_radio_fn_asset_list_update.sqf";
// [ _asset_index_1, _asset_index_2, _value ] call rhino_radio_fn_asset_list_update;

params[ "_asset_index_1", "_asset_index_2", "_value" ];

_asset = rhino_radio_assets#_asset_index_1;       // get asset array from asset list

_asset set[ _asset_index_2, _value ];             // update asset array with new value for one asset variable

rhino_radio_assets set[ _asset_index_1, _asset ]; // update asset list with modified asset array

publicVariable "rhino_radio_assets";              // share across server and clients