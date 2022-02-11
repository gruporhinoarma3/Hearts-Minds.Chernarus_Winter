// respawn loadout

_codigo = {
	MyLoadout = getUnitLoadout player;
	hint "Loadout guardado";
};

_action = ["saveLoadout", "Save respawn loadout", "", _codigo, {true}] call ace_interact_menu_fnc_createAction;

[ rhino_arsenal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[ rhino_arsenal_2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


// arsenal rhino sin limitar

[ rhino_arsenal_2, true] call ace_arsenal_fnc_initBox;
[ rhino_arsenal_2, true, false] call ace_arsenal_fnc_addVirtualItems;

_name = "rhino_arsenal";
_text = "A|R|senal";
_icon = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\a_ca.paa";
_action = { player setPos ( getPos rhino_arsenal_2 vectorAdd [0,1,0] ) };
_condition = { ( (name player) find "|r|" == 0 ) || ( (name player) find "|R|" == 0 ) };
_action = [ _name, _text, _icon, _action, _condition] call ace_interact_menu_fnc_createAction;
[ rhino_arsenal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_name = "rhino_arsenal_1";
_text = "Salir del a|R|senal";
_icon = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\a_ca.paa";
_action = { player setPos ( getPos rhino_arsenal_1 vectorAdd [0,1,0] ) };
_condition = { true };
_action = [ _name, _text, _icon, _action, _condition] call ace_interact_menu_fnc_createAction;
[ rhino_arsenal_2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

if (isServer) exitWith {};