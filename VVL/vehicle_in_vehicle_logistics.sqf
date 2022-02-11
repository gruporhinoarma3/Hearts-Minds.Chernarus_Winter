/*
Paste this line inside "misionfolder/init.sqf" :

execVM "VVL\vehicle_in_vehicle_logistics.sqf";

*/

call compile preprocessFileLineNumbers "VVL\vehicle_in_vehicle_logistics_str.sqf";

execVM "VVL\vehicle_in_vehicle_logistics_def.sqf";