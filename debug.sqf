
	_marker = createMarker ["debugMarker", (getPos player)];
	_marker setMarkerShape "ICON";
	_marker setMarkerColor SINsidecolour;
	_marker setMarkerType hq_marker_type;
	_marker setMarkerSize [0.75,0.75];
	
	while {true} do {
		
		_name = [2] call compile preprocessFile "extra\SIN_getName.sqf";
		_marker setMarkerText _name;
		sleep 3;
		systemchat format["%1",_name];
	};