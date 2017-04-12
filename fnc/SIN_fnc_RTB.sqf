
	SIN_HQpilot sideChat "We are RTB";
	_wp2 = SIN_HQheligroup addWaypoint [SIN_HQhelipad, 0];
	_wp2 setWaypointType "MOVE";

	waitUntil {SIN_HQheli distance SIN_HQhelipad < 250 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};

		if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
			HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
			sleep 15;
		}; 

	SIN_HQheli land "LAND";

	waitUntil {(getpos SIN_HQheli select 2) < 1 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};
	
		if (getDammage SIN_HQheli > 0.7 or !alive SIN_HQpilot) exitWith {
			HQofficer sideChat "Menace 2-5 is too damaged to continue the mission";
			sleep 15;
		};
	
	SIN_HQheli engineOn false;
	SIN_HQheli setFuel 1;
	SIN_HQheli setDamage 0;
	SIN_HQheli setVehicleAmmoDef 1;

	SIN_HQheli_onMission = "false";
	publicVariable "SIN_HQheli_onMission";
	SIN_HQpilot sideChat "We are refuelled and rearmed. Awaiting new orders.";
