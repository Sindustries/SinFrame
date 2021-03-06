/*
	Vehicle Supply Drop Support
	Author: Sinbane
*/
showChat true;
//-----------------------------------
//-CHECK IF ENOUGH MONEY

if (SINmoney < 10000) exitWith {
	HQofficer sideChat "You cannot afford this ($10,000 required)";
	sleep 5;
	_support = [player,"SINcardrop"] call BIS_fnc_addCommMenuItem;
};

SINmoney = SINmoney - 10000;
publicVariable "SINmoney";

SIN_HQheli_onMission = "true";
publicVariable "SIN_HQheli_onMission";

if (SINside == "WEST") then {SIN_carType = "B_G_Offroad_01_F";};
if (SINside == "EAST") then {SIN_carType = "O_G_Offroad_01_F";};
if (SINside == "RESISTANCE") then {SIN_carType = "I_G_Offroad_01_F";};

//-----------------------------------
//-CREATE THE CAR & ATTACH TO HQ HELI

_cratePos = [(getPos SIN_HQHeli),8,30,8,0,0.4,0] call BIS_fnc_findSafePos;
sleep 0.5;
_dropPos = [(getPos player),0,250,4,0,1,0] call BIS_fnc_findSafePos;
sleep 0.5;

_drop = createVehicle [SIN_carType, _cratePos, [], 0, "NONE"];

SIN_HQheli setSlingLoad _drop;
SIN_HQpilot sideChat "Vehicle Supply Drop is inbound";

sleep 1;

//-----------------------------------
//-MOVE HELI TO DROP POINT

_wp = SIN_HQheligroup addWaypoint [[_dropPos select 0, (_dropPos select 1)], 0];
_wp setWaypointType "MOVE";
[SIN_HQheligroup, 1] setWaypointCombatMode "BLUE";
SIN_HQheli flyInHeight 150;

waitUntil {(SIN_HQheli distance _dropPos) < 250 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};
_smoke = createVehicle [SINsmoketype, _dropPos, [], 0, "NONE"];

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
		deleteVehicle _drop;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINcardrop"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

//-----------------------------------
//-DROP VEHICLE AND CREATE PARACHUTE

waitUntil {(SIN_HQheli distance _dropPos) < 300 && (speed SIN_HQheli) < 1 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
		deleteVehicle _drop;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINcardrop"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

_ropes = (ropes SIN_HQheli);
{
	ropeCut [_x, 5];
} forEach _ropes;

_parachute = createVehicle ["B_Parachute_02_F",[(getPos _drop) select 0, (getPos _drop) select 1, (getPos _drop) select 2], [], 0, "FLY"];
_drop attachTo [_parachute,[0,0,2]];	//-1.3

//-----------------------------------
//-MISSION COMPLETE, RTB

[] spawn SIN_fnc_RTB;

waitUntil {SIN_HQheli_onMission == "false"};

sleep 600 + (random 300);
_support = [player,"SINcardrop"] call BIS_fnc_addCommMenuItem;

//-----------------------------------