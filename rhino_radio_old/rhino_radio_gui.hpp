class rhino_radio_gui
{
        idd =9999;
        movingEnabled = false;
        
        class controls
        {

/* #Jesahu
$[
	1.063,
	["rhino_radio_gui",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"rhino_radio_gui_backgroundborder",[1,"#(argb,8,8,3)color(0.1,0.3,0.1,1)",["0.293749 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.4125 * safezoneW","0.528 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"rhino_radio_gui_background",[1,"#(argb,8,8,3)color(0.2,0.4,0.2,1)",["0.298906 * safezoneW + safezoneX","0.258 * safezoneH + safezoneY","0.402187 * safezoneW","0.506 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1202,"rhino_radio_gui_numpad",[1,"#(argb,8,8,3)color(0.1,0.3,0.1,1)",["0.309219 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.113437 * safezoneW","0.231 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1203,"rhino_radio_gui_arrowpad",[1,"#(argb,8,8,3)color(0.1,0.3,0.1,1)",["0.309219 * safezoneW + safezoneX","0.555 * safezoneH + safezoneY","0.113437 * safezoneW","0.176 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1204,"rhino_radio_gui_screenborder",[1,"#(argb,8,8,3)color(0.1,0.3,0.1,1)",["0.432969 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.257813 * safezoneW","0.462 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1205,"rhino_radio_gui_screen",[1,"#(argb,8,8,3)color(0.1,0.1,0.1,1)",["0.438125 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.2475 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"rhino_radio_gui_up",[1,"Up",["0.345312 * safezoneW + safezoneX","0.566 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"rhino_radio_gui_down",[1,"Down",["0.345312 * safezoneW + safezoneX","0.676 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"rhino_radio_gui_cancel",[1,"Cancel",["0.314375 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"rhino_radio_gui_enter",[1,"Enter",["0.37625 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"rhino_radio_gui_0",[1,"0",["0.386562 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1605,"rhino_radio_gui_1",[1,"1",["0.314375 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1606,"rhino_radio_gui_2",[1,"2",["0.350469 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1607,"rhino_radio_gui_3",[1,"3",["0.386562 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1608,"rhino_radio_gui_4",[1,"4",["0.314375 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1609,"rhino_radio_gui_5",[1,"5",["0.350469 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1610,"rhino_radio_gui_6",[1,"6",["0.386562 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1611,"rhino_radio_gui_7",[1,"7",["0.314375 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1612,"rhino_radio_gui_8",[1,"8",["0.350469 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1613,"rhino_radio_gui_9",[1,"9",["0.386562 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1614,"rhino_radio_gui_on",[1,"Delete",["0.314375 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.0567187 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"rhino_radio_gui_outline_1",[1,"",["0.29375 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.4125 * safezoneW","0.528 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1801,"rhino_radio_gui_outline_2",[1,"",["0.298906 * safezoneW + safezoneX","0.258 * safezoneH + safezoneY","0.402187 * safezoneW","0.506 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1802,"rhino_radio_gui_outline_screen1",[1,"",["0.432969 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.257813 * safezoneW","0.462 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1803,"rhino_radio_gui_outline_screen",[1,"",["0.438125 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.2475 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1804,"rhino_radio_gui_outline_numpad",[1,"",["0.309219 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.113437 * safezoneW","0.231 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1805,"rhino_radio_gui_outline_arrowpad",[1,"",["0.309219 * safezoneW + safezoneX","0.555 * safezoneH + safezoneY","0.113437 * safezoneW","0.176 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1806,"rhino_radio_gui_outline_on",[1,"",["0.314375 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.0567187 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1807,"rhino_radio_gui_outline_0",[1,"",["0.386562 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1808,"rhino_radio_gui_outline_1",[1,"",["0.314375 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1809,"rhino_radio_gui_outline_2",[1,"",["0.350469 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1810,"rhino_radio_gui_outline_3",[1,"",["0.386562 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1811,"rhino_radio_gui_outline_4",[1,"",["0.314375 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1812,"rhino_radio_gui_outline_5",[1,"",["0.350469 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1813,"rhino_radio_gui_outline_6",[1,"",["0.386562 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1814,"rhino_radio_gui_outline_7",[1,"",["0.314375 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1815,"rhino_radio_gui_outline_8",[1,"",["0.350469 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1816,"rhino_radio_gui_outline_9",[1,"",["0.386562 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.0309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1817,"rhino_radio_gui_outline_up",[1,"",["0.345312 * safezoneW + safezoneX","0.566 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1818,"rhino_radio_gui_outline_cancel",[1,"",["0.314375 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1819,"rhino_radio_gui_outline_ok",[1,"",["0.37625 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1820,"rhino_radio_gui_outline_down",[1,"",["0.345312 * safezoneW + safezoneX","0.676 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1615,"rhino_radio_gui_request",[1,"Request",["0.438125 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0515625 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1616,"rhino_radio_gui_assets",[1,"Assets",["0.489687 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0721875 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1617,"rhino_radio_gui_type",[1,"Type",["0.561875 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0979687 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1618,"rhino_radio_gui_number",[1,"Num.",["0.659844 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"rhino_radio_gui_list_request",[1,"",["0.438125 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0515625 * safezoneW","0.352 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"rhino_radio_gui_list_asset",[1,"",["0.489687 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0721875 * safezoneW","0.352 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1502,"rhino_radio_gui_list_type",[1,"",["0.561875 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0979687 * safezoneW","0.352 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1503,"rhino_radio_gui_list_number",[1,"",["0.659844 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0257812 * safezoneW","0.352 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1619,"rhino_radio_gui_coordXtext",[1,"Coord X",["0.438125 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1620,"rhino_radio_gui_coordYtext",[1,"Coord Y",["0.520625 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"rhino_radio_gui_coordX",[1,"",["0.479375 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1401,"rhino_radio_gui_coordY",[1,"",["0.561875 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1206,"rhino_radio_gui_indicator",[1,"#(argb,8,8,3)color(1,1,0,1)",["0.618594 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.0515625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by |R| kiron, v1.063, #Jesahu)
////////////////////////////////////////////////////////

class rhino_radio_gui_backgroundborder: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0.1,0.3,0.1,1)";
	x = 0.293749 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.528 * safezoneH;
};
class rhino_radio_gui_background: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(0.2,0.4,0.2,1)";
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.506 * safezoneH;
};
class rhino_radio_gui_numpad: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(0.1,0.3,0.1,1)";
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.231 * safezoneH;
};
class rhino_radio_gui_arrowpad: RscPicture
{
	idc = 1203;
	text = "#(argb,8,8,3)color(0.1,0.3,0.1,1)";
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.176 * safezoneH;
};
class rhino_radio_gui_screenborder: RscPicture
{
	idc = 1204;
	text = "#(argb,8,8,3)color(0.1,0.3,0.1,1)";
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.257813 * safezoneW;
	h = 0.462 * safezoneH;
};
class rhino_radio_gui_screen: RscPicture
{
	idc = 1205;
	text = "#(argb,8,8,3)color(0.1,0.1,0.1,1)";
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.44 * safezoneH;
};
class rhino_radio_gui_up: RscButton
{
	idc = 1600;
	text = "Up"; //--- ToDo: Localize;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_down: RscButton
{
	idc = 1601;
	text = "Down"; //--- ToDo: Localize;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_cancel: RscButton
{
	idc = 1602;
	text = "Cancel"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_enter: RscButton
{
	idc = 1603;
	text = "Enter"; //--- ToDo: Localize;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_0: RscButton
{
	idc = 1604;
	text = "0"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_1: RscButton
{
	idc = 1605;
	text = "1"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_2: RscButton
{
	idc = 1606;
	text = "2"; //--- ToDo: Localize;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_3: RscButton
{
	idc = 1607;
	text = "3"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_4: RscButton
{
	idc = 1608;
	text = "4"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_5: RscButton
{
	idc = 1609;
	text = "5"; //--- ToDo: Localize;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_6: RscButton
{
	idc = 1610;
	text = "6"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_7: RscButton
{
	idc = 1611;
	text = "7"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_8: RscButton
{
	idc = 1612;
	text = "8"; //--- ToDo: Localize;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_9: RscButton
{
	idc = 1613;
	text = "9"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_on: RscButton
{
	idc = 1614;
	text = "Delete"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_1: RscFrame
{
	idc = 1800;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.528 * safezoneH;
};
class rhino_radio_gui_outline_2: RscFrame
{
	idc = 1801;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.506 * safezoneH;
};
class rhino_radio_gui_outline_screen1: RscFrame
{
	idc = 1802;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.257813 * safezoneW;
	h = 0.462 * safezoneH;
};
class rhino_radio_gui_outline_screen: RscFrame
{
	idc = 1803;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.44 * safezoneH;
};
class rhino_radio_gui_outline_numpad: RscFrame
{
	idc = 1804;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.231 * safezoneH;
};
class rhino_radio_gui_outline_arrowpad: RscFrame
{
	idc = 1805;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.176 * safezoneH;
};
class rhino_radio_gui_outline_on: RscFrame
{
	idc = 1806;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_0: RscFrame
{
	idc = 1807;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_3: RscFrame
{
	idc = 1810;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_4: RscFrame
{
	idc = 1811;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_5: RscFrame
{
	idc = 1812;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_6: RscFrame
{
	idc = 1813;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_7: RscFrame
{
	idc = 1814;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_8: RscFrame
{
	idc = 1815;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_9: RscFrame
{
	idc = 1816;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_up: RscFrame
{
	idc = 1817;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_cancel: RscFrame
{
	idc = 1818;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_ok: RscFrame
{
	idc = 1819;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_outline_down: RscFrame
{
	idc = 1820;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_request: RscButton
{
	idc = 1615;
	text = "Request"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_assets: RscButton
{
	idc = 1616;
	text = "Assets"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_type: RscButton
{
	idc = 1617;
	text = "Type"; //--- ToDo: Localize;
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_number: RscButton
{
	idc = 1618;
	text = "Num."; //--- ToDo: Localize;
	x = 0.659844 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_list_request: RscListbox
{
	idc = 1500;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.352 * safezoneH;
};
class rhino_radio_gui_list_asset: RscListbox
{
	idc = 1501;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.352 * safezoneH;
};
class rhino_radio_gui_list_type: RscListbox
{
	idc = 1502;
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.352 * safezoneH;
};
class rhino_radio_gui_list_number: RscListbox
{
	idc = 1503;
	x = 0.659844 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.352 * safezoneH;
};
class rhino_radio_gui_coordXtext: RscButton
{
	idc = 1619;
	text = "Coord X"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_coordYtext: RscButton
{
	idc = 1620;
	text = "Coord Y"; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_coordX: RscEdit
{
	idc = 1400;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_coordY: RscEdit
{
	idc = 1401;
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
};
class rhino_radio_gui_indicator: RscPicture
{
	idc = 1206;
	text = "#(argb,8,8,3)color(1,1,0,1)";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


//class rhino_radio_gui_map: RscMapControl
//{
//	idc = 1000;
//	x = safezoneX - 0.9 * safezoneH;
//	y = safezoneY - 0.9 * safezoneH;
//	w = 0.9 * safezoneH;
//	h = 0.9 * safezoneH;
//};

        }  
}