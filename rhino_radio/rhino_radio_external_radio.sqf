//script: rhino_radio_external_radio.sqf
//author: |R|kiron
//date: 2021-03-21
//add the posibility of acces the support menu through the radio of another unit with radio

 _action_name = "rhino_radio_external_radio_use";
 _action_string = rr_str_useradio;
 _action_icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa";
 _action_statement = { [cursorTarget] execVM "rhino_radio\rhino_radio_gui.sqf"; };
 _action_condition = { (backpack  _target) in rhino_radio_backpacks };
 _action_children_code = {};
 _action_parameters = [];
 _action_position = [];
 _action_distance = 2;
//  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
// * 10: Modifier function <CODE> (Optional)

_action = [ _action_name,_action_string,_action_icon, _action_statement,_action_condition,
            _action_children_code,_action_parameters, _action_position, _action_distance ] call ace_interact_menu_fnc_createAction;

["Man", 0, ["ACE_TapShoulderRight"] , _action, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 0, ["ACE_TapShoulderLeft"]  , _action, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 0, ["ACE_MainActions"]      , _action, true] call ace_interact_menu_fnc_addActionToClass;