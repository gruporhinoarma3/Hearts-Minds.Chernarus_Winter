// script: rhino_radio_gui_button_functions
// author: |R|kiron
// date: 2021-09-15

// task: move the selected list item up
rhino_radio_gui_fn_up = 
{
    _controlID = rhino_radio_gui_active_list_control;
    _new_index = ( (lbCurSel _controlID) - 1) max 0;
    lbSetCurSel [ _controlID, _new_index ];
};

// task: move the selected list item down
rhino_radio_gui_fn_down = 
{
    _controlID = rhino_radio_gui_active_list_control;
    _new_index = ( (lbCurSel _controlID) + 1) min ( (lbSize _controlID) - 1 );
    lbSetCurSel [ _controlID, _new_index];
};

// task: goes back to the previous GUI selection
rhino_radio_gui_fn_cancel =
{
    if ( rhino_radio_gui_active_list_control > 1500 ) then                              // safety: there is no list before 1501
    {
        lbClear rhino_radio_gui_active_list_control;                                    // clear the list graphics
        rhino_radio_gui_active_list_control = rhino_radio_gui_active_list_control - 1;  // set the previous list as active list
    };
};

// task: confirm current GUI selection and go to next step
rhino_radio_gui_fn_enter =
{
    if (rhino_radio_gui_active_list_control < 1504) then                            // safety: there is no list beyond 1503
    {
        rr_coord_gui = [ parseNumber ctrlText 1400, parseNumber ctrlText 1401 ];    // save gui user input coords

        if ( lbCurSel( rhino_radio_gui_active_list_control ) < 0) exitWith {};      // no selection, do nothing

        // if active list is the last list call the support (no more selections to do)
        if (rhino_radio_gui_active_list_control == 1503) exitWith
        {
            [] execVM "rhino_radio\rhino_radio_gui_callsupport.sqf";                // call function to call the support
            ctrlSetText [1206, "#(argb,8,8,3)color(0,1,0,1)"];                      // change color to green
            sleep 1;                                                                // let the user see the color
            closeDialog 0;                                                          // close the GUI
        };

        rhino_radio_gui_active_list_control = rhino_radio_gui_active_list_control + 1;  // the active list is now the next list
        lbClear rhino_radio_gui_active_list_control;                                    // clear active list

        // depending on the previous selections create the new active list

        if (rhino_radio_gui_active_list_control == 1501) then                           // new active list is asset selection
        {
            rr_gui_selected_support = lbText [ 1500, lbCurSel ( 1500 )];                // get the previous selection (support type)
            
            if ( rr_gui_selected_support == "Update" ) then                                                         // if "Update"
            {
                rr_gui_asset_list = rhino_radio_assets; // select all assets
            }
            else                                                                                                              // if NOT "Update"
            {
                rr_gui_asset_list = rhino_radio_assets select {    (((_x#rrg_index_type) find rr_gui_selected_support)>-1)    // select assets that match support
                                                                && ( (_x#rrg_index_state) == rrg_state_available         ) }; // and that are available
            };
            
            { lbAdd [ rhino_radio_gui_active_list_control, _x#rrg_index_callsign ]
            } forEach rr_gui_asset_list;                                                // update asset list with callsign from rhino_radio_assets elements list
        };

        if (rhino_radio_gui_active_list_control == 1502) then
        {
            rr_gui_selected_assetID = ( rr_gui_asset_list # lbCurSel( rhino_radio_gui_active_list_control - 1 ) )#rrg_index_index;
            
            switch ( rr_gui_selected_support ) do
            {
                case "Transport"  :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ];
                    } forEach rhino_radio_transport_request;
                };
                case "Supply drop":
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ];
                    } forEach ( rhino_radio_gui_supply_para#0 );
                };
                case "CAS"        :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ];
                    } forEach rhino_radio_cas_type;
                };
                case "UAV recon"  :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ];
                    } forEach rhino_radio_uav_type;
                };
                case "Update"     :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ];
                    } forEach rrg_update;
                };
                case rrg_supportID_artillery:
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, (_x splitString "/")#0 ];
                    } forEach magazinesDetail( ( rhino_radio_assets # rr_gui_selected_assetID )# rrg_index_class );
                };
                case "Supplies"  :
                {
                    {
                        if ( rhino_radio_gui_supply_heli#2#_forEachIndex <= ((rhino_radio_assets#rr_gui_selected_assetID)#rrg_index_load) ) then
                        {
                            lbAdd [ rhino_radio_gui_active_list_control, _x ];
                        };
                    } forEach (rhino_radio_gui_supply_heli #0);
                };
                case rrg_supportID_cruisemisil:
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ];
                    } forEach rhino_radio_cruisemisil_type;
                };
            };
        };

        if (rhino_radio_gui_active_list_control == 1503) then
        {
            switch ( rr_gui_selected_support ) do
            {
                case "Transport"  :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach rhino_radio_flyheight;
                };
                case "Supply drop":
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach rhino_radio_flyheight;
                };
                case "CAS"        :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach rhino_radio_cas_height;
                };
                case "UAV recon"  :
                {
                    { lbAdd [ rhino_radio_gui_active_list_control, _x ]; } forEach rhino_radio_uav_height;
                };
                case "Update"     :
                {
                    lbAdd [ rhino_radio_gui_active_list_control, "1"];
                };
                case rrg_supportID_artillery:
                {
                    _piece = ( rhino_radio_assets # rr_gui_selected_assetID )# rrg_index_class;
                    if (((( magazinesAmmo _piece ) select lbCurSel( 1502 ) ) select 1)<1) exitWith
                    {
                        lbAdd [ rhino_radio_gui_active_list_control, "0" ];
                    };
                    for [{_i = 1}, {_i <= ((( magazinesAmmo _piece ) select lbCurSel( 1502 ) ) select 1)}, {_i = _i + 1}] do
                    {
                        lbAdd [ rhino_radio_gui_active_list_control, str _i ];
                    };
                };
                case "Supplies"   :
                {
                    _type = (rhino_radio_gui_supply_heli#0) find ( lbText[ 1502, lbCurSel ( 1502 ) ] );
                    _load = (rhino_radio_gui_supply_heli#2)#_type;
                    _heliload = (rhino_radio_assets#rr_gui_selected_assetID)#rrg_index_load;
                    _nload = floor(_heliload/_load);
                    for "_i" from 1 to _nload do
                    {
                        lbAdd [ rhino_radio_gui_active_list_control, str(_i) ];
                    };
                };
                case rrg_supportID_cruisemisil:
                {
                    lbAdd [ rhino_radio_gui_active_list_control, "1"];
                };
            };
        };

        lbSetCurSel [ rhino_radio_gui_active_list_control, 0]; // set default selected value as the list first value 
    };
};

// writes numbers into the x and y coordinates slot (0,1,2 ... 9)
rhino_radio_gui_fn_number =
{
    params["_number"];
    _xcoord = ctrlText 1400;
    _ycoord = ctrlText 1401;
    if ( count _xcoord < 5 ) exitWith { ctrlSetText [ 1400, (_xcoord + _number) ] };
    if ( count _ycoord < 5 ) exitWith { ctrlSetText [ 1401, (_ycoord + _number) ] };
};

// deletes one number from X and Y coordinates slot
//buttonSetAction [1614, "closeDialog 0;  execVM 'rhino_radio\rhino_radio_gui.sqf';"];
rhino_radio_gui_fn_delete =
{
    params["_number"];
    _xcoord = ctrlText 1400;
    _ycoord = ctrlText 1401;
    if ( count _ycoord > 0 ) exitWith { ctrlSetText [ 1401, ( _ycoord select [0, (count _ycoord)-1 ] ) ] };
    if ( count _xcoord > 0 ) exitWith { ctrlSetText [ 1400, ( _xcoord select [0, (count _xcoord)-1 ] ) ] };
};

// let user select position by click on the map already opened in the left side.
// writes selected position coordinates into X and Y coord slots
rhino_radio_gui_fn_map =
{
    onMapSingleClick
    {
        _marker = createMarker ["rhino_radio_user_map_click", _pos];
        onMapSingleClick "";
        true
    };                                                                  // create local marker on map clic
    waitUntil
    {
        _bool1 = getMarkerColor "rhino_radio_user_map_click" != "";
        _bool2 = isNull( findDisplay 9999 );
        _exit = _bool1 or _bool2;
        _exit
    };    // wait for local marker creation
    _posmapclick = getMarkerPos "rhino_radio_user_map_click";           // get positon of marker
    "rhino_radio_user_map_click" setMarkerShape "ICON";                 // make marker visible for player
    "rhino_radio_user_map_click" setMarkerType "hd_objective";
    "rhino_radio_user_map_click" setMarkerColor "ColorBlack";
    sleep 1;
    deleteMarker  "rhino_radio_user_map_click";                         // delete marker
    
    _xcoord = str(round( _posmapclick#0 ));                             // convert int to str
    _ycoord = str(round( _posmapclick#1 ));

    while {count _xcoord < 5} do { _xcoord = "0" + _xcoord };           // if needed add zeros to have 5 digits
    while {count _ycoord < 5} do { _ycoord = "0" + _ycoord };           // Ex: "1000" -> "01000"

    _displaycontrol = ( findDisplay 9999 ) displayCtrl 1400;            // update GUI
    _displaycontrol ctrlSetText _xcoord;

    _displaycontrol = ( findDisplay 9999 ) displayCtrl 1401;
    _displaycontrol ctrlSetText _ycoord;
};