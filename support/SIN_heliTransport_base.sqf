/*
	Helicopter Transport Support
	Author: Sinbane
*/
showChat true;
//-----------------------------------
//-CHECKS

if (SIN_HQheli_onMission == "true") exitWith {
	HQofficer sideChat "Menace 2-5 is currently on a mission. Request again shortly.";
	sleep 5;
};

if (SINmoney < 5000) exitWith {
	HQofficer sideChat "You cannot afford this ($5,000 required)";
	sleep 5;
};

SINmoney = SINmoney - 5000;
publicVariable "SINmoney";

SIN_HQheli_onMission = "true";
publicVariable "SIN_HQheli_onMission";

//-----------------------------------
//-GET POS

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
		}; 
		//--HELICOPTER DAMAGE CHECK END--//	
	
	SIN_HQheli land "GET OUT";
	
	waitUntil {(getpos SIN_HQheli select 2) < 1 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};
	
		//--HELICOPTER DAMAGE CHECK START--//
		if (getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot) exitWith {
			deleteVehicle _helipad;
			HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
			sleep 15;
		}; 
		//--HELICOPTER DAMAGE CHECK END--//	
	
	SIN_HQpilot sideChat "Transport is wheels down";
	
	{
		doGetOut _x;
		unassignVehicle _x;
		sleep 1;
	} forEach assignedCargo SIN_HQheli;

	sleep 30;
	deleteVehicle _helipad;
	
	[] spawn SIN_fnc_RTB;
	
	waitUntil {SIN_HQheli_onMission == "false"};
	
	{
		doGetOut _x;
		unassignVehicle _x;
	} forEach assignedCargo SIN_HQheli;

//-----------------------------------