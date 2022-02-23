// BIS ARSENAL
["Preload"] call BIS_fnc_arsenal;

// task force radio
tf_no_auto_long_range_radio = true;
tf_same_lr_frequencies_for_side = true;
publicVariable "tf_same_lr_frequencies_for_side";

// RHINO
_null = execVM "rhino\rhino_teamspeak.sqf";
_null = execVM "rhino\rhino_slot.sqf";
_null = execVM "rhino\rhino_member_whitelist.sqf";
//_null = execVM "rhino\rhino_veh_despliegue.sqf";
/*
if (isServer) then {
_null = execVM "rhino\rhino_noches_cortas.sqf";
};
*/

if (hasInterface) then
{
    _null = execVM "rhino\rhino_arsenal_save.sqf";
    _null = execVM "rhino\rhino_compas.sqf";
    _null = execVM "rhino\rhino_carrierTP.sqf";
    _null = execVM "rhino\rhino_briefing.sqf";
    _null = execVM "rhino\rhino_hospital_3.sqf";
    _null = execVM "rhino\rhino_skiptime.sqf";
    _null = execVM "rhino\rhino_lanzar_mochilas.sqf";
    _null = execVM "rhino\rhino_veh_acceso.sqf";
    
    // RHINO ACE arsenal forced equipation
    ["ItemMap"    , "equipado"] execVM "rhino\rhino_arsenal_ACE_assign_item.sqf";
    ["ItemCompass", "equipado"] execVM "rhino\rhino_arsenal_ACE_assign_item.sqf";
    ["tf_anprc152", "equipado"] execVM "rhino\rhino_arsenal_ACE_assign_item.sqf";
    ["ChemicalDetector_01_watch_F", "equipado"] execVM "rhino\rhino_arsenal_ACE_assign_item.sqf";

    // RHINO ACE arsenal add to object and blacklist it
    _rhino_arsenal_object = [ "B_CargoNet_01_ammo_F" ];//B_supplyCrate_F
    _rhino_arsenal_list = [
    "SAS_Enhanced_Combat_Uniform_Win","SAS_PlateCarrier3_W","SAS_Combat_SpecHelmet_W2","SAS_AssaultPack_Win","SAS_Carryall_Win","SAS_Kitbag_WIN",
    "ItemMap","ItemGPS","ItemCompass","ACE_Altimeter","ItemWatch","B_UavTerminal","ChemicalDetector_01_watch_F","tf_anprc152","tf_microdagr",
    "rhsusf_ANPVS_15","SAS_NVG_Win","Binocular","Laserdesignator_01_khk_F","Laserbatteries","ACE_Vector","rhsusf_bino_m24",
    "ACE_WaterBottle","ACE_MRE_MeatballsPasta","ACE_Can_RedGull","ACE_EarPlugs","ACE_CableTie","ACE_microDAGR",
    "ACE_quikclot","ACE_packingBandage","ACE_elasticBandage","ACE_fieldDressing","ACE_tourniquet","ACE_splint","ACE_surgicalKit","ACE_epinephrine","ACE_morphine","ACE_adenosine","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250",
    
    "rhs_weap_hk416d145","rhs_weap_M320","rhs_weap_m249_pip_S","rhs_weap_l1a1","rhs_weap_m14_rail","rhsusf_acc_anpeq15side_bk","rhsusf_acc_eotech_xps3",
    "rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_200Rnd_556x45_mixed_soft_pouch","rhs_mag_20Rnd_762x51_m80a1_fnfal","rhsusf_20Rnd_762x51_m993_Mag",
    "rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m576","rhs_mag_m4009","rhs_mag_M583A1_white","rhs_mag_m661_green","rhs_mag_m662_red",
    "rhs_mag_M585_white_cluster","rhs_mag_M663_green_cluster","rhs_mag_M664_red_cluster","rhs_mag_m713_Red","rhs_mag_m714_White","rhs_mag_m715_Green","rhs_mag_m716_yellow","rhs_mag_M585_white",
    "hgun_esd_01_F","muzzle_antenna_01_f","muzzle_antenna_02_f","muzzle_antenna_03_f",
    
    "launch_NLAW_F","rhs_weap_M136_hp","rhs_weap_fgm148","rhs_fgm148_magazine_AT","rhs_weap_fim92","rhs_fim92_mag",
    "launch_MRAWS_green_F","MRAWS_HEAT_F","MRAWS_HE_F","MRAWS_HEAT55_F","rhs_weap_maaws","rhs_optic_maaws","rhs_mag_maaws_HEAT","rhs_mag_maaws_HEDP","rhs_mag_maaws_HE",
    
    "HandGrenade","MiniGrenade","B_IR_Grenade","rhs_mag_an_m14_th3","rhs_mag_mk84","rhs_mag_m67","rhs_mag_m18_green","rhs_mag_m18_red","rhs_mag_m18_yellow","rhs_mag_m18_purple",
    "ACE_Chemlight_HiYellow","ACE_Chemlight_HiGreen","ACE_Chemlight_HiBlue","ACE_Chemlight_HiRed","ACE_Chemlight_IR","ACE_HandFlare_Yellow","ACE_HandFlare_Red","ACE_HandFlare_Green","ACE_HandFlare_White",
    
    "ACE_artilleryTable","ACE_RangeTable_82mm","ace_csw_carryMortarBaseplate","ace_csw_staticMortarCarry","ace_compat_rhs_usf3_m252_carry",
    "ACE_1Rnd_82mm_Mo_HE_Guided","ACE_1Rnd_82mm_Mo_HE","ACE_1Rnd_82mm_Mo_Illum","ACE_1Rnd_82mm_Mo_HE_LaserGuided""ACE_1Rnd_82mm_Mo_Smoke",
    "ace_compat_rhs_usf3_tow_carry","ace_csw_m220CarryTripod","ace_compat_rhs_usf3_mag_TOW2b_aero","ace_compat_rhs_usf3_mag_TOW2b","ace_compat_rhs_usf3_mag_TOW2A","ace_compat_rhs_usf3_mag_TOW2bb",

    "DemoCharge_Remote_Mag","ATMine_Range_Mag","rhsusf_m112_mag","rhsusf_m112x4_mag","rhs_mine_M3_tripwire_mag",
    "ACE_EntrenchingTool","ACE_wirecutter","ACE_VMH3","ACE_DefusalKit","ToolKit","ACE_UAVBattery"
    /*
    "ItemRadio","FirstAidKit","Medikit","MineDetector","MiniGrenade","HandGrenade","O_R_IR_Grenade","I_E_IR_Grenade","O_IR_Grenade","I_IR_Grenade","I_UavTerminal","C_UavTerminal","O_UavTerminal","I_E_UavTerminal",
    "Laserdesignator_02_ghex_F","Laserdesignator_02","Laserdesignator_01_khk_F","Laserdesignator_03","Laserdesignator","Rangefinder",
    "ACE_Cellphone","ACE_Clacker","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_rope27","ACE_rope18","ACE_rope15","ACE_MX2A","ACE_VectorDay","ACE_NonSteerableParachute",
    "tf_anprc148jem","tf_anprc154","tf_fadak","tf_pnr1000a","tf_anarc164","tf_anarc210","tf_anprc155","tf_anprc155_coyote","tf_bussole",
    "tf_mr3000","tf_mr3000_bwmod","tf_mr3000_bwmod_tropen","tf_mr3000_multicam","tf_mr3000_rhs","tf_mr6000l",
    "tf_rt1523g_black","tf_rt1523g_fabric","tf_rt1523g_green","tf_rt1523g_sage","tf_rt1523g_bwmod","tf_rt1523g_big_bwmod",
    */
    ];
    [ _rhino_arsenal_object, _rhino_arsenal_list, false ] execVM "rhino\rhino_arsenal_ACE_add_filtered.sqf";//classname that is arsenal, items, true = remove items / false = add items
};

/* test
// EH to modify ia skill when hit
rhino_ia_skill_hit =
{
    params ["_unit", "_causedBy", "_damage", "_instigator"];
    
    _unit setSkill [ "general", 0];

    _unit setSkill [ "aimingAccuracy", 0.3];
    _unit setSkill [ "aimingShake", 0];
    _unit setSkill [ "aimingSpeed", 0];

    _unit setSkill [ "spotDistance", 0];
    _unit setSkill [ "spotTime", 0];

    _unit setSkill [ "commanding", 0];
    _unit setSkill [ "courage", 0];

    _unit setSkill [ "reloadSpeed", 0];
    _unit setSkill [ "endurance", 0];
    
    "EH active" remoteExec["hint",0];
};
rhino_ia_skill_hit_addeh =
{
    params [ "_unit" ];
    _unit addMPEventHandler ["MPHit", rhino_ia_skill_hit ];
};
[ "Man", "init", rhino_ia_skill_hit_addeh, true, [], true] call CBA_fnc_addClassEventHandler;

rhino_ia_skill =
{
    params [ "_unit" ];
    
    _unit setSkill [ "general", 0];

    _unit setSkill [ "aimingAccuracy", 0.7];
    _unit setSkill [ "aimingShake", 0.4];
    _unit setSkill [ "aimingSpeed", 0];

    _unit setSkill [ "spotDistance", 1];
    _unit setSkill [ "spotTime", 1];

    _unit setSkill [ "commanding", 0];
    _unit setSkill [ "courage", 0];

    _unit setSkill [ "reloadSpeed", 0];
    _unit setSkill [ "endurance", 0];
    
    "EH active" remoteExec["hint",0];
};
[ "Man", "init", rhino_ia_skill, true, [], true] call CBA_fnc_addClassEventHandler;


_unit addMPEventHandler ["MPHit",
{
    params ["_unit", "_causedBy", "_damage", "_instigator"];
}];

this addEventHandler ["Hit",
{
    params ["_unit", "_source", "_damage", "_instigator"];
}];

this addEventHandler ["Dammaged",
{
    params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
}];


*/