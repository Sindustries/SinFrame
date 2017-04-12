/*
	Helicopter Transport Support
	Author: Sinbane
*/
//-----------------------------------
//-CHECKS

if (player distance SINbasepos < 1000) exitWith {
	HQofficer sideChat "You are too close to HQ to request transport!";
	sleep 5;
	_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
};

if (SIN_HQheli_onMission == "true") exitWith {
	HQofficer sideChat "Menace 2-5 is currently on a mission. Request again shortly.";
	sleep 5;
	_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
};

if (SINmoney < 10000) exitWith	{
	HQofficer sideChat "You cannot afford this ($10,000 required)";
	sleep 5;
	_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
};

SINmoney = SINmoney - 10000;
publicVariable "SINmoney";

SIN_HQheli_onMission = "true";
publicVariable "SIN_HQheli_onMission";
//-----------------------------------
//-VARIABLES



//-----------------------------------
//-GET POS

_pickuppos = [(getPos player),0,75,8,0,0.4,0] call BIS_fnc_findSafePos;
sleep 0.1;
_helipad = createVehicle ["Land_HelipadEmpty_F", _pickuppos, [], 0, "NONE"];

_marker = createMarker ["PickupLocation", _pickuppos];
_marker setMarkerShape "ICON";
_marker setMarkerColor SINsidecolour;
_marker setMarkerType "hd_pickup";
_marker setMarkerSize [0.7,0.7];

sleep 1;

SIN_HQpilot sideChat "Transport is inbound";

_wp = SIN_HQheligroup addWaypoint [[_pickuppos select 0, (_pickuppos select 1)-75], 0];
_wp setWaypointType "MOVE";
[SIN_HQheligroup, 1] setWaypointCombatMode "BLUE";

waitUntil {SIN_HQheli distance _pickuppos < 250 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot) exitWith {
		deleteVehicle _helipad;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

_smoke = createVehicle [SINsmoketype, _pickuppos, [], 0, "NONE"];

//-----------------------------------
//LAND & WAIT FOR PLAYER

SIN_HQheli land "GET IN";
waitUntil {(getpos SIN_HQheli select 2 < 1 && SIN_HQheli distance _pickuppos < 250) || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot) exitWith {
		deleteVehicle _helipad;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//


SIN_HQpilot sideChat "Transport is ready for pickup";

SIN_HQheli lock false;

inVehCheck = true;
_checkTime = 0;
location_set = 0;

while {inVehCheck} do {
	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {}; 
	//--HELICOPTER DAMAGE CHECK END--//
	
	if (vehicle player == SIN_HQheli) then {
		SIN_HQheli addAction ["RETURN TO BASE", {location_set = 1; inVehCheck = false}];
		SIN_HQheli addAction ["SET DESTINATION", {location_set = 2; inVehCheck = false}];
		waitUntil {vehicle player != SIN_HQheli || location_set > 0};
			removeAllActions SIN_HQheli;
	};
	if (_checkTime == 300) exitWith {location_set = 1};
	sleep 1;
	_checkTime = _checkTime + 1;	
};

{_x assignAsCargo SIN_HQheli;
} forEach units group player;

removeAllActions SIN_HQheli;
deleteMarker _marker;

if (location_set == 2) then {
	deleteVehicle _helipad;
	
	_location = execVM "support\SIN_heliTransport_location.sqf";
	waitUntil {scriptDone _location};
	_helipad = createVehicle ["Land_HelipadEmpty_F", SIN_heliTransport_location, [], 0, "NONE"];


	
	_wp2 = SIN_HQheligroup addWaypoint [SIN_heliTransport_location, 0];
	_wp2 setWaypointType "MOVE";
	SIN_HQpilot sideChat "Destination is set, moving out";

	waitUntil {SIN_HQheli distance SIN_heliTransport_location < 250 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};
	
		//--HELICOPTER DAMAGE CHECK START--//
		if (getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot) exitWith {
			deleteVehicle _helipad;
			HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
			sleep 15;
			_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
		}; 
		//--HELICOPTER DAMAGE CHECK END--//


	SIN_HQheli land "GET OUT";
	
	waitUntil {(getpos SIN_HQheli select 2) < 1 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};
	
		//--HELICOPTER DAMAGE CHECK START--//
		if (getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot) exitWith {
			deleteVehicle _helipad;
			HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
			sleep 15;
			_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
		}; 
		//--HELICOPTER DAMAGE CHECK END--//

	
	SIN_HQpilot sideChat "Transport is wheels down";
	
	{
		doGetOut _x;
		unassignVehicle _x;
	} forEach assignedCargo SIN_HQheli;

	sleep 30;
	
	location_set = 1;
	deleteVehicle _helipad;
};

if (location_set == 1) then {
		
	[] spawn SIN_fnc_RTB;
	
	waitUntil {SIN_HQheli_onMission == "false"};
		
	_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
};

//-----------------------------------