/*
	SINBOT Attack Wave Manager
	Author: Sinbane
	Controls attack waves
*/
if (SINdebug == 1) then {systemChat "---SINBOT: Friendly Attack Waves Online---"};
//-----------------------------------
//-VARIABLES

_safePos = [SINbasepos,5,100,5,0,0.5,0];

//-----------------------------------
//-SPAWN ATTACK WAVE

	sleep (random SINwaveDelay);

	while {true} do {
	
		_findWave = execVM "SINBOT\SIN_getAttackWave.sqf";
		waitUntil {scriptDone _findWave};
	
		if (SINBOT_sidetroopCount < SINBOT_sidetroopLimit) then {	
			SINBOT_hq_spawn = _safePos call BIS_fnc_findSafePos;							
			_group = [SINBOT_hq_spawn, (side player), SINBOT_attack_group] call BIS_fnc_spawnGroup;			
			_name = [1] call compile preprocessFile "extra\SIN_getName.sqf";	
			_TFname = format["TF: %1",_name];			
			[_group,_TFname] call SIN_fnc_pinmarker;
			[_group] call SIN_fnc_WP;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_sidetroopCount = SINBOT_sidetroopCount + (count units _group);
			SINBOT_troopCount = SINBOT_sidetroopCount + SINBOT_enemytroopCount;
			publicVariable "SINBOT_sidetroopCount";
			publicVariable "SINBOT_troopCount";
			
			{_EHkilled = _x addEventHandler ["killed", {
				SINBOT_sidetroopCount = SINBOT_sidetroopCount - 1;
				publicVariable "SINBOT_sidetroopCount";
				call SIN_fnc_onDeathFriendly;
			}];} forEach units _group;
			
			SINBOT_attack_force pushBack _group;
		};
		
		if (SINBOT_vehicCount < SINvehicLimit) then {
			SINBOT_hq_spawn = _safePos call BIS_fnc_findSafePos;							
			_group = [SINBOT_hq_spawn, (side player), SINBOT_attack_vehic] call BIS_fnc_spawnGroup;	
			_name = [2] call compile preprocessFile "extra\SIN_getName.sqf";	
			_TFname = format["VEH: %1",_name];			
			[_group,_TFname] call SIN_fnc_pinmarker;
			[_group] call SIN_fnc_WP;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_vehicCount = SINBOT_vehicCount + 1;
			publicVariable "SINBOT_vehicCount";
			
			_EHkilled = (leader _group) addEventHandler ["killed", {
				SINBOT_vehicCount = SINBOT_vehicCount - 1;
				publicVariable "SINBOT_vehicCount";
				call SIN_fnc_onDeathFriendly;
			}];

			SINBOT_attack_force pushBack _group;
		};
		
		if (SINattackheli == 1 && SINside_forcepower >= 100 && SINside_forcepower < 400 && SINBOT_heliCount < SINheliLimit) then {
			SINBOT_hq_spawn = _safePos call BIS_fnc_findSafePos;
			_name = [1] call compile preprocessFile "extra\SIN_getName.sqf";
			_TFname = format["CAS: %1 %2-%3",_name,floor(random 10),floor (random 99)];
			_group = createGroup (side player);
			_spawn = [SINBOT_hq_spawn,0,SINBOT_attack_heli,_group] call bis_fnc_spawnvehicle;
			[_group,_TFname] call SIN_fnc_pinmarker;
			[_group] call SIN_fnc_WP;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_heliCount = SINBOT_heliCount + 1;
			publicVariable "SINBOT_heliCount";
			
			_EHkilled = (leader _group) addEventHandler ["killed", {
			SINBOT_heliCount = SINBOT_heliCount - 1;
			publicVariable "SINBOT_heliCount";
			call SIN_fnc_onDeathFriendly;
			}];
			
			SINBOT_attack_force pushBack _group;
		};
		
		if (SINattackjet == 1 && SINside_forcepower >= 400 && SINBOT_jetCount < SINjetLimit) then {
			SINBOT_hq_spawn = _safePos call BIS_fnc_findSafePos;
			_name = [1] call compile preprocessFile "extra\SIN_getName.sqf";
			_TFname = format["CAS: %1 %2-%3",_name,floor(random 10),floor (random 99)];
			_group = createGroup (side player);
			_spawn = [SINBOT_hq_spawn,0,SINBOT_attack_jet,_group] call bis_fnc_spawnvehicle;
			[_group,_TFname] call SIN_fnc_pinmarker;
			[_group] call SIN_fnc_WP;
			{[_x] call SIN_fnc_setSkill} forEach units _group;
			
			SINBOT_jetCount = SINBOT_jetCount + 1;
			publicVariable "SINBOT_jetCount";
			
			_EHkilled = (leader _group) addEventHandler ["killed", {
			SINBOT_jetCount = SINBOT_jetCount - 1;
			publicVariable "SINBOT_jetCount";
			call SIN_fnc_onDeathFriendly;
			}];	
			
			SINBOT_attack_force pushBack _group;
		};
		
		sleep SINwaveDelay + (random SINwaveDelay);
	};

//-----------------------------------