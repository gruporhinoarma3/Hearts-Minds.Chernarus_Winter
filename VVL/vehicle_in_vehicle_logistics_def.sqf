//script: vehicle_in_vehicle_logistics_def
//author: |R|kiron
//date: 2019-01-01
// generates list of vehicles classnames that will be able to be loaded

_vehicle_loadable = [

    "Land_Pod_Heli_Transport_04_medevac_F",
    "Land_Pod_Heli_Transport_04_covered_F",

	"Land_CanisterPlastic_F",
	"Land_WaterBarrel_F",
	"Land_WaterTank_F",

	"Land_Pallets_stack_F",
	"Land_RotorCoversBag_01_F",
    "Land_Pallet_F",
	"Land_Ammobox_rounds_F",
	"Land_PortableLight_double_F",
	"Land_PortableLight_single_F",

	"Land_EngineCrane_01_F",
    
    "B_T_LSV_01_unarmed_F",
    "B_T_MRAP_01_F",
    "B_T_MRAP_01_hmg_F",
    "B_T_APC_Wheeled_01_cannon_F",
    "B_Heli_Transport_01_F",
    "B_Heli_Light_01_F",
    
	"ACE_ConcertinaWireCoil",
	"ACE_Wheel",
	"ACE_Track"
];

_configclass = [];

_configclass append ( "( (configName  _x) find 'Land_MetalCase_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_PlasticCase_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_CanisterFuel_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_CargoBox_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_Cargo10_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_Cargo20_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_Cargo40_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_Pallet' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_Barrel' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Land_PaperBox_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'B_Slingload_01_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'FlexibleTank_01_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'ACE_box_' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'ACE_med' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'Box_' ) == 0" configClasses (configFile >> "CfgVehicles") );

_configclass append ( "( (configName  _x) find 'CargoNet' ) > -1" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'supplyCrate' ) > -1" configClasses (configFile >> "CfgVehicles") );

{ _vehicle_loadable append [configName _x] } forEach _configclass;

[ _vehicle_loadable ] execVM "VVL\vehicle_in_vehicle_logistics_init.sqf";