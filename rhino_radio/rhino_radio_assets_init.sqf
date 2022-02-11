// script: rhino_radio_artillery_assets_init
// task1:	initializes the list of available assets
// author: |R|kiron
// date: 2021-09-14

if ( isServer ) then
{
    rhino_radio_assets = rhino_radio_assets_list;                   // read the list defined in rhino_radio_params

    {
        _x append [ _forEachIndex, rrg_state_available, objNull ];  // asset id, available indicator, object varname (handle)
        
        // if varname is given instead of classname, put it in the object varname (handle) slot
        if (!( typeName(_x#rrg_index_class)  == "STRING" )) then
        {
            _x set [ rrg_index_handle, _x#rrg_index_class ]
        };
        
        rhino_radio_assets set[ _forEachIndex, _x ];
    }
    forEach rhino_radio_assets;                                   // to each asset add its states and properties 

    publicVariable "rhino_radio_assets";
};