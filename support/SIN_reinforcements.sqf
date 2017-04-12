/*
	Field Reinforcements Support
	Author: Sinbane
*/
showChat true;
//-----------------------------------
//-CHECKS

if (player distance SINbasepos < 1000) exitWith {
	HQofficer sideChat "You are too close to HQ to request reinforcments!";
	sleep 5;
	_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
};

if (SIN_HQheli_onMission == "true") exitWith {
	HQofficer sideChat "Menace 2-5 is currently on a mission. Request again shortly.";
	sleep 5;
	_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
};

if (SINmoney < 35000) exitWith	{
	HQofficer sideChat "You cannot afford this ($35,000 required)";
	sleep 5;
	_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
};

SINmoney = SINmoney - 35000;
publicVariable "SINmoney";

SIN_HQheli_onMission = "true";
publicVariable "SIN_HQheli_onMission";

//-----------------------------------
//-VARIABLES

if (SINside == "WEST") then {
	SIN_support_soldier = "B_Soldier_F";
};
if (SINside == "EAST") then {
	SIN_support_soldier = "O_Soldier_F";
};
if (SINside == "RESISTANCE") then {
	SIN_support_soldier = "I_Soldier_F";
};

//-----------------------------------
//-GET POS

_dropzone = [(getPos player),0,80,8,0,0.4,0] call BIS_fnc_findSafePos;
sleep 0.1;
_helipad = createVehicle ["Land_HelipadEmpty_F", _dropzone, [], 0, "NONE"];

sleep 1;

SIN_HQpilot sideChat "Reinforcements are inbound";

//-----------------------------------
//-CREATE PARATROOPERS

_group = creategroup (side player);

for [{_i=0}, {_i<6}, {_i=_i+1}] do {	
	_soldier = _group createUnit [SIN_support_soldier,SINbasepos, [], 0, "FORM"];
	_soldier assignAsCargo SIN_HQheli;
	_soldier moveInCargo SIN_HQheli;
	_soldier disableAI "MOVE";
	sleep 1;
};

//-----------------------------------
//-MOVE HELI TO DROP ZONE

_wp = SIN_HQheligroup addWaypoint [[_dropzone select 0, (_dropzone select 1)-75], 0];
_wp setWaypointType "MOVE";
[SIN_HQheligroup, 1] setWaypointCombatMode "BLUE";

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
		deleteVehicle _helipad;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

waitUntil {SIN_HQheli distance _dropzone < 250};

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
		deleteVehicle _helipad;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

_smoke = createVehicle [SINsmoketype, _dropzone, [], 0, "NONE"];

//-----------------------------------
//LAND & EJECT REINFORCEMENTS

SIN_HQheli land "GET OUT";
waitUntil {(getpos SIN_HQheli select 2 < 2 && SIN_HQheli distance _dropzone < 250)};

//--HELICOPTER DAMAGE CHECK START--//
if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
	deleteVehicle _helipad;
	HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
	sleep 15;
	_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
}; 
//--HELICOPTER DAMAGE CHECK END--//

sleep 2;

{
	_x enableAI "MOVE";
	doGetOut _x;
	unassignVehicle _x;
	sleep 2;
	[_x] joinSilent (group player);
} forEach assignedCargo SIN_HQheli;

group player selectLeader player;

sleep 30;
deleteVehicle _helipad;

[] spawn SIN_fnc_RTB;

HQofficer sideChat "It will be some time until more reinforcements are ready";
sleep 300 + (random 300);
HQofficer sideChat "Paratroopers ready for deployment";
_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;

//-----------------------------------