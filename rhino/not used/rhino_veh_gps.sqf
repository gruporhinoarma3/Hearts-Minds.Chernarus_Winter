// script: rhino_veh_gps.sqf
// task: show in map the position of vehicles with a specific classname
// author: |R|Kiron
// date: 2020-05-01
// implementation: this addAction["<t color='#00FFFF'>Localizar vehículos via GPS</t>", "RHINO\rhino_veh_gps.sqf"];

_vehclass = [
"B_Heli_Transport_03_F",
"B_Heli_Transport_01_F",
"B_Heli_Light_01_F",
"B_Heli_Light_01_dynamicLoadout_F",
"B_CTRG_Heli_Transport_01_tropic_F",
"B_Heli_Attack_01_dynamicLoadout_F",
"B_Plane_CAS_01_dynamicLoadout_F",
"B_Plane_Fighter_01_F",
"B_T_Truck_01_Repair_F",
"B_T_Truck_01_fuel_F",
"B_T_Truck_01_ammo_F",
"B_T_MRAP_01_F",
"B_T_MRAP_01_hmg_F",
"B_T_LSV_01_unarmed_F",
"B_T_APC_Wheeled_01_cannon_F",
"B_T_Truck_01_medical_F",
"B_T_Truck_01_flatbed_F",
"RHS_CH_47F",
"RHS_UH60M_MEV2",
"RHS_UH60M_ESSS",
"RHS_MELB_MH6M",
"RHS_MELB_AH6M",
"RHS_AH64D_wd",
"RHS_A10",
"RHS_C130J",
"rhsusf_m998_w_4dr",
"rhsusf_m1043_w_m2",
"rhsusf_m1240a1_m2_usarmy_wd",
"rhsusf_m1245_m2crows_socom_d",
"rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy",
"rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",
"rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",
"rhsusf_stryker_m1126_m2_wd",
"rhssaf_army_pts",
"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd",
"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",
"rhsusf_M978A4_BKIT_usarmy_wd",
"RHS_AH1Z_wd",
"RHS_UH1Y",
"rhs_uh1h_hidf",
"rhsusf_m998_w_s_4dr",
"rhsusf_m1043_w_s_m2",
"rhsusf_m1240a1_m2crows_usmc_wd",
"rhsusf_m1240a1_m2_usmc_wd",
"rhsusf_M1232_MC_M2_usmc_wd",
"rhsusf_CH53E_USMC_GAU21",
"rhsusf_mkvsoc"
];

_configclass = [];
_configclass append ( "( (configName  _x) find 'ffaa_et' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'ffaa_ea' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'ffaa_famet' ) == 0" configClasses (configFile >> "CfgVehicles") );
_configclass append ( "( (configName  _x) find 'ffaa_nh90' ) == 0" configClasses (configFile >> "CfgVehicles") );
{ _vehclass append [configName _x] } forEach _configclass;

player sideChat "Localizando señal GPS de vehiculos....";
player sideChat "Espere...";
sleep 5;

_counter = 0;
{
	_veh = nearestObjects [player, [_x], 20000];
	_name = _x;
	
	{
		_markername = "rhino_gps_marker_";
		_counter = _counter +1;

		_marker01 = createMarker [ _markername + str (_counter) , position _x ];
		_marker01 setmarkercolor "colorblue";
		_marker01 setMarkersize [1,1];
		_marker01 setMarkerType "mil_dot";
		_marker01 setMarkerText _name;

	} foreach _veh;
	
} foreach _vehclass;

player sideChat "Señal localizada.";
sleep 60;
player sideChat "Perdiendo señal...";
sleep 5;

{
	private "_a";
	_a = toArray _x;
	_a resize 17;
	if (toString _a == "rhino_gps_marker_") then { deleteMarker _x; };
  
} forEach allMapMarkers;

player sideChat "Señal perdida.";