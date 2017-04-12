	
	_group =_this select 0;

	_group setCombatMode "RED";
	_group setBehaviour "AWARE";
	_group setFormation "STAG COLUMN";
	
	if ((count SINside_controlledzones) > 0) then {
		{
			_wp0 = _group addWaypoint [(SINside_controlledzones select 0), 250];
			_wp0 setWaypointType "SAD";
			_wp0 setWaypointCompletionRadius 25;
			_wp0 setWaypointTimeout [1, 60, 120]; 
		}
		forEach SINenemy_controlledzones;
	} else {
			
		_wp2 = _group addWaypoint [SINbasepos, 150];
		_wp2 setWaypointType "SAD";
		_wp2 setWaypointCompletionRadius 25;
		_wp2 setWaypointTimeout [1, 60, 120]; 
	
	};