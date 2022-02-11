// script: rhino_radio_tfr_baseantena.sqf
// author: |R|Kiron
// date: 2020-11-07
//
// rhino_radio_base_antena

_rhino_radio_base_antena_class = rhino_radio_antena_base_class;

_actionpath = ["ACE_MainActions"];

_name = "rhino_radio_tfr_conectarabase";

_text = "Conectar radio a antena de base";

_icon1 = "\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa";

_statement1 = {
                        params ["_target", "_player", "_params"];
                        _player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
                        _player setVariable ["tf_receivingDistanceMultiplicator", rhino_radio_base_tf_receivingDistanceMultiplicator];
                        _player setVariable ["tf_sendingDistanceMultiplicator", rhino_radio_base_tf_sendingDistanceMultiplicator];
                        _antennatrigger = createTrigger ["EmptyDetector", getPos _player, false];
                        _antennatrigger setTriggerArea [1, 1, getDir this, false, 1000];
                        _antennatrigger setTriggerType "NONE";
                        _antennatrigger setTriggerActivation ["ANYPLAYER", "NOT PRESENT", false];
                        _antennatrigger setTriggerStatements [  "!(player in thisList)",
                                                                "
                                                                hint 'Conexión radio-antena perdida';
                                                                player setVariable [""tf_receivingDistanceMultiplicator"", 1];
                                                                player setVariable [""tf_sendingDistanceMultiplicator"", 1];
                                                                deleteVehicle thisTrigger;
                                                                ",
                                                                ""];
                       };

_condition1 = { true };

_action = [ _name, _text, _icon1, _statement1, _condition1] call ace_interact_menu_fnc_createAction;

{ [ _x, 0, _actionpath, _action] call ace_interact_menu_fnc_addActionToClass;
} forEach _rhino_radio_base_antena_class;

if (not(isNil "rhino_radio_base_antena")) then {
	[ rhino_radio_base_antena, 0, _actionpath, _action] call ace_interact_menu_fnc_addActionToObject; };

