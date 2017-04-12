_group = _this select 0;
_name = _this select 1;

SINsquad_num = SINsquad_num + 1;

[_group,_name] spawn {
	_group = _this select 0;
	_name = _this select 1;

	_leader = leader _group;
	_markername = format["SINBOT%1",SINsquad_num];
	_markerstr = createMarker [str(_markername), getpos _leader];
	_markerstr setMarkerShape "ICON";
	str(_markername) setMarkerType "hd_dot";
	str(_markername) setMarkerColor SINsidecolour;
	str(_markername) setMarkerText _name;

		while {true} do {
			_units_alive = {alive _x} count units _group;
			if (_units_alive<=0) exitWith {
			str(_markername) setMarkerColor "ColorRed";
			str(_markername) setMarkerType "KIA";
			str(_markername) setMarkerText _name;
			HQofficer sidechat format["%1 has been KIA.",_name];
			sleep 600;
			deleteMarker str(_markername);
			};
			_leader = leader _group; 
			str(_markername) setMarkerPos getpos _leader; 
			sleep 4;
		};


};
