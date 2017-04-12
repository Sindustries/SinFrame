/*
	HQ Helicopter Transport AddAction
	Author; Sinbane
	Adds transport action to HQ helicopter while it's at base and stationary
*/
waitUntil {support_helitransport_available};
if (SINdebug == 1) then {systemChat "SIN_heliTransport active"};
//-----------------------------------

	if (support_helitransport_available) then {
		chosen_placement = false;
		SIN_HQheli addAction ["REQUEST TRANSPORT ($5,000)", {SIN_HQheli lock false; SIN_HQpilot sideChat "Transport is ready for go, climb in and we'll get going"; removeAllActions SIN_HQheli;}];
		waitUntil {vehicle player == SIN_HQheli};
		if (player distance SIN_HQheli > 30) then {
			SIN_HQpilot sideChat "Transport standing down";
			SIN_HQheli lock true;
		};
		if (vehicle player == SIN_HQheli) then {
			SIN_HQheli addAction ["SELECT DESTINATION", {execVM "support\SIN_heliTransport_location.sqf"}];
			waitUntil {chosen_placement || vehicle player != SIN_HQheli};
			if (vehicle player != SIN_HQheli) then {
				SIN_HQpilot sideChat "Transport standing down";
				SIN_HQheli lock true;
			};
			if (chosen_placement) then {
				{_x assignAsCargo SIN_HQheli;
				} forEach units group player;				
				execVM "support\SIN_heliTransport_base.sqf";
			};
		};
	};

	waitUntil {vehicle player == SIN_HQheli || SIN_HQheli distance SIN_HQhelipad > 10 || getDammage SIN_HQheli > 0.7 || !alive SIN_HQpilot};
	
	removeAllActions SIN_HQheli;

//-----------------------------------