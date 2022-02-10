if (!isserver) ExitWith {};

clearMagazineCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearItemCargoGlobal _this;
clearBackpackCargoGlobal _this;

// mortar supplies

//_this addBackpackCargoGlobal ["B_Mortar_01_weapon_F",1];
//_this addBackpackCargoGlobal ["B_Mortar_01_support_F",1];

_this addWeaponCargoGlobal ["ace_csw_staticMortarCarry",1];
_this addWeaponCargoGlobal ["ace_csw_carryMortarBaseplate",1];

_this addBackpackCargoGlobal ["B_Carryall_green_F",4];
_this addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE",32];

_this addBackpackCargoGlobal ["B_Carryall_green_F",3];
_this addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke",8];
_this addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Illum",10];
_this addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE_LaserGuided",3];

_this addItemCargoGlobal ["ItemMap",1];
_this addItemCargoGlobal ["ItemCompass",1];
_this addItemCargoGlobal ["ACE_MapTools",1];
_this addItemCargoGlobal ["ACE_artilleryTable",2];