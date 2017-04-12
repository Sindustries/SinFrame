/*
	Boat Transport Support
	Author: Sinbane
*/
showChat true;
//-----------------------------------
//-CHECK IF ENOUGH MONEY & NEAR DEEP WATER

_pos = (getPos player);

HQofficer sideChat "Understood, standby while we scan for drop location..";

abort_support = false;
pickupPosfound = false;
_timer = 0;
_monkeygroup = createGroup (side player);
monkey = _monkeygroup createUnit ["B_crew_F",SINbasepos, [], 0, "FORM"];
monkey hideobjectglobal true;

systemchat "Finding loc...";

while {!pickupPosfound} do {
	_pickupPos = [_pos,30,100,10,2,3,0] call BIS_fnc_findSafePos;
	sleep 0.1;
	monkey setPos _pickupPos;
	sleep 1;
	_depth = (_pos distance _pickupPos);
	if (SINdebug == 1) then {
		systemChat format ["Monkey Dist: %1",_depth];
	};
	if ((_pos distance _pickupPos) <= 40 && (_pos distance _pickupPos) >= 10) exitWith {
		pickupPosfound = true;
		pickupPos = _pickupPos;
	};
	if (_timer == 10) exitWith {
		abort_support = true;
	};
	_timer = _timer + 1;
};

systemchat "pickup found";

if (abort_support) exitWith {
	HQofficer sideChat "No suitable location found, aborting request";
	sleep 5;
	_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
};

systemchat "finding drop";

dropPosfound = false;
_timer = 0;

while {!dropPosfound} do {
	_dropPos = [pickupPos,50,300,10,2,80,0] call BIS_fnc_findSafePos;
	sleep 0.1;
	monkey setPos _dropPos;
	sleep 1;
	_depth = (getPosATL monkey select 2);
	if (SINdebug == 1) then {
		systemChat format ["Monkey Depth: %1",_depth];
	};
	if (_depth >= 30) exitWith {
		deleteVehicle monkey;
		dropPosfound = true;
		dropPos = _dropPos;
	};
	if (_timer == 30 && _depth < 30) exitWith {
		deleteVehicle monkey;
		abort_support = true;
	};
	_timer = _timer + 1;
};

if (abort_support) exitWith {
	HQofficer sideChat "No suitble location found, aborting request";
	sleep 5;
	_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
};

systemchat "drop found";

if (SINmoney < 5000) exitWith {
	["info",["You cannot afford this","($5,000 required)"]] call bis_fnc_showNotification;
	sleep 5;
	_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
};

SINmoney = SINmoney - 5000;
publicVariable "SINmoney";

SIN_HQheli_onMission = "true";
publicVariable "SIN_HQheli_onMission";

if (SINside == "WEST") then {
	SIN_boatType = "B_Boat_Transport_01_F";
	SIN_boatCrewType = "B_crew_F";
};
if (SINside == "EAST") then {
	SIN_boatType = "O_Boat_Transport_01_F";
	SIN_boatCrewType = "O_crew_F";
};
if (SINside == "RESISTANCE") then {
	SIN_boatType = "I_Boat_Transport_01_F";
	SIN_boatCrewType = "I_crew_F";
};

//-----------------------------------
//-CREATE THE BOAT & CREW & ATTACH TO HQ HELI

_marker = createMarker ["Pickup%1", pickupPos];
_marker setMarkerShape "ICON";
_marker setMarkerColor SINsidecolour;
_marker setMarkerType "hd_pickup";
_marker setMarkerSize [0.7,0.7];

_marker2 = createMarker ["Pddap%1", dropPos];
_marker2 setMarkerShape "ICON";
_marker2 setMarkerColor SINenemyColour;
_marker2 setMarkerType "hd_pickup";
_marker2 setMarkerSize [0.7,0.7];

SIN_boat = createVehicle [SIN_boatType, dropPos, [], 0, "NONE"];
SIN_boatCrew = createGroup (side player);
SIN_driver = SIN_boatCrew createUnit [SIN_boatCrewType,SINbasepos, [], 0, "FORM"];
SIN_driver assignAsDriver SIN_boat;
SIN_driver moveInDriver SIN_boat;
sleep 0.5;

SIN_HQheli setSlingLoad SIN_boat;
SIN_HQpilot sideChat "We have the transport, inbound to your location";

sleep 1;

//-----------------------------------
//-MOVE HELI TO DROP POINT

_wp = SIN_HQheligroup addWaypoint [[dropPos select 0, (dropPos select 1)], 0];
_wp setWaypointType "MOVE";
[SIN_HQheligroup, 0] setWaypointCombatMode "BLUE";
SIN_HQheli flyInHeight 50;

waitUntil {(SIN_HQheli distance dropPos) < 250 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
		deleteVehicle _drop;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

//-----------------------------------
//-DROP BOAT

waitUntil {(SIN_HQheli distance dropPos) < 150 && (speed SIN_HQheli) < 1 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};

SIN_boat allowDamage false;
SIN_driver allowDamage false;

	//--HELICOPTER DAMAGE CHECK START--//
	if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
		deleteVehicle _drop;
		HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
		sleep 15;
		_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
	}; 
	//--HELICOPTER DAMAGE CHECK END--//

_ropes = (ropes SIN_HQheli);
{ropeCut [_x, 5];
} forEach _ropes;

SIN_HQpilot sideChat "Transport away, RTB";

//-----------------------------------
//-HELI MISSION COMPLETE, RTB

[] spawn SIN_fnc_RTB;

//-----------------------------------
//-WAIT FOR PLAYER TO GET IN BOAT

sleep 10;

SIN_boat allowDamage true;
SIN_driver allowDamage true;

_wp2 = SIN_boatCrew addWaypoint [[pickupPos select 0, pickupPos select 1], 0];
_wp2 setWaypointType "MOVE";
[SIN_boatCrew, 1] setWaypointCombatMode "BLUE";

waitUntil {(SIN_boat distance pickupPos < 30)};

SIN_boat engineOn false;
SIN_driver sideChat "Ready for pick up!";

//-----------------------------------
//-PLAYER IN BOAT, WAIT FOR LOCATION

inVehCheck = true;
_checkTime = 0;
location_set = 0;

while {inVehCheck} do {
	//--BOAT DAMAGE CHECK START--//
	if (getDammage SIN_boat > 0.7 or !alive SIN_driver) exitWith {}; 
	//--BOAT DAMAGE CHECK END--//
	
	if (vehicle player == SIN_boat) then {
		SIN_boat addAction ["SET DESTINATION", {location_set = 1; inVehCheck = false}];
		waitUntil {vehicle player != SIN_boat || location_set > 0};
			removeAllActions SIN_boat;
	};
	if (_checkTime == 300) exitWith {location_set = 0};
	sleep 1;
	_checkTime = _checkTime + 1;	
};

removeAllActions SIN_boat;

//-----------------------------------
//-LOCATION SET, MOVE TO

if (location_set == 1) then {

	{_x assignAsCargo SIN_boat;
	} forEach units group player;
	
	_location = execVM "support\SIN_boatTransport_location.sqf";
	waitUntil {scriptDone _location};
	
	_wp2 = SIN_boatCrew addWaypoint [SIN_boatTransport_location, 0];
	_wp2 setWaypointType "MOVE";
	SIN_driver sideChat "Destination is set, moving out";
	_marker setMarkerPos SIN_boatTransport_location;

	waitUntil {SIN_boat distance SIN_boatTransport_location < 10 || getDammage SIN_boat > 0.7 || !alive SIN_driver};
	
		//--BOAT DAMAGE CHECK START--//
		if (getDammage SIN_boat > 0.7 || !alive SIN_driver) exitWith {
			HQofficer sideChat "Boat Transport is too damaged to continue the mission";
			sleep 15;
			_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
		}; 
		//--BOAT DAMAGE CHECK END--//


	waitUntil {(speed SIN_boat) < 1 || getDammage SIN_boat > 0.7 || !alive SIN_driver};
	
		//--BOAT DAMAGE CHECK START--//
		if (getDammage SIN_boat > 0.7 || !alive SIN_driver) exitWith {
			HQofficer sideChat "Boat Transport is too damaged to continue the mission";
			sleep 15;
			_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
		}; 
		//--BOAT DAMAGE CHECK END--//

	
	SIN_driver sideChat "This is as far as I can take you";
	
	{
		doGetOut _x;
		unassignVehicle _x;
	} forEach assignedCargo SIN_boat;
	
	deleteMarker _marker;
	SIN_boat lock true;	
	sleep 30;
		
	location_set = 0;
};

//-----------------------------------
//-PLAYER AT LOCATION, MOVE BOAT INTO OCEAN

if (location_set == 0) then {

	_wp2 = SIN_boatCrew addWaypoint [[0,0,0], 0];
	_wp2 setWaypointType "MOVE";

	sleep 600 + (random 300);
	deleteVehicle SIN_boat;
	deleteVehicle SIN_driver;

	HQofficer sideChat "Boat Transport is now available";
	sleep 15;
	_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
	
};

//-----------------------------------