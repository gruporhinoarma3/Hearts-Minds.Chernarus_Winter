// script: rhino_radio_fn_check_deserted.sqf
// author: |R|Kiron
// date: 2020-11-01
//
// if deserted aircraft, the script will end
//
// HOW TO USE:
// _handle_check_deserted = [_aircraft] spawn rhino_radio_fn_check_deserted;	// if deserted aircraft, dismiss
// waitUntil { scriptDone _handle_check_deserted };

params[ "_aircraft" ];
	
_crew = crew _aircraft;
_unit = group (_crew select 0);

// loop check
_exit = false;
_count = 0;
while { !_exit } do {

    // delay
    sleep 60;
    
    // end loop if crew is dead
    if ( !alive (_crew select 0) ) then { _exit = true };
    
    // if aircraft is stopped, with no player onboard and no players nearby, count
    _vel = velocity _aircraft;
    if ( ( count ( allPlayers select { (_x distance _aircraft) < rhino_radio_heli_deserted_distance } ) < 1 )
    && ( count ( allPlayers select {_x in (crew _aircraft) } ) < 1 )
    && ( (abs (_vel select 0) + abs (_vel select 1) + abs (_vel select 2)) < 5 ) ) 
    then { _count = _count + 1;}
    else { _count = 0;};

    // if count to much exit
    if ( _count > rhino_radio_heli_wait_time ) then { _exit = true; };
};