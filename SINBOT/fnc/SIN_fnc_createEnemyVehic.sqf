
	_spawn = _this select 0;
	_position = _this select 1;
	_radius = _this select 2;
	
	_spawnpos = [_spawn,5,100,5,0,0.5,0] call BIS_fnc_findSafePos;
	
	if (SINenemy == "WEST") then {patrolgrp = createGroup WEST};
	if (SINenemy == "EAST") then {patrolgrp = createGroup EAST};
	if (SINenemy == "RESISTANCE") then {patrolgrp = createGroup RESISTANCE};
	
	_unit = selectRandom SIN_enemyVehic;
	_group = [_spawnpos,0,_unit,patrolgrp] call bis_fnc_spawnvehicle;

	patrolgrp setCombatMode "RED";
	patrolgrp setBehaviour "AWARE";
	_wp0 = patrolgrp addWaypoint [_position, 50];
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointCompletionRadius 25;
	[patrolgrp, _position, _radius] call bis_fnc_taskPatrol;
	
	{[_x] call SIN_fnc_setSkill} forEach units patrolgrp;
	
	{_EHkilled = _x addEventHandler ["killed", {
		call SIN_fnc_onDeathEnemy;
	}];} forEach units patrolgrp;
	
	
	if (SINdebug == 1) then {systemChat "SINBOT: Enemy Vehicle Created"};