params[ "_box", "_type" ];

clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_boxmags = magazinesAmmoCargo _type;
_boxweapons = weaponsItemsCargo _type;
_boxitems = getItemCargo _type;
_boxbags = getBackpackCargo _type;

{ _box addMagazineCargoGlobal [ _x select 0, 1 ]; } forEach _boxmags;
{ _box addWeaponCargoGlobal [ _x select 0, 1 ]; } forEach _boxweapons;

_boxitemsclass = _boxitems select 0;
_boxitemscount = _boxitems select 1;

_boxbagsclass = _boxbags select 0;
_boxbagscount = _boxbags select 1;

{ _box addItemCargoGlobal [ _x , _boxitemscount select _forEachIndex ]; } forEach _boxitemsclass;
{ _box addBackpackCargoGlobal [ _x , _boxbagscount select _forEachIndex ]; } forEach _boxbagsclass;