/*
	SINBOT Attack Wave Manager
	Author: Sinbane
	Controls attack waves
*/
if (SINdebug == 1) then {systemChat "---SINBOT: Enemy Attack Waves Online---"};
//-----------------------------------
//-VARIABLES

_safePos = [SINenemybasepos,5,100,5,0,0.5,0];

//-----------------------------------
//-SPAWN ATTACK WAVE

	waitUntil {SINzonescontrolled > 0};

	while {true} do {
	
		_findWave = execVM "SINBOT\SIN_getDefendWave.sqf";
		waitUntil {scriptDone _findWave};	
	
		if (SINBOT_enemytroopCount < SINBOT_enemytroopLimit) then {	
			SINBOT_enemy_spawn = _safePos call BIS_fnc_findSafePos;							
			_group = [SINBOT_enemy_spawn, (side enemyOfficer), SINBOT_cAttack_group] call BIS_fnc_spawnGroup;
			[_group] call SIN_fnc_WP_cAttack;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_enemytroopCount = SINBOT_enemytroopCount + (count units _group);
			SINBOT_troopCount = SINBOT_sidetroopCount + SINBOT_enemytroopCount;
			publicVariable "SINBOT_enemytroopCount";
			publicVariable "SINBOT_troopCount";
			
			{_EHkilled = _x addEventHandler ["killed", {
				SINBOT_enemytroopCount = SINBOT_enemytroopCount - 1;
				publicVariable "SINBOT_enemytroopCount";
				call SIN_fnc_onDeathEnemy;
			}];} forEach units _group;		

			SINBOT_cAttack_force pushBack _group;
		};
		
		if (SINBOT_vehicCount < SINvehicLimit) then {			
			SINBOT_enemy_spawn = _safePos call BIS_fnc_findSafePos;
			_group = createGroup (side enemyOfficer);
			_spawn = [SINBOT_enemy_spawn,0,SINBOT_cAttack_vehic,_group] call bis_fnc_spawnvehicle;		
			[_group] call SIN_fnc_WP_cAttack;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_vehicCount = SINBOT_vehicCount + 1;
			publicVariable "SINBOT_vehicCount";
			
			_EHkilled = (leader _group) addEventHandler ["killed", {
				SINBOT_vehicCount = SINBOT_vehicCount - 1;
				publicVariable "SINBOT_vehicCount";
				call SIN_fnc_onDeathEnemy;
			}];
			
			SINBOT_cAttack_force pushBack _group;
		};
			
		if (SINattackheli == 1 && SINenemy_forcepower >= 100 && SINenemy_forcepower < 400 && SINBOT_heliCount < SINheliLimit) then {
			SINBOT_enemy_spawn = _safePos call BIS_fnc_findSafePos;
			_group = createGroup (side enemyOfficer);
			_spawn = [SINBOT_enemy_spawn,0,SINBOT_cAttack_heli,_group] call bis_fnc_spawnvehicle;
			[_group] call SIN_fnc_WP_cAttack;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_heliCount = SINBOT_heliCount + 1;
			publicVariable "SINBOT_heliCount";
			
			_EHkilled = (leader _group) addEventHandler ["killed", {
			SINBOT_heliCount = SINBOT_heliCount - 1;
			publicVariable "SINBOT_heliCount";
			call SIN_fnc_onDeathEnemy;
			}];
			
			SINBOT_cAttack_force pushBack _group;
		};
		
		if (SINattackjet == 1 && SINenemy_forcepower >= 400 && SINBOT_jetCount < SINjetLimit) then {
			SINBOT_enemy_spawn = _safePos call BIS_fnc_findSafePos;
			_group = createGroup (side enemyOfficer);
			_spawn = [SINBOT_enemy_spawn,0,SINBOT_cAttack_jet,_group] call bis_fnc_spawnvehicle;
			[_group] call SIN_fnc_WP_cAttack;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_jetCount = SINBOT_jetCount + 1;
			publicVariable "SINBOT_jetCount";
			
			_EHkilled = (leader _group) addEventHandler ["killed", {
			SINBOT_jetCount = SINBOT_jetCount - 1;
			publicVariable "SINBOT_jetCount";
			call SIN_fnc_onDeathEnemy;
			}];
			
			SINBOT_cAttack_force pushBack _group;
		};
		sleep SINwaveDelay + (random SINwaveDelay);
	};

//-----------------------------------