if (!isserver) ExitWith {};

clearMagazineCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearItemCargoGlobal _this;
clearBackpackCargoGlobal _this;

// rhino standard weapons supplies for 5 members
_this addWeaponCargoGlobal ["rhs_weap_M136_hedp",2];
_this addWeaponCargoGlobal ["rhs_weap_maaws",1];
_this addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle",2];
_this addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle_m203",1];
_this addWeaponCargoGlobal ["rhs_weap_m249_pip_L_para",1];
_this addWeaponCargoGlobal ["rhs_weap_m14ebrri",1];

// rhino standard radio supplies for 5 members
_this addItemCargoGlobal ["tf_anprc152_125",5];

// rhino standard equipment supplies for 5 members
_this addItemCargoGlobal ["rhsusf_ANPVS_15",5];
_this addItemCargoGlobal ["ACE_HuntIR_monitor",1];
_this addItemCargoGlobal ["Laserdesignator",1];
_this addItemCargoGlobal ["ACE_CableTie",10];
_this addItemCargoGlobal ["ACE_EntrenchingTool",5];
_this addItemCargoGlobal ["rhsusf_acc_mrds",4];
_this addItemCargoGlobal ["rhsusf_acc_premier_mrds",1];
_this addItemCargoGlobal ["ACE_RangeCard",1];

// rhino standard medical supplies for 5 members
_this addItemCargoGlobal ["ACE_packingBandage",50];
_this addItemCargoGlobal ["ACE_elasticBandage",20];
_this addItemCargoGlobal ["ACE_fieldDressing",10];
_this addItemCargoGlobal ["ACE_quikclot",20];
_this addItemCargoGlobal ["ACE_tourniquet",10];
_this addItemCargoGlobal ["ACE_splint",10];
_this addItemCargoGlobal ["ACE_salineIV_500",5];
_this addItemCargoGlobal ["ACE_morphine",5];
_this addItemCargoGlobal ["ACE_epinephrine",10];
_this addItemCargoGlobal ["ACE_adenosine",5];
_this addItemCargoGlobal ["ACE_bodyBag",5];
_this addItemCargoGlobal ["ACE_EarPlugs",5];

// rhino standard ammo for 5 members
_this addMagazineCargoGlobal ["Laserbatteries",1];
_this addMagazineCargoGlobal ["rhs_mag_maaws_HEAT",2];
_this addMagazineCargoGlobal ["rhs_mag_maaws_HE",4];
_this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",6];
_this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_PMAG",24];
_this addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_mixed_soft_pouch",5];
_this addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag",10];
_this addMagazineCargoGlobal ["rhs_mag_M441_HE",12];
_this addMagazineCargoGlobal ["rhs_mag_m713_Red",3];
_this addMagazineCargoGlobal ["rhs_mag_M585_white",12];
_this addMagazineCargoGlobal ["ACE_HuntIR_M203",2];
_this addMagazineCargoGlobal ["rhs_mag_m67",5];
_this addMagazineCargoGlobal ["rhs_mag_m18_yellow",10];
_this addMagazineCargoGlobal ["rhs_mag_m18_red",1];
_this addMagazineCargoGlobal ["rhs_mag_m18_green",1];
_this addItemCargoGlobal ["ACE_Chemlight_HiWhite",20];

// additional
_this addBackpackCargoGlobal ["B_Carryall_green_F",4];

//radio_this addBackpackCargoGlobal ["tf_rt1523g_big_bwmod",1];

//medic
_this addItemCargoGlobal ["ACE_surgicalKit",1];
_this addItemCargoGlobal ["ACE_elasticBandage",40];
_this addItemCargoGlobal ["ACE_quikclot",10];
_this addItemCargoGlobal ["ACE_fieldDressing",10];
_this addItemCargoGlobal ["ACE_tourniquet",10];
_this addItemCargoGlobal ["ACE_splint",10];
_this addItemCargoGlobal ["ACE_salineIV_500",4];
_this addItemCargoGlobal ["ACE_salineIV",6];
_this addItemCargoGlobal ["ACE_morphine",10];
_this addItemCargoGlobal ["ACE_epinephrine",20];
_this addItemCargoGlobal ["ACE_adenosine",10];
_this addItemCargoGlobal ["ACE_personalAidKit",5];

// Enginneer
_this addItemCargoGlobal ["ACE_VMH3",1];
_this addItemCargoGlobal ["ACE_DefusalKit",1];
_this addItemCargoGlobal ["ACE_wirecutter",1];
_this addItemCargoGlobal ["ACE_M26_Clacker",1];
_this addItemCargoGlobal ["rhsusf_m112_mag",4];