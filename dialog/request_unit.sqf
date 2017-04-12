/*
	REQUESTS MENU :: Get correct units
	Author: Sinbane
*/
//-----------------------------------
//-

if (SINside == "WEST") then {
	execVM "dialog\blufor\request_unit.sqf";
};
if (SINside == "EAST") then {
	execVM "dialog\opfor\request_unit.sqf";
};
if (SINside == "RESISTANCE") then {
	execVM "dialog\resistance\request_unit.sqf";
};