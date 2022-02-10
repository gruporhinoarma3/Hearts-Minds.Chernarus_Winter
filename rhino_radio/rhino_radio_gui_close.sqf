// script: rhino_radio_gui_close
// task: close the GUI if the player gets far from the radio holder
// author: |R|kiron
// date: 2021-03-21

params[ "_radioholder" ];

while { true } do {

	sleep 1;
	
	if (!dialog) exitWith {};

	if ( ( _radioholder distance player ) > 3 ) exitWith { closeDialog 0; };

};
