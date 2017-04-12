/*
	REQUESTS MENU :: Get correct vehicles
	Author: Sinbane
*/
//-----------------------------------
//-

if (SINside == "WEST") then {
	execVM "dialog\blufor\request_vehicle.sqf";
};
if (SINside == "EAST") then {
	execVM "dialog\opfor\request_vehicle.sqf";
};
if (SINside == "RESISTANCE") then {
	execVM "dialog\resistance\request_vehicle.sqf";
};