ace_hearing_disableVolumeUpdate = false;
if (!(isNil "MyLoadout"))	then { player setUnitLoadout MyLoadout; }
									else { MyLoadout = getUnitLoadout player; };