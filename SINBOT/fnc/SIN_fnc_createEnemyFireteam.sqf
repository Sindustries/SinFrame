
	_spawn = _this select 0;
	_position = _this select 1;
	_radius = _this select 2;
	
	_spawnpos = [_spawn,5,100,1,0,0.5,0] call BIS_fnc_findSafePos;
	
	if (SINenemy == "WEST") then {patrolgrp = createGroup WEST};
	if (SINenemy == "EAST") then {patrolgrp = createGroup EAST};
	if (SINenemy == "RESISTANCE") then {patrolgrp = createGroup RESISTANCE};
	
	for [{_i=0}, {_i<8}, {_i=_i+1}] do {
		_unit = selectRandom SIN_enemyUnits;
		_group = patrolgrp createUnit [_unit,_spawnpos, [], 0, "FORM"];
	};

	patrolgrp setCombatMode "RED";
	patrolgrp setBehaviour "AWARE";
	patrolgrp setFormation "STAG COLUMN";
	_wp0 = patrolgrp addWaypoint [_position, 50];
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointCompletionRadius 25;
	[patrolgrp, _position, _radius] call bis_fnc_taskPatrol;
	
	{[_x] call SIN_fnc_setSkill} forEach units patrolgrp;
	
	{_EHkilled = _x addEventHandler ["killed", {
		call SIN_fnc_onDeathEnemy;
	}];} forEach units patrolgrp;
	
	
	if (SINdebug == 1) then {systemChat "SINBOT: Enemy Fireteam Created"};