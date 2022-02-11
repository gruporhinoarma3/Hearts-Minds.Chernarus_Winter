//script: vehicle_in_vehicle_logistics_str
//author: |R|kiron
//date: 2021-04-09
// custom system similar to BIS stringtable.xml


vvl_list_languagues = [ "English", "Spanish" ];

vvl_str_index = vvl_list_languagues find language;

if ( vvl_str_index < 0 ) then { vvl_str_index = 0; };

vvl_str_load 		= ["Load in vehicle",			"Cargar en vehículo"			] # vvl_str_index;
vvl_str_unload 	= ["Unload from vehicle",	"Descargar del vehículo"	] # vvl_str_index;