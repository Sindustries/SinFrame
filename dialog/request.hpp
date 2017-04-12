

class SINGUImain
{
	idd = -1;
	movingenable = true;
//  onLoad = "_this call FRAME_01_Load";

class controls
{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sinbane, v1.063, #Rediqi)
////////////////////////////////////////////////////////

class sinbackground: IGUIBack
{
	idc = 2201;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.044 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.9};
};
class sinmainbg: IGUIBack
{
	idc = 2200;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.352 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.75};
};
class sinmainframe: RscFrame
{
	idc = 1800;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.352 * safezoneH;
};
class SINrequestframe: RscFrame
{
	idc = 1806;
	text = "REQUESTS"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.252656 * safezoneW;
	h = 0.253 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class SINrequestopframe: RscFrame
{
	idc = 1809;
	text = "SPEC OPS"; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.654 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.077 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class SINrequestvehicleframe: RscFrame
{
	idc = 1808;
	text = "VEHICLE"; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.077 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class SINrequestsoldierframe: RscFrame
{
	idc = 1807;
	text = "SOLDIER"; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.077 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class SINextrasFrame: RscFrame
{
	idc = 1805;
	text = "EXTRAS"; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.253 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinzonesframe: RscFrame
{
	idc = 1803;
	text = "ZONES"; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinFPframe: RscFrame
{
	idc = 1804;
	text = "FORCE POWER"; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinvehiccount: RscFrame
{
	idc = 1811;
	text = "VEHICLES"; //--- ToDo: Localize;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sintroopcount: RscFrame
{
	idc = 1813;
	text = "TROOPS"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinaicount: RscFrame
{
	idc = 1812;
	text = "TOTAL"; //--- ToDo: Localize;
	x = 0.649532 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinhelicount: RscFrame
{
	idc = 1801;
	text = "HELIS"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sincash: RscFrame
{
	idc = 1802;
	text = "MONEY"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinjetcount: RscFrame
{
	idc = 1810;
	text = "JETS"; //--- ToDo: Localize;
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.6 * GUI_GRID_H;
};
class sinassetstext: RscText
{
	idc = 1000;
	text = "ASSETS INTERFACE"; //--- ToDo: Localize;
	x = 0.464937 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
};
class sinmoneytext: RscText
{
	idc = 1001;
	text = "999999"; //--- ToDo: Localize;
	x = 0.316437 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Available Funds"; //--- ToDo: Localize;
};
class sinzonestext: RscText
{
	idc = 1002;
	text = "3/6"; //--- ToDo: Localize;
	x = 0.367999 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Number of Zones you occupy"; //--- ToDo: Localize;
};
class sinFPtext: RscText
{
	idc = 1003;
	text = "136"; //--- ToDo: Localize;
	x = 0.409249 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Total Friendly Side Power"; //--- ToDo: Localize;
};
class SINrequestsoldierbtn: RscButton
{
	idc = 1600;
	text = "PURCHASE"; //--- ToDo: Localize;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
	action = "_btn = [] execVM ""dialog\request_unit.sqf""";
};
class SINvehicButton: RscButton
{
	idc = 1601;
	text = "PURCHASE"; //--- ToDo: Localize;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
	action = "_btn = [] execVM ""dialog\request_vehicle.sqf""";
};
class SINspecopBtn: RscButton
{
	idc = 1602;
	text = "PURCHASE"; //--- ToDo: Localize;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
	action = "_btn = [] execVM ""dialog\specops\request_specop.sqf""";
};
class SINsupportstxt: RscText
{
	idc = 1005;
	text = "SUPPORTS"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Unlock Supports"; //--- ToDo: Localize;
};
class SINsupportsList: RscListbox
{
	idc = 1503;
	text = "HELLO TESTING"; //--- ToDo: Localize;
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.154 * safezoneH;
	sizeEx = 0.7 * GUI_GRID_H;
};
class SINsupportsBtn: RscButton
{
	idc = 1603;
	text = "PURCHASE"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
	action = "_btn = [] execVM ""dialog\request_support.sqf""";
};
class SINrecruitLocalBtn: RscButton
{
	idc = 1605;
	text = "RECRUIT LOCALS"; //--- ToDo: Localize;
	x = 0.592812 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Recruit Locals to increase force power"; //--- ToDo: Localize;
	action = "_btn = [] execVM ""dialog\SIN_recruitLocals.sqf""";
};
class SINcontractBtn: RscButton
{
	idc = 1604;
	text = "MERCENARY CONTRACT"; //--- ToDo: Localize;
	x = 0.592813 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Take on a side mission that may have beneficial rewards"; //--- ToDo: Localize;
	sizeEx = 0.8 * GUI_GRID_H;
	action = "_btn = [] execVM ""contract\SIN_getMission.sqf""";
};
class sinclosebutton: RscButton
{
	idc = 1606;
	text = "X"; //--- ToDo: Localize;
	x = 0.695937 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class SINsoldierList: RscCombo
{
	idc = 2100;
	x = 0.329844 * safezoneW + safezoneX;
	y = 0.5154 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	sizeEx = 0.7 * GUI_GRID_H;
};
class sinvehiclelist: RscCombo
{
	idc = 2101;
	x = 0.329844 * safezoneW + safezoneX;
	y = 0.5924 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	sizeEx = 0.7 * GUI_GRID_H;
};
class sinspecopslist: RscCombo
{
	idc = 2102;
	x = 0.329844 * safezoneW + safezoneX;
	y = 0.6694 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	sizeEx = 0.7 * GUI_GRID_H;
};
class sinsettingsbtn: RscButton
{
	idc = 1607;
	text = "SETTINGS"; //--- ToDo: Localize;
	x = 0.592812 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Change some settings"; //--- ToDo: Localize;
};
class sintroopstext: RscText
{
	idc = 1004;
	text = "123/125"; //--- ToDo: Localize;
	x = 0.481437 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Number of AI troops on your side"; //--- ToDo: Localize;
};
class sinvehictext: RscText
{
	idc = 1006;
	text = "16/30"; //--- ToDo: Localize;
	x = 0.527843 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Number of total AI vehicles"; //--- ToDo: Localize;
};
class sinhelitext: RscText
{
	idc = 1007;
	text = "6/8"; //--- ToDo: Localize;
	x = 0.569093 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Number of total AI helicopters"; //--- ToDo: Localize;
};
class sinjetstext: RscText
{
	idc = 1008;
	text = "2/2"; //--- ToDo: Localize;
	x = 0.610343 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Number of total ai jets"; //--- ToDo: Localize;
};
class sintotaltroopstext: RscText
{
	idc = 1009;
	text = "246/250"; //--- ToDo: Localize;
	x = 0.651593 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.022 * safezoneH;
	tooltip = "Number of total AI troops"; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};
