
	_group =_this select 0;

	_group setCombatMode "RED";
	_group setBehaviour "AWARE";
	_group setFormation "STAG COLUMN";
	
	if ((count SINenemy_controlledzones) > 0) then {

		_wp1 = _group addWaypoint [(SINenemy_controlledzones select 0), 250];
		_wp1 setWaypointType "SAD";
		_wp1 setWaypointCompletionRadius 25;
		_wp1 setWaypointTimeout [1, 60, 120]; 

	} else {
	
		_wp1 = _group addWaypoint [SINenemybasepos, 100];
		_wp1 setWaypointType "SAD";
		_wp1 setWaypointCompletionRadius 25;
		_wp1 setWaypointTimeout [1, 60, 120]; 
	
	};
	