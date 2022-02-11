// script: rhino_radio_params
// task: define the supports, the items to use the supports, and the parameters of the supports
// author: |R|kiron
// date: 2020-12-22

// ________________________________________
// items the player has to have equiped to be allowed to use rhino_radio system

rhino_radio_backpacks = [
	"tf_rt1523g",
	"tf_rt1523g_big",
	"tf_rt1523g_big_bwmod",
	"tf_rt1523g_big_bwmod_tropen",
	"tf_rt1523g_big_rhs",
	"tf_rt1523g_bwmod",
	"tf_rt1523g_rhs",
	"tf_rt1523g_black",
	"tf_rt1523g_green",
	"tf_rt1523g_sage",
	"TFAR_rt1523g",
	"TFAR_rt1523g_rhs",
	"TFAR_rt1523g_bwmod",
	"TFAR_rt1523g_big",
	"TFAR_rt1523g_big_rhs",
	"TFAR_rt1523g_big_bwmod",
	"TFAR_rt1523g_big_bwmod_tropen",
	"tTFAR_rt1523g_black",
	"TFAR_rt1523g_green",
	"TFAR_rt1523g_sage",
	"B_RadioBag_01_mtp_F",
	"B_RadioBag_01_wdl_F",
	"B_RadioBag_01_tropic_F",
	"B_RadioBag_01_oucamo_F",
	"B_RadioBag_01_eaf_F",
	"B_RadioBag_01_ghex_F",
	"B_RadioBag_01_hex_F"];

// ________________________________________
// vehicles the player has to be in to be allowed to use rhino_radio system
rhino_radio_vehicles = [
	"RHS_CH_47F",
	"RHS_CH_47F_light",
	"rhsusf_CH53E_USMC_GAU21_D",
	"RHS_MELB_MH6M",
	"RHS_UH60M_d",
	"RHS_UH60M_ESSS_d",
	"B_Truck_01_fuel_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_flatbed_F",
	"B_Truck_01_Repair_F",
	"B_Truck_01_ammo_F",
	"rhsusf_m1165a1_gmv_m134d_m240_socom_d",
	"rhsusf_m1165a1_gmv_m2_m240_socom_d",
	"rhsusf_m1165a1_gmv_mk19_m240_socom_d",
	"rhsusf_m1245_m2crows_socom_d",
	"rhsusf_M1237_M2_usarmy_d",
	"rhsusf_m1151_m2_v2_usarmy_d",
	"rhsusf_m1151_m240_v2_usarmy_d",
	"rhsusf_m1240a1_m240_uik_usarmy_d",
	"rhsusf_m1240a1_m2_uik_usarmy_d",
	"rhsusf_M1232_M2_usarmy_d",
	"rhsusf_stryker_m1132_m2_d"];
	
// ________________________________________
// vehicles (objects) that have an action to use rhino_radio system
rhino_radio_objects = [
	rhino_radio_base_antena];
	
// ________________________________________
// classnames that have an action to use rhino_radio system
rhino_radio_classes = [
	"Land_TripodScreen_01_dual_v1_black_F","Land_MultiScreenComputer_01_black_F","Land_SatellitePhone_F","Item_SatPhone","Flag_NATO_F","Land_PowerGenerator_F"
	];
	
// ________________________________________
//           assets available to players
// (must use one ore more of these supports types: "Transport", "Supplies", "Supply drop", "UAV recon", "Artillery", "CAS")
// artillery assets must be varname, rest of assets must be classname

//											asset classname (varname for artillery)		support provided			callsign,				time to be available again after RTB, cargo capacity
rhino_radio_assets_list = [	[ "RHS_UH60M_MEV2"					, ["Transport","Supplies"]	,"VALKYRIE (UH60)"		, 600		, 2	],
										[ "RHS_UH60M_d"						, ["Transport","Supplies"]	,"GOOSE (UH60)"		, 600		, 2	],
										[ "RHS_CH_47F_light"					, ["Transport","Supplies"]	,"MULE (CH47)"			, 1200	, 8	],
										[ "rhsusf_CH53E_USMC_GAU21_D"	, ["Transport","Supplies"]	,"BULL (CH53)"			, 1200	, 8	],
										[ "RHS_C130J_Cargo"					, ["Supply drop"]				,"SANTA (C130)"			, 1200	, 10	],
										[ "B_UAV_02_dynamicLoadout_F"	, ["UAV recon"]				,"PEEPER (R3)"			, 1200	, 0	],
										[ "RHS_A10"								, ["CAS"]						,"BRRT (A10)"				, 600		, 0	],
										[ "RHS_MELB_AH6M"					, ["CAS"]						,"VIPER (AH6M)"			, 600		, 0	],
										[ "RHS_AH64D"							, ["CAS"]						,"TIGER (AH64)"			, 600		, 0	],
										[ rhino_art_1								, ["Artillery"]					,"HAMMER (155mm)"	, 6		, 0	],
										[ rhino_art_2								, ["Artillery"]					,"ROLLER (227mm)"		, 6		, 0	] ];

// ________________________________________
//           supplies available

rhino_radio_gui_supply_heli = [
	[	"Caja de base",
		"Pallet de base 1",
		"Pallet de base 2",
		"Pallet de base 3",
		"3 Pallets de base",
		"Ammo+HE-AT+82mm",
		"mrzr4 + 2 pallet",
		"mrzr4 + US",
		"2x mrzr4"],
	[	[rhino_radio_supplies_box_4],
		[rhino_radio_supplies_box_1],
		[rhino_radio_supplies_box_2],
		[rhino_radio_supplies_box_3],
		[ rhino_radio_supplies_box_1, rhino_radio_supplies_box_2, rhino_radio_supplies_box_3, rhino_radio_supplies_box_4 ],
		[ "rhino_radio\rhino_radio_supplies_box_ammoRHSUS.sqf", "rhino_radio\rhino_radio_supplies_box_HEAT.sqf", "rhino_radio\rhino_radio_supplies_box_mortero82mm.sqf", "rhino_radio\rhino_radio_supplies_box_equipo5RHSUS.sqf"],
		[ "rhsusf_mrzr4_d", rhino_radio_supplies_box_1, rhino_radio_supplies_box_2 ],
		[ "rhsusf_mrzr4_d", "rhino_radio\rhino_radio_supplies_box_ammoRHSUS.sqf", "rhino_radio\rhino_radio_supplies_box_equipo5RHSUS.sqf" ],
		[ "rhsusf_mrzr4_d", "rhsusf_mrzr4_d" ] ],
	[1,2,2,2,7,8,8,8,8]
];

rhino_radio_gui_supply_para =   [
    [   "m998,Ammo,HEAT,82mm",
        "m998, 3 pallets de base",
        "2 m998, STANAG",
        "2 m998, 1 pallet de base"],
    [   ["rhsusf_m998_d_4dr", "rhino_radio\rhino_radio_supplies_box_ammoRHSUS.sqf", "rhino_radio\rhino_radio_supplies_box_HEAT.sqf", "rhino_radio\rhino_radio_supplies_box_mortero82mm.sqf"],
        ["rhsusf_m998_d_4dr", rhino_radio_supplies_box_1, rhino_radio_supplies_box_2, rhino_radio_supplies_box_3],
        ["rhsusf_m998_d_4dr", "rhsusf_m998_d_4dr", "rhino_radio\rhino_radio_supplies_box_ammoRHSUS.sqf"],
        ["rhsusf_m998_d_4dr", "rhsusf_m998_d_4dr", rhino_radio_supplies_box_1] ]
];

// ________________________________________
//           deployable personal antena parameters

rhino_radio_antena_personal = "OmniDirectionalAntenna_01_black_F"; //"SatelliteAntenna_01_Small_Black_F";
rhino_radio_tf_receivingDistanceMultiplicator = 0.2;
rhino_radio_tf_sendingDistanceMultiplicator = 5;

// ________________________________________
//           base antena parameters

// vehichle with varname: rhino_radio_base_antena
rhino_radio_antena_base_class = ["Land_TripodScreen_01_dual_v1_black_F","Land_MultiScreenComputer_01_black_F"];//;OmniDirectionalAntenna_01_black_F,Land_PowerGenerator_F
rhino_radio_base_tf_receivingDistanceMultiplicator = 0.1;
rhino_radio_base_tf_sendingDistanceMultiplicator = 10;

// ________________________________________
//           support heli parameters

rhino_radio_heli_wait_time = 5; // minutes
rhino_radio_heli_deserted_distance = 50; // meters
rhinoradio_altitude = [3,10,50,100,200,500];

// ________________________________________
//           support options

rhino_radio_flyheight = [ "100", "10", "25", "50", "75", "200", "500" ]; // meters
rhino_radio_cas_type = ["SAD"];
rhino_radio_transport_request = [ rr_str_landatcoords#rr_str_index, rr_str_coordsengineoff#rr_str_index, rr_str_hoveratcoords#rr_str_index ];
rrg_update = ["Position","RTB"];

// ________________________________________
//           default coords
rr_coord_gui = [ round ((getPos player) select 0) - rr_xcoord_mod, round ((getPos player) select 1) + 200 - rr_ycoord_mod ];
rr_coord_cancel = [ 0 - rr_xcoord_mod, 0 - rr_ycoord_mod, 0 ];

// ________________________________________
//           sounds

rhino_radio_sound_transport_confirm	= "mp_groundsupport_01_transportrequested_BHQ_0";
rhino_radio_sound_transport_cancel	= "mp_groundsupport_40_transportaborted_BHQ_1";
rhino_radio_sound_cas_confirm			= "mp_groundsupport_01_casrequested_BHQ_0";
rhino_radio_sound_cas_cancel			= "mp_groundsupport_05_casaborted_BHQ_0";
rhino_radio_sound_supply_confirm		= "mp_groundsupport_01_slingloadrequested_BHQ_0";
rhino_radio_sound_supply_cancel		= "mp_groundsupport_05_slingloadaborted_BHQ_0";

// ________________________________________
//           notes
/* 
- some vehicle classnames -
NOMODS
BLU
"B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_03_F", "B_Heli_Transport_03_unarmed_F"
"B_Heli_Light_01_dynamicLoadout_F"; "B_Heli_Attack_01_dynamicLoadout_F"; "B_Plane_CAS_01_dynamicLoadout_F"; "B_Plane_Fighter_01_F"; "B_Plane_Fighter_01_Stealth_F"; "B_T_VTOL_01_armed_F"

MODS
TRANSPORT: "RHS_UH60M"; "RHS_UH60M_MEV2"; "RHS_CH_47F"; "ffaa_famet_cougar_armed"; "ffaa_nh90_tth_transport";
SUPPLY: "RHS_CH_47F"; "RHS_C130J_Cargo"; "ffaa_famet_ch47_mg"; "ffaa_ea_hercules_cargo";
CAS: "RHS_A10"
*/